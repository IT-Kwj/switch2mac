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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_32 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_36 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _54 = in.m_32.x;
    float _56 = in.m_32.y;
    float2 _175 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_175, float2(0.0), isnan(_175))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_175, float2(0.0), isnan(_175))).x;
    float _60 = gl_FragCoord.w;
    float _62 = in.m_36.w;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_38.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _60;
    float _76 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _78 = _74 * _66;
    float _80 = _74 * _72;
    float _82 = -_76;
    float _84 = _82 + _78;
    bool _88 = _84 > _80;
    if (_88)
    {
        discard_fragment();
    }
    if (_88)
    {
        out.m_41.x = 0.0;
        out.m_41.y = 0.0;
        out.m_41.z = 0.0;
        out.m_41.w = 0.0;
        return out;
    }
    float _90 = in.m_43.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_38.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _74 * _94;
    float _104 = _74 * _100;
    float _106 = -_76;
    float _108 = _106 + _102;
    bool _110 = _108 >= _104;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(_104);
    bool _118 = _114 || _116;
    if (!_118)
    {
        discard_fragment();
    }
    if (!_118)
    {
        out.m_41.x = 0.0;
        out.m_41.y = 0.0;
        out.m_41.z = 0.0;
        out.m_41.w = 0.0;
        return out;
    }
    float _120 = in.m_45.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_45.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_45.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _74 * _124;
    float _140 = _74 * _130;
    float _142 = _74 * _136;
    float _144 = rint(_138);
    float _146 = precise::max(_144, 0.0);
    uint _149 = uint(_146);
    uint _151 = clamp(_149, 0u, 65535u);
    float3 _334 = float3(_142, _140, float(int(_151)));
    float3 _338 = select(_334, float3(0.0), isnan(_334));
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _338.xy, uint(rint(_338.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _338.xy, uint(rint(_338.z))).x;
    float _155 = in.m_47.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _74 * _159;
    float _163 = _153 * _161;
    out.m_41.x = 0.0;
    out.m_41.y = 0.0;
    out.m_41.z = 0.0;
    out.m_41.w = _163;
    return out;
}

