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
    float2 _205 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_205, float2(0.0), isnan(_205)), int2(0), component::x).xyzw;
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
    int _110 = _104 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _112 = _110 + _100;
    float _114 = trunc(_87);
    int _116 = int(_114);
    int _118 = _108 * 2;
    int _120 = _116 & 1;
    int _122 = 2 & _118;
    int _124 = (-3) & _120;
    int _126 = _122 | _124;
    int _128 = _112 * 4;
    int _130 = _128 + _126;
    int _132 = _130 << 2;
    float _134 = precise::max(_69, _71);
    float _136 = precise::min(_69, _71);
    float _138 = precise::max(_73, _75);
    float _140 = precise::min(_73, _75);
    float _142 = precise::max(_134, _138);
    float _144 = precise::min(_136, _140);
    int _146 = _132 + 9728;
    float _148 = _142 * 16777215.0;
    float _150 = _144 * 16777215.0;
    float _152 = trunc(_150);
    float _154 = precise::max(_152, 0.0);
    uint _157 = uint(_154);
    float _159 = trunc(_148);
    float _161 = precise::max(_159, 0.0);
    uint _163 = uint(_161);
    uint _165 = uint(int(uint(_132) >> uint(2)));
    uint _347 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_165)], _157, memory_order_relaxed);
    uint _167 = _347;
    uint _169 = uint(int(uint(_146) >> uint(2)));
    uint _355 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_169)], _163, memory_order_relaxed);
    uint _171 = _355;
    out.m_37.x = _75;
    out.m_37.y = _75;
    out.m_37.z = _75;
    out.m_37.w = _75;
    out.m_39.x = _142;
    return out;
}

