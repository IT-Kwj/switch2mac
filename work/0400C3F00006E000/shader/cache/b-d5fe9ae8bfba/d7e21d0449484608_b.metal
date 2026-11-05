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
    bool _114 = false;
    bool _112 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _713 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_713, float2(0.0), isnan(_713))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_713, float2(0.0), isnan(_713))).x;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _58;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = _66 * _60;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _82 = !_74;
    uint _85 = uint(_82 ? 0 : 1);
    uint _87 = 2u;
    if (!_74)
    {
        _87 = 1u;
    }
    uint _89 = _87;
    uint _91 = _89;
    if (!_80)
    {
        _91 = _85;
    }
    uint _93 = _91;
    uint _95 = min(_93, 2u);
    int _98 = int(_95) << 2;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    bool _108 = as_type<int>(_106) == 336;
    if (!_108)
    {
        bool _110 = as_type<int>(_106) == 608;
        _112 = _110;
        if (!_112)
        {
            _114 = true;
        }
    }
    float _148;
    float _150;
    float _152;
    float _154;
    if (!_112)
    {
        if (!_114)
        {
            float _116 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _118 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _116);
            float _126 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _140;
            _152 = _142;
            _154 = _144;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _76 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _158 = _76 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _76 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _76 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].x, _156);
            float _166 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _180;
            _152 = _182;
            _154 = _184;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _76 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _190 = _76 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _76 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _76 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].x, _188);
            float _198 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _212;
            _152 = _214;
            _154 = _216;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = 1.0 / _220;
    float _230 = float(int(_93));
    float _232 = rint(_230);
    float _234 = precise::max(_232, 0.0);
    uint _236 = uint(_234);
    uint _238 = clamp(_236, 0u, 65535u);
    float _240 = _228 * _222;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _228 * _224;
    float _246 = _228 * _226;
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _242;
    float _250 = _248 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _252 = _248 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _254 = fma(_250, -0.5, _244);
    float _256 = fma(_252, 0.5, _246);
    float3 _1137 = float3(_254, _256, float(int(_238)));
    float3 _1141 = select(_1137, float3(0.0), isnan(_1137));
    float _258 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1141.xy, uint(rint(_1141.z)), _242);
    float _260 = -_76;
    float _262 = _260 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _264 = -_68;
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _268 = -_66;
    float _270 = _268 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _272 = _76 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _274 = _262 * _262;
    float _276 = -_66;
    float _278 = _276 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _280 = _76 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _282 = _76 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _284 = fma(_266, _266, _274);
    float _286 = -_68;
    float _288 = _286 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _290 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _280);
    float _292 = _76 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _294 = fma(_278, _278, _284);
    float _296 = -_76;
    float _298 = _296 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _300 = _76 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _302 = _76 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _304 = _76 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _306 = _76 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _308 = sqrt(_294);
    float _310 = _298 * _298;
    float _312 = _76 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _314 = _76 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _316 = fma(_288, _288, _310);
    float _318 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _272);
    float _320 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _282);
    float _322 = _76 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _324 = fma(_270, _270, _316);
    float _326 = _76 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _328 = _76 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _330 = _76 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _332 = _76 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _334 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _290);
    float _336 = sqrt(_324);
    bool _338 = _308 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _340 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _292);
    bool _342 = _308 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _344 = _76 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _346 = !_338;
    int _348 = _346 ? 0 : 1;
    float _350 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _318);
    float _352 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _300);
    float _354 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _344);
    float _356 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _302);
    float _358 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _304);
    float _360 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _326);
    float _362 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _306);
    float _364 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _312);
    int _366 = 2;
    if (!_338)
    {
        _366 = 1;
    }
    int _368 = _366;
    float _370 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _314);
    int _372 = _368;
    if (!_342)
    {
        _372 = _348;
    }
    int _374 = _372;
    float _376 = _76 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _378 = _336 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _380 = _76 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _382 = float(_374);
    float _384 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _376);
    bool _386 = _336 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _388 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _322);
    float _390 = precise::min(_382, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _392 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _328);
    bool _394 = !_378;
    int _396 = _394 ? 0 : 1;
    float _398 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _330);
    bool _400 = _390 != 1.0;
    bool _402 = isnan(_390);
    bool _404 = _400 || _402;
    bool _406 = isnan(1.0);
    bool _408 = _404 || _406;
    float _410 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _332);
    float _412 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _380);
    int _414 = 2;
    if (!_378)
    {
        _414 = 1;
    }
    int _416 = _414;
    float _418 = _334 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _420 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _384);
    int _422 = _416;
    float _424 = _418;
    if (!_386)
    {
        _422 = _396;
    }
    int _426 = _422;
    float _428 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _340);
    float _430 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _320);
    float _432 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _358);
    float _434 = float(_426);
    float _436 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _370);
    if (_408)
    {
        float _438 = _350 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _424 = _438;
    }
    float _440 = _424;
    float _442 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _354);
    float _444 = _420 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _446 = precise::min(_434, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _448 = _428 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _450 = _444;
    float _452 = _448;
    float _454 = _440;
    if (_408)
    {
        float _456 = _430 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _450 = _456;
    }
    float _458 = _450;
    float _460 = _458;
    if (_408)
    {
        float _462 = _442 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _452 = _462;
    }
    float _464 = _452;
    bool _466 = _390 != 0.0;
    bool _468 = isnan(_390);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _398);
    bool _478 = _446 != 1.0;
    bool _480 = isnan(_446);
    bool _482 = _478 || _480;
    bool _484 = isnan(1.0);
    bool _486 = _482 || _484;
    float _488 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _360);
    bool _490 = _446 != 0.0;
    bool _492 = isnan(_446);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _388);
    float _502 = _436 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _504 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _410);
    float _506 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _392);
    float _508 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _362);
    float _510 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _412);
    float _512 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _352);
    float _514 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _516 = _464;
    float _518 = _502;
    if (!_474)
    {
        float _520 = _432 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _516 = _520;
    }
    float _522 = _516;
    float _524 = _500 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _526 = _524;
    if (_486)
    {
        float _528 = _476 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _518 = _528;
    }
    float _530 = _518;
    float _532 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _364);
    float _534 = _530;
    if (!_498)
    {
        float _536 = _488 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _534 = _536;
    }
    float _538 = _534;
    float _540 = 0.0 + _522;
    float _542 = precise::clamp(_540, 0.0, 1.0);
    if (_486)
    {
        float _544 = _504 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _526 = _544;
    }
    float _546 = _526;
    float _548 = _506 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _550 = _546;
    float _552 = _548;
    if (!_498)
    {
        float _554 = _508 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _550 = _554;
    }
    float _556 = _550;
    float _558 = fma(_250, 0.5, _244);
    if (_486)
    {
        float _560 = _510 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _552 = _560;
    }
    float _562 = _552;
    float _564 = _562;
    if (!_474)
    {
        float _566 = _512 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _454 = _566;
    }
    float _568 = _454;
    float _570 = rint(_390);
    float _572 = precise::max(_570, 0.0);
    uint _574 = uint(_572);
    uint _576 = clamp(_574, 0u, 65535u);
    float _578 = _542 * _514;
    if (!_498)
    {
        float _580 = _532 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _564 = _580;
    }
    float _582 = _564;
    float _584 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _356);
    float _586 = fma(_252, -0.5, _246);
    float _588 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _590 = fma(_578, 0.5, _568);
    float _592 = 0.0 + _582;
    float _594 = precise::clamp(_592, 0.0, 1.0);
    float _596 = fma(_578, -0.5, _568);
    if (!_474)
    {
        float _598 = _584 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _460 = _598;
    }
    float _600 = _460;
    float _602 = rint(_446);
    float _604 = precise::max(_602, 0.0);
    uint _606 = uint(_604);
    uint _608 = clamp(_606, 0u, 65535u);
    float _610 = _542 * _588;
    float _612 = _514 * _594;
    float _614 = _588 * _594;
    float _616 = fma(_610, 0.5, _600);
    float _618 = fma(_610, -0.5, _600);
    float _620 = fma(_612, 0.5, _538);
    float _622 = fma(_612, -0.5, _538);
    float _624 = fma(_614, 0.5, _556);
    float _626 = fma(_614, -0.5, _556);
    float3 _1816 = float3(_558, _256, float(int(_238)));
    float3 _1818 = select(_1816, float3(0.0), isnan(_1816));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1818.xy, uint(rint(_1818.z)), _242);
    float3 _1827 = float3(_558, _586, float(int(_238)));
    float3 _1829 = select(_1827, float3(0.0), isnan(_1827));
    float _630 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1829.xy, uint(rint(_1829.z)), _242);
    float3 _1838 = float3(_254, _586, float(int(_238)));
    float3 _1840 = select(_1838, float3(0.0), isnan(_1838));
    float _632 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1840.xy, uint(rint(_1840.z)), _242);
    float3 _1849 = float3(_596, _616, float(int(_576)));
    float3 _1851 = select(_1849, float3(0.0), isnan(_1849));
    float _634 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1851.xy, uint(rint(_1851.z)), _542);
    float3 _1860 = float3(_590, _616, float(int(_576)));
    float3 _1862 = select(_1860, float3(0.0), isnan(_1860));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1862.xy, uint(rint(_1862.z)), _542);
    float3 _1871 = float3(_590, _618, float(int(_576)));
    float3 _1873 = select(_1871, float3(0.0), isnan(_1871));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1873.xy, uint(rint(_1873.z)), _542);
    float3 _1882 = float3(_596, _618, float(int(_576)));
    float3 _1884 = select(_1882, float3(0.0), isnan(_1882));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1884.xy, uint(rint(_1884.z)), _542);
    float3 _1893 = float3(_622, _624, float(int(_608)));
    float3 _1895 = select(_1893, float3(0.0), isnan(_1893));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1895.xy, uint(rint(_1895.z)), _594);
    float3 _1904 = float3(_620, _624, float(int(_608)));
    float3 _1906 = select(_1904, float3(0.0), isnan(_1904));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1906.xy, uint(rint(_1906.z)), _594);
    float3 _1915 = float3(_620, _626, float(int(_608)));
    float3 _1917 = select(_1915, float3(0.0), isnan(_1915));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1917.xy, uint(rint(_1917.z)), _594);
    float3 _1926 = float3(_622, _626, float(int(_608)));
    float3 _1928 = select(_1926, float3(0.0), isnan(_1926));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1928.xy, uint(rint(_1928.z)), _594);
    float2 _1934 = float2(_52, _54);
    float _650 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1934, float2(0.0), isnan(_1934))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1934, float2(0.0), isnan(_1934))).x;
    float _652 = -_66;
    float _654 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _656 = _652 + _654;
    float _658 = -_66;
    float _660 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _662 = _658 + _660;
    float _664 = _656 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _666 = precise::clamp(_664, 0.0, 1.0);
    float _668 = _628 + _258;
    float _670 = _668 + _630;
    float _672 = _670 + _632;
    float _674 = _636 + _634;
    float _676 = fma(_672, 0.25, _666);
    float _678 = _674 + _638;
    float _680 = _644 + _642;
    float _682 = _678 + _640;
    float _684 = _682 * 0.25;
    float _686 = _680 + _646;
    float _688 = _686 + _648;
    float _690 = _688 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _692 = _690 * 0.25;
    float _694 = fma(_684, (*spvDescriptorSet0.fp_c3)._m0[49].z, _692);
    float _696 = _662 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _698 = precise::clamp(_696, 0.0, 1.0);
    float _700 = _694 + _698;
    out.m_45.x = _650;
    out.m_45.y = _676;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _700;
    return out;
}

