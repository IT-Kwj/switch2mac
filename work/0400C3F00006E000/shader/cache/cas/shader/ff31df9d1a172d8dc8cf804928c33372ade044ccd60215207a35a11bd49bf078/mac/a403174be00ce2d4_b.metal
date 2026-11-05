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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _52 = gl_FragCoord.w;
    float _54 = in.m_42.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_42.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _52;
    float _68 = _66 * _58;
    float _70 = _66 * _64;
    float2 _478 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_478, float2(0.0), isnan(_478))).x;
    float2 _490 = float2(_68, _70);
    float2 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_490, float2(0.0), isnan(_490))).xy;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c4)._m0[1].x, -0.5);
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c4)._m0[1].y, -0.5);
    float _86 = floor(_82);
    float _88 = floor(_84);
    float _90 = -_86;
    float _92 = _82 + _90;
    float _94 = -_92;
    float _96 = _94 + 1.0;
    float _98 = -_92;
    float _100 = _98 + 2.0;
    float _102 = -_88;
    float _104 = _84 + _102;
    float _106 = _96 * _96;
    float _108 = _100 * _100;
    float _110 = -_104;
    float _112 = _110 + 1.0;
    float _114 = -_104;
    float _116 = _114 + 2.0;
    float _118 = _96 * _106;
    float _120 = _100 * _108;
    float _122 = _112 * _112;
    float _124 = _116 * _116;
    float _126 = -_104;
    float _128 = _126 + 3.0;
    float _130 = _120 * 4.0;
    float _132 = _112 * _122;
    float _134 = -_92;
    float _136 = _134 + 3.0;
    float _138 = _116 * _124;
    float _140 = fma(_118, -4.0, _120);
    float _142 = _136 * _136;
    float _144 = _128 * _128;
    float _146 = fma(_132, -4.0, _138);
    float _148 = _138 * 4.0;
    float _150 = -_130;
    float _152 = fma(_136, _142, _150);
    float _154 = fma(_70, -2.0, 1.0);
    float _156 = -_118;
    float _158 = _156 + 6.0;
    float _160 = -_148;
    float _162 = fma(_128, _144, _160);
    float _164 = _118 + _140;
    float _166 = fma(_118, 6.0, _152);
    float _168 = _154 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _170 = fma(_68, 2.0, -1.0);
    float _172 = _154 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _174 = -_140;
    float _176 = _174 + _158;
    float _178 = _86 + 1.5;
    float _180 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[2].x, _168);
    float _182 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[3].x, _172);
    float _184 = _86 + (-0.5);
    float _186 = _176 * 0.16666667163372039794921875;
    float _188 = -_166;
    float _190 = _188 + _176;
    float _192 = _140 * 0.16666667163372039794921875;
    float _194 = -_132;
    float _196 = _194 + 6.0;
    float _198 = fma(_132, 6.0, _162);
    float _200 = _132 + _146;
    float _202 = 1.0 / _186;
    float _204 = _190 * 0.16666667163372039794921875;
    float _206 = _88 + 1.5;
    float _208 = _200 * 0.16666667163372039794921875;
    float _210 = -_146;
    float _212 = _210 + _196;
    float _214 = _164 * 0.16666667163372039794921875;
    float _216 = _146 * 0.16666667163372039794921875;
    float _218 = _212 * 0.16666667163372039794921875;
    float _220 = 1.0 / _214;
    float _222 = -_198;
    float _224 = _222 + _212;
    float _226 = _224 * 0.16666667163372039794921875;
    float _228 = fma(_204, _202, _178);
    float _230 = 1.0 / _218;
    float _232 = 1.0 / _208;
    float _234 = fma(_192, _220, _184);
    float _236 = fma(_226, _230, _206);
    float _238 = fma(_72, 2.0, -1.0);
    float _240 = _88 + (-0.5);
    float _242 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[3].z, _182);
    float _244 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[2].z, _180);
    float _246 = fma(_216, _232, _240);
    float _248 = (*spvDescriptorSet0.fp_c4)._m0[1].z + (-1.0);
    float _250 = _242 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _252 = _244 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _254 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _256 = 1.0 / _250;
    float _258 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _260 = _252 * _256;
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _264 = -_262;
    float _266 = fma(_264, _248, 1.0);
    float _268 = _246 * _254;
    float _270 = _234 * _258;
    float _272 = fma(_78, 2.0, -1.0);
    float _274 = fma(_80, 2.0, -1.0);
    float _276 = _228 * _258;
    float _278 = log2(_266);
    float _280 = _236 * _254;
    float _282 = fma(_272, (*spvDescriptorSet0.fp_c4)._m0[0].x, _68);
    float _284 = fma(_274, (*spvDescriptorSet0.fp_c4)._m0[0].y, _70);
    float _286 = _278 * 0.693147182464599609375;
    float _288 = _286 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float2 _802 = float2(_68, _70);
    float4 _291 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_802, float2(0.0), isnan(_802))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_802, float2(0.0), isnan(_802))).xyzw;
    float _293 = _291.x;
    float _295 = _291.y;
    float _297 = _291.z;
    float _299 = _291.w;
    float3 _819 = float3(_270, _268, _288);
    float4 _301 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_819, float3(0.0), isnan(_819))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_819, float3(0.0), isnan(_819))).xyzw;
    float _303 = _301.x;
    float _305 = _301.y;
    float _307 = _301.z;
    float _309 = _301.w;
    float3 _838 = float3(_276, _268, _288);
    float4 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_838, float3(0.0), isnan(_838))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_838, float3(0.0), isnan(_838))).xyzw;
    float _313 = _311.x;
    float _315 = _311.y;
    float _317 = _311.z;
    float _319 = _311.w;
    float3 _855 = float3(_270, _280, _288);
    float4 _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_855, float3(0.0), isnan(_855))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_855, float3(0.0), isnan(_855))).xyzw;
    float _323 = _321.x;
    float _325 = _321.y;
    float _327 = _321.z;
    float _329 = _321.w;
    float3 _872 = float3(_276, _280, _288);
    float4 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_872, float3(0.0), isnan(_872))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_872, float3(0.0), isnan(_872))).xyzw;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float _339 = _331.w;
    float2 _888 = float2(_282, _284);
    float3 _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_888, float2(0.0), isnan(_888))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_888, float2(0.0), isnan(_888))).xyz;
    float _345 = _343.x;
    float _347 = _343.y;
    float _349 = _343.z;
    float _351 = _299 + (-1.0);
    float _353 = -_313;
    float _355 = _303 + _353;
    float _357 = -_315;
    float _359 = _305 + _357;
    float _361 = -_333;
    float _363 = _323 + _361;
    float _365 = -_319;
    float _367 = _309 + _365;
    float _369 = -_335;
    float _371 = _325 + _369;
    float _373 = -_317;
    float _375 = _307 + _373;
    float _377 = -_337;
    float _379 = _327 + _377;
    float _381 = fma(_214, _355, _313);
    float _383 = fma(_214, _363, _333);
    float _385 = fma(_214, _359, _315);
    float _387 = fma(_214, _367, _319);
    float _389 = fma(_214, _371, _335);
    float _391 = -_339;
    float _393 = _329 + _391;
    float _395 = fma(_214, _375, _317);
    float _397 = fma(_214, _379, _337);
    float _399 = -_383;
    float _401 = _399 + _381;
    float _403 = -_389;
    float _405 = _403 + _385;
    float _407 = fma(_214, _393, _339);
    float _409 = -_397;
    float _411 = _409 + _395;
    float _413 = fma(_208, _401, _383);
    float _415 = fma(_208, _405, _389);
    float _417 = -_407;
    float _419 = _417 + _387;
    float _421 = fma(_208, _411, _397);
    float _423 = fma(_351, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _425 = _345 + _413;
    float _427 = _293 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _429 = _347 + _415;
    float _431 = _295 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _433 = fma(_208, _419, _407);
    float _435 = _349 + _421;
    float _437 = _297 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _439 = fma(_423, _425, _427);
    float _441 = fma(_423, _429, _431);
    float _443 = _423 * _433;
    float _445 = fma(_423, _435, _437);
    out.m_45.x = _439;
    out.m_45.y = _441;
    out.m_45.z = _445;
    out.m_45.w = _443;
    return out;
}

