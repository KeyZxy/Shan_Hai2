using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;

public class CGPlayer : MonoBehaviour
{
    private VideoPlayer player;
    public Fade fade;
    // Start is called before the first frame update
    void Start()
    {
        player=this.GetComponent<VideoPlayer>();
    }

    // Update is called once per frame
    private void Update()
    {
        if (Input.anyKeyDown)
        {
            player.Stop();
            fade.StartFadeAndLoadScene("MainMenu");
        }
    }
}
