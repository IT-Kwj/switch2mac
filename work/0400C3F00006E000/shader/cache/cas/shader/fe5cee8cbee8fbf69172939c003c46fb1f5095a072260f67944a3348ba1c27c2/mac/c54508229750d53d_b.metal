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
    float2 _275 = float2(_60, _62);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_275, float2(0.0), isnan(_275)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = gl_FragCoord.y;
    float _77 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _79 = _75 / _77;
    float _81 = gl_FragCoord.x;
    float _83 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _85 = _81 / _83;
    float _87 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _89 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _91 = _62 * _87;
    float _93 = _60 * _89;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = trunc(_93);
    int _102 = int(_100);
    float _104 = trunc(_79);
    int _106 = int(_104);
    int _108 = _98 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _110 = _108 + _102;
    float _112 = trunc(_85);
    int _114 = int(_112);
    int _116 = _114 & 1;
    float _118 = precise::min(_67, _69);
    float _120 = precise::min(_71, _73);
    float _122 = precise::max(_67, _69);
    float _124 = precise::min(_118, _120);
    int _126 = _106 * 2;
    float _128 = precise::max(_71, _73);
    bool _132 = _124 >= 1.0;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = -_124;
    float _144 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _146 = precise::max(_122, _128);
    int _148 = 2 & _126;
    int _150 = (-3) & _116;
    int _152 = _148 | _150;
    float _154 = 1.0 / _144;
    float _156 = -_146;
    float _158 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _160 = _110 << 2;
    int _162 = _160 + _152;
    int _164 = _162 * 4;
    float _166 = 1.0 / _158;
    int _168 = _164 + 9728;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _172 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[1].w, _170);
    float _174 = _172 * 16777215.0;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _178 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[1].w, _176);
    bool _180 = !_140;
    float _182 = _180 ? _174 : 16777215.0;
    bool _184 = _146 >= 1.0;
    bool _186 = isnan(_146);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = _178 * 16777215.0;
    float _196 = -_73;
    float _198 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _200 = trunc(_182);
    float _202 = precise::max(_200, 0.0);
    uint _205 = uint(_202);
    bool _207 = !_192;
    float _209 = _207 ? _194 : 16777215.0;
    float _211 = 1.0 / _198;
    float _213 = trunc(_209);
    float _215 = precise::max(_213, 0.0);
    uint _217 = uint(_215);
    bool _219 = _73 != 1.0;
    bool _221 = isnan(_73);
    bool _223 = _219 || _221;
    bool _225 = isnan(1.0);
    bool _227 = _223 || _225;
    uint _229 = uint(int(uint(_164) >> uint(2)));
    uint _499 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_229)], _205, memory_order_relaxed);
    uint _231 = _499;
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _235 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[1].w, _233);
    int _237 = _227 ? as_type<int>(_235) : 1065353216;
    uint _239 = uint(int(uint(_168) >> uint(2)));
    uint _520 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_239)], _217, memory_order_relaxed);
    uint _241 = _520;
    out.m_37.x = as_type<float>(_237);
    out.m_37.y = as_type<float>(_237);
    out.m_37.z = as_type<float>(_237);
    out.m_37.w = as_type<float>(_237);
    return out;
}


struct main0_out_u
{
    uint4 m_37 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float2 _275 = float2(_60, _62);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_275, float2(0.0), isnan(_275)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = gl_FragCoord.y;
    float _77 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _79 = _75 / _77;
    float _81 = gl_FragCoord.x;
    float _83 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _85 = _81 / _83;
    float _87 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _89 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _91 = _62 * _87;
    float _93 = _60 * _89;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = trunc(_93);
    int _102 = int(_100);
    float _104 = trunc(_79);
    int _106 = int(_104);
    int _108 = _98 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _110 = _108 + _102;
    float _112 = trunc(_85);
    int _114 = int(_112);
    int _116 = _114 & 1;
    float _118 = precise::min(_67, _69);
    float _120 = precise::min(_71, _73);
    float _122 = precise::max(_67, _69);
    float _124 = precise::min(_118, _120);
    int _126 = _106 * 2;
    float _128 = precise::max(_71, _73);
    bool _132 = _124 >= 1.0;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = -_124;
    float _144 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _146 = precise::max(_122, _128);
    int _148 = 2 & _126;
    int _150 = (-3) & _116;
    int _152 = _148 | _150;
    float _154 = 1.0 / _144;
    float _156 = -_146;
    float _158 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _160 = _110 << 2;
    int _162 = _160 + _152;
    int _164 = _162 * 4;
    float _166 = 1.0 / _158;
    int _168 = _164 + 9728;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _172 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[1].w, _170);
    float _174 = _172 * 16777215.0;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _178 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[1].w, _176);
    bool _180 = !_140;
    float _182 = _180 ? _174 : 16777215.0;
    bool _184 = _146 >= 1.0;
    bool _186 = isnan(_146);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = _178 * 16777215.0;
    float _196 = -_73;
    float _198 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _200 = trunc(_182);
    float _202 = precise::max(_200, 0.0);
    uint _205 = uint(_202);
    bool _207 = !_192;
    float _209 = _207 ? _194 : 16777215.0;
    float _211 = 1.0 / _198;
    float _213 = trunc(_209);
    float _215 = precise::max(_213, 0.0);
    uint _217 = uint(_215);
    bool _219 = _73 != 1.0;
    bool _221 = isnan(_73);
    bool _223 = _219 || _221;
    bool _225 = isnan(1.0);
    bool _227 = _223 || _225;
    uint _229 = uint(int(uint(_164) >> uint(2)));
    uint _499 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_229)], _205, memory_order_relaxed);
    uint _231 = _499;
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _235 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[1].w, _233);
    int _237 = _227 ? as_type<int>(_235) : 1065353216;
    uint _239 = uint(int(uint(_168) >> uint(2)));
    uint _520 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_239)], _217, memory_order_relaxed);
    uint _241 = _520;
    out.m_37.x = as_type<float>(_237);
    out.m_37.y = as_type<float>(_237);
    out.m_37.z = as_type<float>(_237);
    out.m_37.w = as_type<float>(_237);
    return main0_out_u{as_type<uint4>(out.m_37)};
}

