using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Anim_Kun : MonoBehaviour
{
    public List<Animator> animators; // �洢 Animator �б�  
    private List<Animator> unusedAnimators; // ��δʹ�õ� Animator �б�  
    public float time = 0f; // ��ʱ��  
    public float freshtime = 5f; // �����л�ʱ��  
    private Animator currentAnimator; // ��ǰ���ŵ� Animator  
    string[] footstepSounds = { "��1", "��2", "��3"};
    void Start()
    {
        int randomIndex = UnityEngine.Random.Range(0, footstepSounds.Length);
        AudioManager.instance.PlayFX(footstepSounds[randomIndex]);
        // ��ʼ������ Animator Ϊ����״̬�������Ƶ� unused �б�
        foreach (var animator in animators)
        {
            animator.enabled = false;
        }

        unusedAnimators = new List<Animator>(animators);
    }

    void Update()
    {
        time += Time.deltaTime; // ���Ӽ�ʱ��  
        if (time > freshtime)
        {
            time = 0; // ����ʱ��  
            PlayRandomAnimation(); // �����������  
        }
    }

    void PlayRandomAnimation()
    {
        // ������ж��������Ź�һ�֣����¿�ʼ��һ��
        if (unusedAnimators.Count == 0)
        {
            unusedAnimators = new List<Animator>(animators);
        }

        if (unusedAnimators.Count > 0)
        {
            // ����е�ǰ Animator��������  
            if (currentAnimator != null)
            {
                currentAnimator.enabled = false;
            }

            // ���ѡ��һ��δʹ�õ� Animator  
            int index = UnityEngine.Random.Range(0, unusedAnimators.Count);
            currentAnimator = unusedAnimators[index];

            // ���ò����Ŷ���״̬
            currentAnimator.enabled = true;
            int randomIndex = UnityEngine.Random.Range(0, footstepSounds.Length);
            AudioManager.instance.PlayFX(footstepSounds[randomIndex]);
            currentAnimator.Play(0, -1, 0); // ��0��layer������ʱ��Ϊ0

            // ��δʹ���б����Ƴ�  
            unusedAnimators.RemoveAt(index);
        }
    }

}
