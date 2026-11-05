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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
    float4 m_44 [[color(1)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0), center_no_perspective]];
    float4 m_39 [[user(locn1), center_no_perspective]];
    float4 m_35 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _51 = in.m_35.x;
    float _53 = in.m_35.y;
    float2 _343 = float2(_51, _53);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_343, float2(0.0), isnan(_343))).x;
    float2 _354 = float2(_51, _53);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_354, float2(0.0), isnan(_354))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_354, float2(0.0), isnan(_354))).xyzw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = _58.w;
    float _68 = in.m_37.w;
    float _70 = in.m_37.x;
    float _72 = in.m_37.y;
    float _74 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _76 = -_74;
    float _78 = fma(_76, _68, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _80 = -_74;
    float _82 = fma(_80, _70, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _84 = -_74;
    float _86 = fma(_84, _72, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _88 = 1.0 / _78;
    float _90 = _82 * _88;
    float _92 = _86 * _88;
    float2 _418 = float2(_66, 0.0);
    float2 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_418, float2(0.0), isnan(_418))).xy;
    float _98 = _96.x;
    float _100 = _96.y;
    float2 _430 = float2(_90, _92);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_430, float2(0.0), isnan(_430))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = in.m_39.y;
    float _114 = in.m_39.x;
    float _116 = in.m_39.z;
    float _118 = fma(_60, 2.0, -1.0);
    float _120 = fma(_64, 2.0, -1.0);
    float _122 = _112 * _112;
    float _124 = -_74;
    float _126 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _128 = fma(_124, _112, _126);
    float _130 = -_74;
    float _132 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _134 = fma(_130, _114, _132);
    float _136 = -_74;
    float _138 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _140 = fma(_136, _116, _138);
    float _142 = fma(_114, _114, _122);
    float _144 = _142 + 1.0;
    float _146 = _128 * _128;
    float _148 = fma(_134, _134, _146);
    float _150 = rsqrt(_144);
    float _152 = fma(_140, _140, _148);
    float _154 = rsqrt(_152);
    float _156 = _112 * _150;
    float _158 = _114 * _150;
    float _160 = _116 * _150;
    float _162 = -_78;
    float _164 = fma(_162, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _166 = _128 * _154;
    float _168 = _134 * _154;
    float _170 = _140 * _154;
    float _172 = fma(_62, 2.0, -1.0);
    float _174 = -_156;
    float _176 = _166 + _174;
    float _178 = -_158;
    float _180 = _168 + _178;
    float _182 = -_160;
    float _184 = _170 + _182;
    bool _188 = _164 <= 1.0;
    bool _190 = isnan(_164);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.0);
    bool _196 = _192 || _194;
    float _198 = float(_196);
    float _200 = _176 * _176;
    float _202 = _118 * _168;
    float _204 = _172 * _128;
    float _206 = fma(_180, _180, _200);
    float _208 = _164 * _198;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = -_176;
    float _214 = _156 * _212;
    float _216 = _172 * _176;
    float _218 = fma(_184, _184, _206);
    float _220 = -_166;
    float _222 = -_202;
    float _224 = fma(_172, _220, _222);
    float _226 = -_158;
    float _228 = fma(_226, _180, _214);
    float _230 = -_118;
    float _232 = -_216;
    float _234 = fma(_230, _180, _232);
    float _236 = abs(_210);
    float _238 = log2(_236);
    float _240 = -_156;
    float _242 = _172 * _240;
    float _244 = -_160;
    float _246 = fma(_244, _184, _228);
    float _248 = -_120;
    float _250 = fma(_248, _184, _234);
    float _252 = fma(_118, _134, _204);
    float _254 = -_242;
    float _256 = fma(_118, _158, _254);
    float _258 = -_170;
    float _260 = fma(_120, _258, _224);
    float _262 = rsqrt(_218);
    float _264 = fma(_120, _160, _256);
    float _266 = fma(_120, _140, _252);
    float _268 = precise::min(_264, _260);
    float _270 = -_154;
    float _272 = fma(_270, _266, 0.0);
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _238 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _278 = 1.0 / _246;
    float _280 = _262 * _250;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = exp2(_276);
    float _286 = _282 * _268;
    float _288 = _286 * 2.0;
    float _290 = abs(_282);
    float _292 = log2(_290);
    float _294 = _288 * _278;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = _98 * _292;
    float _300 = _284 * _274;
    float _302 = exp2(_298);
    float _304 = _106 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _306 = _106 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _308 = _110 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _310 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _312 = _304 * _300;
    float _314 = _308 * _300;
    float _316 = _284 * _302;
    float _318 = _296 * _316;
    float _320 = _108 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _322 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _324 = _100 * _318;
    float _326 = _320 * _300;
    float _328 = _306 * _324;
    float _330 = _322 * _324;
    float _332 = _310 * _324;
    out.m_42.x = _312;
    out.m_42.y = _326;
    out.m_42.z = _314;
    out.m_44.x = _328;
    out.m_44.y = _330;
    out.m_44.z = _332;
    return out;
}

