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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
void _44(thread const int& _1796, thread const int& _1797, thread const int& _1798, thread const int& _1799, thread int& _1800, thread int& _1801, thread int& _1802, thread int& _1803, thread int& _1804, thread int& _1805)
{
    float _1808 = as_type<float>(_1796) + 0.0;
    bool _1810 = _1808 != 0.0;
    bool _1812 = isnan(_1808);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan(0.0);
    bool _1818 = _1814 || _1816;
    int _1820 = as_type<int>(_1808);
    int _1822 = 0;
    int _1824 = _1818 ? (-1) : 0;
    if (!_1818)
    {
        float _1826 = as_type<float>(_1796) * 1.0;
        _1820 = as_type<int>(_1826);
    }
    int _1828 = _1820;
    bool _1830 = !_1818;
    int _1832 = _1828;
    if (!_1830)
    {
        float _1834 = as_type<float>(_1796) + 0.0;
        bool _1836 = _1834 >= 0.0;
        bool _1838 = isnan(_1834);
        bool _1840 = _1836 || _1838;
        bool _1842 = isnan(0.0);
        bool _1844 = _1840 || _1842;
        int _1846 = as_type<int>(_1834);
        _1824 = _1844 ? (-1) : 0;
        if (!_1844)
        {
            _1846 = 2147483647;
        }
        int _1848 = _1846;
        bool _1850 = !_1844;
        _1832 = _1848;
        if (!_1850)
        {
            float _1852 = abs(as_type<float>(_1796));
            float _1854 = _1852 + 0.0;
            bool _1856 = _1854 > as_type<float>(0x7f800000u /* inf */);
            bool _1858 = isnan(_1854);
            bool _1860 = _1856 || _1858;
            bool _1862 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1864 = _1860 || _1862;
            int _1866 = as_type<int>(_1854);
            _1822 = 2139095040;
            _1824 = _1864 ? (-1) : 0;
            if (_1864)
            {
                float _1868 = as_type<float>(_1796) + 1.0;
                _1866 = as_type<int>(_1868);
            }
            int _1870 = _1866;
            _1832 = _1870;
            if (!_1864)
            {
                float _1872 = abs(as_type<float>(_1796));
                float _1874 = _1872 + (-0.0);
                float _1876 = 0.0 + _1874;
                bool _1878 = _1876 != as_type<float>(0x7f800000u /* inf */);
                bool _1880 = isnan(_1876);
                bool _1882 = _1878 || _1880;
                bool _1884 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1886 = _1882 || _1884;
                int _1888 = as_type<int>(_1876);
                _1824 = _1886 ? (-1) : 0;
                if (!_1886)
                {
                    _1888 = _1796;
                }
                int _1890 = _1888;
                bool _1892 = !_1886;
                _1832 = _1890;
                if (!_1892)
                {
                    float _1894 = as_type<float>(_1796) * 18446744073709551616.0;
                    float _1896 = rsqrt(_1894);
                    float _1898 = _1894 * _1896;
                    float _1900 = _1896 * 0.5;
                    float _1902 = -_1898;
                    float _1904 = 0.0 + _1902;
                    float _1906 = fma(_1900, _1904, 0.5);
                    float _1908 = fma(_1898, _1906, _1898);
                    float _1910 = -_1908;
                    float _1912 = 0.0 + _1910;
                    float _1914 = fma(_1908, _1912, _1894);
                    float _1916 = fma(_1900, _1914, _1908);
                    float _1918 = _1916 * 2.3283064365386962890625e-10;
                    _1832 = as_type<int>(_1918);
                    _1822 = as_type<int>(_1914);
                }
            }
        }
    }
    int _1920 = _1832;
    int _1922 = _1822;
    int _1924 = _1824;
    _1800 = _1920;
    _1801 = _1920;
    _1802 = _1922;
    _1803 = _1799;
    _1804 = 0;
    _1805 = _1924;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _242 = false;
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_33.z;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _48;
    float _70 = _68 * _54;
    float _72 = _68 * _60;
    float _74 = _68 * _66;
    float _76 = _70 * _70;
    float _78 = fma(_72, _72, _76);
    float _80 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _82 = fma(_74, _74, _78);
    float _84 = precise::max(0.0, _80);
    float _86 = rsqrt(_82);
    float _88 = _72 * _86;
    float _90 = _74 * _86;
    float _92 = _70 * _86;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = -_92;
    float _100 = -_84;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[13].z, _100);
    float _104 = _94 * _94;
    float _106 = _96 * _96;
    float _108 = _104 + _106;
    float _110 = sqrt(_108);
    bool _114 = _110 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _116 = _86;
    float _118 = _84;
    float _120 = _102;
    float _122 = _94;
    float _124 = _96;
    if (!_114)
    {
        _116 = _106;
    }
    float _126 = _116;
    float _128 = _126;
    if (!_114)
    {
        _118 = _104;
    }
    float _130 = _118;
    bool _132 = !_114;
    float _134 = _130;
    if (!_132)
    {
        float _136 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _138 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _140 = _110 + _138;
        float _142 = _102 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _144 = rsqrt(_108);
        float _146 = _140 * _136;
        float _148 = _146 * 0.15915493667125701904296875;
        float _150 = _148 * 6.283185482025146484375;
        float _152 = sin(_150);
        float _154 = _148 * 6.283185482025146484375;
        float _156 = cos(_154);
        float _158 = fma(_152, _142, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _160 = _144 * _158;
        float _162 = _156 + (-1.0);
        float _164 = _94 * _160;
        float _166 = _96 * _160;
        float _168 = _162 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = _166 * _166;
        float _172 = fma(_102, _156, _168);
        float _174 = _164 * _164;
        _120 = _172;
        _134 = _174;
        _128 = _170;
        _122 = _164;
        _124 = _166;
    }
    float _176 = _120;
    float _178 = _134;
    float _180 = _128;
    float _182 = _122;
    float _184 = _124;
    float _186 = fma(_176, _176, _178);
    float _188 = _186 + _180;
    float _190 = rsqrt(_188);
    float _192 = _190 * _176;
    float _194 = _190 * _182;
    float _196 = _190 * _184;
    float _198 = -_192;
    float _200 = precise::max(0.0, _198);
    float _202 = abs(_200);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = fma(_200, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _210 = as_type<int>(_206) + (-218103808);
    float _212 = fma(_200, _208, -0.212114393711090087890625);
    bool _214 = uint(_210) >= 1920991232u;
    float _216 = fma(_200, _212, 1.570728778839111328125);
    bool _218 = !_214;
    float _240;
    if (!_218)
    {
        int _220 = as_type<int>(_206);
        int _222 = 0;
        int _224 = 0;
        int _226 = 1136;
        int _228;
        int _230;
        int _232;
        int _234;
        int _236;
        int _238;
        _44(_220, _222, _224, _226, _228, _230, _232, _234, _236, _238);
        _240 = as_type<float>(_228);
        _242 = true;
    }
    else
    {
        float _244 = rsqrt(_206);
        float _246 = _206 * _244;
        float _248 = _244 * 0.5;
        float _250 = -_246;
        float _252 = 0.0 + _250;
        float _254 = fma(_248, _252, 0.5);
        float _256 = fma(_246, _254, _246);
        float _258 = -_256;
        float _260 = 0.0 + _258;
        float _262 = fma(_256, _260, _206);
        float _264 = fma(_248, _262, _256);
        _240 = _264;
    }
    _242 = false;
    float _266 = _240;
    bool _268 = _192 > 0.0;
    float _270 = _90 * _90;
    float _272 = _88 * _88;
    float _274 = _270 + _272;
    if (_268)
    {
        discard_fragment();
    }
    float _276 = rsqrt(_274);
    float _278 = _216 * _266;
    float _280 = _278 * 0.636619746685028076171875;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = -_282;
    float _286 = _284 + 1.0;
    float _288 = sqrt(_286);
    float _290 = _90 * _276;
    float _292 = _88 * _276;
    float _294 = abs(_290);
    float _296 = abs(_292);
    float _298 = precise::max(_294, _296);
    float _300 = precise::max(_298, 9.9999997473787516355514526367188e-05);
    float _302 = -_288;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _300;
    float _308 = _304 * 0.5;
    float _310 = -_306;
    float _312 = _290 * _310;
    float _314 = _292 * _306;
    float _316 = fma(_312, _308, 0.5);
    float _318 = fma(_314, _308, 0.5);
    if (_268)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    float2 _1104;
    _1104.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_316, _318));
    _1104.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_316, _318));
    float _320 = _1104.x;
    float _322 = _320 * 256.0;
    int _324 = int(_322);
    float _326 = -_92;
    float _328 = _326 + 1.0;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = abs(_330);
    float _334 = log2(_332);
    float _336 = _334 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _338 = exp2(_336);
    float _340 = _338 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _342 = fma(_340, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = _194 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _348 = -_344;
    float _350 = _348 + 1.0;
    float _352 = -_346;
    float _354 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[11].y, _352);
    float _356 = abs(_350);
    float _358 = log2(_356);
    float _360 = -_196;
    float _362 = fma(_360, (*spvDescriptorSet0.fp_c3)._m0[11].z, _354);
    float _364 = fma(_362, -0.5, 0.5);
    float _366 = fma(_362, 0.5, 0.5);
    float _368 = _192 + 1.0;
    float _370 = fma(_366, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _372 = sqrt(_364);
    float _374 = fma(_366, _370, -0.212114393711090087890625);
    float _376 = _358 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _378 = fma(_366, _374, 1.570728778839111328125);
    float _380 = exp2(_376);
    float _382 = _372 * 0.636619746685028076171875;
    float _384 = -_378;
    float _386 = fma(_382, _384, 1.0);
    float _388 = -_192;
    float _390 = fma(_380, _368, _388);
    float _392 = fma(_390, 0.5, 0.5);
    float _394 = float(uint(_324));
    float _396 = _394 * 0.00390625;
    float2 _1215 = float2(_316, _318);
    float2 _400 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1215, float2(0.0), isnan(_1215)), level(_396)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1215, float2(0.0), isnan(_1215)), level(_396)).xy;
    float _402 = _400.x;
    float _404 = _400.y;
    float2 _1230 = float2(_316, _318);
    float4 _407 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1230, float2(0.0), isnan(_1230)), level(_396)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1230, float2(0.0), isnan(_1230)), level(_396)).xyzw;
    float _409 = _407.x;
    float _411 = _407.y;
    float _413 = _407.z;
    float _415 = _407.w;
    float2 _1247 = float2(_386, _392);
    float3 _419 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1247, float2(0.0), isnan(_1247))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1247, float2(0.0), isnan(_1247))).xyz;
    float _421 = _419.x;
    float _423 = _419.y;
    float _425 = _419.z;
    float _427 = -_92;
    float _429 = fma(_427, _92, _272);
    float _431 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _433 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _435 = fma(_270, 3.0, -1.0);
    float _437 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _439 = _92 * _431;
    float _441 = _92 * _433;
    float _443 = _92 * _437;
    float _445 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _447 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _439);
    float _449 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _451 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _441);
    float _453 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _443);
    float _455 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _457 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _459 = fma(_90, _449, _447);
    float _461 = -_90;
    float _463 = fma(_461, _445, _451);
    float _465 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _467 = -_90;
    float _469 = fma(_467, _455, _453);
    float _471 = fma(_90, _455, _453);
    float _473 = -_90;
    float _475 = fma(_473, _457, _447);
    float _477 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _479 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _481 = fma(_90, _445, _451);
    float _483 = -_88;
    float _485 = fma(_483, _465, _463);
    float _487 = _358 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _489 = -_88;
    float _491 = fma(_489, _477, _469);
    float _493 = -_88;
    float _495 = fma(_493, _479, _475);
    float _497 = fma(_88, _477, _471);
    float _499 = fma(_88, _479, _459);
    float _501 = _88 * _90;
    float _503 = -_92;
    float _505 = _88 * _503;
    float _507 = _88 * _92;
    float _509 = fma(_88, _465, _481);
    float _511 = _90 * (-3.0);
    float _513 = exp2(_487);
    float _515 = -_90;
    float _517 = _92 * _515;
    float _519 = -_90;
    float _521 = fma(_519, _511, -1.0);
    float _523 = _92 * _90;
    float _525 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _527 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _529 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _531 = fma(_525, _505, _485);
    float _533 = fma(_525, _507, _509);
    float _535 = fma(_527, _505, _491);
    float _537 = fma(_527, _507, _497);
    float _539 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _541 = fma(_529, _505, _495);
    float _543 = fma(_529, _507, _499);
    float _545 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _547 = fma(_539, _517, _535);
    float _549 = fma(_539, _523, _537);
    float _551 = -_513;
    float _553 = _551 + 1.0;
    float _555 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _557 = fma(_545, _517, _531);
    float _559 = fma(_545, _523, _533);
    float _561 = _553 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _563 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _565 = fma(_555, _517, _541);
    float _567 = fma(_555, _523, _543);
    float _569 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _571 = -_561;
    float _573 = _571 + 1.0;
    float _575 = fma(_563, _501, _547);
    float _577 = fma(_563, _501, _549);
    float _579 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _581 = fma(_569, _501, _557);
    float _583 = fma(_569, _501, _559);
    float _585 = fma(_579, _501, _565);
    float _587 = abs(_573);
    float _589 = log2(_587);
    float _591 = fma(_579, _501, _567);
    float _593 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _595 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _597 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _599 = fma(_593, _521, _575);
    float _601 = fma(_593, _435, _577);
    float _603 = fma(_595, _521, _581);
    float _605 = fma(_597, _521, _585);
    float _607 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _609 = fma(_595, _435, _583);
    float _611 = fma(_597, _435, _591);
    float _613 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _615 = fma(_607, _429, _599);
    float _617 = fma(_607, _429, _601);
    float _619 = _589 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _621 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _623 = _589 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _625 = fma(_613, _429, _605);
    float _627 = fma(_613, _429, _611);
    float _629 = fma(_621, _429, _609);
    float _631 = exp2(_619);
    float _633 = fma(_621, _429, _603);
    float _635 = _561 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _637 = _402 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _639 = _402 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _641 = _415 * _415;
    float _643 = _404 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _645 = _637 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _647 = _639 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _649 = exp2(_623);
    float _651 = _641 * _641;
    float _653 = _629 * _645;
    float _655 = _617 * _645;
    float _657 = _651 * 16.0;
    float _659 = fma(_633, _647, _653);
    float _661 = fma(_615, _647, _655);
    float _663 = _627 * _645;
    float _665 = _659 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _667 = _661 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _669 = fma(_625, _647, _663);
    float _671 = _631 * _665;
    float _673 = _631 * _667;
    float _675 = _649 * _657;
    float _677 = _669 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _679 = _671 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _681 = _411 * _675;
    float _683 = _409 * _675;
    float _685 = _631 * _677;
    float _687 = _413 * _675;
    float _689 = fma(_681, (*spvDescriptorSet0.fp_c3)._m0[27].y, _679);
    float _691 = _673 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _693 = _685 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _695 = fma(_423, _635, _689);
    float _697 = fma(_683, (*spvDescriptorSet0.fp_c3)._m0[27].x, _691);
    float _699 = fma(_687, (*spvDescriptorSet0.fp_c3)._m0[27].z, _693);
    float _701 = fma(_421, _635, _697);
    float _703 = _695 * 0.715200006961822509765625;
    float _705 = fma(_425, _635, _699);
    float _707 = fma(_701, 0.2125999927520751953125, _703);
    float _709 = fma(_705, 0.072200000286102294921875, _707);
    float _711 = 1.0 / _709;
    float _713 = _711 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _715 = precise::clamp(_713, 0.0, 1.0);
    float _717 = fma(_715, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _719 = _701 * _717;
    float _721 = _695 * _717;
    float _723 = _705 * _717;
    out.m_36.x = _719;
    out.m_36.y = _721;
    out.m_36.z = _723;
    out.m_36.w = _643;
    out.m_38.x = _719;
    out.m_38.y = _721;
    out.m_38.z = _723;
    out.m_38.w = _643;
    return out;
}

