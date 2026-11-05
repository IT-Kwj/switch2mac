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
    bool _314 = false;
    bool _364 = false;
    bool _1154 = false;
    bool _1054 = false;
    bool _952 = false;
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
    float2 _1537 = float2(_57, _55);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1537, float2(0.0), isnan(_1537))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1537, float2(0.0), isnan(_1537))).xyzw;
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
    if (_80)
    {
        float _130 = _128 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _132 = precise::clamp(_130, 0.0, 1.0);
        _94 = _132;
    }
    float _134 = _94;
    if (_80)
    {
        float _136 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _124 = _136;
    }
    float _138 = _124;
    float _140 = _62 * _138;
    float _142 = _64 * _138;
    float _144 = _66 * _138;
    float _146 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _148 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _150 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _152 = _140 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _154 = isnan(_140);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _160 = _156 || _158;
    bool _162 = _142 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _164 = isnan(_142);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _170 = _166 || _168;
    float _172 = exp2(_146);
    bool _174 = _144 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _176 = isnan(_144);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _182 = _178 || _180;
    float _184 = exp2(_148);
    float _186 = exp2(_150);
    float _188 = -_172;
    float _190 = _188 + 1.0;
    bool _192 = !_160;
    float _194 = _192 ? _140 : _190;
    float _196 = -_184;
    float _198 = _196 + 1.0;
    bool _200 = !_170;
    float _202 = _200 ? _142 : _198;
    float _204 = -_186;
    float _206 = _204 + 1.0;
    bool _208 = !_182;
    float _210 = _208 ? _144 : _206;
    float _212 = _186;
    float _214 = _198;
    float _216 = _186;
    float _218 = _194;
    float _220 = _202;
    float _222 = _210;
    float _308;
    float _310;
    float _312;
    if (!_90)
    {
        float _224 = -_194;
        float _226 = _224 + 1.0;
        float _228 = -_202;
        float _230 = _228 + 1.0;
        float _232 = -_210;
        float _234 = _232 + 1.0;
        float _236 = abs(_226);
        float _238 = log2(_236);
        float _240 = abs(_230);
        float _242 = log2(_240);
        float _244 = abs(_234);
        float _246 = log2(_244);
        float _248 = _238 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _250 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _252 = _242 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _254 = exp2(_248);
        float _256 = _246 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _258 = exp2(_252);
        float _260 = exp2(_256);
        float _262 = fma(_250, _254, 1.0);
        float _264 = fma(_250, _258, 1.0);
        float _266 = 1.0 / _262;
        float _268 = fma(_250, _260, 1.0);
        float _270 = 1.0 / _264;
        float _272 = 1.0 / _268;
        float _274 = _266 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _276 = _270 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _278 = precise::max(_274, _276);
        float _280 = _272 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _282 = precise::max(_280, _278);
        float _284 = -_274;
        float _286 = _284 + _282;
        float _288 = -_276;
        float _290 = _288 + _282;
        float _292 = -_280;
        float _294 = _292 + _282;
        float _296 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].w, _274);
        float _298 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[6].w, _276);
        float _300 = fma(_294, (*spvDescriptorSet0.fp_c3)._m0[6].w, _280);
        float _302 = _194 * _296;
        float _304 = _202 * _298;
        float _306 = _210 * _300;
        _308 = _302;
        _310 = _304;
        _312 = _306;
        _314 = true;
    }
    else
    {
        bool _316 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_316)
        {
            _96 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _318 = _96;
        bool _320 = !_316;
        float _322 = _318;
        float _352;
        float _354;
        float _362;
        if (!_320)
        {
            float _324 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _326 = _57 + _324;
            float _328 = abs(_326);
            float _330 = _328 * 2560.0;
            bool _332 = _330 >= 2.0;
            bool _334 = isnan(_330);
            bool _336 = _332 || _334;
            bool _338 = isnan(2.0);
            bool _340 = _336 || _338;
            float _342 = _330;
            if (!_340)
            {
                _342 = 0.0;
                _212 = 0.0;
            }
            float _344 = _342;
            float _346 = _212;
            float _348 = _344;
            float _350 = _346;
            _352 = _344;
            _354 = _346;
            if (!_340)
            {
                _98 = 0.0;
            }
            float _356 = _98;
            bool _358 = !_340;
            float _360 = _356;
            _362 = _356;
            _364 = _358;
            if (!_364)
            {
                bool _366 = _57 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_366)
                {
                    _348 = _194;
                }
                float _368 = _348;
                _214 = _368;
                _352 = _368;
                if (_366)
                {
                    _350 = _202;
                }
                float _370 = _350;
                _216 = _370;
                _354 = _370;
                if (_366)
                {
                    _360 = _210;
                }
                float _372 = _360;
                _100 = _372;
                _362 = _372;
                _364 = _366;
                if (!_364)
                {
                    float _374 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _322 = _374;
                }
            }
        }
        if (!_364)
        {
            float _376 = _322;
            float _378 = _214;
            float _380 = _216;
            float _382 = _100;
            bool _384 = _376 != 0.0;
            bool _386 = isnan(_376);
            bool _388 = _384 || _386;
            bool _390 = isnan(0.0);
            bool _392 = _388 || _390;
            float _394 = _378;
            float _396 = _378;
            float _398 = _380;
            float _400 = _382;
            if (!_392)
            {
                float _402 = _142 * 0.586600005626678466796875;
                float _404 = fma(_140, 0.29890000820159912109375, _402);
                float _406 = fma(_144, 0.1143999993801116943359375, _404);
                float _408 = _406 * (-1.44269502162933349609375);
                float _410 = exp2(_408);
                float _412 = -_410;
                float _414 = _412 + 1.0;
                bool _416 = _414 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _418 = isnan(_414);
                bool _420 = _416 || _418;
                bool _422 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _424 = _420 || _422;
                float _426 = _406;
                if (!_424)
                {
                    _426 = _414;
                }
                float _428 = _426;
                bool _430 = !_424;
                float _432 = _428;
                if (!_430)
                {
                    float _434 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _436 = _414 + _434;
                    float _438 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _440 = spvFAdd(_438, 1.00000095367431640625);
                    float _442 = 1.0 / _440;
                    float _444 = _436 * _442;
                    float _446 = -_444;
                    float _448 = _446 + 1.0;
                    float _450 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _452 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _450;
                    float _454 = abs(_448);
                    float _456 = log2(_454);
                    float _458 = _452 * _442;
                    float _460 = _458 + (-1.0);
                    float _462 = _458 * _444;
                    float _464 = _456 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _466 = exp2(_464);
                    float _468 = fma(_460, _466, 1.0);
                    float _470 = 1.0 / _468;
                    float _472 = _462 * _470;
                    float _474 = fma(_440, _472, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _432 = _474;
                }
                float _476 = _432;
                float _478 = -_414;
                float _480 = _478 + _476;
                float _482 = _202 * 0.586600005626678466796875;
                float _484 = _480 + 1.0;
                float _486 = fma(_194, 0.29890000820159912109375, _482);
                float _488 = fma(_210, 0.1143999993801116943359375, _486);
                float _490 = abs(_484);
                float _492 = log2(_490);
                float _494 = spvFAdd(_488, 9.9999999747524270787835121154785e-07);
                float _496 = 1.0 / _494;
                float _498 = _492 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _500 = exp2(_498);
                float _502 = fma(_194, _496, -1.0);
                float _504 = fma(_202, _496, -1.0);
                float _506 = fma(_210, _496, -1.0);
                float _508 = fma(_500, _502, 1.0);
                float _510 = fma(_500, _504, 1.0);
                float _512 = fma(_500, _506, 1.0);
                float _514 = _508 * _476;
                float _516 = _510 * _476;
                float _518 = _512 * _476;
                float _520 = precise::max(0.0, _514);
                float _522 = precise::max(0.0, _516);
                float _524 = precise::max(0.0, _518);
                float _526 = precise::min(_520, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _528 = precise::min(_522, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _530 = precise::min(_524, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _352 = _526;
                _354 = _528;
                _362 = _530;
                _364 = true;
            }
            else
            {
                bool _532 = _376 != 1.0;
                bool _534 = isnan(_376);
                bool _536 = _532 || _534;
                bool _538 = isnan(1.0);
                bool _540 = _536 || _538;
                if (!_540)
                {
                    bool _542 = _194 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _544 = isnan(_194);
                    bool _546 = _542 || _544;
                    bool _548 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _550 = _546 || _548;
                    float _552 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _554 = spvFAdd(_552, 1.00000095367431640625);
                    bool _556 = _202 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _558 = isnan(_202);
                    bool _560 = _556 || _558;
                    bool _562 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _564 = _560 || _562;
                    bool _566 = _210 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _568 = isnan(_210);
                    bool _570 = _566 || _568;
                    bool _572 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _574 = _570 || _572;
                    float _576 = 1.0 / _554;
                    float _578 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _580 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _578;
                    float _582 = _580 * _576;
                    bool _584 = !_550;
                    if (!_584)
                    {
                        float _586 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _588 = _194 + _586;
                        float _590 = _582 + (-1.0);
                        float _592 = _588 * _576;
                        float _594 = -_592;
                        float _596 = _594 + 1.0;
                        float _598 = _582 * _592;
                        float _600 = abs(_596);
                        float _602 = log2(_600);
                        float _604 = _602 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _606 = exp2(_604);
                        float _608 = fma(_590, _606, 1.0);
                        float _610 = 1.0 / _608;
                        float _612 = _598 * _610;
                        float _614 = fma(_554, _612, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _218 = _614;
                    }
                    float _616 = _218;
                    bool _618 = !_564;
                    if (!_618)
                    {
                        float _620 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _622 = _202 + _620;
                        float _624 = _582 + (-1.0);
                        float _626 = _622 * _576;
                        float _628 = -_626;
                        float _630 = _628 + 1.0;
                        float _632 = _582 * _626;
                        float _634 = abs(_630);
                        float _636 = log2(_634);
                        float _638 = _636 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _640 = exp2(_638);
                        float _642 = fma(_624, _640, 1.0);
                        float _644 = 1.0 / _642;
                        float _646 = _632 * _644;
                        float _648 = fma(_554, _646, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _220 = _648;
                    }
                    float _650 = _220;
                    bool _652 = !_574;
                    if (!_652)
                    {
                        float _654 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _656 = _210 + _654;
                        float _658 = _582 + (-1.0);
                        float _660 = _656 * _576;
                        float _662 = -_660;
                        float _664 = _662 + 1.0;
                        float _666 = _582 * _660;
                        float _668 = abs(_664);
                        float _670 = log2(_668);
                        float _672 = _670 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _674 = exp2(_672);
                        float _676 = fma(_658, _674, 1.0);
                        float _678 = 1.0 / _676;
                        float _680 = _666 * _678;
                        float _682 = fma(_554, _680, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _222 = _682;
                    }
                    float _684 = _222;
                    float _686 = precise::max(0.0, _684);
                    float _688 = precise::max(0.0, _616);
                    float _690 = precise::max(0.0, _650);
                    float _692 = precise::min(_686, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _694 = precise::min(_688, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _696 = precise::min(_690, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _352 = _694;
                    _354 = _696;
                    _362 = _692;
                    _364 = true;
                }
                else
                {
                    bool _698 = _376 != 2.0;
                    bool _700 = isnan(_376);
                    bool _702 = _698 || _700;
                    bool _704 = isnan(2.0);
                    bool _706 = _702 || _704;
                    if (!_706)
                    {
                        float _708 = _202 * 0.715200006961822509765625;
                        float _710 = fma(_194, 0.2125999927520751953125, _708);
                        float _712 = fma(_210, 0.072200000286102294921875, _710);
                        float _714 = spvFAdd(_712, 9.9999999747524270787835121154785e-07);
                        bool _716 = _712 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _718 = isnan(_712);
                        bool _720 = _716 || _718;
                        bool _722 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _724 = _720 || _722;
                        float _726 = 1.0 / _714;
                        bool _728 = !_724;
                        float _730 = _712;
                        if (!_728)
                        {
                            float _732 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _734 = _712 + _732;
                            float _736 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _738 = spvFAdd(_736, 1.00000095367431640625);
                            float _740 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _742 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _740;
                            float _744 = 1.0 / _738;
                            float _746 = _734 * _744;
                            float _748 = _742 * _744;
                            float _750 = -_746;
                            float _752 = _750 + 1.0;
                            float _754 = _748 + (-1.0);
                            float _756 = _748 * _746;
                            float _758 = abs(_752);
                            float _760 = log2(_758);
                            float _762 = _760 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _764 = exp2(_762);
                            float _766 = fma(_754, _764, 1.0);
                            float _768 = 1.0 / _766;
                            float _770 = _756 * _768;
                            float _772 = fma(_738, _770, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _730 = _772;
                        }
                        float _774 = _730;
                        float _776 = precise::max(0.0, _774);
                        float _778 = precise::min(_776, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _780 = _778 * _726;
                        float _782 = _194 * _780;
                        float _784 = _202 * _780;
                        float _786 = _210 * _780;
                        float _788 = precise::max(0.0, _782);
                        float _790 = precise::max(0.0, _784);
                        float _792 = precise::max(0.0, _786);
                        float _794 = precise::min(_788, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _796 = precise::min(_790, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _798 = precise::min(_792, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _352 = _794;
                        _354 = _796;
                        _362 = _798;
                        _364 = true;
                    }
                    else
                    {
                        bool _800 = _376 != 3.0;
                        bool _802 = isnan(_376);
                        bool _804 = _800 || _802;
                        bool _806 = isnan(3.0);
                        bool _808 = _804 || _806;
                        if (!_808)
                        {
                            float _810 = -_194;
                            float _812 = _810 + 1.0;
                            float _814 = -_202;
                            float _816 = _814 + 1.0;
                            float _818 = -_210;
                            float _820 = _818 + 1.0;
                            float _822 = abs(_812);
                            float _824 = log2(_822);
                            float _826 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _828 = abs(_816);
                            float _830 = log2(_828);
                            float _832 = abs(_820);
                            float _834 = log2(_832);
                            float _836 = _824 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _838 = _830 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _840 = exp2(_836);
                            float _842 = _834 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _844 = exp2(_838);
                            float _846 = exp2(_842);
                            float _848 = fma(_826, _840, 1.0);
                            float _850 = fma(_826, _844, 1.0);
                            float _852 = 1.0 / _848;
                            float _854 = fma(_826, _846, 1.0);
                            float _856 = 1.0 / _850;
                            float _858 = 1.0 / _854;
                            float _860 = _852 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _862 = _852 + _856;
                            float _864 = _856 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _866 = _858 + _862;
                            float _868 = _858 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _870 = precise::max(_860, _864);
                            float _872 = _866 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _874 = precise::max(_868, _870);
                            float _876 = _872 * 0.3333333432674407958984375;
                            float _878 = -_876;
                            float _880 = _874 + _878;
                            float _882 = fma(_880, (*spvDescriptorSet0.fp_c3)._m0[7].z, _876);
                            float _884 = -_860;
                            float _886 = _884 + _882;
                            float _888 = -_864;
                            float _890 = _888 + _882;
                            float _892 = -_868;
                            float _894 = _892 + _882;
                            float _896 = fma(_886, (*spvDescriptorSet0.fp_c3)._m0[6].w, _860);
                            float _898 = fma(_890, (*spvDescriptorSet0.fp_c3)._m0[6].w, _864);
                            float _900 = fma(_894, (*spvDescriptorSet0.fp_c3)._m0[6].w, _868);
                            float _902 = _194 * _896;
                            float _904 = _202 * _898;
                            float _906 = _210 * _900;
                            _352 = _902;
                            _354 = _904;
                            _362 = _906;
                            _364 = true;
                        }
                        else
                        {
                            bool _908 = _376 != 4.0;
                            bool _910 = isnan(_376);
                            bool _912 = _908 || _910;
                            bool _914 = isnan(4.0);
                            bool _916 = _912 || _914;
                            if (!_916)
                            {
                                bool _918 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _920 = isnan(0.0);
                                bool _922 = _918 || _920;
                                bool _924 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _926 = _922 || _924;
                                float _948;
                                float _950;
                                if (!_926)
                                {
                                    float _928 = -_194;
                                    float _930 = _928 + 1.0;
                                    float _932 = abs(_930);
                                    float _934 = log2(_932);
                                    float _936 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _938 = _934 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _940 = exp2(_938);
                                    float _942 = fma(_936, _940, 1.0);
                                    float _944 = 1.0 / _942;
                                    float _946 = _944 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _948 = _934;
                                    _950 = _946;
                                    _952 = true;
                                }
                                else
                                {
                                    float _954 = spvFAdd(_194, 9.9999999747524270787835121154785e-07);
                                    bool _956 = _194 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _958 = isnan(_194);
                                    bool _960 = _956 || _958;
                                    bool _962 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _964 = _960 || _962;
                                    float _966 = 1.0 / _954;
                                    if (!_964)
                                    {
                                        _394 = _194;
                                    }
                                    float _968 = _394;
                                    bool _970 = !_964;
                                    float _972 = _968;
                                    _948 = _966;
                                    if (!_970)
                                    {
                                        float _974 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _976 = _194 + _974;
                                        float _978 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _980 = spvFAdd(_978, 1.00000095367431640625);
                                        float _982 = 1.0 / _980;
                                        float _984 = _976 * _982;
                                        float _986 = -_984;
                                        float _988 = _986 + 1.0;
                                        float _990 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _992 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _990;
                                        float _994 = abs(_988);
                                        float _996 = log2(_994);
                                        float _998 = _992 * _982;
                                        float _1000 = _998 + (-1.0);
                                        float _1002 = _998 * _984;
                                        float _1004 = _996 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1006 = exp2(_1004);
                                        float _1008 = fma(_1000, _1006, 1.0);
                                        float _1010 = 1.0 / _1008;
                                        float _1012 = _1002 * _1010;
                                        float _1014 = fma(_980, _1012, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _972 = _1014;
                                    }
                                    float _1016 = _972;
                                    float _1018 = precise::max(0.0, _1016);
                                    float _1020 = precise::min(_1018, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1022 = _1020 * _966;
                                    _950 = _1022;
                                }
                                _952 = false;
                                float _1024 = _948;
                                float _1026 = _950;
                                float _1028 = _1024;
                                float _1050;
                                float _1052;
                                if (!_926)
                                {
                                    float _1030 = -_202;
                                    float _1032 = _1030 + 1.0;
                                    float _1034 = abs(_1032);
                                    float _1036 = log2(_1034);
                                    float _1038 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1040 = _1036 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1042 = exp2(_1040);
                                    float _1044 = fma(_1038, _1042, 1.0);
                                    float _1046 = 1.0 / _1044;
                                    float _1048 = _1046 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1050 = _1036;
                                    _1052 = _1048;
                                    _1054 = true;
                                }
                                else
                                {
                                    float _1056 = spvFAdd(_202, 9.9999999747524270787835121154785e-07);
                                    bool _1058 = _202 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1060 = isnan(_202);
                                    bool _1062 = _1058 || _1060;
                                    bool _1064 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1066 = _1062 || _1064;
                                    float _1068 = 1.0 / _1056;
                                    if (!_1066)
                                    {
                                        _1028 = _202;
                                    }
                                    float _1070 = _1028;
                                    bool _1072 = !_1066;
                                    float _1074 = _1070;
                                    _1050 = _1068;
                                    if (!_1072)
                                    {
                                        float _1076 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1078 = _202 + _1076;
                                        float _1080 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1082 = spvFAdd(_1080, 1.00000095367431640625);
                                        float _1084 = 1.0 / _1082;
                                        float _1086 = _1078 * _1084;
                                        float _1088 = -_1086;
                                        float _1090 = _1088 + 1.0;
                                        float _1092 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1094 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1092;
                                        float _1096 = abs(_1090);
                                        float _1098 = log2(_1096);
                                        float _1100 = _1094 * _1084;
                                        float _1102 = _1100 + (-1.0);
                                        float _1104 = _1100 * _1086;
                                        float _1106 = _1098 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1108 = exp2(_1106);
                                        float _1110 = fma(_1102, _1108, 1.0);
                                        float _1112 = 1.0 / _1110;
                                        float _1114 = _1104 * _1112;
                                        float _1116 = fma(_1082, _1114, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1074 = _1116;
                                    }
                                    float _1118 = _1074;
                                    float _1120 = precise::max(0.0, _1118);
                                    float _1122 = precise::min(_1120, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1124 = _1122 * _1068;
                                    _1052 = _1124;
                                }
                                _1054 = false;
                                float _1126 = _1050;
                                float _1128 = _1052;
                                float _1130 = _1126;
                                float _1152;
                                if (!_926)
                                {
                                    float _1132 = -_210;
                                    float _1134 = _1132 + 1.0;
                                    float _1136 = abs(_1134);
                                    float _1138 = log2(_1136);
                                    float _1140 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1142 = _1138 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1144 = exp2(_1142);
                                    float _1146 = fma(_1140, _1144, 1.0);
                                    float _1148 = 1.0 / _1146;
                                    float _1150 = _1148 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1152 = _1150;
                                    _1154 = true;
                                }
                                else
                                {
                                    float _1156 = spvFAdd(_210, 9.9999999747524270787835121154785e-07);
                                    bool _1158 = _210 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1160 = isnan(_210);
                                    bool _1162 = _1158 || _1160;
                                    bool _1164 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1166 = _1162 || _1164;
                                    float _1168 = 1.0 / _1156;
                                    if (!_1166)
                                    {
                                        _1130 = _210;
                                    }
                                    float _1170 = _1130;
                                    bool _1172 = !_1166;
                                    float _1174 = _1170;
                                    if (!_1172)
                                    {
                                        float _1176 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1178 = _210 + _1176;
                                        float _1180 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1182 = spvFAdd(_1180, 1.00000095367431640625);
                                        float _1184 = 1.0 / _1182;
                                        float _1186 = _1178 * _1184;
                                        float _1188 = -_1186;
                                        float _1190 = _1188 + 1.0;
                                        float _1192 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1194 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1192;
                                        float _1196 = abs(_1190);
                                        float _1198 = log2(_1196);
                                        float _1200 = _1194 * _1184;
                                        float _1202 = _1200 + (-1.0);
                                        float _1204 = _1200 * _1186;
                                        float _1206 = _1198 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1208 = exp2(_1206);
                                        float _1210 = fma(_1202, _1208, 1.0);
                                        float _1212 = 1.0 / _1210;
                                        float _1214 = _1204 * _1212;
                                        float _1216 = fma(_1182, _1214, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1174 = _1216;
                                    }
                                    float _1218 = _1174;
                                    float _1220 = precise::max(0.0, _1218);
                                    float _1222 = precise::min(_1220, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1224 = _1222 * _1168;
                                    _1152 = _1224;
                                }
                                _1154 = false;
                                float _1226 = _1152;
                                float _1228 = precise::max(_1026, _1128);
                                float _1230 = precise::max(_1228, _1226);
                                float _1232 = -_1026;
                                float _1234 = _1230 + _1232;
                                float _1236 = -_1128;
                                float _1238 = _1230 + _1236;
                                float _1240 = -_1226;
                                float _1242 = _1230 + _1240;
                                float _1244 = fma(_1234, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1026);
                                float _1246 = fma(_1238, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1128);
                                float _1248 = fma(_1242, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1226);
                                float _1250 = _194 * _1244;
                                float _1252 = _202 * _1246;
                                float _1254 = _210 * _1248;
                                _352 = _1250;
                                _354 = _1252;
                                _362 = _1254;
                                _364 = true;
                            }
                            else
                            {
                                bool _1256 = _376 != 5.0;
                                bool _1258 = isnan(_376);
                                bool _1260 = _1256 || _1258;
                                bool _1262 = isnan(5.0);
                                bool _1264 = _1260 || _1262;
                                if (!_1264)
                                {
                                    _396 = _140;
                                }
                                float _1266 = _396;
                                float _1268 = _1266;
                                _352 = _1266;
                                if (!_1264)
                                {
                                    _398 = _142;
                                }
                                float _1270 = _398;
                                float _1272 = _1270;
                                _354 = _1270;
                                if (!_1264)
                                {
                                    _400 = _144;
                                }
                                float _1274 = _400;
                                bool _1276 = !_1264;
                                float _1278 = _1274;
                                _362 = _1274;
                                if (!_1276)
                                {
                                    bool _1280 = _376 != 6.0;
                                    bool _1282 = isnan(_376);
                                    bool _1284 = _1280 || _1282;
                                    bool _1286 = isnan(6.0);
                                    bool _1288 = _1284 || _1286;
                                    if (!_1288)
                                    {
                                        float _1290 = -_202;
                                        float _1292 = _1290 + 1.0;
                                        float _1294 = -_194;
                                        float _1296 = _1294 + 1.0;
                                        float _1298 = -_210;
                                        float _1300 = _1298 + 1.0;
                                        float _1302 = abs(_1292);
                                        float _1304 = log2(_1302);
                                        float _1306 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1308 = abs(_1296);
                                        float _1310 = log2(_1308);
                                        float _1312 = abs(_1300);
                                        float _1314 = log2(_1312);
                                        float _1316 = _1304 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1318 = _1310 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1320 = exp2(_1316);
                                        float _1322 = _1314 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1324 = exp2(_1318);
                                        float _1326 = exp2(_1322);
                                        float _1328 = fma(_1306, _1320, 1.0);
                                        float _1330 = fma(_1306, _1324, 1.0);
                                        float _1332 = 1.0 / _1328;
                                        float _1334 = fma(_1306, _1326, 1.0);
                                        float _1336 = 1.0 / _1330;
                                        float _1338 = 1.0 / _1334;
                                        float _1340 = _1332 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1342 = _1336 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1344 = precise::max(_1342, _1340);
                                        float _1346 = _1338 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1348 = precise::max(_1346, _1344);
                                        float _1350 = -_1342;
                                        float _1352 = _1350 + _1348;
                                        float _1354 = -_1340;
                                        float _1356 = _1354 + _1348;
                                        float _1358 = -_1346;
                                        float _1360 = _1358 + _1348;
                                        float _1362 = fma(_1352, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1342);
                                        float _1364 = fma(_1356, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1340);
                                        float _1366 = fma(_1360, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1346);
                                        float _1368 = _194 * _1362;
                                        float _1370 = _202 * _1364;
                                        float _1372 = _210 * _1366;
                                        _352 = _1368;
                                        _354 = _1370;
                                        _362 = _1372;
                                        _364 = true;
                                    }
                                    else
                                    {
                                        bool _1374 = _376 != 7.0;
                                        bool _1376 = isnan(_376);
                                        bool _1378 = _1374 || _1376;
                                        bool _1380 = isnan(7.0);
                                        bool _1382 = _1378 || _1380;
                                        if (_1382)
                                        {
                                            _1268 = 0.0;
                                            _1272 = 0.0;
                                        }
                                        float _1384 = _1268;
                                        float _1386 = _1272;
                                        _352 = _1384;
                                        _354 = _1386;
                                        if (_1382)
                                        {
                                            _1278 = 0.0;
                                        }
                                        float _1388 = _1278;
                                        _362 = _1388;
                                        if (!_1382)
                                        {
                                            float _1390 = -_202;
                                            float _1392 = _1390 + 1.0;
                                            float _1394 = -_194;
                                            float _1396 = _1394 + 1.0;
                                            float _1398 = -_210;
                                            float _1400 = _1398 + 1.0;
                                            float _1402 = abs(_1392);
                                            float _1404 = log2(_1402);
                                            float _1406 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1408 = abs(_1396);
                                            float _1410 = log2(_1408);
                                            float _1412 = abs(_1400);
                                            float _1414 = log2(_1412);
                                            float _1416 = _1404 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1418 = _1410 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1420 = exp2(_1416);
                                            float _1422 = _1414 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1424 = exp2(_1418);
                                            float _1426 = exp2(_1422);
                                            float _1428 = fma(_1406, _1420, 1.0);
                                            float _1430 = fma(_1406, _1424, 1.0);
                                            float _1432 = 1.0 / _1428;
                                            float _1434 = fma(_1406, _1426, 1.0);
                                            float _1436 = 1.0 / _1430;
                                            float _1438 = 1.0 / _1434;
                                            float _1440 = _1432 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1442 = _1436 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1444 = -_194;
                                            float _1446 = fma(_194, _1442, _1444);
                                            float _1448 = -_202;
                                            float _1450 = fma(_202, _1440, _1448);
                                            float _1452 = _1438 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1454 = _1446 + _1450;
                                            float _1456 = -_210;
                                            float _1458 = fma(_210, _1452, _1456);
                                            float _1460 = _1458 + _1454;
                                            float _1462 = -_1446;
                                            float _1464 = fma(_1460, 0.3333333432674407958984375, _1462);
                                            float _1466 = -_1450;
                                            float _1468 = fma(_1460, 0.3333333432674407958984375, _1466);
                                            float _1470 = -_1458;
                                            float _1472 = fma(_1460, 0.3333333432674407958984375, _1470);
                                            float _1474 = fma(_1464, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1446);
                                            float _1476 = fma(_1468, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1450);
                                            float _1478 = fma(_1472, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1458);
                                            float _1480 = _194 + _1474;
                                            float _1482 = _202 + _1476;
                                            float _1484 = _210 + _1478;
                                            _352 = _1480;
                                            _354 = _1482;
                                            _362 = _1484;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _364 = false;
        float _1486 = _352;
        float _1488 = _354;
        float _1490 = _362;
        _308 = _1486;
        _310 = _1488;
        _312 = _1490;
    }
    _314 = false;
    float _1492 = _308;
    float _1494 = _310;
    float _1496 = _312;
    float _1498 = _1492 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1500 = _1494 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1502 = _1496 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_32.x = _1498;
    out.m_32.y = _1500;
    out.m_32.z = _1502;
    out.m_32.w = _68;
    return out;
}

