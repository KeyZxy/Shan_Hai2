using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class J_Anim : MonoBehaviour
{
    private Animator anim;
    private Anim_state Current_anim;


    // Start is called before the first frame update
    void Start()
    {
        anim =this.GetComponent<Animator>();
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
            case Anim_state.Idle3:
                anim.SetInteger("Anim_state", 0);
                break;
            case Anim_state.Open:
                anim.SetInteger("Anim_state", 1);
                break;
            case Anim_state.Close:
                anim.SetInteger("Anim_state", 2);
                break;

        }
    }

}
