using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Fade : MonoBehaviour
{
    public GameObject panel; // UI 面板  
    public float fadeDuration = 2f; // 渐淡持续时间  
    private CanvasGroup canvasGroup; // CanvasGroup 组件的引用
    // Use this for initialization
    void Start()
    {

        canvasGroup = panel.GetComponent<CanvasGroup>();
        if (canvasGroup == null)
        {
            canvasGroup = panel.gameObject.AddComponent<CanvasGroup>(); // 如果没有CanvasGroup，则添加一个
        }

        StartCoroutine(FadeInCoroutine());

    }

    public void StartFadeAndLoadScene(string sceneName)
    {
        StartCoroutine(FadeOutAndLoadScene(sceneName));
    }
    private IEnumerator FadeOutAndLoadScene(string sceneName)
    {
        // 渐出  
        yield return StartCoroutine(FadeOutCoroutine());

        // 切换场景  
        SceneManager.LoadScene(sceneName);
    }
    private IEnumerator FadeOutCoroutine()
    {
        panel.SetActive(true);
        float targetAlpha = 1f; // 目标透明度为1  

        // 渐变到可见  
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
        float startAlpha = canvasGroup.alpha; // 获取当前透明度  

        // 渐变到不可见  
        for (float t = 0; t < fadeDuration; t += Time.deltaTime)
        {
            float normalizedTime = t / fadeDuration;
            canvasGroup.alpha = Mathf.Lerp(startAlpha, 0, normalizedTime);
            yield return null;
        }

        // 确保完全不可见  
        canvasGroup.alpha = 0;
        panel.SetActive(false);
    }


}


   
