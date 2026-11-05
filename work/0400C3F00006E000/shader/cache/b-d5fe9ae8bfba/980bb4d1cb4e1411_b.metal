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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_C [[id(2)]];
    sampler fp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texturecube<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

static inline __attribute__((always_inline))
void _49(thread const int& _1758, thread const int& _1759, thread const int& _1760, thread const int& _1761, thread int& _1762, thread int& _1763, thread int& _1764, thread int& _1765, thread int& _1766, thread int& _1767)
{
    float _1770 = as_type<float>(_1758) + 0.0;
    bool _1772 = _1770 != 0.0;
    bool _1774 = isnan(_1770);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan(0.0);
    bool _1780 = _1776 || _1778;
    int _1782 = _1760;
    int _1784 = _1761;
    int _1786 = 0;
    int _1788 = _1780 ? (-1) : 0;
    if (!_1780)
    {
        float _1790 = as_type<float>(_1758) * 1.0;
        _1782 = as_type<int>(_1790);
    }
    int _1792 = _1782;
    bool _1794 = !_1780;
    int _1796 = _1792;
    int _1798 = _1792;
    if (!_1794)
    {
        float _1800 = as_type<float>(_1758) + 0.0;
        bool _1802 = _1800 >= 0.0;
        bool _1804 = isnan(_1800);
        bool _1806 = _1802 || _1804;
        bool _1808 = isnan(0.0);
        bool _1810 = _1806 || _1808;
        _1788 = _1810 ? (-1) : 0;
        if (!_1810)
        {
            _1796 = 2147483647;
        }
        int _1812 = _1796;
        bool _1814 = !_1810;
        int _1816 = _1812;
        _1798 = _1812;
        if (!_1814)
        {
            float _1818 = abs(as_type<float>(_1758));
            float _1820 = _1818 + 0.0;
            bool _1822 = _1820 > as_type<float>(0x7f800000u /* inf */);
            bool _1824 = isnan(_1820);
            bool _1826 = _1822 || _1824;
            bool _1828 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1830 = _1826 || _1828;
            _1786 = 2139095040;
            _1788 = _1830 ? (-1) : 0;
            if (_1830)
            {
                float _1832 = as_type<float>(_1758) + 1.0;
                _1816 = as_type<int>(_1832);
            }
            int _1834 = _1816;
            int _1836 = _1834;
            _1798 = _1834;
            if (!_1830)
            {
                float _1838 = abs(as_type<float>(_1758));
                float _1840 = _1838 + (-0.0);
                float _1842 = 0.0 + _1840;
                bool _1844 = _1842 != as_type<float>(0x7f800000u /* inf */);
                bool _1846 = isnan(_1842);
                bool _1848 = _1844 || _1846;
                bool _1850 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1852 = _1848 || _1850;
                _1788 = _1852 ? (-1) : 0;
                if (!_1852)
                {
                    _1836 = _1758;
                }
                int _1854 = _1836;
                bool _1856 = !_1852;
                _1798 = _1854;
                if (!_1856)
                {
                    float _1858 = as_type<float>(_1758) * 18446744073709551616.0;
                    float _1860 = rsqrt(_1858);
                    float _1862 = _1858 * _1860;
                    float _1864 = _1860 * 0.5;
                    float _1866 = -_1862;
                    float _1868 = 0.0 + _1866;
                    float _1870 = fma(_1864, _1868, 0.5);
                    float _1872 = fma(_1862, _1870, _1862);
                    float _1874 = -_1872;
                    float _1876 = 0.0 + _1874;
                    float _1878 = fma(_1872, _1876, _1858);
                    float _1880 = fma(_1864, _1878, _1872);
                    float _1882 = _1880 * 2.3283064365386962890625e-10;
                    _1798 = as_type<int>(_1882);
                    _1784 = as_type<int>(_1872);
                    _1786 = as_type<int>(_1868);
                }
            }
        }
    }
    int _1884 = _1798;
    int _1886 = _1784;
    int _1888 = _1786;
    int _1890 = _1788;
    _1762 = _1759;
    _1763 = 0;
    _1764 = _1884;
    _1765 = _1886;
    _1766 = _1888;
    _1767 = _1890;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _248 = false;
    float _53 = in.m_38.x;
    float _55 = in.m_38.y;
    float2 _744 = float2(_53, _55);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_744, float2(0.0), isnan(_744))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_744, float2(0.0), isnan(_744))).xyzw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = _58.w;
    float2 _763 = float2(_53, _55);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_763, float2(0.0), isnan(_763))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_763, float2(0.0), isnan(_763))).x;
    float2 _770 = float2(_66, 0.0);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_770, float2(0.0), isnan(_770))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_770, float2(0.0), isnan(_770))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_40.x;
    float _82 = in.m_40.z;
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _86 = fma(_62, 2.0, -1.0);
    float _88 = fma(_60, 2.0, -1.0);
    float _90 = fma(_64, 2.0, -1.0);
    float _92 = -_84;
    float _94 = _78 * _92;
    float _96 = -_84;
    float _98 = _80 * _96;
    float _100 = -_84;
    float _102 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _104 = fma(_82, _100, _102);
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _108 = _94 + _106;
    float _110 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _112 = _98 + _110;
    float _114 = _94 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _116 = _94 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _118 = _108 * _108;
    float _120 = _94 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _122 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[7].x, _114);
    float _124 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[8].x, _116);
    float _126 = fma(_112, _112, _118);
    float _128 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[9].x, _120);
    float _130 = -_84;
    float _132 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[7].z, _122);
    float _134 = fma(_104, _104, _126);
    float _136 = _86 * _108;
    float _138 = -_84;
    float _140 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[8].z, _124);
    float _142 = -_84;
    float _144 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[9].z, _128);
    float _146 = sqrt(_134);
    float _148 = _132 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _150 = _140 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _154 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _156 = _148 + _154;
    float _158 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _160 = _150 + _158;
    float _162 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _164 = _152 + _162;
    float _166 = rsqrt(_134);
    float _168 = _160 * _160;
    float _170 = fma(_156, _156, _168);
    float _172 = -_146;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = fma(_88, _112, _136);
    float _180 = fma(_164, _164, _170);
    float _182 = abs(_176);
    float _184 = log2(_182);
    float _186 = fma(_90, _104, _178);
    float _188 = _166 * _186;
    float _190 = sqrt(_180);
    float _192 = -_188;
    float _194 = 0.0 + _192;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _196 + 0.001000000047497451305389404296875;
    float _200 = _184 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _202 = abs(_198);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = fma(_198, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _210 = as_type<int>(_206) + (-218103808);
    float _212 = exp2(_200);
    float _214 = fma(_198, _208, -0.212114393711090087890625);
    bool _218 = uint(_210) >= 1920991232u;
    float _220 = _190 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _222 = fma(_198, _214, 1.570728778839111328125);
    bool _224 = !_218;
    float _246;
    if (!_224)
    {
        int _226 = as_type<int>(_206);
        int _228 = 1088;
        int _230 = 0;
        int _232 = 0;
        int _234;
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        _49(_226, _228, _230, _232, _234, _236, _238, _240, _242, _244);
        _246 = as_type<float>(_238);
        _248 = true;
    }
    else
    {
        float _250 = rsqrt(_206);
        float _252 = _206 * _250;
        float _254 = _250 * 0.5;
        float _256 = -_252;
        float _258 = 0.0 + _256;
        float _260 = fma(_254, _258, 0.5);
        float _262 = fma(_252, _260, _252);
        float _264 = -_262;
        float _266 = 0.0 + _264;
        float _268 = fma(_262, _266, _206);
        float _270 = fma(_254, _268, _262);
        _246 = _270;
    }
    _248 = false;
    float _272 = _246;
    float _274 = rsqrt(_180);
    float _276 = _222 * _272;
    float _278 = _276 * 0.15915493667125701904296875;
    float _280 = _278 * 6.283185482025146484375;
    float _282 = cos(_280);
    float _284 = fma(_156, _274, 1.0);
    float _286 = _160 * _274;
    float _288 = _164 * _274;
    float _290 = _278 * 6.283185482025146484375;
    float _292 = sin(_290);
    float _294 = -_286;
    float _296 = _286 * _294;
    float _298 = -_288;
    float _300 = _286 * _298;
    float _302 = -_288;
    float _304 = _288 * _302;
    float _306 = 1.0 / _284;
    float _308 = _296 + _304;
    float _310 = 1.0 / _282;
    float _312 = _300 * _306;
    float _314 = fma(_304, _306, 1.0);
    float _316 = fma(_296, _306, 1.0);
    float _318 = fma(_308, _306, 1.0);
    float _320 = _288 * _312;
    float _322 = _312 * _312;
    float _324 = _288 * _316;
    float _326 = -_304;
    float _328 = fma(_318, _314, _326);
    float _330 = -_320;
    float _332 = fma(_286, _314, _330);
    float _334 = -_322;
    float _336 = fma(_316, _314, _334);
    float _338 = _292 * _310;
    float _340 = -_296;
    float _342 = fma(_318, _316, _340);
    float _344 = -_332;
    float _346 = _286 * _344;
    float _348 = -_324;
    float _350 = fma(_286, _312, _348);
    float _352 = -_316;
    float _354 = _288 * _352;
    float _356 = -_314;
    float _358 = _286 * _356;
    float _360 = -_346;
    float _362 = fma(_318, _336, _360);
    float _364 = _312 * _318;
    float _366 = -_286;
    float _368 = -_354;
    float _370 = fma(_366, _312, _368);
    float _372 = -_286;
    float _374 = fma(_372, _314, _320);
    float _376 = -_288;
    float _378 = fma(_376, _350, _362);
    float _380 = -_288;
    float _382 = -_358;
    float _384 = fma(_380, _312, _382);
    float _386 = -_288;
    float _388 = -_364;
    float _390 = fma(_286, _386, _388);
    float _392 = abs(_190);
    float _394 = _392 * 2.0;
    float _396 = -_364;
    float _398 = _300 + _396;
    float _400 = _338 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _402 = 1.0 / _378;
    float _404 = _336 * _402;
    float _406 = _370 * _402;
    float _408 = _374 * _402;
    float _410 = _390 * _402;
    float _412 = _384 * _402;
    float _414 = _394 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _416 = _190 * _404;
    float _418 = _328 * _402;
    float _420 = _350 * _402;
    float _422 = _398 * _402;
    float _424 = _342 * _402;
    float _426 = _190 * _412;
    float _428 = fma(_408, _414, _416);
    float _430 = -_414;
    float _432 = fma(_408, _430, _416);
    float _434 = _190 * _406;
    float _436 = precise::max(_400, 0.001000000047497451305389404296875);
    float _438 = _394 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _440 = fma(_418, _414, _426);
    float _442 = -_414;
    float _444 = fma(_418, _442, _426);
    float _446 = fma(_410, _414, _434);
    float _448 = -_414;
    float _450 = fma(_410, _448, _434);
    float _452 = -_220;
    float _454 = fma(_452, _436, _220);
    float _456 = fma(_420, _438, _428);
    float _458 = -_438;
    float _460 = fma(_420, _458, _428);
    float _462 = fma(_420, _438, _432);
    float _464 = -_438;
    float _466 = fma(_420, _464, _432);
    float _468 = fma(_422, _438, _440);
    float _470 = fma(_422, _438, _444);
    float _472 = -_438;
    float _474 = fma(_422, _472, _440);
    float _476 = -_438;
    float _478 = fma(_422, _476, _444);
    float _480 = fma(_424, _438, _446);
    float _482 = fma(_424, _438, _450);
    float _484 = -_438;
    float _486 = fma(_424, _484, _446);
    float _488 = abs(_462);
    float _490 = abs(_470);
    float _492 = precise::max(_488, _490);
    float _494 = -_438;
    float _496 = fma(_424, _494, _450);
    float _498 = abs(_466);
    float _500 = abs(_478);
    float _502 = precise::max(_498, _500);
    float _504 = abs(_456);
    float _506 = abs(_468);
    float _508 = precise::max(_504, _506);
    float _510 = abs(_460);
    float _512 = abs(_474);
    float _514 = precise::max(_510, _512);
    float _516 = abs(_482);
    float _518 = precise::max(_516, _492);
    float _520 = abs(_496);
    float _522 = precise::max(_520, _502);
    float _524 = abs(_480);
    float _526 = precise::max(_524, _508);
    float _528 = abs(_486);
    float _530 = precise::max(_528, _514);
    float _532 = 1.0 / _518;
    float _534 = 1.0 / _526;
    float _536 = 1.0 / _522;
    float _538 = _462 * _532;
    float _540 = _470 * _532;
    float _542 = _482 * _532;
    float _544 = 1.0 / _530;
    float _546 = _456 * _534;
    float _548 = _468 * _534;
    float _550 = _480 * _534;
    float _552 = _466 * _536;
    float _554 = _478 * _536;
    float _556 = _496 * _536;
    float3 _1471 = float3(_546, _548, _550);
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1471, float3(0.0), isnan(_1471)), _454);
    float _560 = _460 * _544;
    float _562 = _474 * _544;
    float _564 = _486 * _544;
    float3 _1491 = float3(_538, _540, _542);
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1491, float3(0.0), isnan(_1491)), _454);
    float3 _1500 = float3(_560, _562, _564);
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1500, float3(0.0), isnan(_1500)), _454);
    float3 _1509 = float3(_552, _554, _556);
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1509, float3(0.0), isnan(_1509)), _454);
    float _572 = in.m_40.y;
    float _574 = in.m_40.x;
    float _576 = _104 * _166;
    float _578 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _580 = _78 + _578;
    float _582 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _584 = _80 + _582;
    float _586 = _580 * _580;
    float _588 = fma(_584, _584, _586);
    float _590 = _572 * _572;
    float _592 = fma(_574, _574, _590);
    float _594 = _592 + 1.0;
    float _596 = rsqrt(_594);
    float _598 = _572 * _596;
    float _600 = _574 * _596;
    float _602 = _82 * _596;
    float _604 = -_598;
    float _606 = fma(_108, _166, _604);
    float _608 = -_600;
    float _610 = fma(_112, _166, _608);
    float _612 = _606 * _606;
    float _614 = -_602;
    float _616 = _576 + _614;
    float _618 = _86 * _606;
    float _620 = -_606;
    float _622 = _598 * _620;
    float _624 = fma(_610, _610, _612);
    float _626 = -_598;
    float _628 = _86 * _626;
    float _630 = -_88;
    float _632 = -_618;
    float _634 = fma(_630, _610, _632);
    float _636 = -_600;
    float _638 = fma(_636, _610, _622);
    float _640 = fma(_616, _616, _624);
    float _642 = -_628;
    float _644 = fma(_88, _600, _642);
    float _646 = -_90;
    float _648 = fma(_646, _616, _634);
    float _650 = -_602;
    float _652 = fma(_650, _616, _638);
    float _654 = rsqrt(_640);
    float _656 = fma(_90, _602, _644);
    float _658 = -_176;
    float _660 = _658 + 1.0;
    float _662 = 0.0 + _576;
    float _664 = precise::clamp(_662, 0.0, 1.0);
    float _666 = -_188;
    float _668 = precise::min(_666, _656);
    float _670 = -_588;
    float _672 = fma(_670, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _674 = precise::clamp(_672, 0.0, 1.0);
    float _676 = 1.0 / _652;
    float _678 = fma(_660, _664, _176);
    float _680 = _674 * _678;
    float _682 = _654 * _648;
    float _684 = precise::clamp(_682, 0.0, 1.0);
    float _686 = abs(_684);
    float _688 = log2(_686);
    float _690 = _684 * _668;
    float _692 = _690 * 2.0;
    float _694 = _692 * _676;
    float _696 = precise::clamp(_694, 0.0, 1.0);
    float _698 = _696 * _680;
    float _700 = _76 * _698;
    float _702 = _74 * _688;
    float _704 = exp2(_702);
    float _706 = _704 * _700;
    float _708 = _558 + _566;
    float _710 = _708 + _568;
    float _712 = _710 + _570;
    float _714 = _712 * 0.25;
    float _716 = _212 * _714;
    float _718 = _714 * _706;
    float _720 = _196 * _716;
    float _722 = _718 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _724 = _720 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _726 = _722 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _728 = _724 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _730 = _724 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _732 = _724 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_43.x = _728;
    out.m_43.y = _730;
    out.m_43.z = _732;
    out.m_43.w = _726;
    return out;
}

