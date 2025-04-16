using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class deer_buff_sc : MonoBehaviour
{

    public GameObject kaishi;
    public GameObject connect;
    public GameObject chixu;
    public GameObject jiesu;

    private bool act = false;
    private float Duration_time;
    private int Extra_hp;
    private int Extra_speed;
    private Transform _target;
    private float currentHeight;
    private List<Transform>Enemys = new List<Transform>();
    private float lastTime = 0f;
    private float interval = 1f;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(delay_change_effect(0.83f, 1));
        StartCoroutine(delay_change_effect(Duration_time - 0.45f , 3));
    }

    void Update()
    {
        lastTime += Time.deltaTime;
        if (lastTime >= interval)
        {
            lastTime = 0f;
            Add_buff();
        }
    }


    void FixedUpdate()
    {
        if(act)
        {
            Vector3 posi = new Vector3(_target.position.x , currentHeight , _target.position.z);    
            transform.position = posi;
        }
    }

    public void Init(float t , int h , int s , Transform tr)
    {
        Duration_time = t;
        Extra_hp = h;
        Extra_speed = s;
        _target = tr;
        currentHeight = transform.position.y;
        act = true;
        StartCoroutine(delay_Destory(Duration_time));
    }

    void Add_buff()
    {
        
        foreach(Transform tr in Enemys)
        {
            if(tr != null)
            {
                tr.GetComponent<E_base>().Get_deer_buff(Extra_hp , Extra_speed , Duration_time);
            }
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(SaveKey.Enemy))
        {
            if (!Enemys.Contains(other.transform)) // 确保不重复添加
            {
                Enemys.Add(other.transform);
            }
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag(SaveKey.Enemy))
        {
            if (Enemys.Contains(other.transform)) // 确保列表里有才移除
            {
                Enemys.Remove(other.transform);
            }
        }
    }

    IEnumerator delay_change_effect(float time , int state)
    {
        yield return new WaitForSeconds(time);
        switch(state)
        {
            case 1:
                kaishi.SetActive(false);
                connect.SetActive(true);
                StartCoroutine(delay_change_effect(0.35f, 2));
                break;
            case 2:
                connect.SetActive(false);
                chixu.SetActive(true);
                break;
            case 3:
                chixu.SetActive(false);
                jiesu.SetActive(true);
                break;
        }
    }

    IEnumerator delay_Destory(float time)
    {
        yield return new WaitForSeconds(time);
        Destroy(gameObject);    
    }



}
