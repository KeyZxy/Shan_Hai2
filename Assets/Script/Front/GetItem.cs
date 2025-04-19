using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GetItem : MonoBehaviour
{
    public C_upgrade_attr player; // �������  
    // ���߿�����  
    public RectTransform daoju1;
    public RectTransform daoju2;
    public RectTransform daoju3;
    public RectTransform daoju4;
    public RectTransform daoju5;
    public RectTransform daoju6;

    // ���Ե���  
    public GameObject[] itemObjects; // ����洢���� GameObject  

    private Dictionary<int, GameObject> idToImage; // ID ��ͼ���ӳ��  
    private Transform[] Frames; // ���Ե��߿�����  
                                // ƫ�������ã����Ը�����Ҫ����  
    private Vector3 offset1 = new Vector3(15, 10, 0);
    private Vector3 offset2 = new Vector3(10, 0, 0);
    void Start()
    {
        player = GameObject.Find("Player")?.GetComponent<C_upgrade_attr>();

        // ��ʼ�� ID �� GameObject ��ӳ��  
        idToImage = new Dictionary<int, GameObject>
        {
            { 200001, itemObjects[0] }, // qingzhiying  
            { 200002, itemObjects[1] }, // ruyi  
            { 200003, itemObjects[2] }, // shenmuqin  
            { 200004, itemObjects[3] }, // jiake  
            { 200008, itemObjects[4] }, // yazhui  
            { 200012, itemObjects[5] }, // liulizhu  
            { 200009, itemObjects[6] }, // ling  
            { 200010, itemObjects[7] }, // nang  
            { 200014, itemObjects[8] }, // yan  
            { 200017, itemObjects[9] },  // tai  
            { 200011, itemObjects[10] },  // hu  
            { 200015, itemObjects[11] },  // cai 
            { 200016, itemObjects[12] },  // shan
            { 200005, itemObjects[13] }, // shanbi
            { 200006, itemObjects[14] }, // baoji
            { 200007, itemObjects[15] }, // baojishanghai
        };

        // �����еĵ��� GameObject ����Ϊ���ɼ�  
        foreach (var item in itemObjects)
        {
            item.SetActive(false);
        }

        Frames = new Transform[] { daoju1, daoju2, daoju3, daoju4, daoju5, daoju6 };
    }

    void Update()
    {
        if (player != null && player.infos != null)
        {
            UpdateItemIcons();
        }
    }

    private void UpdateItemIcons()
    {
        // ������Ϣ������ͼ��  
        for (int i = 0; i < player.infos.Count && i < Frames.Length; i++)
        {
            var info = player.infos[i];
            if (idToImage.TryGetValue(info.attr_ID, out GameObject itemObject))
            {
                // ����λ������  
                Vector3 targetPosition = Frames[i].position;

                // ���ݵ����������ö����ƫ��  
                if (info.attr_ID == 200010) // nang  
                {
                    targetPosition += offset1;
                }
                else if (info.attr_ID == 200003) // shenmuqin  
                {
                    targetPosition += offset1;
                }
                else if (info.attr_ID == 200008) // yazhui 
                {
                    targetPosition += offset2;
                }
                // ������Ʒ�ĵ�λ�ú�״̬  
                itemObject.transform.position = targetPosition; // �����µ�λ��  
                itemObject.SetActive(true); // ʹͼ��ɼ�  
                Frames[i].gameObject.SetActive(false);
            }
        }
    }
}