using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
public class ControlButton : MonoBehaviour
{
    public Button[] buttons; // �洢���а�ť  
    private int selectedIndex = -1; // ��ǰѡ�еİ�ť��������ʼΪ -1 ��ʾû��ѡ��  
    // Start is called before the first frame update
    void Start()
    {
        // ��ȡ��ǰ���弰�������������е����� Button  
        buttons = GetComponentsInChildren<Button>();
        
        UpdateButtonSelection();
        

        // Ϊÿ����ť��������¼�  
        for (int i = 0; i < buttons.Length; i++)
        {  
            buttons[i].GetComponent<Image>().enabled = false; // ���ñ���

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

            // ����¼�  
            EventTrigger.Entry entryClick = new EventTrigger.Entry();
            entryClick.eventID = EventTriggerType.PointerClick;
            entryClick.callback.AddListener((data) => { OnButtonClick(index); });
            trigger.triggers.Add(entryClick);
        }
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Return) && selectedIndex >= 0 && selectedIndex < buttons.Length)
        {
            buttons[selectedIndex].onClick.Invoke();
        }
    }
    private void UpdateButtonSelection()
    {
        for (int i = 0; i < buttons.Length; i++)
        {
            if (i == selectedIndex)
            {
                // ��ѡ�еİ�ťʱ����״̬  
                buttons[i].GetComponentInChildren<Text>().color = Color.black; // ������ɫΪ��ɫ  
                buttons[i].GetComponent<Image>().enabled = true; // ���ñ���  
            }
            else
            {
                // û��ѡ�еİ�ťʱ����Ĭ��״̬  
                buttons[i].GetComponentInChildren<Text>().color = Color.grey; // ������ɫΪ��ɫ  
                buttons[i].GetComponent<Image>().enabled = false; // ���ñ���  
            }
        }
    }

    private void OnMouseEnterButton(int index)
    {
        // �������밴ťʱ����������Ϊѡ��  
        selectedIndex = index;
        UpdateButtonSelection();
    }

    private void OnMouseExitButton(int index)
    {
        // ������뿪��ťʱ������״̬���ã�'-1' ��ʾû��ѡ�У�  
        if (selectedIndex == index)
        {
            selectedIndex = -1;
            UpdateButtonSelection();
        }
    }

    private void OnButtonClick(int index)
    {
        // ���ŵ����Ч  
        AudioManager.instance.PlayFX("�����Ч");
    }
}
