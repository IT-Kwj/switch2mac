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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_1C [[id(13)]];
    sampler fp_t_tcb_1CSmplr [[id(14)]];
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
    sampler fp_t_tcb_10Smplr_w [[id(27)]];
    sampler fp_t_tcb_12Smplr_w [[id(28)]];
    sampler fp_t_tcb_CSmplr_w [[id(29)]];
    sampler fp_t_tcb_ESmplr_w [[id(30)]];
    sampler fp_t_tcb_1CSmplr_w [[id(31)]];
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
};

struct main0_in
{
    float4 m_56 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _62(thread const int& _2756, thread const int& _2757, thread const int& _2758, thread const int& _2759, thread int& _2760, thread int& _2761, thread int& _2762, thread int& _2763, thread int& _2764)
{
    float _2767 = as_type<float>(_2758) + 0.0;
    bool _2769 = _2767 != 0.0;
    bool _2771 = isnan(_2767);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan(0.0);
    bool _2777 = _2773 || _2775;
    int _2779 = as_type<int>(_2767);
    int _2781 = _2757;
    int _2783 = _2777 ? (-1) : 0;
    if (!_2777)
    {
        float _2785 = as_type<float>(_2758) * 1.0;
        _2779 = as_type<int>(_2785);
    }
    int _2787 = _2779;
    bool _2789 = !_2777;
    int _2791 = _2787;
    if (!_2789)
    {
        float _2793 = as_type<float>(_2758) + 0.0;
        bool _2795 = _2793 >= 0.0;
        bool _2797 = isnan(_2793);
        bool _2799 = _2795 || _2797;
        bool _2801 = isnan(0.0);
        bool _2803 = _2799 || _2801;
        int _2805 = as_type<int>(_2793);
        _2783 = _2803 ? (-1) : 0;
        if (!_2803)
        {
            _2805 = 2147483647;
        }
        int _2807 = _2805;
        bool _2809 = !_2803;
        _2791 = _2807;
        if (!_2809)
        {
            float _2811 = abs(as_type<float>(_2758));
            float _2813 = _2811 + 0.0;
            bool _2815 = _2813 > as_type<float>(0x7f800000u /* inf */);
            bool _2817 = isnan(_2813);
            bool _2819 = _2815 || _2817;
            bool _2821 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2823 = _2819 || _2821;
            int _2825 = as_type<int>(_2813);
            _2783 = _2823 ? (-1) : 0;
            if (_2823)
            {
                float _2827 = as_type<float>(_2758) + 1.0;
                _2825 = as_type<int>(_2827);
            }
            int _2829 = _2825;
            _2791 = _2829;
            if (!_2823)
            {
                float _2831 = abs(as_type<float>(_2758));
                float _2833 = _2831 + (-0.0);
                float _2835 = 0.0 + _2833;
                bool _2837 = _2835 != as_type<float>(0x7f800000u /* inf */);
                bool _2839 = isnan(_2835);
                bool _2841 = _2837 || _2839;
                bool _2843 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2845 = _2841 || _2843;
                int _2847 = as_type<int>(_2835);
                _2783 = _2845 ? (-1) : 0;
                if (!_2845)
                {
                    _2847 = _2758;
                }
                int _2849 = _2847;
                bool _2851 = !_2845;
                _2791 = _2849;
                if (!_2851)
                {
                    float _2853 = as_type<float>(_2758) * 18446744073709551616.0;
                    float _2855 = rsqrt(_2853);
                    float _2857 = _2853 * _2855;
                    float _2859 = _2855 * 0.5;
                    float _2861 = -_2857;
                    float _2863 = 0.0 + _2861;
                    float _2865 = fma(_2859, _2863, 0.5);
                    float _2867 = fma(_2857, _2865, _2857);
                    float _2869 = -_2867;
                    float _2871 = 0.0 + _2869;
                    float _2873 = fma(_2867, _2871, _2853);
                    float _2875 = fma(_2859, _2873, _2867);
                    float _2877 = _2875 * 2.3283064365386962890625e-10;
                    _2791 = as_type<int>(_2877);
                    _2781 = as_type<int>(_2867);
                }
            }
        }
    }
    int _2879 = _2791;
    int _2881 = _2781;
    int _2883 = _2783;
    _2760 = _2879;
    _2761 = _2759;
    _2762 = 0;
    _2763 = _2881;
    _2764 = _2883;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _258 = false;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_51.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_51.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_51.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _88 = precise::max(0.0, _86);
    float _90 = 1.0 / _66;
    float _92 = _90 * _72;
    float _94 = _90 * _78;
    float _96 = _90 * _84;
    float _98 = _92 * _92;
    float _100 = fma(_94, _94, _98);
    float _102 = fma(_96, _96, _100);
    float _104 = rsqrt(_102);
    float _106 = _94 * _104;
    float _108 = _96 * _104;
    float _110 = _92 * _104;
    float _112 = _106 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _114 = _108 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _116 = -_110;
    float _118 = -_88;
    float _120 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[13].z, _118);
    float _122 = _112 * _112;
    float _124 = _114 * _114;
    float _126 = _122 + _124;
    float _128 = sqrt(_126);
    bool _132 = _128 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _134 = _104;
    float _136 = _88;
    float _138 = _120;
    float _140 = _112;
    float _142 = _114;
    if (!_132)
    {
        _134 = _124;
    }
    float _144 = _134;
    float _146 = _144;
    if (!_132)
    {
        _136 = _122;
    }
    float _148 = _136;
    bool _150 = !_132;
    float _152 = _148;
    if (!_150)
    {
        float _154 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _156 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _158 = _128 + _156;
        float _160 = _120 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _162 = rsqrt(_126);
        float _164 = _158 * _154;
        float _166 = _164 * 0.15915493667125701904296875;
        float _168 = _166 * 6.283185482025146484375;
        float _170 = sin(_168);
        float _172 = _166 * 6.283185482025146484375;
        float _174 = cos(_172);
        float _176 = fma(_170, _160, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _178 = _162 * _176;
        float _180 = _174 + (-1.0);
        float _182 = _112 * _178;
        float _184 = _114 * _178;
        float _186 = _180 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _188 = _184 * _184;
        float _190 = fma(_120, _174, _186);
        float _192 = _182 * _182;
        _138 = _190;
        _152 = _192;
        _146 = _188;
        _140 = _182;
        _142 = _184;
    }
    float _194 = _138;
    float _196 = _152;
    float _198 = _146;
    float _200 = _140;
    float _202 = _142;
    float _204 = fma(_194, _194, _196);
    float _206 = _204 + _198;
    float _208 = rsqrt(_206);
    float _210 = _208 * _194;
    float _212 = _208 * _200;
    float _214 = _208 * _202;
    float _216 = -_210;
    float _218 = precise::max(0.0, _216);
    float _220 = abs(_218);
    float _222 = -_220;
    float _224 = _222 + 1.0;
    float _226 = fma(_218, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _228 = as_type<int>(_224) + (-218103808);
    float _230 = fma(_218, _226, -0.212114393711090087890625);
    bool _232 = uint(_228) >= 1920991232u;
    float _234 = fma(_218, _230, 1.570728778839111328125);
    bool _236 = !_232;
    float _256;
    if (!_236)
    {
        int _238 = 0;
        int _240 = 0;
        int _242 = as_type<int>(_224);
        int _244 = 1104;
        int _246;
        int _248;
        int _250;
        int _252;
        int _254;
        _62(_238, _240, _242, _244, _246, _248, _250, _252, _254);
        _256 = as_type<float>(_246);
        _258 = true;
    }
    else
    {
        float _260 = rsqrt(_224);
        float _262 = _224 * _260;
        float _264 = _260 * 0.5;
        float _266 = -_262;
        float _268 = 0.0 + _266;
        float _270 = fma(_264, _268, 0.5);
        float _272 = fma(_262, _270, _262);
        float _274 = -_272;
        float _276 = 0.0 + _274;
        float _278 = fma(_272, _276, _224);
        float _280 = fma(_264, _278, _272);
        _256 = _280;
    }
    _258 = false;
    float _282 = _256;
    bool _284 = _210 > 0.0;
    float _286 = _108 * _108;
    float _288 = _106 * _106;
    float _290 = _286 + _288;
    if (_284)
    {
        discard_fragment();
    }
    float _292 = rsqrt(_290);
    float _294 = _234 * _282;
    float _296 = _294 * 0.636619746685028076171875;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = -_298;
    float _302 = _300 + 1.0;
    float _304 = sqrt(_302);
    float _306 = _108 * _292;
    float _308 = _106 * _292;
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
        out.m_54.x = 0.0;
        out.m_54.y = 0.0;
        out.m_54.z = 0.0;
        out.m_54.w = 0.0;
        return out;
    }
    float2 _1484;
    _1484.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_332, _334));
    _1484.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_332, _334));
    float _336 = _1484.x;
    float _338 = _336 * 256.0;
    int _340 = int(_338);
    float _342 = -_110;
    float _344 = _342 + 1.0;
    float _346 = precise::clamp(_344, 0.0, 1.0);
    float _348 = _212 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _350 = fma(_210, -0.5, 0.5);
    float _352 = -_348;
    float _354 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[11].y, _352);
    float _356 = abs(_346);
    float _358 = log2(_356);
    float _360 = fma(_286, 3.0, -1.0);
    float _362 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _364 = -_214;
    float _366 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[11].z, _354);
    float _368 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _370 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _372 = _110 * _362;
    float _374 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _376 = _110 * _368;
    float _378 = _110 * _370;
    float _380 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _372);
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _384 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _376);
    float _386 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _378);
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _390 = _358 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _392 = -_108;
    float _394 = fma(_392, _374, _380);
    float _396 = fma(_108, _374, _380);
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _400 = exp2(_390);
    float _402 = -_108;
    float _404 = fma(_402, _388, _384);
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _408 = -_106;
    float _410 = fma(_408, _382, _394);
    float _412 = _108 * (-3.0);
    float _414 = fma(_108, _388, _384);
    float _416 = fma(_106, _382, _396);
    float _418 = -_110;
    float _420 = fma(_418, _110, _288);
    float _422 = -_108;
    float _424 = fma(_422, _398, _386);
    float _426 = -_106;
    float _428 = fma(_426, _406, _404);
    float _430 = fma(_108, _398, _386);
    float _432 = -_108;
    float _434 = fma(_432, _412, -1.0);
    float _436 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _438 = fma(_106, _406, _414);
    float _440 = _106 * _108;
    float _442 = -_108;
    float _444 = _110 * _442;
    float _446 = _110 * _108;
    float _448 = _400 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _450 = -_110;
    float _452 = _106 * _450;
    float _454 = _106 * _110;
    float _456 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _458 = -_106;
    float _460 = fma(_458, _436, _424);
    float _462 = fma(_106, _436, _430);
    float _464 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _466 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _468 = fma(_448, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = fma(_456, _452, _410);
    float _474 = fma(_456, _454, _416);
    float _476 = fma(_464, _454, _438);
    float _478 = fma(_466, _454, _462);
    float _480 = -_470;
    float _482 = _480 + 1.0;
    float _484 = fma(_366, 0.5, 0.5);
    float _486 = fma(_366, -0.5, 0.5);
    float _488 = fma(_464, _452, _428);
    float _490 = fma(_466, _452, _460);
    float _492 = abs(_482);
    float _494 = log2(_492);
    float _496 = fma(_484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _502 = fma(_484, _496, -0.212114393711090087890625);
    float _504 = fma(_498, _444, _472);
    float _506 = fma(_498, _446, _474);
    float _508 = sqrt(_486);
    float _510 = fma(_484, _502, 1.570728778839111328125);
    float _512 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _514 = fma(_500, _446, _476);
    float _516 = fma(_500, _444, _488);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _520 = fma(_512, _446, _478);
    float _522 = fma(_512, _444, _490);
    float _524 = _494 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _526 = fma(_518, _440, _516);
    float _528 = fma(_518, _440, _514);
    float _530 = in.m_56.x;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = exp2(_524);
    float _538 = _508 * 0.636619746685028076171875;
    float _540 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _542 = -_510;
    float _544 = fma(_538, _542, 1.0);
    float _546 = fma(_540, _440, _504);
    float _548 = fma(_540, _440, _506);
    float _550 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _552 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _554 = in.m_56.y;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = fma(_550, _440, _522);
    float _562 = fma(_550, _440, _520);
    float _564 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _566 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _568 = fma(_552, _434, _546);
    float _570 = fma(_552, _360, _548);
    float _572 = _210 + 1.0;
    float _574 = fma(_564, _434, _526);
    float _576 = fma(_564, _360, _528);
    float _578 = fma(_566, _360, _562);
    float _580 = fma(_566, _434, _560);
    float _582 = -_210;
    float _584 = fma(_536, _572, _582);
    float _586 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _588 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _590 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _592 = fma(_584, 0.5, 0.5);
    float _594 = fma(_586, _420, _568);
    float _596 = fma(_586, _420, _570);
    float _598 = fma(_588, _420, _574);
    float _600 = fma(_588, _420, _576);
    float _602 = fma(_590, _420, _580);
    float _604 = fma(_590, _420, _578);
    float _606 = _90 * _534;
    float _608 = _90 * _558;
    float _610 = float(uint(_340));
    float _612 = _610 * 0.00390625;
    float2 _1938 = float2(_332, _334);
    float4 _615 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1938, float2(0.0), isnan(_1938)), level(_612)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1938, float2(0.0), isnan(_1938)), level(_612)).xyzw;
    float _617 = _615.x;
    float _619 = _615.y;
    float _621 = _615.z;
    float _623 = _615.w;
    float2 _1957 = float2(_332, _334);
    float2 _627 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1957, float2(0.0), isnan(_1957)), level(_612)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1957, float2(0.0), isnan(_1957)), level(_612)).xy;
    float _629 = _627.x;
    float _631 = _627.y;
    float2 _1970 = float2(_332, _334);
    float4 _633 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1970, float2(0.0), isnan(_1970)), level(_612)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1970, float2(0.0), isnan(_1970)), level(_612)).xyzw;
    float _635 = _633.x;
    float _637 = _633.y;
    float _639 = _633.z;
    float _641 = _633.w;
    float2 _1987 = float2(_332, _334);
    float2 _643 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1987, float2(0.0), isnan(_1987)), level(_612)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1987, float2(0.0), isnan(_1987)), level(_612)).xy;
    float _645 = _643.x;
    float _647 = _643.y;
    float2 _2000 = float2(_332, _334);
    float4 _649 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2000, float2(0.0), isnan(_2000)), level(_612)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2000, float2(0.0), isnan(_2000)), level(_612)).xyzw;
    float _651 = _649.x;
    float _653 = _649.y;
    float _655 = _649.z;
    float _657 = _649.w;
    float2 _2017 = float2(_332, _334);
    float2 _659 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2017, float2(0.0), isnan(_2017)), level(_612)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2017, float2(0.0), isnan(_2017)), level(_612)).xy;
    float _661 = _659.x;
    float _663 = _659.y;
    float2 _2030 = float2(_606, _608);
    float2 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2030, float2(0.0), isnan(_2030))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2030, float2(0.0), isnan(_2030))).xy;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _623 * _623;
    float _673 = _671 * _671;
    float _675 = _641 * _641;
    float _677 = _673 * 16.0;
    float _679 = _675 * _675;
    float _681 = _631 * _677;
    float _683 = _657 * _657;
    float _685 = _617 * _681;
    float _687 = _619 * _681;
    float _689 = _679 * 16.0;
    float _691 = _621 * _681;
    float _693 = _629 * _631;
    float _695 = _683 * _683;
    float _697 = _647 * _689;
    float _699 = -_631;
    float _701 = _699 + _647;
    float _703 = -_693;
    float _705 = fma(_645, _647, _703);
    float _707 = -_685;
    float _709 = fma(_635, _697, _707);
    float _711 = -_687;
    float _713 = fma(_637, _697, _711);
    float _715 = -_691;
    float _717 = fma(_639, _697, _715);
    float _719 = _695 * 16.0;
    float _721 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[0].x, _693);
    float _723 = fma(_713, (*spvDescriptorSet0.fp_c3)._m0[0].x, _687);
    float _725 = _663 * _719;
    float _727 = fma(_709, (*spvDescriptorSet0.fp_c3)._m0[0].x, _685);
    float _729 = fma(_717, (*spvDescriptorSet0.fp_c3)._m0[0].x, _691);
    float _731 = fma(_667, 2.0, -1.0);
    float _733 = fma(_669, 2.0, -1.0);
    float _735 = _651 * _725;
    float _737 = _653 * _725;
    float _739 = _655 * _725;
    float _741 = fma(_731, (*spvDescriptorSet0.fp_c3)._m0[22].x, _606);
    float2 _2157 = float2(_332, _334);
    float2 _743 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2157, float2(0.0), isnan(_2157)), level(_612)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2157, float2(0.0), isnan(_2157)), level(_612)).xy;
    float _745 = _743.x;
    float _747 = _743.y;
    float2 _2170 = float2(_332, _334);
    float4 _749 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2170, float2(0.0), isnan(_2170)), level(_612)), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2170, float2(0.0), isnan(_2170)), level(_612)).xyzw;
    float _751 = _749.x;
    float _753 = _749.y;
    float _755 = _749.z;
    float _757 = _749.w;
    float _759 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[22].y, _608);
    float _761 = fma(_701, (*spvDescriptorSet0.fp_c3)._m0[0].x, _631);
    float2 _2197 = float2(_606, _608);
    float3 _765 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2197, float2(0.0), isnan(_2197))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2197, float2(0.0), isnan(_2197))).xyz;
    float _767 = _765.x;
    float _769 = _765.y;
    float _771 = _765.z;
    float2 _2211 = float2(_544, _592);
    float3 _773 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2211, float2(0.0), isnan(_2211))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2211, float2(0.0), isnan(_2211))).xyz;
    float _775 = _773.x;
    float _777 = _773.y;
    float _779 = _773.z;
    float2 _2225 = float2(_544, _350);
    float3 _781 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2225, float2(0.0), isnan(_2225))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2225, float2(0.0), isnan(_2225))).xyz;
    float _783 = _781.x;
    float _785 = _781.y;
    float _787 = _781.z;
    float2 _2239 = float2(_741, _759);
    float4 _789 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2239, float2(0.0), isnan(_2239))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2239, float2(0.0), isnan(_2239))).xyzw;
    float _791 = _789.x;
    float _793 = _789.y;
    float _795 = _789.z;
    float _797 = _789.w;
    float _799 = _757 * _757;
    float _801 = -_663;
    float _803 = _801 + _747;
    float _805 = _767 * _769;
    float _807 = _799 * _799;
    float _809 = fma(_803, (*spvDescriptorSet0.fp_c3)._m0[0].x, _663);
    float _811 = _661 * _663;
    float _813 = -_771;
    float _815 = _813 + 1.0;
    float _817 = _807 * 16.0;
    float _819 = -_811;
    float _821 = fma(_745, _747, _819);
    float _823 = _747 * _817;
    float _825 = precise::max(_761, 1.52587890625e-05);
    float _827 = fma(_821, (*spvDescriptorSet0.fp_c3)._m0[0].x, _811);
    float _829 = -_737;
    float _831 = fma(_753, _823, _829);
    float _833 = 1.0 / _825;
    float _835 = -_739;
    float _837 = fma(_755, _823, _835);
    float _839 = -_761;
    float _841 = _839 + _809;
    float _843 = fma(_831, (*spvDescriptorSet0.fp_c3)._m0[0].x, _737);
    float _845 = fma(_837, (*spvDescriptorSet0.fp_c3)._m0[0].x, _739);
    float _847 = -_805;
    float _849 = _847 + 1.0;
    float _851 = _805 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _853 = _761 * _833;
    float _855 = fma(_767, _841, _761);
    float _857 = _723 * _853;
    float _859 = _727 * _853;
    float _861 = _729 * _853;
    float _863 = _721 * _853;
    float _865 = -_735;
    float _867 = fma(_751, _823, _865);
    float _869 = precise::max(_809, 1.52587890625e-05);
    float _871 = _855 * _815;
    float _873 = fma(_867, (*spvDescriptorSet0.fp_c3)._m0[0].x, _735);
    float _875 = _494 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _877 = 1.0 / _869;
    float _879 = precise::max(_855, 1.52587890625e-05);
    float _881 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _883 = _881 + 1.0;
    float _885 = _871 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _887 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _889 = _887 + 1.0;
    float _891 = exp2(_875);
    float _893 = fma(_849, _889, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _895 = _827 * _877;
    float _897 = 1.0 / _879;
    float _899 = _895 * _893;
    float _901 = fma(_849, _883, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _903 = -_891;
    float _905 = _903 + 1.0;
    float _907 = -_863;
    float _909 = fma(_809, _899, _907);
    float _911 = _901 * _877;
    float _913 = _905 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _915 = fma(_767, _909, _863);
    float _917 = _845 * _911;
    float _919 = _809 * _911;
    float _921 = -_913;
    float _923 = _921 + 1.0;
    float _925 = _915 * _897;
    float _927 = -_861;
    float _929 = fma(_809, _917, _927);
    float _931 = -_859;
    float _933 = fma(_873, _919, _931);
    float _935 = -_857;
    float _937 = fma(_843, _919, _935);
    float _939 = _925 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _941 = abs(_923);
    float _943 = log2(_941);
    float _945 = _925 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _947 = fma(_767, _937, _857);
    float _949 = _939 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _951 = -_885;
    float _953 = _951 + 1.0;
    float _955 = _945 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _957 = fma(_767, _929, _861);
    float _959 = _600 * _949;
    float _961 = _596 * _949;
    float _963 = abs(_953);
    float _965 = log2(_963);
    float _967 = _604 * _949;
    float _969 = fma(_598, _955, _959);
    float _971 = fma(_594, _955, _961);
    float _973 = _913 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _975 = fma(_602, _955, _967);
    float _977 = _969 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _979 = _943 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _981 = _971 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _983 = _943 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _985 = _977 * 0.715200006961822509765625;
    float _987 = _975 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _989 = exp2(_979);
    float _991 = fma(_981, 0.2125999927520751953125, _985);
    float _993 = _965 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _995 = fma(_767, _933, _859);
    float _997 = fma(_987, 0.072200000286102294921875, _991);
    float _999 = exp2(_983);
    float _1001 = exp2(_993);
    float _1003 = _989 * _897;
    float _1005 = -_977;
    float _1007 = _1005 + _997;
    float _1009 = _995 * _1003;
    float _1011 = fma(_851, _1007, _977);
    float _1013 = -_981;
    float _1015 = _1013 + _997;
    float _1017 = -_987;
    float _1019 = _1017 + _997;
    float _1021 = _947 * _1003;
    float _1023 = _999 * _1011;
    float _1025 = fma(_851, _1015, _981);
    float _1027 = fma(_851, _1019, _987);
    float _1029 = _957 * _1003;
    float _1031 = _1023 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1033 = _999 * _1025;
    float _1035 = -_1001;
    float _1037 = spvFAdd(_1035, 1.00010001659393310546875);
    float _1039 = -_1001;
    float _1041 = _1039 + 1.0;
    float _1043 = _999 * _1027;
    float _1045 = fma(_1021, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1031);
    float _1047 = 1.0 / _1037;
    float _1049 = -_885;
    float _1051 = _1049 + _1041;
    float _1053 = _1033 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1055 = _1043 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1057 = fma(_777, _973, _1045);
    float _1059 = _1051 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1061 = fma(_1009, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1053);
    float _1063 = fma(_1029, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1055);
    float _1065 = _785 * _1059;
    float _1067 = fma(_775, _973, _1061);
    float _1069 = _783 * _1059;
    float _1071 = fma(_779, _973, _1063);
    float _1073 = fma(_885, _1057, _1065);
    float _1075 = _787 * _1059;
    float _1077 = fma(_885, _1067, _1069);
    float _1079 = _1047 * _1073;
    float _1081 = fma(_885, _1071, _1075);
    float _1083 = _1047 * _1077;
    float _1085 = _1079 * 0.715200006961822509765625;
    float _1087 = _1047 * _1081;
    float _1089 = fma(_1083, 0.2125999927520751953125, _1085);
    float _1091 = fma(_1087, 0.072200000286102294921875, _1089);
    float _1093 = 1.0 / _1091;
    float _1095 = _1093 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1097 = precise::clamp(_1095, 0.0, 1.0);
    float _1099 = fma(_1097, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1101 = _1099 * _797;
    float _1103 = fma(_1079, _1101, _793);
    float _1105 = fma(_1083, _1101, _791);
    float _1107 = fma(_1087, _1101, _795);
    out.m_54.x = _1105;
    out.m_54.y = _1103;
    out.m_54.z = _1107;
    out.m_54.w = _1041;
    return out;
}

