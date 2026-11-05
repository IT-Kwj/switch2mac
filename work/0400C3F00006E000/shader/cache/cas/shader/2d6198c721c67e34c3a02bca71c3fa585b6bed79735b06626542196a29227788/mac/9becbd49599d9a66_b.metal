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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    sampler fp_t_tcb_12Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _50(thread const int& _3746, thread const int& _3747, thread const int& _3748, thread const int& _3749, thread const int& _3750, thread int& _3751, thread int& _3752, thread int& _3753, thread int& _3754, thread int& _3755, thread int& _3756, thread int& _3757)
{
    float _3760 = as_type<float>(_3749) + 0.0;
    bool _3762 = _3760 != 0.0;
    bool _3764 = isnan(_3760);
    bool _3766 = _3762 || _3764;
    bool _3768 = isnan(0.0);
    bool _3770 = _3766 || _3768;
    int _3772 = as_type<int>(_3760);
    int _3774 = 0;
    int _3776 = _3746;
    int _3778 = _3747;
    int _3780 = _3770 ? (-1) : 0;
    if (!_3770)
    {
        float _3782 = as_type<float>(_3749) * 1.0;
        _3772 = as_type<int>(_3782);
    }
    int _3784 = _3772;
    bool _3786 = !_3770;
    int _3788 = _3784;
    if (!_3786)
    {
        float _3790 = as_type<float>(_3749) + 0.0;
        bool _3792 = _3790 >= 0.0;
        bool _3794 = isnan(_3790);
        bool _3796 = _3792 || _3794;
        bool _3798 = isnan(0.0);
        bool _3800 = _3796 || _3798;
        int _3802 = as_type<int>(_3790);
        _3780 = _3800 ? (-1) : 0;
        if (!_3800)
        {
            _3802 = 2147483647;
        }
        int _3804 = _3802;
        bool _3806 = !_3800;
        _3788 = _3804;
        if (!_3806)
        {
            float _3808 = abs(as_type<float>(_3749));
            float _3810 = _3808 + 0.0;
            bool _3812 = _3810 > as_type<float>(0x7f800000u /* inf */);
            bool _3814 = isnan(_3810);
            bool _3816 = _3812 || _3814;
            bool _3818 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3820 = _3816 || _3818;
            int _3822 = as_type<int>(_3810);
            _3774 = 2139095040;
            _3780 = _3820 ? (-1) : 0;
            if (_3820)
            {
                float _3824 = as_type<float>(_3749) + 1.0;
                _3822 = as_type<int>(_3824);
            }
            int _3826 = _3822;
            _3788 = _3826;
            if (!_3820)
            {
                float _3828 = abs(as_type<float>(_3749));
                float _3830 = _3828 + (-0.0);
                float _3832 = 0.0 + _3830;
                bool _3834 = _3832 != as_type<float>(0x7f800000u /* inf */);
                bool _3836 = isnan(_3832);
                bool _3838 = _3834 || _3836;
                bool _3840 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3842 = _3838 || _3840;
                int _3844 = as_type<int>(_3832);
                _3780 = _3842 ? (-1) : 0;
                if (!_3842)
                {
                    _3844 = _3749;
                }
                int _3846 = _3844;
                bool _3848 = !_3842;
                _3788 = _3846;
                if (!_3848)
                {
                    float _3850 = as_type<float>(_3749) * 18446744073709551616.0;
                    float _3852 = rsqrt(_3850);
                    float _3854 = _3850 * _3852;
                    float _3856 = _3852 * 0.5;
                    float _3858 = -_3854;
                    float _3860 = 0.0 + _3858;
                    float _3862 = fma(_3856, _3860, 0.5);
                    float _3864 = fma(_3854, _3862, _3854);
                    float _3866 = -_3864;
                    float _3868 = 0.0 + _3866;
                    float _3870 = fma(_3864, _3868, _3850);
                    float _3872 = fma(_3856, _3870, _3864);
                    float _3874 = _3872 * 2.3283064365386962890625e-10;
                    _3788 = as_type<int>(_3874);
                    _3774 = as_type<int>(_3850);
                    _3776 = as_type<int>(_3870);
                    _3778 = as_type<int>(_3864);
                }
            }
        }
    }
    int _3876 = _3788;
    int _3878 = _3774;
    int _3880 = _3776;
    int _3882 = _3778;
    int _3884 = _3780;
    _3751 = _3876;
    _3752 = _3878;
    _3753 = _3880;
    _3754 = _3882;
    _3755 = _3750;
    _3756 = 0;
    _3757 = _3884;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _733 = false;
    bool _270 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_39.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_39.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_39.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    int _74 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _78 = _74 != 0;
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _82 = _80 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _98 = _96 != 0;
    int _100 = int(_78);
    float _102 = 1.0 / _54;
    float _104 = _102 * _60;
    float _106 = _102 * _66;
    float _108 = _102 * _72;
    float _110 = _104 * _104;
    float _112 = fma(_106, _106, _110);
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _116 = fma(_108, _108, _112);
    float _118 = precise::max(0.0, _114);
    float _120 = rsqrt(_116);
    float _122 = _106 * _120;
    float _124 = _108 * _120;
    float _126 = _104 * _120;
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _130 = _124 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _132 = -_126;
    float _134 = -_118;
    float _136 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].z, _134);
    float _138 = _128 * _128;
    float _140 = _130 * _130;
    float _142 = _138 + _140;
    float _144 = sqrt(_142);
    bool _146 = _144 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _148 = _118;
    float _150 = _136;
    float _152 = _140;
    float _154 = _128;
    float _156 = _130;
    if (!_146)
    {
        _148 = _138;
    }
    float _158 = _148;
    bool _160 = !_146;
    float _162 = _158;
    if (!_160)
    {
        float _164 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _166 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _168 = _144 + _166;
        float _170 = _136 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _172 = rsqrt(_142);
        float _174 = _168 * _164;
        float _176 = _174 * 0.15915493667125701904296875;
        float _178 = _176 * 6.283185482025146484375;
        float _180 = sin(_178);
        float _182 = _176 * 6.283185482025146484375;
        float _184 = cos(_182);
        float _186 = fma(_180, _170, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _188 = _172 * _186;
        float _190 = _184 + (-1.0);
        float _192 = _128 * _188;
        float _194 = _130 * _188;
        float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _198 = _194 * _194;
        float _200 = fma(_136, _184, _196);
        float _202 = _192 * _192;
        _150 = _200;
        _162 = _202;
        _152 = _198;
        _154 = _192;
        _156 = _194;
    }
    float _204 = _150;
    float _206 = _162;
    float _208 = _152;
    float _210 = _154;
    float _212 = _156;
    float _214 = fma(_204, _204, _206);
    float _216 = _214 + _208;
    float _218 = rsqrt(_216);
    float _220 = _218 * _204;
    float _222 = -_220;
    float _224 = precise::max(0.0, _222);
    float _226 = abs(_224);
    float _228 = -_226;
    float _230 = _228 + 1.0;
    float _232 = fma(_224, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _234 = as_type<int>(_230) + (-218103808);
    float _236 = fma(_224, _232, -0.212114393711090087890625);
    bool _238 = uint(_234) >= 1920991232u;
    float _240 = fma(_224, _236, 1.570728778839111328125);
    bool _242 = !_238;
    float _268;
    if (!_242)
    {
        int _244 = 0;
        int _246 = 0;
        int _248 = 0;
        int _250 = as_type<int>(_230);
        int _252 = 1184;
        int _254;
        int _256;
        int _258;
        int _260;
        int _262;
        int _264;
        int _266;
        _50(_244, _246, _248, _250, _252, _254, _256, _258, _260, _262, _264, _266);
        _268 = as_type<float>(_254);
        _270 = true;
    }
    else
    {
        float _272 = rsqrt(_230);
        float _274 = _230 * _272;
        float _276 = _272 * 0.5;
        float _278 = -_274;
        float _280 = 0.0 + _278;
        float _282 = fma(_276, _280, 0.5);
        float _284 = fma(_274, _282, _274);
        float _286 = -_284;
        float _288 = 0.0 + _286;
        float _290 = fma(_284, _288, _230);
        float _292 = fma(_276, _290, _284);
        _268 = _292;
    }
    _270 = false;
    float _294 = _268;
    bool _296 = _220 > 0.0;
    float _298 = _124 * _124;
    float _300 = _122 * _122;
    float _302 = _298 + _300;
    if (_296)
    {
        discard_fragment();
    }
    float _304 = rsqrt(_302);
    float _306 = _240 * _294;
    float _308 = _306 * 0.636619746685028076171875;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = -_310;
    float _314 = _312 + 1.0;
    float _316 = sqrt(_314);
    float _318 = _124 * _304;
    float _320 = _122 * _304;
    float _322 = abs(_318);
    float _324 = abs(_320);
    float _326 = precise::max(_322, _324);
    float _328 = precise::max(_326, 9.9999997473787516355514526367188e-05);
    float _330 = -_316;
    float _332 = _330 + 1.0;
    float _334 = 1.0 / _328;
    float _336 = _332 * 0.5;
    float _338 = -_334;
    float _340 = _318 * _338;
    float _342 = _320 * _334;
    float _344 = fma(_340, _336, 0.5);
    float _346 = fma(_342, _336, 0.5);
    if (_296)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return out;
    }
    float2 _1898;
    _1898.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_344, _346));
    _1898.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_344, _346));
    float _348 = _1898.x;
    float _350 = _348 * 256.0;
    int _352 = int(_350);
    float _354 = -_126;
    float _356 = _354 + 1.0;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = -_126;
    float _362 = fma(_360, _126, 1.0);
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _122 * _126;
    int _368 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _370 = _368 != 0;
    float _372 = -_124;
    float _374 = _126 * _372;
    float _376 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _380 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _382 = _126 * _124;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _390 = fma(_126, _384, _376);
    float _392 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _394 = _358;
    int _396 = as_type<int>(_380);
    if (_370)
    {
        float _398 = sqrt(_364);
        _394 = _398;
    }
    float _400 = _394;
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _404 = -_124;
    float _406 = fma(_404, _386, _390);
    float _408 = fma(_126, _392, _378);
    float _410 = fma(_124, _386, _390);
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _414 = fma(_126, _402, _380);
    float _416 = -_124;
    float _418 = fma(_416, _388, _408);
    float _420 = fma(_124, _388, _408);
    float _422 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _424 = -_124;
    float _426 = fma(_424, _412, _414);
    float _428 = fma(_124, _412, _414);
    float _430 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _432 = -_122;
    float _434 = fma(_432, _422, _406);
    float _436 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _438 = abs(_400);
    float _440 = log2(_438);
    float _442 = -_122;
    float _444 = fma(_442, _430, _418);
    float _446 = fma(_122, _430, _420);
    float _448 = -_122;
    float _450 = fma(_448, _436, _426);
    float _452 = -_126;
    float _454 = _122 * _452;
    float _456 = fma(_122, _422, _410);
    float _458 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _460 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _462 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _464 = fma(_122, _436, _428);
    float _466 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _468 = fma(_458, _454, _444);
    float _470 = fma(_458, _366, _446);
    float _472 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _474 = fma(_466, _454, _434);
    float _476 = fma(_466, _366, _456);
    float _478 = _440 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = fma(_460, _454, _450);
    float _482 = fma(_460, _366, _464);
    float _484 = fma(_462, _374, _474);
    float _486 = fma(_462, _382, _476);
    float _488 = exp2(_478);
    float _490 = fma(_472, _374, _468);
    float _492 = _218 * _210;
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _496 = fma(_472, _382, _470);
    float _498 = _218 * _212;
    float _500 = _122 * _124;
    float _502 = fma(_494, _382, _482);
    float _504 = fma(_494, _374, _480);
    float _506 = in.m_44.x;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = _488 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _514 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _516 = precise::clamp(_514, 0.0, 1.0);
    float _518 = _492 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _520 = in.m_44.y;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = -_516;
    float _528 = _526 + 1.0;
    float _530 = -_518;
    float _532 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[11].y, _530);
    float _534 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _536 = -_498;
    float _538 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[11].z, _532);
    float _540 = abs(_528);
    float _542 = log2(_540);
    float _544 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _546 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _548 = fma(_534, _500, _484);
    float _550 = fma(_534, _500, _486);
    float _552 = fma(_544, _500, _490);
    float _554 = fma(_544, _500, _496);
    float _556 = fma(_546, _500, _504);
    float _558 = fma(_546, _500, _502);
    float _560 = fma(_538, -0.5, 0.5);
    float _562 = fma(_538, 0.5, 0.5);
    float _564 = _124 * (-3.0);
    float _566 = sqrt(_560);
    float _568 = fma(_562, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _570 = _102 * _510;
    float _572 = _542 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _574 = fma(_298, 3.0, -1.0);
    float _576 = fma(_562, _568, -0.212114393711090087890625);
    float _578 = -_124;
    float _580 = fma(_578, _564, -1.0);
    float _582 = exp2(_572);
    float _584 = _102 * _524;
    float _586 = fma(_562, _576, 1.570728778839111328125);
    float _588 = _220 + 1.0;
    float _590 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _592 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _594 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _596 = _566 * 0.636619746685028076171875;
    float _598 = fma(_590, _580, _548);
    float _600 = fma(_592, _580, _552);
    float _602 = fma(_594, _580, _556);
    float _604 = fma(_592, _574, _554);
    float _606 = fma(_594, _574, _558);
    float _608 = -_586;
    float _610 = fma(_596, _608, 1.0);
    float _612 = fma(_220, -0.5, 0.5);
    float _614 = -_220;
    float _616 = fma(_582, _588, _614);
    float _618 = fma(_590, _574, _550);
    float _620 = fma(_616, 0.5, 0.5);
    float _622 = float(uint(_352));
    float _624 = _622 * 0.00390625;
    float2 _2339 = float2(_344, _346);
    float2 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2339, float2(0.0), isnan(_2339)), level(_624)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2339, float2(0.0), isnan(_2339)), level(_624)).xy;
    float _630 = _628.x;
    float _632 = _628.y;
    float2 _2354 = float2(_570, _584);
    float3 _636 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2354, float2(0.0), isnan(_2354))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2354, float2(0.0), isnan(_2354))).xyz;
    float _638 = _636.x;
    float _640 = _636.y;
    float _642 = _636.z;
    float2 _2368 = float2(_610, _612);
    float3 _644 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2368, float2(0.0), isnan(_2368))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2368, float2(0.0), isnan(_2368))).xyz;
    float _646 = _644.x;
    float _648 = _644.y;
    float _650 = _644.z;
    float2 _2382 = float2(_610, _620);
    float3 _652 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2382, float2(0.0), isnan(_2382))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2382, float2(0.0), isnan(_2382))).xyz;
    float _654 = _652.x;
    float _656 = _652.y;
    float _658 = _652.z;
    float2 _2396 = float2(_344, _346);
    float4 _661 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2396, float2(0.0), isnan(_2396)), level(_624)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2396, float2(0.0), isnan(_2396)), level(_624)).xyzw;
    float _663 = _661.x;
    float _665 = _661.y;
    float _667 = _661.z;
    float _669 = _661.w;
    float _671 = -_126;
    float _673 = fma(_671, _126, _300);
    int _675 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _677 = _675 != 0;
    float _679 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _681 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _683 = fma(_679, _673, _598);
    float _685 = fma(_679, _673, _618);
    float _687 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _689 = fma(_681, _673, _600);
    float _691 = fma(_681, _673, _604);
    float _693 = fma(_687, _673, _602);
    float _695 = fma(_687, _673, _606);
    float _697 = -_642;
    float _699 = _697 + 1.0;
    float _701 = _632 * _699;
    float _703 = _701 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _705 = !_677;
    int _707 = _677 ? (-1) : 0;
    int _721;
    int _723;
    int _725;
    int _727;
    int _729;
    int _731;
    if (!_705)
    {
        float _709 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _711 = _434 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _713 = _444 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _715 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _717 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _719 = _464 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _721 = as_type<int>(_717);
        _723 = as_type<int>(_719);
        _725 = as_type<int>(_711);
        _727 = as_type<int>(_713);
        _729 = as_type<int>(_715);
        _731 = as_type<int>(_709);
        _733 = true;
    }
    else
    {
        int _735 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _737 = _735 != 0;
        float _739 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _741 = _693 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _743 = _683 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _745 = _685 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _747 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _749 = _695 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _751 = as_type<int>(_739);
        int _753 = as_type<int>(_741);
        int _755 = as_type<int>(_743);
        _707 = _737 ? (-1) : 0;
        _723 = as_type<int>(_749);
        if (_737)
        {
            float _757 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _751 = as_type<int>(_757);
        }
        int _759 = _751;
        _727 = _759;
        if (_737)
        {
            float _761 = _380 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _753 = as_type<int>(_761);
        }
        int _763 = _753;
        _729 = _763;
        if (_737)
        {
            float _765 = _747 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _755 = as_type<int>(_765);
        }
        int _767 = _755;
        float _769 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _771 = as_type<int>(_769);
        _725 = _767;
        if (!_737)
        {
            _396 = as_type<int>(_745);
        }
        int _773 = _396;
        int _775 = _773;
        if (_737)
        {
            _771 = _759;
        }
        int _777 = _771;
        _721 = _777;
        if (_737)
        {
            _775 = _767;
        }
        int _779 = _775;
        _731 = _779;
        if (_737)
        {
            _723 = _763;
        }
    }
    _733 = false;
    int _781 = _707;
    int _783 = _721;
    int _785 = _723;
    int _787 = _725;
    int _789 = _727;
    int _791 = _729;
    int _793 = _731;
    float2 _2628 = float2(_570, _584);
    float2 _795 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2628, float2(0.0), isnan(_2628))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2628, float2(0.0), isnan(_2628))).xy;
    float _797 = _795.x;
    float _799 = _795.y;
    int _801 = 0;
    int _803 = _781;
    if (!_94)
    {
        int _805 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _807 = _805 != 0;
        _801 = _807 ? (-1) : 0;
    }
    int _809 = _801;
    if (_94)
    {
        _803 = -1;
    }
    int _811 = _803;
    int _813 = _811;
    if (!_94)
    {
        int _815 = ~_809;
        bool _817 = !_98;
        int _819 = _815 & (_817 ? (-1) : 0);
        _813 = _819;
    }
    int _821 = _813;
    bool _823 = _100 != 0;
    float _825 = fma(_797, 2.0, -1.0);
    float _827 = fma(_799, 2.0, -1.0);
    float _829 = fma(_825, (*spvDescriptorSet0.fp_c3)._m0[22].x, _570);
    float _831 = fma(_827, (*spvDescriptorSet0.fp_c3)._m0[22].y, _584);
    float2 _2692 = float2(_829, _831);
    float4 _833 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2692, float2(0.0), isnan(_2692))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2692, float2(0.0), isnan(_2692))).xyzw;
    float _835 = _833.x;
    float _837 = _833.y;
    float _839 = _833.z;
    float _841 = _833.w;
    float _843 = _542 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    int _845 = _821;
    if (_90)
    {
        _845 = -1;
    }
    int _847 = _845;
    int _849 = ~_821;
    float _851 = (_849 != 0) ? as_type<float>(_783) : 0.0;
    int _853 = _847;
    if (!_90)
    {
        bool _855 = !_98;
        bool _857 = _855 && _86;
        bool _859 = !_823;
        bool _861 = _857 && _859;
        _853 = _861 ? (-1) : 0;
    }
    int _863 = _853;
    float _865 = exp2(_843);
    int _867 = ~_821;
    float _869 = (_867 != 0) ? as_type<float>(_785) : 0.0;
    int _871 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _873 = _871 != 0;
    int _875 = ~_863;
    float _877 = (_875 != 0) ? as_type<float>(_787) : 0.0;
    int _879 = ~_863;
    float _881 = (_879 != 0) ? as_type<float>(_789) : 0.0;
    int _883 = ~_863;
    float _885 = (_883 != 0) ? as_type<float>(_791) : 0.0;
    bool _887 = !_98;
    bool _889 = _86 && _887;
    bool _891 = !_873;
    float _893 = _891 ? _630 : 0.0;
    int _895 = ~_821;
    float _897 = (_895 != 0) ? as_type<float>(_793) : 0.0;
    float _899 = -_865;
    float _901 = _899 + 1.0;
    float _903 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _905 = _901 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _907 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _909 = _907 != 0;
    float _911 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _913 = !_889;
    float _915 = _913 ? _903 : 0.0;
    float _917 = -_905;
    float _919 = _917 + 1.0;
    bool _921 = !_909;
    float _923 = _915 * _897;
    bool _925 = !_889;
    float _927 = _925 ? _911 : 0.0;
    float _929 = abs(_919);
    float _931 = log2(_929);
    bool _933 = !_909;
    float _935 = _915 * _851;
    float _937 = _915 * _869;
    bool _939 = !_909;
    float _941 = fma(_877, _927, _923);
    bool _943 = !_921;
    float _945 = _943 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _947 = fma(_881, _927, _935);
    bool _949 = !_933;
    float _951 = _949 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _953 = fma(_885, _927, _937);
    bool _955 = !_939;
    float _957 = _955 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _959 = _945 * _941;
    float _961 = _669 * _669;
    float _963 = _951 * _947;
    float _965 = _638 * _640;
    float _967 = _957 * _953;
    float _969 = _931 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _971 = _931 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _973 = _961 * _961;
    float _975 = _963 * 0.715200006961822509765625;
    float _977 = exp2(_969);
    int _979 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _981 = _979 != 0;
    float _983 = _973 * 16.0;
    float _985 = fma(_959, 0.2125999927520751953125, _975);
    float _987 = _965 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _989 = _663 * _983;
    float _991 = fma(_967, 0.072200000286102294921875, _985);
    float _993 = exp2(_971);
    bool _995 = !_981;
    float _997 = _665 * _983;
    float _999 = -_959;
    float _1001 = _999 + _991;
    float _1003 = _667 * _983;
    bool _1005 = !_981;
    float _1007 = -_963;
    float _1009 = _1007 + _991;
    bool _1011 = !_981;
    float _1013 = fma(_987, _1001, _959);
    bool _1015 = !_82;
    float _1017 = _1015 ? _977 : 1.0;
    float _1019 = fma(_987, _1009, _963);
    float _1021 = _995 ? _989 : 0.0;
    float _1023 = -_967;
    float _1025 = _1023 + _991;
    float _1027 = _1011 ? _1003 : 0.0;
    float _1029 = _1017 * _893;
    float _1031 = _1017 * _1013;
    bool _1033 = !_82;
    float _1035 = _1033 ? _993 : 1.0;
    float _1037 = fma(_987, _1025, _967);
    float _1039 = _1005 ? _997 : 0.0;
    float _1041 = _1035 * _1021;
    float _1043 = _1035 * _1039;
    float _1045 = _1035 * _1027;
    float _1047 = _86 ? _1029 : _1031;
    float _1049 = _1017 * _1019;
    float _1051 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1053 = _86 ? _1029 : _1049;
    float _1055 = _1029;
    float _1057 = _1041;
    float _1059 = _1037;
    float _1061 = _1043;
    float _1063 = _987;
    if (!_86)
    {
        float _1065 = _1017 * _1037;
        _1055 = _1065;
    }
    float _1067 = _1055;
    float _1069 = fma(_1041, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1051);
    float _1071 = _1067 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1073 = _1053 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1075 = fma(_1045, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1071);
    int _1077 = as_type<int>(_1071);
    float _1079 = _1069;
    float _1081 = _1075;
    if (_82)
    {
        _1077 = as_type<int>(_703);
    }
    int _1083 = _1077;
    float _1085 = fma(_1043, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1073);
    int _1087 = _1083;
    int _1089 = _1083;
    if (_82)
    {
        _1057 = 0.0;
    }
    float _1091 = _1057;
    float _1093 = _1091;
    if (_82)
    {
        _1059 = 0.0;
    }
    float _1095 = _1059;
    float _1097 = _1095;
    if (_82)
    {
        _1061 = 0.0;
    }
    float _1099 = _1061;
    bool _1101 = !_82;
    float _1103 = _1101 ? _905 : 0.0;
    float _1105 = _1099;
    if (_82)
    {
        _1063 = _1085;
    }
    float _1107 = _1063;
    float _1109 = _1107;
    float _1111 = _1107;
    if (!_82)
    {
        int _1113 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1115 = _1113 != 0;
        float _1117 = _656 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1119 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1121 = _1119 != 0;
        float _1123 = _654 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1125 = _658 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1127 = !_1121;
        float _1129 = _1127 ? _1123 : 0.0;
        bool _1131 = !_1121;
        float _1133 = _1131 ? _1117 : 0.0;
        bool _1135 = !_1121;
        float _1137 = _1135 ? _1125 : 0.0;
        float _1139 = _1103 * _1129;
        _1093 = _1139;
        if (!_1115)
        {
            _1087 = as_type<int>(_703);
        }
        int _1141 = _1087;
        float _1143 = _1103 * _1133;
        float _1145 = _1103 * _1137;
        _1097 = _1143;
        _1089 = _1141;
        _1105 = _1145;
        if (!_1115)
        {
            _1109 = _1085;
        }
        float _1147 = _1109;
        bool _1149 = !_1115;
        _1111 = _1147;
        if (!_1149)
        {
            float _1151 = -_1103;
            float _1153 = _1151 + 1.0;
            float _1155 = precise::clamp(_1153, 0.0, 1.0);
            float _1157 = _703 * _1155;
            float _1159 = precise::max(_1157, 9.9999997473787516355514526367188e-05);
            float _1161 = 1.0 / _1159;
            float _1163 = _703 * _1161;
            float _1165 = _1069 * _1163;
            float _1167 = _1085 * _1163;
            float _1169 = _1075 * _1163;
            _1111 = _1167;
            _1097 = 0.0;
            _1079 = _1165;
            _1093 = 0.0;
            _1089 = as_type<int>(_1157);
            _1081 = _1169;
            _1105 = 0.0;
        }
    }
    float _1171 = _1111;
    float _1173 = _1097;
    float _1175 = _1079;
    float _1177 = _1093;
    int _1179 = _1089;
    float _1181 = _1081;
    float _1183 = _1105;
    int _1185 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1187 = _1185 != 0;
    int _1189 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1191 = _1189 != 0;
    float _1193 = _648 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1195 = _1171 + _1173;
    float _1197 = _646 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1199 = _1175 + _1177;
    bool _1201 = !_1191;
    float _1203 = _1201 ? as_type<float>(_1179) : 1.0;
    float _1205 = _650 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1207 = _1181 + _1183;
    float _1209 = -_1203;
    float _1211 = _1209 + 1.0;
    float _1213 = abs(_1211);
    float _1215 = log2(_1213);
    float _1217 = _1215 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1219 = exp2(_1217);
    float _1221 = -_1219;
    float _1223 = spvFAdd(_1221, 1.00010001659393310546875);
    float _1225 = -_1219;
    float _1227 = _1225 + 1.0;
    float _1229 = -_1203;
    float _1231 = _1229 + _1227;
    float _1233 = 1.0 / _1223;
    float _1235 = _1231 * _1193;
    float _1237 = _1231 * _1197;
    float _1239 = _1231 * _1205;
    float _1241 = fma(_1195, _1203, _1235);
    float _1243 = fma(_1199, _1203, _1237);
    float _1245 = fma(_1207, _1203, _1239);
    float _1247 = _1233 * _1241;
    float _1249 = _1233 * _1243;
    float _1251 = _1233 * _1245;
    float _1253 = _1247 * 0.715200006961822509765625;
    float _1255 = fma(_1249, 0.2125999927520751953125, _1253);
    float _1257 = fma(_1251, 0.072200000286102294921875, _1255);
    float _1259 = 1.0 / _1257;
    float _1261 = _1259 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1263 = precise::clamp(_1261, 0.0, 1.0);
    float _1265 = fma(_1263, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1267 = _1265 * _841;
    float _1269 = fma(_1249, _1267, _835);
    float _1271 = fma(_1247, _1267, _837);
    float _1273 = fma(_1251, _1267, _839);
    bool _1275 = !_1187;
    float _1277 = _1271;
    float _1279 = _1259;
    float _1281 = _1251;
    int _1283 = as_type<int>(_1247);
    int _1285 = as_type<int>(_1259);
    int _1287 = as_type<int>(_1251);
    float _1289 = _1271;
    if (!_1275)
    {
        bool _1291 = _1227 != 1.0;
        bool _1293 = isnan(_1227);
        bool _1295 = _1291 || _1293;
        bool _1297 = isnan(1.0);
        bool _1299 = _1295 || _1297;
        float _1301 = -_1219;
        bool _1303 = _1301 != (-1.0);
        bool _1305 = isnan(_1301);
        bool _1307 = _1303 || _1305;
        bool _1309 = isnan(-1.0);
        bool _1311 = _1307 || _1309;
        float _1313 = -_1219;
        bool _1315 = _1313 == (-1.0);
        bool _1317 = !_1299;
        bool _1319 = _1315 || _1317;
        bool _1321 = _1227 == 1.0;
        bool _1323 = _1321 && _1311;
        bool _1325 = !_1319;
        float _1327 = _1325 ? _1227 : 0.0;
        bool _1329 = !_1323;
        float _1331 = _1329 ? 0.0 : 1.0;
        float _1333 = _1319 ? 0.0 : 0.5;
        float _1335 = _1327 * 0.715200006961822509765625;
        float _1337 = fma(_1331, 0.2125999927520751953125, _1335);
        float _1339 = fma(_1333, 0.072200000286102294921875, _1337);
        float _1341 = 1.0 / _1339;
        float _1343 = _1341 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1345 = precise::clamp(_1343, 0.0, 1.0);
        float _1347 = fma(_1345, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1349 = _1331 * _1347;
        float _1351 = _1327 * _1347;
        float _1353 = _1333 * _1347;
        out.m_42.x = _1349;
        out.m_42.y = _1351;
        out.m_42.z = _1353;
        out.m_42.w = 1.0;
        return out;
    }
    bool _1355 = _100 != 0;
    bool _1357 = !_1355;
    if (!_1357)
    {
        if (_90)
        {
            _1277 = 0.0;
        }
        float _1359 = _1277;
        float _1361 = _1359;
        if (_90)
        {
            _1279 = 0.0;
        }
        float _1363 = _1279;
        float _1365 = _1363;
        if (!_90)
        {
            float _1367 = _881 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1365 = _1367;
        }
        float _1369 = _1365;
        float _1371 = _1369;
        if (!_90)
        {
            float _1373 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1361 = _1373;
        }
        float _1375 = _1361;
        float _1377 = _1375;
        if (!_94)
        {
            float _1379 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1369);
            _1371 = _1379;
        }
        float _1381 = _1371;
        if (_90)
        {
            _1281 = 0.0;
        }
        float _1383 = _1281;
        float _1385 = _1383;
        if (!_90)
        {
            float _1387 = _885 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1385 = _1387;
        }
        float _1389 = _1385;
        float _1391 = _1381 * 0.715200006961822509765625;
        float _1393 = _1389;
        if (!_94)
        {
            float _1395 = fma(_897, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1375);
            _1377 = _1395;
        }
        float _1397 = _1377;
        if (!_94)
        {
            float _1399 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1389);
            _1393 = _1399;
        }
        float _1401 = _1393;
        float _1403 = fma(_1397, 0.2125999927520751953125, _1391);
        float _1405 = fma(_1401, 0.072200000286102294921875, _1403);
        float _1407 = 1.0 / _1405;
        float _1409 = _1407 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1411 = precise::clamp(_1409, 0.0, 1.0);
        float _1413 = fma(_1411, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1415 = _1413 * _1397;
        float _1417 = _1413 * _1381;
        float _1419 = _1413 * _1401;
        out.m_42.x = _1415;
        out.m_42.y = _1417;
        out.m_42.z = _1419;
        out.m_42.w = 1.0;
        return out;
    }
    if (!_98)
    {
        _1283 = as_type<int>(_1269);
    }
    int _1421 = _1283;
    if (!_98)
    {
        _1285 = as_type<int>(_1273);
    }
    int _1423 = _1285;
    float _1425 = as_type<float>(_1423);
    if (!_98)
    {
        _1287 = as_type<int>(_1227);
    }
    int _1427 = _1287;
    float _1429 = as_type<float>(_1427);
    if (!_98)
    {
        out.m_42.x = as_type<float>(_1421);
        out.m_42.y = _1271;
        out.m_42.z = as_type<float>(_1423);
        out.m_42.w = as_type<float>(_1427);
        return out;
    }
    if (_90)
    {
        _1289 = 0.0;
    }
    float _1431 = _1289;
    float _1433 = _1431;
    if (_90)
    {
        _1425 = 0.0;
    }
    float _1435 = _1425;
    float _1437 = _1435;
    if (!_90)
    {
        float _1439 = _881 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = _1441;
    if (!_90)
    {
        float _1445 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1433 = _1445;
    }
    float _1447 = _1433;
    float _1449 = _1447;
    if (!_94)
    {
        float _1451 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1441);
        _1443 = _1451;
    }
    float _1453 = _1443;
    if (_90)
    {
        _1429 = 0.0;
    }
    float _1455 = _1429;
    float _1457 = _1455;
    if (!_90)
    {
        float _1459 = _885 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1457 = _1459;
    }
    float _1461 = _1457;
    float _1463 = _1453 * 0.715200006961822509765625;
    float _1465 = _1461;
    if (!_94)
    {
        float _1467 = fma(_897, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1447);
        _1449 = _1467;
    }
    float _1469 = _1449;
    if (!_94)
    {
        float _1471 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1461);
        _1465 = _1471;
    }
    float _1473 = _1465;
    float _1475 = fma(_1469, 0.2125999927520751953125, _1463);
    float _1477 = fma(_1473, 0.072200000286102294921875, _1475);
    float _1479 = 1.0 / _1477;
    float _1481 = _1479 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = fma(_1483, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1487 = _1485 * _1469;
    float _1489 = _1485 * _1453;
    float _1491 = _1485 * _1473;
    out.m_42.x = _1487;
    out.m_42.y = _1489;
    out.m_42.z = _1491;
    out.m_42.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _733 = false;
    bool _270 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_39.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_39.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_39.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    int _74 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _78 = _74 != 0;
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _82 = _80 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _98 = _96 != 0;
    int _100 = int(_78);
    float _102 = 1.0 / _54;
    float _104 = _102 * _60;
    float _106 = _102 * _66;
    float _108 = _102 * _72;
    float _110 = _104 * _104;
    float _112 = fma(_106, _106, _110);
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _116 = fma(_108, _108, _112);
    float _118 = precise::max(0.0, _114);
    float _120 = rsqrt(_116);
    float _122 = _106 * _120;
    float _124 = _108 * _120;
    float _126 = _104 * _120;
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _130 = _124 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _132 = -_126;
    float _134 = -_118;
    float _136 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].z, _134);
    float _138 = _128 * _128;
    float _140 = _130 * _130;
    float _142 = _138 + _140;
    float _144 = sqrt(_142);
    bool _146 = _144 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _148 = _118;
    float _150 = _136;
    float _152 = _140;
    float _154 = _128;
    float _156 = _130;
    if (!_146)
    {
        _148 = _138;
    }
    float _158 = _148;
    bool _160 = !_146;
    float _162 = _158;
    if (!_160)
    {
        float _164 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _166 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _168 = _144 + _166;
        float _170 = _136 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _172 = rsqrt(_142);
        float _174 = _168 * _164;
        float _176 = _174 * 0.15915493667125701904296875;
        float _178 = _176 * 6.283185482025146484375;
        float _180 = sin(_178);
        float _182 = _176 * 6.283185482025146484375;
        float _184 = cos(_182);
        float _186 = fma(_180, _170, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _188 = _172 * _186;
        float _190 = _184 + (-1.0);
        float _192 = _128 * _188;
        float _194 = _130 * _188;
        float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _198 = _194 * _194;
        float _200 = fma(_136, _184, _196);
        float _202 = _192 * _192;
        _150 = _200;
        _162 = _202;
        _152 = _198;
        _154 = _192;
        _156 = _194;
    }
    float _204 = _150;
    float _206 = _162;
    float _208 = _152;
    float _210 = _154;
    float _212 = _156;
    float _214 = fma(_204, _204, _206);
    float _216 = _214 + _208;
    float _218 = rsqrt(_216);
    float _220 = _218 * _204;
    float _222 = -_220;
    float _224 = precise::max(0.0, _222);
    float _226 = abs(_224);
    float _228 = -_226;
    float _230 = _228 + 1.0;
    float _232 = fma(_224, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _234 = as_type<int>(_230) + (-218103808);
    float _236 = fma(_224, _232, -0.212114393711090087890625);
    bool _238 = uint(_234) >= 1920991232u;
    float _240 = fma(_224, _236, 1.570728778839111328125);
    bool _242 = !_238;
    float _268;
    if (!_242)
    {
        int _244 = 0;
        int _246 = 0;
        int _248 = 0;
        int _250 = as_type<int>(_230);
        int _252 = 1184;
        int _254;
        int _256;
        int _258;
        int _260;
        int _262;
        int _264;
        int _266;
        _50(_244, _246, _248, _250, _252, _254, _256, _258, _260, _262, _264, _266);
        _268 = as_type<float>(_254);
        _270 = true;
    }
    else
    {
        float _272 = rsqrt(_230);
        float _274 = _230 * _272;
        float _276 = _272 * 0.5;
        float _278 = -_274;
        float _280 = 0.0 + _278;
        float _282 = fma(_276, _280, 0.5);
        float _284 = fma(_274, _282, _274);
        float _286 = -_284;
        float _288 = 0.0 + _286;
        float _290 = fma(_284, _288, _230);
        float _292 = fma(_276, _290, _284);
        _268 = _292;
    }
    _270 = false;
    float _294 = _268;
    bool _296 = _220 > 0.0;
    float _298 = _124 * _124;
    float _300 = _122 * _122;
    float _302 = _298 + _300;
    if (_296)
    {
        discard_fragment();
    }
    float _304 = rsqrt(_302);
    float _306 = _240 * _294;
    float _308 = _306 * 0.636619746685028076171875;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = -_310;
    float _314 = _312 + 1.0;
    float _316 = sqrt(_314);
    float _318 = _124 * _304;
    float _320 = _122 * _304;
    float _322 = abs(_318);
    float _324 = abs(_320);
    float _326 = precise::max(_322, _324);
    float _328 = precise::max(_326, 9.9999997473787516355514526367188e-05);
    float _330 = -_316;
    float _332 = _330 + 1.0;
    float _334 = 1.0 / _328;
    float _336 = _332 * 0.5;
    float _338 = -_334;
    float _340 = _318 * _338;
    float _342 = _320 * _334;
    float _344 = fma(_340, _336, 0.5);
    float _346 = fma(_342, _336, 0.5);
    if (_296)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    float2 _1898;
    _1898.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_344, _346));
    _1898.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_344, _346));
    float _348 = _1898.x;
    float _350 = _348 * 256.0;
    int _352 = int(_350);
    float _354 = -_126;
    float _356 = _354 + 1.0;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = -_126;
    float _362 = fma(_360, _126, 1.0);
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _122 * _126;
    int _368 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _370 = _368 != 0;
    float _372 = -_124;
    float _374 = _126 * _372;
    float _376 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _380 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _382 = _126 * _124;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _390 = fma(_126, _384, _376);
    float _392 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _394 = _358;
    int _396 = as_type<int>(_380);
    if (_370)
    {
        float _398 = sqrt(_364);
        _394 = _398;
    }
    float _400 = _394;
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _404 = -_124;
    float _406 = fma(_404, _386, _390);
    float _408 = fma(_126, _392, _378);
    float _410 = fma(_124, _386, _390);
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _414 = fma(_126, _402, _380);
    float _416 = -_124;
    float _418 = fma(_416, _388, _408);
    float _420 = fma(_124, _388, _408);
    float _422 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _424 = -_124;
    float _426 = fma(_424, _412, _414);
    float _428 = fma(_124, _412, _414);
    float _430 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _432 = -_122;
    float _434 = fma(_432, _422, _406);
    float _436 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _438 = abs(_400);
    float _440 = log2(_438);
    float _442 = -_122;
    float _444 = fma(_442, _430, _418);
    float _446 = fma(_122, _430, _420);
    float _448 = -_122;
    float _450 = fma(_448, _436, _426);
    float _452 = -_126;
    float _454 = _122 * _452;
    float _456 = fma(_122, _422, _410);
    float _458 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _460 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _462 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _464 = fma(_122, _436, _428);
    float _466 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _468 = fma(_458, _454, _444);
    float _470 = fma(_458, _366, _446);
    float _472 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _474 = fma(_466, _454, _434);
    float _476 = fma(_466, _366, _456);
    float _478 = _440 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = fma(_460, _454, _450);
    float _482 = fma(_460, _366, _464);
    float _484 = fma(_462, _374, _474);
    float _486 = fma(_462, _382, _476);
    float _488 = exp2(_478);
    float _490 = fma(_472, _374, _468);
    float _492 = _218 * _210;
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _496 = fma(_472, _382, _470);
    float _498 = _218 * _212;
    float _500 = _122 * _124;
    float _502 = fma(_494, _382, _482);
    float _504 = fma(_494, _374, _480);
    float _506 = in.m_44.x;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = _488 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _514 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _516 = precise::clamp(_514, 0.0, 1.0);
    float _518 = _492 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _520 = in.m_44.y;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = -_516;
    float _528 = _526 + 1.0;
    float _530 = -_518;
    float _532 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[11].y, _530);
    float _534 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _536 = -_498;
    float _538 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[11].z, _532);
    float _540 = abs(_528);
    float _542 = log2(_540);
    float _544 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _546 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _548 = fma(_534, _500, _484);
    float _550 = fma(_534, _500, _486);
    float _552 = fma(_544, _500, _490);
    float _554 = fma(_544, _500, _496);
    float _556 = fma(_546, _500, _504);
    float _558 = fma(_546, _500, _502);
    float _560 = fma(_538, -0.5, 0.5);
    float _562 = fma(_538, 0.5, 0.5);
    float _564 = _124 * (-3.0);
    float _566 = sqrt(_560);
    float _568 = fma(_562, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _570 = _102 * _510;
    float _572 = _542 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _574 = fma(_298, 3.0, -1.0);
    float _576 = fma(_562, _568, -0.212114393711090087890625);
    float _578 = -_124;
    float _580 = fma(_578, _564, -1.0);
    float _582 = exp2(_572);
    float _584 = _102 * _524;
    float _586 = fma(_562, _576, 1.570728778839111328125);
    float _588 = _220 + 1.0;
    float _590 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _592 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _594 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _596 = _566 * 0.636619746685028076171875;
    float _598 = fma(_590, _580, _548);
    float _600 = fma(_592, _580, _552);
    float _602 = fma(_594, _580, _556);
    float _604 = fma(_592, _574, _554);
    float _606 = fma(_594, _574, _558);
    float _608 = -_586;
    float _610 = fma(_596, _608, 1.0);
    float _612 = fma(_220, -0.5, 0.5);
    float _614 = -_220;
    float _616 = fma(_582, _588, _614);
    float _618 = fma(_590, _574, _550);
    float _620 = fma(_616, 0.5, 0.5);
    float _622 = float(uint(_352));
    float _624 = _622 * 0.00390625;
    float2 _2339 = float2(_344, _346);
    float2 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2339, float2(0.0), isnan(_2339)), level(_624)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2339, float2(0.0), isnan(_2339)), level(_624)).xy;
    float _630 = _628.x;
    float _632 = _628.y;
    float2 _2354 = float2(_570, _584);
    float3 _636 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2354, float2(0.0), isnan(_2354))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2354, float2(0.0), isnan(_2354))).xyz;
    float _638 = _636.x;
    float _640 = _636.y;
    float _642 = _636.z;
    float2 _2368 = float2(_610, _612);
    float3 _644 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2368, float2(0.0), isnan(_2368))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2368, float2(0.0), isnan(_2368))).xyz;
    float _646 = _644.x;
    float _648 = _644.y;
    float _650 = _644.z;
    float2 _2382 = float2(_610, _620);
    float3 _652 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2382, float2(0.0), isnan(_2382))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2382, float2(0.0), isnan(_2382))).xyz;
    float _654 = _652.x;
    float _656 = _652.y;
    float _658 = _652.z;
    float2 _2396 = float2(_344, _346);
    float4 _661 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2396, float2(0.0), isnan(_2396)), level(_624)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2396, float2(0.0), isnan(_2396)), level(_624)).xyzw;
    float _663 = _661.x;
    float _665 = _661.y;
    float _667 = _661.z;
    float _669 = _661.w;
    float _671 = -_126;
    float _673 = fma(_671, _126, _300);
    int _675 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _677 = _675 != 0;
    float _679 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _681 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _683 = fma(_679, _673, _598);
    float _685 = fma(_679, _673, _618);
    float _687 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _689 = fma(_681, _673, _600);
    float _691 = fma(_681, _673, _604);
    float _693 = fma(_687, _673, _602);
    float _695 = fma(_687, _673, _606);
    float _697 = -_642;
    float _699 = _697 + 1.0;
    float _701 = _632 * _699;
    float _703 = _701 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _705 = !_677;
    int _707 = _677 ? (-1) : 0;
    int _721;
    int _723;
    int _725;
    int _727;
    int _729;
    int _731;
    if (!_705)
    {
        float _709 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _711 = _434 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _713 = _444 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _715 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _717 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _719 = _464 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _721 = as_type<int>(_717);
        _723 = as_type<int>(_719);
        _725 = as_type<int>(_711);
        _727 = as_type<int>(_713);
        _729 = as_type<int>(_715);
        _731 = as_type<int>(_709);
        _733 = true;
    }
    else
    {
        int _735 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _737 = _735 != 0;
        float _739 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _741 = _693 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _743 = _683 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _745 = _685 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _747 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _749 = _695 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _751 = as_type<int>(_739);
        int _753 = as_type<int>(_741);
        int _755 = as_type<int>(_743);
        _707 = _737 ? (-1) : 0;
        _723 = as_type<int>(_749);
        if (_737)
        {
            float _757 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _751 = as_type<int>(_757);
        }
        int _759 = _751;
        _727 = _759;
        if (_737)
        {
            float _761 = _380 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _753 = as_type<int>(_761);
        }
        int _763 = _753;
        _729 = _763;
        if (_737)
        {
            float _765 = _747 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _755 = as_type<int>(_765);
        }
        int _767 = _755;
        float _769 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _771 = as_type<int>(_769);
        _725 = _767;
        if (!_737)
        {
            _396 = as_type<int>(_745);
        }
        int _773 = _396;
        int _775 = _773;
        if (_737)
        {
            _771 = _759;
        }
        int _777 = _771;
        _721 = _777;
        if (_737)
        {
            _775 = _767;
        }
        int _779 = _775;
        _731 = _779;
        if (_737)
        {
            _723 = _763;
        }
    }
    _733 = false;
    int _781 = _707;
    int _783 = _721;
    int _785 = _723;
    int _787 = _725;
    int _789 = _727;
    int _791 = _729;
    int _793 = _731;
    float2 _2628 = float2(_570, _584);
    float2 _795 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2628, float2(0.0), isnan(_2628))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2628, float2(0.0), isnan(_2628))).xy;
    float _797 = _795.x;
    float _799 = _795.y;
    int _801 = 0;
    int _803 = _781;
    if (!_94)
    {
        int _805 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _807 = _805 != 0;
        _801 = _807 ? (-1) : 0;
    }
    int _809 = _801;
    if (_94)
    {
        _803 = -1;
    }
    int _811 = _803;
    int _813 = _811;
    if (!_94)
    {
        int _815 = ~_809;
        bool _817 = !_98;
        int _819 = _815 & (_817 ? (-1) : 0);
        _813 = _819;
    }
    int _821 = _813;
    bool _823 = _100 != 0;
    float _825 = fma(_797, 2.0, -1.0);
    float _827 = fma(_799, 2.0, -1.0);
    float _829 = fma(_825, (*spvDescriptorSet0.fp_c3)._m0[22].x, _570);
    float _831 = fma(_827, (*spvDescriptorSet0.fp_c3)._m0[22].y, _584);
    float2 _2692 = float2(_829, _831);
    float4 _833 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2692, float2(0.0), isnan(_2692))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2692, float2(0.0), isnan(_2692))).xyzw;
    float _835 = _833.x;
    float _837 = _833.y;
    float _839 = _833.z;
    float _841 = _833.w;
    float _843 = _542 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    int _845 = _821;
    if (_90)
    {
        _845 = -1;
    }
    int _847 = _845;
    int _849 = ~_821;
    float _851 = (_849 != 0) ? as_type<float>(_783) : 0.0;
    int _853 = _847;
    if (!_90)
    {
        bool _855 = !_98;
        bool _857 = _855 && _86;
        bool _859 = !_823;
        bool _861 = _857 && _859;
        _853 = _861 ? (-1) : 0;
    }
    int _863 = _853;
    float _865 = exp2(_843);
    int _867 = ~_821;
    float _869 = (_867 != 0) ? as_type<float>(_785) : 0.0;
    int _871 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _873 = _871 != 0;
    int _875 = ~_863;
    float _877 = (_875 != 0) ? as_type<float>(_787) : 0.0;
    int _879 = ~_863;
    float _881 = (_879 != 0) ? as_type<float>(_789) : 0.0;
    int _883 = ~_863;
    float _885 = (_883 != 0) ? as_type<float>(_791) : 0.0;
    bool _887 = !_98;
    bool _889 = _86 && _887;
    bool _891 = !_873;
    float _893 = _891 ? _630 : 0.0;
    int _895 = ~_821;
    float _897 = (_895 != 0) ? as_type<float>(_793) : 0.0;
    float _899 = -_865;
    float _901 = _899 + 1.0;
    float _903 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _905 = _901 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _907 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _909 = _907 != 0;
    float _911 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _913 = !_889;
    float _915 = _913 ? _903 : 0.0;
    float _917 = -_905;
    float _919 = _917 + 1.0;
    bool _921 = !_909;
    float _923 = _915 * _897;
    bool _925 = !_889;
    float _927 = _925 ? _911 : 0.0;
    float _929 = abs(_919);
    float _931 = log2(_929);
    bool _933 = !_909;
    float _935 = _915 * _851;
    float _937 = _915 * _869;
    bool _939 = !_909;
    float _941 = fma(_877, _927, _923);
    bool _943 = !_921;
    float _945 = _943 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _947 = fma(_881, _927, _935);
    bool _949 = !_933;
    float _951 = _949 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _953 = fma(_885, _927, _937);
    bool _955 = !_939;
    float _957 = _955 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _959 = _945 * _941;
    float _961 = _669 * _669;
    float _963 = _951 * _947;
    float _965 = _638 * _640;
    float _967 = _957 * _953;
    float _969 = _931 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _971 = _931 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _973 = _961 * _961;
    float _975 = _963 * 0.715200006961822509765625;
    float _977 = exp2(_969);
    int _979 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _981 = _979 != 0;
    float _983 = _973 * 16.0;
    float _985 = fma(_959, 0.2125999927520751953125, _975);
    float _987 = _965 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _989 = _663 * _983;
    float _991 = fma(_967, 0.072200000286102294921875, _985);
    float _993 = exp2(_971);
    bool _995 = !_981;
    float _997 = _665 * _983;
    float _999 = -_959;
    float _1001 = _999 + _991;
    float _1003 = _667 * _983;
    bool _1005 = !_981;
    float _1007 = -_963;
    float _1009 = _1007 + _991;
    bool _1011 = !_981;
    float _1013 = fma(_987, _1001, _959);
    bool _1015 = !_82;
    float _1017 = _1015 ? _977 : 1.0;
    float _1019 = fma(_987, _1009, _963);
    float _1021 = _995 ? _989 : 0.0;
    float _1023 = -_967;
    float _1025 = _1023 + _991;
    float _1027 = _1011 ? _1003 : 0.0;
    float _1029 = _1017 * _893;
    float _1031 = _1017 * _1013;
    bool _1033 = !_82;
    float _1035 = _1033 ? _993 : 1.0;
    float _1037 = fma(_987, _1025, _967);
    float _1039 = _1005 ? _997 : 0.0;
    float _1041 = _1035 * _1021;
    float _1043 = _1035 * _1039;
    float _1045 = _1035 * _1027;
    float _1047 = _86 ? _1029 : _1031;
    float _1049 = _1017 * _1019;
    float _1051 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1053 = _86 ? _1029 : _1049;
    float _1055 = _1029;
    float _1057 = _1041;
    float _1059 = _1037;
    float _1061 = _1043;
    float _1063 = _987;
    if (!_86)
    {
        float _1065 = _1017 * _1037;
        _1055 = _1065;
    }
    float _1067 = _1055;
    float _1069 = fma(_1041, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1051);
    float _1071 = _1067 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1073 = _1053 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1075 = fma(_1045, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1071);
    int _1077 = as_type<int>(_1071);
    float _1079 = _1069;
    float _1081 = _1075;
    if (_82)
    {
        _1077 = as_type<int>(_703);
    }
    int _1083 = _1077;
    float _1085 = fma(_1043, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1073);
    int _1087 = _1083;
    int _1089 = _1083;
    if (_82)
    {
        _1057 = 0.0;
    }
    float _1091 = _1057;
    float _1093 = _1091;
    if (_82)
    {
        _1059 = 0.0;
    }
    float _1095 = _1059;
    float _1097 = _1095;
    if (_82)
    {
        _1061 = 0.0;
    }
    float _1099 = _1061;
    bool _1101 = !_82;
    float _1103 = _1101 ? _905 : 0.0;
    float _1105 = _1099;
    if (_82)
    {
        _1063 = _1085;
    }
    float _1107 = _1063;
    float _1109 = _1107;
    float _1111 = _1107;
    if (!_82)
    {
        int _1113 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1115 = _1113 != 0;
        float _1117 = _656 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1119 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1121 = _1119 != 0;
        float _1123 = _654 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1125 = _658 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1127 = !_1121;
        float _1129 = _1127 ? _1123 : 0.0;
        bool _1131 = !_1121;
        float _1133 = _1131 ? _1117 : 0.0;
        bool _1135 = !_1121;
        float _1137 = _1135 ? _1125 : 0.0;
        float _1139 = _1103 * _1129;
        _1093 = _1139;
        if (!_1115)
        {
            _1087 = as_type<int>(_703);
        }
        int _1141 = _1087;
        float _1143 = _1103 * _1133;
        float _1145 = _1103 * _1137;
        _1097 = _1143;
        _1089 = _1141;
        _1105 = _1145;
        if (!_1115)
        {
            _1109 = _1085;
        }
        float _1147 = _1109;
        bool _1149 = !_1115;
        _1111 = _1147;
        if (!_1149)
        {
            float _1151 = -_1103;
            float _1153 = _1151 + 1.0;
            float _1155 = precise::clamp(_1153, 0.0, 1.0);
            float _1157 = _703 * _1155;
            float _1159 = precise::max(_1157, 9.9999997473787516355514526367188e-05);
            float _1161 = 1.0 / _1159;
            float _1163 = _703 * _1161;
            float _1165 = _1069 * _1163;
            float _1167 = _1085 * _1163;
            float _1169 = _1075 * _1163;
            _1111 = _1167;
            _1097 = 0.0;
            _1079 = _1165;
            _1093 = 0.0;
            _1089 = as_type<int>(_1157);
            _1081 = _1169;
            _1105 = 0.0;
        }
    }
    float _1171 = _1111;
    float _1173 = _1097;
    float _1175 = _1079;
    float _1177 = _1093;
    int _1179 = _1089;
    float _1181 = _1081;
    float _1183 = _1105;
    int _1185 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1187 = _1185 != 0;
    int _1189 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1191 = _1189 != 0;
    float _1193 = _648 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1195 = _1171 + _1173;
    float _1197 = _646 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1199 = _1175 + _1177;
    bool _1201 = !_1191;
    float _1203 = _1201 ? as_type<float>(_1179) : 1.0;
    float _1205 = _650 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1207 = _1181 + _1183;
    float _1209 = -_1203;
    float _1211 = _1209 + 1.0;
    float _1213 = abs(_1211);
    float _1215 = log2(_1213);
    float _1217 = _1215 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1219 = exp2(_1217);
    float _1221 = -_1219;
    float _1223 = spvFAdd(_1221, 1.00010001659393310546875);
    float _1225 = -_1219;
    float _1227 = _1225 + 1.0;
    float _1229 = -_1203;
    float _1231 = _1229 + _1227;
    float _1233 = 1.0 / _1223;
    float _1235 = _1231 * _1193;
    float _1237 = _1231 * _1197;
    float _1239 = _1231 * _1205;
    float _1241 = fma(_1195, _1203, _1235);
    float _1243 = fma(_1199, _1203, _1237);
    float _1245 = fma(_1207, _1203, _1239);
    float _1247 = _1233 * _1241;
    float _1249 = _1233 * _1243;
    float _1251 = _1233 * _1245;
    float _1253 = _1247 * 0.715200006961822509765625;
    float _1255 = fma(_1249, 0.2125999927520751953125, _1253);
    float _1257 = fma(_1251, 0.072200000286102294921875, _1255);
    float _1259 = 1.0 / _1257;
    float _1261 = _1259 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1263 = precise::clamp(_1261, 0.0, 1.0);
    float _1265 = fma(_1263, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1267 = _1265 * _841;
    float _1269 = fma(_1249, _1267, _835);
    float _1271 = fma(_1247, _1267, _837);
    float _1273 = fma(_1251, _1267, _839);
    bool _1275 = !_1187;
    float _1277 = _1271;
    float _1279 = _1259;
    float _1281 = _1251;
    int _1283 = as_type<int>(_1247);
    int _1285 = as_type<int>(_1259);
    int _1287 = as_type<int>(_1251);
    float _1289 = _1271;
    if (!_1275)
    {
        bool _1291 = _1227 != 1.0;
        bool _1293 = isnan(_1227);
        bool _1295 = _1291 || _1293;
        bool _1297 = isnan(1.0);
        bool _1299 = _1295 || _1297;
        float _1301 = -_1219;
        bool _1303 = _1301 != (-1.0);
        bool _1305 = isnan(_1301);
        bool _1307 = _1303 || _1305;
        bool _1309 = isnan(-1.0);
        bool _1311 = _1307 || _1309;
        float _1313 = -_1219;
        bool _1315 = _1313 == (-1.0);
        bool _1317 = !_1299;
        bool _1319 = _1315 || _1317;
        bool _1321 = _1227 == 1.0;
        bool _1323 = _1321 && _1311;
        bool _1325 = !_1319;
        float _1327 = _1325 ? _1227 : 0.0;
        bool _1329 = !_1323;
        float _1331 = _1329 ? 0.0 : 1.0;
        float _1333 = _1319 ? 0.0 : 0.5;
        float _1335 = _1327 * 0.715200006961822509765625;
        float _1337 = fma(_1331, 0.2125999927520751953125, _1335);
        float _1339 = fma(_1333, 0.072200000286102294921875, _1337);
        float _1341 = 1.0 / _1339;
        float _1343 = _1341 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1345 = precise::clamp(_1343, 0.0, 1.0);
        float _1347 = fma(_1345, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1349 = _1331 * _1347;
        float _1351 = _1327 * _1347;
        float _1353 = _1333 * _1347;
        out.m_42.x = _1349;
        out.m_42.y = _1351;
        out.m_42.z = _1353;
        out.m_42.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    bool _1355 = _100 != 0;
    bool _1357 = !_1355;
    if (!_1357)
    {
        if (_90)
        {
            _1277 = 0.0;
        }
        float _1359 = _1277;
        float _1361 = _1359;
        if (_90)
        {
            _1279 = 0.0;
        }
        float _1363 = _1279;
        float _1365 = _1363;
        if (!_90)
        {
            float _1367 = _881 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1365 = _1367;
        }
        float _1369 = _1365;
        float _1371 = _1369;
        if (!_90)
        {
            float _1373 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1361 = _1373;
        }
        float _1375 = _1361;
        float _1377 = _1375;
        if (!_94)
        {
            float _1379 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1369);
            _1371 = _1379;
        }
        float _1381 = _1371;
        if (_90)
        {
            _1281 = 0.0;
        }
        float _1383 = _1281;
        float _1385 = _1383;
        if (!_90)
        {
            float _1387 = _885 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1385 = _1387;
        }
        float _1389 = _1385;
        float _1391 = _1381 * 0.715200006961822509765625;
        float _1393 = _1389;
        if (!_94)
        {
            float _1395 = fma(_897, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1375);
            _1377 = _1395;
        }
        float _1397 = _1377;
        if (!_94)
        {
            float _1399 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1389);
            _1393 = _1399;
        }
        float _1401 = _1393;
        float _1403 = fma(_1397, 0.2125999927520751953125, _1391);
        float _1405 = fma(_1401, 0.072200000286102294921875, _1403);
        float _1407 = 1.0 / _1405;
        float _1409 = _1407 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1411 = precise::clamp(_1409, 0.0, 1.0);
        float _1413 = fma(_1411, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1415 = _1413 * _1397;
        float _1417 = _1413 * _1381;
        float _1419 = _1413 * _1401;
        out.m_42.x = _1415;
        out.m_42.y = _1417;
        out.m_42.z = _1419;
        out.m_42.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    if (!_98)
    {
        _1283 = as_type<int>(_1269);
    }
    int _1421 = _1283;
    if (!_98)
    {
        _1285 = as_type<int>(_1273);
    }
    int _1423 = _1285;
    float _1425 = as_type<float>(_1423);
    if (!_98)
    {
        _1287 = as_type<int>(_1227);
    }
    int _1427 = _1287;
    float _1429 = as_type<float>(_1427);
    if (!_98)
    {
        out.m_42.x = as_type<float>(_1421);
        out.m_42.y = _1271;
        out.m_42.z = as_type<float>(_1423);
        out.m_42.w = as_type<float>(_1427);
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    if (_90)
    {
        _1289 = 0.0;
    }
    float _1431 = _1289;
    float _1433 = _1431;
    if (_90)
    {
        _1425 = 0.0;
    }
    float _1435 = _1425;
    float _1437 = _1435;
    if (!_90)
    {
        float _1439 = _881 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = _1441;
    if (!_90)
    {
        float _1445 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1433 = _1445;
    }
    float _1447 = _1433;
    float _1449 = _1447;
    if (!_94)
    {
        float _1451 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1441);
        _1443 = _1451;
    }
    float _1453 = _1443;
    if (_90)
    {
        _1429 = 0.0;
    }
    float _1455 = _1429;
    float _1457 = _1455;
    if (!_90)
    {
        float _1459 = _885 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1457 = _1459;
    }
    float _1461 = _1457;
    float _1463 = _1453 * 0.715200006961822509765625;
    float _1465 = _1461;
    if (!_94)
    {
        float _1467 = fma(_897, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1447);
        _1449 = _1467;
    }
    float _1469 = _1449;
    if (!_94)
    {
        float _1471 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1461);
        _1465 = _1471;
    }
    float _1473 = _1465;
    float _1475 = fma(_1469, 0.2125999927520751953125, _1463);
    float _1477 = fma(_1473, 0.072200000286102294921875, _1475);
    float _1479 = 1.0 / _1477;
    float _1481 = _1479 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = fma(_1483, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1487 = _1485 * _1469;
    float _1489 = _1485 * _1453;
    float _1491 = _1485 * _1473;
    out.m_42.x = _1487;
    out.m_42.y = _1489;
    out.m_42.z = _1491;
    out.m_42.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

