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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _590 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_590, float2(0.0), isnan(_590))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_590, float2(0.0), isnan(_590))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _56;
    float _72 = _68 * _58;
    float _74 = -_70;
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _78 = -_72;
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _82 = -_72;
    float _84 = _82 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _86 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _88 = _76 * _76;
    float _90 = -_68;
    float _92 = _90 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _94 = _70 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _86);
    float _98 = fma(_80, _80, _88);
    float _100 = _70 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _102 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _94);
    float _104 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _96);
    float _106 = fma(_92, _92, _98);
    float _108 = -_70;
    float _110 = _108 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _112 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _100);
    float _114 = _104 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _116 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _118 = _110 * _110;
    float _120 = sqrt(_106);
    float _122 = -_68;
    float _124 = _122 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _126 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _128 = fma(_84, _84, _118);
    float _130 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _132 = _70 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _134 = _70 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _136 = fma(_124, _124, _128);
    float _138 = _70 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _140 = _70 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _142 = _70 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _144 = _70 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _146 = sqrt(_136);
    float _148 = _70 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _150 = _70 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    bool _154 = _120 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _156 = _70 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _158 = _120 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _160 = _70 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _162 = !_154;
    int _165 = _162 ? 0 : 1;
    float _167 = _70 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _169 = _70 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _171 = _70 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _173 = 1.0 / _114;
    float _175 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
    float _177 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
    float _179 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
    float _181 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _132);
    int _183 = 2;
    if (!_154)
    {
        _183 = 1;
    }
    int _185 = _183;
    float _187 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _134);
    bool _189 = _146 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _191 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _138);
    bool _193 = _146 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _195 = _70 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    int _197 = _185;
    if (!_158)
    {
        _197 = _165;
    }
    int _199 = _197;
    float _201 = _70 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _203 = _70 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _205 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _140);
    float _207 = float(_199);
    float _209 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _201);
    float _211 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _195);
    float _213 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _142);
    float _215 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _144);
    float _217 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _148);
    float _219 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _150);
    float _221 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _156);
    float _223 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _160);
    float _225 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _167);
    float _227 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _169);
    float _229 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _171);
    bool _231 = !_189;
    int _233 = _231 ? 0 : 1;
    float _235 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _203);
    float _237 = precise::min(_207, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _239 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _175);
    float _241 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _177);
    int _243 = 2;
    if (!_189)
    {
        _243 = 1;
    }
    int _245 = _243;
    float _247 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _179);
    int _249 = _245;
    if (!_193)
    {
        _249 = _233;
    }
    int _251 = _249;
    float _253 = _239 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _255 = _237 != 1.0;
    bool _257 = isnan(_237);
    bool _259 = _255 || _257;
    bool _261 = isnan(1.0);
    bool _263 = _259 || _261;
    float _265 = _241 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _267 = float(_251);
    float _269 = _247 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _271 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _181);
    float _273 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _187);
    float _275 = precise::min(_267, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _277 = _253 * _173;
    float _279 = _265 * _173;
    float _281 = _269 * _173;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _191);
    float _287 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _102);
    float _289 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _205);
    float _291 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _112);
    float _293 = _271 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _295 = _293;
    if (_263)
    {
        float _297 = _273 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _295 = _297;
    }
    float _299 = _295;
    bool _301 = _275 != 1.0;
    bool _303 = isnan(_275);
    bool _305 = _301 || _303;
    bool _307 = isnan(1.0);
    bool _309 = _305 || _307;
    float _311 = _285 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _313 = _287 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _315 = _311;
    float _317 = _313;
    float _319 = _299;
    if (_263)
    {
        float _321 = _289 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _315 = _321;
    }
    float _323 = _315;
    float _325 = _323;
    if (_263)
    {
        float _327 = _291 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _317 = _327;
    }
    float _329 = _317;
    bool _331 = _237 != 0.0;
    bool _333 = isnan(_237);
    bool _335 = _331 || _333;
    bool _337 = isnan(0.0);
    bool _339 = _335 || _337;
    float _341 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _221);
    bool _343 = _275 != 0.0;
    bool _345 = isnan(_275);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _227);
    float _355 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _225);
    float _357 = _341 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _359 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _235);
    float _361 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _213);
    float _363 = _357;
    float _365 = _329;
    if (_309)
    {
        float _367 = _353 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _363 = _367;
    }
    float _369 = _363;
    float _371 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _219);
    float _373 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _229);
    float _375 = rint(_283);
    float _377 = precise::max(_375, 0.0);
    uint _380 = uint(_377);
    uint _382 = clamp(_380, 0u, 65535u);
    float _384 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _223);
    float _386 = _355 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _388 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _215);
    float _390 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _209);
    float _392 = _386;
    float _394 = _369;
    if (_309)
    {
        float _396 = _359 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _392 = _396;
    }
    float _398 = _392;
    float _400 = _398;
    if (!_339)
    {
        float _402 = _361 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _365 = _402;
    }
    float _404 = _365;
    float _406 = rint(_237);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    uint _412 = clamp(_410, 0u, 65535u);
    if (!_351)
    {
        float _414 = _371 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _400 = _414;
    }
    float _416 = _400;
    float _418 = _384 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _420 = _418;
    if (!_351)
    {
        float _422 = _388 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _394 = _422;
    }
    float _424 = _394;
    float _426 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _211);
    if (_309)
    {
        float _428 = _373 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _420 = _428;
    }
    float _430 = _420;
    float _432 = _430;
    if (!_339)
    {
        float _434 = _390 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _319 = _434;
    }
    float _436 = _319;
    float _438 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _440 = 0.0 + _404;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _446 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _448 = 0.0 + _416;
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = rint(_275);
    float _454 = precise::max(_452, 0.0);
    uint _456 = uint(_454);
    uint _458 = clamp(_456, 0u, 65535u);
    float _460 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _217);
    float _462 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (!_339)
    {
        float _464 = _426 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _325 = _464;
    }
    float _466 = _325;
    float _468 = _442 * _438;
    float _470 = fma(_444, 0.5, _277);
    float _472 = _438 * _450;
    if (!_351)
    {
        float _474 = _460 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _432 = _474;
    }
    float _476 = _432;
    float _478 = fma(_444, -0.5, _277);
    float _480 = _462 * _450;
    float _482 = fma(_446, 0.5, _279);
    float _484 = fma(_446, -0.5, _279);
    float _486 = _442 * _462;
    float _488 = fma(_472, 0.5, _424);
    float _490 = fma(_468, 0.5, _436);
    float _492 = fma(_472, -0.5, _424);
    float _494 = fma(_480, 0.5, _476);
    float _496 = fma(_468, -0.5, _436);
    float _498 = fma(_480, -0.5, _476);
    float _500 = fma(_486, 0.5, _466);
    float _502 = fma(_486, -0.5, _466);
    float3 _1416 = float3(_478, _482, float(int(_382)));
    float3 _1420 = select(_1416, float3(0.0), isnan(_1416));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1420.xy, uint(rint(_1420.z)), 1.0);
    float3 _1428 = float3(_470, _482, float(int(_382)));
    float3 _1430 = select(_1428, float3(0.0), isnan(_1428));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1430.xy, uint(rint(_1430.z)), 1.0);
    float3 _1438 = float3(_470, _484, float(int(_382)));
    float3 _1440 = select(_1438, float3(0.0), isnan(_1438));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1440.xy, uint(rint(_1440.z)), 1.0);
    float3 _1448 = float3(_478, _484, float(int(_382)));
    float3 _1450 = select(_1448, float3(0.0), isnan(_1448));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1450.xy, uint(rint(_1450.z)), 1.0);
    float3 _1458 = float3(_496, _500, float(int(_412)));
    float3 _1460 = select(_1458, float3(0.0), isnan(_1458));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1460.xy, uint(rint(_1460.z)), _442);
    float3 _1469 = float3(_490, _500, float(int(_412)));
    float3 _1471 = select(_1469, float3(0.0), isnan(_1469));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1471.xy, uint(rint(_1471.z)), _442);
    float3 _1480 = float3(_490, _502, float(int(_412)));
    float3 _1482 = select(_1480, float3(0.0), isnan(_1480));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1482.xy, uint(rint(_1482.z)), _442);
    float3 _1491 = float3(_492, _494, float(int(_458)));
    float3 _1493 = select(_1491, float3(0.0), isnan(_1491));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1493.xy, uint(rint(_1493.z)), _450);
    float3 _1502 = float3(_488, _494, float(int(_458)));
    float3 _1504 = select(_1502, float3(0.0), isnan(_1502));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1504.xy, uint(rint(_1504.z)), _450);
    float3 _1513 = float3(_488, _498, float(int(_458)));
    float3 _1515 = select(_1513, float3(0.0), isnan(_1513));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1515.xy, uint(rint(_1515.z)), _450);
    float3 _1524 = float3(_496, _502, float(int(_412)));
    float3 _1526 = select(_1524, float3(0.0), isnan(_1524));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1526.xy, uint(rint(_1526.z)), _442);
    float3 _1535 = float3(_492, _498, float(int(_458)));
    float3 _1537 = select(_1535, float3(0.0), isnan(_1535));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1537.xy, uint(rint(_1537.z)), _450);
    float2 _1543 = float2(_50, _52);
    float _528 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1543, float2(0.0), isnan(_1543))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1543, float2(0.0), isnan(_1543))).x;
    float _530 = _506 + _504;
    float _532 = -_68;
    float _534 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _536 = _532 + _534;
    float _538 = _530 + _508;
    float _540 = _536 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _542 = precise::clamp(_540, 0.0, 1.0);
    float _544 = _538 + _510;
    float _546 = -_68;
    float _548 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _550 = _546 + _548;
    float _552 = _514 + _512;
    float _554 = fma(_544, 0.25, _542);
    float _556 = _550 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _558 = precise::clamp(_556, 0.0, 1.0);
    float _560 = _552 + _516;
    float _562 = _520 + _518;
    float _564 = _562 + _522;
    float _566 = _560 + _524;
    float _568 = _564 + _526;
    float _570 = _566 * 0.25;
    float _572 = _568 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _574 = _572 * 0.25;
    float _576 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[49].z, _574);
    float _578 = _558 + _576;
    out.m_43.x = _528;
    out.m_43.y = _554;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _578;
    return out;
}

