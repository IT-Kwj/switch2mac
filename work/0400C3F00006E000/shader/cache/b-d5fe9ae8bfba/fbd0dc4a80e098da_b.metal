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
    float _49 = in.m_35.x;
    float _51 = in.m_35.y;
    float2 _381 = float2(_49, _51);
    float _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_381, float2(0.0), isnan(_381))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_381, float2(0.0), isnan(_381))).x;
    float2 _392 = float2(_49, _51);
    float4 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_392, float2(0.0), isnan(_392))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_392, float2(0.0), isnan(_392))).xyzw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float _64 = _56.w;
    float _66 = in.m_37.w;
    float _68 = in.m_37.x;
    float _70 = in.m_37.y;
    float _72 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _74 = -_72;
    float _76 = fma(_74, _66, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _78 = -_72;
    float _80 = fma(_78, _68, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _82 = -_72;
    float _84 = fma(_82, _70, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _86 = 1.0 / _76;
    float _88 = fma(_80, _86, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _90 = fma(_84, _86, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _92 = _88 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _94 = _90 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _470 = float2(_64, 0.0);
    float2 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_470, float2(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_470, float2(0.0), isnan(_470))).xy;
    float _100 = _98.x;
    float _102 = _98.y;
    float2 _482 = float2(_92, _94);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_482, float2(0.0), isnan(_482))).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = in.m_39.y;
    float _116 = in.m_39.x;
    float _118 = in.m_39.z;
    float _120 = fma(_62, 2.0, -1.0);
    float _122 = _114 * _114;
    float _124 = -_72;
    float _126 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _128 = fma(_124, _114, _126);
    float _130 = -_72;
    float _132 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _134 = fma(_130, _116, _132);
    float _136 = fma(_116, _116, _122);
    float _138 = _136 + 1.0;
    float _140 = _128 * _128;
    float _142 = -_72;
    float _144 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _146 = fma(_142, _118, _144);
    float _148 = fma(_134, _134, _140);
    float _150 = rsqrt(_138);
    float _152 = -_76;
    float _154 = fma(_152, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _156 = fma(_146, _146, _148);
    bool _160 = _154 <= 1.0;
    bool _162 = isnan(_154);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = float(_168);
    float _172 = rsqrt(_156);
    float _174 = _154 * _170;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _114 * _150;
    float _180 = _116 * _150;
    float _182 = _118 * _150;
    float _184 = abs(_176);
    float _186 = log2(_184);
    float _188 = _128 * _172;
    float _190 = _134 * _172;
    float _192 = _146 * _172;
    float _194 = -_178;
    float _196 = _188 + _194;
    float _198 = -_180;
    float _200 = _190 + _198;
    float _202 = -_182;
    float _204 = _192 + _202;
    float _206 = _196 * _196;
    float _208 = -_196;
    float _210 = _178 * _208;
    float _212 = _186 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _214 = fma(_58, 2.0, -1.0);
    float _216 = fma(_200, _200, _206);
    float _218 = fma(_60, 2.0, -1.0);
    float _220 = exp2(_212);
    float _222 = _214 * _190;
    float _224 = fma(_204, _204, _216);
    float _226 = _218 * _196;
    float _228 = -_180;
    float _230 = fma(_228, _200, _210);
    float _232 = -_178;
    float _234 = _218 * _232;
    float _236 = -_188;
    float _238 = -_222;
    float _240 = fma(_218, _236, _238);
    float _242 = -_214;
    float _244 = -_226;
    float _246 = fma(_242, _200, _244);
    float _248 = rsqrt(_224);
    float _250 = -_182;
    float _252 = fma(_250, _204, _230);
    float _254 = -_234;
    float _256 = fma(_214, _180, _254);
    float _258 = -_120;
    float _260 = fma(_258, _204, _246);
    float _262 = precise::min(_80, _84);
    float _264 = -_192;
    float _266 = fma(_120, _264, _240);
    float _268 = fma(_120, _182, _256);
    float _270 = precise::max(_80, _84);
    float _272 = 1.0 / _252;
    bool _274 = _262 >= 0.0;
    bool _276 = isnan(_262);
    bool _278 = _274 || _276;
    bool _280 = isnan(0.0);
    bool _282 = _278 || _280;
    float _284 = _218 * _128;
    float _286 = precise::min(_268, _266);
    bool _288 = _76 >= _270;
    bool _290 = isnan(_76);
    bool _292 = _288 || _290;
    bool _294 = isnan(_270);
    bool _296 = _292 || _294;
    bool _298 = _296 && _282;
    float _300 = float(_298);
    float _302 = fma(_214, _134, _284);
    float _304 = _248 * _260;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = _300 * _220;
    float _310 = fma(_120, _146, _302);
    float _312 = abs(_306);
    float _314 = log2(_312);
    float _316 = _306 * _286;
    float _318 = _316 * 2.0;
    float _320 = _308 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _322 = -_172;
    float _324 = fma(_322, _310, 0.0);
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _318 * _272;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = _320 * _326;
    float _334 = _100 * _314;
    float _336 = exp2(_334);
    float _338 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _340 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _342 = _112 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _344 = _338 * 0.586610972881317138671875;
    float _346 = fma(_340, 0.298911988735198974609375, _344);
    float _348 = _108 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _350 = fma(_342, 0.114477999508380889892578125, _346);
    float _352 = _110 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _354 = _348 * _332;
    float _356 = _320 * _336;
    float _358 = _352 * _332;
    float _360 = _330 * _356;
    float _362 = _102 * _360;
    float _364 = _112 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _366 = _362 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _368 = _364 * _332;
    float _370 = _350 * _366;
    out.m_42.x = _354;
    out.m_42.y = _358;
    out.m_42.z = _368;
    out.m_42.w = _370;
    return out;
}

