using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class StartButton : MonoBehaviour
{
    public Button[] buttons; // �洢���а�ť  
    public GameObject[] tooltip; // ������ʾ��ʾ��ͼƬ  
    private int selectedIndex = -1; // ��ǰѡ�еİ�ť��������ʼΪ -1 ��ʾû��ѡ��  

    // Start is called before the first frame update  
    void Start()
    {
        // ��ʼʱ����������ʾ  
        for (int i = 0; i < tooltip.Length; i++)
        {
            tooltip[i].SetActive(false);
        }

        // Ϊÿ����ť��������¼�  
        for (int i = 0; i < buttons.Length; i++)
        {
            int index = i; // ����ֲ�����  
            EventTrigger trigger = buttons[i].gameObject.AddComponent<EventTrigger>();

            // �������¼�  
            EventTrigger.Entry entryEnter = new EventTrigger.Entry();
            entryEnter.eventID = EventTriggerType.PointerEnter;
            entryEnter.callback.AddListener((data) => { OnMouseEnterButton(index); });
            trigger.triggers.Add(entryEnter);

            // ����뿪�¼�  
            EventTrigger.Entry entryExit = new EventTrigger.Entry();
            entryExit.eventID = EventTriggerType.PointerExit;
            entryExit.callback.AddListener((data) => { OnMouseExitButton(index); });
            trigger.triggers.Add(entryExit);

           
        }
    }
    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Return) && selectedIndex >= 0 && selectedIndex < buttons.Length)
        {
            buttons[selectedIndex].onClick.Invoke();
        }
    }
    private void OnMouseEnterButton(int i)
    {
        // �������밴ťʱ����������Ϊѡ��  
        selectedIndex = i;
        tooltip[i].SetActive(true); // ��ʾ��ʾ  
    }

    private void OnMouseExitButton(int i)
    {
        // ������뿪��ťʱ������״̬����  
        if (selectedIndex == i)
        {
            selectedIndex = -1;
            tooltip[i].SetActive(false); // ������ʾ  
        }
    }

  
}