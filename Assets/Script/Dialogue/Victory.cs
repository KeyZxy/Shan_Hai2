using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Victory : MonoBehaviour
{
    public Fade fade;
    public float Live_time;
    private float time = 0;
    private Bounds bounds;
    public BoxCollider area;
    void Start()
    {
        bounds=area.bounds;
        transform.Find("传送门").gameObject.SetActive(false);
        this.gameObject.GetComponent<BoxCollider>().isTrigger = false;
    }
    private void Update()
    {
        time += Time.deltaTime;
        if (time > Live_time/*&& !bounds.Contains(GameObject.Find(SaveKey.Enemy).transform.position)*/)
        {
            transform.Find("传送门").gameObject.SetActive(true);
            this.gameObject.GetComponent<BoxCollider>().isTrigger = true;
        }
    }
    private void OnTriggerEnter(Collider collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {

            fade.StartFadeAndLoadScene("Level0_Daoguan");

        }
    }
}
