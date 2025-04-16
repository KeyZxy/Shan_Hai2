using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Talk : MonoBehaviour
{
    public string biaoti;    // �Ի�����  
    public string zhengwen;  // �Ի�����  
    public UIFollow uiFollow; // ���ڴ洢��ǰ Talk �õ� UIFollow ʵ�� **  

    private void Start()
    {
      
        if (uiFollow != null)
        {
            uiFollow.gameObject.SetActive(false);
        }
    }

    private void OnTriggerEnter(Collider collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {
            // ȷ��������ʱ���� UI  
            if (uiFollow != null)
            {
                uiFollow.Init(
                    Camera.main,
                    transform,
                    GameObject.FindObjectOfType<Canvas>()
                );
                uiFollow.gameObject.SetActive(true);  // ��ʾ UI  
            }
        }
    }

    private void OnTriggerExit(Collider collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {
            // ���� UI ������Ի�  
            if (uiFollow != null)
            {
                uiFollow.gameObject.SetActive(false); // ���� UI  
            }
            DialogueManager.instance.HideText();
        }
    }

    private void Update()
    {
        // ֻ�� UI ��ʾʱ����û�����  
        if (uiFollow != null && uiFollow.gameObject.activeSelf && Input.GetKeyDown(KeyCode.E))
        {
            DialogueManager.instance.ShowText(biaoti, zhengwen);
        }
    }
}