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
    texture2d<float> fp_t_tcb_18 [[id(9)]];
    sampler fp_t_tcb_18Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_14 [[id(13)]];
    sampler fp_t_tcb_14Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d<float> fp_t_tcb_16 [[id(17)]];
    sampler fp_t_tcb_16Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_1A [[id(19)]];
    sampler fp_t_tcb_1ASmplr [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_ASmplr_w [[id(22)]];
    sampler fp_t_tcb_12Smplr_w [[id(23)]];
    sampler fp_t_tcb_10Smplr_w [[id(24)]];
    sampler fp_t_tcb_18Smplr_w [[id(25)]];
    sampler fp_t_tcb_ESmplr_w [[id(26)]];
    sampler fp_t_tcb_14Smplr_w [[id(27)]];
    sampler fp_t_tcb_CSmplr_w [[id(28)]];
    sampler fp_t_tcb_16Smplr_w [[id(29)]];
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
void _58(thread const int& _2567, thread const int& _2568, thread const int& _2569, thread const int& _2570, thread int& _2571, thread int& _2572, thread int& _2573, thread int& _2574, thread int& _2575, thread int& _2576)
{
    float _2579 = as_type<float>(_2570) + 0.0;
    bool _2581 = _2579 != 0.0;
    bool _2583 = isnan(_2579);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan(0.0);
    bool _2589 = _2585 || _2587;
    int _2591 = _2567;
    int _2593 = _2568;
    int _2595 = _2570;
    int _2597 = _2589 ? (-1) : 0;
    if (!_2589)
    {
        float _2599 = as_type<float>(_2570) * 1.0;
        _2591 = as_type<int>(_2599);
    }
    int _2601 = _2591;
    bool _2603 = !_2589;
    int _2605 = _2601;
    int _2607 = _2601;
    if (!_2603)
    {
        float _2609 = as_type<float>(_2570) + 0.0;
        bool _2611 = _2609 >= 0.0;
        bool _2613 = isnan(_2609);
        bool _2615 = _2611 || _2613;
        bool _2617 = isnan(0.0);
        bool _2619 = _2615 || _2617;
        _2597 = _2619 ? (-1) : 0;
        if (!_2619)
        {
            _2605 = 2147483647;
        }
        int _2621 = _2605;
        bool _2623 = !_2619;
        int _2625 = _2621;
        _2607 = _2621;
        if (!_2623)
        {
            float _2627 = abs(as_type<float>(_2570));
            float _2629 = _2627 + 0.0;
            bool _2631 = _2629 > as_type<float>(0x7f800000u /* inf */);
            bool _2633 = isnan(_2629);
            bool _2635 = _2631 || _2633;
            bool _2637 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2639 = _2635 || _2637;
            _2597 = _2639 ? (-1) : 0;
            if (_2639)
            {
                float _2641 = as_type<float>(_2570) + 1.0;
                _2625 = as_type<int>(_2641);
            }
            int _2643 = _2625;
            int _2645 = _2643;
            _2607 = _2643;
            if (!_2639)
            {
                float _2647 = abs(as_type<float>(_2570));
                float _2649 = _2647 + (-0.0);
                float _2651 = 0.0 + _2649;
                bool _2653 = _2651 != as_type<float>(0x7f800000u /* inf */);
                bool _2655 = isnan(_2651);
                bool _2657 = _2653 || _2655;
                bool _2659 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2661 = _2657 || _2659;
                _2597 = _2661 ? (-1) : 0;
                if (!_2661)
                {
                    _2645 = _2570;
                }
                int _2663 = _2645;
                bool _2665 = !_2661;
                _2607 = _2663;
                if (!_2665)
                {
                    float _2667 = as_type<float>(_2570) * 18446744073709551616.0;
                    float _2669 = rsqrt(_2667);
                    float _2671 = _2667 * _2669;
                    float _2673 = _2669 * 0.5;
                    float _2675 = -_2671;
                    float _2677 = 0.0 + _2675;
                    float _2679 = fma(_2673, _2677, 0.5);
                    float _2681 = fma(_2671, _2679, _2671);
                    float _2683 = -_2681;
                    float _2685 = 0.0 + _2683;
                    float _2687 = fma(_2681, _2685, _2667);
                    float _2689 = fma(_2673, _2687, _2681);
                    float _2691 = _2689 * 2.3283064365386962890625e-10;
                    _2607 = as_type<int>(_2691);
                    _2593 = as_type<int>(_2681);
                    _2595 = as_type<int>(_2677);
                }
            }
        }
    }
    int _2693 = _2607;
    int _2695 = _2593;
    int _2697 = _2595;
    int _2699 = _2597;
    _2571 = _2569;
    _2572 = 0;
    _2573 = _2693;
    _2574 = _2695;
    _2575 = _2697;
    _2576 = _2699;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _256 = false;
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
    float _82 = 1.0 / _62;
    float _84 = _82 * _68;
    float _86 = _82 * _74;
    float _88 = _82 * _80;
    float _90 = _84 * _84;
    float _92 = fma(_86, _86, _90);
    float _94 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _96 = fma(_88, _88, _92);
    float _98 = precise::max(0.0, _94);
    float _100 = rsqrt(_96);
    float _102 = _86 * _100;
    float _104 = _88 * _100;
    float _106 = _84 * _100;
    float _108 = _102 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _110 = _104 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _112 = -_106;
    float _114 = -_98;
    float _116 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[13].z, _114);
    float _118 = _108 * _108;
    float _120 = _110 * _110;
    float _122 = _118 + _120;
    float _124 = sqrt(_122);
    bool _128 = _124 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _130 = _98;
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
    float _254;
    if (!_232)
    {
        int _234 = 0;
        int _236 = 0;
        int _238 = 1104;
        int _240 = as_type<int>(_220);
        int _242;
        int _244;
        int _246;
        int _248;
        int _250;
        int _252;
        _58(_234, _236, _238, _240, _242, _244, _246, _248, _250, _252);
        _254 = as_type<float>(_246);
        _256 = true;
    }
    else
    {
        float _258 = rsqrt(_220);
        float _260 = _220 * _258;
        float _262 = _258 * 0.5;
        float _264 = -_260;
        float _266 = 0.0 + _264;
        float _268 = fma(_262, _266, 0.5);
        float _270 = fma(_260, _268, _260);
        float _272 = -_270;
        float _274 = 0.0 + _272;
        float _276 = fma(_270, _274, _220);
        float _278 = fma(_262, _276, _270);
        _254 = _278;
    }
    _256 = false;
    float _280 = _254;
    bool _282 = _206 > 0.0;
    float _284 = _104 * _104;
    float _286 = _102 * _102;
    float _288 = _284 + _286;
    if (_282)
    {
        discard_fragment();
    }
    float _290 = rsqrt(_288);
    float _292 = _230 * _280;
    float _294 = _292 * 0.636619746685028076171875;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = -_296;
    float _300 = _298 + 1.0;
    float _302 = sqrt(_300);
    float _304 = _104 * _290;
    float _306 = _102 * _290;
    float _308 = abs(_304);
    float _310 = abs(_306);
    float _312 = precise::max(_308, _310);
    float _314 = precise::max(_312, 9.9999997473787516355514526367188e-05);
    float _316 = -_302;
    float _318 = _316 + 1.0;
    float _320 = 1.0 / _314;
    float _322 = _318 * 0.5;
    float _324 = -_320;
    float _326 = _304 * _324;
    float _328 = _306 * _320;
    float _330 = fma(_326, _322, 0.5);
    float _332 = fma(_328, _322, 0.5);
    if (_282)
    {
        out.m_50.x = 0.0;
        out.m_50.y = 0.0;
        out.m_50.z = 0.0;
        out.m_50.w = 0.0;
        return out;
    }
    float2 _1412;
    _1412.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_330, _332));
    _1412.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_330, _332));
    float _334 = _1412.x;
    float _336 = _334 * 256.0;
    int _338 = int(_336);
    float _340 = -_104;
    float _342 = _106 * _340;
    float _344 = _102 * _104;
    float _346 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _348 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _350 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _352 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _354 = _106 * _346;
    float _356 = _106 * _348;
    float _358 = _106 * _350;
    float _360 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _362 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _354);
    float _364 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _356);
    float _366 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _358);
    float _368 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _370 = -_104;
    float _372 = fma(_370, _352, _362);
    float _374 = fma(_104, _352, _362);
    float _376 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _378 = -_104;
    float _380 = fma(_378, _368, _364);
    float _382 = fma(_104, _368, _364);
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _386 = -_104;
    float _388 = fma(_386, _376, _366);
    float _390 = fma(_104, _376, _366);
    float _392 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _394 = fma(_102, _384, _374);
    float _396 = -_102;
    float _398 = fma(_396, _384, _372);
    float _400 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _402 = fma(_102, _392, _382);
    float _404 = -_102;
    float _406 = fma(_404, _392, _380);
    float _408 = in.m_52.x;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = in.m_52.y;
    float _416 = gl_FragCoord.w;
    float _418 = _414 * _416;
    float _420 = -_102;
    float _422 = fma(_420, _400, _388);
    float _424 = fma(_102, _400, _390);
    float _426 = -_106;
    float _428 = _102 * _426;
    float _430 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _432 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _434 = _102 * _106;
    float _436 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _438 = fma(_430, _428, _398);
    float _440 = fma(_432, _428, _406);
    float _442 = fma(_430, _434, _394);
    float _444 = fma(_432, _434, _402);
    float _446 = fma(_436, _428, _422);
    float _448 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _450 = _106 * _104;
    float _452 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _454 = fma(_436, _434, _424);
    float _456 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _458 = fma(_448, _450, _442);
    float _460 = fma(_452, _342, _440);
    float _462 = fma(_452, _450, _444);
    float _464 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _466 = fma(_448, _342, _438);
    float _468 = fma(_360, _342, _446);
    float _470 = fma(_360, _450, _454);
    float _472 = fma(_464, _344, _458);
    float _474 = fma(_456, _344, _462);
    float _476 = fma(_456, _344, _460);
    float _478 = fma(_464, _344, _466);
    float _480 = _82 * _412;
    float _482 = _82 * _418;
    float _484 = float(uint(_338));
    float _486 = _484 * 0.00390625;
    float2 _1671 = float2(_330, _332);
    float4 _489 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1671, float2(0.0), isnan(_1671)), level(_486)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1671, float2(0.0), isnan(_1671)), level(_486)).xyzw;
    float _491 = _489.x;
    float _493 = _489.y;
    float _495 = _489.z;
    float _497 = _489.w;
    float2 _1690 = float2(_330, _332);
    float2 _501 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1690, float2(0.0), isnan(_1690)), level(_486)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1690, float2(0.0), isnan(_1690)), level(_486)).xy;
    float _503 = _501.x;
    float _505 = _501.y;
    float2 _1703 = float2(_330, _332);
    float2 _507 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1703, float2(0.0), isnan(_1703)), level(_486)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1703, float2(0.0), isnan(_1703)), level(_486)).xy;
    float _509 = _507.x;
    float _511 = _507.y;
    float2 _1716 = float2(_330, _332);
    float4 _513 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1716, float2(0.0), isnan(_1716)), level(_486)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1716, float2(0.0), isnan(_1716)), level(_486)).xyzw;
    float _515 = _513.x;
    float _517 = _513.y;
    float _519 = _513.z;
    float _521 = _513.w;
    float2 _1733 = float2(_480, _482);
    float2 _523 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_1733, float2(0.0), isnan(_1733))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_1733, float2(0.0), isnan(_1733))).xy;
    float _525 = _523.x;
    float _527 = _523.y;
    float _529 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _531 = _208 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _533 = fma(_529, _344, _468);
    float _535 = fma(_529, _344, _470);
    float _537 = _104 * (-3.0);
    float _539 = fma(_284, 3.0, -1.0);
    float _541 = -_104;
    float _543 = fma(_541, _537, -1.0);
    float _545 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _547 = fma(_545, _539, _472);
    float _549 = -_106;
    float _551 = _549 + 1.0;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = fma(_545, _543, _478);
    float _557 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _559 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _561 = -_106;
    float _563 = fma(_561, _106, _286);
    float _565 = abs(_553);
    float _567 = log2(_565);
    float _569 = fma(_557, _543, _476);
    float _571 = fma(_559, _543, _533);
    float _573 = fma(_557, _539, _474);
    float _575 = fma(_559, _539, _535);
    float _577 = -_531;
    float _579 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[11].y, _577);
    float _581 = -_210;
    float _583 = fma(_581, (*spvDescriptorSet0.fp_c3)._m0[11].z, _579);
    float _585 = fma(_583, -0.5, 0.5);
    float _587 = fma(_583, 0.5, 0.5);
    float _589 = _567 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _591 = sqrt(_585);
    float _593 = exp2(_589);
    float _595 = _593 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _597 = _591 * 0.636619746685028076171875;
    float _599 = fma(_595, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _601 = precise::clamp(_599, 0.0, 1.0);
    float _603 = -_601;
    float _605 = _603 + 1.0;
    float _607 = abs(_605);
    float _609 = log2(_607);
    float _611 = fma(_587, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _613 = fma(_587, _611, -0.212114393711090087890625);
    float _615 = fma(_587, _613, 1.570728778839111328125);
    float _617 = -_615;
    float _619 = fma(_597, _617, 1.0);
    float _621 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _623 = _609 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _625 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _627 = fma(_621, _563, _555);
    float _629 = fma(_621, _563, _547);
    float _631 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _633 = exp2(_623);
    float _635 = fma(_625, _563, _571);
    float _637 = fma(_631, _563, _569);
    float _639 = fma(_631, _563, _573);
    float _641 = _206 + 1.0;
    float _643 = -_206;
    float _645 = fma(_633, _641, _643);
    float _647 = fma(_625, _563, _575);
    float _649 = fma(_206, -0.5, 0.5);
    float _651 = fma(_645, 0.5, 0.5);
    float _653 = _497 * _497;
    float _655 = _521 * _521;
    float _657 = _653 * _653;
    float _659 = _503 * _505;
    float _661 = _655 * _655;
    float _663 = _657 * 16.0;
    float _665 = -_659;
    float _667 = fma(_509, _511, _665);
    float _669 = _661 * 16.0;
    float _671 = _505 * _663;
    float _673 = -_505;
    float _675 = _673 + _511;
    float _677 = fma(_527, 2.0, -1.0);
    float _679 = fma(_525, 2.0, -1.0);
    float _681 = _491 * _671;
    float _683 = _493 * _671;
    float _685 = _495 * _671;
    float _687 = _511 * _669;
    float _689 = fma(_677, (*spvDescriptorSet0.fp_c3)._m0[22].y, _482);
    float2 _1997 = float2(_330, _332);
    float2 _691 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1997, float2(0.0), isnan(_1997)), level(_486)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1997, float2(0.0), isnan(_1997)), level(_486)).xy;
    float _693 = _691.x;
    float _695 = _691.y;
    float2 _2010 = float2(_480, _482);
    float3 _699 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2010, float2(0.0), isnan(_2010))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2010, float2(0.0), isnan(_2010))).xyz;
    float _701 = _699.x;
    float _703 = _699.y;
    float _705 = _699.z;
    float _707 = fma(_675, (*spvDescriptorSet0.fp_c3)._m0[0].x, _505);
    float _709 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[0].x, _659);
    float _711 = fma(_679, (*spvDescriptorSet0.fp_c3)._m0[22].x, _480);
    float2 _2039 = float2(_330, _332);
    float4 _713 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2039, float2(0.0), isnan(_2039)), level(_486)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2039, float2(0.0), isnan(_2039)), level(_486)).xyzw;
    float _715 = _713.x;
    float _717 = _713.y;
    float _719 = _713.z;
    float _721 = _713.w;
    float2 _2056 = float2(_619, _651);
    float3 _723 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2056, float2(0.0), isnan(_2056))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2056, float2(0.0), isnan(_2056))).xyz;
    float _725 = _723.x;
    float _727 = _723.y;
    float _729 = _723.z;
    float2 _2070 = float2(_619, _649);
    float3 _731 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2070, float2(0.0), isnan(_2070))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2070, float2(0.0), isnan(_2070))).xyz;
    float _733 = _731.x;
    float _735 = _731.y;
    float _737 = _731.z;
    float2 _2084 = float2(_711, _689);
    float4 _739 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2084, float2(0.0), isnan(_2084))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2084, float2(0.0), isnan(_2084))).xyzw;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = _739.w;
    float _749 = -_681;
    float _751 = fma(_515, _687, _749);
    float _753 = -_683;
    float _755 = fma(_517, _687, _753);
    float _757 = -_685;
    float _759 = fma(_519, _687, _757);
    float _761 = precise::max(_707, 1.52587890625e-05);
    float _763 = fma(_751, (*spvDescriptorSet0.fp_c3)._m0[0].x, _681);
    float _765 = fma(_755, (*spvDescriptorSet0.fp_c3)._m0[0].x, _683);
    float _767 = fma(_759, (*spvDescriptorSet0.fp_c3)._m0[0].x, _685);
    float _769 = _609 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _771 = 1.0 / _761;
    float _773 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _775 = _773 + 1.0;
    float _777 = _707 * _771;
    float _779 = _765 * _777;
    float _781 = _763 * _777;
    float _783 = _767 * _777;
    float _785 = _709 * _777;
    float _787 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _789 = _787 + 1.0;
    float _791 = -_707;
    float _793 = _791 + _695;
    float _795 = _701 * _703;
    float _797 = -_705;
    float _799 = _797 + 1.0;
    float _801 = fma(_701, _793, _707);
    float _803 = -_795;
    float _805 = _803 + 1.0;
    float _807 = exp2(_769);
    float _809 = _721 * _721;
    float _811 = fma(_805, _775, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _813 = fma(_805, _789, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _815 = precise::max(_801, 1.52587890625e-05);
    float _817 = _809 * _809;
    float _819 = _693 * _811;
    float _821 = _801 * _799;
    float _823 = _817 * 16.0;
    float _825 = 1.0 / _815;
    float _827 = _813 * _823;
    float _829 = _821 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _831 = -_807;
    float _833 = _831 + 1.0;
    float _835 = -_785;
    float _837 = fma(_695, _819, _835);
    float _839 = _833 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _841 = fma(_701, _837, _785);
    float _843 = -_829;
    float _845 = _843 + 1.0;
    float _847 = -_839;
    float _849 = _847 + 1.0;
    float _851 = _841 * _825;
    float _853 = abs(_849);
    float _855 = log2(_853);
    float _857 = _851 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _859 = _851 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _861 = _857 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _863 = _859 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _865 = _639 * _861;
    float _867 = _629 * _861;
    float _869 = abs(_845);
    float _871 = log2(_869);
    float _873 = _647 * _861;
    float _875 = fma(_637, _863, _865);
    float _877 = fma(_627, _863, _867);
    float _879 = _695 * _827;
    float _881 = _855 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _883 = fma(_635, _863, _873);
    float _885 = _855 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _887 = _719 * _827;
    float _889 = _877 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _891 = _875 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _893 = exp2(_881);
    float _895 = -_781;
    float _897 = fma(_715, _879, _895);
    float _899 = _883 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _901 = _891 * 0.715200006961822509765625;
    float _903 = -_783;
    float _905 = fma(_695, _887, _903);
    float _907 = _871 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _909 = fma(_701, _897, _781);
    float _911 = fma(_889, 0.2125999927520751953125, _901);
    float _913 = exp2(_885);
    float _915 = fma(_701, _905, _783);
    float _917 = -_779;
    float _919 = fma(_717, _879, _917);
    float _921 = fma(_899, 0.072200000286102294921875, _911);
    float _923 = fma(_701, _919, _779);
    float _925 = -_889;
    float _927 = _925 + _921;
    float _929 = exp2(_907);
    float _931 = _893 * _825;
    float _933 = _795 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _935 = -_891;
    float _937 = _935 + _921;
    float _939 = _839 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _941 = _923 * _931;
    float _943 = fma(_933, _927, _889);
    float _945 = fma(_933, _937, _891);
    float _947 = -_899;
    float _949 = _947 + _921;
    float _951 = _909 * _931;
    float _953 = _913 * _943;
    float _955 = _913 * _945;
    float _957 = fma(_933, _949, _899);
    float _959 = _915 * _931;
    float _961 = _953 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _963 = _955 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _965 = -_929;
    float _967 = spvFAdd(_965, 1.00010001659393310546875);
    float _969 = -_929;
    float _971 = _969 + 1.0;
    float _973 = _913 * _957;
    float _975 = fma(_941, (*spvDescriptorSet0.fp_c3)._m0[27].y, _963);
    float _977 = fma(_951, (*spvDescriptorSet0.fp_c3)._m0[27].x, _961);
    float _979 = -_829;
    float _981 = _979 + _971;
    float _983 = 1.0 / _967;
    float _985 = _973 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _987 = fma(_727, _939, _975);
    float _989 = _981 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _991 = fma(_725, _939, _977);
    float _993 = fma(_959, (*spvDescriptorSet0.fp_c3)._m0[27].z, _985);
    float _995 = _735 * _989;
    float _997 = _733 * _989;
    float _999 = fma(_729, _939, _993);
    float _1001 = _737 * _989;
    float _1003 = fma(_829, _987, _995);
    float _1005 = fma(_829, _991, _997);
    float _1007 = _983 * _1003;
    float _1009 = fma(_829, _999, _1001);
    float _1011 = _983 * _1005;
    float _1013 = _1007 * 0.715200006961822509765625;
    float _1015 = _983 * _1009;
    float _1017 = fma(_1011, 0.2125999927520751953125, _1013);
    float _1019 = fma(_1015, 0.072200000286102294921875, _1017);
    float _1021 = 1.0 / _1019;
    float _1023 = _1021 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1025 = precise::clamp(_1023, 0.0, 1.0);
    float _1027 = fma(_1025, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1029 = _1027 * _747;
    float _1031 = fma(_1011, _1029, _741);
    float _1033 = fma(_1007, _1029, _743);
    float _1035 = fma(_1015, _1029, _745);
    out.m_50.x = _1031;
    out.m_50.y = _1033;
    out.m_50.z = _1035;
    out.m_50.w = _971;
    return out;
}

