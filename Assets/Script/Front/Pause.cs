using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Pause : MonoBehaviour
{
    public GameObject pauseMenuUI; // ��ͣ�˵���UI���
    public GameObject YingshentuUI; // ��ͣ�˵���UI���

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
        // ����ESC��ʱ������ͣ  
        if (Input.GetKeyDown(KeyCode.Escape))
        {

                Paused();
            
        }
    }

    // �ָ���Ϸ  
    public void Resume()
    {
        pauseMenuUI.SetActive(false); // ������ͣ�˵�
        if (upp.activeSelf)
        {
             Time.timeScale = 0f;          // ��ͣ��Ϸʱ������  
            _cam.Set_Paused(true);
            _base.Set_Paused(true);
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
        }
        else
        {
         Time.timeScale = 1f;          // �ָ���Ϸʱ������  
        _cam.Set_Paused(false);
        _base.Set_Paused(false);
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
        }
    }

    // ��ͣ��Ϸ  
    void Paused()
    {
        pauseMenuUI.SetActive(true);  // ��ʾ��ͣ�˵�  
        Time.timeScale = 0f;          // ��ͣ��Ϸʱ������  
        _cam.Set_Paused(true);
        _base.Set_Paused(true);
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
    }
    public void LoadYingshentu()
    {
        YingshentuUI.SetActive(true );
        Time.timeScale = 0f;          // ��ͣ��Ϸʱ������  
        _cam.Set_Paused(true);
        _base.Set_Paused(true);
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
    }
    public void LoadYingshentuBack()
    {
        YingshentuUI.SetActive(false);
        
    }
    // �˳���Ϸ  
    public void QuitGame()
    {
        pauseMenuUI.SetActive(false); // ������ͣ�˵�  
        Time.timeScale = 1f;          // �ָ���Ϸʱ������  
        fade.StartFadeAndLoadScene("MainMenu");
        AudioManager.instance.StopAll();
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
    }
    //��������
    public void Ondeath()
    {
        AudioManager.instance.StopAll();
        fade.StartFadeAndLoadScene("Level0_Daoguan");
    }
}