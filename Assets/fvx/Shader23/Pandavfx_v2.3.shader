// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VFX/Pandavfx_v2.3"
{
	Properties
	{
		_VATFrameFactor("VATFrameFactor", Range( 0 , 1)) = 0
		[Enum(UnityEngine.Rendering.CullMode)]_Cullmode("Cullmode", Float) = 0
		[Toggle]_NormalTexCV("NormalTexCV", Float) = 0
		[Toggle]_NormalTexC("NormalTexC", Float) = 0
		_NormalScale("NormalScale", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_Ztest("Ztest", Float) = 4
		_VATTime("VATTime", Float) = 0
		_LightScale("LightScale", Range( 0 , 1)) = 0
		[Enum(UnityEngine.Rendering.BlendMode)]_Scr("Scr", Float) = 5
		_TexCenter("TexCenter", Vector) = (0,0,0,0)
		[Enum(UnityEngine.Rendering.BlendMode)]_Dst("Dst", Float) = 10
		[KeywordEnum(Normal,Polar,Cylinder,UV2)] _MainTexUVS("MainTexUVS", Float) = 0
		[KeywordEnum(X,Y,Z)] _Face("Face", Float) = 1
		[HideInInspector]_AddTex_ST("AddTex_ST", Vector) = (1,1,0,0)
		[HideInInspector]_MainTex_ST("MainTex_ST", Vector) = (1,1,0,0)
		[HideInInspector]_NormalTex_ST("NormalTex_ST", Vector) = (1,1,0,0)
		[HideInInspector]_VTOTex_ST("VTOTex_ST", Vector) = (1,1,0,0)
		[HideInInspector]_DistortTex_ST("DistortTex_ST", Vector) = (1,1,0,0)
		[HideInInspector]_DistortMaskTex_ST("DistortMaskTex_ST", Vector) = (1,1,0,0)
		[HideInInspector]_DissloveTexPlus_ST("DissloveTexPlus_ST", Vector) = (1,1,0,0)
		[HideInInspector]_DissloveTex_ST("DissloveTex_ST", Vector) = (1,1,0,0)
		[HideInInspector]_VTOMaskTex_ST("VTOMaskTex_ST", Vector) = (1,1,0,0)
		[HideInInspector]_MaskPlusTex_ST("MaskPlusTex_ST", Vector) = (1,1,0,0)
		[HideInInspector]_MaskTex_ST("MaskTex_ST", Vector) = (1,1,0,0)
		_MainAlpha("MainAlpha", Range( 0 , 100)) = 1
		[HDR]_MainColor("MainColor", Color) = (1,1,1,1)
		_AddTexUspeed("AddTexUspeed", Float) = 0
		_AddTexAC("AddTexAC", Range( 0 , 0.1)) = 0
		_MainTex_Uspeed("MainTex_Uspeed", Float) = 0
		_NormalTex_Uspeed("NormalTex_Uspeed", Float) = 0
		_AddTexVspeed("AddTexVspeed", Float) = 0
		_MainTex_Vspeed("MainTex_Vspeed", Float) = 0
		_NormalTex_Vspeed("NormalTex_Vspeed", Float) = 0
		[Toggle]_DistortAddTex("DistortAddTex", Float) = 1
		[Enum(off,0,on,1)]_DistortNormalTex("DistortNormalTex", Float) = 1
		[Enum(off,0,on,1)]_DistortMainTex("DistortMainTex", Float) = 1
		[Enum(off,0,on,1)]_DistortMask("DistortMask", Float) = 0
		[Enum(off,0,on,1)]_IfDissolveOffsetC("IfDissolveOffsetC", Float) = 0
		[Enum(off,0,on,1)]_DistortDisTex("DistortDisTex", Float) = 0
		_DistortFactor("DistortFactor", Range( 0 , 1)) = 0
		_DistortTex_Uspeed("DistortTex_Uspeed", Float) = 0
		_DistortTex_Vspeed("DistortTex_Vspeed", Float) = 0
		_DIssloveFactor("DIssloveFactor", Range( 0 , 1)) = 0.5
		_DIssloveWide("DIssloveWide", Range( 0 , 1)) = 0.1
		_DIssloveSoft("DIssloveSoft", Range( 0 , 1)) = 0.5
		[HDR]_DIssloveColor("DIssloveColor", Color) = (1,1,1,1)
		_DisTex_Uspeed("DisTex_Uspeed", Float) = 0
		_DisTex_Vspeed("DisTex_Vspeed", Float) = 0
		_VTOFactor("VTOFactor", Float) = 0
		_VTOTex_Uspeed("VTOTex_Uspeed", Float) = 0
		_VTOTex_Vspeed("VTOTex_Vspeed", Float) = 0
		_VTOMaskTex("VTOMaskTex", 2D) = "white" {}
		_fnl_power("fnl_power", Range( 1 , 10)) = 1
		_fnl_sacle("fnl_sacle", Range( 0 , 1)) = 0
		[HDR]_fnl_color("fnl_color", Color) = (1,1,1,0)
		_softFacotr("softFacotr", Range( 0 , 20)) = 1
		_DepthfadeFactor("DepthfadeFactor", Range( 0 , 10)) = 1
		[Toggle]_CustomdataMaskUV("CustomdataMaskUV", Float) = 0
		_Mask_scale("Mask_scale", Float) = 1
		_NormalTex_Rotat("NormalTex_Rotat", Range( 0 , 360)) = 0
		_MainTex_rotat("MainTex_rotat", Range( 0 , 360)) = 0
		_MainTexAC("MainTexAC", Range( 0 , 0.1)) = 0
		_AddTexRo("AddTexRo", Range( 0 , 360)) = 0
		_VTOR("VTOR", Range( 0 , 360)) = 0
		_VTOMaskR("VTOMaskR", Range( 0 , 360)) = 0
		_DissolvePlusR("DissolvePlusR", Range( 0 , 360)) = 0
		_DIssolve_rotat("DIssolve_rotat", Range( 0 , 360)) = 0
		[Toggle]_FNLfanxiangkaiguan("FNLfanxiangkaiguan", Float) = 0
		[Toggle]_ToggleSwitch0("Toggle Switch0", Float) = 0
		[Toggle]_Depthfadeon("Depthfadeon", Float) = 0
		_Mask_Uspeed("Mask_Uspeed", Float) = 0
		_MaskPlusUspeed("MaskPlusUspeed", Float) = 0
		_Mask_rotat("Mask_rotat", Range( 0 , 360)) = 0
		_MaskPlusR("MaskPlusR", Range( 0 , 360)) = 0
		_MaskPlusVspeed("MaskPlusVspeed", Float) = 0
		_Mask_Vspeed("Mask_Vspeed", Float) = 0
		[Toggle]_soft_sting("soft_sting", Float) = 0
		[Toggle]_VTOMaskAR("VTOMaskAR", Float) = 1
		[Toggle]_VTOMaskCV("VTOMaskCV", Float) = 0
		[Toggle]_VTOMaskC("VTOMaskC", Float) = 0
		_qubaohedu("qubaohedu", Range( 0 , 1)) = 0
		[HDR]_DepthColor("DepthColor", Color) = (0,0,0,0)
		_Zwrite("Zwrite", Float) = 0
		[Enum(Option1,0,Option2,1)]_DepthF("DepthF", Float) = 0
		_Dir("Dir", Vector) = (0,0,0,0)
		[HDR]_BackFaceColor("BackFaceColor", Color) = (1,1,1,0)
		[Toggle]_IfMaskColor("IfMaskColor", Float) = 0
		[Enum(Option1,0,Option2,1)]_CustomDistort("CustomDistort", Float) = 0
		[HDR]_AddTexColor("AddTexColor", Color) = (0,0,0,0)
		_AddTexBlend("AddTexBlend", Range( 0 , 1)) = 0
		[Toggle]_IfAddTex("IfAddTex", Float) = 0
		_DissolveTexDivide("DissolveTexDivide", Range( 1 , 10)) = 1
		[Enum(Option1,0,Option2,1)]_CustomdataDisT("CustomdataDisT", Float) = 0
		_DissloveTexPlus("DissloveTexPlus", 2D) = "black" {}
		_CenterU("CenterU", Float) = 0.5
		_CenterV("CenterV", Float) = 0.5
		[Enum(off,0,on,1)]_ScreenAsMain("ScreenAsMain", Float) = 0
		[Toggle]_softback("softback", Float) = 0
		_MainTexRefine("MainTexRefine", Vector) = (1,1,2,0)
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
		_AddTexRefine("AddTexRefine", Vector) = (1,1,2,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		_VTOTexExp("VTOTexExp", Range( 0 , 10)) = 1
		_DissolveTexExp("DissolveTexExp", Range( 0 , 10)) = 1
		[Toggle]_IfCustomLight("IfCustomLight", Float) = 0
		_AddTex("AddTex", 2D) = "white" {}
		_DissloveTex("DissloveTex", 2D) = "white" {}
		_VTOTex("VTOTex", 2D) = "white" {}
		_MainTex("MainTex", 2D) = "white" {}
		_MaskTex("MaskTex", 2D) = "white" {}
		_MaskPlusTex("MaskPlusTex", 2D) = "white" {}
		[Toggle]_AddTexC("AddTexC", Float) = 0
		[Toggle]_MaintexC("MaintexC", Float) = 0
		[Toggle]_VTOC("VTOC", Float) = 0
		[Toggle]_MaskPlusC("MaskPlusC", Float) = 0
		[Toggle]_MaskC("MaskC", Float) = 0
		[Toggle]_DissolveC("DissolveC", Float) = 0
		[Toggle]_MaintexCV("MaintexCV", Float) = 0
		[Toggle]_VTOCV("VTOCV", Float) = 0
		[Toggle]_MaskPlusCV("MaskPlusCV", Float) = 0
		[Toggle]_MaskCV("MaskCV", Float) = 0
		[Toggle]_DissolvePlusC("DissolvePlusC", Float) = 0
		[Toggle]_DissolvePlusAR("DissolvePlusAR", Float) = 1
		[Toggle]_DissolvePlusCV("DissolvePlusCV", Float) = 0
		[Toggle]_DissolveCV("DissolveCV", Float) = 0
		[Toggle]_AddTexCV("AddTexCV", Float) = 0
		[Toggle]_MainTex_ar("MainTex_a/r", Float) = 0
		[Toggle]_VTOAR("VTOAR", Float) = 1
		[Toggle]_MaskPlusAR("MaskPlusAR", Float) = 1
		[Toggle]_MaskAlphaRA("MaskAlphaRA", Float) = 1
		[Toggle]_DissolveAR("DissolveAR", Float) = 1
		_NormalTex("NormalTex", 2D) = "white" {}
		_StaticNormalScale("StaticNormalScale", Float) = 0
		_StaticNormalOffset("StaticNormalOffset", Range( 0 , 1)) = 0
		[Toggle]_IfStaticNormal("IfStaticNormal", Float) = 0
		_CubemapScale("CubemapScale", Range( 0 , 10)) = 0
		[Toggle]_IfCubemap("IfCubemap", Float) = 0
		[Toggle]_IfDissolvePlus("IfDissolvePlus", Float) = 0
		_CubeMap("CubeMap", CUBE) = "white" {}
		[Toggle]_CustomdataDis("CustomdataDis", Float) = 0
		[Toggle]_sot_sting_A("sot_sting_A", Float) = 0
		[Enum(Alpha,0,Add,1,Multiply,2)]_AddTexBlendMode("AddTexBlendMode", Float) = 0
		_Parallax("Parallax", Range( 0 , 1)) = 0
		[Toggle]_IfPara("IfPara", Float) = 0
		_ParaTex("ParaTex", 2D) = "white" {}
		[Toggle]_IfFlowmap("IfFlowmap", Float) = 0
		[Toggle]_IfNormalDistort("IfNormalDistort", Float) = 0
		[Toggle]_DistortTexAR("DistortTexAR", Float) = 1
		_DistortTex("DistortTex", 2D) = "white" {}
		[Toggle]_DistortMaskTexAR("DistortMaskTexAR", Float) = 1
		_DistortMaskTex("DistortMaskTex", 2D) = "white" {}
		_DistortMaskTexR("DistortMaskTexR", Range( 0 , 360)) = 0
		[Toggle]_DistortMaskTexC("DistortMaskTexC", Float) = 0
		[Toggle]_DistortMaskTexCV("DistortMaskTexCV", Float) = 0
		[Toggle]_AddTexAR("AddTexAR", Float) = 0
		[Toggle]_IfAddTexAlpha("IfAddTexAlpha", Float) = 0
		[Toggle]_IfAddTexColor("IfAddTexColor", Float) = 1
		[Toggle]_AlphaAdd("AlphaAdd", Float) = 0
		[Toggle]_DistortRemap("DistortRemap", Float) = 0
		[Toggle]_VTORemap("VTORemap", Float) = 0
		[Enum(Normal,0,Polar,1,Cylinder,2,UV2,3)]_MaskTexUVS("MaskTexUVS", Float) = 0
		[Enum(Normal,0,Polar,1,Cylinder,2,UV2,3)]_DissolveTexUVS2("DissolveTexUVS2", Float) = 0
		[Enum(Normal,0,Polar,1,Cylinder,2,UV2,3)]_AddTexUVS("AddTexUVS", Float) = 0
		[Toggle]_CustomdataMainTexUV("CustomdataMainTexUV", Float) = 0
		[Toggle]_CAddTexUV("CAddTexUV", Float) = 0
		[Toggle]_CAddTexUVT("CAddTexUVT", Float) = 1
		_Reference("Reference", Range( 0 , 200)) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_Pass("Pass", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_Comparison("Comparison", Float) = 8
		[Enum(UnityEngine.Rendering.StencilOp)]_Fail("Fail", Float) = 0
		_StencilStyle("StencilStyle", Float) = 0
		[Toggle]_IfMaskPlusTex("IfMaskPlusTex", Float) = 0
		[Toggle]_IfDissolveColor("IfDissolveColor", Float) = 1
		[Enum(Custom1,0,Custom2,1)]_DissolveFactorC1("DissolveFactorC1", Float) = 1
		[Enum(Custom1,0,Custom2,1)]_DistortFactorC1("DistortFactorC1", Float) = 1
		[Enum(Custom1,0,Custom2,1)]_MainOffsetVC1("MainOffsetVC1", Float) = 0
		[Enum(Custom1,0,Custom2,1)]_MaskOffsetVC1("MaskOffsetVC1", Float) = 0
		[Enum(Custom1,0,Custom2,1)]_MainOffsetUC1("MainOffsetUC1", Float) = 0
		[Enum(Custom1,0,Custom2,1)]_DissolveOffsetVC1("DissolveOffsetVC1", Float) = 1
		[Enum(Custom1,0,Custom2,1)]_MaskOffsetUC1("MaskOffsetUC1", Float) = 0
		[Enum(Custom1,0,Custom2,1)]_VATFrameC1("VATFrameC1", Float) = 1
		[Enum(Custom1,0,Custom2,1)]_VTOFactorC1("VTOFactorC1", Float) = 1
		[Enum(x,0,y,1,z,2,w,3,none,4)]_MainOffsetVC2("MainOffsetVC2", Float) = 1
		[Enum(x,0,y,1,z,2,w,3,none,4)]_MaskOffsetVC2("MaskOffsetVC2", Float) = 3
		[Enum(Custom1,0,Custom2,1)]_DissolveOffsetUC1("DissolveOffsetUC1", Float) = 1
		[Enum(x,0,y,1,z,2,w,3,none,4)]_DissolveOffsetVC2("DissolveOffsetVC2", Float) = 1
		[Enum(x,0,y,1,z,2,w,3,none,4)]_DissolveFactorC2("DissolveFactorC2", Float) = 2
		[Enum(x,0,y,1,z,2,w,3,none,4)]_DissolveOffsetUC2("DissolveOffsetUC2", Float) = 0
		[Enum(x,0,y,1,z,2,w,3,none,4)]_DistortFactorC2("DistortFactorC2", Float) = 3
		[Enum(x,0,y,1,z,2,w,3,none,4)]_MainOffsetUC2("MainOffsetUC2", Float) = 0
		[Enum(x,0,y,1,z,2,w,3,none,4)]_MaskOffsetUC2("MaskOffsetUC2", Float) = 2
		[Enum(x,0,y,1,z,2,w,3,none,4)]_VATFrameC2("VATFrameC2", Float) = 4
		[Enum(x,0,y,1,z,2,w,3,none,4)]_VTOFactorC2("VTOFactorC2", Float) = 4
		[Toggle]_IfFNLAlpha("IfFNLAlpha", Float) = 0
		_VATPositionTex("VATPositionTex", 2D) = "black" {}
		_VATNormalTex("VATNormalTex", 2D) = "black" {}
		[Toggle]_IfVAT("IfVAT", Float) = 0
		[Toggle]_CustomVAT("CustomVAT", Float) = 0
		[Toggle]_ParticleVAT("ParticleVAT", Float) = 0
		[Toggle]_screenVTOon("screenVTOon", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull [_Cullmode]
		ZWrite [_Zwrite]
		ZTest [_Ztest]
		Stencil
		{
			Ref [_Reference]
			Comp [_Comparison]
			Pass [_Pass]
			Fail [_Fail]
		}
		Blend [_Scr] [_Dst]
		
		GrabPass{ }
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "UnityStandardUtils.cginc"
		#include "Lighting.cginc"
		#pragma target 5.0
		#pragma multi_compile_local _MAINTEXUVS_NORMAL _MAINTEXUVS_POLAR _MAINTEXUVS_CYLINDER _MAINTEXUVS_UV2
		#pragma multi_compile_local _FACE_X _FACE_Y _FACE_Z
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)

		struct appdata_full_custom
		{
			float4 vertex : POSITION;
			float4 tangent : TANGENT;
			float3 normal : NORMAL;
			float4 texcoord : TEXCOORD0;
			float4 texcoord1 : TEXCOORD1;
			float4 texcoord2 : TEXCOORD2;
			float4 texcoord3 : TEXCOORD3;
			float4 color : COLOR;
			UNITY_VERTEX_INPUT_INSTANCE_ID
			float4 ase_texcoord7 : TEXCOORD7;
			float4 ase_texcoord4 : TEXCOORD4;
		};
		struct Input
		{
			float4 uv4_texcoord4;
			float3 worldPos;
			float4 uv_texcoord;
			float3 viewDir;
			INTERNAL_DATA
			float3 worldNormal;
			float4 uv2_texcoord2;
			float4 uv3_texcoord3;
			float4 vertexColor : COLOR;
			float4 screenPos;
			float4 screenPosition88;
			float3 worldRefl;
			half ASEVFace : VFACE;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float _Fail;
		uniform float _Reference;
		uniform float _Comparison;
		uniform float _Pass;
		uniform float _Ztest;
		uniform float _Scr;
		uniform float _Cullmode;
		uniform float _Dst;
		uniform float _Zwrite;
		uniform float _StencilStyle;
		uniform float _screenVTOon;
		uniform float _IfVAT;
		uniform float _VTORemap;
		uniform float _VTOAR;
		uniform sampler2D _VTOTex;
		uniform float _VTOC;
		uniform float _VTOTex_Uspeed;
		uniform float _VTOTex_Vspeed;
		uniform float4 _VTOTex_ST;
		uniform float _CenterU;
		uniform float _CenterV;
		uniform float4 _TexCenter;
		uniform float _VTOR;
		uniform float _VTOCV;
		uniform float _VTOTexExp;
		uniform float _VTOMaskAR;
		uniform sampler2D _VTOMaskTex;
		uniform float _VTOMaskC;
		uniform float4 _VTOMaskTex_ST;
		uniform float _VTOMaskR;
		uniform float _VTOMaskCV;
		uniform float _ToggleSwitch0;
		uniform float _VTOFactor;
		uniform float _VTOFactorC2;
		uniform float _VTOFactorC1;
		uniform float _ParticleVAT;
		uniform sampler2D _VATPositionTex;
		SamplerState sampler_VATPositionTex;
		float4 _VATPositionTex_TexelSize;
		uniform float _VATTime;
		uniform float _CustomVAT;
		uniform float _VATFrameFactor;
		uniform float _VATFrameC2;
		uniform float _VATFrameC1;
		uniform sampler2D _VATNormalTex;
		uniform float _AlphaAdd;
		uniform float _Mask_scale;
		uniform float _MaskAlphaRA;
		uniform sampler2D _MaskTex;
		uniform float _MaskC;
		uniform float _Mask_Uspeed;
		uniform float _Mask_Vspeed;
		uniform float _IfPara;
		uniform float _MaskTexUVS;
		uniform float4 _MaskTex_ST;
		uniform sampler2D _ParaTex;
		uniform float _Parallax;
		uniform float4 _ParaTex_ST;
		uniform float _DistortMask;
		uniform float _IfFlowmap;
		uniform float _IfNormalDistort;
		uniform float _CustomDistort;
		uniform float _DistortFactor;
		uniform float _DistortFactorC2;
		uniform float _DistortFactorC1;
		uniform float _DistortMaskTexAR;
		uniform sampler2D _DistortMaskTex;
		uniform float _DistortMaskTexC;
		uniform float4 _DistortMaskTex_ST;
		uniform float _DistortMaskTexR;
		uniform float _DistortMaskTexCV;
		uniform float _DistortRemap;
		uniform float _DistortTexAR;
		uniform sampler2D _DistortTex;
		uniform float _DistortTex_Uspeed;
		uniform float _DistortTex_Vspeed;
		uniform float4 _DistortTex_ST;
		uniform float _CustomdataMaskUV;
		uniform float _MaskOffsetUC2;
		uniform float _MaskOffsetUC1;
		uniform float _MaskOffsetVC2;
		uniform float _MaskOffsetVC1;
		uniform float _Mask_rotat;
		uniform float _MaskCV;
		uniform float _IfMaskPlusTex;
		uniform float _MaskPlusAR;
		uniform sampler2D _MaskPlusTex;
		uniform float _MaskPlusC;
		uniform float _MaskPlusUspeed;
		uniform float _MaskPlusVspeed;
		uniform float4 _MaskPlusTex_ST;
		uniform float _MaskPlusR;
		uniform float _MaskPlusCV;
		uniform float _IfAddTexAlpha;
		uniform float _CustomdataDisT;
		uniform float _ScreenAsMain;
		uniform float _MainTex_ar;
		uniform sampler2D _MainTex;
		uniform float _MaintexC;
		uniform float _MainTex_Uspeed;
		uniform float _MainTex_Vspeed;
		uniform float _CustomdataMainTexUV;
		uniform float _MainOffsetUC2;
		uniform float _MainOffsetUC1;
		uniform float _MainOffsetVC2;
		uniform float _MainOffsetVC1;
		uniform float4 _MainTex_ST;
		uniform float _DistortMainTex;
		uniform float _MainTex_rotat;
		uniform float _MaintexCV;
		uniform float _MainTexAC;
		ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
		uniform float4 _MainColor;
		uniform float _AddTexBlendMode;
		uniform float _AddTexAR;
		uniform sampler2D _AddTex;
		uniform float _AddTexC;
		uniform float _AddTexUspeed;
		uniform float _AddTexVspeed;
		uniform float _AddTexUVS;
		uniform float4 _AddTex_ST;
		uniform float _DistortAddTex;
		uniform float _CAddTexUV;
		uniform float _CAddTexUVT;
		uniform float _AddTexRo;
		uniform float _AddTexCV;
		uniform float _AddTexAC;
		uniform float _AddTexBlend;
		uniform float _MainAlpha;
		uniform float _sot_sting_A;
		uniform float _DIssloveSoft;
		uniform float _CustomdataDis;
		uniform float _DIssloveFactor;
		uniform float _DissolveFactorC2;
		uniform float _DissolveFactorC1;
		uniform float _DissolveAR;
		uniform sampler2D _DissloveTex;
		uniform float _DissolveC;
		uniform float _DisTex_Uspeed;
		uniform float _DisTex_Vspeed;
		uniform float _DissolveTexUVS2;
		uniform float4 _DissloveTex_ST;
		uniform float _DistortDisTex;
		uniform float _IfDissolveOffsetC;
		uniform float _DissolveOffsetUC2;
		uniform float _DissolveOffsetUC1;
		uniform float _DissolveOffsetVC2;
		uniform float _DissolveOffsetVC1;
		uniform float _DIssolve_rotat;
		uniform float _DissolveCV;
		uniform float _DissolveTexExp;
		uniform float _DissolveTexDivide;
		uniform float _IfDissolvePlus;
		uniform float _DissolvePlusAR;
		uniform sampler2D _DissloveTexPlus;
		uniform float _DissolvePlusC;
		uniform float4 _DissloveTexPlus_ST;
		uniform float _DissolvePlusR;
		uniform float _DissolvePlusCV;
		uniform float _DIssloveWide;
		uniform float _FNLfanxiangkaiguan;
		uniform float _softback;
		uniform float _softFacotr;
		uniform float _Depthfadeon;
		uniform float _DepthF;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _DepthfadeFactor;
		uniform float _IfFNLAlpha;
		uniform float3 _Dir;
		uniform float _fnl_power;
		uniform float _fnl_sacle;
		uniform float4 _DepthColor;
		uniform float4 _fnl_color;
		uniform float _IfDissolveColor;
		uniform float _soft_sting;
		uniform float _IfAddTex;
		uniform float4 _MainTexRefine;
		uniform float _IfMaskColor;
		uniform float _IfAddTexColor;
		uniform float4 _AddTexColor;
		uniform float4 _AddTexRefine;
		uniform float4 _DIssloveColor;
		uniform float _IfCubemap;
		uniform samplerCUBE _CubeMap;
		uniform sampler2D _NormalTex;
		uniform float _NormalTexC;
		uniform float _NormalTex_Uspeed;
		uniform float _NormalTex_Vspeed;
		uniform float4 _NormalTex_ST;
		uniform float _DistortNormalTex;
		uniform float _NormalTex_Rotat;
		uniform float _NormalTexCV;
		uniform float _NormalScale;
		uniform float _IfStaticNormal;
		uniform float _StaticNormalOffset;
		uniform float _StaticNormalScale;
		uniform float _CubemapScale;
		uniform float _LightScale;
		uniform float4 _BackFaceColor;
		uniform float _qubaohedu;
		uniform float _IfCustomLight;


		float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
		{
			original -= center;
			float C = cos( angle );
			float S = sin( angle );
			float t = 1 - C;
			float m00 = t * u.x * u.x + C;
			float m01 = t * u.x * u.y - S * u.z;
			float m02 = t * u.x * u.z + S * u.y;
			float m10 = t * u.x * u.y + S * u.z;
			float m11 = t * u.y * u.y + C;
			float m12 = t * u.y * u.z - S * u.x;
			float m20 = t * u.x * u.z - S * u.y;
			float m21 = t * u.y * u.z + S * u.x;
			float m22 = t * u.z * u.z + C;
			float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
			return mul( finalMatrix, original ) + center;
		}


		inline float2 POM( sampler2D heightMap, float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, float parallax, float refPlane, float2 tilling, float2 curv, int index )
		{
			float3 result = 0;
			int stepIndex = 0;
			int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
			float layerHeight = 1.0 / numSteps;
			float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
			uvs.xy += refPlane * plane;
			float2 deltaTex = -plane * layerHeight;
			float2 prevTexOffset = 0;
			float prevRayZ = 1.0f;
			float prevHeight = 0.0f;
			float2 currTexOffset = deltaTex;
			float currRayZ = 1.0f - layerHeight;
			float currHeight = 0.0f;
			float intersection = 0;
			float2 finalTexOffset = 0;
			while ( stepIndex < numSteps + 1 )
			{
			 	currHeight = tex2Dgrad( heightMap, uvs + currTexOffset, dx, dy ).r;
			 	if ( currHeight > currRayZ )
			 	{
			 	 	stepIndex = numSteps + 1;
			 	}
			 	else
			 	{
			 	 	stepIndex++;
			 	 	prevTexOffset = currTexOffset;
			 	 	prevRayZ = currRayZ;
			 	 	prevHeight = currHeight;
			 	 	currTexOffset += deltaTex;
			 	 	currRayZ -= layerHeight;
			 	}
			}
			int sectionSteps = 8;
			int sectionIndex = 0;
			float newZ = 0;
			float newHeight = 0;
			while ( sectionIndex < sectionSteps )
			{
			 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
			 	finalTexOffset = prevTexOffset + intersection * deltaTex;
			 	newZ = prevRayZ - intersection * layerHeight;
			 	newHeight = tex2Dgrad( heightMap, uvs + finalTexOffset, dx, dy ).r;
			 	if ( newHeight > newZ )
			 	{
			 	 	currTexOffset = finalTexOffset;
			 	 	currHeight = newHeight;
			 	 	currRayZ = newZ;
			 	 	deltaTex = intersection * deltaTex;
			 	 	layerHeight = intersection * layerHeight;
			 	}
			 	else
			 	{
			 	 	prevTexOffset = finalTexOffset;
			 	 	prevHeight = newHeight;
			 	 	prevRayZ = newZ;
			 	 	deltaTex = ( 1 - intersection ) * deltaTex;
			 	 	layerHeight = ( 1 - intersection ) * layerHeight;
			 	}
			 	sectionIndex++;
			}
			return uvs.xy + finalTexOffset;
		}


		inline float4 ASE_ComputeGrabScreenPos( float4 pos )
		{
			#if UNITY_UV_STARTS_AT_TOP
			float scale = -1.0;
			#else
			float scale = 1.0;
			#endif
			float4 o = pos;
			o.y = pos.w * 0.5f;
			o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
			return o;
		}


		void vertexDataFunc( inout appdata_full_custom v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 appendResult49_g1011 = (float2(_VTOTex_Uspeed , _VTOTex_Vspeed));
			float4 break36_g1009 = _VTOTex_ST;
			float2 appendResult31_g1009 = (float2(break36_g1009.x , break36_g1009.y));
			float2 appendResult38_g1009 = (float2(break36_g1009.z , break36_g1009.w));
			float2 appendResult866 = (float2(_CenterU , _CenterV));
			float2 centeruv867 = appendResult866;
			float2 CenteredUV15_g1010 = ( v.texcoord.xy - centeruv867 );
			float2 break17_g1010 = CenteredUV15_g1010;
			float2 appendResult23_g1010 = (float2(( length( CenteredUV15_g1010 ) * break36_g1009.x * 2.0 ) , ( atan2( break17_g1010.x , break17_g1010.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1009.y )));
			float3 ase_vertex3Pos = v.vertex.xyz;
			float4 break537 = ( _TexCenter + float4( ase_vertex3Pos , 0.0 ) );
			float2 appendResult554 = (float2((0.0 + (atan( ( break537.x / break537.z ) ) - ( -0.5 * UNITY_PI )) * (1.0 - 0.0) / (( 0.5 * UNITY_PI ) - ( -0.5 * UNITY_PI ))) , break537.y));
			float2 appendResult553 = (float2((0.0 + (atan( ( break537.y / break537.z ) ) - ( -0.5 * UNITY_PI )) * (1.0 - 0.0) / (( 0.5 * UNITY_PI ) - ( -0.5 * UNITY_PI ))) , break537.x));
			float2 appendResult555 = (float2((0.0 + (atan( ( break537.x / break537.y ) ) - ( -0.5 * UNITY_PI )) * (1.0 - 0.0) / (( 0.5 * UNITY_PI ) - ( -0.5 * UNITY_PI ))) , break537.z));
			#if defined(_FACE_X)
				float2 staticSwitch556 = appendResult553;
			#elif defined(_FACE_Y)
				float2 staticSwitch556 = appendResult554;
			#elif defined(_FACE_Z)
				float2 staticSwitch556 = appendResult555;
			#else
				float2 staticSwitch556 = appendResult554;
			#endif
			float2 maintongUV557 = staticSwitch556;
			float2 appendResult30_g1009 = (float2(v.texcoord3.x , v.texcoord3.y));
			float2 appendResult32_g1009 = (float2(break36_g1009.x , break36_g1009.y));
			#if defined(_MAINTEXUVS_NORMAL)
				float2 staticSwitch841 = ( ( v.texcoord.xy * appendResult31_g1009 ) + appendResult38_g1009 );
			#elif defined(_MAINTEXUVS_POLAR)
				float2 staticSwitch841 = ( appendResult23_g1010 + appendResult38_g1009 );
			#elif defined(_MAINTEXUVS_CYLINDER)
				float2 staticSwitch841 = ( ( maintongUV557 * appendResult31_g1009 ) + appendResult38_g1009 );
			#elif defined(_MAINTEXUVS_UV2)
				float2 staticSwitch841 = ( ( appendResult30_g1009 * appendResult32_g1009 ) + appendResult38_g1009 );
			#else
				float2 staticSwitch841 = ( ( v.texcoord.xy * appendResult31_g1009 ) + appendResult38_g1009 );
			#endif
			float2 panner44_g1011 = ( 1.0 * _Time.y * appendResult49_g1011 + staticSwitch841);
			float cos55_g1011 = cos( ( ( ( _VTOR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g1011 = sin( ( ( ( _VTOR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g1011 = mul( panner44_g1011 - float2( 0.5,0.5 ) , float2x2( cos55_g1011 , -sin55_g1011 , sin55_g1011 , cos55_g1011 )) + float2( 0.5,0.5 );
			float2 break52_g1011 = rotator55_g1011;
			float2 break54_g1011 = rotator55_g1011;
			float clampResult60_g1011 = clamp( break54_g1011.x , 0.0 , 1.0 );
			float clampResult50_g1011 = clamp( break54_g1011.y , 0.0 , 1.0 );
			float2 appendResult53_g1011 = (float2(( (float)(int)_VTOC == 0.0 ? break52_g1011.x : clampResult60_g1011 ) , ( (float)(int)_VTOCV == 0.0 ? break52_g1011.y : clampResult50_g1011 )));
			float4 tex2DNode27_g1011 = tex2Dlod( _VTOTex, float4( appendResult53_g1011, 0, 0.0) );
			float temp_output_1513_0 = saturate( pow( ( (float)(int)_VTOAR == 0.0 ? tex2DNode27_g1011.a : tex2DNode27_g1011.r ) , _VTOTexExp ) );
			float4 break36_g1007 = _VTOMaskTex_ST;
			float2 appendResult31_g1007 = (float2(break36_g1007.x , break36_g1007.y));
			float2 appendResult38_g1007 = (float2(break36_g1007.z , break36_g1007.w));
			float2 CenteredUV15_g1008 = ( v.texcoord.xy - centeruv867 );
			float2 break17_g1008 = CenteredUV15_g1008;
			float2 appendResult23_g1008 = (float2(( length( CenteredUV15_g1008 ) * break36_g1007.x * 2.0 ) , ( atan2( break17_g1008.x , break17_g1008.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1007.y )));
			float2 appendResult30_g1007 = (float2(v.texcoord3.x , v.texcoord3.y));
			float2 appendResult32_g1007 = (float2(break36_g1007.x , break36_g1007.y));
			#if defined(_MAINTEXUVS_NORMAL)
				float2 staticSwitch853 = ( ( v.texcoord.xy * appendResult31_g1007 ) + appendResult38_g1007 );
			#elif defined(_MAINTEXUVS_POLAR)
				float2 staticSwitch853 = ( appendResult23_g1008 + appendResult38_g1007 );
			#elif defined(_MAINTEXUVS_CYLINDER)
				float2 staticSwitch853 = ( ( maintongUV557 * appendResult31_g1007 ) + appendResult38_g1007 );
			#elif defined(_MAINTEXUVS_UV2)
				float2 staticSwitch853 = ( ( appendResult30_g1007 * appendResult32_g1007 ) + appendResult38_g1007 );
			#else
				float2 staticSwitch853 = ( ( v.texcoord.xy * appendResult31_g1007 ) + appendResult38_g1007 );
			#endif
			float cos263 = cos( ( ( ( _VTOMaskR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin263 = sin( ( ( ( _VTOMaskR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator263 = mul( staticSwitch853 - float2( 0.5,0.5 ) , float2x2( cos263 , -sin263 , sin263 , cos263 )) + float2( 0.5,0.5 );
			float2 break372 = rotator263;
			float2 break371 = rotator263;
			float clampResult257 = clamp( break371.x , 0.0 , 1.0 );
			float clampResult373 = clamp( break371.y , 0.0 , 1.0 );
			float2 appendResult375 = (float2((( _VTOMaskC )?( clampResult257 ):( break372.x )) , (( _VTOMaskCV )?( clampResult373 ):( break372.y ))));
			float4 tex2DNode81 = tex2Dlod( _VTOMaskTex, float4( appendResult375, 0, 0.0) );
			float temp_output_25_0_g1012 = _VTOFactorC2;
			float4 appendResult38_g1012 = (float4(v.texcoord.z , v.texcoord.w , v.texcoord1.x , v.texcoord1.y));
			float4 appendResult39_g1012 = (float4(v.texcoord1.z , v.texcoord1.w , v.texcoord2.xy.x , v.texcoord2.xy.y));
			float4 break30_g1012 = ( _VTOFactorC1 == 0.0 ? appendResult38_g1012 : appendResult39_g1012 );
			float ifLocalVar20_g1012 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g1012 )
				ifLocalVar20_g1012 = ( temp_output_25_0_g1012 == 0.0 ? break30_g1012.x : break30_g1012.y );
			else if( 2.0 == temp_output_25_0_g1012 )
				ifLocalVar20_g1012 = break30_g1012.z;
			else if( 2.0 < temp_output_25_0_g1012 )
				ifLocalVar20_g1012 = ( temp_output_25_0_g1012 == 4.0 ? 0.0 : break30_g1012.w );
			float VTOFactorC1855 = ifLocalVar20_g1012;
			float temp_output_78_0 = ( ( _VTORemap == 0.0 ? temp_output_1513_0 : (-0.5 + (temp_output_1513_0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ) * (( _VTOMaskAR )?( tex2DNode81.r ):( tex2DNode81.a )) * (( _ToggleSwitch0 )?( VTOFactorC1855 ):( _VTOFactor )) );
			float3 ase_vertexNormal = v.normal.xyz;
			float temp_output_25_0_g1006 = _VATFrameC2;
			float4 appendResult38_g1006 = (float4(v.texcoord.z , v.texcoord.w , v.texcoord1.x , v.texcoord1.y));
			float4 appendResult39_g1006 = (float4(v.texcoord1.z , v.texcoord1.w , v.texcoord2.xy.x , v.texcoord2.xy.y));
			float4 break30_g1006 = ( _VATFrameC1 == 0.0 ? appendResult38_g1006 : appendResult39_g1006 );
			float ifLocalVar20_g1006 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g1006 )
				ifLocalVar20_g1006 = ( temp_output_25_0_g1006 == 0.0 ? break30_g1006.x : break30_g1006.y );
			else if( 2.0 == temp_output_25_0_g1006 )
				ifLocalVar20_g1006 = break30_g1006.z;
			else if( 2.0 < temp_output_25_0_g1006 )
				ifLocalVar20_g1006 = ( temp_output_25_0_g1006 == 4.0 ? 0.0 : break30_g1006.w );
			float VATFrameC1919 = ifLocalVar20_g1006;
			float2 appendResult1915 = (float2(( ( _VATPositionTex_TexelSize.x * ( _VATTime - 1.0 ) * (( _CustomVAT )?( VATFrameC1919 ):( _VATFrameFactor )) ) + v.ase_texcoord7.xy.x ) , v.ase_texcoord7.xy.y));
			float4 tex2DNode1886 = tex2Dlod( _VATPositionTex, float4( appendResult1915, 0, 0.0) );
			float4 break1963 = tex2DNode1886;
			float3 appendResult1962 = (float3(break1963.r , break1963.g , break1963.b));
			float4 break49_g1013 = v.ase_texcoord4;
			float3 appendResult50_g1013 = (float3(break49_g1013.x , break49_g1013.y , break49_g1013.z));
			float3 appendResult22_g1013 = (float3(v.texcoord2.z , 0.0 , 0.0));
			float3 appendResult20_g1013 = (float3(0.0 , 0.0 , v.texcoord3.x));
			float3 temp_output_28_0_g1013 = ( appendResult22_g1013 + appendResult20_g1013 );
			float3 rotatedValue41_g1013 = RotateAroundAxis( float3( 0,0,0 ), temp_output_28_0_g1013, normalize( float3( 0,1,0 ) ), ( 0.5 * UNITY_PI ) );
			float temp_output_30_0_g1013 = atan( ( v.texcoord2.z / v.texcoord3.x ) );
			float3 appendResult18_g1013 = (float3(v.texcoord3.y , v.texcoord3.z , v.texcoord3.w));
			float3 break24_g1013 = appendResult18_g1013;
			float3 rotatedValue25_g1013 = RotateAroundAxis( float3( 0,0,0 ), float3(0,0,1), float3(1,0,0), break24_g1013.x );
			float3 rotatedValue26_g1013 = RotateAroundAxis( float3( 0,0,0 ), tex2DNode1886.rgb, normalize( float3( 1,0,0 ) ), break24_g1013.x );
			float3 rotatedValue29_g1013 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue26_g1013, normalize( rotatedValue25_g1013 ), break24_g1013.z );
			float3 rotatedValue33_g1013 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue29_g1013, normalize( float3( 0,1,0 ) ), break24_g1013.y );
			float3 rotatedValue37_g1013 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue33_g1013, float3( 0,1,0 ), temp_output_30_0_g1013 );
			float3 rotatedValue38_g1013 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue33_g1013, float3( 0,1,0 ), ( temp_output_30_0_g1013 + UNITY_PI ) );
			float3 ifLocalVar40_g1013 = 0;
			if( v.texcoord3.x >= 0.0 )
				ifLocalVar40_g1013 = rotatedValue37_g1013;
			else
				ifLocalVar40_g1013 = rotatedValue38_g1013;
			float3 rotatedValue43_g1013 = RotateAroundAxis( float3( 0,0,0 ), ifLocalVar40_g1013, normalize( rotatedValue41_g1013 ), -atan( ( v.texcoord2.w / length( temp_output_28_0_g1013 ) ) ) );
			float3 VTO82 = ( _IfVAT == 0.0 ? ( temp_output_78_0 * ase_vertexNormal ) : (( _ParticleVAT )?( ( appendResult50_g1013 * rotatedValue43_g1013 ) ):( appendResult1962 )) );
			float3 temp_cast_8 = (0.0).xxx;
			float3 temp_output_1959_0 = ( _screenVTOon == 0.0 ? VTO82 : temp_cast_8 );
			v.vertex.xyz += temp_output_1959_0;
			v.vertex.w = 1;
			float4 VTONormal1902 = ( _IfVAT == 0.0 ? float4( ase_vertexNormal , 0.0 ) : tex2Dlod( _VATNormalTex, float4( appendResult1915, 0, 0.0) ) );
			v.normal = VTONormal1902.rgb;
			float3 vertexPos88 = ase_vertex3Pos;
			float4 ase_screenPos88 = ComputeScreenPos( UnityObjectToClipPos( vertexPos88 ) );
			o.screenPosition88 = ase_screenPos88;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			#ifdef UNITY_PASS_FORWARDBASE
			float ase_lightAtten = data.atten;
			if( _LightColor0.a == 0)
			ase_lightAtten = 0;
			#else
			float3 ase_lightAttenRGB = gi.light.color / ( ( _LightColor0.rgb ) + 0.000001 );
			float ase_lightAtten = max( max( ase_lightAttenRGB.r, ase_lightAttenRGB.g ), ase_lightAttenRGB.b );
			#endif
			#if defined(HANDLE_SHADOWS_BLENDING_IN_GI)
			half bakedAtten = UnitySampleBakedOcclusion(data.lightmapUV.xy, data.worldPos);
			float zDist = dot(_WorldSpaceCameraPos - data.worldPos, UNITY_MATRIX_V[2].xyz);
			float fadeDist = UnityComputeShadowFadeDistance(data.worldPos, zDist);
			ase_lightAtten = UnityMixRealtimeAndBakedShadows(data.atten, bakedAtten, UnityComputeShadowFade(fadeDist));
			#endif
			float2 appendResult49_g1032 = (float2(_Mask_Uspeed , _Mask_Vspeed));
			float Ifpara1474 = _IfPara;
			float2 appendResult30_g1027 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float4 break36_g1027 = _MaskTex_ST;
			float2 appendResult32_g1027 = (float2(break36_g1027.x , break36_g1027.y));
			float2 appendResult38_g1027 = (float2(break36_g1027.z , break36_g1027.w));
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 break537 = ( _TexCenter + float4( ase_vertex3Pos , 0.0 ) );
			float2 appendResult554 = (float2((0.0 + (atan( ( break537.x / break537.z ) ) - ( -0.5 * UNITY_PI )) * (1.0 - 0.0) / (( 0.5 * UNITY_PI ) - ( -0.5 * UNITY_PI ))) , break537.y));
			float2 appendResult553 = (float2((0.0 + (atan( ( break537.y / break537.z ) ) - ( -0.5 * UNITY_PI )) * (1.0 - 0.0) / (( 0.5 * UNITY_PI ) - ( -0.5 * UNITY_PI ))) , break537.x));
			float2 appendResult555 = (float2((0.0 + (atan( ( break537.x / break537.y ) ) - ( -0.5 * UNITY_PI )) * (1.0 - 0.0) / (( 0.5 * UNITY_PI ) - ( -0.5 * UNITY_PI ))) , break537.z));
			#if defined(_FACE_X)
				float2 staticSwitch556 = appendResult553;
			#elif defined(_FACE_Y)
				float2 staticSwitch556 = appendResult554;
			#elif defined(_FACE_Z)
				float2 staticSwitch556 = appendResult555;
			#else
				float2 staticSwitch556 = appendResult554;
			#endif
			float2 maintongUV557 = staticSwitch556;
			float2 appendResult31_g1027 = (float2(break36_g1027.x , break36_g1027.y));
			float2 appendResult866 = (float2(_CenterU , _CenterV));
			float2 centeruv867 = appendResult866;
			float2 CenteredUV15_g1028 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g1028 = CenteredUV15_g1028;
			float2 appendResult23_g1028 = (float2(( length( CenteredUV15_g1028 ) * break36_g1027.x * 2.0 ) , ( atan2( break17_g1028.x , break17_g1028.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1027.y )));
			float2 ifLocalVar2192 = 0;
			if( _MaskTexUVS > 1.0 )
				ifLocalVar2192 = ( ( maintongUV557 * appendResult31_g1027 ) + appendResult38_g1027 );
			else if( _MaskTexUVS == 1.0 )
				ifLocalVar2192 = ( appendResult23_g1028 + appendResult38_g1027 );
			else if( _MaskTexUVS < 1.0 )
				ifLocalVar2192 = ( ( i.uv_texcoord.xy * appendResult31_g1027 ) + appendResult38_g1027 );
			float2 temp_output_2194_0 = ( _MaskTexUVS == 3.0 ? ( ( appendResult30_g1027 * appendResult32_g1027 ) + appendResult38_g1027 ) : ifLocalVar2192 );
			float Parallax1492 = ( _Parallax * 0.1 );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float2 OffsetPOM80_g1031 = POM( _ParaTex, temp_output_2194_0, ddx(temp_output_2194_0), ddy(temp_output_2194_0), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float3 temp_cast_114 = (0.0).xxx;
			float temp_output_25_0_g944 = _DistortFactorC2;
			float4 appendResult38_g944 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g944 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g944 = ( _DistortFactorC1 == 0.0 ? appendResult38_g944 : appendResult39_g944 );
			float ifLocalVar20_g944 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g944 )
				ifLocalVar20_g944 = ( temp_output_25_0_g944 == 0.0 ? break30_g944.x : break30_g944.y );
			else if( 2.0 == temp_output_25_0_g944 )
				ifLocalVar20_g944 = break30_g944.z;
			else if( 2.0 < temp_output_25_0_g944 )
				ifLocalVar20_g944 = ( temp_output_25_0_g944 == 4.0 ? 0.0 : break30_g944.w );
			float DistortFactorC1851 = ifLocalVar20_g944;
			float2 appendResult49_g1020 = (float2(0.0 , 0.0));
			float4 break36_g1018 = _DistortMaskTex_ST;
			float2 appendResult31_g1018 = (float2(break36_g1018.x , break36_g1018.y));
			float2 appendResult38_g1018 = (float2(break36_g1018.z , break36_g1018.w));
			float2 CenteredUV15_g1019 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g1019 = CenteredUV15_g1019;
			float2 appendResult23_g1019 = (float2(( length( CenteredUV15_g1019 ) * break36_g1018.x * 2.0 ) , ( atan2( break17_g1019.x , break17_g1019.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1018.y )));
			float2 appendResult30_g1018 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float2 appendResult32_g1018 = (float2(break36_g1018.x , break36_g1018.y));
			#if defined(_MAINTEXUVS_NORMAL)
				float2 staticSwitch1604 = ( ( i.uv_texcoord.xy * appendResult31_g1018 ) + appendResult38_g1018 );
			#elif defined(_MAINTEXUVS_POLAR)
				float2 staticSwitch1604 = ( appendResult23_g1019 + appendResult38_g1018 );
			#elif defined(_MAINTEXUVS_CYLINDER)
				float2 staticSwitch1604 = ( ( maintongUV557 * appendResult31_g1018 ) + appendResult38_g1018 );
			#elif defined(_MAINTEXUVS_UV2)
				float2 staticSwitch1604 = ( ( appendResult30_g1018 * appendResult32_g1018 ) + appendResult38_g1018 );
			#else
				float2 staticSwitch1604 = ( ( i.uv_texcoord.xy * appendResult31_g1018 ) + appendResult38_g1018 );
			#endif
			float2 panner44_g1020 = ( 1.0 * _Time.y * appendResult49_g1020 + staticSwitch1604);
			float cos55_g1020 = cos( ( ( ( _DistortMaskTexR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g1020 = sin( ( ( ( _DistortMaskTexR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g1020 = mul( panner44_g1020 - float2( 0.5,0.5 ) , float2x2( cos55_g1020 , -sin55_g1020 , sin55_g1020 , cos55_g1020 )) + float2( 0.5,0.5 );
			float2 break52_g1020 = rotator55_g1020;
			float2 break54_g1020 = rotator55_g1020;
			float clampResult60_g1020 = clamp( break54_g1020.x , 0.0 , 1.0 );
			float clampResult50_g1020 = clamp( break54_g1020.y , 0.0 , 1.0 );
			float2 appendResult53_g1020 = (float2(( (float)(int)_DistortMaskTexC == 0.0 ? break52_g1020.x : clampResult60_g1020 ) , ( (float)(int)_DistortMaskTexCV == 0.0 ? break52_g1020.y : clampResult50_g1020 )));
			float4 tex2DNode27_g1020 = tex2D( _DistortMaskTex, appendResult53_g1020 );
			float temp_output_1587_0 = ( ( _CustomDistort == 0.0 ? _DistortFactor : DistortFactorC1851 ) * ( (float)(int)_DistortMaskTexAR == 0.0 ? tex2DNode27_g1020.a : tex2DNode27_g1020.r ) );
			float2 appendResult58 = (float2(_DistortTex_Uspeed , _DistortTex_Vspeed));
			float4 break36_g1016 = _DistortTex_ST;
			float2 appendResult31_g1016 = (float2(break36_g1016.x , break36_g1016.y));
			float2 appendResult38_g1016 = (float2(break36_g1016.z , break36_g1016.w));
			float2 CenteredUV15_g1017 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g1017 = CenteredUV15_g1017;
			float2 appendResult23_g1017 = (float2(( length( CenteredUV15_g1017 ) * break36_g1016.x * 2.0 ) , ( atan2( break17_g1017.x , break17_g1017.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1016.y )));
			float2 appendResult30_g1016 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float2 appendResult32_g1016 = (float2(break36_g1016.x , break36_g1016.y));
			#if defined(_MAINTEXUVS_NORMAL)
				float2 staticSwitch829 = ( ( i.uv_texcoord.xy * appendResult31_g1016 ) + appendResult38_g1016 );
			#elif defined(_MAINTEXUVS_POLAR)
				float2 staticSwitch829 = ( appendResult23_g1017 + appendResult38_g1016 );
			#elif defined(_MAINTEXUVS_CYLINDER)
				float2 staticSwitch829 = ( ( maintongUV557 * appendResult31_g1016 ) + appendResult38_g1016 );
			#elif defined(_MAINTEXUVS_UV2)
				float2 staticSwitch829 = ( ( appendResult30_g1016 * appendResult32_g1016 ) + appendResult38_g1016 );
			#else
				float2 staticSwitch829 = ( ( i.uv_texcoord.xy * appendResult31_g1016 ) + appendResult38_g1016 );
			#endif
			float2 panner59 = ( 1.0 * _Time.y * appendResult58 + staticSwitch829);
			float4 tex2DNode54 = tex2D( _DistortTex, panner59 );
			float temp_output_1550_0 = ( _DistortTexAR == 0.0 ? tex2DNode54.a : tex2DNode54.r );
			float temp_output_1684_0 = ( _DistortRemap == 0.0 ? temp_output_1550_0 : (-0.5 + (temp_output_1550_0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
			float3 temp_cast_121 = (( temp_output_1587_0 * temp_output_1684_0 )).xxx;
			float2 break1571 = panner59;
			float temp_output_1570_0 = ( pow( 1.0 , 3.0 ) * 0.1 );
			float2 appendResult1568 = (float2(( break1571.x + temp_output_1570_0 ) , break1571.y));
			float4 tex2DNode1577 = tex2D( _DistortTex, appendResult1568 );
			float temp_output_1579_0 = ( _DistortTexAR == 0.0 ? tex2DNode1577.a : tex2DNode1577.g );
			float3 appendResult1564 = (float3(1.0 , 0.0 , ( ( ( _DistortRemap == 0.0 ? temp_output_1579_0 : (-0.5 + (temp_output_1579_0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ) - temp_output_1684_0 ) * temp_output_1587_0 )));
			float2 appendResult1574 = (float2(break1571.x , ( break1571.y + temp_output_1570_0 )));
			float4 tex2DNode1576 = tex2D( _DistortTex, appendResult1574 );
			float temp_output_1580_0 = ( _DistortTexAR == 0.0 ? tex2DNode1576.a : tex2DNode1576.g );
			float3 appendResult1565 = (float3(0.0 , 1.0 , ( ( ( _DistortRemap == 0.0 ? temp_output_1580_0 : (-0.5 + (temp_output_1580_0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ) - temp_output_1684_0 ) * temp_output_1587_0 )));
			float3 normalizeResult1563 = normalize( cross( appendResult1564 , appendResult1565 ) );
			float2 appendResult61 = (float2(tex2DNode54.r , tex2DNode54.g));
			float3 DistortUV60 = ( _IfFlowmap == 0.0 ? ( _IfNormalDistort == 0.0 ? temp_cast_121 : normalizeResult1563 ) : float3( ( temp_output_1587_0 * ( appendResult61 - i.uv_texcoord.xy ) ) ,  0.0 ) );
			float3 temp_output_1066_0 = ( _DistortMask == 0.0 ? temp_cast_114 : DistortUV60 );
			float2 temp_cast_123 = (0.0).xx;
			float temp_output_25_0_g981 = _MaskOffsetUC2;
			float4 appendResult38_g981 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g981 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g981 = ( _MaskOffsetUC1 == 0.0 ? appendResult38_g981 : appendResult39_g981 );
			float ifLocalVar20_g981 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g981 )
				ifLocalVar20_g981 = ( temp_output_25_0_g981 == 0.0 ? break30_g981.x : break30_g981.y );
			else if( 2.0 == temp_output_25_0_g981 )
				ifLocalVar20_g981 = break30_g981.z;
			else if( 2.0 < temp_output_25_0_g981 )
				ifLocalVar20_g981 = ( temp_output_25_0_g981 == 4.0 ? 0.0 : break30_g981.w );
			float temp_output_25_0_g980 = _MaskOffsetVC2;
			float4 appendResult38_g980 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g980 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g980 = ( _MaskOffsetVC1 == 0.0 ? appendResult38_g980 : appendResult39_g980 );
			float ifLocalVar20_g980 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g980 )
				ifLocalVar20_g980 = ( temp_output_25_0_g980 == 0.0 ? break30_g980.x : break30_g980.y );
			else if( 2.0 == temp_output_25_0_g980 )
				ifLocalVar20_g980 = break30_g980.z;
			else if( 2.0 < temp_output_25_0_g980 )
				ifLocalVar20_g980 = ( temp_output_25_0_g980 == 4.0 ? 0.0 : break30_g980.w );
			float2 appendResult1836 = (float2(ifLocalVar20_g981 , ifLocalVar20_g980));
			float2 MaskOffsetC1837 = appendResult1836;
			float2 panner44_g1032 = ( 1.0 * _Time.y * appendResult49_g1032 + ( ( float3( ( Ifpara1474 == 0.0 ? temp_output_2194_0 : OffsetPOM80_g1031 ) ,  0.0 ) + temp_output_1066_0 ) + float3( (( _CustomdataMaskUV )?( MaskOffsetC1837 ):( temp_cast_123 )) ,  0.0 ) ).xy);
			float cos55_g1032 = cos( ( ( ( _Mask_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g1032 = sin( ( ( ( _Mask_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g1032 = mul( panner44_g1032 - float2( 0.5,0.5 ) , float2x2( cos55_g1032 , -sin55_g1032 , sin55_g1032 , cos55_g1032 )) + float2( 0.5,0.5 );
			float2 break52_g1032 = rotator55_g1032;
			float2 break54_g1032 = rotator55_g1032;
			float clampResult60_g1032 = clamp( break54_g1032.x , 0.0 , 1.0 );
			float clampResult50_g1032 = clamp( break54_g1032.y , 0.0 , 1.0 );
			float2 appendResult53_g1032 = (float2(( (float)(int)_MaskC == 0.0 ? break52_g1032.x : clampResult60_g1032 ) , ( (float)(int)_MaskCV == 0.0 ? break52_g1032.y : clampResult50_g1032 )));
			float4 tex2DNode27_g1032 = tex2D( _MaskTex, appendResult53_g1032 );
			float2 appendResult49_g1033 = (float2(_MaskPlusUspeed , _MaskPlusVspeed));
			float3 temp_cast_132 = (0.0).xxx;
			float2 appendResult30_g1029 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float4 break36_g1029 = _MaskPlusTex_ST;
			float2 appendResult32_g1029 = (float2(break36_g1029.x , break36_g1029.y));
			float2 appendResult38_g1029 = (float2(break36_g1029.z , break36_g1029.w));
			float2 appendResult31_g1029 = (float2(break36_g1029.x , break36_g1029.y));
			float2 CenteredUV15_g1030 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g1030 = CenteredUV15_g1030;
			float2 appendResult23_g1030 = (float2(( length( CenteredUV15_g1030 ) * break36_g1029.x * 2.0 ) , ( atan2( break17_g1030.x , break17_g1030.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1029.y )));
			float2 ifLocalVar2195 = 0;
			if( _MaskTexUVS > 1.0 )
				ifLocalVar2195 = ( ( maintongUV557 * appendResult31_g1029 ) + appendResult38_g1029 );
			else if( _MaskTexUVS == 1.0 )
				ifLocalVar2195 = ( appendResult23_g1030 + appendResult38_g1029 );
			else if( _MaskTexUVS < 1.0 )
				ifLocalVar2195 = ( ( i.uv_texcoord.xy * appendResult31_g1029 ) + appendResult38_g1029 );
			float2 temp_output_2196_0 = ( 0.0 == 3.0 ? ( ( appendResult30_g1029 * appendResult32_g1029 ) + appendResult38_g1029 ) : ifLocalVar2195 );
			float2 panner44_g1033 = ( 1.0 * _Time.y * appendResult49_g1033 + ( temp_output_1066_0 + float3( temp_output_2196_0 ,  0.0 ) ).xy);
			float cos55_g1033 = cos( ( ( ( _MaskPlusR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g1033 = sin( ( ( ( _MaskPlusR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g1033 = mul( panner44_g1033 - float2( 0.5,0.5 ) , float2x2( cos55_g1033 , -sin55_g1033 , sin55_g1033 , cos55_g1033 )) + float2( 0.5,0.5 );
			float2 break52_g1033 = rotator55_g1033;
			float2 break54_g1033 = rotator55_g1033;
			float clampResult60_g1033 = clamp( break54_g1033.x , 0.0 , 1.0 );
			float clampResult50_g1033 = clamp( break54_g1033.y , 0.0 , 1.0 );
			float2 appendResult53_g1033 = (float2(( (float)(int)_MaskPlusC == 0.0 ? break52_g1033.x : clampResult60_g1033 ) , ( (float)(int)_MaskPlusCV == 0.0 ? break52_g1033.y : clampResult50_g1033 )));
			float4 tex2DNode27_g1033 = tex2D( _MaskPlusTex, appendResult53_g1033 );
			float MaskAlpha136 = ( _Mask_scale * ( ( (float)(int)_MaskAlphaRA == 0.0 ? tex2DNode27_g1032.a : tex2DNode27_g1032.r ) * ( _IfMaskPlusTex == 0.0 ? 1.0 : ( (float)(int)_MaskPlusAR == 0.0 ? tex2DNode27_g1033.a : tex2DNode27_g1033.r ) ) ) );
			float2 appendResult49_g991 = (float2(_MainTex_Uspeed , _MainTex_Vspeed));
			float CustomMainUV1692 = _CustomdataMainTexUV;
			float2 temp_cast_141 = (0.0).xx;
			float temp_output_25_0_g949 = _MainOffsetUC2;
			float4 appendResult38_g949 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g949 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g949 = ( _MainOffsetUC1 == 0.0 ? appendResult38_g949 : appendResult39_g949 );
			float ifLocalVar20_g949 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g949 )
				ifLocalVar20_g949 = ( temp_output_25_0_g949 == 0.0 ? break30_g949.x : break30_g949.y );
			else if( 2.0 == temp_output_25_0_g949 )
				ifLocalVar20_g949 = break30_g949.z;
			else if( 2.0 < temp_output_25_0_g949 )
				ifLocalVar20_g949 = ( temp_output_25_0_g949 == 4.0 ? 0.0 : break30_g949.w );
			float temp_output_25_0_g948 = _MainOffsetVC2;
			float4 appendResult38_g948 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g948 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g948 = ( _MainOffsetVC1 == 0.0 ? appendResult38_g948 : appendResult39_g948 );
			float ifLocalVar20_g948 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g948 )
				ifLocalVar20_g948 = ( temp_output_25_0_g948 == 0.0 ? break30_g948.x : break30_g948.y );
			else if( 2.0 == temp_output_25_0_g948 )
				ifLocalVar20_g948 = break30_g948.z;
			else if( 2.0 < temp_output_25_0_g948 )
				ifLocalVar20_g948 = ( temp_output_25_0_g948 == 4.0 ? 0.0 : break30_g948.w );
			float2 appendResult1822 = (float2(ifLocalVar20_g949 , ifLocalVar20_g948));
			float2 MainTexOffsetC1823 = appendResult1822;
			float2 temp_output_1691_0 = ( CustomMainUV1692 == 0.0 ? temp_cast_141 : MainTexOffsetC1823 );
			float4 break36_g974 = _MainTex_ST;
			float2 appendResult31_g974 = (float2(break36_g974.x , break36_g974.y));
			float2 appendResult38_g974 = (float2(break36_g974.z , break36_g974.w));
			float2 CenteredUV15_g975 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g975 = CenteredUV15_g975;
			float2 appendResult23_g975 = (float2(( length( CenteredUV15_g975 ) * break36_g974.x * 2.0 ) , ( atan2( break17_g975.x , break17_g975.y ) * ( 1.0 / 6.28318548202515 ) * break36_g974.y )));
			float2 appendResult30_g974 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float2 appendResult32_g974 = (float2(break36_g974.x , break36_g974.y));
			#if defined(_MAINTEXUVS_NORMAL)
				float2 staticSwitch607 = ( ( i.uv_texcoord.xy * appendResult31_g974 ) + appendResult38_g974 );
			#elif defined(_MAINTEXUVS_POLAR)
				float2 staticSwitch607 = ( appendResult23_g975 + appendResult38_g974 );
			#elif defined(_MAINTEXUVS_CYLINDER)
				float2 staticSwitch607 = ( ( maintongUV557 * appendResult31_g974 ) + appendResult38_g974 );
			#elif defined(_MAINTEXUVS_UV2)
				float2 staticSwitch607 = ( ( appendResult30_g974 * appendResult32_g974 ) + appendResult38_g974 );
			#else
				float2 staticSwitch607 = ( ( i.uv_texcoord.xy * appendResult31_g974 ) + appendResult38_g974 );
			#endif
			float2 OffsetPOM80_g984 = POM( _ParaTex, staticSwitch607, ddx(staticSwitch607), ddy(staticSwitch607), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float3 temp_cast_144 = (0.0).xxx;
			float3 temp_output_1057_0 = ( _DistortMainTex == 0.0 ? temp_cast_144 : DistortUV60 );
			float2 panner44_g991 = ( 1.0 * _Time.y * appendResult49_g991 + ( float3( temp_output_1691_0 ,  0.0 ) + ( float3( ( Ifpara1474 == 0.0 ? staticSwitch607 : OffsetPOM80_g984 ) ,  0.0 ) + temp_output_1057_0 ) ).xy);
			float cos55_g991 = cos( ( ( ( _MainTex_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g991 = sin( ( ( ( _MainTex_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g991 = mul( panner44_g991 - float2( 0.5,0.5 ) , float2x2( cos55_g991 , -sin55_g991 , sin55_g991 , cos55_g991 )) + float2( 0.5,0.5 );
			float2 break52_g991 = rotator55_g991;
			float2 break54_g991 = rotator55_g991;
			float clampResult60_g991 = clamp( break54_g991.x , 0.0 , 1.0 );
			float clampResult50_g991 = clamp( break54_g991.y , 0.0 , 1.0 );
			float2 appendResult53_g991 = (float2(( (float)(int)_MaintexC == 0.0 ? break52_g991.x : clampResult60_g991 ) , ( (float)(int)_MaintexCV == 0.0 ? break52_g991.y : clampResult50_g991 )));
			float temp_output_63_0_g991 = _MainTexAC;
			float4 tex2DNode64_g991 = tex2D( _MainTex, ( appendResult53_g991 + temp_output_63_0_g991 ) );
			float4 tex2DNode27_g991 = tex2D( _MainTex, appendResult53_g991 );
			float2 temp_cast_148 = (temp_output_63_0_g991).xx;
			float4 tex2DNode65_g991 = tex2D( _MainTex, ( appendResult53_g991 - temp_cast_148 ) );
			float4 appendResult67_g991 = (float4(tex2DNode64_g991.r , tex2DNode27_g991.g , tex2DNode65_g991.b , ( ( tex2DNode27_g991.a + tex2DNode64_g991.a + tex2DNode65_g991.a ) / 3.0 )));
			float4 break71_g991 = appendResult67_g991;
			float temp_output_2038_39 = ( (float)(int)_MainTex_ar == 0.0 ? break71_g991.w : break71_g991.x );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float2 appendResult1868 = (float2(_MainTex_ST.x , _MainTex_ST.y));
			float2 appendResult1870 = (float2(_MainTex_ST.z , _MainTex_ST.w));
			float2 temp_cast_151 = (0.0).xx;
			float3 temp_cast_153 = (0.0).xxx;
			float4 screenColor917 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( ( ( ase_grabScreenPosNorm * float4( appendResult1868, 0.0 , 0.0 ) ) + float4( appendResult1870, 0.0 , 0.0 ) + float4( temp_output_1691_0, 0.0 , 0.0 ) ) + float4( temp_output_1057_0 , 0.0 ) ).xy);
			float temp_output_7_0 = ( ( _CustomdataDisT == 0.0 ? i.vertexColor.a : 1.0 ) * ( _ScreenAsMain == 0.0 ? temp_output_2038_39 : screenColor917.a ) * _MainColor.a );
			float2 appendResult49_g992 = (float2(_AddTexUspeed , _AddTexVspeed));
			float2 appendResult30_g976 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float4 break36_g976 = _AddTex_ST;
			float2 appendResult32_g976 = (float2(break36_g976.x , break36_g976.y));
			float2 appendResult38_g976 = (float2(break36_g976.z , break36_g976.w));
			float2 appendResult31_g976 = (float2(break36_g976.x , break36_g976.y));
			float2 CenteredUV15_g977 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g977 = CenteredUV15_g977;
			float2 appendResult23_g977 = (float2(( length( CenteredUV15_g977 ) * break36_g976.x * 2.0 ) , ( atan2( break17_g977.x , break17_g977.y ) * ( 1.0 / 6.28318548202515 ) * break36_g976.y )));
			float2 ifLocalVar1687 = 0;
			if( _AddTexUVS > 1.0 )
				ifLocalVar1687 = ( ( maintongUV557 * appendResult31_g976 ) + appendResult38_g976 );
			else if( _AddTexUVS == 1.0 )
				ifLocalVar1687 = ( appendResult23_g977 + appendResult38_g976 );
			else if( _AddTexUVS < 1.0 )
				ifLocalVar1687 = ( ( i.uv_texcoord.xy * appendResult31_g976 ) + appendResult38_g976 );
			float2 temp_output_2191_0 = ( _AddTexUVS == 3.0 ? ( ( appendResult30_g976 * appendResult32_g976 ) + appendResult38_g976 ) : ifLocalVar1687 );
			float2 OffsetPOM80_g986 = POM( _ParaTex, temp_output_2191_0, ddx(temp_output_2191_0), ddy(temp_output_2191_0), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float3 temp_cast_161 = (0.0).xxx;
			float2 temp_cast_162 = (0.0).xx;
			float2 temp_cast_163 = (1.0).xx;
			float2 appendResult1703 = (float2(( _AddTex_ST.x / _MainTex_ST.x ) , ( _AddTex_ST.y / _MainTex_ST.y )));
			float2 temp_cast_164 = (0.0).xx;
			float2 panner44_g992 = ( 1.0 * _Time.y * appendResult49_g992 + ( float3( ( Ifpara1474 == 0.0 ? temp_output_2191_0 : OffsetPOM80_g986 ) ,  0.0 ) + ( _DistortAddTex == 0.0 ? temp_cast_161 : DistortUV60 ) + float3( ( _CAddTexUV == 0.0 ? temp_cast_162 : ( ( _CAddTexUVT == 0.0 ? temp_cast_163 : appendResult1703 ) * temp_output_1691_0 ) ) ,  0.0 ) ).xy);
			float cos55_g992 = cos( ( ( ( _AddTexRo / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g992 = sin( ( ( ( _AddTexRo / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g992 = mul( panner44_g992 - float2( 0.5,0.5 ) , float2x2( cos55_g992 , -sin55_g992 , sin55_g992 , cos55_g992 )) + float2( 0.5,0.5 );
			float2 break52_g992 = rotator55_g992;
			float2 break54_g992 = rotator55_g992;
			float clampResult60_g992 = clamp( break54_g992.x , 0.0 , 1.0 );
			float clampResult50_g992 = clamp( break54_g992.y , 0.0 , 1.0 );
			float2 appendResult53_g992 = (float2(( (float)(int)_AddTexC == 0.0 ? break52_g992.x : clampResult60_g992 ) , ( (float)(int)_AddTexCV == 0.0 ? break52_g992.y : clampResult50_g992 )));
			float temp_output_63_0_g992 = _AddTexAC;
			float4 tex2DNode64_g992 = tex2D( _AddTex, ( appendResult53_g992 + temp_output_63_0_g992 ) );
			float4 tex2DNode27_g992 = tex2D( _AddTex, appendResult53_g992 );
			float2 temp_cast_169 = (temp_output_63_0_g992).xx;
			float4 tex2DNode65_g992 = tex2D( _AddTex, ( appendResult53_g992 - temp_cast_169 ) );
			float4 appendResult67_g992 = (float4(tex2DNode64_g992.r , tex2DNode27_g992.g , tex2DNode65_g992.b , ( ( tex2DNode27_g992.a + tex2DNode64_g992.a + tex2DNode65_g992.a ) / 3.0 )));
			float4 break71_g992 = appendResult67_g992;
			float temp_output_2046_39 = ( (float)(int)_AddTexAR == 0.0 ? break71_g992.w : break71_g992.x );
			float AddTexAlpha1655 = temp_output_2046_39;
			float lerpResult1659 = lerp( temp_output_7_0 , AddTexAlpha1655 , _AddTexBlend);
			float ifLocalVar1676 = 0;
			if( _AddTexBlendMode > 1.0 )
				ifLocalVar1676 = ( AddTexAlpha1655 * temp_output_7_0 );
			else if( _AddTexBlendMode == 1.0 )
				ifLocalVar1676 = ( AddTexAlpha1655 + temp_output_7_0 );
			else if( _AddTexBlendMode < 1.0 )
				ifLocalVar1676 = lerpResult1659;
			float MainTexAlpha37 = ( ( _IfAddTexAlpha == 0.0 ? temp_output_7_0 : ifLocalVar1676 ) * _MainAlpha );
			float temp_output_65_0_g994 = _DIssloveSoft;
			float temp_output_25_0_g987 = _DissolveFactorC2;
			float4 appendResult38_g987 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g987 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g987 = ( _DissolveFactorC1 == 0.0 ? appendResult38_g987 : appendResult39_g987 );
			float ifLocalVar20_g987 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g987 )
				ifLocalVar20_g987 = ( temp_output_25_0_g987 == 0.0 ? break30_g987.x : break30_g987.y );
			else if( 2.0 == temp_output_25_0_g987 )
				ifLocalVar20_g987 = break30_g987.z;
			else if( 2.0 < temp_output_25_0_g987 )
				ifLocalVar20_g987 = ( temp_output_25_0_g987 == 4.0 ? 0.0 : break30_g987.w );
			float DissolveFactorC1856 = ifLocalVar20_g987;
			float temp_output_70_0_g994 = ( _CustomdataDis == 0.0 ? ( _DIssloveFactor + 0.001 ) : ( _CustomdataDisT == 0.0 ? DissolveFactorC1856 : (1.0 + (i.vertexColor.a - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) ) );
			float temp_output_77_0_g994 = ( ( temp_output_65_0_g994 + 1.0 ) * temp_output_70_0_g994 );
			int temp_output_38_0_g989 = (int)_DissolveAR;
			float2 appendResult49_g989 = (float2(_DisTex_Uspeed , _DisTex_Vspeed));
			float2 appendResult30_g972 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float4 break36_g972 = _DissloveTex_ST;
			float2 appendResult32_g972 = (float2(break36_g972.x , break36_g972.y));
			float2 appendResult38_g972 = (float2(break36_g972.z , break36_g972.w));
			float2 appendResult31_g972 = (float2(break36_g972.x , break36_g972.y));
			float2 CenteredUV15_g973 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g973 = CenteredUV15_g973;
			float2 appendResult23_g973 = (float2(( length( CenteredUV15_g973 ) * break36_g972.x * 2.0 ) , ( atan2( break17_g973.x , break17_g973.y ) * ( 1.0 / 6.28318548202515 ) * break36_g972.y )));
			float2 ifLocalVar2207 = 0;
			if( _DissolveTexUVS2 > 1.0 )
				ifLocalVar2207 = ( ( maintongUV557 * appendResult31_g972 ) + appendResult38_g972 );
			else if( _DissolveTexUVS2 == 1.0 )
				ifLocalVar2207 = ( appendResult23_g973 + appendResult38_g972 );
			else if( _DissolveTexUVS2 < 1.0 )
				ifLocalVar2207 = ( ( i.uv_texcoord.xy * appendResult31_g972 ) + appendResult38_g972 );
			float2 temp_output_2209_0 = ( _DissolveTexUVS2 == 3.0 ? ( ( appendResult30_g972 * appendResult32_g972 ) + appendResult38_g972 ) : ifLocalVar2207 );
			float2 OffsetPOM80_g985 = POM( _ParaTex, temp_output_2209_0, ddx(temp_output_2209_0), ddy(temp_output_2209_0), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float3 temp_cast_175 = (0.0).xxx;
			float2 temp_cast_176 = (0.0).xx;
			float temp_output_25_0_g950 = _DissolveOffsetUC2;
			float4 appendResult38_g950 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g950 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g950 = ( _DissolveOffsetUC1 == 0.0 ? appendResult38_g950 : appendResult39_g950 );
			float ifLocalVar20_g950 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g950 )
				ifLocalVar20_g950 = ( temp_output_25_0_g950 == 0.0 ? break30_g950.x : break30_g950.y );
			else if( 2.0 == temp_output_25_0_g950 )
				ifLocalVar20_g950 = break30_g950.z;
			else if( 2.0 < temp_output_25_0_g950 )
				ifLocalVar20_g950 = ( temp_output_25_0_g950 == 4.0 ? 0.0 : break30_g950.w );
			float temp_output_25_0_g951 = _DissolveOffsetVC2;
			float4 appendResult38_g951 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g951 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g951 = ( _DissolveOffsetVC1 == 0.0 ? appendResult38_g951 : appendResult39_g951 );
			float ifLocalVar20_g951 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g951 )
				ifLocalVar20_g951 = ( temp_output_25_0_g951 == 0.0 ? break30_g951.x : break30_g951.y );
			else if( 2.0 == temp_output_25_0_g951 )
				ifLocalVar20_g951 = break30_g951.z;
			else if( 2.0 < temp_output_25_0_g951 )
				ifLocalVar20_g951 = ( temp_output_25_0_g951 == 4.0 ? 0.0 : break30_g951.w );
			float2 appendResult1844 = (float2(ifLocalVar20_g950 , ifLocalVar20_g951));
			float2 DissolveOffsetC1845 = appendResult1844;
			float2 panner44_g989 = ( 1.0 * _Time.y * appendResult49_g989 + ( float3( ( Ifpara1474 == 0.0 ? temp_output_2209_0 : OffsetPOM80_g985 ) ,  0.0 ) + ( _DistortDisTex == 0.0 ? temp_cast_175 : DistortUV60 ) + float3( ( _IfDissolveOffsetC == 0.0 ? temp_cast_176 : DissolveOffsetC1845 ) ,  0.0 ) ).xy);
			float cos55_g989 = cos( ( ( ( _DIssolve_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g989 = sin( ( ( ( _DIssolve_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g989 = mul( panner44_g989 - float2( 0.5,0.5 ) , float2x2( cos55_g989 , -sin55_g989 , sin55_g989 , cos55_g989 )) + float2( 0.5,0.5 );
			float2 break52_g989 = rotator55_g989;
			float2 break54_g989 = rotator55_g989;
			float clampResult60_g989 = clamp( break54_g989.x , 0.0 , 1.0 );
			float clampResult50_g989 = clamp( break54_g989.y , 0.0 , 1.0 );
			float2 appendResult53_g989 = (float2(( (float)(int)_DissolveC == 0.0 ? break52_g989.x : clampResult60_g989 ) , ( (float)(int)_DissolveCV == 0.0 ? break52_g989.y : clampResult50_g989 )));
			float4 tex2DNode27_g989 = tex2D( _DissloveTex, appendResult53_g989 );
			float temp_output_85_0_g994 = saturate( pow( ( (float)temp_output_38_0_g989 == 0.0 ? tex2DNode27_g989.a : tex2DNode27_g989.r ) , _DissolveTexExp ) );
			int temp_output_38_0_g990 = (int)_DissolvePlusAR;
			float2 appendResult49_g990 = (float2(0.0 , 0.0));
			float2 appendResult30_g978 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float4 break36_g978 = _DissloveTexPlus_ST;
			float2 appendResult32_g978 = (float2(break36_g978.x , break36_g978.y));
			float2 appendResult38_g978 = (float2(break36_g978.z , break36_g978.w));
			float2 appendResult31_g978 = (float2(break36_g978.x , break36_g978.y));
			float2 CenteredUV15_g979 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g979 = CenteredUV15_g979;
			float2 appendResult23_g979 = (float2(( length( CenteredUV15_g979 ) * break36_g978.x * 2.0 ) , ( atan2( break17_g979.x , break17_g979.y ) * ( 1.0 / 6.28318548202515 ) * break36_g978.y )));
			float2 ifLocalVar2211 = 0;
			if( _DissolveTexUVS2 > 1.0 )
				ifLocalVar2211 = ( ( maintongUV557 * appendResult31_g978 ) + appendResult38_g978 );
			else if( _DissolveTexUVS2 == 1.0 )
				ifLocalVar2211 = ( appendResult23_g979 + appendResult38_g978 );
			else if( _DissolveTexUVS2 < 1.0 )
				ifLocalVar2211 = ( ( i.uv_texcoord.xy * appendResult31_g978 ) + appendResult38_g978 );
			float2 temp_output_2210_0 = ( 0.0 == 3.0 ? ( ( appendResult30_g978 * appendResult32_g978 ) + appendResult38_g978 ) : ifLocalVar2211 );
			float2 OffsetPOM80_g988 = POM( _ParaTex, temp_output_2210_0, ddx(temp_output_2210_0), ddy(temp_output_2210_0), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float2 panner44_g990 = ( 1.0 * _Time.y * appendResult49_g990 + ( Ifpara1474 == 0.0 ? temp_output_2210_0 : OffsetPOM80_g988 ));
			float cos55_g990 = cos( ( ( ( _DissolvePlusR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g990 = sin( ( ( ( _DissolvePlusR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g990 = mul( panner44_g990 - float2( 0.5,0.5 ) , float2x2( cos55_g990 , -sin55_g990 , sin55_g990 , cos55_g990 )) + float2( 0.5,0.5 );
			float2 break52_g990 = rotator55_g990;
			float2 break54_g990 = rotator55_g990;
			float clampResult60_g990 = clamp( break54_g990.x , 0.0 , 1.0 );
			float clampResult50_g990 = clamp( break54_g990.y , 0.0 , 1.0 );
			float2 appendResult53_g990 = (float2(( (float)(int)_DissolvePlusC == 0.0 ? break52_g990.x : clampResult60_g990 ) , ( (float)(int)_DissolvePlusCV == 0.0 ? break52_g990.y : clampResult50_g990 )));
			float4 tex2DNode27_g990 = tex2D( _DissloveTexPlus, appendResult53_g990 );
			float temp_output_74_0_g994 = saturate( ( ( ( temp_output_85_0_g994 / _DissolveTexDivide ) + ( _IfDissolvePlus == 0.0 ? temp_output_85_0_g994 : ( (float)temp_output_38_0_g990 == 0.0 ? tex2DNode27_g990.a : tex2DNode27_g990.r ) ) ) / 2.0 ) );
			float smoothstepResult76_g994 = smoothstep( ( temp_output_77_0_g994 - temp_output_65_0_g994 ) , temp_output_77_0_g994 , temp_output_74_0_g994);
			float temp_output_2237_90 = smoothstepResult76_g994;
			float temp_output_66_0_g994 = _DIssloveWide;
			float temp_output_64_0_g994 = ( temp_output_70_0_g994 * ( 1.0 + temp_output_66_0_g994 ) );
			float temp_output_2237_91 = step( ( temp_output_64_0_g994 - temp_output_66_0_g994 ) , temp_output_74_0_g994 );
			float DisAplha42 = ( _sot_sting_A == 0.0 ? temp_output_2237_90 : temp_output_2237_91 );
			float dotResult106 = dot( ase_worldViewDir , ase_worldNormal );
			float softedge111 = pow( saturate( (( _softback )?( dotResult106 ):( abs( dotResult106 ) )) ) , _softFacotr );
			float4 ase_screenPos88 = i.screenPosition88;
			float4 ase_screenPosNorm88 = ase_screenPos88 / ase_screenPos88.w;
			ase_screenPosNorm88.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm88.z : ase_screenPosNorm88.z * 0.5 + 0.5;
			float screenDepth88 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm88.xy ));
			float distanceDepth88 = saturate( ( screenDepth88 - LinearEyeDepth( ase_screenPosNorm88.z ) ) / ( _DepthfadeFactor ) );
			float3 normalizeResult407 = normalize( ( ase_worldViewDir + _Dir ) );
			float dotResult1877 = dot( ase_worldNormal , normalizeResult407 );
			float temp_output_94_0 = saturate( ( pow( ( 1.0 - saturate( abs( dotResult1877 ) ) ) , _fnl_power ) * _fnl_sacle ) );
			float FNLData1871 = temp_output_94_0;
			float temp_output_409_0 = ( 1.0 - saturate( distanceDepth88 ) );
			float MainAlpha142 = saturate( ( ( MaskAlpha136 * MainTexAlpha37 * DisAplha42 * (( _FNLfanxiangkaiguan )?( softedge111 ):( 1.0 )) * (( _Depthfadeon )?( ( _DepthF == 0.0 ? distanceDepth88 : 1.0 ) ):( 1.0 )) * (( _IfFNLAlpha )?( FNLData1871 ):( 1.0 )) ) + ( _DepthF == 0.0 ? 0.0 : temp_output_409_0 ) ) );
			float temp_output_143_0 = MainAlpha142;
			float4 color1051 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 normalizeResult1001 = normalize( ( ase_worldViewDir + ase_worldlightDir ) );
			float2 appendResult56_g1025 = (float2(_NormalTex_Uspeed , _NormalTex_Vspeed));
			float4 break36_g1021 = _NormalTex_ST;
			float2 appendResult31_g1021 = (float2(break36_g1021.x , break36_g1021.y));
			float2 appendResult38_g1021 = (float2(break36_g1021.z , break36_g1021.w));
			float2 CenteredUV15_g1022 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g1022 = CenteredUV15_g1022;
			float2 appendResult23_g1022 = (float2(( length( CenteredUV15_g1022 ) * break36_g1021.x * 2.0 ) , ( atan2( break17_g1022.x , break17_g1022.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1021.y )));
			float2 appendResult30_g1021 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float2 appendResult32_g1021 = (float2(break36_g1021.x , break36_g1021.y));
			#if defined(_MAINTEXUVS_NORMAL)
				float2 staticSwitch2179 = ( ( i.uv_texcoord.xy * appendResult31_g1021 ) + appendResult38_g1021 );
			#elif defined(_MAINTEXUVS_POLAR)
				float2 staticSwitch2179 = ( appendResult23_g1022 + appendResult38_g1021 );
			#elif defined(_MAINTEXUVS_CYLINDER)
				float2 staticSwitch2179 = ( ( maintongUV557 * appendResult31_g1021 ) + appendResult38_g1021 );
			#elif defined(_MAINTEXUVS_UV2)
				float2 staticSwitch2179 = ( ( appendResult30_g1021 * appendResult32_g1021 ) + appendResult38_g1021 );
			#else
				float2 staticSwitch2179 = ( ( i.uv_texcoord.xy * appendResult31_g1021 ) + appendResult38_g1021 );
			#endif
			float2 OffsetPOM80_g1023 = POM( _ParaTex, staticSwitch2179, ddx(staticSwitch2179), ddy(staticSwitch2179), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float3 temp_cast_190 = (0.0).xxx;
			float2 panner51_g1025 = ( 1.0 * _Time.y * appendResult56_g1025 + ( float3( ( Ifpara1474 == 0.0 ? staticSwitch2179 : OffsetPOM80_g1023 ) ,  0.0 ) + ( _DistortNormalTex == 0.0 ? temp_cast_190 : DistortUV60 ) ).xy);
			float cos62_g1025 = cos( ( ( ( _NormalTex_Rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin62_g1025 = sin( ( ( ( _NormalTex_Rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator62_g1025 = mul( panner51_g1025 - float2( 0.5,0.5 ) , float2x2( cos62_g1025 , -sin62_g1025 , sin62_g1025 , cos62_g1025 )) + float2( 0.5,0.5 );
			float2 break59_g1025 = rotator62_g1025;
			float2 break61_g1025 = rotator62_g1025;
			float clampResult67_g1025 = clamp( break61_g1025.x , 0.0 , 1.0 );
			float clampResult57_g1025 = clamp( break61_g1025.y , 0.0 , 1.0 );
			float2 appendResult60_g1025 = (float2(( (float)(int)_NormalTexC == 0.0 ? break59_g1025.x : clampResult67_g1025 ) , ( (float)(int)_NormalTexCV == 0.0 ? break59_g1025.y : clampResult57_g1025 )));
			float temp_output_65_0_g993 = _DIssloveSoft;
			float temp_output_70_0_g993 = ( _CustomdataDis == 0.0 ? ( _DIssloveFactor + 0.001 ) : ( _CustomdataDisT == 0.0 ? DissolveFactorC1856 : (1.0 + (i.vertexColor.a - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) ) );
			float temp_output_77_0_g993 = ( ( temp_output_65_0_g993 + 1.0 ) * temp_output_70_0_g993 );
			float2 break68_g989 = appendResult53_g989;
			float temp_output_64_0_g989 = ( pow( _StaticNormalOffset , 3.0 ) * 0.1 );
			float2 appendResult67_g989 = (float2(( break68_g989.x + temp_output_64_0_g989 ) , break68_g989.y));
			float4 tex2DNode70_g989 = tex2D( _DissloveTex, appendResult67_g989 );
			float temp_output_85_0_g993 = saturate( pow( ( (float)temp_output_38_0_g989 == 0.0 ? tex2DNode70_g989.a : tex2DNode70_g989.r ) , _DissolveTexExp ) );
			float2 break68_g990 = appendResult53_g990;
			float temp_output_64_0_g990 = ( pow( _StaticNormalOffset , 3.0 ) * 0.1 );
			float2 appendResult67_g990 = (float2(( break68_g990.x + temp_output_64_0_g990 ) , break68_g990.y));
			float4 tex2DNode70_g990 = tex2D( _DissloveTexPlus, appendResult67_g990 );
			float temp_output_74_0_g993 = saturate( ( ( ( temp_output_85_0_g993 / _DissolveTexDivide ) + ( _IfDissolvePlus == 0.0 ? temp_output_85_0_g993 : ( (float)temp_output_38_0_g990 == 0.0 ? tex2DNode70_g990.a : tex2DNode70_g990.r ) ) ) / 2.0 ) );
			float smoothstepResult76_g993 = smoothstep( ( temp_output_77_0_g993 - temp_output_65_0_g993 ) , temp_output_77_0_g993 , temp_output_74_0_g993);
			float temp_output_66_0_g993 = _DIssloveWide;
			float temp_output_64_0_g993 = ( temp_output_70_0_g993 * ( 1.0 + temp_output_66_0_g993 ) );
			float DisAplha11397 = ( _sot_sting_A == 0.0 ? smoothstepResult76_g993 : step( ( temp_output_64_0_g993 - temp_output_66_0_g993 ) , temp_output_74_0_g993 ) );
			float temp_output_1402_0 = ( _StaticNormalScale * 10.0 );
			float3 appendResult1273 = (float3(1.0 , 0.0 , ( ( DisAplha11397 - DisAplha42 ) * temp_output_1402_0 )));
			float temp_output_65_0_g995 = _DIssloveSoft;
			float temp_output_70_0_g995 = ( _CustomdataDis == 0.0 ? ( _DIssloveFactor + 0.001 ) : ( _CustomdataDisT == 0.0 ? DissolveFactorC1856 : (1.0 + (i.vertexColor.a - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) ) );
			float temp_output_77_0_g995 = ( ( temp_output_65_0_g995 + 1.0 ) * temp_output_70_0_g995 );
			float2 appendResult63_g989 = (float2(break68_g989.x , ( break68_g989.y + temp_output_64_0_g989 )));
			float4 tex2DNode76_g989 = tex2D( _DissloveTex, appendResult63_g989 );
			float temp_output_85_0_g995 = saturate( pow( ( (float)temp_output_38_0_g989 == 0.0 ? tex2DNode76_g989.a : tex2DNode76_g989.r ) , _DissolveTexExp ) );
			float2 appendResult63_g990 = (float2(break68_g990.x , ( break68_g990.y + temp_output_64_0_g990 )));
			float4 tex2DNode76_g990 = tex2D( _DissloveTexPlus, appendResult63_g990 );
			float temp_output_74_0_g995 = saturate( ( ( ( temp_output_85_0_g995 / _DIssloveSoft ) + ( _IfDissolvePlus == 0.0 ? temp_output_85_0_g995 : ( (float)temp_output_38_0_g990 == 0.0 ? tex2DNode76_g990.a : tex2DNode76_g990.r ) ) ) / 2.0 ) );
			float smoothstepResult76_g995 = smoothstep( ( temp_output_77_0_g995 - temp_output_65_0_g995 ) , temp_output_77_0_g995 , temp_output_74_0_g995);
			float temp_output_66_0_g995 = _DIssloveWide;
			float temp_output_64_0_g995 = ( temp_output_70_0_g995 * ( 1.0 + temp_output_66_0_g995 ) );
			float DisAplha21398 = ( _sot_sting_A == 0.0 ? smoothstepResult76_g995 : step( ( temp_output_64_0_g995 - temp_output_66_0_g995 ) , temp_output_74_0_g995 ) );
			float3 appendResult1268 = (float3(0.0 , 1.0 , ( ( DisAplha21398 - DisAplha42 ) * temp_output_1402_0 )));
			float3 normalizeResult1265 = normalize( cross( appendResult1273 , appendResult1268 ) );
			float3 Normal1046 = BlendNormals( UnpackScaleNormal( tex2D( _NormalTex, appendResult60_g1025 ), _NormalScale ) , ( _IfStaticNormal == 0.0 ? float3(0,0,1) : normalizeResult1265 ) );
			float3 normalizeResult998 = normalize( (WorldNormalVector( i , Normal1046 )) );
			float dotResult1006 = dot( normalizeResult1001 , normalizeResult998 );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float4 temp_output_1007_0 = ( ase_lightColor * ase_lightAtten );
			float dotResult1004 = dot( normalizeResult998 , ase_worldlightDir );
			UnityGI gi1012 = gi;
			float3 diffNorm1012 = normalizeResult998;
			gi1012 = UnityGI_Base( data, 1, diffNorm1012 );
			float3 indirectDiffuse1012 = gi1012.indirect.diffuse + diffNorm1012 * 0.0001;
			float4 light1023 = ( ( pow( max( dotResult1006 , 0.0 ) , ( 0.1 * 128.0 ) ) * temp_output_1007_0 * _LightScale ) + ( ( ( temp_output_1007_0 * max( dotResult1004 , 0.0 ) ) + float4( indirectDiffuse1012 , 0.0 ) ) * _LightScale ) );
			c.rgb = (( _IfCustomLight )?( ( MainAlpha142 * light1023 ) ):( color1051 )).rgb;
			c.a = temp_output_143_0;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
			float2 appendResult49_g1032 = (float2(_Mask_Uspeed , _Mask_Vspeed));
			float Ifpara1474 = _IfPara;
			float2 appendResult30_g1027 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float4 break36_g1027 = _MaskTex_ST;
			float2 appendResult32_g1027 = (float2(break36_g1027.x , break36_g1027.y));
			float2 appendResult38_g1027 = (float2(break36_g1027.z , break36_g1027.w));
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 break537 = ( _TexCenter + float4( ase_vertex3Pos , 0.0 ) );
			float2 appendResult554 = (float2((0.0 + (atan( ( break537.x / break537.z ) ) - ( -0.5 * UNITY_PI )) * (1.0 - 0.0) / (( 0.5 * UNITY_PI ) - ( -0.5 * UNITY_PI ))) , break537.y));
			float2 appendResult553 = (float2((0.0 + (atan( ( break537.y / break537.z ) ) - ( -0.5 * UNITY_PI )) * (1.0 - 0.0) / (( 0.5 * UNITY_PI ) - ( -0.5 * UNITY_PI ))) , break537.x));
			float2 appendResult555 = (float2((0.0 + (atan( ( break537.x / break537.y ) ) - ( -0.5 * UNITY_PI )) * (1.0 - 0.0) / (( 0.5 * UNITY_PI ) - ( -0.5 * UNITY_PI ))) , break537.z));
			#if defined(_FACE_X)
				float2 staticSwitch556 = appendResult553;
			#elif defined(_FACE_Y)
				float2 staticSwitch556 = appendResult554;
			#elif defined(_FACE_Z)
				float2 staticSwitch556 = appendResult555;
			#else
				float2 staticSwitch556 = appendResult554;
			#endif
			float2 maintongUV557 = staticSwitch556;
			float2 appendResult31_g1027 = (float2(break36_g1027.x , break36_g1027.y));
			float2 appendResult866 = (float2(_CenterU , _CenterV));
			float2 centeruv867 = appendResult866;
			float2 CenteredUV15_g1028 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g1028 = CenteredUV15_g1028;
			float2 appendResult23_g1028 = (float2(( length( CenteredUV15_g1028 ) * break36_g1027.x * 2.0 ) , ( atan2( break17_g1028.x , break17_g1028.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1027.y )));
			float2 ifLocalVar2192 = 0;
			if( _MaskTexUVS > 1.0 )
				ifLocalVar2192 = ( ( maintongUV557 * appendResult31_g1027 ) + appendResult38_g1027 );
			else if( _MaskTexUVS == 1.0 )
				ifLocalVar2192 = ( appendResult23_g1028 + appendResult38_g1027 );
			else if( _MaskTexUVS < 1.0 )
				ifLocalVar2192 = ( ( i.uv_texcoord.xy * appendResult31_g1027 ) + appendResult38_g1027 );
			float2 temp_output_2194_0 = ( _MaskTexUVS == 3.0 ? ( ( appendResult30_g1027 * appendResult32_g1027 ) + appendResult38_g1027 ) : ifLocalVar2192 );
			float Parallax1492 = ( _Parallax * 0.1 );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float2 OffsetPOM80_g1031 = POM( _ParaTex, temp_output_2194_0, ddx(temp_output_2194_0), ddy(temp_output_2194_0), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float3 temp_cast_6 = (0.0).xxx;
			float temp_output_25_0_g944 = _DistortFactorC2;
			float4 appendResult38_g944 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g944 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g944 = ( _DistortFactorC1 == 0.0 ? appendResult38_g944 : appendResult39_g944 );
			float ifLocalVar20_g944 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g944 )
				ifLocalVar20_g944 = ( temp_output_25_0_g944 == 0.0 ? break30_g944.x : break30_g944.y );
			else if( 2.0 == temp_output_25_0_g944 )
				ifLocalVar20_g944 = break30_g944.z;
			else if( 2.0 < temp_output_25_0_g944 )
				ifLocalVar20_g944 = ( temp_output_25_0_g944 == 4.0 ? 0.0 : break30_g944.w );
			float DistortFactorC1851 = ifLocalVar20_g944;
			float2 appendResult49_g1020 = (float2(0.0 , 0.0));
			float4 break36_g1018 = _DistortMaskTex_ST;
			float2 appendResult31_g1018 = (float2(break36_g1018.x , break36_g1018.y));
			float2 appendResult38_g1018 = (float2(break36_g1018.z , break36_g1018.w));
			float2 CenteredUV15_g1019 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g1019 = CenteredUV15_g1019;
			float2 appendResult23_g1019 = (float2(( length( CenteredUV15_g1019 ) * break36_g1018.x * 2.0 ) , ( atan2( break17_g1019.x , break17_g1019.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1018.y )));
			float2 appendResult30_g1018 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float2 appendResult32_g1018 = (float2(break36_g1018.x , break36_g1018.y));
			#if defined(_MAINTEXUVS_NORMAL)
				float2 staticSwitch1604 = ( ( i.uv_texcoord.xy * appendResult31_g1018 ) + appendResult38_g1018 );
			#elif defined(_MAINTEXUVS_POLAR)
				float2 staticSwitch1604 = ( appendResult23_g1019 + appendResult38_g1018 );
			#elif defined(_MAINTEXUVS_CYLINDER)
				float2 staticSwitch1604 = ( ( maintongUV557 * appendResult31_g1018 ) + appendResult38_g1018 );
			#elif defined(_MAINTEXUVS_UV2)
				float2 staticSwitch1604 = ( ( appendResult30_g1018 * appendResult32_g1018 ) + appendResult38_g1018 );
			#else
				float2 staticSwitch1604 = ( ( i.uv_texcoord.xy * appendResult31_g1018 ) + appendResult38_g1018 );
			#endif
			float2 panner44_g1020 = ( 1.0 * _Time.y * appendResult49_g1020 + staticSwitch1604);
			float cos55_g1020 = cos( ( ( ( _DistortMaskTexR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g1020 = sin( ( ( ( _DistortMaskTexR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g1020 = mul( panner44_g1020 - float2( 0.5,0.5 ) , float2x2( cos55_g1020 , -sin55_g1020 , sin55_g1020 , cos55_g1020 )) + float2( 0.5,0.5 );
			float2 break52_g1020 = rotator55_g1020;
			float2 break54_g1020 = rotator55_g1020;
			float clampResult60_g1020 = clamp( break54_g1020.x , 0.0 , 1.0 );
			float clampResult50_g1020 = clamp( break54_g1020.y , 0.0 , 1.0 );
			float2 appendResult53_g1020 = (float2(( (float)(int)_DistortMaskTexC == 0.0 ? break52_g1020.x : clampResult60_g1020 ) , ( (float)(int)_DistortMaskTexCV == 0.0 ? break52_g1020.y : clampResult50_g1020 )));
			float4 tex2DNode27_g1020 = tex2D( _DistortMaskTex, appendResult53_g1020 );
			float temp_output_1587_0 = ( ( _CustomDistort == 0.0 ? _DistortFactor : DistortFactorC1851 ) * ( (float)(int)_DistortMaskTexAR == 0.0 ? tex2DNode27_g1020.a : tex2DNode27_g1020.r ) );
			float2 appendResult58 = (float2(_DistortTex_Uspeed , _DistortTex_Vspeed));
			float4 break36_g1016 = _DistortTex_ST;
			float2 appendResult31_g1016 = (float2(break36_g1016.x , break36_g1016.y));
			float2 appendResult38_g1016 = (float2(break36_g1016.z , break36_g1016.w));
			float2 CenteredUV15_g1017 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g1017 = CenteredUV15_g1017;
			float2 appendResult23_g1017 = (float2(( length( CenteredUV15_g1017 ) * break36_g1016.x * 2.0 ) , ( atan2( break17_g1017.x , break17_g1017.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1016.y )));
			float2 appendResult30_g1016 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float2 appendResult32_g1016 = (float2(break36_g1016.x , break36_g1016.y));
			#if defined(_MAINTEXUVS_NORMAL)
				float2 staticSwitch829 = ( ( i.uv_texcoord.xy * appendResult31_g1016 ) + appendResult38_g1016 );
			#elif defined(_MAINTEXUVS_POLAR)
				float2 staticSwitch829 = ( appendResult23_g1017 + appendResult38_g1016 );
			#elif defined(_MAINTEXUVS_CYLINDER)
				float2 staticSwitch829 = ( ( maintongUV557 * appendResult31_g1016 ) + appendResult38_g1016 );
			#elif defined(_MAINTEXUVS_UV2)
				float2 staticSwitch829 = ( ( appendResult30_g1016 * appendResult32_g1016 ) + appendResult38_g1016 );
			#else
				float2 staticSwitch829 = ( ( i.uv_texcoord.xy * appendResult31_g1016 ) + appendResult38_g1016 );
			#endif
			float2 panner59 = ( 1.0 * _Time.y * appendResult58 + staticSwitch829);
			float4 tex2DNode54 = tex2D( _DistortTex, panner59 );
			float temp_output_1550_0 = ( _DistortTexAR == 0.0 ? tex2DNode54.a : tex2DNode54.r );
			float temp_output_1684_0 = ( _DistortRemap == 0.0 ? temp_output_1550_0 : (-0.5 + (temp_output_1550_0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
			float3 temp_cast_13 = (( temp_output_1587_0 * temp_output_1684_0 )).xxx;
			float2 break1571 = panner59;
			float temp_output_1570_0 = ( pow( 1.0 , 3.0 ) * 0.1 );
			float2 appendResult1568 = (float2(( break1571.x + temp_output_1570_0 ) , break1571.y));
			float4 tex2DNode1577 = tex2D( _DistortTex, appendResult1568 );
			float temp_output_1579_0 = ( _DistortTexAR == 0.0 ? tex2DNode1577.a : tex2DNode1577.g );
			float3 appendResult1564 = (float3(1.0 , 0.0 , ( ( ( _DistortRemap == 0.0 ? temp_output_1579_0 : (-0.5 + (temp_output_1579_0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ) - temp_output_1684_0 ) * temp_output_1587_0 )));
			float2 appendResult1574 = (float2(break1571.x , ( break1571.y + temp_output_1570_0 )));
			float4 tex2DNode1576 = tex2D( _DistortTex, appendResult1574 );
			float temp_output_1580_0 = ( _DistortTexAR == 0.0 ? tex2DNode1576.a : tex2DNode1576.g );
			float3 appendResult1565 = (float3(0.0 , 1.0 , ( ( ( _DistortRemap == 0.0 ? temp_output_1580_0 : (-0.5 + (temp_output_1580_0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ) - temp_output_1684_0 ) * temp_output_1587_0 )));
			float3 normalizeResult1563 = normalize( cross( appendResult1564 , appendResult1565 ) );
			float2 appendResult61 = (float2(tex2DNode54.r , tex2DNode54.g));
			float3 DistortUV60 = ( _IfFlowmap == 0.0 ? ( _IfNormalDistort == 0.0 ? temp_cast_13 : normalizeResult1563 ) : float3( ( temp_output_1587_0 * ( appendResult61 - i.uv_texcoord.xy ) ) ,  0.0 ) );
			float3 temp_output_1066_0 = ( _DistortMask == 0.0 ? temp_cast_6 : DistortUV60 );
			float2 temp_cast_15 = (0.0).xx;
			float temp_output_25_0_g981 = _MaskOffsetUC2;
			float4 appendResult38_g981 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g981 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g981 = ( _MaskOffsetUC1 == 0.0 ? appendResult38_g981 : appendResult39_g981 );
			float ifLocalVar20_g981 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g981 )
				ifLocalVar20_g981 = ( temp_output_25_0_g981 == 0.0 ? break30_g981.x : break30_g981.y );
			else if( 2.0 == temp_output_25_0_g981 )
				ifLocalVar20_g981 = break30_g981.z;
			else if( 2.0 < temp_output_25_0_g981 )
				ifLocalVar20_g981 = ( temp_output_25_0_g981 == 4.0 ? 0.0 : break30_g981.w );
			float temp_output_25_0_g980 = _MaskOffsetVC2;
			float4 appendResult38_g980 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g980 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g980 = ( _MaskOffsetVC1 == 0.0 ? appendResult38_g980 : appendResult39_g980 );
			float ifLocalVar20_g980 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g980 )
				ifLocalVar20_g980 = ( temp_output_25_0_g980 == 0.0 ? break30_g980.x : break30_g980.y );
			else if( 2.0 == temp_output_25_0_g980 )
				ifLocalVar20_g980 = break30_g980.z;
			else if( 2.0 < temp_output_25_0_g980 )
				ifLocalVar20_g980 = ( temp_output_25_0_g980 == 4.0 ? 0.0 : break30_g980.w );
			float2 appendResult1836 = (float2(ifLocalVar20_g981 , ifLocalVar20_g980));
			float2 MaskOffsetC1837 = appendResult1836;
			float2 panner44_g1032 = ( 1.0 * _Time.y * appendResult49_g1032 + ( ( float3( ( Ifpara1474 == 0.0 ? temp_output_2194_0 : OffsetPOM80_g1031 ) ,  0.0 ) + temp_output_1066_0 ) + float3( (( _CustomdataMaskUV )?( MaskOffsetC1837 ):( temp_cast_15 )) ,  0.0 ) ).xy);
			float cos55_g1032 = cos( ( ( ( _Mask_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g1032 = sin( ( ( ( _Mask_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g1032 = mul( panner44_g1032 - float2( 0.5,0.5 ) , float2x2( cos55_g1032 , -sin55_g1032 , sin55_g1032 , cos55_g1032 )) + float2( 0.5,0.5 );
			float2 break52_g1032 = rotator55_g1032;
			float2 break54_g1032 = rotator55_g1032;
			float clampResult60_g1032 = clamp( break54_g1032.x , 0.0 , 1.0 );
			float clampResult50_g1032 = clamp( break54_g1032.y , 0.0 , 1.0 );
			float2 appendResult53_g1032 = (float2(( (float)(int)_MaskC == 0.0 ? break52_g1032.x : clampResult60_g1032 ) , ( (float)(int)_MaskCV == 0.0 ? break52_g1032.y : clampResult50_g1032 )));
			float4 tex2DNode27_g1032 = tex2D( _MaskTex, appendResult53_g1032 );
			float2 appendResult49_g1033 = (float2(_MaskPlusUspeed , _MaskPlusVspeed));
			float3 temp_cast_24 = (0.0).xxx;
			float2 appendResult30_g1029 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float4 break36_g1029 = _MaskPlusTex_ST;
			float2 appendResult32_g1029 = (float2(break36_g1029.x , break36_g1029.y));
			float2 appendResult38_g1029 = (float2(break36_g1029.z , break36_g1029.w));
			float2 appendResult31_g1029 = (float2(break36_g1029.x , break36_g1029.y));
			float2 CenteredUV15_g1030 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g1030 = CenteredUV15_g1030;
			float2 appendResult23_g1030 = (float2(( length( CenteredUV15_g1030 ) * break36_g1029.x * 2.0 ) , ( atan2( break17_g1030.x , break17_g1030.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1029.y )));
			float2 ifLocalVar2195 = 0;
			if( _MaskTexUVS > 1.0 )
				ifLocalVar2195 = ( ( maintongUV557 * appendResult31_g1029 ) + appendResult38_g1029 );
			else if( _MaskTexUVS == 1.0 )
				ifLocalVar2195 = ( appendResult23_g1030 + appendResult38_g1029 );
			else if( _MaskTexUVS < 1.0 )
				ifLocalVar2195 = ( ( i.uv_texcoord.xy * appendResult31_g1029 ) + appendResult38_g1029 );
			float2 temp_output_2196_0 = ( 0.0 == 3.0 ? ( ( appendResult30_g1029 * appendResult32_g1029 ) + appendResult38_g1029 ) : ifLocalVar2195 );
			float2 panner44_g1033 = ( 1.0 * _Time.y * appendResult49_g1033 + ( temp_output_1066_0 + float3( temp_output_2196_0 ,  0.0 ) ).xy);
			float cos55_g1033 = cos( ( ( ( _MaskPlusR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g1033 = sin( ( ( ( _MaskPlusR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g1033 = mul( panner44_g1033 - float2( 0.5,0.5 ) , float2x2( cos55_g1033 , -sin55_g1033 , sin55_g1033 , cos55_g1033 )) + float2( 0.5,0.5 );
			float2 break52_g1033 = rotator55_g1033;
			float2 break54_g1033 = rotator55_g1033;
			float clampResult60_g1033 = clamp( break54_g1033.x , 0.0 , 1.0 );
			float clampResult50_g1033 = clamp( break54_g1033.y , 0.0 , 1.0 );
			float2 appendResult53_g1033 = (float2(( (float)(int)_MaskPlusC == 0.0 ? break52_g1033.x : clampResult60_g1033 ) , ( (float)(int)_MaskPlusCV == 0.0 ? break52_g1033.y : clampResult50_g1033 )));
			float4 tex2DNode27_g1033 = tex2D( _MaskPlusTex, appendResult53_g1033 );
			float MaskAlpha136 = ( _Mask_scale * ( ( (float)(int)_MaskAlphaRA == 0.0 ? tex2DNode27_g1032.a : tex2DNode27_g1032.r ) * ( _IfMaskPlusTex == 0.0 ? 1.0 : ( (float)(int)_MaskPlusAR == 0.0 ? tex2DNode27_g1033.a : tex2DNode27_g1033.r ) ) ) );
			float2 appendResult49_g991 = (float2(_MainTex_Uspeed , _MainTex_Vspeed));
			float CustomMainUV1692 = _CustomdataMainTexUV;
			float2 temp_cast_33 = (0.0).xx;
			float temp_output_25_0_g949 = _MainOffsetUC2;
			float4 appendResult38_g949 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g949 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g949 = ( _MainOffsetUC1 == 0.0 ? appendResult38_g949 : appendResult39_g949 );
			float ifLocalVar20_g949 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g949 )
				ifLocalVar20_g949 = ( temp_output_25_0_g949 == 0.0 ? break30_g949.x : break30_g949.y );
			else if( 2.0 == temp_output_25_0_g949 )
				ifLocalVar20_g949 = break30_g949.z;
			else if( 2.0 < temp_output_25_0_g949 )
				ifLocalVar20_g949 = ( temp_output_25_0_g949 == 4.0 ? 0.0 : break30_g949.w );
			float temp_output_25_0_g948 = _MainOffsetVC2;
			float4 appendResult38_g948 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g948 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g948 = ( _MainOffsetVC1 == 0.0 ? appendResult38_g948 : appendResult39_g948 );
			float ifLocalVar20_g948 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g948 )
				ifLocalVar20_g948 = ( temp_output_25_0_g948 == 0.0 ? break30_g948.x : break30_g948.y );
			else if( 2.0 == temp_output_25_0_g948 )
				ifLocalVar20_g948 = break30_g948.z;
			else if( 2.0 < temp_output_25_0_g948 )
				ifLocalVar20_g948 = ( temp_output_25_0_g948 == 4.0 ? 0.0 : break30_g948.w );
			float2 appendResult1822 = (float2(ifLocalVar20_g949 , ifLocalVar20_g948));
			float2 MainTexOffsetC1823 = appendResult1822;
			float2 temp_output_1691_0 = ( CustomMainUV1692 == 0.0 ? temp_cast_33 : MainTexOffsetC1823 );
			float4 break36_g974 = _MainTex_ST;
			float2 appendResult31_g974 = (float2(break36_g974.x , break36_g974.y));
			float2 appendResult38_g974 = (float2(break36_g974.z , break36_g974.w));
			float2 CenteredUV15_g975 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g975 = CenteredUV15_g975;
			float2 appendResult23_g975 = (float2(( length( CenteredUV15_g975 ) * break36_g974.x * 2.0 ) , ( atan2( break17_g975.x , break17_g975.y ) * ( 1.0 / 6.28318548202515 ) * break36_g974.y )));
			float2 appendResult30_g974 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float2 appendResult32_g974 = (float2(break36_g974.x , break36_g974.y));
			#if defined(_MAINTEXUVS_NORMAL)
				float2 staticSwitch607 = ( ( i.uv_texcoord.xy * appendResult31_g974 ) + appendResult38_g974 );
			#elif defined(_MAINTEXUVS_POLAR)
				float2 staticSwitch607 = ( appendResult23_g975 + appendResult38_g974 );
			#elif defined(_MAINTEXUVS_CYLINDER)
				float2 staticSwitch607 = ( ( maintongUV557 * appendResult31_g974 ) + appendResult38_g974 );
			#elif defined(_MAINTEXUVS_UV2)
				float2 staticSwitch607 = ( ( appendResult30_g974 * appendResult32_g974 ) + appendResult38_g974 );
			#else
				float2 staticSwitch607 = ( ( i.uv_texcoord.xy * appendResult31_g974 ) + appendResult38_g974 );
			#endif
			float2 OffsetPOM80_g984 = POM( _ParaTex, staticSwitch607, ddx(staticSwitch607), ddy(staticSwitch607), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float3 temp_cast_36 = (0.0).xxx;
			float3 temp_output_1057_0 = ( _DistortMainTex == 0.0 ? temp_cast_36 : DistortUV60 );
			float2 panner44_g991 = ( 1.0 * _Time.y * appendResult49_g991 + ( float3( temp_output_1691_0 ,  0.0 ) + ( float3( ( Ifpara1474 == 0.0 ? staticSwitch607 : OffsetPOM80_g984 ) ,  0.0 ) + temp_output_1057_0 ) ).xy);
			float cos55_g991 = cos( ( ( ( _MainTex_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g991 = sin( ( ( ( _MainTex_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g991 = mul( panner44_g991 - float2( 0.5,0.5 ) , float2x2( cos55_g991 , -sin55_g991 , sin55_g991 , cos55_g991 )) + float2( 0.5,0.5 );
			float2 break52_g991 = rotator55_g991;
			float2 break54_g991 = rotator55_g991;
			float clampResult60_g991 = clamp( break54_g991.x , 0.0 , 1.0 );
			float clampResult50_g991 = clamp( break54_g991.y , 0.0 , 1.0 );
			float2 appendResult53_g991 = (float2(( (float)(int)_MaintexC == 0.0 ? break52_g991.x : clampResult60_g991 ) , ( (float)(int)_MaintexCV == 0.0 ? break52_g991.y : clampResult50_g991 )));
			float temp_output_63_0_g991 = _MainTexAC;
			float4 tex2DNode64_g991 = tex2D( _MainTex, ( appendResult53_g991 + temp_output_63_0_g991 ) );
			float4 tex2DNode27_g991 = tex2D( _MainTex, appendResult53_g991 );
			float2 temp_cast_40 = (temp_output_63_0_g991).xx;
			float4 tex2DNode65_g991 = tex2D( _MainTex, ( appendResult53_g991 - temp_cast_40 ) );
			float4 appendResult67_g991 = (float4(tex2DNode64_g991.r , tex2DNode27_g991.g , tex2DNode65_g991.b , ( ( tex2DNode27_g991.a + tex2DNode64_g991.a + tex2DNode65_g991.a ) / 3.0 )));
			float4 break71_g991 = appendResult67_g991;
			float temp_output_2038_39 = ( (float)(int)_MainTex_ar == 0.0 ? break71_g991.w : break71_g991.x );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float2 appendResult1868 = (float2(_MainTex_ST.x , _MainTex_ST.y));
			float2 appendResult1870 = (float2(_MainTex_ST.z , _MainTex_ST.w));
			float2 temp_cast_43 = (0.0).xx;
			float3 temp_cast_45 = (0.0).xxx;
			float4 screenColor917 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( ( ( ase_grabScreenPosNorm * float4( appendResult1868, 0.0 , 0.0 ) ) + float4( appendResult1870, 0.0 , 0.0 ) + float4( temp_output_1691_0, 0.0 , 0.0 ) ) + float4( temp_output_1057_0 , 0.0 ) ).xy);
			float temp_output_7_0 = ( ( _CustomdataDisT == 0.0 ? i.vertexColor.a : 1.0 ) * ( _ScreenAsMain == 0.0 ? temp_output_2038_39 : screenColor917.a ) * _MainColor.a );
			float2 appendResult49_g992 = (float2(_AddTexUspeed , _AddTexVspeed));
			float2 appendResult30_g976 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float4 break36_g976 = _AddTex_ST;
			float2 appendResult32_g976 = (float2(break36_g976.x , break36_g976.y));
			float2 appendResult38_g976 = (float2(break36_g976.z , break36_g976.w));
			float2 appendResult31_g976 = (float2(break36_g976.x , break36_g976.y));
			float2 CenteredUV15_g977 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g977 = CenteredUV15_g977;
			float2 appendResult23_g977 = (float2(( length( CenteredUV15_g977 ) * break36_g976.x * 2.0 ) , ( atan2( break17_g977.x , break17_g977.y ) * ( 1.0 / 6.28318548202515 ) * break36_g976.y )));
			float2 ifLocalVar1687 = 0;
			if( _AddTexUVS > 1.0 )
				ifLocalVar1687 = ( ( maintongUV557 * appendResult31_g976 ) + appendResult38_g976 );
			else if( _AddTexUVS == 1.0 )
				ifLocalVar1687 = ( appendResult23_g977 + appendResult38_g976 );
			else if( _AddTexUVS < 1.0 )
				ifLocalVar1687 = ( ( i.uv_texcoord.xy * appendResult31_g976 ) + appendResult38_g976 );
			float2 temp_output_2191_0 = ( _AddTexUVS == 3.0 ? ( ( appendResult30_g976 * appendResult32_g976 ) + appendResult38_g976 ) : ifLocalVar1687 );
			float2 OffsetPOM80_g986 = POM( _ParaTex, temp_output_2191_0, ddx(temp_output_2191_0), ddy(temp_output_2191_0), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float3 temp_cast_53 = (0.0).xxx;
			float2 temp_cast_54 = (0.0).xx;
			float2 temp_cast_55 = (1.0).xx;
			float2 appendResult1703 = (float2(( _AddTex_ST.x / _MainTex_ST.x ) , ( _AddTex_ST.y / _MainTex_ST.y )));
			float2 temp_cast_56 = (0.0).xx;
			float2 panner44_g992 = ( 1.0 * _Time.y * appendResult49_g992 + ( float3( ( Ifpara1474 == 0.0 ? temp_output_2191_0 : OffsetPOM80_g986 ) ,  0.0 ) + ( _DistortAddTex == 0.0 ? temp_cast_53 : DistortUV60 ) + float3( ( _CAddTexUV == 0.0 ? temp_cast_54 : ( ( _CAddTexUVT == 0.0 ? temp_cast_55 : appendResult1703 ) * temp_output_1691_0 ) ) ,  0.0 ) ).xy);
			float cos55_g992 = cos( ( ( ( _AddTexRo / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g992 = sin( ( ( ( _AddTexRo / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g992 = mul( panner44_g992 - float2( 0.5,0.5 ) , float2x2( cos55_g992 , -sin55_g992 , sin55_g992 , cos55_g992 )) + float2( 0.5,0.5 );
			float2 break52_g992 = rotator55_g992;
			float2 break54_g992 = rotator55_g992;
			float clampResult60_g992 = clamp( break54_g992.x , 0.0 , 1.0 );
			float clampResult50_g992 = clamp( break54_g992.y , 0.0 , 1.0 );
			float2 appendResult53_g992 = (float2(( (float)(int)_AddTexC == 0.0 ? break52_g992.x : clampResult60_g992 ) , ( (float)(int)_AddTexCV == 0.0 ? break52_g992.y : clampResult50_g992 )));
			float temp_output_63_0_g992 = _AddTexAC;
			float4 tex2DNode64_g992 = tex2D( _AddTex, ( appendResult53_g992 + temp_output_63_0_g992 ) );
			float4 tex2DNode27_g992 = tex2D( _AddTex, appendResult53_g992 );
			float2 temp_cast_61 = (temp_output_63_0_g992).xx;
			float4 tex2DNode65_g992 = tex2D( _AddTex, ( appendResult53_g992 - temp_cast_61 ) );
			float4 appendResult67_g992 = (float4(tex2DNode64_g992.r , tex2DNode27_g992.g , tex2DNode65_g992.b , ( ( tex2DNode27_g992.a + tex2DNode64_g992.a + tex2DNode65_g992.a ) / 3.0 )));
			float4 break71_g992 = appendResult67_g992;
			float temp_output_2046_39 = ( (float)(int)_AddTexAR == 0.0 ? break71_g992.w : break71_g992.x );
			float AddTexAlpha1655 = temp_output_2046_39;
			float lerpResult1659 = lerp( temp_output_7_0 , AddTexAlpha1655 , _AddTexBlend);
			float ifLocalVar1676 = 0;
			if( _AddTexBlendMode > 1.0 )
				ifLocalVar1676 = ( AddTexAlpha1655 * temp_output_7_0 );
			else if( _AddTexBlendMode == 1.0 )
				ifLocalVar1676 = ( AddTexAlpha1655 + temp_output_7_0 );
			else if( _AddTexBlendMode < 1.0 )
				ifLocalVar1676 = lerpResult1659;
			float MainTexAlpha37 = ( ( _IfAddTexAlpha == 0.0 ? temp_output_7_0 : ifLocalVar1676 ) * _MainAlpha );
			float temp_output_65_0_g994 = _DIssloveSoft;
			float temp_output_25_0_g987 = _DissolveFactorC2;
			float4 appendResult38_g987 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g987 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g987 = ( _DissolveFactorC1 == 0.0 ? appendResult38_g987 : appendResult39_g987 );
			float ifLocalVar20_g987 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g987 )
				ifLocalVar20_g987 = ( temp_output_25_0_g987 == 0.0 ? break30_g987.x : break30_g987.y );
			else if( 2.0 == temp_output_25_0_g987 )
				ifLocalVar20_g987 = break30_g987.z;
			else if( 2.0 < temp_output_25_0_g987 )
				ifLocalVar20_g987 = ( temp_output_25_0_g987 == 4.0 ? 0.0 : break30_g987.w );
			float DissolveFactorC1856 = ifLocalVar20_g987;
			float temp_output_70_0_g994 = ( _CustomdataDis == 0.0 ? ( _DIssloveFactor + 0.001 ) : ( _CustomdataDisT == 0.0 ? DissolveFactorC1856 : (1.0 + (i.vertexColor.a - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) ) );
			float temp_output_77_0_g994 = ( ( temp_output_65_0_g994 + 1.0 ) * temp_output_70_0_g994 );
			int temp_output_38_0_g989 = (int)_DissolveAR;
			float2 appendResult49_g989 = (float2(_DisTex_Uspeed , _DisTex_Vspeed));
			float2 appendResult30_g972 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float4 break36_g972 = _DissloveTex_ST;
			float2 appendResult32_g972 = (float2(break36_g972.x , break36_g972.y));
			float2 appendResult38_g972 = (float2(break36_g972.z , break36_g972.w));
			float2 appendResult31_g972 = (float2(break36_g972.x , break36_g972.y));
			float2 CenteredUV15_g973 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g973 = CenteredUV15_g973;
			float2 appendResult23_g973 = (float2(( length( CenteredUV15_g973 ) * break36_g972.x * 2.0 ) , ( atan2( break17_g973.x , break17_g973.y ) * ( 1.0 / 6.28318548202515 ) * break36_g972.y )));
			float2 ifLocalVar2207 = 0;
			if( _DissolveTexUVS2 > 1.0 )
				ifLocalVar2207 = ( ( maintongUV557 * appendResult31_g972 ) + appendResult38_g972 );
			else if( _DissolveTexUVS2 == 1.0 )
				ifLocalVar2207 = ( appendResult23_g973 + appendResult38_g972 );
			else if( _DissolveTexUVS2 < 1.0 )
				ifLocalVar2207 = ( ( i.uv_texcoord.xy * appendResult31_g972 ) + appendResult38_g972 );
			float2 temp_output_2209_0 = ( _DissolveTexUVS2 == 3.0 ? ( ( appendResult30_g972 * appendResult32_g972 ) + appendResult38_g972 ) : ifLocalVar2207 );
			float2 OffsetPOM80_g985 = POM( _ParaTex, temp_output_2209_0, ddx(temp_output_2209_0), ddy(temp_output_2209_0), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float3 temp_cast_67 = (0.0).xxx;
			float2 temp_cast_68 = (0.0).xx;
			float temp_output_25_0_g950 = _DissolveOffsetUC2;
			float4 appendResult38_g950 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g950 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g950 = ( _DissolveOffsetUC1 == 0.0 ? appendResult38_g950 : appendResult39_g950 );
			float ifLocalVar20_g950 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g950 )
				ifLocalVar20_g950 = ( temp_output_25_0_g950 == 0.0 ? break30_g950.x : break30_g950.y );
			else if( 2.0 == temp_output_25_0_g950 )
				ifLocalVar20_g950 = break30_g950.z;
			else if( 2.0 < temp_output_25_0_g950 )
				ifLocalVar20_g950 = ( temp_output_25_0_g950 == 4.0 ? 0.0 : break30_g950.w );
			float temp_output_25_0_g951 = _DissolveOffsetVC2;
			float4 appendResult38_g951 = (float4(i.uv_texcoord.z , i.uv_texcoord.w , i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float4 appendResult39_g951 = (float4(i.uv2_texcoord2.z , i.uv2_texcoord2.w , i.uv3_texcoord3.xy.x , i.uv3_texcoord3.xy.y));
			float4 break30_g951 = ( _DissolveOffsetVC1 == 0.0 ? appendResult38_g951 : appendResult39_g951 );
			float ifLocalVar20_g951 = 0;
			UNITY_BRANCH 
			if( 2.0 > temp_output_25_0_g951 )
				ifLocalVar20_g951 = ( temp_output_25_0_g951 == 0.0 ? break30_g951.x : break30_g951.y );
			else if( 2.0 == temp_output_25_0_g951 )
				ifLocalVar20_g951 = break30_g951.z;
			else if( 2.0 < temp_output_25_0_g951 )
				ifLocalVar20_g951 = ( temp_output_25_0_g951 == 4.0 ? 0.0 : break30_g951.w );
			float2 appendResult1844 = (float2(ifLocalVar20_g950 , ifLocalVar20_g951));
			float2 DissolveOffsetC1845 = appendResult1844;
			float2 panner44_g989 = ( 1.0 * _Time.y * appendResult49_g989 + ( float3( ( Ifpara1474 == 0.0 ? temp_output_2209_0 : OffsetPOM80_g985 ) ,  0.0 ) + ( _DistortDisTex == 0.0 ? temp_cast_67 : DistortUV60 ) + float3( ( _IfDissolveOffsetC == 0.0 ? temp_cast_68 : DissolveOffsetC1845 ) ,  0.0 ) ).xy);
			float cos55_g989 = cos( ( ( ( _DIssolve_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g989 = sin( ( ( ( _DIssolve_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g989 = mul( panner44_g989 - float2( 0.5,0.5 ) , float2x2( cos55_g989 , -sin55_g989 , sin55_g989 , cos55_g989 )) + float2( 0.5,0.5 );
			float2 break52_g989 = rotator55_g989;
			float2 break54_g989 = rotator55_g989;
			float clampResult60_g989 = clamp( break54_g989.x , 0.0 , 1.0 );
			float clampResult50_g989 = clamp( break54_g989.y , 0.0 , 1.0 );
			float2 appendResult53_g989 = (float2(( (float)(int)_DissolveC == 0.0 ? break52_g989.x : clampResult60_g989 ) , ( (float)(int)_DissolveCV == 0.0 ? break52_g989.y : clampResult50_g989 )));
			float4 tex2DNode27_g989 = tex2D( _DissloveTex, appendResult53_g989 );
			float temp_output_85_0_g994 = saturate( pow( ( (float)temp_output_38_0_g989 == 0.0 ? tex2DNode27_g989.a : tex2DNode27_g989.r ) , _DissolveTexExp ) );
			int temp_output_38_0_g990 = (int)_DissolvePlusAR;
			float2 appendResult49_g990 = (float2(0.0 , 0.0));
			float2 appendResult30_g978 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float4 break36_g978 = _DissloveTexPlus_ST;
			float2 appendResult32_g978 = (float2(break36_g978.x , break36_g978.y));
			float2 appendResult38_g978 = (float2(break36_g978.z , break36_g978.w));
			float2 appendResult31_g978 = (float2(break36_g978.x , break36_g978.y));
			float2 CenteredUV15_g979 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g979 = CenteredUV15_g979;
			float2 appendResult23_g979 = (float2(( length( CenteredUV15_g979 ) * break36_g978.x * 2.0 ) , ( atan2( break17_g979.x , break17_g979.y ) * ( 1.0 / 6.28318548202515 ) * break36_g978.y )));
			float2 ifLocalVar2211 = 0;
			if( _DissolveTexUVS2 > 1.0 )
				ifLocalVar2211 = ( ( maintongUV557 * appendResult31_g978 ) + appendResult38_g978 );
			else if( _DissolveTexUVS2 == 1.0 )
				ifLocalVar2211 = ( appendResult23_g979 + appendResult38_g978 );
			else if( _DissolveTexUVS2 < 1.0 )
				ifLocalVar2211 = ( ( i.uv_texcoord.xy * appendResult31_g978 ) + appendResult38_g978 );
			float2 temp_output_2210_0 = ( 0.0 == 3.0 ? ( ( appendResult30_g978 * appendResult32_g978 ) + appendResult38_g978 ) : ifLocalVar2211 );
			float2 OffsetPOM80_g988 = POM( _ParaTex, temp_output_2210_0, ddx(temp_output_2210_0), ddy(temp_output_2210_0), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float2 panner44_g990 = ( 1.0 * _Time.y * appendResult49_g990 + ( Ifpara1474 == 0.0 ? temp_output_2210_0 : OffsetPOM80_g988 ));
			float cos55_g990 = cos( ( ( ( _DissolvePlusR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin55_g990 = sin( ( ( ( _DissolvePlusR / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator55_g990 = mul( panner44_g990 - float2( 0.5,0.5 ) , float2x2( cos55_g990 , -sin55_g990 , sin55_g990 , cos55_g990 )) + float2( 0.5,0.5 );
			float2 break52_g990 = rotator55_g990;
			float2 break54_g990 = rotator55_g990;
			float clampResult60_g990 = clamp( break54_g990.x , 0.0 , 1.0 );
			float clampResult50_g990 = clamp( break54_g990.y , 0.0 , 1.0 );
			float2 appendResult53_g990 = (float2(( (float)(int)_DissolvePlusC == 0.0 ? break52_g990.x : clampResult60_g990 ) , ( (float)(int)_DissolvePlusCV == 0.0 ? break52_g990.y : clampResult50_g990 )));
			float4 tex2DNode27_g990 = tex2D( _DissloveTexPlus, appendResult53_g990 );
			float temp_output_74_0_g994 = saturate( ( ( ( temp_output_85_0_g994 / _DissolveTexDivide ) + ( _IfDissolvePlus == 0.0 ? temp_output_85_0_g994 : ( (float)temp_output_38_0_g990 == 0.0 ? tex2DNode27_g990.a : tex2DNode27_g990.r ) ) ) / 2.0 ) );
			float smoothstepResult76_g994 = smoothstep( ( temp_output_77_0_g994 - temp_output_65_0_g994 ) , temp_output_77_0_g994 , temp_output_74_0_g994);
			float temp_output_2237_90 = smoothstepResult76_g994;
			float temp_output_66_0_g994 = _DIssloveWide;
			float temp_output_64_0_g994 = ( temp_output_70_0_g994 * ( 1.0 + temp_output_66_0_g994 ) );
			float temp_output_2237_91 = step( ( temp_output_64_0_g994 - temp_output_66_0_g994 ) , temp_output_74_0_g994 );
			float DisAplha42 = ( _sot_sting_A == 0.0 ? temp_output_2237_90 : temp_output_2237_91 );
			float dotResult106 = dot( ase_worldViewDir , ase_worldNormal );
			float softedge111 = pow( saturate( (( _softback )?( dotResult106 ):( abs( dotResult106 ) )) ) , _softFacotr );
			float4 ase_screenPos88 = i.screenPosition88;
			float4 ase_screenPosNorm88 = ase_screenPos88 / ase_screenPos88.w;
			ase_screenPosNorm88.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm88.z : ase_screenPosNorm88.z * 0.5 + 0.5;
			float screenDepth88 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm88.xy ));
			float distanceDepth88 = saturate( ( screenDepth88 - LinearEyeDepth( ase_screenPosNorm88.z ) ) / ( _DepthfadeFactor ) );
			float3 normalizeResult407 = normalize( ( ase_worldViewDir + _Dir ) );
			float dotResult1877 = dot( ase_worldNormal , normalizeResult407 );
			float temp_output_94_0 = saturate( ( pow( ( 1.0 - saturate( abs( dotResult1877 ) ) ) , _fnl_power ) * _fnl_sacle ) );
			float FNLData1871 = temp_output_94_0;
			float temp_output_409_0 = ( 1.0 - saturate( distanceDepth88 ) );
			float MainAlpha142 = saturate( ( ( MaskAlpha136 * MainTexAlpha37 * DisAplha42 * (( _FNLfanxiangkaiguan )?( softedge111 ):( 1.0 )) * (( _Depthfadeon )?( ( _DepthF == 0.0 ? distanceDepth88 : 1.0 ) ):( 1.0 )) * (( _IfFNLAlpha )?( FNLData1871 ):( 1.0 )) ) + ( _DepthF == 0.0 ? 0.0 : temp_output_409_0 ) ) );
			float4 DepthColor412 = ( temp_output_409_0 * _DepthColor );
			float4 fnlColor97 = ( temp_output_94_0 * _fnl_color * i.vertexColor );
			float4 temp_cast_79 = (1.0).xxxx;
			float4 temp_output_2038_31 = appendResult67_g991;
			float3 temp_output_9_0_g998 = ( _AlphaAdd == 0.0 ? temp_output_2038_31 : ( temp_output_2038_31 * temp_output_2038_39 ) ).xyz;
			float4 break7_g998 = _MainTexRefine;
			float3 temp_cast_81 = (max( break7_g998.z , 0.01 )).xxx;
			float3 lerpResult4_g998 = lerp( ( temp_output_9_0_g998 * break7_g998.x ) , ( pow( temp_output_9_0_g998 , temp_cast_81 ) * break7_g998.y ) , break7_g998.w);
			float4 temp_cast_83 = (1.0).xxxx;
			float4 MaskColor439 = tex2DNode27_g1032;
			float4 temp_output_223_0 = ( _MainColor * ( _ScreenAsMain == 0.0 ? float4( lerpResult4_g998 , 0.0 ) : screenColor917 ) * (( _IfMaskColor )?( MaskColor439 ):( temp_cast_83 )) );
			float4 temp_cast_85 = (1.0).xxxx;
			float3 temp_output_9_0_g997 = ( appendResult67_g992 * temp_output_2046_39 ).xyz;
			float4 break7_g997 = _AddTexRefine;
			float3 temp_cast_87 = (max( break7_g997.z , 0.01 )).xxx;
			float3 lerpResult4_g997 = lerp( ( temp_output_9_0_g997 * break7_g997.x ) , ( pow( temp_output_9_0_g997 , temp_cast_87 ) * break7_g997.y ) , break7_g997.w);
			float4 AddTexColors479 = ( _AddTexColor * float4( lerpResult4_g997 , 0.0 ) );
			float4 temp_cast_90 = (1.0).xxxx;
			float4 temp_cast_92 = (1.0).xxxx;
			float4 temp_cast_94 = (1.0).xxxx;
			float4 lerpResult488 = lerp( temp_output_223_0 , AddTexColors479 , _AddTexBlend);
			float4 ifLocalVar1675 = 0;
			if( _AddTexBlendMode > 1.0 )
				ifLocalVar1675 = ( AddTexColors479 * temp_output_223_0 );
			else if( _AddTexBlendMode == 1.0 )
				ifLocalVar1675 = ( AddTexColors479 + temp_output_223_0 );
			else if( _AddTexBlendMode < 1.0 )
				ifLocalVar1675 = lerpResult488;
			float4 MainColornoparticle224 = (( _IfAddTex )?( ( _IfAddTexColor == 0.0 ? temp_output_223_0 : ifLocalVar1675 ) ):( temp_output_223_0 ));
			float4 lerpResult230 = lerp( MainColornoparticle224 , _DIssloveColor , _DIssloveColor.a);
			float4 temp_cast_95 = (1.0).xxxx;
			float4 lerpResult33 = lerp( lerpResult230 , ( ( _IfDissolveColor == 0.0 ? i.vertexColor : temp_cast_95 ) * MainColornoparticle224 ) , temp_output_2237_90);
			float temp_output_234_0 = ( temp_output_2237_91 - step( temp_output_64_0_g994 , temp_output_74_0_g994 ) );
			float4 lerpResult244 = lerp( MainColornoparticle224 , ( lerpResult230 * temp_output_234_0 ) , temp_output_234_0);
			float4 DisColor40 = ( ( _IfDissolveColor == 0.0 ? temp_cast_79 : i.vertexColor ) * (( _soft_sting )?( lerpResult244 ):( lerpResult33 )) );
			float2 appendResult56_g1025 = (float2(_NormalTex_Uspeed , _NormalTex_Vspeed));
			float4 break36_g1021 = _NormalTex_ST;
			float2 appendResult31_g1021 = (float2(break36_g1021.x , break36_g1021.y));
			float2 appendResult38_g1021 = (float2(break36_g1021.z , break36_g1021.w));
			float2 CenteredUV15_g1022 = ( i.uv_texcoord.xy - centeruv867 );
			float2 break17_g1022 = CenteredUV15_g1022;
			float2 appendResult23_g1022 = (float2(( length( CenteredUV15_g1022 ) * break36_g1021.x * 2.0 ) , ( atan2( break17_g1022.x , break17_g1022.y ) * ( 1.0 / 6.28318548202515 ) * break36_g1021.y )));
			float2 appendResult30_g1021 = (float2(i.uv4_texcoord4.x , i.uv4_texcoord4.y));
			float2 appendResult32_g1021 = (float2(break36_g1021.x , break36_g1021.y));
			#if defined(_MAINTEXUVS_NORMAL)
				float2 staticSwitch2179 = ( ( i.uv_texcoord.xy * appendResult31_g1021 ) + appendResult38_g1021 );
			#elif defined(_MAINTEXUVS_POLAR)
				float2 staticSwitch2179 = ( appendResult23_g1022 + appendResult38_g1021 );
			#elif defined(_MAINTEXUVS_CYLINDER)
				float2 staticSwitch2179 = ( ( maintongUV557 * appendResult31_g1021 ) + appendResult38_g1021 );
			#elif defined(_MAINTEXUVS_UV2)
				float2 staticSwitch2179 = ( ( appendResult30_g1021 * appendResult32_g1021 ) + appendResult38_g1021 );
			#else
				float2 staticSwitch2179 = ( ( i.uv_texcoord.xy * appendResult31_g1021 ) + appendResult38_g1021 );
			#endif
			float2 OffsetPOM80_g1023 = POM( _ParaTex, staticSwitch2179, ddx(staticSwitch2179), ddy(staticSwitch2179), ase_worldNormal, ase_worldViewDir, i.viewDir, 64, 64, Parallax1492, 0, _ParaTex_ST.xy, float2(0,0), 0 );
			float3 temp_cast_99 = (0.0).xxx;
			float2 panner51_g1025 = ( 1.0 * _Time.y * appendResult56_g1025 + ( float3( ( Ifpara1474 == 0.0 ? staticSwitch2179 : OffsetPOM80_g1023 ) ,  0.0 ) + ( _DistortNormalTex == 0.0 ? temp_cast_99 : DistortUV60 ) ).xy);
			float cos62_g1025 = cos( ( ( ( _NormalTex_Rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin62_g1025 = sin( ( ( ( _NormalTex_Rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator62_g1025 = mul( panner51_g1025 - float2( 0.5,0.5 ) , float2x2( cos62_g1025 , -sin62_g1025 , sin62_g1025 , cos62_g1025 )) + float2( 0.5,0.5 );
			float2 break59_g1025 = rotator62_g1025;
			float2 break61_g1025 = rotator62_g1025;
			float clampResult67_g1025 = clamp( break61_g1025.x , 0.0 , 1.0 );
			float clampResult57_g1025 = clamp( break61_g1025.y , 0.0 , 1.0 );
			float2 appendResult60_g1025 = (float2(( (float)(int)_NormalTexC == 0.0 ? break59_g1025.x : clampResult67_g1025 ) , ( (float)(int)_NormalTexCV == 0.0 ? break59_g1025.y : clampResult57_g1025 )));
			float temp_output_65_0_g993 = _DIssloveSoft;
			float temp_output_70_0_g993 = ( _CustomdataDis == 0.0 ? ( _DIssloveFactor + 0.001 ) : ( _CustomdataDisT == 0.0 ? DissolveFactorC1856 : (1.0 + (i.vertexColor.a - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) ) );
			float temp_output_77_0_g993 = ( ( temp_output_65_0_g993 + 1.0 ) * temp_output_70_0_g993 );
			float2 break68_g989 = appendResult53_g989;
			float temp_output_64_0_g989 = ( pow( _StaticNormalOffset , 3.0 ) * 0.1 );
			float2 appendResult67_g989 = (float2(( break68_g989.x + temp_output_64_0_g989 ) , break68_g989.y));
			float4 tex2DNode70_g989 = tex2D( _DissloveTex, appendResult67_g989 );
			float temp_output_85_0_g993 = saturate( pow( ( (float)temp_output_38_0_g989 == 0.0 ? tex2DNode70_g989.a : tex2DNode70_g989.r ) , _DissolveTexExp ) );
			float2 break68_g990 = appendResult53_g990;
			float temp_output_64_0_g990 = ( pow( _StaticNormalOffset , 3.0 ) * 0.1 );
			float2 appendResult67_g990 = (float2(( break68_g990.x + temp_output_64_0_g990 ) , break68_g990.y));
			float4 tex2DNode70_g990 = tex2D( _DissloveTexPlus, appendResult67_g990 );
			float temp_output_74_0_g993 = saturate( ( ( ( temp_output_85_0_g993 / _DissolveTexDivide ) + ( _IfDissolvePlus == 0.0 ? temp_output_85_0_g993 : ( (float)temp_output_38_0_g990 == 0.0 ? tex2DNode70_g990.a : tex2DNode70_g990.r ) ) ) / 2.0 ) );
			float smoothstepResult76_g993 = smoothstep( ( temp_output_77_0_g993 - temp_output_65_0_g993 ) , temp_output_77_0_g993 , temp_output_74_0_g993);
			float temp_output_66_0_g993 = _DIssloveWide;
			float temp_output_64_0_g993 = ( temp_output_70_0_g993 * ( 1.0 + temp_output_66_0_g993 ) );
			float DisAplha11397 = ( _sot_sting_A == 0.0 ? smoothstepResult76_g993 : step( ( temp_output_64_0_g993 - temp_output_66_0_g993 ) , temp_output_74_0_g993 ) );
			float temp_output_1402_0 = ( _StaticNormalScale * 10.0 );
			float3 appendResult1273 = (float3(1.0 , 0.0 , ( ( DisAplha11397 - DisAplha42 ) * temp_output_1402_0 )));
			float temp_output_65_0_g995 = _DIssloveSoft;
			float temp_output_70_0_g995 = ( _CustomdataDis == 0.0 ? ( _DIssloveFactor + 0.001 ) : ( _CustomdataDisT == 0.0 ? DissolveFactorC1856 : (1.0 + (i.vertexColor.a - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) ) );
			float temp_output_77_0_g995 = ( ( temp_output_65_0_g995 + 1.0 ) * temp_output_70_0_g995 );
			float2 appendResult63_g989 = (float2(break68_g989.x , ( break68_g989.y + temp_output_64_0_g989 )));
			float4 tex2DNode76_g989 = tex2D( _DissloveTex, appendResult63_g989 );
			float temp_output_85_0_g995 = saturate( pow( ( (float)temp_output_38_0_g989 == 0.0 ? tex2DNode76_g989.a : tex2DNode76_g989.r ) , _DissolveTexExp ) );
			float2 appendResult63_g990 = (float2(break68_g990.x , ( break68_g990.y + temp_output_64_0_g990 )));
			float4 tex2DNode76_g990 = tex2D( _DissloveTexPlus, appendResult63_g990 );
			float temp_output_74_0_g995 = saturate( ( ( ( temp_output_85_0_g995 / _DIssloveSoft ) + ( _IfDissolvePlus == 0.0 ? temp_output_85_0_g995 : ( (float)temp_output_38_0_g990 == 0.0 ? tex2DNode76_g990.a : tex2DNode76_g990.r ) ) ) / 2.0 ) );
			float smoothstepResult76_g995 = smoothstep( ( temp_output_77_0_g995 - temp_output_65_0_g995 ) , temp_output_77_0_g995 , temp_output_74_0_g995);
			float temp_output_66_0_g995 = _DIssloveWide;
			float temp_output_64_0_g995 = ( temp_output_70_0_g995 * ( 1.0 + temp_output_66_0_g995 ) );
			float DisAplha21398 = ( _sot_sting_A == 0.0 ? smoothstepResult76_g995 : step( ( temp_output_64_0_g995 - temp_output_66_0_g995 ) , temp_output_74_0_g995 ) );
			float3 appendResult1268 = (float3(0.0 , 1.0 , ( ( DisAplha21398 - DisAplha42 ) * temp_output_1402_0 )));
			float3 normalizeResult1265 = normalize( cross( appendResult1273 , appendResult1268 ) );
			float3 Normal1046 = BlendNormals( UnpackScaleNormal( tex2D( _NormalTex, appendResult60_g1025 ), _NormalScale ) , ( _IfStaticNormal == 0.0 ? float3(0,0,1) : normalizeResult1265 ) );
			float4 Cubemap1144 = ( _IfCubemap == 0.0 ? float4( 0,0,0,0 ) : ( texCUBE( _CubeMap, WorldReflectionVector( i , Normal1046 ) ) * _CubemapScale * _LightScale ) );
			float4 temp_output_145_0 = ( ( _AlphaAdd == 0.0 ? 1.0 : MainAlpha142 ) * ( ( _DepthF == 0.0 ? float4( 0,0,0,0 ) : DepthColor412 ) + ( fnlColor97 + DisColor40 + Cubemap1144 ) ) );
			float4 switchResult433 = (((i.ASEVFace>0)?(temp_output_145_0):(( temp_output_145_0 * _BackFaceColor ))));
			float3 desaturateInitialColor299 = switchResult433.rgb;
			float desaturateDot299 = dot( desaturateInitialColor299, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar299 = lerp( desaturateInitialColor299, desaturateDot299.xxx, _qubaohedu );
			o.Emission = desaturateVar299;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows noambient nolightmap  nodynlightmap nodirlightmap nofog vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 5.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			sampler3D _DitherMaskLOD;
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float4 customPack1 : TEXCOORD1;
				float4 customPack2 : TEXCOORD2;
				float4 customPack3 : TEXCOORD3;
				float4 customPack4 : TEXCOORD4;
				float4 customPack5 : TEXCOORD5;
				float4 screenPos : TEXCOORD6;
				float4 tSpace0 : TEXCOORD7;
				float4 tSpace1 : TEXCOORD8;
				float4 tSpace2 : TEXCOORD9;
				half4 color : COLOR0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full_custom v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xyzw = customInputData.uv4_texcoord4;
				o.customPack1.xyzw = v.texcoord3;
				o.customPack2.xyzw = customInputData.uv_texcoord;
				o.customPack2.xyzw = v.texcoord;
				o.customPack3.xyzw = customInputData.uv2_texcoord2;
				o.customPack3.xyzw = v.texcoord1;
				o.customPack4.xyzw = customInputData.uv3_texcoord3;
				o.customPack4.xyzw = v.texcoord2;
				o.customPack5.xyzw = customInputData.screenPosition88;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				o.screenPos = ComputeScreenPos( o.pos );
				o.color = v.color;
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv4_texcoord4 = IN.customPack1.xyzw;
				surfIN.uv_texcoord = IN.customPack2.xyzw;
				surfIN.uv2_texcoord2 = IN.customPack3.xyzw;
				surfIN.uv3_texcoord3 = IN.customPack4.xyzw;
				surfIN.screenPosition88 = IN.customPack5.xyzw;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.viewDir = IN.tSpace0.xyz * worldViewDir.x + IN.tSpace1.xyz * worldViewDir.y + IN.tSpace2.xyz * worldViewDir.z;
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.worldRefl = -worldViewDir;
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				surfIN.screenPos = IN.screenPos;
				surfIN.vertexColor = IN.color;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT( UnityGI, gi );
				o.Alpha = LightingStandardCustomLighting( o, worldViewDir, gi ).a;
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				half alphaRef = tex3D( _DitherMaskLOD, float3( vpos.xy * 0.25, o.Alpha * 0.9375 ) ).a;
				clip( alphaRef - 0.01 );
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "PandavfxGUI23"
}
