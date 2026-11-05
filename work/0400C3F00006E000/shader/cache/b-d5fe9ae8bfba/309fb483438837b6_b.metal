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
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = -_62;
    float _70 = _68 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _72 = -_62;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _76 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = -_64;
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _82 = -_66;
    float _84 = _82 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _86 = -_64;
    float _88 = _86 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _92 = _80 * _80;
    float _94 = -_66;
    float _96 = _94 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _98 = _88 * _88;
    float _100 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _90);
    float _102 = fma(_84, _84, _92);
    float _104 = fma(_96, _96, _98);
    float _106 = _100 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _108 = fma(_70, _70, _102);
    float _110 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _112 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _114 = 1.0 / _106;
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _110);
    float _118 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _112);
    float _120 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _116);
    float _122 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _124 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _118);
    float _126 = sqrt(_108);
    float _128 = _120 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _130 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
    float _132 = _124 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _134 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
    float _136 = _128 * _114;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = _132 * _114;
    float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _144 = rint(_138);
    float _146 = precise::max(_144, 0.0);
    uint _149 = uint(_146);
    uint _151 = clamp(_149, 0u, 65535u);
    float _153 = _142 * _114;
    float _155 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _140);
    bool _159 = _126 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _161 = _126 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _163 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _153);
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _167 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _165, _153);
    bool _169 = !_159;
    int _172 = _169 ? 0 : 1;
    float3 _872 = float3(_163, _155, float(int(_151)));
    float3 _876 = select(_872, float3(0.0), isnan(_872));
    float _174 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _876.xy, uint(rint(_876.z)), 1.0);
    float3 _884 = float3(_153, _155, float(int(_151)));
    float3 _886 = select(_884, float3(0.0), isnan(_884));
    float _176 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _886.xy, uint(rint(_886.z)), 1.0);
    int _178 = 2;
    if (!_159)
    {
        _178 = 1;
    }
    int _180 = _178;
    float3 _899 = float3(_167, _155, float(int(_151)));
    float3 _901 = select(_899, float3(0.0), isnan(_899));
    float _182 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _901.xy, uint(rint(_901.z)), 1.0);
    int _184 = _180;
    if (!_161)
    {
        _184 = _172;
    }
    int _186 = _184;
    float _188 = fma(_74, _74, _104);
    float _190 = _64 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _192 = _64 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _194 = float(_186);
    float _196 = _64 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _198 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _190);
    float _200 = _64 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _202 = precise::min(_194, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _204 = _64 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _192);
    float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _196);
    float _210 = sqrt(_188);
    bool _212 = _202 != 1.0;
    bool _214 = isnan(_202);
    bool _216 = _212 || _214;
    bool _218 = isnan(1.0);
    bool _220 = _216 || _218;
    float _222 = _64 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _224 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _200);
    float _226 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _204);
    float _228 = _64 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _230 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[20].z, _206);
    float _232 = _64 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _234 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[19].z, _208);
    float _236 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _222);
    float _238 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[22].z, _224);
    float _240 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _228);
    float _242 = _230 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _244 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _232);
    float _246 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[30].z, _236);
    bool _248 = _210 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _250 = _64 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _252 = _210 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _254 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[23].z, _226);
    float _256 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[18].z, _198);
    float _258 = _234 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _260 = _258;
    float _262 = _242;
    if (_220)
    {
        float _264 = _238 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _260 = _264;
    }
    float _266 = _260;
    float _268 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[21].z, _240);
    float _270 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[24].z, _244);
    float _272 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _250);
    float _274 = _246 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float3 _1100 = float3(_153, _140, float(int(_151)));
    float3 _1102 = select(_1100, float3(0.0), isnan(_1100));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1102.xy, uint(rint(_1102.z)), 1.0);
    float3 _1110 = float3(_163, _140, float(int(_151)));
    float3 _1112 = select(_1110, float3(0.0), isnan(_1110));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1112.xy, uint(rint(_1112.z)), 1.0);
    float _280 = _268 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _282 = _280;
    float _284 = _274;
    float _286 = _266;
    if (_220)
    {
        float _288 = _270 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _282 = _288;
    }
    float _290 = _282;
    float _292 = _64 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _294 = _64 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _296 = _202 != 0.0;
    bool _298 = isnan(_202);
    bool _300 = _296 || _298;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    float _306 = _64 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _308 = _64 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _310 = _64 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _312 = _64 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _314 = _64 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _316 = _64 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _318 = _64 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float3 _1192 = float3(_167, _140, float(int(_151)));
    float3 _1194 = select(_1192, float3(0.0), isnan(_1192));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1194.xy, uint(rint(_1194.z)), 1.0);
    bool _322 = !_248;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _292);
    float _328 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _294);
    float _330 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _306);
    float _332 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _308);
    float _334 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _310);
    float _336 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _312);
    float _338 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _314);
    float _340 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _316);
    float _342 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _318);
    float _344 = _290;
    int _346 = 2;
    if (!_304)
    {
        float _348 = _256 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _344 = _348;
    }
    float _350 = _344;
    if (!_248)
    {
        _346 = 1;
    }
    int _352 = _346;
    float _354 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[31].z, _340);
    int _356 = _352;
    if (!_252)
    {
        _356 = _324;
    }
    int _358 = _356;
    float _360 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[32].z, _272);
    float _362 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[29].z, _338);
    float _364 = float(_358);
    float _366 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _368 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _366, _140);
    float _370 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[28].z, _336);
    float _372 = _362 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _374 = precise::min(_364, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float3 _1312 = float3(_163, _368, float(int(_151)));
    float3 _1314 = select(_1312, float3(0.0), isnan(_1312));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1314.xy, uint(rint(_1314.z)), 1.0);
    float _378 = _372;
    if (_220)
    {
        float _380 = _254 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _262 = _380;
    }
    float _382 = _262;
    float _384 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[33].z, _342);
    bool _386 = _374 != 1.0;
    bool _388 = isnan(_374);
    bool _390 = _386 || _388;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    float _396 = _370 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float3 _1352 = float3(_153, _368, float(int(_151)));
    float3 _1354 = select(_1352, float3(0.0), isnan(_1352));
    float _398 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1354.xy, uint(rint(_1354.z)), 1.0);
    float3 _1362 = float3(_167, _368, float(int(_151)));
    float3 _1364 = select(_1362, float3(0.0), isnan(_1362));
    float _400 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1364.xy, uint(rint(_1364.z)), 1.0);
    float _402 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[16].z, _326);
    float _404 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[17].z, _328);
    float _406 = _396;
    float _408 = _382;
    if (_394)
    {
        float _410 = _360 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _378 = _410;
    }
    float _412 = _378;
    float _414 = _412;
    if (_394)
    {
        float _416 = _384 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _284 = _416;
    }
    float _418 = _284;
    float _420 = _418;
    if (_394)
    {
        float _422 = _354 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _406 = _422;
    }
    float _424 = _406;
    bool _426 = _374 != 0.0;
    bool _428 = isnan(_374);
    bool _430 = _426 || _428;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    float _436 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _438 = _424;
    if (!_304)
    {
        float _440 = _402 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _286 = _440;
    }
    float _442 = _286;
    if (!_304)
    {
        float _444 = _404 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _408 = _444;
    }
    float _446 = _408;
    float _448 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _450 = 0.0 + _350;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[25].z, _330);
    float _456 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[27].z, _334);
    float _458 = rint(_374);
    float _460 = precise::max(_458, 0.0);
    uint _462 = uint(_460);
    uint _464 = clamp(_462, 0u, 65535u);
    float _466 = fma(_452, _448, _446);
    float _468 = rint(_202);
    float _470 = precise::max(_468, 0.0);
    uint _472 = uint(_470);
    uint _474 = clamp(_472, 0u, 65535u);
    if (!_434)
    {
        float _476 = _454 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _438 = _476;
    }
    float _478 = _438;
    if (!_434)
    {
        float _480 = _456 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _420 = _480;
    }
    float _482 = _420;
    float _484 = fma(_452, _436, _442);
    float _486 = _174 + _176;
    float _488 = _486 + _182;
    float _490 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[26].z, _332);
    float3 _1524 = float3(_442, _466, float(int(_474)));
    float3 _1526 = select(_1524, float3(0.0), isnan(_1524));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1526.xy, uint(rint(_1526.z)), _452);
    float _494 = _488 + _278;
    float _496 = _494 + _276;
    float _498 = _496 + _320;
    float _500 = -_436;
    float _502 = fma(_452, _500, _442);
    float3 _1550 = float3(_502, _466, float(int(_474)));
    float3 _1552 = select(_1550, float3(0.0), isnan(_1550));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1552.xy, uint(rint(_1552.z)), _452);
    float3 _1561 = float3(_484, _466, float(int(_474)));
    float3 _1563 = select(_1561, float3(0.0), isnan(_1561));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1563.xy, uint(rint(_1563.z)), _452);
    float3 _1572 = float3(_484, _446, float(int(_474)));
    float3 _1574 = select(_1572, float3(0.0), isnan(_1572));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1574.xy, uint(rint(_1574.z)), _452);
    float3 _1583 = float3(_442, _446, float(int(_474)));
    float3 _1585 = select(_1583, float3(0.0), isnan(_1583));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1585.xy, uint(rint(_1585.z)), _452);
    float3 _1594 = float3(_502, _446, float(int(_474)));
    float3 _1596 = select(_1594, float3(0.0), isnan(_1594));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1596.xy, uint(rint(_1596.z)), _452);
    if (!_434)
    {
        float _514 = _490 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _414 = _514;
    }
    float _516 = _414;
    float _518 = -_448;
    float _520 = fma(_452, _518, _446);
    float _522 = 0.0 + _482;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    float _526 = _498 + _376;
    float _528 = fma(_436, _524, _478);
    float _530 = -_436;
    float _532 = fma(_530, _524, _478);
    float _534 = fma(_448, _524, _516);
    float3 _1642 = float3(_484, _520, float(int(_474)));
    float3 _1644 = select(_1642, float3(0.0), isnan(_1642));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1644.xy, uint(rint(_1644.z)), _452);
    float3 _1653 = float3(_442, _520, float(int(_474)));
    float3 _1655 = select(_1653, float3(0.0), isnan(_1653));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1655.xy, uint(rint(_1655.z)), _452);
    float3 _1664 = float3(_502, _520, float(int(_474)));
    float3 _1666 = select(_1664, float3(0.0), isnan(_1664));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1666.xy, uint(rint(_1666.z)), _452);
    float3 _1675 = float3(_478, _534, float(int(_464)));
    float3 _1677 = select(_1675, float3(0.0), isnan(_1675));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1677.xy, uint(rint(_1677.z)), _524);
    float3 _1686 = float3(_528, _534, float(int(_464)));
    float3 _1688 = select(_1686, float3(0.0), isnan(_1686));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1688.xy, uint(rint(_1688.z)), _524);
    float3 _1697 = float3(_532, _534, float(int(_464)));
    float3 _1699 = select(_1697, float3(0.0), isnan(_1697));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1699.xy, uint(rint(_1699.z)), _524);
    float _548 = -_448;
    float _550 = fma(_548, _524, _516);
    float3 _1714 = float3(_528, _516, float(int(_464)));
    float3 _1716 = select(_1714, float3(0.0), isnan(_1714));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1716.xy, uint(rint(_1716.z)), _524);
    float3 _1725 = float3(_478, _516, float(int(_464)));
    float3 _1727 = select(_1725, float3(0.0), isnan(_1725));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1727.xy, uint(rint(_1727.z)), _524);
    float3 _1736 = float3(_532, _516, float(int(_464)));
    float3 _1738 = select(_1736, float3(0.0), isnan(_1736));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1738.xy, uint(rint(_1738.z)), _524);
    float3 _1747 = float3(_528, _550, float(int(_464)));
    float3 _1749 = select(_1747, float3(0.0), isnan(_1747));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1749.xy, uint(rint(_1749.z)), _524);
    float3 _1758 = float3(_478, _550, float(int(_464)));
    float3 _1760 = select(_1758, float3(0.0), isnan(_1758));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1760.xy, uint(rint(_1760.z)), _524);
    float3 _1769 = float3(_532, _550, float(int(_464)));
    float3 _1771 = select(_1769, float3(0.0), isnan(_1769));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1771.xy, uint(rint(_1771.z)), _524);
    float _564 = _526 + _398;
    float _566 = _564 + _400;
    float _568 = -_62;
    float _570 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _572 = _568 + _570;
    float _574 = _572 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _576 = precise::clamp(_574, 0.0, 1.0);
    float _578 = fma(_566, 0.111111111938953399658203125, _576);
    float _580 = -_62;
    float _582 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _584 = _580 + _582;
    float _586 = _584 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = _506 + _492;
    float _592 = _590 + _504;
    float _594 = _592 + _508;
    float _596 = _594 + _510;
    float _598 = _596 + _512;
    float _600 = _598 + _536;
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
    float _630 = _588 + _628;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _578;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _630;
    return out;
}

