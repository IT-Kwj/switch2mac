#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _55 = 1.0 / _39;
    float _57 = _55 * _45;
    float _59 = _55 * _51;
    float _61 = fma(_53, -1.5, _57);
    float _63 = fma(_53, -1.5, _59);
    float _65 = fma(_53, 2.0, _61);
    float _67 = fma(_53, 2.0, _63);
    float2 _191 = float2(_61, _63);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_191, float2(0.0), isnan(_191)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float2 _211 = float2(_65, _63);
    float4 _80 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_211, float2(0.0), isnan(_211)), int2(0), component::x).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float2 _227 = float2(_61, _67);
    float4 _90 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_227, float2(0.0), isnan(_227)), int2(0), component::x).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float2 _243 = float2(_65, _67);
    float4 _100 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_243, float2(0.0), isnan(_243)), int2(0), component::x).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = precise::max(_72, _74);
    float _112 = precise::max(_76, _78);
    float _114 = precise::max(_82, _84);
    float _116 = precise::max(_86, _88);
    float _118 = precise::max(_92, _94);
    float _120 = precise::max(_96, _98);
    float _122 = precise::max(_102, _104);
    float _124 = precise::max(_106, _108);
    float _126 = precise::max(_110, _112);
    float _128 = precise::max(_114, _116);
    float _130 = precise::max(_118, _120);
    float _132 = precise::max(_122, _124);
    float _134 = precise::max(_126, _128);
    float _136 = precise::max(_130, _132);
    float _138 = precise::max(_134, _136);
    out.m_32.x = _138;
    out.m_32.y = _138;
    out.m_32.z = _138;
    out.m_32.w = _138;
    return out;
}

