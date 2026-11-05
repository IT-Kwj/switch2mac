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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _63 = _57 + _61;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _67 = _59 + _65;
    float _69 = _59 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _71 = _57 + (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float2 _301 = float2(_63, _67);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).w;
    float2 _312 = float2(_63, _69);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_312, float2(0.0), isnan(_312))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_312, float2(0.0), isnan(_312))).w;
    float2 _320 = float2(_71, _67);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_320, float2(0.0), isnan(_320))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_320, float2(0.0), isnan(_320))).w;
    float2 _328 = float2(_71, _69);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_328, float2(0.0), isnan(_328))).w;
    float2 _336 = float2(_57, _59);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_336, float2(0.0), isnan(_336))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_336, float2(0.0), isnan(_336))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_29.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_29.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_31.w;
    float _106 = _55 * _96;
    float _108 = _55 * _102;
    float _110 = float2(as_type<half2>(as_type<uint>(_104))).y;
    float _112 = (-0.0) + _110;
    float _114 = float2(as_type<half2>(as_type<uint>(_104))).x;
    float _116 = (-0.0) + _114;
    bool _120 = _106 >= 0.0;
    bool _122 = isnan(_106);
    bool _124 = _120 || _122;
    bool _126 = isnan(0.0);
    bool _128 = _124 || _126;
    float _130 = float(_128);
    bool _132 = _108 < _112;
    float _134 = float(_132);
    bool _136 = _106 < _116;
    float _138 = float(_136);
    float _140 = _130 * _134;
    float _142 = _116 + (-1.0);
    float _144 = _112 + (-1.0);
    bool _146 = _108 >= 0.0;
    bool _148 = isnan(_108);
    bool _150 = _146 || _148;
    bool _152 = isnan(0.0);
    bool _154 = _150 || _152;
    float _156 = float(_154);
    float _158 = _138 * _140;
    bool _160 = _106 >= 1.0;
    bool _162 = isnan(_106);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = float(_168);
    bool _172 = _106 < _142;
    float _174 = float(_172);
    float _176 = _156 * _158;
    bool _178 = _108 < _144;
    float _180 = float(_178);
    bool _182 = _108 >= 1.0;
    bool _184 = isnan(_108);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = float(_190);
    float _194 = _170 * _73;
    float _196 = _170 * _75;
    float _198 = _174 * _77;
    float _200 = _174 * _79;
    float _202 = _180 * _194;
    float _204 = _192 * _196;
    float _206 = _180 * _198;
    float _208 = _192 * _200;
    float _210 = _138 * _202;
    float _212 = _138 * _204;
    float _214 = _130 * _206;
    float _216 = _130 * _208;
    float _218 = _90 * _176;
    float _220 = precise::max(_210, _212);
    float _222 = precise::max(_214, _216);
    float _224 = _218 * 1.2000000476837158203125;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = precise::max(_220, _222);
    float _230 = _226 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _232 = _226 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _234 = _226 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _236 = precise::max(_228, _218);
    float _238 = _84 * _230;
    float _240 = _86 * _232;
    float _242 = _88 * _234;
    float _244 = _236 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    out.m_34.x = _238;
    out.m_34.y = _240;
    out.m_34.z = _242;
    out.m_34.w = _244;
    return out;
}

