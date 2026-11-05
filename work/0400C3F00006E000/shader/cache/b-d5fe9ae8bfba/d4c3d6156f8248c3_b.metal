#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _642 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_642, float2(0.0), isnan(_642))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _60 = -_52;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _54;
    float _72 = _68 * _56;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _74);
    float _82 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _76);
    float _84 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _82);
    float _90 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _84);
    float _92 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _94 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _94);
    float _102 = 1.0 / _92;
    float _104 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _100);
    float _106 = _104 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _108 = _96 * _102;
    float _110 = _106 * _102;
    float _112 = _98 * _102;
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _118 = fma(_114, _58, _108);
    float _120 = fma(_114, _116, _110);
    float _122 = -_58;
    float _124 = fma(_114, _122, _108);
    float3 _796 = float3(_118, _120, float(0));
    float3 _800 = select(_796, float3(0.0), isnan(_796));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _800.xy, uint(rint(_800.z)), _114);
    float3 _807 = float3(_108, _120, float(0));
    float3 _809 = select(_807, float3(0.0), isnan(_807));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _809.xy, uint(rint(_809.z)), _114);
    float3 _816 = float3(_124, _120, float(0));
    float3 _818 = select(_816, float3(0.0), isnan(_816));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _818.xy, uint(rint(_818.z)), _114);
    float _132 = -_70;
    float _134 = _132 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _136 = -_72;
    float _138 = _136 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _140 = -_70;
    float _142 = _140 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _144 = _70 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _146 = _134 * _134;
    float _148 = _70 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _150 = _142 * _142;
    float _152 = fma(_138, _138, _146);
    float _154 = -_68;
    float _156 = _154 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _158 = _70 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _160 = _70 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _162 = _70 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _164 = fma(_156, _156, _152);
    float _166 = -_72;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _170 = -_68;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _174 = _70 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _176 = _70 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _178 = fma(_168, _168, _150);
    float _180 = sqrt(_164);
    float _182 = _70 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _184 = _70 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _186 = fma(_172, _172, _178);
    float _188 = _70 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _190 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _182);
    float _192 = _70 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _194 = _70 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _196 = _70 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _198 = sqrt(_186);
    float _200 = _70 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _202 = _70 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _204 = _70 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _206 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _148);
    float _208 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _158);
    float _210 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _160);
    bool _214 = _180 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _216 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _162);
    bool _218 = _180 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _220 = _70 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    bool _222 = !_214;
    int _225 = _222 ? 0 : 1;
    float _227 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _174);
    float _229 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _176);
    float _231 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _220);
    float _233 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _184);
    bool _235 = _198 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _237 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _188);
    float _239 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _192);
    float _241 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _194);
    int _243 = 2;
    if (!_214)
    {
        _243 = 1;
    }
    int _245 = _243;
    float _247 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _196);
    bool _249 = _198 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _251 = _70 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    int _253 = _245;
    if (!_218)
    {
        _253 = _225;
    }
    int _255 = _253;
    float _257 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _144);
    float _259 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _251);
    float _261 = float(_255);
    float _263 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _200);
    int _265 = 2;
    if (!_235)
    {
        _265 = 1;
    }
    int _267 = _265;
    float _269 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _202);
    float _271 = precise::min(_261, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _273 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _204);
    bool _275 = !_235;
    int _277 = _275 ? 0 : 1;
    float _279 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _206);
    bool _281 = _271 != 1.0;
    bool _283 = isnan(_271);
    bool _285 = _281 || _283;
    bool _287 = isnan(1.0);
    bool _289 = _285 || _287;
    float _291 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _229);
    int _293 = _267;
    if (!_249)
    {
        _293 = _277;
    }
    int _295 = _293;
    float _297 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _231);
    bool _299 = _271 != 0.0;
    bool _301 = isnan(_271);
    bool _303 = _299 || _301;
    bool _305 = isnan(0.0);
    bool _307 = _303 || _305;
    float _309 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _263);
    float _311 = float(_295);
    float _313 = _297 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _315 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _208);
    float _317 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _273);
    float _319 = precise::min(_311, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _321 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _247);
    float _323 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _210);
    float _325 = _313;
    if (_289)
    {
        float _327 = _279 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _325 = _327;
    }
    float _329 = _325;
    bool _331 = _319 != 1.0;
    bool _333 = isnan(_319);
    bool _335 = _331 || _333;
    bool _337 = isnan(1.0);
    bool _339 = _335 || _337;
    float _341 = _315 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _343 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _233);
    float _345 = _329;
    float _347 = _341;
    if (!_307)
    {
        float _349 = _291 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _345 = _349;
    }
    float _351 = _345;
    float _353 = _309 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _355 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _190);
    float _357 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _216);
    float _359 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _241);
    float _361 = _321 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _363 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _227);
    float _365 = _353;
    float _367 = _361;
    if (_339)
    {
        float _369 = _317 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _365 = _369;
    }
    float _371 = _365;
    float _373 = _371;
    if (_289)
    {
        float _375 = _323 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _347 = _375;
    }
    float _377 = _347;
    float _379 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _237);
    float _381 = _377;
    if (!_307)
    {
        float _383 = _343 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _381 = _383;
    }
    float _385 = _381;
    float _387 = _357 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _389 = _359 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _391 = _387;
    float _393 = _389;
    if (_289)
    {
        float _395 = _363 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _391 = _395;
    }
    float _397 = _391;
    float _399 = _397;
    if (!_307)
    {
        float _401 = _379 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _399 = _401;
    }
    float _403 = _399;
    float _405 = -_116;
    float _407 = fma(_114, _405, _110);
    if (_339)
    {
        float _409 = _355 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _393 = _409;
    }
    float _411 = _393;
    float _413 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _269);
    float _415 = _411;
    if (_339)
    {
        float _417 = _413 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _367 = _417;
    }
    float _419 = _367;
    bool _421 = _319 != 0.0;
    bool _423 = isnan(_319);
    bool _425 = _421 || _423;
    bool _427 = isnan(0.0);
    bool _429 = _425 || _427;
    float _431 = _126 + _128;
    float _433 = _431 + _130;
    float3 _1381 = float3(_118, _110, float(0));
    float3 _1383 = select(_1381, float3(0.0), isnan(_1381));
    float _435 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1383.xy, uint(rint(_1383.z)), _114);
    float3 _1390 = float3(_108, _110, float(0));
    float3 _1392 = select(_1390, float3(0.0), isnan(_1390));
    float _437 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1392.xy, uint(rint(_1392.z)), _114);
    float3 _1399 = float3(_124, _110, float(0));
    float3 _1401 = select(_1399, float3(0.0), isnan(_1399));
    float _439 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1401.xy, uint(rint(_1401.z)), _114);
    float3 _1408 = float3(_118, _407, float(0));
    float3 _1410 = select(_1408, float3(0.0), isnan(_1408));
    float _441 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1410.xy, uint(rint(_1410.z)), _114);
    float3 _1417 = float3(_108, _407, float(0));
    float3 _1419 = select(_1417, float3(0.0), isnan(_1417));
    float _443 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1419.xy, uint(rint(_1419.z)), _114);
    float3 _1426 = float3(_124, _407, float(0));
    float3 _1428 = select(_1426, float3(0.0), isnan(_1426));
    float _445 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1428.xy, uint(rint(_1428.z)), _114);
    float _447 = rint(_271);
    float _449 = precise::max(_447, 0.0);
    uint _452 = uint(_449);
    uint _454 = clamp(_452, 0u, 65535u);
    float _456 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _458 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _257);
    float _460 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _462 = 0.0 + _403;
    float _464 = precise::clamp(_462, 0.0, 1.0);
    float _466 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _259);
    float _468 = _419;
    if (!_429)
    {
        float _470 = _458 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _373 = _470;
    }
    float _472 = _373;
    float _474 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _239);
    float _476 = rint(_319);
    float _478 = precise::max(_476, 0.0);
    uint _480 = uint(_478);
    uint _482 = clamp(_480, 0u, 65535u);
    float _484 = fma(_464, _456, _351);
    if (!_429)
    {
        float _486 = _466 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _468 = _486;
    }
    float _488 = _468;
    if (!_429)
    {
        float _490 = _474 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _415 = _490;
    }
    float _492 = _415;
    float _494 = _433 + _435;
    float _496 = -_456;
    float _498 = fma(_464, _496, _351);
    float _500 = _494 + _437;
    float _502 = _500 + _439;
    float _504 = _502 + _441;
    float _506 = fma(_464, _460, _385);
    float3 _1541 = float3(_351, _506, float(int(_454)));
    float3 _1543 = select(_1541, float3(0.0), isnan(_1541));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1543.xy, uint(rint(_1543.z)), _464);
    float3 _1552 = float3(_484, _506, float(int(_454)));
    float3 _1554 = select(_1552, float3(0.0), isnan(_1552));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1554.xy, uint(rint(_1554.z)), _464);
    float3 _1563 = float3(_498, _506, float(int(_454)));
    float3 _1565 = select(_1563, float3(0.0), isnan(_1563));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1565.xy, uint(rint(_1565.z)), _464);
    float3 _1574 = float3(_484, _385, float(int(_454)));
    float3 _1576 = select(_1574, float3(0.0), isnan(_1574));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1576.xy, uint(rint(_1576.z)), _464);
    float3 _1585 = float3(_351, _385, float(int(_454)));
    float3 _1587 = select(_1585, float3(0.0), isnan(_1585));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1587.xy, uint(rint(_1587.z)), _464);
    float3 _1596 = float3(_498, _385, float(int(_454)));
    float3 _1598 = select(_1596, float3(0.0), isnan(_1596));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1598.xy, uint(rint(_1598.z)), _464);
    float _520 = -_460;
    float _522 = fma(_464, _520, _385);
    float _524 = 0.0 + _472;
    float _526 = precise::clamp(_524, 0.0, 1.0);
    float _528 = fma(_460, _526, _488);
    float _530 = fma(_456, _526, _492);
    float3 _1625 = float3(_484, _522, float(int(_454)));
    float3 _1627 = select(_1625, float3(0.0), isnan(_1625));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1627.xy, uint(rint(_1627.z)), _464);
    float _534 = -_456;
    float _536 = fma(_534, _526, _492);
    float3 _1642 = float3(_351, _522, float(int(_454)));
    float3 _1644 = select(_1642, float3(0.0), isnan(_1642));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1644.xy, uint(rint(_1644.z)), _464);
    float3 _1653 = float3(_498, _522, float(int(_454)));
    float3 _1655 = select(_1653, float3(0.0), isnan(_1653));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1655.xy, uint(rint(_1655.z)), _464);
    float3 _1664 = float3(_492, _528, float(int(_482)));
    float3 _1666 = select(_1664, float3(0.0), isnan(_1664));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1666.xy, uint(rint(_1666.z)), _526);
    float3 _1675 = float3(_530, _528, float(int(_482)));
    float3 _1677 = select(_1675, float3(0.0), isnan(_1675));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1677.xy, uint(rint(_1677.z)), _526);
    float3 _1686 = float3(_536, _528, float(int(_482)));
    float3 _1688 = select(_1686, float3(0.0), isnan(_1686));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1688.xy, uint(rint(_1688.z)), _526);
    float _548 = -_460;
    float _550 = fma(_548, _526, _488);
    float3 _1703 = float3(_530, _488, float(int(_482)));
    float3 _1705 = select(_1703, float3(0.0), isnan(_1703));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1705.xy, uint(rint(_1705.z)), _526);
    float3 _1714 = float3(_492, _488, float(int(_482)));
    float3 _1716 = select(_1714, float3(0.0), isnan(_1714));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1716.xy, uint(rint(_1716.z)), _526);
    float3 _1725 = float3(_536, _488, float(int(_482)));
    float3 _1727 = select(_1725, float3(0.0), isnan(_1725));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1727.xy, uint(rint(_1727.z)), _526);
    float3 _1736 = float3(_530, _550, float(int(_482)));
    float3 _1738 = select(_1736, float3(0.0), isnan(_1736));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1738.xy, uint(rint(_1738.z)), _526);
    float3 _1747 = float3(_492, _550, float(int(_482)));
    float3 _1749 = select(_1747, float3(0.0), isnan(_1747));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1749.xy, uint(rint(_1749.z)), _526);
    float3 _1758 = float3(_536, _550, float(int(_482)));
    float3 _1760 = select(_1758, float3(0.0), isnan(_1758));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1760.xy, uint(rint(_1760.z)), _526);
    float _564 = _504 + _443;
    float _566 = _564 + _445;
    float _568 = -_68;
    float _570 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _572 = _568 + _570;
    float _574 = _572 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _576 = precise::clamp(_574, 0.0, 1.0);
    float _578 = fma(_566, 0.111111111938953399658203125, _576);
    float _580 = _510 + _508;
    float _582 = -_68;
    float _584 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _586 = _582 + _584;
    float _588 = _580 + _512;
    float _590 = _586 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _592 = precise::clamp(_590, 0.0, 1.0);
    float _594 = _588 + _514;
    float _596 = _594 + _516;
    float _598 = _596 + _518;
    float _600 = _598 + _532;
    float _602 = _600 + _538;
    float _604 = _544 + _542;
    float _606 = _602 + _540;
    float _608 = _604 + _546;
    float _610 = _606 * 0.111111111938953399658203125;
    float _612 = _608 + _552;
    float _614 = _612 + _554;
    float _616 = _614 + _556;
    float _618 = _616 + _558;
    float _620 = _618 + _560;
    float _622 = _620 + _562;
    float _624 = _622 * 0.111111111938953399658203125;
    float _626 = _624 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _628 = fma(_610, (*spvDescriptorSet0.fp_c3)._m0[49].z, _626);
    float _630 = _592 + _628;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _578;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _630;
    return out;
}

