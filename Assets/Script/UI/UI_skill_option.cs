using System.Collections;
using System.Collections.Generic;
using System.IO;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class UI_skill_option : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    public upgrade_info _upgrade_info;
    public GameObject _lv;
    public GameObject _content;
    public GameObject _value;
    public GameObject _text;
    public GameObject _skill_text;
    public GameObject _selection;


    private Upgrade_value_sc _upgrade;
    private Image _image;
    private Up_grade_panel_sc _upgrade_panel;
    private C_attribute _attr;
    private C_upgrade_attr _upgrade_attr;




    public void OnPointerEnter(PointerEventData eventData)
    {
        _selection.SetActive(true);
    }
    public void OnPointerExit(PointerEventData eventData)
    {
        _selection.SetActive(false);
    }


    // Start is called before the first frame update
    void Start()
    {
        _upgrade_panel = transform.parent.GetComponent<Up_grade_panel_sc>();
        _attr = GameObject.FindGameObjectWithTag(SaveKey.Character).GetComponent<C_attribute>();
        _selection.SetActive(false);

        Button _button = GetComponent<Button>();
        if (_button != null)
        {
            // 绑定点击事件
            _button.onClick.AddListener(BTN_UI_Click);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnEnable()
    {
        if(_upgrade == null)
            _upgrade = GameObject.Find("Upgrade_value").GetComponent<Upgrade_value_sc>();
        if (_image == null)
            _image = transform.GetComponent<Image>();

        _selection.SetActive(false);
        Get_Card();
        Upgrade_processing();


    }


    void Upgrade_processing()
    {
        switch(_upgrade_info.type)
        {
            case skill_type.None:
                Attr_processing(1);
                break;
            case skill_type.Normal_atk:
                Attr_processing(3);
                break;
            case skill_type.Passive_atk:
                Attr_processing(3);
                break;
            case skill_type.Active_atk:

                break;
            case skill_type.Ultimate_atk:

                break;
        }
    }


    void Attr_processing(int ty)
    {
        string path = $"UI/Upgrade2/{_upgrade_info.attr_ID}";
        Sprite newSprite = Resources.Load<Sprite>(path);
        if (newSprite != null)
        {
            _image.sprite = newSprite; // 替换图片
        }

        switch (ty)
        {
            case 1:
                // type_attr
                _skill_text.SetActive(false);
                _content.SetActive(true);
                _value.SetActive(true);
                _text.GetComponent<Text>().text = _upgrade_info.type_attr.level == 0 ? "获取" : "升级";
                _content.GetComponent<Text>().text = _upgrade_info.attr_name;
                _value.GetComponent<Text>().text = Get_value_text(_upgrade_info.attr_ID);
                string lv_image = "UI/Upgrade2/";
                lv_image += _upgrade_info.type_attr.grade.ToString();
                lv_image += "-";
                int lv_value = _upgrade_info.type_attr.level + 1;
                lv_image += lv_value.ToString();
                newSprite = Resources.Load<Sprite>(lv_image);
                _lv.GetComponent<Image>().sprite = newSprite;

                break;
            case 2:
                // type_skill 暂无处理
                break;
            case 3:
                // type_skill
                _skill_text.SetActive(true);
                _content.SetActive(false);
                _value.SetActive(false);
                _text.GetComponent<Text>().text = (_upgrade_info.type_skill.Lv - 1 == 0) ? "获取" : "升级";
                _skill_text.GetComponent<Text>().text = Get_value_text(_upgrade_info.attr_ID);
                string lv_skill_image = "UI/Upgrade2/";
                lv_skill_image += "9-";
                lv_skill_image += _upgrade_info.type_skill.Lv.ToString();
                newSprite = Resources.Load<Sprite>(lv_skill_image);
                _lv.GetComponent<Image>().sprite = newSprite;
                break;
        }
    }

    string Get_value_text(int id)
    {
        string str = "+";

        switch(id)
        {
            case 200001:
                str += _upgrade_info.type_attr.max_hp.ToString() + "%";
                break;
            case 200002:
                str += _upgrade_info.type_attr.HP_Recovery.ToString() + "秒";
                break;
            case 200003:
                str += _upgrade_info.type_attr.atk.ToString() + "%";
                break;
            case 200004:
                str += _upgrade_info.type_attr.def.ToString() + "%";
                break;
            case 200005:
                str += _upgrade_info.type_attr.avoid.ToString();
                break;
            case 200006:
                str += _upgrade_info.type_attr.crit.ToString() + "%";
                break;
            case 200007:
                str += _upgrade_info.type_attr.crit_Atk.ToString() + "%";
                break;
            case 200008:
                str = "-" + _upgrade_info.type_attr.attack_speed.ToString() + "秒";
                break;
            case 200009:
                str = "-" + _upgrade_info.type_attr.cool_down.ToString() + "秒";
                break;
            case 200010:
                str += _upgrade_info.type_attr.atk_count.ToString();
                break;
            case 200011:
                str += _upgrade_info.type_attr.atk_duration.ToString() + "秒";
                break;
            case 200012:
                str += _upgrade_info.type_attr.move_speed.ToString();
                break;
            case 200014:
                str += _upgrade_info.type_attr.pick_distance.ToString();
                break;
            case 200015:
                str += _upgrade_info.type_attr.gold_extra.ToString();
                break;
            case 200016:
                str += _upgrade_info.type_attr.luck.ToString();
                break;
            case 200017:
                str += _upgrade_info.type_attr.ex_extra.ToString();
                break;
            case 200018:
                str += _upgrade_info.type_attr.grade.ToString();
                break;
            case 200019:
                str += _upgrade_info.type_attr.hp.ToString();
                break;
            case 210001:
                str = _upgrade_info.Description;
                str = str.Replace("\\r\\n", "\n"); // 注意是两个反斜杠
                break;
            case 220001:
                str = _upgrade_info.Description;
                str = str.Replace("\\r\\n", "\n"); // 注意是两个反斜杠
                break;
            case 220002:
                str = _upgrade_info.Description;
                str = str.Replace("\\r\\n", "\n"); // 注意是两个反斜杠
                break;
            case 220003:
                str = _upgrade_info.Description;
                str = str.Replace("\\r\\n", "\n"); // 注意是两个反斜杠
                break;
        }



        return str;
    }


    void Get_Card()
    {
        if(_upgrade_attr == null)
            _upgrade_attr = GameObject.FindGameObjectWithTag(SaveKey.Character).GetComponent<C_upgrade_attr>();

        if (transform.name == "option_1")
        {
            _upgrade_attr.Random_Info();
            _upgrade_info = _upgrade_attr.Get_info(0);

        }
        if (transform.name == "option_2")
        {
            _upgrade_info = _upgrade_attr.Get_info(1);

        }
        if (transform.name == "option_3")
        {
            _upgrade_info = _upgrade_attr.Get_info(2);

        }
    }

    public void BTN_UI_Click()
    {
        _upgrade_panel.Hide_UI();
        _attr.C_Upgrade_Fun(_upgrade_info);
    }



}
