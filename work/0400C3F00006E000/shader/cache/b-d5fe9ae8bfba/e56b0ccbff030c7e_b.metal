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
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_14 [[id(13)]];
    sampler fp_t_tcb_14Smplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_ESmplr_w [[id(17)]];
    sampler fp_t_tcb_CSmplr_w [[id(18)]];
    sampler fp_t_tcb_10Smplr_w [[id(19)]];
    sampler fp_t_tcb_12Smplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _52(thread const int& _3814, thread const int& _3815, thread const int& _3816, thread const int& _3817, thread int& _3818, thread int& _3819, thread int& _3820, thread int& _3821, thread int& _3822, thread int& _3823)
{
    float _3826 = as_type<float>(_3816) + 0.0;
    bool _3828 = _3826 != 0.0;
    bool _3830 = isnan(_3826);
    bool _3832 = _3828 || _3830;
    bool _3834 = isnan(0.0);
    bool _3836 = _3832 || _3834;
    int _3838 = as_type<int>(_3826);
    int _3840 = 0;
    int _3842 = _3814;
    int _3844 = _3836 ? (-1) : 0;
    if (!_3836)
    {
        float _3846 = as_type<float>(_3816) * 1.0;
        _3838 = as_type<int>(_3846);
    }
    int _3848 = _3838;
    bool _3850 = !_3836;
    int _3852 = _3848;
    if (!_3850)
    {
        float _3854 = as_type<float>(_3816) + 0.0;
        bool _3856 = _3854 >= 0.0;
        bool _3858 = isnan(_3854);
        bool _3860 = _3856 || _3858;
        bool _3862 = isnan(0.0);
        bool _3864 = _3860 || _3862;
        int _3866 = as_type<int>(_3854);
        _3844 = _3864 ? (-1) : 0;
        if (!_3864)
        {
            _3866 = 2147483647;
        }
        int _3868 = _3866;
        bool _3870 = !_3864;
        _3852 = _3868;
        if (!_3870)
        {
            float _3872 = abs(as_type<float>(_3816));
            float _3874 = _3872 + 0.0;
            bool _3876 = _3874 > as_type<float>(0x7f800000u /* inf */);
            bool _3878 = isnan(_3874);
            bool _3880 = _3876 || _3878;
            bool _3882 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3884 = _3880 || _3882;
            int _3886 = as_type<int>(_3874);
            _3840 = 2139095040;
            _3844 = _3884 ? (-1) : 0;
            if (_3884)
            {
                float _3888 = as_type<float>(_3816) + 1.0;
                _3886 = as_type<int>(_3888);
            }
            int _3890 = _3886;
            _3852 = _3890;
            if (!_3884)
            {
                float _3892 = abs(as_type<float>(_3816));
                float _3894 = _3892 + (-0.0);
                float _3896 = 0.0 + _3894;
                bool _3898 = _3896 != as_type<float>(0x7f800000u /* inf */);
                bool _3900 = isnan(_3896);
                bool _3902 = _3898 || _3900;
                bool _3904 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3906 = _3902 || _3904;
                int _3908 = as_type<int>(_3896);
                _3844 = _3906 ? (-1) : 0;
                if (!_3906)
                {
                    _3908 = _3816;
                }
                int _3910 = _3908;
                bool _3912 = !_3906;
                _3852 = _3910;
                if (!_3912)
                {
                    float _3914 = as_type<float>(_3816) * 18446744073709551616.0;
                    float _3916 = rsqrt(_3914);
                    float _3918 = _3914 * _3916;
                    float _3920 = _3916 * 0.5;
                    float _3922 = -_3918;
                    float _3924 = 0.0 + _3922;
                    float _3926 = fma(_3920, _3924, 0.5);
                    float _3928 = fma(_3918, _3926, _3918);
                    float _3930 = -_3928;
                    float _3932 = 0.0 + _3930;
                    float _3934 = fma(_3928, _3932, _3914);
                    float _3936 = fma(_3920, _3934, _3928);
                    float _3938 = _3936 * 2.3283064365386962890625e-10;
                    _3852 = as_type<int>(_3938);
                    _3840 = as_type<int>(_3914);
                    _3842 = as_type<int>(_3934);
                }
            }
        }
    }
    int _3940 = _3852;
    int _3942 = _3840;
    int _3944 = _3842;
    int _3946 = _3844;
    _3818 = _3940;
    _3819 = _3942;
    _3820 = _3944;
    _3821 = _3817;
    _3822 = 0;
    _3823 = _3946;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _789 = false;
    bool _272 = false;
    float _56 = gl_FragCoord.w;
    float _58 = in.m_41.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_41.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_41.z;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    int _76 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _80 = _76 != 0;
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _90 = _88 != 0;
    float _92 = precise::max(0.0, _82);
    int _94 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _96 = _94 != 0;
    int _98 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _100 = _98 != 0;
    int _102 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _104 = _102 != 0;
    int _106 = int(_80);
    float _108 = 1.0 / _56;
    float _110 = _108 * _62;
    float _112 = _108 * _68;
    float _114 = _108 * _74;
    float _116 = _110 * _110;
    float _118 = fma(_112, _112, _116);
    float _120 = fma(_114, _114, _118);
    float _122 = rsqrt(_120);
    float _124 = _112 * _122;
    float _126 = _114 * _122;
    float _128 = _110 * _122;
    float _130 = _124 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _134 = -_128;
    float _136 = -_92;
    float _138 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[13].z, _136);
    float _140 = _130 * _130;
    float _142 = _132 * _132;
    float _144 = _140 + _142;
    float _146 = sqrt(_144);
    bool _148 = _146 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _150 = _92;
    float _152 = _122;
    float _154 = _138;
    float _156 = _130;
    float _158 = _132;
    if (!_148)
    {
        _150 = _142;
    }
    float _160 = _150;
    float _162 = _160;
    if (!_148)
    {
        _152 = _140;
    }
    float _164 = _152;
    bool _166 = !_148;
    float _168 = _164;
    if (!_166)
    {
        float _170 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _172 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _174 = _146 + _172;
        float _176 = _138 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _178 = rsqrt(_144);
        float _180 = _174 * _170;
        float _182 = _180 * 0.15915493667125701904296875;
        float _184 = _182 * 6.283185482025146484375;
        float _186 = sin(_184);
        float _188 = _182 * 6.283185482025146484375;
        float _190 = cos(_188);
        float _192 = fma(_186, _176, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _194 = _178 * _192;
        float _196 = _190 + (-1.0);
        float _198 = _130 * _194;
        float _200 = _132 * _194;
        float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _204 = _200 * _200;
        float _206 = fma(_138, _190, _202);
        float _208 = _198 * _198;
        _154 = _206;
        _168 = _208;
        _162 = _204;
        _156 = _198;
        _158 = _200;
    }
    float _210 = _154;
    float _212 = _168;
    float _214 = _162;
    float _216 = _156;
    float _218 = _158;
    float _220 = fma(_210, _210, _212);
    float _222 = _220 + _214;
    float _224 = rsqrt(_222);
    float _226 = _224 * _210;
    float _228 = -_226;
    float _230 = precise::max(0.0, _228);
    float _232 = abs(_230);
    float _234 = -_232;
    float _236 = _234 + 1.0;
    float _238 = fma(_230, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _240 = as_type<int>(_236) + (-218103808);
    float _242 = fma(_230, _238, -0.212114393711090087890625);
    bool _244 = uint(_240) >= 1920991232u;
    float _246 = fma(_230, _242, 1.570728778839111328125);
    bool _248 = !_244;
    float _270;
    if (!_248)
    {
        int _250 = 0;
        int _252 = 0;
        int _254 = as_type<int>(_236);
        int _256 = 1200;
        int _258;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        _52(_250, _252, _254, _256, _258, _260, _262, _264, _266, _268);
        _270 = as_type<float>(_258);
        _272 = true;
    }
    else
    {
        float _274 = rsqrt(_236);
        float _276 = _236 * _274;
        float _278 = _274 * 0.5;
        float _280 = -_276;
        float _282 = 0.0 + _280;
        float _284 = fma(_278, _282, 0.5);
        float _286 = fma(_276, _284, _276);
        float _288 = -_286;
        float _290 = 0.0 + _288;
        float _292 = fma(_286, _290, _236);
        float _294 = fma(_278, _292, _286);
        _270 = _294;
    }
    _272 = false;
    float _296 = _270;
    bool _298 = _226 > 0.0;
    float _300 = _126 * _126;
    float _302 = _124 * _124;
    float _304 = _300 + _302;
    if (_298)
    {
        discard_fragment();
    }
    float _306 = rsqrt(_304);
    float _308 = _246 * _296;
    float _310 = _308 * 0.636619746685028076171875;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = sqrt(_316);
    float _320 = _126 * _306;
    float _322 = _124 * _306;
    float _324 = abs(_320);
    float _326 = abs(_322);
    float _328 = precise::max(_324, _326);
    float _330 = precise::max(_328, 9.9999997473787516355514526367188e-05);
    float _332 = -_318;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _330;
    float _338 = _334 * 0.5;
    float _340 = -_336;
    float _342 = _320 * _340;
    float _344 = _322 * _336;
    float _346 = fma(_342, _338, 0.5);
    float _348 = fma(_344, _338, 0.5);
    if (_298)
    {
        out.m_44.x = 0.0;
        out.m_44.y = 0.0;
        out.m_44.z = 0.0;
        out.m_44.w = 0.0;
        return out;
    }
    float2 _1927;
    _1927.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    _1927.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    float _350 = _1927.x;
    float _352 = _350 * 256.0;
    int _354 = int(_352);
    float _356 = -_128;
    float _358 = _356 + 1.0;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = _224 * _216;
    float _364 = _224 * _218;
    int _366 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _368 = _366 != 0;
    float _370 = -_128;
    float _372 = fma(_370, _128, 1.0);
    float _374 = precise::clamp(_372, 0.0, 1.0);
    int _376 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _378 = _376 != 0;
    float _380 = _362 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _382 = _124 * _128;
    float _384 = -_380;
    float _386 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[11].y, _384);
    float _388 = fma(_300, 3.0, -1.0);
    float _390 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _392 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _394 = _360;
    if (_368)
    {
        float _396 = sqrt(_374);
        _394 = _396;
    }
    float _398 = _394;
    float _400 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _402 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _408 = fma(_128, _400, _390);
    float _410 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _412 = -_364;
    float _414 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _418 = fma(_128, _404, _392);
    float _420 = fma(_128, _410, _402);
    float _422 = -_126;
    float _424 = fma(_422, _406, _408);
    float _426 = fma(_126, _406, _408);
    float _428 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _430 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _432 = -_126;
    float _434 = fma(_432, _416, _418);
    float _436 = abs(_398);
    float _438 = log2(_436);
    float _440 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _442 = fma(_126, _416, _418);
    float _444 = -_124;
    float _446 = fma(_444, _428, _424);
    float _448 = fma(_124, _428, _426);
    float _450 = -_126;
    float _452 = fma(_450, _430, _420);
    float _454 = _126 * (-3.0);
    float _456 = fma(_126, _430, _420);
    float _458 = -_124;
    float _460 = fma(_458, _440, _434);
    float _462 = _124 * _124;
    float _464 = fma(_124, _440, _442);
    float _466 = -_126;
    float _468 = fma(_466, _454, -1.0);
    float _470 = _124 * _126;
    float _472 = -_126;
    float _474 = _128 * _472;
    float _476 = _128 * _126;
    float _478 = -_128;
    float _480 = _124 * _478;
    float _482 = _438 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _484 = -_128;
    float _486 = fma(_484, _128, _462);
    float _488 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _490 = exp2(_482);
    float _492 = -_124;
    float _494 = fma(_492, _488, _452);
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _502 = fma(_124, _488, _456);
    float _504 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _506 = fma(_496, _480, _446);
    float _508 = fma(_498, _480, _460);
    float _510 = fma(_500, _480, _494);
    float _512 = fma(_496, _382, _448);
    float _514 = fma(_498, _382, _464);
    float _516 = fma(_500, _382, _502);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _520 = _490 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _522 = fma(_504, _474, _506);
    float _524 = fma(_504, _476, _512);
    float _526 = fma(_518, _474, _508);
    float _528 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _534 = fma(_518, _476, _514);
    float _536 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _538 = -_530;
    float _540 = _538 + 1.0;
    float _542 = fma(_532, _474, _510);
    float _544 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _546 = fma(_532, _476, _516);
    float _548 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _550 = fma(_536, _470, _522);
    float _552 = abs(_540);
    float _554 = log2(_552);
    float _556 = fma(_544, _470, _542);
    float _558 = fma(_536, _470, _524);
    float _560 = fma(_548, _470, _526);
    float _562 = fma(_548, _470, _534);
    float _564 = fma(_544, _470, _546);
    float _566 = fma(_414, 0.5, 0.5);
    float _568 = fma(_414, -0.5, 0.5);
    float _570 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _572 = fma(_566, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _574 = _554 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _576 = fma(_570, _468, _550);
    float _578 = fma(_570, _388, _558);
    float _580 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _582 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _584 = exp2(_574);
    float _586 = fma(_580, _388, _562);
    float _588 = fma(_582, _388, _564);
    float _590 = _226 + 1.0;
    float _592 = fma(_580, _468, _560);
    float _594 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _596 = fma(_566, _572, -0.212114393711090087890625);
    float _598 = fma(_582, _468, _556);
    float _600 = sqrt(_568);
    float _602 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _604 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _606 = fma(_594, _486, _592);
    float _608 = fma(_566, _596, 1.570728778839111328125);
    float _610 = fma(_602, _486, _576);
    float _612 = fma(_602, _486, _578);
    float _614 = fma(_594, _486, _586);
    float _616 = -_226;
    float _618 = fma(_584, _590, _616);
    float _620 = fma(_604, _486, _598);
    float _622 = fma(_604, _486, _588);
    float _624 = fma(_226, -0.5, 0.5);
    float _626 = fma(_618, 0.5, 0.5);
    float _628 = _600 * 0.636619746685028076171875;
    float _630 = -_608;
    float _632 = fma(_628, _630, 1.0);
    float _634 = float(uint(_354));
    float _636 = _634 * 0.00390625;
    float2 _2397 = float2(_346, _348);
    float4 _639 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2397, float2(0.0), isnan(_2397)), level(_636)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2397, float2(0.0), isnan(_2397)), level(_636)).xyzw;
    float _641 = _639.x;
    float _643 = _639.y;
    float _645 = _639.z;
    float _647 = _639.w;
    float2 _2416 = float2(_346, _348);
    float2 _651 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2416, float2(0.0), isnan(_2416)), level(_636)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2416, float2(0.0), isnan(_2416)), level(_636)).xy;
    float _653 = _651.x;
    float _655 = _651.y;
    float2 _2429 = float2(_346, _348);
    float2 _657 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2429, float2(0.0), isnan(_2429)), level(_636)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2429, float2(0.0), isnan(_2429)), level(_636)).xy;
    float _659 = _657.x;
    float _661 = _657.y;
    float2 _2442 = float2(_346, _348);
    float4 _663 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2442, float2(0.0), isnan(_2442)), level(_636)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2442, float2(0.0), isnan(_2442)), level(_636)).xyzw;
    float _665 = _663.x;
    float _667 = _663.y;
    float _669 = _663.z;
    float _671 = _663.w;
    float2 _2459 = float2(_632, _624);
    float3 _675 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2459, float2(0.0), isnan(_2459))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2459, float2(0.0), isnan(_2459))).xyz;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    float2 _2473 = float2(_632, _626);
    float3 _683 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2473, float2(0.0), isnan(_2473))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2473, float2(0.0), isnan(_2473))).xyz;
    float _685 = _683.x;
    float _687 = _683.y;
    float _689 = _683.z;
    int _691 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _693 = _691 != 0;
    float _695 = _647 * _647;
    float _697 = _695 * _695;
    float _699 = -_655;
    float _701 = _699 + _661;
    float _703 = _671 * _671;
    float _705 = _697 * 16.0;
    float _707 = _703 * _703;
    float _709 = _705 * _655;
    float _711 = fma(_701, (*spvDescriptorSet0.fp_c3)._m0[0].x, _655);
    float _713 = _653 * _655;
    float _715 = _641 * _709;
    float _717 = _643 * _709;
    float _719 = precise::max(_711, 1.52587890625e-05);
    float _721 = -_713;
    float _723 = fma(_659, _661, _721);
    float _725 = _707 * 16.0;
    float _727 = _645 * _709;
    float _729 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _731 = fma(_723, (*spvDescriptorSet0.fp_c3)._m0[0].x, _713);
    float _733 = 1.0 / _719;
    float _735 = _725 * _661;
    float _737 = -_715;
    float _739 = fma(_665, _735, _737);
    float _741 = -_717;
    float _743 = fma(_667, _735, _741);
    float _745 = -_727;
    float _747 = fma(_669, _735, _745);
    float _749 = fma(_739, (*spvDescriptorSet0.fp_c3)._m0[0].x, _715);
    float _751 = fma(_743, (*spvDescriptorSet0.fp_c3)._m0[0].x, _717);
    float _753 = fma(_747, (*spvDescriptorSet0.fp_c3)._m0[0].x, _727);
    float _755 = _731 * _733;
    bool _757 = !_378;
    float _759 = _757 ? _755 : 0.0;
    bool _761 = !_693;
    int _763 = _693 ? (-1) : 0;
    int _777;
    int _779;
    int _781;
    int _783;
    int _785;
    int _787;
    if (!_761)
    {
        float _765 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _767 = _460 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _769 = _494 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _771 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _773 = _464 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _775 = _502 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _777 = as_type<int>(_771);
        _779 = as_type<int>(_773);
        _781 = as_type<int>(_775);
        _783 = as_type<int>(_765);
        _785 = as_type<int>(_767);
        _787 = as_type<int>(_769);
        _789 = true;
    }
    else
    {
        int _791 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _793 = _791 != 0;
        float _795 = _610 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _797 = _606 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _799 = _620 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _801 = _612 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _803 = _614 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _805 = _622 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _807 = as_type<int>(_795);
        int _809 = as_type<int>(_797);
        int _811 = as_type<int>(_799);
        int _813 = as_type<int>(_801);
        int _815 = as_type<int>(_803);
        _763 = _793 ? (-1) : 0;
        _781 = as_type<int>(_805);
        if (_793)
        {
            float _817 = _390 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _807 = as_type<int>(_817);
        }
        int _819 = _807;
        _783 = _819;
        if (_793)
        {
            float _821 = _392 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _809 = as_type<int>(_821);
        }
        int _823 = _809;
        _785 = _823;
        if (_793)
        {
            float _825 = _402 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _811 = as_type<int>(_825);
        }
        int _827 = _811;
        _787 = _827;
        if (_793)
        {
            _813 = _819;
        }
        int _829 = _813;
        _777 = _829;
        if (_793)
        {
            _815 = _823;
        }
        int _831 = _815;
        _779 = _831;
        if (_793)
        {
            _781 = _827;
        }
    }
    _789 = false;
    int _833 = _763;
    int _835 = _777;
    int _837 = _779;
    int _839 = _781;
    int _841 = _783;
    int _843 = _785;
    int _845 = _787;
    float _847 = in.m_46.x;
    float _849 = gl_FragCoord.w;
    float _851 = _847 * _849;
    float _853 = in.m_46.y;
    float _855 = gl_FragCoord.w;
    float _857 = _853 * _855;
    int _859 = 0;
    int _861 = _833;
    if (!_100)
    {
        int _863 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _865 = _863 != 0;
        _859 = _865 ? (-1) : 0;
    }
    int _867 = _859;
    if (_100)
    {
        _861 = -1;
    }
    int _869 = _861;
    int _871 = _869;
    if (!_100)
    {
        int _873 = ~_867;
        bool _875 = !_104;
        int _877 = _873 & (_875 ? (-1) : 0);
        _871 = _877;
    }
    int _879 = _871;
    bool _881 = _106 != 0;
    float _883 = _108 * _851;
    float _885 = _108 * _857;
    float2 _2803 = float2(_883, _885);
    float2 _887 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2803, float2(0.0), isnan(_2803))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2803, float2(0.0), isnan(_2803))).xy;
    float _889 = _887.x;
    float _891 = _887.y;
    float _893 = fma(_889, 2.0, -1.0);
    float _895 = fma(_891, 2.0, -1.0);
    float _897 = fma(_893, (*spvDescriptorSet0.fp_c3)._m0[22].x, _883);
    float _899 = fma(_895, (*spvDescriptorSet0.fp_c3)._m0[22].y, _885);
    float2 _2831 = float2(_897, _899);
    float4 _901 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2831, float2(0.0), isnan(_2831))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2831, float2(0.0), isnan(_2831))).xyzw;
    float _903 = _901.x;
    float _905 = _901.y;
    float _907 = _901.z;
    float _909 = _901.w;
    float _911 = _554 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _913 = _759 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _915 = _759 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _917 = exp2(_911);
    int _919 = _879;
    if (_96)
    {
        _919 = -1;
    }
    int _921 = _919;
    int _923 = ~_879;
    float _925 = (_923 != 0) ? as_type<float>(_835) : 0.0;
    int _927 = _921;
    if (!_96)
    {
        bool _929 = !_104;
        bool _931 = _929 && _90;
        bool _933 = !_881;
        bool _935 = _931 && _933;
        _927 = _935 ? (-1) : 0;
    }
    int _937 = _927;
    float _939 = _749 * _733;
    int _941 = ~_879;
    float _943 = (_941 != 0) ? as_type<float>(_837) : 0.0;
    float _945 = _751 * _733;
    float _947 = _753 * _733;
    int _949 = ~_879;
    float _951 = (_949 != 0) ? as_type<float>(_839) : 0.0;
    float _953 = -_917;
    float _955 = _953 + 1.0;
    float _957 = _955 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _959 = !_104;
    bool _961 = _90 && _959;
    int _963 = ~_937;
    float _965 = (_963 != 0) ? as_type<float>(_841) : 0.0;
    float _967 = -_957;
    float _969 = _967 + 1.0;
    int _971 = ~_937;
    float _973 = (_971 != 0) ? as_type<float>(_843) : 0.0;
    float _975 = abs(_969);
    float _977 = log2(_975);
    int _979 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _981 = _979 != 0;
    bool _983 = !_961;
    int _985 = _983 ? as_type<int>(_913) : 0;
    bool _987 = !_961;
    float _989 = _987 ? _915 : 0.0;
    int _991 = ~_937;
    float _993 = (_991 != 0) ? as_type<float>(_845) : 0.0;
    bool _995 = !_981;
    float _997 = _989 * _925;
    bool _999 = !_981;
    float _1001 = _989 * _943;
    bool _1003 = !_995;
    float _1005 = _1003 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1007 = fma(_965, as_type<float>(_985), _997);
    bool _1009 = !_981;
    int _1011 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1013 = _1011 != 0;
    float _1015 = _977 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1017 = _977 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _1019 = !_999;
    float _1021 = _1019 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1023 = fma(_973, as_type<float>(_985), _1001);
    bool _1025 = !_1009;
    float _1027 = _1025 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1029 = _989 * _951;
    float _1031 = exp2(_1015);
    float _1033 = _1005 * _1007;
    float _1035 = _1021 * _1023;
    float _1037 = fma(_993, as_type<float>(_985), _1029);
    bool _1039 = !_1013;
    float _1041 = exp2(_1017);
    bool _1043 = !_1013;
    float _1045 = _1027 * _1037;
    float _1047 = _1039 ? _947 : 0.0;
    bool _1049 = !_86;
    float _1051 = _1049 ? _1031 : 1.0;
    bool _1053 = !_1013;
    float _1055 = _1043 ? _939 : 0.0;
    float _1057 = _1051 * _1033;
    float _1059 = _759 * _1051;
    bool _1061 = !_86;
    float _1063 = _1061 ? _1041 : 1.0;
    float _1065 = _1051 * _1035;
    int _1067 = _985;
    float _1069 = _1059;
    float _1071 = _1063;
    float _1073 = _1047;
    if (_86)
    {
        _1067 = as_type<int>(_729);
    }
    int _1075 = _1067;
    float _1077 = _1063 * _1055;
    float _1079 = _90 ? _1059 : _1057;
    float _1081 = _1063 * _1047;
    float _1083 = _1053 ? _945 : 0.0;
    float _1085 = _1079 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1087 = _90 ? _1059 : _1065;
    float _1089 = _1085;
    int _1091 = _1075;
    int _1093 = _1075;
    if (!_90)
    {
        float _1095 = _1051 * _1045;
        _1069 = _1095;
    }
    float _1097 = _1069;
    float _1099 = _1063 * _1083;
    float _1101 = _1087 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1103 = _1097 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1105 = fma(_1077, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1085);
    float _1107 = fma(_1099, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1101);
    float _1109 = _1099;
    float _1111 = _1105;
    if (_86)
    {
        _1089 = 0.0;
    }
    float _1113 = _1089;
    float _1115 = fma(_1081, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1103);
    float _1117 = _1113;
    float _1119 = _1115;
    if (_86)
    {
        _1071 = 0.0;
    }
    float _1121 = _1071;
    float _1123 = _1121;
    if (_86)
    {
        _1109 = 0.0;
    }
    float _1125 = _1109;
    bool _1127 = !_86;
    float _1129 = _1127 ? _957 : 0.0;
    float _1131 = _1125;
    if (_86)
    {
        _1073 = _1107;
    }
    float _1133 = _1073;
    float _1135 = _1133;
    float _1137 = _1133;
    if (!_86)
    {
        int _1139 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1141 = _1139 != 0;
        float _1143 = _687 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1145 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1147 = _1145 != 0;
        float _1149 = _685 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1151 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1153 = !_1147;
        float _1155 = _1153 ? _1149 : 0.0;
        bool _1157 = !_1147;
        float _1159 = _1157 ? _1143 : 0.0;
        bool _1161 = !_1147;
        float _1163 = _1161 ? _1151 : 0.0;
        float _1165 = _1129 * _1155;
        _1117 = _1165;
        if (!_1141)
        {
            _1091 = as_type<int>(_729);
        }
        int _1167 = _1091;
        float _1169 = _1129 * _1159;
        float _1171 = _1129 * _1163;
        _1123 = _1169;
        _1093 = _1167;
        _1131 = _1171;
        if (!_1141)
        {
            _1135 = _1107;
        }
        float _1173 = _1135;
        bool _1175 = !_1141;
        _1137 = _1173;
        if (!_1175)
        {
            float _1177 = -_1129;
            float _1179 = _1177 + 1.0;
            float _1181 = precise::clamp(_1179, 0.0, 1.0);
            float _1183 = _729 * _1181;
            float _1185 = precise::max(_1183, 9.9999997473787516355514526367188e-05);
            float _1187 = 1.0 / _1185;
            float _1189 = _729 * _1187;
            float _1191 = _1105 * _1189;
            float _1193 = _1107 * _1189;
            float _1195 = _1115 * _1189;
            _1137 = _1193;
            _1123 = 0.0;
            _1111 = _1191;
            _1117 = 0.0;
            _1093 = as_type<int>(_1183);
            _1119 = _1195;
            _1131 = 0.0;
        }
    }
    float _1197 = _1137;
    float _1199 = _1123;
    float _1201 = _1111;
    float _1203 = _1117;
    int _1205 = _1093;
    float _1207 = _1119;
    float _1209 = _1131;
    int _1211 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1213 = _1211 != 0;
    int _1215 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1217 = _1215 != 0;
    float _1219 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1221 = _1197 + _1199;
    float _1223 = _1201 + _1203;
    float _1225 = _681 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _1227 = !_1217;
    float _1229 = _1227 ? as_type<float>(_1205) : 1.0;
    float _1231 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1233 = _1207 + _1209;
    float _1235 = -_1229;
    float _1237 = _1235 + 1.0;
    float _1239 = abs(_1237);
    float _1241 = log2(_1239);
    float _1243 = _1241 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1245 = exp2(_1243);
    float _1247 = -_1245;
    float _1249 = spvFAdd(_1247, 1.00010001659393310546875);
    float _1251 = -_1245;
    float _1253 = _1251 + 1.0;
    float _1255 = -_1229;
    float _1257 = _1255 + _1253;
    float _1259 = 1.0 / _1249;
    float _1261 = _1231 * _1257;
    float _1263 = _1219 * _1257;
    float _1265 = _1225 * _1257;
    float _1267 = fma(_1221, _1229, _1261);
    float _1269 = fma(_1223, _1229, _1263);
    float _1271 = fma(_1233, _1229, _1265);
    float _1273 = _1259 * _1267;
    float _1275 = _1259 * _1269;
    float _1277 = _1259 * _1271;
    float _1279 = _1273 * 0.715200006961822509765625;
    float _1281 = fma(_1275, 0.2125999927520751953125, _1279);
    float _1283 = fma(_1277, 0.072200000286102294921875, _1281);
    float _1285 = 1.0 / _1283;
    float _1287 = _1285 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1289 = precise::clamp(_1287, 0.0, 1.0);
    float _1291 = fma(_1289, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1293 = _1291 * _909;
    float _1295 = fma(_1275, _1293, _903);
    float _1297 = fma(_1273, _1293, _905);
    float _1299 = fma(_1277, _1293, _907);
    bool _1301 = !_1213;
    float _1303 = _1297;
    float _1305 = _1245;
    float _1307 = _1285;
    int _1309 = as_type<int>(_1273);
    int _1311 = as_type<int>(_1285);
    float _1313 = _1297;
    float _1315 = _1245;
    if (!_1301)
    {
        bool _1317 = _1253 != 1.0;
        bool _1319 = isnan(_1253);
        bool _1321 = _1317 || _1319;
        bool _1323 = isnan(1.0);
        bool _1325 = _1321 || _1323;
        float _1327 = -_1245;
        bool _1329 = _1327 != (-1.0);
        bool _1331 = isnan(_1327);
        bool _1333 = _1329 || _1331;
        bool _1335 = isnan(-1.0);
        bool _1337 = _1333 || _1335;
        float _1339 = -_1245;
        bool _1341 = _1339 == (-1.0);
        bool _1343 = !_1325;
        bool _1345 = _1341 || _1343;
        bool _1347 = _1253 == 1.0;
        bool _1349 = _1347 && _1337;
        bool _1351 = !_1345;
        float _1353 = _1351 ? _1253 : 0.0;
        bool _1355 = !_1349;
        float _1357 = _1355 ? 0.0 : 1.0;
        float _1359 = _1345 ? 0.0 : 0.5;
        float _1361 = _1353 * 0.715200006961822509765625;
        float _1363 = fma(_1357, 0.2125999927520751953125, _1361);
        float _1365 = fma(_1359, 0.072200000286102294921875, _1363);
        float _1367 = 1.0 / _1365;
        float _1369 = _1367 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1371 = precise::clamp(_1369, 0.0, 1.0);
        float _1373 = fma(_1371, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1375 = _1357 * _1373;
        float _1377 = _1353 * _1373;
        float _1379 = _1359 * _1373;
        out.m_44.x = _1375;
        out.m_44.y = _1377;
        out.m_44.z = _1379;
        out.m_44.w = 1.0;
        return out;
    }
    bool _1381 = _106 != 0;
    bool _1383 = !_1381;
    if (!_1383)
    {
        if (_96)
        {
            _1303 = 0.0;
        }
        float _1385 = _1303;
        float _1387 = _1385;
        if (_96)
        {
            _1305 = 0.0;
        }
        float _1389 = _1305;
        float _1391 = _1389;
        if (!_96)
        {
            float _1393 = _973 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1391 = _1393;
        }
        float _1395 = _1391;
        float _1397 = _1395;
        if (!_96)
        {
            float _1399 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1387 = _1399;
        }
        float _1401 = _1387;
        float _1403 = _1401;
        if (!_100)
        {
            float _1405 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1395);
            _1397 = _1405;
        }
        float _1407 = _1397;
        if (_96)
        {
            _1307 = 0.0;
        }
        float _1409 = _1307;
        float _1411 = _1409;
        if (!_96)
        {
            float _1413 = _993 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1411 = _1413;
        }
        float _1415 = _1411;
        float _1417 = _1407 * 0.715200006961822509765625;
        float _1419 = _1415;
        if (!_100)
        {
            float _1421 = fma(_925, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1401);
            _1403 = _1421;
        }
        float _1423 = _1403;
        if (!_100)
        {
            float _1425 = fma(_951, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1415);
            _1419 = _1425;
        }
        float _1427 = _1419;
        float _1429 = fma(_1423, 0.2125999927520751953125, _1417);
        float _1431 = fma(_1427, 0.072200000286102294921875, _1429);
        float _1433 = 1.0 / _1431;
        float _1435 = _1433 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        float _1439 = fma(_1437, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1441 = _1439 * _1423;
        float _1443 = _1439 * _1407;
        float _1445 = _1439 * _1427;
        out.m_44.x = _1441;
        out.m_44.y = _1443;
        out.m_44.z = _1445;
        out.m_44.w = 1.0;
        return out;
    }
    if (!_104)
    {
        _1309 = as_type<int>(_1295);
    }
    int _1447 = _1309;
    if (!_104)
    {
        _1311 = as_type<int>(_1299);
    }
    int _1449 = _1311;
    float _1451 = as_type<float>(_1449);
    if (!_104)
    {
        out.m_44.x = as_type<float>(_1447);
        out.m_44.y = _1297;
        out.m_44.z = as_type<float>(_1449);
        out.m_44.w = _1253;
        return out;
    }
    if (_96)
    {
        _1313 = 0.0;
    }
    float _1453 = _1313;
    float _1455 = _1453;
    if (_96)
    {
        _1315 = 0.0;
    }
    float _1457 = _1315;
    float _1459 = _1457;
    if (!_96)
    {
        float _1461 = _973 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1459 = _1461;
    }
    float _1463 = _1459;
    float _1465 = _1463;
    if (!_96)
    {
        float _1467 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1455 = _1467;
    }
    float _1469 = _1455;
    float _1471 = _1469;
    if (!_100)
    {
        float _1473 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1463);
        _1465 = _1473;
    }
    float _1475 = _1465;
    if (_96)
    {
        _1451 = 0.0;
    }
    float _1477 = _1451;
    float _1479 = _1477;
    if (!_96)
    {
        float _1481 = _993 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1479 = _1481;
    }
    float _1483 = _1479;
    float _1485 = _1475 * 0.715200006961822509765625;
    float _1487 = _1483;
    if (!_100)
    {
        float _1489 = fma(_925, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1469);
        _1471 = _1489;
    }
    float _1491 = _1471;
    if (!_100)
    {
        float _1493 = fma(_951, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1483);
        _1487 = _1493;
    }
    float _1495 = _1487;
    float _1497 = fma(_1491, 0.2125999927520751953125, _1485);
    float _1499 = fma(_1495, 0.072200000286102294921875, _1497);
    float _1501 = 1.0 / _1499;
    float _1503 = _1501 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1505 = precise::clamp(_1503, 0.0, 1.0);
    float _1507 = fma(_1505, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1509 = _1507 * _1491;
    float _1511 = _1507 * _1475;
    float _1513 = _1507 * _1495;
    out.m_44.x = _1509;
    out.m_44.y = _1511;
    out.m_44.z = _1513;
    out.m_44.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_44 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _789 = false;
    bool _272 = false;
    float _56 = gl_FragCoord.w;
    float _58 = in.m_41.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_41.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_41.z;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    int _76 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _80 = _76 != 0;
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _90 = _88 != 0;
    float _92 = precise::max(0.0, _82);
    int _94 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _96 = _94 != 0;
    int _98 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _100 = _98 != 0;
    int _102 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _104 = _102 != 0;
    int _106 = int(_80);
    float _108 = 1.0 / _56;
    float _110 = _108 * _62;
    float _112 = _108 * _68;
    float _114 = _108 * _74;
    float _116 = _110 * _110;
    float _118 = fma(_112, _112, _116);
    float _120 = fma(_114, _114, _118);
    float _122 = rsqrt(_120);
    float _124 = _112 * _122;
    float _126 = _114 * _122;
    float _128 = _110 * _122;
    float _130 = _124 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _134 = -_128;
    float _136 = -_92;
    float _138 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[13].z, _136);
    float _140 = _130 * _130;
    float _142 = _132 * _132;
    float _144 = _140 + _142;
    float _146 = sqrt(_144);
    bool _148 = _146 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _150 = _92;
    float _152 = _122;
    float _154 = _138;
    float _156 = _130;
    float _158 = _132;
    if (!_148)
    {
        _150 = _142;
    }
    float _160 = _150;
    float _162 = _160;
    if (!_148)
    {
        _152 = _140;
    }
    float _164 = _152;
    bool _166 = !_148;
    float _168 = _164;
    if (!_166)
    {
        float _170 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _172 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _174 = _146 + _172;
        float _176 = _138 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _178 = rsqrt(_144);
        float _180 = _174 * _170;
        float _182 = _180 * 0.15915493667125701904296875;
        float _184 = _182 * 6.283185482025146484375;
        float _186 = sin(_184);
        float _188 = _182 * 6.283185482025146484375;
        float _190 = cos(_188);
        float _192 = fma(_186, _176, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _194 = _178 * _192;
        float _196 = _190 + (-1.0);
        float _198 = _130 * _194;
        float _200 = _132 * _194;
        float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _204 = _200 * _200;
        float _206 = fma(_138, _190, _202);
        float _208 = _198 * _198;
        _154 = _206;
        _168 = _208;
        _162 = _204;
        _156 = _198;
        _158 = _200;
    }
    float _210 = _154;
    float _212 = _168;
    float _214 = _162;
    float _216 = _156;
    float _218 = _158;
    float _220 = fma(_210, _210, _212);
    float _222 = _220 + _214;
    float _224 = rsqrt(_222);
    float _226 = _224 * _210;
    float _228 = -_226;
    float _230 = precise::max(0.0, _228);
    float _232 = abs(_230);
    float _234 = -_232;
    float _236 = _234 + 1.0;
    float _238 = fma(_230, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _240 = as_type<int>(_236) + (-218103808);
    float _242 = fma(_230, _238, -0.212114393711090087890625);
    bool _244 = uint(_240) >= 1920991232u;
    float _246 = fma(_230, _242, 1.570728778839111328125);
    bool _248 = !_244;
    float _270;
    if (!_248)
    {
        int _250 = 0;
        int _252 = 0;
        int _254 = as_type<int>(_236);
        int _256 = 1200;
        int _258;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        _52(_250, _252, _254, _256, _258, _260, _262, _264, _266, _268);
        _270 = as_type<float>(_258);
        _272 = true;
    }
    else
    {
        float _274 = rsqrt(_236);
        float _276 = _236 * _274;
        float _278 = _274 * 0.5;
        float _280 = -_276;
        float _282 = 0.0 + _280;
        float _284 = fma(_278, _282, 0.5);
        float _286 = fma(_276, _284, _276);
        float _288 = -_286;
        float _290 = 0.0 + _288;
        float _292 = fma(_286, _290, _236);
        float _294 = fma(_278, _292, _286);
        _270 = _294;
    }
    _272 = false;
    float _296 = _270;
    bool _298 = _226 > 0.0;
    float _300 = _126 * _126;
    float _302 = _124 * _124;
    float _304 = _300 + _302;
    if (_298)
    {
        discard_fragment();
    }
    float _306 = rsqrt(_304);
    float _308 = _246 * _296;
    float _310 = _308 * 0.636619746685028076171875;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = sqrt(_316);
    float _320 = _126 * _306;
    float _322 = _124 * _306;
    float _324 = abs(_320);
    float _326 = abs(_322);
    float _328 = precise::max(_324, _326);
    float _330 = precise::max(_328, 9.9999997473787516355514526367188e-05);
    float _332 = -_318;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _330;
    float _338 = _334 * 0.5;
    float _340 = -_336;
    float _342 = _320 * _340;
    float _344 = _322 * _336;
    float _346 = fma(_342, _338, 0.5);
    float _348 = fma(_344, _338, 0.5);
    if (_298)
    {
        out.m_44.x = 0.0;
        out.m_44.y = 0.0;
        out.m_44.z = 0.0;
        out.m_44.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_44)};
    }
    float2 _1927;
    _1927.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    _1927.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    float _350 = _1927.x;
    float _352 = _350 * 256.0;
    int _354 = int(_352);
    float _356 = -_128;
    float _358 = _356 + 1.0;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = _224 * _216;
    float _364 = _224 * _218;
    int _366 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _368 = _366 != 0;
    float _370 = -_128;
    float _372 = fma(_370, _128, 1.0);
    float _374 = precise::clamp(_372, 0.0, 1.0);
    int _376 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _378 = _376 != 0;
    float _380 = _362 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _382 = _124 * _128;
    float _384 = -_380;
    float _386 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[11].y, _384);
    float _388 = fma(_300, 3.0, -1.0);
    float _390 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _392 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _394 = _360;
    if (_368)
    {
        float _396 = sqrt(_374);
        _394 = _396;
    }
    float _398 = _394;
    float _400 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _402 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _408 = fma(_128, _400, _390);
    float _410 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _412 = -_364;
    float _414 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _418 = fma(_128, _404, _392);
    float _420 = fma(_128, _410, _402);
    float _422 = -_126;
    float _424 = fma(_422, _406, _408);
    float _426 = fma(_126, _406, _408);
    float _428 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _430 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _432 = -_126;
    float _434 = fma(_432, _416, _418);
    float _436 = abs(_398);
    float _438 = log2(_436);
    float _440 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _442 = fma(_126, _416, _418);
    float _444 = -_124;
    float _446 = fma(_444, _428, _424);
    float _448 = fma(_124, _428, _426);
    float _450 = -_126;
    float _452 = fma(_450, _430, _420);
    float _454 = _126 * (-3.0);
    float _456 = fma(_126, _430, _420);
    float _458 = -_124;
    float _460 = fma(_458, _440, _434);
    float _462 = _124 * _124;
    float _464 = fma(_124, _440, _442);
    float _466 = -_126;
    float _468 = fma(_466, _454, -1.0);
    float _470 = _124 * _126;
    float _472 = -_126;
    float _474 = _128 * _472;
    float _476 = _128 * _126;
    float _478 = -_128;
    float _480 = _124 * _478;
    float _482 = _438 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _484 = -_128;
    float _486 = fma(_484, _128, _462);
    float _488 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _490 = exp2(_482);
    float _492 = -_124;
    float _494 = fma(_492, _488, _452);
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _502 = fma(_124, _488, _456);
    float _504 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _506 = fma(_496, _480, _446);
    float _508 = fma(_498, _480, _460);
    float _510 = fma(_500, _480, _494);
    float _512 = fma(_496, _382, _448);
    float _514 = fma(_498, _382, _464);
    float _516 = fma(_500, _382, _502);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _520 = _490 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _522 = fma(_504, _474, _506);
    float _524 = fma(_504, _476, _512);
    float _526 = fma(_518, _474, _508);
    float _528 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _534 = fma(_518, _476, _514);
    float _536 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _538 = -_530;
    float _540 = _538 + 1.0;
    float _542 = fma(_532, _474, _510);
    float _544 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _546 = fma(_532, _476, _516);
    float _548 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _550 = fma(_536, _470, _522);
    float _552 = abs(_540);
    float _554 = log2(_552);
    float _556 = fma(_544, _470, _542);
    float _558 = fma(_536, _470, _524);
    float _560 = fma(_548, _470, _526);
    float _562 = fma(_548, _470, _534);
    float _564 = fma(_544, _470, _546);
    float _566 = fma(_414, 0.5, 0.5);
    float _568 = fma(_414, -0.5, 0.5);
    float _570 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _572 = fma(_566, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _574 = _554 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _576 = fma(_570, _468, _550);
    float _578 = fma(_570, _388, _558);
    float _580 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _582 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _584 = exp2(_574);
    float _586 = fma(_580, _388, _562);
    float _588 = fma(_582, _388, _564);
    float _590 = _226 + 1.0;
    float _592 = fma(_580, _468, _560);
    float _594 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _596 = fma(_566, _572, -0.212114393711090087890625);
    float _598 = fma(_582, _468, _556);
    float _600 = sqrt(_568);
    float _602 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _604 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _606 = fma(_594, _486, _592);
    float _608 = fma(_566, _596, 1.570728778839111328125);
    float _610 = fma(_602, _486, _576);
    float _612 = fma(_602, _486, _578);
    float _614 = fma(_594, _486, _586);
    float _616 = -_226;
    float _618 = fma(_584, _590, _616);
    float _620 = fma(_604, _486, _598);
    float _622 = fma(_604, _486, _588);
    float _624 = fma(_226, -0.5, 0.5);
    float _626 = fma(_618, 0.5, 0.5);
    float _628 = _600 * 0.636619746685028076171875;
    float _630 = -_608;
    float _632 = fma(_628, _630, 1.0);
    float _634 = float(uint(_354));
    float _636 = _634 * 0.00390625;
    float2 _2397 = float2(_346, _348);
    float4 _639 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2397, float2(0.0), isnan(_2397)), level(_636)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2397, float2(0.0), isnan(_2397)), level(_636)).xyzw;
    float _641 = _639.x;
    float _643 = _639.y;
    float _645 = _639.z;
    float _647 = _639.w;
    float2 _2416 = float2(_346, _348);
    float2 _651 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2416, float2(0.0), isnan(_2416)), level(_636)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2416, float2(0.0), isnan(_2416)), level(_636)).xy;
    float _653 = _651.x;
    float _655 = _651.y;
    float2 _2429 = float2(_346, _348);
    float2 _657 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2429, float2(0.0), isnan(_2429)), level(_636)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2429, float2(0.0), isnan(_2429)), level(_636)).xy;
    float _659 = _657.x;
    float _661 = _657.y;
    float2 _2442 = float2(_346, _348);
    float4 _663 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2442, float2(0.0), isnan(_2442)), level(_636)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2442, float2(0.0), isnan(_2442)), level(_636)).xyzw;
    float _665 = _663.x;
    float _667 = _663.y;
    float _669 = _663.z;
    float _671 = _663.w;
    float2 _2459 = float2(_632, _624);
    float3 _675 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2459, float2(0.0), isnan(_2459))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2459, float2(0.0), isnan(_2459))).xyz;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    float2 _2473 = float2(_632, _626);
    float3 _683 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2473, float2(0.0), isnan(_2473))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2473, float2(0.0), isnan(_2473))).xyz;
    float _685 = _683.x;
    float _687 = _683.y;
    float _689 = _683.z;
    int _691 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _693 = _691 != 0;
    float _695 = _647 * _647;
    float _697 = _695 * _695;
    float _699 = -_655;
    float _701 = _699 + _661;
    float _703 = _671 * _671;
    float _705 = _697 * 16.0;
    float _707 = _703 * _703;
    float _709 = _705 * _655;
    float _711 = fma(_701, (*spvDescriptorSet0.fp_c3)._m0[0].x, _655);
    float _713 = _653 * _655;
    float _715 = _641 * _709;
    float _717 = _643 * _709;
    float _719 = precise::max(_711, 1.52587890625e-05);
    float _721 = -_713;
    float _723 = fma(_659, _661, _721);
    float _725 = _707 * 16.0;
    float _727 = _645 * _709;
    float _729 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _731 = fma(_723, (*spvDescriptorSet0.fp_c3)._m0[0].x, _713);
    float _733 = 1.0 / _719;
    float _735 = _725 * _661;
    float _737 = -_715;
    float _739 = fma(_665, _735, _737);
    float _741 = -_717;
    float _743 = fma(_667, _735, _741);
    float _745 = -_727;
    float _747 = fma(_669, _735, _745);
    float _749 = fma(_739, (*spvDescriptorSet0.fp_c3)._m0[0].x, _715);
    float _751 = fma(_743, (*spvDescriptorSet0.fp_c3)._m0[0].x, _717);
    float _753 = fma(_747, (*spvDescriptorSet0.fp_c3)._m0[0].x, _727);
    float _755 = _731 * _733;
    bool _757 = !_378;
    float _759 = _757 ? _755 : 0.0;
    bool _761 = !_693;
    int _763 = _693 ? (-1) : 0;
    int _777;
    int _779;
    int _781;
    int _783;
    int _785;
    int _787;
    if (!_761)
    {
        float _765 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _767 = _460 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _769 = _494 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _771 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _773 = _464 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _775 = _502 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _777 = as_type<int>(_771);
        _779 = as_type<int>(_773);
        _781 = as_type<int>(_775);
        _783 = as_type<int>(_765);
        _785 = as_type<int>(_767);
        _787 = as_type<int>(_769);
        _789 = true;
    }
    else
    {
        int _791 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _793 = _791 != 0;
        float _795 = _610 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _797 = _606 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _799 = _620 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _801 = _612 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _803 = _614 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _805 = _622 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _807 = as_type<int>(_795);
        int _809 = as_type<int>(_797);
        int _811 = as_type<int>(_799);
        int _813 = as_type<int>(_801);
        int _815 = as_type<int>(_803);
        _763 = _793 ? (-1) : 0;
        _781 = as_type<int>(_805);
        if (_793)
        {
            float _817 = _390 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _807 = as_type<int>(_817);
        }
        int _819 = _807;
        _783 = _819;
        if (_793)
        {
            float _821 = _392 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _809 = as_type<int>(_821);
        }
        int _823 = _809;
        _785 = _823;
        if (_793)
        {
            float _825 = _402 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _811 = as_type<int>(_825);
        }
        int _827 = _811;
        _787 = _827;
        if (_793)
        {
            _813 = _819;
        }
        int _829 = _813;
        _777 = _829;
        if (_793)
        {
            _815 = _823;
        }
        int _831 = _815;
        _779 = _831;
        if (_793)
        {
            _781 = _827;
        }
    }
    _789 = false;
    int _833 = _763;
    int _835 = _777;
    int _837 = _779;
    int _839 = _781;
    int _841 = _783;
    int _843 = _785;
    int _845 = _787;
    float _847 = in.m_46.x;
    float _849 = gl_FragCoord.w;
    float _851 = _847 * _849;
    float _853 = in.m_46.y;
    float _855 = gl_FragCoord.w;
    float _857 = _853 * _855;
    int _859 = 0;
    int _861 = _833;
    if (!_100)
    {
        int _863 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _865 = _863 != 0;
        _859 = _865 ? (-1) : 0;
    }
    int _867 = _859;
    if (_100)
    {
        _861 = -1;
    }
    int _869 = _861;
    int _871 = _869;
    if (!_100)
    {
        int _873 = ~_867;
        bool _875 = !_104;
        int _877 = _873 & (_875 ? (-1) : 0);
        _871 = _877;
    }
    int _879 = _871;
    bool _881 = _106 != 0;
    float _883 = _108 * _851;
    float _885 = _108 * _857;
    float2 _2803 = float2(_883, _885);
    float2 _887 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2803, float2(0.0), isnan(_2803))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2803, float2(0.0), isnan(_2803))).xy;
    float _889 = _887.x;
    float _891 = _887.y;
    float _893 = fma(_889, 2.0, -1.0);
    float _895 = fma(_891, 2.0, -1.0);
    float _897 = fma(_893, (*spvDescriptorSet0.fp_c3)._m0[22].x, _883);
    float _899 = fma(_895, (*spvDescriptorSet0.fp_c3)._m0[22].y, _885);
    float2 _2831 = float2(_897, _899);
    float4 _901 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2831, float2(0.0), isnan(_2831))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2831, float2(0.0), isnan(_2831))).xyzw;
    float _903 = _901.x;
    float _905 = _901.y;
    float _907 = _901.z;
    float _909 = _901.w;
    float _911 = _554 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _913 = _759 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _915 = _759 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _917 = exp2(_911);
    int _919 = _879;
    if (_96)
    {
        _919 = -1;
    }
    int _921 = _919;
    int _923 = ~_879;
    float _925 = (_923 != 0) ? as_type<float>(_835) : 0.0;
    int _927 = _921;
    if (!_96)
    {
        bool _929 = !_104;
        bool _931 = _929 && _90;
        bool _933 = !_881;
        bool _935 = _931 && _933;
        _927 = _935 ? (-1) : 0;
    }
    int _937 = _927;
    float _939 = _749 * _733;
    int _941 = ~_879;
    float _943 = (_941 != 0) ? as_type<float>(_837) : 0.0;
    float _945 = _751 * _733;
    float _947 = _753 * _733;
    int _949 = ~_879;
    float _951 = (_949 != 0) ? as_type<float>(_839) : 0.0;
    float _953 = -_917;
    float _955 = _953 + 1.0;
    float _957 = _955 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _959 = !_104;
    bool _961 = _90 && _959;
    int _963 = ~_937;
    float _965 = (_963 != 0) ? as_type<float>(_841) : 0.0;
    float _967 = -_957;
    float _969 = _967 + 1.0;
    int _971 = ~_937;
    float _973 = (_971 != 0) ? as_type<float>(_843) : 0.0;
    float _975 = abs(_969);
    float _977 = log2(_975);
    int _979 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _981 = _979 != 0;
    bool _983 = !_961;
    int _985 = _983 ? as_type<int>(_913) : 0;
    bool _987 = !_961;
    float _989 = _987 ? _915 : 0.0;
    int _991 = ~_937;
    float _993 = (_991 != 0) ? as_type<float>(_845) : 0.0;
    bool _995 = !_981;
    float _997 = _989 * _925;
    bool _999 = !_981;
    float _1001 = _989 * _943;
    bool _1003 = !_995;
    float _1005 = _1003 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1007 = fma(_965, as_type<float>(_985), _997);
    bool _1009 = !_981;
    int _1011 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1013 = _1011 != 0;
    float _1015 = _977 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1017 = _977 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _1019 = !_999;
    float _1021 = _1019 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1023 = fma(_973, as_type<float>(_985), _1001);
    bool _1025 = !_1009;
    float _1027 = _1025 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1029 = _989 * _951;
    float _1031 = exp2(_1015);
    float _1033 = _1005 * _1007;
    float _1035 = _1021 * _1023;
    float _1037 = fma(_993, as_type<float>(_985), _1029);
    bool _1039 = !_1013;
    float _1041 = exp2(_1017);
    bool _1043 = !_1013;
    float _1045 = _1027 * _1037;
    float _1047 = _1039 ? _947 : 0.0;
    bool _1049 = !_86;
    float _1051 = _1049 ? _1031 : 1.0;
    bool _1053 = !_1013;
    float _1055 = _1043 ? _939 : 0.0;
    float _1057 = _1051 * _1033;
    float _1059 = _759 * _1051;
    bool _1061 = !_86;
    float _1063 = _1061 ? _1041 : 1.0;
    float _1065 = _1051 * _1035;
    int _1067 = _985;
    float _1069 = _1059;
    float _1071 = _1063;
    float _1073 = _1047;
    if (_86)
    {
        _1067 = as_type<int>(_729);
    }
    int _1075 = _1067;
    float _1077 = _1063 * _1055;
    float _1079 = _90 ? _1059 : _1057;
    float _1081 = _1063 * _1047;
    float _1083 = _1053 ? _945 : 0.0;
    float _1085 = _1079 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1087 = _90 ? _1059 : _1065;
    float _1089 = _1085;
    int _1091 = _1075;
    int _1093 = _1075;
    if (!_90)
    {
        float _1095 = _1051 * _1045;
        _1069 = _1095;
    }
    float _1097 = _1069;
    float _1099 = _1063 * _1083;
    float _1101 = _1087 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1103 = _1097 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1105 = fma(_1077, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1085);
    float _1107 = fma(_1099, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1101);
    float _1109 = _1099;
    float _1111 = _1105;
    if (_86)
    {
        _1089 = 0.0;
    }
    float _1113 = _1089;
    float _1115 = fma(_1081, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1103);
    float _1117 = _1113;
    float _1119 = _1115;
    if (_86)
    {
        _1071 = 0.0;
    }
    float _1121 = _1071;
    float _1123 = _1121;
    if (_86)
    {
        _1109 = 0.0;
    }
    float _1125 = _1109;
    bool _1127 = !_86;
    float _1129 = _1127 ? _957 : 0.0;
    float _1131 = _1125;
    if (_86)
    {
        _1073 = _1107;
    }
    float _1133 = _1073;
    float _1135 = _1133;
    float _1137 = _1133;
    if (!_86)
    {
        int _1139 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1141 = _1139 != 0;
        float _1143 = _687 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1145 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1147 = _1145 != 0;
        float _1149 = _685 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1151 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1153 = !_1147;
        float _1155 = _1153 ? _1149 : 0.0;
        bool _1157 = !_1147;
        float _1159 = _1157 ? _1143 : 0.0;
        bool _1161 = !_1147;
        float _1163 = _1161 ? _1151 : 0.0;
        float _1165 = _1129 * _1155;
        _1117 = _1165;
        if (!_1141)
        {
            _1091 = as_type<int>(_729);
        }
        int _1167 = _1091;
        float _1169 = _1129 * _1159;
        float _1171 = _1129 * _1163;
        _1123 = _1169;
        _1093 = _1167;
        _1131 = _1171;
        if (!_1141)
        {
            _1135 = _1107;
        }
        float _1173 = _1135;
        bool _1175 = !_1141;
        _1137 = _1173;
        if (!_1175)
        {
            float _1177 = -_1129;
            float _1179 = _1177 + 1.0;
            float _1181 = precise::clamp(_1179, 0.0, 1.0);
            float _1183 = _729 * _1181;
            float _1185 = precise::max(_1183, 9.9999997473787516355514526367188e-05);
            float _1187 = 1.0 / _1185;
            float _1189 = _729 * _1187;
            float _1191 = _1105 * _1189;
            float _1193 = _1107 * _1189;
            float _1195 = _1115 * _1189;
            _1137 = _1193;
            _1123 = 0.0;
            _1111 = _1191;
            _1117 = 0.0;
            _1093 = as_type<int>(_1183);
            _1119 = _1195;
            _1131 = 0.0;
        }
    }
    float _1197 = _1137;
    float _1199 = _1123;
    float _1201 = _1111;
    float _1203 = _1117;
    int _1205 = _1093;
    float _1207 = _1119;
    float _1209 = _1131;
    int _1211 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1213 = _1211 != 0;
    int _1215 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1217 = _1215 != 0;
    float _1219 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1221 = _1197 + _1199;
    float _1223 = _1201 + _1203;
    float _1225 = _681 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _1227 = !_1217;
    float _1229 = _1227 ? as_type<float>(_1205) : 1.0;
    float _1231 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1233 = _1207 + _1209;
    float _1235 = -_1229;
    float _1237 = _1235 + 1.0;
    float _1239 = abs(_1237);
    float _1241 = log2(_1239);
    float _1243 = _1241 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1245 = exp2(_1243);
    float _1247 = -_1245;
    float _1249 = spvFAdd(_1247, 1.00010001659393310546875);
    float _1251 = -_1245;
    float _1253 = _1251 + 1.0;
    float _1255 = -_1229;
    float _1257 = _1255 + _1253;
    float _1259 = 1.0 / _1249;
    float _1261 = _1231 * _1257;
    float _1263 = _1219 * _1257;
    float _1265 = _1225 * _1257;
    float _1267 = fma(_1221, _1229, _1261);
    float _1269 = fma(_1223, _1229, _1263);
    float _1271 = fma(_1233, _1229, _1265);
    float _1273 = _1259 * _1267;
    float _1275 = _1259 * _1269;
    float _1277 = _1259 * _1271;
    float _1279 = _1273 * 0.715200006961822509765625;
    float _1281 = fma(_1275, 0.2125999927520751953125, _1279);
    float _1283 = fma(_1277, 0.072200000286102294921875, _1281);
    float _1285 = 1.0 / _1283;
    float _1287 = _1285 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1289 = precise::clamp(_1287, 0.0, 1.0);
    float _1291 = fma(_1289, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1293 = _1291 * _909;
    float _1295 = fma(_1275, _1293, _903);
    float _1297 = fma(_1273, _1293, _905);
    float _1299 = fma(_1277, _1293, _907);
    bool _1301 = !_1213;
    float _1303 = _1297;
    float _1305 = _1245;
    float _1307 = _1285;
    int _1309 = as_type<int>(_1273);
    int _1311 = as_type<int>(_1285);
    float _1313 = _1297;
    float _1315 = _1245;
    if (!_1301)
    {
        bool _1317 = _1253 != 1.0;
        bool _1319 = isnan(_1253);
        bool _1321 = _1317 || _1319;
        bool _1323 = isnan(1.0);
        bool _1325 = _1321 || _1323;
        float _1327 = -_1245;
        bool _1329 = _1327 != (-1.0);
        bool _1331 = isnan(_1327);
        bool _1333 = _1329 || _1331;
        bool _1335 = isnan(-1.0);
        bool _1337 = _1333 || _1335;
        float _1339 = -_1245;
        bool _1341 = _1339 == (-1.0);
        bool _1343 = !_1325;
        bool _1345 = _1341 || _1343;
        bool _1347 = _1253 == 1.0;
        bool _1349 = _1347 && _1337;
        bool _1351 = !_1345;
        float _1353 = _1351 ? _1253 : 0.0;
        bool _1355 = !_1349;
        float _1357 = _1355 ? 0.0 : 1.0;
        float _1359 = _1345 ? 0.0 : 0.5;
        float _1361 = _1353 * 0.715200006961822509765625;
        float _1363 = fma(_1357, 0.2125999927520751953125, _1361);
        float _1365 = fma(_1359, 0.072200000286102294921875, _1363);
        float _1367 = 1.0 / _1365;
        float _1369 = _1367 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1371 = precise::clamp(_1369, 0.0, 1.0);
        float _1373 = fma(_1371, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1375 = _1357 * _1373;
        float _1377 = _1353 * _1373;
        float _1379 = _1359 * _1373;
        out.m_44.x = _1375;
        out.m_44.y = _1377;
        out.m_44.z = _1379;
        out.m_44.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_44)};
    }
    bool _1381 = _106 != 0;
    bool _1383 = !_1381;
    if (!_1383)
    {
        if (_96)
        {
            _1303 = 0.0;
        }
        float _1385 = _1303;
        float _1387 = _1385;
        if (_96)
        {
            _1305 = 0.0;
        }
        float _1389 = _1305;
        float _1391 = _1389;
        if (!_96)
        {
            float _1393 = _973 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1391 = _1393;
        }
        float _1395 = _1391;
        float _1397 = _1395;
        if (!_96)
        {
            float _1399 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1387 = _1399;
        }
        float _1401 = _1387;
        float _1403 = _1401;
        if (!_100)
        {
            float _1405 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1395);
            _1397 = _1405;
        }
        float _1407 = _1397;
        if (_96)
        {
            _1307 = 0.0;
        }
        float _1409 = _1307;
        float _1411 = _1409;
        if (!_96)
        {
            float _1413 = _993 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1411 = _1413;
        }
        float _1415 = _1411;
        float _1417 = _1407 * 0.715200006961822509765625;
        float _1419 = _1415;
        if (!_100)
        {
            float _1421 = fma(_925, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1401);
            _1403 = _1421;
        }
        float _1423 = _1403;
        if (!_100)
        {
            float _1425 = fma(_951, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1415);
            _1419 = _1425;
        }
        float _1427 = _1419;
        float _1429 = fma(_1423, 0.2125999927520751953125, _1417);
        float _1431 = fma(_1427, 0.072200000286102294921875, _1429);
        float _1433 = 1.0 / _1431;
        float _1435 = _1433 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        float _1439 = fma(_1437, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1441 = _1439 * _1423;
        float _1443 = _1439 * _1407;
        float _1445 = _1439 * _1427;
        out.m_44.x = _1441;
        out.m_44.y = _1443;
        out.m_44.z = _1445;
        out.m_44.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_44)};
    }
    if (!_104)
    {
        _1309 = as_type<int>(_1295);
    }
    int _1447 = _1309;
    if (!_104)
    {
        _1311 = as_type<int>(_1299);
    }
    int _1449 = _1311;
    float _1451 = as_type<float>(_1449);
    if (!_104)
    {
        out.m_44.x = as_type<float>(_1447);
        out.m_44.y = _1297;
        out.m_44.z = as_type<float>(_1449);
        out.m_44.w = _1253;
        return main0_out_u{as_type<uint4>(out.m_44)};
    }
    if (_96)
    {
        _1313 = 0.0;
    }
    float _1453 = _1313;
    float _1455 = _1453;
    if (_96)
    {
        _1315 = 0.0;
    }
    float _1457 = _1315;
    float _1459 = _1457;
    if (!_96)
    {
        float _1461 = _973 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1459 = _1461;
    }
    float _1463 = _1459;
    float _1465 = _1463;
    if (!_96)
    {
        float _1467 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1455 = _1467;
    }
    float _1469 = _1455;
    float _1471 = _1469;
    if (!_100)
    {
        float _1473 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1463);
        _1465 = _1473;
    }
    float _1475 = _1465;
    if (_96)
    {
        _1451 = 0.0;
    }
    float _1477 = _1451;
    float _1479 = _1477;
    if (!_96)
    {
        float _1481 = _993 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1479 = _1481;
    }
    float _1483 = _1479;
    float _1485 = _1475 * 0.715200006961822509765625;
    float _1487 = _1483;
    if (!_100)
    {
        float _1489 = fma(_925, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1469);
        _1471 = _1489;
    }
    float _1491 = _1471;
    if (!_100)
    {
        float _1493 = fma(_951, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1483);
        _1487 = _1493;
    }
    float _1495 = _1487;
    float _1497 = fma(_1491, 0.2125999927520751953125, _1485);
    float _1499 = fma(_1495, 0.072200000286102294921875, _1497);
    float _1501 = 1.0 / _1499;
    float _1503 = _1501 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1505 = precise::clamp(_1503, 0.0, 1.0);
    float _1507 = fma(_1505, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1509 = _1507 * _1491;
    float _1511 = _1507 * _1475;
    float _1513 = _1507 * _1495;
    out.m_44.x = _1509;
    out.m_44.y = _1511;
    out.m_44.z = _1513;
    out.m_44.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_44)};
}

