using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Qiwu : MonoBehaviour
{
    public GameObject[] qiwus;
    public string[] biaoti;
    public string[] shiju;
    public string[] zhengwen;
    public string[] shuxing;

    void Start()
    {
        foreach (var item in qiwus)
        {
            item.SetActive(false);
        }
    }

   public void Qin()
    {
        for(int i = 0; i < qiwus.Length; i++)
        {
            if (i == 0)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[0], shiju[0], zhengwen[0], shuxing[0]);
    }

    public void Ying()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 1)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[1], shiju[1], zhengwen[1], shuxing[1]);
    }

    public void Ruyi()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 2)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[2], shiju[2], zhengwen[2], shuxing[2]);
    }

    public void Jiake()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 3)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[3], shiju[3], zhengwen[3], shuxing[3]);
    }
    public void Zhu()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 4)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[4], shiju[4], zhengwen[4], shuxing[4]);
    }

    public void Yazhui()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 5)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[5], shiju[5], zhengwen[5], shuxing[5]);
    }

    public void Hu()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 6)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[6], shiju[6], zhengwen[6], shuxing[6]);
    }
    public void Ling()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 7)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[7], shiju[7], zhengwen[7], shuxing[7]);
    }
    public void Nang()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 8)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[8], shiju[8], zhengwen[8], shuxing[8]);
    }
    public void Yan()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 9)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[9], shiju[9], zhengwen[9], shuxing[9]);
    }
    public void Cai()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 10)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[10], shiju[10], zhengwen[10], shuxing[10]);
    }
    public void Shan()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 11)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[11], shiju[11], zhengwen[11], shuxing[11]);
    }
    public void Tai()
    {
        for (int i = 0; i < qiwus.Length; i++)
        {
            if (i == 12)
            {
                qiwus[i].SetActive(true);
            }
            else
            {
                qiwus[i].SetActive(false);
            }
        }
        QiwuManager.instance.Show(biaoti[12], shiju[12], zhengwen[12], shuxing[12]);
    }
}
