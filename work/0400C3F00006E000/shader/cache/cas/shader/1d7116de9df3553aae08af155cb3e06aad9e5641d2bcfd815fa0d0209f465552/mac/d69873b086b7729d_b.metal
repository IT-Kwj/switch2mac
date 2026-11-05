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
void _46(thread const int& _3737, thread const int& _3738, thread const int& _3739, thread const int& _3740, thread int& _3741, thread int& _3742, thread int& _3743, thread int& _3744, thread int& _3745, thread int& _3746)
{
    float _3749 = as_type<float>(_3739) + 0.0;
    bool _3751 = _3749 != 0.0;
    bool _3753 = isnan(_3749);
    bool _3755 = _3751 || _3753;
    bool _3757 = isnan(0.0);
    bool _3759 = _3755 || _3757;
    int _3761 = as_type<int>(_3749);
    int _3763 = 0;
    int _3765 = _3737;
    int _3767 = _3759 ? (-1) : 0;
    if (!_3759)
    {
        float _3769 = as_type<float>(_3739) * 1.0;
        _3761 = as_type<int>(_3769);
    }
    int _3771 = _3761;
    bool _3773 = !_3759;
    int _3775 = _3771;
    if (!_3773)
    {
        float _3777 = as_type<float>(_3739) + 0.0;
        bool _3779 = _3777 >= 0.0;
        bool _3781 = isnan(_3777);
        bool _3783 = _3779 || _3781;
        bool _3785 = isnan(0.0);
        bool _3787 = _3783 || _3785;
        int _3789 = as_type<int>(_3777);
        _3767 = _3787 ? (-1) : 0;
        if (!_3787)
        {
            _3789 = 2147483647;
        }
        int _3791 = _3789;
        bool _3793 = !_3787;
        _3775 = _3791;
        if (!_3793)
        {
            float _3795 = abs(as_type<float>(_3739));
            float _3797 = _3795 + 0.0;
            bool _3799 = _3797 > as_type<float>(0x7f800000u /* inf */);
            bool _3801 = isnan(_3797);
            bool _3803 = _3799 || _3801;
            bool _3805 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3807 = _3803 || _3805;
            int _3809 = as_type<int>(_3797);
            _3763 = 2139095040;
            _3767 = _3807 ? (-1) : 0;
            if (_3807)
            {
                float _3811 = as_type<float>(_3739) + 1.0;
                _3809 = as_type<int>(_3811);
            }
            int _3813 = _3809;
            _3775 = _3813;
            if (!_3807)
            {
                float _3815 = abs(as_type<float>(_3739));
                float _3817 = _3815 + (-0.0);
                float _3819 = 0.0 + _3817;
                bool _3821 = _3819 != as_type<float>(0x7f800000u /* inf */);
                bool _3823 = isnan(_3819);
                bool _3825 = _3821 || _3823;
                bool _3827 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3829 = _3825 || _3827;
                int _3831 = as_type<int>(_3819);
                _3767 = _3829 ? (-1) : 0;
                if (!_3829)
                {
                    _3831 = _3739;
                }
                int _3833 = _3831;
                bool _3835 = !_3829;
                _3775 = _3833;
                if (!_3835)
                {
                    float _3837 = as_type<float>(_3739) * 18446744073709551616.0;
                    float _3839 = rsqrt(_3837);
                    float _3841 = _3837 * _3839;
                    float _3843 = _3839 * 0.5;
                    float _3845 = -_3841;
                    float _3847 = 0.0 + _3845;
                    float _3849 = fma(_3843, _3847, 0.5);
                    float _3851 = fma(_3841, _3849, _3841);
                    float _3853 = -_3851;
                    float _3855 = 0.0 + _3853;
                    float _3857 = fma(_3851, _3855, _3837);
                    float _3859 = fma(_3843, _3857, _3851);
                    float _3861 = _3859 * 2.3283064365386962890625e-10;
                    _3775 = as_type<int>(_3861);
                    _3763 = as_type<int>(_3837);
                    _3765 = as_type<int>(_3857);
                }
            }
        }
    }
    int _3863 = _3775;
    int _3865 = _3763;
    int _3867 = _3765;
    int _3869 = _3767;
    _3741 = _3863;
    _3742 = _3865;
    _3743 = _3867;
    _3744 = _3740;
    _3745 = 0;
    _3746 = _3869;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _783 = false;
    bool _266 = false;
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
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    float2 _1895;
    _1895.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    _1895.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    float _344 = _1895.x;
    float _346 = _344 * 256.0;
    int _348 = int(_346);
    float _350 = -_122;
    float _352 = _350 + 1.0;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = _218 * _210;
    float _358 = _218 * _212;
    int _360 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _362 = _360 != 0;
    float _364 = -_122;
    float _366 = fma(_364, _122, 1.0);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _356 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _372 = _118 * _122;
    float _374 = fma(_294, 3.0, -1.0);
    float _376 = -_370;
    float _378 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[11].y, _376);
    float _380 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _382 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _386 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _388 = _354;
    if (_362)
    {
        float _390 = sqrt(_368);
        _388 = _390;
    }
    float _392 = _388;
    float _394 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _396 = fma(_122, _384, _380);
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _400 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _402 = -_358;
    float _404 = fma(_402, (*spvDescriptorSet0.fp_c3)._m0[11].z, _378);
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _408 = fma(_122, _394, _382);
    float _410 = fma(_122, _398, _386);
    float _412 = -_120;
    float _414 = fma(_412, _400, _396);
    float _416 = fma(_120, _400, _396);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _420 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _422 = -_120;
    float _424 = fma(_422, _406, _408);
    float _426 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _428 = fma(_120, _406, _408);
    float _430 = abs(_392);
    float _432 = log2(_430);
    float _434 = -_118;
    float _436 = fma(_434, _418, _414);
    float _438 = fma(_118, _418, _416);
    float _440 = -_120;
    float _442 = fma(_440, _420, _410);
    float _444 = _120 * (-3.0);
    float _446 = fma(_120, _420, _410);
    float _448 = -_118;
    float _450 = fma(_448, _426, _424);
    float _452 = _118 * _118;
    float _454 = fma(_118, _426, _428);
    float _456 = -_120;
    float _458 = fma(_456, _444, -1.0);
    float _460 = _118 * _120;
    float _462 = -_120;
    float _464 = _122 * _462;
    float _466 = _122 * _120;
    float _468 = -_122;
    float _470 = _118 * _468;
    float _472 = -_122;
    float _474 = fma(_472, _122, _452);
    float _476 = _432 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _478 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _480 = exp2(_476);
    float _482 = -_118;
    float _484 = fma(_482, _478, _442);
    float _486 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _490 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _492 = fma(_118, _478, _446);
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _496 = fma(_486, _470, _436);
    float _498 = fma(_488, _470, _450);
    float _500 = fma(_490, _470, _484);
    float _502 = fma(_486, _372, _438);
    float _504 = fma(_488, _372, _454);
    float _506 = fma(_490, _372, _492);
    float _508 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _510 = fma(_494, _464, _496);
    float _512 = _480 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _514 = fma(_494, _466, _502);
    float _516 = fma(_508, _464, _498);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _520 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = fma(_508, _466, _504);
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _528 = fma(_518, _464, _500);
    float _530 = -_522;
    float _532 = _530 + 1.0;
    float _534 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _536 = fma(_518, _466, _506);
    float _538 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _540 = fma(_526, _460, _510);
    float _542 = fma(_534, _460, _528);
    float _544 = abs(_532);
    float _546 = log2(_544);
    float _548 = fma(_526, _460, _514);
    float _550 = fma(_538, _460, _516);
    float _552 = fma(_538, _460, _524);
    float _554 = fma(_534, _460, _536);
    float _556 = fma(_404, 0.5, 0.5);
    float _558 = fma(_404, -0.5, 0.5);
    float _560 = fma(_556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _562 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _564 = fma(_556, _560, -0.212114393711090087890625);
    float _566 = _546 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _568 = fma(_562, _458, _540);
    float _570 = fma(_562, _374, _548);
    float _572 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _574 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _576 = exp2(_566);
    float _578 = fma(_556, _564, 1.570728778839111328125);
    float _580 = fma(_572, _374, _552);
    float _582 = fma(_574, _374, _554);
    float _584 = _220 + 1.0;
    float _586 = fma(_572, _458, _550);
    float _588 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _590 = fma(_574, _458, _542);
    float _592 = sqrt(_558);
    float _594 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _596 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _598 = fma(_588, _474, _586);
    float _600 = fma(_588, _474, _580);
    float _602 = fma(_594, _474, _568);
    float _604 = fma(_594, _474, _570);
    float _606 = fma(_596, _474, _590);
    float _608 = -_220;
    float _610 = fma(_576, _584, _608);
    float _612 = fma(_596, _474, _582);
    float _614 = fma(_220, -0.5, 0.5);
    float _616 = fma(_610, 0.5, 0.5);
    float _618 = _592 * 0.636619746685028076171875;
    float _620 = -_578;
    float _622 = fma(_618, _620, 1.0);
    float _624 = float(uint(_348));
    float _626 = _624 * 0.00390625;
    float2 _2358 = float2(_340, _342);
    float4 _629 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2358, float2(0.0), isnan(_2358)), level(_626)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2358, float2(0.0), isnan(_2358)), level(_626)).xyzw;
    float _631 = _629.x;
    float _633 = _629.y;
    float _635 = _629.z;
    float _637 = _629.w;
    float2 _2377 = float2(_340, _342);
    float2 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2377, float2(0.0), isnan(_2377)), level(_626)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2377, float2(0.0), isnan(_2377)), level(_626)).xy;
    float _643 = _641.x;
    float _645 = _641.y;
    float2 _2390 = float2(_340, _342);
    float2 _647 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2390, float2(0.0), isnan(_2390)), level(_626)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2390, float2(0.0), isnan(_2390)), level(_626)).xy;
    float _649 = _647.x;
    float _651 = _647.y;
    float2 _2403 = float2(_340, _342);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2403, float2(0.0), isnan(_2403)), level(_626)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2403, float2(0.0), isnan(_2403)), level(_626)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2420 = float2(_622, _614);
    float3 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2420, float2(0.0), isnan(_2420))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2420, float2(0.0), isnan(_2420))).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float2 _2434 = float2(_622, _616);
    float3 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2434, float2(0.0), isnan(_2434))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2434, float2(0.0), isnan(_2434))).xyz;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    int _681 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _683 = _681 != 0;
    int _685 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _687 = _685 != 0;
    float _689 = _637 * _637;
    float _691 = _689 * _689;
    float _693 = -_645;
    float _695 = _693 + _651;
    float _697 = _661 * _661;
    float _699 = _691 * 16.0;
    float _701 = _643 * _645;
    float _703 = _697 * _697;
    float _705 = _699 * _645;
    float _707 = fma(_695, (*spvDescriptorSet0.fp_c3)._m0[0].x, _645);
    float _709 = -_701;
    float _711 = fma(_649, _651, _709);
    float _713 = _631 * _705;
    float _715 = _633 * _705;
    float _717 = precise::max(_707, 1.52587890625e-05);
    float _719 = _635 * _705;
    float _721 = _703 * 16.0;
    float _723 = fma(_711, (*spvDescriptorSet0.fp_c3)._m0[0].x, _701);
    float _725 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _727 = 1.0 / _717;
    float _729 = _721 * _651;
    float _731 = -_713;
    float _733 = fma(_655, _729, _731);
    float _735 = -_715;
    float _737 = fma(_657, _729, _735);
    float _739 = -_719;
    float _741 = fma(_659, _729, _739);
    float _743 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[0].x, _713);
    float _745 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[0].x, _715);
    float _747 = _723 * _727;
    float _749 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[0].x, _719);
    bool _751 = !_683;
    float _753 = _751 ? _747 : 0.0;
    bool _755 = !_687;
    int _757 = _687 ? (-1) : 0;
    int _771;
    int _773;
    int _775;
    int _777;
    int _779;
    int _781;
    if (!_755)
    {
        float _759 = _436 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _761 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _763 = _484 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _765 = _438 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _767 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _769 = _492 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _771 = as_type<int>(_765);
        _773 = as_type<int>(_767);
        _775 = as_type<int>(_769);
        _777 = as_type<int>(_759);
        _779 = as_type<int>(_761);
        _781 = as_type<int>(_763);
        _783 = true;
    }
    else
    {
        int _785 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _787 = _785 != 0;
        float _789 = _602 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _791 = _598 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _793 = _606 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _795 = _604 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _797 = _600 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _799 = _612 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _801 = as_type<int>(_789);
        int _803 = as_type<int>(_791);
        int _805 = as_type<int>(_793);
        int _807 = as_type<int>(_795);
        int _809 = as_type<int>(_797);
        _757 = _787 ? (-1) : 0;
        _775 = as_type<int>(_799);
        if (_787)
        {
            float _811 = _380 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _801 = as_type<int>(_811);
        }
        int _813 = _801;
        _777 = _813;
        if (_787)
        {
            float _815 = _382 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _803 = as_type<int>(_815);
        }
        int _817 = _803;
        _779 = _817;
        if (_787)
        {
            float _819 = _386 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _805 = as_type<int>(_819);
        }
        int _821 = _805;
        _781 = _821;
        if (_787)
        {
            _807 = _813;
        }
        int _823 = _807;
        _771 = _823;
        if (_787)
        {
            _809 = _817;
        }
        int _825 = _809;
        _773 = _825;
        if (_787)
        {
            _775 = _821;
        }
    }
    _783 = false;
    int _827 = _757;
    int _829 = _771;
    int _831 = _773;
    int _833 = _775;
    int _835 = _777;
    int _837 = _779;
    int _839 = _781;
    float _841 = _546 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    int _843 = 0;
    int _845 = _827;
    if (!_90)
    {
        int _847 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _849 = _847 != 0;
        _843 = _849 ? (-1) : 0;
    }
    int _851 = _843;
    float _853 = _753 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    if (_90)
    {
        _845 = -1;
    }
    int _855 = _845;
    float _857 = _753 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _859 = _855;
    if (!_90)
    {
        int _861 = ~_851;
        bool _863 = !_94;
        int _865 = _861 & (_863 ? (-1) : 0);
        _859 = _865;
    }
    int _867 = _859;
    float _869 = exp2(_841);
    bool _871 = _96 != 0;
    float _873 = _745 * _727;
    float _875 = _743 * _727;
    float _877 = _749 * _727;
    int _879 = _867;
    float _881 = _875;
    if (_86)
    {
        _879 = -1;
    }
    int _883 = _879;
    float _885 = -_869;
    float _887 = _885 + 1.0;
    int _889 = _883;
    if (!_86)
    {
        bool _891 = !_94;
        bool _893 = _891 && _82;
        bool _895 = !_871;
        bool _897 = _893 && _895;
        _889 = _897 ? (-1) : 0;
    }
    int _899 = _889;
    int _901 = ~_867;
    float _903 = (_901 != 0) ? as_type<float>(_829) : 0.0;
    float _905 = _887 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _907 = ~_867;
    float _909 = (_907 != 0) ? as_type<float>(_831) : 0.0;
    int _911 = ~_867;
    float _913 = (_911 != 0) ? as_type<float>(_833) : 0.0;
    float _915 = -_905;
    float _917 = _915 + 1.0;
    float _919 = abs(_917);
    float _921 = log2(_919);
    bool _923 = !_94;
    bool _925 = _82 && _923;
    int _927 = ~_899;
    float _929 = (_927 != 0) ? as_type<float>(_835) : 0.0;
    int _931 = ~_899;
    float _933 = (_931 != 0) ? as_type<float>(_837) : 0.0;
    int _935 = ~_899;
    float _937 = (_935 != 0) ? as_type<float>(_839) : 0.0;
    int _939 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _941 = _939 != 0;
    bool _943 = !_925;
    float _945 = _943 ? _853 : 0.0;
    float _947 = _921 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _949 = _921 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _951 = !_925;
    float _953 = _951 ? _857 : 0.0;
    bool _955 = !_941;
    float _957 = _945 * _903;
    float _959 = exp2(_947);
    bool _961 = !_941;
    float _963 = _945 * _909;
    bool _965 = !_955;
    float _967 = _965 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _969 = _945 * _913;
    bool _971 = !_961;
    float _973 = _971 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _975 = fma(_929, _953, _957);
    float _977 = fma(_933, _953, _963);
    float _979 = exp2(_949);
    bool _981 = !_941;
    float _983 = _967 * _975;
    float _985 = _973 * _977;
    int _987 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _989 = _987 != 0;
    bool _991 = !_981;
    float _993 = _991 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _995 = fma(_937, _953, _969);
    bool _997 = !_78;
    float _999 = _997 ? _959 : 1.0;
    float _1001 = _993 * _995;
    float _1003 = _999 * _983;
    float _1005 = _753 * _999;
    bool _1007 = !_78;
    float _1009 = _1007 ? _979 : 1.0;
    float _1011 = _999 * _985;
    bool _1013 = !_989;
    float _1015 = _82 ? _1005 : _1003;
    float _1017 = _82 ? _1005 : _1011;
    float _1019 = _1005;
    float _1021 = _1009;
    float _1023 = _905;
    if (!_82)
    {
        float _1025 = _999 * _1001;
        _1019 = _1025;
    }
    float _1027 = _1019;
    float _1029 = _1013 ? _877 : 0.0;
    float _1031 = _1015 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    bool _1033 = !_989;
    float _1035 = _1027 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    bool _1037 = !_989;
    float _1039 = _1009 * _1029;
    int _1041 = as_type<int>(_1027);
    float _1043 = _1039;
    float _1045 = _1035;
    if (_78)
    {
        _1041 = as_type<int>(_725);
    }
    int _1047 = _1041;
    float _1049 = _1033 ? _875 : 0.0;
    float _1051 = _1037 ? _873 : 0.0;
    float _1053 = _1009 * _1049;
    float _1055 = _1009 * _1051;
    float _1057 = _1017 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1059 = fma(_1053, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1031);
    float _1061 = fma(_1055, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1057);
    float _1063 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1035);
    float _1065 = _1057;
    int _1067 = _1047;
    int _1069 = _1047;
    if (_78)
    {
        _881 = 0.0;
    }
    float _1071 = _881;
    bool _1073 = !_78;
    float _1075 = _1073 ? _905 : 0.0;
    float _1077 = _1071;
    if (_78)
    {
        _1043 = 0.0;
    }
    float _1079 = _1043;
    float _1081 = _1079;
    if (_78)
    {
        _1045 = 0.0;
    }
    float _1083 = _1045;
    float _1085 = _1083;
    if (_78)
    {
        _1065 = _1059;
    }
    float _1087 = _1065;
    float _1089 = _1087;
    float _1091 = _1087;
    if (_78)
    {
        _1021 = _1061;
    }
    float _1093 = _1021;
    float _1095 = _1093;
    float _1097 = _1093;
    if (_78)
    {
        _1023 = _1063;
    }
    float _1099 = _1023;
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
        float _1131 = _1075 * _1121;
        _1077 = _1131;
        if (!_1107)
        {
            _1067 = as_type<int>(_725);
        }
        int _1133 = _1067;
        float _1135 = _1075 * _1125;
        _1081 = _1135;
        _1069 = _1133;
        if (!_1107)
        {
            _1089 = _1059;
        }
        float _1137 = _1089;
        float _1139 = _1075 * _1129;
        _1091 = _1137;
        _1085 = _1139;
        if (!_1107)
        {
            _1095 = _1061;
        }
        float _1141 = _1095;
        _1097 = _1141;
        if (!_1107)
        {
            _1101 = _1063;
        }
        float _1143 = _1101;
        bool _1145 = !_1107;
        _1103 = _1143;
        if (!_1145)
        {
            float _1147 = -_1075;
            float _1149 = _1147 + 1.0;
            float _1151 = precise::clamp(_1149, 0.0, 1.0);
            float _1153 = _725 * _1151;
            float _1155 = precise::max(_1153, 9.9999997473787516355514526367188e-05);
            float _1157 = 1.0 / _1155;
            float _1159 = _725 * _1157;
            float _1161 = _1059 * _1159;
            float _1163 = _1061 * _1159;
            float _1165 = _1063 * _1159;
            _1097 = _1163;
            _1081 = 0.0;
            _1091 = _1161;
            _1077 = 0.0;
            _1069 = as_type<int>(_1153);
            _1103 = _1165;
            _1085 = 0.0;
        }
    }
    float _1167 = _1097;
    float _1169 = _1081;
    float _1171 = _1091;
    float _1173 = _1077;
    int _1175 = _1069;
    float _1177 = _1103;
    float _1179 = _1085;
    int _1181 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1183 = _1181 != 0;
    int _1185 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1187 = _1185 != 0;
    float _1189 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1191 = _667 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1193 = _1167 + _1169;
    float _1195 = _1171 + _1173;
    bool _1197 = !_1187;
    float _1199 = _1197 ? as_type<float>(_1175) : 1.0;
    float _1201 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1203 = _1177 + _1179;
    float _1205 = -_1199;
    float _1207 = _1205 + 1.0;
    float _1209 = abs(_1207);
    float _1211 = log2(_1209);
    float _1213 = _1211 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1215 = exp2(_1213);
    float _1217 = -_1215;
    float _1219 = spvFAdd(_1217, 1.00010001659393310546875);
    float _1221 = -_1215;
    float _1223 = _1221 + 1.0;
    float _1225 = -_1199;
    float _1227 = _1225 + _1223;
    float _1229 = 1.0 / _1219;
    float _1231 = _1189 * _1227;
    float _1233 = _1191 * _1227;
    float _1235 = _1201 * _1227;
    float _1237 = fma(_1193, _1199, _1231);
    float _1239 = fma(_1195, _1199, _1233);
    float _1241 = fma(_1203, _1199, _1235);
    float _1243 = _1229 * _1237;
    float _1245 = _1229 * _1239;
    float _1247 = _1229 * _1241;
    float _1249 = _1243 * 0.715200006961822509765625;
    float _1251 = fma(_1245, 0.2125999927520751953125, _1249);
    float _1253 = fma(_1247, 0.072200000286102294921875, _1251);
    float _1255 = 1.0 / _1253;
    float _1257 = _1255 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1259 = precise::clamp(_1257, 0.0, 1.0);
    float _1261 = fma(_1259, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1263 = _1245 * _1261;
    float _1265 = _1243 * _1261;
    float _1267 = _1247 * _1261;
    bool _1269 = !_1183;
    float _1271 = _1223;
    float _1273 = _1263;
    float _1275 = _1267;
    int _1277 = as_type<int>(_1215);
    int _1279 = as_type<int>(_1263);
    float _1281 = _1223;
    float _1283 = _1267;
    if (!_1269)
    {
        bool _1285 = _1223 != 1.0;
        bool _1287 = isnan(_1223);
        bool _1289 = _1285 || _1287;
        bool _1291 = isnan(1.0);
        bool _1293 = _1289 || _1291;
        float _1295 = -_1215;
        bool _1297 = _1295 != (-1.0);
        bool _1299 = isnan(_1295);
        bool _1301 = _1297 || _1299;
        bool _1303 = isnan(-1.0);
        bool _1305 = _1301 || _1303;
        float _1307 = -_1215;
        bool _1309 = _1307 == (-1.0);
        bool _1311 = !_1293;
        bool _1313 = _1309 || _1311;
        bool _1315 = _1223 == 1.0;
        bool _1317 = _1315 && _1305;
        bool _1319 = !_1313;
        float _1321 = _1319 ? _1223 : 0.0;
        bool _1323 = !_1317;
        float _1325 = _1323 ? 0.0 : 1.0;
        float _1327 = _1313 ? 0.0 : 0.5;
        float _1329 = _1321 * 0.715200006961822509765625;
        float _1331 = fma(_1325, 0.2125999927520751953125, _1329);
        float _1333 = fma(_1327, 0.072200000286102294921875, _1331);
        float _1335 = 1.0 / _1333;
        float _1337 = _1335 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1339 = precise::clamp(_1337, 0.0, 1.0);
        float _1341 = fma(_1339, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1343 = _1325 * _1341;
        float _1345 = _1321 * _1341;
        float _1347 = _1327 * _1341;
        out.m_40.x = _1343;
        out.m_40.y = _1345;
        out.m_40.z = _1347;
        out.m_40.w = 1.0;
        return out;
    }
    bool _1349 = _96 != 0;
    bool _1351 = !_1349;
    if (!_1351)
    {
        if (_86)
        {
            _1271 = 0.0;
        }
        float _1353 = _1271;
        float _1355 = _1353;
        if (_86)
        {
            _1273 = 0.0;
        }
        float _1357 = _1273;
        float _1359 = _1357;
        if (!_86)
        {
            float _1361 = _933 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1359 = _1361;
        }
        float _1363 = _1359;
        float _1365 = _1363;
        if (!_86)
        {
            float _1367 = _929 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1355 = _1367;
        }
        float _1369 = _1355;
        float _1371 = _1369;
        if (!_90)
        {
            float _1373 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1363);
            _1365 = _1373;
        }
        float _1375 = _1365;
        if (_86)
        {
            _1275 = 0.0;
        }
        float _1377 = _1275;
        float _1379 = _1377;
        if (!_86)
        {
            float _1381 = _937 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1379 = _1381;
        }
        float _1383 = _1379;
        float _1385 = _1375 * 0.715200006961822509765625;
        float _1387 = _1383;
        if (!_90)
        {
            float _1389 = fma(_903, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1369);
            _1371 = _1389;
        }
        float _1391 = _1371;
        if (!_90)
        {
            float _1393 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1383);
            _1387 = _1393;
        }
        float _1395 = _1387;
        float _1397 = fma(_1391, 0.2125999927520751953125, _1385);
        float _1399 = fma(_1395, 0.072200000286102294921875, _1397);
        float _1401 = 1.0 / _1399;
        float _1403 = _1401 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1405 = precise::clamp(_1403, 0.0, 1.0);
        float _1407 = fma(_1405, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1409 = _1407 * _1391;
        float _1411 = _1407 * _1375;
        float _1413 = _1407 * _1395;
        out.m_40.x = _1409;
        out.m_40.y = _1411;
        out.m_40.z = _1413;
        out.m_40.w = 1.0;
        return out;
    }
    if (!_94)
    {
        _1277 = as_type<int>(_1263);
    }
    int _1415 = _1277;
    if (!_94)
    {
        _1279 = as_type<int>(_1265);
    }
    int _1417 = _1279;
    float _1419 = as_type<float>(_1417);
    if (!_94)
    {
        out.m_40.x = as_type<float>(_1415);
        out.m_40.y = as_type<float>(_1417);
        out.m_40.z = _1267;
        out.m_40.w = _1223;
        return out;
    }
    if (_86)
    {
        _1281 = 0.0;
    }
    float _1421 = _1281;
    float _1423 = _1421;
    if (_86)
    {
        _1419 = 0.0;
    }
    float _1425 = _1419;
    float _1427 = _1425;
    if (!_86)
    {
        float _1429 = _933 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1427 = _1429;
    }
    float _1431 = _1427;
    float _1433 = _1431;
    if (!_86)
    {
        float _1435 = _929 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1423 = _1435;
    }
    float _1437 = _1423;
    float _1439 = _1437;
    if (!_90)
    {
        float _1441 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1431);
        _1433 = _1441;
    }
    float _1443 = _1433;
    if (_86)
    {
        _1283 = 0.0;
    }
    float _1445 = _1283;
    float _1447 = _1445;
    if (!_86)
    {
        float _1449 = _937 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1447 = _1449;
    }
    float _1451 = _1447;
    float _1453 = _1443 * 0.715200006961822509765625;
    float _1455 = _1451;
    if (!_90)
    {
        float _1457 = fma(_903, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1437);
        _1439 = _1457;
    }
    float _1459 = _1439;
    if (!_90)
    {
        float _1461 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1451);
        _1455 = _1461;
    }
    float _1463 = _1455;
    float _1465 = fma(_1459, 0.2125999927520751953125, _1453);
    float _1467 = fma(_1463, 0.072200000286102294921875, _1465);
    float _1469 = 1.0 / _1467;
    float _1471 = _1469 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1473 = precise::clamp(_1471, 0.0, 1.0);
    float _1475 = fma(_1473, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1477 = _1475 * _1459;
    float _1479 = _1475 * _1443;
    float _1481 = _1475 * _1463;
    out.m_40.x = _1477;
    out.m_40.y = _1479;
    out.m_40.z = _1481;
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
    bool _783 = false;
    bool _266 = false;
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
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    float2 _1895;
    _1895.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    _1895.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    float _344 = _1895.x;
    float _346 = _344 * 256.0;
    int _348 = int(_346);
    float _350 = -_122;
    float _352 = _350 + 1.0;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = _218 * _210;
    float _358 = _218 * _212;
    int _360 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _362 = _360 != 0;
    float _364 = -_122;
    float _366 = fma(_364, _122, 1.0);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _356 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _372 = _118 * _122;
    float _374 = fma(_294, 3.0, -1.0);
    float _376 = -_370;
    float _378 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[11].y, _376);
    float _380 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _382 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _386 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _388 = _354;
    if (_362)
    {
        float _390 = sqrt(_368);
        _388 = _390;
    }
    float _392 = _388;
    float _394 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _396 = fma(_122, _384, _380);
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _400 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _402 = -_358;
    float _404 = fma(_402, (*spvDescriptorSet0.fp_c3)._m0[11].z, _378);
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _408 = fma(_122, _394, _382);
    float _410 = fma(_122, _398, _386);
    float _412 = -_120;
    float _414 = fma(_412, _400, _396);
    float _416 = fma(_120, _400, _396);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _420 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _422 = -_120;
    float _424 = fma(_422, _406, _408);
    float _426 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _428 = fma(_120, _406, _408);
    float _430 = abs(_392);
    float _432 = log2(_430);
    float _434 = -_118;
    float _436 = fma(_434, _418, _414);
    float _438 = fma(_118, _418, _416);
    float _440 = -_120;
    float _442 = fma(_440, _420, _410);
    float _444 = _120 * (-3.0);
    float _446 = fma(_120, _420, _410);
    float _448 = -_118;
    float _450 = fma(_448, _426, _424);
    float _452 = _118 * _118;
    float _454 = fma(_118, _426, _428);
    float _456 = -_120;
    float _458 = fma(_456, _444, -1.0);
    float _460 = _118 * _120;
    float _462 = -_120;
    float _464 = _122 * _462;
    float _466 = _122 * _120;
    float _468 = -_122;
    float _470 = _118 * _468;
    float _472 = -_122;
    float _474 = fma(_472, _122, _452);
    float _476 = _432 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _478 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _480 = exp2(_476);
    float _482 = -_118;
    float _484 = fma(_482, _478, _442);
    float _486 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _490 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _492 = fma(_118, _478, _446);
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _496 = fma(_486, _470, _436);
    float _498 = fma(_488, _470, _450);
    float _500 = fma(_490, _470, _484);
    float _502 = fma(_486, _372, _438);
    float _504 = fma(_488, _372, _454);
    float _506 = fma(_490, _372, _492);
    float _508 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _510 = fma(_494, _464, _496);
    float _512 = _480 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _514 = fma(_494, _466, _502);
    float _516 = fma(_508, _464, _498);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _520 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = fma(_508, _466, _504);
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _528 = fma(_518, _464, _500);
    float _530 = -_522;
    float _532 = _530 + 1.0;
    float _534 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _536 = fma(_518, _466, _506);
    float _538 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _540 = fma(_526, _460, _510);
    float _542 = fma(_534, _460, _528);
    float _544 = abs(_532);
    float _546 = log2(_544);
    float _548 = fma(_526, _460, _514);
    float _550 = fma(_538, _460, _516);
    float _552 = fma(_538, _460, _524);
    float _554 = fma(_534, _460, _536);
    float _556 = fma(_404, 0.5, 0.5);
    float _558 = fma(_404, -0.5, 0.5);
    float _560 = fma(_556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _562 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _564 = fma(_556, _560, -0.212114393711090087890625);
    float _566 = _546 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _568 = fma(_562, _458, _540);
    float _570 = fma(_562, _374, _548);
    float _572 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _574 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _576 = exp2(_566);
    float _578 = fma(_556, _564, 1.570728778839111328125);
    float _580 = fma(_572, _374, _552);
    float _582 = fma(_574, _374, _554);
    float _584 = _220 + 1.0;
    float _586 = fma(_572, _458, _550);
    float _588 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _590 = fma(_574, _458, _542);
    float _592 = sqrt(_558);
    float _594 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _596 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _598 = fma(_588, _474, _586);
    float _600 = fma(_588, _474, _580);
    float _602 = fma(_594, _474, _568);
    float _604 = fma(_594, _474, _570);
    float _606 = fma(_596, _474, _590);
    float _608 = -_220;
    float _610 = fma(_576, _584, _608);
    float _612 = fma(_596, _474, _582);
    float _614 = fma(_220, -0.5, 0.5);
    float _616 = fma(_610, 0.5, 0.5);
    float _618 = _592 * 0.636619746685028076171875;
    float _620 = -_578;
    float _622 = fma(_618, _620, 1.0);
    float _624 = float(uint(_348));
    float _626 = _624 * 0.00390625;
    float2 _2358 = float2(_340, _342);
    float4 _629 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2358, float2(0.0), isnan(_2358)), level(_626)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2358, float2(0.0), isnan(_2358)), level(_626)).xyzw;
    float _631 = _629.x;
    float _633 = _629.y;
    float _635 = _629.z;
    float _637 = _629.w;
    float2 _2377 = float2(_340, _342);
    float2 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2377, float2(0.0), isnan(_2377)), level(_626)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2377, float2(0.0), isnan(_2377)), level(_626)).xy;
    float _643 = _641.x;
    float _645 = _641.y;
    float2 _2390 = float2(_340, _342);
    float2 _647 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2390, float2(0.0), isnan(_2390)), level(_626)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2390, float2(0.0), isnan(_2390)), level(_626)).xy;
    float _649 = _647.x;
    float _651 = _647.y;
    float2 _2403 = float2(_340, _342);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2403, float2(0.0), isnan(_2403)), level(_626)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2403, float2(0.0), isnan(_2403)), level(_626)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2420 = float2(_622, _614);
    float3 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2420, float2(0.0), isnan(_2420))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2420, float2(0.0), isnan(_2420))).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float2 _2434 = float2(_622, _616);
    float3 _673 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2434, float2(0.0), isnan(_2434))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2434, float2(0.0), isnan(_2434))).xyz;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    int _681 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _683 = _681 != 0;
    int _685 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _687 = _685 != 0;
    float _689 = _637 * _637;
    float _691 = _689 * _689;
    float _693 = -_645;
    float _695 = _693 + _651;
    float _697 = _661 * _661;
    float _699 = _691 * 16.0;
    float _701 = _643 * _645;
    float _703 = _697 * _697;
    float _705 = _699 * _645;
    float _707 = fma(_695, (*spvDescriptorSet0.fp_c3)._m0[0].x, _645);
    float _709 = -_701;
    float _711 = fma(_649, _651, _709);
    float _713 = _631 * _705;
    float _715 = _633 * _705;
    float _717 = precise::max(_707, 1.52587890625e-05);
    float _719 = _635 * _705;
    float _721 = _703 * 16.0;
    float _723 = fma(_711, (*spvDescriptorSet0.fp_c3)._m0[0].x, _701);
    float _725 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _727 = 1.0 / _717;
    float _729 = _721 * _651;
    float _731 = -_713;
    float _733 = fma(_655, _729, _731);
    float _735 = -_715;
    float _737 = fma(_657, _729, _735);
    float _739 = -_719;
    float _741 = fma(_659, _729, _739);
    float _743 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[0].x, _713);
    float _745 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[0].x, _715);
    float _747 = _723 * _727;
    float _749 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[0].x, _719);
    bool _751 = !_683;
    float _753 = _751 ? _747 : 0.0;
    bool _755 = !_687;
    int _757 = _687 ? (-1) : 0;
    int _771;
    int _773;
    int _775;
    int _777;
    int _779;
    int _781;
    if (!_755)
    {
        float _759 = _436 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _761 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _763 = _484 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _765 = _438 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _767 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _769 = _492 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _771 = as_type<int>(_765);
        _773 = as_type<int>(_767);
        _775 = as_type<int>(_769);
        _777 = as_type<int>(_759);
        _779 = as_type<int>(_761);
        _781 = as_type<int>(_763);
        _783 = true;
    }
    else
    {
        int _785 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _787 = _785 != 0;
        float _789 = _602 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _791 = _598 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _793 = _606 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _795 = _604 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _797 = _600 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _799 = _612 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _801 = as_type<int>(_789);
        int _803 = as_type<int>(_791);
        int _805 = as_type<int>(_793);
        int _807 = as_type<int>(_795);
        int _809 = as_type<int>(_797);
        _757 = _787 ? (-1) : 0;
        _775 = as_type<int>(_799);
        if (_787)
        {
            float _811 = _380 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _801 = as_type<int>(_811);
        }
        int _813 = _801;
        _777 = _813;
        if (_787)
        {
            float _815 = _382 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _803 = as_type<int>(_815);
        }
        int _817 = _803;
        _779 = _817;
        if (_787)
        {
            float _819 = _386 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _805 = as_type<int>(_819);
        }
        int _821 = _805;
        _781 = _821;
        if (_787)
        {
            _807 = _813;
        }
        int _823 = _807;
        _771 = _823;
        if (_787)
        {
            _809 = _817;
        }
        int _825 = _809;
        _773 = _825;
        if (_787)
        {
            _775 = _821;
        }
    }
    _783 = false;
    int _827 = _757;
    int _829 = _771;
    int _831 = _773;
    int _833 = _775;
    int _835 = _777;
    int _837 = _779;
    int _839 = _781;
    float _841 = _546 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    int _843 = 0;
    int _845 = _827;
    if (!_90)
    {
        int _847 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _849 = _847 != 0;
        _843 = _849 ? (-1) : 0;
    }
    int _851 = _843;
    float _853 = _753 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    if (_90)
    {
        _845 = -1;
    }
    int _855 = _845;
    float _857 = _753 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _859 = _855;
    if (!_90)
    {
        int _861 = ~_851;
        bool _863 = !_94;
        int _865 = _861 & (_863 ? (-1) : 0);
        _859 = _865;
    }
    int _867 = _859;
    float _869 = exp2(_841);
    bool _871 = _96 != 0;
    float _873 = _745 * _727;
    float _875 = _743 * _727;
    float _877 = _749 * _727;
    int _879 = _867;
    float _881 = _875;
    if (_86)
    {
        _879 = -1;
    }
    int _883 = _879;
    float _885 = -_869;
    float _887 = _885 + 1.0;
    int _889 = _883;
    if (!_86)
    {
        bool _891 = !_94;
        bool _893 = _891 && _82;
        bool _895 = !_871;
        bool _897 = _893 && _895;
        _889 = _897 ? (-1) : 0;
    }
    int _899 = _889;
    int _901 = ~_867;
    float _903 = (_901 != 0) ? as_type<float>(_829) : 0.0;
    float _905 = _887 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _907 = ~_867;
    float _909 = (_907 != 0) ? as_type<float>(_831) : 0.0;
    int _911 = ~_867;
    float _913 = (_911 != 0) ? as_type<float>(_833) : 0.0;
    float _915 = -_905;
    float _917 = _915 + 1.0;
    float _919 = abs(_917);
    float _921 = log2(_919);
    bool _923 = !_94;
    bool _925 = _82 && _923;
    int _927 = ~_899;
    float _929 = (_927 != 0) ? as_type<float>(_835) : 0.0;
    int _931 = ~_899;
    float _933 = (_931 != 0) ? as_type<float>(_837) : 0.0;
    int _935 = ~_899;
    float _937 = (_935 != 0) ? as_type<float>(_839) : 0.0;
    int _939 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _941 = _939 != 0;
    bool _943 = !_925;
    float _945 = _943 ? _853 : 0.0;
    float _947 = _921 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _949 = _921 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _951 = !_925;
    float _953 = _951 ? _857 : 0.0;
    bool _955 = !_941;
    float _957 = _945 * _903;
    float _959 = exp2(_947);
    bool _961 = !_941;
    float _963 = _945 * _909;
    bool _965 = !_955;
    float _967 = _965 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _969 = _945 * _913;
    bool _971 = !_961;
    float _973 = _971 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _975 = fma(_929, _953, _957);
    float _977 = fma(_933, _953, _963);
    float _979 = exp2(_949);
    bool _981 = !_941;
    float _983 = _967 * _975;
    float _985 = _973 * _977;
    int _987 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _989 = _987 != 0;
    bool _991 = !_981;
    float _993 = _991 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _995 = fma(_937, _953, _969);
    bool _997 = !_78;
    float _999 = _997 ? _959 : 1.0;
    float _1001 = _993 * _995;
    float _1003 = _999 * _983;
    float _1005 = _753 * _999;
    bool _1007 = !_78;
    float _1009 = _1007 ? _979 : 1.0;
    float _1011 = _999 * _985;
    bool _1013 = !_989;
    float _1015 = _82 ? _1005 : _1003;
    float _1017 = _82 ? _1005 : _1011;
    float _1019 = _1005;
    float _1021 = _1009;
    float _1023 = _905;
    if (!_82)
    {
        float _1025 = _999 * _1001;
        _1019 = _1025;
    }
    float _1027 = _1019;
    float _1029 = _1013 ? _877 : 0.0;
    float _1031 = _1015 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    bool _1033 = !_989;
    float _1035 = _1027 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    bool _1037 = !_989;
    float _1039 = _1009 * _1029;
    int _1041 = as_type<int>(_1027);
    float _1043 = _1039;
    float _1045 = _1035;
    if (_78)
    {
        _1041 = as_type<int>(_725);
    }
    int _1047 = _1041;
    float _1049 = _1033 ? _875 : 0.0;
    float _1051 = _1037 ? _873 : 0.0;
    float _1053 = _1009 * _1049;
    float _1055 = _1009 * _1051;
    float _1057 = _1017 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1059 = fma(_1053, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1031);
    float _1061 = fma(_1055, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1057);
    float _1063 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1035);
    float _1065 = _1057;
    int _1067 = _1047;
    int _1069 = _1047;
    if (_78)
    {
        _881 = 0.0;
    }
    float _1071 = _881;
    bool _1073 = !_78;
    float _1075 = _1073 ? _905 : 0.0;
    float _1077 = _1071;
    if (_78)
    {
        _1043 = 0.0;
    }
    float _1079 = _1043;
    float _1081 = _1079;
    if (_78)
    {
        _1045 = 0.0;
    }
    float _1083 = _1045;
    float _1085 = _1083;
    if (_78)
    {
        _1065 = _1059;
    }
    float _1087 = _1065;
    float _1089 = _1087;
    float _1091 = _1087;
    if (_78)
    {
        _1021 = _1061;
    }
    float _1093 = _1021;
    float _1095 = _1093;
    float _1097 = _1093;
    if (_78)
    {
        _1023 = _1063;
    }
    float _1099 = _1023;
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
        float _1131 = _1075 * _1121;
        _1077 = _1131;
        if (!_1107)
        {
            _1067 = as_type<int>(_725);
        }
        int _1133 = _1067;
        float _1135 = _1075 * _1125;
        _1081 = _1135;
        _1069 = _1133;
        if (!_1107)
        {
            _1089 = _1059;
        }
        float _1137 = _1089;
        float _1139 = _1075 * _1129;
        _1091 = _1137;
        _1085 = _1139;
        if (!_1107)
        {
            _1095 = _1061;
        }
        float _1141 = _1095;
        _1097 = _1141;
        if (!_1107)
        {
            _1101 = _1063;
        }
        float _1143 = _1101;
        bool _1145 = !_1107;
        _1103 = _1143;
        if (!_1145)
        {
            float _1147 = -_1075;
            float _1149 = _1147 + 1.0;
            float _1151 = precise::clamp(_1149, 0.0, 1.0);
            float _1153 = _725 * _1151;
            float _1155 = precise::max(_1153, 9.9999997473787516355514526367188e-05);
            float _1157 = 1.0 / _1155;
            float _1159 = _725 * _1157;
            float _1161 = _1059 * _1159;
            float _1163 = _1061 * _1159;
            float _1165 = _1063 * _1159;
            _1097 = _1163;
            _1081 = 0.0;
            _1091 = _1161;
            _1077 = 0.0;
            _1069 = as_type<int>(_1153);
            _1103 = _1165;
            _1085 = 0.0;
        }
    }
    float _1167 = _1097;
    float _1169 = _1081;
    float _1171 = _1091;
    float _1173 = _1077;
    int _1175 = _1069;
    float _1177 = _1103;
    float _1179 = _1085;
    int _1181 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1183 = _1181 != 0;
    int _1185 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1187 = _1185 != 0;
    float _1189 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1191 = _667 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1193 = _1167 + _1169;
    float _1195 = _1171 + _1173;
    bool _1197 = !_1187;
    float _1199 = _1197 ? as_type<float>(_1175) : 1.0;
    float _1201 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1203 = _1177 + _1179;
    float _1205 = -_1199;
    float _1207 = _1205 + 1.0;
    float _1209 = abs(_1207);
    float _1211 = log2(_1209);
    float _1213 = _1211 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1215 = exp2(_1213);
    float _1217 = -_1215;
    float _1219 = spvFAdd(_1217, 1.00010001659393310546875);
    float _1221 = -_1215;
    float _1223 = _1221 + 1.0;
    float _1225 = -_1199;
    float _1227 = _1225 + _1223;
    float _1229 = 1.0 / _1219;
    float _1231 = _1189 * _1227;
    float _1233 = _1191 * _1227;
    float _1235 = _1201 * _1227;
    float _1237 = fma(_1193, _1199, _1231);
    float _1239 = fma(_1195, _1199, _1233);
    float _1241 = fma(_1203, _1199, _1235);
    float _1243 = _1229 * _1237;
    float _1245 = _1229 * _1239;
    float _1247 = _1229 * _1241;
    float _1249 = _1243 * 0.715200006961822509765625;
    float _1251 = fma(_1245, 0.2125999927520751953125, _1249);
    float _1253 = fma(_1247, 0.072200000286102294921875, _1251);
    float _1255 = 1.0 / _1253;
    float _1257 = _1255 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1259 = precise::clamp(_1257, 0.0, 1.0);
    float _1261 = fma(_1259, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1263 = _1245 * _1261;
    float _1265 = _1243 * _1261;
    float _1267 = _1247 * _1261;
    bool _1269 = !_1183;
    float _1271 = _1223;
    float _1273 = _1263;
    float _1275 = _1267;
    int _1277 = as_type<int>(_1215);
    int _1279 = as_type<int>(_1263);
    float _1281 = _1223;
    float _1283 = _1267;
    if (!_1269)
    {
        bool _1285 = _1223 != 1.0;
        bool _1287 = isnan(_1223);
        bool _1289 = _1285 || _1287;
        bool _1291 = isnan(1.0);
        bool _1293 = _1289 || _1291;
        float _1295 = -_1215;
        bool _1297 = _1295 != (-1.0);
        bool _1299 = isnan(_1295);
        bool _1301 = _1297 || _1299;
        bool _1303 = isnan(-1.0);
        bool _1305 = _1301 || _1303;
        float _1307 = -_1215;
        bool _1309 = _1307 == (-1.0);
        bool _1311 = !_1293;
        bool _1313 = _1309 || _1311;
        bool _1315 = _1223 == 1.0;
        bool _1317 = _1315 && _1305;
        bool _1319 = !_1313;
        float _1321 = _1319 ? _1223 : 0.0;
        bool _1323 = !_1317;
        float _1325 = _1323 ? 0.0 : 1.0;
        float _1327 = _1313 ? 0.0 : 0.5;
        float _1329 = _1321 * 0.715200006961822509765625;
        float _1331 = fma(_1325, 0.2125999927520751953125, _1329);
        float _1333 = fma(_1327, 0.072200000286102294921875, _1331);
        float _1335 = 1.0 / _1333;
        float _1337 = _1335 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1339 = precise::clamp(_1337, 0.0, 1.0);
        float _1341 = fma(_1339, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1343 = _1325 * _1341;
        float _1345 = _1321 * _1341;
        float _1347 = _1327 * _1341;
        out.m_40.x = _1343;
        out.m_40.y = _1345;
        out.m_40.z = _1347;
        out.m_40.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    bool _1349 = _96 != 0;
    bool _1351 = !_1349;
    if (!_1351)
    {
        if (_86)
        {
            _1271 = 0.0;
        }
        float _1353 = _1271;
        float _1355 = _1353;
        if (_86)
        {
            _1273 = 0.0;
        }
        float _1357 = _1273;
        float _1359 = _1357;
        if (!_86)
        {
            float _1361 = _933 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1359 = _1361;
        }
        float _1363 = _1359;
        float _1365 = _1363;
        if (!_86)
        {
            float _1367 = _929 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1355 = _1367;
        }
        float _1369 = _1355;
        float _1371 = _1369;
        if (!_90)
        {
            float _1373 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1363);
            _1365 = _1373;
        }
        float _1375 = _1365;
        if (_86)
        {
            _1275 = 0.0;
        }
        float _1377 = _1275;
        float _1379 = _1377;
        if (!_86)
        {
            float _1381 = _937 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1379 = _1381;
        }
        float _1383 = _1379;
        float _1385 = _1375 * 0.715200006961822509765625;
        float _1387 = _1383;
        if (!_90)
        {
            float _1389 = fma(_903, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1369);
            _1371 = _1389;
        }
        float _1391 = _1371;
        if (!_90)
        {
            float _1393 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1383);
            _1387 = _1393;
        }
        float _1395 = _1387;
        float _1397 = fma(_1391, 0.2125999927520751953125, _1385);
        float _1399 = fma(_1395, 0.072200000286102294921875, _1397);
        float _1401 = 1.0 / _1399;
        float _1403 = _1401 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1405 = precise::clamp(_1403, 0.0, 1.0);
        float _1407 = fma(_1405, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1409 = _1407 * _1391;
        float _1411 = _1407 * _1375;
        float _1413 = _1407 * _1395;
        out.m_40.x = _1409;
        out.m_40.y = _1411;
        out.m_40.z = _1413;
        out.m_40.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    if (!_94)
    {
        _1277 = as_type<int>(_1263);
    }
    int _1415 = _1277;
    if (!_94)
    {
        _1279 = as_type<int>(_1265);
    }
    int _1417 = _1279;
    float _1419 = as_type<float>(_1417);
    if (!_94)
    {
        out.m_40.x = as_type<float>(_1415);
        out.m_40.y = as_type<float>(_1417);
        out.m_40.z = _1267;
        out.m_40.w = _1223;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    if (_86)
    {
        _1281 = 0.0;
    }
    float _1421 = _1281;
    float _1423 = _1421;
    if (_86)
    {
        _1419 = 0.0;
    }
    float _1425 = _1419;
    float _1427 = _1425;
    if (!_86)
    {
        float _1429 = _933 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1427 = _1429;
    }
    float _1431 = _1427;
    float _1433 = _1431;
    if (!_86)
    {
        float _1435 = _929 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1423 = _1435;
    }
    float _1437 = _1423;
    float _1439 = _1437;
    if (!_90)
    {
        float _1441 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1431);
        _1433 = _1441;
    }
    float _1443 = _1433;
    if (_86)
    {
        _1283 = 0.0;
    }
    float _1445 = _1283;
    float _1447 = _1445;
    if (!_86)
    {
        float _1449 = _937 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1447 = _1449;
    }
    float _1451 = _1447;
    float _1453 = _1443 * 0.715200006961822509765625;
    float _1455 = _1451;
    if (!_90)
    {
        float _1457 = fma(_903, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1437);
        _1439 = _1457;
    }
    float _1459 = _1439;
    if (!_90)
    {
        float _1461 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1451);
        _1455 = _1461;
    }
    float _1463 = _1455;
    float _1465 = fma(_1459, 0.2125999927520751953125, _1453);
    float _1467 = fma(_1463, 0.072200000286102294921875, _1465);
    float _1469 = 1.0 / _1467;
    float _1471 = _1469 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1473 = precise::clamp(_1471, 0.0, 1.0);
    float _1475 = fma(_1473, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1477 = _1475 * _1459;
    float _1479 = _1475 * _1443;
    float _1481 = _1475 * _1463;
    out.m_40.x = _1477;
    out.m_40.y = _1479;
    out.m_40.z = _1481;
    out.m_40.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_40)};
}

