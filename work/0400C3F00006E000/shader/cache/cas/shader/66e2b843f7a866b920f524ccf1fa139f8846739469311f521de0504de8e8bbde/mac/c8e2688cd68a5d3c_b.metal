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
    float2 _253 = float2(_60, _62);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_253, float2(0.0), isnan(_253)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _77 = gl_FragCoord.y;
    float _79 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _81 = _77 / _79;
    float _83 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _85 = gl_FragCoord.x;
    float _87 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _89 = _85 / _87;
    float _91 = _60 * _75;
    float _93 = _62 * _83;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = trunc(_93);
    int _102 = int(_100);
    float _104 = trunc(_81);
    int _106 = int(_104);
    int _108 = _102 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _110 = _108 + _98;
    float _112 = trunc(_89);
    int _114 = int(_112);
    int _116 = _114 & 1;
    float _118 = precise::min(_67, _69);
    float _120 = precise::max(_67, _69);
    float _122 = precise::min(_71, _73);
    float _124 = precise::min(_118, _122);
    float _126 = precise::max(_71, _73);
    bool _130 = _124 >= 1.0;
    bool _132 = isnan(_124);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = -_124;
    float _142 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _144 = precise::max(_120, _126);
    int _146 = _106 * 2;
    float _148 = -_144;
    float _150 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _152 = 1.0 / _142;
    int _154 = 2 & _146;
    int _156 = (-3) & _116;
    int _158 = _154 | _156;
    int _160 = _110 << 2;
    int _162 = _160 + _158;
    float _164 = 1.0 / _150;
    float _166 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _168 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[1].w, _166);
    int _170 = _162 * 4;
    float _172 = _168 * 16777215.0;
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _176 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[1].w, _174);
    bool _178 = !_138;
    float _180 = _178 ? _172 : 16777215.0;
    bool _182 = _144 >= 1.0;
    bool _184 = isnan(_144);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = _176 * 16777215.0;
    float _194 = trunc(_180);
    float _196 = precise::max(_194, 0.0);
    uint _199 = uint(_196);
    int _201 = _170 + 9728;
    bool _203 = !_190;
    float _205 = _203 ? _192 : 16777215.0;
    float _207 = trunc(_205);
    float _209 = precise::max(_207, 0.0);
    uint _211 = uint(_209);
    uint _213 = uint(int(uint(_170) >> uint(2)));
    uint _458 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_213)], _199, memory_order_relaxed);
    uint _215 = _458;
    uint _217 = uint(int(uint(_201) >> uint(2)));
    uint _466 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_217)], _211, memory_order_relaxed);
    uint _219 = _466;
    out.gl_FragDepth = _73;
    return out;
}

