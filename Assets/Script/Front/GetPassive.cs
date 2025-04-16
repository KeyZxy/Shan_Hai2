using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GetPassive : MonoBehaviour
{
    public C_upgrade_attr player;  // ��ұ������ܵ�����  

    // �������ܿ�����  
    public Image beidong1;
    public Image beidong2;
    public Image beidong3;

    // ��������ͼ��  
    public Sprite[] sprites; 

    private Dictionary<int, Sprite> idToImage; // ID ��ͼ���ӳ��  
    private Image[] passiveImages; // ���ڴ洢�������ܿ�� Image ���  

    void Start()
    {
        player = GameObject.Find("Player")?.GetComponent<C_upgrade_attr>();

        idToImage = new Dictionary<int, Sprite>
        {
            { 220003, sprites[0] }, // ˮ��  
            { 220001, sprites[1] }, // ����  
            { 220002, sprites[2] }  // С����  
        };

        passiveImages = new Image[] { beidong1, beidong2, beidong3 };
    }

    void Update()
    {
        if (player != null && player.passive_infos != null)
        {
            UpdatePassiveSkills();
        }
    }

    private void UpdatePassiveSkills()
    {
       

        // ��������������Ϣ������ͼ��  
        for (int i = 0; i < player.passive_infos.Count && i < passiveImages.Length; i++)
        {
            var passiveInfo = player.passive_infos[i];
            if (idToImage.TryGetValue(passiveInfo.attr_ID, out Sprite newSprite))
            {
                passiveImages[i].sprite = newSprite; // �����µ�ͼ��  
            }
        }
    }
}