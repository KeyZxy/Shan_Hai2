using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class dafeng_bullet : MonoBehaviour
{

    public float speed = 5f;

    private biology_info source_info;
    private Player_skill_class source_skill;
    private Vector3 posi;
    private bool isStart = false;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (isStart)
        {
            // 沿着物体当前的 forward 方向移动
            transform.Translate(Vector3.forward * speed * Time.deltaTime);

            // 检测子弹是否超过角色发射时位置的10距离
            float distanceFromInitialPos = Vector3.Dot(transform.position - posi, transform.forward);

            if (distanceFromInitialPos > 10f)
            {
                isStart = false;
                Destroy(gameObject);
            }
        }
    }

    public void Init(biology_info s, Player_skill_class sk , Vector3 p , bool fly)
    {
        source_info = s;
        source_skill = sk;
        posi = p;
        isStart = true;
        if(fly)
        {
            transform.LookAt(posi);
        }
        else
        {
            Vector3 targetPosition = new Vector3(posi.x, transform.position.y, posi.z);
            transform.LookAt(targetPosition);
        }
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(SaveKey.Character))
        {
            other.GetComponent<C_base>().Get_damage(source_info, source_skill);
            GameObject FB = (GameObject)Resources.Load("Particle/dafeng/shouji_M");
            Vector3 posi = transform.position;
            GameObject go = GameObject.Instantiate(FB, posi, transform.rotation);
            Destroy(gameObject);
        }
    }

}
