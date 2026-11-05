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
void _49(thread const int& _1845, thread const int& _1846, thread const int& _1847, thread const int& _1848, thread int& _1849, thread int& _1850, thread int& _1851, thread int& _1852, thread int& _1853, thread int& _1854)
{
    float _1857 = as_type<float>(_1845) + 0.0;
    bool _1859 = _1857 != 0.0;
    bool _1861 = isnan(_1857);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan(0.0);
    bool _1867 = _1863 || _1865;
    int _1869 = _1847;
    int _1871 = _1848;
    int _1873 = 0;
    int _1875 = _1867 ? (-1) : 0;
    if (!_1867)
    {
        float _1877 = as_type<float>(_1845) * 1.0;
        _1869 = as_type<int>(_1877);
    }
    int _1879 = _1869;
    bool _1881 = !_1867;
    int _1883 = _1879;
    int _1885 = _1879;
    if (!_1881)
    {
        float _1887 = as_type<float>(_1845) + 0.0;
        bool _1889 = _1887 >= 0.0;
        bool _1891 = isnan(_1887);
        bool _1893 = _1889 || _1891;
        bool _1895 = isnan(0.0);
        bool _1897 = _1893 || _1895;
        _1875 = _1897 ? (-1) : 0;
        if (!_1897)
        {
            _1883 = 2147483647;
        }
        int _1899 = _1883;
        bool _1901 = !_1897;
        int _1903 = _1899;
        _1885 = _1899;
        if (!_1901)
        {
            float _1905 = abs(as_type<float>(_1845));
            float _1907 = _1905 + 0.0;
            bool _1909 = _1907 > as_type<float>(0x7f800000u /* inf */);
            bool _1911 = isnan(_1907);
            bool _1913 = _1909 || _1911;
            bool _1915 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1917 = _1913 || _1915;
            _1873 = 2139095040;
            _1875 = _1917 ? (-1) : 0;
            if (_1917)
            {
                float _1919 = as_type<float>(_1845) + 1.0;
                _1903 = as_type<int>(_1919);
            }
            int _1921 = _1903;
            int _1923 = _1921;
            _1885 = _1921;
            if (!_1917)
            {
                float _1925 = abs(as_type<float>(_1845));
                float _1927 = _1925 + (-0.0);
                float _1929 = 0.0 + _1927;
                bool _1931 = _1929 != as_type<float>(0x7f800000u /* inf */);
                bool _1933 = isnan(_1929);
                bool _1935 = _1931 || _1933;
                bool _1937 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1939 = _1935 || _1937;
                _1875 = _1939 ? (-1) : 0;
                if (!_1939)
                {
                    _1923 = _1845;
                }
                int _1941 = _1923;
                bool _1943 = !_1939;
                _1885 = _1941;
                if (!_1943)
                {
                    float _1945 = as_type<float>(_1845) * 18446744073709551616.0;
                    float _1947 = rsqrt(_1945);
                    float _1949 = _1945 * _1947;
                    float _1951 = _1947 * 0.5;
                    float _1953 = -_1949;
                    float _1955 = 0.0 + _1953;
                    float _1957 = fma(_1951, _1955, 0.5);
                    float _1959 = fma(_1949, _1957, _1949);
                    float _1961 = -_1959;
                    float _1963 = 0.0 + _1961;
                    float _1965 = fma(_1959, _1963, _1945);
                    float _1967 = fma(_1951, _1965, _1959);
                    float _1969 = _1967 * 2.3283064365386962890625e-10;
                    _1885 = as_type<int>(_1969);
                    _1871 = as_type<int>(_1959);
                    _1873 = as_type<int>(_1955);
                }
            }
        }
    }
    int _1971 = _1885;
    int _1973 = _1871;
    int _1975 = _1873;
    int _1977 = _1875;
    _1849 = _1846;
    _1850 = 0;
    _1851 = _1971;
    _1852 = _1973;
    _1853 = _1975;
    _1854 = _1977;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _248 = false;
    float _53 = in.m_38.x;
    float _55 = in.m_38.y;
    float2 _782 = float2(_53, _55);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_782, float2(0.0), isnan(_782))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_782, float2(0.0), isnan(_782))).xyzw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = _58.w;
    float2 _801 = float2(_53, _55);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_801, float2(0.0), isnan(_801))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_801, float2(0.0), isnan(_801))).x;
    float2 _808 = float2(_66, 0.0);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_808, float2(0.0), isnan(_808))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_808, float2(0.0), isnan(_808))).xy;
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
    float _122 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[8].x, _116);
    float _124 = fma(_112, _112, _118);
    float _126 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[7].x, _114);
    float _128 = _86 * _108;
    float _130 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[9].x, _120);
    float _132 = fma(_104, _104, _124);
    float _134 = -_84;
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[7].z, _126);
    float _138 = fma(_88, _112, _128);
    float _140 = -_84;
    float _142 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[8].z, _122);
    float _144 = sqrt(_132);
    float _146 = -_84;
    float _148 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[9].z, _130);
    float _150 = fma(_90, _104, _138);
    float _152 = _142 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _154 = _136 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _158 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _160 = _152 + _158;
    float _162 = rsqrt(_132);
    float _164 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _166 = _156 + _164;
    float _168 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _170 = _154 + _168;
    float _172 = -_144;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _160 * _160;
    float _180 = abs(_176);
    float _182 = log2(_180);
    float _184 = fma(_170, _170, _178);
    float _186 = _162 * _150;
    float _188 = fma(_166, _166, _184);
    float _190 = -_186;
    float _192 = 0.0 + _190;
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = sqrt(_188);
    float _198 = _194 + 0.001000000047497451305389404296875;
    float _200 = _182 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _202 = abs(_198);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = fma(_198, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _210 = as_type<int>(_206) + (-218103808);
    float _212 = exp2(_200);
    float _214 = fma(_198, _208, -0.212114393711090087890625);
    bool _218 = uint(_210) >= 1920991232u;
    float _220 = _196 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _222 = fma(_198, _214, 1.570728778839111328125);
    bool _224 = !_218;
    float _246;
    if (!_224)
    {
        int _226 = as_type<int>(_206);
        int _228 = 1088;
        int _230 = as_type<int>(_178);
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
    float _274 = rsqrt(_188);
    float _276 = _222 * _272;
    float _278 = _276 * 0.15915493667125701904296875;
    float _280 = _278 * 6.283185482025146484375;
    float _282 = cos(_280);
    float _284 = fma(_170, _274, 1.0);
    float _286 = _160 * _274;
    float _288 = _166 * _274;
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
    float _392 = abs(_196);
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
    float _416 = _196 * _404;
    float _418 = _328 * _402;
    float _420 = _350 * _402;
    float _422 = _398 * _402;
    float _424 = _342 * _402;
    float _426 = _196 * _412;
    float _428 = fma(_408, _414, _416);
    float _430 = -_414;
    float _432 = fma(_408, _430, _416);
    float _434 = _196 * _406;
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
    float3 _1511 = float3(_546, _548, _550);
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1511, float3(0.0), isnan(_1511)), _454);
    float _560 = _460 * _544;
    float _562 = _474 * _544;
    float _564 = _486 * _544;
    float3 _1531 = float3(_538, _540, _542);
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1531, float3(0.0), isnan(_1531)), _454);
    float3 _1540 = float3(_560, _562, _564);
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1540, float3(0.0), isnan(_1540)), _454);
    float3 _1549 = float3(_552, _554, _556);
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1549, float3(0.0), isnan(_1549)), _454);
    float _572 = in.m_40.y;
    float _574 = in.m_40.x;
    float _576 = _162 * (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _578 = precise::clamp(_576, 0.0, 1.0);
    float _580 = _104 * _162;
    float _582 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _584 = _78 + _582;
    float _586 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _588 = _80 + _586;
    float _590 = -_578;
    float _592 = fma(_590, _578, 1.0);
    float _594 = _584 * _584;
    float _596 = sqrt(_592);
    float _598 = fma(_588, _588, _594);
    float _600 = 0.0 + _596;
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = _572 * _572;
    float _606 = fma(_602, 0.5, 0.5);
    float _608 = fma(_574, _574, _604);
    float _610 = sqrt(_606);
    float _612 = _608 + 1.0;
    float _614 = rsqrt(_612);
    float _616 = _572 * _614;
    float _618 = _574 * _614;
    float _620 = _82 * _614;
    float _622 = -_616;
    float _624 = fma(_108, _162, _622);
    float _626 = -_618;
    float _628 = fma(_112, _162, _626);
    float _630 = -_620;
    float _632 = _580 + _630;
    float _634 = 0.0 + _580;
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = _624 * _624;
    float _640 = _86 * _624;
    float _642 = fma(_628, _628, _638);
    float _644 = -_88;
    float _646 = -_640;
    float _648 = fma(_644, _628, _646);
    float _650 = fma(_632, _632, _642);
    float _652 = -_90;
    float _654 = fma(_652, _632, _648);
    float _656 = rsqrt(_650);
    float _658 = -_624;
    float _660 = _616 * _658;
    float _662 = -_616;
    float _664 = _86 * _662;
    float _666 = -_618;
    float _668 = fma(_666, _628, _660);
    float _670 = -_664;
    float _672 = fma(_88, _618, _670);
    float _674 = _656 * _654;
    float _676 = precise::clamp(_674, 0.0, 1.0);
    float _678 = -_620;
    float _680 = fma(_678, _632, _668);
    float _682 = fma(_90, _620, _672);
    float _684 = -_176;
    float _686 = _684 + 1.0;
    float _688 = -_676;
    float _690 = fma(_688, _676, 1.0);
    float _692 = precise::max(_676, _610);
    float _694 = -_598;
    float _696 = fma(_694, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _698 = precise::clamp(_696, 0.0, 1.0);
    float _700 = 1.0 / _680;
    float _702 = -_186;
    float _704 = precise::min(_702, _682);
    float _706 = fma(_686, _636, _176);
    float _708 = -_692;
    float _710 = fma(_708, _692, 1.0);
    float _712 = _676 * _704;
    float _714 = _712 * 2.0;
    float _716 = _698 * _706;
    float _718 = sqrt(_690);
    float _720 = sqrt(_710);
    float _722 = _714 * _700;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = _724 * _716;
    float _728 = _76 * _726;
    float _730 = _718 * _720;
    float _732 = fma(_676, _692, _730);
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = abs(_734);
    float _738 = log2(_736);
    float _740 = _74 * _738;
    float _742 = exp2(_740);
    float _744 = _742 * _728;
    float _746 = _558 + _566;
    float _748 = _746 + _568;
    float _750 = _748 + _570;
    float _752 = _750 * 0.25;
    float _754 = _212 * _752;
    float _756 = _752 * _744;
    float _758 = _194 * _754;
    float _760 = _756 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _762 = _758 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _764 = _760 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _766 = _762 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _768 = _762 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _770 = _762 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_43.x = _766;
    out.m_43.y = _768;
    out.m_43.z = _770;
    out.m_43.w = _764;
    return out;
}

