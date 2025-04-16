using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Anim_Kun : MonoBehaviour
{
    public List<Animator> animators; // 存储 Animator 列表  
    private List<Animator> unusedAnimators; // 尚未使用的 Animator 列表  
    public float time = 0f; // 计时器  
    public float freshtime = 5f; // 动画切换时间  
    private Animator currentAnimator; // 当前播放的 Animator  
    string[] footstepSounds = { "鲲1", "鲲2", "鲲3"};
    void Start()
    {
        int randomIndex = UnityEngine.Random.Range(0, footstepSounds.Length);
        AudioManager.instance.PlayFX(footstepSounds[randomIndex]);
        // 初始化所有 Animator 为禁用状态，并复制到 unused 列表
        foreach (var animator in animators)
        {
            animator.enabled = false;
        }

        unusedAnimators = new List<Animator>(animators);
    }

    void Update()
    {
        time += Time.deltaTime; // 增加计时器  
        if (time > freshtime)
        {
            time = 0; // 重置时间  
            PlayRandomAnimation(); // 播放随机动画  
        }
    }

    void PlayRandomAnimation()
    {
        // 如果所有动画都播放过一轮，重新开始新一轮
        if (unusedAnimators.Count == 0)
        {
            unusedAnimators = new List<Animator>(animators);
        }

        if (unusedAnimators.Count > 0)
        {
            // 如果有当前 Animator，禁用它  
            if (currentAnimator != null)
            {
                currentAnimator.enabled = false;
            }

            // 随机选择一个未使用的 Animator  
            int index = UnityEngine.Random.Range(0, unusedAnimators.Count);
            currentAnimator = unusedAnimators[index];

            // 启用并播放动画状态
            currentAnimator.enabled = true;
            int randomIndex = UnityEngine.Random.Range(0, footstepSounds.Length);
            AudioManager.instance.PlayFX(footstepSounds[randomIndex]);
            currentAnimator.Play(0, -1, 0); // 第0个layer，重置时间为0

            // 从未使用列表中移除  
            unusedAnimators.RemoveAt(index);
        }
    }

}
