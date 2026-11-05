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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_37.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_37.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _260 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_260, float2(0.0), isnan(_260))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_260, float2(0.0), isnan(_260))).x;
    float2 _272 = float2(_67, _69);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_272, float2(0.0), isnan(_272))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_272, float2(0.0), isnan(_272))).x;
    float2 _280 = float2(_67, _69);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_280, float2(0.0), isnan(_280))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_280, float2(0.0), isnan(_280))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_39.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_39.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _65 * _90;
    float _106 = _65 * _96;
    float _108 = _65 * _102;
    float _110 = in.m_41.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = _104 * _104;
    float _118 = fma(_108, _108, _116);
    float _120 = fma(_106, _106, _118);
    float _122 = rsqrt(_120);
    float _124 = _104 * _122;
    float _126 = _65 * _114;
    float _128 = _108 * _122;
    float _130 = _106 * _122;
    float _132 = _124 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _134 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[2].x, _132);
    float _136 = fma(_130, (*spvDescriptorSet0.fp_c4)._m0[2].z, _134);
    float _138 = fma(_136, 0.5, 0.5);
    float _140 = fma(_138, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _142 = fma(_138, _140, -0.212114393711090087890625);
    float _144 = -_71;
    float _146 = fma(_144, _126, 1.0);
    float _148 = 1.0 / _146;
    float _150 = _148 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _154 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[7].x, _152);
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = fma(_138, _142, 1.570728778839111328125);
    float _160 = fma(_136, -0.5, 0.5);
    float _162 = -_156;
    float _164 = _162 + 1.0;
    float _166 = abs(_164);
    float _168 = log2(_166);
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _172 = _170 + 1.0;
    float _174 = sqrt(_160);
    float _176 = _168 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _178 = exp2(_176);
    float _180 = _174 * 0.636619746685028076171875;
    float _182 = fma(_178, _172, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _184 = -_158;
    float _186 = fma(_180, _184, 1.0);
    float _188 = fma(_182, 0.5, 0.5);
    float2 _453 = float2(_186, _188);
    float3 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_453, float2(0.0), isnan(_453))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_453, float2(0.0), isnan(_453))).xyz;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _168 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _202 = exp2(_200);
    float _204 = -_202;
    float _206 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _208 = _73 * _206;
    float _210 = -_78;
    float _212 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[13].x, _210);
    float _214 = -_80;
    float _216 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[13].x, _214);
    float _218 = -_82;
    float _220 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[13].x, _218);
    float _222 = fma(_208, _212, _78);
    float _224 = fma(_208, _216, _80);
    float _226 = fma(_208, _220, _82);
    out.m_44.x = _222;
    out.m_44.y = _224;
    out.m_44.z = _226;
    out.m_44.w = _84;
    return out;
}

