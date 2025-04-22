using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class born_detection_sc : MonoBehaviour
{
    // Start is called before the first frame update

    public List<GameObject> born_obj = new List<GameObject>();
    
    private bool isAct = false;

    public GameObject juanzhouObj;
    private J_Anim juanzhou;
    private GameObject jface;
    private Vector3 pos;

    public float Live_time;
    private float time = 0;
    public List<GameObject> cube;
    public List<GameObject> Obscalecube;
    public GameObject Victorycube;
    public Vector3 tiaozhengchuxian;
    public Vector3 tiaozhengchixu;
    void Start()
    {
        if (Victorycube != null)
        {
            Victorycube.SetActive(false);
        }
        if (juanzhouObj != null)
        {
            juanzhou = juanzhouObj.GetComponent<J_Anim>();
            pos = juanzhouObj.transform.position;
            jface = juanzhou.transform.Find("jz_face").gameObject;
            jface.SetActive(false);
        }
        for (int i = 0; i < cube.Count; i++)
        {
            if (cube[i] != null)
            {
                cube[i].gameObject.GetComponent<BoxCollider>().isTrigger=false;
            }
        }
        for (int i = 0; i < Obscalecube.Count; i++)
        {
            if (Obscalecube[i] != null)
            {
                Obscalecube[i].gameObject.GetComponent<BoxCollider>().isTrigger = true;
                Obscalecube[i].gameObject.SetActive(false);
            }
        }
    }
    private void Update()
    {
        if (!isAct)
            return;
        time += Time.deltaTime;
        if (time > Live_time)
        {
            for (int i = 0; i < cube.Count; i++)
            {
                if (cube[i] != null)
                {
                    cube[i].gameObject.GetComponent<BoxCollider>().isTrigger = true;
                    cube[i].gameObject.SetActive(false);
                }
            }
            for (int i = 0; i < Obscalecube.Count; i++)
            {
                if (Obscalecube[i] != null)
                {
                    Obscalecube[i].gameObject.GetComponent<BoxCollider>().isTrigger = true;
                    Obscalecube[i].gameObject.SetActive(false);
                }
            }
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (isAct)
            return;
        if (other.CompareTag(SaveKey.Character))
        {
            if (Victorycube != null)
            {
                Victorycube.SetActive(true);
            }
            for (int i = 0; i < Obscalecube.Count; i++)
            {
                if (Obscalecube[i] != null)
                {
                    Obscalecube[i].gameObject.GetComponent<BoxCollider>().isTrigger = false;
                    Obscalecube[i].gameObject.SetActive(true);
                }
            }
            
            jface.gameObject.SetActive(true);
            juanzhou.change_anim(Anim_state.Open);
            StartCoroutine(Startfbx());
            foreach (GameObject obj in born_obj)
            {
                obj.GetComponent<Enemy_born_sc>().start_born();
                DialogueManager.instance.ShowText2(obj.GetComponent<Enemy_born_sc>().Live_time);
                isAct = true;
            }

        }
    }
    IEnumerator Startfbx()
    {
        if (juanzhouObj.activeSelf)
        {
          // 生成开始特效
         GameObject fb1 = ResourceManager.Instance.GetResource<GameObject>("Juanzhou/2");
         if (fb1 != null)
         {
            GameObject fb = GameObject.Instantiate(fb1, pos+tiaozhengchuxian, juanzhouObj.transform.rotation);
            yield return new WaitForSeconds(1f);
            Destroy(fb); 
         }
         // 生成持续特效
         GameObject fb3 = ResourceManager.Instance.GetResource<GameObject>("Juanzhou/3");
         if (fb3 != null)
         {
            GameObject fb = GameObject.Instantiate(fb3, pos+tiaozhengchixu, juanzhouObj.transform.rotation);
            yield return new WaitForSeconds(Live_time);
            Destroy(fb);        
         }
        }
        
    }


}
