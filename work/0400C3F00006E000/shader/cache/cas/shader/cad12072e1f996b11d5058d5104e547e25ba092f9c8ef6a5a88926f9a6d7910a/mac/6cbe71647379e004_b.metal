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
    texture2d<float> fp_t_tcb_1C [[id(9)]];
    sampler fp_t_tcb_1CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d<float> fp_t_tcb_E [[id(13)]];
    sampler fp_t_tcb_ESmplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    texture2d<float> fp_t_tcb_14 [[id(17)]];
    sampler fp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_18 [[id(19)]];
    sampler fp_t_tcb_18Smplr [[id(20)]];
    texture2d<float> fp_t_tcb_1A [[id(21)]];
    sampler fp_t_tcb_1ASmplr [[id(22)]];
    texture2d<float> fp_t_tcb_1E [[id(23)]];
    sampler fp_t_tcb_1ESmplr [[id(24)]];
    sampler fp_t_tcb_8Smplr_w [[id(25)]];
    sampler fp_t_tcb_ASmplr_w [[id(26)]];
    sampler fp_t_tcb_12Smplr_w [[id(27)]];
    sampler fp_t_tcb_10Smplr_w [[id(28)]];
    sampler fp_t_tcb_1CSmplr_w [[id(29)]];
    sampler fp_t_tcb_CSmplr_w [[id(30)]];
    sampler fp_t_tcb_ESmplr_w [[id(31)]];
    sampler fp_t_tcb_16Smplr_w [[id(32)]];
    sampler fp_t_tcb_14Smplr_w [[id(33)]];
    sampler fp_t_tcb_18Smplr_w [[id(34)]];
    sampler fp_t_tcb_1ASmplr_w [[id(35)]];
    sampler fp_t_tcb_1ESmplr_w [[id(36)]];
    constant dm_border_t* dm_border [[id(37)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
    float4 m_56 [[color(1)]];
};

struct main0_in
{
    float4 m_58 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _64(thread const int& _2635, thread const int& _2636, thread const int& _2637, thread const int& _2638, thread int& _2639, thread int& _2640, thread int& _2641, thread int& _2642, thread int& _2643, thread int& _2644)
{
    float _2647 = as_type<float>(_2635) + 0.0;
    bool _2649 = _2647 != 0.0;
    bool _2651 = isnan(_2647);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan(0.0);
    bool _2657 = _2653 || _2655;
    int _2659 = as_type<int>(_2647);
    int _2661 = 0;
    int _2663 = _2657 ? (-1) : 0;
    if (!_2657)
    {
        float _2665 = as_type<float>(_2635) * 1.0;
        _2659 = as_type<int>(_2665);
    }
    int _2667 = _2659;
    bool _2669 = !_2657;
    int _2671 = _2667;
    if (!_2669)
    {
        float _2673 = as_type<float>(_2635) + 0.0;
        bool _2675 = _2673 >= 0.0;
        bool _2677 = isnan(_2673);
        bool _2679 = _2675 || _2677;
        bool _2681 = isnan(0.0);
        bool _2683 = _2679 || _2681;
        int _2685 = as_type<int>(_2673);
        _2663 = _2683 ? (-1) : 0;
        if (!_2683)
        {
            _2685 = 2147483647;
        }
        int _2687 = _2685;
        bool _2689 = !_2683;
        _2671 = _2687;
        if (!_2689)
        {
            float _2691 = abs(as_type<float>(_2635));
            float _2693 = _2691 + 0.0;
            bool _2695 = _2693 > as_type<float>(0x7f800000u /* inf */);
            bool _2697 = isnan(_2693);
            bool _2699 = _2695 || _2697;
            bool _2701 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2703 = _2699 || _2701;
            int _2705 = as_type<int>(_2693);
            _2661 = 2139095040;
            _2663 = _2703 ? (-1) : 0;
            if (_2703)
            {
                float _2707 = as_type<float>(_2635) + 1.0;
                _2705 = as_type<int>(_2707);
            }
            int _2709 = _2705;
            _2671 = _2709;
            if (!_2703)
            {
                float _2711 = abs(as_type<float>(_2635));
                float _2713 = _2711 + (-0.0);
                float _2715 = 0.0 + _2713;
                bool _2717 = _2715 != as_type<float>(0x7f800000u /* inf */);
                bool _2719 = isnan(_2715);
                bool _2721 = _2717 || _2719;
                bool _2723 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2725 = _2721 || _2723;
                int _2727 = as_type<int>(_2715);
                _2663 = _2725 ? (-1) : 0;
                if (!_2725)
                {
                    _2727 = _2635;
                }
                int _2729 = _2727;
                bool _2731 = !_2725;
                _2671 = _2729;
                if (!_2731)
                {
                    float _2733 = as_type<float>(_2635) * 18446744073709551616.0;
                    float _2735 = rsqrt(_2733);
                    float _2737 = _2733 * _2735;
                    float _2739 = _2735 * 0.5;
                    float _2741 = -_2737;
                    float _2743 = 0.0 + _2741;
                    float _2745 = fma(_2739, _2743, 0.5);
                    float _2747 = fma(_2737, _2745, _2737);
                    float _2749 = -_2747;
                    float _2751 = 0.0 + _2749;
                    float _2753 = fma(_2747, _2751, _2733);
                    float _2755 = fma(_2739, _2753, _2747);
                    float _2757 = _2755 * 2.3283064365386962890625e-10;
                    _2671 = as_type<int>(_2757);
                    _2661 = as_type<int>(_2753);
                }
            }
        }
    }
    int _2759 = _2671;
    int _2761 = _2661;
    int _2763 = _2663;
    _2639 = _2759;
    _2640 = _2759;
    _2641 = _2761;
    _2642 = _2638;
    _2643 = 0;
    _2644 = _2763;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _262 = false;
    float _68 = gl_FragCoord.w;
    float _70 = in.m_51.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_51.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_51.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _68;
    float _90 = _88 * _74;
    float _92 = _88 * _80;
    float _94 = _88 * _86;
    float _96 = _90 * _90;
    float _98 = fma(_92, _92, _96);
    float _100 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _102 = fma(_94, _94, _98);
    float _104 = precise::max(0.0, _100);
    float _106 = rsqrt(_102);
    float _108 = _92 * _106;
    float _110 = _94 * _106;
    float _112 = _90 * _106;
    float _114 = _108 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _116 = _110 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _118 = -_112;
    float _120 = -_104;
    float _122 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[13].z, _120);
    float _124 = _114 * _114;
    float _126 = _116 * _116;
    float _128 = _124 + _126;
    float _130 = sqrt(_128);
    bool _134 = _130 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _136 = _104;
    float _138 = _106;
    float _140 = _122;
    float _142 = _114;
    float _144 = _116;
    if (!_134)
    {
        _136 = _126;
    }
    float _146 = _136;
    float _148 = _146;
    if (!_134)
    {
        _138 = _124;
    }
    float _150 = _138;
    bool _152 = !_134;
    float _154 = _150;
    if (!_152)
    {
        float _156 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _158 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _160 = _130 + _158;
        float _162 = _122 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _164 = rsqrt(_128);
        float _166 = _160 * _156;
        float _168 = _166 * 0.15915493667125701904296875;
        float _170 = _168 * 6.283185482025146484375;
        float _172 = sin(_170);
        float _174 = _168 * 6.283185482025146484375;
        float _176 = cos(_174);
        float _178 = fma(_172, _162, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _180 = _164 * _178;
        float _182 = _176 + (-1.0);
        float _184 = _114 * _180;
        float _186 = _116 * _180;
        float _188 = _182 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _190 = _186 * _186;
        float _192 = fma(_122, _176, _188);
        float _194 = _184 * _184;
        _140 = _192;
        _154 = _194;
        _148 = _190;
        _142 = _184;
        _144 = _186;
    }
    float _196 = _140;
    float _198 = _154;
    float _200 = _148;
    float _202 = _142;
    float _204 = _144;
    float _206 = fma(_196, _196, _198);
    float _208 = _206 + _200;
    float _210 = rsqrt(_208);
    float _212 = _210 * _196;
    float _214 = _210 * _202;
    float _216 = _210 * _204;
    float _218 = -_212;
    float _220 = precise::max(0.0, _218);
    float _222 = abs(_220);
    float _224 = -_222;
    float _226 = _224 + 1.0;
    float _228 = fma(_220, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _230 = as_type<int>(_226) + (-218103808);
    float _232 = fma(_220, _228, -0.212114393711090087890625);
    bool _234 = uint(_230) >= 1920991232u;
    float _236 = fma(_220, _232, 1.570728778839111328125);
    bool _238 = !_234;
    float _260;
    if (!_238)
    {
        int _240 = as_type<int>(_226);
        int _242 = 0;
        int _244 = 0;
        int _246 = 1136;
        int _248;
        int _250;
        int _252;
        int _254;
        int _256;
        int _258;
        _64(_240, _242, _244, _246, _248, _250, _252, _254, _256, _258);
        _260 = as_type<float>(_248);
        _262 = true;
    }
    else
    {
        float _264 = rsqrt(_226);
        float _266 = _226 * _264;
        float _268 = _264 * 0.5;
        float _270 = -_266;
        float _272 = 0.0 + _270;
        float _274 = fma(_268, _272, 0.5);
        float _276 = fma(_266, _274, _266);
        float _278 = -_276;
        float _280 = 0.0 + _278;
        float _282 = fma(_276, _280, _226);
        float _284 = fma(_268, _282, _276);
        _260 = _284;
    }
    _262 = false;
    float _286 = _260;
    bool _288 = _212 > 0.0;
    float _290 = _110 * _110;
    float _292 = _108 * _108;
    float _294 = _290 + _292;
    if (_288)
    {
        discard_fragment();
    }
    float _296 = rsqrt(_294);
    float _298 = _236 * _286;
    float _300 = _298 * 0.636619746685028076171875;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    float _304 = -_302;
    float _306 = _304 + 1.0;
    float _308 = sqrt(_306);
    float _310 = _110 * _296;
    float _312 = _108 * _296;
    float _314 = abs(_310);
    float _316 = abs(_312);
    float _318 = precise::max(_314, _316);
    float _320 = precise::max(_318, 9.9999997473787516355514526367188e-05);
    float _322 = -_308;
    float _324 = _322 + 1.0;
    float _326 = 1.0 / _320;
    float _328 = _324 * 0.5;
    float _330 = -_326;
    float _332 = _310 * _330;
    float _334 = _312 * _326;
    float _336 = fma(_332, _328, 0.5);
    float _338 = fma(_334, _328, 0.5);
    if (_288)
    {
        out.m_54.x = 0.0;
        out.m_54.y = 0.0;
        out.m_54.z = 0.0;
        out.m_54.w = 0.0;
        out.m_56.x = 0.0;
        out.m_56.y = 0.0;
        out.m_56.z = 0.0;
        out.m_56.w = 0.0;
        return out;
    }
    float2 _1436;
    _1436.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_336, _338));
    _1436.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_336, _338));
    float _340 = _1436.x;
    float _342 = _340 * 256.0;
    int _344 = int(_342);
    float _346 = -_112;
    float _348 = _346 + 1.0;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = in.m_58.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = _108 * _110;
    float _360 = abs(_350);
    float _362 = log2(_360);
    float _364 = fma(_290, 3.0, -1.0);
    float _366 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _368 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _370 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _372 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _374 = _112 * _366;
    float _376 = _112 * _368;
    float _378 = _112 * _370;
    float _380 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _374);
    float _382 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _376);
    float _384 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _378);
    float _386 = -_110;
    float _388 = fma(_386, _372, _382);
    float _390 = _362 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _392 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _394 = fma(_110, _372, _382);
    float _396 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _398 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _400 = -_110;
    float _402 = fma(_400, _392, _380);
    float _404 = exp2(_390);
    float _406 = fma(_110, _392, _380);
    float _408 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _410 = -_108;
    float _412 = fma(_410, _396, _402);
    float _414 = fma(_108, _396, _406);
    float _416 = -_110;
    float _418 = fma(_416, _408, _384);
    float _420 = fma(_110, _408, _384);
    float _422 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _424 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _426 = _88 * _356;
    float _428 = -_108;
    float _430 = fma(_428, _422, _388);
    float _432 = fma(_108, _422, _394);
    float _434 = fma(_108, _424, _420);
    float _436 = -_112;
    float _438 = _108 * _436;
    float _440 = _404 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _442 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _444 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _446 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _448 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = -_108;
    float _454 = fma(_452, _424, _418);
    float _456 = _108 * _112;
    float _458 = fma(_442, _438, _412);
    float _460 = fma(_444, _438, _430);
    float _462 = fma(_446, _438, _454);
    float _464 = fma(_446, _456, _434);
    float _466 = _110 * (-3.0);
    float _468 = in.m_58.y;
    float _470 = gl_FragCoord.w;
    float _472 = _468 * _470;
    float _474 = fma(_442, _456, _414);
    float _476 = -_110;
    float _478 = _112 * _476;
    float _480 = -_110;
    float _482 = fma(_480, _466, -1.0);
    float _484 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _486 = _112 * _110;
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _490 = fma(_444, _456, _432);
    float _492 = fma(_484, _478, _458);
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _496 = fma(_484, _486, _474);
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _500 = fma(_488, _478, _460);
    float _502 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _504 = fma(_488, _486, _490);
    float _506 = fma(_494, _478, _462);
    float _508 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _510 = fma(_494, _486, _464);
    float _512 = fma(_498, _358, _492);
    float _514 = fma(_498, _358, _496);
    float _516 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _518 = fma(_502, _358, _500);
    float _520 = fma(_502, _358, _504);
    float _522 = fma(_508, _358, _506);
    float _524 = fma(_508, _358, _510);
    float _526 = fma(_516, _482, _512);
    float _528 = fma(_516, _364, _514);
    float _530 = fma(_398, _482, _518);
    float _532 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _534 = _88 * _472;
    float _536 = fma(_532, _482, _522);
    float _538 = float(uint(_344));
    float _540 = _538 * 0.00390625;
    float2 _1773 = float2(_336, _338);
    float4 _543 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1773, float2(0.0), isnan(_1773)), level(_540)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1773, float2(0.0), isnan(_1773)), level(_540)).xyzw;
    float _545 = _543.x;
    float _547 = _543.y;
    float _549 = _543.z;
    float _551 = _543.w;
    float2 _1792 = float2(_336, _338);
    float2 _555 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1792, float2(0.0), isnan(_1792)), level(_540)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1792, float2(0.0), isnan(_1792)), level(_540)).xy;
    float _557 = _555.x;
    float _559 = _555.y;
    float2 _1805 = float2(_336, _338);
    float2 _561 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1805, float2(0.0), isnan(_1805)), level(_540)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1805, float2(0.0), isnan(_1805)), level(_540)).xy;
    float _563 = _561.x;
    float _565 = _561.y;
    float2 _1818 = float2(_336, _338);
    float4 _567 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1818, float2(0.0), isnan(_1818)), level(_540)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1818, float2(0.0), isnan(_1818)), level(_540)).xyzw;
    float _569 = _567.x;
    float _571 = _567.y;
    float _573 = _567.z;
    float _575 = _567.w;
    float2 _1835 = float2(_426, _534);
    float2 _577 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_1835, float2(0.0), isnan(_1835))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_1835, float2(0.0), isnan(_1835))).xy;
    float _579 = _577.x;
    float _581 = _577.y;
    float _583 = -_450;
    float _585 = _583 + 1.0;
    float _587 = fma(_398, _364, _520);
    float _589 = _214 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _591 = fma(_532, _364, _524);
    float _593 = -_112;
    float _595 = fma(_593, _112, _292);
    float _597 = abs(_585);
    float _599 = log2(_597);
    float _601 = -_589;
    float _603 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[11].y, _601);
    float _605 = -_216;
    float _607 = fma(_605, (*spvDescriptorSet0.fp_c3)._m0[11].z, _603);
    float _609 = _212 + 1.0;
    float _611 = fma(_607, -0.5, 0.5);
    float _613 = fma(_607, 0.5, 0.5);
    float _615 = sqrt(_611);
    float _617 = _599 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _619 = exp2(_617);
    float _621 = _615 * 0.636619746685028076171875;
    float _623 = -_212;
    float _625 = fma(_619, _609, _623);
    float _627 = fma(_625, 0.5, 0.5);
    float _629 = fma(_613, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _631 = fma(_613, _629, -0.212114393711090087890625);
    float _633 = fma(_613, _631, 1.570728778839111328125);
    float _635 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _637 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _639 = -_633;
    float _641 = fma(_621, _639, 1.0);
    float _643 = fma(_635, _595, _526);
    float _645 = fma(_635, _595, _528);
    float _647 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _649 = fma(_647, _595, _530);
    float _651 = fma(_647, _595, _587);
    float _653 = fma(_637, _595, _536);
    float _655 = fma(_637, _595, _591);
    float _657 = _551 * _551;
    float _659 = _575 * _575;
    float _661 = _657 * _657;
    float _663 = _659 * _659;
    float _665 = _661 * 16.0;
    float _667 = _557 * _559;
    float _669 = -_559;
    float _671 = _669 + _565;
    float _673 = _559 * _665;
    float _675 = _663 * 16.0;
    float _677 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[0].x, _559);
    float _679 = _547 * _673;
    float _681 = _545 * _673;
    float _683 = _565 * _675;
    float _685 = -_667;
    float _687 = fma(_563, _565, _685);
    float _689 = _549 * _673;
    float _691 = -_681;
    float _693 = fma(_569, _683, _691);
    float _695 = -_679;
    float _697 = fma(_571, _683, _695);
    float _699 = fma(_687, (*spvDescriptorSet0.fp_c3)._m0[0].x, _667);
    float _701 = -_689;
    float _703 = fma(_573, _683, _701);
    float _705 = fma(_693, (*spvDescriptorSet0.fp_c3)._m0[0].x, _681);
    float _707 = fma(_579, 2.0, -1.0);
    float _709 = fma(_581, 2.0, -1.0);
    float _711 = fma(_697, (*spvDescriptorSet0.fp_c3)._m0[0].x, _679);
    float2 _2051 = float2(_336, _338);
    float4 _713 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2051, float2(0.0), isnan(_2051)), level(_540)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2051, float2(0.0), isnan(_2051)), level(_540)).xyzw;
    float _715 = _713.x;
    float _717 = _713.y;
    float _719 = _713.z;
    float _721 = _713.w;
    float2 _2068 = float2(_336, _338);
    float2 _723 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2068, float2(0.0), isnan(_2068)), level(_540)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2068, float2(0.0), isnan(_2068)), level(_540)).xy;
    float _725 = _723.x;
    float _727 = _723.y;
    float2 _2081 = float2(_336, _338);
    float2 _729 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2081, float2(0.0), isnan(_2081)), level(_540)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2081, float2(0.0), isnan(_2081)), level(_540)).xy;
    float _731 = _729.x;
    float _733 = _729.y;
    float2 _2094 = float2(_336, _338);
    float4 _735 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2094, float2(0.0), isnan(_2094)), level(_540)), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2094, float2(0.0), isnan(_2094)), level(_540)).xyzw;
    float _737 = _735.x;
    float _739 = _735.y;
    float _741 = _735.z;
    float _743 = _735.w;
    float _745 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[22].x, _426);
    float _747 = fma(_709, (*spvDescriptorSet0.fp_c3)._m0[22].y, _534);
    float _749 = fma(_703, (*spvDescriptorSet0.fp_c3)._m0[0].x, _689);
    float2 _2127 = float2(_426, _534);
    float3 _753 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2127, float2(0.0), isnan(_2127))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2127, float2(0.0), isnan(_2127))).xyz;
    float _755 = _753.x;
    float _757 = _753.y;
    float _759 = _753.z;
    float2 _2141 = float2(_641, _627);
    float3 _761 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2141, float2(0.0), isnan(_2141))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2141, float2(0.0), isnan(_2141))).xyz;
    float _763 = _761.x;
    float _765 = _761.y;
    float _767 = _761.z;
    float2 _2155 = float2(_745, _747);
    float4 _769 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2155, float2(0.0), isnan(_2155))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2155, float2(0.0), isnan(_2155))).xyzw;
    float _771 = _769.x;
    float _773 = _769.y;
    float _775 = _769.z;
    float _777 = _769.w;
    float _779 = precise::max(_677, 1.52587890625e-05);
    float _781 = 1.0 / _779;
    float _783 = _677 * _781;
    float _785 = _711 * _783;
    float _787 = _749 * _783;
    float _789 = _699 * _783;
    float _791 = _721 * _721;
    float _793 = _743 * _743;
    float _795 = _791 * _791;
    float _797 = _793 * _793;
    float _799 = _795 * 16.0;
    float _801 = _705 * _783;
    float _803 = _599 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _805 = _755 * _757;
    float _807 = _727 * _799;
    float _809 = -_759;
    float _811 = _809 + 1.0;
    float _813 = _715 * _807;
    float _815 = _717 * _807;
    float _817 = _719 * _807;
    float _819 = -_727;
    float _821 = _819 + _733;
    float _823 = _725 * _727;
    float _825 = _797 * 16.0;
    float _827 = fma(_821, (*spvDescriptorSet0.fp_c3)._m0[0].x, _727);
    float _829 = -_823;
    float _831 = fma(_731, _733, _829);
    float _833 = _733 * _825;
    float _835 = -_805;
    float _837 = _835 + 1.0;
    float _839 = -_677;
    float _841 = _839 + _827;
    float _843 = fma(_831, (*spvDescriptorSet0.fp_c3)._m0[0].x, _823);
    float _845 = precise::max(_827, 1.52587890625e-05);
    float _847 = -_813;
    float _849 = fma(_737, _833, _847);
    float _851 = fma(_755, _841, _677);
    float _853 = exp2(_803);
    float _855 = -_815;
    float _857 = fma(_739, _833, _855);
    float _859 = -_817;
    float _861 = fma(_741, _833, _859);
    float _863 = precise::max(_851, 1.52587890625e-05);
    float _865 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _867 = _865 + 1.0;
    float _869 = fma(_849, (*spvDescriptorSet0.fp_c3)._m0[0].x, _813);
    float _871 = fma(_861, (*spvDescriptorSet0.fp_c3)._m0[0].x, _817);
    float _873 = 1.0 / _845;
    float _875 = fma(_837, _867, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _877 = fma(_857, (*spvDescriptorSet0.fp_c3)._m0[0].x, _815);
    float _879 = _851 * _811;
    float _881 = 1.0 / _863;
    float _883 = -_853;
    float _885 = _883 + 1.0;
    float _887 = _885 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _889 = _843 * _873;
    float _891 = -_887;
    float _893 = _891 + 1.0;
    float _895 = _889 * _875;
    float _897 = -_789;
    float _899 = fma(_827, _895, _897);
    float _901 = fma(_755, _899, _789);
    float _903 = _901 * _881;
    float _905 = abs(_893);
    float _907 = log2(_905);
    float _909 = _903 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _911 = _903 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _913 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _915 = _913 + 1.0;
    float _917 = _909 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _919 = _911 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _921 = fma(_837, _915, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _923 = _651 * _917;
    float _925 = _655 * _917;
    float _927 = _921 * _873;
    float _929 = fma(_649, _919, _923);
    float _931 = _645 * _917;
    float _933 = _907 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _935 = fma(_653, _919, _925);
    float _937 = _871 * _927;
    float _939 = fma(_643, _919, _931);
    float _941 = _929 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _943 = _907 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _945 = exp2(_933);
    float _947 = _939 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _949 = _941 * 0.715200006961822509765625;
    float _951 = _935 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _953 = _827 * _927;
    float _955 = -_787;
    float _957 = fma(_827, _937, _955);
    float _959 = fma(_947, 0.2125999927520751953125, _949);
    float _961 = exp2(_943);
    float _963 = -_801;
    float _965 = fma(_869, _953, _963);
    float _967 = fma(_951, 0.072200000286102294921875, _959);
    float _969 = -_785;
    float _971 = fma(_877, _953, _969);
    float _973 = _805 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _975 = fma(_755, _965, _801);
    float _977 = -_941;
    float _979 = _977 + _967;
    float _981 = fma(_755, _971, _785);
    float _983 = _945 * _881;
    float _985 = fma(_755, _957, _787);
    float _987 = fma(_973, _979, _941);
    float _989 = -_947;
    float _991 = _989 + _967;
    float _993 = -_951;
    float _995 = _993 + _967;
    float _997 = _981 * _983;
    float _999 = _975 * _983;
    float _1001 = fma(_973, _991, _947);
    float _1003 = _961 * _987;
    float _1005 = fma(_973, _995, _951);
    float _1007 = _887 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1009 = _961 * _1001;
    float _1011 = _1003 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1013 = _961 * _1005;
    float _1015 = _985 * _983;
    float _1017 = fma(_997, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1011);
    float _1019 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1021 = _1013 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1023 = fma(_765, _1007, _1017);
    float _1025 = fma(_999, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1019);
    float _1027 = fma(_1015, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1021);
    float _1029 = _1023 * 0.715200006961822509765625;
    float _1031 = fma(_763, _1007, _1025);
    float _1033 = fma(_767, _1007, _1027);
    float _1035 = fma(_1031, 0.2125999927520751953125, _1029);
    float _1037 = fma(_1033, 0.072200000286102294921875, _1035);
    float _1039 = 1.0 / _1037;
    float _1041 = _1039 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1043 = precise::clamp(_1041, 0.0, 1.0);
    float _1045 = fma(_1043, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1047 = _1045 * _777;
    float _1049 = _879 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _1051 = fma(_1031, _1047, _771);
    float _1053 = fma(_1023, _1047, _773);
    float _1055 = fma(_1033, _1047, _775);
    out.m_54.x = _1051;
    out.m_54.y = _1053;
    out.m_54.z = _1055;
    out.m_54.w = _1049;
    out.m_56.x = _1051;
    out.m_56.y = _1053;
    out.m_56.z = _1055;
    out.m_56.w = _1049;
    return out;
}

