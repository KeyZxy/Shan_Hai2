﻿using System.Collections;
using System.Collections.Generic;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UIElements;
using static UnityEngine.GraphicsBuffer;

public class xiaopaozhang_sc : MonoBehaviour
{

    public GameObject lantern_model;
    public GameObject _xuli;
    public GameObject _launch;
    public GameObject _huoqiu;
    public GameObject _hit;



    private Transform _lantern_tr;
    private Animator _anim;
    private CharacterController _lantern_ctr;
    private C_attribute _attr;
    private upgrade_info _skill_info;
    private Transform _target;
    private bool isStart = false;
    private float follow_distance = 1.5f;
    private bool isFollowing = false;  // 是否在跟随中
    private float stop_distance = 8f;  // 停止的距离缓冲区
    private float minSpeed = 10f;
    private float move_speed = 5f;
    private float _atk_distance;
    private GameObject _dandao = null;
    private int current_state = 0;




    // Start is called before the first frame update
    void Start()
    {
        Vector3 posi = new Vector3(_target.position.x+1, _target.position.y + 2f, _target.position.z+1);
        _lantern_tr = Instantiate(lantern_model , posi, transform.rotation).transform;
        _lantern_ctr = _lantern_tr.GetComponent<CharacterController>();
        _anim = _lantern_tr.Find("body").GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        if (isStart)
        {
            transform.position = _target.position;
            FollowCharacter();

        }

    }


    void FollowCharacter()
    {
        // 计算水平距离（忽略 Y）
        Vector3 flatSelf = new Vector3(transform.position.x, 0, transform.position.z);
        Vector3 flatTarget = new Vector3(_lantern_tr.position.x, 0, _lantern_tr.position.z);
        float distance = Vector3.Distance(flatSelf, flatTarget);

        // 判断是否需要跟随
        if (distance > follow_distance)
        {
            isFollowing = true;
        }
        else if (distance < stop_distance)
        {
            isFollowing = false;
        }

        if (isFollowing)
        {
            // 目标位置（主角位置 + Y轴偏移）
            Vector3 targetPosition = new Vector3(_target.position.x, _target.position.y + 2f, _target.position.z);

            // 平滑朝向
            Vector3 lookDir = (targetPosition - _lantern_tr.position).normalized;
            lookDir.y = 0; // 忽略Y方向
            if (lookDir != Vector3.zero)
            {
                Quaternion targetRot = Quaternion.LookRotation(lookDir);
                _lantern_tr.rotation = Quaternion.Slerp(_lantern_tr.rotation, targetRot, Time.deltaTime * 5f);
            }

            // 平滑移动速度
            float speed = Mathf.Lerp(minSpeed, move_speed, (distance - stop_distance) / (follow_distance - stop_distance));

            // 平滑位置
            Vector3 moveDirection = (targetPosition - _lantern_tr.position).normalized;
            _lantern_ctr.Move(moveDirection * speed * Time.deltaTime);
        }
    }


    public void Init(C_attribute attr, upgrade_info skill_info, Transform tr)
    {
        _target = tr;
        _attr = attr;
        _skill_info = skill_info;
        _atk_distance = attr.Get_attack_distance();
        isStart = true;
        StartCoroutine(Loop_Atk());


    }

    private IEnumerator Loop_Atk()
    {
        while (isStart)
        {
            // 重新计算冷却时间
            float interval_time = _skill_info.type_skill.CD - _attr.Get_cool_down();
            yield return new WaitForSeconds(interval_time); // 等待冷却时间

            int count = _skill_info.type_skill.count + _attr.Get_atk_count();
            for (int i = 0; i < count; i++)
            {
                GameObject[] enemys = GameObject.FindGameObjectsWithTag(SaveKey.Enemy);
                List<GameObject> validEnemies = new List<GameObject>();

                foreach (GameObject enemy in enemys)
                {
                    float distance = Vector3.Distance(transform.position, enemy.transform.position);
                    if (distance <= _atk_distance)
                    {
                        Vector3 origin = transform.position + Vector3.up * 1.2f;
                        Vector3 target = enemy.transform.position + Vector3.up * 0.5f;

                        Vector3 direction = (target - origin).normalized;

                        Debug.DrawLine(origin, target, Color.red, 1f); // 调试射线

                        if (Physics.Raycast(origin, direction, out RaycastHit hit, distance))
                        {
                            Debug.Log("命中的物体: " + hit.collider.name); // 输出射线命中的目标名称

                            if (hit.collider.gameObject == enemy)
                            {
                                validEnemies.Add(enemy);
                            }
                        }
                    }
                }

                if (validEnemies.Count > 0)
                {
                    GameObject targetEnemy = validEnemies[Random.Range(0, validEnemies.Count)];
                    StartCoroutine(Attack_function(targetEnemy));
                }

                yield return new WaitForSeconds(0.2f); // 每次攻击间隔 0.2 秒
            }
            yield return new WaitForSeconds(1f);
            change_anim(0);
        }
    }

    private IEnumerator Attack_function(GameObject Tg)
    {
        change_anim(1);
        // 先播放蓄力效果
        GameObject xuli_FB = Instantiate(_xuli);
        xuli_FB.transform.parent = _lantern_tr;
        Vector3 forwardPosition = _lantern_tr.position + _lantern_tr.forward * 0.3f;
        xuli_FB.transform.position = forwardPosition; 
        AudioManager.instance.PlayFX("火球扔");
        StartCoroutine(delay_destory(1.08f, xuli_FB));
        yield return new WaitForSeconds(1.10f);

        // 播放发射效果
       
        GameObject launch_FB = Instantiate(_launch);
        launch_FB.transform.parent = _lantern_tr;
        forwardPosition = _lantern_tr.position + _lantern_tr.forward * 0.3f;
        launch_FB.transform.position = forwardPosition;
        StartCoroutine(delay_destory(0.10f, launch_FB));
        yield return new WaitForSeconds(0.10f);

        // 播放弹道效果
        _dandao = Instantiate(_huoqiu);
        forwardPosition = _lantern_tr.position + _lantern_tr.forward * 0.3f;
        _dandao.transform.position = forwardPosition;
        
        if (Tg == null)
            yield return null;
        _dandao.GetComponent<xiaopaozhang_dandao_sc>().Init(_target, _skill_info.type_skill, Tg.transform, _hit);

    }

    void change_anim(int state)
    {
        if (current_state == state)
            return;
        switch (state)
        {
            case 0:
                _anim.SetInteger("state", 0);
                break;
            case 1:
                _anim.SetInteger("state", 1);
                break;
        }
        current_state = state;
    }

    IEnumerator delay_destory(float time, GameObject FB)
    {
        yield return new WaitForSeconds(time);
        Destroy(FB);
    }

    private void OnDestroy()
    {
        if(_lantern_tr)
        {
            Destroy(_lantern_tr.gameObject);
            _lantern_tr = null;
        }

    }

}
