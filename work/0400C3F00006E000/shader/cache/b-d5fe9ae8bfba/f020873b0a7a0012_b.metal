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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _264 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_264, float2(0.0), isnan(_264))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_264, float2(0.0), isnan(_264))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _281 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_281, float2(0.0), isnan(_281))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_281, float2(0.0), isnan(_281))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = abs(_67);
    float _94 = log2(_92);
    float _96 = abs(_69);
    float _98 = log2(_96);
    float _100 = abs(_71);
    float _102 = log2(_100);
    float _104 = _94 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _106 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = exp2(_104);
    float _110 = _102 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _112 = exp2(_106);
    float _114 = exp2(_110);
    float _116 = _76 + _108;
    float _118 = _116 * _90;
    float _120 = _78 + _112;
    bool _124 = _118 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _132 = _128 || _130;
    float _134 = _120 * _90;
    bool _136 = !_132;
    float _138 = _136 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _140 = _80 + _114;
    bool _142 = !_132;
    float _144 = _142 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _146 = _134 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _148 = isnan(_134);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _154 = _150 || _152;
    float _156 = _140 * _90;
    float _158 = fma(_118, _138, _144);
    bool _160 = !_154;
    float _162 = _160 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _164 = _156 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _166 = isnan(_156);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _172 = _168 || _170;
    bool _174 = !_154;
    float _176 = _174 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _178 = 1.0 / _158;
    bool _180 = !_172;
    float _182 = _180 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _184 = !_172;
    float _186 = _184 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _188 = fma(_134, _176, _162);
    bool _190 = !_154;
    float _192 = _190 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _194 = !_132;
    float _196 = _194 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _198 = fma(_156, _182, _186);
    bool _200 = !_132;
    float _202 = _200 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _204 = 1.0 / _188;
    bool _206 = !_154;
    float _208 = _206 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _210 = !_172;
    float _212 = _210 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _214 = fma(_118, _202, _196);
    bool _216 = !_172;
    float _218 = _216 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _220 = fma(_134, _192, _208);
    float _222 = 1.0 / _198;
    float _224 = _214 * _178;
    float _226 = fma(_156, _212, _218);
    float _228 = _220 * _204;
    float _230 = _226 * _222;
    out.m_36.x = _224;
    out.m_36.y = _228;
    out.m_36.z = _230;
    out.m_36.w = _82;
    return out;
}

