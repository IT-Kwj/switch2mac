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
    float2 _586 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_586, float2(0.0), isnan(_586))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_586, float2(0.0), isnan(_586))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = -_66;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _76 = -_68;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _80 = -_70;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _84 = -_68;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _88 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _90 = _78 * _78;
    float _92 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _94 = _86 * _86;
    float _96 = -_66;
    float _98 = _96 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _100 = fma(_82, _82, _90);
    float _102 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _104 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _106 = fma(_74, _74, _100);
    float _108 = -_70;
    float _110 = _108 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _112 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _114 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _116 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _118 = fma(_110, _110, _94);
    float _120 = sqrt(_106);
    float _122 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _124 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _126 = fma(_98, _98, _118);
    float _128 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _130 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _132 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _134 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _136 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _138 = sqrt(_126);
    float _140 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _142 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _144 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _146 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _148 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _150 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _92);
    bool _154 = _120 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _156 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _102);
    bool _158 = _120 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _160 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    bool _162 = !_154;
    int _165 = _162 ? 0 : 1;
    float _167 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _104);
    float _169 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _112);
    float _171 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _114);
    float _173 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _116);
    bool _175 = _138 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _177 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _124);
    float _179 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _128);
    float _181 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _130);
    int _183 = 2;
    if (!_154)
    {
        _183 = 1;
    }
    int _185 = _183;
    float _187 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _160);
    bool _189 = _138 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _191 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    int _193 = _185;
    if (!_158)
    {
        _193 = _165;
    }
    int _195 = _193;
    float _197 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    bool _199 = !_175;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _191);
    float _205 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _122);
    float _207 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _88);
    float _209 = float(_195);
    float _211 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _203);
    float _213 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _132);
    float _215 = precise::min(_209, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _217 = _211 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    int _219 = 2;
    if (!_175)
    {
        _219 = 1;
    }
    int _221 = _219;
    float _223 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _134);
    int _225 = _221;
    if (!_189)
    {
        _225 = _201;
    }
    int _227 = _225;
    float _229 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _136);
    bool _231 = _215 != 1.0;
    bool _233 = isnan(_215);
    bool _235 = _231 || _233;
    bool _237 = isnan(1.0);
    bool _239 = _235 || _237;
    float _241 = 1.0 / _217;
    float _243 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _140);
    float _245 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _142);
    float _247 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _144);
    float _249 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _146);
    float _251 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _148);
    float _253 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _197);
    float _255 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _150);
    float _257 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _156);
    float _259 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _167);
    float _261 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _169);
    float _263 = float(_227);
    float _265 = _255 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _267 = _257 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _269 = _259 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _271 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _173);
    float _273 = _261 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _275 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _179);
    float _277 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _171);
    float _279 = precise::min(_263, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _281 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _177);
    float _283 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _181);
    float _285 = _265 * _241;
    float _287 = _267 * _241;
    float _289 = _269 * _241;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = _271 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _295 = _275 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _297 = _273;
    float _299 = _293;
    float _301 = _295;
    if (_239)
    {
        float _303 = _277 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _297 = _303;
    }
    float _305 = _297;
    float _307 = _305;
    if (_239)
    {
        float _309 = _281 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _299 = _309;
    }
    float _311 = _299;
    float _313 = _311;
    if (_239)
    {
        float _315 = _283 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _301 = _315;
    }
    float _317 = _301;
    bool _319 = _215 != 0.0;
    bool _321 = isnan(_215);
    bool _323 = _319 || _321;
    bool _325 = isnan(0.0);
    bool _327 = _323 || _325;
    float _329 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _247);
    bool _331 = _279 != 1.0;
    bool _333 = isnan(_279);
    bool _335 = _331 || _333;
    bool _337 = isnan(1.0);
    bool _339 = _335 || _337;
    float _341 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _207);
    bool _343 = _279 != 0.0;
    bool _345 = isnan(_279);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = rint(_291);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    uint _360 = clamp(_358, 0u, 65535u);
    float _362 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _253);
    float _364 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _187);
    float _366 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _251);
    float _368 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _229);
    float _370 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _245);
    float _372 = _329 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _374 = rint(_215);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    uint _380 = clamp(_378, 0u, 65535u);
    float _382 = _372;
    float _384 = _317;
    if (!_327)
    {
        float _386 = _341 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _313 = _386;
    }
    float _388 = _313;
    float _390 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _205);
    if (_339)
    {
        float _392 = _362 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _382 = _392;
    }
    float _394 = _382;
    float _396 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _398 = _394;
    if (!_327)
    {
        float _400 = _364 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _384 = _400;
    }
    float _402 = _384;
    float _404 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    if (!_351)
    {
        float _406 = _368 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _398 = _406;
    }
    float _408 = _398;
    float _410 = rint(_279);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    uint _416 = clamp(_414, 0u, 65535u);
    float _418 = _370 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _420 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _243);
    float _422 = _418;
    if (_339)
    {
        float _424 = _366 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _422 = _424;
    }
    float _426 = _422;
    float _428 = _426;
    if (!_327)
    {
        float _430 = _390 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _307 = _430;
    }
    float _432 = _307;
    float _434 = fma(_396, 0.5, _287);
    float _436 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _249);
    float _438 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _440 = fma(_404, 0.5, _285);
    float _442 = 0.0 + _402;
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = fma(_396, -0.5, _287);
    float _448 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _213);
    float _450 = fma(_404, -0.5, _285);
    float _452 = 0.0 + _408;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _458 = _420 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _460 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _223);
    float _462 = _458;
    if (_339)
    {
        float _464 = _436 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _462 = _464;
    }
    float _466 = _462;
    float _468 = _444 * _438;
    float _470 = _466;
    if (!_351)
    {
        float _472 = _448 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _470 = _472;
    }
    float _474 = _470;
    float _476 = _438 * _454;
    float _478 = _444 * _456;
    if (!_351)
    {
        float _480 = _460 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _428 = _480;
    }
    float _482 = _428;
    float _484 = _456 * _454;
    float _486 = fma(_468, 0.5, _432);
    float _488 = fma(_476, 0.5, _474);
    float _490 = fma(_468, -0.5, _432);
    float _492 = fma(_478, 0.5, _388);
    float _494 = fma(_476, -0.5, _474);
    float3 _1403 = float3(_450, _434, float(int(_360)));
    float3 _1407 = select(_1403, float3(0.0), isnan(_1403));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1407.xy, uint(rint(_1407.z)), 1.0);
    float3 _1415 = float3(_440, _434, float(int(_360)));
    float3 _1417 = select(_1415, float3(0.0), isnan(_1415));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1417.xy, uint(rint(_1417.z)), 1.0);
    float3 _1425 = float3(_440, _446, float(int(_360)));
    float3 _1427 = select(_1425, float3(0.0), isnan(_1425));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1427.xy, uint(rint(_1427.z)), 1.0);
    float3 _1435 = float3(_450, _446, float(int(_360)));
    float3 _1437 = select(_1435, float3(0.0), isnan(_1435));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1437.xy, uint(rint(_1437.z)), 1.0);
    float3 _1445 = float3(_490, _492, float(int(_380)));
    float3 _1447 = select(_1445, float3(0.0), isnan(_1445));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1447.xy, uint(rint(_1447.z)), _444);
    float _506 = fma(_484, 0.5, _482);
    float _508 = fma(_478, -0.5, _388);
    float _510 = fma(_484, -0.5, _482);
    float3 _1465 = float3(_486, _492, float(int(_380)));
    float3 _1467 = select(_1465, float3(0.0), isnan(_1465));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1467.xy, uint(rint(_1467.z)), _444);
    float3 _1476 = float3(_494, _506, float(int(_416)));
    float3 _1478 = select(_1476, float3(0.0), isnan(_1476));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1478.xy, uint(rint(_1478.z)), _454);
    float3 _1487 = float3(_488, _506, float(int(_416)));
    float3 _1489 = select(_1487, float3(0.0), isnan(_1487));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1489.xy, uint(rint(_1489.z)), _454);
    float3 _1498 = float3(_486, _508, float(int(_380)));
    float3 _1500 = select(_1498, float3(0.0), isnan(_1498));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1500.xy, uint(rint(_1500.z)), _444);
    float3 _1509 = float3(_488, _510, float(int(_416)));
    float3 _1511 = select(_1509, float3(0.0), isnan(_1509));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1511.xy, uint(rint(_1511.z)), _454);
    float3 _1520 = float3(_490, _508, float(int(_380)));
    float3 _1522 = select(_1520, float3(0.0), isnan(_1520));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1522.xy, uint(rint(_1522.z)), _444);
    float3 _1531 = float3(_494, _510, float(int(_416)));
    float3 _1533 = select(_1531, float3(0.0), isnan(_1531));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1533.xy, uint(rint(_1533.z)), _454);
    float _526 = -_66;
    float _528 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _530 = _526 + _528;
    float _532 = -_66;
    float _534 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _536 = _532 + _534;
    float _538 = _530 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _540 = precise::clamp(_538, 0.0, 1.0);
    float _542 = _536 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _544 = precise::clamp(_542, 0.0, 1.0);
    float _546 = _498 + _496;
    float _548 = _546 + _500;
    float _550 = _548 + _502;
    float _552 = fma(_550, 0.25, _540);
    float _554 = _512 + _504;
    float _556 = _516 + _514;
    float _558 = _554 + _518;
    float _560 = _556 + _520;
    float _562 = _558 + _522;
    float _564 = _560 + _524;
    float _566 = _562 * 0.25;
    float _568 = _564 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _570 = _568 * 0.25;
    float _572 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[49].z, _570);
    float _574 = _544 + _572;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _552;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _574;
    return out;
}

