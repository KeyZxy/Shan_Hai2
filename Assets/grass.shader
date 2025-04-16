Shader "SH/plane/grass"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Color("color",COLOR) = (1,1,1,1)
        _TerrianTex("terrian tex",2D) = "white" {}
        _Xscale("xscale",FLOAT) = 1
        _Zscale("zscale",FLOAT) = 1
        _GroundFactor("ground factor",range(0,10)) = 5
        _WindDir("wind direction",Vector) = (1,0,0,0)
        _WindUnifromIntensity("wind uniform intensity",range(0,60)) = 30

        _ShadowIntensity("shadow intensity",range(0,1))  = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Cull off
        Pass
        {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog
            #pragma multi_compile_instancing
            #pragma multi_compile_fwdbase
            //�޳����õı���
            //#pragma skip_variants DIRLIGHTMAP_COMBINED DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING LIGHTPROBE_SH SHADOWS_SHADOWMASK VERTEXLIGHT_ON
            //�Լ����壬��Ӱ��Ҫʹ�õı���
            #pragma multi_compile DIRECTIONAL SHADOWS_SCREEN

            #include "Lighting.cginc"
            #include"AutoLight.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                SHADOW_COORDS(3)
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 pos : SV_POSITION;
                float4 origrin_vert1 :TEXCOORD2;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                
            };

            float4 _Color;
            uniform float3 _camerapos;
            uniform float2 _camerasize;
            sampler2D _TerrianTex;
            float4 _TerrianTex_ST;
            float _Xscale,_Zscale,_GroundFactor,_WindUnifromIntensity,_ShadowIntensity;
            float3 _WindDir;
            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {

                v2f o;
                UNITY_SETUP_INSTANCE_ID(v); //���������
                UNITY_TRANSFER_INSTANCE_ID(v,o); //������
                //����綯����
                float windIntensity = (sin(_Time.x *20) * 0.5 + 0.5);
                float vertIntensity = _WindUnifromIntensity *pow( v.uv.y,2) * windIntensity;
                vertIntensity = radians(vertIntensity);
                v.vertex.y *= cos(vertIntensity);
                v.vertex.xz += _WindDir.xz * sin(vertIntensity);
                o.pos = UnityObjectToClipPos(v.vertex);
                o.origrin_vert1 = v.vertex;
                o.uv = v.uv;
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_SHADOW(o);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float3 worldPos = mul(unity_ObjectToWorld, i.origrin_vert1);
                UNITY_SETUP_INSTANCE_ID(i); //���һ��
                float atten = SHADOW_ATTENUATION(i);

                float grassDiffuise = dot(float3(0,1,0), normalize(_WorldSpaceLightPos0.xyz)) * 0.5 + 0.5;
                //float uv_x = (worldPos.x - _camerapos.x)/_Xscale + 0.5;
                //float uv_z = (worldPos.z - _camerapos.z)/_Zscale + 0.5;
                float uv_x = (worldPos.x - _camerapos.x)/_camerasize.x + 0.5;
                float uv_z = (worldPos.z - _camerapos.z)/_camerasize.y + 0.5;
                float4 final_color = tex2D(_TerrianTex,float2(uv_x, uv_z));
                final_color = lerp(final_color,_Color * grassDiffuise,pow(i.uv.y,_GroundFactor));
                final_color = lerp(final_color*_ShadowIntensity,final_color,atten);
                //final_color += a
                UNITY_APPLY_FOG(i.fogCoord, final_color);
               // return float4(atten,atten,atten,1);
                return final_color;
            }
            ENDCG
        }
        Pass
        {
            Tags{ "LightMode"="ShadowCaster" "RenderType"="Transparent"  "Queue"="Transparent" }
            ZWrite Off
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog
            #pragma multi_compile_instancing

            #include "UnityCG.cginc"
            #include "Lighting.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
                float4 origrin_vert1 :TEXCOORD2;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            float4 _Color;
            uniform float3 _camerapos;
            uniform float2 _camerasize;
            sampler2D _TerrianTex;
            float4 _TerrianTex_ST;
            float _Xscale,_Zscale,_GroundFactor,_WindUnifromIntensity;
            float3 _WindDir;
            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {

                v2f o;
                UNITY_SETUP_INSTANCE_ID(v); //���������
                UNITY_TRANSFER_INSTANCE_ID(v,o); //������
                //����綯����
                float windIntensity = (sin(_Time.x *20) * 0.5 + 0.5);
                float vertIntensity = _WindUnifromIntensity *pow( v.uv.y,2) * windIntensity;
                vertIntensity = radians(vertIntensity);
                v.vertex.y *= cos(vertIntensity);
                v.vertex.xz += _WindDir.xz * sin(vertIntensity);
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.origrin_vert1 = v.vertex;
                o.uv = v.uv;
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float3 worldPos = mul(unity_ObjectToWorld, i.origrin_vert1);
                UNITY_SETUP_INSTANCE_ID(i); //���һ��

                float grassDiffuise = dot(float3(0,1,0), normalize(_WorldSpaceLightPos0.xyz)) * 0.5 + 0.5;
                //float uv_x = (worldPos.x - _camerapos.x)/_Xscale + 0.5;
                //float uv_z = (worldPos.z - _camerapos.z)/_Zscale + 0.5;
                float uv_x = (worldPos.x - _camerapos.x)/_camerasize.x + 0.5;
                float uv_z = (worldPos.z - _camerapos.z)/_camerasize.y + 0.5;
                float4 final_color = tex2D(_TerrianTex,float2(uv_x, uv_z));
                //final_color = lerp(final_color,_Color * grassDiffuise,pow(i.uv.y,_GroundFactor));
                return final_color;
            }
            ENDCG
        }
    }
}
