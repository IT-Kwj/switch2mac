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
    float2 _253 = float2(_60, _62);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_253, float2(0.0), isnan(_253)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _77 = gl_FragCoord.x;
    float _79 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _81 = _77 / _79;
    float _83 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _85 = _62 * _75;
    float _87 = gl_FragCoord.y;
    float _89 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _91 = _87 / _89;
    float _93 = _60 * _83;
    float _95 = trunc(_85);
    int _98 = int(_95);
    float _100 = trunc(_93);
    int _102 = int(_100);
    float _104 = trunc(_81);
    int _106 = int(_104);
    int _108 = _98 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _110 = _108 + _102;
    float _112 = trunc(_91);
    int _114 = int(_112);
    int _116 = _106 & 1;
    float _118 = precise::min(_67, _69);
    float _120 = precise::max(_67, _69);
    int _122 = _114 * 2;
    float _124 = precise::min(_71, _73);
    float _126 = precise::max(_71, _73);
    float _128 = precise::min(_118, _124);
    float _130 = precise::max(_120, _126);
    bool _134 = _128 >= 1.0;
    bool _136 = isnan(_128);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    float _144 = -_128;
    float _146 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _148 = 2 & _122;
    int _150 = (-3) & _116;
    int _152 = _148 | _150;
    float _154 = -_130;
    float _156 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _158 = 1.0 / _146;
    int _160 = _110 * 4;
    int _162 = _160 + _152;
    int _164 = _162 << 2;
    float _166 = 1.0 / _156;
    int _168 = _164 + 9728;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _172 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[1].w, _170);
    float _174 = _172 * 16777215.0;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _178 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[1].w, _176);
    bool _180 = !_142;
    float _182 = _180 ? _174 : 16777215.0;
    bool _184 = _130 >= 1.0;
    bool _186 = isnan(_130);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = _178 * 16777215.0;
    float _196 = trunc(_182);
    float _198 = precise::max(_196, 0.0);
    uint _201 = uint(_198);
    bool _203 = !_192;
    float _205 = _203 ? _194 : 16777215.0;
    float _207 = trunc(_205);
    float _209 = precise::max(_207, 0.0);
    uint _211 = uint(_209);
    uint _213 = uint(int(uint(_164) >> uint(2)));
    uint _458 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_213)], _201, memory_order_relaxed);
    uint _215 = _458;
    uint _217 = uint(int(uint(_168) >> uint(2)));
    uint _466 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_217)], _211, memory_order_relaxed);
    uint _219 = _466;
    out.m_37.x = _73;
    out.m_37.y = _73;
    out.m_37.z = _73;
    out.m_37.w = _73;
    return out;
}

