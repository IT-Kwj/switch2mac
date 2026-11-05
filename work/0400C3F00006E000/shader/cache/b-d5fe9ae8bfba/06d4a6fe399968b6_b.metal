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
    texture3d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
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
    float _112 = _110 + 2.0;
    float _114 = _96 * _106;
    float _116 = _100 * _108;
    float _118 = -_104;
    float _120 = _118 + 1.0;
    float _122 = _112 * _112;
    float _124 = -_114;
    float _126 = _124 + 6.0;
    float _128 = fma(_114, -4.0, _116);
    float _130 = _120 * _120;
    float _132 = _112 * _122;
    float _134 = -_92;
    float _136 = _134 + 3.0;
    float _138 = _114 + _128;
    float _140 = _120 * _130;
    float _142 = _116 * 4.0;
    float _144 = _136 * _136;
    float _146 = _138 * 0.16666667163372039794921875;
    float _148 = -_104;
    float _150 = _148 + 3.0;
    float _152 = fma(_140, -4.0, _132);
    float _154 = _132 * 4.0;
    float _156 = -_142;
    float _158 = fma(_136, _144, _156);
    float _160 = -_128;
    float _162 = _160 + _126;
    float _164 = 1.0 / _146;
    float _166 = _150 * _150;
    float _168 = _162 * 0.16666667163372039794921875;
    float _170 = fma(_114, 6.0, _158);
    float _172 = -_140;
    float _174 = _172 + 6.0;
    float _176 = -_154;
    float _178 = fma(_150, _166, _176);
    float _180 = fma(_70, -2.0, 1.0);
    float _182 = fma(_68, 2.0, -1.0);
    float _184 = 1.0 / _168;
    float _186 = -_170;
    float _188 = _186 + _162;
    float _190 = _180 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _192 = _180 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _194 = _86 + (-0.5);
    float _196 = _86 + 1.5;
    float _198 = fma(_140, 6.0, _178);
    float _200 = _128 * 0.16666667163372039794921875;
    float _202 = _140 + _152;
    float _204 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[2].x, _190);
    float _206 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[3].x, _192);
    float _208 = fma(_200, _164, _194);
    float _210 = _202 * 0.16666667163372039794921875;
    float _212 = _188 * 0.16666667163372039794921875;
    float _214 = -_152;
    float _216 = _214 + _174;
    float _218 = _88 + 1.5;
    float _220 = 1.0 / _210;
    float _222 = fma(_212, _184, _196);
    float _224 = _88 + (-0.5);
    float _226 = _152 * 0.16666667163372039794921875;
    float _228 = _216 * 0.16666667163372039794921875;
    float _230 = -_198;
    float _232 = _230 + _216;
    float _234 = _232 * 0.16666667163372039794921875;
    float _236 = 1.0 / _228;
    float _238 = fma(_226, _220, _224);
    float _240 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _242 = fma(_234, _236, _218);
    float _244 = _208 * _240;
    float _246 = _222 * _240;
    float _248 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _250 = _242 * _248;
    float _252 = fma(_72, 2.0, -1.0);
    float _254 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[3].z, _206);
    float _256 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[2].z, _204);
    float _258 = _254 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _262 = (*spvDescriptorSet0.fp_c4)._m0[1].z + (-1.0);
    float _264 = 1.0 / _258;
    float _266 = _260 * _264;
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _270 = -_268;
    float _272 = fma(_270, _262, 1.0);
    float _274 = _238 * _248;
    float _276 = log2(_272);
    float _278 = fma(_78, 2.0, -1.0);
    float _280 = fma(_80, 2.0, -1.0);
    float _282 = fma(_278, (*spvDescriptorSet0.fp_c4)._m0[0].x, _68);
    float _284 = fma(_280, (*spvDescriptorSet0.fp_c4)._m0[0].y, _70);
    float _286 = _276 * 0.693147182464599609375;
    float _288 = _286 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float3 _803 = float3(_244, _274, _288);
    float4 _291 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_803, float3(0.0), isnan(_803))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_803, float3(0.0), isnan(_803))).xyzw;
    float _293 = _291.x;
    float _295 = _291.y;
    float _297 = _291.z;
    float _299 = _291.w;
    float3 _822 = float3(_246, _274, _288);
    float4 _301 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_822, float3(0.0), isnan(_822))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_822, float3(0.0), isnan(_822))).xyzw;
    float _303 = _301.x;
    float _305 = _301.y;
    float _307 = _301.z;
    float _309 = _301.w;
    float3 _839 = float3(_244, _250, _288);
    float4 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_839, float3(0.0), isnan(_839))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_839, float3(0.0), isnan(_839))).xyzw;
    float _313 = _311.x;
    float _315 = _311.y;
    float _317 = _311.z;
    float _319 = _311.w;
    float3 _856 = float3(_246, _250, _288);
    float4 _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_856, float3(0.0), isnan(_856))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_856, float3(0.0), isnan(_856))).xyzw;
    float _323 = _321.x;
    float _325 = _321.y;
    float _327 = _321.z;
    float _329 = _321.w;
    float2 _872 = float2(_282, _284);
    float4 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_872, float2(0.0), isnan(_872))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_872, float2(0.0), isnan(_872))).xyzw;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float _339 = _331.w;
    float2 _888 = float2(_68, _70);
    float3 _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_888, float2(0.0), isnan(_888))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_888, float2(0.0), isnan(_888))).xyz;
    float _345 = _343.x;
    float _347 = _343.y;
    float _349 = _343.z;
    float _351 = -_303;
    float _353 = _293 + _351;
    float _355 = -_305;
    float _357 = _295 + _355;
    float _359 = -_307;
    float _361 = _297 + _359;
    float _363 = -_309;
    float _365 = _299 + _363;
    float _367 = fma(_146, _353, _303);
    float _369 = -_325;
    float _371 = _315 + _369;
    float _373 = fma(_146, _361, _307);
    float _375 = -_323;
    float _377 = _313 + _375;
    float _379 = -_327;
    float _381 = _317 + _379;
    float _383 = fma(_146, _371, _325);
    float _385 = -_329;
    float _387 = _319 + _385;
    float _389 = fma(_146, _377, _323);
    float _391 = fma(_146, _357, _305);
    float _393 = fma(_146, _365, _309);
    float _395 = fma(_146, _381, _327);
    float _397 = fma(_146, _387, _329);
    float _399 = -_389;
    float _401 = _399 + _367;
    float _403 = -_383;
    float _405 = _403 + _391;
    float _407 = -_395;
    float _409 = _407 + _373;
    float _411 = -_397;
    float _413 = _411 + _393;
    float _415 = fma(_210, _401, _389);
    float _417 = fma(_210, _405, _383);
    float _419 = _339 + (-1.0);
    float _421 = fma(_210, _409, _395);
    float _423 = fma(_210, _413, _397);
    float _425 = _345 + _415;
    float _427 = _347 + _417;
    float _429 = fma(_419, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _431 = _333 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _433 = _335 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _435 = _349 + _421;
    float _437 = _337 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _439 = fma(_429, _425, _431);
    float _441 = fma(_429, _427, _433);
    float _443 = _429 * _423;
    float _445 = fma(_429, _435, _437);
    out.m_45.x = _439;
    out.m_45.y = _441;
    out.m_45.z = _445;
    out.m_45.w = _443;
    return out;
}

