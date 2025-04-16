using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fly_sc : MonoBehaviour
{

    public float speed = 5f;
    public List<GameObject> m_posi = new List<GameObject>();


    private int currentTargetIndex = 0;


    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        // 确保有足够的目标点
        if (m_posi.Count == 0) return;

        // 获取当前目标位置
        Vector3 targetPosition = m_posi[currentTargetIndex].transform.position;

        // 平滑旋转朝向目标点
        Vector3 direction = (targetPosition - transform.position).normalized;
        if (direction != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(direction);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.deltaTime * speed);
        }

        // 移动物体
        transform.position = Vector3.MoveTowards(transform.position, targetPosition, Time.deltaTime * speed);

        // 判断是否到达目标点
        if (Vector3.Distance(transform.position, targetPosition) < 0.1f)
        {
            currentTargetIndex++;

            // 如果到达最后一个目标点，瞬移回起点重新飞行
            if (currentTargetIndex >= m_posi.Count)
            {
                currentTargetIndex = 0;
                transform.position = m_posi[0].transform.position;
            }
        }
    }

}
