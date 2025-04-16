using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class D_Anim : MonoBehaviour
{
    private Animator anim;
    private Anim_state Current_anim;


    // Start is called before the first frame update
    void Start()
    {
        anim = transform.Find("Body").transform.GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void change_anim(Anim_state state)
    {
        if (state == Current_anim)
            return;
        switch (state)
        {
            case Anim_state.D_Wake:
                anim.SetInteger("Anim_state", 2);
                break;
            case Anim_state.D_Sleep:
                anim.SetInteger("Anim_state", 1);
                break;
            case Anim_state.D_Idle:
                anim.SetInteger("Anim_state", 0);
                break;
        }
    }
}
