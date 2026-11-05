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
    float2 _239 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239)), int2(0), component::x).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = gl_FragCoord.x;
    float _79 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _81 = _77 / _79;
    float _83 = gl_FragCoord.y;
    float _85 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _87 = _83 / _85;
    float _89 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _91 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _93 = _64 * _89;
    float _95 = _62 * _91;
    float _97 = trunc(_93);
    int _100 = int(_97);
    float _102 = trunc(_95);
    int _104 = int(_102);
    float _106 = trunc(_81);
    int _108 = int(_106);
    int _110 = _100 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _112 = _110 + _104;
    float _114 = trunc(_87);
    int _116 = int(_114);
    int _118 = _108 & 1;
    float _120 = precise::max(_69, _71);
    float _122 = precise::max(_73, _75);
    int _124 = _116 << 1;
    float _126 = precise::max(_120, _122);
    int _128 = 2 & _124;
    int _130 = (-3) & _118;
    int _132 = _128 | _130;
    bool _136 = _126 >= 1.0;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = -_126;
    float _148 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _150 = -_75;
    float _152 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _154 = _112 * 4;
    int _156 = _154 + _132;
    float _158 = 1.0 / _148;
    int _160 = _156 << 2;
    int _162 = _160 + 9728;
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _166 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[1].w, _164);
    float _168 = 1.0 / _152;
    float _170 = _166 * 16777215.0;
    bool _172 = !_144;
    float _174 = _172 ? _170 : 16777215.0;
    float _176 = trunc(_174);
    float _178 = precise::max(_176, 0.0);
    uint _181 = uint(_178);
    bool _183 = _75 != 1.0;
    bool _185 = isnan(_75);
    bool _187 = _183 || _185;
    bool _189 = isnan(1.0);
    bool _191 = _187 || _189;
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _195 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[1].w, _193);
    int _197 = _191 ? as_type<int>(_195) : 1065353216;
    bool _199 = !_144;
    int _201 = _199 ? as_type<int>(_166) : 1065353216;
    uint _203 = uint(int(uint(_162) >> uint(2)));
    uint _433 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_203)], _181, memory_order_relaxed);
    uint _205 = _433;
    out.m_37.x = as_type<float>(_197);
    out.m_37.y = as_type<float>(_197);
    out.m_37.z = as_type<float>(_197);
    out.m_37.w = as_type<float>(_197);
    out.m_39.x = as_type<float>(_201);
    return out;
}


struct main0_out_u
{
    uint4 m_37 [[color(0)]];
    uint4 m_39 [[color(2)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float2 _239 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239)), int2(0), component::x).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = gl_FragCoord.x;
    float _79 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _81 = _77 / _79;
    float _83 = gl_FragCoord.y;
    float _85 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _87 = _83 / _85;
    float _89 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _91 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _93 = _64 * _89;
    float _95 = _62 * _91;
    float _97 = trunc(_93);
    int _100 = int(_97);
    float _102 = trunc(_95);
    int _104 = int(_102);
    float _106 = trunc(_81);
    int _108 = int(_106);
    int _110 = _100 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _112 = _110 + _104;
    float _114 = trunc(_87);
    int _116 = int(_114);
    int _118 = _108 & 1;
    float _120 = precise::max(_69, _71);
    float _122 = precise::max(_73, _75);
    int _124 = _116 << 1;
    float _126 = precise::max(_120, _122);
    int _128 = 2 & _124;
    int _130 = (-3) & _118;
    int _132 = _128 | _130;
    bool _136 = _126 >= 1.0;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = -_126;
    float _148 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _150 = -_75;
    float _152 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _154 = _112 * 4;
    int _156 = _154 + _132;
    float _158 = 1.0 / _148;
    int _160 = _156 << 2;
    int _162 = _160 + 9728;
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _166 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[1].w, _164);
    float _168 = 1.0 / _152;
    float _170 = _166 * 16777215.0;
    bool _172 = !_144;
    float _174 = _172 ? _170 : 16777215.0;
    float _176 = trunc(_174);
    float _178 = precise::max(_176, 0.0);
    uint _181 = uint(_178);
    bool _183 = _75 != 1.0;
    bool _185 = isnan(_75);
    bool _187 = _183 || _185;
    bool _189 = isnan(1.0);
    bool _191 = _187 || _189;
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _195 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[1].w, _193);
    int _197 = _191 ? as_type<int>(_195) : 1065353216;
    bool _199 = !_144;
    int _201 = _199 ? as_type<int>(_166) : 1065353216;
    uint _203 = uint(int(uint(_162) >> uint(2)));
    uint _433 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_203)], _181, memory_order_relaxed);
    uint _205 = _433;
    out.m_37.x = as_type<float>(_197);
    out.m_37.y = as_type<float>(_197);
    out.m_37.z = as_type<float>(_197);
    out.m_37.w = as_type<float>(_197);
    out.m_39.x = as_type<float>(_201);
    return main0_out_u{as_type<uint4>(out.m_37), as_type<uint4>(out.m_39)};
}

