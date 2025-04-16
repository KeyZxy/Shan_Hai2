Shader "Custom/wing"
{
    Properties
    {
        _Color1 ("Color1", Color) = (1,1,1,1)
        _Color2 ("Color2", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _Cut("alpha cut",Range(0,1)) = 0
        _AlphaEnhancer("alpha enhancer",Range(0,10)) = 1
        _InterpolatorPower("interpolator power",Range(0,10)) = 1
        _InterpolatorStart("interpolator start",Range(0,1)) = 0
        _InterpolatorEnd("interpolator end",Range(0,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent"  }
        LOD 200
        Cull Off
        ZWrite Off
        Blend SrcAlpha OneMinusSrcAlpha
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows alpha alphatest:_Cut vertex:vert 

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float3 localPos;
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color1,_Color2;
        float _AlphaEnhancer;
        float _xMax,_InterpolatorPower,_InterpolatorStart,_InterpolatorEnd;
        //float _Cut;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void vert (inout appdata_full v, out Input o) {
            UNITY_INITIALIZE_OUTPUT(Input, o);
            o.localPos = v.vertex.xyz; // 直接获取模型空间坐标
        }

        void surf (Input IN, inout SurfaceOutputStandard o)
        {


            float interpolator = (abs(IN.localPos.x) - _xMax)/4;
            interpolator = pow(interpolator,_InterpolatorPower);
            interpolator = smoothstep(_InterpolatorStart,_InterpolatorEnd,interpolator);
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            //o.Albedo = c.rgb * _Color;
            o.Albedo = lerp(_Color1,_Color2,interpolator);
            // Metallic and smoothness come from slider variables
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = clamp(c.r * _AlphaEnhancer,0,1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
