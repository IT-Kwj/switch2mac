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
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
void _42(thread const int& _3693, thread const int& _3694, thread const int& _3695, thread const int& _3696, thread int& _3697, thread int& _3698, thread int& _3699, thread int& _3700, thread int& _3701, thread int& _3702)
{
    float _3705 = as_type<float>(_3694) + 0.0;
    bool _3707 = _3705 != 0.0;
    bool _3709 = isnan(_3705);
    bool _3711 = _3707 || _3709;
    bool _3713 = isnan(0.0);
    bool _3715 = _3711 || _3713;
    int _3717 = as_type<int>(_3705);
    int _3719 = _3693;
    int _3721 = _3695;
    int _3723 = _3715 ? (-1) : 0;
    if (!_3715)
    {
        float _3725 = as_type<float>(_3694) * 1.0;
        _3717 = as_type<int>(_3725);
    }
    int _3727 = _3717;
    bool _3729 = !_3715;
    int _3731 = _3727;
    if (!_3729)
    {
        float _3733 = as_type<float>(_3694) + 0.0;
        bool _3735 = _3733 >= 0.0;
        bool _3737 = isnan(_3733);
        bool _3739 = _3735 || _3737;
        bool _3741 = isnan(0.0);
        bool _3743 = _3739 || _3741;
        int _3745 = as_type<int>(_3733);
        _3723 = _3743 ? (-1) : 0;
        if (!_3743)
        {
            _3745 = 2147483647;
        }
        int _3747 = _3745;
        bool _3749 = !_3743;
        _3731 = _3747;
        if (!_3749)
        {
            float _3751 = abs(as_type<float>(_3694));
            float _3753 = _3751 + 0.0;
            bool _3755 = _3753 > as_type<float>(0x7f800000u /* inf */);
            bool _3757 = isnan(_3753);
            bool _3759 = _3755 || _3757;
            bool _3761 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3763 = _3759 || _3761;
            int _3765 = as_type<int>(_3753);
            _3723 = _3763 ? (-1) : 0;
            if (_3763)
            {
                float _3767 = as_type<float>(_3694) + 1.0;
                _3765 = as_type<int>(_3767);
            }
            int _3769 = _3765;
            _3731 = _3769;
            if (!_3763)
            {
                float _3771 = abs(as_type<float>(_3694));
                float _3773 = _3771 + (-0.0);
                float _3775 = 0.0 + _3773;
                bool _3777 = _3775 != as_type<float>(0x7f800000u /* inf */);
                bool _3779 = isnan(_3775);
                bool _3781 = _3777 || _3779;
                bool _3783 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3785 = _3781 || _3783;
                int _3787 = as_type<int>(_3775);
                _3723 = _3785 ? (-1) : 0;
                if (!_3785)
                {
                    _3787 = _3694;
                }
                int _3789 = _3787;
                bool _3791 = !_3785;
                _3731 = _3789;
                if (!_3791)
                {
                    float _3793 = as_type<float>(_3694) * 18446744073709551616.0;
                    float _3795 = rsqrt(_3793);
                    float _3797 = _3793 * _3795;
                    float _3799 = _3795 * 0.5;
                    float _3801 = -_3797;
                    float _3803 = 0.0 + _3801;
                    float _3805 = fma(_3799, _3803, 0.5);
                    float _3807 = fma(_3797, _3805, _3797);
                    float _3809 = -_3807;
                    float _3811 = 0.0 + _3809;
                    float _3813 = fma(_3807, _3811, _3793);
                    float _3815 = fma(_3799, _3813, _3807);
                    float _3817 = _3815 * 2.3283064365386962890625e-10;
                    _3731 = as_type<int>(_3817);
                    _3719 = as_type<int>(_3793);
                    _3721 = as_type<int>(_3807);
                }
            }
        }
    }
    int _3819 = _3731;
    int _3821 = _3719;
    int _3823 = _3721;
    int _3825 = _3723;
    _3697 = _3819;
    _3698 = _3821;
    _3699 = _3696;
    _3700 = 0;
    _3701 = _3823;
    _3702 = _3825;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _693 = false;
    bool _266 = false;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.y;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_33.z;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    int _66 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _70 = _66 != 0;
    int _72 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _74 = _72 != 0;
    int _76 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _78 = _76 != 0;
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _82 = _80 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _90 = _88 != 0;
    int _92 = int(_70);
    float _94 = 1.0 / _46;
    float _96 = _94 * _52;
    float _98 = _94 * _58;
    float _100 = _94 * _64;
    float _102 = _96 * _96;
    float _104 = fma(_98, _98, _102);
    float _106 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _108 = fma(_100, _100, _104);
    float _110 = precise::max(0.0, _106);
    float _112 = rsqrt(_108);
    float _114 = _98 * _112;
    float _116 = _100 * _112;
    float _118 = _96 * _112;
    float _120 = _114 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _122 = _116 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _124 = -_118;
    float _126 = -_110;
    float _128 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[13].z, _126);
    float _130 = _120 * _120;
    float _132 = _122 * _122;
    float _134 = _130 + _132;
    float _136 = sqrt(_134);
    bool _138 = _136 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _140 = _110;
    float _142 = _112;
    float _144 = _128;
    float _146 = _120;
    float _148 = _122;
    if (!_138)
    {
        _140 = _132;
    }
    float _150 = _140;
    float _152 = _150;
    if (!_138)
    {
        _142 = _130;
    }
    float _154 = _142;
    bool _156 = !_138;
    float _158 = _154;
    if (!_156)
    {
        float _160 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _162 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _164 = _136 + _162;
        float _166 = _128 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = rsqrt(_134);
        float _170 = _164 * _160;
        float _172 = _170 * 0.15915493667125701904296875;
        float _174 = _172 * 6.283185482025146484375;
        float _176 = sin(_174);
        float _178 = _172 * 6.283185482025146484375;
        float _180 = cos(_178);
        float _182 = fma(_176, _166, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _184 = _168 * _182;
        float _186 = _180 + (-1.0);
        float _188 = _120 * _184;
        float _190 = _122 * _184;
        float _192 = _186 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _194 = _190 * _190;
        float _196 = fma(_128, _180, _192);
        float _198 = _188 * _188;
        _144 = _196;
        _158 = _198;
        _152 = _194;
        _146 = _188;
        _148 = _190;
    }
    float _200 = _144;
    float _202 = _158;
    float _204 = _152;
    float _206 = _146;
    float _208 = _148;
    float _210 = fma(_200, _200, _202);
    float _212 = _210 + _204;
    float _214 = rsqrt(_212);
    float _216 = _214 * _200;
    float _218 = _214 * _206;
    float _220 = _214 * _208;
    float _222 = -_216;
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
        int _246 = as_type<int>(_230);
        int _248 = 0;
        int _250 = 1232;
        int _252;
        int _254;
        int _256;
        int _258;
        int _260;
        int _262;
        _42(_244, _246, _248, _250, _252, _254, _256, _258, _260, _262);
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
    bool _292 = _216 > 0.0;
    if (_292)
    {
        discard_fragment();
    }
    if (_292)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _294 = -_118;
    float _296 = _294 + 1.0;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = -_118;
    float _302 = fma(_300, _118, 1.0);
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _240 * _290;
    int _308 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _310 = _308 != 0;
    float _312 = _116 * _116;
    float _314 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _316 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _318 = _114 * _114;
    float _320 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _322 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _324 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _326 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _328 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _330 = fma(_118, _322, _314);
    float _332 = _306 * 0.636619746685028076171875;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _298;
    if (_310)
    {
        float _338 = sqrt(_304);
        _336 = _338;
    }
    float _340 = _336;
    float _342 = _218 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _344 = -_116;
    float _346 = fma(_344, _324, _330);
    float _348 = fma(_116, _324, _330);
    float _350 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _352 = _312 + _318;
    float _354 = -_114;
    float _356 = fma(_354, _328, _346);
    float _358 = fma(_114, _328, _348);
    float _360 = fma(_118, _350, _316);
    float _362 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _364 = -_118;
    float _366 = _114 * _364;
    float _368 = rsqrt(_352);
    float _370 = -_116;
    float _372 = fma(_370, _326, _360);
    float _374 = fma(_116, _326, _360);
    float _376 = fma(_118, _362, _320);
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _382 = _118 * _116;
    float _384 = -_342;
    float _386 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[11].y, _384);
    float _388 = abs(_340);
    float _390 = log2(_388);
    float _392 = -_114;
    float _394 = fma(_392, _378, _372);
    float _396 = fma(_114, _378, _374);
    float _398 = -_116;
    float _400 = fma(_398, _380, _376);
    float _402 = fma(_116, _380, _376);
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _406 = -_334;
    float _408 = _406 + 1.0;
    float _410 = _114 * _118;
    float _412 = -_114;
    float _414 = fma(_412, _404, _400);
    float _416 = fma(_114, _404, _402);
    float _418 = -_116;
    float _420 = _118 * _418;
    float _422 = sqrt(_408);
    float _424 = _390 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _426 = exp2(_424);
    float _428 = -_422;
    float _430 = _428 + 1.0;
    float _432 = _426 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _434 = fma(_432, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _116 * _368;
    float _440 = _114 * _368;
    float _442 = -_436;
    float _444 = _442 + 1.0;
    float _446 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _448 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _450 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _452 = abs(_438);
    float _454 = abs(_440);
    float _456 = precise::max(_452, _454);
    float _458 = fma(_446, _366, _356);
    float _460 = fma(_446, _410, _358);
    float _462 = abs(_444);
    float _464 = log2(_462);
    float _466 = fma(_448, _366, _394);
    float _468 = fma(_450, _366, _414);
    float _470 = fma(_448, _410, _396);
    float _472 = fma(_450, _410, _416);
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _476 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _478 = precise::max(_456, 9.9999997473787516355514526367188e-05);
    float _480 = fma(_474, _420, _466);
    float _482 = fma(_474, _382, _470);
    float _484 = -_220;
    float _486 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _490 = fma(_476, _420, _458);
    float _492 = fma(_476, _382, _460);
    float _494 = 1.0 / _478;
    float _496 = fma(_488, _420, _468);
    float _498 = fma(_488, _382, _472);
    float _500 = _464 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _502 = exp2(_500);
    float _504 = _430 * 0.5;
    float _506 = fma(_486, -0.5, 0.5);
    float _508 = fma(_486, 0.5, 0.5);
    float _510 = fma(_508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _512 = -_494;
    float _514 = _438 * _512;
    float _516 = _216 + 1.0;
    float _518 = _440 * _494;
    float _520 = sqrt(_506);
    float _522 = fma(_514, _504, 0.5);
    float _524 = fma(_508, _510, -0.212114393711090087890625);
    float _526 = -_216;
    float _528 = fma(_502, _516, _526);
    float _530 = fma(_518, _504, 0.5);
    float _532 = fma(_508, _524, 1.570728778839111328125);
    float _534 = fma(_528, 0.5, 0.5);
    float2 _2191;
    _2191.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_522, _530));
    _2191.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_522, _530));
    float _536 = _2191.x;
    float _538 = _536 * 256.0;
    int _540 = int(_538);
    float _542 = fma(_216, -0.5, 0.5);
    float _544 = _520 * 0.636619746685028076171875;
    float _546 = -_532;
    float _548 = fma(_544, _546, 1.0);
    float2 _2210 = float2(_548, _542);
    float3 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2210, float2(0.0), isnan(_2210))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2210, float2(0.0), isnan(_2210))).xyz;
    float _554 = _552.x;
    float _556 = _552.y;
    float _558 = _552.z;
    float2 _2226 = float2(_548, _534);
    float3 _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2226, float2(0.0), isnan(_2226))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2226, float2(0.0), isnan(_2226))).xyz;
    float _562 = _560.x;
    float _564 = _560.y;
    float _566 = _560.z;
    float _568 = _114 * _116;
    float _570 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _572 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _574 = fma(_570, _568, _490);
    float _576 = fma(_570, _568, _492);
    float _578 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _580 = fma(_572, _568, _496);
    float _582 = fma(_572, _568, _498);
    float _584 = fma(_578, _568, _480);
    float _586 = fma(_578, _568, _482);
    float _588 = _116 * (-3.0);
    float _590 = -_116;
    float _592 = fma(_590, _588, -1.0);
    float _594 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _596 = fma(_312, 3.0, -1.0);
    float _598 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _600 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _602 = fma(_594, _592, _584);
    float _604 = fma(_594, _596, _586);
    float _606 = fma(_598, _592, _574);
    float _608 = fma(_598, _596, _576);
    float _610 = fma(_600, _592, _580);
    float _612 = float(uint(_540));
    float _614 = _612 * 0.00390625;
    float2 _2324 = float2(_522, _530);
    float2 _618 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2324, float2(0.0), isnan(_2324)), level(_614)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2324, float2(0.0), isnan(_2324)), level(_614)).xy;
    float _620 = _618.x;
    float _622 = _618.y;
    float2 _2337 = float2(_522, _530);
    float4 _625 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2337, float2(0.0), isnan(_2337)), level(_614)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2337, float2(0.0), isnan(_2337)), level(_614)).xyzw;
    float _627 = _625.x;
    float _629 = _625.y;
    float _631 = _625.z;
    float _633 = _625.w;
    float _635 = fma(_600, _596, _582);
    int _637 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _639 = _637 != 0;
    float _641 = -_118;
    float _643 = fma(_641, _118, _318);
    float _645 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _647 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _649 = fma(_645, _643, _606);
    float _651 = fma(_645, _643, _608);
    float _653 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _655 = fma(_647, _643, _602);
    float _657 = fma(_647, _643, _604);
    float _659 = fma(_653, _643, _610);
    float _661 = fma(_653, _643, _635);
    float _663 = _622 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _665 = !_639;
    int _667 = _639 ? (-1) : 0;
    int _681;
    int _683;
    int _685;
    int _687;
    int _689;
    int _691;
    if (!_665)
    {
        float _669 = _356 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _671 = _394 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _673 = _414 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _675 = _358 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _677 = _396 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _679 = _416 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _681 = as_type<int>(_677);
        _683 = as_type<int>(_675);
        _685 = as_type<int>(_669);
        _687 = as_type<int>(_671);
        _689 = as_type<int>(_673);
        _691 = as_type<int>(_679);
        _693 = true;
    }
    else
    {
        int _695 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _697 = _695 != 0;
        float _699 = _649 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _701 = _655 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _703 = _659 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _705 = _651 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _707 = _657 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _709 = _661 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _711 = as_type<int>(_699);
        int _713 = as_type<int>(_701);
        int _715 = as_type<int>(_703);
        int _717 = as_type<int>(_705);
        int _719 = as_type<int>(_707);
        _667 = _697 ? (-1) : 0;
        _691 = as_type<int>(_709);
        if (_697)
        {
            float _721 = _314 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _711 = as_type<int>(_721);
        }
        int _723 = _711;
        _685 = _723;
        if (_697)
        {
            float _725 = _316 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _713 = as_type<int>(_725);
        }
        int _727 = _713;
        _687 = _727;
        if (_697)
        {
            float _729 = _320 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _715 = as_type<int>(_729);
        }
        int _731 = _715;
        _689 = _731;
        if (_697)
        {
            _717 = _723;
        }
        int _733 = _717;
        _683 = _733;
        if (_697)
        {
            _719 = _727;
        }
        int _735 = _719;
        _681 = _735;
        if (_697)
        {
            _691 = _731;
        }
    }
    _693 = false;
    int _737 = _667;
    int _739 = _681;
    int _741 = _683;
    int _743 = _685;
    int _745 = _687;
    int _747 = _689;
    int _749 = _691;
    float _751 = _464 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    int _753 = 0;
    int _755 = _737;
    if (!_86)
    {
        int _757 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _759 = _757 != 0;
        _753 = _759 ? (-1) : 0;
    }
    int _761 = _753;
    float _763 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _765 = _216 * _763;
    if (_86)
    {
        _755 = -1;
    }
    int _767 = _755;
    float _769 = _633 * _633;
    int _771 = _767;
    if (!_86)
    {
        int _773 = ~_761;
        bool _775 = !_90;
        int _777 = _773 & (_775 ? (-1) : 0);
        _771 = _777;
    }
    int _779 = _771;
    float _781 = exp2(_751);
    bool _783 = _92 != 0;
    float _785 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[26].x, _765);
    float _787 = _769 * _769;
    float _789 = _216 * (-10000.0);
    float _791 = _787 * 16.0;
    float _793 = _631 * _791;
    float _795 = _627 * _791;
    int _797 = _779;
    if (_82)
    {
        _797 = -1;
    }
    int _799 = _797;
    float _801 = -_781;
    float _803 = _801 + 1.0;
    int _805 = _799;
    if (!_82)
    {
        bool _807 = !_90;
        bool _809 = _807 && _78;
        bool _811 = !_783;
        bool _813 = _809 && _811;
        _805 = _813 ? (-1) : 0;
    }
    int _815 = _805;
    int _817 = ~_779;
    float _819 = (_817 != 0) ? as_type<float>(_739) : 0.0;
    float _821 = _629 * _791;
    float _823 = _803 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _825 = ~_779;
    float _827 = (_825 != 0) ? as_type<float>(_741) : 0.0;
    float _829 = -_823;
    float _831 = _829 + 1.0;
    float _833 = abs(_831);
    float _835 = log2(_833);
    int _837 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _839 = _837 != 0;
    int _841 = ~_815;
    float _843 = (_841 != 0) ? as_type<float>(_743) : 0.0;
    int _845 = ~_815;
    float _847 = (_845 != 0) ? as_type<float>(_745) : 0.0;
    int _849 = ~_815;
    float _851 = (_849 != 0) ? as_type<float>(_747) : 0.0;
    bool _853 = !_90;
    bool _855 = _78 && _853;
    bool _857 = !_839;
    float _859 = _857 ? _620 : 0.0;
    int _861 = ~_779;
    float _863 = (_861 != 0) ? as_type<float>(_749) : 0.0;
    float _865 = _835 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _867 = _859 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _869 = _859 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _871 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _873 = _871 != 0;
    float _875 = _835 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _877 = !_855;
    float _879 = _877 ? _867 : 0.0;
    bool _881 = !_855;
    float _883 = _881 ? _869 : 0.0;
    float _885 = exp2(_865);
    bool _887 = !_873;
    float _889 = _879 * _827;
    bool _891 = !_873;
    float _893 = _879 * _819;
    bool _895 = !_887;
    float _897 = _895 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _899 = _879 * _863;
    bool _901 = !_873;
    int _903 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _905 = _903 != 0;
    float _907 = exp2(_875);
    float _909 = fma(_843, _883, _889);
    bool _911 = !_891;
    float _913 = _911 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _915 = fma(_847, _883, _893);
    bool _917 = !_905;
    float _919 = _897 * _909;
    bool _921 = !_74;
    float _923 = _921 ? _885 : 1.0;
    float _925 = _913 * _915;
    bool _927 = !_905;
    float _929 = fma(_851, _883, _899);
    bool _931 = !_901;
    float _933 = _931 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _935 = _923 * _859;
    float _937 = _927 ? _793 : 0.0;
    float _939 = _923 * _925;
    float _941 = _923 * _919;
    float _943 = _933 * _929;
    bool _945 = !_905;
    int _947 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _949 = _947 != 0;
    float _951 = _917 ? _795 : 0.0;
    bool _953 = !_74;
    int _955 = _953 ? as_type<int>(_907) : 1065353216;
    float _957 = _945 ? _821 : 0.0;
    float _959 = as_type<float>(_955) * _951;
    float _961 = as_type<float>(_955) * _957;
    float _963 = as_type<float>(_955) * _937;
    float _965 = _951;
    float _967 = _935;
    int _969 = _955;
    float _971 = _963;
    if (_74)
    {
        _965 = 0.0;
    }
    float _973 = _965;
    float _975 = _78 ? _935 : _939;
    float _977 = _78 ? _935 : _941;
    float _979 = _973;
    if (!_78)
    {
        float _981 = _923 * _943;
        _967 = _981;
    }
    float _983 = _967;
    float _985 = _975 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _987 = _985;
    if (_74)
    {
        _969 = as_type<int>(_663);
    }
    int _989 = _969;
    float _991 = _983 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _993 = fma(_961, (*spvDescriptorSet0.fp_c3)._m0[27].y, _985);
    float _995 = _977 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _997 = fma(_963, (*spvDescriptorSet0.fp_c3)._m0[27].z, _991);
    int _999 = _989;
    int _1001 = _989;
    float _1003 = _993;
    float _1005 = _997;
    if (_74)
    {
        _987 = 0.0;
    }
    float _1007 = _987;
    float _1009 = fma(_959, (*spvDescriptorSet0.fp_c3)._m0[27].x, _995);
    float _1011 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1013 = _1009;
    float _1015 = _1007;
    if (_74)
    {
        _971 = 0.0;
    }
    float _1017 = _971;
    bool _1019 = !_74;
    float _1021 = _1019 ? _823 : 0.0;
    float _1023 = _1017;
    if (!_74)
    {
        int _1025 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1027 = _1025 != 0;
        float _1029 = _564 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1031 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1033 = _1031 != 0;
        float _1035 = _562 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1037 = _566 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1039 = !_1033;
        float _1041 = _1039 ? _1035 : 0.0;
        bool _1043 = !_1033;
        float _1045 = _1043 ? _1029 : 0.0;
        bool _1047 = !_1033;
        float _1049 = _1047 ? _1037 : 0.0;
        float _1051 = _1021 * _1041;
        _979 = _1051;
        if (!_1027)
        {
            _999 = as_type<int>(_663);
        }
        int _1053 = _999;
        float _1055 = _1021 * _1045;
        float _1057 = _1021 * _1049;
        bool _1059 = !_1027;
        _1001 = _1053;
        _1015 = _1055;
        _1023 = _1057;
        if (!_1059)
        {
            float _1061 = -_1021;
            float _1063 = _1061 + 1.0;
            float _1065 = precise::clamp(_1063, 0.0, 1.0);
            float _1067 = _663 * _1065;
            float _1069 = precise::max(_1067, 9.9999997473787516355514526367188e-05);
            float _1071 = 1.0 / _1069;
            float _1073 = _663 * _1071;
            float _1075 = _1009 * _1073;
            float _1077 = _993 * _1073;
            float _1079 = _997 * _1073;
            _1001 = as_type<int>(_1067);
            _1013 = _1075;
            _979 = 0.0;
            _1003 = _1077;
            _1015 = 0.0;
            _1005 = _1079;
            _1023 = 0.0;
        }
    }
    int _1081 = _1001;
    float _1083 = _1013;
    float _1085 = _979;
    float _1087 = _1003;
    float _1089 = _1015;
    float _1091 = _1005;
    float _1093 = _1023;
    bool _1095 = !_949;
    float _1097 = _1095 ? as_type<float>(_1081) : 1.0;
    float _1099 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[26].z, _785);
    float _1101 = abs(_789);
    bool _1103 = _1101 > 0.00999999977648258209228515625;
    float _1105 = -_1011;
    float _1107 = exp2(_1105);
    float _1109 = -_1097;
    float _1111 = _1109 + 1.0;
    float _1113 = _1103 ? _789 : 0.00999999977648258209228515625;
    float _1115 = _1083 + _1085;
    float _1117 = _1087 + _1089;
    float _1119 = fma(_1099, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1121 = _556 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1123 = abs(_1111);
    float _1125 = log2(_1123);
    float _1127 = _1113 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1129 = fma(_1119, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1131 = _554 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1133 = _1091 + _1093;
    int _1135 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1137 = _1135 != 0;
    float _1139 = precise::max(_1127, -127.0);
    float _1141 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1143 = fma(_1141, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1145 = abs(_1129);
    float _1147 = log2(_1145);
    float _1149 = _1125 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1151 = -_1139;
    float _1153 = exp2(_1151);
    float _1155 = _1147 * 1.5;
    float _1157 = exp2(_1149);
    float _1159 = _558 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1161 = 1.0 / _1139;
    float _1163 = -_1153;
    float _1165 = _1163 + 1.0;
    float _1167 = _1107 * _1165;
    float _1169 = -_1157;
    float _1171 = spvFAdd(_1169, 1.00010001659393310546875);
    float _1173 = -_1157;
    float _1175 = _1173 + 1.0;
    float _1177 = exp2(_1155);
    float _1179 = -_1097;
    float _1181 = _1179 + _1175;
    float _1183 = _1167 * _1161;
    float _1185 = _1181 * _1121;
    float _1187 = _1181 * _1131;
    float _1189 = 1.0 / _1171;
    float _1191 = _1181 * _1159;
    float _1193 = fma(_1117, _1097, _1185);
    float _1195 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1197 = fma(_1115, _1097, _1187);
    float _1199 = _1177 * 12.56637096405029296875;
    float _1201 = _1183 * _1195;
    float _1203 = 1.0 / _1199;
    float _1205 = _1189 * _1193;
    float _1207 = fma(_1133, _1097, _1191);
    float _1209 = _1189 * _1197;
    float _1211 = _1205 * 0.715200006961822509765625;
    float _1213 = _1189 * _1207;
    float _1215 = -_1201;
    float _1217 = exp2(_1215);
    float _1219 = fma(_1209, 0.2125999927520751953125, _1211);
    float _1221 = fma(_1213, 0.072200000286102294921875, _1219);
    float _1223 = _1143 * _1203;
    float _1225 = 1.0 / _1221;
    float _1227 = -_1217;
    float _1229 = _1227 + 1.0;
    float _1231 = _1229 * _1223;
    float _1233 = _1231 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1235 = _1225 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1237 = precise::clamp(_1235, 0.0, 1.0);
    float _1239 = _1231 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1241 = fma(_1237, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1243 = _1241 * _1217;
    float _1245 = _1231 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1247 = fma(_1209, _1243, _1233);
    float _1249 = fma(_1205, _1243, _1245);
    float _1251 = fma(_1213, _1243, _1239);
    bool _1253 = !_1137;
    float _1255 = _1249;
    float _1257 = _1247;
    float _1259 = _1175;
    int _1261 = as_type<int>(_1205);
    int _1263 = as_type<int>(_1247);
    float _1265 = _1249;
    float _1267 = _1175;
    if (!_1253)
    {
        bool _1269 = _1175 != 1.0;
        bool _1271 = isnan(_1175);
        bool _1273 = _1269 || _1271;
        bool _1275 = isnan(1.0);
        bool _1277 = _1273 || _1275;
        float _1279 = -_1157;
        bool _1281 = _1279 != (-1.0);
        bool _1283 = isnan(_1279);
        bool _1285 = _1281 || _1283;
        bool _1287 = isnan(-1.0);
        bool _1289 = _1285 || _1287;
        float _1291 = -_1157;
        bool _1293 = _1291 == (-1.0);
        bool _1295 = !_1277;
        bool _1297 = _1293 || _1295;
        bool _1299 = _1175 == 1.0;
        bool _1301 = _1299 && _1289;
        bool _1303 = !_1297;
        float _1305 = _1303 ? _1175 : 0.0;
        bool _1307 = !_1301;
        float _1309 = _1307 ? 0.0 : 1.0;
        float _1311 = _1297 ? 0.0 : 0.5;
        float _1313 = _1305 * 0.715200006961822509765625;
        float _1315 = fma(_1309, 0.2125999927520751953125, _1313);
        float _1317 = fma(_1311, 0.072200000286102294921875, _1315);
        float _1319 = 1.0 / _1317;
        float _1321 = _1319 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1323 = precise::clamp(_1321, 0.0, 1.0);
        float _1325 = fma(_1323, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1327 = _1309 * _1325;
        float _1329 = _1305 * _1325;
        float _1331 = _1311 * _1325;
        out.m_36.x = _1327;
        out.m_36.y = _1329;
        out.m_36.z = _1331;
        out.m_36.w = 1.0;
        return out;
    }
    bool _1333 = _92 != 0;
    bool _1335 = !_1333;
    if (!_1335)
    {
        if (_82)
        {
            _1255 = 0.0;
        }
        float _1337 = _1255;
        float _1339 = _1337;
        if (_82)
        {
            _1257 = 0.0;
        }
        float _1341 = _1257;
        float _1343 = _1341;
        if (!_82)
        {
            float _1345 = _847 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1343 = _1345;
        }
        float _1347 = _1343;
        float _1349 = _1347;
        if (!_82)
        {
            float _1351 = _843 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1339 = _1351;
        }
        float _1353 = _1339;
        float _1355 = _1353;
        if (!_86)
        {
            float _1357 = fma(_819, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1347);
            _1349 = _1357;
        }
        float _1359 = _1349;
        if (_82)
        {
            _1259 = 0.0;
        }
        float _1361 = _1259;
        float _1363 = _1361;
        if (!_82)
        {
            float _1365 = _851 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1363 = _1365;
        }
        float _1367 = _1363;
        float _1369 = _1359 * 0.715200006961822509765625;
        float _1371 = _1367;
        if (!_86)
        {
            float _1373 = fma(_827, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1353);
            _1355 = _1373;
        }
        float _1375 = _1355;
        if (!_86)
        {
            float _1377 = fma(_863, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1367);
            _1371 = _1377;
        }
        float _1379 = _1371;
        float _1381 = fma(_1375, 0.2125999927520751953125, _1369);
        float _1383 = fma(_1379, 0.072200000286102294921875, _1381);
        float _1385 = 1.0 / _1383;
        float _1387 = _1385 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1389 = precise::clamp(_1387, 0.0, 1.0);
        float _1391 = fma(_1389, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1393 = _1391 * _1375;
        float _1395 = _1391 * _1359;
        float _1397 = _1391 * _1379;
        out.m_36.x = _1393;
        out.m_36.y = _1395;
        out.m_36.z = _1397;
        out.m_36.w = 1.0;
        return out;
    }
    if (!_90)
    {
        _1261 = as_type<int>(_1247);
    }
    int _1399 = _1261;
    if (!_90)
    {
        _1263 = as_type<int>(_1251);
    }
    int _1401 = _1263;
    float _1403 = as_type<float>(_1401);
    if (!_90)
    {
        out.m_36.x = as_type<float>(_1399);
        out.m_36.y = _1249;
        out.m_36.z = as_type<float>(_1401);
        out.m_36.w = _1175;
        return out;
    }
    if (_82)
    {
        _1265 = 0.0;
    }
    float _1405 = _1265;
    float _1407 = _1405;
    if (_82)
    {
        _1403 = 0.0;
    }
    float _1409 = _1403;
    float _1411 = _1409;
    if (!_82)
    {
        float _1413 = _847 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = _1415;
    if (!_82)
    {
        float _1419 = _843 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1407 = _1419;
    }
    float _1421 = _1407;
    float _1423 = _1421;
    if (!_86)
    {
        float _1425 = fma(_819, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1415);
        _1417 = _1425;
    }
    float _1427 = _1417;
    if (_82)
    {
        _1267 = 0.0;
    }
    float _1429 = _1267;
    float _1431 = _1429;
    if (!_82)
    {
        float _1433 = _851 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1431 = _1433;
    }
    float _1435 = _1431;
    float _1437 = _1427 * 0.715200006961822509765625;
    float _1439 = _1435;
    if (!_86)
    {
        float _1441 = fma(_827, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1421);
        _1423 = _1441;
    }
    float _1443 = _1423;
    if (!_86)
    {
        float _1445 = fma(_863, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1435);
        _1439 = _1445;
    }
    float _1447 = _1439;
    float _1449 = fma(_1443, 0.2125999927520751953125, _1437);
    float _1451 = fma(_1447, 0.072200000286102294921875, _1449);
    float _1453 = 1.0 / _1451;
    float _1455 = _1453 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1457 = precise::clamp(_1455, 0.0, 1.0);
    float _1459 = fma(_1457, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1461 = _1459 * _1443;
    float _1463 = _1459 * _1427;
    float _1465 = _1459 * _1447;
    out.m_36.x = _1461;
    out.m_36.y = _1463;
    out.m_36.z = _1465;
    out.m_36.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _693 = false;
    bool _266 = false;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.y;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_33.z;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    int _66 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _70 = _66 != 0;
    int _72 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _74 = _72 != 0;
    int _76 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _78 = _76 != 0;
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _82 = _80 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _90 = _88 != 0;
    int _92 = int(_70);
    float _94 = 1.0 / _46;
    float _96 = _94 * _52;
    float _98 = _94 * _58;
    float _100 = _94 * _64;
    float _102 = _96 * _96;
    float _104 = fma(_98, _98, _102);
    float _106 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _108 = fma(_100, _100, _104);
    float _110 = precise::max(0.0, _106);
    float _112 = rsqrt(_108);
    float _114 = _98 * _112;
    float _116 = _100 * _112;
    float _118 = _96 * _112;
    float _120 = _114 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _122 = _116 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _124 = -_118;
    float _126 = -_110;
    float _128 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[13].z, _126);
    float _130 = _120 * _120;
    float _132 = _122 * _122;
    float _134 = _130 + _132;
    float _136 = sqrt(_134);
    bool _138 = _136 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _140 = _110;
    float _142 = _112;
    float _144 = _128;
    float _146 = _120;
    float _148 = _122;
    if (!_138)
    {
        _140 = _132;
    }
    float _150 = _140;
    float _152 = _150;
    if (!_138)
    {
        _142 = _130;
    }
    float _154 = _142;
    bool _156 = !_138;
    float _158 = _154;
    if (!_156)
    {
        float _160 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _162 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _164 = _136 + _162;
        float _166 = _128 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = rsqrt(_134);
        float _170 = _164 * _160;
        float _172 = _170 * 0.15915493667125701904296875;
        float _174 = _172 * 6.283185482025146484375;
        float _176 = sin(_174);
        float _178 = _172 * 6.283185482025146484375;
        float _180 = cos(_178);
        float _182 = fma(_176, _166, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _184 = _168 * _182;
        float _186 = _180 + (-1.0);
        float _188 = _120 * _184;
        float _190 = _122 * _184;
        float _192 = _186 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _194 = _190 * _190;
        float _196 = fma(_128, _180, _192);
        float _198 = _188 * _188;
        _144 = _196;
        _158 = _198;
        _152 = _194;
        _146 = _188;
        _148 = _190;
    }
    float _200 = _144;
    float _202 = _158;
    float _204 = _152;
    float _206 = _146;
    float _208 = _148;
    float _210 = fma(_200, _200, _202);
    float _212 = _210 + _204;
    float _214 = rsqrt(_212);
    float _216 = _214 * _200;
    float _218 = _214 * _206;
    float _220 = _214 * _208;
    float _222 = -_216;
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
        int _246 = as_type<int>(_230);
        int _248 = 0;
        int _250 = 1232;
        int _252;
        int _254;
        int _256;
        int _258;
        int _260;
        int _262;
        _42(_244, _246, _248, _250, _252, _254, _256, _258, _260, _262);
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
    bool _292 = _216 > 0.0;
    if (_292)
    {
        discard_fragment();
    }
    if (_292)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float _294 = -_118;
    float _296 = _294 + 1.0;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = -_118;
    float _302 = fma(_300, _118, 1.0);
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _240 * _290;
    int _308 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _310 = _308 != 0;
    float _312 = _116 * _116;
    float _314 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _316 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _318 = _114 * _114;
    float _320 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _322 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _324 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _326 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _328 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _330 = fma(_118, _322, _314);
    float _332 = _306 * 0.636619746685028076171875;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _298;
    if (_310)
    {
        float _338 = sqrt(_304);
        _336 = _338;
    }
    float _340 = _336;
    float _342 = _218 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _344 = -_116;
    float _346 = fma(_344, _324, _330);
    float _348 = fma(_116, _324, _330);
    float _350 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _352 = _312 + _318;
    float _354 = -_114;
    float _356 = fma(_354, _328, _346);
    float _358 = fma(_114, _328, _348);
    float _360 = fma(_118, _350, _316);
    float _362 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _364 = -_118;
    float _366 = _114 * _364;
    float _368 = rsqrt(_352);
    float _370 = -_116;
    float _372 = fma(_370, _326, _360);
    float _374 = fma(_116, _326, _360);
    float _376 = fma(_118, _362, _320);
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _382 = _118 * _116;
    float _384 = -_342;
    float _386 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[11].y, _384);
    float _388 = abs(_340);
    float _390 = log2(_388);
    float _392 = -_114;
    float _394 = fma(_392, _378, _372);
    float _396 = fma(_114, _378, _374);
    float _398 = -_116;
    float _400 = fma(_398, _380, _376);
    float _402 = fma(_116, _380, _376);
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _406 = -_334;
    float _408 = _406 + 1.0;
    float _410 = _114 * _118;
    float _412 = -_114;
    float _414 = fma(_412, _404, _400);
    float _416 = fma(_114, _404, _402);
    float _418 = -_116;
    float _420 = _118 * _418;
    float _422 = sqrt(_408);
    float _424 = _390 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _426 = exp2(_424);
    float _428 = -_422;
    float _430 = _428 + 1.0;
    float _432 = _426 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _434 = fma(_432, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _116 * _368;
    float _440 = _114 * _368;
    float _442 = -_436;
    float _444 = _442 + 1.0;
    float _446 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _448 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _450 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _452 = abs(_438);
    float _454 = abs(_440);
    float _456 = precise::max(_452, _454);
    float _458 = fma(_446, _366, _356);
    float _460 = fma(_446, _410, _358);
    float _462 = abs(_444);
    float _464 = log2(_462);
    float _466 = fma(_448, _366, _394);
    float _468 = fma(_450, _366, _414);
    float _470 = fma(_448, _410, _396);
    float _472 = fma(_450, _410, _416);
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _476 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _478 = precise::max(_456, 9.9999997473787516355514526367188e-05);
    float _480 = fma(_474, _420, _466);
    float _482 = fma(_474, _382, _470);
    float _484 = -_220;
    float _486 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _490 = fma(_476, _420, _458);
    float _492 = fma(_476, _382, _460);
    float _494 = 1.0 / _478;
    float _496 = fma(_488, _420, _468);
    float _498 = fma(_488, _382, _472);
    float _500 = _464 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _502 = exp2(_500);
    float _504 = _430 * 0.5;
    float _506 = fma(_486, -0.5, 0.5);
    float _508 = fma(_486, 0.5, 0.5);
    float _510 = fma(_508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _512 = -_494;
    float _514 = _438 * _512;
    float _516 = _216 + 1.0;
    float _518 = _440 * _494;
    float _520 = sqrt(_506);
    float _522 = fma(_514, _504, 0.5);
    float _524 = fma(_508, _510, -0.212114393711090087890625);
    float _526 = -_216;
    float _528 = fma(_502, _516, _526);
    float _530 = fma(_518, _504, 0.5);
    float _532 = fma(_508, _524, 1.570728778839111328125);
    float _534 = fma(_528, 0.5, 0.5);
    float2 _2191;
    _2191.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_522, _530));
    _2191.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_522, _530));
    float _536 = _2191.x;
    float _538 = _536 * 256.0;
    int _540 = int(_538);
    float _542 = fma(_216, -0.5, 0.5);
    float _544 = _520 * 0.636619746685028076171875;
    float _546 = -_532;
    float _548 = fma(_544, _546, 1.0);
    float2 _2210 = float2(_548, _542);
    float3 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2210, float2(0.0), isnan(_2210))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2210, float2(0.0), isnan(_2210))).xyz;
    float _554 = _552.x;
    float _556 = _552.y;
    float _558 = _552.z;
    float2 _2226 = float2(_548, _534);
    float3 _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2226, float2(0.0), isnan(_2226))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2226, float2(0.0), isnan(_2226))).xyz;
    float _562 = _560.x;
    float _564 = _560.y;
    float _566 = _560.z;
    float _568 = _114 * _116;
    float _570 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _572 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _574 = fma(_570, _568, _490);
    float _576 = fma(_570, _568, _492);
    float _578 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _580 = fma(_572, _568, _496);
    float _582 = fma(_572, _568, _498);
    float _584 = fma(_578, _568, _480);
    float _586 = fma(_578, _568, _482);
    float _588 = _116 * (-3.0);
    float _590 = -_116;
    float _592 = fma(_590, _588, -1.0);
    float _594 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _596 = fma(_312, 3.0, -1.0);
    float _598 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _600 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _602 = fma(_594, _592, _584);
    float _604 = fma(_594, _596, _586);
    float _606 = fma(_598, _592, _574);
    float _608 = fma(_598, _596, _576);
    float _610 = fma(_600, _592, _580);
    float _612 = float(uint(_540));
    float _614 = _612 * 0.00390625;
    float2 _2324 = float2(_522, _530);
    float2 _618 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2324, float2(0.0), isnan(_2324)), level(_614)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2324, float2(0.0), isnan(_2324)), level(_614)).xy;
    float _620 = _618.x;
    float _622 = _618.y;
    float2 _2337 = float2(_522, _530);
    float4 _625 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2337, float2(0.0), isnan(_2337)), level(_614)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2337, float2(0.0), isnan(_2337)), level(_614)).xyzw;
    float _627 = _625.x;
    float _629 = _625.y;
    float _631 = _625.z;
    float _633 = _625.w;
    float _635 = fma(_600, _596, _582);
    int _637 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _639 = _637 != 0;
    float _641 = -_118;
    float _643 = fma(_641, _118, _318);
    float _645 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _647 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _649 = fma(_645, _643, _606);
    float _651 = fma(_645, _643, _608);
    float _653 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _655 = fma(_647, _643, _602);
    float _657 = fma(_647, _643, _604);
    float _659 = fma(_653, _643, _610);
    float _661 = fma(_653, _643, _635);
    float _663 = _622 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _665 = !_639;
    int _667 = _639 ? (-1) : 0;
    int _681;
    int _683;
    int _685;
    int _687;
    int _689;
    int _691;
    if (!_665)
    {
        float _669 = _356 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _671 = _394 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _673 = _414 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _675 = _358 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _677 = _396 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _679 = _416 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _681 = as_type<int>(_677);
        _683 = as_type<int>(_675);
        _685 = as_type<int>(_669);
        _687 = as_type<int>(_671);
        _689 = as_type<int>(_673);
        _691 = as_type<int>(_679);
        _693 = true;
    }
    else
    {
        int _695 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _697 = _695 != 0;
        float _699 = _649 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _701 = _655 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _703 = _659 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _705 = _651 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _707 = _657 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _709 = _661 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _711 = as_type<int>(_699);
        int _713 = as_type<int>(_701);
        int _715 = as_type<int>(_703);
        int _717 = as_type<int>(_705);
        int _719 = as_type<int>(_707);
        _667 = _697 ? (-1) : 0;
        _691 = as_type<int>(_709);
        if (_697)
        {
            float _721 = _314 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _711 = as_type<int>(_721);
        }
        int _723 = _711;
        _685 = _723;
        if (_697)
        {
            float _725 = _316 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _713 = as_type<int>(_725);
        }
        int _727 = _713;
        _687 = _727;
        if (_697)
        {
            float _729 = _320 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _715 = as_type<int>(_729);
        }
        int _731 = _715;
        _689 = _731;
        if (_697)
        {
            _717 = _723;
        }
        int _733 = _717;
        _683 = _733;
        if (_697)
        {
            _719 = _727;
        }
        int _735 = _719;
        _681 = _735;
        if (_697)
        {
            _691 = _731;
        }
    }
    _693 = false;
    int _737 = _667;
    int _739 = _681;
    int _741 = _683;
    int _743 = _685;
    int _745 = _687;
    int _747 = _689;
    int _749 = _691;
    float _751 = _464 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    int _753 = 0;
    int _755 = _737;
    if (!_86)
    {
        int _757 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _759 = _757 != 0;
        _753 = _759 ? (-1) : 0;
    }
    int _761 = _753;
    float _763 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _765 = _216 * _763;
    if (_86)
    {
        _755 = -1;
    }
    int _767 = _755;
    float _769 = _633 * _633;
    int _771 = _767;
    if (!_86)
    {
        int _773 = ~_761;
        bool _775 = !_90;
        int _777 = _773 & (_775 ? (-1) : 0);
        _771 = _777;
    }
    int _779 = _771;
    float _781 = exp2(_751);
    bool _783 = _92 != 0;
    float _785 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[26].x, _765);
    float _787 = _769 * _769;
    float _789 = _216 * (-10000.0);
    float _791 = _787 * 16.0;
    float _793 = _631 * _791;
    float _795 = _627 * _791;
    int _797 = _779;
    if (_82)
    {
        _797 = -1;
    }
    int _799 = _797;
    float _801 = -_781;
    float _803 = _801 + 1.0;
    int _805 = _799;
    if (!_82)
    {
        bool _807 = !_90;
        bool _809 = _807 && _78;
        bool _811 = !_783;
        bool _813 = _809 && _811;
        _805 = _813 ? (-1) : 0;
    }
    int _815 = _805;
    int _817 = ~_779;
    float _819 = (_817 != 0) ? as_type<float>(_739) : 0.0;
    float _821 = _629 * _791;
    float _823 = _803 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _825 = ~_779;
    float _827 = (_825 != 0) ? as_type<float>(_741) : 0.0;
    float _829 = -_823;
    float _831 = _829 + 1.0;
    float _833 = abs(_831);
    float _835 = log2(_833);
    int _837 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _839 = _837 != 0;
    int _841 = ~_815;
    float _843 = (_841 != 0) ? as_type<float>(_743) : 0.0;
    int _845 = ~_815;
    float _847 = (_845 != 0) ? as_type<float>(_745) : 0.0;
    int _849 = ~_815;
    float _851 = (_849 != 0) ? as_type<float>(_747) : 0.0;
    bool _853 = !_90;
    bool _855 = _78 && _853;
    bool _857 = !_839;
    float _859 = _857 ? _620 : 0.0;
    int _861 = ~_779;
    float _863 = (_861 != 0) ? as_type<float>(_749) : 0.0;
    float _865 = _835 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _867 = _859 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _869 = _859 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _871 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _873 = _871 != 0;
    float _875 = _835 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _877 = !_855;
    float _879 = _877 ? _867 : 0.0;
    bool _881 = !_855;
    float _883 = _881 ? _869 : 0.0;
    float _885 = exp2(_865);
    bool _887 = !_873;
    float _889 = _879 * _827;
    bool _891 = !_873;
    float _893 = _879 * _819;
    bool _895 = !_887;
    float _897 = _895 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _899 = _879 * _863;
    bool _901 = !_873;
    int _903 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _905 = _903 != 0;
    float _907 = exp2(_875);
    float _909 = fma(_843, _883, _889);
    bool _911 = !_891;
    float _913 = _911 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _915 = fma(_847, _883, _893);
    bool _917 = !_905;
    float _919 = _897 * _909;
    bool _921 = !_74;
    float _923 = _921 ? _885 : 1.0;
    float _925 = _913 * _915;
    bool _927 = !_905;
    float _929 = fma(_851, _883, _899);
    bool _931 = !_901;
    float _933 = _931 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _935 = _923 * _859;
    float _937 = _927 ? _793 : 0.0;
    float _939 = _923 * _925;
    float _941 = _923 * _919;
    float _943 = _933 * _929;
    bool _945 = !_905;
    int _947 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _949 = _947 != 0;
    float _951 = _917 ? _795 : 0.0;
    bool _953 = !_74;
    int _955 = _953 ? as_type<int>(_907) : 1065353216;
    float _957 = _945 ? _821 : 0.0;
    float _959 = as_type<float>(_955) * _951;
    float _961 = as_type<float>(_955) * _957;
    float _963 = as_type<float>(_955) * _937;
    float _965 = _951;
    float _967 = _935;
    int _969 = _955;
    float _971 = _963;
    if (_74)
    {
        _965 = 0.0;
    }
    float _973 = _965;
    float _975 = _78 ? _935 : _939;
    float _977 = _78 ? _935 : _941;
    float _979 = _973;
    if (!_78)
    {
        float _981 = _923 * _943;
        _967 = _981;
    }
    float _983 = _967;
    float _985 = _975 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _987 = _985;
    if (_74)
    {
        _969 = as_type<int>(_663);
    }
    int _989 = _969;
    float _991 = _983 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _993 = fma(_961, (*spvDescriptorSet0.fp_c3)._m0[27].y, _985);
    float _995 = _977 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _997 = fma(_963, (*spvDescriptorSet0.fp_c3)._m0[27].z, _991);
    int _999 = _989;
    int _1001 = _989;
    float _1003 = _993;
    float _1005 = _997;
    if (_74)
    {
        _987 = 0.0;
    }
    float _1007 = _987;
    float _1009 = fma(_959, (*spvDescriptorSet0.fp_c3)._m0[27].x, _995);
    float _1011 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1013 = _1009;
    float _1015 = _1007;
    if (_74)
    {
        _971 = 0.0;
    }
    float _1017 = _971;
    bool _1019 = !_74;
    float _1021 = _1019 ? _823 : 0.0;
    float _1023 = _1017;
    if (!_74)
    {
        int _1025 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1027 = _1025 != 0;
        float _1029 = _564 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1031 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1033 = _1031 != 0;
        float _1035 = _562 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1037 = _566 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1039 = !_1033;
        float _1041 = _1039 ? _1035 : 0.0;
        bool _1043 = !_1033;
        float _1045 = _1043 ? _1029 : 0.0;
        bool _1047 = !_1033;
        float _1049 = _1047 ? _1037 : 0.0;
        float _1051 = _1021 * _1041;
        _979 = _1051;
        if (!_1027)
        {
            _999 = as_type<int>(_663);
        }
        int _1053 = _999;
        float _1055 = _1021 * _1045;
        float _1057 = _1021 * _1049;
        bool _1059 = !_1027;
        _1001 = _1053;
        _1015 = _1055;
        _1023 = _1057;
        if (!_1059)
        {
            float _1061 = -_1021;
            float _1063 = _1061 + 1.0;
            float _1065 = precise::clamp(_1063, 0.0, 1.0);
            float _1067 = _663 * _1065;
            float _1069 = precise::max(_1067, 9.9999997473787516355514526367188e-05);
            float _1071 = 1.0 / _1069;
            float _1073 = _663 * _1071;
            float _1075 = _1009 * _1073;
            float _1077 = _993 * _1073;
            float _1079 = _997 * _1073;
            _1001 = as_type<int>(_1067);
            _1013 = _1075;
            _979 = 0.0;
            _1003 = _1077;
            _1015 = 0.0;
            _1005 = _1079;
            _1023 = 0.0;
        }
    }
    int _1081 = _1001;
    float _1083 = _1013;
    float _1085 = _979;
    float _1087 = _1003;
    float _1089 = _1015;
    float _1091 = _1005;
    float _1093 = _1023;
    bool _1095 = !_949;
    float _1097 = _1095 ? as_type<float>(_1081) : 1.0;
    float _1099 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[26].z, _785);
    float _1101 = abs(_789);
    bool _1103 = _1101 > 0.00999999977648258209228515625;
    float _1105 = -_1011;
    float _1107 = exp2(_1105);
    float _1109 = -_1097;
    float _1111 = _1109 + 1.0;
    float _1113 = _1103 ? _789 : 0.00999999977648258209228515625;
    float _1115 = _1083 + _1085;
    float _1117 = _1087 + _1089;
    float _1119 = fma(_1099, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1121 = _556 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1123 = abs(_1111);
    float _1125 = log2(_1123);
    float _1127 = _1113 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1129 = fma(_1119, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1131 = _554 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1133 = _1091 + _1093;
    int _1135 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1137 = _1135 != 0;
    float _1139 = precise::max(_1127, -127.0);
    float _1141 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1143 = fma(_1141, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1145 = abs(_1129);
    float _1147 = log2(_1145);
    float _1149 = _1125 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1151 = -_1139;
    float _1153 = exp2(_1151);
    float _1155 = _1147 * 1.5;
    float _1157 = exp2(_1149);
    float _1159 = _558 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1161 = 1.0 / _1139;
    float _1163 = -_1153;
    float _1165 = _1163 + 1.0;
    float _1167 = _1107 * _1165;
    float _1169 = -_1157;
    float _1171 = spvFAdd(_1169, 1.00010001659393310546875);
    float _1173 = -_1157;
    float _1175 = _1173 + 1.0;
    float _1177 = exp2(_1155);
    float _1179 = -_1097;
    float _1181 = _1179 + _1175;
    float _1183 = _1167 * _1161;
    float _1185 = _1181 * _1121;
    float _1187 = _1181 * _1131;
    float _1189 = 1.0 / _1171;
    float _1191 = _1181 * _1159;
    float _1193 = fma(_1117, _1097, _1185);
    float _1195 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1197 = fma(_1115, _1097, _1187);
    float _1199 = _1177 * 12.56637096405029296875;
    float _1201 = _1183 * _1195;
    float _1203 = 1.0 / _1199;
    float _1205 = _1189 * _1193;
    float _1207 = fma(_1133, _1097, _1191);
    float _1209 = _1189 * _1197;
    float _1211 = _1205 * 0.715200006961822509765625;
    float _1213 = _1189 * _1207;
    float _1215 = -_1201;
    float _1217 = exp2(_1215);
    float _1219 = fma(_1209, 0.2125999927520751953125, _1211);
    float _1221 = fma(_1213, 0.072200000286102294921875, _1219);
    float _1223 = _1143 * _1203;
    float _1225 = 1.0 / _1221;
    float _1227 = -_1217;
    float _1229 = _1227 + 1.0;
    float _1231 = _1229 * _1223;
    float _1233 = _1231 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1235 = _1225 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1237 = precise::clamp(_1235, 0.0, 1.0);
    float _1239 = _1231 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1241 = fma(_1237, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1243 = _1241 * _1217;
    float _1245 = _1231 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1247 = fma(_1209, _1243, _1233);
    float _1249 = fma(_1205, _1243, _1245);
    float _1251 = fma(_1213, _1243, _1239);
    bool _1253 = !_1137;
    float _1255 = _1249;
    float _1257 = _1247;
    float _1259 = _1175;
    int _1261 = as_type<int>(_1205);
    int _1263 = as_type<int>(_1247);
    float _1265 = _1249;
    float _1267 = _1175;
    if (!_1253)
    {
        bool _1269 = _1175 != 1.0;
        bool _1271 = isnan(_1175);
        bool _1273 = _1269 || _1271;
        bool _1275 = isnan(1.0);
        bool _1277 = _1273 || _1275;
        float _1279 = -_1157;
        bool _1281 = _1279 != (-1.0);
        bool _1283 = isnan(_1279);
        bool _1285 = _1281 || _1283;
        bool _1287 = isnan(-1.0);
        bool _1289 = _1285 || _1287;
        float _1291 = -_1157;
        bool _1293 = _1291 == (-1.0);
        bool _1295 = !_1277;
        bool _1297 = _1293 || _1295;
        bool _1299 = _1175 == 1.0;
        bool _1301 = _1299 && _1289;
        bool _1303 = !_1297;
        float _1305 = _1303 ? _1175 : 0.0;
        bool _1307 = !_1301;
        float _1309 = _1307 ? 0.0 : 1.0;
        float _1311 = _1297 ? 0.0 : 0.5;
        float _1313 = _1305 * 0.715200006961822509765625;
        float _1315 = fma(_1309, 0.2125999927520751953125, _1313);
        float _1317 = fma(_1311, 0.072200000286102294921875, _1315);
        float _1319 = 1.0 / _1317;
        float _1321 = _1319 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1323 = precise::clamp(_1321, 0.0, 1.0);
        float _1325 = fma(_1323, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1327 = _1309 * _1325;
        float _1329 = _1305 * _1325;
        float _1331 = _1311 * _1325;
        out.m_36.x = _1327;
        out.m_36.y = _1329;
        out.m_36.z = _1331;
        out.m_36.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    bool _1333 = _92 != 0;
    bool _1335 = !_1333;
    if (!_1335)
    {
        if (_82)
        {
            _1255 = 0.0;
        }
        float _1337 = _1255;
        float _1339 = _1337;
        if (_82)
        {
            _1257 = 0.0;
        }
        float _1341 = _1257;
        float _1343 = _1341;
        if (!_82)
        {
            float _1345 = _847 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1343 = _1345;
        }
        float _1347 = _1343;
        float _1349 = _1347;
        if (!_82)
        {
            float _1351 = _843 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1339 = _1351;
        }
        float _1353 = _1339;
        float _1355 = _1353;
        if (!_86)
        {
            float _1357 = fma(_819, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1347);
            _1349 = _1357;
        }
        float _1359 = _1349;
        if (_82)
        {
            _1259 = 0.0;
        }
        float _1361 = _1259;
        float _1363 = _1361;
        if (!_82)
        {
            float _1365 = _851 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1363 = _1365;
        }
        float _1367 = _1363;
        float _1369 = _1359 * 0.715200006961822509765625;
        float _1371 = _1367;
        if (!_86)
        {
            float _1373 = fma(_827, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1353);
            _1355 = _1373;
        }
        float _1375 = _1355;
        if (!_86)
        {
            float _1377 = fma(_863, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1367);
            _1371 = _1377;
        }
        float _1379 = _1371;
        float _1381 = fma(_1375, 0.2125999927520751953125, _1369);
        float _1383 = fma(_1379, 0.072200000286102294921875, _1381);
        float _1385 = 1.0 / _1383;
        float _1387 = _1385 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1389 = precise::clamp(_1387, 0.0, 1.0);
        float _1391 = fma(_1389, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1393 = _1391 * _1375;
        float _1395 = _1391 * _1359;
        float _1397 = _1391 * _1379;
        out.m_36.x = _1393;
        out.m_36.y = _1395;
        out.m_36.z = _1397;
        out.m_36.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    if (!_90)
    {
        _1261 = as_type<int>(_1247);
    }
    int _1399 = _1261;
    if (!_90)
    {
        _1263 = as_type<int>(_1251);
    }
    int _1401 = _1263;
    float _1403 = as_type<float>(_1401);
    if (!_90)
    {
        out.m_36.x = as_type<float>(_1399);
        out.m_36.y = _1249;
        out.m_36.z = as_type<float>(_1401);
        out.m_36.w = _1175;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    if (_82)
    {
        _1265 = 0.0;
    }
    float _1405 = _1265;
    float _1407 = _1405;
    if (_82)
    {
        _1403 = 0.0;
    }
    float _1409 = _1403;
    float _1411 = _1409;
    if (!_82)
    {
        float _1413 = _847 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = _1415;
    if (!_82)
    {
        float _1419 = _843 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1407 = _1419;
    }
    float _1421 = _1407;
    float _1423 = _1421;
    if (!_86)
    {
        float _1425 = fma(_819, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1415);
        _1417 = _1425;
    }
    float _1427 = _1417;
    if (_82)
    {
        _1267 = 0.0;
    }
    float _1429 = _1267;
    float _1431 = _1429;
    if (!_82)
    {
        float _1433 = _851 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1431 = _1433;
    }
    float _1435 = _1431;
    float _1437 = _1427 * 0.715200006961822509765625;
    float _1439 = _1435;
    if (!_86)
    {
        float _1441 = fma(_827, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1421);
        _1423 = _1441;
    }
    float _1443 = _1423;
    if (!_86)
    {
        float _1445 = fma(_863, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1435);
        _1439 = _1445;
    }
    float _1447 = _1439;
    float _1449 = fma(_1443, 0.2125999927520751953125, _1437);
    float _1451 = fma(_1447, 0.072200000286102294921875, _1449);
    float _1453 = 1.0 / _1451;
    float _1455 = _1453 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1457 = precise::clamp(_1455, 0.0, 1.0);
    float _1459 = fma(_1457, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1461 = _1459 * _1443;
    float _1463 = _1459 * _1427;
    float _1465 = _1459 * _1447;
    out.m_36.x = _1461;
    out.m_36.y = _1463;
    out.m_36.z = _1465;
    out.m_36.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

