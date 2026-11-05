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
    float2 _241 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_241, float2(0.0), isnan(_241)), int2(0), component::x).xyzw;
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
    float _132 = precise::min(_69, _71);
    float _134 = precise::min(_73, _75);
    float _136 = precise::min(_132, _134);
    float _138 = precise::max(_69, _71);
    bool _142 = _136 >= 1.0;
    bool _144 = isnan(_136);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = -_136;
    float _154 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _156 = 1.0 / _154;
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _160 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[1].w, _158);
    float _162 = precise::max(_73, _75);
    float _164 = _160 * 16777215.0;
    float _166 = precise::max(_138, _162);
    bool _168 = !_150;
    float _170 = _168 ? _164 : 16777215.0;
    float _172 = -_166;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _176 = _130 << 2;
    float _178 = trunc(_170);
    float _180 = precise::max(_178, 0.0);
    uint _183 = uint(_180);
    float _185 = 1.0 / _174;
    bool _187 = _166 >= 1.0;
    bool _189 = isnan(_166);
    bool _191 = _187 || _189;
    bool _193 = isnan(1.0);
    bool _195 = _191 || _193;
    uint _197 = uint(int(uint(_176) >> uint(2)));
    uint _422 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_197)], _183, memory_order_relaxed);
    uint _199 = _422;
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _203 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[1].w, _201);
    bool _205 = !_195;
    int _207 = _205 ? as_type<int>(_203) : 1065353216;
    out.m_37.x = _75;
    out.m_37.y = _75;
    out.m_37.z = _75;
    out.m_37.w = _75;
    out.m_39.x = as_type<float>(_207);
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
    float2 _241 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_241, float2(0.0), isnan(_241)), int2(0), component::x).xyzw;
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
    float _132 = precise::min(_69, _71);
    float _134 = precise::min(_73, _75);
    float _136 = precise::min(_132, _134);
    float _138 = precise::max(_69, _71);
    bool _142 = _136 >= 1.0;
    bool _144 = isnan(_136);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = -_136;
    float _154 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _156 = 1.0 / _154;
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _160 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[1].w, _158);
    float _162 = precise::max(_73, _75);
    float _164 = _160 * 16777215.0;
    float _166 = precise::max(_138, _162);
    bool _168 = !_150;
    float _170 = _168 ? _164 : 16777215.0;
    float _172 = -_166;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _176 = _130 << 2;
    float _178 = trunc(_170);
    float _180 = precise::max(_178, 0.0);
    uint _183 = uint(_180);
    float _185 = 1.0 / _174;
    bool _187 = _166 >= 1.0;
    bool _189 = isnan(_166);
    bool _191 = _187 || _189;
    bool _193 = isnan(1.0);
    bool _195 = _191 || _193;
    uint _197 = uint(int(uint(_176) >> uint(2)));
    uint _422 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_197)], _183, memory_order_relaxed);
    uint _199 = _422;
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _203 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[1].w, _201);
    bool _205 = !_195;
    int _207 = _205 ? as_type<int>(_203) : 1065353216;
    out.m_37.x = _75;
    out.m_37.y = _75;
    out.m_37.z = _75;
    out.m_37.w = _75;
    out.m_39.x = as_type<float>(_207);
    return main0_out_u{as_type<uint4>(out.m_37), as_type<uint4>(out.m_39)};
}


struct main0_out_m
{
    float4 m_37 [[color(0)]];
    uint4 m_39 [[color(2)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float2 _241 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_241, float2(0.0), isnan(_241)), int2(0), component::x).xyzw;
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
    float _132 = precise::min(_69, _71);
    float _134 = precise::min(_73, _75);
    float _136 = precise::min(_132, _134);
    float _138 = precise::max(_69, _71);
    bool _142 = _136 >= 1.0;
    bool _144 = isnan(_136);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = -_136;
    float _154 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _156 = 1.0 / _154;
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _160 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[1].w, _158);
    float _162 = precise::max(_73, _75);
    float _164 = _160 * 16777215.0;
    float _166 = precise::max(_138, _162);
    bool _168 = !_150;
    float _170 = _168 ? _164 : 16777215.0;
    float _172 = -_166;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _176 = _130 << 2;
    float _178 = trunc(_170);
    float _180 = precise::max(_178, 0.0);
    uint _183 = uint(_180);
    float _185 = 1.0 / _174;
    bool _187 = _166 >= 1.0;
    bool _189 = isnan(_166);
    bool _191 = _187 || _189;
    bool _193 = isnan(1.0);
    bool _195 = _191 || _193;
    uint _197 = uint(int(uint(_176) >> uint(2)));
    uint _422 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_197)], _183, memory_order_relaxed);
    uint _199 = _422;
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _203 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[1].w, _201);
    bool _205 = !_195;
    int _207 = _205 ? as_type<int>(_203) : 1065353216;
    out.m_37.x = _75;
    out.m_37.y = _75;
    out.m_37.z = _75;
    out.m_37.w = _75;
    out.m_39.x = as_type<float>(_207);
    return main0_out_m{out.m_37, as_type<uint4>(out.m_39)};
}

