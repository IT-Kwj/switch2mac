#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    device _21* fp_s0 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
    float4 m_39 [[color(2)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_34.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_34.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _191 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_191, float2(0.0), isnan(_191)), int2(0), component::x).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = gl_FragCoord.y;
    float _79 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _81 = _77 / _79;
    float _83 = gl_FragCoord.x;
    float _85 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _87 = _83 / _85;
    float _89 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _91 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _93 = _62 * _89;
    float _95 = _64 * _91;
    float _97 = trunc(_93);
    int _100 = int(_97);
    float _102 = trunc(_95);
    int _104 = int(_102);
    float _106 = trunc(_81);
    int _108 = int(_106);
    float _110 = trunc(_87);
    int _112 = int(_110);
    int _114 = _104 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _116 = _114 + _100;
    int _118 = _108 * 2;
    int _120 = _112 & 1;
    int _122 = 2 & _118;
    int _124 = (-3) & _120;
    int _126 = _122 | _124;
    int _128 = _116 * 4;
    int _130 = _128 + _126;
    float _132 = precise::min(_69, _71);
    float _134 = precise::min(_73, _75);
    float _136 = precise::min(_132, _134);
    int _138 = _130 << 2;
    float _140 = _136 * 16777215.0;
    float _142 = trunc(_140);
    float _144 = precise::max(_142, 0.0);
    uint _147 = uint(_144);
    float _149 = precise::max(_69, _71);
    float _151 = precise::max(_73, _75);
    float _153 = precise::max(_149, _151);
    uint _155 = uint(int(uint(_138) >> uint(2)));
    uint _322 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_155)], _147, memory_order_relaxed);
    uint _157 = _322;
    out.m_37.x = _75;
    out.m_37.y = _75;
    out.m_37.z = _75;
    out.m_37.w = _75;
    out.m_39.x = _153;
    return out;
}

