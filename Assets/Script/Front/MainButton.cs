using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class MainButton : MonoBehaviour
{
    public Button[] buttons; // 存储所有按钮  
    private int selectedIndex = 0; // 当前选中的按钮索引，初始为 -1 表示没有选中  
 
    private void Start()
    {
        UpdateButtonSelection();

        // 为每个按钮设置鼠标事件  
        for (int i = 0; i < buttons.Length; i++)
        {
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

        }
    }

    private void Update()
    {
        // 使用 A/D 键切换按钮  
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

        // 确保索引在有效范围内   
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
                // 有选中的按钮时更改状态  
                buttons[i].GetComponentInChildren<Text>().color = Color.white; // 字体颜色为白色  
                buttons[i].GetComponent<Image>().enabled = true; // 启用背景  

            }
            else
            {
                // 没有选中的按钮时保持默认状态  
                buttons[i].GetComponentInChildren<Text>().color = Color.black; // 字体颜色为黑色  
                buttons[i].GetComponent<Image>().enabled = false; // 禁用背景  
            }
        }
    }

    private void OnMouseEnterButton(int index)
    {
        // 当鼠标进入按钮时，将其设置为选中  
        selectedIndex = index; // 记录最后进入的按钮索引
        UpdateButtonSelection();
    }

    private void OnMouseExitButton(int index)
    {
        //AudioManager.instance.PlayFX("划过音效");
        //// 当鼠标离开按钮时，将其状态重置（'-1' 表示没有选中）  
        //if (selectedIndex == index)
        //{
        //    selectedIndex = -1;
        //    UpdateButtonSelection();
        //}
    }

   

}