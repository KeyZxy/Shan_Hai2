using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShopLoadMain : MonoBehaviour
{
    public Fade fade;
    private void OnTriggerEnter(Collider collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {

            fade.StartFadeAndLoadScene("Level1_1 1");

        }
    }
}
