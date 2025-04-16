using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class E_brid : E_base
{

    public float HeightOfPlayer = 5f;
    public int atk1_count = 2;
    public float atk2_change = 50;
    public int atk3_count = 2;

    private bool isclose = false;
    private Vector3 chase_posi;
    private float Current_Height;
    private bool Flying = true;
    private int atk1_countTimes = 0;
    private int atk3_countTimes = 0;
    private float Original_atk_distance;
    private bool gotosky = false;
    private GameObject chongci_obj;


    // Start is called before the first frame update
    protected override void Start()
    {
        base.Start();
        Current_Height = HeightOfPlayer;
        Original_atk_distance = e_value.attack_distance;
    }

    protected override void Update()
    {
        base.Update();
        if (isDie)
        {
            if (!C_ctr.enabled)
                C_ctr.enabled = true;
            playerVelocity.y += (gravityValue * Time.deltaTime) * 0.2f;
            C_ctr.Move(playerVelocity * Time.deltaTime);
        }
        if (gotosky)
        {
            Vector3 targetPosition = transform.position;
            targetPosition.y = _target.position.y + HeightOfPlayer;

            // 移动到目标高度
            transform.position = Vector3.MoveTowards(transform.position, targetPosition, Time.deltaTime * e_value.move_speed);

            // 判断是否到达目标高度
            if(transform.position.y >= targetPosition.y)
            {
                gotosky = false;
                Flying = true;
                atk3_countTimes = 0;
                e_value.attack_distance = Original_atk_distance;
            }
            return;
        }
        if (isclose)
        {

            // 移动物体到与_target相同的高度和位置
            Vector3 targetFullPosition = chase_posi;
            transform.position = Vector3.MoveTowards(transform.position, targetFullPosition, e_value.move_speed * Time.deltaTime * 2);

            // 到达目标位置后停止移动（防止抖动）
            if (Vector3.Distance(transform.position, targetFullPosition) < 0.1f)
            {
                Vector3 lookAtPos = new Vector3(_target.position.x, transform.position.y, _target.position.z);
                transform.LookAt(lookAtPos);
                if(chongci_obj)
                    Destroy(chongci_obj);
                // 先播放bite效果
                GameObject FB = (GameObject)Resources.Load("Particle/dafeng/bite");
                Vector3 posi = transform.position;
                GameObject go = GameObject.Instantiate(FB, posi, transform.rotation);
                go.transform.position = go.transform.position + go.transform.forward * 1f;
                //go.transform.position = go.transform.position + go.transform.up * 0.8f;
                Player_skill_class ss = new Player_skill_class();
                go.GetComponent<bite_sc>().Init(e_value, ss);

                isclose = false;  // 可根据需要重置 isclose
                Flying = false;
                Current_Height = transform.position.y;
                StartCoroutine(delay_change_state(e_value.attack_speed));
                _anim.change_anim(Anim_state.Idle);
                e_value.attack_distance = e_value.attack_distance * 1.5f;
            }
        }


    }

    public override void Attack_function()
    {
        if (gotosky)
            return;
        // 1. 计算目标的期望位置，保持固定高度差
        Vector3 targetPosition = new Vector3(
            _target.position.x,
            _target.position.y + Current_Height,
            _target.position.z
        );

        // 2. 朝向目标（保持敌人的 Y 轴不变）
        Vector3 lookAtPos = new Vector3(_target.position.x, transform.position.y, _target.position.z);
        transform.LookAt(lookAtPos);

        // 3. 计算水平方向的距离（忽略高度差）
        float horizontalDistance = Vector3.Distance(
            new Vector3(transform.position.x, 0, transform.position.z),
            new Vector3(_target.position.x, 0, _target.position.z)
        );



        // 4. 判断攻击距离（只看水平方向）
        if (horizontalDistance <= e_value.attack_distance)
        {
            // 到达攻击距离，执行攻击逻辑
            isAttack = true;
            if (Flying)
            {
                float result = Random.Range(1, 101);
                if (result < atk2_change && atk1_countTimes >= atk1_count)
                {
                    Atk2();
                    atk1_countTimes = 0;
                }
                else
                    Atk1();
            }
            else
            {
                // 低空攻击
                Atk3();
            }


        }
        else
        {
            if(Flying)
            {
                Vector3 moveDirection = (targetPosition - transform.position).normalized;
                Vector3 move = moveDirection * e_value.move_speed * Time.fixedDeltaTime;
                C_ctr.Move(move);
                _anim.change_anim(Anim_state.Run);
            }else
            {
                // 计算水平方向的移动方向（忽略Y轴）
                Vector3 moveDirection = new Vector3(
                    targetPosition.x - transform.position.x,
                    0, // 忽略Y轴
                    targetPosition.z - transform.position.z
                ).normalized;

                // 计算移动向量
                Vector3 move = moveDirection * e_value.move_speed * Time.fixedDeltaTime;

                // 仅在X-Z平面移动
                C_ctr.Move(new Vector3(move.x, 0, move.z));
                _anim.change_anim(Anim_state.Walk);
            }

                
        }
    }

    void Atk3()
    {
        if (gotosky || Flying || atk3_countTimes >= atk3_count)
            return;
        _anim.change_anim(Anim_state.Attack3);
        StartCoroutine(delay_Active_attack3(1.7f));
        GameObject FB = (GameObject)Resources.Load("Particle/dafeng/ks_M");
        Vector3 posi = transform.position + transform.forward * 0.5f;
        GameObject go = GameObject.Instantiate(FB, posi, transform.rotation);

    }
    IEnumerator delay_Active_attack3(float time)
    {
        yield return new WaitForSeconds(time);
        Vector3 lookAtPos = new Vector3(_target.position.x, transform.position.y, _target.position.z);
        transform.LookAt(lookAtPos);
        // 播放爆点
        GameObject FB = (GameObject)Resources.Load("Particle/dafeng/baodian_M");
        Vector3 posi = transform.position + transform.forward * 0.5f;
        GameObject go = GameObject.Instantiate(FB, posi, transform.rotation);
        // 生成子弹
        FB = (GameObject)Resources.Load("Particle/dafeng/bullet");
        go = GameObject.Instantiate(FB, transform.position, transform.rotation);
        Player_skill_class ss = new Player_skill_class();
        go.GetComponent<dafeng_bullet>().Init(e_value, ss, _target.position, Flying);
        _anim.change_anim(Anim_state.Idle);
        atk3_countTimes++;
        StartCoroutine(delay_change_state(e_value.attack_speed));
        if (atk3_countTimes >= atk3_count)
            StartCoroutine(delay_gotosky(1f));
    }

    void Atk2()
    {
        _anim.change_anim(Anim_state.Attack2);
        StartCoroutine(delay_Active_attack2(1.35f));
    }

    IEnumerator delay_Active_attack2(float time)
    {
        yield return new WaitForSeconds(time);
        isclose = true;
        Vector3 directionToTarget = (_target.position - transform.position).normalized;
        // 计算 chase_posi，使其位于 target 前方 1 的位置
        chase_posi = _target.position - directionToTarget * 1.5f;

        GameObject FB = (GameObject)Resources.Load("Particle/dafeng/chongci");
        Vector3 posi = transform.position;
        chongci_obj = GameObject.Instantiate(FB, posi, transform.rotation , transform);
        chongci_obj.transform.LookAt(_target.position);
    }

    void Atk1()
    {
        _anim.change_anim(Anim_state.Attack1);
        StartCoroutine(delay_Active_attack(1.7f));
        StartCoroutine(delay_change_state(e_value.attack_speed));
        GameObject FB = (GameObject)Resources.Load("Particle/dafeng/ks_M");
        Vector3 posi = transform.position + transform.forward * 0.7f;
        posi.y -= 0.5f;
        GameObject go = GameObject.Instantiate(FB, posi, transform.rotation);

    }


    protected override IEnumerator delay_Active_attack(float time)
    {
        yield return new WaitForSeconds(time);
        Vector3 lookAtPos = new Vector3(_target.position.x, transform.position.y, _target.position.z);
        transform.LookAt(lookAtPos);
        // 播放爆点
        GameObject FB = (GameObject)Resources.Load("Particle/dafeng/baodian_M");
        Vector3 posi = transform.position + transform.forward * 0.7f;
        posi.y -= 0.5f;
        GameObject go = GameObject.Instantiate(FB, posi, transform.rotation);
        // 生成子弹
        FB = (GameObject)Resources.Load("Particle/dafeng/bullet");
        go = GameObject.Instantiate(FB, transform.position, transform.rotation);
        Player_skill_class ss = new Player_skill_class();
        go.GetComponent<dafeng_bullet>().Init(e_value, ss, _target.position, Flying);
        _anim.change_anim(Anim_state.Idle);
        atk1_countTimes++;

    }


    IEnumerator delay_gotosky(float time)
    {
        yield return new WaitForSeconds(time);
        gotosky = true;
        Current_Height = HeightOfPlayer;
    }

}
