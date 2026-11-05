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
    float _92 = _78 + _69;
    float _94 = _76 + _67;
    float _96 = _80 + _71;
    float _98 = _92 * _90;
    float _100 = _94 * _90;
    float _102 = _96 * _90;
    bool _106 = _98 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _108 = isnan(_98);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _114 = _110 || _112;
    bool _116 = _100 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _118 = isnan(_100);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _124 = _120 || _122;
    bool _126 = !_114;
    float _128 = _126 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _130 = !_114;
    float _132 = _130 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _134 = _102 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _136 = isnan(_102);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _142 = _138 || _140;
    bool _144 = !_124;
    float _146 = _144 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _148 = fma(_98, _128, _132);
    bool _150 = !_124;
    float _152 = _150 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _154 = !_142;
    float _156 = _154 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _158 = 1.0 / _148;
    bool _160 = !_142;
    float _162 = _160 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _164 = fma(_100, _146, _152);
    bool _166 = !_124;
    float _168 = _166 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _170 = !_124;
    float _172 = _170 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _174 = fma(_102, _156, _162);
    bool _176 = !_114;
    float _178 = _176 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _180 = 1.0 / _164;
    bool _182 = !_142;
    float _184 = _182 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _186 = fma(_100, _168, _172);
    bool _188 = !_142;
    float _190 = _188 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _192 = 1.0 / _174;
    bool _194 = !_114;
    float _196 = _194 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _198 = fma(_98, _178, _196);
    float _200 = fma(_102, _184, _190);
    float _202 = _186 * _180;
    float _204 = _198 * _158;
    float _206 = abs(_202);
    float _208 = log2(_206);
    float _210 = _200 * _192;
    float _212 = abs(_204);
    float _214 = log2(_212);
    float _216 = abs(_210);
    float _218 = log2(_216);
    float _220 = _208 * 2.2000000476837158203125;
    float _222 = _214 * 2.2000000476837158203125;
    float _224 = exp2(_220);
    float _226 = _218 * 2.2000000476837158203125;
    float _228 = exp2(_222);
    float _230 = exp2(_226);
    out.m_36.x = _224;
    out.m_36.y = _228;
    out.m_36.z = _230;
    out.m_36.w = _82;
    return out;
}

