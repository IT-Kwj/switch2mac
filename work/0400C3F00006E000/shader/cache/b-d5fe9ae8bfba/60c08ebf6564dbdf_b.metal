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
    float _96 = _94 + 2.0;
    float _98 = -_92;
    float _100 = _98 + 1.0;
    float _102 = -_88;
    float _104 = _84 + _102;
    float _106 = _96 * _96;
    float _108 = _100 * _100;
    float _110 = -_104;
    float _112 = _110 + 2.0;
    float _114 = _96 * _106;
    float _116 = -_104;
    float _118 = _116 + 1.0;
    float _120 = _100 * _108;
    float _122 = _112 * _112;
    float _124 = -_104;
    float _126 = _124 + 3.0;
    float _128 = _118 * _118;
    float _130 = fma(_120, -4.0, _114);
    float _132 = _112 * _122;
    float _134 = -_92;
    float _136 = _134 + 3.0;
    float _138 = _118 * _128;
    float _140 = _114 * 4.0;
    float _142 = _136 * _136;
    float _144 = _120 + _130;
    float _146 = _126 * _126;
    float _148 = _132 * 4.0;
    float _150 = -_140;
    float _152 = fma(_136, _142, _150);
    float _154 = _144 * 0.16666667163372039794921875;
    float _156 = fma(_70, -2.0, 1.0);
    float _158 = fma(_138, -4.0, _132);
    float _160 = -_148;
    float _162 = fma(_126, _146, _160);
    float _164 = -_120;
    float _166 = _164 + 6.0;
    float _168 = fma(_120, 6.0, _152);
    float _170 = 1.0 / _154;
    float _172 = _156 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _174 = fma(_68, 2.0, -1.0);
    float _176 = _156 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _178 = -_130;
    float _180 = _178 + _166;
    float _182 = _86 + 1.5;
    float _184 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[2].x, _172);
    float _186 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[3].x, _176);
    float _188 = _180 * 0.16666667163372039794921875;
    float _190 = -_168;
    float _192 = _190 + _180;
    float _194 = _86 + (-0.5);
    float _196 = _130 * 0.16666667163372039794921875;
    float _198 = _138 + _158;
    float _200 = -_138;
    float _202 = _200 + 6.0;
    float _204 = fma(_138, 6.0, _162);
    float _206 = 1.0 / _188;
    float _208 = fma(_196, _170, _194);
    float _210 = _198 * 0.16666667163372039794921875;
    float _212 = -_158;
    float _214 = _212 + _202;
    float _216 = _88 + 1.5;
    float _218 = _88 + (-0.5);
    float _220 = _158 * 0.16666667163372039794921875;
    float _222 = _214 * 0.16666667163372039794921875;
    float _224 = 1.0 / _210;
    float _226 = _192 * 0.16666667163372039794921875;
    float _228 = -_204;
    float _230 = _228 + _214;
    float _232 = _230 * 0.16666667163372039794921875;
    float _234 = fma(_226, _206, _182);
    float _236 = 1.0 / _222;
    float _238 = fma(_220, _224, _218);
    float _240 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _242 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _244 = fma(_232, _236, _216);
    float _246 = _208 * _242;
    float _248 = _234 * _242;
    float _250 = _238 * _240;
    float _252 = fma(_72, 2.0, -1.0);
    float _254 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[3].z, _186);
    float _256 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[2].z, _184);
    float _258 = _254 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _262 = (*spvDescriptorSet0.fp_c4)._m0[1].z + (-1.0);
    float _264 = 1.0 / _258;
    float _266 = _260 * _264;
    float _268 = fma(_78, 2.0, -1.0);
    float _270 = fma(_80, 2.0, -1.0);
    float _272 = _266 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _274 = fma(_268, (*spvDescriptorSet0.fp_c4)._m0[0].x, _68);
    float _276 = fma(_270, (*spvDescriptorSet0.fp_c4)._m0[0].y, _70);
    float _278 = -_272;
    float _280 = fma(_278, _262, 1.0);
    float _282 = _244 * _240;
    float _284 = log2(_280);
    float _286 = _284 * 0.693147182464599609375;
    float _288 = _286 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float3 _803 = float3(_246, _250, _288);
    float4 _291 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_803, float3(0.0), isnan(_803))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_803, float3(0.0), isnan(_803))).xyzw;
    float _293 = _291.x;
    float _295 = _291.y;
    float _297 = _291.z;
    float _299 = _291.w;
    float3 _822 = float3(_248, _250, _288);
    float4 _301 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_822, float3(0.0), isnan(_822))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_822, float3(0.0), isnan(_822))).xyzw;
    float _303 = _301.x;
    float _305 = _301.y;
    float _307 = _301.z;
    float _309 = _301.w;
    float3 _839 = float3(_246, _282, _288);
    float4 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_839, float3(0.0), isnan(_839))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_839, float3(0.0), isnan(_839))).xyzw;
    float _313 = _311.x;
    float _315 = _311.y;
    float _317 = _311.z;
    float _319 = _311.w;
    float3 _856 = float3(_248, _282, _288);
    float4 _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_856, float3(0.0), isnan(_856))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_856, float3(0.0), isnan(_856))).xyzw;
    float _323 = _321.x;
    float _325 = _321.y;
    float _327 = _321.z;
    float _329 = _321.w;
    float2 _872 = float2(_274, _276);
    float4 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_872, float2(0.0), isnan(_872))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_872, float2(0.0), isnan(_872))).xyzw;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float _339 = _331.w;
    float2 _888 = float2(_274, _276);
    float3 _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_888, float2(0.0), isnan(_888))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_888, float2(0.0), isnan(_888))).xyz;
    float _345 = _343.x;
    float _347 = _343.y;
    float _349 = _343.z;
    float _351 = -_303;
    float _353 = _293 + _351;
    float _355 = -_305;
    float _357 = _295 + _355;
    float _359 = fma(_154, _353, _303);
    float _361 = -_309;
    float _363 = _299 + _361;
    float _365 = -_307;
    float _367 = _297 + _365;
    float _369 = -_323;
    float _371 = _313 + _369;
    float _373 = -_325;
    float _375 = _315 + _373;
    float _377 = -_327;
    float _379 = _317 + _377;
    float _381 = fma(_154, _367, _307);
    float _383 = fma(_154, _371, _323);
    float _385 = fma(_154, _357, _305);
    float _387 = -_329;
    float _389 = _319 + _387;
    float _391 = fma(_154, _375, _325);
    float _393 = fma(_154, _379, _327);
    float _395 = -_383;
    float _397 = _395 + _359;
    float _399 = fma(_154, _363, _309);
    float _401 = fma(_154, _389, _329);
    float _403 = -_391;
    float _405 = _403 + _385;
    float _407 = -_393;
    float _409 = _407 + _381;
    float _411 = _339 + (-1.0);
    float _413 = fma(_210, _397, _383);
    float _415 = fma(_210, _405, _391);
    float _417 = -_401;
    float _419 = _417 + _399;
    float _421 = fma(_210, _409, _393);
    float _423 = fma(_411, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _425 = _345 + _413;
    float _427 = _347 + _415;
    float _429 = _333 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _431 = fma(_210, _419, _401);
    float _433 = _335 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _435 = _349 + _421;
    float _437 = _337 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _439 = fma(_423, _425, _429);
    float _441 = fma(_423, _427, _433);
    float _443 = _423 * _431;
    float _445 = fma(_423, _435, _437);
    out.m_45.x = _439;
    out.m_45.y = _441;
    out.m_45.z = _445;
    out.m_45.w = _443;
    return out;
}

