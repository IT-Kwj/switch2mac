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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _264 = false;
    bool _314 = false;
    bool _1098 = false;
    bool _998 = false;
    bool _896 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _63 = _59 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float2 _1491 = float2(_59, _57);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1491, float2(0.0), isnan(_1491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1491, float2(0.0), isnan(_1491))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float2 _1510 = float2(_63, _61);
    float3 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1510, float2(0.0), isnan(_1510))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1510, float2(0.0), isnan(_1510))).xyz;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    bool _88 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _90 = isnan(0.0);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _96 = _92 || _94;
    bool _98 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _100 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _102 = _98 || _100;
    bool _104 = isnan(6.0);
    bool _106 = _102 || _104;
    float _108 = _53;
    float _110 = _55;
    float _112 = _84;
    float _114 = _72;
    float _116 = _72;
    if (_96)
    {
        float _118 = _70 * 0.715200006961822509765625;
        _108 = _118;
    }
    float _120 = _108;
    float _122 = _120;
    if (_96)
    {
        float _124 = fma(_68, 0.2125999927520751953125, _120);
        _122 = _124;
    }
    float _126 = _122;
    float _128 = 0.0;
    float _130 = _126;
    if (_96)
    {
        float _132 = fma(_72, 0.072200000286102294921875, _126);
        _128 = _132;
    }
    float _134 = _128;
    if (!_96)
    {
        _130 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _136 = _130;
    float _138 = _134;
    float _140 = _136;
    if (_96)
    {
        float _142 = 1.0 / _134;
        _138 = _142;
    }
    float _144 = _138;
    float _146 = _144;
    if (_96)
    {
        float _148 = _144 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _150 = precise::clamp(_148, 0.0, 1.0);
        _110 = _150;
    }
    float _152 = _110;
    if (_96)
    {
        float _154 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _140 = _154;
    }
    float _156 = _140;
    float _158 = fma(_68, _156, _80);
    float _160 = fma(_70, _156, _82);
    float _162 = fma(_72, _156, _84);
    float _164 = _156;
    float _166 = _156;
    float _168 = _158;
    float _170 = _160;
    float _172 = _162;
    float _258;
    float _260;
    float _262;
    if (!_106)
    {
        float _174 = -_158;
        float _176 = _174 + 1.0;
        float _178 = -_160;
        float _180 = _178 + 1.0;
        float _182 = -_162;
        float _184 = _182 + 1.0;
        float _186 = abs(_176);
        float _188 = log2(_186);
        float _190 = abs(_180);
        float _192 = log2(_190);
        float _194 = abs(_184);
        float _196 = log2(_194);
        float _198 = _188 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _200 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _202 = _192 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _204 = exp2(_198);
        float _206 = _196 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _208 = exp2(_202);
        float _210 = exp2(_206);
        float _212 = fma(_200, _204, 1.0);
        float _214 = fma(_200, _208, 1.0);
        float _216 = 1.0 / _212;
        float _218 = fma(_200, _210, 1.0);
        float _220 = 1.0 / _214;
        float _222 = 1.0 / _218;
        float _224 = _216 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _228 = precise::max(_224, _226);
        float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _232 = precise::max(_230, _228);
        float _234 = -_224;
        float _236 = _234 + _232;
        float _238 = -_226;
        float _240 = _238 + _232;
        float _242 = -_230;
        float _244 = _242 + _232;
        float _246 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[6].w, _224);
        float _248 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[6].w, _226);
        float _250 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[6].w, _230);
        float _252 = _158 * _246;
        float _254 = _160 * _248;
        float _256 = _162 * _250;
        _258 = _252;
        _260 = _254;
        _262 = _256;
        _264 = true;
    }
    else
    {
        bool _266 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_266)
        {
            _112 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _268 = _112;
        bool _270 = !_266;
        float _272 = _268;
        float _302;
        float _304;
        float _312;
        if (!_270)
        {
            float _274 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _276 = _59 + _274;
            float _278 = abs(_276);
            float _280 = _278 * 2560.0;
            bool _282 = _280 >= 2.0;
            bool _284 = isnan(_280);
            bool _286 = _282 || _284;
            bool _288 = isnan(2.0);
            bool _290 = _286 || _288;
            float _292 = _280;
            if (!_290)
            {
                _292 = 0.0;
                _164 = 0.0;
            }
            float _294 = _292;
            float _296 = _164;
            float _298 = _294;
            float _300 = _296;
            _302 = _294;
            _304 = _296;
            if (!_290)
            {
                _114 = 0.0;
            }
            float _306 = _114;
            bool _308 = !_290;
            float _310 = _306;
            _312 = _306;
            _314 = _308;
            if (!_314)
            {
                bool _316 = _59 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_316)
                {
                    _298 = _158;
                }
                float _318 = _298;
                _146 = _318;
                _302 = _318;
                if (_316)
                {
                    _300 = _160;
                }
                float _320 = _300;
                _166 = _320;
                _304 = _320;
                if (_316)
                {
                    _310 = _162;
                }
                float _322 = _310;
                _116 = _322;
                _312 = _322;
                _314 = _316;
                if (!_314)
                {
                    float _324 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _272 = _324;
                }
            }
        }
        if (!_314)
        {
            float _326 = _272;
            float _328 = _146;
            float _330 = _166;
            float _332 = _116;
            bool _334 = _326 != 0.0;
            bool _336 = isnan(_326);
            bool _338 = _334 || _336;
            bool _340 = isnan(0.0);
            bool _342 = _338 || _340;
            float _344 = _328;
            float _346 = _328;
            float _348 = _328;
            float _350 = _330;
            float _352 = _332;
            if (!_342)
            {
                float _354 = _160 * 0.586600005626678466796875;
                float _356 = fma(_158, 0.29890000820159912109375, _354);
                float _358 = fma(_162, 0.1143999993801116943359375, _356);
                float _360 = _358 * (-1.44269502162933349609375);
                float _362 = exp2(_360);
                float _364 = -_362;
                float _366 = _364 + 1.0;
                bool _368 = _366 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _370 = isnan(_366);
                bool _372 = _368 || _370;
                bool _374 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _376 = _372 || _374;
                if (!_376)
                {
                    _344 = _366;
                }
                float _378 = _344;
                bool _380 = !_376;
                float _382 = _378;
                if (!_380)
                {
                    float _384 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _386 = _366 + _384;
                    float _388 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _390 = spvFAdd(_388, 1.00000095367431640625);
                    float _392 = 1.0 / _390;
                    float _394 = _386 * _392;
                    float _396 = -_394;
                    float _398 = _396 + 1.0;
                    float _400 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _402 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _400;
                    float _404 = abs(_398);
                    float _406 = log2(_404);
                    float _408 = _402 * _392;
                    float _410 = _408 + (-1.0);
                    float _412 = _408 * _394;
                    float _414 = _406 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _416 = exp2(_414);
                    float _418 = fma(_410, _416, 1.0);
                    float _420 = 1.0 / _418;
                    float _422 = _412 * _420;
                    float _424 = fma(_390, _422, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _382 = _424;
                }
                float _426 = _382;
                float _428 = -_366;
                float _430 = _428 + _426;
                float _432 = spvFAdd(_358, 9.9999999747524270787835121154785e-07);
                float _434 = _430 + 1.0;
                float _436 = 1.0 / _432;
                float _438 = abs(_434);
                float _440 = log2(_438);
                float _442 = fma(_158, _436, -1.0);
                float _444 = fma(_160, _436, -1.0);
                float _446 = fma(_162, _436, -1.0);
                float _448 = _440 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _450 = exp2(_448);
                float _452 = fma(_450, _442, 1.0);
                float _454 = fma(_450, _444, 1.0);
                float _456 = fma(_450, _446, 1.0);
                float _458 = _452 * _426;
                float _460 = _454 * _426;
                float _462 = _456 * _426;
                float _464 = precise::max(0.0, _458);
                float _466 = precise::max(0.0, _460);
                float _468 = precise::max(0.0, _462);
                float _470 = precise::min(_464, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _472 = precise::min(_466, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _474 = precise::min(_468, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _302 = _470;
                _304 = _472;
                _312 = _474;
                _314 = true;
            }
            else
            {
                bool _476 = _326 != 1.0;
                bool _478 = isnan(_326);
                bool _480 = _476 || _478;
                bool _482 = isnan(1.0);
                bool _484 = _480 || _482;
                if (!_484)
                {
                    bool _486 = _158 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _488 = isnan(_158);
                    bool _490 = _486 || _488;
                    bool _492 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _494 = _490 || _492;
                    float _496 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _498 = spvFAdd(_496, 1.00000095367431640625);
                    bool _500 = _160 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _502 = isnan(_160);
                    bool _504 = _500 || _502;
                    bool _506 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _508 = _504 || _506;
                    bool _510 = _162 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _512 = isnan(_162);
                    bool _514 = _510 || _512;
                    bool _516 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _518 = _514 || _516;
                    float _520 = 1.0 / _498;
                    float _522 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _524 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _522;
                    float _526 = _524 * _520;
                    bool _528 = !_494;
                    if (!_528)
                    {
                        float _530 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _532 = _158 + _530;
                        float _534 = _526 + (-1.0);
                        float _536 = _532 * _520;
                        float _538 = -_536;
                        float _540 = _538 + 1.0;
                        float _542 = _526 * _536;
                        float _544 = abs(_540);
                        float _546 = log2(_544);
                        float _548 = _546 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _550 = exp2(_548);
                        float _552 = fma(_534, _550, 1.0);
                        float _554 = 1.0 / _552;
                        float _556 = _542 * _554;
                        float _558 = fma(_498, _556, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _168 = _558;
                    }
                    float _560 = _168;
                    bool _562 = !_508;
                    if (!_562)
                    {
                        float _564 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _566 = _160 + _564;
                        float _568 = _526 + (-1.0);
                        float _570 = _566 * _520;
                        float _572 = -_570;
                        float _574 = _572 + 1.0;
                        float _576 = _526 * _570;
                        float _578 = abs(_574);
                        float _580 = log2(_578);
                        float _582 = _580 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _584 = exp2(_582);
                        float _586 = fma(_568, _584, 1.0);
                        float _588 = 1.0 / _586;
                        float _590 = _576 * _588;
                        float _592 = fma(_498, _590, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _170 = _592;
                    }
                    float _594 = _170;
                    bool _596 = !_518;
                    if (!_596)
                    {
                        float _598 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _600 = _162 + _598;
                        float _602 = _526 + (-1.0);
                        float _604 = _600 * _520;
                        float _606 = -_604;
                        float _608 = _606 + 1.0;
                        float _610 = _526 * _604;
                        float _612 = abs(_608);
                        float _614 = log2(_612);
                        float _616 = _614 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _618 = exp2(_616);
                        float _620 = fma(_602, _618, 1.0);
                        float _622 = 1.0 / _620;
                        float _624 = _610 * _622;
                        float _626 = fma(_498, _624, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _172 = _626;
                    }
                    float _628 = _172;
                    float _630 = precise::max(0.0, _628);
                    float _632 = precise::max(0.0, _560);
                    float _634 = precise::max(0.0, _594);
                    float _636 = precise::min(_630, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _638 = precise::min(_632, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _640 = precise::min(_634, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _302 = _638;
                    _304 = _640;
                    _312 = _636;
                    _314 = true;
                }
                else
                {
                    bool _642 = _326 != 2.0;
                    bool _644 = isnan(_326);
                    bool _646 = _642 || _644;
                    bool _648 = isnan(2.0);
                    bool _650 = _646 || _648;
                    if (!_650)
                    {
                        float _652 = _160 * 0.715200006961822509765625;
                        float _654 = fma(_158, 0.2125999927520751953125, _652);
                        float _656 = fma(_162, 0.072200000286102294921875, _654);
                        float _658 = spvFAdd(_656, 9.9999999747524270787835121154785e-07);
                        bool _660 = _656 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _662 = isnan(_656);
                        bool _664 = _660 || _662;
                        bool _666 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _668 = _664 || _666;
                        float _670 = 1.0 / _658;
                        bool _672 = !_668;
                        float _674 = _656;
                        if (!_672)
                        {
                            float _676 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _678 = _656 + _676;
                            float _680 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _682 = spvFAdd(_680, 1.00000095367431640625);
                            float _684 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _686 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _684;
                            float _688 = 1.0 / _682;
                            float _690 = _678 * _688;
                            float _692 = _686 * _688;
                            float _694 = -_690;
                            float _696 = _694 + 1.0;
                            float _698 = _692 + (-1.0);
                            float _700 = _692 * _690;
                            float _702 = abs(_696);
                            float _704 = log2(_702);
                            float _706 = _704 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _708 = exp2(_706);
                            float _710 = fma(_698, _708, 1.0);
                            float _712 = 1.0 / _710;
                            float _714 = _700 * _712;
                            float _716 = fma(_682, _714, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _674 = _716;
                        }
                        float _718 = _674;
                        float _720 = precise::max(0.0, _718);
                        float _722 = precise::min(_720, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _724 = _722 * _670;
                        float _726 = _158 * _724;
                        float _728 = _160 * _724;
                        float _730 = _162 * _724;
                        float _732 = precise::max(0.0, _726);
                        float _734 = precise::max(0.0, _728);
                        float _736 = precise::max(0.0, _730);
                        float _738 = precise::min(_732, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _740 = precise::min(_734, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _742 = precise::min(_736, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _302 = _738;
                        _304 = _740;
                        _312 = _742;
                        _314 = true;
                    }
                    else
                    {
                        bool _744 = _326 != 3.0;
                        bool _746 = isnan(_326);
                        bool _748 = _744 || _746;
                        bool _750 = isnan(3.0);
                        bool _752 = _748 || _750;
                        if (!_752)
                        {
                            float _754 = -_158;
                            float _756 = _754 + 1.0;
                            float _758 = -_160;
                            float _760 = _758 + 1.0;
                            float _762 = -_162;
                            float _764 = _762 + 1.0;
                            float _766 = abs(_756);
                            float _768 = log2(_766);
                            float _770 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _772 = abs(_760);
                            float _774 = log2(_772);
                            float _776 = abs(_764);
                            float _778 = log2(_776);
                            float _780 = _768 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _782 = _774 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _784 = exp2(_780);
                            float _786 = _778 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _788 = exp2(_782);
                            float _790 = exp2(_786);
                            float _792 = fma(_770, _784, 1.0);
                            float _794 = fma(_770, _788, 1.0);
                            float _796 = 1.0 / _792;
                            float _798 = fma(_770, _790, 1.0);
                            float _800 = 1.0 / _794;
                            float _802 = 1.0 / _798;
                            float _804 = _796 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _806 = _796 + _800;
                            float _808 = _800 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _810 = _802 + _806;
                            float _812 = _802 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _814 = precise::max(_804, _808);
                            float _816 = _810 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _818 = precise::max(_812, _814);
                            float _820 = _816 * 0.3333333432674407958984375;
                            float _822 = -_820;
                            float _824 = _818 + _822;
                            float _826 = fma(_824, (*spvDescriptorSet0.fp_c3)._m0[7].z, _820);
                            float _828 = -_804;
                            float _830 = _828 + _826;
                            float _832 = -_808;
                            float _834 = _832 + _826;
                            float _836 = -_812;
                            float _838 = _836 + _826;
                            float _840 = fma(_830, (*spvDescriptorSet0.fp_c3)._m0[6].w, _804);
                            float _842 = fma(_834, (*spvDescriptorSet0.fp_c3)._m0[6].w, _808);
                            float _844 = fma(_838, (*spvDescriptorSet0.fp_c3)._m0[6].w, _812);
                            float _846 = _158 * _840;
                            float _848 = _160 * _842;
                            float _850 = _162 * _844;
                            _302 = _846;
                            _304 = _848;
                            _312 = _850;
                            _314 = true;
                        }
                        else
                        {
                            bool _852 = _326 != 4.0;
                            bool _854 = isnan(_326);
                            bool _856 = _852 || _854;
                            bool _858 = isnan(4.0);
                            bool _860 = _856 || _858;
                            if (!_860)
                            {
                                bool _862 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _864 = isnan(0.0);
                                bool _866 = _862 || _864;
                                bool _868 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _870 = _866 || _868;
                                float _892;
                                float _894;
                                if (!_870)
                                {
                                    float _872 = -_158;
                                    float _874 = _872 + 1.0;
                                    float _876 = abs(_874);
                                    float _878 = log2(_876);
                                    float _880 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _882 = _878 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _884 = exp2(_882);
                                    float _886 = fma(_880, _884, 1.0);
                                    float _888 = 1.0 / _886;
                                    float _890 = _888 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _892 = _878;
                                    _894 = _890;
                                    _896 = true;
                                }
                                else
                                {
                                    float _898 = spvFAdd(_158, 9.9999999747524270787835121154785e-07);
                                    bool _900 = _158 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _902 = isnan(_158);
                                    bool _904 = _900 || _902;
                                    bool _906 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _908 = _904 || _906;
                                    float _910 = 1.0 / _898;
                                    if (!_908)
                                    {
                                        _346 = _158;
                                    }
                                    float _912 = _346;
                                    bool _914 = !_908;
                                    float _916 = _912;
                                    _892 = _910;
                                    if (!_914)
                                    {
                                        float _918 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _920 = _158 + _918;
                                        float _922 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _924 = spvFAdd(_922, 1.00000095367431640625);
                                        float _926 = 1.0 / _924;
                                        float _928 = _920 * _926;
                                        float _930 = -_928;
                                        float _932 = _930 + 1.0;
                                        float _934 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _936 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _934;
                                        float _938 = abs(_932);
                                        float _940 = log2(_938);
                                        float _942 = _936 * _926;
                                        float _944 = _942 + (-1.0);
                                        float _946 = _942 * _928;
                                        float _948 = _940 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _950 = exp2(_948);
                                        float _952 = fma(_944, _950, 1.0);
                                        float _954 = 1.0 / _952;
                                        float _956 = _946 * _954;
                                        float _958 = fma(_924, _956, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _916 = _958;
                                    }
                                    float _960 = _916;
                                    float _962 = precise::max(0.0, _960);
                                    float _964 = precise::min(_962, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _966 = _964 * _910;
                                    _894 = _966;
                                }
                                _896 = false;
                                float _968 = _892;
                                float _970 = _894;
                                float _972 = _968;
                                float _994;
                                float _996;
                                if (!_870)
                                {
                                    float _974 = -_160;
                                    float _976 = _974 + 1.0;
                                    float _978 = abs(_976);
                                    float _980 = log2(_978);
                                    float _982 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _984 = _980 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _986 = exp2(_984);
                                    float _988 = fma(_982, _986, 1.0);
                                    float _990 = 1.0 / _988;
                                    float _992 = _990 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _994 = _980;
                                    _996 = _992;
                                    _998 = true;
                                }
                                else
                                {
                                    float _1000 = spvFAdd(_160, 9.9999999747524270787835121154785e-07);
                                    bool _1002 = _160 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1004 = isnan(_160);
                                    bool _1006 = _1002 || _1004;
                                    bool _1008 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1010 = _1006 || _1008;
                                    float _1012 = 1.0 / _1000;
                                    if (!_1010)
                                    {
                                        _972 = _160;
                                    }
                                    float _1014 = _972;
                                    bool _1016 = !_1010;
                                    float _1018 = _1014;
                                    _994 = _1012;
                                    if (!_1016)
                                    {
                                        float _1020 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1022 = _160 + _1020;
                                        float _1024 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1026 = spvFAdd(_1024, 1.00000095367431640625);
                                        float _1028 = 1.0 / _1026;
                                        float _1030 = _1022 * _1028;
                                        float _1032 = -_1030;
                                        float _1034 = _1032 + 1.0;
                                        float _1036 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1038 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1036;
                                        float _1040 = abs(_1034);
                                        float _1042 = log2(_1040);
                                        float _1044 = _1038 * _1028;
                                        float _1046 = _1044 + (-1.0);
                                        float _1048 = _1044 * _1030;
                                        float _1050 = _1042 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1052 = exp2(_1050);
                                        float _1054 = fma(_1046, _1052, 1.0);
                                        float _1056 = 1.0 / _1054;
                                        float _1058 = _1048 * _1056;
                                        float _1060 = fma(_1026, _1058, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1018 = _1060;
                                    }
                                    float _1062 = _1018;
                                    float _1064 = precise::max(0.0, _1062);
                                    float _1066 = precise::min(_1064, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1068 = _1066 * _1012;
                                    _996 = _1068;
                                }
                                _998 = false;
                                float _1070 = _994;
                                float _1072 = _996;
                                float _1074 = _1070;
                                float _1096;
                                if (!_870)
                                {
                                    float _1076 = -_162;
                                    float _1078 = _1076 + 1.0;
                                    float _1080 = abs(_1078);
                                    float _1082 = log2(_1080);
                                    float _1084 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1086 = _1082 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1088 = exp2(_1086);
                                    float _1090 = fma(_1084, _1088, 1.0);
                                    float _1092 = 1.0 / _1090;
                                    float _1094 = _1092 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1096 = _1094;
                                    _1098 = true;
                                }
                                else
                                {
                                    float _1100 = spvFAdd(_162, 9.9999999747524270787835121154785e-07);
                                    bool _1102 = _162 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1104 = isnan(_162);
                                    bool _1106 = _1102 || _1104;
                                    bool _1108 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1110 = _1106 || _1108;
                                    float _1112 = 1.0 / _1100;
                                    if (!_1110)
                                    {
                                        _1074 = _162;
                                    }
                                    float _1114 = _1074;
                                    bool _1116 = !_1110;
                                    float _1118 = _1114;
                                    if (!_1116)
                                    {
                                        float _1120 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1122 = _162 + _1120;
                                        float _1124 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1126 = spvFAdd(_1124, 1.00000095367431640625);
                                        float _1128 = 1.0 / _1126;
                                        float _1130 = _1122 * _1128;
                                        float _1132 = -_1130;
                                        float _1134 = _1132 + 1.0;
                                        float _1136 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1138 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1136;
                                        float _1140 = abs(_1134);
                                        float _1142 = log2(_1140);
                                        float _1144 = _1138 * _1128;
                                        float _1146 = _1144 + (-1.0);
                                        float _1148 = _1144 * _1130;
                                        float _1150 = _1142 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1152 = exp2(_1150);
                                        float _1154 = fma(_1146, _1152, 1.0);
                                        float _1156 = 1.0 / _1154;
                                        float _1158 = _1148 * _1156;
                                        float _1160 = fma(_1126, _1158, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1118 = _1160;
                                    }
                                    float _1162 = _1118;
                                    float _1164 = precise::max(0.0, _1162);
                                    float _1166 = precise::min(_1164, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1168 = _1166 * _1112;
                                    _1096 = _1168;
                                }
                                _1098 = false;
                                float _1170 = _1096;
                                float _1172 = precise::max(_970, _1072);
                                float _1174 = precise::max(_1172, _1170);
                                float _1176 = -_970;
                                float _1178 = _1174 + _1176;
                                float _1180 = -_1072;
                                float _1182 = _1174 + _1180;
                                float _1184 = -_1170;
                                float _1186 = _1174 + _1184;
                                float _1188 = fma(_1178, (*spvDescriptorSet0.fp_c3)._m0[6].w, _970);
                                float _1190 = fma(_1182, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1072);
                                float _1192 = fma(_1186, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1170);
                                float _1194 = _158 * _1188;
                                float _1196 = _160 * _1190;
                                float _1198 = _162 * _1192;
                                _302 = _1194;
                                _304 = _1196;
                                _312 = _1198;
                                _314 = true;
                            }
                            else
                            {
                                bool _1200 = _326 != 5.0;
                                bool _1202 = isnan(_326);
                                bool _1204 = _1200 || _1202;
                                bool _1206 = isnan(5.0);
                                bool _1208 = _1204 || _1206;
                                if (!_1208)
                                {
                                    _348 = _158;
                                }
                                float _1210 = _348;
                                float _1212 = _1210;
                                _302 = _1210;
                                if (!_1208)
                                {
                                    _350 = _160;
                                }
                                float _1214 = _350;
                                float _1216 = _1214;
                                _304 = _1214;
                                if (!_1208)
                                {
                                    _352 = _162;
                                }
                                float _1218 = _352;
                                bool _1220 = !_1208;
                                float _1222 = _1218;
                                _312 = _1218;
                                if (!_1220)
                                {
                                    bool _1224 = _326 != 6.0;
                                    bool _1226 = isnan(_326);
                                    bool _1228 = _1224 || _1226;
                                    bool _1230 = isnan(6.0);
                                    bool _1232 = _1228 || _1230;
                                    if (!_1232)
                                    {
                                        float _1234 = -_160;
                                        float _1236 = _1234 + 1.0;
                                        float _1238 = -_158;
                                        float _1240 = _1238 + 1.0;
                                        float _1242 = -_162;
                                        float _1244 = _1242 + 1.0;
                                        float _1246 = abs(_1236);
                                        float _1248 = log2(_1246);
                                        float _1250 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1252 = abs(_1240);
                                        float _1254 = log2(_1252);
                                        float _1256 = abs(_1244);
                                        float _1258 = log2(_1256);
                                        float _1260 = _1248 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1262 = _1254 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1264 = exp2(_1260);
                                        float _1266 = _1258 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1268 = exp2(_1262);
                                        float _1270 = exp2(_1266);
                                        float _1272 = fma(_1250, _1264, 1.0);
                                        float _1274 = fma(_1250, _1268, 1.0);
                                        float _1276 = 1.0 / _1272;
                                        float _1278 = fma(_1250, _1270, 1.0);
                                        float _1280 = 1.0 / _1274;
                                        float _1282 = 1.0 / _1278;
                                        float _1284 = _1276 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1286 = _1280 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1288 = precise::max(_1286, _1284);
                                        float _1290 = _1282 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1292 = precise::max(_1290, _1288);
                                        float _1294 = -_1286;
                                        float _1296 = _1294 + _1292;
                                        float _1298 = -_1284;
                                        float _1300 = _1298 + _1292;
                                        float _1302 = -_1290;
                                        float _1304 = _1302 + _1292;
                                        float _1306 = fma(_1296, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1286);
                                        float _1308 = fma(_1300, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1284);
                                        float _1310 = fma(_1304, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1290);
                                        float _1312 = _158 * _1306;
                                        float _1314 = _160 * _1308;
                                        float _1316 = _162 * _1310;
                                        _302 = _1312;
                                        _304 = _1314;
                                        _312 = _1316;
                                        _314 = true;
                                    }
                                    else
                                    {
                                        bool _1318 = _326 != 7.0;
                                        bool _1320 = isnan(_326);
                                        bool _1322 = _1318 || _1320;
                                        bool _1324 = isnan(7.0);
                                        bool _1326 = _1322 || _1324;
                                        if (_1326)
                                        {
                                            _1212 = 0.0;
                                            _1216 = 0.0;
                                        }
                                        float _1328 = _1212;
                                        float _1330 = _1216;
                                        _302 = _1328;
                                        _304 = _1330;
                                        if (_1326)
                                        {
                                            _1222 = 0.0;
                                        }
                                        float _1332 = _1222;
                                        _312 = _1332;
                                        if (!_1326)
                                        {
                                            float _1334 = -_160;
                                            float _1336 = _1334 + 1.0;
                                            float _1338 = -_158;
                                            float _1340 = _1338 + 1.0;
                                            float _1342 = -_162;
                                            float _1344 = _1342 + 1.0;
                                            float _1346 = abs(_1336);
                                            float _1348 = log2(_1346);
                                            float _1350 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1352 = abs(_1340);
                                            float _1354 = log2(_1352);
                                            float _1356 = abs(_1344);
                                            float _1358 = log2(_1356);
                                            float _1360 = _1348 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1362 = _1354 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1364 = exp2(_1360);
                                            float _1366 = _1358 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1368 = exp2(_1362);
                                            float _1370 = exp2(_1366);
                                            float _1372 = fma(_1350, _1364, 1.0);
                                            float _1374 = fma(_1350, _1368, 1.0);
                                            float _1376 = 1.0 / _1372;
                                            float _1378 = fma(_1350, _1370, 1.0);
                                            float _1380 = 1.0 / _1374;
                                            float _1382 = 1.0 / _1378;
                                            float _1384 = _1376 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1386 = _1380 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1388 = -_158;
                                            float _1390 = fma(_158, _1386, _1388);
                                            float _1392 = -_160;
                                            float _1394 = fma(_160, _1384, _1392);
                                            float _1396 = _1382 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1398 = _1390 + _1394;
                                            float _1400 = -_162;
                                            float _1402 = fma(_162, _1396, _1400);
                                            float _1404 = _1402 + _1398;
                                            float _1406 = -_1390;
                                            float _1408 = fma(_1404, 0.3333333432674407958984375, _1406);
                                            float _1410 = -_1394;
                                            float _1412 = fma(_1404, 0.3333333432674407958984375, _1410);
                                            float _1414 = -_1402;
                                            float _1416 = fma(_1404, 0.3333333432674407958984375, _1414);
                                            float _1418 = fma(_1408, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1390);
                                            float _1420 = fma(_1412, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1394);
                                            float _1422 = fma(_1416, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1402);
                                            float _1424 = _158 + _1418;
                                            float _1426 = _160 + _1420;
                                            float _1428 = _162 + _1422;
                                            _302 = _1424;
                                            _304 = _1426;
                                            _312 = _1428;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _314 = false;
        float _1430 = _302;
        float _1432 = _304;
        float _1434 = _312;
        _258 = _1430;
        _260 = _1432;
        _262 = _1434;
    }
    _264 = false;
    float _1436 = _258;
    float _1438 = _260;
    float _1440 = _262;
    float _1442 = _1436 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1444 = _1438 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1446 = _1440 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_34.x = _1442;
    out.m_34.y = _1444;
    out.m_34.z = _1446;
    out.m_34.w = _74;
    return out;
}

