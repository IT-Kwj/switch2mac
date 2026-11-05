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
void _42(thread const int& _3499, thread const int& _3500, thread const int& _3501, thread const int& _3502, thread int& _3503, thread int& _3504, thread int& _3505, thread int& _3506, thread int& _3507)
{
    float _3510 = as_type<float>(_3500) + 0.0;
    bool _3512 = _3510 != 0.0;
    bool _3514 = isnan(_3510);
    bool _3516 = _3512 || _3514;
    bool _3518 = isnan(0.0);
    bool _3520 = _3516 || _3518;
    int _3522 = as_type<int>(_3510);
    int _3524 = _3501;
    int _3526 = _3520 ? (-1) : 0;
    if (!_3520)
    {
        float _3528 = as_type<float>(_3500) * 1.0;
        _3522 = as_type<int>(_3528);
    }
    int _3530 = _3522;
    bool _3532 = !_3520;
    int _3534 = _3530;
    if (!_3532)
    {
        float _3536 = as_type<float>(_3500) + 0.0;
        bool _3538 = _3536 >= 0.0;
        bool _3540 = isnan(_3536);
        bool _3542 = _3538 || _3540;
        bool _3544 = isnan(0.0);
        bool _3546 = _3542 || _3544;
        int _3548 = as_type<int>(_3536);
        _3526 = _3546 ? (-1) : 0;
        if (!_3546)
        {
            _3548 = 2147483647;
        }
        int _3550 = _3548;
        bool _3552 = !_3546;
        _3534 = _3550;
        if (!_3552)
        {
            float _3554 = abs(as_type<float>(_3500));
            float _3556 = _3554 + 0.0;
            bool _3558 = _3556 > as_type<float>(0x7f800000u /* inf */);
            bool _3560 = isnan(_3556);
            bool _3562 = _3558 || _3560;
            bool _3564 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3566 = _3562 || _3564;
            int _3568 = as_type<int>(_3556);
            _3526 = _3566 ? (-1) : 0;
            if (_3566)
            {
                float _3570 = as_type<float>(_3500) + 1.0;
                _3568 = as_type<int>(_3570);
            }
            int _3572 = _3568;
            _3534 = _3572;
            if (!_3566)
            {
                float _3574 = abs(as_type<float>(_3500));
                float _3576 = _3574 + (-0.0);
                float _3578 = 0.0 + _3576;
                bool _3580 = _3578 != as_type<float>(0x7f800000u /* inf */);
                bool _3582 = isnan(_3578);
                bool _3584 = _3580 || _3582;
                bool _3586 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3588 = _3584 || _3586;
                int _3590 = as_type<int>(_3578);
                _3526 = _3588 ? (-1) : 0;
                if (!_3588)
                {
                    _3590 = _3500;
                }
                int _3592 = _3590;
                bool _3594 = !_3588;
                _3534 = _3592;
                if (!_3594)
                {
                    float _3596 = as_type<float>(_3500) * 18446744073709551616.0;
                    float _3598 = rsqrt(_3596);
                    float _3600 = _3596 * _3598;
                    float _3602 = _3598 * 0.5;
                    float _3604 = -_3600;
                    float _3606 = 0.0 + _3604;
                    float _3608 = fma(_3602, _3606, 0.5);
                    float _3610 = fma(_3600, _3608, _3600);
                    float _3612 = -_3610;
                    float _3614 = 0.0 + _3612;
                    float _3616 = fma(_3610, _3614, _3596);
                    float _3618 = fma(_3602, _3616, _3610);
                    float _3620 = _3618 * 2.3283064365386962890625e-10;
                    _3534 = as_type<int>(_3620);
                    _3524 = as_type<int>(_3610);
                }
            }
        }
    }
    int _3622 = _3534;
    int _3624 = _3524;
    int _3626 = _3526;
    _3503 = _3622;
    _3504 = _3502;
    _3505 = 0;
    _3506 = _3624;
    _3507 = _3626;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _693 = false;
    bool _260 = false;
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
    float _218 = -_216;
    float _220 = precise::max(0.0, _218);
    float _222 = abs(_220);
    float _224 = -_222;
    float _226 = _224 + 1.0;
    float _228 = fma(_220, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _230 = as_type<int>(_226) + (-218103808);
    float _232 = fma(_220, _228, -0.212114393711090087890625);
    bool _234 = uint(_230) >= 1920991232u;
    float _236 = fma(_220, _232, 1.570728778839111328125);
    bool _238 = !_234;
    float _258;
    if (!_238)
    {
        int _240 = 0;
        int _242 = as_type<int>(_226);
        int _244 = 0;
        int _246 = 1200;
        int _248;
        int _250;
        int _252;
        int _254;
        int _256;
        _42(_240, _242, _244, _246, _248, _250, _252, _254, _256);
        _258 = as_type<float>(_248);
        _260 = true;
    }
    else
    {
        float _262 = rsqrt(_226);
        float _264 = _226 * _262;
        float _266 = _262 * 0.5;
        float _268 = -_264;
        float _270 = 0.0 + _268;
        float _272 = fma(_266, _270, 0.5);
        float _274 = fma(_264, _272, _264);
        float _276 = -_274;
        float _278 = 0.0 + _276;
        float _280 = fma(_274, _278, _226);
        float _282 = fma(_266, _280, _274);
        _258 = _282;
    }
    _260 = false;
    float _284 = _258;
    bool _286 = _216 > 0.0;
    if (_286)
    {
        discard_fragment();
    }
    if (_286)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _288 = -_118;
    float _290 = _288 + 1.0;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = -_118;
    float _296 = fma(_294, _118, 1.0);
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = _116 * _116;
    int _302 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _304 = _302 != 0;
    float _306 = _114 * _114;
    float _308 = _214 * _206;
    float _310 = _236 * _284;
    float _312 = _214 * _208;
    float _314 = _300 + _306;
    float _316 = _310 * 0.636619746685028076171875;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    float _320 = rsqrt(_314);
    float _322 = -_318;
    float _324 = _322 + 1.0;
    float _326 = _292;
    if (_304)
    {
        float _328 = sqrt(_298);
        _326 = _328;
    }
    float _330 = _326;
    float _332 = sqrt(_324);
    float _334 = _116 * _320;
    float _336 = _114 * _320;
    float _338 = abs(_334);
    float _340 = abs(_336);
    float _342 = precise::max(_338, _340);
    float _344 = abs(_330);
    float _346 = log2(_344);
    float _348 = precise::max(_342, 9.9999997473787516355514526367188e-05);
    float _350 = -_332;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _348;
    float _356 = _352 * 0.5;
    float _358 = _346 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _360 = _308 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _362 = -_360;
    float _364 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[11].y, _362);
    float _366 = exp2(_358);
    float _368 = -_312;
    float _370 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[11].z, _364);
    float _372 = fma(_370, -0.5, 0.5);
    float _374 = fma(_370, 0.5, 0.5);
    float _376 = fma(_374, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _378 = sqrt(_372);
    float _380 = _366 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _382 = fma(_374, _376, -0.212114393711090087890625);
    float _384 = -_354;
    float _386 = _334 * _384;
    float _388 = fma(_216, -0.5, 0.5);
    float _390 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = fma(_374, _382, 1.570728778839111328125);
    float _396 = fma(_386, _356, 0.5);
    float _398 = -_392;
    float _400 = _398 + 1.0;
    float _402 = abs(_400);
    float _404 = log2(_402);
    float _406 = _378 * 0.636619746685028076171875;
    float _408 = -_394;
    float _410 = fma(_406, _408, 1.0);
    float _412 = _336 * _354;
    float _414 = _216 + 1.0;
    float _416 = fma(_412, _356, 0.5);
    float _418 = _404 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float2 _1915;
    _1915.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_396, _416));
    _1915.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_396, _416));
    float _420 = _1915.x;
    float _422 = _420 * 256.0;
    int _424 = int(_422);
    float _426 = exp2(_418);
    float _428 = -_216;
    float _430 = fma(_426, _414, _428);
    float _432 = fma(_430, 0.5, 0.5);
    float2 _1935 = float2(_410, _388);
    float3 _436 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1935, float2(0.0), isnan(_1935))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1935, float2(0.0), isnan(_1935))).xyz;
    float _438 = _436.x;
    float _440 = _436.y;
    float _442 = _436.z;
    float2 _1951 = float2(_410, _432);
    float3 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1951, float2(0.0), isnan(_1951))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1951, float2(0.0), isnan(_1951))).xyz;
    float _446 = _444.x;
    float _448 = _444.y;
    float _450 = _444.z;
    float _452 = _114 * _118;
    float _454 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _456 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _458 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _460 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _462 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _464 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _466 = fma(_118, _458, _454);
    float _468 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _470 = fma(_118, _460, _456);
    float _472 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _474 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _476 = fma(_118, _468, _462);
    float _478 = -_116;
    float _480 = fma(_478, _464, _470);
    float _482 = fma(_116, _464, _470);
    float _484 = -_116;
    float _486 = fma(_484, _474, _466);
    float _488 = -_116;
    float _490 = fma(_488, _472, _476);
    float _492 = fma(_116, _472, _476);
    float _494 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _496 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _498 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _500 = fma(_116, _474, _466);
    float _502 = -_114;
    float _504 = fma(_502, _494, _480);
    float _506 = -_114;
    float _508 = fma(_506, _496, _486);
    float _510 = fma(_114, _494, _482);
    float _512 = -_114;
    float _514 = fma(_512, _498, _490);
    float _516 = fma(_114, _498, _492);
    float _518 = -_118;
    float _520 = _114 * _518;
    float _522 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _524 = fma(_114, _496, _500);
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _528 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _530 = fma(_522, _520, _504);
    float _532 = fma(_522, _452, _510);
    float _534 = fma(_526, _520, _508);
    float _536 = fma(_526, _452, _524);
    float _538 = fma(_528, _520, _514);
    float _540 = -_116;
    float _542 = _118 * _540;
    float _544 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _546 = _118 * _116;
    float _548 = fma(_528, _452, _516);
    float _550 = fma(_544, _542, _534);
    float _552 = fma(_544, _546, _536);
    float _554 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _556 = fma(_554, _542, _530);
    float _558 = fma(_554, _546, _532);
    float _560 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _562 = fma(_560, _546, _548);
    float _564 = fma(_560, _542, _538);
    float _566 = float(uint(_424));
    float _568 = _566 * 0.00390625;
    float2 _2168 = float2(_396, _416);
    float2 _572 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2168, float2(0.0), isnan(_2168)), level(_568)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2168, float2(0.0), isnan(_2168)), level(_568)).xy;
    float _574 = _572.x;
    float _576 = _572.y;
    float2 _2181 = float2(_396, _416);
    float4 _579 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2181, float2(0.0), isnan(_2181)), level(_568)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2181, float2(0.0), isnan(_2181)), level(_568)).xyzw;
    float _581 = _579.x;
    float _583 = _579.y;
    float _585 = _579.z;
    float _587 = _579.w;
    float _589 = _114 * _116;
    float _591 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _593 = -_118;
    float _595 = fma(_593, _118, _306);
    int _597 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _599 = _597 != 0;
    float _601 = fma(_591, _589, _550);
    float _603 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _605 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _607 = fma(_591, _589, _552);
    float _609 = fma(_603, _589, _556);
    float _611 = fma(_605, _589, _564);
    float _613 = fma(_605, _589, _562);
    float _615 = _116 * (-3.0);
    float _617 = fma(_603, _589, _558);
    float _619 = fma(_300, 3.0, -1.0);
    float _621 = -_116;
    float _623 = fma(_621, _615, -1.0);
    float _625 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _627 = fma(_625, _623, _601);
    float _629 = fma(_625, _619, _607);
    float _631 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _633 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _635 = fma(_631, _623, _609);
    float _637 = fma(_631, _619, _617);
    float _639 = fma(_633, _623, _611);
    float _641 = fma(_633, _619, _613);
    float _643 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _645 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _647 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _649 = fma(_643, _595, _627);
    float _651 = fma(_643, _595, _629);
    float _653 = fma(_645, _595, _635);
    float _655 = fma(_645, _595, _637);
    float _657 = fma(_647, _595, _639);
    float _659 = fma(_647, _595, _641);
    float _661 = _576 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _663 = !_599;
    int _665 = as_type<int>(_655);
    int _667 = _599 ? (-1) : 0;
    int _681;
    int _683;
    int _685;
    int _687;
    int _689;
    int _691;
    if (!_663)
    {
        float _669 = _508 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _671 = _504 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _673 = _514 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _675 = _524 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _677 = _510 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _679 = _516 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _681 = as_type<int>(_675);
        _683 = as_type<int>(_677);
        _685 = as_type<int>(_669);
        _687 = as_type<int>(_671);
        _689 = as_type<int>(_679);
        _691 = as_type<int>(_673);
        _693 = true;
    }
    else
    {
        int _695 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _697 = _695 != 0;
        float _699 = _649 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _701 = _653 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _703 = _657 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _705 = _651 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _707 = _655 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _709 = _659 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _711 = as_type<int>(_699);
        int _713 = as_type<int>(_701);
        int _715 = as_type<int>(_703);
        int _717 = as_type<int>(_707);
        _667 = _697 ? (-1) : 0;
        _689 = as_type<int>(_709);
        if (_697)
        {
            float _719 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _711 = as_type<int>(_719);
        }
        int _721 = _711;
        _685 = _721;
        if (_697)
        {
            float _723 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _713 = as_type<int>(_723);
        }
        int _725 = _713;
        _687 = _725;
        if (_697)
        {
            float _727 = _462 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _715 = as_type<int>(_727);
        }
        int _729 = _715;
        _691 = _729;
        if (!_697)
        {
            _665 = as_type<int>(_705);
        }
        int _731 = _665;
        int _733 = _731;
        if (_697)
        {
            _733 = _721;
        }
        int _735 = _733;
        _681 = _735;
        if (_697)
        {
            _717 = _725;
        }
        int _737 = _717;
        _683 = _737;
        if (_697)
        {
            _689 = _729;
        }
    }
    _693 = false;
    int _739 = _667;
    int _741 = _681;
    int _743 = _683;
    int _745 = _685;
    int _747 = _687;
    int _749 = _689;
    int _751 = _691;
    float _753 = _404 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    int _755 = 0;
    int _757 = _739;
    if (!_86)
    {
        int _759 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _761 = _759 != 0;
        _755 = _761 ? (-1) : 0;
    }
    int _763 = _755;
    float _765 = _587 * _587;
    if (_86)
    {
        _757 = -1;
    }
    int _767 = _757;
    int _769 = _767;
    if (!_86)
    {
        int _771 = ~_763;
        bool _773 = !_90;
        int _775 = _771 & (_773 ? (-1) : 0);
        _769 = _775;
    }
    int _777 = _769;
    float _779 = exp2(_753);
    bool _781 = _92 != 0;
    float _783 = _765 * _765;
    float _785 = _783 * 16.0;
    float _787 = _583 * _785;
    float _789 = _581 * _785;
    int _791 = _777;
    int _793 = as_type<int>(_789);
    if (_82)
    {
        _791 = -1;
    }
    int _795 = _791;
    float _797 = -_779;
    float _799 = _797 + 1.0;
    int _801 = _795;
    if (!_82)
    {
        bool _803 = !_90;
        bool _805 = _803 && _78;
        bool _807 = !_781;
        bool _809 = _805 && _807;
        _801 = _809 ? (-1) : 0;
    }
    int _811 = _801;
    int _813 = ~_777;
    float _815 = (_813 != 0) ? as_type<float>(_741) : 0.0;
    float _817 = _585 * _785;
    float _819 = _799 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _821 = ~_777;
    float _823 = (_821 != 0) ? as_type<float>(_743) : 0.0;
    float _825 = -_819;
    float _827 = _825 + 1.0;
    float _829 = abs(_827);
    float _831 = log2(_829);
    int _833 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _835 = _833 != 0;
    int _837 = ~_811;
    float _839 = (_837 != 0) ? as_type<float>(_745) : 0.0;
    int _841 = ~_811;
    float _843 = (_841 != 0) ? as_type<float>(_747) : 0.0;
    bool _845 = !_90;
    bool _847 = _78 && _845;
    bool _849 = !_835;
    float _851 = _849 ? _574 : 0.0;
    float _853 = _831 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _855 = _831 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    int _857 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _859 = _857 != 0;
    float _861 = _851 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _863 = exp2(_853);
    float _865 = _851 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _867 = ~_777;
    float _869 = (_867 != 0) ? as_type<float>(_749) : 0.0;
    bool _871 = !_859;
    bool _873 = !_847;
    float _875 = _873 ? _861 : 0.0;
    bool _877 = !_859;
    float _879 = exp2(_855);
    bool _881 = !_871;
    float _883 = _881 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _885 = _875 * _869;
    bool _887 = !_859;
    float _889 = _875 * _815;
    int _891 = ~_811;
    float _893 = (_891 != 0) ? as_type<float>(_751) : 0.0;
    float _895 = _875 * _823;
    bool _897 = !_847;
    float _899 = _897 ? _865 : 0.0;
    int _901 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _903 = _901 != 0;
    bool _905 = !_877;
    float _907 = _905 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _909 = !_887;
    float _911 = _909 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _913 = fma(_893, _899, _885);
    float _915 = fma(_839, _899, _889);
    float _917 = fma(_843, _899, _895);
    float _919 = _911 * _913;
    bool _921 = !_74;
    float _923 = _921 ? _863 : 1.0;
    float _925 = _883 * _915;
    bool _927 = !_903;
    float _929 = _907 * _917;
    bool _931 = !_903;
    float _933 = _923 * _925;
    float _935 = _927 ? _817 : 0.0;
    float _937 = _923 * _851;
    bool _939 = !_903;
    float _941 = _923 * _929;
    bool _943 = !_74;
    float _945 = _943 ? _879 : 1.0;
    float _947 = _931 ? _789 : 0.0;
    float _949 = _945 * _935;
    float _951 = _937;
    float _953 = _923;
    if (_74)
    {
        _793 = as_type<int>(_661);
    }
    int _955 = _793;
    float _957 = _945 * _947;
    float _959 = _939 ? _787 : 0.0;
    float _961 = _78 ? _937 : _933;
    float _963 = _78 ? _937 : _941;
    int _965 = _955;
    int _967 = _955;
    if (!_78)
    {
        float _969 = _923 * _919;
        _951 = _969;
    }
    float _971 = _951;
    float _973 = _945 * _959;
    float _975 = _971 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _977 = _961 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _979 = _963 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _981 = _977;
    float _983 = _973;
    if (_74)
    {
        _953 = 0.0;
    }
    float _985 = _953;
    float _987 = fma(_949, (*spvDescriptorSet0.fp_c3)._m0[27].z, _975);
    float _989 = fma(_957, (*spvDescriptorSet0.fp_c3)._m0[27].x, _977);
    float _991 = fma(_973, (*spvDescriptorSet0.fp_c3)._m0[27].y, _979);
    float _993 = _991;
    float _995 = _989;
    float _997 = _985;
    float _999 = _987;
    if (_74)
    {
        _981 = 0.0;
    }
    float _1001 = _981;
    float _1003 = _1001;
    if (_74)
    {
        _983 = 0.0;
    }
    float _1005 = _983;
    bool _1007 = !_74;
    float _1009 = _1007 ? _819 : 0.0;
    float _1011 = _1005;
    if (!_74)
    {
        int _1013 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1015 = _1013 != 0;
        float _1017 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1019 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1021 = _1019 != 0;
        float _1023 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1025 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1027 = !_1021;
        float _1029 = _1027 ? _1023 : 0.0;
        bool _1031 = !_1021;
        float _1033 = _1031 ? _1017 : 0.0;
        bool _1035 = !_1021;
        float _1037 = _1035 ? _1025 : 0.0;
        float _1039 = _1009 * _1029;
        _997 = _1039;
        if (!_1015)
        {
            _965 = as_type<int>(_661);
        }
        int _1041 = _965;
        float _1043 = _1009 * _1033;
        float _1045 = _1009 * _1037;
        bool _1047 = !_1015;
        _1003 = _1043;
        _967 = _1041;
        _1011 = _1045;
        if (!_1047)
        {
            float _1049 = -_1009;
            float _1051 = _1049 + 1.0;
            float _1053 = precise::clamp(_1051, 0.0, 1.0);
            float _1055 = _661 * _1053;
            float _1057 = precise::max(_1055, 9.9999997473787516355514526367188e-05);
            float _1059 = 1.0 / _1057;
            float _1061 = _661 * _1059;
            float _1063 = _989 * _1061;
            float _1065 = _991 * _1061;
            float _1067 = _987 * _1061;
            _993 = _1065;
            _1003 = 0.0;
            _995 = _1063;
            _997 = 0.0;
            _967 = as_type<int>(_1055);
            _999 = _1067;
            _1011 = 0.0;
        }
    }
    float _1069 = _993;
    float _1071 = _1003;
    float _1073 = _995;
    float _1075 = _997;
    int _1077 = _967;
    float _1079 = _999;
    float _1081 = _1011;
    int _1083 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1085 = _1083 != 0;
    int _1087 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1089 = _1087 != 0;
    float _1091 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1093 = _438 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1095 = _1069 + _1071;
    float _1097 = _1073 + _1075;
    bool _1099 = !_1089;
    float _1101 = _1099 ? as_type<float>(_1077) : 1.0;
    float _1103 = _442 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1105 = _1079 + _1081;
    float _1107 = -_1101;
    float _1109 = _1107 + 1.0;
    float _1111 = abs(_1109);
    float _1113 = log2(_1111);
    float _1115 = _1113 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1117 = exp2(_1115);
    float _1119 = -_1117;
    float _1121 = spvFAdd(_1119, 1.00010001659393310546875);
    float _1123 = -_1117;
    float _1125 = _1123 + 1.0;
    float _1127 = -_1101;
    float _1129 = _1127 + _1125;
    float _1131 = 1.0 / _1121;
    float _1133 = _1129 * _1091;
    float _1135 = _1129 * _1093;
    float _1137 = _1129 * _1103;
    float _1139 = fma(_1095, _1101, _1133);
    float _1141 = fma(_1097, _1101, _1135);
    float _1143 = fma(_1105, _1101, _1137);
    float _1145 = _1131 * _1139;
    float _1147 = _1131 * _1141;
    float _1149 = _1131 * _1143;
    float _1151 = _1145 * 0.715200006961822509765625;
    float _1153 = fma(_1147, 0.2125999927520751953125, _1151);
    float _1155 = fma(_1149, 0.072200000286102294921875, _1153);
    float _1157 = 1.0 / _1155;
    float _1159 = _1157 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1161 = precise::clamp(_1159, 0.0, 1.0);
    float _1163 = fma(_1161, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1165 = _1147 * _1163;
    float _1167 = _1145 * _1163;
    float _1169 = _1149 * _1163;
    bool _1171 = !_1085;
    float _1173 = _1165;
    float _1175 = _1169;
    float _1177 = _1167;
    int _1179 = as_type<int>(_1117);
    int _1181 = as_type<int>(_1165);
    int _1183 = as_type<int>(_1167);
    float _1185 = _1169;
    if (!_1171)
    {
        bool _1187 = _1125 != 1.0;
        bool _1189 = isnan(_1125);
        bool _1191 = _1187 || _1189;
        bool _1193 = isnan(1.0);
        bool _1195 = _1191 || _1193;
        float _1197 = -_1117;
        bool _1199 = _1197 != (-1.0);
        bool _1201 = isnan(_1197);
        bool _1203 = _1199 || _1201;
        bool _1205 = isnan(-1.0);
        bool _1207 = _1203 || _1205;
        float _1209 = -_1117;
        bool _1211 = _1209 == (-1.0);
        bool _1213 = !_1195;
        bool _1215 = _1211 || _1213;
        bool _1217 = _1125 == 1.0;
        bool _1219 = _1217 && _1207;
        bool _1221 = !_1215;
        float _1223 = _1221 ? _1125 : 0.0;
        bool _1225 = !_1219;
        float _1227 = _1225 ? 0.0 : 1.0;
        float _1229 = _1215 ? 0.0 : 0.5;
        float _1231 = _1223 * 0.715200006961822509765625;
        float _1233 = fma(_1227, 0.2125999927520751953125, _1231);
        float _1235 = fma(_1229, 0.072200000286102294921875, _1233);
        float _1237 = 1.0 / _1235;
        float _1239 = _1237 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1241 = precise::clamp(_1239, 0.0, 1.0);
        float _1243 = fma(_1241, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1245 = _1227 * _1243;
        float _1247 = _1223 * _1243;
        float _1249 = _1229 * _1243;
        out.m_36.x = _1245;
        out.m_36.y = _1247;
        out.m_36.z = _1249;
        out.m_36.w = 1.0;
        return out;
    }
    bool _1251 = _92 != 0;
    bool _1253 = !_1251;
    if (!_1253)
    {
        if (_82)
        {
            _1173 = 0.0;
        }
        float _1255 = _1173;
        float _1257 = _1255;
        if (_82)
        {
            _1175 = 0.0;
        }
        float _1259 = _1175;
        float _1261 = _1259;
        if (!_82)
        {
            float _1263 = _843 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1261 = _1263;
        }
        float _1265 = _1261;
        float _1267 = _1265;
        if (!_82)
        {
            float _1269 = _839 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1257 = _1269;
        }
        float _1271 = _1257;
        float _1273 = _1271;
        if (!_86)
        {
            float _1275 = fma(_823, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1265);
            _1267 = _1275;
        }
        float _1277 = _1267;
        if (_82)
        {
            _1177 = 0.0;
        }
        float _1279 = _1177;
        float _1281 = _1279;
        if (!_82)
        {
            float _1283 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1281 = _1283;
        }
        float _1285 = _1281;
        float _1287 = _1277 * 0.715200006961822509765625;
        float _1289 = _1285;
        if (!_86)
        {
            float _1291 = fma(_815, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1271);
            _1273 = _1291;
        }
        float _1293 = _1273;
        if (!_86)
        {
            float _1295 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1285);
            _1289 = _1295;
        }
        float _1297 = _1289;
        float _1299 = fma(_1293, 0.2125999927520751953125, _1287);
        float _1301 = fma(_1297, 0.072200000286102294921875, _1299);
        float _1303 = 1.0 / _1301;
        float _1305 = _1303 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1307 = precise::clamp(_1305, 0.0, 1.0);
        float _1309 = fma(_1307, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1311 = _1309 * _1293;
        float _1313 = _1309 * _1277;
        float _1315 = _1309 * _1297;
        out.m_36.x = _1311;
        out.m_36.y = _1313;
        out.m_36.z = _1315;
        out.m_36.w = 1.0;
        return out;
    }
    if (!_90)
    {
        _1179 = as_type<int>(_1165);
    }
    int _1317 = _1179;
    if (!_90)
    {
        _1181 = as_type<int>(_1167);
    }
    int _1319 = _1181;
    float _1321 = as_type<float>(_1319);
    if (!_90)
    {
        _1183 = as_type<int>(_1125);
    }
    int _1323 = _1183;
    float _1325 = as_type<float>(_1323);
    if (!_90)
    {
        out.m_36.x = as_type<float>(_1317);
        out.m_36.y = as_type<float>(_1319);
        out.m_36.z = _1169;
        out.m_36.w = as_type<float>(_1323);
        return out;
    }
    if (_82)
    {
        _1321 = 0.0;
    }
    float _1327 = _1321;
    float _1329 = _1327;
    if (_82)
    {
        _1185 = 0.0;
    }
    float _1331 = _1185;
    float _1333 = _1331;
    if (!_82)
    {
        float _1335 = _843 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1333 = _1335;
    }
    float _1337 = _1333;
    float _1339 = _1337;
    if (!_82)
    {
        float _1341 = _839 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1329 = _1341;
    }
    float _1343 = _1329;
    float _1345 = _1343;
    if (!_86)
    {
        float _1347 = fma(_823, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1337);
        _1339 = _1347;
    }
    float _1349 = _1339;
    if (_82)
    {
        _1325 = 0.0;
    }
    float _1351 = _1325;
    float _1353 = _1351;
    if (!_82)
    {
        float _1355 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1353 = _1355;
    }
    float _1357 = _1353;
    float _1359 = _1349 * 0.715200006961822509765625;
    float _1361 = _1357;
    if (!_86)
    {
        float _1363 = fma(_815, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1343);
        _1345 = _1363;
    }
    float _1365 = _1345;
    if (!_86)
    {
        float _1367 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1357);
        _1361 = _1367;
    }
    float _1369 = _1361;
    float _1371 = fma(_1365, 0.2125999927520751953125, _1359);
    float _1373 = fma(_1369, 0.072200000286102294921875, _1371);
    float _1375 = 1.0 / _1373;
    float _1377 = _1375 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1379 = precise::clamp(_1377, 0.0, 1.0);
    float _1381 = fma(_1379, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1383 = _1381 * _1365;
    float _1385 = _1381 * _1349;
    float _1387 = _1381 * _1369;
    out.m_36.x = _1383;
    out.m_36.y = _1385;
    out.m_36.z = _1387;
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
    bool _260 = false;
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
    float _218 = -_216;
    float _220 = precise::max(0.0, _218);
    float _222 = abs(_220);
    float _224 = -_222;
    float _226 = _224 + 1.0;
    float _228 = fma(_220, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _230 = as_type<int>(_226) + (-218103808);
    float _232 = fma(_220, _228, -0.212114393711090087890625);
    bool _234 = uint(_230) >= 1920991232u;
    float _236 = fma(_220, _232, 1.570728778839111328125);
    bool _238 = !_234;
    float _258;
    if (!_238)
    {
        int _240 = 0;
        int _242 = as_type<int>(_226);
        int _244 = 0;
        int _246 = 1200;
        int _248;
        int _250;
        int _252;
        int _254;
        int _256;
        _42(_240, _242, _244, _246, _248, _250, _252, _254, _256);
        _258 = as_type<float>(_248);
        _260 = true;
    }
    else
    {
        float _262 = rsqrt(_226);
        float _264 = _226 * _262;
        float _266 = _262 * 0.5;
        float _268 = -_264;
        float _270 = 0.0 + _268;
        float _272 = fma(_266, _270, 0.5);
        float _274 = fma(_264, _272, _264);
        float _276 = -_274;
        float _278 = 0.0 + _276;
        float _280 = fma(_274, _278, _226);
        float _282 = fma(_266, _280, _274);
        _258 = _282;
    }
    _260 = false;
    float _284 = _258;
    bool _286 = _216 > 0.0;
    if (_286)
    {
        discard_fragment();
    }
    if (_286)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float _288 = -_118;
    float _290 = _288 + 1.0;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = -_118;
    float _296 = fma(_294, _118, 1.0);
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = _116 * _116;
    int _302 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _304 = _302 != 0;
    float _306 = _114 * _114;
    float _308 = _214 * _206;
    float _310 = _236 * _284;
    float _312 = _214 * _208;
    float _314 = _300 + _306;
    float _316 = _310 * 0.636619746685028076171875;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    float _320 = rsqrt(_314);
    float _322 = -_318;
    float _324 = _322 + 1.0;
    float _326 = _292;
    if (_304)
    {
        float _328 = sqrt(_298);
        _326 = _328;
    }
    float _330 = _326;
    float _332 = sqrt(_324);
    float _334 = _116 * _320;
    float _336 = _114 * _320;
    float _338 = abs(_334);
    float _340 = abs(_336);
    float _342 = precise::max(_338, _340);
    float _344 = abs(_330);
    float _346 = log2(_344);
    float _348 = precise::max(_342, 9.9999997473787516355514526367188e-05);
    float _350 = -_332;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _348;
    float _356 = _352 * 0.5;
    float _358 = _346 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _360 = _308 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _362 = -_360;
    float _364 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[11].y, _362);
    float _366 = exp2(_358);
    float _368 = -_312;
    float _370 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[11].z, _364);
    float _372 = fma(_370, -0.5, 0.5);
    float _374 = fma(_370, 0.5, 0.5);
    float _376 = fma(_374, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _378 = sqrt(_372);
    float _380 = _366 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _382 = fma(_374, _376, -0.212114393711090087890625);
    float _384 = -_354;
    float _386 = _334 * _384;
    float _388 = fma(_216, -0.5, 0.5);
    float _390 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = fma(_374, _382, 1.570728778839111328125);
    float _396 = fma(_386, _356, 0.5);
    float _398 = -_392;
    float _400 = _398 + 1.0;
    float _402 = abs(_400);
    float _404 = log2(_402);
    float _406 = _378 * 0.636619746685028076171875;
    float _408 = -_394;
    float _410 = fma(_406, _408, 1.0);
    float _412 = _336 * _354;
    float _414 = _216 + 1.0;
    float _416 = fma(_412, _356, 0.5);
    float _418 = _404 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float2 _1915;
    _1915.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_396, _416));
    _1915.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_396, _416));
    float _420 = _1915.x;
    float _422 = _420 * 256.0;
    int _424 = int(_422);
    float _426 = exp2(_418);
    float _428 = -_216;
    float _430 = fma(_426, _414, _428);
    float _432 = fma(_430, 0.5, 0.5);
    float2 _1935 = float2(_410, _388);
    float3 _436 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1935, float2(0.0), isnan(_1935))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1935, float2(0.0), isnan(_1935))).xyz;
    float _438 = _436.x;
    float _440 = _436.y;
    float _442 = _436.z;
    float2 _1951 = float2(_410, _432);
    float3 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1951, float2(0.0), isnan(_1951))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1951, float2(0.0), isnan(_1951))).xyz;
    float _446 = _444.x;
    float _448 = _444.y;
    float _450 = _444.z;
    float _452 = _114 * _118;
    float _454 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _456 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _458 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _460 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _462 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _464 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _466 = fma(_118, _458, _454);
    float _468 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _470 = fma(_118, _460, _456);
    float _472 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _474 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _476 = fma(_118, _468, _462);
    float _478 = -_116;
    float _480 = fma(_478, _464, _470);
    float _482 = fma(_116, _464, _470);
    float _484 = -_116;
    float _486 = fma(_484, _474, _466);
    float _488 = -_116;
    float _490 = fma(_488, _472, _476);
    float _492 = fma(_116, _472, _476);
    float _494 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _496 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _498 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _500 = fma(_116, _474, _466);
    float _502 = -_114;
    float _504 = fma(_502, _494, _480);
    float _506 = -_114;
    float _508 = fma(_506, _496, _486);
    float _510 = fma(_114, _494, _482);
    float _512 = -_114;
    float _514 = fma(_512, _498, _490);
    float _516 = fma(_114, _498, _492);
    float _518 = -_118;
    float _520 = _114 * _518;
    float _522 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _524 = fma(_114, _496, _500);
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _528 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _530 = fma(_522, _520, _504);
    float _532 = fma(_522, _452, _510);
    float _534 = fma(_526, _520, _508);
    float _536 = fma(_526, _452, _524);
    float _538 = fma(_528, _520, _514);
    float _540 = -_116;
    float _542 = _118 * _540;
    float _544 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _546 = _118 * _116;
    float _548 = fma(_528, _452, _516);
    float _550 = fma(_544, _542, _534);
    float _552 = fma(_544, _546, _536);
    float _554 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _556 = fma(_554, _542, _530);
    float _558 = fma(_554, _546, _532);
    float _560 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _562 = fma(_560, _546, _548);
    float _564 = fma(_560, _542, _538);
    float _566 = float(uint(_424));
    float _568 = _566 * 0.00390625;
    float2 _2168 = float2(_396, _416);
    float2 _572 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2168, float2(0.0), isnan(_2168)), level(_568)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2168, float2(0.0), isnan(_2168)), level(_568)).xy;
    float _574 = _572.x;
    float _576 = _572.y;
    float2 _2181 = float2(_396, _416);
    float4 _579 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2181, float2(0.0), isnan(_2181)), level(_568)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2181, float2(0.0), isnan(_2181)), level(_568)).xyzw;
    float _581 = _579.x;
    float _583 = _579.y;
    float _585 = _579.z;
    float _587 = _579.w;
    float _589 = _114 * _116;
    float _591 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _593 = -_118;
    float _595 = fma(_593, _118, _306);
    int _597 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _599 = _597 != 0;
    float _601 = fma(_591, _589, _550);
    float _603 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _605 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _607 = fma(_591, _589, _552);
    float _609 = fma(_603, _589, _556);
    float _611 = fma(_605, _589, _564);
    float _613 = fma(_605, _589, _562);
    float _615 = _116 * (-3.0);
    float _617 = fma(_603, _589, _558);
    float _619 = fma(_300, 3.0, -1.0);
    float _621 = -_116;
    float _623 = fma(_621, _615, -1.0);
    float _625 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _627 = fma(_625, _623, _601);
    float _629 = fma(_625, _619, _607);
    float _631 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _633 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _635 = fma(_631, _623, _609);
    float _637 = fma(_631, _619, _617);
    float _639 = fma(_633, _623, _611);
    float _641 = fma(_633, _619, _613);
    float _643 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _645 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _647 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _649 = fma(_643, _595, _627);
    float _651 = fma(_643, _595, _629);
    float _653 = fma(_645, _595, _635);
    float _655 = fma(_645, _595, _637);
    float _657 = fma(_647, _595, _639);
    float _659 = fma(_647, _595, _641);
    float _661 = _576 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _663 = !_599;
    int _665 = as_type<int>(_655);
    int _667 = _599 ? (-1) : 0;
    int _681;
    int _683;
    int _685;
    int _687;
    int _689;
    int _691;
    if (!_663)
    {
        float _669 = _508 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _671 = _504 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _673 = _514 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _675 = _524 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _677 = _510 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _679 = _516 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _681 = as_type<int>(_675);
        _683 = as_type<int>(_677);
        _685 = as_type<int>(_669);
        _687 = as_type<int>(_671);
        _689 = as_type<int>(_679);
        _691 = as_type<int>(_673);
        _693 = true;
    }
    else
    {
        int _695 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _697 = _695 != 0;
        float _699 = _649 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _701 = _653 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _703 = _657 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _705 = _651 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _707 = _655 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _709 = _659 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _711 = as_type<int>(_699);
        int _713 = as_type<int>(_701);
        int _715 = as_type<int>(_703);
        int _717 = as_type<int>(_707);
        _667 = _697 ? (-1) : 0;
        _689 = as_type<int>(_709);
        if (_697)
        {
            float _719 = _454 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _711 = as_type<int>(_719);
        }
        int _721 = _711;
        _685 = _721;
        if (_697)
        {
            float _723 = _456 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _713 = as_type<int>(_723);
        }
        int _725 = _713;
        _687 = _725;
        if (_697)
        {
            float _727 = _462 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _715 = as_type<int>(_727);
        }
        int _729 = _715;
        _691 = _729;
        if (!_697)
        {
            _665 = as_type<int>(_705);
        }
        int _731 = _665;
        int _733 = _731;
        if (_697)
        {
            _733 = _721;
        }
        int _735 = _733;
        _681 = _735;
        if (_697)
        {
            _717 = _725;
        }
        int _737 = _717;
        _683 = _737;
        if (_697)
        {
            _689 = _729;
        }
    }
    _693 = false;
    int _739 = _667;
    int _741 = _681;
    int _743 = _683;
    int _745 = _685;
    int _747 = _687;
    int _749 = _689;
    int _751 = _691;
    float _753 = _404 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    int _755 = 0;
    int _757 = _739;
    if (!_86)
    {
        int _759 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _761 = _759 != 0;
        _755 = _761 ? (-1) : 0;
    }
    int _763 = _755;
    float _765 = _587 * _587;
    if (_86)
    {
        _757 = -1;
    }
    int _767 = _757;
    int _769 = _767;
    if (!_86)
    {
        int _771 = ~_763;
        bool _773 = !_90;
        int _775 = _771 & (_773 ? (-1) : 0);
        _769 = _775;
    }
    int _777 = _769;
    float _779 = exp2(_753);
    bool _781 = _92 != 0;
    float _783 = _765 * _765;
    float _785 = _783 * 16.0;
    float _787 = _583 * _785;
    float _789 = _581 * _785;
    int _791 = _777;
    int _793 = as_type<int>(_789);
    if (_82)
    {
        _791 = -1;
    }
    int _795 = _791;
    float _797 = -_779;
    float _799 = _797 + 1.0;
    int _801 = _795;
    if (!_82)
    {
        bool _803 = !_90;
        bool _805 = _803 && _78;
        bool _807 = !_781;
        bool _809 = _805 && _807;
        _801 = _809 ? (-1) : 0;
    }
    int _811 = _801;
    int _813 = ~_777;
    float _815 = (_813 != 0) ? as_type<float>(_741) : 0.0;
    float _817 = _585 * _785;
    float _819 = _799 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _821 = ~_777;
    float _823 = (_821 != 0) ? as_type<float>(_743) : 0.0;
    float _825 = -_819;
    float _827 = _825 + 1.0;
    float _829 = abs(_827);
    float _831 = log2(_829);
    int _833 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _835 = _833 != 0;
    int _837 = ~_811;
    float _839 = (_837 != 0) ? as_type<float>(_745) : 0.0;
    int _841 = ~_811;
    float _843 = (_841 != 0) ? as_type<float>(_747) : 0.0;
    bool _845 = !_90;
    bool _847 = _78 && _845;
    bool _849 = !_835;
    float _851 = _849 ? _574 : 0.0;
    float _853 = _831 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _855 = _831 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    int _857 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _859 = _857 != 0;
    float _861 = _851 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _863 = exp2(_853);
    float _865 = _851 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _867 = ~_777;
    float _869 = (_867 != 0) ? as_type<float>(_749) : 0.0;
    bool _871 = !_859;
    bool _873 = !_847;
    float _875 = _873 ? _861 : 0.0;
    bool _877 = !_859;
    float _879 = exp2(_855);
    bool _881 = !_871;
    float _883 = _881 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _885 = _875 * _869;
    bool _887 = !_859;
    float _889 = _875 * _815;
    int _891 = ~_811;
    float _893 = (_891 != 0) ? as_type<float>(_751) : 0.0;
    float _895 = _875 * _823;
    bool _897 = !_847;
    float _899 = _897 ? _865 : 0.0;
    int _901 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _903 = _901 != 0;
    bool _905 = !_877;
    float _907 = _905 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _909 = !_887;
    float _911 = _909 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _913 = fma(_893, _899, _885);
    float _915 = fma(_839, _899, _889);
    float _917 = fma(_843, _899, _895);
    float _919 = _911 * _913;
    bool _921 = !_74;
    float _923 = _921 ? _863 : 1.0;
    float _925 = _883 * _915;
    bool _927 = !_903;
    float _929 = _907 * _917;
    bool _931 = !_903;
    float _933 = _923 * _925;
    float _935 = _927 ? _817 : 0.0;
    float _937 = _923 * _851;
    bool _939 = !_903;
    float _941 = _923 * _929;
    bool _943 = !_74;
    float _945 = _943 ? _879 : 1.0;
    float _947 = _931 ? _789 : 0.0;
    float _949 = _945 * _935;
    float _951 = _937;
    float _953 = _923;
    if (_74)
    {
        _793 = as_type<int>(_661);
    }
    int _955 = _793;
    float _957 = _945 * _947;
    float _959 = _939 ? _787 : 0.0;
    float _961 = _78 ? _937 : _933;
    float _963 = _78 ? _937 : _941;
    int _965 = _955;
    int _967 = _955;
    if (!_78)
    {
        float _969 = _923 * _919;
        _951 = _969;
    }
    float _971 = _951;
    float _973 = _945 * _959;
    float _975 = _971 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _977 = _961 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _979 = _963 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _981 = _977;
    float _983 = _973;
    if (_74)
    {
        _953 = 0.0;
    }
    float _985 = _953;
    float _987 = fma(_949, (*spvDescriptorSet0.fp_c3)._m0[27].z, _975);
    float _989 = fma(_957, (*spvDescriptorSet0.fp_c3)._m0[27].x, _977);
    float _991 = fma(_973, (*spvDescriptorSet0.fp_c3)._m0[27].y, _979);
    float _993 = _991;
    float _995 = _989;
    float _997 = _985;
    float _999 = _987;
    if (_74)
    {
        _981 = 0.0;
    }
    float _1001 = _981;
    float _1003 = _1001;
    if (_74)
    {
        _983 = 0.0;
    }
    float _1005 = _983;
    bool _1007 = !_74;
    float _1009 = _1007 ? _819 : 0.0;
    float _1011 = _1005;
    if (!_74)
    {
        int _1013 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1015 = _1013 != 0;
        float _1017 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1019 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1021 = _1019 != 0;
        float _1023 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1025 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1027 = !_1021;
        float _1029 = _1027 ? _1023 : 0.0;
        bool _1031 = !_1021;
        float _1033 = _1031 ? _1017 : 0.0;
        bool _1035 = !_1021;
        float _1037 = _1035 ? _1025 : 0.0;
        float _1039 = _1009 * _1029;
        _997 = _1039;
        if (!_1015)
        {
            _965 = as_type<int>(_661);
        }
        int _1041 = _965;
        float _1043 = _1009 * _1033;
        float _1045 = _1009 * _1037;
        bool _1047 = !_1015;
        _1003 = _1043;
        _967 = _1041;
        _1011 = _1045;
        if (!_1047)
        {
            float _1049 = -_1009;
            float _1051 = _1049 + 1.0;
            float _1053 = precise::clamp(_1051, 0.0, 1.0);
            float _1055 = _661 * _1053;
            float _1057 = precise::max(_1055, 9.9999997473787516355514526367188e-05);
            float _1059 = 1.0 / _1057;
            float _1061 = _661 * _1059;
            float _1063 = _989 * _1061;
            float _1065 = _991 * _1061;
            float _1067 = _987 * _1061;
            _993 = _1065;
            _1003 = 0.0;
            _995 = _1063;
            _997 = 0.0;
            _967 = as_type<int>(_1055);
            _999 = _1067;
            _1011 = 0.0;
        }
    }
    float _1069 = _993;
    float _1071 = _1003;
    float _1073 = _995;
    float _1075 = _997;
    int _1077 = _967;
    float _1079 = _999;
    float _1081 = _1011;
    int _1083 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1085 = _1083 != 0;
    int _1087 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1089 = _1087 != 0;
    float _1091 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1093 = _438 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1095 = _1069 + _1071;
    float _1097 = _1073 + _1075;
    bool _1099 = !_1089;
    float _1101 = _1099 ? as_type<float>(_1077) : 1.0;
    float _1103 = _442 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1105 = _1079 + _1081;
    float _1107 = -_1101;
    float _1109 = _1107 + 1.0;
    float _1111 = abs(_1109);
    float _1113 = log2(_1111);
    float _1115 = _1113 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1117 = exp2(_1115);
    float _1119 = -_1117;
    float _1121 = spvFAdd(_1119, 1.00010001659393310546875);
    float _1123 = -_1117;
    float _1125 = _1123 + 1.0;
    float _1127 = -_1101;
    float _1129 = _1127 + _1125;
    float _1131 = 1.0 / _1121;
    float _1133 = _1129 * _1091;
    float _1135 = _1129 * _1093;
    float _1137 = _1129 * _1103;
    float _1139 = fma(_1095, _1101, _1133);
    float _1141 = fma(_1097, _1101, _1135);
    float _1143 = fma(_1105, _1101, _1137);
    float _1145 = _1131 * _1139;
    float _1147 = _1131 * _1141;
    float _1149 = _1131 * _1143;
    float _1151 = _1145 * 0.715200006961822509765625;
    float _1153 = fma(_1147, 0.2125999927520751953125, _1151);
    float _1155 = fma(_1149, 0.072200000286102294921875, _1153);
    float _1157 = 1.0 / _1155;
    float _1159 = _1157 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1161 = precise::clamp(_1159, 0.0, 1.0);
    float _1163 = fma(_1161, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1165 = _1147 * _1163;
    float _1167 = _1145 * _1163;
    float _1169 = _1149 * _1163;
    bool _1171 = !_1085;
    float _1173 = _1165;
    float _1175 = _1169;
    float _1177 = _1167;
    int _1179 = as_type<int>(_1117);
    int _1181 = as_type<int>(_1165);
    int _1183 = as_type<int>(_1167);
    float _1185 = _1169;
    if (!_1171)
    {
        bool _1187 = _1125 != 1.0;
        bool _1189 = isnan(_1125);
        bool _1191 = _1187 || _1189;
        bool _1193 = isnan(1.0);
        bool _1195 = _1191 || _1193;
        float _1197 = -_1117;
        bool _1199 = _1197 != (-1.0);
        bool _1201 = isnan(_1197);
        bool _1203 = _1199 || _1201;
        bool _1205 = isnan(-1.0);
        bool _1207 = _1203 || _1205;
        float _1209 = -_1117;
        bool _1211 = _1209 == (-1.0);
        bool _1213 = !_1195;
        bool _1215 = _1211 || _1213;
        bool _1217 = _1125 == 1.0;
        bool _1219 = _1217 && _1207;
        bool _1221 = !_1215;
        float _1223 = _1221 ? _1125 : 0.0;
        bool _1225 = !_1219;
        float _1227 = _1225 ? 0.0 : 1.0;
        float _1229 = _1215 ? 0.0 : 0.5;
        float _1231 = _1223 * 0.715200006961822509765625;
        float _1233 = fma(_1227, 0.2125999927520751953125, _1231);
        float _1235 = fma(_1229, 0.072200000286102294921875, _1233);
        float _1237 = 1.0 / _1235;
        float _1239 = _1237 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1241 = precise::clamp(_1239, 0.0, 1.0);
        float _1243 = fma(_1241, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1245 = _1227 * _1243;
        float _1247 = _1223 * _1243;
        float _1249 = _1229 * _1243;
        out.m_36.x = _1245;
        out.m_36.y = _1247;
        out.m_36.z = _1249;
        out.m_36.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    bool _1251 = _92 != 0;
    bool _1253 = !_1251;
    if (!_1253)
    {
        if (_82)
        {
            _1173 = 0.0;
        }
        float _1255 = _1173;
        float _1257 = _1255;
        if (_82)
        {
            _1175 = 0.0;
        }
        float _1259 = _1175;
        float _1261 = _1259;
        if (!_82)
        {
            float _1263 = _843 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1261 = _1263;
        }
        float _1265 = _1261;
        float _1267 = _1265;
        if (!_82)
        {
            float _1269 = _839 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1257 = _1269;
        }
        float _1271 = _1257;
        float _1273 = _1271;
        if (!_86)
        {
            float _1275 = fma(_823, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1265);
            _1267 = _1275;
        }
        float _1277 = _1267;
        if (_82)
        {
            _1177 = 0.0;
        }
        float _1279 = _1177;
        float _1281 = _1279;
        if (!_82)
        {
            float _1283 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1281 = _1283;
        }
        float _1285 = _1281;
        float _1287 = _1277 * 0.715200006961822509765625;
        float _1289 = _1285;
        if (!_86)
        {
            float _1291 = fma(_815, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1271);
            _1273 = _1291;
        }
        float _1293 = _1273;
        if (!_86)
        {
            float _1295 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1285);
            _1289 = _1295;
        }
        float _1297 = _1289;
        float _1299 = fma(_1293, 0.2125999927520751953125, _1287);
        float _1301 = fma(_1297, 0.072200000286102294921875, _1299);
        float _1303 = 1.0 / _1301;
        float _1305 = _1303 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1307 = precise::clamp(_1305, 0.0, 1.0);
        float _1309 = fma(_1307, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1311 = _1309 * _1293;
        float _1313 = _1309 * _1277;
        float _1315 = _1309 * _1297;
        out.m_36.x = _1311;
        out.m_36.y = _1313;
        out.m_36.z = _1315;
        out.m_36.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    if (!_90)
    {
        _1179 = as_type<int>(_1165);
    }
    int _1317 = _1179;
    if (!_90)
    {
        _1181 = as_type<int>(_1167);
    }
    int _1319 = _1181;
    float _1321 = as_type<float>(_1319);
    if (!_90)
    {
        _1183 = as_type<int>(_1125);
    }
    int _1323 = _1183;
    float _1325 = as_type<float>(_1323);
    if (!_90)
    {
        out.m_36.x = as_type<float>(_1317);
        out.m_36.y = as_type<float>(_1319);
        out.m_36.z = _1169;
        out.m_36.w = as_type<float>(_1323);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    if (_82)
    {
        _1321 = 0.0;
    }
    float _1327 = _1321;
    float _1329 = _1327;
    if (_82)
    {
        _1185 = 0.0;
    }
    float _1331 = _1185;
    float _1333 = _1331;
    if (!_82)
    {
        float _1335 = _843 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1333 = _1335;
    }
    float _1337 = _1333;
    float _1339 = _1337;
    if (!_82)
    {
        float _1341 = _839 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1329 = _1341;
    }
    float _1343 = _1329;
    float _1345 = _1343;
    if (!_86)
    {
        float _1347 = fma(_823, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1337);
        _1339 = _1347;
    }
    float _1349 = _1339;
    if (_82)
    {
        _1325 = 0.0;
    }
    float _1351 = _1325;
    float _1353 = _1351;
    if (!_82)
    {
        float _1355 = _893 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1353 = _1355;
    }
    float _1357 = _1353;
    float _1359 = _1349 * 0.715200006961822509765625;
    float _1361 = _1357;
    if (!_86)
    {
        float _1363 = fma(_815, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1343);
        _1345 = _1363;
    }
    float _1365 = _1345;
    if (!_86)
    {
        float _1367 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1357);
        _1361 = _1367;
    }
    float _1369 = _1361;
    float _1371 = fma(_1365, 0.2125999927520751953125, _1359);
    float _1373 = fma(_1369, 0.072200000286102294921875, _1371);
    float _1375 = 1.0 / _1373;
    float _1377 = _1375 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1379 = precise::clamp(_1377, 0.0, 1.0);
    float _1381 = fma(_1379, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1383 = _1381 * _1365;
    float _1385 = _1381 * _1349;
    float _1387 = _1381 * _1369;
    out.m_36.x = _1383;
    out.m_36.y = _1385;
    out.m_36.z = _1387;
    out.m_36.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

