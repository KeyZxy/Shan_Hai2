using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class D_Animplay : MonoBehaviour
{
    public D_Anim dragon;
    private void Start()
    {
        //dragon=GameObject.Find("Dragon").transform.Find("Body").transform.GetComponent<D_Anim>();
    }
    private void OnTriggerEnter(Collider collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {

            dragon.change_anim(Anim_state.D_Wake);

        }
    }
}
