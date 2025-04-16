// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ShanHai/shijiefaxianrongji"
{
	Properties
	{
		_TextureSample2("zhu", 2D) = "white" {}
		[HDR]_Color2("bloomColor 0", Color) = (1,1,1,1)
		_f1("f1", Float) = 0
		[HDR]_Color3("miaobian", Color) = (0.1208833,0.1677938,0.8382749,1)
		_Float9("f2", Float) = 1
		_Float10("f3", Float) = 5
		[HDR]_Color0("f_color", Color) = (0,1,0.9459271,0)
		_Float4("miaobian", Float) = 0.2
		_Float1("rong", Float) = 0.29
		_TextureSample0("rong", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		Blend SrcAlpha OneMinusSrcAlpha
		
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float3 worldPos;
			float3 worldNormal;
		};

		uniform float4 _Color2;
		uniform sampler2D _TextureSample2;
		uniform float4 _TextureSample2_ST;
		uniform float4 _Color0;
		uniform float _f1;
		uniform float _Float9;
		uniform float _Float10;
		uniform float4 _Color3;
		uniform float _Float1;
		uniform sampler2D _TextureSample0;
		uniform float4 _TextureSample0_ST;
		uniform float _Float4;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 uv_TextureSample2 = i.uv_texcoord * _TextureSample2_ST.xy + _TextureSample2_ST.zw;
			float4 tex2DNode3 = tex2D( _TextureSample2, uv_TextureSample2 );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV43 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode43 = ( _f1 + _Float9 * pow( 1.0 - fresnelNdotV43, _Float10 ) );
			float clampResult44 = clamp( fresnelNode43 , 0.0 , 1.0 );
			float4 lerpResult48 = lerp( ( _Color2 * ( tex2DNode3 * i.vertexColor ) ) , _Color0 , clampResult44);
			float2 uv_TextureSample0 = i.uv_texcoord * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
			float4 tex2DNode27 = tex2D( _TextureSample0, uv_TextureSample0 );
			float temp_output_28_0 = step( _Float1 , tex2DNode27.r );
			float4 lerpResult38 = lerp( lerpResult48 , _Color3 , ( temp_output_28_0 - step( ( _Float1 + _Float4 ) , tex2DNode27.r ) ));
			o.Emission = lerpResult38.rgb;
			o.Alpha = temp_output_28_0;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18912
-471.4286;949.1429;1256.572;632.7143;6653.419;1405.615;5.254776;True;False
Node;AmplifyShaderEditor.RangedFloatNode;32;-1705.268,1099.866;Inherit;False;Property;_Float4;miaobian;13;0;Create;False;0;0;0;False;0;False;0.2;0.42;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1824.136,603.7042;Inherit;False;Property;_Float1;rong;14;0;Create;False;0;0;0;False;0;False;0.29;-0.04;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-2508.15,176.2322;Inherit;False;Property;_Float9;f2;6;0;Create;False;0;0;0;False;0;False;1;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;1;-1822.754,-242.9327;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-2050.097,-487.6341;Inherit;True;Property;_TextureSample2;zhu;0;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;40;-2316.15,80.23227;Inherit;False;Property;_f1;f1;4;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-2316.15,272.2322;Inherit;False;Property;_Float10;f3;8;0;Create;False;0;0;0;False;0;False;5;1.6;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;43;-2044.15,48.23227;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-1109.485,-362.043;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;6;-1321.07,-573.2612;Inherit;False;Property;_Color2;bloomColor 0;3;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;27;-1896.885,873.0699;Inherit;True;Property;_TextureSample0;rong;15;0;Create;False;0;0;0;False;0;False;-1;03c23dfea35edee40aa15e982b611675;03c23dfea35edee40aa15e982b611675;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;31;-1469.132,915.5431;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-798.7831,-391.0565;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StepOpNode;30;-1323.88,945.6589;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;39;-843.1711,154.3514;Inherit;False;Property;_Color0;f_color;12;1;[HDR];Create;False;0;0;0;False;0;False;0,1,0.9459271,0;0,1,0.9459271,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;44;-1660.151,48.23227;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;28;-1477.851,679.1328;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;48;-457.0265,-268.7295;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;35;-1071.521,40.1212;Inherit;False;Property;_Color3;miaobian;5;1;[HDR];Create;False;0;0;0;False;0;False;0.1208833,0.1677938,0.8382749,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;33;-874.1614,766.9212;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;19;-2757.872,94.01854;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;23;-2381.558,-413.3551;Inherit;False;Property;_Float3;rong;11;0;Create;False;0;0;0;False;0;False;0.8;0.8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;38;-95.44739,-175.2088;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-1298.894,-667.9342;Inherit;False;Property;_Float2;bloom;2;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;13;-4201.786,498.5931;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;16;-3586.016,243.7153;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;45;-1340.151,16.23227;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-3748.38,63.29155;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-4000.428,216.116;Inherit;False;Property;_Float0;rong;9;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;18;-3035.294,241.6372;Inherit;False;False;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldToObjectTransfNode;14;-3863.66,267.4474;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;25;-2179.092,-659.1304;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;10;2177.516,147.3471;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-997.6091,-231.4721;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;-1345.24,-177.7412;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;1657.738,362.8489;Inherit;False;0;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;22;-2826.493,-513.801;Inherit;True;Property;_TextureSample6;rong1;10;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-4192.318,11.49672;Inherit;True;Property;_TextureSample3;rong;7;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-1094.487,-678.8195;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;15;-3272.078,245.4717;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;781.027,-138.2777;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;ShanHai/shijiefaxianrongji;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;TransparentCutout;;Transparent;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;43;1;40;0
WireConnection;43;2;41;0
WireConnection;43;3;42;0
WireConnection;8;0;3;0
WireConnection;8;1;1;0
WireConnection;31;0;29;0
WireConnection;31;1;32;0
WireConnection;12;0;6;0
WireConnection;12;1;8;0
WireConnection;30;0;31;0
WireConnection;30;1;27;1
WireConnection;44;0;43;0
WireConnection;28;0;29;0
WireConnection;28;1;27;1
WireConnection;48;0;12;0
WireConnection;48;1;39;0
WireConnection;48;2;44;0
WireConnection;33;0;28;0
WireConnection;33;1;30;0
WireConnection;19;0;18;0
WireConnection;38;0;48;0
WireConnection;38;1;35;0
WireConnection;38;2;33;0
WireConnection;16;0;21;0
WireConnection;16;1;14;0
WireConnection;45;0;44;0
WireConnection;21;0;4;1
WireConnection;21;1;17;0
WireConnection;18;0;15;0
WireConnection;14;0;13;0
WireConnection;25;0;22;1
WireConnection;25;1;23;0
WireConnection;9;0;3;4
WireConnection;9;1;26;0
WireConnection;9;2;45;0
WireConnection;26;0;1;4
WireConnection;7;0;2;0
WireConnection;15;0;16;0
WireConnection;15;1;13;0
WireConnection;0;2;38;0
WireConnection;0;9;28;0
ASEEND*/
//CHKSM=21FA5F0794B2939C6654D5CA92E7DB23A9F48937