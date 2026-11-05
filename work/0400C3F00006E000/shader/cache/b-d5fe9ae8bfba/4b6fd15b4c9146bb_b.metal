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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _248 = false;
    bool _298 = false;
    bool _1082 = false;
    bool _982 = false;
    bool _880 = false;
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _1465 = float2(_57, _55);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1465, float2(0.0), isnan(_1465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1465, float2(0.0), isnan(_1465))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    bool _72 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _74 = isnan(0.0);
    bool _76 = _72 || _74;
    bool _78 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _80 = _76 || _78;
    bool _82 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _84 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _86 = _82 || _84;
    bool _88 = isnan(6.0);
    bool _90 = _86 || _88;
    float _92 = _51;
    float _94 = _53;
    float _96 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _98 = _66;
    float _100 = _66;
    if (_80)
    {
        float _102 = _64 * 0.715200006961822509765625;
        _92 = _102;
    }
    float _104 = _92;
    float _106 = _104;
    if (_80)
    {
        float _108 = fma(_62, 0.2125999927520751953125, _104);
        _106 = _108;
    }
    float _110 = _106;
    float _112 = 0.0;
    float _114 = _110;
    if (_80)
    {
        float _116 = fma(_66, 0.072200000286102294921875, _110);
        _112 = _116;
    }
    float _118 = _112;
    if (!_80)
    {
        _114 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _120 = _114;
    float _122 = _118;
    float _124 = _120;
    if (_80)
    {
        float _126 = 1.0 / _118;
        _122 = _126;
    }
    float _128 = _122;
    float _130 = _128;
    if (_80)
    {
        float _132 = _128 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _134 = precise::clamp(_132, 0.0, 1.0);
        _94 = _134;
    }
    float _136 = _94;
    if (_80)
    {
        float _138 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _124 = _138;
    }
    float _140 = _124;
    float _142 = _62 * _140;
    float _144 = _64 * _140;
    float _146 = _66 * _140;
    float _148 = _140;
    float _150 = _140;
    float _152 = _142;
    float _154 = _144;
    float _156 = _146;
    float _242;
    float _244;
    float _246;
    if (!_90)
    {
        float _158 = -_142;
        float _160 = _158 + 1.0;
        float _162 = -_144;
        float _164 = _162 + 1.0;
        float _166 = -_146;
        float _168 = _166 + 1.0;
        float _170 = abs(_160);
        float _172 = log2(_170);
        float _174 = abs(_164);
        float _176 = log2(_174);
        float _178 = abs(_168);
        float _180 = log2(_178);
        float _182 = _172 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _184 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _186 = _176 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _188 = exp2(_182);
        float _190 = _180 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _192 = exp2(_186);
        float _194 = exp2(_190);
        float _196 = fma(_184, _188, 1.0);
        float _198 = fma(_184, _192, 1.0);
        float _200 = 1.0 / _196;
        float _202 = fma(_184, _194, 1.0);
        float _204 = 1.0 / _198;
        float _206 = 1.0 / _202;
        float _208 = _200 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _210 = _204 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _212 = precise::max(_208, _210);
        float _214 = _206 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _216 = precise::max(_214, _212);
        float _218 = -_208;
        float _220 = _218 + _216;
        float _222 = -_210;
        float _224 = _222 + _216;
        float _226 = -_214;
        float _228 = _226 + _216;
        float _230 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[6].w, _208);
        float _232 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[6].w, _210);
        float _234 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[6].w, _214);
        float _236 = _142 * _230;
        float _238 = _144 * _232;
        float _240 = _146 * _234;
        _242 = _236;
        _244 = _238;
        _246 = _240;
        _248 = true;
    }
    else
    {
        bool _250 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_250)
        {
            _96 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _252 = _96;
        bool _254 = !_250;
        float _256 = _252;
        float _286;
        float _288;
        float _296;
        if (!_254)
        {
            float _258 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _260 = _57 + _258;
            float _262 = abs(_260);
            float _264 = _262 * 2560.0;
            bool _266 = _264 >= 2.0;
            bool _268 = isnan(_264);
            bool _270 = _266 || _268;
            bool _272 = isnan(2.0);
            bool _274 = _270 || _272;
            float _276 = _264;
            if (!_274)
            {
                _276 = 0.0;
                _148 = 0.0;
            }
            float _278 = _276;
            float _280 = _148;
            float _282 = _278;
            float _284 = _280;
            _286 = _278;
            _288 = _280;
            if (!_274)
            {
                _98 = 0.0;
            }
            float _290 = _98;
            bool _292 = !_274;
            float _294 = _290;
            _296 = _290;
            _298 = _292;
            if (!_298)
            {
                bool _300 = _57 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_300)
                {
                    _282 = _142;
                }
                float _302 = _282;
                _130 = _302;
                _286 = _302;
                if (_300)
                {
                    _284 = _144;
                }
                float _304 = _284;
                _150 = _304;
                _288 = _304;
                if (_300)
                {
                    _294 = _146;
                }
                float _306 = _294;
                _100 = _306;
                _296 = _306;
                _298 = _300;
                if (!_298)
                {
                    float _308 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _256 = _308;
                }
            }
        }
        if (!_298)
        {
            float _310 = _256;
            float _312 = _130;
            float _314 = _150;
            float _316 = _100;
            bool _318 = _310 != 0.0;
            bool _320 = isnan(_310);
            bool _322 = _318 || _320;
            bool _324 = isnan(0.0);
            bool _326 = _322 || _324;
            float _328 = _312;
            float _330 = _312;
            float _332 = _312;
            float _334 = _314;
            float _336 = _316;
            if (!_326)
            {
                float _338 = _144 * 0.586600005626678466796875;
                float _340 = fma(_142, 0.29890000820159912109375, _338);
                float _342 = fma(_146, 0.1143999993801116943359375, _340);
                float _344 = _342 * (-1.44269502162933349609375);
                float _346 = exp2(_344);
                float _348 = -_346;
                float _350 = _348 + 1.0;
                bool _352 = _350 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _354 = isnan(_350);
                bool _356 = _352 || _354;
                bool _358 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _360 = _356 || _358;
                if (!_360)
                {
                    _328 = _350;
                }
                float _362 = _328;
                bool _364 = !_360;
                float _366 = _362;
                if (!_364)
                {
                    float _368 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _370 = _350 + _368;
                    float _372 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _374 = spvFAdd(_372, 1.00000095367431640625);
                    float _376 = 1.0 / _374;
                    float _378 = _370 * _376;
                    float _380 = -_378;
                    float _382 = _380 + 1.0;
                    float _384 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _386 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _384;
                    float _388 = abs(_382);
                    float _390 = log2(_388);
                    float _392 = _386 * _376;
                    float _394 = _392 + (-1.0);
                    float _396 = _392 * _378;
                    float _398 = _390 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _400 = exp2(_398);
                    float _402 = fma(_394, _400, 1.0);
                    float _404 = 1.0 / _402;
                    float _406 = _396 * _404;
                    float _408 = fma(_374, _406, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _366 = _408;
                }
                float _410 = _366;
                float _412 = -_350;
                float _414 = _412 + _410;
                float _416 = spvFAdd(_342, 9.9999999747524270787835121154785e-07);
                float _418 = _414 + 1.0;
                float _420 = 1.0 / _416;
                float _422 = abs(_418);
                float _424 = log2(_422);
                float _426 = fma(_142, _420, -1.0);
                float _428 = fma(_144, _420, -1.0);
                float _430 = fma(_146, _420, -1.0);
                float _432 = _424 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _434 = exp2(_432);
                float _436 = fma(_434, _426, 1.0);
                float _438 = fma(_434, _428, 1.0);
                float _440 = fma(_434, _430, 1.0);
                float _442 = _436 * _410;
                float _444 = _438 * _410;
                float _446 = _440 * _410;
                float _448 = precise::max(0.0, _442);
                float _450 = precise::max(0.0, _444);
                float _452 = precise::max(0.0, _446);
                float _454 = precise::min(_448, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _456 = precise::min(_450, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _458 = precise::min(_452, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _286 = _454;
                _288 = _456;
                _296 = _458;
                _298 = true;
            }
            else
            {
                bool _460 = _310 != 1.0;
                bool _462 = isnan(_310);
                bool _464 = _460 || _462;
                bool _466 = isnan(1.0);
                bool _468 = _464 || _466;
                if (!_468)
                {
                    bool _470 = _142 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _472 = isnan(_142);
                    bool _474 = _470 || _472;
                    bool _476 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _478 = _474 || _476;
                    float _480 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _482 = spvFAdd(_480, 1.00000095367431640625);
                    bool _484 = _144 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _486 = isnan(_144);
                    bool _488 = _484 || _486;
                    bool _490 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _492 = _488 || _490;
                    bool _494 = _146 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _496 = isnan(_146);
                    bool _498 = _494 || _496;
                    bool _500 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _502 = _498 || _500;
                    float _504 = 1.0 / _482;
                    float _506 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _508 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _506;
                    float _510 = _508 * _504;
                    bool _512 = !_478;
                    if (!_512)
                    {
                        float _514 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _516 = _142 + _514;
                        float _518 = _510 + (-1.0);
                        float _520 = _516 * _504;
                        float _522 = -_520;
                        float _524 = _522 + 1.0;
                        float _526 = _510 * _520;
                        float _528 = abs(_524);
                        float _530 = log2(_528);
                        float _532 = _530 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _534 = exp2(_532);
                        float _536 = fma(_518, _534, 1.0);
                        float _538 = 1.0 / _536;
                        float _540 = _526 * _538;
                        float _542 = fma(_482, _540, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _152 = _542;
                    }
                    float _544 = _152;
                    bool _546 = !_492;
                    if (!_546)
                    {
                        float _548 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _550 = _144 + _548;
                        float _552 = _510 + (-1.0);
                        float _554 = _550 * _504;
                        float _556 = -_554;
                        float _558 = _556 + 1.0;
                        float _560 = _510 * _554;
                        float _562 = abs(_558);
                        float _564 = log2(_562);
                        float _566 = _564 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _568 = exp2(_566);
                        float _570 = fma(_552, _568, 1.0);
                        float _572 = 1.0 / _570;
                        float _574 = _560 * _572;
                        float _576 = fma(_482, _574, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _154 = _576;
                    }
                    float _578 = _154;
                    bool _580 = !_502;
                    if (!_580)
                    {
                        float _582 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _584 = _146 + _582;
                        float _586 = _510 + (-1.0);
                        float _588 = _584 * _504;
                        float _590 = -_588;
                        float _592 = _590 + 1.0;
                        float _594 = _510 * _588;
                        float _596 = abs(_592);
                        float _598 = log2(_596);
                        float _600 = _598 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _602 = exp2(_600);
                        float _604 = fma(_586, _602, 1.0);
                        float _606 = 1.0 / _604;
                        float _608 = _594 * _606;
                        float _610 = fma(_482, _608, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _156 = _610;
                    }
                    float _612 = _156;
                    float _614 = precise::max(0.0, _612);
                    float _616 = precise::max(0.0, _544);
                    float _618 = precise::max(0.0, _578);
                    float _620 = precise::min(_614, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _622 = precise::min(_616, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _624 = precise::min(_618, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _286 = _622;
                    _288 = _624;
                    _296 = _620;
                    _298 = true;
                }
                else
                {
                    bool _626 = _310 != 2.0;
                    bool _628 = isnan(_310);
                    bool _630 = _626 || _628;
                    bool _632 = isnan(2.0);
                    bool _634 = _630 || _632;
                    if (!_634)
                    {
                        float _636 = _144 * 0.715200006961822509765625;
                        float _638 = fma(_142, 0.2125999927520751953125, _636);
                        float _640 = fma(_146, 0.072200000286102294921875, _638);
                        float _642 = spvFAdd(_640, 9.9999999747524270787835121154785e-07);
                        bool _644 = _640 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _646 = isnan(_640);
                        bool _648 = _644 || _646;
                        bool _650 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _652 = _648 || _650;
                        float _654 = 1.0 / _642;
                        bool _656 = !_652;
                        float _658 = _640;
                        if (!_656)
                        {
                            float _660 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _662 = _640 + _660;
                            float _664 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _666 = spvFAdd(_664, 1.00000095367431640625);
                            float _668 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _670 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _668;
                            float _672 = 1.0 / _666;
                            float _674 = _662 * _672;
                            float _676 = _670 * _672;
                            float _678 = -_674;
                            float _680 = _678 + 1.0;
                            float _682 = _676 + (-1.0);
                            float _684 = _676 * _674;
                            float _686 = abs(_680);
                            float _688 = log2(_686);
                            float _690 = _688 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _692 = exp2(_690);
                            float _694 = fma(_682, _692, 1.0);
                            float _696 = 1.0 / _694;
                            float _698 = _684 * _696;
                            float _700 = fma(_666, _698, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _658 = _700;
                        }
                        float _702 = _658;
                        float _704 = precise::max(0.0, _702);
                        float _706 = precise::min(_704, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _708 = _706 * _654;
                        float _710 = _142 * _708;
                        float _712 = _144 * _708;
                        float _714 = _146 * _708;
                        float _716 = precise::max(0.0, _710);
                        float _718 = precise::max(0.0, _712);
                        float _720 = precise::max(0.0, _714);
                        float _722 = precise::min(_716, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _724 = precise::min(_718, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _726 = precise::min(_720, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _286 = _722;
                        _288 = _724;
                        _296 = _726;
                        _298 = true;
                    }
                    else
                    {
                        bool _728 = _310 != 3.0;
                        bool _730 = isnan(_310);
                        bool _732 = _728 || _730;
                        bool _734 = isnan(3.0);
                        bool _736 = _732 || _734;
                        if (!_736)
                        {
                            float _738 = -_142;
                            float _740 = _738 + 1.0;
                            float _742 = -_144;
                            float _744 = _742 + 1.0;
                            float _746 = -_146;
                            float _748 = _746 + 1.0;
                            float _750 = abs(_740);
                            float _752 = log2(_750);
                            float _754 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _756 = abs(_744);
                            float _758 = log2(_756);
                            float _760 = abs(_748);
                            float _762 = log2(_760);
                            float _764 = _752 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _766 = _758 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _768 = exp2(_764);
                            float _770 = _762 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _772 = exp2(_766);
                            float _774 = exp2(_770);
                            float _776 = fma(_754, _768, 1.0);
                            float _778 = fma(_754, _772, 1.0);
                            float _780 = 1.0 / _776;
                            float _782 = fma(_754, _774, 1.0);
                            float _784 = 1.0 / _778;
                            float _786 = 1.0 / _782;
                            float _788 = _780 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _790 = _780 + _784;
                            float _792 = _784 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _794 = _786 + _790;
                            float _796 = _786 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _798 = precise::max(_788, _792);
                            float _800 = _794 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _802 = precise::max(_796, _798);
                            float _804 = _800 * 0.3333333432674407958984375;
                            float _806 = -_804;
                            float _808 = _802 + _806;
                            float _810 = fma(_808, (*spvDescriptorSet0.fp_c3)._m0[7].z, _804);
                            float _812 = -_788;
                            float _814 = _812 + _810;
                            float _816 = -_792;
                            float _818 = _816 + _810;
                            float _820 = -_796;
                            float _822 = _820 + _810;
                            float _824 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[6].w, _788);
                            float _826 = fma(_818, (*spvDescriptorSet0.fp_c3)._m0[6].w, _792);
                            float _828 = fma(_822, (*spvDescriptorSet0.fp_c3)._m0[6].w, _796);
                            float _830 = _142 * _824;
                            float _832 = _144 * _826;
                            float _834 = _146 * _828;
                            _286 = _830;
                            _288 = _832;
                            _296 = _834;
                            _298 = true;
                        }
                        else
                        {
                            bool _836 = _310 != 4.0;
                            bool _838 = isnan(_310);
                            bool _840 = _836 || _838;
                            bool _842 = isnan(4.0);
                            bool _844 = _840 || _842;
                            if (!_844)
                            {
                                bool _846 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _848 = isnan(0.0);
                                bool _850 = _846 || _848;
                                bool _852 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _854 = _850 || _852;
                                float _876;
                                float _878;
                                if (!_854)
                                {
                                    float _856 = -_142;
                                    float _858 = _856 + 1.0;
                                    float _860 = abs(_858);
                                    float _862 = log2(_860);
                                    float _864 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _866 = _862 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _868 = exp2(_866);
                                    float _870 = fma(_864, _868, 1.0);
                                    float _872 = 1.0 / _870;
                                    float _874 = _872 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _876 = _862;
                                    _878 = _874;
                                    _880 = true;
                                }
                                else
                                {
                                    float _882 = spvFAdd(_142, 9.9999999747524270787835121154785e-07);
                                    bool _884 = _142 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _886 = isnan(_142);
                                    bool _888 = _884 || _886;
                                    bool _890 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _892 = _888 || _890;
                                    float _894 = 1.0 / _882;
                                    if (!_892)
                                    {
                                        _330 = _142;
                                    }
                                    float _896 = _330;
                                    bool _898 = !_892;
                                    float _900 = _896;
                                    _876 = _894;
                                    if (!_898)
                                    {
                                        float _902 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _904 = _142 + _902;
                                        float _906 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _908 = spvFAdd(_906, 1.00000095367431640625);
                                        float _910 = 1.0 / _908;
                                        float _912 = _904 * _910;
                                        float _914 = -_912;
                                        float _916 = _914 + 1.0;
                                        float _918 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _920 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _918;
                                        float _922 = abs(_916);
                                        float _924 = log2(_922);
                                        float _926 = _920 * _910;
                                        float _928 = _926 + (-1.0);
                                        float _930 = _926 * _912;
                                        float _932 = _924 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _934 = exp2(_932);
                                        float _936 = fma(_928, _934, 1.0);
                                        float _938 = 1.0 / _936;
                                        float _940 = _930 * _938;
                                        float _942 = fma(_908, _940, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _900 = _942;
                                    }
                                    float _944 = _900;
                                    float _946 = precise::max(0.0, _944);
                                    float _948 = precise::min(_946, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _950 = _948 * _894;
                                    _878 = _950;
                                }
                                _880 = false;
                                float _952 = _876;
                                float _954 = _878;
                                float _956 = _952;
                                float _978;
                                float _980;
                                if (!_854)
                                {
                                    float _958 = -_144;
                                    float _960 = _958 + 1.0;
                                    float _962 = abs(_960);
                                    float _964 = log2(_962);
                                    float _966 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _968 = _964 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _970 = exp2(_968);
                                    float _972 = fma(_966, _970, 1.0);
                                    float _974 = 1.0 / _972;
                                    float _976 = _974 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _978 = _964;
                                    _980 = _976;
                                    _982 = true;
                                }
                                else
                                {
                                    float _984 = spvFAdd(_144, 9.9999999747524270787835121154785e-07);
                                    bool _986 = _144 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _988 = isnan(_144);
                                    bool _990 = _986 || _988;
                                    bool _992 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _994 = _990 || _992;
                                    float _996 = 1.0 / _984;
                                    if (!_994)
                                    {
                                        _956 = _144;
                                    }
                                    float _998 = _956;
                                    bool _1000 = !_994;
                                    float _1002 = _998;
                                    _978 = _996;
                                    if (!_1000)
                                    {
                                        float _1004 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1006 = _144 + _1004;
                                        float _1008 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1010 = spvFAdd(_1008, 1.00000095367431640625);
                                        float _1012 = 1.0 / _1010;
                                        float _1014 = _1006 * _1012;
                                        float _1016 = -_1014;
                                        float _1018 = _1016 + 1.0;
                                        float _1020 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1022 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1020;
                                        float _1024 = abs(_1018);
                                        float _1026 = log2(_1024);
                                        float _1028 = _1022 * _1012;
                                        float _1030 = _1028 + (-1.0);
                                        float _1032 = _1028 * _1014;
                                        float _1034 = _1026 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1036 = exp2(_1034);
                                        float _1038 = fma(_1030, _1036, 1.0);
                                        float _1040 = 1.0 / _1038;
                                        float _1042 = _1032 * _1040;
                                        float _1044 = fma(_1010, _1042, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1002 = _1044;
                                    }
                                    float _1046 = _1002;
                                    float _1048 = precise::max(0.0, _1046);
                                    float _1050 = precise::min(_1048, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1052 = _1050 * _996;
                                    _980 = _1052;
                                }
                                _982 = false;
                                float _1054 = _978;
                                float _1056 = _980;
                                float _1058 = _1054;
                                float _1080;
                                if (!_854)
                                {
                                    float _1060 = -_146;
                                    float _1062 = _1060 + 1.0;
                                    float _1064 = abs(_1062);
                                    float _1066 = log2(_1064);
                                    float _1068 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1070 = _1066 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1072 = exp2(_1070);
                                    float _1074 = fma(_1068, _1072, 1.0);
                                    float _1076 = 1.0 / _1074;
                                    float _1078 = _1076 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1080 = _1078;
                                    _1082 = true;
                                }
                                else
                                {
                                    float _1084 = spvFAdd(_146, 9.9999999747524270787835121154785e-07);
                                    bool _1086 = _146 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1088 = isnan(_146);
                                    bool _1090 = _1086 || _1088;
                                    bool _1092 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1094 = _1090 || _1092;
                                    float _1096 = 1.0 / _1084;
                                    if (!_1094)
                                    {
                                        _1058 = _146;
                                    }
                                    float _1098 = _1058;
                                    bool _1100 = !_1094;
                                    float _1102 = _1098;
                                    if (!_1100)
                                    {
                                        float _1104 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1106 = _146 + _1104;
                                        float _1108 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1110 = spvFAdd(_1108, 1.00000095367431640625);
                                        float _1112 = 1.0 / _1110;
                                        float _1114 = _1106 * _1112;
                                        float _1116 = -_1114;
                                        float _1118 = _1116 + 1.0;
                                        float _1120 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1122 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1120;
                                        float _1124 = abs(_1118);
                                        float _1126 = log2(_1124);
                                        float _1128 = _1122 * _1112;
                                        float _1130 = _1128 + (-1.0);
                                        float _1132 = _1128 * _1114;
                                        float _1134 = _1126 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1136 = exp2(_1134);
                                        float _1138 = fma(_1130, _1136, 1.0);
                                        float _1140 = 1.0 / _1138;
                                        float _1142 = _1132 * _1140;
                                        float _1144 = fma(_1110, _1142, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1102 = _1144;
                                    }
                                    float _1146 = _1102;
                                    float _1148 = precise::max(0.0, _1146);
                                    float _1150 = precise::min(_1148, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1152 = _1150 * _1096;
                                    _1080 = _1152;
                                }
                                _1082 = false;
                                float _1154 = _1080;
                                float _1156 = precise::max(_954, _1056);
                                float _1158 = precise::max(_1156, _1154);
                                float _1160 = -_954;
                                float _1162 = _1158 + _1160;
                                float _1164 = -_1056;
                                float _1166 = _1158 + _1164;
                                float _1168 = -_1154;
                                float _1170 = _1158 + _1168;
                                float _1172 = fma(_1162, (*spvDescriptorSet0.fp_c3)._m0[6].w, _954);
                                float _1174 = fma(_1166, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1056);
                                float _1176 = fma(_1170, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1154);
                                float _1178 = _142 * _1172;
                                float _1180 = _144 * _1174;
                                float _1182 = _146 * _1176;
                                _286 = _1178;
                                _288 = _1180;
                                _296 = _1182;
                                _298 = true;
                            }
                            else
                            {
                                bool _1184 = _310 != 5.0;
                                bool _1186 = isnan(_310);
                                bool _1188 = _1184 || _1186;
                                bool _1190 = isnan(5.0);
                                bool _1192 = _1188 || _1190;
                                if (!_1192)
                                {
                                    _332 = _142;
                                }
                                float _1194 = _332;
                                float _1196 = _1194;
                                _286 = _1194;
                                if (!_1192)
                                {
                                    _334 = _144;
                                }
                                float _1198 = _334;
                                float _1200 = _1198;
                                _288 = _1198;
                                if (!_1192)
                                {
                                    _336 = _146;
                                }
                                float _1202 = _336;
                                bool _1204 = !_1192;
                                float _1206 = _1202;
                                _296 = _1202;
                                if (!_1204)
                                {
                                    bool _1208 = _310 != 6.0;
                                    bool _1210 = isnan(_310);
                                    bool _1212 = _1208 || _1210;
                                    bool _1214 = isnan(6.0);
                                    bool _1216 = _1212 || _1214;
                                    if (!_1216)
                                    {
                                        float _1218 = -_144;
                                        float _1220 = _1218 + 1.0;
                                        float _1222 = -_142;
                                        float _1224 = _1222 + 1.0;
                                        float _1226 = -_146;
                                        float _1228 = _1226 + 1.0;
                                        float _1230 = abs(_1220);
                                        float _1232 = log2(_1230);
                                        float _1234 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1236 = abs(_1224);
                                        float _1238 = log2(_1236);
                                        float _1240 = abs(_1228);
                                        float _1242 = log2(_1240);
                                        float _1244 = _1232 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1246 = _1238 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1248 = exp2(_1244);
                                        float _1250 = _1242 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1252 = exp2(_1246);
                                        float _1254 = exp2(_1250);
                                        float _1256 = fma(_1234, _1248, 1.0);
                                        float _1258 = fma(_1234, _1252, 1.0);
                                        float _1260 = 1.0 / _1256;
                                        float _1262 = fma(_1234, _1254, 1.0);
                                        float _1264 = 1.0 / _1258;
                                        float _1266 = 1.0 / _1262;
                                        float _1268 = _1260 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1270 = _1264 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1272 = precise::max(_1270, _1268);
                                        float _1274 = _1266 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1276 = precise::max(_1274, _1272);
                                        float _1278 = -_1270;
                                        float _1280 = _1278 + _1276;
                                        float _1282 = -_1268;
                                        float _1284 = _1282 + _1276;
                                        float _1286 = -_1274;
                                        float _1288 = _1286 + _1276;
                                        float _1290 = fma(_1280, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1270);
                                        float _1292 = fma(_1284, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1268);
                                        float _1294 = fma(_1288, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1274);
                                        float _1296 = _142 * _1290;
                                        float _1298 = _144 * _1292;
                                        float _1300 = _146 * _1294;
                                        _286 = _1296;
                                        _288 = _1298;
                                        _296 = _1300;
                                        _298 = true;
                                    }
                                    else
                                    {
                                        bool _1302 = _310 != 7.0;
                                        bool _1304 = isnan(_310);
                                        bool _1306 = _1302 || _1304;
                                        bool _1308 = isnan(7.0);
                                        bool _1310 = _1306 || _1308;
                                        if (_1310)
                                        {
                                            _1196 = 0.0;
                                            _1200 = 0.0;
                                        }
                                        float _1312 = _1196;
                                        float _1314 = _1200;
                                        _286 = _1312;
                                        _288 = _1314;
                                        if (_1310)
                                        {
                                            _1206 = 0.0;
                                        }
                                        float _1316 = _1206;
                                        _296 = _1316;
                                        if (!_1310)
                                        {
                                            float _1318 = -_144;
                                            float _1320 = _1318 + 1.0;
                                            float _1322 = -_142;
                                            float _1324 = _1322 + 1.0;
                                            float _1326 = -_146;
                                            float _1328 = _1326 + 1.0;
                                            float _1330 = abs(_1320);
                                            float _1332 = log2(_1330);
                                            float _1334 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1336 = abs(_1324);
                                            float _1338 = log2(_1336);
                                            float _1340 = abs(_1328);
                                            float _1342 = log2(_1340);
                                            float _1344 = _1332 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1346 = _1338 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1348 = exp2(_1344);
                                            float _1350 = _1342 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1352 = exp2(_1346);
                                            float _1354 = exp2(_1350);
                                            float _1356 = fma(_1334, _1348, 1.0);
                                            float _1358 = fma(_1334, _1352, 1.0);
                                            float _1360 = 1.0 / _1356;
                                            float _1362 = fma(_1334, _1354, 1.0);
                                            float _1364 = 1.0 / _1358;
                                            float _1366 = 1.0 / _1362;
                                            float _1368 = _1360 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1370 = _1364 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1372 = -_142;
                                            float _1374 = fma(_142, _1370, _1372);
                                            float _1376 = -_144;
                                            float _1378 = fma(_144, _1368, _1376);
                                            float _1380 = _1366 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1382 = _1374 + _1378;
                                            float _1384 = -_146;
                                            float _1386 = fma(_146, _1380, _1384);
                                            float _1388 = _1386 + _1382;
                                            float _1390 = -_1374;
                                            float _1392 = fma(_1388, 0.3333333432674407958984375, _1390);
                                            float _1394 = -_1378;
                                            float _1396 = fma(_1388, 0.3333333432674407958984375, _1394);
                                            float _1398 = -_1386;
                                            float _1400 = fma(_1388, 0.3333333432674407958984375, _1398);
                                            float _1402 = fma(_1392, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1374);
                                            float _1404 = fma(_1396, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1378);
                                            float _1406 = fma(_1400, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1386);
                                            float _1408 = _142 + _1402;
                                            float _1410 = _144 + _1404;
                                            float _1412 = _146 + _1406;
                                            _286 = _1408;
                                            _288 = _1410;
                                            _296 = _1412;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _298 = false;
        float _1414 = _286;
        float _1416 = _288;
        float _1418 = _296;
        _242 = _1414;
        _244 = _1416;
        _246 = _1418;
    }
    _248 = false;
    float _1420 = _242;
    float _1422 = _244;
    float _1424 = _246;
    float _1426 = _1420 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1428 = _1422 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1430 = _1424 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_32.x = _1426;
    out.m_32.y = _1428;
    out.m_32.z = _1430;
    out.m_32.w = _68;
    return out;
}

