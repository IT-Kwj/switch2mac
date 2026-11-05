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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texturecube_array<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
    float4 m_39 [[color(1)]];
    float4 m_41 [[color(2)]];
    float4 m_43 [[color(3)]];
    float4 m_45 [[color(4)]];
    float4 m_47 [[color(5)]];
    float4 m_49 [[color(6)]];
    float4 m_51 [[color(7)]];
};

struct main0_in
{
    float4 m_34_0 [[user(locn0)]];
    float4 m_34_1 [[user(locn1)]];
    float4 m_34_2 [[user(locn2)]];
    float4 m_34_3 [[user(locn3)]];
    float4 m_34_4 [[user(locn4)]];
    float4 m_34_5 [[user(locn5)]];
    float4 m_34_6 [[user(locn6)]];
    float4 m_34_7 [[user(locn7)]];
    float4 m_34_8 [[user(locn8)]];
    float4 m_34_9 [[user(locn9)]];
    float4 m_34_10 [[user(locn10)]];
    float4 m_34_11 [[user(locn11)]];
    float4 m_34_12 [[user(locn12)]];
    float4 m_34_13 [[user(locn13)]];
    float4 m_34_14 [[user(locn14)]];
    float4 m_34_15 [[user(locn15)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    spvUnsafeArray<float4, 16> _34 = {};
    _34[0] = in.m_34_0;
    _34[1] = in.m_34_1;
    _34[2] = in.m_34_2;
    _34[3] = in.m_34_3;
    _34[4] = in.m_34_4;
    _34[5] = in.m_34_5;
    _34[6] = in.m_34_6;
    _34[7] = in.m_34_7;
    _34[8] = in.m_34_8;
    _34[9] = in.m_34_9;
    _34[10] = in.m_34_10;
    _34[11] = in.m_34_11;
    _34[12] = in.m_34_12;
    _34[13] = in.m_34_13;
    _34[14] = in.m_34_14;
    _34[15] = in.m_34_15;
    bool _624 = false;
    bool _622 = false;
    float _58 = gl_FragCoord.w;
    float _60 = 1.0 / _58;
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
    bool _470;
    float _590;
    float _592;
    float _594;
    bool _646;
    bool _668;
    int _670;
    int _672;
    int _674;
    int _676;
    int _678;
    int _680;
    int _682;
    int _684;
    int _686;
    int _688;
    int _690;
    int _692;
    int _694;
    int _696;
    int _698;
    int _700;
    int _702;
    int _704;
    int _706;
    int _708;
    int _710;
    int _712;
    int _714;
    int _716;
    int _718;
    int _720;
    int _722;
    int _724;
    int _726;
    int _728;
    int _730;
    int _732;
    do
    {
        int _133 = _63;
        int _135 = _65;
        int _137 = _67;
        int _139 = _69;
        int _141 = _71;
        int _143 = _73;
        int _145 = _75;
        int _147 = _77;
        int _149 = _79;
        int _151 = _81;
        int _153 = _83;
        int _155 = _85;
        int _157 = _87;
        int _159 = _89;
        int _161 = _91;
        int _163 = _93;
        int _165 = _95;
        int _167 = _97;
        int _169 = _99;
        int _171 = _101;
        int _173 = _103;
        int _175 = _105;
        int _177 = _107;
        int _179 = _109;
        int _181 = _111;
        int _183 = _113;
        int _185 = _115;
        int _187 = _117;
        int _189 = _119;
        int _191 = _121;
        int _193 = _123;
        int _195 = _125;
        int _197 = _127;
        int _199 = _133 << 4;
        bool _201 = 0.0 < (*spvDescriptorSet0.fp_c3)._m0[0].y;
        int _203 = _199 + 132;
        int _205 = _203 - 128;
        uint _208 = uint(int(uint(_205) >> uint(4)));
        uint _210 = uint(int(uint(_205) >> uint(2)));
        int _212 = int(_210) & 3;
        float _214 = _34[int(_208)][_212];
        float _216 = gl_FragCoord.w;
        float _218 = _214 * _216;
        int _220 = _199 + 128;
        int _222 = _220 - 128;
        uint _224 = uint(int(uint(_222) >> uint(4)));
        uint _226 = uint(int(uint(_222) >> uint(2)));
        int _228 = int(_226) & 3;
        float _230 = _34[int(_224)][_228];
        float _232 = gl_FragCoord.w;
        float _234 = _230 * _232;
        int _236 = _199 + 136;
        int _238 = _236 - 128;
        uint _240 = uint(int(uint(_238) >> uint(4)));
        uint _242 = uint(int(uint(_238) >> uint(2)));
        int _244 = int(_242) & 3;
        float _246 = _34[int(_240)][_244];
        float _248 = gl_FragCoord.w;
        float _250 = _246 * _248;
        float _252 = _60 * _218;
        float _254 = _60 * _234;
        float _256 = _60 * _250;
        float _258 = _252 * _252;
        float _260 = fma(_254, _254, _258);
        float _262 = fma(_256, _256, _260);
        float _264 = rsqrt(_262);
        float _266 = _256 * _264;
        float _268 = _254 * _264;
        float _270 = _252 * _264;
        float _272 = abs(_266);
        bool _274 = _272 >= 0.999000012874603271484375;
        bool _276 = isnan(_272);
        bool _278 = _274 || _276;
        bool _280 = isnan(0.999000012874603271484375);
        bool _282 = _278 || _280;
        float _284 = float(_282);
        float _286 = abs(_266);
        bool _288 = _286 < 0.999000012874603271484375;
        float _290 = float(_288);
        float _292 = _266 * _284;
        float _294 = _270 * _284;
        float _296 = -_292;
        float _298 = fma(_268, _290, _296);
        float _300 = _270 * _290;
        float _302 = _298 * _298;
        float _304 = fma(_300, _300, _302);
        float _306 = fma(_294, _294, _304);
        float _308 = rsqrt(_306);
        float _310 = _300 * _308;
        float _312 = _298 * _308;
        float _314 = _294 * _308;
        float _316 = _264;
        float _318 = _300;
        float _320 = _294;
        int _322 = _175;
        int _324 = _179;
        int _326 = _167;
        int _328 = _177;
        int _330 = _169;
        int _332 = _171;
        int _334 = _181;
        int _336 = _173;
        int _338 = _159;
        int _340 = _161;
        int _342 = _151;
        int _344 = _153;
        int _346 = _163;
        int _348 = _155;
        int _350 = _165;
        int _352 = _157;
        int _354 = _135;
        int _356 = _137;
        int _358 = _139;
        int _360 = _141;
        int _362 = _143;
        int _364 = _145;
        int _366 = _147;
        int _368 = _149;
        int _370 = _151;
        int _372 = _153;
        int _374 = _155;
        int _376 = _157;
        int _378 = _159;
        int _380 = _161;
        int _382 = _163;
        int _384 = _165;
        int _386 = _167;
        int _388 = _169;
        int _390 = _171;
        int _392 = _173;
        int _394 = _175;
        int _396 = _177;
        int _398 = _179;
        int _400 = _181;
        int _402 = _183;
        int _404 = _185;
        int _406 = _187;
        int _408 = _189;
        int _410 = _191;
        int _412 = _193;
        int _414 = _195;
        int _416 = _197;
        if (!_201)
        {
            _316 = 0.0;
            _318 = 0.0;
        }
        float _418 = _316;
        float _420 = _318;
        float _422 = _418;
        float _424 = _420;
        if (!_201)
        {
            _320 = 0.0;
        }
        float _426 = _320;
        bool _428 = !_201;
        float _430 = _426;
        if (!_428)
        {
            float _432 = rint((*spvDescriptorSet0.fp_c3)._m0[1].x);
            float _434 = precise::max(_432, 0.0);
            uint _436 = uint(_434);
            uint _438 = clamp(_436, 0u, 65535u);
            float _440 = _266 * _312;
            float _442 = _268 * _314;
            float _444 = -_310;
            float _446 = _270 * _444;
            float _448 = -_440;
            float _450 = fma(_270, _314, _448);
            float _452 = -_310;
            float _454 = -_442;
            float _456 = fma(_266, _452, _454);
            float _458 = -_446;
            float _460 = fma(_268, _312, _458);
            int _462 = 0;
            float _464 = 0.0;
            float _466 = 0.0;
            float _468 = 0.0;
            do
            {
                int _472 = _462;
                float _474 = _464;
                float _476 = _466;
                float _478 = _468;
                int _480 = _472 << 4;
                int _482 = _480 + 16;
                uint _484 = uint(int(uint(_482) >> uint(2)));
                uint _486 = uint(int(uint(int(_484)) >> uint(2)));
                int _488 = int(_484) & 3;
                float _490 = (*spvDescriptorSet0.fp_c4)._m0[int(_486)][_488];
                int _492 = int(_484) + 1;
                uint _494 = uint(int(uint(_492) >> uint(2)));
                int _496 = _492 & 3;
                float _498 = (*spvDescriptorSet0.fp_c4)._m0[int(_494)][_496];
                int _500 = _480 + 24;
                uint _502 = uint(int(uint(_500) >> uint(2)));
                uint _504 = uint(int(uint(int(_502)) >> uint(2)));
                int _506 = int(_502) & 3;
                float _508 = (*spvDescriptorSet0.fp_c4)._m0[int(_504)][_506];
                int _510 = int(_502) + 1;
                uint _512 = uint(int(uint(_510) >> uint(2)));
                int _514 = _510 & 3;
                float _516 = (*spvDescriptorSet0.fp_c4)._m0[int(_512)][_514];
                float _518 = _450 * _508;
                float _520 = _456 * _508;
                float _522 = _460 * _508;
                float _524 = -_310;
                float _526 = fma(_524, _498, _518);
                float _528 = fma(_312, _498, _520);
                float _530 = fma(_314, _498, _522);
                float _532 = fma(_268, _516, _526);
                float _534 = fma(_270, _516, _528);
                float _536 = fma(_266, _516, _530);
                float _538 = abs(_532);
                float _540 = abs(_534);
                float _542 = precise::max(_538, _540);
                float _544 = abs(_536);
                float _546 = precise::max(_544, _542);
                float _548 = 1.0 / _546;
                float _550 = _534 * _548;
                float _552 = _536 * _548;
                float _554 = _532 * _548;
                float4 _1201 = float4(_554, _550, _552, float(int(_438)));
                float4 _1205 = select(_1201, float4(0.0), isnan(_1201));
                float3 _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1205.xyz, uint(rint(_1205.w)), level(_490)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1205.xyz, uint(rint(_1205.w)), level(_490)).xyz;
                float _560 = _558.x;
                float _562 = _558.y;
                float _564 = _558.z;
                int _566 = _472 + 1;
                int _568 = _480 + 528;
                uint _570 = uint(int(uint(_568) >> uint(2)));
                uint _572 = uint(int(uint(int(_570)) >> uint(2)));
                int _574 = int(_570) & 3;
                float _576 = (*spvDescriptorSet0.fp_c4)._m0[int(_572)][_574];
                float _578 = float(_566);
                bool _580 = _578 >= (*spvDescriptorSet0.fp_c3)._m0[0].y;
                bool _582 = isnan(_578);
                bool _584 = _580 || _582;
                bool _586 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].y);
                bool _588 = _584 || _586;
                _590 = fma(_560, _576, _474);
                _592 = fma(_562, _576, _476);
                _594 = fma(_564, _576, _478);
                _470 = !_588;
                _462 = _566;
                _464 = _590;
                _466 = _592;
                _468 = _594;
            } while (_470);
            _422 = _590;
            _424 = _592;
            _430 = _594;
        }
        float _596 = _422;
        float _598 = _424;
        float _600 = _430;
        bool _602 = _133 >= 4;
        float _604 = _596 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        float _606 = _598 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        float _608 = _600 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        bool _610 = !_602;
        if (!_610)
        {
            bool _612 = _133 >= 6;
            bool _614 = !_612;
            if (!_614)
            {
                bool _616 = _133 >= 7;
                bool _618 = !_616;
                if (!_618)
                {
                    bool _620 = _133 != 7;
                    _622 = _620;
                    if (!_622)
                    {
                        _410 = as_type<int>(_604);
                        _412 = as_type<int>(_606);
                        _414 = as_type<int>(_608);
                        _416 = 1065353216;
                        _624 = true;
                    }
                }
                else
                {
                    _402 = as_type<int>(_604);
                    _404 = as_type<int>(_606);
                    _406 = as_type<int>(_608);
                    _408 = 1065353216;
                    _624 = true;
                }
            }
            else
            {
                bool _626 = _133 >= 5;
                if (_626)
                {
                    _322 = as_type<int>(_604);
                }
                int _628 = _322;
                _394 = _628;
                if (_626)
                {
                    _324 = as_type<int>(_608);
                }
                int _630 = _324;
                _398 = _630;
                if (!_626)
                {
                    _326 = as_type<int>(_604);
                }
                int _632 = _326;
                _386 = _632;
                if (_626)
                {
                    _328 = as_type<int>(_606);
                }
                int _634 = _328;
                _396 = _634;
                if (!_626)
                {
                    _330 = as_type<int>(_606);
                }
                int _636 = _330;
                _388 = _636;
                if (!_626)
                {
                    _332 = as_type<int>(_608);
                }
                int _638 = _332;
                _390 = _638;
                if (_626)
                {
                    _334 = 1065353216;
                }
                int _640 = _334;
                _400 = _640;
                if (!_626)
                {
                    _336 = 1065353216;
                }
                int _642 = _336;
                _392 = _642;
                _624 = true;
            }
        }
        if ((!_624) || _622)
        {
            if (!_622)
            {
                bool _644 = _133 >= 2;
                _646 = !_644;
            }
            if ((!_646) && (!_622))
            {
                bool _648 = _133 >= 3;
                if (_648)
                {
                    _338 = as_type<int>(_604);
                }
                int _650 = _338;
                _378 = _650;
                if (_648)
                {
                    _340 = as_type<int>(_606);
                }
                int _652 = _340;
                _380 = _652;
                if (!_648)
                {
                    _342 = as_type<int>(_604);
                }
                int _654 = _342;
                _370 = _654;
                if (!_648)
                {
                    _344 = as_type<int>(_606);
                }
                int _656 = _344;
                _372 = _656;
                if (_648)
                {
                    _346 = as_type<int>(_608);
                }
                int _658 = _346;
                _382 = _658;
                if (!_648)
                {
                    _348 = as_type<int>(_608);
                }
                int _660 = _348;
                _374 = _660;
                if (_648)
                {
                    _350 = 1065353216;
                }
                int _662 = _350;
                _384 = _662;
                if (!_648)
                {
                    _352 = 1065353216;
                }
                int _664 = _352;
                _376 = _664;
                _624 = true;
            }
            else
            {
                if (!_622)
                {
                    bool _666 = _133 != 1;
                    _668 = !_666;
                }
                if ((!_668) || _622)
                {
                    _622 = false;
                    _354 = as_type<int>(_604);
                    _356 = as_type<int>(_606);
                    _358 = as_type<int>(_608);
                    _360 = 1065353216;
                    _624 = true;
                }
                else
                {
                    _362 = as_type<int>(_604);
                    _364 = as_type<int>(_606);
                    _366 = as_type<int>(_608);
                    _368 = 1065353216;
                }
            }
        }
        _624 = false;
        _670 = _354;
        _672 = _356;
        _674 = _358;
        _676 = _360;
        _678 = _362;
        _680 = _364;
        _682 = _366;
        _684 = _368;
        _686 = _370;
        _688 = _372;
        _690 = _374;
        _692 = _376;
        _694 = _378;
        _696 = _380;
        _698 = _382;
        _700 = _384;
        _702 = _386;
        _704 = _388;
        _706 = _390;
        _708 = _392;
        _710 = _394;
        _712 = _396;
        _714 = _398;
        _716 = _400;
        _718 = _402;
        _720 = _404;
        _722 = _406;
        _724 = _408;
        _726 = _410;
        _728 = _412;
        _730 = _414;
        _732 = _416;
        int _734 = _133 + 1;
        bool _736 = _734 >= 6;
        _131 = !_736;
        _63 = _734;
        _65 = _670;
        _67 = _672;
        _69 = _674;
        _71 = _676;
        _73 = _678;
        _75 = _680;
        _77 = _682;
        _79 = _684;
        _81 = _686;
        _83 = _688;
        _85 = _690;
        _87 = _692;
        _89 = _694;
        _91 = _696;
        _93 = _698;
        _95 = _700;
        _97 = _702;
        _99 = _704;
        _101 = _706;
        _103 = _708;
        _105 = _710;
        _107 = _712;
        _109 = _714;
        _111 = _716;
        _113 = _718;
        _115 = _720;
        _117 = _722;
        _119 = _724;
        _121 = _726;
        _123 = _728;
        _125 = _730;
        _127 = _732;
    } while (_131);
    out.m_37.x = as_type<float>(_670);
    out.m_37.y = as_type<float>(_672);
    out.m_37.z = as_type<float>(_674);
    out.m_37.w = as_type<float>(_676);
    out.m_39.x = as_type<float>(_678);
    out.m_39.y = as_type<float>(_680);
    out.m_39.z = as_type<float>(_682);
    out.m_39.w = as_type<float>(_684);
    out.m_41.x = as_type<float>(_686);
    out.m_41.y = as_type<float>(_688);
    out.m_41.z = as_type<float>(_690);
    out.m_41.w = as_type<float>(_692);
    out.m_43.x = as_type<float>(_694);
    out.m_43.y = as_type<float>(_696);
    out.m_43.z = as_type<float>(_698);
    out.m_43.w = as_type<float>(_700);
    out.m_45.x = as_type<float>(_702);
    out.m_45.y = as_type<float>(_704);
    out.m_45.z = as_type<float>(_706);
    out.m_45.w = as_type<float>(_708);
    out.m_47.x = as_type<float>(_710);
    out.m_47.y = as_type<float>(_712);
    out.m_47.z = as_type<float>(_714);
    out.m_47.w = as_type<float>(_716);
    out.m_49.x = as_type<float>(_718);
    out.m_49.y = as_type<float>(_720);
    out.m_49.z = as_type<float>(_722);
    out.m_49.w = as_type<float>(_724);
    out.m_51.x = as_type<float>(_726);
    out.m_51.y = as_type<float>(_728);
    out.m_51.z = as_type<float>(_730);
    out.m_51.w = as_type<float>(_732);
    return out;
}


struct main0_out_u
{
    uint4 m_37 [[color(0)]];
    uint4 m_39 [[color(1)]];
    uint4 m_41 [[color(2)]];
    uint4 m_43 [[color(3)]];
    uint4 m_45 [[color(4)]];
    uint4 m_47 [[color(5)]];
    uint4 m_49 [[color(6)]];
    uint4 m_51 [[color(7)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    spvUnsafeArray<float4, 16> _34 = {};
    _34[0] = in.m_34_0;
    _34[1] = in.m_34_1;
    _34[2] = in.m_34_2;
    _34[3] = in.m_34_3;
    _34[4] = in.m_34_4;
    _34[5] = in.m_34_5;
    _34[6] = in.m_34_6;
    _34[7] = in.m_34_7;
    _34[8] = in.m_34_8;
    _34[9] = in.m_34_9;
    _34[10] = in.m_34_10;
    _34[11] = in.m_34_11;
    _34[12] = in.m_34_12;
    _34[13] = in.m_34_13;
    _34[14] = in.m_34_14;
    _34[15] = in.m_34_15;
    bool _624 = false;
    bool _622 = false;
    float _58 = gl_FragCoord.w;
    float _60 = 1.0 / _58;
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
    bool _470;
    float _590;
    float _592;
    float _594;
    bool _646;
    bool _668;
    int _670;
    int _672;
    int _674;
    int _676;
    int _678;
    int _680;
    int _682;
    int _684;
    int _686;
    int _688;
    int _690;
    int _692;
    int _694;
    int _696;
    int _698;
    int _700;
    int _702;
    int _704;
    int _706;
    int _708;
    int _710;
    int _712;
    int _714;
    int _716;
    int _718;
    int _720;
    int _722;
    int _724;
    int _726;
    int _728;
    int _730;
    int _732;
    do
    {
        int _133 = _63;
        int _135 = _65;
        int _137 = _67;
        int _139 = _69;
        int _141 = _71;
        int _143 = _73;
        int _145 = _75;
        int _147 = _77;
        int _149 = _79;
        int _151 = _81;
        int _153 = _83;
        int _155 = _85;
        int _157 = _87;
        int _159 = _89;
        int _161 = _91;
        int _163 = _93;
        int _165 = _95;
        int _167 = _97;
        int _169 = _99;
        int _171 = _101;
        int _173 = _103;
        int _175 = _105;
        int _177 = _107;
        int _179 = _109;
        int _181 = _111;
        int _183 = _113;
        int _185 = _115;
        int _187 = _117;
        int _189 = _119;
        int _191 = _121;
        int _193 = _123;
        int _195 = _125;
        int _197 = _127;
        int _199 = _133 << 4;
        bool _201 = 0.0 < (*spvDescriptorSet0.fp_c3)._m0[0].y;
        int _203 = _199 + 132;
        int _205 = _203 - 128;
        uint _208 = uint(int(uint(_205) >> uint(4)));
        uint _210 = uint(int(uint(_205) >> uint(2)));
        int _212 = int(_210) & 3;
        float _214 = _34[int(_208)][_212];
        float _216 = gl_FragCoord.w;
        float _218 = _214 * _216;
        int _220 = _199 + 128;
        int _222 = _220 - 128;
        uint _224 = uint(int(uint(_222) >> uint(4)));
        uint _226 = uint(int(uint(_222) >> uint(2)));
        int _228 = int(_226) & 3;
        float _230 = _34[int(_224)][_228];
        float _232 = gl_FragCoord.w;
        float _234 = _230 * _232;
        int _236 = _199 + 136;
        int _238 = _236 - 128;
        uint _240 = uint(int(uint(_238) >> uint(4)));
        uint _242 = uint(int(uint(_238) >> uint(2)));
        int _244 = int(_242) & 3;
        float _246 = _34[int(_240)][_244];
        float _248 = gl_FragCoord.w;
        float _250 = _246 * _248;
        float _252 = _60 * _218;
        float _254 = _60 * _234;
        float _256 = _60 * _250;
        float _258 = _252 * _252;
        float _260 = fma(_254, _254, _258);
        float _262 = fma(_256, _256, _260);
        float _264 = rsqrt(_262);
        float _266 = _256 * _264;
        float _268 = _254 * _264;
        float _270 = _252 * _264;
        float _272 = abs(_266);
        bool _274 = _272 >= 0.999000012874603271484375;
        bool _276 = isnan(_272);
        bool _278 = _274 || _276;
        bool _280 = isnan(0.999000012874603271484375);
        bool _282 = _278 || _280;
        float _284 = float(_282);
        float _286 = abs(_266);
        bool _288 = _286 < 0.999000012874603271484375;
        float _290 = float(_288);
        float _292 = _266 * _284;
        float _294 = _270 * _284;
        float _296 = -_292;
        float _298 = fma(_268, _290, _296);
        float _300 = _270 * _290;
        float _302 = _298 * _298;
        float _304 = fma(_300, _300, _302);
        float _306 = fma(_294, _294, _304);
        float _308 = rsqrt(_306);
        float _310 = _300 * _308;
        float _312 = _298 * _308;
        float _314 = _294 * _308;
        float _316 = _264;
        float _318 = _300;
        float _320 = _294;
        int _322 = _175;
        int _324 = _179;
        int _326 = _167;
        int _328 = _177;
        int _330 = _169;
        int _332 = _171;
        int _334 = _181;
        int _336 = _173;
        int _338 = _159;
        int _340 = _161;
        int _342 = _151;
        int _344 = _153;
        int _346 = _163;
        int _348 = _155;
        int _350 = _165;
        int _352 = _157;
        int _354 = _135;
        int _356 = _137;
        int _358 = _139;
        int _360 = _141;
        int _362 = _143;
        int _364 = _145;
        int _366 = _147;
        int _368 = _149;
        int _370 = _151;
        int _372 = _153;
        int _374 = _155;
        int _376 = _157;
        int _378 = _159;
        int _380 = _161;
        int _382 = _163;
        int _384 = _165;
        int _386 = _167;
        int _388 = _169;
        int _390 = _171;
        int _392 = _173;
        int _394 = _175;
        int _396 = _177;
        int _398 = _179;
        int _400 = _181;
        int _402 = _183;
        int _404 = _185;
        int _406 = _187;
        int _408 = _189;
        int _410 = _191;
        int _412 = _193;
        int _414 = _195;
        int _416 = _197;
        if (!_201)
        {
            _316 = 0.0;
            _318 = 0.0;
        }
        float _418 = _316;
        float _420 = _318;
        float _422 = _418;
        float _424 = _420;
        if (!_201)
        {
            _320 = 0.0;
        }
        float _426 = _320;
        bool _428 = !_201;
        float _430 = _426;
        if (!_428)
        {
            float _432 = rint((*spvDescriptorSet0.fp_c3)._m0[1].x);
            float _434 = precise::max(_432, 0.0);
            uint _436 = uint(_434);
            uint _438 = clamp(_436, 0u, 65535u);
            float _440 = _266 * _312;
            float _442 = _268 * _314;
            float _444 = -_310;
            float _446 = _270 * _444;
            float _448 = -_440;
            float _450 = fma(_270, _314, _448);
            float _452 = -_310;
            float _454 = -_442;
            float _456 = fma(_266, _452, _454);
            float _458 = -_446;
            float _460 = fma(_268, _312, _458);
            int _462 = 0;
            float _464 = 0.0;
            float _466 = 0.0;
            float _468 = 0.0;
            do
            {
                int _472 = _462;
                float _474 = _464;
                float _476 = _466;
                float _478 = _468;
                int _480 = _472 << 4;
                int _482 = _480 + 16;
                uint _484 = uint(int(uint(_482) >> uint(2)));
                uint _486 = uint(int(uint(int(_484)) >> uint(2)));
                int _488 = int(_484) & 3;
                float _490 = (*spvDescriptorSet0.fp_c4)._m0[int(_486)][_488];
                int _492 = int(_484) + 1;
                uint _494 = uint(int(uint(_492) >> uint(2)));
                int _496 = _492 & 3;
                float _498 = (*spvDescriptorSet0.fp_c4)._m0[int(_494)][_496];
                int _500 = _480 + 24;
                uint _502 = uint(int(uint(_500) >> uint(2)));
                uint _504 = uint(int(uint(int(_502)) >> uint(2)));
                int _506 = int(_502) & 3;
                float _508 = (*spvDescriptorSet0.fp_c4)._m0[int(_504)][_506];
                int _510 = int(_502) + 1;
                uint _512 = uint(int(uint(_510) >> uint(2)));
                int _514 = _510 & 3;
                float _516 = (*spvDescriptorSet0.fp_c4)._m0[int(_512)][_514];
                float _518 = _450 * _508;
                float _520 = _456 * _508;
                float _522 = _460 * _508;
                float _524 = -_310;
                float _526 = fma(_524, _498, _518);
                float _528 = fma(_312, _498, _520);
                float _530 = fma(_314, _498, _522);
                float _532 = fma(_268, _516, _526);
                float _534 = fma(_270, _516, _528);
                float _536 = fma(_266, _516, _530);
                float _538 = abs(_532);
                float _540 = abs(_534);
                float _542 = precise::max(_538, _540);
                float _544 = abs(_536);
                float _546 = precise::max(_544, _542);
                float _548 = 1.0 / _546;
                float _550 = _534 * _548;
                float _552 = _536 * _548;
                float _554 = _532 * _548;
                float4 _1201 = float4(_554, _550, _552, float(int(_438)));
                float4 _1205 = select(_1201, float4(0.0), isnan(_1201));
                float3 _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1205.xyz, uint(rint(_1205.w)), level(_490)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1205.xyz, uint(rint(_1205.w)), level(_490)).xyz;
                float _560 = _558.x;
                float _562 = _558.y;
                float _564 = _558.z;
                int _566 = _472 + 1;
                int _568 = _480 + 528;
                uint _570 = uint(int(uint(_568) >> uint(2)));
                uint _572 = uint(int(uint(int(_570)) >> uint(2)));
                int _574 = int(_570) & 3;
                float _576 = (*spvDescriptorSet0.fp_c4)._m0[int(_572)][_574];
                float _578 = float(_566);
                bool _580 = _578 >= (*spvDescriptorSet0.fp_c3)._m0[0].y;
                bool _582 = isnan(_578);
                bool _584 = _580 || _582;
                bool _586 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].y);
                bool _588 = _584 || _586;
                _590 = fma(_560, _576, _474);
                _592 = fma(_562, _576, _476);
                _594 = fma(_564, _576, _478);
                _470 = !_588;
                _462 = _566;
                _464 = _590;
                _466 = _592;
                _468 = _594;
            } while (_470);
            _422 = _590;
            _424 = _592;
            _430 = _594;
        }
        float _596 = _422;
        float _598 = _424;
        float _600 = _430;
        bool _602 = _133 >= 4;
        float _604 = _596 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        float _606 = _598 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        float _608 = _600 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        bool _610 = !_602;
        if (!_610)
        {
            bool _612 = _133 >= 6;
            bool _614 = !_612;
            if (!_614)
            {
                bool _616 = _133 >= 7;
                bool _618 = !_616;
                if (!_618)
                {
                    bool _620 = _133 != 7;
                    _622 = _620;
                    if (!_622)
                    {
                        _410 = as_type<int>(_604);
                        _412 = as_type<int>(_606);
                        _414 = as_type<int>(_608);
                        _416 = 1065353216;
                        _624 = true;
                    }
                }
                else
                {
                    _402 = as_type<int>(_604);
                    _404 = as_type<int>(_606);
                    _406 = as_type<int>(_608);
                    _408 = 1065353216;
                    _624 = true;
                }
            }
            else
            {
                bool _626 = _133 >= 5;
                if (_626)
                {
                    _322 = as_type<int>(_604);
                }
                int _628 = _322;
                _394 = _628;
                if (_626)
                {
                    _324 = as_type<int>(_608);
                }
                int _630 = _324;
                _398 = _630;
                if (!_626)
                {
                    _326 = as_type<int>(_604);
                }
                int _632 = _326;
                _386 = _632;
                if (_626)
                {
                    _328 = as_type<int>(_606);
                }
                int _634 = _328;
                _396 = _634;
                if (!_626)
                {
                    _330 = as_type<int>(_606);
                }
                int _636 = _330;
                _388 = _636;
                if (!_626)
                {
                    _332 = as_type<int>(_608);
                }
                int _638 = _332;
                _390 = _638;
                if (_626)
                {
                    _334 = 1065353216;
                }
                int _640 = _334;
                _400 = _640;
                if (!_626)
                {
                    _336 = 1065353216;
                }
                int _642 = _336;
                _392 = _642;
                _624 = true;
            }
        }
        if ((!_624) || _622)
        {
            if (!_622)
            {
                bool _644 = _133 >= 2;
                _646 = !_644;
            }
            if ((!_646) && (!_622))
            {
                bool _648 = _133 >= 3;
                if (_648)
                {
                    _338 = as_type<int>(_604);
                }
                int _650 = _338;
                _378 = _650;
                if (_648)
                {
                    _340 = as_type<int>(_606);
                }
                int _652 = _340;
                _380 = _652;
                if (!_648)
                {
                    _342 = as_type<int>(_604);
                }
                int _654 = _342;
                _370 = _654;
                if (!_648)
                {
                    _344 = as_type<int>(_606);
                }
                int _656 = _344;
                _372 = _656;
                if (_648)
                {
                    _346 = as_type<int>(_608);
                }
                int _658 = _346;
                _382 = _658;
                if (!_648)
                {
                    _348 = as_type<int>(_608);
                }
                int _660 = _348;
                _374 = _660;
                if (_648)
                {
                    _350 = 1065353216;
                }
                int _662 = _350;
                _384 = _662;
                if (!_648)
                {
                    _352 = 1065353216;
                }
                int _664 = _352;
                _376 = _664;
                _624 = true;
            }
            else
            {
                if (!_622)
                {
                    bool _666 = _133 != 1;
                    _668 = !_666;
                }
                if ((!_668) || _622)
                {
                    _622 = false;
                    _354 = as_type<int>(_604);
                    _356 = as_type<int>(_606);
                    _358 = as_type<int>(_608);
                    _360 = 1065353216;
                    _624 = true;
                }
                else
                {
                    _362 = as_type<int>(_604);
                    _364 = as_type<int>(_606);
                    _366 = as_type<int>(_608);
                    _368 = 1065353216;
                }
            }
        }
        _624 = false;
        _670 = _354;
        _672 = _356;
        _674 = _358;
        _676 = _360;
        _678 = _362;
        _680 = _364;
        _682 = _366;
        _684 = _368;
        _686 = _370;
        _688 = _372;
        _690 = _374;
        _692 = _376;
        _694 = _378;
        _696 = _380;
        _698 = _382;
        _700 = _384;
        _702 = _386;
        _704 = _388;
        _706 = _390;
        _708 = _392;
        _710 = _394;
        _712 = _396;
        _714 = _398;
        _716 = _400;
        _718 = _402;
        _720 = _404;
        _722 = _406;
        _724 = _408;
        _726 = _410;
        _728 = _412;
        _730 = _414;
        _732 = _416;
        int _734 = _133 + 1;
        bool _736 = _734 >= 6;
        _131 = !_736;
        _63 = _734;
        _65 = _670;
        _67 = _672;
        _69 = _674;
        _71 = _676;
        _73 = _678;
        _75 = _680;
        _77 = _682;
        _79 = _684;
        _81 = _686;
        _83 = _688;
        _85 = _690;
        _87 = _692;
        _89 = _694;
        _91 = _696;
        _93 = _698;
        _95 = _700;
        _97 = _702;
        _99 = _704;
        _101 = _706;
        _103 = _708;
        _105 = _710;
        _107 = _712;
        _109 = _714;
        _111 = _716;
        _113 = _718;
        _115 = _720;
        _117 = _722;
        _119 = _724;
        _121 = _726;
        _123 = _728;
        _125 = _730;
        _127 = _732;
    } while (_131);
    out.m_37.x = as_type<float>(_670);
    out.m_37.y = as_type<float>(_672);
    out.m_37.z = as_type<float>(_674);
    out.m_37.w = as_type<float>(_676);
    out.m_39.x = as_type<float>(_678);
    out.m_39.y = as_type<float>(_680);
    out.m_39.z = as_type<float>(_682);
    out.m_39.w = as_type<float>(_684);
    out.m_41.x = as_type<float>(_686);
    out.m_41.y = as_type<float>(_688);
    out.m_41.z = as_type<float>(_690);
    out.m_41.w = as_type<float>(_692);
    out.m_43.x = as_type<float>(_694);
    out.m_43.y = as_type<float>(_696);
    out.m_43.z = as_type<float>(_698);
    out.m_43.w = as_type<float>(_700);
    out.m_45.x = as_type<float>(_702);
    out.m_45.y = as_type<float>(_704);
    out.m_45.z = as_type<float>(_706);
    out.m_45.w = as_type<float>(_708);
    out.m_47.x = as_type<float>(_710);
    out.m_47.y = as_type<float>(_712);
    out.m_47.z = as_type<float>(_714);
    out.m_47.w = as_type<float>(_716);
    out.m_49.x = as_type<float>(_718);
    out.m_49.y = as_type<float>(_720);
    out.m_49.z = as_type<float>(_722);
    out.m_49.w = as_type<float>(_724);
    out.m_51.x = as_type<float>(_726);
    out.m_51.y = as_type<float>(_728);
    out.m_51.z = as_type<float>(_730);
    out.m_51.w = as_type<float>(_732);
    return main0_out_u{as_type<uint4>(out.m_37), as_type<uint4>(out.m_39), as_type<uint4>(out.m_41), as_type<uint4>(out.m_43), as_type<uint4>(out.m_45), as_type<uint4>(out.m_47), as_type<uint4>(out.m_49), as_type<uint4>(out.m_51)};
}

