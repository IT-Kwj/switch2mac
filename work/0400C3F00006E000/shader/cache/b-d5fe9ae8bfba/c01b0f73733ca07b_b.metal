#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
    float4 m_39 [[color(1)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _224 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_224, float2(0.0), isnan(_224))).x;
    float2 _235 = float2(_62, _64);
    float4 _69 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_235, float2(0.0), isnan(_235)), int2(0), component::x).xyzw;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _69.w;
    float _79 = in.m_31.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_31.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = _60 * _83;
    float _93 = floor(_91);
    float _95 = -_93;
    float _97 = _91 + _95;
    float _99 = -_66;
    float _101 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _103 = _60 * _89;
    bool _107 = _66 != 1.0;
    bool _109 = isnan(_66);
    bool _111 = _107 || _109;
    bool _113 = isnan(1.0);
    bool _115 = _111 || _113;
    float _117 = 1.0 / _101;
    float _119 = floor(_103);
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _123 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[1].w, _121);
    float _125 = _117 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    int _128 = _115 ? as_type<int>(_123) : 1065353216;
    float _130 = -_119;
    float _132 = _103 + _130;
    float _134 = -as_type<float>(_128);
    float _136 = _134 + _77;
    float _138 = -as_type<float>(_128);
    float _140 = _138 + _73;
    float _142 = -as_type<float>(_128);
    float _144 = _142 + _71;
    float _146 = -as_type<float>(_128);
    float _148 = _146 + _75;
    float _150 = abs(_140);
    float _152 = -_150;
    float _154 = abs(_136);
    float _156 = _152 + _154;
    float _158 = abs(_144);
    float _160 = abs(_148);
    float _162 = -_160;
    float _164 = _158 + _162;
    float _166 = _156 + _164;
    float _168 = -_164;
    float _170 = _156 + _168;
    float _172 = fma(_125, _166, _97);
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = fma(_125, _170, _132);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = -_97;
    float _182 = _180 + _174;
    float _184 = -_132;
    float _186 = _184 + _178;
    float _188 = fma(_182, 0.5, 0.5);
    float _190 = fma(_186, 0.5, 0.5);
    out.gl_FragDepth = _117;
    out.m_37.x = as_type<float>(_128);
    out.m_37.y = as_type<float>(_128);
    out.m_37.z = as_type<float>(_128);
    out.m_37.w = as_type<float>(_128);
    out.m_39.x = _188;
    out.m_39.y = _190;
    return out;
}


struct main0_out_u
{
    uint4 m_37 [[color(0)]];
    uint4 m_39 [[color(1)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _224 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_224, float2(0.0), isnan(_224))).x;
    float2 _235 = float2(_62, _64);
    float4 _69 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_235, float2(0.0), isnan(_235)), int2(0), component::x).xyzw;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _69.w;
    float _79 = in.m_31.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_31.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = _60 * _83;
    float _93 = floor(_91);
    float _95 = -_93;
    float _97 = _91 + _95;
    float _99 = -_66;
    float _101 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _103 = _60 * _89;
    bool _107 = _66 != 1.0;
    bool _109 = isnan(_66);
    bool _111 = _107 || _109;
    bool _113 = isnan(1.0);
    bool _115 = _111 || _113;
    float _117 = 1.0 / _101;
    float _119 = floor(_103);
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _123 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[1].w, _121);
    float _125 = _117 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    int _128 = _115 ? as_type<int>(_123) : 1065353216;
    float _130 = -_119;
    float _132 = _103 + _130;
    float _134 = -as_type<float>(_128);
    float _136 = _134 + _77;
    float _138 = -as_type<float>(_128);
    float _140 = _138 + _73;
    float _142 = -as_type<float>(_128);
    float _144 = _142 + _71;
    float _146 = -as_type<float>(_128);
    float _148 = _146 + _75;
    float _150 = abs(_140);
    float _152 = -_150;
    float _154 = abs(_136);
    float _156 = _152 + _154;
    float _158 = abs(_144);
    float _160 = abs(_148);
    float _162 = -_160;
    float _164 = _158 + _162;
    float _166 = _156 + _164;
    float _168 = -_164;
    float _170 = _156 + _168;
    float _172 = fma(_125, _166, _97);
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = fma(_125, _170, _132);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = -_97;
    float _182 = _180 + _174;
    float _184 = -_132;
    float _186 = _184 + _178;
    float _188 = fma(_182, 0.5, 0.5);
    float _190 = fma(_186, 0.5, 0.5);
    out.gl_FragDepth = _117;
    out.m_37.x = as_type<float>(_128);
    out.m_37.y = as_type<float>(_128);
    out.m_37.z = as_type<float>(_128);
    out.m_37.w = as_type<float>(_128);
    out.m_39.x = _188;
    out.m_39.y = _190;
    return main0_out_u{as_type<uint4>(out.m_37), as_type<uint4>(out.m_39), out.gl_FragDepth};
}


struct main0_out_m
{
    uint4 m_37 [[color(0)]];
    float4 m_39 [[color(1)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _224 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_224, float2(0.0), isnan(_224))).x;
    float2 _235 = float2(_62, _64);
    float4 _69 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_235, float2(0.0), isnan(_235)), int2(0), component::x).xyzw;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _69.w;
    float _79 = in.m_31.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_31.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = _60 * _83;
    float _93 = floor(_91);
    float _95 = -_93;
    float _97 = _91 + _95;
    float _99 = -_66;
    float _101 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _103 = _60 * _89;
    bool _107 = _66 != 1.0;
    bool _109 = isnan(_66);
    bool _111 = _107 || _109;
    bool _113 = isnan(1.0);
    bool _115 = _111 || _113;
    float _117 = 1.0 / _101;
    float _119 = floor(_103);
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _123 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[1].w, _121);
    float _125 = _117 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    int _128 = _115 ? as_type<int>(_123) : 1065353216;
    float _130 = -_119;
    float _132 = _103 + _130;
    float _134 = -as_type<float>(_128);
    float _136 = _134 + _77;
    float _138 = -as_type<float>(_128);
    float _140 = _138 + _73;
    float _142 = -as_type<float>(_128);
    float _144 = _142 + _71;
    float _146 = -as_type<float>(_128);
    float _148 = _146 + _75;
    float _150 = abs(_140);
    float _152 = -_150;
    float _154 = abs(_136);
    float _156 = _152 + _154;
    float _158 = abs(_144);
    float _160 = abs(_148);
    float _162 = -_160;
    float _164 = _158 + _162;
    float _166 = _156 + _164;
    float _168 = -_164;
    float _170 = _156 + _168;
    float _172 = fma(_125, _166, _97);
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = fma(_125, _170, _132);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = -_97;
    float _182 = _180 + _174;
    float _184 = -_132;
    float _186 = _184 + _178;
    float _188 = fma(_182, 0.5, 0.5);
    float _190 = fma(_186, 0.5, 0.5);
    out.gl_FragDepth = _117;
    out.m_37.x = as_type<float>(_128);
    out.m_37.y = as_type<float>(_128);
    out.m_37.z = as_type<float>(_128);
    out.m_37.w = as_type<float>(_128);
    out.m_39.x = _188;
    out.m_39.y = _190;
    return main0_out_m{as_type<uint4>(out.m_37), out.m_39, out.gl_FragDepth};
}

