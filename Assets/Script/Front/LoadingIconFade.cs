using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class LoadingIconFade : MonoBehaviour
{
    private Image loadingIcon; // ������ʾ����ͼ��  

    public Sprite startSprite; // ���俪ʼʱ��ͼ��  
    public Sprite endSprite;   // �������ʱ��ͼ��  
    public float fadeDuration = 1.0f; // �������ʱ��  

    void Start()
    {
        loadingIcon = GetComponent<Image>();
        loadingIcon.sprite = startSprite; // ��ʼ��Ϊ��ʼͼ��  
        StartCoroutine(FadeInOut());
    }

    private IEnumerator FadeInOut()
    {
        Color color = loadingIcon.color;

        while (true) // ����ѭ��  
        {
            // �𽥵���  
            for (float t = 0; t <= fadeDuration; t += Time.deltaTime)
            {
                // ��ֵͼ��  
                loadingIcon.sprite = startSprite;

                // ����ʱ�� t ��ֵ��ɫ͸����  
                color.a = Mathf.Lerp(0, 1, t / fadeDuration);
                loadingIcon.color = color;

                yield return null;
            }

            // ����Ϊ����ͼ�����𽥵���  
            loadingIcon.sprite = endSprite; // �л�������ͼ��  

            // �𽥵���  
            for (float t = 0; t <= fadeDuration; t += Time.deltaTime)
            {
                color.a = Mathf.Lerp(1, 0, t / fadeDuration);
                loadingIcon.color = color;

                yield return null;
            }

            // �ָ�Ϊ��ʼ״̬  
            loadingIcon.sprite = startSprite; // �л��ؿ�ʼͼ��  
            color.a = 0; // ͸��������  
            loadingIcon.color = color;
        }
    }
}