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
    float2 _281 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_281, float2(0.0), isnan(_281)), int2(0), component::x).xyzw;
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
    int _118 = _108 * 2;
    int _120 = _116 & 1;
    int _122 = 2 & _118;
    int _124 = (-3) & _120;
    int _126 = _122 | _124;
    int _128 = _112 << 2;
    int _130 = _128 + _126;
    int _132 = _130 * 4;
    int _134 = _132 + 9728;
    float _136 = precise::min(_69, _71);
    float _138 = precise::min(_73, _75);
    float _140 = precise::max(_69, _71);
    float _142 = precise::min(_136, _138);
    float _144 = precise::max(_73, _75);
    bool _148 = _142 >= 1.0;
    bool _150 = isnan(_142);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = -_142;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _162 = precise::max(_140, _144);
    float _164 = 1.0 / _160;
    float _166 = -_162;
    float _168 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _170 = 1.0 / _168;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _174 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[1].w, _172);
    float _176 = _174 * 16777215.0;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _180 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[1].w, _178);
    bool _182 = !_156;
    float _184 = _182 ? _176 : 16777215.0;
    bool _186 = _162 >= 1.0;
    bool _188 = isnan(_162);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = _180 * 16777215.0;
    float _198 = -_75;
    float _200 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _202 = trunc(_184);
    float _204 = precise::max(_202, 0.0);
    uint _207 = uint(_204);
    bool _209 = !_194;
    float _211 = _209 ? _196 : 16777215.0;
    float _213 = 1.0 / _200;
    float _215 = trunc(_211);
    float _217 = precise::max(_215, 0.0);
    uint _219 = uint(_217);
    bool _221 = _75 != 1.0;
    bool _223 = isnan(_75);
    bool _225 = _221 || _223;
    bool _227 = isnan(1.0);
    bool _229 = _225 || _227;
    uint _231 = uint(int(uint(_132) >> uint(2)));
    uint _505 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_231)], _207, memory_order_relaxed);
    uint _233 = _505;
    float _235 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _237 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[1].w, _235);
    int _239 = _229 ? as_type<int>(_237) : 1065353216;
    uint _241 = uint(int(uint(_134) >> uint(2)));
    uint _526 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_241)], _219, memory_order_relaxed);
    uint _243 = _526;
    bool _245 = !_194;
    int _247 = _245 ? as_type<int>(_180) : 1065353216;
    out.m_37.x = as_type<float>(_239);
    out.m_37.y = as_type<float>(_239);
    out.m_37.z = as_type<float>(_239);
    out.m_37.w = as_type<float>(_239);
    out.m_39.x = as_type<float>(_247);
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
    float2 _281 = float2(_62, _64);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_281, float2(0.0), isnan(_281)), int2(0), component::x).xyzw;
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
    int _118 = _108 * 2;
    int _120 = _116 & 1;
    int _122 = 2 & _118;
    int _124 = (-3) & _120;
    int _126 = _122 | _124;
    int _128 = _112 << 2;
    int _130 = _128 + _126;
    int _132 = _130 * 4;
    int _134 = _132 + 9728;
    float _136 = precise::min(_69, _71);
    float _138 = precise::min(_73, _75);
    float _140 = precise::max(_69, _71);
    float _142 = precise::min(_136, _138);
    float _144 = precise::max(_73, _75);
    bool _148 = _142 >= 1.0;
    bool _150 = isnan(_142);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = -_142;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _162 = precise::max(_140, _144);
    float _164 = 1.0 / _160;
    float _166 = -_162;
    float _168 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _170 = 1.0 / _168;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _174 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[1].w, _172);
    float _176 = _174 * 16777215.0;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _180 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[1].w, _178);
    bool _182 = !_156;
    float _184 = _182 ? _176 : 16777215.0;
    bool _186 = _162 >= 1.0;
    bool _188 = isnan(_162);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = _180 * 16777215.0;
    float _198 = -_75;
    float _200 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _202 = trunc(_184);
    float _204 = precise::max(_202, 0.0);
    uint _207 = uint(_204);
    bool _209 = !_194;
    float _211 = _209 ? _196 : 16777215.0;
    float _213 = 1.0 / _200;
    float _215 = trunc(_211);
    float _217 = precise::max(_215, 0.0);
    uint _219 = uint(_217);
    bool _221 = _75 != 1.0;
    bool _223 = isnan(_75);
    bool _225 = _221 || _223;
    bool _227 = isnan(1.0);
    bool _229 = _225 || _227;
    uint _231 = uint(int(uint(_132) >> uint(2)));
    uint _505 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_231)], _207, memory_order_relaxed);
    uint _233 = _505;
    float _235 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _237 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[1].w, _235);
    int _239 = _229 ? as_type<int>(_237) : 1065353216;
    uint _241 = uint(int(uint(_134) >> uint(2)));
    uint _526 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_241)], _219, memory_order_relaxed);
    uint _243 = _526;
    bool _245 = !_194;
    int _247 = _245 ? as_type<int>(_180) : 1065353216;
    out.m_37.x = as_type<float>(_239);
    out.m_37.y = as_type<float>(_239);
    out.m_37.z = as_type<float>(_239);
    out.m_37.w = as_type<float>(_239);
    out.m_39.x = as_type<float>(_247);
    return main0_out_u{as_type<uint4>(out.m_37), as_type<uint4>(out.m_39)};
}

