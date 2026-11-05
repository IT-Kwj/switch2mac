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
void _51(thread const int& _1850, thread const int& _1851, thread const int& _1852, thread const int& _1853, thread int& _1854, thread int& _1855, thread int& _1856, thread int& _1857, thread int& _1858, thread int& _1859)
{
    float _1862 = as_type<float>(_1850) + 0.0;
    bool _1864 = _1862 != 0.0;
    bool _1866 = isnan(_1862);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan(0.0);
    bool _1872 = _1868 || _1870;
    int _1874 = _1852;
    int _1876 = _1853;
    int _1878 = 0;
    int _1880 = _1872 ? (-1) : 0;
    if (!_1872)
    {
        float _1882 = as_type<float>(_1850) * 1.0;
        _1874 = as_type<int>(_1882);
    }
    int _1884 = _1874;
    bool _1886 = !_1872;
    int _1888 = _1884;
    int _1890 = _1884;
    if (!_1886)
    {
        float _1892 = as_type<float>(_1850) + 0.0;
        bool _1894 = _1892 >= 0.0;
        bool _1896 = isnan(_1892);
        bool _1898 = _1894 || _1896;
        bool _1900 = isnan(0.0);
        bool _1902 = _1898 || _1900;
        _1880 = _1902 ? (-1) : 0;
        if (!_1902)
        {
            _1888 = 2147483647;
        }
        int _1904 = _1888;
        bool _1906 = !_1902;
        int _1908 = _1904;
        _1890 = _1904;
        if (!_1906)
        {
            float _1910 = abs(as_type<float>(_1850));
            float _1912 = _1910 + 0.0;
            bool _1914 = _1912 > as_type<float>(0x7f800000u /* inf */);
            bool _1916 = isnan(_1912);
            bool _1918 = _1914 || _1916;
            bool _1920 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1922 = _1918 || _1920;
            _1878 = 2139095040;
            _1880 = _1922 ? (-1) : 0;
            if (_1922)
            {
                float _1924 = as_type<float>(_1850) + 1.0;
                _1908 = as_type<int>(_1924);
            }
            int _1926 = _1908;
            int _1928 = _1926;
            _1890 = _1926;
            if (!_1922)
            {
                float _1930 = abs(as_type<float>(_1850));
                float _1932 = _1930 + (-0.0);
                float _1934 = 0.0 + _1932;
                bool _1936 = _1934 != as_type<float>(0x7f800000u /* inf */);
                bool _1938 = isnan(_1934);
                bool _1940 = _1936 || _1938;
                bool _1942 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1944 = _1940 || _1942;
                _1880 = _1944 ? (-1) : 0;
                if (!_1944)
                {
                    _1928 = _1850;
                }
                int _1946 = _1928;
                bool _1948 = !_1944;
                _1890 = _1946;
                if (!_1948)
                {
                    float _1950 = as_type<float>(_1850) * 18446744073709551616.0;
                    float _1952 = rsqrt(_1950);
                    float _1954 = _1950 * _1952;
                    float _1956 = _1952 * 0.5;
                    float _1958 = -_1954;
                    float _1960 = 0.0 + _1958;
                    float _1962 = fma(_1956, _1960, 0.5);
                    float _1964 = fma(_1954, _1962, _1954);
                    float _1966 = -_1964;
                    float _1968 = 0.0 + _1966;
                    float _1970 = fma(_1964, _1968, _1950);
                    float _1972 = fma(_1956, _1970, _1964);
                    float _1974 = _1972 * 2.3283064365386962890625e-10;
                    _1890 = as_type<int>(_1974);
                    _1876 = as_type<int>(_1964);
                    _1878 = as_type<int>(_1960);
                }
            }
        }
    }
    int _1976 = _1890;
    int _1978 = _1876;
    int _1980 = _1878;
    int _1982 = _1880;
    _1854 = _1851;
    _1855 = 0;
    _1856 = _1976;
    _1857 = _1978;
    _1858 = _1980;
    _1859 = _1982;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _250 = false;
    float _55 = in.m_38.x;
    float _57 = in.m_38.y;
    float2 _784 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_784, float2(0.0), isnan(_784))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_784, float2(0.0), isnan(_784))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float2 _803 = float2(_55, _57);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_803, float2(0.0), isnan(_803))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_803, float2(0.0), isnan(_803))).x;
    float2 _810 = float2(_68, 0.0);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_810, float2(0.0), isnan(_810))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_810, float2(0.0), isnan(_810))).xy;
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
    float _124 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[8].x, _118);
    float _126 = fma(_114, _114, _120);
    float _128 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[7].x, _116);
    float _130 = _88 * _110;
    float _132 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[9].x, _122);
    float _134 = fma(_106, _106, _126);
    float _136 = -_86;
    float _138 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[7].z, _128);
    float _140 = fma(_90, _114, _130);
    float _142 = -_86;
    float _144 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[8].z, _124);
    float _146 = sqrt(_134);
    float _148 = -_86;
    float _150 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[9].z, _132);
    float _152 = fma(_92, _106, _140);
    float _154 = _144 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _156 = _138 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _162 = _154 + _160;
    float _164 = rsqrt(_134);
    float _166 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _168 = _158 + _166;
    float _170 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _172 = _156 + _170;
    float _174 = -_146;
    float _176 = fma(_174, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _162 * _162;
    float _182 = abs(_178);
    float _184 = log2(_182);
    float _186 = fma(_172, _172, _180);
    float _188 = _164 * _152;
    float _190 = fma(_168, _168, _186);
    float _192 = -_188;
    float _194 = 0.0 + _192;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = sqrt(_190);
    float _200 = _196 + 0.001000000047497451305389404296875;
    float _202 = _184 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _204 = abs(_200);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = fma(_200, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _212 = as_type<int>(_208) + (-218103808);
    float _214 = exp2(_202);
    float _216 = fma(_200, _210, -0.212114393711090087890625);
    bool _220 = uint(_212) >= 1920991232u;
    float _222 = _198 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _224 = fma(_200, _216, 1.570728778839111328125);
    bool _226 = !_220;
    float _248;
    if (!_226)
    {
        int _228 = as_type<int>(_208);
        int _230 = 1088;
        int _232 = as_type<int>(_180);
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
    float _276 = rsqrt(_190);
    float _278 = _224 * _274;
    float _280 = _278 * 0.15915493667125701904296875;
    float _282 = _280 * 6.283185482025146484375;
    float _284 = cos(_282);
    float _286 = fma(_172, _276, 1.0);
    float _288 = _162 * _276;
    float _290 = _168 * _276;
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
    float _394 = abs(_198);
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
    float _418 = _198 * _406;
    float _420 = _330 * _404;
    float _422 = _352 * _404;
    float _424 = _400 * _404;
    float _426 = _344 * _404;
    float _428 = _198 * _414;
    float _430 = fma(_410, _416, _418);
    float _432 = -_416;
    float _434 = fma(_410, _432, _418);
    float _436 = _198 * _408;
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
    float3 _1513 = float3(_548, _550, _552);
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1513, float3(0.0), isnan(_1513)), _456);
    float _562 = _462 * _546;
    float _564 = _476 * _546;
    float _566 = _488 * _546;
    float3 _1533 = float3(_540, _542, _544);
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1533, float3(0.0), isnan(_1533)), _456);
    float3 _1542 = float3(_562, _564, _566);
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1542, float3(0.0), isnan(_1542)), _456);
    float3 _1551 = float3(_554, _556, _558);
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1551, float3(0.0), isnan(_1551)), _456);
    float _574 = in.m_40.y;
    float _576 = in.m_40.x;
    float _578 = _164 * (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    float _582 = _106 * _164;
    float _584 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _586 = _80 + _584;
    float _588 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _590 = _82 + _588;
    float _592 = -_580;
    float _594 = fma(_592, _580, 1.0);
    float _596 = _586 * _586;
    float _598 = sqrt(_594);
    float _600 = fma(_590, _590, _596);
    float _602 = 0.0 + _598;
    float _604 = precise::clamp(_602, 0.0, 1.0);
    float _606 = _574 * _574;
    float _608 = fma(_604, 0.5, 0.5);
    float _610 = fma(_576, _576, _606);
    float _612 = sqrt(_608);
    float _614 = _610 + 1.0;
    float _616 = rsqrt(_614);
    float _618 = _574 * _616;
    float _620 = _576 * _616;
    float _622 = _84 * _616;
    float _624 = -_618;
    float _626 = fma(_110, _164, _624);
    float _628 = -_620;
    float _630 = fma(_114, _164, _628);
    float _632 = -_622;
    float _634 = _582 + _632;
    float _636 = 0.0 + _582;
    float _638 = precise::clamp(_636, 0.0, 1.0);
    float _640 = _626 * _626;
    float _642 = _88 * _626;
    float _644 = fma(_630, _630, _640);
    float _646 = -_90;
    float _648 = -_642;
    float _650 = fma(_646, _630, _648);
    float _652 = fma(_634, _634, _644);
    float _654 = -_92;
    float _656 = fma(_654, _634, _650);
    float _658 = rsqrt(_652);
    float _660 = -_626;
    float _662 = _618 * _660;
    float _664 = -_618;
    float _666 = _88 * _664;
    float _668 = -_620;
    float _670 = fma(_668, _630, _662);
    float _672 = -_666;
    float _674 = fma(_90, _620, _672);
    float _676 = _658 * _656;
    float _678 = precise::clamp(_676, 0.0, 1.0);
    float _680 = -_622;
    float _682 = fma(_680, _634, _670);
    float _684 = fma(_92, _622, _674);
    float _686 = -_178;
    float _688 = _686 + 1.0;
    float _690 = -_678;
    float _692 = fma(_690, _678, 1.0);
    float _694 = precise::max(_678, _612);
    float _696 = -_600;
    float _698 = fma(_696, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _700 = precise::clamp(_698, 0.0, 1.0);
    float _702 = 1.0 / _682;
    float _704 = -_188;
    float _706 = precise::min(_704, _684);
    float _708 = fma(_688, _638, _178);
    float _710 = -_694;
    float _712 = fma(_710, _694, 1.0);
    float _714 = _678 * _706;
    float _716 = _714 * 2.0;
    float _718 = _700 * _708;
    float _720 = sqrt(_692);
    float _722 = sqrt(_712);
    float _724 = _716 * _702;
    float _726 = precise::clamp(_724, 0.0, 1.0);
    float _728 = _726 * _718;
    float _730 = _78 * _728;
    float _732 = _720 * _722;
    float _734 = fma(_678, _694, _732);
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = abs(_736);
    float _740 = log2(_738);
    float _742 = _76 * _740;
    float _744 = exp2(_742);
    float _746 = _744 * _730;
    float _748 = _560 + _568;
    float _750 = _748 + _570;
    float _752 = _750 + _572;
    float _754 = _752 * 0.25;
    float _756 = _214 * _754;
    float _758 = _754 * _746;
    float _760 = _196 * _756;
    float _762 = _758 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _764 = _758 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _766 = _758 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _768 = _760 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _770 = _760 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _772 = _760 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_43.x = _768;
    out.m_43.y = _770;
    out.m_43.z = _772;
    out.m_45.x = _762;
    out.m_45.y = _764;
    out.m_45.z = _766;
    return out;
}

