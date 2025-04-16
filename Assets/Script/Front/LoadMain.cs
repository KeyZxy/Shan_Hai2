using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LoadMain : MonoBehaviour
{
    public Fade fade;
    
    // 使用协程实现延迟加载游戏场景  
    private IEnumerator Start()
    {
        // 等待 3 秒  
        yield return new WaitForSeconds(3f);

        // 切换到游戏场景
        //AudioManager.instance.StopAll();
        fade.StartFadeAndLoadScene("Level1_1 1"); 

    
    }

}
