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
    bool _330 = false;
    bool _380 = false;
    bool _1170 = false;
    bool _1070 = false;
    bool _968 = false;
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
    float2 _1563 = float2(_59, _57);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1563, float2(0.0), isnan(_1563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1563, float2(0.0), isnan(_1563))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float2 _1582 = float2(_63, _61);
    float3 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1582, float2(0.0), isnan(_1582))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1582, float2(0.0), isnan(_1582))).xyz;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    bool _88 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _90 = isnan(0.0);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _96 = _92 || _94;
    float _98 = _47;
    float _100 = _55;
    float _102 = _80;
    float _104 = _72;
    float _106 = _72;
    if (_96)
    {
        float _108 = _70 * 0.715200006961822509765625;
        _98 = _108;
    }
    float _110 = _98;
    float _112 = _110;
    if (_96)
    {
        float _114 = fma(_68, 0.2125999927520751953125, _110);
        _112 = _114;
    }
    float _116 = _112;
    float _118 = 0.0;
    float _120 = _116;
    if (_96)
    {
        float _122 = fma(_72, 0.072200000286102294921875, _116);
        _118 = _122;
    }
    float _124 = _118;
    if (!_96)
    {
        _120 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _126 = _120;
    float _128 = _124;
    float _130 = _126;
    if (_96)
    {
        float _132 = 1.0 / _124;
        _128 = _132;
    }
    float _134 = _128;
    if (_96)
    {
        float _136 = _134 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _138 = precise::clamp(_136, 0.0, 1.0);
        _100 = _138;
    }
    float _140 = _100;
    if (_96)
    {
        float _142 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _130 = _142;
    }
    float _144 = _130;
    float _146 = fma(_68, _144, _80);
    float _148 = fma(_70, _144, _82);
    float _150 = fma(_72, _144, _84);
    float _152 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _154 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _156 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _158 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _160 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(6.0);
    bool _166 = _162 || _164;
    bool _168 = _146 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _170 = isnan(_146);
    bool _172 = _168 || _170;
    bool _174 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _176 = _172 || _174;
    float _178 = exp2(_152);
    bool _180 = _148 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _182 = isnan(_148);
    bool _184 = _180 || _182;
    bool _186 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _188 = _184 || _186;
    bool _190 = _150 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _192 = isnan(_150);
    bool _194 = _190 || _192;
    bool _196 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _198 = _194 || _196;
    float _200 = exp2(_154);
    float _202 = exp2(_156);
    float _204 = -_178;
    float _206 = _204 + 1.0;
    bool _208 = !_176;
    float _210 = _208 ? _146 : _206;
    float _212 = -_200;
    float _214 = _212 + 1.0;
    bool _216 = !_188;
    float _218 = _216 ? _148 : _214;
    float _220 = -_202;
    float _222 = _220 + 1.0;
    bool _224 = !_198;
    float _226 = _224 ? _150 : _222;
    float _228 = _202;
    float _230 = _214;
    float _232 = _202;
    float _234 = _210;
    float _236 = _218;
    float _238 = _226;
    float _324;
    float _326;
    float _328;
    if (!_166)
    {
        float _240 = -_210;
        float _242 = _240 + 1.0;
        float _244 = -_218;
        float _246 = _244 + 1.0;
        float _248 = -_226;
        float _250 = _248 + 1.0;
        float _252 = abs(_242);
        float _254 = log2(_252);
        float _256 = abs(_246);
        float _258 = log2(_256);
        float _260 = abs(_250);
        float _262 = log2(_260);
        float _264 = _254 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _266 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _268 = _258 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _270 = exp2(_264);
        float _272 = _262 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _274 = exp2(_268);
        float _276 = exp2(_272);
        float _278 = fma(_266, _270, 1.0);
        float _280 = fma(_266, _274, 1.0);
        float _282 = 1.0 / _278;
        float _284 = fma(_266, _276, 1.0);
        float _286 = 1.0 / _280;
        float _288 = 1.0 / _284;
        float _290 = _282 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _292 = _286 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _294 = precise::max(_290, _292);
        float _296 = _288 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _298 = precise::max(_296, _294);
        float _300 = -_290;
        float _302 = _300 + _298;
        float _304 = -_292;
        float _306 = _304 + _298;
        float _308 = -_296;
        float _310 = _308 + _298;
        float _312 = fma(_302, (*spvDescriptorSet0.fp_c3)._m0[6].w, _290);
        float _314 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[6].w, _292);
        float _316 = fma(_310, (*spvDescriptorSet0.fp_c3)._m0[6].w, _296);
        float _318 = _210 * _312;
        float _320 = _218 * _314;
        float _322 = _226 * _316;
        _324 = _318;
        _326 = _320;
        _328 = _322;
        _330 = true;
    }
    else
    {
        bool _332 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_332)
        {
            _102 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _334 = _102;
        bool _336 = !_332;
        float _338 = _334;
        float _368;
        float _370;
        float _378;
        if (!_336)
        {
            float _340 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _342 = _59 + _340;
            float _344 = abs(_342);
            float _346 = _344 * 2560.0;
            bool _348 = _346 >= 2.0;
            bool _350 = isnan(_346);
            bool _352 = _348 || _350;
            bool _354 = isnan(2.0);
            bool _356 = _352 || _354;
            float _358 = _346;
            if (!_356)
            {
                _358 = 0.0;
                _228 = 0.0;
            }
            float _360 = _358;
            float _362 = _228;
            float _364 = _360;
            float _366 = _362;
            _368 = _360;
            _370 = _362;
            if (!_356)
            {
                _104 = 0.0;
            }
            float _372 = _104;
            bool _374 = !_356;
            float _376 = _372;
            _378 = _372;
            _380 = _374;
            if (!_380)
            {
                bool _382 = _59 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_382)
                {
                    _364 = _210;
                }
                float _384 = _364;
                _230 = _384;
                _368 = _384;
                if (_382)
                {
                    _366 = _218;
                }
                float _386 = _366;
                _232 = _386;
                _370 = _386;
                if (_382)
                {
                    _376 = _226;
                }
                float _388 = _376;
                _106 = _388;
                _378 = _388;
                _380 = _382;
                if (!_380)
                {
                    float _390 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _338 = _390;
                }
            }
        }
        if (!_380)
        {
            float _392 = _338;
            float _394 = _230;
            float _396 = _232;
            float _398 = _106;
            bool _400 = _392 != 0.0;
            bool _402 = isnan(_392);
            bool _404 = _400 || _402;
            bool _406 = isnan(0.0);
            bool _408 = _404 || _406;
            float _410 = _394;
            float _412 = _394;
            float _414 = _396;
            float _416 = _398;
            if (!_408)
            {
                float _418 = _148 * 0.586600005626678466796875;
                float _420 = fma(_146, 0.29890000820159912109375, _418);
                float _422 = fma(_150, 0.1143999993801116943359375, _420);
                float _424 = _422 * (-1.44269502162933349609375);
                float _426 = exp2(_424);
                float _428 = -_426;
                float _430 = _428 + 1.0;
                bool _432 = _430 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _434 = isnan(_430);
                bool _436 = _432 || _434;
                bool _438 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _440 = _436 || _438;
                float _442 = _422;
                if (!_440)
                {
                    _442 = _430;
                }
                float _444 = _442;
                bool _446 = !_440;
                float _448 = _444;
                if (!_446)
                {
                    float _450 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _452 = _430 + _450;
                    float _454 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _456 = spvFAdd(_454, 1.00000095367431640625);
                    float _458 = 1.0 / _456;
                    float _460 = _452 * _458;
                    float _462 = -_460;
                    float _464 = _462 + 1.0;
                    float _466 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _468 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _466;
                    float _470 = abs(_464);
                    float _472 = log2(_470);
                    float _474 = _468 * _458;
                    float _476 = _474 + (-1.0);
                    float _478 = _474 * _460;
                    float _480 = _472 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _482 = exp2(_480);
                    float _484 = fma(_476, _482, 1.0);
                    float _486 = 1.0 / _484;
                    float _488 = _478 * _486;
                    float _490 = fma(_456, _488, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _448 = _490;
                }
                float _492 = _448;
                float _494 = -_430;
                float _496 = _494 + _492;
                float _498 = _218 * 0.586600005626678466796875;
                float _500 = _496 + 1.0;
                float _502 = fma(_210, 0.29890000820159912109375, _498);
                float _504 = fma(_226, 0.1143999993801116943359375, _502);
                float _506 = abs(_500);
                float _508 = log2(_506);
                float _510 = spvFAdd(_504, 9.9999999747524270787835121154785e-07);
                float _512 = 1.0 / _510;
                float _514 = _508 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _516 = exp2(_514);
                float _518 = fma(_210, _512, -1.0);
                float _520 = fma(_218, _512, -1.0);
                float _522 = fma(_226, _512, -1.0);
                float _524 = fma(_516, _518, 1.0);
                float _526 = fma(_516, _520, 1.0);
                float _528 = fma(_516, _522, 1.0);
                float _530 = _524 * _492;
                float _532 = _526 * _492;
                float _534 = _528 * _492;
                float _536 = precise::max(0.0, _530);
                float _538 = precise::max(0.0, _532);
                float _540 = precise::max(0.0, _534);
                float _542 = precise::min(_536, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _544 = precise::min(_538, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _546 = precise::min(_540, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _368 = _542;
                _370 = _544;
                _378 = _546;
                _380 = true;
            }
            else
            {
                bool _548 = _392 != 1.0;
                bool _550 = isnan(_392);
                bool _552 = _548 || _550;
                bool _554 = isnan(1.0);
                bool _556 = _552 || _554;
                if (!_556)
                {
                    bool _558 = _210 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _560 = isnan(_210);
                    bool _562 = _558 || _560;
                    bool _564 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _566 = _562 || _564;
                    float _568 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _570 = spvFAdd(_568, 1.00000095367431640625);
                    bool _572 = _218 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _574 = isnan(_218);
                    bool _576 = _572 || _574;
                    bool _578 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _580 = _576 || _578;
                    bool _582 = _226 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _584 = isnan(_226);
                    bool _586 = _582 || _584;
                    bool _588 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _590 = _586 || _588;
                    float _592 = 1.0 / _570;
                    float _594 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _596 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _594;
                    float _598 = _596 * _592;
                    bool _600 = !_566;
                    if (!_600)
                    {
                        float _602 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _604 = _210 + _602;
                        float _606 = _598 + (-1.0);
                        float _608 = _604 * _592;
                        float _610 = -_608;
                        float _612 = _610 + 1.0;
                        float _614 = _598 * _608;
                        float _616 = abs(_612);
                        float _618 = log2(_616);
                        float _620 = _618 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _622 = exp2(_620);
                        float _624 = fma(_606, _622, 1.0);
                        float _626 = 1.0 / _624;
                        float _628 = _614 * _626;
                        float _630 = fma(_570, _628, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _234 = _630;
                    }
                    float _632 = _234;
                    bool _634 = !_580;
                    if (!_634)
                    {
                        float _636 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _638 = _218 + _636;
                        float _640 = _598 + (-1.0);
                        float _642 = _638 * _592;
                        float _644 = -_642;
                        float _646 = _644 + 1.0;
                        float _648 = _598 * _642;
                        float _650 = abs(_646);
                        float _652 = log2(_650);
                        float _654 = _652 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _656 = exp2(_654);
                        float _658 = fma(_640, _656, 1.0);
                        float _660 = 1.0 / _658;
                        float _662 = _648 * _660;
                        float _664 = fma(_570, _662, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _236 = _664;
                    }
                    float _666 = _236;
                    bool _668 = !_590;
                    if (!_668)
                    {
                        float _670 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _672 = _226 + _670;
                        float _674 = _598 + (-1.0);
                        float _676 = _672 * _592;
                        float _678 = -_676;
                        float _680 = _678 + 1.0;
                        float _682 = _598 * _676;
                        float _684 = abs(_680);
                        float _686 = log2(_684);
                        float _688 = _686 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _690 = exp2(_688);
                        float _692 = fma(_674, _690, 1.0);
                        float _694 = 1.0 / _692;
                        float _696 = _682 * _694;
                        float _698 = fma(_570, _696, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _238 = _698;
                    }
                    float _700 = _238;
                    float _702 = precise::max(0.0, _700);
                    float _704 = precise::max(0.0, _632);
                    float _706 = precise::max(0.0, _666);
                    float _708 = precise::min(_702, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _710 = precise::min(_704, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _712 = precise::min(_706, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _368 = _710;
                    _370 = _712;
                    _378 = _708;
                    _380 = true;
                }
                else
                {
                    bool _714 = _392 != 2.0;
                    bool _716 = isnan(_392);
                    bool _718 = _714 || _716;
                    bool _720 = isnan(2.0);
                    bool _722 = _718 || _720;
                    if (!_722)
                    {
                        float _724 = _218 * 0.715200006961822509765625;
                        float _726 = fma(_210, 0.2125999927520751953125, _724);
                        float _728 = fma(_226, 0.072200000286102294921875, _726);
                        float _730 = spvFAdd(_728, 9.9999999747524270787835121154785e-07);
                        bool _732 = _728 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _734 = isnan(_728);
                        bool _736 = _732 || _734;
                        bool _738 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _740 = _736 || _738;
                        float _742 = 1.0 / _730;
                        bool _744 = !_740;
                        float _746 = _728;
                        if (!_744)
                        {
                            float _748 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _750 = _728 + _748;
                            float _752 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _754 = spvFAdd(_752, 1.00000095367431640625);
                            float _756 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _758 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _756;
                            float _760 = 1.0 / _754;
                            float _762 = _750 * _760;
                            float _764 = _758 * _760;
                            float _766 = -_762;
                            float _768 = _766 + 1.0;
                            float _770 = _764 + (-1.0);
                            float _772 = _764 * _762;
                            float _774 = abs(_768);
                            float _776 = log2(_774);
                            float _778 = _776 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _780 = exp2(_778);
                            float _782 = fma(_770, _780, 1.0);
                            float _784 = 1.0 / _782;
                            float _786 = _772 * _784;
                            float _788 = fma(_754, _786, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _746 = _788;
                        }
                        float _790 = _746;
                        float _792 = precise::max(0.0, _790);
                        float _794 = precise::min(_792, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _796 = _794 * _742;
                        float _798 = _210 * _796;
                        float _800 = _218 * _796;
                        float _802 = _226 * _796;
                        float _804 = precise::max(0.0, _798);
                        float _806 = precise::max(0.0, _800);
                        float _808 = precise::max(0.0, _802);
                        float _810 = precise::min(_804, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _812 = precise::min(_806, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _814 = precise::min(_808, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _368 = _810;
                        _370 = _812;
                        _378 = _814;
                        _380 = true;
                    }
                    else
                    {
                        bool _816 = _392 != 3.0;
                        bool _818 = isnan(_392);
                        bool _820 = _816 || _818;
                        bool _822 = isnan(3.0);
                        bool _824 = _820 || _822;
                        if (!_824)
                        {
                            float _826 = -_210;
                            float _828 = _826 + 1.0;
                            float _830 = -_218;
                            float _832 = _830 + 1.0;
                            float _834 = -_226;
                            float _836 = _834 + 1.0;
                            float _838 = abs(_828);
                            float _840 = log2(_838);
                            float _842 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _844 = abs(_832);
                            float _846 = log2(_844);
                            float _848 = abs(_836);
                            float _850 = log2(_848);
                            float _852 = _840 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _854 = _846 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _856 = exp2(_852);
                            float _858 = _850 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _860 = exp2(_854);
                            float _862 = exp2(_858);
                            float _864 = fma(_842, _856, 1.0);
                            float _866 = fma(_842, _860, 1.0);
                            float _868 = 1.0 / _864;
                            float _870 = fma(_842, _862, 1.0);
                            float _872 = 1.0 / _866;
                            float _874 = 1.0 / _870;
                            float _876 = _868 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _878 = _868 + _872;
                            float _880 = _872 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _882 = _874 + _878;
                            float _884 = _874 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _886 = precise::max(_876, _880);
                            float _888 = _882 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _890 = precise::max(_884, _886);
                            float _892 = _888 * 0.3333333432674407958984375;
                            float _894 = -_892;
                            float _896 = _890 + _894;
                            float _898 = fma(_896, (*spvDescriptorSet0.fp_c3)._m0[7].z, _892);
                            float _900 = -_876;
                            float _902 = _900 + _898;
                            float _904 = -_880;
                            float _906 = _904 + _898;
                            float _908 = -_884;
                            float _910 = _908 + _898;
                            float _912 = fma(_902, (*spvDescriptorSet0.fp_c3)._m0[6].w, _876);
                            float _914 = fma(_906, (*spvDescriptorSet0.fp_c3)._m0[6].w, _880);
                            float _916 = fma(_910, (*spvDescriptorSet0.fp_c3)._m0[6].w, _884);
                            float _918 = _210 * _912;
                            float _920 = _218 * _914;
                            float _922 = _226 * _916;
                            _368 = _918;
                            _370 = _920;
                            _378 = _922;
                            _380 = true;
                        }
                        else
                        {
                            bool _924 = _392 != 4.0;
                            bool _926 = isnan(_392);
                            bool _928 = _924 || _926;
                            bool _930 = isnan(4.0);
                            bool _932 = _928 || _930;
                            if (!_932)
                            {
                                bool _934 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _936 = isnan(0.0);
                                bool _938 = _934 || _936;
                                bool _940 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _942 = _938 || _940;
                                float _964;
                                float _966;
                                if (!_942)
                                {
                                    float _944 = -_210;
                                    float _946 = _944 + 1.0;
                                    float _948 = abs(_946);
                                    float _950 = log2(_948);
                                    float _952 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _954 = _950 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _956 = exp2(_954);
                                    float _958 = fma(_952, _956, 1.0);
                                    float _960 = 1.0 / _958;
                                    float _962 = _960 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _964 = _950;
                                    _966 = _962;
                                    _968 = true;
                                }
                                else
                                {
                                    float _970 = spvFAdd(_210, 9.9999999747524270787835121154785e-07);
                                    bool _972 = _210 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _974 = isnan(_210);
                                    bool _976 = _972 || _974;
                                    bool _978 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _980 = _976 || _978;
                                    float _982 = 1.0 / _970;
                                    if (!_980)
                                    {
                                        _410 = _210;
                                    }
                                    float _984 = _410;
                                    bool _986 = !_980;
                                    float _988 = _984;
                                    _964 = _982;
                                    if (!_986)
                                    {
                                        float _990 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _992 = _210 + _990;
                                        float _994 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _996 = spvFAdd(_994, 1.00000095367431640625);
                                        float _998 = 1.0 / _996;
                                        float _1000 = _992 * _998;
                                        float _1002 = -_1000;
                                        float _1004 = _1002 + 1.0;
                                        float _1006 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1008 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1006;
                                        float _1010 = abs(_1004);
                                        float _1012 = log2(_1010);
                                        float _1014 = _1008 * _998;
                                        float _1016 = _1014 + (-1.0);
                                        float _1018 = _1014 * _1000;
                                        float _1020 = _1012 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1022 = exp2(_1020);
                                        float _1024 = fma(_1016, _1022, 1.0);
                                        float _1026 = 1.0 / _1024;
                                        float _1028 = _1018 * _1026;
                                        float _1030 = fma(_996, _1028, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _988 = _1030;
                                    }
                                    float _1032 = _988;
                                    float _1034 = precise::max(0.0, _1032);
                                    float _1036 = precise::min(_1034, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1038 = _1036 * _982;
                                    _966 = _1038;
                                }
                                _968 = false;
                                float _1040 = _964;
                                float _1042 = _966;
                                float _1044 = _1040;
                                float _1066;
                                float _1068;
                                if (!_942)
                                {
                                    float _1046 = -_218;
                                    float _1048 = _1046 + 1.0;
                                    float _1050 = abs(_1048);
                                    float _1052 = log2(_1050);
                                    float _1054 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1056 = _1052 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1058 = exp2(_1056);
                                    float _1060 = fma(_1054, _1058, 1.0);
                                    float _1062 = 1.0 / _1060;
                                    float _1064 = _1062 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1066 = _1052;
                                    _1068 = _1064;
                                    _1070 = true;
                                }
                                else
                                {
                                    float _1072 = spvFAdd(_218, 9.9999999747524270787835121154785e-07);
                                    bool _1074 = _218 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1076 = isnan(_218);
                                    bool _1078 = _1074 || _1076;
                                    bool _1080 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1082 = _1078 || _1080;
                                    float _1084 = 1.0 / _1072;
                                    if (!_1082)
                                    {
                                        _1044 = _218;
                                    }
                                    float _1086 = _1044;
                                    bool _1088 = !_1082;
                                    float _1090 = _1086;
                                    _1066 = _1084;
                                    if (!_1088)
                                    {
                                        float _1092 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1094 = _218 + _1092;
                                        float _1096 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1098 = spvFAdd(_1096, 1.00000095367431640625);
                                        float _1100 = 1.0 / _1098;
                                        float _1102 = _1094 * _1100;
                                        float _1104 = -_1102;
                                        float _1106 = _1104 + 1.0;
                                        float _1108 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1110 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1108;
                                        float _1112 = abs(_1106);
                                        float _1114 = log2(_1112);
                                        float _1116 = _1110 * _1100;
                                        float _1118 = _1116 + (-1.0);
                                        float _1120 = _1116 * _1102;
                                        float _1122 = _1114 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1124 = exp2(_1122);
                                        float _1126 = fma(_1118, _1124, 1.0);
                                        float _1128 = 1.0 / _1126;
                                        float _1130 = _1120 * _1128;
                                        float _1132 = fma(_1098, _1130, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1090 = _1132;
                                    }
                                    float _1134 = _1090;
                                    float _1136 = precise::max(0.0, _1134);
                                    float _1138 = precise::min(_1136, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1140 = _1138 * _1084;
                                    _1068 = _1140;
                                }
                                _1070 = false;
                                float _1142 = _1066;
                                float _1144 = _1068;
                                float _1146 = _1142;
                                float _1168;
                                if (!_942)
                                {
                                    float _1148 = -_226;
                                    float _1150 = _1148 + 1.0;
                                    float _1152 = abs(_1150);
                                    float _1154 = log2(_1152);
                                    float _1156 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1158 = _1154 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1160 = exp2(_1158);
                                    float _1162 = fma(_1156, _1160, 1.0);
                                    float _1164 = 1.0 / _1162;
                                    float _1166 = _1164 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1168 = _1166;
                                    _1170 = true;
                                }
                                else
                                {
                                    float _1172 = spvFAdd(_226, 9.9999999747524270787835121154785e-07);
                                    bool _1174 = _226 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1176 = isnan(_226);
                                    bool _1178 = _1174 || _1176;
                                    bool _1180 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1182 = _1178 || _1180;
                                    float _1184 = 1.0 / _1172;
                                    if (!_1182)
                                    {
                                        _1146 = _226;
                                    }
                                    float _1186 = _1146;
                                    bool _1188 = !_1182;
                                    float _1190 = _1186;
                                    if (!_1188)
                                    {
                                        float _1192 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1194 = _226 + _1192;
                                        float _1196 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1198 = spvFAdd(_1196, 1.00000095367431640625);
                                        float _1200 = 1.0 / _1198;
                                        float _1202 = _1194 * _1200;
                                        float _1204 = -_1202;
                                        float _1206 = _1204 + 1.0;
                                        float _1208 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1210 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1208;
                                        float _1212 = abs(_1206);
                                        float _1214 = log2(_1212);
                                        float _1216 = _1210 * _1200;
                                        float _1218 = _1216 + (-1.0);
                                        float _1220 = _1216 * _1202;
                                        float _1222 = _1214 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1224 = exp2(_1222);
                                        float _1226 = fma(_1218, _1224, 1.0);
                                        float _1228 = 1.0 / _1226;
                                        float _1230 = _1220 * _1228;
                                        float _1232 = fma(_1198, _1230, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1190 = _1232;
                                    }
                                    float _1234 = _1190;
                                    float _1236 = precise::max(0.0, _1234);
                                    float _1238 = precise::min(_1236, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1240 = _1238 * _1184;
                                    _1168 = _1240;
                                }
                                _1170 = false;
                                float _1242 = _1168;
                                float _1244 = precise::max(_1042, _1144);
                                float _1246 = precise::max(_1244, _1242);
                                float _1248 = -_1042;
                                float _1250 = _1246 + _1248;
                                float _1252 = -_1144;
                                float _1254 = _1246 + _1252;
                                float _1256 = -_1242;
                                float _1258 = _1246 + _1256;
                                float _1260 = fma(_1250, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1042);
                                float _1262 = fma(_1254, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1144);
                                float _1264 = fma(_1258, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1242);
                                float _1266 = _210 * _1260;
                                float _1268 = _218 * _1262;
                                float _1270 = _226 * _1264;
                                _368 = _1266;
                                _370 = _1268;
                                _378 = _1270;
                                _380 = true;
                            }
                            else
                            {
                                bool _1272 = _392 != 5.0;
                                bool _1274 = isnan(_392);
                                bool _1276 = _1272 || _1274;
                                bool _1278 = isnan(5.0);
                                bool _1280 = _1276 || _1278;
                                if (!_1280)
                                {
                                    _412 = _146;
                                }
                                float _1282 = _412;
                                float _1284 = _1282;
                                _368 = _1282;
                                if (!_1280)
                                {
                                    _414 = _148;
                                }
                                float _1286 = _414;
                                float _1288 = _1286;
                                _370 = _1286;
                                if (!_1280)
                                {
                                    _416 = _150;
                                }
                                float _1290 = _416;
                                bool _1292 = !_1280;
                                float _1294 = _1290;
                                _378 = _1290;
                                if (!_1292)
                                {
                                    bool _1296 = _392 != 6.0;
                                    bool _1298 = isnan(_392);
                                    bool _1300 = _1296 || _1298;
                                    bool _1302 = isnan(6.0);
                                    bool _1304 = _1300 || _1302;
                                    if (!_1304)
                                    {
                                        float _1306 = -_218;
                                        float _1308 = _1306 + 1.0;
                                        float _1310 = -_210;
                                        float _1312 = _1310 + 1.0;
                                        float _1314 = -_226;
                                        float _1316 = _1314 + 1.0;
                                        float _1318 = abs(_1308);
                                        float _1320 = log2(_1318);
                                        float _1322 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1324 = abs(_1312);
                                        float _1326 = log2(_1324);
                                        float _1328 = abs(_1316);
                                        float _1330 = log2(_1328);
                                        float _1332 = _1320 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1334 = _1326 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1336 = exp2(_1332);
                                        float _1338 = _1330 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1340 = exp2(_1334);
                                        float _1342 = exp2(_1338);
                                        float _1344 = fma(_1322, _1336, 1.0);
                                        float _1346 = fma(_1322, _1340, 1.0);
                                        float _1348 = 1.0 / _1344;
                                        float _1350 = fma(_1322, _1342, 1.0);
                                        float _1352 = 1.0 / _1346;
                                        float _1354 = 1.0 / _1350;
                                        float _1356 = _1348 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1358 = _1352 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1360 = precise::max(_1358, _1356);
                                        float _1362 = _1354 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1364 = precise::max(_1362, _1360);
                                        float _1366 = -_1358;
                                        float _1368 = _1366 + _1364;
                                        float _1370 = -_1356;
                                        float _1372 = _1370 + _1364;
                                        float _1374 = -_1362;
                                        float _1376 = _1374 + _1364;
                                        float _1378 = fma(_1368, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1358);
                                        float _1380 = fma(_1372, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1356);
                                        float _1382 = fma(_1376, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1362);
                                        float _1384 = _210 * _1378;
                                        float _1386 = _218 * _1380;
                                        float _1388 = _226 * _1382;
                                        _368 = _1384;
                                        _370 = _1386;
                                        _378 = _1388;
                                        _380 = true;
                                    }
                                    else
                                    {
                                        bool _1390 = _392 != 7.0;
                                        bool _1392 = isnan(_392);
                                        bool _1394 = _1390 || _1392;
                                        bool _1396 = isnan(7.0);
                                        bool _1398 = _1394 || _1396;
                                        if (_1398)
                                        {
                                            _1284 = 0.0;
                                            _1288 = 0.0;
                                        }
                                        float _1400 = _1284;
                                        float _1402 = _1288;
                                        _368 = _1400;
                                        _370 = _1402;
                                        if (_1398)
                                        {
                                            _1294 = 0.0;
                                        }
                                        float _1404 = _1294;
                                        _378 = _1404;
                                        if (!_1398)
                                        {
                                            float _1406 = -_218;
                                            float _1408 = _1406 + 1.0;
                                            float _1410 = -_210;
                                            float _1412 = _1410 + 1.0;
                                            float _1414 = -_226;
                                            float _1416 = _1414 + 1.0;
                                            float _1418 = abs(_1408);
                                            float _1420 = log2(_1418);
                                            float _1422 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1424 = abs(_1412);
                                            float _1426 = log2(_1424);
                                            float _1428 = abs(_1416);
                                            float _1430 = log2(_1428);
                                            float _1432 = _1420 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1434 = _1426 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1436 = exp2(_1432);
                                            float _1438 = _1430 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1440 = exp2(_1434);
                                            float _1442 = exp2(_1438);
                                            float _1444 = fma(_1422, _1436, 1.0);
                                            float _1446 = fma(_1422, _1440, 1.0);
                                            float _1448 = 1.0 / _1444;
                                            float _1450 = fma(_1422, _1442, 1.0);
                                            float _1452 = 1.0 / _1446;
                                            float _1454 = 1.0 / _1450;
                                            float _1456 = _1448 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1458 = _1452 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1460 = -_210;
                                            float _1462 = fma(_210, _1458, _1460);
                                            float _1464 = -_218;
                                            float _1466 = fma(_218, _1456, _1464);
                                            float _1468 = _1454 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1470 = _1462 + _1466;
                                            float _1472 = -_226;
                                            float _1474 = fma(_226, _1468, _1472);
                                            float _1476 = _1474 + _1470;
                                            float _1478 = -_1462;
                                            float _1480 = fma(_1476, 0.3333333432674407958984375, _1478);
                                            float _1482 = -_1466;
                                            float _1484 = fma(_1476, 0.3333333432674407958984375, _1482);
                                            float _1486 = -_1474;
                                            float _1488 = fma(_1476, 0.3333333432674407958984375, _1486);
                                            float _1490 = fma(_1480, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1462);
                                            float _1492 = fma(_1484, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1466);
                                            float _1494 = fma(_1488, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1474);
                                            float _1496 = _210 + _1490;
                                            float _1498 = _218 + _1492;
                                            float _1500 = _226 + _1494;
                                            _368 = _1496;
                                            _370 = _1498;
                                            _378 = _1500;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _380 = false;
        float _1502 = _368;
        float _1504 = _370;
        float _1506 = _378;
        _324 = _1502;
        _326 = _1504;
        _328 = _1506;
    }
    _330 = false;
    float _1508 = _324;
    float _1510 = _326;
    float _1512 = _328;
    float _1514 = _1508 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1516 = _1510 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1518 = _1512 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_34.x = _1514;
    out.m_34.y = _1516;
    out.m_34.z = _1518;
    out.m_34.w = _74;
    return out;
}

