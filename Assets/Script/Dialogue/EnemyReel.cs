using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class EnemyReel : MonoBehaviour
{
    public Sprite[] images;
    public string[] biaoti;
    public string[] shiju;
    public string[] zhengwen;
    public string[] shuxing;

    public void Guan()
    {
        EnemyReelManager.instance.Show(images[0], biaoti[0], shiju[0], zhengwen[0], shuxing[0]);
    }
    public void Fu()
    {
        EnemyReelManager.instance.Show(images[1], biaoti[1], shiju[1], zhengwen[1], shuxing[1]);
    }
    public void  Feng()
    {
        EnemyReelManager.instance.Show(images[2], biaoti[2], shiju[2], zhengwen[2], shuxing[2]);
    }
    public void Kun()
    {
        EnemyReelManager.instance.Show(images[3], biaoti[3], shiju[3], zhengwen[3], shuxing[3]);
    }
    public void Hun()
    {
        EnemyReelManager.instance.Show(images[4], biaoti[4], shiju[4], zhengwen[4], shuxing[4]);
    }
    public void Long()
    {
        EnemyReelManager.instance.Show(images[5], biaoti[5], shiju[5], zhengwen[5], shuxing[5]);
    }
}
