using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Zhizuoloadmain : MonoBehaviour
{
    public Fade fade;
    public void BackTuandui()
    {
        fade.StartFadeAndLoadScene("MainMenu");
    }
}
