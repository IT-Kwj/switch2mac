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
void _46(thread const int& _3854, thread const int& _3855, thread const int& _3856, thread const int& _3857, thread int& _3858, thread int& _3859, thread int& _3860, thread int& _3861, thread int& _3862, thread int& _3863)
{
    float _3866 = as_type<float>(_3856) + 0.0;
    bool _3868 = _3866 != 0.0;
    bool _3870 = isnan(_3866);
    bool _3872 = _3868 || _3870;
    bool _3874 = isnan(0.0);
    bool _3876 = _3872 || _3874;
    int _3878 = as_type<int>(_3866);
    int _3880 = _3854;
    int _3882 = 0;
    int _3884 = _3876 ? (-1) : 0;
    if (!_3876)
    {
        float _3886 = as_type<float>(_3856) * 1.0;
        _3878 = as_type<int>(_3886);
    }
    int _3888 = _3878;
    bool _3890 = !_3876;
    int _3892 = _3888;
    if (!_3890)
    {
        float _3894 = as_type<float>(_3856) + 0.0;
        bool _3896 = _3894 >= 0.0;
        bool _3898 = isnan(_3894);
        bool _3900 = _3896 || _3898;
        bool _3902 = isnan(0.0);
        bool _3904 = _3900 || _3902;
        int _3906 = as_type<int>(_3894);
        _3884 = _3904 ? (-1) : 0;
        if (!_3904)
        {
            _3906 = 2147483647;
        }
        int _3908 = _3906;
        bool _3910 = !_3904;
        _3892 = _3908;
        if (!_3910)
        {
            float _3912 = abs(as_type<float>(_3856));
            float _3914 = _3912 + 0.0;
            bool _3916 = _3914 > as_type<float>(0x7f800000u /* inf */);
            bool _3918 = isnan(_3914);
            bool _3920 = _3916 || _3918;
            bool _3922 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3924 = _3920 || _3922;
            int _3926 = as_type<int>(_3914);
            _3882 = 2139095040;
            _3884 = _3924 ? (-1) : 0;
            if (_3924)
            {
                float _3928 = as_type<float>(_3856) + 1.0;
                _3926 = as_type<int>(_3928);
            }
            int _3930 = _3926;
            _3892 = _3930;
            if (!_3924)
            {
                float _3932 = abs(as_type<float>(_3856));
                float _3934 = _3932 + (-0.0);
                float _3936 = 0.0 + _3934;
                bool _3938 = _3936 != as_type<float>(0x7f800000u /* inf */);
                bool _3940 = isnan(_3936);
                bool _3942 = _3938 || _3940;
                bool _3944 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3946 = _3942 || _3944;
                int _3948 = as_type<int>(_3936);
                _3884 = _3946 ? (-1) : 0;
                if (!_3946)
                {
                    _3948 = _3856;
                }
                int _3950 = _3948;
                bool _3952 = !_3946;
                _3892 = _3950;
                if (!_3952)
                {
                    float _3954 = as_type<float>(_3856) * 18446744073709551616.0;
                    float _3956 = rsqrt(_3954);
                    float _3958 = _3954 * _3956;
                    float _3960 = _3956 * 0.5;
                    float _3962 = -_3958;
                    float _3964 = 0.0 + _3962;
                    float _3966 = fma(_3960, _3964, 0.5);
                    float _3968 = fma(_3958, _3966, _3958);
                    float _3970 = -_3968;
                    float _3972 = 0.0 + _3970;
                    float _3974 = fma(_3968, _3972, _3954);
                    float _3976 = fma(_3960, _3974, _3968);
                    float _3978 = _3976 * 2.3283064365386962890625e-10;
                    _3892 = as_type<int>(_3978);
                    _3880 = as_type<int>(_3954);
                    _3882 = as_type<int>(_3960);
                }
            }
        }
    }
    int _3980 = _3892;
    int _3982 = _3880;
    int _3984 = _3882;
    int _3986 = _3884;
    _3858 = _3980;
    _3859 = _3982;
    _3860 = _3984;
    _3861 = _3857;
    _3862 = 0;
    _3863 = _3986;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _731 = false;
    bool _274 = false;
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
    float _110 = fma(_104, _104, _108);
    float _112 = rsqrt(_110);
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _116 = precise::max(0.0, _114);
    float _118 = _102 * _112;
    float _120 = _104 * _112;
    float _122 = _100 * _112;
    float _124 = _118 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _128 = -_122;
    float _130 = -_116;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[13].z, _130);
    float _134 = _124 * _124;
    float _136 = _126 * _126;
    float _138 = _134 + _136;
    float _140 = sqrt(_138);
    bool _142 = _140 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _144 = _114;
    float _146 = _112;
    float _148 = _132;
    float _150 = _124;
    float _152 = _126;
    int _154 = as_type<int>(_140);
    if (!_142)
    {
        _144 = _136;
    }
    float _156 = _144;
    float _158 = _156;
    if (!_142)
    {
        _146 = _134;
    }
    float _160 = _146;
    bool _162 = !_142;
    float _164 = _160;
    if (!_162)
    {
        float _166 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _170 = _140 + _168;
        float _172 = _132 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = rsqrt(_138);
        float _176 = _170 * _166;
        float _178 = _176 * 0.15915493667125701904296875;
        float _180 = _178 * 6.283185482025146484375;
        float _182 = sin(_180);
        float _184 = _178 * 6.283185482025146484375;
        float _186 = cos(_184);
        float _188 = fma(_182, _172, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _190 = _174 * _188;
        float _192 = _186 + (-1.0);
        float _194 = _124 * _190;
        float _196 = _126 * _190;
        float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _200 = _196 * _196;
        float _202 = fma(_132, _186, _198);
        float _204 = _194 * _194;
        _148 = _202;
        _164 = _204;
        _158 = _200;
        _150 = _194;
        _152 = _196;
        _154 = as_type<int>(_178);
    }
    float _206 = _148;
    float _208 = _164;
    float _210 = _158;
    float _212 = _150;
    float _214 = _152;
    int _216 = _154;
    float _218 = fma(_206, _206, _208);
    float _220 = _218 + _210;
    float _222 = rsqrt(_220);
    float _224 = _222 * _206;
    float _226 = _222 * _212;
    float _228 = _222 * _214;
    float _230 = -_224;
    float _232 = precise::max(0.0, _230);
    float _234 = abs(_232);
    float _236 = -_234;
    float _238 = _236 + 1.0;
    float _240 = fma(_232, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _242 = as_type<int>(_238) + (-218103808);
    float _244 = fma(_232, _240, -0.212114393711090087890625);
    bool _246 = uint(_242) >= 1920991232u;
    float _248 = fma(_232, _244, 1.570728778839111328125);
    bool _250 = !_246;
    float _272;
    if (!_250)
    {
        int _252 = _216;
        int _254 = 0;
        int _256 = as_type<int>(_238);
        int _258 = 1232;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        int _270;
        _46(_252, _254, _256, _258, _260, _262, _264, _266, _268, _270);
        _272 = as_type<float>(_260);
        _274 = true;
    }
    else
    {
        float _276 = rsqrt(_238);
        float _278 = _238 * _276;
        float _280 = _276 * 0.5;
        float _282 = -_278;
        float _284 = 0.0 + _282;
        float _286 = fma(_280, _284, 0.5);
        float _288 = fma(_278, _286, _278);
        float _290 = -_288;
        float _292 = 0.0 + _290;
        float _294 = fma(_288, _292, _238);
        float _296 = fma(_280, _294, _288);
        _272 = _296;
    }
    _274 = false;
    float _298 = _272;
    bool _300 = _224 > 0.0;
    float _302 = _120 * _120;
    float _304 = _118 * _118;
    float _306 = _302 + _304;
    if (_300)
    {
        discard_fragment();
    }
    float _308 = rsqrt(_306);
    float _310 = _248 * _298;
    float _312 = _310 * 0.636619746685028076171875;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = -_314;
    float _318 = _316 + 1.0;
    float _320 = sqrt(_318);
    float _322 = _120 * _308;
    float _324 = _118 * _308;
    float _326 = abs(_322);
    float _328 = abs(_324);
    float _330 = precise::max(_326, _328);
    float _332 = precise::max(_330, 9.9999997473787516355514526367188e-05);
    float _334 = -_320;
    float _336 = _334 + 1.0;
    float _338 = 1.0 / _332;
    float _340 = _336 * 0.5;
    float _342 = -_338;
    float _344 = _322 * _342;
    float _346 = _324 * _338;
    float _348 = fma(_344, _340, 0.5);
    float _350 = fma(_346, _340, 0.5);
    if (_300)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    float2 _1959;
    _1959.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    _1959.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    float _352 = _1959.x;
    float _354 = _352 * 256.0;
    int _356 = int(_354);
    float _358 = -_122;
    float _360 = fma(_358, _122, 1.0);
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_122;
    float _366 = _118 * _364;
    int _368 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _370 = _368 != 0;
    float _372 = -_122;
    float _374 = _372 + 1.0;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _380 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _382 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _384 = _118 * _122;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _392 = -_120;
    float _394 = _122 * _392;
    float _396 = fma(_122, _386, _378);
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _400 = _376;
    if (_370)
    {
        float _402 = sqrt(_362);
        _400 = _402;
    }
    float _404 = _400;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _408 = fma(_122, _388, _382);
    float _410 = -_120;
    float _412 = fma(_410, _398, _396);
    float _414 = fma(_120, _398, _396);
    float _416 = fma(_122, _406, _380);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _420 = _122 * _120;
    float _422 = -_122;
    float _424 = fma(_422, _122, _304);
    float _426 = -_120;
    float _428 = fma(_426, _390, _416);
    float _430 = fma(_120, _390, _416);
    float _432 = -_120;
    float _434 = fma(_432, _418, _408);
    float _436 = fma(_120, _418, _408);
    float _438 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _440 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _442 = abs(_404);
    float _444 = log2(_442);
    float _446 = -_118;
    float _448 = fma(_446, _438, _428);
    float _450 = fma(_118, _438, _430);
    float _452 = -_118;
    float _454 = fma(_452, _440, _412);
    float _456 = fma(_118, _440, _414);
    float _458 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _460 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _462 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _464 = -_118;
    float _466 = fma(_464, _458, _434);
    float _468 = fma(_118, _458, _436);
    float _470 = fma(_460, _366, _448);
    float _472 = fma(_460, _384, _450);
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _476 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _478 = _444 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = fma(_462, _366, _454);
    float _482 = fma(_474, _394, _470);
    float _484 = fma(_474, _420, _472);
    float _486 = _226 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _490 = exp2(_478);
    float _492 = fma(_462, _384, _456);
    float _494 = -_486;
    float _496 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _494);
    float _498 = fma(_476, _366, _466);
    float _500 = fma(_488, _394, _480);
    float _502 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _504 = -_228;
    float _506 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[11].z, _496);
    float _508 = fma(_476, _384, _468);
    float _510 = fma(_502, _394, _498);
    float _512 = fma(_506, 0.5, 0.5);
    float _514 = fma(_488, _420, _492);
    float _516 = fma(_502, _420, _508);
    float _518 = fma(_512, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _520 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _522 = _118 * _120;
    float _524 = fma(_512, _518, -0.212114393711090087890625);
    float _526 = _490 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _528 = fma(_520, _522, _500);
    float _530 = fma(_520, _522, _514);
    float _532 = fma(_512, _524, 1.570728778839111328125);
    float _534 = fma(_526, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = fma(_506, -0.5, 0.5);
    float _540 = in.m_40.x;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_40.y;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = -_536;
    float _554 = _552 + 1.0;
    float _556 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _558 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _560 = sqrt(_538);
    float _562 = fma(_556, _522, _482);
    float _564 = fma(_556, _522, _484);
    float _566 = fma(_558, _522, _510);
    float _568 = fma(_558, _522, _516);
    float _570 = _120 * (-3.0);
    float _572 = abs(_554);
    float _574 = log2(_572);
    float _576 = -_120;
    float _578 = fma(_576, _570, -1.0);
    float _580 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _582 = fma(_302, 3.0, -1.0);
    float _584 = _560 * 0.636619746685028076171875;
    float _586 = fma(_580, _578, _528);
    float _588 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _590 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _592 = -_532;
    float _594 = fma(_584, _592, 1.0);
    float _596 = fma(_588, _578, _562);
    float _598 = fma(_580, _582, _530);
    float _600 = _574 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _602 = fma(_590, _578, _566);
    float _604 = fma(_590, _582, _568);
    float _606 = _98 * _544;
    float _608 = fma(_588, _582, _564);
    float _610 = _98 * _550;
    float _612 = exp2(_600);
    float _614 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _616 = _224 + 1.0;
    float _618 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _620 = fma(_614, _424, _586);
    float _622 = fma(_614, _424, _598);
    float _624 = fma(_618, _424, _596);
    float _626 = fma(_618, _424, _608);
    float _628 = fma(_224, -0.5, 0.5);
    float _630 = -_224;
    float _632 = fma(_612, _616, _630);
    float _634 = fma(_632, 0.5, 0.5);
    float2 _2416 = float2(_606, _610);
    float3 _638 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2416, float2(0.0), isnan(_2416))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2416, float2(0.0), isnan(_2416))).xyz;
    float _640 = _638.x;
    float _642 = _638.y;
    float _644 = _638.z;
    float _646 = float(uint(_356));
    float _648 = _646 * 0.00390625;
    float2 _2438 = float2(_348, _350);
    float2 _652 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2438, float2(0.0), isnan(_2438)), level(_648)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2438, float2(0.0), isnan(_2438)), level(_648)).xy;
    float _654 = _652.x;
    float _656 = _652.y;
    float2 _2451 = float2(_594, _628);
    float3 _658 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2451, float2(0.0), isnan(_2451))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2451, float2(0.0), isnan(_2451))).xyz;
    float _660 = _658.x;
    float _662 = _658.y;
    float _664 = _658.z;
    float2 _2465 = float2(_594, _634);
    float3 _666 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2465, float2(0.0), isnan(_2465))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2465, float2(0.0), isnan(_2465))).xyz;
    float _668 = _666.x;
    float _670 = _666.y;
    float _672 = _666.z;
    float2 _2479 = float2(_348, _350);
    float4 _675 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2479, float2(0.0), isnan(_2479)), level(_648)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2479, float2(0.0), isnan(_2479)), level(_648)).xyzw;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    float _683 = _675.w;
    float _685 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    int _687 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _689 = _687 != 0;
    float _691 = fma(_685, _424, _602);
    float _693 = fma(_685, _424, _604);
    float _695 = -_644;
    float _697 = _695 + 1.0;
    float _699 = _656 * _697;
    float _701 = _699 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _703 = !_689;
    int _705 = _689 ? (-1) : 0;
    int _719;
    int _721;
    int _723;
    int _725;
    int _727;
    int _729;
    if (!_703)
    {
        float _707 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _709 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _711 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _713 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _715 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _717 = _468 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _719 = as_type<int>(_713);
        _721 = as_type<int>(_717);
        _723 = as_type<int>(_715);
        _725 = as_type<int>(_709);
        _727 = as_type<int>(_707);
        _729 = as_type<int>(_711);
        _731 = true;
    }
    else
    {
        int _733 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _735 = _733 != 0;
        float _737 = _624 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _739 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _741 = _620 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _743 = _626 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _745 = _693 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _747 = as_type<int>(_737);
        int _749 = as_type<int>(_739);
        int _751 = as_type<int>(_741);
        int _753 = as_type<int>(_743);
        int _755 = as_type<int>(_745);
        _705 = _735 ? (-1) : 0;
        if (_735)
        {
            float _757 = _380 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _747 = as_type<int>(_757);
        }
        int _759 = _747;
        float _761 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        _725 = _759;
        if (_735)
        {
            float _763 = _382 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _749 = as_type<int>(_763);
        }
        int _765 = _749;
        float _767 = _622 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _719 = as_type<int>(_767);
        _729 = _765;
        if (_735)
        {
            float _769 = _761 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _751 = as_type<int>(_769);
        }
        int _771 = _751;
        _727 = _771;
        if (_735)
        {
            _753 = _759;
        }
        int _773 = _753;
        _723 = _773;
        if (_735)
        {
            _755 = _765;
        }
        int _775 = _755;
        _721 = _775;
        if (_735)
        {
            _719 = _771;
        }
    }
    _731 = false;
    int _777 = _705;
    int _779 = _719;
    int _781 = _721;
    int _783 = _723;
    int _785 = _725;
    int _787 = _727;
    int _789 = _729;
    int _791 = 0;
    int _793 = _777;
    if (!_90)
    {
        int _795 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _797 = _795 != 0;
        _791 = _797 ? (-1) : 0;
    }
    int _799 = _791;
    float _801 = _574 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_90)
    {
        _793 = -1;
    }
    int _803 = _793;
    float _805 = _683 * _683;
    int _807 = _803;
    if (!_90)
    {
        int _809 = ~_799;
        bool _811 = !_94;
        int _813 = _809 & (_811 ? (-1) : 0);
        _807 = _813;
    }
    int _815 = _807;
    float _817 = _640 * _642;
    bool _819 = _96 != 0;
    float _821 = exp2(_801);
    float _823 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _825 = _224 * _823;
    float _827 = _805 * _805;
    float _829 = _224 * (-10000.0);
    float _831 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[26].x, _825);
    int _833 = _815;
    if (_86)
    {
        _833 = -1;
    }
    int _835 = _833;
    int _837 = ~_815;
    float _839 = (_837 != 0) ? as_type<float>(_779) : 0.0;
    int _841 = _835;
    if (!_86)
    {
        bool _843 = !_94;
        bool _845 = _843 && _82;
        bool _847 = !_819;
        bool _849 = _845 && _847;
        _841 = _849 ? (-1) : 0;
    }
    int _851 = _841;
    float _853 = -_821;
    float _855 = _853 + 1.0;
    int _857 = ~_815;
    float _859 = (_857 != 0) ? as_type<float>(_781) : 0.0;
    int _861 = ~_815;
    float _863 = (_861 != 0) ? as_type<float>(_783) : 0.0;
    float _865 = _855 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _867 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _869 = _867 != 0;
    int _871 = ~_851;
    float _873 = (_871 != 0) ? as_type<float>(_785) : 0.0;
    int _875 = ~_851;
    float _877 = (_875 != 0) ? as_type<float>(_787) : 0.0;
    int _879 = ~_851;
    float _881 = (_879 != 0) ? as_type<float>(_789) : 0.0;
    bool _883 = !_94;
    bool _885 = _82 && _883;
    bool _887 = !_869;
    float _889 = _887 ? _654 : 0.0;
    float _891 = _889 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _893 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _895 = _893 != 0;
    float _897 = _889 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _899 = !_885;
    float _901 = _899 ? _891 : 0.0;
    float _903 = -_865;
    float _905 = _903 + 1.0;
    bool _907 = !_895;
    bool _909 = !_885;
    float _911 = _909 ? _897 : 0.0;
    float _913 = _901 * _863;
    bool _915 = !_895;
    float _917 = abs(_905);
    float _919 = log2(_917);
    float _921 = _901 * _839;
    float _923 = _901 * _859;
    bool _925 = !_907;
    float _927 = _925 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _929 = fma(_873, _911, _913);
    bool _931 = !_895;
    float _933 = fma(_877, _911, _921);
    bool _935 = !_915;
    float _937 = _935 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _939 = fma(_881, _911, _923);
    float _941 = _927 * _929;
    bool _943 = !_931;
    float _945 = _943 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    int _947 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _949 = _947 != 0;
    float _951 = _937 * _933;
    float _953 = _941 * 0.715200006961822509765625;
    float _955 = _827 * 16.0;
    float _957 = _945 * _939;
    float _959 = _919 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _961 = fma(_951, 0.2125999927520751953125, _953);
    float _963 = _817 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _965 = _919 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _967 = fma(_957, 0.072200000286102294921875, _961);
    float _969 = exp2(_959);
    float _971 = _677 * _955;
    float _973 = _679 * _955;
    float _975 = -_951;
    float _977 = _975 + _967;
    float _979 = _681 * _955;
    float _981 = -_941;
    float _983 = _981 + _967;
    float _985 = fma(_963, _977, _951);
    float _987 = exp2(_965);
    float _989 = fma(_963, _983, _941);
    float _991 = -_957;
    float _993 = _991 + _967;
    bool _995 = !_949;
    bool _997 = !_949;
    float _999 = fma(_963, _993, _957);
    float _1001 = _995 ? _973 : 0.0;
    bool _1003 = !_78;
    float _1005 = _1003 ? _969 : 1.0;
    bool _1007 = !_949;
    int _1009 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1011 = _1009 != 0;
    float _1013 = _997 ? _971 : 0.0;
    float _1015 = _1005 * _889;
    float _1017 = _1007 ? _979 : 0.0;
    float _1019 = _1005 * _985;
    float _1021 = _1005 * _989;
    float _1023 = _82 ? _1015 : _1019;
    float _1025 = _82 ? _1015 : _1021;
    float _1027 = _1015;
    float _1029 = _999;
    float _1031 = _971;
    if (!_82)
    {
        float _1033 = _1005 * _999;
        _1027 = _1033;
    }
    float _1035 = _1027;
    float _1037 = _1023 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    bool _1039 = !_78;
    int _1041 = _1039 ? as_type<int>(_987) : 1065353216;
    float _1043 = _1035 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    int _1045 = _1041;
    if (_78)
    {
        _1029 = 0.0;
    }
    float _1047 = _1029;
    float _1049 = as_type<float>(_1041) * _1013;
    float _1051 = as_type<float>(_1041) * _1001;
    float _1053 = as_type<float>(_1041) * _1017;
    float _1055 = fma(_1049, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1037);
    float _1057 = _1025 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1059 = _1057;
    float _1061 = _1055;
    float _1063 = _1047;
    if (_78)
    {
        _1045 = as_type<int>(_701);
    }
    int _1065 = _1045;
    float _1067 = fma(_1053, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1043);
    float _1069 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1057);
    int _1071 = _1065;
    int _1073 = _1065;
    float _1075 = _1067;
    float _1077 = _1069;
    if (_78)
    {
        _1031 = 0.0;
    }
    float _1079 = _1031;
    float _1081 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1083 = _1079;
    if (_78)
    {
        _1059 = 0.0;
    }
    float _1085 = _1059;
    bool _1087 = !_78;
    float _1089 = _1087 ? _865 : 0.0;
    float _1091 = _1085;
    if (!_78)
    {
        int _1093 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1095 = _1093 != 0;
        float _1097 = _670 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1099 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1101 = _1099 != 0;
        float _1103 = _668 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1105 = _672 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1107 = !_1101;
        float _1109 = _1107 ? _1103 : 0.0;
        bool _1111 = !_1101;
        float _1113 = _1111 ? _1097 : 0.0;
        bool _1115 = !_1101;
        float _1117 = _1115 ? _1105 : 0.0;
        float _1119 = _1089 * _1109;
        _1063 = _1119;
        if (!_1095)
        {
            _1071 = as_type<int>(_701);
        }
        int _1121 = _1071;
        float _1123 = _1089 * _1113;
        float _1125 = _1089 * _1117;
        bool _1127 = !_1095;
        _1073 = _1121;
        _1091 = _1125;
        _1083 = _1123;
        if (!_1127)
        {
            float _1129 = -_1089;
            float _1131 = _1129 + 1.0;
            float _1133 = precise::clamp(_1131, 0.0, 1.0);
            float _1135 = _701 * _1133;
            float _1137 = precise::max(_1135, 9.9999997473787516355514526367188e-05);
            float _1139 = 1.0 / _1137;
            float _1141 = _701 * _1139;
            float _1143 = _1055 * _1141;
            float _1145 = _1069 * _1141;
            float _1147 = _1067 * _1141;
            _1073 = as_type<int>(_1135);
            _1075 = _1147;
            _1091 = 0.0;
            _1061 = _1143;
            _1063 = 0.0;
            _1077 = _1145;
            _1083 = 0.0;
        }
    }
    int _1149 = _1073;
    float _1151 = _1075;
    float _1153 = _1091;
    float _1155 = _1061;
    float _1157 = _1063;
    float _1159 = _1077;
    float _1161 = _1083;
    bool _1163 = !_1011;
    float _1165 = _1163 ? as_type<float>(_1149) : 1.0;
    float _1167 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[26].z, _831);
    float _1169 = abs(_829);
    bool _1171 = _1169 > 0.00999999977648258209228515625;
    float _1173 = -_1081;
    float _1175 = exp2(_1173);
    float _1177 = -_1165;
    float _1179 = _1177 + 1.0;
    float _1181 = _1171 ? _829 : 0.00999999977648258209228515625;
    float _1183 = _660 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1185 = _1151 + _1153;
    float _1187 = fma(_1167, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1189 = abs(_1179);
    float _1191 = log2(_1189);
    float _1193 = _1181 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1195 = fma(_1187, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    int _1197 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1199 = _1197 != 0;
    float _1201 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1203 = fma(_1201, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1205 = precise::max(_1193, -127.0);
    float _1207 = abs(_1195);
    float _1209 = log2(_1207);
    float _1211 = _1191 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1213 = -_1205;
    float _1215 = exp2(_1213);
    float _1217 = _1209 * 1.5;
    float _1219 = exp2(_1211);
    float _1221 = _1155 + _1157;
    float _1223 = -_1215;
    float _1225 = _1223 + 1.0;
    float _1227 = 1.0 / _1205;
    float _1229 = _1175 * _1225;
    float _1231 = _1159 + _1161;
    float _1233 = _662 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1235 = _664 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1237 = -_1219;
    float _1239 = spvFAdd(_1237, 1.00010001659393310546875);
    float _1241 = -_1219;
    float _1243 = _1241 + 1.0;
    float _1245 = exp2(_1217);
    float _1247 = -_1165;
    float _1249 = _1247 + _1243;
    float _1251 = _1249 * _1233;
    float _1253 = 1.0 / _1239;
    float _1255 = _1249 * _1183;
    float _1257 = _1229 * _1227;
    float _1259 = fma(_1231, _1165, _1251);
    float _1261 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1263 = fma(_1221, _1165, _1255);
    float _1265 = _1249 * _1235;
    float _1267 = _1257 * _1261;
    float _1269 = _1245 * 12.56637096405029296875;
    float _1271 = fma(_1185, _1165, _1265);
    float _1273 = 1.0 / _1269;
    float _1275 = _1253 * _1259;
    float _1277 = _1253 * _1263;
    float _1279 = _1253 * _1271;
    float _1281 = _1275 * 0.715200006961822509765625;
    float _1283 = -_1267;
    float _1285 = exp2(_1283);
    float _1287 = fma(_1277, 0.2125999927520751953125, _1281);
    float _1289 = fma(_1279, 0.072200000286102294921875, _1287);
    float _1291 = _1203 * _1273;
    float _1293 = 1.0 / _1289;
    float _1295 = -_1285;
    float _1297 = _1295 + 1.0;
    float _1299 = _1297 * _1291;
    float _1301 = _1299 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1303 = _1293 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1305 = precise::clamp(_1303, 0.0, 1.0);
    float _1307 = _1299 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1309 = fma(_1305, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1311 = _1309 * _1285;
    float _1313 = _1299 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1315 = fma(_1277, _1311, _1301);
    float _1317 = fma(_1275, _1311, _1313);
    float _1319 = fma(_1279, _1311, _1307);
    bool _1321 = !_1199;
    float _1323 = _1219;
    float _1325 = _1319;
    float _1327 = _1277;
    int _1329 = as_type<int>(_1219);
    int _1331 = as_type<int>(_1277);
    float _1333 = _1319;
    if (!_1321)
    {
        bool _1335 = _1243 != 1.0;
        bool _1337 = isnan(_1243);
        bool _1339 = _1335 || _1337;
        bool _1341 = isnan(1.0);
        bool _1343 = _1339 || _1341;
        float _1345 = -_1219;
        bool _1347 = _1345 != (-1.0);
        bool _1349 = isnan(_1345);
        bool _1351 = _1347 || _1349;
        bool _1353 = isnan(-1.0);
        bool _1355 = _1351 || _1353;
        float _1357 = -_1219;
        bool _1359 = _1357 == (-1.0);
        bool _1361 = !_1343;
        bool _1363 = _1359 || _1361;
        bool _1365 = _1243 == 1.0;
        bool _1367 = _1365 && _1355;
        bool _1369 = !_1363;
        float _1371 = _1369 ? _1243 : 0.0;
        bool _1373 = !_1367;
        float _1375 = _1373 ? 0.0 : 1.0;
        float _1377 = _1363 ? 0.0 : 0.5;
        float _1379 = _1371 * 0.715200006961822509765625;
        float _1381 = fma(_1375, 0.2125999927520751953125, _1379);
        float _1383 = fma(_1377, 0.072200000286102294921875, _1381);
        float _1385 = 1.0 / _1383;
        float _1387 = _1385 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1389 = precise::clamp(_1387, 0.0, 1.0);
        float _1391 = fma(_1389, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1393 = _1375 * _1391;
        float _1395 = _1371 * _1391;
        float _1397 = _1377 * _1391;
        out.m_38.x = _1393;
        out.m_38.y = _1395;
        out.m_38.z = _1397;
        out.m_38.w = 1.0;
        return out;
    }
    bool _1399 = _96 != 0;
    bool _1401 = !_1399;
    if (!_1401)
    {
        if (_86)
        {
            _1323 = 0.0;
        }
        float _1403 = _1323;
        float _1405 = _1403;
        if (_86)
        {
            _1325 = 0.0;
        }
        float _1407 = _1325;
        float _1409 = _1407;
        if (!_86)
        {
            float _1411 = _873 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1409 = _1411;
        }
        float _1413 = _1409;
        float _1415 = _1413;
        if (!_86)
        {
            float _1417 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1405 = _1417;
        }
        float _1419 = _1405;
        float _1421 = _1419;
        if (!_90)
        {
            float _1423 = fma(_863, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1413);
            _1415 = _1423;
        }
        float _1425 = _1415;
        if (_86)
        {
            _1327 = 0.0;
        }
        float _1427 = _1327;
        float _1429 = _1427;
        if (!_86)
        {
            float _1431 = _881 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1429 = _1431;
        }
        float _1433 = _1429;
        float _1435 = _1425 * 0.715200006961822509765625;
        float _1437 = _1433;
        if (!_90)
        {
            float _1439 = fma(_839, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1419);
            _1421 = _1439;
        }
        float _1441 = _1421;
        if (!_90)
        {
            float _1443 = fma(_859, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1433);
            _1437 = _1443;
        }
        float _1445 = _1437;
        float _1447 = fma(_1441, 0.2125999927520751953125, _1435);
        float _1449 = fma(_1445, 0.072200000286102294921875, _1447);
        float _1451 = 1.0 / _1449;
        float _1453 = _1451 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1455 = precise::clamp(_1453, 0.0, 1.0);
        float _1457 = fma(_1455, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1459 = _1457 * _1441;
        float _1461 = _1457 * _1425;
        float _1463 = _1457 * _1445;
        out.m_38.x = _1459;
        out.m_38.y = _1461;
        out.m_38.z = _1463;
        out.m_38.w = 1.0;
        return out;
    }
    if (!_94)
    {
        _1329 = as_type<int>(_1317);
    }
    int _1465 = _1329;
    float _1467 = as_type<float>(_1465);
    if (!_94)
    {
        _1331 = as_type<int>(_1243);
    }
    int _1469 = _1331;
    float _1471 = as_type<float>(_1469);
    if (!_94)
    {
        out.m_38.x = _1315;
        out.m_38.y = as_type<float>(_1465);
        out.m_38.z = _1319;
        out.m_38.w = as_type<float>(_1469);
        return out;
    }
    if (_86)
    {
        _1467 = 0.0;
    }
    float _1473 = _1467;
    float _1475 = _1473;
    if (_86)
    {
        _1333 = 0.0;
    }
    float _1477 = _1333;
    float _1479 = _1477;
    if (!_86)
    {
        float _1481 = _873 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1479 = _1481;
    }
    float _1483 = _1479;
    float _1485 = _1483;
    if (!_86)
    {
        float _1487 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1475 = _1487;
    }
    float _1489 = _1475;
    float _1491 = _1489;
    if (!_90)
    {
        float _1493 = fma(_863, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1483);
        _1485 = _1493;
    }
    float _1495 = _1485;
    if (_86)
    {
        _1471 = 0.0;
    }
    float _1497 = _1471;
    float _1499 = _1497;
    if (!_86)
    {
        float _1501 = _881 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1499 = _1501;
    }
    float _1503 = _1499;
    float _1505 = _1495 * 0.715200006961822509765625;
    float _1507 = _1503;
    if (!_90)
    {
        float _1509 = fma(_839, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1489);
        _1491 = _1509;
    }
    float _1511 = _1491;
    if (!_90)
    {
        float _1513 = fma(_859, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1503);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = fma(_1511, 0.2125999927520751953125, _1505);
    float _1519 = fma(_1515, 0.072200000286102294921875, _1517);
    float _1521 = 1.0 / _1519;
    float _1523 = _1521 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1525 = precise::clamp(_1523, 0.0, 1.0);
    float _1527 = fma(_1525, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1529 = _1527 * _1511;
    float _1531 = _1527 * _1495;
    float _1533 = _1527 * _1515;
    out.m_38.x = _1529;
    out.m_38.y = _1531;
    out.m_38.z = _1533;
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
    bool _731 = false;
    bool _274 = false;
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
    float _110 = fma(_104, _104, _108);
    float _112 = rsqrt(_110);
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _116 = precise::max(0.0, _114);
    float _118 = _102 * _112;
    float _120 = _104 * _112;
    float _122 = _100 * _112;
    float _124 = _118 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _128 = -_122;
    float _130 = -_116;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[13].z, _130);
    float _134 = _124 * _124;
    float _136 = _126 * _126;
    float _138 = _134 + _136;
    float _140 = sqrt(_138);
    bool _142 = _140 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _144 = _114;
    float _146 = _112;
    float _148 = _132;
    float _150 = _124;
    float _152 = _126;
    int _154 = as_type<int>(_140);
    if (!_142)
    {
        _144 = _136;
    }
    float _156 = _144;
    float _158 = _156;
    if (!_142)
    {
        _146 = _134;
    }
    float _160 = _146;
    bool _162 = !_142;
    float _164 = _160;
    if (!_162)
    {
        float _166 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _170 = _140 + _168;
        float _172 = _132 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = rsqrt(_138);
        float _176 = _170 * _166;
        float _178 = _176 * 0.15915493667125701904296875;
        float _180 = _178 * 6.283185482025146484375;
        float _182 = sin(_180);
        float _184 = _178 * 6.283185482025146484375;
        float _186 = cos(_184);
        float _188 = fma(_182, _172, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _190 = _174 * _188;
        float _192 = _186 + (-1.0);
        float _194 = _124 * _190;
        float _196 = _126 * _190;
        float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _200 = _196 * _196;
        float _202 = fma(_132, _186, _198);
        float _204 = _194 * _194;
        _148 = _202;
        _164 = _204;
        _158 = _200;
        _150 = _194;
        _152 = _196;
        _154 = as_type<int>(_178);
    }
    float _206 = _148;
    float _208 = _164;
    float _210 = _158;
    float _212 = _150;
    float _214 = _152;
    int _216 = _154;
    float _218 = fma(_206, _206, _208);
    float _220 = _218 + _210;
    float _222 = rsqrt(_220);
    float _224 = _222 * _206;
    float _226 = _222 * _212;
    float _228 = _222 * _214;
    float _230 = -_224;
    float _232 = precise::max(0.0, _230);
    float _234 = abs(_232);
    float _236 = -_234;
    float _238 = _236 + 1.0;
    float _240 = fma(_232, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _242 = as_type<int>(_238) + (-218103808);
    float _244 = fma(_232, _240, -0.212114393711090087890625);
    bool _246 = uint(_242) >= 1920991232u;
    float _248 = fma(_232, _244, 1.570728778839111328125);
    bool _250 = !_246;
    float _272;
    if (!_250)
    {
        int _252 = _216;
        int _254 = 0;
        int _256 = as_type<int>(_238);
        int _258 = 1232;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        int _270;
        _46(_252, _254, _256, _258, _260, _262, _264, _266, _268, _270);
        _272 = as_type<float>(_260);
        _274 = true;
    }
    else
    {
        float _276 = rsqrt(_238);
        float _278 = _238 * _276;
        float _280 = _276 * 0.5;
        float _282 = -_278;
        float _284 = 0.0 + _282;
        float _286 = fma(_280, _284, 0.5);
        float _288 = fma(_278, _286, _278);
        float _290 = -_288;
        float _292 = 0.0 + _290;
        float _294 = fma(_288, _292, _238);
        float _296 = fma(_280, _294, _288);
        _272 = _296;
    }
    _274 = false;
    float _298 = _272;
    bool _300 = _224 > 0.0;
    float _302 = _120 * _120;
    float _304 = _118 * _118;
    float _306 = _302 + _304;
    if (_300)
    {
        discard_fragment();
    }
    float _308 = rsqrt(_306);
    float _310 = _248 * _298;
    float _312 = _310 * 0.636619746685028076171875;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = -_314;
    float _318 = _316 + 1.0;
    float _320 = sqrt(_318);
    float _322 = _120 * _308;
    float _324 = _118 * _308;
    float _326 = abs(_322);
    float _328 = abs(_324);
    float _330 = precise::max(_326, _328);
    float _332 = precise::max(_330, 9.9999997473787516355514526367188e-05);
    float _334 = -_320;
    float _336 = _334 + 1.0;
    float _338 = 1.0 / _332;
    float _340 = _336 * 0.5;
    float _342 = -_338;
    float _344 = _322 * _342;
    float _346 = _324 * _338;
    float _348 = fma(_344, _340, 0.5);
    float _350 = fma(_346, _340, 0.5);
    if (_300)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float2 _1959;
    _1959.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    _1959.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    float _352 = _1959.x;
    float _354 = _352 * 256.0;
    int _356 = int(_354);
    float _358 = -_122;
    float _360 = fma(_358, _122, 1.0);
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_122;
    float _366 = _118 * _364;
    int _368 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _370 = _368 != 0;
    float _372 = -_122;
    float _374 = _372 + 1.0;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _380 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _382 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _384 = _118 * _122;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _392 = -_120;
    float _394 = _122 * _392;
    float _396 = fma(_122, _386, _378);
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _400 = _376;
    if (_370)
    {
        float _402 = sqrt(_362);
        _400 = _402;
    }
    float _404 = _400;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _408 = fma(_122, _388, _382);
    float _410 = -_120;
    float _412 = fma(_410, _398, _396);
    float _414 = fma(_120, _398, _396);
    float _416 = fma(_122, _406, _380);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _420 = _122 * _120;
    float _422 = -_122;
    float _424 = fma(_422, _122, _304);
    float _426 = -_120;
    float _428 = fma(_426, _390, _416);
    float _430 = fma(_120, _390, _416);
    float _432 = -_120;
    float _434 = fma(_432, _418, _408);
    float _436 = fma(_120, _418, _408);
    float _438 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _440 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _442 = abs(_404);
    float _444 = log2(_442);
    float _446 = -_118;
    float _448 = fma(_446, _438, _428);
    float _450 = fma(_118, _438, _430);
    float _452 = -_118;
    float _454 = fma(_452, _440, _412);
    float _456 = fma(_118, _440, _414);
    float _458 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _460 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _462 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _464 = -_118;
    float _466 = fma(_464, _458, _434);
    float _468 = fma(_118, _458, _436);
    float _470 = fma(_460, _366, _448);
    float _472 = fma(_460, _384, _450);
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _476 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _478 = _444 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = fma(_462, _366, _454);
    float _482 = fma(_474, _394, _470);
    float _484 = fma(_474, _420, _472);
    float _486 = _226 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _490 = exp2(_478);
    float _492 = fma(_462, _384, _456);
    float _494 = -_486;
    float _496 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _494);
    float _498 = fma(_476, _366, _466);
    float _500 = fma(_488, _394, _480);
    float _502 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _504 = -_228;
    float _506 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[11].z, _496);
    float _508 = fma(_476, _384, _468);
    float _510 = fma(_502, _394, _498);
    float _512 = fma(_506, 0.5, 0.5);
    float _514 = fma(_488, _420, _492);
    float _516 = fma(_502, _420, _508);
    float _518 = fma(_512, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _520 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _522 = _118 * _120;
    float _524 = fma(_512, _518, -0.212114393711090087890625);
    float _526 = _490 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _528 = fma(_520, _522, _500);
    float _530 = fma(_520, _522, _514);
    float _532 = fma(_512, _524, 1.570728778839111328125);
    float _534 = fma(_526, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = fma(_506, -0.5, 0.5);
    float _540 = in.m_40.x;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_40.y;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = -_536;
    float _554 = _552 + 1.0;
    float _556 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _558 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _560 = sqrt(_538);
    float _562 = fma(_556, _522, _482);
    float _564 = fma(_556, _522, _484);
    float _566 = fma(_558, _522, _510);
    float _568 = fma(_558, _522, _516);
    float _570 = _120 * (-3.0);
    float _572 = abs(_554);
    float _574 = log2(_572);
    float _576 = -_120;
    float _578 = fma(_576, _570, -1.0);
    float _580 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _582 = fma(_302, 3.0, -1.0);
    float _584 = _560 * 0.636619746685028076171875;
    float _586 = fma(_580, _578, _528);
    float _588 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _590 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _592 = -_532;
    float _594 = fma(_584, _592, 1.0);
    float _596 = fma(_588, _578, _562);
    float _598 = fma(_580, _582, _530);
    float _600 = _574 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _602 = fma(_590, _578, _566);
    float _604 = fma(_590, _582, _568);
    float _606 = _98 * _544;
    float _608 = fma(_588, _582, _564);
    float _610 = _98 * _550;
    float _612 = exp2(_600);
    float _614 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _616 = _224 + 1.0;
    float _618 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _620 = fma(_614, _424, _586);
    float _622 = fma(_614, _424, _598);
    float _624 = fma(_618, _424, _596);
    float _626 = fma(_618, _424, _608);
    float _628 = fma(_224, -0.5, 0.5);
    float _630 = -_224;
    float _632 = fma(_612, _616, _630);
    float _634 = fma(_632, 0.5, 0.5);
    float2 _2416 = float2(_606, _610);
    float3 _638 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2416, float2(0.0), isnan(_2416))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2416, float2(0.0), isnan(_2416))).xyz;
    float _640 = _638.x;
    float _642 = _638.y;
    float _644 = _638.z;
    float _646 = float(uint(_356));
    float _648 = _646 * 0.00390625;
    float2 _2438 = float2(_348, _350);
    float2 _652 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2438, float2(0.0), isnan(_2438)), level(_648)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2438, float2(0.0), isnan(_2438)), level(_648)).xy;
    float _654 = _652.x;
    float _656 = _652.y;
    float2 _2451 = float2(_594, _628);
    float3 _658 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2451, float2(0.0), isnan(_2451))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2451, float2(0.0), isnan(_2451))).xyz;
    float _660 = _658.x;
    float _662 = _658.y;
    float _664 = _658.z;
    float2 _2465 = float2(_594, _634);
    float3 _666 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2465, float2(0.0), isnan(_2465))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2465, float2(0.0), isnan(_2465))).xyz;
    float _668 = _666.x;
    float _670 = _666.y;
    float _672 = _666.z;
    float2 _2479 = float2(_348, _350);
    float4 _675 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2479, float2(0.0), isnan(_2479)), level(_648)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2479, float2(0.0), isnan(_2479)), level(_648)).xyzw;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    float _683 = _675.w;
    float _685 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    int _687 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _689 = _687 != 0;
    float _691 = fma(_685, _424, _602);
    float _693 = fma(_685, _424, _604);
    float _695 = -_644;
    float _697 = _695 + 1.0;
    float _699 = _656 * _697;
    float _701 = _699 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _703 = !_689;
    int _705 = _689 ? (-1) : 0;
    int _719;
    int _721;
    int _723;
    int _725;
    int _727;
    int _729;
    if (!_703)
    {
        float _707 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _709 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _711 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _713 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _715 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _717 = _468 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _719 = as_type<int>(_713);
        _721 = as_type<int>(_717);
        _723 = as_type<int>(_715);
        _725 = as_type<int>(_709);
        _727 = as_type<int>(_707);
        _729 = as_type<int>(_711);
        _731 = true;
    }
    else
    {
        int _733 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _735 = _733 != 0;
        float _737 = _624 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _739 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _741 = _620 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _743 = _626 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _745 = _693 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _747 = as_type<int>(_737);
        int _749 = as_type<int>(_739);
        int _751 = as_type<int>(_741);
        int _753 = as_type<int>(_743);
        int _755 = as_type<int>(_745);
        _705 = _735 ? (-1) : 0;
        if (_735)
        {
            float _757 = _380 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _747 = as_type<int>(_757);
        }
        int _759 = _747;
        float _761 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        _725 = _759;
        if (_735)
        {
            float _763 = _382 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _749 = as_type<int>(_763);
        }
        int _765 = _749;
        float _767 = _622 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _719 = as_type<int>(_767);
        _729 = _765;
        if (_735)
        {
            float _769 = _761 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _751 = as_type<int>(_769);
        }
        int _771 = _751;
        _727 = _771;
        if (_735)
        {
            _753 = _759;
        }
        int _773 = _753;
        _723 = _773;
        if (_735)
        {
            _755 = _765;
        }
        int _775 = _755;
        _721 = _775;
        if (_735)
        {
            _719 = _771;
        }
    }
    _731 = false;
    int _777 = _705;
    int _779 = _719;
    int _781 = _721;
    int _783 = _723;
    int _785 = _725;
    int _787 = _727;
    int _789 = _729;
    int _791 = 0;
    int _793 = _777;
    if (!_90)
    {
        int _795 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _797 = _795 != 0;
        _791 = _797 ? (-1) : 0;
    }
    int _799 = _791;
    float _801 = _574 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_90)
    {
        _793 = -1;
    }
    int _803 = _793;
    float _805 = _683 * _683;
    int _807 = _803;
    if (!_90)
    {
        int _809 = ~_799;
        bool _811 = !_94;
        int _813 = _809 & (_811 ? (-1) : 0);
        _807 = _813;
    }
    int _815 = _807;
    float _817 = _640 * _642;
    bool _819 = _96 != 0;
    float _821 = exp2(_801);
    float _823 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _825 = _224 * _823;
    float _827 = _805 * _805;
    float _829 = _224 * (-10000.0);
    float _831 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[26].x, _825);
    int _833 = _815;
    if (_86)
    {
        _833 = -1;
    }
    int _835 = _833;
    int _837 = ~_815;
    float _839 = (_837 != 0) ? as_type<float>(_779) : 0.0;
    int _841 = _835;
    if (!_86)
    {
        bool _843 = !_94;
        bool _845 = _843 && _82;
        bool _847 = !_819;
        bool _849 = _845 && _847;
        _841 = _849 ? (-1) : 0;
    }
    int _851 = _841;
    float _853 = -_821;
    float _855 = _853 + 1.0;
    int _857 = ~_815;
    float _859 = (_857 != 0) ? as_type<float>(_781) : 0.0;
    int _861 = ~_815;
    float _863 = (_861 != 0) ? as_type<float>(_783) : 0.0;
    float _865 = _855 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _867 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _869 = _867 != 0;
    int _871 = ~_851;
    float _873 = (_871 != 0) ? as_type<float>(_785) : 0.0;
    int _875 = ~_851;
    float _877 = (_875 != 0) ? as_type<float>(_787) : 0.0;
    int _879 = ~_851;
    float _881 = (_879 != 0) ? as_type<float>(_789) : 0.0;
    bool _883 = !_94;
    bool _885 = _82 && _883;
    bool _887 = !_869;
    float _889 = _887 ? _654 : 0.0;
    float _891 = _889 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _893 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _895 = _893 != 0;
    float _897 = _889 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _899 = !_885;
    float _901 = _899 ? _891 : 0.0;
    float _903 = -_865;
    float _905 = _903 + 1.0;
    bool _907 = !_895;
    bool _909 = !_885;
    float _911 = _909 ? _897 : 0.0;
    float _913 = _901 * _863;
    bool _915 = !_895;
    float _917 = abs(_905);
    float _919 = log2(_917);
    float _921 = _901 * _839;
    float _923 = _901 * _859;
    bool _925 = !_907;
    float _927 = _925 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _929 = fma(_873, _911, _913);
    bool _931 = !_895;
    float _933 = fma(_877, _911, _921);
    bool _935 = !_915;
    float _937 = _935 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _939 = fma(_881, _911, _923);
    float _941 = _927 * _929;
    bool _943 = !_931;
    float _945 = _943 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    int _947 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _949 = _947 != 0;
    float _951 = _937 * _933;
    float _953 = _941 * 0.715200006961822509765625;
    float _955 = _827 * 16.0;
    float _957 = _945 * _939;
    float _959 = _919 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _961 = fma(_951, 0.2125999927520751953125, _953);
    float _963 = _817 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _965 = _919 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _967 = fma(_957, 0.072200000286102294921875, _961);
    float _969 = exp2(_959);
    float _971 = _677 * _955;
    float _973 = _679 * _955;
    float _975 = -_951;
    float _977 = _975 + _967;
    float _979 = _681 * _955;
    float _981 = -_941;
    float _983 = _981 + _967;
    float _985 = fma(_963, _977, _951);
    float _987 = exp2(_965);
    float _989 = fma(_963, _983, _941);
    float _991 = -_957;
    float _993 = _991 + _967;
    bool _995 = !_949;
    bool _997 = !_949;
    float _999 = fma(_963, _993, _957);
    float _1001 = _995 ? _973 : 0.0;
    bool _1003 = !_78;
    float _1005 = _1003 ? _969 : 1.0;
    bool _1007 = !_949;
    int _1009 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1011 = _1009 != 0;
    float _1013 = _997 ? _971 : 0.0;
    float _1015 = _1005 * _889;
    float _1017 = _1007 ? _979 : 0.0;
    float _1019 = _1005 * _985;
    float _1021 = _1005 * _989;
    float _1023 = _82 ? _1015 : _1019;
    float _1025 = _82 ? _1015 : _1021;
    float _1027 = _1015;
    float _1029 = _999;
    float _1031 = _971;
    if (!_82)
    {
        float _1033 = _1005 * _999;
        _1027 = _1033;
    }
    float _1035 = _1027;
    float _1037 = _1023 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    bool _1039 = !_78;
    int _1041 = _1039 ? as_type<int>(_987) : 1065353216;
    float _1043 = _1035 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    int _1045 = _1041;
    if (_78)
    {
        _1029 = 0.0;
    }
    float _1047 = _1029;
    float _1049 = as_type<float>(_1041) * _1013;
    float _1051 = as_type<float>(_1041) * _1001;
    float _1053 = as_type<float>(_1041) * _1017;
    float _1055 = fma(_1049, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1037);
    float _1057 = _1025 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1059 = _1057;
    float _1061 = _1055;
    float _1063 = _1047;
    if (_78)
    {
        _1045 = as_type<int>(_701);
    }
    int _1065 = _1045;
    float _1067 = fma(_1053, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1043);
    float _1069 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1057);
    int _1071 = _1065;
    int _1073 = _1065;
    float _1075 = _1067;
    float _1077 = _1069;
    if (_78)
    {
        _1031 = 0.0;
    }
    float _1079 = _1031;
    float _1081 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1083 = _1079;
    if (_78)
    {
        _1059 = 0.0;
    }
    float _1085 = _1059;
    bool _1087 = !_78;
    float _1089 = _1087 ? _865 : 0.0;
    float _1091 = _1085;
    if (!_78)
    {
        int _1093 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1095 = _1093 != 0;
        float _1097 = _670 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1099 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1101 = _1099 != 0;
        float _1103 = _668 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1105 = _672 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1107 = !_1101;
        float _1109 = _1107 ? _1103 : 0.0;
        bool _1111 = !_1101;
        float _1113 = _1111 ? _1097 : 0.0;
        bool _1115 = !_1101;
        float _1117 = _1115 ? _1105 : 0.0;
        float _1119 = _1089 * _1109;
        _1063 = _1119;
        if (!_1095)
        {
            _1071 = as_type<int>(_701);
        }
        int _1121 = _1071;
        float _1123 = _1089 * _1113;
        float _1125 = _1089 * _1117;
        bool _1127 = !_1095;
        _1073 = _1121;
        _1091 = _1125;
        _1083 = _1123;
        if (!_1127)
        {
            float _1129 = -_1089;
            float _1131 = _1129 + 1.0;
            float _1133 = precise::clamp(_1131, 0.0, 1.0);
            float _1135 = _701 * _1133;
            float _1137 = precise::max(_1135, 9.9999997473787516355514526367188e-05);
            float _1139 = 1.0 / _1137;
            float _1141 = _701 * _1139;
            float _1143 = _1055 * _1141;
            float _1145 = _1069 * _1141;
            float _1147 = _1067 * _1141;
            _1073 = as_type<int>(_1135);
            _1075 = _1147;
            _1091 = 0.0;
            _1061 = _1143;
            _1063 = 0.0;
            _1077 = _1145;
            _1083 = 0.0;
        }
    }
    int _1149 = _1073;
    float _1151 = _1075;
    float _1153 = _1091;
    float _1155 = _1061;
    float _1157 = _1063;
    float _1159 = _1077;
    float _1161 = _1083;
    bool _1163 = !_1011;
    float _1165 = _1163 ? as_type<float>(_1149) : 1.0;
    float _1167 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[26].z, _831);
    float _1169 = abs(_829);
    bool _1171 = _1169 > 0.00999999977648258209228515625;
    float _1173 = -_1081;
    float _1175 = exp2(_1173);
    float _1177 = -_1165;
    float _1179 = _1177 + 1.0;
    float _1181 = _1171 ? _829 : 0.00999999977648258209228515625;
    float _1183 = _660 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1185 = _1151 + _1153;
    float _1187 = fma(_1167, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1189 = abs(_1179);
    float _1191 = log2(_1189);
    float _1193 = _1181 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1195 = fma(_1187, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    int _1197 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1199 = _1197 != 0;
    float _1201 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1203 = fma(_1201, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1205 = precise::max(_1193, -127.0);
    float _1207 = abs(_1195);
    float _1209 = log2(_1207);
    float _1211 = _1191 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1213 = -_1205;
    float _1215 = exp2(_1213);
    float _1217 = _1209 * 1.5;
    float _1219 = exp2(_1211);
    float _1221 = _1155 + _1157;
    float _1223 = -_1215;
    float _1225 = _1223 + 1.0;
    float _1227 = 1.0 / _1205;
    float _1229 = _1175 * _1225;
    float _1231 = _1159 + _1161;
    float _1233 = _662 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1235 = _664 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1237 = -_1219;
    float _1239 = spvFAdd(_1237, 1.00010001659393310546875);
    float _1241 = -_1219;
    float _1243 = _1241 + 1.0;
    float _1245 = exp2(_1217);
    float _1247 = -_1165;
    float _1249 = _1247 + _1243;
    float _1251 = _1249 * _1233;
    float _1253 = 1.0 / _1239;
    float _1255 = _1249 * _1183;
    float _1257 = _1229 * _1227;
    float _1259 = fma(_1231, _1165, _1251);
    float _1261 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1263 = fma(_1221, _1165, _1255);
    float _1265 = _1249 * _1235;
    float _1267 = _1257 * _1261;
    float _1269 = _1245 * 12.56637096405029296875;
    float _1271 = fma(_1185, _1165, _1265);
    float _1273 = 1.0 / _1269;
    float _1275 = _1253 * _1259;
    float _1277 = _1253 * _1263;
    float _1279 = _1253 * _1271;
    float _1281 = _1275 * 0.715200006961822509765625;
    float _1283 = -_1267;
    float _1285 = exp2(_1283);
    float _1287 = fma(_1277, 0.2125999927520751953125, _1281);
    float _1289 = fma(_1279, 0.072200000286102294921875, _1287);
    float _1291 = _1203 * _1273;
    float _1293 = 1.0 / _1289;
    float _1295 = -_1285;
    float _1297 = _1295 + 1.0;
    float _1299 = _1297 * _1291;
    float _1301 = _1299 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1303 = _1293 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1305 = precise::clamp(_1303, 0.0, 1.0);
    float _1307 = _1299 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1309 = fma(_1305, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1311 = _1309 * _1285;
    float _1313 = _1299 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1315 = fma(_1277, _1311, _1301);
    float _1317 = fma(_1275, _1311, _1313);
    float _1319 = fma(_1279, _1311, _1307);
    bool _1321 = !_1199;
    float _1323 = _1219;
    float _1325 = _1319;
    float _1327 = _1277;
    int _1329 = as_type<int>(_1219);
    int _1331 = as_type<int>(_1277);
    float _1333 = _1319;
    if (!_1321)
    {
        bool _1335 = _1243 != 1.0;
        bool _1337 = isnan(_1243);
        bool _1339 = _1335 || _1337;
        bool _1341 = isnan(1.0);
        bool _1343 = _1339 || _1341;
        float _1345 = -_1219;
        bool _1347 = _1345 != (-1.0);
        bool _1349 = isnan(_1345);
        bool _1351 = _1347 || _1349;
        bool _1353 = isnan(-1.0);
        bool _1355 = _1351 || _1353;
        float _1357 = -_1219;
        bool _1359 = _1357 == (-1.0);
        bool _1361 = !_1343;
        bool _1363 = _1359 || _1361;
        bool _1365 = _1243 == 1.0;
        bool _1367 = _1365 && _1355;
        bool _1369 = !_1363;
        float _1371 = _1369 ? _1243 : 0.0;
        bool _1373 = !_1367;
        float _1375 = _1373 ? 0.0 : 1.0;
        float _1377 = _1363 ? 0.0 : 0.5;
        float _1379 = _1371 * 0.715200006961822509765625;
        float _1381 = fma(_1375, 0.2125999927520751953125, _1379);
        float _1383 = fma(_1377, 0.072200000286102294921875, _1381);
        float _1385 = 1.0 / _1383;
        float _1387 = _1385 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1389 = precise::clamp(_1387, 0.0, 1.0);
        float _1391 = fma(_1389, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1393 = _1375 * _1391;
        float _1395 = _1371 * _1391;
        float _1397 = _1377 * _1391;
        out.m_38.x = _1393;
        out.m_38.y = _1395;
        out.m_38.z = _1397;
        out.m_38.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    bool _1399 = _96 != 0;
    bool _1401 = !_1399;
    if (!_1401)
    {
        if (_86)
        {
            _1323 = 0.0;
        }
        float _1403 = _1323;
        float _1405 = _1403;
        if (_86)
        {
            _1325 = 0.0;
        }
        float _1407 = _1325;
        float _1409 = _1407;
        if (!_86)
        {
            float _1411 = _873 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1409 = _1411;
        }
        float _1413 = _1409;
        float _1415 = _1413;
        if (!_86)
        {
            float _1417 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1405 = _1417;
        }
        float _1419 = _1405;
        float _1421 = _1419;
        if (!_90)
        {
            float _1423 = fma(_863, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1413);
            _1415 = _1423;
        }
        float _1425 = _1415;
        if (_86)
        {
            _1327 = 0.0;
        }
        float _1427 = _1327;
        float _1429 = _1427;
        if (!_86)
        {
            float _1431 = _881 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1429 = _1431;
        }
        float _1433 = _1429;
        float _1435 = _1425 * 0.715200006961822509765625;
        float _1437 = _1433;
        if (!_90)
        {
            float _1439 = fma(_839, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1419);
            _1421 = _1439;
        }
        float _1441 = _1421;
        if (!_90)
        {
            float _1443 = fma(_859, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1433);
            _1437 = _1443;
        }
        float _1445 = _1437;
        float _1447 = fma(_1441, 0.2125999927520751953125, _1435);
        float _1449 = fma(_1445, 0.072200000286102294921875, _1447);
        float _1451 = 1.0 / _1449;
        float _1453 = _1451 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1455 = precise::clamp(_1453, 0.0, 1.0);
        float _1457 = fma(_1455, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1459 = _1457 * _1441;
        float _1461 = _1457 * _1425;
        float _1463 = _1457 * _1445;
        out.m_38.x = _1459;
        out.m_38.y = _1461;
        out.m_38.z = _1463;
        out.m_38.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    if (!_94)
    {
        _1329 = as_type<int>(_1317);
    }
    int _1465 = _1329;
    float _1467 = as_type<float>(_1465);
    if (!_94)
    {
        _1331 = as_type<int>(_1243);
    }
    int _1469 = _1331;
    float _1471 = as_type<float>(_1469);
    if (!_94)
    {
        out.m_38.x = _1315;
        out.m_38.y = as_type<float>(_1465);
        out.m_38.z = _1319;
        out.m_38.w = as_type<float>(_1469);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    if (_86)
    {
        _1467 = 0.0;
    }
    float _1473 = _1467;
    float _1475 = _1473;
    if (_86)
    {
        _1333 = 0.0;
    }
    float _1477 = _1333;
    float _1479 = _1477;
    if (!_86)
    {
        float _1481 = _873 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1479 = _1481;
    }
    float _1483 = _1479;
    float _1485 = _1483;
    if (!_86)
    {
        float _1487 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1475 = _1487;
    }
    float _1489 = _1475;
    float _1491 = _1489;
    if (!_90)
    {
        float _1493 = fma(_863, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1483);
        _1485 = _1493;
    }
    float _1495 = _1485;
    if (_86)
    {
        _1471 = 0.0;
    }
    float _1497 = _1471;
    float _1499 = _1497;
    if (!_86)
    {
        float _1501 = _881 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1499 = _1501;
    }
    float _1503 = _1499;
    float _1505 = _1495 * 0.715200006961822509765625;
    float _1507 = _1503;
    if (!_90)
    {
        float _1509 = fma(_839, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1489);
        _1491 = _1509;
    }
    float _1511 = _1491;
    if (!_90)
    {
        float _1513 = fma(_859, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1503);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = fma(_1511, 0.2125999927520751953125, _1505);
    float _1519 = fma(_1515, 0.072200000286102294921875, _1517);
    float _1521 = 1.0 / _1519;
    float _1523 = _1521 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1525 = precise::clamp(_1523, 0.0, 1.0);
    float _1527 = fma(_1525, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1529 = _1527 * _1511;
    float _1531 = _1527 * _1495;
    float _1533 = _1527 * _1515;
    out.m_38.x = _1529;
    out.m_38.y = _1531;
    out.m_38.z = _1533;
    out.m_38.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

