using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Pause : MonoBehaviour
{
    public GameObject pauseMenuUI; // 暂停菜单的UI面板
    public GameObject YingshentuUI; // 暂停菜单的UI面板

    private Camera_move _cam;
    private C_base _base;
    public Fade fade;

    public GameObject upp;
    void Start()
    {
        _cam = GameObject.Find("Main Camera").transform.GetComponent<Camera_move>();
        _base = GameObject.FindGameObjectWithTag(SaveKey.Character).GetComponent<C_base>();
        YingshentuUI.SetActive(false);
        
    }

    void Update()
    {
        if (_base.isDie)
        {
            pauseMenuUI.SetActive(false);
            return;
        }
        // 按下ESC键时触发暂停  
        if (Input.GetKeyDown(KeyCode.Escape))
        {

                Paused();
            
        }
    }

    // 恢复游戏  
    public void Resume()
    {
        pauseMenuUI.SetActive(false); // 隐藏暂停菜单
        if (upp.activeSelf)
        {
             Time.timeScale = 0f;          // 暂停游戏时间流动  
            _cam.Set_Paused(true);
            _base.Set_Paused(true);
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
        }
        else
        {
         Time.timeScale = 1f;          // 恢复游戏时间流动  
        _cam.Set_Paused(false);
        _base.Set_Paused(false);
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
        }
    }

    // 暂停游戏  
    void Paused()
    {
        pauseMenuUI.SetActive(true);  // 显示暂停菜单  
        Time.timeScale = 0f;          // 暂停游戏时间流动  
        _cam.Set_Paused(true);
        _base.Set_Paused(true);
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
    }
    public void LoadYingshentu()
    {
        YingshentuUI.SetActive(true );
        Time.timeScale = 0f;          // 暂停游戏时间流动  
        _cam.Set_Paused(true);
        _base.Set_Paused(true);
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
    }
    public void LoadYingshentuBack()
    {
        YingshentuUI.SetActive(false);
        
    }
    // 退出游戏  
    public void QuitGame()
    {
        pauseMenuUI.SetActive(false); // 隐藏暂停菜单  
        Time.timeScale = 1f;          // 恢复游戏时间流动  
        fade.StartFadeAndLoadScene("MainMenu");
        AudioManager.instance.StopAll();
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
    }
    //死亡结算
    public void Ondeath()
    {
        AudioManager.instance.StopAll();
        fade.StartFadeAndLoadScene("Level0_Daoguan");
    }
}