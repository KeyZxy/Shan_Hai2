using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Talk : MonoBehaviour
{
    public string biaoti;    // 对话标题  
    public string zhengwen;  // 对话内容  
    public UIFollow uiFollow; // 用于存储当前 Talk 用的 UIFollow 实例 **  

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
            // 确保被触发时激活 UI  
            if (uiFollow != null)
            {
                uiFollow.Init(
                    Camera.main,
                    transform,
                    GameObject.FindObjectOfType<Canvas>()
                );
                uiFollow.gameObject.SetActive(true);  // 显示 UI  
            }
        }
    }

    private void OnTriggerExit(Collider collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {
            // 隐藏 UI 并清除对话  
            if (uiFollow != null)
            {
                uiFollow.gameObject.SetActive(false); // 隐藏 UI  
            }
            DialogueManager.instance.HideText();
        }
    }

    private void Update()
    {
        // 只在 UI 显示时检测用户输入  
        if (uiFollow != null && uiFollow.gameObject.activeSelf && Input.GetKeyDown(KeyCode.E))
        {
            DialogueManager.instance.ShowText(biaoti, zhengwen);
        }
    }
}