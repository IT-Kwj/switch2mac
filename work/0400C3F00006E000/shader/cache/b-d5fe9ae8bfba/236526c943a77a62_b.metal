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
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_ESmplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
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
void _50(thread const int& _3872, thread const int& _3873, thread const int& _3874, thread const int& _3875, thread int& _3876, thread int& _3877, thread int& _3878, thread int& _3879, thread int& _3880, thread int& _3881)
{
    float _3884 = as_type<float>(_3874) + 0.0;
    bool _3886 = _3884 != 0.0;
    bool _3888 = isnan(_3884);
    bool _3890 = _3886 || _3888;
    bool _3892 = isnan(0.0);
    bool _3894 = _3890 || _3892;
    int _3896 = as_type<int>(_3884);
    int _3898 = _3872;
    int _3900 = 0;
    int _3902 = _3894 ? (-1) : 0;
    if (!_3894)
    {
        float _3904 = as_type<float>(_3874) * 1.0;
        _3896 = as_type<int>(_3904);
    }
    int _3906 = _3896;
    bool _3908 = !_3894;
    int _3910 = _3906;
    if (!_3908)
    {
        float _3912 = as_type<float>(_3874) + 0.0;
        bool _3914 = _3912 >= 0.0;
        bool _3916 = isnan(_3912);
        bool _3918 = _3914 || _3916;
        bool _3920 = isnan(0.0);
        bool _3922 = _3918 || _3920;
        int _3924 = as_type<int>(_3912);
        _3902 = _3922 ? (-1) : 0;
        if (!_3922)
        {
            _3924 = 2147483647;
        }
        int _3926 = _3924;
        bool _3928 = !_3922;
        _3910 = _3926;
        if (!_3928)
        {
            float _3930 = abs(as_type<float>(_3874));
            float _3932 = _3930 + 0.0;
            bool _3934 = _3932 > as_type<float>(0x7f800000u /* inf */);
            bool _3936 = isnan(_3932);
            bool _3938 = _3934 || _3936;
            bool _3940 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3942 = _3938 || _3940;
            int _3944 = as_type<int>(_3932);
            _3900 = 2139095040;
            _3902 = _3942 ? (-1) : 0;
            if (_3942)
            {
                float _3946 = as_type<float>(_3874) + 1.0;
                _3944 = as_type<int>(_3946);
            }
            int _3948 = _3944;
            _3910 = _3948;
            if (!_3942)
            {
                float _3950 = abs(as_type<float>(_3874));
                float _3952 = _3950 + (-0.0);
                float _3954 = 0.0 + _3952;
                bool _3956 = _3954 != as_type<float>(0x7f800000u /* inf */);
                bool _3958 = isnan(_3954);
                bool _3960 = _3956 || _3958;
                bool _3962 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3964 = _3960 || _3962;
                int _3966 = as_type<int>(_3954);
                _3902 = _3964 ? (-1) : 0;
                if (!_3964)
                {
                    _3966 = _3874;
                }
                int _3968 = _3966;
                bool _3970 = !_3964;
                _3910 = _3968;
                if (!_3970)
                {
                    float _3972 = as_type<float>(_3874) * 18446744073709551616.0;
                    float _3974 = rsqrt(_3972);
                    float _3976 = _3972 * _3974;
                    float _3978 = _3974 * 0.5;
                    float _3980 = -_3976;
                    float _3982 = 0.0 + _3980;
                    float _3984 = fma(_3978, _3982, 0.5);
                    float _3986 = fma(_3976, _3984, _3976);
                    float _3988 = -_3986;
                    float _3990 = 0.0 + _3988;
                    float _3992 = fma(_3986, _3990, _3972);
                    float _3994 = fma(_3978, _3992, _3986);
                    float _3996 = _3994 * 2.3283064365386962890625e-10;
                    _3910 = as_type<int>(_3996);
                    _3898 = as_type<int>(_3972);
                    _3900 = as_type<int>(_3978);
                }
            }
        }
    }
    int _3998 = _3910;
    int _4000 = _3898;
    int _4002 = _3900;
    int _4004 = _3902;
    _3876 = _3998;
    _3877 = _4000;
    _3878 = _4002;
    _3879 = _3875;
    _3880 = 0;
    _3881 = _4004;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _821 = false;
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
        int _250 = 0;
        int _252 = as_type<int>(_234);
        int _254 = 1200;
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
    float2 _1953;
    _1953.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_344, _346));
    _1953.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_344, _346));
    float _348 = _1953.x;
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
    float _374 = _366 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _376 = _126 * _124;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _380 = -_374;
    float _382 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _380);
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _388 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _390 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _392 = _358;
    if (_370)
    {
        float _394 = sqrt(_364);
        _392 = _394;
    }
    float _396 = _392;
    float _398 = fma(_126, _384, _378);
    float _400 = -_372;
    float _402 = fma(_400, (*spvDescriptorSet0.fp_c3)._m0[11].z, _382);
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _406 = fma(_298, 3.0, -1.0);
    float _408 = -_124;
    float _410 = fma(_408, _386, _398);
    float _412 = fma(_124, _386, _398);
    float _414 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _420 = _124 * (-3.0);
    float _422 = fma(_126, _418, _388);
    float _424 = fma(_126, _414, _390);
    float _426 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _428 = abs(_396);
    float _430 = log2(_428);
    float _432 = -_124;
    float _434 = fma(_432, _416, _422);
    float _436 = fma(_124, _416, _422);
    float _438 = -_122;
    float _440 = fma(_438, _426, _410);
    float _442 = fma(_122, _426, _412);
    float _444 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _446 = -_124;
    float _448 = fma(_446, _404, _424);
    float _450 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _452 = fma(_124, _404, _424);
    float _454 = -_122;
    float _456 = fma(_454, _444, _434);
    float _458 = -_126;
    float _460 = _122 * _458;
    float _462 = -_122;
    float _464 = fma(_462, _450, _448);
    float _466 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _468 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _470 = fma(_122, _450, _452);
    float _472 = _430 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _476 = fma(_122, _444, _436);
    float _478 = _122 * _126;
    float _480 = fma(_466, _460, _440);
    float _482 = fma(_468, _460, _456);
    float _484 = exp2(_472);
    float _486 = fma(_474, _460, _464);
    float _488 = fma(_466, _478, _442);
    float _490 = fma(_468, _478, _476);
    float _492 = fma(_474, _478, _470);
    float _494 = -_124;
    float _496 = _126 * _494;
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _502 = -_124;
    float _504 = fma(_502, _420, -1.0);
    float _506 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _508 = _484 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _510 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = fma(_500, _496, _480);
    float _516 = -_512;
    float _518 = _516 + 1.0;
    float _520 = fma(_498, _496, _482);
    float _522 = fma(_402, 0.5, 0.5);
    float _524 = fma(_402, -0.5, 0.5);
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _528 = fma(_500, _376, _488);
    float _530 = abs(_518);
    float _532 = log2(_530);
    float _534 = fma(_522, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _536 = fma(_526, _496, _486);
    float _538 = fma(_526, _376, _492);
    float _540 = in.m_44.x;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_44.y;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = fma(_522, _534, -0.212114393711090087890625);
    float _554 = fma(_498, _376, _490);
    float _556 = sqrt(_524);
    float _558 = _122 * _124;
    float _560 = fma(_522, _552, 1.570728778839111328125);
    float _562 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _564 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _566 = fma(_562, _558, _528);
    float _568 = _532 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _570 = fma(_562, _558, _514);
    float _572 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _574 = _224 + 1.0;
    float _576 = exp2(_568);
    float _578 = fma(_564, _558, _536);
    float _580 = fma(_572, _558, _520);
    float _582 = fma(_572, _558, _554);
    float _584 = _556 * 0.636619746685028076171875;
    float _586 = fma(_564, _558, _538);
    float _588 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _590 = fma(_506, _504, _580);
    float _592 = -_560;
    float _594 = fma(_584, _592, 1.0);
    float _596 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _598 = fma(_588, _504, _570);
    float _600 = fma(_588, _406, _566);
    float _602 = fma(_596, _504, _578);
    float _604 = -_224;
    float _606 = fma(_576, _574, _604);
    float _608 = _102 * _550;
    float _610 = fma(_224, -0.5, 0.5);
    float _612 = _102 * _544;
    float _614 = fma(_606, 0.5, 0.5);
    float _616 = float(uint(_352));
    float _618 = _616 * 0.00390625;
    float2 _2384 = float2(_344, _346);
    float2 _622 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2384, float2(0.0), isnan(_2384)), level(_618)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2384, float2(0.0), isnan(_2384)), level(_618)).xy;
    float _624 = _622.x;
    float _626 = _622.y;
    float2 _2399 = float2(_344, _346);
    float2 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2399, float2(0.0), isnan(_2399)), level(_618)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2399, float2(0.0), isnan(_2399)), level(_618)).xy;
    float _630 = _628.x;
    float _632 = _628.y;
    float2 _2412 = float2(_344, _346);
    float4 _635 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2412, float2(0.0), isnan(_2412)), level(_618)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2412, float2(0.0), isnan(_2412)), level(_618)).xyzw;
    float _637 = _635.x;
    float _639 = _635.y;
    float _641 = _635.z;
    float _643 = _635.w;
    float2 _2429 = float2(_344, _346);
    float4 _645 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2429, float2(0.0), isnan(_2429)), level(_618)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2429, float2(0.0), isnan(_2429)), level(_618)).xyzw;
    float _647 = _645.x;
    float _649 = _645.y;
    float _651 = _645.z;
    float _653 = _645.w;
    float2 _2446 = float2(_612, _608);
    float3 _657 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2446, float2(0.0), isnan(_2446))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2446, float2(0.0), isnan(_2446))).xyz;
    float _659 = _657.x;
    float _661 = _657.y;
    float _663 = _657.z;
    float2 _2460 = float2(_594, _610);
    float3 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2460, float2(0.0), isnan(_2460))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2460, float2(0.0), isnan(_2460))).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float2 _2474 = float2(_594, _614);
    float3 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2474, float2(0.0), isnan(_2474))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2474, float2(0.0), isnan(_2474))).xyz;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    float _681 = fma(_506, _406, _582);
    float _683 = fma(_596, _406, _586);
    float _685 = _122 * _122;
    int _687 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _693 = _691 != 0;
    float _695 = -_126;
    float _697 = fma(_695, _126, _685);
    float _699 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _701 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _703 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _705 = fma(_699, _697, _598);
    float _707 = fma(_701, _697, _602);
    float _709 = fma(_699, _697, _600);
    float _711 = fma(_703, _697, _590);
    float _713 = fma(_703, _697, _681);
    float _715 = fma(_701, _697, _683);
    float _717 = -_626;
    float _719 = _717 + _632;
    float _721 = _643 * _643;
    float _723 = _653 * _653;
    float _725 = fma(_719, (*spvDescriptorSet0.fp_c3)._m0[0].x, _626);
    float _727 = _721 * _721;
    float _729 = _723 * _723;
    float _731 = precise::max(_725, 1.52587890625e-05);
    float _733 = _727 * 16.0;
    float _735 = _624 * _626;
    float _737 = 1.0 / _731;
    float _739 = _733 * _626;
    float _741 = -_735;
    float _743 = fma(_630, _632, _741);
    float _745 = _729 * 16.0;
    float _747 = -_663;
    float _749 = _747 + 1.0;
    float _751 = _637 * _739;
    float _753 = _639 * _739;
    float _755 = _745 * _632;
    float _757 = fma(_743, (*spvDescriptorSet0.fp_c3)._m0[0].x, _735);
    float _759 = _641 * _739;
    float _761 = _725 * _749;
    float _763 = -_751;
    float _765 = fma(_647, _755, _763);
    float _767 = -_753;
    float _769 = fma(_649, _755, _767);
    float _771 = -_759;
    float _773 = fma(_651, _755, _771);
    float _775 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _751);
    float _777 = _757 * _737;
    float _779 = fma(_769, (*spvDescriptorSet0.fp_c3)._m0[0].x, _753);
    float _781 = fma(_773, (*spvDescriptorSet0.fp_c3)._m0[0].x, _759);
    float _783 = _761 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _785 = !_689;
    float _787 = _785 ? _777 : 0.0;
    bool _789 = !_693;
    int _791 = as_type<int>(_715);
    int _793 = _693 ? (-1) : 0;
    float _795 = _787;
    int _809;
    int _811;
    int _813;
    int _815;
    int _817;
    int _819;
    if (!_789)
    {
        float _797 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _799 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _801 = _464 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _803 = _442 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _805 = _476 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _807 = _470 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _809 = as_type<int>(_803);
        _811 = as_type<int>(_805);
        _813 = as_type<int>(_807);
        _815 = as_type<int>(_797);
        _817 = as_type<int>(_799);
        _819 = as_type<int>(_801);
        _821 = true;
    }
    else
    {
        int _823 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _825 = _823 != 0;
        float _827 = _705 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _829 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _831 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _833 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _835 = _715 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _837 = _713 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _839 = as_type<int>(_827);
        int _841 = as_type<int>(_829);
        int _843 = as_type<int>(_831);
        int _845 = as_type<int>(_837);
        _793 = _825 ? (-1) : 0;
        _813 = as_type<int>(_835);
        if (_825)
        {
            float _847 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _839 = as_type<int>(_847);
        }
        int _849 = _839;
        _815 = _849;
        if (_825)
        {
            float _851 = _388 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _841 = as_type<int>(_851);
        }
        int _853 = _841;
        _817 = _853;
        if (_825)
        {
            float _855 = _390 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _843 = as_type<int>(_855);
        }
        int _857 = _843;
        _819 = _857;
        if (!_825)
        {
            _791 = as_type<int>(_833);
        }
        int _859 = _791;
        int _861 = _859;
        if (_825)
        {
            _861 = _849;
        }
        int _863 = _861;
        _809 = _863;
        if (_825)
        {
            _845 = _853;
        }
        int _865 = _845;
        _811 = _865;
        if (_825)
        {
            _813 = _857;
        }
    }
    _821 = false;
    int _867 = _793;
    int _869 = _809;
    int _871 = _811;
    int _873 = _813;
    int _875 = _815;
    int _877 = _817;
    int _879 = _819;
    int _881 = 0;
    int _883 = _867;
    if (!_94)
    {
        int _885 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _887 = _885 != 0;
        _881 = _887 ? (-1) : 0;
    }
    int _889 = _881;
    float _891 = _532 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_94)
    {
        _883 = -1;
    }
    int _893 = _883;
    float _895 = _787 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _897 = _893;
    if (!_94)
    {
        int _899 = ~_889;
        bool _901 = !_98;
        int _903 = _899 & (_901 ? (-1) : 0);
        _897 = _903;
    }
    int _905 = _897;
    float _907 = _787 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _909 = _100 != 0;
    float _911 = exp2(_891);
    float _913 = _659 * _661;
    float _915 = _775 * _737;
    float _917 = _779 * _737;
    float _919 = _781 * _737;
    float _921 = _913 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    int _923 = _905;
    if (_90)
    {
        _923 = -1;
    }
    int _925 = _923;
    int _927 = ~_905;
    float _929 = (_927 != 0) ? as_type<float>(_869) : 0.0;
    int _931 = _925;
    if (!_90)
    {
        bool _933 = !_98;
        bool _935 = _933 && _86;
        bool _937 = !_909;
        bool _939 = _935 && _937;
        _931 = _939 ? (-1) : 0;
    }
    int _941 = _931;
    float _943 = -_911;
    float _945 = _943 + 1.0;
    int _947 = ~_905;
    float _949 = (_947 != 0) ? as_type<float>(_871) : 0.0;
    float _951 = _945 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _953 = ~_905;
    float _955 = (_953 != 0) ? as_type<float>(_873) : 0.0;
    bool _957 = !_98;
    bool _959 = _86 && _957;
    int _961 = ~_941;
    float _963 = (_961 != 0) ? as_type<float>(_875) : 0.0;
    int _965 = ~_941;
    float _967 = (_965 != 0) ? as_type<float>(_877) : 0.0;
    int _969 = ~_941;
    float _971 = (_969 != 0) ? as_type<float>(_879) : 0.0;
    int _973 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _975 = _973 != 0;
    bool _977 = !_959;
    float _979 = _977 ? _895 : 0.0;
    float _981 = -_951;
    float _983 = _981 + 1.0;
    bool _985 = !_959;
    float _987 = _985 ? _907 : 0.0;
    float _989 = abs(_983);
    float _991 = log2(_989);
    bool _993 = !_975;
    float _995 = _987 * _929;
    bool _997 = !_975;
    float _999 = _987 * _949;
    bool _1001 = !_993;
    float _1003 = _1001 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1005 = fma(_963, _979, _995);
    bool _1007 = !_997;
    float _1009 = _1007 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1011 = fma(_967, _979, _999);
    bool _1013 = !_975;
    float _1015 = _1003 * _1005;
    float _1017 = _987 * _955;
    float _1019 = _1009 * _1011;
    bool _1021 = !_1013;
    float _1023 = _1021 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    int _1025 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1027 = _1025 != 0;
    float _1029 = fma(_971, _979, _1017);
    float _1031 = _991 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1033 = _1019 * 0.715200006961822509765625;
    float _1035 = _991 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1037 = _1023 * _1029;
    bool _1039 = !_1027;
    float _1041 = fma(_1015, 0.2125999927520751953125, _1033);
    float _1043 = exp2(_1031);
    float _1045 = fma(_1037, 0.072200000286102294921875, _1041);
    float _1047 = _1039 ? _917 : 0.0;
    float _1049 = -_1019;
    float _1051 = _1049 + _1045;
    float _1053 = exp2(_1035);
    float _1055 = -_1015;
    float _1057 = _1055 + _1045;
    float _1059 = -_1037;
    float _1061 = _1059 + _1045;
    float _1063 = fma(_921, _1051, _1019);
    bool _1065 = !_1027;
    float _1067 = fma(_921, _1057, _1015);
    float _1069 = fma(_921, _1061, _1037);
    bool _1071 = !_1027;
    bool _1073 = !_82;
    float _1075 = _1073 ? _1043 : 1.0;
    float _1077 = _1065 ? _919 : 0.0;
    float _1079 = _787 * _1075;
    float _1081 = _1075 * _1067;
    bool _1083 = !_82;
    float _1085 = _1083 ? _1053 : 1.0;
    float _1087 = _1075 * _1063;
    float _1089 = _86 ? _1079 : _1081;
    float _1091 = _1085 * _1047;
    float _1093 = _1085 * _1077;
    float _1095 = _86 ? _1079 : _1087;
    float _1097 = _1079;
    float _1099 = _1091;
    float _1101 = _951;
    if (!_86)
    {
        float _1103 = _1075 * _1069;
        _1097 = _1103;
    }
    float _1105 = _1097;
    float _1107 = _1071 ? _915 : 0.0;
    float _1109 = _1089 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1111 = _1095 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1113 = _1105 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1115 = fma(_1091, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1111);
    float _1117 = fma(_1093, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1113);
    int _1119 = as_type<int>(_1111);
    float _1121 = _1113;
    float _1123 = _1109;
    if (_82)
    {
        _1119 = as_type<int>(_783);
    }
    int _1125 = _1119;
    float _1127 = _1085 * _1107;
    int _1129 = _1125;
    int _1131 = _1125;
    if (_82)
    {
        _1121 = 0.0;
    }
    float _1133 = _1121;
    float _1135 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1109);
    bool _1137 = !_82;
    float _1139 = _1137 ? _951 : 0.0;
    float _1141 = _1135;
    float _1143 = _1133;
    if (_82)
    {
        _795 = 0.0;
    }
    float _1145 = _795;
    float _1147 = _1145;
    if (_82)
    {
        _1099 = 0.0;
    }
    float _1149 = _1099;
    float _1151 = _1149;
    if (_82)
    {
        _1101 = _1115;
    }
    float _1153 = _1101;
    float _1155 = _1153;
    float _1157 = _1153;
    if (_82)
    {
        _1123 = _1117;
    }
    float _1159 = _1123;
    float _1161 = _1159;
    float _1163 = _1159;
    if (!_82)
    {
        int _1165 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1167 = _1165 != 0;
        float _1169 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1171 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1173 = _1171 != 0;
        float _1175 = _675 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1177 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1179 = !_1173;
        float _1181 = _1179 ? _1175 : 0.0;
        bool _1183 = !_1173;
        float _1185 = _1183 ? _1169 : 0.0;
        bool _1187 = !_1173;
        float _1189 = _1187 ? _1177 : 0.0;
        float _1191 = _1139 * _1181;
        _1143 = _1191;
        if (!_1167)
        {
            _1129 = as_type<int>(_783);
        }
        int _1193 = _1129;
        float _1195 = _1139 * _1185;
        float _1197 = _1139 * _1189;
        _1147 = _1195;
        _1131 = _1193;
        _1151 = _1197;
        if (!_1167)
        {
            _1155 = _1115;
        }
        float _1199 = _1155;
        _1157 = _1199;
        if (!_1167)
        {
            _1161 = _1117;
        }
        float _1201 = _1161;
        bool _1203 = !_1167;
        _1163 = _1201;
        if (!_1203)
        {
            float _1205 = -_1139;
            float _1207 = _1205 + 1.0;
            float _1209 = precise::clamp(_1207, 0.0, 1.0);
            float _1211 = _783 * _1209;
            float _1213 = precise::max(_1211, 9.9999997473787516355514526367188e-05);
            float _1215 = 1.0 / _1213;
            float _1217 = _783 * _1215;
            float _1219 = _1135 * _1217;
            float _1221 = _1115 * _1217;
            float _1223 = _1117 * _1217;
            _1157 = _1221;
            _1147 = 0.0;
            _1131 = as_type<int>(_1211);
            _1141 = _1219;
            _1143 = 0.0;
            _1163 = _1223;
            _1151 = 0.0;
        }
    }
    float _1225 = _1157;
    float _1227 = _1147;
    int _1229 = _1131;
    float _1231 = _1141;
    float _1233 = _1143;
    float _1235 = _1163;
    float _1237 = _1151;
    int _1239 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1245 = _1243 != 0;
    float _1247 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1249 = _1225 + _1227;
    float _1251 = _667 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1253 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _1255 = !_1245;
    float _1257 = _1255 ? as_type<float>(_1229) : 1.0;
    float _1259 = _1231 + _1233;
    float _1261 = _1235 + _1237;
    float _1263 = -_1257;
    float _1265 = _1263 + 1.0;
    float _1267 = abs(_1265);
    float _1269 = log2(_1267);
    float _1271 = _1269 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1273 = exp2(_1271);
    float _1275 = -_1273;
    float _1277 = spvFAdd(_1275, 1.00010001659393310546875);
    float _1279 = -_1273;
    float _1281 = _1279 + 1.0;
    float _1283 = -_1257;
    float _1285 = _1283 + _1281;
    float _1287 = 1.0 / _1277;
    float _1289 = _1247 * _1285;
    float _1291 = _1251 * _1285;
    float _1293 = _1253 * _1285;
    float _1295 = fma(_1249, _1257, _1289);
    float _1297 = fma(_1259, _1257, _1291);
    float _1299 = fma(_1261, _1257, _1293);
    float _1301 = _1287 * _1295;
    float _1303 = _1287 * _1297;
    float _1305 = _1287 * _1299;
    float _1307 = _1301 * 0.715200006961822509765625;
    float _1309 = fma(_1303, 0.2125999927520751953125, _1307);
    float _1311 = fma(_1305, 0.072200000286102294921875, _1309);
    float _1313 = 1.0 / _1311;
    float _1315 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1317 = precise::clamp(_1315, 0.0, 1.0);
    float _1319 = fma(_1317, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1321 = _1303 * _1319;
    float _1323 = _1301 * _1319;
    float _1325 = _1305 * _1319;
    bool _1327 = !_1241;
    float _1329 = _1325;
    float _1331 = _1305;
    float _1333 = _1281;
    int _1335 = as_type<int>(_1305);
    int _1337 = as_type<int>(_1323);
    float _1339 = _1325;
    float _1341 = _1281;
    if (!_1327)
    {
        bool _1343 = _1281 != 1.0;
        bool _1345 = isnan(_1281);
        bool _1347 = _1343 || _1345;
        bool _1349 = isnan(1.0);
        bool _1351 = _1347 || _1349;
        float _1353 = -_1273;
        bool _1355 = _1353 != (-1.0);
        bool _1357 = isnan(_1353);
        bool _1359 = _1355 || _1357;
        bool _1361 = isnan(-1.0);
        bool _1363 = _1359 || _1361;
        float _1365 = -_1273;
        bool _1367 = _1365 == (-1.0);
        bool _1369 = !_1351;
        bool _1371 = _1367 || _1369;
        bool _1373 = _1281 == 1.0;
        bool _1375 = _1373 && _1363;
        bool _1377 = !_1371;
        float _1379 = _1377 ? _1281 : 0.0;
        bool _1381 = !_1375;
        float _1383 = _1381 ? 0.0 : 1.0;
        float _1385 = _1371 ? 0.0 : 0.5;
        float _1387 = _1379 * 0.715200006961822509765625;
        float _1389 = fma(_1383, 0.2125999927520751953125, _1387);
        float _1391 = fma(_1385, 0.072200000286102294921875, _1389);
        float _1393 = 1.0 / _1391;
        float _1395 = _1393 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        float _1399 = fma(_1397, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1401 = _1383 * _1399;
        float _1403 = _1379 * _1399;
        float _1405 = _1385 * _1399;
        out.m_42.x = _1401;
        out.m_42.y = _1403;
        out.m_42.z = _1405;
        out.m_42.w = 1.0;
        return out;
    }
    bool _1407 = _100 != 0;
    bool _1409 = !_1407;
    if (!_1409)
    {
        if (_90)
        {
            _1329 = 0.0;
        }
        float _1411 = _1329;
        float _1413 = _1411;
        if (_90)
        {
            _1331 = 0.0;
        }
        float _1415 = _1331;
        float _1417 = _1415;
        if (!_90)
        {
            float _1419 = _967 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1417 = _1419;
        }
        float _1421 = _1417;
        float _1423 = _1421;
        if (!_90)
        {
            float _1425 = _963 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1413 = _1425;
        }
        float _1427 = _1413;
        float _1429 = _1427;
        if (!_94)
        {
            float _1431 = fma(_949, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1421);
            _1423 = _1431;
        }
        float _1433 = _1423;
        if (_90)
        {
            _1333 = 0.0;
        }
        float _1435 = _1333;
        float _1437 = _1435;
        if (!_90)
        {
            float _1439 = _971 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1437 = _1439;
        }
        float _1441 = _1437;
        float _1443 = _1433 * 0.715200006961822509765625;
        float _1445 = _1441;
        if (!_94)
        {
            float _1447 = fma(_929, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1427);
            _1429 = _1447;
        }
        float _1449 = _1429;
        if (!_94)
        {
            float _1451 = fma(_955, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1441);
            _1445 = _1451;
        }
        float _1453 = _1445;
        float _1455 = fma(_1449, 0.2125999927520751953125, _1443);
        float _1457 = fma(_1453, 0.072200000286102294921875, _1455);
        float _1459 = 1.0 / _1457;
        float _1461 = _1459 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1463 = precise::clamp(_1461, 0.0, 1.0);
        float _1465 = fma(_1463, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1467 = _1465 * _1449;
        float _1469 = _1465 * _1433;
        float _1471 = _1465 * _1453;
        out.m_42.x = _1467;
        out.m_42.y = _1469;
        out.m_42.z = _1471;
        out.m_42.w = 1.0;
        return out;
    }
    if (!_98)
    {
        _1335 = as_type<int>(_1323);
    }
    int _1473 = _1335;
    float _1475 = as_type<float>(_1473);
    if (!_98)
    {
        _1337 = as_type<int>(_1325);
    }
    int _1477 = _1337;
    if (!_98)
    {
        out.m_42.x = _1321;
        out.m_42.y = as_type<float>(_1473);
        out.m_42.z = as_type<float>(_1477);
        out.m_42.w = _1281;
        return out;
    }
    if (_90)
    {
        _1339 = 0.0;
    }
    float _1479 = _1339;
    float _1481 = _1479;
    if (_90)
    {
        _1475 = 0.0;
    }
    float _1483 = _1475;
    float _1485 = _1483;
    if (!_90)
    {
        float _1487 = _967 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1485 = _1487;
    }
    float _1489 = _1485;
    float _1491 = _1489;
    if (!_90)
    {
        float _1493 = _963 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1481 = _1493;
    }
    float _1495 = _1481;
    float _1497 = _1495;
    if (!_94)
    {
        float _1499 = fma(_949, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1489);
        _1491 = _1499;
    }
    float _1501 = _1491;
    if (_90)
    {
        _1341 = 0.0;
    }
    float _1503 = _1341;
    float _1505 = _1503;
    if (!_90)
    {
        float _1507 = _971 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1505 = _1507;
    }
    float _1509 = _1505;
    float _1511 = _1501 * 0.715200006961822509765625;
    float _1513 = _1509;
    if (!_94)
    {
        float _1515 = fma(_929, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1495);
        _1497 = _1515;
    }
    float _1517 = _1497;
    if (!_94)
    {
        float _1519 = fma(_955, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1509);
        _1513 = _1519;
    }
    float _1521 = _1513;
    float _1523 = fma(_1517, 0.2125999927520751953125, _1511);
    float _1525 = fma(_1521, 0.072200000286102294921875, _1523);
    float _1527 = 1.0 / _1525;
    float _1529 = _1527 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1531 = precise::clamp(_1529, 0.0, 1.0);
    float _1533 = fma(_1531, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1535 = _1533 * _1517;
    float _1537 = _1533 * _1501;
    float _1539 = _1533 * _1521;
    out.m_42.x = _1535;
    out.m_42.y = _1537;
    out.m_42.z = _1539;
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
    bool _821 = false;
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
        int _250 = 0;
        int _252 = as_type<int>(_234);
        int _254 = 1200;
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
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    float2 _1953;
    _1953.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_344, _346));
    _1953.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_344, _346));
    float _348 = _1953.x;
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
    float _374 = _366 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _376 = _126 * _124;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _380 = -_374;
    float _382 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _380);
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _388 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _390 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _392 = _358;
    if (_370)
    {
        float _394 = sqrt(_364);
        _392 = _394;
    }
    float _396 = _392;
    float _398 = fma(_126, _384, _378);
    float _400 = -_372;
    float _402 = fma(_400, (*spvDescriptorSet0.fp_c3)._m0[11].z, _382);
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _406 = fma(_298, 3.0, -1.0);
    float _408 = -_124;
    float _410 = fma(_408, _386, _398);
    float _412 = fma(_124, _386, _398);
    float _414 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _420 = _124 * (-3.0);
    float _422 = fma(_126, _418, _388);
    float _424 = fma(_126, _414, _390);
    float _426 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _428 = abs(_396);
    float _430 = log2(_428);
    float _432 = -_124;
    float _434 = fma(_432, _416, _422);
    float _436 = fma(_124, _416, _422);
    float _438 = -_122;
    float _440 = fma(_438, _426, _410);
    float _442 = fma(_122, _426, _412);
    float _444 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _446 = -_124;
    float _448 = fma(_446, _404, _424);
    float _450 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _452 = fma(_124, _404, _424);
    float _454 = -_122;
    float _456 = fma(_454, _444, _434);
    float _458 = -_126;
    float _460 = _122 * _458;
    float _462 = -_122;
    float _464 = fma(_462, _450, _448);
    float _466 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _468 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _470 = fma(_122, _450, _452);
    float _472 = _430 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _476 = fma(_122, _444, _436);
    float _478 = _122 * _126;
    float _480 = fma(_466, _460, _440);
    float _482 = fma(_468, _460, _456);
    float _484 = exp2(_472);
    float _486 = fma(_474, _460, _464);
    float _488 = fma(_466, _478, _442);
    float _490 = fma(_468, _478, _476);
    float _492 = fma(_474, _478, _470);
    float _494 = -_124;
    float _496 = _126 * _494;
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _502 = -_124;
    float _504 = fma(_502, _420, -1.0);
    float _506 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _508 = _484 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _510 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = fma(_500, _496, _480);
    float _516 = -_512;
    float _518 = _516 + 1.0;
    float _520 = fma(_498, _496, _482);
    float _522 = fma(_402, 0.5, 0.5);
    float _524 = fma(_402, -0.5, 0.5);
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _528 = fma(_500, _376, _488);
    float _530 = abs(_518);
    float _532 = log2(_530);
    float _534 = fma(_522, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _536 = fma(_526, _496, _486);
    float _538 = fma(_526, _376, _492);
    float _540 = in.m_44.x;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_44.y;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = fma(_522, _534, -0.212114393711090087890625);
    float _554 = fma(_498, _376, _490);
    float _556 = sqrt(_524);
    float _558 = _122 * _124;
    float _560 = fma(_522, _552, 1.570728778839111328125);
    float _562 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _564 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _566 = fma(_562, _558, _528);
    float _568 = _532 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _570 = fma(_562, _558, _514);
    float _572 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _574 = _224 + 1.0;
    float _576 = exp2(_568);
    float _578 = fma(_564, _558, _536);
    float _580 = fma(_572, _558, _520);
    float _582 = fma(_572, _558, _554);
    float _584 = _556 * 0.636619746685028076171875;
    float _586 = fma(_564, _558, _538);
    float _588 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _590 = fma(_506, _504, _580);
    float _592 = -_560;
    float _594 = fma(_584, _592, 1.0);
    float _596 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _598 = fma(_588, _504, _570);
    float _600 = fma(_588, _406, _566);
    float _602 = fma(_596, _504, _578);
    float _604 = -_224;
    float _606 = fma(_576, _574, _604);
    float _608 = _102 * _550;
    float _610 = fma(_224, -0.5, 0.5);
    float _612 = _102 * _544;
    float _614 = fma(_606, 0.5, 0.5);
    float _616 = float(uint(_352));
    float _618 = _616 * 0.00390625;
    float2 _2384 = float2(_344, _346);
    float2 _622 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2384, float2(0.0), isnan(_2384)), level(_618)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2384, float2(0.0), isnan(_2384)), level(_618)).xy;
    float _624 = _622.x;
    float _626 = _622.y;
    float2 _2399 = float2(_344, _346);
    float2 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2399, float2(0.0), isnan(_2399)), level(_618)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2399, float2(0.0), isnan(_2399)), level(_618)).xy;
    float _630 = _628.x;
    float _632 = _628.y;
    float2 _2412 = float2(_344, _346);
    float4 _635 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2412, float2(0.0), isnan(_2412)), level(_618)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2412, float2(0.0), isnan(_2412)), level(_618)).xyzw;
    float _637 = _635.x;
    float _639 = _635.y;
    float _641 = _635.z;
    float _643 = _635.w;
    float2 _2429 = float2(_344, _346);
    float4 _645 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2429, float2(0.0), isnan(_2429)), level(_618)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2429, float2(0.0), isnan(_2429)), level(_618)).xyzw;
    float _647 = _645.x;
    float _649 = _645.y;
    float _651 = _645.z;
    float _653 = _645.w;
    float2 _2446 = float2(_612, _608);
    float3 _657 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2446, float2(0.0), isnan(_2446))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2446, float2(0.0), isnan(_2446))).xyz;
    float _659 = _657.x;
    float _661 = _657.y;
    float _663 = _657.z;
    float2 _2460 = float2(_594, _610);
    float3 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2460, float2(0.0), isnan(_2460))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2460, float2(0.0), isnan(_2460))).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float2 _2474 = float2(_594, _614);
    float3 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2474, float2(0.0), isnan(_2474))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2474, float2(0.0), isnan(_2474))).xyz;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    float _681 = fma(_506, _406, _582);
    float _683 = fma(_596, _406, _586);
    float _685 = _122 * _122;
    int _687 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _693 = _691 != 0;
    float _695 = -_126;
    float _697 = fma(_695, _126, _685);
    float _699 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _701 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _703 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _705 = fma(_699, _697, _598);
    float _707 = fma(_701, _697, _602);
    float _709 = fma(_699, _697, _600);
    float _711 = fma(_703, _697, _590);
    float _713 = fma(_703, _697, _681);
    float _715 = fma(_701, _697, _683);
    float _717 = -_626;
    float _719 = _717 + _632;
    float _721 = _643 * _643;
    float _723 = _653 * _653;
    float _725 = fma(_719, (*spvDescriptorSet0.fp_c3)._m0[0].x, _626);
    float _727 = _721 * _721;
    float _729 = _723 * _723;
    float _731 = precise::max(_725, 1.52587890625e-05);
    float _733 = _727 * 16.0;
    float _735 = _624 * _626;
    float _737 = 1.0 / _731;
    float _739 = _733 * _626;
    float _741 = -_735;
    float _743 = fma(_630, _632, _741);
    float _745 = _729 * 16.0;
    float _747 = -_663;
    float _749 = _747 + 1.0;
    float _751 = _637 * _739;
    float _753 = _639 * _739;
    float _755 = _745 * _632;
    float _757 = fma(_743, (*spvDescriptorSet0.fp_c3)._m0[0].x, _735);
    float _759 = _641 * _739;
    float _761 = _725 * _749;
    float _763 = -_751;
    float _765 = fma(_647, _755, _763);
    float _767 = -_753;
    float _769 = fma(_649, _755, _767);
    float _771 = -_759;
    float _773 = fma(_651, _755, _771);
    float _775 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _751);
    float _777 = _757 * _737;
    float _779 = fma(_769, (*spvDescriptorSet0.fp_c3)._m0[0].x, _753);
    float _781 = fma(_773, (*spvDescriptorSet0.fp_c3)._m0[0].x, _759);
    float _783 = _761 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _785 = !_689;
    float _787 = _785 ? _777 : 0.0;
    bool _789 = !_693;
    int _791 = as_type<int>(_715);
    int _793 = _693 ? (-1) : 0;
    float _795 = _787;
    int _809;
    int _811;
    int _813;
    int _815;
    int _817;
    int _819;
    if (!_789)
    {
        float _797 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _799 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _801 = _464 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _803 = _442 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _805 = _476 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _807 = _470 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _809 = as_type<int>(_803);
        _811 = as_type<int>(_805);
        _813 = as_type<int>(_807);
        _815 = as_type<int>(_797);
        _817 = as_type<int>(_799);
        _819 = as_type<int>(_801);
        _821 = true;
    }
    else
    {
        int _823 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _825 = _823 != 0;
        float _827 = _705 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _829 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _831 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _833 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _835 = _715 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _837 = _713 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _839 = as_type<int>(_827);
        int _841 = as_type<int>(_829);
        int _843 = as_type<int>(_831);
        int _845 = as_type<int>(_837);
        _793 = _825 ? (-1) : 0;
        _813 = as_type<int>(_835);
        if (_825)
        {
            float _847 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _839 = as_type<int>(_847);
        }
        int _849 = _839;
        _815 = _849;
        if (_825)
        {
            float _851 = _388 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _841 = as_type<int>(_851);
        }
        int _853 = _841;
        _817 = _853;
        if (_825)
        {
            float _855 = _390 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _843 = as_type<int>(_855);
        }
        int _857 = _843;
        _819 = _857;
        if (!_825)
        {
            _791 = as_type<int>(_833);
        }
        int _859 = _791;
        int _861 = _859;
        if (_825)
        {
            _861 = _849;
        }
        int _863 = _861;
        _809 = _863;
        if (_825)
        {
            _845 = _853;
        }
        int _865 = _845;
        _811 = _865;
        if (_825)
        {
            _813 = _857;
        }
    }
    _821 = false;
    int _867 = _793;
    int _869 = _809;
    int _871 = _811;
    int _873 = _813;
    int _875 = _815;
    int _877 = _817;
    int _879 = _819;
    int _881 = 0;
    int _883 = _867;
    if (!_94)
    {
        int _885 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _887 = _885 != 0;
        _881 = _887 ? (-1) : 0;
    }
    int _889 = _881;
    float _891 = _532 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_94)
    {
        _883 = -1;
    }
    int _893 = _883;
    float _895 = _787 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _897 = _893;
    if (!_94)
    {
        int _899 = ~_889;
        bool _901 = !_98;
        int _903 = _899 & (_901 ? (-1) : 0);
        _897 = _903;
    }
    int _905 = _897;
    float _907 = _787 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _909 = _100 != 0;
    float _911 = exp2(_891);
    float _913 = _659 * _661;
    float _915 = _775 * _737;
    float _917 = _779 * _737;
    float _919 = _781 * _737;
    float _921 = _913 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    int _923 = _905;
    if (_90)
    {
        _923 = -1;
    }
    int _925 = _923;
    int _927 = ~_905;
    float _929 = (_927 != 0) ? as_type<float>(_869) : 0.0;
    int _931 = _925;
    if (!_90)
    {
        bool _933 = !_98;
        bool _935 = _933 && _86;
        bool _937 = !_909;
        bool _939 = _935 && _937;
        _931 = _939 ? (-1) : 0;
    }
    int _941 = _931;
    float _943 = -_911;
    float _945 = _943 + 1.0;
    int _947 = ~_905;
    float _949 = (_947 != 0) ? as_type<float>(_871) : 0.0;
    float _951 = _945 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _953 = ~_905;
    float _955 = (_953 != 0) ? as_type<float>(_873) : 0.0;
    bool _957 = !_98;
    bool _959 = _86 && _957;
    int _961 = ~_941;
    float _963 = (_961 != 0) ? as_type<float>(_875) : 0.0;
    int _965 = ~_941;
    float _967 = (_965 != 0) ? as_type<float>(_877) : 0.0;
    int _969 = ~_941;
    float _971 = (_969 != 0) ? as_type<float>(_879) : 0.0;
    int _973 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _975 = _973 != 0;
    bool _977 = !_959;
    float _979 = _977 ? _895 : 0.0;
    float _981 = -_951;
    float _983 = _981 + 1.0;
    bool _985 = !_959;
    float _987 = _985 ? _907 : 0.0;
    float _989 = abs(_983);
    float _991 = log2(_989);
    bool _993 = !_975;
    float _995 = _987 * _929;
    bool _997 = !_975;
    float _999 = _987 * _949;
    bool _1001 = !_993;
    float _1003 = _1001 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1005 = fma(_963, _979, _995);
    bool _1007 = !_997;
    float _1009 = _1007 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1011 = fma(_967, _979, _999);
    bool _1013 = !_975;
    float _1015 = _1003 * _1005;
    float _1017 = _987 * _955;
    float _1019 = _1009 * _1011;
    bool _1021 = !_1013;
    float _1023 = _1021 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    int _1025 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1027 = _1025 != 0;
    float _1029 = fma(_971, _979, _1017);
    float _1031 = _991 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1033 = _1019 * 0.715200006961822509765625;
    float _1035 = _991 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1037 = _1023 * _1029;
    bool _1039 = !_1027;
    float _1041 = fma(_1015, 0.2125999927520751953125, _1033);
    float _1043 = exp2(_1031);
    float _1045 = fma(_1037, 0.072200000286102294921875, _1041);
    float _1047 = _1039 ? _917 : 0.0;
    float _1049 = -_1019;
    float _1051 = _1049 + _1045;
    float _1053 = exp2(_1035);
    float _1055 = -_1015;
    float _1057 = _1055 + _1045;
    float _1059 = -_1037;
    float _1061 = _1059 + _1045;
    float _1063 = fma(_921, _1051, _1019);
    bool _1065 = !_1027;
    float _1067 = fma(_921, _1057, _1015);
    float _1069 = fma(_921, _1061, _1037);
    bool _1071 = !_1027;
    bool _1073 = !_82;
    float _1075 = _1073 ? _1043 : 1.0;
    float _1077 = _1065 ? _919 : 0.0;
    float _1079 = _787 * _1075;
    float _1081 = _1075 * _1067;
    bool _1083 = !_82;
    float _1085 = _1083 ? _1053 : 1.0;
    float _1087 = _1075 * _1063;
    float _1089 = _86 ? _1079 : _1081;
    float _1091 = _1085 * _1047;
    float _1093 = _1085 * _1077;
    float _1095 = _86 ? _1079 : _1087;
    float _1097 = _1079;
    float _1099 = _1091;
    float _1101 = _951;
    if (!_86)
    {
        float _1103 = _1075 * _1069;
        _1097 = _1103;
    }
    float _1105 = _1097;
    float _1107 = _1071 ? _915 : 0.0;
    float _1109 = _1089 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1111 = _1095 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1113 = _1105 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1115 = fma(_1091, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1111);
    float _1117 = fma(_1093, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1113);
    int _1119 = as_type<int>(_1111);
    float _1121 = _1113;
    float _1123 = _1109;
    if (_82)
    {
        _1119 = as_type<int>(_783);
    }
    int _1125 = _1119;
    float _1127 = _1085 * _1107;
    int _1129 = _1125;
    int _1131 = _1125;
    if (_82)
    {
        _1121 = 0.0;
    }
    float _1133 = _1121;
    float _1135 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1109);
    bool _1137 = !_82;
    float _1139 = _1137 ? _951 : 0.0;
    float _1141 = _1135;
    float _1143 = _1133;
    if (_82)
    {
        _795 = 0.0;
    }
    float _1145 = _795;
    float _1147 = _1145;
    if (_82)
    {
        _1099 = 0.0;
    }
    float _1149 = _1099;
    float _1151 = _1149;
    if (_82)
    {
        _1101 = _1115;
    }
    float _1153 = _1101;
    float _1155 = _1153;
    float _1157 = _1153;
    if (_82)
    {
        _1123 = _1117;
    }
    float _1159 = _1123;
    float _1161 = _1159;
    float _1163 = _1159;
    if (!_82)
    {
        int _1165 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1167 = _1165 != 0;
        float _1169 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1171 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1173 = _1171 != 0;
        float _1175 = _675 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1177 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1179 = !_1173;
        float _1181 = _1179 ? _1175 : 0.0;
        bool _1183 = !_1173;
        float _1185 = _1183 ? _1169 : 0.0;
        bool _1187 = !_1173;
        float _1189 = _1187 ? _1177 : 0.0;
        float _1191 = _1139 * _1181;
        _1143 = _1191;
        if (!_1167)
        {
            _1129 = as_type<int>(_783);
        }
        int _1193 = _1129;
        float _1195 = _1139 * _1185;
        float _1197 = _1139 * _1189;
        _1147 = _1195;
        _1131 = _1193;
        _1151 = _1197;
        if (!_1167)
        {
            _1155 = _1115;
        }
        float _1199 = _1155;
        _1157 = _1199;
        if (!_1167)
        {
            _1161 = _1117;
        }
        float _1201 = _1161;
        bool _1203 = !_1167;
        _1163 = _1201;
        if (!_1203)
        {
            float _1205 = -_1139;
            float _1207 = _1205 + 1.0;
            float _1209 = precise::clamp(_1207, 0.0, 1.0);
            float _1211 = _783 * _1209;
            float _1213 = precise::max(_1211, 9.9999997473787516355514526367188e-05);
            float _1215 = 1.0 / _1213;
            float _1217 = _783 * _1215;
            float _1219 = _1135 * _1217;
            float _1221 = _1115 * _1217;
            float _1223 = _1117 * _1217;
            _1157 = _1221;
            _1147 = 0.0;
            _1131 = as_type<int>(_1211);
            _1141 = _1219;
            _1143 = 0.0;
            _1163 = _1223;
            _1151 = 0.0;
        }
    }
    float _1225 = _1157;
    float _1227 = _1147;
    int _1229 = _1131;
    float _1231 = _1141;
    float _1233 = _1143;
    float _1235 = _1163;
    float _1237 = _1151;
    int _1239 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1245 = _1243 != 0;
    float _1247 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1249 = _1225 + _1227;
    float _1251 = _667 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1253 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _1255 = !_1245;
    float _1257 = _1255 ? as_type<float>(_1229) : 1.0;
    float _1259 = _1231 + _1233;
    float _1261 = _1235 + _1237;
    float _1263 = -_1257;
    float _1265 = _1263 + 1.0;
    float _1267 = abs(_1265);
    float _1269 = log2(_1267);
    float _1271 = _1269 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1273 = exp2(_1271);
    float _1275 = -_1273;
    float _1277 = spvFAdd(_1275, 1.00010001659393310546875);
    float _1279 = -_1273;
    float _1281 = _1279 + 1.0;
    float _1283 = -_1257;
    float _1285 = _1283 + _1281;
    float _1287 = 1.0 / _1277;
    float _1289 = _1247 * _1285;
    float _1291 = _1251 * _1285;
    float _1293 = _1253 * _1285;
    float _1295 = fma(_1249, _1257, _1289);
    float _1297 = fma(_1259, _1257, _1291);
    float _1299 = fma(_1261, _1257, _1293);
    float _1301 = _1287 * _1295;
    float _1303 = _1287 * _1297;
    float _1305 = _1287 * _1299;
    float _1307 = _1301 * 0.715200006961822509765625;
    float _1309 = fma(_1303, 0.2125999927520751953125, _1307);
    float _1311 = fma(_1305, 0.072200000286102294921875, _1309);
    float _1313 = 1.0 / _1311;
    float _1315 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1317 = precise::clamp(_1315, 0.0, 1.0);
    float _1319 = fma(_1317, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1321 = _1303 * _1319;
    float _1323 = _1301 * _1319;
    float _1325 = _1305 * _1319;
    bool _1327 = !_1241;
    float _1329 = _1325;
    float _1331 = _1305;
    float _1333 = _1281;
    int _1335 = as_type<int>(_1305);
    int _1337 = as_type<int>(_1323);
    float _1339 = _1325;
    float _1341 = _1281;
    if (!_1327)
    {
        bool _1343 = _1281 != 1.0;
        bool _1345 = isnan(_1281);
        bool _1347 = _1343 || _1345;
        bool _1349 = isnan(1.0);
        bool _1351 = _1347 || _1349;
        float _1353 = -_1273;
        bool _1355 = _1353 != (-1.0);
        bool _1357 = isnan(_1353);
        bool _1359 = _1355 || _1357;
        bool _1361 = isnan(-1.0);
        bool _1363 = _1359 || _1361;
        float _1365 = -_1273;
        bool _1367 = _1365 == (-1.0);
        bool _1369 = !_1351;
        bool _1371 = _1367 || _1369;
        bool _1373 = _1281 == 1.0;
        bool _1375 = _1373 && _1363;
        bool _1377 = !_1371;
        float _1379 = _1377 ? _1281 : 0.0;
        bool _1381 = !_1375;
        float _1383 = _1381 ? 0.0 : 1.0;
        float _1385 = _1371 ? 0.0 : 0.5;
        float _1387 = _1379 * 0.715200006961822509765625;
        float _1389 = fma(_1383, 0.2125999927520751953125, _1387);
        float _1391 = fma(_1385, 0.072200000286102294921875, _1389);
        float _1393 = 1.0 / _1391;
        float _1395 = _1393 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        float _1399 = fma(_1397, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1401 = _1383 * _1399;
        float _1403 = _1379 * _1399;
        float _1405 = _1385 * _1399;
        out.m_42.x = _1401;
        out.m_42.y = _1403;
        out.m_42.z = _1405;
        out.m_42.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    bool _1407 = _100 != 0;
    bool _1409 = !_1407;
    if (!_1409)
    {
        if (_90)
        {
            _1329 = 0.0;
        }
        float _1411 = _1329;
        float _1413 = _1411;
        if (_90)
        {
            _1331 = 0.0;
        }
        float _1415 = _1331;
        float _1417 = _1415;
        if (!_90)
        {
            float _1419 = _967 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1417 = _1419;
        }
        float _1421 = _1417;
        float _1423 = _1421;
        if (!_90)
        {
            float _1425 = _963 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1413 = _1425;
        }
        float _1427 = _1413;
        float _1429 = _1427;
        if (!_94)
        {
            float _1431 = fma(_949, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1421);
            _1423 = _1431;
        }
        float _1433 = _1423;
        if (_90)
        {
            _1333 = 0.0;
        }
        float _1435 = _1333;
        float _1437 = _1435;
        if (!_90)
        {
            float _1439 = _971 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1437 = _1439;
        }
        float _1441 = _1437;
        float _1443 = _1433 * 0.715200006961822509765625;
        float _1445 = _1441;
        if (!_94)
        {
            float _1447 = fma(_929, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1427);
            _1429 = _1447;
        }
        float _1449 = _1429;
        if (!_94)
        {
            float _1451 = fma(_955, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1441);
            _1445 = _1451;
        }
        float _1453 = _1445;
        float _1455 = fma(_1449, 0.2125999927520751953125, _1443);
        float _1457 = fma(_1453, 0.072200000286102294921875, _1455);
        float _1459 = 1.0 / _1457;
        float _1461 = _1459 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1463 = precise::clamp(_1461, 0.0, 1.0);
        float _1465 = fma(_1463, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1467 = _1465 * _1449;
        float _1469 = _1465 * _1433;
        float _1471 = _1465 * _1453;
        out.m_42.x = _1467;
        out.m_42.y = _1469;
        out.m_42.z = _1471;
        out.m_42.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    if (!_98)
    {
        _1335 = as_type<int>(_1323);
    }
    int _1473 = _1335;
    float _1475 = as_type<float>(_1473);
    if (!_98)
    {
        _1337 = as_type<int>(_1325);
    }
    int _1477 = _1337;
    if (!_98)
    {
        out.m_42.x = _1321;
        out.m_42.y = as_type<float>(_1473);
        out.m_42.z = as_type<float>(_1477);
        out.m_42.w = _1281;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    if (_90)
    {
        _1339 = 0.0;
    }
    float _1479 = _1339;
    float _1481 = _1479;
    if (_90)
    {
        _1475 = 0.0;
    }
    float _1483 = _1475;
    float _1485 = _1483;
    if (!_90)
    {
        float _1487 = _967 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1485 = _1487;
    }
    float _1489 = _1485;
    float _1491 = _1489;
    if (!_90)
    {
        float _1493 = _963 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1481 = _1493;
    }
    float _1495 = _1481;
    float _1497 = _1495;
    if (!_94)
    {
        float _1499 = fma(_949, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1489);
        _1491 = _1499;
    }
    float _1501 = _1491;
    if (_90)
    {
        _1341 = 0.0;
    }
    float _1503 = _1341;
    float _1505 = _1503;
    if (!_90)
    {
        float _1507 = _971 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1505 = _1507;
    }
    float _1509 = _1505;
    float _1511 = _1501 * 0.715200006961822509765625;
    float _1513 = _1509;
    if (!_94)
    {
        float _1515 = fma(_929, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1495);
        _1497 = _1515;
    }
    float _1517 = _1497;
    if (!_94)
    {
        float _1519 = fma(_955, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1509);
        _1513 = _1519;
    }
    float _1521 = _1513;
    float _1523 = fma(_1517, 0.2125999927520751953125, _1511);
    float _1525 = fma(_1521, 0.072200000286102294921875, _1523);
    float _1527 = 1.0 / _1525;
    float _1529 = _1527 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1531 = precise::clamp(_1529, 0.0, 1.0);
    float _1533 = fma(_1531, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1535 = _1533 * _1517;
    float _1537 = _1533 * _1501;
    float _1539 = _1533 * _1521;
    out.m_42.x = _1535;
    out.m_42.y = _1537;
    out.m_42.z = _1539;
    out.m_42.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

