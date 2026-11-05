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
    float2 _580 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_580, float2(0.0), isnan(_580))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_580, float2(0.0), isnan(_580))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = -_68;
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _78 = -_70;
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _82 = -_68;
    float _84 = _82 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _88 = _76 * _76;
    float _90 = -_70;
    float _92 = _90 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _94 = _84 * _84;
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _86);
    float _98 = fma(_80, _80, _88);
    float _100 = -_66;
    float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _104 = fma(_92, _92, _94);
    float _106 = _96 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _108 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _110 = fma(_102, _102, _98);
    float _112 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _114 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _116 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _108);
    float _118 = 1.0 / _106;
    float _120 = -_66;
    float _122 = _120 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _124 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _112);
    float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _116);
    float _128 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _114);
    float _130 = fma(_122, _122, _104);
    float _132 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
    float _134 = _126 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _136 = sqrt(_110);
    float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
    float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _142 = _138 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _144 = _134 * _118;
    float _146 = precise::clamp(_144, 0.0, 1.0);
    float _148 = sqrt(_130);
    float _150 = _142 * _118;
    float _152 = _140 * _118;
    float _154 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _146;
    bool _158 = _136 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _160 = _136 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _162 = _154 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _164 = _154 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    bool _166 = !_158;
    int _169 = _166 ? 0 : 1;
    float _171 = fma(_162, 0.5, _152);
    float _173 = fma(_164, 0.5, _150);
    float3 _807 = float3(_171, _173, float(0));
    float3 _811 = select(_807, float3(0.0), isnan(_807));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _811.xy, uint(rint(_811.z)), _146);
    int _177 = 2;
    if (!_158)
    {
        _177 = 1;
    }
    int _179 = _177;
    float _181 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    int _183 = _179;
    if (!_160)
    {
        _183 = _169;
    }
    int _185 = _183;
    float _187 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _189 = _148 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _191 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    bool _193 = _148 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _195 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _197 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _181);
    float _199 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _187);
    bool _201 = !_189;
    int _203 = _201 ? 0 : 1;
    float _205 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _207 = float(_185);
    float _209 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _211 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _213 = precise::min(_207, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _215 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    int _217 = 2;
    if (!_189)
    {
        _217 = 1;
    }
    int _219 = _217;
    float _221 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    int _223 = _219;
    if (!_193)
    {
        _223 = _203;
    }
    int _225 = _223;
    float _227 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _229 = _213 != 1.0;
    bool _231 = isnan(_213);
    bool _233 = _229 || _231;
    bool _235 = isnan(1.0);
    bool _237 = _233 || _235;
    float _239 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _241 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _243 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _245 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _247 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _249 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _251 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _253 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _255 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _191);
    float _257 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _195);
    float _259 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _205);
    float _261 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _209);
    float _263 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _211);
    float _265 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _215);
    float _267 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _251);
    float _269 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _221);
    float _271 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _227);
    float _273 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _239);
    float _275 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _241);
    float _277 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _243);
    float _279 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _245);
    float _281 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _247);
    float _283 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _249);
    float _285 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _253);
    float _287 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _255);
    float _289 = float(_225);
    float _291 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _257);
    float _293 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _259);
    float _295 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _261);
    float _297 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _263);
    float _299 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _265);
    float _301 = _287 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _303 = precise::min(_289, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _305 = _291 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _307 = _293 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _309 = _301;
    float _311 = _305;
    float _313 = _307;
    if (_237)
    {
        float _315 = _295 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _309 = _315;
    }
    float _317 = _309;
    float _319 = _317;
    if (_237)
    {
        float _321 = _297 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _311 = _321;
    }
    float _323 = _311;
    float _325 = _323;
    if (_237)
    {
        float _327 = _299 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _313 = _327;
    }
    float _329 = _313;
    bool _331 = _213 != 0.0;
    bool _333 = isnan(_213);
    bool _335 = _331 || _333;
    bool _337 = isnan(0.0);
    bool _339 = _335 || _337;
    float _341 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _197);
    bool _343 = _303 != 1.0;
    bool _345 = isnan(_303);
    bool _347 = _343 || _345;
    bool _349 = isnan(1.0);
    bool _351 = _347 || _349;
    float _353 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _281);
    bool _355 = _303 != 0.0;
    bool _357 = isnan(_303);
    bool _359 = _355 || _357;
    bool _361 = isnan(0.0);
    bool _363 = _359 || _361;
    float _365 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _283);
    float _367 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _273);
    float _369 = fma(_162, -0.5, _152);
    float _371 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _285);
    float _373 = rint(_213);
    float _375 = precise::max(_373, 0.0);
    uint _378 = uint(_375);
    uint _380 = clamp(_378, 0u, 65535u);
    float _382 = _341 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _384 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _279);
    float _386 = _353 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _388 = _365 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _390 = _329;
    float _392 = _388;
    float _394 = _382;
    float _396 = _386;
    if (!_339)
    {
        float _398 = _367 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _390 = _398;
    }
    float _400 = _390;
    float _402 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _404 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (_351)
    {
        float _406 = _371 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _392 = _406;
    }
    float _408 = _392;
    float _410 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _271);
    float _412 = rint(_303);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    uint _418 = clamp(_416, 0u, 65535u);
    float _420 = _408;
    if (!_363)
    {
        float _422 = _384 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _269);
    float _428 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _199);
    float _430 = 0.0 + _400;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    if (!_339)
    {
        float _434 = _410 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _325 = _434;
    }
    float _436 = _325;
    float _438 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _275);
    float _440 = 0.0 + _424;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _267);
    if (!_339)
    {
        float _446 = _426 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _319 = _446;
    }
    float _448 = _319;
    if (_351)
    {
        float _450 = _428 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _394 = _450;
    }
    float _452 = _394;
    float _454 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _277);
    float _456 = _432 * _404;
    float _458 = _432 * _402;
    float _460 = fma(_164, -0.5, _150);
    float _462 = _452;
    if (!_363)
    {
        float _464 = _438 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _462 = _464;
    }
    float _466 = _462;
    float _468 = _402 * _442;
    if (_351)
    {
        float _470 = _444 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _396 = _470;
    }
    float _472 = _396;
    float _474 = _472;
    if (!_363)
    {
        float _476 = _454 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = _404 * _442;
    float _482 = fma(_456, 0.5, _436);
    float _484 = fma(_456, -0.5, _436);
    float _486 = fma(_458, 0.5, _448);
    float _488 = fma(_468, 0.5, _466);
    float _490 = fma(_458, -0.5, _448);
    float _492 = fma(_468, -0.5, _466);
    float _494 = fma(_480, 0.5, _478);
    float3 _1406 = float3(_369, _173, float(0));
    float3 _1408 = select(_1406, float3(0.0), isnan(_1406));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1408.xy, uint(rint(_1408.z)), _146);
    float3 _1415 = float3(_171, _460, float(0));
    float3 _1417 = select(_1415, float3(0.0), isnan(_1415));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1417.xy, uint(rint(_1417.z)), _146);
    float3 _1424 = float3(_369, _460, float(0));
    float3 _1426 = select(_1424, float3(0.0), isnan(_1424));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1426.xy, uint(rint(_1426.z)), _146);
    float3 _1435 = float3(_490, _482, float(int(_380)));
    float3 _1437 = select(_1435, float3(0.0), isnan(_1435));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1437.xy, uint(rint(_1437.z)), _432);
    float _504 = fma(_480, -0.5, _478);
    float3 _1449 = float3(_486, _482, float(int(_380)));
    float3 _1451 = select(_1449, float3(0.0), isnan(_1449));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1451.xy, uint(rint(_1451.z)), _432);
    float3 _1460 = float3(_492, _494, float(int(_418)));
    float3 _1462 = select(_1460, float3(0.0), isnan(_1460));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1462.xy, uint(rint(_1462.z)), _442);
    float3 _1471 = float3(_488, _494, float(int(_418)));
    float3 _1473 = select(_1471, float3(0.0), isnan(_1471));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1473.xy, uint(rint(_1473.z)), _442);
    float3 _1482 = float3(_486, _484, float(int(_380)));
    float3 _1484 = select(_1482, float3(0.0), isnan(_1482));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1484.xy, uint(rint(_1484.z)), _432);
    float3 _1493 = float3(_488, _504, float(int(_418)));
    float3 _1495 = select(_1493, float3(0.0), isnan(_1493));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1495.xy, uint(rint(_1495.z)), _442);
    float3 _1504 = float3(_490, _484, float(int(_380)));
    float3 _1506 = select(_1504, float3(0.0), isnan(_1504));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1506.xy, uint(rint(_1506.z)), _432);
    float3 _1515 = float3(_492, _504, float(int(_418)));
    float3 _1517 = select(_1515, float3(0.0), isnan(_1515));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1517.xy, uint(rint(_1517.z)), _442);
    float _520 = -_66;
    float _522 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _524 = _520 + _522;
    float _526 = _524 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _528 = precise::clamp(_526, 0.0, 1.0);
    float _530 = -_66;
    float _532 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _534 = _530 + _532;
    float _536 = _534 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _538 = precise::clamp(_536, 0.0, 1.0);
    float _540 = _175 + _496;
    float _542 = _540 + _498;
    float _544 = _542 + _500;
    float _546 = _506 + _502;
    float _548 = fma(_544, 0.25, _528);
    float _550 = _510 + _508;
    float _552 = _546 + _512;
    float _554 = _550 + _514;
    float _556 = _552 + _516;
    float _558 = _554 + _518;
    float _560 = _556 * 0.25;
    float _562 = _558 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _564 = _562 * 0.25;
    float _566 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[49].z, _564);
    float _568 = _538 + _566;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _548;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _568;
    return out;
}

