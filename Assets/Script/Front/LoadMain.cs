using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LoadMain : MonoBehaviour
{
    public Fade fade;
    
    // ʹ��Э��ʵ���ӳټ�����Ϸ����  
    private IEnumerator Start()
    {
        // �ȴ� 3 ��  
        yield return new WaitForSeconds(3f);

        // �л�����Ϸ����
        //AudioManager.instance.StopAll();
        fade.StartFadeAndLoadScene("Level1_1 1"); 

    
    }

}
