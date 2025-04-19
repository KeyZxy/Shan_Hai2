using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting.Antlr3.Runtime;
using UnityEngine;
using UnityEngine.UI;

public class ExistTime : MonoBehaviour
{
    public C_base player;          // �������  
    public Text timeText;          // ��ʾ���ʱ���UI�ı�  
    public C_attribute playerat;
    private float survivalTime;    // ���ʱ��  
    public GameObject death;       // ���� UI  
    public Text existtime;         // ���ʱ���ı�  
    public Text grade;             // �ȼ��ı�  
    private Camera_move _cam;
    private bool isdead;
    public Text KillAmount;
    private int kill;
    public Text CauseDamage;
    private int causedamage;
    public Text TakeDamage;
    private int takedamage;

    // �������� UI Ԫ��  
    public GameObject cardUI;      // �鿨 UI
    public GameObject mainUI;        // ����UI
    public GameObject pauseMenuUI; // ��ͣ�˵� UI  

    public float deathAnimationDuration = 2f;
    private bool isDeathHandled = false;

    // ��������������ɫ  
    public float brightness = 0.8f; // 1.0 ��ʾ�������ȣ�<1.0 �䰵��>1.0 ����  
    public Image skill1;
    public Image skill2;

    public Text zhudong1;
    public Text zhudong2;
    private float cd1;
    private float cd2;
    void Start()
    {
        // ��ȡ������  
        player = GameObject.Find("Player")?.GetComponent<C_base>();
        playerat = GameObject.Find("Player")?.GetComponent<C_attribute>();
        _cam = GameObject.Find("Main Camera").transform.GetComponent<Camera_move>();
        cd1 = player.skill_class[1].CD;
        cd2 = player.skill_class[2].CD;
        zhudong1.gameObject.SetActive(false);
        zhudong2.gameObject.SetActive(false);
        survivalTime = 0f; // ��ʼ�����ʱ��  
        death.SetActive(false);
        kill = 0;
        causedamage = 0;
        takedamage = 0;
        isdead = false;
    }

    void Update()
    {
        if (player == null || timeText == null) return;

        // ������δ���������Ӵ��ʱ��  
        if (!isdead)
        {
            survivalTime += Time.deltaTime;
            HandleCD();  // ������ȴʱ��  
           zhudong1.text = Mathf.CeilToInt(cd1).ToString() + "s";
           zhudong2.text = Mathf.CeilToInt(cd2).ToString() + "s";
            timeText.text = FormatTime(survivalTime);
            
        }
        else
        {
            // �������Ѿ�������������������Э��  
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
        // ��ȴʱ�����  
        if (player.skill_1_cd)
        {
            zhudong1.gameObject.SetActive(true);
            // ����ȷ������������СΪ��   
            float clampedBrightness = Mathf.Clamp(brightness, 0f, 2f);
            // �����µ���ɫ  
            Color newColor = new Color(clampedBrightness, clampedBrightness, clampedBrightness, 1f);
            // Ӧ������ɫ  
            skill1.color = newColor;
            cd1 -= Time.deltaTime; // ������ȴʱ��  
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
                // ����ȷ������������СΪ��   
                float clampedBrightness = Mathf.Clamp(brightness, 0f, 2f);
                // �����µ���ɫ  
                Color newColor = new Color(clampedBrightness, clampedBrightness, clampedBrightness, 1f);
                // Ӧ������ɫ  
                skill2.color = newColor;
                cd2 -= Time.deltaTime; // ������ȴʱ��  
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

        // �ȴ����������������  
        yield return new WaitForSeconds(deathAnimationDuration); // �滻Ϊʵ�ʵ���������ʱ��  

        // �������ʱ��ʾ���� UI ���������� UI  
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
    // ��ʽ��ʱ��Ϊ mm:ss  
    private string FormatTime(float time)
    {
        int minutes = Mathf.FloorToInt(time / 60); // ת������  
        int seconds = Mathf.FloorToInt(time % 60); // ת����  
        return string.Format("{0:00}:{1:00}", minutes, seconds);
    }

    // �������� UI Ԫ��  
    private void DisableOtherUI()
    {
        if (cardUI != null)
        {
            cardUI.SetActive(false); // ���ó鿨 UI  
        }

        if (pauseMenuUI != null)
        {
            pauseMenuUI.SetActive(false); // ������ͣ�˵� UI  
        }

        if (mainUI != null)
        {
           mainUI.SetActive(false); // ������ͣ�˵� UI  
        }
    }
}