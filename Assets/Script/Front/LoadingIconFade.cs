using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class LoadingIconFade : MonoBehaviour
{
    private Image loadingIcon; // 用于显示加载图标  

    public Sprite startSprite; // 渐变开始时的图案  
    public Sprite endSprite;   // 渐变结束时的图案  
    public float fadeDuration = 1.0f; // 渐变持续时间  

    void Start()
    {
        loadingIcon = GetComponent<Image>();
        loadingIcon.sprite = startSprite; // 初始化为开始图案  
        StartCoroutine(FadeInOut());
    }

    private IEnumerator FadeInOut()
    {
        Color color = loadingIcon.color;

        while (true) // 无限循环  
        {
            // 逐渐淡入  
            for (float t = 0; t <= fadeDuration; t += Time.deltaTime)
            {
                // 插值图案  
                loadingIcon.sprite = startSprite;

                // 根据时间 t 插值颜色透明度  
                color.a = Mathf.Lerp(0, 1, t / fadeDuration);
                loadingIcon.color = color;

                yield return null;
            }

            // 设置为结束图案并逐渐淡出  
            loadingIcon.sprite = endSprite; // 切换到结束图案  

            // 逐渐淡出  
            for (float t = 0; t <= fadeDuration; t += Time.deltaTime)
            {
                color.a = Mathf.Lerp(1, 0, t / fadeDuration);
                loadingIcon.color = color;

                yield return null;
            }

            // 恢复为初始状态  
            loadingIcon.sprite = startSprite; // 切换回开始图案  
            color.a = 0; // 透明度重置  
            loadingIcon.color = color;
        }
    }
}