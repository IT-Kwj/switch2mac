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
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_34.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_34.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _197 = float2(_60, _62);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_197, float2(0.0), isnan(_197)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = gl_FragCoord.x;
    float _77 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _79 = _75 / _77;
    float _81 = gl_FragCoord.y;
    float _83 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _85 = _81 / _83;
    float _87 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _89 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _91 = _60 * _87;
    float _93 = _62 * _89;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = trunc(_93);
    int _102 = int(_100);
    float _104 = trunc(_79);
    int _106 = int(_104);
    int _108 = _102 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _110 = _108 + _98;
    float _112 = trunc(_85);
    int _114 = int(_112);
    int _116 = _106 & 1;
    float _118 = precise::max(_67, _69);
    int _120 = _114 << 1;
    float _122 = precise::max(_71, _73);
    int _124 = 2 & _120;
    int _126 = (-3) & _116;
    int _128 = _124 | _126;
    float _130 = precise::max(_118, _122);
    int _132 = _110 << 2;
    int _134 = _132 + _128;
    float _136 = _130 * 16777215.0;
    int _138 = _134 << 2;
    int _140 = _138 + 9728;
    float _142 = _73 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _144 = -_73;
    float _146 = _144 + 1.0;
    float _148 = trunc(_136);
    float _150 = precise::max(_148, 0.0);
    uint _153 = uint(_150);
    float _155 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[0].x, _142);
    float _157 = 1.0 / _155;
    uint _159 = uint(int(uint(_140) >> uint(2)));
    uint _336 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_159)], _153, memory_order_relaxed);
    uint _161 = _336;
    float _163 = _142 * _157;
    out.gl_FragDepth = _163;
    return out;
}

