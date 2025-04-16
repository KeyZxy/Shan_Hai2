using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Cube : MonoBehaviour
{
    public string biaoti;
    public string zhengwen;
    public float fadeDuration;
    // Start is called before the first frame update

    private void OnTriggerEnter(Collider collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {

            DialogueManager.instance.ShowText1(biaoti,zhengwen,fadeDuration);

        }
    }
    private void OnTriggerExit(Collider collision) {
        if (collision.gameObject.CompareTag("Player"))
        {

            DialogueManager.instance.HideText1();

        }
    }
}
