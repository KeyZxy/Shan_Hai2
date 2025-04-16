using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
public class ControlButton : MonoBehaviour
{
    public Button[] buttons; // 存储所有按钮  
    private int selectedIndex = -1; // 当前选中的按钮索引，初始为 -1 表示没有选中  
    // Start is called before the first frame update
    void Start()
    {
        // 获取当前物体及其所有子物体中的所有 Button  
        buttons = GetComponentsInChildren<Button>();
        
        UpdateButtonSelection();
        

        // 为每个按钮设置鼠标事件  
        for (int i = 0; i < buttons.Length; i++)
        {  
            buttons[i].GetComponent<Image>().enabled = false; // 禁用背景

            int index = i; // 捕获局部变量  
            EventTrigger trigger = buttons[i].gameObject.AddComponent<EventTrigger>();

            // 鼠标进入事件  
            EventTrigger.Entry entryEnter = new EventTrigger.Entry();
            entryEnter.eventID = EventTriggerType.PointerEnter;
            entryEnter.callback.AddListener((data) => { OnMouseEnterButton(index); });
            trigger.triggers.Add(entryEnter);

            // 鼠标离开事件  
            EventTrigger.Entry entryExit = new EventTrigger.Entry();
            entryExit.eventID = EventTriggerType.PointerExit;
            entryExit.callback.AddListener((data) => { OnMouseExitButton(index); });
            trigger.triggers.Add(entryExit);

            // 点击事件  
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
                // 有选中的按钮时更改状态  
                buttons[i].GetComponentInChildren<Text>().color = Color.black; // 字体颜色为黑色  
                buttons[i].GetComponent<Image>().enabled = true; // 启用背景  
            }
            else
            {
                // 没有选中的按钮时保持默认状态  
                buttons[i].GetComponentInChildren<Text>().color = Color.grey; // 字体颜色为灰色  
                buttons[i].GetComponent<Image>().enabled = false; // 禁用背景  
            }
        }
    }

    private void OnMouseEnterButton(int index)
    {
        // 当鼠标进入按钮时，将其设置为选中  
        selectedIndex = index;
        UpdateButtonSelection();
    }

    private void OnMouseExitButton(int index)
    {
        // 当鼠标离开按钮时，将其状态重置（'-1' 表示没有选中）  
        if (selectedIndex == index)
        {
            selectedIndex = -1;
            UpdateButtonSelection();
        }
    }

    private void OnButtonClick(int index)
    {
        // 播放点击音效  
        AudioManager.instance.PlayFX("点击音效");
    }
}
