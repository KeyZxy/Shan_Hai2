using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class DialogueManager : MonoBehaviour
{
    public static DialogueManager instance;
    
    //��E
    public Text mulu1;
    public Text zhengwen1;
    public GameObject talkUI;
    
    //����
    public GameObject panel;
    private float fadeDuration; // ��������ʱ��  
    private CanvasGroup canvasGroup;
    public Text mulu2;
    public Text zhengwen2;

    //�ٻ�����
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
            canvasGroup = panel.gameObject.AddComponent<CanvasGroup>(); // ���û��CanvasGroup�������һ��  
        }
        panel.SetActive(false);
        destroyUI.SetActive(false);
    }
    //��E
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
    //����
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

        // ȷ����ȫ͸��  
        canvasGroup.alpha = 0;
        panel.SetActive(false);
    }
    //�ٻ�
    public void ShowText2(float survivalTime)
    {
        if (AudioManager.instance.IsPlaying("����"))
        {
            AudioManager.instance.Stop("����");
            AudioManager.instance.PlayWaterBGM("ս��");
        }
        destroyUI.SetActive(true);
        StartCoroutine(Countdown(survivalTime));
        
    }

    public void HideText2()
    {
        destroyUI.SetActive(false);
        if (AudioManager.instance.IsPlaying("ս��"))
        {
            AudioManager.instance.Stop("ս��");
            AudioManager.instance.PlayWaterBGM("����");
        }
    }
    private IEnumerator Countdown(float time)
    {
        float remainingTime = time;

        while (remainingTime > 0)
        {
            destr.text = FormatTime(remainingTime);
            yield return new WaitForSeconds(1f); // ÿ�����һ��  
            remainingTime--;
        }

        destr.text = "00:00"; // ����ʱ����ʱ��ʾ
        HideText2();

    }
    private string FormatTime(float time)
    {
        int minutes = Mathf.FloorToInt(time / 60); // ת������  
        int seconds = Mathf.FloorToInt(time % 60); // ת����  
        return string.Format("{0:00}:{1:00}", minutes, seconds);
    }
}
