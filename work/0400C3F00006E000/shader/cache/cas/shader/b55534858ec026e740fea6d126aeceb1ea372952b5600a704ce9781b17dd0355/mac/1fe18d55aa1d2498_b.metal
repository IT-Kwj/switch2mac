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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
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
    bool _118 = false;
    bool _116 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _717 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_717, float2(0.0), isnan(_717))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_717, float2(0.0), isnan(_717))).x;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _58;
    float _74 = -_70;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = _70 * _60;
    float _82 = -_70;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _86 = !_78;
    uint _89 = uint(_86 ? 0 : 1);
    uint _91 = 2u;
    if (!_78)
    {
        _91 = 1u;
    }
    uint _93 = _91;
    uint _95 = _93;
    if (!_84)
    {
        _95 = _89;
    }
    uint _97 = _95;
    uint _99 = min(_97, 2u);
    int _102 = int(_99) << 2;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    bool _112 = as_type<int>(_110) == 368;
    if (!_112)
    {
        bool _114 = as_type<int>(_110) == 640;
        _116 = _114;
        if (!_116)
        {
            _118 = true;
        }
    }
    float _152;
    float _154;
    float _156;
    float _158;
    if (!_116)
    {
        if (!_118)
        {
            float _120 = _80 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _80 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _128 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _126);
            float _136 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _134);
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _152 = _150;
            _154 = _144;
            _156 = _146;
            _158 = _148;
        }
    }
    if ((false || _118) || _116)
    {
        if ((!_118) || _116)
        {
            _116 = false;
            float _160 = _80 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _80 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _80 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _80 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _168 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].x, _166);
            float _176 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _174);
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _152 = _190;
            _154 = _184;
            _156 = _186;
            _158 = _188;
        }
        if (false || _118)
        {
            _118 = false;
            float _192 = _80 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _80 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _80 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _80 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _200 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].x, _198);
            float _208 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _206);
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _152 = _222;
            _154 = _216;
            _156 = _218;
            _158 = _220;
        }
    }
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = 1.0 / _224;
    float _234 = float(int(_97));
    float _236 = rint(_234);
    float _238 = precise::max(_236, 0.0);
    uint _240 = uint(_238);
    uint _242 = clamp(_240, 0u, 65535u);
    float _244 = _232 * _226;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _232 * _228;
    float _250 = _232 * _230;
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _246;
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _256 = _252 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _258 = fma(_254, -0.5, _248);
    float _260 = fma(_256, 0.5, _250);
    float3 _1145 = float3(_258, _260, float(int(_242)));
    float3 _1149 = select(_1145, float3(0.0), isnan(_1145));
    float _262 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1149.xy, uint(rint(_1149.z)), _246);
    float _264 = -_80;
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _268 = -_72;
    float _270 = _268 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _272 = -_70;
    float _274 = _272 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _276 = _80 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _278 = _266 * _266;
    float _280 = -_70;
    float _282 = _280 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _284 = _80 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _286 = _80 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _288 = fma(_270, _270, _278);
    float _290 = -_72;
    float _292 = _290 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _294 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _284);
    float _296 = _80 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _298 = fma(_282, _282, _288);
    float _300 = -_80;
    float _302 = _300 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _304 = _80 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _306 = _80 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _308 = _80 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _310 = _80 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _312 = sqrt(_298);
    float _314 = _302 * _302;
    float _316 = _80 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _318 = _80 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _320 = fma(_292, _292, _314);
    float _322 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _276);
    float _324 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _286);
    float _326 = _80 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _328 = fma(_274, _274, _320);
    float _330 = _80 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _332 = _80 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _334 = _80 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _336 = _80 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _338 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _294);
    float _340 = sqrt(_328);
    bool _342 = _312 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _344 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _296);
    bool _346 = _312 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _348 = _80 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _350 = !_342;
    int _352 = _350 ? 0 : 1;
    float _354 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _322);
    float _356 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _304);
    float _358 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _348);
    float _360 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _306);
    float _362 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _308);
    float _364 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _330);
    float _366 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _310);
    float _368 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _316);
    int _370 = 2;
    if (!_342)
    {
        _370 = 1;
    }
    int _372 = _370;
    float _374 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _318);
    int _376 = _372;
    if (!_346)
    {
        _376 = _352;
    }
    int _378 = _376;
    float _380 = _80 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _382 = _340 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _384 = _80 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _386 = float(_378);
    float _388 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _380);
    bool _390 = _340 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _392 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _326);
    float _394 = precise::min(_386, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _396 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _332);
    bool _398 = !_382;
    int _400 = _398 ? 0 : 1;
    float _402 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _334);
    bool _404 = _394 != 1.0;
    bool _406 = isnan(_394);
    bool _408 = _404 || _406;
    bool _410 = isnan(1.0);
    bool _412 = _408 || _410;
    float _414 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _336);
    float _416 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _384);
    int _418 = 2;
    if (!_382)
    {
        _418 = 1;
    }
    int _420 = _418;
    float _422 = _338 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _424 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _388);
    int _426 = _420;
    float _428 = _422;
    if (!_390)
    {
        _426 = _400;
    }
    int _430 = _426;
    float _432 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _344);
    float _434 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _324);
    float _436 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _362);
    float _438 = float(_430);
    float _440 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _374);
    if (_412)
    {
        float _442 = _354 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _428 = _442;
    }
    float _444 = _428;
    float _446 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _358);
    float _448 = _424 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _450 = precise::min(_438, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _452 = _432 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _454 = _448;
    float _456 = _452;
    float _458 = _444;
    if (_412)
    {
        float _460 = _434 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _454 = _460;
    }
    float _462 = _454;
    float _464 = _462;
    if (_412)
    {
        float _466 = _446 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _456 = _466;
    }
    float _468 = _456;
    bool _470 = _394 != 0.0;
    bool _472 = isnan(_394);
    bool _474 = _470 || _472;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    float _480 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _402);
    bool _482 = _450 != 1.0;
    bool _484 = isnan(_450);
    bool _486 = _482 || _484;
    bool _488 = isnan(1.0);
    bool _490 = _486 || _488;
    float _492 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _364);
    bool _494 = _450 != 0.0;
    bool _496 = isnan(_450);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _392);
    float _506 = _440 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _508 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _414);
    float _510 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _396);
    float _512 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _366);
    float _514 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _416);
    float _516 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _356);
    float _518 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _520 = _468;
    float _522 = _506;
    if (!_478)
    {
        float _524 = _436 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _520 = _524;
    }
    float _526 = _520;
    float _528 = _504 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _530 = _528;
    if (_490)
    {
        float _532 = _480 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _522 = _532;
    }
    float _534 = _522;
    float _536 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _368);
    float _538 = _534;
    if (!_502)
    {
        float _540 = _492 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = 0.0 + _526;
    float _546 = precise::clamp(_544, 0.0, 1.0);
    if (_490)
    {
        float _548 = _508 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _530 = _548;
    }
    float _550 = _530;
    float _552 = _510 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _554 = _550;
    float _556 = _552;
    if (!_502)
    {
        float _558 = _512 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _554 = _558;
    }
    float _560 = _554;
    float _562 = fma(_254, 0.5, _248);
    if (_490)
    {
        float _564 = _514 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _556 = _564;
    }
    float _566 = _556;
    float _568 = _566;
    if (!_478)
    {
        float _570 = _516 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _458 = _570;
    }
    float _572 = _458;
    float _574 = rint(_394);
    float _576 = precise::max(_574, 0.0);
    uint _578 = uint(_576);
    uint _580 = clamp(_578, 0u, 65535u);
    float _582 = _546 * _518;
    if (!_502)
    {
        float _584 = _536 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _568 = _584;
    }
    float _586 = _568;
    float _588 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _360);
    float _590 = fma(_256, -0.5, _250);
    float _592 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _594 = fma(_582, 0.5, _572);
    float _596 = 0.0 + _586;
    float _598 = precise::clamp(_596, 0.0, 1.0);
    float _600 = fma(_582, -0.5, _572);
    if (!_478)
    {
        float _602 = _588 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _464 = _602;
    }
    float _604 = _464;
    float _606 = rint(_450);
    float _608 = precise::max(_606, 0.0);
    uint _610 = uint(_608);
    uint _612 = clamp(_610, 0u, 65535u);
    float _614 = _546 * _592;
    float _616 = _518 * _598;
    float _618 = _592 * _598;
    float _620 = fma(_614, 0.5, _604);
    float _622 = fma(_614, -0.5, _604);
    float _624 = fma(_616, 0.5, _542);
    float _626 = fma(_616, -0.5, _542);
    float _628 = fma(_618, 0.5, _560);
    float _630 = fma(_618, -0.5, _560);
    float3 _1824 = float3(_562, _260, float(int(_242)));
    float3 _1826 = select(_1824, float3(0.0), isnan(_1824));
    float _632 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1826.xy, uint(rint(_1826.z)), _246);
    float3 _1835 = float3(_562, _590, float(int(_242)));
    float3 _1837 = select(_1835, float3(0.0), isnan(_1835));
    float _634 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1837.xy, uint(rint(_1837.z)), _246);
    float3 _1846 = float3(_258, _590, float(int(_242)));
    float3 _1848 = select(_1846, float3(0.0), isnan(_1846));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1848.xy, uint(rint(_1848.z)), _246);
    float3 _1857 = float3(_600, _620, float(int(_580)));
    float3 _1859 = select(_1857, float3(0.0), isnan(_1857));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1859.xy, uint(rint(_1859.z)), _546);
    float3 _1868 = float3(_594, _620, float(int(_580)));
    float3 _1870 = select(_1868, float3(0.0), isnan(_1868));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1870.xy, uint(rint(_1870.z)), _546);
    float3 _1879 = float3(_594, _622, float(int(_580)));
    float3 _1881 = select(_1879, float3(0.0), isnan(_1879));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1881.xy, uint(rint(_1881.z)), _546);
    float3 _1890 = float3(_600, _622, float(int(_580)));
    float3 _1892 = select(_1890, float3(0.0), isnan(_1890));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1892.xy, uint(rint(_1892.z)), _546);
    float3 _1901 = float3(_626, _628, float(int(_612)));
    float3 _1903 = select(_1901, float3(0.0), isnan(_1901));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1903.xy, uint(rint(_1903.z)), _598);
    float3 _1912 = float3(_624, _628, float(int(_612)));
    float3 _1914 = select(_1912, float3(0.0), isnan(_1912));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1914.xy, uint(rint(_1914.z)), _598);
    float3 _1923 = float3(_624, _630, float(int(_612)));
    float3 _1925 = select(_1923, float3(0.0), isnan(_1923));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1925.xy, uint(rint(_1925.z)), _598);
    float3 _1934 = float3(_626, _630, float(int(_612)));
    float3 _1936 = select(_1934, float3(0.0), isnan(_1934));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1936.xy, uint(rint(_1936.z)), _598);
    float2 _1942 = float2(_52, _54);
    float _654 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1942, float2(0.0), isnan(_1942))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1942, float2(0.0), isnan(_1942))).x;
    float _656 = -_70;
    float _658 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _660 = _656 + _658;
    float _662 = -_70;
    float _664 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _666 = _662 + _664;
    float _668 = _660 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _670 = precise::clamp(_668, 0.0, 1.0);
    float _672 = _632 + _262;
    float _674 = _672 + _634;
    float _676 = _674 + _636;
    float _678 = _640 + _638;
    float _680 = fma(_676, 0.25, _670);
    float _682 = _678 + _642;
    float _684 = _648 + _646;
    float _686 = _682 + _644;
    float _688 = _686 * 0.25;
    float _690 = _684 + _650;
    float _692 = _690 + _652;
    float _694 = _692 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _696 = _694 * 0.25;
    float _698 = fma(_688, (*spvDescriptorSet0.fp_c3)._m0[49].z, _696);
    float _700 = _666 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _702 = precise::clamp(_700, 0.0, 1.0);
    float _704 = _698 + _702;
    out.m_45.x = _654;
    out.m_45.y = _680;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _704;
    return out;
}

