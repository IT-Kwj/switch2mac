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
int _51(thread const int& _5563, thread const int& _5564, constant _10& support_buffer)
{
    int _5567 = 1 + _5564;
    float _5569 = support_buffer._m5[_5567].x;
    float _5571 = abs(_5569);
    bool _5573 = _5571 == 1.0;
    if (_5573)
    {
        return _5563;
    }
    float _5575 = float(_5563);
    float _5577 = _5575 / _5571;
    int _5579 = int(_5577);
    return _5579;
}

static inline __attribute__((always_inline))
int _53(thread const int& _5601, thread const int& _5602, thread const int& _5603, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _5606 = 1 + _5602;
    float _5608 = support_buffer._m5[_5606].x;
    bool _5610 = _5608 == 1.0;
    if (_5610)
    {
        return _5601;
    }
    bool _5612 = _5608 < 0.0;
    if (_5612)
    {
        float _5614 = -_5608;
        float _5616 = float(_5601);
        float _5618 = _5616 * _5614;
        float _5620 = gl_FragCoord.x;
        float _5622 = gl_FragCoord.y;
        float _5624 = (_5603 != 0) ? _5622 : _5620;
        float _5626 = mod(_5624, _5614);
        float _5628 = _5618 + _5626;
        int _5630 = int(_5628);
        return _5630;
    }
    float _5632 = float(_5601);
    float _5634 = _5632 * _5608;
    int _5636 = int(_5634);
    return _5636;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _2413 = false;
    bool _1077 = false;
    bool _1969 = false;
    bool _1851 = false;
    bool _1733 = false;
    bool _705 = false;
    int _56 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _58 = _56;
    int _60 = 0;
    int _62 = _51(_58, _60, (*spvDescriptorSet0.support_buffer));
    int _64 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _66 = _64;
    int _68 = 0;
    int _70 = _51(_66, _68, (*spvDescriptorSet0.support_buffer));
    float _73 = gl_FragCoord.w;
    float _75 = in.m_42.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_42.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _73;
    float _89 = _87 * _79;
    float _91 = _87 * _85;
    float _93 = float(_70);
    float _95 = float(_62);
    float _97 = fma(_91, _93, -0.4999000132083892822265625);
    float _99 = fma(_89, _95, -0.4999000132083892822265625);
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
    float _292 = floor(_97);
    float _294 = -_290;
    float _296 = _99 + _294;
    float _298 = -_292;
    float _300 = _97 + _298;
    float _302 = -_296;
    float _304 = _302 + 1.0;
    float _306 = -_300;
    float _308 = _306 + 1.0;
    float _310 = _296 * _300;
    float _312 = _300 * _304;
    float _314 = _304 * _308;
    float _316 = _296 * _308;
    int _318 = 0;
    float _320 = _304;
    float _322 = _97;
    float _324 = _296;
    float _326 = _99;
    float _328 = as_type<float>(_107);
    float _330 = as_type<float>(_103);
    float _332 = 0.0;
    float _334 = 0.0;
    float _336 = 0.0;
    float _338 = 0.0;
    float _340 = 0.0;
    int _342 = 0;
    int _344 = 0;
    int _346 = 0;
    float _348 = 0.0;
    float _350 = 0.0;
    float _352 = 0.0;
    float _354 = 0.0;
    float _1069;
    float _1071;
    float _1073;
    float _1075;
    float _1727;
    float _1729;
    float _1731;
    float _1847;
    float _1849;
    float _1967;
    float _2393;
    float _2399;
    float _2409;
    float _2411;
    do
    {
        int _356 = _318;
        float _358 = _320;
        float _360 = _322;
        float _362 = _324;
        float _364 = _326;
        float _366 = _328;
        float _368 = _330;
        float _370 = _332;
        float _372 = _334;
        float _374 = _336;
        float _376 = _338;
        float _378 = _340;
        int _380 = _342;
        int _382 = _344;
        int _384 = _346;
        float _386 = _348;
        float _388 = _350;
        float _390 = _352;
        float _392 = _354;
        int _394 = _356 << 4;
        int _396 = _356 << 2;
        bool _400 = _394 == 0;
        bool _402 = _394 == 16;
        bool _404 = _396 == 0;
        bool _406 = _396 == 4;
        int _408 = _404 ? 8 : 0;
        bool _410 = _396 == 12;
        bool _412 = _396 == 8;
        bool _414 = _394 == 32;
        bool _416 = _394 == 48;
        float _418 = _360;
        float _420 = _362;
        float _422 = _358;
        float _424 = _364;
        float _426 = _366;
        float _428 = _368;
        float _430 = _370;
        float _432 = _374;
        float _434 = _378;
        float _436 = _372;
        float _438 = _376;
        float _440 = _378;
        float _442 = as_type<float>(_382);
        float _444 = as_type<float>(_380);
        float _446 = as_type<float>(_382);
        float _448 = as_type<float>(_384);
        if (_400)
        {
            _418 = _204;
        }
        float _450 = _418;
        float _452 = _450;
        if (_402)
        {
            _452 = _230;
        }
        float _454 = _452;
        float _456 = _454;
        if (_400)
        {
            _420 = _206;
        }
        float _458 = _420;
        float _460 = _458;
        if (_404)
        {
            _422 = _129;
        }
        float _462 = _422;
        float _464 = _462;
        if (_406)
        {
            _464 = _147;
        }
        float _466 = _464;
        float _468 = _466;
        if (_412)
        {
            _468 = _165;
        }
        float _470 = _468;
        float _472 = _470;
        if (_400)
        {
            _424 = _208;
        }
        float _474 = _424;
        float _476 = _474;
        if (_402)
        {
            _460 = _232;
        }
        float _478 = _460;
        float _480 = _478;
        if (_410)
        {
            _472 = _183;
        }
        float _482 = _472;
        float _484 = _482;
        if (_402)
        {
            _476 = _234;
        }
        float _486 = _476;
        bool _488 = _482 >= 1.0;
        bool _490 = isnan(_482);
        bool _492 = _488 || _490;
        bool _494 = isnan(1.0);
        bool _496 = _492 || _494;
        float _498 = _486;
        if (_414)
        {
            _456 = _256;
        }
        float _500 = _456;
        float _502 = _500;
        if (_414)
        {
            _480 = _258;
        }
        float _504 = _480;
        float _506 = _504;
        if (_414)
        {
            _498 = _260;
        }
        float _508 = _498;
        float _510 = _508;
        if (_416)
        {
            _502 = _282;
        }
        float _512 = _502;
        float _514 = _512;
        if (_416)
        {
            _506 = _284;
        }
        float _516 = _506;
        float _518 = _516;
        if (_416)
        {
            _510 = _286;
        }
        float _520 = _510;
        float _522 = _520;
        if (_496)
        {
            _426 = _512;
        }
        float _524 = _426;
        float _526 = _524;
        float _528 = _524;
        if (_496)
        {
            _428 = _516;
        }
        float _530 = _428;
        float _532 = _530;
        float _534 = _530;
        if (_496)
        {
            _430 = _520;
        }
        float _536 = _430;
        float _538 = _536;
        float _540 = _536;
        if (!_496)
        {
            bool _542 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
            bool _544 = isnan(0.0);
            bool _546 = _542 || _544;
            bool _548 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
            bool _550 = _546 || _548;
            if (!_550)
            {
                float _552 = _512 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _526 = _552;
            }
            float _554 = _526;
            _528 = _554;
            if (!_550)
            {
                float _556 = _516 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _532 = _556;
            }
            float _558 = _532;
            _534 = _558;
            if (!_550)
            {
                float _560 = _520 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _538 = _560;
            }
            float _562 = _538;
            bool _564 = !_550;
            _540 = _562;
            if (!_564)
            {
                float _566 = _516 * 0.715200006961822509765625;
                float _568 = fma(_512, 0.2125999927520751953125, _566);
                float _570 = fma(_520, 0.072200000286102294921875, _568);
                float _572 = 1.0 / _570;
                float _574 = _572 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _576 = precise::clamp(_574, 0.0, 1.0);
                float _578 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
                float _580 = _512 * _578;
                float _582 = _516 * _578;
                float _584 = _520 * _578;
                _528 = _580;
                _534 = _582;
                _540 = _584;
                _432 = _578;
                _484 = _572;
            }
        }
        float _586 = _528;
        float _588 = _534;
        float _590 = _540;
        float _592 = _432;
        float _594 = _484;
        float _596 = _586;
        float _598 = _588;
        float _600 = _590;
        float _602 = _592;
        float _604 = _594;
        if (!_496)
        {
            float _606 = _586 * 4.0;
            float _608 = _588 * 4.0;
            float _610 = _590 * 4.0;
            uint _613 = as_type<uint>(half2(float2(_606, _608)));
            uint _615 = as_type<uint>(half2(float2(_610, 0.0)));
            uint _617 = extract_bits(_613, 16u, 16u);
            float _619 = float(_617);
            uint _621 = extract_bits(_615, 0u, 8u);
            int _623 = int(_621) & 255;
            uint _625 = extract_bits(_615, 8u, 8u);
            int _627 = int(_625) & 255;
            int _629 = _627 << 8;
            int _631 = _623 | _629;
            int _633 = int(_613) & 32767;
            bool _635 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
            float _637 = float(uint(_631));
            float _639 = float(uint(_633));
            float _641 = fma(_637, 6.103515625e-05, -0.3125);
            float _643 = fma(_619, 6.103515625e-05, -0.3125);
            float _645 = fma(_639, 6.103515625e-05, -0.3125);
            float _647 = fma(_641, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _649 = fma(_643, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _651 = fma(_645, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _653 = as_type<float>(_613);
            float _655 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
            float _657 = _372;
            float _659 = (*spvDescriptorSet0.fp_c4)._m0[5].z;
            _522 = _651;
            _604 = _649;
            if (_635)
            {
                float3 _3045 = float3(_651, _649, _647);
                float3 _663 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3045, float3(0.0), isnan(_3045))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3045, float3(0.0), isnan(_3045))).xyz;
                float _665 = _663.x;
                float _667 = _663.y;
                float _669 = _663.z;
                _653 = _665;
                _655 = _667;
                _657 = _669;
            }
            float _671 = _653;
            float _673 = _655;
            float _675 = _657;
            float _677 = _641;
            float _679 = _645;
            float _681 = _592;
            if (!_635)
            {
                float3 _3075 = float3(_651, _649, _647);
                float3 _683 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3075, float3(0.0), isnan(_3075))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3075, float3(0.0), isnan(_3075))).xyz;
                float _685 = _683.x;
                float _687 = _683.y;
                float _689 = _683.z;
                _677 = _685;
                _679 = _687;
                _681 = _689;
            }
            float _691 = _677;
            float _693 = _679;
            float _695 = _681;
            bool _697 = !_635;
            float _699 = _671;
            float _701 = _673;
            float _703 = _675;
            _596 = _671;
            _598 = _673;
            _436 = _675;
            _602 = _695;
            _514 = _691;
            _518 = _693;
            if (!_697)
            {
                _600 = _675;
                _705 = true;
            }
            else
            {
                bool _707 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
                bool _709 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
                bool _711 = _707 || _709;
                bool _713 = isnan(0.001000000047497451305389404296875);
                bool _715 = _711 || _713;
                float _717 = _651;
                float _719 = _649;
                float _721 = _376;
                if (_715)
                {
                    float3 _3133 = float3(_651, _649, _647);
                    float3 _723 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3133, float3(0.0), isnan(_3133))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3133, float3(0.0), isnan(_3133))).xyz;
                    float _725 = _723.x;
                    float _727 = _723.y;
                    float _729 = _723.z;
                    _717 = _725;
                    _719 = _727;
                    _721 = _729;
                }
                float _731 = _717;
                float _733 = _719;
                float _735 = _721;
                float _737 = _735;
                _522 = _731;
                _604 = _733;
                if (!_715)
                {
                    _699 = _691;
                }
                float _739 = _699;
                float _741 = _739;
                if (!_715)
                {
                    _701 = _693;
                }
                float _743 = _701;
                float _745 = _743;
                if (!_715)
                {
                    _659 = _695;
                }
                float _747 = _659;
                _600 = _747;
                if (_715)
                {
                    float _749 = -_691;
                    float _751 = _749 + _731;
                    _434 = _751;
                }
                float _753 = _434;
                _440 = _753;
                if (_715)
                {
                    float _755 = -_693;
                    float _757 = _755 + _733;
                    _703 = _757;
                }
                float _759 = _703;
                _436 = _759;
                if (_715)
                {
                    float _761 = -_695;
                    float _763 = _761 + _735;
                    _737 = _763;
                }
                float _765 = _737;
                _438 = _765;
                if (_715)
                {
                    float _767 = fma(_753, (*spvDescriptorSet0.fp_c4)._m0[5].z, _691);
                    _741 = _767;
                }
                float _769 = _741;
                _596 = _769;
                if (_715)
                {
                    float _771 = fma(_759, (*spvDescriptorSet0.fp_c4)._m0[5].z, _693);
                    _745 = _771;
                }
                float _773 = _745;
                _598 = _773;
                if (_715)
                {
                    float _775 = fma(_765, (*spvDescriptorSet0.fp_c4)._m0[5].z, _695);
                    _600 = _775;
                }
            }
        }
        _705 = false;
        float _777 = _596;
        float _779 = _598;
        float _781 = _600;
        float _783 = _436;
        float _785 = _602;
        float _787 = _438;
        float _789 = _440;
        float _791 = _514;
        float _793 = _522;
        float _795 = _518;
        float _797 = _604;
        float _799 = _793;
        float _801 = _795;
        float _803 = _791;
        float _805 = _783;
        float _807 = _785;
        float _809 = _789;
        float _811 = _797;
        float _813 = _777;
        float _815 = _781;
        float _817 = _781;
        float _819 = _777;
        float _821 = _781;
        float _823 = _777;
        float _825 = _781;
        float _827 = _779;
        float _829 = _781;
        float _831 = _777;
        float _833 = _779;
        float _835 = _781;
        float _837 = _777;
        float _839 = _779;
        float _841 = _781;
        float _843 = _787;
        if (_496)
        {
            _799 = _777;
        }
        float _845 = _799;
        float _847 = _845;
        if (_496)
        {
            _801 = _779;
        }
        float _849 = _801;
        float _851 = _849;
        if (_496)
        {
            _803 = _781;
        }
        float _853 = _803;
        float _855 = _853;
        if (!_496)
        {
            bool _857 = _777 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _859 = isnan(_777);
            bool _861 = _857 || _859;
            bool _863 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _865 = _861 || _863;
            bool _867 = _779 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _869 = isnan(_779);
            bool _871 = _867 || _869;
            bool _873 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _875 = _871 || _873;
            float _877 = fma(_777, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _879 = fma(_779, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _881 = fma(_781, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            bool _883 = _781 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _885 = isnan(_781);
            bool _887 = _883 || _885;
            bool _889 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _891 = _887 || _889;
            float _893 = exp2(_877);
            float _895 = exp2(_879);
            float _897 = exp2(_881);
            float _899 = -_893;
            float _901 = _899 + 1.0;
            bool _903 = !_865;
            float _905 = _903 ? _777 : _901;
            float _907 = -_895;
            float _909 = _907 + 1.0;
            bool _911 = !_875;
            float _913 = _911 ? _779 : _909;
            float _915 = -_897;
            float _917 = _915 + 1.0;
            bool _919 = !_891;
            float _921 = _919 ? _781 : _917;
            _805 = _909;
            _807 = _897;
            _809 = _917;
            _855 = _921;
            _847 = _905;
            _851 = _913;
            _811 = _895;
        }
        float _923 = _805;
        float _925 = _807;
        float _927 = _809;
        float _929 = _855;
        float _931 = _847;
        float _933 = _851;
        float _935 = _811;
        float _937 = _923;
        float _939 = _927;
        float _941 = _925;
        float _943 = _925;
        float _945 = _935;
        float _947 = _931;
        float _949 = _933;
        float _951 = _929;
        float _953 = _927;
        float _955 = _925;
        float _957 = _927;
        float _959 = _931;
        float _961 = _935;
        float _963 = _933;
        if (_496)
        {
            _937 = _929;
        }
        float _965 = _937;
        float _967 = _965;
        float _969 = _965;
        float _971 = _965;
        if (!_496)
        {
            bool _973 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
            bool _975 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
            bool _977 = _973 || _975;
            bool _979 = isnan(6.0);
            bool _981 = _977 || _979;
            float _983 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
            if (!_981)
            {
                float _985 = -_931;
                float _987 = _985 + 1.0;
                float _989 = -_933;
                float _991 = _989 + 1.0;
                float _993 = -_929;
                float _995 = _993 + 1.0;
                float _997 = abs(_987);
                float _999 = log2(_997);
                float _1001 = abs(_991);
                float _1003 = log2(_1001);
                float _1005 = abs(_995);
                float _1007 = log2(_1005);
                float _1009 = _999 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1011 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                float _1013 = _1003 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1015 = exp2(_1009);
                float _1017 = _1007 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _1019 = exp2(_1013);
                float _1021 = exp2(_1017);
                float _1023 = fma(_1011, _1015, 1.0);
                float _1025 = fma(_1011, _1019, 1.0);
                float _1027 = 1.0 / _1023;
                float _1029 = fma(_1011, _1021, 1.0);
                float _1031 = 1.0 / _1025;
                float _1033 = 1.0 / _1029;
                float _1035 = _1027 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1037 = _1031 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1039 = precise::max(_1035, _1037);
                float _1041 = _1033 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _1043 = precise::max(_1041, _1039);
                float _1045 = -_1035;
                float _1047 = _1045 + _1043;
                float _1049 = -_1037;
                float _1051 = _1049 + _1043;
                float _1053 = -_1041;
                float _1055 = _1053 + _1043;
                float _1057 = fma(_1047, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1035);
                float _1059 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1037);
                float _1061 = fma(_1055, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1041);
                float _1063 = _1057 * _931;
                float _1065 = _1059 * _933;
                float _1067 = _1061 * _929;
                _831 = _1059;
                _833 = _1061;
                _835 = _1033;
                _1069 = _1065;
                _1071 = _1063;
                _1073 = _1065;
                _1075 = _1067;
                _1077 = true;
            }
            else
            {
                bool _1079 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
                if (!_1079)
                {
                    _939 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
                }
                float _1081 = _939;
                bool _1083 = !_1079;
                float _1085 = _1081;
                float _1087 = _1081;
                _953 = _1081;
                if (!_1083)
                {
                    float _1089 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
                    float _1091 = _89 + _1089;
                    float _1093 = abs(_1091);
                    float _1095 = _1093 * 2560.0;
                    bool _1097 = _1095 >= 2.0;
                    bool _1099 = isnan(_1095);
                    bool _1101 = _1097 || _1099;
                    bool _1103 = isnan(2.0);
                    bool _1105 = _1101 || _1103;
                    float _1107 = _1095;
                    if (!_1105)
                    {
                        _967 = 0.0;
                    }
                    float _1109 = _967;
                    float _1111 = _1109;
                    _1071 = _1109;
                    if (!_1105)
                    {
                        _941 = 0.0;
                    }
                    float _1113 = _941;
                    float _1115 = _1113;
                    _1069 = _1113;
                    _1073 = _1113;
                    if (!_1105)
                    {
                        _1107 = 0.0;
                    }
                    float _1117 = _1107;
                    bool _1119 = !_1105;
                    float _1121 = _1117;
                    _1075 = _1117;
                    _1077 = _1119;
                    if (!_1077)
                    {
                        bool _1123 = _89 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                        if (_1123)
                        {
                            _1111 = _931;
                        }
                        float _1125 = _1111;
                        _969 = _1125;
                        _1071 = _1125;
                        if (_1123)
                        {
                            _1115 = _933;
                        }
                        float _1127 = _1115;
                        _943 = _1127;
                        _1069 = _1127;
                        _1073 = _1127;
                        if (_1123)
                        {
                            _1121 = _929;
                        }
                        float _1129 = _1121;
                        _945 = _1129;
                        _1075 = _1129;
                        _1077 = _1123;
                        if (!_1077)
                        {
                            float _1131 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                            _1085 = _1131;
                            _1087 = _1131;
                        }
                    }
                }
                if (!_1077)
                {
                    float _1133 = _943;
                    float _1135 = _1085;
                    float _1137 = _1087;
                    float _1139 = _969;
                    float _1141 = _945;
                    bool _1143 = _1137 != 0.0;
                    bool _1145 = isnan(_1137);
                    bool _1147 = _1143 || _1145;
                    bool _1149 = isnan(0.0);
                    bool _1151 = _1147 || _1149;
                    float _1153 = _1135;
                    float _1155 = _1135;
                    float _1157 = _1139;
                    float _1159 = _1133;
                    float _1161 = _1141;
                    _953 = _1135;
                    if (!_1151)
                    {
                        float _1163 = _779 * 0.586600005626678466796875;
                        float _1165 = fma(_777, 0.29890000820159912109375, _1163);
                        float _1167 = fma(_781, 0.1143999993801116943359375, _1165);
                        float _1169 = _1167 * (-1.44269502162933349609375);
                        float _1171 = exp2(_1169);
                        float _1173 = -_1171;
                        float _1175 = _1173 + 1.0;
                        bool _1177 = _1175 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _1179 = isnan(_1175);
                        bool _1181 = _1177 || _1179;
                        bool _1183 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _1185 = _1181 || _1183;
                        if (!_1185)
                        {
                            _813 = _1175;
                        }
                        float _1187 = _813;
                        bool _1189 = !_1185;
                        float _1191 = _1187;
                        float _1193 = _1187;
                        if (!_1189)
                        {
                            float _1195 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1197 = _1175 + _1195;
                            float _1199 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1201 = spvFAdd(_1199, 1.00000095367431640625);
                            float _1203 = 1.0 / _1201;
                            float _1205 = _1197 * _1203;
                            float _1207 = -_1205;
                            float _1209 = _1207 + 1.0;
                            float _1211 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1213 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1211;
                            float _1215 = abs(_1209);
                            float _1217 = log2(_1215);
                            float _1219 = _1213 * _1203;
                            float _1221 = _1219 + (-1.0);
                            float _1223 = _1219 * _1205;
                            float _1225 = _1217 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1227 = exp2(_1225);
                            float _1229 = fma(_1221, _1227, 1.0);
                            float _1231 = 1.0 / _1229;
                            float _1233 = _1223 * _1231;
                            float _1235 = fma(_1201, _1233, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _1191 = _1235;
                            _815 = _1227;
                            _1193 = _1235;
                        }
                        float _1237 = _1191;
                        float _1239 = _815;
                        float _1241 = _1193;
                        float _1243 = -_1175;
                        float _1245 = _1243 + _1241;
                        float _1247 = _933 * 0.586600005626678466796875;
                        float _1249 = _1245 + 1.0;
                        float _1251 = fma(_931, 0.29890000820159912109375, _1247);
                        float _1253 = fma(_929, 0.1143999993801116943359375, _1251);
                        float _1255 = abs(_1249);
                        float _1257 = log2(_1255);
                        float _1259 = spvFAdd(_1253, 9.9999999747524270787835121154785e-07);
                        float _1261 = 1.0 / _1259;
                        float _1263 = _1257 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                        float _1265 = exp2(_1263);
                        float _1267 = fma(_1261, _933, -1.0);
                        float _1269 = fma(_1261, _931, -1.0);
                        float _1271 = fma(_1261, _929, -1.0);
                        float _1273 = fma(_1265, _1267, 1.0);
                        float _1275 = fma(_1265, _1269, 1.0);
                        float _1277 = fma(_1265, _1271, 1.0);
                        float _1279 = _1273 * _1241;
                        float _1281 = _1275 * _1241;
                        float _1283 = _1277 * _1241;
                        float _1285 = precise::max(0.0, _1279);
                        float _1287 = precise::max(0.0, _1281);
                        float _1289 = precise::max(0.0, _1283);
                        float _1291 = precise::min(_1285, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1293 = precise::min(_1287, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1295 = precise::min(_1289, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _831 = _1237;
                        _833 = _1265;
                        _835 = _1239;
                        _1069 = _1291;
                        _1071 = _1293;
                        _1073 = _1291;
                        _1075 = _1295;
                        _1077 = true;
                    }
                    else
                    {
                        bool _1297 = _1135 != 1.0;
                        bool _1299 = isnan(_1135);
                        bool _1301 = _1297 || _1299;
                        bool _1303 = isnan(1.0);
                        bool _1305 = _1301 || _1303;
                        if (!_1305)
                        {
                            bool _1307 = _931 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1309 = isnan(_931);
                            bool _1311 = _1307 || _1309;
                            bool _1313 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1315 = _1311 || _1313;
                            float _1317 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1319 = spvFAdd(_1317, 1.00000095367431640625);
                            bool _1321 = _933 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1323 = isnan(_933);
                            bool _1325 = _1321 || _1323;
                            bool _1327 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1329 = _1325 || _1327;
                            bool _1331 = _929 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1333 = isnan(_929);
                            bool _1335 = _1331 || _1333;
                            bool _1337 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1339 = _1335 || _1337;
                            float _1341 = 1.0 / _1319;
                            float _1343 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1345 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1343;
                            float _1347 = _1345 * _1341;
                            bool _1349 = !_1315;
                            float _1351 = _1341;
                            _833 = _1347;
                            if (!_1349)
                            {
                                float _1353 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1355 = _931 + _1353;
                                float _1357 = _1347 + (-1.0);
                                float _1359 = _1355 * _1341;
                                float _1361 = -_1359;
                                float _1363 = _1361 + 1.0;
                                float _1365 = _1347 * _1359;
                                float _1367 = abs(_1363);
                                float _1369 = log2(_1367);
                                float _1371 = _1369 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1373 = exp2(_1371);
                                float _1375 = fma(_1357, _1373, 1.0);
                                float _1377 = 1.0 / _1375;
                                float _1379 = _1365 * _1377;
                                float _1381 = fma(_1319, _1379, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _947 = _1381;
                            }
                            float _1383 = _947;
                            bool _1385 = !_1329;
                            if (!_1385)
                            {
                                float _1387 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1389 = _933 + _1387;
                                float _1391 = _1389 * _1341;
                                float _1393 = _1347 + (-1.0);
                                float _1395 = -_1391;
                                float _1397 = _1395 + 1.0;
                                float _1399 = _1347 * _1391;
                                float _1401 = abs(_1397);
                                float _1403 = log2(_1401);
                                float _1405 = _1403 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1407 = exp2(_1405);
                                float _1409 = fma(_1393, _1407, 1.0);
                                float _1411 = 1.0 / _1409;
                                float _1413 = _1399 * _1411;
                                float _1415 = fma(_1319, _1413, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _817 = _1409;
                                _949 = _1415;
                            }
                            float _1417 = _817;
                            float _1419 = _949;
                            bool _1421 = !_1339;
                            _835 = _1417;
                            if (!_1421)
                            {
                                float _1423 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1425 = _929 + _1423;
                                float _1427 = _1347 + (-1.0);
                                float _1429 = _1425 * _1341;
                                float _1431 = -_1429;
                                float _1433 = _1431 + 1.0;
                                float _1435 = _1347 * _1429;
                                float _1437 = abs(_1433);
                                float _1439 = log2(_1437);
                                float _1441 = _1439 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1443 = exp2(_1441);
                                float _1445 = fma(_1427, _1443, 1.0);
                                float _1447 = 1.0 / _1445;
                                float _1449 = _1435 * _1447;
                                float _1451 = fma(_1319, _1449, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1351 = _1449;
                                _951 = _1451;
                            }
                            float _1453 = _1351;
                            float _1455 = _951;
                            float _1457 = precise::max(0.0, _1455);
                            float _1459 = precise::max(0.0, _1383);
                            float _1461 = precise::max(0.0, _1419);
                            float _1463 = precise::min(_1457, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1465 = precise::min(_1459, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1467 = precise::min(_1461, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            _831 = _1453;
                            _1069 = _1467;
                            _1071 = _1465;
                            _1073 = _1467;
                            _1075 = _1463;
                            _1077 = true;
                        }
                        else
                        {
                            bool _1469 = _1135 != 2.0;
                            bool _1471 = isnan(_1135);
                            bool _1473 = _1469 || _1471;
                            bool _1475 = isnan(2.0);
                            bool _1477 = _1473 || _1475;
                            if (!_1477)
                            {
                                float _1479 = _933 * 0.715200006961822509765625;
                                float _1481 = fma(_931, 0.2125999927520751953125, _1479);
                                float _1483 = fma(_929, 0.072200000286102294921875, _1481);
                                float _1485 = spvFAdd(_1483, 9.9999999747524270787835121154785e-07);
                                bool _1487 = _1483 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1489 = isnan(_1483);
                                bool _1491 = _1487 || _1489;
                                bool _1493 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1495 = _1491 || _1493;
                                float _1497 = 1.0 / _1485;
                                float _1499 = _1483;
                                if (!_1495)
                                {
                                    _819 = _1483;
                                }
                                float _1501 = _819;
                                bool _1503 = !_1495;
                                float _1505 = _1501;
                                if (!_1503)
                                {
                                    float _1507 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1509 = _1483 + _1507;
                                    float _1511 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1513 = spvFAdd(_1511, 1.00000095367431640625);
                                    float _1515 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1517 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1515;
                                    float _1519 = 1.0 / _1513;
                                    float _1521 = _1509 * _1519;
                                    float _1523 = _1517 * _1519;
                                    float _1525 = -_1521;
                                    float _1527 = _1525 + 1.0;
                                    float _1529 = _1523 + (-1.0);
                                    float _1531 = _1523 * _1521;
                                    float _1533 = abs(_1527);
                                    float _1535 = log2(_1533);
                                    float _1537 = _1535 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1539 = exp2(_1537);
                                    float _1541 = fma(_1529, _1539, 1.0);
                                    float _1543 = 1.0 / _1541;
                                    float _1545 = _1531 * _1543;
                                    float _1547 = fma(_1513, _1545, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    _1499 = _1545;
                                    _821 = _1523;
                                    _1505 = _1547;
                                }
                                float _1549 = _1499;
                                float _1551 = _821;
                                float _1553 = _1505;
                                float _1555 = precise::max(0.0, _1553);
                                float _1557 = precise::min(_1555, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1559 = _1557 * _1497;
                                float _1561 = _931 * _1559;
                                float _1563 = _933 * _1559;
                                float _1565 = _929 * _1559;
                                float _1567 = precise::max(0.0, _1561);
                                float _1569 = precise::max(0.0, _1563);
                                float _1571 = precise::max(0.0, _1565);
                                float _1573 = precise::min(_1567, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1575 = precise::min(_1569, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1577 = precise::min(_1571, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                _831 = _1557;
                                _833 = _1549;
                                _835 = _1551;
                                _1069 = _1575;
                                _1071 = _1573;
                                _1073 = _1575;
                                _1075 = _1577;
                                _1077 = true;
                            }
                            else
                            {
                                bool _1579 = _1135 != 3.0;
                                bool _1581 = isnan(_1135);
                                bool _1583 = _1579 || _1581;
                                bool _1585 = isnan(3.0);
                                bool _1587 = _1583 || _1585;
                                if (!_1587)
                                {
                                    float _1589 = -_933;
                                    float _1591 = _1589 + 1.0;
                                    float _1593 = -_931;
                                    float _1595 = _1593 + 1.0;
                                    float _1597 = -_929;
                                    float _1599 = _1597 + 1.0;
                                    float _1601 = abs(_1591);
                                    float _1603 = log2(_1601);
                                    float _1605 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1607 = abs(_1595);
                                    float _1609 = log2(_1607);
                                    float _1611 = abs(_1599);
                                    float _1613 = log2(_1611);
                                    float _1615 = _1603 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1617 = _1609 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1619 = exp2(_1615);
                                    float _1621 = _1613 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1623 = exp2(_1617);
                                    float _1625 = exp2(_1621);
                                    float _1627 = fma(_1605, _1619, 1.0);
                                    float _1629 = fma(_1605, _1623, 1.0);
                                    float _1631 = 1.0 / _1627;
                                    float _1633 = fma(_1605, _1625, 1.0);
                                    float _1635 = 1.0 / _1629;
                                    float _1637 = 1.0 / _1633;
                                    float _1639 = _1631 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1641 = _1635 + _1631;
                                    float _1643 = _1635 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1645 = precise::max(_1643, _1639);
                                    float _1647 = _1637 + _1641;
                                    float _1649 = _1637 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1651 = _1647 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1653 = precise::max(_1649, _1645);
                                    float _1655 = _1651 * 0.3333333432674407958984375;
                                    float _1657 = -_1655;
                                    float _1659 = _1653 + _1657;
                                    float _1661 = fma(_1659, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1655);
                                    float _1663 = -_1643;
                                    float _1665 = _1663 + _1661;
                                    float _1667 = -_1639;
                                    float _1669 = _1667 + _1661;
                                    float _1671 = -_1649;
                                    float _1673 = _1671 + _1661;
                                    float _1675 = fma(_1665, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1643);
                                    float _1677 = fma(_1669, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1639);
                                    float _1679 = fma(_1673, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1649);
                                    float _1681 = _1675 * _931;
                                    float _1683 = _1677 * _933;
                                    float _1685 = _1679 * _929;
                                    _831 = _1643;
                                    _833 = _1649;
                                    _835 = _1631;
                                    _1069 = _1683;
                                    _1071 = _1681;
                                    _1073 = _1683;
                                    _1075 = _1685;
                                    _1077 = true;
                                }
                                else
                                {
                                    bool _1687 = _1135 != 4.0;
                                    bool _1689 = isnan(_1135);
                                    bool _1691 = _1687 || _1689;
                                    bool _1693 = isnan(4.0);
                                    bool _1695 = _1691 || _1693;
                                    if (!_1695)
                                    {
                                        bool _1697 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        bool _1699 = isnan(0.0);
                                        bool _1701 = _1697 || _1699;
                                        bool _1703 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        bool _1705 = _1701 || _1703;
                                        if (!_1705)
                                        {
                                            float _1707 = -_931;
                                            float _1709 = _1707 + 1.0;
                                            float _1711 = abs(_1709);
                                            float _1713 = log2(_1711);
                                            float _1715 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1717 = _1713 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1719 = exp2(_1717);
                                            float _1721 = fma(_1715, _1719, 1.0);
                                            float _1723 = 1.0 / _1721;
                                            float _1725 = _1723 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1727 = _1717;
                                            _1729 = _1723;
                                            _1731 = _1725;
                                            _1733 = true;
                                        }
                                        else
                                        {
                                            float _1735 = spvFAdd(_931, 9.9999999747524270787835121154785e-07);
                                            bool _1737 = _931 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1739 = isnan(_931);
                                            bool _1741 = _1737 || _1739;
                                            bool _1743 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1745 = _1741 || _1743;
                                            float _1747 = 1.0 / _1735;
                                            if (!_1745)
                                            {
                                                _823 = _931;
                                            }
                                            float _1749 = _823;
                                            bool _1751 = !_1745;
                                            float _1753 = _1749;
                                            if (!_1751)
                                            {
                                                float _1755 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1757 = _931 + _1755;
                                                float _1759 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1761 = spvFAdd(_1759, 1.00000095367431640625);
                                                float _1763 = 1.0 / _1761;
                                                float _1765 = _1757 * _1763;
                                                float _1767 = -_1765;
                                                float _1769 = _1767 + 1.0;
                                                float _1771 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1773 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1771;
                                                float _1775 = abs(_1769);
                                                float _1777 = log2(_1775);
                                                float _1779 = _1773 * _1763;
                                                float _1781 = _1779 + (-1.0);
                                                float _1783 = _1779 * _1765;
                                                float _1785 = _1777 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1787 = exp2(_1785);
                                                float _1789 = fma(_1781, _1787, 1.0);
                                                float _1791 = 1.0 / _1789;
                                                float _1793 = _1783 * _1791;
                                                float _1795 = fma(_1761, _1793, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _825 = _1785;
                                                _1753 = _1795;
                                                _827 = _1793;
                                                _442 = _1791;
                                            }
                                            float _1797 = _825;
                                            float _1799 = _1753;
                                            float _1801 = _827;
                                            float _1803 = _442;
                                            float _1805 = precise::max(0.0, _1799);
                                            float _1807 = precise::min(_1805, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1809 = _1807 * _1747;
                                            _829 = _1797;
                                            _1727 = _1801;
                                            _1729 = _1803;
                                            _1731 = _1809;
                                        }
                                        _1733 = false;
                                        float _1811 = _829;
                                        float _1813 = _1727;
                                        float _1815 = _1729;
                                        float _1817 = _1731;
                                        float _1819 = _1813;
                                        float _1821 = _1811;
                                        float _1823 = _1815;
                                        float _1825 = _1811;
                                        if (!_1705)
                                        {
                                            float _1827 = -_933;
                                            float _1829 = _1827 + 1.0;
                                            float _1831 = abs(_1829);
                                            float _1833 = log2(_1831);
                                            float _1835 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1837 = _1833 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1839 = exp2(_1837);
                                            float _1841 = fma(_1835, _1839, 1.0);
                                            float _1843 = 1.0 / _1841;
                                            float _1845 = _1843 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1847 = _1837;
                                            _1849 = _1845;
                                            _1851 = true;
                                        }
                                        else
                                        {
                                            float _1853 = spvFAdd(_933, 9.9999999747524270787835121154785e-07);
                                            bool _1855 = _933 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1857 = isnan(_933);
                                            bool _1859 = _1855 || _1857;
                                            bool _1861 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1863 = _1859 || _1861;
                                            float _1865 = 1.0 / _1853;
                                            if (!_1863)
                                            {
                                                _1819 = _933;
                                            }
                                            float _1867 = _1819;
                                            bool _1869 = !_1863;
                                            float _1871 = _1867;
                                            if (!_1869)
                                            {
                                                float _1873 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1875 = _933 + _1873;
                                                float _1877 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1879 = spvFAdd(_1877, 1.00000095367431640625);
                                                float _1881 = 1.0 / _1879;
                                                float _1883 = _1875 * _1881;
                                                float _1885 = -_1883;
                                                float _1887 = _1885 + 1.0;
                                                float _1889 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1891 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1889;
                                                float _1893 = abs(_1887);
                                                float _1895 = log2(_1893);
                                                float _1897 = _1891 * _1881;
                                                float _1899 = _1897 + (-1.0);
                                                float _1901 = _1897 * _1883;
                                                float _1903 = _1895 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1905 = exp2(_1903);
                                                float _1907 = fma(_1899, _1905, 1.0);
                                                float _1909 = 1.0 / _1907;
                                                float _1911 = _1901 * _1909;
                                                float _1913 = fma(_1879, _1911, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1821 = _1895;
                                                _1153 = _1909;
                                                _1871 = _1913;
                                                _1823 = _1911;
                                            }
                                            float _1915 = _1821;
                                            float _1917 = _1153;
                                            float _1919 = _1871;
                                            float _1921 = _1823;
                                            float _1923 = precise::max(0.0, _1919);
                                            float _1925 = precise::min(_1923, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1927 = _1925 * _1865;
                                            _1825 = _1915;
                                            _1155 = _1917;
                                            _1847 = _1921;
                                            _1849 = _1927;
                                        }
                                        _1851 = false;
                                        float _1929 = _1825;
                                        float _1931 = _1155;
                                        float _1933 = _1847;
                                        float _1935 = _1849;
                                        float _1937 = _1933;
                                        float _1939 = _1929;
                                        float _1941 = _1931;
                                        float _1943 = _1929;
                                        float _1945 = _1931;
                                        if (!_1705)
                                        {
                                            float _1947 = -_929;
                                            float _1949 = _1947 + 1.0;
                                            float _1951 = abs(_1949);
                                            float _1953 = log2(_1951);
                                            float _1955 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1957 = _1953 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1959 = exp2(_1957);
                                            float _1961 = fma(_1955, _1959, 1.0);
                                            float _1963 = 1.0 / _1961;
                                            float _1965 = _1963 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1967 = _1965;
                                            _1969 = true;
                                        }
                                        else
                                        {
                                            float _1971 = spvFAdd(_929, 9.9999999747524270787835121154785e-07);
                                            bool _1973 = _929 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1975 = isnan(_929);
                                            bool _1977 = _1973 || _1975;
                                            bool _1979 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1981 = _1977 || _1979;
                                            float _1983 = 1.0 / _1971;
                                            if (!_1981)
                                            {
                                                _1937 = _929;
                                            }
                                            float _1985 = _1937;
                                            bool _1987 = !_1981;
                                            float _1989 = _1985;
                                            if (!_1987)
                                            {
                                                float _1991 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1993 = _929 + _1991;
                                                float _1995 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1997 = spvFAdd(_1995, 1.00000095367431640625);
                                                float _1999 = 1.0 / _1997;
                                                float _2001 = _1993 * _1999;
                                                float _2003 = -_2001;
                                                float _2005 = _2003 + 1.0;
                                                float _2007 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _2009 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _2007;
                                                float _2011 = abs(_2005);
                                                float _2013 = log2(_2011);
                                                float _2015 = _2009 * _1999;
                                                float _2017 = _2015 + (-1.0);
                                                float _2019 = _2015 * _2001;
                                                float _2021 = _2013 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2023 = exp2(_2021);
                                                float _2025 = fma(_2017, _2023, 1.0);
                                                float _2027 = 1.0 / _2025;
                                                float _2029 = _2019 * _2027;
                                                float _2031 = fma(_1997, _2029, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1939 = _2027;
                                                _1941 = _2023;
                                                _1989 = _2031;
                                            }
                                            float _2033 = _1939;
                                            float _2035 = _1941;
                                            float _2037 = _1989;
                                            float _2039 = precise::max(0.0, _2037);
                                            float _2041 = precise::min(_2039, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _2043 = _2041 * _1983;
                                            _1943 = _2033;
                                            _1945 = _2035;
                                            _1967 = _2043;
                                        }
                                        _1969 = false;
                                        float _2045 = _1943;
                                        float _2047 = _1945;
                                        float _2049 = _1967;
                                        float _2051 = precise::max(_1817, _1935);
                                        float _2053 = precise::max(_2051, _2049);
                                        float _2055 = -_1817;
                                        float _2057 = _2053 + _2055;
                                        float _2059 = -_1935;
                                        float _2061 = _2053 + _2059;
                                        float _2063 = -_2049;
                                        float _2065 = _2053 + _2063;
                                        float _2067 = fma(_2057, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1817);
                                        float _2069 = fma(_2061, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1935);
                                        float _2071 = fma(_2065, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2049);
                                        float _2073 = _2067 * _931;
                                        float _2075 = _2069 * _933;
                                        float _2077 = _2071 * _929;
                                        _831 = _2069;
                                        _833 = _2071;
                                        _835 = _2045;
                                        _1069 = _2075;
                                        _953 = _2047;
                                        _1071 = _2073;
                                        _1073 = _2075;
                                        _1075 = _2077;
                                        _1077 = true;
                                    }
                                    else
                                    {
                                        bool _2079 = _1135 != 5.0;
                                        bool _2081 = isnan(_1135);
                                        bool _2083 = _2079 || _2081;
                                        bool _2085 = isnan(5.0);
                                        bool _2087 = _2083 || _2085;
                                        if (!_2087)
                                        {
                                            _1157 = _777;
                                        }
                                        float _2089 = _1157;
                                        float _2091 = _2089;
                                        _1071 = _2089;
                                        if (!_2087)
                                        {
                                            _1159 = _779;
                                        }
                                        float _2093 = _1159;
                                        float _2095 = _2093;
                                        _1069 = _2093;
                                        _1073 = _2093;
                                        if (!_2087)
                                        {
                                            _1161 = _781;
                                        }
                                        float _2097 = _1161;
                                        bool _2099 = !_2087;
                                        float _2101 = _2097;
                                        _1075 = _2097;
                                        if (!_2099)
                                        {
                                            bool _2103 = _1135 != 6.0;
                                            bool _2105 = isnan(_1135);
                                            bool _2107 = _2103 || _2105;
                                            bool _2109 = isnan(6.0);
                                            bool _2111 = _2107 || _2109;
                                            if (!_2111)
                                            {
                                                float _2113 = -_933;
                                                float _2115 = _2113 + 1.0;
                                                float _2117 = -_931;
                                                float _2119 = _2117 + 1.0;
                                                float _2121 = -_929;
                                                float _2123 = _2121 + 1.0;
                                                float _2125 = abs(_2115);
                                                float _2127 = log2(_2125);
                                                float _2129 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                float _2131 = abs(_2119);
                                                float _2133 = log2(_2131);
                                                float _2135 = abs(_2123);
                                                float _2137 = log2(_2135);
                                                float _2139 = _2127 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2141 = _2133 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2143 = exp2(_2139);
                                                float _2145 = _2137 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2147 = exp2(_2141);
                                                float _2149 = exp2(_2145);
                                                float _2151 = fma(_2129, _2143, 1.0);
                                                float _2153 = fma(_2129, _2147, 1.0);
                                                float _2155 = 1.0 / _2151;
                                                float _2157 = fma(_2129, _2149, 1.0);
                                                float _2159 = 1.0 / _2153;
                                                float _2161 = 1.0 / _2157;
                                                float _2163 = _2155 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2165 = _2159 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2167 = precise::max(_2165, _2163);
                                                float _2169 = _2161 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2171 = precise::max(_2169, _2167);
                                                float _2173 = -_2165;
                                                float _2175 = _2173 + _2171;
                                                float _2177 = -_2163;
                                                float _2179 = _2177 + _2171;
                                                float _2181 = -_2169;
                                                float _2183 = _2181 + _2171;
                                                float _2185 = fma(_2175, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2165);
                                                float _2187 = fma(_2179, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2163);
                                                float _2189 = fma(_2183, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2169);
                                                float _2191 = _2185 * _931;
                                                float _2193 = _2187 * _933;
                                                float _2195 = _2189 * _929;
                                                _831 = _2155;
                                                _833 = _2189;
                                                _835 = _2183;
                                                _1069 = _2193;
                                                _983 = _2175;
                                                _1071 = _2191;
                                                _1073 = _2193;
                                                _1075 = _2195;
                                                _1077 = true;
                                            }
                                            else
                                            {
                                                bool _2197 = _1135 != 7.0;
                                                bool _2199 = isnan(_1135);
                                                bool _2201 = _2197 || _2199;
                                                bool _2203 = isnan(7.0);
                                                bool _2205 = _2201 || _2203;
                                                if (_2205)
                                                {
                                                    _2091 = as_type<float>(_384);
                                                }
                                                float _2207 = _2091;
                                                _1071 = _2207;
                                                if (_2205)
                                                {
                                                    _2095 = as_type<float>(_380);
                                                }
                                                float _2209 = _2095;
                                                _1069 = _2209;
                                                _1073 = _2209;
                                                if (_2205)
                                                {
                                                    _2101 = as_type<float>(_382);
                                                }
                                                float _2211 = _2101;
                                                _1075 = _2211;
                                                if (!_2205)
                                                {
                                                    float _2213 = -_933;
                                                    float _2215 = _2213 + 1.0;
                                                    float _2217 = -_931;
                                                    float _2219 = _2217 + 1.0;
                                                    float _2221 = -_929;
                                                    float _2223 = _2221 + 1.0;
                                                    float _2225 = abs(_2215);
                                                    float _2227 = log2(_2225);
                                                    float _2229 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                    float _2231 = abs(_2219);
                                                    float _2233 = log2(_2231);
                                                    float _2235 = abs(_2223);
                                                    float _2237 = log2(_2235);
                                                    float _2239 = _2227 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2241 = _2233 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2243 = exp2(_2239);
                                                    float _2245 = _2237 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2247 = exp2(_2241);
                                                    float _2249 = exp2(_2245);
                                                    float _2251 = fma(_2229, _2243, 1.0);
                                                    float _2253 = fma(_2229, _2247, 1.0);
                                                    float _2255 = 1.0 / _2251;
                                                    float _2257 = fma(_2229, _2249, 1.0);
                                                    float _2259 = 1.0 / _2253;
                                                    float _2261 = 1.0 / _2257;
                                                    float _2263 = _2255 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2265 = -_933;
                                                    float _2267 = fma(_2263, _933, _2265);
                                                    float _2269 = _2259 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2271 = -_931;
                                                    float _2273 = fma(_2269, _931, _2271);
                                                    float _2275 = _2261 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2277 = _2273 + _2267;
                                                    float _2279 = -_929;
                                                    float _2281 = fma(_2275, _929, _2279);
                                                    float _2283 = _2281 + _2277;
                                                    float _2285 = -_2273;
                                                    float _2287 = fma(_2283, 0.3333333432674407958984375, _2285);
                                                    float _2289 = -_2267;
                                                    float _2291 = fma(_2283, 0.3333333432674407958984375, _2289);
                                                    float _2293 = -_2281;
                                                    float _2295 = fma(_2283, 0.3333333432674407958984375, _2293);
                                                    float _2297 = fma(_2287, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2273);
                                                    float _2299 = fma(_2291, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2267);
                                                    float _2301 = fma(_2295, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2281);
                                                    float _2303 = _2297 + _931;
                                                    float _2305 = _2299 + _933;
                                                    float _2307 = _2301 + _929;
                                                    _831 = _2299;
                                                    _833 = _2301;
                                                    _835 = _2261;
                                                    _1069 = _2305;
                                                    _1071 = _2303;
                                                    _1073 = _2305;
                                                    _1075 = _2307;
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
            _1077 = false;
            float _2309 = _831;
            float _2311 = _833;
            float _2313 = _835;
            float _2315 = _1069;
            float _2317 = _983;
            float _2319 = _953;
            float _2321 = _1071;
            float _2323 = _1073;
            float _2325 = _1075;
            float _2327 = _2321 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2329 = _2323 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2331 = _2325 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            _837 = _2309;
            _839 = _2311;
            _841 = _2313;
            _971 = _2331;
            _955 = _2315;
            _843 = _2317;
            _957 = _2319;
            _444 = _2323;
            _446 = _2325;
            _448 = _2321;
            _959 = _2327;
            _961 = _2325;
            _963 = _2329;
        }
        float _2333 = _837;
        float _2335 = _839;
        float _2337 = _841;
        float _2339 = _971;
        float _2341 = _955;
        float _2343 = _843;
        float _2345 = _957;
        int _2347 = as_type<int>(_444);
        int _2349 = as_type<int>(_446);
        int _2351 = as_type<int>(_448);
        float _2353 = _959;
        float _2355 = _961;
        float _2357 = _963;
        int _2359 = _416 ? 64 : 0;
        bool _2361 = _408 != 0;
        int _2363 = _356 + 1;
        bool _2365 = _2363 >= 4;
        bool _2367 = _2359 != 0;
        _318 = _2363;
        _330 = _2335;
        _332 = _2337;
        _334 = _2339;
        _336 = _2341;
        _338 = _2343;
        _340 = _2345;
        _342 = _2347;
        _344 = _2349;
        _346 = _2351;
        float _2369 = _2333;
        float _2371 = _2355;
        if (_400)
        {
            _2369 = _210;
        }
        float _2373 = _2369;
        float _2375 = _2373;
        if (_2361)
        {
            _2371 = _314;
        }
        float _2377 = _2371;
        float _2379 = _2377;
        if (_406)
        {
            _2379 = _312;
        }
        float _2381 = _2379;
        float _2383 = _2381;
        if (_412)
        {
            _2383 = _310;
        }
        float _2385 = _2383;
        float _2387 = _2385;
        if (_410)
        {
            _2387 = _316;
        }
        float _2389 = _2387;
        if (_402)
        {
            _2375 = _236;
        }
        float _2391 = _2375;
        _2393 = fma(_2353, _2389, _386);
        _322 = _2393;
        float _2395 = _2391;
        if (_414)
        {
            _2395 = _262;
        }
        float _2397 = _2395;
        _2399 = fma(_2357, _2389, _388);
        _324 = _2399;
        float _2401 = _2397;
        float _2403 = _2397;
        if (_2367)
        {
            _2401 = _288;
            _2403 = _288;
        }
        float _2405 = _2401;
        float _2407 = _2403;
        _2409 = fma(_2339, _2389, _390);
        _2411 = fma(_2389, _2407, _392);
        _320 = _2411;
        _326 = _2409;
        _328 = _2405;
        _348 = _2393;
        _350 = _2399;
        _352 = _2409;
        _354 = _2411;
        if (_2365)
        {
            _2413 = true;
            if (_2413)
            {
                break;
            }
        }
    } while (true);
    _2413 = false;
    out.m_45.x = _2393;
    out.m_45.y = _2399;
    out.m_45.z = _2409;
    out.m_45.w = _2411;
    return out;
}

