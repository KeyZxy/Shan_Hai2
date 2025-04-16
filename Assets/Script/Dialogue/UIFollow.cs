using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIFollow : MonoBehaviour
{
   
    private Camera m_camera;
    private Transform m_target;
    private Canvas m_canvas;

    private bool hasFollowed = false;
    public bool alwaysFollow = true;

    public Vector2 offset = new Vector2(75, 5);
    public void Init(Camera camera, Transform target, Canvas canvas)
    {
        m_camera = camera;
        m_target = target;
        m_canvas = canvas;
        FollowObject();
    }

    public void Update()
    {
        FollowObject();
    }

    private void FollowObject()
    {
        if (!alwaysFollow && hasFollowed)
        {
            return;
        }

        if (m_camera != null && m_target != null)
        {
            Vector2 pos = m_camera.WorldToScreenPoint(m_target.transform.position);
            switch (m_canvas.renderMode)
            {
                case RenderMode.ScreenSpaceOverlay:
                    (transform as RectTransform).position = pos+ offset;
                    hasFollowed = true;
                    break;
                case RenderMode.ScreenSpaceCamera:
                    if (RectTransformUtility.ScreenPointToLocalPointInRectangle(transform.parent as RectTransform, pos, m_camera, out Vector2 point))
                    {
                        transform.localPosition = new Vector3(point.x, point.y, 0);
                        hasFollowed = true;
                    }
                    break;
            }
        }
    }
}

