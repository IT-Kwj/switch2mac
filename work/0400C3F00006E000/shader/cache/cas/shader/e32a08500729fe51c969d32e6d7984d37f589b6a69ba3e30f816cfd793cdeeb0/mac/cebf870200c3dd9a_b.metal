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
    float4 m_48 [[color(1)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _56(thread const int& _2575, thread const int& _2576, thread const int& _2577, thread int& _2578, thread int& _2579, thread int& _2580, thread int& _2581, thread int& _2582)
{
    float _2585 = as_type<float>(_2575) + 0.0;
    bool _2587 = _2585 != 0.0;
    bool _2589 = isnan(_2585);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan(0.0);
    bool _2595 = _2591 || _2593;
    int _2597 = as_type<int>(_2585);
    int _2599 = _2595 ? (-1) : 0;
    if (!_2595)
    {
        float _2601 = as_type<float>(_2575) * 1.0;
        _2597 = as_type<int>(_2601);
    }
    int _2603 = _2597;
    bool _2605 = !_2595;
    int _2607 = _2603;
    if (!_2605)
    {
        float _2609 = as_type<float>(_2575) + 0.0;
        bool _2611 = _2609 >= 0.0;
        bool _2613 = isnan(_2609);
        bool _2615 = _2611 || _2613;
        bool _2617 = isnan(0.0);
        bool _2619 = _2615 || _2617;
        int _2621 = as_type<int>(_2609);
        _2599 = _2619 ? (-1) : 0;
        if (!_2619)
        {
            _2621 = 2147483647;
        }
        int _2623 = _2621;
        bool _2625 = !_2619;
        _2607 = _2623;
        if (!_2625)
        {
            float _2627 = abs(as_type<float>(_2575));
            float _2629 = _2627 + 0.0;
            bool _2631 = _2629 > as_type<float>(0x7f800000u /* inf */);
            bool _2633 = isnan(_2629);
            bool _2635 = _2631 || _2633;
            bool _2637 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2639 = _2635 || _2637;
            int _2641 = as_type<int>(_2629);
            _2599 = _2639 ? (-1) : 0;
            if (_2639)
            {
                float _2643 = as_type<float>(_2575) + 1.0;
                _2641 = as_type<int>(_2643);
            }
            int _2645 = _2641;
            _2607 = _2645;
            if (!_2639)
            {
                float _2647 = abs(as_type<float>(_2575));
                float _2649 = _2647 + (-0.0);
                float _2651 = 0.0 + _2649;
                bool _2653 = _2651 != as_type<float>(0x7f800000u /* inf */);
                bool _2655 = isnan(_2651);
                bool _2657 = _2653 || _2655;
                bool _2659 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2661 = _2657 || _2659;
                int _2663 = as_type<int>(_2651);
                _2599 = _2661 ? (-1) : 0;
                if (!_2661)
                {
                    _2663 = _2575;
                }
                int _2665 = _2663;
                bool _2667 = !_2661;
                _2607 = _2665;
                if (!_2667)
                {
                    float _2669 = as_type<float>(_2575) * 18446744073709551616.0;
                    float _2671 = rsqrt(_2669);
                    float _2673 = _2669 * _2671;
                    float _2675 = _2671 * 0.5;
                    float _2677 = -_2673;
                    float _2679 = 0.0 + _2677;
                    float _2681 = fma(_2675, _2679, 0.5);
                    float _2683 = fma(_2673, _2681, _2673);
                    float _2685 = -_2683;
                    float _2687 = 0.0 + _2685;
                    float _2689 = fma(_2683, _2687, _2669);
                    float _2691 = fma(_2675, _2689, _2683);
                    float _2693 = _2691 * 2.3283064365386962890625e-10;
                    _2607 = as_type<int>(_2693);
                }
            }
        }
    }
    int _2695 = _2607;
    int _2697 = _2599;
    _2578 = _2695;
    _2579 = _2695;
    _2580 = _2577;
    _2581 = 0;
    _2582 = _2697;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _250 = false;
    float _60 = gl_FragCoord.w;
    float _62 = in.m_43.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_43.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_43.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _82 = precise::max(0.0, _80);
    float _84 = 1.0 / _60;
    float _86 = _84 * _66;
    float _88 = _84 * _72;
    float _90 = _84 * _78;
    float _92 = _86 * _86;
    float _94 = fma(_88, _88, _92);
    float _96 = fma(_90, _90, _94);
    float _98 = rsqrt(_96);
    float _100 = _88 * _98;
    float _102 = _90 * _98;
    float _104 = _86 * _98;
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _108 = _102 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _110 = -_104;
    float _112 = -_82;
    float _114 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[13].z, _112);
    float _116 = _106 * _106;
    float _118 = _108 * _108;
    float _120 = _116 + _118;
    float _122 = sqrt(_120);
    bool _126 = _122 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _128 = _98;
    float _130 = _82;
    float _132 = _114;
    float _134 = _106;
    float _136 = _108;
    if (!_126)
    {
        _128 = _118;
    }
    float _138 = _128;
    float _140 = _138;
    if (!_126)
    {
        _130 = _116;
    }
    float _142 = _130;
    bool _144 = !_126;
    float _146 = _142;
    if (!_144)
    {
        float _148 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _150 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _152 = _122 + _150;
        float _154 = _114 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _156 = rsqrt(_120);
        float _158 = _152 * _148;
        float _160 = _158 * 0.15915493667125701904296875;
        float _162 = _160 * 6.283185482025146484375;
        float _164 = sin(_162);
        float _166 = _160 * 6.283185482025146484375;
        float _168 = cos(_166);
        float _170 = fma(_164, _154, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _172 = _156 * _170;
        float _174 = _168 + (-1.0);
        float _176 = _106 * _172;
        float _178 = _108 * _172;
        float _180 = _174 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _182 = _178 * _178;
        float _184 = fma(_114, _168, _180);
        float _186 = _176 * _176;
        _132 = _184;
        _146 = _186;
        _140 = _182;
        _134 = _176;
        _136 = _178;
    }
    float _188 = _132;
    float _190 = _146;
    float _192 = _140;
    float _194 = _134;
    float _196 = _136;
    float _198 = fma(_188, _188, _190);
    float _200 = _198 + _192;
    float _202 = rsqrt(_200);
    float _204 = _202 * _188;
    float _206 = _202 * _194;
    float _208 = _202 * _196;
    float _210 = -_204;
    float _212 = precise::max(0.0, _210);
    float _214 = abs(_212);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = fma(_212, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _222 = as_type<int>(_218) + (-218103808);
    float _224 = fma(_212, _220, -0.212114393711090087890625);
    bool _226 = uint(_222) >= 1920991232u;
    float _228 = fma(_212, _224, 1.570728778839111328125);
    bool _230 = !_226;
    float _248;
    if (!_230)
    {
        int _232 = as_type<int>(_218);
        int _234 = 0;
        int _236 = 1136;
        int _238;
        int _240;
        int _242;
        int _244;
        int _246;
        _56(_232, _234, _236, _238, _240, _242, _244, _246);
        _248 = as_type<float>(_238);
        _250 = true;
    }
    else
    {
        float _252 = rsqrt(_218);
        float _254 = _218 * _252;
        float _256 = _252 * 0.5;
        float _258 = -_254;
        float _260 = 0.0 + _258;
        float _262 = fma(_256, _260, 0.5);
        float _264 = fma(_254, _262, _254);
        float _266 = -_264;
        float _268 = 0.0 + _266;
        float _270 = fma(_264, _268, _218);
        float _272 = fma(_256, _270, _264);
        _248 = _272;
    }
    _250 = false;
    float _274 = _248;
    bool _276 = _204 > 0.0;
    float _278 = _102 * _102;
    float _280 = _100 * _100;
    float _282 = _278 + _280;
    if (_276)
    {
        discard_fragment();
    }
    float _284 = rsqrt(_282);
    float _286 = _228 * _274;
    float _288 = _286 * 0.636619746685028076171875;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = -_290;
    float _294 = _292 + 1.0;
    float _296 = sqrt(_294);
    float _298 = _102 * _284;
    float _300 = _100 * _284;
    float _302 = abs(_298);
    float _304 = abs(_300);
    float _306 = precise::max(_302, _304);
    float _308 = precise::max(_306, 9.9999997473787516355514526367188e-05);
    float _310 = -_296;
    float _312 = _310 + 1.0;
    float _314 = 1.0 / _308;
    float _316 = _312 * 0.5;
    float _318 = -_314;
    float _320 = _298 * _318;
    float _322 = _300 * _314;
    float _324 = fma(_320, _316, 0.5);
    float _326 = fma(_322, _316, 0.5);
    if (_276)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        out.m_48.x = 0.0;
        out.m_48.y = 0.0;
        out.m_48.z = 0.0;
        out.m_48.w = 0.0;
        return out;
    }
    float2 _1412;
    _1412.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_324, _326));
    _1412.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_324, _326));
    float _328 = _1412.x;
    float _330 = _328 * 256.0;
    int _332 = int(_330);
    float _334 = -_104;
    float _336 = _334 + 1.0;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _206 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _342 = -_104;
    float _344 = fma(_342, _104, _280);
    float _346 = abs(_338);
    float _348 = log2(_346);
    float _350 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _352 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _354 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _356 = _104 * _350;
    float _358 = _104 * _352;
    float _360 = fma(_278, 3.0, -1.0);
    float _362 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _364 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _356);
    float _366 = _104 * _354;
    float _368 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _358);
    float _370 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _372 = -_102;
    float _374 = fma(_372, _362, _364);
    float _376 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _366);
    float _378 = fma(_102, _362, _364);
    float _380 = -_102;
    float _382 = fma(_380, _370, _368);
    float _384 = fma(_102, _370, _368);
    float _386 = _348 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _392 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _394 = exp2(_386);
    float _396 = -_100;
    float _398 = fma(_396, _388, _382);
    float _400 = fma(_100, _388, _384);
    float _402 = _102 * (-3.0);
    float _404 = -_102;
    float _406 = fma(_404, _390, _376);
    float _408 = -_100;
    float _410 = fma(_408, _392, _374);
    float _412 = fma(_102, _390, _376);
    float _414 = fma(_100, _392, _378);
    float _416 = _100 * _102;
    float _418 = -_102;
    float _420 = _104 * _418;
    float _422 = -_102;
    float _424 = fma(_422, _402, -1.0);
    float _426 = -_340;
    float _428 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[11].y, _426);
    float _430 = _104 * _102;
    float _432 = -_104;
    float _434 = _100 * _432;
    float _436 = _100 * _104;
    float _438 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _440 = _394 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _442 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _444 = -_208;
    float _446 = fma(_444, (*spvDescriptorSet0.fp_c3)._m0[11].z, _428);
    float _448 = -_100;
    float _450 = fma(_448, _438, _406);
    float _452 = fma(_100, _438, _412);
    float _454 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = fma(_442, _434, _410);
    float _460 = fma(_442, _436, _414);
    float _462 = fma(_446, -0.5, 0.5);
    float _464 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _466 = -_456;
    float _468 = _466 + 1.0;
    float _470 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _472 = fma(_446, 0.5, 0.5);
    float _474 = fma(_464, _434, _398);
    float _476 = fma(_464, _436, _400);
    float _478 = sqrt(_462);
    float _480 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _482 = fma(_470, _436, _452);
    float _484 = fma(_470, _434, _450);
    float _486 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _490 = fma(_480, _420, _458);
    float _492 = fma(_480, _430, _460);
    float _494 = abs(_468);
    float _496 = log2(_494);
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _500 = fma(_486, _420, _474);
    float _502 = fma(_488, _420, _484);
    float _504 = fma(_486, _430, _476);
    float _506 = fma(_488, _430, _482);
    float _508 = fma(_498, _416, _490);
    float _510 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _512 = _478 * 0.636619746685028076171875;
    float _514 = fma(_498, _416, _492);
    float _516 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _518 = in.m_50.y;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = fma(_510, _416, _502);
    float _526 = fma(_516, _416, _504);
    float _528 = fma(_516, _416, _500);
    float _530 = _496 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _532 = in.m_50.x;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = fma(_510, _416, _506);
    float _540 = fma(_472, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _542 = exp2(_530);
    float _544 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _546 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _548 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _550 = fma(_544, _424, _508);
    float _552 = fma(_546, _424, _528);
    float _554 = fma(_548, _424, _524);
    float _556 = _204 + 1.0;
    float _558 = fma(_472, _540, -0.212114393711090087890625);
    float _560 = fma(_546, _360, _526);
    float _562 = fma(_548, _360, _538);
    float _564 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _566 = fma(_544, _360, _514);
    float _568 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _570 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _572 = -_204;
    float _574 = fma(_542, _556, _572);
    float _576 = fma(_472, _558, 1.570728778839111328125);
    float _578 = fma(_564, _344, _550);
    float _580 = fma(_564, _344, _566);
    float _582 = fma(_568, _344, _552);
    float _584 = fma(_568, _344, _560);
    float _586 = fma(_570, _344, _554);
    float _588 = fma(_570, _344, _562);
    float _590 = fma(_574, 0.5, 0.5);
    float _592 = -_576;
    float _594 = fma(_512, _592, 1.0);
    float _596 = _84 * _536;
    float _598 = _84 * _522;
    float _600 = float(uint(_332));
    float _602 = _600 * 0.00390625;
    float2 _1864 = float2(_324, _326);
    float4 _605 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1864, float2(0.0), isnan(_1864)), level(_602)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1864, float2(0.0), isnan(_1864)), level(_602)).xyzw;
    float _607 = _605.x;
    float _609 = _605.y;
    float _611 = _605.z;
    float _613 = _605.w;
    float2 _1883 = float2(_324, _326);
    float2 _617 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1883, float2(0.0), isnan(_1883)), level(_602)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1883, float2(0.0), isnan(_1883)), level(_602)).xy;
    float _619 = _617.x;
    float _621 = _617.y;
    float2 _1896 = float2(_324, _326);
    float2 _623 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1896, float2(0.0), isnan(_1896)), level(_602)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1896, float2(0.0), isnan(_1896)), level(_602)).xy;
    float _625 = _623.x;
    float _627 = _623.y;
    float2 _1909 = float2(_324, _326);
    float4 _629 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1909, float2(0.0), isnan(_1909)), level(_602)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1909, float2(0.0), isnan(_1909)), level(_602)).xyzw;
    float _631 = _629.x;
    float _633 = _629.y;
    float _635 = _629.z;
    float _637 = _629.w;
    float2 _1926 = float2(_596, _598);
    float3 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1926, float2(0.0), isnan(_1926))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1926, float2(0.0), isnan(_1926))).xyz;
    float _643 = _641.x;
    float _645 = _641.y;
    float _647 = _641.z;
    float2 _1940 = float2(_324, _326);
    float2 _649 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1940, float2(0.0), isnan(_1940)), level(_602)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1940, float2(0.0), isnan(_1940)), level(_602)).xy;
    float _651 = _649.x;
    float _653 = _649.y;
    float2 _1953 = float2(_324, _326);
    float4 _655 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1953, float2(0.0), isnan(_1953)), level(_602)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1953, float2(0.0), isnan(_1953)), level(_602)).xyzw;
    float _657 = _655.x;
    float _659 = _655.y;
    float _661 = _655.z;
    float _663 = _655.w;
    float2 _1970 = float2(_594, _590);
    float3 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1970, float2(0.0), isnan(_1970))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1970, float2(0.0), isnan(_1970))).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float _673 = _204 * (-10000.0);
    float _675 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _677 = _204 * _675;
    float _679 = abs(_673);
    bool _681 = _679 > 0.00999999977648258209228515625;
    float _683 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[26].x, _677);
    float _685 = _681 ? _673 : 0.00999999977648258209228515625;
    float _687 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[26].z, _683);
    float _689 = _685 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _691 = precise::max(_689, -127.0);
    float _693 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _695 = -_691;
    float _697 = exp2(_695);
    float _699 = -_693;
    float _701 = exp2(_699);
    float _703 = -_697;
    float _705 = _703 + 1.0;
    float _707 = 1.0 / _691;
    float _709 = _701 * _705;
    float _711 = _496 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _713 = fma(_687, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _715 = exp2(_711);
    float _717 = fma(_713, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _719 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _721 = fma(_719, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _723 = abs(_717);
    float _725 = log2(_723);
    float _727 = _613 * _613;
    float _729 = _619 * _621;
    float _731 = _725 * 1.5;
    float _733 = _637 * _637;
    float _735 = _727 * _727;
    float _737 = -_729;
    float _739 = fma(_625, _627, _737);
    float _741 = _643 * _645;
    float _743 = _733 * _733;
    float _745 = _735 * 16.0;
    float _747 = exp2(_731);
    float _749 = _663 * _663;
    float _751 = _621 * _745;
    float _753 = _709 * _707;
    float _755 = _749 * _749;
    float _757 = _607 * _751;
    float _759 = _609 * _751;
    float _761 = _611 * _751;
    float _763 = -_621;
    float _765 = _763 + _627;
    float _767 = _755 * 16.0;
    float _769 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _621);
    float _771 = _743 * 16.0;
    float _773 = _747 * 12.56637096405029296875;
    float _775 = fma(_739, (*spvDescriptorSet0.fp_c3)._m0[0].x, _729);
    float _777 = precise::max(_769, 1.52587890625e-05);
    float _779 = _627 * _771;
    float _781 = -_769;
    float _783 = _781 + _653;
    float _785 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _787 = _785 + 1.0;
    float _789 = -_741;
    float _791 = _789 + 1.0;
    float _793 = -_757;
    float _795 = fma(_631, _779, _793);
    float _797 = 1.0 / _777;
    float _799 = fma(_643, _783, _769);
    float _801 = fma(_791, _787, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _803 = -_759;
    float _805 = fma(_633, _779, _803);
    float _807 = -_761;
    float _809 = fma(_635, _779, _807);
    float _811 = fma(_795, (*spvDescriptorSet0.fp_c3)._m0[0].x, _757);
    float _813 = _651 * _801;
    float _815 = -_715;
    float _817 = _815 + 1.0;
    float _819 = fma(_805, (*spvDescriptorSet0.fp_c3)._m0[0].x, _759);
    float _821 = _769 * _797;
    float _823 = precise::max(_799, 1.52587890625e-05);
    float _825 = 1.0 / _773;
    float _827 = _775 * _821;
    float _829 = _819 * _821;
    float _831 = -_827;
    float _833 = fma(_653, _813, _831);
    float _835 = 1.0 / _823;
    float _837 = _721 * _825;
    float _839 = fma(_643, _833, _827);
    float _841 = _817 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _843 = -_841;
    float _845 = _843 + 1.0;
    float _847 = _839 * _835;
    float _849 = fma(_809, (*spvDescriptorSet0.fp_c3)._m0[0].x, _761);
    float _851 = _811 * _821;
    float _853 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _855 = _853 + 1.0;
    float _857 = abs(_845);
    float _859 = log2(_857);
    float _861 = _847 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _863 = _847 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _865 = _849 * _821;
    float _867 = fma(_791, _855, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _869 = _861 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _871 = _863 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _873 = _741 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _875 = _867 * _767;
    float _877 = _584 * _869;
    float _879 = _580 * _869;
    float _881 = _588 * _869;
    float _883 = _661 * _875;
    float _885 = fma(_582, _871, _877);
    float _887 = fma(_578, _871, _879);
    float _889 = fma(_586, _871, _881);
    float _891 = _859 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _893 = _885 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _895 = _859 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _897 = _887 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _899 = _889 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _901 = _893 * 0.715200006961822509765625;
    float _903 = exp2(_891);
    float _905 = fma(_897, 0.2125999927520751953125, _901);
    float _907 = fma(_899, 0.072200000286102294921875, _905);
    float _909 = exp2(_895);
    float _911 = -_893;
    float _913 = _911 + _907;
    float _915 = -_897;
    float _917 = _915 + _907;
    float _919 = fma(_873, _913, _893);
    float _921 = _903 * _835;
    float _923 = _653 * _875;
    float _925 = fma(_873, _917, _897);
    float _927 = -_899;
    float _929 = _927 + _907;
    float _931 = -_865;
    float _933 = fma(_653, _883, _931);
    float _935 = -_829;
    float _937 = fma(_659, _923, _935);
    float _939 = -_851;
    float _941 = fma(_657, _923, _939);
    float _943 = fma(_873, _929, _899);
    float _945 = _909 * _919;
    float _947 = fma(_643, _937, _829);
    float _949 = _909 * _925;
    float _951 = fma(_643, _941, _851);
    float _953 = _945 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _955 = _947 * _921;
    float _957 = _909 * _943;
    float _959 = fma(_643, _933, _865);
    float _961 = _951 * _921;
    float _963 = fma(_955, (*spvDescriptorSet0.fp_c3)._m0[27].y, _953);
    float _965 = _949 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _967 = _841 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _969 = _959 * _921;
    float _971 = _957 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _973 = fma(_961, (*spvDescriptorSet0.fp_c3)._m0[27].x, _965);
    float _975 = fma(_669, _967, _963);
    float _977 = fma(_969, (*spvDescriptorSet0.fp_c3)._m0[27].z, _971);
    float _979 = fma(_667, _967, _973);
    float _981 = _975 * 0.715200006961822509765625;
    float _983 = -_647;
    float _985 = _983 + 1.0;
    float _987 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _989 = fma(_671, _967, _977);
    float _991 = fma(_979, 0.2125999927520751953125, _981);
    float _993 = _799 * _985;
    float _995 = _753 * _987;
    float _997 = fma(_989, 0.072200000286102294921875, _991);
    float _999 = _993 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _1001 = -_995;
    float _1003 = exp2(_1001);
    float _1005 = 1.0 / _997;
    float _1007 = -_1003;
    float _1009 = _1007 + 1.0;
    float _1011 = _837 * _1009;
    float _1013 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1015 = precise::clamp(_1013, 0.0, 1.0);
    float _1017 = _1011 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1019 = _1011 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1021 = fma(_1015, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1023 = _1011 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1025 = _1003 * _1021;
    float _1027 = fma(_979, _1025, _1023);
    float _1029 = fma(_975, _1025, _1017);
    float _1031 = fma(_989, _1025, _1019);
    out.m_46.x = _1027;
    out.m_46.y = _1029;
    out.m_46.z = _1031;
    out.m_46.w = _999;
    out.m_48.x = _1027;
    out.m_48.y = _1029;
    out.m_48.z = _1031;
    out.m_48.w = _999;
    return out;
}

