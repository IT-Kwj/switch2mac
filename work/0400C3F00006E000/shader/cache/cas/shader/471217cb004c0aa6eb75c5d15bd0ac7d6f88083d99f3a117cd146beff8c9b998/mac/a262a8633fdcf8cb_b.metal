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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_16 [[id(13)]];
    sampler fp_t_tcb_16Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_18 [[id(15)]];
    sampler fp_t_tcb_18Smplr [[id(16)]];
    texture2d<float> fp_t_tcb_14 [[id(17)]];
    sampler fp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_1A [[id(19)]];
    sampler fp_t_tcb_1ASmplr [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_10Smplr_w [[id(22)]];
    sampler fp_t_tcb_ASmplr_w [[id(23)]];
    sampler fp_t_tcb_12Smplr_w [[id(24)]];
    sampler fp_t_tcb_CSmplr_w [[id(25)]];
    sampler fp_t_tcb_ESmplr_w [[id(26)]];
    sampler fp_t_tcb_16Smplr_w [[id(27)]];
    sampler fp_t_tcb_18Smplr_w [[id(28)]];
    sampler fp_t_tcb_14Smplr_w [[id(29)]];
    sampler fp_t_tcb_1ASmplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
    float4 m_52 [[color(1)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _60(thread const int& _2770, thread const int& _2771, thread const int& _2772, thread const int& _2773, thread int& _2774, thread int& _2775, thread int& _2776, thread int& _2777, thread int& _2778, thread int& _2779)
{
    float _2782 = as_type<float>(_2770) + 0.0;
    bool _2784 = _2782 != 0.0;
    bool _2786 = isnan(_2782);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan(0.0);
    bool _2792 = _2788 || _2790;
    int _2794 = as_type<int>(_2782);
    int _2796 = 0;
    int _2798 = _2792 ? (-1) : 0;
    if (!_2792)
    {
        float _2800 = as_type<float>(_2770) * 1.0;
        _2794 = as_type<int>(_2800);
    }
    int _2802 = _2794;
    bool _2804 = !_2792;
    int _2806 = _2802;
    if (!_2804)
    {
        float _2808 = as_type<float>(_2770) + 0.0;
        bool _2810 = _2808 >= 0.0;
        bool _2812 = isnan(_2808);
        bool _2814 = _2810 || _2812;
        bool _2816 = isnan(0.0);
        bool _2818 = _2814 || _2816;
        int _2820 = as_type<int>(_2808);
        _2798 = _2818 ? (-1) : 0;
        if (!_2818)
        {
            _2820 = 2147483647;
        }
        int _2822 = _2820;
        bool _2824 = !_2818;
        _2806 = _2822;
        if (!_2824)
        {
            float _2826 = abs(as_type<float>(_2770));
            float _2828 = _2826 + 0.0;
            bool _2830 = _2828 > as_type<float>(0x7f800000u /* inf */);
            bool _2832 = isnan(_2828);
            bool _2834 = _2830 || _2832;
            bool _2836 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2838 = _2834 || _2836;
            int _2840 = as_type<int>(_2828);
            _2796 = 2139095040;
            _2798 = _2838 ? (-1) : 0;
            if (_2838)
            {
                float _2842 = as_type<float>(_2770) + 1.0;
                _2840 = as_type<int>(_2842);
            }
            int _2844 = _2840;
            _2806 = _2844;
            if (!_2838)
            {
                float _2846 = abs(as_type<float>(_2770));
                float _2848 = _2846 + (-0.0);
                float _2850 = 0.0 + _2848;
                bool _2852 = _2850 != as_type<float>(0x7f800000u /* inf */);
                bool _2854 = isnan(_2850);
                bool _2856 = _2852 || _2854;
                bool _2858 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2860 = _2856 || _2858;
                int _2862 = as_type<int>(_2850);
                _2798 = _2860 ? (-1) : 0;
                if (!_2860)
                {
                    _2862 = _2770;
                }
                int _2864 = _2862;
                bool _2866 = !_2860;
                _2806 = _2864;
                if (!_2866)
                {
                    float _2868 = as_type<float>(_2770) * 18446744073709551616.0;
                    float _2870 = rsqrt(_2868);
                    float _2872 = _2868 * _2870;
                    float _2874 = _2870 * 0.5;
                    float _2876 = -_2872;
                    float _2878 = 0.0 + _2876;
                    float _2880 = fma(_2874, _2878, 0.5);
                    float _2882 = fma(_2872, _2880, _2872);
                    float _2884 = -_2882;
                    float _2886 = 0.0 + _2884;
                    float _2888 = fma(_2882, _2886, _2868);
                    float _2890 = fma(_2874, _2888, _2882);
                    float _2892 = _2890 * 2.3283064365386962890625e-10;
                    _2806 = as_type<int>(_2892);
                    _2796 = as_type<int>(_2874);
                }
            }
        }
    }
    int _2894 = _2806;
    int _2896 = _2796;
    int _2898 = _2798;
    _2774 = _2894;
    _2775 = _2894;
    _2776 = _2896;
    _2777 = _2773;
    _2778 = 0;
    _2779 = _2898;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _258 = false;
    float _64 = gl_FragCoord.w;
    float _66 = in.m_47.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_47.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_47.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _64;
    float _86 = _84 * _70;
    float _88 = _84 * _76;
    float _90 = _84 * _82;
    float _92 = _86 * _86;
    float _94 = fma(_88, _88, _92);
    float _96 = fma(_90, _90, _94);
    float _98 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _100 = rsqrt(_96);
    float _102 = precise::max(0.0, _98);
    float _104 = _88 * _100;
    float _106 = _90 * _100;
    float _108 = _86 * _100;
    float _110 = _104 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _112 = _106 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _114 = -_108;
    float _116 = -_102;
    float _118 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[13].z, _116);
    float _120 = _110 * _110;
    float _122 = _112 * _112;
    float _124 = _120 + _122;
    float _126 = sqrt(_124);
    bool _130 = _126 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _132 = _100;
    float _134 = _98;
    float _136 = _118;
    float _138 = _110;
    float _140 = _112;
    if (!_130)
    {
        _132 = _122;
    }
    float _142 = _132;
    float _144 = _142;
    if (!_130)
    {
        _134 = _120;
    }
    float _146 = _134;
    bool _148 = !_130;
    float _150 = _146;
    if (!_148)
    {
        float _152 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _154 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _156 = _126 + _154;
        float _158 = _118 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _160 = rsqrt(_124);
        float _162 = _156 * _152;
        float _164 = _162 * 0.15915493667125701904296875;
        float _166 = _164 * 6.283185482025146484375;
        float _168 = sin(_166);
        float _170 = _164 * 6.283185482025146484375;
        float _172 = cos(_170);
        float _174 = fma(_168, _158, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _176 = _160 * _174;
        float _178 = _172 + (-1.0);
        float _180 = _110 * _176;
        float _182 = _112 * _176;
        float _184 = _178 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _186 = _182 * _182;
        float _188 = fma(_118, _172, _184);
        float _190 = _180 * _180;
        _136 = _188;
        _150 = _190;
        _144 = _186;
        _138 = _180;
        _140 = _182;
    }
    float _192 = _136;
    float _194 = _150;
    float _196 = _144;
    float _198 = _138;
    float _200 = _140;
    float _202 = fma(_192, _192, _194);
    float _204 = _202 + _196;
    float _206 = rsqrt(_204);
    float _208 = _206 * _192;
    float _210 = _206 * _198;
    float _212 = _206 * _200;
    float _214 = -_208;
    float _216 = precise::max(0.0, _214);
    float _218 = abs(_216);
    float _220 = -_218;
    float _222 = _220 + 1.0;
    float _224 = fma(_216, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _226 = as_type<int>(_222) + (-218103808);
    float _228 = fma(_216, _224, -0.212114393711090087890625);
    bool _230 = uint(_226) >= 1920991232u;
    float _232 = fma(_216, _228, 1.570728778839111328125);
    bool _234 = !_230;
    float _256;
    if (!_234)
    {
        int _236 = as_type<int>(_222);
        int _238 = 0;
        int _240 = 0;
        int _242 = 1136;
        int _244;
        int _246;
        int _248;
        int _250;
        int _252;
        int _254;
        _60(_236, _238, _240, _242, _244, _246, _248, _250, _252, _254);
        _256 = as_type<float>(_244);
        _258 = true;
    }
    else
    {
        float _260 = rsqrt(_222);
        float _262 = _222 * _260;
        float _264 = _260 * 0.5;
        float _266 = -_262;
        float _268 = 0.0 + _266;
        float _270 = fma(_264, _268, 0.5);
        float _272 = fma(_262, _270, _262);
        float _274 = -_272;
        float _276 = 0.0 + _274;
        float _278 = fma(_272, _276, _222);
        float _280 = fma(_264, _278, _272);
        _256 = _280;
    }
    _258 = false;
    float _282 = _256;
    bool _284 = _208 > 0.0;
    float _286 = _106 * _106;
    float _288 = _104 * _104;
    float _290 = _286 + _288;
    if (_284)
    {
        discard_fragment();
    }
    float _292 = rsqrt(_290);
    float _294 = _232 * _282;
    float _296 = _294 * 0.636619746685028076171875;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = -_298;
    float _302 = _300 + 1.0;
    float _304 = sqrt(_302);
    float _306 = _106 * _292;
    float _308 = _104 * _292;
    float _310 = abs(_306);
    float _312 = abs(_308);
    float _314 = precise::max(_310, _312);
    float _316 = precise::max(_314, 9.9999997473787516355514526367188e-05);
    float _318 = -_304;
    float _320 = _318 + 1.0;
    float _322 = 1.0 / _316;
    float _324 = _320 * 0.5;
    float _326 = -_322;
    float _328 = _306 * _326;
    float _330 = _308 * _322;
    float _332 = fma(_328, _324, 0.5);
    float _334 = fma(_330, _324, 0.5);
    if (_284)
    {
        out.m_50.x = 0.0;
        out.m_50.y = 0.0;
        out.m_50.z = 0.0;
        out.m_50.w = 0.0;
        out.m_52.x = 0.0;
        out.m_52.y = 0.0;
        out.m_52.z = 0.0;
        out.m_52.w = 0.0;
        return out;
    }
    float2 _1490;
    _1490.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_332, _334));
    _1490.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_332, _334));
    float _336 = _1490.x;
    float _338 = _336 * 256.0;
    int _340 = int(_338);
    float _342 = float(uint(_340));
    float _344 = _342 * 0.00390625;
    float2 _1506 = float2(_332, _334);
    float4 _347 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1506, float2(0.0), isnan(_1506)), level(_344)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1506, float2(0.0), isnan(_1506)), level(_344)).xyzw;
    float _349 = _347.x;
    float _351 = _347.y;
    float _353 = _347.z;
    float _355 = _347.w;
    float2 _1525 = float2(_332, _334);
    float4 _357 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1525, float2(0.0), isnan(_1525)), level(_344)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1525, float2(0.0), isnan(_1525)), level(_344)).xyzw;
    float _359 = _357.x;
    float _361 = _357.y;
    float _363 = _357.z;
    float _365 = _357.w;
    float2 _1542 = float2(_332, _334);
    float2 _369 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1542, float2(0.0), isnan(_1542)), level(_344)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1542, float2(0.0), isnan(_1542)), level(_344)).xy;
    float _371 = _369.x;
    float _373 = _369.y;
    float2 _1555 = float2(_332, _334);
    float2 _375 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1555, float2(0.0), isnan(_1555)), level(_344)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1555, float2(0.0), isnan(_1555)), level(_344)).xy;
    float _377 = _375.x;
    float _379 = _375.y;
    float _381 = -_108;
    float _383 = fma(_381, _108, _288);
    float _385 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _387 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _389 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _391 = _108 * _385;
    float _393 = _108 * _387;
    float _395 = _108 * _389;
    float _397 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _399 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _391);
    float _401 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _393);
    float _403 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _395);
    float _405 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _407 = -_106;
    float _409 = fma(_407, _397, _399);
    float _411 = fma(_106, _397, _399);
    float _413 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _415 = -_106;
    float _417 = fma(_415, _405, _401);
    float _419 = fma(_106, _405, _401);
    float _421 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _423 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _425 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _427 = -_106;
    float _429 = fma(_427, _413, _403);
    float _431 = fma(_106, _413, _403);
    float _433 = -_104;
    float _435 = fma(_433, _421, _417);
    float _437 = fma(_104, _421, _419);
    float _439 = -_104;
    float _441 = fma(_439, _425, _429);
    float _443 = fma(_104, _423, _411);
    float _445 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _447 = _104 * _108;
    float _449 = fma(_104, _425, _431);
    float _451 = -_104;
    float _453 = fma(_451, _423, _409);
    float _455 = -_108;
    float _457 = _104 * _455;
    float _459 = fma(_445, _447, _443);
    float _461 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _463 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _465 = fma(_445, _457, _453);
    float _467 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _469 = fma(_461, _457, _435);
    float _471 = fma(_461, _447, _437);
    float _473 = fma(_463, _457, _441);
    float _475 = fma(_463, _447, _449);
    float _477 = -_106;
    float _479 = _108 * _477;
    float _481 = _108 * _106;
    float _483 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _485 = _104 * _106;
    float _487 = fma(_467, _479, _465);
    float _489 = fma(_467, _481, _459);
    float _491 = fma(_483, _479, _469);
    float _493 = fma(_483, _481, _471);
    float _495 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _497 = _106 * (-3.0);
    float _499 = fma(_495, _479, _473);
    float _501 = -_108;
    float _503 = _501 + 1.0;
    float _505 = precise::clamp(_503, 0.0, 1.0);
    float _507 = fma(_495, _481, _475);
    float _509 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _511 = abs(_505);
    float _513 = log2(_511);
    float _515 = fma(_509, _485, _487);
    float _517 = fma(_509, _485, _489);
    float _519 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _521 = fma(_519, _485, _491);
    float _523 = fma(_519, _485, _493);
    float _525 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _527 = fma(_525, _485, _499);
    float _529 = fma(_525, _485, _507);
    float _531 = _513 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _533 = -_106;
    float _535 = fma(_533, _497, -1.0);
    float _537 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _539 = exp2(_531);
    float _541 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _543 = fma(_286, 3.0, -1.0);
    float _545 = fma(_537, _535, _515);
    float _547 = fma(_537, _543, _517);
    float _549 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _551 = _539 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _553 = fma(_551, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _555 = precise::clamp(_553, 0.0, 1.0);
    float _557 = fma(_549, _535, _521);
    float _559 = fma(_549, _543, _523);
    float _561 = -_555;
    float _563 = _561 + 1.0;
    float _565 = fma(_541, _535, _527);
    float _567 = _210 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _569 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _571 = fma(_541, _543, _529);
    float _573 = abs(_563);
    float _575 = log2(_573);
    float _577 = -_567;
    float _579 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[11].y, _577);
    float _581 = fma(_569, _383, _545);
    float _583 = fma(_569, _383, _547);
    float _585 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _587 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _589 = -_212;
    float _591 = fma(_589, (*spvDescriptorSet0.fp_c3)._m0[11].z, _579);
    float _593 = fma(_585, _383, _557);
    float _595 = fma(_587, _383, _565);
    float _597 = fma(_587, _383, _571);
    float _599 = fma(_585, _383, _559);
    float _601 = in.m_54.x;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = in.m_54.y;
    float _609 = gl_FragCoord.w;
    float _611 = _607 * _609;
    float _613 = fma(_591, -0.5, 0.5);
    float _615 = fma(_591, 0.5, 0.5);
    float _617 = _575 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _619 = fma(_615, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _621 = exp2(_617);
    float _623 = fma(_615, _619, -0.212114393711090087890625);
    float _625 = fma(_615, _623, 1.570728778839111328125);
    float _627 = _208 + 1.0;
    float _629 = sqrt(_613);
    float _631 = -_208;
    float _633 = fma(_621, _627, _631);
    float _635 = fma(_633, 0.5, 0.5);
    float _637 = _629 * 0.636619746685028076171875;
    float _639 = -_625;
    float _641 = fma(_637, _639, 1.0);
    float _643 = _355 * _355;
    float _645 = _365 * _365;
    float _647 = _643 * _643;
    float _649 = _645 * _645;
    float _651 = _84 * _605;
    float _653 = _84 * _611;
    float _655 = _647 * 16.0;
    float _657 = _371 * _373;
    float _659 = _649 * 16.0;
    float _661 = _373 * _655;
    float _663 = _379 * _659;
    float _665 = -_373;
    float _667 = _665 + _379;
    float _669 = _349 * _661;
    float _671 = _351 * _661;
    float _673 = -_657;
    float _675 = fma(_377, _379, _673);
    float _677 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[0].x, _373);
    float _679 = -_669;
    float _681 = fma(_359, _663, _679);
    float _683 = -_671;
    float _685 = fma(_361, _663, _683);
    float _687 = _353 * _661;
    float _689 = fma(_675, (*spvDescriptorSet0.fp_c3)._m0[0].x, _657);
    float _691 = fma(_681, (*spvDescriptorSet0.fp_c3)._m0[0].x, _669);
    float2 _2077 = float2(_332, _334);
    float4 _693 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2077, float2(0.0), isnan(_2077)), level(_344)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2077, float2(0.0), isnan(_2077)), level(_344)).xyzw;
    float _695 = _693.x;
    float _697 = _693.y;
    float _699 = _693.z;
    float _701 = _693.w;
    float2 _2094 = float2(_332, _334);
    float2 _703 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2094, float2(0.0), isnan(_2094)), level(_344)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2094, float2(0.0), isnan(_2094)), level(_344)).xy;
    float _705 = _703.x;
    float _707 = _703.y;
    float _709 = -_687;
    float _711 = fma(_363, _663, _709);
    float2 _2113 = float2(_332, _334);
    float2 _713 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2113, float2(0.0), isnan(_2113)), level(_344)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2113, float2(0.0), isnan(_2113)), level(_344)).xy;
    float _715 = _713.x;
    float _717 = _713.y;
    float2 _2126 = float2(_651, _653);
    float3 _721 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2126, float2(0.0), isnan(_2126))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2126, float2(0.0), isnan(_2126))).xyz;
    float _723 = _721.x;
    float _725 = _721.y;
    float _727 = _721.z;
    float2 _2140 = float2(_332, _334);
    float4 _729 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2140, float2(0.0), isnan(_2140)), level(_344)), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2140, float2(0.0), isnan(_2140)), level(_344)).xyzw;
    float _731 = _729.x;
    float _733 = _729.y;
    float _735 = _729.z;
    float _737 = _729.w;
    float2 _2157 = float2(_641, _635);
    float3 _739 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2157, float2(0.0), isnan(_2157))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2157, float2(0.0), isnan(_2157))).xyz;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = fma(_685, (*spvDescriptorSet0.fp_c3)._m0[0].x, _671);
    float _749 = _208 * (-10000.0);
    float _751 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _753 = _208 * _751;
    float _755 = _575 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _757 = abs(_749);
    bool _759 = _757 > 0.00999999977648258209228515625;
    float _761 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[26].x, _753);
    float _763 = exp2(_755);
    float _765 = _759 ? _749 : 0.00999999977648258209228515625;
    float _767 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[26].z, _761);
    float _769 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _771 = _765 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _773 = precise::max(_771, -127.0);
    float _775 = -_773;
    float _777 = exp2(_775);
    float _779 = -_769;
    float _781 = exp2(_779);
    float _783 = -_777;
    float _785 = _783 + 1.0;
    float _787 = _781 * _785;
    float _789 = fma(_767, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _791 = precise::max(_677, 1.52587890625e-05);
    float _793 = fma(_789, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _795 = 1.0 / _791;
    float _797 = abs(_793);
    float _799 = log2(_797);
    float _801 = _799 * 1.5;
    float _803 = exp2(_801);
    float _805 = fma(_711, (*spvDescriptorSet0.fp_c3)._m0[0].x, _687);
    float _807 = _677 * _795;
    float _809 = 1.0 / _773;
    float _811 = _691 * _807;
    float _813 = _805 * _807;
    float _815 = _803 * 12.56637096405029296875;
    float _817 = _689 * _807;
    float _819 = -_763;
    float _821 = _819 + 1.0;
    float _823 = 1.0 / _815;
    float _825 = _821 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _827 = _787 * _809;
    float _829 = _747 * _807;
    float _831 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _833 = fma(_831, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _835 = _833 * _823;
    float _837 = _701 * _701;
    float _839 = _837 * _837;
    float _841 = -_707;
    float _843 = _841 + _717;
    float _845 = _723 * _725;
    float _847 = _737 * _737;
    float _849 = _839 * 16.0;
    float _851 = _705 * _707;
    float _853 = -_727;
    float _855 = _853 + 1.0;
    float _857 = _847 * _847;
    float _859 = _707 * _849;
    float _861 = fma(_843, (*spvDescriptorSet0.fp_c3)._m0[0].x, _707);
    float _863 = -_851;
    float _865 = fma(_715, _717, _863);
    float _867 = _857 * 16.0;
    float _869 = _695 * _859;
    float _871 = _697 * _859;
    float _873 = precise::max(_861, 1.52587890625e-05);
    float _875 = _699 * _859;
    float _877 = fma(_865, (*spvDescriptorSet0.fp_c3)._m0[0].x, _851);
    float _879 = -_677;
    float _881 = _879 + _861;
    float _883 = -_845;
    float _885 = _883 + 1.0;
    float _887 = 1.0 / _873;
    float _889 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _891 = _889 + 1.0;
    float _893 = fma(_723, _881, _677);
    float _895 = _717 * _867;
    float _897 = -_825;
    float _899 = _897 + 1.0;
    float _901 = fma(_885, _891, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _903 = -_869;
    float _905 = fma(_731, _895, _903);
    float _907 = -_871;
    float _909 = fma(_733, _895, _907);
    float _911 = -_875;
    float _913 = fma(_735, _895, _911);
    float _915 = _845 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _917 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _919 = _917 + 1.0;
    float _921 = fma(_905, (*spvDescriptorSet0.fp_c3)._m0[0].x, _869);
    float _923 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[0].x, _871);
    float _925 = _825 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _927 = fma(_885, _919, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _929 = _877 * _887;
    float _931 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[0].x, _875);
    float _933 = _927 * _887;
    float _935 = _929 * _901;
    float _937 = precise::max(_893, 1.52587890625e-05);
    float _939 = _931 * _933;
    float _941 = -_817;
    float _943 = fma(_861, _935, _941);
    float _945 = _861 * _933;
    float _947 = 1.0 / _937;
    float _949 = fma(_723, _943, _817);
    float _951 = -_811;
    float _953 = fma(_921, _945, _951);
    float _955 = -_829;
    float _957 = fma(_923, _945, _955);
    float _959 = -_813;
    float _961 = fma(_861, _939, _959);
    float _963 = fma(_723, _953, _811);
    float _965 = fma(_723, _957, _829);
    float _967 = abs(_899);
    float _969 = log2(_967);
    float _971 = fma(_723, _961, _813);
    float _973 = _949 * _947;
    float _975 = _973 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _977 = _973 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _979 = _975 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _981 = _977 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _983 = _969 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _985 = _599 * _979;
    float _987 = _583 * _979;
    float _989 = _597 * _979;
    float _991 = exp2(_983);
    float _993 = fma(_593, _981, _985);
    float _995 = fma(_581, _981, _987);
    float _997 = fma(_595, _981, _989);
    float _999 = _969 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1001 = _993 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1003 = _995 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1005 = _997 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1007 = _1001 * 0.715200006961822509765625;
    float _1009 = exp2(_999);
    float _1011 = fma(_1003, 0.2125999927520751953125, _1007);
    float _1013 = _991 * _947;
    float _1015 = fma(_1005, 0.072200000286102294921875, _1011);
    float _1017 = _965 * _1013;
    float _1019 = -_1001;
    float _1021 = _1019 + _1015;
    float _1023 = -_1003;
    float _1025 = _1023 + _1015;
    float _1027 = -_1005;
    float _1029 = _1027 + _1015;
    float _1031 = _963 * _1013;
    float _1033 = fma(_915, _1021, _1001);
    float _1035 = fma(_915, _1025, _1003);
    float _1037 = fma(_915, _1029, _1005);
    float _1039 = _971 * _1013;
    float _1041 = _1009 * _1033;
    float _1043 = _1009 * _1035;
    float _1045 = _1009 * _1037;
    float _1047 = _1041 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1049 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1051 = fma(_1017, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1047);
    float _1053 = _1043 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1055 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1049);
    float _1057 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1059 = fma(_743, _925, _1051);
    float _1061 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1053);
    float _1063 = fma(_745, _925, _1055);
    float _1065 = _827 * _1057;
    float _1067 = fma(_741, _925, _1061);
    float _1069 = _1059 * 0.715200006961822509765625;
    float _1071 = -_1065;
    float _1073 = exp2(_1071);
    float _1075 = fma(_1067, 0.2125999927520751953125, _1069);
    float _1077 = fma(_1063, 0.072200000286102294921875, _1075);
    float _1079 = 1.0 / _1077;
    float _1081 = -_1073;
    float _1083 = _1081 + 1.0;
    float _1085 = _835 * _1083;
    float _1087 = _1085 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1089 = _1079 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1091 = precise::clamp(_1089, 0.0, 1.0);
    float _1093 = _1085 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1095 = fma(_1091, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1097 = _893 * _855;
    float _1099 = _1073 * _1095;
    float _1101 = _1085 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1103 = _1097 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _1105 = fma(_1067, _1099, _1087);
    float _1107 = fma(_1059, _1099, _1101);
    float _1109 = fma(_1063, _1099, _1093);
    out.m_50.x = _1105;
    out.m_50.y = _1107;
    out.m_50.z = _1109;
    out.m_50.w = _1103;
    out.m_52.x = _1105;
    out.m_52.y = _1107;
    out.m_52.z = _1109;
    out.m_52.w = _1103;
    return out;
}

