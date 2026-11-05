#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

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

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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
    texturecube_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_35 [[color(0)]];
    float4 m_37 [[color(1)]];
    float4 m_39 [[color(2)]];
    float4 m_41 [[color(3)]];
    float4 m_43 [[color(4)]];
    float4 m_45 [[color(5)]];
    float4 m_47 [[color(6)]];
    float4 m_49 [[color(7)]];
};

struct main0_in
{
    float4 m_32_0 [[user(locn0)]];
    float4 m_32_1 [[user(locn1)]];
    float4 m_32_2 [[user(locn2)]];
    float4 m_32_3 [[user(locn3)]];
    float4 m_32_4 [[user(locn4)]];
    float4 m_32_5 [[user(locn5)]];
    float4 m_32_6 [[user(locn6)]];
    float4 m_32_7 [[user(locn7)]];
    float4 m_32_8 [[user(locn8)]];
    float4 m_32_9 [[user(locn9)]];
    float4 m_32_10 [[user(locn10)]];
    float4 m_32_11 [[user(locn11)]];
    float4 m_32_12 [[user(locn12)]];
    float4 m_32_13 [[user(locn13)]];
    float4 m_32_14 [[user(locn14)]];
    float4 m_32_15 [[user(locn15)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    spvUnsafeArray<float4, 16> _32 = {};
    _32[0] = in.m_32_0;
    _32[1] = in.m_32_1;
    _32[2] = in.m_32_2;
    _32[3] = in.m_32_3;
    _32[4] = in.m_32_4;
    _32[5] = in.m_32_5;
    _32[6] = in.m_32_6;
    _32[7] = in.m_32_7;
    _32[8] = in.m_32_8;
    _32[9] = in.m_32_9;
    _32[10] = in.m_32_10;
    _32[11] = in.m_32_11;
    _32[12] = in.m_32_12;
    _32[13] = in.m_32_13;
    _32[14] = in.m_32_14;
    _32[15] = in.m_32_15;
    bool _838 = false;
    bool _836 = false;
    float _56 = gl_FragCoord.w;
    float _58 = 1.0 / _56;
    int _61 = 0;
    int _63 = 0;
    int _65 = 0;
    int _67 = 0;
    int _69 = 0;
    int _71 = 0;
    int _73 = 0;
    int _75 = 0;
    int _77 = 0;
    int _79 = 0;
    int _81 = 0;
    int _83 = 0;
    int _85 = 0;
    int _87 = 0;
    int _89 = 0;
    int _91 = 0;
    int _93 = 0;
    int _95 = 0;
    int _97 = 0;
    int _99 = 0;
    int _101 = 0;
    int _103 = 0;
    int _105 = 0;
    int _107 = 0;
    int _109 = 0;
    int _111 = 0;
    int _113 = 0;
    int _115 = 0;
    int _117 = 0;
    int _119 = 0;
    int _121 = 0;
    int _123 = 0;
    int _125 = 0;
    int _127 = 0;
    bool _131;
    bool _474;
    bool _860;
    bool _882;
    int _884;
    int _886;
    int _888;
    int _890;
    int _892;
    int _894;
    int _896;
    int _898;
    int _900;
    int _902;
    int _904;
    int _906;
    int _908;
    int _910;
    int _912;
    int _914;
    int _916;
    int _918;
    int _920;
    int _922;
    int _924;
    int _926;
    int _928;
    int _930;
    int _932;
    int _934;
    int _936;
    int _938;
    int _940;
    int _942;
    int _944;
    int _946;
    do
    {
        int _133 = _61;
        int _135 = _63;
        int _137 = _65;
        int _139 = _67;
        int _141 = _69;
        int _143 = _71;
        int _145 = _73;
        int _147 = _75;
        int _149 = _77;
        int _151 = _79;
        int _153 = _81;
        int _155 = _83;
        int _157 = _85;
        int _159 = _87;
        int _161 = _89;
        int _163 = _91;
        int _165 = _93;
        int _167 = _95;
        int _169 = _97;
        int _171 = _99;
        int _173 = _101;
        int _175 = _103;
        int _177 = _105;
        int _179 = _107;
        int _181 = _109;
        int _183 = _111;
        int _185 = _113;
        int _187 = _115;
        int _189 = _117;
        int _191 = _119;
        int _193 = _121;
        int _195 = _123;
        int _197 = _125;
        int _199 = _127;
        int _201 = _133 << 4;
        float _203 = trunc((*spvDescriptorSet0.fp_c3)._m0[0].y);
        int _205 = int(_203);
        int _207 = _201 + 132;
        int _209 = _207 - 128;
        uint _212 = uint(int(uint(_209) >> uint(4)));
        uint _214 = uint(int(uint(_209) >> uint(2)));
        int _216 = int(_214) & 3;
        float _218 = _32[int(_212)][_216];
        float _220 = gl_FragCoord.w;
        float _222 = _218 * _220;
        int _224 = _201 + 128;
        int _226 = _224 - 128;
        uint _228 = uint(int(uint(_226) >> uint(4)));
        uint _230 = uint(int(uint(_226) >> uint(2)));
        int _232 = int(_230) & 3;
        float _234 = _32[int(_228)][_232];
        float _236 = gl_FragCoord.w;
        float _238 = _234 * _236;
        int _240 = _201 + 136;
        int _242 = _240 - 128;
        uint _244 = uint(int(uint(_242) >> uint(4)));
        uint _246 = uint(int(uint(_242) >> uint(2)));
        int _248 = int(_246) & 3;
        float _250 = _32[int(_244)][_248];
        float _252 = gl_FragCoord.w;
        float _254 = _250 * _252;
        bool _256 = _205 > 0;
        float _258 = _58 * _222;
        float _260 = _58 * _238;
        float _262 = _58 * _254;
        float _264 = _258 * _258;
        float _266 = fma(_260, _260, _264);
        float _268 = fma(_262, _262, _266);
        float _270 = rsqrt(_268);
        float _272 = _262 * _270;
        float _274 = _260 * _270;
        float _276 = _258 * _270;
        float _278 = abs(_272);
        bool _280 = _278 >= 0.999000012874603271484375;
        bool _282 = isnan(_278);
        bool _284 = _280 || _282;
        bool _286 = isnan(0.999000012874603271484375);
        bool _288 = _284 || _286;
        float _290 = float(_288);
        float _292 = abs(_272);
        bool _294 = _292 < 0.999000012874603271484375;
        float _296 = float(_294);
        float _298 = _272 * _290;
        float _300 = _276 * _290;
        float _302 = -_298;
        float _304 = fma(_274, _296, _302);
        float _306 = _276 * _296;
        float _308 = _304 * _304;
        float _310 = fma(_306, _306, _308);
        float _312 = fma(_300, _300, _310);
        float _314 = rsqrt(_312);
        float _316 = _306 * _314;
        float _318 = _304 * _314;
        float _320 = _300 * _314;
        bool _322 = !_256;
        float _324 = 0.0;
        float _326 = 0.0;
        float _328 = 0.0;
        float _330 = 0.0;
        int _332 = _135;
        float _334 = 0.0;
        float _336 = 0.0;
        float _338 = 0.0;
        float _340 = 0.0;
        int _342 = _177;
        int _344 = _169;
        int _346 = _179;
        int _348 = _171;
        int _350 = _181;
        int _352 = _173;
        int _354 = _183;
        int _356 = _175;
        int _358 = _161;
        int _360 = _153;
        int _362 = _163;
        int _364 = _155;
        int _366 = _165;
        int _368 = _157;
        int _370 = _167;
        int _372 = _159;
        int _374 = _137;
        int _376 = _139;
        int _378 = _141;
        int _380 = _143;
        int _382 = _145;
        int _384 = _147;
        int _386 = _149;
        int _388 = _151;
        int _390 = _153;
        int _392 = _155;
        int _394 = _157;
        int _396 = _159;
        int _398 = _161;
        int _400 = _163;
        int _402 = _165;
        int _404 = _167;
        int _406 = _169;
        int _408 = _171;
        int _410 = _173;
        int _412 = _175;
        int _414 = _177;
        int _416 = _179;
        int _418 = _181;
        int _420 = _183;
        int _422 = _185;
        int _424 = _187;
        int _426 = _189;
        int _428 = _191;
        int _430 = _193;
        int _432 = _195;
        int _434 = _197;
        int _436 = _199;
        if (!_322)
        {
            float _438 = float(uint(_205));
            float _440 = _272 * _318;
            float _442 = _274 * _320;
            float _444 = -_316;
            float _446 = _276 * _444;
            float _448 = -_440;
            float _450 = fma(_276, _320, _448);
            float _452 = 1.0 / _438;
            float _454 = precise::max((*spvDescriptorSet0.fp_c3)._m0[0].x, 9.9999997473787516355514526367188e-05);
            float _456 = -_316;
            float _458 = -_442;
            float _460 = fma(_272, _456, _458);
            float _462 = -_446;
            float _464 = fma(_274, _318, _462);
            float _466 = _454 * _454;
            float _468 = fma(_466, _466, -1.0);
            float _470 = _452 * 6.283185482025146484375;
            int _472 = 0;
            do
            {
                int _476 = _472;
                float _478 = _324;
                float _480 = _326;
                float _482 = _328;
                float _484 = _330;
                int _486 = _476 << 16;
                uint _488 = uint(int(uint(_476) >> uint(16)));
                int _490 = _486 | int(_488);
                float _492 = float(uint(_476));
                int _494 = _490 & (-1431655766);
                int _496 = _490 & 1431655765;
                float _498 = _492 * _470;
                uint _500 = uint(int(uint(_494) >> uint(1)));
                float _502 = _498 * 0.15915493667125701904296875;
                int _504 = _496 << 1;
                int _506 = _504 + int(_500);
                float _508 = _502 * 6.283185482025146484375;
                float _510 = sin(_508);
                int _512 = _506 & (-858993460);
                int _514 = _506 & 858993459;
                uint _516 = uint(int(uint(_512) >> uint(2)));
                float _518 = _502 * 6.283185482025146484375;
                float _520 = cos(_518);
                int _522 = _514 << 2;
                int _524 = _522 + int(_516);
                int _526 = _524 & (-252645136);
                int _528 = _524 & 252645135;
                uint _530 = uint(int(uint(_526) >> uint(4)));
                int _532 = _528 << 4;
                int _534 = _532 + int(_530);
                int _536 = _534 & (-16711936);
                int _538 = _534 & 16711935;
                uint _540 = uint(int(uint(_536) >> uint(8)));
                int _542 = _538 << 8;
                int _544 = _542 + int(_540);
                float _546 = float(uint(_544));
                float _548 = _546 * 2.3283064365386962890625e-10;
                float _550 = fma(_548, _468, 1.0);
                float _552 = -_548;
                float _554 = _552 + 1.0;
                float _556 = 1.0 / _550;
                float _558 = -_554;
                float _560 = fma(_558, _556, 1.0);
                float _562 = _554 * _556;
                float _564 = sqrt(_560);
                float _566 = sqrt(_562);
                float _568 = _564 * _510;
                float _570 = _564 * _520;
                float _572 = _460 * _568;
                float _574 = _450 * _568;
                float _576 = _464 * _568;
                float _578 = fma(_318, _570, _572);
                float _580 = -_316;
                float _582 = fma(_580, _570, _574);
                float _584 = fma(_320, _570, _576);
                float _586 = fma(_276, _566, _578);
                float _588 = fma(_274, _566, _582);
                float _590 = fma(_272, _566, _584);
                float _592 = _276 * _586;
                float _594 = fma(_274, _588, _592);
                float _596 = fma(_272, _590, _594);
                float _598 = _596 * 2.0;
                float _600 = -_276;
                float _602 = fma(_586, _598, _600);
                float _604 = -_274;
                float _606 = fma(_588, _598, _604);
                float _608 = -_272;
                float _610 = fma(_590, _598, _608);
                float _612 = _276 * _602;
                float _614 = fma(_274, _606, _612);
                float _616 = fma(_272, _610, _614);
                float _618 = precise::clamp(_616, 0.0, 1.0);
                bool _620 = _618 > 0.0;
                bool _622 = !_620;
                float _624 = _502;
                int _626 = as_type<int>(_614);
                float _628 = _478;
                float _630 = _480;
                float _632 = _482;
                float _634 = _484;
                if (!_622)
                {
                    float _636 = precise::max(_596, 9.9999999392252902907785028219223e-09);
                    bool _638 = _454 >= 0.00999999977648258209228515625;
                    bool _640 = isnan(_454);
                    bool _642 = _638 || _640;
                    bool _644 = isnan(0.00999999977648258209228515625);
                    bool _646 = _642 || _644;
                    float _648 = _636 * _636;
                    float _650 = _636 * 4.0;
                    float _652 = fma(_468, _648, 1.0);
                    float _654 = 1.0 / _650;
                    float _656 = precise::max(_652, 9.9999999392252902907785028219223e-09);
                    int _658 = as_type<int>(_654);
                    if (_646)
                    {
                        _624 = (*spvDescriptorSet0.fp_c3)._m0[0].w;
                    }
                    float _660 = _624;
                    float _662 = 1.0 / _656;
                    float _664 = _660;
                    if (_646)
                    {
                        float _666 = _660 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
                        _664 = _666;
                    }
                    float _668 = _664;
                    float _670 = _466 * _662;
                    float _672 = abs(_606);
                    float _674 = abs(_602);
                    float _676 = precise::max(_672, _674);
                    float _678 = _670 * _670;
                    float _680 = abs(_610);
                    float _682 = precise::max(_680, _676);
                    float _684 = _670;
                    if (_646)
                    {
                        float _686 = 1.0 / _668;
                        _684 = _686;
                    }
                    float _688 = _684;
                    float _690 = _678 * 0.3183098733425140380859375;
                    float _692 = _636 * _690;
                    float _694 = 1.0 / _682;
                    float _696 = _692 * _654;
                    float _698 = _692;
                    float _700 = _696;
                    if (_646)
                    {
                        float _702 = float(_205);
                        _698 = _702;
                    }
                    float _704 = _698;
                    float _706 = _704;
                    if (_646)
                    {
                        float _708 = _696 * _704;
                        _706 = _708;
                    }
                    float _710 = _706;
                    float _712 = _688;
                    if (_646)
                    {
                        float _714 = _688 * 2.094395160675048828125;
                        _712 = _714;
                    }
                    float _716 = _712;
                    float _718 = _716;
                    if (_646)
                    {
                        float _720 = _716 * _710;
                        _718 = _720;
                    }
                    float _722 = _718;
                    float _724 = _606 * _694;
                    float _726 = _602 * _694;
                    float _728 = _610 * _694;
                    float _730 = _722;
                    if (_646)
                    {
                        float _732 = 1.0 / _722;
                        _730 = _732;
                    }
                    float _734 = _730;
                    float _736 = _710;
                    if (_646)
                    {
                        float _738 = log2(_734);
                        _736 = _738;
                    }
                    float _740 = _736;
                    if (_646)
                    {
                        float _742 = _740 * 0.5;
                        _658 = as_type<int>(_742);
                    }
                    int _744 = _658;
                    float _746 = rint((*spvDescriptorSet0.fp_c3)._m0[1].x);
                    float _748 = precise::max(_746, 0.0);
                    uint _750 = uint(_748);
                    uint _752 = clamp(_750, 0u, 65535u);
                    int _754 = _744;
                    if (_646)
                    {
                        float _756 = precise::max(0.0, as_type<float>(_744));
                        _700 = _756;
                    }
                    float _758 = _700;
                    if (!_646)
                    {
                        _754 = 0;
                    }
                    int _760 = _754;
                    int _762 = _760;
                    float _764 = as_type<float>(_760);
                    if (_646)
                    {
                        float _766 = precise::min(_758, (*spvDescriptorSet0.fp_c3)._m0[0].z);
                        _762 = as_type<int>(_766);
                        _764 = _766;
                    }
                    int _768 = _762;
                    float _770 = _764;
                    float4 _1701 = float4(_724, _726, _728, float(int(_752)));
                    float4 _1705 = select(_1701, float4(0.0), isnan(_1701));
                    float3 _774 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1705.xyz, uint(rint(_1705.w)), level(_770)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1705.xyz, uint(rint(_1705.w)), level(_770)).xyz;
                    float _776 = _774.x;
                    float _778 = _774.y;
                    float _780 = _774.z;
                    float _782 = _618 + _478;
                    float _784 = fma(_618, _776, _480);
                    float _786 = fma(_618, _778, _482);
                    float _788 = fma(_618, _780, _484);
                    _626 = _768;
                    _628 = _782;
                    _630 = _784;
                    _632 = _786;
                    _634 = _788;
                }
                int _790 = _626;
                float _792 = _628;
                float _794 = _630;
                float _796 = _632;
                float _798 = _634;
                int _800 = _476 + 1;
                bool _802 = _205 <= _800;
                _474 = !_802;
                _472 = _800;
                _324 = _792;
                _326 = _794;
                _328 = _796;
                _330 = _798;
                _332 = _790;
                _334 = _792;
                _336 = _794;
                _338 = _796;
                _340 = _798;
            } while (_474);
        }
        int _804 = _332;
        float _806 = _334;
        float _808 = _336;
        float _810 = _338;
        float _812 = _340;
        bool _814 = _133 >= 4;
        float _816 = 1.0 / _806;
        float _818 = _816 * _808;
        float _820 = _816 * _810;
        float _822 = _816 * _812;
        bool _824 = !_814;
        _63 = _804;
        if (!_824)
        {
            bool _826 = _133 >= 6;
            bool _828 = !_826;
            if (!_828)
            {
                bool _830 = _133 >= 7;
                bool _832 = !_830;
                if (!_832)
                {
                    bool _834 = _133 != 7;
                    _836 = _834;
                    if (!_836)
                    {
                        _430 = as_type<int>(_818);
                        _432 = as_type<int>(_820);
                        _434 = as_type<int>(_822);
                        _436 = 1065353216;
                        _838 = true;
                    }
                }
                else
                {
                    _422 = as_type<int>(_818);
                    _424 = as_type<int>(_820);
                    _426 = as_type<int>(_822);
                    _428 = 1065353216;
                    _838 = true;
                }
            }
            else
            {
                bool _840 = _133 >= 5;
                if (_840)
                {
                    _342 = as_type<int>(_818);
                }
                int _842 = _342;
                _414 = _842;
                if (!_840)
                {
                    _344 = as_type<int>(_818);
                }
                int _844 = _344;
                _406 = _844;
                if (_840)
                {
                    _346 = as_type<int>(_820);
                }
                int _846 = _346;
                _416 = _846;
                if (!_840)
                {
                    _348 = as_type<int>(_820);
                }
                int _848 = _348;
                _408 = _848;
                if (_840)
                {
                    _350 = as_type<int>(_822);
                }
                int _850 = _350;
                _418 = _850;
                if (!_840)
                {
                    _352 = as_type<int>(_822);
                }
                int _852 = _352;
                _410 = _852;
                if (_840)
                {
                    _354 = 1065353216;
                }
                int _854 = _354;
                _420 = _854;
                if (!_840)
                {
                    _356 = 1065353216;
                }
                int _856 = _356;
                _412 = _856;
                _838 = true;
            }
        }
        if ((!_838) || _836)
        {
            if (!_836)
            {
                bool _858 = _133 >= 2;
                _860 = !_858;
            }
            if ((!_860) && (!_836))
            {
                bool _862 = _133 >= 3;
                if (_862)
                {
                    _358 = as_type<int>(_818);
                }
                int _864 = _358;
                _398 = _864;
                if (!_862)
                {
                    _360 = as_type<int>(_818);
                }
                int _866 = _360;
                _390 = _866;
                if (_862)
                {
                    _362 = as_type<int>(_820);
                }
                int _868 = _362;
                _400 = _868;
                if (!_862)
                {
                    _364 = as_type<int>(_820);
                }
                int _870 = _364;
                _392 = _870;
                if (_862)
                {
                    _366 = as_type<int>(_822);
                }
                int _872 = _366;
                _402 = _872;
                if (!_862)
                {
                    _368 = as_type<int>(_822);
                }
                int _874 = _368;
                _394 = _874;
                if (_862)
                {
                    _370 = 1065353216;
                }
                int _876 = _370;
                _404 = _876;
                if (!_862)
                {
                    _372 = 1065353216;
                }
                int _878 = _372;
                _396 = _878;
                _838 = true;
            }
            else
            {
                if (!_836)
                {
                    bool _880 = _133 != 1;
                    _882 = !_880;
                }
                if ((!_882) || _836)
                {
                    _836 = false;
                    _374 = as_type<int>(_818);
                    _376 = as_type<int>(_820);
                    _378 = as_type<int>(_822);
                    _380 = 1065353216;
                    _838 = true;
                }
                else
                {
                    _382 = as_type<int>(_818);
                    _384 = as_type<int>(_820);
                    _386 = as_type<int>(_822);
                    _388 = 1065353216;
                }
            }
        }
        _838 = false;
        _884 = _374;
        _886 = _376;
        _888 = _378;
        _890 = _380;
        _892 = _382;
        _894 = _384;
        _896 = _386;
        _898 = _388;
        _900 = _390;
        _902 = _392;
        _904 = _394;
        _906 = _396;
        _908 = _398;
        _910 = _400;
        _912 = _402;
        _914 = _404;
        _916 = _406;
        _918 = _408;
        _920 = _410;
        _922 = _412;
        _924 = _414;
        _926 = _416;
        _928 = _418;
        _930 = _420;
        _932 = _422;
        _934 = _424;
        _936 = _426;
        _938 = _428;
        _940 = _430;
        _942 = _432;
        _944 = _434;
        _946 = _436;
        int _948 = _133 + 1;
        bool _950 = _948 >= 6;
        _131 = !_950;
        _61 = _948;
        _65 = _884;
        _67 = _886;
        _69 = _888;
        _71 = _890;
        _73 = _892;
        _75 = _894;
        _77 = _896;
        _79 = _898;
        _81 = _900;
        _83 = _902;
        _85 = _904;
        _87 = _906;
        _89 = _908;
        _91 = _910;
        _93 = _912;
        _95 = _914;
        _97 = _916;
        _99 = _918;
        _101 = _920;
        _103 = _922;
        _105 = _924;
        _107 = _926;
        _109 = _928;
        _111 = _930;
        _113 = _932;
        _115 = _934;
        _117 = _936;
        _119 = _938;
        _121 = _940;
        _123 = _942;
        _125 = _944;
        _127 = _946;
    } while (_131);
    out.m_35.x = as_type<float>(_884);
    out.m_35.y = as_type<float>(_886);
    out.m_35.z = as_type<float>(_888);
    out.m_35.w = as_type<float>(_890);
    out.m_37.x = as_type<float>(_892);
    out.m_37.y = as_type<float>(_894);
    out.m_37.z = as_type<float>(_896);
    out.m_37.w = as_type<float>(_898);
    out.m_39.x = as_type<float>(_900);
    out.m_39.y = as_type<float>(_902);
    out.m_39.z = as_type<float>(_904);
    out.m_39.w = as_type<float>(_906);
    out.m_41.x = as_type<float>(_908);
    out.m_41.y = as_type<float>(_910);
    out.m_41.z = as_type<float>(_912);
    out.m_41.w = as_type<float>(_914);
    out.m_43.x = as_type<float>(_916);
    out.m_43.y = as_type<float>(_918);
    out.m_43.z = as_type<float>(_920);
    out.m_43.w = as_type<float>(_922);
    out.m_45.x = as_type<float>(_924);
    out.m_45.y = as_type<float>(_926);
    out.m_45.z = as_type<float>(_928);
    out.m_45.w = as_type<float>(_930);
    out.m_47.x = as_type<float>(_932);
    out.m_47.y = as_type<float>(_934);
    out.m_47.z = as_type<float>(_936);
    out.m_47.w = as_type<float>(_938);
    out.m_49.x = as_type<float>(_940);
    out.m_49.y = as_type<float>(_942);
    out.m_49.z = as_type<float>(_944);
    out.m_49.w = as_type<float>(_946);
    return out;
}


struct main0_out_u
{
    uint4 m_35 [[color(0)]];
    uint4 m_37 [[color(1)]];
    uint4 m_39 [[color(2)]];
    uint4 m_41 [[color(3)]];
    uint4 m_43 [[color(4)]];
    uint4 m_45 [[color(5)]];
    uint4 m_47 [[color(6)]];
    uint4 m_49 [[color(7)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    spvUnsafeArray<float4, 16> _32 = {};
    _32[0] = in.m_32_0;
    _32[1] = in.m_32_1;
    _32[2] = in.m_32_2;
    _32[3] = in.m_32_3;
    _32[4] = in.m_32_4;
    _32[5] = in.m_32_5;
    _32[6] = in.m_32_6;
    _32[7] = in.m_32_7;
    _32[8] = in.m_32_8;
    _32[9] = in.m_32_9;
    _32[10] = in.m_32_10;
    _32[11] = in.m_32_11;
    _32[12] = in.m_32_12;
    _32[13] = in.m_32_13;
    _32[14] = in.m_32_14;
    _32[15] = in.m_32_15;
    bool _838 = false;
    bool _836 = false;
    float _56 = gl_FragCoord.w;
    float _58 = 1.0 / _56;
    int _61 = 0;
    int _63 = 0;
    int _65 = 0;
    int _67 = 0;
    int _69 = 0;
    int _71 = 0;
    int _73 = 0;
    int _75 = 0;
    int _77 = 0;
    int _79 = 0;
    int _81 = 0;
    int _83 = 0;
    int _85 = 0;
    int _87 = 0;
    int _89 = 0;
    int _91 = 0;
    int _93 = 0;
    int _95 = 0;
    int _97 = 0;
    int _99 = 0;
    int _101 = 0;
    int _103 = 0;
    int _105 = 0;
    int _107 = 0;
    int _109 = 0;
    int _111 = 0;
    int _113 = 0;
    int _115 = 0;
    int _117 = 0;
    int _119 = 0;
    int _121 = 0;
    int _123 = 0;
    int _125 = 0;
    int _127 = 0;
    bool _131;
    bool _474;
    bool _860;
    bool _882;
    int _884;
    int _886;
    int _888;
    int _890;
    int _892;
    int _894;
    int _896;
    int _898;
    int _900;
    int _902;
    int _904;
    int _906;
    int _908;
    int _910;
    int _912;
    int _914;
    int _916;
    int _918;
    int _920;
    int _922;
    int _924;
    int _926;
    int _928;
    int _930;
    int _932;
    int _934;
    int _936;
    int _938;
    int _940;
    int _942;
    int _944;
    int _946;
    do
    {
        int _133 = _61;
        int _135 = _63;
        int _137 = _65;
        int _139 = _67;
        int _141 = _69;
        int _143 = _71;
        int _145 = _73;
        int _147 = _75;
        int _149 = _77;
        int _151 = _79;
        int _153 = _81;
        int _155 = _83;
        int _157 = _85;
        int _159 = _87;
        int _161 = _89;
        int _163 = _91;
        int _165 = _93;
        int _167 = _95;
        int _169 = _97;
        int _171 = _99;
        int _173 = _101;
        int _175 = _103;
        int _177 = _105;
        int _179 = _107;
        int _181 = _109;
        int _183 = _111;
        int _185 = _113;
        int _187 = _115;
        int _189 = _117;
        int _191 = _119;
        int _193 = _121;
        int _195 = _123;
        int _197 = _125;
        int _199 = _127;
        int _201 = _133 << 4;
        float _203 = trunc((*spvDescriptorSet0.fp_c3)._m0[0].y);
        int _205 = int(_203);
        int _207 = _201 + 132;
        int _209 = _207 - 128;
        uint _212 = uint(int(uint(_209) >> uint(4)));
        uint _214 = uint(int(uint(_209) >> uint(2)));
        int _216 = int(_214) & 3;
        float _218 = _32[int(_212)][_216];
        float _220 = gl_FragCoord.w;
        float _222 = _218 * _220;
        int _224 = _201 + 128;
        int _226 = _224 - 128;
        uint _228 = uint(int(uint(_226) >> uint(4)));
        uint _230 = uint(int(uint(_226) >> uint(2)));
        int _232 = int(_230) & 3;
        float _234 = _32[int(_228)][_232];
        float _236 = gl_FragCoord.w;
        float _238 = _234 * _236;
        int _240 = _201 + 136;
        int _242 = _240 - 128;
        uint _244 = uint(int(uint(_242) >> uint(4)));
        uint _246 = uint(int(uint(_242) >> uint(2)));
        int _248 = int(_246) & 3;
        float _250 = _32[int(_244)][_248];
        float _252 = gl_FragCoord.w;
        float _254 = _250 * _252;
        bool _256 = _205 > 0;
        float _258 = _58 * _222;
        float _260 = _58 * _238;
        float _262 = _58 * _254;
        float _264 = _258 * _258;
        float _266 = fma(_260, _260, _264);
        float _268 = fma(_262, _262, _266);
        float _270 = rsqrt(_268);
        float _272 = _262 * _270;
        float _274 = _260 * _270;
        float _276 = _258 * _270;
        float _278 = abs(_272);
        bool _280 = _278 >= 0.999000012874603271484375;
        bool _282 = isnan(_278);
        bool _284 = _280 || _282;
        bool _286 = isnan(0.999000012874603271484375);
        bool _288 = _284 || _286;
        float _290 = float(_288);
        float _292 = abs(_272);
        bool _294 = _292 < 0.999000012874603271484375;
        float _296 = float(_294);
        float _298 = _272 * _290;
        float _300 = _276 * _290;
        float _302 = -_298;
        float _304 = fma(_274, _296, _302);
        float _306 = _276 * _296;
        float _308 = _304 * _304;
        float _310 = fma(_306, _306, _308);
        float _312 = fma(_300, _300, _310);
        float _314 = rsqrt(_312);
        float _316 = _306 * _314;
        float _318 = _304 * _314;
        float _320 = _300 * _314;
        bool _322 = !_256;
        float _324 = 0.0;
        float _326 = 0.0;
        float _328 = 0.0;
        float _330 = 0.0;
        int _332 = _135;
        float _334 = 0.0;
        float _336 = 0.0;
        float _338 = 0.0;
        float _340 = 0.0;
        int _342 = _177;
        int _344 = _169;
        int _346 = _179;
        int _348 = _171;
        int _350 = _181;
        int _352 = _173;
        int _354 = _183;
        int _356 = _175;
        int _358 = _161;
        int _360 = _153;
        int _362 = _163;
        int _364 = _155;
        int _366 = _165;
        int _368 = _157;
        int _370 = _167;
        int _372 = _159;
        int _374 = _137;
        int _376 = _139;
        int _378 = _141;
        int _380 = _143;
        int _382 = _145;
        int _384 = _147;
        int _386 = _149;
        int _388 = _151;
        int _390 = _153;
        int _392 = _155;
        int _394 = _157;
        int _396 = _159;
        int _398 = _161;
        int _400 = _163;
        int _402 = _165;
        int _404 = _167;
        int _406 = _169;
        int _408 = _171;
        int _410 = _173;
        int _412 = _175;
        int _414 = _177;
        int _416 = _179;
        int _418 = _181;
        int _420 = _183;
        int _422 = _185;
        int _424 = _187;
        int _426 = _189;
        int _428 = _191;
        int _430 = _193;
        int _432 = _195;
        int _434 = _197;
        int _436 = _199;
        if (!_322)
        {
            float _438 = float(uint(_205));
            float _440 = _272 * _318;
            float _442 = _274 * _320;
            float _444 = -_316;
            float _446 = _276 * _444;
            float _448 = -_440;
            float _450 = fma(_276, _320, _448);
            float _452 = 1.0 / _438;
            float _454 = precise::max((*spvDescriptorSet0.fp_c3)._m0[0].x, 9.9999997473787516355514526367188e-05);
            float _456 = -_316;
            float _458 = -_442;
            float _460 = fma(_272, _456, _458);
            float _462 = -_446;
            float _464 = fma(_274, _318, _462);
            float _466 = _454 * _454;
            float _468 = fma(_466, _466, -1.0);
            float _470 = _452 * 6.283185482025146484375;
            int _472 = 0;
            do
            {
                int _476 = _472;
                float _478 = _324;
                float _480 = _326;
                float _482 = _328;
                float _484 = _330;
                int _486 = _476 << 16;
                uint _488 = uint(int(uint(_476) >> uint(16)));
                int _490 = _486 | int(_488);
                float _492 = float(uint(_476));
                int _494 = _490 & (-1431655766);
                int _496 = _490 & 1431655765;
                float _498 = _492 * _470;
                uint _500 = uint(int(uint(_494) >> uint(1)));
                float _502 = _498 * 0.15915493667125701904296875;
                int _504 = _496 << 1;
                int _506 = _504 + int(_500);
                float _508 = _502 * 6.283185482025146484375;
                float _510 = sin(_508);
                int _512 = _506 & (-858993460);
                int _514 = _506 & 858993459;
                uint _516 = uint(int(uint(_512) >> uint(2)));
                float _518 = _502 * 6.283185482025146484375;
                float _520 = cos(_518);
                int _522 = _514 << 2;
                int _524 = _522 + int(_516);
                int _526 = _524 & (-252645136);
                int _528 = _524 & 252645135;
                uint _530 = uint(int(uint(_526) >> uint(4)));
                int _532 = _528 << 4;
                int _534 = _532 + int(_530);
                int _536 = _534 & (-16711936);
                int _538 = _534 & 16711935;
                uint _540 = uint(int(uint(_536) >> uint(8)));
                int _542 = _538 << 8;
                int _544 = _542 + int(_540);
                float _546 = float(uint(_544));
                float _548 = _546 * 2.3283064365386962890625e-10;
                float _550 = fma(_548, _468, 1.0);
                float _552 = -_548;
                float _554 = _552 + 1.0;
                float _556 = 1.0 / _550;
                float _558 = -_554;
                float _560 = fma(_558, _556, 1.0);
                float _562 = _554 * _556;
                float _564 = sqrt(_560);
                float _566 = sqrt(_562);
                float _568 = _564 * _510;
                float _570 = _564 * _520;
                float _572 = _460 * _568;
                float _574 = _450 * _568;
                float _576 = _464 * _568;
                float _578 = fma(_318, _570, _572);
                float _580 = -_316;
                float _582 = fma(_580, _570, _574);
                float _584 = fma(_320, _570, _576);
                float _586 = fma(_276, _566, _578);
                float _588 = fma(_274, _566, _582);
                float _590 = fma(_272, _566, _584);
                float _592 = _276 * _586;
                float _594 = fma(_274, _588, _592);
                float _596 = fma(_272, _590, _594);
                float _598 = _596 * 2.0;
                float _600 = -_276;
                float _602 = fma(_586, _598, _600);
                float _604 = -_274;
                float _606 = fma(_588, _598, _604);
                float _608 = -_272;
                float _610 = fma(_590, _598, _608);
                float _612 = _276 * _602;
                float _614 = fma(_274, _606, _612);
                float _616 = fma(_272, _610, _614);
                float _618 = precise::clamp(_616, 0.0, 1.0);
                bool _620 = _618 > 0.0;
                bool _622 = !_620;
                float _624 = _502;
                int _626 = as_type<int>(_614);
                float _628 = _478;
                float _630 = _480;
                float _632 = _482;
                float _634 = _484;
                if (!_622)
                {
                    float _636 = precise::max(_596, 9.9999999392252902907785028219223e-09);
                    bool _638 = _454 >= 0.00999999977648258209228515625;
                    bool _640 = isnan(_454);
                    bool _642 = _638 || _640;
                    bool _644 = isnan(0.00999999977648258209228515625);
                    bool _646 = _642 || _644;
                    float _648 = _636 * _636;
                    float _650 = _636 * 4.0;
                    float _652 = fma(_468, _648, 1.0);
                    float _654 = 1.0 / _650;
                    float _656 = precise::max(_652, 9.9999999392252902907785028219223e-09);
                    int _658 = as_type<int>(_654);
                    if (_646)
                    {
                        _624 = (*spvDescriptorSet0.fp_c3)._m0[0].w;
                    }
                    float _660 = _624;
                    float _662 = 1.0 / _656;
                    float _664 = _660;
                    if (_646)
                    {
                        float _666 = _660 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
                        _664 = _666;
                    }
                    float _668 = _664;
                    float _670 = _466 * _662;
                    float _672 = abs(_606);
                    float _674 = abs(_602);
                    float _676 = precise::max(_672, _674);
                    float _678 = _670 * _670;
                    float _680 = abs(_610);
                    float _682 = precise::max(_680, _676);
                    float _684 = _670;
                    if (_646)
                    {
                        float _686 = 1.0 / _668;
                        _684 = _686;
                    }
                    float _688 = _684;
                    float _690 = _678 * 0.3183098733425140380859375;
                    float _692 = _636 * _690;
                    float _694 = 1.0 / _682;
                    float _696 = _692 * _654;
                    float _698 = _692;
                    float _700 = _696;
                    if (_646)
                    {
                        float _702 = float(_205);
                        _698 = _702;
                    }
                    float _704 = _698;
                    float _706 = _704;
                    if (_646)
                    {
                        float _708 = _696 * _704;
                        _706 = _708;
                    }
                    float _710 = _706;
                    float _712 = _688;
                    if (_646)
                    {
                        float _714 = _688 * 2.094395160675048828125;
                        _712 = _714;
                    }
                    float _716 = _712;
                    float _718 = _716;
                    if (_646)
                    {
                        float _720 = _716 * _710;
                        _718 = _720;
                    }
                    float _722 = _718;
                    float _724 = _606 * _694;
                    float _726 = _602 * _694;
                    float _728 = _610 * _694;
                    float _730 = _722;
                    if (_646)
                    {
                        float _732 = 1.0 / _722;
                        _730 = _732;
                    }
                    float _734 = _730;
                    float _736 = _710;
                    if (_646)
                    {
                        float _738 = log2(_734);
                        _736 = _738;
                    }
                    float _740 = _736;
                    if (_646)
                    {
                        float _742 = _740 * 0.5;
                        _658 = as_type<int>(_742);
                    }
                    int _744 = _658;
                    float _746 = rint((*spvDescriptorSet0.fp_c3)._m0[1].x);
                    float _748 = precise::max(_746, 0.0);
                    uint _750 = uint(_748);
                    uint _752 = clamp(_750, 0u, 65535u);
                    int _754 = _744;
                    if (_646)
                    {
                        float _756 = precise::max(0.0, as_type<float>(_744));
                        _700 = _756;
                    }
                    float _758 = _700;
                    if (!_646)
                    {
                        _754 = 0;
                    }
                    int _760 = _754;
                    int _762 = _760;
                    float _764 = as_type<float>(_760);
                    if (_646)
                    {
                        float _766 = precise::min(_758, (*spvDescriptorSet0.fp_c3)._m0[0].z);
                        _762 = as_type<int>(_766);
                        _764 = _766;
                    }
                    int _768 = _762;
                    float _770 = _764;
                    float4 _1701 = float4(_724, _726, _728, float(int(_752)));
                    float4 _1705 = select(_1701, float4(0.0), isnan(_1701));
                    float3 _774 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1705.xyz, uint(rint(_1705.w)), level(_770)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1705.xyz, uint(rint(_1705.w)), level(_770)).xyz;
                    float _776 = _774.x;
                    float _778 = _774.y;
                    float _780 = _774.z;
                    float _782 = _618 + _478;
                    float _784 = fma(_618, _776, _480);
                    float _786 = fma(_618, _778, _482);
                    float _788 = fma(_618, _780, _484);
                    _626 = _768;
                    _628 = _782;
                    _630 = _784;
                    _632 = _786;
                    _634 = _788;
                }
                int _790 = _626;
                float _792 = _628;
                float _794 = _630;
                float _796 = _632;
                float _798 = _634;
                int _800 = _476 + 1;
                bool _802 = _205 <= _800;
                _474 = !_802;
                _472 = _800;
                _324 = _792;
                _326 = _794;
                _328 = _796;
                _330 = _798;
                _332 = _790;
                _334 = _792;
                _336 = _794;
                _338 = _796;
                _340 = _798;
            } while (_474);
        }
        int _804 = _332;
        float _806 = _334;
        float _808 = _336;
        float _810 = _338;
        float _812 = _340;
        bool _814 = _133 >= 4;
        float _816 = 1.0 / _806;
        float _818 = _816 * _808;
        float _820 = _816 * _810;
        float _822 = _816 * _812;
        bool _824 = !_814;
        _63 = _804;
        if (!_824)
        {
            bool _826 = _133 >= 6;
            bool _828 = !_826;
            if (!_828)
            {
                bool _830 = _133 >= 7;
                bool _832 = !_830;
                if (!_832)
                {
                    bool _834 = _133 != 7;
                    _836 = _834;
                    if (!_836)
                    {
                        _430 = as_type<int>(_818);
                        _432 = as_type<int>(_820);
                        _434 = as_type<int>(_822);
                        _436 = 1065353216;
                        _838 = true;
                    }
                }
                else
                {
                    _422 = as_type<int>(_818);
                    _424 = as_type<int>(_820);
                    _426 = as_type<int>(_822);
                    _428 = 1065353216;
                    _838 = true;
                }
            }
            else
            {
                bool _840 = _133 >= 5;
                if (_840)
                {
                    _342 = as_type<int>(_818);
                }
                int _842 = _342;
                _414 = _842;
                if (!_840)
                {
                    _344 = as_type<int>(_818);
                }
                int _844 = _344;
                _406 = _844;
                if (_840)
                {
                    _346 = as_type<int>(_820);
                }
                int _846 = _346;
                _416 = _846;
                if (!_840)
                {
                    _348 = as_type<int>(_820);
                }
                int _848 = _348;
                _408 = _848;
                if (_840)
                {
                    _350 = as_type<int>(_822);
                }
                int _850 = _350;
                _418 = _850;
                if (!_840)
                {
                    _352 = as_type<int>(_822);
                }
                int _852 = _352;
                _410 = _852;
                if (_840)
                {
                    _354 = 1065353216;
                }
                int _854 = _354;
                _420 = _854;
                if (!_840)
                {
                    _356 = 1065353216;
                }
                int _856 = _356;
                _412 = _856;
                _838 = true;
            }
        }
        if ((!_838) || _836)
        {
            if (!_836)
            {
                bool _858 = _133 >= 2;
                _860 = !_858;
            }
            if ((!_860) && (!_836))
            {
                bool _862 = _133 >= 3;
                if (_862)
                {
                    _358 = as_type<int>(_818);
                }
                int _864 = _358;
                _398 = _864;
                if (!_862)
                {
                    _360 = as_type<int>(_818);
                }
                int _866 = _360;
                _390 = _866;
                if (_862)
                {
                    _362 = as_type<int>(_820);
                }
                int _868 = _362;
                _400 = _868;
                if (!_862)
                {
                    _364 = as_type<int>(_820);
                }
                int _870 = _364;
                _392 = _870;
                if (_862)
                {
                    _366 = as_type<int>(_822);
                }
                int _872 = _366;
                _402 = _872;
                if (!_862)
                {
                    _368 = as_type<int>(_822);
                }
                int _874 = _368;
                _394 = _874;
                if (_862)
                {
                    _370 = 1065353216;
                }
                int _876 = _370;
                _404 = _876;
                if (!_862)
                {
                    _372 = 1065353216;
                }
                int _878 = _372;
                _396 = _878;
                _838 = true;
            }
            else
            {
                if (!_836)
                {
                    bool _880 = _133 != 1;
                    _882 = !_880;
                }
                if ((!_882) || _836)
                {
                    _836 = false;
                    _374 = as_type<int>(_818);
                    _376 = as_type<int>(_820);
                    _378 = as_type<int>(_822);
                    _380 = 1065353216;
                    _838 = true;
                }
                else
                {
                    _382 = as_type<int>(_818);
                    _384 = as_type<int>(_820);
                    _386 = as_type<int>(_822);
                    _388 = 1065353216;
                }
            }
        }
        _838 = false;
        _884 = _374;
        _886 = _376;
        _888 = _378;
        _890 = _380;
        _892 = _382;
        _894 = _384;
        _896 = _386;
        _898 = _388;
        _900 = _390;
        _902 = _392;
        _904 = _394;
        _906 = _396;
        _908 = _398;
        _910 = _400;
        _912 = _402;
        _914 = _404;
        _916 = _406;
        _918 = _408;
        _920 = _410;
        _922 = _412;
        _924 = _414;
        _926 = _416;
        _928 = _418;
        _930 = _420;
        _932 = _422;
        _934 = _424;
        _936 = _426;
        _938 = _428;
        _940 = _430;
        _942 = _432;
        _944 = _434;
        _946 = _436;
        int _948 = _133 + 1;
        bool _950 = _948 >= 6;
        _131 = !_950;
        _61 = _948;
        _65 = _884;
        _67 = _886;
        _69 = _888;
        _71 = _890;
        _73 = _892;
        _75 = _894;
        _77 = _896;
        _79 = _898;
        _81 = _900;
        _83 = _902;
        _85 = _904;
        _87 = _906;
        _89 = _908;
        _91 = _910;
        _93 = _912;
        _95 = _914;
        _97 = _916;
        _99 = _918;
        _101 = _920;
        _103 = _922;
        _105 = _924;
        _107 = _926;
        _109 = _928;
        _111 = _930;
        _113 = _932;
        _115 = _934;
        _117 = _936;
        _119 = _938;
        _121 = _940;
        _123 = _942;
        _125 = _944;
        _127 = _946;
    } while (_131);
    out.m_35.x = as_type<float>(_884);
    out.m_35.y = as_type<float>(_886);
    out.m_35.z = as_type<float>(_888);
    out.m_35.w = as_type<float>(_890);
    out.m_37.x = as_type<float>(_892);
    out.m_37.y = as_type<float>(_894);
    out.m_37.z = as_type<float>(_896);
    out.m_37.w = as_type<float>(_898);
    out.m_39.x = as_type<float>(_900);
    out.m_39.y = as_type<float>(_902);
    out.m_39.z = as_type<float>(_904);
    out.m_39.w = as_type<float>(_906);
    out.m_41.x = as_type<float>(_908);
    out.m_41.y = as_type<float>(_910);
    out.m_41.z = as_type<float>(_912);
    out.m_41.w = as_type<float>(_914);
    out.m_43.x = as_type<float>(_916);
    out.m_43.y = as_type<float>(_918);
    out.m_43.z = as_type<float>(_920);
    out.m_43.w = as_type<float>(_922);
    out.m_45.x = as_type<float>(_924);
    out.m_45.y = as_type<float>(_926);
    out.m_45.z = as_type<float>(_928);
    out.m_45.w = as_type<float>(_930);
    out.m_47.x = as_type<float>(_932);
    out.m_47.y = as_type<float>(_934);
    out.m_47.z = as_type<float>(_936);
    out.m_47.w = as_type<float>(_938);
    out.m_49.x = as_type<float>(_940);
    out.m_49.y = as_type<float>(_942);
    out.m_49.z = as_type<float>(_944);
    out.m_49.w = as_type<float>(_946);
    return main0_out_u{as_type<uint4>(out.m_35), as_type<uint4>(out.m_37), as_type<uint4>(out.m_39), as_type<uint4>(out.m_41), as_type<uint4>(out.m_43), as_type<uint4>(out.m_45), as_type<uint4>(out.m_47), as_type<uint4>(out.m_49)};
}

