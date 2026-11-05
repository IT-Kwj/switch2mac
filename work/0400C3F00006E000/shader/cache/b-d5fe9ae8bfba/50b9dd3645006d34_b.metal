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
    float2 _209 = float2(_60, _62);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_209, float2(0.0), isnan(_209)), int2(0), component::x).xyzw;
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
    int _116 = _106 * 2;
    int _118 = _114 & 1;
    int _120 = 2 & _116;
    int _122 = (-3) & _118;
    int _124 = _120 | _122;
    int _126 = _110 * 4;
    int _128 = _126 + _124;
    float _130 = precise::min(_67, _69);
    float _132 = precise::min(_71, _73);
    float _134 = precise::min(_130, _132);
    bool _138 = _134 >= 1.0;
    bool _140 = isnan(_134);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = -_134;
    float _150 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _152 = 1.0 / _150;
    float _154 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _156 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[1].w, _154);
    float _158 = _156 * 16777215.0;
    bool _160 = !_146;
    float _162 = _160 ? _158 : 16777215.0;
    int _164 = _128 << 2;
    float _166 = trunc(_162);
    float _168 = precise::max(_166, 0.0);
    uint _171 = uint(_168);
    uint _173 = uint(int(uint(_164) >> uint(2)));
    uint _362 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_173)], _171, memory_order_relaxed);
    uint _175 = _362;
    out.m_37.x = _73;
    out.m_37.y = _73;
    out.m_37.z = _73;
    out.m_37.w = _73;
    return out;
}

