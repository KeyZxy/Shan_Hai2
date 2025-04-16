using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class deer_sprint_sc : MonoBehaviour
{

    private biology_info source_info;
    private Player_skill_class source_skill;
    private bool shockware = false;
    private float moveDistance = 10f;   // 要移动的距离
    private float moveSpeed = 20f;      // 移动速度
    private Vector3 targetPos;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if(shockware)
        {
            transform.position = Vector3.MoveTowards(transform.position, targetPos, moveSpeed * Time.deltaTime);

            // 到达目标位置
            if (Vector3.Distance(transform.position, targetPos) < 0.01f)
            {
                shockware = false;
                Destroy(gameObject);
            }
        }
    }

    public void Init(biology_info s, Player_skill_class sk , bool ware = false)
    {
        source_info = s;
        source_skill = sk;
        shockware = ware;
        targetPos = transform.position - transform.forward * moveDistance;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(SaveKey.Character))
        {
            other.GetComponent<C_base>().Get_damage(source_info, source_skill);
        }
    }
}
