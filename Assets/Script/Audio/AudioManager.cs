using UnityEngine;
using UnityEngine.Audio;
using System.Collections;
public class AudioManager : MonoBehaviour
{
    /// <summary>
    /// 获得AudioManager的单例
    /// </summary>
    public static AudioManager instance;

    [Header("音频类型")]
    public AudioType[] AudioTypes;  // 音频类型数组,存放需要播放的音频


    private void Awake()
    {
        // 检查是否已经有实例存在  
        if (instance != null && instance != this)
        {
            Destroy(gameObject); // 如果已经存在，销毁新创建的实例  
            return;
        }

        // 设置当前实例为单例  
        instance = this;
        DontDestroyOnLoad(gameObject);  // 保证在场景切换时不被销毁  
    }
    private void OnEnable()
    {
        foreach (var type in AudioTypes)    // 遍历AudioTypes数组进行初始化
        {
            type.Source = gameObject.AddComponent<AudioSource>();    // 在调用了AudioManager的脚本的GameObject上添加AudioSource(喇叭)组件

            type.Source.name = type.Name;    // 设置AudioSource的名字
            type.Source.volume = type.Volume;    // 音量
           
            type.Source.loop = type.Loop;    // 是否循环播放
            type.Source.playOnAwake = type.PlayOnAwake;    // 是否在Awake时自动播放

            type.Source.enabled = true;
        }
    }
    public void PlayBGM(string name)    // 播放音频时调用
    {

        foreach (AudioType type in AudioTypes)    // 遍历AudioTypes数组
        {
            type.Source.Stop();    // 停止所有音频
        }

        foreach (AudioType type in AudioTypes) // 遍历AudioTypes数组
        {
            if (type.Name == name) // 如果找到名字name对应的音频
            {
                type.Source.clip = type.Clip; // 设置音频Clip
                type.Source.Play(); // 播放音频
                return;
            }
        }

        //Debug.Log("没有找到" + name + "音频");    // 没找到音频时输出错误信息
    }
    public void PlayWaterBGM(string name)
    {
        foreach (AudioType type in AudioTypes) // 遍历AudioTypes数组
        {
            if (type.Name == name) // 如果找到名字name对应的音频
            {
                type.Source.clip = type.Clip; // 设置音频Clip
                type.Source.Play(); // 播放音频
                return;
            }
        }
    }
    
    public void PlayFX(string name) // 播放音效时调用
    {
        foreach (AudioType type in AudioTypes)    // 遍历AudioTypes数组
        {
            if (type.Name == name)    // 如果找到名字name对应的音频
            {
                type.Source.PlayOneShot(type.Clip);    // 播放音效
                return;
            }
        }

    //    Debug.LogError("没有找到" + name + "音效");    // 没找到音效时输出错误信息
    }

    public void Pause(string name)    // 暂停音频时调用
    {
        foreach (AudioType type in AudioTypes)    // 遍历AudioTypes数组
        {
            if (type.Name == name)
            {
                type.Source.Pause();    // 暂停音频
                return;
            }
        }

       // Debug.LogError("没有找到" + name + "音频");
    }

    public void Stop(string name)    // 停止音频时调用
    {
        foreach (AudioType type in AudioTypes)    // 遍历AudioTypes数组
        {
            if (type.Name == name)
            {
                type.Source.Stop();    // 停止音频
                return;
            }
        }

       // Debug.LogError("没有找到" + name + "音频");
    }

    public void StopAll()    // 停止所有音频时调用
    {
        foreach (AudioType type in AudioTypes)    // 遍历AudioTypes数组
        {
            type.Source.Stop();    // 停止音频   
        }

       // Debug.LogError("没有找到" + name + "音频");
    }

    public bool IsPlaying(string name) // 判断音频是否正在播放
    {
        foreach (AudioType type in AudioTypes)
        {
            if (type.Name == name)
            {
                return type.Source.isPlaying;
            }
        }

        //Debug.LogError("没有找到" + name + "音频");
        return false;
    }



}