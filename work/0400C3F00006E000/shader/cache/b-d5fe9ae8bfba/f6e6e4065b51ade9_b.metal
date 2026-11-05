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
    float2 _259 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_259, float2(0.0), isnan(_259)), int2(0), component::x).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _79 = gl_FragCoord.x;
    float _81 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _83 = _79 / _81;
    float _85 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _87 = _64 * _77;
    float _89 = gl_FragCoord.y;
    float _91 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _93 = _89 / _91;
    float _95 = _62 * _85;
    float _97 = trunc(_87);
    int _100 = int(_97);
    float _102 = trunc(_95);
    int _104 = int(_102);
    float _106 = trunc(_83);
    int _108 = int(_106);
    int _110 = _100 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _112 = _110 + _104;
    float _114 = trunc(_93);
    int _116 = int(_114);
    int _118 = _108 & 1;
    int _120 = _116 << 1;
    int _122 = 2 & _120;
    int _124 = (-3) & _118;
    int _126 = _122 | _124;
    int _128 = _112 * 4;
    int _130 = _128 + _126;
    int _132 = _130 * 4;
    int _134 = _132 + 9728;
    float _136 = precise::min(_69, _71);
    float _138 = precise::max(_69, _71);
    float _140 = precise::min(_73, _75);
    float _142 = precise::max(_73, _75);
    float _144 = precise::min(_136, _140);
    float _146 = precise::max(_138, _142);
    bool _150 = _144 >= 1.0;
    bool _152 = isnan(_144);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = -_144;
    float _162 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _164 = -_146;
    float _166 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _168 = 1.0 / _162;
    float _170 = 1.0 / _166;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _174 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[1].w, _172);
    float _176 = _174 * 16777215.0;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _180 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[1].w, _178);
    bool _182 = !_158;
    float _184 = _182 ? _176 : 16777215.0;
    bool _186 = _146 >= 1.0;
    bool _188 = isnan(_146);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = _180 * 16777215.0;
    float _198 = trunc(_184);
    float _200 = precise::max(_198, 0.0);
    uint _203 = uint(_200);
    bool _205 = !_194;
    float _207 = _205 ? _196 : 16777215.0;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _213 = uint(_211);
    bool _215 = !_194;
    int _217 = _215 ? as_type<int>(_180) : 1065353216;
    uint _219 = uint(int(uint(_132) >> uint(2)));
    uint _471 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_219)], _203, memory_order_relaxed);
    uint _221 = _471;
    uint _223 = uint(int(uint(_134) >> uint(2)));
    uint _479 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_223)], _213, memory_order_relaxed);
    uint _225 = _479;
    out.m_37.x = _75;
    out.m_37.y = _75;
    out.m_37.z = _75;
    out.m_37.w = _75;
    out.m_39.x = as_type<float>(_217);
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
    float2 _259 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_259, float2(0.0), isnan(_259)), int2(0), component::x).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _79 = gl_FragCoord.x;
    float _81 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _83 = _79 / _81;
    float _85 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _87 = _64 * _77;
    float _89 = gl_FragCoord.y;
    float _91 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _93 = _89 / _91;
    float _95 = _62 * _85;
    float _97 = trunc(_87);
    int _100 = int(_97);
    float _102 = trunc(_95);
    int _104 = int(_102);
    float _106 = trunc(_83);
    int _108 = int(_106);
    int _110 = _100 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _112 = _110 + _104;
    float _114 = trunc(_93);
    int _116 = int(_114);
    int _118 = _108 & 1;
    int _120 = _116 << 1;
    int _122 = 2 & _120;
    int _124 = (-3) & _118;
    int _126 = _122 | _124;
    int _128 = _112 * 4;
    int _130 = _128 + _126;
    int _132 = _130 * 4;
    int _134 = _132 + 9728;
    float _136 = precise::min(_69, _71);
    float _138 = precise::max(_69, _71);
    float _140 = precise::min(_73, _75);
    float _142 = precise::max(_73, _75);
    float _144 = precise::min(_136, _140);
    float _146 = precise::max(_138, _142);
    bool _150 = _144 >= 1.0;
    bool _152 = isnan(_144);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = -_144;
    float _162 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _164 = -_146;
    float _166 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _168 = 1.0 / _162;
    float _170 = 1.0 / _166;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _174 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[1].w, _172);
    float _176 = _174 * 16777215.0;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _180 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[1].w, _178);
    bool _182 = !_158;
    float _184 = _182 ? _176 : 16777215.0;
    bool _186 = _146 >= 1.0;
    bool _188 = isnan(_146);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = _180 * 16777215.0;
    float _198 = trunc(_184);
    float _200 = precise::max(_198, 0.0);
    uint _203 = uint(_200);
    bool _205 = !_194;
    float _207 = _205 ? _196 : 16777215.0;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _213 = uint(_211);
    bool _215 = !_194;
    int _217 = _215 ? as_type<int>(_180) : 1065353216;
    uint _219 = uint(int(uint(_132) >> uint(2)));
    uint _471 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_219)], _203, memory_order_relaxed);
    uint _221 = _471;
    uint _223 = uint(int(uint(_134) >> uint(2)));
    uint _479 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_223)], _213, memory_order_relaxed);
    uint _225 = _479;
    out.m_37.x = _75;
    out.m_37.y = _75;
    out.m_37.z = _75;
    out.m_37.w = _75;
    out.m_39.x = as_type<float>(_217);
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
    float2 _259 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_259, float2(0.0), isnan(_259)), int2(0), component::x).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _79 = gl_FragCoord.x;
    float _81 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _83 = _79 / _81;
    float _85 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _87 = _64 * _77;
    float _89 = gl_FragCoord.y;
    float _91 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _93 = _89 / _91;
    float _95 = _62 * _85;
    float _97 = trunc(_87);
    int _100 = int(_97);
    float _102 = trunc(_95);
    int _104 = int(_102);
    float _106 = trunc(_83);
    int _108 = int(_106);
    int _110 = _100 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _112 = _110 + _104;
    float _114 = trunc(_93);
    int _116 = int(_114);
    int _118 = _108 & 1;
    int _120 = _116 << 1;
    int _122 = 2 & _120;
    int _124 = (-3) & _118;
    int _126 = _122 | _124;
    int _128 = _112 * 4;
    int _130 = _128 + _126;
    int _132 = _130 * 4;
    int _134 = _132 + 9728;
    float _136 = precise::min(_69, _71);
    float _138 = precise::max(_69, _71);
    float _140 = precise::min(_73, _75);
    float _142 = precise::max(_73, _75);
    float _144 = precise::min(_136, _140);
    float _146 = precise::max(_138, _142);
    bool _150 = _144 >= 1.0;
    bool _152 = isnan(_144);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = -_144;
    float _162 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _164 = -_146;
    float _166 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _168 = 1.0 / _162;
    float _170 = 1.0 / _166;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _174 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[1].w, _172);
    float _176 = _174 * 16777215.0;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _180 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[1].w, _178);
    bool _182 = !_158;
    float _184 = _182 ? _176 : 16777215.0;
    bool _186 = _146 >= 1.0;
    bool _188 = isnan(_146);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = _180 * 16777215.0;
    float _198 = trunc(_184);
    float _200 = precise::max(_198, 0.0);
    uint _203 = uint(_200);
    bool _205 = !_194;
    float _207 = _205 ? _196 : 16777215.0;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _213 = uint(_211);
    bool _215 = !_194;
    int _217 = _215 ? as_type<int>(_180) : 1065353216;
    uint _219 = uint(int(uint(_132) >> uint(2)));
    uint _471 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_219)], _203, memory_order_relaxed);
    uint _221 = _471;
    uint _223 = uint(int(uint(_134) >> uint(2)));
    uint _479 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_223)], _213, memory_order_relaxed);
    uint _225 = _479;
    out.m_37.x = _75;
    out.m_37.y = _75;
    out.m_37.z = _75;
    out.m_37.w = _75;
    out.m_39.x = as_type<float>(_217);
    return main0_out_m{out.m_37, as_type<uint4>(out.m_39)};
}

