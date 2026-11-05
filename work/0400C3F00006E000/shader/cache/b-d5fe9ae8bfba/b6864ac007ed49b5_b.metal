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
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
};

static inline __attribute__((always_inline))
void _46(thread const int& _3892, thread const int& _3893, thread const int& _3894, thread const int& _3895, thread int& _3896, thread int& _3897, thread int& _3898, thread int& _3899, thread int& _3900)
{
    float _3903 = as_type<float>(_3894) + 0.0;
    bool _3905 = _3903 != 0.0;
    bool _3907 = isnan(_3903);
    bool _3909 = _3905 || _3907;
    bool _3911 = isnan(0.0);
    bool _3913 = _3909 || _3911;
    int _3915 = as_type<int>(_3903);
    int _3917 = _3893;
    int _3919 = _3913 ? (-1) : 0;
    if (!_3913)
    {
        float _3921 = as_type<float>(_3894) * 1.0;
        _3915 = as_type<int>(_3921);
    }
    int _3923 = _3915;
    bool _3925 = !_3913;
    int _3927 = _3923;
    if (!_3925)
    {
        float _3929 = as_type<float>(_3894) + 0.0;
        bool _3931 = _3929 >= 0.0;
        bool _3933 = isnan(_3929);
        bool _3935 = _3931 || _3933;
        bool _3937 = isnan(0.0);
        bool _3939 = _3935 || _3937;
        int _3941 = as_type<int>(_3929);
        _3919 = _3939 ? (-1) : 0;
        if (!_3939)
        {
            _3941 = 2147483647;
        }
        int _3943 = _3941;
        bool _3945 = !_3939;
        _3927 = _3943;
        if (!_3945)
        {
            float _3947 = abs(as_type<float>(_3894));
            float _3949 = _3947 + 0.0;
            bool _3951 = _3949 > as_type<float>(0x7f800000u /* inf */);
            bool _3953 = isnan(_3949);
            bool _3955 = _3951 || _3953;
            bool _3957 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3959 = _3955 || _3957;
            int _3961 = as_type<int>(_3949);
            _3919 = _3959 ? (-1) : 0;
            if (_3959)
            {
                float _3963 = as_type<float>(_3894) + 1.0;
                _3961 = as_type<int>(_3963);
            }
            int _3965 = _3961;
            _3927 = _3965;
            if (!_3959)
            {
                float _3967 = abs(as_type<float>(_3894));
                float _3969 = _3967 + (-0.0);
                float _3971 = 0.0 + _3969;
                bool _3973 = _3971 != as_type<float>(0x7f800000u /* inf */);
                bool _3975 = isnan(_3971);
                bool _3977 = _3973 || _3975;
                bool _3979 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3981 = _3977 || _3979;
                int _3983 = as_type<int>(_3971);
                _3919 = _3981 ? (-1) : 0;
                if (!_3981)
                {
                    _3983 = _3894;
                }
                int _3985 = _3983;
                bool _3987 = !_3981;
                _3927 = _3985;
                if (!_3987)
                {
                    float _3989 = as_type<float>(_3894) * 18446744073709551616.0;
                    float _3991 = rsqrt(_3989);
                    float _3993 = _3989 * _3991;
                    float _3995 = _3991 * 0.5;
                    float _3997 = -_3993;
                    float _3999 = 0.0 + _3997;
                    float _4001 = fma(_3995, _3999, 0.5);
                    float _4003 = fma(_3993, _4001, _3993);
                    float _4005 = -_4003;
                    float _4007 = 0.0 + _4005;
                    float _4009 = fma(_4003, _4007, _3989);
                    float _4011 = fma(_3995, _4009, _4003);
                    float _4013 = _4011 * 2.3283064365386962890625e-10;
                    _3927 = as_type<int>(_4013);
                    _3917 = as_type<int>(_4003);
                }
            }
        }
    }
    int _4015 = _3927;
    int _4017 = _3917;
    int _4019 = _3919;
    _3896 = _4015;
    _3897 = _3895;
    _3898 = 0;
    _3899 = _4017;
    _3900 = _4019;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _779 = false;
    bool _268 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_37.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_37.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_37.z;
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
    float _222 = _218 * _210;
    float _224 = _218 * _212;
    float _226 = -_220;
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
    float _266;
    if (!_246)
    {
        int _248 = 0;
        int _250 = 0;
        int _252 = as_type<int>(_234);
        int _254 = 1232;
        int _256;
        int _258;
        int _260;
        int _262;
        int _264;
        _46(_248, _250, _252, _254, _256, _258, _260, _262, _264);
        _266 = as_type<float>(_256);
        _268 = true;
    }
    else
    {
        float _270 = rsqrt(_234);
        float _272 = _234 * _270;
        float _274 = _270 * 0.5;
        float _276 = -_272;
        float _278 = 0.0 + _276;
        float _280 = fma(_274, _278, 0.5);
        float _282 = fma(_272, _280, _272);
        float _284 = -_282;
        float _286 = 0.0 + _284;
        float _288 = fma(_282, _286, _234);
        float _290 = fma(_274, _288, _282);
        _266 = _290;
    }
    _268 = false;
    float _292 = _266;
    bool _294 = _220 > 0.0;
    float _296 = _120 * _120;
    float _298 = _118 * _118;
    float _300 = _296 + _298;
    if (_294)
    {
        discard_fragment();
    }
    float _302 = rsqrt(_300);
    float _304 = _244 * _292;
    float _306 = _304 * 0.636619746685028076171875;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = -_308;
    float _312 = _310 + 1.0;
    float _314 = sqrt(_312);
    float _316 = _120 * _302;
    float _318 = _118 * _302;
    float _320 = abs(_316);
    float _322 = abs(_318);
    float _324 = precise::max(_320, _322);
    float _326 = precise::max(_324, 9.9999997473787516355514526367188e-05);
    float _328 = -_314;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _326;
    float _334 = _330 * 0.5;
    float _336 = -_332;
    float _338 = _316 * _336;
    float _340 = _318 * _332;
    float _342 = fma(_338, _334, 0.5);
    float _344 = fma(_340, _334, 0.5);
    if (_294)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    float2 _1963;
    _1963.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_342, _344));
    _1963.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_342, _344));
    float _346 = _1963.x;
    float _348 = _346 * 256.0;
    int _350 = int(_348);
    float _352 = -_122;
    float _354 = _352 + 1.0;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = -_122;
    float _360 = fma(_358, _122, 1.0);
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_122;
    float _366 = fma(_364, _122, _298);
    int _368 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _370 = _368 != 0;
    float _372 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _374 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _376 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _382 = fma(_122, _378, _372);
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _386 = _356;
    if (_370)
    {
        float _388 = sqrt(_362);
        _386 = _388;
    }
    float _390 = _386;
    int _392 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _394 = _392 != 0;
    float _396 = fma(_296, 3.0, -1.0);
    float _398 = -_120;
    float _400 = fma(_398, _384, _382);
    float _402 = fma(_120, _384, _382);
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _408 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _410 = fma(_122, _404, _374);
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _414 = fma(_122, _408, _376);
    float _416 = -_120;
    float _418 = fma(_416, _406, _410);
    float _420 = fma(_120, _406, _410);
    float _422 = abs(_390);
    float _424 = log2(_422);
    float _426 = -_120;
    float _428 = fma(_426, _412, _414);
    float _430 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _432 = fma(_120, _412, _414);
    float _434 = _120 * (-3.0);
    float _436 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _438 = -_118;
    float _440 = fma(_438, _430, _400);
    float _442 = fma(_118, _430, _402);
    float _444 = -_118;
    float _446 = fma(_444, _380, _418);
    float _448 = fma(_118, _380, _420);
    float _450 = _118 * _120;
    float _452 = -_120;
    float _454 = _122 * _452;
    float _456 = -_120;
    float _458 = fma(_456, _434, -1.0);
    float _460 = _122 * _120;
    float _462 = -_122;
    float _464 = _118 * _462;
    float _466 = _424 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _468 = _118 * _122;
    float _470 = -_118;
    float _472 = fma(_470, _436, _428);
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _476 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _478 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _480 = exp2(_466);
    float _482 = fma(_118, _436, _432);
    float _484 = fma(_474, _464, _446);
    float _486 = fma(_476, _464, _472);
    float _488 = fma(_478, _468, _442);
    float _490 = fma(_474, _468, _448);
    float _492 = fma(_476, _468, _482);
    float _494 = fma(_478, _464, _440);
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _500 = fma(_496, _454, _494);
    float _502 = fma(_498, _460, _490);
    float _504 = _222 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _506 = _480 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _508 = fma(_496, _460, _488);
    float _510 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _512 = fma(_498, _454, _484);
    float _514 = fma(_506, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _516 = precise::clamp(_514, 0.0, 1.0);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _520 = fma(_510, _460, _492);
    float _522 = fma(_510, _454, _486);
    float _524 = -_516;
    float _526 = _524 + 1.0;
    float _528 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _530 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _532 = fma(_518, _450, _502);
    float _534 = -_504;
    float _536 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[11].y, _534);
    float _538 = abs(_526);
    float _540 = log2(_538);
    float _542 = fma(_528, _450, _500);
    float _544 = fma(_528, _450, _508);
    float _546 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _548 = fma(_518, _450, _512);
    float _550 = fma(_530, _450, _522);
    float _552 = fma(_530, _450, _520);
    float _554 = fma(_546, _458, _542);
    float _556 = fma(_546, _396, _544);
    float _558 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _560 = -_224;
    float _562 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[11].z, _536);
    float _564 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _566 = fma(_558, _458, _548);
    float _568 = fma(_562, -0.5, 0.5);
    float _570 = fma(_558, _396, _532);
    float _572 = _540 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _574 = fma(_564, _396, _552);
    float _576 = fma(_564, _458, _550);
    float _578 = sqrt(_568);
    float _580 = fma(_562, 0.5, 0.5);
    float _582 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _584 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _586 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _588 = fma(_580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _590 = fma(_582, _366, _554);
    float _592 = exp2(_572);
    float _594 = fma(_582, _366, _556);
    float _596 = fma(_580, _588, -0.212114393711090087890625);
    float _598 = _220 + 1.0;
    float _600 = fma(_220, -0.5, 0.5);
    float _602 = fma(_584, _366, _566);
    float _604 = fma(_580, _596, 1.570728778839111328125);
    float _606 = fma(_584, _366, _570);
    float _608 = _578 * 0.636619746685028076171875;
    float _610 = fma(_586, _366, _576);
    float _612 = fma(_586, _366, _574);
    float _614 = -_604;
    float _616 = fma(_608, _614, 1.0);
    float _618 = -_220;
    float _620 = fma(_592, _598, _618);
    float _622 = fma(_620, 0.5, 0.5);
    float _624 = float(uint(_350));
    float _626 = _624 * 0.00390625;
    float2 _2424 = float2(_342, _344);
    float4 _629 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2424, float2(0.0), isnan(_2424)), level(_626)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2424, float2(0.0), isnan(_2424)), level(_626)).xyzw;
    float _631 = _629.x;
    float _633 = _629.y;
    float _635 = _629.z;
    float _637 = _629.w;
    float2 _2443 = float2(_342, _344);
    float2 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2443, float2(0.0), isnan(_2443)), level(_626)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2443, float2(0.0), isnan(_2443)), level(_626)).xy;
    float _643 = _641.x;
    float _645 = _641.y;
    float2 _2456 = float2(_342, _344);
    float2 _647 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2456, float2(0.0), isnan(_2456)), level(_626)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2456, float2(0.0), isnan(_2456)), level(_626)).xy;
    float _649 = _647.x;
    float _651 = _647.y;
    float2 _2469 = float2(_342, _344);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2469, float2(0.0), isnan(_2469)), level(_626)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2469, float2(0.0), isnan(_2469)), level(_626)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2486 = float2(_616, _600);
    float3 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2486, float2(0.0), isnan(_2486))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2486, float2(0.0), isnan(_2486))).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float2 _2500 = float2(_616, _622);
    float3 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2500, float2(0.0), isnan(_2500))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2500, float2(0.0), isnan(_2500))).xyz;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    int _681 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _683 = _681 != 0;
    float _685 = _637 * _637;
    float _687 = _661 * _661;
    float _689 = _685 * _685;
    float _691 = _687 * _687;
    float _693 = _689 * 16.0;
    float _695 = _693 * _645;
    float _697 = _631 * _695;
    float _699 = -_645;
    float _701 = _699 + _651;
    float _703 = _633 * _695;
    float _705 = _635 * _695;
    float _707 = fma(_701, (*spvDescriptorSet0.fp_c3)._m0[0].x, _645);
    float _709 = _643 * _645;
    float _711 = precise::max(_707, 1.52587890625e-05);
    float _713 = -_709;
    float _715 = fma(_649, _651, _713);
    float _717 = _691 * 16.0;
    float _719 = fma(_715, (*spvDescriptorSet0.fp_c3)._m0[0].x, _709);
    float _721 = 1.0 / _711;
    float _723 = _717 * _651;
    float _725 = -_697;
    float _727 = fma(_655, _723, _725);
    float _729 = -_703;
    float _731 = fma(_657, _723, _729);
    float _733 = -_705;
    float _735 = fma(_659, _723, _733);
    float _737 = fma(_727, (*spvDescriptorSet0.fp_c3)._m0[0].x, _697);
    float _739 = _719 * _721;
    float _741 = fma(_731, (*spvDescriptorSet0.fp_c3)._m0[0].x, _703);
    float _743 = fma(_735, (*spvDescriptorSet0.fp_c3)._m0[0].x, _705);
    float _745 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _747 = !_394;
    float _749 = _747 ? _739 : 0.0;
    bool _751 = !_683;
    int _753 = _683 ? (-1) : 0;
    int _767;
    int _769;
    int _771;
    int _773;
    int _775;
    int _777;
    if (!_751)
    {
        float _755 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _757 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _759 = _472 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _761 = _442 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _763 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _765 = _482 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _767 = as_type<int>(_761);
        _769 = as_type<int>(_765);
        _771 = as_type<int>(_755);
        _773 = as_type<int>(_757);
        _775 = as_type<int>(_759);
        _777 = as_type<int>(_763);
        _779 = true;
    }
    else
    {
        int _781 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _783 = _781 != 0;
        float _785 = _602 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _787 = _610 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _789 = _590 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _791 = _606 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _793 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _795 = _594 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _797 = _612 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _799 = as_type<int>(_785);
        int _801 = as_type<int>(_787);
        int _803 = as_type<int>(_789);
        int _805 = as_type<int>(_791);
        int _807 = as_type<int>(_795);
        _753 = _783 ? (-1) : 0;
        _769 = as_type<int>(_797);
        if (_783)
        {
            float _809 = _374 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _799 = as_type<int>(_809);
        }
        int _811 = _799;
        _773 = _811;
        if (_783)
        {
            float _813 = _376 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _801 = as_type<int>(_813);
        }
        int _815 = _801;
        _775 = _815;
        if (_783)
        {
            float _817 = _793 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _803 = as_type<int>(_817);
        }
        int _819 = _803;
        _771 = _819;
        if (_783)
        {
            _805 = _811;
        }
        int _821 = _805;
        _777 = _821;
        if (_783)
        {
            _807 = _819;
        }
        int _823 = _807;
        _767 = _823;
        if (_783)
        {
            _769 = _815;
        }
    }
    _779 = false;
    int _825 = _753;
    int _827 = _767;
    int _829 = _769;
    int _831 = _771;
    int _833 = _773;
    int _835 = _775;
    int _837 = _777;
    float _839 = _540 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    int _841 = 0;
    int _843 = _825;
    if (!_90)
    {
        int _845 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _847 = _845 != 0;
        _841 = _847 ? (-1) : 0;
    }
    int _849 = _841;
    float _851 = _737 * _721;
    if (_90)
    {
        _843 = -1;
    }
    int _853 = _843;
    float _855 = _741 * _721;
    int _857 = _853;
    if (!_90)
    {
        int _859 = ~_849;
        bool _861 = !_94;
        int _863 = _859 & (_861 ? (-1) : 0);
        _857 = _863;
    }
    int _865 = _857;
    float _867 = exp2(_839);
    bool _869 = _96 != 0;
    float _871 = _743 * _721;
    float _873 = _749 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _875 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _877 = _220 * _875;
    float _879 = _749 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _881 = _220 * (-10000.0);
    float _883 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[26].x, _877);
    int _885 = _865;
    if (_86)
    {
        _885 = -1;
    }
    int _887 = _885;
    float _889 = -_867;
    float _891 = _889 + 1.0;
    int _893 = _887;
    if (!_86)
    {
        bool _895 = !_94;
        bool _897 = _895 && _82;
        bool _899 = !_869;
        bool _901 = _897 && _899;
        _893 = _901 ? (-1) : 0;
    }
    int _903 = _893;
    int _905 = ~_865;
    float _907 = (_905 != 0) ? as_type<float>(_827) : 0.0;
    float _909 = _891 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _911 = ~_865;
    float _913 = (_911 != 0) ? as_type<float>(_829) : 0.0;
    float _915 = -_909;
    float _917 = _915 + 1.0;
    float _919 = abs(_917);
    float _921 = log2(_919);
    bool _923 = !_94;
    bool _925 = _82 && _923;
    int _927 = ~_903;
    float _929 = (_927 != 0) ? as_type<float>(_831) : 0.0;
    int _931 = ~_903;
    float _933 = (_931 != 0) ? as_type<float>(_833) : 0.0;
    int _935 = ~_903;
    float _937 = (_935 != 0) ? as_type<float>(_835) : 0.0;
    int _939 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _941 = _939 != 0;
    bool _943 = !_925;
    float _945 = _943 ? _879 : 0.0;
    float _947 = _921 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _949 = !_925;
    float _951 = _949 ? _873 : 0.0;
    int _953 = ~_865;
    float _955 = (_953 != 0) ? as_type<float>(_837) : 0.0;
    bool _957 = !_941;
    float _959 = exp2(_947);
    bool _961 = !_941;
    float _963 = _951 * _907;
    float _965 = _951 * _955;
    float _967 = _951 * _913;
    bool _969 = !_957;
    float _971 = _969 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _973 = _921 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _975 = !_941;
    int _977 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _979 = _977 != 0;
    bool _981 = !_961;
    float _983 = _981 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _985 = fma(_929, _945, _963);
    float _987 = exp2(_973);
    bool _989 = !_975;
    float _991 = _989 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _993 = _971 * _985;
    bool _995 = !_979;
    float _997 = fma(_933, _945, _965);
    bool _999 = !_78;
    float _1001 = _999 ? _959 : 1.0;
    float _1003 = fma(_937, _945, _967);
    bool _1005 = !_979;
    float _1007 = _983 * _997;
    float _1009 = _995 ? _855 : 0.0;
    float _1011 = _1001 * _993;
    float _1013 = _1005 ? _871 : 0.0;
    float _1015 = _749 * _1001;
    float _1017 = _1001 * _1007;
    float _1019 = _991 * _1003;
    bool _1021 = !_979;
    int _1023 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1025 = _1023 != 0;
    bool _1027 = !_78;
    float _1029 = _1027 ? _987 : 1.0;
    float _1031 = _1029 * _1009;
    float _1033 = _1029 * _1013;
    float _1035 = _1021 ? _851 : 0.0;
    float _1037 = _82 ? _1015 : _1011;
    float _1039 = _1029 * _1035;
    float _1041 = _82 ? _1015 : _1017;
    float _1043 = _1015;
    float _1045 = _1009;
    int _1047 = as_type<int>(_1033);
    float _1049 = _1035;
    float _1051 = _909;
    if (!_82)
    {
        float _1053 = _1001 * _1019;
        _1043 = _1053;
    }
    float _1055 = _1043;
    if (_78)
    {
        _1045 = 0.0;
    }
    float _1057 = _1045;
    float _1059 = _1037 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1061 = _1055 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1063 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1059);
    float _1065 = fma(_1033, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1061);
    float _1067 = _1059;
    float _1069 = _1065;
    float _1071 = _1057;
    if (_78)
    {
        _1047 = as_type<int>(_745);
    }
    int _1073 = _1047;
    float _1075 = _1041 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1077 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1075);
    int _1079 = _1073;
    int _1081 = _1073;
    float _1083 = _1077;
    if (_78)
    {
        _1067 = 0.0;
    }
    float _1085 = _1067;
    float _1087 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _1089 = !_78;
    float _1091 = _1089 ? _909 : 0.0;
    float _1093 = _1085;
    if (_78)
    {
        _1049 = 0.0;
    }
    float _1095 = _1049;
    float _1097 = _1095;
    if (_78)
    {
        _1051 = _1063;
    }
    float _1099 = _1051;
    float _1101 = _1099;
    float _1103 = _1099;
    if (!_78)
    {
        int _1105 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1107 = _1105 != 0;
        float _1109 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1111 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1113 = _1111 != 0;
        float _1115 = _675 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1117 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1119 = !_1113;
        float _1121 = _1119 ? _1115 : 0.0;
        bool _1123 = !_1113;
        float _1125 = _1123 ? _1109 : 0.0;
        bool _1127 = !_1113;
        float _1129 = _1127 ? _1117 : 0.0;
        float _1131 = _1091 * _1121;
        _1071 = _1131;
        if (!_1107)
        {
            _1079 = as_type<int>(_745);
        }
        int _1133 = _1079;
        float _1135 = _1091 * _1125;
        _1081 = _1133;
        _1093 = _1135;
        if (!_1107)
        {
            _1101 = _1063;
        }
        float _1137 = _1101;
        float _1139 = _1091 * _1129;
        bool _1141 = !_1107;
        _1097 = _1139;
        _1103 = _1137;
        if (!_1141)
        {
            float _1143 = -_1091;
            float _1145 = _1143 + 1.0;
            float _1147 = precise::clamp(_1145, 0.0, 1.0);
            float _1149 = _745 * _1147;
            float _1151 = precise::max(_1149, 9.9999997473787516355514526367188e-05);
            float _1153 = 1.0 / _1151;
            float _1155 = _745 * _1153;
            float _1157 = _1063 * _1155;
            float _1159 = _1077 * _1155;
            float _1161 = _1065 * _1155;
            _1081 = as_type<int>(_1149);
            _1083 = _1159;
            _1093 = 0.0;
            _1069 = _1161;
            _1097 = 0.0;
            _1103 = _1157;
            _1071 = 0.0;
        }
    }
    int _1163 = _1081;
    float _1165 = _1083;
    float _1167 = _1093;
    float _1169 = _1069;
    float _1171 = _1097;
    float _1173 = _1103;
    float _1175 = _1071;
    bool _1177 = !_1025;
    float _1179 = _1177 ? as_type<float>(_1163) : 1.0;
    float _1181 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[26].z, _883);
    float _1183 = -_1087;
    float _1185 = exp2(_1183);
    float _1187 = abs(_881);
    bool _1189 = _1187 > 0.00999999977648258209228515625;
    float _1191 = -_1179;
    float _1193 = _1191 + 1.0;
    float _1195 = _1165 + _1167;
    float _1197 = fma(_1181, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1199 = _1189 ? _881 : 0.00999999977648258209228515625;
    float _1201 = _1169 + _1171;
    float _1203 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1205 = abs(_1193);
    float _1207 = log2(_1205);
    float _1209 = fma(_1197, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1211 = _1199 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    int _1213 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1215 = _1213 != 0;
    float _1217 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1219 = fma(_1217, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1221 = precise::max(_1211, -127.0);
    float _1223 = abs(_1209);
    float _1225 = log2(_1223);
    float _1227 = _1207 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1229 = -_1221;
    float _1231 = exp2(_1229);
    float _1233 = _1225 * 1.5;
    float _1235 = exp2(_1227);
    float _1237 = _1173 + _1175;
    float _1239 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1241 = -_1231;
    float _1243 = _1241 + 1.0;
    float _1245 = 1.0 / _1221;
    float _1247 = _1185 * _1243;
    float _1249 = _667 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1251 = -_1235;
    float _1253 = spvFAdd(_1251, 1.00010001659393310546875);
    float _1255 = -_1235;
    float _1257 = _1255 + 1.0;
    float _1259 = exp2(_1233);
    float _1261 = -_1179;
    float _1263 = _1261 + _1257;
    float _1265 = _1203 * _1263;
    float _1267 = 1.0 / _1253;
    float _1269 = _1249 * _1263;
    float _1271 = _1239 * _1263;
    float _1273 = fma(_1195, _1179, _1265);
    float _1275 = _1247 * _1245;
    float _1277 = fma(_1237, _1179, _1269);
    float _1279 = fma(_1201, _1179, _1271);
    float _1281 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1283 = _1259 * 12.56637096405029296875;
    float _1285 = _1275 * _1281;
    float _1287 = 1.0 / _1283;
    float _1289 = _1267 * _1273;
    float _1291 = _1267 * _1277;
    float _1293 = _1267 * _1279;
    float _1295 = _1289 * 0.715200006961822509765625;
    float _1297 = -_1285;
    float _1299 = exp2(_1297);
    float _1301 = fma(_1291, 0.2125999927520751953125, _1295);
    float _1303 = fma(_1293, 0.072200000286102294921875, _1301);
    float _1305 = _1219 * _1287;
    float _1307 = 1.0 / _1303;
    float _1309 = -_1299;
    float _1311 = _1309 + 1.0;
    float _1313 = _1311 * _1305;
    float _1315 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1317 = _1307 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1319 = precise::clamp(_1317, 0.0, 1.0);
    float _1321 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1323 = fma(_1319, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1325 = _1323 * _1299;
    float _1327 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1329 = fma(_1291, _1325, _1315);
    float _1331 = fma(_1289, _1325, _1327);
    float _1333 = fma(_1293, _1325, _1321);
    bool _1335 = !_1215;
    float _1337 = _1327;
    float _1339 = _1331;
    float _1341 = _1257;
    int _1343 = as_type<int>(_1327);
    float _1345 = _1331;
    float _1347 = _1257;
    if (!_1335)
    {
        bool _1349 = _1257 != 1.0;
        bool _1351 = isnan(_1257);
        bool _1353 = _1349 || _1351;
        bool _1355 = isnan(1.0);
        bool _1357 = _1353 || _1355;
        float _1359 = -_1235;
        bool _1361 = _1359 != (-1.0);
        bool _1363 = isnan(_1359);
        bool _1365 = _1361 || _1363;
        bool _1367 = isnan(-1.0);
        bool _1369 = _1365 || _1367;
        float _1371 = -_1235;
        bool _1373 = _1371 == (-1.0);
        bool _1375 = !_1357;
        bool _1377 = _1373 || _1375;
        bool _1379 = _1257 == 1.0;
        bool _1381 = _1379 && _1369;
        bool _1383 = !_1377;
        float _1385 = _1383 ? _1257 : 0.0;
        bool _1387 = !_1381;
        float _1389 = _1387 ? 0.0 : 1.0;
        float _1391 = _1377 ? 0.0 : 0.5;
        float _1393 = _1385 * 0.715200006961822509765625;
        float _1395 = fma(_1389, 0.2125999927520751953125, _1393);
        float _1397 = fma(_1391, 0.072200000286102294921875, _1395);
        float _1399 = 1.0 / _1397;
        float _1401 = _1399 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1403 = precise::clamp(_1401, 0.0, 1.0);
        float _1405 = fma(_1403, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1407 = _1389 * _1405;
        float _1409 = _1385 * _1405;
        float _1411 = _1391 * _1405;
        out.m_40.x = _1407;
        out.m_40.y = _1409;
        out.m_40.z = _1411;
        out.m_40.w = 1.0;
        return out;
    }
    bool _1413 = _96 != 0;
    bool _1415 = !_1413;
    if (!_1415)
    {
        if (_86)
        {
            _1337 = 0.0;
        }
        float _1417 = _1337;
        float _1419 = _1417;
        if (_86)
        {
            _1339 = 0.0;
        }
        float _1421 = _1339;
        float _1423 = _1421;
        if (!_86)
        {
            float _1425 = _933 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1423 = _1425;
        }
        float _1427 = _1423;
        float _1429 = _1427;
        if (!_86)
        {
            float _1431 = _929 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1419 = _1431;
        }
        float _1433 = _1419;
        float _1435 = _1433;
        if (!_90)
        {
            float _1437 = fma(_955, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1427);
            _1429 = _1437;
        }
        float _1439 = _1429;
        if (_86)
        {
            _1341 = 0.0;
        }
        float _1441 = _1341;
        float _1443 = _1441;
        if (!_86)
        {
            float _1445 = _937 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1443 = _1445;
        }
        float _1447 = _1443;
        float _1449 = _1447;
        if (!_90)
        {
            float _1451 = fma(_907, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1433);
            _1435 = _1451;
        }
        float _1453 = _1435;
        float _1455 = _1439 * 0.715200006961822509765625;
        if (!_90)
        {
            float _1457 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1447);
            _1449 = _1457;
        }
        float _1459 = _1449;
        float _1461 = fma(_1453, 0.2125999927520751953125, _1455);
        float _1463 = fma(_1459, 0.072200000286102294921875, _1461);
        float _1465 = 1.0 / _1463;
        float _1467 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1469 = precise::clamp(_1467, 0.0, 1.0);
        float _1471 = fma(_1469, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1473 = _1471 * _1453;
        float _1475 = _1471 * _1439;
        float _1477 = _1471 * _1459;
        out.m_40.x = _1473;
        out.m_40.y = _1475;
        out.m_40.z = _1477;
        out.m_40.w = 1.0;
        return out;
    }
    if (!_94)
    {
        _1343 = as_type<int>(_1329);
    }
    int _1479 = _1343;
    float _1481 = as_type<float>(_1479);
    if (!_94)
    {
        out.m_40.x = as_type<float>(_1479);
        out.m_40.y = _1331;
        out.m_40.z = _1333;
        out.m_40.w = _1257;
        return out;
    }
    if (_86)
    {
        _1481 = 0.0;
    }
    float _1483 = _1481;
    float _1485 = _1483;
    if (_86)
    {
        _1345 = 0.0;
    }
    float _1487 = _1345;
    float _1489 = _1487;
    if (!_86)
    {
        float _1491 = _933 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1489 = _1491;
    }
    float _1493 = _1489;
    float _1495 = _1493;
    if (!_86)
    {
        float _1497 = _929 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1485 = _1497;
    }
    float _1499 = _1485;
    float _1501 = _1499;
    if (!_90)
    {
        float _1503 = fma(_955, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1493);
        _1495 = _1503;
    }
    float _1505 = _1495;
    if (_86)
    {
        _1347 = 0.0;
    }
    float _1507 = _1347;
    float _1509 = _1507;
    if (!_86)
    {
        float _1511 = _937 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1509 = _1511;
    }
    float _1513 = _1509;
    float _1515 = _1513;
    if (!_90)
    {
        float _1517 = fma(_907, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1499);
        _1501 = _1517;
    }
    float _1519 = _1501;
    float _1521 = _1505 * 0.715200006961822509765625;
    if (!_90)
    {
        float _1523 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1513);
        _1515 = _1523;
    }
    float _1525 = _1515;
    float _1527 = fma(_1519, 0.2125999927520751953125, _1521);
    float _1529 = fma(_1525, 0.072200000286102294921875, _1527);
    float _1531 = 1.0 / _1529;
    float _1533 = _1531 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1535 = precise::clamp(_1533, 0.0, 1.0);
    float _1537 = fma(_1535, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1539 = _1537 * _1519;
    float _1541 = _1537 * _1505;
    float _1543 = _1537 * _1525;
    out.m_40.x = _1539;
    out.m_40.y = _1541;
    out.m_40.z = _1543;
    out.m_40.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _779 = false;
    bool _268 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_37.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_37.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_37.z;
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
    float _222 = _218 * _210;
    float _224 = _218 * _212;
    float _226 = -_220;
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
    float _266;
    if (!_246)
    {
        int _248 = 0;
        int _250 = 0;
        int _252 = as_type<int>(_234);
        int _254 = 1232;
        int _256;
        int _258;
        int _260;
        int _262;
        int _264;
        _46(_248, _250, _252, _254, _256, _258, _260, _262, _264);
        _266 = as_type<float>(_256);
        _268 = true;
    }
    else
    {
        float _270 = rsqrt(_234);
        float _272 = _234 * _270;
        float _274 = _270 * 0.5;
        float _276 = -_272;
        float _278 = 0.0 + _276;
        float _280 = fma(_274, _278, 0.5);
        float _282 = fma(_272, _280, _272);
        float _284 = -_282;
        float _286 = 0.0 + _284;
        float _288 = fma(_282, _286, _234);
        float _290 = fma(_274, _288, _282);
        _266 = _290;
    }
    _268 = false;
    float _292 = _266;
    bool _294 = _220 > 0.0;
    float _296 = _120 * _120;
    float _298 = _118 * _118;
    float _300 = _296 + _298;
    if (_294)
    {
        discard_fragment();
    }
    float _302 = rsqrt(_300);
    float _304 = _244 * _292;
    float _306 = _304 * 0.636619746685028076171875;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = -_308;
    float _312 = _310 + 1.0;
    float _314 = sqrt(_312);
    float _316 = _120 * _302;
    float _318 = _118 * _302;
    float _320 = abs(_316);
    float _322 = abs(_318);
    float _324 = precise::max(_320, _322);
    float _326 = precise::max(_324, 9.9999997473787516355514526367188e-05);
    float _328 = -_314;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _326;
    float _334 = _330 * 0.5;
    float _336 = -_332;
    float _338 = _316 * _336;
    float _340 = _318 * _332;
    float _342 = fma(_338, _334, 0.5);
    float _344 = fma(_340, _334, 0.5);
    if (_294)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    float2 _1963;
    _1963.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_342, _344));
    _1963.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_342, _344));
    float _346 = _1963.x;
    float _348 = _346 * 256.0;
    int _350 = int(_348);
    float _352 = -_122;
    float _354 = _352 + 1.0;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = -_122;
    float _360 = fma(_358, _122, 1.0);
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_122;
    float _366 = fma(_364, _122, _298);
    int _368 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _370 = _368 != 0;
    float _372 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _374 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _376 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _382 = fma(_122, _378, _372);
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _386 = _356;
    if (_370)
    {
        float _388 = sqrt(_362);
        _386 = _388;
    }
    float _390 = _386;
    int _392 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _394 = _392 != 0;
    float _396 = fma(_296, 3.0, -1.0);
    float _398 = -_120;
    float _400 = fma(_398, _384, _382);
    float _402 = fma(_120, _384, _382);
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _408 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _410 = fma(_122, _404, _374);
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _414 = fma(_122, _408, _376);
    float _416 = -_120;
    float _418 = fma(_416, _406, _410);
    float _420 = fma(_120, _406, _410);
    float _422 = abs(_390);
    float _424 = log2(_422);
    float _426 = -_120;
    float _428 = fma(_426, _412, _414);
    float _430 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _432 = fma(_120, _412, _414);
    float _434 = _120 * (-3.0);
    float _436 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _438 = -_118;
    float _440 = fma(_438, _430, _400);
    float _442 = fma(_118, _430, _402);
    float _444 = -_118;
    float _446 = fma(_444, _380, _418);
    float _448 = fma(_118, _380, _420);
    float _450 = _118 * _120;
    float _452 = -_120;
    float _454 = _122 * _452;
    float _456 = -_120;
    float _458 = fma(_456, _434, -1.0);
    float _460 = _122 * _120;
    float _462 = -_122;
    float _464 = _118 * _462;
    float _466 = _424 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _468 = _118 * _122;
    float _470 = -_118;
    float _472 = fma(_470, _436, _428);
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _476 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _478 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _480 = exp2(_466);
    float _482 = fma(_118, _436, _432);
    float _484 = fma(_474, _464, _446);
    float _486 = fma(_476, _464, _472);
    float _488 = fma(_478, _468, _442);
    float _490 = fma(_474, _468, _448);
    float _492 = fma(_476, _468, _482);
    float _494 = fma(_478, _464, _440);
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _500 = fma(_496, _454, _494);
    float _502 = fma(_498, _460, _490);
    float _504 = _222 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _506 = _480 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _508 = fma(_496, _460, _488);
    float _510 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _512 = fma(_498, _454, _484);
    float _514 = fma(_506, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _516 = precise::clamp(_514, 0.0, 1.0);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _520 = fma(_510, _460, _492);
    float _522 = fma(_510, _454, _486);
    float _524 = -_516;
    float _526 = _524 + 1.0;
    float _528 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _530 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _532 = fma(_518, _450, _502);
    float _534 = -_504;
    float _536 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[11].y, _534);
    float _538 = abs(_526);
    float _540 = log2(_538);
    float _542 = fma(_528, _450, _500);
    float _544 = fma(_528, _450, _508);
    float _546 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _548 = fma(_518, _450, _512);
    float _550 = fma(_530, _450, _522);
    float _552 = fma(_530, _450, _520);
    float _554 = fma(_546, _458, _542);
    float _556 = fma(_546, _396, _544);
    float _558 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _560 = -_224;
    float _562 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[11].z, _536);
    float _564 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _566 = fma(_558, _458, _548);
    float _568 = fma(_562, -0.5, 0.5);
    float _570 = fma(_558, _396, _532);
    float _572 = _540 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _574 = fma(_564, _396, _552);
    float _576 = fma(_564, _458, _550);
    float _578 = sqrt(_568);
    float _580 = fma(_562, 0.5, 0.5);
    float _582 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _584 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _586 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _588 = fma(_580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _590 = fma(_582, _366, _554);
    float _592 = exp2(_572);
    float _594 = fma(_582, _366, _556);
    float _596 = fma(_580, _588, -0.212114393711090087890625);
    float _598 = _220 + 1.0;
    float _600 = fma(_220, -0.5, 0.5);
    float _602 = fma(_584, _366, _566);
    float _604 = fma(_580, _596, 1.570728778839111328125);
    float _606 = fma(_584, _366, _570);
    float _608 = _578 * 0.636619746685028076171875;
    float _610 = fma(_586, _366, _576);
    float _612 = fma(_586, _366, _574);
    float _614 = -_604;
    float _616 = fma(_608, _614, 1.0);
    float _618 = -_220;
    float _620 = fma(_592, _598, _618);
    float _622 = fma(_620, 0.5, 0.5);
    float _624 = float(uint(_350));
    float _626 = _624 * 0.00390625;
    float2 _2424 = float2(_342, _344);
    float4 _629 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2424, float2(0.0), isnan(_2424)), level(_626)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2424, float2(0.0), isnan(_2424)), level(_626)).xyzw;
    float _631 = _629.x;
    float _633 = _629.y;
    float _635 = _629.z;
    float _637 = _629.w;
    float2 _2443 = float2(_342, _344);
    float2 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2443, float2(0.0), isnan(_2443)), level(_626)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2443, float2(0.0), isnan(_2443)), level(_626)).xy;
    float _643 = _641.x;
    float _645 = _641.y;
    float2 _2456 = float2(_342, _344);
    float2 _647 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2456, float2(0.0), isnan(_2456)), level(_626)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2456, float2(0.0), isnan(_2456)), level(_626)).xy;
    float _649 = _647.x;
    float _651 = _647.y;
    float2 _2469 = float2(_342, _344);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2469, float2(0.0), isnan(_2469)), level(_626)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2469, float2(0.0), isnan(_2469)), level(_626)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2486 = float2(_616, _600);
    float3 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2486, float2(0.0), isnan(_2486))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2486, float2(0.0), isnan(_2486))).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float2 _2500 = float2(_616, _622);
    float3 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2500, float2(0.0), isnan(_2500))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2500, float2(0.0), isnan(_2500))).xyz;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    int _681 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _683 = _681 != 0;
    float _685 = _637 * _637;
    float _687 = _661 * _661;
    float _689 = _685 * _685;
    float _691 = _687 * _687;
    float _693 = _689 * 16.0;
    float _695 = _693 * _645;
    float _697 = _631 * _695;
    float _699 = -_645;
    float _701 = _699 + _651;
    float _703 = _633 * _695;
    float _705 = _635 * _695;
    float _707 = fma(_701, (*spvDescriptorSet0.fp_c3)._m0[0].x, _645);
    float _709 = _643 * _645;
    float _711 = precise::max(_707, 1.52587890625e-05);
    float _713 = -_709;
    float _715 = fma(_649, _651, _713);
    float _717 = _691 * 16.0;
    float _719 = fma(_715, (*spvDescriptorSet0.fp_c3)._m0[0].x, _709);
    float _721 = 1.0 / _711;
    float _723 = _717 * _651;
    float _725 = -_697;
    float _727 = fma(_655, _723, _725);
    float _729 = -_703;
    float _731 = fma(_657, _723, _729);
    float _733 = -_705;
    float _735 = fma(_659, _723, _733);
    float _737 = fma(_727, (*spvDescriptorSet0.fp_c3)._m0[0].x, _697);
    float _739 = _719 * _721;
    float _741 = fma(_731, (*spvDescriptorSet0.fp_c3)._m0[0].x, _703);
    float _743 = fma(_735, (*spvDescriptorSet0.fp_c3)._m0[0].x, _705);
    float _745 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _747 = !_394;
    float _749 = _747 ? _739 : 0.0;
    bool _751 = !_683;
    int _753 = _683 ? (-1) : 0;
    int _767;
    int _769;
    int _771;
    int _773;
    int _775;
    int _777;
    if (!_751)
    {
        float _755 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _757 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _759 = _472 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _761 = _442 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _763 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _765 = _482 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _767 = as_type<int>(_761);
        _769 = as_type<int>(_765);
        _771 = as_type<int>(_755);
        _773 = as_type<int>(_757);
        _775 = as_type<int>(_759);
        _777 = as_type<int>(_763);
        _779 = true;
    }
    else
    {
        int _781 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _783 = _781 != 0;
        float _785 = _602 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _787 = _610 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _789 = _590 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _791 = _606 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _793 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _795 = _594 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _797 = _612 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _799 = as_type<int>(_785);
        int _801 = as_type<int>(_787);
        int _803 = as_type<int>(_789);
        int _805 = as_type<int>(_791);
        int _807 = as_type<int>(_795);
        _753 = _783 ? (-1) : 0;
        _769 = as_type<int>(_797);
        if (_783)
        {
            float _809 = _374 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _799 = as_type<int>(_809);
        }
        int _811 = _799;
        _773 = _811;
        if (_783)
        {
            float _813 = _376 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _801 = as_type<int>(_813);
        }
        int _815 = _801;
        _775 = _815;
        if (_783)
        {
            float _817 = _793 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _803 = as_type<int>(_817);
        }
        int _819 = _803;
        _771 = _819;
        if (_783)
        {
            _805 = _811;
        }
        int _821 = _805;
        _777 = _821;
        if (_783)
        {
            _807 = _819;
        }
        int _823 = _807;
        _767 = _823;
        if (_783)
        {
            _769 = _815;
        }
    }
    _779 = false;
    int _825 = _753;
    int _827 = _767;
    int _829 = _769;
    int _831 = _771;
    int _833 = _773;
    int _835 = _775;
    int _837 = _777;
    float _839 = _540 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    int _841 = 0;
    int _843 = _825;
    if (!_90)
    {
        int _845 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _847 = _845 != 0;
        _841 = _847 ? (-1) : 0;
    }
    int _849 = _841;
    float _851 = _737 * _721;
    if (_90)
    {
        _843 = -1;
    }
    int _853 = _843;
    float _855 = _741 * _721;
    int _857 = _853;
    if (!_90)
    {
        int _859 = ~_849;
        bool _861 = !_94;
        int _863 = _859 & (_861 ? (-1) : 0);
        _857 = _863;
    }
    int _865 = _857;
    float _867 = exp2(_839);
    bool _869 = _96 != 0;
    float _871 = _743 * _721;
    float _873 = _749 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _875 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _877 = _220 * _875;
    float _879 = _749 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _881 = _220 * (-10000.0);
    float _883 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[26].x, _877);
    int _885 = _865;
    if (_86)
    {
        _885 = -1;
    }
    int _887 = _885;
    float _889 = -_867;
    float _891 = _889 + 1.0;
    int _893 = _887;
    if (!_86)
    {
        bool _895 = !_94;
        bool _897 = _895 && _82;
        bool _899 = !_869;
        bool _901 = _897 && _899;
        _893 = _901 ? (-1) : 0;
    }
    int _903 = _893;
    int _905 = ~_865;
    float _907 = (_905 != 0) ? as_type<float>(_827) : 0.0;
    float _909 = _891 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _911 = ~_865;
    float _913 = (_911 != 0) ? as_type<float>(_829) : 0.0;
    float _915 = -_909;
    float _917 = _915 + 1.0;
    float _919 = abs(_917);
    float _921 = log2(_919);
    bool _923 = !_94;
    bool _925 = _82 && _923;
    int _927 = ~_903;
    float _929 = (_927 != 0) ? as_type<float>(_831) : 0.0;
    int _931 = ~_903;
    float _933 = (_931 != 0) ? as_type<float>(_833) : 0.0;
    int _935 = ~_903;
    float _937 = (_935 != 0) ? as_type<float>(_835) : 0.0;
    int _939 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _941 = _939 != 0;
    bool _943 = !_925;
    float _945 = _943 ? _879 : 0.0;
    float _947 = _921 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _949 = !_925;
    float _951 = _949 ? _873 : 0.0;
    int _953 = ~_865;
    float _955 = (_953 != 0) ? as_type<float>(_837) : 0.0;
    bool _957 = !_941;
    float _959 = exp2(_947);
    bool _961 = !_941;
    float _963 = _951 * _907;
    float _965 = _951 * _955;
    float _967 = _951 * _913;
    bool _969 = !_957;
    float _971 = _969 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _973 = _921 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _975 = !_941;
    int _977 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _979 = _977 != 0;
    bool _981 = !_961;
    float _983 = _981 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _985 = fma(_929, _945, _963);
    float _987 = exp2(_973);
    bool _989 = !_975;
    float _991 = _989 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _993 = _971 * _985;
    bool _995 = !_979;
    float _997 = fma(_933, _945, _965);
    bool _999 = !_78;
    float _1001 = _999 ? _959 : 1.0;
    float _1003 = fma(_937, _945, _967);
    bool _1005 = !_979;
    float _1007 = _983 * _997;
    float _1009 = _995 ? _855 : 0.0;
    float _1011 = _1001 * _993;
    float _1013 = _1005 ? _871 : 0.0;
    float _1015 = _749 * _1001;
    float _1017 = _1001 * _1007;
    float _1019 = _991 * _1003;
    bool _1021 = !_979;
    int _1023 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1025 = _1023 != 0;
    bool _1027 = !_78;
    float _1029 = _1027 ? _987 : 1.0;
    float _1031 = _1029 * _1009;
    float _1033 = _1029 * _1013;
    float _1035 = _1021 ? _851 : 0.0;
    float _1037 = _82 ? _1015 : _1011;
    float _1039 = _1029 * _1035;
    float _1041 = _82 ? _1015 : _1017;
    float _1043 = _1015;
    float _1045 = _1009;
    int _1047 = as_type<int>(_1033);
    float _1049 = _1035;
    float _1051 = _909;
    if (!_82)
    {
        float _1053 = _1001 * _1019;
        _1043 = _1053;
    }
    float _1055 = _1043;
    if (_78)
    {
        _1045 = 0.0;
    }
    float _1057 = _1045;
    float _1059 = _1037 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1061 = _1055 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1063 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1059);
    float _1065 = fma(_1033, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1061);
    float _1067 = _1059;
    float _1069 = _1065;
    float _1071 = _1057;
    if (_78)
    {
        _1047 = as_type<int>(_745);
    }
    int _1073 = _1047;
    float _1075 = _1041 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1077 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1075);
    int _1079 = _1073;
    int _1081 = _1073;
    float _1083 = _1077;
    if (_78)
    {
        _1067 = 0.0;
    }
    float _1085 = _1067;
    float _1087 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _1089 = !_78;
    float _1091 = _1089 ? _909 : 0.0;
    float _1093 = _1085;
    if (_78)
    {
        _1049 = 0.0;
    }
    float _1095 = _1049;
    float _1097 = _1095;
    if (_78)
    {
        _1051 = _1063;
    }
    float _1099 = _1051;
    float _1101 = _1099;
    float _1103 = _1099;
    if (!_78)
    {
        int _1105 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1107 = _1105 != 0;
        float _1109 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1111 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1113 = _1111 != 0;
        float _1115 = _675 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1117 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1119 = !_1113;
        float _1121 = _1119 ? _1115 : 0.0;
        bool _1123 = !_1113;
        float _1125 = _1123 ? _1109 : 0.0;
        bool _1127 = !_1113;
        float _1129 = _1127 ? _1117 : 0.0;
        float _1131 = _1091 * _1121;
        _1071 = _1131;
        if (!_1107)
        {
            _1079 = as_type<int>(_745);
        }
        int _1133 = _1079;
        float _1135 = _1091 * _1125;
        _1081 = _1133;
        _1093 = _1135;
        if (!_1107)
        {
            _1101 = _1063;
        }
        float _1137 = _1101;
        float _1139 = _1091 * _1129;
        bool _1141 = !_1107;
        _1097 = _1139;
        _1103 = _1137;
        if (!_1141)
        {
            float _1143 = -_1091;
            float _1145 = _1143 + 1.0;
            float _1147 = precise::clamp(_1145, 0.0, 1.0);
            float _1149 = _745 * _1147;
            float _1151 = precise::max(_1149, 9.9999997473787516355514526367188e-05);
            float _1153 = 1.0 / _1151;
            float _1155 = _745 * _1153;
            float _1157 = _1063 * _1155;
            float _1159 = _1077 * _1155;
            float _1161 = _1065 * _1155;
            _1081 = as_type<int>(_1149);
            _1083 = _1159;
            _1093 = 0.0;
            _1069 = _1161;
            _1097 = 0.0;
            _1103 = _1157;
            _1071 = 0.0;
        }
    }
    int _1163 = _1081;
    float _1165 = _1083;
    float _1167 = _1093;
    float _1169 = _1069;
    float _1171 = _1097;
    float _1173 = _1103;
    float _1175 = _1071;
    bool _1177 = !_1025;
    float _1179 = _1177 ? as_type<float>(_1163) : 1.0;
    float _1181 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[26].z, _883);
    float _1183 = -_1087;
    float _1185 = exp2(_1183);
    float _1187 = abs(_881);
    bool _1189 = _1187 > 0.00999999977648258209228515625;
    float _1191 = -_1179;
    float _1193 = _1191 + 1.0;
    float _1195 = _1165 + _1167;
    float _1197 = fma(_1181, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1199 = _1189 ? _881 : 0.00999999977648258209228515625;
    float _1201 = _1169 + _1171;
    float _1203 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1205 = abs(_1193);
    float _1207 = log2(_1205);
    float _1209 = fma(_1197, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1211 = _1199 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    int _1213 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1215 = _1213 != 0;
    float _1217 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1219 = fma(_1217, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1221 = precise::max(_1211, -127.0);
    float _1223 = abs(_1209);
    float _1225 = log2(_1223);
    float _1227 = _1207 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1229 = -_1221;
    float _1231 = exp2(_1229);
    float _1233 = _1225 * 1.5;
    float _1235 = exp2(_1227);
    float _1237 = _1173 + _1175;
    float _1239 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1241 = -_1231;
    float _1243 = _1241 + 1.0;
    float _1245 = 1.0 / _1221;
    float _1247 = _1185 * _1243;
    float _1249 = _667 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1251 = -_1235;
    float _1253 = spvFAdd(_1251, 1.00010001659393310546875);
    float _1255 = -_1235;
    float _1257 = _1255 + 1.0;
    float _1259 = exp2(_1233);
    float _1261 = -_1179;
    float _1263 = _1261 + _1257;
    float _1265 = _1203 * _1263;
    float _1267 = 1.0 / _1253;
    float _1269 = _1249 * _1263;
    float _1271 = _1239 * _1263;
    float _1273 = fma(_1195, _1179, _1265);
    float _1275 = _1247 * _1245;
    float _1277 = fma(_1237, _1179, _1269);
    float _1279 = fma(_1201, _1179, _1271);
    float _1281 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1283 = _1259 * 12.56637096405029296875;
    float _1285 = _1275 * _1281;
    float _1287 = 1.0 / _1283;
    float _1289 = _1267 * _1273;
    float _1291 = _1267 * _1277;
    float _1293 = _1267 * _1279;
    float _1295 = _1289 * 0.715200006961822509765625;
    float _1297 = -_1285;
    float _1299 = exp2(_1297);
    float _1301 = fma(_1291, 0.2125999927520751953125, _1295);
    float _1303 = fma(_1293, 0.072200000286102294921875, _1301);
    float _1305 = _1219 * _1287;
    float _1307 = 1.0 / _1303;
    float _1309 = -_1299;
    float _1311 = _1309 + 1.0;
    float _1313 = _1311 * _1305;
    float _1315 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1317 = _1307 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1319 = precise::clamp(_1317, 0.0, 1.0);
    float _1321 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1323 = fma(_1319, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1325 = _1323 * _1299;
    float _1327 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1329 = fma(_1291, _1325, _1315);
    float _1331 = fma(_1289, _1325, _1327);
    float _1333 = fma(_1293, _1325, _1321);
    bool _1335 = !_1215;
    float _1337 = _1327;
    float _1339 = _1331;
    float _1341 = _1257;
    int _1343 = as_type<int>(_1327);
    float _1345 = _1331;
    float _1347 = _1257;
    if (!_1335)
    {
        bool _1349 = _1257 != 1.0;
        bool _1351 = isnan(_1257);
        bool _1353 = _1349 || _1351;
        bool _1355 = isnan(1.0);
        bool _1357 = _1353 || _1355;
        float _1359 = -_1235;
        bool _1361 = _1359 != (-1.0);
        bool _1363 = isnan(_1359);
        bool _1365 = _1361 || _1363;
        bool _1367 = isnan(-1.0);
        bool _1369 = _1365 || _1367;
        float _1371 = -_1235;
        bool _1373 = _1371 == (-1.0);
        bool _1375 = !_1357;
        bool _1377 = _1373 || _1375;
        bool _1379 = _1257 == 1.0;
        bool _1381 = _1379 && _1369;
        bool _1383 = !_1377;
        float _1385 = _1383 ? _1257 : 0.0;
        bool _1387 = !_1381;
        float _1389 = _1387 ? 0.0 : 1.0;
        float _1391 = _1377 ? 0.0 : 0.5;
        float _1393 = _1385 * 0.715200006961822509765625;
        float _1395 = fma(_1389, 0.2125999927520751953125, _1393);
        float _1397 = fma(_1391, 0.072200000286102294921875, _1395);
        float _1399 = 1.0 / _1397;
        float _1401 = _1399 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1403 = precise::clamp(_1401, 0.0, 1.0);
        float _1405 = fma(_1403, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1407 = _1389 * _1405;
        float _1409 = _1385 * _1405;
        float _1411 = _1391 * _1405;
        out.m_40.x = _1407;
        out.m_40.y = _1409;
        out.m_40.z = _1411;
        out.m_40.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    bool _1413 = _96 != 0;
    bool _1415 = !_1413;
    if (!_1415)
    {
        if (_86)
        {
            _1337 = 0.0;
        }
        float _1417 = _1337;
        float _1419 = _1417;
        if (_86)
        {
            _1339 = 0.0;
        }
        float _1421 = _1339;
        float _1423 = _1421;
        if (!_86)
        {
            float _1425 = _933 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1423 = _1425;
        }
        float _1427 = _1423;
        float _1429 = _1427;
        if (!_86)
        {
            float _1431 = _929 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1419 = _1431;
        }
        float _1433 = _1419;
        float _1435 = _1433;
        if (!_90)
        {
            float _1437 = fma(_955, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1427);
            _1429 = _1437;
        }
        float _1439 = _1429;
        if (_86)
        {
            _1341 = 0.0;
        }
        float _1441 = _1341;
        float _1443 = _1441;
        if (!_86)
        {
            float _1445 = _937 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1443 = _1445;
        }
        float _1447 = _1443;
        float _1449 = _1447;
        if (!_90)
        {
            float _1451 = fma(_907, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1433);
            _1435 = _1451;
        }
        float _1453 = _1435;
        float _1455 = _1439 * 0.715200006961822509765625;
        if (!_90)
        {
            float _1457 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1447);
            _1449 = _1457;
        }
        float _1459 = _1449;
        float _1461 = fma(_1453, 0.2125999927520751953125, _1455);
        float _1463 = fma(_1459, 0.072200000286102294921875, _1461);
        float _1465 = 1.0 / _1463;
        float _1467 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1469 = precise::clamp(_1467, 0.0, 1.0);
        float _1471 = fma(_1469, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1473 = _1471 * _1453;
        float _1475 = _1471 * _1439;
        float _1477 = _1471 * _1459;
        out.m_40.x = _1473;
        out.m_40.y = _1475;
        out.m_40.z = _1477;
        out.m_40.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    if (!_94)
    {
        _1343 = as_type<int>(_1329);
    }
    int _1479 = _1343;
    float _1481 = as_type<float>(_1479);
    if (!_94)
    {
        out.m_40.x = as_type<float>(_1479);
        out.m_40.y = _1331;
        out.m_40.z = _1333;
        out.m_40.w = _1257;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    if (_86)
    {
        _1481 = 0.0;
    }
    float _1483 = _1481;
    float _1485 = _1483;
    if (_86)
    {
        _1345 = 0.0;
    }
    float _1487 = _1345;
    float _1489 = _1487;
    if (!_86)
    {
        float _1491 = _933 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1489 = _1491;
    }
    float _1493 = _1489;
    float _1495 = _1493;
    if (!_86)
    {
        float _1497 = _929 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1485 = _1497;
    }
    float _1499 = _1485;
    float _1501 = _1499;
    if (!_90)
    {
        float _1503 = fma(_955, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1493);
        _1495 = _1503;
    }
    float _1505 = _1495;
    if (_86)
    {
        _1347 = 0.0;
    }
    float _1507 = _1347;
    float _1509 = _1507;
    if (!_86)
    {
        float _1511 = _937 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1509 = _1511;
    }
    float _1513 = _1509;
    float _1515 = _1513;
    if (!_90)
    {
        float _1517 = fma(_907, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1499);
        _1501 = _1517;
    }
    float _1519 = _1501;
    float _1521 = _1505 * 0.715200006961822509765625;
    if (!_90)
    {
        float _1523 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1513);
        _1515 = _1523;
    }
    float _1525 = _1515;
    float _1527 = fma(_1519, 0.2125999927520751953125, _1521);
    float _1529 = fma(_1525, 0.072200000286102294921875, _1527);
    float _1531 = 1.0 / _1529;
    float _1533 = _1531 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1535 = precise::clamp(_1533, 0.0, 1.0);
    float _1537 = fma(_1535, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1539 = _1537 * _1519;
    float _1541 = _1537 * _1505;
    float _1543 = _1537 * _1525;
    out.m_40.x = _1539;
    out.m_40.y = _1541;
    out.m_40.z = _1543;
    out.m_40.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_40)};
}

