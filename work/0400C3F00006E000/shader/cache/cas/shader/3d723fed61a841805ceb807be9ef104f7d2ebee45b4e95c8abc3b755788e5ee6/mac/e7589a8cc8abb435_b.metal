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
    texturecube_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[0].z));
    float _61 = rint(_59);
    float _63 = precise::max(_61, 0.0);
    uint _66 = uint(_63);
    uint _68 = clamp(_66, 0u, 65535u);
    float _70 = 1.0 / _39;
    float _72 = _70 * _45;
    float _74 = _70 * _51;
    float _76 = _70 * _57;
    float _78 = abs(_72);
    float _80 = abs(_74);
    float _82 = precise::max(_78, _80);
    float _84 = abs(_76);
    float _86 = precise::max(_84, _82);
    float _88 = 1.0 / _86;
    float _90 = _72 * _88;
    float _92 = _74 * _88;
    float _94 = _76 * _88;
    float4 _199 = float4(_90, _92, _94, float(int(_68)));
    float4 _204 = select(_199, float4(0.0), isnan(_199));
    float4 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _204.xyz, uint(rint(_204.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _204.xyz, uint(rint(_204.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyzw;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float _105 = _97.w;
    float _107 = precise::max(_99, _101);
    float _109 = precise::max(_103, _107);
    float _111 = _105 * _109;
    out.m_32.x = _111;
    out.m_32.y = _111;
    out.m_32.z = _111;
    out.m_32.w = _111;
    return out;
}

