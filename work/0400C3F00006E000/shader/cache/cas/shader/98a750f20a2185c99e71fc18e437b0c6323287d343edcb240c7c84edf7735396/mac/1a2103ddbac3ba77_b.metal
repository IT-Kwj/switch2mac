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
    float2 _576 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_576, float2(0.0), isnan(_576))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = -_64;
    float _72 = _70 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _74 = -_66;
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _78 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _82 = _72 * _72;
    float _84 = -_64;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _90 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _92 = fma(_76, _76, _82);
    float _94 = -_62;
    float _96 = _94 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _98 = _86 * _86;
    float _100 = _90 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _102 = -_66;
    float _104 = _102 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _106 = fma(_96, _96, _92);
    float _108 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _110 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _112 = fma(_104, _104, _98);
    float _114 = 1.0 / _100;
    float _116 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _118 = -_62;
    float _120 = _118 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _122 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _108);
    float _124 = _110 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _116);
    float _128 = fma(_120, _120, _112);
    float _130 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _122);
    float _132 = sqrt(_106);
    float _134 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
    float _136 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _138 = sqrt(_128);
    float _140 = _130 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _142 = _124 * _114;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _136 * _114;
    float _148 = _140 * _114;
    float _150 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _144;
    bool _154 = _132 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _156 = _132 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _158 = _150 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _160 = _150 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    bool _162 = !_154;
    int _165 = _162 ? 0 : 1;
    float _167 = fma(_158, 0.5, _148);
    float _169 = fma(_160, 0.5, _146);
    float3 _799 = float3(_167, _169, float(0));
    float3 _803 = select(_799, float3(0.0), isnan(_799));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _803.xy, uint(rint(_803.z)), _144);
    int _173 = 2;
    if (!_154)
    {
        _173 = 1;
    }
    int _175 = _173;
    float _177 = _64 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    int _179 = _175;
    if (!_156)
    {
        _179 = _165;
    }
    int _181 = _179;
    float _183 = _64 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _185 = _138 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _187 = _64 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    bool _189 = _138 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _191 = _64 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _193 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _177);
    float _195 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _183);
    bool _197 = !_185;
    int _199 = _197 ? 0 : 1;
    float _201 = _64 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _203 = float(_181);
    float _205 = _64 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _207 = _64 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _209 = precise::min(_203, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _211 = _64 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    int _213 = 2;
    if (!_185)
    {
        _213 = 1;
    }
    int _215 = _213;
    float _217 = _64 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    int _219 = _215;
    if (!_189)
    {
        _219 = _199;
    }
    int _221 = _219;
    float _223 = _64 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _225 = _209 != 1.0;
    bool _227 = isnan(_209);
    bool _229 = _225 || _227;
    bool _231 = isnan(1.0);
    bool _233 = _229 || _231;
    float _235 = _64 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _237 = _64 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _239 = _64 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _241 = _64 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _243 = _64 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _245 = _64 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _247 = _64 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _249 = _64 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _251 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _187);
    float _253 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _191);
    float _255 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _201);
    float _257 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _205);
    float _259 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _207);
    float _261 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _211);
    float _263 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _247);
    float _265 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _217);
    float _267 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _223);
    float _269 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _235);
    float _271 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _237);
    float _273 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _239);
    float _275 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _241);
    float _277 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _243);
    float _279 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _245);
    float _281 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _249);
    float _283 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[19].z, _251);
    float _285 = float(_221);
    float _287 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[20].z, _253);
    float _289 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[21].z, _255);
    float _291 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[22].z, _257);
    float _293 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[23].z, _259);
    float _295 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[24].z, _261);
    float _297 = _283 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _299 = precise::min(_285, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _301 = _287 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _303 = _289 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _305 = _297;
    float _307 = _301;
    float _309 = _303;
    if (_233)
    {
        float _311 = _291 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _305 = _311;
    }
    float _313 = _305;
    float _315 = _313;
    if (_233)
    {
        float _317 = _293 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _307 = _317;
    }
    float _319 = _307;
    float _321 = _319;
    if (_233)
    {
        float _323 = _295 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _309 = _323;
    }
    float _325 = _309;
    bool _327 = _209 != 0.0;
    bool _329 = isnan(_209);
    bool _331 = _327 || _329;
    bool _333 = isnan(0.0);
    bool _335 = _331 || _333;
    float _337 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[28].z, _193);
    bool _339 = _299 != 1.0;
    bool _341 = isnan(_299);
    bool _343 = _339 || _341;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    float _349 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[29].z, _277);
    bool _351 = _299 != 0.0;
    bool _353 = isnan(_299);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    float _361 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[30].z, _279);
    float _363 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[18].z, _269);
    float _365 = fma(_158, -0.5, _148);
    float _367 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[33].z, _281);
    float _369 = rint(_209);
    float _371 = precise::max(_369, 0.0);
    uint _374 = uint(_371);
    uint _376 = clamp(_374, 0u, 65535u);
    float _378 = _337 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _380 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[27].z, _275);
    float _382 = _349 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _384 = _361 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _386 = _325;
    float _388 = _384;
    float _390 = _378;
    float _392 = _382;
    if (!_335)
    {
        float _394 = _363 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _386 = _394;
    }
    float _396 = _386;
    float _398 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _400 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (_347)
    {
        float _402 = _367 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _388 = _402;
    }
    float _404 = _388;
    float _406 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[17].z, _267);
    float _408 = rint(_299);
    float _410 = precise::max(_408, 0.0);
    uint _412 = uint(_410);
    uint _414 = clamp(_412, 0u, 65535u);
    float _416 = _404;
    if (!_359)
    {
        float _418 = _380 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _416 = _418;
    }
    float _420 = _416;
    float _422 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[16].z, _265);
    float _424 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[31].z, _195);
    float _426 = 0.0 + _396;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    if (!_335)
    {
        float _430 = _406 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _321 = _430;
    }
    float _432 = _321;
    float _434 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[25].z, _271);
    float _436 = 0.0 + _420;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[32].z, _263);
    if (!_335)
    {
        float _442 = _422 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _315 = _442;
    }
    float _444 = _315;
    if (_347)
    {
        float _446 = _424 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _390 = _446;
    }
    float _448 = _390;
    float _450 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[26].z, _273);
    float _452 = _428 * _400;
    float _454 = _428 * _398;
    float _456 = fma(_160, -0.5, _146);
    float _458 = _448;
    if (!_359)
    {
        float _460 = _434 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _458 = _460;
    }
    float _462 = _458;
    float _464 = _398 * _438;
    if (_347)
    {
        float _466 = _440 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _392 = _466;
    }
    float _468 = _392;
    float _470 = _468;
    if (!_359)
    {
        float _472 = _450 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _470 = _472;
    }
    float _474 = _470;
    float _476 = _400 * _438;
    float _478 = fma(_452, 0.5, _432);
    float _480 = fma(_452, -0.5, _432);
    float _482 = fma(_454, 0.5, _444);
    float _484 = fma(_464, 0.5, _462);
    float _486 = fma(_454, -0.5, _444);
    float _488 = fma(_464, -0.5, _462);
    float _490 = fma(_476, 0.5, _474);
    float3 _1398 = float3(_365, _169, float(0));
    float3 _1400 = select(_1398, float3(0.0), isnan(_1398));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1400.xy, uint(rint(_1400.z)), _144);
    float3 _1407 = float3(_167, _456, float(0));
    float3 _1409 = select(_1407, float3(0.0), isnan(_1407));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1409.xy, uint(rint(_1409.z)), _144);
    float3 _1416 = float3(_365, _456, float(0));
    float3 _1418 = select(_1416, float3(0.0), isnan(_1416));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1418.xy, uint(rint(_1418.z)), _144);
    float3 _1427 = float3(_486, _478, float(int(_376)));
    float3 _1429 = select(_1427, float3(0.0), isnan(_1427));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1429.xy, uint(rint(_1429.z)), _428);
    float _500 = fma(_476, -0.5, _474);
    float3 _1441 = float3(_482, _478, float(int(_376)));
    float3 _1443 = select(_1441, float3(0.0), isnan(_1441));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1443.xy, uint(rint(_1443.z)), _428);
    float3 _1452 = float3(_488, _490, float(int(_414)));
    float3 _1454 = select(_1452, float3(0.0), isnan(_1452));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1454.xy, uint(rint(_1454.z)), _438);
    float3 _1463 = float3(_484, _490, float(int(_414)));
    float3 _1465 = select(_1463, float3(0.0), isnan(_1463));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1465.xy, uint(rint(_1465.z)), _438);
    float3 _1474 = float3(_482, _480, float(int(_376)));
    float3 _1476 = select(_1474, float3(0.0), isnan(_1474));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1476.xy, uint(rint(_1476.z)), _428);
    float3 _1485 = float3(_484, _500, float(int(_414)));
    float3 _1487 = select(_1485, float3(0.0), isnan(_1485));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1487.xy, uint(rint(_1487.z)), _438);
    float3 _1496 = float3(_486, _480, float(int(_376)));
    float3 _1498 = select(_1496, float3(0.0), isnan(_1496));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1498.xy, uint(rint(_1498.z)), _428);
    float3 _1507 = float3(_488, _500, float(int(_414)));
    float3 _1509 = select(_1507, float3(0.0), isnan(_1507));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1509.xy, uint(rint(_1509.z)), _438);
    float _516 = -_62;
    float _518 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _520 = _516 + _518;
    float _522 = _520 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    float _526 = -_62;
    float _528 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _530 = _526 + _528;
    float _532 = _530 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = _171 + _492;
    float _538 = _536 + _494;
    float _540 = _538 + _496;
    float _542 = _502 + _498;
    float _544 = fma(_540, 0.25, _524);
    float _546 = _506 + _504;
    float _548 = _542 + _508;
    float _550 = _546 + _510;
    float _552 = _548 + _512;
    float _554 = _550 + _514;
    float _556 = _552 * 0.25;
    float _558 = _554 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _560 = _558 * 0.25;
    float _562 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[49].z, _560);
    float _564 = _534 + _562;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _544;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _564;
    return out;
}

