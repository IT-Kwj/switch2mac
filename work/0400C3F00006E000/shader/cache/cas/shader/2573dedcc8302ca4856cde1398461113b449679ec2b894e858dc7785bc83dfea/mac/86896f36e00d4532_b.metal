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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_14 [[id(13)]];
    sampler fp_t_tcb_14Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_10Smplr_w [[id(18)]];
    sampler fp_t_tcb_ASmplr_w [[id(19)]];
    sampler fp_t_tcb_ESmplr_w [[id(20)]];
    sampler fp_t_tcb_CSmplr_w [[id(21)]];
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
void _54(thread const int& _3967, thread const int& _3968, thread const int& _3969, thread const int& _3970, thread int& _3971, thread int& _3972, thread int& _3973, thread int& _3974, thread int& _3975, thread int& _3976)
{
    float _3979 = as_type<float>(_3968) + 0.0;
    bool _3981 = _3979 != 0.0;
    bool _3983 = isnan(_3979);
    bool _3985 = _3981 || _3983;
    bool _3987 = isnan(0.0);
    bool _3989 = _3985 || _3987;
    int _3991 = as_type<int>(_3979);
    int _3993 = _3967;
    int _3995 = _3969;
    int _3997 = _3989 ? (-1) : 0;
    if (!_3989)
    {
        float _3999 = as_type<float>(_3968) * 1.0;
        _3991 = as_type<int>(_3999);
    }
    int _4001 = _3991;
    bool _4003 = !_3989;
    int _4005 = _4001;
    if (!_4003)
    {
        float _4007 = as_type<float>(_3968) + 0.0;
        bool _4009 = _4007 >= 0.0;
        bool _4011 = isnan(_4007);
        bool _4013 = _4009 || _4011;
        bool _4015 = isnan(0.0);
        bool _4017 = _4013 || _4015;
        int _4019 = as_type<int>(_4007);
        _3997 = _4017 ? (-1) : 0;
        if (!_4017)
        {
            _4019 = 2147483647;
        }
        int _4021 = _4019;
        bool _4023 = !_4017;
        _4005 = _4021;
        if (!_4023)
        {
            float _4025 = abs(as_type<float>(_3968));
            float _4027 = _4025 + 0.0;
            bool _4029 = _4027 > as_type<float>(0x7f800000u /* inf */);
            bool _4031 = isnan(_4027);
            bool _4033 = _4029 || _4031;
            bool _4035 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4037 = _4033 || _4035;
            int _4039 = as_type<int>(_4027);
            _3997 = _4037 ? (-1) : 0;
            if (_4037)
            {
                float _4041 = as_type<float>(_3968) + 1.0;
                _4039 = as_type<int>(_4041);
            }
            int _4043 = _4039;
            _4005 = _4043;
            if (!_4037)
            {
                float _4045 = abs(as_type<float>(_3968));
                float _4047 = _4045 + (-0.0);
                float _4049 = 0.0 + _4047;
                bool _4051 = _4049 != as_type<float>(0x7f800000u /* inf */);
                bool _4053 = isnan(_4049);
                bool _4055 = _4051 || _4053;
                bool _4057 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4059 = _4055 || _4057;
                int _4061 = as_type<int>(_4049);
                _3997 = _4059 ? (-1) : 0;
                if (!_4059)
                {
                    _4061 = _3968;
                }
                int _4063 = _4061;
                bool _4065 = !_4059;
                _4005 = _4063;
                if (!_4065)
                {
                    float _4067 = as_type<float>(_3968) * 18446744073709551616.0;
                    float _4069 = rsqrt(_4067);
                    float _4071 = _4067 * _4069;
                    float _4073 = _4069 * 0.5;
                    float _4075 = -_4071;
                    float _4077 = 0.0 + _4075;
                    float _4079 = fma(_4073, _4077, 0.5);
                    float _4081 = fma(_4071, _4079, _4071);
                    float _4083 = -_4081;
                    float _4085 = 0.0 + _4083;
                    float _4087 = fma(_4081, _4085, _4067);
                    float _4089 = fma(_4073, _4087, _4081);
                    float _4091 = _4089 * 2.3283064365386962890625e-10;
                    _4005 = as_type<int>(_4091);
                    _3993 = as_type<int>(_4067);
                    _3995 = as_type<int>(_4081);
                }
            }
        }
    }
    int _4093 = _4005;
    int _4095 = _3993;
    int _4097 = _3995;
    int _4099 = _3997;
    _3971 = _4093;
    _3972 = _4095;
    _3973 = _3970;
    _3974 = 0;
    _3975 = _4097;
    _3976 = _4099;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _837 = false;
    bool _274 = false;
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
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    int _86 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _88 = _86 != 0;
    int _90 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _92 = _90 != 0;
    float _94 = precise::max(0.0, _84);
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _102 = _100 != 0;
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _106 = _104 != 0;
    int _108 = int(_82);
    float _110 = 1.0 / _58;
    float _112 = _110 * _64;
    float _114 = _110 * _70;
    float _116 = _110 * _76;
    float _118 = _112 * _112;
    float _120 = fma(_114, _114, _118);
    float _122 = fma(_116, _116, _120);
    float _124 = rsqrt(_122);
    float _126 = _114 * _124;
    float _128 = _116 * _124;
    float _130 = _112 * _124;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _136 = -_130;
    float _138 = -_94;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].z, _138);
    float _142 = _132 * _132;
    float _144 = _134 * _134;
    float _146 = _142 + _144;
    float _148 = sqrt(_146);
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _152 = _94;
    float _154 = _124;
    float _156 = _140;
    float _158 = _132;
    float _160 = _134;
    if (!_150)
    {
        _152 = _144;
    }
    float _162 = _152;
    float _164 = _162;
    if (!_150)
    {
        _154 = _142;
    }
    float _166 = _154;
    bool _168 = !_150;
    float _170 = _166;
    if (!_168)
    {
        float _172 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _176 = _148 + _174;
        float _178 = _140 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _180 = rsqrt(_146);
        float _182 = _176 * _172;
        float _184 = _182 * 0.15915493667125701904296875;
        float _186 = _184 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 * 6.283185482025146484375;
        float _192 = cos(_190);
        float _194 = fma(_188, _178, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _196 = _180 * _194;
        float _198 = _192 + (-1.0);
        float _200 = _132 * _196;
        float _202 = _134 * _196;
        float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _206 = _202 * _202;
        float _208 = fma(_140, _192, _204);
        float _210 = _200 * _200;
        _156 = _208;
        _170 = _210;
        _164 = _206;
        _158 = _200;
        _160 = _202;
    }
    float _212 = _156;
    float _214 = _170;
    float _216 = _164;
    float _218 = _158;
    float _220 = _160;
    float _222 = fma(_212, _212, _214);
    float _224 = _222 + _216;
    float _226 = rsqrt(_224);
    float _228 = _226 * _212;
    float _230 = -_228;
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
        int _252 = 0;
        int _254 = as_type<int>(_238);
        int _256 = 0;
        int _258 = 1200;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        int _270;
        _54(_252, _254, _256, _258, _260, _262, _264, _266, _268, _270);
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
    bool _300 = _228 > 0.0;
    float _302 = _128 * _128;
    float _304 = _126 * _126;
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
    float _322 = _128 * _308;
    float _324 = _126 * _308;
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
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return out;
    }
    float2 _1993;
    _1993.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    _1993.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    float _352 = _1993.x;
    float _354 = _352 * 256.0;
    int _356 = int(_354);
    float _358 = -_130;
    float _360 = _358 + 1.0;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_130;
    float _366 = fma(_364, _130, 1.0);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _226 * _218;
    int _372 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _374 = _372 != 0;
    float _376 = _226 * _220;
    float _378 = _370 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _380 = _128 * (-3.0);
    float _382 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _384 = -_378;
    float _386 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[11].y, _384);
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _392 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _394 = -_376;
    float _396 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
    float _398 = _362;
    if (_374)
    {
        float _400 = sqrt(_368);
        _398 = _400;
    }
    float _402 = _398;
    float _404 = fma(_130, _388, _382);
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _408 = fma(_302, 3.0, -1.0);
    float _410 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _412 = -_128;
    float _414 = fma(_412, _390, _404);
    float _416 = fma(_128, _390, _404);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _420 = fma(_130, _406, _392);
    float _422 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _424 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _426 = -_128;
    float _428 = fma(_426, _418, _420);
    float _430 = fma(_128, _418, _420);
    float _432 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _434 = -_126;
    float _436 = fma(_434, _424, _414);
    float _438 = abs(_402);
    float _440 = log2(_438);
    float _442 = fma(_126, _424, _416);
    float _444 = fma(_130, _432, _410);
    float _446 = _126 * _130;
    float _448 = -_128;
    float _450 = _130 * _448;
    float _452 = -_128;
    float _454 = fma(_452, _380, -1.0);
    float _456 = -_128;
    float _458 = fma(_456, _422, _444);
    float _460 = fma(_128, _422, _444);
    float _462 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _464 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _466 = in.m_48.x;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = -_126;
    float _474 = fma(_472, _462, _428);
    float _476 = fma(_126, _462, _430);
    float _478 = -_126;
    float _480 = fma(_478, _464, _458);
    float _482 = _440 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _484 = fma(_126, _464, _460);
    float _486 = -_130;
    float _488 = _126 * _486;
    float _490 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _492 = exp2(_482);
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _498 = fma(_490, _488, _480);
    float _500 = fma(_490, _446, _484);
    float _502 = fma(_494, _488, _436);
    float _504 = _130 * _128;
    float _506 = fma(_494, _446, _442);
    float _508 = fma(_496, _446, _476);
    float _510 = fma(_496, _488, _474);
    float _512 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _514 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _516 = _126 * _128;
    float _518 = fma(_512, _450, _498);
    float _520 = fma(_512, _504, _500);
    float _522 = _492 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _524 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _526 = fma(_514, _450, _510);
    float _528 = fma(_514, _504, _508);
    float _530 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = fma(_524, _516, _518);
    float _536 = fma(_524, _516, _520);
    float _538 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _540 = -_532;
    float _542 = _540 + 1.0;
    float _544 = in.m_48.y;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = fma(_538, _450, _502);
    float _552 = fma(_538, _504, _506);
    float _554 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _556 = abs(_542);
    float _558 = log2(_556);
    float _560 = fma(_396, -0.5, 0.5);
    float _562 = fma(_396, 0.5, 0.5);
    float _564 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _566 = fma(_554, _516, _526);
    float _568 = fma(_562, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _570 = fma(_564, _516, _550);
    float _572 = sqrt(_560);
    float _574 = fma(_564, _516, _552);
    float _576 = fma(_562, _568, -0.212114393711090087890625);
    float _578 = fma(_554, _516, _528);
    float _580 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _582 = _228 + 1.0;
    float _584 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _586 = _110 * _470;
    float _588 = _558 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _590 = fma(_562, _576, 1.570728778839111328125);
    float _592 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _594 = fma(_580, _454, _570);
    float _596 = exp2(_588);
    float _598 = fma(_580, _408, _574);
    float _600 = fma(_584, _454, _534);
    float _602 = fma(_584, _408, _536);
    float _604 = _572 * 0.636619746685028076171875;
    float _606 = fma(_592, _454, _566);
    float _608 = fma(_592, _408, _578);
    float _610 = _110 * _548;
    float _612 = -_590;
    float _614 = fma(_604, _612, 1.0);
    float _616 = fma(_228, -0.5, 0.5);
    float _618 = -_228;
    float _620 = fma(_596, _582, _618);
    float _622 = fma(_620, 0.5, 0.5);
    float _624 = float(uint(_356));
    float _626 = _624 * 0.00390625;
    float2 _2432 = float2(_586, _610);
    float3 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2432, float2(0.0), isnan(_2432))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2432, float2(0.0), isnan(_2432))).xyz;
    float _632 = _630.x;
    float _634 = _630.y;
    float _636 = _630.z;
    float2 _2448 = float2(_348, _350);
    float2 _640 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2448, float2(0.0), isnan(_2448)), level(_626)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2448, float2(0.0), isnan(_2448)), level(_626)).xy;
    float _642 = _640.x;
    float _644 = _640.y;
    float2 _2461 = float2(_348, _350);
    float2 _646 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2461, float2(0.0), isnan(_2461)), level(_626)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2461, float2(0.0), isnan(_2461)), level(_626)).xy;
    float _648 = _646.x;
    float _650 = _646.y;
    float2 _2474 = float2(_348, _350);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2474, float2(0.0), isnan(_2474)), level(_626)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2474, float2(0.0), isnan(_2474)), level(_626)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2491 = float2(_348, _350);
    float4 _663 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2491, float2(0.0), isnan(_2491)), level(_626)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2491, float2(0.0), isnan(_2491)), level(_626)).xyzw;
    float _665 = _663.x;
    float _667 = _663.y;
    float _669 = _663.z;
    float _671 = _663.w;
    float2 _2508 = float2(_614, _616);
    float3 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2508, float2(0.0), isnan(_2508))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2508, float2(0.0), isnan(_2508))).xyz;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    float2 _2522 = float2(_614, _622);
    float3 _681 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2522, float2(0.0), isnan(_2522))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2522, float2(0.0), isnan(_2522))).xyz;
    float _683 = _681.x;
    float _685 = _681.y;
    float _687 = _681.z;
    float _689 = _126 * _126;
    int _691 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _693 = _691 != 0;
    float _695 = -_130;
    float _697 = fma(_695, _130, _689);
    int _699 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _701 = _699 != 0;
    float _703 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _705 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _707 = _705 + 1.0;
    float _709 = fma(_703, _697, _600);
    float _711 = fma(_703, _697, _602);
    float _713 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _715 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _717 = fma(_713, _697, _594);
    float _719 = fma(_713, _697, _598);
    float _721 = fma(_715, _697, _606);
    float _723 = fma(_715, _697, _608);
    float _725 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _727 = _725 + 1.0;
    float _729 = _632 * _634;
    float _731 = -_644;
    float _733 = _731 + _650;
    float _735 = _661 * _661;
    float _737 = -_729;
    float _739 = _737 + 1.0;
    float _741 = _671 * _671;
    float _743 = _735 * _735;
    float _745 = fma(_739, _707, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _747 = fma(_739, _727, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _749 = _642 * _644;
    float _751 = _743 * 16.0;
    float _753 = _741 * _741;
    float _755 = _648 * _747;
    float _757 = _751 * _644;
    float _759 = fma(_632, _733, _644);
    float _761 = _753 * 16.0;
    float _763 = _659 * _757;
    float _765 = precise::max(_759, 1.52587890625e-05);
    float _767 = _761 * _745;
    float _769 = _655 * _757;
    float _771 = _657 * _757;
    float _773 = -_749;
    float _775 = fma(_650, _755, _773);
    float _777 = _650 * _767;
    float _779 = 1.0 / _765;
    float _781 = _669 * _767;
    float _783 = fma(_632, _775, _749);
    float _785 = -_771;
    float _787 = fma(_667, _777, _785);
    float _789 = -_769;
    float _791 = fma(_665, _777, _789);
    float _793 = -_763;
    float _795 = fma(_650, _781, _793);
    float _797 = fma(_632, _787, _771);
    float _799 = fma(_632, _791, _769);
    float _801 = fma(_632, _795, _763);
    float _803 = _783 * _779;
    bool _805 = !_693;
    float _807 = _805 ? _803 : 0.0;
    bool _809 = !_701;
    int _811 = _701 ? (-1) : 0;
    int _825;
    int _827;
    int _829;
    int _831;
    int _833;
    int _835;
    if (!_809)
    {
        float _813 = _480 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _815 = _436 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _817 = _474 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _819 = _484 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _821 = _442 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _823 = _476 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _825 = as_type<int>(_821);
        _827 = as_type<int>(_819);
        _829 = as_type<int>(_823);
        _831 = as_type<int>(_813);
        _833 = as_type<int>(_815);
        _835 = as_type<int>(_817);
        _837 = true;
    }
    else
    {
        int _839 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _841 = _839 != 0;
        float _843 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _845 = _717 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _847 = _721 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _849 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _851 = _719 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _853 = _723 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _855 = as_type<int>(_843);
        int _857 = as_type<int>(_845);
        int _859 = as_type<int>(_847);
        int _861 = as_type<int>(_849);
        int _863 = as_type<int>(_851);
        _811 = _841 ? (-1) : 0;
        _829 = as_type<int>(_853);
        if (_841)
        {
            float _865 = _410 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _855 = as_type<int>(_865);
        }
        int _867 = _855;
        _831 = _867;
        if (_841)
        {
            float _869 = _382 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _857 = as_type<int>(_869);
        }
        int _871 = _857;
        _833 = _871;
        if (_841)
        {
            float _873 = _392 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _859 = as_type<int>(_873);
        }
        int _875 = _859;
        _835 = _875;
        if (_841)
        {
            _861 = _867;
        }
        int _877 = _861;
        _827 = _877;
        if (_841)
        {
            _863 = _871;
        }
        int _879 = _863;
        _825 = _879;
        if (_841)
        {
            _829 = _875;
        }
    }
    _837 = false;
    int _881 = _811;
    int _883 = _825;
    int _885 = _827;
    int _887 = _829;
    int _889 = _831;
    int _891 = _833;
    int _893 = _835;
    float2 _2874 = float2(_586, _610);
    float2 _895 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2874, float2(0.0), isnan(_2874))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2874, float2(0.0), isnan(_2874))).xy;
    float _897 = _895.x;
    float _899 = _895.y;
    int _901 = 0;
    int _903 = _881;
    if (!_102)
    {
        int _905 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _907 = _905 != 0;
        _901 = _907 ? (-1) : 0;
    }
    int _909 = _901;
    if (_102)
    {
        _903 = -1;
    }
    int _911 = _903;
    int _913 = _911;
    if (!_102)
    {
        int _915 = ~_909;
        bool _917 = !_106;
        int _919 = _915 & (_917 ? (-1) : 0);
        _913 = _919;
    }
    int _921 = _913;
    bool _923 = _108 != 0;
    float _925 = fma(_897, 2.0, -1.0);
    float _927 = fma(_899, 2.0, -1.0);
    float _929 = fma(_925, (*spvDescriptorSet0.fp_c3)._m0[22].x, _586);
    float _931 = fma(_927, (*spvDescriptorSet0.fp_c3)._m0[22].y, _610);
    float2 _2938 = float2(_929, _931);
    float4 _933 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2938, float2(0.0), isnan(_2938))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2938, float2(0.0), isnan(_2938))).xyzw;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = _933.w;
    float _943 = _558 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _945 = _807 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _947 = _807 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _949 = _921;
    if (_98)
    {
        _949 = -1;
    }
    int _951 = _949;
    float _953 = exp2(_943);
    int _955 = _951;
    if (!_98)
    {
        bool _957 = !_106;
        bool _959 = _957 && _92;
        bool _961 = !_923;
        bool _963 = _959 && _961;
        _955 = _963 ? (-1) : 0;
    }
    int _965 = _955;
    int _967 = ~_921;
    float _969 = (_967 != 0) ? as_type<float>(_883) : 0.0;
    float _971 = _797 * _779;
    int _973 = ~_921;
    float _975 = (_973 != 0) ? as_type<float>(_885) : 0.0;
    float _977 = _801 * _779;
    int _979 = ~_921;
    float _981 = (_979 != 0) ? as_type<float>(_887) : 0.0;
    bool _983 = !_106;
    bool _985 = _92 && _983;
    float _987 = -_953;
    float _989 = _987 + 1.0;
    int _991 = ~_965;
    float _993 = (_991 != 0) ? as_type<float>(_889) : 0.0;
    int _995 = ~_965;
    float _997 = (_995 != 0) ? as_type<float>(_891) : 0.0;
    float _999 = _989 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _1001 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1003 = _1001 != 0;
    bool _1005 = !_985;
    float _1007 = _1005 ? _945 : 0.0;
    float _1009 = -_999;
    float _1011 = _1009 + 1.0;
    bool _1013 = !_985;
    float _1015 = _1013 ? _947 : 0.0;
    int _1017 = ~_965;
    float _1019 = (_1017 != 0) ? as_type<float>(_893) : 0.0;
    bool _1021 = !_1003;
    float _1023 = abs(_1011);
    float _1025 = log2(_1023);
    bool _1027 = !_1003;
    float _1029 = _1015 * _975;
    float _1031 = _1015 * _969;
    bool _1033 = !_1021;
    float _1035 = _1033 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    bool _1037 = !_1027;
    float _1039 = _1037 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1041 = fma(_993, _1007, _1029);
    float _1043 = fma(_997, _1007, _1031);
    bool _1045 = !_1003;
    float _1047 = _1015 * _981;
    float _1049 = _1035 * _1041;
    float _1051 = _1039 * _1043;
    bool _1053 = !_1045;
    float _1055 = _1053 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1057 = fma(_1019, _1007, _1047);
    float _1059 = _799 * _779;
    float _1061 = _1025 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1063 = _1051 * 0.715200006961822509765625;
    float _1065 = _1025 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1067 = _1055 * _1057;
    int _1069 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1071 = _1069 != 0;
    float _1073 = fma(_1049, 0.2125999927520751953125, _1063);
    float _1075 = exp2(_1061);
    float _1077 = -_636;
    float _1079 = _1077 + 1.0;
    float _1081 = _729 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1083 = fma(_1067, 0.072200000286102294921875, _1073);
    bool _1085 = !_1071;
    float _1087 = _759 * _1079;
    float _1089 = -_1051;
    float _1091 = _1089 + _1083;
    float _1093 = exp2(_1065);
    float _1095 = -_1049;
    float _1097 = _1095 + _1083;
    bool _1099 = !_1071;
    float _1101 = fma(_1081, _1091, _1051);
    float _1103 = _1085 ? _1059 : 0.0;
    float _1105 = fma(_1081, _1097, _1049);
    float _1107 = -_1067;
    float _1109 = _1107 + _1083;
    bool _1111 = !_88;
    float _1113 = _1111 ? _1075 : 1.0;
    float _1115 = fma(_1081, _1109, _1067);
    float _1117 = _1113 * _1101;
    float _1119 = _1099 ? _971 : 0.0;
    float _1121 = _807 * _1113;
    float _1123 = _1113 * _1105;
    bool _1125 = !_88;
    float _1127 = _1125 ? _1093 : 1.0;
    bool _1129 = !_1071;
    float _1131 = _1127 * _1103;
    float _1133 = _92 ? _1121 : _1117;
    float _1135 = _1127 * _1119;
    float _1137 = _1103;
    float _1139 = _1121;
    int _1141 = as_type<int>(_1087);
    float _1143 = _1113;
    if (_88)
    {
        _1137 = 0.0;
    }
    float _1145 = _1137;
    float _1147 = _1129 ? _977 : 0.0;
    float _1149 = _1133 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1151 = _92 ? _1121 : _1123;
    float _1153 = _1145;
    if (!_92)
    {
        float _1155 = _1113 * _1115;
        _1139 = _1155;
    }
    float _1157 = _1139;
    float _1159 = _1127 * _1147;
    float _1161 = _1157 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1163 = _1151 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1165 = fma(_1135, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1149);
    float _1167 = fma(_1159, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1161);
    float _1169 = fma(_1131, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1163);
    float _1171 = _1087 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _1173 = _1161;
    float _1175 = _1163;
    float _1177 = _1165;
    float _1179 = _1167;
    if (_88)
    {
        _1173 = 0.0;
    }
    float _1181 = _1173;
    float _1183 = _1181;
    if (_88)
    {
        _1175 = 0.0;
    }
    float _1185 = _1175;
    float _1187 = _1185;
    if (_88)
    {
        _1141 = as_type<int>(_1171);
    }
    int _1189 = _1141;
    bool _1191 = !_88;
    float _1193 = _1191 ? _999 : 0.0;
    int _1195 = _1189;
    int _1197 = _1189;
    if (_88)
    {
        _1143 = _1169;
    }
    float _1199 = _1143;
    float _1201 = _1199;
    float _1203 = _1199;
    if (!_88)
    {
        int _1205 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1207 = _1205 != 0;
        float _1209 = _685 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1211 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1213 = _1211 != 0;
        float _1215 = _683 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1217 = _687 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1219 = !_1213;
        float _1221 = _1219 ? _1215 : 0.0;
        bool _1223 = !_1213;
        float _1225 = _1223 ? _1209 : 0.0;
        bool _1227 = !_1213;
        float _1229 = _1227 ? _1217 : 0.0;
        float _1231 = _1193 * _1221;
        _1153 = _1231;
        if (!_1207)
        {
            _1195 = as_type<int>(_1171);
        }
        int _1233 = _1195;
        float _1235 = _1193 * _1225;
        _1183 = _1235;
        _1197 = _1233;
        if (!_1207)
        {
            _1201 = _1169;
        }
        float _1237 = _1201;
        float _1239 = _1193 * _1229;
        bool _1241 = !_1207;
        _1203 = _1237;
        _1187 = _1239;
        if (!_1241)
        {
            float _1243 = -_1193;
            float _1245 = _1243 + 1.0;
            float _1247 = precise::clamp(_1245, 0.0, 1.0);
            float _1249 = _1247 * _1171;
            float _1251 = precise::max(_1249, 9.9999997473787516355514526367188e-05);
            float _1253 = 1.0 / _1251;
            float _1255 = _1253 * _1171;
            float _1257 = _1169 * _1255;
            float _1259 = _1165 * _1255;
            float _1261 = _1167 * _1255;
            _1177 = _1259;
            _1183 = 0.0;
            _1203 = _1257;
            _1153 = 0.0;
            _1197 = as_type<int>(_1249);
            _1179 = _1261;
            _1187 = 0.0;
        }
    }
    float _1263 = _1177;
    float _1265 = _1183;
    float _1267 = _1203;
    float _1269 = _1153;
    int _1271 = _1197;
    float _1273 = _1179;
    float _1275 = _1187;
    int _1277 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1279 = _1277 != 0;
    int _1281 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1283 = _1281 != 0;
    float _1285 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1287 = _1263 + _1265;
    float _1289 = _675 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1291 = _1267 + _1269;
    bool _1293 = !_1283;
    float _1295 = _1293 ? as_type<float>(_1271) : 1.0;
    float _1297 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1299 = _1273 + _1275;
    float _1301 = -_1295;
    float _1303 = _1301 + 1.0;
    float _1305 = abs(_1303);
    float _1307 = log2(_1305);
    float _1309 = _1307 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1311 = exp2(_1309);
    float _1313 = -_1311;
    float _1315 = spvFAdd(_1313, 1.00010001659393310546875);
    float _1317 = -_1311;
    float _1319 = _1317 + 1.0;
    float _1321 = -_1295;
    float _1323 = _1321 + _1319;
    float _1325 = 1.0 / _1315;
    float _1327 = _1285 * _1323;
    float _1329 = _1289 * _1323;
    float _1331 = _1297 * _1323;
    float _1333 = fma(_1287, _1295, _1327);
    float _1335 = fma(_1291, _1295, _1329);
    float _1337 = fma(_1299, _1295, _1331);
    float _1339 = _1325 * _1333;
    float _1341 = _1325 * _1335;
    float _1343 = _1325 * _1337;
    float _1345 = _1339 * 0.715200006961822509765625;
    float _1347 = fma(_1341, 0.2125999927520751953125, _1345);
    float _1349 = fma(_1343, 0.072200000286102294921875, _1347);
    float _1351 = 1.0 / _1349;
    float _1353 = _1351 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1355 = precise::clamp(_1353, 0.0, 1.0);
    float _1357 = fma(_1355, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1359 = _1357 * _941;
    float _1361 = fma(_1341, _1359, _935);
    float _1363 = fma(_1339, _1359, _937);
    float _1365 = fma(_1343, _1359, _939);
    bool _1367 = !_1279;
    float _1369 = _1343;
    float _1371 = _1363;
    float _1373 = _1319;
    int _1375 = as_type<int>(_1311);
    int _1377 = as_type<int>(_1351);
    float _1379 = _1343;
    float _1381 = _1363;
    float _1383 = _1319;
    if (!_1367)
    {
        bool _1385 = _1319 != 1.0;
        bool _1387 = isnan(_1319);
        bool _1389 = _1385 || _1387;
        bool _1391 = isnan(1.0);
        bool _1393 = _1389 || _1391;
        float _1395 = -_1311;
        bool _1397 = _1395 != (-1.0);
        bool _1399 = isnan(_1395);
        bool _1401 = _1397 || _1399;
        bool _1403 = isnan(-1.0);
        bool _1405 = _1401 || _1403;
        float _1407 = -_1311;
        bool _1409 = _1407 == (-1.0);
        bool _1411 = !_1393;
        bool _1413 = _1409 || _1411;
        bool _1415 = _1319 == 1.0;
        bool _1417 = _1415 && _1405;
        bool _1419 = !_1413;
        float _1421 = _1419 ? _1319 : 0.0;
        bool _1423 = !_1417;
        float _1425 = _1423 ? 0.0 : 1.0;
        float _1427 = _1413 ? 0.0 : 0.5;
        float _1429 = _1421 * 0.715200006961822509765625;
        float _1431 = fma(_1425, 0.2125999927520751953125, _1429);
        float _1433 = fma(_1427, 0.072200000286102294921875, _1431);
        float _1435 = 1.0 / _1433;
        float _1437 = _1435 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1439 = precise::clamp(_1437, 0.0, 1.0);
        float _1441 = fma(_1439, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1443 = _1425 * _1441;
        float _1445 = _1421 * _1441;
        float _1447 = _1427 * _1441;
        out.m_46.x = _1443;
        out.m_46.y = _1445;
        out.m_46.z = _1447;
        out.m_46.w = 1.0;
        return out;
    }
    bool _1449 = _108 != 0;
    bool _1451 = !_1449;
    if (!_1451)
    {
        if (_98)
        {
            _1369 = 0.0;
        }
        float _1453 = _1369;
        float _1455 = _1453;
        if (_98)
        {
            _1371 = 0.0;
        }
        float _1457 = _1371;
        float _1459 = _1457;
        if (!_98)
        {
            float _1461 = _997 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1459 = _1461;
        }
        float _1463 = _1459;
        float _1465 = _1463;
        if (!_98)
        {
            float _1467 = _993 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1455 = _1467;
        }
        float _1469 = _1455;
        float _1471 = _1469;
        if (!_102)
        {
            float _1473 = fma(_969, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1463);
            _1465 = _1473;
        }
        float _1475 = _1465;
        if (_98)
        {
            _1373 = 0.0;
        }
        float _1477 = _1373;
        float _1479 = _1477;
        if (!_98)
        {
            float _1481 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1479 = _1481;
        }
        float _1483 = _1479;
        float _1485 = _1475 * 0.715200006961822509765625;
        float _1487 = _1483;
        if (!_102)
        {
            float _1489 = fma(_975, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1469);
            _1471 = _1489;
        }
        float _1491 = _1471;
        if (!_102)
        {
            float _1493 = fma(_981, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1483);
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
        out.m_46.x = _1509;
        out.m_46.y = _1511;
        out.m_46.z = _1513;
        out.m_46.w = 1.0;
        return out;
    }
    if (!_106)
    {
        _1375 = as_type<int>(_1361);
    }
    int _1515 = _1375;
    if (!_106)
    {
        _1377 = as_type<int>(_1365);
    }
    int _1517 = _1377;
    if (!_106)
    {
        out.m_46.x = as_type<float>(_1515);
        out.m_46.y = _1363;
        out.m_46.z = as_type<float>(_1517);
        out.m_46.w = _1319;
        return out;
    }
    if (_98)
    {
        _1379 = 0.0;
    }
    float _1519 = _1379;
    float _1521 = _1519;
    if (_98)
    {
        _1381 = 0.0;
    }
    float _1523 = _1381;
    float _1525 = _1523;
    if (!_98)
    {
        float _1527 = _997 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1525 = _1527;
    }
    float _1529 = _1525;
    float _1531 = _1529;
    if (!_98)
    {
        float _1533 = _993 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1521 = _1533;
    }
    float _1535 = _1521;
    float _1537 = _1535;
    if (!_102)
    {
        float _1539 = fma(_969, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1529);
        _1531 = _1539;
    }
    float _1541 = _1531;
    if (_98)
    {
        _1383 = 0.0;
    }
    float _1543 = _1383;
    float _1545 = _1543;
    if (!_98)
    {
        float _1547 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1545 = _1547;
    }
    float _1549 = _1545;
    float _1551 = _1541 * 0.715200006961822509765625;
    float _1553 = _1549;
    if (!_102)
    {
        float _1555 = fma(_975, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1535);
        _1537 = _1555;
    }
    float _1557 = _1537;
    if (!_102)
    {
        float _1559 = fma(_981, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1549);
        _1553 = _1559;
    }
    float _1561 = _1553;
    float _1563 = fma(_1557, 0.2125999927520751953125, _1551);
    float _1565 = fma(_1561, 0.072200000286102294921875, _1563);
    float _1567 = 1.0 / _1565;
    float _1569 = _1567 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1571 = precise::clamp(_1569, 0.0, 1.0);
    float _1573 = fma(_1571, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1575 = _1573 * _1557;
    float _1577 = _1573 * _1541;
    float _1579 = _1573 * _1561;
    out.m_46.x = _1575;
    out.m_46.y = _1577;
    out.m_46.z = _1579;
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
    bool _837 = false;
    bool _274 = false;
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
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    int _86 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _88 = _86 != 0;
    int _90 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _92 = _90 != 0;
    float _94 = precise::max(0.0, _84);
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _102 = _100 != 0;
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _106 = _104 != 0;
    int _108 = int(_82);
    float _110 = 1.0 / _58;
    float _112 = _110 * _64;
    float _114 = _110 * _70;
    float _116 = _110 * _76;
    float _118 = _112 * _112;
    float _120 = fma(_114, _114, _118);
    float _122 = fma(_116, _116, _120);
    float _124 = rsqrt(_122);
    float _126 = _114 * _124;
    float _128 = _116 * _124;
    float _130 = _112 * _124;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _136 = -_130;
    float _138 = -_94;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].z, _138);
    float _142 = _132 * _132;
    float _144 = _134 * _134;
    float _146 = _142 + _144;
    float _148 = sqrt(_146);
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _152 = _94;
    float _154 = _124;
    float _156 = _140;
    float _158 = _132;
    float _160 = _134;
    if (!_150)
    {
        _152 = _144;
    }
    float _162 = _152;
    float _164 = _162;
    if (!_150)
    {
        _154 = _142;
    }
    float _166 = _154;
    bool _168 = !_150;
    float _170 = _166;
    if (!_168)
    {
        float _172 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _176 = _148 + _174;
        float _178 = _140 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _180 = rsqrt(_146);
        float _182 = _176 * _172;
        float _184 = _182 * 0.15915493667125701904296875;
        float _186 = _184 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 * 6.283185482025146484375;
        float _192 = cos(_190);
        float _194 = fma(_188, _178, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _196 = _180 * _194;
        float _198 = _192 + (-1.0);
        float _200 = _132 * _196;
        float _202 = _134 * _196;
        float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _206 = _202 * _202;
        float _208 = fma(_140, _192, _204);
        float _210 = _200 * _200;
        _156 = _208;
        _170 = _210;
        _164 = _206;
        _158 = _200;
        _160 = _202;
    }
    float _212 = _156;
    float _214 = _170;
    float _216 = _164;
    float _218 = _158;
    float _220 = _160;
    float _222 = fma(_212, _212, _214);
    float _224 = _222 + _216;
    float _226 = rsqrt(_224);
    float _228 = _226 * _212;
    float _230 = -_228;
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
        int _252 = 0;
        int _254 = as_type<int>(_238);
        int _256 = 0;
        int _258 = 1200;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        int _270;
        _54(_252, _254, _256, _258, _260, _262, _264, _266, _268, _270);
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
    bool _300 = _228 > 0.0;
    float _302 = _128 * _128;
    float _304 = _126 * _126;
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
    float _322 = _128 * _308;
    float _324 = _126 * _308;
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
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    float2 _1993;
    _1993.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    _1993.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_348, _350));
    float _352 = _1993.x;
    float _354 = _352 * 256.0;
    int _356 = int(_354);
    float _358 = -_130;
    float _360 = _358 + 1.0;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_130;
    float _366 = fma(_364, _130, 1.0);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _226 * _218;
    int _372 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _374 = _372 != 0;
    float _376 = _226 * _220;
    float _378 = _370 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _380 = _128 * (-3.0);
    float _382 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _384 = -_378;
    float _386 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[11].y, _384);
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _392 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _394 = -_376;
    float _396 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
    float _398 = _362;
    if (_374)
    {
        float _400 = sqrt(_368);
        _398 = _400;
    }
    float _402 = _398;
    float _404 = fma(_130, _388, _382);
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _408 = fma(_302, 3.0, -1.0);
    float _410 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _412 = -_128;
    float _414 = fma(_412, _390, _404);
    float _416 = fma(_128, _390, _404);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _420 = fma(_130, _406, _392);
    float _422 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _424 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _426 = -_128;
    float _428 = fma(_426, _418, _420);
    float _430 = fma(_128, _418, _420);
    float _432 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _434 = -_126;
    float _436 = fma(_434, _424, _414);
    float _438 = abs(_402);
    float _440 = log2(_438);
    float _442 = fma(_126, _424, _416);
    float _444 = fma(_130, _432, _410);
    float _446 = _126 * _130;
    float _448 = -_128;
    float _450 = _130 * _448;
    float _452 = -_128;
    float _454 = fma(_452, _380, -1.0);
    float _456 = -_128;
    float _458 = fma(_456, _422, _444);
    float _460 = fma(_128, _422, _444);
    float _462 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _464 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _466 = in.m_48.x;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = -_126;
    float _474 = fma(_472, _462, _428);
    float _476 = fma(_126, _462, _430);
    float _478 = -_126;
    float _480 = fma(_478, _464, _458);
    float _482 = _440 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _484 = fma(_126, _464, _460);
    float _486 = -_130;
    float _488 = _126 * _486;
    float _490 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _492 = exp2(_482);
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _498 = fma(_490, _488, _480);
    float _500 = fma(_490, _446, _484);
    float _502 = fma(_494, _488, _436);
    float _504 = _130 * _128;
    float _506 = fma(_494, _446, _442);
    float _508 = fma(_496, _446, _476);
    float _510 = fma(_496, _488, _474);
    float _512 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _514 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _516 = _126 * _128;
    float _518 = fma(_512, _450, _498);
    float _520 = fma(_512, _504, _500);
    float _522 = _492 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _524 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _526 = fma(_514, _450, _510);
    float _528 = fma(_514, _504, _508);
    float _530 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = fma(_524, _516, _518);
    float _536 = fma(_524, _516, _520);
    float _538 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _540 = -_532;
    float _542 = _540 + 1.0;
    float _544 = in.m_48.y;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = fma(_538, _450, _502);
    float _552 = fma(_538, _504, _506);
    float _554 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _556 = abs(_542);
    float _558 = log2(_556);
    float _560 = fma(_396, -0.5, 0.5);
    float _562 = fma(_396, 0.5, 0.5);
    float _564 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _566 = fma(_554, _516, _526);
    float _568 = fma(_562, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _570 = fma(_564, _516, _550);
    float _572 = sqrt(_560);
    float _574 = fma(_564, _516, _552);
    float _576 = fma(_562, _568, -0.212114393711090087890625);
    float _578 = fma(_554, _516, _528);
    float _580 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _582 = _228 + 1.0;
    float _584 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _586 = _110 * _470;
    float _588 = _558 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _590 = fma(_562, _576, 1.570728778839111328125);
    float _592 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _594 = fma(_580, _454, _570);
    float _596 = exp2(_588);
    float _598 = fma(_580, _408, _574);
    float _600 = fma(_584, _454, _534);
    float _602 = fma(_584, _408, _536);
    float _604 = _572 * 0.636619746685028076171875;
    float _606 = fma(_592, _454, _566);
    float _608 = fma(_592, _408, _578);
    float _610 = _110 * _548;
    float _612 = -_590;
    float _614 = fma(_604, _612, 1.0);
    float _616 = fma(_228, -0.5, 0.5);
    float _618 = -_228;
    float _620 = fma(_596, _582, _618);
    float _622 = fma(_620, 0.5, 0.5);
    float _624 = float(uint(_356));
    float _626 = _624 * 0.00390625;
    float2 _2432 = float2(_586, _610);
    float3 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2432, float2(0.0), isnan(_2432))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2432, float2(0.0), isnan(_2432))).xyz;
    float _632 = _630.x;
    float _634 = _630.y;
    float _636 = _630.z;
    float2 _2448 = float2(_348, _350);
    float2 _640 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2448, float2(0.0), isnan(_2448)), level(_626)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2448, float2(0.0), isnan(_2448)), level(_626)).xy;
    float _642 = _640.x;
    float _644 = _640.y;
    float2 _2461 = float2(_348, _350);
    float2 _646 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2461, float2(0.0), isnan(_2461)), level(_626)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2461, float2(0.0), isnan(_2461)), level(_626)).xy;
    float _648 = _646.x;
    float _650 = _646.y;
    float2 _2474 = float2(_348, _350);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2474, float2(0.0), isnan(_2474)), level(_626)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2474, float2(0.0), isnan(_2474)), level(_626)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2491 = float2(_348, _350);
    float4 _663 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2491, float2(0.0), isnan(_2491)), level(_626)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2491, float2(0.0), isnan(_2491)), level(_626)).xyzw;
    float _665 = _663.x;
    float _667 = _663.y;
    float _669 = _663.z;
    float _671 = _663.w;
    float2 _2508 = float2(_614, _616);
    float3 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2508, float2(0.0), isnan(_2508))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2508, float2(0.0), isnan(_2508))).xyz;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    float2 _2522 = float2(_614, _622);
    float3 _681 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2522, float2(0.0), isnan(_2522))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2522, float2(0.0), isnan(_2522))).xyz;
    float _683 = _681.x;
    float _685 = _681.y;
    float _687 = _681.z;
    float _689 = _126 * _126;
    int _691 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _693 = _691 != 0;
    float _695 = -_130;
    float _697 = fma(_695, _130, _689);
    int _699 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _701 = _699 != 0;
    float _703 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _705 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _707 = _705 + 1.0;
    float _709 = fma(_703, _697, _600);
    float _711 = fma(_703, _697, _602);
    float _713 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _715 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _717 = fma(_713, _697, _594);
    float _719 = fma(_713, _697, _598);
    float _721 = fma(_715, _697, _606);
    float _723 = fma(_715, _697, _608);
    float _725 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _727 = _725 + 1.0;
    float _729 = _632 * _634;
    float _731 = -_644;
    float _733 = _731 + _650;
    float _735 = _661 * _661;
    float _737 = -_729;
    float _739 = _737 + 1.0;
    float _741 = _671 * _671;
    float _743 = _735 * _735;
    float _745 = fma(_739, _707, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _747 = fma(_739, _727, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _749 = _642 * _644;
    float _751 = _743 * 16.0;
    float _753 = _741 * _741;
    float _755 = _648 * _747;
    float _757 = _751 * _644;
    float _759 = fma(_632, _733, _644);
    float _761 = _753 * 16.0;
    float _763 = _659 * _757;
    float _765 = precise::max(_759, 1.52587890625e-05);
    float _767 = _761 * _745;
    float _769 = _655 * _757;
    float _771 = _657 * _757;
    float _773 = -_749;
    float _775 = fma(_650, _755, _773);
    float _777 = _650 * _767;
    float _779 = 1.0 / _765;
    float _781 = _669 * _767;
    float _783 = fma(_632, _775, _749);
    float _785 = -_771;
    float _787 = fma(_667, _777, _785);
    float _789 = -_769;
    float _791 = fma(_665, _777, _789);
    float _793 = -_763;
    float _795 = fma(_650, _781, _793);
    float _797 = fma(_632, _787, _771);
    float _799 = fma(_632, _791, _769);
    float _801 = fma(_632, _795, _763);
    float _803 = _783 * _779;
    bool _805 = !_693;
    float _807 = _805 ? _803 : 0.0;
    bool _809 = !_701;
    int _811 = _701 ? (-1) : 0;
    int _825;
    int _827;
    int _829;
    int _831;
    int _833;
    int _835;
    if (!_809)
    {
        float _813 = _480 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _815 = _436 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _817 = _474 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _819 = _484 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _821 = _442 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _823 = _476 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _825 = as_type<int>(_821);
        _827 = as_type<int>(_819);
        _829 = as_type<int>(_823);
        _831 = as_type<int>(_813);
        _833 = as_type<int>(_815);
        _835 = as_type<int>(_817);
        _837 = true;
    }
    else
    {
        int _839 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _841 = _839 != 0;
        float _843 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _845 = _717 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _847 = _721 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _849 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _851 = _719 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _853 = _723 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _855 = as_type<int>(_843);
        int _857 = as_type<int>(_845);
        int _859 = as_type<int>(_847);
        int _861 = as_type<int>(_849);
        int _863 = as_type<int>(_851);
        _811 = _841 ? (-1) : 0;
        _829 = as_type<int>(_853);
        if (_841)
        {
            float _865 = _410 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _855 = as_type<int>(_865);
        }
        int _867 = _855;
        _831 = _867;
        if (_841)
        {
            float _869 = _382 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _857 = as_type<int>(_869);
        }
        int _871 = _857;
        _833 = _871;
        if (_841)
        {
            float _873 = _392 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _859 = as_type<int>(_873);
        }
        int _875 = _859;
        _835 = _875;
        if (_841)
        {
            _861 = _867;
        }
        int _877 = _861;
        _827 = _877;
        if (_841)
        {
            _863 = _871;
        }
        int _879 = _863;
        _825 = _879;
        if (_841)
        {
            _829 = _875;
        }
    }
    _837 = false;
    int _881 = _811;
    int _883 = _825;
    int _885 = _827;
    int _887 = _829;
    int _889 = _831;
    int _891 = _833;
    int _893 = _835;
    float2 _2874 = float2(_586, _610);
    float2 _895 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2874, float2(0.0), isnan(_2874))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2874, float2(0.0), isnan(_2874))).xy;
    float _897 = _895.x;
    float _899 = _895.y;
    int _901 = 0;
    int _903 = _881;
    if (!_102)
    {
        int _905 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _907 = _905 != 0;
        _901 = _907 ? (-1) : 0;
    }
    int _909 = _901;
    if (_102)
    {
        _903 = -1;
    }
    int _911 = _903;
    int _913 = _911;
    if (!_102)
    {
        int _915 = ~_909;
        bool _917 = !_106;
        int _919 = _915 & (_917 ? (-1) : 0);
        _913 = _919;
    }
    int _921 = _913;
    bool _923 = _108 != 0;
    float _925 = fma(_897, 2.0, -1.0);
    float _927 = fma(_899, 2.0, -1.0);
    float _929 = fma(_925, (*spvDescriptorSet0.fp_c3)._m0[22].x, _586);
    float _931 = fma(_927, (*spvDescriptorSet0.fp_c3)._m0[22].y, _610);
    float2 _2938 = float2(_929, _931);
    float4 _933 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2938, float2(0.0), isnan(_2938))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2938, float2(0.0), isnan(_2938))).xyzw;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = _933.w;
    float _943 = _558 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _945 = _807 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _947 = _807 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _949 = _921;
    if (_98)
    {
        _949 = -1;
    }
    int _951 = _949;
    float _953 = exp2(_943);
    int _955 = _951;
    if (!_98)
    {
        bool _957 = !_106;
        bool _959 = _957 && _92;
        bool _961 = !_923;
        bool _963 = _959 && _961;
        _955 = _963 ? (-1) : 0;
    }
    int _965 = _955;
    int _967 = ~_921;
    float _969 = (_967 != 0) ? as_type<float>(_883) : 0.0;
    float _971 = _797 * _779;
    int _973 = ~_921;
    float _975 = (_973 != 0) ? as_type<float>(_885) : 0.0;
    float _977 = _801 * _779;
    int _979 = ~_921;
    float _981 = (_979 != 0) ? as_type<float>(_887) : 0.0;
    bool _983 = !_106;
    bool _985 = _92 && _983;
    float _987 = -_953;
    float _989 = _987 + 1.0;
    int _991 = ~_965;
    float _993 = (_991 != 0) ? as_type<float>(_889) : 0.0;
    int _995 = ~_965;
    float _997 = (_995 != 0) ? as_type<float>(_891) : 0.0;
    float _999 = _989 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _1001 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1003 = _1001 != 0;
    bool _1005 = !_985;
    float _1007 = _1005 ? _945 : 0.0;
    float _1009 = -_999;
    float _1011 = _1009 + 1.0;
    bool _1013 = !_985;
    float _1015 = _1013 ? _947 : 0.0;
    int _1017 = ~_965;
    float _1019 = (_1017 != 0) ? as_type<float>(_893) : 0.0;
    bool _1021 = !_1003;
    float _1023 = abs(_1011);
    float _1025 = log2(_1023);
    bool _1027 = !_1003;
    float _1029 = _1015 * _975;
    float _1031 = _1015 * _969;
    bool _1033 = !_1021;
    float _1035 = _1033 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    bool _1037 = !_1027;
    float _1039 = _1037 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1041 = fma(_993, _1007, _1029);
    float _1043 = fma(_997, _1007, _1031);
    bool _1045 = !_1003;
    float _1047 = _1015 * _981;
    float _1049 = _1035 * _1041;
    float _1051 = _1039 * _1043;
    bool _1053 = !_1045;
    float _1055 = _1053 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1057 = fma(_1019, _1007, _1047);
    float _1059 = _799 * _779;
    float _1061 = _1025 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1063 = _1051 * 0.715200006961822509765625;
    float _1065 = _1025 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1067 = _1055 * _1057;
    int _1069 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1071 = _1069 != 0;
    float _1073 = fma(_1049, 0.2125999927520751953125, _1063);
    float _1075 = exp2(_1061);
    float _1077 = -_636;
    float _1079 = _1077 + 1.0;
    float _1081 = _729 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1083 = fma(_1067, 0.072200000286102294921875, _1073);
    bool _1085 = !_1071;
    float _1087 = _759 * _1079;
    float _1089 = -_1051;
    float _1091 = _1089 + _1083;
    float _1093 = exp2(_1065);
    float _1095 = -_1049;
    float _1097 = _1095 + _1083;
    bool _1099 = !_1071;
    float _1101 = fma(_1081, _1091, _1051);
    float _1103 = _1085 ? _1059 : 0.0;
    float _1105 = fma(_1081, _1097, _1049);
    float _1107 = -_1067;
    float _1109 = _1107 + _1083;
    bool _1111 = !_88;
    float _1113 = _1111 ? _1075 : 1.0;
    float _1115 = fma(_1081, _1109, _1067);
    float _1117 = _1113 * _1101;
    float _1119 = _1099 ? _971 : 0.0;
    float _1121 = _807 * _1113;
    float _1123 = _1113 * _1105;
    bool _1125 = !_88;
    float _1127 = _1125 ? _1093 : 1.0;
    bool _1129 = !_1071;
    float _1131 = _1127 * _1103;
    float _1133 = _92 ? _1121 : _1117;
    float _1135 = _1127 * _1119;
    float _1137 = _1103;
    float _1139 = _1121;
    int _1141 = as_type<int>(_1087);
    float _1143 = _1113;
    if (_88)
    {
        _1137 = 0.0;
    }
    float _1145 = _1137;
    float _1147 = _1129 ? _977 : 0.0;
    float _1149 = _1133 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1151 = _92 ? _1121 : _1123;
    float _1153 = _1145;
    if (!_92)
    {
        float _1155 = _1113 * _1115;
        _1139 = _1155;
    }
    float _1157 = _1139;
    float _1159 = _1127 * _1147;
    float _1161 = _1157 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1163 = _1151 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1165 = fma(_1135, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1149);
    float _1167 = fma(_1159, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1161);
    float _1169 = fma(_1131, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1163);
    float _1171 = _1087 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _1173 = _1161;
    float _1175 = _1163;
    float _1177 = _1165;
    float _1179 = _1167;
    if (_88)
    {
        _1173 = 0.0;
    }
    float _1181 = _1173;
    float _1183 = _1181;
    if (_88)
    {
        _1175 = 0.0;
    }
    float _1185 = _1175;
    float _1187 = _1185;
    if (_88)
    {
        _1141 = as_type<int>(_1171);
    }
    int _1189 = _1141;
    bool _1191 = !_88;
    float _1193 = _1191 ? _999 : 0.0;
    int _1195 = _1189;
    int _1197 = _1189;
    if (_88)
    {
        _1143 = _1169;
    }
    float _1199 = _1143;
    float _1201 = _1199;
    float _1203 = _1199;
    if (!_88)
    {
        int _1205 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1207 = _1205 != 0;
        float _1209 = _685 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1211 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1213 = _1211 != 0;
        float _1215 = _683 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1217 = _687 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1219 = !_1213;
        float _1221 = _1219 ? _1215 : 0.0;
        bool _1223 = !_1213;
        float _1225 = _1223 ? _1209 : 0.0;
        bool _1227 = !_1213;
        float _1229 = _1227 ? _1217 : 0.0;
        float _1231 = _1193 * _1221;
        _1153 = _1231;
        if (!_1207)
        {
            _1195 = as_type<int>(_1171);
        }
        int _1233 = _1195;
        float _1235 = _1193 * _1225;
        _1183 = _1235;
        _1197 = _1233;
        if (!_1207)
        {
            _1201 = _1169;
        }
        float _1237 = _1201;
        float _1239 = _1193 * _1229;
        bool _1241 = !_1207;
        _1203 = _1237;
        _1187 = _1239;
        if (!_1241)
        {
            float _1243 = -_1193;
            float _1245 = _1243 + 1.0;
            float _1247 = precise::clamp(_1245, 0.0, 1.0);
            float _1249 = _1247 * _1171;
            float _1251 = precise::max(_1249, 9.9999997473787516355514526367188e-05);
            float _1253 = 1.0 / _1251;
            float _1255 = _1253 * _1171;
            float _1257 = _1169 * _1255;
            float _1259 = _1165 * _1255;
            float _1261 = _1167 * _1255;
            _1177 = _1259;
            _1183 = 0.0;
            _1203 = _1257;
            _1153 = 0.0;
            _1197 = as_type<int>(_1249);
            _1179 = _1261;
            _1187 = 0.0;
        }
    }
    float _1263 = _1177;
    float _1265 = _1183;
    float _1267 = _1203;
    float _1269 = _1153;
    int _1271 = _1197;
    float _1273 = _1179;
    float _1275 = _1187;
    int _1277 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1279 = _1277 != 0;
    int _1281 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1283 = _1281 != 0;
    float _1285 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1287 = _1263 + _1265;
    float _1289 = _675 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1291 = _1267 + _1269;
    bool _1293 = !_1283;
    float _1295 = _1293 ? as_type<float>(_1271) : 1.0;
    float _1297 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1299 = _1273 + _1275;
    float _1301 = -_1295;
    float _1303 = _1301 + 1.0;
    float _1305 = abs(_1303);
    float _1307 = log2(_1305);
    float _1309 = _1307 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1311 = exp2(_1309);
    float _1313 = -_1311;
    float _1315 = spvFAdd(_1313, 1.00010001659393310546875);
    float _1317 = -_1311;
    float _1319 = _1317 + 1.0;
    float _1321 = -_1295;
    float _1323 = _1321 + _1319;
    float _1325 = 1.0 / _1315;
    float _1327 = _1285 * _1323;
    float _1329 = _1289 * _1323;
    float _1331 = _1297 * _1323;
    float _1333 = fma(_1287, _1295, _1327);
    float _1335 = fma(_1291, _1295, _1329);
    float _1337 = fma(_1299, _1295, _1331);
    float _1339 = _1325 * _1333;
    float _1341 = _1325 * _1335;
    float _1343 = _1325 * _1337;
    float _1345 = _1339 * 0.715200006961822509765625;
    float _1347 = fma(_1341, 0.2125999927520751953125, _1345);
    float _1349 = fma(_1343, 0.072200000286102294921875, _1347);
    float _1351 = 1.0 / _1349;
    float _1353 = _1351 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1355 = precise::clamp(_1353, 0.0, 1.0);
    float _1357 = fma(_1355, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1359 = _1357 * _941;
    float _1361 = fma(_1341, _1359, _935);
    float _1363 = fma(_1339, _1359, _937);
    float _1365 = fma(_1343, _1359, _939);
    bool _1367 = !_1279;
    float _1369 = _1343;
    float _1371 = _1363;
    float _1373 = _1319;
    int _1375 = as_type<int>(_1311);
    int _1377 = as_type<int>(_1351);
    float _1379 = _1343;
    float _1381 = _1363;
    float _1383 = _1319;
    if (!_1367)
    {
        bool _1385 = _1319 != 1.0;
        bool _1387 = isnan(_1319);
        bool _1389 = _1385 || _1387;
        bool _1391 = isnan(1.0);
        bool _1393 = _1389 || _1391;
        float _1395 = -_1311;
        bool _1397 = _1395 != (-1.0);
        bool _1399 = isnan(_1395);
        bool _1401 = _1397 || _1399;
        bool _1403 = isnan(-1.0);
        bool _1405 = _1401 || _1403;
        float _1407 = -_1311;
        bool _1409 = _1407 == (-1.0);
        bool _1411 = !_1393;
        bool _1413 = _1409 || _1411;
        bool _1415 = _1319 == 1.0;
        bool _1417 = _1415 && _1405;
        bool _1419 = !_1413;
        float _1421 = _1419 ? _1319 : 0.0;
        bool _1423 = !_1417;
        float _1425 = _1423 ? 0.0 : 1.0;
        float _1427 = _1413 ? 0.0 : 0.5;
        float _1429 = _1421 * 0.715200006961822509765625;
        float _1431 = fma(_1425, 0.2125999927520751953125, _1429);
        float _1433 = fma(_1427, 0.072200000286102294921875, _1431);
        float _1435 = 1.0 / _1433;
        float _1437 = _1435 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1439 = precise::clamp(_1437, 0.0, 1.0);
        float _1441 = fma(_1439, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1443 = _1425 * _1441;
        float _1445 = _1421 * _1441;
        float _1447 = _1427 * _1441;
        out.m_46.x = _1443;
        out.m_46.y = _1445;
        out.m_46.z = _1447;
        out.m_46.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    bool _1449 = _108 != 0;
    bool _1451 = !_1449;
    if (!_1451)
    {
        if (_98)
        {
            _1369 = 0.0;
        }
        float _1453 = _1369;
        float _1455 = _1453;
        if (_98)
        {
            _1371 = 0.0;
        }
        float _1457 = _1371;
        float _1459 = _1457;
        if (!_98)
        {
            float _1461 = _997 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1459 = _1461;
        }
        float _1463 = _1459;
        float _1465 = _1463;
        if (!_98)
        {
            float _1467 = _993 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1455 = _1467;
        }
        float _1469 = _1455;
        float _1471 = _1469;
        if (!_102)
        {
            float _1473 = fma(_969, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1463);
            _1465 = _1473;
        }
        float _1475 = _1465;
        if (_98)
        {
            _1373 = 0.0;
        }
        float _1477 = _1373;
        float _1479 = _1477;
        if (!_98)
        {
            float _1481 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1479 = _1481;
        }
        float _1483 = _1479;
        float _1485 = _1475 * 0.715200006961822509765625;
        float _1487 = _1483;
        if (!_102)
        {
            float _1489 = fma(_975, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1469);
            _1471 = _1489;
        }
        float _1491 = _1471;
        if (!_102)
        {
            float _1493 = fma(_981, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1483);
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
        out.m_46.x = _1509;
        out.m_46.y = _1511;
        out.m_46.z = _1513;
        out.m_46.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    if (!_106)
    {
        _1375 = as_type<int>(_1361);
    }
    int _1515 = _1375;
    if (!_106)
    {
        _1377 = as_type<int>(_1365);
    }
    int _1517 = _1377;
    if (!_106)
    {
        out.m_46.x = as_type<float>(_1515);
        out.m_46.y = _1363;
        out.m_46.z = as_type<float>(_1517);
        out.m_46.w = _1319;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    if (_98)
    {
        _1379 = 0.0;
    }
    float _1519 = _1379;
    float _1521 = _1519;
    if (_98)
    {
        _1381 = 0.0;
    }
    float _1523 = _1381;
    float _1525 = _1523;
    if (!_98)
    {
        float _1527 = _997 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1525 = _1527;
    }
    float _1529 = _1525;
    float _1531 = _1529;
    if (!_98)
    {
        float _1533 = _993 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1521 = _1533;
    }
    float _1535 = _1521;
    float _1537 = _1535;
    if (!_102)
    {
        float _1539 = fma(_969, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1529);
        _1531 = _1539;
    }
    float _1541 = _1531;
    if (_98)
    {
        _1383 = 0.0;
    }
    float _1543 = _1383;
    float _1545 = _1543;
    if (!_98)
    {
        float _1547 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1545 = _1547;
    }
    float _1549 = _1545;
    float _1551 = _1541 * 0.715200006961822509765625;
    float _1553 = _1549;
    if (!_102)
    {
        float _1555 = fma(_975, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1535);
        _1537 = _1555;
    }
    float _1557 = _1537;
    if (!_102)
    {
        float _1559 = fma(_981, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1549);
        _1553 = _1559;
    }
    float _1561 = _1553;
    float _1563 = fma(_1557, 0.2125999927520751953125, _1551);
    float _1565 = fma(_1561, 0.072200000286102294921875, _1563);
    float _1567 = 1.0 / _1565;
    float _1569 = _1567 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1571 = precise::clamp(_1569, 0.0, 1.0);
    float _1573 = fma(_1571, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1575 = _1573 * _1557;
    float _1577 = _1573 * _1541;
    float _1579 = _1573 * _1561;
    out.m_46.x = _1575;
    out.m_46.y = _1577;
    out.m_46.z = _1579;
    out.m_46.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_46)};
}

