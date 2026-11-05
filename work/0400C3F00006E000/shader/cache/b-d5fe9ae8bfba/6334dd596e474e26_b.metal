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
    texturecube<float> fp_t_tcb_8 [[id(2)]];
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
    bool _616 = false;
    bool _614 = false;
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
    bool _462;
    float _582;
    float _584;
    float _586;
    bool _638;
    bool _660;
    int _662;
    int _664;
    int _666;
    int _668;
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
        float _308 = _304;
        float _310 = _264;
        float _312 = _294;
        int _314 = _175;
        int _316 = _167;
        int _318 = _181;
        int _320 = _177;
        int _322 = _169;
        int _324 = _179;
        int _326 = _171;
        int _328 = _173;
        int _330 = _159;
        int _332 = _163;
        int _334 = _151;
        int _336 = _161;
        int _338 = _153;
        int _340 = _155;
        int _342 = _165;
        int _344 = _157;
        int _346 = _135;
        int _348 = _137;
        int _350 = _139;
        int _352 = _141;
        int _354 = _143;
        int _356 = _145;
        int _358 = _147;
        int _360 = _149;
        int _362 = _151;
        int _364 = _153;
        int _366 = _155;
        int _368 = _157;
        int _370 = _159;
        int _372 = _161;
        int _374 = _163;
        int _376 = _165;
        int _378 = _167;
        int _380 = _169;
        int _382 = _171;
        int _384 = _173;
        int _386 = _175;
        int _388 = _177;
        int _390 = _179;
        int _392 = _181;
        int _394 = _183;
        int _396 = _185;
        int _398 = _187;
        int _400 = _189;
        int _402 = _191;
        int _404 = _193;
        int _406 = _195;
        int _408 = _197;
        if (!_201)
        {
            _308 = 0.0;
            _310 = 0.0;
        }
        float _410 = _308;
        float _412 = _310;
        float _414 = rsqrt(_306);
        float _416 = _298 * _414;
        float _418 = _294 * _414;
        float _420 = _300 * _414;
        float _422 = _412;
        float _424 = _410;
        if (!_201)
        {
            _312 = 0.0;
        }
        float _426 = _312;
        bool _428 = !_201;
        float _430 = _426;
        if (!_428)
        {
            float _432 = _266 * _416;
            float _434 = _268 * _418;
            float _436 = -_420;
            float _438 = _270 * _436;
            float _440 = -_432;
            float _442 = fma(_270, _418, _440);
            float _444 = -_420;
            float _446 = -_434;
            float _448 = fma(_266, _444, _446);
            float _450 = -_438;
            float _452 = fma(_268, _416, _450);
            int _454 = 0;
            float _456 = 0.0;
            float _458 = 0.0;
            float _460 = 0.0;
            do
            {
                int _464 = _454;
                float _466 = _456;
                float _468 = _458;
                float _470 = _460;
                int _472 = _464 << 4;
                int _474 = _472 + 16;
                uint _476 = uint(int(uint(_474) >> uint(2)));
                uint _478 = uint(int(uint(int(_476)) >> uint(2)));
                int _480 = int(_476) & 3;
                float _482 = (*spvDescriptorSet0.fp_c4)._m0[int(_478)][_480];
                int _484 = int(_476) + 1;
                uint _486 = uint(int(uint(_484) >> uint(2)));
                int _488 = _484 & 3;
                float _490 = (*spvDescriptorSet0.fp_c4)._m0[int(_486)][_488];
                int _492 = _472 + 24;
                uint _494 = uint(int(uint(_492) >> uint(2)));
                uint _496 = uint(int(uint(int(_494)) >> uint(2)));
                int _498 = int(_494) & 3;
                float _500 = (*spvDescriptorSet0.fp_c4)._m0[int(_496)][_498];
                int _502 = int(_494) + 1;
                uint _504 = uint(int(uint(_502) >> uint(2)));
                int _506 = _502 & 3;
                float _508 = (*spvDescriptorSet0.fp_c4)._m0[int(_504)][_506];
                float _510 = _442 * _500;
                float _512 = _452 * _500;
                float _514 = -_420;
                float _516 = fma(_514, _490, _510);
                float _518 = _448 * _500;
                float _520 = fma(_418, _490, _512);
                float _522 = fma(_268, _508, _516);
                float _524 = fma(_416, _490, _518);
                float _526 = fma(_266, _508, _520);
                float _528 = fma(_270, _508, _524);
                float _530 = abs(_522);
                float _532 = abs(_528);
                float _534 = precise::max(_530, _532);
                float _536 = abs(_526);
                float _538 = precise::max(_536, _534);
                float _540 = 1.0 / _538;
                float _542 = _522 * _540;
                float _544 = _526 * _540;
                float _546 = _528 * _540;
                float3 _1179 = float3(_542, _546, _544);
                float3 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1179, float3(0.0), isnan(_1179)), level(_482)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1179, float3(0.0), isnan(_1179)), level(_482)).xyz;
                float _552 = _550.x;
                float _554 = _550.y;
                float _556 = _550.z;
                int _558 = _464 + 1;
                int _560 = _472 + 528;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                uint _564 = uint(int(uint(int(_562)) >> uint(2)));
                int _566 = int(_562) & 3;
                float _568 = (*spvDescriptorSet0.fp_c4)._m0[int(_564)][_566];
                float _570 = float(_558);
                bool _572 = _570 >= (*spvDescriptorSet0.fp_c3)._m0[0].y;
                bool _574 = isnan(_570);
                bool _576 = _572 || _574;
                bool _578 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].y);
                bool _580 = _576 || _578;
                _582 = fma(_552, _568, _466);
                _584 = fma(_554, _568, _468);
                _586 = fma(_556, _568, _470);
                _462 = !_580;
                _454 = _558;
                _456 = _582;
                _458 = _584;
                _460 = _586;
            } while (_462);
            _422 = _582;
            _424 = _584;
            _430 = _586;
        }
        float _588 = _422;
        float _590 = _424;
        float _592 = _430;
        bool _594 = _133 >= 4;
        float _596 = _588 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        float _598 = _590 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        float _600 = _592 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        bool _602 = !_594;
        if (!_602)
        {
            bool _604 = _133 >= 6;
            bool _606 = !_604;
            if (!_606)
            {
                bool _608 = _133 >= 7;
                bool _610 = !_608;
                if (!_610)
                {
                    bool _612 = _133 != 7;
                    _614 = _612;
                    if (!_614)
                    {
                        _402 = as_type<int>(_596);
                        _404 = as_type<int>(_598);
                        _406 = as_type<int>(_600);
                        _408 = 1065353216;
                        _616 = true;
                    }
                }
                else
                {
                    _394 = as_type<int>(_596);
                    _396 = as_type<int>(_598);
                    _398 = as_type<int>(_600);
                    _400 = 1065353216;
                    _616 = true;
                }
            }
            else
            {
                bool _618 = _133 >= 5;
                if (_618)
                {
                    _314 = as_type<int>(_596);
                }
                int _620 = _314;
                _386 = _620;
                if (!_618)
                {
                    _316 = as_type<int>(_596);
                }
                int _622 = _316;
                _378 = _622;
                if (_618)
                {
                    _318 = 1065353216;
                }
                int _624 = _318;
                _392 = _624;
                if (_618)
                {
                    _320 = as_type<int>(_598);
                }
                int _626 = _320;
                _388 = _626;
                if (!_618)
                {
                    _322 = as_type<int>(_598);
                }
                int _628 = _322;
                _380 = _628;
                if (_618)
                {
                    _324 = as_type<int>(_600);
                }
                int _630 = _324;
                _390 = _630;
                if (!_618)
                {
                    _326 = as_type<int>(_600);
                }
                int _632 = _326;
                _382 = _632;
                if (!_618)
                {
                    _328 = 1065353216;
                }
                int _634 = _328;
                _384 = _634;
                _616 = true;
            }
        }
        if ((!_616) || _614)
        {
            if (!_614)
            {
                bool _636 = _133 >= 2;
                _638 = !_636;
            }
            if ((!_638) && (!_614))
            {
                bool _640 = _133 >= 3;
                if (_640)
                {
                    _330 = as_type<int>(_596);
                }
                int _642 = _330;
                _370 = _642;
                if (_640)
                {
                    _332 = as_type<int>(_600);
                }
                int _644 = _332;
                _374 = _644;
                if (!_640)
                {
                    _334 = as_type<int>(_596);
                }
                int _646 = _334;
                _362 = _646;
                if (_640)
                {
                    _336 = as_type<int>(_598);
                }
                int _648 = _336;
                _372 = _648;
                if (!_640)
                {
                    _338 = as_type<int>(_598);
                }
                int _650 = _338;
                _364 = _650;
                if (!_640)
                {
                    _340 = as_type<int>(_600);
                }
                int _652 = _340;
                _366 = _652;
                if (_640)
                {
                    _342 = 1065353216;
                }
                int _654 = _342;
                _376 = _654;
                if (!_640)
                {
                    _344 = 1065353216;
                }
                int _656 = _344;
                _368 = _656;
                _616 = true;
            }
            else
            {
                if (!_614)
                {
                    bool _658 = _133 != 1;
                    _660 = !_658;
                }
                if ((!_660) || _614)
                {
                    _614 = false;
                    _346 = as_type<int>(_596);
                    _348 = as_type<int>(_598);
                    _350 = as_type<int>(_600);
                    _352 = 1065353216;
                    _616 = true;
                }
                else
                {
                    _354 = as_type<int>(_596);
                    _356 = as_type<int>(_598);
                    _358 = as_type<int>(_600);
                    _360 = 1065353216;
                }
            }
        }
        _616 = false;
        _662 = _346;
        _664 = _348;
        _666 = _350;
        _668 = _352;
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
        int _726 = _133 + 1;
        bool _728 = _726 >= 6;
        _131 = !_728;
        _63 = _726;
        _65 = _662;
        _67 = _664;
        _69 = _666;
        _71 = _668;
        _73 = _670;
        _75 = _672;
        _77 = _674;
        _79 = _676;
        _81 = _678;
        _83 = _680;
        _85 = _682;
        _87 = _684;
        _89 = _686;
        _91 = _688;
        _93 = _690;
        _95 = _692;
        _97 = _694;
        _99 = _696;
        _101 = _698;
        _103 = _700;
        _105 = _702;
        _107 = _704;
        _109 = _706;
        _111 = _708;
        _113 = _710;
        _115 = _712;
        _117 = _714;
        _119 = _716;
        _121 = _718;
        _123 = _720;
        _125 = _722;
        _127 = _724;
    } while (_131);
    out.m_37.x = as_type<float>(_662);
    out.m_37.y = as_type<float>(_664);
    out.m_37.z = as_type<float>(_666);
    out.m_37.w = as_type<float>(_668);
    out.m_39.x = as_type<float>(_670);
    out.m_39.y = as_type<float>(_672);
    out.m_39.z = as_type<float>(_674);
    out.m_39.w = as_type<float>(_676);
    out.m_41.x = as_type<float>(_678);
    out.m_41.y = as_type<float>(_680);
    out.m_41.z = as_type<float>(_682);
    out.m_41.w = as_type<float>(_684);
    out.m_43.x = as_type<float>(_686);
    out.m_43.y = as_type<float>(_688);
    out.m_43.z = as_type<float>(_690);
    out.m_43.w = as_type<float>(_692);
    out.m_45.x = as_type<float>(_694);
    out.m_45.y = as_type<float>(_696);
    out.m_45.z = as_type<float>(_698);
    out.m_45.w = as_type<float>(_700);
    out.m_47.x = as_type<float>(_702);
    out.m_47.y = as_type<float>(_704);
    out.m_47.z = as_type<float>(_706);
    out.m_47.w = as_type<float>(_708);
    out.m_49.x = as_type<float>(_710);
    out.m_49.y = as_type<float>(_712);
    out.m_49.z = as_type<float>(_714);
    out.m_49.w = as_type<float>(_716);
    out.m_51.x = as_type<float>(_718);
    out.m_51.y = as_type<float>(_720);
    out.m_51.z = as_type<float>(_722);
    out.m_51.w = as_type<float>(_724);
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
    bool _616 = false;
    bool _614 = false;
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
    bool _462;
    float _582;
    float _584;
    float _586;
    bool _638;
    bool _660;
    int _662;
    int _664;
    int _666;
    int _668;
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
        float _308 = _304;
        float _310 = _264;
        float _312 = _294;
        int _314 = _175;
        int _316 = _167;
        int _318 = _181;
        int _320 = _177;
        int _322 = _169;
        int _324 = _179;
        int _326 = _171;
        int _328 = _173;
        int _330 = _159;
        int _332 = _163;
        int _334 = _151;
        int _336 = _161;
        int _338 = _153;
        int _340 = _155;
        int _342 = _165;
        int _344 = _157;
        int _346 = _135;
        int _348 = _137;
        int _350 = _139;
        int _352 = _141;
        int _354 = _143;
        int _356 = _145;
        int _358 = _147;
        int _360 = _149;
        int _362 = _151;
        int _364 = _153;
        int _366 = _155;
        int _368 = _157;
        int _370 = _159;
        int _372 = _161;
        int _374 = _163;
        int _376 = _165;
        int _378 = _167;
        int _380 = _169;
        int _382 = _171;
        int _384 = _173;
        int _386 = _175;
        int _388 = _177;
        int _390 = _179;
        int _392 = _181;
        int _394 = _183;
        int _396 = _185;
        int _398 = _187;
        int _400 = _189;
        int _402 = _191;
        int _404 = _193;
        int _406 = _195;
        int _408 = _197;
        if (!_201)
        {
            _308 = 0.0;
            _310 = 0.0;
        }
        float _410 = _308;
        float _412 = _310;
        float _414 = rsqrt(_306);
        float _416 = _298 * _414;
        float _418 = _294 * _414;
        float _420 = _300 * _414;
        float _422 = _412;
        float _424 = _410;
        if (!_201)
        {
            _312 = 0.0;
        }
        float _426 = _312;
        bool _428 = !_201;
        float _430 = _426;
        if (!_428)
        {
            float _432 = _266 * _416;
            float _434 = _268 * _418;
            float _436 = -_420;
            float _438 = _270 * _436;
            float _440 = -_432;
            float _442 = fma(_270, _418, _440);
            float _444 = -_420;
            float _446 = -_434;
            float _448 = fma(_266, _444, _446);
            float _450 = -_438;
            float _452 = fma(_268, _416, _450);
            int _454 = 0;
            float _456 = 0.0;
            float _458 = 0.0;
            float _460 = 0.0;
            do
            {
                int _464 = _454;
                float _466 = _456;
                float _468 = _458;
                float _470 = _460;
                int _472 = _464 << 4;
                int _474 = _472 + 16;
                uint _476 = uint(int(uint(_474) >> uint(2)));
                uint _478 = uint(int(uint(int(_476)) >> uint(2)));
                int _480 = int(_476) & 3;
                float _482 = (*spvDescriptorSet0.fp_c4)._m0[int(_478)][_480];
                int _484 = int(_476) + 1;
                uint _486 = uint(int(uint(_484) >> uint(2)));
                int _488 = _484 & 3;
                float _490 = (*spvDescriptorSet0.fp_c4)._m0[int(_486)][_488];
                int _492 = _472 + 24;
                uint _494 = uint(int(uint(_492) >> uint(2)));
                uint _496 = uint(int(uint(int(_494)) >> uint(2)));
                int _498 = int(_494) & 3;
                float _500 = (*spvDescriptorSet0.fp_c4)._m0[int(_496)][_498];
                int _502 = int(_494) + 1;
                uint _504 = uint(int(uint(_502) >> uint(2)));
                int _506 = _502 & 3;
                float _508 = (*spvDescriptorSet0.fp_c4)._m0[int(_504)][_506];
                float _510 = _442 * _500;
                float _512 = _452 * _500;
                float _514 = -_420;
                float _516 = fma(_514, _490, _510);
                float _518 = _448 * _500;
                float _520 = fma(_418, _490, _512);
                float _522 = fma(_268, _508, _516);
                float _524 = fma(_416, _490, _518);
                float _526 = fma(_266, _508, _520);
                float _528 = fma(_270, _508, _524);
                float _530 = abs(_522);
                float _532 = abs(_528);
                float _534 = precise::max(_530, _532);
                float _536 = abs(_526);
                float _538 = precise::max(_536, _534);
                float _540 = 1.0 / _538;
                float _542 = _522 * _540;
                float _544 = _526 * _540;
                float _546 = _528 * _540;
                float3 _1179 = float3(_542, _546, _544);
                float3 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1179, float3(0.0), isnan(_1179)), level(_482)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1179, float3(0.0), isnan(_1179)), level(_482)).xyz;
                float _552 = _550.x;
                float _554 = _550.y;
                float _556 = _550.z;
                int _558 = _464 + 1;
                int _560 = _472 + 528;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                uint _564 = uint(int(uint(int(_562)) >> uint(2)));
                int _566 = int(_562) & 3;
                float _568 = (*spvDescriptorSet0.fp_c4)._m0[int(_564)][_566];
                float _570 = float(_558);
                bool _572 = _570 >= (*spvDescriptorSet0.fp_c3)._m0[0].y;
                bool _574 = isnan(_570);
                bool _576 = _572 || _574;
                bool _578 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].y);
                bool _580 = _576 || _578;
                _582 = fma(_552, _568, _466);
                _584 = fma(_554, _568, _468);
                _586 = fma(_556, _568, _470);
                _462 = !_580;
                _454 = _558;
                _456 = _582;
                _458 = _584;
                _460 = _586;
            } while (_462);
            _422 = _582;
            _424 = _584;
            _430 = _586;
        }
        float _588 = _422;
        float _590 = _424;
        float _592 = _430;
        bool _594 = _133 >= 4;
        float _596 = _588 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        float _598 = _590 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        float _600 = _592 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        bool _602 = !_594;
        if (!_602)
        {
            bool _604 = _133 >= 6;
            bool _606 = !_604;
            if (!_606)
            {
                bool _608 = _133 >= 7;
                bool _610 = !_608;
                if (!_610)
                {
                    bool _612 = _133 != 7;
                    _614 = _612;
                    if (!_614)
                    {
                        _402 = as_type<int>(_596);
                        _404 = as_type<int>(_598);
                        _406 = as_type<int>(_600);
                        _408 = 1065353216;
                        _616 = true;
                    }
                }
                else
                {
                    _394 = as_type<int>(_596);
                    _396 = as_type<int>(_598);
                    _398 = as_type<int>(_600);
                    _400 = 1065353216;
                    _616 = true;
                }
            }
            else
            {
                bool _618 = _133 >= 5;
                if (_618)
                {
                    _314 = as_type<int>(_596);
                }
                int _620 = _314;
                _386 = _620;
                if (!_618)
                {
                    _316 = as_type<int>(_596);
                }
                int _622 = _316;
                _378 = _622;
                if (_618)
                {
                    _318 = 1065353216;
                }
                int _624 = _318;
                _392 = _624;
                if (_618)
                {
                    _320 = as_type<int>(_598);
                }
                int _626 = _320;
                _388 = _626;
                if (!_618)
                {
                    _322 = as_type<int>(_598);
                }
                int _628 = _322;
                _380 = _628;
                if (_618)
                {
                    _324 = as_type<int>(_600);
                }
                int _630 = _324;
                _390 = _630;
                if (!_618)
                {
                    _326 = as_type<int>(_600);
                }
                int _632 = _326;
                _382 = _632;
                if (!_618)
                {
                    _328 = 1065353216;
                }
                int _634 = _328;
                _384 = _634;
                _616 = true;
            }
        }
        if ((!_616) || _614)
        {
            if (!_614)
            {
                bool _636 = _133 >= 2;
                _638 = !_636;
            }
            if ((!_638) && (!_614))
            {
                bool _640 = _133 >= 3;
                if (_640)
                {
                    _330 = as_type<int>(_596);
                }
                int _642 = _330;
                _370 = _642;
                if (_640)
                {
                    _332 = as_type<int>(_600);
                }
                int _644 = _332;
                _374 = _644;
                if (!_640)
                {
                    _334 = as_type<int>(_596);
                }
                int _646 = _334;
                _362 = _646;
                if (_640)
                {
                    _336 = as_type<int>(_598);
                }
                int _648 = _336;
                _372 = _648;
                if (!_640)
                {
                    _338 = as_type<int>(_598);
                }
                int _650 = _338;
                _364 = _650;
                if (!_640)
                {
                    _340 = as_type<int>(_600);
                }
                int _652 = _340;
                _366 = _652;
                if (_640)
                {
                    _342 = 1065353216;
                }
                int _654 = _342;
                _376 = _654;
                if (!_640)
                {
                    _344 = 1065353216;
                }
                int _656 = _344;
                _368 = _656;
                _616 = true;
            }
            else
            {
                if (!_614)
                {
                    bool _658 = _133 != 1;
                    _660 = !_658;
                }
                if ((!_660) || _614)
                {
                    _614 = false;
                    _346 = as_type<int>(_596);
                    _348 = as_type<int>(_598);
                    _350 = as_type<int>(_600);
                    _352 = 1065353216;
                    _616 = true;
                }
                else
                {
                    _354 = as_type<int>(_596);
                    _356 = as_type<int>(_598);
                    _358 = as_type<int>(_600);
                    _360 = 1065353216;
                }
            }
        }
        _616 = false;
        _662 = _346;
        _664 = _348;
        _666 = _350;
        _668 = _352;
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
        int _726 = _133 + 1;
        bool _728 = _726 >= 6;
        _131 = !_728;
        _63 = _726;
        _65 = _662;
        _67 = _664;
        _69 = _666;
        _71 = _668;
        _73 = _670;
        _75 = _672;
        _77 = _674;
        _79 = _676;
        _81 = _678;
        _83 = _680;
        _85 = _682;
        _87 = _684;
        _89 = _686;
        _91 = _688;
        _93 = _690;
        _95 = _692;
        _97 = _694;
        _99 = _696;
        _101 = _698;
        _103 = _700;
        _105 = _702;
        _107 = _704;
        _109 = _706;
        _111 = _708;
        _113 = _710;
        _115 = _712;
        _117 = _714;
        _119 = _716;
        _121 = _718;
        _123 = _720;
        _125 = _722;
        _127 = _724;
    } while (_131);
    out.m_37.x = as_type<float>(_662);
    out.m_37.y = as_type<float>(_664);
    out.m_37.z = as_type<float>(_666);
    out.m_37.w = as_type<float>(_668);
    out.m_39.x = as_type<float>(_670);
    out.m_39.y = as_type<float>(_672);
    out.m_39.z = as_type<float>(_674);
    out.m_39.w = as_type<float>(_676);
    out.m_41.x = as_type<float>(_678);
    out.m_41.y = as_type<float>(_680);
    out.m_41.z = as_type<float>(_682);
    out.m_41.w = as_type<float>(_684);
    out.m_43.x = as_type<float>(_686);
    out.m_43.y = as_type<float>(_688);
    out.m_43.z = as_type<float>(_690);
    out.m_43.w = as_type<float>(_692);
    out.m_45.x = as_type<float>(_694);
    out.m_45.y = as_type<float>(_696);
    out.m_45.z = as_type<float>(_698);
    out.m_45.w = as_type<float>(_700);
    out.m_47.x = as_type<float>(_702);
    out.m_47.y = as_type<float>(_704);
    out.m_47.z = as_type<float>(_706);
    out.m_47.w = as_type<float>(_708);
    out.m_49.x = as_type<float>(_710);
    out.m_49.y = as_type<float>(_712);
    out.m_49.z = as_type<float>(_714);
    out.m_49.w = as_type<float>(_716);
    out.m_51.x = as_type<float>(_718);
    out.m_51.y = as_type<float>(_720);
    out.m_51.z = as_type<float>(_722);
    out.m_51.w = as_type<float>(_724);
    return main0_out_u{as_type<uint4>(out.m_37), as_type<uint4>(out.m_39), as_type<uint4>(out.m_41), as_type<uint4>(out.m_43), as_type<uint4>(out.m_45), as_type<uint4>(out.m_47), as_type<uint4>(out.m_49), as_type<uint4>(out.m_51)};
}

