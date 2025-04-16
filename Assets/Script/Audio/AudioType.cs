using UnityEngine;
using UnityEngine.Audio;

[System.Serializable]	//��Inspector�����пɼ�
public class AudioType  //��Ƶ����
{
    [HideInInspector]
    public AudioSource Source;  //��ƵԴ(��Inspector������)
    public AudioClip Clip;  //��ƵƬ��


    public string Name;  //��Ƶ����

    [Range(0f, 1f)]
    public float Volume;    //����(������)

    
    public bool Loop;    //�Ƿ�ѭ������
    public bool PlayOnAwake;    //�Ƿ���Awakeʱ�Զ�����
}
