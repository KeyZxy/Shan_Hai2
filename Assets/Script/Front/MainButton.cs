using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class MainButton : MonoBehaviour
{
    public Button[] buttons; // �洢���а�ť  
    private int selectedIndex = 0; // ��ǰѡ�еİ�ť��������ʼΪ -1 ��ʾû��ѡ��  
 
    private void Start()
    {
        UpdateButtonSelection();

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
        // ʹ�� A/D ���л���ť  
        if (Input.GetKeyDown(KeyCode.A) || Input.GetKeyDown(KeyCode.LeftArrow))
        {
            MoveSelection(-1);
        }
        else if (Input.GetKeyDown(KeyCode.D) || Input.GetKeyDown(KeyCode.RightArrow))
        {
            MoveSelection(1);
        }
        if (Input.GetKeyDown(KeyCode.Return) && selectedIndex >= 0 && selectedIndex < buttons.Length)
        {
            buttons[selectedIndex].onClick.Invoke();
        }
    }

    private void MoveSelection(int direction)
    {
        selectedIndex += direction;

        // ȷ����������Ч��Χ��   
        if (selectedIndex < 0)
        {
            selectedIndex = buttons.Length - 1;
        }
        else if (selectedIndex >= buttons.Length)
        {
            selectedIndex = 0;
        }

        UpdateButtonSelection();
    }

    private void UpdateButtonSelection()
    {
        for (int i = 0; i < buttons.Length; i++)
        {
            if (i == selectedIndex )
            {
                // ��ѡ�еİ�ťʱ����״̬  
                buttons[i].GetComponentInChildren<Text>().color = Color.white; // ������ɫΪ��ɫ  
                buttons[i].GetComponent<Image>().enabled = true; // ���ñ���  

            }
            else
            {
                // û��ѡ�еİ�ťʱ����Ĭ��״̬  
                buttons[i].GetComponentInChildren<Text>().color = Color.black; // ������ɫΪ��ɫ  
                buttons[i].GetComponent<Image>().enabled = false; // ���ñ���  
            }
        }
    }

    private void OnMouseEnterButton(int index)
    {
        // �������밴ťʱ����������Ϊѡ��  
        selectedIndex = index; // ��¼������İ�ť����
        UpdateButtonSelection();
    }

    private void OnMouseExitButton(int index)
    {
        //AudioManager.instance.PlayFX("������Ч");
        //// ������뿪��ťʱ������״̬���ã�'-1' ��ʾû��ѡ�У�  
        //if (selectedIndex == index)
        //{
        //    selectedIndex = -1;
        //    UpdateButtonSelection();
        //}
    }

   

}