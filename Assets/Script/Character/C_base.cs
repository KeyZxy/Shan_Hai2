﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using Unity.VisualScripting;
using Unity.VisualScripting.Antlr3.Runtime;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using static UnityEngine.EventSystems.EventTrigger;

public class C_base : MonoBehaviour
{
    public LayerMask enemyLayer; // 敌人层
    public List<Player_skill_class> skill_class = new List<Player_skill_class>();
    //public bool canFly;

    // 声明主角死亡事件（静态事件，全局广播）
    public static event Action OnPlayerDeath;
    // 定义角色受伤事件，传递伤害值
    public static event Action<int> OnPlayerTakeDamage;

    private CharacterController _ctr;
    private Transform _cam;
    private C_attribute _attr;
    private Transform _target;
    private C_anim _anim;
    private C_Pick_up_sc _pickup;
    private Target_lock_sc _Lock_Sc;
    private ParticleSystem _chongci;

    private bool isDie = false;
    private bool isStop = false;
    private bool sprint = false;
    private bool Jumping = false;
    private float move_x;
    private float move_y;
    private bool Key_move_click = false;
    private Vector3 playerVelocity;
    private float gravityValue = -50f;
    //private bool stamina_enpty = false;
    //private bool isFlying = false;
    private bool Free_view = true;
    private float maxDistanceFromCenter = 200.0f; // 最大允许的距离，超出此距离的敌人不检测.UI上的距离
    private bool Target_lock = false;
    private bool CD_atk = false;
    private bool Attacking = false;
    private bool isPaused = false;
    private GameObject Temp_jiguangbo_obj;
    private GameObject Temp_huongjue_obj;
    private GameObject Temp_miaozhun_obj;
    private bool jiguangbo_ready = false;
    private bool huongJue_ready = false;
    private GameObject Temp_shuihuan_obj;
    private float skill_move_speed = 2f;
    public bool skill_1_cd = false;
    public bool skill_2_cd = false;
    private float original_move_speed;

    // 定义音效数组
    string[] footstepSounds = { "脚步1", "脚步2", "脚步3", "脚步4", "脚步5", "脚步6" };
    string[] footstepShiban = { "石板脚步1", "石板脚步2", "石板脚步3", "石板脚步4" };
    Vector3 previousPosition; // 保持上一个位置  
    Vector3 currentPosition;  // 当前的位置  

    bool hasPlayedStepOnBridge = false; //是否播放过上桥音效
    string lastSurface = "";            //记录上一次地面类型
    // Start is called before the first frame update


    void Start()
    {

        // 隐藏鼠标指针
        Cursor.visible = false;
        // 锁定鼠标指针到游戏窗口中央
        Cursor.lockState = CursorLockMode.Locked;
        //// 锁定分辨率
        //Screen.SetResolution(1920, 1080, FullScreenMode.Windowed);

        _anim = transform.GetComponent<C_anim>();
        _ctr = transform.GetComponent<CharacterController>();
        _cam = GameObject.Find("Main Camera").transform;
        _attr = transform.gameObject.GetComponent<C_attribute>();
        _pickup = transform.GetComponent<C_Pick_up_sc>();
        _Lock_Sc = GameObject.Find("target_lock").GetComponent<Target_lock_sc>();
        _chongci = transform.Find("ci_effect").GetComponent<ParticleSystem>();
        _chongci.Stop();
        AudioManager.instance.PlayBGM("背景");
        // 只在Level 1中播放风声  
        if (SceneManager.GetActiveScene().name == "Level1_1 1") 
        {
            AudioManager.instance.PlayFX("风声");
        }
        previousPosition = transform.position; // 初始化 previousPosition  
        currentPosition = transform.position;  // 初始化 currentPosition  
    }

    // Update is called once per frame
    void Update()
    {
        //if (Input.GetKeyDown(KeyCode.Equals))
        //{
        //    if (AudioManager.instance.IsPlaying("背景") || AudioManager.instance.IsPlaying("战斗"))
        //    {
        //        AudioManager.instance.Stop("背景");
        //        AudioManager.instance.Stop("战斗");
        //    }
        //    if (!AudioManager.instance.IsPlaying("背景") || !AudioManager.instance.IsPlaying("战斗"))
        //    {
        //        AudioManager.instance.PlayWaterBGM("背景");
        //        AudioManager.instance.PlayWaterBGM("战斗");
        //    }
        //}
        if (isDie || isPaused) return;

        Key_Check();

        if (!isStop && !sprint)
            Key_Control_Move();

        Find_enemy();

        currentPosition = transform.position;

        if (!Jumping && Key_move_click)
        {
            if (huongJue_ready || jiguangbo_ready)
                return;

            RaycastHit hit;
            if (Physics.Raycast(transform.position, Vector3.down, out hit, 1.5f))
            {
                bool onWood = hit.collider.CompareTag("Wood");
                bool onStairs = hit.collider.CompareTag("Stairs");

                string currentSurface = onWood ? "Wood" : onStairs ? "Stairs" : "Other";
                float moveDistance = (currentPosition - previousPosition).sqrMagnitude;

                //  第一次从非桥面走到桥面（Wood or Stairs）时触发音效
                if (!hasPlayedStepOnBridge && (onWood || onStairs) && lastSurface != currentSurface)
                {
                    AudioManager.instance.PlayFX("风声");  
                    hasPlayedStepOnBridge = true;
                }

                lastSurface = currentSurface; //  更新表面类型
                    if (moveDistance > 3.2f)
                    {
                        if (onStairs)
                        {
                            int index = UnityEngine.Random.Range(0, footstepShiban.Length);
                            AudioManager.instance.PlayFX(footstepShiban[index]);
                        }
                        else if (onWood)
                    {
                        AudioManager.instance.PlayFX("木板脚步");
                    }
                        else
                        {
                            int index = UnityEngine.Random.Range(0, footstepSounds.Length);
                            AudioManager.instance.PlayFX(footstepSounds[index]);
                        }

                        previousPosition = currentPosition;
                    }
                }
            }
        }
       
    

    void FixedUpdate()
    {
        Gravity();
        if (Jumping)
        {
            RaycastHit hit;
            if (Physics.Raycast(transform.position, Vector3.down, out hit, 0.4f))
            {
                Jumping = false;
            }
        }
    }

    // 找到距离摄像机中心最近的敌人
    Transform GetClosestEnemyToCenter(Collider[] enemies)
    {
        Transform closestEnemy = null;
        float minDistanceToCenter = Mathf.Infinity;
        Vector3 screenCenter = new Vector3(Screen.width / 2, Screen.height / 2, 0);

        foreach (var enemy in enemies)
        {
            // 将敌人的世界坐标转换为屏幕坐标
            Vector3 enemyScreenPos = Camera.main.WorldToScreenPoint(enemy.transform.position);

            // 检查敌人是否在摄像机的视锥体内，并且没有超出最大允许距离
            if (enemyScreenPos.z > 0)
            {
                // 计算敌人与屏幕中心的距离
                float distanceToCenter = Vector2.Distance(new Vector2(enemyScreenPos.x, enemyScreenPos.y), new Vector2(screenCenter.x, screenCenter.y));

                // 检查敌人是否在允许的距离范围内
                if (distanceToCenter <= maxDistanceFromCenter)
                {
                    // 如果敌人距离更近，则更新最接近的敌人
                    if (distanceToCenter < minDistanceToCenter)
                    {
                        minDistanceToCenter = distanceToCenter;
                        closestEnemy = enemy.transform;
                    }
                }
            }
        }

        return closestEnemy;
    }

    // 移动函数
    void Key_Control_Move()
    {
        if (Free_view)
        {
            Free_view_move();

        }
        else
        {
            //if(!Target_lock )
            //    Ray_select_target();
            Fixed_view_move();
        }
        
    }


    // 固定视角，让角色跟随摄像机转动
    void Fixed_view_move()
    {
        // 让角色跟随摄像机的旋转
        // 固定视角，让角色跟随摄像机转动
        float y = _cam.rotation.eulerAngles.y;  // 获取摄像机的Y轴旋转角度
        float rotationOffset = 8f;  // 偏移角度
        transform.rotation = Quaternion.Euler(0, y + rotationOffset, 0);  // 设置角色的Y轴旋转与摄像机一致，并增加偏移

        if (Key_move_click)
        {
            float h = move_x; // 获取水平输入
            float v = move_y; // 获取垂直输入

            if (h != 0 || v != 0)
            {
                // 创建目标方向向量
                Vector3 moveDirection = new Vector3(h, 0, v).normalized;

                // 使用角色当前的前向方向移动
                Vector3 moveVector = transform.forward * moveDirection.z + transform.right * moveDirection.x;

                // 移动角色
                if (Temp_jiguangbo_obj)
                {
                    _ctr.Move(moveVector * _attr.Get_move_speed() * Time.deltaTime);
                }else
                {
                    _ctr.Move(moveVector * skill_move_speed * Time.deltaTime);
                }
                
                
                // 切换动画状态为运行
                _anim.change_anim(Anim_state.Walk);



            }
        }
        else
        {
            // 如果没有移动输入，切换动画状态为闲置
            if (!Anim_lock())
                _anim.change_anim(Anim_state.Idle);
        }
    }

    // 自由视角移动
    void Free_view_move()
    {
        //设置角色的面向位置
        // 自由视角,角色跟摄像机自由
        if (Key_move_click)
        {
            float h = move_x;
            float v = move_y;
            if (h != 0 || v != 0)
            {
                Vector3 targetDirection = new Vector3(h, 0, v);
                float y = _cam.rotation.eulerAngles.y;
                targetDirection = Quaternion.Euler(0, y, 0) * targetDirection;
                transform.rotation = Quaternion.LookRotation(targetDirection);
                if(!Anim_lock())
                    _anim.change_anim(Anim_state.Run);
                _ctr.Move(transform.forward * _attr.Get_move_speed() * Time.deltaTime);
            }
        }
        else
        {
            if (!Anim_lock())
                _anim.change_anim(Anim_state.Idle);
        }
    }

    // 重力函数
    void Gravity()
    {
        // 手动地面检测
        bool isGrounded = _ctr.isGrounded;
        if (!isGrounded)
        {
            RaycastHit hit;

            if (Physics.Raycast(transform.position, Vector3.down, out hit, 0.2f))
            {
                isGrounded = true;
            }
        }
        // 如果角色在地面上且未跳跃，重置Y轴速度为0，防止重力累积
        if (isGrounded)
        {
            if (playerVelocity.y < 0)
            {
                playerVelocity.y = 0f;
            }
        }
        // 如果角色不在地面上，继续累加重力
        playerVelocity.y += gravityValue * Time.fixedDeltaTime;
        _ctr.Move(playerVelocity * Time.fixedDeltaTime);
    }


    void Normal_atk()
    {
        // 如果已经在攻击冷却中，直接返回
        if (CD_atk)
            return;
        if (_target == null)
            return;
        Attacking = true;
        Fu_start();
        for (int i = 0; i < skill_class[0].count + _attr.Get_atk_count(); i++)
        {
            Fu(_target);
        }


        // 进入冷却状态
        CD_atk = true;
        float cd_time = skill_class[0].CD - _attr.Get_attack_speed();
        StartCoroutine(delay_change_CD(cd_time , 0));
        StartCoroutine(delay_change_CD(0.35f, 3));

    }


    void Fu_start()
    {
        _anim.change_anim(Anim_state.Attack1);
        // 生成开始特效
        Vector3 posi = transform.position + transform.forward * 1f + transform.up * 1f;
        
        AudioManager.instance.PlayFX("轨迹");
        
        GameObject fbStart = ResourceManager.Instance.GetResource<GameObject>("Particle/Fu/start");
        if (fbStart != null)
        {
            GameObject.Instantiate(fbStart, posi, transform.localRotation);
        }
    }
    void Fu(Transform target)
    {

        // 生成攻击物体并初始化目标
        Vector3 posi = transform.position + transform.forward * 1f + transform.up * 1f;
        GameObject fu = ResourceManager.Instance.GetResource<GameObject>("Particle/Fu/Fu");
        if (fu != null)
        {
            GameObject go = GameObject.Instantiate(fu, posi, transform.localRotation);
            go.GetComponent<Fu_sc>().Init(target.gameObject, transform , skill_class[0]); // 将目标传递给攻击物体
            
        }
        
    }

    void jiguangbo_start()
    {
        if (jiguangbo_ready)
            return;
        _anim.change_anim(Anim_state.Ready);
        Free_view = false;
        jiguangbo_ready = true;
        original_move_speed = _attr.c_Value.move_speed;
        _attr.Set_move_speed(_attr.c_Value.move_speed / 2);
        _cam.GetComponent<Camera_move>().Act_second_view(true);
    }
    void huongjue_start()
    {
        if (huongJue_ready)
            return;
        _anim.change_anim(Anim_state.Ready);
        huongJue_ready = true;
        Free_view = false;
        _cam.GetComponent<Camera_move>().Act_second_view(true);
        GameObject miaozhun_FB = ResourceManager.Instance.GetResource<GameObject>("Particle/mianzhun2/miaozhunqiu_M");
        Vector3 posi = transform.position + transform.forward * 10f;
        Temp_miaozhun_obj = GameObject.Instantiate(miaozhun_FB, posi, miaozhun_FB.transform.rotation);
        Temp_miaozhun_obj.GetComponent<miaozhun_qiu_sc>().Init(transform , skill_class[2]);
    }
    void jiguangbo()
    {
        //    Free_view = false;
        //_attr.Stop_move(true);
        skill_1_cd = true;
        Attacking = true;
        GameObject jiguangbo = ResourceManager.Instance.GetResource<GameObject>("Particle/jiguangbo/jiguangb");
        AudioManager.instance.PlayFX("激光炮");
        Vector3 posi = transform.position + transform.forward * 0.5f + transform.up * 1f;
        Quaternion adjustedRotation = transform.rotation * Quaternion.Euler(-90f, 0f, 0f);
        Temp_jiguangbo_obj = GameObject.Instantiate(jiguangbo, posi, adjustedRotation);
        Temp_jiguangbo_obj.transform.parent = transform;

        Player_skill_class s = skill_class[1];
        Temp_jiguangbo_obj.GetComponent<jiguangbo_sc>().Init(transform, s);
        StartCoroutine(DelayFunctionTrigger(s.duration, jiguangbo_end));
        float cd_time = skill_class[1].CD - _attr.Get_cool_down();
        StartCoroutine(delay_change_CD(cd_time , 1));
    }
    void huongjue()
    {
        skill_2_cd = true;
        Vector3 posi = Temp_miaozhun_obj.transform.position;
        GameObject FB = ResourceManager.Instance.GetResource<GameObject>("Particle/huongjue/huongjue");
        AudioManager.instance.PlayFX("山海轰");
        Temp_huongjue_obj = GameObject.Instantiate(FB, posi, FB.transform.rotation);
        Temp_huongjue_obj.GetComponent<huongjue_sc>().Init(transform, skill_class[2]);
        Destroy(Temp_miaozhun_obj);
        Temp_miaozhun_obj = null;
        float cd_time = skill_class[2].CD - _attr.Get_cool_down();
        StartCoroutine(delay_change_CD(cd_time, 2));
    }
    void huongjue_end()
    {
        _cam.GetComponent<Camera_move>().Act_second_view(false);
        huongJue_ready = false;
        Free_view = true;
    }
    void jiguangbo_end()
    {
        GameObject jiesu = ResourceManager.Instance.GetResource<GameObject>("Particle/jiguangbo/jieshu_M");
        GameObject.Instantiate(jiesu, Temp_jiguangbo_obj.transform.position, Temp_jiguangbo_obj.transform.rotation, transform);
        if (Temp_jiguangbo_obj != null)
            Destroy(Temp_jiguangbo_obj);
        StartCoroutine(DelayFunctionTrigger(0.3f, jiguangbo_destory));
        _cam.GetComponent<Camera_move>().Act_second_view(false);
        jiguangbo_ready = false;
        Attacking = false;
        _attr.Set_move_speed(original_move_speed);
    }
    void jiguangbo_destory()
    {
        _attr.Stop_move(false);
        Free_view = true;
    }


    void Find_enemy()
    {
        // 获取准心的位置
        Vector3 crosshairPosition = new Vector3(Screen.width / 2, Screen.height / 2);

        // 获取攻击距离
        float attackDistance = _attr.Get_attack_distance();
        float coneAngle = 20f; // 检测圆锥的角度（度）

        // 检测范围内的所有碰撞体
        Collider[] colliders = Physics.OverlapSphere(Camera.main.transform.position, attackDistance);

        List<Transform> potentialTargets = new List<Transform>();

        // 收集所有符合条件的敌人
        foreach (Collider collider in colliders)
        {
            if (collider.CompareTag(SaveKey.Enemy))
            {
                Vector3 toCollider = collider.transform.position - Camera.main.transform.position;

                // 判断角度是否在圆锥范围内
                if (Vector3.Angle(Camera.main.transform.forward, toCollider.normalized) <= coneAngle)
                {
                    potentialTargets.Add(collider.transform);
                }
            }
        }

        // 如果找到多个敌人，选择离准心最近的
        if (potentialTargets.Count > 0)
        {
            Transform closestEnemy = null;
            float closestDistance = float.MaxValue;

            foreach (Transform target in potentialTargets)
            {
                // 获取目标的屏幕空间坐标
                Vector3 screenPos = Camera.main.WorldToScreenPoint(target.position);

                // 计算目标与准心的距离
                float distanceToCrosshair = Vector3.Distance(crosshairPosition, screenPos);

                // 如果当前敌人更接近准心，则更新
                if (distanceToCrosshair < closestDistance)
                {
                    closestDistance = distanceToCrosshair;
                    closestEnemy = target;
                }
            }

            Set_target(closestEnemy);
        }
        else
        {
            Set_target(null);
        }
    }


    void Set_target(Transform tr)
    {
        if(tr == _target)
            return;
        if(tr == null)
        {
            _target = null;
            _Lock_Sc.Remove_target();
        }
        else if (tr != null)
        {
            _target = tr;
            _Lock_Sc.Set_target(_target);
        }
            

    }

    IEnumerator DashForward()
    {
        //int cost = 10;
        //if (_attr.c_Value.stamina < cost)
        //    yield break;
        //_attr.c_Value.stamina -= cost;
        //_attr.Set_stamina();
        float dashTime = 0.2f; // 快速移动的时间
        float dashSpeed = 30f; // 快速移动的速度
        float startTime = Time.time;
        _attr.Set_stamina(_attr.Get_stamina() - 5f);

        if (!Free_view && !Target_lock)
        {
            yield return null;
        }else if(Free_view && !Target_lock)
        {
            sprint = true;
            while (Time.time < startTime + dashTime)
            {
                _ctr.Move(transform.forward * dashSpeed * Time.deltaTime);
                yield return null;
            }
            sprint = false;
        }else if(!Free_view && Target_lock)
        {
            sprint = true;
            // 根据输入确定冲刺方向
            Vector3 dashDirection = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")).normalized;
            if (dashDirection.magnitude == 0)
            {
                dashDirection = transform.forward; // 如果没有方向输入，则默认向前冲刺
            }
            else
            {
                // 将相对方向转换为世界坐标系方向
                dashDirection = transform.TransformDirection(dashDirection);
            }

            while (Time.time < startTime + dashTime)
            {
                _ctr.Move(dashDirection * dashSpeed * Time.deltaTime);
                yield return null;
            }

            sprint = false;
        }

    }

    // 受伤害函数
    public void Get_damage(biology_info E_attr, Player_skill_class skill)
    {
        if (isDie)
            return;
        bool isCrit = false;

        int damage = Attack_calculate.calculate_from_enemy(E_attr, _attr, ref isCrit, skill);
        // Debug.Log(damage);
        if (damage == -1)
        {
            // -1 表示闪避
            _attr.Reduce_hp(damage, isCrit, true);
            return;
        }
        // 修改生命值
        isDie = _attr.Reduce_hp(damage, isCrit, false);
        OnPlayerTakeDamage?.Invoke(damage);
        if (isDie)
        {
            // 发送死亡广播
            OnPlayerDeath?.Invoke();
        }

    }


    void Key_Check()
    {
        if (Input.GetKey(KeyCode.A))
        {
            move_x = -1;
            Key_move_click = true;
        }
        if (Input.GetKey(KeyCode.D))
        {
            move_x = 1;
            Key_move_click = true;
        }
        if (Input.GetKey(KeyCode.W))
        {
            move_y = 1;
            Key_move_click = true;
        }
        if (Input.GetKey(KeyCode.S))
        {
            move_y = -1;
            Key_move_click = true;
        }
        if (Input.GetKeyUp(KeyCode.A) || Input.GetKeyUp(KeyCode.D))
        {
            move_x = 0;
        }
        if (Input.GetKeyUp(KeyCode.W) || Input.GetKeyUp(KeyCode.S))
        {
            move_y = 0;
        }
        if (move_y == 0 && move_x == 0)
        {
            Key_move_click = false;
        }
        // 检查飞行键
        if (Input.GetKeyDown(KeyCode.LeftShift))
        {
            //if (stamina_enpty || !canFly)
            //    return;
            //isFlying = true;
            playerVelocity.y = 0; // 重置垂直速度
        }
        if (Input.GetKeyUp(KeyCode.LeftShift))
        {
            //if (canFly)
            //    isFlying = false;
            //else
            if (jiguangbo_ready || huongJue_ready || Jumping)
                return;
            if (_attr.Get_stamina() < 5)
                return;
            _anim.change_anim(Anim_state.Sprint);

            _chongci.Play();
            StartCoroutine(DashForward());
        }
        // 鼠标左键
        if (Input.GetMouseButtonDown(0))
        {
            if (EventSystem.current.IsPointerOverGameObject() || Attacking)
            {
                return;
            }
            if (jiguangbo_ready)
            {
                jiguangbo_ready = false;
                jiguangbo();
            }
            else if(huongJue_ready)
            {
                huongjue();
                huongjue_end();
            }
            else
            {
                Normal_atk();
            } 
        }
        if (Input.GetKeyUp(KeyCode.Alpha1))
        {
            if (skill_1_cd || huongJue_ready)
                return;
            jiguangbo_start();
        }
        if (Input.GetKeyUp(KeyCode.Alpha2))
        {
            if (skill_2_cd || jiguangbo_ready)
                return;
            huongjue_start();
        }
        //if (Input.GetMouseButtonDown(2))
        //{
        //    Free_view = false;
        //    if (_target)
        //        _cam.GetComponent<Camera_move>().SetView(_cam.position, _cam.rotation);
        //    _cam.GetComponent<Camera2>().enabled = false;
        //    _cam.GetComponent<Camera_move>().enabled = true;
        //    _cam.GetComponent<Camera2>().target = null;
        //    Target_lock = false;
        //}
        //if (Input.GetMouseButtonUp(2))
        //{
        //    if (_target != null)
        //    {
        //        transform.LookAt(_target);
        //        _cam.GetComponent<Camera_move>().enabled = false;
        //        _cam.GetComponent<Camera2>().enabled = true;
        //        _cam.GetComponent<Camera2>().target = _target;
        //        Target_lock = true;
        //    }
        //    else
        //    {
        //        Free_view = true;
        //    }
        //}
        if(Input.GetKeyDown(KeyCode.Space))
        {
            if (jiguangbo_ready || huongJue_ready || sprint)
                return;
            if (CheckGrounded())
            {
                Jumping = true;
                _anim.change_anim(Anim_state.Jump);
                playerVelocity.y = 15;
            }
        }
    }

    bool CheckGrounded()
    {
        // 从角色位置向下发射射线，长度为 groundCheckDistance
        RaycastHit hit;
        if (Physics.Raycast(transform.position, Vector3.down, out hit, 0.4f))
        {
            return true;  // 在可跳跃距离内
        }
        return false;
    }

    public void Set_Paused(bool p)
    {
        isPaused = p;
    }


    IEnumerator delay_change_CD(float time , int state)
    {
        yield return new WaitForSeconds(time);
        switch(state)
        {
            case 0:
                CD_atk = false;
                break;
            case 1:
                skill_1_cd = false;
                break;
            case 2:
                skill_2_cd = false;
                break;
            case 3:
                Attacking = false;
                break;
        }
        
    }

    bool Anim_lock()
    {
        bool locker = false;
        if(Attacking)
            locker = true;
        if (huongJue_ready)
            locker = true;
        if (jiguangbo_ready)
            locker = true;
        if (Jumping)
            locker = true;
        return locker;
    }

    // 延迟触发函数
    private IEnumerator DelayFunctionTrigger(float delay, System.Action callback)
    {
        // 延迟指定时间
        yield return new WaitForSeconds(delay);

        // 延迟结束后，调用回调函数
        callback?.Invoke();
    }

    //private void OnDrawGizmosSelected()
    //{

    //    Gizmos.color = Color.red;
    //    Gizmos.DrawWireSphere(transform.position, _attr.Get_attack_distance());
    //}



}
