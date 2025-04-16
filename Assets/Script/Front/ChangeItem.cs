using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ChangeItem : MonoBehaviour
{
    public Sprite[] sprites1;
    public Sprite[] sprites2;

    public C_upgrade_attr player;
    public Image Item1;
    public Image Item2;
    public Image Item3;
    public Image Item4;
    public Image Item5;
    public Image Item6;

    private Image[] itemImages; // �洢���е�ͼ��  

    void Start()
    {
        player = GameObject.Find("Player")?.GetComponent<C_upgrade_attr>();
        itemImages = new Image[] { Item1, Item2, Item3, Item4, Item5, Item6 };

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
            for (int i = 0; i < player.infos.Count; i++)
            {
                var itemInfo = player.infos[i];

                // �����ǰ itemInfo ���ڷ�Χ��, ������ѭ��  
                if (i >= itemImages.Length) continue;

                // ���� attr_ID �л� sprites  
                if (itemInfo.attr_ID == 200010) // �����Ƿ�������   
                {
                    itemImages[i].sprite = sprites2[itemInfo.type_attr.level - 1];
                }
                else // ʹ�� sprites1  
                {
                    itemImages[i].sprite = sprites1[itemInfo.type_attr.level - 1];
                }

                // ��ʾ��ǰ�� Item  
                itemImages[i].gameObject.SetActive(true);
            }

            // ��� player.infos ������С�� itemImages.length ��Ҫ���ض���� Items  
            for (int i = player.infos.Count; i < itemImages.Length; i++)
            {
                itemImages[i].gameObject.SetActive(false);
            }
        }
    }
}