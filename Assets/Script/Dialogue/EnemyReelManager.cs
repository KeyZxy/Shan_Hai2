using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class EnemyReelManager : MonoBehaviour
{
    public static EnemyReelManager instance;
    public Image image;
    public Text text1;
    public Text text2;
    public Text text3;
    public Text text4;
    // Start is called before the first frame update
    void Start()
    {
        if (instance == null)
        {
            instance = this;
        }
    }

    public void Show(Sprite im, string t1,string t2, string t3, string t4)
    {

        image.sprite = im;
        string T1, T2, T3, T4;
        T1 = t1.Replace("n", "\n");
        T2 = t2.Replace("n", "\n");
        T3 = t3.Replace("n", "\n");
        T4 = t4.Replace("n", "\n");
        text1.text = T1; 
        text2.text = T2; 
        text3.text = T3; 
        text4 .text= T4;
    }
}
