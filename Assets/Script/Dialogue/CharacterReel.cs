using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterReel : MonoBehaviour
{
    public Sprite[] images;
    public string[] biaoti;
    public string[] shiju;
    public string[] zhengwen;
    public string[] shuxing;

    public void Yunyouzi()
    {
        CharacterReelManager.instance.Show(images[0], biaoti[0], shiju[0], zhengwen[0], shuxing[0]);
    }
}
