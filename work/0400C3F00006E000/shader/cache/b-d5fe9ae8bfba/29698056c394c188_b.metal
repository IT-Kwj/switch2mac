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
    float2 _582 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_582, float2(0.0), isnan(_582))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_582, float2(0.0), isnan(_582))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = -_64;
    float _70 = _68 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _72 = -_66;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _76 = -_64;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _80 = -_66;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _84 = _70 * _70;
    float _86 = -_62;
    float _88 = _86 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _90 = _78 * _78;
    float _92 = -_62;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _96 = fma(_74, _74, _84);
    float _98 = _64 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _100 = fma(_82, _82, _90);
    float _102 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _104 = fma(_88, _88, _96);
    float _106 = fma(_94, _94, _100);
    float _108 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _110 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _112 = _64 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _114 = sqrt(_104);
    float _116 = _64 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _118 = _64 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _120 = _64 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _122 = _64 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _124 = _64 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _126 = _64 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _128 = _64 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _130 = sqrt(_106);
    float _132 = _64 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _134 = _64 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _136 = _64 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _138 = _64 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _140 = _64 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _142 = _64 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _144 = _64 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _148 = _114 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _102);
    bool _152 = _114 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _154 = _64 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _156 = !_148;
    int _159 = _156 ? 0 : 1;
    float _161 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _108);
    float _163 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _110);
    float _165 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _112);
    bool _167 = _130 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _169 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _116);
    float _171 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _118);
    float _173 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _120);
    bool _175 = !_167;
    int _177 = _175 ? 0 : 1;
    float _179 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _122);
    int _181 = 2;
    if (!_148)
    {
        _181 = 1;
    }
    int _183 = _181;
    float _185 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _124);
    bool _187 = _130 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _189 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    int _191 = _183;
    if (!_152)
    {
        _191 = _159;
    }
    int _193 = _191;
    float _195 = _64 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _197 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _189);
    float _199 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _154);
    float _201 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _98);
    float _203 = float(_193);
    float _205 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _197);
    int _207 = 2;
    if (!_167)
    {
        _207 = 1;
    }
    int _209 = _207;
    float _211 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _126);
    float _213 = precise::min(_203, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _215 = _205 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    int _217 = _209;
    if (!_187)
    {
        _217 = _177;
    }
    int _219 = _217;
    float _221 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _128);
    bool _223 = _213 != 1.0;
    bool _225 = isnan(_213);
    bool _227 = _223 || _225;
    bool _229 = isnan(1.0);
    bool _231 = _227 || _229;
    float _233 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _132);
    float _235 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _134);
    float _237 = 1.0 / _215;
    float _239 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _136);
    float _241 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _138);
    float _243 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _140);
    float _245 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _142);
    float _247 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _144);
    float _249 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _195);
    float _251 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _150);
    float _253 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _161);
    float _255 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _163);
    float _257 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[19].z, _165);
    float _259 = float(_219);
    float _261 = _251 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _263 = _253 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _265 = _255 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _267 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[20].z, _171);
    float _269 = _257 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _271 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[21].z, _179);
    float _273 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[22].z, _169);
    float _275 = precise::min(_259, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _277 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[23].z, _173);
    float _279 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[24].z, _185);
    float _281 = _261 * _237;
    float _283 = _263 * _237;
    float _285 = _265 * _237;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = _267 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _291 = _271 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _293 = _269;
    float _295 = _289;
    float _297 = _291;
    if (_231)
    {
        float _299 = _273 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _293 = _299;
    }
    float _301 = _293;
    float _303 = _301;
    if (_231)
    {
        float _305 = _277 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _295 = _305;
    }
    float _307 = _295;
    float _309 = _307;
    if (_231)
    {
        float _311 = _279 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _297 = _311;
    }
    float _313 = _297;
    bool _315 = _213 != 0.0;
    bool _317 = isnan(_213);
    bool _319 = _315 || _317;
    bool _321 = isnan(0.0);
    bool _323 = _319 || _321;
    float _325 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[30].z, _243);
    bool _327 = _275 != 1.0;
    bool _329 = isnan(_275);
    bool _331 = _327 || _329;
    bool _333 = isnan(1.0);
    bool _335 = _331 || _333;
    float _337 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[17].z, _201);
    bool _339 = _275 != 0.0;
    bool _341 = isnan(_275);
    bool _343 = _339 || _341;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    float _349 = rint(_287);
    float _351 = precise::max(_349, 0.0);
    uint _354 = uint(_351);
    uint _356 = clamp(_354, 0u, 65535u);
    float _358 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[33].z, _249);
    float _360 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[18].z, _211);
    float _362 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[32].z, _247);
    float _364 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[27].z, _235);
    float _366 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[29].z, _241);
    float _368 = _325 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _370 = rint(_213);
    float _372 = precise::max(_370, 0.0);
    uint _374 = uint(_372);
    uint _376 = clamp(_374, 0u, 65535u);
    float _378 = _368;
    float _380 = _313;
    if (!_323)
    {
        float _382 = _337 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _309 = _382;
    }
    float _384 = _309;
    float _386 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[16].z, _199);
    if (_335)
    {
        float _388 = _358 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _378 = _388;
    }
    float _390 = _378;
    float _392 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _394 = _390;
    if (!_323)
    {
        float _396 = _360 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _380 = _396;
    }
    float _398 = _380;
    float _400 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    if (!_347)
    {
        float _402 = _364 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _394 = _402;
    }
    float _404 = _394;
    float _406 = rint(_275);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    uint _412 = clamp(_410, 0u, 65535u);
    float _414 = _366 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _416 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[28].z, _239);
    float _418 = _414;
    if (_335)
    {
        float _420 = _362 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _418 = _420;
    }
    float _422 = _418;
    float _424 = _422;
    if (!_323)
    {
        float _426 = _386 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _303 = _426;
    }
    float _428 = _303;
    float _430 = fma(_392, 0.5, _283);
    float _432 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[31].z, _245);
    float _434 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _436 = fma(_400, 0.5, _281);
    float _438 = 0.0 + _398;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = fma(_392, -0.5, _283);
    float _444 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[25].z, _221);
    float _446 = fma(_400, -0.5, _281);
    float _448 = 0.0 + _404;
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _454 = _416 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _456 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[26].z, _233);
    float _458 = _454;
    if (_335)
    {
        float _460 = _432 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _458 = _460;
    }
    float _462 = _458;
    float _464 = _440 * _434;
    float _466 = _462;
    if (!_347)
    {
        float _468 = _444 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _466 = _468;
    }
    float _470 = _466;
    float _472 = _434 * _450;
    float _474 = _440 * _452;
    if (!_347)
    {
        float _476 = _456 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _424 = _476;
    }
    float _478 = _424;
    float _480 = _452 * _450;
    float _482 = fma(_464, 0.5, _428);
    float _484 = fma(_472, 0.5, _470);
    float _486 = fma(_464, -0.5, _428);
    float _488 = fma(_474, 0.5, _384);
    float _490 = fma(_472, -0.5, _470);
    float3 _1395 = float3(_446, _430, float(int(_356)));
    float3 _1399 = select(_1395, float3(0.0), isnan(_1395));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1399.xy, uint(rint(_1399.z)), 1.0);
    float3 _1407 = float3(_436, _430, float(int(_356)));
    float3 _1409 = select(_1407, float3(0.0), isnan(_1407));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1409.xy, uint(rint(_1409.z)), 1.0);
    float3 _1417 = float3(_436, _442, float(int(_356)));
    float3 _1419 = select(_1417, float3(0.0), isnan(_1417));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1419.xy, uint(rint(_1419.z)), 1.0);
    float3 _1427 = float3(_446, _442, float(int(_356)));
    float3 _1429 = select(_1427, float3(0.0), isnan(_1427));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1429.xy, uint(rint(_1429.z)), 1.0);
    float3 _1437 = float3(_486, _488, float(int(_376)));
    float3 _1439 = select(_1437, float3(0.0), isnan(_1437));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1439.xy, uint(rint(_1439.z)), _440);
    float _502 = fma(_480, 0.5, _478);
    float _504 = fma(_474, -0.5, _384);
    float _506 = fma(_480, -0.5, _478);
    float3 _1457 = float3(_482, _488, float(int(_376)));
    float3 _1459 = select(_1457, float3(0.0), isnan(_1457));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1459.xy, uint(rint(_1459.z)), _440);
    float3 _1468 = float3(_490, _502, float(int(_412)));
    float3 _1470 = select(_1468, float3(0.0), isnan(_1468));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1470.xy, uint(rint(_1470.z)), _450);
    float3 _1479 = float3(_484, _502, float(int(_412)));
    float3 _1481 = select(_1479, float3(0.0), isnan(_1479));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1481.xy, uint(rint(_1481.z)), _450);
    float3 _1490 = float3(_482, _504, float(int(_376)));
    float3 _1492 = select(_1490, float3(0.0), isnan(_1490));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1492.xy, uint(rint(_1492.z)), _440);
    float3 _1501 = float3(_484, _506, float(int(_412)));
    float3 _1503 = select(_1501, float3(0.0), isnan(_1501));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1503.xy, uint(rint(_1503.z)), _450);
    float3 _1512 = float3(_486, _504, float(int(_376)));
    float3 _1514 = select(_1512, float3(0.0), isnan(_1512));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1514.xy, uint(rint(_1514.z)), _440);
    float3 _1523 = float3(_490, _506, float(int(_412)));
    float3 _1525 = select(_1523, float3(0.0), isnan(_1523));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1525.xy, uint(rint(_1525.z)), _450);
    float _522 = -_62;
    float _524 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _526 = _522 + _524;
    float _528 = -_62;
    float _530 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _532 = _528 + _530;
    float _534 = _526 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = _532 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _540 = precise::clamp(_538, 0.0, 1.0);
    float _542 = _494 + _492;
    float _544 = _542 + _496;
    float _546 = _544 + _498;
    float _548 = fma(_546, 0.25, _536);
    float _550 = _508 + _500;
    float _552 = _512 + _510;
    float _554 = _550 + _514;
    float _556 = _552 + _516;
    float _558 = _554 + _518;
    float _560 = _556 + _520;
    float _562 = _558 * 0.25;
    float _564 = _560 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _566 = _564 * 0.25;
    float _568 = fma(_562, (*spvDescriptorSet0.fp_c3)._m0[49].z, _566);
    float _570 = _540 + _568;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _548;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _570;
    return out;
}

