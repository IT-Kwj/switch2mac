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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _3326, thread const int& _3327, constant _10& support_buffer)
{
    int _3330 = 1 + _3327;
    float _3332 = support_buffer._m5[_3330].x;
    bool _3334 = _3332 == 1.0;
    if (_3334)
    {
        return _3326;
    }
    float _3336 = float(_3326);
    float _3338 = _3336 * _3332;
    int _3340 = int(_3338);
    return _3340;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    if (_68)
    {
        return;
    }
    bool _70 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _72 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _74 = _64 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _76 = _74 << 4;
    bool _78 = !_70;
    if (!_78)
    {
        uint _81 = uint(int(uint(_76) >> uint(2)));
        uint _83 = uint(int(uint(int(_81)) >> uint(2)));
        int _85 = int(_81) & 3;
        float _87 = (*spvDescriptorSet0.cp_c4)._m0[int(_83)][_85];
        int _89 = as_type<int>(_87) * 48;
        int _91 = 0;
        bool _93;
        do
        {
            int _95 = _91;
            uint _97 = uint(int(uint(_89) >> uint(2)));
            uint _99 = uint(int(uint(int(_97)) >> uint(2)));
            int _101 = int(_97) & 3;
            float _103 = (*spvDescriptorSet0.cp_c5)._m0[int(_99)][_101];
            int _105 = int(_97) + 1;
            uint _107 = uint(int(uint(_105) >> uint(2)));
            int _109 = _105 & 3;
            float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
            int _113 = _95;
            int _115 = 0;
            int _117 = _54(_113, _115, (*spvDescriptorSet0.support_buffer));
            int _119 = as_type<int>(_103);
            int _121 = 0;
            int _123 = _54(_119, _121, (*spvDescriptorSet0.support_buffer));
            int3 _1359 = int3(_117, _123, 0);
            float3 _127 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1359.xy), uint(_1359.z), 0).xyz;
            float _129 = _127.x;
            float _131 = _127.y;
            float _133 = _127.z;
            int _135 = _95;
            int _137 = 0;
            int _139 = _54(_135, _137, (*spvDescriptorSet0.support_buffer));
            int _141 = as_type<int>(_111);
            int _143 = 0;
            int _145 = _54(_141, _143, (*spvDescriptorSet0.support_buffer));
            int3 _1377 = int3(_139, _145, 0);
            float3 _147 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1377.xy), uint(_1377.z), 0).xyz;
            float _149 = _147.x;
            float _151 = _147.y;
            float _153 = _147.z;
            int _155 = _95;
            int _157 = 0;
            int _159 = _54(_155, _157, (*spvDescriptorSet0.support_buffer));
            int _161 = as_type<int>(_103);
            int _163 = 0;
            int _165 = _54(_161, _163, (*spvDescriptorSet0.support_buffer));
            int3 _1395 = int3(_159, _165, 1);
            float4 _168 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1395.xy), uint(_1395.z), 0).xyzw;
            float _170 = _168.x;
            float _172 = _168.y;
            float _174 = _168.z;
            float _176 = _168.w;
            int _178 = _95;
            int _180 = 0;
            int _182 = _54(_178, _180, (*spvDescriptorSet0.support_buffer));
            int _184 = as_type<int>(_111);
            int _186 = 0;
            int _188 = _54(_184, _186, (*spvDescriptorSet0.support_buffer));
            int3 _1415 = int3(_182, _188, 1);
            float4 _190 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1415.xy), uint(_1415.z), 0).xyzw;
            float _192 = _190.x;
            float _194 = _190.y;
            float _196 = _190.z;
            float _198 = _190.w;
            int _200 = _95;
            int _202 = 0;
            int _204 = _54(_200, _202, (*spvDescriptorSet0.support_buffer));
            int _206 = as_type<int>(_103);
            int _208 = 0;
            int _210 = _54(_206, _208, (*spvDescriptorSet0.support_buffer));
            int3 _1435 = int3(_204, _210, 2);
            float3 _212 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1435.xy), uint(_1435.z), 0).xyz;
            float _214 = _212.x;
            float _216 = _212.y;
            float _218 = _212.z;
            int _220 = _95;
            int _222 = 0;
            int _224 = _54(_220, _222, (*spvDescriptorSet0.support_buffer));
            int _226 = as_type<int>(_111);
            int _228 = 0;
            int _230 = _54(_226, _228, (*spvDescriptorSet0.support_buffer));
            int3 _1453 = int3(_224, _230, 2);
            float3 _232 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1453.xy), uint(_1453.z), 0).xyz;
            float _234 = _232.x;
            float _236 = _232.y;
            float _238 = _232.z;
            int _240 = _89 + 16;
            uint _242 = uint(int(uint(_240) >> uint(2)));
            uint _244 = uint(int(uint(int(_242)) >> uint(2)));
            int _246 = int(_242) & 3;
            float _248 = (*spvDescriptorSet0.cp_c5)._m0[int(_244)][_246];
            float _250 = -_129;
            float _252 = _250 + _149;
            float _254 = -_133;
            float _256 = _254 + _153;
            float _258 = -_131;
            float _260 = _258 + _151;
            float _262 = fma(_252, _248, _129);
            float _264 = -_176;
            float _266 = _264 + _198;
            float _268 = fma(_256, _248, _133);
            float _270 = -_170;
            float _272 = _270 + _192;
            float _274 = -_172;
            float _276 = _274 + _194;
            float _278 = -_174;
            float _280 = _278 + _196;
            float _282 = fma(_266, _248, _176);
            float _284 = fma(_272, _248, _170);
            float _286 = fma(_276, _248, _172);
            float _288 = fma(_260, _248, _131);
            float _290 = fma(_280, _248, _174);
            float _292 = _282 * 2.0;
            float _294 = _284 * _284;
            float _296 = _286 * _286;
            float _298 = _284 * 2.0;
            float _300 = _290 * _292;
            float _302 = fma(_294, -2.0, 1.0);
            float _304 = _284 * _292;
            float _306 = fma(_296, -2.0, 1.0);
            float _308 = _286 * _292;
            float _310 = -_300;
            float _312 = fma(_286, _298, _310);
            float _314 = fma(_286, _298, _300);
            float _316 = _290 * _290;
            float _318 = _286 * 2.0;
            float _320 = fma(_290, _298, _308);
            float _322 = -_308;
            float _324 = fma(_290, _298, _322);
            float _326 = fma(_316, -2.0, _306);
            float _328 = -_304;
            float _330 = fma(_290, _318, _328);
            float _332 = fma(_290, _318, _304);
            float _334 = fma(_316, -2.0, _302);
            float _336 = _288 * _312;
            float _338 = fma(_296, -2.0, _302);
            float _340 = _288 * _332;
            float _342 = _288 * _334;
            float _344 = -_214;
            float _346 = _344 + _234;
            int _348 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _350 = _348 + _95;
            float _352 = -_216;
            float _354 = _352 + _236;
            float _356 = -_218;
            float _358 = _356 + _238;
            float _360 = _262 * _314;
            float _362 = _268 * _320;
            float _364 = _268 * _338;
            float _366 = _262 * _326;
            float _368 = _262 * _324;
            float _370 = _268 * _330;
            float _372 = fma(_346, _248, _214);
            int _374 = _350 * 48;
            float _376 = fma(_354, _248, _216);
            float _378 = fma(_358, _248, _218);
            int _380 = _95 + 1;
            uint _382 = uint(int(uint(_374) >> uint(2)));
            _37[int(_382)] = as_type<uint>(_366);
            int _384 = _374 + 4;
            uint _386 = uint(int(uint(_384) >> uint(2)));
            _37[int(_386)] = as_type<uint>(_336);
            int _388 = _374 + 8;
            uint _390 = uint(int(uint(_388) >> uint(2)));
            _37[int(_390)] = as_type<uint>(_362);
            int _392 = _374 + 12;
            uint _394 = uint(int(uint(_392) >> uint(2)));
            _37[int(_394)] = as_type<uint>(_372);
            bool _396 = uint(_380) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _398 = _374 + 16;
            uint _400 = uint(int(uint(_398) >> uint(2)));
            _37[int(_400)] = as_type<uint>(_360);
            int _402 = _374 + 20;
            uint _404 = uint(int(uint(_402) >> uint(2)));
            _37[int(_404)] = as_type<uint>(_342);
            int _406 = _374 + 24;
            uint _408 = uint(int(uint(_406) >> uint(2)));
            _37[int(_408)] = as_type<uint>(_370);
            int _410 = _374 + 28;
            uint _412 = uint(int(uint(_410) >> uint(2)));
            _37[int(_412)] = as_type<uint>(_376);
            int _414 = _374 + 32;
            uint _416 = uint(int(uint(_414) >> uint(2)));
            _37[int(_416)] = as_type<uint>(_368);
            int _418 = _374 + 36;
            uint _420 = uint(int(uint(_418) >> uint(2)));
            _37[int(_420)] = as_type<uint>(_340);
            int _422 = _374 + 40;
            uint _424 = uint(int(uint(_422) >> uint(2)));
            _37[int(_424)] = as_type<uint>(_364);
            int _426 = _374 + 44;
            uint _428 = uint(int(uint(_426) >> uint(2)));
            _37[int(_428)] = as_type<uint>(_378);
            _93 = !_396;
            _91 = _380;
        } while (_93);
    }
    bool _430 = !_72;
    if (!_430)
    {
        int _432 = 1;
        bool _434;
        do
        {
            int _436 = _432;
            int _438 = _436 * 112;
            int _440 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _442 = _440 + _436;
            int _444 = _436 + 1;
            uint _446 = uint(int(uint(_438) >> uint(2)));
            uint _448 = uint(int(uint(int(_446)) >> uint(2)));
            int _450 = int(_446) & 3;
            float _452 = (*spvDescriptorSet0.cp_c6)._m0[int(_448)][_450];
            int _454 = _442 * 48;
            bool _456 = uint(_444) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _458 = _454 + 16;
            uint _460 = uint(int(uint(_458) >> uint(2)));
            float _462 = as_type<float>(_37[int(_460)]);
            int _464 = _454 + 20;
            uint _466 = uint(int(uint(_464) >> uint(2)));
            float _468 = as_type<float>(_37[int(_466)]);
            int _470 = _454 + 24;
            uint _472 = uint(int(uint(_470) >> uint(2)));
            float _474 = as_type<float>(_37[int(_472)]);
            int _476 = _454 + 28;
            uint _478 = uint(int(uint(_476) >> uint(2)));
            float _480 = as_type<float>(_37[int(_478)]);
            int _482 = _454 + 32;
            uint _484 = uint(int(uint(_482) >> uint(2)));
            float _486 = as_type<float>(_37[int(_484)]);
            int _488 = _454 + 36;
            uint _490 = uint(int(uint(_488) >> uint(2)));
            float _492 = as_type<float>(_37[int(_490)]);
            int _494 = _454 + 40;
            uint _496 = uint(int(uint(_494) >> uint(2)));
            float _498 = as_type<float>(_37[int(_496)]);
            int _500 = _454 + 44;
            uint _502 = uint(int(uint(_500) >> uint(2)));
            float _504 = as_type<float>(_37[int(_502)]);
            int _506 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _508 = _506 + as_type<int>(_452);
            int _510 = _508 * 48;
            uint _512 = uint(int(uint(_454) >> uint(2)));
            float _514 = as_type<float>(_37[int(_512)]);
            int _516 = _454 + 4;
            uint _518 = uint(int(uint(_516) >> uint(2)));
            float _520 = as_type<float>(_37[int(_518)]);
            int _522 = _454 + 8;
            uint _524 = uint(int(uint(_522) >> uint(2)));
            float _526 = as_type<float>(_37[int(_524)]);
            int _528 = _454 + 12;
            uint _530 = uint(int(uint(_528) >> uint(2)));
            float _532 = as_type<float>(_37[int(_530)]);
            uint _534 = uint(int(uint(_510) >> uint(2)));
            float _536 = as_type<float>(_37[int(_534)]);
            int _538 = _510 + 4;
            uint _540 = uint(int(uint(_538) >> uint(2)));
            float _542 = as_type<float>(_37[int(_540)]);
            int _544 = _510 + 8;
            uint _546 = uint(int(uint(_544) >> uint(2)));
            float _548 = as_type<float>(_37[int(_546)]);
            int _550 = _510 + 12;
            uint _552 = uint(int(uint(_550) >> uint(2)));
            float _554 = as_type<float>(_37[int(_552)]);
            int _556 = _510 + 16;
            uint _558 = uint(int(uint(_556) >> uint(2)));
            float _560 = as_type<float>(_37[int(_558)]);
            int _562 = _510 + 20;
            uint _564 = uint(int(uint(_562) >> uint(2)));
            float _566 = as_type<float>(_37[int(_564)]);
            int _568 = _510 + 24;
            uint _570 = uint(int(uint(_568) >> uint(2)));
            float _572 = as_type<float>(_37[int(_570)]);
            int _574 = _510 + 28;
            uint _576 = uint(int(uint(_574) >> uint(2)));
            float _578 = as_type<float>(_37[int(_576)]);
            int _580 = _510 + 32;
            uint _582 = uint(int(uint(_580) >> uint(2)));
            float _584 = as_type<float>(_37[int(_582)]);
            int _586 = _510 + 36;
            uint _588 = uint(int(uint(_586) >> uint(2)));
            float _590 = as_type<float>(_37[int(_588)]);
            int _592 = _510 + 40;
            uint _594 = uint(int(uint(_592) >> uint(2)));
            float _596 = as_type<float>(_37[int(_594)]);
            int _598 = _510 + 44;
            uint _600 = uint(int(uint(_598) >> uint(2)));
            float _602 = as_type<float>(_37[int(_600)]);
            float _604 = _480 * _542;
            float _606 = _468 * _542;
            float _608 = _462 * _542;
            float _610 = _474 * _542;
            float _612 = fma(_532, _536, _604);
            float _614 = fma(_520, _536, _606);
            float _616 = fma(_514, _536, _608);
            float _618 = fma(_526, _536, _610);
            float _620 = fma(_504, _548, _612);
            float _622 = fma(_492, _548, _614);
            float _624 = _468 * _566;
            float _626 = _462 * _566;
            float _628 = _554 + _620;
            float _630 = _480 * _566;
            float _632 = _474 * _566;
            float _634 = fma(_520, _560, _624);
            float _636 = fma(_486, _548, _616);
            float _638 = fma(_532, _560, _630);
            float _640 = fma(_526, _560, _632);
            float _642 = fma(_492, _572, _634);
            float _644 = _480 * _590;
            float _646 = _462 * _590;
            float _648 = _468 * _590;
            float _650 = _474 * _590;
            float _652 = fma(_532, _584, _644);
            float _654 = fma(_514, _560, _626);
            float _656 = fma(_504, _572, _638);
            float _658 = fma(_514, _584, _646);
            float _660 = fma(_520, _584, _648);
            float _662 = fma(_526, _584, _650);
            float _664 = fma(_504, _596, _652);
            float _666 = fma(_486, _572, _654);
            float _668 = fma(_498, _548, _618);
            float _670 = fma(_498, _572, _640);
            float _672 = _578 + _656;
            float _674 = fma(_486, _596, _658);
            float _676 = fma(_492, _596, _660);
            float _678 = fma(_498, _596, _662);
            float _680 = _602 + _664;
            uint _682 = uint(int(uint(_454) >> uint(2)));
            _37[int(_682)] = as_type<uint>(_636);
            int _684 = _454 + 4;
            uint _686 = uint(int(uint(_684) >> uint(2)));
            _37[int(_686)] = as_type<uint>(_622);
            int _688 = _454 + 8;
            uint _690 = uint(int(uint(_688) >> uint(2)));
            _37[int(_690)] = as_type<uint>(_668);
            int _692 = _454 + 12;
            uint _694 = uint(int(uint(_692) >> uint(2)));
            _37[int(_694)] = as_type<uint>(_628);
            int _696 = _454 + 16;
            uint _698 = uint(int(uint(_696) >> uint(2)));
            _37[int(_698)] = as_type<uint>(_666);
            int _700 = _454 + 20;
            uint _702 = uint(int(uint(_700) >> uint(2)));
            _37[int(_702)] = as_type<uint>(_642);
            int _704 = _454 + 24;
            uint _706 = uint(int(uint(_704) >> uint(2)));
            _37[int(_706)] = as_type<uint>(_670);
            int _708 = _454 + 28;
            uint _710 = uint(int(uint(_708) >> uint(2)));
            _37[int(_710)] = as_type<uint>(_672);
            int _712 = _454 + 32;
            uint _714 = uint(int(uint(_712) >> uint(2)));
            _37[int(_714)] = as_type<uint>(_674);
            int _716 = _454 + 36;
            uint _718 = uint(int(uint(_716) >> uint(2)));
            _37[int(_718)] = as_type<uint>(_676);
            int _720 = _454 + 40;
            uint _722 = uint(int(uint(_720) >> uint(2)));
            _37[int(_722)] = as_type<uint>(_678);
            int _724 = _454 + 44;
            uint _726 = uint(int(uint(_724) >> uint(2)));
            _37[int(_726)] = as_type<uint>(_680);
            _434 = !_456;
            _432 = _444;
        } while (_434);
    }
    if (!_70)
    {
        return;
    }
    int _728 = 0;
    bool _730;
    do
    {
        int _732 = _728;
        int _734 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _736 = _734 + _732;
        int _738 = _732 * 112;
        int _740 = _736 * 48;
        int _742 = _738 + 80;
        uint _744 = uint(int(uint(_742) >> uint(2)));
        uint _746 = uint(int(uint(int(_744)) >> uint(2)));
        int _748 = int(_744) & 3;
        float _750 = (*spvDescriptorSet0.cp_c6)._m0[int(_746)][_748];
        int _752 = int(_744) + 1;
        uint _754 = uint(int(uint(_752) >> uint(2)));
        int _756 = _752 & 3;
        float _758 = (*spvDescriptorSet0.cp_c6)._m0[int(_754)][_756];
        uint _760 = uint(int(uint(_740) >> uint(2)));
        float _762 = as_type<float>(_37[int(_760)]);
        int _764 = _740 + 4;
        uint _766 = uint(int(uint(_764) >> uint(2)));
        float _768 = as_type<float>(_37[int(_766)]);
        int _770 = _740 + 8;
        uint _772 = uint(int(uint(_770) >> uint(2)));
        float _774 = as_type<float>(_37[int(_772)]);
        int _776 = _740 + 12;
        uint _778 = uint(int(uint(_776) >> uint(2)));
        float _780 = as_type<float>(_37[int(_778)]);
        int _782 = _740 + 16;
        uint _784 = uint(int(uint(_782) >> uint(2)));
        float _786 = as_type<float>(_37[int(_784)]);
        int _788 = _740 + 20;
        uint _790 = uint(int(uint(_788) >> uint(2)));
        float _792 = as_type<float>(_37[int(_790)]);
        int _794 = _740 + 24;
        uint _796 = uint(int(uint(_794) >> uint(2)));
        float _798 = as_type<float>(_37[int(_796)]);
        int _800 = _740 + 28;
        uint _802 = uint(int(uint(_800) >> uint(2)));
        float _804 = as_type<float>(_37[int(_802)]);
        int _806 = _738 + 88;
        uint _808 = uint(int(uint(_806) >> uint(2)));
        uint _810 = uint(int(uint(int(_808)) >> uint(2)));
        int _812 = int(_808) & 3;
        float _814 = (*spvDescriptorSet0.cp_c6)._m0[int(_810)][_812];
        int _816 = int(_808) + 1;
        uint _818 = uint(int(uint(_816) >> uint(2)));
        int _820 = _816 & 3;
        float _822 = (*spvDescriptorSet0.cp_c6)._m0[int(_818)][_820];
        int _824 = _740 + 32;
        uint _826 = uint(int(uint(_824) >> uint(2)));
        float _828 = as_type<float>(_37[int(_826)]);
        int _830 = _740 + 36;
        uint _832 = uint(int(uint(_830) >> uint(2)));
        float _834 = as_type<float>(_37[int(_832)]);
        int _836 = _740 + 40;
        uint _838 = uint(int(uint(_836) >> uint(2)));
        float _840 = as_type<float>(_37[int(_838)]);
        int _842 = _740 + 44;
        uint _844 = uint(int(uint(_842) >> uint(2)));
        float _846 = as_type<float>(_37[int(_844)]);
        int _848 = _738 + 64;
        uint _850 = uint(int(uint(_848) >> uint(2)));
        uint _852 = uint(int(uint(int(_850)) >> uint(2)));
        int _854 = int(_850) & 3;
        float _856 = (*spvDescriptorSet0.cp_c6)._m0[int(_852)][_854];
        int _858 = int(_850) + 1;
        uint _860 = uint(int(uint(_858) >> uint(2)));
        int _862 = _858 & 3;
        float _864 = (*spvDescriptorSet0.cp_c6)._m0[int(_860)][_862];
        int _866 = _738 + 72;
        uint _868 = uint(int(uint(_866) >> uint(2)));
        uint _870 = uint(int(uint(int(_868)) >> uint(2)));
        int _872 = int(_868) & 3;
        float _874 = (*spvDescriptorSet0.cp_c6)._m0[int(_870)][_872];
        int _876 = int(_868) + 1;
        uint _878 = uint(int(uint(_876) >> uint(2)));
        int _880 = _876 & 3;
        float _882 = (*spvDescriptorSet0.cp_c6)._m0[int(_878)][_880];
        int _884 = _738 + 104;
        uint _886 = uint(int(uint(_884) >> uint(2)));
        uint _888 = uint(int(uint(int(_886)) >> uint(2)));
        int _890 = int(_886) & 3;
        float _892 = (*spvDescriptorSet0.cp_c6)._m0[int(_888)][_890];
        int _894 = int(_886) + 1;
        uint _896 = uint(int(uint(_894) >> uint(2)));
        int _898 = _894 & 3;
        float _900 = (*spvDescriptorSet0.cp_c6)._m0[int(_896)][_898];
        int _902 = _738 + 96;
        uint _904 = uint(int(uint(_902) >> uint(2)));
        uint _906 = uint(int(uint(int(_904)) >> uint(2)));
        int _908 = int(_904) & 3;
        float _910 = (*spvDescriptorSet0.cp_c6)._m0[int(_906)][_908];
        int _912 = int(_904) + 1;
        uint _914 = uint(int(uint(_912) >> uint(2)));
        int _916 = _912 & 3;
        float _918 = (*spvDescriptorSet0.cp_c6)._m0[int(_914)][_916];
        float _920 = _768 * _750;
        float _922 = _768 * _758;
        float _924 = _768 * _814;
        float _926 = _768 * _822;
        float _928 = fma(_762, _856, _920);
        float _930 = fma(_762, _864, _922);
        float _932 = fma(_762, _874, _924);
        float _934 = fma(_762, _882, _926);
        float _936 = _792 * _750;
        float _938 = _792 * _758;
        float _940 = _792 * _814;
        float _942 = _792 * _822;
        float _944 = _834 * _750;
        float _946 = fma(_786, _856, _936);
        float _948 = fma(_786, _864, _938);
        float _950 = fma(_786, _874, _940);
        uint _952 = uint(int(uint(_76) >> uint(2)));
        uint _954 = uint(int(uint(int(_952)) >> uint(2)));
        int _956 = int(_952) & 3;
        float _958 = (*spvDescriptorSet0.cp_c4)._m0[int(_954)][_956];
        float _960 = fma(_786, _882, _942);
        float _962 = _834 * _758;
        float _964 = _834 * _814;
        float _966 = _834 * _822;
        float _968 = fma(_828, _856, _944);
        float _970 = fma(_828, _864, _962);
        float _972 = fma(_828, _874, _964);
        int _974 = _738 + 16;
        uint _976 = uint(int(uint(_974) >> uint(2)));
        uint _978 = uint(int(uint(int(_976)) >> uint(2)));
        int _980 = int(_976) & 3;
        float _982 = (*spvDescriptorSet0.cp_c6)._m0[int(_978)][_980];
        int _984 = int(_976) + 1;
        uint _986 = uint(int(uint(_984) >> uint(2)));
        int _988 = _984 & 3;
        float _990 = (*spvDescriptorSet0.cp_c6)._m0[int(_986)][_988];
        float _992 = fma(_828, _882, _966);
        float _994 = fma(_798, _900, _960);
        float _996 = fma(_774, _910, _928);
        float _998 = fma(_774, _918, _930);
        float _1000 = fma(_774, _892, _932);
        float _1002 = fma(_774, _900, _934);
        float _1004 = fma(_798, _910, _946);
        int _1006 = _738 + 24;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
        int _1012 = int(_1008) & 3;
        float _1014 = (*spvDescriptorSet0.cp_c6)._m0[int(_1010)][_1012];
        int _1016 = int(_1008) + 1;
        uint _1018 = uint(int(uint(_1016) >> uint(2)));
        int _1020 = _1016 & 3;
        float _1022 = (*spvDescriptorSet0.cp_c6)._m0[int(_1018)][_1020];
        float _1024 = fma(_798, _918, _948);
        float _1026 = fma(_798, _892, _950);
        float _1028 = fma(_840, _910, _968);
        float _1030 = fma(_840, _918, _970);
        float _1032 = fma(_840, _900, _992);
        float _1034 = fma(_840, _892, _972);
        float _1036 = _804 + _994;
        int _1038 = _738 + 32;
        uint _1040 = uint(int(uint(_1038) >> uint(2)));
        uint _1042 = uint(int(uint(int(_1040)) >> uint(2)));
        int _1044 = int(_1040) & 3;
        float _1046 = (*spvDescriptorSet0.cp_c6)._m0[int(_1042)][_1044];
        int _1048 = int(_1040) + 1;
        uint _1050 = uint(int(uint(_1048) >> uint(2)));
        int _1052 = _1048 & 3;
        float _1054 = (*spvDescriptorSet0.cp_c6)._m0[int(_1050)][_1052];
        float _1056 = _846 + _1032;
        float _1058 = _780 + _1002;
        int _1060 = _738 + 48;
        uint _1062 = uint(int(uint(_1060) >> uint(2)));
        uint _1064 = uint(int(uint(int(_1062)) >> uint(2)));
        int _1066 = int(_1062) & 3;
        float _1068 = (*spvDescriptorSet0.cp_c6)._m0[int(_1064)][_1066];
        int _1070 = int(_1062) + 1;
        uint _1072 = uint(int(uint(_1070) >> uint(2)));
        int _1074 = _1070 & 3;
        float _1076 = (*spvDescriptorSet0.cp_c6)._m0[int(_1072)][_1074];
        float _1078 = _1004 * _990;
        float _1080 = _1024 * _990;
        float _1082 = _1036 * _990;
        float _1084 = _1026 * _990;
        float _1086 = fma(_996, _982, _1078);
        float _1088 = fma(_998, _982, _1080);
        float _1090 = fma(_1058, _982, _1082);
        float _1092 = fma(_1000, _982, _1084);
        int _1094 = _738 + 40;
        uint _1096 = uint(int(uint(_1094) >> uint(2)));
        uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
        int _1100 = int(_1096) & 3;
        float _1102 = (*spvDescriptorSet0.cp_c6)._m0[int(_1098)][_1100];
        int _1104 = int(_1096) + 1;
        uint _1106 = uint(int(uint(_1104) >> uint(2)));
        int _1108 = _1104 & 3;
        float _1110 = (*spvDescriptorSet0.cp_c6)._m0[int(_1106)][_1108];
        float _1112 = fma(_1028, _1014, _1086);
        float _1114 = fma(_1056, _1014, _1090);
        float _1116 = fma(_1030, _1014, _1088);
        float _1118 = fma(_1034, _1014, _1092);
        float _1120 = _1114 + _1022;
        float _1122 = _1036 * _1054;
        int _1124 = _738 + 56;
        uint _1126 = uint(int(uint(_1124) >> uint(2)));
        uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
        int _1130 = int(_1126) & 3;
        float _1132 = (*spvDescriptorSet0.cp_c6)._m0[int(_1128)][_1130];
        int _1134 = int(_1126) + 1;
        uint _1136 = uint(int(uint(_1134) >> uint(2)));
        int _1138 = _1134 & 3;
        float _1140 = (*spvDescriptorSet0.cp_c6)._m0[int(_1136)][_1138];
        float _1142 = _1004 * _1054;
        float _1144 = _1024 * _1054;
        int _1146 = as_type<int>(_958) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1148 = _1146 + _732;
        int _1150 = _732 + 1;
        float _1152 = _1026 * _1054;
        float _1154 = fma(_1058, _1046, _1122);
        float _1156 = _1036 * _1076;
        float _1158 = _1004 * _1076;
        float _1160 = _1024 * _1076;
        float _1162 = fma(_998, _1046, _1144);
        float _1164 = _1026 * _1076;
        float _1166 = fma(_1058, _1068, _1156);
        float _1168 = fma(_996, _1068, _1158);
        int _1170 = _1148 * 48;
        bool _1172 = uint(_1150) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1174 = fma(_998, _1068, _1160);
        float _1176 = fma(_996, _1046, _1142);
        float _1178 = fma(_1000, _1046, _1152);
        float _1180 = fma(_1056, _1102, _1154);
        float _1182 = fma(_1000, _1068, _1164);
        float _1184 = fma(_1030, _1102, _1162);
        float _1186 = fma(_1028, _1102, _1176);
        float _1188 = fma(_1034, _1102, _1178);
        float _1190 = fma(_1056, _1132, _1166);
        float _1192 = fma(_1028, _1132, _1168);
        float _1194 = fma(_1030, _1132, _1174);
        int _1196 = _1170 + 16;
        float _1198 = _1180 + _1110;
        int _1200 = _1170 + 32;
        float _1202 = fma(_1034, _1132, _1182);
        float _1204 = _1190 + _1140;
        int _1206 = _1170 + 48;
        uint _1208 = uint(int(uint(_1196) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1208)] = as_type<uint>(_1112);
        int _1210 = _1196 + 4;
        uint _1212 = uint(int(uint(_1210) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1212)] = as_type<uint>(_1116);
        int _1214 = _1196 + 8;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1216)] = as_type<uint>(_1118);
        int _1218 = _1196 + 12;
        uint _1220 = uint(int(uint(_1218) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1220)] = as_type<uint>(_1120);
        uint _1222 = uint(int(uint(_1200) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1222)] = as_type<uint>(_1186);
        int _1224 = _1200 + 4;
        uint _1226 = uint(int(uint(_1224) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1226)] = as_type<uint>(_1184);
        int _1228 = _1200 + 8;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1230)] = as_type<uint>(_1188);
        int _1232 = _1200 + 12;
        uint _1234 = uint(int(uint(_1232) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1234)] = as_type<uint>(_1198);
        uint _1236 = uint(int(uint(_1206) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1236)] = as_type<uint>(_1192);
        int _1238 = _1206 + 4;
        uint _1240 = uint(int(uint(_1238) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1240)] = as_type<uint>(_1194);
        int _1242 = _1206 + 8;
        uint _1244 = uint(int(uint(_1242) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1244)] = as_type<uint>(_1202);
        int _1246 = _1206 + 12;
        uint _1248 = uint(int(uint(_1246) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1248)] = as_type<uint>(_1204);
        _730 = !_1172;
        _728 = _1150;
    } while (_730);
}

