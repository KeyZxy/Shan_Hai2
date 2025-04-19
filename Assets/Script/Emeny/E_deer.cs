using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class E_deer : E_base
{

    public float skill_atk_CD;
    public int skill_atk_rate;
    public int skill_atk_damage;
    public float skill_buff_CD;
    public int skill_buff_rate;
    public float skill_buff_duration;
    public int skill_buff_Hp;
    public int skill_buff_Speed;


    private float skill_atk_timer;
    private float skill_buff_timer;
    private int Current_atk_state = 1;
    private bool dash_anim = false;
    private float dashTime = 0.7f;  // 冲刺持续时间
    private float dashTimer = 0f;  // 计时器

    private float change_state_time = 15f;
    private float change_state_timer = 0f;

    private GameObject kaishi;
    private GameObject chongci_1;
    private GameObject chongci_2;

    // Start is called before the first frame update
    protected override void Start()
    {
        base.Start();
    }

    // Update is called once per frame
    protected override void Update()
    {
        base.Update();
        if (skill_atk_timer > 0)
        {
            skill_atk_timer -= Time.deltaTime;
            if (skill_atk_timer < 0)
                skill_atk_timer = 0;
        }
        if(skill_buff_timer > 0)
        {
            skill_buff_timer -= Time.deltaTime;
            if(skill_buff_timer < 0)
                skill_buff_timer = 0;
        }
        if(dash_anim)
        {
            if (dashTimer <= 0)
            {
                dashTimer = dashTime; // 开始冲刺
            }
        }
        if (dashTimer > 0)
        {
            // 计算冲刺方向（忽略 Y 轴，只沿水平方向冲刺）
            Vector3 dashDirection = new Vector3(transform.forward.x, 0, transform.forward.z).normalized;
            Vector3 move = dashDirection * e_value.move_speed * 3 * Time.deltaTime;

            // 使用 C_ctr.Move 进行移动
            C_ctr.Move(move);

            // 递减冲刺时间
            dashTimer -= Time.deltaTime;
            if (dashTimer <= 0)
            {
                dash_anim = false;
                dashTimer = 0; // 冲刺结束
                skill_atk_timer = skill_atk_CD;
                Random_next_state();
                _anim.change_anim(Anim_state.Idle);
                StartCoroutine(delay_change_state(e_value.attack_speed));
                if(chongci_1 != null) Destroy(chongci_1);
                GameObject FB = (GameObject)Resources.Load("Particle/deer_sprint/baodian_M");
                Vector3 posi2 = transform.position + transform.forward * 3f;
                posi2.y += 1f;
                GameObject.Instantiate(FB, posi2, transform.rotation, transform);

                // 冲刺波
                FB = (GameObject)Resources.Load("Particle/deer_sprint/chongci2");
                posi2 = transform.position + transform.forward * 3f;
                posi2.y += 0.2f;
                chongci_2 = GameObject.Instantiate(FB, posi2, transform.rotation, transform);
                chongci_2.transform.Rotate(0, 180f, 0);
                Player_skill_class sk = new Player_skill_class();
                sk.Atk = skill_atk_damage;
                chongci_2.GetComponent<deer_sprint_sc>().Init(e_value, sk , true);
                
            }
        }
    }

    public override void Attack_function()
    {
        switch(Current_atk_state)
        {
            case 1:
                Atk1();
                break;
            case 2:
                Atk2();
                break;
            case 3:
                Atk3();
                break;
        }
    }

    void Random_next_state()
    {
        change_state_timer = 0;

        if (skill_atk_timer == 0 && skill_buff_timer == 0)
        {
            // 两个技能都可用，按 30% / 30% / 40% 概率选择
            float randomValue = Random.Range(0f, 100f);

            if (randomValue < skill_atk_rate)
            {
                Current_atk_state = 2; // 30% 选择技能攻击
            }
            else if (randomValue < skill_atk_rate + skill_buff_rate)
            {
                Current_atk_state = 3; // 30% 选择 Buff
            }
            else
            {
                Current_atk_state = 1; // 40% 选择普通攻击
            }
        }
        else if (skill_atk_timer > 0 && skill_buff_timer == 0)
        {
            // 技能攻击不可用，但 Buff 可用，按 30% / 70% 概率
            if (Random.Range(0f, 100f) < skill_buff_rate)
            {
                Current_atk_state = 3; // 30% 选择 Buff
            }
            else
            {
                Current_atk_state = 1; // 70% 选择普通攻击
            }
        }
        else if (skill_atk_timer == 0 && skill_buff_timer > 0)
        {
            // Buff 不可用，但技能攻击可用，按 30% / 70% 概率
            if (Random.Range(0f, 100f) < skill_atk_rate)
            {
                Current_atk_state = 2; // 30% 选择技能攻击
            }
            else
            {
                Current_atk_state = 1; // 70% 选择普通攻击
            }
        }
        else
        {
            // 两个技能都在冷却，强制普通攻击
            Current_atk_state = 1;
        }
        //Debug.Log(Current_atk_state);

    }

    void Atk2()
    {
        Vector3 posi = new Vector3(_target.position.x, transform.position.y, _target.position.z);
        transform.LookAt(posi);

        float distance = Vector3.Distance(transform.position, _target.position);
        if ((distance <= e_value.attack_distance * 4f))
        {
            // 到达距离
            isAttack = true;
            _anim.change_anim(Anim_state.Attack2);
            StartCoroutine(delay_Active_attack2(0.5f));
            GameObject FB = (GameObject)Resources.Load("Particle/deer_sprint/xuli_M");
            Vector3 posi2 = transform.position;
            kaishi = GameObject.Instantiate(FB, posi2, transform.rotation , transform);
        }
        else
        {
            Vector3 moveDirection = (_target.position - transform.position).normalized;
            Vector3 move = moveDirection * e_value.move_speed * Time.fixedDeltaTime;
            C_ctr.Move(move);
            _anim.change_anim(Anim_state.Run);
        }
    }

    IEnumerator delay_Active_attack2(float time)
    {
        yield return new WaitForSeconds(time);
        Destroy(kaishi);
        Current_atk_state = 0;
        dash_anim = true;
        GameObject FB = (GameObject)Resources.Load("Particle/deer_sprint/chongci1");
        Vector3 posi2 = transform.position + transform.forward * 3f;
        posi2.y += 0.2f;
        chongci_1 = GameObject.Instantiate(FB, posi2, transform.rotation, transform);
        chongci_1.transform.Rotate(0, 180f, 0);
        Player_skill_class sk = new Player_skill_class();
        sk.Atk = skill_atk_damage;
        chongci_1.GetComponent<deer_sprint_sc>().Init(e_value, sk);
    }
    IEnumerator delay_Play_effect(float time)
    {
        yield return new WaitForSeconds(time);

    }

    void Atk3()
    {
        isAttack = true;
        Current_atk_state = 0;
        _anim.change_anim(Anim_state.Attack3);
        StartCoroutine(delay_Active_attack3(1f));
    }

    IEnumerator delay_Active_attack3(float time)
    {
        yield return new WaitForSeconds(time);
        GameObject FB = (GameObject)Resources.Load("Particle/deer_buff/buff");
        Vector3 posi = transform.position;
        posi.y -= 0.1f;
        GameObject go = GameObject.Instantiate(FB, posi, transform.rotation);
        go.transform.GetComponent<deer_buff_sc>().Init(skill_buff_duration, skill_buff_Hp, skill_buff_Speed, transform);
        StartCoroutine(delay_buff_end(2f));
    }

    IEnumerator delay_buff_end(float time)
    {
        yield return new WaitForSeconds(time);
        skill_buff_timer = skill_buff_CD;
        Random_next_state();
        _anim.change_anim(Anim_state.Idle);
        StartCoroutine(delay_change_state(e_value.attack_speed));
    }

    void Atk1()
    {
        Vector3 posi = new Vector3(_target.position.x, transform.position.y, _target.position.z);
        transform.LookAt(posi);

        float distance = Vector3.Distance(transform.position, _target.position);
        if ((distance <= e_value.attack_distance))
        {
            // 到达距离
            isAttack = true;
            _anim.change_anim(Anim_state.Attack1);
            StartCoroutine(delay_Active_attack(0.5f));
            StartCoroutine(delay_change_state(e_value.attack_speed));
        }
        else
        {
            Vector3 moveDirection = (_target.position - transform.position).normalized;
            Vector3 move = moveDirection * e_value.move_speed * Time.fixedDeltaTime;
            C_ctr.Move(move);
            _anim.change_anim(Anim_state.Run);
            change_state_timer += Time.deltaTime;
            if (change_state_timer >= change_state_time)
            {
                Random_next_state();
            }
        }
    }


    protected override IEnumerator delay_Active_attack(float time)
    {
        yield return new WaitForSeconds(time);
        GameObject FB = (GameObject)Resources.Load("Particle/bite/bite");
        Vector3 posi = transform.position;
        GameObject go = GameObject.Instantiate(FB, posi, transform.rotation);
        go.transform.position = go.transform.position + go.transform.forward * 3f;
        go.transform.position = go.transform.position + go.transform.up * 0.8f;
        Player_skill_class ss = new Player_skill_class();
        go.GetComponent<bite_sc>().Init(e_value, ss);
        _anim.change_anim(Anim_state.Idle);
        Random_next_state();
    }

}
