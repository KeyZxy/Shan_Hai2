using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Stamine : MonoBehaviour
{
    public C_attribute player;
    private float maxex;
    private float exBefore;

    public float speed = 5f; // 过渡速度  
    private Image image;
    public Text text;
    private bool isResetting = false; // 是否正在清空经验条  
    // Start is called before the first frame update
    void Start()
    {
        image = GetComponent<Image>();
        player = GameObject.Find("Player")?.GetComponent<C_attribute>();

        if (player != null)
        {
            exBefore = player.Get_stamina();
            maxex = player.Get_Max_stamina();
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (player == null) return; 
        float ex = player.Get_stamina();
        maxex = Mathf.Max(player.Get_Max_stamina(), 1); // 防止 maxex == 0  

        if (ex >= maxex&&Input.GetKeyDown(KeyCode.LeftShift))
        {
            isResetting = true; // 经验值满，开始清空  
        }

        float deltaTime = (Time.timeScale > 0) ? Time.deltaTime : Time.unscaledDeltaTime;

        if (isResetting)
        {
            // 如果正在清空经验条，进行平滑过渡  
            exBefore = Mathf.Lerp(exBefore, 0, deltaTime * speed);
            if (exBefore <= 0.01f) // 避免浮点数误差  
            {
                exBefore = 0;
                isResetting = false; // 清空完成，恢复正常经验更新  
            }
        }
        else
        {
            // 正常更新经验值  
            ex = Mathf.Clamp(ex, 0, maxex);
            exBefore = Mathf.Lerp(exBefore, ex, deltaTime * speed);
        }

        image.fillAmount = exBefore / maxex;
        // 更新血量文本  
        UpdateHealthText();
    }
    void UpdateHealthText()
    {
        if (text != null)
        {
            text.text = Mathf.RoundToInt(exBefore).ToString() + " / " + maxex.ToString();
        }
    }
}
