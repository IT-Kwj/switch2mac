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
    float4 m_45 [[color(1)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

static inline __attribute__((always_inline))
void _51(thread const int& _1763, thread const int& _1764, thread const int& _1765, thread const int& _1766, thread int& _1767, thread int& _1768, thread int& _1769, thread int& _1770, thread int& _1771, thread int& _1772)
{
    float _1775 = as_type<float>(_1763) + 0.0;
    bool _1777 = _1775 != 0.0;
    bool _1779 = isnan(_1775);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan(0.0);
    bool _1785 = _1781 || _1783;
    int _1787 = _1765;
    int _1789 = _1766;
    int _1791 = 0;
    int _1793 = _1785 ? (-1) : 0;
    if (!_1785)
    {
        float _1795 = as_type<float>(_1763) * 1.0;
        _1787 = as_type<int>(_1795);
    }
    int _1797 = _1787;
    bool _1799 = !_1785;
    int _1801 = _1797;
    int _1803 = _1797;
    if (!_1799)
    {
        float _1805 = as_type<float>(_1763) + 0.0;
        bool _1807 = _1805 >= 0.0;
        bool _1809 = isnan(_1805);
        bool _1811 = _1807 || _1809;
        bool _1813 = isnan(0.0);
        bool _1815 = _1811 || _1813;
        _1793 = _1815 ? (-1) : 0;
        if (!_1815)
        {
            _1801 = 2147483647;
        }
        int _1817 = _1801;
        bool _1819 = !_1815;
        int _1821 = _1817;
        _1803 = _1817;
        if (!_1819)
        {
            float _1823 = abs(as_type<float>(_1763));
            float _1825 = _1823 + 0.0;
            bool _1827 = _1825 > as_type<float>(0x7f800000u /* inf */);
            bool _1829 = isnan(_1825);
            bool _1831 = _1827 || _1829;
            bool _1833 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1835 = _1831 || _1833;
            _1791 = 2139095040;
            _1793 = _1835 ? (-1) : 0;
            if (_1835)
            {
                float _1837 = as_type<float>(_1763) + 1.0;
                _1821 = as_type<int>(_1837);
            }
            int _1839 = _1821;
            int _1841 = _1839;
            _1803 = _1839;
            if (!_1835)
            {
                float _1843 = abs(as_type<float>(_1763));
                float _1845 = _1843 + (-0.0);
                float _1847 = 0.0 + _1845;
                bool _1849 = _1847 != as_type<float>(0x7f800000u /* inf */);
                bool _1851 = isnan(_1847);
                bool _1853 = _1849 || _1851;
                bool _1855 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1857 = _1853 || _1855;
                _1793 = _1857 ? (-1) : 0;
                if (!_1857)
                {
                    _1841 = _1763;
                }
                int _1859 = _1841;
                bool _1861 = !_1857;
                _1803 = _1859;
                if (!_1861)
                {
                    float _1863 = as_type<float>(_1763) * 18446744073709551616.0;
                    float _1865 = rsqrt(_1863);
                    float _1867 = _1863 * _1865;
                    float _1869 = _1865 * 0.5;
                    float _1871 = -_1867;
                    float _1873 = 0.0 + _1871;
                    float _1875 = fma(_1869, _1873, 0.5);
                    float _1877 = fma(_1867, _1875, _1867);
                    float _1879 = -_1877;
                    float _1881 = 0.0 + _1879;
                    float _1883 = fma(_1877, _1881, _1863);
                    float _1885 = fma(_1869, _1883, _1877);
                    float _1887 = _1885 * 2.3283064365386962890625e-10;
                    _1803 = as_type<int>(_1887);
                    _1789 = as_type<int>(_1877);
                    _1791 = as_type<int>(_1873);
                }
            }
        }
    }
    int _1889 = _1803;
    int _1891 = _1789;
    int _1893 = _1791;
    int _1895 = _1793;
    _1767 = _1764;
    _1768 = 0;
    _1769 = _1889;
    _1770 = _1891;
    _1771 = _1893;
    _1772 = _1895;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _250 = false;
    float _55 = in.m_38.x;
    float _57 = in.m_38.y;
    float2 _746 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_746, float2(0.0), isnan(_746))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float2 _765 = float2(_55, _57);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_765, float2(0.0), isnan(_765))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_765, float2(0.0), isnan(_765))).x;
    float2 _772 = float2(_68, 0.0);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_772, float2(0.0), isnan(_772))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_772, float2(0.0), isnan(_772))).xy;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = in.m_40.y;
    float _82 = in.m_40.x;
    float _84 = in.m_40.z;
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _88 = fma(_64, 2.0, -1.0);
    float _90 = fma(_62, 2.0, -1.0);
    float _92 = fma(_66, 2.0, -1.0);
    float _94 = -_86;
    float _96 = _80 * _94;
    float _98 = -_86;
    float _100 = _82 * _98;
    float _102 = -_86;
    float _104 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _106 = fma(_84, _102, _104);
    float _108 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _110 = _96 + _108;
    float _112 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _114 = _100 + _112;
    float _116 = _96 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _118 = _96 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _120 = _110 * _110;
    float _122 = _96 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _124 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[7].x, _116);
    float _126 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[8].x, _118);
    float _128 = fma(_114, _114, _120);
    float _130 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[9].x, _122);
    float _132 = -_86;
    float _134 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[7].z, _124);
    float _136 = fma(_106, _106, _128);
    float _138 = _88 * _110;
    float _140 = -_86;
    float _142 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[8].z, _126);
    float _144 = -_86;
    float _146 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[9].z, _130);
    float _148 = sqrt(_136);
    float _150 = _134 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _152 = _142 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _156 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _158 = _150 + _156;
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _162 = _152 + _160;
    float _164 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _166 = _154 + _164;
    float _168 = rsqrt(_136);
    float _170 = _162 * _162;
    float _172 = fma(_158, _158, _170);
    float _174 = -_148;
    float _176 = fma(_174, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = fma(_90, _114, _138);
    float _182 = fma(_166, _166, _172);
    float _184 = abs(_178);
    float _186 = log2(_184);
    float _188 = fma(_92, _106, _180);
    float _190 = _168 * _188;
    float _192 = sqrt(_182);
    float _194 = -_190;
    float _196 = 0.0 + _194;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _198 + 0.001000000047497451305389404296875;
    float _202 = _186 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _204 = abs(_200);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = fma(_200, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _212 = as_type<int>(_208) + (-218103808);
    float _214 = exp2(_202);
    float _216 = fma(_200, _210, -0.212114393711090087890625);
    bool _220 = uint(_212) >= 1920991232u;
    float _222 = _192 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _224 = fma(_200, _216, 1.570728778839111328125);
    bool _226 = !_220;
    float _248;
    if (!_226)
    {
        int _228 = as_type<int>(_208);
        int _230 = 1088;
        int _232 = 0;
        int _234 = 0;
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        int _246;
        _51(_228, _230, _232, _234, _236, _238, _240, _242, _244, _246);
        _248 = as_type<float>(_240);
        _250 = true;
    }
    else
    {
        float _252 = rsqrt(_208);
        float _254 = _208 * _252;
        float _256 = _252 * 0.5;
        float _258 = -_254;
        float _260 = 0.0 + _258;
        float _262 = fma(_256, _260, 0.5);
        float _264 = fma(_254, _262, _254);
        float _266 = -_264;
        float _268 = 0.0 + _266;
        float _270 = fma(_264, _268, _208);
        float _272 = fma(_256, _270, _264);
        _248 = _272;
    }
    _250 = false;
    float _274 = _248;
    float _276 = rsqrt(_182);
    float _278 = _224 * _274;
    float _280 = _278 * 0.15915493667125701904296875;
    float _282 = _280 * 6.283185482025146484375;
    float _284 = cos(_282);
    float _286 = fma(_158, _276, 1.0);
    float _288 = _162 * _276;
    float _290 = _166 * _276;
    float _292 = _280 * 6.283185482025146484375;
    float _294 = sin(_292);
    float _296 = -_288;
    float _298 = _288 * _296;
    float _300 = -_290;
    float _302 = _288 * _300;
    float _304 = -_290;
    float _306 = _290 * _304;
    float _308 = 1.0 / _286;
    float _310 = _298 + _306;
    float _312 = 1.0 / _284;
    float _314 = _302 * _308;
    float _316 = fma(_306, _308, 1.0);
    float _318 = fma(_298, _308, 1.0);
    float _320 = fma(_310, _308, 1.0);
    float _322 = _290 * _314;
    float _324 = _314 * _314;
    float _326 = _290 * _318;
    float _328 = -_306;
    float _330 = fma(_320, _316, _328);
    float _332 = -_322;
    float _334 = fma(_288, _316, _332);
    float _336 = -_324;
    float _338 = fma(_318, _316, _336);
    float _340 = _294 * _312;
    float _342 = -_298;
    float _344 = fma(_320, _318, _342);
    float _346 = -_334;
    float _348 = _288 * _346;
    float _350 = -_326;
    float _352 = fma(_288, _314, _350);
    float _354 = -_318;
    float _356 = _290 * _354;
    float _358 = -_316;
    float _360 = _288 * _358;
    float _362 = -_348;
    float _364 = fma(_320, _338, _362);
    float _366 = _314 * _320;
    float _368 = -_288;
    float _370 = -_356;
    float _372 = fma(_368, _314, _370);
    float _374 = -_288;
    float _376 = fma(_374, _316, _322);
    float _378 = -_290;
    float _380 = fma(_378, _352, _364);
    float _382 = -_290;
    float _384 = -_360;
    float _386 = fma(_382, _314, _384);
    float _388 = -_290;
    float _390 = -_366;
    float _392 = fma(_288, _388, _390);
    float _394 = abs(_192);
    float _396 = _394 * 2.0;
    float _398 = -_366;
    float _400 = _302 + _398;
    float _402 = _340 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _404 = 1.0 / _380;
    float _406 = _338 * _404;
    float _408 = _372 * _404;
    float _410 = _376 * _404;
    float _412 = _392 * _404;
    float _414 = _386 * _404;
    float _416 = _396 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _418 = _192 * _406;
    float _420 = _330 * _404;
    float _422 = _352 * _404;
    float _424 = _400 * _404;
    float _426 = _344 * _404;
    float _428 = _192 * _414;
    float _430 = fma(_410, _416, _418);
    float _432 = -_416;
    float _434 = fma(_410, _432, _418);
    float _436 = _192 * _408;
    float _438 = precise::max(_402, 0.001000000047497451305389404296875);
    float _440 = _396 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _442 = fma(_420, _416, _428);
    float _444 = -_416;
    float _446 = fma(_420, _444, _428);
    float _448 = fma(_412, _416, _436);
    float _450 = -_416;
    float _452 = fma(_412, _450, _436);
    float _454 = -_222;
    float _456 = fma(_454, _438, _222);
    float _458 = fma(_422, _440, _430);
    float _460 = -_440;
    float _462 = fma(_422, _460, _430);
    float _464 = fma(_422, _440, _434);
    float _466 = -_440;
    float _468 = fma(_422, _466, _434);
    float _470 = fma(_424, _440, _442);
    float _472 = fma(_424, _440, _446);
    float _474 = -_440;
    float _476 = fma(_424, _474, _442);
    float _478 = -_440;
    float _480 = fma(_424, _478, _446);
    float _482 = fma(_426, _440, _448);
    float _484 = fma(_426, _440, _452);
    float _486 = -_440;
    float _488 = fma(_426, _486, _448);
    float _490 = abs(_464);
    float _492 = abs(_472);
    float _494 = precise::max(_490, _492);
    float _496 = -_440;
    float _498 = fma(_426, _496, _452);
    float _500 = abs(_468);
    float _502 = abs(_480);
    float _504 = precise::max(_500, _502);
    float _506 = abs(_458);
    float _508 = abs(_470);
    float _510 = precise::max(_506, _508);
    float _512 = abs(_462);
    float _514 = abs(_476);
    float _516 = precise::max(_512, _514);
    float _518 = abs(_484);
    float _520 = precise::max(_518, _494);
    float _522 = abs(_498);
    float _524 = precise::max(_522, _504);
    float _526 = abs(_482);
    float _528 = precise::max(_526, _510);
    float _530 = abs(_488);
    float _532 = precise::max(_530, _516);
    float _534 = 1.0 / _520;
    float _536 = 1.0 / _528;
    float _538 = 1.0 / _524;
    float _540 = _464 * _534;
    float _542 = _472 * _534;
    float _544 = _484 * _534;
    float _546 = 1.0 / _532;
    float _548 = _458 * _536;
    float _550 = _470 * _536;
    float _552 = _482 * _536;
    float _554 = _468 * _538;
    float _556 = _480 * _538;
    float _558 = _498 * _538;
    float3 _1473 = float3(_548, _550, _552);
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1473, float3(0.0), isnan(_1473)), _456);
    float _562 = _462 * _546;
    float _564 = _476 * _546;
    float _566 = _488 * _546;
    float3 _1493 = float3(_540, _542, _544);
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1493, float3(0.0), isnan(_1493)), _456);
    float3 _1502 = float3(_562, _564, _566);
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1502, float3(0.0), isnan(_1502)), _456);
    float3 _1511 = float3(_554, _556, _558);
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1511, float3(0.0), isnan(_1511)), _456);
    float _574 = in.m_40.y;
    float _576 = in.m_40.x;
    float _578 = _106 * _168;
    float _580 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _582 = _80 + _580;
    float _584 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _586 = _82 + _584;
    float _588 = _582 * _582;
    float _590 = fma(_586, _586, _588);
    float _592 = _574 * _574;
    float _594 = fma(_576, _576, _592);
    float _596 = _594 + 1.0;
    float _598 = rsqrt(_596);
    float _600 = _574 * _598;
    float _602 = _576 * _598;
    float _604 = _84 * _598;
    float _606 = -_600;
    float _608 = fma(_110, _168, _606);
    float _610 = -_602;
    float _612 = fma(_114, _168, _610);
    float _614 = _608 * _608;
    float _616 = -_604;
    float _618 = _578 + _616;
    float _620 = _88 * _608;
    float _622 = -_608;
    float _624 = _600 * _622;
    float _626 = fma(_612, _612, _614);
    float _628 = -_600;
    float _630 = _88 * _628;
    float _632 = -_90;
    float _634 = -_620;
    float _636 = fma(_632, _612, _634);
    float _638 = -_602;
    float _640 = fma(_638, _612, _624);
    float _642 = fma(_618, _618, _626);
    float _644 = -_630;
    float _646 = fma(_90, _602, _644);
    float _648 = -_92;
    float _650 = fma(_648, _618, _636);
    float _652 = -_604;
    float _654 = fma(_652, _618, _640);
    float _656 = rsqrt(_642);
    float _658 = fma(_92, _604, _646);
    float _660 = -_178;
    float _662 = _660 + 1.0;
    float _664 = 0.0 + _578;
    float _666 = precise::clamp(_664, 0.0, 1.0);
    float _668 = -_190;
    float _670 = precise::min(_668, _658);
    float _672 = -_590;
    float _674 = fma(_672, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _676 = precise::clamp(_674, 0.0, 1.0);
    float _678 = 1.0 / _654;
    float _680 = fma(_662, _666, _178);
    float _682 = _676 * _680;
    float _684 = _656 * _650;
    float _686 = precise::clamp(_684, 0.0, 1.0);
    float _688 = abs(_686);
    float _690 = log2(_688);
    float _692 = _686 * _670;
    float _694 = _692 * 2.0;
    float _696 = _694 * _678;
    float _698 = precise::clamp(_696, 0.0, 1.0);
    float _700 = _698 * _682;
    float _702 = _78 * _700;
    float _704 = _76 * _690;
    float _706 = exp2(_704);
    float _708 = _706 * _702;
    float _710 = _560 + _568;
    float _712 = _710 + _570;
    float _714 = _712 + _572;
    float _716 = _714 * 0.25;
    float _718 = _214 * _716;
    float _720 = _716 * _708;
    float _722 = _198 * _718;
    float _724 = _720 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _726 = _720 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _728 = _720 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _730 = _722 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _732 = _722 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _734 = _722 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_43.x = _730;
    out.m_43.y = _732;
    out.m_43.z = _734;
    out.m_45.x = _724;
    out.m_45.y = _726;
    out.m_45.z = _728;
    return out;
}

