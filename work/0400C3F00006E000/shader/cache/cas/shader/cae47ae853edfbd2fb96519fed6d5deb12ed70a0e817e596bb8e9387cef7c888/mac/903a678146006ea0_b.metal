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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
    device _23* vp_s0 [[id(1)]];
    texture2d<float> vp_t_tcb_8 [[id(2)]];
    sampler vp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> vp_t_tcb_A [[id(4)]];
    sampler vp_t_tcb_ASmplr [[id(5)]];
    sampler vp_t_tcb_8Smplr_w [[id(6)]];
    sampler vp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _856 = false;
    bool _680 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _55 = -2;
    int _57 = 0;
    int _59 = 0;
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
    float _110 = 1000000.0;
    bool _114;
    bool _257;
    float _642;
    int _644;
    int _646;
    int _648;
    bool _656;
    int _658;
    int _712;
    int _714;
    int _720;
    int _726;
    int _732;
    int _738;
    int _744;
    int _750;
    int _756;
    int _762;
    int _768;
    int _774;
    int _780;
    int _786;
    int _792;
    int _798;
    bool _802;
    int _804;
    int _810;
    int _816;
    int _822;
    int _828;
    int _832;
    int _836;
    int _840;
    int _844;
    int _848;
    int _852;
    int _854;
    int _1214;
    int _1282;
    int _1284;
    int _1286;
    int _1288;
    int _1290;
    int _1292;
    int _1294;
    int _1296;
    int _1298;
    int _1300;
    int _1302;
    int _1304;
    int _1306;
    int _1308;
    int _1310;
    int _1312;
    int _1314;
    int _1316;
    int _1318;
    int _1320;
    int _1322;
    int _1324;
    int _1326;
    int _1328;
    int _1330;
    float _1332;
    int _1334;
    int _1348;
    int _1350;
    int _1352;
    int _1354;
    int _1356;
    int _1358;
    do
    {
        int _116 = _55;
        int _118 = _57;
        int _120 = _59;
        int _122 = _61;
        int _124 = _63;
        int _126 = _65;
        int _128 = _67;
        int _130 = _69;
        int _132 = _71;
        int _134 = _73;
        int _136 = _75;
        int _138 = _77;
        int _140 = _79;
        int _142 = _81;
        int _144 = _83;
        int _146 = _85;
        int _148 = _87;
        int _150 = _89;
        int _152 = _91;
        int _154 = _93;
        int _156 = _95;
        int _158 = _97;
        int _160 = _99;
        int _162 = _101;
        int _164 = _103;
        int _166 = _105;
        int _168 = _107;
        float _170 = _110;
        float _172 = float(_116);
        float _174 = _172 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _176 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _178 = fma(_174, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2695 = float2(_176, _178);
        float4 _181 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2695, float2(0.0), isnan(_2695)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2695, float2(0.0), isnan(_2695)), level(0.0)).xyzw;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float _189 = _181.w;
        int _191 = -2;
        float _193 = _185;
        float _195 = _189;
        float _197 = _187;
        float _199 = _183;
        int _201 = -2;
        int _203 = _118;
        int _205 = _120;
        int _207 = _122;
        int _209 = _124;
        int _211 = _126;
        int _213 = _128;
        int _215 = _130;
        int _217 = _132;
        int _219 = _134;
        int _221 = _136;
        int _223 = _138;
        int _225 = _140;
        int _227 = _142;
        int _229 = _144;
        int _231 = _146;
        int _233 = _148;
        int _235 = _150;
        int _237 = _152;
        int _239 = _154;
        int _241 = _156;
        int _243 = _158;
        int _245 = _160;
        int _247 = _162;
        int _249 = _164;
        int _251 = _166;
        int _253 = _168;
        float _255 = _170;
        do
        {
            int _259 = _191;
            float _261 = _193;
            float _263 = _195;
            float _265 = _197;
            float _267 = _199;
            int _269 = _201;
            int _271 = _203;
            int _273 = _205;
            int _275 = _207;
            int _277 = _209;
            int _279 = _211;
            int _281 = _213;
            int _283 = _215;
            int _285 = _217;
            int _287 = _219;
            int _289 = _221;
            int _291 = _223;
            int _293 = _225;
            int _295 = _227;
            int _297 = _229;
            int _299 = _231;
            int _301 = _233;
            int _303 = _235;
            int _305 = _237;
            int _307 = _239;
            int _309 = _241;
            int _311 = _243;
            int _313 = _245;
            int _315 = _247;
            int _317 = _249;
            int _319 = _251;
            int _321 = _253;
            float _323 = _255;
            int _325 = _259 + 1;
            float _327 = float(_116);
            float _329 = 0.0 + _261;
            float _331 = precise::clamp(_329, 0.0, 1.0);
            float _333 = _327 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _335 = float(_325);
            float _337 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _339 = fma(_333, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _341 = 0.0 + _263;
            float _343 = precise::clamp(_341, 0.0, 1.0);
            float _345 = fma(_335, _337, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _347 = 0.0 + _265;
            float _349 = precise::clamp(_347, 0.0, 1.0);
            float _351 = 0.0 + _267;
            float _353 = precise::clamp(_351, 0.0, 1.0);
            float2 _2817 = float2(_345, _339);
            float4 _355 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2817, float2(0.0), isnan(_2817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2817, float2(0.0), isnan(_2817)), level(0.0)).xyzw;
            float _357 = _355.x;
            float _359 = _355.y;
            float _361 = _355.z;
            float _363 = _355.w;
            float _365 = _343 * 65535.0;
            float _367 = _349 * 65535.0;
            float _369 = _331 * 65535.0;
            float _371 = _353 * 65535.0;
            float _373 = rint(_365);
            int _375 = int(_373);
            float _377 = rint(_367);
            int _379 = int(_377);
            float _381 = rint(_369);
            int _383 = int(_381);
            uint _386 = extract_bits(uint(_375), 0u, 8u);
            int _388 = int(_386) & 255;
            uint _390 = extract_bits(uint(_375), 8u, 8u);
            int _392 = int(_390) & 255;
            int _394 = _392 << 8;
            int _396 = _388 | _394;
            float _398 = rint(_371);
            int _400 = int(_398);
            uint _402 = extract_bits(uint(_396), 0u, 8u);
            int _404 = int(_402) & 255;
            uint _406 = extract_bits(uint(_396), 8u, 8u);
            int _408 = int(_406) & 255;
            int _410 = _408 << 8;
            int _412 = _404 | _410;
            uint _414 = extract_bits(uint(_379), 0u, 8u);
            int _416 = int(_414) & 255;
            int _418 = _416 << 16;
            int _420 = _412 | _418;
            uint _422 = extract_bits(uint(_379), 8u, 8u);
            int _424 = int(_422) & 255;
            int _426 = _424 << 24;
            int _428 = _420 | _426;
            float _430 = float(_269);
            bool _432 = _428 != 0;
            uint _434 = extract_bits(uint(_383), 0u, 8u);
            int _436 = int(_434) & 255;
            uint _438 = extract_bits(uint(_383), 8u, 8u);
            int _440 = int(_438) & 255;
            int _442 = _440 << 8;
            int _444 = _436 | _442;
            float _446 = fma(_430, _337, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _448 = extract_bits(uint(_444), 0u, 8u);
            int _450 = int(_448) & 255;
            uint _452 = extract_bits(uint(_444), 8u, 8u);
            int _454 = int(_452) & 255;
            int _456 = _454 << 8;
            int _458 = _450 | _456;
            uint _460 = extract_bits(uint(_400), 0u, 8u);
            int _462 = int(_460) & 255;
            int _464 = _462 << 16;
            int _466 = _458 | _464;
            uint _468 = extract_bits(uint(_400), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 24;
            int _474 = _466 | _472;
            bool _476 = _474 != 0;
            bool _478 = _476 || _432;
            bool _480 = !_478;
            _191 = _325;
            _193 = _359;
            _195 = _363;
            _197 = _361;
            _199 = _357;
            int _482 = _281;
            int _484 = _273;
            int _486 = _275;
            int _488 = _277;
            int _490 = _279;
            int _492 = _283;
            int _494 = _285;
            int _496 = _295;
            int _498 = _287;
            int _500 = _289;
            int _502 = _291;
            int _504 = _293;
            int _506 = _297;
            int _508 = _299;
            int _510 = _309;
            int _512 = _301;
            int _514 = _303;
            int _516 = _305;
            int _518 = _307;
            int _520 = _311;
            int _522 = _313;
            int _524 = _315;
            int _526 = _317;
            int _528 = _319;
            int _530 = _321;
            int _532 = _428;
            int _534 = _273;
            int _536 = _275;
            int _538 = _277;
            int _540 = _279;
            int _542 = _317;
            int _544 = _319;
            int _546 = _321;
            int _548 = _281;
            int _550 = _283;
            int _552 = _285;
            int _554 = _287;
            int _556 = _289;
            int _558 = _291;
            int _560 = _293;
            int _562 = _295;
            int _564 = _297;
            int _566 = _299;
            int _568 = _301;
            int _570 = _303;
            int _572 = _305;
            int _574 = _307;
            int _576 = _315;
            int _578 = _313;
            int _580 = _311;
            int _582 = _271;
            int _584 = _273;
            int _586 = _275;
            int _588 = _277;
            int _590 = _279;
            int _592 = _281;
            int _594 = _283;
            int _596 = _285;
            int _598 = _287;
            int _600 = _289;
            int _602 = _291;
            int _604 = _293;
            int _606 = _295;
            int _608 = _297;
            int _610 = _299;
            int _612 = _301;
            int _614 = _303;
            int _616 = _305;
            int _618 = _307;
            int _620 = _309;
            int _622 = _311;
            int _624 = _313;
            int _626 = _315;
            int _628 = _317;
            int _630 = _319;
            int _632 = _321;
            int _634 = _474;
            int _636 = _400;
            int _638 = _428;
            int _640 = as_type<int>(_430);
            _642 = _323;
            _644 = _474;
            _646 = _428;
            _648 = as_type<int>(_361);
            if (!_480)
            {
                bool _650 = _271 > 0;
                bool _652 = !_650;
                if (!_652)
                {
                    int _654 = 0;
                    do
                    {
                        _658 = _654;
                        int _660 = _658 * 8;
                        uint _662 = uint(int(uint(_660) >> uint(2)));
                        float _664 = as_type<float>(_31[int(_662)]);
                        int _666 = _660 + 4;
                        uint _668 = uint(int(uint(_666) >> uint(2)));
                        float _670 = as_type<float>(_31[int(_668)]);
                        bool _672 = as_type<int>(_664) != _428;
                        bool _674 = as_type<int>(_670) != _474;
                        bool _676 = _674 || _672;
                        bool _678 = !_676;
                        _680 = _678;
                        if (_680)
                        {
                            break;
                        }
                        int _682 = _658 + 1;
                        bool _684 = _682 >= _271;
                        _656 = !_684;
                        _654 = _682;
                    } while (_656);
                }
                if (!_680)
                {
                    int _686 = _271 * 4;
                    int _688 = _271 * 8;
                    int _690 = _271 + 1;
                    bool _692 = _686 == 16;
                    bool _694 = _686 == 0;
                    uint _696 = uint(int(uint(_688) >> uint(2)));
                    _31[int(_696)] = uint(_428);
                    int _698 = _688 + 4;
                    uint _700 = uint(int(uint(_698) >> uint(2)));
                    _31[int(_700)] = uint(_474);
                    bool _702 = _686 == 4;
                    bool _704 = _686 == 8;
                    bool _706 = _686 == 12;
                    bool _708 = _686 == 20;
                    bool _710 = _686 == 24;
                    _582 = _690;
                    _636 = _688;
                    _640 = _686;
                    _712 = _688;
                    _714 = _686;
                    if (_692)
                    {
                        _482 = 1;
                    }
                    int _716 = _482;
                    bool _718 = _686 == 44;
                    _592 = _716;
                    _720 = _716;
                    if (_694)
                    {
                        _484 = 1;
                    }
                    int _722 = _484;
                    bool _724 = _686 == 28;
                    _584 = _722;
                    _726 = _722;
                    if (_702)
                    {
                        _486 = 1;
                    }
                    int _728 = _486;
                    bool _730 = _686 == 32;
                    _586 = _728;
                    _732 = _728;
                    if (_704)
                    {
                        _488 = 1;
                    }
                    int _734 = _488;
                    bool _736 = _686 == 36;
                    _588 = _734;
                    _738 = _734;
                    if (_706)
                    {
                        _490 = 1;
                    }
                    int _740 = _490;
                    bool _742 = _686 == 40;
                    _590 = _740;
                    _744 = _740;
                    if (_708)
                    {
                        _492 = 1;
                    }
                    int _746 = _492;
                    bool _748 = _686 == 48;
                    _594 = _746;
                    _750 = _746;
                    if (_710)
                    {
                        _494 = 1;
                    }
                    int _752 = _494;
                    bool _754 = _686 == 52;
                    _596 = _752;
                    _756 = _752;
                    if (_718)
                    {
                        _496 = 1;
                    }
                    int _758 = _496;
                    bool _760 = _686 == 72;
                    _606 = _758;
                    _762 = _758;
                    if (_724)
                    {
                        _498 = 1;
                    }
                    int _764 = _498;
                    bool _766 = _686 == 56;
                    _598 = _764;
                    _768 = _764;
                    if (_730)
                    {
                        _500 = 1;
                    }
                    int _770 = _500;
                    bool _772 = _686 == 60;
                    _600 = _770;
                    _774 = _770;
                    if (_736)
                    {
                        _502 = 1;
                    }
                    int _776 = _502;
                    bool _778 = _686 == 64;
                    _602 = _776;
                    _780 = _776;
                    if (_742)
                    {
                        _504 = 1;
                    }
                    int _782 = _504;
                    bool _784 = _686 == 68;
                    _604 = _782;
                    _786 = _782;
                    if (_748)
                    {
                        _506 = 1;
                    }
                    int _788 = _506;
                    bool _790 = _686 == 76;
                    _608 = _788;
                    _792 = _788;
                    if (_754)
                    {
                        _508 = 1;
                    }
                    int _794 = _508;
                    bool _796 = _686 == 80;
                    _610 = _794;
                    _798 = _794;
                    if (_760)
                    {
                        _510 = 1;
                    }
                    int _800 = _510;
                    _802 = _690 != 25;
                    _620 = _800;
                    _804 = _800;
                    if (_766)
                    {
                        _512 = 1;
                    }
                    int _806 = _512;
                    bool _808 = _686 == 84;
                    _612 = _806;
                    _810 = _806;
                    if (_772)
                    {
                        _514 = 1;
                    }
                    int _812 = _514;
                    bool _814 = _686 == 88;
                    _614 = _812;
                    _816 = _812;
                    if (_778)
                    {
                        _516 = 1;
                    }
                    int _818 = _516;
                    bool _820 = _686 == 92;
                    _616 = _818;
                    _822 = _818;
                    if (_784)
                    {
                        _518 = 1;
                    }
                    int _824 = _518;
                    bool _826 = _686 == 96;
                    _618 = _824;
                    _828 = _824;
                    if (_790)
                    {
                        _520 = 1;
                    }
                    int _830 = _520;
                    _622 = _830;
                    _832 = _830;
                    if (_796)
                    {
                        _522 = 1;
                    }
                    int _834 = _522;
                    _624 = _834;
                    _836 = _834;
                    if (_808)
                    {
                        _524 = 1;
                    }
                    int _838 = _524;
                    _626 = _838;
                    _840 = _838;
                    if (_814)
                    {
                        _526 = 1;
                    }
                    int _842 = _526;
                    _628 = _842;
                    _844 = _842;
                    if (_820)
                    {
                        _528 = 1;
                    }
                    int _846 = _528;
                    _630 = _846;
                    _848 = _846;
                    if (_826)
                    {
                        _530 = 1;
                    }
                    int _850 = _530;
                    _632 = _850;
                    _852 = _850;
                }
                if ((!_802) || _680)
                {
                    if (!_680)
                    {
                        _854 = 25;
                        _856 = true;
                        if (_856)
                        {
                            break;
                        }
                    }
                    _680 = false;
                    int _858 = _658 * 4;
                    bool _860 = _858 == 0;
                    bool _862 = _858 == 4;
                    bool _864 = _858 == 8;
                    bool _866 = _858 == 12;
                    bool _868 = _858 == 88;
                    bool _870 = _858 == 92;
                    bool _872 = _858 == 96;
                    if (_860)
                    {
                        _532 = _273;
                    }
                    int _874 = _532;
                    bool _876 = _858 == 16;
                    int _878 = _874;
                    if (_862)
                    {
                        _878 = _275;
                    }
                    int _880 = _878;
                    bool _882 = _858 == 20;
                    int _884 = _880;
                    if (_864)
                    {
                        _884 = _277;
                    }
                    int _886 = _884;
                    bool _888 = _858 == 24;
                    int _890 = _886;
                    if (_866)
                    {
                        _890 = _279;
                    }
                    int _892 = _890;
                    bool _894 = _858 == 84;
                    int _896 = int(_888);
                    int _898 = _882 ? 2 : 0;
                    int _900 = _896 | _898;
                    int _902 = _876 ? 4 : 0;
                    int _904 = _900 | _902;
                    int _906 = _894 ? 8 : 0;
                    int _908 = _904 | _906;
                    int _910 = _868 ? 16 : 0;
                    int _912 = _908 | _910;
                    int _914 = _870 ? 32 : 0;
                    int _916 = _912 | _914;
                    int _918 = _872 ? 64 : 0;
                    int _920 = _916 | _918;
                    int _922 = _920 & 8;
                    int _924 = _892;
                    _634 = _922;
                    if (_876)
                    {
                        _924 = _281;
                    }
                    int _926 = _924;
                    bool _928 = _858 == 80;
                    int _930 = _926;
                    if (_882)
                    {
                        _930 = _283;
                    }
                    int _932 = _930;
                    bool _934 = _858 == 76;
                    int _936 = _932;
                    if (_888)
                    {
                        _936 = _285;
                    }
                    int _938 = _936;
                    bool _940 = _858 == 28;
                    int _942 = int(_940);
                    int _944 = _934 ? 2 : 0;
                    int _946 = _942 | _944;
                    int _948 = _928 ? 4 : 0;
                    int _950 = _946 | _948;
                    int _952 = _894 ? 8 : 0;
                    int _954 = _950 | _952;
                    int _956 = _868 ? 16 : 0;
                    int _958 = _954 | _956;
                    int _960 = _870 ? 32 : 0;
                    int _962 = _958 | _960;
                    int _964 = _872 ? 64 : 0;
                    int _966 = _962 | _964;
                    int _968 = _966 & 2;
                    int _970 = int(_940);
                    int _972 = _934 ? 2 : 0;
                    int _974 = _970 | _972;
                    int _976 = _928 ? 4 : 0;
                    int _978 = _974 | _976;
                    int _980 = _894 ? 8 : 0;
                    int _982 = _978 | _980;
                    int _984 = _868 ? 16 : 0;
                    int _986 = _982 | _984;
                    int _988 = _870 ? 32 : 0;
                    int _990 = _986 | _988;
                    int _992 = _872 ? 64 : 0;
                    int _994 = _990 | _992;
                    int _996 = _994 & 4;
                    int _998 = _938;
                    _636 = _968;
                    _640 = _996;
                    if (_940)
                    {
                        _998 = _287;
                    }
                    int _1000 = _998;
                    bool _1002 = _858 == 32;
                    int _1004 = _1000;
                    if (_1002)
                    {
                        _1004 = _289;
                    }
                    int _1006 = _1004;
                    bool _1008 = _858 == 36;
                    int _1010 = _1006;
                    if (_1008)
                    {
                        _1010 = _291;
                    }
                    int _1012 = _1010;
                    bool _1014 = _858 == 40;
                    int _1016 = _1012;
                    if (_1014)
                    {
                        _1016 = _293;
                    }
                    int _1018 = _1016;
                    bool _1020 = _858 == 44;
                    int _1022 = _1018;
                    if (_1020)
                    {
                        _1022 = _295;
                    }
                    int _1024 = _1022;
                    bool _1026 = _858 == 48;
                    int _1028 = _1024;
                    if (_1026)
                    {
                        _1028 = _297;
                    }
                    int _1030 = _1028;
                    bool _1032 = _858 == 52;
                    int _1034 = _1030;
                    if (_1032)
                    {
                        _1034 = _299;
                    }
                    int _1036 = _1034;
                    bool _1038 = _858 == 56;
                    int _1040 = _1036;
                    if (_1038)
                    {
                        _1040 = _301;
                    }
                    int _1042 = _1040;
                    bool _1044 = _858 == 60;
                    int _1046 = _1042;
                    if (_1044)
                    {
                        _1046 = _303;
                    }
                    int _1048 = _1046;
                    bool _1050 = _858 == 64;
                    int _1052 = _1048;
                    if (_1050)
                    {
                        _1052 = _305;
                    }
                    int _1054 = _1052;
                    bool _1056 = _858 == 68;
                    int _1058 = _1054;
                    if (_1056)
                    {
                        _1058 = _307;
                    }
                    int _1060 = _1058;
                    bool _1062 = _858 == 72;
                    int _1064 = int(_1062);
                    int _1066 = _934 ? 2 : 0;
                    int _1068 = _1064 | _1066;
                    int _1070 = _928 ? 4 : 0;
                    int _1072 = _1068 | _1070;
                    int _1074 = _894 ? 8 : 0;
                    int _1076 = _1072 | _1074;
                    int _1078 = _868 ? 16 : 0;
                    int _1080 = _1076 | _1078;
                    int _1082 = _870 ? 32 : 0;
                    int _1084 = _1080 | _1082;
                    int _1086 = _872 ? 64 : 0;
                    int _1088 = _1084 | _1086;
                    int _1090 = _1088 & 1;
                    int _1092 = _1060;
                    if (_1062)
                    {
                        _1092 = _309;
                    }
                    int _1094 = _1092;
                    bool _1096 = _858 == 4;
                    int _1098 = _1094;
                    if (_934)
                    {
                        _1098 = _311;
                    }
                    int _1100 = _1098;
                    bool _1102 = _858 == 0;
                    int _1104 = _1100;
                    if (_928)
                    {
                        _1104 = _313;
                    }
                    int _1106 = _1104;
                    bool _1108 = _858 == 12;
                    int _1110 = _1106;
                    if (_894)
                    {
                        _1110 = _315;
                    }
                    int _1112 = _1110;
                    bool _1114 = _858 == 8;
                    int _1116 = _1112;
                    if (_868)
                    {
                        _1116 = _317;
                    }
                    int _1118 = _1116;
                    int _1120 = _1118;
                    if (_870)
                    {
                        _1120 = _319;
                    }
                    int _1122 = _1120;
                    int _1124 = _1122;
                    if (_872)
                    {
                        _1124 = _321;
                    }
                    int _1126 = _1124;
                    int _1128 = _1126 + 1;
                    _638 = _1128;
                    if (_1102)
                    {
                        _534 = _1128;
                    }
                    int _1130 = _534;
                    bool _1132 = _858 == 16;
                    _584 = _1130;
                    if (_1096)
                    {
                        _536 = _1128;
                    }
                    int _1134 = _536;
                    bool _1136 = _858 == 20;
                    _586 = _1134;
                    if (_1114)
                    {
                        _538 = _1128;
                    }
                    int _1138 = _538;
                    bool _1140 = _858 == 24;
                    _588 = _1138;
                    if (_1108)
                    {
                        _540 = _1128;
                    }
                    int _1142 = _540;
                    bool _1144 = _858 == 28;
                    _590 = _1142;
                    if (_868)
                    {
                        _542 = _1128;
                    }
                    int _1146 = _542;
                    _628 = _1146;
                    if (_870)
                    {
                        _544 = _1128;
                    }
                    int _1148 = _544;
                    _630 = _1148;
                    if (_872)
                    {
                        _546 = _1128;
                    }
                    int _1150 = _546;
                    _632 = _1150;
                    if (_1132)
                    {
                        _548 = _1128;
                    }
                    int _1152 = _548;
                    bool _1154 = _858 == 32;
                    _592 = _1152;
                    if (_1136)
                    {
                        _550 = _1128;
                    }
                    int _1156 = _550;
                    bool _1158 = _858 == 36;
                    _594 = _1156;
                    if (_1140)
                    {
                        _552 = _1128;
                    }
                    int _1160 = _552;
                    bool _1162 = _858 == 40;
                    _596 = _1160;
                    if (_1144)
                    {
                        _554 = _1128;
                    }
                    int _1164 = _554;
                    bool _1166 = _858 == 44;
                    _598 = _1164;
                    if (_1154)
                    {
                        _556 = _1128;
                    }
                    int _1168 = _556;
                    bool _1170 = _858 == 48;
                    _600 = _1168;
                    if (_1158)
                    {
                        _558 = _1128;
                    }
                    int _1172 = _558;
                    bool _1174 = _858 == 52;
                    _602 = _1172;
                    if (_1162)
                    {
                        _560 = _1128;
                    }
                    int _1176 = _560;
                    bool _1178 = _858 == 56;
                    _604 = _1176;
                    if (_1166)
                    {
                        _562 = _1128;
                    }
                    int _1180 = _562;
                    bool _1182 = _858 == 60;
                    _606 = _1180;
                    if (_1170)
                    {
                        _564 = _1128;
                    }
                    int _1184 = _564;
                    bool _1186 = _858 == 64;
                    _608 = _1184;
                    if (_1174)
                    {
                        _566 = _1128;
                    }
                    int _1188 = _566;
                    bool _1190 = _858 == 68;
                    _610 = _1188;
                    if (_1178)
                    {
                        _568 = _1128;
                    }
                    int _1192 = _568;
                    bool _1194 = _922 != 0;
                    _612 = _1192;
                    if (_1182)
                    {
                        _570 = _1128;
                    }
                    int _1196 = _570;
                    bool _1198 = _996 != 0;
                    _614 = _1196;
                    if (_1186)
                    {
                        _572 = _1128;
                    }
                    int _1200 = _572;
                    bool _1202 = _968 != 0;
                    _616 = _1200;
                    if (_1190)
                    {
                        _574 = _1128;
                    }
                    int _1204 = _574;
                    bool _1206 = _1090 != 0;
                    _618 = _1204;
                    if (_1194)
                    {
                        _576 = _1128;
                    }
                    int _1208 = _576;
                    _626 = _1208;
                    if (_1198)
                    {
                        _578 = _1128;
                    }
                    int _1210 = _578;
                    _624 = _1210;
                    if (_1202)
                    {
                        _580 = _1128;
                    }
                    int _1212 = _580;
                    _622 = _1212;
                    if (_1206)
                    {
                        _620 = _1128;
                    }
                }
            }
            _1214 = _582;
            int _1216 = _584;
            int _1218 = _586;
            int _1220 = _588;
            int _1222 = _590;
            int _1224 = _592;
            int _1226 = _594;
            int _1228 = _596;
            int _1230 = _598;
            int _1232 = _600;
            int _1234 = _602;
            int _1236 = _604;
            int _1238 = _606;
            int _1240 = _608;
            int _1242 = _610;
            int _1244 = _612;
            int _1246 = _614;
            int _1248 = _616;
            int _1250 = _618;
            int _1252 = _620;
            int _1254 = _622;
            int _1256 = _624;
            int _1258 = _626;
            int _1260 = _628;
            int _1262 = _630;
            int _1264 = _632;
            int _1266 = _634;
            int _1268 = _636;
            int _1270 = _638;
            int _1272 = _640;
            float2 _3981 = float2(_446, _339);
            float _1274 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_3981, float2(0.0), isnan(_3981)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_3981, float2(0.0), isnan(_3981)), level(0.0)).x;
            int _1276 = _269 + 1;
            bool _1278 = _1276 >= 3;
            float _1280 = precise::min(_1274, _323);
            _257 = !_1278;
            _201 = _1276;
            _203 = _1214;
            _205 = _1216;
            _207 = _1218;
            _209 = _1220;
            _211 = _1222;
            _213 = _1224;
            _215 = _1226;
            _217 = _1228;
            _219 = _1230;
            _221 = _1232;
            _223 = _1234;
            _225 = _1236;
            _227 = _1238;
            _229 = _1240;
            _231 = _1242;
            _233 = _1244;
            _235 = _1246;
            _237 = _1248;
            _239 = _1250;
            _241 = _1252;
            _243 = _1254;
            _245 = _1256;
            _247 = _1258;
            _249 = _1260;
            _251 = _1262;
            _253 = _1264;
            _255 = _1280;
            _726 = _1216;
            _732 = _1218;
            _738 = _1220;
            _744 = _1222;
            _720 = _1224;
            _750 = _1226;
            _756 = _1228;
            _768 = _1230;
            _774 = _1232;
            _780 = _1234;
            _786 = _1236;
            _762 = _1238;
            _792 = _1240;
            _798 = _1242;
            _810 = _1244;
            _816 = _1246;
            _822 = _1248;
            _828 = _1250;
            _804 = _1252;
            _832 = _1254;
            _836 = _1256;
            _840 = _1258;
            _844 = _1260;
            _848 = _1262;
            _852 = _1264;
            _642 = _1280;
            _644 = _1266;
            _712 = _1268;
            _646 = _1270;
            _714 = _1272;
        } while (_257);
        if (!_856)
        {
            _854 = _1214;
        }
        _856 = false;
        _1282 = _726;
        _1284 = _732;
        _1286 = _738;
        _1288 = _744;
        _1290 = _720;
        _1292 = _750;
        _1294 = _756;
        _1296 = _768;
        _1298 = _774;
        _1300 = _780;
        _1302 = _786;
        _1304 = _762;
        _1306 = _792;
        _1308 = _798;
        _1310 = _810;
        _1312 = _816;
        _1314 = _822;
        _1316 = _828;
        _1318 = _804;
        _1320 = _832;
        _1322 = _836;
        _1324 = _840;
        _1326 = _844;
        _1328 = _848;
        _1330 = _852;
        _1332 = _642;
        _1334 = _854;
        int _1336 = _644;
        int _1338 = _712;
        int _1340 = _646;
        int _1342 = _714;
        int _1344 = _116 + 1;
        bool _1346 = _1344 >= 3;
        _114 = !_1346;
        _55 = _1344;
        _57 = _1334;
        _59 = _1282;
        _61 = _1284;
        _63 = _1286;
        _65 = _1288;
        _67 = _1290;
        _69 = _1292;
        _71 = _1294;
        _73 = _1296;
        _75 = _1298;
        _77 = _1300;
        _79 = _1302;
        _81 = _1304;
        _83 = _1306;
        _85 = _1308;
        _87 = _1310;
        _89 = _1312;
        _91 = _1314;
        _93 = _1316;
        _95 = _1318;
        _97 = _1320;
        _99 = _1322;
        _101 = _1324;
        _103 = _1326;
        _105 = _1328;
        _107 = _1330;
        _110 = _1332;
        _1348 = _1336;
        _1350 = _1338;
        _1352 = _1340;
        _1354 = _1342;
        _1356 = _1336;
        _1358 = _1282;
    } while (_114);
    bool _1360 = _1334 > 0;
    if (!_1360)
    {
        _648 = 0;
    }
    int _1362 = _648;
    bool _1364 = !_1360;
    int _1366 = _1362;
    if (!_1364)
    {
        bool _1368 = _1334 > 3;
        bool _1370 = !_1368;
        int _1372 = 0;
        int _1374 = 0;
        int _1376 = 0;
        int _1378 = 0;
        int _1380 = 0;
        int _1382 = -1;
        int _1384 = 0;
        if (!_1370)
        {
            int _1386 = _1334 + (-3);
            _1382 = 0;
            bool _1388;
            do
            {
                int _1390 = _1372;
                int _1392 = _1374;
                int _1394 = _1348;
                int _1396 = _1350;
                int _1398 = _1376;
                int _1400 = _1352;
                int _1402 = _1354;
                int _1404 = _1390 * 4;
                int _1406 = _1390 + 1;
                int _1408 = _1390 + 2;
                bool _1410 = _1404 == 0;
                int _1412 = _1406 * 4;
                bool _1414 = _1404 == 4;
                int _1416 = _1408 * 4;
                bool _1418 = _1404 == 8;
                bool _1420 = _1404 == 12;
                bool _1422 = _1404 == 16;
                bool _1424 = _1412 == 8;
                int _1426 = _1390 + 3;
                int _1428 = _1394;
                int _1430 = _1396;
                int _1432 = _1400;
                int _1434 = _1402;
                int _1436 = _1392;
                int _1438 = _1398;
                if (_1410)
                {
                    _1428 = _1282;
                }
                int _1440 = _1428;
                bool _1442 = _1404 == 24;
                int _1444 = _1440;
                if (_1414)
                {
                    _1444 = _1284;
                }
                int _1446 = _1444;
                bool _1448 = _1404 == 20;
                int _1450 = _1446;
                if (_1418)
                {
                    _1450 = _1286;
                }
                int _1452 = _1450;
                bool _1454 = _1404 == 32;
                int _1456 = _1452;
                if (_1420)
                {
                    _1456 = _1288;
                }
                int _1458 = _1456;
                bool _1460 = _1404 == 28;
                int _1462 = _1458;
                if (_1422)
                {
                    _1462 = _1290;
                }
                int _1464 = _1462;
                bool _1466 = _1404 == 40;
                int _1468 = _1426 * 4;
                int _1470 = _1464;
                if (_1448)
                {
                    _1470 = _1292;
                }
                int _1472 = _1470;
                bool _1474 = _1404 == 36;
                int _1476 = _1472;
                if (_1442)
                {
                    _1476 = _1294;
                }
                int _1478 = _1476;
                bool _1480 = _1412 == 0;
                int _1482 = _1478;
                if (_1460)
                {
                    _1482 = _1296;
                }
                int _1484 = _1482;
                bool _1486 = _1412 == 4;
                int _1488 = _1484;
                if (_1454)
                {
                    _1488 = _1298;
                }
                int _1490 = _1488;
                bool _1492 = _1412 == 12;
                int _1494 = _1490;
                if (_1474)
                {
                    _1494 = _1300;
                }
                int _1496 = _1494;
                bool _1498 = _1404 == 44;
                int _1500 = _1496;
                if (_1466)
                {
                    _1500 = _1302;
                }
                int _1502 = _1500;
                bool _1504 = _1412 == 16;
                int _1506 = _1502;
                if (_1480)
                {
                    _1430 = _1282;
                }
                int _1508 = _1430;
                bool _1510 = _1404 == 48;
                int _1512 = _1508;
                if (_1486)
                {
                    _1512 = _1284;
                }
                int _1514 = _1512;
                bool _1516 = _1412 == 20;
                int _1518 = _1514;
                if (_1424)
                {
                    _1518 = _1286;
                }
                int _1520 = _1518;
                bool _1522 = _1412 == 24;
                int _1524 = _1520;
                if (_1492)
                {
                    _1524 = _1288;
                }
                int _1526 = _1524;
                bool _1528 = _1412 == 28;
                int _1530 = _1526;
                if (_1498)
                {
                    _1506 = _1304;
                }
                int _1532 = _1506;
                bool _1534 = _1404 == 52;
                int _1536 = _1532;
                if (_1504)
                {
                    _1530 = _1290;
                }
                int _1538 = _1530;
                bool _1540 = _1412 == 32;
                int _1542 = _1538;
                if (_1510)
                {
                    _1536 = _1306;
                }
                int _1544 = _1536;
                bool _1546 = _1404 == 56;
                int _1548 = _1544;
                if (_1516)
                {
                    _1542 = _1292;
                }
                int _1550 = _1542;
                bool _1552 = _1412 == 36;
                int _1554 = _1550;
                if (_1522)
                {
                    _1554 = _1294;
                }
                int _1556 = _1554;
                bool _1558 = _1412 == 40;
                int _1560 = _1556;
                if (_1528)
                {
                    _1560 = _1296;
                }
                int _1562 = _1560;
                bool _1564 = _1412 == 44;
                int _1566 = _1562;
                if (_1534)
                {
                    _1548 = _1308;
                }
                int _1568 = _1548;
                bool _1570 = _1404 == 60;
                int _1572 = _1568;
                if (_1540)
                {
                    _1566 = _1298;
                }
                int _1574 = _1566;
                bool _1576 = _1412 == 48;
                int _1578 = _1574;
                if (_1546)
                {
                    _1572 = _1310;
                }
                int _1580 = _1572;
                bool _1582 = _1404 == 64;
                int _1584 = _1580;
                if (_1552)
                {
                    _1578 = _1300;
                }
                int _1586 = _1578;
                bool _1588 = _1412 == 52;
                int _1590 = _1586;
                if (_1558)
                {
                    _1590 = _1302;
                }
                int _1592 = _1590;
                bool _1594 = _1412 == 56;
                int _1596 = _1592;
                if (_1564)
                {
                    _1596 = _1304;
                }
                int _1598 = _1596;
                bool _1600 = _1412 == 60;
                int _1602 = _1598;
                if (_1570)
                {
                    _1584 = _1312;
                }
                int _1604 = _1584;
                bool _1606 = _1416 == 0;
                int _1608 = _1604;
                if (_1576)
                {
                    _1602 = _1306;
                }
                int _1610 = _1602;
                bool _1612 = _1404 == 68;
                int _1614 = _1610;
                if (_1582)
                {
                    _1608 = _1314;
                }
                int _1616 = _1608;
                bool _1618 = _1416 == 4;
                int _1620 = _1616;
                if (_1588)
                {
                    _1614 = _1308;
                }
                int _1622 = _1614;
                bool _1624 = _1416 == 8;
                int _1626 = _1622;
                if (_1594)
                {
                    _1626 = _1310;
                }
                int _1628 = _1626;
                bool _1630 = _1416 == 12;
                int _1632 = _1628;
                if (_1600)
                {
                    _1632 = _1312;
                }
                int _1634 = _1632;
                bool _1636 = _1416 == 16;
                int _1638 = _1634;
                if (_1606)
                {
                    _1432 = _1282;
                }
                int _1640 = _1432;
                bool _1642 = _1412 == 64;
                int _1644 = _1640;
                if (_1612)
                {
                    _1620 = _1316;
                }
                int _1646 = _1620;
                bool _1648 = _1416 == 20;
                int _1650 = _1646;
                if (_1618)
                {
                    _1644 = _1284;
                }
                int _1652 = _1644;
                bool _1654 = _1404 == 72;
                int _1656 = _1652;
                if (_1624)
                {
                    _1656 = _1286;
                }
                int _1658 = _1656;
                bool _1660 = _1416 == 24;
                int _1662 = _1658;
                if (_1630)
                {
                    _1662 = _1288;
                }
                int _1664 = _1662;
                bool _1666 = _1416 == 28;
                int _1668 = _1664;
                if (_1636)
                {
                    _1668 = _1290;
                }
                int _1670 = _1668;
                bool _1672 = _1416 == 32;
                int _1674 = _1670;
                if (_1642)
                {
                    _1638 = _1314;
                }
                int _1676 = _1638;
                bool _1678 = _1412 == 68;
                int _1680 = _1676;
                if (_1648)
                {
                    _1674 = _1292;
                }
                int _1682 = _1674;
                bool _1684 = _1416 == 36;
                int _1686 = _1682;
                if (_1654)
                {
                    _1650 = _1318;
                }
                int _1688 = _1650;
                bool _1690 = _1404 == 76;
                int _1692 = _1688;
                if (_1660)
                {
                    _1686 = _1294;
                }
                int _1694 = _1686;
                bool _1696 = _1416 == 40;
                int _1698 = _1694;
                if (_1666)
                {
                    _1698 = _1296;
                }
                int _1700 = _1698;
                bool _1702 = _1416 == 44;
                int _1704 = _1700;
                if (_1672)
                {
                    _1704 = _1298;
                }
                int _1706 = _1704;
                bool _1708 = _1416 == 48;
                int _1710 = _1706;
                if (_1678)
                {
                    _1680 = _1316;
                }
                int _1712 = _1680;
                bool _1714 = _1412 == 72;
                int _1716 = _1712;
                if (_1684)
                {
                    _1710 = _1300;
                }
                int _1718 = _1710;
                bool _1720 = _1416 == 52;
                int _1722 = _1718;
                if (_1690)
                {
                    _1692 = _1320;
                }
                int _1724 = _1692;
                bool _1726 = _1404 == 80;
                int _1728 = _1724;
                if (_1696)
                {
                    _1722 = _1302;
                }
                int _1730 = _1722;
                bool _1732 = _1416 == 56;
                int _1734 = _1730;
                if (_1702)
                {
                    _1734 = _1304;
                }
                int _1736 = _1734;
                bool _1738 = _1416 == 60;
                int _1740 = _1736;
                if (_1708)
                {
                    _1740 = _1306;
                }
                int _1742 = _1740;
                bool _1744 = _1412 == 76;
                int _1746 = _1742;
                if (_1714)
                {
                    _1716 = _1318;
                }
                int _1748 = _1716;
                bool _1750 = _1416 == 64;
                int _1752 = _1748;
                if (_1720)
                {
                    _1746 = _1308;
                }
                int _1754 = _1746;
                bool _1756 = _1404 == 84;
                int _1758 = _1754;
                if (_1726)
                {
                    _1728 = _1322;
                }
                int _1760 = _1728;
                bool _1762 = _1416 == 68;
                int _1764 = _1760;
                if (_1732)
                {
                    _1758 = _1310;
                }
                int _1766 = _1758;
                bool _1768 = _1416 == 72;
                int _1770 = _1766;
                if (_1738)
                {
                    _1770 = _1312;
                }
                int _1772 = _1770;
                bool _1774 = _1416 == 76;
                int _1776 = _1772;
                if (_1744)
                {
                    _1752 = _1320;
                }
                int _1778 = _1752;
                bool _1780 = _1412 == 80;
                int _1782 = _1778;
                if (_1750)
                {
                    _1776 = _1314;
                }
                int _1784 = _1776;
                bool _1786 = _1468 == 0;
                int _1788 = _1784;
                if (_1756)
                {
                    _1764 = _1324;
                }
                int _1790 = _1764;
                bool _1792 = _1468 == 4;
                int _1794 = _1790;
                if (_1762)
                {
                    _1788 = _1316;
                }
                int _1796 = _1788;
                bool _1798 = _1416 == 80;
                int _1800 = _1796;
                if (_1768)
                {
                    _1800 = _1318;
                }
                int _1802 = _1800;
                bool _1804 = _1468 == 8;
                int _1806 = _1802;
                if (_1774)
                {
                    _1806 = _1320;
                }
                int _1808 = _1806;
                bool _1810 = _1404 == 88;
                int _1812 = _1808;
                if (_1780)
                {
                    _1782 = _1322;
                }
                int _1814 = _1782;
                bool _1816 = _1412 == 84;
                int _1818 = _1814;
                if (_1786)
                {
                    _1434 = _1282;
                }
                int _1820 = _1434;
                bool _1822 = _1468 == 12;
                int _1824 = _1820;
                if (_1792)
                {
                    _1824 = _1284;
                }
                int _1826 = _1824;
                bool _1828 = _1416 == 84;
                int _1830 = _1826;
                if (_1798)
                {
                    _1812 = _1322;
                }
                int _1832 = _1812;
                bool _1834 = _1468 == 16;
                int _1836 = _1832;
                if (_1804)
                {
                    _1830 = _1286;
                }
                int _1838 = _1830;
                bool _1840 = _1404 == 92;
                int _1842 = _1838;
                if (_1810)
                {
                    _1794 = _1326;
                }
                int _1844 = _1794;
                bool _1846 = _1468 == 20;
                int _1848 = _1844;
                if (_1816)
                {
                    _1818 = _1324;
                }
                int _1850 = _1818;
                bool _1852 = _1468 == 24;
                int _1854 = _1850;
                if (_1822)
                {
                    _1842 = _1288;
                }
                int _1856 = _1842;
                bool _1858 = _1412 == 88;
                int _1860 = _1856;
                if (_1828)
                {
                    _1836 = _1324;
                }
                int _1862 = _1836;
                bool _1864 = _1416 == 88;
                int _1866 = _1862;
                if (_1834)
                {
                    _1860 = _1290;
                }
                int _1868 = _1860;
                bool _1870 = _1468 == 28;
                int _1872 = _1868;
                if (_1840)
                {
                    _1848 = _1328;
                }
                int _1874 = _1848;
                bool _1876 = _1468 == 32;
                int _1878 = _1874;
                if (_1846)
                {
                    _1872 = _1292;
                }
                int _1880 = _1872;
                bool _1882 = _1404 == 96;
                int _1884 = _1880;
                if (_1852)
                {
                    _1884 = _1294;
                }
                int _1886 = _1884;
                bool _1888 = _1468 == 36;
                int _1890 = _1886;
                if (_1858)
                {
                    _1854 = _1326;
                }
                int _1892 = _1854;
                bool _1894 = _1468 == 40;
                int _1896 = _1892;
                if (_1864)
                {
                    _1866 = _1326;
                }
                int _1898 = _1866;
                bool _1900 = _1412 == 92;
                int _1902 = _1898;
                if (_1870)
                {
                    _1890 = _1296;
                }
                int _1904 = _1890;
                bool _1906 = _1468 == 44;
                int _1908 = _1904;
                if (_1876)
                {
                    _1908 = _1298;
                }
                int _1910 = _1908;
                bool _1912 = _1468 == 48;
                int _1914 = _1910;
                if (_1882)
                {
                    _1878 = _1330;
                }
                int _1916 = _1878;
                bool _1918 = _1412 == 96;
                int _1920 = _1916;
                if (_1888)
                {
                    _1914 = _1300;
                }
                int _1922 = _1914;
                bool _1924 = _1468 == 52;
                int _1926 = _1922;
                if (_1894)
                {
                    _1926 = _1302;
                }
                int _1928 = _1926;
                bool _1930 = _1392 >= _1916;
                int _1932 = _1928;
                if (_1900)
                {
                    _1896 = _1328;
                }
                int _1934 = _1896;
                bool _1936 = _1468 == 56;
                int _1938 = _1934;
                if (_1906)
                {
                    _1932 = _1304;
                }
                int _1940 = _1932;
                bool _1942 = _1468 == 60;
                int _1944 = _1940;
                if (_1912)
                {
                    _1944 = _1306;
                }
                int _1946 = _1944;
                bool _1948 = _1468 == 64;
                int _1950 = _1946;
                if (_1918)
                {
                    _1938 = _1330;
                }
                int _1952 = _1938;
                bool _1954 = _1416 == 92;
                _1350 = _1952;
                if (_1924)
                {
                    _1950 = _1308;
                }
                int _1956 = _1950;
                bool _1958 = _1468 == 68;
                int _1960 = _1956;
                if (!_1930)
                {
                    _1436 = _1916;
                }
                int _1962 = _1436;
                int _1964 = _1962;
                if (_1936)
                {
                    _1960 = _1310;
                }
                int _1966 = _1960;
                bool _1968 = _1468 == 72;
                int _1970 = _1966;
                if (_1942)
                {
                    _1970 = _1312;
                }
                int _1972 = _1970;
                bool _1974 = _1962 >= _1952;
                int _1976 = _1972;
                if (_1948)
                {
                    _1976 = _1314;
                }
                int _1978 = _1976;
                bool _1980 = _1416 == 96;
                int _1982 = _1978;
                if (_1954)
                {
                    _1902 = _1328;
                }
                int _1984 = _1902;
                bool _1986 = _1468 == 76;
                int _1988 = _1984;
                if (_1958)
                {
                    _1982 = _1316;
                }
                int _1990 = _1982;
                bool _1992 = _1468 == 80;
                int _1994 = _1990;
                if (_1968)
                {
                    _1994 = _1318;
                }
                int _1996 = _1994;
                bool _1998 = _1468 == 84;
                int _2000 = _1996;
                if (_1974)
                {
                    _1920 = _1962;
                }
                int _2002 = _1920;
                int _2004 = _2002;
                if (_1980)
                {
                    _1988 = _1330;
                }
                int _2006 = _1988;
                bool _2008 = _1468 == 88;
                _1352 = _2006;
                if (!_1974)
                {
                    _2004 = _1952;
                }
                int _2010 = _2004;
                int _2012 = _2010;
                if (_1930)
                {
                    _1964 = _1398;
                }
                int _2014 = _1964;
                int _2016 = _2014;
                if (_1986)
                {
                    _2000 = _1320;
                }
                int _2018 = _2000;
                bool _2020 = _1468 == 92;
                int _2022 = _2018;
                if (_1992)
                {
                    _2022 = _1322;
                }
                int _2024 = _2022;
                bool _2026 = _2010 >= _2006;
                int _2028 = _2024;
                if (_1998)
                {
                    _2028 = _1324;
                }
                int _2030 = _2028;
                bool _2032 = _1468 == 96;
                int _2034 = _2030;
                if (!_1930)
                {
                    _2016 = _1390;
                }
                int _2036 = _2016;
                int _2038 = _1390 + 4;
                _1372 = _2038;
                int _2040 = _2036;
                _1378 = _2038;
                if (_2008)
                {
                    _2034 = _1326;
                }
                int _2042 = _2034;
                int _2044 = _2042;
                if (!_1974)
                {
                    _2040 = _1406;
                }
                int _2046 = _2040;
                bool _2048 = _2038 >= _1386;
                int _2050 = _2046;
                if (_2020)
                {
                    _2044 = _1328;
                }
                int _2052 = _2044;
                int _2054 = _2052;
                if (!_2026)
                {
                    _2012 = _2006;
                }
                int _2056 = _2012;
                _1348 = _2056;
                _1356 = _2056;
                if (_2032)
                {
                    _2054 = _1330;
                }
                int _2058 = _2054;
                _1354 = _2058;
                if (!_2026)
                {
                    _2050 = _1408;
                }
                int _2060 = _2050;
                bool _2062 = _2056 >= _2058;
                int _2064 = _2060;
                if (_2062)
                {
                    _1438 = _2060;
                }
                int _2066 = _1438;
                int _2068 = _2066;
                if (_2062)
                {
                    _2064 = _2056;
                }
                int _2070 = _2064;
                int _2072 = _2070;
                if (!_2062)
                {
                    _2068 = _1426;
                }
                int _2074 = _2068;
                _1376 = _2074;
                _1384 = _2074;
                if (!_2062)
                {
                    _2072 = _2058;
                }
                int _2076 = _2072;
                _1388 = !_2048;
                _1374 = _2076;
                _1380 = _2076;
            } while (_1388);
        }
        int _2078 = _1378;
        int _2080 = _1380;
        int _2082 = _1356;
        int _2084 = _1382;
        int _2086 = _1384;
        int _2088 = -_2078;
        int _2090 = _1334 + _2088;
        bool _2092 = _2090 > 1;
        bool _2094 = !_2092;
        int _2096 = _2082;
        int _2098 = _2090;
        int _2100 = _2080;
        int _2102 = _2086;
        int _2104 = _2078;
        int _2106 = _2084;
        int _2108 = _2080;
        int _2110 = _2086;
        if (!_2094)
        {
            int _2112 = _2078 * 4;
            int _2114 = _2078 + 1;
            bool _2116 = _2112 == 0;
            int _2118 = _2114 * 4;
            bool _2120 = _2112 == 4;
            bool _2122 = _2112 == 8;
            bool _2124 = _2112 == 12;
            bool _2126 = _2112 == 24;
            bool _2128 = _2118 == 0;
            bool _2130 = _2112 == 40;
            if (_2116)
            {
                _2096 = _1282;
            }
            int _2132 = _2096;
            bool _2134 = _2112 == 16;
            int _2136 = _2132;
            if (_2120)
            {
                _2136 = _1284;
            }
            int _2138 = _2136;
            bool _2140 = _2112 == 20;
            int _2142 = _2138;
            if (_2122)
            {
                _2142 = _1286;
            }
            int _2144 = _2142;
            bool _2146 = _2112 == 36;
            int _2148 = _2144;
            if (_2124)
            {
                _2148 = _1288;
            }
            int _2150 = _2148;
            bool _2152 = _2112 == 28;
            int _2154 = _2150;
            if (_2128)
            {
                _2098 = _1282;
            }
            int _2156 = _2098;
            bool _2158 = _2118 == 16;
            int _2160 = _2156;
            if (_2134)
            {
                _2154 = _1290;
            }
            int _2162 = _2154;
            bool _2164 = _2112 == 32;
            int _2166 = _2162;
            if (_2140)
            {
                _2166 = _1292;
            }
            int _2168 = _2166;
            bool _2170 = _2112 == 48;
            int _2172 = _2168;
            if (_2126)
            {
                _2172 = _1294;
            }
            int _2174 = _2172;
            bool _2176 = _2118 == 4;
            int _2178 = _2174;
            if (_2152)
            {
                _2178 = _1296;
            }
            int _2180 = _2178;
            bool _2182 = _2112 == 44;
            int _2184 = _2180;
            if (_2164)
            {
                _2184 = _1298;
            }
            int _2186 = _2184;
            bool _2188 = _2118 == 8;
            int _2190 = _2186;
            if (_2146)
            {
                _2190 = _1300;
            }
            int _2192 = _2190;
            bool _2194 = _2118 == 12;
            int _2196 = _2192;
            if (_2130)
            {
                _2196 = _1302;
            }
            int _2198 = _2196;
            int _2200 = _2198;
            if (_2176)
            {
                _2160 = _1284;
            }
            int _2202 = _2160;
            int _2204 = _2202;
            if (_2182)
            {
                _2200 = _1304;
            }
            int _2206 = _2200;
            bool _2208 = _2112 == 52;
            int _2210 = _2206;
            if (_2170)
            {
                _2210 = _1306;
            }
            int _2212 = _2210;
            bool _2214 = _2118 == 20;
            bool _2216 = _2118 == 24;
            bool _2218 = _2112 == 60;
            int _2220 = _2212;
            if (_2188)
            {
                _2204 = _1286;
            }
            int _2222 = _2204;
            bool _2224 = _2112 == 56;
            int _2226 = _2222;
            if (_2194)
            {
                _2226 = _1288;
            }
            int _2228 = _2226;
            bool _2230 = _2118 == 28;
            int _2232 = _2228;
            if (_2158)
            {
                _2232 = _1290;
            }
            int _2234 = _2232;
            bool _2236 = _2118 == 32;
            int _2238 = _2234;
            if (_2208)
            {
                _2220 = _1308;
            }
            int _2240 = _2220;
            bool _2242 = _2112 == 64;
            int _2244 = _2240;
            if (_2214)
            {
                _2238 = _1292;
            }
            int _2246 = _2238;
            bool _2248 = _2118 == 36;
            int _2250 = _2246;
            if (_2216)
            {
                _2250 = _1294;
            }
            int _2252 = _2250;
            bool _2254 = _2112 == 68;
            int _2256 = _2252;
            if (_2224)
            {
                _2244 = _1310;
            }
            int _2258 = _2244;
            bool _2260 = _2118 == 40;
            int _2262 = _2258;
            if (_2230)
            {
                _2256 = _1296;
            }
            int _2264 = _2256;
            bool _2266 = _2112 == 72;
            int _2268 = _2264;
            if (_2218)
            {
                _2262 = _1312;
            }
            int _2270 = _2262;
            bool _2272 = _2118 == 44;
            int _2274 = _2270;
            if (_2236)
            {
                _2268 = _1298;
            }
            int _2276 = _2268;
            bool _2278 = _2118 == 48;
            int _2280 = _2276;
            if (_2248)
            {
                _2280 = _1300;
            }
            int _2282 = _2280;
            bool _2284 = _2112 == 76;
            int _2286 = _2282;
            if (_2242)
            {
                _2274 = _1314;
            }
            int _2288 = _2274;
            bool _2290 = _2118 == 52;
            int _2292 = _2288;
            if (_2254)
            {
                _2292 = _1316;
            }
            int _2294 = _2292;
            bool _2296 = _2112 == 80;
            int _2298 = _2294;
            if (_2260)
            {
                _2286 = _1302;
            }
            int _2300 = _2286;
            bool _2302 = _2118 == 56;
            int _2304 = _2300;
            if (_2266)
            {
                _2298 = _1318;
            }
            int _2306 = _2298;
            bool _2308 = _2112 == 84;
            int _2310 = _2306;
            if (_2272)
            {
                _2304 = _1304;
            }
            int _2312 = _2304;
            bool _2314 = _2118 == 60;
            int _2316 = _2312;
            if (_2278)
            {
                _2316 = _1306;
            }
            int _2318 = _2316;
            bool _2320 = _2118 == 64;
            int _2322 = _2318;
            if (_2284)
            {
                _2310 = _1320;
            }
            int _2324 = _2310;
            bool _2326 = _2112 == 88;
            int _2328 = _2324;
            if (_2290)
            {
                _2322 = _1308;
            }
            int _2330 = _2322;
            bool _2332 = _2118 == 68;
            int _2334 = _2330;
            if (_2296)
            {
                _2328 = _1322;
            }
            int _2336 = _2328;
            bool _2338 = _2112 == 92;
            int _2340 = _2336;
            if (_2302)
            {
                _2334 = _1310;
            }
            int _2342 = _2334;
            bool _2344 = _2118 == 72;
            int _2346 = _2342;
            if (_2308)
            {
                _2340 = _1324;
            }
            int _2348 = _2340;
            bool _2350 = _2112 == 96;
            int _2352 = _2348;
            if (_2314)
            {
                _2346 = _1312;
            }
            int _2354 = _2346;
            bool _2356 = _2118 == 76;
            int _2358 = _2354;
            if (_2320)
            {
                _2358 = _1314;
            }
            int _2360 = _2358;
            bool _2362 = _2118 == 80;
            int _2364 = _2360;
            if (_2326)
            {
                _2352 = _1326;
            }
            int _2366 = _2352;
            int _2368 = _2366;
            if (_2332)
            {
                _2364 = _1316;
            }
            int _2370 = _2364;
            bool _2372 = _2118 == 84;
            int _2374 = _2370;
            if (_2338)
            {
                _2368 = _1328;
            }
            int _2376 = _2368;
            bool _2378 = _2118 == 96;
            int _2380 = _2376;
            if (_2344)
            {
                _2374 = _1318;
            }
            int _2382 = _2374;
            bool _2384 = _2118 == 88;
            int _2386 = _2382;
            if (_2350)
            {
                _2380 = _1330;
            }
            int _2388 = _2380;
            bool _2390 = _2118 == 92;
            if (_2356)
            {
                _2386 = _1320;
            }
            int _2392 = _2386;
            int _2394 = _2392;
            if (_2362)
            {
                _2394 = _1322;
            }
            int _2396 = _2394;
            bool _2398 = _2080 >= _2388;
            int _2400 = _2396;
            if (_2372)
            {
                _2400 = _1324;
            }
            int _2402 = _2400;
            int _2404 = _2402;
            if (_2384)
            {
                _2404 = _1326;
            }
            int _2406 = _2404;
            int _2408 = _2406;
            if (_2390)
            {
                _2408 = _1328;
            }
            int _2410 = _2408;
            int _2412 = _2410;
            _2106 = 0;
            if (_2378)
            {
                _2412 = _1330;
            }
            int _2414 = _2412;
            if (!_2398)
            {
                _2100 = _2388;
            }
            int _2416 = _2100;
            _2108 = _2416;
            if (!_2398)
            {
                _2102 = _2078;
            }
            int _2418 = _2102;
            int _2420 = _2114 + 1;
            bool _2422 = _2416 >= _2414;
            int _2424 = _2418;
            _2104 = _2420;
            if (!_2422)
            {
                _2424 = _2114;
            }
            int _2426 = _2424;
            _2110 = _2426;
            if (!_2422)
            {
                _2108 = _2414;
            }
        }
        int _2428 = _2104;
        int _2430 = _2106;
        int _2432 = _2108;
        int _2434 = _2110;
        bool _2436 = _2428 < _1334;
        int _2438 = (_2436 ? (-1) : 0) | _2430;
        int _2440 = ~_2438;
        int _2442 = _2434;
        if (!(_2440 != 0))
        {
            int _2444 = _2428 * 4;
            bool _2446 = _2444 == 4;
            bool _2448 = _2444 == 8;
            bool _2450 = _2444 == 12;
            bool _2452 = _2444 == 16;
            if (_2446)
            {
                _1358 = _1284;
            }
            int _2454 = _1358;
            bool _2456 = _2444 == 20;
            int _2458 = _2454;
            if (_2448)
            {
                _2458 = _1286;
            }
            int _2460 = _2458;
            bool _2462 = _2444 == 24;
            int _2464 = _2460;
            if (_2450)
            {
                _2464 = _1288;
            }
            int _2466 = _2464;
            bool _2468 = _2444 == 28;
            int _2470 = _2466;
            if (_2452)
            {
                _2470 = _1290;
            }
            int _2472 = _2470;
            bool _2474 = _2444 == 32;
            int _2476 = _2472;
            if (_2456)
            {
                _2476 = _1292;
            }
            int _2478 = _2476;
            bool _2480 = _2444 == 36;
            int _2482 = _2478;
            if (_2462)
            {
                _2482 = _1294;
            }
            int _2484 = _2482;
            bool _2486 = _2444 == 40;
            int _2488 = _2484;
            if (_2468)
            {
                _2488 = _1296;
            }
            int _2490 = _2488;
            bool _2492 = _2444 == 44;
            int _2494 = _2490;
            if (_2474)
            {
                _2494 = _1298;
            }
            int _2496 = _2494;
            bool _2498 = _2444 == 48;
            int _2500 = _2496;
            if (_2480)
            {
                _2500 = _1300;
            }
            int _2502 = _2500;
            bool _2504 = _2444 == 52;
            int _2506 = _2502;
            if (_2486)
            {
                _2506 = _1302;
            }
            int _2508 = _2506;
            bool _2510 = _2444 == 56;
            int _2512 = _2508;
            if (_2492)
            {
                _2512 = _1304;
            }
            int _2514 = _2512;
            bool _2516 = _2444 == 60;
            int _2518 = _2514;
            if (_2498)
            {
                _2518 = _1306;
            }
            int _2520 = _2518;
            bool _2522 = _2444 == 64;
            int _2524 = _2520;
            if (_2504)
            {
                _2524 = _1308;
            }
            int _2526 = _2524;
            bool _2528 = _2444 == 68;
            int _2530 = _2526;
            if (_2510)
            {
                _2530 = _1310;
            }
            int _2532 = _2530;
            bool _2534 = _2444 == 72;
            int _2536 = _2532;
            if (_2516)
            {
                _2536 = _1312;
            }
            int _2538 = _2536;
            bool _2540 = _2444 == 76;
            int _2542 = _2538;
            if (_2522)
            {
                _2542 = _1314;
            }
            int _2544 = _2542;
            bool _2546 = _2444 == 80;
            int _2548 = _2544;
            if (_2528)
            {
                _2548 = _1316;
            }
            int _2550 = _2548;
            bool _2552 = _2444 == 84;
            int _2554 = _2550;
            if (_2534)
            {
                _2554 = _1318;
            }
            int _2556 = _2554;
            bool _2558 = _2444 == 88;
            int _2560 = _2556;
            if (_2540)
            {
                _2560 = _1320;
            }
            int _2562 = _2560;
            bool _2564 = _2444 == 92;
            int _2566 = _2562;
            if (_2546)
            {
                _2566 = _1322;
            }
            int _2568 = _2566;
            bool _2570 = _2444 == 96;
            int _2572 = _2568;
            if (_2552)
            {
                _2572 = _1324;
            }
            int _2574 = _2572;
            int _2576 = _2574;
            if (_2558)
            {
                _2576 = _1326;
            }
            int _2578 = _2576;
            int _2580 = _2578;
            if (_2564)
            {
                _2580 = _1328;
            }
            int _2582 = _2580;
            int _2584 = _2582;
            if (_2570)
            {
                _2584 = _1330;
            }
            int _2586 = _2584;
            bool _2588 = _2432 >= _2586;
            if (!_2588)
            {
                _2442 = _2428;
            }
        }
        int _2590 = _2442;
        _1366 = _2590;
    }
    int _2592 = _1366;
    int _2594 = _2592 * 8;
    float _2596 = as_type<float>(int(gl_VertexIndex));
    uint _2598 = uint(int(uint(_2594) >> uint(2)));
    float _2600 = as_type<float>(_31[int(_2598)]);
    int _2602 = _2594 + 4;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    float _2606 = as_type<float>(_31[int(_2604)]);
    int _2608 = as_type<int>(_2596) << 5;
    int _2610 = _2608 + 16;
    int _2612 = as_type<int>(_2596) << 5;
    int _2614 = _2612 + 24;
    uint _2616 = uint(int(uint(_2610) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2616)] = as_type<uint>(_2600);
    int _2618 = _2610 + 4;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2620)] = as_type<uint>(_2606);
    uint _2622 = uint(int(uint(_2614) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2622)] = as_type<uint>(_1332);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _856 = false;
    bool _680 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _55 = -2;
    int _57 = 0;
    int _59 = 0;
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
    float _110 = 1000000.0;
    bool _114;
    bool _257;
    float _642;
    int _644;
    int _646;
    int _648;
    bool _656;
    int _658;
    int _712;
    int _714;
    int _720;
    int _726;
    int _732;
    int _738;
    int _744;
    int _750;
    int _756;
    int _762;
    int _768;
    int _774;
    int _780;
    int _786;
    int _792;
    int _798;
    bool _802;
    int _804;
    int _810;
    int _816;
    int _822;
    int _828;
    int _832;
    int _836;
    int _840;
    int _844;
    int _848;
    int _852;
    int _854;
    int _1214;
    int _1282;
    int _1284;
    int _1286;
    int _1288;
    int _1290;
    int _1292;
    int _1294;
    int _1296;
    int _1298;
    int _1300;
    int _1302;
    int _1304;
    int _1306;
    int _1308;
    int _1310;
    int _1312;
    int _1314;
    int _1316;
    int _1318;
    int _1320;
    int _1322;
    int _1324;
    int _1326;
    int _1328;
    int _1330;
    float _1332;
    int _1334;
    int _1348;
    int _1350;
    int _1352;
    int _1354;
    int _1356;
    int _1358;
    do
    {
        int _116 = _55;
        int _118 = _57;
        int _120 = _59;
        int _122 = _61;
        int _124 = _63;
        int _126 = _65;
        int _128 = _67;
        int _130 = _69;
        int _132 = _71;
        int _134 = _73;
        int _136 = _75;
        int _138 = _77;
        int _140 = _79;
        int _142 = _81;
        int _144 = _83;
        int _146 = _85;
        int _148 = _87;
        int _150 = _89;
        int _152 = _91;
        int _154 = _93;
        int _156 = _95;
        int _158 = _97;
        int _160 = _99;
        int _162 = _101;
        int _164 = _103;
        int _166 = _105;
        int _168 = _107;
        float _170 = _110;
        float _172 = float(_116);
        float _174 = _172 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _176 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _178 = fma(_174, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2695 = float2(_176, _178);
        float4 _181 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2695, float2(0.0), isnan(_2695)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2695, float2(0.0), isnan(_2695)), level(0.0)).xyzw;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float _189 = _181.w;
        int _191 = -2;
        float _193 = _185;
        float _195 = _189;
        float _197 = _187;
        float _199 = _183;
        int _201 = -2;
        int _203 = _118;
        int _205 = _120;
        int _207 = _122;
        int _209 = _124;
        int _211 = _126;
        int _213 = _128;
        int _215 = _130;
        int _217 = _132;
        int _219 = _134;
        int _221 = _136;
        int _223 = _138;
        int _225 = _140;
        int _227 = _142;
        int _229 = _144;
        int _231 = _146;
        int _233 = _148;
        int _235 = _150;
        int _237 = _152;
        int _239 = _154;
        int _241 = _156;
        int _243 = _158;
        int _245 = _160;
        int _247 = _162;
        int _249 = _164;
        int _251 = _166;
        int _253 = _168;
        float _255 = _170;
        do
        {
            int _259 = _191;
            float _261 = _193;
            float _263 = _195;
            float _265 = _197;
            float _267 = _199;
            int _269 = _201;
            int _271 = _203;
            int _273 = _205;
            int _275 = _207;
            int _277 = _209;
            int _279 = _211;
            int _281 = _213;
            int _283 = _215;
            int _285 = _217;
            int _287 = _219;
            int _289 = _221;
            int _291 = _223;
            int _293 = _225;
            int _295 = _227;
            int _297 = _229;
            int _299 = _231;
            int _301 = _233;
            int _303 = _235;
            int _305 = _237;
            int _307 = _239;
            int _309 = _241;
            int _311 = _243;
            int _313 = _245;
            int _315 = _247;
            int _317 = _249;
            int _319 = _251;
            int _321 = _253;
            float _323 = _255;
            int _325 = _259 + 1;
            float _327 = float(_116);
            float _329 = 0.0 + _261;
            float _331 = precise::clamp(_329, 0.0, 1.0);
            float _333 = _327 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _335 = float(_325);
            float _337 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _339 = fma(_333, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _341 = 0.0 + _263;
            float _343 = precise::clamp(_341, 0.0, 1.0);
            float _345 = fma(_335, _337, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _347 = 0.0 + _265;
            float _349 = precise::clamp(_347, 0.0, 1.0);
            float _351 = 0.0 + _267;
            float _353 = precise::clamp(_351, 0.0, 1.0);
            float2 _2817 = float2(_345, _339);
            float4 _355 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2817, float2(0.0), isnan(_2817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2817, float2(0.0), isnan(_2817)), level(0.0)).xyzw;
            float _357 = _355.x;
            float _359 = _355.y;
            float _361 = _355.z;
            float _363 = _355.w;
            float _365 = _343 * 65535.0;
            float _367 = _349 * 65535.0;
            float _369 = _331 * 65535.0;
            float _371 = _353 * 65535.0;
            float _373 = rint(_365);
            int _375 = int(_373);
            float _377 = rint(_367);
            int _379 = int(_377);
            float _381 = rint(_369);
            int _383 = int(_381);
            uint _386 = extract_bits(uint(_375), 0u, 8u);
            int _388 = int(_386) & 255;
            uint _390 = extract_bits(uint(_375), 8u, 8u);
            int _392 = int(_390) & 255;
            int _394 = _392 << 8;
            int _396 = _388 | _394;
            float _398 = rint(_371);
            int _400 = int(_398);
            uint _402 = extract_bits(uint(_396), 0u, 8u);
            int _404 = int(_402) & 255;
            uint _406 = extract_bits(uint(_396), 8u, 8u);
            int _408 = int(_406) & 255;
            int _410 = _408 << 8;
            int _412 = _404 | _410;
            uint _414 = extract_bits(uint(_379), 0u, 8u);
            int _416 = int(_414) & 255;
            int _418 = _416 << 16;
            int _420 = _412 | _418;
            uint _422 = extract_bits(uint(_379), 8u, 8u);
            int _424 = int(_422) & 255;
            int _426 = _424 << 24;
            int _428 = _420 | _426;
            float _430 = float(_269);
            bool _432 = _428 != 0;
            uint _434 = extract_bits(uint(_383), 0u, 8u);
            int _436 = int(_434) & 255;
            uint _438 = extract_bits(uint(_383), 8u, 8u);
            int _440 = int(_438) & 255;
            int _442 = _440 << 8;
            int _444 = _436 | _442;
            float _446 = fma(_430, _337, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _448 = extract_bits(uint(_444), 0u, 8u);
            int _450 = int(_448) & 255;
            uint _452 = extract_bits(uint(_444), 8u, 8u);
            int _454 = int(_452) & 255;
            int _456 = _454 << 8;
            int _458 = _450 | _456;
            uint _460 = extract_bits(uint(_400), 0u, 8u);
            int _462 = int(_460) & 255;
            int _464 = _462 << 16;
            int _466 = _458 | _464;
            uint _468 = extract_bits(uint(_400), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 24;
            int _474 = _466 | _472;
            bool _476 = _474 != 0;
            bool _478 = _476 || _432;
            bool _480 = !_478;
            _191 = _325;
            _193 = _359;
            _195 = _363;
            _197 = _361;
            _199 = _357;
            int _482 = _281;
            int _484 = _273;
            int _486 = _275;
            int _488 = _277;
            int _490 = _279;
            int _492 = _283;
            int _494 = _285;
            int _496 = _295;
            int _498 = _287;
            int _500 = _289;
            int _502 = _291;
            int _504 = _293;
            int _506 = _297;
            int _508 = _299;
            int _510 = _309;
            int _512 = _301;
            int _514 = _303;
            int _516 = _305;
            int _518 = _307;
            int _520 = _311;
            int _522 = _313;
            int _524 = _315;
            int _526 = _317;
            int _528 = _319;
            int _530 = _321;
            int _532 = _428;
            int _534 = _273;
            int _536 = _275;
            int _538 = _277;
            int _540 = _279;
            int _542 = _317;
            int _544 = _319;
            int _546 = _321;
            int _548 = _281;
            int _550 = _283;
            int _552 = _285;
            int _554 = _287;
            int _556 = _289;
            int _558 = _291;
            int _560 = _293;
            int _562 = _295;
            int _564 = _297;
            int _566 = _299;
            int _568 = _301;
            int _570 = _303;
            int _572 = _305;
            int _574 = _307;
            int _576 = _315;
            int _578 = _313;
            int _580 = _311;
            int _582 = _271;
            int _584 = _273;
            int _586 = _275;
            int _588 = _277;
            int _590 = _279;
            int _592 = _281;
            int _594 = _283;
            int _596 = _285;
            int _598 = _287;
            int _600 = _289;
            int _602 = _291;
            int _604 = _293;
            int _606 = _295;
            int _608 = _297;
            int _610 = _299;
            int _612 = _301;
            int _614 = _303;
            int _616 = _305;
            int _618 = _307;
            int _620 = _309;
            int _622 = _311;
            int _624 = _313;
            int _626 = _315;
            int _628 = _317;
            int _630 = _319;
            int _632 = _321;
            int _634 = _474;
            int _636 = _400;
            int _638 = _428;
            int _640 = as_type<int>(_430);
            _642 = _323;
            _644 = _474;
            _646 = _428;
            _648 = as_type<int>(_361);
            if (!_480)
            {
                bool _650 = _271 > 0;
                bool _652 = !_650;
                if (!_652)
                {
                    int _654 = 0;
                    do
                    {
                        _658 = _654;
                        int _660 = _658 * 8;
                        uint _662 = uint(int(uint(_660) >> uint(2)));
                        float _664 = as_type<float>(_31[int(_662)]);
                        int _666 = _660 + 4;
                        uint _668 = uint(int(uint(_666) >> uint(2)));
                        float _670 = as_type<float>(_31[int(_668)]);
                        bool _672 = as_type<int>(_664) != _428;
                        bool _674 = as_type<int>(_670) != _474;
                        bool _676 = _674 || _672;
                        bool _678 = !_676;
                        _680 = _678;
                        if (_680)
                        {
                            break;
                        }
                        int _682 = _658 + 1;
                        bool _684 = _682 >= _271;
                        _656 = !_684;
                        _654 = _682;
                    } while (_656);
                }
                if (!_680)
                {
                    int _686 = _271 * 4;
                    int _688 = _271 * 8;
                    int _690 = _271 + 1;
                    bool _692 = _686 == 16;
                    bool _694 = _686 == 0;
                    uint _696 = uint(int(uint(_688) >> uint(2)));
                    _31[int(_696)] = uint(_428);
                    int _698 = _688 + 4;
                    uint _700 = uint(int(uint(_698) >> uint(2)));
                    _31[int(_700)] = uint(_474);
                    bool _702 = _686 == 4;
                    bool _704 = _686 == 8;
                    bool _706 = _686 == 12;
                    bool _708 = _686 == 20;
                    bool _710 = _686 == 24;
                    _582 = _690;
                    _636 = _688;
                    _640 = _686;
                    _712 = _688;
                    _714 = _686;
                    if (_692)
                    {
                        _482 = 1;
                    }
                    int _716 = _482;
                    bool _718 = _686 == 44;
                    _592 = _716;
                    _720 = _716;
                    if (_694)
                    {
                        _484 = 1;
                    }
                    int _722 = _484;
                    bool _724 = _686 == 28;
                    _584 = _722;
                    _726 = _722;
                    if (_702)
                    {
                        _486 = 1;
                    }
                    int _728 = _486;
                    bool _730 = _686 == 32;
                    _586 = _728;
                    _732 = _728;
                    if (_704)
                    {
                        _488 = 1;
                    }
                    int _734 = _488;
                    bool _736 = _686 == 36;
                    _588 = _734;
                    _738 = _734;
                    if (_706)
                    {
                        _490 = 1;
                    }
                    int _740 = _490;
                    bool _742 = _686 == 40;
                    _590 = _740;
                    _744 = _740;
                    if (_708)
                    {
                        _492 = 1;
                    }
                    int _746 = _492;
                    bool _748 = _686 == 48;
                    _594 = _746;
                    _750 = _746;
                    if (_710)
                    {
                        _494 = 1;
                    }
                    int _752 = _494;
                    bool _754 = _686 == 52;
                    _596 = _752;
                    _756 = _752;
                    if (_718)
                    {
                        _496 = 1;
                    }
                    int _758 = _496;
                    bool _760 = _686 == 72;
                    _606 = _758;
                    _762 = _758;
                    if (_724)
                    {
                        _498 = 1;
                    }
                    int _764 = _498;
                    bool _766 = _686 == 56;
                    _598 = _764;
                    _768 = _764;
                    if (_730)
                    {
                        _500 = 1;
                    }
                    int _770 = _500;
                    bool _772 = _686 == 60;
                    _600 = _770;
                    _774 = _770;
                    if (_736)
                    {
                        _502 = 1;
                    }
                    int _776 = _502;
                    bool _778 = _686 == 64;
                    _602 = _776;
                    _780 = _776;
                    if (_742)
                    {
                        _504 = 1;
                    }
                    int _782 = _504;
                    bool _784 = _686 == 68;
                    _604 = _782;
                    _786 = _782;
                    if (_748)
                    {
                        _506 = 1;
                    }
                    int _788 = _506;
                    bool _790 = _686 == 76;
                    _608 = _788;
                    _792 = _788;
                    if (_754)
                    {
                        _508 = 1;
                    }
                    int _794 = _508;
                    bool _796 = _686 == 80;
                    _610 = _794;
                    _798 = _794;
                    if (_760)
                    {
                        _510 = 1;
                    }
                    int _800 = _510;
                    _802 = _690 != 25;
                    _620 = _800;
                    _804 = _800;
                    if (_766)
                    {
                        _512 = 1;
                    }
                    int _806 = _512;
                    bool _808 = _686 == 84;
                    _612 = _806;
                    _810 = _806;
                    if (_772)
                    {
                        _514 = 1;
                    }
                    int _812 = _514;
                    bool _814 = _686 == 88;
                    _614 = _812;
                    _816 = _812;
                    if (_778)
                    {
                        _516 = 1;
                    }
                    int _818 = _516;
                    bool _820 = _686 == 92;
                    _616 = _818;
                    _822 = _818;
                    if (_784)
                    {
                        _518 = 1;
                    }
                    int _824 = _518;
                    bool _826 = _686 == 96;
                    _618 = _824;
                    _828 = _824;
                    if (_790)
                    {
                        _520 = 1;
                    }
                    int _830 = _520;
                    _622 = _830;
                    _832 = _830;
                    if (_796)
                    {
                        _522 = 1;
                    }
                    int _834 = _522;
                    _624 = _834;
                    _836 = _834;
                    if (_808)
                    {
                        _524 = 1;
                    }
                    int _838 = _524;
                    _626 = _838;
                    _840 = _838;
                    if (_814)
                    {
                        _526 = 1;
                    }
                    int _842 = _526;
                    _628 = _842;
                    _844 = _842;
                    if (_820)
                    {
                        _528 = 1;
                    }
                    int _846 = _528;
                    _630 = _846;
                    _848 = _846;
                    if (_826)
                    {
                        _530 = 1;
                    }
                    int _850 = _530;
                    _632 = _850;
                    _852 = _850;
                }
                if ((!_802) || _680)
                {
                    if (!_680)
                    {
                        _854 = 25;
                        _856 = true;
                        if (_856)
                        {
                            break;
                        }
                    }
                    _680 = false;
                    int _858 = _658 * 4;
                    bool _860 = _858 == 0;
                    bool _862 = _858 == 4;
                    bool _864 = _858 == 8;
                    bool _866 = _858 == 12;
                    bool _868 = _858 == 88;
                    bool _870 = _858 == 92;
                    bool _872 = _858 == 96;
                    if (_860)
                    {
                        _532 = _273;
                    }
                    int _874 = _532;
                    bool _876 = _858 == 16;
                    int _878 = _874;
                    if (_862)
                    {
                        _878 = _275;
                    }
                    int _880 = _878;
                    bool _882 = _858 == 20;
                    int _884 = _880;
                    if (_864)
                    {
                        _884 = _277;
                    }
                    int _886 = _884;
                    bool _888 = _858 == 24;
                    int _890 = _886;
                    if (_866)
                    {
                        _890 = _279;
                    }
                    int _892 = _890;
                    bool _894 = _858 == 84;
                    int _896 = int(_888);
                    int _898 = _882 ? 2 : 0;
                    int _900 = _896 | _898;
                    int _902 = _876 ? 4 : 0;
                    int _904 = _900 | _902;
                    int _906 = _894 ? 8 : 0;
                    int _908 = _904 | _906;
                    int _910 = _868 ? 16 : 0;
                    int _912 = _908 | _910;
                    int _914 = _870 ? 32 : 0;
                    int _916 = _912 | _914;
                    int _918 = _872 ? 64 : 0;
                    int _920 = _916 | _918;
                    int _922 = _920 & 8;
                    int _924 = _892;
                    _634 = _922;
                    if (_876)
                    {
                        _924 = _281;
                    }
                    int _926 = _924;
                    bool _928 = _858 == 80;
                    int _930 = _926;
                    if (_882)
                    {
                        _930 = _283;
                    }
                    int _932 = _930;
                    bool _934 = _858 == 76;
                    int _936 = _932;
                    if (_888)
                    {
                        _936 = _285;
                    }
                    int _938 = _936;
                    bool _940 = _858 == 28;
                    int _942 = int(_940);
                    int _944 = _934 ? 2 : 0;
                    int _946 = _942 | _944;
                    int _948 = _928 ? 4 : 0;
                    int _950 = _946 | _948;
                    int _952 = _894 ? 8 : 0;
                    int _954 = _950 | _952;
                    int _956 = _868 ? 16 : 0;
                    int _958 = _954 | _956;
                    int _960 = _870 ? 32 : 0;
                    int _962 = _958 | _960;
                    int _964 = _872 ? 64 : 0;
                    int _966 = _962 | _964;
                    int _968 = _966 & 2;
                    int _970 = int(_940);
                    int _972 = _934 ? 2 : 0;
                    int _974 = _970 | _972;
                    int _976 = _928 ? 4 : 0;
                    int _978 = _974 | _976;
                    int _980 = _894 ? 8 : 0;
                    int _982 = _978 | _980;
                    int _984 = _868 ? 16 : 0;
                    int _986 = _982 | _984;
                    int _988 = _870 ? 32 : 0;
                    int _990 = _986 | _988;
                    int _992 = _872 ? 64 : 0;
                    int _994 = _990 | _992;
                    int _996 = _994 & 4;
                    int _998 = _938;
                    _636 = _968;
                    _640 = _996;
                    if (_940)
                    {
                        _998 = _287;
                    }
                    int _1000 = _998;
                    bool _1002 = _858 == 32;
                    int _1004 = _1000;
                    if (_1002)
                    {
                        _1004 = _289;
                    }
                    int _1006 = _1004;
                    bool _1008 = _858 == 36;
                    int _1010 = _1006;
                    if (_1008)
                    {
                        _1010 = _291;
                    }
                    int _1012 = _1010;
                    bool _1014 = _858 == 40;
                    int _1016 = _1012;
                    if (_1014)
                    {
                        _1016 = _293;
                    }
                    int _1018 = _1016;
                    bool _1020 = _858 == 44;
                    int _1022 = _1018;
                    if (_1020)
                    {
                        _1022 = _295;
                    }
                    int _1024 = _1022;
                    bool _1026 = _858 == 48;
                    int _1028 = _1024;
                    if (_1026)
                    {
                        _1028 = _297;
                    }
                    int _1030 = _1028;
                    bool _1032 = _858 == 52;
                    int _1034 = _1030;
                    if (_1032)
                    {
                        _1034 = _299;
                    }
                    int _1036 = _1034;
                    bool _1038 = _858 == 56;
                    int _1040 = _1036;
                    if (_1038)
                    {
                        _1040 = _301;
                    }
                    int _1042 = _1040;
                    bool _1044 = _858 == 60;
                    int _1046 = _1042;
                    if (_1044)
                    {
                        _1046 = _303;
                    }
                    int _1048 = _1046;
                    bool _1050 = _858 == 64;
                    int _1052 = _1048;
                    if (_1050)
                    {
                        _1052 = _305;
                    }
                    int _1054 = _1052;
                    bool _1056 = _858 == 68;
                    int _1058 = _1054;
                    if (_1056)
                    {
                        _1058 = _307;
                    }
                    int _1060 = _1058;
                    bool _1062 = _858 == 72;
                    int _1064 = int(_1062);
                    int _1066 = _934 ? 2 : 0;
                    int _1068 = _1064 | _1066;
                    int _1070 = _928 ? 4 : 0;
                    int _1072 = _1068 | _1070;
                    int _1074 = _894 ? 8 : 0;
                    int _1076 = _1072 | _1074;
                    int _1078 = _868 ? 16 : 0;
                    int _1080 = _1076 | _1078;
                    int _1082 = _870 ? 32 : 0;
                    int _1084 = _1080 | _1082;
                    int _1086 = _872 ? 64 : 0;
                    int _1088 = _1084 | _1086;
                    int _1090 = _1088 & 1;
                    int _1092 = _1060;
                    if (_1062)
                    {
                        _1092 = _309;
                    }
                    int _1094 = _1092;
                    bool _1096 = _858 == 4;
                    int _1098 = _1094;
                    if (_934)
                    {
                        _1098 = _311;
                    }
                    int _1100 = _1098;
                    bool _1102 = _858 == 0;
                    int _1104 = _1100;
                    if (_928)
                    {
                        _1104 = _313;
                    }
                    int _1106 = _1104;
                    bool _1108 = _858 == 12;
                    int _1110 = _1106;
                    if (_894)
                    {
                        _1110 = _315;
                    }
                    int _1112 = _1110;
                    bool _1114 = _858 == 8;
                    int _1116 = _1112;
                    if (_868)
                    {
                        _1116 = _317;
                    }
                    int _1118 = _1116;
                    int _1120 = _1118;
                    if (_870)
                    {
                        _1120 = _319;
                    }
                    int _1122 = _1120;
                    int _1124 = _1122;
                    if (_872)
                    {
                        _1124 = _321;
                    }
                    int _1126 = _1124;
                    int _1128 = _1126 + 1;
                    _638 = _1128;
                    if (_1102)
                    {
                        _534 = _1128;
                    }
                    int _1130 = _534;
                    bool _1132 = _858 == 16;
                    _584 = _1130;
                    if (_1096)
                    {
                        _536 = _1128;
                    }
                    int _1134 = _536;
                    bool _1136 = _858 == 20;
                    _586 = _1134;
                    if (_1114)
                    {
                        _538 = _1128;
                    }
                    int _1138 = _538;
                    bool _1140 = _858 == 24;
                    _588 = _1138;
                    if (_1108)
                    {
                        _540 = _1128;
                    }
                    int _1142 = _540;
                    bool _1144 = _858 == 28;
                    _590 = _1142;
                    if (_868)
                    {
                        _542 = _1128;
                    }
                    int _1146 = _542;
                    _628 = _1146;
                    if (_870)
                    {
                        _544 = _1128;
                    }
                    int _1148 = _544;
                    _630 = _1148;
                    if (_872)
                    {
                        _546 = _1128;
                    }
                    int _1150 = _546;
                    _632 = _1150;
                    if (_1132)
                    {
                        _548 = _1128;
                    }
                    int _1152 = _548;
                    bool _1154 = _858 == 32;
                    _592 = _1152;
                    if (_1136)
                    {
                        _550 = _1128;
                    }
                    int _1156 = _550;
                    bool _1158 = _858 == 36;
                    _594 = _1156;
                    if (_1140)
                    {
                        _552 = _1128;
                    }
                    int _1160 = _552;
                    bool _1162 = _858 == 40;
                    _596 = _1160;
                    if (_1144)
                    {
                        _554 = _1128;
                    }
                    int _1164 = _554;
                    bool _1166 = _858 == 44;
                    _598 = _1164;
                    if (_1154)
                    {
                        _556 = _1128;
                    }
                    int _1168 = _556;
                    bool _1170 = _858 == 48;
                    _600 = _1168;
                    if (_1158)
                    {
                        _558 = _1128;
                    }
                    int _1172 = _558;
                    bool _1174 = _858 == 52;
                    _602 = _1172;
                    if (_1162)
                    {
                        _560 = _1128;
                    }
                    int _1176 = _560;
                    bool _1178 = _858 == 56;
                    _604 = _1176;
                    if (_1166)
                    {
                        _562 = _1128;
                    }
                    int _1180 = _562;
                    bool _1182 = _858 == 60;
                    _606 = _1180;
                    if (_1170)
                    {
                        _564 = _1128;
                    }
                    int _1184 = _564;
                    bool _1186 = _858 == 64;
                    _608 = _1184;
                    if (_1174)
                    {
                        _566 = _1128;
                    }
                    int _1188 = _566;
                    bool _1190 = _858 == 68;
                    _610 = _1188;
                    if (_1178)
                    {
                        _568 = _1128;
                    }
                    int _1192 = _568;
                    bool _1194 = _922 != 0;
                    _612 = _1192;
                    if (_1182)
                    {
                        _570 = _1128;
                    }
                    int _1196 = _570;
                    bool _1198 = _996 != 0;
                    _614 = _1196;
                    if (_1186)
                    {
                        _572 = _1128;
                    }
                    int _1200 = _572;
                    bool _1202 = _968 != 0;
                    _616 = _1200;
                    if (_1190)
                    {
                        _574 = _1128;
                    }
                    int _1204 = _574;
                    bool _1206 = _1090 != 0;
                    _618 = _1204;
                    if (_1194)
                    {
                        _576 = _1128;
                    }
                    int _1208 = _576;
                    _626 = _1208;
                    if (_1198)
                    {
                        _578 = _1128;
                    }
                    int _1210 = _578;
                    _624 = _1210;
                    if (_1202)
                    {
                        _580 = _1128;
                    }
                    int _1212 = _580;
                    _622 = _1212;
                    if (_1206)
                    {
                        _620 = _1128;
                    }
                }
            }
            _1214 = _582;
            int _1216 = _584;
            int _1218 = _586;
            int _1220 = _588;
            int _1222 = _590;
            int _1224 = _592;
            int _1226 = _594;
            int _1228 = _596;
            int _1230 = _598;
            int _1232 = _600;
            int _1234 = _602;
            int _1236 = _604;
            int _1238 = _606;
            int _1240 = _608;
            int _1242 = _610;
            int _1244 = _612;
            int _1246 = _614;
            int _1248 = _616;
            int _1250 = _618;
            int _1252 = _620;
            int _1254 = _622;
            int _1256 = _624;
            int _1258 = _626;
            int _1260 = _628;
            int _1262 = _630;
            int _1264 = _632;
            int _1266 = _634;
            int _1268 = _636;
            int _1270 = _638;
            int _1272 = _640;
            float2 _3981 = float2(_446, _339);
            float _1274 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_3981, float2(0.0), isnan(_3981)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_3981, float2(0.0), isnan(_3981)), level(0.0)).x;
            int _1276 = _269 + 1;
            bool _1278 = _1276 >= 3;
            float _1280 = precise::min(_1274, _323);
            _257 = !_1278;
            _201 = _1276;
            _203 = _1214;
            _205 = _1216;
            _207 = _1218;
            _209 = _1220;
            _211 = _1222;
            _213 = _1224;
            _215 = _1226;
            _217 = _1228;
            _219 = _1230;
            _221 = _1232;
            _223 = _1234;
            _225 = _1236;
            _227 = _1238;
            _229 = _1240;
            _231 = _1242;
            _233 = _1244;
            _235 = _1246;
            _237 = _1248;
            _239 = _1250;
            _241 = _1252;
            _243 = _1254;
            _245 = _1256;
            _247 = _1258;
            _249 = _1260;
            _251 = _1262;
            _253 = _1264;
            _255 = _1280;
            _726 = _1216;
            _732 = _1218;
            _738 = _1220;
            _744 = _1222;
            _720 = _1224;
            _750 = _1226;
            _756 = _1228;
            _768 = _1230;
            _774 = _1232;
            _780 = _1234;
            _786 = _1236;
            _762 = _1238;
            _792 = _1240;
            _798 = _1242;
            _810 = _1244;
            _816 = _1246;
            _822 = _1248;
            _828 = _1250;
            _804 = _1252;
            _832 = _1254;
            _836 = _1256;
            _840 = _1258;
            _844 = _1260;
            _848 = _1262;
            _852 = _1264;
            _642 = _1280;
            _644 = _1266;
            _712 = _1268;
            _646 = _1270;
            _714 = _1272;
        } while (_257);
        if (!_856)
        {
            _854 = _1214;
        }
        _856 = false;
        _1282 = _726;
        _1284 = _732;
        _1286 = _738;
        _1288 = _744;
        _1290 = _720;
        _1292 = _750;
        _1294 = _756;
        _1296 = _768;
        _1298 = _774;
        _1300 = _780;
        _1302 = _786;
        _1304 = _762;
        _1306 = _792;
        _1308 = _798;
        _1310 = _810;
        _1312 = _816;
        _1314 = _822;
        _1316 = _828;
        _1318 = _804;
        _1320 = _832;
        _1322 = _836;
        _1324 = _840;
        _1326 = _844;
        _1328 = _848;
        _1330 = _852;
        _1332 = _642;
        _1334 = _854;
        int _1336 = _644;
        int _1338 = _712;
        int _1340 = _646;
        int _1342 = _714;
        int _1344 = _116 + 1;
        bool _1346 = _1344 >= 3;
        _114 = !_1346;
        _55 = _1344;
        _57 = _1334;
        _59 = _1282;
        _61 = _1284;
        _63 = _1286;
        _65 = _1288;
        _67 = _1290;
        _69 = _1292;
        _71 = _1294;
        _73 = _1296;
        _75 = _1298;
        _77 = _1300;
        _79 = _1302;
        _81 = _1304;
        _83 = _1306;
        _85 = _1308;
        _87 = _1310;
        _89 = _1312;
        _91 = _1314;
        _93 = _1316;
        _95 = _1318;
        _97 = _1320;
        _99 = _1322;
        _101 = _1324;
        _103 = _1326;
        _105 = _1328;
        _107 = _1330;
        _110 = _1332;
        _1348 = _1336;
        _1350 = _1338;
        _1352 = _1340;
        _1354 = _1342;
        _1356 = _1336;
        _1358 = _1282;
    } while (_114);
    bool _1360 = _1334 > 0;
    if (!_1360)
    {
        _648 = 0;
    }
    int _1362 = _648;
    bool _1364 = !_1360;
    int _1366 = _1362;
    if (!_1364)
    {
        bool _1368 = _1334 > 3;
        bool _1370 = !_1368;
        int _1372 = 0;
        int _1374 = 0;
        int _1376 = 0;
        int _1378 = 0;
        int _1380 = 0;
        int _1382 = -1;
        int _1384 = 0;
        if (!_1370)
        {
            int _1386 = _1334 + (-3);
            _1382 = 0;
            bool _1388;
            do
            {
                int _1390 = _1372;
                int _1392 = _1374;
                int _1394 = _1348;
                int _1396 = _1350;
                int _1398 = _1376;
                int _1400 = _1352;
                int _1402 = _1354;
                int _1404 = _1390 * 4;
                int _1406 = _1390 + 1;
                int _1408 = _1390 + 2;
                bool _1410 = _1404 == 0;
                int _1412 = _1406 * 4;
                bool _1414 = _1404 == 4;
                int _1416 = _1408 * 4;
                bool _1418 = _1404 == 8;
                bool _1420 = _1404 == 12;
                bool _1422 = _1404 == 16;
                bool _1424 = _1412 == 8;
                int _1426 = _1390 + 3;
                int _1428 = _1394;
                int _1430 = _1396;
                int _1432 = _1400;
                int _1434 = _1402;
                int _1436 = _1392;
                int _1438 = _1398;
                if (_1410)
                {
                    _1428 = _1282;
                }
                int _1440 = _1428;
                bool _1442 = _1404 == 24;
                int _1444 = _1440;
                if (_1414)
                {
                    _1444 = _1284;
                }
                int _1446 = _1444;
                bool _1448 = _1404 == 20;
                int _1450 = _1446;
                if (_1418)
                {
                    _1450 = _1286;
                }
                int _1452 = _1450;
                bool _1454 = _1404 == 32;
                int _1456 = _1452;
                if (_1420)
                {
                    _1456 = _1288;
                }
                int _1458 = _1456;
                bool _1460 = _1404 == 28;
                int _1462 = _1458;
                if (_1422)
                {
                    _1462 = _1290;
                }
                int _1464 = _1462;
                bool _1466 = _1404 == 40;
                int _1468 = _1426 * 4;
                int _1470 = _1464;
                if (_1448)
                {
                    _1470 = _1292;
                }
                int _1472 = _1470;
                bool _1474 = _1404 == 36;
                int _1476 = _1472;
                if (_1442)
                {
                    _1476 = _1294;
                }
                int _1478 = _1476;
                bool _1480 = _1412 == 0;
                int _1482 = _1478;
                if (_1460)
                {
                    _1482 = _1296;
                }
                int _1484 = _1482;
                bool _1486 = _1412 == 4;
                int _1488 = _1484;
                if (_1454)
                {
                    _1488 = _1298;
                }
                int _1490 = _1488;
                bool _1492 = _1412 == 12;
                int _1494 = _1490;
                if (_1474)
                {
                    _1494 = _1300;
                }
                int _1496 = _1494;
                bool _1498 = _1404 == 44;
                int _1500 = _1496;
                if (_1466)
                {
                    _1500 = _1302;
                }
                int _1502 = _1500;
                bool _1504 = _1412 == 16;
                int _1506 = _1502;
                if (_1480)
                {
                    _1430 = _1282;
                }
                int _1508 = _1430;
                bool _1510 = _1404 == 48;
                int _1512 = _1508;
                if (_1486)
                {
                    _1512 = _1284;
                }
                int _1514 = _1512;
                bool _1516 = _1412 == 20;
                int _1518 = _1514;
                if (_1424)
                {
                    _1518 = _1286;
                }
                int _1520 = _1518;
                bool _1522 = _1412 == 24;
                int _1524 = _1520;
                if (_1492)
                {
                    _1524 = _1288;
                }
                int _1526 = _1524;
                bool _1528 = _1412 == 28;
                int _1530 = _1526;
                if (_1498)
                {
                    _1506 = _1304;
                }
                int _1532 = _1506;
                bool _1534 = _1404 == 52;
                int _1536 = _1532;
                if (_1504)
                {
                    _1530 = _1290;
                }
                int _1538 = _1530;
                bool _1540 = _1412 == 32;
                int _1542 = _1538;
                if (_1510)
                {
                    _1536 = _1306;
                }
                int _1544 = _1536;
                bool _1546 = _1404 == 56;
                int _1548 = _1544;
                if (_1516)
                {
                    _1542 = _1292;
                }
                int _1550 = _1542;
                bool _1552 = _1412 == 36;
                int _1554 = _1550;
                if (_1522)
                {
                    _1554 = _1294;
                }
                int _1556 = _1554;
                bool _1558 = _1412 == 40;
                int _1560 = _1556;
                if (_1528)
                {
                    _1560 = _1296;
                }
                int _1562 = _1560;
                bool _1564 = _1412 == 44;
                int _1566 = _1562;
                if (_1534)
                {
                    _1548 = _1308;
                }
                int _1568 = _1548;
                bool _1570 = _1404 == 60;
                int _1572 = _1568;
                if (_1540)
                {
                    _1566 = _1298;
                }
                int _1574 = _1566;
                bool _1576 = _1412 == 48;
                int _1578 = _1574;
                if (_1546)
                {
                    _1572 = _1310;
                }
                int _1580 = _1572;
                bool _1582 = _1404 == 64;
                int _1584 = _1580;
                if (_1552)
                {
                    _1578 = _1300;
                }
                int _1586 = _1578;
                bool _1588 = _1412 == 52;
                int _1590 = _1586;
                if (_1558)
                {
                    _1590 = _1302;
                }
                int _1592 = _1590;
                bool _1594 = _1412 == 56;
                int _1596 = _1592;
                if (_1564)
                {
                    _1596 = _1304;
                }
                int _1598 = _1596;
                bool _1600 = _1412 == 60;
                int _1602 = _1598;
                if (_1570)
                {
                    _1584 = _1312;
                }
                int _1604 = _1584;
                bool _1606 = _1416 == 0;
                int _1608 = _1604;
                if (_1576)
                {
                    _1602 = _1306;
                }
                int _1610 = _1602;
                bool _1612 = _1404 == 68;
                int _1614 = _1610;
                if (_1582)
                {
                    _1608 = _1314;
                }
                int _1616 = _1608;
                bool _1618 = _1416 == 4;
                int _1620 = _1616;
                if (_1588)
                {
                    _1614 = _1308;
                }
                int _1622 = _1614;
                bool _1624 = _1416 == 8;
                int _1626 = _1622;
                if (_1594)
                {
                    _1626 = _1310;
                }
                int _1628 = _1626;
                bool _1630 = _1416 == 12;
                int _1632 = _1628;
                if (_1600)
                {
                    _1632 = _1312;
                }
                int _1634 = _1632;
                bool _1636 = _1416 == 16;
                int _1638 = _1634;
                if (_1606)
                {
                    _1432 = _1282;
                }
                int _1640 = _1432;
                bool _1642 = _1412 == 64;
                int _1644 = _1640;
                if (_1612)
                {
                    _1620 = _1316;
                }
                int _1646 = _1620;
                bool _1648 = _1416 == 20;
                int _1650 = _1646;
                if (_1618)
                {
                    _1644 = _1284;
                }
                int _1652 = _1644;
                bool _1654 = _1404 == 72;
                int _1656 = _1652;
                if (_1624)
                {
                    _1656 = _1286;
                }
                int _1658 = _1656;
                bool _1660 = _1416 == 24;
                int _1662 = _1658;
                if (_1630)
                {
                    _1662 = _1288;
                }
                int _1664 = _1662;
                bool _1666 = _1416 == 28;
                int _1668 = _1664;
                if (_1636)
                {
                    _1668 = _1290;
                }
                int _1670 = _1668;
                bool _1672 = _1416 == 32;
                int _1674 = _1670;
                if (_1642)
                {
                    _1638 = _1314;
                }
                int _1676 = _1638;
                bool _1678 = _1412 == 68;
                int _1680 = _1676;
                if (_1648)
                {
                    _1674 = _1292;
                }
                int _1682 = _1674;
                bool _1684 = _1416 == 36;
                int _1686 = _1682;
                if (_1654)
                {
                    _1650 = _1318;
                }
                int _1688 = _1650;
                bool _1690 = _1404 == 76;
                int _1692 = _1688;
                if (_1660)
                {
                    _1686 = _1294;
                }
                int _1694 = _1686;
                bool _1696 = _1416 == 40;
                int _1698 = _1694;
                if (_1666)
                {
                    _1698 = _1296;
                }
                int _1700 = _1698;
                bool _1702 = _1416 == 44;
                int _1704 = _1700;
                if (_1672)
                {
                    _1704 = _1298;
                }
                int _1706 = _1704;
                bool _1708 = _1416 == 48;
                int _1710 = _1706;
                if (_1678)
                {
                    _1680 = _1316;
                }
                int _1712 = _1680;
                bool _1714 = _1412 == 72;
                int _1716 = _1712;
                if (_1684)
                {
                    _1710 = _1300;
                }
                int _1718 = _1710;
                bool _1720 = _1416 == 52;
                int _1722 = _1718;
                if (_1690)
                {
                    _1692 = _1320;
                }
                int _1724 = _1692;
                bool _1726 = _1404 == 80;
                int _1728 = _1724;
                if (_1696)
                {
                    _1722 = _1302;
                }
                int _1730 = _1722;
                bool _1732 = _1416 == 56;
                int _1734 = _1730;
                if (_1702)
                {
                    _1734 = _1304;
                }
                int _1736 = _1734;
                bool _1738 = _1416 == 60;
                int _1740 = _1736;
                if (_1708)
                {
                    _1740 = _1306;
                }
                int _1742 = _1740;
                bool _1744 = _1412 == 76;
                int _1746 = _1742;
                if (_1714)
                {
                    _1716 = _1318;
                }
                int _1748 = _1716;
                bool _1750 = _1416 == 64;
                int _1752 = _1748;
                if (_1720)
                {
                    _1746 = _1308;
                }
                int _1754 = _1746;
                bool _1756 = _1404 == 84;
                int _1758 = _1754;
                if (_1726)
                {
                    _1728 = _1322;
                }
                int _1760 = _1728;
                bool _1762 = _1416 == 68;
                int _1764 = _1760;
                if (_1732)
                {
                    _1758 = _1310;
                }
                int _1766 = _1758;
                bool _1768 = _1416 == 72;
                int _1770 = _1766;
                if (_1738)
                {
                    _1770 = _1312;
                }
                int _1772 = _1770;
                bool _1774 = _1416 == 76;
                int _1776 = _1772;
                if (_1744)
                {
                    _1752 = _1320;
                }
                int _1778 = _1752;
                bool _1780 = _1412 == 80;
                int _1782 = _1778;
                if (_1750)
                {
                    _1776 = _1314;
                }
                int _1784 = _1776;
                bool _1786 = _1468 == 0;
                int _1788 = _1784;
                if (_1756)
                {
                    _1764 = _1324;
                }
                int _1790 = _1764;
                bool _1792 = _1468 == 4;
                int _1794 = _1790;
                if (_1762)
                {
                    _1788 = _1316;
                }
                int _1796 = _1788;
                bool _1798 = _1416 == 80;
                int _1800 = _1796;
                if (_1768)
                {
                    _1800 = _1318;
                }
                int _1802 = _1800;
                bool _1804 = _1468 == 8;
                int _1806 = _1802;
                if (_1774)
                {
                    _1806 = _1320;
                }
                int _1808 = _1806;
                bool _1810 = _1404 == 88;
                int _1812 = _1808;
                if (_1780)
                {
                    _1782 = _1322;
                }
                int _1814 = _1782;
                bool _1816 = _1412 == 84;
                int _1818 = _1814;
                if (_1786)
                {
                    _1434 = _1282;
                }
                int _1820 = _1434;
                bool _1822 = _1468 == 12;
                int _1824 = _1820;
                if (_1792)
                {
                    _1824 = _1284;
                }
                int _1826 = _1824;
                bool _1828 = _1416 == 84;
                int _1830 = _1826;
                if (_1798)
                {
                    _1812 = _1322;
                }
                int _1832 = _1812;
                bool _1834 = _1468 == 16;
                int _1836 = _1832;
                if (_1804)
                {
                    _1830 = _1286;
                }
                int _1838 = _1830;
                bool _1840 = _1404 == 92;
                int _1842 = _1838;
                if (_1810)
                {
                    _1794 = _1326;
                }
                int _1844 = _1794;
                bool _1846 = _1468 == 20;
                int _1848 = _1844;
                if (_1816)
                {
                    _1818 = _1324;
                }
                int _1850 = _1818;
                bool _1852 = _1468 == 24;
                int _1854 = _1850;
                if (_1822)
                {
                    _1842 = _1288;
                }
                int _1856 = _1842;
                bool _1858 = _1412 == 88;
                int _1860 = _1856;
                if (_1828)
                {
                    _1836 = _1324;
                }
                int _1862 = _1836;
                bool _1864 = _1416 == 88;
                int _1866 = _1862;
                if (_1834)
                {
                    _1860 = _1290;
                }
                int _1868 = _1860;
                bool _1870 = _1468 == 28;
                int _1872 = _1868;
                if (_1840)
                {
                    _1848 = _1328;
                }
                int _1874 = _1848;
                bool _1876 = _1468 == 32;
                int _1878 = _1874;
                if (_1846)
                {
                    _1872 = _1292;
                }
                int _1880 = _1872;
                bool _1882 = _1404 == 96;
                int _1884 = _1880;
                if (_1852)
                {
                    _1884 = _1294;
                }
                int _1886 = _1884;
                bool _1888 = _1468 == 36;
                int _1890 = _1886;
                if (_1858)
                {
                    _1854 = _1326;
                }
                int _1892 = _1854;
                bool _1894 = _1468 == 40;
                int _1896 = _1892;
                if (_1864)
                {
                    _1866 = _1326;
                }
                int _1898 = _1866;
                bool _1900 = _1412 == 92;
                int _1902 = _1898;
                if (_1870)
                {
                    _1890 = _1296;
                }
                int _1904 = _1890;
                bool _1906 = _1468 == 44;
                int _1908 = _1904;
                if (_1876)
                {
                    _1908 = _1298;
                }
                int _1910 = _1908;
                bool _1912 = _1468 == 48;
                int _1914 = _1910;
                if (_1882)
                {
                    _1878 = _1330;
                }
                int _1916 = _1878;
                bool _1918 = _1412 == 96;
                int _1920 = _1916;
                if (_1888)
                {
                    _1914 = _1300;
                }
                int _1922 = _1914;
                bool _1924 = _1468 == 52;
                int _1926 = _1922;
                if (_1894)
                {
                    _1926 = _1302;
                }
                int _1928 = _1926;
                bool _1930 = _1392 >= _1916;
                int _1932 = _1928;
                if (_1900)
                {
                    _1896 = _1328;
                }
                int _1934 = _1896;
                bool _1936 = _1468 == 56;
                int _1938 = _1934;
                if (_1906)
                {
                    _1932 = _1304;
                }
                int _1940 = _1932;
                bool _1942 = _1468 == 60;
                int _1944 = _1940;
                if (_1912)
                {
                    _1944 = _1306;
                }
                int _1946 = _1944;
                bool _1948 = _1468 == 64;
                int _1950 = _1946;
                if (_1918)
                {
                    _1938 = _1330;
                }
                int _1952 = _1938;
                bool _1954 = _1416 == 92;
                _1350 = _1952;
                if (_1924)
                {
                    _1950 = _1308;
                }
                int _1956 = _1950;
                bool _1958 = _1468 == 68;
                int _1960 = _1956;
                if (!_1930)
                {
                    _1436 = _1916;
                }
                int _1962 = _1436;
                int _1964 = _1962;
                if (_1936)
                {
                    _1960 = _1310;
                }
                int _1966 = _1960;
                bool _1968 = _1468 == 72;
                int _1970 = _1966;
                if (_1942)
                {
                    _1970 = _1312;
                }
                int _1972 = _1970;
                bool _1974 = _1962 >= _1952;
                int _1976 = _1972;
                if (_1948)
                {
                    _1976 = _1314;
                }
                int _1978 = _1976;
                bool _1980 = _1416 == 96;
                int _1982 = _1978;
                if (_1954)
                {
                    _1902 = _1328;
                }
                int _1984 = _1902;
                bool _1986 = _1468 == 76;
                int _1988 = _1984;
                if (_1958)
                {
                    _1982 = _1316;
                }
                int _1990 = _1982;
                bool _1992 = _1468 == 80;
                int _1994 = _1990;
                if (_1968)
                {
                    _1994 = _1318;
                }
                int _1996 = _1994;
                bool _1998 = _1468 == 84;
                int _2000 = _1996;
                if (_1974)
                {
                    _1920 = _1962;
                }
                int _2002 = _1920;
                int _2004 = _2002;
                if (_1980)
                {
                    _1988 = _1330;
                }
                int _2006 = _1988;
                bool _2008 = _1468 == 88;
                _1352 = _2006;
                if (!_1974)
                {
                    _2004 = _1952;
                }
                int _2010 = _2004;
                int _2012 = _2010;
                if (_1930)
                {
                    _1964 = _1398;
                }
                int _2014 = _1964;
                int _2016 = _2014;
                if (_1986)
                {
                    _2000 = _1320;
                }
                int _2018 = _2000;
                bool _2020 = _1468 == 92;
                int _2022 = _2018;
                if (_1992)
                {
                    _2022 = _1322;
                }
                int _2024 = _2022;
                bool _2026 = _2010 >= _2006;
                int _2028 = _2024;
                if (_1998)
                {
                    _2028 = _1324;
                }
                int _2030 = _2028;
                bool _2032 = _1468 == 96;
                int _2034 = _2030;
                if (!_1930)
                {
                    _2016 = _1390;
                }
                int _2036 = _2016;
                int _2038 = _1390 + 4;
                _1372 = _2038;
                int _2040 = _2036;
                _1378 = _2038;
                if (_2008)
                {
                    _2034 = _1326;
                }
                int _2042 = _2034;
                int _2044 = _2042;
                if (!_1974)
                {
                    _2040 = _1406;
                }
                int _2046 = _2040;
                bool _2048 = _2038 >= _1386;
                int _2050 = _2046;
                if (_2020)
                {
                    _2044 = _1328;
                }
                int _2052 = _2044;
                int _2054 = _2052;
                if (!_2026)
                {
                    _2012 = _2006;
                }
                int _2056 = _2012;
                _1348 = _2056;
                _1356 = _2056;
                if (_2032)
                {
                    _2054 = _1330;
                }
                int _2058 = _2054;
                _1354 = _2058;
                if (!_2026)
                {
                    _2050 = _1408;
                }
                int _2060 = _2050;
                bool _2062 = _2056 >= _2058;
                int _2064 = _2060;
                if (_2062)
                {
                    _1438 = _2060;
                }
                int _2066 = _1438;
                int _2068 = _2066;
                if (_2062)
                {
                    _2064 = _2056;
                }
                int _2070 = _2064;
                int _2072 = _2070;
                if (!_2062)
                {
                    _2068 = _1426;
                }
                int _2074 = _2068;
                _1376 = _2074;
                _1384 = _2074;
                if (!_2062)
                {
                    _2072 = _2058;
                }
                int _2076 = _2072;
                _1388 = !_2048;
                _1374 = _2076;
                _1380 = _2076;
            } while (_1388);
        }
        int _2078 = _1378;
        int _2080 = _1380;
        int _2082 = _1356;
        int _2084 = _1382;
        int _2086 = _1384;
        int _2088 = -_2078;
        int _2090 = _1334 + _2088;
        bool _2092 = _2090 > 1;
        bool _2094 = !_2092;
        int _2096 = _2082;
        int _2098 = _2090;
        int _2100 = _2080;
        int _2102 = _2086;
        int _2104 = _2078;
        int _2106 = _2084;
        int _2108 = _2080;
        int _2110 = _2086;
        if (!_2094)
        {
            int _2112 = _2078 * 4;
            int _2114 = _2078 + 1;
            bool _2116 = _2112 == 0;
            int _2118 = _2114 * 4;
            bool _2120 = _2112 == 4;
            bool _2122 = _2112 == 8;
            bool _2124 = _2112 == 12;
            bool _2126 = _2112 == 24;
            bool _2128 = _2118 == 0;
            bool _2130 = _2112 == 40;
            if (_2116)
            {
                _2096 = _1282;
            }
            int _2132 = _2096;
            bool _2134 = _2112 == 16;
            int _2136 = _2132;
            if (_2120)
            {
                _2136 = _1284;
            }
            int _2138 = _2136;
            bool _2140 = _2112 == 20;
            int _2142 = _2138;
            if (_2122)
            {
                _2142 = _1286;
            }
            int _2144 = _2142;
            bool _2146 = _2112 == 36;
            int _2148 = _2144;
            if (_2124)
            {
                _2148 = _1288;
            }
            int _2150 = _2148;
            bool _2152 = _2112 == 28;
            int _2154 = _2150;
            if (_2128)
            {
                _2098 = _1282;
            }
            int _2156 = _2098;
            bool _2158 = _2118 == 16;
            int _2160 = _2156;
            if (_2134)
            {
                _2154 = _1290;
            }
            int _2162 = _2154;
            bool _2164 = _2112 == 32;
            int _2166 = _2162;
            if (_2140)
            {
                _2166 = _1292;
            }
            int _2168 = _2166;
            bool _2170 = _2112 == 48;
            int _2172 = _2168;
            if (_2126)
            {
                _2172 = _1294;
            }
            int _2174 = _2172;
            bool _2176 = _2118 == 4;
            int _2178 = _2174;
            if (_2152)
            {
                _2178 = _1296;
            }
            int _2180 = _2178;
            bool _2182 = _2112 == 44;
            int _2184 = _2180;
            if (_2164)
            {
                _2184 = _1298;
            }
            int _2186 = _2184;
            bool _2188 = _2118 == 8;
            int _2190 = _2186;
            if (_2146)
            {
                _2190 = _1300;
            }
            int _2192 = _2190;
            bool _2194 = _2118 == 12;
            int _2196 = _2192;
            if (_2130)
            {
                _2196 = _1302;
            }
            int _2198 = _2196;
            int _2200 = _2198;
            if (_2176)
            {
                _2160 = _1284;
            }
            int _2202 = _2160;
            int _2204 = _2202;
            if (_2182)
            {
                _2200 = _1304;
            }
            int _2206 = _2200;
            bool _2208 = _2112 == 52;
            int _2210 = _2206;
            if (_2170)
            {
                _2210 = _1306;
            }
            int _2212 = _2210;
            bool _2214 = _2118 == 20;
            bool _2216 = _2118 == 24;
            bool _2218 = _2112 == 60;
            int _2220 = _2212;
            if (_2188)
            {
                _2204 = _1286;
            }
            int _2222 = _2204;
            bool _2224 = _2112 == 56;
            int _2226 = _2222;
            if (_2194)
            {
                _2226 = _1288;
            }
            int _2228 = _2226;
            bool _2230 = _2118 == 28;
            int _2232 = _2228;
            if (_2158)
            {
                _2232 = _1290;
            }
            int _2234 = _2232;
            bool _2236 = _2118 == 32;
            int _2238 = _2234;
            if (_2208)
            {
                _2220 = _1308;
            }
            int _2240 = _2220;
            bool _2242 = _2112 == 64;
            int _2244 = _2240;
            if (_2214)
            {
                _2238 = _1292;
            }
            int _2246 = _2238;
            bool _2248 = _2118 == 36;
            int _2250 = _2246;
            if (_2216)
            {
                _2250 = _1294;
            }
            int _2252 = _2250;
            bool _2254 = _2112 == 68;
            int _2256 = _2252;
            if (_2224)
            {
                _2244 = _1310;
            }
            int _2258 = _2244;
            bool _2260 = _2118 == 40;
            int _2262 = _2258;
            if (_2230)
            {
                _2256 = _1296;
            }
            int _2264 = _2256;
            bool _2266 = _2112 == 72;
            int _2268 = _2264;
            if (_2218)
            {
                _2262 = _1312;
            }
            int _2270 = _2262;
            bool _2272 = _2118 == 44;
            int _2274 = _2270;
            if (_2236)
            {
                _2268 = _1298;
            }
            int _2276 = _2268;
            bool _2278 = _2118 == 48;
            int _2280 = _2276;
            if (_2248)
            {
                _2280 = _1300;
            }
            int _2282 = _2280;
            bool _2284 = _2112 == 76;
            int _2286 = _2282;
            if (_2242)
            {
                _2274 = _1314;
            }
            int _2288 = _2274;
            bool _2290 = _2118 == 52;
            int _2292 = _2288;
            if (_2254)
            {
                _2292 = _1316;
            }
            int _2294 = _2292;
            bool _2296 = _2112 == 80;
            int _2298 = _2294;
            if (_2260)
            {
                _2286 = _1302;
            }
            int _2300 = _2286;
            bool _2302 = _2118 == 56;
            int _2304 = _2300;
            if (_2266)
            {
                _2298 = _1318;
            }
            int _2306 = _2298;
            bool _2308 = _2112 == 84;
            int _2310 = _2306;
            if (_2272)
            {
                _2304 = _1304;
            }
            int _2312 = _2304;
            bool _2314 = _2118 == 60;
            int _2316 = _2312;
            if (_2278)
            {
                _2316 = _1306;
            }
            int _2318 = _2316;
            bool _2320 = _2118 == 64;
            int _2322 = _2318;
            if (_2284)
            {
                _2310 = _1320;
            }
            int _2324 = _2310;
            bool _2326 = _2112 == 88;
            int _2328 = _2324;
            if (_2290)
            {
                _2322 = _1308;
            }
            int _2330 = _2322;
            bool _2332 = _2118 == 68;
            int _2334 = _2330;
            if (_2296)
            {
                _2328 = _1322;
            }
            int _2336 = _2328;
            bool _2338 = _2112 == 92;
            int _2340 = _2336;
            if (_2302)
            {
                _2334 = _1310;
            }
            int _2342 = _2334;
            bool _2344 = _2118 == 72;
            int _2346 = _2342;
            if (_2308)
            {
                _2340 = _1324;
            }
            int _2348 = _2340;
            bool _2350 = _2112 == 96;
            int _2352 = _2348;
            if (_2314)
            {
                _2346 = _1312;
            }
            int _2354 = _2346;
            bool _2356 = _2118 == 76;
            int _2358 = _2354;
            if (_2320)
            {
                _2358 = _1314;
            }
            int _2360 = _2358;
            bool _2362 = _2118 == 80;
            int _2364 = _2360;
            if (_2326)
            {
                _2352 = _1326;
            }
            int _2366 = _2352;
            int _2368 = _2366;
            if (_2332)
            {
                _2364 = _1316;
            }
            int _2370 = _2364;
            bool _2372 = _2118 == 84;
            int _2374 = _2370;
            if (_2338)
            {
                _2368 = _1328;
            }
            int _2376 = _2368;
            bool _2378 = _2118 == 96;
            int _2380 = _2376;
            if (_2344)
            {
                _2374 = _1318;
            }
            int _2382 = _2374;
            bool _2384 = _2118 == 88;
            int _2386 = _2382;
            if (_2350)
            {
                _2380 = _1330;
            }
            int _2388 = _2380;
            bool _2390 = _2118 == 92;
            if (_2356)
            {
                _2386 = _1320;
            }
            int _2392 = _2386;
            int _2394 = _2392;
            if (_2362)
            {
                _2394 = _1322;
            }
            int _2396 = _2394;
            bool _2398 = _2080 >= _2388;
            int _2400 = _2396;
            if (_2372)
            {
                _2400 = _1324;
            }
            int _2402 = _2400;
            int _2404 = _2402;
            if (_2384)
            {
                _2404 = _1326;
            }
            int _2406 = _2404;
            int _2408 = _2406;
            if (_2390)
            {
                _2408 = _1328;
            }
            int _2410 = _2408;
            int _2412 = _2410;
            _2106 = 0;
            if (_2378)
            {
                _2412 = _1330;
            }
            int _2414 = _2412;
            if (!_2398)
            {
                _2100 = _2388;
            }
            int _2416 = _2100;
            _2108 = _2416;
            if (!_2398)
            {
                _2102 = _2078;
            }
            int _2418 = _2102;
            int _2420 = _2114 + 1;
            bool _2422 = _2416 >= _2414;
            int _2424 = _2418;
            _2104 = _2420;
            if (!_2422)
            {
                _2424 = _2114;
            }
            int _2426 = _2424;
            _2110 = _2426;
            if (!_2422)
            {
                _2108 = _2414;
            }
        }
        int _2428 = _2104;
        int _2430 = _2106;
        int _2432 = _2108;
        int _2434 = _2110;
        bool _2436 = _2428 < _1334;
        int _2438 = (_2436 ? (-1) : 0) | _2430;
        int _2440 = ~_2438;
        int _2442 = _2434;
        if (!(_2440 != 0))
        {
            int _2444 = _2428 * 4;
            bool _2446 = _2444 == 4;
            bool _2448 = _2444 == 8;
            bool _2450 = _2444 == 12;
            bool _2452 = _2444 == 16;
            if (_2446)
            {
                _1358 = _1284;
            }
            int _2454 = _1358;
            bool _2456 = _2444 == 20;
            int _2458 = _2454;
            if (_2448)
            {
                _2458 = _1286;
            }
            int _2460 = _2458;
            bool _2462 = _2444 == 24;
            int _2464 = _2460;
            if (_2450)
            {
                _2464 = _1288;
            }
            int _2466 = _2464;
            bool _2468 = _2444 == 28;
            int _2470 = _2466;
            if (_2452)
            {
                _2470 = _1290;
            }
            int _2472 = _2470;
            bool _2474 = _2444 == 32;
            int _2476 = _2472;
            if (_2456)
            {
                _2476 = _1292;
            }
            int _2478 = _2476;
            bool _2480 = _2444 == 36;
            int _2482 = _2478;
            if (_2462)
            {
                _2482 = _1294;
            }
            int _2484 = _2482;
            bool _2486 = _2444 == 40;
            int _2488 = _2484;
            if (_2468)
            {
                _2488 = _1296;
            }
            int _2490 = _2488;
            bool _2492 = _2444 == 44;
            int _2494 = _2490;
            if (_2474)
            {
                _2494 = _1298;
            }
            int _2496 = _2494;
            bool _2498 = _2444 == 48;
            int _2500 = _2496;
            if (_2480)
            {
                _2500 = _1300;
            }
            int _2502 = _2500;
            bool _2504 = _2444 == 52;
            int _2506 = _2502;
            if (_2486)
            {
                _2506 = _1302;
            }
            int _2508 = _2506;
            bool _2510 = _2444 == 56;
            int _2512 = _2508;
            if (_2492)
            {
                _2512 = _1304;
            }
            int _2514 = _2512;
            bool _2516 = _2444 == 60;
            int _2518 = _2514;
            if (_2498)
            {
                _2518 = _1306;
            }
            int _2520 = _2518;
            bool _2522 = _2444 == 64;
            int _2524 = _2520;
            if (_2504)
            {
                _2524 = _1308;
            }
            int _2526 = _2524;
            bool _2528 = _2444 == 68;
            int _2530 = _2526;
            if (_2510)
            {
                _2530 = _1310;
            }
            int _2532 = _2530;
            bool _2534 = _2444 == 72;
            int _2536 = _2532;
            if (_2516)
            {
                _2536 = _1312;
            }
            int _2538 = _2536;
            bool _2540 = _2444 == 76;
            int _2542 = _2538;
            if (_2522)
            {
                _2542 = _1314;
            }
            int _2544 = _2542;
            bool _2546 = _2444 == 80;
            int _2548 = _2544;
            if (_2528)
            {
                _2548 = _1316;
            }
            int _2550 = _2548;
            bool _2552 = _2444 == 84;
            int _2554 = _2550;
            if (_2534)
            {
                _2554 = _1318;
            }
            int _2556 = _2554;
            bool _2558 = _2444 == 88;
            int _2560 = _2556;
            if (_2540)
            {
                _2560 = _1320;
            }
            int _2562 = _2560;
            bool _2564 = _2444 == 92;
            int _2566 = _2562;
            if (_2546)
            {
                _2566 = _1322;
            }
            int _2568 = _2566;
            bool _2570 = _2444 == 96;
            int _2572 = _2568;
            if (_2552)
            {
                _2572 = _1324;
            }
            int _2574 = _2572;
            int _2576 = _2574;
            if (_2558)
            {
                _2576 = _1326;
            }
            int _2578 = _2576;
            int _2580 = _2578;
            if (_2564)
            {
                _2580 = _1328;
            }
            int _2582 = _2580;
            int _2584 = _2582;
            if (_2570)
            {
                _2584 = _1330;
            }
            int _2586 = _2584;
            bool _2588 = _2432 >= _2586;
            if (!_2588)
            {
                _2442 = _2428;
            }
        }
        int _2590 = _2442;
        _1366 = _2590;
    }
    int _2592 = _1366;
    int _2594 = _2592 * 8;
    float _2596 = as_type<float>(int(gl_VertexIndex));
    uint _2598 = uint(int(uint(_2594) >> uint(2)));
    float _2600 = as_type<float>(_31[int(_2598)]);
    int _2602 = _2594 + 4;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    float _2606 = as_type<float>(_31[int(_2604)]);
    int _2608 = as_type<int>(_2596) << 5;
    int _2610 = _2608 + 16;
    int _2612 = as_type<int>(_2596) << 5;
    int _2614 = _2612 + 24;
    uint _2616 = uint(int(uint(_2610) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2616)] = as_type<uint>(_2600);
    int _2618 = _2610 + 4;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2620)] = as_type<uint>(_2606);
    uint _2622 = uint(int(uint(_2614) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2622)] = as_type<uint>(_1332);
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    bool _856 = false;
    bool _680 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _55 = -2;
    int _57 = 0;
    int _59 = 0;
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
    float _110 = 1000000.0;
    bool _114;
    bool _257;
    float _642;
    int _644;
    int _646;
    int _648;
    bool _656;
    int _658;
    int _712;
    int _714;
    int _720;
    int _726;
    int _732;
    int _738;
    int _744;
    int _750;
    int _756;
    int _762;
    int _768;
    int _774;
    int _780;
    int _786;
    int _792;
    int _798;
    bool _802;
    int _804;
    int _810;
    int _816;
    int _822;
    int _828;
    int _832;
    int _836;
    int _840;
    int _844;
    int _848;
    int _852;
    int _854;
    int _1214;
    int _1282;
    int _1284;
    int _1286;
    int _1288;
    int _1290;
    int _1292;
    int _1294;
    int _1296;
    int _1298;
    int _1300;
    int _1302;
    int _1304;
    int _1306;
    int _1308;
    int _1310;
    int _1312;
    int _1314;
    int _1316;
    int _1318;
    int _1320;
    int _1322;
    int _1324;
    int _1326;
    int _1328;
    int _1330;
    float _1332;
    int _1334;
    int _1348;
    int _1350;
    int _1352;
    int _1354;
    int _1356;
    int _1358;
    do
    {
        int _116 = _55;
        int _118 = _57;
        int _120 = _59;
        int _122 = _61;
        int _124 = _63;
        int _126 = _65;
        int _128 = _67;
        int _130 = _69;
        int _132 = _71;
        int _134 = _73;
        int _136 = _75;
        int _138 = _77;
        int _140 = _79;
        int _142 = _81;
        int _144 = _83;
        int _146 = _85;
        int _148 = _87;
        int _150 = _89;
        int _152 = _91;
        int _154 = _93;
        int _156 = _95;
        int _158 = _97;
        int _160 = _99;
        int _162 = _101;
        int _164 = _103;
        int _166 = _105;
        int _168 = _107;
        float _170 = _110;
        float _172 = float(_116);
        float _174 = _172 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _176 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _178 = fma(_174, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2695 = float2(_176, _178);
        float4 _181 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2695, float2(0.0), isnan(_2695)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2695, float2(0.0), isnan(_2695)), level(0.0)).xyzw;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float _189 = _181.w;
        int _191 = -2;
        float _193 = _185;
        float _195 = _189;
        float _197 = _187;
        float _199 = _183;
        int _201 = -2;
        int _203 = _118;
        int _205 = _120;
        int _207 = _122;
        int _209 = _124;
        int _211 = _126;
        int _213 = _128;
        int _215 = _130;
        int _217 = _132;
        int _219 = _134;
        int _221 = _136;
        int _223 = _138;
        int _225 = _140;
        int _227 = _142;
        int _229 = _144;
        int _231 = _146;
        int _233 = _148;
        int _235 = _150;
        int _237 = _152;
        int _239 = _154;
        int _241 = _156;
        int _243 = _158;
        int _245 = _160;
        int _247 = _162;
        int _249 = _164;
        int _251 = _166;
        int _253 = _168;
        float _255 = _170;
        do
        {
            int _259 = _191;
            float _261 = _193;
            float _263 = _195;
            float _265 = _197;
            float _267 = _199;
            int _269 = _201;
            int _271 = _203;
            int _273 = _205;
            int _275 = _207;
            int _277 = _209;
            int _279 = _211;
            int _281 = _213;
            int _283 = _215;
            int _285 = _217;
            int _287 = _219;
            int _289 = _221;
            int _291 = _223;
            int _293 = _225;
            int _295 = _227;
            int _297 = _229;
            int _299 = _231;
            int _301 = _233;
            int _303 = _235;
            int _305 = _237;
            int _307 = _239;
            int _309 = _241;
            int _311 = _243;
            int _313 = _245;
            int _315 = _247;
            int _317 = _249;
            int _319 = _251;
            int _321 = _253;
            float _323 = _255;
            int _325 = _259 + 1;
            float _327 = float(_116);
            float _329 = 0.0 + _261;
            float _331 = precise::clamp(_329, 0.0, 1.0);
            float _333 = _327 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _335 = float(_325);
            float _337 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _339 = fma(_333, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _341 = 0.0 + _263;
            float _343 = precise::clamp(_341, 0.0, 1.0);
            float _345 = fma(_335, _337, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _347 = 0.0 + _265;
            float _349 = precise::clamp(_347, 0.0, 1.0);
            float _351 = 0.0 + _267;
            float _353 = precise::clamp(_351, 0.0, 1.0);
            float2 _2817 = float2(_345, _339);
            float4 _355 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2817, float2(0.0), isnan(_2817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2817, float2(0.0), isnan(_2817)), level(0.0)).xyzw;
            float _357 = _355.x;
            float _359 = _355.y;
            float _361 = _355.z;
            float _363 = _355.w;
            float _365 = _343 * 65535.0;
            float _367 = _349 * 65535.0;
            float _369 = _331 * 65535.0;
            float _371 = _353 * 65535.0;
            float _373 = rint(_365);
            int _375 = int(_373);
            float _377 = rint(_367);
            int _379 = int(_377);
            float _381 = rint(_369);
            int _383 = int(_381);
            uint _386 = extract_bits(uint(_375), 0u, 8u);
            int _388 = int(_386) & 255;
            uint _390 = extract_bits(uint(_375), 8u, 8u);
            int _392 = int(_390) & 255;
            int _394 = _392 << 8;
            int _396 = _388 | _394;
            float _398 = rint(_371);
            int _400 = int(_398);
            uint _402 = extract_bits(uint(_396), 0u, 8u);
            int _404 = int(_402) & 255;
            uint _406 = extract_bits(uint(_396), 8u, 8u);
            int _408 = int(_406) & 255;
            int _410 = _408 << 8;
            int _412 = _404 | _410;
            uint _414 = extract_bits(uint(_379), 0u, 8u);
            int _416 = int(_414) & 255;
            int _418 = _416 << 16;
            int _420 = _412 | _418;
            uint _422 = extract_bits(uint(_379), 8u, 8u);
            int _424 = int(_422) & 255;
            int _426 = _424 << 24;
            int _428 = _420 | _426;
            float _430 = float(_269);
            bool _432 = _428 != 0;
            uint _434 = extract_bits(uint(_383), 0u, 8u);
            int _436 = int(_434) & 255;
            uint _438 = extract_bits(uint(_383), 8u, 8u);
            int _440 = int(_438) & 255;
            int _442 = _440 << 8;
            int _444 = _436 | _442;
            float _446 = fma(_430, _337, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _448 = extract_bits(uint(_444), 0u, 8u);
            int _450 = int(_448) & 255;
            uint _452 = extract_bits(uint(_444), 8u, 8u);
            int _454 = int(_452) & 255;
            int _456 = _454 << 8;
            int _458 = _450 | _456;
            uint _460 = extract_bits(uint(_400), 0u, 8u);
            int _462 = int(_460) & 255;
            int _464 = _462 << 16;
            int _466 = _458 | _464;
            uint _468 = extract_bits(uint(_400), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 24;
            int _474 = _466 | _472;
            bool _476 = _474 != 0;
            bool _478 = _476 || _432;
            bool _480 = !_478;
            _191 = _325;
            _193 = _359;
            _195 = _363;
            _197 = _361;
            _199 = _357;
            int _482 = _281;
            int _484 = _273;
            int _486 = _275;
            int _488 = _277;
            int _490 = _279;
            int _492 = _283;
            int _494 = _285;
            int _496 = _295;
            int _498 = _287;
            int _500 = _289;
            int _502 = _291;
            int _504 = _293;
            int _506 = _297;
            int _508 = _299;
            int _510 = _309;
            int _512 = _301;
            int _514 = _303;
            int _516 = _305;
            int _518 = _307;
            int _520 = _311;
            int _522 = _313;
            int _524 = _315;
            int _526 = _317;
            int _528 = _319;
            int _530 = _321;
            int _532 = _428;
            int _534 = _273;
            int _536 = _275;
            int _538 = _277;
            int _540 = _279;
            int _542 = _317;
            int _544 = _319;
            int _546 = _321;
            int _548 = _281;
            int _550 = _283;
            int _552 = _285;
            int _554 = _287;
            int _556 = _289;
            int _558 = _291;
            int _560 = _293;
            int _562 = _295;
            int _564 = _297;
            int _566 = _299;
            int _568 = _301;
            int _570 = _303;
            int _572 = _305;
            int _574 = _307;
            int _576 = _315;
            int _578 = _313;
            int _580 = _311;
            int _582 = _271;
            int _584 = _273;
            int _586 = _275;
            int _588 = _277;
            int _590 = _279;
            int _592 = _281;
            int _594 = _283;
            int _596 = _285;
            int _598 = _287;
            int _600 = _289;
            int _602 = _291;
            int _604 = _293;
            int _606 = _295;
            int _608 = _297;
            int _610 = _299;
            int _612 = _301;
            int _614 = _303;
            int _616 = _305;
            int _618 = _307;
            int _620 = _309;
            int _622 = _311;
            int _624 = _313;
            int _626 = _315;
            int _628 = _317;
            int _630 = _319;
            int _632 = _321;
            int _634 = _474;
            int _636 = _400;
            int _638 = _428;
            int _640 = as_type<int>(_430);
            _642 = _323;
            _644 = _474;
            _646 = _428;
            _648 = as_type<int>(_361);
            if (!_480)
            {
                bool _650 = _271 > 0;
                bool _652 = !_650;
                if (!_652)
                {
                    int _654 = 0;
                    do
                    {
                        _658 = _654;
                        int _660 = _658 * 8;
                        uint _662 = uint(int(uint(_660) >> uint(2)));
                        float _664 = as_type<float>(_31[int(_662)]);
                        int _666 = _660 + 4;
                        uint _668 = uint(int(uint(_666) >> uint(2)));
                        float _670 = as_type<float>(_31[int(_668)]);
                        bool _672 = as_type<int>(_664) != _428;
                        bool _674 = as_type<int>(_670) != _474;
                        bool _676 = _674 || _672;
                        bool _678 = !_676;
                        _680 = _678;
                        if (_680)
                        {
                            break;
                        }
                        int _682 = _658 + 1;
                        bool _684 = _682 >= _271;
                        _656 = !_684;
                        _654 = _682;
                    } while (_656);
                }
                if (!_680)
                {
                    int _686 = _271 * 4;
                    int _688 = _271 * 8;
                    int _690 = _271 + 1;
                    bool _692 = _686 == 16;
                    bool _694 = _686 == 0;
                    uint _696 = uint(int(uint(_688) >> uint(2)));
                    _31[int(_696)] = uint(_428);
                    int _698 = _688 + 4;
                    uint _700 = uint(int(uint(_698) >> uint(2)));
                    _31[int(_700)] = uint(_474);
                    bool _702 = _686 == 4;
                    bool _704 = _686 == 8;
                    bool _706 = _686 == 12;
                    bool _708 = _686 == 20;
                    bool _710 = _686 == 24;
                    _582 = _690;
                    _636 = _688;
                    _640 = _686;
                    _712 = _688;
                    _714 = _686;
                    if (_692)
                    {
                        _482 = 1;
                    }
                    int _716 = _482;
                    bool _718 = _686 == 44;
                    _592 = _716;
                    _720 = _716;
                    if (_694)
                    {
                        _484 = 1;
                    }
                    int _722 = _484;
                    bool _724 = _686 == 28;
                    _584 = _722;
                    _726 = _722;
                    if (_702)
                    {
                        _486 = 1;
                    }
                    int _728 = _486;
                    bool _730 = _686 == 32;
                    _586 = _728;
                    _732 = _728;
                    if (_704)
                    {
                        _488 = 1;
                    }
                    int _734 = _488;
                    bool _736 = _686 == 36;
                    _588 = _734;
                    _738 = _734;
                    if (_706)
                    {
                        _490 = 1;
                    }
                    int _740 = _490;
                    bool _742 = _686 == 40;
                    _590 = _740;
                    _744 = _740;
                    if (_708)
                    {
                        _492 = 1;
                    }
                    int _746 = _492;
                    bool _748 = _686 == 48;
                    _594 = _746;
                    _750 = _746;
                    if (_710)
                    {
                        _494 = 1;
                    }
                    int _752 = _494;
                    bool _754 = _686 == 52;
                    _596 = _752;
                    _756 = _752;
                    if (_718)
                    {
                        _496 = 1;
                    }
                    int _758 = _496;
                    bool _760 = _686 == 72;
                    _606 = _758;
                    _762 = _758;
                    if (_724)
                    {
                        _498 = 1;
                    }
                    int _764 = _498;
                    bool _766 = _686 == 56;
                    _598 = _764;
                    _768 = _764;
                    if (_730)
                    {
                        _500 = 1;
                    }
                    int _770 = _500;
                    bool _772 = _686 == 60;
                    _600 = _770;
                    _774 = _770;
                    if (_736)
                    {
                        _502 = 1;
                    }
                    int _776 = _502;
                    bool _778 = _686 == 64;
                    _602 = _776;
                    _780 = _776;
                    if (_742)
                    {
                        _504 = 1;
                    }
                    int _782 = _504;
                    bool _784 = _686 == 68;
                    _604 = _782;
                    _786 = _782;
                    if (_748)
                    {
                        _506 = 1;
                    }
                    int _788 = _506;
                    bool _790 = _686 == 76;
                    _608 = _788;
                    _792 = _788;
                    if (_754)
                    {
                        _508 = 1;
                    }
                    int _794 = _508;
                    bool _796 = _686 == 80;
                    _610 = _794;
                    _798 = _794;
                    if (_760)
                    {
                        _510 = 1;
                    }
                    int _800 = _510;
                    _802 = _690 != 25;
                    _620 = _800;
                    _804 = _800;
                    if (_766)
                    {
                        _512 = 1;
                    }
                    int _806 = _512;
                    bool _808 = _686 == 84;
                    _612 = _806;
                    _810 = _806;
                    if (_772)
                    {
                        _514 = 1;
                    }
                    int _812 = _514;
                    bool _814 = _686 == 88;
                    _614 = _812;
                    _816 = _812;
                    if (_778)
                    {
                        _516 = 1;
                    }
                    int _818 = _516;
                    bool _820 = _686 == 92;
                    _616 = _818;
                    _822 = _818;
                    if (_784)
                    {
                        _518 = 1;
                    }
                    int _824 = _518;
                    bool _826 = _686 == 96;
                    _618 = _824;
                    _828 = _824;
                    if (_790)
                    {
                        _520 = 1;
                    }
                    int _830 = _520;
                    _622 = _830;
                    _832 = _830;
                    if (_796)
                    {
                        _522 = 1;
                    }
                    int _834 = _522;
                    _624 = _834;
                    _836 = _834;
                    if (_808)
                    {
                        _524 = 1;
                    }
                    int _838 = _524;
                    _626 = _838;
                    _840 = _838;
                    if (_814)
                    {
                        _526 = 1;
                    }
                    int _842 = _526;
                    _628 = _842;
                    _844 = _842;
                    if (_820)
                    {
                        _528 = 1;
                    }
                    int _846 = _528;
                    _630 = _846;
                    _848 = _846;
                    if (_826)
                    {
                        _530 = 1;
                    }
                    int _850 = _530;
                    _632 = _850;
                    _852 = _850;
                }
                if ((!_802) || _680)
                {
                    if (!_680)
                    {
                        _854 = 25;
                        _856 = true;
                        if (_856)
                        {
                            break;
                        }
                    }
                    _680 = false;
                    int _858 = _658 * 4;
                    bool _860 = _858 == 0;
                    bool _862 = _858 == 4;
                    bool _864 = _858 == 8;
                    bool _866 = _858 == 12;
                    bool _868 = _858 == 88;
                    bool _870 = _858 == 92;
                    bool _872 = _858 == 96;
                    if (_860)
                    {
                        _532 = _273;
                    }
                    int _874 = _532;
                    bool _876 = _858 == 16;
                    int _878 = _874;
                    if (_862)
                    {
                        _878 = _275;
                    }
                    int _880 = _878;
                    bool _882 = _858 == 20;
                    int _884 = _880;
                    if (_864)
                    {
                        _884 = _277;
                    }
                    int _886 = _884;
                    bool _888 = _858 == 24;
                    int _890 = _886;
                    if (_866)
                    {
                        _890 = _279;
                    }
                    int _892 = _890;
                    bool _894 = _858 == 84;
                    int _896 = int(_888);
                    int _898 = _882 ? 2 : 0;
                    int _900 = _896 | _898;
                    int _902 = _876 ? 4 : 0;
                    int _904 = _900 | _902;
                    int _906 = _894 ? 8 : 0;
                    int _908 = _904 | _906;
                    int _910 = _868 ? 16 : 0;
                    int _912 = _908 | _910;
                    int _914 = _870 ? 32 : 0;
                    int _916 = _912 | _914;
                    int _918 = _872 ? 64 : 0;
                    int _920 = _916 | _918;
                    int _922 = _920 & 8;
                    int _924 = _892;
                    _634 = _922;
                    if (_876)
                    {
                        _924 = _281;
                    }
                    int _926 = _924;
                    bool _928 = _858 == 80;
                    int _930 = _926;
                    if (_882)
                    {
                        _930 = _283;
                    }
                    int _932 = _930;
                    bool _934 = _858 == 76;
                    int _936 = _932;
                    if (_888)
                    {
                        _936 = _285;
                    }
                    int _938 = _936;
                    bool _940 = _858 == 28;
                    int _942 = int(_940);
                    int _944 = _934 ? 2 : 0;
                    int _946 = _942 | _944;
                    int _948 = _928 ? 4 : 0;
                    int _950 = _946 | _948;
                    int _952 = _894 ? 8 : 0;
                    int _954 = _950 | _952;
                    int _956 = _868 ? 16 : 0;
                    int _958 = _954 | _956;
                    int _960 = _870 ? 32 : 0;
                    int _962 = _958 | _960;
                    int _964 = _872 ? 64 : 0;
                    int _966 = _962 | _964;
                    int _968 = _966 & 2;
                    int _970 = int(_940);
                    int _972 = _934 ? 2 : 0;
                    int _974 = _970 | _972;
                    int _976 = _928 ? 4 : 0;
                    int _978 = _974 | _976;
                    int _980 = _894 ? 8 : 0;
                    int _982 = _978 | _980;
                    int _984 = _868 ? 16 : 0;
                    int _986 = _982 | _984;
                    int _988 = _870 ? 32 : 0;
                    int _990 = _986 | _988;
                    int _992 = _872 ? 64 : 0;
                    int _994 = _990 | _992;
                    int _996 = _994 & 4;
                    int _998 = _938;
                    _636 = _968;
                    _640 = _996;
                    if (_940)
                    {
                        _998 = _287;
                    }
                    int _1000 = _998;
                    bool _1002 = _858 == 32;
                    int _1004 = _1000;
                    if (_1002)
                    {
                        _1004 = _289;
                    }
                    int _1006 = _1004;
                    bool _1008 = _858 == 36;
                    int _1010 = _1006;
                    if (_1008)
                    {
                        _1010 = _291;
                    }
                    int _1012 = _1010;
                    bool _1014 = _858 == 40;
                    int _1016 = _1012;
                    if (_1014)
                    {
                        _1016 = _293;
                    }
                    int _1018 = _1016;
                    bool _1020 = _858 == 44;
                    int _1022 = _1018;
                    if (_1020)
                    {
                        _1022 = _295;
                    }
                    int _1024 = _1022;
                    bool _1026 = _858 == 48;
                    int _1028 = _1024;
                    if (_1026)
                    {
                        _1028 = _297;
                    }
                    int _1030 = _1028;
                    bool _1032 = _858 == 52;
                    int _1034 = _1030;
                    if (_1032)
                    {
                        _1034 = _299;
                    }
                    int _1036 = _1034;
                    bool _1038 = _858 == 56;
                    int _1040 = _1036;
                    if (_1038)
                    {
                        _1040 = _301;
                    }
                    int _1042 = _1040;
                    bool _1044 = _858 == 60;
                    int _1046 = _1042;
                    if (_1044)
                    {
                        _1046 = _303;
                    }
                    int _1048 = _1046;
                    bool _1050 = _858 == 64;
                    int _1052 = _1048;
                    if (_1050)
                    {
                        _1052 = _305;
                    }
                    int _1054 = _1052;
                    bool _1056 = _858 == 68;
                    int _1058 = _1054;
                    if (_1056)
                    {
                        _1058 = _307;
                    }
                    int _1060 = _1058;
                    bool _1062 = _858 == 72;
                    int _1064 = int(_1062);
                    int _1066 = _934 ? 2 : 0;
                    int _1068 = _1064 | _1066;
                    int _1070 = _928 ? 4 : 0;
                    int _1072 = _1068 | _1070;
                    int _1074 = _894 ? 8 : 0;
                    int _1076 = _1072 | _1074;
                    int _1078 = _868 ? 16 : 0;
                    int _1080 = _1076 | _1078;
                    int _1082 = _870 ? 32 : 0;
                    int _1084 = _1080 | _1082;
                    int _1086 = _872 ? 64 : 0;
                    int _1088 = _1084 | _1086;
                    int _1090 = _1088 & 1;
                    int _1092 = _1060;
                    if (_1062)
                    {
                        _1092 = _309;
                    }
                    int _1094 = _1092;
                    bool _1096 = _858 == 4;
                    int _1098 = _1094;
                    if (_934)
                    {
                        _1098 = _311;
                    }
                    int _1100 = _1098;
                    bool _1102 = _858 == 0;
                    int _1104 = _1100;
                    if (_928)
                    {
                        _1104 = _313;
                    }
                    int _1106 = _1104;
                    bool _1108 = _858 == 12;
                    int _1110 = _1106;
                    if (_894)
                    {
                        _1110 = _315;
                    }
                    int _1112 = _1110;
                    bool _1114 = _858 == 8;
                    int _1116 = _1112;
                    if (_868)
                    {
                        _1116 = _317;
                    }
                    int _1118 = _1116;
                    int _1120 = _1118;
                    if (_870)
                    {
                        _1120 = _319;
                    }
                    int _1122 = _1120;
                    int _1124 = _1122;
                    if (_872)
                    {
                        _1124 = _321;
                    }
                    int _1126 = _1124;
                    int _1128 = _1126 + 1;
                    _638 = _1128;
                    if (_1102)
                    {
                        _534 = _1128;
                    }
                    int _1130 = _534;
                    bool _1132 = _858 == 16;
                    _584 = _1130;
                    if (_1096)
                    {
                        _536 = _1128;
                    }
                    int _1134 = _536;
                    bool _1136 = _858 == 20;
                    _586 = _1134;
                    if (_1114)
                    {
                        _538 = _1128;
                    }
                    int _1138 = _538;
                    bool _1140 = _858 == 24;
                    _588 = _1138;
                    if (_1108)
                    {
                        _540 = _1128;
                    }
                    int _1142 = _540;
                    bool _1144 = _858 == 28;
                    _590 = _1142;
                    if (_868)
                    {
                        _542 = _1128;
                    }
                    int _1146 = _542;
                    _628 = _1146;
                    if (_870)
                    {
                        _544 = _1128;
                    }
                    int _1148 = _544;
                    _630 = _1148;
                    if (_872)
                    {
                        _546 = _1128;
                    }
                    int _1150 = _546;
                    _632 = _1150;
                    if (_1132)
                    {
                        _548 = _1128;
                    }
                    int _1152 = _548;
                    bool _1154 = _858 == 32;
                    _592 = _1152;
                    if (_1136)
                    {
                        _550 = _1128;
                    }
                    int _1156 = _550;
                    bool _1158 = _858 == 36;
                    _594 = _1156;
                    if (_1140)
                    {
                        _552 = _1128;
                    }
                    int _1160 = _552;
                    bool _1162 = _858 == 40;
                    _596 = _1160;
                    if (_1144)
                    {
                        _554 = _1128;
                    }
                    int _1164 = _554;
                    bool _1166 = _858 == 44;
                    _598 = _1164;
                    if (_1154)
                    {
                        _556 = _1128;
                    }
                    int _1168 = _556;
                    bool _1170 = _858 == 48;
                    _600 = _1168;
                    if (_1158)
                    {
                        _558 = _1128;
                    }
                    int _1172 = _558;
                    bool _1174 = _858 == 52;
                    _602 = _1172;
                    if (_1162)
                    {
                        _560 = _1128;
                    }
                    int _1176 = _560;
                    bool _1178 = _858 == 56;
                    _604 = _1176;
                    if (_1166)
                    {
                        _562 = _1128;
                    }
                    int _1180 = _562;
                    bool _1182 = _858 == 60;
                    _606 = _1180;
                    if (_1170)
                    {
                        _564 = _1128;
                    }
                    int _1184 = _564;
                    bool _1186 = _858 == 64;
                    _608 = _1184;
                    if (_1174)
                    {
                        _566 = _1128;
                    }
                    int _1188 = _566;
                    bool _1190 = _858 == 68;
                    _610 = _1188;
                    if (_1178)
                    {
                        _568 = _1128;
                    }
                    int _1192 = _568;
                    bool _1194 = _922 != 0;
                    _612 = _1192;
                    if (_1182)
                    {
                        _570 = _1128;
                    }
                    int _1196 = _570;
                    bool _1198 = _996 != 0;
                    _614 = _1196;
                    if (_1186)
                    {
                        _572 = _1128;
                    }
                    int _1200 = _572;
                    bool _1202 = _968 != 0;
                    _616 = _1200;
                    if (_1190)
                    {
                        _574 = _1128;
                    }
                    int _1204 = _574;
                    bool _1206 = _1090 != 0;
                    _618 = _1204;
                    if (_1194)
                    {
                        _576 = _1128;
                    }
                    int _1208 = _576;
                    _626 = _1208;
                    if (_1198)
                    {
                        _578 = _1128;
                    }
                    int _1210 = _578;
                    _624 = _1210;
                    if (_1202)
                    {
                        _580 = _1128;
                    }
                    int _1212 = _580;
                    _622 = _1212;
                    if (_1206)
                    {
                        _620 = _1128;
                    }
                }
            }
            _1214 = _582;
            int _1216 = _584;
            int _1218 = _586;
            int _1220 = _588;
            int _1222 = _590;
            int _1224 = _592;
            int _1226 = _594;
            int _1228 = _596;
            int _1230 = _598;
            int _1232 = _600;
            int _1234 = _602;
            int _1236 = _604;
            int _1238 = _606;
            int _1240 = _608;
            int _1242 = _610;
            int _1244 = _612;
            int _1246 = _614;
            int _1248 = _616;
            int _1250 = _618;
            int _1252 = _620;
            int _1254 = _622;
            int _1256 = _624;
            int _1258 = _626;
            int _1260 = _628;
            int _1262 = _630;
            int _1264 = _632;
            int _1266 = _634;
            int _1268 = _636;
            int _1270 = _638;
            int _1272 = _640;
            float2 _3981 = float2(_446, _339);
            float _1274 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_3981, float2(0.0), isnan(_3981)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_3981, float2(0.0), isnan(_3981)), level(0.0)).x;
            int _1276 = _269 + 1;
            bool _1278 = _1276 >= 3;
            float _1280 = precise::min(_1274, _323);
            _257 = !_1278;
            _201 = _1276;
            _203 = _1214;
            _205 = _1216;
            _207 = _1218;
            _209 = _1220;
            _211 = _1222;
            _213 = _1224;
            _215 = _1226;
            _217 = _1228;
            _219 = _1230;
            _221 = _1232;
            _223 = _1234;
            _225 = _1236;
            _227 = _1238;
            _229 = _1240;
            _231 = _1242;
            _233 = _1244;
            _235 = _1246;
            _237 = _1248;
            _239 = _1250;
            _241 = _1252;
            _243 = _1254;
            _245 = _1256;
            _247 = _1258;
            _249 = _1260;
            _251 = _1262;
            _253 = _1264;
            _255 = _1280;
            _726 = _1216;
            _732 = _1218;
            _738 = _1220;
            _744 = _1222;
            _720 = _1224;
            _750 = _1226;
            _756 = _1228;
            _768 = _1230;
            _774 = _1232;
            _780 = _1234;
            _786 = _1236;
            _762 = _1238;
            _792 = _1240;
            _798 = _1242;
            _810 = _1244;
            _816 = _1246;
            _822 = _1248;
            _828 = _1250;
            _804 = _1252;
            _832 = _1254;
            _836 = _1256;
            _840 = _1258;
            _844 = _1260;
            _848 = _1262;
            _852 = _1264;
            _642 = _1280;
            _644 = _1266;
            _712 = _1268;
            _646 = _1270;
            _714 = _1272;
        } while (_257);
        if (!_856)
        {
            _854 = _1214;
        }
        _856 = false;
        _1282 = _726;
        _1284 = _732;
        _1286 = _738;
        _1288 = _744;
        _1290 = _720;
        _1292 = _750;
        _1294 = _756;
        _1296 = _768;
        _1298 = _774;
        _1300 = _780;
        _1302 = _786;
        _1304 = _762;
        _1306 = _792;
        _1308 = _798;
        _1310 = _810;
        _1312 = _816;
        _1314 = _822;
        _1316 = _828;
        _1318 = _804;
        _1320 = _832;
        _1322 = _836;
        _1324 = _840;
        _1326 = _844;
        _1328 = _848;
        _1330 = _852;
        _1332 = _642;
        _1334 = _854;
        int _1336 = _644;
        int _1338 = _712;
        int _1340 = _646;
        int _1342 = _714;
        int _1344 = _116 + 1;
        bool _1346 = _1344 >= 3;
        _114 = !_1346;
        _55 = _1344;
        _57 = _1334;
        _59 = _1282;
        _61 = _1284;
        _63 = _1286;
        _65 = _1288;
        _67 = _1290;
        _69 = _1292;
        _71 = _1294;
        _73 = _1296;
        _75 = _1298;
        _77 = _1300;
        _79 = _1302;
        _81 = _1304;
        _83 = _1306;
        _85 = _1308;
        _87 = _1310;
        _89 = _1312;
        _91 = _1314;
        _93 = _1316;
        _95 = _1318;
        _97 = _1320;
        _99 = _1322;
        _101 = _1324;
        _103 = _1326;
        _105 = _1328;
        _107 = _1330;
        _110 = _1332;
        _1348 = _1336;
        _1350 = _1338;
        _1352 = _1340;
        _1354 = _1342;
        _1356 = _1336;
        _1358 = _1282;
    } while (_114);
    bool _1360 = _1334 > 0;
    if (!_1360)
    {
        _648 = 0;
    }
    int _1362 = _648;
    bool _1364 = !_1360;
    int _1366 = _1362;
    if (!_1364)
    {
        bool _1368 = _1334 > 3;
        bool _1370 = !_1368;
        int _1372 = 0;
        int _1374 = 0;
        int _1376 = 0;
        int _1378 = 0;
        int _1380 = 0;
        int _1382 = -1;
        int _1384 = 0;
        if (!_1370)
        {
            int _1386 = _1334 + (-3);
            _1382 = 0;
            bool _1388;
            do
            {
                int _1390 = _1372;
                int _1392 = _1374;
                int _1394 = _1348;
                int _1396 = _1350;
                int _1398 = _1376;
                int _1400 = _1352;
                int _1402 = _1354;
                int _1404 = _1390 * 4;
                int _1406 = _1390 + 1;
                int _1408 = _1390 + 2;
                bool _1410 = _1404 == 0;
                int _1412 = _1406 * 4;
                bool _1414 = _1404 == 4;
                int _1416 = _1408 * 4;
                bool _1418 = _1404 == 8;
                bool _1420 = _1404 == 12;
                bool _1422 = _1404 == 16;
                bool _1424 = _1412 == 8;
                int _1426 = _1390 + 3;
                int _1428 = _1394;
                int _1430 = _1396;
                int _1432 = _1400;
                int _1434 = _1402;
                int _1436 = _1392;
                int _1438 = _1398;
                if (_1410)
                {
                    _1428 = _1282;
                }
                int _1440 = _1428;
                bool _1442 = _1404 == 24;
                int _1444 = _1440;
                if (_1414)
                {
                    _1444 = _1284;
                }
                int _1446 = _1444;
                bool _1448 = _1404 == 20;
                int _1450 = _1446;
                if (_1418)
                {
                    _1450 = _1286;
                }
                int _1452 = _1450;
                bool _1454 = _1404 == 32;
                int _1456 = _1452;
                if (_1420)
                {
                    _1456 = _1288;
                }
                int _1458 = _1456;
                bool _1460 = _1404 == 28;
                int _1462 = _1458;
                if (_1422)
                {
                    _1462 = _1290;
                }
                int _1464 = _1462;
                bool _1466 = _1404 == 40;
                int _1468 = _1426 * 4;
                int _1470 = _1464;
                if (_1448)
                {
                    _1470 = _1292;
                }
                int _1472 = _1470;
                bool _1474 = _1404 == 36;
                int _1476 = _1472;
                if (_1442)
                {
                    _1476 = _1294;
                }
                int _1478 = _1476;
                bool _1480 = _1412 == 0;
                int _1482 = _1478;
                if (_1460)
                {
                    _1482 = _1296;
                }
                int _1484 = _1482;
                bool _1486 = _1412 == 4;
                int _1488 = _1484;
                if (_1454)
                {
                    _1488 = _1298;
                }
                int _1490 = _1488;
                bool _1492 = _1412 == 12;
                int _1494 = _1490;
                if (_1474)
                {
                    _1494 = _1300;
                }
                int _1496 = _1494;
                bool _1498 = _1404 == 44;
                int _1500 = _1496;
                if (_1466)
                {
                    _1500 = _1302;
                }
                int _1502 = _1500;
                bool _1504 = _1412 == 16;
                int _1506 = _1502;
                if (_1480)
                {
                    _1430 = _1282;
                }
                int _1508 = _1430;
                bool _1510 = _1404 == 48;
                int _1512 = _1508;
                if (_1486)
                {
                    _1512 = _1284;
                }
                int _1514 = _1512;
                bool _1516 = _1412 == 20;
                int _1518 = _1514;
                if (_1424)
                {
                    _1518 = _1286;
                }
                int _1520 = _1518;
                bool _1522 = _1412 == 24;
                int _1524 = _1520;
                if (_1492)
                {
                    _1524 = _1288;
                }
                int _1526 = _1524;
                bool _1528 = _1412 == 28;
                int _1530 = _1526;
                if (_1498)
                {
                    _1506 = _1304;
                }
                int _1532 = _1506;
                bool _1534 = _1404 == 52;
                int _1536 = _1532;
                if (_1504)
                {
                    _1530 = _1290;
                }
                int _1538 = _1530;
                bool _1540 = _1412 == 32;
                int _1542 = _1538;
                if (_1510)
                {
                    _1536 = _1306;
                }
                int _1544 = _1536;
                bool _1546 = _1404 == 56;
                int _1548 = _1544;
                if (_1516)
                {
                    _1542 = _1292;
                }
                int _1550 = _1542;
                bool _1552 = _1412 == 36;
                int _1554 = _1550;
                if (_1522)
                {
                    _1554 = _1294;
                }
                int _1556 = _1554;
                bool _1558 = _1412 == 40;
                int _1560 = _1556;
                if (_1528)
                {
                    _1560 = _1296;
                }
                int _1562 = _1560;
                bool _1564 = _1412 == 44;
                int _1566 = _1562;
                if (_1534)
                {
                    _1548 = _1308;
                }
                int _1568 = _1548;
                bool _1570 = _1404 == 60;
                int _1572 = _1568;
                if (_1540)
                {
                    _1566 = _1298;
                }
                int _1574 = _1566;
                bool _1576 = _1412 == 48;
                int _1578 = _1574;
                if (_1546)
                {
                    _1572 = _1310;
                }
                int _1580 = _1572;
                bool _1582 = _1404 == 64;
                int _1584 = _1580;
                if (_1552)
                {
                    _1578 = _1300;
                }
                int _1586 = _1578;
                bool _1588 = _1412 == 52;
                int _1590 = _1586;
                if (_1558)
                {
                    _1590 = _1302;
                }
                int _1592 = _1590;
                bool _1594 = _1412 == 56;
                int _1596 = _1592;
                if (_1564)
                {
                    _1596 = _1304;
                }
                int _1598 = _1596;
                bool _1600 = _1412 == 60;
                int _1602 = _1598;
                if (_1570)
                {
                    _1584 = _1312;
                }
                int _1604 = _1584;
                bool _1606 = _1416 == 0;
                int _1608 = _1604;
                if (_1576)
                {
                    _1602 = _1306;
                }
                int _1610 = _1602;
                bool _1612 = _1404 == 68;
                int _1614 = _1610;
                if (_1582)
                {
                    _1608 = _1314;
                }
                int _1616 = _1608;
                bool _1618 = _1416 == 4;
                int _1620 = _1616;
                if (_1588)
                {
                    _1614 = _1308;
                }
                int _1622 = _1614;
                bool _1624 = _1416 == 8;
                int _1626 = _1622;
                if (_1594)
                {
                    _1626 = _1310;
                }
                int _1628 = _1626;
                bool _1630 = _1416 == 12;
                int _1632 = _1628;
                if (_1600)
                {
                    _1632 = _1312;
                }
                int _1634 = _1632;
                bool _1636 = _1416 == 16;
                int _1638 = _1634;
                if (_1606)
                {
                    _1432 = _1282;
                }
                int _1640 = _1432;
                bool _1642 = _1412 == 64;
                int _1644 = _1640;
                if (_1612)
                {
                    _1620 = _1316;
                }
                int _1646 = _1620;
                bool _1648 = _1416 == 20;
                int _1650 = _1646;
                if (_1618)
                {
                    _1644 = _1284;
                }
                int _1652 = _1644;
                bool _1654 = _1404 == 72;
                int _1656 = _1652;
                if (_1624)
                {
                    _1656 = _1286;
                }
                int _1658 = _1656;
                bool _1660 = _1416 == 24;
                int _1662 = _1658;
                if (_1630)
                {
                    _1662 = _1288;
                }
                int _1664 = _1662;
                bool _1666 = _1416 == 28;
                int _1668 = _1664;
                if (_1636)
                {
                    _1668 = _1290;
                }
                int _1670 = _1668;
                bool _1672 = _1416 == 32;
                int _1674 = _1670;
                if (_1642)
                {
                    _1638 = _1314;
                }
                int _1676 = _1638;
                bool _1678 = _1412 == 68;
                int _1680 = _1676;
                if (_1648)
                {
                    _1674 = _1292;
                }
                int _1682 = _1674;
                bool _1684 = _1416 == 36;
                int _1686 = _1682;
                if (_1654)
                {
                    _1650 = _1318;
                }
                int _1688 = _1650;
                bool _1690 = _1404 == 76;
                int _1692 = _1688;
                if (_1660)
                {
                    _1686 = _1294;
                }
                int _1694 = _1686;
                bool _1696 = _1416 == 40;
                int _1698 = _1694;
                if (_1666)
                {
                    _1698 = _1296;
                }
                int _1700 = _1698;
                bool _1702 = _1416 == 44;
                int _1704 = _1700;
                if (_1672)
                {
                    _1704 = _1298;
                }
                int _1706 = _1704;
                bool _1708 = _1416 == 48;
                int _1710 = _1706;
                if (_1678)
                {
                    _1680 = _1316;
                }
                int _1712 = _1680;
                bool _1714 = _1412 == 72;
                int _1716 = _1712;
                if (_1684)
                {
                    _1710 = _1300;
                }
                int _1718 = _1710;
                bool _1720 = _1416 == 52;
                int _1722 = _1718;
                if (_1690)
                {
                    _1692 = _1320;
                }
                int _1724 = _1692;
                bool _1726 = _1404 == 80;
                int _1728 = _1724;
                if (_1696)
                {
                    _1722 = _1302;
                }
                int _1730 = _1722;
                bool _1732 = _1416 == 56;
                int _1734 = _1730;
                if (_1702)
                {
                    _1734 = _1304;
                }
                int _1736 = _1734;
                bool _1738 = _1416 == 60;
                int _1740 = _1736;
                if (_1708)
                {
                    _1740 = _1306;
                }
                int _1742 = _1740;
                bool _1744 = _1412 == 76;
                int _1746 = _1742;
                if (_1714)
                {
                    _1716 = _1318;
                }
                int _1748 = _1716;
                bool _1750 = _1416 == 64;
                int _1752 = _1748;
                if (_1720)
                {
                    _1746 = _1308;
                }
                int _1754 = _1746;
                bool _1756 = _1404 == 84;
                int _1758 = _1754;
                if (_1726)
                {
                    _1728 = _1322;
                }
                int _1760 = _1728;
                bool _1762 = _1416 == 68;
                int _1764 = _1760;
                if (_1732)
                {
                    _1758 = _1310;
                }
                int _1766 = _1758;
                bool _1768 = _1416 == 72;
                int _1770 = _1766;
                if (_1738)
                {
                    _1770 = _1312;
                }
                int _1772 = _1770;
                bool _1774 = _1416 == 76;
                int _1776 = _1772;
                if (_1744)
                {
                    _1752 = _1320;
                }
                int _1778 = _1752;
                bool _1780 = _1412 == 80;
                int _1782 = _1778;
                if (_1750)
                {
                    _1776 = _1314;
                }
                int _1784 = _1776;
                bool _1786 = _1468 == 0;
                int _1788 = _1784;
                if (_1756)
                {
                    _1764 = _1324;
                }
                int _1790 = _1764;
                bool _1792 = _1468 == 4;
                int _1794 = _1790;
                if (_1762)
                {
                    _1788 = _1316;
                }
                int _1796 = _1788;
                bool _1798 = _1416 == 80;
                int _1800 = _1796;
                if (_1768)
                {
                    _1800 = _1318;
                }
                int _1802 = _1800;
                bool _1804 = _1468 == 8;
                int _1806 = _1802;
                if (_1774)
                {
                    _1806 = _1320;
                }
                int _1808 = _1806;
                bool _1810 = _1404 == 88;
                int _1812 = _1808;
                if (_1780)
                {
                    _1782 = _1322;
                }
                int _1814 = _1782;
                bool _1816 = _1412 == 84;
                int _1818 = _1814;
                if (_1786)
                {
                    _1434 = _1282;
                }
                int _1820 = _1434;
                bool _1822 = _1468 == 12;
                int _1824 = _1820;
                if (_1792)
                {
                    _1824 = _1284;
                }
                int _1826 = _1824;
                bool _1828 = _1416 == 84;
                int _1830 = _1826;
                if (_1798)
                {
                    _1812 = _1322;
                }
                int _1832 = _1812;
                bool _1834 = _1468 == 16;
                int _1836 = _1832;
                if (_1804)
                {
                    _1830 = _1286;
                }
                int _1838 = _1830;
                bool _1840 = _1404 == 92;
                int _1842 = _1838;
                if (_1810)
                {
                    _1794 = _1326;
                }
                int _1844 = _1794;
                bool _1846 = _1468 == 20;
                int _1848 = _1844;
                if (_1816)
                {
                    _1818 = _1324;
                }
                int _1850 = _1818;
                bool _1852 = _1468 == 24;
                int _1854 = _1850;
                if (_1822)
                {
                    _1842 = _1288;
                }
                int _1856 = _1842;
                bool _1858 = _1412 == 88;
                int _1860 = _1856;
                if (_1828)
                {
                    _1836 = _1324;
                }
                int _1862 = _1836;
                bool _1864 = _1416 == 88;
                int _1866 = _1862;
                if (_1834)
                {
                    _1860 = _1290;
                }
                int _1868 = _1860;
                bool _1870 = _1468 == 28;
                int _1872 = _1868;
                if (_1840)
                {
                    _1848 = _1328;
                }
                int _1874 = _1848;
                bool _1876 = _1468 == 32;
                int _1878 = _1874;
                if (_1846)
                {
                    _1872 = _1292;
                }
                int _1880 = _1872;
                bool _1882 = _1404 == 96;
                int _1884 = _1880;
                if (_1852)
                {
                    _1884 = _1294;
                }
                int _1886 = _1884;
                bool _1888 = _1468 == 36;
                int _1890 = _1886;
                if (_1858)
                {
                    _1854 = _1326;
                }
                int _1892 = _1854;
                bool _1894 = _1468 == 40;
                int _1896 = _1892;
                if (_1864)
                {
                    _1866 = _1326;
                }
                int _1898 = _1866;
                bool _1900 = _1412 == 92;
                int _1902 = _1898;
                if (_1870)
                {
                    _1890 = _1296;
                }
                int _1904 = _1890;
                bool _1906 = _1468 == 44;
                int _1908 = _1904;
                if (_1876)
                {
                    _1908 = _1298;
                }
                int _1910 = _1908;
                bool _1912 = _1468 == 48;
                int _1914 = _1910;
                if (_1882)
                {
                    _1878 = _1330;
                }
                int _1916 = _1878;
                bool _1918 = _1412 == 96;
                int _1920 = _1916;
                if (_1888)
                {
                    _1914 = _1300;
                }
                int _1922 = _1914;
                bool _1924 = _1468 == 52;
                int _1926 = _1922;
                if (_1894)
                {
                    _1926 = _1302;
                }
                int _1928 = _1926;
                bool _1930 = _1392 >= _1916;
                int _1932 = _1928;
                if (_1900)
                {
                    _1896 = _1328;
                }
                int _1934 = _1896;
                bool _1936 = _1468 == 56;
                int _1938 = _1934;
                if (_1906)
                {
                    _1932 = _1304;
                }
                int _1940 = _1932;
                bool _1942 = _1468 == 60;
                int _1944 = _1940;
                if (_1912)
                {
                    _1944 = _1306;
                }
                int _1946 = _1944;
                bool _1948 = _1468 == 64;
                int _1950 = _1946;
                if (_1918)
                {
                    _1938 = _1330;
                }
                int _1952 = _1938;
                bool _1954 = _1416 == 92;
                _1350 = _1952;
                if (_1924)
                {
                    _1950 = _1308;
                }
                int _1956 = _1950;
                bool _1958 = _1468 == 68;
                int _1960 = _1956;
                if (!_1930)
                {
                    _1436 = _1916;
                }
                int _1962 = _1436;
                int _1964 = _1962;
                if (_1936)
                {
                    _1960 = _1310;
                }
                int _1966 = _1960;
                bool _1968 = _1468 == 72;
                int _1970 = _1966;
                if (_1942)
                {
                    _1970 = _1312;
                }
                int _1972 = _1970;
                bool _1974 = _1962 >= _1952;
                int _1976 = _1972;
                if (_1948)
                {
                    _1976 = _1314;
                }
                int _1978 = _1976;
                bool _1980 = _1416 == 96;
                int _1982 = _1978;
                if (_1954)
                {
                    _1902 = _1328;
                }
                int _1984 = _1902;
                bool _1986 = _1468 == 76;
                int _1988 = _1984;
                if (_1958)
                {
                    _1982 = _1316;
                }
                int _1990 = _1982;
                bool _1992 = _1468 == 80;
                int _1994 = _1990;
                if (_1968)
                {
                    _1994 = _1318;
                }
                int _1996 = _1994;
                bool _1998 = _1468 == 84;
                int _2000 = _1996;
                if (_1974)
                {
                    _1920 = _1962;
                }
                int _2002 = _1920;
                int _2004 = _2002;
                if (_1980)
                {
                    _1988 = _1330;
                }
                int _2006 = _1988;
                bool _2008 = _1468 == 88;
                _1352 = _2006;
                if (!_1974)
                {
                    _2004 = _1952;
                }
                int _2010 = _2004;
                int _2012 = _2010;
                if (_1930)
                {
                    _1964 = _1398;
                }
                int _2014 = _1964;
                int _2016 = _2014;
                if (_1986)
                {
                    _2000 = _1320;
                }
                int _2018 = _2000;
                bool _2020 = _1468 == 92;
                int _2022 = _2018;
                if (_1992)
                {
                    _2022 = _1322;
                }
                int _2024 = _2022;
                bool _2026 = _2010 >= _2006;
                int _2028 = _2024;
                if (_1998)
                {
                    _2028 = _1324;
                }
                int _2030 = _2028;
                bool _2032 = _1468 == 96;
                int _2034 = _2030;
                if (!_1930)
                {
                    _2016 = _1390;
                }
                int _2036 = _2016;
                int _2038 = _1390 + 4;
                _1372 = _2038;
                int _2040 = _2036;
                _1378 = _2038;
                if (_2008)
                {
                    _2034 = _1326;
                }
                int _2042 = _2034;
                int _2044 = _2042;
                if (!_1974)
                {
                    _2040 = _1406;
                }
                int _2046 = _2040;
                bool _2048 = _2038 >= _1386;
                int _2050 = _2046;
                if (_2020)
                {
                    _2044 = _1328;
                }
                int _2052 = _2044;
                int _2054 = _2052;
                if (!_2026)
                {
                    _2012 = _2006;
                }
                int _2056 = _2012;
                _1348 = _2056;
                _1356 = _2056;
                if (_2032)
                {
                    _2054 = _1330;
                }
                int _2058 = _2054;
                _1354 = _2058;
                if (!_2026)
                {
                    _2050 = _1408;
                }
                int _2060 = _2050;
                bool _2062 = _2056 >= _2058;
                int _2064 = _2060;
                if (_2062)
                {
                    _1438 = _2060;
                }
                int _2066 = _1438;
                int _2068 = _2066;
                if (_2062)
                {
                    _2064 = _2056;
                }
                int _2070 = _2064;
                int _2072 = _2070;
                if (!_2062)
                {
                    _2068 = _1426;
                }
                int _2074 = _2068;
                _1376 = _2074;
                _1384 = _2074;
                if (!_2062)
                {
                    _2072 = _2058;
                }
                int _2076 = _2072;
                _1388 = !_2048;
                _1374 = _2076;
                _1380 = _2076;
            } while (_1388);
        }
        int _2078 = _1378;
        int _2080 = _1380;
        int _2082 = _1356;
        int _2084 = _1382;
        int _2086 = _1384;
        int _2088 = -_2078;
        int _2090 = _1334 + _2088;
        bool _2092 = _2090 > 1;
        bool _2094 = !_2092;
        int _2096 = _2082;
        int _2098 = _2090;
        int _2100 = _2080;
        int _2102 = _2086;
        int _2104 = _2078;
        int _2106 = _2084;
        int _2108 = _2080;
        int _2110 = _2086;
        if (!_2094)
        {
            int _2112 = _2078 * 4;
            int _2114 = _2078 + 1;
            bool _2116 = _2112 == 0;
            int _2118 = _2114 * 4;
            bool _2120 = _2112 == 4;
            bool _2122 = _2112 == 8;
            bool _2124 = _2112 == 12;
            bool _2126 = _2112 == 24;
            bool _2128 = _2118 == 0;
            bool _2130 = _2112 == 40;
            if (_2116)
            {
                _2096 = _1282;
            }
            int _2132 = _2096;
            bool _2134 = _2112 == 16;
            int _2136 = _2132;
            if (_2120)
            {
                _2136 = _1284;
            }
            int _2138 = _2136;
            bool _2140 = _2112 == 20;
            int _2142 = _2138;
            if (_2122)
            {
                _2142 = _1286;
            }
            int _2144 = _2142;
            bool _2146 = _2112 == 36;
            int _2148 = _2144;
            if (_2124)
            {
                _2148 = _1288;
            }
            int _2150 = _2148;
            bool _2152 = _2112 == 28;
            int _2154 = _2150;
            if (_2128)
            {
                _2098 = _1282;
            }
            int _2156 = _2098;
            bool _2158 = _2118 == 16;
            int _2160 = _2156;
            if (_2134)
            {
                _2154 = _1290;
            }
            int _2162 = _2154;
            bool _2164 = _2112 == 32;
            int _2166 = _2162;
            if (_2140)
            {
                _2166 = _1292;
            }
            int _2168 = _2166;
            bool _2170 = _2112 == 48;
            int _2172 = _2168;
            if (_2126)
            {
                _2172 = _1294;
            }
            int _2174 = _2172;
            bool _2176 = _2118 == 4;
            int _2178 = _2174;
            if (_2152)
            {
                _2178 = _1296;
            }
            int _2180 = _2178;
            bool _2182 = _2112 == 44;
            int _2184 = _2180;
            if (_2164)
            {
                _2184 = _1298;
            }
            int _2186 = _2184;
            bool _2188 = _2118 == 8;
            int _2190 = _2186;
            if (_2146)
            {
                _2190 = _1300;
            }
            int _2192 = _2190;
            bool _2194 = _2118 == 12;
            int _2196 = _2192;
            if (_2130)
            {
                _2196 = _1302;
            }
            int _2198 = _2196;
            int _2200 = _2198;
            if (_2176)
            {
                _2160 = _1284;
            }
            int _2202 = _2160;
            int _2204 = _2202;
            if (_2182)
            {
                _2200 = _1304;
            }
            int _2206 = _2200;
            bool _2208 = _2112 == 52;
            int _2210 = _2206;
            if (_2170)
            {
                _2210 = _1306;
            }
            int _2212 = _2210;
            bool _2214 = _2118 == 20;
            bool _2216 = _2118 == 24;
            bool _2218 = _2112 == 60;
            int _2220 = _2212;
            if (_2188)
            {
                _2204 = _1286;
            }
            int _2222 = _2204;
            bool _2224 = _2112 == 56;
            int _2226 = _2222;
            if (_2194)
            {
                _2226 = _1288;
            }
            int _2228 = _2226;
            bool _2230 = _2118 == 28;
            int _2232 = _2228;
            if (_2158)
            {
                _2232 = _1290;
            }
            int _2234 = _2232;
            bool _2236 = _2118 == 32;
            int _2238 = _2234;
            if (_2208)
            {
                _2220 = _1308;
            }
            int _2240 = _2220;
            bool _2242 = _2112 == 64;
            int _2244 = _2240;
            if (_2214)
            {
                _2238 = _1292;
            }
            int _2246 = _2238;
            bool _2248 = _2118 == 36;
            int _2250 = _2246;
            if (_2216)
            {
                _2250 = _1294;
            }
            int _2252 = _2250;
            bool _2254 = _2112 == 68;
            int _2256 = _2252;
            if (_2224)
            {
                _2244 = _1310;
            }
            int _2258 = _2244;
            bool _2260 = _2118 == 40;
            int _2262 = _2258;
            if (_2230)
            {
                _2256 = _1296;
            }
            int _2264 = _2256;
            bool _2266 = _2112 == 72;
            int _2268 = _2264;
            if (_2218)
            {
                _2262 = _1312;
            }
            int _2270 = _2262;
            bool _2272 = _2118 == 44;
            int _2274 = _2270;
            if (_2236)
            {
                _2268 = _1298;
            }
            int _2276 = _2268;
            bool _2278 = _2118 == 48;
            int _2280 = _2276;
            if (_2248)
            {
                _2280 = _1300;
            }
            int _2282 = _2280;
            bool _2284 = _2112 == 76;
            int _2286 = _2282;
            if (_2242)
            {
                _2274 = _1314;
            }
            int _2288 = _2274;
            bool _2290 = _2118 == 52;
            int _2292 = _2288;
            if (_2254)
            {
                _2292 = _1316;
            }
            int _2294 = _2292;
            bool _2296 = _2112 == 80;
            int _2298 = _2294;
            if (_2260)
            {
                _2286 = _1302;
            }
            int _2300 = _2286;
            bool _2302 = _2118 == 56;
            int _2304 = _2300;
            if (_2266)
            {
                _2298 = _1318;
            }
            int _2306 = _2298;
            bool _2308 = _2112 == 84;
            int _2310 = _2306;
            if (_2272)
            {
                _2304 = _1304;
            }
            int _2312 = _2304;
            bool _2314 = _2118 == 60;
            int _2316 = _2312;
            if (_2278)
            {
                _2316 = _1306;
            }
            int _2318 = _2316;
            bool _2320 = _2118 == 64;
            int _2322 = _2318;
            if (_2284)
            {
                _2310 = _1320;
            }
            int _2324 = _2310;
            bool _2326 = _2112 == 88;
            int _2328 = _2324;
            if (_2290)
            {
                _2322 = _1308;
            }
            int _2330 = _2322;
            bool _2332 = _2118 == 68;
            int _2334 = _2330;
            if (_2296)
            {
                _2328 = _1322;
            }
            int _2336 = _2328;
            bool _2338 = _2112 == 92;
            int _2340 = _2336;
            if (_2302)
            {
                _2334 = _1310;
            }
            int _2342 = _2334;
            bool _2344 = _2118 == 72;
            int _2346 = _2342;
            if (_2308)
            {
                _2340 = _1324;
            }
            int _2348 = _2340;
            bool _2350 = _2112 == 96;
            int _2352 = _2348;
            if (_2314)
            {
                _2346 = _1312;
            }
            int _2354 = _2346;
            bool _2356 = _2118 == 76;
            int _2358 = _2354;
            if (_2320)
            {
                _2358 = _1314;
            }
            int _2360 = _2358;
            bool _2362 = _2118 == 80;
            int _2364 = _2360;
            if (_2326)
            {
                _2352 = _1326;
            }
            int _2366 = _2352;
            int _2368 = _2366;
            if (_2332)
            {
                _2364 = _1316;
            }
            int _2370 = _2364;
            bool _2372 = _2118 == 84;
            int _2374 = _2370;
            if (_2338)
            {
                _2368 = _1328;
            }
            int _2376 = _2368;
            bool _2378 = _2118 == 96;
            int _2380 = _2376;
            if (_2344)
            {
                _2374 = _1318;
            }
            int _2382 = _2374;
            bool _2384 = _2118 == 88;
            int _2386 = _2382;
            if (_2350)
            {
                _2380 = _1330;
            }
            int _2388 = _2380;
            bool _2390 = _2118 == 92;
            if (_2356)
            {
                _2386 = _1320;
            }
            int _2392 = _2386;
            int _2394 = _2392;
            if (_2362)
            {
                _2394 = _1322;
            }
            int _2396 = _2394;
            bool _2398 = _2080 >= _2388;
            int _2400 = _2396;
            if (_2372)
            {
                _2400 = _1324;
            }
            int _2402 = _2400;
            int _2404 = _2402;
            if (_2384)
            {
                _2404 = _1326;
            }
            int _2406 = _2404;
            int _2408 = _2406;
            if (_2390)
            {
                _2408 = _1328;
            }
            int _2410 = _2408;
            int _2412 = _2410;
            _2106 = 0;
            if (_2378)
            {
                _2412 = _1330;
            }
            int _2414 = _2412;
            if (!_2398)
            {
                _2100 = _2388;
            }
            int _2416 = _2100;
            _2108 = _2416;
            if (!_2398)
            {
                _2102 = _2078;
            }
            int _2418 = _2102;
            int _2420 = _2114 + 1;
            bool _2422 = _2416 >= _2414;
            int _2424 = _2418;
            _2104 = _2420;
            if (!_2422)
            {
                _2424 = _2114;
            }
            int _2426 = _2424;
            _2110 = _2426;
            if (!_2422)
            {
                _2108 = _2414;
            }
        }
        int _2428 = _2104;
        int _2430 = _2106;
        int _2432 = _2108;
        int _2434 = _2110;
        bool _2436 = _2428 < _1334;
        int _2438 = (_2436 ? (-1) : 0) | _2430;
        int _2440 = ~_2438;
        int _2442 = _2434;
        if (!(_2440 != 0))
        {
            int _2444 = _2428 * 4;
            bool _2446 = _2444 == 4;
            bool _2448 = _2444 == 8;
            bool _2450 = _2444 == 12;
            bool _2452 = _2444 == 16;
            if (_2446)
            {
                _1358 = _1284;
            }
            int _2454 = _1358;
            bool _2456 = _2444 == 20;
            int _2458 = _2454;
            if (_2448)
            {
                _2458 = _1286;
            }
            int _2460 = _2458;
            bool _2462 = _2444 == 24;
            int _2464 = _2460;
            if (_2450)
            {
                _2464 = _1288;
            }
            int _2466 = _2464;
            bool _2468 = _2444 == 28;
            int _2470 = _2466;
            if (_2452)
            {
                _2470 = _1290;
            }
            int _2472 = _2470;
            bool _2474 = _2444 == 32;
            int _2476 = _2472;
            if (_2456)
            {
                _2476 = _1292;
            }
            int _2478 = _2476;
            bool _2480 = _2444 == 36;
            int _2482 = _2478;
            if (_2462)
            {
                _2482 = _1294;
            }
            int _2484 = _2482;
            bool _2486 = _2444 == 40;
            int _2488 = _2484;
            if (_2468)
            {
                _2488 = _1296;
            }
            int _2490 = _2488;
            bool _2492 = _2444 == 44;
            int _2494 = _2490;
            if (_2474)
            {
                _2494 = _1298;
            }
            int _2496 = _2494;
            bool _2498 = _2444 == 48;
            int _2500 = _2496;
            if (_2480)
            {
                _2500 = _1300;
            }
            int _2502 = _2500;
            bool _2504 = _2444 == 52;
            int _2506 = _2502;
            if (_2486)
            {
                _2506 = _1302;
            }
            int _2508 = _2506;
            bool _2510 = _2444 == 56;
            int _2512 = _2508;
            if (_2492)
            {
                _2512 = _1304;
            }
            int _2514 = _2512;
            bool _2516 = _2444 == 60;
            int _2518 = _2514;
            if (_2498)
            {
                _2518 = _1306;
            }
            int _2520 = _2518;
            bool _2522 = _2444 == 64;
            int _2524 = _2520;
            if (_2504)
            {
                _2524 = _1308;
            }
            int _2526 = _2524;
            bool _2528 = _2444 == 68;
            int _2530 = _2526;
            if (_2510)
            {
                _2530 = _1310;
            }
            int _2532 = _2530;
            bool _2534 = _2444 == 72;
            int _2536 = _2532;
            if (_2516)
            {
                _2536 = _1312;
            }
            int _2538 = _2536;
            bool _2540 = _2444 == 76;
            int _2542 = _2538;
            if (_2522)
            {
                _2542 = _1314;
            }
            int _2544 = _2542;
            bool _2546 = _2444 == 80;
            int _2548 = _2544;
            if (_2528)
            {
                _2548 = _1316;
            }
            int _2550 = _2548;
            bool _2552 = _2444 == 84;
            int _2554 = _2550;
            if (_2534)
            {
                _2554 = _1318;
            }
            int _2556 = _2554;
            bool _2558 = _2444 == 88;
            int _2560 = _2556;
            if (_2540)
            {
                _2560 = _1320;
            }
            int _2562 = _2560;
            bool _2564 = _2444 == 92;
            int _2566 = _2562;
            if (_2546)
            {
                _2566 = _1322;
            }
            int _2568 = _2566;
            bool _2570 = _2444 == 96;
            int _2572 = _2568;
            if (_2552)
            {
                _2572 = _1324;
            }
            int _2574 = _2572;
            int _2576 = _2574;
            if (_2558)
            {
                _2576 = _1326;
            }
            int _2578 = _2576;
            int _2580 = _2578;
            if (_2564)
            {
                _2580 = _1328;
            }
            int _2582 = _2580;
            int _2584 = _2582;
            if (_2570)
            {
                _2584 = _1330;
            }
            int _2586 = _2584;
            bool _2588 = _2432 >= _2586;
            if (!_2588)
            {
                _2442 = _2428;
            }
        }
        int _2590 = _2442;
        _1366 = _2590;
    }
    int _2592 = _1366;
    int _2594 = _2592 * 8;
    float _2596 = as_type<float>(int(gl_VertexIndex));
    uint _2598 = uint(int(uint(_2594) >> uint(2)));
    float _2600 = as_type<float>(_31[int(_2598)]);
    int _2602 = _2594 + 4;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    float _2606 = as_type<float>(_31[int(_2604)]);
    int _2608 = as_type<int>(_2596) << 5;
    int _2610 = _2608 + 16;
    int _2612 = as_type<int>(_2596) << 5;
    int _2614 = _2612 + 24;
    uint _2616 = uint(int(uint(_2610) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2616)] = as_type<uint>(_2600);
    int _2618 = _2610 + 4;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2620)] = as_type<uint>(_2606);
    uint _2622 = uint(int(uint(_2614) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2622)] = as_type<uint>(_1332);
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


vertex void main0_discard(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _856 = false;
    bool _680 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _55 = -2;
    int _57 = 0;
    int _59 = 0;
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
    float _110 = 1000000.0;
    bool _114;
    bool _257;
    float _642;
    int _644;
    int _646;
    int _648;
    bool _656;
    int _658;
    int _712;
    int _714;
    int _720;
    int _726;
    int _732;
    int _738;
    int _744;
    int _750;
    int _756;
    int _762;
    int _768;
    int _774;
    int _780;
    int _786;
    int _792;
    int _798;
    bool _802;
    int _804;
    int _810;
    int _816;
    int _822;
    int _828;
    int _832;
    int _836;
    int _840;
    int _844;
    int _848;
    int _852;
    int _854;
    int _1214;
    int _1282;
    int _1284;
    int _1286;
    int _1288;
    int _1290;
    int _1292;
    int _1294;
    int _1296;
    int _1298;
    int _1300;
    int _1302;
    int _1304;
    int _1306;
    int _1308;
    int _1310;
    int _1312;
    int _1314;
    int _1316;
    int _1318;
    int _1320;
    int _1322;
    int _1324;
    int _1326;
    int _1328;
    int _1330;
    float _1332;
    int _1334;
    int _1348;
    int _1350;
    int _1352;
    int _1354;
    int _1356;
    int _1358;
    do
    {
        int _116 = _55;
        int _118 = _57;
        int _120 = _59;
        int _122 = _61;
        int _124 = _63;
        int _126 = _65;
        int _128 = _67;
        int _130 = _69;
        int _132 = _71;
        int _134 = _73;
        int _136 = _75;
        int _138 = _77;
        int _140 = _79;
        int _142 = _81;
        int _144 = _83;
        int _146 = _85;
        int _148 = _87;
        int _150 = _89;
        int _152 = _91;
        int _154 = _93;
        int _156 = _95;
        int _158 = _97;
        int _160 = _99;
        int _162 = _101;
        int _164 = _103;
        int _166 = _105;
        int _168 = _107;
        float _170 = _110;
        float _172 = float(_116);
        float _174 = _172 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _176 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _178 = fma(_174, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2695 = float2(_176, _178);
        float4 _181 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2695, float2(0.0), isnan(_2695)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2695, float2(0.0), isnan(_2695)), level(0.0)).xyzw;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float _189 = _181.w;
        int _191 = -2;
        float _193 = _185;
        float _195 = _189;
        float _197 = _187;
        float _199 = _183;
        int _201 = -2;
        int _203 = _118;
        int _205 = _120;
        int _207 = _122;
        int _209 = _124;
        int _211 = _126;
        int _213 = _128;
        int _215 = _130;
        int _217 = _132;
        int _219 = _134;
        int _221 = _136;
        int _223 = _138;
        int _225 = _140;
        int _227 = _142;
        int _229 = _144;
        int _231 = _146;
        int _233 = _148;
        int _235 = _150;
        int _237 = _152;
        int _239 = _154;
        int _241 = _156;
        int _243 = _158;
        int _245 = _160;
        int _247 = _162;
        int _249 = _164;
        int _251 = _166;
        int _253 = _168;
        float _255 = _170;
        do
        {
            int _259 = _191;
            float _261 = _193;
            float _263 = _195;
            float _265 = _197;
            float _267 = _199;
            int _269 = _201;
            int _271 = _203;
            int _273 = _205;
            int _275 = _207;
            int _277 = _209;
            int _279 = _211;
            int _281 = _213;
            int _283 = _215;
            int _285 = _217;
            int _287 = _219;
            int _289 = _221;
            int _291 = _223;
            int _293 = _225;
            int _295 = _227;
            int _297 = _229;
            int _299 = _231;
            int _301 = _233;
            int _303 = _235;
            int _305 = _237;
            int _307 = _239;
            int _309 = _241;
            int _311 = _243;
            int _313 = _245;
            int _315 = _247;
            int _317 = _249;
            int _319 = _251;
            int _321 = _253;
            float _323 = _255;
            int _325 = _259 + 1;
            float _327 = float(_116);
            float _329 = 0.0 + _261;
            float _331 = precise::clamp(_329, 0.0, 1.0);
            float _333 = _327 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _335 = float(_325);
            float _337 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _339 = fma(_333, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _341 = 0.0 + _263;
            float _343 = precise::clamp(_341, 0.0, 1.0);
            float _345 = fma(_335, _337, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _347 = 0.0 + _265;
            float _349 = precise::clamp(_347, 0.0, 1.0);
            float _351 = 0.0 + _267;
            float _353 = precise::clamp(_351, 0.0, 1.0);
            float2 _2817 = float2(_345, _339);
            float4 _355 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2817, float2(0.0), isnan(_2817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2817, float2(0.0), isnan(_2817)), level(0.0)).xyzw;
            float _357 = _355.x;
            float _359 = _355.y;
            float _361 = _355.z;
            float _363 = _355.w;
            float _365 = _343 * 65535.0;
            float _367 = _349 * 65535.0;
            float _369 = _331 * 65535.0;
            float _371 = _353 * 65535.0;
            float _373 = rint(_365);
            int _375 = int(_373);
            float _377 = rint(_367);
            int _379 = int(_377);
            float _381 = rint(_369);
            int _383 = int(_381);
            uint _386 = extract_bits(uint(_375), 0u, 8u);
            int _388 = int(_386) & 255;
            uint _390 = extract_bits(uint(_375), 8u, 8u);
            int _392 = int(_390) & 255;
            int _394 = _392 << 8;
            int _396 = _388 | _394;
            float _398 = rint(_371);
            int _400 = int(_398);
            uint _402 = extract_bits(uint(_396), 0u, 8u);
            int _404 = int(_402) & 255;
            uint _406 = extract_bits(uint(_396), 8u, 8u);
            int _408 = int(_406) & 255;
            int _410 = _408 << 8;
            int _412 = _404 | _410;
            uint _414 = extract_bits(uint(_379), 0u, 8u);
            int _416 = int(_414) & 255;
            int _418 = _416 << 16;
            int _420 = _412 | _418;
            uint _422 = extract_bits(uint(_379), 8u, 8u);
            int _424 = int(_422) & 255;
            int _426 = _424 << 24;
            int _428 = _420 | _426;
            float _430 = float(_269);
            bool _432 = _428 != 0;
            uint _434 = extract_bits(uint(_383), 0u, 8u);
            int _436 = int(_434) & 255;
            uint _438 = extract_bits(uint(_383), 8u, 8u);
            int _440 = int(_438) & 255;
            int _442 = _440 << 8;
            int _444 = _436 | _442;
            float _446 = fma(_430, _337, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _448 = extract_bits(uint(_444), 0u, 8u);
            int _450 = int(_448) & 255;
            uint _452 = extract_bits(uint(_444), 8u, 8u);
            int _454 = int(_452) & 255;
            int _456 = _454 << 8;
            int _458 = _450 | _456;
            uint _460 = extract_bits(uint(_400), 0u, 8u);
            int _462 = int(_460) & 255;
            int _464 = _462 << 16;
            int _466 = _458 | _464;
            uint _468 = extract_bits(uint(_400), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 24;
            int _474 = _466 | _472;
            bool _476 = _474 != 0;
            bool _478 = _476 || _432;
            bool _480 = !_478;
            _191 = _325;
            _193 = _359;
            _195 = _363;
            _197 = _361;
            _199 = _357;
            int _482 = _281;
            int _484 = _273;
            int _486 = _275;
            int _488 = _277;
            int _490 = _279;
            int _492 = _283;
            int _494 = _285;
            int _496 = _295;
            int _498 = _287;
            int _500 = _289;
            int _502 = _291;
            int _504 = _293;
            int _506 = _297;
            int _508 = _299;
            int _510 = _309;
            int _512 = _301;
            int _514 = _303;
            int _516 = _305;
            int _518 = _307;
            int _520 = _311;
            int _522 = _313;
            int _524 = _315;
            int _526 = _317;
            int _528 = _319;
            int _530 = _321;
            int _532 = _428;
            int _534 = _273;
            int _536 = _275;
            int _538 = _277;
            int _540 = _279;
            int _542 = _317;
            int _544 = _319;
            int _546 = _321;
            int _548 = _281;
            int _550 = _283;
            int _552 = _285;
            int _554 = _287;
            int _556 = _289;
            int _558 = _291;
            int _560 = _293;
            int _562 = _295;
            int _564 = _297;
            int _566 = _299;
            int _568 = _301;
            int _570 = _303;
            int _572 = _305;
            int _574 = _307;
            int _576 = _315;
            int _578 = _313;
            int _580 = _311;
            int _582 = _271;
            int _584 = _273;
            int _586 = _275;
            int _588 = _277;
            int _590 = _279;
            int _592 = _281;
            int _594 = _283;
            int _596 = _285;
            int _598 = _287;
            int _600 = _289;
            int _602 = _291;
            int _604 = _293;
            int _606 = _295;
            int _608 = _297;
            int _610 = _299;
            int _612 = _301;
            int _614 = _303;
            int _616 = _305;
            int _618 = _307;
            int _620 = _309;
            int _622 = _311;
            int _624 = _313;
            int _626 = _315;
            int _628 = _317;
            int _630 = _319;
            int _632 = _321;
            int _634 = _474;
            int _636 = _400;
            int _638 = _428;
            int _640 = as_type<int>(_430);
            _642 = _323;
            _644 = _474;
            _646 = _428;
            _648 = as_type<int>(_361);
            if (!_480)
            {
                bool _650 = _271 > 0;
                bool _652 = !_650;
                if (!_652)
                {
                    int _654 = 0;
                    do
                    {
                        _658 = _654;
                        int _660 = _658 * 8;
                        uint _662 = uint(int(uint(_660) >> uint(2)));
                        float _664 = as_type<float>(_31[int(_662)]);
                        int _666 = _660 + 4;
                        uint _668 = uint(int(uint(_666) >> uint(2)));
                        float _670 = as_type<float>(_31[int(_668)]);
                        bool _672 = as_type<int>(_664) != _428;
                        bool _674 = as_type<int>(_670) != _474;
                        bool _676 = _674 || _672;
                        bool _678 = !_676;
                        _680 = _678;
                        if (_680)
                        {
                            break;
                        }
                        int _682 = _658 + 1;
                        bool _684 = _682 >= _271;
                        _656 = !_684;
                        _654 = _682;
                    } while (_656);
                }
                if (!_680)
                {
                    int _686 = _271 * 4;
                    int _688 = _271 * 8;
                    int _690 = _271 + 1;
                    bool _692 = _686 == 16;
                    bool _694 = _686 == 0;
                    uint _696 = uint(int(uint(_688) >> uint(2)));
                    _31[int(_696)] = uint(_428);
                    int _698 = _688 + 4;
                    uint _700 = uint(int(uint(_698) >> uint(2)));
                    _31[int(_700)] = uint(_474);
                    bool _702 = _686 == 4;
                    bool _704 = _686 == 8;
                    bool _706 = _686 == 12;
                    bool _708 = _686 == 20;
                    bool _710 = _686 == 24;
                    _582 = _690;
                    _636 = _688;
                    _640 = _686;
                    _712 = _688;
                    _714 = _686;
                    if (_692)
                    {
                        _482 = 1;
                    }
                    int _716 = _482;
                    bool _718 = _686 == 44;
                    _592 = _716;
                    _720 = _716;
                    if (_694)
                    {
                        _484 = 1;
                    }
                    int _722 = _484;
                    bool _724 = _686 == 28;
                    _584 = _722;
                    _726 = _722;
                    if (_702)
                    {
                        _486 = 1;
                    }
                    int _728 = _486;
                    bool _730 = _686 == 32;
                    _586 = _728;
                    _732 = _728;
                    if (_704)
                    {
                        _488 = 1;
                    }
                    int _734 = _488;
                    bool _736 = _686 == 36;
                    _588 = _734;
                    _738 = _734;
                    if (_706)
                    {
                        _490 = 1;
                    }
                    int _740 = _490;
                    bool _742 = _686 == 40;
                    _590 = _740;
                    _744 = _740;
                    if (_708)
                    {
                        _492 = 1;
                    }
                    int _746 = _492;
                    bool _748 = _686 == 48;
                    _594 = _746;
                    _750 = _746;
                    if (_710)
                    {
                        _494 = 1;
                    }
                    int _752 = _494;
                    bool _754 = _686 == 52;
                    _596 = _752;
                    _756 = _752;
                    if (_718)
                    {
                        _496 = 1;
                    }
                    int _758 = _496;
                    bool _760 = _686 == 72;
                    _606 = _758;
                    _762 = _758;
                    if (_724)
                    {
                        _498 = 1;
                    }
                    int _764 = _498;
                    bool _766 = _686 == 56;
                    _598 = _764;
                    _768 = _764;
                    if (_730)
                    {
                        _500 = 1;
                    }
                    int _770 = _500;
                    bool _772 = _686 == 60;
                    _600 = _770;
                    _774 = _770;
                    if (_736)
                    {
                        _502 = 1;
                    }
                    int _776 = _502;
                    bool _778 = _686 == 64;
                    _602 = _776;
                    _780 = _776;
                    if (_742)
                    {
                        _504 = 1;
                    }
                    int _782 = _504;
                    bool _784 = _686 == 68;
                    _604 = _782;
                    _786 = _782;
                    if (_748)
                    {
                        _506 = 1;
                    }
                    int _788 = _506;
                    bool _790 = _686 == 76;
                    _608 = _788;
                    _792 = _788;
                    if (_754)
                    {
                        _508 = 1;
                    }
                    int _794 = _508;
                    bool _796 = _686 == 80;
                    _610 = _794;
                    _798 = _794;
                    if (_760)
                    {
                        _510 = 1;
                    }
                    int _800 = _510;
                    _802 = _690 != 25;
                    _620 = _800;
                    _804 = _800;
                    if (_766)
                    {
                        _512 = 1;
                    }
                    int _806 = _512;
                    bool _808 = _686 == 84;
                    _612 = _806;
                    _810 = _806;
                    if (_772)
                    {
                        _514 = 1;
                    }
                    int _812 = _514;
                    bool _814 = _686 == 88;
                    _614 = _812;
                    _816 = _812;
                    if (_778)
                    {
                        _516 = 1;
                    }
                    int _818 = _516;
                    bool _820 = _686 == 92;
                    _616 = _818;
                    _822 = _818;
                    if (_784)
                    {
                        _518 = 1;
                    }
                    int _824 = _518;
                    bool _826 = _686 == 96;
                    _618 = _824;
                    _828 = _824;
                    if (_790)
                    {
                        _520 = 1;
                    }
                    int _830 = _520;
                    _622 = _830;
                    _832 = _830;
                    if (_796)
                    {
                        _522 = 1;
                    }
                    int _834 = _522;
                    _624 = _834;
                    _836 = _834;
                    if (_808)
                    {
                        _524 = 1;
                    }
                    int _838 = _524;
                    _626 = _838;
                    _840 = _838;
                    if (_814)
                    {
                        _526 = 1;
                    }
                    int _842 = _526;
                    _628 = _842;
                    _844 = _842;
                    if (_820)
                    {
                        _528 = 1;
                    }
                    int _846 = _528;
                    _630 = _846;
                    _848 = _846;
                    if (_826)
                    {
                        _530 = 1;
                    }
                    int _850 = _530;
                    _632 = _850;
                    _852 = _850;
                }
                if ((!_802) || _680)
                {
                    if (!_680)
                    {
                        _854 = 25;
                        _856 = true;
                        if (_856)
                        {
                            break;
                        }
                    }
                    _680 = false;
                    int _858 = _658 * 4;
                    bool _860 = _858 == 0;
                    bool _862 = _858 == 4;
                    bool _864 = _858 == 8;
                    bool _866 = _858 == 12;
                    bool _868 = _858 == 88;
                    bool _870 = _858 == 92;
                    bool _872 = _858 == 96;
                    if (_860)
                    {
                        _532 = _273;
                    }
                    int _874 = _532;
                    bool _876 = _858 == 16;
                    int _878 = _874;
                    if (_862)
                    {
                        _878 = _275;
                    }
                    int _880 = _878;
                    bool _882 = _858 == 20;
                    int _884 = _880;
                    if (_864)
                    {
                        _884 = _277;
                    }
                    int _886 = _884;
                    bool _888 = _858 == 24;
                    int _890 = _886;
                    if (_866)
                    {
                        _890 = _279;
                    }
                    int _892 = _890;
                    bool _894 = _858 == 84;
                    int _896 = int(_888);
                    int _898 = _882 ? 2 : 0;
                    int _900 = _896 | _898;
                    int _902 = _876 ? 4 : 0;
                    int _904 = _900 | _902;
                    int _906 = _894 ? 8 : 0;
                    int _908 = _904 | _906;
                    int _910 = _868 ? 16 : 0;
                    int _912 = _908 | _910;
                    int _914 = _870 ? 32 : 0;
                    int _916 = _912 | _914;
                    int _918 = _872 ? 64 : 0;
                    int _920 = _916 | _918;
                    int _922 = _920 & 8;
                    int _924 = _892;
                    _634 = _922;
                    if (_876)
                    {
                        _924 = _281;
                    }
                    int _926 = _924;
                    bool _928 = _858 == 80;
                    int _930 = _926;
                    if (_882)
                    {
                        _930 = _283;
                    }
                    int _932 = _930;
                    bool _934 = _858 == 76;
                    int _936 = _932;
                    if (_888)
                    {
                        _936 = _285;
                    }
                    int _938 = _936;
                    bool _940 = _858 == 28;
                    int _942 = int(_940);
                    int _944 = _934 ? 2 : 0;
                    int _946 = _942 | _944;
                    int _948 = _928 ? 4 : 0;
                    int _950 = _946 | _948;
                    int _952 = _894 ? 8 : 0;
                    int _954 = _950 | _952;
                    int _956 = _868 ? 16 : 0;
                    int _958 = _954 | _956;
                    int _960 = _870 ? 32 : 0;
                    int _962 = _958 | _960;
                    int _964 = _872 ? 64 : 0;
                    int _966 = _962 | _964;
                    int _968 = _966 & 2;
                    int _970 = int(_940);
                    int _972 = _934 ? 2 : 0;
                    int _974 = _970 | _972;
                    int _976 = _928 ? 4 : 0;
                    int _978 = _974 | _976;
                    int _980 = _894 ? 8 : 0;
                    int _982 = _978 | _980;
                    int _984 = _868 ? 16 : 0;
                    int _986 = _982 | _984;
                    int _988 = _870 ? 32 : 0;
                    int _990 = _986 | _988;
                    int _992 = _872 ? 64 : 0;
                    int _994 = _990 | _992;
                    int _996 = _994 & 4;
                    int _998 = _938;
                    _636 = _968;
                    _640 = _996;
                    if (_940)
                    {
                        _998 = _287;
                    }
                    int _1000 = _998;
                    bool _1002 = _858 == 32;
                    int _1004 = _1000;
                    if (_1002)
                    {
                        _1004 = _289;
                    }
                    int _1006 = _1004;
                    bool _1008 = _858 == 36;
                    int _1010 = _1006;
                    if (_1008)
                    {
                        _1010 = _291;
                    }
                    int _1012 = _1010;
                    bool _1014 = _858 == 40;
                    int _1016 = _1012;
                    if (_1014)
                    {
                        _1016 = _293;
                    }
                    int _1018 = _1016;
                    bool _1020 = _858 == 44;
                    int _1022 = _1018;
                    if (_1020)
                    {
                        _1022 = _295;
                    }
                    int _1024 = _1022;
                    bool _1026 = _858 == 48;
                    int _1028 = _1024;
                    if (_1026)
                    {
                        _1028 = _297;
                    }
                    int _1030 = _1028;
                    bool _1032 = _858 == 52;
                    int _1034 = _1030;
                    if (_1032)
                    {
                        _1034 = _299;
                    }
                    int _1036 = _1034;
                    bool _1038 = _858 == 56;
                    int _1040 = _1036;
                    if (_1038)
                    {
                        _1040 = _301;
                    }
                    int _1042 = _1040;
                    bool _1044 = _858 == 60;
                    int _1046 = _1042;
                    if (_1044)
                    {
                        _1046 = _303;
                    }
                    int _1048 = _1046;
                    bool _1050 = _858 == 64;
                    int _1052 = _1048;
                    if (_1050)
                    {
                        _1052 = _305;
                    }
                    int _1054 = _1052;
                    bool _1056 = _858 == 68;
                    int _1058 = _1054;
                    if (_1056)
                    {
                        _1058 = _307;
                    }
                    int _1060 = _1058;
                    bool _1062 = _858 == 72;
                    int _1064 = int(_1062);
                    int _1066 = _934 ? 2 : 0;
                    int _1068 = _1064 | _1066;
                    int _1070 = _928 ? 4 : 0;
                    int _1072 = _1068 | _1070;
                    int _1074 = _894 ? 8 : 0;
                    int _1076 = _1072 | _1074;
                    int _1078 = _868 ? 16 : 0;
                    int _1080 = _1076 | _1078;
                    int _1082 = _870 ? 32 : 0;
                    int _1084 = _1080 | _1082;
                    int _1086 = _872 ? 64 : 0;
                    int _1088 = _1084 | _1086;
                    int _1090 = _1088 & 1;
                    int _1092 = _1060;
                    if (_1062)
                    {
                        _1092 = _309;
                    }
                    int _1094 = _1092;
                    bool _1096 = _858 == 4;
                    int _1098 = _1094;
                    if (_934)
                    {
                        _1098 = _311;
                    }
                    int _1100 = _1098;
                    bool _1102 = _858 == 0;
                    int _1104 = _1100;
                    if (_928)
                    {
                        _1104 = _313;
                    }
                    int _1106 = _1104;
                    bool _1108 = _858 == 12;
                    int _1110 = _1106;
                    if (_894)
                    {
                        _1110 = _315;
                    }
                    int _1112 = _1110;
                    bool _1114 = _858 == 8;
                    int _1116 = _1112;
                    if (_868)
                    {
                        _1116 = _317;
                    }
                    int _1118 = _1116;
                    int _1120 = _1118;
                    if (_870)
                    {
                        _1120 = _319;
                    }
                    int _1122 = _1120;
                    int _1124 = _1122;
                    if (_872)
                    {
                        _1124 = _321;
                    }
                    int _1126 = _1124;
                    int _1128 = _1126 + 1;
                    _638 = _1128;
                    if (_1102)
                    {
                        _534 = _1128;
                    }
                    int _1130 = _534;
                    bool _1132 = _858 == 16;
                    _584 = _1130;
                    if (_1096)
                    {
                        _536 = _1128;
                    }
                    int _1134 = _536;
                    bool _1136 = _858 == 20;
                    _586 = _1134;
                    if (_1114)
                    {
                        _538 = _1128;
                    }
                    int _1138 = _538;
                    bool _1140 = _858 == 24;
                    _588 = _1138;
                    if (_1108)
                    {
                        _540 = _1128;
                    }
                    int _1142 = _540;
                    bool _1144 = _858 == 28;
                    _590 = _1142;
                    if (_868)
                    {
                        _542 = _1128;
                    }
                    int _1146 = _542;
                    _628 = _1146;
                    if (_870)
                    {
                        _544 = _1128;
                    }
                    int _1148 = _544;
                    _630 = _1148;
                    if (_872)
                    {
                        _546 = _1128;
                    }
                    int _1150 = _546;
                    _632 = _1150;
                    if (_1132)
                    {
                        _548 = _1128;
                    }
                    int _1152 = _548;
                    bool _1154 = _858 == 32;
                    _592 = _1152;
                    if (_1136)
                    {
                        _550 = _1128;
                    }
                    int _1156 = _550;
                    bool _1158 = _858 == 36;
                    _594 = _1156;
                    if (_1140)
                    {
                        _552 = _1128;
                    }
                    int _1160 = _552;
                    bool _1162 = _858 == 40;
                    _596 = _1160;
                    if (_1144)
                    {
                        _554 = _1128;
                    }
                    int _1164 = _554;
                    bool _1166 = _858 == 44;
                    _598 = _1164;
                    if (_1154)
                    {
                        _556 = _1128;
                    }
                    int _1168 = _556;
                    bool _1170 = _858 == 48;
                    _600 = _1168;
                    if (_1158)
                    {
                        _558 = _1128;
                    }
                    int _1172 = _558;
                    bool _1174 = _858 == 52;
                    _602 = _1172;
                    if (_1162)
                    {
                        _560 = _1128;
                    }
                    int _1176 = _560;
                    bool _1178 = _858 == 56;
                    _604 = _1176;
                    if (_1166)
                    {
                        _562 = _1128;
                    }
                    int _1180 = _562;
                    bool _1182 = _858 == 60;
                    _606 = _1180;
                    if (_1170)
                    {
                        _564 = _1128;
                    }
                    int _1184 = _564;
                    bool _1186 = _858 == 64;
                    _608 = _1184;
                    if (_1174)
                    {
                        _566 = _1128;
                    }
                    int _1188 = _566;
                    bool _1190 = _858 == 68;
                    _610 = _1188;
                    if (_1178)
                    {
                        _568 = _1128;
                    }
                    int _1192 = _568;
                    bool _1194 = _922 != 0;
                    _612 = _1192;
                    if (_1182)
                    {
                        _570 = _1128;
                    }
                    int _1196 = _570;
                    bool _1198 = _996 != 0;
                    _614 = _1196;
                    if (_1186)
                    {
                        _572 = _1128;
                    }
                    int _1200 = _572;
                    bool _1202 = _968 != 0;
                    _616 = _1200;
                    if (_1190)
                    {
                        _574 = _1128;
                    }
                    int _1204 = _574;
                    bool _1206 = _1090 != 0;
                    _618 = _1204;
                    if (_1194)
                    {
                        _576 = _1128;
                    }
                    int _1208 = _576;
                    _626 = _1208;
                    if (_1198)
                    {
                        _578 = _1128;
                    }
                    int _1210 = _578;
                    _624 = _1210;
                    if (_1202)
                    {
                        _580 = _1128;
                    }
                    int _1212 = _580;
                    _622 = _1212;
                    if (_1206)
                    {
                        _620 = _1128;
                    }
                }
            }
            _1214 = _582;
            int _1216 = _584;
            int _1218 = _586;
            int _1220 = _588;
            int _1222 = _590;
            int _1224 = _592;
            int _1226 = _594;
            int _1228 = _596;
            int _1230 = _598;
            int _1232 = _600;
            int _1234 = _602;
            int _1236 = _604;
            int _1238 = _606;
            int _1240 = _608;
            int _1242 = _610;
            int _1244 = _612;
            int _1246 = _614;
            int _1248 = _616;
            int _1250 = _618;
            int _1252 = _620;
            int _1254 = _622;
            int _1256 = _624;
            int _1258 = _626;
            int _1260 = _628;
            int _1262 = _630;
            int _1264 = _632;
            int _1266 = _634;
            int _1268 = _636;
            int _1270 = _638;
            int _1272 = _640;
            float2 _3981 = float2(_446, _339);
            float _1274 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_3981, float2(0.0), isnan(_3981)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_3981, float2(0.0), isnan(_3981)), level(0.0)).x;
            int _1276 = _269 + 1;
            bool _1278 = _1276 >= 3;
            float _1280 = precise::min(_1274, _323);
            _257 = !_1278;
            _201 = _1276;
            _203 = _1214;
            _205 = _1216;
            _207 = _1218;
            _209 = _1220;
            _211 = _1222;
            _213 = _1224;
            _215 = _1226;
            _217 = _1228;
            _219 = _1230;
            _221 = _1232;
            _223 = _1234;
            _225 = _1236;
            _227 = _1238;
            _229 = _1240;
            _231 = _1242;
            _233 = _1244;
            _235 = _1246;
            _237 = _1248;
            _239 = _1250;
            _241 = _1252;
            _243 = _1254;
            _245 = _1256;
            _247 = _1258;
            _249 = _1260;
            _251 = _1262;
            _253 = _1264;
            _255 = _1280;
            _726 = _1216;
            _732 = _1218;
            _738 = _1220;
            _744 = _1222;
            _720 = _1224;
            _750 = _1226;
            _756 = _1228;
            _768 = _1230;
            _774 = _1232;
            _780 = _1234;
            _786 = _1236;
            _762 = _1238;
            _792 = _1240;
            _798 = _1242;
            _810 = _1244;
            _816 = _1246;
            _822 = _1248;
            _828 = _1250;
            _804 = _1252;
            _832 = _1254;
            _836 = _1256;
            _840 = _1258;
            _844 = _1260;
            _848 = _1262;
            _852 = _1264;
            _642 = _1280;
            _644 = _1266;
            _712 = _1268;
            _646 = _1270;
            _714 = _1272;
        } while (_257);
        if (!_856)
        {
            _854 = _1214;
        }
        _856 = false;
        _1282 = _726;
        _1284 = _732;
        _1286 = _738;
        _1288 = _744;
        _1290 = _720;
        _1292 = _750;
        _1294 = _756;
        _1296 = _768;
        _1298 = _774;
        _1300 = _780;
        _1302 = _786;
        _1304 = _762;
        _1306 = _792;
        _1308 = _798;
        _1310 = _810;
        _1312 = _816;
        _1314 = _822;
        _1316 = _828;
        _1318 = _804;
        _1320 = _832;
        _1322 = _836;
        _1324 = _840;
        _1326 = _844;
        _1328 = _848;
        _1330 = _852;
        _1332 = _642;
        _1334 = _854;
        int _1336 = _644;
        int _1338 = _712;
        int _1340 = _646;
        int _1342 = _714;
        int _1344 = _116 + 1;
        bool _1346 = _1344 >= 3;
        _114 = !_1346;
        _55 = _1344;
        _57 = _1334;
        _59 = _1282;
        _61 = _1284;
        _63 = _1286;
        _65 = _1288;
        _67 = _1290;
        _69 = _1292;
        _71 = _1294;
        _73 = _1296;
        _75 = _1298;
        _77 = _1300;
        _79 = _1302;
        _81 = _1304;
        _83 = _1306;
        _85 = _1308;
        _87 = _1310;
        _89 = _1312;
        _91 = _1314;
        _93 = _1316;
        _95 = _1318;
        _97 = _1320;
        _99 = _1322;
        _101 = _1324;
        _103 = _1326;
        _105 = _1328;
        _107 = _1330;
        _110 = _1332;
        _1348 = _1336;
        _1350 = _1338;
        _1352 = _1340;
        _1354 = _1342;
        _1356 = _1336;
        _1358 = _1282;
    } while (_114);
    bool _1360 = _1334 > 0;
    if (!_1360)
    {
        _648 = 0;
    }
    int _1362 = _648;
    bool _1364 = !_1360;
    int _1366 = _1362;
    if (!_1364)
    {
        bool _1368 = _1334 > 3;
        bool _1370 = !_1368;
        int _1372 = 0;
        int _1374 = 0;
        int _1376 = 0;
        int _1378 = 0;
        int _1380 = 0;
        int _1382 = -1;
        int _1384 = 0;
        if (!_1370)
        {
            int _1386 = _1334 + (-3);
            _1382 = 0;
            bool _1388;
            do
            {
                int _1390 = _1372;
                int _1392 = _1374;
                int _1394 = _1348;
                int _1396 = _1350;
                int _1398 = _1376;
                int _1400 = _1352;
                int _1402 = _1354;
                int _1404 = _1390 * 4;
                int _1406 = _1390 + 1;
                int _1408 = _1390 + 2;
                bool _1410 = _1404 == 0;
                int _1412 = _1406 * 4;
                bool _1414 = _1404 == 4;
                int _1416 = _1408 * 4;
                bool _1418 = _1404 == 8;
                bool _1420 = _1404 == 12;
                bool _1422 = _1404 == 16;
                bool _1424 = _1412 == 8;
                int _1426 = _1390 + 3;
                int _1428 = _1394;
                int _1430 = _1396;
                int _1432 = _1400;
                int _1434 = _1402;
                int _1436 = _1392;
                int _1438 = _1398;
                if (_1410)
                {
                    _1428 = _1282;
                }
                int _1440 = _1428;
                bool _1442 = _1404 == 24;
                int _1444 = _1440;
                if (_1414)
                {
                    _1444 = _1284;
                }
                int _1446 = _1444;
                bool _1448 = _1404 == 20;
                int _1450 = _1446;
                if (_1418)
                {
                    _1450 = _1286;
                }
                int _1452 = _1450;
                bool _1454 = _1404 == 32;
                int _1456 = _1452;
                if (_1420)
                {
                    _1456 = _1288;
                }
                int _1458 = _1456;
                bool _1460 = _1404 == 28;
                int _1462 = _1458;
                if (_1422)
                {
                    _1462 = _1290;
                }
                int _1464 = _1462;
                bool _1466 = _1404 == 40;
                int _1468 = _1426 * 4;
                int _1470 = _1464;
                if (_1448)
                {
                    _1470 = _1292;
                }
                int _1472 = _1470;
                bool _1474 = _1404 == 36;
                int _1476 = _1472;
                if (_1442)
                {
                    _1476 = _1294;
                }
                int _1478 = _1476;
                bool _1480 = _1412 == 0;
                int _1482 = _1478;
                if (_1460)
                {
                    _1482 = _1296;
                }
                int _1484 = _1482;
                bool _1486 = _1412 == 4;
                int _1488 = _1484;
                if (_1454)
                {
                    _1488 = _1298;
                }
                int _1490 = _1488;
                bool _1492 = _1412 == 12;
                int _1494 = _1490;
                if (_1474)
                {
                    _1494 = _1300;
                }
                int _1496 = _1494;
                bool _1498 = _1404 == 44;
                int _1500 = _1496;
                if (_1466)
                {
                    _1500 = _1302;
                }
                int _1502 = _1500;
                bool _1504 = _1412 == 16;
                int _1506 = _1502;
                if (_1480)
                {
                    _1430 = _1282;
                }
                int _1508 = _1430;
                bool _1510 = _1404 == 48;
                int _1512 = _1508;
                if (_1486)
                {
                    _1512 = _1284;
                }
                int _1514 = _1512;
                bool _1516 = _1412 == 20;
                int _1518 = _1514;
                if (_1424)
                {
                    _1518 = _1286;
                }
                int _1520 = _1518;
                bool _1522 = _1412 == 24;
                int _1524 = _1520;
                if (_1492)
                {
                    _1524 = _1288;
                }
                int _1526 = _1524;
                bool _1528 = _1412 == 28;
                int _1530 = _1526;
                if (_1498)
                {
                    _1506 = _1304;
                }
                int _1532 = _1506;
                bool _1534 = _1404 == 52;
                int _1536 = _1532;
                if (_1504)
                {
                    _1530 = _1290;
                }
                int _1538 = _1530;
                bool _1540 = _1412 == 32;
                int _1542 = _1538;
                if (_1510)
                {
                    _1536 = _1306;
                }
                int _1544 = _1536;
                bool _1546 = _1404 == 56;
                int _1548 = _1544;
                if (_1516)
                {
                    _1542 = _1292;
                }
                int _1550 = _1542;
                bool _1552 = _1412 == 36;
                int _1554 = _1550;
                if (_1522)
                {
                    _1554 = _1294;
                }
                int _1556 = _1554;
                bool _1558 = _1412 == 40;
                int _1560 = _1556;
                if (_1528)
                {
                    _1560 = _1296;
                }
                int _1562 = _1560;
                bool _1564 = _1412 == 44;
                int _1566 = _1562;
                if (_1534)
                {
                    _1548 = _1308;
                }
                int _1568 = _1548;
                bool _1570 = _1404 == 60;
                int _1572 = _1568;
                if (_1540)
                {
                    _1566 = _1298;
                }
                int _1574 = _1566;
                bool _1576 = _1412 == 48;
                int _1578 = _1574;
                if (_1546)
                {
                    _1572 = _1310;
                }
                int _1580 = _1572;
                bool _1582 = _1404 == 64;
                int _1584 = _1580;
                if (_1552)
                {
                    _1578 = _1300;
                }
                int _1586 = _1578;
                bool _1588 = _1412 == 52;
                int _1590 = _1586;
                if (_1558)
                {
                    _1590 = _1302;
                }
                int _1592 = _1590;
                bool _1594 = _1412 == 56;
                int _1596 = _1592;
                if (_1564)
                {
                    _1596 = _1304;
                }
                int _1598 = _1596;
                bool _1600 = _1412 == 60;
                int _1602 = _1598;
                if (_1570)
                {
                    _1584 = _1312;
                }
                int _1604 = _1584;
                bool _1606 = _1416 == 0;
                int _1608 = _1604;
                if (_1576)
                {
                    _1602 = _1306;
                }
                int _1610 = _1602;
                bool _1612 = _1404 == 68;
                int _1614 = _1610;
                if (_1582)
                {
                    _1608 = _1314;
                }
                int _1616 = _1608;
                bool _1618 = _1416 == 4;
                int _1620 = _1616;
                if (_1588)
                {
                    _1614 = _1308;
                }
                int _1622 = _1614;
                bool _1624 = _1416 == 8;
                int _1626 = _1622;
                if (_1594)
                {
                    _1626 = _1310;
                }
                int _1628 = _1626;
                bool _1630 = _1416 == 12;
                int _1632 = _1628;
                if (_1600)
                {
                    _1632 = _1312;
                }
                int _1634 = _1632;
                bool _1636 = _1416 == 16;
                int _1638 = _1634;
                if (_1606)
                {
                    _1432 = _1282;
                }
                int _1640 = _1432;
                bool _1642 = _1412 == 64;
                int _1644 = _1640;
                if (_1612)
                {
                    _1620 = _1316;
                }
                int _1646 = _1620;
                bool _1648 = _1416 == 20;
                int _1650 = _1646;
                if (_1618)
                {
                    _1644 = _1284;
                }
                int _1652 = _1644;
                bool _1654 = _1404 == 72;
                int _1656 = _1652;
                if (_1624)
                {
                    _1656 = _1286;
                }
                int _1658 = _1656;
                bool _1660 = _1416 == 24;
                int _1662 = _1658;
                if (_1630)
                {
                    _1662 = _1288;
                }
                int _1664 = _1662;
                bool _1666 = _1416 == 28;
                int _1668 = _1664;
                if (_1636)
                {
                    _1668 = _1290;
                }
                int _1670 = _1668;
                bool _1672 = _1416 == 32;
                int _1674 = _1670;
                if (_1642)
                {
                    _1638 = _1314;
                }
                int _1676 = _1638;
                bool _1678 = _1412 == 68;
                int _1680 = _1676;
                if (_1648)
                {
                    _1674 = _1292;
                }
                int _1682 = _1674;
                bool _1684 = _1416 == 36;
                int _1686 = _1682;
                if (_1654)
                {
                    _1650 = _1318;
                }
                int _1688 = _1650;
                bool _1690 = _1404 == 76;
                int _1692 = _1688;
                if (_1660)
                {
                    _1686 = _1294;
                }
                int _1694 = _1686;
                bool _1696 = _1416 == 40;
                int _1698 = _1694;
                if (_1666)
                {
                    _1698 = _1296;
                }
                int _1700 = _1698;
                bool _1702 = _1416 == 44;
                int _1704 = _1700;
                if (_1672)
                {
                    _1704 = _1298;
                }
                int _1706 = _1704;
                bool _1708 = _1416 == 48;
                int _1710 = _1706;
                if (_1678)
                {
                    _1680 = _1316;
                }
                int _1712 = _1680;
                bool _1714 = _1412 == 72;
                int _1716 = _1712;
                if (_1684)
                {
                    _1710 = _1300;
                }
                int _1718 = _1710;
                bool _1720 = _1416 == 52;
                int _1722 = _1718;
                if (_1690)
                {
                    _1692 = _1320;
                }
                int _1724 = _1692;
                bool _1726 = _1404 == 80;
                int _1728 = _1724;
                if (_1696)
                {
                    _1722 = _1302;
                }
                int _1730 = _1722;
                bool _1732 = _1416 == 56;
                int _1734 = _1730;
                if (_1702)
                {
                    _1734 = _1304;
                }
                int _1736 = _1734;
                bool _1738 = _1416 == 60;
                int _1740 = _1736;
                if (_1708)
                {
                    _1740 = _1306;
                }
                int _1742 = _1740;
                bool _1744 = _1412 == 76;
                int _1746 = _1742;
                if (_1714)
                {
                    _1716 = _1318;
                }
                int _1748 = _1716;
                bool _1750 = _1416 == 64;
                int _1752 = _1748;
                if (_1720)
                {
                    _1746 = _1308;
                }
                int _1754 = _1746;
                bool _1756 = _1404 == 84;
                int _1758 = _1754;
                if (_1726)
                {
                    _1728 = _1322;
                }
                int _1760 = _1728;
                bool _1762 = _1416 == 68;
                int _1764 = _1760;
                if (_1732)
                {
                    _1758 = _1310;
                }
                int _1766 = _1758;
                bool _1768 = _1416 == 72;
                int _1770 = _1766;
                if (_1738)
                {
                    _1770 = _1312;
                }
                int _1772 = _1770;
                bool _1774 = _1416 == 76;
                int _1776 = _1772;
                if (_1744)
                {
                    _1752 = _1320;
                }
                int _1778 = _1752;
                bool _1780 = _1412 == 80;
                int _1782 = _1778;
                if (_1750)
                {
                    _1776 = _1314;
                }
                int _1784 = _1776;
                bool _1786 = _1468 == 0;
                int _1788 = _1784;
                if (_1756)
                {
                    _1764 = _1324;
                }
                int _1790 = _1764;
                bool _1792 = _1468 == 4;
                int _1794 = _1790;
                if (_1762)
                {
                    _1788 = _1316;
                }
                int _1796 = _1788;
                bool _1798 = _1416 == 80;
                int _1800 = _1796;
                if (_1768)
                {
                    _1800 = _1318;
                }
                int _1802 = _1800;
                bool _1804 = _1468 == 8;
                int _1806 = _1802;
                if (_1774)
                {
                    _1806 = _1320;
                }
                int _1808 = _1806;
                bool _1810 = _1404 == 88;
                int _1812 = _1808;
                if (_1780)
                {
                    _1782 = _1322;
                }
                int _1814 = _1782;
                bool _1816 = _1412 == 84;
                int _1818 = _1814;
                if (_1786)
                {
                    _1434 = _1282;
                }
                int _1820 = _1434;
                bool _1822 = _1468 == 12;
                int _1824 = _1820;
                if (_1792)
                {
                    _1824 = _1284;
                }
                int _1826 = _1824;
                bool _1828 = _1416 == 84;
                int _1830 = _1826;
                if (_1798)
                {
                    _1812 = _1322;
                }
                int _1832 = _1812;
                bool _1834 = _1468 == 16;
                int _1836 = _1832;
                if (_1804)
                {
                    _1830 = _1286;
                }
                int _1838 = _1830;
                bool _1840 = _1404 == 92;
                int _1842 = _1838;
                if (_1810)
                {
                    _1794 = _1326;
                }
                int _1844 = _1794;
                bool _1846 = _1468 == 20;
                int _1848 = _1844;
                if (_1816)
                {
                    _1818 = _1324;
                }
                int _1850 = _1818;
                bool _1852 = _1468 == 24;
                int _1854 = _1850;
                if (_1822)
                {
                    _1842 = _1288;
                }
                int _1856 = _1842;
                bool _1858 = _1412 == 88;
                int _1860 = _1856;
                if (_1828)
                {
                    _1836 = _1324;
                }
                int _1862 = _1836;
                bool _1864 = _1416 == 88;
                int _1866 = _1862;
                if (_1834)
                {
                    _1860 = _1290;
                }
                int _1868 = _1860;
                bool _1870 = _1468 == 28;
                int _1872 = _1868;
                if (_1840)
                {
                    _1848 = _1328;
                }
                int _1874 = _1848;
                bool _1876 = _1468 == 32;
                int _1878 = _1874;
                if (_1846)
                {
                    _1872 = _1292;
                }
                int _1880 = _1872;
                bool _1882 = _1404 == 96;
                int _1884 = _1880;
                if (_1852)
                {
                    _1884 = _1294;
                }
                int _1886 = _1884;
                bool _1888 = _1468 == 36;
                int _1890 = _1886;
                if (_1858)
                {
                    _1854 = _1326;
                }
                int _1892 = _1854;
                bool _1894 = _1468 == 40;
                int _1896 = _1892;
                if (_1864)
                {
                    _1866 = _1326;
                }
                int _1898 = _1866;
                bool _1900 = _1412 == 92;
                int _1902 = _1898;
                if (_1870)
                {
                    _1890 = _1296;
                }
                int _1904 = _1890;
                bool _1906 = _1468 == 44;
                int _1908 = _1904;
                if (_1876)
                {
                    _1908 = _1298;
                }
                int _1910 = _1908;
                bool _1912 = _1468 == 48;
                int _1914 = _1910;
                if (_1882)
                {
                    _1878 = _1330;
                }
                int _1916 = _1878;
                bool _1918 = _1412 == 96;
                int _1920 = _1916;
                if (_1888)
                {
                    _1914 = _1300;
                }
                int _1922 = _1914;
                bool _1924 = _1468 == 52;
                int _1926 = _1922;
                if (_1894)
                {
                    _1926 = _1302;
                }
                int _1928 = _1926;
                bool _1930 = _1392 >= _1916;
                int _1932 = _1928;
                if (_1900)
                {
                    _1896 = _1328;
                }
                int _1934 = _1896;
                bool _1936 = _1468 == 56;
                int _1938 = _1934;
                if (_1906)
                {
                    _1932 = _1304;
                }
                int _1940 = _1932;
                bool _1942 = _1468 == 60;
                int _1944 = _1940;
                if (_1912)
                {
                    _1944 = _1306;
                }
                int _1946 = _1944;
                bool _1948 = _1468 == 64;
                int _1950 = _1946;
                if (_1918)
                {
                    _1938 = _1330;
                }
                int _1952 = _1938;
                bool _1954 = _1416 == 92;
                _1350 = _1952;
                if (_1924)
                {
                    _1950 = _1308;
                }
                int _1956 = _1950;
                bool _1958 = _1468 == 68;
                int _1960 = _1956;
                if (!_1930)
                {
                    _1436 = _1916;
                }
                int _1962 = _1436;
                int _1964 = _1962;
                if (_1936)
                {
                    _1960 = _1310;
                }
                int _1966 = _1960;
                bool _1968 = _1468 == 72;
                int _1970 = _1966;
                if (_1942)
                {
                    _1970 = _1312;
                }
                int _1972 = _1970;
                bool _1974 = _1962 >= _1952;
                int _1976 = _1972;
                if (_1948)
                {
                    _1976 = _1314;
                }
                int _1978 = _1976;
                bool _1980 = _1416 == 96;
                int _1982 = _1978;
                if (_1954)
                {
                    _1902 = _1328;
                }
                int _1984 = _1902;
                bool _1986 = _1468 == 76;
                int _1988 = _1984;
                if (_1958)
                {
                    _1982 = _1316;
                }
                int _1990 = _1982;
                bool _1992 = _1468 == 80;
                int _1994 = _1990;
                if (_1968)
                {
                    _1994 = _1318;
                }
                int _1996 = _1994;
                bool _1998 = _1468 == 84;
                int _2000 = _1996;
                if (_1974)
                {
                    _1920 = _1962;
                }
                int _2002 = _1920;
                int _2004 = _2002;
                if (_1980)
                {
                    _1988 = _1330;
                }
                int _2006 = _1988;
                bool _2008 = _1468 == 88;
                _1352 = _2006;
                if (!_1974)
                {
                    _2004 = _1952;
                }
                int _2010 = _2004;
                int _2012 = _2010;
                if (_1930)
                {
                    _1964 = _1398;
                }
                int _2014 = _1964;
                int _2016 = _2014;
                if (_1986)
                {
                    _2000 = _1320;
                }
                int _2018 = _2000;
                bool _2020 = _1468 == 92;
                int _2022 = _2018;
                if (_1992)
                {
                    _2022 = _1322;
                }
                int _2024 = _2022;
                bool _2026 = _2010 >= _2006;
                int _2028 = _2024;
                if (_1998)
                {
                    _2028 = _1324;
                }
                int _2030 = _2028;
                bool _2032 = _1468 == 96;
                int _2034 = _2030;
                if (!_1930)
                {
                    _2016 = _1390;
                }
                int _2036 = _2016;
                int _2038 = _1390 + 4;
                _1372 = _2038;
                int _2040 = _2036;
                _1378 = _2038;
                if (_2008)
                {
                    _2034 = _1326;
                }
                int _2042 = _2034;
                int _2044 = _2042;
                if (!_1974)
                {
                    _2040 = _1406;
                }
                int _2046 = _2040;
                bool _2048 = _2038 >= _1386;
                int _2050 = _2046;
                if (_2020)
                {
                    _2044 = _1328;
                }
                int _2052 = _2044;
                int _2054 = _2052;
                if (!_2026)
                {
                    _2012 = _2006;
                }
                int _2056 = _2012;
                _1348 = _2056;
                _1356 = _2056;
                if (_2032)
                {
                    _2054 = _1330;
                }
                int _2058 = _2054;
                _1354 = _2058;
                if (!_2026)
                {
                    _2050 = _1408;
                }
                int _2060 = _2050;
                bool _2062 = _2056 >= _2058;
                int _2064 = _2060;
                if (_2062)
                {
                    _1438 = _2060;
                }
                int _2066 = _1438;
                int _2068 = _2066;
                if (_2062)
                {
                    _2064 = _2056;
                }
                int _2070 = _2064;
                int _2072 = _2070;
                if (!_2062)
                {
                    _2068 = _1426;
                }
                int _2074 = _2068;
                _1376 = _2074;
                _1384 = _2074;
                if (!_2062)
                {
                    _2072 = _2058;
                }
                int _2076 = _2072;
                _1388 = !_2048;
                _1374 = _2076;
                _1380 = _2076;
            } while (_1388);
        }
        int _2078 = _1378;
        int _2080 = _1380;
        int _2082 = _1356;
        int _2084 = _1382;
        int _2086 = _1384;
        int _2088 = -_2078;
        int _2090 = _1334 + _2088;
        bool _2092 = _2090 > 1;
        bool _2094 = !_2092;
        int _2096 = _2082;
        int _2098 = _2090;
        int _2100 = _2080;
        int _2102 = _2086;
        int _2104 = _2078;
        int _2106 = _2084;
        int _2108 = _2080;
        int _2110 = _2086;
        if (!_2094)
        {
            int _2112 = _2078 * 4;
            int _2114 = _2078 + 1;
            bool _2116 = _2112 == 0;
            int _2118 = _2114 * 4;
            bool _2120 = _2112 == 4;
            bool _2122 = _2112 == 8;
            bool _2124 = _2112 == 12;
            bool _2126 = _2112 == 24;
            bool _2128 = _2118 == 0;
            bool _2130 = _2112 == 40;
            if (_2116)
            {
                _2096 = _1282;
            }
            int _2132 = _2096;
            bool _2134 = _2112 == 16;
            int _2136 = _2132;
            if (_2120)
            {
                _2136 = _1284;
            }
            int _2138 = _2136;
            bool _2140 = _2112 == 20;
            int _2142 = _2138;
            if (_2122)
            {
                _2142 = _1286;
            }
            int _2144 = _2142;
            bool _2146 = _2112 == 36;
            int _2148 = _2144;
            if (_2124)
            {
                _2148 = _1288;
            }
            int _2150 = _2148;
            bool _2152 = _2112 == 28;
            int _2154 = _2150;
            if (_2128)
            {
                _2098 = _1282;
            }
            int _2156 = _2098;
            bool _2158 = _2118 == 16;
            int _2160 = _2156;
            if (_2134)
            {
                _2154 = _1290;
            }
            int _2162 = _2154;
            bool _2164 = _2112 == 32;
            int _2166 = _2162;
            if (_2140)
            {
                _2166 = _1292;
            }
            int _2168 = _2166;
            bool _2170 = _2112 == 48;
            int _2172 = _2168;
            if (_2126)
            {
                _2172 = _1294;
            }
            int _2174 = _2172;
            bool _2176 = _2118 == 4;
            int _2178 = _2174;
            if (_2152)
            {
                _2178 = _1296;
            }
            int _2180 = _2178;
            bool _2182 = _2112 == 44;
            int _2184 = _2180;
            if (_2164)
            {
                _2184 = _1298;
            }
            int _2186 = _2184;
            bool _2188 = _2118 == 8;
            int _2190 = _2186;
            if (_2146)
            {
                _2190 = _1300;
            }
            int _2192 = _2190;
            bool _2194 = _2118 == 12;
            int _2196 = _2192;
            if (_2130)
            {
                _2196 = _1302;
            }
            int _2198 = _2196;
            int _2200 = _2198;
            if (_2176)
            {
                _2160 = _1284;
            }
            int _2202 = _2160;
            int _2204 = _2202;
            if (_2182)
            {
                _2200 = _1304;
            }
            int _2206 = _2200;
            bool _2208 = _2112 == 52;
            int _2210 = _2206;
            if (_2170)
            {
                _2210 = _1306;
            }
            int _2212 = _2210;
            bool _2214 = _2118 == 20;
            bool _2216 = _2118 == 24;
            bool _2218 = _2112 == 60;
            int _2220 = _2212;
            if (_2188)
            {
                _2204 = _1286;
            }
            int _2222 = _2204;
            bool _2224 = _2112 == 56;
            int _2226 = _2222;
            if (_2194)
            {
                _2226 = _1288;
            }
            int _2228 = _2226;
            bool _2230 = _2118 == 28;
            int _2232 = _2228;
            if (_2158)
            {
                _2232 = _1290;
            }
            int _2234 = _2232;
            bool _2236 = _2118 == 32;
            int _2238 = _2234;
            if (_2208)
            {
                _2220 = _1308;
            }
            int _2240 = _2220;
            bool _2242 = _2112 == 64;
            int _2244 = _2240;
            if (_2214)
            {
                _2238 = _1292;
            }
            int _2246 = _2238;
            bool _2248 = _2118 == 36;
            int _2250 = _2246;
            if (_2216)
            {
                _2250 = _1294;
            }
            int _2252 = _2250;
            bool _2254 = _2112 == 68;
            int _2256 = _2252;
            if (_2224)
            {
                _2244 = _1310;
            }
            int _2258 = _2244;
            bool _2260 = _2118 == 40;
            int _2262 = _2258;
            if (_2230)
            {
                _2256 = _1296;
            }
            int _2264 = _2256;
            bool _2266 = _2112 == 72;
            int _2268 = _2264;
            if (_2218)
            {
                _2262 = _1312;
            }
            int _2270 = _2262;
            bool _2272 = _2118 == 44;
            int _2274 = _2270;
            if (_2236)
            {
                _2268 = _1298;
            }
            int _2276 = _2268;
            bool _2278 = _2118 == 48;
            int _2280 = _2276;
            if (_2248)
            {
                _2280 = _1300;
            }
            int _2282 = _2280;
            bool _2284 = _2112 == 76;
            int _2286 = _2282;
            if (_2242)
            {
                _2274 = _1314;
            }
            int _2288 = _2274;
            bool _2290 = _2118 == 52;
            int _2292 = _2288;
            if (_2254)
            {
                _2292 = _1316;
            }
            int _2294 = _2292;
            bool _2296 = _2112 == 80;
            int _2298 = _2294;
            if (_2260)
            {
                _2286 = _1302;
            }
            int _2300 = _2286;
            bool _2302 = _2118 == 56;
            int _2304 = _2300;
            if (_2266)
            {
                _2298 = _1318;
            }
            int _2306 = _2298;
            bool _2308 = _2112 == 84;
            int _2310 = _2306;
            if (_2272)
            {
                _2304 = _1304;
            }
            int _2312 = _2304;
            bool _2314 = _2118 == 60;
            int _2316 = _2312;
            if (_2278)
            {
                _2316 = _1306;
            }
            int _2318 = _2316;
            bool _2320 = _2118 == 64;
            int _2322 = _2318;
            if (_2284)
            {
                _2310 = _1320;
            }
            int _2324 = _2310;
            bool _2326 = _2112 == 88;
            int _2328 = _2324;
            if (_2290)
            {
                _2322 = _1308;
            }
            int _2330 = _2322;
            bool _2332 = _2118 == 68;
            int _2334 = _2330;
            if (_2296)
            {
                _2328 = _1322;
            }
            int _2336 = _2328;
            bool _2338 = _2112 == 92;
            int _2340 = _2336;
            if (_2302)
            {
                _2334 = _1310;
            }
            int _2342 = _2334;
            bool _2344 = _2118 == 72;
            int _2346 = _2342;
            if (_2308)
            {
                _2340 = _1324;
            }
            int _2348 = _2340;
            bool _2350 = _2112 == 96;
            int _2352 = _2348;
            if (_2314)
            {
                _2346 = _1312;
            }
            int _2354 = _2346;
            bool _2356 = _2118 == 76;
            int _2358 = _2354;
            if (_2320)
            {
                _2358 = _1314;
            }
            int _2360 = _2358;
            bool _2362 = _2118 == 80;
            int _2364 = _2360;
            if (_2326)
            {
                _2352 = _1326;
            }
            int _2366 = _2352;
            int _2368 = _2366;
            if (_2332)
            {
                _2364 = _1316;
            }
            int _2370 = _2364;
            bool _2372 = _2118 == 84;
            int _2374 = _2370;
            if (_2338)
            {
                _2368 = _1328;
            }
            int _2376 = _2368;
            bool _2378 = _2118 == 96;
            int _2380 = _2376;
            if (_2344)
            {
                _2374 = _1318;
            }
            int _2382 = _2374;
            bool _2384 = _2118 == 88;
            int _2386 = _2382;
            if (_2350)
            {
                _2380 = _1330;
            }
            int _2388 = _2380;
            bool _2390 = _2118 == 92;
            if (_2356)
            {
                _2386 = _1320;
            }
            int _2392 = _2386;
            int _2394 = _2392;
            if (_2362)
            {
                _2394 = _1322;
            }
            int _2396 = _2394;
            bool _2398 = _2080 >= _2388;
            int _2400 = _2396;
            if (_2372)
            {
                _2400 = _1324;
            }
            int _2402 = _2400;
            int _2404 = _2402;
            if (_2384)
            {
                _2404 = _1326;
            }
            int _2406 = _2404;
            int _2408 = _2406;
            if (_2390)
            {
                _2408 = _1328;
            }
            int _2410 = _2408;
            int _2412 = _2410;
            _2106 = 0;
            if (_2378)
            {
                _2412 = _1330;
            }
            int _2414 = _2412;
            if (!_2398)
            {
                _2100 = _2388;
            }
            int _2416 = _2100;
            _2108 = _2416;
            if (!_2398)
            {
                _2102 = _2078;
            }
            int _2418 = _2102;
            int _2420 = _2114 + 1;
            bool _2422 = _2416 >= _2414;
            int _2424 = _2418;
            _2104 = _2420;
            if (!_2422)
            {
                _2424 = _2114;
            }
            int _2426 = _2424;
            _2110 = _2426;
            if (!_2422)
            {
                _2108 = _2414;
            }
        }
        int _2428 = _2104;
        int _2430 = _2106;
        int _2432 = _2108;
        int _2434 = _2110;
        bool _2436 = _2428 < _1334;
        int _2438 = (_2436 ? (-1) : 0) | _2430;
        int _2440 = ~_2438;
        int _2442 = _2434;
        if (!(_2440 != 0))
        {
            int _2444 = _2428 * 4;
            bool _2446 = _2444 == 4;
            bool _2448 = _2444 == 8;
            bool _2450 = _2444 == 12;
            bool _2452 = _2444 == 16;
            if (_2446)
            {
                _1358 = _1284;
            }
            int _2454 = _1358;
            bool _2456 = _2444 == 20;
            int _2458 = _2454;
            if (_2448)
            {
                _2458 = _1286;
            }
            int _2460 = _2458;
            bool _2462 = _2444 == 24;
            int _2464 = _2460;
            if (_2450)
            {
                _2464 = _1288;
            }
            int _2466 = _2464;
            bool _2468 = _2444 == 28;
            int _2470 = _2466;
            if (_2452)
            {
                _2470 = _1290;
            }
            int _2472 = _2470;
            bool _2474 = _2444 == 32;
            int _2476 = _2472;
            if (_2456)
            {
                _2476 = _1292;
            }
            int _2478 = _2476;
            bool _2480 = _2444 == 36;
            int _2482 = _2478;
            if (_2462)
            {
                _2482 = _1294;
            }
            int _2484 = _2482;
            bool _2486 = _2444 == 40;
            int _2488 = _2484;
            if (_2468)
            {
                _2488 = _1296;
            }
            int _2490 = _2488;
            bool _2492 = _2444 == 44;
            int _2494 = _2490;
            if (_2474)
            {
                _2494 = _1298;
            }
            int _2496 = _2494;
            bool _2498 = _2444 == 48;
            int _2500 = _2496;
            if (_2480)
            {
                _2500 = _1300;
            }
            int _2502 = _2500;
            bool _2504 = _2444 == 52;
            int _2506 = _2502;
            if (_2486)
            {
                _2506 = _1302;
            }
            int _2508 = _2506;
            bool _2510 = _2444 == 56;
            int _2512 = _2508;
            if (_2492)
            {
                _2512 = _1304;
            }
            int _2514 = _2512;
            bool _2516 = _2444 == 60;
            int _2518 = _2514;
            if (_2498)
            {
                _2518 = _1306;
            }
            int _2520 = _2518;
            bool _2522 = _2444 == 64;
            int _2524 = _2520;
            if (_2504)
            {
                _2524 = _1308;
            }
            int _2526 = _2524;
            bool _2528 = _2444 == 68;
            int _2530 = _2526;
            if (_2510)
            {
                _2530 = _1310;
            }
            int _2532 = _2530;
            bool _2534 = _2444 == 72;
            int _2536 = _2532;
            if (_2516)
            {
                _2536 = _1312;
            }
            int _2538 = _2536;
            bool _2540 = _2444 == 76;
            int _2542 = _2538;
            if (_2522)
            {
                _2542 = _1314;
            }
            int _2544 = _2542;
            bool _2546 = _2444 == 80;
            int _2548 = _2544;
            if (_2528)
            {
                _2548 = _1316;
            }
            int _2550 = _2548;
            bool _2552 = _2444 == 84;
            int _2554 = _2550;
            if (_2534)
            {
                _2554 = _1318;
            }
            int _2556 = _2554;
            bool _2558 = _2444 == 88;
            int _2560 = _2556;
            if (_2540)
            {
                _2560 = _1320;
            }
            int _2562 = _2560;
            bool _2564 = _2444 == 92;
            int _2566 = _2562;
            if (_2546)
            {
                _2566 = _1322;
            }
            int _2568 = _2566;
            bool _2570 = _2444 == 96;
            int _2572 = _2568;
            if (_2552)
            {
                _2572 = _1324;
            }
            int _2574 = _2572;
            int _2576 = _2574;
            if (_2558)
            {
                _2576 = _1326;
            }
            int _2578 = _2576;
            int _2580 = _2578;
            if (_2564)
            {
                _2580 = _1328;
            }
            int _2582 = _2580;
            int _2584 = _2582;
            if (_2570)
            {
                _2584 = _1330;
            }
            int _2586 = _2584;
            bool _2588 = _2432 >= _2586;
            if (!_2588)
            {
                _2442 = _2428;
            }
        }
        int _2590 = _2442;
        _1366 = _2590;
    }
    int _2592 = _1366;
    int _2594 = _2592 * 8;
    float _2596 = as_type<float>(int(gl_VertexIndex));
    uint _2598 = uint(int(uint(_2594) >> uint(2)));
    float _2600 = as_type<float>(_31[int(_2598)]);
    int _2602 = _2594 + 4;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    float _2606 = as_type<float>(_31[int(_2604)]);
    int _2608 = as_type<int>(_2596) << 5;
    int _2610 = _2608 + 16;
    int _2612 = as_type<int>(_2596) << 5;
    int _2614 = _2612 + 24;
    uint _2616 = uint(int(uint(_2610) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2616)] = as_type<uint>(_2600);
    int _2618 = _2610 + 4;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2620)] = as_type<uint>(_2606);
    uint _2622 = uint(int(uint(_2614) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2622)] = as_type<uint>(_1332);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return;
}

