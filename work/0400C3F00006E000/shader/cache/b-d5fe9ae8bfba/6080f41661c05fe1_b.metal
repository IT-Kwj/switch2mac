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
    bool _870 = false;
    bool _694 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _2641 = float2((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    float4 _55 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2641, float2(0.0), isnan(_2641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2641, float2(0.0), isnan(_2641)), level(0.0)).xyzw;
    float _58 = _55.x;
    float _60 = _55.y;
    float _62 = _55.z;
    float _64 = _55.w;
    float _66 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _69 = as_type<int>(_66) * 32;
    uint _72 = uint(int(uint(_69) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_72)] = as_type<uint>(_58);
    int _74 = _69 + 4;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_76)] = as_type<uint>(_60);
    int _78 = _69 + 8;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_80)] = as_type<uint>(_62);
    int _82 = _69 + 12;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_84)] = as_type<uint>(_64);
    int _86 = -2;
    int _88 = 0;
    int _90 = 0;
    int _92 = 0;
    int _94 = 0;
    int _96 = 0;
    int _98 = 0;
    int _100 = 0;
    int _102 = 0;
    int _104 = 0;
    int _106 = 0;
    int _108 = 0;
    int _110 = 0;
    int _112 = 0;
    int _114 = 0;
    int _116 = 0;
    int _118 = 0;
    int _120 = 0;
    int _122 = 0;
    int _124 = 0;
    int _126 = 0;
    int _128 = 0;
    int _130 = 0;
    int _132 = 0;
    int _134 = 0;
    int _136 = 0;
    int _138 = 0;
    bool _142;
    bool _280;
    int _658;
    int _660;
    int _662;
    bool _670;
    int _672;
    int _726;
    int _728;
    int _734;
    int _740;
    int _746;
    int _752;
    int _758;
    int _764;
    int _770;
    int _776;
    int _782;
    int _788;
    int _794;
    int _800;
    int _806;
    int _812;
    bool _816;
    int _818;
    int _822;
    int _828;
    int _834;
    int _840;
    int _846;
    int _850;
    int _854;
    int _858;
    int _862;
    int _866;
    int _868;
    int _1228;
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
    int _1332;
    int _1334;
    int _1336;
    int _1338;
    int _1340;
    int _1342;
    int _1356;
    int _1358;
    int _1360;
    int _1362;
    int _1364;
    int _1366;
    do
    {
        int _144 = _86;
        int _146 = _88;
        int _148 = _90;
        int _150 = _92;
        int _152 = _94;
        int _154 = _96;
        int _156 = _98;
        int _158 = _100;
        int _160 = _102;
        int _162 = _104;
        int _164 = _106;
        int _166 = _108;
        int _168 = _110;
        int _170 = _112;
        int _172 = _114;
        int _174 = _116;
        int _176 = _118;
        int _178 = _120;
        int _180 = _122;
        int _182 = _124;
        int _184 = _126;
        int _186 = _128;
        int _188 = _130;
        int _190 = _132;
        int _192 = _134;
        int _194 = _136;
        int _196 = _138;
        float _198 = float(_144);
        float _200 = _198 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _202 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _204 = fma(_200, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2759 = float2(_202, _204);
        float4 _206 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2759, float2(0.0), isnan(_2759)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2759, float2(0.0), isnan(_2759)), level(0.0)).xyzw;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = _206.z;
        float _214 = _206.w;
        int _216 = -2;
        float _218 = _214;
        float _220 = _210;
        float _222 = _212;
        float _224 = _208;
        int _226 = _146;
        int _228 = _148;
        int _230 = _150;
        int _232 = _152;
        int _234 = _154;
        int _236 = _156;
        int _238 = _158;
        int _240 = _160;
        int _242 = _162;
        int _244 = _164;
        int _246 = _166;
        int _248 = _168;
        int _250 = _170;
        int _252 = _172;
        int _254 = _174;
        int _256 = _176;
        int _258 = _178;
        int _260 = _180;
        int _262 = _182;
        int _264 = _184;
        int _266 = _186;
        int _268 = _188;
        int _270 = _190;
        int _272 = _192;
        int _274 = _194;
        int _276 = _196;
        int _278 = -2;
        do
        {
            int _282 = _216;
            float _284 = _218;
            float _286 = _220;
            float _288 = _222;
            float _290 = _224;
            int _292 = _226;
            int _294 = _228;
            int _296 = _230;
            int _298 = _232;
            int _300 = _234;
            int _302 = _236;
            int _304 = _238;
            int _306 = _240;
            int _308 = _242;
            int _310 = _244;
            int _312 = _246;
            int _314 = _248;
            int _316 = _250;
            int _318 = _252;
            int _320 = _254;
            int _322 = _256;
            int _324 = _258;
            int _326 = _260;
            int _328 = _262;
            int _330 = _264;
            int _332 = _266;
            int _334 = _268;
            int _336 = _270;
            int _338 = _272;
            int _340 = _274;
            int _342 = _276;
            int _344 = _278;
            int _346 = _282 + 1;
            float _348 = float(_144);
            float _350 = float(_346);
            float _352 = _348 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _354 = _350 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _356 = 0.0 + _284;
            float _358 = precise::clamp(_356, 0.0, 1.0);
            float _360 = fma(_352, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _362 = 0.0 + _286;
            float _364 = precise::clamp(_362, 0.0, 1.0);
            float _366 = fma(_354, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _368 = 0.0 + _288;
            float _370 = precise::clamp(_368, 0.0, 1.0);
            float _372 = 0.0 + _290;
            float _374 = precise::clamp(_372, 0.0, 1.0);
            float2 _2877 = float2(_366, _360);
            float4 _376 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2877, float2(0.0), isnan(_2877)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2877, float2(0.0), isnan(_2877)), level(0.0)).xyzw;
            float _378 = _376.x;
            float _380 = _376.y;
            float _382 = _376.z;
            float _384 = _376.w;
            float _386 = _358 * 65535.0;
            float _388 = _370 * 65535.0;
            float _390 = _364 * 65535.0;
            float _392 = _374 * 65535.0;
            float _394 = rint(_386);
            int _396 = int(_394);
            float _398 = rint(_388);
            int _400 = int(_398);
            float _402 = rint(_390);
            int _404 = int(_402);
            uint _406 = extract_bits(uint(_396), 0u, 8u);
            int _408 = int(_406) & 255;
            uint _410 = extract_bits(uint(_396), 8u, 8u);
            int _412 = int(_410) & 255;
            int _414 = _412 << 8;
            int _416 = _408 | _414;
            float _418 = rint(_392);
            int _420 = int(_418);
            uint _422 = extract_bits(uint(_416), 0u, 8u);
            int _424 = int(_422) & 255;
            uint _426 = extract_bits(uint(_416), 8u, 8u);
            int _428 = int(_426) & 255;
            int _430 = _428 << 8;
            int _432 = _424 | _430;
            uint _434 = extract_bits(uint(_400), 0u, 8u);
            int _436 = int(_434) & 255;
            int _438 = _436 << 16;
            int _440 = _432 | _438;
            uint _442 = extract_bits(uint(_400), 8u, 8u);
            int _444 = int(_442) & 255;
            int _446 = _444 << 24;
            int _448 = _440 | _446;
            bool _450 = _448 != 0;
            uint _452 = extract_bits(uint(_404), 0u, 8u);
            int _454 = int(_452) & 255;
            uint _456 = extract_bits(uint(_404), 8u, 8u);
            int _458 = int(_456) & 255;
            int _460 = _458 << 8;
            int _462 = _454 | _460;
            uint _464 = extract_bits(uint(_462), 0u, 8u);
            int _466 = int(_464) & 255;
            uint _468 = extract_bits(uint(_462), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 8;
            int _474 = _466 | _472;
            uint _476 = extract_bits(uint(_420), 0u, 8u);
            int _478 = int(_476) & 255;
            int _480 = _478 << 16;
            int _482 = _474 | _480;
            uint _484 = extract_bits(uint(_420), 8u, 8u);
            int _486 = int(_484) & 255;
            int _488 = _486 << 24;
            int _490 = _482 | _488;
            bool _492 = _490 != 0;
            bool _494 = _492 || _450;
            bool _496 = !_494;
            _216 = _346;
            _218 = _384;
            _220 = _380;
            _222 = _382;
            _224 = _378;
            int _498 = _302;
            int _500 = _294;
            int _502 = _296;
            int _504 = _298;
            int _506 = _300;
            int _508 = _304;
            int _510 = _306;
            int _512 = _316;
            int _514 = _308;
            int _516 = _310;
            int _518 = _312;
            int _520 = _314;
            int _522 = _318;
            int _524 = _320;
            int _526 = _330;
            int _528 = _322;
            int _530 = _324;
            int _532 = _326;
            int _534 = _328;
            int _536 = _332;
            int _538 = _334;
            int _540 = _336;
            int _542 = _338;
            int _544 = _340;
            int _546 = _342;
            int _548 = _448;
            int _550 = _294;
            int _552 = _296;
            int _554 = _298;
            int _556 = _300;
            int _558 = _338;
            int _560 = _340;
            int _562 = _342;
            int _564 = _302;
            int _566 = _304;
            int _568 = _306;
            int _570 = _308;
            int _572 = _310;
            int _574 = _312;
            int _576 = _314;
            int _578 = _316;
            int _580 = _318;
            int _582 = _320;
            int _584 = _322;
            int _586 = _324;
            int _588 = _326;
            int _590 = _328;
            int _592 = _336;
            int _594 = _334;
            int _596 = _332;
            int _598 = _292;
            int _600 = _294;
            int _602 = _296;
            int _604 = _298;
            int _606 = _300;
            int _608 = _302;
            int _610 = _304;
            int _612 = _306;
            int _614 = _308;
            int _616 = _310;
            int _618 = _312;
            int _620 = _314;
            int _622 = _316;
            int _624 = _318;
            int _626 = _320;
            int _628 = _322;
            int _630 = _324;
            int _632 = _326;
            int _634 = _328;
            int _636 = _330;
            int _638 = _332;
            int _640 = _334;
            int _642 = _336;
            int _644 = _338;
            int _646 = _340;
            int _648 = _342;
            int _650 = _490;
            int _652 = _420;
            int _654 = _448;
            int _656 = _416;
            _658 = _490;
            _660 = _448;
            _662 = as_type<int>(_382);
            if (!_496)
            {
                bool _664 = _292 > 0;
                bool _666 = !_664;
                if (!_666)
                {
                    int _668 = 0;
                    do
                    {
                        _672 = _668;
                        int _674 = _672 * 8;
                        uint _676 = uint(int(uint(_674) >> uint(2)));
                        float _678 = as_type<float>(_31[int(_676)]);
                        int _680 = _674 + 4;
                        uint _682 = uint(int(uint(_680) >> uint(2)));
                        float _684 = as_type<float>(_31[int(_682)]);
                        bool _686 = as_type<int>(_678) != _448;
                        bool _688 = as_type<int>(_684) != _490;
                        bool _690 = _688 || _686;
                        bool _692 = !_690;
                        _694 = _692;
                        if (_694)
                        {
                            break;
                        }
                        int _696 = _672 + 1;
                        bool _698 = _696 >= _292;
                        _670 = !_698;
                        _668 = _696;
                    } while (_670);
                }
                if (!_694)
                {
                    int _700 = _292 * 4;
                    int _702 = _292 * 8;
                    int _704 = _292 + 1;
                    bool _706 = _700 == 16;
                    bool _708 = _700 == 0;
                    uint _710 = uint(int(uint(_702) >> uint(2)));
                    _31[int(_710)] = uint(_448);
                    int _712 = _702 + 4;
                    uint _714 = uint(int(uint(_712) >> uint(2)));
                    _31[int(_714)] = uint(_490);
                    bool _716 = _700 == 4;
                    bool _718 = _700 == 8;
                    bool _720 = _700 == 12;
                    bool _722 = _700 == 20;
                    bool _724 = _700 == 24;
                    _598 = _704;
                    _652 = _702;
                    _656 = _700;
                    _726 = _702;
                    _728 = _700;
                    if (_706)
                    {
                        _498 = 1;
                    }
                    int _730 = _498;
                    bool _732 = _700 == 44;
                    _608 = _730;
                    _734 = _730;
                    if (_708)
                    {
                        _500 = 1;
                    }
                    int _736 = _500;
                    bool _738 = _700 == 28;
                    _600 = _736;
                    _740 = _736;
                    if (_716)
                    {
                        _502 = 1;
                    }
                    int _742 = _502;
                    bool _744 = _700 == 32;
                    _602 = _742;
                    _746 = _742;
                    if (_718)
                    {
                        _504 = 1;
                    }
                    int _748 = _504;
                    bool _750 = _700 == 36;
                    _604 = _748;
                    _752 = _748;
                    if (_720)
                    {
                        _506 = 1;
                    }
                    int _754 = _506;
                    bool _756 = _700 == 40;
                    _606 = _754;
                    _758 = _754;
                    if (_722)
                    {
                        _508 = 1;
                    }
                    int _760 = _508;
                    bool _762 = _700 == 48;
                    _610 = _760;
                    _764 = _760;
                    if (_724)
                    {
                        _510 = 1;
                    }
                    int _766 = _510;
                    bool _768 = _700 == 52;
                    _612 = _766;
                    _770 = _766;
                    if (_732)
                    {
                        _512 = 1;
                    }
                    int _772 = _512;
                    bool _774 = _700 == 72;
                    _622 = _772;
                    _776 = _772;
                    if (_738)
                    {
                        _514 = 1;
                    }
                    int _778 = _514;
                    bool _780 = _700 == 56;
                    _614 = _778;
                    _782 = _778;
                    if (_744)
                    {
                        _516 = 1;
                    }
                    int _784 = _516;
                    bool _786 = _700 == 60;
                    _616 = _784;
                    _788 = _784;
                    if (_750)
                    {
                        _518 = 1;
                    }
                    int _790 = _518;
                    bool _792 = _700 == 64;
                    _618 = _790;
                    _794 = _790;
                    if (_756)
                    {
                        _520 = 1;
                    }
                    int _796 = _520;
                    bool _798 = _700 == 68;
                    _620 = _796;
                    _800 = _796;
                    if (_762)
                    {
                        _522 = 1;
                    }
                    int _802 = _522;
                    bool _804 = _700 == 76;
                    _624 = _802;
                    _806 = _802;
                    if (_768)
                    {
                        _524 = 1;
                    }
                    int _808 = _524;
                    bool _810 = _700 == 80;
                    _626 = _808;
                    _812 = _808;
                    if (_774)
                    {
                        _526 = 1;
                    }
                    int _814 = _526;
                    _816 = _704 != 25;
                    _636 = _814;
                    _818 = _814;
                    if (_780)
                    {
                        _528 = 1;
                    }
                    int _820 = _528;
                    _628 = _820;
                    _822 = _820;
                    if (_786)
                    {
                        _530 = 1;
                    }
                    int _824 = _530;
                    bool _826 = _700 == 84;
                    _630 = _824;
                    _828 = _824;
                    if (_792)
                    {
                        _532 = 1;
                    }
                    int _830 = _532;
                    bool _832 = _700 == 88;
                    _632 = _830;
                    _834 = _830;
                    if (_798)
                    {
                        _534 = 1;
                    }
                    int _836 = _534;
                    bool _838 = _700 == 92;
                    _634 = _836;
                    _840 = _836;
                    if (_804)
                    {
                        _536 = 1;
                    }
                    int _842 = _536;
                    bool _844 = _700 == 96;
                    _638 = _842;
                    _846 = _842;
                    if (_810)
                    {
                        _538 = 1;
                    }
                    int _848 = _538;
                    _640 = _848;
                    _850 = _848;
                    if (_826)
                    {
                        _540 = 1;
                    }
                    int _852 = _540;
                    _642 = _852;
                    _854 = _852;
                    if (_832)
                    {
                        _542 = 1;
                    }
                    int _856 = _542;
                    _644 = _856;
                    _858 = _856;
                    if (_838)
                    {
                        _544 = 1;
                    }
                    int _860 = _544;
                    _646 = _860;
                    _862 = _860;
                    if (_844)
                    {
                        _546 = 1;
                    }
                    int _864 = _546;
                    _648 = _864;
                    _866 = _864;
                }
                if ((!_816) || _694)
                {
                    if (!_694)
                    {
                        _868 = 25;
                        _870 = true;
                        if (_870)
                        {
                            break;
                        }
                    }
                    _694 = false;
                    int _872 = _672 * 4;
                    bool _874 = _872 == 0;
                    bool _876 = _872 == 4;
                    bool _878 = _872 == 8;
                    bool _880 = _872 == 12;
                    bool _882 = _872 == 88;
                    bool _884 = _872 == 92;
                    bool _886 = _872 == 96;
                    if (_874)
                    {
                        _548 = _294;
                    }
                    int _888 = _548;
                    bool _890 = _872 == 16;
                    int _892 = _888;
                    if (_876)
                    {
                        _892 = _296;
                    }
                    int _894 = _892;
                    bool _896 = _872 == 20;
                    int _898 = _894;
                    if (_878)
                    {
                        _898 = _298;
                    }
                    int _900 = _898;
                    bool _902 = _872 == 24;
                    int _904 = _900;
                    if (_880)
                    {
                        _904 = _300;
                    }
                    int _906 = _904;
                    bool _908 = _872 == 84;
                    int _910 = int(_902);
                    int _912 = _896 ? 2 : 0;
                    int _914 = _910 | _912;
                    int _916 = _890 ? 4 : 0;
                    int _918 = _914 | _916;
                    int _920 = _908 ? 8 : 0;
                    int _922 = _918 | _920;
                    int _924 = _882 ? 16 : 0;
                    int _926 = _922 | _924;
                    int _928 = _884 ? 32 : 0;
                    int _930 = _926 | _928;
                    int _932 = _886 ? 64 : 0;
                    int _934 = _930 | _932;
                    int _936 = _934 & 8;
                    int _938 = _906;
                    _650 = _936;
                    if (_890)
                    {
                        _938 = _302;
                    }
                    int _940 = _938;
                    bool _942 = _872 == 80;
                    int _944 = _940;
                    if (_896)
                    {
                        _944 = _304;
                    }
                    int _946 = _944;
                    bool _948 = _872 == 76;
                    int _950 = _946;
                    if (_902)
                    {
                        _950 = _306;
                    }
                    int _952 = _950;
                    bool _954 = _872 == 28;
                    int _956 = int(_954);
                    int _958 = _948 ? 2 : 0;
                    int _960 = _956 | _958;
                    int _962 = _942 ? 4 : 0;
                    int _964 = _960 | _962;
                    int _966 = _908 ? 8 : 0;
                    int _968 = _964 | _966;
                    int _970 = _882 ? 16 : 0;
                    int _972 = _968 | _970;
                    int _974 = _884 ? 32 : 0;
                    int _976 = _972 | _974;
                    int _978 = _886 ? 64 : 0;
                    int _980 = _976 | _978;
                    int _982 = _980 & 2;
                    int _984 = int(_954);
                    int _986 = _948 ? 2 : 0;
                    int _988 = _984 | _986;
                    int _990 = _942 ? 4 : 0;
                    int _992 = _988 | _990;
                    int _994 = _908 ? 8 : 0;
                    int _996 = _992 | _994;
                    int _998 = _882 ? 16 : 0;
                    int _1000 = _996 | _998;
                    int _1002 = _884 ? 32 : 0;
                    int _1004 = _1000 | _1002;
                    int _1006 = _886 ? 64 : 0;
                    int _1008 = _1004 | _1006;
                    int _1010 = _1008 & 4;
                    int _1012 = _952;
                    _652 = _982;
                    _656 = _1010;
                    if (_954)
                    {
                        _1012 = _308;
                    }
                    int _1014 = _1012;
                    bool _1016 = _872 == 32;
                    int _1018 = _1014;
                    if (_1016)
                    {
                        _1018 = _310;
                    }
                    int _1020 = _1018;
                    bool _1022 = _872 == 36;
                    int _1024 = _1020;
                    if (_1022)
                    {
                        _1024 = _312;
                    }
                    int _1026 = _1024;
                    bool _1028 = _872 == 40;
                    int _1030 = _1026;
                    if (_1028)
                    {
                        _1030 = _314;
                    }
                    int _1032 = _1030;
                    bool _1034 = _872 == 44;
                    int _1036 = _1032;
                    if (_1034)
                    {
                        _1036 = _316;
                    }
                    int _1038 = _1036;
                    bool _1040 = _872 == 48;
                    int _1042 = _1038;
                    if (_1040)
                    {
                        _1042 = _318;
                    }
                    int _1044 = _1042;
                    bool _1046 = _872 == 52;
                    int _1048 = _1044;
                    if (_1046)
                    {
                        _1048 = _320;
                    }
                    int _1050 = _1048;
                    bool _1052 = _872 == 56;
                    int _1054 = _1050;
                    if (_1052)
                    {
                        _1054 = _322;
                    }
                    int _1056 = _1054;
                    bool _1058 = _872 == 60;
                    int _1060 = _1056;
                    if (_1058)
                    {
                        _1060 = _324;
                    }
                    int _1062 = _1060;
                    bool _1064 = _872 == 64;
                    int _1066 = _1062;
                    if (_1064)
                    {
                        _1066 = _326;
                    }
                    int _1068 = _1066;
                    bool _1070 = _872 == 68;
                    int _1072 = _1068;
                    if (_1070)
                    {
                        _1072 = _328;
                    }
                    int _1074 = _1072;
                    bool _1076 = _872 == 72;
                    int _1078 = int(_1076);
                    int _1080 = _948 ? 2 : 0;
                    int _1082 = _1078 | _1080;
                    int _1084 = _942 ? 4 : 0;
                    int _1086 = _1082 | _1084;
                    int _1088 = _908 ? 8 : 0;
                    int _1090 = _1086 | _1088;
                    int _1092 = _882 ? 16 : 0;
                    int _1094 = _1090 | _1092;
                    int _1096 = _884 ? 32 : 0;
                    int _1098 = _1094 | _1096;
                    int _1100 = _886 ? 64 : 0;
                    int _1102 = _1098 | _1100;
                    int _1104 = _1102 & 1;
                    int _1106 = _1074;
                    if (_1076)
                    {
                        _1106 = _330;
                    }
                    int _1108 = _1106;
                    bool _1110 = _872 == 4;
                    int _1112 = _1108;
                    if (_948)
                    {
                        _1112 = _332;
                    }
                    int _1114 = _1112;
                    bool _1116 = _872 == 0;
                    int _1118 = _1114;
                    if (_942)
                    {
                        _1118 = _334;
                    }
                    int _1120 = _1118;
                    bool _1122 = _872 == 12;
                    int _1124 = _1120;
                    if (_908)
                    {
                        _1124 = _336;
                    }
                    int _1126 = _1124;
                    bool _1128 = _872 == 8;
                    int _1130 = _1126;
                    if (_882)
                    {
                        _1130 = _338;
                    }
                    int _1132 = _1130;
                    int _1134 = _1132;
                    if (_884)
                    {
                        _1134 = _340;
                    }
                    int _1136 = _1134;
                    int _1138 = _1136;
                    if (_886)
                    {
                        _1138 = _342;
                    }
                    int _1140 = _1138;
                    int _1142 = _1140 + 1;
                    _654 = _1142;
                    if (_1116)
                    {
                        _550 = _1142;
                    }
                    int _1144 = _550;
                    bool _1146 = _872 == 16;
                    _600 = _1144;
                    if (_1110)
                    {
                        _552 = _1142;
                    }
                    int _1148 = _552;
                    bool _1150 = _872 == 20;
                    _602 = _1148;
                    if (_1128)
                    {
                        _554 = _1142;
                    }
                    int _1152 = _554;
                    bool _1154 = _872 == 24;
                    _604 = _1152;
                    if (_1122)
                    {
                        _556 = _1142;
                    }
                    int _1156 = _556;
                    bool _1158 = _872 == 28;
                    _606 = _1156;
                    if (_882)
                    {
                        _558 = _1142;
                    }
                    int _1160 = _558;
                    _644 = _1160;
                    if (_884)
                    {
                        _560 = _1142;
                    }
                    int _1162 = _560;
                    _646 = _1162;
                    if (_886)
                    {
                        _562 = _1142;
                    }
                    int _1164 = _562;
                    _648 = _1164;
                    if (_1146)
                    {
                        _564 = _1142;
                    }
                    int _1166 = _564;
                    bool _1168 = _872 == 32;
                    _608 = _1166;
                    if (_1150)
                    {
                        _566 = _1142;
                    }
                    int _1170 = _566;
                    bool _1172 = _872 == 36;
                    _610 = _1170;
                    if (_1154)
                    {
                        _568 = _1142;
                    }
                    int _1174 = _568;
                    bool _1176 = _872 == 40;
                    _612 = _1174;
                    if (_1158)
                    {
                        _570 = _1142;
                    }
                    int _1178 = _570;
                    bool _1180 = _872 == 44;
                    _614 = _1178;
                    if (_1168)
                    {
                        _572 = _1142;
                    }
                    int _1182 = _572;
                    bool _1184 = _872 == 48;
                    _616 = _1182;
                    if (_1172)
                    {
                        _574 = _1142;
                    }
                    int _1186 = _574;
                    bool _1188 = _872 == 52;
                    _618 = _1186;
                    if (_1176)
                    {
                        _576 = _1142;
                    }
                    int _1190 = _576;
                    bool _1192 = _872 == 56;
                    _620 = _1190;
                    if (_1180)
                    {
                        _578 = _1142;
                    }
                    int _1194 = _578;
                    bool _1196 = _872 == 60;
                    _622 = _1194;
                    if (_1184)
                    {
                        _580 = _1142;
                    }
                    int _1198 = _580;
                    bool _1200 = _872 == 64;
                    _624 = _1198;
                    if (_1188)
                    {
                        _582 = _1142;
                    }
                    int _1202 = _582;
                    bool _1204 = _872 == 68;
                    _626 = _1202;
                    if (_1192)
                    {
                        _584 = _1142;
                    }
                    int _1206 = _584;
                    bool _1208 = _936 != 0;
                    _628 = _1206;
                    if (_1196)
                    {
                        _586 = _1142;
                    }
                    int _1210 = _586;
                    bool _1212 = _1010 != 0;
                    _630 = _1210;
                    if (_1200)
                    {
                        _588 = _1142;
                    }
                    int _1214 = _588;
                    _632 = _1214;
                    if (_1204)
                    {
                        _590 = _1142;
                    }
                    int _1216 = _590;
                    bool _1218 = _982 != 0;
                    _634 = _1216;
                    if (_1208)
                    {
                        _592 = _1142;
                    }
                    int _1220 = _592;
                    bool _1222 = _1104 != 0;
                    _642 = _1220;
                    if (_1212)
                    {
                        _594 = _1142;
                    }
                    int _1224 = _594;
                    _640 = _1224;
                    if (_1218)
                    {
                        _596 = _1142;
                    }
                    int _1226 = _596;
                    _638 = _1226;
                    if (_1222)
                    {
                        _636 = _1142;
                    }
                }
            }
            _1228 = _598;
            int _1230 = _600;
            int _1232 = _602;
            int _1234 = _604;
            int _1236 = _606;
            int _1238 = _608;
            int _1240 = _610;
            int _1242 = _612;
            int _1244 = _614;
            int _1246 = _616;
            int _1248 = _618;
            int _1250 = _620;
            int _1252 = _622;
            int _1254 = _624;
            int _1256 = _626;
            int _1258 = _628;
            int _1260 = _630;
            int _1262 = _632;
            int _1264 = _634;
            int _1266 = _636;
            int _1268 = _638;
            int _1270 = _640;
            int _1272 = _642;
            int _1274 = _644;
            int _1276 = _646;
            int _1278 = _648;
            int _1280 = _650;
            int _1282 = _652;
            int _1284 = _654;
            int _1286 = _656;
            int _1288 = _344 + 1;
            bool _1290 = _1288 >= 3;
            _280 = !_1290;
            _226 = _1228;
            _228 = _1230;
            _230 = _1232;
            _232 = _1234;
            _234 = _1236;
            _236 = _1238;
            _238 = _1240;
            _240 = _1242;
            _242 = _1244;
            _244 = _1246;
            _246 = _1248;
            _248 = _1250;
            _250 = _1252;
            _252 = _1254;
            _254 = _1256;
            _256 = _1258;
            _258 = _1260;
            _260 = _1262;
            _262 = _1264;
            _264 = _1266;
            _266 = _1268;
            _268 = _1270;
            _270 = _1272;
            _272 = _1274;
            _274 = _1276;
            _276 = _1278;
            _278 = _1288;
            _740 = _1230;
            _746 = _1232;
            _752 = _1234;
            _758 = _1236;
            _734 = _1238;
            _764 = _1240;
            _770 = _1242;
            _782 = _1244;
            _788 = _1246;
            _794 = _1248;
            _800 = _1250;
            _776 = _1252;
            _806 = _1254;
            _812 = _1256;
            _822 = _1258;
            _828 = _1260;
            _834 = _1262;
            _840 = _1264;
            _818 = _1266;
            _846 = _1268;
            _850 = _1270;
            _854 = _1272;
            _858 = _1274;
            _862 = _1276;
            _866 = _1278;
            _658 = _1280;
            _726 = _1282;
            _660 = _1284;
            _728 = _1286;
        } while (_280);
        if (!_870)
        {
            _868 = _1228;
        }
        _870 = false;
        _1292 = _740;
        _1294 = _746;
        _1296 = _752;
        _1298 = _758;
        _1300 = _734;
        _1302 = _764;
        _1304 = _770;
        _1306 = _782;
        _1308 = _788;
        _1310 = _794;
        _1312 = _800;
        _1314 = _776;
        _1316 = _806;
        _1318 = _812;
        _1320 = _822;
        _1322 = _828;
        _1324 = _834;
        _1326 = _840;
        _1328 = _818;
        _1330 = _846;
        _1332 = _850;
        _1334 = _854;
        _1336 = _858;
        _1338 = _862;
        _1340 = _866;
        _1342 = _868;
        int _1344 = _658;
        int _1346 = _726;
        int _1348 = _660;
        int _1350 = _728;
        int _1352 = _144 + 1;
        bool _1354 = _1352 >= 3;
        _142 = !_1354;
        _86 = _1352;
        _88 = _1342;
        _90 = _1292;
        _92 = _1294;
        _94 = _1296;
        _96 = _1298;
        _98 = _1300;
        _100 = _1302;
        _102 = _1304;
        _104 = _1306;
        _106 = _1308;
        _108 = _1310;
        _110 = _1312;
        _112 = _1314;
        _114 = _1316;
        _116 = _1318;
        _118 = _1320;
        _120 = _1322;
        _122 = _1324;
        _124 = _1326;
        _126 = _1328;
        _128 = _1330;
        _130 = _1332;
        _132 = _1334;
        _134 = _1336;
        _136 = _1338;
        _138 = _1340;
        _1356 = _1344;
        _1358 = _1346;
        _1360 = _1348;
        _1362 = _1350;
        _1364 = _1344;
        _1366 = _1292;
    } while (_142);
    bool _1368 = _1342 > 0;
    if (!_1368)
    {
        _662 = 0;
    }
    int _1370 = _662;
    bool _1372 = !_1368;
    int _1374 = _1370;
    if (!_1372)
    {
        bool _1376 = _1342 > 3;
        bool _1378 = !_1376;
        int _1380 = 0;
        int _1382 = 0;
        int _1384 = 0;
        int _1386 = 0;
        int _1388 = 0;
        int _1390 = -1;
        int _1392 = 0;
        if (!_1378)
        {
            int _1394 = _1342 + (-3);
            _1390 = 0;
            bool _1396;
            do
            {
                int _1398 = _1380;
                int _1400 = _1382;
                int _1402 = _1356;
                int _1404 = _1358;
                int _1406 = _1360;
                int _1408 = _1384;
                int _1410 = _1362;
                int _1412 = _1398 * 4;
                int _1414 = _1398 + 1;
                int _1416 = _1398 + 2;
                bool _1418 = _1412 == 0;
                int _1420 = _1414 * 4;
                bool _1422 = _1412 == 4;
                int _1424 = _1416 * 4;
                bool _1426 = _1412 == 8;
                bool _1428 = _1412 == 12;
                bool _1430 = _1412 == 16;
                bool _1432 = _1420 == 8;
                int _1434 = _1398 + 3;
                int _1436 = _1402;
                int _1438 = _1404;
                int _1440 = _1406;
                int _1442 = _1410;
                int _1444 = _1400;
                int _1446 = _1408;
                if (_1418)
                {
                    _1436 = _1292;
                }
                int _1448 = _1436;
                bool _1450 = _1412 == 24;
                int _1452 = _1448;
                if (_1422)
                {
                    _1452 = _1294;
                }
                int _1454 = _1452;
                bool _1456 = _1412 == 20;
                int _1458 = _1454;
                if (_1426)
                {
                    _1458 = _1296;
                }
                int _1460 = _1458;
                bool _1462 = _1412 == 32;
                int _1464 = _1460;
                if (_1428)
                {
                    _1464 = _1298;
                }
                int _1466 = _1464;
                bool _1468 = _1412 == 28;
                int _1470 = _1466;
                if (_1430)
                {
                    _1470 = _1300;
                }
                int _1472 = _1470;
                bool _1474 = _1412 == 40;
                int _1476 = _1434 * 4;
                int _1478 = _1472;
                if (_1456)
                {
                    _1478 = _1302;
                }
                int _1480 = _1478;
                bool _1482 = _1412 == 36;
                int _1484 = _1480;
                if (_1450)
                {
                    _1484 = _1304;
                }
                int _1486 = _1484;
                bool _1488 = _1420 == 0;
                int _1490 = _1486;
                if (_1468)
                {
                    _1490 = _1306;
                }
                int _1492 = _1490;
                bool _1494 = _1420 == 4;
                int _1496 = _1492;
                if (_1462)
                {
                    _1496 = _1308;
                }
                int _1498 = _1496;
                bool _1500 = _1420 == 12;
                int _1502 = _1498;
                if (_1482)
                {
                    _1502 = _1310;
                }
                int _1504 = _1502;
                bool _1506 = _1412 == 44;
                int _1508 = _1504;
                if (_1474)
                {
                    _1508 = _1312;
                }
                int _1510 = _1508;
                bool _1512 = _1420 == 16;
                int _1514 = _1510;
                if (_1488)
                {
                    _1438 = _1292;
                }
                int _1516 = _1438;
                bool _1518 = _1412 == 48;
                int _1520 = _1516;
                if (_1494)
                {
                    _1520 = _1294;
                }
                int _1522 = _1520;
                int _1524 = _1522;
                if (_1432)
                {
                    _1524 = _1296;
                }
                int _1526 = _1524;
                bool _1528 = _1420 == 20;
                int _1530 = _1526;
                if (_1500)
                {
                    _1530 = _1298;
                }
                int _1532 = _1530;
                bool _1534 = _1420 == 24;
                bool _1536 = _1420 == 28;
                int _1538 = _1532;
                if (_1506)
                {
                    _1514 = _1314;
                }
                int _1540 = _1514;
                bool _1542 = _1412 == 52;
                int _1544 = _1540;
                if (_1512)
                {
                    _1538 = _1300;
                }
                int _1546 = _1538;
                bool _1548 = _1420 == 32;
                int _1550 = _1546;
                if (_1518)
                {
                    _1544 = _1316;
                }
                int _1552 = _1544;
                bool _1554 = _1412 == 56;
                int _1556 = _1552;
                if (_1528)
                {
                    _1550 = _1302;
                }
                int _1558 = _1550;
                bool _1560 = _1420 == 36;
                int _1562 = _1558;
                if (_1534)
                {
                    _1562 = _1304;
                }
                int _1564 = _1562;
                bool _1566 = _1420 == 40;
                int _1568 = _1564;
                if (_1536)
                {
                    _1568 = _1306;
                }
                int _1570 = _1568;
                bool _1572 = _1420 == 44;
                int _1574 = _1570;
                if (_1542)
                {
                    _1556 = _1318;
                }
                int _1576 = _1556;
                bool _1578 = _1412 == 60;
                int _1580 = _1576;
                if (_1548)
                {
                    _1574 = _1308;
                }
                int _1582 = _1574;
                bool _1584 = _1420 == 48;
                int _1586 = _1582;
                if (_1554)
                {
                    _1580 = _1320;
                }
                int _1588 = _1580;
                bool _1590 = _1412 == 64;
                int _1592 = _1588;
                if (_1560)
                {
                    _1586 = _1310;
                }
                int _1594 = _1586;
                bool _1596 = _1420 == 52;
                int _1598 = _1594;
                if (_1566)
                {
                    _1598 = _1312;
                }
                int _1600 = _1598;
                bool _1602 = _1420 == 56;
                int _1604 = _1600;
                if (_1572)
                {
                    _1604 = _1314;
                }
                int _1606 = _1604;
                bool _1608 = _1420 == 60;
                int _1610 = _1606;
                if (_1578)
                {
                    _1592 = _1322;
                }
                int _1612 = _1592;
                bool _1614 = _1424 == 0;
                int _1616 = _1612;
                if (_1584)
                {
                    _1610 = _1316;
                }
                int _1618 = _1610;
                bool _1620 = _1412 == 68;
                int _1622 = _1618;
                if (_1590)
                {
                    _1616 = _1324;
                }
                int _1624 = _1616;
                bool _1626 = _1424 == 4;
                int _1628 = _1624;
                if (_1596)
                {
                    _1622 = _1318;
                }
                int _1630 = _1622;
                bool _1632 = _1424 == 8;
                int _1634 = _1630;
                if (_1602)
                {
                    _1634 = _1320;
                }
                int _1636 = _1634;
                bool _1638 = _1424 == 12;
                int _1640 = _1636;
                if (_1608)
                {
                    _1640 = _1322;
                }
                int _1642 = _1640;
                bool _1644 = _1424 == 16;
                int _1646 = _1642;
                if (_1614)
                {
                    _1440 = _1292;
                }
                int _1648 = _1440;
                bool _1650 = _1420 == 64;
                int _1652 = _1648;
                if (_1620)
                {
                    _1628 = _1326;
                }
                int _1654 = _1628;
                bool _1656 = _1424 == 20;
                int _1658 = _1654;
                if (_1626)
                {
                    _1652 = _1294;
                }
                int _1660 = _1652;
                bool _1662 = _1412 == 72;
                int _1664 = _1660;
                if (_1632)
                {
                    _1664 = _1296;
                }
                int _1666 = _1664;
                bool _1668 = _1424 == 24;
                int _1670 = _1666;
                if (_1638)
                {
                    _1670 = _1298;
                }
                int _1672 = _1670;
                bool _1674 = _1424 == 28;
                int _1676 = _1672;
                if (_1644)
                {
                    _1676 = _1300;
                }
                int _1678 = _1676;
                int _1680 = _1678;
                if (_1650)
                {
                    _1646 = _1324;
                }
                int _1682 = _1646;
                bool _1684 = _1420 == 68;
                int _1686 = _1682;
                if (_1656)
                {
                    _1680 = _1302;
                }
                int _1688 = _1680;
                bool _1690 = _1424 == 32;
                int _1692 = _1688;
                if (_1662)
                {
                    _1658 = _1328;
                }
                int _1694 = _1658;
                bool _1696 = _1424 == 36;
                bool _1698 = _1412 == 76;
                int _1700 = _1694;
                if (_1668)
                {
                    _1692 = _1304;
                }
                int _1702 = _1692;
                bool _1704 = _1424 == 40;
                int _1706 = _1702;
                if (_1674)
                {
                    _1706 = _1306;
                }
                int _1708 = _1706;
                bool _1710 = _1424 == 44;
                int _1712 = _1708;
                if (_1684)
                {
                    _1686 = _1326;
                }
                int _1714 = _1686;
                bool _1716 = _1420 == 72;
                int _1718 = _1714;
                if (_1690)
                {
                    _1712 = _1308;
                }
                int _1720 = _1712;
                bool _1722 = _1424 == 48;
                int _1724 = _1720;
                if (_1696)
                {
                    _1724 = _1310;
                }
                int _1726 = _1724;
                bool _1728 = _1424 == 52;
                int _1730 = _1726;
                if (_1698)
                {
                    _1700 = _1330;
                }
                int _1732 = _1700;
                bool _1734 = _1412 == 80;
                int _1736 = _1732;
                if (_1704)
                {
                    _1730 = _1312;
                }
                int _1738 = _1730;
                bool _1740 = _1424 == 56;
                int _1742 = _1738;
                if (_1710)
                {
                    _1742 = _1314;
                }
                int _1744 = _1742;
                bool _1746 = _1424 == 60;
                int _1748 = _1744;
                if (_1716)
                {
                    _1718 = _1328;
                }
                int _1750 = _1718;
                bool _1752 = _1424 == 64;
                int _1754 = _1750;
                if (_1722)
                {
                    _1748 = _1316;
                }
                int _1756 = _1748;
                bool _1758 = _1420 == 76;
                int _1760 = _1756;
                if (_1728)
                {
                    _1760 = _1318;
                }
                int _1762 = _1760;
                bool _1764 = _1412 == 84;
                int _1766 = _1762;
                if (_1734)
                {
                    _1736 = _1332;
                }
                int _1768 = _1736;
                bool _1770 = _1424 == 68;
                int _1772 = _1768;
                if (_1740)
                {
                    _1766 = _1320;
                }
                int _1774 = _1766;
                bool _1776 = _1424 == 72;
                int _1778 = _1774;
                if (_1746)
                {
                    _1778 = _1322;
                }
                int _1780 = _1778;
                bool _1782 = _1424 == 76;
                int _1784 = _1780;
                if (_1752)
                {
                    _1784 = _1324;
                }
                int _1786 = _1784;
                bool _1788 = _1476 == 0;
                int _1790 = _1786;
                if (_1758)
                {
                    _1754 = _1330;
                }
                int _1792 = _1754;
                bool _1794 = _1420 == 80;
                int _1796 = _1792;
                if (_1764)
                {
                    _1772 = _1334;
                }
                int _1798 = _1772;
                bool _1800 = _1476 == 4;
                int _1802 = _1798;
                if (_1770)
                {
                    _1790 = _1326;
                }
                int _1804 = _1790;
                bool _1806 = _1424 == 80;
                int _1808 = _1804;
                if (_1776)
                {
                    _1808 = _1328;
                }
                int _1810 = _1808;
                bool _1812 = _1476 == 8;
                int _1814 = _1810;
                if (_1782)
                {
                    _1814 = _1330;
                }
                int _1816 = _1814;
                bool _1818 = _1412 == 88;
                int _1820 = _1816;
                if (_1788)
                {
                    _1442 = _1292;
                }
                int _1822 = _1442;
                bool _1824 = _1476 == 12;
                int _1826 = _1822;
                if (_1794)
                {
                    _1796 = _1332;
                }
                int _1828 = _1796;
                bool _1830 = _1420 == 84;
                int _1832 = _1828;
                if (_1800)
                {
                    _1826 = _1294;
                }
                int _1834 = _1826;
                int _1836 = _1834;
                if (_1806)
                {
                    _1820 = _1332;
                }
                int _1838 = _1820;
                bool _1840 = _1424 == 84;
                int _1842 = _1838;
                if (_1812)
                {
                    _1836 = _1296;
                }
                int _1844 = _1836;
                bool _1846 = _1476 == 16;
                int _1848 = _1844;
                if (_1818)
                {
                    _1802 = _1336;
                }
                int _1850 = _1802;
                bool _1852 = _1412 == 92;
                bool _1854 = _1476 == 20;
                int _1856 = _1850;
                if (_1824)
                {
                    _1848 = _1298;
                }
                int _1858 = _1848;
                bool _1860 = _1420 == 88;
                int _1862 = _1858;
                if (_1830)
                {
                    _1832 = _1334;
                }
                int _1864 = _1832;
                bool _1866 = _1476 == 24;
                int _1868 = _1864;
                if (_1840)
                {
                    _1842 = _1334;
                }
                int _1870 = _1842;
                bool _1872 = _1424 == 88;
                int _1874 = _1870;
                if (_1846)
                {
                    _1862 = _1300;
                }
                int _1876 = _1862;
                bool _1878 = _1476 == 28;
                int _1880 = _1876;
                if (_1852)
                {
                    _1856 = _1338;
                }
                int _1882 = _1856;
                bool _1884 = _1476 == 32;
                int _1886 = _1882;
                if (_1854)
                {
                    _1880 = _1302;
                }
                int _1888 = _1880;
                bool _1890 = _1412 == 96;
                int _1892 = _1888;
                if (_1860)
                {
                    _1868 = _1336;
                }
                int _1894 = _1868;
                bool _1896 = _1476 == 40;
                int _1898 = _1894;
                if (_1866)
                {
                    _1892 = _1304;
                }
                int _1900 = _1892;
                bool _1902 = _1476 == 36;
                int _1904 = _1900;
                if (_1872)
                {
                    _1874 = _1336;
                }
                int _1906 = _1874;
                bool _1908 = _1420 == 92;
                int _1910 = _1906;
                if (_1878)
                {
                    _1904 = _1306;
                }
                int _1912 = _1904;
                bool _1914 = _1476 == 44;
                int _1916 = _1912;
                if (_1884)
                {
                    _1916 = _1308;
                }
                int _1918 = _1916;
                bool _1920 = _1476 == 48;
                int _1922 = _1918;
                if (_1890)
                {
                    _1886 = _1340;
                }
                int _1924 = _1886;
                bool _1926 = _1420 == 96;
                int _1928 = _1924;
                if (_1902)
                {
                    _1922 = _1310;
                }
                int _1930 = _1922;
                bool _1932 = _1476 == 52;
                int _1934 = _1930;
                if (_1896)
                {
                    _1934 = _1312;
                }
                int _1936 = _1934;
                bool _1938 = _1400 >= _1924;
                int _1940 = _1936;
                if (_1908)
                {
                    _1898 = _1338;
                }
                int _1942 = _1898;
                bool _1944 = _1476 == 56;
                int _1946 = _1942;
                if (_1914)
                {
                    _1940 = _1314;
                }
                int _1948 = _1940;
                bool _1950 = _1476 == 60;
                int _1952 = _1948;
                if (_1920)
                {
                    _1952 = _1316;
                }
                int _1954 = _1952;
                bool _1956 = _1476 == 64;
                int _1958 = _1954;
                if (_1926)
                {
                    _1946 = _1340;
                }
                int _1960 = _1946;
                bool _1962 = _1424 == 92;
                _1358 = _1960;
                if (_1932)
                {
                    _1958 = _1318;
                }
                int _1964 = _1958;
                bool _1966 = _1476 == 68;
                int _1968 = _1964;
                if (!_1938)
                {
                    _1444 = _1924;
                }
                int _1970 = _1444;
                int _1972 = _1970;
                if (_1944)
                {
                    _1968 = _1320;
                }
                int _1974 = _1968;
                bool _1976 = _1476 == 72;
                int _1978 = _1974;
                if (_1950)
                {
                    _1978 = _1322;
                }
                int _1980 = _1978;
                bool _1982 = _1970 >= _1960;
                int _1984 = _1980;
                if (_1956)
                {
                    _1984 = _1324;
                }
                int _1986 = _1984;
                int _1988 = _1986;
                if (_1962)
                {
                    _1910 = _1338;
                }
                int _1990 = _1910;
                bool _1992 = _1424 == 96;
                bool _1994 = _1476 == 76;
                int _1996 = _1990;
                if (_1966)
                {
                    _1988 = _1326;
                }
                int _1998 = _1988;
                bool _2000 = _1476 == 80;
                int _2002 = _1998;
                if (_1976)
                {
                    _2002 = _1328;
                }
                int _2004 = _2002;
                bool _2006 = _1476 == 84;
                int _2008 = _2004;
                if (_1982)
                {
                    _1928 = _1970;
                }
                int _2010 = _1928;
                int _2012 = _2010;
                if (!_1982)
                {
                    _2012 = _1960;
                }
                int _2014 = _2012;
                int _2016 = _2014;
                if (_1992)
                {
                    _1996 = _1340;
                }
                int _2018 = _1996;
                bool _2020 = _1476 == 88;
                _1360 = _2018;
                if (_1994)
                {
                    _2008 = _1330;
                }
                int _2022 = _2008;
                bool _2024 = _1476 == 92;
                int _2026 = _2022;
                if (_2000)
                {
                    _2026 = _1332;
                }
                int _2028 = _2026;
                bool _2030 = _2014 >= _2018;
                int _2032 = _2028;
                if (_1938)
                {
                    _1972 = _1408;
                }
                int _2034 = _1972;
                int _2036 = _2034;
                if (_2006)
                {
                    _2032 = _1334;
                }
                int _2038 = _2032;
                bool _2040 = _1476 == 96;
                int _2042 = _2038;
                if (!_1938)
                {
                    _2036 = _1398;
                }
                int _2044 = _2036;
                int _2046 = _1398 + 4;
                _1380 = _2046;
                int _2048 = _2044;
                _1386 = _2046;
                if (!_1982)
                {
                    _2048 = _1414;
                }
                int _2050 = _2048;
                int _2052 = _2050;
                if (_2020)
                {
                    _2042 = _1336;
                }
                int _2054 = _2042;
                bool _2056 = _2046 >= _1394;
                int _2058 = _2054;
                if (_2024)
                {
                    _2058 = _1338;
                }
                int _2060 = _2058;
                int _2062 = _2060;
                if (!_2030)
                {
                    _2016 = _2018;
                }
                int _2064 = _2016;
                _1356 = _2064;
                _1364 = _2064;
                if (!_2030)
                {
                    _2052 = _1416;
                }
                int _2066 = _2052;
                int _2068 = _2066;
                if (_2040)
                {
                    _2062 = _1340;
                }
                int _2070 = _2062;
                bool _2072 = _2064 >= _2070;
                _1362 = _2070;
                if (_2072)
                {
                    _1446 = _2066;
                }
                int _2074 = _1446;
                int _2076 = _2074;
                if (_2072)
                {
                    _2068 = _2064;
                }
                int _2078 = _2068;
                int _2080 = _2078;
                if (!_2072)
                {
                    _2076 = _1434;
                }
                int _2082 = _2076;
                _1384 = _2082;
                _1392 = _2082;
                if (!_2072)
                {
                    _2080 = _2070;
                }
                int _2084 = _2080;
                _1396 = !_2056;
                _1382 = _2084;
                _1388 = _2084;
            } while (_1396);
        }
        int _2086 = _1386;
        int _2088 = _1388;
        int _2090 = _1364;
        int _2092 = _1390;
        int _2094 = _1392;
        int _2096 = -_2086;
        int _2098 = _1342 + _2096;
        bool _2100 = _2098 > 1;
        bool _2102 = !_2100;
        int _2104 = _2090;
        int _2106 = _2098;
        int _2108 = _2088;
        int _2110 = _2094;
        int _2112 = _2086;
        int _2114 = _2092;
        int _2116 = _2088;
        int _2118 = _2094;
        if (!_2102)
        {
            int _2120 = _2086 * 4;
            int _2122 = _2086 + 1;
            bool _2124 = _2120 == 0;
            int _2126 = _2122 * 4;
            bool _2128 = _2120 == 4;
            bool _2130 = _2120 == 8;
            bool _2132 = _2120 == 12;
            bool _2134 = _2120 == 24;
            bool _2136 = _2126 == 0;
            bool _2138 = _2120 == 40;
            if (_2124)
            {
                _2104 = _1292;
            }
            int _2140 = _2104;
            bool _2142 = _2120 == 16;
            int _2144 = _2140;
            if (_2128)
            {
                _2144 = _1294;
            }
            int _2146 = _2144;
            bool _2148 = _2120 == 20;
            int _2150 = _2146;
            if (_2130)
            {
                _2150 = _1296;
            }
            int _2152 = _2150;
            bool _2154 = _2120 == 36;
            int _2156 = _2152;
            if (_2132)
            {
                _2156 = _1298;
            }
            int _2158 = _2156;
            bool _2160 = _2120 == 28;
            int _2162 = _2158;
            if (_2136)
            {
                _2106 = _1292;
            }
            int _2164 = _2106;
            bool _2166 = _2126 == 16;
            int _2168 = _2164;
            if (_2142)
            {
                _2162 = _1300;
            }
            int _2170 = _2162;
            bool _2172 = _2120 == 32;
            int _2174 = _2170;
            if (_2148)
            {
                _2174 = _1302;
            }
            int _2176 = _2174;
            bool _2178 = _2120 == 48;
            int _2180 = _2176;
            if (_2134)
            {
                _2180 = _1304;
            }
            int _2182 = _2180;
            bool _2184 = _2126 == 4;
            int _2186 = _2182;
            if (_2160)
            {
                _2186 = _1306;
            }
            int _2188 = _2186;
            bool _2190 = _2120 == 44;
            int _2192 = _2188;
            if (_2172)
            {
                _2192 = _1308;
            }
            int _2194 = _2192;
            bool _2196 = _2126 == 8;
            int _2198 = _2194;
            if (_2154)
            {
                _2198 = _1310;
            }
            int _2200 = _2198;
            bool _2202 = _2126 == 12;
            int _2204 = _2200;
            if (_2184)
            {
                _2168 = _1294;
            }
            int _2206 = _2168;
            bool _2208 = _2120 == 52;
            int _2210 = _2206;
            if (_2138)
            {
                _2204 = _1312;
            }
            int _2212 = _2204;
            bool _2214 = _2126 == 20;
            int _2216 = _2212;
            if (_2190)
            {
                _2216 = _1314;
            }
            int _2218 = _2216;
            bool _2220 = _2126 == 24;
            int _2222 = _2218;
            if (_2178)
            {
                _2222 = _1316;
            }
            int _2224 = _2222;
            bool _2226 = _2120 == 60;
            int _2228 = _2224;
            if (_2196)
            {
                _2210 = _1296;
            }
            int _2230 = _2210;
            bool _2232 = _2120 == 56;
            int _2234 = _2230;
            if (_2202)
            {
                _2234 = _1298;
            }
            int _2236 = _2234;
            bool _2238 = _2126 == 28;
            int _2240 = _2236;
            if (_2166)
            {
                _2240 = _1300;
            }
            int _2242 = _2240;
            bool _2244 = _2126 == 32;
            int _2246 = _2242;
            if (_2214)
            {
                _2246 = _1302;
            }
            int _2248 = _2246;
            bool _2250 = _2126 == 36;
            int _2252 = _2248;
            if (_2208)
            {
                _2228 = _1318;
            }
            int _2254 = _2228;
            bool _2256 = _2120 == 64;
            int _2258 = _2254;
            if (_2220)
            {
                _2252 = _1304;
            }
            int _2260 = _2252;
            bool _2262 = _2120 == 68;
            int _2264 = _2260;
            if (_2232)
            {
                _2258 = _1320;
            }
            int _2266 = _2258;
            bool _2268 = _2126 == 40;
            int _2270 = _2266;
            if (_2238)
            {
                _2264 = _1306;
            }
            int _2272 = _2264;
            bool _2274 = _2120 == 72;
            int _2276 = _2272;
            if (_2226)
            {
                _2270 = _1322;
            }
            int _2278 = _2270;
            bool _2280 = _2126 == 44;
            int _2282 = _2278;
            if (_2244)
            {
                _2276 = _1308;
            }
            int _2284 = _2276;
            bool _2286 = _2126 == 48;
            int _2288 = _2284;
            if (_2250)
            {
                _2288 = _1310;
            }
            int _2290 = _2288;
            bool _2292 = _2120 == 76;
            int _2294 = _2290;
            if (_2256)
            {
                _2282 = _1324;
            }
            int _2296 = _2282;
            bool _2298 = _2126 == 52;
            int _2300 = _2296;
            if (_2262)
            {
                _2300 = _1326;
            }
            int _2302 = _2300;
            bool _2304 = _2120 == 80;
            int _2306 = _2302;
            if (_2268)
            {
                _2294 = _1312;
            }
            int _2308 = _2294;
            bool _2310 = _2126 == 56;
            int _2312 = _2308;
            if (_2274)
            {
                _2306 = _1328;
            }
            int _2314 = _2306;
            int _2316 = _2314;
            if (_2280)
            {
                _2312 = _1314;
            }
            int _2318 = _2312;
            bool _2320 = _2120 == 84;
            int _2322 = _2318;
            if (_2286)
            {
                _2322 = _1316;
            }
            int _2324 = _2322;
            bool _2326 = _2126 == 60;
            int _2328 = _2324;
            if (_2292)
            {
                _2316 = _1330;
            }
            int _2330 = _2316;
            bool _2332 = _2120 == 88;
            int _2334 = _2330;
            if (_2298)
            {
                _2328 = _1318;
            }
            int _2336 = _2328;
            bool _2338 = _2126 == 64;
            int _2340 = _2336;
            if (_2304)
            {
                _2334 = _1332;
            }
            int _2342 = _2334;
            bool _2344 = _2120 == 92;
            int _2346 = _2342;
            if (_2310)
            {
                _2340 = _1320;
            }
            int _2348 = _2340;
            bool _2350 = _2126 == 68;
            bool _2352 = _2126 == 72;
            int _2354 = _2348;
            if (_2320)
            {
                _2346 = _1334;
            }
            int _2356 = _2346;
            bool _2358 = _2120 == 96;
            int _2360 = _2356;
            if (_2326)
            {
                _2354 = _1322;
            }
            int _2362 = _2354;
            bool _2364 = _2126 == 76;
            int _2366 = _2362;
            if (_2332)
            {
                _2360 = _1336;
            }
            int _2368 = _2360;
            int _2370 = _2368;
            if (_2338)
            {
                _2366 = _1324;
            }
            int _2372 = _2366;
            bool _2374 = _2126 == 80;
            int _2376 = _2372;
            if (_2344)
            {
                _2370 = _1338;
            }
            int _2378 = _2370;
            bool _2380 = _2126 == 96;
            int _2382 = _2378;
            if (_2350)
            {
                _2376 = _1326;
            }
            int _2384 = _2376;
            bool _2386 = _2126 == 84;
            int _2388 = _2384;
            if (_2352)
            {
                _2388 = _1328;
            }
            int _2390 = _2388;
            bool _2392 = _2126 == 88;
            int _2394 = _2390;
            if (_2358)
            {
                _2382 = _1340;
            }
            int _2396 = _2382;
            bool _2398 = _2126 == 92;
            if (_2364)
            {
                _2394 = _1330;
            }
            int _2400 = _2394;
            bool _2402 = _2088 >= _2396;
            int _2404 = _2400;
            if (_2374)
            {
                _2404 = _1332;
            }
            int _2406 = _2404;
            int _2408 = _2406;
            if (_2386)
            {
                _2408 = _1334;
            }
            int _2410 = _2408;
            int _2412 = _2410;
            if (_2392)
            {
                _2412 = _1336;
            }
            int _2414 = _2412;
            int _2416 = _2414;
            _2114 = 0;
            if (_2398)
            {
                _2416 = _1338;
            }
            int _2418 = _2416;
            int _2420 = _2418;
            if (_2380)
            {
                _2420 = _1340;
            }
            int _2422 = _2420;
            if (!_2402)
            {
                _2108 = _2396;
            }
            int _2424 = _2108;
            _2116 = _2424;
            if (!_2402)
            {
                _2110 = _2086;
            }
            int _2426 = _2110;
            int _2428 = _2122 + 1;
            bool _2430 = _2424 >= _2422;
            int _2432 = _2426;
            _2112 = _2428;
            if (!_2430)
            {
                _2432 = _2122;
            }
            int _2434 = _2432;
            _2118 = _2434;
            if (!_2430)
            {
                _2116 = _2422;
            }
        }
        int _2436 = _2112;
        int _2438 = _2114;
        int _2440 = _2116;
        int _2442 = _2118;
        bool _2444 = _2436 < _1342;
        int _2446 = (_2444 ? (-1) : 0) | _2438;
        int _2448 = ~_2446;
        int _2450 = _2442;
        if (!(_2448 != 0))
        {
            int _2452 = _2436 * 4;
            bool _2454 = _2452 == 4;
            bool _2456 = _2452 == 8;
            bool _2458 = _2452 == 12;
            bool _2460 = _2452 == 16;
            if (_2454)
            {
                _1366 = _1294;
            }
            int _2462 = _1366;
            bool _2464 = _2452 == 20;
            int _2466 = _2462;
            if (_2456)
            {
                _2466 = _1296;
            }
            int _2468 = _2466;
            bool _2470 = _2452 == 24;
            int _2472 = _2468;
            if (_2458)
            {
                _2472 = _1298;
            }
            int _2474 = _2472;
            bool _2476 = _2452 == 28;
            int _2478 = _2474;
            if (_2460)
            {
                _2478 = _1300;
            }
            int _2480 = _2478;
            bool _2482 = _2452 == 32;
            int _2484 = _2480;
            if (_2464)
            {
                _2484 = _1302;
            }
            int _2486 = _2484;
            bool _2488 = _2452 == 36;
            int _2490 = _2486;
            if (_2470)
            {
                _2490 = _1304;
            }
            int _2492 = _2490;
            bool _2494 = _2452 == 40;
            int _2496 = _2492;
            if (_2476)
            {
                _2496 = _1306;
            }
            int _2498 = _2496;
            bool _2500 = _2452 == 44;
            int _2502 = _2498;
            if (_2482)
            {
                _2502 = _1308;
            }
            int _2504 = _2502;
            bool _2506 = _2452 == 48;
            int _2508 = _2504;
            if (_2488)
            {
                _2508 = _1310;
            }
            int _2510 = _2508;
            bool _2512 = _2452 == 52;
            int _2514 = _2510;
            if (_2494)
            {
                _2514 = _1312;
            }
            int _2516 = _2514;
            bool _2518 = _2452 == 56;
            int _2520 = _2516;
            if (_2500)
            {
                _2520 = _1314;
            }
            int _2522 = _2520;
            bool _2524 = _2452 == 60;
            int _2526 = _2522;
            if (_2506)
            {
                _2526 = _1316;
            }
            int _2528 = _2526;
            bool _2530 = _2452 == 64;
            int _2532 = _2528;
            if (_2512)
            {
                _2532 = _1318;
            }
            int _2534 = _2532;
            bool _2536 = _2452 == 68;
            int _2538 = _2534;
            if (_2518)
            {
                _2538 = _1320;
            }
            int _2540 = _2538;
            bool _2542 = _2452 == 72;
            int _2544 = _2540;
            if (_2524)
            {
                _2544 = _1322;
            }
            int _2546 = _2544;
            bool _2548 = _2452 == 76;
            int _2550 = _2546;
            if (_2530)
            {
                _2550 = _1324;
            }
            int _2552 = _2550;
            bool _2554 = _2452 == 80;
            int _2556 = _2552;
            if (_2536)
            {
                _2556 = _1326;
            }
            int _2558 = _2556;
            bool _2560 = _2452 == 84;
            int _2562 = _2558;
            if (_2542)
            {
                _2562 = _1328;
            }
            int _2564 = _2562;
            bool _2566 = _2452 == 88;
            int _2568 = _2564;
            if (_2548)
            {
                _2568 = _1330;
            }
            int _2570 = _2568;
            bool _2572 = _2452 == 92;
            int _2574 = _2570;
            if (_2554)
            {
                _2574 = _1332;
            }
            int _2576 = _2574;
            bool _2578 = _2452 == 96;
            int _2580 = _2576;
            if (_2560)
            {
                _2580 = _1334;
            }
            int _2582 = _2580;
            int _2584 = _2582;
            if (_2566)
            {
                _2584 = _1336;
            }
            int _2586 = _2584;
            int _2588 = _2586;
            if (_2572)
            {
                _2588 = _1338;
            }
            int _2590 = _2588;
            int _2592 = _2590;
            if (_2578)
            {
                _2592 = _1340;
            }
            int _2594 = _2592;
            bool _2596 = _2440 >= _2594;
            if (!_2596)
            {
                _2450 = _2436;
            }
        }
        int _2598 = _2450;
        _1374 = _2598;
    }
    int _2600 = _1374;
    int _2602 = _2600 * 8;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    float _2606 = as_type<float>(_31[int(_2604)]);
    int _2608 = _2602 + 4;
    uint _2610 = uint(int(uint(_2608) >> uint(2)));
    float _2612 = as_type<float>(_31[int(_2610)]);
    int _2614 = _69 + 16;
    uint _2616 = uint(int(uint(_2614) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2616)] = as_type<uint>(_2606);
    int _2618 = _2614 + 4;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2620)] = as_type<uint>(_2612);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _870 = false;
    bool _694 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _2641 = float2((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    float4 _55 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2641, float2(0.0), isnan(_2641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2641, float2(0.0), isnan(_2641)), level(0.0)).xyzw;
    float _58 = _55.x;
    float _60 = _55.y;
    float _62 = _55.z;
    float _64 = _55.w;
    float _66 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _69 = as_type<int>(_66) * 32;
    uint _72 = uint(int(uint(_69) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_72)] = as_type<uint>(_58);
    int _74 = _69 + 4;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_76)] = as_type<uint>(_60);
    int _78 = _69 + 8;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_80)] = as_type<uint>(_62);
    int _82 = _69 + 12;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_84)] = as_type<uint>(_64);
    int _86 = -2;
    int _88 = 0;
    int _90 = 0;
    int _92 = 0;
    int _94 = 0;
    int _96 = 0;
    int _98 = 0;
    int _100 = 0;
    int _102 = 0;
    int _104 = 0;
    int _106 = 0;
    int _108 = 0;
    int _110 = 0;
    int _112 = 0;
    int _114 = 0;
    int _116 = 0;
    int _118 = 0;
    int _120 = 0;
    int _122 = 0;
    int _124 = 0;
    int _126 = 0;
    int _128 = 0;
    int _130 = 0;
    int _132 = 0;
    int _134 = 0;
    int _136 = 0;
    int _138 = 0;
    bool _142;
    bool _280;
    int _658;
    int _660;
    int _662;
    bool _670;
    int _672;
    int _726;
    int _728;
    int _734;
    int _740;
    int _746;
    int _752;
    int _758;
    int _764;
    int _770;
    int _776;
    int _782;
    int _788;
    int _794;
    int _800;
    int _806;
    int _812;
    bool _816;
    int _818;
    int _822;
    int _828;
    int _834;
    int _840;
    int _846;
    int _850;
    int _854;
    int _858;
    int _862;
    int _866;
    int _868;
    int _1228;
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
    int _1332;
    int _1334;
    int _1336;
    int _1338;
    int _1340;
    int _1342;
    int _1356;
    int _1358;
    int _1360;
    int _1362;
    int _1364;
    int _1366;
    do
    {
        int _144 = _86;
        int _146 = _88;
        int _148 = _90;
        int _150 = _92;
        int _152 = _94;
        int _154 = _96;
        int _156 = _98;
        int _158 = _100;
        int _160 = _102;
        int _162 = _104;
        int _164 = _106;
        int _166 = _108;
        int _168 = _110;
        int _170 = _112;
        int _172 = _114;
        int _174 = _116;
        int _176 = _118;
        int _178 = _120;
        int _180 = _122;
        int _182 = _124;
        int _184 = _126;
        int _186 = _128;
        int _188 = _130;
        int _190 = _132;
        int _192 = _134;
        int _194 = _136;
        int _196 = _138;
        float _198 = float(_144);
        float _200 = _198 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _202 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _204 = fma(_200, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2759 = float2(_202, _204);
        float4 _206 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2759, float2(0.0), isnan(_2759)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2759, float2(0.0), isnan(_2759)), level(0.0)).xyzw;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = _206.z;
        float _214 = _206.w;
        int _216 = -2;
        float _218 = _214;
        float _220 = _210;
        float _222 = _212;
        float _224 = _208;
        int _226 = _146;
        int _228 = _148;
        int _230 = _150;
        int _232 = _152;
        int _234 = _154;
        int _236 = _156;
        int _238 = _158;
        int _240 = _160;
        int _242 = _162;
        int _244 = _164;
        int _246 = _166;
        int _248 = _168;
        int _250 = _170;
        int _252 = _172;
        int _254 = _174;
        int _256 = _176;
        int _258 = _178;
        int _260 = _180;
        int _262 = _182;
        int _264 = _184;
        int _266 = _186;
        int _268 = _188;
        int _270 = _190;
        int _272 = _192;
        int _274 = _194;
        int _276 = _196;
        int _278 = -2;
        do
        {
            int _282 = _216;
            float _284 = _218;
            float _286 = _220;
            float _288 = _222;
            float _290 = _224;
            int _292 = _226;
            int _294 = _228;
            int _296 = _230;
            int _298 = _232;
            int _300 = _234;
            int _302 = _236;
            int _304 = _238;
            int _306 = _240;
            int _308 = _242;
            int _310 = _244;
            int _312 = _246;
            int _314 = _248;
            int _316 = _250;
            int _318 = _252;
            int _320 = _254;
            int _322 = _256;
            int _324 = _258;
            int _326 = _260;
            int _328 = _262;
            int _330 = _264;
            int _332 = _266;
            int _334 = _268;
            int _336 = _270;
            int _338 = _272;
            int _340 = _274;
            int _342 = _276;
            int _344 = _278;
            int _346 = _282 + 1;
            float _348 = float(_144);
            float _350 = float(_346);
            float _352 = _348 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _354 = _350 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _356 = 0.0 + _284;
            float _358 = precise::clamp(_356, 0.0, 1.0);
            float _360 = fma(_352, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _362 = 0.0 + _286;
            float _364 = precise::clamp(_362, 0.0, 1.0);
            float _366 = fma(_354, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _368 = 0.0 + _288;
            float _370 = precise::clamp(_368, 0.0, 1.0);
            float _372 = 0.0 + _290;
            float _374 = precise::clamp(_372, 0.0, 1.0);
            float2 _2877 = float2(_366, _360);
            float4 _376 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2877, float2(0.0), isnan(_2877)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2877, float2(0.0), isnan(_2877)), level(0.0)).xyzw;
            float _378 = _376.x;
            float _380 = _376.y;
            float _382 = _376.z;
            float _384 = _376.w;
            float _386 = _358 * 65535.0;
            float _388 = _370 * 65535.0;
            float _390 = _364 * 65535.0;
            float _392 = _374 * 65535.0;
            float _394 = rint(_386);
            int _396 = int(_394);
            float _398 = rint(_388);
            int _400 = int(_398);
            float _402 = rint(_390);
            int _404 = int(_402);
            uint _406 = extract_bits(uint(_396), 0u, 8u);
            int _408 = int(_406) & 255;
            uint _410 = extract_bits(uint(_396), 8u, 8u);
            int _412 = int(_410) & 255;
            int _414 = _412 << 8;
            int _416 = _408 | _414;
            float _418 = rint(_392);
            int _420 = int(_418);
            uint _422 = extract_bits(uint(_416), 0u, 8u);
            int _424 = int(_422) & 255;
            uint _426 = extract_bits(uint(_416), 8u, 8u);
            int _428 = int(_426) & 255;
            int _430 = _428 << 8;
            int _432 = _424 | _430;
            uint _434 = extract_bits(uint(_400), 0u, 8u);
            int _436 = int(_434) & 255;
            int _438 = _436 << 16;
            int _440 = _432 | _438;
            uint _442 = extract_bits(uint(_400), 8u, 8u);
            int _444 = int(_442) & 255;
            int _446 = _444 << 24;
            int _448 = _440 | _446;
            bool _450 = _448 != 0;
            uint _452 = extract_bits(uint(_404), 0u, 8u);
            int _454 = int(_452) & 255;
            uint _456 = extract_bits(uint(_404), 8u, 8u);
            int _458 = int(_456) & 255;
            int _460 = _458 << 8;
            int _462 = _454 | _460;
            uint _464 = extract_bits(uint(_462), 0u, 8u);
            int _466 = int(_464) & 255;
            uint _468 = extract_bits(uint(_462), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 8;
            int _474 = _466 | _472;
            uint _476 = extract_bits(uint(_420), 0u, 8u);
            int _478 = int(_476) & 255;
            int _480 = _478 << 16;
            int _482 = _474 | _480;
            uint _484 = extract_bits(uint(_420), 8u, 8u);
            int _486 = int(_484) & 255;
            int _488 = _486 << 24;
            int _490 = _482 | _488;
            bool _492 = _490 != 0;
            bool _494 = _492 || _450;
            bool _496 = !_494;
            _216 = _346;
            _218 = _384;
            _220 = _380;
            _222 = _382;
            _224 = _378;
            int _498 = _302;
            int _500 = _294;
            int _502 = _296;
            int _504 = _298;
            int _506 = _300;
            int _508 = _304;
            int _510 = _306;
            int _512 = _316;
            int _514 = _308;
            int _516 = _310;
            int _518 = _312;
            int _520 = _314;
            int _522 = _318;
            int _524 = _320;
            int _526 = _330;
            int _528 = _322;
            int _530 = _324;
            int _532 = _326;
            int _534 = _328;
            int _536 = _332;
            int _538 = _334;
            int _540 = _336;
            int _542 = _338;
            int _544 = _340;
            int _546 = _342;
            int _548 = _448;
            int _550 = _294;
            int _552 = _296;
            int _554 = _298;
            int _556 = _300;
            int _558 = _338;
            int _560 = _340;
            int _562 = _342;
            int _564 = _302;
            int _566 = _304;
            int _568 = _306;
            int _570 = _308;
            int _572 = _310;
            int _574 = _312;
            int _576 = _314;
            int _578 = _316;
            int _580 = _318;
            int _582 = _320;
            int _584 = _322;
            int _586 = _324;
            int _588 = _326;
            int _590 = _328;
            int _592 = _336;
            int _594 = _334;
            int _596 = _332;
            int _598 = _292;
            int _600 = _294;
            int _602 = _296;
            int _604 = _298;
            int _606 = _300;
            int _608 = _302;
            int _610 = _304;
            int _612 = _306;
            int _614 = _308;
            int _616 = _310;
            int _618 = _312;
            int _620 = _314;
            int _622 = _316;
            int _624 = _318;
            int _626 = _320;
            int _628 = _322;
            int _630 = _324;
            int _632 = _326;
            int _634 = _328;
            int _636 = _330;
            int _638 = _332;
            int _640 = _334;
            int _642 = _336;
            int _644 = _338;
            int _646 = _340;
            int _648 = _342;
            int _650 = _490;
            int _652 = _420;
            int _654 = _448;
            int _656 = _416;
            _658 = _490;
            _660 = _448;
            _662 = as_type<int>(_382);
            if (!_496)
            {
                bool _664 = _292 > 0;
                bool _666 = !_664;
                if (!_666)
                {
                    int _668 = 0;
                    do
                    {
                        _672 = _668;
                        int _674 = _672 * 8;
                        uint _676 = uint(int(uint(_674) >> uint(2)));
                        float _678 = as_type<float>(_31[int(_676)]);
                        int _680 = _674 + 4;
                        uint _682 = uint(int(uint(_680) >> uint(2)));
                        float _684 = as_type<float>(_31[int(_682)]);
                        bool _686 = as_type<int>(_678) != _448;
                        bool _688 = as_type<int>(_684) != _490;
                        bool _690 = _688 || _686;
                        bool _692 = !_690;
                        _694 = _692;
                        if (_694)
                        {
                            break;
                        }
                        int _696 = _672 + 1;
                        bool _698 = _696 >= _292;
                        _670 = !_698;
                        _668 = _696;
                    } while (_670);
                }
                if (!_694)
                {
                    int _700 = _292 * 4;
                    int _702 = _292 * 8;
                    int _704 = _292 + 1;
                    bool _706 = _700 == 16;
                    bool _708 = _700 == 0;
                    uint _710 = uint(int(uint(_702) >> uint(2)));
                    _31[int(_710)] = uint(_448);
                    int _712 = _702 + 4;
                    uint _714 = uint(int(uint(_712) >> uint(2)));
                    _31[int(_714)] = uint(_490);
                    bool _716 = _700 == 4;
                    bool _718 = _700 == 8;
                    bool _720 = _700 == 12;
                    bool _722 = _700 == 20;
                    bool _724 = _700 == 24;
                    _598 = _704;
                    _652 = _702;
                    _656 = _700;
                    _726 = _702;
                    _728 = _700;
                    if (_706)
                    {
                        _498 = 1;
                    }
                    int _730 = _498;
                    bool _732 = _700 == 44;
                    _608 = _730;
                    _734 = _730;
                    if (_708)
                    {
                        _500 = 1;
                    }
                    int _736 = _500;
                    bool _738 = _700 == 28;
                    _600 = _736;
                    _740 = _736;
                    if (_716)
                    {
                        _502 = 1;
                    }
                    int _742 = _502;
                    bool _744 = _700 == 32;
                    _602 = _742;
                    _746 = _742;
                    if (_718)
                    {
                        _504 = 1;
                    }
                    int _748 = _504;
                    bool _750 = _700 == 36;
                    _604 = _748;
                    _752 = _748;
                    if (_720)
                    {
                        _506 = 1;
                    }
                    int _754 = _506;
                    bool _756 = _700 == 40;
                    _606 = _754;
                    _758 = _754;
                    if (_722)
                    {
                        _508 = 1;
                    }
                    int _760 = _508;
                    bool _762 = _700 == 48;
                    _610 = _760;
                    _764 = _760;
                    if (_724)
                    {
                        _510 = 1;
                    }
                    int _766 = _510;
                    bool _768 = _700 == 52;
                    _612 = _766;
                    _770 = _766;
                    if (_732)
                    {
                        _512 = 1;
                    }
                    int _772 = _512;
                    bool _774 = _700 == 72;
                    _622 = _772;
                    _776 = _772;
                    if (_738)
                    {
                        _514 = 1;
                    }
                    int _778 = _514;
                    bool _780 = _700 == 56;
                    _614 = _778;
                    _782 = _778;
                    if (_744)
                    {
                        _516 = 1;
                    }
                    int _784 = _516;
                    bool _786 = _700 == 60;
                    _616 = _784;
                    _788 = _784;
                    if (_750)
                    {
                        _518 = 1;
                    }
                    int _790 = _518;
                    bool _792 = _700 == 64;
                    _618 = _790;
                    _794 = _790;
                    if (_756)
                    {
                        _520 = 1;
                    }
                    int _796 = _520;
                    bool _798 = _700 == 68;
                    _620 = _796;
                    _800 = _796;
                    if (_762)
                    {
                        _522 = 1;
                    }
                    int _802 = _522;
                    bool _804 = _700 == 76;
                    _624 = _802;
                    _806 = _802;
                    if (_768)
                    {
                        _524 = 1;
                    }
                    int _808 = _524;
                    bool _810 = _700 == 80;
                    _626 = _808;
                    _812 = _808;
                    if (_774)
                    {
                        _526 = 1;
                    }
                    int _814 = _526;
                    _816 = _704 != 25;
                    _636 = _814;
                    _818 = _814;
                    if (_780)
                    {
                        _528 = 1;
                    }
                    int _820 = _528;
                    _628 = _820;
                    _822 = _820;
                    if (_786)
                    {
                        _530 = 1;
                    }
                    int _824 = _530;
                    bool _826 = _700 == 84;
                    _630 = _824;
                    _828 = _824;
                    if (_792)
                    {
                        _532 = 1;
                    }
                    int _830 = _532;
                    bool _832 = _700 == 88;
                    _632 = _830;
                    _834 = _830;
                    if (_798)
                    {
                        _534 = 1;
                    }
                    int _836 = _534;
                    bool _838 = _700 == 92;
                    _634 = _836;
                    _840 = _836;
                    if (_804)
                    {
                        _536 = 1;
                    }
                    int _842 = _536;
                    bool _844 = _700 == 96;
                    _638 = _842;
                    _846 = _842;
                    if (_810)
                    {
                        _538 = 1;
                    }
                    int _848 = _538;
                    _640 = _848;
                    _850 = _848;
                    if (_826)
                    {
                        _540 = 1;
                    }
                    int _852 = _540;
                    _642 = _852;
                    _854 = _852;
                    if (_832)
                    {
                        _542 = 1;
                    }
                    int _856 = _542;
                    _644 = _856;
                    _858 = _856;
                    if (_838)
                    {
                        _544 = 1;
                    }
                    int _860 = _544;
                    _646 = _860;
                    _862 = _860;
                    if (_844)
                    {
                        _546 = 1;
                    }
                    int _864 = _546;
                    _648 = _864;
                    _866 = _864;
                }
                if ((!_816) || _694)
                {
                    if (!_694)
                    {
                        _868 = 25;
                        _870 = true;
                        if (_870)
                        {
                            break;
                        }
                    }
                    _694 = false;
                    int _872 = _672 * 4;
                    bool _874 = _872 == 0;
                    bool _876 = _872 == 4;
                    bool _878 = _872 == 8;
                    bool _880 = _872 == 12;
                    bool _882 = _872 == 88;
                    bool _884 = _872 == 92;
                    bool _886 = _872 == 96;
                    if (_874)
                    {
                        _548 = _294;
                    }
                    int _888 = _548;
                    bool _890 = _872 == 16;
                    int _892 = _888;
                    if (_876)
                    {
                        _892 = _296;
                    }
                    int _894 = _892;
                    bool _896 = _872 == 20;
                    int _898 = _894;
                    if (_878)
                    {
                        _898 = _298;
                    }
                    int _900 = _898;
                    bool _902 = _872 == 24;
                    int _904 = _900;
                    if (_880)
                    {
                        _904 = _300;
                    }
                    int _906 = _904;
                    bool _908 = _872 == 84;
                    int _910 = int(_902);
                    int _912 = _896 ? 2 : 0;
                    int _914 = _910 | _912;
                    int _916 = _890 ? 4 : 0;
                    int _918 = _914 | _916;
                    int _920 = _908 ? 8 : 0;
                    int _922 = _918 | _920;
                    int _924 = _882 ? 16 : 0;
                    int _926 = _922 | _924;
                    int _928 = _884 ? 32 : 0;
                    int _930 = _926 | _928;
                    int _932 = _886 ? 64 : 0;
                    int _934 = _930 | _932;
                    int _936 = _934 & 8;
                    int _938 = _906;
                    _650 = _936;
                    if (_890)
                    {
                        _938 = _302;
                    }
                    int _940 = _938;
                    bool _942 = _872 == 80;
                    int _944 = _940;
                    if (_896)
                    {
                        _944 = _304;
                    }
                    int _946 = _944;
                    bool _948 = _872 == 76;
                    int _950 = _946;
                    if (_902)
                    {
                        _950 = _306;
                    }
                    int _952 = _950;
                    bool _954 = _872 == 28;
                    int _956 = int(_954);
                    int _958 = _948 ? 2 : 0;
                    int _960 = _956 | _958;
                    int _962 = _942 ? 4 : 0;
                    int _964 = _960 | _962;
                    int _966 = _908 ? 8 : 0;
                    int _968 = _964 | _966;
                    int _970 = _882 ? 16 : 0;
                    int _972 = _968 | _970;
                    int _974 = _884 ? 32 : 0;
                    int _976 = _972 | _974;
                    int _978 = _886 ? 64 : 0;
                    int _980 = _976 | _978;
                    int _982 = _980 & 2;
                    int _984 = int(_954);
                    int _986 = _948 ? 2 : 0;
                    int _988 = _984 | _986;
                    int _990 = _942 ? 4 : 0;
                    int _992 = _988 | _990;
                    int _994 = _908 ? 8 : 0;
                    int _996 = _992 | _994;
                    int _998 = _882 ? 16 : 0;
                    int _1000 = _996 | _998;
                    int _1002 = _884 ? 32 : 0;
                    int _1004 = _1000 | _1002;
                    int _1006 = _886 ? 64 : 0;
                    int _1008 = _1004 | _1006;
                    int _1010 = _1008 & 4;
                    int _1012 = _952;
                    _652 = _982;
                    _656 = _1010;
                    if (_954)
                    {
                        _1012 = _308;
                    }
                    int _1014 = _1012;
                    bool _1016 = _872 == 32;
                    int _1018 = _1014;
                    if (_1016)
                    {
                        _1018 = _310;
                    }
                    int _1020 = _1018;
                    bool _1022 = _872 == 36;
                    int _1024 = _1020;
                    if (_1022)
                    {
                        _1024 = _312;
                    }
                    int _1026 = _1024;
                    bool _1028 = _872 == 40;
                    int _1030 = _1026;
                    if (_1028)
                    {
                        _1030 = _314;
                    }
                    int _1032 = _1030;
                    bool _1034 = _872 == 44;
                    int _1036 = _1032;
                    if (_1034)
                    {
                        _1036 = _316;
                    }
                    int _1038 = _1036;
                    bool _1040 = _872 == 48;
                    int _1042 = _1038;
                    if (_1040)
                    {
                        _1042 = _318;
                    }
                    int _1044 = _1042;
                    bool _1046 = _872 == 52;
                    int _1048 = _1044;
                    if (_1046)
                    {
                        _1048 = _320;
                    }
                    int _1050 = _1048;
                    bool _1052 = _872 == 56;
                    int _1054 = _1050;
                    if (_1052)
                    {
                        _1054 = _322;
                    }
                    int _1056 = _1054;
                    bool _1058 = _872 == 60;
                    int _1060 = _1056;
                    if (_1058)
                    {
                        _1060 = _324;
                    }
                    int _1062 = _1060;
                    bool _1064 = _872 == 64;
                    int _1066 = _1062;
                    if (_1064)
                    {
                        _1066 = _326;
                    }
                    int _1068 = _1066;
                    bool _1070 = _872 == 68;
                    int _1072 = _1068;
                    if (_1070)
                    {
                        _1072 = _328;
                    }
                    int _1074 = _1072;
                    bool _1076 = _872 == 72;
                    int _1078 = int(_1076);
                    int _1080 = _948 ? 2 : 0;
                    int _1082 = _1078 | _1080;
                    int _1084 = _942 ? 4 : 0;
                    int _1086 = _1082 | _1084;
                    int _1088 = _908 ? 8 : 0;
                    int _1090 = _1086 | _1088;
                    int _1092 = _882 ? 16 : 0;
                    int _1094 = _1090 | _1092;
                    int _1096 = _884 ? 32 : 0;
                    int _1098 = _1094 | _1096;
                    int _1100 = _886 ? 64 : 0;
                    int _1102 = _1098 | _1100;
                    int _1104 = _1102 & 1;
                    int _1106 = _1074;
                    if (_1076)
                    {
                        _1106 = _330;
                    }
                    int _1108 = _1106;
                    bool _1110 = _872 == 4;
                    int _1112 = _1108;
                    if (_948)
                    {
                        _1112 = _332;
                    }
                    int _1114 = _1112;
                    bool _1116 = _872 == 0;
                    int _1118 = _1114;
                    if (_942)
                    {
                        _1118 = _334;
                    }
                    int _1120 = _1118;
                    bool _1122 = _872 == 12;
                    int _1124 = _1120;
                    if (_908)
                    {
                        _1124 = _336;
                    }
                    int _1126 = _1124;
                    bool _1128 = _872 == 8;
                    int _1130 = _1126;
                    if (_882)
                    {
                        _1130 = _338;
                    }
                    int _1132 = _1130;
                    int _1134 = _1132;
                    if (_884)
                    {
                        _1134 = _340;
                    }
                    int _1136 = _1134;
                    int _1138 = _1136;
                    if (_886)
                    {
                        _1138 = _342;
                    }
                    int _1140 = _1138;
                    int _1142 = _1140 + 1;
                    _654 = _1142;
                    if (_1116)
                    {
                        _550 = _1142;
                    }
                    int _1144 = _550;
                    bool _1146 = _872 == 16;
                    _600 = _1144;
                    if (_1110)
                    {
                        _552 = _1142;
                    }
                    int _1148 = _552;
                    bool _1150 = _872 == 20;
                    _602 = _1148;
                    if (_1128)
                    {
                        _554 = _1142;
                    }
                    int _1152 = _554;
                    bool _1154 = _872 == 24;
                    _604 = _1152;
                    if (_1122)
                    {
                        _556 = _1142;
                    }
                    int _1156 = _556;
                    bool _1158 = _872 == 28;
                    _606 = _1156;
                    if (_882)
                    {
                        _558 = _1142;
                    }
                    int _1160 = _558;
                    _644 = _1160;
                    if (_884)
                    {
                        _560 = _1142;
                    }
                    int _1162 = _560;
                    _646 = _1162;
                    if (_886)
                    {
                        _562 = _1142;
                    }
                    int _1164 = _562;
                    _648 = _1164;
                    if (_1146)
                    {
                        _564 = _1142;
                    }
                    int _1166 = _564;
                    bool _1168 = _872 == 32;
                    _608 = _1166;
                    if (_1150)
                    {
                        _566 = _1142;
                    }
                    int _1170 = _566;
                    bool _1172 = _872 == 36;
                    _610 = _1170;
                    if (_1154)
                    {
                        _568 = _1142;
                    }
                    int _1174 = _568;
                    bool _1176 = _872 == 40;
                    _612 = _1174;
                    if (_1158)
                    {
                        _570 = _1142;
                    }
                    int _1178 = _570;
                    bool _1180 = _872 == 44;
                    _614 = _1178;
                    if (_1168)
                    {
                        _572 = _1142;
                    }
                    int _1182 = _572;
                    bool _1184 = _872 == 48;
                    _616 = _1182;
                    if (_1172)
                    {
                        _574 = _1142;
                    }
                    int _1186 = _574;
                    bool _1188 = _872 == 52;
                    _618 = _1186;
                    if (_1176)
                    {
                        _576 = _1142;
                    }
                    int _1190 = _576;
                    bool _1192 = _872 == 56;
                    _620 = _1190;
                    if (_1180)
                    {
                        _578 = _1142;
                    }
                    int _1194 = _578;
                    bool _1196 = _872 == 60;
                    _622 = _1194;
                    if (_1184)
                    {
                        _580 = _1142;
                    }
                    int _1198 = _580;
                    bool _1200 = _872 == 64;
                    _624 = _1198;
                    if (_1188)
                    {
                        _582 = _1142;
                    }
                    int _1202 = _582;
                    bool _1204 = _872 == 68;
                    _626 = _1202;
                    if (_1192)
                    {
                        _584 = _1142;
                    }
                    int _1206 = _584;
                    bool _1208 = _936 != 0;
                    _628 = _1206;
                    if (_1196)
                    {
                        _586 = _1142;
                    }
                    int _1210 = _586;
                    bool _1212 = _1010 != 0;
                    _630 = _1210;
                    if (_1200)
                    {
                        _588 = _1142;
                    }
                    int _1214 = _588;
                    _632 = _1214;
                    if (_1204)
                    {
                        _590 = _1142;
                    }
                    int _1216 = _590;
                    bool _1218 = _982 != 0;
                    _634 = _1216;
                    if (_1208)
                    {
                        _592 = _1142;
                    }
                    int _1220 = _592;
                    bool _1222 = _1104 != 0;
                    _642 = _1220;
                    if (_1212)
                    {
                        _594 = _1142;
                    }
                    int _1224 = _594;
                    _640 = _1224;
                    if (_1218)
                    {
                        _596 = _1142;
                    }
                    int _1226 = _596;
                    _638 = _1226;
                    if (_1222)
                    {
                        _636 = _1142;
                    }
                }
            }
            _1228 = _598;
            int _1230 = _600;
            int _1232 = _602;
            int _1234 = _604;
            int _1236 = _606;
            int _1238 = _608;
            int _1240 = _610;
            int _1242 = _612;
            int _1244 = _614;
            int _1246 = _616;
            int _1248 = _618;
            int _1250 = _620;
            int _1252 = _622;
            int _1254 = _624;
            int _1256 = _626;
            int _1258 = _628;
            int _1260 = _630;
            int _1262 = _632;
            int _1264 = _634;
            int _1266 = _636;
            int _1268 = _638;
            int _1270 = _640;
            int _1272 = _642;
            int _1274 = _644;
            int _1276 = _646;
            int _1278 = _648;
            int _1280 = _650;
            int _1282 = _652;
            int _1284 = _654;
            int _1286 = _656;
            int _1288 = _344 + 1;
            bool _1290 = _1288 >= 3;
            _280 = !_1290;
            _226 = _1228;
            _228 = _1230;
            _230 = _1232;
            _232 = _1234;
            _234 = _1236;
            _236 = _1238;
            _238 = _1240;
            _240 = _1242;
            _242 = _1244;
            _244 = _1246;
            _246 = _1248;
            _248 = _1250;
            _250 = _1252;
            _252 = _1254;
            _254 = _1256;
            _256 = _1258;
            _258 = _1260;
            _260 = _1262;
            _262 = _1264;
            _264 = _1266;
            _266 = _1268;
            _268 = _1270;
            _270 = _1272;
            _272 = _1274;
            _274 = _1276;
            _276 = _1278;
            _278 = _1288;
            _740 = _1230;
            _746 = _1232;
            _752 = _1234;
            _758 = _1236;
            _734 = _1238;
            _764 = _1240;
            _770 = _1242;
            _782 = _1244;
            _788 = _1246;
            _794 = _1248;
            _800 = _1250;
            _776 = _1252;
            _806 = _1254;
            _812 = _1256;
            _822 = _1258;
            _828 = _1260;
            _834 = _1262;
            _840 = _1264;
            _818 = _1266;
            _846 = _1268;
            _850 = _1270;
            _854 = _1272;
            _858 = _1274;
            _862 = _1276;
            _866 = _1278;
            _658 = _1280;
            _726 = _1282;
            _660 = _1284;
            _728 = _1286;
        } while (_280);
        if (!_870)
        {
            _868 = _1228;
        }
        _870 = false;
        _1292 = _740;
        _1294 = _746;
        _1296 = _752;
        _1298 = _758;
        _1300 = _734;
        _1302 = _764;
        _1304 = _770;
        _1306 = _782;
        _1308 = _788;
        _1310 = _794;
        _1312 = _800;
        _1314 = _776;
        _1316 = _806;
        _1318 = _812;
        _1320 = _822;
        _1322 = _828;
        _1324 = _834;
        _1326 = _840;
        _1328 = _818;
        _1330 = _846;
        _1332 = _850;
        _1334 = _854;
        _1336 = _858;
        _1338 = _862;
        _1340 = _866;
        _1342 = _868;
        int _1344 = _658;
        int _1346 = _726;
        int _1348 = _660;
        int _1350 = _728;
        int _1352 = _144 + 1;
        bool _1354 = _1352 >= 3;
        _142 = !_1354;
        _86 = _1352;
        _88 = _1342;
        _90 = _1292;
        _92 = _1294;
        _94 = _1296;
        _96 = _1298;
        _98 = _1300;
        _100 = _1302;
        _102 = _1304;
        _104 = _1306;
        _106 = _1308;
        _108 = _1310;
        _110 = _1312;
        _112 = _1314;
        _114 = _1316;
        _116 = _1318;
        _118 = _1320;
        _120 = _1322;
        _122 = _1324;
        _124 = _1326;
        _126 = _1328;
        _128 = _1330;
        _130 = _1332;
        _132 = _1334;
        _134 = _1336;
        _136 = _1338;
        _138 = _1340;
        _1356 = _1344;
        _1358 = _1346;
        _1360 = _1348;
        _1362 = _1350;
        _1364 = _1344;
        _1366 = _1292;
    } while (_142);
    bool _1368 = _1342 > 0;
    if (!_1368)
    {
        _662 = 0;
    }
    int _1370 = _662;
    bool _1372 = !_1368;
    int _1374 = _1370;
    if (!_1372)
    {
        bool _1376 = _1342 > 3;
        bool _1378 = !_1376;
        int _1380 = 0;
        int _1382 = 0;
        int _1384 = 0;
        int _1386 = 0;
        int _1388 = 0;
        int _1390 = -1;
        int _1392 = 0;
        if (!_1378)
        {
            int _1394 = _1342 + (-3);
            _1390 = 0;
            bool _1396;
            do
            {
                int _1398 = _1380;
                int _1400 = _1382;
                int _1402 = _1356;
                int _1404 = _1358;
                int _1406 = _1360;
                int _1408 = _1384;
                int _1410 = _1362;
                int _1412 = _1398 * 4;
                int _1414 = _1398 + 1;
                int _1416 = _1398 + 2;
                bool _1418 = _1412 == 0;
                int _1420 = _1414 * 4;
                bool _1422 = _1412 == 4;
                int _1424 = _1416 * 4;
                bool _1426 = _1412 == 8;
                bool _1428 = _1412 == 12;
                bool _1430 = _1412 == 16;
                bool _1432 = _1420 == 8;
                int _1434 = _1398 + 3;
                int _1436 = _1402;
                int _1438 = _1404;
                int _1440 = _1406;
                int _1442 = _1410;
                int _1444 = _1400;
                int _1446 = _1408;
                if (_1418)
                {
                    _1436 = _1292;
                }
                int _1448 = _1436;
                bool _1450 = _1412 == 24;
                int _1452 = _1448;
                if (_1422)
                {
                    _1452 = _1294;
                }
                int _1454 = _1452;
                bool _1456 = _1412 == 20;
                int _1458 = _1454;
                if (_1426)
                {
                    _1458 = _1296;
                }
                int _1460 = _1458;
                bool _1462 = _1412 == 32;
                int _1464 = _1460;
                if (_1428)
                {
                    _1464 = _1298;
                }
                int _1466 = _1464;
                bool _1468 = _1412 == 28;
                int _1470 = _1466;
                if (_1430)
                {
                    _1470 = _1300;
                }
                int _1472 = _1470;
                bool _1474 = _1412 == 40;
                int _1476 = _1434 * 4;
                int _1478 = _1472;
                if (_1456)
                {
                    _1478 = _1302;
                }
                int _1480 = _1478;
                bool _1482 = _1412 == 36;
                int _1484 = _1480;
                if (_1450)
                {
                    _1484 = _1304;
                }
                int _1486 = _1484;
                bool _1488 = _1420 == 0;
                int _1490 = _1486;
                if (_1468)
                {
                    _1490 = _1306;
                }
                int _1492 = _1490;
                bool _1494 = _1420 == 4;
                int _1496 = _1492;
                if (_1462)
                {
                    _1496 = _1308;
                }
                int _1498 = _1496;
                bool _1500 = _1420 == 12;
                int _1502 = _1498;
                if (_1482)
                {
                    _1502 = _1310;
                }
                int _1504 = _1502;
                bool _1506 = _1412 == 44;
                int _1508 = _1504;
                if (_1474)
                {
                    _1508 = _1312;
                }
                int _1510 = _1508;
                bool _1512 = _1420 == 16;
                int _1514 = _1510;
                if (_1488)
                {
                    _1438 = _1292;
                }
                int _1516 = _1438;
                bool _1518 = _1412 == 48;
                int _1520 = _1516;
                if (_1494)
                {
                    _1520 = _1294;
                }
                int _1522 = _1520;
                int _1524 = _1522;
                if (_1432)
                {
                    _1524 = _1296;
                }
                int _1526 = _1524;
                bool _1528 = _1420 == 20;
                int _1530 = _1526;
                if (_1500)
                {
                    _1530 = _1298;
                }
                int _1532 = _1530;
                bool _1534 = _1420 == 24;
                bool _1536 = _1420 == 28;
                int _1538 = _1532;
                if (_1506)
                {
                    _1514 = _1314;
                }
                int _1540 = _1514;
                bool _1542 = _1412 == 52;
                int _1544 = _1540;
                if (_1512)
                {
                    _1538 = _1300;
                }
                int _1546 = _1538;
                bool _1548 = _1420 == 32;
                int _1550 = _1546;
                if (_1518)
                {
                    _1544 = _1316;
                }
                int _1552 = _1544;
                bool _1554 = _1412 == 56;
                int _1556 = _1552;
                if (_1528)
                {
                    _1550 = _1302;
                }
                int _1558 = _1550;
                bool _1560 = _1420 == 36;
                int _1562 = _1558;
                if (_1534)
                {
                    _1562 = _1304;
                }
                int _1564 = _1562;
                bool _1566 = _1420 == 40;
                int _1568 = _1564;
                if (_1536)
                {
                    _1568 = _1306;
                }
                int _1570 = _1568;
                bool _1572 = _1420 == 44;
                int _1574 = _1570;
                if (_1542)
                {
                    _1556 = _1318;
                }
                int _1576 = _1556;
                bool _1578 = _1412 == 60;
                int _1580 = _1576;
                if (_1548)
                {
                    _1574 = _1308;
                }
                int _1582 = _1574;
                bool _1584 = _1420 == 48;
                int _1586 = _1582;
                if (_1554)
                {
                    _1580 = _1320;
                }
                int _1588 = _1580;
                bool _1590 = _1412 == 64;
                int _1592 = _1588;
                if (_1560)
                {
                    _1586 = _1310;
                }
                int _1594 = _1586;
                bool _1596 = _1420 == 52;
                int _1598 = _1594;
                if (_1566)
                {
                    _1598 = _1312;
                }
                int _1600 = _1598;
                bool _1602 = _1420 == 56;
                int _1604 = _1600;
                if (_1572)
                {
                    _1604 = _1314;
                }
                int _1606 = _1604;
                bool _1608 = _1420 == 60;
                int _1610 = _1606;
                if (_1578)
                {
                    _1592 = _1322;
                }
                int _1612 = _1592;
                bool _1614 = _1424 == 0;
                int _1616 = _1612;
                if (_1584)
                {
                    _1610 = _1316;
                }
                int _1618 = _1610;
                bool _1620 = _1412 == 68;
                int _1622 = _1618;
                if (_1590)
                {
                    _1616 = _1324;
                }
                int _1624 = _1616;
                bool _1626 = _1424 == 4;
                int _1628 = _1624;
                if (_1596)
                {
                    _1622 = _1318;
                }
                int _1630 = _1622;
                bool _1632 = _1424 == 8;
                int _1634 = _1630;
                if (_1602)
                {
                    _1634 = _1320;
                }
                int _1636 = _1634;
                bool _1638 = _1424 == 12;
                int _1640 = _1636;
                if (_1608)
                {
                    _1640 = _1322;
                }
                int _1642 = _1640;
                bool _1644 = _1424 == 16;
                int _1646 = _1642;
                if (_1614)
                {
                    _1440 = _1292;
                }
                int _1648 = _1440;
                bool _1650 = _1420 == 64;
                int _1652 = _1648;
                if (_1620)
                {
                    _1628 = _1326;
                }
                int _1654 = _1628;
                bool _1656 = _1424 == 20;
                int _1658 = _1654;
                if (_1626)
                {
                    _1652 = _1294;
                }
                int _1660 = _1652;
                bool _1662 = _1412 == 72;
                int _1664 = _1660;
                if (_1632)
                {
                    _1664 = _1296;
                }
                int _1666 = _1664;
                bool _1668 = _1424 == 24;
                int _1670 = _1666;
                if (_1638)
                {
                    _1670 = _1298;
                }
                int _1672 = _1670;
                bool _1674 = _1424 == 28;
                int _1676 = _1672;
                if (_1644)
                {
                    _1676 = _1300;
                }
                int _1678 = _1676;
                int _1680 = _1678;
                if (_1650)
                {
                    _1646 = _1324;
                }
                int _1682 = _1646;
                bool _1684 = _1420 == 68;
                int _1686 = _1682;
                if (_1656)
                {
                    _1680 = _1302;
                }
                int _1688 = _1680;
                bool _1690 = _1424 == 32;
                int _1692 = _1688;
                if (_1662)
                {
                    _1658 = _1328;
                }
                int _1694 = _1658;
                bool _1696 = _1424 == 36;
                bool _1698 = _1412 == 76;
                int _1700 = _1694;
                if (_1668)
                {
                    _1692 = _1304;
                }
                int _1702 = _1692;
                bool _1704 = _1424 == 40;
                int _1706 = _1702;
                if (_1674)
                {
                    _1706 = _1306;
                }
                int _1708 = _1706;
                bool _1710 = _1424 == 44;
                int _1712 = _1708;
                if (_1684)
                {
                    _1686 = _1326;
                }
                int _1714 = _1686;
                bool _1716 = _1420 == 72;
                int _1718 = _1714;
                if (_1690)
                {
                    _1712 = _1308;
                }
                int _1720 = _1712;
                bool _1722 = _1424 == 48;
                int _1724 = _1720;
                if (_1696)
                {
                    _1724 = _1310;
                }
                int _1726 = _1724;
                bool _1728 = _1424 == 52;
                int _1730 = _1726;
                if (_1698)
                {
                    _1700 = _1330;
                }
                int _1732 = _1700;
                bool _1734 = _1412 == 80;
                int _1736 = _1732;
                if (_1704)
                {
                    _1730 = _1312;
                }
                int _1738 = _1730;
                bool _1740 = _1424 == 56;
                int _1742 = _1738;
                if (_1710)
                {
                    _1742 = _1314;
                }
                int _1744 = _1742;
                bool _1746 = _1424 == 60;
                int _1748 = _1744;
                if (_1716)
                {
                    _1718 = _1328;
                }
                int _1750 = _1718;
                bool _1752 = _1424 == 64;
                int _1754 = _1750;
                if (_1722)
                {
                    _1748 = _1316;
                }
                int _1756 = _1748;
                bool _1758 = _1420 == 76;
                int _1760 = _1756;
                if (_1728)
                {
                    _1760 = _1318;
                }
                int _1762 = _1760;
                bool _1764 = _1412 == 84;
                int _1766 = _1762;
                if (_1734)
                {
                    _1736 = _1332;
                }
                int _1768 = _1736;
                bool _1770 = _1424 == 68;
                int _1772 = _1768;
                if (_1740)
                {
                    _1766 = _1320;
                }
                int _1774 = _1766;
                bool _1776 = _1424 == 72;
                int _1778 = _1774;
                if (_1746)
                {
                    _1778 = _1322;
                }
                int _1780 = _1778;
                bool _1782 = _1424 == 76;
                int _1784 = _1780;
                if (_1752)
                {
                    _1784 = _1324;
                }
                int _1786 = _1784;
                bool _1788 = _1476 == 0;
                int _1790 = _1786;
                if (_1758)
                {
                    _1754 = _1330;
                }
                int _1792 = _1754;
                bool _1794 = _1420 == 80;
                int _1796 = _1792;
                if (_1764)
                {
                    _1772 = _1334;
                }
                int _1798 = _1772;
                bool _1800 = _1476 == 4;
                int _1802 = _1798;
                if (_1770)
                {
                    _1790 = _1326;
                }
                int _1804 = _1790;
                bool _1806 = _1424 == 80;
                int _1808 = _1804;
                if (_1776)
                {
                    _1808 = _1328;
                }
                int _1810 = _1808;
                bool _1812 = _1476 == 8;
                int _1814 = _1810;
                if (_1782)
                {
                    _1814 = _1330;
                }
                int _1816 = _1814;
                bool _1818 = _1412 == 88;
                int _1820 = _1816;
                if (_1788)
                {
                    _1442 = _1292;
                }
                int _1822 = _1442;
                bool _1824 = _1476 == 12;
                int _1826 = _1822;
                if (_1794)
                {
                    _1796 = _1332;
                }
                int _1828 = _1796;
                bool _1830 = _1420 == 84;
                int _1832 = _1828;
                if (_1800)
                {
                    _1826 = _1294;
                }
                int _1834 = _1826;
                int _1836 = _1834;
                if (_1806)
                {
                    _1820 = _1332;
                }
                int _1838 = _1820;
                bool _1840 = _1424 == 84;
                int _1842 = _1838;
                if (_1812)
                {
                    _1836 = _1296;
                }
                int _1844 = _1836;
                bool _1846 = _1476 == 16;
                int _1848 = _1844;
                if (_1818)
                {
                    _1802 = _1336;
                }
                int _1850 = _1802;
                bool _1852 = _1412 == 92;
                bool _1854 = _1476 == 20;
                int _1856 = _1850;
                if (_1824)
                {
                    _1848 = _1298;
                }
                int _1858 = _1848;
                bool _1860 = _1420 == 88;
                int _1862 = _1858;
                if (_1830)
                {
                    _1832 = _1334;
                }
                int _1864 = _1832;
                bool _1866 = _1476 == 24;
                int _1868 = _1864;
                if (_1840)
                {
                    _1842 = _1334;
                }
                int _1870 = _1842;
                bool _1872 = _1424 == 88;
                int _1874 = _1870;
                if (_1846)
                {
                    _1862 = _1300;
                }
                int _1876 = _1862;
                bool _1878 = _1476 == 28;
                int _1880 = _1876;
                if (_1852)
                {
                    _1856 = _1338;
                }
                int _1882 = _1856;
                bool _1884 = _1476 == 32;
                int _1886 = _1882;
                if (_1854)
                {
                    _1880 = _1302;
                }
                int _1888 = _1880;
                bool _1890 = _1412 == 96;
                int _1892 = _1888;
                if (_1860)
                {
                    _1868 = _1336;
                }
                int _1894 = _1868;
                bool _1896 = _1476 == 40;
                int _1898 = _1894;
                if (_1866)
                {
                    _1892 = _1304;
                }
                int _1900 = _1892;
                bool _1902 = _1476 == 36;
                int _1904 = _1900;
                if (_1872)
                {
                    _1874 = _1336;
                }
                int _1906 = _1874;
                bool _1908 = _1420 == 92;
                int _1910 = _1906;
                if (_1878)
                {
                    _1904 = _1306;
                }
                int _1912 = _1904;
                bool _1914 = _1476 == 44;
                int _1916 = _1912;
                if (_1884)
                {
                    _1916 = _1308;
                }
                int _1918 = _1916;
                bool _1920 = _1476 == 48;
                int _1922 = _1918;
                if (_1890)
                {
                    _1886 = _1340;
                }
                int _1924 = _1886;
                bool _1926 = _1420 == 96;
                int _1928 = _1924;
                if (_1902)
                {
                    _1922 = _1310;
                }
                int _1930 = _1922;
                bool _1932 = _1476 == 52;
                int _1934 = _1930;
                if (_1896)
                {
                    _1934 = _1312;
                }
                int _1936 = _1934;
                bool _1938 = _1400 >= _1924;
                int _1940 = _1936;
                if (_1908)
                {
                    _1898 = _1338;
                }
                int _1942 = _1898;
                bool _1944 = _1476 == 56;
                int _1946 = _1942;
                if (_1914)
                {
                    _1940 = _1314;
                }
                int _1948 = _1940;
                bool _1950 = _1476 == 60;
                int _1952 = _1948;
                if (_1920)
                {
                    _1952 = _1316;
                }
                int _1954 = _1952;
                bool _1956 = _1476 == 64;
                int _1958 = _1954;
                if (_1926)
                {
                    _1946 = _1340;
                }
                int _1960 = _1946;
                bool _1962 = _1424 == 92;
                _1358 = _1960;
                if (_1932)
                {
                    _1958 = _1318;
                }
                int _1964 = _1958;
                bool _1966 = _1476 == 68;
                int _1968 = _1964;
                if (!_1938)
                {
                    _1444 = _1924;
                }
                int _1970 = _1444;
                int _1972 = _1970;
                if (_1944)
                {
                    _1968 = _1320;
                }
                int _1974 = _1968;
                bool _1976 = _1476 == 72;
                int _1978 = _1974;
                if (_1950)
                {
                    _1978 = _1322;
                }
                int _1980 = _1978;
                bool _1982 = _1970 >= _1960;
                int _1984 = _1980;
                if (_1956)
                {
                    _1984 = _1324;
                }
                int _1986 = _1984;
                int _1988 = _1986;
                if (_1962)
                {
                    _1910 = _1338;
                }
                int _1990 = _1910;
                bool _1992 = _1424 == 96;
                bool _1994 = _1476 == 76;
                int _1996 = _1990;
                if (_1966)
                {
                    _1988 = _1326;
                }
                int _1998 = _1988;
                bool _2000 = _1476 == 80;
                int _2002 = _1998;
                if (_1976)
                {
                    _2002 = _1328;
                }
                int _2004 = _2002;
                bool _2006 = _1476 == 84;
                int _2008 = _2004;
                if (_1982)
                {
                    _1928 = _1970;
                }
                int _2010 = _1928;
                int _2012 = _2010;
                if (!_1982)
                {
                    _2012 = _1960;
                }
                int _2014 = _2012;
                int _2016 = _2014;
                if (_1992)
                {
                    _1996 = _1340;
                }
                int _2018 = _1996;
                bool _2020 = _1476 == 88;
                _1360 = _2018;
                if (_1994)
                {
                    _2008 = _1330;
                }
                int _2022 = _2008;
                bool _2024 = _1476 == 92;
                int _2026 = _2022;
                if (_2000)
                {
                    _2026 = _1332;
                }
                int _2028 = _2026;
                bool _2030 = _2014 >= _2018;
                int _2032 = _2028;
                if (_1938)
                {
                    _1972 = _1408;
                }
                int _2034 = _1972;
                int _2036 = _2034;
                if (_2006)
                {
                    _2032 = _1334;
                }
                int _2038 = _2032;
                bool _2040 = _1476 == 96;
                int _2042 = _2038;
                if (!_1938)
                {
                    _2036 = _1398;
                }
                int _2044 = _2036;
                int _2046 = _1398 + 4;
                _1380 = _2046;
                int _2048 = _2044;
                _1386 = _2046;
                if (!_1982)
                {
                    _2048 = _1414;
                }
                int _2050 = _2048;
                int _2052 = _2050;
                if (_2020)
                {
                    _2042 = _1336;
                }
                int _2054 = _2042;
                bool _2056 = _2046 >= _1394;
                int _2058 = _2054;
                if (_2024)
                {
                    _2058 = _1338;
                }
                int _2060 = _2058;
                int _2062 = _2060;
                if (!_2030)
                {
                    _2016 = _2018;
                }
                int _2064 = _2016;
                _1356 = _2064;
                _1364 = _2064;
                if (!_2030)
                {
                    _2052 = _1416;
                }
                int _2066 = _2052;
                int _2068 = _2066;
                if (_2040)
                {
                    _2062 = _1340;
                }
                int _2070 = _2062;
                bool _2072 = _2064 >= _2070;
                _1362 = _2070;
                if (_2072)
                {
                    _1446 = _2066;
                }
                int _2074 = _1446;
                int _2076 = _2074;
                if (_2072)
                {
                    _2068 = _2064;
                }
                int _2078 = _2068;
                int _2080 = _2078;
                if (!_2072)
                {
                    _2076 = _1434;
                }
                int _2082 = _2076;
                _1384 = _2082;
                _1392 = _2082;
                if (!_2072)
                {
                    _2080 = _2070;
                }
                int _2084 = _2080;
                _1396 = !_2056;
                _1382 = _2084;
                _1388 = _2084;
            } while (_1396);
        }
        int _2086 = _1386;
        int _2088 = _1388;
        int _2090 = _1364;
        int _2092 = _1390;
        int _2094 = _1392;
        int _2096 = -_2086;
        int _2098 = _1342 + _2096;
        bool _2100 = _2098 > 1;
        bool _2102 = !_2100;
        int _2104 = _2090;
        int _2106 = _2098;
        int _2108 = _2088;
        int _2110 = _2094;
        int _2112 = _2086;
        int _2114 = _2092;
        int _2116 = _2088;
        int _2118 = _2094;
        if (!_2102)
        {
            int _2120 = _2086 * 4;
            int _2122 = _2086 + 1;
            bool _2124 = _2120 == 0;
            int _2126 = _2122 * 4;
            bool _2128 = _2120 == 4;
            bool _2130 = _2120 == 8;
            bool _2132 = _2120 == 12;
            bool _2134 = _2120 == 24;
            bool _2136 = _2126 == 0;
            bool _2138 = _2120 == 40;
            if (_2124)
            {
                _2104 = _1292;
            }
            int _2140 = _2104;
            bool _2142 = _2120 == 16;
            int _2144 = _2140;
            if (_2128)
            {
                _2144 = _1294;
            }
            int _2146 = _2144;
            bool _2148 = _2120 == 20;
            int _2150 = _2146;
            if (_2130)
            {
                _2150 = _1296;
            }
            int _2152 = _2150;
            bool _2154 = _2120 == 36;
            int _2156 = _2152;
            if (_2132)
            {
                _2156 = _1298;
            }
            int _2158 = _2156;
            bool _2160 = _2120 == 28;
            int _2162 = _2158;
            if (_2136)
            {
                _2106 = _1292;
            }
            int _2164 = _2106;
            bool _2166 = _2126 == 16;
            int _2168 = _2164;
            if (_2142)
            {
                _2162 = _1300;
            }
            int _2170 = _2162;
            bool _2172 = _2120 == 32;
            int _2174 = _2170;
            if (_2148)
            {
                _2174 = _1302;
            }
            int _2176 = _2174;
            bool _2178 = _2120 == 48;
            int _2180 = _2176;
            if (_2134)
            {
                _2180 = _1304;
            }
            int _2182 = _2180;
            bool _2184 = _2126 == 4;
            int _2186 = _2182;
            if (_2160)
            {
                _2186 = _1306;
            }
            int _2188 = _2186;
            bool _2190 = _2120 == 44;
            int _2192 = _2188;
            if (_2172)
            {
                _2192 = _1308;
            }
            int _2194 = _2192;
            bool _2196 = _2126 == 8;
            int _2198 = _2194;
            if (_2154)
            {
                _2198 = _1310;
            }
            int _2200 = _2198;
            bool _2202 = _2126 == 12;
            int _2204 = _2200;
            if (_2184)
            {
                _2168 = _1294;
            }
            int _2206 = _2168;
            bool _2208 = _2120 == 52;
            int _2210 = _2206;
            if (_2138)
            {
                _2204 = _1312;
            }
            int _2212 = _2204;
            bool _2214 = _2126 == 20;
            int _2216 = _2212;
            if (_2190)
            {
                _2216 = _1314;
            }
            int _2218 = _2216;
            bool _2220 = _2126 == 24;
            int _2222 = _2218;
            if (_2178)
            {
                _2222 = _1316;
            }
            int _2224 = _2222;
            bool _2226 = _2120 == 60;
            int _2228 = _2224;
            if (_2196)
            {
                _2210 = _1296;
            }
            int _2230 = _2210;
            bool _2232 = _2120 == 56;
            int _2234 = _2230;
            if (_2202)
            {
                _2234 = _1298;
            }
            int _2236 = _2234;
            bool _2238 = _2126 == 28;
            int _2240 = _2236;
            if (_2166)
            {
                _2240 = _1300;
            }
            int _2242 = _2240;
            bool _2244 = _2126 == 32;
            int _2246 = _2242;
            if (_2214)
            {
                _2246 = _1302;
            }
            int _2248 = _2246;
            bool _2250 = _2126 == 36;
            int _2252 = _2248;
            if (_2208)
            {
                _2228 = _1318;
            }
            int _2254 = _2228;
            bool _2256 = _2120 == 64;
            int _2258 = _2254;
            if (_2220)
            {
                _2252 = _1304;
            }
            int _2260 = _2252;
            bool _2262 = _2120 == 68;
            int _2264 = _2260;
            if (_2232)
            {
                _2258 = _1320;
            }
            int _2266 = _2258;
            bool _2268 = _2126 == 40;
            int _2270 = _2266;
            if (_2238)
            {
                _2264 = _1306;
            }
            int _2272 = _2264;
            bool _2274 = _2120 == 72;
            int _2276 = _2272;
            if (_2226)
            {
                _2270 = _1322;
            }
            int _2278 = _2270;
            bool _2280 = _2126 == 44;
            int _2282 = _2278;
            if (_2244)
            {
                _2276 = _1308;
            }
            int _2284 = _2276;
            bool _2286 = _2126 == 48;
            int _2288 = _2284;
            if (_2250)
            {
                _2288 = _1310;
            }
            int _2290 = _2288;
            bool _2292 = _2120 == 76;
            int _2294 = _2290;
            if (_2256)
            {
                _2282 = _1324;
            }
            int _2296 = _2282;
            bool _2298 = _2126 == 52;
            int _2300 = _2296;
            if (_2262)
            {
                _2300 = _1326;
            }
            int _2302 = _2300;
            bool _2304 = _2120 == 80;
            int _2306 = _2302;
            if (_2268)
            {
                _2294 = _1312;
            }
            int _2308 = _2294;
            bool _2310 = _2126 == 56;
            int _2312 = _2308;
            if (_2274)
            {
                _2306 = _1328;
            }
            int _2314 = _2306;
            int _2316 = _2314;
            if (_2280)
            {
                _2312 = _1314;
            }
            int _2318 = _2312;
            bool _2320 = _2120 == 84;
            int _2322 = _2318;
            if (_2286)
            {
                _2322 = _1316;
            }
            int _2324 = _2322;
            bool _2326 = _2126 == 60;
            int _2328 = _2324;
            if (_2292)
            {
                _2316 = _1330;
            }
            int _2330 = _2316;
            bool _2332 = _2120 == 88;
            int _2334 = _2330;
            if (_2298)
            {
                _2328 = _1318;
            }
            int _2336 = _2328;
            bool _2338 = _2126 == 64;
            int _2340 = _2336;
            if (_2304)
            {
                _2334 = _1332;
            }
            int _2342 = _2334;
            bool _2344 = _2120 == 92;
            int _2346 = _2342;
            if (_2310)
            {
                _2340 = _1320;
            }
            int _2348 = _2340;
            bool _2350 = _2126 == 68;
            bool _2352 = _2126 == 72;
            int _2354 = _2348;
            if (_2320)
            {
                _2346 = _1334;
            }
            int _2356 = _2346;
            bool _2358 = _2120 == 96;
            int _2360 = _2356;
            if (_2326)
            {
                _2354 = _1322;
            }
            int _2362 = _2354;
            bool _2364 = _2126 == 76;
            int _2366 = _2362;
            if (_2332)
            {
                _2360 = _1336;
            }
            int _2368 = _2360;
            int _2370 = _2368;
            if (_2338)
            {
                _2366 = _1324;
            }
            int _2372 = _2366;
            bool _2374 = _2126 == 80;
            int _2376 = _2372;
            if (_2344)
            {
                _2370 = _1338;
            }
            int _2378 = _2370;
            bool _2380 = _2126 == 96;
            int _2382 = _2378;
            if (_2350)
            {
                _2376 = _1326;
            }
            int _2384 = _2376;
            bool _2386 = _2126 == 84;
            int _2388 = _2384;
            if (_2352)
            {
                _2388 = _1328;
            }
            int _2390 = _2388;
            bool _2392 = _2126 == 88;
            int _2394 = _2390;
            if (_2358)
            {
                _2382 = _1340;
            }
            int _2396 = _2382;
            bool _2398 = _2126 == 92;
            if (_2364)
            {
                _2394 = _1330;
            }
            int _2400 = _2394;
            bool _2402 = _2088 >= _2396;
            int _2404 = _2400;
            if (_2374)
            {
                _2404 = _1332;
            }
            int _2406 = _2404;
            int _2408 = _2406;
            if (_2386)
            {
                _2408 = _1334;
            }
            int _2410 = _2408;
            int _2412 = _2410;
            if (_2392)
            {
                _2412 = _1336;
            }
            int _2414 = _2412;
            int _2416 = _2414;
            _2114 = 0;
            if (_2398)
            {
                _2416 = _1338;
            }
            int _2418 = _2416;
            int _2420 = _2418;
            if (_2380)
            {
                _2420 = _1340;
            }
            int _2422 = _2420;
            if (!_2402)
            {
                _2108 = _2396;
            }
            int _2424 = _2108;
            _2116 = _2424;
            if (!_2402)
            {
                _2110 = _2086;
            }
            int _2426 = _2110;
            int _2428 = _2122 + 1;
            bool _2430 = _2424 >= _2422;
            int _2432 = _2426;
            _2112 = _2428;
            if (!_2430)
            {
                _2432 = _2122;
            }
            int _2434 = _2432;
            _2118 = _2434;
            if (!_2430)
            {
                _2116 = _2422;
            }
        }
        int _2436 = _2112;
        int _2438 = _2114;
        int _2440 = _2116;
        int _2442 = _2118;
        bool _2444 = _2436 < _1342;
        int _2446 = (_2444 ? (-1) : 0) | _2438;
        int _2448 = ~_2446;
        int _2450 = _2442;
        if (!(_2448 != 0))
        {
            int _2452 = _2436 * 4;
            bool _2454 = _2452 == 4;
            bool _2456 = _2452 == 8;
            bool _2458 = _2452 == 12;
            bool _2460 = _2452 == 16;
            if (_2454)
            {
                _1366 = _1294;
            }
            int _2462 = _1366;
            bool _2464 = _2452 == 20;
            int _2466 = _2462;
            if (_2456)
            {
                _2466 = _1296;
            }
            int _2468 = _2466;
            bool _2470 = _2452 == 24;
            int _2472 = _2468;
            if (_2458)
            {
                _2472 = _1298;
            }
            int _2474 = _2472;
            bool _2476 = _2452 == 28;
            int _2478 = _2474;
            if (_2460)
            {
                _2478 = _1300;
            }
            int _2480 = _2478;
            bool _2482 = _2452 == 32;
            int _2484 = _2480;
            if (_2464)
            {
                _2484 = _1302;
            }
            int _2486 = _2484;
            bool _2488 = _2452 == 36;
            int _2490 = _2486;
            if (_2470)
            {
                _2490 = _1304;
            }
            int _2492 = _2490;
            bool _2494 = _2452 == 40;
            int _2496 = _2492;
            if (_2476)
            {
                _2496 = _1306;
            }
            int _2498 = _2496;
            bool _2500 = _2452 == 44;
            int _2502 = _2498;
            if (_2482)
            {
                _2502 = _1308;
            }
            int _2504 = _2502;
            bool _2506 = _2452 == 48;
            int _2508 = _2504;
            if (_2488)
            {
                _2508 = _1310;
            }
            int _2510 = _2508;
            bool _2512 = _2452 == 52;
            int _2514 = _2510;
            if (_2494)
            {
                _2514 = _1312;
            }
            int _2516 = _2514;
            bool _2518 = _2452 == 56;
            int _2520 = _2516;
            if (_2500)
            {
                _2520 = _1314;
            }
            int _2522 = _2520;
            bool _2524 = _2452 == 60;
            int _2526 = _2522;
            if (_2506)
            {
                _2526 = _1316;
            }
            int _2528 = _2526;
            bool _2530 = _2452 == 64;
            int _2532 = _2528;
            if (_2512)
            {
                _2532 = _1318;
            }
            int _2534 = _2532;
            bool _2536 = _2452 == 68;
            int _2538 = _2534;
            if (_2518)
            {
                _2538 = _1320;
            }
            int _2540 = _2538;
            bool _2542 = _2452 == 72;
            int _2544 = _2540;
            if (_2524)
            {
                _2544 = _1322;
            }
            int _2546 = _2544;
            bool _2548 = _2452 == 76;
            int _2550 = _2546;
            if (_2530)
            {
                _2550 = _1324;
            }
            int _2552 = _2550;
            bool _2554 = _2452 == 80;
            int _2556 = _2552;
            if (_2536)
            {
                _2556 = _1326;
            }
            int _2558 = _2556;
            bool _2560 = _2452 == 84;
            int _2562 = _2558;
            if (_2542)
            {
                _2562 = _1328;
            }
            int _2564 = _2562;
            bool _2566 = _2452 == 88;
            int _2568 = _2564;
            if (_2548)
            {
                _2568 = _1330;
            }
            int _2570 = _2568;
            bool _2572 = _2452 == 92;
            int _2574 = _2570;
            if (_2554)
            {
                _2574 = _1332;
            }
            int _2576 = _2574;
            bool _2578 = _2452 == 96;
            int _2580 = _2576;
            if (_2560)
            {
                _2580 = _1334;
            }
            int _2582 = _2580;
            int _2584 = _2582;
            if (_2566)
            {
                _2584 = _1336;
            }
            int _2586 = _2584;
            int _2588 = _2586;
            if (_2572)
            {
                _2588 = _1338;
            }
            int _2590 = _2588;
            int _2592 = _2590;
            if (_2578)
            {
                _2592 = _1340;
            }
            int _2594 = _2592;
            bool _2596 = _2440 >= _2594;
            if (!_2596)
            {
                _2450 = _2436;
            }
        }
        int _2598 = _2450;
        _1374 = _2598;
    }
    int _2600 = _1374;
    int _2602 = _2600 * 8;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    float _2606 = as_type<float>(_31[int(_2604)]);
    int _2608 = _2602 + 4;
    uint _2610 = uint(int(uint(_2608) >> uint(2)));
    float _2612 = as_type<float>(_31[int(_2610)]);
    int _2614 = _69 + 16;
    uint _2616 = uint(int(uint(_2614) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2616)] = as_type<uint>(_2606);
    int _2618 = _2614 + 4;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2620)] = as_type<uint>(_2612);
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
    bool _870 = false;
    bool _694 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _2641 = float2((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    float4 _55 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2641, float2(0.0), isnan(_2641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2641, float2(0.0), isnan(_2641)), level(0.0)).xyzw;
    float _58 = _55.x;
    float _60 = _55.y;
    float _62 = _55.z;
    float _64 = _55.w;
    float _66 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _69 = as_type<int>(_66) * 32;
    uint _72 = uint(int(uint(_69) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_72)] = as_type<uint>(_58);
    int _74 = _69 + 4;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_76)] = as_type<uint>(_60);
    int _78 = _69 + 8;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_80)] = as_type<uint>(_62);
    int _82 = _69 + 12;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_84)] = as_type<uint>(_64);
    int _86 = -2;
    int _88 = 0;
    int _90 = 0;
    int _92 = 0;
    int _94 = 0;
    int _96 = 0;
    int _98 = 0;
    int _100 = 0;
    int _102 = 0;
    int _104 = 0;
    int _106 = 0;
    int _108 = 0;
    int _110 = 0;
    int _112 = 0;
    int _114 = 0;
    int _116 = 0;
    int _118 = 0;
    int _120 = 0;
    int _122 = 0;
    int _124 = 0;
    int _126 = 0;
    int _128 = 0;
    int _130 = 0;
    int _132 = 0;
    int _134 = 0;
    int _136 = 0;
    int _138 = 0;
    bool _142;
    bool _280;
    int _658;
    int _660;
    int _662;
    bool _670;
    int _672;
    int _726;
    int _728;
    int _734;
    int _740;
    int _746;
    int _752;
    int _758;
    int _764;
    int _770;
    int _776;
    int _782;
    int _788;
    int _794;
    int _800;
    int _806;
    int _812;
    bool _816;
    int _818;
    int _822;
    int _828;
    int _834;
    int _840;
    int _846;
    int _850;
    int _854;
    int _858;
    int _862;
    int _866;
    int _868;
    int _1228;
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
    int _1332;
    int _1334;
    int _1336;
    int _1338;
    int _1340;
    int _1342;
    int _1356;
    int _1358;
    int _1360;
    int _1362;
    int _1364;
    int _1366;
    do
    {
        int _144 = _86;
        int _146 = _88;
        int _148 = _90;
        int _150 = _92;
        int _152 = _94;
        int _154 = _96;
        int _156 = _98;
        int _158 = _100;
        int _160 = _102;
        int _162 = _104;
        int _164 = _106;
        int _166 = _108;
        int _168 = _110;
        int _170 = _112;
        int _172 = _114;
        int _174 = _116;
        int _176 = _118;
        int _178 = _120;
        int _180 = _122;
        int _182 = _124;
        int _184 = _126;
        int _186 = _128;
        int _188 = _130;
        int _190 = _132;
        int _192 = _134;
        int _194 = _136;
        int _196 = _138;
        float _198 = float(_144);
        float _200 = _198 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _202 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _204 = fma(_200, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2759 = float2(_202, _204);
        float4 _206 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2759, float2(0.0), isnan(_2759)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2759, float2(0.0), isnan(_2759)), level(0.0)).xyzw;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = _206.z;
        float _214 = _206.w;
        int _216 = -2;
        float _218 = _214;
        float _220 = _210;
        float _222 = _212;
        float _224 = _208;
        int _226 = _146;
        int _228 = _148;
        int _230 = _150;
        int _232 = _152;
        int _234 = _154;
        int _236 = _156;
        int _238 = _158;
        int _240 = _160;
        int _242 = _162;
        int _244 = _164;
        int _246 = _166;
        int _248 = _168;
        int _250 = _170;
        int _252 = _172;
        int _254 = _174;
        int _256 = _176;
        int _258 = _178;
        int _260 = _180;
        int _262 = _182;
        int _264 = _184;
        int _266 = _186;
        int _268 = _188;
        int _270 = _190;
        int _272 = _192;
        int _274 = _194;
        int _276 = _196;
        int _278 = -2;
        do
        {
            int _282 = _216;
            float _284 = _218;
            float _286 = _220;
            float _288 = _222;
            float _290 = _224;
            int _292 = _226;
            int _294 = _228;
            int _296 = _230;
            int _298 = _232;
            int _300 = _234;
            int _302 = _236;
            int _304 = _238;
            int _306 = _240;
            int _308 = _242;
            int _310 = _244;
            int _312 = _246;
            int _314 = _248;
            int _316 = _250;
            int _318 = _252;
            int _320 = _254;
            int _322 = _256;
            int _324 = _258;
            int _326 = _260;
            int _328 = _262;
            int _330 = _264;
            int _332 = _266;
            int _334 = _268;
            int _336 = _270;
            int _338 = _272;
            int _340 = _274;
            int _342 = _276;
            int _344 = _278;
            int _346 = _282 + 1;
            float _348 = float(_144);
            float _350 = float(_346);
            float _352 = _348 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _354 = _350 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _356 = 0.0 + _284;
            float _358 = precise::clamp(_356, 0.0, 1.0);
            float _360 = fma(_352, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _362 = 0.0 + _286;
            float _364 = precise::clamp(_362, 0.0, 1.0);
            float _366 = fma(_354, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _368 = 0.0 + _288;
            float _370 = precise::clamp(_368, 0.0, 1.0);
            float _372 = 0.0 + _290;
            float _374 = precise::clamp(_372, 0.0, 1.0);
            float2 _2877 = float2(_366, _360);
            float4 _376 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2877, float2(0.0), isnan(_2877)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2877, float2(0.0), isnan(_2877)), level(0.0)).xyzw;
            float _378 = _376.x;
            float _380 = _376.y;
            float _382 = _376.z;
            float _384 = _376.w;
            float _386 = _358 * 65535.0;
            float _388 = _370 * 65535.0;
            float _390 = _364 * 65535.0;
            float _392 = _374 * 65535.0;
            float _394 = rint(_386);
            int _396 = int(_394);
            float _398 = rint(_388);
            int _400 = int(_398);
            float _402 = rint(_390);
            int _404 = int(_402);
            uint _406 = extract_bits(uint(_396), 0u, 8u);
            int _408 = int(_406) & 255;
            uint _410 = extract_bits(uint(_396), 8u, 8u);
            int _412 = int(_410) & 255;
            int _414 = _412 << 8;
            int _416 = _408 | _414;
            float _418 = rint(_392);
            int _420 = int(_418);
            uint _422 = extract_bits(uint(_416), 0u, 8u);
            int _424 = int(_422) & 255;
            uint _426 = extract_bits(uint(_416), 8u, 8u);
            int _428 = int(_426) & 255;
            int _430 = _428 << 8;
            int _432 = _424 | _430;
            uint _434 = extract_bits(uint(_400), 0u, 8u);
            int _436 = int(_434) & 255;
            int _438 = _436 << 16;
            int _440 = _432 | _438;
            uint _442 = extract_bits(uint(_400), 8u, 8u);
            int _444 = int(_442) & 255;
            int _446 = _444 << 24;
            int _448 = _440 | _446;
            bool _450 = _448 != 0;
            uint _452 = extract_bits(uint(_404), 0u, 8u);
            int _454 = int(_452) & 255;
            uint _456 = extract_bits(uint(_404), 8u, 8u);
            int _458 = int(_456) & 255;
            int _460 = _458 << 8;
            int _462 = _454 | _460;
            uint _464 = extract_bits(uint(_462), 0u, 8u);
            int _466 = int(_464) & 255;
            uint _468 = extract_bits(uint(_462), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 8;
            int _474 = _466 | _472;
            uint _476 = extract_bits(uint(_420), 0u, 8u);
            int _478 = int(_476) & 255;
            int _480 = _478 << 16;
            int _482 = _474 | _480;
            uint _484 = extract_bits(uint(_420), 8u, 8u);
            int _486 = int(_484) & 255;
            int _488 = _486 << 24;
            int _490 = _482 | _488;
            bool _492 = _490 != 0;
            bool _494 = _492 || _450;
            bool _496 = !_494;
            _216 = _346;
            _218 = _384;
            _220 = _380;
            _222 = _382;
            _224 = _378;
            int _498 = _302;
            int _500 = _294;
            int _502 = _296;
            int _504 = _298;
            int _506 = _300;
            int _508 = _304;
            int _510 = _306;
            int _512 = _316;
            int _514 = _308;
            int _516 = _310;
            int _518 = _312;
            int _520 = _314;
            int _522 = _318;
            int _524 = _320;
            int _526 = _330;
            int _528 = _322;
            int _530 = _324;
            int _532 = _326;
            int _534 = _328;
            int _536 = _332;
            int _538 = _334;
            int _540 = _336;
            int _542 = _338;
            int _544 = _340;
            int _546 = _342;
            int _548 = _448;
            int _550 = _294;
            int _552 = _296;
            int _554 = _298;
            int _556 = _300;
            int _558 = _338;
            int _560 = _340;
            int _562 = _342;
            int _564 = _302;
            int _566 = _304;
            int _568 = _306;
            int _570 = _308;
            int _572 = _310;
            int _574 = _312;
            int _576 = _314;
            int _578 = _316;
            int _580 = _318;
            int _582 = _320;
            int _584 = _322;
            int _586 = _324;
            int _588 = _326;
            int _590 = _328;
            int _592 = _336;
            int _594 = _334;
            int _596 = _332;
            int _598 = _292;
            int _600 = _294;
            int _602 = _296;
            int _604 = _298;
            int _606 = _300;
            int _608 = _302;
            int _610 = _304;
            int _612 = _306;
            int _614 = _308;
            int _616 = _310;
            int _618 = _312;
            int _620 = _314;
            int _622 = _316;
            int _624 = _318;
            int _626 = _320;
            int _628 = _322;
            int _630 = _324;
            int _632 = _326;
            int _634 = _328;
            int _636 = _330;
            int _638 = _332;
            int _640 = _334;
            int _642 = _336;
            int _644 = _338;
            int _646 = _340;
            int _648 = _342;
            int _650 = _490;
            int _652 = _420;
            int _654 = _448;
            int _656 = _416;
            _658 = _490;
            _660 = _448;
            _662 = as_type<int>(_382);
            if (!_496)
            {
                bool _664 = _292 > 0;
                bool _666 = !_664;
                if (!_666)
                {
                    int _668 = 0;
                    do
                    {
                        _672 = _668;
                        int _674 = _672 * 8;
                        uint _676 = uint(int(uint(_674) >> uint(2)));
                        float _678 = as_type<float>(_31[int(_676)]);
                        int _680 = _674 + 4;
                        uint _682 = uint(int(uint(_680) >> uint(2)));
                        float _684 = as_type<float>(_31[int(_682)]);
                        bool _686 = as_type<int>(_678) != _448;
                        bool _688 = as_type<int>(_684) != _490;
                        bool _690 = _688 || _686;
                        bool _692 = !_690;
                        _694 = _692;
                        if (_694)
                        {
                            break;
                        }
                        int _696 = _672 + 1;
                        bool _698 = _696 >= _292;
                        _670 = !_698;
                        _668 = _696;
                    } while (_670);
                }
                if (!_694)
                {
                    int _700 = _292 * 4;
                    int _702 = _292 * 8;
                    int _704 = _292 + 1;
                    bool _706 = _700 == 16;
                    bool _708 = _700 == 0;
                    uint _710 = uint(int(uint(_702) >> uint(2)));
                    _31[int(_710)] = uint(_448);
                    int _712 = _702 + 4;
                    uint _714 = uint(int(uint(_712) >> uint(2)));
                    _31[int(_714)] = uint(_490);
                    bool _716 = _700 == 4;
                    bool _718 = _700 == 8;
                    bool _720 = _700 == 12;
                    bool _722 = _700 == 20;
                    bool _724 = _700 == 24;
                    _598 = _704;
                    _652 = _702;
                    _656 = _700;
                    _726 = _702;
                    _728 = _700;
                    if (_706)
                    {
                        _498 = 1;
                    }
                    int _730 = _498;
                    bool _732 = _700 == 44;
                    _608 = _730;
                    _734 = _730;
                    if (_708)
                    {
                        _500 = 1;
                    }
                    int _736 = _500;
                    bool _738 = _700 == 28;
                    _600 = _736;
                    _740 = _736;
                    if (_716)
                    {
                        _502 = 1;
                    }
                    int _742 = _502;
                    bool _744 = _700 == 32;
                    _602 = _742;
                    _746 = _742;
                    if (_718)
                    {
                        _504 = 1;
                    }
                    int _748 = _504;
                    bool _750 = _700 == 36;
                    _604 = _748;
                    _752 = _748;
                    if (_720)
                    {
                        _506 = 1;
                    }
                    int _754 = _506;
                    bool _756 = _700 == 40;
                    _606 = _754;
                    _758 = _754;
                    if (_722)
                    {
                        _508 = 1;
                    }
                    int _760 = _508;
                    bool _762 = _700 == 48;
                    _610 = _760;
                    _764 = _760;
                    if (_724)
                    {
                        _510 = 1;
                    }
                    int _766 = _510;
                    bool _768 = _700 == 52;
                    _612 = _766;
                    _770 = _766;
                    if (_732)
                    {
                        _512 = 1;
                    }
                    int _772 = _512;
                    bool _774 = _700 == 72;
                    _622 = _772;
                    _776 = _772;
                    if (_738)
                    {
                        _514 = 1;
                    }
                    int _778 = _514;
                    bool _780 = _700 == 56;
                    _614 = _778;
                    _782 = _778;
                    if (_744)
                    {
                        _516 = 1;
                    }
                    int _784 = _516;
                    bool _786 = _700 == 60;
                    _616 = _784;
                    _788 = _784;
                    if (_750)
                    {
                        _518 = 1;
                    }
                    int _790 = _518;
                    bool _792 = _700 == 64;
                    _618 = _790;
                    _794 = _790;
                    if (_756)
                    {
                        _520 = 1;
                    }
                    int _796 = _520;
                    bool _798 = _700 == 68;
                    _620 = _796;
                    _800 = _796;
                    if (_762)
                    {
                        _522 = 1;
                    }
                    int _802 = _522;
                    bool _804 = _700 == 76;
                    _624 = _802;
                    _806 = _802;
                    if (_768)
                    {
                        _524 = 1;
                    }
                    int _808 = _524;
                    bool _810 = _700 == 80;
                    _626 = _808;
                    _812 = _808;
                    if (_774)
                    {
                        _526 = 1;
                    }
                    int _814 = _526;
                    _816 = _704 != 25;
                    _636 = _814;
                    _818 = _814;
                    if (_780)
                    {
                        _528 = 1;
                    }
                    int _820 = _528;
                    _628 = _820;
                    _822 = _820;
                    if (_786)
                    {
                        _530 = 1;
                    }
                    int _824 = _530;
                    bool _826 = _700 == 84;
                    _630 = _824;
                    _828 = _824;
                    if (_792)
                    {
                        _532 = 1;
                    }
                    int _830 = _532;
                    bool _832 = _700 == 88;
                    _632 = _830;
                    _834 = _830;
                    if (_798)
                    {
                        _534 = 1;
                    }
                    int _836 = _534;
                    bool _838 = _700 == 92;
                    _634 = _836;
                    _840 = _836;
                    if (_804)
                    {
                        _536 = 1;
                    }
                    int _842 = _536;
                    bool _844 = _700 == 96;
                    _638 = _842;
                    _846 = _842;
                    if (_810)
                    {
                        _538 = 1;
                    }
                    int _848 = _538;
                    _640 = _848;
                    _850 = _848;
                    if (_826)
                    {
                        _540 = 1;
                    }
                    int _852 = _540;
                    _642 = _852;
                    _854 = _852;
                    if (_832)
                    {
                        _542 = 1;
                    }
                    int _856 = _542;
                    _644 = _856;
                    _858 = _856;
                    if (_838)
                    {
                        _544 = 1;
                    }
                    int _860 = _544;
                    _646 = _860;
                    _862 = _860;
                    if (_844)
                    {
                        _546 = 1;
                    }
                    int _864 = _546;
                    _648 = _864;
                    _866 = _864;
                }
                if ((!_816) || _694)
                {
                    if (!_694)
                    {
                        _868 = 25;
                        _870 = true;
                        if (_870)
                        {
                            break;
                        }
                    }
                    _694 = false;
                    int _872 = _672 * 4;
                    bool _874 = _872 == 0;
                    bool _876 = _872 == 4;
                    bool _878 = _872 == 8;
                    bool _880 = _872 == 12;
                    bool _882 = _872 == 88;
                    bool _884 = _872 == 92;
                    bool _886 = _872 == 96;
                    if (_874)
                    {
                        _548 = _294;
                    }
                    int _888 = _548;
                    bool _890 = _872 == 16;
                    int _892 = _888;
                    if (_876)
                    {
                        _892 = _296;
                    }
                    int _894 = _892;
                    bool _896 = _872 == 20;
                    int _898 = _894;
                    if (_878)
                    {
                        _898 = _298;
                    }
                    int _900 = _898;
                    bool _902 = _872 == 24;
                    int _904 = _900;
                    if (_880)
                    {
                        _904 = _300;
                    }
                    int _906 = _904;
                    bool _908 = _872 == 84;
                    int _910 = int(_902);
                    int _912 = _896 ? 2 : 0;
                    int _914 = _910 | _912;
                    int _916 = _890 ? 4 : 0;
                    int _918 = _914 | _916;
                    int _920 = _908 ? 8 : 0;
                    int _922 = _918 | _920;
                    int _924 = _882 ? 16 : 0;
                    int _926 = _922 | _924;
                    int _928 = _884 ? 32 : 0;
                    int _930 = _926 | _928;
                    int _932 = _886 ? 64 : 0;
                    int _934 = _930 | _932;
                    int _936 = _934 & 8;
                    int _938 = _906;
                    _650 = _936;
                    if (_890)
                    {
                        _938 = _302;
                    }
                    int _940 = _938;
                    bool _942 = _872 == 80;
                    int _944 = _940;
                    if (_896)
                    {
                        _944 = _304;
                    }
                    int _946 = _944;
                    bool _948 = _872 == 76;
                    int _950 = _946;
                    if (_902)
                    {
                        _950 = _306;
                    }
                    int _952 = _950;
                    bool _954 = _872 == 28;
                    int _956 = int(_954);
                    int _958 = _948 ? 2 : 0;
                    int _960 = _956 | _958;
                    int _962 = _942 ? 4 : 0;
                    int _964 = _960 | _962;
                    int _966 = _908 ? 8 : 0;
                    int _968 = _964 | _966;
                    int _970 = _882 ? 16 : 0;
                    int _972 = _968 | _970;
                    int _974 = _884 ? 32 : 0;
                    int _976 = _972 | _974;
                    int _978 = _886 ? 64 : 0;
                    int _980 = _976 | _978;
                    int _982 = _980 & 2;
                    int _984 = int(_954);
                    int _986 = _948 ? 2 : 0;
                    int _988 = _984 | _986;
                    int _990 = _942 ? 4 : 0;
                    int _992 = _988 | _990;
                    int _994 = _908 ? 8 : 0;
                    int _996 = _992 | _994;
                    int _998 = _882 ? 16 : 0;
                    int _1000 = _996 | _998;
                    int _1002 = _884 ? 32 : 0;
                    int _1004 = _1000 | _1002;
                    int _1006 = _886 ? 64 : 0;
                    int _1008 = _1004 | _1006;
                    int _1010 = _1008 & 4;
                    int _1012 = _952;
                    _652 = _982;
                    _656 = _1010;
                    if (_954)
                    {
                        _1012 = _308;
                    }
                    int _1014 = _1012;
                    bool _1016 = _872 == 32;
                    int _1018 = _1014;
                    if (_1016)
                    {
                        _1018 = _310;
                    }
                    int _1020 = _1018;
                    bool _1022 = _872 == 36;
                    int _1024 = _1020;
                    if (_1022)
                    {
                        _1024 = _312;
                    }
                    int _1026 = _1024;
                    bool _1028 = _872 == 40;
                    int _1030 = _1026;
                    if (_1028)
                    {
                        _1030 = _314;
                    }
                    int _1032 = _1030;
                    bool _1034 = _872 == 44;
                    int _1036 = _1032;
                    if (_1034)
                    {
                        _1036 = _316;
                    }
                    int _1038 = _1036;
                    bool _1040 = _872 == 48;
                    int _1042 = _1038;
                    if (_1040)
                    {
                        _1042 = _318;
                    }
                    int _1044 = _1042;
                    bool _1046 = _872 == 52;
                    int _1048 = _1044;
                    if (_1046)
                    {
                        _1048 = _320;
                    }
                    int _1050 = _1048;
                    bool _1052 = _872 == 56;
                    int _1054 = _1050;
                    if (_1052)
                    {
                        _1054 = _322;
                    }
                    int _1056 = _1054;
                    bool _1058 = _872 == 60;
                    int _1060 = _1056;
                    if (_1058)
                    {
                        _1060 = _324;
                    }
                    int _1062 = _1060;
                    bool _1064 = _872 == 64;
                    int _1066 = _1062;
                    if (_1064)
                    {
                        _1066 = _326;
                    }
                    int _1068 = _1066;
                    bool _1070 = _872 == 68;
                    int _1072 = _1068;
                    if (_1070)
                    {
                        _1072 = _328;
                    }
                    int _1074 = _1072;
                    bool _1076 = _872 == 72;
                    int _1078 = int(_1076);
                    int _1080 = _948 ? 2 : 0;
                    int _1082 = _1078 | _1080;
                    int _1084 = _942 ? 4 : 0;
                    int _1086 = _1082 | _1084;
                    int _1088 = _908 ? 8 : 0;
                    int _1090 = _1086 | _1088;
                    int _1092 = _882 ? 16 : 0;
                    int _1094 = _1090 | _1092;
                    int _1096 = _884 ? 32 : 0;
                    int _1098 = _1094 | _1096;
                    int _1100 = _886 ? 64 : 0;
                    int _1102 = _1098 | _1100;
                    int _1104 = _1102 & 1;
                    int _1106 = _1074;
                    if (_1076)
                    {
                        _1106 = _330;
                    }
                    int _1108 = _1106;
                    bool _1110 = _872 == 4;
                    int _1112 = _1108;
                    if (_948)
                    {
                        _1112 = _332;
                    }
                    int _1114 = _1112;
                    bool _1116 = _872 == 0;
                    int _1118 = _1114;
                    if (_942)
                    {
                        _1118 = _334;
                    }
                    int _1120 = _1118;
                    bool _1122 = _872 == 12;
                    int _1124 = _1120;
                    if (_908)
                    {
                        _1124 = _336;
                    }
                    int _1126 = _1124;
                    bool _1128 = _872 == 8;
                    int _1130 = _1126;
                    if (_882)
                    {
                        _1130 = _338;
                    }
                    int _1132 = _1130;
                    int _1134 = _1132;
                    if (_884)
                    {
                        _1134 = _340;
                    }
                    int _1136 = _1134;
                    int _1138 = _1136;
                    if (_886)
                    {
                        _1138 = _342;
                    }
                    int _1140 = _1138;
                    int _1142 = _1140 + 1;
                    _654 = _1142;
                    if (_1116)
                    {
                        _550 = _1142;
                    }
                    int _1144 = _550;
                    bool _1146 = _872 == 16;
                    _600 = _1144;
                    if (_1110)
                    {
                        _552 = _1142;
                    }
                    int _1148 = _552;
                    bool _1150 = _872 == 20;
                    _602 = _1148;
                    if (_1128)
                    {
                        _554 = _1142;
                    }
                    int _1152 = _554;
                    bool _1154 = _872 == 24;
                    _604 = _1152;
                    if (_1122)
                    {
                        _556 = _1142;
                    }
                    int _1156 = _556;
                    bool _1158 = _872 == 28;
                    _606 = _1156;
                    if (_882)
                    {
                        _558 = _1142;
                    }
                    int _1160 = _558;
                    _644 = _1160;
                    if (_884)
                    {
                        _560 = _1142;
                    }
                    int _1162 = _560;
                    _646 = _1162;
                    if (_886)
                    {
                        _562 = _1142;
                    }
                    int _1164 = _562;
                    _648 = _1164;
                    if (_1146)
                    {
                        _564 = _1142;
                    }
                    int _1166 = _564;
                    bool _1168 = _872 == 32;
                    _608 = _1166;
                    if (_1150)
                    {
                        _566 = _1142;
                    }
                    int _1170 = _566;
                    bool _1172 = _872 == 36;
                    _610 = _1170;
                    if (_1154)
                    {
                        _568 = _1142;
                    }
                    int _1174 = _568;
                    bool _1176 = _872 == 40;
                    _612 = _1174;
                    if (_1158)
                    {
                        _570 = _1142;
                    }
                    int _1178 = _570;
                    bool _1180 = _872 == 44;
                    _614 = _1178;
                    if (_1168)
                    {
                        _572 = _1142;
                    }
                    int _1182 = _572;
                    bool _1184 = _872 == 48;
                    _616 = _1182;
                    if (_1172)
                    {
                        _574 = _1142;
                    }
                    int _1186 = _574;
                    bool _1188 = _872 == 52;
                    _618 = _1186;
                    if (_1176)
                    {
                        _576 = _1142;
                    }
                    int _1190 = _576;
                    bool _1192 = _872 == 56;
                    _620 = _1190;
                    if (_1180)
                    {
                        _578 = _1142;
                    }
                    int _1194 = _578;
                    bool _1196 = _872 == 60;
                    _622 = _1194;
                    if (_1184)
                    {
                        _580 = _1142;
                    }
                    int _1198 = _580;
                    bool _1200 = _872 == 64;
                    _624 = _1198;
                    if (_1188)
                    {
                        _582 = _1142;
                    }
                    int _1202 = _582;
                    bool _1204 = _872 == 68;
                    _626 = _1202;
                    if (_1192)
                    {
                        _584 = _1142;
                    }
                    int _1206 = _584;
                    bool _1208 = _936 != 0;
                    _628 = _1206;
                    if (_1196)
                    {
                        _586 = _1142;
                    }
                    int _1210 = _586;
                    bool _1212 = _1010 != 0;
                    _630 = _1210;
                    if (_1200)
                    {
                        _588 = _1142;
                    }
                    int _1214 = _588;
                    _632 = _1214;
                    if (_1204)
                    {
                        _590 = _1142;
                    }
                    int _1216 = _590;
                    bool _1218 = _982 != 0;
                    _634 = _1216;
                    if (_1208)
                    {
                        _592 = _1142;
                    }
                    int _1220 = _592;
                    bool _1222 = _1104 != 0;
                    _642 = _1220;
                    if (_1212)
                    {
                        _594 = _1142;
                    }
                    int _1224 = _594;
                    _640 = _1224;
                    if (_1218)
                    {
                        _596 = _1142;
                    }
                    int _1226 = _596;
                    _638 = _1226;
                    if (_1222)
                    {
                        _636 = _1142;
                    }
                }
            }
            _1228 = _598;
            int _1230 = _600;
            int _1232 = _602;
            int _1234 = _604;
            int _1236 = _606;
            int _1238 = _608;
            int _1240 = _610;
            int _1242 = _612;
            int _1244 = _614;
            int _1246 = _616;
            int _1248 = _618;
            int _1250 = _620;
            int _1252 = _622;
            int _1254 = _624;
            int _1256 = _626;
            int _1258 = _628;
            int _1260 = _630;
            int _1262 = _632;
            int _1264 = _634;
            int _1266 = _636;
            int _1268 = _638;
            int _1270 = _640;
            int _1272 = _642;
            int _1274 = _644;
            int _1276 = _646;
            int _1278 = _648;
            int _1280 = _650;
            int _1282 = _652;
            int _1284 = _654;
            int _1286 = _656;
            int _1288 = _344 + 1;
            bool _1290 = _1288 >= 3;
            _280 = !_1290;
            _226 = _1228;
            _228 = _1230;
            _230 = _1232;
            _232 = _1234;
            _234 = _1236;
            _236 = _1238;
            _238 = _1240;
            _240 = _1242;
            _242 = _1244;
            _244 = _1246;
            _246 = _1248;
            _248 = _1250;
            _250 = _1252;
            _252 = _1254;
            _254 = _1256;
            _256 = _1258;
            _258 = _1260;
            _260 = _1262;
            _262 = _1264;
            _264 = _1266;
            _266 = _1268;
            _268 = _1270;
            _270 = _1272;
            _272 = _1274;
            _274 = _1276;
            _276 = _1278;
            _278 = _1288;
            _740 = _1230;
            _746 = _1232;
            _752 = _1234;
            _758 = _1236;
            _734 = _1238;
            _764 = _1240;
            _770 = _1242;
            _782 = _1244;
            _788 = _1246;
            _794 = _1248;
            _800 = _1250;
            _776 = _1252;
            _806 = _1254;
            _812 = _1256;
            _822 = _1258;
            _828 = _1260;
            _834 = _1262;
            _840 = _1264;
            _818 = _1266;
            _846 = _1268;
            _850 = _1270;
            _854 = _1272;
            _858 = _1274;
            _862 = _1276;
            _866 = _1278;
            _658 = _1280;
            _726 = _1282;
            _660 = _1284;
            _728 = _1286;
        } while (_280);
        if (!_870)
        {
            _868 = _1228;
        }
        _870 = false;
        _1292 = _740;
        _1294 = _746;
        _1296 = _752;
        _1298 = _758;
        _1300 = _734;
        _1302 = _764;
        _1304 = _770;
        _1306 = _782;
        _1308 = _788;
        _1310 = _794;
        _1312 = _800;
        _1314 = _776;
        _1316 = _806;
        _1318 = _812;
        _1320 = _822;
        _1322 = _828;
        _1324 = _834;
        _1326 = _840;
        _1328 = _818;
        _1330 = _846;
        _1332 = _850;
        _1334 = _854;
        _1336 = _858;
        _1338 = _862;
        _1340 = _866;
        _1342 = _868;
        int _1344 = _658;
        int _1346 = _726;
        int _1348 = _660;
        int _1350 = _728;
        int _1352 = _144 + 1;
        bool _1354 = _1352 >= 3;
        _142 = !_1354;
        _86 = _1352;
        _88 = _1342;
        _90 = _1292;
        _92 = _1294;
        _94 = _1296;
        _96 = _1298;
        _98 = _1300;
        _100 = _1302;
        _102 = _1304;
        _104 = _1306;
        _106 = _1308;
        _108 = _1310;
        _110 = _1312;
        _112 = _1314;
        _114 = _1316;
        _116 = _1318;
        _118 = _1320;
        _120 = _1322;
        _122 = _1324;
        _124 = _1326;
        _126 = _1328;
        _128 = _1330;
        _130 = _1332;
        _132 = _1334;
        _134 = _1336;
        _136 = _1338;
        _138 = _1340;
        _1356 = _1344;
        _1358 = _1346;
        _1360 = _1348;
        _1362 = _1350;
        _1364 = _1344;
        _1366 = _1292;
    } while (_142);
    bool _1368 = _1342 > 0;
    if (!_1368)
    {
        _662 = 0;
    }
    int _1370 = _662;
    bool _1372 = !_1368;
    int _1374 = _1370;
    if (!_1372)
    {
        bool _1376 = _1342 > 3;
        bool _1378 = !_1376;
        int _1380 = 0;
        int _1382 = 0;
        int _1384 = 0;
        int _1386 = 0;
        int _1388 = 0;
        int _1390 = -1;
        int _1392 = 0;
        if (!_1378)
        {
            int _1394 = _1342 + (-3);
            _1390 = 0;
            bool _1396;
            do
            {
                int _1398 = _1380;
                int _1400 = _1382;
                int _1402 = _1356;
                int _1404 = _1358;
                int _1406 = _1360;
                int _1408 = _1384;
                int _1410 = _1362;
                int _1412 = _1398 * 4;
                int _1414 = _1398 + 1;
                int _1416 = _1398 + 2;
                bool _1418 = _1412 == 0;
                int _1420 = _1414 * 4;
                bool _1422 = _1412 == 4;
                int _1424 = _1416 * 4;
                bool _1426 = _1412 == 8;
                bool _1428 = _1412 == 12;
                bool _1430 = _1412 == 16;
                bool _1432 = _1420 == 8;
                int _1434 = _1398 + 3;
                int _1436 = _1402;
                int _1438 = _1404;
                int _1440 = _1406;
                int _1442 = _1410;
                int _1444 = _1400;
                int _1446 = _1408;
                if (_1418)
                {
                    _1436 = _1292;
                }
                int _1448 = _1436;
                bool _1450 = _1412 == 24;
                int _1452 = _1448;
                if (_1422)
                {
                    _1452 = _1294;
                }
                int _1454 = _1452;
                bool _1456 = _1412 == 20;
                int _1458 = _1454;
                if (_1426)
                {
                    _1458 = _1296;
                }
                int _1460 = _1458;
                bool _1462 = _1412 == 32;
                int _1464 = _1460;
                if (_1428)
                {
                    _1464 = _1298;
                }
                int _1466 = _1464;
                bool _1468 = _1412 == 28;
                int _1470 = _1466;
                if (_1430)
                {
                    _1470 = _1300;
                }
                int _1472 = _1470;
                bool _1474 = _1412 == 40;
                int _1476 = _1434 * 4;
                int _1478 = _1472;
                if (_1456)
                {
                    _1478 = _1302;
                }
                int _1480 = _1478;
                bool _1482 = _1412 == 36;
                int _1484 = _1480;
                if (_1450)
                {
                    _1484 = _1304;
                }
                int _1486 = _1484;
                bool _1488 = _1420 == 0;
                int _1490 = _1486;
                if (_1468)
                {
                    _1490 = _1306;
                }
                int _1492 = _1490;
                bool _1494 = _1420 == 4;
                int _1496 = _1492;
                if (_1462)
                {
                    _1496 = _1308;
                }
                int _1498 = _1496;
                bool _1500 = _1420 == 12;
                int _1502 = _1498;
                if (_1482)
                {
                    _1502 = _1310;
                }
                int _1504 = _1502;
                bool _1506 = _1412 == 44;
                int _1508 = _1504;
                if (_1474)
                {
                    _1508 = _1312;
                }
                int _1510 = _1508;
                bool _1512 = _1420 == 16;
                int _1514 = _1510;
                if (_1488)
                {
                    _1438 = _1292;
                }
                int _1516 = _1438;
                bool _1518 = _1412 == 48;
                int _1520 = _1516;
                if (_1494)
                {
                    _1520 = _1294;
                }
                int _1522 = _1520;
                int _1524 = _1522;
                if (_1432)
                {
                    _1524 = _1296;
                }
                int _1526 = _1524;
                bool _1528 = _1420 == 20;
                int _1530 = _1526;
                if (_1500)
                {
                    _1530 = _1298;
                }
                int _1532 = _1530;
                bool _1534 = _1420 == 24;
                bool _1536 = _1420 == 28;
                int _1538 = _1532;
                if (_1506)
                {
                    _1514 = _1314;
                }
                int _1540 = _1514;
                bool _1542 = _1412 == 52;
                int _1544 = _1540;
                if (_1512)
                {
                    _1538 = _1300;
                }
                int _1546 = _1538;
                bool _1548 = _1420 == 32;
                int _1550 = _1546;
                if (_1518)
                {
                    _1544 = _1316;
                }
                int _1552 = _1544;
                bool _1554 = _1412 == 56;
                int _1556 = _1552;
                if (_1528)
                {
                    _1550 = _1302;
                }
                int _1558 = _1550;
                bool _1560 = _1420 == 36;
                int _1562 = _1558;
                if (_1534)
                {
                    _1562 = _1304;
                }
                int _1564 = _1562;
                bool _1566 = _1420 == 40;
                int _1568 = _1564;
                if (_1536)
                {
                    _1568 = _1306;
                }
                int _1570 = _1568;
                bool _1572 = _1420 == 44;
                int _1574 = _1570;
                if (_1542)
                {
                    _1556 = _1318;
                }
                int _1576 = _1556;
                bool _1578 = _1412 == 60;
                int _1580 = _1576;
                if (_1548)
                {
                    _1574 = _1308;
                }
                int _1582 = _1574;
                bool _1584 = _1420 == 48;
                int _1586 = _1582;
                if (_1554)
                {
                    _1580 = _1320;
                }
                int _1588 = _1580;
                bool _1590 = _1412 == 64;
                int _1592 = _1588;
                if (_1560)
                {
                    _1586 = _1310;
                }
                int _1594 = _1586;
                bool _1596 = _1420 == 52;
                int _1598 = _1594;
                if (_1566)
                {
                    _1598 = _1312;
                }
                int _1600 = _1598;
                bool _1602 = _1420 == 56;
                int _1604 = _1600;
                if (_1572)
                {
                    _1604 = _1314;
                }
                int _1606 = _1604;
                bool _1608 = _1420 == 60;
                int _1610 = _1606;
                if (_1578)
                {
                    _1592 = _1322;
                }
                int _1612 = _1592;
                bool _1614 = _1424 == 0;
                int _1616 = _1612;
                if (_1584)
                {
                    _1610 = _1316;
                }
                int _1618 = _1610;
                bool _1620 = _1412 == 68;
                int _1622 = _1618;
                if (_1590)
                {
                    _1616 = _1324;
                }
                int _1624 = _1616;
                bool _1626 = _1424 == 4;
                int _1628 = _1624;
                if (_1596)
                {
                    _1622 = _1318;
                }
                int _1630 = _1622;
                bool _1632 = _1424 == 8;
                int _1634 = _1630;
                if (_1602)
                {
                    _1634 = _1320;
                }
                int _1636 = _1634;
                bool _1638 = _1424 == 12;
                int _1640 = _1636;
                if (_1608)
                {
                    _1640 = _1322;
                }
                int _1642 = _1640;
                bool _1644 = _1424 == 16;
                int _1646 = _1642;
                if (_1614)
                {
                    _1440 = _1292;
                }
                int _1648 = _1440;
                bool _1650 = _1420 == 64;
                int _1652 = _1648;
                if (_1620)
                {
                    _1628 = _1326;
                }
                int _1654 = _1628;
                bool _1656 = _1424 == 20;
                int _1658 = _1654;
                if (_1626)
                {
                    _1652 = _1294;
                }
                int _1660 = _1652;
                bool _1662 = _1412 == 72;
                int _1664 = _1660;
                if (_1632)
                {
                    _1664 = _1296;
                }
                int _1666 = _1664;
                bool _1668 = _1424 == 24;
                int _1670 = _1666;
                if (_1638)
                {
                    _1670 = _1298;
                }
                int _1672 = _1670;
                bool _1674 = _1424 == 28;
                int _1676 = _1672;
                if (_1644)
                {
                    _1676 = _1300;
                }
                int _1678 = _1676;
                int _1680 = _1678;
                if (_1650)
                {
                    _1646 = _1324;
                }
                int _1682 = _1646;
                bool _1684 = _1420 == 68;
                int _1686 = _1682;
                if (_1656)
                {
                    _1680 = _1302;
                }
                int _1688 = _1680;
                bool _1690 = _1424 == 32;
                int _1692 = _1688;
                if (_1662)
                {
                    _1658 = _1328;
                }
                int _1694 = _1658;
                bool _1696 = _1424 == 36;
                bool _1698 = _1412 == 76;
                int _1700 = _1694;
                if (_1668)
                {
                    _1692 = _1304;
                }
                int _1702 = _1692;
                bool _1704 = _1424 == 40;
                int _1706 = _1702;
                if (_1674)
                {
                    _1706 = _1306;
                }
                int _1708 = _1706;
                bool _1710 = _1424 == 44;
                int _1712 = _1708;
                if (_1684)
                {
                    _1686 = _1326;
                }
                int _1714 = _1686;
                bool _1716 = _1420 == 72;
                int _1718 = _1714;
                if (_1690)
                {
                    _1712 = _1308;
                }
                int _1720 = _1712;
                bool _1722 = _1424 == 48;
                int _1724 = _1720;
                if (_1696)
                {
                    _1724 = _1310;
                }
                int _1726 = _1724;
                bool _1728 = _1424 == 52;
                int _1730 = _1726;
                if (_1698)
                {
                    _1700 = _1330;
                }
                int _1732 = _1700;
                bool _1734 = _1412 == 80;
                int _1736 = _1732;
                if (_1704)
                {
                    _1730 = _1312;
                }
                int _1738 = _1730;
                bool _1740 = _1424 == 56;
                int _1742 = _1738;
                if (_1710)
                {
                    _1742 = _1314;
                }
                int _1744 = _1742;
                bool _1746 = _1424 == 60;
                int _1748 = _1744;
                if (_1716)
                {
                    _1718 = _1328;
                }
                int _1750 = _1718;
                bool _1752 = _1424 == 64;
                int _1754 = _1750;
                if (_1722)
                {
                    _1748 = _1316;
                }
                int _1756 = _1748;
                bool _1758 = _1420 == 76;
                int _1760 = _1756;
                if (_1728)
                {
                    _1760 = _1318;
                }
                int _1762 = _1760;
                bool _1764 = _1412 == 84;
                int _1766 = _1762;
                if (_1734)
                {
                    _1736 = _1332;
                }
                int _1768 = _1736;
                bool _1770 = _1424 == 68;
                int _1772 = _1768;
                if (_1740)
                {
                    _1766 = _1320;
                }
                int _1774 = _1766;
                bool _1776 = _1424 == 72;
                int _1778 = _1774;
                if (_1746)
                {
                    _1778 = _1322;
                }
                int _1780 = _1778;
                bool _1782 = _1424 == 76;
                int _1784 = _1780;
                if (_1752)
                {
                    _1784 = _1324;
                }
                int _1786 = _1784;
                bool _1788 = _1476 == 0;
                int _1790 = _1786;
                if (_1758)
                {
                    _1754 = _1330;
                }
                int _1792 = _1754;
                bool _1794 = _1420 == 80;
                int _1796 = _1792;
                if (_1764)
                {
                    _1772 = _1334;
                }
                int _1798 = _1772;
                bool _1800 = _1476 == 4;
                int _1802 = _1798;
                if (_1770)
                {
                    _1790 = _1326;
                }
                int _1804 = _1790;
                bool _1806 = _1424 == 80;
                int _1808 = _1804;
                if (_1776)
                {
                    _1808 = _1328;
                }
                int _1810 = _1808;
                bool _1812 = _1476 == 8;
                int _1814 = _1810;
                if (_1782)
                {
                    _1814 = _1330;
                }
                int _1816 = _1814;
                bool _1818 = _1412 == 88;
                int _1820 = _1816;
                if (_1788)
                {
                    _1442 = _1292;
                }
                int _1822 = _1442;
                bool _1824 = _1476 == 12;
                int _1826 = _1822;
                if (_1794)
                {
                    _1796 = _1332;
                }
                int _1828 = _1796;
                bool _1830 = _1420 == 84;
                int _1832 = _1828;
                if (_1800)
                {
                    _1826 = _1294;
                }
                int _1834 = _1826;
                int _1836 = _1834;
                if (_1806)
                {
                    _1820 = _1332;
                }
                int _1838 = _1820;
                bool _1840 = _1424 == 84;
                int _1842 = _1838;
                if (_1812)
                {
                    _1836 = _1296;
                }
                int _1844 = _1836;
                bool _1846 = _1476 == 16;
                int _1848 = _1844;
                if (_1818)
                {
                    _1802 = _1336;
                }
                int _1850 = _1802;
                bool _1852 = _1412 == 92;
                bool _1854 = _1476 == 20;
                int _1856 = _1850;
                if (_1824)
                {
                    _1848 = _1298;
                }
                int _1858 = _1848;
                bool _1860 = _1420 == 88;
                int _1862 = _1858;
                if (_1830)
                {
                    _1832 = _1334;
                }
                int _1864 = _1832;
                bool _1866 = _1476 == 24;
                int _1868 = _1864;
                if (_1840)
                {
                    _1842 = _1334;
                }
                int _1870 = _1842;
                bool _1872 = _1424 == 88;
                int _1874 = _1870;
                if (_1846)
                {
                    _1862 = _1300;
                }
                int _1876 = _1862;
                bool _1878 = _1476 == 28;
                int _1880 = _1876;
                if (_1852)
                {
                    _1856 = _1338;
                }
                int _1882 = _1856;
                bool _1884 = _1476 == 32;
                int _1886 = _1882;
                if (_1854)
                {
                    _1880 = _1302;
                }
                int _1888 = _1880;
                bool _1890 = _1412 == 96;
                int _1892 = _1888;
                if (_1860)
                {
                    _1868 = _1336;
                }
                int _1894 = _1868;
                bool _1896 = _1476 == 40;
                int _1898 = _1894;
                if (_1866)
                {
                    _1892 = _1304;
                }
                int _1900 = _1892;
                bool _1902 = _1476 == 36;
                int _1904 = _1900;
                if (_1872)
                {
                    _1874 = _1336;
                }
                int _1906 = _1874;
                bool _1908 = _1420 == 92;
                int _1910 = _1906;
                if (_1878)
                {
                    _1904 = _1306;
                }
                int _1912 = _1904;
                bool _1914 = _1476 == 44;
                int _1916 = _1912;
                if (_1884)
                {
                    _1916 = _1308;
                }
                int _1918 = _1916;
                bool _1920 = _1476 == 48;
                int _1922 = _1918;
                if (_1890)
                {
                    _1886 = _1340;
                }
                int _1924 = _1886;
                bool _1926 = _1420 == 96;
                int _1928 = _1924;
                if (_1902)
                {
                    _1922 = _1310;
                }
                int _1930 = _1922;
                bool _1932 = _1476 == 52;
                int _1934 = _1930;
                if (_1896)
                {
                    _1934 = _1312;
                }
                int _1936 = _1934;
                bool _1938 = _1400 >= _1924;
                int _1940 = _1936;
                if (_1908)
                {
                    _1898 = _1338;
                }
                int _1942 = _1898;
                bool _1944 = _1476 == 56;
                int _1946 = _1942;
                if (_1914)
                {
                    _1940 = _1314;
                }
                int _1948 = _1940;
                bool _1950 = _1476 == 60;
                int _1952 = _1948;
                if (_1920)
                {
                    _1952 = _1316;
                }
                int _1954 = _1952;
                bool _1956 = _1476 == 64;
                int _1958 = _1954;
                if (_1926)
                {
                    _1946 = _1340;
                }
                int _1960 = _1946;
                bool _1962 = _1424 == 92;
                _1358 = _1960;
                if (_1932)
                {
                    _1958 = _1318;
                }
                int _1964 = _1958;
                bool _1966 = _1476 == 68;
                int _1968 = _1964;
                if (!_1938)
                {
                    _1444 = _1924;
                }
                int _1970 = _1444;
                int _1972 = _1970;
                if (_1944)
                {
                    _1968 = _1320;
                }
                int _1974 = _1968;
                bool _1976 = _1476 == 72;
                int _1978 = _1974;
                if (_1950)
                {
                    _1978 = _1322;
                }
                int _1980 = _1978;
                bool _1982 = _1970 >= _1960;
                int _1984 = _1980;
                if (_1956)
                {
                    _1984 = _1324;
                }
                int _1986 = _1984;
                int _1988 = _1986;
                if (_1962)
                {
                    _1910 = _1338;
                }
                int _1990 = _1910;
                bool _1992 = _1424 == 96;
                bool _1994 = _1476 == 76;
                int _1996 = _1990;
                if (_1966)
                {
                    _1988 = _1326;
                }
                int _1998 = _1988;
                bool _2000 = _1476 == 80;
                int _2002 = _1998;
                if (_1976)
                {
                    _2002 = _1328;
                }
                int _2004 = _2002;
                bool _2006 = _1476 == 84;
                int _2008 = _2004;
                if (_1982)
                {
                    _1928 = _1970;
                }
                int _2010 = _1928;
                int _2012 = _2010;
                if (!_1982)
                {
                    _2012 = _1960;
                }
                int _2014 = _2012;
                int _2016 = _2014;
                if (_1992)
                {
                    _1996 = _1340;
                }
                int _2018 = _1996;
                bool _2020 = _1476 == 88;
                _1360 = _2018;
                if (_1994)
                {
                    _2008 = _1330;
                }
                int _2022 = _2008;
                bool _2024 = _1476 == 92;
                int _2026 = _2022;
                if (_2000)
                {
                    _2026 = _1332;
                }
                int _2028 = _2026;
                bool _2030 = _2014 >= _2018;
                int _2032 = _2028;
                if (_1938)
                {
                    _1972 = _1408;
                }
                int _2034 = _1972;
                int _2036 = _2034;
                if (_2006)
                {
                    _2032 = _1334;
                }
                int _2038 = _2032;
                bool _2040 = _1476 == 96;
                int _2042 = _2038;
                if (!_1938)
                {
                    _2036 = _1398;
                }
                int _2044 = _2036;
                int _2046 = _1398 + 4;
                _1380 = _2046;
                int _2048 = _2044;
                _1386 = _2046;
                if (!_1982)
                {
                    _2048 = _1414;
                }
                int _2050 = _2048;
                int _2052 = _2050;
                if (_2020)
                {
                    _2042 = _1336;
                }
                int _2054 = _2042;
                bool _2056 = _2046 >= _1394;
                int _2058 = _2054;
                if (_2024)
                {
                    _2058 = _1338;
                }
                int _2060 = _2058;
                int _2062 = _2060;
                if (!_2030)
                {
                    _2016 = _2018;
                }
                int _2064 = _2016;
                _1356 = _2064;
                _1364 = _2064;
                if (!_2030)
                {
                    _2052 = _1416;
                }
                int _2066 = _2052;
                int _2068 = _2066;
                if (_2040)
                {
                    _2062 = _1340;
                }
                int _2070 = _2062;
                bool _2072 = _2064 >= _2070;
                _1362 = _2070;
                if (_2072)
                {
                    _1446 = _2066;
                }
                int _2074 = _1446;
                int _2076 = _2074;
                if (_2072)
                {
                    _2068 = _2064;
                }
                int _2078 = _2068;
                int _2080 = _2078;
                if (!_2072)
                {
                    _2076 = _1434;
                }
                int _2082 = _2076;
                _1384 = _2082;
                _1392 = _2082;
                if (!_2072)
                {
                    _2080 = _2070;
                }
                int _2084 = _2080;
                _1396 = !_2056;
                _1382 = _2084;
                _1388 = _2084;
            } while (_1396);
        }
        int _2086 = _1386;
        int _2088 = _1388;
        int _2090 = _1364;
        int _2092 = _1390;
        int _2094 = _1392;
        int _2096 = -_2086;
        int _2098 = _1342 + _2096;
        bool _2100 = _2098 > 1;
        bool _2102 = !_2100;
        int _2104 = _2090;
        int _2106 = _2098;
        int _2108 = _2088;
        int _2110 = _2094;
        int _2112 = _2086;
        int _2114 = _2092;
        int _2116 = _2088;
        int _2118 = _2094;
        if (!_2102)
        {
            int _2120 = _2086 * 4;
            int _2122 = _2086 + 1;
            bool _2124 = _2120 == 0;
            int _2126 = _2122 * 4;
            bool _2128 = _2120 == 4;
            bool _2130 = _2120 == 8;
            bool _2132 = _2120 == 12;
            bool _2134 = _2120 == 24;
            bool _2136 = _2126 == 0;
            bool _2138 = _2120 == 40;
            if (_2124)
            {
                _2104 = _1292;
            }
            int _2140 = _2104;
            bool _2142 = _2120 == 16;
            int _2144 = _2140;
            if (_2128)
            {
                _2144 = _1294;
            }
            int _2146 = _2144;
            bool _2148 = _2120 == 20;
            int _2150 = _2146;
            if (_2130)
            {
                _2150 = _1296;
            }
            int _2152 = _2150;
            bool _2154 = _2120 == 36;
            int _2156 = _2152;
            if (_2132)
            {
                _2156 = _1298;
            }
            int _2158 = _2156;
            bool _2160 = _2120 == 28;
            int _2162 = _2158;
            if (_2136)
            {
                _2106 = _1292;
            }
            int _2164 = _2106;
            bool _2166 = _2126 == 16;
            int _2168 = _2164;
            if (_2142)
            {
                _2162 = _1300;
            }
            int _2170 = _2162;
            bool _2172 = _2120 == 32;
            int _2174 = _2170;
            if (_2148)
            {
                _2174 = _1302;
            }
            int _2176 = _2174;
            bool _2178 = _2120 == 48;
            int _2180 = _2176;
            if (_2134)
            {
                _2180 = _1304;
            }
            int _2182 = _2180;
            bool _2184 = _2126 == 4;
            int _2186 = _2182;
            if (_2160)
            {
                _2186 = _1306;
            }
            int _2188 = _2186;
            bool _2190 = _2120 == 44;
            int _2192 = _2188;
            if (_2172)
            {
                _2192 = _1308;
            }
            int _2194 = _2192;
            bool _2196 = _2126 == 8;
            int _2198 = _2194;
            if (_2154)
            {
                _2198 = _1310;
            }
            int _2200 = _2198;
            bool _2202 = _2126 == 12;
            int _2204 = _2200;
            if (_2184)
            {
                _2168 = _1294;
            }
            int _2206 = _2168;
            bool _2208 = _2120 == 52;
            int _2210 = _2206;
            if (_2138)
            {
                _2204 = _1312;
            }
            int _2212 = _2204;
            bool _2214 = _2126 == 20;
            int _2216 = _2212;
            if (_2190)
            {
                _2216 = _1314;
            }
            int _2218 = _2216;
            bool _2220 = _2126 == 24;
            int _2222 = _2218;
            if (_2178)
            {
                _2222 = _1316;
            }
            int _2224 = _2222;
            bool _2226 = _2120 == 60;
            int _2228 = _2224;
            if (_2196)
            {
                _2210 = _1296;
            }
            int _2230 = _2210;
            bool _2232 = _2120 == 56;
            int _2234 = _2230;
            if (_2202)
            {
                _2234 = _1298;
            }
            int _2236 = _2234;
            bool _2238 = _2126 == 28;
            int _2240 = _2236;
            if (_2166)
            {
                _2240 = _1300;
            }
            int _2242 = _2240;
            bool _2244 = _2126 == 32;
            int _2246 = _2242;
            if (_2214)
            {
                _2246 = _1302;
            }
            int _2248 = _2246;
            bool _2250 = _2126 == 36;
            int _2252 = _2248;
            if (_2208)
            {
                _2228 = _1318;
            }
            int _2254 = _2228;
            bool _2256 = _2120 == 64;
            int _2258 = _2254;
            if (_2220)
            {
                _2252 = _1304;
            }
            int _2260 = _2252;
            bool _2262 = _2120 == 68;
            int _2264 = _2260;
            if (_2232)
            {
                _2258 = _1320;
            }
            int _2266 = _2258;
            bool _2268 = _2126 == 40;
            int _2270 = _2266;
            if (_2238)
            {
                _2264 = _1306;
            }
            int _2272 = _2264;
            bool _2274 = _2120 == 72;
            int _2276 = _2272;
            if (_2226)
            {
                _2270 = _1322;
            }
            int _2278 = _2270;
            bool _2280 = _2126 == 44;
            int _2282 = _2278;
            if (_2244)
            {
                _2276 = _1308;
            }
            int _2284 = _2276;
            bool _2286 = _2126 == 48;
            int _2288 = _2284;
            if (_2250)
            {
                _2288 = _1310;
            }
            int _2290 = _2288;
            bool _2292 = _2120 == 76;
            int _2294 = _2290;
            if (_2256)
            {
                _2282 = _1324;
            }
            int _2296 = _2282;
            bool _2298 = _2126 == 52;
            int _2300 = _2296;
            if (_2262)
            {
                _2300 = _1326;
            }
            int _2302 = _2300;
            bool _2304 = _2120 == 80;
            int _2306 = _2302;
            if (_2268)
            {
                _2294 = _1312;
            }
            int _2308 = _2294;
            bool _2310 = _2126 == 56;
            int _2312 = _2308;
            if (_2274)
            {
                _2306 = _1328;
            }
            int _2314 = _2306;
            int _2316 = _2314;
            if (_2280)
            {
                _2312 = _1314;
            }
            int _2318 = _2312;
            bool _2320 = _2120 == 84;
            int _2322 = _2318;
            if (_2286)
            {
                _2322 = _1316;
            }
            int _2324 = _2322;
            bool _2326 = _2126 == 60;
            int _2328 = _2324;
            if (_2292)
            {
                _2316 = _1330;
            }
            int _2330 = _2316;
            bool _2332 = _2120 == 88;
            int _2334 = _2330;
            if (_2298)
            {
                _2328 = _1318;
            }
            int _2336 = _2328;
            bool _2338 = _2126 == 64;
            int _2340 = _2336;
            if (_2304)
            {
                _2334 = _1332;
            }
            int _2342 = _2334;
            bool _2344 = _2120 == 92;
            int _2346 = _2342;
            if (_2310)
            {
                _2340 = _1320;
            }
            int _2348 = _2340;
            bool _2350 = _2126 == 68;
            bool _2352 = _2126 == 72;
            int _2354 = _2348;
            if (_2320)
            {
                _2346 = _1334;
            }
            int _2356 = _2346;
            bool _2358 = _2120 == 96;
            int _2360 = _2356;
            if (_2326)
            {
                _2354 = _1322;
            }
            int _2362 = _2354;
            bool _2364 = _2126 == 76;
            int _2366 = _2362;
            if (_2332)
            {
                _2360 = _1336;
            }
            int _2368 = _2360;
            int _2370 = _2368;
            if (_2338)
            {
                _2366 = _1324;
            }
            int _2372 = _2366;
            bool _2374 = _2126 == 80;
            int _2376 = _2372;
            if (_2344)
            {
                _2370 = _1338;
            }
            int _2378 = _2370;
            bool _2380 = _2126 == 96;
            int _2382 = _2378;
            if (_2350)
            {
                _2376 = _1326;
            }
            int _2384 = _2376;
            bool _2386 = _2126 == 84;
            int _2388 = _2384;
            if (_2352)
            {
                _2388 = _1328;
            }
            int _2390 = _2388;
            bool _2392 = _2126 == 88;
            int _2394 = _2390;
            if (_2358)
            {
                _2382 = _1340;
            }
            int _2396 = _2382;
            bool _2398 = _2126 == 92;
            if (_2364)
            {
                _2394 = _1330;
            }
            int _2400 = _2394;
            bool _2402 = _2088 >= _2396;
            int _2404 = _2400;
            if (_2374)
            {
                _2404 = _1332;
            }
            int _2406 = _2404;
            int _2408 = _2406;
            if (_2386)
            {
                _2408 = _1334;
            }
            int _2410 = _2408;
            int _2412 = _2410;
            if (_2392)
            {
                _2412 = _1336;
            }
            int _2414 = _2412;
            int _2416 = _2414;
            _2114 = 0;
            if (_2398)
            {
                _2416 = _1338;
            }
            int _2418 = _2416;
            int _2420 = _2418;
            if (_2380)
            {
                _2420 = _1340;
            }
            int _2422 = _2420;
            if (!_2402)
            {
                _2108 = _2396;
            }
            int _2424 = _2108;
            _2116 = _2424;
            if (!_2402)
            {
                _2110 = _2086;
            }
            int _2426 = _2110;
            int _2428 = _2122 + 1;
            bool _2430 = _2424 >= _2422;
            int _2432 = _2426;
            _2112 = _2428;
            if (!_2430)
            {
                _2432 = _2122;
            }
            int _2434 = _2432;
            _2118 = _2434;
            if (!_2430)
            {
                _2116 = _2422;
            }
        }
        int _2436 = _2112;
        int _2438 = _2114;
        int _2440 = _2116;
        int _2442 = _2118;
        bool _2444 = _2436 < _1342;
        int _2446 = (_2444 ? (-1) : 0) | _2438;
        int _2448 = ~_2446;
        int _2450 = _2442;
        if (!(_2448 != 0))
        {
            int _2452 = _2436 * 4;
            bool _2454 = _2452 == 4;
            bool _2456 = _2452 == 8;
            bool _2458 = _2452 == 12;
            bool _2460 = _2452 == 16;
            if (_2454)
            {
                _1366 = _1294;
            }
            int _2462 = _1366;
            bool _2464 = _2452 == 20;
            int _2466 = _2462;
            if (_2456)
            {
                _2466 = _1296;
            }
            int _2468 = _2466;
            bool _2470 = _2452 == 24;
            int _2472 = _2468;
            if (_2458)
            {
                _2472 = _1298;
            }
            int _2474 = _2472;
            bool _2476 = _2452 == 28;
            int _2478 = _2474;
            if (_2460)
            {
                _2478 = _1300;
            }
            int _2480 = _2478;
            bool _2482 = _2452 == 32;
            int _2484 = _2480;
            if (_2464)
            {
                _2484 = _1302;
            }
            int _2486 = _2484;
            bool _2488 = _2452 == 36;
            int _2490 = _2486;
            if (_2470)
            {
                _2490 = _1304;
            }
            int _2492 = _2490;
            bool _2494 = _2452 == 40;
            int _2496 = _2492;
            if (_2476)
            {
                _2496 = _1306;
            }
            int _2498 = _2496;
            bool _2500 = _2452 == 44;
            int _2502 = _2498;
            if (_2482)
            {
                _2502 = _1308;
            }
            int _2504 = _2502;
            bool _2506 = _2452 == 48;
            int _2508 = _2504;
            if (_2488)
            {
                _2508 = _1310;
            }
            int _2510 = _2508;
            bool _2512 = _2452 == 52;
            int _2514 = _2510;
            if (_2494)
            {
                _2514 = _1312;
            }
            int _2516 = _2514;
            bool _2518 = _2452 == 56;
            int _2520 = _2516;
            if (_2500)
            {
                _2520 = _1314;
            }
            int _2522 = _2520;
            bool _2524 = _2452 == 60;
            int _2526 = _2522;
            if (_2506)
            {
                _2526 = _1316;
            }
            int _2528 = _2526;
            bool _2530 = _2452 == 64;
            int _2532 = _2528;
            if (_2512)
            {
                _2532 = _1318;
            }
            int _2534 = _2532;
            bool _2536 = _2452 == 68;
            int _2538 = _2534;
            if (_2518)
            {
                _2538 = _1320;
            }
            int _2540 = _2538;
            bool _2542 = _2452 == 72;
            int _2544 = _2540;
            if (_2524)
            {
                _2544 = _1322;
            }
            int _2546 = _2544;
            bool _2548 = _2452 == 76;
            int _2550 = _2546;
            if (_2530)
            {
                _2550 = _1324;
            }
            int _2552 = _2550;
            bool _2554 = _2452 == 80;
            int _2556 = _2552;
            if (_2536)
            {
                _2556 = _1326;
            }
            int _2558 = _2556;
            bool _2560 = _2452 == 84;
            int _2562 = _2558;
            if (_2542)
            {
                _2562 = _1328;
            }
            int _2564 = _2562;
            bool _2566 = _2452 == 88;
            int _2568 = _2564;
            if (_2548)
            {
                _2568 = _1330;
            }
            int _2570 = _2568;
            bool _2572 = _2452 == 92;
            int _2574 = _2570;
            if (_2554)
            {
                _2574 = _1332;
            }
            int _2576 = _2574;
            bool _2578 = _2452 == 96;
            int _2580 = _2576;
            if (_2560)
            {
                _2580 = _1334;
            }
            int _2582 = _2580;
            int _2584 = _2582;
            if (_2566)
            {
                _2584 = _1336;
            }
            int _2586 = _2584;
            int _2588 = _2586;
            if (_2572)
            {
                _2588 = _1338;
            }
            int _2590 = _2588;
            int _2592 = _2590;
            if (_2578)
            {
                _2592 = _1340;
            }
            int _2594 = _2592;
            bool _2596 = _2440 >= _2594;
            if (!_2596)
            {
                _2450 = _2436;
            }
        }
        int _2598 = _2450;
        _1374 = _2598;
    }
    int _2600 = _1374;
    int _2602 = _2600 * 8;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    float _2606 = as_type<float>(_31[int(_2604)]);
    int _2608 = _2602 + 4;
    uint _2610 = uint(int(uint(_2608) >> uint(2)));
    float _2612 = as_type<float>(_31[int(_2610)]);
    int _2614 = _69 + 16;
    uint _2616 = uint(int(uint(_2614) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2616)] = as_type<uint>(_2606);
    int _2618 = _2614 + 4;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2620)] = as_type<uint>(_2612);
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


vertex void main0_discard(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _870 = false;
    bool _694 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _2641 = float2((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    float4 _55 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2641, float2(0.0), isnan(_2641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2641, float2(0.0), isnan(_2641)), level(0.0)).xyzw;
    float _58 = _55.x;
    float _60 = _55.y;
    float _62 = _55.z;
    float _64 = _55.w;
    float _66 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _69 = as_type<int>(_66) * 32;
    uint _72 = uint(int(uint(_69) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_72)] = as_type<uint>(_58);
    int _74 = _69 + 4;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_76)] = as_type<uint>(_60);
    int _78 = _69 + 8;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_80)] = as_type<uint>(_62);
    int _82 = _69 + 12;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_84)] = as_type<uint>(_64);
    int _86 = -2;
    int _88 = 0;
    int _90 = 0;
    int _92 = 0;
    int _94 = 0;
    int _96 = 0;
    int _98 = 0;
    int _100 = 0;
    int _102 = 0;
    int _104 = 0;
    int _106 = 0;
    int _108 = 0;
    int _110 = 0;
    int _112 = 0;
    int _114 = 0;
    int _116 = 0;
    int _118 = 0;
    int _120 = 0;
    int _122 = 0;
    int _124 = 0;
    int _126 = 0;
    int _128 = 0;
    int _130 = 0;
    int _132 = 0;
    int _134 = 0;
    int _136 = 0;
    int _138 = 0;
    bool _142;
    bool _280;
    int _658;
    int _660;
    int _662;
    bool _670;
    int _672;
    int _726;
    int _728;
    int _734;
    int _740;
    int _746;
    int _752;
    int _758;
    int _764;
    int _770;
    int _776;
    int _782;
    int _788;
    int _794;
    int _800;
    int _806;
    int _812;
    bool _816;
    int _818;
    int _822;
    int _828;
    int _834;
    int _840;
    int _846;
    int _850;
    int _854;
    int _858;
    int _862;
    int _866;
    int _868;
    int _1228;
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
    int _1332;
    int _1334;
    int _1336;
    int _1338;
    int _1340;
    int _1342;
    int _1356;
    int _1358;
    int _1360;
    int _1362;
    int _1364;
    int _1366;
    do
    {
        int _144 = _86;
        int _146 = _88;
        int _148 = _90;
        int _150 = _92;
        int _152 = _94;
        int _154 = _96;
        int _156 = _98;
        int _158 = _100;
        int _160 = _102;
        int _162 = _104;
        int _164 = _106;
        int _166 = _108;
        int _168 = _110;
        int _170 = _112;
        int _172 = _114;
        int _174 = _116;
        int _176 = _118;
        int _178 = _120;
        int _180 = _122;
        int _182 = _124;
        int _184 = _126;
        int _186 = _128;
        int _188 = _130;
        int _190 = _132;
        int _192 = _134;
        int _194 = _136;
        int _196 = _138;
        float _198 = float(_144);
        float _200 = _198 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _202 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _204 = fma(_200, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2759 = float2(_202, _204);
        float4 _206 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2759, float2(0.0), isnan(_2759)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2759, float2(0.0), isnan(_2759)), level(0.0)).xyzw;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = _206.z;
        float _214 = _206.w;
        int _216 = -2;
        float _218 = _214;
        float _220 = _210;
        float _222 = _212;
        float _224 = _208;
        int _226 = _146;
        int _228 = _148;
        int _230 = _150;
        int _232 = _152;
        int _234 = _154;
        int _236 = _156;
        int _238 = _158;
        int _240 = _160;
        int _242 = _162;
        int _244 = _164;
        int _246 = _166;
        int _248 = _168;
        int _250 = _170;
        int _252 = _172;
        int _254 = _174;
        int _256 = _176;
        int _258 = _178;
        int _260 = _180;
        int _262 = _182;
        int _264 = _184;
        int _266 = _186;
        int _268 = _188;
        int _270 = _190;
        int _272 = _192;
        int _274 = _194;
        int _276 = _196;
        int _278 = -2;
        do
        {
            int _282 = _216;
            float _284 = _218;
            float _286 = _220;
            float _288 = _222;
            float _290 = _224;
            int _292 = _226;
            int _294 = _228;
            int _296 = _230;
            int _298 = _232;
            int _300 = _234;
            int _302 = _236;
            int _304 = _238;
            int _306 = _240;
            int _308 = _242;
            int _310 = _244;
            int _312 = _246;
            int _314 = _248;
            int _316 = _250;
            int _318 = _252;
            int _320 = _254;
            int _322 = _256;
            int _324 = _258;
            int _326 = _260;
            int _328 = _262;
            int _330 = _264;
            int _332 = _266;
            int _334 = _268;
            int _336 = _270;
            int _338 = _272;
            int _340 = _274;
            int _342 = _276;
            int _344 = _278;
            int _346 = _282 + 1;
            float _348 = float(_144);
            float _350 = float(_346);
            float _352 = _348 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _354 = _350 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _356 = 0.0 + _284;
            float _358 = precise::clamp(_356, 0.0, 1.0);
            float _360 = fma(_352, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _362 = 0.0 + _286;
            float _364 = precise::clamp(_362, 0.0, 1.0);
            float _366 = fma(_354, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _368 = 0.0 + _288;
            float _370 = precise::clamp(_368, 0.0, 1.0);
            float _372 = 0.0 + _290;
            float _374 = precise::clamp(_372, 0.0, 1.0);
            float2 _2877 = float2(_366, _360);
            float4 _376 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2877, float2(0.0), isnan(_2877)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2877, float2(0.0), isnan(_2877)), level(0.0)).xyzw;
            float _378 = _376.x;
            float _380 = _376.y;
            float _382 = _376.z;
            float _384 = _376.w;
            float _386 = _358 * 65535.0;
            float _388 = _370 * 65535.0;
            float _390 = _364 * 65535.0;
            float _392 = _374 * 65535.0;
            float _394 = rint(_386);
            int _396 = int(_394);
            float _398 = rint(_388);
            int _400 = int(_398);
            float _402 = rint(_390);
            int _404 = int(_402);
            uint _406 = extract_bits(uint(_396), 0u, 8u);
            int _408 = int(_406) & 255;
            uint _410 = extract_bits(uint(_396), 8u, 8u);
            int _412 = int(_410) & 255;
            int _414 = _412 << 8;
            int _416 = _408 | _414;
            float _418 = rint(_392);
            int _420 = int(_418);
            uint _422 = extract_bits(uint(_416), 0u, 8u);
            int _424 = int(_422) & 255;
            uint _426 = extract_bits(uint(_416), 8u, 8u);
            int _428 = int(_426) & 255;
            int _430 = _428 << 8;
            int _432 = _424 | _430;
            uint _434 = extract_bits(uint(_400), 0u, 8u);
            int _436 = int(_434) & 255;
            int _438 = _436 << 16;
            int _440 = _432 | _438;
            uint _442 = extract_bits(uint(_400), 8u, 8u);
            int _444 = int(_442) & 255;
            int _446 = _444 << 24;
            int _448 = _440 | _446;
            bool _450 = _448 != 0;
            uint _452 = extract_bits(uint(_404), 0u, 8u);
            int _454 = int(_452) & 255;
            uint _456 = extract_bits(uint(_404), 8u, 8u);
            int _458 = int(_456) & 255;
            int _460 = _458 << 8;
            int _462 = _454 | _460;
            uint _464 = extract_bits(uint(_462), 0u, 8u);
            int _466 = int(_464) & 255;
            uint _468 = extract_bits(uint(_462), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 8;
            int _474 = _466 | _472;
            uint _476 = extract_bits(uint(_420), 0u, 8u);
            int _478 = int(_476) & 255;
            int _480 = _478 << 16;
            int _482 = _474 | _480;
            uint _484 = extract_bits(uint(_420), 8u, 8u);
            int _486 = int(_484) & 255;
            int _488 = _486 << 24;
            int _490 = _482 | _488;
            bool _492 = _490 != 0;
            bool _494 = _492 || _450;
            bool _496 = !_494;
            _216 = _346;
            _218 = _384;
            _220 = _380;
            _222 = _382;
            _224 = _378;
            int _498 = _302;
            int _500 = _294;
            int _502 = _296;
            int _504 = _298;
            int _506 = _300;
            int _508 = _304;
            int _510 = _306;
            int _512 = _316;
            int _514 = _308;
            int _516 = _310;
            int _518 = _312;
            int _520 = _314;
            int _522 = _318;
            int _524 = _320;
            int _526 = _330;
            int _528 = _322;
            int _530 = _324;
            int _532 = _326;
            int _534 = _328;
            int _536 = _332;
            int _538 = _334;
            int _540 = _336;
            int _542 = _338;
            int _544 = _340;
            int _546 = _342;
            int _548 = _448;
            int _550 = _294;
            int _552 = _296;
            int _554 = _298;
            int _556 = _300;
            int _558 = _338;
            int _560 = _340;
            int _562 = _342;
            int _564 = _302;
            int _566 = _304;
            int _568 = _306;
            int _570 = _308;
            int _572 = _310;
            int _574 = _312;
            int _576 = _314;
            int _578 = _316;
            int _580 = _318;
            int _582 = _320;
            int _584 = _322;
            int _586 = _324;
            int _588 = _326;
            int _590 = _328;
            int _592 = _336;
            int _594 = _334;
            int _596 = _332;
            int _598 = _292;
            int _600 = _294;
            int _602 = _296;
            int _604 = _298;
            int _606 = _300;
            int _608 = _302;
            int _610 = _304;
            int _612 = _306;
            int _614 = _308;
            int _616 = _310;
            int _618 = _312;
            int _620 = _314;
            int _622 = _316;
            int _624 = _318;
            int _626 = _320;
            int _628 = _322;
            int _630 = _324;
            int _632 = _326;
            int _634 = _328;
            int _636 = _330;
            int _638 = _332;
            int _640 = _334;
            int _642 = _336;
            int _644 = _338;
            int _646 = _340;
            int _648 = _342;
            int _650 = _490;
            int _652 = _420;
            int _654 = _448;
            int _656 = _416;
            _658 = _490;
            _660 = _448;
            _662 = as_type<int>(_382);
            if (!_496)
            {
                bool _664 = _292 > 0;
                bool _666 = !_664;
                if (!_666)
                {
                    int _668 = 0;
                    do
                    {
                        _672 = _668;
                        int _674 = _672 * 8;
                        uint _676 = uint(int(uint(_674) >> uint(2)));
                        float _678 = as_type<float>(_31[int(_676)]);
                        int _680 = _674 + 4;
                        uint _682 = uint(int(uint(_680) >> uint(2)));
                        float _684 = as_type<float>(_31[int(_682)]);
                        bool _686 = as_type<int>(_678) != _448;
                        bool _688 = as_type<int>(_684) != _490;
                        bool _690 = _688 || _686;
                        bool _692 = !_690;
                        _694 = _692;
                        if (_694)
                        {
                            break;
                        }
                        int _696 = _672 + 1;
                        bool _698 = _696 >= _292;
                        _670 = !_698;
                        _668 = _696;
                    } while (_670);
                }
                if (!_694)
                {
                    int _700 = _292 * 4;
                    int _702 = _292 * 8;
                    int _704 = _292 + 1;
                    bool _706 = _700 == 16;
                    bool _708 = _700 == 0;
                    uint _710 = uint(int(uint(_702) >> uint(2)));
                    _31[int(_710)] = uint(_448);
                    int _712 = _702 + 4;
                    uint _714 = uint(int(uint(_712) >> uint(2)));
                    _31[int(_714)] = uint(_490);
                    bool _716 = _700 == 4;
                    bool _718 = _700 == 8;
                    bool _720 = _700 == 12;
                    bool _722 = _700 == 20;
                    bool _724 = _700 == 24;
                    _598 = _704;
                    _652 = _702;
                    _656 = _700;
                    _726 = _702;
                    _728 = _700;
                    if (_706)
                    {
                        _498 = 1;
                    }
                    int _730 = _498;
                    bool _732 = _700 == 44;
                    _608 = _730;
                    _734 = _730;
                    if (_708)
                    {
                        _500 = 1;
                    }
                    int _736 = _500;
                    bool _738 = _700 == 28;
                    _600 = _736;
                    _740 = _736;
                    if (_716)
                    {
                        _502 = 1;
                    }
                    int _742 = _502;
                    bool _744 = _700 == 32;
                    _602 = _742;
                    _746 = _742;
                    if (_718)
                    {
                        _504 = 1;
                    }
                    int _748 = _504;
                    bool _750 = _700 == 36;
                    _604 = _748;
                    _752 = _748;
                    if (_720)
                    {
                        _506 = 1;
                    }
                    int _754 = _506;
                    bool _756 = _700 == 40;
                    _606 = _754;
                    _758 = _754;
                    if (_722)
                    {
                        _508 = 1;
                    }
                    int _760 = _508;
                    bool _762 = _700 == 48;
                    _610 = _760;
                    _764 = _760;
                    if (_724)
                    {
                        _510 = 1;
                    }
                    int _766 = _510;
                    bool _768 = _700 == 52;
                    _612 = _766;
                    _770 = _766;
                    if (_732)
                    {
                        _512 = 1;
                    }
                    int _772 = _512;
                    bool _774 = _700 == 72;
                    _622 = _772;
                    _776 = _772;
                    if (_738)
                    {
                        _514 = 1;
                    }
                    int _778 = _514;
                    bool _780 = _700 == 56;
                    _614 = _778;
                    _782 = _778;
                    if (_744)
                    {
                        _516 = 1;
                    }
                    int _784 = _516;
                    bool _786 = _700 == 60;
                    _616 = _784;
                    _788 = _784;
                    if (_750)
                    {
                        _518 = 1;
                    }
                    int _790 = _518;
                    bool _792 = _700 == 64;
                    _618 = _790;
                    _794 = _790;
                    if (_756)
                    {
                        _520 = 1;
                    }
                    int _796 = _520;
                    bool _798 = _700 == 68;
                    _620 = _796;
                    _800 = _796;
                    if (_762)
                    {
                        _522 = 1;
                    }
                    int _802 = _522;
                    bool _804 = _700 == 76;
                    _624 = _802;
                    _806 = _802;
                    if (_768)
                    {
                        _524 = 1;
                    }
                    int _808 = _524;
                    bool _810 = _700 == 80;
                    _626 = _808;
                    _812 = _808;
                    if (_774)
                    {
                        _526 = 1;
                    }
                    int _814 = _526;
                    _816 = _704 != 25;
                    _636 = _814;
                    _818 = _814;
                    if (_780)
                    {
                        _528 = 1;
                    }
                    int _820 = _528;
                    _628 = _820;
                    _822 = _820;
                    if (_786)
                    {
                        _530 = 1;
                    }
                    int _824 = _530;
                    bool _826 = _700 == 84;
                    _630 = _824;
                    _828 = _824;
                    if (_792)
                    {
                        _532 = 1;
                    }
                    int _830 = _532;
                    bool _832 = _700 == 88;
                    _632 = _830;
                    _834 = _830;
                    if (_798)
                    {
                        _534 = 1;
                    }
                    int _836 = _534;
                    bool _838 = _700 == 92;
                    _634 = _836;
                    _840 = _836;
                    if (_804)
                    {
                        _536 = 1;
                    }
                    int _842 = _536;
                    bool _844 = _700 == 96;
                    _638 = _842;
                    _846 = _842;
                    if (_810)
                    {
                        _538 = 1;
                    }
                    int _848 = _538;
                    _640 = _848;
                    _850 = _848;
                    if (_826)
                    {
                        _540 = 1;
                    }
                    int _852 = _540;
                    _642 = _852;
                    _854 = _852;
                    if (_832)
                    {
                        _542 = 1;
                    }
                    int _856 = _542;
                    _644 = _856;
                    _858 = _856;
                    if (_838)
                    {
                        _544 = 1;
                    }
                    int _860 = _544;
                    _646 = _860;
                    _862 = _860;
                    if (_844)
                    {
                        _546 = 1;
                    }
                    int _864 = _546;
                    _648 = _864;
                    _866 = _864;
                }
                if ((!_816) || _694)
                {
                    if (!_694)
                    {
                        _868 = 25;
                        _870 = true;
                        if (_870)
                        {
                            break;
                        }
                    }
                    _694 = false;
                    int _872 = _672 * 4;
                    bool _874 = _872 == 0;
                    bool _876 = _872 == 4;
                    bool _878 = _872 == 8;
                    bool _880 = _872 == 12;
                    bool _882 = _872 == 88;
                    bool _884 = _872 == 92;
                    bool _886 = _872 == 96;
                    if (_874)
                    {
                        _548 = _294;
                    }
                    int _888 = _548;
                    bool _890 = _872 == 16;
                    int _892 = _888;
                    if (_876)
                    {
                        _892 = _296;
                    }
                    int _894 = _892;
                    bool _896 = _872 == 20;
                    int _898 = _894;
                    if (_878)
                    {
                        _898 = _298;
                    }
                    int _900 = _898;
                    bool _902 = _872 == 24;
                    int _904 = _900;
                    if (_880)
                    {
                        _904 = _300;
                    }
                    int _906 = _904;
                    bool _908 = _872 == 84;
                    int _910 = int(_902);
                    int _912 = _896 ? 2 : 0;
                    int _914 = _910 | _912;
                    int _916 = _890 ? 4 : 0;
                    int _918 = _914 | _916;
                    int _920 = _908 ? 8 : 0;
                    int _922 = _918 | _920;
                    int _924 = _882 ? 16 : 0;
                    int _926 = _922 | _924;
                    int _928 = _884 ? 32 : 0;
                    int _930 = _926 | _928;
                    int _932 = _886 ? 64 : 0;
                    int _934 = _930 | _932;
                    int _936 = _934 & 8;
                    int _938 = _906;
                    _650 = _936;
                    if (_890)
                    {
                        _938 = _302;
                    }
                    int _940 = _938;
                    bool _942 = _872 == 80;
                    int _944 = _940;
                    if (_896)
                    {
                        _944 = _304;
                    }
                    int _946 = _944;
                    bool _948 = _872 == 76;
                    int _950 = _946;
                    if (_902)
                    {
                        _950 = _306;
                    }
                    int _952 = _950;
                    bool _954 = _872 == 28;
                    int _956 = int(_954);
                    int _958 = _948 ? 2 : 0;
                    int _960 = _956 | _958;
                    int _962 = _942 ? 4 : 0;
                    int _964 = _960 | _962;
                    int _966 = _908 ? 8 : 0;
                    int _968 = _964 | _966;
                    int _970 = _882 ? 16 : 0;
                    int _972 = _968 | _970;
                    int _974 = _884 ? 32 : 0;
                    int _976 = _972 | _974;
                    int _978 = _886 ? 64 : 0;
                    int _980 = _976 | _978;
                    int _982 = _980 & 2;
                    int _984 = int(_954);
                    int _986 = _948 ? 2 : 0;
                    int _988 = _984 | _986;
                    int _990 = _942 ? 4 : 0;
                    int _992 = _988 | _990;
                    int _994 = _908 ? 8 : 0;
                    int _996 = _992 | _994;
                    int _998 = _882 ? 16 : 0;
                    int _1000 = _996 | _998;
                    int _1002 = _884 ? 32 : 0;
                    int _1004 = _1000 | _1002;
                    int _1006 = _886 ? 64 : 0;
                    int _1008 = _1004 | _1006;
                    int _1010 = _1008 & 4;
                    int _1012 = _952;
                    _652 = _982;
                    _656 = _1010;
                    if (_954)
                    {
                        _1012 = _308;
                    }
                    int _1014 = _1012;
                    bool _1016 = _872 == 32;
                    int _1018 = _1014;
                    if (_1016)
                    {
                        _1018 = _310;
                    }
                    int _1020 = _1018;
                    bool _1022 = _872 == 36;
                    int _1024 = _1020;
                    if (_1022)
                    {
                        _1024 = _312;
                    }
                    int _1026 = _1024;
                    bool _1028 = _872 == 40;
                    int _1030 = _1026;
                    if (_1028)
                    {
                        _1030 = _314;
                    }
                    int _1032 = _1030;
                    bool _1034 = _872 == 44;
                    int _1036 = _1032;
                    if (_1034)
                    {
                        _1036 = _316;
                    }
                    int _1038 = _1036;
                    bool _1040 = _872 == 48;
                    int _1042 = _1038;
                    if (_1040)
                    {
                        _1042 = _318;
                    }
                    int _1044 = _1042;
                    bool _1046 = _872 == 52;
                    int _1048 = _1044;
                    if (_1046)
                    {
                        _1048 = _320;
                    }
                    int _1050 = _1048;
                    bool _1052 = _872 == 56;
                    int _1054 = _1050;
                    if (_1052)
                    {
                        _1054 = _322;
                    }
                    int _1056 = _1054;
                    bool _1058 = _872 == 60;
                    int _1060 = _1056;
                    if (_1058)
                    {
                        _1060 = _324;
                    }
                    int _1062 = _1060;
                    bool _1064 = _872 == 64;
                    int _1066 = _1062;
                    if (_1064)
                    {
                        _1066 = _326;
                    }
                    int _1068 = _1066;
                    bool _1070 = _872 == 68;
                    int _1072 = _1068;
                    if (_1070)
                    {
                        _1072 = _328;
                    }
                    int _1074 = _1072;
                    bool _1076 = _872 == 72;
                    int _1078 = int(_1076);
                    int _1080 = _948 ? 2 : 0;
                    int _1082 = _1078 | _1080;
                    int _1084 = _942 ? 4 : 0;
                    int _1086 = _1082 | _1084;
                    int _1088 = _908 ? 8 : 0;
                    int _1090 = _1086 | _1088;
                    int _1092 = _882 ? 16 : 0;
                    int _1094 = _1090 | _1092;
                    int _1096 = _884 ? 32 : 0;
                    int _1098 = _1094 | _1096;
                    int _1100 = _886 ? 64 : 0;
                    int _1102 = _1098 | _1100;
                    int _1104 = _1102 & 1;
                    int _1106 = _1074;
                    if (_1076)
                    {
                        _1106 = _330;
                    }
                    int _1108 = _1106;
                    bool _1110 = _872 == 4;
                    int _1112 = _1108;
                    if (_948)
                    {
                        _1112 = _332;
                    }
                    int _1114 = _1112;
                    bool _1116 = _872 == 0;
                    int _1118 = _1114;
                    if (_942)
                    {
                        _1118 = _334;
                    }
                    int _1120 = _1118;
                    bool _1122 = _872 == 12;
                    int _1124 = _1120;
                    if (_908)
                    {
                        _1124 = _336;
                    }
                    int _1126 = _1124;
                    bool _1128 = _872 == 8;
                    int _1130 = _1126;
                    if (_882)
                    {
                        _1130 = _338;
                    }
                    int _1132 = _1130;
                    int _1134 = _1132;
                    if (_884)
                    {
                        _1134 = _340;
                    }
                    int _1136 = _1134;
                    int _1138 = _1136;
                    if (_886)
                    {
                        _1138 = _342;
                    }
                    int _1140 = _1138;
                    int _1142 = _1140 + 1;
                    _654 = _1142;
                    if (_1116)
                    {
                        _550 = _1142;
                    }
                    int _1144 = _550;
                    bool _1146 = _872 == 16;
                    _600 = _1144;
                    if (_1110)
                    {
                        _552 = _1142;
                    }
                    int _1148 = _552;
                    bool _1150 = _872 == 20;
                    _602 = _1148;
                    if (_1128)
                    {
                        _554 = _1142;
                    }
                    int _1152 = _554;
                    bool _1154 = _872 == 24;
                    _604 = _1152;
                    if (_1122)
                    {
                        _556 = _1142;
                    }
                    int _1156 = _556;
                    bool _1158 = _872 == 28;
                    _606 = _1156;
                    if (_882)
                    {
                        _558 = _1142;
                    }
                    int _1160 = _558;
                    _644 = _1160;
                    if (_884)
                    {
                        _560 = _1142;
                    }
                    int _1162 = _560;
                    _646 = _1162;
                    if (_886)
                    {
                        _562 = _1142;
                    }
                    int _1164 = _562;
                    _648 = _1164;
                    if (_1146)
                    {
                        _564 = _1142;
                    }
                    int _1166 = _564;
                    bool _1168 = _872 == 32;
                    _608 = _1166;
                    if (_1150)
                    {
                        _566 = _1142;
                    }
                    int _1170 = _566;
                    bool _1172 = _872 == 36;
                    _610 = _1170;
                    if (_1154)
                    {
                        _568 = _1142;
                    }
                    int _1174 = _568;
                    bool _1176 = _872 == 40;
                    _612 = _1174;
                    if (_1158)
                    {
                        _570 = _1142;
                    }
                    int _1178 = _570;
                    bool _1180 = _872 == 44;
                    _614 = _1178;
                    if (_1168)
                    {
                        _572 = _1142;
                    }
                    int _1182 = _572;
                    bool _1184 = _872 == 48;
                    _616 = _1182;
                    if (_1172)
                    {
                        _574 = _1142;
                    }
                    int _1186 = _574;
                    bool _1188 = _872 == 52;
                    _618 = _1186;
                    if (_1176)
                    {
                        _576 = _1142;
                    }
                    int _1190 = _576;
                    bool _1192 = _872 == 56;
                    _620 = _1190;
                    if (_1180)
                    {
                        _578 = _1142;
                    }
                    int _1194 = _578;
                    bool _1196 = _872 == 60;
                    _622 = _1194;
                    if (_1184)
                    {
                        _580 = _1142;
                    }
                    int _1198 = _580;
                    bool _1200 = _872 == 64;
                    _624 = _1198;
                    if (_1188)
                    {
                        _582 = _1142;
                    }
                    int _1202 = _582;
                    bool _1204 = _872 == 68;
                    _626 = _1202;
                    if (_1192)
                    {
                        _584 = _1142;
                    }
                    int _1206 = _584;
                    bool _1208 = _936 != 0;
                    _628 = _1206;
                    if (_1196)
                    {
                        _586 = _1142;
                    }
                    int _1210 = _586;
                    bool _1212 = _1010 != 0;
                    _630 = _1210;
                    if (_1200)
                    {
                        _588 = _1142;
                    }
                    int _1214 = _588;
                    _632 = _1214;
                    if (_1204)
                    {
                        _590 = _1142;
                    }
                    int _1216 = _590;
                    bool _1218 = _982 != 0;
                    _634 = _1216;
                    if (_1208)
                    {
                        _592 = _1142;
                    }
                    int _1220 = _592;
                    bool _1222 = _1104 != 0;
                    _642 = _1220;
                    if (_1212)
                    {
                        _594 = _1142;
                    }
                    int _1224 = _594;
                    _640 = _1224;
                    if (_1218)
                    {
                        _596 = _1142;
                    }
                    int _1226 = _596;
                    _638 = _1226;
                    if (_1222)
                    {
                        _636 = _1142;
                    }
                }
            }
            _1228 = _598;
            int _1230 = _600;
            int _1232 = _602;
            int _1234 = _604;
            int _1236 = _606;
            int _1238 = _608;
            int _1240 = _610;
            int _1242 = _612;
            int _1244 = _614;
            int _1246 = _616;
            int _1248 = _618;
            int _1250 = _620;
            int _1252 = _622;
            int _1254 = _624;
            int _1256 = _626;
            int _1258 = _628;
            int _1260 = _630;
            int _1262 = _632;
            int _1264 = _634;
            int _1266 = _636;
            int _1268 = _638;
            int _1270 = _640;
            int _1272 = _642;
            int _1274 = _644;
            int _1276 = _646;
            int _1278 = _648;
            int _1280 = _650;
            int _1282 = _652;
            int _1284 = _654;
            int _1286 = _656;
            int _1288 = _344 + 1;
            bool _1290 = _1288 >= 3;
            _280 = !_1290;
            _226 = _1228;
            _228 = _1230;
            _230 = _1232;
            _232 = _1234;
            _234 = _1236;
            _236 = _1238;
            _238 = _1240;
            _240 = _1242;
            _242 = _1244;
            _244 = _1246;
            _246 = _1248;
            _248 = _1250;
            _250 = _1252;
            _252 = _1254;
            _254 = _1256;
            _256 = _1258;
            _258 = _1260;
            _260 = _1262;
            _262 = _1264;
            _264 = _1266;
            _266 = _1268;
            _268 = _1270;
            _270 = _1272;
            _272 = _1274;
            _274 = _1276;
            _276 = _1278;
            _278 = _1288;
            _740 = _1230;
            _746 = _1232;
            _752 = _1234;
            _758 = _1236;
            _734 = _1238;
            _764 = _1240;
            _770 = _1242;
            _782 = _1244;
            _788 = _1246;
            _794 = _1248;
            _800 = _1250;
            _776 = _1252;
            _806 = _1254;
            _812 = _1256;
            _822 = _1258;
            _828 = _1260;
            _834 = _1262;
            _840 = _1264;
            _818 = _1266;
            _846 = _1268;
            _850 = _1270;
            _854 = _1272;
            _858 = _1274;
            _862 = _1276;
            _866 = _1278;
            _658 = _1280;
            _726 = _1282;
            _660 = _1284;
            _728 = _1286;
        } while (_280);
        if (!_870)
        {
            _868 = _1228;
        }
        _870 = false;
        _1292 = _740;
        _1294 = _746;
        _1296 = _752;
        _1298 = _758;
        _1300 = _734;
        _1302 = _764;
        _1304 = _770;
        _1306 = _782;
        _1308 = _788;
        _1310 = _794;
        _1312 = _800;
        _1314 = _776;
        _1316 = _806;
        _1318 = _812;
        _1320 = _822;
        _1322 = _828;
        _1324 = _834;
        _1326 = _840;
        _1328 = _818;
        _1330 = _846;
        _1332 = _850;
        _1334 = _854;
        _1336 = _858;
        _1338 = _862;
        _1340 = _866;
        _1342 = _868;
        int _1344 = _658;
        int _1346 = _726;
        int _1348 = _660;
        int _1350 = _728;
        int _1352 = _144 + 1;
        bool _1354 = _1352 >= 3;
        _142 = !_1354;
        _86 = _1352;
        _88 = _1342;
        _90 = _1292;
        _92 = _1294;
        _94 = _1296;
        _96 = _1298;
        _98 = _1300;
        _100 = _1302;
        _102 = _1304;
        _104 = _1306;
        _106 = _1308;
        _108 = _1310;
        _110 = _1312;
        _112 = _1314;
        _114 = _1316;
        _116 = _1318;
        _118 = _1320;
        _120 = _1322;
        _122 = _1324;
        _124 = _1326;
        _126 = _1328;
        _128 = _1330;
        _130 = _1332;
        _132 = _1334;
        _134 = _1336;
        _136 = _1338;
        _138 = _1340;
        _1356 = _1344;
        _1358 = _1346;
        _1360 = _1348;
        _1362 = _1350;
        _1364 = _1344;
        _1366 = _1292;
    } while (_142);
    bool _1368 = _1342 > 0;
    if (!_1368)
    {
        _662 = 0;
    }
    int _1370 = _662;
    bool _1372 = !_1368;
    int _1374 = _1370;
    if (!_1372)
    {
        bool _1376 = _1342 > 3;
        bool _1378 = !_1376;
        int _1380 = 0;
        int _1382 = 0;
        int _1384 = 0;
        int _1386 = 0;
        int _1388 = 0;
        int _1390 = -1;
        int _1392 = 0;
        if (!_1378)
        {
            int _1394 = _1342 + (-3);
            _1390 = 0;
            bool _1396;
            do
            {
                int _1398 = _1380;
                int _1400 = _1382;
                int _1402 = _1356;
                int _1404 = _1358;
                int _1406 = _1360;
                int _1408 = _1384;
                int _1410 = _1362;
                int _1412 = _1398 * 4;
                int _1414 = _1398 + 1;
                int _1416 = _1398 + 2;
                bool _1418 = _1412 == 0;
                int _1420 = _1414 * 4;
                bool _1422 = _1412 == 4;
                int _1424 = _1416 * 4;
                bool _1426 = _1412 == 8;
                bool _1428 = _1412 == 12;
                bool _1430 = _1412 == 16;
                bool _1432 = _1420 == 8;
                int _1434 = _1398 + 3;
                int _1436 = _1402;
                int _1438 = _1404;
                int _1440 = _1406;
                int _1442 = _1410;
                int _1444 = _1400;
                int _1446 = _1408;
                if (_1418)
                {
                    _1436 = _1292;
                }
                int _1448 = _1436;
                bool _1450 = _1412 == 24;
                int _1452 = _1448;
                if (_1422)
                {
                    _1452 = _1294;
                }
                int _1454 = _1452;
                bool _1456 = _1412 == 20;
                int _1458 = _1454;
                if (_1426)
                {
                    _1458 = _1296;
                }
                int _1460 = _1458;
                bool _1462 = _1412 == 32;
                int _1464 = _1460;
                if (_1428)
                {
                    _1464 = _1298;
                }
                int _1466 = _1464;
                bool _1468 = _1412 == 28;
                int _1470 = _1466;
                if (_1430)
                {
                    _1470 = _1300;
                }
                int _1472 = _1470;
                bool _1474 = _1412 == 40;
                int _1476 = _1434 * 4;
                int _1478 = _1472;
                if (_1456)
                {
                    _1478 = _1302;
                }
                int _1480 = _1478;
                bool _1482 = _1412 == 36;
                int _1484 = _1480;
                if (_1450)
                {
                    _1484 = _1304;
                }
                int _1486 = _1484;
                bool _1488 = _1420 == 0;
                int _1490 = _1486;
                if (_1468)
                {
                    _1490 = _1306;
                }
                int _1492 = _1490;
                bool _1494 = _1420 == 4;
                int _1496 = _1492;
                if (_1462)
                {
                    _1496 = _1308;
                }
                int _1498 = _1496;
                bool _1500 = _1420 == 12;
                int _1502 = _1498;
                if (_1482)
                {
                    _1502 = _1310;
                }
                int _1504 = _1502;
                bool _1506 = _1412 == 44;
                int _1508 = _1504;
                if (_1474)
                {
                    _1508 = _1312;
                }
                int _1510 = _1508;
                bool _1512 = _1420 == 16;
                int _1514 = _1510;
                if (_1488)
                {
                    _1438 = _1292;
                }
                int _1516 = _1438;
                bool _1518 = _1412 == 48;
                int _1520 = _1516;
                if (_1494)
                {
                    _1520 = _1294;
                }
                int _1522 = _1520;
                int _1524 = _1522;
                if (_1432)
                {
                    _1524 = _1296;
                }
                int _1526 = _1524;
                bool _1528 = _1420 == 20;
                int _1530 = _1526;
                if (_1500)
                {
                    _1530 = _1298;
                }
                int _1532 = _1530;
                bool _1534 = _1420 == 24;
                bool _1536 = _1420 == 28;
                int _1538 = _1532;
                if (_1506)
                {
                    _1514 = _1314;
                }
                int _1540 = _1514;
                bool _1542 = _1412 == 52;
                int _1544 = _1540;
                if (_1512)
                {
                    _1538 = _1300;
                }
                int _1546 = _1538;
                bool _1548 = _1420 == 32;
                int _1550 = _1546;
                if (_1518)
                {
                    _1544 = _1316;
                }
                int _1552 = _1544;
                bool _1554 = _1412 == 56;
                int _1556 = _1552;
                if (_1528)
                {
                    _1550 = _1302;
                }
                int _1558 = _1550;
                bool _1560 = _1420 == 36;
                int _1562 = _1558;
                if (_1534)
                {
                    _1562 = _1304;
                }
                int _1564 = _1562;
                bool _1566 = _1420 == 40;
                int _1568 = _1564;
                if (_1536)
                {
                    _1568 = _1306;
                }
                int _1570 = _1568;
                bool _1572 = _1420 == 44;
                int _1574 = _1570;
                if (_1542)
                {
                    _1556 = _1318;
                }
                int _1576 = _1556;
                bool _1578 = _1412 == 60;
                int _1580 = _1576;
                if (_1548)
                {
                    _1574 = _1308;
                }
                int _1582 = _1574;
                bool _1584 = _1420 == 48;
                int _1586 = _1582;
                if (_1554)
                {
                    _1580 = _1320;
                }
                int _1588 = _1580;
                bool _1590 = _1412 == 64;
                int _1592 = _1588;
                if (_1560)
                {
                    _1586 = _1310;
                }
                int _1594 = _1586;
                bool _1596 = _1420 == 52;
                int _1598 = _1594;
                if (_1566)
                {
                    _1598 = _1312;
                }
                int _1600 = _1598;
                bool _1602 = _1420 == 56;
                int _1604 = _1600;
                if (_1572)
                {
                    _1604 = _1314;
                }
                int _1606 = _1604;
                bool _1608 = _1420 == 60;
                int _1610 = _1606;
                if (_1578)
                {
                    _1592 = _1322;
                }
                int _1612 = _1592;
                bool _1614 = _1424 == 0;
                int _1616 = _1612;
                if (_1584)
                {
                    _1610 = _1316;
                }
                int _1618 = _1610;
                bool _1620 = _1412 == 68;
                int _1622 = _1618;
                if (_1590)
                {
                    _1616 = _1324;
                }
                int _1624 = _1616;
                bool _1626 = _1424 == 4;
                int _1628 = _1624;
                if (_1596)
                {
                    _1622 = _1318;
                }
                int _1630 = _1622;
                bool _1632 = _1424 == 8;
                int _1634 = _1630;
                if (_1602)
                {
                    _1634 = _1320;
                }
                int _1636 = _1634;
                bool _1638 = _1424 == 12;
                int _1640 = _1636;
                if (_1608)
                {
                    _1640 = _1322;
                }
                int _1642 = _1640;
                bool _1644 = _1424 == 16;
                int _1646 = _1642;
                if (_1614)
                {
                    _1440 = _1292;
                }
                int _1648 = _1440;
                bool _1650 = _1420 == 64;
                int _1652 = _1648;
                if (_1620)
                {
                    _1628 = _1326;
                }
                int _1654 = _1628;
                bool _1656 = _1424 == 20;
                int _1658 = _1654;
                if (_1626)
                {
                    _1652 = _1294;
                }
                int _1660 = _1652;
                bool _1662 = _1412 == 72;
                int _1664 = _1660;
                if (_1632)
                {
                    _1664 = _1296;
                }
                int _1666 = _1664;
                bool _1668 = _1424 == 24;
                int _1670 = _1666;
                if (_1638)
                {
                    _1670 = _1298;
                }
                int _1672 = _1670;
                bool _1674 = _1424 == 28;
                int _1676 = _1672;
                if (_1644)
                {
                    _1676 = _1300;
                }
                int _1678 = _1676;
                int _1680 = _1678;
                if (_1650)
                {
                    _1646 = _1324;
                }
                int _1682 = _1646;
                bool _1684 = _1420 == 68;
                int _1686 = _1682;
                if (_1656)
                {
                    _1680 = _1302;
                }
                int _1688 = _1680;
                bool _1690 = _1424 == 32;
                int _1692 = _1688;
                if (_1662)
                {
                    _1658 = _1328;
                }
                int _1694 = _1658;
                bool _1696 = _1424 == 36;
                bool _1698 = _1412 == 76;
                int _1700 = _1694;
                if (_1668)
                {
                    _1692 = _1304;
                }
                int _1702 = _1692;
                bool _1704 = _1424 == 40;
                int _1706 = _1702;
                if (_1674)
                {
                    _1706 = _1306;
                }
                int _1708 = _1706;
                bool _1710 = _1424 == 44;
                int _1712 = _1708;
                if (_1684)
                {
                    _1686 = _1326;
                }
                int _1714 = _1686;
                bool _1716 = _1420 == 72;
                int _1718 = _1714;
                if (_1690)
                {
                    _1712 = _1308;
                }
                int _1720 = _1712;
                bool _1722 = _1424 == 48;
                int _1724 = _1720;
                if (_1696)
                {
                    _1724 = _1310;
                }
                int _1726 = _1724;
                bool _1728 = _1424 == 52;
                int _1730 = _1726;
                if (_1698)
                {
                    _1700 = _1330;
                }
                int _1732 = _1700;
                bool _1734 = _1412 == 80;
                int _1736 = _1732;
                if (_1704)
                {
                    _1730 = _1312;
                }
                int _1738 = _1730;
                bool _1740 = _1424 == 56;
                int _1742 = _1738;
                if (_1710)
                {
                    _1742 = _1314;
                }
                int _1744 = _1742;
                bool _1746 = _1424 == 60;
                int _1748 = _1744;
                if (_1716)
                {
                    _1718 = _1328;
                }
                int _1750 = _1718;
                bool _1752 = _1424 == 64;
                int _1754 = _1750;
                if (_1722)
                {
                    _1748 = _1316;
                }
                int _1756 = _1748;
                bool _1758 = _1420 == 76;
                int _1760 = _1756;
                if (_1728)
                {
                    _1760 = _1318;
                }
                int _1762 = _1760;
                bool _1764 = _1412 == 84;
                int _1766 = _1762;
                if (_1734)
                {
                    _1736 = _1332;
                }
                int _1768 = _1736;
                bool _1770 = _1424 == 68;
                int _1772 = _1768;
                if (_1740)
                {
                    _1766 = _1320;
                }
                int _1774 = _1766;
                bool _1776 = _1424 == 72;
                int _1778 = _1774;
                if (_1746)
                {
                    _1778 = _1322;
                }
                int _1780 = _1778;
                bool _1782 = _1424 == 76;
                int _1784 = _1780;
                if (_1752)
                {
                    _1784 = _1324;
                }
                int _1786 = _1784;
                bool _1788 = _1476 == 0;
                int _1790 = _1786;
                if (_1758)
                {
                    _1754 = _1330;
                }
                int _1792 = _1754;
                bool _1794 = _1420 == 80;
                int _1796 = _1792;
                if (_1764)
                {
                    _1772 = _1334;
                }
                int _1798 = _1772;
                bool _1800 = _1476 == 4;
                int _1802 = _1798;
                if (_1770)
                {
                    _1790 = _1326;
                }
                int _1804 = _1790;
                bool _1806 = _1424 == 80;
                int _1808 = _1804;
                if (_1776)
                {
                    _1808 = _1328;
                }
                int _1810 = _1808;
                bool _1812 = _1476 == 8;
                int _1814 = _1810;
                if (_1782)
                {
                    _1814 = _1330;
                }
                int _1816 = _1814;
                bool _1818 = _1412 == 88;
                int _1820 = _1816;
                if (_1788)
                {
                    _1442 = _1292;
                }
                int _1822 = _1442;
                bool _1824 = _1476 == 12;
                int _1826 = _1822;
                if (_1794)
                {
                    _1796 = _1332;
                }
                int _1828 = _1796;
                bool _1830 = _1420 == 84;
                int _1832 = _1828;
                if (_1800)
                {
                    _1826 = _1294;
                }
                int _1834 = _1826;
                int _1836 = _1834;
                if (_1806)
                {
                    _1820 = _1332;
                }
                int _1838 = _1820;
                bool _1840 = _1424 == 84;
                int _1842 = _1838;
                if (_1812)
                {
                    _1836 = _1296;
                }
                int _1844 = _1836;
                bool _1846 = _1476 == 16;
                int _1848 = _1844;
                if (_1818)
                {
                    _1802 = _1336;
                }
                int _1850 = _1802;
                bool _1852 = _1412 == 92;
                bool _1854 = _1476 == 20;
                int _1856 = _1850;
                if (_1824)
                {
                    _1848 = _1298;
                }
                int _1858 = _1848;
                bool _1860 = _1420 == 88;
                int _1862 = _1858;
                if (_1830)
                {
                    _1832 = _1334;
                }
                int _1864 = _1832;
                bool _1866 = _1476 == 24;
                int _1868 = _1864;
                if (_1840)
                {
                    _1842 = _1334;
                }
                int _1870 = _1842;
                bool _1872 = _1424 == 88;
                int _1874 = _1870;
                if (_1846)
                {
                    _1862 = _1300;
                }
                int _1876 = _1862;
                bool _1878 = _1476 == 28;
                int _1880 = _1876;
                if (_1852)
                {
                    _1856 = _1338;
                }
                int _1882 = _1856;
                bool _1884 = _1476 == 32;
                int _1886 = _1882;
                if (_1854)
                {
                    _1880 = _1302;
                }
                int _1888 = _1880;
                bool _1890 = _1412 == 96;
                int _1892 = _1888;
                if (_1860)
                {
                    _1868 = _1336;
                }
                int _1894 = _1868;
                bool _1896 = _1476 == 40;
                int _1898 = _1894;
                if (_1866)
                {
                    _1892 = _1304;
                }
                int _1900 = _1892;
                bool _1902 = _1476 == 36;
                int _1904 = _1900;
                if (_1872)
                {
                    _1874 = _1336;
                }
                int _1906 = _1874;
                bool _1908 = _1420 == 92;
                int _1910 = _1906;
                if (_1878)
                {
                    _1904 = _1306;
                }
                int _1912 = _1904;
                bool _1914 = _1476 == 44;
                int _1916 = _1912;
                if (_1884)
                {
                    _1916 = _1308;
                }
                int _1918 = _1916;
                bool _1920 = _1476 == 48;
                int _1922 = _1918;
                if (_1890)
                {
                    _1886 = _1340;
                }
                int _1924 = _1886;
                bool _1926 = _1420 == 96;
                int _1928 = _1924;
                if (_1902)
                {
                    _1922 = _1310;
                }
                int _1930 = _1922;
                bool _1932 = _1476 == 52;
                int _1934 = _1930;
                if (_1896)
                {
                    _1934 = _1312;
                }
                int _1936 = _1934;
                bool _1938 = _1400 >= _1924;
                int _1940 = _1936;
                if (_1908)
                {
                    _1898 = _1338;
                }
                int _1942 = _1898;
                bool _1944 = _1476 == 56;
                int _1946 = _1942;
                if (_1914)
                {
                    _1940 = _1314;
                }
                int _1948 = _1940;
                bool _1950 = _1476 == 60;
                int _1952 = _1948;
                if (_1920)
                {
                    _1952 = _1316;
                }
                int _1954 = _1952;
                bool _1956 = _1476 == 64;
                int _1958 = _1954;
                if (_1926)
                {
                    _1946 = _1340;
                }
                int _1960 = _1946;
                bool _1962 = _1424 == 92;
                _1358 = _1960;
                if (_1932)
                {
                    _1958 = _1318;
                }
                int _1964 = _1958;
                bool _1966 = _1476 == 68;
                int _1968 = _1964;
                if (!_1938)
                {
                    _1444 = _1924;
                }
                int _1970 = _1444;
                int _1972 = _1970;
                if (_1944)
                {
                    _1968 = _1320;
                }
                int _1974 = _1968;
                bool _1976 = _1476 == 72;
                int _1978 = _1974;
                if (_1950)
                {
                    _1978 = _1322;
                }
                int _1980 = _1978;
                bool _1982 = _1970 >= _1960;
                int _1984 = _1980;
                if (_1956)
                {
                    _1984 = _1324;
                }
                int _1986 = _1984;
                int _1988 = _1986;
                if (_1962)
                {
                    _1910 = _1338;
                }
                int _1990 = _1910;
                bool _1992 = _1424 == 96;
                bool _1994 = _1476 == 76;
                int _1996 = _1990;
                if (_1966)
                {
                    _1988 = _1326;
                }
                int _1998 = _1988;
                bool _2000 = _1476 == 80;
                int _2002 = _1998;
                if (_1976)
                {
                    _2002 = _1328;
                }
                int _2004 = _2002;
                bool _2006 = _1476 == 84;
                int _2008 = _2004;
                if (_1982)
                {
                    _1928 = _1970;
                }
                int _2010 = _1928;
                int _2012 = _2010;
                if (!_1982)
                {
                    _2012 = _1960;
                }
                int _2014 = _2012;
                int _2016 = _2014;
                if (_1992)
                {
                    _1996 = _1340;
                }
                int _2018 = _1996;
                bool _2020 = _1476 == 88;
                _1360 = _2018;
                if (_1994)
                {
                    _2008 = _1330;
                }
                int _2022 = _2008;
                bool _2024 = _1476 == 92;
                int _2026 = _2022;
                if (_2000)
                {
                    _2026 = _1332;
                }
                int _2028 = _2026;
                bool _2030 = _2014 >= _2018;
                int _2032 = _2028;
                if (_1938)
                {
                    _1972 = _1408;
                }
                int _2034 = _1972;
                int _2036 = _2034;
                if (_2006)
                {
                    _2032 = _1334;
                }
                int _2038 = _2032;
                bool _2040 = _1476 == 96;
                int _2042 = _2038;
                if (!_1938)
                {
                    _2036 = _1398;
                }
                int _2044 = _2036;
                int _2046 = _1398 + 4;
                _1380 = _2046;
                int _2048 = _2044;
                _1386 = _2046;
                if (!_1982)
                {
                    _2048 = _1414;
                }
                int _2050 = _2048;
                int _2052 = _2050;
                if (_2020)
                {
                    _2042 = _1336;
                }
                int _2054 = _2042;
                bool _2056 = _2046 >= _1394;
                int _2058 = _2054;
                if (_2024)
                {
                    _2058 = _1338;
                }
                int _2060 = _2058;
                int _2062 = _2060;
                if (!_2030)
                {
                    _2016 = _2018;
                }
                int _2064 = _2016;
                _1356 = _2064;
                _1364 = _2064;
                if (!_2030)
                {
                    _2052 = _1416;
                }
                int _2066 = _2052;
                int _2068 = _2066;
                if (_2040)
                {
                    _2062 = _1340;
                }
                int _2070 = _2062;
                bool _2072 = _2064 >= _2070;
                _1362 = _2070;
                if (_2072)
                {
                    _1446 = _2066;
                }
                int _2074 = _1446;
                int _2076 = _2074;
                if (_2072)
                {
                    _2068 = _2064;
                }
                int _2078 = _2068;
                int _2080 = _2078;
                if (!_2072)
                {
                    _2076 = _1434;
                }
                int _2082 = _2076;
                _1384 = _2082;
                _1392 = _2082;
                if (!_2072)
                {
                    _2080 = _2070;
                }
                int _2084 = _2080;
                _1396 = !_2056;
                _1382 = _2084;
                _1388 = _2084;
            } while (_1396);
        }
        int _2086 = _1386;
        int _2088 = _1388;
        int _2090 = _1364;
        int _2092 = _1390;
        int _2094 = _1392;
        int _2096 = -_2086;
        int _2098 = _1342 + _2096;
        bool _2100 = _2098 > 1;
        bool _2102 = !_2100;
        int _2104 = _2090;
        int _2106 = _2098;
        int _2108 = _2088;
        int _2110 = _2094;
        int _2112 = _2086;
        int _2114 = _2092;
        int _2116 = _2088;
        int _2118 = _2094;
        if (!_2102)
        {
            int _2120 = _2086 * 4;
            int _2122 = _2086 + 1;
            bool _2124 = _2120 == 0;
            int _2126 = _2122 * 4;
            bool _2128 = _2120 == 4;
            bool _2130 = _2120 == 8;
            bool _2132 = _2120 == 12;
            bool _2134 = _2120 == 24;
            bool _2136 = _2126 == 0;
            bool _2138 = _2120 == 40;
            if (_2124)
            {
                _2104 = _1292;
            }
            int _2140 = _2104;
            bool _2142 = _2120 == 16;
            int _2144 = _2140;
            if (_2128)
            {
                _2144 = _1294;
            }
            int _2146 = _2144;
            bool _2148 = _2120 == 20;
            int _2150 = _2146;
            if (_2130)
            {
                _2150 = _1296;
            }
            int _2152 = _2150;
            bool _2154 = _2120 == 36;
            int _2156 = _2152;
            if (_2132)
            {
                _2156 = _1298;
            }
            int _2158 = _2156;
            bool _2160 = _2120 == 28;
            int _2162 = _2158;
            if (_2136)
            {
                _2106 = _1292;
            }
            int _2164 = _2106;
            bool _2166 = _2126 == 16;
            int _2168 = _2164;
            if (_2142)
            {
                _2162 = _1300;
            }
            int _2170 = _2162;
            bool _2172 = _2120 == 32;
            int _2174 = _2170;
            if (_2148)
            {
                _2174 = _1302;
            }
            int _2176 = _2174;
            bool _2178 = _2120 == 48;
            int _2180 = _2176;
            if (_2134)
            {
                _2180 = _1304;
            }
            int _2182 = _2180;
            bool _2184 = _2126 == 4;
            int _2186 = _2182;
            if (_2160)
            {
                _2186 = _1306;
            }
            int _2188 = _2186;
            bool _2190 = _2120 == 44;
            int _2192 = _2188;
            if (_2172)
            {
                _2192 = _1308;
            }
            int _2194 = _2192;
            bool _2196 = _2126 == 8;
            int _2198 = _2194;
            if (_2154)
            {
                _2198 = _1310;
            }
            int _2200 = _2198;
            bool _2202 = _2126 == 12;
            int _2204 = _2200;
            if (_2184)
            {
                _2168 = _1294;
            }
            int _2206 = _2168;
            bool _2208 = _2120 == 52;
            int _2210 = _2206;
            if (_2138)
            {
                _2204 = _1312;
            }
            int _2212 = _2204;
            bool _2214 = _2126 == 20;
            int _2216 = _2212;
            if (_2190)
            {
                _2216 = _1314;
            }
            int _2218 = _2216;
            bool _2220 = _2126 == 24;
            int _2222 = _2218;
            if (_2178)
            {
                _2222 = _1316;
            }
            int _2224 = _2222;
            bool _2226 = _2120 == 60;
            int _2228 = _2224;
            if (_2196)
            {
                _2210 = _1296;
            }
            int _2230 = _2210;
            bool _2232 = _2120 == 56;
            int _2234 = _2230;
            if (_2202)
            {
                _2234 = _1298;
            }
            int _2236 = _2234;
            bool _2238 = _2126 == 28;
            int _2240 = _2236;
            if (_2166)
            {
                _2240 = _1300;
            }
            int _2242 = _2240;
            bool _2244 = _2126 == 32;
            int _2246 = _2242;
            if (_2214)
            {
                _2246 = _1302;
            }
            int _2248 = _2246;
            bool _2250 = _2126 == 36;
            int _2252 = _2248;
            if (_2208)
            {
                _2228 = _1318;
            }
            int _2254 = _2228;
            bool _2256 = _2120 == 64;
            int _2258 = _2254;
            if (_2220)
            {
                _2252 = _1304;
            }
            int _2260 = _2252;
            bool _2262 = _2120 == 68;
            int _2264 = _2260;
            if (_2232)
            {
                _2258 = _1320;
            }
            int _2266 = _2258;
            bool _2268 = _2126 == 40;
            int _2270 = _2266;
            if (_2238)
            {
                _2264 = _1306;
            }
            int _2272 = _2264;
            bool _2274 = _2120 == 72;
            int _2276 = _2272;
            if (_2226)
            {
                _2270 = _1322;
            }
            int _2278 = _2270;
            bool _2280 = _2126 == 44;
            int _2282 = _2278;
            if (_2244)
            {
                _2276 = _1308;
            }
            int _2284 = _2276;
            bool _2286 = _2126 == 48;
            int _2288 = _2284;
            if (_2250)
            {
                _2288 = _1310;
            }
            int _2290 = _2288;
            bool _2292 = _2120 == 76;
            int _2294 = _2290;
            if (_2256)
            {
                _2282 = _1324;
            }
            int _2296 = _2282;
            bool _2298 = _2126 == 52;
            int _2300 = _2296;
            if (_2262)
            {
                _2300 = _1326;
            }
            int _2302 = _2300;
            bool _2304 = _2120 == 80;
            int _2306 = _2302;
            if (_2268)
            {
                _2294 = _1312;
            }
            int _2308 = _2294;
            bool _2310 = _2126 == 56;
            int _2312 = _2308;
            if (_2274)
            {
                _2306 = _1328;
            }
            int _2314 = _2306;
            int _2316 = _2314;
            if (_2280)
            {
                _2312 = _1314;
            }
            int _2318 = _2312;
            bool _2320 = _2120 == 84;
            int _2322 = _2318;
            if (_2286)
            {
                _2322 = _1316;
            }
            int _2324 = _2322;
            bool _2326 = _2126 == 60;
            int _2328 = _2324;
            if (_2292)
            {
                _2316 = _1330;
            }
            int _2330 = _2316;
            bool _2332 = _2120 == 88;
            int _2334 = _2330;
            if (_2298)
            {
                _2328 = _1318;
            }
            int _2336 = _2328;
            bool _2338 = _2126 == 64;
            int _2340 = _2336;
            if (_2304)
            {
                _2334 = _1332;
            }
            int _2342 = _2334;
            bool _2344 = _2120 == 92;
            int _2346 = _2342;
            if (_2310)
            {
                _2340 = _1320;
            }
            int _2348 = _2340;
            bool _2350 = _2126 == 68;
            bool _2352 = _2126 == 72;
            int _2354 = _2348;
            if (_2320)
            {
                _2346 = _1334;
            }
            int _2356 = _2346;
            bool _2358 = _2120 == 96;
            int _2360 = _2356;
            if (_2326)
            {
                _2354 = _1322;
            }
            int _2362 = _2354;
            bool _2364 = _2126 == 76;
            int _2366 = _2362;
            if (_2332)
            {
                _2360 = _1336;
            }
            int _2368 = _2360;
            int _2370 = _2368;
            if (_2338)
            {
                _2366 = _1324;
            }
            int _2372 = _2366;
            bool _2374 = _2126 == 80;
            int _2376 = _2372;
            if (_2344)
            {
                _2370 = _1338;
            }
            int _2378 = _2370;
            bool _2380 = _2126 == 96;
            int _2382 = _2378;
            if (_2350)
            {
                _2376 = _1326;
            }
            int _2384 = _2376;
            bool _2386 = _2126 == 84;
            int _2388 = _2384;
            if (_2352)
            {
                _2388 = _1328;
            }
            int _2390 = _2388;
            bool _2392 = _2126 == 88;
            int _2394 = _2390;
            if (_2358)
            {
                _2382 = _1340;
            }
            int _2396 = _2382;
            bool _2398 = _2126 == 92;
            if (_2364)
            {
                _2394 = _1330;
            }
            int _2400 = _2394;
            bool _2402 = _2088 >= _2396;
            int _2404 = _2400;
            if (_2374)
            {
                _2404 = _1332;
            }
            int _2406 = _2404;
            int _2408 = _2406;
            if (_2386)
            {
                _2408 = _1334;
            }
            int _2410 = _2408;
            int _2412 = _2410;
            if (_2392)
            {
                _2412 = _1336;
            }
            int _2414 = _2412;
            int _2416 = _2414;
            _2114 = 0;
            if (_2398)
            {
                _2416 = _1338;
            }
            int _2418 = _2416;
            int _2420 = _2418;
            if (_2380)
            {
                _2420 = _1340;
            }
            int _2422 = _2420;
            if (!_2402)
            {
                _2108 = _2396;
            }
            int _2424 = _2108;
            _2116 = _2424;
            if (!_2402)
            {
                _2110 = _2086;
            }
            int _2426 = _2110;
            int _2428 = _2122 + 1;
            bool _2430 = _2424 >= _2422;
            int _2432 = _2426;
            _2112 = _2428;
            if (!_2430)
            {
                _2432 = _2122;
            }
            int _2434 = _2432;
            _2118 = _2434;
            if (!_2430)
            {
                _2116 = _2422;
            }
        }
        int _2436 = _2112;
        int _2438 = _2114;
        int _2440 = _2116;
        int _2442 = _2118;
        bool _2444 = _2436 < _1342;
        int _2446 = (_2444 ? (-1) : 0) | _2438;
        int _2448 = ~_2446;
        int _2450 = _2442;
        if (!(_2448 != 0))
        {
            int _2452 = _2436 * 4;
            bool _2454 = _2452 == 4;
            bool _2456 = _2452 == 8;
            bool _2458 = _2452 == 12;
            bool _2460 = _2452 == 16;
            if (_2454)
            {
                _1366 = _1294;
            }
            int _2462 = _1366;
            bool _2464 = _2452 == 20;
            int _2466 = _2462;
            if (_2456)
            {
                _2466 = _1296;
            }
            int _2468 = _2466;
            bool _2470 = _2452 == 24;
            int _2472 = _2468;
            if (_2458)
            {
                _2472 = _1298;
            }
            int _2474 = _2472;
            bool _2476 = _2452 == 28;
            int _2478 = _2474;
            if (_2460)
            {
                _2478 = _1300;
            }
            int _2480 = _2478;
            bool _2482 = _2452 == 32;
            int _2484 = _2480;
            if (_2464)
            {
                _2484 = _1302;
            }
            int _2486 = _2484;
            bool _2488 = _2452 == 36;
            int _2490 = _2486;
            if (_2470)
            {
                _2490 = _1304;
            }
            int _2492 = _2490;
            bool _2494 = _2452 == 40;
            int _2496 = _2492;
            if (_2476)
            {
                _2496 = _1306;
            }
            int _2498 = _2496;
            bool _2500 = _2452 == 44;
            int _2502 = _2498;
            if (_2482)
            {
                _2502 = _1308;
            }
            int _2504 = _2502;
            bool _2506 = _2452 == 48;
            int _2508 = _2504;
            if (_2488)
            {
                _2508 = _1310;
            }
            int _2510 = _2508;
            bool _2512 = _2452 == 52;
            int _2514 = _2510;
            if (_2494)
            {
                _2514 = _1312;
            }
            int _2516 = _2514;
            bool _2518 = _2452 == 56;
            int _2520 = _2516;
            if (_2500)
            {
                _2520 = _1314;
            }
            int _2522 = _2520;
            bool _2524 = _2452 == 60;
            int _2526 = _2522;
            if (_2506)
            {
                _2526 = _1316;
            }
            int _2528 = _2526;
            bool _2530 = _2452 == 64;
            int _2532 = _2528;
            if (_2512)
            {
                _2532 = _1318;
            }
            int _2534 = _2532;
            bool _2536 = _2452 == 68;
            int _2538 = _2534;
            if (_2518)
            {
                _2538 = _1320;
            }
            int _2540 = _2538;
            bool _2542 = _2452 == 72;
            int _2544 = _2540;
            if (_2524)
            {
                _2544 = _1322;
            }
            int _2546 = _2544;
            bool _2548 = _2452 == 76;
            int _2550 = _2546;
            if (_2530)
            {
                _2550 = _1324;
            }
            int _2552 = _2550;
            bool _2554 = _2452 == 80;
            int _2556 = _2552;
            if (_2536)
            {
                _2556 = _1326;
            }
            int _2558 = _2556;
            bool _2560 = _2452 == 84;
            int _2562 = _2558;
            if (_2542)
            {
                _2562 = _1328;
            }
            int _2564 = _2562;
            bool _2566 = _2452 == 88;
            int _2568 = _2564;
            if (_2548)
            {
                _2568 = _1330;
            }
            int _2570 = _2568;
            bool _2572 = _2452 == 92;
            int _2574 = _2570;
            if (_2554)
            {
                _2574 = _1332;
            }
            int _2576 = _2574;
            bool _2578 = _2452 == 96;
            int _2580 = _2576;
            if (_2560)
            {
                _2580 = _1334;
            }
            int _2582 = _2580;
            int _2584 = _2582;
            if (_2566)
            {
                _2584 = _1336;
            }
            int _2586 = _2584;
            int _2588 = _2586;
            if (_2572)
            {
                _2588 = _1338;
            }
            int _2590 = _2588;
            int _2592 = _2590;
            if (_2578)
            {
                _2592 = _1340;
            }
            int _2594 = _2592;
            bool _2596 = _2440 >= _2594;
            if (!_2596)
            {
                _2450 = _2436;
            }
        }
        int _2598 = _2450;
        _1374 = _2598;
    }
    int _2600 = _1374;
    int _2602 = _2600 * 8;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    float _2606 = as_type<float>(_31[int(_2604)]);
    int _2608 = _2602 + 4;
    uint _2610 = uint(int(uint(_2608) >> uint(2)));
    float _2612 = as_type<float>(_31[int(_2610)]);
    int _2614 = _69 + 16;
    uint _2616 = uint(int(uint(_2614) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2616)] = as_type<uint>(_2606);
    int _2618 = _2614 + 4;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2620)] = as_type<uint>(_2612);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return;
}

