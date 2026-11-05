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

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
}

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    constant _16* fp_c5 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture3d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    texture3d<float> fp_t_tcb_10 [[id(12)]];
    sampler fp_t_tcb_10Smplr [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ESmplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _53(thread const int& _5723, thread const int& _5724, constant _10& support_buffer)
{
    int _5727 = 1 + _5724;
    float _5729 = support_buffer._m5[_5727].x;
    float _5731 = abs(_5729);
    bool _5733 = _5731 == 1.0;
    if (_5733)
    {
        return _5723;
    }
    float _5735 = float(_5723);
    float _5737 = _5735 / _5731;
    int _5739 = int(_5737);
    return _5739;
}

static inline __attribute__((always_inline))
int _55(thread const int& _5761, thread const int& _5762, thread const int& _5763, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _5766 = 1 + _5762;
    float _5768 = support_buffer._m5[_5766].x;
    bool _5770 = _5768 == 1.0;
    if (_5770)
    {
        return _5761;
    }
    bool _5772 = _5768 < 0.0;
    if (_5772)
    {
        float _5774 = -_5768;
        float _5776 = float(_5761);
        float _5778 = _5776 * _5774;
        float _5780 = gl_FragCoord.x;
        float _5782 = gl_FragCoord.y;
        float _5784 = (_5763 != 0) ? _5782 : _5780;
        float _5786 = mod(_5784, _5774);
        float _5788 = _5778 + _5786;
        int _5790 = int(_5788);
        return _5790;
    }
    float _5792 = float(_5761);
    float _5794 = _5792 * _5768;
    int _5796 = int(_5794);
    return _5796;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _2449 = false;
    bool _1173 = false;
    bool _2015 = false;
    bool _1915 = false;
    bool _1811 = false;
    bool _847 = false;
    int _58 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _60 = _58;
    int _62 = 0;
    int _64 = _53(_60, _62, (*spvDescriptorSet0.support_buffer));
    int _66 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _68 = _66;
    int _70 = 0;
    int _72 = _53(_68, _70, (*spvDescriptorSet0.support_buffer));
    float _75 = gl_FragCoord.w;
    float _77 = in.m_44.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_44.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _75;
    float _91 = _89 * _81;
    float _93 = _89 * _87;
    float _95 = float(_72);
    float _97 = float(_64);
    float _99 = fma(_91, _95, -0.4999000132083892822265625);
    float _101 = fma(_93, _97, -0.4999000132083892822265625);
    float _103 = floor(_99);
    int _105 = int(_103);
    float _107 = floor(_101);
    int _109 = int(_107);
    int _111 = _105 + 1;
    int _113 = _109 + 1;
    int _115 = _109;
    int _117 = 1;
    int _119 = 0;
    int _121 = _55(_115, _117, _119, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _123 = _105;
    int _125 = 1;
    int _127 = 1;
    int _129 = _55(_123, _125, _127, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _131 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_121, _129)), 0).x;
    int _133 = _109;
    int _135 = 1;
    int _137 = 0;
    int _139 = _55(_133, _135, _137, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _141 = _111;
    int _143 = 1;
    int _145 = 1;
    int _147 = _55(_141, _143, _145, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _149 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_139, _147)), 0).x;
    int _151 = _113;
    int _153 = 1;
    int _155 = 0;
    int _157 = _55(_151, _153, _155, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _159 = _111;
    int _161 = 1;
    int _163 = 1;
    int _165 = _55(_159, _161, _163, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _167 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_157, _165)), 0).x;
    int _169 = _113;
    int _171 = 1;
    int _173 = 0;
    int _175 = _55(_169, _171, _173, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _177 = _105;
    int _179 = 1;
    int _181 = 1;
    int _183 = _55(_177, _179, _181, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _185 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_175, _183)), 0).x;
    int _187 = _109;
    int _189 = 0;
    int _191 = 0;
    int _193 = _55(_187, _189, _191, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _195 = _105;
    int _197 = 0;
    int _199 = 1;
    int _201 = _55(_195, _197, _199, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _204 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_193, _201)), 0).xyzw;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    float _212 = _204.w;
    int _214 = _109;
    int _216 = 0;
    int _218 = 0;
    int _220 = _55(_214, _216, _218, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _222 = _111;
    int _224 = 0;
    int _226 = 1;
    int _228 = _55(_222, _224, _226, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _230 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_220, _228)), 0).xyzw;
    float _232 = _230.x;
    float _234 = _230.y;
    float _236 = _230.z;
    float _238 = _230.w;
    int _240 = _113;
    int _242 = 0;
    int _244 = 0;
    int _246 = _55(_240, _242, _244, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _248 = _111;
    int _250 = 0;
    int _252 = 1;
    int _254 = _55(_248, _250, _252, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _256 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_246, _254)), 0).xyzw;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = _256.w;
    int _266 = _113;
    int _268 = 0;
    int _270 = 0;
    int _272 = _55(_266, _268, _270, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _274 = _105;
    int _276 = 0;
    int _278 = 1;
    int _280 = _55(_274, _276, _278, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _282 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_272, _280)), 0).xyzw;
    float _284 = _282.x;
    float _286 = _282.y;
    float _288 = _282.z;
    float _290 = _282.w;
    float _292 = floor(_101);
    float _294 = float(_105);
    float _296 = float(_109);
    float _298 = _294 + 0.5;
    float _300 = floor(_99);
    float _302 = 1.0 / _95;
    float _304 = -_292;
    float _306 = _101 + _304;
    float _308 = 1.0 / _97;
    float _310 = -_300;
    float _312 = _99 + _310;
    float _314 = float(_111);
    float _316 = float(_113);
    float _318 = -_306;
    float _320 = _318 + 1.0;
    float _322 = -_312;
    float _324 = _322 + 1.0;
    float _326 = _314 + 0.5;
    float _328 = _296 + 0.5;
    float _330 = _316 + 0.5;
    float _332 = _320 * _324;
    float _334 = _306 * _324;
    float _336 = _312 * _320;
    float _338 = _298 * _302;
    float _340 = _326 * _302;
    float _342 = _306 * _312;
    float _344 = _328 * _308;
    float _346 = _330 * _308;
    int _348 = 0;
    float _350 = _312;
    float _352 = _101;
    float _354 = _99;
    float _356 = 0.0;
    float _358 = 0.0;
    float _360 = _97;
    float _362 = _302;
    float _364 = _306;
    int _366 = 0;
    float _368 = 0.0;
    int _370 = 0;
    int _372 = 0;
    float _374 = 0.0;
    float _376 = 0.0;
    float _378 = 0.0;
    float _380 = 0.0;
    float _382 = 0.0;
    float _1159;
    float _1161;
    float _1163;
    float _1165;
    float _1167;
    float _1169;
    float _1171;
    float _1807;
    float _1809;
    float _1911;
    float _1913;
    float _2013;
    float _2429;
    float _2435;
    float _2445;
    float _2447;
    do
    {
        int _384 = _348;
        float _386 = _350;
        float _388 = _352;
        float _390 = _354;
        float _392 = _356;
        float _394 = _358;
        float _396 = _360;
        float _398 = _362;
        float _400 = _364;
        int _402 = _366;
        float _404 = _368;
        int _406 = _370;
        int _408 = _372;
        float _410 = _374;
        float _412 = _376;
        float _414 = _378;
        float _416 = _380;
        float _418 = _382;
        int _420 = _384 << 3;
        int _422 = _384 << 4;
        bool _426 = _420 == 8;
        bool _428 = 0 == _420;
        bool _430 = _422 == 0;
        bool _432 = _420 == 16;
        int _434 = _384 << 2;
        bool _436 = _422 == 16;
        bool _438 = _434 == 0;
        bool _440 = _420 == 24;
        bool _442 = _434 == 4;
        float _444 = _398;
        float _446 = _396;
        float _448 = _388;
        float _450 = _392;
        float _452 = _390;
        float _454 = _386;
        float _456 = _394;
        float _458 = _400;
        int _460 = _406;
        float _462 = _404;
        float _464 = as_type<float>(_402);
        float _466 = as_type<float>(_408);
        float _468 = _410;
        if (_428)
        {
            _444 = _338;
        }
        float _470 = _444;
        bool _472 = _434 == 8;
        float _474 = _470;
        if (_428)
        {
            _446 = _344;
        }
        float _476 = _446;
        bool _478 = _422 == 32;
        float _480 = _476;
        if (_426)
        {
            _474 = _340;
        }
        float _482 = _474;
        int _484 = _438 ? 64 : 0;
        float _486 = _482;
        if (_426)
        {
            _480 = _344;
        }
        float _488 = _480;
        float _490 = _488;
        if (_430)
        {
            _448 = _206;
        }
        float _492 = _448;
        float _494 = _492;
        if (_432)
        {
            _486 = _340;
        }
        float _496 = _486;
        bool _498 = _422 == 48;
        float _500 = _496;
        if (_432)
        {
            _490 = _346;
        }
        float _502 = _490;
        float _504 = _502;
        if (_430)
        {
            _450 = _210;
        }
        float _506 = _450;
        bool _508 = _434 == 12;
        float _510 = _506;
        if (_430)
        {
            _452 = _208;
        }
        float _512 = _452;
        float _514 = _512;
        if (_436)
        {
            _514 = _234;
        }
        float _516 = _514;
        float _518 = _516;
        if (_438)
        {
            _454 = _131;
        }
        float _520 = _454;
        float _522 = _520;
        if (_436)
        {
            _494 = _232;
        }
        float _524 = _494;
        float _526 = _524;
        if (_436)
        {
            _510 = _236;
        }
        float _528 = _510;
        float _530 = _528;
        if (_442)
        {
            _522 = _149;
        }
        float _532 = _522;
        float _534 = _532;
        if (_472)
        {
            _534 = _167;
        }
        float _536 = _534;
        float _538 = _536;
        if (_508)
        {
            _538 = _185;
        }
        float _540 = _538;
        float _542 = _540;
        if (_478)
        {
            _526 = _258;
        }
        float _544 = _526;
        float _546 = _544;
        if (_478)
        {
            _518 = _260;
        }
        float _548 = _518;
        bool _550 = _540 >= 1.0;
        bool _552 = isnan(_540);
        bool _554 = _550 || _552;
        bool _556 = isnan(1.0);
        bool _558 = _554 || _556;
        float _560 = _548;
        if (_478)
        {
            _530 = _262;
        }
        float _562 = _530;
        float _564 = _562;
        if (_498)
        {
            _560 = _286;
        }
        float _566 = _560;
        float _568 = _566;
        if (_440)
        {
            _504 = _346;
        }
        float _570 = _504;
        float _572 = _570;
        if (_440)
        {
            _500 = _338;
        }
        float _574 = _500;
        float _576 = _574;
        if (_498)
        {
            _546 = _284;
        }
        float _578 = _546;
        float _580 = _578;
        if (_498)
        {
            _564 = _288;
        }
        float _582 = _564;
        float _584 = _582;
        if (_558)
        {
            _456 = _578;
        }
        float _586 = _456;
        float _588 = _586;
        float _590 = _586;
        if (_558)
        {
            _542 = _566;
        }
        float _592 = _542;
        float _594 = _592;
        float _596 = _592;
        if (_558)
        {
            _458 = _582;
        }
        float _598 = _458;
        float _600 = _598;
        float _602 = _598;
        if (!_558)
        {
            bool _604 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
            bool _606 = isnan(0.0);
            bool _608 = _604 || _606;
            bool _610 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
            bool _612 = _608 || _610;
            if (!_612)
            {
                float _614 = _578 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _588 = _614;
            }
            float _616 = _588;
            _590 = _616;
            if (!_612)
            {
                float _618 = _566 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _594 = _618;
            }
            float _620 = _594;
            _596 = _620;
            if (!_612)
            {
                float _622 = _582 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _600 = _622;
            }
            float _624 = _600;
            bool _626 = !_612;
            _602 = _624;
            if (!_626)
            {
                float _628 = _566 * 0.715200006961822509765625;
                float _630 = fma(_578, 0.2125999927520751953125, _628);
                float _632 = fma(_582, 0.072200000286102294921875, _630);
                float _634 = 1.0 / _632;
                float _636 = _634 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _638 = precise::clamp(_636, 0.0, 1.0);
                float _640 = fma(_638, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
                float _642 = _578 * _640;
                float _644 = _566 * _640;
                float _646 = _582 * _640;
                _596 = _644;
                _590 = _642;
                _602 = _646;
                _460 = as_type<int>(_632);
            }
        }
        float _648 = _596;
        float _650 = _590;
        float _652 = _602;
        int _654 = _460;
        float _656 = _652;
        float _658 = _648;
        float _660 = _650;
        int _662 = _654;
        if (_558)
        {
            _580 = _650;
        }
        float _664 = _580;
        float _666 = _664;
        if (_558)
        {
            _568 = _648;
        }
        float _668 = _568;
        float _670 = _668;
        if (!_558)
        {
            float _672 = _570 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _674 = _574 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float2 _3095 = float2(_672, _674);
            float3 _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3095, float2(0.0), isnan(_3095))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3095, float2(0.0), isnan(_3095))).xyz;
            float _680 = _678.x;
            float _682 = _678.y;
            float _684 = _678.z;
            float _686 = _680 + _650;
            float _688 = _682 + _648;
            float _690 = _684 + _652;
            _584 = _684;
            _656 = _690;
            _666 = _686;
            _670 = _688;
            _462 = _674;
        }
        float _692 = _584;
        float _694 = _656;
        float _696 = _666;
        float _698 = _670;
        float _700 = _462;
        float _702 = _692;
        float _704 = _694;
        float _706 = _696;
        float _708 = _698;
        float _710 = _700;
        if (!_558)
        {
            float _712 = _570 + (-0.5);
            float _714 = _574 + (-0.5);
            float _716 = _696 * 4.0;
            float _718 = fma(_714, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
            float _720 = _712 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
            float _722 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
            float _724 = _698 * 4.0;
            float _726 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
            float _728 = -_726;
            float _730 = fma(_728, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
            float _732 = _718 * _718;
            bool _734 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
            float _736 = _694 * 4.0;
            bool _738 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
            bool _740 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
            bool _742 = _738 || _740;
            bool _744 = isnan(-1.0999999631167156621813774108887e-06);
            bool _746 = _742 || _744;
            float _748 = fma(_720, _720, _732);
            float _750 = precise::max(0.0, _730);
            int _752 = _746 ? 0 : 1;
            uint _755 = as_type<uint>(half2(float2(_716, _724)));
            float _757 = -_750;
            float _759 = _722 + _757;
            float _761 = sqrt(_748);
            int _763 = ~_752;
            int _765 = _763 + 1;
            int _767 = _765 + 1;
            int _769 = _767;
            _662 = int(_755);
            if (!_734)
            {
                int _771 = ~_752;
                int _773 = _771 + 1;
                _769 = _773;
            }
            int _775 = _769;
            uint _777 = as_type<uint>(half2(float2(_736, 0.0)));
            float _779 = float(_775);
            float _781 = 1.0 / _759;
            uint _783 = extract_bits(_777, 0u, 8u);
            int _785 = int(_783) & 255;
            uint _787 = extract_bits(_777, 8u, 8u);
            int _789 = int(_787) & 255;
            int _791 = _789 << 8;
            int _793 = _785 | _791;
            int _795 = int(_755) & 32767;
            float _797 = float(uint(_793));
            float _799 = float(uint(_795));
            float _801 = -_750;
            float _803 = _761 + _801;
            uint _805 = extract_bits(_755, 16u, 16u);
            float _807 = float(_805);
            float _809 = _803 * _781;
            float _811 = precise::clamp(_809, 0.0, 1.0);
            float _813 = fma(_811, -2.0, 3.0);
            float _815 = _811 * _811;
            float _817 = fma(_815, _813, -0.5);
            float _819 = fma(_817, _779, 0.5);
            float _821 = precise::max(_819, (*spvDescriptorSet0.fp_c4)._m0[5].w);
            float _823 = fma(_807, 6.103515625e-05, -0.3125);
            float _825 = fma(_797, 6.103515625e-05, -0.3125);
            float _827 = fma(_799, 6.103515625e-05, -0.3125);
            bool _829 = _821 > 0.999000012874603271484375;
            float _831 = fma(_823, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _833 = fma(_825, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _835 = fma(_827, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            bool _837 = !_829;
            _658 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
            _702 = _781;
            _660 = _821;
            _576 = _831;
            _572 = _835;
            _710 = _833;
            if (!_837)
            {
                float3 _3343 = float3(_835, _831, _833);
                float3 _839 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3343, float3(0.0), isnan(_3343))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3343, float3(0.0), isnan(_3343))).xyz;
                float _841 = _839.x;
                float _843 = _839.y;
                float _845 = _839.z;
                _704 = _845;
                _706 = _841;
                _708 = _843;
                _847 = true;
            }
            else
            {
                bool _849 = _821 >= 0.001000000047497451305389404296875;
                bool _851 = isnan(_821);
                bool _853 = _849 || _851;
                bool _855 = isnan(0.001000000047497451305389404296875);
                bool _857 = _853 || _855;
                if (!_857)
                {
                    float3 _3380 = float3(_835, _831, _833);
                    float3 _859 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3380, float3(0.0), isnan(_3380))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3380, float3(0.0), isnan(_3380))).xyz;
                    float _861 = _859.x;
                    float _863 = _859.y;
                    float _865 = _859.z;
                    _704 = _865;
                    _706 = _861;
                    _708 = _863;
                    _847 = true;
                }
                else
                {
                    float3 _3399 = float3(_835, _831, _833);
                    float3 _867 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3399, float3(0.0), isnan(_3399))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3399, float3(0.0), isnan(_3399))).xyz;
                    float _869 = _867.x;
                    float _871 = _867.y;
                    float _873 = _867.z;
                    float3 _3414 = float3(_835, _831, _833);
                    float3 _875 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3414, float3(0.0), isnan(_3414))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3414, float3(0.0), isnan(_3414))).xyz;
                    float _877 = _875.x;
                    float _879 = _875.y;
                    float _881 = _875.z;
                    float _883 = -_869;
                    float _885 = _877 + _883;
                    float _887 = -_871;
                    float _889 = _879 + _887;
                    float _891 = -_873;
                    float _893 = _881 + _891;
                    float _895 = fma(_821, _885, _869);
                    float _897 = fma(_821, _889, _871);
                    float _899 = fma(_821, _893, _873);
                    _658 = _885;
                    _702 = _889;
                    _704 = _899;
                    _706 = _895;
                    _708 = _897;
                    _662 = as_type<int>(_893);
                }
            }
        }
        _847 = false;
        float _901 = _658;
        float _903 = _702;
        float _905 = _660;
        float _907 = _704;
        float _909 = _706;
        float _911 = _708;
        float _913 = _576;
        float _915 = _572;
        float _917 = _710;
        int _919 = _662;
        float _921 = _901;
        float _923 = _913;
        float _925 = _915;
        float _927 = _903;
        float _929 = _905;
        int _931 = _919;
        float _933 = _917;
        float _935 = _907;
        float _937 = _911;
        float _939 = _907;
        float _941 = _907;
        float _943 = _907;
        float _945 = _917;
        if (_558)
        {
            _921 = _909;
        }
        float _947 = _921;
        float _949 = _947;
        if (_558)
        {
            _923 = _911;
        }
        float _951 = _923;
        float _953 = _951;
        if (_558)
        {
            _925 = _907;
        }
        float _955 = _925;
        float _957 = _955;
        if (!_558)
        {
            bool _959 = _909 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _961 = isnan(_909);
            bool _963 = _959 || _961;
            bool _965 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _967 = _963 || _965;
            bool _969 = _911 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _971 = isnan(_911);
            bool _973 = _969 || _971;
            bool _975 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _977 = _973 || _975;
            float _979 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _981 = fma(_911, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _983 = fma(_907, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            bool _985 = _907 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _987 = isnan(_907);
            bool _989 = _985 || _987;
            bool _991 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _993 = _989 || _991;
            float _995 = exp2(_979);
            float _997 = exp2(_981);
            float _999 = exp2(_983);
            float _1001 = -_995;
            float _1003 = _1001 + 1.0;
            bool _1005 = !_967;
            float _1007 = _1005 ? _909 : _1003;
            float _1009 = -_997;
            float _1011 = _1009 + 1.0;
            bool _1013 = !_977;
            float _1015 = _1013 ? _911 : _1011;
            float _1017 = -_999;
            float _1019 = _1017 + 1.0;
            bool _1021 = !_993;
            float _1023 = _1021 ? _907 : _1019;
            _949 = _1007;
            _927 = _997;
            _929 = _999;
            _953 = _1015;
            _957 = _1023;
            _931 = as_type<int>(_1011);
        }
        float _1025 = _949;
        float _1027 = _927;
        float _1029 = _929;
        float _1031 = _953;
        float _1033 = _957;
        int _1035 = _931;
        float _1037 = _1029;
        int _1039 = _1035;
        float _1041 = _1027;
        float _1043 = _1029;
        float _1045 = as_type<float>(_1035);
        float _1047 = _1025;
        float _1049 = _1031;
        float _1051 = _1033;
        float _1053 = _1025;
        float _1055 = _1027;
        float _1057 = _1029;
        int _1059 = _1035;
        float _1061 = _1031;
        float _1063 = _1033;
        if (!_558)
        {
            bool _1065 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
            bool _1067 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
            bool _1069 = _1065 || _1067;
            bool _1071 = isnan(6.0);
            bool _1073 = _1069 || _1071;
            if (!_1073)
            {
                float _1075 = -_1025;
                float _1077 = _1075 + 1.0;
                float _1079 = -_1031;
                float _1081 = _1079 + 1.0;
                float _1083 = -_1033;
                float _1085 = _1083 + 1.0;
                float _1087 = abs(_1077);
                float _1089 = log2(_1087);
                float _1091 = abs(_1081);
                float _1093 = log2(_1091);
                float _1095 = abs(_1085);
                float _1097 = log2(_1095);
                float _1099 = _1089 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1101 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                float _1103 = _1093 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1105 = exp2(_1099);
                float _1107 = _1097 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1109 = exp2(_1103);
                float _1111 = exp2(_1107);
                float _1113 = fma(_1101, _1105, 1.0);
                float _1115 = fma(_1101, _1109, 1.0);
                float _1117 = 1.0 / _1113;
                float _1119 = fma(_1101, _1111, 1.0);
                float _1121 = 1.0 / _1115;
                float _1123 = 1.0 / _1119;
                float _1125 = _1117 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1127 = _1121 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1129 = precise::max(_1125, _1127);
                float _1131 = _1123 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1133 = precise::max(_1131, _1129);
                float _1135 = -_1125;
                float _1137 = _1135 + _1133;
                float _1139 = -_1127;
                float _1141 = _1139 + _1133;
                float _1143 = -_1131;
                float _1145 = _1143 + _1133;
                float _1147 = fma(_1137, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1125);
                float _1149 = fma(_1141, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1127);
                float _1151 = fma(_1145, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1131);
                float _1153 = _1147 * _1025;
                float _1155 = _1149 * _1031;
                float _1157 = _1151 * _1033;
                _1159 = _1153;
                _1161 = _1155;
                _941 = _1117;
                _1163 = _1151;
                _1165 = _1157;
                _1167 = _1153;
                _1169 = _1155;
                _1171 = _1157;
                _1173 = true;
            }
            else
            {
                bool _1175 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
                if (!_1175)
                {
                    _933 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
                }
                float _1177 = _933;
                bool _1179 = !_1175;
                float _1181 = _1177;
                _1163 = _1177;
                if (!_1179)
                {
                    float _1183 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
                    float _1185 = _93 + _1183;
                    float _1187 = abs(_1185);
                    float _1189 = _1187 * 2560.0;
                    bool _1191 = _1189 >= 2.0;
                    bool _1193 = isnan(_1189);
                    bool _1195 = _1191 || _1193;
                    bool _1197 = isnan(2.0);
                    bool _1199 = _1195 || _1197;
                    float _1201 = _1189;
                    if (!_1199)
                    {
                        _1201 = 0.0;
                        _1037 = 0.0;
                    }
                    float _1203 = _1201;
                    float _1205 = _1037;
                    float _1207 = _1203;
                    float _1209 = _1205;
                    _1159 = _1203;
                    _1161 = _1205;
                    _1167 = _1203;
                    _1169 = _1205;
                    if (!_1199)
                    {
                        _1039 = 0;
                    }
                    int _1211 = _1039;
                    bool _1213 = !_1199;
                    float _1215 = as_type<float>(_1211);
                    _1165 = as_type<float>(_1211);
                    _1171 = as_type<float>(_1211);
                    _1173 = _1213;
                    if (!_1173)
                    {
                        bool _1217 = _93 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                        if (_1217)
                        {
                            _1207 = _1025;
                        }
                        float _1219 = _1207;
                        _1041 = _1219;
                        _1159 = _1219;
                        _1167 = _1219;
                        if (_1217)
                        {
                            _1209 = _1031;
                        }
                        float _1221 = _1209;
                        _1043 = _1221;
                        _1161 = _1221;
                        _1169 = _1221;
                        if (_1217)
                        {
                            _1215 = _1033;
                        }
                        int _1223 = as_type<int>(_1215);
                        _1045 = as_type<float>(_1223);
                        _1165 = as_type<float>(_1223);
                        _1171 = as_type<float>(_1223);
                        _1173 = _1217;
                        if (!_1173)
                        {
                            float _1225 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                            _1181 = _1225;
                        }
                    }
                }
                if (!_1173)
                {
                    float _1227 = _1041;
                    float _1229 = _1043;
                    float _1231 = _1181;
                    int _1233 = as_type<int>(_1045);
                    bool _1235 = _1231 != 0.0;
                    bool _1237 = isnan(_1231);
                    bool _1239 = _1235 || _1237;
                    bool _1241 = isnan(0.0);
                    bool _1243 = _1239 || _1241;
                    float _1245 = _1231;
                    float _1247 = _1231;
                    float _1249 = _1227;
                    float _1251 = _1229;
                    int _1253 = _1233;
                    _1163 = _1231;
                    if (!_1243)
                    {
                        float _1255 = _911 * 0.586600005626678466796875;
                        float _1257 = fma(_909, 0.29890000820159912109375, _1255);
                        float _1259 = fma(_907, 0.1143999993801116943359375, _1257);
                        float _1261 = _1259 * (-1.44269502162933349609375);
                        float _1263 = exp2(_1261);
                        float _1265 = -_1263;
                        float _1267 = _1265 + 1.0;
                        bool _1269 = _1267 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _1271 = isnan(_1267);
                        bool _1273 = _1269 || _1271;
                        bool _1275 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _1277 = _1273 || _1275;
                        float _1279 = _1259;
                        if (!_1277)
                        {
                            _1279 = _1267;
                        }
                        float _1281 = _1279;
                        bool _1283 = !_1277;
                        float _1285 = _1281;
                        if (!_1283)
                        {
                            float _1287 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1289 = _1267 + _1287;
                            float _1291 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1293 = spvFAdd(_1291, 1.00000095367431640625);
                            float _1295 = 1.0 / _1293;
                            float _1297 = _1289 * _1295;
                            float _1299 = -_1297;
                            float _1301 = _1299 + 1.0;
                            float _1303 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1305 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1303;
                            float _1307 = abs(_1301);
                            float _1309 = log2(_1307);
                            float _1311 = _1305 * _1295;
                            float _1313 = _1311 + (-1.0);
                            float _1315 = _1311 * _1297;
                            float _1317 = _1309 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1319 = exp2(_1317);
                            float _1321 = fma(_1313, _1319, 1.0);
                            float _1323 = 1.0 / _1321;
                            float _1325 = _1315 * _1323;
                            float _1327 = fma(_1293, _1325, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _1285 = _1327;
                        }
                        float _1329 = _1285;
                        float _1331 = -_1267;
                        float _1333 = _1331 + _1329;
                        float _1335 = _1031 * 0.586600005626678466796875;
                        float _1337 = _1333 + 1.0;
                        float _1339 = fma(_1025, 0.29890000820159912109375, _1335);
                        float _1341 = fma(_1033, 0.1143999993801116943359375, _1339);
                        float _1343 = abs(_1337);
                        float _1345 = log2(_1343);
                        float _1347 = spvFAdd(_1341, 9.9999999747524270787835121154785e-07);
                        float _1349 = 1.0 / _1347;
                        float _1351 = _1345 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                        float _1353 = exp2(_1351);
                        float _1355 = fma(_1349, _1025, -1.0);
                        float _1357 = fma(_1349, _1031, -1.0);
                        float _1359 = fma(_1349, _1033, -1.0);
                        float _1361 = fma(_1353, _1355, 1.0);
                        float _1363 = fma(_1353, _1357, 1.0);
                        float _1365 = fma(_1353, _1359, 1.0);
                        float _1367 = _1361 * _1329;
                        float _1369 = _1363 * _1329;
                        float _1371 = _1365 * _1329;
                        float _1373 = precise::max(0.0, _1367);
                        float _1375 = precise::max(0.0, _1369);
                        float _1377 = precise::max(0.0, _1371);
                        float _1379 = precise::min(_1373, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1381 = precise::min(_1375, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1383 = precise::min(_1377, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _1159 = _1379;
                        _1161 = _1381;
                        _941 = _1353;
                        _1165 = _1383;
                        _1167 = _1379;
                        _1169 = _1381;
                        _1171 = _1383;
                        _1173 = true;
                    }
                    else
                    {
                        bool _1385 = _1231 != 1.0;
                        bool _1387 = isnan(_1231);
                        bool _1389 = _1385 || _1387;
                        bool _1391 = isnan(1.0);
                        bool _1393 = _1389 || _1391;
                        if (!_1393)
                        {
                            bool _1395 = _1025 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1397 = isnan(_1025);
                            bool _1399 = _1395 || _1397;
                            bool _1401 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1403 = _1399 || _1401;
                            float _1405 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1407 = spvFAdd(_1405, 1.00000095367431640625);
                            bool _1409 = _1031 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1411 = isnan(_1031);
                            bool _1413 = _1409 || _1411;
                            bool _1415 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1417 = _1413 || _1415;
                            bool _1419 = _1033 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1421 = isnan(_1033);
                            bool _1423 = _1419 || _1421;
                            bool _1425 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1427 = _1423 || _1425;
                            float _1429 = 1.0 / _1407;
                            float _1431 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1433 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1431;
                            float _1435 = _1433 * _1429;
                            bool _1437 = !_1403;
                            float _1439 = _1435;
                            if (!_1437)
                            {
                                float _1441 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1443 = _1025 + _1441;
                                float _1445 = _1435 + (-1.0);
                                float _1447 = _1443 * _1429;
                                float _1449 = -_1447;
                                float _1451 = _1449 + 1.0;
                                float _1453 = _1435 * _1447;
                                float _1455 = abs(_1451);
                                float _1457 = log2(_1455);
                                float _1459 = _1457 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1461 = exp2(_1459);
                                float _1463 = fma(_1445, _1461, 1.0);
                                float _1465 = 1.0 / _1463;
                                float _1467 = _1453 * _1465;
                                float _1469 = fma(_1407, _1467, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1047 = _1469;
                            }
                            float _1471 = _1047;
                            bool _1473 = !_1417;
                            if (!_1473)
                            {
                                float _1475 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1477 = _1031 + _1475;
                                float _1479 = _1435 + (-1.0);
                                float _1481 = _1477 * _1429;
                                float _1483 = -_1481;
                                float _1485 = _1483 + 1.0;
                                float _1487 = _1435 * _1481;
                                float _1489 = abs(_1485);
                                float _1491 = log2(_1489);
                                float _1493 = _1491 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1495 = exp2(_1493);
                                float _1497 = fma(_1479, _1495, 1.0);
                                float _1499 = 1.0 / _1497;
                                float _1501 = _1487 * _1499;
                                float _1503 = fma(_1407, _1501, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1049 = _1503;
                            }
                            float _1505 = _1049;
                            bool _1507 = !_1427;
                            if (!_1507)
                            {
                                float _1509 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1511 = _1033 + _1509;
                                float _1513 = _1435 + (-1.0);
                                float _1515 = _1511 * _1429;
                                float _1517 = -_1515;
                                float _1519 = _1517 + 1.0;
                                float _1521 = _1435 * _1515;
                                float _1523 = abs(_1519);
                                float _1525 = log2(_1523);
                                float _1527 = _1525 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1529 = exp2(_1527);
                                float _1531 = fma(_1513, _1529, 1.0);
                                float _1533 = 1.0 / _1531;
                                float _1535 = _1521 * _1533;
                                float _1537 = fma(_1407, _1535, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1439 = _1535;
                                _1051 = _1537;
                            }
                            float _1539 = _1439;
                            float _1541 = _1051;
                            float _1543 = precise::max(0.0, _1541);
                            float _1545 = precise::max(0.0, _1471);
                            float _1547 = precise::max(0.0, _1505);
                            float _1549 = precise::min(_1543, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1551 = precise::min(_1545, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1553 = precise::min(_1547, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            _1159 = _1551;
                            _1161 = _1553;
                            _941 = _1539;
                            _1165 = _1549;
                            _1167 = _1551;
                            _1169 = _1553;
                            _1171 = _1549;
                            _1173 = true;
                        }
                        else
                        {
                            bool _1555 = _1231 != 2.0;
                            bool _1557 = isnan(_1231);
                            bool _1559 = _1555 || _1557;
                            bool _1561 = isnan(2.0);
                            bool _1563 = _1559 || _1561;
                            if (!_1563)
                            {
                                float _1565 = _1031 * 0.715200006961822509765625;
                                float _1567 = fma(_1025, 0.2125999927520751953125, _1565);
                                float _1569 = fma(_1033, 0.072200000286102294921875, _1567);
                                float _1571 = spvFAdd(_1569, 9.9999999747524270787835121154785e-07);
                                bool _1573 = _1569 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1575 = isnan(_1569);
                                bool _1577 = _1573 || _1575;
                                bool _1579 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1581 = _1577 || _1579;
                                float _1583 = 1.0 / _1571;
                                bool _1585 = !_1581;
                                float _1587 = _1569;
                                if (!_1585)
                                {
                                    float _1589 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1591 = _1569 + _1589;
                                    float _1593 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1595 = spvFAdd(_1593, 1.00000095367431640625);
                                    float _1597 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1599 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1597;
                                    float _1601 = 1.0 / _1595;
                                    float _1603 = _1591 * _1601;
                                    float _1605 = _1599 * _1601;
                                    float _1607 = -_1603;
                                    float _1609 = _1607 + 1.0;
                                    float _1611 = _1605 + (-1.0);
                                    float _1613 = _1605 * _1603;
                                    float _1615 = abs(_1609);
                                    float _1617 = log2(_1615);
                                    float _1619 = _1617 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1621 = exp2(_1619);
                                    float _1623 = fma(_1611, _1621, 1.0);
                                    float _1625 = 1.0 / _1623;
                                    float _1627 = _1613 * _1625;
                                    float _1629 = fma(_1595, _1627, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    _935 = _1617;
                                    _1587 = _1629;
                                }
                                float _1631 = _935;
                                float _1633 = _1587;
                                float _1635 = precise::max(0.0, _1633);
                                float _1637 = precise::min(_1635, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1639 = _1583 * _1637;
                                float _1641 = _1025 * _1639;
                                float _1643 = _1031 * _1639;
                                float _1645 = _1033 * _1639;
                                float _1647 = precise::max(0.0, _1641);
                                float _1649 = precise::max(0.0, _1643);
                                float _1651 = precise::max(0.0, _1645);
                                float _1653 = precise::min(_1647, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1655 = precise::min(_1649, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1657 = precise::min(_1651, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                _1159 = _1653;
                                _1161 = _1655;
                                _941 = _1631;
                                _1165 = _1657;
                                _1167 = _1653;
                                _1169 = _1655;
                                _1171 = _1657;
                                _1173 = true;
                            }
                            else
                            {
                                bool _1659 = _1231 != 3.0;
                                bool _1661 = isnan(_1231);
                                bool _1663 = _1659 || _1661;
                                bool _1665 = isnan(3.0);
                                bool _1667 = _1663 || _1665;
                                if (!_1667)
                                {
                                    float _1669 = -_1025;
                                    float _1671 = _1669 + 1.0;
                                    float _1673 = -_1031;
                                    float _1675 = _1673 + 1.0;
                                    float _1677 = -_1033;
                                    float _1679 = _1677 + 1.0;
                                    float _1681 = abs(_1671);
                                    float _1683 = log2(_1681);
                                    float _1685 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1687 = abs(_1675);
                                    float _1689 = log2(_1687);
                                    float _1691 = abs(_1679);
                                    float _1693 = log2(_1691);
                                    float _1695 = _1683 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1697 = _1689 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1699 = exp2(_1695);
                                    float _1701 = _1693 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1703 = exp2(_1697);
                                    float _1705 = exp2(_1701);
                                    float _1707 = fma(_1685, _1699, 1.0);
                                    float _1709 = fma(_1685, _1703, 1.0);
                                    float _1711 = 1.0 / _1707;
                                    float _1713 = fma(_1685, _1705, 1.0);
                                    float _1715 = 1.0 / _1709;
                                    float _1717 = 1.0 / _1713;
                                    float _1719 = _1711 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1721 = _1711 + _1715;
                                    float _1723 = _1715 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1725 = precise::max(_1719, _1723);
                                    float _1727 = _1717 + _1721;
                                    float _1729 = _1717 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1731 = _1727 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1733 = precise::max(_1729, _1725);
                                    float _1735 = _1731 * 0.3333333432674407958984375;
                                    float _1737 = -_1735;
                                    float _1739 = _1733 + _1737;
                                    float _1741 = fma(_1739, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1735);
                                    float _1743 = -_1719;
                                    float _1745 = _1743 + _1741;
                                    float _1747 = -_1723;
                                    float _1749 = _1747 + _1741;
                                    float _1751 = -_1729;
                                    float _1753 = _1751 + _1741;
                                    float _1755 = fma(_1745, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1719);
                                    float _1757 = fma(_1749, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1723);
                                    float _1759 = fma(_1753, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1729);
                                    float _1761 = _1755 * _1025;
                                    float _1763 = _1757 * _1031;
                                    float _1765 = _1759 * _1033;
                                    _1159 = _1761;
                                    _1161 = _1763;
                                    _941 = _1749;
                                    _1165 = _1765;
                                    _1167 = _1761;
                                    _1169 = _1763;
                                    _1171 = _1765;
                                    _1173 = true;
                                }
                                else
                                {
                                    bool _1767 = _1231 != 4.0;
                                    bool _1769 = isnan(_1231);
                                    bool _1771 = _1767 || _1769;
                                    bool _1773 = isnan(4.0);
                                    bool _1775 = _1771 || _1773;
                                    if (!_1775)
                                    {
                                        bool _1777 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        bool _1779 = isnan(0.0);
                                        bool _1781 = _1777 || _1779;
                                        bool _1783 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        bool _1785 = _1781 || _1783;
                                        if (!_1785)
                                        {
                                            float _1787 = -_1025;
                                            float _1789 = _1787 + 1.0;
                                            float _1791 = abs(_1789);
                                            float _1793 = log2(_1791);
                                            float _1795 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1797 = _1793 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1799 = exp2(_1797);
                                            float _1801 = fma(_1795, _1799, 1.0);
                                            float _1803 = 1.0 / _1801;
                                            float _1805 = _1803 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1807 = _1799;
                                            _1809 = _1805;
                                            _1811 = true;
                                        }
                                        else
                                        {
                                            float _1813 = spvFAdd(_1025, 9.9999999747524270787835121154785e-07);
                                            bool _1815 = _1025 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1817 = isnan(_1025);
                                            bool _1819 = _1815 || _1817;
                                            bool _1821 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1823 = _1819 || _1821;
                                            float _1825 = 1.0 / _1813;
                                            if (!_1823)
                                            {
                                                _937 = _1025;
                                            }
                                            float _1827 = _937;
                                            bool _1829 = !_1823;
                                            float _1831 = _1827;
                                            if (!_1829)
                                            {
                                                float _1833 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1835 = _1025 + _1833;
                                                float _1837 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1839 = spvFAdd(_1837, 1.00000095367431640625);
                                                float _1841 = 1.0 / _1839;
                                                float _1843 = _1835 * _1841;
                                                float _1845 = -_1843;
                                                float _1847 = _1845 + 1.0;
                                                float _1849 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1851 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1849;
                                                float _1853 = abs(_1847);
                                                float _1855 = log2(_1853);
                                                float _1857 = _1851 * _1841;
                                                float _1859 = _1857 + (-1.0);
                                                float _1861 = _1857 * _1843;
                                                float _1863 = _1855 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1865 = exp2(_1863);
                                                float _1867 = fma(_1859, _1865, 1.0);
                                                float _1869 = 1.0 / _1867;
                                                float _1871 = _1861 * _1869;
                                                float _1873 = fma(_1839, _1871, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1831 = _1873;
                                                _939 = _1861;
                                            }
                                            float _1875 = _1831;
                                            float _1877 = _939;
                                            float _1879 = precise::max(0.0, _1875);
                                            float _1881 = precise::min(_1879, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1883 = _1881 * _1825;
                                            _1807 = _1877;
                                            _1809 = _1883;
                                        }
                                        _1811 = false;
                                        float _1885 = _1807;
                                        float _1887 = _1809;
                                        float _1889 = _1885;
                                        if (!_1785)
                                        {
                                            float _1891 = -_1031;
                                            float _1893 = _1891 + 1.0;
                                            float _1895 = abs(_1893);
                                            float _1897 = log2(_1895);
                                            float _1899 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1901 = _1897 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1903 = exp2(_1901);
                                            float _1905 = fma(_1899, _1903, 1.0);
                                            float _1907 = 1.0 / _1905;
                                            float _1909 = _1907 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1911 = _1903;
                                            _1913 = _1909;
                                            _1915 = true;
                                        }
                                        else
                                        {
                                            float _1917 = spvFAdd(_1031, 9.9999999747524270787835121154785e-07);
                                            bool _1919 = _1031 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1921 = isnan(_1031);
                                            bool _1923 = _1919 || _1921;
                                            bool _1925 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1927 = _1923 || _1925;
                                            float _1929 = 1.0 / _1917;
                                            if (!_1927)
                                            {
                                                _1889 = _1031;
                                            }
                                            float _1931 = _1889;
                                            bool _1933 = !_1927;
                                            float _1935 = _1931;
                                            if (!_1933)
                                            {
                                                float _1937 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1939 = _1031 + _1937;
                                                float _1941 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1943 = spvFAdd(_1941, 1.00000095367431640625);
                                                float _1945 = 1.0 / _1943;
                                                float _1947 = _1939 * _1945;
                                                float _1949 = -_1947;
                                                float _1951 = _1949 + 1.0;
                                                float _1953 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1955 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1953;
                                                float _1957 = abs(_1951);
                                                float _1959 = log2(_1957);
                                                float _1961 = _1955 * _1945;
                                                float _1963 = _1961 + (-1.0);
                                                float _1965 = _1961 * _1947;
                                                float _1967 = _1959 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1969 = exp2(_1967);
                                                float _1971 = fma(_1963, _1969, 1.0);
                                                float _1973 = 1.0 / _1971;
                                                float _1975 = _1965 * _1973;
                                                float _1977 = fma(_1943, _1975, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1935 = _1977;
                                            }
                                            float _1979 = _1935;
                                            float _1981 = precise::max(0.0, _1979);
                                            float _1983 = precise::min(_1981, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1985 = _1983 * _1929;
                                            _1911 = _1983;
                                            _1913 = _1985;
                                        }
                                        _1915 = false;
                                        float _1987 = _1911;
                                        float _1989 = _1913;
                                        float _1991 = _1987;
                                        if (!_1785)
                                        {
                                            float _1993 = -_1033;
                                            float _1995 = _1993 + 1.0;
                                            float _1997 = abs(_1995);
                                            float _1999 = log2(_1997);
                                            float _2001 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _2003 = _1999 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _2005 = exp2(_2003);
                                            float _2007 = fma(_2001, _2005, 1.0);
                                            float _2009 = 1.0 / _2007;
                                            float _2011 = _2009 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _2013 = _2011;
                                            _2015 = true;
                                        }
                                        else
                                        {
                                            float _2017 = spvFAdd(_1033, 9.9999999747524270787835121154785e-07);
                                            bool _2019 = _1033 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _2021 = isnan(_1033);
                                            bool _2023 = _2019 || _2021;
                                            bool _2025 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _2027 = _2023 || _2025;
                                            float _2029 = 1.0 / _2017;
                                            if (!_2027)
                                            {
                                                _1991 = _1033;
                                            }
                                            float _2031 = _1991;
                                            bool _2033 = !_2027;
                                            float _2035 = _2031;
                                            if (!_2033)
                                            {
                                                float _2037 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _2039 = _1033 + _2037;
                                                float _2041 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _2043 = spvFAdd(_2041, 1.00000095367431640625);
                                                float _2045 = 1.0 / _2043;
                                                float _2047 = _2039 * _2045;
                                                float _2049 = -_2047;
                                                float _2051 = _2049 + 1.0;
                                                float _2053 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _2055 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _2053;
                                                float _2057 = abs(_2051);
                                                float _2059 = log2(_2057);
                                                float _2061 = _2055 * _2045;
                                                float _2063 = _2061 + (-1.0);
                                                float _2065 = _2061 * _2047;
                                                float _2067 = _2059 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2069 = exp2(_2067);
                                                float _2071 = fma(_2063, _2069, 1.0);
                                                float _2073 = 1.0 / _2071;
                                                float _2075 = _2065 * _2073;
                                                float _2077 = fma(_2043, _2075, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1245 = _2069;
                                                _2035 = _2077;
                                            }
                                            float _2079 = _1245;
                                            float _2081 = _2035;
                                            float _2083 = precise::max(0.0, _2081);
                                            float _2085 = precise::min(_2083, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _2087 = _2085 * _2029;
                                            _1247 = _2079;
                                            _2013 = _2087;
                                        }
                                        _2015 = false;
                                        float _2089 = _1247;
                                        float _2091 = _2013;
                                        float _2093 = precise::max(_1887, _1989);
                                        float _2095 = precise::max(_2093, _2091);
                                        float _2097 = -_1887;
                                        float _2099 = _2095 + _2097;
                                        float _2101 = -_1989;
                                        float _2103 = _2095 + _2101;
                                        float _2105 = -_2091;
                                        float _2107 = _2095 + _2105;
                                        float _2109 = fma(_2099, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1887);
                                        float _2111 = fma(_2103, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1989);
                                        float _2113 = fma(_2107, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2091);
                                        float _2115 = _2109 * _1025;
                                        float _2117 = _2111 * _1031;
                                        float _2119 = _2113 * _1033;
                                        _1159 = _2115;
                                        _1161 = _2117;
                                        _941 = _2113;
                                        _1163 = _2089;
                                        _1165 = _2119;
                                        _1167 = _2115;
                                        _1169 = _2117;
                                        _1171 = _2119;
                                        _1173 = true;
                                    }
                                    else
                                    {
                                        bool _2121 = _1231 != 5.0;
                                        bool _2123 = isnan(_1231);
                                        bool _2125 = _2121 || _2123;
                                        bool _2127 = isnan(5.0);
                                        bool _2129 = _2125 || _2127;
                                        if (!_2129)
                                        {
                                            _1249 = _909;
                                        }
                                        float _2131 = _1249;
                                        float _2133 = _2131;
                                        _1159 = _2131;
                                        _1167 = _2131;
                                        if (!_2129)
                                        {
                                            _1251 = _911;
                                        }
                                        float _2135 = _1251;
                                        float _2137 = _2135;
                                        _1161 = _2135;
                                        _1169 = _2135;
                                        if (!_2129)
                                        {
                                            _1253 = as_type<int>(_907);
                                        }
                                        int _2139 = _1253;
                                        bool _2141 = !_2129;
                                        float _2143 = as_type<float>(_2139);
                                        _1165 = as_type<float>(_2139);
                                        _1171 = as_type<float>(_2139);
                                        if (!_2141)
                                        {
                                            bool _2145 = _1231 != 6.0;
                                            bool _2147 = isnan(_1231);
                                            bool _2149 = _2145 || _2147;
                                            bool _2151 = isnan(6.0);
                                            bool _2153 = _2149 || _2151;
                                            if (!_2153)
                                            {
                                                float _2155 = -_1025;
                                                float _2157 = _2155 + 1.0;
                                                float _2159 = -_1031;
                                                float _2161 = _2159 + 1.0;
                                                float _2163 = -_1033;
                                                float _2165 = _2163 + 1.0;
                                                float _2167 = abs(_2157);
                                                float _2169 = log2(_2167);
                                                float _2171 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                float _2173 = abs(_2161);
                                                float _2175 = log2(_2173);
                                                float _2177 = abs(_2165);
                                                float _2179 = log2(_2177);
                                                float _2181 = _2169 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2183 = _2175 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2185 = exp2(_2181);
                                                float _2187 = _2179 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2189 = exp2(_2183);
                                                float _2191 = exp2(_2187);
                                                float _2193 = fma(_2171, _2185, 1.0);
                                                float _2195 = fma(_2171, _2189, 1.0);
                                                float _2197 = 1.0 / _2193;
                                                float _2199 = fma(_2171, _2191, 1.0);
                                                float _2201 = 1.0 / _2195;
                                                float _2203 = 1.0 / _2199;
                                                float _2205 = _2197 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2207 = _2201 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2209 = precise::max(_2205, _2207);
                                                float _2211 = _2203 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2213 = precise::max(_2211, _2209);
                                                float _2215 = -_2205;
                                                float _2217 = _2215 + _2213;
                                                float _2219 = -_2207;
                                                float _2221 = _2219 + _2213;
                                                float _2223 = -_2211;
                                                float _2225 = _2223 + _2213;
                                                float _2227 = fma(_2217, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2205);
                                                float _2229 = fma(_2221, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2207);
                                                float _2231 = fma(_2225, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2211);
                                                float _2233 = _2227 * _1025;
                                                float _2235 = _2229 * _1031;
                                                float _2237 = _2231 * _1033;
                                                _1159 = _2233;
                                                _1161 = _2235;
                                                _941 = _2207;
                                                _1163 = _2227;
                                                _1165 = _2237;
                                                _1167 = _2233;
                                                _1169 = _2235;
                                                _1171 = _2237;
                                                _1173 = true;
                                            }
                                            else
                                            {
                                                bool _2239 = _1231 != 7.0;
                                                bool _2241 = isnan(_1231);
                                                bool _2243 = _2239 || _2241;
                                                bool _2245 = isnan(7.0);
                                                bool _2247 = _2243 || _2245;
                                                if (_2247)
                                                {
                                                    _2133 = as_type<float>(_408);
                                                }
                                                float _2249 = _2133;
                                                _1159 = _2249;
                                                _1167 = _2249;
                                                if (_2247)
                                                {
                                                    _2137 = as_type<float>(_402);
                                                }
                                                float _2251 = _2137;
                                                _1161 = _2251;
                                                _1169 = _2251;
                                                if (_2247)
                                                {
                                                    _2143 = _410;
                                                }
                                                int _2253 = as_type<int>(_2143);
                                                _1165 = as_type<float>(_2253);
                                                _1171 = as_type<float>(_2253);
                                                if (!_2247)
                                                {
                                                    float _2255 = -_1025;
                                                    float _2257 = _2255 + 1.0;
                                                    float _2259 = -_1031;
                                                    float _2261 = _2259 + 1.0;
                                                    float _2263 = -_1033;
                                                    float _2265 = _2263 + 1.0;
                                                    float _2267 = abs(_2257);
                                                    float _2269 = log2(_2267);
                                                    float _2271 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                    float _2273 = abs(_2261);
                                                    float _2275 = log2(_2273);
                                                    float _2277 = abs(_2265);
                                                    float _2279 = log2(_2277);
                                                    float _2281 = _2269 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2283 = _2275 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2285 = exp2(_2281);
                                                    float _2287 = _2279 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2289 = exp2(_2283);
                                                    float _2291 = exp2(_2287);
                                                    float _2293 = fma(_2271, _2285, 1.0);
                                                    float _2295 = fma(_2271, _2289, 1.0);
                                                    float _2297 = 1.0 / _2293;
                                                    float _2299 = fma(_2271, _2291, 1.0);
                                                    float _2301 = 1.0 / _2295;
                                                    float _2303 = 1.0 / _2299;
                                                    float _2305 = _2297 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2307 = -_1025;
                                                    float _2309 = fma(_2305, _1025, _2307);
                                                    float _2311 = _2301 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2313 = -_1031;
                                                    float _2315 = fma(_2311, _1031, _2313);
                                                    float _2317 = _2303 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2319 = _2309 + _2315;
                                                    float _2321 = -_1033;
                                                    float _2323 = fma(_2317, _1033, _2321);
                                                    float _2325 = _2323 + _2319;
                                                    float _2327 = -_2309;
                                                    float _2329 = fma(_2325, 0.3333333432674407958984375, _2327);
                                                    float _2331 = -_2315;
                                                    float _2333 = fma(_2325, 0.3333333432674407958984375, _2331);
                                                    float _2335 = -_2323;
                                                    float _2337 = fma(_2325, 0.3333333432674407958984375, _2335);
                                                    float _2339 = fma(_2329, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2309);
                                                    float _2341 = fma(_2333, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2315);
                                                    float _2343 = fma(_2337, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2323);
                                                    float _2345 = _2339 + _1025;
                                                    float _2347 = _2341 + _1031;
                                                    float _2349 = _2343 + _1033;
                                                    _1159 = _2345;
                                                    _1161 = _2347;
                                                    _941 = _2343;
                                                    _1165 = _2349;
                                                    _1167 = _2345;
                                                    _1169 = _2347;
                                                    _1171 = _2349;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _1173 = false;
            float _2351 = _1159;
            float _2353 = _1161;
            float _2355 = _941;
            float _2357 = _1163;
            int _2359 = as_type<int>(_1165);
            float _2361 = _1167;
            float _2363 = _1169;
            float _2365 = _1171;
            float _2367 = _2361 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2369 = _2363 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2371 = _2365 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            _1053 = _2367;
            _1055 = _2351;
            _1057 = _2353;
            _943 = _2355;
            _464 = _2363;
            _945 = _2357;
            _1059 = _2359;
            _466 = _2361;
            _468 = _2365;
            _1061 = _2369;
            _1063 = _2371;
        }
        float _2373 = _1053;
        float _2375 = _1055;
        float _2377 = _1057;
        float _2379 = _943;
        int _2381 = as_type<int>(_464);
        float _2383 = _945;
        int _2385 = _1059;
        int _2387 = as_type<int>(_466);
        float _2389 = _468;
        float _2391 = _1061;
        float _2393 = _1063;
        int _2395 = _498 ? 64 : 0;
        bool _2397 = _484 != 0;
        int _2399 = _384 + 1;
        bool _2401 = _2395 != 0;
        bool _2403 = _2399 >= 4;
        _348 = _2399;
        _350 = _2373;
        _358 = _2377;
        _366 = _2381;
        _368 = _2383;
        _370 = _2385;
        _372 = _2387;
        _374 = _2389;
        float _2405 = _2375;
        float _2407 = _2379;
        if (_430)
        {
            _2405 = _212;
        }
        float _2409 = _2405;
        float _2411 = _2409;
        if (_2397)
        {
            _2407 = _332;
        }
        float _2413 = _2407;
        float _2415 = _2413;
        if (_442)
        {
            _2415 = _336;
        }
        float _2417 = _2415;
        float _2419 = _2417;
        if (_472)
        {
            _2419 = _342;
        }
        float _2421 = _2419;
        float _2423 = _2421;
        if (_508)
        {
            _2423 = _334;
        }
        float _2425 = _2423;
        _364 = _2425;
        if (_436)
        {
            _2411 = _238;
        }
        float _2427 = _2411;
        _2429 = fma(_2391, _2425, _412);
        _354 = _2429;
        float _2431 = _2427;
        if (_478)
        {
            _2431 = _264;
        }
        float _2433 = _2431;
        _2435 = fma(_2373, _2425, _414);
        _352 = _2435;
        float _2437 = _2433;
        float _2439 = _2433;
        if (_2401)
        {
            _2437 = _290;
            _2439 = _290;
        }
        float _2441 = _2437;
        float _2443 = _2439;
        _2445 = fma(_2393, _2425, _416);
        _2447 = fma(_2425, _2443, _418);
        _356 = _2441;
        _360 = _2445;
        _362 = _2447;
        _376 = _2429;
        _378 = _2435;
        _380 = _2445;
        _382 = _2447;
        if (_2403)
        {
            _2449 = true;
            if (_2449)
            {
                break;
            }
        }
    } while (true);
    _2449 = false;
    out.m_47.x = _2435;
    out.m_47.y = _2429;
    out.m_47.z = _2445;
    out.m_47.w = _2447;
    return out;
}

