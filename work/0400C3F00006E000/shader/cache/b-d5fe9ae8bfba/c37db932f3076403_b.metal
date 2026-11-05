#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _3752, thread const int& _3753, constant _10& support_buffer)
{
    int _3756 = 1 + _3753;
    float _3758 = support_buffer._m5[_3756].x;
    bool _3760 = _3758 == 1.0;
    if (_3760)
    {
        return _3752;
    }
    float _3762 = float(_3752);
    float _3764 = _3762 * _3758;
    int _3766 = int(_3764);
    return _3766;
}

static inline __attribute__((always_inline))
void _56(thread const int& _3440, thread const int& _3441, thread const int& _3442, thread const int& _3443, thread int& _3444, thread int& _3445, thread int& _3446, thread int& _3447, thread int& _3448, thread int& _3449)
{
    float _3452 = as_type<float>(_3441) + 0.0;
    bool _3454 = _3452 != 0.0;
    bool _3456 = isnan(_3452);
    bool _3458 = _3454 || _3456;
    bool _3460 = isnan(0.0);
    bool _3462 = _3458 || _3460;
    int _3464 = as_type<int>(_3452);
    int _3466 = _3441;
    int _3468 = _3443;
    int _3470 = _3462 ? (-1) : 0;
    if (!_3462)
    {
        float _3472 = as_type<float>(_3441) * 1.0;
        _3464 = as_type<int>(_3472);
    }
    int _3474 = _3464;
    bool _3476 = !_3462;
    int _3478 = _3474;
    if (!_3476)
    {
        float _3480 = as_type<float>(_3441) + 0.0;
        bool _3482 = _3480 >= 0.0;
        bool _3484 = isnan(_3480);
        bool _3486 = _3482 || _3484;
        bool _3488 = isnan(0.0);
        bool _3490 = _3486 || _3488;
        int _3492 = as_type<int>(_3480);
        _3470 = _3490 ? (-1) : 0;
        if (!_3490)
        {
            _3492 = 2147483647;
        }
        int _3494 = _3492;
        bool _3496 = !_3490;
        _3478 = _3494;
        if (!_3496)
        {
            float _3498 = as_type<float>(_3441) + 0.0;
            bool _3500 = _3498 > as_type<float>(0x7f800000u /* inf */);
            bool _3502 = isnan(_3498);
            bool _3504 = _3500 || _3502;
            bool _3506 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3508 = _3504 || _3506;
            int _3510 = as_type<int>(_3498);
            _3470 = _3508 ? (-1) : 0;
            if (_3508)
            {
                float _3512 = as_type<float>(_3441) + 1.0;
                _3510 = as_type<int>(_3512);
            }
            int _3514 = _3510;
            _3478 = _3514;
            if (!_3508)
            {
                float _3516 = 0.0 + as_type<float>(_3441);
                bool _3518 = _3516 != as_type<float>(0x7f800000u /* inf */);
                bool _3520 = isnan(_3516);
                bool _3522 = _3518 || _3520;
                bool _3524 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3526 = _3522 || _3524;
                int _3528 = as_type<int>(_3516);
                _3470 = _3526 ? (-1) : 0;
                if (!_3526)
                {
                    _3528 = _3441;
                }
                int _3530 = _3528;
                bool _3532 = !_3526;
                _3478 = _3530;
                if (!_3532)
                {
                    float _3534 = as_type<float>(_3441) * 18446744073709551616.0;
                    float _3536 = rsqrt(_3534);
                    float _3538 = _3534 * _3536;
                    float _3540 = _3536 * 0.5;
                    float _3542 = -_3538;
                    float _3544 = 0.0 + _3542;
                    float _3546 = fma(_3540, _3544, 0.5);
                    float _3548 = fma(_3538, _3546, _3538);
                    float _3550 = -_3548;
                    float _3552 = 0.0 + _3550;
                    float _3554 = fma(_3548, _3552, _3534);
                    float _3556 = fma(_3540, _3554, _3548);
                    float _3558 = _3556 * 2.3283064365386962890625e-10;
                    _3478 = as_type<int>(_3558);
                    _3466 = as_type<int>(_3534);
                    _3468 = as_type<int>(_3548);
                }
            }
        }
    }
    int _3560 = _3478;
    int _3562 = _3466;
    int _3564 = _3468;
    int _3566 = _3470;
    _3444 = _3560;
    _3445 = _3442;
    _3446 = 0;
    _3447 = _3562;
    _3448 = _3564;
    _3449 = _3566;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _890 = false;
    bool _266 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.cp_c5)._m0[int(_79)][_81];
    int _85 = _74 + 8;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.cp_c5)._m0[int(_89)][_91];
    int _95 = _68;
    int _97 = 0;
    int _99 = _58(_95, _97, (*spvDescriptorSet0.support_buffer));
    int _101 = as_type<int>(_83);
    int _103 = 0;
    int _105 = _58(_101, _103, (*spvDescriptorSet0.support_buffer));
    int3 _1418 = int3(_99, _105, 1);
    float4 _108 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1418.xy), uint(_1418.z), 0).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    int _118 = _68;
    int _120 = 1;
    int _122 = _58(_118, _120, (*spvDescriptorSet0.support_buffer));
    int _124 = as_type<int>(_93);
    int _126 = 1;
    int _128 = _58(_124, _126, (*spvDescriptorSet0.support_buffer));
    int3 _1438 = int3(_122, _128, 1);
    float4 _130 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1438.xy), uint(_1438.z), 0).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    int _140 = _68;
    int _142 = 0;
    int _144 = _58(_140, _142, (*spvDescriptorSet0.support_buffer));
    int _146 = as_type<int>(_83);
    int _148 = 0;
    int _150 = _58(_146, _148, (*spvDescriptorSet0.support_buffer));
    int3 _1458 = int3(_144, _150, 0);
    float3 _154 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1458.xy), uint(_1458.z), 0).xyz;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    int _162 = _68;
    int _164 = 0;
    int _166 = _58(_162, _164, (*spvDescriptorSet0.support_buffer));
    int _168 = as_type<int>(_83);
    int _170 = 0;
    int _172 = _58(_168, _170, (*spvDescriptorSet0.support_buffer));
    int3 _1476 = int3(_166, _172, 2);
    float3 _174 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1476.xy), uint(_1476.z), 0).xyz;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float _182 = _112 * _134;
    float _184 = fma(_110, _132, _182);
    float _186 = fma(_114, _136, _184);
    float _188 = fma(_116, _138, _186);
    float _190 = precise::max(_188, -1.0);
    float _192 = precise::min(_190, 1.0);
    bool _194 = _192 >= 0.0;
    bool _196 = isnan(_192);
    bool _198 = _194 || _196;
    bool _200 = isnan(0.0);
    bool _202 = _198 || _200;
    bool _204 = !_202;
    float _206 = -_192;
    float _208 = _204 ? _206 : _192;
    float _210 = abs(_208);
    float _212 = -_210;
    float _214 = _212 + 1.0;
    float _216 = abs(_208);
    float _218 = fma(_216, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _220 = as_type<int>(_214) + (-218103808);
    float _222 = abs(_208);
    float _224 = fma(_222, _218, -0.212114393711090087890625);
    bool _226 = uint(_220) >= 1920991232u;
    float _228 = abs(_208);
    float _230 = fma(_228, _224, 1.570728778839111328125);
    bool _232 = _208 < 0.0;
    float _234 = float(_232);
    bool _236 = !_226;
    float _238 = _178;
    float _240 = _176;
    float _262;
    float _264;
    if (!_236)
    {
        int _242 = as_type<int>(_208);
        int _244 = as_type<int>(_214);
        int _246 = 640;
        int _248 = 0;
        int _250;
        int _252;
        int _254;
        int _256;
        int _258;
        int _260;
        _56(_242, _244, _246, _248, _250, _252, _254, _256, _258, _260);
        _262 = as_type<float>(_250);
        _264 = as_type<float>(_252);
        _266 = true;
    }
    else
    {
        float _268 = rsqrt(_214);
        float _270 = _214 * _268;
        float _272 = _268 * 0.5;
        float _274 = -_270;
        float _276 = 0.0 + _274;
        float _278 = fma(_272, _276, 0.5);
        float _280 = fma(_270, _278, _270);
        float _282 = -_280;
        float _284 = 0.0 + _282;
        float _286 = fma(_280, _284, _214);
        float _288 = fma(_272, _286, _280);
        _262 = _288;
        _264 = _276;
    }
    _266 = false;
    float _290 = _262;
    float _292 = _264;
    int _294 = _74 + 8;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.cp_c5)._m0[int(_298)][_300];
    int _304 = _68;
    int _306 = 1;
    int _308 = _58(_304, _306, (*spvDescriptorSet0.support_buffer));
    int _310 = as_type<int>(_302);
    int _312 = 1;
    int _314 = _58(_310, _312, (*spvDescriptorSet0.support_buffer));
    int3 _1644 = int3(_308, _314, 0);
    float3 _316 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1644.xy), uint(_1644.z), 0).xyz;
    float _318 = _316.x;
    float _320 = _316.y;
    float _322 = _316.z;
    int _324 = _68;
    int _326 = 1;
    int _328 = _58(_324, _326, (*spvDescriptorSet0.support_buffer));
    int _330 = as_type<int>(_302);
    int _332 = 1;
    int _334 = _58(_330, _332, (*spvDescriptorSet0.support_buffer));
    int3 _1662 = int3(_328, _334, 2);
    float3 _336 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1662.xy), uint(_1662.z), 0).xyz;
    float _338 = _336.x;
    float _340 = _336.y;
    float _342 = _336.z;
    float _344 = _230 * _290;
    float _346 = _234 * 2.0;
    float _348 = -_346;
    float _350 = fma(_344, _348, _344);
    float _352 = fma(_234, 3.1415927410125732421875, _350);
    float _354 = _352 * 0.15915493667125701904296875;
    float _356 = _354 * 6.283185482025146484375;
    float _358 = sin(_356);
    float _360 = abs(_358);
    bool _362 = _360 >= 0.001000000047497451305389404296875;
    bool _364 = isnan(_360);
    bool _366 = _362 || _364;
    bool _368 = isnan(0.001000000047497451305389404296875);
    bool _370 = _366 || _368;
    float _372 = 0.0;
    float _374 = _292;
    float _376 = _344;
    if (!_370)
    {
        int _378 = _74 + 28;
        uint _380 = uint(int(uint(_378) >> uint(2)));
        uint _382 = uint(int(uint(int(_380)) >> uint(2)));
        int _384 = int(_380) & 3;
        float _386 = (*spvDescriptorSet0.cp_c5)._m0[int(_382)][_384];
        _372 = _386;
    }
    float _388 = _372;
    float _390 = _388;
    if (!_370)
    {
        float _392 = -_388;
        float _394 = _392 + 1.0;
        _374 = _394;
    }
    float _396 = _374;
    float _398 = _396;
    if (!_370)
    {
        _376 = _388;
    }
    float _400 = _376;
    bool _402 = !_370;
    float _404 = _400;
    if (!_402)
    {
        int _406 = _74 + 28;
        uint _408 = uint(int(uint(_406) >> uint(2)));
        uint _410 = uint(int(uint(int(_408)) >> uint(2)));
        int _412 = int(_408) & 3;
        float _414 = (*spvDescriptorSet0.cp_c5)._m0[int(_410)][_412];
        float _416 = 1.0 / _358;
        float _418 = _352 * _414;
        float _420 = _418 * 0.15915493667125701904296875;
        float _422 = -_418;
        float _424 = _352 + _422;
        float _426 = _424 * 0.15915493667125701904296875;
        float _428 = _420 * 6.283185482025146484375;
        float _430 = sin(_428);
        float _432 = _426 * 6.283185482025146484375;
        float _434 = sin(_432);
        float _436 = _430 * _416;
        float _438 = _434 * _416;
        _404 = _436;
        _390 = _414;
        _398 = _438;
    }
    float _440 = _404;
    float _442 = _390;
    float _444 = _398;
    bool _446 = !_202;
    float _448 = -_440;
    float _450 = _446 ? _448 : _440;
    float _452 = _322 * _442;
    float _454 = _342 * _442;
    bool _456 = _68 != 0;
    float _458 = _138 * _450;
    float _460 = _132 * _450;
    int _462 = _74 + 20;
    uint _464 = uint(int(uint(_462) >> uint(2)));
    uint _466 = uint(int(uint(int(_464)) >> uint(2)));
    int _468 = int(_464) & 3;
    float _470 = (*spvDescriptorSet0.cp_c5)._m0[int(_466)][_468];
    float _472 = _134 * _450;
    float _474 = _136 * _450;
    float _476 = fma(_116, _444, _458);
    float _478 = fma(_110, _444, _460);
    float _480 = fma(_112, _444, _472);
    float _482 = fma(_114, _444, _474);
    float _484 = _476 * 2.0;
    float _486 = _478 * 2.0;
    float _488 = _480 * 2.0;
    float _490 = _482 * _484;
    float _492 = _480 * _484;
    float _494 = _478 * _484;
    float _496 = _478 * _478;
    float _498 = -_490;
    float _500 = fma(_480, _486, _498);
    float _502 = fma(_480, _486, _490);
    float _504 = _480 * _480;
    float _506 = fma(_482, _486, _492);
    float _508 = -_492;
    float _510 = fma(_482, _486, _508);
    float _512 = -_494;
    float _514 = fma(_482, _488, _512);
    float _516 = fma(_482, _488, _494);
    float _518 = _482 * _482;
    float _520 = _318 * _442;
    float _522 = fma(_504, -2.0, 1.0);
    float _524 = fma(_496, -2.0, 1.0);
    float _526 = _320 * _442;
    float _528 = fma(_156, _470, _520);
    float _530 = fma(_518, -2.0, _522);
    float _532 = fma(_518, -2.0, _524);
    float _534 = fma(_158, _470, _526);
    float _536 = fma(_504, -2.0, _524);
    float _538 = fma(_160, _470, _452);
    float _540 = _502 * _528;
    float _542 = _530 * _528;
    float _544 = _510 * _528;
    float _546 = _532 * _534;
    float _548 = _500 * _534;
    float _550 = _516 * _534;
    float _552 = _338 * _442;
    float _554 = _340 * _442;
    float _556 = _506 * _538;
    float _558 = _514 * _538;
    float _560 = _536 * _538;
    float _562 = fma(_176, _470, _552);
    int _564 = _68 * 48;
    float _566 = fma(_178, _470, _554);
    float _568 = fma(_180, _470, _454);
    int _570 = _68 * 112;
    float _572 = _516;
    float _574 = _554;
    float _576 = _538;
    float _578 = _470;
    float _580 = _510;
    float _582 = _536;
    float _584 = _550;
    float _586 = _544;
    float _588 = _558;
    float _590 = _560;
    if (!_456)
    {
        _238 = _562;
    }
    float _592 = _238;
    uint _594 = uint(int(uint(_564) >> uint(2)));
    _37[int(_594)] = as_type<uint>(_542);
    int _596 = _564 + 4;
    uint _598 = uint(int(uint(_596) >> uint(2)));
    _37[int(_598)] = as_type<uint>(_548);
    int _600 = _564 + 8;
    uint _602 = uint(int(uint(_600) >> uint(2)));
    _37[int(_602)] = as_type<uint>(_556);
    int _604 = _564 + 12;
    uint _606 = uint(int(uint(_604) >> uint(2)));
    _37[int(_606)] = as_type<uint>(_562);
    float _608 = _592;
    if (!_456)
    {
        _572 = _566;
    }
    float _610 = _572;
    float _612 = _610;
    if (!_456)
    {
        _574 = _568;
    }
    float _614 = _574;
    int _616 = _564 + 16;
    uint _618 = uint(int(uint(_616) >> uint(2)));
    _37[int(_618)] = as_type<uint>(_540);
    int _620 = _564 + 20;
    uint _622 = uint(int(uint(_620) >> uint(2)));
    _37[int(_622)] = as_type<uint>(_546);
    int _624 = _564 + 24;
    uint _626 = uint(int(uint(_624) >> uint(2)));
    _37[int(_626)] = as_type<uint>(_558);
    int _628 = _564 + 28;
    uint _630 = uint(int(uint(_628) >> uint(2)));
    _37[int(_630)] = as_type<uint>(_566);
    float _632 = _614;
    if (!_456)
    {
        _576 = _542;
    }
    float _634 = _576;
    float _636 = _634;
    if (!_456)
    {
        _578 = _548;
    }
    float _638 = _578;
    int _640 = _564 + 32;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    _37[int(_642)] = as_type<uint>(_544);
    int _644 = _564 + 36;
    uint _646 = uint(int(uint(_644) >> uint(2)));
    _37[int(_646)] = as_type<uint>(_550);
    int _648 = _564 + 40;
    uint _650 = uint(int(uint(_648) >> uint(2)));
    _37[int(_650)] = as_type<uint>(_560);
    int _652 = _564 + 44;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    _37[int(_654)] = as_type<uint>(_568);
    float _656 = _638;
    if (!_456)
    {
        _580 = _556;
    }
    float _658 = _580;
    float _660 = _658;
    if (!_456)
    {
        _240 = _540;
    }
    float _662 = _240;
    float _664 = _662;
    if (!_456)
    {
        _582 = _546;
    }
    float _666 = _582;
    bool _668 = !_456;
    float _670 = _666;
    if (!_668)
    {
        bool _672 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _674 = !_672;
        if (!_674)
        {
            uint _676 = uint(int(uint(_570) >> uint(2)));
            uint _678 = uint(int(uint(int(_676)) >> uint(2)));
            int _680 = int(_676) & 3;
            float _682 = (*spvDescriptorSet0.cp_c6)._m0[int(_678)][_680];
            int _684 = as_type<int>(_682) * 48;
            int _686 = 0;
            bool _688;
            float _784;
            float _786;
            float _788;
            float _796;
            float _808;
            float _810;
            float _814;
            float _834;
            float _836;
            float _838;
            float _840;
            float _842;
            do
            {
                int _690 = _686;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _692 = uint(int(uint(_684) >> uint(2)));
                float _694 = as_type<float>(_37[int(_692)]);
                int _696 = _684 + 4;
                uint _698 = uint(int(uint(_696) >> uint(2)));
                float _700 = as_type<float>(_37[int(_698)]);
                int _702 = _684 + 8;
                uint _704 = uint(int(uint(_702) >> uint(2)));
                float _706 = as_type<float>(_37[int(_704)]);
                int _708 = _684 + 12;
                uint _710 = uint(int(uint(_708) >> uint(2)));
                float _712 = as_type<float>(_37[int(_710)]);
                int _714 = _690 + 1;
                int _716 = _684 + 16;
                uint _718 = uint(int(uint(_716) >> uint(2)));
                float _720 = as_type<float>(_37[int(_718)]);
                int _722 = _684 + 20;
                uint _724 = uint(int(uint(_722) >> uint(2)));
                float _726 = as_type<float>(_37[int(_724)]);
                int _728 = _684 + 24;
                uint _730 = uint(int(uint(_728) >> uint(2)));
                float _732 = as_type<float>(_37[int(_730)]);
                int _734 = _684 + 28;
                uint _736 = uint(int(uint(_734) >> uint(2)));
                float _738 = as_type<float>(_37[int(_736)]);
                bool _740 = uint(_714) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _742 = _684 + 32;
                uint _744 = uint(int(uint(_742) >> uint(2)));
                float _746 = as_type<float>(_37[int(_744)]);
                int _748 = _684 + 36;
                uint _750 = uint(int(uint(_748) >> uint(2)));
                float _752 = as_type<float>(_37[int(_750)]);
                int _754 = _684 + 40;
                uint _756 = uint(int(uint(_754) >> uint(2)));
                float _758 = as_type<float>(_37[int(_756)]);
                int _760 = _684 + 44;
                uint _762 = uint(int(uint(_760) >> uint(2)));
                float _764 = as_type<float>(_37[int(_762)]);
                float _766 = _566 * _700;
                float _768 = _540 * _700;
                float _770 = _546 * _700;
                float _772 = _558 * _700;
                float _774 = fma(_562, _694, _766);
                float _776 = fma(_542, _694, _768);
                float _778 = fma(_548, _694, _770);
                float _780 = fma(_556, _694, _772);
                float _782 = fma(_568, _706, _774);
                _784 = fma(_544, _706, _776);
                _786 = fma(_550, _706, _778);
                _788 = fma(_560, _706, _780);
                float _790 = _566 * _726;
                float _792 = _540 * _726;
                float _794 = _546 * _726;
                _796 = _712 + _782;
                float _798 = fma(_562, _720, _790);
                float _800 = fma(_542, _720, _792);
                float _802 = fma(_548, _720, _794);
                float _804 = _558 * _726;
                float _806 = fma(_568, _732, _798);
                _808 = fma(_544, _732, _800);
                _810 = fma(_550, _732, _802);
                float _812 = _540 * _752;
                _814 = _738 + _806;
                float _816 = _566 * _752;
                float _818 = _546 * _752;
                float _820 = _558 * _752;
                float _822 = fma(_556, _720, _804);
                float _824 = fma(_562, _746, _816);
                float _826 = fma(_542, _746, _812);
                float _828 = fma(_548, _746, _818);
                float _830 = fma(_556, _746, _820);
                float _832 = fma(_568, _758, _824);
                _834 = fma(_560, _732, _822);
                _836 = fma(_544, _758, _826);
                _838 = fma(_550, _758, _828);
                _840 = fma(_560, _758, _830);
                _842 = _764 + _832;
                uint _844 = uint(int(uint(_564) >> uint(2)));
                _37[int(_844)] = as_type<uint>(_784);
                int _846 = _564 + 4;
                uint _848 = uint(int(uint(_846) >> uint(2)));
                _37[int(_848)] = as_type<uint>(_786);
                int _850 = _564 + 8;
                uint _852 = uint(int(uint(_850) >> uint(2)));
                _37[int(_852)] = as_type<uint>(_788);
                int _854 = _564 + 12;
                uint _856 = uint(int(uint(_854) >> uint(2)));
                _37[int(_856)] = as_type<uint>(_796);
                int _858 = _564 + 16;
                uint _860 = uint(int(uint(_858) >> uint(2)));
                _37[int(_860)] = as_type<uint>(_808);
                int _862 = _564 + 20;
                uint _864 = uint(int(uint(_862) >> uint(2)));
                _37[int(_864)] = as_type<uint>(_810);
                int _866 = _564 + 24;
                uint _868 = uint(int(uint(_866) >> uint(2)));
                _37[int(_868)] = as_type<uint>(_834);
                int _870 = _564 + 28;
                uint _872 = uint(int(uint(_870) >> uint(2)));
                _37[int(_872)] = as_type<uint>(_814);
                int _874 = _564 + 32;
                uint _876 = uint(int(uint(_874) >> uint(2)));
                _37[int(_876)] = as_type<uint>(_836);
                int _878 = _564 + 36;
                uint _880 = uint(int(uint(_878) >> uint(2)));
                _37[int(_880)] = as_type<uint>(_838);
                int _882 = _564 + 40;
                uint _884 = uint(int(uint(_882) >> uint(2)));
                _37[int(_884)] = as_type<uint>(_840);
                int _886 = _564 + 44;
                uint _888 = uint(int(uint(_886) >> uint(2)));
                _37[int(_888)] = as_type<uint>(_842);
                _688 = !_740;
                _686 = _714;
            } while (_688);
            _670 = _810;
            _584 = _838;
            _656 = _786;
            _664 = _808;
            _586 = _836;
            _636 = _784;
            _588 = _834;
            _660 = _788;
            _590 = _840;
            _612 = _814;
            _608 = _796;
            _632 = _842;
            _890 = true;
        }
        else
        {
            _670 = 0.0;
            _584 = 0.0;
            _656 = 0.0;
            _664 = 0.0;
            _586 = 0.0;
            _636 = 0.0;
            _588 = 0.0;
            _660 = 0.0;
            _590 = 0.0;
            _612 = 0.0;
            _608 = 0.0;
            _632 = 0.0;
        }
    }
    _890 = false;
    float _892 = _670;
    float _894 = _584;
    float _896 = _656;
    float _898 = _664;
    float _900 = _586;
    float _902 = _636;
    float _904 = _588;
    float _906 = _660;
    float _908 = _590;
    float _910 = _612;
    float _912 = _608;
    float _914 = _632;
    int _916 = _570 + 80;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    uint _920 = uint(int(uint(int(_918)) >> uint(2)));
    int _922 = int(_918) & 3;
    float _924 = (*spvDescriptorSet0.cp_c6)._m0[int(_920)][_922];
    int _926 = int(_918) + 1;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    int _930 = _926 & 3;
    float _932 = (*spvDescriptorSet0.cp_c6)._m0[int(_928)][_930];
    int _934 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _936 = _934 + _68;
    int _938 = _570 + 64;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.cp_c6)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.cp_c6)._m0[int(_950)][_952];
    int _956 = _936 * 48;
    int _958 = _570 + 88;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    uint _962 = uint(int(uint(int(_960)) >> uint(2)));
    int _964 = int(_960) & 3;
    float _966 = (*spvDescriptorSet0.cp_c6)._m0[int(_962)][_964];
    int _968 = int(_960) + 1;
    uint _970 = uint(int(uint(_968) >> uint(2)));
    int _972 = _968 & 3;
    float _974 = (*spvDescriptorSet0.cp_c6)._m0[int(_970)][_972];
    int _976 = _570 + 72;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    uint _980 = uint(int(uint(int(_978)) >> uint(2)));
    int _982 = int(_978) & 3;
    float _984 = (*spvDescriptorSet0.cp_c6)._m0[int(_980)][_982];
    int _986 = int(_978) + 1;
    uint _988 = uint(int(uint(_986) >> uint(2)));
    int _990 = _986 & 3;
    float _992 = (*spvDescriptorSet0.cp_c6)._m0[int(_988)][_990];
    int _994 = _570 + 96;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    uint _998 = uint(int(uint(int(_996)) >> uint(2)));
    int _1000 = int(_996) & 3;
    float _1002 = (*spvDescriptorSet0.cp_c6)._m0[int(_998)][_1000];
    int _1004 = int(_996) + 1;
    uint _1006 = uint(int(uint(_1004) >> uint(2)));
    int _1008 = _1004 & 3;
    float _1010 = (*spvDescriptorSet0.cp_c6)._m0[int(_1006)][_1008];
    int _1012 = _570 + 104;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.cp_c6)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.cp_c6)._m0[int(_1024)][_1026];
    float _1030 = _892 * _924;
    float _1032 = _894 * _924;
    int _1034 = _570 + 16;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    uint _1038 = uint(int(uint(int(_1036)) >> uint(2)));
    int _1040 = int(_1036) & 3;
    float _1042 = (*spvDescriptorSet0.cp_c6)._m0[int(_1038)][_1040];
    int _1044 = int(_1036) + 1;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    int _1048 = _1044 & 3;
    float _1050 = (*spvDescriptorSet0.cp_c6)._m0[int(_1046)][_1048];
    float _1052 = _896 * _924;
    float _1054 = fma(_898, _946, _1030);
    float _1056 = fma(_900, _946, _1032);
    float _1058 = _896 * _932;
    float _1060 = _892 * _932;
    float _1062 = _894 * _932;
    int _1064 = _570 + 32;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    uint _1068 = uint(int(uint(int(_1066)) >> uint(2)));
    int _1070 = int(_1066) & 3;
    float _1072 = (*spvDescriptorSet0.cp_c6)._m0[int(_1068)][_1070];
    int _1074 = int(_1066) + 1;
    uint _1076 = uint(int(uint(_1074) >> uint(2)));
    int _1078 = _1074 & 3;
    float _1080 = (*spvDescriptorSet0.cp_c6)._m0[int(_1076)][_1078];
    float _1082 = fma(_902, _954, _1058);
    float _1084 = fma(_898, _954, _1060);
    float _1086 = fma(_900, _954, _1062);
    float _1088 = _896 * _966;
    float _1090 = _896 * _974;
    float _1092 = _892 * _966;
    float _1094 = _894 * _966;
    int _1096 = _570 + 48;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    uint _1100 = uint(int(uint(int(_1098)) >> uint(2)));
    int _1102 = int(_1098) & 3;
    float _1104 = (*spvDescriptorSet0.cp_c6)._m0[int(_1100)][_1102];
    int _1106 = int(_1098) + 1;
    uint _1108 = uint(int(uint(_1106) >> uint(2)));
    int _1110 = _1106 & 3;
    float _1112 = (*spvDescriptorSet0.cp_c6)._m0[int(_1108)][_1110];
    float _1114 = _892 * _974;
    float _1116 = _894 * _974;
    float _1118 = fma(_898, _984, _1092);
    float _1120 = fma(_902, _984, _1088);
    float _1122 = fma(_902, _992, _1090);
    float _1124 = fma(_898, _992, _1114);
    float _1126 = fma(_900, _984, _1094);
    int _1128 = _570 + 24;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.cp_c6)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.cp_c6)._m0[int(_1140)][_1142];
    float _1146 = fma(_900, _992, _1116);
    float _1148 = fma(_902, _946, _1052);
    float _1150 = fma(_904, _1002, _1054);
    float _1152 = fma(_906, _1010, _1082);
    float _1154 = fma(_904, _1010, _1084);
    float _1156 = fma(_908, _1002, _1056);
    float _1158 = fma(_908, _1010, _1086);
    int _1160 = _570 + 40;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
    int _1166 = int(_1162) & 3;
    float _1168 = (*spvDescriptorSet0.cp_c6)._m0[int(_1164)][_1166];
    int _1170 = int(_1162) + 1;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    int _1174 = _1170 & 3;
    float _1176 = (*spvDescriptorSet0.cp_c6)._m0[int(_1172)][_1174];
    float _1178 = fma(_906, _1002, _1148);
    float _1180 = fma(_904, _1028, _1124);
    float _1182 = fma(_906, _1028, _1122);
    float _1184 = fma(_908, _1028, _1146);
    float _1186 = fma(_908, _1020, _1126);
    float _1188 = _1180 + _910;
    int _1190 = _570 + 56;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    uint _1194 = uint(int(uint(int(_1192)) >> uint(2)));
    int _1196 = int(_1192) & 3;
    float _1198 = (*spvDescriptorSet0.cp_c6)._m0[int(_1194)][_1196];
    int _1200 = int(_1192) + 1;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    int _1204 = _1200 & 3;
    float _1206 = (*spvDescriptorSet0.cp_c6)._m0[int(_1202)][_1204];
    float _1208 = fma(_904, _1020, _1118);
    float _1210 = _1182 + _912;
    float _1212 = fma(_906, _1020, _1120);
    float _1214 = _1184 + _914;
    float _1216 = _1188 * _1050;
    float _1218 = _1154 * _1050;
    float _1220 = _1150 * _1050;
    float _1222 = _1208 * _1050;
    float _1224 = fma(_1210, _1042, _1216);
    float _1226 = fma(_1152, _1042, _1218);
    float _1228 = fma(_1178, _1042, _1220);
    float _1230 = fma(_1212, _1042, _1222);
    float _1232 = _1188 * _1080;
    float _1234 = _1154 * _1080;
    float _1236 = _1150 * _1080;
    float _1238 = _1208 * _1080;
    float _1240 = fma(_1210, _1072, _1232);
    float _1242 = fma(_1152, _1072, _1234);
    float _1244 = fma(_1178, _1072, _1236);
    float _1246 = fma(_1212, _1072, _1238);
    float _1248 = _1188 * _1112;
    float _1250 = _1154 * _1112;
    float _1252 = _1150 * _1112;
    float _1254 = _1208 * _1112;
    float _1256 = fma(_1210, _1104, _1248);
    float _1258 = fma(_1152, _1104, _1250);
    float _1260 = fma(_1178, _1104, _1252);
    float _1262 = fma(_1212, _1104, _1254);
    float _1264 = fma(_1214, _1136, _1224);
    float _1266 = fma(_1158, _1136, _1226);
    float _1268 = fma(_1156, _1136, _1228);
    float _1270 = fma(_1186, _1136, _1230);
    float _1272 = _1264 + _1144;
    float _1274 = fma(_1214, _1168, _1240);
    float _1276 = fma(_1158, _1168, _1242);
    float _1278 = fma(_1156, _1168, _1244);
    float _1280 = fma(_1186, _1168, _1246);
    float _1282 = _1274 + _1176;
    float _1284 = fma(_1214, _1198, _1256);
    float _1286 = fma(_1158, _1198, _1258);
    int _1288 = _956 + 16;
    float _1290 = fma(_1156, _1198, _1260);
    int _1292 = _956 + 32;
    float _1294 = fma(_1186, _1198, _1262);
    float _1296 = _1284 + _1206;
    int _1298 = _956 + 48;
    uint _1300 = uint(int(uint(_1288) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1300)] = as_type<uint>(_1268);
    int _1302 = _1288 + 4;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1304)] = as_type<uint>(_1266);
    int _1306 = _1288 + 8;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1308)] = as_type<uint>(_1270);
    int _1310 = _1288 + 12;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1312)] = as_type<uint>(_1272);
    uint _1314 = uint(int(uint(_1292) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1314)] = as_type<uint>(_1278);
    int _1316 = _1292 + 4;
    uint _1318 = uint(int(uint(_1316) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1318)] = as_type<uint>(_1276);
    int _1320 = _1292 + 8;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1322)] = as_type<uint>(_1280);
    int _1324 = _1292 + 12;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1326)] = as_type<uint>(_1282);
    uint _1328 = uint(int(uint(_1298) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1328)] = as_type<uint>(_1290);
    int _1330 = _1298 + 4;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1332)] = as_type<uint>(_1286);
    int _1334 = _1298 + 8;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1336)] = as_type<uint>(_1294);
    int _1338 = _1298 + 12;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1340)] = as_type<uint>(_1296);
}

