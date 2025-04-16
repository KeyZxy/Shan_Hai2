using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Stamine : MonoBehaviour
{
    public C_attribute player;
    private float maxex;
    private float exBefore;

    public float speed = 5f; // �����ٶ�  
    private Image image;
    public Text text;
    private bool isResetting = false; // �Ƿ�������վ�����  
    // Start is called before the first frame update
    void Start()
    {
        image = GetComponent<Image>();
        player = GameObject.Find("Player")?.GetComponent<C_attribute>();

        if (player != null)
        {
            exBefore = player.Get_stamina();
            maxex = player.Get_Max_stamina();
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (player == null) return; 
        float ex = player.Get_stamina();
        maxex = Mathf.Max(player.Get_Max_stamina(), 1); // ��ֹ maxex == 0  

        if (ex >= maxex&&Input.GetKeyDown(KeyCode.LeftShift))
        {
            isResetting = true; // ����ֵ������ʼ���  
        }

        float deltaTime = (Time.timeScale > 0) ? Time.deltaTime : Time.unscaledDeltaTime;

        if (isResetting)
        {
            // ���������վ�����������ƽ������  
            exBefore = Mathf.Lerp(exBefore, 0, deltaTime * speed);
            if (exBefore <= 0.01f) // ���⸡�������  
            {
                exBefore = 0;
                isResetting = false; // �����ɣ��ָ������������  
            }
        }
        else
        {
            // �������¾���ֵ  
            ex = Mathf.Clamp(ex, 0, maxex);
            exBefore = Mathf.Lerp(exBefore, ex, deltaTime * speed);
        }

        image.fillAmount = exBefore / maxex;
        // ����Ѫ���ı�  
        UpdateHealthText();
    }
    void UpdateHealthText()
    {
        if (text != null)
        {
            text.text = Mathf.RoundToInt(exBefore).ToString() + " / " + maxex.ToString();
        }
    }
}
