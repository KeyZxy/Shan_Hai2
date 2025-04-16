using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MainMenu : MonoBehaviour
{
    public GameObject startsc;
    public GameObject jijinsheng;
    public GameObject rulunhui;
    public GameObject xuqianyuan;
    public GameObject xuqianyuanPanel;
    public Fade fade;
    // Start is called before the first frame update
    void Start()
    {
        //Screen.SetResolution(3840, 2160, true);
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
        jijinsheng.SetActive(false);
        xuqianyuan.SetActive(false);
        xuqianyuanPanel.SetActive(false);
        rulunhui.SetActive(false);
        startsc.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void OpenStart()
    {
        startsc.SetActive (true);
    }
    public void OpenJijinsheng()
    {
        startsc.SetActive(false);
        jijinsheng.SetActive (true);
    }
    public void Closejijinsheng()
    {
        jijinsheng.SetActive (false);
    }
    public void OpenRu()
    {
        startsc.SetActive(false);
        rulunhui.SetActive(true);
    }
    public void Closeru()
    {
            rulunhui.SetActive(false);
    }
    public void Ru()
    {
        fade.StartFadeAndLoadScene("Loading");
    }
    public void ShanHaijing()
    {
        fade.StartFadeAndLoadScene("YingShen");
    }
    public void Tuandui()
    {
        fade.StartFadeAndLoadScene("Team");
    }
    public void OpenXu()
    {
        startsc.SetActive(false);
        xuqianyuan.SetActive(true) ;
    }
    public void Backxu()
    {
        startsc.SetActive(true);
        xuqianyuan.SetActive(false);
    }
    public void OpenXupanel()
    {
        xuqianyuanPanel.SetActive(true);
    }
    public void CloseXupanel() 
    { 
        xuqianyuanPanel.SetActive(false) ;
    }
    
    // �˳���Ϸ  
    public void QuitGame()
    {
        Debug.Log("Quitting game...");
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;

#if UNITY_EDITOR
        // ����ڱ༭���У�ֹͣ����ģʽ  
        UnityEditor.EditorApplication.isPlaying = false;
#else
        // ����ڹ�������Ϸ�У��˳�Ӧ�ó���  
        Application.Quit();  
#endif
    }
}
