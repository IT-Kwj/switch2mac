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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_12Smplr_w [[id(19)]];
    sampler fp_t_tcb_10Smplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    sampler fp_t_tcb_ESmplr_w [[id(22)]];
    sampler fp_t_tcb_CSmplr_w [[id(23)]];
    sampler fp_t_tcb_16Smplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _54(thread const int& _2702, thread const int& _2703, thread const int& _2704, thread const int& _2705, thread int& _2706, thread int& _2707, thread int& _2708, thread int& _2709, thread int& _2710, thread int& _2711)
{
    float _2714 = as_type<float>(_2704) + 0.0;
    bool _2716 = _2714 != 0.0;
    bool _2718 = isnan(_2714);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan(0.0);
    bool _2724 = _2720 || _2722;
    int _2726 = as_type<int>(_2714);
    int _2728 = _2702;
    int _2730 = 0;
    int _2732 = _2724 ? (-1) : 0;
    if (!_2724)
    {
        float _2734 = as_type<float>(_2704) * 1.0;
        _2726 = as_type<int>(_2734);
    }
    int _2736 = _2726;
    bool _2738 = !_2724;
    int _2740 = _2736;
    if (!_2738)
    {
        float _2742 = as_type<float>(_2704) + 0.0;
        bool _2744 = _2742 >= 0.0;
        bool _2746 = isnan(_2742);
        bool _2748 = _2744 || _2746;
        bool _2750 = isnan(0.0);
        bool _2752 = _2748 || _2750;
        int _2754 = as_type<int>(_2742);
        _2732 = _2752 ? (-1) : 0;
        if (!_2752)
        {
            _2754 = 2147483647;
        }
        int _2756 = _2754;
        bool _2758 = !_2752;
        _2740 = _2756;
        if (!_2758)
        {
            float _2760 = abs(as_type<float>(_2704));
            float _2762 = _2760 + 0.0;
            bool _2764 = _2762 > as_type<float>(0x7f800000u /* inf */);
            bool _2766 = isnan(_2762);
            bool _2768 = _2764 || _2766;
            bool _2770 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2772 = _2768 || _2770;
            int _2774 = as_type<int>(_2762);
            _2730 = 2139095040;
            _2732 = _2772 ? (-1) : 0;
            if (_2772)
            {
                float _2776 = as_type<float>(_2704) + 1.0;
                _2774 = as_type<int>(_2776);
            }
            int _2778 = _2774;
            _2740 = _2778;
            if (!_2772)
            {
                float _2780 = abs(as_type<float>(_2704));
                float _2782 = _2780 + (-0.0);
                float _2784 = 0.0 + _2782;
                bool _2786 = _2784 != as_type<float>(0x7f800000u /* inf */);
                bool _2788 = isnan(_2784);
                bool _2790 = _2786 || _2788;
                bool _2792 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2794 = _2790 || _2792;
                int _2796 = as_type<int>(_2784);
                _2732 = _2794 ? (-1) : 0;
                if (!_2794)
                {
                    _2796 = _2704;
                }
                int _2798 = _2796;
                bool _2800 = !_2794;
                _2740 = _2798;
                if (!_2800)
                {
                    float _2802 = as_type<float>(_2704) * 18446744073709551616.0;
                    float _2804 = rsqrt(_2802);
                    float _2806 = _2802 * _2804;
                    float _2808 = _2804 * 0.5;
                    float _2810 = -_2806;
                    float _2812 = 0.0 + _2810;
                    float _2814 = fma(_2808, _2812, 0.5);
                    float _2816 = fma(_2806, _2814, _2806);
                    float _2818 = -_2816;
                    float _2820 = 0.0 + _2818;
                    float _2822 = fma(_2816, _2820, _2802);
                    float _2824 = fma(_2808, _2822, _2816);
                    float _2826 = _2824 * 2.3283064365386962890625e-10;
                    _2740 = as_type<int>(_2826);
                    _2728 = as_type<int>(_2802);
                    _2730 = as_type<int>(_2808);
                }
            }
        }
    }
    int _2828 = _2740;
    int _2830 = _2728;
    int _2832 = _2730;
    int _2834 = _2732;
    _2706 = _2828;
    _2707 = _2830;
    _2708 = _2832;
    _2709 = _2705;
    _2710 = 0;
    _2711 = _2834;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _252 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_43.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_43.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_43.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _58;
    float _80 = _78 * _64;
    float _82 = _78 * _70;
    float _84 = _78 * _76;
    float _86 = _80 * _80;
    float _88 = fma(_82, _82, _86);
    float _90 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _92 = fma(_84, _84, _88);
    float _94 = precise::max(0.0, _90);
    float _96 = rsqrt(_92);
    float _98 = _82 * _96;
    float _100 = _84 * _96;
    float _102 = _80 * _96;
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _108 = -_102;
    float _110 = -_94;
    float _112 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[13].z, _110);
    float _114 = _104 * _104;
    float _116 = _106 * _106;
    float _118 = _114 + _116;
    float _120 = sqrt(_118);
    bool _124 = _120 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _126 = _96;
    float _128 = _94;
    float _130 = _112;
    float _132 = _104;
    float _134 = _106;
    if (!_124)
    {
        _126 = _116;
    }
    float _136 = _126;
    float _138 = _136;
    if (!_124)
    {
        _128 = _114;
    }
    float _140 = _128;
    bool _142 = !_124;
    float _144 = _140;
    if (!_142)
    {
        float _146 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _148 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _150 = _120 + _148;
        float _152 = _112 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _154 = rsqrt(_118);
        float _156 = _150 * _146;
        float _158 = _156 * 0.15915493667125701904296875;
        float _160 = _158 * 6.283185482025146484375;
        float _162 = sin(_160);
        float _164 = _158 * 6.283185482025146484375;
        float _166 = cos(_164);
        float _168 = fma(_162, _152, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _170 = _154 * _168;
        float _172 = _166 + (-1.0);
        float _174 = _104 * _170;
        float _176 = _106 * _170;
        float _178 = _172 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _180 = _176 * _176;
        float _182 = fma(_112, _166, _178);
        float _184 = _174 * _174;
        _130 = _182;
        _144 = _184;
        _138 = _180;
        _132 = _174;
        _134 = _176;
    }
    float _186 = _130;
    float _188 = _144;
    float _190 = _138;
    float _192 = _132;
    float _194 = _134;
    float _196 = fma(_186, _186, _188);
    float _198 = _196 + _190;
    float _200 = rsqrt(_198);
    float _202 = _200 * _186;
    float _204 = _200 * _192;
    float _206 = _200 * _194;
    float _208 = -_202;
    float _210 = precise::max(0.0, _208);
    float _212 = abs(_210);
    float _214 = -_212;
    float _216 = _214 + 1.0;
    float _218 = fma(_210, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _220 = as_type<int>(_216) + (-218103808);
    float _222 = fma(_210, _218, -0.212114393711090087890625);
    bool _224 = uint(_220) >= 1920991232u;
    float _226 = fma(_210, _222, 1.570728778839111328125);
    bool _228 = !_224;
    float _250;
    if (!_228)
    {
        int _230 = 0;
        int _232 = 0;
        int _234 = as_type<int>(_216);
        int _236 = 1104;
        int _238;
        int _240;
        int _242;
        int _244;
        int _246;
        int _248;
        _54(_230, _232, _234, _236, _238, _240, _242, _244, _246, _248);
        _250 = as_type<float>(_238);
        _252 = true;
    }
    else
    {
        float _254 = rsqrt(_216);
        float _256 = _216 * _254;
        float _258 = _254 * 0.5;
        float _260 = -_256;
        float _262 = 0.0 + _260;
        float _264 = fma(_258, _262, 0.5);
        float _266 = fma(_256, _264, _256);
        float _268 = -_266;
        float _270 = 0.0 + _268;
        float _272 = fma(_266, _270, _216);
        float _274 = fma(_258, _272, _266);
        _250 = _274;
    }
    _252 = false;
    float _276 = _250;
    bool _278 = _202 > 0.0;
    float _280 = _100 * _100;
    float _282 = _98 * _98;
    float _284 = _280 + _282;
    if (_278)
    {
        discard_fragment();
    }
    float _286 = rsqrt(_284);
    float _288 = _226 * _276;
    float _290 = _288 * 0.636619746685028076171875;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = -_292;
    float _296 = _294 + 1.0;
    float _298 = sqrt(_296);
    float _300 = _100 * _286;
    float _302 = _98 * _286;
    float _304 = abs(_300);
    float _306 = abs(_302);
    float _308 = precise::max(_304, _306);
    float _310 = precise::max(_308, 9.9999997473787516355514526367188e-05);
    float _312 = -_298;
    float _314 = _312 + 1.0;
    float _316 = 1.0 / _310;
    float _318 = _314 * 0.5;
    float _320 = -_316;
    float _322 = _300 * _320;
    float _324 = _302 * _316;
    float _326 = fma(_322, _318, 0.5);
    float _328 = fma(_324, _318, 0.5);
    if (_278)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return out;
    }
    float2 _1466;
    _1466.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_326, _328));
    _1466.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_326, _328));
    float _330 = _1466.x;
    float _332 = _330 * 256.0;
    int _334 = int(_332);
    float _336 = float(uint(_334));
    float _338 = _336 * 0.00390625;
    float2 _1482 = float2(_326, _328);
    float4 _341 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1482, float2(0.0), isnan(_1482)), level(_338)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1482, float2(0.0), isnan(_1482)), level(_338)).xyzw;
    float _343 = _341.x;
    float _345 = _341.y;
    float _347 = _341.z;
    float _349 = _341.w;
    float2 _1501 = float2(_326, _328);
    float2 _353 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1501, float2(0.0), isnan(_1501)), level(_338)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1501, float2(0.0), isnan(_1501)), level(_338)).xy;
    float _355 = _353.x;
    float _357 = _353.y;
    float _359 = -_102;
    float _361 = _359 + 1.0;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = -_102;
    float _367 = fma(_365, _102, _282);
    float _369 = -_102;
    float _371 = _98 * _369;
    float _373 = abs(_363);
    float _375 = log2(_373);
    float _377 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _379 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _381 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _383 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _385 = _102 * _377;
    float _387 = _102 * _379;
    float _389 = _102 * _381;
    float _391 = _98 * _102;
    float _393 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _385);
    float _395 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _387);
    float _397 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _399 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _389);
    float _401 = -_100;
    float _403 = fma(_401, _383, _393);
    float _405 = fma(_100, _383, _393);
    float _407 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _409 = _375 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _411 = -_100;
    float _413 = fma(_411, _397, _395);
    float _415 = fma(_100, _397, _395);
    float _417 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _419 = -_100;
    float _421 = fma(_419, _407, _399);
    float _423 = fma(_100, _407, _399);
    float _425 = exp2(_409);
    float _427 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _429 = -_98;
    float _431 = fma(_429, _417, _403);
    float _433 = fma(_98, _417, _405);
    float _435 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _437 = -_98;
    float _439 = fma(_437, _427, _413);
    float _441 = fma(_98, _427, _415);
    float _443 = -_98;
    float _445 = fma(_443, _435, _421);
    float _447 = fma(_98, _435, _423);
    float _449 = _98 * _100;
    float _451 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _453 = _100 * (-3.0);
    float _455 = -_100;
    float _457 = _102 * _455;
    float _459 = fma(_451, _371, _431);
    float _461 = fma(_451, _391, _433);
    float _463 = _425 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _465 = fma(_280, 3.0, -1.0);
    float _467 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _469 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _471 = _102 * _100;
    float _473 = -_100;
    float _475 = fma(_473, _453, -1.0);
    float _477 = fma(_467, _371, _439);
    float _479 = fma(_467, _391, _441);
    float _481 = fma(_469, _371, _445);
    float _483 = fma(_469, _391, _447);
    float _485 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _487 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _489 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _491 = fma(_485, _457, _459);
    float _493 = fma(_487, _457, _477);
    float _495 = fma(_487, _471, _479);
    float _497 = fma(_485, _471, _461);
    float _499 = fma(_489, _457, _481);
    float _501 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _503 = fma(_489, _471, _483);
    float _505 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _507 = fma(_463, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _509 = precise::clamp(_507, 0.0, 1.0);
    float _511 = fma(_501, _449, _497);
    float _513 = fma(_505, _449, _493);
    float _515 = _204 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _517 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _519 = -_509;
    float _521 = _519 + 1.0;
    float _523 = fma(_501, _449, _491);
    float _525 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _527 = -_515;
    float _529 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[11].y, _527);
    float _531 = fma(_505, _449, _495);
    float _533 = fma(_517, _449, _499);
    float _535 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _537 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _539 = fma(_517, _449, _503);
    float _541 = fma(_525, _475, _523);
    float _543 = abs(_521);
    float _545 = log2(_543);
    float _547 = -_206;
    float _549 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[11].z, _529);
    float _551 = fma(_535, _475, _513);
    float _553 = fma(_537, _475, _533);
    float _555 = fma(_525, _465, _511);
    float _557 = in.m_48.x;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = in.m_48.y;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    float _569 = fma(_535, _465, _531);
    float _571 = fma(_537, _465, _539);
    float _573 = fma(_549, -0.5, 0.5);
    float _575 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _577 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _579 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _581 = fma(_549, 0.5, 0.5);
    float _583 = fma(_575, _367, _541);
    float _585 = sqrt(_573);
    float _587 = _545 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _589 = fma(_577, _367, _551);
    float _591 = fma(_575, _367, _555);
    float _593 = fma(_577, _367, _569);
    float _595 = fma(_581, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _597 = fma(_579, _367, _553);
    float _599 = fma(_579, _367, _571);
    float _601 = exp2(_587);
    float _603 = fma(_581, _595, -0.212114393711090087890625);
    float _605 = fma(_581, _603, 1.570728778839111328125);
    float _607 = _585 * 0.636619746685028076171875;
    float _609 = -_605;
    float _611 = fma(_607, _609, 1.0);
    float _613 = _202 + 1.0;
    float _615 = _78 * _561;
    float _617 = _349 * _349;
    float _619 = _617 * _617;
    float _621 = _619 * 16.0;
    float _623 = _78 * _567;
    float _625 = -_202;
    float _627 = fma(_601, _613, _625);
    float _629 = fma(_202, -0.5, 0.5);
    float2 _1959 = float2(_326, _328);
    float2 _631 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1959, float2(0.0), isnan(_1959)), level(_338)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1959, float2(0.0), isnan(_1959)), level(_338)).xy;
    float _633 = _631.x;
    float _635 = _631.y;
    float2 _1972 = float2(_326, _328);
    float4 _637 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1972, float2(0.0), isnan(_1972)), level(_338)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1972, float2(0.0), isnan(_1972)), level(_338)).xyzw;
    float _639 = _637.x;
    float _641 = _637.y;
    float _643 = _637.z;
    float _645 = _637.w;
    float _647 = _357 * _621;
    float _649 = fma(_627, 0.5, 0.5);
    float _651 = _343 * _647;
    float _653 = _345 * _647;
    float _655 = _347 * _647;
    float2 _2003 = float2(_615, _623);
    float3 _659 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2003, float2(0.0), isnan(_2003))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2003, float2(0.0), isnan(_2003))).xyz;
    float _661 = _659.x;
    float _663 = _659.y;
    float _665 = _659.z;
    float2 _2017 = float2(_326, _328);
    float2 _667 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2017, float2(0.0), isnan(_2017)), level(_338)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2017, float2(0.0), isnan(_2017)), level(_338)).xy;
    float _669 = _667.x;
    float _671 = _667.y;
    float2 _2030 = float2(_326, _328);
    float4 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2030, float2(0.0), isnan(_2030)), level(_338)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2030, float2(0.0), isnan(_2030)), level(_338)).xyzw;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    float _681 = _673.w;
    float2 _2047 = float2(_611, _649);
    float3 _683 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2047, float2(0.0), isnan(_2047))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2047, float2(0.0), isnan(_2047))).xyz;
    float _685 = _683.x;
    float _687 = _683.y;
    float _689 = _683.z;
    float2 _2061 = float2(_611, _629);
    float3 _691 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2061, float2(0.0), isnan(_2061))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2061, float2(0.0), isnan(_2061))).xyz;
    float _693 = _691.x;
    float _695 = _691.y;
    float _697 = _691.z;
    float _699 = _545 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _701 = -_357;
    float _703 = _701 + _635;
    float _705 = _645 * _645;
    float _707 = fma(_703, (*spvDescriptorSet0.fp_c3)._m0[0].x, _357);
    float _709 = _355 * _357;
    float _711 = _705 * _705;
    float _713 = -_709;
    float _715 = fma(_633, _635, _713);
    float _717 = _711 * 16.0;
    float _719 = _661 * _663;
    float _721 = fma(_715, (*spvDescriptorSet0.fp_c3)._m0[0].x, _709);
    float _723 = _202 * (-10000.0);
    float _725 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _727 = _202 * _725;
    float _729 = _635 * _717;
    float _731 = abs(_723);
    bool _733 = _731 > 0.00999999977648258209228515625;
    float _735 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[26].x, _727);
    float _737 = -_651;
    float _739 = fma(_639, _729, _737);
    float _741 = _733 ? _723 : 0.00999999977648258209228515625;
    float _743 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[26].z, _735);
    float _745 = -_653;
    float _747 = fma(_641, _729, _745);
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _751 = -_655;
    float _753 = fma(_643, _729, _751);
    float _755 = _741 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _757 = precise::max(_707, 1.52587890625e-05);
    float _759 = fma(_739, (*spvDescriptorSet0.fp_c3)._m0[0].x, _651);
    float _761 = -_707;
    float _763 = _761 + _671;
    float _765 = -_749;
    float _767 = exp2(_765);
    float _769 = precise::max(_755, -127.0);
    float _771 = fma(_747, (*spvDescriptorSet0.fp_c3)._m0[0].x, _653);
    float _773 = fma(_661, _763, _707);
    float _775 = fma(_753, (*spvDescriptorSet0.fp_c3)._m0[0].x, _655);
    float _777 = -_769;
    float _779 = exp2(_777);
    float _781 = 1.0 / _757;
    float _783 = -_779;
    float _785 = _783 + 1.0;
    float _787 = exp2(_699);
    float _789 = _767 * _785;
    float _791 = 1.0 / _769;
    float _793 = _789 * _791;
    float _795 = fma(_743, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _797 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _799 = fma(_797, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _801 = fma(_795, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _803 = abs(_801);
    float _805 = log2(_803);
    float _807 = _805 * 1.5;
    float _809 = _707 * _781;
    float _811 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _813 = _811 + 1.0;
    float _815 = -_719;
    float _817 = _815 + 1.0;
    float _819 = _721 * _809;
    float _821 = exp2(_807);
    float _823 = -_787;
    float _825 = _823 + 1.0;
    float _827 = _759 * _809;
    float _829 = _771 * _809;
    float _831 = _775 * _809;
    float _833 = _825 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _835 = -_665;
    float _837 = _835 + 1.0;
    float _839 = _773 * _837;
    float _841 = _821 * 12.56637096405029296875;
    float _843 = fma(_817, _813, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _845 = 1.0 / _841;
    float _847 = _669 * _843;
    float _849 = precise::max(_773, 1.52587890625e-05);
    float _851 = -_819;
    float _853 = fma(_671, _847, _851);
    float _855 = 1.0 / _849;
    float _857 = -_833;
    float _859 = _857 + 1.0;
    float _861 = fma(_661, _853, _819);
    float _863 = _833 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _865 = abs(_859);
    float _867 = log2(_865);
    float _869 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _871 = _869 + 1.0;
    float _873 = _799 * _845;
    float _875 = fma(_817, _871, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _877 = _681 * _681;
    float _879 = _861 * _855;
    float _881 = _877 * _877;
    float _883 = _879 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _885 = _879 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _887 = _839 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _889 = _881 * 16.0;
    float _891 = _883 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _893 = _885 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _895 = -_887;
    float _897 = _895 + 1.0;
    float _899 = _867 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _901 = _593 * _891;
    float _903 = _591 * _891;
    float _905 = _599 * _891;
    float _907 = _867 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _909 = abs(_897);
    float _911 = log2(_909);
    float _913 = fma(_589, _893, _901);
    float _915 = fma(_583, _893, _903);
    float _917 = fma(_597, _893, _905);
    float _919 = _875 * _889;
    float _921 = _913 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _923 = _915 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _925 = _917 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _927 = exp2(_899);
    float _929 = _921 * 0.715200006961822509765625;
    float _931 = _679 * _919;
    float _933 = fma(_923, 0.2125999927520751953125, _929);
    float _935 = _911 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _937 = fma(_925, 0.072200000286102294921875, _933);
    float _939 = _719 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _941 = exp2(_907);
    float _943 = -_921;
    float _945 = _943 + _937;
    float _947 = _927 * _855;
    float _949 = -_923;
    float _951 = _949 + _937;
    float _953 = -_925;
    float _955 = _953 + _937;
    float _957 = exp2(_935);
    float _959 = fma(_939, _945, _921);
    float _961 = fma(_939, _951, _923);
    float _963 = _671 * _919;
    float _965 = -_831;
    float _967 = fma(_671, _931, _965);
    float _969 = fma(_939, _955, _925);
    float _971 = -_827;
    float _973 = fma(_675, _963, _971);
    float _975 = -_829;
    float _977 = fma(_677, _963, _975);
    float _979 = fma(_661, _967, _831);
    float _981 = _941 * _959;
    float _983 = fma(_661, _973, _827);
    float _985 = fma(_661, _977, _829);
    float _987 = _941 * _969;
    float _989 = _941 * _961;
    float _991 = _981 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _993 = -_957;
    float _995 = spvFAdd(_993, 1.00010001659393310546875);
    float _997 = -_957;
    float _999 = _997 + 1.0;
    float _1001 = _985 * _947;
    float _1003 = _979 * _947;
    float _1005 = _987 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1007 = -_887;
    float _1009 = _1007 + _999;
    float _1011 = 1.0 / _995;
    float _1013 = _983 * _947;
    float _1015 = fma(_1001, (*spvDescriptorSet0.fp_c3)._m0[27].y, _991);
    float _1017 = _989 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1019 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1021 = fma(_1003, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1005);
    float _1023 = fma(_687, _863, _1015);
    float _1025 = fma(_1013, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1017);
    float _1027 = _695 * _1019;
    float _1029 = fma(_689, _863, _1021);
    float _1031 = fma(_685, _863, _1025);
    float _1033 = _693 * _1019;
    float _1035 = fma(_887, _1023, _1027);
    float _1037 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1039 = _697 * _1019;
    float _1041 = fma(_887, _1031, _1033);
    float _1043 = _1011 * _1035;
    float _1045 = _793 * _1037;
    float _1047 = fma(_887, _1029, _1039);
    float _1049 = _1011 * _1041;
    float _1051 = _1043 * 0.715200006961822509765625;
    float _1053 = _1011 * _1047;
    float _1055 = fma(_1049, 0.2125999927520751953125, _1051);
    float _1057 = -_1045;
    float _1059 = exp2(_1057);
    float _1061 = fma(_1053, 0.072200000286102294921875, _1055);
    float _1063 = 1.0 / _1061;
    float _1065 = -_1059;
    float _1067 = _1065 + 1.0;
    float _1069 = _873 * _1067;
    float _1071 = _1069 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1073 = _1063 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1075 = precise::clamp(_1073, 0.0, 1.0);
    float _1077 = fma(_1075, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1079 = _1069 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1081 = _1059 * _1077;
    float _1083 = _1069 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1085 = fma(_1049, _1081, _1071);
    float _1087 = fma(_1043, _1081, _1083);
    float _1089 = fma(_1053, _1081, _1079);
    out.m_46.x = _1085;
    out.m_46.y = _1087;
    out.m_46.z = _1089;
    out.m_46.w = _999;
    return out;
}

