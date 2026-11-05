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
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_16 [[id(13)]];
    sampler fp_t_tcb_16Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_14 [[id(15)]];
    sampler fp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> fp_t_tcb_18 [[id(17)]];
    sampler fp_t_tcb_18Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_1A [[id(19)]];
    sampler fp_t_tcb_1ASmplr [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_ASmplr_w [[id(22)]];
    sampler fp_t_tcb_10Smplr_w [[id(23)]];
    sampler fp_t_tcb_12Smplr_w [[id(24)]];
    sampler fp_t_tcb_CSmplr_w [[id(25)]];
    sampler fp_t_tcb_ESmplr_w [[id(26)]];
    sampler fp_t_tcb_16Smplr_w [[id(27)]];
    sampler fp_t_tcb_14Smplr_w [[id(28)]];
    sampler fp_t_tcb_18Smplr_w [[id(29)]];
    sampler fp_t_tcb_1ASmplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _58(thread const int& _4531, thread const int& _4532, thread const int& _4533, thread const int& _4534, thread const int& _4535, thread int& _4536, thread int& _4537, thread int& _4538, thread int& _4539, thread int& _4540, thread int& _4541)
{
    float _4544 = as_type<float>(_4534) + 0.0;
    bool _4546 = _4544 != 0.0;
    bool _4548 = isnan(_4544);
    bool _4550 = _4546 || _4548;
    bool _4552 = isnan(0.0);
    bool _4554 = _4550 || _4552;
    int _4556 = as_type<int>(_4544);
    int _4558 = 0;
    int _4560 = _4533;
    int _4562 = _4554 ? (-1) : 0;
    if (!_4554)
    {
        float _4564 = as_type<float>(_4534) * 1.0;
        _4556 = as_type<int>(_4564);
    }
    int _4566 = _4556;
    bool _4568 = !_4554;
    int _4570 = _4566;
    if (!_4568)
    {
        float _4572 = as_type<float>(_4534) + 0.0;
        bool _4574 = _4572 >= 0.0;
        bool _4576 = isnan(_4572);
        bool _4578 = _4574 || _4576;
        bool _4580 = isnan(0.0);
        bool _4582 = _4578 || _4580;
        int _4584 = as_type<int>(_4572);
        _4562 = _4582 ? (-1) : 0;
        if (!_4582)
        {
            _4584 = 2147483647;
        }
        int _4586 = _4584;
        bool _4588 = !_4582;
        _4570 = _4586;
        if (!_4588)
        {
            float _4590 = abs(as_type<float>(_4534));
            float _4592 = _4590 + 0.0;
            bool _4594 = _4592 > as_type<float>(0x7f800000u /* inf */);
            bool _4596 = isnan(_4592);
            bool _4598 = _4594 || _4596;
            bool _4600 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4602 = _4598 || _4600;
            int _4604 = as_type<int>(_4592);
            _4558 = 2139095040;
            _4562 = _4602 ? (-1) : 0;
            if (_4602)
            {
                float _4606 = as_type<float>(_4534) + 1.0;
                _4604 = as_type<int>(_4606);
            }
            int _4608 = _4604;
            _4570 = _4608;
            if (!_4602)
            {
                float _4610 = abs(as_type<float>(_4534));
                float _4612 = _4610 + (-0.0);
                float _4614 = 0.0 + _4612;
                bool _4616 = _4614 != as_type<float>(0x7f800000u /* inf */);
                bool _4618 = isnan(_4614);
                bool _4620 = _4616 || _4618;
                bool _4622 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4624 = _4620 || _4622;
                int _4626 = as_type<int>(_4614);
                _4562 = _4624 ? (-1) : 0;
                if (!_4624)
                {
                    _4626 = _4534;
                }
                int _4628 = _4626;
                bool _4630 = !_4624;
                _4570 = _4628;
                if (!_4630)
                {
                    float _4632 = as_type<float>(_4534) * 18446744073709551616.0;
                    float _4634 = rsqrt(_4632);
                    float _4636 = _4632 * _4634;
                    float _4638 = _4634 * 0.5;
                    float _4640 = -_4636;
                    float _4642 = 0.0 + _4640;
                    float _4644 = fma(_4638, _4642, 0.5);
                    float _4646 = fma(_4636, _4644, _4636);
                    float _4648 = -_4646;
                    float _4650 = 0.0 + _4648;
                    float _4652 = fma(_4646, _4650, _4632);
                    float _4654 = fma(_4638, _4652, _4646);
                    float _4656 = _4654 * 2.3283064365386962890625e-10;
                    _4570 = as_type<int>(_4656);
                    _4558 = as_type<int>(_4632);
                    _4560 = as_type<int>(_4642);
                }
            }
        }
    }
    int _4658 = _4570;
    int _4660 = _4558;
    int _4662 = _4560;
    int _4664 = _4562;
    _4536 = _4658;
    _4537 = _4660;
    _4538 = _4535;
    _4539 = 0;
    _4540 = _4662;
    _4541 = _4664;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _993 = false;
    bool _286 = false;
    float _62 = gl_FragCoord.w;
    float _64 = in.m_47.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_47.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_47.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    int _82 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _86 = _82 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _102 = _100 != 0;
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _106 = _104 != 0;
    int _108 = int(_86);
    float _110 = 1.0 / _62;
    float _112 = _110 * _68;
    float _114 = _110 * _74;
    float _116 = _110 * _80;
    float _118 = _112 * _112;
    float _120 = fma(_114, _114, _118);
    float _122 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _124 = fma(_116, _116, _120);
    float _126 = precise::max(0.0, _122);
    float _128 = rsqrt(_124);
    float _130 = _114 * _128;
    float _132 = _116 * _128;
    float _134 = _112 * _128;
    float _136 = _130 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _138 = _132 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _140 = -_134;
    float _142 = -_126;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].z, _142);
    float _146 = _136 * _136;
    float _148 = _138 * _138;
    float _150 = _146 + _148;
    float _152 = sqrt(_150);
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _156 = _128;
    float _158 = _126;
    float _160 = _144;
    float _162 = _136;
    float _164 = _138;
    if (!_154)
    {
        _156 = _148;
    }
    float _166 = _156;
    float _168 = _166;
    if (!_154)
    {
        _158 = _146;
    }
    float _170 = _158;
    bool _172 = !_154;
    float _174 = _170;
    if (!_172)
    {
        float _176 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _178 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _180 = _152 + _178;
        float _182 = _144 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _184 = rsqrt(_150);
        float _186 = _180 * _176;
        float _188 = _186 * 0.15915493667125701904296875;
        float _190 = _188 * 6.283185482025146484375;
        float _192 = sin(_190);
        float _194 = _188 * 6.283185482025146484375;
        float _196 = cos(_194);
        float _198 = fma(_192, _182, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _200 = _184 * _198;
        float _202 = _196 + (-1.0);
        float _204 = _136 * _200;
        float _206 = _138 * _200;
        float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _210 = _206 * _206;
        float _212 = fma(_144, _196, _208);
        float _214 = _204 * _204;
        _160 = _212;
        _174 = _214;
        _168 = _210;
        _162 = _204;
        _164 = _206;
    }
    float _216 = _160;
    float _218 = _174;
    float _220 = _168;
    float _222 = _162;
    float _224 = _164;
    float _226 = fma(_216, _216, _218);
    float _228 = _226 + _220;
    float _230 = rsqrt(_228);
    float _232 = _230 * _216;
    float _234 = _230 * _222;
    float _236 = _230 * _224;
    float _238 = -_232;
    float _240 = precise::max(0.0, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = fma(_240, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _250 = as_type<int>(_246) + (-218103808);
    float _252 = fma(_240, _248, -0.212114393711090087890625);
    bool _254 = uint(_250) >= 1920991232u;
    float _256 = fma(_240, _252, 1.570728778839111328125);
    bool _258 = !_254;
    float _260 = _232;
    float _284;
    if (!_258)
    {
        int _262 = 0;
        int _264 = 0;
        int _266 = 0;
        int _268 = as_type<int>(_246);
        int _270 = 1232;
        int _272;
        int _274;
        int _276;
        int _278;
        int _280;
        int _282;
        _58(_262, _264, _266, _268, _270, _272, _274, _276, _278, _280, _282);
        _284 = as_type<float>(_272);
        _286 = true;
    }
    else
    {
        float _288 = rsqrt(_246);
        float _290 = _246 * _288;
        float _292 = _288 * 0.5;
        float _294 = -_290;
        float _296 = 0.0 + _294;
        float _298 = fma(_292, _296, 0.5);
        float _300 = fma(_290, _298, _290);
        float _302 = -_300;
        float _304 = 0.0 + _302;
        float _306 = fma(_300, _304, _246);
        float _308 = fma(_292, _306, _300);
        _284 = _308;
    }
    _286 = false;
    float _310 = _284;
    bool _312 = _232 > 0.0;
    float _314 = _132 * _132;
    float _316 = _130 * _130;
    float _318 = _314 + _316;
    if (_312)
    {
        discard_fragment();
    }
    float _320 = rsqrt(_318);
    float _322 = _256 * _310;
    float _324 = _322 * 0.636619746685028076171875;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = -_326;
    float _330 = _328 + 1.0;
    float _332 = sqrt(_330);
    float _334 = _132 * _320;
    float _336 = _130 * _320;
    float _338 = abs(_334);
    float _340 = abs(_336);
    float _342 = precise::max(_338, _340);
    float _344 = precise::max(_342, 9.9999997473787516355514526367188e-05);
    float _346 = -_332;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _344;
    float _352 = _348 * 0.5;
    float _354 = -_350;
    float _356 = _334 * _354;
    float _358 = _336 * _350;
    float _360 = fma(_356, _352, 0.5);
    float _362 = fma(_358, _352, 0.5);
    if (_312)
    {
        out.m_50.x = 0.0;
        out.m_50.y = 0.0;
        out.m_50.z = 0.0;
        out.m_50.w = 0.0;
        return out;
    }
    float2 _2218;
    _2218.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_360, _362));
    _2218.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_360, _362));
    float _364 = _2218.x;
    float _366 = _364 * 256.0;
    int _368 = int(_366);
    float _370 = -_134;
    float _372 = _370 + 1.0;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = -_134;
    float _378 = fma(_376, _134, 1.0);
    float _380 = precise::clamp(_378, 0.0, 1.0);
    int _382 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _384 = _382 != 0;
    float _386 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _388 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _390 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _392 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _394 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _396 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _400 = fma(_134, _392, _386);
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _404 = _374;
    if (_384)
    {
        float _406 = sqrt(_380);
        _404 = _406;
    }
    float _408 = _404;
    float _410 = -_132;
    float _412 = fma(_410, _394, _400);
    float _414 = fma(_132, _394, _400);
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _420 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _422 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _424 = fma(_134, _396, _390);
    float _426 = fma(_134, _398, _388);
    float _428 = fma(_130, _418, _414);
    float _430 = -_132;
    float _432 = fma(_430, _402, _424);
    float _434 = fma(_132, _402, _424);
    float _436 = -_132;
    float _438 = fma(_436, _416, _426);
    float _440 = fma(_132, _416, _426);
    float _442 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _444 = -_130;
    float _446 = fma(_444, _418, _412);
    float _448 = -_130;
    float _450 = fma(_448, _420, _432);
    float _452 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _454 = -_130;
    float _456 = fma(_454, _442, _438);
    float _458 = fma(_130, _442, _440);
    float _460 = -_134;
    float _462 = _130 * _460;
    float _464 = _130 * _134;
    float _466 = fma(_130, _420, _434);
    float _468 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _470 = fma(_452, _462, _456);
    float _472 = fma(_452, _464, _458);
    float _474 = fma(_422, _462, _450);
    float _476 = fma(_468, _462, _446);
    float _478 = fma(_468, _464, _428);
    float _480 = fma(_422, _464, _466);
    float _482 = -_132;
    float _484 = _134 * _482;
    float _486 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _488 = _134 * _132;
    float _490 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _492 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _494 = fma(_486, _484, _470);
    float _496 = fma(_486, _488, _472);
    float _498 = fma(_490, _484, _476);
    float _500 = fma(_492, _484, _474);
    float _502 = fma(_490, _488, _478);
    float _504 = float(uint(_368));
    float _506 = _504 * 0.00390625;
    float2 _2454 = float2(_360, _362);
    float4 _509 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2454, float2(0.0), isnan(_2454)), level(_506)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2454, float2(0.0), isnan(_2454)), level(_506)).xyzw;
    float _511 = _509.x;
    float _513 = _509.y;
    float _515 = _509.z;
    float _517 = _509.w;
    float2 _2473 = float2(_360, _362);
    float2 _521 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2473, float2(0.0), isnan(_2473)), level(_506)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2473, float2(0.0), isnan(_2473)), level(_506)).xy;
    float _523 = _521.x;
    float _525 = _521.y;
    float2 _2486 = float2(_360, _362);
    float4 _527 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2486, float2(0.0), isnan(_2486)), level(_506)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2486, float2(0.0), isnan(_2486)), level(_506)).xyzw;
    float _529 = _527.x;
    float _531 = _527.y;
    float _533 = _527.z;
    float _535 = _527.w;
    float2 _2503 = float2(_360, _362);
    float2 _537 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2503, float2(0.0), isnan(_2503)), level(_506)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2503, float2(0.0), isnan(_2503)), level(_506)).xy;
    float _539 = _537.x;
    float _541 = _537.y;
    float _543 = abs(_408);
    float _545 = log2(_543);
    float _547 = fma(_492, _488, _480);
    float _549 = _130 * _132;
    float _551 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _553 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _555 = _130 * _130;
    int _557 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _559 = _557 != 0;
    float _561 = fma(_551, _549, _494);
    float _563 = fma(_551, _549, _496);
    float _565 = fma(_553, _549, _498);
    float _567 = fma(_553, _549, _502);
    float _569 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _571 = -_134;
    float _573 = fma(_571, _134, _555);
    float _575 = _232 + 1.0;
    float _577 = fma(_569, _549, _500);
    float _579 = _545 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _581 = fma(_569, _549, _547);
    float _583 = _132 * (-3.0);
    float _585 = exp2(_579);
    float _587 = -_132;
    float _589 = fma(_587, _583, -1.0);
    float _591 = fma(_314, 3.0, -1.0);
    float _593 = _585 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _595 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _597 = fma(_595, _589, _561);
    float _599 = fma(_593, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _601 = precise::clamp(_599, 0.0, 1.0);
    float _603 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _605 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _607 = fma(_595, _591, _563);
    float _609 = fma(_603, _589, _565);
    float _611 = fma(_605, _589, _577);
    float _613 = -_601;
    float _615 = _613 + 1.0;
    float _617 = fma(_605, _591, _581);
    float _619 = fma(_603, _591, _567);
    float _621 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _623 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _625 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _627 = abs(_615);
    float _629 = log2(_627);
    float _631 = fma(_621, _573, _597);
    float _633 = fma(_621, _573, _607);
    float _635 = fma(_623, _573, _619);
    float _637 = _234 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _639 = fma(_625, _573, _611);
    float _641 = fma(_625, _573, _617);
    float _643 = fma(_623, _573, _609);
    float _645 = -_637;
    float _647 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[11].y, _645);
    float _649 = in.m_52.x;
    float _651 = gl_FragCoord.w;
    float _653 = _649 * _651;
    float _655 = -_236;
    float _657 = fma(_655, (*spvDescriptorSet0.fp_c3)._m0[11].z, _647);
    float _659 = in.m_52.y;
    float _661 = gl_FragCoord.w;
    float _663 = _659 * _661;
    float _665 = fma(_657, 0.5, 0.5);
    float _667 = fma(_657, -0.5, 0.5);
    float _669 = _629 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _671 = fma(_665, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _673 = sqrt(_667);
    float _675 = fma(_665, _671, -0.212114393711090087890625);
    float _677 = fma(_665, _675, 1.570728778839111328125);
    float _679 = exp2(_669);
    float _681 = _673 * 0.636619746685028076171875;
    float _683 = _110 * _653;
    float _685 = -_677;
    float _687 = fma(_681, _685, 1.0);
    float _689 = _110 * _663;
    float _691 = -_232;
    float _693 = fma(_679, _575, _691);
    float _695 = _517 * _517;
    float _697 = _535 * _535;
    float _699 = _695 * _695;
    float _701 = _697 * _697;
    float _703 = _699 * 16.0;
    float _705 = _523 * _525;
    float _707 = _701 * 16.0;
    float _709 = _703 * _525;
    float _711 = _707 * _541;
    float _713 = -_525;
    float _715 = _713 + _541;
    float _717 = _511 * _709;
    float _719 = _513 * _709;
    float _721 = _515 * _709;
    float _723 = -_705;
    float _725 = fma(_539, _541, _723);
    float _727 = -_717;
    float _729 = fma(_529, _711, _727);
    float _731 = -_719;
    float _733 = fma(_531, _711, _731);
    float _735 = -_721;
    float _737 = fma(_533, _711, _735);
    float _739 = fma(_715, (*spvDescriptorSet0.fp_c3)._m0[0].x, _525);
    float _741 = fma(_729, (*spvDescriptorSet0.fp_c3)._m0[0].x, _717);
    float _743 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[0].x, _719);
    float _745 = fma(_725, (*spvDescriptorSet0.fp_c3)._m0[0].x, _705);
    float2 _2844 = float2(_360, _362);
    float4 _747 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2844, float2(0.0), isnan(_2844)), level(_506)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2844, float2(0.0), isnan(_2844)), level(_506)).xyzw;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _747.w;
    float2 _2861 = float2(_360, _362);
    float2 _757 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2861, float2(0.0), isnan(_2861)), level(_506)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2861, float2(0.0), isnan(_2861)), level(_506)).xy;
    float _759 = _757.x;
    float _761 = _757.y;
    float2 _2874 = float2(_360, _362);
    float2 _763 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2874, float2(0.0), isnan(_2874)), level(_506)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2874, float2(0.0), isnan(_2874)), level(_506)).xy;
    float _765 = _763.x;
    float _767 = _763.y;
    float _769 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[0].x, _721);
    float _771 = fma(_693, 0.5, 0.5);
    float _773 = fma(_232, -0.5, 0.5);
    float2 _2896 = float2(_360, _362);
    float4 _775 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2896, float2(0.0), isnan(_2896)), level(_506)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2896, float2(0.0), isnan(_2896)), level(_506)).xyzw;
    float _777 = _775.x;
    float _779 = _775.y;
    float _781 = _775.z;
    float _783 = _775.w;
    float2 _2913 = float2(_683, _689);
    float3 _787 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2913, float2(0.0), isnan(_2913))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2913, float2(0.0), isnan(_2913))).xyz;
    float _789 = _787.x;
    float _791 = _787.y;
    float _793 = _787.z;
    float2 _2927 = float2(_687, _773);
    float3 _795 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2927, float2(0.0), isnan(_2927))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2927, float2(0.0), isnan(_2927))).xyz;
    float _797 = _795.x;
    float _799 = _795.y;
    float _801 = _795.z;
    float2 _2941 = float2(_687, _771);
    float3 _803 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2941, float2(0.0), isnan(_2941))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2941, float2(0.0), isnan(_2941))).xyz;
    float _805 = _803.x;
    float _807 = _803.y;
    float _809 = _803.z;
    int _811 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _813 = _811 != 0;
    float _815 = precise::max(_739, 1.52587890625e-05);
    float _817 = 1.0 / _815;
    float _819 = _755 * _755;
    float _821 = _819 * _819;
    float _823 = _783 * _783;
    float _825 = _821 * 16.0;
    float _827 = _789 * _791;
    float _829 = -_793;
    float _831 = _829 + 1.0;
    float _833 = _823 * _823;
    float _835 = _825 * _761;
    float _837 = _749 * _835;
    float _839 = _751 * _835;
    float _841 = _753 * _835;
    float _843 = -_761;
    float _845 = _843 + _767;
    float _847 = fma(_845, (*spvDescriptorSet0.fp_c3)._m0[0].x, _761);
    float _849 = _759 * _761;
    float _851 = _833 * 16.0;
    float _853 = -_849;
    float _855 = fma(_765, _767, _853);
    float _857 = _851 * _767;
    float _859 = _739 * _817;
    float _861 = fma(_855, (*spvDescriptorSet0.fp_c3)._m0[0].x, _849);
    float _863 = -_837;
    float _865 = fma(_777, _857, _863);
    float _867 = -_839;
    float _869 = fma(_779, _857, _867);
    float _871 = -_841;
    float _873 = fma(_781, _857, _871);
    float _875 = _741 * _859;
    float _877 = fma(_865, (*spvDescriptorSet0.fp_c3)._m0[0].x, _837);
    float _879 = precise::max(_847, 1.52587890625e-05);
    float _881 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[0].x, _839);
    float _883 = fma(_873, (*spvDescriptorSet0.fp_c3)._m0[0].x, _841);
    float _885 = -_739;
    float _887 = _885 + _847;
    float _889 = _743 * _859;
    float _891 = 1.0 / _879;
    float _893 = fma(_789, _887, _739);
    float _895 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _897 = _895 + 1.0;
    float _899 = -_827;
    float _901 = _899 + 1.0;
    float _903 = _769 * _859;
    float _905 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _907 = _905 + 1.0;
    float _909 = _745 * _859;
    float _911 = fma(_901, _897, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _913 = fma(_901, _907, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _915 = precise::max(_893, 1.52587890625e-05);
    float _917 = _861 * _891;
    float _919 = 1.0 / _915;
    float _921 = _913 * _891;
    float _923 = _917 * _911;
    float _925 = _893 * _831;
    float _927 = _847 * _921;
    float _929 = _883 * _921;
    float _931 = -_909;
    float _933 = fma(_847, _923, _931);
    float _935 = _925 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _937 = -_875;
    float _939 = fma(_877, _927, _937);
    float _941 = -_889;
    float _943 = fma(_881, _927, _941);
    float _945 = fma(_789, _933, _909);
    float _947 = -_903;
    float _949 = fma(_847, _929, _947);
    float _951 = fma(_789, _939, _875);
    float _953 = fma(_789, _943, _889);
    float _955 = _945 * _919;
    float _957 = fma(_789, _949, _903);
    bool _959 = !_559;
    float _961 = _959 ? _955 : 0.0;
    bool _963 = !_813;
    int _965 = as_type<int>(_639);
    int _967 = _813 ? (-1) : 0;
    int _981;
    int _983;
    int _985;
    int _987;
    int _989;
    int _991;
    if (!_963)
    {
        float _969 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _971 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _973 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _975 = _458 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _977 = _428 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _979 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _981 = as_type<int>(_975);
        _983 = as_type<int>(_977);
        _985 = as_type<int>(_979);
        _987 = as_type<int>(_971);
        _989 = as_type<int>(_973);
        _991 = as_type<int>(_969);
        _993 = true;
    }
    else
    {
        int _995 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _997 = _995 != 0;
        float _999 = _631 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1001 = _643 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1003 = _639 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1005 = _633 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1007 = _641 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1009 = as_type<int>(_999);
        int _1011 = as_type<int>(_1003);
        int _1013 = as_type<int>(_1005);
        _967 = _997 ? (-1) : 0;
        _985 = as_type<int>(_1007);
        if (!_997)
        {
            _965 = as_type<int>(_1001);
        }
        int _1015 = _965;
        int _1017 = _1015;
        if (_997)
        {
            float _1019 = _388 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1009 = as_type<int>(_1019);
        }
        int _1021 = _1009;
        _991 = _1021;
        if (_997)
        {
            float _1023 = _386 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1017 = as_type<int>(_1023);
        }
        int _1025 = _1017;
        _987 = _1025;
        if (_997)
        {
            float _1027 = _390 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1011 = as_type<int>(_1027);
        }
        int _1029 = _1011;
        float _1031 = _635 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1033 = as_type<int>(_1031);
        _989 = _1029;
        if (_997)
        {
            _1013 = _1021;
        }
        int _1035 = _1013;
        _981 = _1035;
        if (_997)
        {
            _1033 = _1025;
        }
        int _1037 = _1033;
        _983 = _1037;
        if (_997)
        {
            _985 = _1029;
        }
    }
    _993 = false;
    int _1039 = _967;
    int _1041 = _981;
    int _1043 = _983;
    int _1045 = _985;
    int _1047 = _987;
    int _1049 = _989;
    int _1051 = _991;
    int _1053 = 0;
    int _1055 = _1039;
    if (!_102)
    {
        int _1057 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _1059 = _1057 != 0;
        _1053 = _1059 ? (-1) : 0;
    }
    int _1061 = _1053;
    float _1063 = _629 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_102)
    {
        _1055 = -1;
    }
    int _1065 = _1055;
    float _1067 = _961 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _1069 = _1065;
    if (!_102)
    {
        int _1071 = ~_1061;
        bool _1073 = !_106;
        int _1075 = _1071 & (_1073 ? (-1) : 0);
        _1069 = _1075;
    }
    int _1077 = _1069;
    float _1079 = _961 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _1081 = _108 != 0;
    float _1083 = exp2(_1063);
    float _1085 = _953 * _919;
    float _1087 = _957 * _919;
    int _1089 = _1077;
    if (_98)
    {
        _1089 = -1;
    }
    int _1091 = _1089;
    int _1093 = ~_1077;
    float _1095 = (_1093 != 0) ? as_type<float>(_1041) : 0.0;
    int _1097 = _1091;
    if (!_98)
    {
        bool _1099 = !_106;
        bool _1101 = _1099 && _94;
        bool _1103 = !_1081;
        bool _1105 = _1101 && _1103;
        _1097 = _1105 ? (-1) : 0;
    }
    int _1107 = _1097;
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    int _1113 = ~_1077;
    float _1115 = (_1113 != 0) ? as_type<float>(_1043) : 0.0;
    int _1117 = ~_1077;
    float _1119 = (_1117 != 0) ? as_type<float>(_1045) : 0.0;
    float _1121 = _1111 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _1123 = !_106;
    bool _1125 = _94 && _1123;
    int _1127 = ~_1107;
    float _1129 = (_1127 != 0) ? as_type<float>(_1047) : 0.0;
    int _1131 = ~_1107;
    float _1133 = (_1131 != 0) ? as_type<float>(_1049) : 0.0;
    int _1135 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1137 = _1135 != 0;
    bool _1139 = !_1125;
    float _1141 = _1139 ? _1067 : 0.0;
    float _1143 = -_1121;
    float _1145 = _1143 + 1.0;
    bool _1147 = !_1125;
    float _1149 = _1147 ? _1079 : 0.0;
    int _1151 = ~_1107;
    float _1153 = (_1151 != 0) ? as_type<float>(_1051) : 0.0;
    bool _1155 = !_1137;
    float _1157 = abs(_1145);
    float _1159 = log2(_1157);
    float _1161 = _1149 * _1115;
    float _1163 = _1149 * _1095;
    bool _1165 = !_1155;
    float _1167 = _1165 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1169 = _1149 * _1119;
    bool _1171 = !_1137;
    float _1173 = fma(_1129, _1141, _1161);
    bool _1175 = !_1137;
    float _1177 = fma(_1133, _1141, _1169);
    bool _1179 = !_1171;
    float _1181 = _1179 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    int _1183 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1185 = _1183 != 0;
    bool _1187 = !_1175;
    float _1189 = _1187 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1191 = fma(_1153, _1141, _1163);
    float _1193 = _951 * _919;
    float _1195 = _1181 * _1177;
    float _1197 = _1159 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1199 = _1189 * _1173;
    float _1201 = _1167 * _1191;
    float _1203 = _1159 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _1205 = !_1185;
    float _1207 = _1199 * 0.715200006961822509765625;
    float _1209 = exp2(_1197);
    bool _1211 = !_1185;
    float _1213 = fma(_1201, 0.2125999927520751953125, _1207);
    float _1215 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _1217 = _232 * _1215;
    float _1219 = fma(_1195, 0.072200000286102294921875, _1213);
    float _1221 = exp2(_1203);
    float _1223 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[26].x, _1217);
    float _1225 = _827 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1227 = -_1201;
    float _1229 = _1227 + _1219;
    float _1231 = -_1199;
    float _1233 = _1231 + _1219;
    float _1235 = -_1195;
    float _1237 = _1235 + _1219;
    float _1239 = _1211 ? _1193 : 0.0;
    float _1241 = fma(_1225, _1229, _1201);
    bool _1243 = !_90;
    float _1245 = _1243 ? _1209 : 1.0;
    float _1247 = fma(_1225, _1233, _1199);
    bool _1249 = !_1185;
    float _1251 = fma(_1225, _1237, _1195);
    float _1253 = _1205 ? _1085 : 0.0;
    float _1255 = _961 * _1245;
    float _1257 = _1249 ? _1087 : 0.0;
    float _1259 = _1245 * _1241;
    float _1261 = _1245 * _1247;
    bool _1263 = !_90;
    float _1265 = _1263 ? _1221 : 1.0;
    int _1267 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1269 = _1267 != 0;
    float _1271 = _94 ? _1255 : _1259;
    float _1273 = _1265 * _1239;
    float _1275 = _1265 * _1253;
    float _1277 = _1265 * _1257;
    float _1279 = _1271 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1281 = _1271;
    float _1283 = _1255;
    int _1285 = as_type<int>(_1279);
    float _1287 = _1277;
    float _1289 = _1273;
    if (_90)
    {
        _1281 = 0.0;
    }
    float _1291 = _1281;
    float _1293 = _94 ? _1255 : _1261;
    float _1295 = _1291;
    if (!_94)
    {
        float _1297 = _1245 * _1251;
        _1283 = _1297;
    }
    float _1299 = _1283;
    float _1301 = _1293 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1303 = _1299 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1305 = fma(_1273, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1279);
    float _1307 = fma(_1275, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1301);
    float _1309 = _1301;
    float _1311 = _1305;
    if (_90)
    {
        _1285 = as_type<int>(_935);
    }
    int _1313 = _1285;
    float _1315 = fma(_1277, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1303);
    float _1317 = _232 * (-10000.0);
    int _1319 = _1313;
    int _1321 = _1313;
    if (_90)
    {
        _1287 = 0.0;
    }
    float _1323 = _1287;
    float _1325 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1327 = _1323;
    if (_90)
    {
        _1309 = 0.0;
    }
    float _1329 = _1309;
    bool _1331 = !_90;
    float _1333 = _1331 ? _1121 : 0.0;
    float _1335 = _1329;
    if (_90)
    {
        _260 = _1307;
    }
    float _1337 = _260;
    float _1339 = _1337;
    float _1341 = _1337;
    if (_90)
    {
        _1289 = _1315;
    }
    float _1343 = _1289;
    float _1345 = _1343;
    float _1347 = _1343;
    if (!_90)
    {
        int _1349 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1351 = _1349 != 0;
        float _1353 = _807 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1355 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1357 = _1355 != 0;
        float _1359 = _805 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1361 = _809 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1363 = !_1357;
        float _1365 = _1363 ? _1359 : 0.0;
        bool _1367 = !_1357;
        float _1369 = _1367 ? _1353 : 0.0;
        bool _1371 = !_1357;
        float _1373 = _1371 ? _1361 : 0.0;
        float _1375 = _1333 * _1365;
        _1295 = _1375;
        if (!_1351)
        {
            _1319 = as_type<int>(_935);
        }
        int _1377 = _1319;
        float _1379 = _1333 * _1369;
        float _1381 = _1333 * _1373;
        _1321 = _1377;
        _1335 = _1381;
        _1327 = _1379;
        if (!_1351)
        {
            _1339 = _1307;
        }
        float _1383 = _1339;
        _1341 = _1383;
        if (!_1351)
        {
            _1345 = _1315;
        }
        float _1385 = _1345;
        bool _1387 = !_1351;
        _1347 = _1385;
        if (!_1387)
        {
            float _1389 = -_1333;
            float _1391 = _1389 + 1.0;
            float _1393 = precise::clamp(_1391, 0.0, 1.0);
            float _1395 = _935 * _1393;
            float _1397 = precise::max(_1395, 9.9999997473787516355514526367188e-05);
            float _1399 = 1.0 / _1397;
            float _1401 = _935 * _1399;
            float _1403 = _1305 * _1401;
            float _1405 = _1307 * _1401;
            float _1407 = _1315 * _1401;
            _1321 = as_type<int>(_1395);
            _1347 = _1407;
            _1335 = 0.0;
            _1311 = _1403;
            _1295 = 0.0;
            _1341 = _1405;
            _1327 = 0.0;
        }
    }
    int _1409 = _1321;
    float _1411 = _1347;
    float _1413 = _1335;
    float _1415 = _1311;
    float _1417 = _1295;
    float _1419 = _1341;
    float _1421 = _1327;
    bool _1423 = !_1269;
    float _1425 = _1423 ? as_type<float>(_1409) : 1.0;
    float _1427 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[26].z, _1223);
    float _1429 = abs(_1317);
    bool _1431 = _1429 > 0.00999999977648258209228515625;
    float _1433 = -_1325;
    float _1435 = exp2(_1433);
    float _1437 = -_1425;
    float _1439 = _1437 + 1.0;
    float _1441 = _1431 ? _1317 : 0.00999999977648258209228515625;
    float _1443 = _1411 + _1413;
    float _1445 = _799 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1447 = fma(_1427, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1449 = _1415 + _1417;
    float _1451 = abs(_1439);
    float _1453 = log2(_1451);
    float _1455 = _1441 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1457 = fma(_1447, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1459 = _1419 + _1421;
    float _1461 = _797 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1463 = _801 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1465 = precise::max(_1455, -127.0);
    int _1467 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1469 = _1467 != 0;
    float _1471 = abs(_1457);
    float _1473 = log2(_1471);
    float _1475 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1477 = fma(_1475, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1479 = _1453 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1481 = -_1465;
    float _1483 = exp2(_1481);
    float _1485 = _1473 * 1.5;
    float _1487 = exp2(_1479);
    float _1489 = -_1483;
    float _1491 = _1489 + 1.0;
    float _1493 = 1.0 / _1465;
    float _1495 = _1435 * _1491;
    float _1497 = -_1487;
    float _1499 = spvFAdd(_1497, 1.00010001659393310546875);
    float _1501 = -_1487;
    float _1503 = _1501 + 1.0;
    float _1505 = exp2(_1485);
    float _1507 = -_1425;
    float _1509 = _1507 + _1503;
    float _1511 = _1445 * _1509;
    float _1513 = 1.0 / _1499;
    float _1515 = _1461 * _1509;
    float _1517 = _1495 * _1493;
    float _1519 = fma(_1459, _1425, _1511);
    float _1521 = _1463 * _1509;
    float _1523 = _1505 * 12.56637096405029296875;
    float _1525 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1527 = fma(_1449, _1425, _1515);
    float _1529 = 1.0 / _1523;
    float _1531 = _1517 * _1525;
    float _1533 = fma(_1443, _1425, _1521);
    float _1535 = _1513 * _1519;
    float _1537 = _1513 * _1527;
    float _1539 = _1513 * _1533;
    float _1541 = _1535 * 0.715200006961822509765625;
    float _1543 = -_1531;
    float _1545 = exp2(_1543);
    float _1547 = fma(_1537, 0.2125999927520751953125, _1541);
    float _1549 = fma(_1539, 0.072200000286102294921875, _1547);
    float _1551 = _1477 * _1529;
    float _1553 = 1.0 / _1549;
    float _1555 = -_1545;
    float _1557 = _1555 + 1.0;
    float _1559 = _1557 * _1551;
    float _1561 = _1559 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1563 = _1559 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1565 = _1553 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1567 = precise::clamp(_1565, 0.0, 1.0);
    float _1569 = _1559 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1571 = fma(_1567, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1573 = _1571 * _1545;
    float _1575 = fma(_1537, _1573, _1561);
    float _1577 = fma(_1535, _1573, _1563);
    float _1579 = fma(_1539, _1573, _1569);
    bool _1581 = !_1469;
    float _1583 = _1563;
    float _1585 = _1487;
    float _1587 = _1579;
    int _1589 = as_type<int>(_1487);
    int _1591 = as_type<int>(_1563);
    int _1593 = as_type<int>(_1577);
    float _1595 = _1579;
    if (!_1581)
    {
        bool _1597 = _1503 != 1.0;
        bool _1599 = isnan(_1503);
        bool _1601 = _1597 || _1599;
        bool _1603 = isnan(1.0);
        bool _1605 = _1601 || _1603;
        float _1607 = -_1487;
        bool _1609 = _1607 != (-1.0);
        bool _1611 = isnan(_1607);
        bool _1613 = _1609 || _1611;
        bool _1615 = isnan(-1.0);
        bool _1617 = _1613 || _1615;
        float _1619 = -_1487;
        bool _1621 = _1619 == (-1.0);
        bool _1623 = !_1605;
        bool _1625 = _1621 || _1623;
        bool _1627 = _1503 == 1.0;
        bool _1629 = _1627 && _1617;
        bool _1631 = !_1625;
        float _1633 = _1631 ? _1503 : 0.0;
        bool _1635 = !_1629;
        float _1637 = _1635 ? 0.0 : 1.0;
        float _1639 = _1625 ? 0.0 : 0.5;
        float _1641 = _1633 * 0.715200006961822509765625;
        float _1643 = fma(_1637, 0.2125999927520751953125, _1641);
        float _1645 = fma(_1639, 0.072200000286102294921875, _1643);
        float _1647 = 1.0 / _1645;
        float _1649 = _1647 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1651 = precise::clamp(_1649, 0.0, 1.0);
        float _1653 = fma(_1651, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1655 = _1637 * _1653;
        float _1657 = _1633 * _1653;
        float _1659 = _1639 * _1653;
        out.m_50.x = _1655;
        out.m_50.y = _1657;
        out.m_50.z = _1659;
        out.m_50.w = 1.0;
        return out;
    }
    bool _1661 = _108 != 0;
    bool _1663 = !_1661;
    if (!_1663)
    {
        if (_98)
        {
            _1583 = 0.0;
        }
        float _1665 = _1583;
        float _1667 = _1665;
        if (_98)
        {
            _1585 = 0.0;
        }
        float _1669 = _1585;
        float _1671 = _1669;
        if (!_98)
        {
            float _1673 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1671 = _1673;
        }
        float _1675 = _1671;
        float _1677 = _1675;
        if (!_98)
        {
            float _1679 = _1153 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1667 = _1679;
        }
        float _1681 = _1667;
        float _1683 = _1681;
        if (!_102)
        {
            float _1685 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1675);
            _1677 = _1685;
        }
        float _1687 = _1677;
        if (_98)
        {
            _1587 = 0.0;
        }
        float _1689 = _1587;
        float _1691 = _1689;
        if (!_98)
        {
            float _1693 = _1133 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1691 = _1693;
        }
        float _1695 = _1691;
        float _1697 = _1687 * 0.715200006961822509765625;
        float _1699 = _1695;
        if (!_102)
        {
            float _1701 = fma(_1095, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1681);
            _1683 = _1701;
        }
        float _1703 = _1683;
        if (!_102)
        {
            float _1705 = fma(_1119, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1695);
            _1699 = _1705;
        }
        float _1707 = _1699;
        float _1709 = fma(_1703, 0.2125999927520751953125, _1697);
        float _1711 = fma(_1707, 0.072200000286102294921875, _1709);
        float _1713 = 1.0 / _1711;
        float _1715 = _1713 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1717 = precise::clamp(_1715, 0.0, 1.0);
        float _1719 = fma(_1717, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1721 = _1719 * _1703;
        float _1723 = _1719 * _1687;
        float _1725 = _1719 * _1707;
        out.m_50.x = _1721;
        out.m_50.y = _1723;
        out.m_50.z = _1725;
        out.m_50.w = 1.0;
        return out;
    }
    if (!_106)
    {
        _1589 = as_type<int>(_1577);
    }
    int _1727 = _1589;
    float _1729 = as_type<float>(_1727);
    if (!_106)
    {
        _1591 = as_type<int>(_1575);
    }
    int _1731 = _1591;
    float _1733 = as_type<float>(_1731);
    if (!_106)
    {
        _1593 = as_type<int>(_1503);
    }
    int _1735 = _1593;
    if (!_106)
    {
        out.m_50.x = as_type<float>(_1731);
        out.m_50.y = as_type<float>(_1727);
        out.m_50.z = _1579;
        out.m_50.w = as_type<float>(_1735);
        return out;
    }
    if (_98)
    {
        _1733 = 0.0;
    }
    float _1737 = _1733;
    float _1739 = _1737;
    if (_98)
    {
        _1729 = 0.0;
    }
    float _1741 = _1729;
    float _1743 = _1741;
    if (!_98)
    {
        float _1745 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1743 = _1745;
    }
    float _1747 = _1743;
    float _1749 = _1747;
    if (!_98)
    {
        float _1751 = _1153 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1739 = _1751;
    }
    float _1753 = _1739;
    float _1755 = _1753;
    if (!_102)
    {
        float _1757 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1747);
        _1749 = _1757;
    }
    float _1759 = _1749;
    if (_98)
    {
        _1595 = 0.0;
    }
    float _1761 = _1595;
    float _1763 = _1761;
    if (!_98)
    {
        float _1765 = _1133 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1763 = _1765;
    }
    float _1767 = _1763;
    float _1769 = _1759 * 0.715200006961822509765625;
    float _1771 = _1767;
    if (!_102)
    {
        float _1773 = fma(_1095, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1753);
        _1755 = _1773;
    }
    float _1775 = _1755;
    if (!_102)
    {
        float _1777 = fma(_1119, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1767);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = fma(_1775, 0.2125999927520751953125, _1769);
    float _1783 = fma(_1779, 0.072200000286102294921875, _1781);
    float _1785 = 1.0 / _1783;
    float _1787 = _1785 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1789 = precise::clamp(_1787, 0.0, 1.0);
    float _1791 = fma(_1789, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1793 = _1791 * _1775;
    float _1795 = _1791 * _1759;
    float _1797 = _1791 * _1779;
    out.m_50.x = _1793;
    out.m_50.y = _1795;
    out.m_50.z = _1797;
    out.m_50.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_50 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _993 = false;
    bool _286 = false;
    float _62 = gl_FragCoord.w;
    float _64 = in.m_47.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_47.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_47.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    int _82 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _86 = _82 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _102 = _100 != 0;
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _106 = _104 != 0;
    int _108 = int(_86);
    float _110 = 1.0 / _62;
    float _112 = _110 * _68;
    float _114 = _110 * _74;
    float _116 = _110 * _80;
    float _118 = _112 * _112;
    float _120 = fma(_114, _114, _118);
    float _122 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _124 = fma(_116, _116, _120);
    float _126 = precise::max(0.0, _122);
    float _128 = rsqrt(_124);
    float _130 = _114 * _128;
    float _132 = _116 * _128;
    float _134 = _112 * _128;
    float _136 = _130 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _138 = _132 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _140 = -_134;
    float _142 = -_126;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].z, _142);
    float _146 = _136 * _136;
    float _148 = _138 * _138;
    float _150 = _146 + _148;
    float _152 = sqrt(_150);
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _156 = _128;
    float _158 = _126;
    float _160 = _144;
    float _162 = _136;
    float _164 = _138;
    if (!_154)
    {
        _156 = _148;
    }
    float _166 = _156;
    float _168 = _166;
    if (!_154)
    {
        _158 = _146;
    }
    float _170 = _158;
    bool _172 = !_154;
    float _174 = _170;
    if (!_172)
    {
        float _176 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _178 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _180 = _152 + _178;
        float _182 = _144 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _184 = rsqrt(_150);
        float _186 = _180 * _176;
        float _188 = _186 * 0.15915493667125701904296875;
        float _190 = _188 * 6.283185482025146484375;
        float _192 = sin(_190);
        float _194 = _188 * 6.283185482025146484375;
        float _196 = cos(_194);
        float _198 = fma(_192, _182, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _200 = _184 * _198;
        float _202 = _196 + (-1.0);
        float _204 = _136 * _200;
        float _206 = _138 * _200;
        float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _210 = _206 * _206;
        float _212 = fma(_144, _196, _208);
        float _214 = _204 * _204;
        _160 = _212;
        _174 = _214;
        _168 = _210;
        _162 = _204;
        _164 = _206;
    }
    float _216 = _160;
    float _218 = _174;
    float _220 = _168;
    float _222 = _162;
    float _224 = _164;
    float _226 = fma(_216, _216, _218);
    float _228 = _226 + _220;
    float _230 = rsqrt(_228);
    float _232 = _230 * _216;
    float _234 = _230 * _222;
    float _236 = _230 * _224;
    float _238 = -_232;
    float _240 = precise::max(0.0, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = fma(_240, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _250 = as_type<int>(_246) + (-218103808);
    float _252 = fma(_240, _248, -0.212114393711090087890625);
    bool _254 = uint(_250) >= 1920991232u;
    float _256 = fma(_240, _252, 1.570728778839111328125);
    bool _258 = !_254;
    float _260 = _232;
    float _284;
    if (!_258)
    {
        int _262 = 0;
        int _264 = 0;
        int _266 = 0;
        int _268 = as_type<int>(_246);
        int _270 = 1232;
        int _272;
        int _274;
        int _276;
        int _278;
        int _280;
        int _282;
        _58(_262, _264, _266, _268, _270, _272, _274, _276, _278, _280, _282);
        _284 = as_type<float>(_272);
        _286 = true;
    }
    else
    {
        float _288 = rsqrt(_246);
        float _290 = _246 * _288;
        float _292 = _288 * 0.5;
        float _294 = -_290;
        float _296 = 0.0 + _294;
        float _298 = fma(_292, _296, 0.5);
        float _300 = fma(_290, _298, _290);
        float _302 = -_300;
        float _304 = 0.0 + _302;
        float _306 = fma(_300, _304, _246);
        float _308 = fma(_292, _306, _300);
        _284 = _308;
    }
    _286 = false;
    float _310 = _284;
    bool _312 = _232 > 0.0;
    float _314 = _132 * _132;
    float _316 = _130 * _130;
    float _318 = _314 + _316;
    if (_312)
    {
        discard_fragment();
    }
    float _320 = rsqrt(_318);
    float _322 = _256 * _310;
    float _324 = _322 * 0.636619746685028076171875;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = -_326;
    float _330 = _328 + 1.0;
    float _332 = sqrt(_330);
    float _334 = _132 * _320;
    float _336 = _130 * _320;
    float _338 = abs(_334);
    float _340 = abs(_336);
    float _342 = precise::max(_338, _340);
    float _344 = precise::max(_342, 9.9999997473787516355514526367188e-05);
    float _346 = -_332;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _344;
    float _352 = _348 * 0.5;
    float _354 = -_350;
    float _356 = _334 * _354;
    float _358 = _336 * _350;
    float _360 = fma(_356, _352, 0.5);
    float _362 = fma(_358, _352, 0.5);
    if (_312)
    {
        out.m_50.x = 0.0;
        out.m_50.y = 0.0;
        out.m_50.z = 0.0;
        out.m_50.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_50)};
    }
    float2 _2218;
    _2218.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_360, _362));
    _2218.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_360, _362));
    float _364 = _2218.x;
    float _366 = _364 * 256.0;
    int _368 = int(_366);
    float _370 = -_134;
    float _372 = _370 + 1.0;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = -_134;
    float _378 = fma(_376, _134, 1.0);
    float _380 = precise::clamp(_378, 0.0, 1.0);
    int _382 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _384 = _382 != 0;
    float _386 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _388 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _390 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _392 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _394 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _396 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _400 = fma(_134, _392, _386);
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _404 = _374;
    if (_384)
    {
        float _406 = sqrt(_380);
        _404 = _406;
    }
    float _408 = _404;
    float _410 = -_132;
    float _412 = fma(_410, _394, _400);
    float _414 = fma(_132, _394, _400);
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _420 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _422 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _424 = fma(_134, _396, _390);
    float _426 = fma(_134, _398, _388);
    float _428 = fma(_130, _418, _414);
    float _430 = -_132;
    float _432 = fma(_430, _402, _424);
    float _434 = fma(_132, _402, _424);
    float _436 = -_132;
    float _438 = fma(_436, _416, _426);
    float _440 = fma(_132, _416, _426);
    float _442 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _444 = -_130;
    float _446 = fma(_444, _418, _412);
    float _448 = -_130;
    float _450 = fma(_448, _420, _432);
    float _452 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _454 = -_130;
    float _456 = fma(_454, _442, _438);
    float _458 = fma(_130, _442, _440);
    float _460 = -_134;
    float _462 = _130 * _460;
    float _464 = _130 * _134;
    float _466 = fma(_130, _420, _434);
    float _468 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _470 = fma(_452, _462, _456);
    float _472 = fma(_452, _464, _458);
    float _474 = fma(_422, _462, _450);
    float _476 = fma(_468, _462, _446);
    float _478 = fma(_468, _464, _428);
    float _480 = fma(_422, _464, _466);
    float _482 = -_132;
    float _484 = _134 * _482;
    float _486 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _488 = _134 * _132;
    float _490 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _492 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _494 = fma(_486, _484, _470);
    float _496 = fma(_486, _488, _472);
    float _498 = fma(_490, _484, _476);
    float _500 = fma(_492, _484, _474);
    float _502 = fma(_490, _488, _478);
    float _504 = float(uint(_368));
    float _506 = _504 * 0.00390625;
    float2 _2454 = float2(_360, _362);
    float4 _509 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2454, float2(0.0), isnan(_2454)), level(_506)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2454, float2(0.0), isnan(_2454)), level(_506)).xyzw;
    float _511 = _509.x;
    float _513 = _509.y;
    float _515 = _509.z;
    float _517 = _509.w;
    float2 _2473 = float2(_360, _362);
    float2 _521 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2473, float2(0.0), isnan(_2473)), level(_506)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2473, float2(0.0), isnan(_2473)), level(_506)).xy;
    float _523 = _521.x;
    float _525 = _521.y;
    float2 _2486 = float2(_360, _362);
    float4 _527 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2486, float2(0.0), isnan(_2486)), level(_506)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2486, float2(0.0), isnan(_2486)), level(_506)).xyzw;
    float _529 = _527.x;
    float _531 = _527.y;
    float _533 = _527.z;
    float _535 = _527.w;
    float2 _2503 = float2(_360, _362);
    float2 _537 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2503, float2(0.0), isnan(_2503)), level(_506)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2503, float2(0.0), isnan(_2503)), level(_506)).xy;
    float _539 = _537.x;
    float _541 = _537.y;
    float _543 = abs(_408);
    float _545 = log2(_543);
    float _547 = fma(_492, _488, _480);
    float _549 = _130 * _132;
    float _551 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _553 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _555 = _130 * _130;
    int _557 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _559 = _557 != 0;
    float _561 = fma(_551, _549, _494);
    float _563 = fma(_551, _549, _496);
    float _565 = fma(_553, _549, _498);
    float _567 = fma(_553, _549, _502);
    float _569 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _571 = -_134;
    float _573 = fma(_571, _134, _555);
    float _575 = _232 + 1.0;
    float _577 = fma(_569, _549, _500);
    float _579 = _545 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _581 = fma(_569, _549, _547);
    float _583 = _132 * (-3.0);
    float _585 = exp2(_579);
    float _587 = -_132;
    float _589 = fma(_587, _583, -1.0);
    float _591 = fma(_314, 3.0, -1.0);
    float _593 = _585 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _595 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _597 = fma(_595, _589, _561);
    float _599 = fma(_593, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _601 = precise::clamp(_599, 0.0, 1.0);
    float _603 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _605 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _607 = fma(_595, _591, _563);
    float _609 = fma(_603, _589, _565);
    float _611 = fma(_605, _589, _577);
    float _613 = -_601;
    float _615 = _613 + 1.0;
    float _617 = fma(_605, _591, _581);
    float _619 = fma(_603, _591, _567);
    float _621 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _623 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _625 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _627 = abs(_615);
    float _629 = log2(_627);
    float _631 = fma(_621, _573, _597);
    float _633 = fma(_621, _573, _607);
    float _635 = fma(_623, _573, _619);
    float _637 = _234 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _639 = fma(_625, _573, _611);
    float _641 = fma(_625, _573, _617);
    float _643 = fma(_623, _573, _609);
    float _645 = -_637;
    float _647 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[11].y, _645);
    float _649 = in.m_52.x;
    float _651 = gl_FragCoord.w;
    float _653 = _649 * _651;
    float _655 = -_236;
    float _657 = fma(_655, (*spvDescriptorSet0.fp_c3)._m0[11].z, _647);
    float _659 = in.m_52.y;
    float _661 = gl_FragCoord.w;
    float _663 = _659 * _661;
    float _665 = fma(_657, 0.5, 0.5);
    float _667 = fma(_657, -0.5, 0.5);
    float _669 = _629 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _671 = fma(_665, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _673 = sqrt(_667);
    float _675 = fma(_665, _671, -0.212114393711090087890625);
    float _677 = fma(_665, _675, 1.570728778839111328125);
    float _679 = exp2(_669);
    float _681 = _673 * 0.636619746685028076171875;
    float _683 = _110 * _653;
    float _685 = -_677;
    float _687 = fma(_681, _685, 1.0);
    float _689 = _110 * _663;
    float _691 = -_232;
    float _693 = fma(_679, _575, _691);
    float _695 = _517 * _517;
    float _697 = _535 * _535;
    float _699 = _695 * _695;
    float _701 = _697 * _697;
    float _703 = _699 * 16.0;
    float _705 = _523 * _525;
    float _707 = _701 * 16.0;
    float _709 = _703 * _525;
    float _711 = _707 * _541;
    float _713 = -_525;
    float _715 = _713 + _541;
    float _717 = _511 * _709;
    float _719 = _513 * _709;
    float _721 = _515 * _709;
    float _723 = -_705;
    float _725 = fma(_539, _541, _723);
    float _727 = -_717;
    float _729 = fma(_529, _711, _727);
    float _731 = -_719;
    float _733 = fma(_531, _711, _731);
    float _735 = -_721;
    float _737 = fma(_533, _711, _735);
    float _739 = fma(_715, (*spvDescriptorSet0.fp_c3)._m0[0].x, _525);
    float _741 = fma(_729, (*spvDescriptorSet0.fp_c3)._m0[0].x, _717);
    float _743 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[0].x, _719);
    float _745 = fma(_725, (*spvDescriptorSet0.fp_c3)._m0[0].x, _705);
    float2 _2844 = float2(_360, _362);
    float4 _747 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2844, float2(0.0), isnan(_2844)), level(_506)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2844, float2(0.0), isnan(_2844)), level(_506)).xyzw;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _747.w;
    float2 _2861 = float2(_360, _362);
    float2 _757 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2861, float2(0.0), isnan(_2861)), level(_506)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2861, float2(0.0), isnan(_2861)), level(_506)).xy;
    float _759 = _757.x;
    float _761 = _757.y;
    float2 _2874 = float2(_360, _362);
    float2 _763 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2874, float2(0.0), isnan(_2874)), level(_506)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2874, float2(0.0), isnan(_2874)), level(_506)).xy;
    float _765 = _763.x;
    float _767 = _763.y;
    float _769 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[0].x, _721);
    float _771 = fma(_693, 0.5, 0.5);
    float _773 = fma(_232, -0.5, 0.5);
    float2 _2896 = float2(_360, _362);
    float4 _775 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2896, float2(0.0), isnan(_2896)), level(_506)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2896, float2(0.0), isnan(_2896)), level(_506)).xyzw;
    float _777 = _775.x;
    float _779 = _775.y;
    float _781 = _775.z;
    float _783 = _775.w;
    float2 _2913 = float2(_683, _689);
    float3 _787 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2913, float2(0.0), isnan(_2913))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2913, float2(0.0), isnan(_2913))).xyz;
    float _789 = _787.x;
    float _791 = _787.y;
    float _793 = _787.z;
    float2 _2927 = float2(_687, _773);
    float3 _795 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2927, float2(0.0), isnan(_2927))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2927, float2(0.0), isnan(_2927))).xyz;
    float _797 = _795.x;
    float _799 = _795.y;
    float _801 = _795.z;
    float2 _2941 = float2(_687, _771);
    float3 _803 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2941, float2(0.0), isnan(_2941))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2941, float2(0.0), isnan(_2941))).xyz;
    float _805 = _803.x;
    float _807 = _803.y;
    float _809 = _803.z;
    int _811 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _813 = _811 != 0;
    float _815 = precise::max(_739, 1.52587890625e-05);
    float _817 = 1.0 / _815;
    float _819 = _755 * _755;
    float _821 = _819 * _819;
    float _823 = _783 * _783;
    float _825 = _821 * 16.0;
    float _827 = _789 * _791;
    float _829 = -_793;
    float _831 = _829 + 1.0;
    float _833 = _823 * _823;
    float _835 = _825 * _761;
    float _837 = _749 * _835;
    float _839 = _751 * _835;
    float _841 = _753 * _835;
    float _843 = -_761;
    float _845 = _843 + _767;
    float _847 = fma(_845, (*spvDescriptorSet0.fp_c3)._m0[0].x, _761);
    float _849 = _759 * _761;
    float _851 = _833 * 16.0;
    float _853 = -_849;
    float _855 = fma(_765, _767, _853);
    float _857 = _851 * _767;
    float _859 = _739 * _817;
    float _861 = fma(_855, (*spvDescriptorSet0.fp_c3)._m0[0].x, _849);
    float _863 = -_837;
    float _865 = fma(_777, _857, _863);
    float _867 = -_839;
    float _869 = fma(_779, _857, _867);
    float _871 = -_841;
    float _873 = fma(_781, _857, _871);
    float _875 = _741 * _859;
    float _877 = fma(_865, (*spvDescriptorSet0.fp_c3)._m0[0].x, _837);
    float _879 = precise::max(_847, 1.52587890625e-05);
    float _881 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[0].x, _839);
    float _883 = fma(_873, (*spvDescriptorSet0.fp_c3)._m0[0].x, _841);
    float _885 = -_739;
    float _887 = _885 + _847;
    float _889 = _743 * _859;
    float _891 = 1.0 / _879;
    float _893 = fma(_789, _887, _739);
    float _895 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _897 = _895 + 1.0;
    float _899 = -_827;
    float _901 = _899 + 1.0;
    float _903 = _769 * _859;
    float _905 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _907 = _905 + 1.0;
    float _909 = _745 * _859;
    float _911 = fma(_901, _897, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _913 = fma(_901, _907, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _915 = precise::max(_893, 1.52587890625e-05);
    float _917 = _861 * _891;
    float _919 = 1.0 / _915;
    float _921 = _913 * _891;
    float _923 = _917 * _911;
    float _925 = _893 * _831;
    float _927 = _847 * _921;
    float _929 = _883 * _921;
    float _931 = -_909;
    float _933 = fma(_847, _923, _931);
    float _935 = _925 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _937 = -_875;
    float _939 = fma(_877, _927, _937);
    float _941 = -_889;
    float _943 = fma(_881, _927, _941);
    float _945 = fma(_789, _933, _909);
    float _947 = -_903;
    float _949 = fma(_847, _929, _947);
    float _951 = fma(_789, _939, _875);
    float _953 = fma(_789, _943, _889);
    float _955 = _945 * _919;
    float _957 = fma(_789, _949, _903);
    bool _959 = !_559;
    float _961 = _959 ? _955 : 0.0;
    bool _963 = !_813;
    int _965 = as_type<int>(_639);
    int _967 = _813 ? (-1) : 0;
    int _981;
    int _983;
    int _985;
    int _987;
    int _989;
    int _991;
    if (!_963)
    {
        float _969 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _971 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _973 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _975 = _458 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _977 = _428 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _979 = _466 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _981 = as_type<int>(_975);
        _983 = as_type<int>(_977);
        _985 = as_type<int>(_979);
        _987 = as_type<int>(_971);
        _989 = as_type<int>(_973);
        _991 = as_type<int>(_969);
        _993 = true;
    }
    else
    {
        int _995 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _997 = _995 != 0;
        float _999 = _631 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1001 = _643 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1003 = _639 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1005 = _633 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1007 = _641 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1009 = as_type<int>(_999);
        int _1011 = as_type<int>(_1003);
        int _1013 = as_type<int>(_1005);
        _967 = _997 ? (-1) : 0;
        _985 = as_type<int>(_1007);
        if (!_997)
        {
            _965 = as_type<int>(_1001);
        }
        int _1015 = _965;
        int _1017 = _1015;
        if (_997)
        {
            float _1019 = _388 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1009 = as_type<int>(_1019);
        }
        int _1021 = _1009;
        _991 = _1021;
        if (_997)
        {
            float _1023 = _386 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1017 = as_type<int>(_1023);
        }
        int _1025 = _1017;
        _987 = _1025;
        if (_997)
        {
            float _1027 = _390 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1011 = as_type<int>(_1027);
        }
        int _1029 = _1011;
        float _1031 = _635 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1033 = as_type<int>(_1031);
        _989 = _1029;
        if (_997)
        {
            _1013 = _1021;
        }
        int _1035 = _1013;
        _981 = _1035;
        if (_997)
        {
            _1033 = _1025;
        }
        int _1037 = _1033;
        _983 = _1037;
        if (_997)
        {
            _985 = _1029;
        }
    }
    _993 = false;
    int _1039 = _967;
    int _1041 = _981;
    int _1043 = _983;
    int _1045 = _985;
    int _1047 = _987;
    int _1049 = _989;
    int _1051 = _991;
    int _1053 = 0;
    int _1055 = _1039;
    if (!_102)
    {
        int _1057 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _1059 = _1057 != 0;
        _1053 = _1059 ? (-1) : 0;
    }
    int _1061 = _1053;
    float _1063 = _629 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_102)
    {
        _1055 = -1;
    }
    int _1065 = _1055;
    float _1067 = _961 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _1069 = _1065;
    if (!_102)
    {
        int _1071 = ~_1061;
        bool _1073 = !_106;
        int _1075 = _1071 & (_1073 ? (-1) : 0);
        _1069 = _1075;
    }
    int _1077 = _1069;
    float _1079 = _961 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _1081 = _108 != 0;
    float _1083 = exp2(_1063);
    float _1085 = _953 * _919;
    float _1087 = _957 * _919;
    int _1089 = _1077;
    if (_98)
    {
        _1089 = -1;
    }
    int _1091 = _1089;
    int _1093 = ~_1077;
    float _1095 = (_1093 != 0) ? as_type<float>(_1041) : 0.0;
    int _1097 = _1091;
    if (!_98)
    {
        bool _1099 = !_106;
        bool _1101 = _1099 && _94;
        bool _1103 = !_1081;
        bool _1105 = _1101 && _1103;
        _1097 = _1105 ? (-1) : 0;
    }
    int _1107 = _1097;
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    int _1113 = ~_1077;
    float _1115 = (_1113 != 0) ? as_type<float>(_1043) : 0.0;
    int _1117 = ~_1077;
    float _1119 = (_1117 != 0) ? as_type<float>(_1045) : 0.0;
    float _1121 = _1111 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _1123 = !_106;
    bool _1125 = _94 && _1123;
    int _1127 = ~_1107;
    float _1129 = (_1127 != 0) ? as_type<float>(_1047) : 0.0;
    int _1131 = ~_1107;
    float _1133 = (_1131 != 0) ? as_type<float>(_1049) : 0.0;
    int _1135 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1137 = _1135 != 0;
    bool _1139 = !_1125;
    float _1141 = _1139 ? _1067 : 0.0;
    float _1143 = -_1121;
    float _1145 = _1143 + 1.0;
    bool _1147 = !_1125;
    float _1149 = _1147 ? _1079 : 0.0;
    int _1151 = ~_1107;
    float _1153 = (_1151 != 0) ? as_type<float>(_1051) : 0.0;
    bool _1155 = !_1137;
    float _1157 = abs(_1145);
    float _1159 = log2(_1157);
    float _1161 = _1149 * _1115;
    float _1163 = _1149 * _1095;
    bool _1165 = !_1155;
    float _1167 = _1165 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1169 = _1149 * _1119;
    bool _1171 = !_1137;
    float _1173 = fma(_1129, _1141, _1161);
    bool _1175 = !_1137;
    float _1177 = fma(_1133, _1141, _1169);
    bool _1179 = !_1171;
    float _1181 = _1179 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    int _1183 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1185 = _1183 != 0;
    bool _1187 = !_1175;
    float _1189 = _1187 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1191 = fma(_1153, _1141, _1163);
    float _1193 = _951 * _919;
    float _1195 = _1181 * _1177;
    float _1197 = _1159 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1199 = _1189 * _1173;
    float _1201 = _1167 * _1191;
    float _1203 = _1159 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    bool _1205 = !_1185;
    float _1207 = _1199 * 0.715200006961822509765625;
    float _1209 = exp2(_1197);
    bool _1211 = !_1185;
    float _1213 = fma(_1201, 0.2125999927520751953125, _1207);
    float _1215 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _1217 = _232 * _1215;
    float _1219 = fma(_1195, 0.072200000286102294921875, _1213);
    float _1221 = exp2(_1203);
    float _1223 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[26].x, _1217);
    float _1225 = _827 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1227 = -_1201;
    float _1229 = _1227 + _1219;
    float _1231 = -_1199;
    float _1233 = _1231 + _1219;
    float _1235 = -_1195;
    float _1237 = _1235 + _1219;
    float _1239 = _1211 ? _1193 : 0.0;
    float _1241 = fma(_1225, _1229, _1201);
    bool _1243 = !_90;
    float _1245 = _1243 ? _1209 : 1.0;
    float _1247 = fma(_1225, _1233, _1199);
    bool _1249 = !_1185;
    float _1251 = fma(_1225, _1237, _1195);
    float _1253 = _1205 ? _1085 : 0.0;
    float _1255 = _961 * _1245;
    float _1257 = _1249 ? _1087 : 0.0;
    float _1259 = _1245 * _1241;
    float _1261 = _1245 * _1247;
    bool _1263 = !_90;
    float _1265 = _1263 ? _1221 : 1.0;
    int _1267 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1269 = _1267 != 0;
    float _1271 = _94 ? _1255 : _1259;
    float _1273 = _1265 * _1239;
    float _1275 = _1265 * _1253;
    float _1277 = _1265 * _1257;
    float _1279 = _1271 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1281 = _1271;
    float _1283 = _1255;
    int _1285 = as_type<int>(_1279);
    float _1287 = _1277;
    float _1289 = _1273;
    if (_90)
    {
        _1281 = 0.0;
    }
    float _1291 = _1281;
    float _1293 = _94 ? _1255 : _1261;
    float _1295 = _1291;
    if (!_94)
    {
        float _1297 = _1245 * _1251;
        _1283 = _1297;
    }
    float _1299 = _1283;
    float _1301 = _1293 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1303 = _1299 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1305 = fma(_1273, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1279);
    float _1307 = fma(_1275, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1301);
    float _1309 = _1301;
    float _1311 = _1305;
    if (_90)
    {
        _1285 = as_type<int>(_935);
    }
    int _1313 = _1285;
    float _1315 = fma(_1277, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1303);
    float _1317 = _232 * (-10000.0);
    int _1319 = _1313;
    int _1321 = _1313;
    if (_90)
    {
        _1287 = 0.0;
    }
    float _1323 = _1287;
    float _1325 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1327 = _1323;
    if (_90)
    {
        _1309 = 0.0;
    }
    float _1329 = _1309;
    bool _1331 = !_90;
    float _1333 = _1331 ? _1121 : 0.0;
    float _1335 = _1329;
    if (_90)
    {
        _260 = _1307;
    }
    float _1337 = _260;
    float _1339 = _1337;
    float _1341 = _1337;
    if (_90)
    {
        _1289 = _1315;
    }
    float _1343 = _1289;
    float _1345 = _1343;
    float _1347 = _1343;
    if (!_90)
    {
        int _1349 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1351 = _1349 != 0;
        float _1353 = _807 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1355 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1357 = _1355 != 0;
        float _1359 = _805 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1361 = _809 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1363 = !_1357;
        float _1365 = _1363 ? _1359 : 0.0;
        bool _1367 = !_1357;
        float _1369 = _1367 ? _1353 : 0.0;
        bool _1371 = !_1357;
        float _1373 = _1371 ? _1361 : 0.0;
        float _1375 = _1333 * _1365;
        _1295 = _1375;
        if (!_1351)
        {
            _1319 = as_type<int>(_935);
        }
        int _1377 = _1319;
        float _1379 = _1333 * _1369;
        float _1381 = _1333 * _1373;
        _1321 = _1377;
        _1335 = _1381;
        _1327 = _1379;
        if (!_1351)
        {
            _1339 = _1307;
        }
        float _1383 = _1339;
        _1341 = _1383;
        if (!_1351)
        {
            _1345 = _1315;
        }
        float _1385 = _1345;
        bool _1387 = !_1351;
        _1347 = _1385;
        if (!_1387)
        {
            float _1389 = -_1333;
            float _1391 = _1389 + 1.0;
            float _1393 = precise::clamp(_1391, 0.0, 1.0);
            float _1395 = _935 * _1393;
            float _1397 = precise::max(_1395, 9.9999997473787516355514526367188e-05);
            float _1399 = 1.0 / _1397;
            float _1401 = _935 * _1399;
            float _1403 = _1305 * _1401;
            float _1405 = _1307 * _1401;
            float _1407 = _1315 * _1401;
            _1321 = as_type<int>(_1395);
            _1347 = _1407;
            _1335 = 0.0;
            _1311 = _1403;
            _1295 = 0.0;
            _1341 = _1405;
            _1327 = 0.0;
        }
    }
    int _1409 = _1321;
    float _1411 = _1347;
    float _1413 = _1335;
    float _1415 = _1311;
    float _1417 = _1295;
    float _1419 = _1341;
    float _1421 = _1327;
    bool _1423 = !_1269;
    float _1425 = _1423 ? as_type<float>(_1409) : 1.0;
    float _1427 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[26].z, _1223);
    float _1429 = abs(_1317);
    bool _1431 = _1429 > 0.00999999977648258209228515625;
    float _1433 = -_1325;
    float _1435 = exp2(_1433);
    float _1437 = -_1425;
    float _1439 = _1437 + 1.0;
    float _1441 = _1431 ? _1317 : 0.00999999977648258209228515625;
    float _1443 = _1411 + _1413;
    float _1445 = _799 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1447 = fma(_1427, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1449 = _1415 + _1417;
    float _1451 = abs(_1439);
    float _1453 = log2(_1451);
    float _1455 = _1441 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1457 = fma(_1447, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1459 = _1419 + _1421;
    float _1461 = _797 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1463 = _801 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1465 = precise::max(_1455, -127.0);
    int _1467 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1469 = _1467 != 0;
    float _1471 = abs(_1457);
    float _1473 = log2(_1471);
    float _1475 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1477 = fma(_1475, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1479 = _1453 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1481 = -_1465;
    float _1483 = exp2(_1481);
    float _1485 = _1473 * 1.5;
    float _1487 = exp2(_1479);
    float _1489 = -_1483;
    float _1491 = _1489 + 1.0;
    float _1493 = 1.0 / _1465;
    float _1495 = _1435 * _1491;
    float _1497 = -_1487;
    float _1499 = spvFAdd(_1497, 1.00010001659393310546875);
    float _1501 = -_1487;
    float _1503 = _1501 + 1.0;
    float _1505 = exp2(_1485);
    float _1507 = -_1425;
    float _1509 = _1507 + _1503;
    float _1511 = _1445 * _1509;
    float _1513 = 1.0 / _1499;
    float _1515 = _1461 * _1509;
    float _1517 = _1495 * _1493;
    float _1519 = fma(_1459, _1425, _1511);
    float _1521 = _1463 * _1509;
    float _1523 = _1505 * 12.56637096405029296875;
    float _1525 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1527 = fma(_1449, _1425, _1515);
    float _1529 = 1.0 / _1523;
    float _1531 = _1517 * _1525;
    float _1533 = fma(_1443, _1425, _1521);
    float _1535 = _1513 * _1519;
    float _1537 = _1513 * _1527;
    float _1539 = _1513 * _1533;
    float _1541 = _1535 * 0.715200006961822509765625;
    float _1543 = -_1531;
    float _1545 = exp2(_1543);
    float _1547 = fma(_1537, 0.2125999927520751953125, _1541);
    float _1549 = fma(_1539, 0.072200000286102294921875, _1547);
    float _1551 = _1477 * _1529;
    float _1553 = 1.0 / _1549;
    float _1555 = -_1545;
    float _1557 = _1555 + 1.0;
    float _1559 = _1557 * _1551;
    float _1561 = _1559 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1563 = _1559 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1565 = _1553 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1567 = precise::clamp(_1565, 0.0, 1.0);
    float _1569 = _1559 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1571 = fma(_1567, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1573 = _1571 * _1545;
    float _1575 = fma(_1537, _1573, _1561);
    float _1577 = fma(_1535, _1573, _1563);
    float _1579 = fma(_1539, _1573, _1569);
    bool _1581 = !_1469;
    float _1583 = _1563;
    float _1585 = _1487;
    float _1587 = _1579;
    int _1589 = as_type<int>(_1487);
    int _1591 = as_type<int>(_1563);
    int _1593 = as_type<int>(_1577);
    float _1595 = _1579;
    if (!_1581)
    {
        bool _1597 = _1503 != 1.0;
        bool _1599 = isnan(_1503);
        bool _1601 = _1597 || _1599;
        bool _1603 = isnan(1.0);
        bool _1605 = _1601 || _1603;
        float _1607 = -_1487;
        bool _1609 = _1607 != (-1.0);
        bool _1611 = isnan(_1607);
        bool _1613 = _1609 || _1611;
        bool _1615 = isnan(-1.0);
        bool _1617 = _1613 || _1615;
        float _1619 = -_1487;
        bool _1621 = _1619 == (-1.0);
        bool _1623 = !_1605;
        bool _1625 = _1621 || _1623;
        bool _1627 = _1503 == 1.0;
        bool _1629 = _1627 && _1617;
        bool _1631 = !_1625;
        float _1633 = _1631 ? _1503 : 0.0;
        bool _1635 = !_1629;
        float _1637 = _1635 ? 0.0 : 1.0;
        float _1639 = _1625 ? 0.0 : 0.5;
        float _1641 = _1633 * 0.715200006961822509765625;
        float _1643 = fma(_1637, 0.2125999927520751953125, _1641);
        float _1645 = fma(_1639, 0.072200000286102294921875, _1643);
        float _1647 = 1.0 / _1645;
        float _1649 = _1647 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1651 = precise::clamp(_1649, 0.0, 1.0);
        float _1653 = fma(_1651, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1655 = _1637 * _1653;
        float _1657 = _1633 * _1653;
        float _1659 = _1639 * _1653;
        out.m_50.x = _1655;
        out.m_50.y = _1657;
        out.m_50.z = _1659;
        out.m_50.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_50)};
    }
    bool _1661 = _108 != 0;
    bool _1663 = !_1661;
    if (!_1663)
    {
        if (_98)
        {
            _1583 = 0.0;
        }
        float _1665 = _1583;
        float _1667 = _1665;
        if (_98)
        {
            _1585 = 0.0;
        }
        float _1669 = _1585;
        float _1671 = _1669;
        if (!_98)
        {
            float _1673 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1671 = _1673;
        }
        float _1675 = _1671;
        float _1677 = _1675;
        if (!_98)
        {
            float _1679 = _1153 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1667 = _1679;
        }
        float _1681 = _1667;
        float _1683 = _1681;
        if (!_102)
        {
            float _1685 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1675);
            _1677 = _1685;
        }
        float _1687 = _1677;
        if (_98)
        {
            _1587 = 0.0;
        }
        float _1689 = _1587;
        float _1691 = _1689;
        if (!_98)
        {
            float _1693 = _1133 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1691 = _1693;
        }
        float _1695 = _1691;
        float _1697 = _1687 * 0.715200006961822509765625;
        float _1699 = _1695;
        if (!_102)
        {
            float _1701 = fma(_1095, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1681);
            _1683 = _1701;
        }
        float _1703 = _1683;
        if (!_102)
        {
            float _1705 = fma(_1119, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1695);
            _1699 = _1705;
        }
        float _1707 = _1699;
        float _1709 = fma(_1703, 0.2125999927520751953125, _1697);
        float _1711 = fma(_1707, 0.072200000286102294921875, _1709);
        float _1713 = 1.0 / _1711;
        float _1715 = _1713 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1717 = precise::clamp(_1715, 0.0, 1.0);
        float _1719 = fma(_1717, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1721 = _1719 * _1703;
        float _1723 = _1719 * _1687;
        float _1725 = _1719 * _1707;
        out.m_50.x = _1721;
        out.m_50.y = _1723;
        out.m_50.z = _1725;
        out.m_50.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_50)};
    }
    if (!_106)
    {
        _1589 = as_type<int>(_1577);
    }
    int _1727 = _1589;
    float _1729 = as_type<float>(_1727);
    if (!_106)
    {
        _1591 = as_type<int>(_1575);
    }
    int _1731 = _1591;
    float _1733 = as_type<float>(_1731);
    if (!_106)
    {
        _1593 = as_type<int>(_1503);
    }
    int _1735 = _1593;
    if (!_106)
    {
        out.m_50.x = as_type<float>(_1731);
        out.m_50.y = as_type<float>(_1727);
        out.m_50.z = _1579;
        out.m_50.w = as_type<float>(_1735);
        return main0_out_u{as_type<uint4>(out.m_50)};
    }
    if (_98)
    {
        _1733 = 0.0;
    }
    float _1737 = _1733;
    float _1739 = _1737;
    if (_98)
    {
        _1729 = 0.0;
    }
    float _1741 = _1729;
    float _1743 = _1741;
    if (!_98)
    {
        float _1745 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1743 = _1745;
    }
    float _1747 = _1743;
    float _1749 = _1747;
    if (!_98)
    {
        float _1751 = _1153 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1739 = _1751;
    }
    float _1753 = _1739;
    float _1755 = _1753;
    if (!_102)
    {
        float _1757 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1747);
        _1749 = _1757;
    }
    float _1759 = _1749;
    if (_98)
    {
        _1595 = 0.0;
    }
    float _1761 = _1595;
    float _1763 = _1761;
    if (!_98)
    {
        float _1765 = _1133 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1763 = _1765;
    }
    float _1767 = _1763;
    float _1769 = _1759 * 0.715200006961822509765625;
    float _1771 = _1767;
    if (!_102)
    {
        float _1773 = fma(_1095, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1753);
        _1755 = _1773;
    }
    float _1775 = _1755;
    if (!_102)
    {
        float _1777 = fma(_1119, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1767);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = fma(_1775, 0.2125999927520751953125, _1769);
    float _1783 = fma(_1779, 0.072200000286102294921875, _1781);
    float _1785 = 1.0 / _1783;
    float _1787 = _1785 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1789 = precise::clamp(_1787, 0.0, 1.0);
    float _1791 = fma(_1789, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1793 = _1791 * _1775;
    float _1795 = _1791 * _1759;
    float _1797 = _1791 * _1779;
    out.m_50.x = _1793;
    out.m_50.y = _1795;
    out.m_50.z = _1797;
    out.m_50.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_50)};
}

