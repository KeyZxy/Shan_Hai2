Shader "Custom/CutoutAdvanced" {
    Properties {
        [Header(Base Properties)]
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Cutoff ("Alpha Cutoff", Range(0,1)) = 0.5
        
        [Header(Normal Mapping)]
        [Normal] _NormalMap ("Normal Map", 2D) = "bump" {}
        _NormalScale ("Normal Scale", Range(0,2)) = 1.0
        
        [Header(Metallic and Smoothness)]
        _MetallicGlossMap ("Metallic (R) Smoothness (A)", 2D) = "white" {}
        _Metallic ("Metallic Scale", Range(0,1)) = 0.0
        _Glossiness ("Smoothness Scale", Range(0,1)) = 0.5
    }
    
    SubShader {
        Tags { 
            "Queue"="AlphaTest" 
            "RenderType"="TransparentCutout"
            "IgnoreProjector"="True"
        }
        LOD 200
        Cull Off
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows addshadow
        #pragma target 3.0

        // 纹理采样器
        sampler2D _MainTex;
        sampler2D _NormalMap;
        sampler2D _MetallicGlossMap;
        
        // 材质属性
        half _Glossiness;
        half _Metallic;
        fixed4 _Color;
        half _Cutoff;
        half _NormalScale;

        struct Input {
            float2 uv_MainTex;
            float2 uv_NormalMap;
            float2 uv_MetallicGlossMap;
        };

        void surf (Input IN, inout SurfaceOutputStandard o) {
            // 基础颜色采样
            fixed4 albedo = tex2D(_MainTex, IN.uv_MainTex) * _Color;

            float tempAlpha = 1 - albedo.a;
            // Alpha测试
            clip(albedo.a - _Cutoff);
            
            // 法线贴图采样
            o.Normal = UnpackScaleNormal(tex2D(_NormalMap, IN.uv_NormalMap), _NormalScale);
            
            // 金属度&光滑度采样
            fixed4 metallicGloss = tex2D(_MetallicGlossMap, IN.uv_MetallicGlossMap);
            o.Metallic = metallicGloss.r * _Metallic;  // 使用R通道控制金属度
            o.Smoothness = metallicGloss.a * _Glossiness; // 使用A通道控制光滑度
            
            // 最终输出
            o.Albedo = float3(albedo.a,albedo.a,albedo.a);
            o.Albedo = albedo.rgb;
            o.Alpha = albedo.a;
        }
        ENDCG
    }
    FallBack "Transparent/Cutout/Diffuse"
}