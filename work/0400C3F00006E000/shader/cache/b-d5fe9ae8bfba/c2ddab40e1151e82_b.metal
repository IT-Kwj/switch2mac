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
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_CSmplr_w [[id(17)]];
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
void _50(thread const int& _3915, thread const int& _3916, thread const int& _3917, thread const int& _3918, thread int& _3919, thread int& _3920, thread int& _3921, thread int& _3922, thread int& _3923, thread int& _3924)
{
    float _3927 = as_type<float>(_3916) + 0.0;
    bool _3929 = _3927 != 0.0;
    bool _3931 = isnan(_3927);
    bool _3933 = _3929 || _3931;
    bool _3935 = isnan(0.0);
    bool _3937 = _3933 || _3935;
    int _3939 = as_type<int>(_3927);
    int _3941 = _3915;
    int _3943 = _3918;
    int _3945 = _3937 ? (-1) : 0;
    if (!_3937)
    {
        float _3947 = as_type<float>(_3916) * 1.0;
        _3939 = as_type<int>(_3947);
    }
    int _3949 = _3939;
    bool _3951 = !_3937;
    int _3953 = _3949;
    if (!_3951)
    {
        float _3955 = as_type<float>(_3916) + 0.0;
        bool _3957 = _3955 >= 0.0;
        bool _3959 = isnan(_3955);
        bool _3961 = _3957 || _3959;
        bool _3963 = isnan(0.0);
        bool _3965 = _3961 || _3963;
        int _3967 = as_type<int>(_3955);
        _3945 = _3965 ? (-1) : 0;
        if (!_3965)
        {
            _3967 = 2147483647;
        }
        int _3969 = _3967;
        bool _3971 = !_3965;
        _3953 = _3969;
        if (!_3971)
        {
            float _3973 = abs(as_type<float>(_3916));
            float _3975 = _3973 + 0.0;
            bool _3977 = _3975 > as_type<float>(0x7f800000u /* inf */);
            bool _3979 = isnan(_3975);
            bool _3981 = _3977 || _3979;
            bool _3983 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3985 = _3981 || _3983;
            int _3987 = as_type<int>(_3975);
            _3945 = _3985 ? (-1) : 0;
            if (_3985)
            {
                float _3989 = as_type<float>(_3916) + 1.0;
                _3987 = as_type<int>(_3989);
            }
            int _3991 = _3987;
            _3953 = _3991;
            if (!_3985)
            {
                float _3993 = abs(as_type<float>(_3916));
                float _3995 = _3993 + (-0.0);
                float _3997 = 0.0 + _3995;
                bool _3999 = _3997 != as_type<float>(0x7f800000u /* inf */);
                bool _4001 = isnan(_3997);
                bool _4003 = _3999 || _4001;
                bool _4005 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4007 = _4003 || _4005;
                int _4009 = as_type<int>(_3997);
                _3945 = _4007 ? (-1) : 0;
                if (!_4007)
                {
                    _4009 = _3916;
                }
                int _4011 = _4009;
                bool _4013 = !_4007;
                _3953 = _4011;
                if (!_4013)
                {
                    float _4015 = as_type<float>(_3916) * 18446744073709551616.0;
                    float _4017 = rsqrt(_4015);
                    float _4019 = _4015 * _4017;
                    float _4021 = _4017 * 0.5;
                    float _4023 = -_4019;
                    float _4025 = 0.0 + _4023;
                    float _4027 = fma(_4021, _4025, 0.5);
                    float _4029 = fma(_4019, _4027, _4019);
                    float _4031 = -_4029;
                    float _4033 = 0.0 + _4031;
                    float _4035 = fma(_4029, _4033, _4015);
                    float _4037 = fma(_4021, _4035, _4029);
                    float _4039 = _4037 * 2.3283064365386962890625e-10;
                    _3953 = as_type<int>(_4039);
                    _3941 = as_type<int>(_4015);
                    _3943 = as_type<int>(_4029);
                }
            }
        }
    }
    int _4041 = _3953;
    int _4043 = _3941;
    int _4045 = _3943;
    int _4047 = _3945;
    _3919 = _4041;
    _3920 = _4043;
    _3921 = _3917;
    _3922 = 0;
    _3923 = _4045;
    _3924 = _4047;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _837 = false;
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
    float _150 = _120;
    float _152 = _136;
    float _154 = _128;
    float _156 = _130;
    if (!_146)
    {
        _148 = _140;
    }
    float _158 = _148;
    float _160 = _158;
    if (!_146)
    {
        _150 = _138;
    }
    float _162 = _150;
    bool _164 = !_146;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _172 = _144 + _170;
        float _174 = _136 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _176 = rsqrt(_142);
        float _178 = _172 * _168;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _180 * 6.283185482025146484375;
        float _184 = sin(_182);
        float _186 = _180 * 6.283185482025146484375;
        float _188 = cos(_186);
        float _190 = fma(_184, _174, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _192 = _176 * _190;
        float _194 = _188 + (-1.0);
        float _196 = _128 * _192;
        float _198 = _130 * _192;
        float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _202 = _198 * _198;
        float _204 = fma(_136, _188, _200);
        float _206 = _196 * _196;
        _152 = _204;
        _166 = _206;
        _160 = _202;
        _154 = _196;
        _156 = _198;
    }
    float _208 = _152;
    float _210 = _166;
    float _212 = _160;
    float _214 = _154;
    float _216 = _156;
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
    float _268;
    if (!_246)
    {
        int _248 = 0;
        int _250 = as_type<int>(_234);
        int _252 = 1200;
        int _254 = 0;
        int _256;
        int _258;
        int _260;
        int _262;
        int _264;
        int _266;
        _50(_248, _250, _252, _254, _256, _258, _260, _262, _264, _266);
        _268 = as_type<float>(_256);
        _270 = true;
    }
    else
    {
        float _272 = rsqrt(_234);
        float _274 = _234 * _272;
        float _276 = _272 * 0.5;
        float _278 = -_274;
        float _280 = 0.0 + _278;
        float _282 = fma(_276, _280, 0.5);
        float _284 = fma(_274, _282, _274);
        float _286 = -_284;
        float _288 = 0.0 + _286;
        float _290 = fma(_284, _288, _234);
        float _292 = fma(_276, _290, _284);
        _268 = _292;
    }
    _270 = false;
    float _294 = _268;
    bool _296 = _224 > 0.0;
    float _298 = _124 * _124;
    float _300 = _122 * _122;
    float _302 = _298 + _300;
    if (_296)
    {
        discard_fragment();
    }
    float _304 = rsqrt(_302);
    float _306 = _244 * _294;
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
    float2 _1975;
    _1975.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_344, _346));
    _1975.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_344, _346));
    float _348 = _1975.x;
    float _350 = _348 * 256.0;
    int _352 = int(_350);
    float _354 = -_126;
    float _356 = _354 + 1.0;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = -_126;
    float _362 = fma(_360, _126, 1.0);
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _222 * _214;
    int _368 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _370 = _368 != 0;
    float _372 = _222 * _216;
    float _374 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _376 = _366 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _384 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _386 = -_376;
    float _388 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _386);
    float _390 = fma(_126, _380, _374);
    float _392 = fma(_298, 3.0, -1.0);
    float _394 = _358;
    if (_370)
    {
        float _396 = sqrt(_364);
        _394 = _396;
    }
    float _398 = _394;
    float _400 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _402 = -_124;
    float _404 = fma(_402, _382, _390);
    float _406 = fma(_124, _382, _390);
    float _408 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _410 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _412 = -_372;
    float _414 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[11].z, _388);
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _418 = fma(_126, _408, _378);
    float _420 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _422 = fma(_126, _410, _384);
    float _424 = -_122;
    float _426 = fma(_424, _416, _404);
    float _428 = -_124;
    float _430 = fma(_428, _400, _418);
    float _432 = fma(_124, _400, _418);
    float _434 = -_124;
    float _436 = fma(_434, _420, _422);
    float _438 = fma(_124, _420, _422);
    float _440 = abs(_398);
    float _442 = log2(_440);
    float _444 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _446 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _448 = fma(_122, _416, _406);
    float _450 = _122 * _126;
    float _452 = -_122;
    float _454 = fma(_452, _444, _436);
    float _456 = -_126;
    float _458 = _122 * _456;
    float _460 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _462 = -_122;
    float _464 = fma(_462, _446, _430);
    float _466 = fma(_122, _446, _432);
    float _468 = fma(_122, _444, _438);
    float _470 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _472 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _474 = fma(_460, _458, _426);
    float _476 = fma(_460, _450, _448);
    float _478 = _442 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _480 = fma(_470, _458, _464);
    float _482 = fma(_470, _450, _466);
    float _484 = fma(_472, _458, _454);
    float _486 = fma(_472, _450, _468);
    float _488 = exp2(_478);
    float _490 = -_124;
    float _492 = _126 * _490;
    float _494 = _126 * _124;
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _498 = _124 * (-3.0);
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _502 = fma(_496, _492, _480);
    float _504 = fma(_496, _494, _482);
    float _506 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _508 = _488 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _510 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _512 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = fma(_510, _492, _474);
    float _518 = fma(_510, _494, _476);
    float _520 = -_514;
    float _522 = _520 + 1.0;
    float _524 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _526 = fma(_414, -0.5, 0.5);
    float _528 = fma(_414, 0.5, 0.5);
    float _530 = abs(_522);
    float _532 = log2(_530);
    float _534 = fma(_524, _492, _484);
    float _536 = _122 * _124;
    float _538 = in.m_44.x;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = fma(_524, _494, _486);
    float _546 = fma(_528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _548 = fma(_506, _536, _518);
    float _550 = fma(_506, _536, _516);
    float _552 = sqrt(_526);
    float _554 = -_124;
    float _556 = fma(_554, _498, -1.0);
    float _558 = fma(_528, _546, -0.212114393711090087890625);
    float _560 = in.m_44.y;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _568 = fma(_500, _536, _544);
    float _570 = fma(_528, _558, 1.570728778839111328125);
    float _572 = _532 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _574 = fma(_566, _536, _502);
    float _576 = fma(_566, _536, _504);
    float _578 = fma(_500, _536, _534);
    float _580 = exp2(_572);
    float _582 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _584 = _552 * 0.636619746685028076171875;
    float _586 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _588 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _590 = fma(_582, _556, _574);
    float _592 = -_570;
    float _594 = fma(_584, _592, 1.0);
    float _596 = _224 + 1.0;
    float _598 = fma(_586, _556, _550);
    float _600 = fma(_588, _556, _578);
    float _602 = fma(_586, _392, _548);
    float _604 = _102 * _542;
    float _606 = -_224;
    float _608 = fma(_580, _596, _606);
    float _610 = fma(_224, -0.5, 0.5);
    float _612 = fma(_608, 0.5, 0.5);
    float _614 = _102 * _564;
    float _616 = float(uint(_352));
    float _618 = _616 * 0.00390625;
    float2 _2406 = float2(_344, _346);
    float4 _621 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2406, float2(0.0), isnan(_2406)), level(_618)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2406, float2(0.0), isnan(_2406)), level(_618)).xyzw;
    float _623 = _621.x;
    float _625 = _621.y;
    float _627 = _621.z;
    float _629 = _621.w;
    float2 _2425 = float2(_344, _346);
    float2 _633 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2425, float2(0.0), isnan(_2425)), level(_618)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2425, float2(0.0), isnan(_2425)), level(_618)).xy;
    float _635 = _633.x;
    float _637 = _633.y;
    float2 _2438 = float2(_604, _614);
    float3 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2438, float2(0.0), isnan(_2438))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2438, float2(0.0), isnan(_2438))).xyz;
    float _643 = _641.x;
    float _645 = _641.y;
    float _647 = _641.z;
    float2 _2452 = float2(_344, _346);
    float2 _649 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2452, float2(0.0), isnan(_2452)), level(_618)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2452, float2(0.0), isnan(_2452)), level(_618)).xy;
    float _651 = _649.x;
    float _653 = _649.y;
    float2 _2465 = float2(_344, _346);
    float4 _655 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2465, float2(0.0), isnan(_2465)), level(_618)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2465, float2(0.0), isnan(_2465)), level(_618)).xyzw;
    float _657 = _655.x;
    float _659 = _655.y;
    float _661 = _655.z;
    float _663 = _655.w;
    float2 _2482 = float2(_594, _610);
    float3 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2482, float2(0.0), isnan(_2482))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2482, float2(0.0), isnan(_2482))).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float2 _2496 = float2(_594, _612);
    float3 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2496, float2(0.0), isnan(_2496))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2496, float2(0.0), isnan(_2496))).xyz;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    float _681 = fma(_588, _392, _568);
    float _683 = _122 * _122;
    float _685 = fma(_582, _392, _576);
    int _687 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _689 = _687 != 0;
    float _691 = -_126;
    float _693 = fma(_691, _126, _683);
    float _695 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    int _697 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _699 = _697 != 0;
    float _701 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _703 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _705 = fma(_695, _693, _598);
    float _707 = fma(_695, _693, _602);
    float _709 = fma(_701, _693, _590);
    float _711 = fma(_701, _693, _685);
    float _713 = fma(_703, _693, _600);
    float _715 = fma(_703, _693, _681);
    float _717 = _629 * _629;
    float _719 = _635 * _637;
    float _721 = _643 * _645;
    float _723 = -_637;
    float _725 = _723 + _653;
    float _727 = _717 * _717;
    float _729 = _663 * _663;
    float _731 = _727 * 16.0;
    float _733 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _735 = _733 + 1.0;
    float _737 = _729 * _729;
    float _739 = _731 * _637;
    float _741 = fma(_643, _725, _637);
    float _743 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _745 = _743 + 1.0;
    float _747 = -_721;
    float _749 = _747 + 1.0;
    float _751 = _737 * 16.0;
    float _753 = fma(_749, _745, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _755 = fma(_749, _735, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _757 = precise::max(_741, 1.52587890625e-05);
    float _759 = _627 * _739;
    float _761 = _751 * _753;
    float _763 = _651 * _755;
    float _765 = _625 * _739;
    float _767 = _623 * _739;
    float _769 = 1.0 / _757;
    float _771 = -_719;
    float _773 = fma(_653, _763, _771);
    float _775 = _653 * _761;
    float _777 = _661 * _761;
    float _779 = fma(_643, _773, _719);
    float _781 = -_767;
    float _783 = fma(_657, _775, _781);
    float _785 = -_765;
    float _787 = fma(_659, _775, _785);
    float _789 = -_759;
    float _791 = fma(_653, _777, _789);
    float _793 = fma(_643, _783, _767);
    float _795 = fma(_643, _787, _765);
    float _797 = fma(_643, _791, _759);
    float _799 = _779 * _769;
    bool _801 = !_689;
    float _803 = _801 ? _799 : 0.0;
    bool _805 = !_699;
    int _807 = as_type<int>(_715);
    int _809 = _699 ? (-1) : 0;
    float _811 = _803;
    int _825;
    int _827;
    int _829;
    int _831;
    int _833;
    int _835;
    if (!_805)
    {
        float _813 = _426 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _815 = _464 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _817 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _819 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _821 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _823 = _468 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _825 = as_type<int>(_821);
        _827 = as_type<int>(_819);
        _829 = as_type<int>(_823);
        _831 = as_type<int>(_815);
        _833 = as_type<int>(_813);
        _835 = as_type<int>(_817);
        _837 = true;
    }
    else
    {
        int _839 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _841 = _839 != 0;
        float _843 = _705 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _845 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _847 = _713 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _849 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _851 = _715 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _853 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _855 = as_type<int>(_843);
        int _857 = as_type<int>(_845);
        int _859 = as_type<int>(_847);
        int _861 = as_type<int>(_853);
        _809 = _841 ? (-1) : 0;
        _829 = as_type<int>(_851);
        if (_841)
        {
            float _863 = _374 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _855 = as_type<int>(_863);
        }
        int _865 = _855;
        _833 = _865;
        if (_841)
        {
            float _867 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _857 = as_type<int>(_867);
        }
        int _869 = _857;
        _831 = _869;
        if (_841)
        {
            float _871 = _384 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _859 = as_type<int>(_871);
        }
        int _873 = _859;
        _835 = _873;
        if (!_841)
        {
            _807 = as_type<int>(_849);
        }
        int _875 = _807;
        int _877 = _875;
        if (_841)
        {
            _877 = _865;
        }
        int _879 = _877;
        _827 = _879;
        if (_841)
        {
            _861 = _869;
        }
        int _881 = _861;
        _825 = _881;
        if (_841)
        {
            _829 = _873;
        }
    }
    _837 = false;
    int _883 = _809;
    int _885 = _825;
    int _887 = _827;
    int _889 = _829;
    int _891 = _831;
    int _893 = _833;
    int _895 = _835;
    int _897 = 0;
    int _899 = _883;
    if (!_94)
    {
        int _901 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _903 = _901 != 0;
        _897 = _903 ? (-1) : 0;
    }
    int _905 = _897;
    float _907 = _532 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_94)
    {
        _899 = -1;
    }
    int _909 = _899;
    float _911 = _803 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _913 = _909;
    if (!_94)
    {
        int _915 = ~_905;
        bool _917 = !_98;
        int _919 = _915 & (_917 ? (-1) : 0);
        _913 = _919;
    }
    int _921 = _913;
    float _923 = _803 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _925 = _100 != 0;
    float _927 = exp2(_907);
    float _929 = _797 * _769;
    float _931 = -_647;
    float _933 = _931 + 1.0;
    float _935 = _741 * _933;
    float _937 = _935 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    int _939 = _921;
    float _941 = _935;
    if (_90)
    {
        _939 = -1;
    }
    int _943 = _939;
    int _945 = ~_921;
    float _947 = (_945 != 0) ? as_type<float>(_885) : 0.0;
    int _949 = _943;
    if (!_90)
    {
        bool _951 = !_98;
        bool _953 = _951 && _86;
        bool _955 = !_925;
        bool _957 = _953 && _955;
        _949 = _957 ? (-1) : 0;
    }
    int _959 = _949;
    float _961 = -_927;
    float _963 = _961 + 1.0;
    int _965 = ~_921;
    float _967 = (_965 != 0) ? as_type<float>(_887) : 0.0;
    int _969 = ~_921;
    float _971 = (_969 != 0) ? as_type<float>(_889) : 0.0;
    float _973 = _963 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _975 = !_98;
    bool _977 = _86 && _975;
    int _979 = ~_959;
    float _981 = (_979 != 0) ? as_type<float>(_891) : 0.0;
    int _983 = ~_959;
    float _985 = (_983 != 0) ? as_type<float>(_893) : 0.0;
    int _987 = ~_959;
    float _989 = (_987 != 0) ? as_type<float>(_895) : 0.0;
    int _991 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _993 = _991 != 0;
    bool _995 = !_977;
    float _997 = _995 ? _911 : 0.0;
    float _999 = -_973;
    float _1001 = _999 + 1.0;
    bool _1003 = !_977;
    float _1005 = _1003 ? _923 : 0.0;
    bool _1007 = !_993;
    float _1009 = abs(_1001);
    float _1011 = log2(_1009);
    bool _1013 = !_993;
    float _1015 = _1005 * _947;
    bool _1017 = !_1007;
    float _1019 = _1017 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1021 = _1005 * _967;
    bool _1023 = !_993;
    float _1025 = _1005 * _971;
    bool _1027 = !_1013;
    float _1029 = _1027 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1031 = fma(_981, _997, _1015);
    float _1033 = fma(_985, _997, _1021);
    bool _1035 = !_1023;
    float _1037 = _1035 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1039 = fma(_989, _997, _1025);
    float _1041 = _1029 * _1031;
    float _1043 = _1019 * _1033;
    int _1045 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1047 = _1045 != 0;
    float _1049 = _1037 * _1039;
    float _1051 = _1011 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1053 = _1041 * 0.715200006961822509765625;
    float _1055 = _793 * _769;
    float _1057 = _795 * _769;
    float _1059 = _1011 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1061 = fma(_1043, 0.2125999927520751953125, _1053);
    float _1063 = exp2(_1051);
    float _1065 = _721 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1067 = fma(_1049, 0.072200000286102294921875, _1061);
    bool _1069 = !_1047;
    bool _1071 = !_1047;
    float _1073 = -_1043;
    float _1075 = _1073 + _1067;
    float _1077 = -_1041;
    float _1079 = _1077 + _1067;
    float _1081 = exp2(_1059);
    float _1083 = _1071 ? _929 : 0.0;
    float _1085 = fma(_1065, _1075, _1043);
    float _1087 = fma(_1065, _1079, _1041);
    float _1089 = _1069 ? _1055 : 0.0;
    float _1091 = -_1049;
    float _1093 = _1091 + _1067;
    bool _1095 = !_82;
    float _1097 = _1095 ? _1063 : 1.0;
    float _1099 = fma(_1065, _1093, _1049);
    float _1101 = _803 * _1097;
    float _1103 = _1097 * _1087;
    float _1105 = _1097 * _1085;
    bool _1107 = !_1047;
    float _1109 = _86 ? _1101 : _1103;
    float _1111 = _86 ? _1101 : _1105;
    float _1113 = _1101;
    float _1115 = _1097;
    if (!_86)
    {
        float _1117 = _1097 * _1099;
        _1113 = _1117;
    }
    float _1119 = _1113;
    if (_82)
    {
        _1115 = 0.0;
    }
    float _1121 = _1115;
    float _1123 = _1111 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1125 = _1107 ? _1057 : 0.0;
    float _1127 = _1119 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    bool _1129 = !_82;
    float _1131 = _1129 ? _1081 : 1.0;
    float _1133 = _1131 * _1089;
    float _1135 = _1131 * _1125;
    float _1137 = _1131 * _1083;
    float _1139 = _1109 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1141 = fma(_1133, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1123);
    float _1143 = fma(_1137, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1127);
    float _1145 = fma(_1135, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1139);
    float _1147 = _1123;
    int _1149 = as_type<int>(_1133);
    float _1151 = _1137;
    float _1153 = _1127;
    float _1155 = _1121;
    if (_82)
    {
        _811 = 0.0;
    }
    float _1157 = _811;
    float _1159 = _1157;
    if (_82)
    {
        _1147 = 0.0;
    }
    float _1161 = _1147;
    float _1163 = _1161;
    if (_82)
    {
        _1149 = as_type<int>(_937);
    }
    int _1165 = _1149;
    bool _1167 = !_82;
    float _1169 = _1167 ? _973 : 0.0;
    int _1171 = _1165;
    int _1173 = _1165;
    if (_82)
    {
        _1151 = _1141;
    }
    float _1175 = _1151;
    float _1177 = _1175;
    float _1179 = _1175;
    if (_82)
    {
        _1153 = _1145;
    }
    float _1181 = _1153;
    float _1183 = _1181;
    float _1185 = _1181;
    if (_82)
    {
        _941 = _1143;
    }
    float _1187 = _941;
    float _1189 = _1187;
    float _1191 = _1187;
    if (!_82)
    {
        int _1193 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1195 = _1193 != 0;
        float _1197 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1199 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1201 = _1199 != 0;
        float _1203 = _675 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1205 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1207 = !_1201;
        float _1209 = _1207 ? _1203 : 0.0;
        bool _1211 = !_1201;
        float _1213 = _1211 ? _1197 : 0.0;
        bool _1215 = !_1201;
        float _1217 = _1215 ? _1205 : 0.0;
        float _1219 = _1169 * _1209;
        _1155 = _1219;
        if (!_1195)
        {
            _1171 = as_type<int>(_937);
        }
        int _1221 = _1171;
        float _1223 = _1169 * _1213;
        _1159 = _1223;
        _1173 = _1221;
        if (!_1195)
        {
            _1177 = _1141;
        }
        float _1225 = _1177;
        float _1227 = _1169 * _1217;
        _1179 = _1225;
        _1163 = _1227;
        if (!_1195)
        {
            _1183 = _1145;
        }
        float _1229 = _1183;
        _1185 = _1229;
        if (!_1195)
        {
            _1189 = _1143;
        }
        float _1231 = _1189;
        bool _1233 = !_1195;
        _1191 = _1231;
        if (!_1233)
        {
            float _1235 = -_1169;
            float _1237 = _1235 + 1.0;
            float _1239 = precise::clamp(_1237, 0.0, 1.0);
            float _1241 = _1239 * _937;
            float _1243 = precise::max(_1241, 9.9999997473787516355514526367188e-05);
            float _1245 = 1.0 / _1243;
            float _1247 = _1245 * _937;
            float _1249 = _1141 * _1247;
            float _1251 = _1145 * _1247;
            float _1253 = _1143 * _1247;
            _1185 = _1251;
            _1159 = 0.0;
            _1179 = _1249;
            _1155 = 0.0;
            _1173 = as_type<int>(_1241);
            _1191 = _1253;
            _1163 = 0.0;
        }
    }
    float _1255 = _1185;
    float _1257 = _1159;
    float _1259 = _1179;
    float _1261 = _1155;
    int _1263 = _1173;
    float _1265 = _1191;
    float _1267 = _1163;
    int _1269 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1275 = _1273 != 0;
    float _1277 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1279 = _1255 + _1257;
    float _1281 = _667 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1283 = _1259 + _1261;
    bool _1285 = !_1275;
    float _1287 = _1285 ? as_type<float>(_1263) : 1.0;
    float _1289 = _1265 + _1267;
    float _1291 = -_1287;
    float _1293 = _1291 + 1.0;
    float _1295 = abs(_1293);
    float _1297 = log2(_1295);
    float _1299 = _1297 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1301 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1303 = exp2(_1299);
    float _1305 = -_1303;
    float _1307 = spvFAdd(_1305, 1.00010001659393310546875);
    float _1309 = -_1303;
    float _1311 = _1309 + 1.0;
    float _1313 = -_1287;
    float _1315 = _1313 + _1311;
    float _1317 = 1.0 / _1307;
    float _1319 = _1277 * _1315;
    float _1321 = _1281 * _1315;
    float _1323 = _1301 * _1315;
    float _1325 = fma(_1279, _1287, _1319);
    float _1327 = fma(_1283, _1287, _1321);
    float _1329 = fma(_1289, _1287, _1323);
    float _1331 = _1317 * _1325;
    float _1333 = _1317 * _1327;
    float _1335 = _1317 * _1329;
    float _1337 = _1331 * 0.715200006961822509765625;
    float _1339 = fma(_1333, 0.2125999927520751953125, _1337);
    float _1341 = fma(_1335, 0.072200000286102294921875, _1339);
    float _1343 = 1.0 / _1341;
    float _1345 = _1343 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1347 = precise::clamp(_1345, 0.0, 1.0);
    float _1349 = fma(_1347, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1351 = _1333 * _1349;
    float _1353 = _1331 * _1349;
    float _1355 = _1335 * _1349;
    bool _1357 = !_1271;
    float _1359 = _1353;
    float _1361 = _1355;
    float _1363 = _1311;
    float _1365 = _1353;
    float _1367 = _1355;
    float _1369 = _1311;
    if (!_1357)
    {
        bool _1371 = _1311 != 1.0;
        bool _1373 = isnan(_1311);
        bool _1375 = _1371 || _1373;
        bool _1377 = isnan(1.0);
        bool _1379 = _1375 || _1377;
        float _1381 = -_1303;
        bool _1383 = _1381 != (-1.0);
        bool _1385 = isnan(_1381);
        bool _1387 = _1383 || _1385;
        bool _1389 = isnan(-1.0);
        bool _1391 = _1387 || _1389;
        float _1393 = -_1303;
        bool _1395 = _1393 == (-1.0);
        bool _1397 = !_1379;
        bool _1399 = _1395 || _1397;
        bool _1401 = _1311 == 1.0;
        bool _1403 = _1401 && _1391;
        bool _1405 = !_1399;
        float _1407 = _1405 ? _1311 : 0.0;
        bool _1409 = !_1403;
        float _1411 = _1409 ? 0.0 : 1.0;
        float _1413 = _1399 ? 0.0 : 0.5;
        float _1415 = _1407 * 0.715200006961822509765625;
        float _1417 = fma(_1411, 0.2125999927520751953125, _1415);
        float _1419 = fma(_1413, 0.072200000286102294921875, _1417);
        float _1421 = 1.0 / _1419;
        float _1423 = _1421 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1425 = precise::clamp(_1423, 0.0, 1.0);
        float _1427 = fma(_1425, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1429 = _1411 * _1427;
        float _1431 = _1407 * _1427;
        float _1433 = _1413 * _1427;
        out.m_42.x = _1429;
        out.m_42.y = _1431;
        out.m_42.z = _1433;
        out.m_42.w = 1.0;
        return out;
    }
    bool _1435 = _100 != 0;
    bool _1437 = !_1435;
    if (!_1437)
    {
        if (_90)
        {
            _1359 = 0.0;
        }
        float _1439 = _1359;
        float _1441 = _1439;
        if (_90)
        {
            _1361 = 0.0;
        }
        float _1443 = _1361;
        float _1445 = _1443;
        if (!_90)
        {
            float _1447 = _981 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1445 = _1447;
        }
        float _1449 = _1445;
        float _1451 = _1449;
        if (!_90)
        {
            float _1453 = _985 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1441 = _1453;
        }
        float _1455 = _1441;
        float _1457 = _1455;
        if (!_94)
        {
            float _1459 = fma(_947, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1449);
            _1451 = _1459;
        }
        float _1461 = _1451;
        if (_90)
        {
            _1363 = 0.0;
        }
        float _1463 = _1363;
        float _1465 = _1463;
        if (!_90)
        {
            float _1467 = _989 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1465 = _1467;
        }
        float _1469 = _1465;
        float _1471 = _1461 * 0.715200006961822509765625;
        float _1473 = _1469;
        if (!_94)
        {
            float _1475 = fma(_967, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1455);
            _1457 = _1475;
        }
        float _1477 = _1457;
        if (!_94)
        {
            float _1479 = fma(_971, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1469);
            _1473 = _1479;
        }
        float _1481 = _1473;
        float _1483 = fma(_1477, 0.2125999927520751953125, _1471);
        float _1485 = fma(_1481, 0.072200000286102294921875, _1483);
        float _1487 = 1.0 / _1485;
        float _1489 = _1487 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1491 = precise::clamp(_1489, 0.0, 1.0);
        float _1493 = fma(_1491, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1495 = _1493 * _1477;
        float _1497 = _1493 * _1461;
        float _1499 = _1493 * _1481;
        out.m_42.x = _1495;
        out.m_42.y = _1497;
        out.m_42.z = _1499;
        out.m_42.w = 1.0;
        return out;
    }
    if (!_98)
    {
        out.m_42.x = _1351;
        out.m_42.y = _1353;
        out.m_42.z = _1355;
        out.m_42.w = _1311;
        return out;
    }
    if (_90)
    {
        _1365 = 0.0;
    }
    float _1501 = _1365;
    float _1503 = _1501;
    if (_90)
    {
        _1367 = 0.0;
    }
    float _1505 = _1367;
    float _1507 = _1505;
    if (!_90)
    {
        float _1509 = _981 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1507 = _1509;
    }
    float _1511 = _1507;
    float _1513 = _1511;
    if (!_90)
    {
        float _1515 = _985 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1503 = _1515;
    }
    float _1517 = _1503;
    float _1519 = _1517;
    if (!_94)
    {
        float _1521 = fma(_947, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1511);
        _1513 = _1521;
    }
    float _1523 = _1513;
    if (_90)
    {
        _1369 = 0.0;
    }
    float _1525 = _1369;
    float _1527 = _1525;
    if (!_90)
    {
        float _1529 = _989 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1527 = _1529;
    }
    float _1531 = _1527;
    float _1533 = _1523 * 0.715200006961822509765625;
    float _1535 = _1531;
    if (!_94)
    {
        float _1537 = fma(_967, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1517);
        _1519 = _1537;
    }
    float _1539 = _1519;
    if (!_94)
    {
        float _1541 = fma(_971, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1531);
        _1535 = _1541;
    }
    float _1543 = _1535;
    float _1545 = fma(_1539, 0.2125999927520751953125, _1533);
    float _1547 = fma(_1543, 0.072200000286102294921875, _1545);
    float _1549 = 1.0 / _1547;
    float _1551 = _1549 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = fma(_1553, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1557 = _1555 * _1539;
    float _1559 = _1555 * _1523;
    float _1561 = _1555 * _1543;
    out.m_42.x = _1557;
    out.m_42.y = _1559;
    out.m_42.z = _1561;
    out.m_42.w = 1.0;
    return out;
}

