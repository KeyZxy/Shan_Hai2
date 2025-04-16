using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class DialogueManager : MonoBehaviour
{
    public static DialogueManager instance;
    
    //按E
    public Text mulu1;
    public Text zhengwen1;
    public GameObject talkUI;
    
    //经过
    public GameObject panel;
    private float fadeDuration; // 渐淡持续时间  
    private CanvasGroup canvasGroup;
    public Text mulu2;
    public Text zhengwen2;

    //毁坏卷轴
    public GameObject destroyUI;
    public Text destr;
    void Start()
    {
        if (instance == null)
        {
            instance = this;
        }
        talkUI.SetActive(false);
        canvasGroup = panel.GetComponent<CanvasGroup>();
        if (canvasGroup == null)
        {
            canvasGroup = panel.gameObject.AddComponent<CanvasGroup>(); // 如果没有CanvasGroup，则添加一个  
        }
        panel.SetActive(false);
        destroyUI.SetActive(false);
    }
    //按E
    public void ShowText(string text1,string text2)
    {
        mulu1.text = text1;
        zhengwen1.text = text2;  
        talkUI.SetActive(true);
    }
    public void HideText()
    {
        talkUI.SetActive(false);
    }
    //经过
    public void ShowText1(string text1, string text2,float fd)
    {
        mulu2.text = text1;
        zhengwen2.text = text2;
        fadeDuration = fd;
        panel.SetActive(true);
        canvasGroup.alpha = 1;
        
        
    }
    public void HideText1()
    {
       StartCoroutine(FadeOutCoroutine());
    }
    private IEnumerator FadeOutCoroutine()
    {
        float startAlpha = canvasGroup.alpha;

        for (float t = 0; t < fadeDuration; t += Time.deltaTime)
        {
            float normalizedTime = t / fadeDuration;
            canvasGroup.alpha = Mathf.Lerp(startAlpha, 0, normalizedTime);
            yield return null;
        }

        // 确保完全透明  
        canvasGroup.alpha = 0;
        panel.SetActive(false);
    }
    //毁坏
    public void ShowText2(float survivalTime)
    {
        if (AudioManager.instance.IsPlaying("背景"))
        {
            AudioManager.instance.Stop("背景");
            AudioManager.instance.PlayWaterBGM("战斗");
        }
        destroyUI.SetActive(true);
        StartCoroutine(Countdown(survivalTime));
        
    }

    public void HideText2()
    {
        destroyUI.SetActive(false);
        if (AudioManager.instance.IsPlaying("战斗"))
        {
            AudioManager.instance.Stop("战斗");
            AudioManager.instance.PlayWaterBGM("背景");
        }
    }
    private IEnumerator Countdown(float time)
    {
        float remainingTime = time;

        while (remainingTime > 0)
        {
            destr.text = FormatTime(remainingTime);
            yield return new WaitForSeconds(1f); // 每秒更新一次  
            remainingTime--;
        }

        destr.text = "00:00"; // 倒计时结束时显示
        HideText2();

    }
    private string FormatTime(float time)
    {
        int minutes = Mathf.FloorToInt(time / 60); // 转换分钟  
        int seconds = Mathf.FloorToInt(time % 60); // 转换秒  
        return string.Format("{0:00}:{1:00}", minutes, seconds);
    }
}
