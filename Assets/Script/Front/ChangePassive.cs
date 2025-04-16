using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
//using static UnityEditor.Progress;
public class ChangePassive : MonoBehaviour
{
    // Start is called before the first frame update
    public Sprite[] sprites;    

    public C_upgrade_attr player;
    public Image beidong1;
    public Image beidong2;
    public Image beidong3;

    private Image[] itemImages; // �洢���е�ͼ��  
    void Start()
    {
        player = GameObject.Find("Player")?.GetComponent<C_upgrade_attr>();
        itemImages = new Image[] { beidong1,beidong2,beidong3 };
        // ��ʼʱ������ Item ����  
        foreach (var item in itemImages)
        {
            item.gameObject.SetActive(false);
        }
    }

    // Update is called once per frame
    void Update()
    {
        Changed();
    }
    public void Changed()
    {
        if (player != null)
        {
            // �л��߼�  
            for (int i = 0; i < player.passive_infos.Count; i++)
            {
                var itemInfo = player.passive_infos[i];

                // �����ǰ itemInfo ���ڷ�Χ��, ������ѭ��  
                if (i >= itemImages.Length) continue;

                
                    itemImages[i].sprite = sprites[itemInfo.type_skill.Lv - 1];
                

                // ��ʾ��ǰ�� Item  
                itemImages[i].gameObject.SetActive(true);
            }

            // ��� player.infos ������С�� itemImages.length ��Ҫ���ض���� Items  
            for (int i = player.passive_infos.Count; i < itemImages.Length; i++)
            {
                itemImages[i].gameObject.SetActive(false);
            }
        }




        //if (player != null)
        //{
        //    beidong1.sprite = sprites[player.passive_infos[0].type_skill.Lv - 1];
        //    beidong2.sprite = sprites[player.passive_infos[1].type_skill.Lv - 1];
        //    beidong3.sprite = sprites[player.passive_infos[2].type_skill.Lv - 1];

        //}
    }
}

