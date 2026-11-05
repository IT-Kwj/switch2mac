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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _523 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).x;
    float2 _534 = float2(_52, _54);
    float2 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_534, float2(0.0), isnan(_534))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_534, float2(0.0), isnan(_534))).xy;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = in.m_42.y;
    float _68 = in.m_42.x;
    float _70 = -_56;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _74 = 1.0 / _72;
    float _76 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _78 = _74 * _76;
    float _80 = _78 * _66;
    float _82 = _78 * _68;
    float _84 = -_78;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _88 = -_80;
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _92 = -_82;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _96 = -_80;
    float _98 = _96 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _100 = _80 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _102 = _90 * _90;
    float _104 = _80 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _106 = _98 * _98;
    float _108 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[33].x, _100);
    float _110 = fma(_94, _94, _102);
    float _112 = -_82;
    float _114 = _112 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _116 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _118 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[33].z, _108);
    float _120 = fma(_86, _86, _110);
    float _122 = fma(_114, _114, _106);
    float _124 = -_78;
    float _126 = _124 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _128 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _130 = _80 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _132 = fma(_126, _126, _122);
    float _134 = sqrt(_120);
    float _136 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[18].x, _104);
    float _138 = _80 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _140 = _80 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _142 = _80 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _144 = _80 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _146 = _80 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _148 = _80 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _150 = sqrt(_132);
    float _152 = _80 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _154 = _80 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _156 = _80 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _158 = _80 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _160 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
    float _162 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
    float _164 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
    bool _168 = _134 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _170 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[18].z, _136);
    bool _172 = _134 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _174 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[22].x, _140);
    bool _176 = !_168;
    int _179 = _176 ? 0 : 1;
    float _181 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[16].x, _144);
    float _183 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[17].x, _146);
    float _185 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[25].x, _148);
    bool _187 = _150 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _189 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[26].x, _152);
    bool _191 = _150 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _193 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[28].x, _154);
    bool _195 = !_187;
    int _197 = _195 ? 0 : 1;
    float _199 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[29].x, _156);
    int _201 = 2;
    int _203 = 2;
    if (!_168)
    {
        _201 = 1;
    }
    int _205 = _201;
    float _207 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[31].x, _158);
    int _209 = _205;
    if (!_172)
    {
        _209 = _179;
    }
    int _211 = _209;
    float _213 = _80 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _215 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].z, _160);
    float _217 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].z, _162);
    float _219 = float(_211);
    float _221 = _80 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_187)
    {
        _203 = 1;
    }
    int _223 = _203;
    float _225 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[21].x, _213);
    int _227 = _223;
    if (!_191)
    {
        _227 = _197;
    }
    int _229 = _227;
    float _231 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[24].x, _221);
    float _233 = precise::min(_219, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _235 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[21].z, _225);
    float _237 = float(_229);
    float _239 = _80 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _241 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[24].z, _231);
    float _243 = _235 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _245 = _233 != 1.0;
    bool _247 = isnan(_233);
    bool _249 = _245 || _247;
    bool _251 = isnan(1.0);
    bool _253 = _249 || _251;
    float _255 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[30].x, _239);
    float _257 = precise::min(_237, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _259 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, _164);
    bool _261 = _233 != 0.0;
    bool _263 = isnan(_233);
    bool _265 = _261 || _263;
    bool _267 = isnan(0.0);
    bool _269 = _265 || _267;
    float _271 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[30].z, _255);
    bool _273 = _257 != 1.0;
    bool _275 = isnan(_257);
    bool _277 = _273 || _275;
    bool _279 = isnan(1.0);
    bool _281 = _277 || _279;
    float _283 = _217 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    bool _285 = _257 != 0.0;
    bool _287 = isnan(_257);
    bool _289 = _285 || _287;
    bool _291 = isnan(0.0);
    bool _293 = _289 || _291;
    float _295 = _271 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _297 = _80 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _299 = rint(_257);
    float _301 = precise::max(_299, 0.0);
    uint _304 = uint(_301);
    uint _306 = clamp(_304, 0u, 65535u);
    float _308 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[29].z, _199);
    float _310 = _243;
    float _312 = _295;
    if (_253)
    {
        float _314 = _241 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _310 = _314;
    }
    float _316 = _310;
    float _318 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[3].x, _297);
    float _320 = _80 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _322 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[20].x, _138);
    float _324 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[23].x, _142);
    float _326 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].z, _318);
    float _328 = _316;
    if (_281)
    {
        float _330 = _118 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _312 = _330;
    }
    float _332 = _312;
    float _334 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[27].x, _320);
    float _336 = _80 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _338 = _326 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _340 = _80 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _342 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[27].z, _334);
    float _344 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[19].x, _336);
    float _346 = _332;
    if (!_269)
    {
        float _348 = _170 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _328 = _348;
    }
    float _350 = _328;
    float _352 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[32].x, _340);
    float _354 = 1.0 / _338;
    if (!_293)
    {
        float _356 = _342 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _346 = _356;
    }
    float _358 = _346;
    float _360 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[19].z, _344);
    float _362 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[20].z, _322);
    float _364 = _215 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _366 = _259 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _368 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[32].z, _352);
    float _370 = _360 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _372 = rint(_233);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    uint _378 = clamp(_376, 0u, 65535u);
    float _380 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[28].z, _193);
    float _382 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[26].z, _189);
    float _384 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[23].z, _324);
    float _386 = _362 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _388 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[31].z, _207);
    float _390 = _308 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _392 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[17].z, _183);
    float _394 = _364 * _354;
    float _396 = _283 * _354;
    float _398 = _366 * _354;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[25].z, _185);
    float _404 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[16].z, _181);
    float _406 = _390;
    float _408 = _386;
    float _410 = _370;
    if (_281)
    {
        float _412 = _368 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _406 = _412;
    }
    float _414 = _406;
    float _416 = fma(_62, 2.0, -1.0);
    float _418 = _380 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _420 = _414;
    float _422 = _418;
    if (!_293)
    {
        float _424 = _382 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _420 = _424;
    }
    float _426 = _420;
    float _428 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[22].z, _174);
    if (_253)
    {
        float _430 = _384 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _408 = _430;
    }
    float _432 = _408;
    float _434 = _432;
    if (_281)
    {
        float _436 = _388 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _422 = _436;
    }
    float _438 = _422;
    float _440 = _438;
    if (!_269)
    {
        float _442 = _392 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _434 = _442;
    }
    float _444 = _434;
    if (!_293)
    {
        float _446 = _402 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _440 = _446;
    }
    float _448 = _440;
    float _450 = 0.0 + _358;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = _416 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    if (_253)
    {
        float _456 = _428 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _410 = _456;
    }
    float _458 = _410;
    float _460 = _458;
    if (!_269)
    {
        float _462 = _404 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _460 = _462;
    }
    float _464 = _460;
    float _466 = fma(_64, 2.0, -1.0);
    float _468 = 0.0 + _350;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float3 _1292 = float3(_448, _426, float(int(_306)));
    float3 _1296 = select(_1292, float3(0.0), isnan(_1292));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1296.xy, uint(rint(_1296.z)), _452);
    float _474 = fma(_454, 2.0, _52);
    float _476 = _466 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _1312 = float3(_464, _444, float(int(_378)));
    float3 _1314 = select(_1312, float3(0.0), isnan(_1312));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1314.xy, uint(rint(_1314.z)), _470);
    float _480 = fma(_476, 2.0, _54);
    float3 _1324 = float3(_394, _396, float(0));
    float3 _1326 = select(_1324, float3(0.0), isnan(_1324));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1326.xy, uint(rint(_1326.z)), _400);
    float2 _1332 = float2(_474, _480);
    float _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1332, float2(0.0), isnan(_1332))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1332, float2(0.0), isnan(_1332))).x;
    float _486 = -_78;
    float _488 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _490 = _486 + _488;
    float _492 = -_78;
    float _494 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _496 = _492 + _494;
    float _498 = _490 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = _496 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    float _506 = _472 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _508 = fma(_478, (*spvDescriptorSet0.fp_c3)._m0[49].z, _506);
    float _510 = _500 + _482;
    float _512 = _504 + _508;
    out.m_45.x = _484;
    out.m_45.y = _510;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _512;
    return out;
}

