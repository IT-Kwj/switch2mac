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
int _53(thread const int& _5630, thread const int& _5631, constant _10& support_buffer)
{
    int _5634 = 1 + _5631;
    float _5636 = support_buffer._m5[_5634].x;
    float _5638 = abs(_5636);
    bool _5640 = _5638 == 1.0;
    if (_5640)
    {
        return _5630;
    }
    float _5642 = float(_5630);
    float _5644 = _5642 / _5638;
    int _5646 = int(_5644);
    return _5646;
}

static inline __attribute__((always_inline))
int _55(thread const int& _5668, thread const int& _5669, thread const int& _5670, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _5673 = 1 + _5669;
    float _5675 = support_buffer._m5[_5673].x;
    bool _5677 = _5675 == 1.0;
    if (_5677)
    {
        return _5668;
    }
    bool _5679 = _5675 < 0.0;
    if (_5679)
    {
        float _5681 = -_5675;
        float _5683 = float(_5668);
        float _5685 = _5683 * _5681;
        float _5687 = gl_FragCoord.x;
        float _5689 = gl_FragCoord.y;
        float _5691 = (_5670 != 0) ? _5689 : _5687;
        float _5693 = mod(_5691, _5681);
        float _5695 = _5685 + _5693;
        int _5697 = int(_5695);
        return _5697;
    }
    float _5699 = float(_5668);
    float _5701 = _5699 * _5675;
    int _5703 = int(_5701);
    return _5703;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _2405 = false;
    bool _1129 = false;
    bool _1971 = false;
    bool _1871 = false;
    bool _1767 = false;
    bool _803 = false;
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
    float _350 = _97;
    float _352 = _101;
    float _354 = _99;
    int _356 = 0;
    float _358 = 0.0;
    float _360 = 0.0;
    float _362 = _312;
    float _364 = _302;
    float _366 = _306;
    int _368 = 0;
    float _370 = 0.0;
    int _372 = 0;
    float _374 = 0.0;
    float _376 = 0.0;
    float _378 = 0.0;
    float _380 = 0.0;
    float _382 = 0.0;
    float _1115;
    float _1117;
    float _1119;
    float _1121;
    float _1123;
    float _1125;
    float _1127;
    float _1763;
    float _1765;
    float _1867;
    float _1869;
    float _1969;
    float _2385;
    float _2391;
    float _2401;
    float _2403;
    do
    {
        int _384 = _348;
        float _386 = _350;
        float _388 = _352;
        float _390 = _354;
        int _392 = _356;
        float _394 = _358;
        float _396 = _360;
        float _398 = _362;
        float _400 = _364;
        float _402 = _366;
        int _404 = _368;
        float _406 = _370;
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
        float _444 = _400;
        float _446 = _398;
        float _448 = _388;
        int _450 = _392;
        float _452 = _390;
        float _454 = _386;
        float _456 = _394;
        float _458 = _396;
        float _460 = _402;
        float _462 = _406;
        float _464 = as_type<float>(_404);
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
            _450 = as_type<int>(_210);
        }
        int _506 = _450;
        bool _508 = _434 == 12;
        int _510 = _506;
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
            _510 = as_type<int>(_236);
        }
        int _528 = _510;
        int _530 = _528;
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
            _530 = as_type<int>(_262);
        }
        int _562 = _530;
        int _564 = _562;
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
            _564 = as_type<int>(_288);
        }
        int _582 = _564;
        float _584 = as_type<float>(_582);
        if (_558)
        {
            _456 = _578;
        }
        float _586 = _456;
        float _588 = _586;
        float _590 = _586;
        if (_558)
        {
            _458 = _566;
        }
        float _592 = _458;
        float _594 = _592;
        float _596 = _592;
        if (_558)
        {
            _460 = as_type<float>(_582);
        }
        float _598 = _460;
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
                float _622 = as_type<float>(_582) * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _600 = _622;
            }
            float _624 = _600;
            bool _626 = !_612;
            _602 = _624;
            if (!_626)
            {
                float _628 = _566 * 0.715200006961822509765625;
                float _630 = fma(_578, 0.2125999927520751953125, _628);
                float _632 = fma(as_type<float>(_582), 0.072200000286102294921875, _630);
                float _634 = 1.0 / _632;
                float _636 = _634 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _638 = precise::clamp(_636, 0.0, 1.0);
                float _640 = fma(_638, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
                float _642 = _578 * _640;
                float _644 = _566 * _640;
                float _646 = as_type<float>(_582) * _640;
                _590 = _642;
                _596 = _644;
                _602 = _646;
                _462 = _632;
            }
        }
        float _648 = _590;
        float _650 = _596;
        float _652 = _602;
        float _654 = _462;
        float _656 = _652;
        float _658 = _648;
        float _660 = _650;
        float _662 = _654;
        if (_558)
        {
            _580 = _648;
        }
        float _664 = _580;
        float _666 = _664;
        if (_558)
        {
            _568 = _650;
        }
        float _668 = _568;
        float _670 = _668;
        if (!_558)
        {
            float _672 = _570 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _674 = _574 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float2 _3059 = float2(_672, _674);
            float3 _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3059, float2(0.0), isnan(_3059))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3059, float2(0.0), isnan(_3059))).xyz;
            float _680 = _678.x;
            float _682 = _678.y;
            float _684 = _678.z;
            float _686 = _680 + _648;
            float _688 = _682 + _650;
            float _690 = _684 + _652;
            _572 = _684;
            _656 = _690;
            _666 = _686;
            _670 = _688;
            _576 = _674;
        }
        float _692 = _572;
        float _694 = _656;
        float _696 = _666;
        float _698 = _670;
        float _700 = _576;
        float _702 = _692;
        float _704 = _694;
        float _706 = _696;
        float _708 = _698;
        float _710 = _700;
        if (!_558)
        {
            float _712 = _696 * 4.0;
            float _714 = _698 * 4.0;
            float _716 = _694 * 4.0;
            float _718 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
            float _720 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _718;
            float _722 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
            uint _725 = as_type<uint>(half2(float2(_712, _714)));
            uint _727 = as_type<uint>(half2(float2(_716, 0.0)));
            float _729 = -_722;
            float _731 = fma(_540, _720, _729);
            float _733 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
            uint _735 = extract_bits(_727, 0u, 8u);
            int _737 = int(_735) & 255;
            uint _739 = extract_bits(_727, 8u, 8u);
            int _741 = int(_739) & 255;
            int _743 = _741 << 8;
            int _745 = _737 | _743;
            float _747 = _733 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
            float _749 = 1.0 / _731;
            float _751 = float(uint(_745));
            float _753 = fma(_751, 6.103515625e-05, -0.3125);
            float _755 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
            float _757 = fma(_747, _749, _755);
            uint _759 = extract_bits(_725, 16u, 16u);
            float _761 = float(_759);
            float _763 = precise::max(0.0, _757);
            float _765 = _763 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
            float _767 = _765 * (-1.44269502162933349609375);
            float _769 = fma(_761, 6.103515625e-05, -0.3125);
            float _771 = exp2(_767);
            float _773 = _771 + (-0.5);
            int _775 = int(_725) & 32767;
            float _777 = fma(_773, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
            float _779 = float(uint(_775));
            float _781 = precise::max(_777, (*spvDescriptorSet0.fp_c4)._m0[5].w);
            float _783 = fma(_779, 6.103515625e-05, -0.3125);
            bool _785 = _781 > 0.999000012874603271484375;
            float _787 = fma(_769, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _789 = fma(_753, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _791 = fma(_783, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            bool _793 = !_785;
            _658 = _781;
            _702 = 6.103515625e-05;
            _710 = _787;
            _542 = _791;
            _662 = _789;
            if (!_793)
            {
                float3 _3247 = float3(_791, _787, _789);
                float3 _795 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3247, float3(0.0), isnan(_3247))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3247, float3(0.0), isnan(_3247))).xyz;
                float _797 = _795.x;
                float _799 = _795.y;
                float _801 = _795.z;
                _704 = _801;
                _706 = _797;
                _708 = _799;
                _803 = true;
            }
            else
            {
                bool _805 = _781 >= 0.001000000047497451305389404296875;
                bool _807 = isnan(_781);
                bool _809 = _805 || _807;
                bool _811 = isnan(0.001000000047497451305389404296875);
                bool _813 = _809 || _811;
                if (!_813)
                {
                    float3 _3284 = float3(_791, _787, _789);
                    float3 _815 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3284, float3(0.0), isnan(_3284))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3284, float3(0.0), isnan(_3284))).xyz;
                    float _817 = _815.x;
                    float _819 = _815.y;
                    float _821 = _815.z;
                    _704 = _821;
                    _706 = _817;
                    _708 = _819;
                    _803 = true;
                }
                else
                {
                    float3 _3303 = float3(_791, _787, _789);
                    float3 _823 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3303, float3(0.0), isnan(_3303))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3303, float3(0.0), isnan(_3303))).xyz;
                    float _825 = _823.x;
                    float _827 = _823.y;
                    float _829 = _823.z;
                    float3 _3318 = float3(_791, _787, _789);
                    float3 _831 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3318, float3(0.0), isnan(_3318))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3318, float3(0.0), isnan(_3318))).xyz;
                    float _833 = _831.x;
                    float _835 = _831.y;
                    float _837 = _831.z;
                    float _839 = -_825;
                    float _841 = _833 + _839;
                    float _843 = -_827;
                    float _845 = _835 + _843;
                    float _847 = -_829;
                    float _849 = _837 + _847;
                    float _851 = fma(_781, _841, _825);
                    float _853 = fma(_781, _845, _827);
                    float _855 = fma(_781, _849, _829);
                    _584 = _849;
                    _660 = _845;
                    _702 = _841;
                    _704 = _855;
                    _706 = _851;
                    _708 = _853;
                }
            }
        }
        _803 = false;
        int _857 = as_type<int>(_584);
        float _859 = _658;
        float _861 = _660;
        float _863 = _702;
        float _865 = _704;
        float _867 = _706;
        float _869 = _708;
        float _871 = _710;
        float _873 = _542;
        float _875 = _662;
        float _877 = _863;
        float _879 = _871;
        float _881 = _873;
        int _883 = _857;
        float _885 = _859;
        float _887 = _861;
        float _889 = _875;
        float _891 = _865;
        float _893 = _869;
        float _895 = _865;
        float _897 = _865;
        float _899 = _865;
        float _901 = _875;
        if (_558)
        {
            _877 = _867;
        }
        float _903 = _877;
        float _905 = _903;
        if (_558)
        {
            _879 = _869;
        }
        float _907 = _879;
        float _909 = _907;
        if (_558)
        {
            _881 = _865;
        }
        float _911 = _881;
        float _913 = _911;
        if (!_558)
        {
            bool _915 = _867 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _917 = isnan(_867);
            bool _919 = _915 || _917;
            bool _921 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _923 = _919 || _921;
            bool _925 = _869 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _927 = isnan(_869);
            bool _929 = _925 || _927;
            bool _931 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _933 = _929 || _931;
            float _935 = fma(_867, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _937 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _939 = fma(_865, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            bool _941 = _865 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _943 = isnan(_865);
            bool _945 = _941 || _943;
            bool _947 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _949 = _945 || _947;
            float _951 = exp2(_935);
            float _953 = exp2(_937);
            float _955 = exp2(_939);
            float _957 = -_951;
            float _959 = _957 + 1.0;
            bool _961 = !_923;
            float _963 = _961 ? _867 : _959;
            float _965 = -_953;
            float _967 = _965 + 1.0;
            bool _969 = !_933;
            float _971 = _969 ? _869 : _967;
            float _973 = -_955;
            float _975 = _973 + 1.0;
            bool _977 = !_949;
            float _979 = _977 ? _865 : _975;
            _883 = as_type<int>(_967);
            _885 = _955;
            _887 = _953;
            _905 = _963;
            _909 = _971;
            _913 = _979;
        }
        int _981 = _883;
        float _983 = _885;
        float _985 = _887;
        float _987 = _905;
        float _989 = _909;
        float _991 = _913;
        float _993 = _983;
        int _995 = _981;
        float _997 = as_type<float>(_981);
        float _999 = _983;
        float _1001 = _985;
        float _1003 = _987;
        float _1005 = _989;
        float _1007 = _991;
        int _1009 = _981;
        float _1011 = _983;
        float _1013 = _985;
        float _1015 = _987;
        float _1017 = _989;
        float _1019 = _991;
        if (!_558)
        {
            bool _1021 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
            bool _1023 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
            bool _1025 = _1021 || _1023;
            bool _1027 = isnan(6.0);
            bool _1029 = _1025 || _1027;
            if (!_1029)
            {
                float _1031 = -_987;
                float _1033 = _1031 + 1.0;
                float _1035 = -_989;
                float _1037 = _1035 + 1.0;
                float _1039 = -_991;
                float _1041 = _1039 + 1.0;
                float _1043 = abs(_1033);
                float _1045 = log2(_1043);
                float _1047 = abs(_1037);
                float _1049 = log2(_1047);
                float _1051 = abs(_1041);
                float _1053 = log2(_1051);
                float _1055 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1057 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                float _1059 = _1049 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1061 = exp2(_1055);
                float _1063 = _1053 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1065 = exp2(_1059);
                float _1067 = exp2(_1063);
                float _1069 = fma(_1057, _1061, 1.0);
                float _1071 = fma(_1057, _1065, 1.0);
                float _1073 = 1.0 / _1069;
                float _1075 = fma(_1057, _1067, 1.0);
                float _1077 = 1.0 / _1071;
                float _1079 = 1.0 / _1075;
                float _1081 = _1073 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1083 = _1077 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1085 = precise::max(_1081, _1083);
                float _1087 = _1079 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1089 = precise::max(_1087, _1085);
                float _1091 = -_1081;
                float _1093 = _1091 + _1089;
                float _1095 = -_1083;
                float _1097 = _1095 + _1089;
                float _1099 = -_1087;
                float _1101 = _1099 + _1089;
                float _1103 = fma(_1093, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1081);
                float _1105 = fma(_1097, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1083);
                float _1107 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1087);
                float _1109 = _1103 * _987;
                float _1111 = _1105 * _989;
                float _1113 = _1107 * _991;
                _1115 = _1113;
                _1117 = _1111;
                _1119 = _1109;
                _897 = _1073;
                _1121 = _1107;
                _1123 = _1109;
                _1125 = _1111;
                _1127 = _1113;
                _1129 = true;
            }
            else
            {
                bool _1131 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
                if (!_1131)
                {
                    _889 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
                }
                float _1133 = _889;
                bool _1135 = !_1131;
                float _1137 = _1133;
                _1121 = _1133;
                if (!_1135)
                {
                    float _1139 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
                    float _1141 = _93 + _1139;
                    float _1143 = abs(_1141);
                    float _1145 = _1143 * 2560.0;
                    bool _1147 = _1145 >= 2.0;
                    bool _1149 = isnan(_1145);
                    bool _1151 = _1147 || _1149;
                    bool _1153 = isnan(2.0);
                    bool _1155 = _1151 || _1153;
                    float _1157 = _1145;
                    if (!_1155)
                    {
                        _993 = 0.0;
                        _1157 = 0.0;
                    }
                    float _1159 = _993;
                    float _1161 = _1157;
                    float _1163 = _1161;
                    float _1165 = _1159;
                    _1117 = _1159;
                    _1119 = _1161;
                    _1123 = _1161;
                    _1125 = _1159;
                    if (!_1155)
                    {
                        _995 = 0;
                    }
                    int _1167 = _995;
                    bool _1169 = !_1155;
                    float _1171 = as_type<float>(_1167);
                    _1115 = as_type<float>(_1167);
                    _1127 = as_type<float>(_1167);
                    _1129 = _1169;
                    if (!_1129)
                    {
                        bool _1173 = _93 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                        if (_1173)
                        {
                            _1163 = _987;
                        }
                        float _1175 = _1163;
                        _1001 = _1175;
                        _1119 = _1175;
                        _1123 = _1175;
                        if (_1173)
                        {
                            _1165 = _989;
                        }
                        float _1177 = _1165;
                        _999 = _1177;
                        _1117 = _1177;
                        _1125 = _1177;
                        if (_1173)
                        {
                            _1171 = _991;
                        }
                        int _1179 = as_type<int>(_1171);
                        _997 = as_type<float>(_1179);
                        _1115 = as_type<float>(_1179);
                        _1127 = as_type<float>(_1179);
                        _1129 = _1173;
                        if (!_1129)
                        {
                            float _1181 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                            _1137 = _1181;
                        }
                    }
                }
                if (!_1129)
                {
                    int _1183 = as_type<int>(_997);
                    float _1185 = _999;
                    float _1187 = _1001;
                    float _1189 = _1137;
                    bool _1191 = _1189 != 0.0;
                    bool _1193 = isnan(_1189);
                    bool _1195 = _1191 || _1193;
                    bool _1197 = isnan(0.0);
                    bool _1199 = _1195 || _1197;
                    float _1201 = _1189;
                    float _1203 = _1189;
                    float _1205 = _1187;
                    float _1207 = _1185;
                    int _1209 = _1183;
                    _1121 = _1189;
                    if (!_1199)
                    {
                        float _1211 = _869 * 0.586600005626678466796875;
                        float _1213 = fma(_867, 0.29890000820159912109375, _1211);
                        float _1215 = fma(_865, 0.1143999993801116943359375, _1213);
                        float _1217 = _1215 * (-1.44269502162933349609375);
                        float _1219 = exp2(_1217);
                        float _1221 = -_1219;
                        float _1223 = _1221 + 1.0;
                        bool _1225 = _1223 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _1227 = isnan(_1223);
                        bool _1229 = _1225 || _1227;
                        bool _1231 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _1233 = _1229 || _1231;
                        float _1235 = _1215;
                        if (!_1233)
                        {
                            _1235 = _1223;
                        }
                        float _1237 = _1235;
                        bool _1239 = !_1233;
                        float _1241 = _1237;
                        if (!_1239)
                        {
                            float _1243 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1245 = _1223 + _1243;
                            float _1247 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1249 = spvFAdd(_1247, 1.00000095367431640625);
                            float _1251 = 1.0 / _1249;
                            float _1253 = _1245 * _1251;
                            float _1255 = -_1253;
                            float _1257 = _1255 + 1.0;
                            float _1259 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1261 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1259;
                            float _1263 = abs(_1257);
                            float _1265 = log2(_1263);
                            float _1267 = _1261 * _1251;
                            float _1269 = _1267 + (-1.0);
                            float _1271 = _1267 * _1253;
                            float _1273 = _1265 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1275 = exp2(_1273);
                            float _1277 = fma(_1269, _1275, 1.0);
                            float _1279 = 1.0 / _1277;
                            float _1281 = _1271 * _1279;
                            float _1283 = fma(_1249, _1281, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _1241 = _1283;
                        }
                        float _1285 = _1241;
                        float _1287 = -_1223;
                        float _1289 = _1287 + _1285;
                        float _1291 = _989 * 0.586600005626678466796875;
                        float _1293 = _1289 + 1.0;
                        float _1295 = fma(_987, 0.29890000820159912109375, _1291);
                        float _1297 = fma(_991, 0.1143999993801116943359375, _1295);
                        float _1299 = abs(_1293);
                        float _1301 = log2(_1299);
                        float _1303 = spvFAdd(_1297, 9.9999999747524270787835121154785e-07);
                        float _1305 = 1.0 / _1303;
                        float _1307 = _1301 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                        float _1309 = exp2(_1307);
                        float _1311 = fma(_1305, _987, -1.0);
                        float _1313 = fma(_1305, _989, -1.0);
                        float _1315 = fma(_1305, _991, -1.0);
                        float _1317 = fma(_1309, _1311, 1.0);
                        float _1319 = fma(_1309, _1313, 1.0);
                        float _1321 = fma(_1309, _1315, 1.0);
                        float _1323 = _1317 * _1285;
                        float _1325 = _1319 * _1285;
                        float _1327 = _1321 * _1285;
                        float _1329 = precise::max(0.0, _1323);
                        float _1331 = precise::max(0.0, _1325);
                        float _1333 = precise::max(0.0, _1327);
                        float _1335 = precise::min(_1329, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1337 = precise::min(_1331, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1339 = precise::min(_1333, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _1115 = _1339;
                        _1117 = _1337;
                        _1119 = _1335;
                        _897 = _1309;
                        _1123 = _1335;
                        _1125 = _1337;
                        _1127 = _1339;
                        _1129 = true;
                    }
                    else
                    {
                        bool _1341 = _1189 != 1.0;
                        bool _1343 = isnan(_1189);
                        bool _1345 = _1341 || _1343;
                        bool _1347 = isnan(1.0);
                        bool _1349 = _1345 || _1347;
                        if (!_1349)
                        {
                            bool _1351 = _987 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1353 = isnan(_987);
                            bool _1355 = _1351 || _1353;
                            bool _1357 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1359 = _1355 || _1357;
                            float _1361 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1363 = spvFAdd(_1361, 1.00000095367431640625);
                            bool _1365 = _989 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1367 = isnan(_989);
                            bool _1369 = _1365 || _1367;
                            bool _1371 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1373 = _1369 || _1371;
                            bool _1375 = _991 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1377 = isnan(_991);
                            bool _1379 = _1375 || _1377;
                            bool _1381 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1383 = _1379 || _1381;
                            float _1385 = 1.0 / _1363;
                            float _1387 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1389 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1387;
                            float _1391 = _1389 * _1385;
                            bool _1393 = !_1359;
                            float _1395 = _1391;
                            if (!_1393)
                            {
                                float _1397 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1399 = _987 + _1397;
                                float _1401 = _1391 + (-1.0);
                                float _1403 = _1399 * _1385;
                                float _1405 = -_1403;
                                float _1407 = _1405 + 1.0;
                                float _1409 = _1391 * _1403;
                                float _1411 = abs(_1407);
                                float _1413 = log2(_1411);
                                float _1415 = _1413 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1417 = exp2(_1415);
                                float _1419 = fma(_1401, _1417, 1.0);
                                float _1421 = 1.0 / _1419;
                                float _1423 = _1409 * _1421;
                                float _1425 = fma(_1363, _1423, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1003 = _1425;
                            }
                            float _1427 = _1003;
                            bool _1429 = !_1373;
                            if (!_1429)
                            {
                                float _1431 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1433 = _989 + _1431;
                                float _1435 = _1391 + (-1.0);
                                float _1437 = _1433 * _1385;
                                float _1439 = -_1437;
                                float _1441 = _1439 + 1.0;
                                float _1443 = _1391 * _1437;
                                float _1445 = abs(_1441);
                                float _1447 = log2(_1445);
                                float _1449 = _1447 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1451 = exp2(_1449);
                                float _1453 = fma(_1435, _1451, 1.0);
                                float _1455 = 1.0 / _1453;
                                float _1457 = _1443 * _1455;
                                float _1459 = fma(_1363, _1457, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1005 = _1459;
                            }
                            float _1461 = _1005;
                            bool _1463 = !_1383;
                            if (!_1463)
                            {
                                float _1465 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1467 = _991 + _1465;
                                float _1469 = _1391 + (-1.0);
                                float _1471 = _1467 * _1385;
                                float _1473 = -_1471;
                                float _1475 = _1473 + 1.0;
                                float _1477 = _1391 * _1471;
                                float _1479 = abs(_1475);
                                float _1481 = log2(_1479);
                                float _1483 = _1481 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1485 = exp2(_1483);
                                float _1487 = fma(_1469, _1485, 1.0);
                                float _1489 = 1.0 / _1487;
                                float _1491 = _1477 * _1489;
                                float _1493 = fma(_1363, _1491, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1395 = _1491;
                                _1007 = _1493;
                            }
                            float _1495 = _1395;
                            float _1497 = _1007;
                            float _1499 = precise::max(0.0, _1497);
                            float _1501 = precise::max(0.0, _1427);
                            float _1503 = precise::max(0.0, _1461);
                            float _1505 = precise::min(_1499, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1507 = precise::min(_1501, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1509 = precise::min(_1503, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            _1115 = _1505;
                            _1117 = _1509;
                            _1119 = _1507;
                            _897 = _1495;
                            _1123 = _1507;
                            _1125 = _1509;
                            _1127 = _1505;
                            _1129 = true;
                        }
                        else
                        {
                            bool _1511 = _1189 != 2.0;
                            bool _1513 = isnan(_1189);
                            bool _1515 = _1511 || _1513;
                            bool _1517 = isnan(2.0);
                            bool _1519 = _1515 || _1517;
                            if (!_1519)
                            {
                                float _1521 = _989 * 0.715200006961822509765625;
                                float _1523 = fma(_987, 0.2125999927520751953125, _1521);
                                float _1525 = fma(_991, 0.072200000286102294921875, _1523);
                                float _1527 = spvFAdd(_1525, 9.9999999747524270787835121154785e-07);
                                bool _1529 = _1525 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1531 = isnan(_1525);
                                bool _1533 = _1529 || _1531;
                                bool _1535 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1537 = _1533 || _1535;
                                float _1539 = 1.0 / _1527;
                                bool _1541 = !_1537;
                                float _1543 = _1525;
                                if (!_1541)
                                {
                                    float _1545 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1547 = _1525 + _1545;
                                    float _1549 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1551 = spvFAdd(_1549, 1.00000095367431640625);
                                    float _1553 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1555 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1553;
                                    float _1557 = 1.0 / _1551;
                                    float _1559 = _1547 * _1557;
                                    float _1561 = _1555 * _1557;
                                    float _1563 = -_1559;
                                    float _1565 = _1563 + 1.0;
                                    float _1567 = _1561 + (-1.0);
                                    float _1569 = _1561 * _1559;
                                    float _1571 = abs(_1565);
                                    float _1573 = log2(_1571);
                                    float _1575 = _1573 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1577 = exp2(_1575);
                                    float _1579 = fma(_1567, _1577, 1.0);
                                    float _1581 = 1.0 / _1579;
                                    float _1583 = _1569 * _1581;
                                    float _1585 = fma(_1551, _1583, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    _891 = _1573;
                                    _1543 = _1585;
                                }
                                float _1587 = _891;
                                float _1589 = _1543;
                                float _1591 = precise::max(0.0, _1589);
                                float _1593 = precise::min(_1591, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1595 = _1539 * _1593;
                                float _1597 = _987 * _1595;
                                float _1599 = _989 * _1595;
                                float _1601 = _991 * _1595;
                                float _1603 = precise::max(0.0, _1597);
                                float _1605 = precise::max(0.0, _1599);
                                float _1607 = precise::max(0.0, _1601);
                                float _1609 = precise::min(_1603, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1611 = precise::min(_1605, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1613 = precise::min(_1607, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                _1115 = _1613;
                                _1117 = _1611;
                                _1119 = _1609;
                                _897 = _1587;
                                _1123 = _1609;
                                _1125 = _1611;
                                _1127 = _1613;
                                _1129 = true;
                            }
                            else
                            {
                                bool _1615 = _1189 != 3.0;
                                bool _1617 = isnan(_1189);
                                bool _1619 = _1615 || _1617;
                                bool _1621 = isnan(3.0);
                                bool _1623 = _1619 || _1621;
                                if (!_1623)
                                {
                                    float _1625 = -_987;
                                    float _1627 = _1625 + 1.0;
                                    float _1629 = -_989;
                                    float _1631 = _1629 + 1.0;
                                    float _1633 = -_991;
                                    float _1635 = _1633 + 1.0;
                                    float _1637 = abs(_1627);
                                    float _1639 = log2(_1637);
                                    float _1641 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1643 = abs(_1631);
                                    float _1645 = log2(_1643);
                                    float _1647 = abs(_1635);
                                    float _1649 = log2(_1647);
                                    float _1651 = _1639 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1653 = _1645 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1655 = exp2(_1651);
                                    float _1657 = _1649 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1659 = exp2(_1653);
                                    float _1661 = exp2(_1657);
                                    float _1663 = fma(_1641, _1655, 1.0);
                                    float _1665 = fma(_1641, _1659, 1.0);
                                    float _1667 = 1.0 / _1663;
                                    float _1669 = fma(_1641, _1661, 1.0);
                                    float _1671 = 1.0 / _1665;
                                    float _1673 = 1.0 / _1669;
                                    float _1675 = _1667 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1677 = _1667 + _1671;
                                    float _1679 = _1671 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1681 = precise::max(_1675, _1679);
                                    float _1683 = _1673 + _1677;
                                    float _1685 = _1673 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1687 = _1683 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1689 = precise::max(_1685, _1681);
                                    float _1691 = _1687 * 0.3333333432674407958984375;
                                    float _1693 = -_1691;
                                    float _1695 = _1689 + _1693;
                                    float _1697 = fma(_1695, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1691);
                                    float _1699 = -_1675;
                                    float _1701 = _1699 + _1697;
                                    float _1703 = -_1679;
                                    float _1705 = _1703 + _1697;
                                    float _1707 = -_1685;
                                    float _1709 = _1707 + _1697;
                                    float _1711 = fma(_1701, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1675);
                                    float _1713 = fma(_1705, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1679);
                                    float _1715 = fma(_1709, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1685);
                                    float _1717 = _1711 * _987;
                                    float _1719 = _1713 * _989;
                                    float _1721 = _1715 * _991;
                                    _1115 = _1721;
                                    _1117 = _1719;
                                    _1119 = _1717;
                                    _897 = _1705;
                                    _1123 = _1717;
                                    _1125 = _1719;
                                    _1127 = _1721;
                                    _1129 = true;
                                }
                                else
                                {
                                    bool _1723 = _1189 != 4.0;
                                    bool _1725 = isnan(_1189);
                                    bool _1727 = _1723 || _1725;
                                    bool _1729 = isnan(4.0);
                                    bool _1731 = _1727 || _1729;
                                    if (!_1731)
                                    {
                                        bool _1733 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        bool _1735 = isnan(0.0);
                                        bool _1737 = _1733 || _1735;
                                        bool _1739 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        bool _1741 = _1737 || _1739;
                                        if (!_1741)
                                        {
                                            float _1743 = -_987;
                                            float _1745 = _1743 + 1.0;
                                            float _1747 = abs(_1745);
                                            float _1749 = log2(_1747);
                                            float _1751 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1753 = _1749 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1755 = exp2(_1753);
                                            float _1757 = fma(_1751, _1755, 1.0);
                                            float _1759 = 1.0 / _1757;
                                            float _1761 = _1759 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1763 = _1755;
                                            _1765 = _1761;
                                            _1767 = true;
                                        }
                                        else
                                        {
                                            float _1769 = spvFAdd(_987, 9.9999999747524270787835121154785e-07);
                                            bool _1771 = _987 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1773 = isnan(_987);
                                            bool _1775 = _1771 || _1773;
                                            bool _1777 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1779 = _1775 || _1777;
                                            float _1781 = 1.0 / _1769;
                                            if (!_1779)
                                            {
                                                _893 = _987;
                                            }
                                            float _1783 = _893;
                                            bool _1785 = !_1779;
                                            float _1787 = _1783;
                                            if (!_1785)
                                            {
                                                float _1789 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1791 = _987 + _1789;
                                                float _1793 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1795 = spvFAdd(_1793, 1.00000095367431640625);
                                                float _1797 = 1.0 / _1795;
                                                float _1799 = _1791 * _1797;
                                                float _1801 = -_1799;
                                                float _1803 = _1801 + 1.0;
                                                float _1805 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1807 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1805;
                                                float _1809 = abs(_1803);
                                                float _1811 = log2(_1809);
                                                float _1813 = _1807 * _1797;
                                                float _1815 = _1813 + (-1.0);
                                                float _1817 = _1813 * _1799;
                                                float _1819 = _1811 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1821 = exp2(_1819);
                                                float _1823 = fma(_1815, _1821, 1.0);
                                                float _1825 = 1.0 / _1823;
                                                float _1827 = _1817 * _1825;
                                                float _1829 = fma(_1795, _1827, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1787 = _1829;
                                                _895 = _1817;
                                            }
                                            float _1831 = _1787;
                                            float _1833 = _895;
                                            float _1835 = precise::max(0.0, _1831);
                                            float _1837 = precise::min(_1835, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1839 = _1837 * _1781;
                                            _1763 = _1833;
                                            _1765 = _1839;
                                        }
                                        _1767 = false;
                                        float _1841 = _1763;
                                        float _1843 = _1765;
                                        float _1845 = _1841;
                                        if (!_1741)
                                        {
                                            float _1847 = -_989;
                                            float _1849 = _1847 + 1.0;
                                            float _1851 = abs(_1849);
                                            float _1853 = log2(_1851);
                                            float _1855 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1857 = _1853 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1859 = exp2(_1857);
                                            float _1861 = fma(_1855, _1859, 1.0);
                                            float _1863 = 1.0 / _1861;
                                            float _1865 = _1863 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1867 = _1859;
                                            _1869 = _1865;
                                            _1871 = true;
                                        }
                                        else
                                        {
                                            float _1873 = spvFAdd(_989, 9.9999999747524270787835121154785e-07);
                                            bool _1875 = _989 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1877 = isnan(_989);
                                            bool _1879 = _1875 || _1877;
                                            bool _1881 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1883 = _1879 || _1881;
                                            float _1885 = 1.0 / _1873;
                                            if (!_1883)
                                            {
                                                _1845 = _989;
                                            }
                                            float _1887 = _1845;
                                            bool _1889 = !_1883;
                                            float _1891 = _1887;
                                            if (!_1889)
                                            {
                                                float _1893 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1895 = _989 + _1893;
                                                float _1897 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1899 = spvFAdd(_1897, 1.00000095367431640625);
                                                float _1901 = 1.0 / _1899;
                                                float _1903 = _1895 * _1901;
                                                float _1905 = -_1903;
                                                float _1907 = _1905 + 1.0;
                                                float _1909 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1911 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1909;
                                                float _1913 = abs(_1907);
                                                float _1915 = log2(_1913);
                                                float _1917 = _1911 * _1901;
                                                float _1919 = _1917 + (-1.0);
                                                float _1921 = _1917 * _1903;
                                                float _1923 = _1915 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1925 = exp2(_1923);
                                                float _1927 = fma(_1919, _1925, 1.0);
                                                float _1929 = 1.0 / _1927;
                                                float _1931 = _1921 * _1929;
                                                float _1933 = fma(_1899, _1931, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1891 = _1933;
                                            }
                                            float _1935 = _1891;
                                            float _1937 = precise::max(0.0, _1935);
                                            float _1939 = precise::min(_1937, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1941 = _1939 * _1885;
                                            _1867 = _1939;
                                            _1869 = _1941;
                                        }
                                        _1871 = false;
                                        float _1943 = _1867;
                                        float _1945 = _1869;
                                        float _1947 = _1943;
                                        if (!_1741)
                                        {
                                            float _1949 = -_991;
                                            float _1951 = _1949 + 1.0;
                                            float _1953 = abs(_1951);
                                            float _1955 = log2(_1953);
                                            float _1957 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1959 = _1955 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1961 = exp2(_1959);
                                            float _1963 = fma(_1957, _1961, 1.0);
                                            float _1965 = 1.0 / _1963;
                                            float _1967 = _1965 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1969 = _1967;
                                            _1971 = true;
                                        }
                                        else
                                        {
                                            float _1973 = spvFAdd(_991, 9.9999999747524270787835121154785e-07);
                                            bool _1975 = _991 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1977 = isnan(_991);
                                            bool _1979 = _1975 || _1977;
                                            bool _1981 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1983 = _1979 || _1981;
                                            float _1985 = 1.0 / _1973;
                                            if (!_1983)
                                            {
                                                _1947 = _991;
                                            }
                                            float _1987 = _1947;
                                            bool _1989 = !_1983;
                                            float _1991 = _1987;
                                            if (!_1989)
                                            {
                                                float _1993 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1995 = _991 + _1993;
                                                float _1997 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1999 = spvFAdd(_1997, 1.00000095367431640625);
                                                float _2001 = 1.0 / _1999;
                                                float _2003 = _1995 * _2001;
                                                float _2005 = -_2003;
                                                float _2007 = _2005 + 1.0;
                                                float _2009 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _2011 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _2009;
                                                float _2013 = abs(_2007);
                                                float _2015 = log2(_2013);
                                                float _2017 = _2011 * _2001;
                                                float _2019 = _2017 + (-1.0);
                                                float _2021 = _2017 * _2003;
                                                float _2023 = _2015 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2025 = exp2(_2023);
                                                float _2027 = fma(_2019, _2025, 1.0);
                                                float _2029 = 1.0 / _2027;
                                                float _2031 = _2021 * _2029;
                                                float _2033 = fma(_1999, _2031, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1201 = _2025;
                                                _1991 = _2033;
                                            }
                                            float _2035 = _1201;
                                            float _2037 = _1991;
                                            float _2039 = precise::max(0.0, _2037);
                                            float _2041 = precise::min(_2039, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _2043 = _2041 * _1985;
                                            _1203 = _2035;
                                            _1969 = _2043;
                                        }
                                        _1971 = false;
                                        float _2045 = _1203;
                                        float _2047 = _1969;
                                        float _2049 = precise::max(_1843, _1945);
                                        float _2051 = precise::max(_2049, _2047);
                                        float _2053 = -_1843;
                                        float _2055 = _2051 + _2053;
                                        float _2057 = -_1945;
                                        float _2059 = _2051 + _2057;
                                        float _2061 = -_2047;
                                        float _2063 = _2051 + _2061;
                                        float _2065 = fma(_2055, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1843);
                                        float _2067 = fma(_2059, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1945);
                                        float _2069 = fma(_2063, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2047);
                                        float _2071 = _2065 * _987;
                                        float _2073 = _2067 * _989;
                                        float _2075 = _2069 * _991;
                                        _1115 = _2075;
                                        _1117 = _2073;
                                        _1119 = _2071;
                                        _897 = _2069;
                                        _1121 = _2045;
                                        _1123 = _2071;
                                        _1125 = _2073;
                                        _1127 = _2075;
                                        _1129 = true;
                                    }
                                    else
                                    {
                                        bool _2077 = _1189 != 5.0;
                                        bool _2079 = isnan(_1189);
                                        bool _2081 = _2077 || _2079;
                                        bool _2083 = isnan(5.0);
                                        bool _2085 = _2081 || _2083;
                                        if (!_2085)
                                        {
                                            _1205 = _867;
                                        }
                                        float _2087 = _1205;
                                        float _2089 = _2087;
                                        _1119 = _2087;
                                        _1123 = _2087;
                                        if (!_2085)
                                        {
                                            _1207 = _869;
                                        }
                                        float _2091 = _1207;
                                        float _2093 = _2091;
                                        _1117 = _2091;
                                        _1125 = _2091;
                                        if (!_2085)
                                        {
                                            _1209 = as_type<int>(_865);
                                        }
                                        int _2095 = _1209;
                                        bool _2097 = !_2085;
                                        float _2099 = as_type<float>(_2095);
                                        _1115 = as_type<float>(_2095);
                                        _1127 = as_type<float>(_2095);
                                        if (!_2097)
                                        {
                                            bool _2101 = _1189 != 6.0;
                                            bool _2103 = isnan(_1189);
                                            bool _2105 = _2101 || _2103;
                                            bool _2107 = isnan(6.0);
                                            bool _2109 = _2105 || _2107;
                                            if (!_2109)
                                            {
                                                float _2111 = -_987;
                                                float _2113 = _2111 + 1.0;
                                                float _2115 = -_989;
                                                float _2117 = _2115 + 1.0;
                                                float _2119 = -_991;
                                                float _2121 = _2119 + 1.0;
                                                float _2123 = abs(_2113);
                                                float _2125 = log2(_2123);
                                                float _2127 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                float _2129 = abs(_2117);
                                                float _2131 = log2(_2129);
                                                float _2133 = abs(_2121);
                                                float _2135 = log2(_2133);
                                                float _2137 = _2125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2139 = _2131 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2141 = exp2(_2137);
                                                float _2143 = _2135 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2145 = exp2(_2139);
                                                float _2147 = exp2(_2143);
                                                float _2149 = fma(_2127, _2141, 1.0);
                                                float _2151 = fma(_2127, _2145, 1.0);
                                                float _2153 = 1.0 / _2149;
                                                float _2155 = fma(_2127, _2147, 1.0);
                                                float _2157 = 1.0 / _2151;
                                                float _2159 = 1.0 / _2155;
                                                float _2161 = _2153 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2163 = _2157 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2165 = precise::max(_2161, _2163);
                                                float _2167 = _2159 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2169 = precise::max(_2167, _2165);
                                                float _2171 = -_2161;
                                                float _2173 = _2171 + _2169;
                                                float _2175 = -_2163;
                                                float _2177 = _2175 + _2169;
                                                float _2179 = -_2167;
                                                float _2181 = _2179 + _2169;
                                                float _2183 = fma(_2173, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2161);
                                                float _2185 = fma(_2177, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2163);
                                                float _2187 = fma(_2181, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2167);
                                                float _2189 = _2183 * _987;
                                                float _2191 = _2185 * _989;
                                                float _2193 = _2187 * _991;
                                                _1115 = _2193;
                                                _1117 = _2191;
                                                _1119 = _2189;
                                                _897 = _2163;
                                                _1121 = _2183;
                                                _1123 = _2189;
                                                _1125 = _2191;
                                                _1127 = _2193;
                                                _1129 = true;
                                            }
                                            else
                                            {
                                                bool _2195 = _1189 != 7.0;
                                                bool _2197 = isnan(_1189);
                                                bool _2199 = _2195 || _2197;
                                                bool _2201 = isnan(7.0);
                                                bool _2203 = _2199 || _2201;
                                                if (_2203)
                                                {
                                                    _2089 = as_type<float>(_408);
                                                }
                                                float _2205 = _2089;
                                                _1119 = _2205;
                                                _1123 = _2205;
                                                if (_2203)
                                                {
                                                    _2093 = as_type<float>(_404);
                                                }
                                                float _2207 = _2093;
                                                _1117 = _2207;
                                                _1125 = _2207;
                                                if (_2203)
                                                {
                                                    _2099 = _410;
                                                }
                                                int _2209 = as_type<int>(_2099);
                                                _1115 = as_type<float>(_2209);
                                                _1127 = as_type<float>(_2209);
                                                if (!_2203)
                                                {
                                                    float _2211 = -_987;
                                                    float _2213 = _2211 + 1.0;
                                                    float _2215 = -_989;
                                                    float _2217 = _2215 + 1.0;
                                                    float _2219 = -_991;
                                                    float _2221 = _2219 + 1.0;
                                                    float _2223 = abs(_2213);
                                                    float _2225 = log2(_2223);
                                                    float _2227 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                    float _2229 = abs(_2217);
                                                    float _2231 = log2(_2229);
                                                    float _2233 = abs(_2221);
                                                    float _2235 = log2(_2233);
                                                    float _2237 = _2225 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2239 = _2231 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2241 = exp2(_2237);
                                                    float _2243 = _2235 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2245 = exp2(_2239);
                                                    float _2247 = exp2(_2243);
                                                    float _2249 = fma(_2227, _2241, 1.0);
                                                    float _2251 = fma(_2227, _2245, 1.0);
                                                    float _2253 = 1.0 / _2249;
                                                    float _2255 = fma(_2227, _2247, 1.0);
                                                    float _2257 = 1.0 / _2251;
                                                    float _2259 = 1.0 / _2255;
                                                    float _2261 = _2253 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2263 = -_987;
                                                    float _2265 = fma(_2261, _987, _2263);
                                                    float _2267 = _2257 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2269 = -_989;
                                                    float _2271 = fma(_2267, _989, _2269);
                                                    float _2273 = _2259 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2275 = _2265 + _2271;
                                                    float _2277 = -_991;
                                                    float _2279 = fma(_2273, _991, _2277);
                                                    float _2281 = _2279 + _2275;
                                                    float _2283 = -_2265;
                                                    float _2285 = fma(_2281, 0.3333333432674407958984375, _2283);
                                                    float _2287 = -_2271;
                                                    float _2289 = fma(_2281, 0.3333333432674407958984375, _2287);
                                                    float _2291 = -_2279;
                                                    float _2293 = fma(_2281, 0.3333333432674407958984375, _2291);
                                                    float _2295 = fma(_2285, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2265);
                                                    float _2297 = fma(_2289, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2271);
                                                    float _2299 = fma(_2293, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2279);
                                                    float _2301 = _2295 + _987;
                                                    float _2303 = _2297 + _989;
                                                    float _2305 = _2299 + _991;
                                                    _1115 = _2305;
                                                    _1117 = _2303;
                                                    _1119 = _2301;
                                                    _897 = _2299;
                                                    _1123 = _2301;
                                                    _1125 = _2303;
                                                    _1127 = _2305;
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
            _1129 = false;
            int _2307 = as_type<int>(_1115);
            float _2309 = _1117;
            float _2311 = _1119;
            float _2313 = _897;
            float _2315 = _1121;
            float _2317 = _1123;
            float _2319 = _1125;
            float _2321 = _1127;
            float _2323 = _2317 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2325 = _2319 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2327 = _2321 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            _1009 = _2307;
            _1011 = _2309;
            _1013 = _2311;
            _1015 = _2323;
            _899 = _2313;
            _464 = _2319;
            _901 = _2315;
            _466 = _2317;
            _468 = _2321;
            _1017 = _2325;
            _1019 = _2327;
        }
        int _2329 = _1009;
        float _2331 = _1011;
        float _2333 = _1013;
        float _2335 = _1015;
        float _2337 = _899;
        int _2339 = as_type<int>(_464);
        float _2341 = _901;
        int _2343 = as_type<int>(_466);
        float _2345 = _468;
        float _2347 = _1017;
        float _2349 = _1019;
        int _2351 = _498 ? 64 : 0;
        bool _2353 = _484 != 0;
        int _2355 = _384 + 1;
        bool _2357 = _2351 != 0;
        bool _2359 = _2355 >= 4;
        _348 = _2355;
        _356 = _2329;
        _358 = _2331;
        _362 = _2335;
        _368 = _2339;
        _370 = _2341;
        _372 = _2343;
        _374 = _2345;
        float _2361 = _2333;
        float _2363 = _2337;
        if (_430)
        {
            _2361 = _212;
        }
        float _2365 = _2361;
        float _2367 = _2365;
        if (_2353)
        {
            _2363 = _332;
        }
        float _2369 = _2363;
        float _2371 = _2369;
        if (_442)
        {
            _2371 = _336;
        }
        float _2373 = _2371;
        float _2375 = _2373;
        if (_472)
        {
            _2375 = _342;
        }
        float _2377 = _2375;
        float _2379 = _2377;
        if (_508)
        {
            _2379 = _334;
        }
        float _2381 = _2379;
        _366 = _2381;
        if (_436)
        {
            _2367 = _238;
        }
        float _2383 = _2367;
        _2385 = fma(_2347, _2381, _412);
        _354 = _2385;
        float _2387 = _2383;
        if (_478)
        {
            _2387 = _264;
        }
        float _2389 = _2387;
        _2391 = fma(_2335, _2381, _414);
        _352 = _2391;
        float _2393 = _2389;
        float _2395 = _2389;
        if (_2357)
        {
            _2393 = _290;
            _2395 = _290;
        }
        float _2397 = _2393;
        float _2399 = _2395;
        _2401 = fma(_2349, _2381, _416);
        _2403 = fma(_2381, _2399, _418);
        _350 = _2401;
        _360 = _2397;
        _364 = _2403;
        _376 = _2385;
        _378 = _2391;
        _380 = _2401;
        _382 = _2403;
        if (_2359)
        {
            _2405 = true;
            if (_2405)
            {
                break;
            }
        }
    } while (true);
    _2405 = false;
    out.m_47.x = _2391;
    out.m_47.y = _2385;
    out.m_47.z = _2401;
    out.m_47.w = _2403;
    return out;
}

