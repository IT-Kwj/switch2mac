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
    float2 _179 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_179, float2(0.0), isnan(_179))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_179, float2(0.0), isnan(_179))).x;
    float _60 = gl_FragCoord.w;
    float _62 = in.m_36.w;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_38.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _60;
    float _76 = -_58;
    float _78 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].y, 1.0);
    float _80 = _74 * _66;
    float _82 = _74 * _72;
    float _84 = 1.0 / _78;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _88 = fma(_84, _86, _80);
    bool _92 = _88 > _82;
    if (_92)
    {
        discard_fragment();
    }
    if (_92)
    {
        out.m_41.x = 0.0;
        out.m_41.y = 0.0;
        out.m_41.z = 0.0;
        out.m_41.w = 0.0;
        return out;
    }
    float _94 = in.m_43.w;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_38.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = _74 * _98;
    float _108 = _74 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _112 = fma(_84, _110, _106);
    bool _114 = _112 >= _108;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan(_108);
    bool _122 = _118 || _120;
    if (!_122)
    {
        discard_fragment();
    }
    if (!_122)
    {
        out.m_41.x = 0.0;
        out.m_41.y = 0.0;
        out.m_41.z = 0.0;
        out.m_41.w = 0.0;
        return out;
    }
    float _124 = in.m_45.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_45.y;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_45.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = _74 * _128;
    float _144 = _74 * _134;
    float _146 = _74 * _140;
    float _148 = rint(_142);
    float _150 = precise::max(_148, 0.0);
    uint _153 = uint(_150);
    uint _155 = clamp(_153, 0u, 65535u);
    float3 _344 = float3(_146, _144, float(int(_155)));
    float3 _348 = select(_344, float3(0.0), isnan(_344));
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _348.xy, uint(rint(_348.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _348.xy, uint(rint(_348.z))).x;
    float _159 = in.m_47.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _74 * _163;
    float _167 = _157 * _165;
    out.m_41.x = 0.0;
    out.m_41.y = 0.0;
    out.m_41.z = 0.0;
    out.m_41.w = _167;
    return out;
}

