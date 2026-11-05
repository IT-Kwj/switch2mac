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
    texture3d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture3d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _51(thread const int& _5611, thread const int& _5612, constant _10& support_buffer)
{
    int _5615 = 1 + _5612;
    float _5617 = support_buffer._m5[_5615].x;
    float _5619 = abs(_5617);
    bool _5621 = _5619 == 1.0;
    if (_5621)
    {
        return _5611;
    }
    float _5623 = float(_5611);
    float _5625 = _5623 / _5619;
    int _5627 = int(_5625);
    return _5627;
}

static inline __attribute__((always_inline))
int _53(thread const int& _5649, thread const int& _5650, thread const int& _5651, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _5654 = 1 + _5650;
    float _5656 = support_buffer._m5[_5654].x;
    bool _5658 = _5656 == 1.0;
    if (_5658)
    {
        return _5649;
    }
    bool _5660 = _5656 < 0.0;
    if (_5660)
    {
        float _5662 = -_5656;
        float _5664 = float(_5649);
        float _5666 = _5664 * _5662;
        float _5668 = gl_FragCoord.x;
        float _5670 = gl_FragCoord.y;
        float _5672 = (_5651 != 0) ? _5670 : _5668;
        float _5674 = mod(_5672, _5662);
        float _5676 = _5666 + _5674;
        int _5678 = int(_5676);
        return _5678;
    }
    float _5680 = float(_5649);
    float _5682 = _5680 * _5656;
    int _5684 = int(_5682);
    return _5684;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _2401 = false;
    bool _1125 = false;
    bool _1967 = false;
    bool _1867 = false;
    bool _1763 = false;
    bool _799 = false;
    int _56 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _58 = _56;
    int _60 = 0;
    int _62 = _51(_58, _60, (*spvDescriptorSet0.support_buffer));
    int _64 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _66 = _64;
    int _68 = 0;
    int _70 = _51(_66, _68, (*spvDescriptorSet0.support_buffer));
    float _73 = gl_FragCoord.w;
    float _75 = in.m_42.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_42.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _73;
    float _89 = _87 * _79;
    float _91 = _87 * _85;
    float _93 = float(_70);
    float _95 = float(_62);
    float _97 = fma(_89, _93, -0.4999000132083892822265625);
    float _99 = fma(_91, _95, -0.4999000132083892822265625);
    float _101 = floor(_97);
    int _103 = int(_101);
    float _105 = floor(_99);
    int _107 = int(_105);
    int _109 = _103 + 1;
    int _111 = _107 + 1;
    int _113 = _107;
    int _115 = 1;
    int _117 = 0;
    int _119 = _53(_113, _115, _117, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _121 = _103;
    int _123 = 1;
    int _125 = 1;
    int _127 = _53(_121, _123, _125, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _129 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_119, _127)), 0).x;
    int _131 = _107;
    int _133 = 1;
    int _135 = 0;
    int _137 = _53(_131, _133, _135, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _139 = _109;
    int _141 = 1;
    int _143 = 1;
    int _145 = _53(_139, _141, _143, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _147 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_137, _145)), 0).x;
    int _149 = _111;
    int _151 = 1;
    int _153 = 0;
    int _155 = _53(_149, _151, _153, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _157 = _109;
    int _159 = 1;
    int _161 = 1;
    int _163 = _53(_157, _159, _161, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _165 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_155, _163)), 0).x;
    int _167 = _111;
    int _169 = 1;
    int _171 = 0;
    int _173 = _53(_167, _169, _171, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _175 = _103;
    int _177 = 1;
    int _179 = 1;
    int _181 = _53(_175, _177, _179, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _183 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_173, _181)), 0).x;
    int _185 = _107;
    int _187 = 0;
    int _189 = 0;
    int _191 = _53(_185, _187, _189, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _193 = _103;
    int _195 = 0;
    int _197 = 1;
    int _199 = _53(_193, _195, _197, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _202 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_191, _199)), 0).xyzw;
    float _204 = _202.x;
    float _206 = _202.y;
    float _208 = _202.z;
    float _210 = _202.w;
    int _212 = _107;
    int _214 = 0;
    int _216 = 0;
    int _218 = _53(_212, _214, _216, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _220 = _109;
    int _222 = 0;
    int _224 = 1;
    int _226 = _53(_220, _222, _224, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _228 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_218, _226)), 0).xyzw;
    float _230 = _228.x;
    float _232 = _228.y;
    float _234 = _228.z;
    float _236 = _228.w;
    int _238 = _111;
    int _240 = 0;
    int _242 = 0;
    int _244 = _53(_238, _240, _242, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _246 = _109;
    int _248 = 0;
    int _250 = 1;
    int _252 = _53(_246, _248, _250, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _254 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_244, _252)), 0).xyzw;
    float _256 = _254.x;
    float _258 = _254.y;
    float _260 = _254.z;
    float _262 = _254.w;
    int _264 = _111;
    int _266 = 0;
    int _268 = 0;
    int _270 = _53(_264, _266, _268, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _272 = _103;
    int _274 = 0;
    int _276 = 1;
    int _278 = _53(_272, _274, _276, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _280 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_270, _278)), 0).xyzw;
    float _282 = _280.x;
    float _284 = _280.y;
    float _286 = _280.z;
    float _288 = _280.w;
    float _290 = floor(_99);
    float _292 = float(_103);
    float _294 = float(_107);
    float _296 = _292 + 0.5;
    float _298 = floor(_97);
    float _300 = 1.0 / _93;
    float _302 = -_290;
    float _304 = _99 + _302;
    float _306 = 1.0 / _95;
    float _308 = -_298;
    float _310 = _97 + _308;
    float _312 = float(_109);
    float _314 = float(_111);
    float _316 = -_304;
    float _318 = _316 + 1.0;
    float _320 = -_310;
    float _322 = _320 + 1.0;
    float _324 = _312 + 0.5;
    float _326 = _294 + 0.5;
    float _328 = _314 + 0.5;
    float _330 = _318 * _322;
    float _332 = _304 * _322;
    float _334 = _310 * _318;
    float _336 = _296 * _300;
    float _338 = _324 * _300;
    float _340 = _304 * _310;
    float _342 = _326 * _306;
    float _344 = _328 * _306;
    int _346 = 0;
    float _348 = _99;
    float _350 = _310;
    float _352 = 0.0;
    float _354 = 0.0;
    float _356 = _95;
    float _358 = _300;
    float _360 = _97;
    float _362 = _304;
    int _364 = 0;
    float _366 = 0.0;
    int _368 = 0;
    int _370 = 0;
    float _372 = 0.0;
    float _374 = 0.0;
    float _376 = 0.0;
    float _378 = 0.0;
    float _380 = 0.0;
    float _1111;
    float _1113;
    float _1115;
    float _1117;
    float _1119;
    float _1121;
    float _1123;
    float _1759;
    float _1761;
    float _1863;
    float _1865;
    float _1965;
    float _2381;
    float _2387;
    float _2397;
    float _2399;
    do
    {
        int _382 = _346;
        float _384 = _348;
        float _386 = _350;
        float _388 = _352;
        float _390 = _354;
        float _392 = _356;
        float _394 = _358;
        float _396 = _360;
        float _398 = _362;
        int _400 = _364;
        float _402 = _366;
        int _404 = _368;
        int _406 = _370;
        float _408 = _372;
        float _410 = _374;
        float _412 = _376;
        float _414 = _378;
        float _416 = _380;
        int _418 = _382 << 3;
        int _420 = _382 << 4;
        bool _424 = _418 == 8;
        bool _426 = 0 == _418;
        bool _428 = _420 == 0;
        bool _430 = _418 == 16;
        int _432 = _382 << 2;
        bool _434 = _420 == 16;
        bool _436 = _432 == 0;
        bool _438 = _418 == 24;
        bool _440 = _432 == 4;
        float _442 = _392;
        float _444 = _394;
        float _446 = _386;
        float _448 = _390;
        float _450 = _388;
        float _452 = _384;
        float _454 = _396;
        float _456 = _398;
        int _458 = _404;
        float _460 = _402;
        float _462 = as_type<float>(_400);
        float _464 = as_type<float>(_406);
        float _466 = _408;
        if (_426)
        {
            _442 = _336;
        }
        float _468 = _442;
        bool _470 = _432 == 8;
        float _472 = _468;
        if (_426)
        {
            _444 = _342;
        }
        float _474 = _444;
        bool _476 = _420 == 32;
        float _478 = _474;
        if (_424)
        {
            _472 = _338;
        }
        float _480 = _472;
        int _482 = _436 ? 64 : 0;
        float _484 = _480;
        if (_424)
        {
            _478 = _342;
        }
        float _486 = _478;
        float _488 = _486;
        if (_428)
        {
            _446 = _204;
        }
        float _490 = _446;
        float _492 = _490;
        if (_430)
        {
            _484 = _338;
        }
        float _494 = _484;
        bool _496 = _420 == 48;
        float _498 = _494;
        if (_430)
        {
            _488 = _344;
        }
        float _500 = _488;
        float _502 = _500;
        if (_428)
        {
            _448 = _208;
        }
        float _504 = _448;
        bool _506 = _432 == 12;
        float _508 = _504;
        if (_428)
        {
            _450 = _206;
        }
        float _510 = _450;
        float _512 = _510;
        if (_434)
        {
            _512 = _232;
        }
        float _514 = _512;
        float _516 = _514;
        if (_436)
        {
            _452 = _129;
        }
        float _518 = _452;
        float _520 = _518;
        if (_434)
        {
            _492 = _230;
        }
        float _522 = _492;
        float _524 = _522;
        if (_434)
        {
            _508 = _234;
        }
        float _526 = _508;
        float _528 = _526;
        if (_440)
        {
            _520 = _147;
        }
        float _530 = _520;
        float _532 = _530;
        if (_470)
        {
            _532 = _165;
        }
        float _534 = _532;
        float _536 = _534;
        if (_506)
        {
            _536 = _183;
        }
        float _538 = _536;
        float _540 = _538;
        if (_476)
        {
            _524 = _256;
        }
        float _542 = _524;
        float _544 = _542;
        if (_476)
        {
            _516 = _258;
        }
        float _546 = _516;
        bool _548 = _538 >= 1.0;
        bool _550 = isnan(_538);
        bool _552 = _548 || _550;
        bool _554 = isnan(1.0);
        bool _556 = _552 || _554;
        float _558 = _546;
        if (_476)
        {
            _528 = _260;
        }
        float _560 = _528;
        float _562 = _560;
        if (_496)
        {
            _558 = _284;
        }
        float _564 = _558;
        float _566 = _564;
        if (_438)
        {
            _502 = _344;
        }
        float _568 = _502;
        float _570 = _568;
        if (_438)
        {
            _498 = _336;
        }
        float _572 = _498;
        float _574 = _572;
        if (_496)
        {
            _544 = _282;
        }
        float _576 = _544;
        float _578 = _576;
        if (_496)
        {
            _562 = _286;
        }
        float _580 = _562;
        float _582 = _580;
        if (_556)
        {
            _540 = _576;
        }
        float _584 = _540;
        float _586 = _584;
        float _588 = _584;
        if (_556)
        {
            _454 = _564;
        }
        float _590 = _454;
        float _592 = _590;
        float _594 = _590;
        if (_556)
        {
            _456 = _580;
        }
        float _596 = _456;
        float _598 = _596;
        float _600 = _596;
        if (!_556)
        {
            bool _602 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
            bool _604 = isnan(0.0);
            bool _606 = _602 || _604;
            bool _608 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
            bool _610 = _606 || _608;
            if (!_610)
            {
                float _612 = _576 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _586 = _612;
            }
            float _614 = _586;
            _588 = _614;
            if (!_610)
            {
                float _616 = _564 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _592 = _616;
            }
            float _618 = _592;
            _594 = _618;
            if (!_610)
            {
                float _620 = _580 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _598 = _620;
            }
            float _622 = _598;
            bool _624 = !_610;
            _600 = _622;
            if (!_624)
            {
                float _626 = _564 * 0.715200006961822509765625;
                float _628 = fma(_576, 0.2125999927520751953125, _626);
                float _630 = fma(_580, 0.072200000286102294921875, _628);
                float _632 = 1.0 / _630;
                float _634 = _632 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _636 = precise::clamp(_634, 0.0, 1.0);
                float _638 = fma(_636, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
                float _640 = _576 * _638;
                float _642 = _564 * _638;
                float _644 = _580 * _638;
                _588 = _640;
                _594 = _642;
                _600 = _644;
                _458 = as_type<int>(_630);
            }
        }
        float _646 = _588;
        float _648 = _594;
        float _650 = _600;
        int _652 = _458;
        float _654 = _650;
        float _656 = _646;
        float _658 = _648;
        int _660 = _652;
        if (!_556)
        {
            float _662 = _572 + (-0.5);
            float _664 = _568 + (-0.5);
            float _666 = fma(_662, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
            float _668 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
            float _670 = _664 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
            bool _672 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
            float _674 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
            float _676 = -_674;
            float _678 = fma(_676, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
            float _680 = _666 * _666;
            bool _682 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
            bool _684 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
            bool _686 = _682 || _684;
            bool _688 = isnan(-1.0999999631167156621813774108887e-06);
            bool _690 = _686 || _688;
            float _692 = _646 * 4.0;
            float _694 = _648 * 4.0;
            float _696 = precise::max(0.0, _678);
            float _698 = fma(_670, _670, _680);
            int _700 = _690 ? 0 : 1;
            float _702 = _650 * 4.0;
            uint _705 = as_type<uint>(half2(float2(_692, _694)));
            float _707 = -_696;
            float _709 = _668 + _707;
            int _711 = ~_700;
            int _713 = _711 + 1;
            int _715 = _713 + 1;
            float _717 = sqrt(_698);
            int _719 = _715;
            _660 = int(_705);
            if (!_672)
            {
                int _721 = ~_700;
                int _723 = _721 + 1;
                _719 = _723;
            }
            int _725 = _719;
            uint _727 = as_type<uint>(half2(float2(_702, 0.0)));
            float _729 = float(_725);
            uint _731 = extract_bits(_727, 0u, 8u);
            int _733 = int(_731) & 255;
            uint _735 = extract_bits(_727, 8u, 8u);
            int _737 = int(_735) & 255;
            int _739 = _737 << 8;
            int _741 = _733 | _739;
            float _743 = 1.0 / _709;
            int _745 = int(_705) & 32767;
            float _747 = float(uint(_741));
            float _749 = float(uint(_745));
            float _751 = -_696;
            float _753 = _717 + _751;
            uint _755 = extract_bits(_705, 16u, 16u);
            float _757 = float(_755);
            float _759 = _753 * _743;
            float _761 = precise::clamp(_759, 0.0, 1.0);
            float _763 = fma(_761, -2.0, 3.0);
            float _765 = _761 * _761;
            float _767 = fma(_765, _763, -0.5);
            float _769 = fma(_767, _729, 0.5);
            float _771 = precise::max(_769, (*spvDescriptorSet0.fp_c4)._m0[5].w);
            float _773 = fma(_757, 6.103515625e-05, -0.3125);
            float _775 = fma(_747, 6.103515625e-05, -0.3125);
            float _777 = fma(_749, 6.103515625e-05, -0.3125);
            bool _779 = _771 > 0.999000012874603271484375;
            float _781 = fma(_773, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _783 = fma(_775, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _785 = fma(_777, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            bool _787 = !_779;
            _578 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
            _566 = _743;
            _582 = _771;
            _570 = _781;
            _574 = _785;
            _460 = _783;
            if (!_787)
            {
                float3 _3231 = float3(_785, _781, _783);
                float3 _791 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3231, float3(0.0), isnan(_3231))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3231, float3(0.0), isnan(_3231))).xyz;
                float _793 = _791.x;
                float _795 = _791.y;
                float _797 = _791.z;
                _654 = _797;
                _656 = _793;
                _658 = _795;
                _799 = true;
            }
            else
            {
                bool _801 = _771 >= 0.001000000047497451305389404296875;
                bool _803 = isnan(_771);
                bool _805 = _801 || _803;
                bool _807 = isnan(0.001000000047497451305389404296875);
                bool _809 = _805 || _807;
                if (!_809)
                {
                    float3 _3268 = float3(_785, _781, _783);
                    float3 _811 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3268, float3(0.0), isnan(_3268))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3268, float3(0.0), isnan(_3268))).xyz;
                    float _813 = _811.x;
                    float _815 = _811.y;
                    float _817 = _811.z;
                    _654 = _817;
                    _656 = _813;
                    _658 = _815;
                    _799 = true;
                }
                else
                {
                    float3 _3287 = float3(_785, _781, _783);
                    float3 _819 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3287, float3(0.0), isnan(_3287))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3287, float3(0.0), isnan(_3287))).xyz;
                    float _821 = _819.x;
                    float _823 = _819.y;
                    float _825 = _819.z;
                    float3 _3302 = float3(_785, _781, _783);
                    float3 _827 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3302, float3(0.0), isnan(_3302))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3302, float3(0.0), isnan(_3302))).xyz;
                    float _829 = _827.x;
                    float _831 = _827.y;
                    float _833 = _827.z;
                    float _835 = -_821;
                    float _837 = _829 + _835;
                    float _839 = -_823;
                    float _841 = _831 + _839;
                    float _843 = -_825;
                    float _845 = _833 + _843;
                    float _847 = fma(_771, _837, _821);
                    float _849 = fma(_771, _841, _823);
                    float _851 = fma(_771, _845, _825);
                    _578 = _837;
                    _566 = _841;
                    _654 = _851;
                    _656 = _847;
                    _658 = _849;
                    _660 = as_type<int>(_845);
                }
            }
        }
        _799 = false;
        float _853 = _578;
        float _855 = _566;
        float _857 = _582;
        float _859 = _654;
        float _861 = _656;
        float _863 = _658;
        float _865 = _570;
        float _867 = _574;
        float _869 = _460;
        int _871 = _660;
        float _873 = _853;
        float _875 = _865;
        float _877 = _867;
        float _879 = _855;
        float _881 = _857;
        int _883 = _871;
        float _885 = _869;
        float _887 = _859;
        float _889 = _863;
        float _891 = _859;
        float _893 = _859;
        float _895 = _859;
        float _897 = _869;
        if (_556)
        {
            _873 = _861;
        }
        float _899 = _873;
        float _901 = _899;
        if (_556)
        {
            _875 = _863;
        }
        float _903 = _875;
        float _905 = _903;
        if (_556)
        {
            _877 = _859;
        }
        float _907 = _877;
        float _909 = _907;
        if (!_556)
        {
            bool _911 = _861 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _913 = isnan(_861);
            bool _915 = _911 || _913;
            bool _917 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _919 = _915 || _917;
            bool _921 = _863 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _923 = isnan(_863);
            bool _925 = _921 || _923;
            bool _927 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _929 = _925 || _927;
            float _931 = fma(_861, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _933 = fma(_863, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _935 = fma(_859, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            bool _937 = _859 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _939 = isnan(_859);
            bool _941 = _937 || _939;
            bool _943 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _945 = _941 || _943;
            float _947 = exp2(_931);
            float _949 = exp2(_933);
            float _951 = exp2(_935);
            float _953 = -_947;
            float _955 = _953 + 1.0;
            bool _957 = !_919;
            float _959 = _957 ? _861 : _955;
            float _961 = -_949;
            float _963 = _961 + 1.0;
            bool _965 = !_929;
            float _967 = _965 ? _863 : _963;
            float _969 = -_951;
            float _971 = _969 + 1.0;
            bool _973 = !_945;
            float _975 = _973 ? _859 : _971;
            _901 = _959;
            _879 = _949;
            _881 = _951;
            _905 = _967;
            _909 = _975;
            _883 = as_type<int>(_963);
        }
        float _977 = _901;
        float _979 = _879;
        float _981 = _881;
        float _983 = _905;
        float _985 = _909;
        int _987 = _883;
        float _989 = _981;
        int _991 = _987;
        float _993 = _979;
        float _995 = _981;
        float _997 = as_type<float>(_987);
        float _999 = _977;
        float _1001 = _983;
        float _1003 = _985;
        float _1005 = _977;
        float _1007 = _979;
        float _1009 = _981;
        int _1011 = _987;
        float _1013 = _983;
        float _1015 = _985;
        if (!_556)
        {
            bool _1017 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
            bool _1019 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
            bool _1021 = _1017 || _1019;
            bool _1023 = isnan(6.0);
            bool _1025 = _1021 || _1023;
            if (!_1025)
            {
                float _1027 = -_977;
                float _1029 = _1027 + 1.0;
                float _1031 = -_983;
                float _1033 = _1031 + 1.0;
                float _1035 = -_985;
                float _1037 = _1035 + 1.0;
                float _1039 = abs(_1029);
                float _1041 = log2(_1039);
                float _1043 = abs(_1033);
                float _1045 = log2(_1043);
                float _1047 = abs(_1037);
                float _1049 = log2(_1047);
                float _1051 = _1041 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1053 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                float _1055 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1057 = exp2(_1051);
                float _1059 = _1049 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1061 = exp2(_1055);
                float _1063 = exp2(_1059);
                float _1065 = fma(_1053, _1057, 1.0);
                float _1067 = fma(_1053, _1061, 1.0);
                float _1069 = 1.0 / _1065;
                float _1071 = fma(_1053, _1063, 1.0);
                float _1073 = 1.0 / _1067;
                float _1075 = 1.0 / _1071;
                float _1077 = _1069 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1079 = _1073 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1081 = precise::max(_1077, _1079);
                float _1083 = _1075 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1085 = precise::max(_1083, _1081);
                float _1087 = -_1077;
                float _1089 = _1087 + _1085;
                float _1091 = -_1079;
                float _1093 = _1091 + _1085;
                float _1095 = -_1083;
                float _1097 = _1095 + _1085;
                float _1099 = fma(_1089, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1077);
                float _1101 = fma(_1093, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1079);
                float _1103 = fma(_1097, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1083);
                float _1105 = _1099 * _977;
                float _1107 = _1101 * _983;
                float _1109 = _1103 * _985;
                _1111 = _1105;
                _1113 = _1107;
                _893 = _1069;
                _1115 = _1103;
                _1117 = _1109;
                _1119 = _1105;
                _1121 = _1107;
                _1123 = _1109;
                _1125 = true;
            }
            else
            {
                bool _1127 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
                if (!_1127)
                {
                    _885 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
                }
                float _1129 = _885;
                bool _1131 = !_1127;
                float _1133 = _1129;
                _1115 = _1129;
                if (!_1131)
                {
                    float _1135 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
                    float _1137 = _91 + _1135;
                    float _1139 = abs(_1137);
                    float _1141 = _1139 * 2560.0;
                    bool _1143 = _1141 >= 2.0;
                    bool _1145 = isnan(_1141);
                    bool _1147 = _1143 || _1145;
                    bool _1149 = isnan(2.0);
                    bool _1151 = _1147 || _1149;
                    float _1153 = _1141;
                    if (!_1151)
                    {
                        _1153 = 0.0;
                        _989 = 0.0;
                    }
                    float _1155 = _1153;
                    float _1157 = _989;
                    float _1159 = _1155;
                    float _1161 = _1157;
                    _1111 = _1155;
                    _1113 = _1157;
                    _1119 = _1155;
                    _1121 = _1157;
                    if (!_1151)
                    {
                        _991 = 0;
                    }
                    int _1163 = _991;
                    bool _1165 = !_1151;
                    float _1167 = as_type<float>(_1163);
                    _1117 = as_type<float>(_1163);
                    _1123 = as_type<float>(_1163);
                    _1125 = _1165;
                    if (!_1125)
                    {
                        bool _1169 = _91 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                        if (_1169)
                        {
                            _1159 = _977;
                        }
                        float _1171 = _1159;
                        _993 = _1171;
                        _1111 = _1171;
                        _1119 = _1171;
                        if (_1169)
                        {
                            _1161 = _983;
                        }
                        float _1173 = _1161;
                        _995 = _1173;
                        _1113 = _1173;
                        _1121 = _1173;
                        if (_1169)
                        {
                            _1167 = _985;
                        }
                        int _1175 = as_type<int>(_1167);
                        _997 = as_type<float>(_1175);
                        _1117 = as_type<float>(_1175);
                        _1123 = as_type<float>(_1175);
                        _1125 = _1169;
                        if (!_1125)
                        {
                            float _1177 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                            _1133 = _1177;
                        }
                    }
                }
                if (!_1125)
                {
                    float _1179 = _993;
                    float _1181 = _995;
                    float _1183 = _1133;
                    int _1185 = as_type<int>(_997);
                    bool _1187 = _1183 != 0.0;
                    bool _1189 = isnan(_1183);
                    bool _1191 = _1187 || _1189;
                    bool _1193 = isnan(0.0);
                    bool _1195 = _1191 || _1193;
                    float _1197 = _1183;
                    float _1199 = _1183;
                    float _1201 = _1179;
                    float _1203 = _1181;
                    int _1205 = _1185;
                    _1115 = _1183;
                    if (!_1195)
                    {
                        float _1207 = _863 * 0.586600005626678466796875;
                        float _1209 = fma(_861, 0.29890000820159912109375, _1207);
                        float _1211 = fma(_859, 0.1143999993801116943359375, _1209);
                        float _1213 = _1211 * (-1.44269502162933349609375);
                        float _1215 = exp2(_1213);
                        float _1217 = -_1215;
                        float _1219 = _1217 + 1.0;
                        bool _1221 = _1219 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _1223 = isnan(_1219);
                        bool _1225 = _1221 || _1223;
                        bool _1227 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _1229 = _1225 || _1227;
                        float _1231 = _1211;
                        if (!_1229)
                        {
                            _1231 = _1219;
                        }
                        float _1233 = _1231;
                        bool _1235 = !_1229;
                        float _1237 = _1233;
                        if (!_1235)
                        {
                            float _1239 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1241 = _1219 + _1239;
                            float _1243 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1245 = spvFAdd(_1243, 1.00000095367431640625);
                            float _1247 = 1.0 / _1245;
                            float _1249 = _1241 * _1247;
                            float _1251 = -_1249;
                            float _1253 = _1251 + 1.0;
                            float _1255 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1257 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1255;
                            float _1259 = abs(_1253);
                            float _1261 = log2(_1259);
                            float _1263 = _1257 * _1247;
                            float _1265 = _1263 + (-1.0);
                            float _1267 = _1263 * _1249;
                            float _1269 = _1261 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1271 = exp2(_1269);
                            float _1273 = fma(_1265, _1271, 1.0);
                            float _1275 = 1.0 / _1273;
                            float _1277 = _1267 * _1275;
                            float _1279 = fma(_1245, _1277, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _1237 = _1279;
                        }
                        float _1281 = _1237;
                        float _1283 = -_1219;
                        float _1285 = _1283 + _1281;
                        float _1287 = _983 * 0.586600005626678466796875;
                        float _1289 = _1285 + 1.0;
                        float _1291 = fma(_977, 0.29890000820159912109375, _1287);
                        float _1293 = fma(_985, 0.1143999993801116943359375, _1291);
                        float _1295 = abs(_1289);
                        float _1297 = log2(_1295);
                        float _1299 = spvFAdd(_1293, 9.9999999747524270787835121154785e-07);
                        float _1301 = 1.0 / _1299;
                        float _1303 = _1297 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                        float _1305 = exp2(_1303);
                        float _1307 = fma(_1301, _977, -1.0);
                        float _1309 = fma(_1301, _983, -1.0);
                        float _1311 = fma(_1301, _985, -1.0);
                        float _1313 = fma(_1305, _1307, 1.0);
                        float _1315 = fma(_1305, _1309, 1.0);
                        float _1317 = fma(_1305, _1311, 1.0);
                        float _1319 = _1313 * _1281;
                        float _1321 = _1315 * _1281;
                        float _1323 = _1317 * _1281;
                        float _1325 = precise::max(0.0, _1319);
                        float _1327 = precise::max(0.0, _1321);
                        float _1329 = precise::max(0.0, _1323);
                        float _1331 = precise::min(_1325, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1333 = precise::min(_1327, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1335 = precise::min(_1329, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _1111 = _1331;
                        _1113 = _1333;
                        _893 = _1305;
                        _1117 = _1335;
                        _1119 = _1331;
                        _1121 = _1333;
                        _1123 = _1335;
                        _1125 = true;
                    }
                    else
                    {
                        bool _1337 = _1183 != 1.0;
                        bool _1339 = isnan(_1183);
                        bool _1341 = _1337 || _1339;
                        bool _1343 = isnan(1.0);
                        bool _1345 = _1341 || _1343;
                        if (!_1345)
                        {
                            bool _1347 = _977 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1349 = isnan(_977);
                            bool _1351 = _1347 || _1349;
                            bool _1353 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1355 = _1351 || _1353;
                            float _1357 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1359 = spvFAdd(_1357, 1.00000095367431640625);
                            bool _1361 = _983 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1363 = isnan(_983);
                            bool _1365 = _1361 || _1363;
                            bool _1367 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1369 = _1365 || _1367;
                            bool _1371 = _985 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1373 = isnan(_985);
                            bool _1375 = _1371 || _1373;
                            bool _1377 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1379 = _1375 || _1377;
                            float _1381 = 1.0 / _1359;
                            float _1383 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1385 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1383;
                            float _1387 = _1385 * _1381;
                            bool _1389 = !_1355;
                            float _1391 = _1387;
                            if (!_1389)
                            {
                                float _1393 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1395 = _977 + _1393;
                                float _1397 = _1387 + (-1.0);
                                float _1399 = _1395 * _1381;
                                float _1401 = -_1399;
                                float _1403 = _1401 + 1.0;
                                float _1405 = _1387 * _1399;
                                float _1407 = abs(_1403);
                                float _1409 = log2(_1407);
                                float _1411 = _1409 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1413 = exp2(_1411);
                                float _1415 = fma(_1397, _1413, 1.0);
                                float _1417 = 1.0 / _1415;
                                float _1419 = _1405 * _1417;
                                float _1421 = fma(_1359, _1419, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _999 = _1421;
                            }
                            float _1423 = _999;
                            bool _1425 = !_1369;
                            if (!_1425)
                            {
                                float _1427 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1429 = _983 + _1427;
                                float _1431 = _1387 + (-1.0);
                                float _1433 = _1429 * _1381;
                                float _1435 = -_1433;
                                float _1437 = _1435 + 1.0;
                                float _1439 = _1387 * _1433;
                                float _1441 = abs(_1437);
                                float _1443 = log2(_1441);
                                float _1445 = _1443 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1447 = exp2(_1445);
                                float _1449 = fma(_1431, _1447, 1.0);
                                float _1451 = 1.0 / _1449;
                                float _1453 = _1439 * _1451;
                                float _1455 = fma(_1359, _1453, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1001 = _1455;
                            }
                            float _1457 = _1001;
                            bool _1459 = !_1379;
                            if (!_1459)
                            {
                                float _1461 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1463 = _985 + _1461;
                                float _1465 = _1387 + (-1.0);
                                float _1467 = _1463 * _1381;
                                float _1469 = -_1467;
                                float _1471 = _1469 + 1.0;
                                float _1473 = _1387 * _1467;
                                float _1475 = abs(_1471);
                                float _1477 = log2(_1475);
                                float _1479 = _1477 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1481 = exp2(_1479);
                                float _1483 = fma(_1465, _1481, 1.0);
                                float _1485 = 1.0 / _1483;
                                float _1487 = _1473 * _1485;
                                float _1489 = fma(_1359, _1487, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1391 = _1487;
                                _1003 = _1489;
                            }
                            float _1491 = _1391;
                            float _1493 = _1003;
                            float _1495 = precise::max(0.0, _1493);
                            float _1497 = precise::max(0.0, _1423);
                            float _1499 = precise::max(0.0, _1457);
                            float _1501 = precise::min(_1495, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1503 = precise::min(_1497, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1505 = precise::min(_1499, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            _1111 = _1503;
                            _1113 = _1505;
                            _893 = _1491;
                            _1117 = _1501;
                            _1119 = _1503;
                            _1121 = _1505;
                            _1123 = _1501;
                            _1125 = true;
                        }
                        else
                        {
                            bool _1507 = _1183 != 2.0;
                            bool _1509 = isnan(_1183);
                            bool _1511 = _1507 || _1509;
                            bool _1513 = isnan(2.0);
                            bool _1515 = _1511 || _1513;
                            if (!_1515)
                            {
                                float _1517 = _983 * 0.715200006961822509765625;
                                float _1519 = fma(_977, 0.2125999927520751953125, _1517);
                                float _1521 = fma(_985, 0.072200000286102294921875, _1519);
                                float _1523 = spvFAdd(_1521, 9.9999999747524270787835121154785e-07);
                                bool _1525 = _1521 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1527 = isnan(_1521);
                                bool _1529 = _1525 || _1527;
                                bool _1531 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1533 = _1529 || _1531;
                                float _1535 = 1.0 / _1523;
                                bool _1537 = !_1533;
                                float _1539 = _1521;
                                if (!_1537)
                                {
                                    float _1541 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1543 = _1521 + _1541;
                                    float _1545 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1547 = spvFAdd(_1545, 1.00000095367431640625);
                                    float _1549 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1551 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1549;
                                    float _1553 = 1.0 / _1547;
                                    float _1555 = _1543 * _1553;
                                    float _1557 = _1551 * _1553;
                                    float _1559 = -_1555;
                                    float _1561 = _1559 + 1.0;
                                    float _1563 = _1557 + (-1.0);
                                    float _1565 = _1557 * _1555;
                                    float _1567 = abs(_1561);
                                    float _1569 = log2(_1567);
                                    float _1571 = _1569 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1573 = exp2(_1571);
                                    float _1575 = fma(_1563, _1573, 1.0);
                                    float _1577 = 1.0 / _1575;
                                    float _1579 = _1565 * _1577;
                                    float _1581 = fma(_1547, _1579, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    _887 = _1569;
                                    _1539 = _1581;
                                }
                                float _1583 = _887;
                                float _1585 = _1539;
                                float _1587 = precise::max(0.0, _1585);
                                float _1589 = precise::min(_1587, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1591 = _1535 * _1589;
                                float _1593 = _977 * _1591;
                                float _1595 = _983 * _1591;
                                float _1597 = _985 * _1591;
                                float _1599 = precise::max(0.0, _1593);
                                float _1601 = precise::max(0.0, _1595);
                                float _1603 = precise::max(0.0, _1597);
                                float _1605 = precise::min(_1599, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1607 = precise::min(_1601, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1609 = precise::min(_1603, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                _1111 = _1605;
                                _1113 = _1607;
                                _893 = _1583;
                                _1117 = _1609;
                                _1119 = _1605;
                                _1121 = _1607;
                                _1123 = _1609;
                                _1125 = true;
                            }
                            else
                            {
                                bool _1611 = _1183 != 3.0;
                                bool _1613 = isnan(_1183);
                                bool _1615 = _1611 || _1613;
                                bool _1617 = isnan(3.0);
                                bool _1619 = _1615 || _1617;
                                if (!_1619)
                                {
                                    float _1621 = -_977;
                                    float _1623 = _1621 + 1.0;
                                    float _1625 = -_983;
                                    float _1627 = _1625 + 1.0;
                                    float _1629 = -_985;
                                    float _1631 = _1629 + 1.0;
                                    float _1633 = abs(_1623);
                                    float _1635 = log2(_1633);
                                    float _1637 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1639 = abs(_1627);
                                    float _1641 = log2(_1639);
                                    float _1643 = abs(_1631);
                                    float _1645 = log2(_1643);
                                    float _1647 = _1635 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1649 = _1641 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1651 = exp2(_1647);
                                    float _1653 = _1645 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1655 = exp2(_1649);
                                    float _1657 = exp2(_1653);
                                    float _1659 = fma(_1637, _1651, 1.0);
                                    float _1661 = fma(_1637, _1655, 1.0);
                                    float _1663 = 1.0 / _1659;
                                    float _1665 = fma(_1637, _1657, 1.0);
                                    float _1667 = 1.0 / _1661;
                                    float _1669 = 1.0 / _1665;
                                    float _1671 = _1663 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1673 = _1663 + _1667;
                                    float _1675 = _1667 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1677 = precise::max(_1671, _1675);
                                    float _1679 = _1669 + _1673;
                                    float _1681 = _1669 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1683 = _1679 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1685 = precise::max(_1681, _1677);
                                    float _1687 = _1683 * 0.3333333432674407958984375;
                                    float _1689 = -_1687;
                                    float _1691 = _1685 + _1689;
                                    float _1693 = fma(_1691, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1687);
                                    float _1695 = -_1671;
                                    float _1697 = _1695 + _1693;
                                    float _1699 = -_1675;
                                    float _1701 = _1699 + _1693;
                                    float _1703 = -_1681;
                                    float _1705 = _1703 + _1693;
                                    float _1707 = fma(_1697, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1671);
                                    float _1709 = fma(_1701, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1675);
                                    float _1711 = fma(_1705, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1681);
                                    float _1713 = _1707 * _977;
                                    float _1715 = _1709 * _983;
                                    float _1717 = _1711 * _985;
                                    _1111 = _1713;
                                    _1113 = _1715;
                                    _893 = _1701;
                                    _1117 = _1717;
                                    _1119 = _1713;
                                    _1121 = _1715;
                                    _1123 = _1717;
                                    _1125 = true;
                                }
                                else
                                {
                                    bool _1719 = _1183 != 4.0;
                                    bool _1721 = isnan(_1183);
                                    bool _1723 = _1719 || _1721;
                                    bool _1725 = isnan(4.0);
                                    bool _1727 = _1723 || _1725;
                                    if (!_1727)
                                    {
                                        bool _1729 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        bool _1731 = isnan(0.0);
                                        bool _1733 = _1729 || _1731;
                                        bool _1735 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        bool _1737 = _1733 || _1735;
                                        if (!_1737)
                                        {
                                            float _1739 = -_977;
                                            float _1741 = _1739 + 1.0;
                                            float _1743 = abs(_1741);
                                            float _1745 = log2(_1743);
                                            float _1747 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1749 = _1745 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1751 = exp2(_1749);
                                            float _1753 = fma(_1747, _1751, 1.0);
                                            float _1755 = 1.0 / _1753;
                                            float _1757 = _1755 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1759 = _1751;
                                            _1761 = _1757;
                                            _1763 = true;
                                        }
                                        else
                                        {
                                            float _1765 = spvFAdd(_977, 9.9999999747524270787835121154785e-07);
                                            bool _1767 = _977 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1769 = isnan(_977);
                                            bool _1771 = _1767 || _1769;
                                            bool _1773 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1775 = _1771 || _1773;
                                            float _1777 = 1.0 / _1765;
                                            if (!_1775)
                                            {
                                                _889 = _977;
                                            }
                                            float _1779 = _889;
                                            bool _1781 = !_1775;
                                            float _1783 = _1779;
                                            if (!_1781)
                                            {
                                                float _1785 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1787 = _977 + _1785;
                                                float _1789 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1791 = spvFAdd(_1789, 1.00000095367431640625);
                                                float _1793 = 1.0 / _1791;
                                                float _1795 = _1787 * _1793;
                                                float _1797 = -_1795;
                                                float _1799 = _1797 + 1.0;
                                                float _1801 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1803 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1801;
                                                float _1805 = abs(_1799);
                                                float _1807 = log2(_1805);
                                                float _1809 = _1803 * _1793;
                                                float _1811 = _1809 + (-1.0);
                                                float _1813 = _1809 * _1795;
                                                float _1815 = _1807 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1817 = exp2(_1815);
                                                float _1819 = fma(_1811, _1817, 1.0);
                                                float _1821 = 1.0 / _1819;
                                                float _1823 = _1813 * _1821;
                                                float _1825 = fma(_1791, _1823, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1783 = _1825;
                                                _891 = _1813;
                                            }
                                            float _1827 = _1783;
                                            float _1829 = _891;
                                            float _1831 = precise::max(0.0, _1827);
                                            float _1833 = precise::min(_1831, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1835 = _1833 * _1777;
                                            _1759 = _1829;
                                            _1761 = _1835;
                                        }
                                        _1763 = false;
                                        float _1837 = _1759;
                                        float _1839 = _1761;
                                        float _1841 = _1837;
                                        if (!_1737)
                                        {
                                            float _1843 = -_983;
                                            float _1845 = _1843 + 1.0;
                                            float _1847 = abs(_1845);
                                            float _1849 = log2(_1847);
                                            float _1851 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1853 = _1849 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1855 = exp2(_1853);
                                            float _1857 = fma(_1851, _1855, 1.0);
                                            float _1859 = 1.0 / _1857;
                                            float _1861 = _1859 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1863 = _1855;
                                            _1865 = _1861;
                                            _1867 = true;
                                        }
                                        else
                                        {
                                            float _1869 = spvFAdd(_983, 9.9999999747524270787835121154785e-07);
                                            bool _1871 = _983 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1873 = isnan(_983);
                                            bool _1875 = _1871 || _1873;
                                            bool _1877 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1879 = _1875 || _1877;
                                            float _1881 = 1.0 / _1869;
                                            if (!_1879)
                                            {
                                                _1841 = _983;
                                            }
                                            float _1883 = _1841;
                                            bool _1885 = !_1879;
                                            float _1887 = _1883;
                                            if (!_1885)
                                            {
                                                float _1889 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1891 = _983 + _1889;
                                                float _1893 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1895 = spvFAdd(_1893, 1.00000095367431640625);
                                                float _1897 = 1.0 / _1895;
                                                float _1899 = _1891 * _1897;
                                                float _1901 = -_1899;
                                                float _1903 = _1901 + 1.0;
                                                float _1905 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1907 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1905;
                                                float _1909 = abs(_1903);
                                                float _1911 = log2(_1909);
                                                float _1913 = _1907 * _1897;
                                                float _1915 = _1913 + (-1.0);
                                                float _1917 = _1913 * _1899;
                                                float _1919 = _1911 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1921 = exp2(_1919);
                                                float _1923 = fma(_1915, _1921, 1.0);
                                                float _1925 = 1.0 / _1923;
                                                float _1927 = _1917 * _1925;
                                                float _1929 = fma(_1895, _1927, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1887 = _1929;
                                            }
                                            float _1931 = _1887;
                                            float _1933 = precise::max(0.0, _1931);
                                            float _1935 = precise::min(_1933, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1937 = _1935 * _1881;
                                            _1863 = _1935;
                                            _1865 = _1937;
                                        }
                                        _1867 = false;
                                        float _1939 = _1863;
                                        float _1941 = _1865;
                                        float _1943 = _1939;
                                        if (!_1737)
                                        {
                                            float _1945 = -_985;
                                            float _1947 = _1945 + 1.0;
                                            float _1949 = abs(_1947);
                                            float _1951 = log2(_1949);
                                            float _1953 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1955 = _1951 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1957 = exp2(_1955);
                                            float _1959 = fma(_1953, _1957, 1.0);
                                            float _1961 = 1.0 / _1959;
                                            float _1963 = _1961 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1965 = _1963;
                                            _1967 = true;
                                        }
                                        else
                                        {
                                            float _1969 = spvFAdd(_985, 9.9999999747524270787835121154785e-07);
                                            bool _1971 = _985 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1973 = isnan(_985);
                                            bool _1975 = _1971 || _1973;
                                            bool _1977 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1979 = _1975 || _1977;
                                            float _1981 = 1.0 / _1969;
                                            if (!_1979)
                                            {
                                                _1943 = _985;
                                            }
                                            float _1983 = _1943;
                                            bool _1985 = !_1979;
                                            float _1987 = _1983;
                                            if (!_1985)
                                            {
                                                float _1989 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1991 = _985 + _1989;
                                                float _1993 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1995 = spvFAdd(_1993, 1.00000095367431640625);
                                                float _1997 = 1.0 / _1995;
                                                float _1999 = _1991 * _1997;
                                                float _2001 = -_1999;
                                                float _2003 = _2001 + 1.0;
                                                float _2005 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _2007 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _2005;
                                                float _2009 = abs(_2003);
                                                float _2011 = log2(_2009);
                                                float _2013 = _2007 * _1997;
                                                float _2015 = _2013 + (-1.0);
                                                float _2017 = _2013 * _1999;
                                                float _2019 = _2011 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2021 = exp2(_2019);
                                                float _2023 = fma(_2015, _2021, 1.0);
                                                float _2025 = 1.0 / _2023;
                                                float _2027 = _2017 * _2025;
                                                float _2029 = fma(_1995, _2027, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1197 = _2021;
                                                _1987 = _2029;
                                            }
                                            float _2031 = _1197;
                                            float _2033 = _1987;
                                            float _2035 = precise::max(0.0, _2033);
                                            float _2037 = precise::min(_2035, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _2039 = _2037 * _1981;
                                            _1199 = _2031;
                                            _1965 = _2039;
                                        }
                                        _1967 = false;
                                        float _2041 = _1199;
                                        float _2043 = _1965;
                                        float _2045 = precise::max(_1839, _1941);
                                        float _2047 = precise::max(_2045, _2043);
                                        float _2049 = -_1839;
                                        float _2051 = _2047 + _2049;
                                        float _2053 = -_1941;
                                        float _2055 = _2047 + _2053;
                                        float _2057 = -_2043;
                                        float _2059 = _2047 + _2057;
                                        float _2061 = fma(_2051, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1839);
                                        float _2063 = fma(_2055, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1941);
                                        float _2065 = fma(_2059, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2043);
                                        float _2067 = _2061 * _977;
                                        float _2069 = _2063 * _983;
                                        float _2071 = _2065 * _985;
                                        _1111 = _2067;
                                        _1113 = _2069;
                                        _893 = _2065;
                                        _1115 = _2041;
                                        _1117 = _2071;
                                        _1119 = _2067;
                                        _1121 = _2069;
                                        _1123 = _2071;
                                        _1125 = true;
                                    }
                                    else
                                    {
                                        bool _2073 = _1183 != 5.0;
                                        bool _2075 = isnan(_1183);
                                        bool _2077 = _2073 || _2075;
                                        bool _2079 = isnan(5.0);
                                        bool _2081 = _2077 || _2079;
                                        if (!_2081)
                                        {
                                            _1201 = _861;
                                        }
                                        float _2083 = _1201;
                                        float _2085 = _2083;
                                        _1111 = _2083;
                                        _1119 = _2083;
                                        if (!_2081)
                                        {
                                            _1203 = _863;
                                        }
                                        float _2087 = _1203;
                                        float _2089 = _2087;
                                        _1113 = _2087;
                                        _1121 = _2087;
                                        if (!_2081)
                                        {
                                            _1205 = as_type<int>(_859);
                                        }
                                        int _2091 = _1205;
                                        bool _2093 = !_2081;
                                        float _2095 = as_type<float>(_2091);
                                        _1117 = as_type<float>(_2091);
                                        _1123 = as_type<float>(_2091);
                                        if (!_2093)
                                        {
                                            bool _2097 = _1183 != 6.0;
                                            bool _2099 = isnan(_1183);
                                            bool _2101 = _2097 || _2099;
                                            bool _2103 = isnan(6.0);
                                            bool _2105 = _2101 || _2103;
                                            if (!_2105)
                                            {
                                                float _2107 = -_977;
                                                float _2109 = _2107 + 1.0;
                                                float _2111 = -_983;
                                                float _2113 = _2111 + 1.0;
                                                float _2115 = -_985;
                                                float _2117 = _2115 + 1.0;
                                                float _2119 = abs(_2109);
                                                float _2121 = log2(_2119);
                                                float _2123 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                float _2125 = abs(_2113);
                                                float _2127 = log2(_2125);
                                                float _2129 = abs(_2117);
                                                float _2131 = log2(_2129);
                                                float _2133 = _2121 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2135 = _2127 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2137 = exp2(_2133);
                                                float _2139 = _2131 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2141 = exp2(_2135);
                                                float _2143 = exp2(_2139);
                                                float _2145 = fma(_2123, _2137, 1.0);
                                                float _2147 = fma(_2123, _2141, 1.0);
                                                float _2149 = 1.0 / _2145;
                                                float _2151 = fma(_2123, _2143, 1.0);
                                                float _2153 = 1.0 / _2147;
                                                float _2155 = 1.0 / _2151;
                                                float _2157 = _2149 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2159 = _2153 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2161 = precise::max(_2157, _2159);
                                                float _2163 = _2155 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2165 = precise::max(_2163, _2161);
                                                float _2167 = -_2157;
                                                float _2169 = _2167 + _2165;
                                                float _2171 = -_2159;
                                                float _2173 = _2171 + _2165;
                                                float _2175 = -_2163;
                                                float _2177 = _2175 + _2165;
                                                float _2179 = fma(_2169, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2157);
                                                float _2181 = fma(_2173, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2159);
                                                float _2183 = fma(_2177, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2163);
                                                float _2185 = _2179 * _977;
                                                float _2187 = _2181 * _983;
                                                float _2189 = _2183 * _985;
                                                _1111 = _2185;
                                                _1113 = _2187;
                                                _893 = _2159;
                                                _1115 = _2179;
                                                _1117 = _2189;
                                                _1119 = _2185;
                                                _1121 = _2187;
                                                _1123 = _2189;
                                                _1125 = true;
                                            }
                                            else
                                            {
                                                bool _2191 = _1183 != 7.0;
                                                bool _2193 = isnan(_1183);
                                                bool _2195 = _2191 || _2193;
                                                bool _2197 = isnan(7.0);
                                                bool _2199 = _2195 || _2197;
                                                if (_2199)
                                                {
                                                    _2085 = as_type<float>(_406);
                                                }
                                                float _2201 = _2085;
                                                _1111 = _2201;
                                                _1119 = _2201;
                                                if (_2199)
                                                {
                                                    _2089 = as_type<float>(_400);
                                                }
                                                float _2203 = _2089;
                                                _1113 = _2203;
                                                _1121 = _2203;
                                                if (_2199)
                                                {
                                                    _2095 = _408;
                                                }
                                                int _2205 = as_type<int>(_2095);
                                                _1117 = as_type<float>(_2205);
                                                _1123 = as_type<float>(_2205);
                                                if (!_2199)
                                                {
                                                    float _2207 = -_977;
                                                    float _2209 = _2207 + 1.0;
                                                    float _2211 = -_983;
                                                    float _2213 = _2211 + 1.0;
                                                    float _2215 = -_985;
                                                    float _2217 = _2215 + 1.0;
                                                    float _2219 = abs(_2209);
                                                    float _2221 = log2(_2219);
                                                    float _2223 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                    float _2225 = abs(_2213);
                                                    float _2227 = log2(_2225);
                                                    float _2229 = abs(_2217);
                                                    float _2231 = log2(_2229);
                                                    float _2233 = _2221 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2235 = _2227 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2237 = exp2(_2233);
                                                    float _2239 = _2231 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2241 = exp2(_2235);
                                                    float _2243 = exp2(_2239);
                                                    float _2245 = fma(_2223, _2237, 1.0);
                                                    float _2247 = fma(_2223, _2241, 1.0);
                                                    float _2249 = 1.0 / _2245;
                                                    float _2251 = fma(_2223, _2243, 1.0);
                                                    float _2253 = 1.0 / _2247;
                                                    float _2255 = 1.0 / _2251;
                                                    float _2257 = _2249 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2259 = -_977;
                                                    float _2261 = fma(_2257, _977, _2259);
                                                    float _2263 = _2253 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2265 = -_983;
                                                    float _2267 = fma(_2263, _983, _2265);
                                                    float _2269 = _2255 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2271 = _2261 + _2267;
                                                    float _2273 = -_985;
                                                    float _2275 = fma(_2269, _985, _2273);
                                                    float _2277 = _2275 + _2271;
                                                    float _2279 = -_2261;
                                                    float _2281 = fma(_2277, 0.3333333432674407958984375, _2279);
                                                    float _2283 = -_2267;
                                                    float _2285 = fma(_2277, 0.3333333432674407958984375, _2283);
                                                    float _2287 = -_2275;
                                                    float _2289 = fma(_2277, 0.3333333432674407958984375, _2287);
                                                    float _2291 = fma(_2281, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2261);
                                                    float _2293 = fma(_2285, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2267);
                                                    float _2295 = fma(_2289, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2275);
                                                    float _2297 = _2291 + _977;
                                                    float _2299 = _2293 + _983;
                                                    float _2301 = _2295 + _985;
                                                    _1111 = _2297;
                                                    _1113 = _2299;
                                                    _893 = _2295;
                                                    _1117 = _2301;
                                                    _1119 = _2297;
                                                    _1121 = _2299;
                                                    _1123 = _2301;
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
            _1125 = false;
            float _2303 = _1111;
            float _2305 = _1113;
            float _2307 = _893;
            float _2309 = _1115;
            int _2311 = as_type<int>(_1117);
            float _2313 = _1119;
            float _2315 = _1121;
            float _2317 = _1123;
            float _2319 = _2313 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2321 = _2315 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2323 = _2317 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            _1005 = _2319;
            _1007 = _2303;
            _1009 = _2305;
            _895 = _2307;
            _462 = _2315;
            _897 = _2309;
            _1011 = _2311;
            _464 = _2313;
            _466 = _2317;
            _1013 = _2321;
            _1015 = _2323;
        }
        float _2325 = _1005;
        float _2327 = _1007;
        float _2329 = _1009;
        float _2331 = _895;
        int _2333 = as_type<int>(_462);
        float _2335 = _897;
        int _2337 = _1011;
        int _2339 = as_type<int>(_464);
        float _2341 = _466;
        float _2343 = _1013;
        float _2345 = _1015;
        int _2347 = _496 ? 64 : 0;
        bool _2349 = _482 != 0;
        int _2351 = _382 + 1;
        bool _2353 = _2347 != 0;
        bool _2355 = _2351 >= 4;
        _346 = _2351;
        _350 = _2325;
        _354 = _2329;
        _364 = _2333;
        _366 = _2335;
        _368 = _2337;
        _370 = _2339;
        _372 = _2341;
        float _2357 = _2331;
        float _2359 = _2327;
        if (_428)
        {
            _2357 = _210;
        }
        float _2361 = _2357;
        float _2363 = _2361;
        if (_2349)
        {
            _2359 = _330;
        }
        float _2365 = _2359;
        float _2367 = _2365;
        if (_440)
        {
            _2367 = _334;
        }
        float _2369 = _2367;
        float _2371 = _2369;
        if (_470)
        {
            _2371 = _340;
        }
        float _2373 = _2371;
        float _2375 = _2373;
        if (_506)
        {
            _2375 = _332;
        }
        float _2377 = _2375;
        _352 = _2377;
        if (_434)
        {
            _2363 = _236;
        }
        float _2379 = _2363;
        _2381 = fma(_2343, _2377, _410);
        _360 = _2381;
        float _2383 = _2379;
        if (_476)
        {
            _2383 = _262;
        }
        float _2385 = _2383;
        _2387 = fma(_2325, _2377, _412);
        _348 = _2387;
        float _2389 = _2385;
        float _2391 = _2385;
        if (_2353)
        {
            _2389 = _288;
            _2391 = _288;
        }
        float _2393 = _2389;
        float _2395 = _2391;
        _2397 = fma(_2345, _2377, _414);
        _2399 = fma(_2377, _2395, _416);
        _356 = _2397;
        _358 = _2399;
        _362 = _2393;
        _374 = _2381;
        _376 = _2387;
        _378 = _2397;
        _380 = _2399;
        if (_2355)
        {
            _2401 = true;
            if (_2401)
            {
                break;
            }
        }
    } while (true);
    _2401 = false;
    out.m_45.x = _2387;
    out.m_45.y = _2381;
    out.m_45.z = _2397;
    out.m_45.w = _2399;
    return out;
}

