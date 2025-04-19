using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting.Antlr3.Runtime;
using UnityEngine;
using UnityEngine.UI;

public class ExistTime : MonoBehaviour
{
    public C_base player;          // 玩家引用  
    public Text timeText;          // 显示存活时间的UI文本  
    public C_attribute playerat;
    private float survivalTime;    // 存活时间  
    public GameObject death;       // 死亡 UI  
    public Text existtime;         // 存活时间文本  
    public Text grade;             // 等级文本  
    private Camera_move _cam;
    private bool isdead;
    public Text KillAmount;
    private int kill;
    public Text CauseDamage;
    private int causedamage;
    public Text TakeDamage;
    private int takedamage;

    // 引用其他 UI 元素  
    public GameObject cardUI;      // 抽卡 UI
    public GameObject mainUI;        // 基础UI
    public GameObject pauseMenuUI; // 暂停菜单 UI  

    public float deathAnimationDuration = 2f;
    private bool isDeathHandled = false;

    // 可以用来调整颜色  
    public float brightness = 0.8f; // 1.0 表示正常亮度，<1.0 变暗，>1.0 变亮  
    public Image skill1;
    public Image skill2;

    public Text zhudong1;
    public Text zhudong2;
    private float cd1;
    private float cd2;
    void Start()
    {
        // 获取玩家组件  
        player = GameObject.Find("Player")?.GetComponent<C_base>();
        playerat = GameObject.Find("Player")?.GetComponent<C_attribute>();
        _cam = GameObject.Find("Main Camera").transform.GetComponent<Camera_move>();
        cd1 = player.skill_class[1].CD;
        cd2 = player.skill_class[2].CD;
        zhudong1.gameObject.SetActive(false);
        zhudong2.gameObject.SetActive(false);
        survivalTime = 0f; // 初始化存活时间  
        death.SetActive(false);
        kill = 0;
        causedamage = 0;
        takedamage = 0;
        isdead = false;
    }

    void Update()
    {
        if (player == null || timeText == null) return;

        // 如果玩家未死亡，增加存活时间  
        if (!isdead)
        {
            survivalTime += Time.deltaTime;
            HandleCD();  // 更新冷却时间  
           zhudong1.text = Mathf.CeilToInt(cd1).ToString() + "s";
           zhudong2.text = Mathf.CeilToInt(cd2).ToString() + "s";
            timeText.text = FormatTime(survivalTime);
            
        }
        else
        {
            // 如果玩家已经死亡，启动死亡处理协程  
            if (!isDeathHandled)
            {
                StartCoroutine(HandlePlayerDeath());
            }
        }
    }
    private void OnEnable()
    {
        E_base.OnEnemyDeath += OnKill;
        E_base.OnEnemyTakeDamage += OnCauseDamage;
        C_base.OnPlayerTakeDamage += OnTakeDamage;
        C_base.OnPlayerDeath += OnDeath;
    }
    private void OnDisable()
    {
        E_base.OnEnemyDeath -= OnKill;
        E_base.OnEnemyTakeDamage -= OnCauseDamage;
        C_base.OnPlayerTakeDamage -= OnTakeDamage;
        C_base.OnPlayerDeath -= OnDeath;
    }
    private void OnDeath()
    {
        isdead = true;
    }
    private void OnKill()
    {
        kill++;
    }
    private void OnCauseDamage(int damage)
    {
        causedamage += damage;
    }
    private void OnTakeDamage(int damage)
    {
        takedamage += damage;
    }
    private void HandleCD()
    {
        // 冷却时间减少  
        if (player.skill_1_cd)
        {
            zhudong1.gameObject.SetActive(true);
            // 用于确保调整倍数最小为零   
            float clampedBrightness = Mathf.Clamp(brightness, 0f, 2f);
            // 计算新的颜色  
            Color newColor = new Color(clampedBrightness, clampedBrightness, clampedBrightness, 1f);
            // 应用新颜色  
            skill1.color = newColor;
            cd1 -= Time.deltaTime; // 减少冷却时间  
            if (cd1 < 0) 
            { 
               cd1 = player.skill_class[1].CD;
            }
        }
        else 
        {
            zhudong1.gameObject.SetActive(false);
            skill1.color = new Color(1, 1, 1, 1); 
        }

        if (player.skill_2_cd)
        {
            zhudong2.gameObject.SetActive(true);
                // 用于确保调整倍数最小为零   
                float clampedBrightness = Mathf.Clamp(brightness, 0f, 2f);
                // 计算新的颜色  
                Color newColor = new Color(clampedBrightness, clampedBrightness, clampedBrightness, 1f);
                // 应用新颜色  
                skill2.color = newColor;
                cd2 -= Time.deltaTime; // 减少冷却时间  
               if (cd2 < 0)
                {
                    cd2 = player.skill_class[2].CD;
                }
            }
        else {  
            zhudong2.gameObject.SetActive(false);
                    skill2.color = new Color(1, 1, 1, 1);
        }
    }


    private IEnumerator HandlePlayerDeath()
    {
        isDeathHandled = true;

        // 等待死亡动画播放完成  
        yield return new WaitForSeconds(deathAnimationDuration); // 替换为实际的死亡动画时长  

        // 玩家死亡时显示死亡 UI 并禁用其他 UI  
        death.SetActive(true);
        existtime.text = FormatTime(survivalTime);
        KillAmount.text=kill.ToString();
        CauseDamage.text=causedamage.ToString();
        TakeDamage.text=takedamage.ToString();
        grade.text = playerat.Get_grade().ToString();
        DisableOtherUI();
        _cam.Set_Paused(true);
        player.Set_Paused(true);
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
    }
    // 格式化时间为 mm:ss  
    private string FormatTime(float time)
    {
        int minutes = Mathf.FloorToInt(time / 60); // 转换分钟  
        int seconds = Mathf.FloorToInt(time % 60); // 转换秒  
        return string.Format("{0:00}:{1:00}", minutes, seconds);
    }

    // 禁用其他 UI 元素  
    private void DisableOtherUI()
    {
        if (cardUI != null)
        {
            cardUI.SetActive(false); // 禁用抽卡 UI  
        }

        if (pauseMenuUI != null)
        {
            pauseMenuUI.SetActive(false); // 禁用暂停菜单 UI  
        }

        if (mainUI != null)
        {
           mainUI.SetActive(false); // 禁用暂停菜单 UI  
        }
    }
}