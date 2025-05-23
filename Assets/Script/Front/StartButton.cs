using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class StartButton : MonoBehaviour
{
    public Button[] buttons; // 存储所有按钮  
    public GameObject[] tooltip; // 用于显示提示的图片  
    private int selectedIndex = -1; // 当前选中的按钮索引，初始为 -1 表示没有选中  

    // Start is called before the first frame update  
    void Start()
    {
        // 初始时隐藏所有提示  
        for (int i = 0; i < tooltip.Length; i++)
        {
            tooltip[i].SetActive(false);
        }

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
        if (Input.GetKeyDown(KeyCode.Return) && selectedIndex >= 0 && selectedIndex < buttons.Length)
        {
            buttons[selectedIndex].onClick.Invoke();
        }
    }
    private void OnMouseEnterButton(int i)
    {
        // 当鼠标进入按钮时，将其设置为选中  
        selectedIndex = i;
        tooltip[i].SetActive(true); // 显示提示  
    }

    private void OnMouseExitButton(int i)
    {
        // 当鼠标离开按钮时，将其状态重置  
        if (selectedIndex == i)
        {
            selectedIndex = -1;
            tooltip[i].SetActive(false); // 隐藏提示  
        }
    }

  
}