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
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_ESmplr_w [[id(19)]];
    sampler fp_t_tcb_CSmplr_w [[id(20)]];
    sampler fp_t_tcb_10Smplr_w [[id(21)]];
    sampler fp_t_tcb_12Smplr_w [[id(22)]];
    sampler fp_t_tcb_14Smplr_w [[id(23)]];
    sampler fp_t_tcb_16Smplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _54(thread const int& _3922, thread const int& _3923, thread const int& _3924, thread const int& _3925, thread const int& _3926, thread int& _3927, thread int& _3928, thread int& _3929, thread int& _3930, thread int& _3931, thread int& _3932)
{
    float _3935 = as_type<float>(_3926) + 0.0;
    bool _3937 = _3935 != 0.0;
    bool _3939 = isnan(_3935);
    bool _3941 = _3937 || _3939;
    bool _3943 = isnan(0.0);
    bool _3945 = _3941 || _3943;
    int _3947 = as_type<int>(_3935);
    int _3949 = 0;
    int _3951 = _3922;
    int _3953 = _3945 ? (-1) : 0;
    if (!_3945)
    {
        float _3955 = as_type<float>(_3926) * 1.0;
        _3947 = as_type<int>(_3955);
    }
    int _3957 = _3947;
    bool _3959 = !_3945;
    int _3961 = _3957;
    if (!_3959)
    {
        float _3963 = as_type<float>(_3926) + 0.0;
        bool _3965 = _3963 >= 0.0;
        bool _3967 = isnan(_3963);
        bool _3969 = _3965 || _3967;
        bool _3971 = isnan(0.0);
        bool _3973 = _3969 || _3971;
        int _3975 = as_type<int>(_3963);
        _3953 = _3973 ? (-1) : 0;
        if (!_3973)
        {
            _3975 = 2147483647;
        }
        int _3977 = _3975;
        bool _3979 = !_3973;
        _3961 = _3977;
        if (!_3979)
        {
            float _3981 = abs(as_type<float>(_3926));
            float _3983 = _3981 + 0.0;
            bool _3985 = _3983 > as_type<float>(0x7f800000u /* inf */);
            bool _3987 = isnan(_3983);
            bool _3989 = _3985 || _3987;
            bool _3991 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3993 = _3989 || _3991;
            int _3995 = as_type<int>(_3983);
            _3949 = 2139095040;
            _3953 = _3993 ? (-1) : 0;
            if (_3993)
            {
                float _3997 = as_type<float>(_3926) + 1.0;
                _3995 = as_type<int>(_3997);
            }
            int _3999 = _3995;
            _3961 = _3999;
            if (!_3993)
            {
                float _4001 = abs(as_type<float>(_3926));
                float _4003 = _4001 + (-0.0);
                float _4005 = 0.0 + _4003;
                bool _4007 = _4005 != as_type<float>(0x7f800000u /* inf */);
                bool _4009 = isnan(_4005);
                bool _4011 = _4007 || _4009;
                bool _4013 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4015 = _4011 || _4013;
                int _4017 = as_type<int>(_4005);
                _3953 = _4015 ? (-1) : 0;
                if (!_4015)
                {
                    _4017 = _3926;
                }
                int _4019 = _4017;
                bool _4021 = !_4015;
                _3961 = _4019;
                if (!_4021)
                {
                    float _4023 = as_type<float>(_3926) * 18446744073709551616.0;
                    float _4025 = rsqrt(_4023);
                    float _4027 = _4023 * _4025;
                    float _4029 = _4025 * 0.5;
                    float _4031 = -_4027;
                    float _4033 = 0.0 + _4031;
                    float _4035 = fma(_4029, _4033, 0.5);
                    float _4037 = fma(_4027, _4035, _4027);
                    float _4039 = -_4037;
                    float _4041 = 0.0 + _4039;
                    float _4043 = fma(_4037, _4041, _4023);
                    float _4045 = fma(_4029, _4043, _4037);
                    float _4047 = _4045 * 2.3283064365386962890625e-10;
                    _3961 = as_type<int>(_4047);
                    _3949 = as_type<int>(_4023);
                    _3951 = as_type<int>(_4043);
                }
            }
        }
    }
    int _4049 = _3961;
    int _4051 = _3949;
    int _4053 = _3951;
    int _4055 = _3953;
    _3927 = _4049;
    _3928 = _4051;
    _3929 = _4053;
    _3930 = _3925;
    _3931 = 0;
    _3932 = _4055;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _817 = false;
    bool _272 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_43.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_43.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_43.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    int _78 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _82 = _78 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _102 = _100 != 0;
    int _104 = int(_82);
    float _106 = 1.0 / _58;
    float _108 = _106 * _64;
    float _110 = _106 * _70;
    float _112 = _106 * _76;
    float _114 = _108 * _108;
    float _116 = fma(_110, _110, _114);
    float _118 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _120 = fma(_112, _112, _116);
    float _122 = precise::max(0.0, _118);
    float _124 = rsqrt(_120);
    float _126 = _110 * _124;
    float _128 = _112 * _124;
    float _130 = _108 * _124;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _136 = -_130;
    float _138 = -_122;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].z, _138);
    float _142 = _132 * _132;
    float _144 = _134 * _134;
    float _146 = _142 + _144;
    float _148 = sqrt(_146);
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _152 = _122;
    float _154 = _140;
    float _156 = _144;
    float _158 = _132;
    float _160 = _134;
    if (!_150)
    {
        _152 = _142;
    }
    float _162 = _152;
    bool _164 = !_150;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _172 = _148 + _170;
        float _174 = _140 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _176 = rsqrt(_146);
        float _178 = _172 * _168;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _180 * 6.283185482025146484375;
        float _184 = sin(_182);
        float _186 = _180 * 6.283185482025146484375;
        float _188 = cos(_186);
        float _190 = fma(_184, _174, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _192 = _176 * _190;
        float _194 = _188 + (-1.0);
        float _196 = _132 * _192;
        float _198 = _134 * _192;
        float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _202 = _198 * _198;
        float _204 = fma(_140, _188, _200);
        float _206 = _196 * _196;
        _154 = _204;
        _166 = _206;
        _156 = _202;
        _158 = _196;
        _160 = _198;
    }
    float _208 = _154;
    float _210 = _166;
    float _212 = _156;
    float _214 = _158;
    float _216 = _160;
    float _218 = fma(_208, _208, _210);
    float _220 = _218 + _212;
    float _222 = rsqrt(_220);
    float _224 = _222 * _208;
    float _226 = -_224;
    float _228 = precise::max(0.0, _226);
    float _230 = abs(_228);
    float _232 = -_230;
    float _234 = _232 + 1.0;
    float _236 = fma(_228, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _238 = as_type<int>(_234) + (-218103808);
    float _240 = fma(_228, _236, -0.212114393711090087890625);
    bool _242 = uint(_238) >= 1920991232u;
    float _244 = fma(_228, _240, 1.570728778839111328125);
    bool _246 = !_242;
    float _270;
    if (!_246)
    {
        int _248 = 0;
        int _250 = 0;
        int _252 = 0;
        int _254 = 1184;
        int _256 = as_type<int>(_234);
        int _258;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        _54(_248, _250, _252, _254, _256, _258, _260, _262, _264, _266, _268);
        _270 = as_type<float>(_258);
        _272 = true;
    }
    else
    {
        float _274 = rsqrt(_234);
        float _276 = _234 * _274;
        float _278 = _274 * 0.5;
        float _280 = -_276;
        float _282 = 0.0 + _280;
        float _284 = fma(_278, _282, 0.5);
        float _286 = fma(_276, _284, _276);
        float _288 = -_286;
        float _290 = 0.0 + _288;
        float _292 = fma(_286, _290, _234);
        float _294 = fma(_278, _292, _286);
        _270 = _294;
    }
    _272 = false;
    float _296 = _270;
    bool _298 = _224 > 0.0;
    float _300 = _128 * _128;
    float _302 = _126 * _126;
    float _304 = _300 + _302;
    if (_298)
    {
        discard_fragment();
    }
    float _306 = rsqrt(_304);
    float _308 = _244 * _296;
    float _310 = _308 * 0.636619746685028076171875;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = sqrt(_316);
    float _320 = _128 * _306;
    float _322 = _126 * _306;
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
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return out;
    }
    float2 _1968;
    _1968.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    _1968.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    float _350 = _1968.x;
    float _352 = _350 * 256.0;
    int _354 = int(_352);
    float _356 = -_130;
    float _358 = _356 + 1.0;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = -_130;
    float _364 = fma(_362, _130, 1.0);
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _222 * _214;
    int _370 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _372 = _370 != 0;
    float _374 = _222 * _216;
    float _376 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _380 = _368 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _386 = fma(_300, 3.0, -1.0);
    float _388 = -_380;
    float _390 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _388);
    float _392 = fma(_130, _382, _376);
    float _394 = fma(_130, _384, _378);
    float _396 = _360;
    if (_372)
    {
        float _398 = sqrt(_366);
        _396 = _398;
    }
    float _400 = _396;
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _404 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _408 = -_374;
    float _410 = fma(_408, (*spvDescriptorSet0.fp_c3)._m0[11].z, _390);
    float _412 = -_128;
    float _414 = fma(_412, _402, _394);
    float _416 = fma(_128, _402, _394);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _420 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _422 = fma(_130, _406, _404);
    float _424 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _426 = -_128;
    float _428 = fma(_426, _418, _392);
    float _430 = -_128;
    float _432 = fma(_430, _420, _422);
    float _434 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _436 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _438 = abs(_400);
    float _440 = log2(_438);
    float _442 = fma(_128, _418, _392);
    float _444 = fma(_128, _420, _422);
    float _446 = -_126;
    float _448 = fma(_446, _424, _414);
    float _450 = fma(_126, _424, _416);
    float _452 = -_126;
    float _454 = fma(_452, _434, _428);
    float _456 = -_126;
    float _458 = fma(_456, _436, _432);
    float _460 = -_130;
    float _462 = _126 * _460;
    float _464 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _466 = fma(_126, _434, _442);
    float _468 = fma(_126, _436, _444);
    float _470 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _472 = _126 * _130;
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _476 = fma(_464, _462, _454);
    float _478 = _440 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = fma(_470, _462, _448);
    float _482 = fma(_470, _472, _450);
    float _484 = fma(_464, _472, _466);
    float _486 = fma(_474, _462, _458);
    float _488 = fma(_474, _472, _468);
    float _490 = exp2(_478);
    float _492 = _128 * (-3.0);
    float _494 = fma(_410, 0.5, 0.5);
    float _496 = _130 * _128;
    float _498 = _126 * _128;
    float _500 = -_128;
    float _502 = fma(_500, _492, -1.0);
    float _504 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _506 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _508 = fma(_494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _510 = fma(_494, _508, -0.212114393711090087890625);
    float _512 = _490 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _514 = fma(_494, _510, 1.570728778839111328125);
    float _516 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _518 = precise::clamp(_516, 0.0, 1.0);
    float _520 = -_128;
    float _522 = _130 * _520;
    float _524 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _528 = -_518;
    float _530 = _528 + 1.0;
    float _532 = fma(_410, -0.5, 0.5);
    float _534 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _536 = fma(_524, _522, _480);
    float _538 = fma(_524, _496, _482);
    float _540 = fma(_526, _522, _486);
    float _542 = abs(_530);
    float _544 = log2(_542);
    float _546 = fma(_534, _522, _476);
    float _548 = fma(_534, _496, _484);
    float _550 = in.m_48.x;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    float _556 = in.m_48.y;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    float _562 = fma(_526, _496, _488);
    float _564 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _566 = sqrt(_532);
    float _568 = _224 + 1.0;
    float _570 = fma(_564, _498, _536);
    float _572 = fma(_564, _498, _538);
    float _574 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _576 = fma(_504, _498, _540);
    float _578 = fma(_504, _498, _562);
    float _580 = fma(_506, _498, _546);
    float _582 = _544 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _584 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _586 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _588 = fma(_574, _502, _570);
    float _590 = fma(_574, _386, _572);
    float _592 = fma(_506, _498, _548);
    float _594 = exp2(_582);
    float _596 = fma(_584, _502, _580);
    float _598 = _566 * 0.636619746685028076171875;
    float _600 = fma(_224, -0.5, 0.5);
    float _602 = -_514;
    float _604 = fma(_598, _602, 1.0);
    float _606 = _106 * _554;
    float _608 = _106 * _560;
    float _610 = -_224;
    float _612 = fma(_594, _568, _610);
    float _614 = fma(_586, _502, _576);
    float _616 = fma(_612, 0.5, 0.5);
    float _618 = float(uint(_354));
    float _620 = _618 * 0.00390625;
    float2 _2399 = float2(_346, _348);
    float4 _623 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2399, float2(0.0), isnan(_2399)), level(_620)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2399, float2(0.0), isnan(_2399)), level(_620)).xyzw;
    float _625 = _623.x;
    float _627 = _623.y;
    float _629 = _623.z;
    float _631 = _623.w;
    float2 _2418 = float2(_346, _348);
    float2 _635 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2418, float2(0.0), isnan(_2418)), level(_620)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2418, float2(0.0), isnan(_2418)), level(_620)).xy;
    float _637 = _635.x;
    float _639 = _635.y;
    float2 _2431 = float2(_346, _348);
    float2 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2431, float2(0.0), isnan(_2431)), level(_620)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2431, float2(0.0), isnan(_2431)), level(_620)).xy;
    float _643 = _641.x;
    float _645 = _641.y;
    float2 _2444 = float2(_346, _348);
    float4 _647 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2444, float2(0.0), isnan(_2444)), level(_620)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2444, float2(0.0), isnan(_2444)), level(_620)).xyzw;
    float _649 = _647.x;
    float _651 = _647.y;
    float _653 = _647.z;
    float _655 = _647.w;
    float2 _2461 = float2(_606, _608);
    float3 _659 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2461, float2(0.0), isnan(_2461))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2461, float2(0.0), isnan(_2461))).xyz;
    float _661 = _659.x;
    float _663 = _659.y;
    float _665 = _659.z;
    float2 _2475 = float2(_604, _600);
    float3 _667 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2475, float2(0.0), isnan(_2475))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2475, float2(0.0), isnan(_2475))).xyz;
    float _669 = _667.x;
    float _671 = _667.y;
    float _673 = _667.z;
    float2 _2489 = float2(_604, _616);
    float3 _675 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2489, float2(0.0), isnan(_2489))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2489, float2(0.0), isnan(_2489))).xyz;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    float _683 = fma(_586, _386, _578);
    float _685 = fma(_584, _386, _592);
    float _687 = -_130;
    float _689 = fma(_687, _130, _302);
    int _691 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _693 = _691 != 0;
    float _695 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    int _697 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _699 = _697 != 0;
    float _701 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _703 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _705 = fma(_695, _689, _588);
    float _707 = fma(_695, _689, _590);
    float _709 = fma(_701, _689, _596);
    float _711 = fma(_701, _689, _685);
    float _713 = fma(_703, _689, _614);
    float _715 = fma(_703, _689, _683);
    float _717 = _631 * _631;
    float _719 = -_639;
    float _721 = _719 + _645;
    float _723 = _655 * _655;
    float _725 = _717 * _717;
    float _727 = _637 * _639;
    float _729 = fma(_721, (*spvDescriptorSet0.fp_c3)._m0[0].x, _639);
    float _731 = _723 * _723;
    float _733 = _725 * 16.0;
    float _735 = precise::max(_729, 1.52587890625e-05);
    float _737 = _733 * _639;
    float _739 = -_727;
    float _741 = fma(_643, _645, _739);
    float _743 = _731 * 16.0;
    float _745 = _625 * _737;
    float _747 = 1.0 / _735;
    float _749 = _627 * _737;
    float _751 = _743 * _645;
    float _753 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[0].x, _727);
    float _755 = _629 * _737;
    float _757 = -_665;
    float _759 = _757 + 1.0;
    float _761 = -_745;
    float _763 = fma(_649, _751, _761);
    float _765 = -_749;
    float _767 = fma(_651, _751, _765);
    float _769 = -_755;
    float _771 = fma(_653, _751, _769);
    float _773 = _729 * _759;
    float _775 = fma(_763, (*spvDescriptorSet0.fp_c3)._m0[0].x, _745);
    float _777 = fma(_767, (*spvDescriptorSet0.fp_c3)._m0[0].x, _749);
    float _779 = fma(_771, (*spvDescriptorSet0.fp_c3)._m0[0].x, _755);
    float _781 = _773 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _783 = _753 * _747;
    bool _785 = !_693;
    float _787 = _785 ? _783 : 0.0;
    bool _789 = !_699;
    int _791 = _699 ? (-1) : 0;
    int _805;
    int _807;
    int _809;
    int _811;
    int _813;
    int _815;
    if (!_789)
    {
        float _793 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _795 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _797 = _458 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _799 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _801 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _803 = _468 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _805 = as_type<int>(_799);
        _807 = as_type<int>(_801);
        _809 = as_type<int>(_803);
        _811 = as_type<int>(_793);
        _813 = as_type<int>(_795);
        _815 = as_type<int>(_797);
        _817 = true;
    }
    else
    {
        int _819 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _821 = _819 != 0;
        float _823 = _713 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _825 = _705 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _827 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _829 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _831 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _833 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _835 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _837 = _715 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _839 = as_type<int>(_823);
        int _841 = as_type<int>(_825);
        int _843 = as_type<int>(_827);
        int _845 = as_type<int>(_837);
        int _847 = as_type<int>(_829);
        _791 = _821 ? (-1) : 0;
        _807 = as_type<int>(_835);
        if (_821)
        {
            float _849 = _404 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _839 = as_type<int>(_849);
        }
        int _851 = _839;
        _815 = _851;
        if (_821)
        {
            float _853 = _831 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _841 = as_type<int>(_853);
        }
        int _855 = _841;
        _811 = _855;
        if (_821)
        {
            float _857 = _833 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _843 = as_type<int>(_857);
        }
        int _859 = _843;
        _813 = _859;
        if (_821)
        {
            _845 = _851;
        }
        int _861 = _845;
        _809 = _861;
        if (_821)
        {
            _847 = _855;
        }
        int _863 = _847;
        _805 = _863;
        if (_821)
        {
            _807 = _859;
        }
    }
    _817 = false;
    int _865 = _791;
    int _867 = _805;
    int _869 = _807;
    int _871 = _809;
    int _873 = _811;
    int _875 = _813;
    int _877 = _815;
    float2 _2832 = float2(_606, _608);
    float2 _879 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2832, float2(0.0), isnan(_2832))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2832, float2(0.0), isnan(_2832))).xy;
    float _881 = _879.x;
    float _883 = _879.y;
    int _885 = 0;
    int _887 = _865;
    if (!_98)
    {
        int _889 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _891 = _889 != 0;
        _885 = _891 ? (-1) : 0;
    }
    int _893 = _885;
    if (_98)
    {
        _887 = -1;
    }
    int _895 = _887;
    int _897 = _895;
    if (!_98)
    {
        int _899 = ~_893;
        bool _901 = !_102;
        int _903 = _899 & (_901 ? (-1) : 0);
        _897 = _903;
    }
    int _905 = _897;
    bool _907 = _104 != 0;
    float _909 = fma(_881, 2.0, -1.0);
    float _911 = fma(_883, 2.0, -1.0);
    float _913 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[22].x, _606);
    float _915 = fma(_911, (*spvDescriptorSet0.fp_c3)._m0[22].y, _608);
    float2 _2896 = float2(_913, _915);
    float4 _917 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2896, float2(0.0), isnan(_2896))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2896, float2(0.0), isnan(_2896))).xyzw;
    float _919 = _917.x;
    float _921 = _917.y;
    float _923 = _917.z;
    float _925 = _917.w;
    float _927 = _544 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _929 = _787 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _931 = _787 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _933 = _905;
    if (_94)
    {
        _933 = -1;
    }
    int _935 = _933;
    float _937 = exp2(_927);
    int _939 = _935;
    if (!_94)
    {
        bool _941 = !_102;
        bool _943 = _941 && _90;
        bool _945 = !_907;
        bool _947 = _943 && _945;
        _939 = _947 ? (-1) : 0;
    }
    int _949 = _939;
    int _951 = ~_905;
    float _953 = (_951 != 0) ? as_type<float>(_867) : 0.0;
    float _955 = _661 * _663;
    int _957 = ~_905;
    float _959 = (_957 != 0) ? as_type<float>(_869) : 0.0;
    float _961 = _777 * _747;
    int _963 = ~_905;
    float _965 = (_963 != 0) ? as_type<float>(_871) : 0.0;
    float _967 = _955 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _969 = _779 * _747;
    float _971 = _775 * _747;
    bool _973 = !_102;
    bool _975 = _90 && _973;
    float _977 = -_937;
    float _979 = _977 + 1.0;
    int _981 = ~_949;
    float _983 = (_981 != 0) ? as_type<float>(_873) : 0.0;
    int _985 = ~_949;
    float _987 = (_985 != 0) ? as_type<float>(_875) : 0.0;
    float _989 = _979 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _991 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _993 = _991 != 0;
    bool _995 = !_975;
    float _997 = _995 ? _929 : 0.0;
    float _999 = -_989;
    float _1001 = _999 + 1.0;
    bool _1003 = !_975;
    float _1005 = _1003 ? _931 : 0.0;
    int _1007 = ~_949;
    float _1009 = (_1007 != 0) ? as_type<float>(_877) : 0.0;
    bool _1011 = !_993;
    float _1013 = abs(_1001);
    float _1015 = log2(_1013);
    float _1017 = _1005 * _959;
    float _1019 = _1005 * _953;
    float _1021 = _1005 * _965;
    bool _1023 = !_993;
    float _1025 = fma(_987, _997, _1017);
    bool _1027 = !_1011;
    float _1029 = _1027 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1031 = fma(_983, _997, _1019);
    float _1033 = fma(_1009, _997, _1021);
    bool _1035 = !_1023;
    float _1037 = _1035 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    bool _1039 = !_993;
    float _1041 = _1029 * _1025;
    float _1043 = _1037 * _1031;
    bool _1045 = !_1039;
    float _1047 = _1045 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1049 = _1015 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1051 = _1041 * 0.715200006961822509765625;
    float _1053 = _1015 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    int _1055 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1057 = _1055 != 0;
    float _1059 = _1047 * _1033;
    float _1061 = fma(_1043, 0.2125999927520751953125, _1051);
    float _1063 = exp2(_1049);
    float _1065 = fma(_1059, 0.072200000286102294921875, _1061);
    bool _1067 = !_1057;
    float _1069 = -_1043;
    float _1071 = _1069 + _1065;
    float _1073 = exp2(_1053);
    float _1075 = -_1041;
    float _1077 = _1075 + _1065;
    float _1079 = -_1059;
    float _1081 = _1079 + _1065;
    float _1083 = fma(_967, _1071, _1043);
    bool _1085 = !_1057;
    float _1087 = fma(_967, _1077, _1041);
    float _1089 = fma(_967, _1081, _1059);
    bool _1091 = !_1057;
    bool _1093 = !_86;
    float _1095 = _1093 ? _1063 : 1.0;
    float _1097 = _1067 ? _961 : 0.0;
    float _1099 = _1085 ? _969 : 0.0;
    float _1101 = _787 * _1095;
    float _1103 = _1095 * _1083;
    bool _1105 = !_86;
    float _1107 = _1105 ? _1073 : 1.0;
    float _1109 = _1095 * _1087;
    float _1111 = _90 ? _1101 : _1103;
    float _1113 = _1107 * _1097;
    float _1115 = _1107 * _1099;
    float _1117 = _90 ? _1101 : _1109;
    float _1119 = _1101;
    int _1121 = as_type<int>(_1115);
    float _1123 = _1089;
    float _1125 = _1081;
    float _1127 = _1113;
    if (!_90)
    {
        float _1129 = _1095 * _1089;
        _1119 = _1129;
    }
    float _1131 = _1119;
    float _1133 = _1091 ? _971 : 0.0;
    float _1135 = _1117 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1137 = _1131 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1139 = _1107 * _1133;
    float _1141 = fma(_1113, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1135);
    float _1143 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1137);
    float _1145 = _1137;
    float _1147 = _1141;
    if (_86)
    {
        _1121 = as_type<int>(_781);
    }
    int _1149 = _1121;
    float _1151 = _1111 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1153 = fma(_1139, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1151);
    float _1155 = _1151;
    int _1157 = _1149;
    int _1159 = _1149;
    if (_86)
    {
        _1123 = 0.0;
    }
    float _1161 = _1123;
    float _1163 = _1161;
    if (_86)
    {
        _1125 = 0.0;
    }
    float _1165 = _1125;
    float _1167 = _1165;
    if (_86)
    {
        _1127 = 0.0;
    }
    float _1169 = _1127;
    bool _1171 = !_86;
    float _1173 = _1171 ? _989 : 0.0;
    float _1175 = _1169;
    if (_86)
    {
        _1155 = _1153;
    }
    float _1177 = _1155;
    float _1179 = _1177;
    float _1181 = _1177;
    if (_86)
    {
        _1145 = _1143;
    }
    float _1183 = _1145;
    float _1185 = _1183;
    float _1187 = _1183;
    if (!_86)
    {
        int _1189 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1191 = _1189 != 0;
        float _1193 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1195 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1197 = _1195 != 0;
        float _1199 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1201 = _681 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1203 = !_1197;
        float _1205 = _1203 ? _1199 : 0.0;
        bool _1207 = !_1197;
        float _1209 = _1207 ? _1193 : 0.0;
        bool _1211 = !_1197;
        float _1213 = _1211 ? _1201 : 0.0;
        float _1215 = _1173 * _1205;
        _1163 = _1215;
        if (!_1191)
        {
            _1157 = as_type<int>(_781);
        }
        int _1217 = _1157;
        float _1219 = _1173 * _1209;
        _1167 = _1219;
        _1159 = _1217;
        if (!_1191)
        {
            _1179 = _1153;
        }
        float _1221 = _1179;
        float _1223 = _1173 * _1213;
        _1181 = _1221;
        _1175 = _1223;
        if (!_1191)
        {
            _1185 = _1143;
        }
        float _1225 = _1185;
        bool _1227 = !_1191;
        _1187 = _1225;
        if (!_1227)
        {
            float _1229 = -_1173;
            float _1231 = _1229 + 1.0;
            float _1233 = precise::clamp(_1231, 0.0, 1.0);
            float _1235 = _781 * _1233;
            float _1237 = precise::max(_1235, 9.9999997473787516355514526367188e-05);
            float _1239 = 1.0 / _1237;
            float _1241 = _781 * _1239;
            float _1243 = _1153 * _1241;
            float _1245 = _1141 * _1241;
            float _1247 = _1143 * _1241;
            _1147 = _1245;
            _1167 = 0.0;
            _1181 = _1243;
            _1163 = 0.0;
            _1159 = as_type<int>(_1235);
            _1187 = _1247;
            _1175 = 0.0;
        }
    }
    float _1249 = _1147;
    float _1251 = _1167;
    float _1253 = _1181;
    float _1255 = _1163;
    int _1257 = _1159;
    float _1259 = _1187;
    float _1261 = _1175;
    int _1263 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1265 = _1263 != 0;
    int _1267 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1269 = _1267 != 0;
    float _1271 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1273 = _1249 + _1251;
    float _1275 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1277 = _1253 + _1255;
    bool _1279 = !_1269;
    float _1281 = _1279 ? as_type<float>(_1257) : 1.0;
    float _1283 = _673 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1285 = _1259 + _1261;
    float _1287 = -_1281;
    float _1289 = _1287 + 1.0;
    float _1291 = abs(_1289);
    float _1293 = log2(_1291);
    float _1295 = _1293 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1297 = exp2(_1295);
    float _1299 = -_1297;
    float _1301 = spvFAdd(_1299, 1.00010001659393310546875);
    float _1303 = -_1297;
    float _1305 = _1303 + 1.0;
    float _1307 = -_1281;
    float _1309 = _1307 + _1305;
    float _1311 = 1.0 / _1301;
    float _1313 = _1271 * _1309;
    float _1315 = _1275 * _1309;
    float _1317 = _1283 * _1309;
    float _1319 = fma(_1273, _1281, _1313);
    float _1321 = fma(_1277, _1281, _1315);
    float _1323 = fma(_1285, _1281, _1317);
    float _1325 = _1311 * _1319;
    float _1327 = _1311 * _1321;
    float _1329 = _1311 * _1323;
    float _1331 = _1325 * 0.715200006961822509765625;
    float _1333 = fma(_1327, 0.2125999927520751953125, _1331);
    float _1335 = fma(_1329, 0.072200000286102294921875, _1333);
    float _1337 = 1.0 / _1335;
    float _1339 = _1337 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1341 = precise::clamp(_1339, 0.0, 1.0);
    float _1343 = fma(_1341, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1345 = _1343 * _925;
    float _1347 = fma(_1327, _1345, _919);
    float _1349 = fma(_1325, _1345, _921);
    float _1351 = fma(_1329, _1345, _923);
    bool _1353 = !_1265;
    float _1355 = _1347;
    float _1357 = _1297;
    float _1359 = _1305;
    int _1361 = as_type<int>(_1297);
    float _1363 = _1347;
    float _1365 = _1305;
    if (!_1353)
    {
        bool _1367 = _1305 != 1.0;
        bool _1369 = isnan(_1305);
        bool _1371 = _1367 || _1369;
        bool _1373 = isnan(1.0);
        bool _1375 = _1371 || _1373;
        float _1377 = -_1297;
        bool _1379 = _1377 != (-1.0);
        bool _1381 = isnan(_1377);
        bool _1383 = _1379 || _1381;
        bool _1385 = isnan(-1.0);
        bool _1387 = _1383 || _1385;
        float _1389 = -_1297;
        bool _1391 = _1389 == (-1.0);
        bool _1393 = !_1375;
        bool _1395 = _1391 || _1393;
        bool _1397 = _1305 == 1.0;
        bool _1399 = _1397 && _1387;
        bool _1401 = !_1395;
        float _1403 = _1401 ? _1305 : 0.0;
        bool _1405 = !_1399;
        float _1407 = _1405 ? 0.0 : 1.0;
        float _1409 = _1395 ? 0.0 : 0.5;
        float _1411 = _1403 * 0.715200006961822509765625;
        float _1413 = fma(_1407, 0.2125999927520751953125, _1411);
        float _1415 = fma(_1409, 0.072200000286102294921875, _1413);
        float _1417 = 1.0 / _1415;
        float _1419 = _1417 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1421 = precise::clamp(_1419, 0.0, 1.0);
        float _1423 = fma(_1421, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1425 = _1407 * _1423;
        float _1427 = _1403 * _1423;
        float _1429 = _1409 * _1423;
        out.m_46.x = _1425;
        out.m_46.y = _1427;
        out.m_46.z = _1429;
        out.m_46.w = 1.0;
        return out;
    }
    bool _1431 = _104 != 0;
    bool _1433 = !_1431;
    if (!_1433)
    {
        if (_94)
        {
            _1355 = 0.0;
        }
        float _1435 = _1355;
        float _1437 = _1435;
        if (_94)
        {
            _1357 = 0.0;
        }
        float _1439 = _1357;
        float _1441 = _1439;
        if (!_94)
        {
            float _1443 = _987 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1441 = _1443;
        }
        float _1445 = _1441;
        float _1447 = _1445;
        if (!_94)
        {
            float _1449 = _983 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1437 = _1449;
        }
        float _1451 = _1437;
        float _1453 = _1451;
        if (!_98)
        {
            float _1455 = fma(_959, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1445);
            _1447 = _1455;
        }
        float _1457 = _1447;
        if (_94)
        {
            _1359 = 0.0;
        }
        float _1459 = _1359;
        float _1461 = _1459;
        if (!_94)
        {
            float _1463 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1461 = _1463;
        }
        float _1465 = _1461;
        float _1467 = _1457 * 0.715200006961822509765625;
        float _1469 = _1465;
        if (!_98)
        {
            float _1471 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1451);
            _1453 = _1471;
        }
        float _1473 = _1453;
        if (!_98)
        {
            float _1475 = fma(_965, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1465);
            _1469 = _1475;
        }
        float _1477 = _1469;
        float _1479 = fma(_1473, 0.2125999927520751953125, _1467);
        float _1481 = fma(_1477, 0.072200000286102294921875, _1479);
        float _1483 = 1.0 / _1481;
        float _1485 = _1483 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1487 = precise::clamp(_1485, 0.0, 1.0);
        float _1489 = fma(_1487, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1491 = _1489 * _1457;
        float _1493 = _1489 * _1477;
        float _1495 = _1489 * _1473;
        out.m_46.x = _1495;
        out.m_46.y = _1491;
        out.m_46.z = _1493;
        out.m_46.w = 1.0;
        return out;
    }
    if (!_102)
    {
        _1361 = as_type<int>(_1351);
    }
    int _1497 = _1361;
    float _1499 = as_type<float>(_1497);
    if (!_102)
    {
        out.m_46.x = _1347;
        out.m_46.y = _1349;
        out.m_46.z = as_type<float>(_1497);
        out.m_46.w = _1305;
        return out;
    }
    if (_94)
    {
        _1363 = 0.0;
    }
    float _1501 = _1363;
    float _1503 = _1501;
    if (_94)
    {
        _1499 = 0.0;
    }
    float _1505 = _1499;
    float _1507 = _1505;
    if (!_94)
    {
        float _1509 = _987 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1507 = _1509;
    }
    float _1511 = _1507;
    float _1513 = _1511;
    if (!_94)
    {
        float _1515 = _983 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1503 = _1515;
    }
    float _1517 = _1503;
    float _1519 = _1517;
    if (!_98)
    {
        float _1521 = fma(_959, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1511);
        _1513 = _1521;
    }
    float _1523 = _1513;
    if (_94)
    {
        _1365 = 0.0;
    }
    float _1525 = _1365;
    float _1527 = _1525;
    if (!_94)
    {
        float _1529 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1527 = _1529;
    }
    float _1531 = _1527;
    float _1533 = _1523 * 0.715200006961822509765625;
    float _1535 = _1531;
    if (!_98)
    {
        float _1537 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1517);
        _1519 = _1537;
    }
    float _1539 = _1519;
    if (!_98)
    {
        float _1541 = fma(_965, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1531);
        _1535 = _1541;
    }
    float _1543 = _1535;
    float _1545 = fma(_1539, 0.2125999927520751953125, _1533);
    float _1547 = fma(_1543, 0.072200000286102294921875, _1545);
    float _1549 = 1.0 / _1547;
    float _1551 = _1549 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = fma(_1553, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1557 = _1555 * _1523;
    float _1559 = _1555 * _1543;
    float _1561 = _1555 * _1539;
    out.m_46.x = _1561;
    out.m_46.y = _1557;
    out.m_46.z = _1559;
    out.m_46.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_46 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _817 = false;
    bool _272 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_43.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_43.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_43.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    int _78 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _82 = _78 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _102 = _100 != 0;
    int _104 = int(_82);
    float _106 = 1.0 / _58;
    float _108 = _106 * _64;
    float _110 = _106 * _70;
    float _112 = _106 * _76;
    float _114 = _108 * _108;
    float _116 = fma(_110, _110, _114);
    float _118 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _120 = fma(_112, _112, _116);
    float _122 = precise::max(0.0, _118);
    float _124 = rsqrt(_120);
    float _126 = _110 * _124;
    float _128 = _112 * _124;
    float _130 = _108 * _124;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _136 = -_130;
    float _138 = -_122;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].z, _138);
    float _142 = _132 * _132;
    float _144 = _134 * _134;
    float _146 = _142 + _144;
    float _148 = sqrt(_146);
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _152 = _122;
    float _154 = _140;
    float _156 = _144;
    float _158 = _132;
    float _160 = _134;
    if (!_150)
    {
        _152 = _142;
    }
    float _162 = _152;
    bool _164 = !_150;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _172 = _148 + _170;
        float _174 = _140 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _176 = rsqrt(_146);
        float _178 = _172 * _168;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _180 * 6.283185482025146484375;
        float _184 = sin(_182);
        float _186 = _180 * 6.283185482025146484375;
        float _188 = cos(_186);
        float _190 = fma(_184, _174, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _192 = _176 * _190;
        float _194 = _188 + (-1.0);
        float _196 = _132 * _192;
        float _198 = _134 * _192;
        float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _202 = _198 * _198;
        float _204 = fma(_140, _188, _200);
        float _206 = _196 * _196;
        _154 = _204;
        _166 = _206;
        _156 = _202;
        _158 = _196;
        _160 = _198;
    }
    float _208 = _154;
    float _210 = _166;
    float _212 = _156;
    float _214 = _158;
    float _216 = _160;
    float _218 = fma(_208, _208, _210);
    float _220 = _218 + _212;
    float _222 = rsqrt(_220);
    float _224 = _222 * _208;
    float _226 = -_224;
    float _228 = precise::max(0.0, _226);
    float _230 = abs(_228);
    float _232 = -_230;
    float _234 = _232 + 1.0;
    float _236 = fma(_228, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _238 = as_type<int>(_234) + (-218103808);
    float _240 = fma(_228, _236, -0.212114393711090087890625);
    bool _242 = uint(_238) >= 1920991232u;
    float _244 = fma(_228, _240, 1.570728778839111328125);
    bool _246 = !_242;
    float _270;
    if (!_246)
    {
        int _248 = 0;
        int _250 = 0;
        int _252 = 0;
        int _254 = 1184;
        int _256 = as_type<int>(_234);
        int _258;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        _54(_248, _250, _252, _254, _256, _258, _260, _262, _264, _266, _268);
        _270 = as_type<float>(_258);
        _272 = true;
    }
    else
    {
        float _274 = rsqrt(_234);
        float _276 = _234 * _274;
        float _278 = _274 * 0.5;
        float _280 = -_276;
        float _282 = 0.0 + _280;
        float _284 = fma(_278, _282, 0.5);
        float _286 = fma(_276, _284, _276);
        float _288 = -_286;
        float _290 = 0.0 + _288;
        float _292 = fma(_286, _290, _234);
        float _294 = fma(_278, _292, _286);
        _270 = _294;
    }
    _272 = false;
    float _296 = _270;
    bool _298 = _224 > 0.0;
    float _300 = _128 * _128;
    float _302 = _126 * _126;
    float _304 = _300 + _302;
    if (_298)
    {
        discard_fragment();
    }
    float _306 = rsqrt(_304);
    float _308 = _244 * _296;
    float _310 = _308 * 0.636619746685028076171875;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = sqrt(_316);
    float _320 = _128 * _306;
    float _322 = _126 * _306;
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
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    float2 _1968;
    _1968.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    _1968.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    float _350 = _1968.x;
    float _352 = _350 * 256.0;
    int _354 = int(_352);
    float _356 = -_130;
    float _358 = _356 + 1.0;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = -_130;
    float _364 = fma(_362, _130, 1.0);
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _222 * _214;
    int _370 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _372 = _370 != 0;
    float _374 = _222 * _216;
    float _376 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _380 = _368 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _386 = fma(_300, 3.0, -1.0);
    float _388 = -_380;
    float _390 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _388);
    float _392 = fma(_130, _382, _376);
    float _394 = fma(_130, _384, _378);
    float _396 = _360;
    if (_372)
    {
        float _398 = sqrt(_366);
        _396 = _398;
    }
    float _400 = _396;
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _404 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _408 = -_374;
    float _410 = fma(_408, (*spvDescriptorSet0.fp_c3)._m0[11].z, _390);
    float _412 = -_128;
    float _414 = fma(_412, _402, _394);
    float _416 = fma(_128, _402, _394);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _420 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _422 = fma(_130, _406, _404);
    float _424 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _426 = -_128;
    float _428 = fma(_426, _418, _392);
    float _430 = -_128;
    float _432 = fma(_430, _420, _422);
    float _434 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _436 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _438 = abs(_400);
    float _440 = log2(_438);
    float _442 = fma(_128, _418, _392);
    float _444 = fma(_128, _420, _422);
    float _446 = -_126;
    float _448 = fma(_446, _424, _414);
    float _450 = fma(_126, _424, _416);
    float _452 = -_126;
    float _454 = fma(_452, _434, _428);
    float _456 = -_126;
    float _458 = fma(_456, _436, _432);
    float _460 = -_130;
    float _462 = _126 * _460;
    float _464 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _466 = fma(_126, _434, _442);
    float _468 = fma(_126, _436, _444);
    float _470 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _472 = _126 * _130;
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _476 = fma(_464, _462, _454);
    float _478 = _440 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = fma(_470, _462, _448);
    float _482 = fma(_470, _472, _450);
    float _484 = fma(_464, _472, _466);
    float _486 = fma(_474, _462, _458);
    float _488 = fma(_474, _472, _468);
    float _490 = exp2(_478);
    float _492 = _128 * (-3.0);
    float _494 = fma(_410, 0.5, 0.5);
    float _496 = _130 * _128;
    float _498 = _126 * _128;
    float _500 = -_128;
    float _502 = fma(_500, _492, -1.0);
    float _504 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _506 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _508 = fma(_494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _510 = fma(_494, _508, -0.212114393711090087890625);
    float _512 = _490 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _514 = fma(_494, _510, 1.570728778839111328125);
    float _516 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _518 = precise::clamp(_516, 0.0, 1.0);
    float _520 = -_128;
    float _522 = _130 * _520;
    float _524 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _528 = -_518;
    float _530 = _528 + 1.0;
    float _532 = fma(_410, -0.5, 0.5);
    float _534 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _536 = fma(_524, _522, _480);
    float _538 = fma(_524, _496, _482);
    float _540 = fma(_526, _522, _486);
    float _542 = abs(_530);
    float _544 = log2(_542);
    float _546 = fma(_534, _522, _476);
    float _548 = fma(_534, _496, _484);
    float _550 = in.m_48.x;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    float _556 = in.m_48.y;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    float _562 = fma(_526, _496, _488);
    float _564 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _566 = sqrt(_532);
    float _568 = _224 + 1.0;
    float _570 = fma(_564, _498, _536);
    float _572 = fma(_564, _498, _538);
    float _574 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _576 = fma(_504, _498, _540);
    float _578 = fma(_504, _498, _562);
    float _580 = fma(_506, _498, _546);
    float _582 = _544 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _584 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _586 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _588 = fma(_574, _502, _570);
    float _590 = fma(_574, _386, _572);
    float _592 = fma(_506, _498, _548);
    float _594 = exp2(_582);
    float _596 = fma(_584, _502, _580);
    float _598 = _566 * 0.636619746685028076171875;
    float _600 = fma(_224, -0.5, 0.5);
    float _602 = -_514;
    float _604 = fma(_598, _602, 1.0);
    float _606 = _106 * _554;
    float _608 = _106 * _560;
    float _610 = -_224;
    float _612 = fma(_594, _568, _610);
    float _614 = fma(_586, _502, _576);
    float _616 = fma(_612, 0.5, 0.5);
    float _618 = float(uint(_354));
    float _620 = _618 * 0.00390625;
    float2 _2399 = float2(_346, _348);
    float4 _623 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2399, float2(0.0), isnan(_2399)), level(_620)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2399, float2(0.0), isnan(_2399)), level(_620)).xyzw;
    float _625 = _623.x;
    float _627 = _623.y;
    float _629 = _623.z;
    float _631 = _623.w;
    float2 _2418 = float2(_346, _348);
    float2 _635 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2418, float2(0.0), isnan(_2418)), level(_620)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2418, float2(0.0), isnan(_2418)), level(_620)).xy;
    float _637 = _635.x;
    float _639 = _635.y;
    float2 _2431 = float2(_346, _348);
    float2 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2431, float2(0.0), isnan(_2431)), level(_620)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2431, float2(0.0), isnan(_2431)), level(_620)).xy;
    float _643 = _641.x;
    float _645 = _641.y;
    float2 _2444 = float2(_346, _348);
    float4 _647 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2444, float2(0.0), isnan(_2444)), level(_620)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2444, float2(0.0), isnan(_2444)), level(_620)).xyzw;
    float _649 = _647.x;
    float _651 = _647.y;
    float _653 = _647.z;
    float _655 = _647.w;
    float2 _2461 = float2(_606, _608);
    float3 _659 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2461, float2(0.0), isnan(_2461))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2461, float2(0.0), isnan(_2461))).xyz;
    float _661 = _659.x;
    float _663 = _659.y;
    float _665 = _659.z;
    float2 _2475 = float2(_604, _600);
    float3 _667 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2475, float2(0.0), isnan(_2475))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2475, float2(0.0), isnan(_2475))).xyz;
    float _669 = _667.x;
    float _671 = _667.y;
    float _673 = _667.z;
    float2 _2489 = float2(_604, _616);
    float3 _675 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2489, float2(0.0), isnan(_2489))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2489, float2(0.0), isnan(_2489))).xyz;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    float _683 = fma(_586, _386, _578);
    float _685 = fma(_584, _386, _592);
    float _687 = -_130;
    float _689 = fma(_687, _130, _302);
    int _691 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _693 = _691 != 0;
    float _695 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    int _697 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _699 = _697 != 0;
    float _701 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _703 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _705 = fma(_695, _689, _588);
    float _707 = fma(_695, _689, _590);
    float _709 = fma(_701, _689, _596);
    float _711 = fma(_701, _689, _685);
    float _713 = fma(_703, _689, _614);
    float _715 = fma(_703, _689, _683);
    float _717 = _631 * _631;
    float _719 = -_639;
    float _721 = _719 + _645;
    float _723 = _655 * _655;
    float _725 = _717 * _717;
    float _727 = _637 * _639;
    float _729 = fma(_721, (*spvDescriptorSet0.fp_c3)._m0[0].x, _639);
    float _731 = _723 * _723;
    float _733 = _725 * 16.0;
    float _735 = precise::max(_729, 1.52587890625e-05);
    float _737 = _733 * _639;
    float _739 = -_727;
    float _741 = fma(_643, _645, _739);
    float _743 = _731 * 16.0;
    float _745 = _625 * _737;
    float _747 = 1.0 / _735;
    float _749 = _627 * _737;
    float _751 = _743 * _645;
    float _753 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[0].x, _727);
    float _755 = _629 * _737;
    float _757 = -_665;
    float _759 = _757 + 1.0;
    float _761 = -_745;
    float _763 = fma(_649, _751, _761);
    float _765 = -_749;
    float _767 = fma(_651, _751, _765);
    float _769 = -_755;
    float _771 = fma(_653, _751, _769);
    float _773 = _729 * _759;
    float _775 = fma(_763, (*spvDescriptorSet0.fp_c3)._m0[0].x, _745);
    float _777 = fma(_767, (*spvDescriptorSet0.fp_c3)._m0[0].x, _749);
    float _779 = fma(_771, (*spvDescriptorSet0.fp_c3)._m0[0].x, _755);
    float _781 = _773 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _783 = _753 * _747;
    bool _785 = !_693;
    float _787 = _785 ? _783 : 0.0;
    bool _789 = !_699;
    int _791 = _699 ? (-1) : 0;
    int _805;
    int _807;
    int _809;
    int _811;
    int _813;
    int _815;
    if (!_789)
    {
        float _793 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _795 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _797 = _458 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _799 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _801 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _803 = _468 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _805 = as_type<int>(_799);
        _807 = as_type<int>(_801);
        _809 = as_type<int>(_803);
        _811 = as_type<int>(_793);
        _813 = as_type<int>(_795);
        _815 = as_type<int>(_797);
        _817 = true;
    }
    else
    {
        int _819 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _821 = _819 != 0;
        float _823 = _713 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _825 = _705 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _827 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _829 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _831 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _833 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _835 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _837 = _715 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _839 = as_type<int>(_823);
        int _841 = as_type<int>(_825);
        int _843 = as_type<int>(_827);
        int _845 = as_type<int>(_837);
        int _847 = as_type<int>(_829);
        _791 = _821 ? (-1) : 0;
        _807 = as_type<int>(_835);
        if (_821)
        {
            float _849 = _404 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _839 = as_type<int>(_849);
        }
        int _851 = _839;
        _815 = _851;
        if (_821)
        {
            float _853 = _831 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _841 = as_type<int>(_853);
        }
        int _855 = _841;
        _811 = _855;
        if (_821)
        {
            float _857 = _833 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _843 = as_type<int>(_857);
        }
        int _859 = _843;
        _813 = _859;
        if (_821)
        {
            _845 = _851;
        }
        int _861 = _845;
        _809 = _861;
        if (_821)
        {
            _847 = _855;
        }
        int _863 = _847;
        _805 = _863;
        if (_821)
        {
            _807 = _859;
        }
    }
    _817 = false;
    int _865 = _791;
    int _867 = _805;
    int _869 = _807;
    int _871 = _809;
    int _873 = _811;
    int _875 = _813;
    int _877 = _815;
    float2 _2832 = float2(_606, _608);
    float2 _879 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2832, float2(0.0), isnan(_2832))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2832, float2(0.0), isnan(_2832))).xy;
    float _881 = _879.x;
    float _883 = _879.y;
    int _885 = 0;
    int _887 = _865;
    if (!_98)
    {
        int _889 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _891 = _889 != 0;
        _885 = _891 ? (-1) : 0;
    }
    int _893 = _885;
    if (_98)
    {
        _887 = -1;
    }
    int _895 = _887;
    int _897 = _895;
    if (!_98)
    {
        int _899 = ~_893;
        bool _901 = !_102;
        int _903 = _899 & (_901 ? (-1) : 0);
        _897 = _903;
    }
    int _905 = _897;
    bool _907 = _104 != 0;
    float _909 = fma(_881, 2.0, -1.0);
    float _911 = fma(_883, 2.0, -1.0);
    float _913 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[22].x, _606);
    float _915 = fma(_911, (*spvDescriptorSet0.fp_c3)._m0[22].y, _608);
    float2 _2896 = float2(_913, _915);
    float4 _917 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2896, float2(0.0), isnan(_2896))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2896, float2(0.0), isnan(_2896))).xyzw;
    float _919 = _917.x;
    float _921 = _917.y;
    float _923 = _917.z;
    float _925 = _917.w;
    float _927 = _544 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _929 = _787 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _931 = _787 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _933 = _905;
    if (_94)
    {
        _933 = -1;
    }
    int _935 = _933;
    float _937 = exp2(_927);
    int _939 = _935;
    if (!_94)
    {
        bool _941 = !_102;
        bool _943 = _941 && _90;
        bool _945 = !_907;
        bool _947 = _943 && _945;
        _939 = _947 ? (-1) : 0;
    }
    int _949 = _939;
    int _951 = ~_905;
    float _953 = (_951 != 0) ? as_type<float>(_867) : 0.0;
    float _955 = _661 * _663;
    int _957 = ~_905;
    float _959 = (_957 != 0) ? as_type<float>(_869) : 0.0;
    float _961 = _777 * _747;
    int _963 = ~_905;
    float _965 = (_963 != 0) ? as_type<float>(_871) : 0.0;
    float _967 = _955 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _969 = _779 * _747;
    float _971 = _775 * _747;
    bool _973 = !_102;
    bool _975 = _90 && _973;
    float _977 = -_937;
    float _979 = _977 + 1.0;
    int _981 = ~_949;
    float _983 = (_981 != 0) ? as_type<float>(_873) : 0.0;
    int _985 = ~_949;
    float _987 = (_985 != 0) ? as_type<float>(_875) : 0.0;
    float _989 = _979 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _991 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _993 = _991 != 0;
    bool _995 = !_975;
    float _997 = _995 ? _929 : 0.0;
    float _999 = -_989;
    float _1001 = _999 + 1.0;
    bool _1003 = !_975;
    float _1005 = _1003 ? _931 : 0.0;
    int _1007 = ~_949;
    float _1009 = (_1007 != 0) ? as_type<float>(_877) : 0.0;
    bool _1011 = !_993;
    float _1013 = abs(_1001);
    float _1015 = log2(_1013);
    float _1017 = _1005 * _959;
    float _1019 = _1005 * _953;
    float _1021 = _1005 * _965;
    bool _1023 = !_993;
    float _1025 = fma(_987, _997, _1017);
    bool _1027 = !_1011;
    float _1029 = _1027 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1031 = fma(_983, _997, _1019);
    float _1033 = fma(_1009, _997, _1021);
    bool _1035 = !_1023;
    float _1037 = _1035 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    bool _1039 = !_993;
    float _1041 = _1029 * _1025;
    float _1043 = _1037 * _1031;
    bool _1045 = !_1039;
    float _1047 = _1045 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1049 = _1015 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1051 = _1041 * 0.715200006961822509765625;
    float _1053 = _1015 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    int _1055 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1057 = _1055 != 0;
    float _1059 = _1047 * _1033;
    float _1061 = fma(_1043, 0.2125999927520751953125, _1051);
    float _1063 = exp2(_1049);
    float _1065 = fma(_1059, 0.072200000286102294921875, _1061);
    bool _1067 = !_1057;
    float _1069 = -_1043;
    float _1071 = _1069 + _1065;
    float _1073 = exp2(_1053);
    float _1075 = -_1041;
    float _1077 = _1075 + _1065;
    float _1079 = -_1059;
    float _1081 = _1079 + _1065;
    float _1083 = fma(_967, _1071, _1043);
    bool _1085 = !_1057;
    float _1087 = fma(_967, _1077, _1041);
    float _1089 = fma(_967, _1081, _1059);
    bool _1091 = !_1057;
    bool _1093 = !_86;
    float _1095 = _1093 ? _1063 : 1.0;
    float _1097 = _1067 ? _961 : 0.0;
    float _1099 = _1085 ? _969 : 0.0;
    float _1101 = _787 * _1095;
    float _1103 = _1095 * _1083;
    bool _1105 = !_86;
    float _1107 = _1105 ? _1073 : 1.0;
    float _1109 = _1095 * _1087;
    float _1111 = _90 ? _1101 : _1103;
    float _1113 = _1107 * _1097;
    float _1115 = _1107 * _1099;
    float _1117 = _90 ? _1101 : _1109;
    float _1119 = _1101;
    int _1121 = as_type<int>(_1115);
    float _1123 = _1089;
    float _1125 = _1081;
    float _1127 = _1113;
    if (!_90)
    {
        float _1129 = _1095 * _1089;
        _1119 = _1129;
    }
    float _1131 = _1119;
    float _1133 = _1091 ? _971 : 0.0;
    float _1135 = _1117 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1137 = _1131 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1139 = _1107 * _1133;
    float _1141 = fma(_1113, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1135);
    float _1143 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1137);
    float _1145 = _1137;
    float _1147 = _1141;
    if (_86)
    {
        _1121 = as_type<int>(_781);
    }
    int _1149 = _1121;
    float _1151 = _1111 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1153 = fma(_1139, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1151);
    float _1155 = _1151;
    int _1157 = _1149;
    int _1159 = _1149;
    if (_86)
    {
        _1123 = 0.0;
    }
    float _1161 = _1123;
    float _1163 = _1161;
    if (_86)
    {
        _1125 = 0.0;
    }
    float _1165 = _1125;
    float _1167 = _1165;
    if (_86)
    {
        _1127 = 0.0;
    }
    float _1169 = _1127;
    bool _1171 = !_86;
    float _1173 = _1171 ? _989 : 0.0;
    float _1175 = _1169;
    if (_86)
    {
        _1155 = _1153;
    }
    float _1177 = _1155;
    float _1179 = _1177;
    float _1181 = _1177;
    if (_86)
    {
        _1145 = _1143;
    }
    float _1183 = _1145;
    float _1185 = _1183;
    float _1187 = _1183;
    if (!_86)
    {
        int _1189 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1191 = _1189 != 0;
        float _1193 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1195 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1197 = _1195 != 0;
        float _1199 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1201 = _681 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1203 = !_1197;
        float _1205 = _1203 ? _1199 : 0.0;
        bool _1207 = !_1197;
        float _1209 = _1207 ? _1193 : 0.0;
        bool _1211 = !_1197;
        float _1213 = _1211 ? _1201 : 0.0;
        float _1215 = _1173 * _1205;
        _1163 = _1215;
        if (!_1191)
        {
            _1157 = as_type<int>(_781);
        }
        int _1217 = _1157;
        float _1219 = _1173 * _1209;
        _1167 = _1219;
        _1159 = _1217;
        if (!_1191)
        {
            _1179 = _1153;
        }
        float _1221 = _1179;
        float _1223 = _1173 * _1213;
        _1181 = _1221;
        _1175 = _1223;
        if (!_1191)
        {
            _1185 = _1143;
        }
        float _1225 = _1185;
        bool _1227 = !_1191;
        _1187 = _1225;
        if (!_1227)
        {
            float _1229 = -_1173;
            float _1231 = _1229 + 1.0;
            float _1233 = precise::clamp(_1231, 0.0, 1.0);
            float _1235 = _781 * _1233;
            float _1237 = precise::max(_1235, 9.9999997473787516355514526367188e-05);
            float _1239 = 1.0 / _1237;
            float _1241 = _781 * _1239;
            float _1243 = _1153 * _1241;
            float _1245 = _1141 * _1241;
            float _1247 = _1143 * _1241;
            _1147 = _1245;
            _1167 = 0.0;
            _1181 = _1243;
            _1163 = 0.0;
            _1159 = as_type<int>(_1235);
            _1187 = _1247;
            _1175 = 0.0;
        }
    }
    float _1249 = _1147;
    float _1251 = _1167;
    float _1253 = _1181;
    float _1255 = _1163;
    int _1257 = _1159;
    float _1259 = _1187;
    float _1261 = _1175;
    int _1263 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1265 = _1263 != 0;
    int _1267 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1269 = _1267 != 0;
    float _1271 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1273 = _1249 + _1251;
    float _1275 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1277 = _1253 + _1255;
    bool _1279 = !_1269;
    float _1281 = _1279 ? as_type<float>(_1257) : 1.0;
    float _1283 = _673 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1285 = _1259 + _1261;
    float _1287 = -_1281;
    float _1289 = _1287 + 1.0;
    float _1291 = abs(_1289);
    float _1293 = log2(_1291);
    float _1295 = _1293 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1297 = exp2(_1295);
    float _1299 = -_1297;
    float _1301 = spvFAdd(_1299, 1.00010001659393310546875);
    float _1303 = -_1297;
    float _1305 = _1303 + 1.0;
    float _1307 = -_1281;
    float _1309 = _1307 + _1305;
    float _1311 = 1.0 / _1301;
    float _1313 = _1271 * _1309;
    float _1315 = _1275 * _1309;
    float _1317 = _1283 * _1309;
    float _1319 = fma(_1273, _1281, _1313);
    float _1321 = fma(_1277, _1281, _1315);
    float _1323 = fma(_1285, _1281, _1317);
    float _1325 = _1311 * _1319;
    float _1327 = _1311 * _1321;
    float _1329 = _1311 * _1323;
    float _1331 = _1325 * 0.715200006961822509765625;
    float _1333 = fma(_1327, 0.2125999927520751953125, _1331);
    float _1335 = fma(_1329, 0.072200000286102294921875, _1333);
    float _1337 = 1.0 / _1335;
    float _1339 = _1337 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1341 = precise::clamp(_1339, 0.0, 1.0);
    float _1343 = fma(_1341, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1345 = _1343 * _925;
    float _1347 = fma(_1327, _1345, _919);
    float _1349 = fma(_1325, _1345, _921);
    float _1351 = fma(_1329, _1345, _923);
    bool _1353 = !_1265;
    float _1355 = _1347;
    float _1357 = _1297;
    float _1359 = _1305;
    int _1361 = as_type<int>(_1297);
    float _1363 = _1347;
    float _1365 = _1305;
    if (!_1353)
    {
        bool _1367 = _1305 != 1.0;
        bool _1369 = isnan(_1305);
        bool _1371 = _1367 || _1369;
        bool _1373 = isnan(1.0);
        bool _1375 = _1371 || _1373;
        float _1377 = -_1297;
        bool _1379 = _1377 != (-1.0);
        bool _1381 = isnan(_1377);
        bool _1383 = _1379 || _1381;
        bool _1385 = isnan(-1.0);
        bool _1387 = _1383 || _1385;
        float _1389 = -_1297;
        bool _1391 = _1389 == (-1.0);
        bool _1393 = !_1375;
        bool _1395 = _1391 || _1393;
        bool _1397 = _1305 == 1.0;
        bool _1399 = _1397 && _1387;
        bool _1401 = !_1395;
        float _1403 = _1401 ? _1305 : 0.0;
        bool _1405 = !_1399;
        float _1407 = _1405 ? 0.0 : 1.0;
        float _1409 = _1395 ? 0.0 : 0.5;
        float _1411 = _1403 * 0.715200006961822509765625;
        float _1413 = fma(_1407, 0.2125999927520751953125, _1411);
        float _1415 = fma(_1409, 0.072200000286102294921875, _1413);
        float _1417 = 1.0 / _1415;
        float _1419 = _1417 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1421 = precise::clamp(_1419, 0.0, 1.0);
        float _1423 = fma(_1421, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1425 = _1407 * _1423;
        float _1427 = _1403 * _1423;
        float _1429 = _1409 * _1423;
        out.m_46.x = _1425;
        out.m_46.y = _1427;
        out.m_46.z = _1429;
        out.m_46.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    bool _1431 = _104 != 0;
    bool _1433 = !_1431;
    if (!_1433)
    {
        if (_94)
        {
            _1355 = 0.0;
        }
        float _1435 = _1355;
        float _1437 = _1435;
        if (_94)
        {
            _1357 = 0.0;
        }
        float _1439 = _1357;
        float _1441 = _1439;
        if (!_94)
        {
            float _1443 = _987 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1441 = _1443;
        }
        float _1445 = _1441;
        float _1447 = _1445;
        if (!_94)
        {
            float _1449 = _983 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1437 = _1449;
        }
        float _1451 = _1437;
        float _1453 = _1451;
        if (!_98)
        {
            float _1455 = fma(_959, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1445);
            _1447 = _1455;
        }
        float _1457 = _1447;
        if (_94)
        {
            _1359 = 0.0;
        }
        float _1459 = _1359;
        float _1461 = _1459;
        if (!_94)
        {
            float _1463 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1461 = _1463;
        }
        float _1465 = _1461;
        float _1467 = _1457 * 0.715200006961822509765625;
        float _1469 = _1465;
        if (!_98)
        {
            float _1471 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1451);
            _1453 = _1471;
        }
        float _1473 = _1453;
        if (!_98)
        {
            float _1475 = fma(_965, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1465);
            _1469 = _1475;
        }
        float _1477 = _1469;
        float _1479 = fma(_1473, 0.2125999927520751953125, _1467);
        float _1481 = fma(_1477, 0.072200000286102294921875, _1479);
        float _1483 = 1.0 / _1481;
        float _1485 = _1483 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1487 = precise::clamp(_1485, 0.0, 1.0);
        float _1489 = fma(_1487, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1491 = _1489 * _1457;
        float _1493 = _1489 * _1477;
        float _1495 = _1489 * _1473;
        out.m_46.x = _1495;
        out.m_46.y = _1491;
        out.m_46.z = _1493;
        out.m_46.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    if (!_102)
    {
        _1361 = as_type<int>(_1351);
    }
    int _1497 = _1361;
    float _1499 = as_type<float>(_1497);
    if (!_102)
    {
        out.m_46.x = _1347;
        out.m_46.y = _1349;
        out.m_46.z = as_type<float>(_1497);
        out.m_46.w = _1305;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    if (_94)
    {
        _1363 = 0.0;
    }
    float _1501 = _1363;
    float _1503 = _1501;
    if (_94)
    {
        _1499 = 0.0;
    }
    float _1505 = _1499;
    float _1507 = _1505;
    if (!_94)
    {
        float _1509 = _987 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1507 = _1509;
    }
    float _1511 = _1507;
    float _1513 = _1511;
    if (!_94)
    {
        float _1515 = _983 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1503 = _1515;
    }
    float _1517 = _1503;
    float _1519 = _1517;
    if (!_98)
    {
        float _1521 = fma(_959, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1511);
        _1513 = _1521;
    }
    float _1523 = _1513;
    if (_94)
    {
        _1365 = 0.0;
    }
    float _1525 = _1365;
    float _1527 = _1525;
    if (!_94)
    {
        float _1529 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1527 = _1529;
    }
    float _1531 = _1527;
    float _1533 = _1523 * 0.715200006961822509765625;
    float _1535 = _1531;
    if (!_98)
    {
        float _1537 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1517);
        _1519 = _1537;
    }
    float _1539 = _1519;
    if (!_98)
    {
        float _1541 = fma(_965, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1531);
        _1535 = _1541;
    }
    float _1543 = _1535;
    float _1545 = fma(_1539, 0.2125999927520751953125, _1533);
    float _1547 = fma(_1543, 0.072200000286102294921875, _1545);
    float _1549 = 1.0 / _1547;
    float _1551 = _1549 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = fma(_1553, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1557 = _1555 * _1523;
    float _1559 = _1555 * _1543;
    float _1561 = _1555 * _1539;
    out.m_46.x = _1561;
    out.m_46.y = _1557;
    out.m_46.z = _1559;
    out.m_46.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_46)};
}

