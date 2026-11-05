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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
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
    float _43 = in.m_31.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[32].z;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c4)._m0[1].y, _57);
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _67 = fma(_65, (*spvDescriptorSet0.fp_c4)._m0[1].y, _57);
    float _69 = fma((*spvDescriptorSet0.fp_c3)._m0[32].y, (*spvDescriptorSet0.fp_c4)._m0[1].y, _57);
    float _71 = fma((*spvDescriptorSet0.fp_c3)._m0[32].z, (*spvDescriptorSet0.fp_c4)._m0[1].y, _57);
    float2 _228 = float2(_59, _63);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_228, float2(0.0), isnan(_228))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_228, float2(0.0), isnan(_228))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float2 _248 = float2(_59, _67);
    float4 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_248, float2(0.0), isnan(_248))).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float2 _264 = float2(_59, _57);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_264, float2(0.0), isnan(_264))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_264, float2(0.0), isnan(_264))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _280 = float2(_59, _69);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_280, float2(0.0), isnan(_280))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_280, float2(0.0), isnan(_280))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float2 _296 = float2(_59, _71);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_296, float2(0.0), isnan(_296))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float _124 = _76 * (*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _126 = _78 * (*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _128 = _80 * (*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _130 = _82 * (*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _132 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[33].y, _124);
    float _134 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[33].y, _126);
    float _136 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[33].y, _128);
    float _138 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[33].y, _130);
    float _140 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[33].x, _132);
    float _142 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[33].x, _134);
    float _144 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[33].x, _136);
    float _146 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[33].x, _138);
    float _148 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[33].y, _140);
    float _150 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].y, _142);
    float _152 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[33].y, _144);
    float _154 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[33].y, _146);
    float _156 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[33].z, _148);
    float _158 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[33].z, _150);
    float _160 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[33].z, _152);
    float _162 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[33].z, _154);
    out.m_34.x = _156;
    out.m_34.y = _158;
    out.m_34.z = _160;
    out.m_34.w = _162;
    return out;
}

