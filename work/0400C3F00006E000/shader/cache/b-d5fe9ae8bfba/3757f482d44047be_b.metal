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
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    sampler vp_t_tcb_8Smplr_w [[id(8)]];
    sampler vp_t_tcb_ASmplr_w [[id(9)]];
    sampler vp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _884 = false;
    bool _708 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _2663 = float2((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    float4 _57 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2663, float2(0.0), isnan(_2663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2663, float2(0.0), isnan(_2663)), level(0.0)).xyzw;
    float _60 = _57.x;
    float _62 = _57.y;
    float _64 = _57.z;
    float _66 = _57.w;
    float _68 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _71 = as_type<int>(_68) * 32;
    uint _74 = uint(int(uint(_71) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_74)] = as_type<uint>(_60);
    int _76 = _71 + 4;
    uint _78 = uint(int(uint(_76) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_78)] = as_type<uint>(_62);
    int _80 = _71 + 8;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_82)] = as_type<uint>(_64);
    int _84 = _71 + 12;
    uint _86 = uint(int(uint(_84) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_86)] = as_type<uint>(_66);
    int _88 = -2;
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
    int _140 = 0;
    float _142 = 1000000.0;
    bool _146;
    bool _288;
    float _670;
    int _672;
    int _674;
    int _676;
    bool _684;
    int _686;
    int _740;
    int _742;
    int _748;
    int _754;
    int _760;
    int _766;
    int _772;
    int _778;
    int _784;
    int _790;
    int _796;
    int _802;
    int _808;
    int _814;
    int _820;
    int _826;
    int _830;
    bool _834;
    int _836;
    int _842;
    int _848;
    int _854;
    int _860;
    int _864;
    int _868;
    int _872;
    int _876;
    int _880;
    int _882;
    int _1242;
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
    int _1344;
    int _1346;
    int _1348;
    int _1350;
    int _1352;
    int _1354;
    int _1356;
    float _1358;
    int _1360;
    int _1374;
    int _1376;
    int _1378;
    int _1380;
    int _1382;
    int _1384;
    do
    {
        int _148 = _88;
        int _150 = _90;
        int _152 = _92;
        int _154 = _94;
        int _156 = _96;
        int _158 = _98;
        int _160 = _100;
        int _162 = _102;
        int _164 = _104;
        int _166 = _106;
        int _168 = _108;
        int _170 = _110;
        int _172 = _112;
        int _174 = _114;
        int _176 = _116;
        int _178 = _118;
        int _180 = _120;
        int _182 = _122;
        int _184 = _124;
        int _186 = _126;
        int _188 = _128;
        int _190 = _130;
        int _192 = _132;
        int _194 = _134;
        int _196 = _136;
        int _198 = _138;
        int _200 = _140;
        float _202 = _142;
        float _204 = float(_148);
        float _206 = _204 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _208 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _210 = fma(_206, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2783 = float2(_208, _210);
        float4 _212 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2783, float2(0.0), isnan(_2783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2783, float2(0.0), isnan(_2783)), level(0.0)).xyzw;
        float _214 = _212.x;
        float _216 = _212.y;
        float _218 = _212.z;
        float _220 = _212.w;
        int _222 = -2;
        float _224 = _216;
        float _226 = _220;
        float _228 = _218;
        float _230 = _214;
        int _232 = -2;
        int _234 = _150;
        int _236 = _152;
        int _238 = _154;
        int _240 = _156;
        int _242 = _158;
        int _244 = _160;
        int _246 = _162;
        int _248 = _164;
        int _250 = _166;
        int _252 = _168;
        int _254 = _170;
        int _256 = _172;
        int _258 = _174;
        int _260 = _176;
        int _262 = _178;
        int _264 = _180;
        int _266 = _182;
        int _268 = _184;
        int _270 = _186;
        int _272 = _188;
        int _274 = _190;
        int _276 = _192;
        int _278 = _194;
        int _280 = _196;
        int _282 = _198;
        int _284 = _200;
        float _286 = _202;
        do
        {
            int _290 = _222;
            float _292 = _224;
            float _294 = _226;
            float _296 = _228;
            float _298 = _230;
            int _300 = _232;
            int _302 = _234;
            int _304 = _236;
            int _306 = _238;
            int _308 = _240;
            int _310 = _242;
            int _312 = _244;
            int _314 = _246;
            int _316 = _248;
            int _318 = _250;
            int _320 = _252;
            int _322 = _254;
            int _324 = _256;
            int _326 = _258;
            int _328 = _260;
            int _330 = _262;
            int _332 = _264;
            int _334 = _266;
            int _336 = _268;
            int _338 = _270;
            int _340 = _272;
            int _342 = _274;
            int _344 = _276;
            int _346 = _278;
            int _348 = _280;
            int _350 = _282;
            int _352 = _284;
            float _354 = _286;
            int _356 = _290 + 1;
            float _358 = float(_148);
            float _360 = 0.0 + _292;
            float _362 = precise::clamp(_360, 0.0, 1.0);
            float _364 = _358 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _366 = float(_356);
            float _368 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _370 = fma(_364, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _372 = 0.0 + _294;
            float _374 = precise::clamp(_372, 0.0, 1.0);
            float _376 = fma(_366, _368, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _378 = 0.0 + _296;
            float _380 = precise::clamp(_378, 0.0, 1.0);
            float _382 = 0.0 + _298;
            float _384 = precise::clamp(_382, 0.0, 1.0);
            float2 _2903 = float2(_376, _370);
            float4 _386 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2903, float2(0.0), isnan(_2903)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2903, float2(0.0), isnan(_2903)), level(0.0)).xyzw;
            float _388 = _386.x;
            float _390 = _386.y;
            float _392 = _386.z;
            float _394 = _386.w;
            float _396 = _374 * 65535.0;
            float _398 = _380 * 65535.0;
            float _400 = _362 * 65535.0;
            float _402 = _384 * 65535.0;
            float _404 = rint(_396);
            int _406 = int(_404);
            float _408 = rint(_398);
            int _410 = int(_408);
            float _412 = rint(_400);
            int _414 = int(_412);
            uint _416 = extract_bits(uint(_406), 0u, 8u);
            int _418 = int(_416) & 255;
            uint _420 = extract_bits(uint(_406), 8u, 8u);
            int _422 = int(_420) & 255;
            int _424 = _422 << 8;
            int _426 = _418 | _424;
            float _428 = rint(_402);
            int _430 = int(_428);
            uint _432 = extract_bits(uint(_426), 0u, 8u);
            int _434 = int(_432) & 255;
            uint _436 = extract_bits(uint(_426), 8u, 8u);
            int _438 = int(_436) & 255;
            int _440 = _438 << 8;
            int _442 = _434 | _440;
            uint _444 = extract_bits(uint(_410), 0u, 8u);
            int _446 = int(_444) & 255;
            int _448 = _446 << 16;
            int _450 = _442 | _448;
            uint _452 = extract_bits(uint(_410), 8u, 8u);
            int _454 = int(_452) & 255;
            int _456 = _454 << 24;
            int _458 = _450 | _456;
            float _460 = float(_300);
            bool _462 = _458 != 0;
            uint _464 = extract_bits(uint(_414), 0u, 8u);
            int _466 = int(_464) & 255;
            uint _468 = extract_bits(uint(_414), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 8;
            int _474 = _466 | _472;
            float _476 = fma(_460, _368, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _478 = extract_bits(uint(_474), 0u, 8u);
            int _480 = int(_478) & 255;
            uint _482 = extract_bits(uint(_474), 8u, 8u);
            int _484 = int(_482) & 255;
            int _486 = _484 << 8;
            int _488 = _480 | _486;
            uint _490 = extract_bits(uint(_430), 0u, 8u);
            int _492 = int(_490) & 255;
            int _494 = _492 << 16;
            int _496 = _488 | _494;
            uint _498 = extract_bits(uint(_430), 8u, 8u);
            int _500 = int(_498) & 255;
            int _502 = _500 << 24;
            int _504 = _496 | _502;
            bool _506 = _504 != 0;
            bool _508 = _506 || _462;
            bool _510 = !_508;
            _222 = _356;
            _224 = _390;
            _226 = _394;
            _228 = _392;
            _230 = _388;
            int _512 = _312;
            int _514 = _304;
            int _516 = _306;
            int _518 = _308;
            int _520 = _310;
            int _522 = _314;
            int _524 = _316;
            int _526 = _326;
            int _528 = _318;
            int _530 = _320;
            int _532 = _322;
            int _534 = _324;
            int _536 = _328;
            int _538 = _330;
            int _540 = _340;
            int _542 = _332;
            int _544 = _334;
            int _546 = _336;
            int _548 = _338;
            int _550 = _342;
            int _552 = _344;
            int _554 = _346;
            int _556 = _348;
            int _558 = _350;
            int _560 = _352;
            int _562 = _458;
            int _564 = _304;
            int _566 = _306;
            int _568 = _308;
            int _570 = _310;
            int _572 = _348;
            int _574 = _350;
            int _576 = _352;
            int _578 = _312;
            int _580 = _314;
            int _582 = _316;
            int _584 = _318;
            int _586 = _320;
            int _588 = _322;
            int _590 = _324;
            int _592 = _326;
            int _594 = _328;
            int _596 = _330;
            int _598 = _332;
            int _600 = _334;
            int _602 = _336;
            int _604 = _338;
            int _606 = _346;
            int _608 = _344;
            int _610 = _342;
            int _612 = _302;
            int _614 = _304;
            int _616 = _306;
            int _618 = _308;
            int _620 = _310;
            int _622 = _312;
            int _624 = _314;
            int _626 = _316;
            int _628 = _318;
            int _630 = _320;
            int _632 = _322;
            int _634 = _324;
            int _636 = _326;
            int _638 = _328;
            int _640 = _330;
            int _642 = _332;
            int _644 = _334;
            int _646 = _336;
            int _648 = _338;
            int _650 = _340;
            int _652 = _342;
            int _654 = _344;
            int _656 = _346;
            int _658 = _348;
            int _660 = _350;
            int _662 = _352;
            int _664 = _430;
            int _666 = _458;
            int _668 = as_type<int>(_460);
            _670 = _354;
            _672 = _504;
            _674 = _458;
            _676 = as_type<int>(_392);
            if (!_510)
            {
                bool _678 = _302 > 0;
                bool _680 = !_678;
                if (!_680)
                {
                    int _682 = 0;
                    do
                    {
                        _686 = _682;
                        int _688 = _686 * 8;
                        uint _690 = uint(int(uint(_688) >> uint(2)));
                        float _692 = as_type<float>(_31[int(_690)]);
                        int _694 = _688 + 4;
                        uint _696 = uint(int(uint(_694) >> uint(2)));
                        float _698 = as_type<float>(_31[int(_696)]);
                        bool _700 = as_type<int>(_692) != _458;
                        bool _702 = as_type<int>(_698) != _504;
                        bool _704 = _702 || _700;
                        bool _706 = !_704;
                        _708 = _706;
                        if (_708)
                        {
                            break;
                        }
                        int _710 = _686 + 1;
                        bool _712 = _710 >= _302;
                        _684 = !_712;
                        _682 = _710;
                    } while (_684);
                }
                if (!_708)
                {
                    int _714 = _302 * 4;
                    int _716 = _302 * 8;
                    int _718 = _302 + 1;
                    bool _720 = _714 == 16;
                    bool _722 = _714 == 0;
                    uint _724 = uint(int(uint(_716) >> uint(2)));
                    _31[int(_724)] = uint(_458);
                    int _726 = _716 + 4;
                    uint _728 = uint(int(uint(_726) >> uint(2)));
                    _31[int(_728)] = uint(_504);
                    bool _730 = _714 == 4;
                    bool _732 = _714 == 8;
                    bool _734 = _714 == 12;
                    bool _736 = _714 == 20;
                    bool _738 = _714 == 24;
                    _612 = _718;
                    _664 = _716;
                    _668 = _714;
                    _740 = _716;
                    _742 = _714;
                    if (_720)
                    {
                        _512 = 1;
                    }
                    int _744 = _512;
                    bool _746 = _714 == 44;
                    _622 = _744;
                    _748 = _744;
                    if (_722)
                    {
                        _514 = 1;
                    }
                    int _750 = _514;
                    bool _752 = _714 == 28;
                    _614 = _750;
                    _754 = _750;
                    if (_730)
                    {
                        _516 = 1;
                    }
                    int _756 = _516;
                    bool _758 = _714 == 32;
                    _616 = _756;
                    _760 = _756;
                    if (_732)
                    {
                        _518 = 1;
                    }
                    int _762 = _518;
                    bool _764 = _714 == 36;
                    _618 = _762;
                    _766 = _762;
                    if (_734)
                    {
                        _520 = 1;
                    }
                    int _768 = _520;
                    bool _770 = _714 == 40;
                    _620 = _768;
                    _772 = _768;
                    if (_736)
                    {
                        _522 = 1;
                    }
                    int _774 = _522;
                    bool _776 = _714 == 48;
                    _624 = _774;
                    _778 = _774;
                    if (_738)
                    {
                        _524 = 1;
                    }
                    int _780 = _524;
                    bool _782 = _714 == 52;
                    _626 = _780;
                    _784 = _780;
                    if (_746)
                    {
                        _526 = 1;
                    }
                    int _786 = _526;
                    bool _788 = _714 == 72;
                    _636 = _786;
                    _790 = _786;
                    if (_752)
                    {
                        _528 = 1;
                    }
                    int _792 = _528;
                    bool _794 = _714 == 56;
                    _628 = _792;
                    _796 = _792;
                    if (_758)
                    {
                        _530 = 1;
                    }
                    int _798 = _530;
                    bool _800 = _714 == 60;
                    _630 = _798;
                    _802 = _798;
                    if (_764)
                    {
                        _532 = 1;
                    }
                    int _804 = _532;
                    bool _806 = _714 == 64;
                    _632 = _804;
                    _808 = _804;
                    if (_770)
                    {
                        _534 = 1;
                    }
                    int _810 = _534;
                    bool _812 = _714 == 68;
                    _634 = _810;
                    _814 = _810;
                    if (_776)
                    {
                        _536 = 1;
                    }
                    int _816 = _536;
                    bool _818 = _714 == 76;
                    _638 = _816;
                    _820 = _816;
                    if (_782)
                    {
                        _538 = 1;
                    }
                    int _822 = _538;
                    bool _824 = _714 == 80;
                    _640 = _822;
                    _826 = _822;
                    if (_788)
                    {
                        _540 = 1;
                    }
                    int _828 = _540;
                    _650 = _828;
                    _830 = _828;
                    if (_794)
                    {
                        _542 = 1;
                    }
                    int _832 = _542;
                    _834 = _718 != 25;
                    _642 = _832;
                    _836 = _832;
                    if (_800)
                    {
                        _544 = 1;
                    }
                    int _838 = _544;
                    bool _840 = _714 == 84;
                    _644 = _838;
                    _842 = _838;
                    if (_806)
                    {
                        _546 = 1;
                    }
                    int _844 = _546;
                    bool _846 = _714 == 88;
                    _646 = _844;
                    _848 = _844;
                    if (_812)
                    {
                        _548 = 1;
                    }
                    int _850 = _548;
                    bool _852 = _714 == 92;
                    _648 = _850;
                    _854 = _850;
                    if (_818)
                    {
                        _550 = 1;
                    }
                    int _856 = _550;
                    bool _858 = _714 == 96;
                    _652 = _856;
                    _860 = _856;
                    if (_824)
                    {
                        _552 = 1;
                    }
                    int _862 = _552;
                    _654 = _862;
                    _864 = _862;
                    if (_840)
                    {
                        _554 = 1;
                    }
                    int _866 = _554;
                    _656 = _866;
                    _868 = _866;
                    if (_846)
                    {
                        _556 = 1;
                    }
                    int _870 = _556;
                    _658 = _870;
                    _872 = _870;
                    if (_852)
                    {
                        _558 = 1;
                    }
                    int _874 = _558;
                    _660 = _874;
                    _876 = _874;
                    if (_858)
                    {
                        _560 = 1;
                    }
                    int _878 = _560;
                    _662 = _878;
                    _880 = _878;
                }
                if ((!_834) || _708)
                {
                    if (!_708)
                    {
                        _882 = 25;
                        _884 = true;
                        if (_884)
                        {
                            break;
                        }
                    }
                    _708 = false;
                    int _886 = _686 * 4;
                    bool _888 = _886 == 0;
                    bool _890 = _886 == 4;
                    bool _892 = _886 == 8;
                    bool _894 = _886 == 12;
                    bool _896 = _886 == 88;
                    bool _898 = _886 == 92;
                    bool _900 = _886 == 96;
                    if (_888)
                    {
                        _562 = _304;
                    }
                    int _902 = _562;
                    bool _904 = _886 == 16;
                    int _906 = _902;
                    if (_890)
                    {
                        _906 = _306;
                    }
                    int _908 = _906;
                    bool _910 = _886 == 20;
                    int _912 = _908;
                    if (_892)
                    {
                        _912 = _308;
                    }
                    int _914 = _912;
                    bool _916 = _886 == 24;
                    int _918 = _914;
                    if (_894)
                    {
                        _918 = _310;
                    }
                    int _920 = _918;
                    bool _922 = _886 == 84;
                    int _924 = int(_916);
                    int _926 = _910 ? 2 : 0;
                    int _928 = _924 | _926;
                    int _930 = _904 ? 4 : 0;
                    int _932 = _928 | _930;
                    int _934 = _922 ? 8 : 0;
                    int _936 = _932 | _934;
                    int _938 = _896 ? 16 : 0;
                    int _940 = _936 | _938;
                    int _942 = _898 ? 32 : 0;
                    int _944 = _940 | _942;
                    int _946 = _900 ? 64 : 0;
                    int _948 = _944 | _946;
                    int _950 = _948 & 8;
                    int _952 = _920;
                    if (_904)
                    {
                        _952 = _312;
                    }
                    int _954 = _952;
                    bool _956 = _886 == 80;
                    int _958 = _954;
                    if (_910)
                    {
                        _958 = _314;
                    }
                    int _960 = _958;
                    bool _962 = _886 == 76;
                    int _964 = _960;
                    if (_916)
                    {
                        _964 = _316;
                    }
                    int _966 = _964;
                    bool _968 = _886 == 28;
                    int _970 = int(_968);
                    int _972 = _962 ? 2 : 0;
                    int _974 = _970 | _972;
                    int _976 = _956 ? 4 : 0;
                    int _978 = _974 | _976;
                    int _980 = _922 ? 8 : 0;
                    int _982 = _978 | _980;
                    int _984 = _896 ? 16 : 0;
                    int _986 = _982 | _984;
                    int _988 = _898 ? 32 : 0;
                    int _990 = _986 | _988;
                    int _992 = _900 ? 64 : 0;
                    int _994 = _990 | _992;
                    int _996 = _994 & 2;
                    int _998 = int(_968);
                    int _1000 = _962 ? 2 : 0;
                    int _1002 = _998 | _1000;
                    int _1004 = _956 ? 4 : 0;
                    int _1006 = _1002 | _1004;
                    int _1008 = _922 ? 8 : 0;
                    int _1010 = _1006 | _1008;
                    int _1012 = _896 ? 16 : 0;
                    int _1014 = _1010 | _1012;
                    int _1016 = _898 ? 32 : 0;
                    int _1018 = _1014 | _1016;
                    int _1020 = _900 ? 64 : 0;
                    int _1022 = _1018 | _1020;
                    int _1024 = _1022 & 4;
                    int _1026 = _966;
                    _664 = _996;
                    _668 = _1024;
                    if (_968)
                    {
                        _1026 = _318;
                    }
                    int _1028 = _1026;
                    bool _1030 = _886 == 32;
                    int _1032 = _1028;
                    if (_1030)
                    {
                        _1032 = _320;
                    }
                    int _1034 = _1032;
                    bool _1036 = _886 == 36;
                    int _1038 = _1034;
                    if (_1036)
                    {
                        _1038 = _322;
                    }
                    int _1040 = _1038;
                    bool _1042 = _886 == 40;
                    int _1044 = _1040;
                    if (_1042)
                    {
                        _1044 = _324;
                    }
                    int _1046 = _1044;
                    bool _1048 = _886 == 44;
                    int _1050 = _1046;
                    if (_1048)
                    {
                        _1050 = _326;
                    }
                    int _1052 = _1050;
                    bool _1054 = _886 == 48;
                    int _1056 = _1052;
                    if (_1054)
                    {
                        _1056 = _328;
                    }
                    int _1058 = _1056;
                    bool _1060 = _886 == 52;
                    int _1062 = _1058;
                    if (_1060)
                    {
                        _1062 = _330;
                    }
                    int _1064 = _1062;
                    bool _1066 = _886 == 56;
                    int _1068 = _1064;
                    if (_1066)
                    {
                        _1068 = _332;
                    }
                    int _1070 = _1068;
                    bool _1072 = _886 == 60;
                    int _1074 = _1070;
                    if (_1072)
                    {
                        _1074 = _334;
                    }
                    int _1076 = _1074;
                    bool _1078 = _886 == 64;
                    int _1080 = _1076;
                    if (_1078)
                    {
                        _1080 = _336;
                    }
                    int _1082 = _1080;
                    bool _1084 = _886 == 68;
                    int _1086 = _1082;
                    if (_1084)
                    {
                        _1086 = _338;
                    }
                    int _1088 = _1086;
                    bool _1090 = _886 == 72;
                    int _1092 = int(_1090);
                    int _1094 = _962 ? 2 : 0;
                    int _1096 = _1092 | _1094;
                    int _1098 = _956 ? 4 : 0;
                    int _1100 = _1096 | _1098;
                    int _1102 = _922 ? 8 : 0;
                    int _1104 = _1100 | _1102;
                    int _1106 = _896 ? 16 : 0;
                    int _1108 = _1104 | _1106;
                    int _1110 = _898 ? 32 : 0;
                    int _1112 = _1108 | _1110;
                    int _1114 = _900 ? 64 : 0;
                    int _1116 = _1112 | _1114;
                    int _1118 = _1116 & 1;
                    int _1120 = _1088;
                    if (_1090)
                    {
                        _1120 = _340;
                    }
                    int _1122 = _1120;
                    bool _1124 = _886 == 4;
                    int _1126 = _1122;
                    if (_962)
                    {
                        _1126 = _342;
                    }
                    int _1128 = _1126;
                    bool _1130 = _886 == 0;
                    int _1132 = _1128;
                    if (_956)
                    {
                        _1132 = _344;
                    }
                    int _1134 = _1132;
                    int _1136 = _1134;
                    if (_922)
                    {
                        _1136 = _346;
                    }
                    int _1138 = _1136;
                    int _1140 = _1138;
                    if (_896)
                    {
                        _1140 = _348;
                    }
                    int _1142 = _1140;
                    bool _1144 = _886 == 8;
                    int _1146 = _1142;
                    if (_898)
                    {
                        _1146 = _350;
                    }
                    int _1148 = _1146;
                    bool _1150 = _886 == 12;
                    int _1152 = _1148;
                    if (_900)
                    {
                        _1152 = _352;
                    }
                    int _1154 = _1152;
                    int _1156 = _1154 + 1;
                    _666 = _1156;
                    if (_1130)
                    {
                        _564 = _1156;
                    }
                    int _1158 = _564;
                    bool _1160 = _886 == 16;
                    _614 = _1158;
                    if (_1124)
                    {
                        _566 = _1156;
                    }
                    int _1162 = _566;
                    bool _1164 = _886 == 20;
                    _616 = _1162;
                    if (_1144)
                    {
                        _568 = _1156;
                    }
                    int _1166 = _568;
                    bool _1168 = _886 == 24;
                    _618 = _1166;
                    if (_1150)
                    {
                        _570 = _1156;
                    }
                    int _1170 = _570;
                    bool _1172 = _886 == 28;
                    _620 = _1170;
                    if (_896)
                    {
                        _572 = _1156;
                    }
                    int _1174 = _572;
                    _658 = _1174;
                    if (_898)
                    {
                        _574 = _1156;
                    }
                    int _1176 = _574;
                    _660 = _1176;
                    if (_900)
                    {
                        _576 = _1156;
                    }
                    int _1178 = _576;
                    _662 = _1178;
                    if (_1160)
                    {
                        _578 = _1156;
                    }
                    int _1180 = _578;
                    bool _1182 = _886 == 32;
                    _622 = _1180;
                    if (_1164)
                    {
                        _580 = _1156;
                    }
                    int _1184 = _580;
                    bool _1186 = _886 == 36;
                    _624 = _1184;
                    if (_1168)
                    {
                        _582 = _1156;
                    }
                    int _1188 = _582;
                    bool _1190 = _886 == 40;
                    _626 = _1188;
                    if (_1172)
                    {
                        _584 = _1156;
                    }
                    int _1192 = _584;
                    bool _1194 = _886 == 44;
                    _628 = _1192;
                    if (_1182)
                    {
                        _586 = _1156;
                    }
                    int _1196 = _586;
                    bool _1198 = _886 == 48;
                    _630 = _1196;
                    if (_1186)
                    {
                        _588 = _1156;
                    }
                    int _1200 = _588;
                    bool _1202 = _886 == 52;
                    _632 = _1200;
                    if (_1190)
                    {
                        _590 = _1156;
                    }
                    int _1204 = _590;
                    bool _1206 = _886 == 56;
                    _634 = _1204;
                    if (_1194)
                    {
                        _592 = _1156;
                    }
                    int _1208 = _592;
                    bool _1210 = _886 == 60;
                    _636 = _1208;
                    if (_1198)
                    {
                        _594 = _1156;
                    }
                    int _1212 = _594;
                    bool _1214 = _886 == 64;
                    _638 = _1212;
                    if (_1202)
                    {
                        _596 = _1156;
                    }
                    int _1216 = _596;
                    bool _1218 = _886 == 68;
                    _640 = _1216;
                    if (_1206)
                    {
                        _598 = _1156;
                    }
                    int _1220 = _598;
                    bool _1222 = _950 != 0;
                    _642 = _1220;
                    if (_1210)
                    {
                        _600 = _1156;
                    }
                    int _1224 = _600;
                    bool _1226 = _1024 != 0;
                    _644 = _1224;
                    if (_1214)
                    {
                        _602 = _1156;
                    }
                    int _1228 = _602;
                    bool _1230 = _996 != 0;
                    _646 = _1228;
                    if (_1218)
                    {
                        _604 = _1156;
                    }
                    int _1232 = _604;
                    bool _1234 = _1118 != 0;
                    _648 = _1232;
                    if (_1222)
                    {
                        _606 = _1156;
                    }
                    int _1236 = _606;
                    _656 = _1236;
                    if (_1226)
                    {
                        _608 = _1156;
                    }
                    int _1238 = _608;
                    _654 = _1238;
                    if (_1230)
                    {
                        _610 = _1156;
                    }
                    int _1240 = _610;
                    _652 = _1240;
                    if (_1234)
                    {
                        _650 = _1156;
                    }
                }
            }
            _1242 = _612;
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
            int _1288 = _658;
            int _1290 = _660;
            int _1292 = _662;
            int _1294 = _664;
            int _1296 = _666;
            int _1298 = _668;
            float2 _4060 = float2(_476, _370);
            float _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4060, float2(0.0), isnan(_4060)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4060, float2(0.0), isnan(_4060)), level(0.0)).x;
            int _1302 = _300 + 1;
            bool _1304 = _1302 >= 3;
            float _1306 = precise::min(_1300, _354);
            _288 = !_1304;
            _232 = _1302;
            _234 = _1242;
            _236 = _1244;
            _238 = _1246;
            _240 = _1248;
            _242 = _1250;
            _244 = _1252;
            _246 = _1254;
            _248 = _1256;
            _250 = _1258;
            _252 = _1260;
            _254 = _1262;
            _256 = _1264;
            _258 = _1266;
            _260 = _1268;
            _262 = _1270;
            _264 = _1272;
            _266 = _1274;
            _268 = _1276;
            _270 = _1278;
            _272 = _1280;
            _274 = _1282;
            _276 = _1284;
            _278 = _1286;
            _280 = _1288;
            _282 = _1290;
            _284 = _1292;
            _286 = _1306;
            _754 = _1244;
            _760 = _1246;
            _766 = _1248;
            _772 = _1250;
            _748 = _1252;
            _778 = _1254;
            _784 = _1256;
            _796 = _1258;
            _802 = _1260;
            _808 = _1262;
            _814 = _1264;
            _790 = _1266;
            _820 = _1268;
            _826 = _1270;
            _836 = _1272;
            _842 = _1274;
            _848 = _1276;
            _854 = _1278;
            _830 = _1280;
            _860 = _1282;
            _864 = _1284;
            _868 = _1286;
            _872 = _1288;
            _876 = _1290;
            _880 = _1292;
            _670 = _1306;
            _672 = as_type<int>(_1300);
            _740 = _1294;
            _674 = _1296;
            _742 = _1298;
        } while (_288);
        if (!_884)
        {
            _882 = _1242;
        }
        _884 = false;
        _1308 = _754;
        _1310 = _760;
        _1312 = _766;
        _1314 = _772;
        _1316 = _748;
        _1318 = _778;
        _1320 = _784;
        _1322 = _796;
        _1324 = _802;
        _1326 = _808;
        _1328 = _814;
        _1330 = _790;
        _1332 = _820;
        _1334 = _826;
        _1336 = _836;
        _1338 = _842;
        _1340 = _848;
        _1342 = _854;
        _1344 = _830;
        _1346 = _860;
        _1348 = _864;
        _1350 = _868;
        _1352 = _872;
        _1354 = _876;
        _1356 = _880;
        _1358 = _670;
        _1360 = _882;
        int _1362 = _672;
        int _1364 = _740;
        int _1366 = _674;
        int _1368 = _742;
        int _1370 = _148 + 1;
        bool _1372 = _1370 >= 3;
        _146 = !_1372;
        _88 = _1370;
        _90 = _1360;
        _92 = _1308;
        _94 = _1310;
        _96 = _1312;
        _98 = _1314;
        _100 = _1316;
        _102 = _1318;
        _104 = _1320;
        _106 = _1322;
        _108 = _1324;
        _110 = _1326;
        _112 = _1328;
        _114 = _1330;
        _116 = _1332;
        _118 = _1334;
        _120 = _1336;
        _122 = _1338;
        _124 = _1340;
        _126 = _1342;
        _128 = _1344;
        _130 = _1346;
        _132 = _1348;
        _134 = _1350;
        _136 = _1352;
        _138 = _1354;
        _140 = _1356;
        _142 = _1358;
        _1374 = _1362;
        _1376 = _1364;
        _1378 = _1366;
        _1380 = _1368;
        _1382 = _1362;
        _1384 = _1308;
    } while (_146);
    bool _1386 = _1360 > 0;
    if (!_1386)
    {
        _676 = 0;
    }
    int _1388 = _676;
    bool _1390 = !_1386;
    int _1392 = _1388;
    if (!_1390)
    {
        bool _1394 = _1360 > 3;
        bool _1396 = !_1394;
        int _1398 = 0;
        int _1400 = 0;
        int _1402 = 0;
        int _1404 = 0;
        int _1406 = 0;
        int _1408 = -1;
        int _1410 = 0;
        if (!_1396)
        {
            int _1412 = _1360 + (-3);
            _1408 = 0;
            bool _1414;
            do
            {
                int _1416 = _1398;
                int _1418 = _1400;
                int _1420 = _1374;
                int _1422 = _1376;
                int _1424 = _1378;
                int _1426 = _1402;
                int _1428 = _1380;
                int _1430 = _1416 * 4;
                int _1432 = _1416 + 1;
                int _1434 = _1416 + 2;
                bool _1436 = _1430 == 0;
                int _1438 = _1432 * 4;
                bool _1440 = _1430 == 4;
                int _1442 = _1434 * 4;
                bool _1444 = _1430 == 8;
                bool _1446 = _1430 == 12;
                bool _1448 = _1430 == 16;
                bool _1450 = _1438 == 8;
                int _1452 = _1416 + 3;
                int _1454 = _1420;
                int _1456 = _1422;
                int _1458 = _1424;
                int _1460 = _1428;
                int _1462 = _1418;
                int _1464 = _1426;
                if (_1436)
                {
                    _1454 = _1308;
                }
                int _1466 = _1454;
                bool _1468 = _1430 == 24;
                int _1470 = _1466;
                if (_1440)
                {
                    _1470 = _1310;
                }
                int _1472 = _1470;
                bool _1474 = _1430 == 20;
                int _1476 = _1472;
                if (_1444)
                {
                    _1476 = _1312;
                }
                int _1478 = _1476;
                bool _1480 = _1430 == 32;
                int _1482 = _1478;
                if (_1446)
                {
                    _1482 = _1314;
                }
                int _1484 = _1482;
                bool _1486 = _1430 == 28;
                int _1488 = _1484;
                if (_1448)
                {
                    _1488 = _1316;
                }
                int _1490 = _1488;
                bool _1492 = _1430 == 40;
                int _1494 = _1452 * 4;
                int _1496 = _1490;
                if (_1474)
                {
                    _1496 = _1318;
                }
                int _1498 = _1496;
                bool _1500 = _1430 == 36;
                int _1502 = _1498;
                if (_1468)
                {
                    _1502 = _1320;
                }
                int _1504 = _1502;
                bool _1506 = _1438 == 0;
                int _1508 = _1504;
                if (_1486)
                {
                    _1508 = _1322;
                }
                int _1510 = _1508;
                bool _1512 = _1438 == 4;
                int _1514 = _1510;
                if (_1480)
                {
                    _1514 = _1324;
                }
                int _1516 = _1514;
                bool _1518 = _1438 == 12;
                int _1520 = _1516;
                if (_1500)
                {
                    _1520 = _1326;
                }
                int _1522 = _1520;
                bool _1524 = _1430 == 44;
                int _1526 = _1522;
                if (_1492)
                {
                    _1526 = _1328;
                }
                int _1528 = _1526;
                bool _1530 = _1438 == 16;
                int _1532 = _1528;
                if (_1506)
                {
                    _1456 = _1308;
                }
                int _1534 = _1456;
                bool _1536 = _1430 == 48;
                int _1538 = _1534;
                if (_1512)
                {
                    _1538 = _1310;
                }
                int _1540 = _1538;
                bool _1542 = _1438 == 20;
                int _1544 = _1540;
                if (_1450)
                {
                    _1544 = _1312;
                }
                int _1546 = _1544;
                bool _1548 = _1438 == 24;
                int _1550 = _1546;
                if (_1518)
                {
                    _1550 = _1314;
                }
                int _1552 = _1550;
                bool _1554 = _1438 == 28;
                int _1556 = _1552;
                if (_1524)
                {
                    _1532 = _1330;
                }
                int _1558 = _1532;
                bool _1560 = _1430 == 52;
                int _1562 = _1558;
                if (_1530)
                {
                    _1556 = _1316;
                }
                int _1564 = _1556;
                bool _1566 = _1438 == 32;
                int _1568 = _1564;
                if (_1536)
                {
                    _1562 = _1332;
                }
                int _1570 = _1562;
                bool _1572 = _1430 == 56;
                int _1574 = _1570;
                if (_1542)
                {
                    _1568 = _1318;
                }
                int _1576 = _1568;
                bool _1578 = _1438 == 36;
                int _1580 = _1576;
                if (_1548)
                {
                    _1580 = _1320;
                }
                int _1582 = _1580;
                bool _1584 = _1438 == 40;
                int _1586 = _1582;
                if (_1554)
                {
                    _1586 = _1322;
                }
                int _1588 = _1586;
                bool _1590 = _1438 == 44;
                int _1592 = _1588;
                if (_1560)
                {
                    _1574 = _1334;
                }
                int _1594 = _1574;
                bool _1596 = _1430 == 60;
                int _1598 = _1594;
                if (_1566)
                {
                    _1592 = _1324;
                }
                int _1600 = _1592;
                bool _1602 = _1438 == 48;
                int _1604 = _1600;
                if (_1572)
                {
                    _1598 = _1336;
                }
                int _1606 = _1598;
                bool _1608 = _1430 == 64;
                int _1610 = _1606;
                if (_1578)
                {
                    _1604 = _1326;
                }
                int _1612 = _1604;
                bool _1614 = _1438 == 52;
                int _1616 = _1612;
                if (_1584)
                {
                    _1616 = _1328;
                }
                int _1618 = _1616;
                int _1620 = _1618;
                if (_1590)
                {
                    _1620 = _1330;
                }
                int _1622 = _1620;
                bool _1624 = _1438 == 56;
                bool _1626 = _1438 == 60;
                int _1628 = _1622;
                if (_1596)
                {
                    _1610 = _1338;
                }
                int _1630 = _1610;
                bool _1632 = _1442 == 0;
                int _1634 = _1630;
                if (_1602)
                {
                    _1628 = _1332;
                }
                int _1636 = _1628;
                bool _1638 = _1430 == 68;
                int _1640 = _1636;
                if (_1608)
                {
                    _1634 = _1340;
                }
                int _1642 = _1634;
                bool _1644 = _1442 == 4;
                int _1646 = _1642;
                if (_1614)
                {
                    _1640 = _1334;
                }
                int _1648 = _1640;
                bool _1650 = _1442 == 8;
                int _1652 = _1648;
                if (_1624)
                {
                    _1652 = _1336;
                }
                int _1654 = _1652;
                bool _1656 = _1442 == 12;
                int _1658 = _1654;
                if (_1626)
                {
                    _1658 = _1338;
                }
                int _1660 = _1658;
                bool _1662 = _1442 == 16;
                int _1664 = _1660;
                if (_1632)
                {
                    _1458 = _1308;
                }
                int _1666 = _1458;
                bool _1668 = _1438 == 64;
                int _1670 = _1666;
                if (_1638)
                {
                    _1646 = _1342;
                }
                int _1672 = _1646;
                bool _1674 = _1442 == 20;
                int _1676 = _1672;
                if (_1644)
                {
                    _1670 = _1310;
                }
                int _1678 = _1670;
                bool _1680 = _1430 == 72;
                int _1682 = _1678;
                if (_1650)
                {
                    _1682 = _1312;
                }
                int _1684 = _1682;
                bool _1686 = _1442 == 24;
                int _1688 = _1684;
                if (_1656)
                {
                    _1688 = _1314;
                }
                int _1690 = _1688;
                bool _1692 = _1442 == 28;
                int _1694 = _1690;
                if (_1662)
                {
                    _1694 = _1316;
                }
                int _1696 = _1694;
                bool _1698 = _1442 == 32;
                int _1700 = _1696;
                if (_1668)
                {
                    _1664 = _1340;
                }
                int _1702 = _1664;
                bool _1704 = _1438 == 68;
                int _1706 = _1702;
                if (_1674)
                {
                    _1700 = _1318;
                }
                int _1708 = _1700;
                bool _1710 = _1442 == 36;
                int _1712 = _1708;
                if (_1680)
                {
                    _1676 = _1344;
                }
                int _1714 = _1676;
                bool _1716 = _1430 == 76;
                int _1718 = _1714;
                if (_1686)
                {
                    _1712 = _1320;
                }
                int _1720 = _1712;
                bool _1722 = _1442 == 40;
                int _1724 = _1720;
                if (_1692)
                {
                    _1724 = _1322;
                }
                int _1726 = _1724;
                bool _1728 = _1442 == 44;
                int _1730 = _1726;
                if (_1698)
                {
                    _1730 = _1324;
                }
                int _1732 = _1730;
                bool _1734 = _1442 == 48;
                int _1736 = _1732;
                if (_1704)
                {
                    _1706 = _1342;
                }
                int _1738 = _1706;
                bool _1740 = _1438 == 72;
                int _1742 = _1738;
                if (_1710)
                {
                    _1736 = _1326;
                }
                int _1744 = _1736;
                bool _1746 = _1442 == 52;
                int _1748 = _1744;
                if (_1716)
                {
                    _1718 = _1346;
                }
                int _1750 = _1718;
                bool _1752 = _1430 == 80;
                int _1754 = _1750;
                if (_1722)
                {
                    _1748 = _1328;
                }
                int _1756 = _1748;
                bool _1758 = _1442 == 56;
                int _1760 = _1756;
                if (_1728)
                {
                    _1760 = _1330;
                }
                int _1762 = _1760;
                bool _1764 = _1442 == 60;
                int _1766 = _1762;
                if (_1734)
                {
                    _1766 = _1332;
                }
                int _1768 = _1766;
                bool _1770 = _1438 == 76;
                int _1772 = _1768;
                if (_1740)
                {
                    _1742 = _1344;
                }
                int _1774 = _1742;
                bool _1776 = _1442 == 64;
                int _1778 = _1774;
                if (_1746)
                {
                    _1772 = _1334;
                }
                int _1780 = _1772;
                bool _1782 = _1430 == 84;
                int _1784 = _1780;
                if (_1752)
                {
                    _1754 = _1348;
                }
                int _1786 = _1754;
                bool _1788 = _1442 == 68;
                int _1790 = _1786;
                if (_1758)
                {
                    _1784 = _1336;
                }
                int _1792 = _1784;
                bool _1794 = _1442 == 72;
                int _1796 = _1792;
                if (_1764)
                {
                    _1796 = _1338;
                }
                int _1798 = _1796;
                bool _1800 = _1442 == 76;
                int _1802 = _1798;
                if (_1770)
                {
                    _1778 = _1346;
                }
                int _1804 = _1778;
                bool _1806 = _1438 == 80;
                int _1808 = _1804;
                if (_1776)
                {
                    _1802 = _1340;
                }
                int _1810 = _1802;
                bool _1812 = _1494 == 0;
                int _1814 = _1810;
                if (_1782)
                {
                    _1790 = _1350;
                }
                int _1816 = _1790;
                bool _1818 = _1494 == 4;
                int _1820 = _1816;
                if (_1788)
                {
                    _1814 = _1342;
                }
                int _1822 = _1814;
                bool _1824 = _1442 == 80;
                int _1826 = _1822;
                if (_1794)
                {
                    _1826 = _1344;
                }
                int _1828 = _1826;
                bool _1830 = _1494 == 8;
                int _1832 = _1828;
                if (_1800)
                {
                    _1832 = _1346;
                }
                int _1834 = _1832;
                bool _1836 = _1430 == 88;
                int _1838 = _1834;
                if (_1806)
                {
                    _1808 = _1348;
                }
                int _1840 = _1808;
                bool _1842 = _1438 == 84;
                int _1844 = _1840;
                if (_1812)
                {
                    _1460 = _1308;
                }
                int _1846 = _1460;
                bool _1848 = _1494 == 12;
                int _1850 = _1846;
                if (_1818)
                {
                    _1850 = _1310;
                }
                int _1852 = _1850;
                bool _1854 = _1442 == 84;
                int _1856 = _1852;
                if (_1824)
                {
                    _1838 = _1348;
                }
                int _1858 = _1838;
                bool _1860 = _1494 == 16;
                int _1862 = _1858;
                if (_1830)
                {
                    _1856 = _1312;
                }
                int _1864 = _1856;
                bool _1866 = _1430 == 92;
                int _1868 = _1864;
                if (_1836)
                {
                    _1820 = _1352;
                }
                int _1870 = _1820;
                bool _1872 = _1494 == 20;
                int _1874 = _1870;
                if (_1842)
                {
                    _1844 = _1350;
                }
                int _1876 = _1844;
                bool _1878 = _1494 == 24;
                int _1880 = _1876;
                if (_1848)
                {
                    _1868 = _1314;
                }
                int _1882 = _1868;
                bool _1884 = _1438 == 88;
                int _1886 = _1882;
                if (_1854)
                {
                    _1862 = _1350;
                }
                int _1888 = _1862;
                bool _1890 = _1442 == 88;
                int _1892 = _1888;
                if (_1860)
                {
                    _1886 = _1316;
                }
                int _1894 = _1886;
                bool _1896 = _1494 == 28;
                int _1898 = _1894;
                if (_1866)
                {
                    _1874 = _1354;
                }
                int _1900 = _1874;
                bool _1902 = _1494 == 32;
                int _1904 = _1900;
                if (_1872)
                {
                    _1898 = _1318;
                }
                int _1906 = _1898;
                bool _1908 = _1430 == 96;
                int _1910 = _1906;
                if (_1878)
                {
                    _1910 = _1320;
                }
                int _1912 = _1910;
                bool _1914 = _1494 == 36;
                int _1916 = _1912;
                if (_1884)
                {
                    _1880 = _1352;
                }
                int _1918 = _1880;
                bool _1920 = _1494 == 40;
                int _1922 = _1918;
                if (_1890)
                {
                    _1892 = _1352;
                }
                int _1924 = _1892;
                bool _1926 = _1438 == 92;
                int _1928 = _1924;
                if (_1896)
                {
                    _1916 = _1322;
                }
                int _1930 = _1916;
                bool _1932 = _1494 == 44;
                int _1934 = _1930;
                if (_1902)
                {
                    _1934 = _1324;
                }
                int _1936 = _1934;
                bool _1938 = _1494 == 48;
                int _1940 = _1936;
                if (_1908)
                {
                    _1904 = _1356;
                }
                int _1942 = _1904;
                bool _1944 = _1438 == 96;
                int _1946 = _1942;
                if (_1914)
                {
                    _1940 = _1326;
                }
                int _1948 = _1940;
                bool _1950 = _1494 == 52;
                int _1952 = _1948;
                if (_1920)
                {
                    _1952 = _1328;
                }
                int _1954 = _1952;
                bool _1956 = _1418 >= _1942;
                int _1958 = _1954;
                if (_1926)
                {
                    _1922 = _1354;
                }
                int _1960 = _1922;
                int _1962 = _1960;
                if (_1932)
                {
                    _1958 = _1330;
                }
                int _1964 = _1958;
                bool _1966 = _1494 == 56;
                bool _1968 = _1494 == 60;
                int _1970 = _1964;
                if (_1938)
                {
                    _1970 = _1332;
                }
                int _1972 = _1970;
                bool _1974 = _1494 == 64;
                int _1976 = _1972;
                if (_1944)
                {
                    _1962 = _1356;
                }
                int _1978 = _1962;
                bool _1980 = _1442 == 92;
                _1376 = _1978;
                if (_1950)
                {
                    _1976 = _1334;
                }
                int _1982 = _1976;
                bool _1984 = _1494 == 68;
                int _1986 = _1982;
                if (!_1956)
                {
                    _1462 = _1942;
                }
                int _1988 = _1462;
                int _1990 = _1988;
                if (_1966)
                {
                    _1986 = _1336;
                }
                int _1992 = _1986;
                bool _1994 = _1494 == 72;
                int _1996 = _1992;
                if (_1968)
                {
                    _1996 = _1338;
                }
                int _1998 = _1996;
                bool _2000 = _1988 >= _1978;
                int _2002 = _1998;
                if (_1974)
                {
                    _2002 = _1340;
                }
                int _2004 = _2002;
                bool _2006 = _1442 == 96;
                int _2008 = _2004;
                if (_1980)
                {
                    _1928 = _1354;
                }
                int _2010 = _1928;
                bool _2012 = _1494 == 76;
                int _2014 = _2010;
                if (_1984)
                {
                    _2008 = _1342;
                }
                int _2016 = _2008;
                bool _2018 = _1494 == 80;
                int _2020 = _2016;
                if (_1994)
                {
                    _2020 = _1344;
                }
                int _2022 = _2020;
                bool _2024 = _1494 == 84;
                int _2026 = _2022;
                if (_2000)
                {
                    _1946 = _1988;
                }
                int _2028 = _1946;
                int _2030 = _2028;
                if (_2006)
                {
                    _2014 = _1356;
                }
                int _2032 = _2014;
                bool _2034 = _1494 == 88;
                _1378 = _2032;
                if (!_2000)
                {
                    _2030 = _1978;
                }
                int _2036 = _2030;
                int _2038 = _2036;
                if (_2012)
                {
                    _2026 = _1346;
                }
                int _2040 = _2026;
                bool _2042 = _1494 == 92;
                int _2044 = _2040;
                if (_2018)
                {
                    _2044 = _1348;
                }
                int _2046 = _2044;
                bool _2048 = _2036 >= _2032;
                int _2050 = _2046;
                if (_1956)
                {
                    _1990 = _1426;
                }
                int _2052 = _1990;
                int _2054 = _2052;
                if (_2024)
                {
                    _2050 = _1350;
                }
                int _2056 = _2050;
                bool _2058 = _1494 == 96;
                int _2060 = _2056;
                if (!_1956)
                {
                    _2054 = _1416;
                }
                int _2062 = _2054;
                int _2064 = _1416 + 4;
                _1398 = _2064;
                int _2066 = _2062;
                _1404 = _2064;
                if (_2034)
                {
                    _2060 = _1352;
                }
                int _2068 = _2060;
                int _2070 = _2068;
                if (!_2000)
                {
                    _2066 = _1432;
                }
                int _2072 = _2066;
                bool _2074 = _2064 >= _1412;
                int _2076 = _2072;
                if (_2042)
                {
                    _2070 = _1354;
                }
                int _2078 = _2070;
                int _2080 = _2078;
                if (!_2048)
                {
                    _2038 = _2032;
                }
                int _2082 = _2038;
                _1374 = _2082;
                _1382 = _2082;
                if (!_2048)
                {
                    _2076 = _1434;
                }
                int _2084 = _2076;
                int _2086 = _2084;
                if (_2058)
                {
                    _2080 = _1356;
                }
                int _2088 = _2080;
                bool _2090 = _2082 >= _2088;
                _1380 = _2088;
                if (_2090)
                {
                    _1464 = _2084;
                }
                int _2092 = _1464;
                int _2094 = _2092;
                if (_2090)
                {
                    _2086 = _2082;
                }
                int _2096 = _2086;
                int _2098 = _2096;
                if (!_2090)
                {
                    _2098 = _2088;
                }
                int _2100 = _2098;
                _1400 = _2100;
                _1406 = _2100;
                if (!_2090)
                {
                    _2094 = _1452;
                }
                int _2102 = _2094;
                _1414 = !_2074;
                _1402 = _2102;
                _1410 = _2102;
            } while (_1414);
        }
        int _2104 = _1404;
        int _2106 = _1406;
        int _2108 = _1382;
        int _2110 = _1408;
        int _2112 = _1410;
        int _2114 = -_2104;
        int _2116 = _1360 + _2114;
        bool _2118 = _2116 > 1;
        bool _2120 = !_2118;
        int _2122 = _2108;
        int _2124 = _2116;
        int _2126 = _2106;
        int _2128 = _2112;
        int _2130 = _2104;
        int _2132 = _2110;
        int _2134 = _2106;
        int _2136 = _2112;
        if (!_2120)
        {
            int _2138 = _2104 * 4;
            int _2140 = _2104 + 1;
            bool _2142 = _2138 == 0;
            int _2144 = _2140 * 4;
            bool _2146 = _2138 == 4;
            bool _2148 = _2138 == 8;
            bool _2150 = _2138 == 12;
            bool _2152 = _2138 == 24;
            bool _2154 = _2144 == 0;
            bool _2156 = _2138 == 40;
            if (_2142)
            {
                _2122 = _1308;
            }
            int _2158 = _2122;
            bool _2160 = _2138 == 16;
            int _2162 = _2158;
            if (_2146)
            {
                _2162 = _1310;
            }
            int _2164 = _2162;
            bool _2166 = _2138 == 20;
            int _2168 = _2164;
            if (_2148)
            {
                _2168 = _1312;
            }
            int _2170 = _2168;
            bool _2172 = _2138 == 36;
            int _2174 = _2170;
            if (_2150)
            {
                _2174 = _1314;
            }
            int _2176 = _2174;
            bool _2178 = _2138 == 28;
            int _2180 = _2176;
            if (_2154)
            {
                _2124 = _1308;
            }
            int _2182 = _2124;
            bool _2184 = _2144 == 16;
            int _2186 = _2182;
            if (_2160)
            {
                _2180 = _1316;
            }
            int _2188 = _2180;
            bool _2190 = _2138 == 32;
            int _2192 = _2188;
            if (_2166)
            {
                _2192 = _1318;
            }
            int _2194 = _2192;
            bool _2196 = _2138 == 48;
            int _2198 = _2194;
            if (_2152)
            {
                _2198 = _1320;
            }
            int _2200 = _2198;
            bool _2202 = _2144 == 4;
            int _2204 = _2200;
            if (_2178)
            {
                _2204 = _1322;
            }
            int _2206 = _2204;
            bool _2208 = _2138 == 44;
            int _2210 = _2206;
            if (_2190)
            {
                _2210 = _1324;
            }
            int _2212 = _2210;
            bool _2214 = _2144 == 8;
            int _2216 = _2212;
            if (_2172)
            {
                _2216 = _1326;
            }
            int _2218 = _2216;
            bool _2220 = _2144 == 12;
            int _2222 = _2218;
            if (_2202)
            {
                _2186 = _1310;
            }
            int _2224 = _2186;
            bool _2226 = _2138 == 52;
            int _2228 = _2224;
            if (_2156)
            {
                _2222 = _1328;
            }
            int _2230 = _2222;
            bool _2232 = _2144 == 20;
            int _2234 = _2230;
            if (_2208)
            {
                _2234 = _1330;
            }
            int _2236 = _2234;
            bool _2238 = _2144 == 24;
            int _2240 = _2236;
            if (_2196)
            {
                _2240 = _1332;
            }
            int _2242 = _2240;
            bool _2244 = _2138 == 60;
            int _2246 = _2242;
            if (_2214)
            {
                _2228 = _1312;
            }
            int _2248 = _2228;
            bool _2250 = _2138 == 56;
            int _2252 = _2248;
            if (_2220)
            {
                _2252 = _1314;
            }
            int _2254 = _2252;
            bool _2256 = _2144 == 28;
            int _2258 = _2254;
            if (_2184)
            {
                _2258 = _1316;
            }
            int _2260 = _2258;
            bool _2262 = _2144 == 32;
            int _2264 = _2260;
            if (_2232)
            {
                _2264 = _1318;
            }
            int _2266 = _2264;
            bool _2268 = _2144 == 36;
            int _2270 = _2266;
            if (_2226)
            {
                _2246 = _1334;
            }
            int _2272 = _2246;
            bool _2274 = _2138 == 64;
            int _2276 = _2272;
            if (_2238)
            {
                _2270 = _1320;
            }
            int _2278 = _2270;
            bool _2280 = _2138 == 68;
            int _2282 = _2278;
            if (_2250)
            {
                _2276 = _1336;
            }
            int _2284 = _2276;
            bool _2286 = _2144 == 40;
            int _2288 = _2284;
            if (_2256)
            {
                _2282 = _1322;
            }
            int _2290 = _2282;
            bool _2292 = _2138 == 72;
            int _2294 = _2290;
            if (_2244)
            {
                _2288 = _1338;
            }
            int _2296 = _2288;
            bool _2298 = _2144 == 44;
            int _2300 = _2296;
            if (_2262)
            {
                _2294 = _1324;
            }
            int _2302 = _2294;
            int _2304 = _2302;
            if (_2268)
            {
                _2304 = _1326;
            }
            int _2306 = _2304;
            int _2308 = _2306;
            if (_2274)
            {
                _2300 = _1340;
            }
            int _2310 = _2300;
            bool _2312 = _2138 == 76;
            int _2314 = _2310;
            if (_2280)
            {
                _2314 = _1342;
            }
            int _2316 = _2314;
            bool _2318 = _2138 == 80;
            bool _2320 = _2144 == 48;
            int _2322 = _2316;
            if (_2286)
            {
                _2308 = _1328;
            }
            int _2324 = _2308;
            bool _2326 = _2144 == 52;
            int _2328 = _2324;
            if (_2292)
            {
                _2322 = _1344;
            }
            int _2330 = _2322;
            bool _2332 = _2138 == 84;
            int _2334 = _2330;
            if (_2298)
            {
                _2328 = _1330;
            }
            int _2336 = _2328;
            bool _2338 = _2144 == 56;
            bool _2340 = _2144 == 60;
            int _2342 = _2336;
            if (_2312)
            {
                _2334 = _1346;
            }
            int _2344 = _2334;
            bool _2346 = _2138 == 88;
            int _2348 = _2344;
            if (_2318)
            {
                _2348 = _1348;
            }
            int _2350 = _2348;
            bool _2352 = _2138 == 92;
            int _2354 = _2350;
            if (_2320)
            {
                _2342 = _1332;
            }
            int _2356 = _2342;
            bool _2358 = _2144 == 64;
            int _2360 = _2356;
            if (_2326)
            {
                _2360 = _1334;
            }
            int _2362 = _2360;
            bool _2364 = _2144 == 68;
            int _2366 = _2362;
            if (_2332)
            {
                _2354 = _1350;
            }
            int _2368 = _2354;
            bool _2370 = _2138 == 96;
            int _2372 = _2368;
            if (_2338)
            {
                _2366 = _1336;
            }
            int _2374 = _2366;
            bool _2376 = _2144 == 72;
            int _2378 = _2374;
            if (_2340)
            {
                _2378 = _1338;
            }
            int _2380 = _2378;
            bool _2382 = _2144 == 76;
            int _2384 = _2380;
            if (_2346)
            {
                _2372 = _1352;
            }
            int _2386 = _2372;
            int _2388 = _2386;
            if (_2352)
            {
                _2388 = _1354;
            }
            int _2390 = _2388;
            bool _2392 = _2144 == 96;
            int _2394 = _2390;
            if (_2358)
            {
                _2384 = _1340;
            }
            int _2396 = _2384;
            bool _2398 = _2144 == 80;
            int _2400 = _2396;
            if (_2364)
            {
                _2400 = _1342;
            }
            int _2402 = _2400;
            bool _2404 = _2144 == 84;
            int _2406 = _2402;
            if (_2370)
            {
                _2394 = _1356;
            }
            int _2408 = _2394;
            bool _2410 = _2144 == 92;
            if (_2376)
            {
                _2406 = _1344;
            }
            int _2412 = _2406;
            bool _2414 = _2144 == 88;
            int _2416 = _2412;
            if (_2382)
            {
                _2416 = _1346;
            }
            int _2418 = _2416;
            bool _2420 = _2106 >= _2408;
            int _2422 = _2418;
            if (_2398)
            {
                _2422 = _1348;
            }
            int _2424 = _2422;
            int _2426 = _2424;
            if (_2404)
            {
                _2426 = _1350;
            }
            int _2428 = _2426;
            int _2430 = _2428;
            if (_2414)
            {
                _2430 = _1352;
            }
            int _2432 = _2430;
            int _2434 = _2432;
            _2132 = 0;
            if (_2410)
            {
                _2434 = _1354;
            }
            int _2436 = _2434;
            int _2438 = _2436;
            if (_2392)
            {
                _2438 = _1356;
            }
            int _2440 = _2438;
            if (!_2420)
            {
                _2126 = _2408;
            }
            int _2442 = _2126;
            _2134 = _2442;
            if (!_2420)
            {
                _2128 = _2104;
            }
            int _2444 = _2128;
            int _2446 = _2140 + 1;
            bool _2448 = _2442 >= _2440;
            int _2450 = _2444;
            _2130 = _2446;
            if (!_2448)
            {
                _2450 = _2140;
            }
            int _2452 = _2450;
            _2136 = _2452;
            if (!_2448)
            {
                _2134 = _2440;
            }
        }
        int _2454 = _2130;
        int _2456 = _2132;
        int _2458 = _2134;
        int _2460 = _2136;
        bool _2462 = _2454 < _1360;
        int _2464 = (_2462 ? (-1) : 0) | _2456;
        int _2466 = ~_2464;
        int _2468 = _2460;
        if (!(_2466 != 0))
        {
            int _2470 = _2454 << 2;
            bool _2472 = _2470 == 4;
            bool _2474 = _2470 == 8;
            bool _2476 = _2470 == 12;
            bool _2478 = _2470 == 16;
            if (_2472)
            {
                _1384 = _1310;
            }
            int _2480 = _1384;
            bool _2482 = _2470 == 20;
            int _2484 = _2480;
            if (_2474)
            {
                _2484 = _1312;
            }
            int _2486 = _2484;
            bool _2488 = _2470 == 24;
            int _2490 = _2486;
            if (_2476)
            {
                _2490 = _1314;
            }
            int _2492 = _2490;
            bool _2494 = _2470 == 28;
            int _2496 = _2492;
            if (_2478)
            {
                _2496 = _1316;
            }
            int _2498 = _2496;
            bool _2500 = _2470 == 32;
            int _2502 = _2498;
            if (_2482)
            {
                _2502 = _1318;
            }
            int _2504 = _2502;
            bool _2506 = _2470 == 36;
            int _2508 = _2504;
            if (_2488)
            {
                _2508 = _1320;
            }
            int _2510 = _2508;
            bool _2512 = _2470 == 40;
            int _2514 = _2510;
            if (_2494)
            {
                _2514 = _1322;
            }
            int _2516 = _2514;
            bool _2518 = _2470 == 44;
            int _2520 = _2516;
            if (_2500)
            {
                _2520 = _1324;
            }
            int _2522 = _2520;
            bool _2524 = _2470 == 48;
            int _2526 = _2522;
            if (_2506)
            {
                _2526 = _1326;
            }
            int _2528 = _2526;
            bool _2530 = _2470 == 52;
            int _2532 = _2528;
            if (_2512)
            {
                _2532 = _1328;
            }
            int _2534 = _2532;
            bool _2536 = _2470 == 56;
            int _2538 = _2534;
            if (_2518)
            {
                _2538 = _1330;
            }
            int _2540 = _2538;
            bool _2542 = _2470 == 60;
            int _2544 = _2540;
            if (_2524)
            {
                _2544 = _1332;
            }
            int _2546 = _2544;
            bool _2548 = _2470 == 64;
            int _2550 = _2546;
            if (_2530)
            {
                _2550 = _1334;
            }
            int _2552 = _2550;
            bool _2554 = _2470 == 68;
            int _2556 = _2552;
            if (_2536)
            {
                _2556 = _1336;
            }
            int _2558 = _2556;
            bool _2560 = _2470 == 72;
            int _2562 = _2558;
            if (_2542)
            {
                _2562 = _1338;
            }
            int _2564 = _2562;
            bool _2566 = _2470 == 76;
            int _2568 = _2564;
            if (_2548)
            {
                _2568 = _1340;
            }
            int _2570 = _2568;
            bool _2572 = _2470 == 80;
            int _2574 = _2570;
            if (_2554)
            {
                _2574 = _1342;
            }
            int _2576 = _2574;
            bool _2578 = _2470 == 84;
            int _2580 = _2576;
            if (_2560)
            {
                _2580 = _1344;
            }
            int _2582 = _2580;
            bool _2584 = _2470 == 88;
            int _2586 = _2582;
            if (_2566)
            {
                _2586 = _1346;
            }
            int _2588 = _2586;
            bool _2590 = _2470 == 92;
            int _2592 = _2588;
            if (_2572)
            {
                _2592 = _1348;
            }
            int _2594 = _2592;
            bool _2596 = _2470 == 96;
            int _2598 = _2594;
            if (_2578)
            {
                _2598 = _1350;
            }
            int _2600 = _2598;
            int _2602 = _2600;
            if (_2584)
            {
                _2602 = _1352;
            }
            int _2604 = _2602;
            int _2606 = _2604;
            if (_2590)
            {
                _2606 = _1354;
            }
            int _2608 = _2606;
            int _2610 = _2608;
            if (_2596)
            {
                _2610 = _1356;
            }
            int _2612 = _2610;
            bool _2614 = _2458 >= _2612;
            if (!_2614)
            {
                _2468 = _2454;
            }
        }
        int _2616 = _2468;
        _1392 = _2616;
    }
    int _2618 = _1392;
    int _2620 = _2618 * 8;
    uint _2622 = uint(int(uint(_2620) >> uint(2)));
    float _2624 = as_type<float>(_31[int(_2622)]);
    int _2626 = _2620 + 4;
    uint _2628 = uint(int(uint(_2626) >> uint(2)));
    float _2630 = as_type<float>(_31[int(_2628)]);
    int _2632 = _71 + 16;
    int _2634 = _71 + 24;
    uint _2636 = uint(int(uint(_2632) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2636)] = as_type<uint>(_2624);
    int _2638 = _2632 + 4;
    uint _2640 = uint(int(uint(_2638) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2640)] = as_type<uint>(_2630);
    uint _2642 = uint(int(uint(_2634) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2642)] = as_type<uint>(_1358);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _884 = false;
    bool _708 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _2663 = float2((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    float4 _57 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2663, float2(0.0), isnan(_2663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2663, float2(0.0), isnan(_2663)), level(0.0)).xyzw;
    float _60 = _57.x;
    float _62 = _57.y;
    float _64 = _57.z;
    float _66 = _57.w;
    float _68 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _71 = as_type<int>(_68) * 32;
    uint _74 = uint(int(uint(_71) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_74)] = as_type<uint>(_60);
    int _76 = _71 + 4;
    uint _78 = uint(int(uint(_76) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_78)] = as_type<uint>(_62);
    int _80 = _71 + 8;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_82)] = as_type<uint>(_64);
    int _84 = _71 + 12;
    uint _86 = uint(int(uint(_84) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_86)] = as_type<uint>(_66);
    int _88 = -2;
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
    int _140 = 0;
    float _142 = 1000000.0;
    bool _146;
    bool _288;
    float _670;
    int _672;
    int _674;
    int _676;
    bool _684;
    int _686;
    int _740;
    int _742;
    int _748;
    int _754;
    int _760;
    int _766;
    int _772;
    int _778;
    int _784;
    int _790;
    int _796;
    int _802;
    int _808;
    int _814;
    int _820;
    int _826;
    int _830;
    bool _834;
    int _836;
    int _842;
    int _848;
    int _854;
    int _860;
    int _864;
    int _868;
    int _872;
    int _876;
    int _880;
    int _882;
    int _1242;
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
    int _1344;
    int _1346;
    int _1348;
    int _1350;
    int _1352;
    int _1354;
    int _1356;
    float _1358;
    int _1360;
    int _1374;
    int _1376;
    int _1378;
    int _1380;
    int _1382;
    int _1384;
    do
    {
        int _148 = _88;
        int _150 = _90;
        int _152 = _92;
        int _154 = _94;
        int _156 = _96;
        int _158 = _98;
        int _160 = _100;
        int _162 = _102;
        int _164 = _104;
        int _166 = _106;
        int _168 = _108;
        int _170 = _110;
        int _172 = _112;
        int _174 = _114;
        int _176 = _116;
        int _178 = _118;
        int _180 = _120;
        int _182 = _122;
        int _184 = _124;
        int _186 = _126;
        int _188 = _128;
        int _190 = _130;
        int _192 = _132;
        int _194 = _134;
        int _196 = _136;
        int _198 = _138;
        int _200 = _140;
        float _202 = _142;
        float _204 = float(_148);
        float _206 = _204 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _208 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _210 = fma(_206, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2783 = float2(_208, _210);
        float4 _212 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2783, float2(0.0), isnan(_2783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2783, float2(0.0), isnan(_2783)), level(0.0)).xyzw;
        float _214 = _212.x;
        float _216 = _212.y;
        float _218 = _212.z;
        float _220 = _212.w;
        int _222 = -2;
        float _224 = _216;
        float _226 = _220;
        float _228 = _218;
        float _230 = _214;
        int _232 = -2;
        int _234 = _150;
        int _236 = _152;
        int _238 = _154;
        int _240 = _156;
        int _242 = _158;
        int _244 = _160;
        int _246 = _162;
        int _248 = _164;
        int _250 = _166;
        int _252 = _168;
        int _254 = _170;
        int _256 = _172;
        int _258 = _174;
        int _260 = _176;
        int _262 = _178;
        int _264 = _180;
        int _266 = _182;
        int _268 = _184;
        int _270 = _186;
        int _272 = _188;
        int _274 = _190;
        int _276 = _192;
        int _278 = _194;
        int _280 = _196;
        int _282 = _198;
        int _284 = _200;
        float _286 = _202;
        do
        {
            int _290 = _222;
            float _292 = _224;
            float _294 = _226;
            float _296 = _228;
            float _298 = _230;
            int _300 = _232;
            int _302 = _234;
            int _304 = _236;
            int _306 = _238;
            int _308 = _240;
            int _310 = _242;
            int _312 = _244;
            int _314 = _246;
            int _316 = _248;
            int _318 = _250;
            int _320 = _252;
            int _322 = _254;
            int _324 = _256;
            int _326 = _258;
            int _328 = _260;
            int _330 = _262;
            int _332 = _264;
            int _334 = _266;
            int _336 = _268;
            int _338 = _270;
            int _340 = _272;
            int _342 = _274;
            int _344 = _276;
            int _346 = _278;
            int _348 = _280;
            int _350 = _282;
            int _352 = _284;
            float _354 = _286;
            int _356 = _290 + 1;
            float _358 = float(_148);
            float _360 = 0.0 + _292;
            float _362 = precise::clamp(_360, 0.0, 1.0);
            float _364 = _358 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _366 = float(_356);
            float _368 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _370 = fma(_364, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _372 = 0.0 + _294;
            float _374 = precise::clamp(_372, 0.0, 1.0);
            float _376 = fma(_366, _368, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _378 = 0.0 + _296;
            float _380 = precise::clamp(_378, 0.0, 1.0);
            float _382 = 0.0 + _298;
            float _384 = precise::clamp(_382, 0.0, 1.0);
            float2 _2903 = float2(_376, _370);
            float4 _386 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2903, float2(0.0), isnan(_2903)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2903, float2(0.0), isnan(_2903)), level(0.0)).xyzw;
            float _388 = _386.x;
            float _390 = _386.y;
            float _392 = _386.z;
            float _394 = _386.w;
            float _396 = _374 * 65535.0;
            float _398 = _380 * 65535.0;
            float _400 = _362 * 65535.0;
            float _402 = _384 * 65535.0;
            float _404 = rint(_396);
            int _406 = int(_404);
            float _408 = rint(_398);
            int _410 = int(_408);
            float _412 = rint(_400);
            int _414 = int(_412);
            uint _416 = extract_bits(uint(_406), 0u, 8u);
            int _418 = int(_416) & 255;
            uint _420 = extract_bits(uint(_406), 8u, 8u);
            int _422 = int(_420) & 255;
            int _424 = _422 << 8;
            int _426 = _418 | _424;
            float _428 = rint(_402);
            int _430 = int(_428);
            uint _432 = extract_bits(uint(_426), 0u, 8u);
            int _434 = int(_432) & 255;
            uint _436 = extract_bits(uint(_426), 8u, 8u);
            int _438 = int(_436) & 255;
            int _440 = _438 << 8;
            int _442 = _434 | _440;
            uint _444 = extract_bits(uint(_410), 0u, 8u);
            int _446 = int(_444) & 255;
            int _448 = _446 << 16;
            int _450 = _442 | _448;
            uint _452 = extract_bits(uint(_410), 8u, 8u);
            int _454 = int(_452) & 255;
            int _456 = _454 << 24;
            int _458 = _450 | _456;
            float _460 = float(_300);
            bool _462 = _458 != 0;
            uint _464 = extract_bits(uint(_414), 0u, 8u);
            int _466 = int(_464) & 255;
            uint _468 = extract_bits(uint(_414), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 8;
            int _474 = _466 | _472;
            float _476 = fma(_460, _368, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _478 = extract_bits(uint(_474), 0u, 8u);
            int _480 = int(_478) & 255;
            uint _482 = extract_bits(uint(_474), 8u, 8u);
            int _484 = int(_482) & 255;
            int _486 = _484 << 8;
            int _488 = _480 | _486;
            uint _490 = extract_bits(uint(_430), 0u, 8u);
            int _492 = int(_490) & 255;
            int _494 = _492 << 16;
            int _496 = _488 | _494;
            uint _498 = extract_bits(uint(_430), 8u, 8u);
            int _500 = int(_498) & 255;
            int _502 = _500 << 24;
            int _504 = _496 | _502;
            bool _506 = _504 != 0;
            bool _508 = _506 || _462;
            bool _510 = !_508;
            _222 = _356;
            _224 = _390;
            _226 = _394;
            _228 = _392;
            _230 = _388;
            int _512 = _312;
            int _514 = _304;
            int _516 = _306;
            int _518 = _308;
            int _520 = _310;
            int _522 = _314;
            int _524 = _316;
            int _526 = _326;
            int _528 = _318;
            int _530 = _320;
            int _532 = _322;
            int _534 = _324;
            int _536 = _328;
            int _538 = _330;
            int _540 = _340;
            int _542 = _332;
            int _544 = _334;
            int _546 = _336;
            int _548 = _338;
            int _550 = _342;
            int _552 = _344;
            int _554 = _346;
            int _556 = _348;
            int _558 = _350;
            int _560 = _352;
            int _562 = _458;
            int _564 = _304;
            int _566 = _306;
            int _568 = _308;
            int _570 = _310;
            int _572 = _348;
            int _574 = _350;
            int _576 = _352;
            int _578 = _312;
            int _580 = _314;
            int _582 = _316;
            int _584 = _318;
            int _586 = _320;
            int _588 = _322;
            int _590 = _324;
            int _592 = _326;
            int _594 = _328;
            int _596 = _330;
            int _598 = _332;
            int _600 = _334;
            int _602 = _336;
            int _604 = _338;
            int _606 = _346;
            int _608 = _344;
            int _610 = _342;
            int _612 = _302;
            int _614 = _304;
            int _616 = _306;
            int _618 = _308;
            int _620 = _310;
            int _622 = _312;
            int _624 = _314;
            int _626 = _316;
            int _628 = _318;
            int _630 = _320;
            int _632 = _322;
            int _634 = _324;
            int _636 = _326;
            int _638 = _328;
            int _640 = _330;
            int _642 = _332;
            int _644 = _334;
            int _646 = _336;
            int _648 = _338;
            int _650 = _340;
            int _652 = _342;
            int _654 = _344;
            int _656 = _346;
            int _658 = _348;
            int _660 = _350;
            int _662 = _352;
            int _664 = _430;
            int _666 = _458;
            int _668 = as_type<int>(_460);
            _670 = _354;
            _672 = _504;
            _674 = _458;
            _676 = as_type<int>(_392);
            if (!_510)
            {
                bool _678 = _302 > 0;
                bool _680 = !_678;
                if (!_680)
                {
                    int _682 = 0;
                    do
                    {
                        _686 = _682;
                        int _688 = _686 * 8;
                        uint _690 = uint(int(uint(_688) >> uint(2)));
                        float _692 = as_type<float>(_31[int(_690)]);
                        int _694 = _688 + 4;
                        uint _696 = uint(int(uint(_694) >> uint(2)));
                        float _698 = as_type<float>(_31[int(_696)]);
                        bool _700 = as_type<int>(_692) != _458;
                        bool _702 = as_type<int>(_698) != _504;
                        bool _704 = _702 || _700;
                        bool _706 = !_704;
                        _708 = _706;
                        if (_708)
                        {
                            break;
                        }
                        int _710 = _686 + 1;
                        bool _712 = _710 >= _302;
                        _684 = !_712;
                        _682 = _710;
                    } while (_684);
                }
                if (!_708)
                {
                    int _714 = _302 * 4;
                    int _716 = _302 * 8;
                    int _718 = _302 + 1;
                    bool _720 = _714 == 16;
                    bool _722 = _714 == 0;
                    uint _724 = uint(int(uint(_716) >> uint(2)));
                    _31[int(_724)] = uint(_458);
                    int _726 = _716 + 4;
                    uint _728 = uint(int(uint(_726) >> uint(2)));
                    _31[int(_728)] = uint(_504);
                    bool _730 = _714 == 4;
                    bool _732 = _714 == 8;
                    bool _734 = _714 == 12;
                    bool _736 = _714 == 20;
                    bool _738 = _714 == 24;
                    _612 = _718;
                    _664 = _716;
                    _668 = _714;
                    _740 = _716;
                    _742 = _714;
                    if (_720)
                    {
                        _512 = 1;
                    }
                    int _744 = _512;
                    bool _746 = _714 == 44;
                    _622 = _744;
                    _748 = _744;
                    if (_722)
                    {
                        _514 = 1;
                    }
                    int _750 = _514;
                    bool _752 = _714 == 28;
                    _614 = _750;
                    _754 = _750;
                    if (_730)
                    {
                        _516 = 1;
                    }
                    int _756 = _516;
                    bool _758 = _714 == 32;
                    _616 = _756;
                    _760 = _756;
                    if (_732)
                    {
                        _518 = 1;
                    }
                    int _762 = _518;
                    bool _764 = _714 == 36;
                    _618 = _762;
                    _766 = _762;
                    if (_734)
                    {
                        _520 = 1;
                    }
                    int _768 = _520;
                    bool _770 = _714 == 40;
                    _620 = _768;
                    _772 = _768;
                    if (_736)
                    {
                        _522 = 1;
                    }
                    int _774 = _522;
                    bool _776 = _714 == 48;
                    _624 = _774;
                    _778 = _774;
                    if (_738)
                    {
                        _524 = 1;
                    }
                    int _780 = _524;
                    bool _782 = _714 == 52;
                    _626 = _780;
                    _784 = _780;
                    if (_746)
                    {
                        _526 = 1;
                    }
                    int _786 = _526;
                    bool _788 = _714 == 72;
                    _636 = _786;
                    _790 = _786;
                    if (_752)
                    {
                        _528 = 1;
                    }
                    int _792 = _528;
                    bool _794 = _714 == 56;
                    _628 = _792;
                    _796 = _792;
                    if (_758)
                    {
                        _530 = 1;
                    }
                    int _798 = _530;
                    bool _800 = _714 == 60;
                    _630 = _798;
                    _802 = _798;
                    if (_764)
                    {
                        _532 = 1;
                    }
                    int _804 = _532;
                    bool _806 = _714 == 64;
                    _632 = _804;
                    _808 = _804;
                    if (_770)
                    {
                        _534 = 1;
                    }
                    int _810 = _534;
                    bool _812 = _714 == 68;
                    _634 = _810;
                    _814 = _810;
                    if (_776)
                    {
                        _536 = 1;
                    }
                    int _816 = _536;
                    bool _818 = _714 == 76;
                    _638 = _816;
                    _820 = _816;
                    if (_782)
                    {
                        _538 = 1;
                    }
                    int _822 = _538;
                    bool _824 = _714 == 80;
                    _640 = _822;
                    _826 = _822;
                    if (_788)
                    {
                        _540 = 1;
                    }
                    int _828 = _540;
                    _650 = _828;
                    _830 = _828;
                    if (_794)
                    {
                        _542 = 1;
                    }
                    int _832 = _542;
                    _834 = _718 != 25;
                    _642 = _832;
                    _836 = _832;
                    if (_800)
                    {
                        _544 = 1;
                    }
                    int _838 = _544;
                    bool _840 = _714 == 84;
                    _644 = _838;
                    _842 = _838;
                    if (_806)
                    {
                        _546 = 1;
                    }
                    int _844 = _546;
                    bool _846 = _714 == 88;
                    _646 = _844;
                    _848 = _844;
                    if (_812)
                    {
                        _548 = 1;
                    }
                    int _850 = _548;
                    bool _852 = _714 == 92;
                    _648 = _850;
                    _854 = _850;
                    if (_818)
                    {
                        _550 = 1;
                    }
                    int _856 = _550;
                    bool _858 = _714 == 96;
                    _652 = _856;
                    _860 = _856;
                    if (_824)
                    {
                        _552 = 1;
                    }
                    int _862 = _552;
                    _654 = _862;
                    _864 = _862;
                    if (_840)
                    {
                        _554 = 1;
                    }
                    int _866 = _554;
                    _656 = _866;
                    _868 = _866;
                    if (_846)
                    {
                        _556 = 1;
                    }
                    int _870 = _556;
                    _658 = _870;
                    _872 = _870;
                    if (_852)
                    {
                        _558 = 1;
                    }
                    int _874 = _558;
                    _660 = _874;
                    _876 = _874;
                    if (_858)
                    {
                        _560 = 1;
                    }
                    int _878 = _560;
                    _662 = _878;
                    _880 = _878;
                }
                if ((!_834) || _708)
                {
                    if (!_708)
                    {
                        _882 = 25;
                        _884 = true;
                        if (_884)
                        {
                            break;
                        }
                    }
                    _708 = false;
                    int _886 = _686 * 4;
                    bool _888 = _886 == 0;
                    bool _890 = _886 == 4;
                    bool _892 = _886 == 8;
                    bool _894 = _886 == 12;
                    bool _896 = _886 == 88;
                    bool _898 = _886 == 92;
                    bool _900 = _886 == 96;
                    if (_888)
                    {
                        _562 = _304;
                    }
                    int _902 = _562;
                    bool _904 = _886 == 16;
                    int _906 = _902;
                    if (_890)
                    {
                        _906 = _306;
                    }
                    int _908 = _906;
                    bool _910 = _886 == 20;
                    int _912 = _908;
                    if (_892)
                    {
                        _912 = _308;
                    }
                    int _914 = _912;
                    bool _916 = _886 == 24;
                    int _918 = _914;
                    if (_894)
                    {
                        _918 = _310;
                    }
                    int _920 = _918;
                    bool _922 = _886 == 84;
                    int _924 = int(_916);
                    int _926 = _910 ? 2 : 0;
                    int _928 = _924 | _926;
                    int _930 = _904 ? 4 : 0;
                    int _932 = _928 | _930;
                    int _934 = _922 ? 8 : 0;
                    int _936 = _932 | _934;
                    int _938 = _896 ? 16 : 0;
                    int _940 = _936 | _938;
                    int _942 = _898 ? 32 : 0;
                    int _944 = _940 | _942;
                    int _946 = _900 ? 64 : 0;
                    int _948 = _944 | _946;
                    int _950 = _948 & 8;
                    int _952 = _920;
                    if (_904)
                    {
                        _952 = _312;
                    }
                    int _954 = _952;
                    bool _956 = _886 == 80;
                    int _958 = _954;
                    if (_910)
                    {
                        _958 = _314;
                    }
                    int _960 = _958;
                    bool _962 = _886 == 76;
                    int _964 = _960;
                    if (_916)
                    {
                        _964 = _316;
                    }
                    int _966 = _964;
                    bool _968 = _886 == 28;
                    int _970 = int(_968);
                    int _972 = _962 ? 2 : 0;
                    int _974 = _970 | _972;
                    int _976 = _956 ? 4 : 0;
                    int _978 = _974 | _976;
                    int _980 = _922 ? 8 : 0;
                    int _982 = _978 | _980;
                    int _984 = _896 ? 16 : 0;
                    int _986 = _982 | _984;
                    int _988 = _898 ? 32 : 0;
                    int _990 = _986 | _988;
                    int _992 = _900 ? 64 : 0;
                    int _994 = _990 | _992;
                    int _996 = _994 & 2;
                    int _998 = int(_968);
                    int _1000 = _962 ? 2 : 0;
                    int _1002 = _998 | _1000;
                    int _1004 = _956 ? 4 : 0;
                    int _1006 = _1002 | _1004;
                    int _1008 = _922 ? 8 : 0;
                    int _1010 = _1006 | _1008;
                    int _1012 = _896 ? 16 : 0;
                    int _1014 = _1010 | _1012;
                    int _1016 = _898 ? 32 : 0;
                    int _1018 = _1014 | _1016;
                    int _1020 = _900 ? 64 : 0;
                    int _1022 = _1018 | _1020;
                    int _1024 = _1022 & 4;
                    int _1026 = _966;
                    _664 = _996;
                    _668 = _1024;
                    if (_968)
                    {
                        _1026 = _318;
                    }
                    int _1028 = _1026;
                    bool _1030 = _886 == 32;
                    int _1032 = _1028;
                    if (_1030)
                    {
                        _1032 = _320;
                    }
                    int _1034 = _1032;
                    bool _1036 = _886 == 36;
                    int _1038 = _1034;
                    if (_1036)
                    {
                        _1038 = _322;
                    }
                    int _1040 = _1038;
                    bool _1042 = _886 == 40;
                    int _1044 = _1040;
                    if (_1042)
                    {
                        _1044 = _324;
                    }
                    int _1046 = _1044;
                    bool _1048 = _886 == 44;
                    int _1050 = _1046;
                    if (_1048)
                    {
                        _1050 = _326;
                    }
                    int _1052 = _1050;
                    bool _1054 = _886 == 48;
                    int _1056 = _1052;
                    if (_1054)
                    {
                        _1056 = _328;
                    }
                    int _1058 = _1056;
                    bool _1060 = _886 == 52;
                    int _1062 = _1058;
                    if (_1060)
                    {
                        _1062 = _330;
                    }
                    int _1064 = _1062;
                    bool _1066 = _886 == 56;
                    int _1068 = _1064;
                    if (_1066)
                    {
                        _1068 = _332;
                    }
                    int _1070 = _1068;
                    bool _1072 = _886 == 60;
                    int _1074 = _1070;
                    if (_1072)
                    {
                        _1074 = _334;
                    }
                    int _1076 = _1074;
                    bool _1078 = _886 == 64;
                    int _1080 = _1076;
                    if (_1078)
                    {
                        _1080 = _336;
                    }
                    int _1082 = _1080;
                    bool _1084 = _886 == 68;
                    int _1086 = _1082;
                    if (_1084)
                    {
                        _1086 = _338;
                    }
                    int _1088 = _1086;
                    bool _1090 = _886 == 72;
                    int _1092 = int(_1090);
                    int _1094 = _962 ? 2 : 0;
                    int _1096 = _1092 | _1094;
                    int _1098 = _956 ? 4 : 0;
                    int _1100 = _1096 | _1098;
                    int _1102 = _922 ? 8 : 0;
                    int _1104 = _1100 | _1102;
                    int _1106 = _896 ? 16 : 0;
                    int _1108 = _1104 | _1106;
                    int _1110 = _898 ? 32 : 0;
                    int _1112 = _1108 | _1110;
                    int _1114 = _900 ? 64 : 0;
                    int _1116 = _1112 | _1114;
                    int _1118 = _1116 & 1;
                    int _1120 = _1088;
                    if (_1090)
                    {
                        _1120 = _340;
                    }
                    int _1122 = _1120;
                    bool _1124 = _886 == 4;
                    int _1126 = _1122;
                    if (_962)
                    {
                        _1126 = _342;
                    }
                    int _1128 = _1126;
                    bool _1130 = _886 == 0;
                    int _1132 = _1128;
                    if (_956)
                    {
                        _1132 = _344;
                    }
                    int _1134 = _1132;
                    int _1136 = _1134;
                    if (_922)
                    {
                        _1136 = _346;
                    }
                    int _1138 = _1136;
                    int _1140 = _1138;
                    if (_896)
                    {
                        _1140 = _348;
                    }
                    int _1142 = _1140;
                    bool _1144 = _886 == 8;
                    int _1146 = _1142;
                    if (_898)
                    {
                        _1146 = _350;
                    }
                    int _1148 = _1146;
                    bool _1150 = _886 == 12;
                    int _1152 = _1148;
                    if (_900)
                    {
                        _1152 = _352;
                    }
                    int _1154 = _1152;
                    int _1156 = _1154 + 1;
                    _666 = _1156;
                    if (_1130)
                    {
                        _564 = _1156;
                    }
                    int _1158 = _564;
                    bool _1160 = _886 == 16;
                    _614 = _1158;
                    if (_1124)
                    {
                        _566 = _1156;
                    }
                    int _1162 = _566;
                    bool _1164 = _886 == 20;
                    _616 = _1162;
                    if (_1144)
                    {
                        _568 = _1156;
                    }
                    int _1166 = _568;
                    bool _1168 = _886 == 24;
                    _618 = _1166;
                    if (_1150)
                    {
                        _570 = _1156;
                    }
                    int _1170 = _570;
                    bool _1172 = _886 == 28;
                    _620 = _1170;
                    if (_896)
                    {
                        _572 = _1156;
                    }
                    int _1174 = _572;
                    _658 = _1174;
                    if (_898)
                    {
                        _574 = _1156;
                    }
                    int _1176 = _574;
                    _660 = _1176;
                    if (_900)
                    {
                        _576 = _1156;
                    }
                    int _1178 = _576;
                    _662 = _1178;
                    if (_1160)
                    {
                        _578 = _1156;
                    }
                    int _1180 = _578;
                    bool _1182 = _886 == 32;
                    _622 = _1180;
                    if (_1164)
                    {
                        _580 = _1156;
                    }
                    int _1184 = _580;
                    bool _1186 = _886 == 36;
                    _624 = _1184;
                    if (_1168)
                    {
                        _582 = _1156;
                    }
                    int _1188 = _582;
                    bool _1190 = _886 == 40;
                    _626 = _1188;
                    if (_1172)
                    {
                        _584 = _1156;
                    }
                    int _1192 = _584;
                    bool _1194 = _886 == 44;
                    _628 = _1192;
                    if (_1182)
                    {
                        _586 = _1156;
                    }
                    int _1196 = _586;
                    bool _1198 = _886 == 48;
                    _630 = _1196;
                    if (_1186)
                    {
                        _588 = _1156;
                    }
                    int _1200 = _588;
                    bool _1202 = _886 == 52;
                    _632 = _1200;
                    if (_1190)
                    {
                        _590 = _1156;
                    }
                    int _1204 = _590;
                    bool _1206 = _886 == 56;
                    _634 = _1204;
                    if (_1194)
                    {
                        _592 = _1156;
                    }
                    int _1208 = _592;
                    bool _1210 = _886 == 60;
                    _636 = _1208;
                    if (_1198)
                    {
                        _594 = _1156;
                    }
                    int _1212 = _594;
                    bool _1214 = _886 == 64;
                    _638 = _1212;
                    if (_1202)
                    {
                        _596 = _1156;
                    }
                    int _1216 = _596;
                    bool _1218 = _886 == 68;
                    _640 = _1216;
                    if (_1206)
                    {
                        _598 = _1156;
                    }
                    int _1220 = _598;
                    bool _1222 = _950 != 0;
                    _642 = _1220;
                    if (_1210)
                    {
                        _600 = _1156;
                    }
                    int _1224 = _600;
                    bool _1226 = _1024 != 0;
                    _644 = _1224;
                    if (_1214)
                    {
                        _602 = _1156;
                    }
                    int _1228 = _602;
                    bool _1230 = _996 != 0;
                    _646 = _1228;
                    if (_1218)
                    {
                        _604 = _1156;
                    }
                    int _1232 = _604;
                    bool _1234 = _1118 != 0;
                    _648 = _1232;
                    if (_1222)
                    {
                        _606 = _1156;
                    }
                    int _1236 = _606;
                    _656 = _1236;
                    if (_1226)
                    {
                        _608 = _1156;
                    }
                    int _1238 = _608;
                    _654 = _1238;
                    if (_1230)
                    {
                        _610 = _1156;
                    }
                    int _1240 = _610;
                    _652 = _1240;
                    if (_1234)
                    {
                        _650 = _1156;
                    }
                }
            }
            _1242 = _612;
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
            int _1288 = _658;
            int _1290 = _660;
            int _1292 = _662;
            int _1294 = _664;
            int _1296 = _666;
            int _1298 = _668;
            float2 _4060 = float2(_476, _370);
            float _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4060, float2(0.0), isnan(_4060)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4060, float2(0.0), isnan(_4060)), level(0.0)).x;
            int _1302 = _300 + 1;
            bool _1304 = _1302 >= 3;
            float _1306 = precise::min(_1300, _354);
            _288 = !_1304;
            _232 = _1302;
            _234 = _1242;
            _236 = _1244;
            _238 = _1246;
            _240 = _1248;
            _242 = _1250;
            _244 = _1252;
            _246 = _1254;
            _248 = _1256;
            _250 = _1258;
            _252 = _1260;
            _254 = _1262;
            _256 = _1264;
            _258 = _1266;
            _260 = _1268;
            _262 = _1270;
            _264 = _1272;
            _266 = _1274;
            _268 = _1276;
            _270 = _1278;
            _272 = _1280;
            _274 = _1282;
            _276 = _1284;
            _278 = _1286;
            _280 = _1288;
            _282 = _1290;
            _284 = _1292;
            _286 = _1306;
            _754 = _1244;
            _760 = _1246;
            _766 = _1248;
            _772 = _1250;
            _748 = _1252;
            _778 = _1254;
            _784 = _1256;
            _796 = _1258;
            _802 = _1260;
            _808 = _1262;
            _814 = _1264;
            _790 = _1266;
            _820 = _1268;
            _826 = _1270;
            _836 = _1272;
            _842 = _1274;
            _848 = _1276;
            _854 = _1278;
            _830 = _1280;
            _860 = _1282;
            _864 = _1284;
            _868 = _1286;
            _872 = _1288;
            _876 = _1290;
            _880 = _1292;
            _670 = _1306;
            _672 = as_type<int>(_1300);
            _740 = _1294;
            _674 = _1296;
            _742 = _1298;
        } while (_288);
        if (!_884)
        {
            _882 = _1242;
        }
        _884 = false;
        _1308 = _754;
        _1310 = _760;
        _1312 = _766;
        _1314 = _772;
        _1316 = _748;
        _1318 = _778;
        _1320 = _784;
        _1322 = _796;
        _1324 = _802;
        _1326 = _808;
        _1328 = _814;
        _1330 = _790;
        _1332 = _820;
        _1334 = _826;
        _1336 = _836;
        _1338 = _842;
        _1340 = _848;
        _1342 = _854;
        _1344 = _830;
        _1346 = _860;
        _1348 = _864;
        _1350 = _868;
        _1352 = _872;
        _1354 = _876;
        _1356 = _880;
        _1358 = _670;
        _1360 = _882;
        int _1362 = _672;
        int _1364 = _740;
        int _1366 = _674;
        int _1368 = _742;
        int _1370 = _148 + 1;
        bool _1372 = _1370 >= 3;
        _146 = !_1372;
        _88 = _1370;
        _90 = _1360;
        _92 = _1308;
        _94 = _1310;
        _96 = _1312;
        _98 = _1314;
        _100 = _1316;
        _102 = _1318;
        _104 = _1320;
        _106 = _1322;
        _108 = _1324;
        _110 = _1326;
        _112 = _1328;
        _114 = _1330;
        _116 = _1332;
        _118 = _1334;
        _120 = _1336;
        _122 = _1338;
        _124 = _1340;
        _126 = _1342;
        _128 = _1344;
        _130 = _1346;
        _132 = _1348;
        _134 = _1350;
        _136 = _1352;
        _138 = _1354;
        _140 = _1356;
        _142 = _1358;
        _1374 = _1362;
        _1376 = _1364;
        _1378 = _1366;
        _1380 = _1368;
        _1382 = _1362;
        _1384 = _1308;
    } while (_146);
    bool _1386 = _1360 > 0;
    if (!_1386)
    {
        _676 = 0;
    }
    int _1388 = _676;
    bool _1390 = !_1386;
    int _1392 = _1388;
    if (!_1390)
    {
        bool _1394 = _1360 > 3;
        bool _1396 = !_1394;
        int _1398 = 0;
        int _1400 = 0;
        int _1402 = 0;
        int _1404 = 0;
        int _1406 = 0;
        int _1408 = -1;
        int _1410 = 0;
        if (!_1396)
        {
            int _1412 = _1360 + (-3);
            _1408 = 0;
            bool _1414;
            do
            {
                int _1416 = _1398;
                int _1418 = _1400;
                int _1420 = _1374;
                int _1422 = _1376;
                int _1424 = _1378;
                int _1426 = _1402;
                int _1428 = _1380;
                int _1430 = _1416 * 4;
                int _1432 = _1416 + 1;
                int _1434 = _1416 + 2;
                bool _1436 = _1430 == 0;
                int _1438 = _1432 * 4;
                bool _1440 = _1430 == 4;
                int _1442 = _1434 * 4;
                bool _1444 = _1430 == 8;
                bool _1446 = _1430 == 12;
                bool _1448 = _1430 == 16;
                bool _1450 = _1438 == 8;
                int _1452 = _1416 + 3;
                int _1454 = _1420;
                int _1456 = _1422;
                int _1458 = _1424;
                int _1460 = _1428;
                int _1462 = _1418;
                int _1464 = _1426;
                if (_1436)
                {
                    _1454 = _1308;
                }
                int _1466 = _1454;
                bool _1468 = _1430 == 24;
                int _1470 = _1466;
                if (_1440)
                {
                    _1470 = _1310;
                }
                int _1472 = _1470;
                bool _1474 = _1430 == 20;
                int _1476 = _1472;
                if (_1444)
                {
                    _1476 = _1312;
                }
                int _1478 = _1476;
                bool _1480 = _1430 == 32;
                int _1482 = _1478;
                if (_1446)
                {
                    _1482 = _1314;
                }
                int _1484 = _1482;
                bool _1486 = _1430 == 28;
                int _1488 = _1484;
                if (_1448)
                {
                    _1488 = _1316;
                }
                int _1490 = _1488;
                bool _1492 = _1430 == 40;
                int _1494 = _1452 * 4;
                int _1496 = _1490;
                if (_1474)
                {
                    _1496 = _1318;
                }
                int _1498 = _1496;
                bool _1500 = _1430 == 36;
                int _1502 = _1498;
                if (_1468)
                {
                    _1502 = _1320;
                }
                int _1504 = _1502;
                bool _1506 = _1438 == 0;
                int _1508 = _1504;
                if (_1486)
                {
                    _1508 = _1322;
                }
                int _1510 = _1508;
                bool _1512 = _1438 == 4;
                int _1514 = _1510;
                if (_1480)
                {
                    _1514 = _1324;
                }
                int _1516 = _1514;
                bool _1518 = _1438 == 12;
                int _1520 = _1516;
                if (_1500)
                {
                    _1520 = _1326;
                }
                int _1522 = _1520;
                bool _1524 = _1430 == 44;
                int _1526 = _1522;
                if (_1492)
                {
                    _1526 = _1328;
                }
                int _1528 = _1526;
                bool _1530 = _1438 == 16;
                int _1532 = _1528;
                if (_1506)
                {
                    _1456 = _1308;
                }
                int _1534 = _1456;
                bool _1536 = _1430 == 48;
                int _1538 = _1534;
                if (_1512)
                {
                    _1538 = _1310;
                }
                int _1540 = _1538;
                bool _1542 = _1438 == 20;
                int _1544 = _1540;
                if (_1450)
                {
                    _1544 = _1312;
                }
                int _1546 = _1544;
                bool _1548 = _1438 == 24;
                int _1550 = _1546;
                if (_1518)
                {
                    _1550 = _1314;
                }
                int _1552 = _1550;
                bool _1554 = _1438 == 28;
                int _1556 = _1552;
                if (_1524)
                {
                    _1532 = _1330;
                }
                int _1558 = _1532;
                bool _1560 = _1430 == 52;
                int _1562 = _1558;
                if (_1530)
                {
                    _1556 = _1316;
                }
                int _1564 = _1556;
                bool _1566 = _1438 == 32;
                int _1568 = _1564;
                if (_1536)
                {
                    _1562 = _1332;
                }
                int _1570 = _1562;
                bool _1572 = _1430 == 56;
                int _1574 = _1570;
                if (_1542)
                {
                    _1568 = _1318;
                }
                int _1576 = _1568;
                bool _1578 = _1438 == 36;
                int _1580 = _1576;
                if (_1548)
                {
                    _1580 = _1320;
                }
                int _1582 = _1580;
                bool _1584 = _1438 == 40;
                int _1586 = _1582;
                if (_1554)
                {
                    _1586 = _1322;
                }
                int _1588 = _1586;
                bool _1590 = _1438 == 44;
                int _1592 = _1588;
                if (_1560)
                {
                    _1574 = _1334;
                }
                int _1594 = _1574;
                bool _1596 = _1430 == 60;
                int _1598 = _1594;
                if (_1566)
                {
                    _1592 = _1324;
                }
                int _1600 = _1592;
                bool _1602 = _1438 == 48;
                int _1604 = _1600;
                if (_1572)
                {
                    _1598 = _1336;
                }
                int _1606 = _1598;
                bool _1608 = _1430 == 64;
                int _1610 = _1606;
                if (_1578)
                {
                    _1604 = _1326;
                }
                int _1612 = _1604;
                bool _1614 = _1438 == 52;
                int _1616 = _1612;
                if (_1584)
                {
                    _1616 = _1328;
                }
                int _1618 = _1616;
                int _1620 = _1618;
                if (_1590)
                {
                    _1620 = _1330;
                }
                int _1622 = _1620;
                bool _1624 = _1438 == 56;
                bool _1626 = _1438 == 60;
                int _1628 = _1622;
                if (_1596)
                {
                    _1610 = _1338;
                }
                int _1630 = _1610;
                bool _1632 = _1442 == 0;
                int _1634 = _1630;
                if (_1602)
                {
                    _1628 = _1332;
                }
                int _1636 = _1628;
                bool _1638 = _1430 == 68;
                int _1640 = _1636;
                if (_1608)
                {
                    _1634 = _1340;
                }
                int _1642 = _1634;
                bool _1644 = _1442 == 4;
                int _1646 = _1642;
                if (_1614)
                {
                    _1640 = _1334;
                }
                int _1648 = _1640;
                bool _1650 = _1442 == 8;
                int _1652 = _1648;
                if (_1624)
                {
                    _1652 = _1336;
                }
                int _1654 = _1652;
                bool _1656 = _1442 == 12;
                int _1658 = _1654;
                if (_1626)
                {
                    _1658 = _1338;
                }
                int _1660 = _1658;
                bool _1662 = _1442 == 16;
                int _1664 = _1660;
                if (_1632)
                {
                    _1458 = _1308;
                }
                int _1666 = _1458;
                bool _1668 = _1438 == 64;
                int _1670 = _1666;
                if (_1638)
                {
                    _1646 = _1342;
                }
                int _1672 = _1646;
                bool _1674 = _1442 == 20;
                int _1676 = _1672;
                if (_1644)
                {
                    _1670 = _1310;
                }
                int _1678 = _1670;
                bool _1680 = _1430 == 72;
                int _1682 = _1678;
                if (_1650)
                {
                    _1682 = _1312;
                }
                int _1684 = _1682;
                bool _1686 = _1442 == 24;
                int _1688 = _1684;
                if (_1656)
                {
                    _1688 = _1314;
                }
                int _1690 = _1688;
                bool _1692 = _1442 == 28;
                int _1694 = _1690;
                if (_1662)
                {
                    _1694 = _1316;
                }
                int _1696 = _1694;
                bool _1698 = _1442 == 32;
                int _1700 = _1696;
                if (_1668)
                {
                    _1664 = _1340;
                }
                int _1702 = _1664;
                bool _1704 = _1438 == 68;
                int _1706 = _1702;
                if (_1674)
                {
                    _1700 = _1318;
                }
                int _1708 = _1700;
                bool _1710 = _1442 == 36;
                int _1712 = _1708;
                if (_1680)
                {
                    _1676 = _1344;
                }
                int _1714 = _1676;
                bool _1716 = _1430 == 76;
                int _1718 = _1714;
                if (_1686)
                {
                    _1712 = _1320;
                }
                int _1720 = _1712;
                bool _1722 = _1442 == 40;
                int _1724 = _1720;
                if (_1692)
                {
                    _1724 = _1322;
                }
                int _1726 = _1724;
                bool _1728 = _1442 == 44;
                int _1730 = _1726;
                if (_1698)
                {
                    _1730 = _1324;
                }
                int _1732 = _1730;
                bool _1734 = _1442 == 48;
                int _1736 = _1732;
                if (_1704)
                {
                    _1706 = _1342;
                }
                int _1738 = _1706;
                bool _1740 = _1438 == 72;
                int _1742 = _1738;
                if (_1710)
                {
                    _1736 = _1326;
                }
                int _1744 = _1736;
                bool _1746 = _1442 == 52;
                int _1748 = _1744;
                if (_1716)
                {
                    _1718 = _1346;
                }
                int _1750 = _1718;
                bool _1752 = _1430 == 80;
                int _1754 = _1750;
                if (_1722)
                {
                    _1748 = _1328;
                }
                int _1756 = _1748;
                bool _1758 = _1442 == 56;
                int _1760 = _1756;
                if (_1728)
                {
                    _1760 = _1330;
                }
                int _1762 = _1760;
                bool _1764 = _1442 == 60;
                int _1766 = _1762;
                if (_1734)
                {
                    _1766 = _1332;
                }
                int _1768 = _1766;
                bool _1770 = _1438 == 76;
                int _1772 = _1768;
                if (_1740)
                {
                    _1742 = _1344;
                }
                int _1774 = _1742;
                bool _1776 = _1442 == 64;
                int _1778 = _1774;
                if (_1746)
                {
                    _1772 = _1334;
                }
                int _1780 = _1772;
                bool _1782 = _1430 == 84;
                int _1784 = _1780;
                if (_1752)
                {
                    _1754 = _1348;
                }
                int _1786 = _1754;
                bool _1788 = _1442 == 68;
                int _1790 = _1786;
                if (_1758)
                {
                    _1784 = _1336;
                }
                int _1792 = _1784;
                bool _1794 = _1442 == 72;
                int _1796 = _1792;
                if (_1764)
                {
                    _1796 = _1338;
                }
                int _1798 = _1796;
                bool _1800 = _1442 == 76;
                int _1802 = _1798;
                if (_1770)
                {
                    _1778 = _1346;
                }
                int _1804 = _1778;
                bool _1806 = _1438 == 80;
                int _1808 = _1804;
                if (_1776)
                {
                    _1802 = _1340;
                }
                int _1810 = _1802;
                bool _1812 = _1494 == 0;
                int _1814 = _1810;
                if (_1782)
                {
                    _1790 = _1350;
                }
                int _1816 = _1790;
                bool _1818 = _1494 == 4;
                int _1820 = _1816;
                if (_1788)
                {
                    _1814 = _1342;
                }
                int _1822 = _1814;
                bool _1824 = _1442 == 80;
                int _1826 = _1822;
                if (_1794)
                {
                    _1826 = _1344;
                }
                int _1828 = _1826;
                bool _1830 = _1494 == 8;
                int _1832 = _1828;
                if (_1800)
                {
                    _1832 = _1346;
                }
                int _1834 = _1832;
                bool _1836 = _1430 == 88;
                int _1838 = _1834;
                if (_1806)
                {
                    _1808 = _1348;
                }
                int _1840 = _1808;
                bool _1842 = _1438 == 84;
                int _1844 = _1840;
                if (_1812)
                {
                    _1460 = _1308;
                }
                int _1846 = _1460;
                bool _1848 = _1494 == 12;
                int _1850 = _1846;
                if (_1818)
                {
                    _1850 = _1310;
                }
                int _1852 = _1850;
                bool _1854 = _1442 == 84;
                int _1856 = _1852;
                if (_1824)
                {
                    _1838 = _1348;
                }
                int _1858 = _1838;
                bool _1860 = _1494 == 16;
                int _1862 = _1858;
                if (_1830)
                {
                    _1856 = _1312;
                }
                int _1864 = _1856;
                bool _1866 = _1430 == 92;
                int _1868 = _1864;
                if (_1836)
                {
                    _1820 = _1352;
                }
                int _1870 = _1820;
                bool _1872 = _1494 == 20;
                int _1874 = _1870;
                if (_1842)
                {
                    _1844 = _1350;
                }
                int _1876 = _1844;
                bool _1878 = _1494 == 24;
                int _1880 = _1876;
                if (_1848)
                {
                    _1868 = _1314;
                }
                int _1882 = _1868;
                bool _1884 = _1438 == 88;
                int _1886 = _1882;
                if (_1854)
                {
                    _1862 = _1350;
                }
                int _1888 = _1862;
                bool _1890 = _1442 == 88;
                int _1892 = _1888;
                if (_1860)
                {
                    _1886 = _1316;
                }
                int _1894 = _1886;
                bool _1896 = _1494 == 28;
                int _1898 = _1894;
                if (_1866)
                {
                    _1874 = _1354;
                }
                int _1900 = _1874;
                bool _1902 = _1494 == 32;
                int _1904 = _1900;
                if (_1872)
                {
                    _1898 = _1318;
                }
                int _1906 = _1898;
                bool _1908 = _1430 == 96;
                int _1910 = _1906;
                if (_1878)
                {
                    _1910 = _1320;
                }
                int _1912 = _1910;
                bool _1914 = _1494 == 36;
                int _1916 = _1912;
                if (_1884)
                {
                    _1880 = _1352;
                }
                int _1918 = _1880;
                bool _1920 = _1494 == 40;
                int _1922 = _1918;
                if (_1890)
                {
                    _1892 = _1352;
                }
                int _1924 = _1892;
                bool _1926 = _1438 == 92;
                int _1928 = _1924;
                if (_1896)
                {
                    _1916 = _1322;
                }
                int _1930 = _1916;
                bool _1932 = _1494 == 44;
                int _1934 = _1930;
                if (_1902)
                {
                    _1934 = _1324;
                }
                int _1936 = _1934;
                bool _1938 = _1494 == 48;
                int _1940 = _1936;
                if (_1908)
                {
                    _1904 = _1356;
                }
                int _1942 = _1904;
                bool _1944 = _1438 == 96;
                int _1946 = _1942;
                if (_1914)
                {
                    _1940 = _1326;
                }
                int _1948 = _1940;
                bool _1950 = _1494 == 52;
                int _1952 = _1948;
                if (_1920)
                {
                    _1952 = _1328;
                }
                int _1954 = _1952;
                bool _1956 = _1418 >= _1942;
                int _1958 = _1954;
                if (_1926)
                {
                    _1922 = _1354;
                }
                int _1960 = _1922;
                int _1962 = _1960;
                if (_1932)
                {
                    _1958 = _1330;
                }
                int _1964 = _1958;
                bool _1966 = _1494 == 56;
                bool _1968 = _1494 == 60;
                int _1970 = _1964;
                if (_1938)
                {
                    _1970 = _1332;
                }
                int _1972 = _1970;
                bool _1974 = _1494 == 64;
                int _1976 = _1972;
                if (_1944)
                {
                    _1962 = _1356;
                }
                int _1978 = _1962;
                bool _1980 = _1442 == 92;
                _1376 = _1978;
                if (_1950)
                {
                    _1976 = _1334;
                }
                int _1982 = _1976;
                bool _1984 = _1494 == 68;
                int _1986 = _1982;
                if (!_1956)
                {
                    _1462 = _1942;
                }
                int _1988 = _1462;
                int _1990 = _1988;
                if (_1966)
                {
                    _1986 = _1336;
                }
                int _1992 = _1986;
                bool _1994 = _1494 == 72;
                int _1996 = _1992;
                if (_1968)
                {
                    _1996 = _1338;
                }
                int _1998 = _1996;
                bool _2000 = _1988 >= _1978;
                int _2002 = _1998;
                if (_1974)
                {
                    _2002 = _1340;
                }
                int _2004 = _2002;
                bool _2006 = _1442 == 96;
                int _2008 = _2004;
                if (_1980)
                {
                    _1928 = _1354;
                }
                int _2010 = _1928;
                bool _2012 = _1494 == 76;
                int _2014 = _2010;
                if (_1984)
                {
                    _2008 = _1342;
                }
                int _2016 = _2008;
                bool _2018 = _1494 == 80;
                int _2020 = _2016;
                if (_1994)
                {
                    _2020 = _1344;
                }
                int _2022 = _2020;
                bool _2024 = _1494 == 84;
                int _2026 = _2022;
                if (_2000)
                {
                    _1946 = _1988;
                }
                int _2028 = _1946;
                int _2030 = _2028;
                if (_2006)
                {
                    _2014 = _1356;
                }
                int _2032 = _2014;
                bool _2034 = _1494 == 88;
                _1378 = _2032;
                if (!_2000)
                {
                    _2030 = _1978;
                }
                int _2036 = _2030;
                int _2038 = _2036;
                if (_2012)
                {
                    _2026 = _1346;
                }
                int _2040 = _2026;
                bool _2042 = _1494 == 92;
                int _2044 = _2040;
                if (_2018)
                {
                    _2044 = _1348;
                }
                int _2046 = _2044;
                bool _2048 = _2036 >= _2032;
                int _2050 = _2046;
                if (_1956)
                {
                    _1990 = _1426;
                }
                int _2052 = _1990;
                int _2054 = _2052;
                if (_2024)
                {
                    _2050 = _1350;
                }
                int _2056 = _2050;
                bool _2058 = _1494 == 96;
                int _2060 = _2056;
                if (!_1956)
                {
                    _2054 = _1416;
                }
                int _2062 = _2054;
                int _2064 = _1416 + 4;
                _1398 = _2064;
                int _2066 = _2062;
                _1404 = _2064;
                if (_2034)
                {
                    _2060 = _1352;
                }
                int _2068 = _2060;
                int _2070 = _2068;
                if (!_2000)
                {
                    _2066 = _1432;
                }
                int _2072 = _2066;
                bool _2074 = _2064 >= _1412;
                int _2076 = _2072;
                if (_2042)
                {
                    _2070 = _1354;
                }
                int _2078 = _2070;
                int _2080 = _2078;
                if (!_2048)
                {
                    _2038 = _2032;
                }
                int _2082 = _2038;
                _1374 = _2082;
                _1382 = _2082;
                if (!_2048)
                {
                    _2076 = _1434;
                }
                int _2084 = _2076;
                int _2086 = _2084;
                if (_2058)
                {
                    _2080 = _1356;
                }
                int _2088 = _2080;
                bool _2090 = _2082 >= _2088;
                _1380 = _2088;
                if (_2090)
                {
                    _1464 = _2084;
                }
                int _2092 = _1464;
                int _2094 = _2092;
                if (_2090)
                {
                    _2086 = _2082;
                }
                int _2096 = _2086;
                int _2098 = _2096;
                if (!_2090)
                {
                    _2098 = _2088;
                }
                int _2100 = _2098;
                _1400 = _2100;
                _1406 = _2100;
                if (!_2090)
                {
                    _2094 = _1452;
                }
                int _2102 = _2094;
                _1414 = !_2074;
                _1402 = _2102;
                _1410 = _2102;
            } while (_1414);
        }
        int _2104 = _1404;
        int _2106 = _1406;
        int _2108 = _1382;
        int _2110 = _1408;
        int _2112 = _1410;
        int _2114 = -_2104;
        int _2116 = _1360 + _2114;
        bool _2118 = _2116 > 1;
        bool _2120 = !_2118;
        int _2122 = _2108;
        int _2124 = _2116;
        int _2126 = _2106;
        int _2128 = _2112;
        int _2130 = _2104;
        int _2132 = _2110;
        int _2134 = _2106;
        int _2136 = _2112;
        if (!_2120)
        {
            int _2138 = _2104 * 4;
            int _2140 = _2104 + 1;
            bool _2142 = _2138 == 0;
            int _2144 = _2140 * 4;
            bool _2146 = _2138 == 4;
            bool _2148 = _2138 == 8;
            bool _2150 = _2138 == 12;
            bool _2152 = _2138 == 24;
            bool _2154 = _2144 == 0;
            bool _2156 = _2138 == 40;
            if (_2142)
            {
                _2122 = _1308;
            }
            int _2158 = _2122;
            bool _2160 = _2138 == 16;
            int _2162 = _2158;
            if (_2146)
            {
                _2162 = _1310;
            }
            int _2164 = _2162;
            bool _2166 = _2138 == 20;
            int _2168 = _2164;
            if (_2148)
            {
                _2168 = _1312;
            }
            int _2170 = _2168;
            bool _2172 = _2138 == 36;
            int _2174 = _2170;
            if (_2150)
            {
                _2174 = _1314;
            }
            int _2176 = _2174;
            bool _2178 = _2138 == 28;
            int _2180 = _2176;
            if (_2154)
            {
                _2124 = _1308;
            }
            int _2182 = _2124;
            bool _2184 = _2144 == 16;
            int _2186 = _2182;
            if (_2160)
            {
                _2180 = _1316;
            }
            int _2188 = _2180;
            bool _2190 = _2138 == 32;
            int _2192 = _2188;
            if (_2166)
            {
                _2192 = _1318;
            }
            int _2194 = _2192;
            bool _2196 = _2138 == 48;
            int _2198 = _2194;
            if (_2152)
            {
                _2198 = _1320;
            }
            int _2200 = _2198;
            bool _2202 = _2144 == 4;
            int _2204 = _2200;
            if (_2178)
            {
                _2204 = _1322;
            }
            int _2206 = _2204;
            bool _2208 = _2138 == 44;
            int _2210 = _2206;
            if (_2190)
            {
                _2210 = _1324;
            }
            int _2212 = _2210;
            bool _2214 = _2144 == 8;
            int _2216 = _2212;
            if (_2172)
            {
                _2216 = _1326;
            }
            int _2218 = _2216;
            bool _2220 = _2144 == 12;
            int _2222 = _2218;
            if (_2202)
            {
                _2186 = _1310;
            }
            int _2224 = _2186;
            bool _2226 = _2138 == 52;
            int _2228 = _2224;
            if (_2156)
            {
                _2222 = _1328;
            }
            int _2230 = _2222;
            bool _2232 = _2144 == 20;
            int _2234 = _2230;
            if (_2208)
            {
                _2234 = _1330;
            }
            int _2236 = _2234;
            bool _2238 = _2144 == 24;
            int _2240 = _2236;
            if (_2196)
            {
                _2240 = _1332;
            }
            int _2242 = _2240;
            bool _2244 = _2138 == 60;
            int _2246 = _2242;
            if (_2214)
            {
                _2228 = _1312;
            }
            int _2248 = _2228;
            bool _2250 = _2138 == 56;
            int _2252 = _2248;
            if (_2220)
            {
                _2252 = _1314;
            }
            int _2254 = _2252;
            bool _2256 = _2144 == 28;
            int _2258 = _2254;
            if (_2184)
            {
                _2258 = _1316;
            }
            int _2260 = _2258;
            bool _2262 = _2144 == 32;
            int _2264 = _2260;
            if (_2232)
            {
                _2264 = _1318;
            }
            int _2266 = _2264;
            bool _2268 = _2144 == 36;
            int _2270 = _2266;
            if (_2226)
            {
                _2246 = _1334;
            }
            int _2272 = _2246;
            bool _2274 = _2138 == 64;
            int _2276 = _2272;
            if (_2238)
            {
                _2270 = _1320;
            }
            int _2278 = _2270;
            bool _2280 = _2138 == 68;
            int _2282 = _2278;
            if (_2250)
            {
                _2276 = _1336;
            }
            int _2284 = _2276;
            bool _2286 = _2144 == 40;
            int _2288 = _2284;
            if (_2256)
            {
                _2282 = _1322;
            }
            int _2290 = _2282;
            bool _2292 = _2138 == 72;
            int _2294 = _2290;
            if (_2244)
            {
                _2288 = _1338;
            }
            int _2296 = _2288;
            bool _2298 = _2144 == 44;
            int _2300 = _2296;
            if (_2262)
            {
                _2294 = _1324;
            }
            int _2302 = _2294;
            int _2304 = _2302;
            if (_2268)
            {
                _2304 = _1326;
            }
            int _2306 = _2304;
            int _2308 = _2306;
            if (_2274)
            {
                _2300 = _1340;
            }
            int _2310 = _2300;
            bool _2312 = _2138 == 76;
            int _2314 = _2310;
            if (_2280)
            {
                _2314 = _1342;
            }
            int _2316 = _2314;
            bool _2318 = _2138 == 80;
            bool _2320 = _2144 == 48;
            int _2322 = _2316;
            if (_2286)
            {
                _2308 = _1328;
            }
            int _2324 = _2308;
            bool _2326 = _2144 == 52;
            int _2328 = _2324;
            if (_2292)
            {
                _2322 = _1344;
            }
            int _2330 = _2322;
            bool _2332 = _2138 == 84;
            int _2334 = _2330;
            if (_2298)
            {
                _2328 = _1330;
            }
            int _2336 = _2328;
            bool _2338 = _2144 == 56;
            bool _2340 = _2144 == 60;
            int _2342 = _2336;
            if (_2312)
            {
                _2334 = _1346;
            }
            int _2344 = _2334;
            bool _2346 = _2138 == 88;
            int _2348 = _2344;
            if (_2318)
            {
                _2348 = _1348;
            }
            int _2350 = _2348;
            bool _2352 = _2138 == 92;
            int _2354 = _2350;
            if (_2320)
            {
                _2342 = _1332;
            }
            int _2356 = _2342;
            bool _2358 = _2144 == 64;
            int _2360 = _2356;
            if (_2326)
            {
                _2360 = _1334;
            }
            int _2362 = _2360;
            bool _2364 = _2144 == 68;
            int _2366 = _2362;
            if (_2332)
            {
                _2354 = _1350;
            }
            int _2368 = _2354;
            bool _2370 = _2138 == 96;
            int _2372 = _2368;
            if (_2338)
            {
                _2366 = _1336;
            }
            int _2374 = _2366;
            bool _2376 = _2144 == 72;
            int _2378 = _2374;
            if (_2340)
            {
                _2378 = _1338;
            }
            int _2380 = _2378;
            bool _2382 = _2144 == 76;
            int _2384 = _2380;
            if (_2346)
            {
                _2372 = _1352;
            }
            int _2386 = _2372;
            int _2388 = _2386;
            if (_2352)
            {
                _2388 = _1354;
            }
            int _2390 = _2388;
            bool _2392 = _2144 == 96;
            int _2394 = _2390;
            if (_2358)
            {
                _2384 = _1340;
            }
            int _2396 = _2384;
            bool _2398 = _2144 == 80;
            int _2400 = _2396;
            if (_2364)
            {
                _2400 = _1342;
            }
            int _2402 = _2400;
            bool _2404 = _2144 == 84;
            int _2406 = _2402;
            if (_2370)
            {
                _2394 = _1356;
            }
            int _2408 = _2394;
            bool _2410 = _2144 == 92;
            if (_2376)
            {
                _2406 = _1344;
            }
            int _2412 = _2406;
            bool _2414 = _2144 == 88;
            int _2416 = _2412;
            if (_2382)
            {
                _2416 = _1346;
            }
            int _2418 = _2416;
            bool _2420 = _2106 >= _2408;
            int _2422 = _2418;
            if (_2398)
            {
                _2422 = _1348;
            }
            int _2424 = _2422;
            int _2426 = _2424;
            if (_2404)
            {
                _2426 = _1350;
            }
            int _2428 = _2426;
            int _2430 = _2428;
            if (_2414)
            {
                _2430 = _1352;
            }
            int _2432 = _2430;
            int _2434 = _2432;
            _2132 = 0;
            if (_2410)
            {
                _2434 = _1354;
            }
            int _2436 = _2434;
            int _2438 = _2436;
            if (_2392)
            {
                _2438 = _1356;
            }
            int _2440 = _2438;
            if (!_2420)
            {
                _2126 = _2408;
            }
            int _2442 = _2126;
            _2134 = _2442;
            if (!_2420)
            {
                _2128 = _2104;
            }
            int _2444 = _2128;
            int _2446 = _2140 + 1;
            bool _2448 = _2442 >= _2440;
            int _2450 = _2444;
            _2130 = _2446;
            if (!_2448)
            {
                _2450 = _2140;
            }
            int _2452 = _2450;
            _2136 = _2452;
            if (!_2448)
            {
                _2134 = _2440;
            }
        }
        int _2454 = _2130;
        int _2456 = _2132;
        int _2458 = _2134;
        int _2460 = _2136;
        bool _2462 = _2454 < _1360;
        int _2464 = (_2462 ? (-1) : 0) | _2456;
        int _2466 = ~_2464;
        int _2468 = _2460;
        if (!(_2466 != 0))
        {
            int _2470 = _2454 << 2;
            bool _2472 = _2470 == 4;
            bool _2474 = _2470 == 8;
            bool _2476 = _2470 == 12;
            bool _2478 = _2470 == 16;
            if (_2472)
            {
                _1384 = _1310;
            }
            int _2480 = _1384;
            bool _2482 = _2470 == 20;
            int _2484 = _2480;
            if (_2474)
            {
                _2484 = _1312;
            }
            int _2486 = _2484;
            bool _2488 = _2470 == 24;
            int _2490 = _2486;
            if (_2476)
            {
                _2490 = _1314;
            }
            int _2492 = _2490;
            bool _2494 = _2470 == 28;
            int _2496 = _2492;
            if (_2478)
            {
                _2496 = _1316;
            }
            int _2498 = _2496;
            bool _2500 = _2470 == 32;
            int _2502 = _2498;
            if (_2482)
            {
                _2502 = _1318;
            }
            int _2504 = _2502;
            bool _2506 = _2470 == 36;
            int _2508 = _2504;
            if (_2488)
            {
                _2508 = _1320;
            }
            int _2510 = _2508;
            bool _2512 = _2470 == 40;
            int _2514 = _2510;
            if (_2494)
            {
                _2514 = _1322;
            }
            int _2516 = _2514;
            bool _2518 = _2470 == 44;
            int _2520 = _2516;
            if (_2500)
            {
                _2520 = _1324;
            }
            int _2522 = _2520;
            bool _2524 = _2470 == 48;
            int _2526 = _2522;
            if (_2506)
            {
                _2526 = _1326;
            }
            int _2528 = _2526;
            bool _2530 = _2470 == 52;
            int _2532 = _2528;
            if (_2512)
            {
                _2532 = _1328;
            }
            int _2534 = _2532;
            bool _2536 = _2470 == 56;
            int _2538 = _2534;
            if (_2518)
            {
                _2538 = _1330;
            }
            int _2540 = _2538;
            bool _2542 = _2470 == 60;
            int _2544 = _2540;
            if (_2524)
            {
                _2544 = _1332;
            }
            int _2546 = _2544;
            bool _2548 = _2470 == 64;
            int _2550 = _2546;
            if (_2530)
            {
                _2550 = _1334;
            }
            int _2552 = _2550;
            bool _2554 = _2470 == 68;
            int _2556 = _2552;
            if (_2536)
            {
                _2556 = _1336;
            }
            int _2558 = _2556;
            bool _2560 = _2470 == 72;
            int _2562 = _2558;
            if (_2542)
            {
                _2562 = _1338;
            }
            int _2564 = _2562;
            bool _2566 = _2470 == 76;
            int _2568 = _2564;
            if (_2548)
            {
                _2568 = _1340;
            }
            int _2570 = _2568;
            bool _2572 = _2470 == 80;
            int _2574 = _2570;
            if (_2554)
            {
                _2574 = _1342;
            }
            int _2576 = _2574;
            bool _2578 = _2470 == 84;
            int _2580 = _2576;
            if (_2560)
            {
                _2580 = _1344;
            }
            int _2582 = _2580;
            bool _2584 = _2470 == 88;
            int _2586 = _2582;
            if (_2566)
            {
                _2586 = _1346;
            }
            int _2588 = _2586;
            bool _2590 = _2470 == 92;
            int _2592 = _2588;
            if (_2572)
            {
                _2592 = _1348;
            }
            int _2594 = _2592;
            bool _2596 = _2470 == 96;
            int _2598 = _2594;
            if (_2578)
            {
                _2598 = _1350;
            }
            int _2600 = _2598;
            int _2602 = _2600;
            if (_2584)
            {
                _2602 = _1352;
            }
            int _2604 = _2602;
            int _2606 = _2604;
            if (_2590)
            {
                _2606 = _1354;
            }
            int _2608 = _2606;
            int _2610 = _2608;
            if (_2596)
            {
                _2610 = _1356;
            }
            int _2612 = _2610;
            bool _2614 = _2458 >= _2612;
            if (!_2614)
            {
                _2468 = _2454;
            }
        }
        int _2616 = _2468;
        _1392 = _2616;
    }
    int _2618 = _1392;
    int _2620 = _2618 * 8;
    uint _2622 = uint(int(uint(_2620) >> uint(2)));
    float _2624 = as_type<float>(_31[int(_2622)]);
    int _2626 = _2620 + 4;
    uint _2628 = uint(int(uint(_2626) >> uint(2)));
    float _2630 = as_type<float>(_31[int(_2628)]);
    int _2632 = _71 + 16;
    int _2634 = _71 + 24;
    uint _2636 = uint(int(uint(_2632) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2636)] = as_type<uint>(_2624);
    int _2638 = _2632 + 4;
    uint _2640 = uint(int(uint(_2638) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2640)] = as_type<uint>(_2630);
    uint _2642 = uint(int(uint(_2634) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2642)] = as_type<uint>(_1358);
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
    bool _884 = false;
    bool _708 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _2663 = float2((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    float4 _57 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2663, float2(0.0), isnan(_2663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2663, float2(0.0), isnan(_2663)), level(0.0)).xyzw;
    float _60 = _57.x;
    float _62 = _57.y;
    float _64 = _57.z;
    float _66 = _57.w;
    float _68 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _71 = as_type<int>(_68) * 32;
    uint _74 = uint(int(uint(_71) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_74)] = as_type<uint>(_60);
    int _76 = _71 + 4;
    uint _78 = uint(int(uint(_76) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_78)] = as_type<uint>(_62);
    int _80 = _71 + 8;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_82)] = as_type<uint>(_64);
    int _84 = _71 + 12;
    uint _86 = uint(int(uint(_84) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_86)] = as_type<uint>(_66);
    int _88 = -2;
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
    int _140 = 0;
    float _142 = 1000000.0;
    bool _146;
    bool _288;
    float _670;
    int _672;
    int _674;
    int _676;
    bool _684;
    int _686;
    int _740;
    int _742;
    int _748;
    int _754;
    int _760;
    int _766;
    int _772;
    int _778;
    int _784;
    int _790;
    int _796;
    int _802;
    int _808;
    int _814;
    int _820;
    int _826;
    int _830;
    bool _834;
    int _836;
    int _842;
    int _848;
    int _854;
    int _860;
    int _864;
    int _868;
    int _872;
    int _876;
    int _880;
    int _882;
    int _1242;
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
    int _1344;
    int _1346;
    int _1348;
    int _1350;
    int _1352;
    int _1354;
    int _1356;
    float _1358;
    int _1360;
    int _1374;
    int _1376;
    int _1378;
    int _1380;
    int _1382;
    int _1384;
    do
    {
        int _148 = _88;
        int _150 = _90;
        int _152 = _92;
        int _154 = _94;
        int _156 = _96;
        int _158 = _98;
        int _160 = _100;
        int _162 = _102;
        int _164 = _104;
        int _166 = _106;
        int _168 = _108;
        int _170 = _110;
        int _172 = _112;
        int _174 = _114;
        int _176 = _116;
        int _178 = _118;
        int _180 = _120;
        int _182 = _122;
        int _184 = _124;
        int _186 = _126;
        int _188 = _128;
        int _190 = _130;
        int _192 = _132;
        int _194 = _134;
        int _196 = _136;
        int _198 = _138;
        int _200 = _140;
        float _202 = _142;
        float _204 = float(_148);
        float _206 = _204 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _208 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _210 = fma(_206, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2783 = float2(_208, _210);
        float4 _212 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2783, float2(0.0), isnan(_2783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2783, float2(0.0), isnan(_2783)), level(0.0)).xyzw;
        float _214 = _212.x;
        float _216 = _212.y;
        float _218 = _212.z;
        float _220 = _212.w;
        int _222 = -2;
        float _224 = _216;
        float _226 = _220;
        float _228 = _218;
        float _230 = _214;
        int _232 = -2;
        int _234 = _150;
        int _236 = _152;
        int _238 = _154;
        int _240 = _156;
        int _242 = _158;
        int _244 = _160;
        int _246 = _162;
        int _248 = _164;
        int _250 = _166;
        int _252 = _168;
        int _254 = _170;
        int _256 = _172;
        int _258 = _174;
        int _260 = _176;
        int _262 = _178;
        int _264 = _180;
        int _266 = _182;
        int _268 = _184;
        int _270 = _186;
        int _272 = _188;
        int _274 = _190;
        int _276 = _192;
        int _278 = _194;
        int _280 = _196;
        int _282 = _198;
        int _284 = _200;
        float _286 = _202;
        do
        {
            int _290 = _222;
            float _292 = _224;
            float _294 = _226;
            float _296 = _228;
            float _298 = _230;
            int _300 = _232;
            int _302 = _234;
            int _304 = _236;
            int _306 = _238;
            int _308 = _240;
            int _310 = _242;
            int _312 = _244;
            int _314 = _246;
            int _316 = _248;
            int _318 = _250;
            int _320 = _252;
            int _322 = _254;
            int _324 = _256;
            int _326 = _258;
            int _328 = _260;
            int _330 = _262;
            int _332 = _264;
            int _334 = _266;
            int _336 = _268;
            int _338 = _270;
            int _340 = _272;
            int _342 = _274;
            int _344 = _276;
            int _346 = _278;
            int _348 = _280;
            int _350 = _282;
            int _352 = _284;
            float _354 = _286;
            int _356 = _290 + 1;
            float _358 = float(_148);
            float _360 = 0.0 + _292;
            float _362 = precise::clamp(_360, 0.0, 1.0);
            float _364 = _358 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _366 = float(_356);
            float _368 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _370 = fma(_364, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _372 = 0.0 + _294;
            float _374 = precise::clamp(_372, 0.0, 1.0);
            float _376 = fma(_366, _368, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _378 = 0.0 + _296;
            float _380 = precise::clamp(_378, 0.0, 1.0);
            float _382 = 0.0 + _298;
            float _384 = precise::clamp(_382, 0.0, 1.0);
            float2 _2903 = float2(_376, _370);
            float4 _386 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2903, float2(0.0), isnan(_2903)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2903, float2(0.0), isnan(_2903)), level(0.0)).xyzw;
            float _388 = _386.x;
            float _390 = _386.y;
            float _392 = _386.z;
            float _394 = _386.w;
            float _396 = _374 * 65535.0;
            float _398 = _380 * 65535.0;
            float _400 = _362 * 65535.0;
            float _402 = _384 * 65535.0;
            float _404 = rint(_396);
            int _406 = int(_404);
            float _408 = rint(_398);
            int _410 = int(_408);
            float _412 = rint(_400);
            int _414 = int(_412);
            uint _416 = extract_bits(uint(_406), 0u, 8u);
            int _418 = int(_416) & 255;
            uint _420 = extract_bits(uint(_406), 8u, 8u);
            int _422 = int(_420) & 255;
            int _424 = _422 << 8;
            int _426 = _418 | _424;
            float _428 = rint(_402);
            int _430 = int(_428);
            uint _432 = extract_bits(uint(_426), 0u, 8u);
            int _434 = int(_432) & 255;
            uint _436 = extract_bits(uint(_426), 8u, 8u);
            int _438 = int(_436) & 255;
            int _440 = _438 << 8;
            int _442 = _434 | _440;
            uint _444 = extract_bits(uint(_410), 0u, 8u);
            int _446 = int(_444) & 255;
            int _448 = _446 << 16;
            int _450 = _442 | _448;
            uint _452 = extract_bits(uint(_410), 8u, 8u);
            int _454 = int(_452) & 255;
            int _456 = _454 << 24;
            int _458 = _450 | _456;
            float _460 = float(_300);
            bool _462 = _458 != 0;
            uint _464 = extract_bits(uint(_414), 0u, 8u);
            int _466 = int(_464) & 255;
            uint _468 = extract_bits(uint(_414), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 8;
            int _474 = _466 | _472;
            float _476 = fma(_460, _368, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _478 = extract_bits(uint(_474), 0u, 8u);
            int _480 = int(_478) & 255;
            uint _482 = extract_bits(uint(_474), 8u, 8u);
            int _484 = int(_482) & 255;
            int _486 = _484 << 8;
            int _488 = _480 | _486;
            uint _490 = extract_bits(uint(_430), 0u, 8u);
            int _492 = int(_490) & 255;
            int _494 = _492 << 16;
            int _496 = _488 | _494;
            uint _498 = extract_bits(uint(_430), 8u, 8u);
            int _500 = int(_498) & 255;
            int _502 = _500 << 24;
            int _504 = _496 | _502;
            bool _506 = _504 != 0;
            bool _508 = _506 || _462;
            bool _510 = !_508;
            _222 = _356;
            _224 = _390;
            _226 = _394;
            _228 = _392;
            _230 = _388;
            int _512 = _312;
            int _514 = _304;
            int _516 = _306;
            int _518 = _308;
            int _520 = _310;
            int _522 = _314;
            int _524 = _316;
            int _526 = _326;
            int _528 = _318;
            int _530 = _320;
            int _532 = _322;
            int _534 = _324;
            int _536 = _328;
            int _538 = _330;
            int _540 = _340;
            int _542 = _332;
            int _544 = _334;
            int _546 = _336;
            int _548 = _338;
            int _550 = _342;
            int _552 = _344;
            int _554 = _346;
            int _556 = _348;
            int _558 = _350;
            int _560 = _352;
            int _562 = _458;
            int _564 = _304;
            int _566 = _306;
            int _568 = _308;
            int _570 = _310;
            int _572 = _348;
            int _574 = _350;
            int _576 = _352;
            int _578 = _312;
            int _580 = _314;
            int _582 = _316;
            int _584 = _318;
            int _586 = _320;
            int _588 = _322;
            int _590 = _324;
            int _592 = _326;
            int _594 = _328;
            int _596 = _330;
            int _598 = _332;
            int _600 = _334;
            int _602 = _336;
            int _604 = _338;
            int _606 = _346;
            int _608 = _344;
            int _610 = _342;
            int _612 = _302;
            int _614 = _304;
            int _616 = _306;
            int _618 = _308;
            int _620 = _310;
            int _622 = _312;
            int _624 = _314;
            int _626 = _316;
            int _628 = _318;
            int _630 = _320;
            int _632 = _322;
            int _634 = _324;
            int _636 = _326;
            int _638 = _328;
            int _640 = _330;
            int _642 = _332;
            int _644 = _334;
            int _646 = _336;
            int _648 = _338;
            int _650 = _340;
            int _652 = _342;
            int _654 = _344;
            int _656 = _346;
            int _658 = _348;
            int _660 = _350;
            int _662 = _352;
            int _664 = _430;
            int _666 = _458;
            int _668 = as_type<int>(_460);
            _670 = _354;
            _672 = _504;
            _674 = _458;
            _676 = as_type<int>(_392);
            if (!_510)
            {
                bool _678 = _302 > 0;
                bool _680 = !_678;
                if (!_680)
                {
                    int _682 = 0;
                    do
                    {
                        _686 = _682;
                        int _688 = _686 * 8;
                        uint _690 = uint(int(uint(_688) >> uint(2)));
                        float _692 = as_type<float>(_31[int(_690)]);
                        int _694 = _688 + 4;
                        uint _696 = uint(int(uint(_694) >> uint(2)));
                        float _698 = as_type<float>(_31[int(_696)]);
                        bool _700 = as_type<int>(_692) != _458;
                        bool _702 = as_type<int>(_698) != _504;
                        bool _704 = _702 || _700;
                        bool _706 = !_704;
                        _708 = _706;
                        if (_708)
                        {
                            break;
                        }
                        int _710 = _686 + 1;
                        bool _712 = _710 >= _302;
                        _684 = !_712;
                        _682 = _710;
                    } while (_684);
                }
                if (!_708)
                {
                    int _714 = _302 * 4;
                    int _716 = _302 * 8;
                    int _718 = _302 + 1;
                    bool _720 = _714 == 16;
                    bool _722 = _714 == 0;
                    uint _724 = uint(int(uint(_716) >> uint(2)));
                    _31[int(_724)] = uint(_458);
                    int _726 = _716 + 4;
                    uint _728 = uint(int(uint(_726) >> uint(2)));
                    _31[int(_728)] = uint(_504);
                    bool _730 = _714 == 4;
                    bool _732 = _714 == 8;
                    bool _734 = _714 == 12;
                    bool _736 = _714 == 20;
                    bool _738 = _714 == 24;
                    _612 = _718;
                    _664 = _716;
                    _668 = _714;
                    _740 = _716;
                    _742 = _714;
                    if (_720)
                    {
                        _512 = 1;
                    }
                    int _744 = _512;
                    bool _746 = _714 == 44;
                    _622 = _744;
                    _748 = _744;
                    if (_722)
                    {
                        _514 = 1;
                    }
                    int _750 = _514;
                    bool _752 = _714 == 28;
                    _614 = _750;
                    _754 = _750;
                    if (_730)
                    {
                        _516 = 1;
                    }
                    int _756 = _516;
                    bool _758 = _714 == 32;
                    _616 = _756;
                    _760 = _756;
                    if (_732)
                    {
                        _518 = 1;
                    }
                    int _762 = _518;
                    bool _764 = _714 == 36;
                    _618 = _762;
                    _766 = _762;
                    if (_734)
                    {
                        _520 = 1;
                    }
                    int _768 = _520;
                    bool _770 = _714 == 40;
                    _620 = _768;
                    _772 = _768;
                    if (_736)
                    {
                        _522 = 1;
                    }
                    int _774 = _522;
                    bool _776 = _714 == 48;
                    _624 = _774;
                    _778 = _774;
                    if (_738)
                    {
                        _524 = 1;
                    }
                    int _780 = _524;
                    bool _782 = _714 == 52;
                    _626 = _780;
                    _784 = _780;
                    if (_746)
                    {
                        _526 = 1;
                    }
                    int _786 = _526;
                    bool _788 = _714 == 72;
                    _636 = _786;
                    _790 = _786;
                    if (_752)
                    {
                        _528 = 1;
                    }
                    int _792 = _528;
                    bool _794 = _714 == 56;
                    _628 = _792;
                    _796 = _792;
                    if (_758)
                    {
                        _530 = 1;
                    }
                    int _798 = _530;
                    bool _800 = _714 == 60;
                    _630 = _798;
                    _802 = _798;
                    if (_764)
                    {
                        _532 = 1;
                    }
                    int _804 = _532;
                    bool _806 = _714 == 64;
                    _632 = _804;
                    _808 = _804;
                    if (_770)
                    {
                        _534 = 1;
                    }
                    int _810 = _534;
                    bool _812 = _714 == 68;
                    _634 = _810;
                    _814 = _810;
                    if (_776)
                    {
                        _536 = 1;
                    }
                    int _816 = _536;
                    bool _818 = _714 == 76;
                    _638 = _816;
                    _820 = _816;
                    if (_782)
                    {
                        _538 = 1;
                    }
                    int _822 = _538;
                    bool _824 = _714 == 80;
                    _640 = _822;
                    _826 = _822;
                    if (_788)
                    {
                        _540 = 1;
                    }
                    int _828 = _540;
                    _650 = _828;
                    _830 = _828;
                    if (_794)
                    {
                        _542 = 1;
                    }
                    int _832 = _542;
                    _834 = _718 != 25;
                    _642 = _832;
                    _836 = _832;
                    if (_800)
                    {
                        _544 = 1;
                    }
                    int _838 = _544;
                    bool _840 = _714 == 84;
                    _644 = _838;
                    _842 = _838;
                    if (_806)
                    {
                        _546 = 1;
                    }
                    int _844 = _546;
                    bool _846 = _714 == 88;
                    _646 = _844;
                    _848 = _844;
                    if (_812)
                    {
                        _548 = 1;
                    }
                    int _850 = _548;
                    bool _852 = _714 == 92;
                    _648 = _850;
                    _854 = _850;
                    if (_818)
                    {
                        _550 = 1;
                    }
                    int _856 = _550;
                    bool _858 = _714 == 96;
                    _652 = _856;
                    _860 = _856;
                    if (_824)
                    {
                        _552 = 1;
                    }
                    int _862 = _552;
                    _654 = _862;
                    _864 = _862;
                    if (_840)
                    {
                        _554 = 1;
                    }
                    int _866 = _554;
                    _656 = _866;
                    _868 = _866;
                    if (_846)
                    {
                        _556 = 1;
                    }
                    int _870 = _556;
                    _658 = _870;
                    _872 = _870;
                    if (_852)
                    {
                        _558 = 1;
                    }
                    int _874 = _558;
                    _660 = _874;
                    _876 = _874;
                    if (_858)
                    {
                        _560 = 1;
                    }
                    int _878 = _560;
                    _662 = _878;
                    _880 = _878;
                }
                if ((!_834) || _708)
                {
                    if (!_708)
                    {
                        _882 = 25;
                        _884 = true;
                        if (_884)
                        {
                            break;
                        }
                    }
                    _708 = false;
                    int _886 = _686 * 4;
                    bool _888 = _886 == 0;
                    bool _890 = _886 == 4;
                    bool _892 = _886 == 8;
                    bool _894 = _886 == 12;
                    bool _896 = _886 == 88;
                    bool _898 = _886 == 92;
                    bool _900 = _886 == 96;
                    if (_888)
                    {
                        _562 = _304;
                    }
                    int _902 = _562;
                    bool _904 = _886 == 16;
                    int _906 = _902;
                    if (_890)
                    {
                        _906 = _306;
                    }
                    int _908 = _906;
                    bool _910 = _886 == 20;
                    int _912 = _908;
                    if (_892)
                    {
                        _912 = _308;
                    }
                    int _914 = _912;
                    bool _916 = _886 == 24;
                    int _918 = _914;
                    if (_894)
                    {
                        _918 = _310;
                    }
                    int _920 = _918;
                    bool _922 = _886 == 84;
                    int _924 = int(_916);
                    int _926 = _910 ? 2 : 0;
                    int _928 = _924 | _926;
                    int _930 = _904 ? 4 : 0;
                    int _932 = _928 | _930;
                    int _934 = _922 ? 8 : 0;
                    int _936 = _932 | _934;
                    int _938 = _896 ? 16 : 0;
                    int _940 = _936 | _938;
                    int _942 = _898 ? 32 : 0;
                    int _944 = _940 | _942;
                    int _946 = _900 ? 64 : 0;
                    int _948 = _944 | _946;
                    int _950 = _948 & 8;
                    int _952 = _920;
                    if (_904)
                    {
                        _952 = _312;
                    }
                    int _954 = _952;
                    bool _956 = _886 == 80;
                    int _958 = _954;
                    if (_910)
                    {
                        _958 = _314;
                    }
                    int _960 = _958;
                    bool _962 = _886 == 76;
                    int _964 = _960;
                    if (_916)
                    {
                        _964 = _316;
                    }
                    int _966 = _964;
                    bool _968 = _886 == 28;
                    int _970 = int(_968);
                    int _972 = _962 ? 2 : 0;
                    int _974 = _970 | _972;
                    int _976 = _956 ? 4 : 0;
                    int _978 = _974 | _976;
                    int _980 = _922 ? 8 : 0;
                    int _982 = _978 | _980;
                    int _984 = _896 ? 16 : 0;
                    int _986 = _982 | _984;
                    int _988 = _898 ? 32 : 0;
                    int _990 = _986 | _988;
                    int _992 = _900 ? 64 : 0;
                    int _994 = _990 | _992;
                    int _996 = _994 & 2;
                    int _998 = int(_968);
                    int _1000 = _962 ? 2 : 0;
                    int _1002 = _998 | _1000;
                    int _1004 = _956 ? 4 : 0;
                    int _1006 = _1002 | _1004;
                    int _1008 = _922 ? 8 : 0;
                    int _1010 = _1006 | _1008;
                    int _1012 = _896 ? 16 : 0;
                    int _1014 = _1010 | _1012;
                    int _1016 = _898 ? 32 : 0;
                    int _1018 = _1014 | _1016;
                    int _1020 = _900 ? 64 : 0;
                    int _1022 = _1018 | _1020;
                    int _1024 = _1022 & 4;
                    int _1026 = _966;
                    _664 = _996;
                    _668 = _1024;
                    if (_968)
                    {
                        _1026 = _318;
                    }
                    int _1028 = _1026;
                    bool _1030 = _886 == 32;
                    int _1032 = _1028;
                    if (_1030)
                    {
                        _1032 = _320;
                    }
                    int _1034 = _1032;
                    bool _1036 = _886 == 36;
                    int _1038 = _1034;
                    if (_1036)
                    {
                        _1038 = _322;
                    }
                    int _1040 = _1038;
                    bool _1042 = _886 == 40;
                    int _1044 = _1040;
                    if (_1042)
                    {
                        _1044 = _324;
                    }
                    int _1046 = _1044;
                    bool _1048 = _886 == 44;
                    int _1050 = _1046;
                    if (_1048)
                    {
                        _1050 = _326;
                    }
                    int _1052 = _1050;
                    bool _1054 = _886 == 48;
                    int _1056 = _1052;
                    if (_1054)
                    {
                        _1056 = _328;
                    }
                    int _1058 = _1056;
                    bool _1060 = _886 == 52;
                    int _1062 = _1058;
                    if (_1060)
                    {
                        _1062 = _330;
                    }
                    int _1064 = _1062;
                    bool _1066 = _886 == 56;
                    int _1068 = _1064;
                    if (_1066)
                    {
                        _1068 = _332;
                    }
                    int _1070 = _1068;
                    bool _1072 = _886 == 60;
                    int _1074 = _1070;
                    if (_1072)
                    {
                        _1074 = _334;
                    }
                    int _1076 = _1074;
                    bool _1078 = _886 == 64;
                    int _1080 = _1076;
                    if (_1078)
                    {
                        _1080 = _336;
                    }
                    int _1082 = _1080;
                    bool _1084 = _886 == 68;
                    int _1086 = _1082;
                    if (_1084)
                    {
                        _1086 = _338;
                    }
                    int _1088 = _1086;
                    bool _1090 = _886 == 72;
                    int _1092 = int(_1090);
                    int _1094 = _962 ? 2 : 0;
                    int _1096 = _1092 | _1094;
                    int _1098 = _956 ? 4 : 0;
                    int _1100 = _1096 | _1098;
                    int _1102 = _922 ? 8 : 0;
                    int _1104 = _1100 | _1102;
                    int _1106 = _896 ? 16 : 0;
                    int _1108 = _1104 | _1106;
                    int _1110 = _898 ? 32 : 0;
                    int _1112 = _1108 | _1110;
                    int _1114 = _900 ? 64 : 0;
                    int _1116 = _1112 | _1114;
                    int _1118 = _1116 & 1;
                    int _1120 = _1088;
                    if (_1090)
                    {
                        _1120 = _340;
                    }
                    int _1122 = _1120;
                    bool _1124 = _886 == 4;
                    int _1126 = _1122;
                    if (_962)
                    {
                        _1126 = _342;
                    }
                    int _1128 = _1126;
                    bool _1130 = _886 == 0;
                    int _1132 = _1128;
                    if (_956)
                    {
                        _1132 = _344;
                    }
                    int _1134 = _1132;
                    int _1136 = _1134;
                    if (_922)
                    {
                        _1136 = _346;
                    }
                    int _1138 = _1136;
                    int _1140 = _1138;
                    if (_896)
                    {
                        _1140 = _348;
                    }
                    int _1142 = _1140;
                    bool _1144 = _886 == 8;
                    int _1146 = _1142;
                    if (_898)
                    {
                        _1146 = _350;
                    }
                    int _1148 = _1146;
                    bool _1150 = _886 == 12;
                    int _1152 = _1148;
                    if (_900)
                    {
                        _1152 = _352;
                    }
                    int _1154 = _1152;
                    int _1156 = _1154 + 1;
                    _666 = _1156;
                    if (_1130)
                    {
                        _564 = _1156;
                    }
                    int _1158 = _564;
                    bool _1160 = _886 == 16;
                    _614 = _1158;
                    if (_1124)
                    {
                        _566 = _1156;
                    }
                    int _1162 = _566;
                    bool _1164 = _886 == 20;
                    _616 = _1162;
                    if (_1144)
                    {
                        _568 = _1156;
                    }
                    int _1166 = _568;
                    bool _1168 = _886 == 24;
                    _618 = _1166;
                    if (_1150)
                    {
                        _570 = _1156;
                    }
                    int _1170 = _570;
                    bool _1172 = _886 == 28;
                    _620 = _1170;
                    if (_896)
                    {
                        _572 = _1156;
                    }
                    int _1174 = _572;
                    _658 = _1174;
                    if (_898)
                    {
                        _574 = _1156;
                    }
                    int _1176 = _574;
                    _660 = _1176;
                    if (_900)
                    {
                        _576 = _1156;
                    }
                    int _1178 = _576;
                    _662 = _1178;
                    if (_1160)
                    {
                        _578 = _1156;
                    }
                    int _1180 = _578;
                    bool _1182 = _886 == 32;
                    _622 = _1180;
                    if (_1164)
                    {
                        _580 = _1156;
                    }
                    int _1184 = _580;
                    bool _1186 = _886 == 36;
                    _624 = _1184;
                    if (_1168)
                    {
                        _582 = _1156;
                    }
                    int _1188 = _582;
                    bool _1190 = _886 == 40;
                    _626 = _1188;
                    if (_1172)
                    {
                        _584 = _1156;
                    }
                    int _1192 = _584;
                    bool _1194 = _886 == 44;
                    _628 = _1192;
                    if (_1182)
                    {
                        _586 = _1156;
                    }
                    int _1196 = _586;
                    bool _1198 = _886 == 48;
                    _630 = _1196;
                    if (_1186)
                    {
                        _588 = _1156;
                    }
                    int _1200 = _588;
                    bool _1202 = _886 == 52;
                    _632 = _1200;
                    if (_1190)
                    {
                        _590 = _1156;
                    }
                    int _1204 = _590;
                    bool _1206 = _886 == 56;
                    _634 = _1204;
                    if (_1194)
                    {
                        _592 = _1156;
                    }
                    int _1208 = _592;
                    bool _1210 = _886 == 60;
                    _636 = _1208;
                    if (_1198)
                    {
                        _594 = _1156;
                    }
                    int _1212 = _594;
                    bool _1214 = _886 == 64;
                    _638 = _1212;
                    if (_1202)
                    {
                        _596 = _1156;
                    }
                    int _1216 = _596;
                    bool _1218 = _886 == 68;
                    _640 = _1216;
                    if (_1206)
                    {
                        _598 = _1156;
                    }
                    int _1220 = _598;
                    bool _1222 = _950 != 0;
                    _642 = _1220;
                    if (_1210)
                    {
                        _600 = _1156;
                    }
                    int _1224 = _600;
                    bool _1226 = _1024 != 0;
                    _644 = _1224;
                    if (_1214)
                    {
                        _602 = _1156;
                    }
                    int _1228 = _602;
                    bool _1230 = _996 != 0;
                    _646 = _1228;
                    if (_1218)
                    {
                        _604 = _1156;
                    }
                    int _1232 = _604;
                    bool _1234 = _1118 != 0;
                    _648 = _1232;
                    if (_1222)
                    {
                        _606 = _1156;
                    }
                    int _1236 = _606;
                    _656 = _1236;
                    if (_1226)
                    {
                        _608 = _1156;
                    }
                    int _1238 = _608;
                    _654 = _1238;
                    if (_1230)
                    {
                        _610 = _1156;
                    }
                    int _1240 = _610;
                    _652 = _1240;
                    if (_1234)
                    {
                        _650 = _1156;
                    }
                }
            }
            _1242 = _612;
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
            int _1288 = _658;
            int _1290 = _660;
            int _1292 = _662;
            int _1294 = _664;
            int _1296 = _666;
            int _1298 = _668;
            float2 _4060 = float2(_476, _370);
            float _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4060, float2(0.0), isnan(_4060)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4060, float2(0.0), isnan(_4060)), level(0.0)).x;
            int _1302 = _300 + 1;
            bool _1304 = _1302 >= 3;
            float _1306 = precise::min(_1300, _354);
            _288 = !_1304;
            _232 = _1302;
            _234 = _1242;
            _236 = _1244;
            _238 = _1246;
            _240 = _1248;
            _242 = _1250;
            _244 = _1252;
            _246 = _1254;
            _248 = _1256;
            _250 = _1258;
            _252 = _1260;
            _254 = _1262;
            _256 = _1264;
            _258 = _1266;
            _260 = _1268;
            _262 = _1270;
            _264 = _1272;
            _266 = _1274;
            _268 = _1276;
            _270 = _1278;
            _272 = _1280;
            _274 = _1282;
            _276 = _1284;
            _278 = _1286;
            _280 = _1288;
            _282 = _1290;
            _284 = _1292;
            _286 = _1306;
            _754 = _1244;
            _760 = _1246;
            _766 = _1248;
            _772 = _1250;
            _748 = _1252;
            _778 = _1254;
            _784 = _1256;
            _796 = _1258;
            _802 = _1260;
            _808 = _1262;
            _814 = _1264;
            _790 = _1266;
            _820 = _1268;
            _826 = _1270;
            _836 = _1272;
            _842 = _1274;
            _848 = _1276;
            _854 = _1278;
            _830 = _1280;
            _860 = _1282;
            _864 = _1284;
            _868 = _1286;
            _872 = _1288;
            _876 = _1290;
            _880 = _1292;
            _670 = _1306;
            _672 = as_type<int>(_1300);
            _740 = _1294;
            _674 = _1296;
            _742 = _1298;
        } while (_288);
        if (!_884)
        {
            _882 = _1242;
        }
        _884 = false;
        _1308 = _754;
        _1310 = _760;
        _1312 = _766;
        _1314 = _772;
        _1316 = _748;
        _1318 = _778;
        _1320 = _784;
        _1322 = _796;
        _1324 = _802;
        _1326 = _808;
        _1328 = _814;
        _1330 = _790;
        _1332 = _820;
        _1334 = _826;
        _1336 = _836;
        _1338 = _842;
        _1340 = _848;
        _1342 = _854;
        _1344 = _830;
        _1346 = _860;
        _1348 = _864;
        _1350 = _868;
        _1352 = _872;
        _1354 = _876;
        _1356 = _880;
        _1358 = _670;
        _1360 = _882;
        int _1362 = _672;
        int _1364 = _740;
        int _1366 = _674;
        int _1368 = _742;
        int _1370 = _148 + 1;
        bool _1372 = _1370 >= 3;
        _146 = !_1372;
        _88 = _1370;
        _90 = _1360;
        _92 = _1308;
        _94 = _1310;
        _96 = _1312;
        _98 = _1314;
        _100 = _1316;
        _102 = _1318;
        _104 = _1320;
        _106 = _1322;
        _108 = _1324;
        _110 = _1326;
        _112 = _1328;
        _114 = _1330;
        _116 = _1332;
        _118 = _1334;
        _120 = _1336;
        _122 = _1338;
        _124 = _1340;
        _126 = _1342;
        _128 = _1344;
        _130 = _1346;
        _132 = _1348;
        _134 = _1350;
        _136 = _1352;
        _138 = _1354;
        _140 = _1356;
        _142 = _1358;
        _1374 = _1362;
        _1376 = _1364;
        _1378 = _1366;
        _1380 = _1368;
        _1382 = _1362;
        _1384 = _1308;
    } while (_146);
    bool _1386 = _1360 > 0;
    if (!_1386)
    {
        _676 = 0;
    }
    int _1388 = _676;
    bool _1390 = !_1386;
    int _1392 = _1388;
    if (!_1390)
    {
        bool _1394 = _1360 > 3;
        bool _1396 = !_1394;
        int _1398 = 0;
        int _1400 = 0;
        int _1402 = 0;
        int _1404 = 0;
        int _1406 = 0;
        int _1408 = -1;
        int _1410 = 0;
        if (!_1396)
        {
            int _1412 = _1360 + (-3);
            _1408 = 0;
            bool _1414;
            do
            {
                int _1416 = _1398;
                int _1418 = _1400;
                int _1420 = _1374;
                int _1422 = _1376;
                int _1424 = _1378;
                int _1426 = _1402;
                int _1428 = _1380;
                int _1430 = _1416 * 4;
                int _1432 = _1416 + 1;
                int _1434 = _1416 + 2;
                bool _1436 = _1430 == 0;
                int _1438 = _1432 * 4;
                bool _1440 = _1430 == 4;
                int _1442 = _1434 * 4;
                bool _1444 = _1430 == 8;
                bool _1446 = _1430 == 12;
                bool _1448 = _1430 == 16;
                bool _1450 = _1438 == 8;
                int _1452 = _1416 + 3;
                int _1454 = _1420;
                int _1456 = _1422;
                int _1458 = _1424;
                int _1460 = _1428;
                int _1462 = _1418;
                int _1464 = _1426;
                if (_1436)
                {
                    _1454 = _1308;
                }
                int _1466 = _1454;
                bool _1468 = _1430 == 24;
                int _1470 = _1466;
                if (_1440)
                {
                    _1470 = _1310;
                }
                int _1472 = _1470;
                bool _1474 = _1430 == 20;
                int _1476 = _1472;
                if (_1444)
                {
                    _1476 = _1312;
                }
                int _1478 = _1476;
                bool _1480 = _1430 == 32;
                int _1482 = _1478;
                if (_1446)
                {
                    _1482 = _1314;
                }
                int _1484 = _1482;
                bool _1486 = _1430 == 28;
                int _1488 = _1484;
                if (_1448)
                {
                    _1488 = _1316;
                }
                int _1490 = _1488;
                bool _1492 = _1430 == 40;
                int _1494 = _1452 * 4;
                int _1496 = _1490;
                if (_1474)
                {
                    _1496 = _1318;
                }
                int _1498 = _1496;
                bool _1500 = _1430 == 36;
                int _1502 = _1498;
                if (_1468)
                {
                    _1502 = _1320;
                }
                int _1504 = _1502;
                bool _1506 = _1438 == 0;
                int _1508 = _1504;
                if (_1486)
                {
                    _1508 = _1322;
                }
                int _1510 = _1508;
                bool _1512 = _1438 == 4;
                int _1514 = _1510;
                if (_1480)
                {
                    _1514 = _1324;
                }
                int _1516 = _1514;
                bool _1518 = _1438 == 12;
                int _1520 = _1516;
                if (_1500)
                {
                    _1520 = _1326;
                }
                int _1522 = _1520;
                bool _1524 = _1430 == 44;
                int _1526 = _1522;
                if (_1492)
                {
                    _1526 = _1328;
                }
                int _1528 = _1526;
                bool _1530 = _1438 == 16;
                int _1532 = _1528;
                if (_1506)
                {
                    _1456 = _1308;
                }
                int _1534 = _1456;
                bool _1536 = _1430 == 48;
                int _1538 = _1534;
                if (_1512)
                {
                    _1538 = _1310;
                }
                int _1540 = _1538;
                bool _1542 = _1438 == 20;
                int _1544 = _1540;
                if (_1450)
                {
                    _1544 = _1312;
                }
                int _1546 = _1544;
                bool _1548 = _1438 == 24;
                int _1550 = _1546;
                if (_1518)
                {
                    _1550 = _1314;
                }
                int _1552 = _1550;
                bool _1554 = _1438 == 28;
                int _1556 = _1552;
                if (_1524)
                {
                    _1532 = _1330;
                }
                int _1558 = _1532;
                bool _1560 = _1430 == 52;
                int _1562 = _1558;
                if (_1530)
                {
                    _1556 = _1316;
                }
                int _1564 = _1556;
                bool _1566 = _1438 == 32;
                int _1568 = _1564;
                if (_1536)
                {
                    _1562 = _1332;
                }
                int _1570 = _1562;
                bool _1572 = _1430 == 56;
                int _1574 = _1570;
                if (_1542)
                {
                    _1568 = _1318;
                }
                int _1576 = _1568;
                bool _1578 = _1438 == 36;
                int _1580 = _1576;
                if (_1548)
                {
                    _1580 = _1320;
                }
                int _1582 = _1580;
                bool _1584 = _1438 == 40;
                int _1586 = _1582;
                if (_1554)
                {
                    _1586 = _1322;
                }
                int _1588 = _1586;
                bool _1590 = _1438 == 44;
                int _1592 = _1588;
                if (_1560)
                {
                    _1574 = _1334;
                }
                int _1594 = _1574;
                bool _1596 = _1430 == 60;
                int _1598 = _1594;
                if (_1566)
                {
                    _1592 = _1324;
                }
                int _1600 = _1592;
                bool _1602 = _1438 == 48;
                int _1604 = _1600;
                if (_1572)
                {
                    _1598 = _1336;
                }
                int _1606 = _1598;
                bool _1608 = _1430 == 64;
                int _1610 = _1606;
                if (_1578)
                {
                    _1604 = _1326;
                }
                int _1612 = _1604;
                bool _1614 = _1438 == 52;
                int _1616 = _1612;
                if (_1584)
                {
                    _1616 = _1328;
                }
                int _1618 = _1616;
                int _1620 = _1618;
                if (_1590)
                {
                    _1620 = _1330;
                }
                int _1622 = _1620;
                bool _1624 = _1438 == 56;
                bool _1626 = _1438 == 60;
                int _1628 = _1622;
                if (_1596)
                {
                    _1610 = _1338;
                }
                int _1630 = _1610;
                bool _1632 = _1442 == 0;
                int _1634 = _1630;
                if (_1602)
                {
                    _1628 = _1332;
                }
                int _1636 = _1628;
                bool _1638 = _1430 == 68;
                int _1640 = _1636;
                if (_1608)
                {
                    _1634 = _1340;
                }
                int _1642 = _1634;
                bool _1644 = _1442 == 4;
                int _1646 = _1642;
                if (_1614)
                {
                    _1640 = _1334;
                }
                int _1648 = _1640;
                bool _1650 = _1442 == 8;
                int _1652 = _1648;
                if (_1624)
                {
                    _1652 = _1336;
                }
                int _1654 = _1652;
                bool _1656 = _1442 == 12;
                int _1658 = _1654;
                if (_1626)
                {
                    _1658 = _1338;
                }
                int _1660 = _1658;
                bool _1662 = _1442 == 16;
                int _1664 = _1660;
                if (_1632)
                {
                    _1458 = _1308;
                }
                int _1666 = _1458;
                bool _1668 = _1438 == 64;
                int _1670 = _1666;
                if (_1638)
                {
                    _1646 = _1342;
                }
                int _1672 = _1646;
                bool _1674 = _1442 == 20;
                int _1676 = _1672;
                if (_1644)
                {
                    _1670 = _1310;
                }
                int _1678 = _1670;
                bool _1680 = _1430 == 72;
                int _1682 = _1678;
                if (_1650)
                {
                    _1682 = _1312;
                }
                int _1684 = _1682;
                bool _1686 = _1442 == 24;
                int _1688 = _1684;
                if (_1656)
                {
                    _1688 = _1314;
                }
                int _1690 = _1688;
                bool _1692 = _1442 == 28;
                int _1694 = _1690;
                if (_1662)
                {
                    _1694 = _1316;
                }
                int _1696 = _1694;
                bool _1698 = _1442 == 32;
                int _1700 = _1696;
                if (_1668)
                {
                    _1664 = _1340;
                }
                int _1702 = _1664;
                bool _1704 = _1438 == 68;
                int _1706 = _1702;
                if (_1674)
                {
                    _1700 = _1318;
                }
                int _1708 = _1700;
                bool _1710 = _1442 == 36;
                int _1712 = _1708;
                if (_1680)
                {
                    _1676 = _1344;
                }
                int _1714 = _1676;
                bool _1716 = _1430 == 76;
                int _1718 = _1714;
                if (_1686)
                {
                    _1712 = _1320;
                }
                int _1720 = _1712;
                bool _1722 = _1442 == 40;
                int _1724 = _1720;
                if (_1692)
                {
                    _1724 = _1322;
                }
                int _1726 = _1724;
                bool _1728 = _1442 == 44;
                int _1730 = _1726;
                if (_1698)
                {
                    _1730 = _1324;
                }
                int _1732 = _1730;
                bool _1734 = _1442 == 48;
                int _1736 = _1732;
                if (_1704)
                {
                    _1706 = _1342;
                }
                int _1738 = _1706;
                bool _1740 = _1438 == 72;
                int _1742 = _1738;
                if (_1710)
                {
                    _1736 = _1326;
                }
                int _1744 = _1736;
                bool _1746 = _1442 == 52;
                int _1748 = _1744;
                if (_1716)
                {
                    _1718 = _1346;
                }
                int _1750 = _1718;
                bool _1752 = _1430 == 80;
                int _1754 = _1750;
                if (_1722)
                {
                    _1748 = _1328;
                }
                int _1756 = _1748;
                bool _1758 = _1442 == 56;
                int _1760 = _1756;
                if (_1728)
                {
                    _1760 = _1330;
                }
                int _1762 = _1760;
                bool _1764 = _1442 == 60;
                int _1766 = _1762;
                if (_1734)
                {
                    _1766 = _1332;
                }
                int _1768 = _1766;
                bool _1770 = _1438 == 76;
                int _1772 = _1768;
                if (_1740)
                {
                    _1742 = _1344;
                }
                int _1774 = _1742;
                bool _1776 = _1442 == 64;
                int _1778 = _1774;
                if (_1746)
                {
                    _1772 = _1334;
                }
                int _1780 = _1772;
                bool _1782 = _1430 == 84;
                int _1784 = _1780;
                if (_1752)
                {
                    _1754 = _1348;
                }
                int _1786 = _1754;
                bool _1788 = _1442 == 68;
                int _1790 = _1786;
                if (_1758)
                {
                    _1784 = _1336;
                }
                int _1792 = _1784;
                bool _1794 = _1442 == 72;
                int _1796 = _1792;
                if (_1764)
                {
                    _1796 = _1338;
                }
                int _1798 = _1796;
                bool _1800 = _1442 == 76;
                int _1802 = _1798;
                if (_1770)
                {
                    _1778 = _1346;
                }
                int _1804 = _1778;
                bool _1806 = _1438 == 80;
                int _1808 = _1804;
                if (_1776)
                {
                    _1802 = _1340;
                }
                int _1810 = _1802;
                bool _1812 = _1494 == 0;
                int _1814 = _1810;
                if (_1782)
                {
                    _1790 = _1350;
                }
                int _1816 = _1790;
                bool _1818 = _1494 == 4;
                int _1820 = _1816;
                if (_1788)
                {
                    _1814 = _1342;
                }
                int _1822 = _1814;
                bool _1824 = _1442 == 80;
                int _1826 = _1822;
                if (_1794)
                {
                    _1826 = _1344;
                }
                int _1828 = _1826;
                bool _1830 = _1494 == 8;
                int _1832 = _1828;
                if (_1800)
                {
                    _1832 = _1346;
                }
                int _1834 = _1832;
                bool _1836 = _1430 == 88;
                int _1838 = _1834;
                if (_1806)
                {
                    _1808 = _1348;
                }
                int _1840 = _1808;
                bool _1842 = _1438 == 84;
                int _1844 = _1840;
                if (_1812)
                {
                    _1460 = _1308;
                }
                int _1846 = _1460;
                bool _1848 = _1494 == 12;
                int _1850 = _1846;
                if (_1818)
                {
                    _1850 = _1310;
                }
                int _1852 = _1850;
                bool _1854 = _1442 == 84;
                int _1856 = _1852;
                if (_1824)
                {
                    _1838 = _1348;
                }
                int _1858 = _1838;
                bool _1860 = _1494 == 16;
                int _1862 = _1858;
                if (_1830)
                {
                    _1856 = _1312;
                }
                int _1864 = _1856;
                bool _1866 = _1430 == 92;
                int _1868 = _1864;
                if (_1836)
                {
                    _1820 = _1352;
                }
                int _1870 = _1820;
                bool _1872 = _1494 == 20;
                int _1874 = _1870;
                if (_1842)
                {
                    _1844 = _1350;
                }
                int _1876 = _1844;
                bool _1878 = _1494 == 24;
                int _1880 = _1876;
                if (_1848)
                {
                    _1868 = _1314;
                }
                int _1882 = _1868;
                bool _1884 = _1438 == 88;
                int _1886 = _1882;
                if (_1854)
                {
                    _1862 = _1350;
                }
                int _1888 = _1862;
                bool _1890 = _1442 == 88;
                int _1892 = _1888;
                if (_1860)
                {
                    _1886 = _1316;
                }
                int _1894 = _1886;
                bool _1896 = _1494 == 28;
                int _1898 = _1894;
                if (_1866)
                {
                    _1874 = _1354;
                }
                int _1900 = _1874;
                bool _1902 = _1494 == 32;
                int _1904 = _1900;
                if (_1872)
                {
                    _1898 = _1318;
                }
                int _1906 = _1898;
                bool _1908 = _1430 == 96;
                int _1910 = _1906;
                if (_1878)
                {
                    _1910 = _1320;
                }
                int _1912 = _1910;
                bool _1914 = _1494 == 36;
                int _1916 = _1912;
                if (_1884)
                {
                    _1880 = _1352;
                }
                int _1918 = _1880;
                bool _1920 = _1494 == 40;
                int _1922 = _1918;
                if (_1890)
                {
                    _1892 = _1352;
                }
                int _1924 = _1892;
                bool _1926 = _1438 == 92;
                int _1928 = _1924;
                if (_1896)
                {
                    _1916 = _1322;
                }
                int _1930 = _1916;
                bool _1932 = _1494 == 44;
                int _1934 = _1930;
                if (_1902)
                {
                    _1934 = _1324;
                }
                int _1936 = _1934;
                bool _1938 = _1494 == 48;
                int _1940 = _1936;
                if (_1908)
                {
                    _1904 = _1356;
                }
                int _1942 = _1904;
                bool _1944 = _1438 == 96;
                int _1946 = _1942;
                if (_1914)
                {
                    _1940 = _1326;
                }
                int _1948 = _1940;
                bool _1950 = _1494 == 52;
                int _1952 = _1948;
                if (_1920)
                {
                    _1952 = _1328;
                }
                int _1954 = _1952;
                bool _1956 = _1418 >= _1942;
                int _1958 = _1954;
                if (_1926)
                {
                    _1922 = _1354;
                }
                int _1960 = _1922;
                int _1962 = _1960;
                if (_1932)
                {
                    _1958 = _1330;
                }
                int _1964 = _1958;
                bool _1966 = _1494 == 56;
                bool _1968 = _1494 == 60;
                int _1970 = _1964;
                if (_1938)
                {
                    _1970 = _1332;
                }
                int _1972 = _1970;
                bool _1974 = _1494 == 64;
                int _1976 = _1972;
                if (_1944)
                {
                    _1962 = _1356;
                }
                int _1978 = _1962;
                bool _1980 = _1442 == 92;
                _1376 = _1978;
                if (_1950)
                {
                    _1976 = _1334;
                }
                int _1982 = _1976;
                bool _1984 = _1494 == 68;
                int _1986 = _1982;
                if (!_1956)
                {
                    _1462 = _1942;
                }
                int _1988 = _1462;
                int _1990 = _1988;
                if (_1966)
                {
                    _1986 = _1336;
                }
                int _1992 = _1986;
                bool _1994 = _1494 == 72;
                int _1996 = _1992;
                if (_1968)
                {
                    _1996 = _1338;
                }
                int _1998 = _1996;
                bool _2000 = _1988 >= _1978;
                int _2002 = _1998;
                if (_1974)
                {
                    _2002 = _1340;
                }
                int _2004 = _2002;
                bool _2006 = _1442 == 96;
                int _2008 = _2004;
                if (_1980)
                {
                    _1928 = _1354;
                }
                int _2010 = _1928;
                bool _2012 = _1494 == 76;
                int _2014 = _2010;
                if (_1984)
                {
                    _2008 = _1342;
                }
                int _2016 = _2008;
                bool _2018 = _1494 == 80;
                int _2020 = _2016;
                if (_1994)
                {
                    _2020 = _1344;
                }
                int _2022 = _2020;
                bool _2024 = _1494 == 84;
                int _2026 = _2022;
                if (_2000)
                {
                    _1946 = _1988;
                }
                int _2028 = _1946;
                int _2030 = _2028;
                if (_2006)
                {
                    _2014 = _1356;
                }
                int _2032 = _2014;
                bool _2034 = _1494 == 88;
                _1378 = _2032;
                if (!_2000)
                {
                    _2030 = _1978;
                }
                int _2036 = _2030;
                int _2038 = _2036;
                if (_2012)
                {
                    _2026 = _1346;
                }
                int _2040 = _2026;
                bool _2042 = _1494 == 92;
                int _2044 = _2040;
                if (_2018)
                {
                    _2044 = _1348;
                }
                int _2046 = _2044;
                bool _2048 = _2036 >= _2032;
                int _2050 = _2046;
                if (_1956)
                {
                    _1990 = _1426;
                }
                int _2052 = _1990;
                int _2054 = _2052;
                if (_2024)
                {
                    _2050 = _1350;
                }
                int _2056 = _2050;
                bool _2058 = _1494 == 96;
                int _2060 = _2056;
                if (!_1956)
                {
                    _2054 = _1416;
                }
                int _2062 = _2054;
                int _2064 = _1416 + 4;
                _1398 = _2064;
                int _2066 = _2062;
                _1404 = _2064;
                if (_2034)
                {
                    _2060 = _1352;
                }
                int _2068 = _2060;
                int _2070 = _2068;
                if (!_2000)
                {
                    _2066 = _1432;
                }
                int _2072 = _2066;
                bool _2074 = _2064 >= _1412;
                int _2076 = _2072;
                if (_2042)
                {
                    _2070 = _1354;
                }
                int _2078 = _2070;
                int _2080 = _2078;
                if (!_2048)
                {
                    _2038 = _2032;
                }
                int _2082 = _2038;
                _1374 = _2082;
                _1382 = _2082;
                if (!_2048)
                {
                    _2076 = _1434;
                }
                int _2084 = _2076;
                int _2086 = _2084;
                if (_2058)
                {
                    _2080 = _1356;
                }
                int _2088 = _2080;
                bool _2090 = _2082 >= _2088;
                _1380 = _2088;
                if (_2090)
                {
                    _1464 = _2084;
                }
                int _2092 = _1464;
                int _2094 = _2092;
                if (_2090)
                {
                    _2086 = _2082;
                }
                int _2096 = _2086;
                int _2098 = _2096;
                if (!_2090)
                {
                    _2098 = _2088;
                }
                int _2100 = _2098;
                _1400 = _2100;
                _1406 = _2100;
                if (!_2090)
                {
                    _2094 = _1452;
                }
                int _2102 = _2094;
                _1414 = !_2074;
                _1402 = _2102;
                _1410 = _2102;
            } while (_1414);
        }
        int _2104 = _1404;
        int _2106 = _1406;
        int _2108 = _1382;
        int _2110 = _1408;
        int _2112 = _1410;
        int _2114 = -_2104;
        int _2116 = _1360 + _2114;
        bool _2118 = _2116 > 1;
        bool _2120 = !_2118;
        int _2122 = _2108;
        int _2124 = _2116;
        int _2126 = _2106;
        int _2128 = _2112;
        int _2130 = _2104;
        int _2132 = _2110;
        int _2134 = _2106;
        int _2136 = _2112;
        if (!_2120)
        {
            int _2138 = _2104 * 4;
            int _2140 = _2104 + 1;
            bool _2142 = _2138 == 0;
            int _2144 = _2140 * 4;
            bool _2146 = _2138 == 4;
            bool _2148 = _2138 == 8;
            bool _2150 = _2138 == 12;
            bool _2152 = _2138 == 24;
            bool _2154 = _2144 == 0;
            bool _2156 = _2138 == 40;
            if (_2142)
            {
                _2122 = _1308;
            }
            int _2158 = _2122;
            bool _2160 = _2138 == 16;
            int _2162 = _2158;
            if (_2146)
            {
                _2162 = _1310;
            }
            int _2164 = _2162;
            bool _2166 = _2138 == 20;
            int _2168 = _2164;
            if (_2148)
            {
                _2168 = _1312;
            }
            int _2170 = _2168;
            bool _2172 = _2138 == 36;
            int _2174 = _2170;
            if (_2150)
            {
                _2174 = _1314;
            }
            int _2176 = _2174;
            bool _2178 = _2138 == 28;
            int _2180 = _2176;
            if (_2154)
            {
                _2124 = _1308;
            }
            int _2182 = _2124;
            bool _2184 = _2144 == 16;
            int _2186 = _2182;
            if (_2160)
            {
                _2180 = _1316;
            }
            int _2188 = _2180;
            bool _2190 = _2138 == 32;
            int _2192 = _2188;
            if (_2166)
            {
                _2192 = _1318;
            }
            int _2194 = _2192;
            bool _2196 = _2138 == 48;
            int _2198 = _2194;
            if (_2152)
            {
                _2198 = _1320;
            }
            int _2200 = _2198;
            bool _2202 = _2144 == 4;
            int _2204 = _2200;
            if (_2178)
            {
                _2204 = _1322;
            }
            int _2206 = _2204;
            bool _2208 = _2138 == 44;
            int _2210 = _2206;
            if (_2190)
            {
                _2210 = _1324;
            }
            int _2212 = _2210;
            bool _2214 = _2144 == 8;
            int _2216 = _2212;
            if (_2172)
            {
                _2216 = _1326;
            }
            int _2218 = _2216;
            bool _2220 = _2144 == 12;
            int _2222 = _2218;
            if (_2202)
            {
                _2186 = _1310;
            }
            int _2224 = _2186;
            bool _2226 = _2138 == 52;
            int _2228 = _2224;
            if (_2156)
            {
                _2222 = _1328;
            }
            int _2230 = _2222;
            bool _2232 = _2144 == 20;
            int _2234 = _2230;
            if (_2208)
            {
                _2234 = _1330;
            }
            int _2236 = _2234;
            bool _2238 = _2144 == 24;
            int _2240 = _2236;
            if (_2196)
            {
                _2240 = _1332;
            }
            int _2242 = _2240;
            bool _2244 = _2138 == 60;
            int _2246 = _2242;
            if (_2214)
            {
                _2228 = _1312;
            }
            int _2248 = _2228;
            bool _2250 = _2138 == 56;
            int _2252 = _2248;
            if (_2220)
            {
                _2252 = _1314;
            }
            int _2254 = _2252;
            bool _2256 = _2144 == 28;
            int _2258 = _2254;
            if (_2184)
            {
                _2258 = _1316;
            }
            int _2260 = _2258;
            bool _2262 = _2144 == 32;
            int _2264 = _2260;
            if (_2232)
            {
                _2264 = _1318;
            }
            int _2266 = _2264;
            bool _2268 = _2144 == 36;
            int _2270 = _2266;
            if (_2226)
            {
                _2246 = _1334;
            }
            int _2272 = _2246;
            bool _2274 = _2138 == 64;
            int _2276 = _2272;
            if (_2238)
            {
                _2270 = _1320;
            }
            int _2278 = _2270;
            bool _2280 = _2138 == 68;
            int _2282 = _2278;
            if (_2250)
            {
                _2276 = _1336;
            }
            int _2284 = _2276;
            bool _2286 = _2144 == 40;
            int _2288 = _2284;
            if (_2256)
            {
                _2282 = _1322;
            }
            int _2290 = _2282;
            bool _2292 = _2138 == 72;
            int _2294 = _2290;
            if (_2244)
            {
                _2288 = _1338;
            }
            int _2296 = _2288;
            bool _2298 = _2144 == 44;
            int _2300 = _2296;
            if (_2262)
            {
                _2294 = _1324;
            }
            int _2302 = _2294;
            int _2304 = _2302;
            if (_2268)
            {
                _2304 = _1326;
            }
            int _2306 = _2304;
            int _2308 = _2306;
            if (_2274)
            {
                _2300 = _1340;
            }
            int _2310 = _2300;
            bool _2312 = _2138 == 76;
            int _2314 = _2310;
            if (_2280)
            {
                _2314 = _1342;
            }
            int _2316 = _2314;
            bool _2318 = _2138 == 80;
            bool _2320 = _2144 == 48;
            int _2322 = _2316;
            if (_2286)
            {
                _2308 = _1328;
            }
            int _2324 = _2308;
            bool _2326 = _2144 == 52;
            int _2328 = _2324;
            if (_2292)
            {
                _2322 = _1344;
            }
            int _2330 = _2322;
            bool _2332 = _2138 == 84;
            int _2334 = _2330;
            if (_2298)
            {
                _2328 = _1330;
            }
            int _2336 = _2328;
            bool _2338 = _2144 == 56;
            bool _2340 = _2144 == 60;
            int _2342 = _2336;
            if (_2312)
            {
                _2334 = _1346;
            }
            int _2344 = _2334;
            bool _2346 = _2138 == 88;
            int _2348 = _2344;
            if (_2318)
            {
                _2348 = _1348;
            }
            int _2350 = _2348;
            bool _2352 = _2138 == 92;
            int _2354 = _2350;
            if (_2320)
            {
                _2342 = _1332;
            }
            int _2356 = _2342;
            bool _2358 = _2144 == 64;
            int _2360 = _2356;
            if (_2326)
            {
                _2360 = _1334;
            }
            int _2362 = _2360;
            bool _2364 = _2144 == 68;
            int _2366 = _2362;
            if (_2332)
            {
                _2354 = _1350;
            }
            int _2368 = _2354;
            bool _2370 = _2138 == 96;
            int _2372 = _2368;
            if (_2338)
            {
                _2366 = _1336;
            }
            int _2374 = _2366;
            bool _2376 = _2144 == 72;
            int _2378 = _2374;
            if (_2340)
            {
                _2378 = _1338;
            }
            int _2380 = _2378;
            bool _2382 = _2144 == 76;
            int _2384 = _2380;
            if (_2346)
            {
                _2372 = _1352;
            }
            int _2386 = _2372;
            int _2388 = _2386;
            if (_2352)
            {
                _2388 = _1354;
            }
            int _2390 = _2388;
            bool _2392 = _2144 == 96;
            int _2394 = _2390;
            if (_2358)
            {
                _2384 = _1340;
            }
            int _2396 = _2384;
            bool _2398 = _2144 == 80;
            int _2400 = _2396;
            if (_2364)
            {
                _2400 = _1342;
            }
            int _2402 = _2400;
            bool _2404 = _2144 == 84;
            int _2406 = _2402;
            if (_2370)
            {
                _2394 = _1356;
            }
            int _2408 = _2394;
            bool _2410 = _2144 == 92;
            if (_2376)
            {
                _2406 = _1344;
            }
            int _2412 = _2406;
            bool _2414 = _2144 == 88;
            int _2416 = _2412;
            if (_2382)
            {
                _2416 = _1346;
            }
            int _2418 = _2416;
            bool _2420 = _2106 >= _2408;
            int _2422 = _2418;
            if (_2398)
            {
                _2422 = _1348;
            }
            int _2424 = _2422;
            int _2426 = _2424;
            if (_2404)
            {
                _2426 = _1350;
            }
            int _2428 = _2426;
            int _2430 = _2428;
            if (_2414)
            {
                _2430 = _1352;
            }
            int _2432 = _2430;
            int _2434 = _2432;
            _2132 = 0;
            if (_2410)
            {
                _2434 = _1354;
            }
            int _2436 = _2434;
            int _2438 = _2436;
            if (_2392)
            {
                _2438 = _1356;
            }
            int _2440 = _2438;
            if (!_2420)
            {
                _2126 = _2408;
            }
            int _2442 = _2126;
            _2134 = _2442;
            if (!_2420)
            {
                _2128 = _2104;
            }
            int _2444 = _2128;
            int _2446 = _2140 + 1;
            bool _2448 = _2442 >= _2440;
            int _2450 = _2444;
            _2130 = _2446;
            if (!_2448)
            {
                _2450 = _2140;
            }
            int _2452 = _2450;
            _2136 = _2452;
            if (!_2448)
            {
                _2134 = _2440;
            }
        }
        int _2454 = _2130;
        int _2456 = _2132;
        int _2458 = _2134;
        int _2460 = _2136;
        bool _2462 = _2454 < _1360;
        int _2464 = (_2462 ? (-1) : 0) | _2456;
        int _2466 = ~_2464;
        int _2468 = _2460;
        if (!(_2466 != 0))
        {
            int _2470 = _2454 << 2;
            bool _2472 = _2470 == 4;
            bool _2474 = _2470 == 8;
            bool _2476 = _2470 == 12;
            bool _2478 = _2470 == 16;
            if (_2472)
            {
                _1384 = _1310;
            }
            int _2480 = _1384;
            bool _2482 = _2470 == 20;
            int _2484 = _2480;
            if (_2474)
            {
                _2484 = _1312;
            }
            int _2486 = _2484;
            bool _2488 = _2470 == 24;
            int _2490 = _2486;
            if (_2476)
            {
                _2490 = _1314;
            }
            int _2492 = _2490;
            bool _2494 = _2470 == 28;
            int _2496 = _2492;
            if (_2478)
            {
                _2496 = _1316;
            }
            int _2498 = _2496;
            bool _2500 = _2470 == 32;
            int _2502 = _2498;
            if (_2482)
            {
                _2502 = _1318;
            }
            int _2504 = _2502;
            bool _2506 = _2470 == 36;
            int _2508 = _2504;
            if (_2488)
            {
                _2508 = _1320;
            }
            int _2510 = _2508;
            bool _2512 = _2470 == 40;
            int _2514 = _2510;
            if (_2494)
            {
                _2514 = _1322;
            }
            int _2516 = _2514;
            bool _2518 = _2470 == 44;
            int _2520 = _2516;
            if (_2500)
            {
                _2520 = _1324;
            }
            int _2522 = _2520;
            bool _2524 = _2470 == 48;
            int _2526 = _2522;
            if (_2506)
            {
                _2526 = _1326;
            }
            int _2528 = _2526;
            bool _2530 = _2470 == 52;
            int _2532 = _2528;
            if (_2512)
            {
                _2532 = _1328;
            }
            int _2534 = _2532;
            bool _2536 = _2470 == 56;
            int _2538 = _2534;
            if (_2518)
            {
                _2538 = _1330;
            }
            int _2540 = _2538;
            bool _2542 = _2470 == 60;
            int _2544 = _2540;
            if (_2524)
            {
                _2544 = _1332;
            }
            int _2546 = _2544;
            bool _2548 = _2470 == 64;
            int _2550 = _2546;
            if (_2530)
            {
                _2550 = _1334;
            }
            int _2552 = _2550;
            bool _2554 = _2470 == 68;
            int _2556 = _2552;
            if (_2536)
            {
                _2556 = _1336;
            }
            int _2558 = _2556;
            bool _2560 = _2470 == 72;
            int _2562 = _2558;
            if (_2542)
            {
                _2562 = _1338;
            }
            int _2564 = _2562;
            bool _2566 = _2470 == 76;
            int _2568 = _2564;
            if (_2548)
            {
                _2568 = _1340;
            }
            int _2570 = _2568;
            bool _2572 = _2470 == 80;
            int _2574 = _2570;
            if (_2554)
            {
                _2574 = _1342;
            }
            int _2576 = _2574;
            bool _2578 = _2470 == 84;
            int _2580 = _2576;
            if (_2560)
            {
                _2580 = _1344;
            }
            int _2582 = _2580;
            bool _2584 = _2470 == 88;
            int _2586 = _2582;
            if (_2566)
            {
                _2586 = _1346;
            }
            int _2588 = _2586;
            bool _2590 = _2470 == 92;
            int _2592 = _2588;
            if (_2572)
            {
                _2592 = _1348;
            }
            int _2594 = _2592;
            bool _2596 = _2470 == 96;
            int _2598 = _2594;
            if (_2578)
            {
                _2598 = _1350;
            }
            int _2600 = _2598;
            int _2602 = _2600;
            if (_2584)
            {
                _2602 = _1352;
            }
            int _2604 = _2602;
            int _2606 = _2604;
            if (_2590)
            {
                _2606 = _1354;
            }
            int _2608 = _2606;
            int _2610 = _2608;
            if (_2596)
            {
                _2610 = _1356;
            }
            int _2612 = _2610;
            bool _2614 = _2458 >= _2612;
            if (!_2614)
            {
                _2468 = _2454;
            }
        }
        int _2616 = _2468;
        _1392 = _2616;
    }
    int _2618 = _1392;
    int _2620 = _2618 * 8;
    uint _2622 = uint(int(uint(_2620) >> uint(2)));
    float _2624 = as_type<float>(_31[int(_2622)]);
    int _2626 = _2620 + 4;
    uint _2628 = uint(int(uint(_2626) >> uint(2)));
    float _2630 = as_type<float>(_31[int(_2628)]);
    int _2632 = _71 + 16;
    int _2634 = _71 + 24;
    uint _2636 = uint(int(uint(_2632) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2636)] = as_type<uint>(_2624);
    int _2638 = _2632 + 4;
    uint _2640 = uint(int(uint(_2638) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2640)] = as_type<uint>(_2630);
    uint _2642 = uint(int(uint(_2634) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2642)] = as_type<uint>(_1358);
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


vertex void main0_discard(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _884 = false;
    bool _708 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _2663 = float2((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    float4 _57 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2663, float2(0.0), isnan(_2663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2663, float2(0.0), isnan(_2663)), level(0.0)).xyzw;
    float _60 = _57.x;
    float _62 = _57.y;
    float _64 = _57.z;
    float _66 = _57.w;
    float _68 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _71 = as_type<int>(_68) * 32;
    uint _74 = uint(int(uint(_71) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_74)] = as_type<uint>(_60);
    int _76 = _71 + 4;
    uint _78 = uint(int(uint(_76) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_78)] = as_type<uint>(_62);
    int _80 = _71 + 8;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_82)] = as_type<uint>(_64);
    int _84 = _71 + 12;
    uint _86 = uint(int(uint(_84) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_86)] = as_type<uint>(_66);
    int _88 = -2;
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
    int _140 = 0;
    float _142 = 1000000.0;
    bool _146;
    bool _288;
    float _670;
    int _672;
    int _674;
    int _676;
    bool _684;
    int _686;
    int _740;
    int _742;
    int _748;
    int _754;
    int _760;
    int _766;
    int _772;
    int _778;
    int _784;
    int _790;
    int _796;
    int _802;
    int _808;
    int _814;
    int _820;
    int _826;
    int _830;
    bool _834;
    int _836;
    int _842;
    int _848;
    int _854;
    int _860;
    int _864;
    int _868;
    int _872;
    int _876;
    int _880;
    int _882;
    int _1242;
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
    int _1344;
    int _1346;
    int _1348;
    int _1350;
    int _1352;
    int _1354;
    int _1356;
    float _1358;
    int _1360;
    int _1374;
    int _1376;
    int _1378;
    int _1380;
    int _1382;
    int _1384;
    do
    {
        int _148 = _88;
        int _150 = _90;
        int _152 = _92;
        int _154 = _94;
        int _156 = _96;
        int _158 = _98;
        int _160 = _100;
        int _162 = _102;
        int _164 = _104;
        int _166 = _106;
        int _168 = _108;
        int _170 = _110;
        int _172 = _112;
        int _174 = _114;
        int _176 = _116;
        int _178 = _118;
        int _180 = _120;
        int _182 = _122;
        int _184 = _124;
        int _186 = _126;
        int _188 = _128;
        int _190 = _130;
        int _192 = _132;
        int _194 = _134;
        int _196 = _136;
        int _198 = _138;
        int _200 = _140;
        float _202 = _142;
        float _204 = float(_148);
        float _206 = _204 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _208 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _210 = fma(_206, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2783 = float2(_208, _210);
        float4 _212 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2783, float2(0.0), isnan(_2783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2783, float2(0.0), isnan(_2783)), level(0.0)).xyzw;
        float _214 = _212.x;
        float _216 = _212.y;
        float _218 = _212.z;
        float _220 = _212.w;
        int _222 = -2;
        float _224 = _216;
        float _226 = _220;
        float _228 = _218;
        float _230 = _214;
        int _232 = -2;
        int _234 = _150;
        int _236 = _152;
        int _238 = _154;
        int _240 = _156;
        int _242 = _158;
        int _244 = _160;
        int _246 = _162;
        int _248 = _164;
        int _250 = _166;
        int _252 = _168;
        int _254 = _170;
        int _256 = _172;
        int _258 = _174;
        int _260 = _176;
        int _262 = _178;
        int _264 = _180;
        int _266 = _182;
        int _268 = _184;
        int _270 = _186;
        int _272 = _188;
        int _274 = _190;
        int _276 = _192;
        int _278 = _194;
        int _280 = _196;
        int _282 = _198;
        int _284 = _200;
        float _286 = _202;
        do
        {
            int _290 = _222;
            float _292 = _224;
            float _294 = _226;
            float _296 = _228;
            float _298 = _230;
            int _300 = _232;
            int _302 = _234;
            int _304 = _236;
            int _306 = _238;
            int _308 = _240;
            int _310 = _242;
            int _312 = _244;
            int _314 = _246;
            int _316 = _248;
            int _318 = _250;
            int _320 = _252;
            int _322 = _254;
            int _324 = _256;
            int _326 = _258;
            int _328 = _260;
            int _330 = _262;
            int _332 = _264;
            int _334 = _266;
            int _336 = _268;
            int _338 = _270;
            int _340 = _272;
            int _342 = _274;
            int _344 = _276;
            int _346 = _278;
            int _348 = _280;
            int _350 = _282;
            int _352 = _284;
            float _354 = _286;
            int _356 = _290 + 1;
            float _358 = float(_148);
            float _360 = 0.0 + _292;
            float _362 = precise::clamp(_360, 0.0, 1.0);
            float _364 = _358 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _366 = float(_356);
            float _368 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _370 = fma(_364, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _372 = 0.0 + _294;
            float _374 = precise::clamp(_372, 0.0, 1.0);
            float _376 = fma(_366, _368, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _378 = 0.0 + _296;
            float _380 = precise::clamp(_378, 0.0, 1.0);
            float _382 = 0.0 + _298;
            float _384 = precise::clamp(_382, 0.0, 1.0);
            float2 _2903 = float2(_376, _370);
            float4 _386 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2903, float2(0.0), isnan(_2903)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2903, float2(0.0), isnan(_2903)), level(0.0)).xyzw;
            float _388 = _386.x;
            float _390 = _386.y;
            float _392 = _386.z;
            float _394 = _386.w;
            float _396 = _374 * 65535.0;
            float _398 = _380 * 65535.0;
            float _400 = _362 * 65535.0;
            float _402 = _384 * 65535.0;
            float _404 = rint(_396);
            int _406 = int(_404);
            float _408 = rint(_398);
            int _410 = int(_408);
            float _412 = rint(_400);
            int _414 = int(_412);
            uint _416 = extract_bits(uint(_406), 0u, 8u);
            int _418 = int(_416) & 255;
            uint _420 = extract_bits(uint(_406), 8u, 8u);
            int _422 = int(_420) & 255;
            int _424 = _422 << 8;
            int _426 = _418 | _424;
            float _428 = rint(_402);
            int _430 = int(_428);
            uint _432 = extract_bits(uint(_426), 0u, 8u);
            int _434 = int(_432) & 255;
            uint _436 = extract_bits(uint(_426), 8u, 8u);
            int _438 = int(_436) & 255;
            int _440 = _438 << 8;
            int _442 = _434 | _440;
            uint _444 = extract_bits(uint(_410), 0u, 8u);
            int _446 = int(_444) & 255;
            int _448 = _446 << 16;
            int _450 = _442 | _448;
            uint _452 = extract_bits(uint(_410), 8u, 8u);
            int _454 = int(_452) & 255;
            int _456 = _454 << 24;
            int _458 = _450 | _456;
            float _460 = float(_300);
            bool _462 = _458 != 0;
            uint _464 = extract_bits(uint(_414), 0u, 8u);
            int _466 = int(_464) & 255;
            uint _468 = extract_bits(uint(_414), 8u, 8u);
            int _470 = int(_468) & 255;
            int _472 = _470 << 8;
            int _474 = _466 | _472;
            float _476 = fma(_460, _368, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _478 = extract_bits(uint(_474), 0u, 8u);
            int _480 = int(_478) & 255;
            uint _482 = extract_bits(uint(_474), 8u, 8u);
            int _484 = int(_482) & 255;
            int _486 = _484 << 8;
            int _488 = _480 | _486;
            uint _490 = extract_bits(uint(_430), 0u, 8u);
            int _492 = int(_490) & 255;
            int _494 = _492 << 16;
            int _496 = _488 | _494;
            uint _498 = extract_bits(uint(_430), 8u, 8u);
            int _500 = int(_498) & 255;
            int _502 = _500 << 24;
            int _504 = _496 | _502;
            bool _506 = _504 != 0;
            bool _508 = _506 || _462;
            bool _510 = !_508;
            _222 = _356;
            _224 = _390;
            _226 = _394;
            _228 = _392;
            _230 = _388;
            int _512 = _312;
            int _514 = _304;
            int _516 = _306;
            int _518 = _308;
            int _520 = _310;
            int _522 = _314;
            int _524 = _316;
            int _526 = _326;
            int _528 = _318;
            int _530 = _320;
            int _532 = _322;
            int _534 = _324;
            int _536 = _328;
            int _538 = _330;
            int _540 = _340;
            int _542 = _332;
            int _544 = _334;
            int _546 = _336;
            int _548 = _338;
            int _550 = _342;
            int _552 = _344;
            int _554 = _346;
            int _556 = _348;
            int _558 = _350;
            int _560 = _352;
            int _562 = _458;
            int _564 = _304;
            int _566 = _306;
            int _568 = _308;
            int _570 = _310;
            int _572 = _348;
            int _574 = _350;
            int _576 = _352;
            int _578 = _312;
            int _580 = _314;
            int _582 = _316;
            int _584 = _318;
            int _586 = _320;
            int _588 = _322;
            int _590 = _324;
            int _592 = _326;
            int _594 = _328;
            int _596 = _330;
            int _598 = _332;
            int _600 = _334;
            int _602 = _336;
            int _604 = _338;
            int _606 = _346;
            int _608 = _344;
            int _610 = _342;
            int _612 = _302;
            int _614 = _304;
            int _616 = _306;
            int _618 = _308;
            int _620 = _310;
            int _622 = _312;
            int _624 = _314;
            int _626 = _316;
            int _628 = _318;
            int _630 = _320;
            int _632 = _322;
            int _634 = _324;
            int _636 = _326;
            int _638 = _328;
            int _640 = _330;
            int _642 = _332;
            int _644 = _334;
            int _646 = _336;
            int _648 = _338;
            int _650 = _340;
            int _652 = _342;
            int _654 = _344;
            int _656 = _346;
            int _658 = _348;
            int _660 = _350;
            int _662 = _352;
            int _664 = _430;
            int _666 = _458;
            int _668 = as_type<int>(_460);
            _670 = _354;
            _672 = _504;
            _674 = _458;
            _676 = as_type<int>(_392);
            if (!_510)
            {
                bool _678 = _302 > 0;
                bool _680 = !_678;
                if (!_680)
                {
                    int _682 = 0;
                    do
                    {
                        _686 = _682;
                        int _688 = _686 * 8;
                        uint _690 = uint(int(uint(_688) >> uint(2)));
                        float _692 = as_type<float>(_31[int(_690)]);
                        int _694 = _688 + 4;
                        uint _696 = uint(int(uint(_694) >> uint(2)));
                        float _698 = as_type<float>(_31[int(_696)]);
                        bool _700 = as_type<int>(_692) != _458;
                        bool _702 = as_type<int>(_698) != _504;
                        bool _704 = _702 || _700;
                        bool _706 = !_704;
                        _708 = _706;
                        if (_708)
                        {
                            break;
                        }
                        int _710 = _686 + 1;
                        bool _712 = _710 >= _302;
                        _684 = !_712;
                        _682 = _710;
                    } while (_684);
                }
                if (!_708)
                {
                    int _714 = _302 * 4;
                    int _716 = _302 * 8;
                    int _718 = _302 + 1;
                    bool _720 = _714 == 16;
                    bool _722 = _714 == 0;
                    uint _724 = uint(int(uint(_716) >> uint(2)));
                    _31[int(_724)] = uint(_458);
                    int _726 = _716 + 4;
                    uint _728 = uint(int(uint(_726) >> uint(2)));
                    _31[int(_728)] = uint(_504);
                    bool _730 = _714 == 4;
                    bool _732 = _714 == 8;
                    bool _734 = _714 == 12;
                    bool _736 = _714 == 20;
                    bool _738 = _714 == 24;
                    _612 = _718;
                    _664 = _716;
                    _668 = _714;
                    _740 = _716;
                    _742 = _714;
                    if (_720)
                    {
                        _512 = 1;
                    }
                    int _744 = _512;
                    bool _746 = _714 == 44;
                    _622 = _744;
                    _748 = _744;
                    if (_722)
                    {
                        _514 = 1;
                    }
                    int _750 = _514;
                    bool _752 = _714 == 28;
                    _614 = _750;
                    _754 = _750;
                    if (_730)
                    {
                        _516 = 1;
                    }
                    int _756 = _516;
                    bool _758 = _714 == 32;
                    _616 = _756;
                    _760 = _756;
                    if (_732)
                    {
                        _518 = 1;
                    }
                    int _762 = _518;
                    bool _764 = _714 == 36;
                    _618 = _762;
                    _766 = _762;
                    if (_734)
                    {
                        _520 = 1;
                    }
                    int _768 = _520;
                    bool _770 = _714 == 40;
                    _620 = _768;
                    _772 = _768;
                    if (_736)
                    {
                        _522 = 1;
                    }
                    int _774 = _522;
                    bool _776 = _714 == 48;
                    _624 = _774;
                    _778 = _774;
                    if (_738)
                    {
                        _524 = 1;
                    }
                    int _780 = _524;
                    bool _782 = _714 == 52;
                    _626 = _780;
                    _784 = _780;
                    if (_746)
                    {
                        _526 = 1;
                    }
                    int _786 = _526;
                    bool _788 = _714 == 72;
                    _636 = _786;
                    _790 = _786;
                    if (_752)
                    {
                        _528 = 1;
                    }
                    int _792 = _528;
                    bool _794 = _714 == 56;
                    _628 = _792;
                    _796 = _792;
                    if (_758)
                    {
                        _530 = 1;
                    }
                    int _798 = _530;
                    bool _800 = _714 == 60;
                    _630 = _798;
                    _802 = _798;
                    if (_764)
                    {
                        _532 = 1;
                    }
                    int _804 = _532;
                    bool _806 = _714 == 64;
                    _632 = _804;
                    _808 = _804;
                    if (_770)
                    {
                        _534 = 1;
                    }
                    int _810 = _534;
                    bool _812 = _714 == 68;
                    _634 = _810;
                    _814 = _810;
                    if (_776)
                    {
                        _536 = 1;
                    }
                    int _816 = _536;
                    bool _818 = _714 == 76;
                    _638 = _816;
                    _820 = _816;
                    if (_782)
                    {
                        _538 = 1;
                    }
                    int _822 = _538;
                    bool _824 = _714 == 80;
                    _640 = _822;
                    _826 = _822;
                    if (_788)
                    {
                        _540 = 1;
                    }
                    int _828 = _540;
                    _650 = _828;
                    _830 = _828;
                    if (_794)
                    {
                        _542 = 1;
                    }
                    int _832 = _542;
                    _834 = _718 != 25;
                    _642 = _832;
                    _836 = _832;
                    if (_800)
                    {
                        _544 = 1;
                    }
                    int _838 = _544;
                    bool _840 = _714 == 84;
                    _644 = _838;
                    _842 = _838;
                    if (_806)
                    {
                        _546 = 1;
                    }
                    int _844 = _546;
                    bool _846 = _714 == 88;
                    _646 = _844;
                    _848 = _844;
                    if (_812)
                    {
                        _548 = 1;
                    }
                    int _850 = _548;
                    bool _852 = _714 == 92;
                    _648 = _850;
                    _854 = _850;
                    if (_818)
                    {
                        _550 = 1;
                    }
                    int _856 = _550;
                    bool _858 = _714 == 96;
                    _652 = _856;
                    _860 = _856;
                    if (_824)
                    {
                        _552 = 1;
                    }
                    int _862 = _552;
                    _654 = _862;
                    _864 = _862;
                    if (_840)
                    {
                        _554 = 1;
                    }
                    int _866 = _554;
                    _656 = _866;
                    _868 = _866;
                    if (_846)
                    {
                        _556 = 1;
                    }
                    int _870 = _556;
                    _658 = _870;
                    _872 = _870;
                    if (_852)
                    {
                        _558 = 1;
                    }
                    int _874 = _558;
                    _660 = _874;
                    _876 = _874;
                    if (_858)
                    {
                        _560 = 1;
                    }
                    int _878 = _560;
                    _662 = _878;
                    _880 = _878;
                }
                if ((!_834) || _708)
                {
                    if (!_708)
                    {
                        _882 = 25;
                        _884 = true;
                        if (_884)
                        {
                            break;
                        }
                    }
                    _708 = false;
                    int _886 = _686 * 4;
                    bool _888 = _886 == 0;
                    bool _890 = _886 == 4;
                    bool _892 = _886 == 8;
                    bool _894 = _886 == 12;
                    bool _896 = _886 == 88;
                    bool _898 = _886 == 92;
                    bool _900 = _886 == 96;
                    if (_888)
                    {
                        _562 = _304;
                    }
                    int _902 = _562;
                    bool _904 = _886 == 16;
                    int _906 = _902;
                    if (_890)
                    {
                        _906 = _306;
                    }
                    int _908 = _906;
                    bool _910 = _886 == 20;
                    int _912 = _908;
                    if (_892)
                    {
                        _912 = _308;
                    }
                    int _914 = _912;
                    bool _916 = _886 == 24;
                    int _918 = _914;
                    if (_894)
                    {
                        _918 = _310;
                    }
                    int _920 = _918;
                    bool _922 = _886 == 84;
                    int _924 = int(_916);
                    int _926 = _910 ? 2 : 0;
                    int _928 = _924 | _926;
                    int _930 = _904 ? 4 : 0;
                    int _932 = _928 | _930;
                    int _934 = _922 ? 8 : 0;
                    int _936 = _932 | _934;
                    int _938 = _896 ? 16 : 0;
                    int _940 = _936 | _938;
                    int _942 = _898 ? 32 : 0;
                    int _944 = _940 | _942;
                    int _946 = _900 ? 64 : 0;
                    int _948 = _944 | _946;
                    int _950 = _948 & 8;
                    int _952 = _920;
                    if (_904)
                    {
                        _952 = _312;
                    }
                    int _954 = _952;
                    bool _956 = _886 == 80;
                    int _958 = _954;
                    if (_910)
                    {
                        _958 = _314;
                    }
                    int _960 = _958;
                    bool _962 = _886 == 76;
                    int _964 = _960;
                    if (_916)
                    {
                        _964 = _316;
                    }
                    int _966 = _964;
                    bool _968 = _886 == 28;
                    int _970 = int(_968);
                    int _972 = _962 ? 2 : 0;
                    int _974 = _970 | _972;
                    int _976 = _956 ? 4 : 0;
                    int _978 = _974 | _976;
                    int _980 = _922 ? 8 : 0;
                    int _982 = _978 | _980;
                    int _984 = _896 ? 16 : 0;
                    int _986 = _982 | _984;
                    int _988 = _898 ? 32 : 0;
                    int _990 = _986 | _988;
                    int _992 = _900 ? 64 : 0;
                    int _994 = _990 | _992;
                    int _996 = _994 & 2;
                    int _998 = int(_968);
                    int _1000 = _962 ? 2 : 0;
                    int _1002 = _998 | _1000;
                    int _1004 = _956 ? 4 : 0;
                    int _1006 = _1002 | _1004;
                    int _1008 = _922 ? 8 : 0;
                    int _1010 = _1006 | _1008;
                    int _1012 = _896 ? 16 : 0;
                    int _1014 = _1010 | _1012;
                    int _1016 = _898 ? 32 : 0;
                    int _1018 = _1014 | _1016;
                    int _1020 = _900 ? 64 : 0;
                    int _1022 = _1018 | _1020;
                    int _1024 = _1022 & 4;
                    int _1026 = _966;
                    _664 = _996;
                    _668 = _1024;
                    if (_968)
                    {
                        _1026 = _318;
                    }
                    int _1028 = _1026;
                    bool _1030 = _886 == 32;
                    int _1032 = _1028;
                    if (_1030)
                    {
                        _1032 = _320;
                    }
                    int _1034 = _1032;
                    bool _1036 = _886 == 36;
                    int _1038 = _1034;
                    if (_1036)
                    {
                        _1038 = _322;
                    }
                    int _1040 = _1038;
                    bool _1042 = _886 == 40;
                    int _1044 = _1040;
                    if (_1042)
                    {
                        _1044 = _324;
                    }
                    int _1046 = _1044;
                    bool _1048 = _886 == 44;
                    int _1050 = _1046;
                    if (_1048)
                    {
                        _1050 = _326;
                    }
                    int _1052 = _1050;
                    bool _1054 = _886 == 48;
                    int _1056 = _1052;
                    if (_1054)
                    {
                        _1056 = _328;
                    }
                    int _1058 = _1056;
                    bool _1060 = _886 == 52;
                    int _1062 = _1058;
                    if (_1060)
                    {
                        _1062 = _330;
                    }
                    int _1064 = _1062;
                    bool _1066 = _886 == 56;
                    int _1068 = _1064;
                    if (_1066)
                    {
                        _1068 = _332;
                    }
                    int _1070 = _1068;
                    bool _1072 = _886 == 60;
                    int _1074 = _1070;
                    if (_1072)
                    {
                        _1074 = _334;
                    }
                    int _1076 = _1074;
                    bool _1078 = _886 == 64;
                    int _1080 = _1076;
                    if (_1078)
                    {
                        _1080 = _336;
                    }
                    int _1082 = _1080;
                    bool _1084 = _886 == 68;
                    int _1086 = _1082;
                    if (_1084)
                    {
                        _1086 = _338;
                    }
                    int _1088 = _1086;
                    bool _1090 = _886 == 72;
                    int _1092 = int(_1090);
                    int _1094 = _962 ? 2 : 0;
                    int _1096 = _1092 | _1094;
                    int _1098 = _956 ? 4 : 0;
                    int _1100 = _1096 | _1098;
                    int _1102 = _922 ? 8 : 0;
                    int _1104 = _1100 | _1102;
                    int _1106 = _896 ? 16 : 0;
                    int _1108 = _1104 | _1106;
                    int _1110 = _898 ? 32 : 0;
                    int _1112 = _1108 | _1110;
                    int _1114 = _900 ? 64 : 0;
                    int _1116 = _1112 | _1114;
                    int _1118 = _1116 & 1;
                    int _1120 = _1088;
                    if (_1090)
                    {
                        _1120 = _340;
                    }
                    int _1122 = _1120;
                    bool _1124 = _886 == 4;
                    int _1126 = _1122;
                    if (_962)
                    {
                        _1126 = _342;
                    }
                    int _1128 = _1126;
                    bool _1130 = _886 == 0;
                    int _1132 = _1128;
                    if (_956)
                    {
                        _1132 = _344;
                    }
                    int _1134 = _1132;
                    int _1136 = _1134;
                    if (_922)
                    {
                        _1136 = _346;
                    }
                    int _1138 = _1136;
                    int _1140 = _1138;
                    if (_896)
                    {
                        _1140 = _348;
                    }
                    int _1142 = _1140;
                    bool _1144 = _886 == 8;
                    int _1146 = _1142;
                    if (_898)
                    {
                        _1146 = _350;
                    }
                    int _1148 = _1146;
                    bool _1150 = _886 == 12;
                    int _1152 = _1148;
                    if (_900)
                    {
                        _1152 = _352;
                    }
                    int _1154 = _1152;
                    int _1156 = _1154 + 1;
                    _666 = _1156;
                    if (_1130)
                    {
                        _564 = _1156;
                    }
                    int _1158 = _564;
                    bool _1160 = _886 == 16;
                    _614 = _1158;
                    if (_1124)
                    {
                        _566 = _1156;
                    }
                    int _1162 = _566;
                    bool _1164 = _886 == 20;
                    _616 = _1162;
                    if (_1144)
                    {
                        _568 = _1156;
                    }
                    int _1166 = _568;
                    bool _1168 = _886 == 24;
                    _618 = _1166;
                    if (_1150)
                    {
                        _570 = _1156;
                    }
                    int _1170 = _570;
                    bool _1172 = _886 == 28;
                    _620 = _1170;
                    if (_896)
                    {
                        _572 = _1156;
                    }
                    int _1174 = _572;
                    _658 = _1174;
                    if (_898)
                    {
                        _574 = _1156;
                    }
                    int _1176 = _574;
                    _660 = _1176;
                    if (_900)
                    {
                        _576 = _1156;
                    }
                    int _1178 = _576;
                    _662 = _1178;
                    if (_1160)
                    {
                        _578 = _1156;
                    }
                    int _1180 = _578;
                    bool _1182 = _886 == 32;
                    _622 = _1180;
                    if (_1164)
                    {
                        _580 = _1156;
                    }
                    int _1184 = _580;
                    bool _1186 = _886 == 36;
                    _624 = _1184;
                    if (_1168)
                    {
                        _582 = _1156;
                    }
                    int _1188 = _582;
                    bool _1190 = _886 == 40;
                    _626 = _1188;
                    if (_1172)
                    {
                        _584 = _1156;
                    }
                    int _1192 = _584;
                    bool _1194 = _886 == 44;
                    _628 = _1192;
                    if (_1182)
                    {
                        _586 = _1156;
                    }
                    int _1196 = _586;
                    bool _1198 = _886 == 48;
                    _630 = _1196;
                    if (_1186)
                    {
                        _588 = _1156;
                    }
                    int _1200 = _588;
                    bool _1202 = _886 == 52;
                    _632 = _1200;
                    if (_1190)
                    {
                        _590 = _1156;
                    }
                    int _1204 = _590;
                    bool _1206 = _886 == 56;
                    _634 = _1204;
                    if (_1194)
                    {
                        _592 = _1156;
                    }
                    int _1208 = _592;
                    bool _1210 = _886 == 60;
                    _636 = _1208;
                    if (_1198)
                    {
                        _594 = _1156;
                    }
                    int _1212 = _594;
                    bool _1214 = _886 == 64;
                    _638 = _1212;
                    if (_1202)
                    {
                        _596 = _1156;
                    }
                    int _1216 = _596;
                    bool _1218 = _886 == 68;
                    _640 = _1216;
                    if (_1206)
                    {
                        _598 = _1156;
                    }
                    int _1220 = _598;
                    bool _1222 = _950 != 0;
                    _642 = _1220;
                    if (_1210)
                    {
                        _600 = _1156;
                    }
                    int _1224 = _600;
                    bool _1226 = _1024 != 0;
                    _644 = _1224;
                    if (_1214)
                    {
                        _602 = _1156;
                    }
                    int _1228 = _602;
                    bool _1230 = _996 != 0;
                    _646 = _1228;
                    if (_1218)
                    {
                        _604 = _1156;
                    }
                    int _1232 = _604;
                    bool _1234 = _1118 != 0;
                    _648 = _1232;
                    if (_1222)
                    {
                        _606 = _1156;
                    }
                    int _1236 = _606;
                    _656 = _1236;
                    if (_1226)
                    {
                        _608 = _1156;
                    }
                    int _1238 = _608;
                    _654 = _1238;
                    if (_1230)
                    {
                        _610 = _1156;
                    }
                    int _1240 = _610;
                    _652 = _1240;
                    if (_1234)
                    {
                        _650 = _1156;
                    }
                }
            }
            _1242 = _612;
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
            int _1288 = _658;
            int _1290 = _660;
            int _1292 = _662;
            int _1294 = _664;
            int _1296 = _666;
            int _1298 = _668;
            float2 _4060 = float2(_476, _370);
            float _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4060, float2(0.0), isnan(_4060)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4060, float2(0.0), isnan(_4060)), level(0.0)).x;
            int _1302 = _300 + 1;
            bool _1304 = _1302 >= 3;
            float _1306 = precise::min(_1300, _354);
            _288 = !_1304;
            _232 = _1302;
            _234 = _1242;
            _236 = _1244;
            _238 = _1246;
            _240 = _1248;
            _242 = _1250;
            _244 = _1252;
            _246 = _1254;
            _248 = _1256;
            _250 = _1258;
            _252 = _1260;
            _254 = _1262;
            _256 = _1264;
            _258 = _1266;
            _260 = _1268;
            _262 = _1270;
            _264 = _1272;
            _266 = _1274;
            _268 = _1276;
            _270 = _1278;
            _272 = _1280;
            _274 = _1282;
            _276 = _1284;
            _278 = _1286;
            _280 = _1288;
            _282 = _1290;
            _284 = _1292;
            _286 = _1306;
            _754 = _1244;
            _760 = _1246;
            _766 = _1248;
            _772 = _1250;
            _748 = _1252;
            _778 = _1254;
            _784 = _1256;
            _796 = _1258;
            _802 = _1260;
            _808 = _1262;
            _814 = _1264;
            _790 = _1266;
            _820 = _1268;
            _826 = _1270;
            _836 = _1272;
            _842 = _1274;
            _848 = _1276;
            _854 = _1278;
            _830 = _1280;
            _860 = _1282;
            _864 = _1284;
            _868 = _1286;
            _872 = _1288;
            _876 = _1290;
            _880 = _1292;
            _670 = _1306;
            _672 = as_type<int>(_1300);
            _740 = _1294;
            _674 = _1296;
            _742 = _1298;
        } while (_288);
        if (!_884)
        {
            _882 = _1242;
        }
        _884 = false;
        _1308 = _754;
        _1310 = _760;
        _1312 = _766;
        _1314 = _772;
        _1316 = _748;
        _1318 = _778;
        _1320 = _784;
        _1322 = _796;
        _1324 = _802;
        _1326 = _808;
        _1328 = _814;
        _1330 = _790;
        _1332 = _820;
        _1334 = _826;
        _1336 = _836;
        _1338 = _842;
        _1340 = _848;
        _1342 = _854;
        _1344 = _830;
        _1346 = _860;
        _1348 = _864;
        _1350 = _868;
        _1352 = _872;
        _1354 = _876;
        _1356 = _880;
        _1358 = _670;
        _1360 = _882;
        int _1362 = _672;
        int _1364 = _740;
        int _1366 = _674;
        int _1368 = _742;
        int _1370 = _148 + 1;
        bool _1372 = _1370 >= 3;
        _146 = !_1372;
        _88 = _1370;
        _90 = _1360;
        _92 = _1308;
        _94 = _1310;
        _96 = _1312;
        _98 = _1314;
        _100 = _1316;
        _102 = _1318;
        _104 = _1320;
        _106 = _1322;
        _108 = _1324;
        _110 = _1326;
        _112 = _1328;
        _114 = _1330;
        _116 = _1332;
        _118 = _1334;
        _120 = _1336;
        _122 = _1338;
        _124 = _1340;
        _126 = _1342;
        _128 = _1344;
        _130 = _1346;
        _132 = _1348;
        _134 = _1350;
        _136 = _1352;
        _138 = _1354;
        _140 = _1356;
        _142 = _1358;
        _1374 = _1362;
        _1376 = _1364;
        _1378 = _1366;
        _1380 = _1368;
        _1382 = _1362;
        _1384 = _1308;
    } while (_146);
    bool _1386 = _1360 > 0;
    if (!_1386)
    {
        _676 = 0;
    }
    int _1388 = _676;
    bool _1390 = !_1386;
    int _1392 = _1388;
    if (!_1390)
    {
        bool _1394 = _1360 > 3;
        bool _1396 = !_1394;
        int _1398 = 0;
        int _1400 = 0;
        int _1402 = 0;
        int _1404 = 0;
        int _1406 = 0;
        int _1408 = -1;
        int _1410 = 0;
        if (!_1396)
        {
            int _1412 = _1360 + (-3);
            _1408 = 0;
            bool _1414;
            do
            {
                int _1416 = _1398;
                int _1418 = _1400;
                int _1420 = _1374;
                int _1422 = _1376;
                int _1424 = _1378;
                int _1426 = _1402;
                int _1428 = _1380;
                int _1430 = _1416 * 4;
                int _1432 = _1416 + 1;
                int _1434 = _1416 + 2;
                bool _1436 = _1430 == 0;
                int _1438 = _1432 * 4;
                bool _1440 = _1430 == 4;
                int _1442 = _1434 * 4;
                bool _1444 = _1430 == 8;
                bool _1446 = _1430 == 12;
                bool _1448 = _1430 == 16;
                bool _1450 = _1438 == 8;
                int _1452 = _1416 + 3;
                int _1454 = _1420;
                int _1456 = _1422;
                int _1458 = _1424;
                int _1460 = _1428;
                int _1462 = _1418;
                int _1464 = _1426;
                if (_1436)
                {
                    _1454 = _1308;
                }
                int _1466 = _1454;
                bool _1468 = _1430 == 24;
                int _1470 = _1466;
                if (_1440)
                {
                    _1470 = _1310;
                }
                int _1472 = _1470;
                bool _1474 = _1430 == 20;
                int _1476 = _1472;
                if (_1444)
                {
                    _1476 = _1312;
                }
                int _1478 = _1476;
                bool _1480 = _1430 == 32;
                int _1482 = _1478;
                if (_1446)
                {
                    _1482 = _1314;
                }
                int _1484 = _1482;
                bool _1486 = _1430 == 28;
                int _1488 = _1484;
                if (_1448)
                {
                    _1488 = _1316;
                }
                int _1490 = _1488;
                bool _1492 = _1430 == 40;
                int _1494 = _1452 * 4;
                int _1496 = _1490;
                if (_1474)
                {
                    _1496 = _1318;
                }
                int _1498 = _1496;
                bool _1500 = _1430 == 36;
                int _1502 = _1498;
                if (_1468)
                {
                    _1502 = _1320;
                }
                int _1504 = _1502;
                bool _1506 = _1438 == 0;
                int _1508 = _1504;
                if (_1486)
                {
                    _1508 = _1322;
                }
                int _1510 = _1508;
                bool _1512 = _1438 == 4;
                int _1514 = _1510;
                if (_1480)
                {
                    _1514 = _1324;
                }
                int _1516 = _1514;
                bool _1518 = _1438 == 12;
                int _1520 = _1516;
                if (_1500)
                {
                    _1520 = _1326;
                }
                int _1522 = _1520;
                bool _1524 = _1430 == 44;
                int _1526 = _1522;
                if (_1492)
                {
                    _1526 = _1328;
                }
                int _1528 = _1526;
                bool _1530 = _1438 == 16;
                int _1532 = _1528;
                if (_1506)
                {
                    _1456 = _1308;
                }
                int _1534 = _1456;
                bool _1536 = _1430 == 48;
                int _1538 = _1534;
                if (_1512)
                {
                    _1538 = _1310;
                }
                int _1540 = _1538;
                bool _1542 = _1438 == 20;
                int _1544 = _1540;
                if (_1450)
                {
                    _1544 = _1312;
                }
                int _1546 = _1544;
                bool _1548 = _1438 == 24;
                int _1550 = _1546;
                if (_1518)
                {
                    _1550 = _1314;
                }
                int _1552 = _1550;
                bool _1554 = _1438 == 28;
                int _1556 = _1552;
                if (_1524)
                {
                    _1532 = _1330;
                }
                int _1558 = _1532;
                bool _1560 = _1430 == 52;
                int _1562 = _1558;
                if (_1530)
                {
                    _1556 = _1316;
                }
                int _1564 = _1556;
                bool _1566 = _1438 == 32;
                int _1568 = _1564;
                if (_1536)
                {
                    _1562 = _1332;
                }
                int _1570 = _1562;
                bool _1572 = _1430 == 56;
                int _1574 = _1570;
                if (_1542)
                {
                    _1568 = _1318;
                }
                int _1576 = _1568;
                bool _1578 = _1438 == 36;
                int _1580 = _1576;
                if (_1548)
                {
                    _1580 = _1320;
                }
                int _1582 = _1580;
                bool _1584 = _1438 == 40;
                int _1586 = _1582;
                if (_1554)
                {
                    _1586 = _1322;
                }
                int _1588 = _1586;
                bool _1590 = _1438 == 44;
                int _1592 = _1588;
                if (_1560)
                {
                    _1574 = _1334;
                }
                int _1594 = _1574;
                bool _1596 = _1430 == 60;
                int _1598 = _1594;
                if (_1566)
                {
                    _1592 = _1324;
                }
                int _1600 = _1592;
                bool _1602 = _1438 == 48;
                int _1604 = _1600;
                if (_1572)
                {
                    _1598 = _1336;
                }
                int _1606 = _1598;
                bool _1608 = _1430 == 64;
                int _1610 = _1606;
                if (_1578)
                {
                    _1604 = _1326;
                }
                int _1612 = _1604;
                bool _1614 = _1438 == 52;
                int _1616 = _1612;
                if (_1584)
                {
                    _1616 = _1328;
                }
                int _1618 = _1616;
                int _1620 = _1618;
                if (_1590)
                {
                    _1620 = _1330;
                }
                int _1622 = _1620;
                bool _1624 = _1438 == 56;
                bool _1626 = _1438 == 60;
                int _1628 = _1622;
                if (_1596)
                {
                    _1610 = _1338;
                }
                int _1630 = _1610;
                bool _1632 = _1442 == 0;
                int _1634 = _1630;
                if (_1602)
                {
                    _1628 = _1332;
                }
                int _1636 = _1628;
                bool _1638 = _1430 == 68;
                int _1640 = _1636;
                if (_1608)
                {
                    _1634 = _1340;
                }
                int _1642 = _1634;
                bool _1644 = _1442 == 4;
                int _1646 = _1642;
                if (_1614)
                {
                    _1640 = _1334;
                }
                int _1648 = _1640;
                bool _1650 = _1442 == 8;
                int _1652 = _1648;
                if (_1624)
                {
                    _1652 = _1336;
                }
                int _1654 = _1652;
                bool _1656 = _1442 == 12;
                int _1658 = _1654;
                if (_1626)
                {
                    _1658 = _1338;
                }
                int _1660 = _1658;
                bool _1662 = _1442 == 16;
                int _1664 = _1660;
                if (_1632)
                {
                    _1458 = _1308;
                }
                int _1666 = _1458;
                bool _1668 = _1438 == 64;
                int _1670 = _1666;
                if (_1638)
                {
                    _1646 = _1342;
                }
                int _1672 = _1646;
                bool _1674 = _1442 == 20;
                int _1676 = _1672;
                if (_1644)
                {
                    _1670 = _1310;
                }
                int _1678 = _1670;
                bool _1680 = _1430 == 72;
                int _1682 = _1678;
                if (_1650)
                {
                    _1682 = _1312;
                }
                int _1684 = _1682;
                bool _1686 = _1442 == 24;
                int _1688 = _1684;
                if (_1656)
                {
                    _1688 = _1314;
                }
                int _1690 = _1688;
                bool _1692 = _1442 == 28;
                int _1694 = _1690;
                if (_1662)
                {
                    _1694 = _1316;
                }
                int _1696 = _1694;
                bool _1698 = _1442 == 32;
                int _1700 = _1696;
                if (_1668)
                {
                    _1664 = _1340;
                }
                int _1702 = _1664;
                bool _1704 = _1438 == 68;
                int _1706 = _1702;
                if (_1674)
                {
                    _1700 = _1318;
                }
                int _1708 = _1700;
                bool _1710 = _1442 == 36;
                int _1712 = _1708;
                if (_1680)
                {
                    _1676 = _1344;
                }
                int _1714 = _1676;
                bool _1716 = _1430 == 76;
                int _1718 = _1714;
                if (_1686)
                {
                    _1712 = _1320;
                }
                int _1720 = _1712;
                bool _1722 = _1442 == 40;
                int _1724 = _1720;
                if (_1692)
                {
                    _1724 = _1322;
                }
                int _1726 = _1724;
                bool _1728 = _1442 == 44;
                int _1730 = _1726;
                if (_1698)
                {
                    _1730 = _1324;
                }
                int _1732 = _1730;
                bool _1734 = _1442 == 48;
                int _1736 = _1732;
                if (_1704)
                {
                    _1706 = _1342;
                }
                int _1738 = _1706;
                bool _1740 = _1438 == 72;
                int _1742 = _1738;
                if (_1710)
                {
                    _1736 = _1326;
                }
                int _1744 = _1736;
                bool _1746 = _1442 == 52;
                int _1748 = _1744;
                if (_1716)
                {
                    _1718 = _1346;
                }
                int _1750 = _1718;
                bool _1752 = _1430 == 80;
                int _1754 = _1750;
                if (_1722)
                {
                    _1748 = _1328;
                }
                int _1756 = _1748;
                bool _1758 = _1442 == 56;
                int _1760 = _1756;
                if (_1728)
                {
                    _1760 = _1330;
                }
                int _1762 = _1760;
                bool _1764 = _1442 == 60;
                int _1766 = _1762;
                if (_1734)
                {
                    _1766 = _1332;
                }
                int _1768 = _1766;
                bool _1770 = _1438 == 76;
                int _1772 = _1768;
                if (_1740)
                {
                    _1742 = _1344;
                }
                int _1774 = _1742;
                bool _1776 = _1442 == 64;
                int _1778 = _1774;
                if (_1746)
                {
                    _1772 = _1334;
                }
                int _1780 = _1772;
                bool _1782 = _1430 == 84;
                int _1784 = _1780;
                if (_1752)
                {
                    _1754 = _1348;
                }
                int _1786 = _1754;
                bool _1788 = _1442 == 68;
                int _1790 = _1786;
                if (_1758)
                {
                    _1784 = _1336;
                }
                int _1792 = _1784;
                bool _1794 = _1442 == 72;
                int _1796 = _1792;
                if (_1764)
                {
                    _1796 = _1338;
                }
                int _1798 = _1796;
                bool _1800 = _1442 == 76;
                int _1802 = _1798;
                if (_1770)
                {
                    _1778 = _1346;
                }
                int _1804 = _1778;
                bool _1806 = _1438 == 80;
                int _1808 = _1804;
                if (_1776)
                {
                    _1802 = _1340;
                }
                int _1810 = _1802;
                bool _1812 = _1494 == 0;
                int _1814 = _1810;
                if (_1782)
                {
                    _1790 = _1350;
                }
                int _1816 = _1790;
                bool _1818 = _1494 == 4;
                int _1820 = _1816;
                if (_1788)
                {
                    _1814 = _1342;
                }
                int _1822 = _1814;
                bool _1824 = _1442 == 80;
                int _1826 = _1822;
                if (_1794)
                {
                    _1826 = _1344;
                }
                int _1828 = _1826;
                bool _1830 = _1494 == 8;
                int _1832 = _1828;
                if (_1800)
                {
                    _1832 = _1346;
                }
                int _1834 = _1832;
                bool _1836 = _1430 == 88;
                int _1838 = _1834;
                if (_1806)
                {
                    _1808 = _1348;
                }
                int _1840 = _1808;
                bool _1842 = _1438 == 84;
                int _1844 = _1840;
                if (_1812)
                {
                    _1460 = _1308;
                }
                int _1846 = _1460;
                bool _1848 = _1494 == 12;
                int _1850 = _1846;
                if (_1818)
                {
                    _1850 = _1310;
                }
                int _1852 = _1850;
                bool _1854 = _1442 == 84;
                int _1856 = _1852;
                if (_1824)
                {
                    _1838 = _1348;
                }
                int _1858 = _1838;
                bool _1860 = _1494 == 16;
                int _1862 = _1858;
                if (_1830)
                {
                    _1856 = _1312;
                }
                int _1864 = _1856;
                bool _1866 = _1430 == 92;
                int _1868 = _1864;
                if (_1836)
                {
                    _1820 = _1352;
                }
                int _1870 = _1820;
                bool _1872 = _1494 == 20;
                int _1874 = _1870;
                if (_1842)
                {
                    _1844 = _1350;
                }
                int _1876 = _1844;
                bool _1878 = _1494 == 24;
                int _1880 = _1876;
                if (_1848)
                {
                    _1868 = _1314;
                }
                int _1882 = _1868;
                bool _1884 = _1438 == 88;
                int _1886 = _1882;
                if (_1854)
                {
                    _1862 = _1350;
                }
                int _1888 = _1862;
                bool _1890 = _1442 == 88;
                int _1892 = _1888;
                if (_1860)
                {
                    _1886 = _1316;
                }
                int _1894 = _1886;
                bool _1896 = _1494 == 28;
                int _1898 = _1894;
                if (_1866)
                {
                    _1874 = _1354;
                }
                int _1900 = _1874;
                bool _1902 = _1494 == 32;
                int _1904 = _1900;
                if (_1872)
                {
                    _1898 = _1318;
                }
                int _1906 = _1898;
                bool _1908 = _1430 == 96;
                int _1910 = _1906;
                if (_1878)
                {
                    _1910 = _1320;
                }
                int _1912 = _1910;
                bool _1914 = _1494 == 36;
                int _1916 = _1912;
                if (_1884)
                {
                    _1880 = _1352;
                }
                int _1918 = _1880;
                bool _1920 = _1494 == 40;
                int _1922 = _1918;
                if (_1890)
                {
                    _1892 = _1352;
                }
                int _1924 = _1892;
                bool _1926 = _1438 == 92;
                int _1928 = _1924;
                if (_1896)
                {
                    _1916 = _1322;
                }
                int _1930 = _1916;
                bool _1932 = _1494 == 44;
                int _1934 = _1930;
                if (_1902)
                {
                    _1934 = _1324;
                }
                int _1936 = _1934;
                bool _1938 = _1494 == 48;
                int _1940 = _1936;
                if (_1908)
                {
                    _1904 = _1356;
                }
                int _1942 = _1904;
                bool _1944 = _1438 == 96;
                int _1946 = _1942;
                if (_1914)
                {
                    _1940 = _1326;
                }
                int _1948 = _1940;
                bool _1950 = _1494 == 52;
                int _1952 = _1948;
                if (_1920)
                {
                    _1952 = _1328;
                }
                int _1954 = _1952;
                bool _1956 = _1418 >= _1942;
                int _1958 = _1954;
                if (_1926)
                {
                    _1922 = _1354;
                }
                int _1960 = _1922;
                int _1962 = _1960;
                if (_1932)
                {
                    _1958 = _1330;
                }
                int _1964 = _1958;
                bool _1966 = _1494 == 56;
                bool _1968 = _1494 == 60;
                int _1970 = _1964;
                if (_1938)
                {
                    _1970 = _1332;
                }
                int _1972 = _1970;
                bool _1974 = _1494 == 64;
                int _1976 = _1972;
                if (_1944)
                {
                    _1962 = _1356;
                }
                int _1978 = _1962;
                bool _1980 = _1442 == 92;
                _1376 = _1978;
                if (_1950)
                {
                    _1976 = _1334;
                }
                int _1982 = _1976;
                bool _1984 = _1494 == 68;
                int _1986 = _1982;
                if (!_1956)
                {
                    _1462 = _1942;
                }
                int _1988 = _1462;
                int _1990 = _1988;
                if (_1966)
                {
                    _1986 = _1336;
                }
                int _1992 = _1986;
                bool _1994 = _1494 == 72;
                int _1996 = _1992;
                if (_1968)
                {
                    _1996 = _1338;
                }
                int _1998 = _1996;
                bool _2000 = _1988 >= _1978;
                int _2002 = _1998;
                if (_1974)
                {
                    _2002 = _1340;
                }
                int _2004 = _2002;
                bool _2006 = _1442 == 96;
                int _2008 = _2004;
                if (_1980)
                {
                    _1928 = _1354;
                }
                int _2010 = _1928;
                bool _2012 = _1494 == 76;
                int _2014 = _2010;
                if (_1984)
                {
                    _2008 = _1342;
                }
                int _2016 = _2008;
                bool _2018 = _1494 == 80;
                int _2020 = _2016;
                if (_1994)
                {
                    _2020 = _1344;
                }
                int _2022 = _2020;
                bool _2024 = _1494 == 84;
                int _2026 = _2022;
                if (_2000)
                {
                    _1946 = _1988;
                }
                int _2028 = _1946;
                int _2030 = _2028;
                if (_2006)
                {
                    _2014 = _1356;
                }
                int _2032 = _2014;
                bool _2034 = _1494 == 88;
                _1378 = _2032;
                if (!_2000)
                {
                    _2030 = _1978;
                }
                int _2036 = _2030;
                int _2038 = _2036;
                if (_2012)
                {
                    _2026 = _1346;
                }
                int _2040 = _2026;
                bool _2042 = _1494 == 92;
                int _2044 = _2040;
                if (_2018)
                {
                    _2044 = _1348;
                }
                int _2046 = _2044;
                bool _2048 = _2036 >= _2032;
                int _2050 = _2046;
                if (_1956)
                {
                    _1990 = _1426;
                }
                int _2052 = _1990;
                int _2054 = _2052;
                if (_2024)
                {
                    _2050 = _1350;
                }
                int _2056 = _2050;
                bool _2058 = _1494 == 96;
                int _2060 = _2056;
                if (!_1956)
                {
                    _2054 = _1416;
                }
                int _2062 = _2054;
                int _2064 = _1416 + 4;
                _1398 = _2064;
                int _2066 = _2062;
                _1404 = _2064;
                if (_2034)
                {
                    _2060 = _1352;
                }
                int _2068 = _2060;
                int _2070 = _2068;
                if (!_2000)
                {
                    _2066 = _1432;
                }
                int _2072 = _2066;
                bool _2074 = _2064 >= _1412;
                int _2076 = _2072;
                if (_2042)
                {
                    _2070 = _1354;
                }
                int _2078 = _2070;
                int _2080 = _2078;
                if (!_2048)
                {
                    _2038 = _2032;
                }
                int _2082 = _2038;
                _1374 = _2082;
                _1382 = _2082;
                if (!_2048)
                {
                    _2076 = _1434;
                }
                int _2084 = _2076;
                int _2086 = _2084;
                if (_2058)
                {
                    _2080 = _1356;
                }
                int _2088 = _2080;
                bool _2090 = _2082 >= _2088;
                _1380 = _2088;
                if (_2090)
                {
                    _1464 = _2084;
                }
                int _2092 = _1464;
                int _2094 = _2092;
                if (_2090)
                {
                    _2086 = _2082;
                }
                int _2096 = _2086;
                int _2098 = _2096;
                if (!_2090)
                {
                    _2098 = _2088;
                }
                int _2100 = _2098;
                _1400 = _2100;
                _1406 = _2100;
                if (!_2090)
                {
                    _2094 = _1452;
                }
                int _2102 = _2094;
                _1414 = !_2074;
                _1402 = _2102;
                _1410 = _2102;
            } while (_1414);
        }
        int _2104 = _1404;
        int _2106 = _1406;
        int _2108 = _1382;
        int _2110 = _1408;
        int _2112 = _1410;
        int _2114 = -_2104;
        int _2116 = _1360 + _2114;
        bool _2118 = _2116 > 1;
        bool _2120 = !_2118;
        int _2122 = _2108;
        int _2124 = _2116;
        int _2126 = _2106;
        int _2128 = _2112;
        int _2130 = _2104;
        int _2132 = _2110;
        int _2134 = _2106;
        int _2136 = _2112;
        if (!_2120)
        {
            int _2138 = _2104 * 4;
            int _2140 = _2104 + 1;
            bool _2142 = _2138 == 0;
            int _2144 = _2140 * 4;
            bool _2146 = _2138 == 4;
            bool _2148 = _2138 == 8;
            bool _2150 = _2138 == 12;
            bool _2152 = _2138 == 24;
            bool _2154 = _2144 == 0;
            bool _2156 = _2138 == 40;
            if (_2142)
            {
                _2122 = _1308;
            }
            int _2158 = _2122;
            bool _2160 = _2138 == 16;
            int _2162 = _2158;
            if (_2146)
            {
                _2162 = _1310;
            }
            int _2164 = _2162;
            bool _2166 = _2138 == 20;
            int _2168 = _2164;
            if (_2148)
            {
                _2168 = _1312;
            }
            int _2170 = _2168;
            bool _2172 = _2138 == 36;
            int _2174 = _2170;
            if (_2150)
            {
                _2174 = _1314;
            }
            int _2176 = _2174;
            bool _2178 = _2138 == 28;
            int _2180 = _2176;
            if (_2154)
            {
                _2124 = _1308;
            }
            int _2182 = _2124;
            bool _2184 = _2144 == 16;
            int _2186 = _2182;
            if (_2160)
            {
                _2180 = _1316;
            }
            int _2188 = _2180;
            bool _2190 = _2138 == 32;
            int _2192 = _2188;
            if (_2166)
            {
                _2192 = _1318;
            }
            int _2194 = _2192;
            bool _2196 = _2138 == 48;
            int _2198 = _2194;
            if (_2152)
            {
                _2198 = _1320;
            }
            int _2200 = _2198;
            bool _2202 = _2144 == 4;
            int _2204 = _2200;
            if (_2178)
            {
                _2204 = _1322;
            }
            int _2206 = _2204;
            bool _2208 = _2138 == 44;
            int _2210 = _2206;
            if (_2190)
            {
                _2210 = _1324;
            }
            int _2212 = _2210;
            bool _2214 = _2144 == 8;
            int _2216 = _2212;
            if (_2172)
            {
                _2216 = _1326;
            }
            int _2218 = _2216;
            bool _2220 = _2144 == 12;
            int _2222 = _2218;
            if (_2202)
            {
                _2186 = _1310;
            }
            int _2224 = _2186;
            bool _2226 = _2138 == 52;
            int _2228 = _2224;
            if (_2156)
            {
                _2222 = _1328;
            }
            int _2230 = _2222;
            bool _2232 = _2144 == 20;
            int _2234 = _2230;
            if (_2208)
            {
                _2234 = _1330;
            }
            int _2236 = _2234;
            bool _2238 = _2144 == 24;
            int _2240 = _2236;
            if (_2196)
            {
                _2240 = _1332;
            }
            int _2242 = _2240;
            bool _2244 = _2138 == 60;
            int _2246 = _2242;
            if (_2214)
            {
                _2228 = _1312;
            }
            int _2248 = _2228;
            bool _2250 = _2138 == 56;
            int _2252 = _2248;
            if (_2220)
            {
                _2252 = _1314;
            }
            int _2254 = _2252;
            bool _2256 = _2144 == 28;
            int _2258 = _2254;
            if (_2184)
            {
                _2258 = _1316;
            }
            int _2260 = _2258;
            bool _2262 = _2144 == 32;
            int _2264 = _2260;
            if (_2232)
            {
                _2264 = _1318;
            }
            int _2266 = _2264;
            bool _2268 = _2144 == 36;
            int _2270 = _2266;
            if (_2226)
            {
                _2246 = _1334;
            }
            int _2272 = _2246;
            bool _2274 = _2138 == 64;
            int _2276 = _2272;
            if (_2238)
            {
                _2270 = _1320;
            }
            int _2278 = _2270;
            bool _2280 = _2138 == 68;
            int _2282 = _2278;
            if (_2250)
            {
                _2276 = _1336;
            }
            int _2284 = _2276;
            bool _2286 = _2144 == 40;
            int _2288 = _2284;
            if (_2256)
            {
                _2282 = _1322;
            }
            int _2290 = _2282;
            bool _2292 = _2138 == 72;
            int _2294 = _2290;
            if (_2244)
            {
                _2288 = _1338;
            }
            int _2296 = _2288;
            bool _2298 = _2144 == 44;
            int _2300 = _2296;
            if (_2262)
            {
                _2294 = _1324;
            }
            int _2302 = _2294;
            int _2304 = _2302;
            if (_2268)
            {
                _2304 = _1326;
            }
            int _2306 = _2304;
            int _2308 = _2306;
            if (_2274)
            {
                _2300 = _1340;
            }
            int _2310 = _2300;
            bool _2312 = _2138 == 76;
            int _2314 = _2310;
            if (_2280)
            {
                _2314 = _1342;
            }
            int _2316 = _2314;
            bool _2318 = _2138 == 80;
            bool _2320 = _2144 == 48;
            int _2322 = _2316;
            if (_2286)
            {
                _2308 = _1328;
            }
            int _2324 = _2308;
            bool _2326 = _2144 == 52;
            int _2328 = _2324;
            if (_2292)
            {
                _2322 = _1344;
            }
            int _2330 = _2322;
            bool _2332 = _2138 == 84;
            int _2334 = _2330;
            if (_2298)
            {
                _2328 = _1330;
            }
            int _2336 = _2328;
            bool _2338 = _2144 == 56;
            bool _2340 = _2144 == 60;
            int _2342 = _2336;
            if (_2312)
            {
                _2334 = _1346;
            }
            int _2344 = _2334;
            bool _2346 = _2138 == 88;
            int _2348 = _2344;
            if (_2318)
            {
                _2348 = _1348;
            }
            int _2350 = _2348;
            bool _2352 = _2138 == 92;
            int _2354 = _2350;
            if (_2320)
            {
                _2342 = _1332;
            }
            int _2356 = _2342;
            bool _2358 = _2144 == 64;
            int _2360 = _2356;
            if (_2326)
            {
                _2360 = _1334;
            }
            int _2362 = _2360;
            bool _2364 = _2144 == 68;
            int _2366 = _2362;
            if (_2332)
            {
                _2354 = _1350;
            }
            int _2368 = _2354;
            bool _2370 = _2138 == 96;
            int _2372 = _2368;
            if (_2338)
            {
                _2366 = _1336;
            }
            int _2374 = _2366;
            bool _2376 = _2144 == 72;
            int _2378 = _2374;
            if (_2340)
            {
                _2378 = _1338;
            }
            int _2380 = _2378;
            bool _2382 = _2144 == 76;
            int _2384 = _2380;
            if (_2346)
            {
                _2372 = _1352;
            }
            int _2386 = _2372;
            int _2388 = _2386;
            if (_2352)
            {
                _2388 = _1354;
            }
            int _2390 = _2388;
            bool _2392 = _2144 == 96;
            int _2394 = _2390;
            if (_2358)
            {
                _2384 = _1340;
            }
            int _2396 = _2384;
            bool _2398 = _2144 == 80;
            int _2400 = _2396;
            if (_2364)
            {
                _2400 = _1342;
            }
            int _2402 = _2400;
            bool _2404 = _2144 == 84;
            int _2406 = _2402;
            if (_2370)
            {
                _2394 = _1356;
            }
            int _2408 = _2394;
            bool _2410 = _2144 == 92;
            if (_2376)
            {
                _2406 = _1344;
            }
            int _2412 = _2406;
            bool _2414 = _2144 == 88;
            int _2416 = _2412;
            if (_2382)
            {
                _2416 = _1346;
            }
            int _2418 = _2416;
            bool _2420 = _2106 >= _2408;
            int _2422 = _2418;
            if (_2398)
            {
                _2422 = _1348;
            }
            int _2424 = _2422;
            int _2426 = _2424;
            if (_2404)
            {
                _2426 = _1350;
            }
            int _2428 = _2426;
            int _2430 = _2428;
            if (_2414)
            {
                _2430 = _1352;
            }
            int _2432 = _2430;
            int _2434 = _2432;
            _2132 = 0;
            if (_2410)
            {
                _2434 = _1354;
            }
            int _2436 = _2434;
            int _2438 = _2436;
            if (_2392)
            {
                _2438 = _1356;
            }
            int _2440 = _2438;
            if (!_2420)
            {
                _2126 = _2408;
            }
            int _2442 = _2126;
            _2134 = _2442;
            if (!_2420)
            {
                _2128 = _2104;
            }
            int _2444 = _2128;
            int _2446 = _2140 + 1;
            bool _2448 = _2442 >= _2440;
            int _2450 = _2444;
            _2130 = _2446;
            if (!_2448)
            {
                _2450 = _2140;
            }
            int _2452 = _2450;
            _2136 = _2452;
            if (!_2448)
            {
                _2134 = _2440;
            }
        }
        int _2454 = _2130;
        int _2456 = _2132;
        int _2458 = _2134;
        int _2460 = _2136;
        bool _2462 = _2454 < _1360;
        int _2464 = (_2462 ? (-1) : 0) | _2456;
        int _2466 = ~_2464;
        int _2468 = _2460;
        if (!(_2466 != 0))
        {
            int _2470 = _2454 << 2;
            bool _2472 = _2470 == 4;
            bool _2474 = _2470 == 8;
            bool _2476 = _2470 == 12;
            bool _2478 = _2470 == 16;
            if (_2472)
            {
                _1384 = _1310;
            }
            int _2480 = _1384;
            bool _2482 = _2470 == 20;
            int _2484 = _2480;
            if (_2474)
            {
                _2484 = _1312;
            }
            int _2486 = _2484;
            bool _2488 = _2470 == 24;
            int _2490 = _2486;
            if (_2476)
            {
                _2490 = _1314;
            }
            int _2492 = _2490;
            bool _2494 = _2470 == 28;
            int _2496 = _2492;
            if (_2478)
            {
                _2496 = _1316;
            }
            int _2498 = _2496;
            bool _2500 = _2470 == 32;
            int _2502 = _2498;
            if (_2482)
            {
                _2502 = _1318;
            }
            int _2504 = _2502;
            bool _2506 = _2470 == 36;
            int _2508 = _2504;
            if (_2488)
            {
                _2508 = _1320;
            }
            int _2510 = _2508;
            bool _2512 = _2470 == 40;
            int _2514 = _2510;
            if (_2494)
            {
                _2514 = _1322;
            }
            int _2516 = _2514;
            bool _2518 = _2470 == 44;
            int _2520 = _2516;
            if (_2500)
            {
                _2520 = _1324;
            }
            int _2522 = _2520;
            bool _2524 = _2470 == 48;
            int _2526 = _2522;
            if (_2506)
            {
                _2526 = _1326;
            }
            int _2528 = _2526;
            bool _2530 = _2470 == 52;
            int _2532 = _2528;
            if (_2512)
            {
                _2532 = _1328;
            }
            int _2534 = _2532;
            bool _2536 = _2470 == 56;
            int _2538 = _2534;
            if (_2518)
            {
                _2538 = _1330;
            }
            int _2540 = _2538;
            bool _2542 = _2470 == 60;
            int _2544 = _2540;
            if (_2524)
            {
                _2544 = _1332;
            }
            int _2546 = _2544;
            bool _2548 = _2470 == 64;
            int _2550 = _2546;
            if (_2530)
            {
                _2550 = _1334;
            }
            int _2552 = _2550;
            bool _2554 = _2470 == 68;
            int _2556 = _2552;
            if (_2536)
            {
                _2556 = _1336;
            }
            int _2558 = _2556;
            bool _2560 = _2470 == 72;
            int _2562 = _2558;
            if (_2542)
            {
                _2562 = _1338;
            }
            int _2564 = _2562;
            bool _2566 = _2470 == 76;
            int _2568 = _2564;
            if (_2548)
            {
                _2568 = _1340;
            }
            int _2570 = _2568;
            bool _2572 = _2470 == 80;
            int _2574 = _2570;
            if (_2554)
            {
                _2574 = _1342;
            }
            int _2576 = _2574;
            bool _2578 = _2470 == 84;
            int _2580 = _2576;
            if (_2560)
            {
                _2580 = _1344;
            }
            int _2582 = _2580;
            bool _2584 = _2470 == 88;
            int _2586 = _2582;
            if (_2566)
            {
                _2586 = _1346;
            }
            int _2588 = _2586;
            bool _2590 = _2470 == 92;
            int _2592 = _2588;
            if (_2572)
            {
                _2592 = _1348;
            }
            int _2594 = _2592;
            bool _2596 = _2470 == 96;
            int _2598 = _2594;
            if (_2578)
            {
                _2598 = _1350;
            }
            int _2600 = _2598;
            int _2602 = _2600;
            if (_2584)
            {
                _2602 = _1352;
            }
            int _2604 = _2602;
            int _2606 = _2604;
            if (_2590)
            {
                _2606 = _1354;
            }
            int _2608 = _2606;
            int _2610 = _2608;
            if (_2596)
            {
                _2610 = _1356;
            }
            int _2612 = _2610;
            bool _2614 = _2458 >= _2612;
            if (!_2614)
            {
                _2468 = _2454;
            }
        }
        int _2616 = _2468;
        _1392 = _2616;
    }
    int _2618 = _1392;
    int _2620 = _2618 * 8;
    uint _2622 = uint(int(uint(_2620) >> uint(2)));
    float _2624 = as_type<float>(_31[int(_2622)]);
    int _2626 = _2620 + 4;
    uint _2628 = uint(int(uint(_2626) >> uint(2)));
    float _2630 = as_type<float>(_31[int(_2628)]);
    int _2632 = _71 + 16;
    int _2634 = _71 + 24;
    uint _2636 = uint(int(uint(_2632) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2636)] = as_type<uint>(_2624);
    int _2638 = _2632 + 4;
    uint _2640 = uint(int(uint(_2638) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2640)] = as_type<uint>(_2630);
    uint _2642 = uint(int(uint(_2634) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2642)] = as_type<uint>(_1358);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return;
}

