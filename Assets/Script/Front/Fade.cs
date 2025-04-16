using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Fade : MonoBehaviour
{
    public GameObject panel; // UI ���  
    public float fadeDuration = 2f; // ��������ʱ��  
    private CanvasGroup canvasGroup; // CanvasGroup ���������
    // Use this for initialization
    void Start()
    {

        canvasGroup = panel.GetComponent<CanvasGroup>();
        if (canvasGroup == null)
        {
            canvasGroup = panel.gameObject.AddComponent<CanvasGroup>(); // ���û��CanvasGroup�������һ��
        }

        StartCoroutine(FadeInCoroutine());

    }

    public void StartFadeAndLoadScene(string sceneName)
    {
        StartCoroutine(FadeOutAndLoadScene(sceneName));
    }
    private IEnumerator FadeOutAndLoadScene(string sceneName)
    {
        // ����  
        yield return StartCoroutine(FadeOutCoroutine());

        // �л�����  
        SceneManager.LoadScene(sceneName);
    }
    private IEnumerator FadeOutCoroutine()
    {
        panel.SetActive(true);
        float targetAlpha = 1f; // Ŀ��͸����Ϊ1  

        // ���䵽�ɼ�  
        for (float t = 0; t < fadeDuration; t += Time.deltaTime)
        {
            float normalizedTime = t / fadeDuration;
            canvasGroup.alpha = Mathf.Lerp(0, targetAlpha, normalizedTime);
            yield return null;
        }

        canvasGroup.alpha = targetAlpha;
    }

    private IEnumerator FadeInCoroutine()
    {
        float startAlpha = canvasGroup.alpha; // ��ȡ��ǰ͸����  

        // ���䵽���ɼ�  
        for (float t = 0; t < fadeDuration; t += Time.deltaTime)
        {
            float normalizedTime = t / fadeDuration;
            canvasGroup.alpha = Mathf.Lerp(startAlpha, 0, normalizedTime);
            yield return null;
        }

        // ȷ����ȫ���ɼ�  
        canvasGroup.alpha = 0;
        panel.SetActive(false);
    }


}


   
