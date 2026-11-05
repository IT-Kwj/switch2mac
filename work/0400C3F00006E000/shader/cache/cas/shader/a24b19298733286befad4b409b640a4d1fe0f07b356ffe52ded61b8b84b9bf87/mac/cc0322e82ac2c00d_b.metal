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
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _58(thread const int& _2676, thread const int& _2677, thread const int& _2678, thread const int& _2679, thread int& _2680, thread int& _2681, thread int& _2682, thread int& _2683, thread int& _2684)
{
    float _2687 = as_type<float>(_2678) + 0.0;
    bool _2689 = _2687 != 0.0;
    bool _2691 = isnan(_2687);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan(0.0);
    bool _2697 = _2693 || _2695;
    int _2699 = as_type<int>(_2687);
    int _2701 = _2677;
    int _2703 = _2697 ? (-1) : 0;
    if (!_2697)
    {
        float _2705 = as_type<float>(_2678) * 1.0;
        _2699 = as_type<int>(_2705);
    }
    int _2707 = _2699;
    bool _2709 = !_2697;
    int _2711 = _2707;
    if (!_2709)
    {
        float _2713 = as_type<float>(_2678) + 0.0;
        bool _2715 = _2713 >= 0.0;
        bool _2717 = isnan(_2713);
        bool _2719 = _2715 || _2717;
        bool _2721 = isnan(0.0);
        bool _2723 = _2719 || _2721;
        int _2725 = as_type<int>(_2713);
        _2703 = _2723 ? (-1) : 0;
        if (!_2723)
        {
            _2725 = 2147483647;
        }
        int _2727 = _2725;
        bool _2729 = !_2723;
        _2711 = _2727;
        if (!_2729)
        {
            float _2731 = abs(as_type<float>(_2678));
            float _2733 = _2731 + 0.0;
            bool _2735 = _2733 > as_type<float>(0x7f800000u /* inf */);
            bool _2737 = isnan(_2733);
            bool _2739 = _2735 || _2737;
            bool _2741 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2743 = _2739 || _2741;
            int _2745 = as_type<int>(_2733);
            _2703 = _2743 ? (-1) : 0;
            if (_2743)
            {
                float _2747 = as_type<float>(_2678) + 1.0;
                _2745 = as_type<int>(_2747);
            }
            int _2749 = _2745;
            _2711 = _2749;
            if (!_2743)
            {
                float _2751 = abs(as_type<float>(_2678));
                float _2753 = _2751 + (-0.0);
                float _2755 = 0.0 + _2753;
                bool _2757 = _2755 != as_type<float>(0x7f800000u /* inf */);
                bool _2759 = isnan(_2755);
                bool _2761 = _2757 || _2759;
                bool _2763 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2765 = _2761 || _2763;
                int _2767 = as_type<int>(_2755);
                _2703 = _2765 ? (-1) : 0;
                if (!_2765)
                {
                    _2767 = _2678;
                }
                int _2769 = _2767;
                bool _2771 = !_2765;
                _2711 = _2769;
                if (!_2771)
                {
                    float _2773 = as_type<float>(_2678) * 18446744073709551616.0;
                    float _2775 = rsqrt(_2773);
                    float _2777 = _2773 * _2775;
                    float _2779 = _2775 * 0.5;
                    float _2781 = -_2777;
                    float _2783 = 0.0 + _2781;
                    float _2785 = fma(_2779, _2783, 0.5);
                    float _2787 = fma(_2777, _2785, _2777);
                    float _2789 = -_2787;
                    float _2791 = 0.0 + _2789;
                    float _2793 = fma(_2787, _2791, _2773);
                    float _2795 = fma(_2779, _2793, _2787);
                    float _2797 = _2795 * 2.3283064365386962890625e-10;
                    _2711 = as_type<int>(_2797);
                    _2701 = as_type<int>(_2787);
                }
            }
        }
    }
    int _2799 = _2711;
    int _2801 = _2701;
    int _2803 = _2703;
    _2680 = _2799;
    _2681 = _2679;
    _2682 = 0;
    _2683 = _2801;
    _2684 = _2803;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _254 = false;
    float _62 = gl_FragCoord.w;
    float _64 = in.m_47.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_47.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_47.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _84 = precise::max(0.0, _82);
    float _86 = 1.0 / _62;
    float _88 = _86 * _68;
    float _90 = _86 * _74;
    float _92 = _86 * _80;
    float _94 = _88 * _88;
    float _96 = fma(_90, _90, _94);
    float _98 = fma(_92, _92, _96);
    float _100 = rsqrt(_98);
    float _102 = _90 * _100;
    float _104 = _92 * _100;
    float _106 = _88 * _100;
    float _108 = _102 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _110 = _104 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _112 = -_106;
    float _114 = -_84;
    float _116 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[13].z, _114);
    float _118 = _108 * _108;
    float _120 = _110 * _110;
    float _122 = _118 + _120;
    float _124 = sqrt(_122);
    bool _128 = _124 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _130 = _84;
    float _132 = _100;
    float _134 = _116;
    float _136 = _108;
    float _138 = _110;
    if (!_128)
    {
        _130 = _120;
    }
    float _140 = _130;
    float _142 = _140;
    if (!_128)
    {
        _132 = _118;
    }
    float _144 = _132;
    bool _146 = !_128;
    float _148 = _144;
    if (!_146)
    {
        float _150 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _152 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _154 = _124 + _152;
        float _156 = _116 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _158 = rsqrt(_122);
        float _160 = _154 * _150;
        float _162 = _160 * 0.15915493667125701904296875;
        float _164 = _162 * 6.283185482025146484375;
        float _166 = sin(_164);
        float _168 = _162 * 6.283185482025146484375;
        float _170 = cos(_168);
        float _172 = fma(_166, _156, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _174 = _158 * _172;
        float _176 = _170 + (-1.0);
        float _178 = _108 * _174;
        float _180 = _110 * _174;
        float _182 = _176 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _184 = _180 * _180;
        float _186 = fma(_116, _170, _182);
        float _188 = _178 * _178;
        _134 = _186;
        _148 = _188;
        _142 = _184;
        _136 = _178;
        _138 = _180;
    }
    float _190 = _134;
    float _192 = _148;
    float _194 = _142;
    float _196 = _136;
    float _198 = _138;
    float _200 = fma(_190, _190, _192);
    float _202 = _200 + _194;
    float _204 = rsqrt(_202);
    float _206 = _204 * _190;
    float _208 = _204 * _196;
    float _210 = _204 * _198;
    float _212 = -_206;
    float _214 = precise::max(0.0, _212);
    float _216 = abs(_214);
    float _218 = -_216;
    float _220 = _218 + 1.0;
    float _222 = fma(_214, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _224 = as_type<int>(_220) + (-218103808);
    float _226 = fma(_214, _222, -0.212114393711090087890625);
    bool _228 = uint(_224) >= 1920991232u;
    float _230 = fma(_214, _226, 1.570728778839111328125);
    bool _232 = !_228;
    float _252;
    if (!_232)
    {
        int _234 = 0;
        int _236 = 0;
        int _238 = as_type<int>(_220);
        int _240 = 1104;
        int _242;
        int _244;
        int _246;
        int _248;
        int _250;
        _58(_234, _236, _238, _240, _242, _244, _246, _248, _250);
        _252 = as_type<float>(_242);
        _254 = true;
    }
    else
    {
        float _256 = rsqrt(_220);
        float _258 = _220 * _256;
        float _260 = _256 * 0.5;
        float _262 = -_258;
        float _264 = 0.0 + _262;
        float _266 = fma(_260, _264, 0.5);
        float _268 = fma(_258, _266, _258);
        float _270 = -_268;
        float _272 = 0.0 + _270;
        float _274 = fma(_268, _272, _220);
        float _276 = fma(_260, _274, _268);
        _252 = _276;
    }
    _254 = false;
    float _278 = _252;
    bool _280 = _206 > 0.0;
    float _282 = _104 * _104;
    float _284 = _102 * _102;
    float _286 = _282 + _284;
    if (_280)
    {
        discard_fragment();
    }
    float _288 = rsqrt(_286);
    float _290 = _230 * _278;
    float _292 = _290 * 0.636619746685028076171875;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = -_294;
    float _298 = _296 + 1.0;
    float _300 = sqrt(_298);
    float _302 = _104 * _288;
    float _304 = _102 * _288;
    float _306 = abs(_302);
    float _308 = abs(_304);
    float _310 = precise::max(_306, _308);
    float _312 = precise::max(_310, 9.9999997473787516355514526367188e-05);
    float _314 = -_300;
    float _316 = _314 + 1.0;
    float _318 = 1.0 / _312;
    float _320 = _316 * 0.5;
    float _322 = -_318;
    float _324 = _302 * _322;
    float _326 = _304 * _318;
    float _328 = fma(_324, _320, 0.5);
    float _330 = fma(_326, _320, 0.5);
    if (_280)
    {
        out.m_50.x = 0.0;
        out.m_50.y = 0.0;
        out.m_50.z = 0.0;
        out.m_50.w = 0.0;
        return out;
    }
    float2 _1454;
    _1454.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_328, _330));
    _1454.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_328, _330));
    float _332 = _1454.x;
    float _334 = _332 * 256.0;
    int _336 = int(_334);
    float _338 = float(uint(_336));
    float _340 = _338 * 0.00390625;
    float2 _1470 = float2(_328, _330);
    float4 _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1470, float2(0.0), isnan(_1470)), level(_340)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1470, float2(0.0), isnan(_1470)), level(_340)).xyzw;
    float _345 = _343.x;
    float _347 = _343.y;
    float _349 = _343.z;
    float _351 = _343.w;
    float2 _1489 = float2(_328, _330);
    float4 _353 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1489, float2(0.0), isnan(_1489)), level(_340)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1489, float2(0.0), isnan(_1489)), level(_340)).xyzw;
    float _355 = _353.x;
    float _357 = _353.y;
    float _359 = _353.z;
    float _361 = _353.w;
    float2 _1506 = float2(_328, _330);
    float2 _365 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1506, float2(0.0), isnan(_1506)), level(_340)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1506, float2(0.0), isnan(_1506)), level(_340)).xy;
    float _367 = _365.x;
    float _369 = _365.y;
    float2 _1519 = float2(_328, _330);
    float2 _371 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1519, float2(0.0), isnan(_1519)), level(_340)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1519, float2(0.0), isnan(_1519)), level(_340)).xy;
    float _373 = _371.x;
    float _375 = _371.y;
    float _377 = _208 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _379 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _381 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _383 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _385 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _387 = _106 * _379;
    float _389 = _106 * _381;
    float _391 = _106 * _383;
    float _393 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _395 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _387);
    float _397 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _389);
    float _399 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _391);
    float _401 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _403 = -_104;
    float _405 = fma(_403, _385, _395);
    float _407 = fma(_104, _385, _395);
    float _409 = -_104;
    float _411 = fma(_409, _393, _397);
    float _413 = fma(_104, _393, _397);
    float _415 = -_104;
    float _417 = fma(_415, _401, _399);
    float _419 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _421 = fma(_104, _401, _399);
    float _423 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _425 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _427 = -_102;
    float _429 = fma(_427, _419, _411);
    float _431 = fma(_102, _419, _413);
    float _433 = -_102;
    float _435 = fma(_433, _425, _417);
    float _437 = fma(_102, _425, _421);
    float _439 = fma(_102, _423, _407);
    float _441 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _443 = _102 * _106;
    float _445 = -_102;
    float _447 = fma(_445, _423, _405);
    float _449 = -_106;
    float _451 = _102 * _449;
    float _453 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _455 = fma(_441, _443, _439);
    float _457 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _459 = fma(_441, _451, _447);
    float _461 = fma(_453, _451, _435);
    float _463 = fma(_453, _443, _437);
    float _465 = fma(_457, _451, _429);
    float _467 = fma(_457, _443, _431);
    float _469 = -_104;
    float _471 = _106 * _469;
    float _473 = _106 * _104;
    float _475 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _477 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _479 = _102 * _104;
    float _481 = fma(_475, _471, _465);
    float _483 = fma(_475, _473, _467);
    float _485 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _487 = fma(_477, _471, _459);
    float _489 = fma(_477, _473, _455);
    float _491 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _493 = fma(_485, _471, _461);
    float _495 = -_106;
    float _497 = _495 + 1.0;
    float _499 = precise::clamp(_497, 0.0, 1.0);
    float _501 = fma(_485, _473, _463);
    float _503 = -_377;
    float _505 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[11].y, _503);
    float _507 = fma(_491, _479, _487);
    float _509 = fma(_491, _479, _489);
    float _511 = abs(_499);
    float _513 = log2(_511);
    float _515 = -_210;
    float _517 = fma(_515, (*spvDescriptorSet0.fp_c3)._m0[11].z, _505);
    float _519 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _521 = -_106;
    float _523 = fma(_521, _106, _284);
    float _525 = fma(_519, _479, _481);
    float _527 = fma(_519, _479, _483);
    float _529 = _513 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _531 = _104 * (-3.0);
    float _533 = exp2(_529);
    float _535 = -_104;
    float _537 = fma(_535, _531, -1.0);
    float _539 = _533 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _541 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _543 = fma(_539, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _545 = precise::clamp(_543, 0.0, 1.0);
    float _547 = fma(_541, _479, _493);
    float _549 = fma(_541, _479, _501);
    float _551 = -_545;
    float _553 = _551 + 1.0;
    float _555 = fma(_517, -0.5, 0.5);
    float _557 = fma(_517, 0.5, 0.5);
    float _559 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _561 = abs(_553);
    float _563 = log2(_561);
    float _565 = fma(_282, 3.0, -1.0);
    float _567 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _569 = fma(_559, _537, _507);
    float _571 = fma(_559, _565, _509);
    float _573 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _575 = fma(_567, _537, _547);
    float _577 = sqrt(_555);
    float _579 = fma(_573, _537, _525);
    float _581 = fma(_573, _565, _527);
    float _583 = fma(_557, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _585 = fma(_567, _565, _549);
    float _587 = _563 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _589 = fma(_557, _583, -0.212114393711090087890625);
    float _591 = in.m_52.x;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = in.m_52.y;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = fma(_557, _589, 1.570728778839111328125);
    float _605 = exp2(_587);
    float _607 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _609 = _577 * 0.636619746685028076171875;
    float _611 = fma(_607, _523, _569);
    float _613 = -_603;
    float _615 = fma(_609, _613, 1.0);
    float _617 = fma(_607, _523, _571);
    float _619 = _206 + 1.0;
    float _621 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _623 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _625 = fma(_621, _523, _579);
    float _627 = fma(_623, _523, _575);
    float _629 = fma(_623, _523, _585);
    float _631 = -_206;
    float _633 = fma(_605, _619, _631);
    float _635 = fma(_621, _523, _581);
    float _637 = fma(_206, -0.5, 0.5);
    float _639 = fma(_633, 0.5, 0.5);
    float _641 = _86 * _595;
    float _643 = _86 * _601;
    float _645 = _351 * _351;
    float _647 = _361 * _361;
    float _649 = _645 * _645;
    float _651 = _647 * _647;
    float _653 = _649 * 16.0;
    float _655 = _367 * _369;
    float _657 = _651 * 16.0;
    float _659 = _369 * _653;
    float _661 = _375 * _657;
    float _663 = -_655;
    float _665 = fma(_373, _375, _663);
    float _667 = _345 * _659;
    float _669 = _347 * _659;
    float _671 = _349 * _659;
    float _673 = fma(_665, (*spvDescriptorSet0.fp_c3)._m0[0].x, _655);
    float _675 = -_667;
    float _677 = fma(_355, _661, _675);
    float _679 = -_669;
    float _681 = fma(_357, _661, _679);
    float _683 = -_671;
    float _685 = fma(_359, _661, _683);
    float _687 = -_369;
    float _689 = _687 + _375;
    float _691 = fma(_677, (*spvDescriptorSet0.fp_c3)._m0[0].x, _667);
    float2 _2044 = float2(_328, _330);
    float4 _693 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2044, float2(0.0), isnan(_2044)), level(_340)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2044, float2(0.0), isnan(_2044)), level(_340)).xyzw;
    float _695 = _693.x;
    float _697 = _693.y;
    float _699 = _693.z;
    float _701 = _693.w;
    float2 _2061 = float2(_328, _330);
    float2 _703 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2061, float2(0.0), isnan(_2061)), level(_340)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2061, float2(0.0), isnan(_2061)), level(_340)).xy;
    float _705 = _703.x;
    float _707 = _703.y;
    float2 _2074 = float2(_328, _330);
    float2 _709 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2074, float2(0.0), isnan(_2074)), level(_340)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2074, float2(0.0), isnan(_2074)), level(_340)).xy;
    float _711 = _709.x;
    float _713 = _709.y;
    float2 _2087 = float2(_641, _643);
    float3 _717 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2087, float2(0.0), isnan(_2087))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2087, float2(0.0), isnan(_2087))).xyz;
    float _719 = _717.x;
    float _721 = _717.y;
    float _723 = _717.z;
    float2 _2101 = float2(_328, _330);
    float4 _725 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2101, float2(0.0), isnan(_2101)), level(_340)), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2101, float2(0.0), isnan(_2101)), level(_340)).xyzw;
    float _727 = _725.x;
    float _729 = _725.y;
    float _731 = _725.z;
    float _733 = _725.w;
    float _735 = fma(_689, (*spvDescriptorSet0.fp_c3)._m0[0].x, _369);
    float2 _2123 = float2(_615, _639);
    float3 _737 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2123, float2(0.0), isnan(_2123))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2123, float2(0.0), isnan(_2123))).xyz;
    float _739 = _737.x;
    float _741 = _737.y;
    float _743 = _737.z;
    float2 _2137 = float2(_615, _637);
    float3 _745 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2137, float2(0.0), isnan(_2137))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2137, float2(0.0), isnan(_2137))).xyz;
    float _747 = _745.x;
    float _749 = _745.y;
    float _751 = _745.z;
    float _753 = fma(_681, (*spvDescriptorSet0.fp_c3)._m0[0].x, _669);
    float _755 = precise::max(_735, 1.52587890625e-05);
    float _757 = fma(_685, (*spvDescriptorSet0.fp_c3)._m0[0].x, _671);
    float _759 = _563 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _761 = 1.0 / _755;
    float _763 = _735 * _761;
    float _765 = _673 * _763;
    float _767 = _691 * _763;
    float _769 = _753 * _763;
    float _771 = _701 * _701;
    float _773 = _705 * _707;
    float _775 = -_707;
    float _777 = _775 + _713;
    float _779 = _719 * _721;
    float _781 = _771 * _771;
    float _783 = _757 * _763;
    float _785 = -_773;
    float _787 = fma(_711, _713, _785);
    float _789 = -_723;
    float _791 = _789 + 1.0;
    float _793 = _781 * 16.0;
    float _795 = fma(_787, (*spvDescriptorSet0.fp_c3)._m0[0].x, _773);
    float _797 = _707 * _793;
    float _799 = fma(_777, (*spvDescriptorSet0.fp_c3)._m0[0].x, _707);
    float _801 = _695 * _797;
    float _803 = _697 * _797;
    float _805 = -_735;
    float _807 = _805 + _799;
    float _809 = _699 * _797;
    float _811 = precise::max(_799, 1.52587890625e-05);
    float _813 = fma(_719, _807, _735);
    float _815 = _733 * _733;
    float _817 = exp2(_759);
    float _819 = _813 * _791;
    float _821 = _815 * _815;
    float _823 = -_779;
    float _825 = _823 + 1.0;
    float _827 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _829 = _827 + 1.0;
    float _831 = _779 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _833 = _821 * 16.0;
    float _835 = 1.0 / _811;
    float _837 = fma(_825, _829, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _839 = _713 * _833;
    float _841 = precise::max(_813, 1.52587890625e-05);
    float _843 = -_801;
    float _845 = fma(_727, _839, _843);
    float _847 = -_803;
    float _849 = fma(_729, _839, _847);
    float _851 = -_817;
    float _853 = _851 + 1.0;
    float _855 = 1.0 / _841;
    float _857 = -_809;
    float _859 = fma(_731, _839, _857);
    float _861 = fma(_845, (*spvDescriptorSet0.fp_c3)._m0[0].x, _801);
    float _863 = _853 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _865 = fma(_849, (*spvDescriptorSet0.fp_c3)._m0[0].x, _803);
    float _867 = _819 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _869 = fma(_859, (*spvDescriptorSet0.fp_c3)._m0[0].x, _809);
    float _871 = _795 * _835;
    float _873 = -_863;
    float _875 = _873 + 1.0;
    float _877 = _863 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _879 = _871 * _837;
    float _881 = abs(_875);
    float _883 = log2(_881);
    float _885 = -_765;
    float _887 = fma(_799, _879, _885);
    float _889 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _891 = _889 + 1.0;
    float _893 = fma(_719, _887, _765);
    float _895 = -_867;
    float _897 = _895 + 1.0;
    float _899 = fma(_825, _891, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _901 = _893 * _855;
    float _903 = _899 * _835;
    float _905 = _901 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _907 = _901 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _909 = _869 * _903;
    float _911 = _883 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _913 = _905 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _915 = _907 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _917 = abs(_897);
    float _919 = log2(_917);
    float _921 = _883 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _923 = _635 * _913;
    float _925 = _617 * _913;
    float _927 = _629 * _913;
    float _929 = -_783;
    float _931 = fma(_799, _909, _929);
    float _933 = fma(_625, _915, _923);
    float _935 = fma(_611, _915, _925);
    float _937 = _799 * _903;
    float _939 = fma(_627, _915, _927);
    float _941 = _933 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _943 = _935 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _945 = -_767;
    float _947 = fma(_861, _937, _945);
    float _949 = _939 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _951 = _941 * 0.715200006961822509765625;
    float _953 = exp2(_911);
    float _955 = _919 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _957 = -_769;
    float _959 = fma(_865, _937, _957);
    float _961 = fma(_943, 0.2125999927520751953125, _951);
    float _963 = fma(_719, _931, _783);
    float _965 = fma(_719, _947, _767);
    float _967 = fma(_719, _959, _769);
    float _969 = fma(_949, 0.072200000286102294921875, _961);
    float _971 = exp2(_955);
    float _973 = -_941;
    float _975 = _973 + _969;
    float _977 = fma(_831, _975, _941);
    float _979 = exp2(_921);
    float _981 = -_943;
    float _983 = _981 + _969;
    float _985 = -_949;
    float _987 = _985 + _969;
    float _989 = _953 * _855;
    float _991 = fma(_831, _983, _943);
    float _993 = fma(_831, _987, _949);
    float _995 = _967 * _989;
    float _997 = -_971;
    float _999 = spvFAdd(_997, 1.00010001659393310546875);
    float _1001 = -_971;
    float _1003 = _1001 + 1.0;
    float _1005 = _965 * _989;
    float _1007 = _963 * _989;
    float _1009 = 1.0 / _999;
    float _1011 = _979 * _977;
    float _1013 = _979 * _991;
    float _1015 = _979 * _993;
    float _1017 = -_867;
    float _1019 = _1017 + _1003;
    float _1021 = _1011 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1023 = _1013 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1025 = _1015 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1027 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1029 = fma(_995, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1021);
    float _1031 = fma(_1005, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1023);
    float _1033 = fma(_1007, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1025);
    float _1035 = _749 * _1027;
    float _1037 = fma(_741, _877, _1029);
    float _1039 = fma(_739, _877, _1031);
    float _1041 = _747 * _1027;
    float _1043 = fma(_743, _877, _1033);
    float _1045 = fma(_867, _1037, _1035);
    float _1047 = _751 * _1027;
    float _1049 = fma(_867, _1039, _1041);
    float _1051 = _1009 * _1045;
    float _1053 = fma(_867, _1043, _1047);
    float _1055 = _1009 * _1049;
    float _1057 = _1051 * 0.715200006961822509765625;
    float _1059 = _1009 * _1053;
    float _1061 = fma(_1055, 0.2125999927520751953125, _1057);
    float _1063 = fma(_1059, 0.072200000286102294921875, _1061);
    float _1065 = 1.0 / _1063;
    float _1067 = _1065 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1069 = precise::clamp(_1067, 0.0, 1.0);
    float _1071 = fma(_1069, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1073 = _1055 * _1071;
    float _1075 = _1051 * _1071;
    float _1077 = _1059 * _1071;
    out.m_50.x = _1073;
    out.m_50.y = _1075;
    out.m_50.z = _1077;
    out.m_50.w = _1003;
    return out;
}

