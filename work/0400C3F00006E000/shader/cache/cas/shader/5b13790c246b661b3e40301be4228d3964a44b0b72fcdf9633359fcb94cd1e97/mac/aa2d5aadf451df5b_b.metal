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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _158 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_158, float2(0.0), isnan(_158))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_158, float2(0.0), isnan(_158))).x;
    float2 _169 = float2(_57, _59);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_169, float2(0.0), isnan(_169))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_169, float2(0.0), isnan(_169))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    bool _76 = _61 >= 1.0;
    bool _78 = isnan(_61);
    bool _80 = _76 || _78;
    bool _82 = isnan(1.0);
    bool _84 = _80 || _82;
    if (_84)
    {
        out.m_34.x = _66;
        out.m_34.y = _68;
        out.m_34.z = _70;
        out.m_34.w = _72;
        return out;
    }
    float _86 = _68 * 0.715200006961822509765625;
    float _88 = fma(_66, 0.2125999927520751953125, _86);
    float _90 = fma(_70, 0.072200000286102294921875, _88);
    float _92 = 1.0 / _90;
    float _94 = _92 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _100 = _68 * _98;
    float _102 = _66 * _98;
    float _104 = _70 * _98;
    float _106 = _100 * 0.715200006961822509765625;
    float _108 = fma(_102, 0.2125999927520751953125, _106);
    float _110 = fma(_104, 0.072200000286102294921875, _108);
    float _112 = 1.0 / _110;
    float _114 = _112 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _120 = _102 * _118;
    float _122 = _100 * _118;
    float _124 = _104 * _118;
    out.m_34.x = _120;
    out.m_34.y = _122;
    out.m_34.z = _124;
    out.m_34.w = _72;
    return out;
}

