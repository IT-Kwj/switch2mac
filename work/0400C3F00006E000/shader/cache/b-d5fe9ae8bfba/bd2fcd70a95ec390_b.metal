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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _46(thread const int& _3698, thread const int& _3699, thread const int& _3700, thread const int& _3701, thread int& _3702, thread int& _3703, thread int& _3704, thread int& _3705, thread int& _3706, thread int& _3707)
{
    float _3710 = as_type<float>(_3700) + 0.0;
    bool _3712 = _3710 != 0.0;
    bool _3714 = isnan(_3710);
    bool _3716 = _3712 || _3714;
    bool _3718 = isnan(0.0);
    bool _3720 = _3716 || _3718;
    int _3722 = as_type<int>(_3710);
    int _3724 = 0;
    int _3726 = _3698;
    int _3728 = _3720 ? (-1) : 0;
    if (!_3720)
    {
        float _3730 = as_type<float>(_3700) * 1.0;
        _3722 = as_type<int>(_3730);
    }
    int _3732 = _3722;
    bool _3734 = !_3720;
    int _3736 = _3732;
    if (!_3734)
    {
        float _3738 = as_type<float>(_3700) + 0.0;
        bool _3740 = _3738 >= 0.0;
        bool _3742 = isnan(_3738);
        bool _3744 = _3740 || _3742;
        bool _3746 = isnan(0.0);
        bool _3748 = _3744 || _3746;
        int _3750 = as_type<int>(_3738);
        _3728 = _3748 ? (-1) : 0;
        if (!_3748)
        {
            _3750 = 2147483647;
        }
        int _3752 = _3750;
        bool _3754 = !_3748;
        _3736 = _3752;
        if (!_3754)
        {
            float _3756 = abs(as_type<float>(_3700));
            float _3758 = _3756 + 0.0;
            bool _3760 = _3758 > as_type<float>(0x7f800000u /* inf */);
            bool _3762 = isnan(_3758);
            bool _3764 = _3760 || _3762;
            bool _3766 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3768 = _3764 || _3766;
            int _3770 = as_type<int>(_3758);
            _3724 = 2139095040;
            _3728 = _3768 ? (-1) : 0;
            if (_3768)
            {
                float _3772 = as_type<float>(_3700) + 1.0;
                _3770 = as_type<int>(_3772);
            }
            int _3774 = _3770;
            _3736 = _3774;
            if (!_3768)
            {
                float _3776 = abs(as_type<float>(_3700));
                float _3778 = _3776 + (-0.0);
                float _3780 = 0.0 + _3778;
                bool _3782 = _3780 != as_type<float>(0x7f800000u /* inf */);
                bool _3784 = isnan(_3780);
                bool _3786 = _3782 || _3784;
                bool _3788 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3790 = _3786 || _3788;
                int _3792 = as_type<int>(_3780);
                _3728 = _3790 ? (-1) : 0;
                if (!_3790)
                {
                    _3792 = _3700;
                }
                int _3794 = _3792;
                bool _3796 = !_3790;
                _3736 = _3794;
                if (!_3796)
                {
                    float _3798 = as_type<float>(_3700) * 18446744073709551616.0;
                    float _3800 = rsqrt(_3798);
                    float _3802 = _3798 * _3800;
                    float _3804 = _3800 * 0.5;
                    float _3806 = -_3802;
                    float _3808 = 0.0 + _3806;
                    float _3810 = fma(_3804, _3808, 0.5);
                    float _3812 = fma(_3802, _3810, _3802);
                    float _3814 = -_3812;
                    float _3816 = 0.0 + _3814;
                    float _3818 = fma(_3812, _3816, _3798);
                    float _3820 = fma(_3804, _3818, _3812);
                    float _3822 = _3820 * 2.3283064365386962890625e-10;
                    _3736 = as_type<int>(_3822);
                    _3724 = as_type<int>(_3798);
                    _3726 = as_type<int>(_3818);
                }
            }
        }
    }
    int _3824 = _3736;
    int _3826 = _3724;
    int _3828 = _3726;
    int _3830 = _3728;
    _3702 = _3824;
    _3703 = _3826;
    _3704 = _3828;
    _3705 = _3701;
    _3706 = 0;
    _3707 = _3830;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _729 = false;
    bool _266 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_35.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_35.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_35.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    int _70 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _74 = _70 != 0;
    int _76 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _78 = _76 != 0;
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _82 = _80 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _94 = _92 != 0;
    int _96 = int(_74);
    float _98 = 1.0 / _50;
    float _100 = _98 * _56;
    float _102 = _98 * _62;
    float _104 = _98 * _68;
    float _106 = _100 * _100;
    float _108 = fma(_102, _102, _106);
    float _110 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _112 = fma(_104, _104, _108);
    float _114 = precise::max(0.0, _110);
    float _116 = rsqrt(_112);
    float _118 = _102 * _116;
    float _120 = _104 * _116;
    float _122 = _100 * _116;
    float _124 = _118 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _128 = -_122;
    float _130 = -_114;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[13].z, _130);
    float _134 = _124 * _124;
    float _136 = _126 * _126;
    float _138 = _134 + _136;
    float _140 = sqrt(_138);
    bool _142 = _140 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _144 = _114;
    float _146 = _116;
    float _148 = _132;
    float _150 = _124;
    float _152 = _126;
    if (!_142)
    {
        _144 = _136;
    }
    float _154 = _144;
    float _156 = _154;
    if (!_142)
    {
        _146 = _134;
    }
    float _158 = _146;
    bool _160 = !_142;
    float _162 = _158;
    if (!_160)
    {
        float _164 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _166 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _168 = _140 + _166;
        float _170 = _132 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _172 = rsqrt(_138);
        float _174 = _168 * _164;
        float _176 = _174 * 0.15915493667125701904296875;
        float _178 = _176 * 6.283185482025146484375;
        float _180 = sin(_178);
        float _182 = _176 * 6.283185482025146484375;
        float _184 = cos(_182);
        float _186 = fma(_180, _170, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _188 = _172 * _186;
        float _190 = _184 + (-1.0);
        float _192 = _124 * _188;
        float _194 = _126 * _188;
        float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _198 = _194 * _194;
        float _200 = fma(_132, _184, _196);
        float _202 = _192 * _192;
        _148 = _200;
        _162 = _202;
        _156 = _198;
        _150 = _192;
        _152 = _194;
    }
    float _204 = _148;
    float _206 = _162;
    float _208 = _156;
    float _210 = _150;
    float _212 = _152;
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
    float _264;
    if (!_242)
    {
        int _244 = 0;
        int _246 = 0;
        int _248 = as_type<int>(_230);
        int _250 = 1200;
        int _252;
        int _254;
        int _256;
        int _258;
        int _260;
        int _262;
        _46(_244, _246, _248, _250, _252, _254, _256, _258, _260, _262);
        _264 = as_type<float>(_252);
        _266 = true;
    }
    else
    {
        float _268 = rsqrt(_230);
        float _270 = _230 * _268;
        float _272 = _268 * 0.5;
        float _274 = -_270;
        float _276 = 0.0 + _274;
        float _278 = fma(_272, _276, 0.5);
        float _280 = fma(_270, _278, _270);
        float _282 = -_280;
        float _284 = 0.0 + _282;
        float _286 = fma(_280, _284, _230);
        float _288 = fma(_272, _286, _280);
        _264 = _288;
    }
    _266 = false;
    float _290 = _264;
    bool _292 = _220 > 0.0;
    float _294 = _120 * _120;
    float _296 = _118 * _118;
    float _298 = _294 + _296;
    if (_292)
    {
        discard_fragment();
    }
    float _300 = rsqrt(_298);
    float _302 = _240 * _290;
    float _304 = _302 * 0.636619746685028076171875;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = -_306;
    float _310 = _308 + 1.0;
    float _312 = sqrt(_310);
    float _314 = _120 * _300;
    float _316 = _118 * _300;
    float _318 = abs(_314);
    float _320 = abs(_316);
    float _322 = precise::max(_318, _320);
    float _324 = precise::max(_322, 9.9999997473787516355514526367188e-05);
    float _326 = -_312;
    float _328 = _326 + 1.0;
    float _330 = 1.0 / _324;
    float _332 = _328 * 0.5;
    float _334 = -_330;
    float _336 = _314 * _334;
    float _338 = _316 * _330;
    float _340 = fma(_336, _332, 0.5);
    float _342 = fma(_338, _332, 0.5);
    if (_292)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    float2 _1883;
    _1883.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    _1883.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    float _344 = _1883.x;
    float _346 = _344 * 256.0;
    int _348 = int(_346);
    float _350 = -_122;
    float _352 = _350 + 1.0;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = -_122;
    float _358 = fma(_356, _122, 1.0);
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = _218 * _210;
    int _364 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _366 = _364 != 0;
    float _368 = _218 * _212;
    float _370 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _372 = _362 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _374 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _376 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _382 = -_372;
    float _384 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[11].y, _382);
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _388 = fma(_122, _378, _370);
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _392 = _354;
    if (_366)
    {
        float _394 = sqrt(_360);
        _392 = _394;
    }
    float _396 = _392;
    float _398 = -_368;
    float _400 = fma(_398, (*spvDescriptorSet0.fp_c3)._m0[11].z, _384);
    float _402 = -_120;
    float _404 = fma(_402, _380, _388);
    float _406 = fma(_120, _380, _388);
    float _408 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _410 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _414 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _416 = fma(_122, _408, _374);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _420 = fma(_122, _410, _376);
    float _422 = -_122;
    float _424 = _118 * _422;
    float _426 = -_120;
    float _428 = fma(_426, _412, _416);
    float _430 = fma(_120, _412, _416);
    float _432 = -_120;
    float _434 = fma(_432, _418, _420);
    float _436 = fma(_120, _418, _420);
    float _438 = abs(_396);
    float _440 = log2(_438);
    float _442 = -_118;
    float _444 = fma(_442, _386, _404);
    float _446 = -_118;
    float _448 = fma(_446, _390, _428);
    float _450 = -_118;
    float _452 = fma(_450, _414, _434);
    float _454 = fma(_118, _414, _436);
    float _456 = fma(_118, _390, _430);
    float _458 = -_120;
    float _460 = _122 * _458;
    float _462 = fma(_118, _386, _406);
    float _464 = _118 * _122;
    float _466 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _468 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _470 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _472 = _122 * _120;
    float _474 = fma(_466, _424, _444);
    float _476 = fma(_466, _464, _462);
    float _478 = _440 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = fma(_470, _424, _448);
    float _482 = fma(_468, _460, _474);
    float _484 = fma(_470, _464, _456);
    float _486 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _488 = exp2(_478);
    float _490 = fma(_468, _472, _476);
    float _492 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _494 = fma(_486, _460, _480);
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _498 = fma(_486, _472, _484);
    float _500 = fma(_492, _424, _452);
    float _502 = fma(_492, _464, _454);
    float _504 = _118 * _120;
    float _506 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _508 = fma(_496, _460, _500);
    float _510 = fma(_496, _472, _502);
    float _512 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _514 = in.m_40.x;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = in.m_40.y;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _528 = _488 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _530 = fma(_512, _504, _494);
    float _532 = fma(_512, _504, _498);
    float _534 = fma(_528, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = fma(_506, _504, _482);
    float _540 = fma(_506, _504, _490);
    float _542 = -_536;
    float _544 = _542 + 1.0;
    float _546 = fma(_400, 0.5, 0.5);
    float _548 = fma(_400, -0.5, 0.5);
    float _550 = fma(_526, _504, _508);
    float _552 = fma(_526, _504, _510);
    float _554 = fma(_546, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _556 = abs(_544);
    float _558 = log2(_556);
    float _560 = _120 * (-3.0);
    float _562 = fma(_546, _554, -0.212114393711090087890625);
    float _564 = -_120;
    float _566 = fma(_564, _560, -1.0);
    float _568 = fma(_546, _562, 1.570728778839111328125);
    float _570 = sqrt(_548);
    float _572 = fma(_294, 3.0, -1.0);
    float _574 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _576 = fma(_220, -0.5, 0.5);
    float _578 = fma(_574, _566, _538);
    float _580 = fma(_574, _572, _540);
    float _582 = _558 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _584 = _220 + 1.0;
    float _586 = _98 * _518;
    float _588 = _98 * _524;
    float _590 = exp2(_582);
    float _592 = _570 * 0.636619746685028076171875;
    float _594 = -_568;
    float _596 = fma(_592, _594, 1.0);
    float _598 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _600 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _602 = fma(_598, _566, _530);
    float _604 = fma(_600, _566, _550);
    float _606 = fma(_598, _572, _532);
    float _608 = -_220;
    float _610 = fma(_590, _584, _608);
    float _612 = fma(_610, 0.5, 0.5);
    float2 _2312 = float2(_586, _588);
    float3 _616 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2312, float2(0.0), isnan(_2312))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2312, float2(0.0), isnan(_2312))).xyz;
    float _618 = _616.x;
    float _620 = _616.y;
    float _622 = _616.z;
    float _624 = float(uint(_348));
    float _626 = _624 * 0.00390625;
    float2 _2334 = float2(_340, _342);
    float2 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2334, float2(0.0), isnan(_2334)), level(_626)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2334, float2(0.0), isnan(_2334)), level(_626)).xy;
    float _632 = _630.x;
    float _634 = _630.y;
    float2 _2347 = float2(_596, _576);
    float3 _636 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2347, float2(0.0), isnan(_2347))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2347, float2(0.0), isnan(_2347))).xyz;
    float _638 = _636.x;
    float _640 = _636.y;
    float _642 = _636.z;
    float2 _2361 = float2(_596, _612);
    float3 _644 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2361, float2(0.0), isnan(_2361))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2361, float2(0.0), isnan(_2361))).xyz;
    float _646 = _644.x;
    float _648 = _644.y;
    float _650 = _644.z;
    float2 _2375 = float2(_340, _342);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2375, float2(0.0), isnan(_2375)), level(_626)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2375, float2(0.0), isnan(_2375)), level(_626)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float _663 = fma(_600, _572, _552);
    int _665 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _667 = _665 != 0;
    float _669 = _118 * _118;
    float _671 = -_122;
    float _673 = fma(_671, _122, _669);
    float _675 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _677 = fma(_675, _673, _578);
    float _679 = fma(_675, _673, _580);
    float _681 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _683 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _685 = fma(_681, _673, _602);
    float _687 = fma(_681, _673, _606);
    float _689 = fma(_683, _673, _604);
    float _691 = fma(_683, _673, _663);
    float _693 = -_622;
    float _695 = _693 + 1.0;
    float _697 = _634 * _695;
    float _699 = _697 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _701 = !_667;
    int _703 = _667 ? (-1) : 0;
    int _717;
    int _719;
    int _721;
    int _723;
    int _725;
    int _727;
    if (!_701)
    {
        float _705 = _444 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _707 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _709 = _452 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _711 = _462 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _713 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _715 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _717 = as_type<int>(_711);
        _719 = as_type<int>(_715);
        _721 = as_type<int>(_707);
        _723 = as_type<int>(_705);
        _725 = as_type<int>(_709);
        _727 = as_type<int>(_713);
        _729 = true;
    }
    else
    {
        int _731 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _733 = _731 != 0;
        float _735 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _737 = _685 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _739 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _741 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _743 = _687 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _745 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _747 = as_type<int>(_735);
        int _749 = as_type<int>(_737);
        int _751 = as_type<int>(_739);
        int _753 = as_type<int>(_741);
        int _755 = as_type<int>(_743);
        _703 = _733 ? (-1) : 0;
        _719 = as_type<int>(_745);
        if (_733)
        {
            float _757 = _370 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _747 = as_type<int>(_757);
        }
        int _759 = _747;
        _723 = _759;
        if (_733)
        {
            float _761 = _374 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _749 = as_type<int>(_761);
        }
        int _763 = _749;
        _721 = _763;
        if (_733)
        {
            float _765 = _376 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _751 = as_type<int>(_765);
        }
        int _767 = _751;
        _725 = _767;
        if (_733)
        {
            _753 = _759;
        }
        int _769 = _753;
        _717 = _769;
        if (_733)
        {
            _755 = _763;
        }
        int _771 = _755;
        _727 = _771;
        if (_733)
        {
            _719 = _767;
        }
    }
    _729 = false;
    int _773 = _703;
    int _775 = _717;
    int _777 = _719;
    int _779 = _721;
    int _781 = _723;
    int _783 = _725;
    int _785 = _727;
    int _787 = 0;
    int _789 = _773;
    if (!_90)
    {
        int _791 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _793 = _791 != 0;
        _787 = _793 ? (-1) : 0;
    }
    int _795 = _787;
    float _797 = _558 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_90)
    {
        _789 = -1;
    }
    int _799 = _789;
    int _801 = _799;
    if (!_90)
    {
        int _803 = ~_795;
        bool _805 = !_94;
        int _807 = _803 & (_805 ? (-1) : 0);
        _801 = _807;
    }
    int _809 = _801;
    bool _811 = _96 != 0;
    float _813 = exp2(_797);
    int _815 = _809;
    if (_86)
    {
        _815 = -1;
    }
    int _817 = _815;
    int _819 = ~_809;
    float _821 = (_819 != 0) ? as_type<float>(_775) : 0.0;
    int _823 = _817;
    if (!_86)
    {
        bool _825 = !_94;
        bool _827 = _825 && _82;
        bool _829 = !_811;
        bool _831 = _827 && _829;
        _823 = _831 ? (-1) : 0;
    }
    int _833 = _823;
    float _835 = -_813;
    float _837 = _835 + 1.0;
    int _839 = ~_809;
    float _841 = (_839 != 0) ? as_type<float>(_777) : 0.0;
    float _843 = _837 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _845 = -_843;
    float _847 = _845 + 1.0;
    int _849 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _851 = _849 != 0;
    float _853 = abs(_847);
    float _855 = log2(_853);
    int _857 = ~_833;
    float _859 = (_857 != 0) ? as_type<float>(_779) : 0.0;
    int _861 = ~_833;
    float _863 = (_861 != 0) ? as_type<float>(_781) : 0.0;
    bool _865 = !_94;
    bool _867 = _82 && _865;
    int _869 = ~_833;
    float _871 = (_869 != 0) ? as_type<float>(_783) : 0.0;
    bool _873 = !_851;
    float _875 = _873 ? _632 : 0.0;
    int _877 = ~_809;
    float _879 = (_877 != 0) ? as_type<float>(_785) : 0.0;
    float _881 = _875 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _883 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _885 = _883 != 0;
    bool _887 = !_867;
    float _889 = _887 ? _881 : 0.0;
    float _891 = _875 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _893 = !_885;
    float _895 = _889 * _879;
    bool _897 = !_867;
    float _899 = _897 ? _891 : 0.0;
    float _901 = _889 * _821;
    bool _903 = !_885;
    float _905 = _889 * _841;
    bool _907 = !_893;
    float _909 = _907 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _911 = fma(_859, _899, _895);
    bool _913 = !_885;
    float _915 = fma(_863, _899, _901);
    bool _917 = !_903;
    float _919 = _917 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _921 = fma(_871, _899, _905);
    float _923 = _909 * _911;
    bool _925 = !_913;
    float _927 = _925 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _929 = _855 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _931 = _919 * _915;
    float _933 = _661 * _661;
    float _935 = _923 * 0.715200006961822509765625;
    float _937 = _927 * _921;
    float _939 = _618 * _620;
    float _941 = _933 * _933;
    float _943 = fma(_931, 0.2125999927520751953125, _935);
    float _945 = exp2(_929);
    float _947 = _855 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _949 = _941 * 16.0;
    float _951 = _939 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _953 = fma(_937, 0.072200000286102294921875, _943);
    float _955 = _655 * _949;
    int _957 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _959 = _957 != 0;
    float _961 = exp2(_947);
    float _963 = -_931;
    float _965 = _963 + _953;
    float _967 = -_923;
    float _969 = _967 + _953;
    float _971 = -_937;
    float _973 = _971 + _953;
    float _975 = fma(_951, _965, _931);
    float _977 = fma(_951, _969, _923);
    float _979 = _657 * _949;
    float _981 = _659 * _949;
    bool _983 = !_78;
    float _985 = _983 ? _945 : 1.0;
    float _987 = fma(_951, _973, _937);
    bool _989 = !_959;
    bool _991 = !_959;
    float _993 = _985 * _875;
    float _995 = _985 * _975;
    bool _997 = !_959;
    float _999 = _985 * _977;
    bool _1001 = !_78;
    float _1003 = _1001 ? _961 : 1.0;
    float _1005 = _82 ? _993 : _995;
    float _1007 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1009 = _989 ? _955 : 0.0;
    float _1011 = _991 ? _979 : 0.0;
    float _1013 = _997 ? _981 : 0.0;
    float _1015 = _1003 * _1009;
    float _1017 = _82 ? _993 : _999;
    float _1019 = _993;
    float _1021 = _981;
    float _1023 = _875;
    float _1025 = _985;
    if (!_82)
    {
        float _1027 = _985 * _987;
        _1019 = _1027;
    }
    float _1029 = _1019;
    float _1031 = _1003 * _1011;
    float _1033 = _1003 * _1013;
    float _1035 = _1029 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1037 = fma(_1015, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1007);
    float _1039 = fma(_1033, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1035);
    int _1041 = as_type<int>(_1033);
    float _1043 = _1031;
    float _1045 = _1035;
    if (_78)
    {
        _1041 = as_type<int>(_699);
    }
    int _1047 = _1041;
    float _1049 = _1017 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1051 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1049);
    int _1053 = _1047;
    float _1055 = _1051;
    int _1057 = _1047;
    if (_78)
    {
        _1021 = 0.0;
    }
    float _1059 = _1021;
    float _1061 = _1059;
    if (_78)
    {
        _1023 = 0.0;
    }
    float _1063 = _1023;
    float _1065 = _1063;
    if (_78)
    {
        _1025 = 0.0;
    }
    float _1067 = _1025;
    bool _1069 = !_78;
    float _1071 = _1069 ? _843 : 0.0;
    float _1073 = _1067;
    if (_78)
    {
        _1043 = _1037;
    }
    float _1075 = _1043;
    float _1077 = _1075;
    float _1079 = _1075;
    if (_78)
    {
        _1045 = _1039;
    }
    float _1081 = _1045;
    float _1083 = _1081;
    float _1085 = _1081;
    if (!_78)
    {
        int _1087 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1089 = _1087 != 0;
        float _1091 = _648 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1093 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1095 = _1093 != 0;
        float _1097 = _646 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1099 = _650 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1101 = !_1095;
        float _1103 = _1101 ? _1097 : 0.0;
        bool _1105 = !_1095;
        float _1107 = _1105 ? _1091 : 0.0;
        bool _1109 = !_1095;
        float _1111 = _1109 ? _1099 : 0.0;
        float _1113 = _1071 * _1103;
        _1061 = _1113;
        if (!_1089)
        {
            _1053 = as_type<int>(_699);
        }
        int _1115 = _1053;
        float _1117 = _1071 * _1107;
        _1065 = _1117;
        _1057 = _1115;
        if (!_1089)
        {
            _1077 = _1037;
        }
        float _1119 = _1077;
        float _1121 = _1071 * _1111;
        _1079 = _1119;
        _1073 = _1121;
        if (!_1089)
        {
            _1083 = _1039;
        }
        float _1123 = _1083;
        bool _1125 = !_1089;
        _1085 = _1123;
        if (!_1125)
        {
            float _1127 = -_1071;
            float _1129 = _1127 + 1.0;
            float _1131 = precise::clamp(_1129, 0.0, 1.0);
            float _1133 = _699 * _1131;
            float _1135 = precise::max(_1133, 9.9999997473787516355514526367188e-05);
            float _1137 = 1.0 / _1135;
            float _1139 = _699 * _1137;
            float _1141 = _1037 * _1139;
            float _1143 = _1051 * _1139;
            float _1145 = _1039 * _1139;
            _1055 = _1143;
            _1065 = 0.0;
            _1079 = _1141;
            _1061 = 0.0;
            _1057 = as_type<int>(_1133);
            _1085 = _1145;
            _1073 = 0.0;
        }
    }
    float _1147 = _1055;
    float _1149 = _1065;
    float _1151 = _1079;
    float _1153 = _1061;
    int _1155 = _1057;
    float _1157 = _1085;
    float _1159 = _1073;
    int _1161 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1163 = _1161 != 0;
    int _1165 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1167 = _1165 != 0;
    float _1169 = _640 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1171 = _1147 + _1149;
    float _1173 = _638 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1175 = _1151 + _1153;
    bool _1177 = !_1167;
    float _1179 = _1177 ? as_type<float>(_1155) : 1.0;
    float _1181 = _642 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1183 = _1157 + _1159;
    float _1185 = -_1179;
    float _1187 = _1185 + 1.0;
    float _1189 = abs(_1187);
    float _1191 = log2(_1189);
    float _1193 = _1191 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1195 = exp2(_1193);
    float _1197 = -_1195;
    float _1199 = spvFAdd(_1197, 1.00010001659393310546875);
    float _1201 = -_1195;
    float _1203 = _1201 + 1.0;
    float _1205 = -_1179;
    float _1207 = _1205 + _1203;
    float _1209 = 1.0 / _1199;
    float _1211 = _1207 * _1169;
    float _1213 = _1207 * _1173;
    float _1215 = _1207 * _1181;
    float _1217 = fma(_1171, _1179, _1211);
    float _1219 = fma(_1175, _1179, _1213);
    float _1221 = fma(_1183, _1179, _1215);
    float _1223 = _1209 * _1217;
    float _1225 = _1209 * _1219;
    float _1227 = _1209 * _1221;
    float _1229 = _1223 * 0.715200006961822509765625;
    float _1231 = fma(_1225, 0.2125999927520751953125, _1229);
    float _1233 = fma(_1227, 0.072200000286102294921875, _1231);
    float _1235 = 1.0 / _1233;
    float _1237 = _1235 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1239 = precise::clamp(_1237, 0.0, 1.0);
    float _1241 = fma(_1239, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1243 = _1225 * _1241;
    float _1245 = _1223 * _1241;
    float _1247 = _1227 * _1241;
    bool _1249 = !_1163;
    float _1251 = _1195;
    float _1253 = _1243;
    float _1255 = _1245;
    int _1257 = as_type<int>(_1195);
    int _1259 = as_type<int>(_1243);
    int _1261 = as_type<int>(_1245);
    int _1263 = as_type<int>(_1247);
    if (!_1249)
    {
        bool _1265 = _1203 != 1.0;
        bool _1267 = isnan(_1203);
        bool _1269 = _1265 || _1267;
        bool _1271 = isnan(1.0);
        bool _1273 = _1269 || _1271;
        float _1275 = -_1195;
        bool _1277 = _1275 != (-1.0);
        bool _1279 = isnan(_1275);
        bool _1281 = _1277 || _1279;
        bool _1283 = isnan(-1.0);
        bool _1285 = _1281 || _1283;
        float _1287 = -_1195;
        bool _1289 = _1287 == (-1.0);
        bool _1291 = !_1273;
        bool _1293 = _1289 || _1291;
        bool _1295 = _1203 == 1.0;
        bool _1297 = _1295 && _1285;
        bool _1299 = !_1293;
        float _1301 = _1299 ? _1203 : 0.0;
        bool _1303 = !_1297;
        float _1305 = _1303 ? 0.0 : 1.0;
        float _1307 = _1293 ? 0.0 : 0.5;
        float _1309 = _1301 * 0.715200006961822509765625;
        float _1311 = fma(_1305, 0.2125999927520751953125, _1309);
        float _1313 = fma(_1307, 0.072200000286102294921875, _1311);
        float _1315 = 1.0 / _1313;
        float _1317 = _1315 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1319 = precise::clamp(_1317, 0.0, 1.0);
        float _1321 = fma(_1319, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1323 = _1305 * _1321;
        float _1325 = _1301 * _1321;
        float _1327 = _1307 * _1321;
        out.m_38.x = _1323;
        out.m_38.y = _1325;
        out.m_38.z = _1327;
        out.m_38.w = 1.0;
        return out;
    }
    bool _1329 = _96 != 0;
    bool _1331 = !_1329;
    if (!_1331)
    {
        if (_86)
        {
            _1251 = 0.0;
        }
        float _1333 = _1251;
        float _1335 = _1333;
        if (_86)
        {
            _1253 = 0.0;
        }
        float _1337 = _1253;
        float _1339 = _1337;
        if (!_86)
        {
            float _1341 = _859 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1339 = _1341;
        }
        float _1343 = _1339;
        float _1345 = _1343;
        if (!_86)
        {
            float _1347 = _863 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1335 = _1347;
        }
        float _1349 = _1335;
        float _1351 = _1349;
        if (!_90)
        {
            float _1353 = fma(_879, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1343);
            _1345 = _1353;
        }
        float _1355 = _1345;
        if (_86)
        {
            _1255 = 0.0;
        }
        float _1357 = _1255;
        float _1359 = _1357;
        if (!_86)
        {
            float _1361 = _871 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1359 = _1361;
        }
        float _1363 = _1359;
        float _1365 = _1355 * 0.715200006961822509765625;
        float _1367 = _1363;
        if (!_90)
        {
            float _1369 = fma(_821, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1349);
            _1351 = _1369;
        }
        float _1371 = _1351;
        if (!_90)
        {
            float _1373 = fma(_841, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1363);
            _1367 = _1373;
        }
        float _1375 = _1367;
        float _1377 = fma(_1371, 0.2125999927520751953125, _1365);
        float _1379 = fma(_1375, 0.072200000286102294921875, _1377);
        float _1381 = 1.0 / _1379;
        float _1383 = _1381 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1385 = precise::clamp(_1383, 0.0, 1.0);
        float _1387 = fma(_1385, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1389 = _1387 * _1371;
        float _1391 = _1387 * _1355;
        float _1393 = _1387 * _1375;
        out.m_38.x = _1389;
        out.m_38.y = _1391;
        out.m_38.z = _1393;
        out.m_38.w = 1.0;
        return out;
    }
    if (!_94)
    {
        _1257 = as_type<int>(_1243);
    }
    int _1395 = _1257;
    float _1397 = as_type<float>(_1395);
    if (!_94)
    {
        _1259 = as_type<int>(_1245);
    }
    int _1399 = _1259;
    float _1401 = as_type<float>(_1399);
    if (!_94)
    {
        _1261 = as_type<int>(_1247);
    }
    int _1403 = _1261;
    float _1405 = as_type<float>(_1403);
    if (!_94)
    {
        _1263 = as_type<int>(_1203);
    }
    int _1407 = _1263;
    if (!_94)
    {
        out.m_38.x = as_type<float>(_1395);
        out.m_38.y = as_type<float>(_1399);
        out.m_38.z = as_type<float>(_1403);
        out.m_38.w = as_type<float>(_1407);
        return out;
    }
    if (_86)
    {
        _1397 = 0.0;
    }
    float _1409 = _1397;
    float _1411 = _1409;
    if (_86)
    {
        _1401 = 0.0;
    }
    float _1413 = _1401;
    float _1415 = _1413;
    if (!_86)
    {
        float _1417 = _859 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1415 = _1417;
    }
    float _1419 = _1415;
    float _1421 = _1419;
    if (!_86)
    {
        float _1423 = _863 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1411 = _1423;
    }
    float _1425 = _1411;
    float _1427 = _1425;
    if (!_90)
    {
        float _1429 = fma(_879, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1419);
        _1421 = _1429;
    }
    float _1431 = _1421;
    if (_86)
    {
        _1405 = 0.0;
    }
    float _1433 = _1405;
    float _1435 = _1433;
    if (!_86)
    {
        float _1437 = _871 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1431 * 0.715200006961822509765625;
    float _1443 = _1439;
    if (!_90)
    {
        float _1445 = fma(_821, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1425);
        _1427 = _1445;
    }
    float _1447 = _1427;
    if (!_90)
    {
        float _1449 = fma(_841, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1439);
        _1443 = _1449;
    }
    float _1451 = _1443;
    float _1453 = fma(_1447, 0.2125999927520751953125, _1441);
    float _1455 = fma(_1451, 0.072200000286102294921875, _1453);
    float _1457 = 1.0 / _1455;
    float _1459 = _1457 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1461 = precise::clamp(_1459, 0.0, 1.0);
    float _1463 = fma(_1461, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1465 = _1463 * _1447;
    float _1467 = _1463 * _1431;
    float _1469 = _1463 * _1451;
    out.m_38.x = _1465;
    out.m_38.y = _1467;
    out.m_38.z = _1469;
    out.m_38.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _729 = false;
    bool _266 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_35.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_35.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_35.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    int _70 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _74 = _70 != 0;
    int _76 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _78 = _76 != 0;
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _82 = _80 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _94 = _92 != 0;
    int _96 = int(_74);
    float _98 = 1.0 / _50;
    float _100 = _98 * _56;
    float _102 = _98 * _62;
    float _104 = _98 * _68;
    float _106 = _100 * _100;
    float _108 = fma(_102, _102, _106);
    float _110 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _112 = fma(_104, _104, _108);
    float _114 = precise::max(0.0, _110);
    float _116 = rsqrt(_112);
    float _118 = _102 * _116;
    float _120 = _104 * _116;
    float _122 = _100 * _116;
    float _124 = _118 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _128 = -_122;
    float _130 = -_114;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[13].z, _130);
    float _134 = _124 * _124;
    float _136 = _126 * _126;
    float _138 = _134 + _136;
    float _140 = sqrt(_138);
    bool _142 = _140 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _144 = _114;
    float _146 = _116;
    float _148 = _132;
    float _150 = _124;
    float _152 = _126;
    if (!_142)
    {
        _144 = _136;
    }
    float _154 = _144;
    float _156 = _154;
    if (!_142)
    {
        _146 = _134;
    }
    float _158 = _146;
    bool _160 = !_142;
    float _162 = _158;
    if (!_160)
    {
        float _164 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _166 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _168 = _140 + _166;
        float _170 = _132 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _172 = rsqrt(_138);
        float _174 = _168 * _164;
        float _176 = _174 * 0.15915493667125701904296875;
        float _178 = _176 * 6.283185482025146484375;
        float _180 = sin(_178);
        float _182 = _176 * 6.283185482025146484375;
        float _184 = cos(_182);
        float _186 = fma(_180, _170, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _188 = _172 * _186;
        float _190 = _184 + (-1.0);
        float _192 = _124 * _188;
        float _194 = _126 * _188;
        float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _198 = _194 * _194;
        float _200 = fma(_132, _184, _196);
        float _202 = _192 * _192;
        _148 = _200;
        _162 = _202;
        _156 = _198;
        _150 = _192;
        _152 = _194;
    }
    float _204 = _148;
    float _206 = _162;
    float _208 = _156;
    float _210 = _150;
    float _212 = _152;
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
    float _264;
    if (!_242)
    {
        int _244 = 0;
        int _246 = 0;
        int _248 = as_type<int>(_230);
        int _250 = 1200;
        int _252;
        int _254;
        int _256;
        int _258;
        int _260;
        int _262;
        _46(_244, _246, _248, _250, _252, _254, _256, _258, _260, _262);
        _264 = as_type<float>(_252);
        _266 = true;
    }
    else
    {
        float _268 = rsqrt(_230);
        float _270 = _230 * _268;
        float _272 = _268 * 0.5;
        float _274 = -_270;
        float _276 = 0.0 + _274;
        float _278 = fma(_272, _276, 0.5);
        float _280 = fma(_270, _278, _270);
        float _282 = -_280;
        float _284 = 0.0 + _282;
        float _286 = fma(_280, _284, _230);
        float _288 = fma(_272, _286, _280);
        _264 = _288;
    }
    _266 = false;
    float _290 = _264;
    bool _292 = _220 > 0.0;
    float _294 = _120 * _120;
    float _296 = _118 * _118;
    float _298 = _294 + _296;
    if (_292)
    {
        discard_fragment();
    }
    float _300 = rsqrt(_298);
    float _302 = _240 * _290;
    float _304 = _302 * 0.636619746685028076171875;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = -_306;
    float _310 = _308 + 1.0;
    float _312 = sqrt(_310);
    float _314 = _120 * _300;
    float _316 = _118 * _300;
    float _318 = abs(_314);
    float _320 = abs(_316);
    float _322 = precise::max(_318, _320);
    float _324 = precise::max(_322, 9.9999997473787516355514526367188e-05);
    float _326 = -_312;
    float _328 = _326 + 1.0;
    float _330 = 1.0 / _324;
    float _332 = _328 * 0.5;
    float _334 = -_330;
    float _336 = _314 * _334;
    float _338 = _316 * _330;
    float _340 = fma(_336, _332, 0.5);
    float _342 = fma(_338, _332, 0.5);
    if (_292)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float2 _1883;
    _1883.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    _1883.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    float _344 = _1883.x;
    float _346 = _344 * 256.0;
    int _348 = int(_346);
    float _350 = -_122;
    float _352 = _350 + 1.0;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = -_122;
    float _358 = fma(_356, _122, 1.0);
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = _218 * _210;
    int _364 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _366 = _364 != 0;
    float _368 = _218 * _212;
    float _370 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _372 = _362 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _374 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _376 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _382 = -_372;
    float _384 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[11].y, _382);
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _388 = fma(_122, _378, _370);
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _392 = _354;
    if (_366)
    {
        float _394 = sqrt(_360);
        _392 = _394;
    }
    float _396 = _392;
    float _398 = -_368;
    float _400 = fma(_398, (*spvDescriptorSet0.fp_c3)._m0[11].z, _384);
    float _402 = -_120;
    float _404 = fma(_402, _380, _388);
    float _406 = fma(_120, _380, _388);
    float _408 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _410 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _414 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _416 = fma(_122, _408, _374);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _420 = fma(_122, _410, _376);
    float _422 = -_122;
    float _424 = _118 * _422;
    float _426 = -_120;
    float _428 = fma(_426, _412, _416);
    float _430 = fma(_120, _412, _416);
    float _432 = -_120;
    float _434 = fma(_432, _418, _420);
    float _436 = fma(_120, _418, _420);
    float _438 = abs(_396);
    float _440 = log2(_438);
    float _442 = -_118;
    float _444 = fma(_442, _386, _404);
    float _446 = -_118;
    float _448 = fma(_446, _390, _428);
    float _450 = -_118;
    float _452 = fma(_450, _414, _434);
    float _454 = fma(_118, _414, _436);
    float _456 = fma(_118, _390, _430);
    float _458 = -_120;
    float _460 = _122 * _458;
    float _462 = fma(_118, _386, _406);
    float _464 = _118 * _122;
    float _466 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _468 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _470 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _472 = _122 * _120;
    float _474 = fma(_466, _424, _444);
    float _476 = fma(_466, _464, _462);
    float _478 = _440 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = fma(_470, _424, _448);
    float _482 = fma(_468, _460, _474);
    float _484 = fma(_470, _464, _456);
    float _486 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _488 = exp2(_478);
    float _490 = fma(_468, _472, _476);
    float _492 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _494 = fma(_486, _460, _480);
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _498 = fma(_486, _472, _484);
    float _500 = fma(_492, _424, _452);
    float _502 = fma(_492, _464, _454);
    float _504 = _118 * _120;
    float _506 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _508 = fma(_496, _460, _500);
    float _510 = fma(_496, _472, _502);
    float _512 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _514 = in.m_40.x;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = in.m_40.y;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _528 = _488 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _530 = fma(_512, _504, _494);
    float _532 = fma(_512, _504, _498);
    float _534 = fma(_528, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = fma(_506, _504, _482);
    float _540 = fma(_506, _504, _490);
    float _542 = -_536;
    float _544 = _542 + 1.0;
    float _546 = fma(_400, 0.5, 0.5);
    float _548 = fma(_400, -0.5, 0.5);
    float _550 = fma(_526, _504, _508);
    float _552 = fma(_526, _504, _510);
    float _554 = fma(_546, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _556 = abs(_544);
    float _558 = log2(_556);
    float _560 = _120 * (-3.0);
    float _562 = fma(_546, _554, -0.212114393711090087890625);
    float _564 = -_120;
    float _566 = fma(_564, _560, -1.0);
    float _568 = fma(_546, _562, 1.570728778839111328125);
    float _570 = sqrt(_548);
    float _572 = fma(_294, 3.0, -1.0);
    float _574 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _576 = fma(_220, -0.5, 0.5);
    float _578 = fma(_574, _566, _538);
    float _580 = fma(_574, _572, _540);
    float _582 = _558 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _584 = _220 + 1.0;
    float _586 = _98 * _518;
    float _588 = _98 * _524;
    float _590 = exp2(_582);
    float _592 = _570 * 0.636619746685028076171875;
    float _594 = -_568;
    float _596 = fma(_592, _594, 1.0);
    float _598 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _600 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _602 = fma(_598, _566, _530);
    float _604 = fma(_600, _566, _550);
    float _606 = fma(_598, _572, _532);
    float _608 = -_220;
    float _610 = fma(_590, _584, _608);
    float _612 = fma(_610, 0.5, 0.5);
    float2 _2312 = float2(_586, _588);
    float3 _616 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2312, float2(0.0), isnan(_2312))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2312, float2(0.0), isnan(_2312))).xyz;
    float _618 = _616.x;
    float _620 = _616.y;
    float _622 = _616.z;
    float _624 = float(uint(_348));
    float _626 = _624 * 0.00390625;
    float2 _2334 = float2(_340, _342);
    float2 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2334, float2(0.0), isnan(_2334)), level(_626)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2334, float2(0.0), isnan(_2334)), level(_626)).xy;
    float _632 = _630.x;
    float _634 = _630.y;
    float2 _2347 = float2(_596, _576);
    float3 _636 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2347, float2(0.0), isnan(_2347))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2347, float2(0.0), isnan(_2347))).xyz;
    float _638 = _636.x;
    float _640 = _636.y;
    float _642 = _636.z;
    float2 _2361 = float2(_596, _612);
    float3 _644 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2361, float2(0.0), isnan(_2361))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2361, float2(0.0), isnan(_2361))).xyz;
    float _646 = _644.x;
    float _648 = _644.y;
    float _650 = _644.z;
    float2 _2375 = float2(_340, _342);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2375, float2(0.0), isnan(_2375)), level(_626)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2375, float2(0.0), isnan(_2375)), level(_626)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float _663 = fma(_600, _572, _552);
    int _665 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _667 = _665 != 0;
    float _669 = _118 * _118;
    float _671 = -_122;
    float _673 = fma(_671, _122, _669);
    float _675 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _677 = fma(_675, _673, _578);
    float _679 = fma(_675, _673, _580);
    float _681 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _683 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _685 = fma(_681, _673, _602);
    float _687 = fma(_681, _673, _606);
    float _689 = fma(_683, _673, _604);
    float _691 = fma(_683, _673, _663);
    float _693 = -_622;
    float _695 = _693 + 1.0;
    float _697 = _634 * _695;
    float _699 = _697 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _701 = !_667;
    int _703 = _667 ? (-1) : 0;
    int _717;
    int _719;
    int _721;
    int _723;
    int _725;
    int _727;
    if (!_701)
    {
        float _705 = _444 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _707 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _709 = _452 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _711 = _462 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _713 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _715 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _717 = as_type<int>(_711);
        _719 = as_type<int>(_715);
        _721 = as_type<int>(_707);
        _723 = as_type<int>(_705);
        _725 = as_type<int>(_709);
        _727 = as_type<int>(_713);
        _729 = true;
    }
    else
    {
        int _731 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _733 = _731 != 0;
        float _735 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _737 = _685 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _739 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _741 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _743 = _687 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _745 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _747 = as_type<int>(_735);
        int _749 = as_type<int>(_737);
        int _751 = as_type<int>(_739);
        int _753 = as_type<int>(_741);
        int _755 = as_type<int>(_743);
        _703 = _733 ? (-1) : 0;
        _719 = as_type<int>(_745);
        if (_733)
        {
            float _757 = _370 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _747 = as_type<int>(_757);
        }
        int _759 = _747;
        _723 = _759;
        if (_733)
        {
            float _761 = _374 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _749 = as_type<int>(_761);
        }
        int _763 = _749;
        _721 = _763;
        if (_733)
        {
            float _765 = _376 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _751 = as_type<int>(_765);
        }
        int _767 = _751;
        _725 = _767;
        if (_733)
        {
            _753 = _759;
        }
        int _769 = _753;
        _717 = _769;
        if (_733)
        {
            _755 = _763;
        }
        int _771 = _755;
        _727 = _771;
        if (_733)
        {
            _719 = _767;
        }
    }
    _729 = false;
    int _773 = _703;
    int _775 = _717;
    int _777 = _719;
    int _779 = _721;
    int _781 = _723;
    int _783 = _725;
    int _785 = _727;
    int _787 = 0;
    int _789 = _773;
    if (!_90)
    {
        int _791 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _793 = _791 != 0;
        _787 = _793 ? (-1) : 0;
    }
    int _795 = _787;
    float _797 = _558 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_90)
    {
        _789 = -1;
    }
    int _799 = _789;
    int _801 = _799;
    if (!_90)
    {
        int _803 = ~_795;
        bool _805 = !_94;
        int _807 = _803 & (_805 ? (-1) : 0);
        _801 = _807;
    }
    int _809 = _801;
    bool _811 = _96 != 0;
    float _813 = exp2(_797);
    int _815 = _809;
    if (_86)
    {
        _815 = -1;
    }
    int _817 = _815;
    int _819 = ~_809;
    float _821 = (_819 != 0) ? as_type<float>(_775) : 0.0;
    int _823 = _817;
    if (!_86)
    {
        bool _825 = !_94;
        bool _827 = _825 && _82;
        bool _829 = !_811;
        bool _831 = _827 && _829;
        _823 = _831 ? (-1) : 0;
    }
    int _833 = _823;
    float _835 = -_813;
    float _837 = _835 + 1.0;
    int _839 = ~_809;
    float _841 = (_839 != 0) ? as_type<float>(_777) : 0.0;
    float _843 = _837 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _845 = -_843;
    float _847 = _845 + 1.0;
    int _849 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _851 = _849 != 0;
    float _853 = abs(_847);
    float _855 = log2(_853);
    int _857 = ~_833;
    float _859 = (_857 != 0) ? as_type<float>(_779) : 0.0;
    int _861 = ~_833;
    float _863 = (_861 != 0) ? as_type<float>(_781) : 0.0;
    bool _865 = !_94;
    bool _867 = _82 && _865;
    int _869 = ~_833;
    float _871 = (_869 != 0) ? as_type<float>(_783) : 0.0;
    bool _873 = !_851;
    float _875 = _873 ? _632 : 0.0;
    int _877 = ~_809;
    float _879 = (_877 != 0) ? as_type<float>(_785) : 0.0;
    float _881 = _875 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _883 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _885 = _883 != 0;
    bool _887 = !_867;
    float _889 = _887 ? _881 : 0.0;
    float _891 = _875 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _893 = !_885;
    float _895 = _889 * _879;
    bool _897 = !_867;
    float _899 = _897 ? _891 : 0.0;
    float _901 = _889 * _821;
    bool _903 = !_885;
    float _905 = _889 * _841;
    bool _907 = !_893;
    float _909 = _907 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _911 = fma(_859, _899, _895);
    bool _913 = !_885;
    float _915 = fma(_863, _899, _901);
    bool _917 = !_903;
    float _919 = _917 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _921 = fma(_871, _899, _905);
    float _923 = _909 * _911;
    bool _925 = !_913;
    float _927 = _925 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _929 = _855 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _931 = _919 * _915;
    float _933 = _661 * _661;
    float _935 = _923 * 0.715200006961822509765625;
    float _937 = _927 * _921;
    float _939 = _618 * _620;
    float _941 = _933 * _933;
    float _943 = fma(_931, 0.2125999927520751953125, _935);
    float _945 = exp2(_929);
    float _947 = _855 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _949 = _941 * 16.0;
    float _951 = _939 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _953 = fma(_937, 0.072200000286102294921875, _943);
    float _955 = _655 * _949;
    int _957 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _959 = _957 != 0;
    float _961 = exp2(_947);
    float _963 = -_931;
    float _965 = _963 + _953;
    float _967 = -_923;
    float _969 = _967 + _953;
    float _971 = -_937;
    float _973 = _971 + _953;
    float _975 = fma(_951, _965, _931);
    float _977 = fma(_951, _969, _923);
    float _979 = _657 * _949;
    float _981 = _659 * _949;
    bool _983 = !_78;
    float _985 = _983 ? _945 : 1.0;
    float _987 = fma(_951, _973, _937);
    bool _989 = !_959;
    bool _991 = !_959;
    float _993 = _985 * _875;
    float _995 = _985 * _975;
    bool _997 = !_959;
    float _999 = _985 * _977;
    bool _1001 = !_78;
    float _1003 = _1001 ? _961 : 1.0;
    float _1005 = _82 ? _993 : _995;
    float _1007 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1009 = _989 ? _955 : 0.0;
    float _1011 = _991 ? _979 : 0.0;
    float _1013 = _997 ? _981 : 0.0;
    float _1015 = _1003 * _1009;
    float _1017 = _82 ? _993 : _999;
    float _1019 = _993;
    float _1021 = _981;
    float _1023 = _875;
    float _1025 = _985;
    if (!_82)
    {
        float _1027 = _985 * _987;
        _1019 = _1027;
    }
    float _1029 = _1019;
    float _1031 = _1003 * _1011;
    float _1033 = _1003 * _1013;
    float _1035 = _1029 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1037 = fma(_1015, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1007);
    float _1039 = fma(_1033, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1035);
    int _1041 = as_type<int>(_1033);
    float _1043 = _1031;
    float _1045 = _1035;
    if (_78)
    {
        _1041 = as_type<int>(_699);
    }
    int _1047 = _1041;
    float _1049 = _1017 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1051 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1049);
    int _1053 = _1047;
    float _1055 = _1051;
    int _1057 = _1047;
    if (_78)
    {
        _1021 = 0.0;
    }
    float _1059 = _1021;
    float _1061 = _1059;
    if (_78)
    {
        _1023 = 0.0;
    }
    float _1063 = _1023;
    float _1065 = _1063;
    if (_78)
    {
        _1025 = 0.0;
    }
    float _1067 = _1025;
    bool _1069 = !_78;
    float _1071 = _1069 ? _843 : 0.0;
    float _1073 = _1067;
    if (_78)
    {
        _1043 = _1037;
    }
    float _1075 = _1043;
    float _1077 = _1075;
    float _1079 = _1075;
    if (_78)
    {
        _1045 = _1039;
    }
    float _1081 = _1045;
    float _1083 = _1081;
    float _1085 = _1081;
    if (!_78)
    {
        int _1087 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1089 = _1087 != 0;
        float _1091 = _648 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1093 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1095 = _1093 != 0;
        float _1097 = _646 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1099 = _650 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1101 = !_1095;
        float _1103 = _1101 ? _1097 : 0.0;
        bool _1105 = !_1095;
        float _1107 = _1105 ? _1091 : 0.0;
        bool _1109 = !_1095;
        float _1111 = _1109 ? _1099 : 0.0;
        float _1113 = _1071 * _1103;
        _1061 = _1113;
        if (!_1089)
        {
            _1053 = as_type<int>(_699);
        }
        int _1115 = _1053;
        float _1117 = _1071 * _1107;
        _1065 = _1117;
        _1057 = _1115;
        if (!_1089)
        {
            _1077 = _1037;
        }
        float _1119 = _1077;
        float _1121 = _1071 * _1111;
        _1079 = _1119;
        _1073 = _1121;
        if (!_1089)
        {
            _1083 = _1039;
        }
        float _1123 = _1083;
        bool _1125 = !_1089;
        _1085 = _1123;
        if (!_1125)
        {
            float _1127 = -_1071;
            float _1129 = _1127 + 1.0;
            float _1131 = precise::clamp(_1129, 0.0, 1.0);
            float _1133 = _699 * _1131;
            float _1135 = precise::max(_1133, 9.9999997473787516355514526367188e-05);
            float _1137 = 1.0 / _1135;
            float _1139 = _699 * _1137;
            float _1141 = _1037 * _1139;
            float _1143 = _1051 * _1139;
            float _1145 = _1039 * _1139;
            _1055 = _1143;
            _1065 = 0.0;
            _1079 = _1141;
            _1061 = 0.0;
            _1057 = as_type<int>(_1133);
            _1085 = _1145;
            _1073 = 0.0;
        }
    }
    float _1147 = _1055;
    float _1149 = _1065;
    float _1151 = _1079;
    float _1153 = _1061;
    int _1155 = _1057;
    float _1157 = _1085;
    float _1159 = _1073;
    int _1161 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1163 = _1161 != 0;
    int _1165 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1167 = _1165 != 0;
    float _1169 = _640 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1171 = _1147 + _1149;
    float _1173 = _638 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1175 = _1151 + _1153;
    bool _1177 = !_1167;
    float _1179 = _1177 ? as_type<float>(_1155) : 1.0;
    float _1181 = _642 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1183 = _1157 + _1159;
    float _1185 = -_1179;
    float _1187 = _1185 + 1.0;
    float _1189 = abs(_1187);
    float _1191 = log2(_1189);
    float _1193 = _1191 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1195 = exp2(_1193);
    float _1197 = -_1195;
    float _1199 = spvFAdd(_1197, 1.00010001659393310546875);
    float _1201 = -_1195;
    float _1203 = _1201 + 1.0;
    float _1205 = -_1179;
    float _1207 = _1205 + _1203;
    float _1209 = 1.0 / _1199;
    float _1211 = _1207 * _1169;
    float _1213 = _1207 * _1173;
    float _1215 = _1207 * _1181;
    float _1217 = fma(_1171, _1179, _1211);
    float _1219 = fma(_1175, _1179, _1213);
    float _1221 = fma(_1183, _1179, _1215);
    float _1223 = _1209 * _1217;
    float _1225 = _1209 * _1219;
    float _1227 = _1209 * _1221;
    float _1229 = _1223 * 0.715200006961822509765625;
    float _1231 = fma(_1225, 0.2125999927520751953125, _1229);
    float _1233 = fma(_1227, 0.072200000286102294921875, _1231);
    float _1235 = 1.0 / _1233;
    float _1237 = _1235 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1239 = precise::clamp(_1237, 0.0, 1.0);
    float _1241 = fma(_1239, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1243 = _1225 * _1241;
    float _1245 = _1223 * _1241;
    float _1247 = _1227 * _1241;
    bool _1249 = !_1163;
    float _1251 = _1195;
    float _1253 = _1243;
    float _1255 = _1245;
    int _1257 = as_type<int>(_1195);
    int _1259 = as_type<int>(_1243);
    int _1261 = as_type<int>(_1245);
    int _1263 = as_type<int>(_1247);
    if (!_1249)
    {
        bool _1265 = _1203 != 1.0;
        bool _1267 = isnan(_1203);
        bool _1269 = _1265 || _1267;
        bool _1271 = isnan(1.0);
        bool _1273 = _1269 || _1271;
        float _1275 = -_1195;
        bool _1277 = _1275 != (-1.0);
        bool _1279 = isnan(_1275);
        bool _1281 = _1277 || _1279;
        bool _1283 = isnan(-1.0);
        bool _1285 = _1281 || _1283;
        float _1287 = -_1195;
        bool _1289 = _1287 == (-1.0);
        bool _1291 = !_1273;
        bool _1293 = _1289 || _1291;
        bool _1295 = _1203 == 1.0;
        bool _1297 = _1295 && _1285;
        bool _1299 = !_1293;
        float _1301 = _1299 ? _1203 : 0.0;
        bool _1303 = !_1297;
        float _1305 = _1303 ? 0.0 : 1.0;
        float _1307 = _1293 ? 0.0 : 0.5;
        float _1309 = _1301 * 0.715200006961822509765625;
        float _1311 = fma(_1305, 0.2125999927520751953125, _1309);
        float _1313 = fma(_1307, 0.072200000286102294921875, _1311);
        float _1315 = 1.0 / _1313;
        float _1317 = _1315 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1319 = precise::clamp(_1317, 0.0, 1.0);
        float _1321 = fma(_1319, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1323 = _1305 * _1321;
        float _1325 = _1301 * _1321;
        float _1327 = _1307 * _1321;
        out.m_38.x = _1323;
        out.m_38.y = _1325;
        out.m_38.z = _1327;
        out.m_38.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    bool _1329 = _96 != 0;
    bool _1331 = !_1329;
    if (!_1331)
    {
        if (_86)
        {
            _1251 = 0.0;
        }
        float _1333 = _1251;
        float _1335 = _1333;
        if (_86)
        {
            _1253 = 0.0;
        }
        float _1337 = _1253;
        float _1339 = _1337;
        if (!_86)
        {
            float _1341 = _859 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1339 = _1341;
        }
        float _1343 = _1339;
        float _1345 = _1343;
        if (!_86)
        {
            float _1347 = _863 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1335 = _1347;
        }
        float _1349 = _1335;
        float _1351 = _1349;
        if (!_90)
        {
            float _1353 = fma(_879, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1343);
            _1345 = _1353;
        }
        float _1355 = _1345;
        if (_86)
        {
            _1255 = 0.0;
        }
        float _1357 = _1255;
        float _1359 = _1357;
        if (!_86)
        {
            float _1361 = _871 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1359 = _1361;
        }
        float _1363 = _1359;
        float _1365 = _1355 * 0.715200006961822509765625;
        float _1367 = _1363;
        if (!_90)
        {
            float _1369 = fma(_821, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1349);
            _1351 = _1369;
        }
        float _1371 = _1351;
        if (!_90)
        {
            float _1373 = fma(_841, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1363);
            _1367 = _1373;
        }
        float _1375 = _1367;
        float _1377 = fma(_1371, 0.2125999927520751953125, _1365);
        float _1379 = fma(_1375, 0.072200000286102294921875, _1377);
        float _1381 = 1.0 / _1379;
        float _1383 = _1381 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1385 = precise::clamp(_1383, 0.0, 1.0);
        float _1387 = fma(_1385, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1389 = _1387 * _1371;
        float _1391 = _1387 * _1355;
        float _1393 = _1387 * _1375;
        out.m_38.x = _1389;
        out.m_38.y = _1391;
        out.m_38.z = _1393;
        out.m_38.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    if (!_94)
    {
        _1257 = as_type<int>(_1243);
    }
    int _1395 = _1257;
    float _1397 = as_type<float>(_1395);
    if (!_94)
    {
        _1259 = as_type<int>(_1245);
    }
    int _1399 = _1259;
    float _1401 = as_type<float>(_1399);
    if (!_94)
    {
        _1261 = as_type<int>(_1247);
    }
    int _1403 = _1261;
    float _1405 = as_type<float>(_1403);
    if (!_94)
    {
        _1263 = as_type<int>(_1203);
    }
    int _1407 = _1263;
    if (!_94)
    {
        out.m_38.x = as_type<float>(_1395);
        out.m_38.y = as_type<float>(_1399);
        out.m_38.z = as_type<float>(_1403);
        out.m_38.w = as_type<float>(_1407);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    if (_86)
    {
        _1397 = 0.0;
    }
    float _1409 = _1397;
    float _1411 = _1409;
    if (_86)
    {
        _1401 = 0.0;
    }
    float _1413 = _1401;
    float _1415 = _1413;
    if (!_86)
    {
        float _1417 = _859 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1415 = _1417;
    }
    float _1419 = _1415;
    float _1421 = _1419;
    if (!_86)
    {
        float _1423 = _863 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1411 = _1423;
    }
    float _1425 = _1411;
    float _1427 = _1425;
    if (!_90)
    {
        float _1429 = fma(_879, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1419);
        _1421 = _1429;
    }
    float _1431 = _1421;
    if (_86)
    {
        _1405 = 0.0;
    }
    float _1433 = _1405;
    float _1435 = _1433;
    if (!_86)
    {
        float _1437 = _871 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1431 * 0.715200006961822509765625;
    float _1443 = _1439;
    if (!_90)
    {
        float _1445 = fma(_821, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1425);
        _1427 = _1445;
    }
    float _1447 = _1427;
    if (!_90)
    {
        float _1449 = fma(_841, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1439);
        _1443 = _1449;
    }
    float _1451 = _1443;
    float _1453 = fma(_1447, 0.2125999927520751953125, _1441);
    float _1455 = fma(_1451, 0.072200000286102294921875, _1453);
    float _1457 = 1.0 / _1455;
    float _1459 = _1457 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1461 = precise::clamp(_1459, 0.0, 1.0);
    float _1463 = fma(_1461, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1465 = _1463 * _1447;
    float _1467 = _1463 * _1431;
    float _1469 = _1463 * _1451;
    out.m_38.x = _1465;
    out.m_38.y = _1467;
    out.m_38.z = _1469;
    out.m_38.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

