using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Hp : MonoBehaviour
{
    public C_attribute player;
    private int maxhp;
    private float hpBefore; // ��¼��һ֡��Ѫ��  
    public float speed = 5f; // �����ٶ�  
    private Image image;
    public Text text;

    void Start()
    {
        image = GetComponent<Image>();
        player = GameObject.Find("Player")?.GetComponent<C_attribute>();

        if (player != null)
        {
            hpBefore = player.Get_hp();
            maxhp = Mathf.Max(player.Get_max_hp(), 1); // ȷ�� maxhp ����Ϊ 1  
        }
    }

    void Update()
    {
        if (player == null) return;

        int hp = player.Get_hp();
        maxhp = Mathf.Max(player.Get_max_hp(), 1); // ��ֹ���� 0  

        hp = Mathf.Clamp(hp, 0, maxhp); // ȷ��Ѫ������Ч��Χ  

        // �����Ϸδ��ͣ������ƽ������  
        if (Time.timeScale > 0)
        {
            hpBefore = Mathf.Lerp(hpBefore, hp, Time.deltaTime * speed);
        }
        else
        {
            // ����ͣ״̬��ֱ�Ӹ��� hpBefore  
            hpBefore = hp;
        }

        image.fillAmount = hpBefore / maxhp;

        // ����Ѫ���ı�  
        UpdateHealthText();
    }

    void UpdateHealthText()
    {
        if (text != null)
        {
            text.text = Mathf.RoundToInt(hpBefore).ToString() + " / " + maxhp.ToString();
        }
    }
}