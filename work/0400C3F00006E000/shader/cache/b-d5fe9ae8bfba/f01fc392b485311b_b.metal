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
int _53(thread const int& _5763, thread const int& _5764, constant _10& support_buffer)
{
    int _5767 = 1 + _5764;
    float _5769 = support_buffer._m5[_5767].x;
    float _5771 = abs(_5769);
    bool _5773 = _5771 == 1.0;
    if (_5773)
    {
        return _5763;
    }
    float _5775 = float(_5763);
    float _5777 = _5775 / _5771;
    int _5779 = int(_5777);
    return _5779;
}

static inline __attribute__((always_inline))
int _55(thread const int& _5801, thread const int& _5802, thread const int& _5803, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _5806 = 1 + _5802;
    float _5808 = support_buffer._m5[_5806].x;
    bool _5810 = _5808 == 1.0;
    if (_5810)
    {
        return _5801;
    }
    bool _5812 = _5808 < 0.0;
    if (_5812)
    {
        float _5814 = -_5808;
        float _5816 = float(_5801);
        float _5818 = _5816 * _5814;
        float _5820 = gl_FragCoord.x;
        float _5822 = gl_FragCoord.y;
        float _5824 = (_5803 != 0) ? _5822 : _5820;
        float _5826 = mod(_5824, _5814);
        float _5828 = _5818 + _5826;
        int _5830 = int(_5828);
        return _5830;
    }
    float _5832 = float(_5801);
    float _5834 = _5832 * _5808;
    int _5836 = int(_5834);
    return _5836;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _2491 = false;
    bool _1183 = false;
    bool _2051 = false;
    bool _1941 = false;
    bool _1823 = false;
    bool _815 = false;
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
    float _352 = _97;
    float _354 = _302;
    float _356 = 0.0;
    float _358 = _99;
    float _360 = _101;
    float _362 = 0.0;
    float _364 = _306;
    float _366 = 0.0;
    float _368 = 0.0;
    float _370 = 0.0;
    int _372 = 0;
    int _374 = 0;
    int _376 = 0;
    float _378 = 0.0;
    float _380 = 0.0;
    float _382 = 0.0;
    float _384 = 0.0;
    float _1173;
    float _1175;
    float _1177;
    float _1179;
    float _1181;
    float _1817;
    float _1819;
    float _1821;
    float _1937;
    float _1939;
    float _2049;
    float _2471;
    float _2477;
    float _2487;
    float _2489;
    do
    {
        int _386 = _348;
        float _388 = _350;
        float _390 = _352;
        float _392 = _354;
        float _394 = _356;
        float _396 = _358;
        float _398 = _360;
        float _400 = _362;
        float _402 = _364;
        float _404 = _366;
        float _406 = _368;
        float _408 = _370;
        int _410 = _372;
        int _412 = _374;
        int _414 = _376;
        float _416 = _378;
        float _418 = _380;
        float _420 = _382;
        float _422 = _384;
        int _424 = _386 << 3;
        int _426 = _386 << 4;
        bool _430 = _424 == 8;
        bool _432 = 0 == _424;
        bool _434 = _426 == 0;
        bool _436 = _424 == 16;
        int _438 = _386 << 2;
        bool _440 = _426 == 16;
        bool _442 = _438 == 0;
        bool _444 = _424 == 24;
        bool _446 = _438 == 4;
        float _448 = _398;
        float _450 = _396;
        float _452 = _390;
        float _454 = _394;
        float _456 = _392;
        float _458 = _388;
        float _460 = _400;
        float _462 = _402;
        float _464 = _404;
        float _466 = _408;
        float _468 = _406;
        float _470 = _408;
        float _472 = as_type<float>(_414);
        float _474 = as_type<float>(_410);
        float _476 = as_type<float>(_412);
        float _478 = as_type<float>(_414);
        if (_432)
        {
            _448 = _338;
        }
        float _480 = _448;
        bool _482 = _438 == 8;
        float _484 = _480;
        if (_432)
        {
            _450 = _344;
        }
        float _486 = _450;
        bool _488 = _426 == 32;
        float _490 = _486;
        if (_430)
        {
            _484 = _340;
        }
        float _492 = _484;
        int _494 = _442 ? 64 : 0;
        float _496 = _492;
        if (_430)
        {
            _490 = _344;
        }
        float _498 = _490;
        float _500 = _498;
        if (_434)
        {
            _452 = _206;
        }
        float _502 = _452;
        float _504 = _502;
        if (_436)
        {
            _496 = _340;
        }
        float _506 = _496;
        bool _508 = _426 == 48;
        float _510 = _506;
        if (_436)
        {
            _500 = _346;
        }
        float _512 = _500;
        float _514 = _512;
        if (_434)
        {
            _454 = _210;
        }
        float _516 = _454;
        bool _518 = _438 == 12;
        float _520 = _516;
        if (_434)
        {
            _456 = _208;
        }
        float _522 = _456;
        float _524 = _522;
        if (_440)
        {
            _524 = _234;
        }
        float _526 = _524;
        float _528 = _526;
        if (_442)
        {
            _458 = _131;
        }
        float _530 = _458;
        float _532 = _530;
        if (_440)
        {
            _504 = _232;
        }
        float _534 = _504;
        float _536 = _534;
        if (_440)
        {
            _520 = _236;
        }
        float _538 = _520;
        float _540 = _538;
        if (_446)
        {
            _532 = _149;
        }
        float _542 = _532;
        float _544 = _542;
        if (_482)
        {
            _544 = _167;
        }
        float _546 = _544;
        float _548 = _546;
        if (_518)
        {
            _548 = _185;
        }
        float _550 = _548;
        float _552 = _550;
        if (_488)
        {
            _536 = _258;
        }
        float _554 = _536;
        float _556 = _554;
        if (_488)
        {
            _528 = _260;
        }
        float _558 = _528;
        bool _560 = _550 >= 1.0;
        bool _562 = isnan(_550);
        bool _564 = _560 || _562;
        bool _566 = isnan(1.0);
        bool _568 = _564 || _566;
        float _570 = _558;
        if (_488)
        {
            _540 = _262;
        }
        float _572 = _540;
        float _574 = _572;
        if (_508)
        {
            _570 = _286;
        }
        float _576 = _570;
        float _578 = _576;
        if (_444)
        {
            _514 = _346;
        }
        float _580 = _514;
        float _582 = _580;
        if (_444)
        {
            _510 = _338;
        }
        float _584 = _510;
        float _586 = _584;
        if (_508)
        {
            _556 = _284;
        }
        float _588 = _556;
        float _590 = _588;
        if (_508)
        {
            _574 = _288;
        }
        float _592 = _574;
        float _594 = _592;
        if (_568)
        {
            _460 = _588;
        }
        float _596 = _460;
        float _598 = _596;
        float _600 = _596;
        if (_568)
        {
            _462 = _576;
        }
        float _602 = _462;
        float _604 = _602;
        float _606 = _602;
        if (_568)
        {
            _552 = _592;
        }
        float _608 = _552;
        float _610 = _608;
        float _612 = _608;
        if (!_568)
        {
            bool _614 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
            bool _616 = isnan(0.0);
            bool _618 = _614 || _616;
            bool _620 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
            bool _622 = _618 || _620;
            if (!_622)
            {
                float _624 = _588 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _598 = _624;
            }
            float _626 = _598;
            _600 = _626;
            if (!_622)
            {
                float _628 = _576 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _604 = _628;
            }
            float _630 = _604;
            _606 = _630;
            if (!_622)
            {
                float _632 = _592 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _610 = _632;
            }
            float _634 = _610;
            bool _636 = !_622;
            _612 = _634;
            if (!_636)
            {
                float _638 = _576 * 0.715200006961822509765625;
                float _640 = fma(_588, 0.2125999927520751953125, _638);
                float _642 = fma(_592, 0.072200000286102294921875, _640);
                float _644 = 1.0 / _642;
                float _646 = _644 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _648 = precise::clamp(_646, 0.0, 1.0);
                float _650 = fma(_648, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
                float _652 = _588 * _650;
                float _654 = _576 * _650;
                float _656 = _592 * _650;
                _612 = _656;
                _600 = _652;
                _606 = _654;
                _464 = _642;
            }
        }
        float _658 = _612;
        float _660 = _600;
        float _662 = _606;
        float _664 = _464;
        float _666 = _658;
        float _668 = _660;
        float _670 = _662;
        float _672 = _664;
        if (!_568)
        {
            float _674 = _580 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _676 = _584 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float2 _3130 = float2(_674, _676);
            float3 _680 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3130, float2(0.0), isnan(_3130))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3130, float2(0.0), isnan(_3130))).xyz;
            float _682 = _680.x;
            float _684 = _680.y;
            float _686 = _680.z;
            float _688 = _682 + _660;
            float _690 = _684 + _662;
            float _692 = _686 + _658;
            _666 = _692;
            _668 = _688;
            _670 = _690;
            _582 = _684;
            _586 = _682;
            _578 = _686;
        }
        float _694 = _666;
        float _696 = _668;
        float _698 = _670;
        float _700 = _582;
        float _702 = _586;
        float _704 = _578;
        float _706 = _694;
        float _708 = _696;
        float _710 = _698;
        float _712 = _702;
        float _714 = _700;
        float _716 = _704;
        if (!_568)
        {
            float _718 = _696 * 4.0;
            float _720 = _698 * 4.0;
            float _722 = _694 * 4.0;
            uint _725 = as_type<uint>(half2(float2(_718, _720)));
            uint _727 = as_type<uint>(half2(float2(_722, 0.0)));
            uint _729 = extract_bits(_725, 16u, 16u);
            float _731 = float(_729);
            uint _733 = extract_bits(_727, 0u, 8u);
            int _735 = int(_733) & 255;
            uint _737 = extract_bits(_727, 8u, 8u);
            int _739 = int(_737) & 255;
            int _741 = _739 << 8;
            int _743 = _735 | _741;
            int _745 = int(_725) & 32767;
            bool _747 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
            float _749 = float(uint(_743));
            float _751 = float(uint(_745));
            float _753 = fma(_749, 6.103515625e-05, -0.3125);
            float _755 = fma(_731, 6.103515625e-05, -0.3125);
            float _757 = fma(_751, 6.103515625e-05, -0.3125);
            float _759 = fma(_753, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _761 = fma(_755, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _763 = fma(_757, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _765 = _753;
            float _767 = as_type<float>(_725);
            float _769 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
            float _771 = (*spvDescriptorSet0.fp_c4)._m0[5].z;
            _590 = _763;
            _716 = _761;
            if (_747)
            {
                float3 _3266 = float3(_763, _761, _759);
                float3 _773 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3266, float3(0.0), isnan(_3266))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3266, float3(0.0), isnan(_3266))).xyz;
                float _775 = _773.x;
                float _777 = _773.y;
                float _779 = _773.z;
                _765 = _775;
                _767 = _777;
                _769 = _779;
            }
            float _781 = _765;
            float _783 = _767;
            float _785 = _769;
            float _787 = _757;
            float _789 = _755;
            float _791 = _664;
            if (!_747)
            {
                float3 _3296 = float3(_763, _761, _759);
                float3 _793 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3296, float3(0.0), isnan(_3296))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3296, float3(0.0), isnan(_3296))).xyz;
                float _795 = _793.x;
                float _797 = _793.y;
                float _799 = _793.z;
                _787 = _795;
                _789 = _797;
                _791 = _799;
            }
            float _801 = _787;
            float _803 = _789;
            float _805 = _791;
            bool _807 = !_747;
            float _809 = _783;
            float _811 = _781;
            float _813 = _785;
            _594 = _785;
            _710 = _783;
            _672 = _805;
            _712 = _801;
            _714 = _803;
            if (!_807)
            {
                _706 = _785;
                _708 = _781;
                _815 = true;
            }
            else
            {
                bool _817 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
                bool _819 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
                bool _821 = _817 || _819;
                bool _823 = isnan(0.001000000047497451305389404296875);
                bool _825 = _821 || _823;
                float _827 = _763;
                float _829 = _761;
                float _831 = _406;
                if (_825)
                {
                    float3 _3354 = float3(_763, _761, _759);
                    float3 _833 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3354, float3(0.0), isnan(_3354))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3354, float3(0.0), isnan(_3354))).xyz;
                    float _835 = _833.x;
                    float _837 = _833.y;
                    float _839 = _833.z;
                    _827 = _835;
                    _829 = _837;
                    _831 = _839;
                }
                float _841 = _827;
                float _843 = _829;
                float _845 = _831;
                float _847 = _845;
                _590 = _841;
                _716 = _843;
                if (!_825)
                {
                    _771 = _801;
                }
                float _849 = _771;
                float _851 = _849;
                if (!_825)
                {
                    _809 = _803;
                }
                float _853 = _809;
                float _855 = _853;
                if (!_825)
                {
                    _811 = _805;
                }
                float _857 = _811;
                _706 = _857;
                if (_825)
                {
                    float _859 = -_801;
                    float _861 = _859 + _841;
                    _813 = _861;
                }
                float _863 = _813;
                _594 = _863;
                if (_825)
                {
                    float _865 = -_803;
                    float _867 = _865 + _843;
                    _466 = _867;
                }
                float _869 = _466;
                _470 = _869;
                if (_825)
                {
                    float _871 = -_805;
                    float _873 = _871 + _845;
                    _847 = _873;
                }
                float _875 = _847;
                _468 = _875;
                if (_825)
                {
                    float _877 = fma(_863, (*spvDescriptorSet0.fp_c4)._m0[5].z, _801);
                    _851 = _877;
                }
                float _879 = _851;
                _708 = _879;
                if (_825)
                {
                    float _881 = fma(_869, (*spvDescriptorSet0.fp_c4)._m0[5].z, _803);
                    _855 = _881;
                }
                float _883 = _855;
                _710 = _883;
                if (_825)
                {
                    float _885 = fma(_875, (*spvDescriptorSet0.fp_c4)._m0[5].z, _805);
                    _706 = _885;
                }
            }
        }
        _815 = false;
        float _887 = _706;
        float _889 = _594;
        float _891 = _708;
        float _893 = _710;
        float _895 = _672;
        float _897 = _468;
        float _899 = _470;
        float _901 = _712;
        float _903 = _590;
        float _905 = _714;
        float _907 = _716;
        float _909 = _903;
        float _911 = _905;
        float _913 = _901;
        float _915 = _889;
        float _917 = _895;
        float _919 = _897;
        float _921 = _907;
        float _923 = _891;
        float _925 = _891;
        float _927 = _893;
        float _929 = _887;
        float _931 = _891;
        float _933 = _893;
        float _935 = _891;
        float _937 = _887;
        float _939 = _891;
        float _941 = _893;
        float _943 = _887;
        float _945 = _891;
        float _947 = _893;
        float _949 = _899;
        if (_568)
        {
            _909 = _891;
        }
        float _951 = _909;
        float _953 = _951;
        if (_568)
        {
            _911 = _893;
        }
        float _955 = _911;
        float _957 = _955;
        if (_568)
        {
            _913 = _887;
        }
        float _959 = _913;
        float _961 = _959;
        if (!_568)
        {
            bool _963 = _891 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _965 = isnan(_891);
            bool _967 = _963 || _965;
            bool _969 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _971 = _967 || _969;
            bool _973 = _893 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _975 = isnan(_893);
            bool _977 = _973 || _975;
            bool _979 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _981 = _977 || _979;
            float _983 = fma(_891, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _985 = fma(_893, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _987 = fma(_887, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            bool _989 = _887 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _991 = isnan(_887);
            bool _993 = _989 || _991;
            bool _995 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _997 = _993 || _995;
            float _999 = exp2(_983);
            float _1001 = exp2(_985);
            float _1003 = exp2(_987);
            float _1005 = -_999;
            float _1007 = _1005 + 1.0;
            bool _1009 = !_971;
            float _1011 = _1009 ? _891 : _1007;
            float _1013 = -_1001;
            float _1015 = _1013 + 1.0;
            bool _1017 = !_981;
            float _1019 = _1017 ? _893 : _1015;
            float _1021 = -_1003;
            float _1023 = _1021 + 1.0;
            bool _1025 = !_997;
            float _1027 = _1025 ? _887 : _1023;
            _915 = _1003;
            _917 = _1015;
            _919 = _1023;
            _961 = _1027;
            _953 = _1011;
            _957 = _1019;
            _921 = _1001;
        }
        float _1029 = _915;
        float _1031 = _917;
        float _1033 = _919;
        float _1035 = _961;
        float _1037 = _953;
        float _1039 = _957;
        float _1041 = _921;
        float _1043 = _1031;
        float _1045 = _1029;
        float _1047 = _1033;
        float _1049 = _1029;
        float _1051 = _1033;
        float _1053 = _1041;
        float _1055 = _1037;
        float _1057 = _1039;
        float _1059 = _1035;
        float _1061 = _1029;
        float _1063 = _1033;
        float _1065 = _1037;
        float _1067 = _1041;
        float _1069 = _1039;
        if (_568)
        {
            _1043 = _1035;
        }
        float _1071 = _1043;
        float _1073 = _1071;
        float _1075 = _1071;
        if (!_568)
        {
            bool _1077 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
            bool _1079 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
            bool _1081 = _1077 || _1079;
            bool _1083 = isnan(6.0);
            bool _1085 = _1081 || _1083;
            float _1087 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
            if (!_1085)
            {
                float _1089 = -_1037;
                float _1091 = _1089 + 1.0;
                float _1093 = -_1039;
                float _1095 = _1093 + 1.0;
                float _1097 = -_1035;
                float _1099 = _1097 + 1.0;
                float _1101 = abs(_1091);
                float _1103 = log2(_1101);
                float _1105 = abs(_1095);
                float _1107 = log2(_1105);
                float _1109 = abs(_1099);
                float _1111 = log2(_1109);
                float _1113 = _1103 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1115 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                float _1117 = _1107 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1119 = exp2(_1113);
                float _1121 = _1111 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1123 = exp2(_1117);
                float _1125 = exp2(_1121);
                float _1127 = fma(_1115, _1119, 1.0);
                float _1129 = fma(_1115, _1123, 1.0);
                float _1131 = 1.0 / _1127;
                float _1133 = fma(_1115, _1125, 1.0);
                float _1135 = 1.0 / _1129;
                float _1137 = 1.0 / _1133;
                float _1139 = _1131 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1141 = _1135 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1143 = precise::max(_1139, _1141);
                float _1145 = _1137 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1147 = precise::max(_1145, _1143);
                float _1149 = -_1139;
                float _1151 = _1149 + _1147;
                float _1153 = -_1141;
                float _1155 = _1153 + _1147;
                float _1157 = -_1145;
                float _1159 = _1157 + _1147;
                float _1161 = fma(_1151, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1139);
                float _1163 = fma(_1155, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1141);
                float _1165 = fma(_1159, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1145);
                float _1167 = _1161 * _1037;
                float _1169 = _1163 * _1039;
                float _1171 = _1165 * _1035;
                _937 = _1163;
                _1173 = _1169;
                _939 = _1137;
                _941 = _1155;
                _1175 = _1171;
                _1177 = _1167;
                _1179 = _1169;
                _1181 = _1171;
                _1183 = true;
            }
            else
            {
                bool _1185 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
                if (!_1185)
                {
                    _1073 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
                }
                float _1187 = _1073;
                bool _1189 = !_1185;
                float _1191 = _1187;
                if (!_1189)
                {
                    float _1193 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
                    float _1195 = _93 + _1193;
                    float _1197 = abs(_1195);
                    float _1199 = _1197 * 2560.0;
                    bool _1201 = _1199 >= 2.0;
                    bool _1203 = isnan(_1199);
                    bool _1205 = _1201 || _1203;
                    bool _1207 = isnan(2.0);
                    bool _1209 = _1205 || _1207;
                    float _1211 = _1199;
                    if (!_1209)
                    {
                        _1211 = 0.0;
                    }
                    float _1213 = _1211;
                    float _1215 = _1213;
                    _1177 = _1213;
                    if (!_1209)
                    {
                        _1045 = 0.0;
                    }
                    float _1217 = _1045;
                    float _1219 = _1217;
                    _1173 = _1217;
                    _1179 = _1217;
                    if (!_1209)
                    {
                        _1047 = 0.0;
                    }
                    float _1221 = _1047;
                    bool _1223 = !_1209;
                    float _1225 = _1221;
                    _1175 = _1221;
                    _1181 = _1221;
                    _1183 = _1223;
                    if (!_1183)
                    {
                        bool _1227 = _93 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                        if (_1227)
                        {
                            _1215 = _1037;
                        }
                        float _1229 = _1215;
                        _1053 = _1229;
                        _1177 = _1229;
                        if (_1227)
                        {
                            _1219 = _1039;
                        }
                        float _1231 = _1219;
                        _1049 = _1231;
                        _1173 = _1231;
                        _1179 = _1231;
                        if (_1227)
                        {
                            _1225 = _1035;
                        }
                        float _1233 = _1225;
                        _1051 = _1233;
                        _1175 = _1233;
                        _1181 = _1233;
                        _1183 = _1227;
                        if (!_1183)
                        {
                            float _1235 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                            _1191 = _1235;
                        }
                    }
                }
                if (!_1183)
                {
                    float _1237 = _1049;
                    float _1239 = _1051;
                    float _1241 = _1191;
                    float _1243 = _1053;
                    bool _1245 = _1241 != 0.0;
                    bool _1247 = isnan(_1241);
                    bool _1249 = _1245 || _1247;
                    bool _1251 = isnan(0.0);
                    bool _1253 = _1249 || _1251;
                    float _1255 = _1243;
                    float _1257 = _1237;
                    float _1259 = _1239;
                    if (!_1253)
                    {
                        float _1261 = _893 * 0.586600005626678466796875;
                        float _1263 = fma(_891, 0.29890000820159912109375, _1261);
                        float _1265 = fma(_887, 0.1143999993801116943359375, _1263);
                        float _1267 = _1265 * (-1.44269502162933349609375);
                        float _1269 = exp2(_1267);
                        float _1271 = -_1269;
                        float _1273 = _1271 + 1.0;
                        bool _1275 = _1273 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _1277 = isnan(_1273);
                        bool _1279 = _1275 || _1277;
                        bool _1281 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _1283 = _1279 || _1281;
                        float _1285 = _1265;
                        if (!_1283)
                        {
                            _1285 = _1273;
                        }
                        float _1287 = _1285;
                        bool _1289 = !_1283;
                        float _1291 = _1287;
                        if (!_1289)
                        {
                            float _1293 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1295 = _1273 + _1293;
                            float _1297 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1299 = spvFAdd(_1297, 1.00000095367431640625);
                            float _1301 = 1.0 / _1299;
                            float _1303 = _1295 * _1301;
                            float _1305 = -_1303;
                            float _1307 = _1305 + 1.0;
                            float _1309 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1311 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1309;
                            float _1313 = abs(_1307);
                            float _1315 = log2(_1313);
                            float _1317 = _1311 * _1301;
                            float _1319 = _1317 + (-1.0);
                            float _1321 = _1317 * _1303;
                            float _1323 = _1315 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1325 = exp2(_1323);
                            float _1327 = fma(_1319, _1325, 1.0);
                            float _1329 = 1.0 / _1327;
                            float _1331 = _1321 * _1329;
                            float _1333 = fma(_1299, _1331, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _923 = _1325;
                            _1291 = _1333;
                        }
                        float _1335 = _923;
                        float _1337 = _1291;
                        float _1339 = -_1273;
                        float _1341 = _1339 + _1337;
                        float _1343 = _1039 * 0.586600005626678466796875;
                        float _1345 = _1341 + 1.0;
                        float _1347 = fma(_1037, 0.29890000820159912109375, _1343);
                        float _1349 = fma(_1035, 0.1143999993801116943359375, _1347);
                        float _1351 = abs(_1345);
                        float _1353 = log2(_1351);
                        float _1355 = spvFAdd(_1349, 9.9999999747524270787835121154785e-07);
                        float _1357 = 1.0 / _1355;
                        float _1359 = _1353 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                        float _1361 = exp2(_1359);
                        float _1363 = fma(_1357, _1037, -1.0);
                        float _1365 = fma(_1357, _1039, -1.0);
                        float _1367 = fma(_1357, _1035, -1.0);
                        float _1369 = fma(_1361, _1363, 1.0);
                        float _1371 = fma(_1361, _1365, 1.0);
                        float _1373 = fma(_1361, _1367, 1.0);
                        float _1375 = _1369 * _1337;
                        float _1377 = _1371 * _1337;
                        float _1379 = _1373 * _1337;
                        float _1381 = precise::max(0.0, _1375);
                        float _1383 = precise::max(0.0, _1377);
                        float _1385 = precise::max(0.0, _1379);
                        float _1387 = precise::min(_1381, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1389 = precise::min(_1383, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1391 = precise::min(_1385, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _937 = _1353;
                        _1173 = _1389;
                        _939 = _1335;
                        _941 = _1361;
                        _1175 = _1391;
                        _1177 = _1387;
                        _1179 = _1389;
                        _1181 = _1391;
                        _1183 = true;
                    }
                    else
                    {
                        bool _1393 = _1241 != 1.0;
                        bool _1395 = isnan(_1241);
                        bool _1397 = _1393 || _1395;
                        bool _1399 = isnan(1.0);
                        bool _1401 = _1397 || _1399;
                        if (!_1401)
                        {
                            bool _1403 = _1037 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1405 = isnan(_1037);
                            bool _1407 = _1403 || _1405;
                            bool _1409 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1411 = _1407 || _1409;
                            float _1413 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1415 = spvFAdd(_1413, 1.00000095367431640625);
                            bool _1417 = _1039 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1419 = isnan(_1039);
                            bool _1421 = _1417 || _1419;
                            bool _1423 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1425 = _1421 || _1423;
                            bool _1427 = _1035 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1429 = isnan(_1035);
                            bool _1431 = _1427 || _1429;
                            bool _1433 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1435 = _1431 || _1433;
                            float _1437 = 1.0 / _1415;
                            float _1439 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1441 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1439;
                            float _1443 = _1441 * _1437;
                            bool _1445 = !_1411;
                            float _1447 = _1437;
                            _941 = _1443;
                            if (!_1445)
                            {
                                float _1449 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1451 = _1037 + _1449;
                                float _1453 = _1443 + (-1.0);
                                float _1455 = _1451 * _1437;
                                float _1457 = -_1455;
                                float _1459 = _1457 + 1.0;
                                float _1461 = _1443 * _1455;
                                float _1463 = abs(_1459);
                                float _1465 = log2(_1463);
                                float _1467 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1469 = exp2(_1467);
                                float _1471 = fma(_1453, _1469, 1.0);
                                float _1473 = 1.0 / _1471;
                                float _1475 = _1461 * _1473;
                                float _1477 = fma(_1415, _1475, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1055 = _1477;
                            }
                            float _1479 = _1055;
                            bool _1481 = !_1425;
                            if (!_1481)
                            {
                                float _1483 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1485 = _1039 + _1483;
                                float _1487 = _1485 * _1437;
                                float _1489 = _1443 + (-1.0);
                                float _1491 = -_1487;
                                float _1493 = _1491 + 1.0;
                                float _1495 = _1443 * _1487;
                                float _1497 = abs(_1493);
                                float _1499 = log2(_1497);
                                float _1501 = _1499 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1503 = exp2(_1501);
                                float _1505 = fma(_1489, _1503, 1.0);
                                float _1507 = 1.0 / _1505;
                                float _1509 = _1495 * _1507;
                                float _1511 = fma(_1415, _1509, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _925 = _1505;
                                _1057 = _1511;
                            }
                            float _1513 = _925;
                            float _1515 = _1057;
                            bool _1517 = !_1435;
                            _939 = _1513;
                            if (!_1517)
                            {
                                float _1519 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1521 = _1035 + _1519;
                                float _1523 = _1443 + (-1.0);
                                float _1525 = _1521 * _1437;
                                float _1527 = -_1525;
                                float _1529 = _1527 + 1.0;
                                float _1531 = _1443 * _1525;
                                float _1533 = abs(_1529);
                                float _1535 = log2(_1533);
                                float _1537 = _1535 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1539 = exp2(_1537);
                                float _1541 = fma(_1523, _1539, 1.0);
                                float _1543 = 1.0 / _1541;
                                float _1545 = _1531 * _1543;
                                float _1547 = fma(_1415, _1545, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1447 = _1545;
                                _1059 = _1547;
                            }
                            float _1549 = _1447;
                            float _1551 = _1059;
                            float _1553 = precise::max(0.0, _1551);
                            float _1555 = precise::max(0.0, _1479);
                            float _1557 = precise::max(0.0, _1515);
                            float _1559 = precise::min(_1553, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1561 = precise::min(_1555, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1563 = precise::min(_1557, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            _937 = _1549;
                            _1173 = _1563;
                            _1175 = _1559;
                            _1177 = _1561;
                            _1179 = _1563;
                            _1181 = _1559;
                            _1183 = true;
                        }
                        else
                        {
                            bool _1565 = _1241 != 2.0;
                            bool _1567 = isnan(_1241);
                            bool _1569 = _1565 || _1567;
                            bool _1571 = isnan(2.0);
                            bool _1573 = _1569 || _1571;
                            if (!_1573)
                            {
                                float _1575 = _1039 * 0.715200006961822509765625;
                                float _1577 = fma(_1037, 0.2125999927520751953125, _1575);
                                float _1579 = fma(_1035, 0.072200000286102294921875, _1577);
                                float _1581 = spvFAdd(_1579, 9.9999999747524270787835121154785e-07);
                                bool _1583 = _1579 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1585 = isnan(_1579);
                                bool _1587 = _1583 || _1585;
                                bool _1589 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1591 = _1587 || _1589;
                                float _1593 = 1.0 / _1581;
                                bool _1595 = !_1591;
                                float _1597 = _1579;
                                if (!_1595)
                                {
                                    float _1599 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1601 = _1579 + _1599;
                                    float _1603 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1605 = spvFAdd(_1603, 1.00000095367431640625);
                                    float _1607 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1609 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1607;
                                    float _1611 = 1.0 / _1605;
                                    float _1613 = _1601 * _1611;
                                    float _1615 = _1609 * _1611;
                                    float _1617 = -_1613;
                                    float _1619 = _1617 + 1.0;
                                    float _1621 = _1615 + (-1.0);
                                    float _1623 = _1615 * _1613;
                                    float _1625 = abs(_1619);
                                    float _1627 = log2(_1625);
                                    float _1629 = _1627 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1631 = exp2(_1629);
                                    float _1633 = fma(_1621, _1631, 1.0);
                                    float _1635 = 1.0 / _1633;
                                    float _1637 = _1623 * _1635;
                                    float _1639 = fma(_1605, _1637, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    _927 = _1627;
                                    _1597 = _1639;
                                }
                                float _1641 = _927;
                                float _1643 = _1597;
                                float _1645 = precise::max(0.0, _1643);
                                float _1647 = precise::min(_1645, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1649 = _1647 * _1593;
                                float _1651 = _1037 * _1649;
                                float _1653 = _1039 * _1649;
                                float _1655 = _1035 * _1649;
                                float _1657 = precise::max(0.0, _1651);
                                float _1659 = precise::max(0.0, _1653);
                                float _1661 = precise::max(0.0, _1655);
                                float _1663 = precise::min(_1657, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1665 = precise::min(_1659, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1667 = precise::min(_1661, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                _937 = _1647;
                                _1173 = _1665;
                                _941 = _1641;
                                _1175 = _1667;
                                _1177 = _1663;
                                _1179 = _1665;
                                _1181 = _1667;
                                _1183 = true;
                            }
                            else
                            {
                                bool _1669 = _1241 != 3.0;
                                bool _1671 = isnan(_1241);
                                bool _1673 = _1669 || _1671;
                                bool _1675 = isnan(3.0);
                                bool _1677 = _1673 || _1675;
                                if (!_1677)
                                {
                                    float _1679 = -_1037;
                                    float _1681 = _1679 + 1.0;
                                    float _1683 = -_1039;
                                    float _1685 = _1683 + 1.0;
                                    float _1687 = -_1035;
                                    float _1689 = _1687 + 1.0;
                                    float _1691 = abs(_1681);
                                    float _1693 = log2(_1691);
                                    float _1695 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1697 = abs(_1685);
                                    float _1699 = log2(_1697);
                                    float _1701 = abs(_1689);
                                    float _1703 = log2(_1701);
                                    float _1705 = _1693 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1707 = _1699 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1709 = exp2(_1705);
                                    float _1711 = _1703 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1713 = exp2(_1707);
                                    float _1715 = exp2(_1711);
                                    float _1717 = fma(_1695, _1709, 1.0);
                                    float _1719 = fma(_1695, _1713, 1.0);
                                    float _1721 = 1.0 / _1717;
                                    float _1723 = fma(_1695, _1715, 1.0);
                                    float _1725 = 1.0 / _1719;
                                    float _1727 = 1.0 / _1723;
                                    float _1729 = _1721 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1731 = _1721 + _1725;
                                    float _1733 = _1725 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1735 = precise::max(_1729, _1733);
                                    float _1737 = _1727 + _1731;
                                    float _1739 = _1727 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1741 = _1737 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1743 = precise::max(_1739, _1735);
                                    float _1745 = _1741 * 0.3333333432674407958984375;
                                    float _1747 = -_1745;
                                    float _1749 = _1743 + _1747;
                                    float _1751 = fma(_1749, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1745);
                                    float _1753 = -_1729;
                                    float _1755 = _1753 + _1751;
                                    float _1757 = -_1733;
                                    float _1759 = _1757 + _1751;
                                    float _1761 = -_1739;
                                    float _1763 = _1761 + _1751;
                                    float _1765 = fma(_1755, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1729);
                                    float _1767 = fma(_1759, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1733);
                                    float _1769 = fma(_1763, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1739);
                                    float _1771 = _1765 * _1037;
                                    float _1773 = _1767 * _1039;
                                    float _1775 = _1769 * _1035;
                                    _937 = _1763;
                                    _1173 = _1773;
                                    _939 = _1733;
                                    _941 = _1759;
                                    _1175 = _1775;
                                    _1087 = _1743;
                                    _1177 = _1771;
                                    _1179 = _1773;
                                    _1181 = _1775;
                                    _1183 = true;
                                }
                                else
                                {
                                    bool _1777 = _1241 != 4.0;
                                    bool _1779 = isnan(_1241);
                                    bool _1781 = _1777 || _1779;
                                    bool _1783 = isnan(4.0);
                                    bool _1785 = _1781 || _1783;
                                    if (!_1785)
                                    {
                                        bool _1787 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        bool _1789 = isnan(0.0);
                                        bool _1791 = _1787 || _1789;
                                        bool _1793 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        bool _1795 = _1791 || _1793;
                                        if (!_1795)
                                        {
                                            float _1797 = -_1037;
                                            float _1799 = _1797 + 1.0;
                                            float _1801 = abs(_1799);
                                            float _1803 = log2(_1801);
                                            float _1805 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1807 = _1803 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1809 = exp2(_1807);
                                            float _1811 = fma(_1805, _1809, 1.0);
                                            float _1813 = 1.0 / _1811;
                                            float _1815 = _1813 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1817 = _1807;
                                            _1819 = _1813;
                                            _1821 = _1815;
                                            _1823 = true;
                                        }
                                        else
                                        {
                                            float _1825 = spvFAdd(_1037, 9.9999999747524270787835121154785e-07);
                                            bool _1827 = _1037 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1829 = isnan(_1037);
                                            bool _1831 = _1827 || _1829;
                                            bool _1833 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1835 = _1831 || _1833;
                                            float _1837 = 1.0 / _1825;
                                            if (!_1835)
                                            {
                                                _929 = _1037;
                                            }
                                            float _1839 = _929;
                                            bool _1841 = !_1835;
                                            float _1843 = _1839;
                                            if (!_1841)
                                            {
                                                float _1845 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1847 = _1037 + _1845;
                                                float _1849 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1851 = spvFAdd(_1849, 1.00000095367431640625);
                                                float _1853 = 1.0 / _1851;
                                                float _1855 = _1847 * _1853;
                                                float _1857 = -_1855;
                                                float _1859 = _1857 + 1.0;
                                                float _1861 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1863 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1861;
                                                float _1865 = abs(_1859);
                                                float _1867 = log2(_1865);
                                                float _1869 = _1863 * _1853;
                                                float _1871 = _1869 + (-1.0);
                                                float _1873 = _1869 * _1855;
                                                float _1875 = _1867 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1877 = exp2(_1875);
                                                float _1879 = fma(_1871, _1877, 1.0);
                                                float _1881 = 1.0 / _1879;
                                                float _1883 = _1873 * _1881;
                                                float _1885 = fma(_1851, _1883, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _931 = _1875;
                                                _1843 = _1885;
                                                _933 = _1883;
                                                _472 = _1881;
                                            }
                                            float _1887 = _931;
                                            float _1889 = _1843;
                                            float _1891 = _933;
                                            float _1893 = _472;
                                            float _1895 = precise::max(0.0, _1889);
                                            float _1897 = precise::min(_1895, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1899 = _1897 * _1837;
                                            _935 = _1887;
                                            _1817 = _1891;
                                            _1819 = _1893;
                                            _1821 = _1899;
                                        }
                                        _1823 = false;
                                        float _1901 = _935;
                                        float _1903 = _1817;
                                        float _1905 = _1819;
                                        float _1907 = _1821;
                                        float _1909 = _1903;
                                        float _1911 = _1901;
                                        float _1913 = _1905;
                                        float _1915 = _1901;
                                        if (!_1795)
                                        {
                                            float _1917 = -_1039;
                                            float _1919 = _1917 + 1.0;
                                            float _1921 = abs(_1919);
                                            float _1923 = log2(_1921);
                                            float _1925 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1927 = _1923 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1929 = exp2(_1927);
                                            float _1931 = fma(_1925, _1929, 1.0);
                                            float _1933 = 1.0 / _1931;
                                            float _1935 = _1933 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1937 = _1927;
                                            _1939 = _1935;
                                            _1941 = true;
                                        }
                                        else
                                        {
                                            float _1943 = spvFAdd(_1039, 9.9999999747524270787835121154785e-07);
                                            bool _1945 = _1039 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1947 = isnan(_1039);
                                            bool _1949 = _1945 || _1947;
                                            bool _1951 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1953 = _1949 || _1951;
                                            float _1955 = 1.0 / _1943;
                                            if (!_1953)
                                            {
                                                _1909 = _1039;
                                            }
                                            float _1957 = _1909;
                                            bool _1959 = !_1953;
                                            float _1961 = _1957;
                                            if (!_1959)
                                            {
                                                float _1963 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1965 = _1039 + _1963;
                                                float _1967 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1969 = spvFAdd(_1967, 1.00000095367431640625);
                                                float _1971 = 1.0 / _1969;
                                                float _1973 = _1965 * _1971;
                                                float _1975 = -_1973;
                                                float _1977 = _1975 + 1.0;
                                                float _1979 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1981 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1979;
                                                float _1983 = abs(_1977);
                                                float _1985 = log2(_1983);
                                                float _1987 = _1981 * _1971;
                                                float _1989 = _1987 + (-1.0);
                                                float _1991 = _1987 * _1973;
                                                float _1993 = _1985 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1995 = exp2(_1993);
                                                float _1997 = fma(_1989, _1995, 1.0);
                                                float _1999 = 1.0 / _1997;
                                                float _2001 = _1991 * _1999;
                                                float _2003 = fma(_1969, _2001, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1911 = _1995;
                                                _1961 = _2003;
                                                _1913 = _2001;
                                            }
                                            float _2005 = _1911;
                                            float _2007 = _1961;
                                            float _2009 = _1913;
                                            float _2011 = precise::max(0.0, _2007);
                                            float _2013 = precise::min(_2011, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _2015 = _2013 * _1955;
                                            _1915 = _2005;
                                            _1937 = _2009;
                                            _1939 = _2015;
                                        }
                                        _1941 = false;
                                        float _2017 = _1915;
                                        float _2019 = _1937;
                                        float _2021 = _1939;
                                        float _2023 = _2019;
                                        float _2025 = _2017;
                                        float _2027 = _2017;
                                        if (!_1795)
                                        {
                                            float _2029 = -_1035;
                                            float _2031 = _2029 + 1.0;
                                            float _2033 = abs(_2031);
                                            float _2035 = log2(_2033);
                                            float _2037 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _2039 = _2035 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _2041 = exp2(_2039);
                                            float _2043 = fma(_2037, _2041, 1.0);
                                            float _2045 = 1.0 / _2043;
                                            float _2047 = _2045 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _2049 = _2047;
                                            _2051 = true;
                                        }
                                        else
                                        {
                                            float _2053 = spvFAdd(_1035, 9.9999999747524270787835121154785e-07);
                                            bool _2055 = _1035 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _2057 = isnan(_1035);
                                            bool _2059 = _2055 || _2057;
                                            bool _2061 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _2063 = _2059 || _2061;
                                            float _2065 = 1.0 / _2053;
                                            if (!_2063)
                                            {
                                                _2023 = _1035;
                                            }
                                            float _2067 = _2023;
                                            bool _2069 = !_2063;
                                            float _2071 = _2067;
                                            if (!_2069)
                                            {
                                                float _2073 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _2075 = _1035 + _2073;
                                                float _2077 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _2079 = spvFAdd(_2077, 1.00000095367431640625);
                                                float _2081 = 1.0 / _2079;
                                                float _2083 = _2075 * _2081;
                                                float _2085 = -_2083;
                                                float _2087 = _2085 + 1.0;
                                                float _2089 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _2091 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _2089;
                                                float _2093 = abs(_2087);
                                                float _2095 = log2(_2093);
                                                float _2097 = _2091 * _2081;
                                                float _2099 = _2097 + (-1.0);
                                                float _2101 = _2097 * _2083;
                                                float _2103 = _2095 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2105 = exp2(_2103);
                                                float _2107 = fma(_2099, _2105, 1.0);
                                                float _2109 = 1.0 / _2107;
                                                float _2111 = _2101 * _2109;
                                                float _2113 = fma(_2079, _2111, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _2025 = _2083;
                                                _2071 = _2113;
                                            }
                                            float _2115 = _2025;
                                            float _2117 = _2071;
                                            float _2119 = precise::max(0.0, _2117);
                                            float _2121 = precise::min(_2119, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _2123 = _2121 * _2065;
                                            _2027 = _2115;
                                            _2049 = _2123;
                                        }
                                        _2051 = false;
                                        float _2125 = _2027;
                                        float _2127 = _2049;
                                        float _2129 = precise::max(_1907, _2021);
                                        float _2131 = precise::max(_2129, _2127);
                                        float _2133 = -_1907;
                                        float _2135 = _2131 + _2133;
                                        float _2137 = -_2021;
                                        float _2139 = _2131 + _2137;
                                        float _2141 = -_2127;
                                        float _2143 = _2131 + _2141;
                                        float _2145 = fma(_2135, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1907);
                                        float _2147 = fma(_2139, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2021);
                                        float _2149 = fma(_2143, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2127);
                                        float _2151 = _2145 * _1037;
                                        float _2153 = _2147 * _1039;
                                        float _2155 = _2149 * _1035;
                                        _937 = _2147;
                                        _1173 = _2153;
                                        _939 = _2125;
                                        _941 = _2149;
                                        _1175 = _2155;
                                        _1177 = _2151;
                                        _1179 = _2153;
                                        _1181 = _2155;
                                        _1183 = true;
                                    }
                                    else
                                    {
                                        bool _2157 = _1241 != 5.0;
                                        bool _2159 = isnan(_1241);
                                        bool _2161 = _2157 || _2159;
                                        bool _2163 = isnan(5.0);
                                        bool _2165 = _2161 || _2163;
                                        if (!_2165)
                                        {
                                            _1255 = _891;
                                        }
                                        float _2167 = _1255;
                                        float _2169 = _2167;
                                        _1177 = _2167;
                                        if (!_2165)
                                        {
                                            _1257 = _893;
                                        }
                                        float _2171 = _1257;
                                        float _2173 = _2171;
                                        _1173 = _2171;
                                        _1179 = _2171;
                                        if (!_2165)
                                        {
                                            _1259 = _887;
                                        }
                                        float _2175 = _1259;
                                        bool _2177 = !_2165;
                                        float _2179 = _2175;
                                        _1175 = _2175;
                                        _1181 = _2175;
                                        if (!_2177)
                                        {
                                            bool _2181 = _1241 != 6.0;
                                            bool _2183 = isnan(_1241);
                                            bool _2185 = _2181 || _2183;
                                            bool _2187 = isnan(6.0);
                                            bool _2189 = _2185 || _2187;
                                            if (!_2189)
                                            {
                                                float _2191 = -_1039;
                                                float _2193 = _2191 + 1.0;
                                                float _2195 = -_1037;
                                                float _2197 = _2195 + 1.0;
                                                float _2199 = -_1035;
                                                float _2201 = _2199 + 1.0;
                                                float _2203 = abs(_2193);
                                                float _2205 = log2(_2203);
                                                float _2207 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                float _2209 = abs(_2197);
                                                float _2211 = log2(_2209);
                                                float _2213 = abs(_2201);
                                                float _2215 = log2(_2213);
                                                float _2217 = _2205 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2219 = _2211 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2221 = exp2(_2217);
                                                float _2223 = _2215 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2225 = exp2(_2219);
                                                float _2227 = exp2(_2223);
                                                float _2229 = fma(_2207, _2221, 1.0);
                                                float _2231 = fma(_2207, _2225, 1.0);
                                                float _2233 = 1.0 / _2229;
                                                float _2235 = fma(_2207, _2227, 1.0);
                                                float _2237 = 1.0 / _2231;
                                                float _2239 = 1.0 / _2235;
                                                float _2241 = _2233 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2243 = _2237 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2245 = precise::max(_2243, _2241);
                                                float _2247 = _2239 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2249 = precise::max(_2247, _2245);
                                                float _2251 = -_2243;
                                                float _2253 = _2251 + _2249;
                                                float _2255 = -_2241;
                                                float _2257 = _2255 + _2249;
                                                float _2259 = -_2247;
                                                float _2261 = _2259 + _2249;
                                                float _2263 = fma(_2253, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2243);
                                                float _2265 = fma(_2257, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2241);
                                                float _2267 = fma(_2261, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2247);
                                                float _2269 = _2263 * _1037;
                                                float _2271 = _2265 * _1039;
                                                float _2273 = _2267 * _1035;
                                                _937 = _2233;
                                                _1173 = _2271;
                                                _939 = _2261;
                                                _941 = _2267;
                                                _1175 = _2273;
                                                _1087 = _2253;
                                                _1177 = _2269;
                                                _1179 = _2271;
                                                _1181 = _2273;
                                                _1183 = true;
                                            }
                                            else
                                            {
                                                bool _2275 = _1241 != 7.0;
                                                bool _2277 = isnan(_1241);
                                                bool _2279 = _2275 || _2277;
                                                bool _2281 = isnan(7.0);
                                                bool _2283 = _2279 || _2281;
                                                if (_2283)
                                                {
                                                    _2169 = as_type<float>(_412);
                                                }
                                                float _2285 = _2169;
                                                _1177 = _2285;
                                                if (_2283)
                                                {
                                                    _2173 = as_type<float>(_410);
                                                }
                                                float _2287 = _2173;
                                                _1173 = _2287;
                                                _1179 = _2287;
                                                if (_2283)
                                                {
                                                    _2179 = as_type<float>(_414);
                                                }
                                                float _2289 = _2179;
                                                _1175 = _2289;
                                                _1181 = _2289;
                                                if (!_2283)
                                                {
                                                    float _2291 = -_1039;
                                                    float _2293 = _2291 + 1.0;
                                                    float _2295 = -_1037;
                                                    float _2297 = _2295 + 1.0;
                                                    float _2299 = -_1035;
                                                    float _2301 = _2299 + 1.0;
                                                    float _2303 = abs(_2293);
                                                    float _2305 = log2(_2303);
                                                    float _2307 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                    float _2309 = abs(_2297);
                                                    float _2311 = log2(_2309);
                                                    float _2313 = abs(_2301);
                                                    float _2315 = log2(_2313);
                                                    float _2317 = _2305 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2319 = _2311 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2321 = exp2(_2317);
                                                    float _2323 = _2315 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2325 = exp2(_2319);
                                                    float _2327 = exp2(_2323);
                                                    float _2329 = fma(_2307, _2321, 1.0);
                                                    float _2331 = fma(_2307, _2325, 1.0);
                                                    float _2333 = 1.0 / _2329;
                                                    float _2335 = fma(_2307, _2327, 1.0);
                                                    float _2337 = 1.0 / _2331;
                                                    float _2339 = 1.0 / _2335;
                                                    float _2341 = _2333 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2343 = -_1039;
                                                    float _2345 = fma(_2341, _1039, _2343);
                                                    float _2347 = _2337 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2349 = -_1037;
                                                    float _2351 = fma(_2347, _1037, _2349);
                                                    float _2353 = _2339 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2355 = _2351 + _2345;
                                                    float _2357 = -_1035;
                                                    float _2359 = fma(_2353, _1035, _2357);
                                                    float _2361 = _2359 + _2355;
                                                    float _2363 = -_2351;
                                                    float _2365 = fma(_2361, 0.3333333432674407958984375, _2363);
                                                    float _2367 = -_2345;
                                                    float _2369 = fma(_2361, 0.3333333432674407958984375, _2367);
                                                    float _2371 = -_2359;
                                                    float _2373 = fma(_2361, 0.3333333432674407958984375, _2371);
                                                    float _2375 = fma(_2365, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2351);
                                                    float _2377 = fma(_2369, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2345);
                                                    float _2379 = fma(_2373, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2359);
                                                    float _2381 = _2375 + _1037;
                                                    float _2383 = _2377 + _1039;
                                                    float _2385 = _2379 + _1035;
                                                    _937 = _2377;
                                                    _1173 = _2383;
                                                    _939 = _2339;
                                                    _941 = _2379;
                                                    _1175 = _2385;
                                                    _1177 = _2381;
                                                    _1179 = _2383;
                                                    _1181 = _2385;
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
            _1183 = false;
            float _2387 = _937;
            float _2389 = _1173;
            float _2391 = _939;
            float _2393 = _941;
            float _2395 = _1175;
            float _2397 = _1087;
            float _2399 = _1177;
            float _2401 = _1179;
            float _2403 = _1181;
            float _2405 = _2399 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2407 = _2401 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2409 = _2403 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            _943 = _2387;
            _1061 = _2389;
            _945 = _2391;
            _947 = _2393;
            _1075 = _2409;
            _1063 = _2395;
            _949 = _2397;
            _474 = _2401;
            _476 = _2399;
            _478 = _2403;
            _1065 = _2405;
            _1067 = _2399;
            _1069 = _2407;
        }
        float _2411 = _943;
        float _2413 = _1061;
        float _2415 = _945;
        float _2417 = _947;
        float _2419 = _1075;
        float _2421 = _1063;
        float _2423 = _949;
        int _2425 = as_type<int>(_474);
        int _2427 = as_type<int>(_476);
        int _2429 = as_type<int>(_478);
        float _2431 = _1065;
        float _2433 = _1067;
        float _2435 = _1069;
        int _2437 = _508 ? 64 : 0;
        bool _2439 = _494 != 0;
        int _2441 = _386 + 1;
        bool _2443 = _2437 != 0;
        bool _2445 = _2441 >= 4;
        _348 = _2441;
        _356 = _2413;
        _362 = _2415;
        _364 = _2417;
        _366 = _2419;
        _368 = _2421;
        _370 = _2423;
        _372 = _2425;
        _374 = _2427;
        _376 = _2429;
        float _2447 = _2411;
        float _2449 = _2433;
        if (_434)
        {
            _2447 = _212;
        }
        float _2451 = _2447;
        float _2453 = _2451;
        if (_2439)
        {
            _2449 = _332;
        }
        float _2455 = _2449;
        float _2457 = _2455;
        if (_446)
        {
            _2457 = _336;
        }
        float _2459 = _2457;
        float _2461 = _2459;
        if (_482)
        {
            _2461 = _342;
        }
        float _2463 = _2461;
        float _2465 = _2463;
        if (_518)
        {
            _2465 = _334;
        }
        float _2467 = _2465;
        if (_440)
        {
            _2453 = _238;
        }
        float _2469 = _2453;
        _2471 = fma(_2431, _2467, _416);
        _360 = _2471;
        float _2473 = _2469;
        if (_488)
        {
            _2473 = _264;
        }
        float _2475 = _2473;
        _2477 = fma(_2435, _2467, _418);
        _358 = _2477;
        float _2479 = _2475;
        float _2481 = _2475;
        if (_2443)
        {
            _2479 = _290;
            _2481 = _290;
        }
        float _2483 = _2479;
        float _2485 = _2481;
        _2487 = fma(_2419, _2467, _420);
        _2489 = fma(_2467, _2485, _422);
        _350 = _2483;
        _352 = _2487;
        _354 = _2489;
        _378 = _2471;
        _380 = _2477;
        _382 = _2487;
        _384 = _2489;
        if (_2445)
        {
            _2491 = true;
            if (_2491)
            {
                break;
            }
        }
    } while (true);
    _2491 = false;
    out.m_47.x = _2471;
    out.m_47.y = _2477;
    out.m_47.z = _2487;
    out.m_47.w = _2489;
    return out;
}

