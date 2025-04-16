using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Enemy_born_sc : MonoBehaviour
{

    public GameObject Enemy_obj;
    public float Live_time;
    public float Interval;
    public float Count;
    public float Speed_up_value;
    public float Speed_up_interval;
    public float Speed_up_count;
    public List<GameObject> Posi_s = new List<GameObject>();

    private float Original_live_time;
    private bool isStart = false;
    private float Threshold;
    private float spawnDelay = 0.2f;
    private bool speed_up_mode = false;
    private Coroutine spawnCoroutine;
    private bool isStop = false;


    public GameObject juanzhouObj;
    private J_Anim juanzhou;
    private Vector3 pos;
    private GameObject Kuangbao;
    private GameObject Cuihui;
    
    public Vector3 tiaozhengshuaguai;
    public Vector3 tiaozhengkuangbao;
    public Vector3 tiaozhengjieshu;
    // Start is called before the first frame update
    void Start()
    {
        Original_live_time = Live_time;
        Threshold = Live_time * (Speed_up_value / 100f);
        if (juanzhouObj != null)
        {
            juanzhou = juanzhouObj.GetComponent<J_Anim>();
            pos = juanzhouObj.transform.position;
        }
        
    }

    // Update is called once per frame
    void Update()
    {
        if (isStop)
            return;
        if(isStart)
        {
            Live_time -= Time.deltaTime;
            if (Live_time <= Threshold && !speed_up_mode)
            {
                //开启狂暴模式
                speed_up_mode = true;
                GameObject fb1 = ResourceManager.Instance.GetResource<GameObject>("Juanzhou/5");
                if (fb1 != null)
                {
                    Kuangbao = GameObject.Instantiate(fb1, pos+tiaozhengkuangbao, juanzhouObj.transform.rotation);
                }
            }
            if(Live_time <= 0)
            {
                //结束刷怪
                juanzhou.change_anim(Anim_state.Close);
                GameObject fb2 = ResourceManager.Instance.GetResource<GameObject>("Juanzhou/6");
                if (fb2 != null)
                {
                    Cuihui = GameObject.Instantiate(fb2, pos+tiaozhengjieshu, juanzhouObj.transform.rotation);
                }
                StartCoroutine(Closejuanzhou());
                isStop = true;
                StopCoroutine(spawnCoroutine);
            }
                
        }
    }
    IEnumerator Closejuanzhou()
    {
        yield return new WaitForSeconds(1f);
        Destroy(Cuihui);
        Destroy(Kuangbao);
        yield return new WaitForSeconds(6f);
        juanzhouObj.SetActive(false);
    }
    IEnumerator SpawnEnemy()
    {
        float spawn_count;
        if (speed_up_mode)
            spawn_count = Speed_up_count;
        else
            spawn_count = Count;

        for (int i = 0; i < spawn_count; i++)
        {
            // 在 Posi 列表中随机选择一个位置
            int randomIndex = Random.Range(0, Posi_s.Count);
            Vector3 spawnPosition = Posi_s[randomIndex].transform.position;
            StartCoroutine(Startfbx(spawnPosition));
            // 生成敌人
            Instantiate(Enemy_obj, spawnPosition, Quaternion.identity, GameObject.Find("Enemy_group").transform);

            // 等待 spawnDelay 秒后再生成下一个敌人
            yield return new WaitForSeconds(spawnDelay);
        }
    }
    IEnumerator Startfbx(Vector3 spawnPosition)
    {
        GameObject player = GameObject.Find(SaveKey.Character);
        if (player == null) yield break;   
        Vector3 playerPosition = player.transform.position;
        Quaternion rot = Quaternion.Euler(0, 90, 0);
        Quaternion rotationToFacePlayer = Quaternion.LookRotation(playerPosition - spawnPosition);
        Quaternion rot1 = rotationToFacePlayer * rot;
        // 播放敌人出生特效
        GameObject effectPrefab = ResourceManager.Instance.GetResource<GameObject>("Juanzhou/4");
          if (effectPrefab != null)
          {
              GameObject effectInstance = Instantiate(effectPrefab, spawnPosition, rot1);
          //卷轴
              GameObject fI = GameObject.Instantiate(effectPrefab, pos+tiaozhengshuaguai, juanzhouObj.transform.rotation);
            fI.transform.localScale *= 2f; // 放大 2 倍
            yield return new WaitForSeconds(1.5f);
              Destroy(effectInstance);
              Destroy(fI);
          }
    }

    private IEnumerator Loop_Spawn()
    {
        while (true)
        {
            StartCoroutine(SpawnEnemy());
            if(!speed_up_mode)
                yield return new WaitForSeconds(Speed_up_interval);
            else
                yield return new WaitForSeconds(Interval);

        }
    }

    public void start_born()
    {
        if (!isStart)
        {
            spawnCoroutine = StartCoroutine(Loop_Spawn());
            isStart = true;
        }

    }


}
