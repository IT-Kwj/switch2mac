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
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
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
    float _53 = rint((*spvDescriptorSet0.fp_c3)._m0[15].y);
    float _55 = precise::max(_53, 0.0);
    uint _58 = uint(_55);
    uint _60 = clamp(_58, 0u, 65535u);
    float _62 = 1.0 / _39;
    float _64 = _62 * _45;
    float _66 = _62 * _51;
    float3 _135 = float3(_64, _66, float(int(_60)));
    float3 _140 = select(_135, float3(0.0), isnan(_135));
    float4 _69 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _140.xy, uint(rint(_140.z)), int2(0), component::x).xyzw;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _69.w;
    float _79 = precise::min(_71, _73);
    float _81 = precise::min(_75, _77);
    float _83 = precise::min(_79, _81);
    out.m_32.x = _83;
    out.m_32.y = _83;
    out.m_32.z = _83;
    out.m_32.w = _83;
    return out;
}

