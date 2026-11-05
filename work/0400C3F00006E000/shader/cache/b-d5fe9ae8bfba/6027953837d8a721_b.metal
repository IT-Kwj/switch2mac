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
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_ESmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _48(thread const int& _3623, thread const int& _3624, thread const int& _3625, thread const int& _3626, thread int& _3627, thread int& _3628, thread int& _3629, thread int& _3630, thread int& _3631)
{
    float _3634 = as_type<float>(_3625) + 0.0;
    bool _3636 = _3634 != 0.0;
    bool _3638 = isnan(_3634);
    bool _3640 = _3636 || _3638;
    bool _3642 = isnan(0.0);
    bool _3644 = _3640 || _3642;
    int _3646 = as_type<int>(_3634);
    int _3648 = _3624;
    int _3650 = _3644 ? (-1) : 0;
    if (!_3644)
    {
        float _3652 = as_type<float>(_3625) * 1.0;
        _3646 = as_type<int>(_3652);
    }
    int _3654 = _3646;
    bool _3656 = !_3644;
    int _3658 = _3654;
    if (!_3656)
    {
        float _3660 = as_type<float>(_3625) + 0.0;
        bool _3662 = _3660 >= 0.0;
        bool _3664 = isnan(_3660);
        bool _3666 = _3662 || _3664;
        bool _3668 = isnan(0.0);
        bool _3670 = _3666 || _3668;
        int _3672 = as_type<int>(_3660);
        _3650 = _3670 ? (-1) : 0;
        if (!_3670)
        {
            _3672 = 2147483647;
        }
        int _3674 = _3672;
        bool _3676 = !_3670;
        _3658 = _3674;
        if (!_3676)
        {
            float _3678 = abs(as_type<float>(_3625));
            float _3680 = _3678 + 0.0;
            bool _3682 = _3680 > as_type<float>(0x7f800000u /* inf */);
            bool _3684 = isnan(_3680);
            bool _3686 = _3682 || _3684;
            bool _3688 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3690 = _3686 || _3688;
            int _3692 = as_type<int>(_3680);
            _3650 = _3690 ? (-1) : 0;
            if (_3690)
            {
                float _3694 = as_type<float>(_3625) + 1.0;
                _3692 = as_type<int>(_3694);
            }
            int _3696 = _3692;
            _3658 = _3696;
            if (!_3690)
            {
                float _3698 = abs(as_type<float>(_3625));
                float _3700 = _3698 + (-0.0);
                float _3702 = 0.0 + _3700;
                bool _3704 = _3702 != as_type<float>(0x7f800000u /* inf */);
                bool _3706 = isnan(_3702);
                bool _3708 = _3704 || _3706;
                bool _3710 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3712 = _3708 || _3710;
                int _3714 = as_type<int>(_3702);
                _3650 = _3712 ? (-1) : 0;
                if (!_3712)
                {
                    _3714 = _3625;
                }
                int _3716 = _3714;
                bool _3718 = !_3712;
                _3658 = _3716;
                if (!_3718)
                {
                    float _3720 = as_type<float>(_3625) * 18446744073709551616.0;
                    float _3722 = rsqrt(_3720);
                    float _3724 = _3720 * _3722;
                    float _3726 = _3722 * 0.5;
                    float _3728 = -_3724;
                    float _3730 = 0.0 + _3728;
                    float _3732 = fma(_3726, _3730, 0.5);
                    float _3734 = fma(_3724, _3732, _3724);
                    float _3736 = -_3734;
                    float _3738 = 0.0 + _3736;
                    float _3740 = fma(_3734, _3738, _3720);
                    float _3742 = fma(_3726, _3740, _3734);
                    float _3744 = _3742 * 2.3283064365386962890625e-10;
                    _3658 = as_type<int>(_3744);
                    _3648 = as_type<int>(_3734);
                }
            }
        }
    }
    int _3746 = _3658;
    int _3748 = _3648;
    int _3750 = _3650;
    _3627 = _3746;
    _3628 = _3626;
    _3629 = 0;
    _3630 = _3748;
    _3631 = _3750;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _699 = false;
    bool _266 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_37.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_37.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_37.z;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    int _72 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _76 = _72 != 0;
    int _78 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _80 = _78 != 0;
    int _82 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _84 = _82 != 0;
    int _86 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _88 = _86 != 0;
    int _90 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _92 = _90 != 0;
    int _94 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _96 = _94 != 0;
    int _98 = int(_76);
    float _100 = 1.0 / _52;
    float _102 = _100 * _58;
    float _104 = _100 * _64;
    float _106 = _100 * _70;
    float _108 = _102 * _102;
    float _110 = fma(_104, _104, _108);
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _114 = fma(_106, _106, _110);
    float _116 = precise::max(0.0, _112);
    float _118 = rsqrt(_114);
    float _120 = _104 * _118;
    float _122 = _106 * _118;
    float _124 = _102 * _118;
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _130 = -_124;
    float _132 = -_116;
    float _134 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[13].z, _132);
    float _136 = _126 * _126;
    float _138 = _128 * _128;
    float _140 = _136 + _138;
    float _142 = sqrt(_140);
    bool _144 = _142 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _146 = _118;
    float _148 = _116;
    float _150 = _134;
    float _152 = _126;
    float _154 = _128;
    if (!_144)
    {
        _146 = _138;
    }
    float _156 = _146;
    float _158 = _156;
    if (!_144)
    {
        _148 = _136;
    }
    float _160 = _148;
    bool _162 = !_144;
    float _164 = _160;
    if (!_162)
    {
        float _166 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _170 = _142 + _168;
        float _172 = _134 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = rsqrt(_140);
        float _176 = _170 * _166;
        float _178 = _176 * 0.15915493667125701904296875;
        float _180 = _178 * 6.283185482025146484375;
        float _182 = sin(_180);
        float _184 = _178 * 6.283185482025146484375;
        float _186 = cos(_184);
        float _188 = fma(_182, _172, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _190 = _174 * _188;
        float _192 = _186 + (-1.0);
        float _194 = _126 * _190;
        float _196 = _128 * _190;
        float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _200 = _196 * _196;
        float _202 = fma(_134, _186, _198);
        float _204 = _194 * _194;
        _150 = _202;
        _164 = _204;
        _158 = _200;
        _152 = _194;
        _154 = _196;
    }
    float _206 = _150;
    float _208 = _164;
    float _210 = _158;
    float _212 = _152;
    float _214 = _154;
    float _216 = fma(_206, _206, _208);
    float _218 = _216 + _210;
    float _220 = rsqrt(_218);
    float _222 = _220 * _206;
    float _224 = -_222;
    float _226 = precise::max(0.0, _224);
    float _228 = abs(_226);
    float _230 = -_228;
    float _232 = _230 + 1.0;
    float _234 = fma(_226, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _236 = as_type<int>(_232) + (-218103808);
    float _238 = fma(_226, _234, -0.212114393711090087890625);
    bool _240 = uint(_236) >= 1920991232u;
    float _242 = fma(_226, _238, 1.570728778839111328125);
    bool _244 = !_240;
    float _264;
    if (!_244)
    {
        int _246 = 0;
        int _248 = 0;
        int _250 = as_type<int>(_232);
        int _252 = 1200;
        int _254;
        int _256;
        int _258;
        int _260;
        int _262;
        _48(_246, _248, _250, _252, _254, _256, _258, _260, _262);
        _264 = as_type<float>(_254);
        _266 = true;
    }
    else
    {
        float _268 = rsqrt(_232);
        float _270 = _232 * _268;
        float _272 = _268 * 0.5;
        float _274 = -_270;
        float _276 = 0.0 + _274;
        float _278 = fma(_272, _276, 0.5);
        float _280 = fma(_270, _278, _270);
        float _282 = -_280;
        float _284 = 0.0 + _282;
        float _286 = fma(_280, _284, _232);
        float _288 = fma(_272, _286, _280);
        _264 = _288;
    }
    _266 = false;
    float _290 = _264;
    bool _292 = _222 > 0.0;
    if (_292)
    {
        discard_fragment();
    }
    if (_292)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    float _294 = -_124;
    float _296 = _294 + 1.0;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = -_124;
    float _302 = fma(_300, _124, 1.0);
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _122 * _122;
    int _308 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _310 = _308 != 0;
    float _312 = _120 * _120;
    float _314 = _220 * _212;
    float _316 = _242 * _290;
    float _318 = _220 * _214;
    float _320 = _306 + _312;
    float _322 = _316 * 0.636619746685028076171875;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = rsqrt(_320);
    float _328 = -_324;
    float _330 = _328 + 1.0;
    float _332 = _298;
    if (_310)
    {
        float _334 = sqrt(_304);
        _332 = _334;
    }
    float _336 = _332;
    float _338 = sqrt(_330);
    float _340 = _122 * _326;
    float _342 = _120 * _326;
    float _344 = abs(_336);
    float _346 = log2(_344);
    float _348 = -_338;
    float _350 = _348 + 1.0;
    float _352 = _350 * 0.5;
    float _354 = _346 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _356 = abs(_340);
    float _358 = abs(_342);
    float _360 = precise::max(_356, _358);
    float _362 = precise::max(_360, 9.9999997473787516355514526367188e-05);
    float _364 = exp2(_354);
    float _366 = 1.0 / _362;
    float _368 = _364 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _370 = _314 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _372 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = -_370;
    float _378 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[11].y, _376);
    float _380 = -_374;
    float _382 = _380 + 1.0;
    float _384 = -_318;
    float _386 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[11].z, _378);
    float _388 = _342 * _366;
    float _390 = _222 + 1.0;
    float _392 = abs(_382);
    float _394 = log2(_392);
    float _396 = fma(_386, -0.5, 0.5);
    float _398 = fma(_386, 0.5, 0.5);
    float _400 = fma(_388, _352, 0.5);
    float _402 = fma(_398, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _404 = sqrt(_396);
    float _406 = -_366;
    float _408 = _340 * _406;
    float _410 = fma(_398, _402, -0.212114393711090087890625);
    float _412 = fma(_222, -0.5, 0.5);
    float _414 = fma(_408, _352, 0.5);
    float _416 = fma(_398, _410, 1.570728778839111328125);
    float _418 = _394 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _420 = exp2(_418);
    float _422 = _404 * 0.636619746685028076171875;
    float _424 = -_416;
    float _426 = fma(_422, _424, 1.0);
    float2 _1967;
    _1967.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_414, _400));
    _1967.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_414, _400));
    float _428 = _1967.x;
    float _430 = _428 * 256.0;
    int _432 = int(_430);
    float _434 = -_222;
    float _436 = fma(_420, _390, _434);
    float _438 = fma(_436, 0.5, 0.5);
    float2 _1985 = float2(_426, _412);
    float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1985, float2(0.0), isnan(_1985))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1985, float2(0.0), isnan(_1985))).xyz;
    float _444 = _442.x;
    float _446 = _442.y;
    float _448 = _442.z;
    float2 _2001 = float2(_426, _438);
    float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2001, float2(0.0), isnan(_2001))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2001, float2(0.0), isnan(_2001))).xyz;
    float _452 = _450.x;
    float _454 = _450.y;
    float _456 = _450.z;
    float _458 = -_124;
    float _460 = _120 * _458;
    float _462 = _120 * _124;
    float _464 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _466 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _468 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _470 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _472 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _474 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _476 = fma(_124, _468, _464);
    float _478 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _480 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _482 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _484 = -_122;
    float _486 = fma(_484, _470, _476);
    float _488 = fma(_124, _478, _466);
    float _490 = fma(_122, _470, _476);
    float _492 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _494 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _496 = fma(_124, _480, _472);
    float _498 = -_122;
    float _500 = fma(_498, _474, _488);
    float _502 = fma(_122, _474, _488);
    float _504 = -_120;
    float _506 = fma(_504, _492, _486);
    float _508 = -_122;
    float _510 = fma(_508, _494, _496);
    float _512 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _514 = fma(_122, _494, _496);
    float _516 = -_120;
    float _518 = fma(_516, _482, _500);
    float _520 = fma(_120, _482, _502);
    float _522 = -_120;
    float _524 = fma(_522, _512, _510);
    float _526 = fma(_120, _512, _514);
    float _528 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _530 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _532 = fma(_120, _492, _490);
    float _534 = -_122;
    float _536 = _124 * _534;
    float _538 = fma(_528, _460, _506);
    float _540 = fma(_530, _460, _518);
    float _542 = fma(_530, _462, _520);
    float _544 = fma(_528, _462, _532);
    float _546 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _548 = _124 * _122;
    float _550 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _552 = fma(_546, _536, _538);
    float _554 = fma(_546, _548, _544);
    float _556 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _558 = fma(_550, _462, _526);
    float _560 = fma(_550, _460, _524);
    float _562 = fma(_556, _536, _540);
    float _564 = fma(_556, _548, _542);
    float _566 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _568 = fma(_566, _548, _558);
    float _570 = fma(_566, _536, _560);
    float _572 = float(uint(_432));
    float _574 = _572 * 0.00390625;
    float2 _2218 = float2(_414, _400);
    float2 _578 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2218, float2(0.0), isnan(_2218)), level(_574)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2218, float2(0.0), isnan(_2218)), level(_574)).xy;
    float _580 = _578.x;
    float _582 = _578.y;
    float2 _2231 = float2(_414, _400);
    float4 _585 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2231, float2(0.0), isnan(_2231)), level(_574)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2231, float2(0.0), isnan(_2231)), level(_574)).xyzw;
    float _587 = _585.x;
    float _589 = _585.y;
    float _591 = _585.z;
    float _593 = _585.w;
    float _595 = _120 * _122;
    float _597 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _599 = -_124;
    float _601 = fma(_599, _124, _312);
    int _603 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _605 = _603 != 0;
    float _607 = fma(_597, _595, _552);
    float _609 = fma(_597, _595, _554);
    float _611 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _613 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _615 = fma(_306, 3.0, -1.0);
    float _617 = _122 * (-3.0);
    float _619 = fma(_611, _595, _562);
    float _621 = fma(_611, _595, _564);
    float _623 = -_122;
    float _625 = fma(_623, _617, -1.0);
    float _627 = fma(_613, _595, _570);
    float _629 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _631 = fma(_613, _595, _568);
    float _633 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _635 = fma(_629, _625, _607);
    float _637 = fma(_629, _615, _609);
    float _639 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _641 = fma(_633, _625, _627);
    float _643 = fma(_633, _615, _631);
    float _645 = fma(_639, _625, _619);
    float _647 = fma(_639, _615, _621);
    float _649 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _651 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _653 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _655 = fma(_649, _601, _635);
    float _657 = fma(_649, _601, _637);
    float _659 = fma(_651, _601, _645);
    float _661 = fma(_651, _601, _647);
    float _663 = fma(_653, _601, _641);
    float _665 = fma(_653, _601, _643);
    float _667 = _582 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _669 = !_605;
    int _671 = as_type<int>(_665);
    int _673 = _605 ? (-1) : 0;
    int _687;
    int _689;
    int _691;
    int _693;
    int _695;
    int _697;
    if (!_669)
    {
        float _675 = _506 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _677 = _518 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _679 = _524 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _681 = _532 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _683 = _520 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _685 = _526 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _687 = as_type<int>(_681);
        _689 = as_type<int>(_683);
        _691 = as_type<int>(_677);
        _693 = as_type<int>(_675);
        _695 = as_type<int>(_679);
        _697 = as_type<int>(_685);
        _699 = true;
    }
    else
    {
        int _701 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _703 = _701 != 0;
        float _705 = _659 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _707 = _663 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _709 = _655 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _711 = _661 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _713 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _715 = _665 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _717 = _657 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _719 = as_type<int>(_705);
        int _721 = as_type<int>(_707);
        int _723 = as_type<int>(_709);
        int _725 = as_type<int>(_717);
        _673 = _703 ? (-1) : 0;
        _697 = as_type<int>(_715);
        if (_703)
        {
            float _727 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _719 = as_type<int>(_727);
        }
        int _729 = _719;
        _691 = _729;
        if (_703)
        {
            float _731 = _472 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _721 = as_type<int>(_731);
        }
        int _733 = _721;
        _695 = _733;
        if (_703)
        {
            float _735 = _713 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _723 = as_type<int>(_735);
        }
        int _737 = _723;
        _693 = _737;
        if (!_703)
        {
            _671 = as_type<int>(_711);
        }
        int _739 = _671;
        int _741 = _739;
        if (_703)
        {
            _741 = _729;
        }
        int _743 = _741;
        _689 = _743;
        if (_703)
        {
            _725 = _737;
        }
        int _745 = _725;
        _687 = _745;
        if (_703)
        {
            _697 = _733;
        }
    }
    _699 = false;
    int _747 = _673;
    int _749 = _687;
    int _751 = _689;
    int _753 = _691;
    int _755 = _693;
    int _757 = _695;
    int _759 = _697;
    float _761 = in.m_42.x;
    float _763 = gl_FragCoord.w;
    float _765 = _761 * _763;
    float _767 = in.m_42.y;
    float _769 = gl_FragCoord.w;
    float _771 = _767 * _769;
    int _773 = 0;
    int _775 = _747;
    if (!_92)
    {
        int _777 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _779 = _777 != 0;
        _773 = _779 ? (-1) : 0;
    }
    int _781 = _773;
    if (_92)
    {
        _775 = -1;
    }
    int _783 = _775;
    int _785 = _783;
    if (!_92)
    {
        int _787 = ~_781;
        bool _789 = !_96;
        int _791 = _787 & (_789 ? (-1) : 0);
        _785 = _791;
    }
    int _793 = _785;
    bool _795 = _98 != 0;
    float _797 = _100 * _765;
    float _799 = _100 * _771;
    float2 _2596 = float2(_797, _799);
    float2 _801 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2596, float2(0.0), isnan(_2596))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2596, float2(0.0), isnan(_2596))).xy;
    float _803 = _801.x;
    float _805 = _801.y;
    float _807 = fma(_803, 2.0, -1.0);
    float _809 = fma(_805, 2.0, -1.0);
    float _811 = fma(_807, (*spvDescriptorSet0.fp_c3)._m0[22].x, _797);
    float _813 = fma(_809, (*spvDescriptorSet0.fp_c3)._m0[22].y, _799);
    float2 _2624 = float2(_811, _813);
    float4 _815 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2624, float2(0.0), isnan(_2624))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2624, float2(0.0), isnan(_2624))).xyzw;
    float _817 = _815.x;
    float _819 = _815.y;
    float _821 = _815.z;
    float _823 = _815.w;
    float _825 = _394 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _827 = _593 * _593;
    float _829 = exp2(_825);
    int _831 = _793;
    if (_88)
    {
        _831 = -1;
    }
    int _833 = _831;
    float _835 = _827 * _827;
    int _837 = _833;
    if (!_88)
    {
        bool _839 = !_96;
        bool _841 = _839 && _84;
        bool _843 = !_795;
        bool _845 = _841 && _843;
        _837 = _845 ? (-1) : 0;
    }
    int _847 = _837;
    int _849 = ~_793;
    float _851 = (_849 != 0) ? as_type<float>(_749) : 0.0;
    float _853 = _835 * 16.0;
    int _855 = ~_793;
    float _857 = (_855 != 0) ? as_type<float>(_751) : 0.0;
    float _859 = _587 * _853;
    float _861 = _589 * _853;
    float _863 = _591 * _853;
    float _865 = -_829;
    float _867 = _865 + 1.0;
    float _869 = _867 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _871 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _873 = _871 != 0;
    int _875 = ~_847;
    float _877 = (_875 != 0) ? as_type<float>(_753) : 0.0;
    float _879 = -_869;
    float _881 = _879 + 1.0;
    int _883 = ~_847;
    float _885 = (_883 != 0) ? as_type<float>(_755) : 0.0;
    bool _887 = !_96;
    bool _889 = _84 && _887;
    int _891 = ~_847;
    float _893 = (_891 != 0) ? as_type<float>(_757) : 0.0;
    float _895 = abs(_881);
    float _897 = log2(_895);
    bool _899 = !_873;
    float _901 = _899 ? _580 : 0.0;
    int _903 = ~_793;
    float _905 = (_903 != 0) ? as_type<float>(_759) : 0.0;
    float _907 = _901 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _909 = _901 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _911 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _913 = _911 != 0;
    bool _915 = !_889;
    float _917 = _915 ? _907 : 0.0;
    bool _919 = !_889;
    float _921 = _919 ? _909 : 0.0;
    float _923 = _897 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _925 = _897 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _927 = !_913;
    float _929 = _921 * _857;
    float _931 = exp2(_923);
    bool _933 = !_913;
    float _935 = _921 * _851;
    bool _937 = !_927;
    float _939 = _937 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _941 = _921 * _905;
    float _943 = fma(_877, _917, _929);
    bool _945 = !_933;
    float _947 = _945 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _949 = fma(_885, _917, _935);
    float _951 = exp2(_925);
    bool _953 = !_913;
    int _955 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _957 = _955 != 0;
    float _959 = _939 * _943;
    float _961 = _947 * _949;
    bool _963 = !_80;
    float _965 = _963 ? _931 : 1.0;
    bool _967 = !_957;
    float _969 = _965 * _901;
    float _971 = _965 * _959;
    bool _973 = !_953;
    float _975 = _973 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _977 = fma(_893, _917, _941);
    bool _979 = !_80;
    float _981 = _979 ? _951 : 1.0;
    float _983 = _965 * _961;
    float _985 = _975 * _977;
    float _987 = _967 ? _861 : 0.0;
    float _989 = _84 ? _969 : _971;
    float _991 = _981 * _987;
    bool _993 = !_957;
    float _995 = _989 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _997 = _84 ? _969 : _983;
    float _999 = _969;
    int _1001 = as_type<int>(_991);
    float _1003 = _977;
    float _1005 = _901;
    if (!_84)
    {
        float _1007 = _965 * _985;
        _999 = _1007;
    }
    float _1009 = _999;
    float _1011 = _993 ? _863 : 0.0;
    float _1013 = fma(_991, (*spvDescriptorSet0.fp_c3)._m0[27].y, _995);
    bool _1015 = !_957;
    float _1017 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1019 = _981 * _1011;
    float _1021 = _1017;
    float _1023 = _1013;
    if (_80)
    {
        _1001 = as_type<int>(_667);
    }
    int _1025 = _1001;
    float _1027 = _997 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1029 = fma(_1019, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1017);
    float _1031 = _1015 ? _859 : 0.0;
    float _1033 = _981 * _1031;
    int _1035 = _1025;
    int _1037 = _1025;
    float _1039 = _1029;
    if (_80)
    {
        _1003 = 0.0;
    }
    float _1041 = _1003;
    float _1043 = fma(_1033, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1027);
    float _1045 = _1043;
    float _1047 = _1041;
    if (_80)
    {
        _1005 = 0.0;
    }
    float _1049 = _1005;
    float _1051 = _1049;
    if (_80)
    {
        _1021 = 0.0;
    }
    float _1053 = _1021;
    bool _1055 = !_80;
    float _1057 = _1055 ? _869 : 0.0;
    float _1059 = _1053;
    if (!_80)
    {
        int _1061 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1063 = _1061 != 0;
        float _1065 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1067 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1069 = _1067 != 0;
        float _1071 = _452 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1073 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1075 = !_1069;
        float _1077 = _1075 ? _1071 : 0.0;
        bool _1079 = !_1069;
        float _1081 = _1079 ? _1065 : 0.0;
        bool _1083 = !_1069;
        float _1085 = _1083 ? _1073 : 0.0;
        float _1087 = _1057 * _1077;
        _1047 = _1087;
        if (!_1063)
        {
            _1035 = as_type<int>(_667);
        }
        int _1089 = _1035;
        float _1091 = _1057 * _1081;
        float _1093 = _1057 * _1085;
        bool _1095 = !_1063;
        _1051 = _1091;
        _1037 = _1089;
        _1059 = _1093;
        if (!_1095)
        {
            float _1097 = -_1057;
            float _1099 = _1097 + 1.0;
            float _1101 = precise::clamp(_1099, 0.0, 1.0);
            float _1103 = _667 * _1101;
            float _1105 = precise::max(_1103, 9.9999997473787516355514526367188e-05);
            float _1107 = 1.0 / _1105;
            float _1109 = _667 * _1107;
            float _1111 = _1043 * _1109;
            float _1113 = _1013 * _1109;
            float _1115 = _1029 * _1109;
            _1023 = _1113;
            _1051 = 0.0;
            _1045 = _1111;
            _1047 = 0.0;
            _1037 = as_type<int>(_1103);
            _1039 = _1115;
            _1059 = 0.0;
        }
    }
    float _1117 = _1023;
    float _1119 = _1051;
    float _1121 = _1045;
    float _1123 = _1047;
    int _1125 = _1037;
    float _1127 = _1039;
    float _1129 = _1059;
    int _1131 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1133 = _1131 != 0;
    int _1135 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1137 = _1135 != 0;
    float _1139 = _1117 + _1119;
    float _1141 = _444 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1143 = _1121 + _1123;
    float _1145 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _1147 = !_1137;
    float _1149 = _1147 ? as_type<float>(_1125) : 1.0;
    float _1151 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1153 = _1127 + _1129;
    float _1155 = -_1149;
    float _1157 = _1155 + 1.0;
    float _1159 = abs(_1157);
    float _1161 = log2(_1159);
    float _1163 = _1161 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1165 = exp2(_1163);
    float _1167 = -_1165;
    float _1169 = spvFAdd(_1167, 1.00010001659393310546875);
    float _1171 = -_1165;
    float _1173 = _1171 + 1.0;
    float _1175 = -_1149;
    float _1177 = _1175 + _1173;
    float _1179 = 1.0 / _1169;
    float _1181 = _1177 * _1151;
    float _1183 = _1177 * _1141;
    float _1185 = _1177 * _1145;
    float _1187 = fma(_1139, _1149, _1181);
    float _1189 = fma(_1143, _1149, _1183);
    float _1191 = fma(_1153, _1149, _1185);
    float _1193 = _1179 * _1187;
    float _1195 = _1179 * _1189;
    float _1197 = _1179 * _1191;
    float _1199 = _1193 * 0.715200006961822509765625;
    float _1201 = fma(_1195, 0.2125999927520751953125, _1199);
    float _1203 = fma(_1197, 0.072200000286102294921875, _1201);
    float _1205 = 1.0 / _1203;
    float _1207 = _1205 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1209 = precise::clamp(_1207, 0.0, 1.0);
    float _1211 = fma(_1209, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1213 = _1211 * _823;
    float _1215 = fma(_1193, _1213, _819);
    float _1217 = fma(_1195, _1213, _817);
    float _1219 = fma(_1197, _1213, _821);
    bool _1221 = !_1133;
    float _1223 = _1165;
    float _1225 = _1197;
    float _1227 = _1195;
    int _1229 = as_type<int>(_1165);
    int _1231 = as_type<int>(_1197);
    int _1233 = as_type<int>(_1195);
    if (!_1221)
    {
        bool _1235 = _1173 != 1.0;
        bool _1237 = isnan(_1173);
        bool _1239 = _1235 || _1237;
        bool _1241 = isnan(1.0);
        bool _1243 = _1239 || _1241;
        float _1245 = -_1165;
        bool _1247 = _1245 != (-1.0);
        bool _1249 = isnan(_1245);
        bool _1251 = _1247 || _1249;
        bool _1253 = isnan(-1.0);
        bool _1255 = _1251 || _1253;
        float _1257 = -_1165;
        bool _1259 = _1257 == (-1.0);
        bool _1261 = !_1243;
        bool _1263 = _1259 || _1261;
        bool _1265 = _1173 == 1.0;
        bool _1267 = _1265 && _1255;
        bool _1269 = !_1263;
        float _1271 = _1269 ? _1173 : 0.0;
        bool _1273 = !_1267;
        float _1275 = _1273 ? 0.0 : 1.0;
        float _1277 = _1263 ? 0.0 : 0.5;
        float _1279 = _1271 * 0.715200006961822509765625;
        float _1281 = fma(_1275, 0.2125999927520751953125, _1279);
        float _1283 = fma(_1277, 0.072200000286102294921875, _1281);
        float _1285 = 1.0 / _1283;
        float _1287 = _1285 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1289 = precise::clamp(_1287, 0.0, 1.0);
        float _1291 = fma(_1289, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1293 = _1275 * _1291;
        float _1295 = _1271 * _1291;
        float _1297 = _1277 * _1291;
        out.m_40.x = _1293;
        out.m_40.y = _1295;
        out.m_40.z = _1297;
        out.m_40.w = 1.0;
        return out;
    }
    bool _1299 = _98 != 0;
    bool _1301 = !_1299;
    if (!_1301)
    {
        if (_88)
        {
            _1223 = 0.0;
        }
        float _1303 = _1223;
        float _1305 = _1303;
        if (_88)
        {
            _1225 = 0.0;
        }
        float _1307 = _1225;
        float _1309 = _1307;
        if (!_88)
        {
            float _1311 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1309 = _1311;
        }
        float _1313 = _1309;
        float _1315 = _1313;
        if (!_88)
        {
            float _1317 = _885 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1305 = _1317;
        }
        float _1319 = _1305;
        float _1321 = _1319;
        if (!_92)
        {
            float _1323 = fma(_857, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1313);
            _1315 = _1323;
        }
        float _1325 = _1315;
        if (_88)
        {
            _1227 = 0.0;
        }
        float _1327 = _1227;
        float _1329 = _1327;
        if (!_88)
        {
            float _1331 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1329 = _1331;
        }
        float _1333 = _1329;
        float _1335 = _1325 * 0.715200006961822509765625;
        float _1337 = _1333;
        if (!_92)
        {
            float _1339 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1319);
            _1321 = _1339;
        }
        float _1341 = _1321;
        if (!_92)
        {
            float _1343 = fma(_905, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1333);
            _1337 = _1343;
        }
        float _1345 = _1337;
        float _1347 = fma(_1341, 0.2125999927520751953125, _1335);
        float _1349 = fma(_1345, 0.072200000286102294921875, _1347);
        float _1351 = 1.0 / _1349;
        float _1353 = _1351 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1355 = precise::clamp(_1353, 0.0, 1.0);
        float _1357 = fma(_1355, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1359 = _1357 * _1341;
        float _1361 = _1357 * _1325;
        float _1363 = _1357 * _1345;
        out.m_40.x = _1359;
        out.m_40.y = _1361;
        out.m_40.z = _1363;
        out.m_40.w = 1.0;
        return out;
    }
    if (!_96)
    {
        _1229 = as_type<int>(_1217);
    }
    int _1365 = _1229;
    float _1367 = as_type<float>(_1365);
    if (!_96)
    {
        _1231 = as_type<int>(_1215);
    }
    int _1369 = _1231;
    float _1371 = as_type<float>(_1369);
    if (!_96)
    {
        _1233 = as_type<int>(_1173);
    }
    int _1373 = _1233;
    float _1375 = as_type<float>(_1373);
    if (!_96)
    {
        out.m_40.x = as_type<float>(_1365);
        out.m_40.y = as_type<float>(_1369);
        out.m_40.z = _1219;
        out.m_40.w = as_type<float>(_1373);
        return out;
    }
    if (_88)
    {
        _1367 = 0.0;
    }
    float _1377 = _1367;
    float _1379 = _1377;
    if (_88)
    {
        _1371 = 0.0;
    }
    float _1381 = _1371;
    float _1383 = _1381;
    if (!_88)
    {
        float _1385 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1383 = _1385;
    }
    float _1387 = _1383;
    float _1389 = _1387;
    if (!_88)
    {
        float _1391 = _885 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1379 = _1391;
    }
    float _1393 = _1379;
    float _1395 = _1393;
    if (!_92)
    {
        float _1397 = fma(_857, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1387);
        _1389 = _1397;
    }
    float _1399 = _1389;
    if (_88)
    {
        _1375 = 0.0;
    }
    float _1401 = _1375;
    float _1403 = _1401;
    if (!_88)
    {
        float _1405 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = _1399 * 0.715200006961822509765625;
    float _1411 = _1407;
    if (!_92)
    {
        float _1413 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1393);
        _1395 = _1413;
    }
    float _1415 = _1395;
    if (!_92)
    {
        float _1417 = fma(_905, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1407);
        _1411 = _1417;
    }
    float _1419 = _1411;
    float _1421 = fma(_1415, 0.2125999927520751953125, _1409);
    float _1423 = fma(_1419, 0.072200000286102294921875, _1421);
    float _1425 = 1.0 / _1423;
    float _1427 = _1425 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1429 = precise::clamp(_1427, 0.0, 1.0);
    float _1431 = fma(_1429, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1433 = _1431 * _1415;
    float _1435 = _1431 * _1399;
    float _1437 = _1431 * _1419;
    out.m_40.x = _1433;
    out.m_40.y = _1435;
    out.m_40.z = _1437;
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
    bool _699 = false;
    bool _266 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_37.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_37.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_37.z;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    int _72 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _76 = _72 != 0;
    int _78 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _80 = _78 != 0;
    int _82 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _84 = _82 != 0;
    int _86 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _88 = _86 != 0;
    int _90 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _92 = _90 != 0;
    int _94 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _96 = _94 != 0;
    int _98 = int(_76);
    float _100 = 1.0 / _52;
    float _102 = _100 * _58;
    float _104 = _100 * _64;
    float _106 = _100 * _70;
    float _108 = _102 * _102;
    float _110 = fma(_104, _104, _108);
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _114 = fma(_106, _106, _110);
    float _116 = precise::max(0.0, _112);
    float _118 = rsqrt(_114);
    float _120 = _104 * _118;
    float _122 = _106 * _118;
    float _124 = _102 * _118;
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _130 = -_124;
    float _132 = -_116;
    float _134 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[13].z, _132);
    float _136 = _126 * _126;
    float _138 = _128 * _128;
    float _140 = _136 + _138;
    float _142 = sqrt(_140);
    bool _144 = _142 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _146 = _118;
    float _148 = _116;
    float _150 = _134;
    float _152 = _126;
    float _154 = _128;
    if (!_144)
    {
        _146 = _138;
    }
    float _156 = _146;
    float _158 = _156;
    if (!_144)
    {
        _148 = _136;
    }
    float _160 = _148;
    bool _162 = !_144;
    float _164 = _160;
    if (!_162)
    {
        float _166 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _170 = _142 + _168;
        float _172 = _134 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = rsqrt(_140);
        float _176 = _170 * _166;
        float _178 = _176 * 0.15915493667125701904296875;
        float _180 = _178 * 6.283185482025146484375;
        float _182 = sin(_180);
        float _184 = _178 * 6.283185482025146484375;
        float _186 = cos(_184);
        float _188 = fma(_182, _172, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _190 = _174 * _188;
        float _192 = _186 + (-1.0);
        float _194 = _126 * _190;
        float _196 = _128 * _190;
        float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _200 = _196 * _196;
        float _202 = fma(_134, _186, _198);
        float _204 = _194 * _194;
        _150 = _202;
        _164 = _204;
        _158 = _200;
        _152 = _194;
        _154 = _196;
    }
    float _206 = _150;
    float _208 = _164;
    float _210 = _158;
    float _212 = _152;
    float _214 = _154;
    float _216 = fma(_206, _206, _208);
    float _218 = _216 + _210;
    float _220 = rsqrt(_218);
    float _222 = _220 * _206;
    float _224 = -_222;
    float _226 = precise::max(0.0, _224);
    float _228 = abs(_226);
    float _230 = -_228;
    float _232 = _230 + 1.0;
    float _234 = fma(_226, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _236 = as_type<int>(_232) + (-218103808);
    float _238 = fma(_226, _234, -0.212114393711090087890625);
    bool _240 = uint(_236) >= 1920991232u;
    float _242 = fma(_226, _238, 1.570728778839111328125);
    bool _244 = !_240;
    float _264;
    if (!_244)
    {
        int _246 = 0;
        int _248 = 0;
        int _250 = as_type<int>(_232);
        int _252 = 1200;
        int _254;
        int _256;
        int _258;
        int _260;
        int _262;
        _48(_246, _248, _250, _252, _254, _256, _258, _260, _262);
        _264 = as_type<float>(_254);
        _266 = true;
    }
    else
    {
        float _268 = rsqrt(_232);
        float _270 = _232 * _268;
        float _272 = _268 * 0.5;
        float _274 = -_270;
        float _276 = 0.0 + _274;
        float _278 = fma(_272, _276, 0.5);
        float _280 = fma(_270, _278, _270);
        float _282 = -_280;
        float _284 = 0.0 + _282;
        float _286 = fma(_280, _284, _232);
        float _288 = fma(_272, _286, _280);
        _264 = _288;
    }
    _266 = false;
    float _290 = _264;
    bool _292 = _222 > 0.0;
    if (_292)
    {
        discard_fragment();
    }
    if (_292)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    float _294 = -_124;
    float _296 = _294 + 1.0;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = -_124;
    float _302 = fma(_300, _124, 1.0);
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _122 * _122;
    int _308 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _310 = _308 != 0;
    float _312 = _120 * _120;
    float _314 = _220 * _212;
    float _316 = _242 * _290;
    float _318 = _220 * _214;
    float _320 = _306 + _312;
    float _322 = _316 * 0.636619746685028076171875;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = rsqrt(_320);
    float _328 = -_324;
    float _330 = _328 + 1.0;
    float _332 = _298;
    if (_310)
    {
        float _334 = sqrt(_304);
        _332 = _334;
    }
    float _336 = _332;
    float _338 = sqrt(_330);
    float _340 = _122 * _326;
    float _342 = _120 * _326;
    float _344 = abs(_336);
    float _346 = log2(_344);
    float _348 = -_338;
    float _350 = _348 + 1.0;
    float _352 = _350 * 0.5;
    float _354 = _346 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _356 = abs(_340);
    float _358 = abs(_342);
    float _360 = precise::max(_356, _358);
    float _362 = precise::max(_360, 9.9999997473787516355514526367188e-05);
    float _364 = exp2(_354);
    float _366 = 1.0 / _362;
    float _368 = _364 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _370 = _314 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _372 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = -_370;
    float _378 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[11].y, _376);
    float _380 = -_374;
    float _382 = _380 + 1.0;
    float _384 = -_318;
    float _386 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[11].z, _378);
    float _388 = _342 * _366;
    float _390 = _222 + 1.0;
    float _392 = abs(_382);
    float _394 = log2(_392);
    float _396 = fma(_386, -0.5, 0.5);
    float _398 = fma(_386, 0.5, 0.5);
    float _400 = fma(_388, _352, 0.5);
    float _402 = fma(_398, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _404 = sqrt(_396);
    float _406 = -_366;
    float _408 = _340 * _406;
    float _410 = fma(_398, _402, -0.212114393711090087890625);
    float _412 = fma(_222, -0.5, 0.5);
    float _414 = fma(_408, _352, 0.5);
    float _416 = fma(_398, _410, 1.570728778839111328125);
    float _418 = _394 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _420 = exp2(_418);
    float _422 = _404 * 0.636619746685028076171875;
    float _424 = -_416;
    float _426 = fma(_422, _424, 1.0);
    float2 _1967;
    _1967.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_414, _400));
    _1967.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_414, _400));
    float _428 = _1967.x;
    float _430 = _428 * 256.0;
    int _432 = int(_430);
    float _434 = -_222;
    float _436 = fma(_420, _390, _434);
    float _438 = fma(_436, 0.5, 0.5);
    float2 _1985 = float2(_426, _412);
    float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1985, float2(0.0), isnan(_1985))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1985, float2(0.0), isnan(_1985))).xyz;
    float _444 = _442.x;
    float _446 = _442.y;
    float _448 = _442.z;
    float2 _2001 = float2(_426, _438);
    float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2001, float2(0.0), isnan(_2001))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2001, float2(0.0), isnan(_2001))).xyz;
    float _452 = _450.x;
    float _454 = _450.y;
    float _456 = _450.z;
    float _458 = -_124;
    float _460 = _120 * _458;
    float _462 = _120 * _124;
    float _464 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _466 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _468 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _470 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _472 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _474 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _476 = fma(_124, _468, _464);
    float _478 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _480 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _482 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _484 = -_122;
    float _486 = fma(_484, _470, _476);
    float _488 = fma(_124, _478, _466);
    float _490 = fma(_122, _470, _476);
    float _492 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _494 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _496 = fma(_124, _480, _472);
    float _498 = -_122;
    float _500 = fma(_498, _474, _488);
    float _502 = fma(_122, _474, _488);
    float _504 = -_120;
    float _506 = fma(_504, _492, _486);
    float _508 = -_122;
    float _510 = fma(_508, _494, _496);
    float _512 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _514 = fma(_122, _494, _496);
    float _516 = -_120;
    float _518 = fma(_516, _482, _500);
    float _520 = fma(_120, _482, _502);
    float _522 = -_120;
    float _524 = fma(_522, _512, _510);
    float _526 = fma(_120, _512, _514);
    float _528 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _530 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _532 = fma(_120, _492, _490);
    float _534 = -_122;
    float _536 = _124 * _534;
    float _538 = fma(_528, _460, _506);
    float _540 = fma(_530, _460, _518);
    float _542 = fma(_530, _462, _520);
    float _544 = fma(_528, _462, _532);
    float _546 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _548 = _124 * _122;
    float _550 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _552 = fma(_546, _536, _538);
    float _554 = fma(_546, _548, _544);
    float _556 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _558 = fma(_550, _462, _526);
    float _560 = fma(_550, _460, _524);
    float _562 = fma(_556, _536, _540);
    float _564 = fma(_556, _548, _542);
    float _566 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _568 = fma(_566, _548, _558);
    float _570 = fma(_566, _536, _560);
    float _572 = float(uint(_432));
    float _574 = _572 * 0.00390625;
    float2 _2218 = float2(_414, _400);
    float2 _578 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2218, float2(0.0), isnan(_2218)), level(_574)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2218, float2(0.0), isnan(_2218)), level(_574)).xy;
    float _580 = _578.x;
    float _582 = _578.y;
    float2 _2231 = float2(_414, _400);
    float4 _585 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2231, float2(0.0), isnan(_2231)), level(_574)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2231, float2(0.0), isnan(_2231)), level(_574)).xyzw;
    float _587 = _585.x;
    float _589 = _585.y;
    float _591 = _585.z;
    float _593 = _585.w;
    float _595 = _120 * _122;
    float _597 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _599 = -_124;
    float _601 = fma(_599, _124, _312);
    int _603 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _605 = _603 != 0;
    float _607 = fma(_597, _595, _552);
    float _609 = fma(_597, _595, _554);
    float _611 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _613 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _615 = fma(_306, 3.0, -1.0);
    float _617 = _122 * (-3.0);
    float _619 = fma(_611, _595, _562);
    float _621 = fma(_611, _595, _564);
    float _623 = -_122;
    float _625 = fma(_623, _617, -1.0);
    float _627 = fma(_613, _595, _570);
    float _629 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _631 = fma(_613, _595, _568);
    float _633 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _635 = fma(_629, _625, _607);
    float _637 = fma(_629, _615, _609);
    float _639 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _641 = fma(_633, _625, _627);
    float _643 = fma(_633, _615, _631);
    float _645 = fma(_639, _625, _619);
    float _647 = fma(_639, _615, _621);
    float _649 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _651 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _653 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _655 = fma(_649, _601, _635);
    float _657 = fma(_649, _601, _637);
    float _659 = fma(_651, _601, _645);
    float _661 = fma(_651, _601, _647);
    float _663 = fma(_653, _601, _641);
    float _665 = fma(_653, _601, _643);
    float _667 = _582 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _669 = !_605;
    int _671 = as_type<int>(_665);
    int _673 = _605 ? (-1) : 0;
    int _687;
    int _689;
    int _691;
    int _693;
    int _695;
    int _697;
    if (!_669)
    {
        float _675 = _506 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _677 = _518 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _679 = _524 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _681 = _532 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _683 = _520 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _685 = _526 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _687 = as_type<int>(_681);
        _689 = as_type<int>(_683);
        _691 = as_type<int>(_677);
        _693 = as_type<int>(_675);
        _695 = as_type<int>(_679);
        _697 = as_type<int>(_685);
        _699 = true;
    }
    else
    {
        int _701 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _703 = _701 != 0;
        float _705 = _659 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _707 = _663 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _709 = _655 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _711 = _661 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _713 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _715 = _665 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _717 = _657 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _719 = as_type<int>(_705);
        int _721 = as_type<int>(_707);
        int _723 = as_type<int>(_709);
        int _725 = as_type<int>(_717);
        _673 = _703 ? (-1) : 0;
        _697 = as_type<int>(_715);
        if (_703)
        {
            float _727 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _719 = as_type<int>(_727);
        }
        int _729 = _719;
        _691 = _729;
        if (_703)
        {
            float _731 = _472 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _721 = as_type<int>(_731);
        }
        int _733 = _721;
        _695 = _733;
        if (_703)
        {
            float _735 = _713 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _723 = as_type<int>(_735);
        }
        int _737 = _723;
        _693 = _737;
        if (!_703)
        {
            _671 = as_type<int>(_711);
        }
        int _739 = _671;
        int _741 = _739;
        if (_703)
        {
            _741 = _729;
        }
        int _743 = _741;
        _689 = _743;
        if (_703)
        {
            _725 = _737;
        }
        int _745 = _725;
        _687 = _745;
        if (_703)
        {
            _697 = _733;
        }
    }
    _699 = false;
    int _747 = _673;
    int _749 = _687;
    int _751 = _689;
    int _753 = _691;
    int _755 = _693;
    int _757 = _695;
    int _759 = _697;
    float _761 = in.m_42.x;
    float _763 = gl_FragCoord.w;
    float _765 = _761 * _763;
    float _767 = in.m_42.y;
    float _769 = gl_FragCoord.w;
    float _771 = _767 * _769;
    int _773 = 0;
    int _775 = _747;
    if (!_92)
    {
        int _777 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _779 = _777 != 0;
        _773 = _779 ? (-1) : 0;
    }
    int _781 = _773;
    if (_92)
    {
        _775 = -1;
    }
    int _783 = _775;
    int _785 = _783;
    if (!_92)
    {
        int _787 = ~_781;
        bool _789 = !_96;
        int _791 = _787 & (_789 ? (-1) : 0);
        _785 = _791;
    }
    int _793 = _785;
    bool _795 = _98 != 0;
    float _797 = _100 * _765;
    float _799 = _100 * _771;
    float2 _2596 = float2(_797, _799);
    float2 _801 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2596, float2(0.0), isnan(_2596))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2596, float2(0.0), isnan(_2596))).xy;
    float _803 = _801.x;
    float _805 = _801.y;
    float _807 = fma(_803, 2.0, -1.0);
    float _809 = fma(_805, 2.0, -1.0);
    float _811 = fma(_807, (*spvDescriptorSet0.fp_c3)._m0[22].x, _797);
    float _813 = fma(_809, (*spvDescriptorSet0.fp_c3)._m0[22].y, _799);
    float2 _2624 = float2(_811, _813);
    float4 _815 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2624, float2(0.0), isnan(_2624))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2624, float2(0.0), isnan(_2624))).xyzw;
    float _817 = _815.x;
    float _819 = _815.y;
    float _821 = _815.z;
    float _823 = _815.w;
    float _825 = _394 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _827 = _593 * _593;
    float _829 = exp2(_825);
    int _831 = _793;
    if (_88)
    {
        _831 = -1;
    }
    int _833 = _831;
    float _835 = _827 * _827;
    int _837 = _833;
    if (!_88)
    {
        bool _839 = !_96;
        bool _841 = _839 && _84;
        bool _843 = !_795;
        bool _845 = _841 && _843;
        _837 = _845 ? (-1) : 0;
    }
    int _847 = _837;
    int _849 = ~_793;
    float _851 = (_849 != 0) ? as_type<float>(_749) : 0.0;
    float _853 = _835 * 16.0;
    int _855 = ~_793;
    float _857 = (_855 != 0) ? as_type<float>(_751) : 0.0;
    float _859 = _587 * _853;
    float _861 = _589 * _853;
    float _863 = _591 * _853;
    float _865 = -_829;
    float _867 = _865 + 1.0;
    float _869 = _867 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _871 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _873 = _871 != 0;
    int _875 = ~_847;
    float _877 = (_875 != 0) ? as_type<float>(_753) : 0.0;
    float _879 = -_869;
    float _881 = _879 + 1.0;
    int _883 = ~_847;
    float _885 = (_883 != 0) ? as_type<float>(_755) : 0.0;
    bool _887 = !_96;
    bool _889 = _84 && _887;
    int _891 = ~_847;
    float _893 = (_891 != 0) ? as_type<float>(_757) : 0.0;
    float _895 = abs(_881);
    float _897 = log2(_895);
    bool _899 = !_873;
    float _901 = _899 ? _580 : 0.0;
    int _903 = ~_793;
    float _905 = (_903 != 0) ? as_type<float>(_759) : 0.0;
    float _907 = _901 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _909 = _901 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _911 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _913 = _911 != 0;
    bool _915 = !_889;
    float _917 = _915 ? _907 : 0.0;
    bool _919 = !_889;
    float _921 = _919 ? _909 : 0.0;
    float _923 = _897 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _925 = _897 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _927 = !_913;
    float _929 = _921 * _857;
    float _931 = exp2(_923);
    bool _933 = !_913;
    float _935 = _921 * _851;
    bool _937 = !_927;
    float _939 = _937 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _941 = _921 * _905;
    float _943 = fma(_877, _917, _929);
    bool _945 = !_933;
    float _947 = _945 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _949 = fma(_885, _917, _935);
    float _951 = exp2(_925);
    bool _953 = !_913;
    int _955 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _957 = _955 != 0;
    float _959 = _939 * _943;
    float _961 = _947 * _949;
    bool _963 = !_80;
    float _965 = _963 ? _931 : 1.0;
    bool _967 = !_957;
    float _969 = _965 * _901;
    float _971 = _965 * _959;
    bool _973 = !_953;
    float _975 = _973 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _977 = fma(_893, _917, _941);
    bool _979 = !_80;
    float _981 = _979 ? _951 : 1.0;
    float _983 = _965 * _961;
    float _985 = _975 * _977;
    float _987 = _967 ? _861 : 0.0;
    float _989 = _84 ? _969 : _971;
    float _991 = _981 * _987;
    bool _993 = !_957;
    float _995 = _989 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _997 = _84 ? _969 : _983;
    float _999 = _969;
    int _1001 = as_type<int>(_991);
    float _1003 = _977;
    float _1005 = _901;
    if (!_84)
    {
        float _1007 = _965 * _985;
        _999 = _1007;
    }
    float _1009 = _999;
    float _1011 = _993 ? _863 : 0.0;
    float _1013 = fma(_991, (*spvDescriptorSet0.fp_c3)._m0[27].y, _995);
    bool _1015 = !_957;
    float _1017 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1019 = _981 * _1011;
    float _1021 = _1017;
    float _1023 = _1013;
    if (_80)
    {
        _1001 = as_type<int>(_667);
    }
    int _1025 = _1001;
    float _1027 = _997 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1029 = fma(_1019, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1017);
    float _1031 = _1015 ? _859 : 0.0;
    float _1033 = _981 * _1031;
    int _1035 = _1025;
    int _1037 = _1025;
    float _1039 = _1029;
    if (_80)
    {
        _1003 = 0.0;
    }
    float _1041 = _1003;
    float _1043 = fma(_1033, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1027);
    float _1045 = _1043;
    float _1047 = _1041;
    if (_80)
    {
        _1005 = 0.0;
    }
    float _1049 = _1005;
    float _1051 = _1049;
    if (_80)
    {
        _1021 = 0.0;
    }
    float _1053 = _1021;
    bool _1055 = !_80;
    float _1057 = _1055 ? _869 : 0.0;
    float _1059 = _1053;
    if (!_80)
    {
        int _1061 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1063 = _1061 != 0;
        float _1065 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1067 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1069 = _1067 != 0;
        float _1071 = _452 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1073 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1075 = !_1069;
        float _1077 = _1075 ? _1071 : 0.0;
        bool _1079 = !_1069;
        float _1081 = _1079 ? _1065 : 0.0;
        bool _1083 = !_1069;
        float _1085 = _1083 ? _1073 : 0.0;
        float _1087 = _1057 * _1077;
        _1047 = _1087;
        if (!_1063)
        {
            _1035 = as_type<int>(_667);
        }
        int _1089 = _1035;
        float _1091 = _1057 * _1081;
        float _1093 = _1057 * _1085;
        bool _1095 = !_1063;
        _1051 = _1091;
        _1037 = _1089;
        _1059 = _1093;
        if (!_1095)
        {
            float _1097 = -_1057;
            float _1099 = _1097 + 1.0;
            float _1101 = precise::clamp(_1099, 0.0, 1.0);
            float _1103 = _667 * _1101;
            float _1105 = precise::max(_1103, 9.9999997473787516355514526367188e-05);
            float _1107 = 1.0 / _1105;
            float _1109 = _667 * _1107;
            float _1111 = _1043 * _1109;
            float _1113 = _1013 * _1109;
            float _1115 = _1029 * _1109;
            _1023 = _1113;
            _1051 = 0.0;
            _1045 = _1111;
            _1047 = 0.0;
            _1037 = as_type<int>(_1103);
            _1039 = _1115;
            _1059 = 0.0;
        }
    }
    float _1117 = _1023;
    float _1119 = _1051;
    float _1121 = _1045;
    float _1123 = _1047;
    int _1125 = _1037;
    float _1127 = _1039;
    float _1129 = _1059;
    int _1131 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1133 = _1131 != 0;
    int _1135 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1137 = _1135 != 0;
    float _1139 = _1117 + _1119;
    float _1141 = _444 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1143 = _1121 + _1123;
    float _1145 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _1147 = !_1137;
    float _1149 = _1147 ? as_type<float>(_1125) : 1.0;
    float _1151 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1153 = _1127 + _1129;
    float _1155 = -_1149;
    float _1157 = _1155 + 1.0;
    float _1159 = abs(_1157);
    float _1161 = log2(_1159);
    float _1163 = _1161 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1165 = exp2(_1163);
    float _1167 = -_1165;
    float _1169 = spvFAdd(_1167, 1.00010001659393310546875);
    float _1171 = -_1165;
    float _1173 = _1171 + 1.0;
    float _1175 = -_1149;
    float _1177 = _1175 + _1173;
    float _1179 = 1.0 / _1169;
    float _1181 = _1177 * _1151;
    float _1183 = _1177 * _1141;
    float _1185 = _1177 * _1145;
    float _1187 = fma(_1139, _1149, _1181);
    float _1189 = fma(_1143, _1149, _1183);
    float _1191 = fma(_1153, _1149, _1185);
    float _1193 = _1179 * _1187;
    float _1195 = _1179 * _1189;
    float _1197 = _1179 * _1191;
    float _1199 = _1193 * 0.715200006961822509765625;
    float _1201 = fma(_1195, 0.2125999927520751953125, _1199);
    float _1203 = fma(_1197, 0.072200000286102294921875, _1201);
    float _1205 = 1.0 / _1203;
    float _1207 = _1205 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1209 = precise::clamp(_1207, 0.0, 1.0);
    float _1211 = fma(_1209, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1213 = _1211 * _823;
    float _1215 = fma(_1193, _1213, _819);
    float _1217 = fma(_1195, _1213, _817);
    float _1219 = fma(_1197, _1213, _821);
    bool _1221 = !_1133;
    float _1223 = _1165;
    float _1225 = _1197;
    float _1227 = _1195;
    int _1229 = as_type<int>(_1165);
    int _1231 = as_type<int>(_1197);
    int _1233 = as_type<int>(_1195);
    if (!_1221)
    {
        bool _1235 = _1173 != 1.0;
        bool _1237 = isnan(_1173);
        bool _1239 = _1235 || _1237;
        bool _1241 = isnan(1.0);
        bool _1243 = _1239 || _1241;
        float _1245 = -_1165;
        bool _1247 = _1245 != (-1.0);
        bool _1249 = isnan(_1245);
        bool _1251 = _1247 || _1249;
        bool _1253 = isnan(-1.0);
        bool _1255 = _1251 || _1253;
        float _1257 = -_1165;
        bool _1259 = _1257 == (-1.0);
        bool _1261 = !_1243;
        bool _1263 = _1259 || _1261;
        bool _1265 = _1173 == 1.0;
        bool _1267 = _1265 && _1255;
        bool _1269 = !_1263;
        float _1271 = _1269 ? _1173 : 0.0;
        bool _1273 = !_1267;
        float _1275 = _1273 ? 0.0 : 1.0;
        float _1277 = _1263 ? 0.0 : 0.5;
        float _1279 = _1271 * 0.715200006961822509765625;
        float _1281 = fma(_1275, 0.2125999927520751953125, _1279);
        float _1283 = fma(_1277, 0.072200000286102294921875, _1281);
        float _1285 = 1.0 / _1283;
        float _1287 = _1285 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1289 = precise::clamp(_1287, 0.0, 1.0);
        float _1291 = fma(_1289, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1293 = _1275 * _1291;
        float _1295 = _1271 * _1291;
        float _1297 = _1277 * _1291;
        out.m_40.x = _1293;
        out.m_40.y = _1295;
        out.m_40.z = _1297;
        out.m_40.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    bool _1299 = _98 != 0;
    bool _1301 = !_1299;
    if (!_1301)
    {
        if (_88)
        {
            _1223 = 0.0;
        }
        float _1303 = _1223;
        float _1305 = _1303;
        if (_88)
        {
            _1225 = 0.0;
        }
        float _1307 = _1225;
        float _1309 = _1307;
        if (!_88)
        {
            float _1311 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1309 = _1311;
        }
        float _1313 = _1309;
        float _1315 = _1313;
        if (!_88)
        {
            float _1317 = _885 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1305 = _1317;
        }
        float _1319 = _1305;
        float _1321 = _1319;
        if (!_92)
        {
            float _1323 = fma(_857, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1313);
            _1315 = _1323;
        }
        float _1325 = _1315;
        if (_88)
        {
            _1227 = 0.0;
        }
        float _1327 = _1227;
        float _1329 = _1327;
        if (!_88)
        {
            float _1331 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1329 = _1331;
        }
        float _1333 = _1329;
        float _1335 = _1325 * 0.715200006961822509765625;
        float _1337 = _1333;
        if (!_92)
        {
            float _1339 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1319);
            _1321 = _1339;
        }
        float _1341 = _1321;
        if (!_92)
        {
            float _1343 = fma(_905, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1333);
            _1337 = _1343;
        }
        float _1345 = _1337;
        float _1347 = fma(_1341, 0.2125999927520751953125, _1335);
        float _1349 = fma(_1345, 0.072200000286102294921875, _1347);
        float _1351 = 1.0 / _1349;
        float _1353 = _1351 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1355 = precise::clamp(_1353, 0.0, 1.0);
        float _1357 = fma(_1355, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1359 = _1357 * _1341;
        float _1361 = _1357 * _1325;
        float _1363 = _1357 * _1345;
        out.m_40.x = _1359;
        out.m_40.y = _1361;
        out.m_40.z = _1363;
        out.m_40.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    if (!_96)
    {
        _1229 = as_type<int>(_1217);
    }
    int _1365 = _1229;
    float _1367 = as_type<float>(_1365);
    if (!_96)
    {
        _1231 = as_type<int>(_1215);
    }
    int _1369 = _1231;
    float _1371 = as_type<float>(_1369);
    if (!_96)
    {
        _1233 = as_type<int>(_1173);
    }
    int _1373 = _1233;
    float _1375 = as_type<float>(_1373);
    if (!_96)
    {
        out.m_40.x = as_type<float>(_1365);
        out.m_40.y = as_type<float>(_1369);
        out.m_40.z = _1219;
        out.m_40.w = as_type<float>(_1373);
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    if (_88)
    {
        _1367 = 0.0;
    }
    float _1377 = _1367;
    float _1379 = _1377;
    if (_88)
    {
        _1371 = 0.0;
    }
    float _1381 = _1371;
    float _1383 = _1381;
    if (!_88)
    {
        float _1385 = _877 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1383 = _1385;
    }
    float _1387 = _1383;
    float _1389 = _1387;
    if (!_88)
    {
        float _1391 = _885 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1379 = _1391;
    }
    float _1393 = _1379;
    float _1395 = _1393;
    if (!_92)
    {
        float _1397 = fma(_857, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1387);
        _1389 = _1397;
    }
    float _1399 = _1389;
    if (_88)
    {
        _1375 = 0.0;
    }
    float _1401 = _1375;
    float _1403 = _1401;
    if (!_88)
    {
        float _1405 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = _1399 * 0.715200006961822509765625;
    float _1411 = _1407;
    if (!_92)
    {
        float _1413 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1393);
        _1395 = _1413;
    }
    float _1415 = _1395;
    if (!_92)
    {
        float _1417 = fma(_905, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1407);
        _1411 = _1417;
    }
    float _1419 = _1411;
    float _1421 = fma(_1415, 0.2125999927520751953125, _1409);
    float _1423 = fma(_1419, 0.072200000286102294921875, _1421);
    float _1425 = 1.0 / _1423;
    float _1427 = _1425 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1429 = precise::clamp(_1427, 0.0, 1.0);
    float _1431 = fma(_1429, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1433 = _1431 * _1415;
    float _1435 = _1431 * _1399;
    float _1437 = _1431 * _1419;
    out.m_40.x = _1433;
    out.m_40.y = _1435;
    out.m_40.z = _1437;
    out.m_40.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_40)};
}

