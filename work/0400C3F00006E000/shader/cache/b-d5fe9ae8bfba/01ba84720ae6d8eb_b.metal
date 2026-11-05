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
    float2 _586 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_586, float2(0.0), isnan(_586))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_586, float2(0.0), isnan(_586))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = _64 * _58;
    float _70 = -_66;
    float _72 = _70 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _74 = -_68;
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _78 = -_66;
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _82 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _84 = _72 * _72;
    float _86 = -_64;
    float _88 = _86 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _90 = _80 * _80;
    float _92 = -_64;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _96 = fma(_76, _76, _84);
    float _98 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _82);
    float _100 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _102 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _104 = fma(_88, _88, _96);
    float _106 = -_68;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _110 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _98);
    float _112 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _100);
    float _114 = fma(_108, _108, _90);
    float _116 = sqrt(_104);
    float _118 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _102);
    float _120 = _110 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _122 = fma(_94, _94, _114);
    float _124 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _126 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _128 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _130 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _132 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _134 = sqrt(_122);
    float _136 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _138 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _140 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _142 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _144 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _146 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    bool _150 = _116 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _152 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _154 = _116 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _156 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _158 = !_150;
    int _161 = _158 ? 0 : 1;
    float _163 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _165 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _167 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _169 = 1.0 / _120;
    bool _171 = _134 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _173 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
    float _175 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
    float _177 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
    int _179 = 2;
    if (!_150)
    {
        _179 = 1;
    }
    int _181 = _179;
    float _183 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _130);
    bool _185 = _134 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _187 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    int _189 = _181;
    if (!_154)
    {
        _189 = _161;
    }
    int _191 = _189;
    float _193 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _195 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _197 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _132);
    float _199 = float(_191);
    float _201 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _136);
    float _203 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _138);
    float _205 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _193);
    float _207 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _187);
    float _209 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _140);
    float _211 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _142);
    float _213 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _144);
    float _215 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _146);
    float _217 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _152);
    float _219 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _156);
    float _221 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _163);
    float _223 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _165);
    float _225 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _167);
    bool _227 = !_171;
    int _229 = _227 ? 0 : 1;
    float _231 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _195);
    float _233 = precise::min(_199, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _235 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _173);
    float _237 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _175);
    int _239 = 2;
    if (!_171)
    {
        _239 = 1;
    }
    int _241 = _239;
    float _243 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _177);
    int _245 = _241;
    if (!_185)
    {
        _245 = _229;
    }
    int _247 = _245;
    float _249 = _235 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _251 = _233 != 1.0;
    bool _253 = isnan(_233);
    bool _255 = _251 || _253;
    bool _257 = isnan(1.0);
    bool _259 = _255 || _257;
    float _261 = _237 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _263 = float(_247);
    float _265 = _243 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _267 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _183);
    float _269 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _197);
    float _271 = precise::min(_263, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _273 = _249 * _169;
    float _275 = _261 * _169;
    float _277 = _265 * _169;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _201);
    float _283 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _112);
    float _285 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _203);
    float _287 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _118);
    float _289 = _267 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _291 = _289;
    if (_259)
    {
        float _293 = _269 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _291 = _293;
    }
    float _295 = _291;
    bool _297 = _271 != 1.0;
    bool _299 = isnan(_271);
    bool _301 = _297 || _299;
    bool _303 = isnan(1.0);
    bool _305 = _301 || _303;
    float _307 = _281 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _309 = _283 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _311 = _307;
    float _313 = _309;
    float _315 = _295;
    if (_259)
    {
        float _317 = _285 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _311 = _317;
    }
    float _319 = _311;
    float _321 = _319;
    if (_259)
    {
        float _323 = _287 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _313 = _323;
    }
    float _325 = _313;
    bool _327 = _233 != 0.0;
    bool _329 = isnan(_233);
    bool _331 = _327 || _329;
    bool _333 = isnan(0.0);
    bool _335 = _331 || _333;
    float _337 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _217);
    bool _339 = _271 != 0.0;
    bool _341 = isnan(_271);
    bool _343 = _339 || _341;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    float _349 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _223);
    float _351 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _221);
    float _353 = _337 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _355 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _231);
    float _357 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _209);
    float _359 = _353;
    float _361 = _325;
    if (_305)
    {
        float _363 = _349 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _359 = _363;
    }
    float _365 = _359;
    float _367 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _215);
    float _369 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _225);
    float _371 = rint(_279);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    uint _378 = clamp(_376, 0u, 65535u);
    float _380 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _219);
    float _382 = _351 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _384 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _211);
    float _386 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _205);
    float _388 = _382;
    float _390 = _365;
    if (_305)
    {
        float _392 = _355 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _388 = _392;
    }
    float _394 = _388;
    float _396 = _394;
    if (!_335)
    {
        float _398 = _357 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _361 = _398;
    }
    float _400 = _361;
    float _402 = rint(_233);
    float _404 = precise::max(_402, 0.0);
    uint _406 = uint(_404);
    uint _408 = clamp(_406, 0u, 65535u);
    if (!_347)
    {
        float _410 = _367 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _396 = _410;
    }
    float _412 = _396;
    float _414 = _380 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _416 = _414;
    if (!_347)
    {
        float _418 = _384 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _390 = _418;
    }
    float _420 = _390;
    float _422 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _207);
    if (_305)
    {
        float _424 = _369 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _416 = _424;
    }
    float _426 = _416;
    float _428 = _426;
    if (!_335)
    {
        float _430 = _386 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _315 = _430;
    }
    float _432 = _315;
    float _434 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _436 = 0.0 + _400;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _442 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _444 = 0.0 + _412;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    float _448 = rint(_271);
    float _450 = precise::max(_448, 0.0);
    uint _452 = uint(_450);
    uint _454 = clamp(_452, 0u, 65535u);
    float _456 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _213);
    float _458 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (!_335)
    {
        float _460 = _422 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _321 = _460;
    }
    float _462 = _321;
    float _464 = _438 * _434;
    float _466 = fma(_440, 0.5, _273);
    float _468 = _434 * _446;
    if (!_347)
    {
        float _470 = _456 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _428 = _470;
    }
    float _472 = _428;
    float _474 = fma(_440, -0.5, _273);
    float _476 = _458 * _446;
    float _478 = fma(_442, 0.5, _275);
    float _480 = fma(_442, -0.5, _275);
    float _482 = _438 * _458;
    float _484 = fma(_468, 0.5, _420);
    float _486 = fma(_464, 0.5, _432);
    float _488 = fma(_468, -0.5, _420);
    float _490 = fma(_476, 0.5, _472);
    float _492 = fma(_464, -0.5, _432);
    float _494 = fma(_476, -0.5, _472);
    float _496 = fma(_482, 0.5, _462);
    float _498 = fma(_482, -0.5, _462);
    float3 _1408 = float3(_474, _478, float(int(_378)));
    float3 _1412 = select(_1408, float3(0.0), isnan(_1408));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1412.xy, uint(rint(_1412.z)), 1.0);
    float3 _1420 = float3(_466, _478, float(int(_378)));
    float3 _1422 = select(_1420, float3(0.0), isnan(_1420));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1422.xy, uint(rint(_1422.z)), 1.0);
    float3 _1430 = float3(_466, _480, float(int(_378)));
    float3 _1432 = select(_1430, float3(0.0), isnan(_1430));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1432.xy, uint(rint(_1432.z)), 1.0);
    float3 _1440 = float3(_474, _480, float(int(_378)));
    float3 _1442 = select(_1440, float3(0.0), isnan(_1440));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1442.xy, uint(rint(_1442.z)), 1.0);
    float3 _1450 = float3(_492, _496, float(int(_408)));
    float3 _1452 = select(_1450, float3(0.0), isnan(_1450));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1452.xy, uint(rint(_1452.z)), _438);
    float3 _1461 = float3(_486, _496, float(int(_408)));
    float3 _1463 = select(_1461, float3(0.0), isnan(_1461));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1463.xy, uint(rint(_1463.z)), _438);
    float3 _1472 = float3(_486, _498, float(int(_408)));
    float3 _1474 = select(_1472, float3(0.0), isnan(_1472));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1474.xy, uint(rint(_1474.z)), _438);
    float3 _1483 = float3(_488, _490, float(int(_454)));
    float3 _1485 = select(_1483, float3(0.0), isnan(_1483));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1485.xy, uint(rint(_1485.z)), _446);
    float3 _1494 = float3(_484, _490, float(int(_454)));
    float3 _1496 = select(_1494, float3(0.0), isnan(_1494));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1496.xy, uint(rint(_1496.z)), _446);
    float3 _1505 = float3(_484, _494, float(int(_454)));
    float3 _1507 = select(_1505, float3(0.0), isnan(_1505));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1507.xy, uint(rint(_1507.z)), _446);
    float3 _1516 = float3(_492, _498, float(int(_408)));
    float3 _1518 = select(_1516, float3(0.0), isnan(_1516));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1518.xy, uint(rint(_1518.z)), _438);
    float3 _1527 = float3(_488, _494, float(int(_454)));
    float3 _1529 = select(_1527, float3(0.0), isnan(_1527));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1529.xy, uint(rint(_1529.z)), _446);
    float2 _1535 = float2(_50, _52);
    float _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1535, float2(0.0), isnan(_1535))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1535, float2(0.0), isnan(_1535))).x;
    float _526 = _502 + _500;
    float _528 = -_64;
    float _530 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _532 = _528 + _530;
    float _534 = _526 + _504;
    float _536 = _532 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _538 = precise::clamp(_536, 0.0, 1.0);
    float _540 = _534 + _506;
    float _542 = -_64;
    float _544 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _546 = _542 + _544;
    float _548 = _510 + _508;
    float _550 = fma(_540, 0.25, _538);
    float _552 = _546 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _554 = precise::clamp(_552, 0.0, 1.0);
    float _556 = _548 + _512;
    float _558 = _516 + _514;
    float _560 = _558 + _518;
    float _562 = _556 + _520;
    float _564 = _560 + _522;
    float _566 = _562 * 0.25;
    float _568 = _564 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _570 = _568 * 0.25;
    float _572 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[49].z, _570);
    float _574 = _554 + _572;
    out.m_43.x = _524;
    out.m_43.y = _550;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _574;
    return out;
}

