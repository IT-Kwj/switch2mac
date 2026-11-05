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
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_16 [[id(11)]];
    sampler fp_t_tcb_16Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_18 [[id(13)]];
    sampler fp_t_tcb_18Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d<float> fp_t_tcb_14 [[id(17)]];
    sampler fp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_1A [[id(19)]];
    sampler fp_t_tcb_1ASmplr [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_10Smplr_w [[id(22)]];
    sampler fp_t_tcb_ASmplr_w [[id(23)]];
    sampler fp_t_tcb_12Smplr_w [[id(24)]];
    sampler fp_t_tcb_ESmplr_w [[id(25)]];
    sampler fp_t_tcb_16Smplr_w [[id(26)]];
    sampler fp_t_tcb_18Smplr_w [[id(27)]];
    sampler fp_t_tcb_CSmplr_w [[id(28)]];
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
void _60(thread const int& _2555, thread const int& _2556, thread const int& _2557, thread const int& _2558, thread int& _2559, thread int& _2560, thread int& _2561, thread int& _2562, thread int& _2563, thread int& _2564)
{
    float _2567 = as_type<float>(_2555) + 0.0;
    bool _2569 = _2567 != 0.0;
    bool _2571 = isnan(_2567);
    bool _2573 = _2569 || _2571;
    bool _2575 = isnan(0.0);
    bool _2577 = _2573 || _2575;
    int _2579 = as_type<int>(_2567);
    int _2581 = _2556;
    int _2583 = _2557;
    int _2585 = _2577 ? (-1) : 0;
    if (!_2577)
    {
        float _2587 = as_type<float>(_2555) * 1.0;
        _2579 = as_type<int>(_2587);
    }
    int _2589 = _2579;
    bool _2591 = !_2577;
    int _2593 = _2589;
    if (!_2591)
    {
        float _2595 = as_type<float>(_2555) + 0.0;
        bool _2597 = _2595 >= 0.0;
        bool _2599 = isnan(_2595);
        bool _2601 = _2597 || _2599;
        bool _2603 = isnan(0.0);
        bool _2605 = _2601 || _2603;
        int _2607 = as_type<int>(_2595);
        _2585 = _2605 ? (-1) : 0;
        if (!_2605)
        {
            _2607 = 2147483647;
        }
        int _2609 = _2607;
        bool _2611 = !_2605;
        _2593 = _2609;
        if (!_2611)
        {
            float _2613 = abs(as_type<float>(_2555));
            float _2615 = _2613 + 0.0;
            bool _2617 = _2615 > as_type<float>(0x7f800000u /* inf */);
            bool _2619 = isnan(_2615);
            bool _2621 = _2617 || _2619;
            bool _2623 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2625 = _2621 || _2623;
            int _2627 = as_type<int>(_2615);
            _2585 = _2625 ? (-1) : 0;
            if (_2625)
            {
                float _2629 = as_type<float>(_2555) + 1.0;
                _2627 = as_type<int>(_2629);
            }
            int _2631 = _2627;
            _2593 = _2631;
            if (!_2625)
            {
                float _2633 = abs(as_type<float>(_2555));
                float _2635 = _2633 + (-0.0);
                float _2637 = 0.0 + _2635;
                bool _2639 = _2637 != as_type<float>(0x7f800000u /* inf */);
                bool _2641 = isnan(_2637);
                bool _2643 = _2639 || _2641;
                bool _2645 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2647 = _2643 || _2645;
                int _2649 = as_type<int>(_2637);
                _2585 = _2647 ? (-1) : 0;
                if (!_2647)
                {
                    _2649 = _2555;
                }
                int _2651 = _2649;
                bool _2653 = !_2647;
                _2593 = _2651;
                if (!_2653)
                {
                    float _2655 = as_type<float>(_2555) * 18446744073709551616.0;
                    float _2657 = rsqrt(_2655);
                    float _2659 = _2655 * _2657;
                    float _2661 = _2657 * 0.5;
                    float _2663 = -_2659;
                    float _2665 = 0.0 + _2663;
                    float _2667 = fma(_2661, _2665, 0.5);
                    float _2669 = fma(_2659, _2667, _2659);
                    float _2671 = -_2669;
                    float _2673 = 0.0 + _2671;
                    float _2675 = fma(_2669, _2673, _2655);
                    float _2677 = fma(_2661, _2675, _2669);
                    float _2679 = _2677 * 2.3283064365386962890625e-10;
                    _2593 = as_type<int>(_2679);
                    _2581 = as_type<int>(_2669);
                    _2583 = as_type<int>(_2665);
                }
            }
        }
    }
    int _2681 = _2593;
    int _2683 = _2581;
    int _2685 = _2583;
    int _2687 = _2585;
    _2559 = _2681;
    _2560 = _2558;
    _2561 = 0;
    _2562 = _2683;
    _2563 = _2685;
    _2564 = _2687;
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
    float _96 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _98 = fma(_90, _90, _94);
    float _100 = precise::max(0.0, _96);
    float _102 = rsqrt(_98);
    float _104 = _88 * _102;
    float _106 = _90 * _102;
    float _108 = _86 * _102;
    float _110 = _104 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _112 = _106 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _114 = -_108;
    float _116 = -_100;
    float _118 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[13].z, _116);
    float _120 = _110 * _110;
    float _122 = _112 * _112;
    float _124 = _120 + _122;
    float _126 = sqrt(_124);
    bool _130 = _126 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _132 = _102;
    float _134 = _100;
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
    float2 _1406;
    _1406.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_332, _334));
    _1406.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_332, _334));
    float _336 = _1406.x;
    float _338 = _336 * 256.0;
    int _340 = int(_338);
    float _342 = float(uint(_340));
    float _344 = _342 * 0.00390625;
    float2 _1422 = float2(_332, _334);
    float4 _347 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1422, float2(0.0), isnan(_1422)), level(_344)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1422, float2(0.0), isnan(_1422)), level(_344)).xyzw;
    float _349 = _347.x;
    float _351 = _347.y;
    float _353 = _347.z;
    float _355 = _347.w;
    float2 _1441 = float2(_332, _334);
    float4 _357 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1441, float2(0.0), isnan(_1441)), level(_344)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1441, float2(0.0), isnan(_1441)), level(_344)).xyzw;
    float _359 = _357.x;
    float _361 = _357.y;
    float _363 = _357.z;
    float _365 = _357.w;
    float2 _1458 = float2(_332, _334);
    float2 _369 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1458, float2(0.0), isnan(_1458)), level(_344)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1458, float2(0.0), isnan(_1458)), level(_344)).xy;
    float _371 = _369.x;
    float _373 = _369.y;
    float2 _1471 = float2(_332, _334);
    float2 _375 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1471, float2(0.0), isnan(_1471)), level(_344)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1471, float2(0.0), isnan(_1471)), level(_344)).xy;
    float _377 = _375.x;
    float _379 = _375.y;
    float _381 = -_108;
    float _383 = _104 * _381;
    float _385 = _210 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _387 = -_108;
    float _389 = fma(_387, _108, _288);
    float _391 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _393 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _395 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _397 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _399 = _108 * _391;
    float _401 = _108 * _393;
    float _403 = _108 * _395;
    float _405 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _407 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _399);
    float _409 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _401);
    float _411 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _403);
    float _413 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _415 = -_106;
    float _417 = fma(_415, _397, _407);
    float _419 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _421 = fma(_106, _397, _407);
    float _423 = -_106;
    float _425 = fma(_423, _413, _411);
    float _427 = fma(_106, _413, _411);
    float _429 = -_106;
    float _431 = fma(_429, _405, _409);
    float _433 = -_104;
    float _435 = fma(_433, _419, _417);
    float _437 = fma(_106, _405, _409);
    float _439 = fma(_104, _419, _421);
    float _441 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _443 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _445 = _104 * _108;
    float _447 = -_104;
    float _449 = fma(_447, _441, _431);
    float _451 = fma(_104, _441, _437);
    float _453 = -_104;
    float _455 = fma(_453, _443, _425);
    float _457 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _459 = fma(_104, _443, _427);
    float _461 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _463 = _104 * _106;
    float _465 = fma(_457, _445, _439);
    float _467 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _469 = fma(_457, _383, _435);
    float _471 = fma(_461, _445, _459);
    float _473 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _475 = fma(_467, _383, _449);
    float _477 = fma(_467, _445, _451);
    float _479 = -_106;
    float _481 = _108 * _479;
    float _483 = _108 * _106;
    float _485 = fma(_461, _383, _455);
    float _487 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _489 = fma(_473, _481, _469);
    float _491 = fma(_473, _483, _465);
    float _493 = -_108;
    float _495 = _493 + 1.0;
    float _497 = precise::clamp(_495, 0.0, 1.0);
    float _499 = fma(_487, _481, _475);
    float _501 = fma(_487, _483, _477);
    float _503 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _505 = -_385;
    float _507 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[11].y, _505);
    float _509 = abs(_497);
    float _511 = log2(_509);
    float _513 = fma(_503, _481, _485);
    float _515 = fma(_503, _483, _471);
    float _517 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _519 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _521 = -_212;
    float _523 = fma(_521, (*spvDescriptorSet0.fp_c3)._m0[11].z, _507);
    float _525 = fma(_517, _463, _489);
    float _527 = fma(_517, _463, _491);
    float _529 = fma(_519, _463, _513);
    float _531 = fma(_519, _463, _515);
    float _533 = _511 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _535 = exp2(_533);
    float _537 = _535 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _539 = fma(_537, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _541 = precise::clamp(_539, 0.0, 1.0);
    float _543 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _545 = -_541;
    float _547 = _545 + 1.0;
    float _549 = fma(_543, _463, _499);
    float _551 = fma(_543, _463, _501);
    float _553 = _106 * (-3.0);
    float _555 = abs(_547);
    float _557 = log2(_555);
    float _559 = -_106;
    float _561 = fma(_559, _553, -1.0);
    float _563 = fma(_286, 3.0, -1.0);
    float _565 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _567 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _569 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _571 = fma(_565, _561, _525);
    float _573 = fma(_565, _563, _527);
    float _575 = fma(_567, _561, _549);
    float _577 = fma(_523, -0.5, 0.5);
    float _579 = fma(_569, _561, _529);
    float _581 = _557 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _583 = fma(_567, _563, _551);
    float _585 = fma(_569, _563, _531);
    float _587 = in.m_54.x;
    float _589 = gl_FragCoord.w;
    float _591 = _587 * _589;
    float _593 = sqrt(_577);
    float _595 = fma(_523, 0.5, 0.5);
    float _597 = _208 + 1.0;
    float _599 = in.m_54.y;
    float _601 = gl_FragCoord.w;
    float _603 = _599 * _601;
    float _605 = fma(_595, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _607 = exp2(_581);
    float _609 = fma(_595, _605, -0.212114393711090087890625);
    float _611 = fma(_595, _609, 1.570728778839111328125);
    float _613 = -_208;
    float _615 = fma(_607, _597, _613);
    float _617 = _593 * 0.636619746685028076171875;
    float _619 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _621 = fma(_615, 0.5, 0.5);
    float _623 = -_611;
    float _625 = fma(_617, _623, 1.0);
    float _627 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _629 = fma(_619, _389, _571);
    float _631 = fma(_619, _389, _573);
    float _633 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _635 = fma(_627, _389, _575);
    float _637 = fma(_627, _389, _583);
    float _639 = fma(_633, _389, _579);
    float _641 = fma(_633, _389, _585);
    float _643 = _355 * _355;
    float _645 = _365 * _365;
    float _647 = _84 * _591;
    float _649 = _643 * _643;
    float _651 = _645 * _645;
    float _653 = _371 * _373;
    float _655 = _84 * _603;
    float _657 = _649 * 16.0;
    float _659 = _651 * 16.0;
    float _661 = -_653;
    float _663 = fma(_377, _379, _661);
    float _665 = _373 * _657;
    float _667 = -_373;
    float _669 = _667 + _379;
    float _671 = _379 * _659;
    float2 _1957 = float2(_332, _334);
    float2 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1957, float2(0.0), isnan(_1957)), level(_344)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1957, float2(0.0), isnan(_1957)), level(_344)).xy;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _349 * _665;
    float _681 = _351 * _665;
    float _683 = _353 * _665;
    float _685 = fma(_669, (*spvDescriptorSet0.fp_c3)._m0[0].x, _373);
    float2 _1984 = float2(_332, _334);
    float2 _687 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1984, float2(0.0), isnan(_1984)), level(_344)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1984, float2(0.0), isnan(_1984)), level(_344)).xy;
    float _689 = _687.x;
    float _691 = _687.y;
    float2 _1997 = float2(_647, _655);
    float3 _695 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_1997, float2(0.0), isnan(_1997))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_1997, float2(0.0), isnan(_1997))).xyz;
    float _697 = _695.x;
    float _699 = _695.y;
    float _701 = _695.z;
    float2 _2011 = float2(_332, _334);
    float4 _703 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2011, float2(0.0), isnan(_2011)), level(_344)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2011, float2(0.0), isnan(_2011)), level(_344)).xyzw;
    float _705 = _703.x;
    float _707 = _703.y;
    float _709 = _703.z;
    float _711 = _703.w;
    float2 _2028 = float2(_332, _334);
    float4 _713 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2028, float2(0.0), isnan(_2028)), level(_344)), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2028, float2(0.0), isnan(_2028)), level(_344)).xyzw;
    float _715 = _713.x;
    float _717 = _713.y;
    float _719 = _713.z;
    float _721 = _713.w;
    float2 _2045 = float2(_625, _621);
    float3 _723 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2045, float2(0.0), isnan(_2045))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2045, float2(0.0), isnan(_2045))).xyz;
    float _725 = _723.x;
    float _727 = _723.y;
    float _729 = _723.z;
    float _731 = -_679;
    float _733 = fma(_359, _671, _731);
    float _735 = -_681;
    float _737 = fma(_361, _671, _735);
    float _739 = -_683;
    float _741 = fma(_363, _671, _739);
    float _743 = precise::max(_685, 1.52587890625e-05);
    float _745 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[0].x, _679);
    float _747 = fma(_663, (*spvDescriptorSet0.fp_c3)._m0[0].x, _653);
    float _749 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[0].x, _683);
    float _751 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[0].x, _681);
    float _753 = 1.0 / _743;
    float _755 = _685 * _753;
    float _757 = _749 * _755;
    float _759 = _751 * _755;
    float _761 = _745 * _755;
    float _763 = _747 * _755;
    float _765 = _675 * _677;
    float _767 = -_677;
    float _769 = _767 + _691;
    float _771 = -_765;
    float _773 = fma(_689, _691, _771);
    float _775 = _711 * _711;
    float _777 = _697 * _699;
    float _779 = fma(_769, (*spvDescriptorSet0.fp_c3)._m0[0].x, _677);
    float _781 = fma(_773, (*spvDescriptorSet0.fp_c3)._m0[0].x, _765);
    float _783 = _557 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _785 = _775 * _775;
    float _787 = -_685;
    float _789 = _787 + _779;
    float _791 = precise::max(_779, 1.52587890625e-05);
    float _793 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _795 = _793 + 1.0;
    float _797 = -_777;
    float _799 = _797 + 1.0;
    float _801 = exp2(_783);
    float _803 = fma(_697, _789, _685);
    float _805 = _721 * _721;
    float _807 = fma(_799, _795, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _809 = _777 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _811 = precise::max(_803, 1.52587890625e-05);
    float _813 = _805 * _805;
    float _815 = 1.0 / _791;
    float _817 = _785 * 16.0;
    float _819 = _677 * _817;
    float _821 = -_801;
    float _823 = _821 + 1.0;
    float _825 = _813 * 16.0;
    float _827 = _781 * _815;
    float _829 = 1.0 / _811;
    float _831 = _823 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _833 = _691 * _825;
    float _835 = _827 * _807;
    float _837 = _707 * _819;
    float _839 = -_831;
    float _841 = _839 + 1.0;
    float _843 = _709 * _819;
    float _845 = -_763;
    float _847 = fma(_779, _835, _845);
    float _849 = -_837;
    float _851 = fma(_717, _833, _849);
    float _853 = abs(_841);
    float _855 = log2(_853);
    float _857 = -_843;
    float _859 = fma(_719, _833, _857);
    float _861 = fma(_697, _847, _763);
    float _863 = _705 * _819;
    float _865 = fma(_859, (*spvDescriptorSet0.fp_c3)._m0[0].x, _843);
    float _867 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[0].x, _837);
    float _869 = _861 * _829;
    float _871 = -_863;
    float _873 = fma(_715, _833, _871);
    float _875 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _877 = _875 + 1.0;
    float _879 = _869 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _881 = fma(_873, (*spvDescriptorSet0.fp_c3)._m0[0].x, _863);
    float _883 = _869 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _885 = fma(_799, _877, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _887 = _879 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _889 = _855 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _891 = _883 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _893 = _855 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _895 = _637 * _887;
    float _897 = _631 * _887;
    float _899 = _641 * _887;
    float _901 = _885 * _815;
    float _903 = fma(_635, _891, _895);
    float _905 = fma(_629, _891, _897);
    float _907 = fma(_639, _891, _899);
    float _909 = exp2(_889);
    float _911 = _903 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _913 = _905 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _915 = _907 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _917 = _865 * _901;
    float _919 = _911 * 0.715200006961822509765625;
    float _921 = exp2(_893);
    float _923 = fma(_913, 0.2125999927520751953125, _919);
    float _925 = _779 * _901;
    float _927 = -_757;
    float _929 = fma(_779, _917, _927);
    float _931 = fma(_915, 0.072200000286102294921875, _923);
    float _933 = -_759;
    float _935 = fma(_867, _925, _933);
    float _937 = -_761;
    float _939 = fma(_881, _925, _937);
    float _941 = _909 * _829;
    float _943 = -_911;
    float _945 = _943 + _931;
    float _947 = -_913;
    float _949 = _947 + _931;
    float _951 = -_915;
    float _953 = _951 + _931;
    float _955 = fma(_697, _935, _759);
    float _957 = fma(_809, _945, _911);
    float _959 = fma(_809, _949, _913);
    float _961 = fma(_697, _939, _761);
    float _963 = fma(_809, _953, _915);
    float _965 = _921 * _957;
    float _967 = _955 * _941;
    float _969 = _921 * _959;
    float _971 = fma(_697, _929, _757);
    float _973 = _965 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _975 = _921 * _963;
    float _977 = _961 * _941;
    float _979 = _969 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _981 = fma(_967, (*spvDescriptorSet0.fp_c3)._m0[27].y, _973);
    float _983 = _831 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _985 = _971 * _941;
    float _987 = _975 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _989 = fma(_977, (*spvDescriptorSet0.fp_c3)._m0[27].x, _979);
    float _991 = fma(_727, _983, _981);
    float _993 = fma(_985, (*spvDescriptorSet0.fp_c3)._m0[27].z, _987);
    float _995 = fma(_725, _983, _989);
    float _997 = _991 * 0.715200006961822509765625;
    float _999 = -_701;
    float _1001 = _999 + 1.0;
    float _1003 = fma(_729, _983, _993);
    float _1005 = fma(_995, 0.2125999927520751953125, _997);
    float _1007 = _803 * _1001;
    float _1009 = fma(_1003, 0.072200000286102294921875, _1005);
    float _1011 = _1007 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _1013 = 1.0 / _1009;
    float _1015 = _1013 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1017 = precise::clamp(_1015, 0.0, 1.0);
    float _1019 = fma(_1017, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1021 = _995 * _1019;
    float _1023 = _991 * _1019;
    float _1025 = _1003 * _1019;
    out.m_50.x = _1021;
    out.m_50.y = _1023;
    out.m_50.z = _1025;
    out.m_50.w = _1011;
    out.m_52.x = _1021;
    out.m_52.y = _1023;
    out.m_52.z = _1025;
    out.m_52.w = _1011;
    return out;
}

