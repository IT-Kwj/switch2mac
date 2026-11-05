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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_37.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_37.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _272 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_272, float2(0.0), isnan(_272))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_272, float2(0.0), isnan(_272))).x;
    float2 _284 = float2(_65, _67);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_284, float2(0.0), isnan(_284))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_284, float2(0.0), isnan(_284))).x;
    float2 _292 = float2(_65, _67);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_292, float2(0.0), isnan(_292))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_292, float2(0.0), isnan(_292))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_39.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_39.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_39.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _63 * _88;
    float _104 = _63 * _94;
    float _106 = _63 * _100;
    float _108 = _102 * _102;
    float _110 = fma(_104, _104, _108);
    float _112 = fma(_106, _106, _110);
    float _114 = rsqrt(_112);
    float _116 = _102 * _114;
    float _118 = _104 * _114;
    float _120 = _106 * _114;
    float _122 = _116 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _124 = fma(_118, (*spvDescriptorSet0.fp_c4)._m0[2].x, _122);
    float _126 = fma(_120, (*spvDescriptorSet0.fp_c4)._m0[2].z, _124);
    float _128 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[7].x, _130);
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float _136 = -_134;
    float _138 = _136 + 1.0;
    float _140 = fma(_126, 0.5, 0.5);
    float _142 = abs(_138);
    float _144 = log2(_142);
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _148 = _146 + 1.0;
    float _150 = _144 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _152 = exp2(_150);
    float _154 = fma(_152, _148, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _156 = fma(_154, 0.5, 0.5);
    float2 _425 = float2(_140, _156);
    float3 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_425, float2(0.0), isnan(_425))).xyz;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _144 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _172 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[9].x, _170);
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = exp2(_168);
    float _178 = -_174;
    float _180 = _178 + 1.0;
    float _182 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _184 = abs(_180);
    float _186 = log2(_184);
    float _188 = _186 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _190 = exp2(_188);
    float _192 = -_176;
    float _194 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _196 = _71 * _194;
    float _198 = -_190;
    float _200 = fma(_182, _198, _182);
    float _202 = _71 * _200;
    float _204 = -_76;
    float _206 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _204);
    float _208 = -_78;
    float _210 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[13].x, _208);
    float _212 = -_80;
    float _214 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[13].x, _212);
    float _216 = fma(_196, _206, _76);
    float _218 = fma(_196, _210, _78);
    float _220 = fma(_196, _214, _80);
    float _222 = -_216;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _226 = -_218;
    float _228 = _226 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _230 = -_220;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _234 = fma(_202, _224, _216);
    float _236 = fma(_202, _228, _218);
    float _238 = fma(_202, _232, _220);
    out.m_42.x = _234;
    out.m_42.y = _236;
    out.m_42.z = _238;
    out.m_42.w = _82;
    return out;
}

