using UnityEngine;
using System.Collections;
using UnityEngine.Rendering;
using System;
public class GetFrustrumData : MonoBehaviour
{
    public GameObject mainLight;
    private Camera cam;
    public Material processMat;

    private Light _light;
    private Matrix4x4 viewMat;
    private CommandBuffer _commandBuffer;
    private CommandBuffer _cascadeShadowCommandBuffer;
    // Start is called before the first frame update
    void Start()
    {
        cam = Camera.main;
        //开启深度图
        cam.depthTextureMode |= DepthTextureMode.Depth;
        
        _commandBuffer = new CommandBuffer();
        _commandBuffer.name = "Light Command Buffer";

        _cascadeShadowCommandBuffer = new CommandBuffer();
        _cascadeShadowCommandBuffer.name = "Dir Light Command Buffer";
        _cascadeShadowCommandBuffer.SetGlobalTexture("_CascadeShadowMapTexture", new UnityEngine.Rendering.RenderTargetIdentifier(UnityEngine.Rendering.BuiltinRenderTextureType.CurrentActive));

        _light = mainLight.GetComponent<Light>();
        //_light.RemoveAllCommandBuffers();
        if(_light.type == LightType.Directional)
        {
            _light.AddCommandBuffer(LightEvent.BeforeScreenspaceMask, _commandBuffer);
            _light.AddCommandBuffer(LightEvent.AfterShadowMap, _cascadeShadowCommandBuffer);
                
        }
    }

    // Update is called once per frame
    void Update()
    {
        
        
    }
    
    private void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        //计算摄像机各种参数
        Transform CamTrans = cam.transform;
        float near = cam.nearClipPlane;
        float far = cam.farClipPlane;
        float halfHeight = cam.nearClipPlane * Mathf.Tan(cam.fieldOfView * 0.5f * Mathf.Deg2Rad);
        Vector3 toRight = CamTrans.right * halfHeight * cam.aspect;
        Vector3 upVector = CamTrans.up * halfHeight;
        Vector3 topVector = CamTrans.forward * near + upVector;
        Vector3 bottomVector = CamTrans.forward * near - upVector;

        Vector3 bottomLeft = bottomVector - toRight; //左下
        Vector3 bottomRight = bottomVector + toRight; //右下
        Vector3 topLeft = topVector - toRight; //左上
        Vector3 topRight = topVector + toRight; //右上
        
        // setup frustum corners for world position reconstruction
        
        viewMat.SetRow(0, Camera.current.ViewportToWorldPoint(new Vector3(0, 0, Camera.current.farClipPlane)));
        viewMat.SetRow(1, Camera.current.ViewportToWorldPoint(new Vector3(1, 0, Camera.current.farClipPlane)));
        viewMat.SetRow(2, Camera.current.ViewportToWorldPoint(new Vector3(0, 1, Camera.current.farClipPlane)));
        
        viewMat.SetRow(3, Camera.current.ViewportToWorldPoint(new Vector3(1, 1, Camera.current.farClipPlane)));
        
        processMat.SetMatrix("_ViewMatrix", viewMat);
        //processMat.SetVector("_CamTransform",new Vector4(CamTrans.position.x, CamTrans.position.y, CamTrans.position.z, 0.0f));
        
        Graphics.Blit(src, dest, processMat);
        

    }
    
}
