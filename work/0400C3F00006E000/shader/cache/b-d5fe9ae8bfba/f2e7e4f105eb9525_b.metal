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
    float2 _205 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_205, float2(0.0), isnan(_205))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_205, float2(0.0), isnan(_205))).x;
    float2 _217 = float2(_62, _64);
    float4 _69 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_217, float2(0.0), isnan(_217)), int2(0), component::x).xyzw;
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
    float _93 = _60 * _89;
    float _95 = floor(_91);
    float _97 = floor(_93);
    float _99 = -_95;
    float _101 = _91 + _99;
    float _103 = -_97;
    float _105 = _93 + _103;
    float _107 = -_66;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _111 = -_66;
    float _113 = _111 + _77;
    float _115 = -_66;
    float _117 = _115 + _73;
    float _119 = -_66;
    float _121 = _119 + _71;
    float _123 = -_66;
    float _125 = _123 + _75;
    float _127 = 1.0 / _109;
    float _129 = abs(_117);
    float _131 = -_129;
    float _133 = abs(_113);
    float _135 = _131 + _133;
    float _137 = abs(_121);
    float _139 = abs(_125);
    float _141 = -_139;
    float _143 = _137 + _141;
    float _145 = _135 + _143;
    float _147 = -_143;
    float _149 = _135 + _147;
    float _151 = _127 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _153 = fma(_151, _145, _101);
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = fma(_151, _149, _105);
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = -_101;
    float _163 = _161 + _155;
    float _165 = -_105;
    float _167 = _165 + _159;
    float _169 = fma(_163, 0.5, 0.5);
    float _171 = fma(_167, 0.5, 0.5);
    out.gl_FragDepth = _101;
    out.m_37.x = _66;
    out.m_37.y = _66;
    out.m_37.z = _66;
    out.m_37.w = _66;
    out.m_39.x = _169;
    out.m_39.y = _171;
    return out;
}

