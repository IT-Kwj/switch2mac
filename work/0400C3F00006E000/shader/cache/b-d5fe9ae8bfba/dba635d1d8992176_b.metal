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
    float2 _646 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_646, float2(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_646, float2(0.0), isnan(_646))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _56;
    float _72 = _68 * _58;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _78 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _74);
    float _82 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _76);
    float _84 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _82);
    float _90 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _84);
    float _92 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _94 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _94);
    float _102 = 1.0 / _92;
    float _104 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _100);
    float _106 = _104 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _108 = _96 * _102;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _106 * _102;
    float _114 = _98 * _102;
    float _116 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _118 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _120 = fma(_110, _116, _112);
    float _122 = -_116;
    float _124 = fma(_110, _122, _112);
    float _126 = fma(_110, _118, _114);
    float _128 = -_118;
    float _130 = fma(_110, _128, _114);
    float3 _806 = float3(_120, _126, float(0));
    float3 _810 = select(_806, float3(0.0), isnan(_806));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _810.xy, uint(rint(_810.z)), _110);
    float3 _817 = float3(_112, _126, float(0));
    float3 _819 = select(_817, float3(0.0), isnan(_817));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _819.xy, uint(rint(_819.z)), _110);
    float3 _826 = float3(_124, _126, float(0));
    float3 _828 = select(_826, float3(0.0), isnan(_826));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _828.xy, uint(rint(_828.z)), _110);
    float3 _835 = float3(_120, _114, float(0));
    float3 _837 = select(_835, float3(0.0), isnan(_835));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _837.xy, uint(rint(_837.z)), _110);
    float3 _844 = float3(_112, _114, float(0));
    float3 _846 = select(_844, float3(0.0), isnan(_844));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _846.xy, uint(rint(_846.z)), _110);
    float3 _853 = float3(_124, _114, float(0));
    float3 _855 = select(_853, float3(0.0), isnan(_853));
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _855.xy, uint(rint(_855.z)), _110);
    float3 _862 = float3(_120, _130, float(0));
    float3 _864 = select(_862, float3(0.0), isnan(_862));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _864.xy, uint(rint(_864.z)), _110);
    float3 _871 = float3(_112, _130, float(0));
    float3 _873 = select(_871, float3(0.0), isnan(_871));
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _873.xy, uint(rint(_873.z)), _110);
    float3 _880 = float3(_124, _130, float(0));
    float3 _882 = select(_880, float3(0.0), isnan(_880));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _882.xy, uint(rint(_882.z)), _110);
    float _150 = -_70;
    float _152 = _150 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _154 = -_70;
    float _156 = _154 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _158 = -_72;
    float _160 = _158 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _162 = -_72;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _166 = _152 * _152;
    float _168 = _156 * _156;
    float _170 = -_68;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _174 = fma(_160, _160, _166);
    float _176 = fma(_164, _164, _168);
    float _178 = _70 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _180 = _70 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _182 = fma(_172, _172, _174);
    float _184 = -_68;
    float _186 = _184 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _188 = _70 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _190 = _70 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _192 = _70 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _194 = fma(_186, _186, _176);
    float _196 = sqrt(_182);
    float _198 = _70 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _200 = _70 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _202 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _190);
    float _204 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _178);
    float _206 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _180);
    float _208 = _70 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _210 = sqrt(_194);
    float _212 = _70 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _214 = _70 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _216 = _70 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _218 = _70 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _220 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _192);
    float _222 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _198);
    float _224 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _200);
    bool _228 = _196 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _230 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _206);
    bool _232 = _196 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _234 = _70 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _236 = !_228;
    int _239 = _236 ? 0 : 1;
    float _241 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _202);
    float _243 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _204);
    float _245 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _222);
    bool _247 = _210 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _249 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _220);
    bool _251 = _210 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _253 = _70 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _255 = !_247;
    int _257 = _255 ? 0 : 1;
    float _259 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _224);
    int _261 = 2;
    int _263 = 2;
    if (!_228)
    {
        _261 = 1;
    }
    int _265 = _261;
    float _267 = _243 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    int _269 = _265;
    float _271 = _267;
    if (!_232)
    {
        _269 = _239;
    }
    int _273 = _269;
    float _275 = _70 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _277 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _212);
    float _279 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _214);
    float _281 = float(_273);
    float _283 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _253);
    if (!_247)
    {
        _263 = 1;
    }
    int _285 = _263;
    float _287 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _218);
    float _289 = precise::min(_281, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _291 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _208);
    int _293 = _285;
    if (!_251)
    {
        _293 = _257;
    }
    int _295 = _293;
    float _297 = _70 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    bool _299 = _289 != 1.0;
    bool _301 = isnan(_289);
    bool _303 = _299 || _301;
    bool _305 = isnan(1.0);
    bool _307 = _303 || _305;
    float _309 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _234);
    bool _311 = _289 != 0.0;
    bool _313 = isnan(_289);
    bool _315 = _311 || _313;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    float _321 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _297);
    float _323 = float(_295);
    float _325 = rint(_289);
    float _327 = precise::max(_325, 0.0);
    uint _330 = uint(_327);
    uint _332 = clamp(_330, 0u, 65535u);
    float _334 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _277);
    float _336 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _279);
    float _338 = precise::min(_323, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _340 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _287);
    float _342 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _309);
    float _344 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _291);
    bool _346 = _338 != 1.0;
    bool _348 = isnan(_338);
    bool _350 = _346 || _348;
    bool _352 = isnan(1.0);
    bool _354 = _350 || _352;
    float _356 = _336 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _358 = _334 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _360 = _358;
    float _362 = _356;
    if (_354)
    {
        float _364 = _342 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _360 = _364;
    }
    float _366 = _360;
    float _368 = _132 + _134;
    float _370 = _70 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _372 = _368 + _136;
    float _374 = _70 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _376 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _370);
    float _378 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _188);
    float _380 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _275);
    float _382 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _374);
    float _384 = _372 + _138;
    float _386 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _378);
    float _388 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _380);
    float _390 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _382);
    float _392 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _216);
    float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _396 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _321);
    float _398 = _230 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _400 = _241 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _402 = _384 + _140;
    float _404 = _398;
    float _406 = _400;
    float _408 = _394;
    float _410 = _366;
    if (_307)
    {
        float _412 = _245 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _404 = _412;
    }
    float _414 = _404;
    float _416 = _414;
    if (_307)
    {
        float _418 = _249 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _406 = _418;
    }
    float _420 = _406;
    float _422 = _420;
    if (_307)
    {
        float _424 = _390 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _271 = _424;
    }
    float _426 = _271;
    float _428 = _426;
    if (!_319)
    {
        float _430 = _396 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _416 = _430;
    }
    float _432 = _416;
    if (!_319)
    {
        float _434 = _259 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _422 = _434;
    }
    float _436 = _422;
    if (!_319)
    {
        float _438 = _388 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _428 = _438;
    }
    float _440 = _428;
    bool _442 = _338 != 0.0;
    bool _444 = isnan(_338);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _402 + _142;
    float _454 = 0.0 + _432;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _460 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _462 = _452 + _144;
    float _464 = rint(_338);
    float _466 = precise::max(_464, 0.0);
    uint _468 = uint(_466);
    uint _470 = clamp(_468, 0u, 65535u);
    float _472 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _392);
    float _474 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _283);
    float _476 = _462 + _146;
    float _478 = fma(_456, _458, _436);
    float _480 = -_458;
    float _482 = fma(_456, _480, _436);
    float _484 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _376);
    float _486 = fma(_456, _460, _440);
    if (_354)
    {
        float _488 = _340 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _408 = _488;
    }
    float _490 = _408;
    float _492 = _490;
    if (_354)
    {
        float _494 = _472 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _362 = _494;
    }
    float _496 = _362;
    float _498 = _496;
    if (!_450)
    {
        float _500 = _344 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _492 = _500;
    }
    float _502 = _492;
    float3 _1528 = float3(_478, _440, float(int(_332)));
    float3 _1530 = select(_1528, float3(0.0), isnan(_1528));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1530.xy, uint(rint(_1530.z)), _456);
    float3 _1539 = float3(_436, _486, float(int(_332)));
    float3 _1541 = select(_1539, float3(0.0), isnan(_1539));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1541.xy, uint(rint(_1541.z)), _456);
    float3 _1550 = float3(_482, _486, float(int(_332)));
    float3 _1552 = select(_1550, float3(0.0), isnan(_1550));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1552.xy, uint(rint(_1552.z)), _456);
    float3 _1561 = float3(_478, _486, float(int(_332)));
    float3 _1563 = select(_1561, float3(0.0), isnan(_1561));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1563.xy, uint(rint(_1563.z)), _456);
    if (!_450)
    {
        float _512 = _484 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _410 = _512;
    }
    float _514 = _410;
    float _516 = -_460;
    float _518 = fma(_456, _516, _440);
    float3 _1588 = float3(_436, _440, float(int(_332)));
    float3 _1590 = select(_1588, float3(0.0), isnan(_1588));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1590.xy, uint(rint(_1590.z)), _456);
    float3 _1599 = float3(_482, _440, float(int(_332)));
    float3 _1601 = select(_1599, float3(0.0), isnan(_1599));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1601.xy, uint(rint(_1601.z)), _456);
    float3 _1610 = float3(_478, _518, float(int(_332)));
    float3 _1612 = select(_1610, float3(0.0), isnan(_1610));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1612.xy, uint(rint(_1612.z)), _456);
    if (!_450)
    {
        float _526 = _474 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _498 = _526;
    }
    float _528 = _498;
    float _530 = _476 + _148;
    float _532 = 0.0 + _502;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = fma(_460, _534, _528);
    float _538 = fma(_458, _534, _514);
    float3 _1646 = float3(_436, _518, float(int(_332)));
    float3 _1648 = select(_1646, float3(0.0), isnan(_1646));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1648.xy, uint(rint(_1648.z)), _456);
    float _542 = -_458;
    float _544 = fma(_542, _534, _514);
    float3 _1663 = float3(_482, _518, float(int(_332)));
    float3 _1665 = select(_1663, float3(0.0), isnan(_1663));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1665.xy, uint(rint(_1665.z)), _456);
    float3 _1674 = float3(_514, _536, float(int(_470)));
    float3 _1676 = select(_1674, float3(0.0), isnan(_1674));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1676.xy, uint(rint(_1676.z)), _534);
    float3 _1685 = float3(_538, _536, float(int(_470)));
    float3 _1687 = select(_1685, float3(0.0), isnan(_1685));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1687.xy, uint(rint(_1687.z)), _534);
    float3 _1696 = float3(_544, _536, float(int(_470)));
    float3 _1698 = select(_1696, float3(0.0), isnan(_1696));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1698.xy, uint(rint(_1698.z)), _534);
    float3 _1707 = float3(_538, _528, float(int(_470)));
    float3 _1709 = select(_1707, float3(0.0), isnan(_1707));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1709.xy, uint(rint(_1709.z)), _534);
    float _556 = -_460;
    float _558 = fma(_556, _534, _528);
    float3 _1724 = float3(_514, _528, float(int(_470)));
    float3 _1726 = select(_1724, float3(0.0), isnan(_1724));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1726.xy, uint(rint(_1726.z)), _534);
    float3 _1735 = float3(_544, _528, float(int(_470)));
    float3 _1737 = select(_1735, float3(0.0), isnan(_1735));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1737.xy, uint(rint(_1737.z)), _534);
    float3 _1746 = float3(_538, _558, float(int(_470)));
    float3 _1748 = select(_1746, float3(0.0), isnan(_1746));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1748.xy, uint(rint(_1748.z)), _534);
    float3 _1757 = float3(_514, _558, float(int(_470)));
    float3 _1759 = select(_1757, float3(0.0), isnan(_1757));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1759.xy, uint(rint(_1759.z)), _534);
    float3 _1768 = float3(_544, _558, float(int(_470)));
    float3 _1770 = select(_1768, float3(0.0), isnan(_1768));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1770.xy, uint(rint(_1770.z)), _534);
    float2 _1776 = float2(_50, _52);
    float _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1776, float2(0.0), isnan(_1776))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1776, float2(0.0), isnan(_1776))).x;
    float _572 = -_68;
    float _574 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _576 = _572 + _574;
    float _578 = _576 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    float _582 = -_68;
    float _584 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _586 = _582 + _584;
    float _588 = fma(_530, 0.111111111938953399658203125, _580);
    float _590 = _586 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _592 = precise::clamp(_590, 0.0, 1.0);
    float _594 = _510 + _506;
    float _596 = _594 + _508;
    float _598 = _596 + _504;
    float _600 = _598 + _520;
    float _602 = _600 + _522;
    float _604 = _602 + _524;
    float _606 = _604 + _540;
    float _608 = _606 + _546;
    float _610 = _550 + _548;
    float _612 = _608 * 0.111111111938953399658203125;
    float _614 = _610 + _552;
    float _616 = _614 + _554;
    float _618 = _616 + _560;
    float _620 = _618 + _562;
    float _622 = _620 + _564;
    float _624 = _622 + _566;
    float _626 = _624 + _568;
    float _628 = _626 * 0.111111111938953399658203125;
    float _630 = _628 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _632 = fma(_612, (*spvDescriptorSet0.fp_c3)._m0[49].z, _630);
    float _634 = _592 + _632;
    out.m_43.x = _570;
    out.m_43.y = _588;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _634;
    return out;
}

