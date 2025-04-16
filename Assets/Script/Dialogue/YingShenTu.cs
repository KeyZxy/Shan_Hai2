using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class YingShenTu : MonoBehaviour
{
    public Fade fade;
    public GameObject shanhaijingjuan;
    public GameObject renwu;
    public GameObject qiwu;
    public GameObject mifa;

    void Start()
    {
        shanhaijingjuan.SetActive(false);
        renwu.SetActive(false);
        qiwu.SetActive(false);
        mifa.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void Mifa()
    {
        mifa.SetActive(true);
    }
    public void MifaBack()
    {
        mifa.SetActive(false);
    }
    public void Renwu() { 
        renwu.SetActive(true);
    }
    public void RenwuBack()
    {
        renwu.SetActive(false);
    }
    public void Qiwu()
    {
        qiwu.SetActive(true);
    }
    public void QiwuBack()
    {
        qiwu.SetActive(false);
    }
    public void Shanhaijingjuan()
    {
        shanhaijingjuan.SetActive(true);
    }
    public void ShanhaijingjuanBack()
    {
        shanhaijingjuan.SetActive(false );
    }

    public void BackToMain()
    {
        fade.StartFadeAndLoadScene("MainMenu");
    }
}
