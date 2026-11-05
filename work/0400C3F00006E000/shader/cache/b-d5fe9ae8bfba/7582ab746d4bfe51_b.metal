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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3444, thread const int& _3445, constant _10& support_buffer)
{
    int _3448 = 1 + _3445;
    float _3450 = support_buffer._m5[_3448].x;
    bool _3452 = _3450 == 1.0;
    if (_3452)
    {
        return _3444;
    }
    float _3454 = float(_3444);
    float _3456 = _3454 * _3450;
    int _3458 = int(_3456);
    return _3458;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _880 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = _66 & 31;
    bool _74 = _72 == 0;
    bool _76 = uint(_72) < 32u;
    int _78 = 32 - _72;
    int _80 = _72 - 32;
    int _82 = 1 << _72;
    uint _85 = uint(int(uint(0) >> uint(_78)));
    int _87 = _82 | int(_85);
    int _89 = _74 ? 1 : _87;
    bool _91 = uint(_80) < 32u;
    int _93 = 0 << _80;
    int _95 = _91 ? _93 : 0;
    int _97 = _76 ? _89 : _95;
    int _99 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _101 = _99 + 32;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = _97 & as_type<int>(_109);
    bool _113 = _111 != 0;
    bool _115 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _117 = 0.0;
    float _119 = 0.0;
    float _121 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    if (!_113)
    {
        _117 = 0.0;
        _119 = 0.0;
    }
    float _123 = _117;
    float _125 = _119;
    float _127 = 0.0;
    float _129 = 0.0;
    float _131 = _123;
    float _133 = _125;
    if (!_113)
    {
        _127 = 0.0;
        _129 = 0.0;
    }
    float _135 = _127;
    float _137 = _129;
    float _139 = 0.0;
    float _141 = 0.0;
    float _143 = _135;
    float _145 = _137;
    if (!_113)
    {
        _139 = 0.0;
        _141 = 0.0;
    }
    float _147 = _139;
    float _149 = _141;
    float _151 = 0.0;
    float _153 = _147;
    float _155 = _149;
    if (!_113)
    {
        _151 = 0.0;
    }
    float _157 = _151;
    float _159 = 0.0;
    float _161 = _157;
    if (!_113)
    {
        _121 = 0.0;
        _159 = 0.0;
    }
    float _163 = _121;
    float _165 = _159;
    float _167 = 0.0;
    float _169 = _165;
    float _171 = _163;
    if (!_113)
    {
        _167 = 0.0;
    }
    float _173 = _167;
    bool _175 = !_113;
    float _177 = _173;
    float _179 = 0.0;
    float _181 = 0.0;
    float _183 = 0.0;
    if (!_175)
    {
        uint _185 = uint(int(uint(_99) >> uint(2)));
        uint _187 = uint(int(uint(int(_185)) >> uint(2)));
        int _189 = int(_185) & 3;
        float _191 = (*spvDescriptorSet0.cp_c5)._m0[int(_187)][_189];
        int _193 = int(_185) + 1;
        uint _195 = uint(int(uint(_193) >> uint(2)));
        int _197 = _193 & 3;
        float _199 = (*spvDescriptorSet0.cp_c5)._m0[int(_195)][_197];
        int _201 = _66;
        int _203 = 0;
        int _205 = _56(_201, _203, (*spvDescriptorSet0.support_buffer));
        int _207 = as_type<int>(_191);
        int _209 = 0;
        int _211 = _56(_207, _209, (*spvDescriptorSet0.support_buffer));
        int3 _1523 = int3(_205, _211, 1);
        float4 _214 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1523.xy), uint(_1523.z), 0).xyzw;
        float _216 = _214.x;
        float _218 = _214.y;
        float _220 = _214.z;
        float _222 = _214.w;
        int _224 = _66;
        int _226 = 0;
        int _228 = _56(_224, _226, (*spvDescriptorSet0.support_buffer));
        int _230 = as_type<int>(_199);
        int _232 = 0;
        int _234 = _56(_230, _232, (*spvDescriptorSet0.support_buffer));
        int3 _1543 = int3(_228, _234, 1);
        float4 _236 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1543.xy), uint(_1543.z), 0).xyzw;
        float _238 = _236.x;
        float _240 = _236.y;
        float _242 = _236.z;
        float _244 = _236.w;
        int _246 = _66;
        int _248 = 0;
        int _250 = _56(_246, _248, (*spvDescriptorSet0.support_buffer));
        int _252 = as_type<int>(_191);
        int _254 = 0;
        int _256 = _56(_252, _254, (*spvDescriptorSet0.support_buffer));
        int3 _1563 = int3(_250, _256, 0);
        float3 _260 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1563.xy), uint(_1563.z), 0).xyz;
        float _262 = _260.x;
        float _264 = _260.y;
        float _266 = _260.z;
        int _268 = _66;
        int _270 = 0;
        int _272 = _56(_268, _270, (*spvDescriptorSet0.support_buffer));
        int _274 = as_type<int>(_199);
        int _276 = 0;
        int _278 = _56(_274, _276, (*spvDescriptorSet0.support_buffer));
        int3 _1581 = int3(_272, _278, 0);
        float3 _280 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1581.xy), uint(_1581.z), 0).xyz;
        float _282 = _280.x;
        float _284 = _280.y;
        float _286 = _280.z;
        int _288 = _66;
        int _290 = 0;
        int _292 = _56(_288, _290, (*spvDescriptorSet0.support_buffer));
        int _294 = as_type<int>(_191);
        int _296 = 0;
        int _298 = _56(_294, _296, (*spvDescriptorSet0.support_buffer));
        int3 _1599 = int3(_292, _298, 2);
        float3 _300 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1599.xy), uint(_1599.z), 0).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        int _308 = _66;
        int _310 = 0;
        int _312 = _56(_308, _310, (*spvDescriptorSet0.support_buffer));
        int _314 = as_type<int>(_199);
        int _316 = 0;
        int _318 = _56(_314, _316, (*spvDescriptorSet0.support_buffer));
        int3 _1617 = int3(_312, _318, 2);
        float3 _320 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1617.xy), uint(_1617.z), 0).xyz;
        float _322 = _320.x;
        float _324 = _320.y;
        float _326 = _320.z;
        int _328 = _99 + 16;
        uint _330 = uint(int(uint(_328) >> uint(2)));
        uint _332 = uint(int(uint(int(_330)) >> uint(2)));
        int _334 = int(_330) & 3;
        float _336 = (*spvDescriptorSet0.cp_c5)._m0[int(_332)][_334];
        float _338 = -_216;
        float _340 = _338 + _238;
        float _342 = -_218;
        float _344 = _342 + _240;
        float _346 = -_220;
        float _348 = _346 + _242;
        float _350 = fma(_340, _336, _216);
        float _352 = fma(_344, _336, _218);
        float _354 = -_222;
        float _356 = _354 + _244;
        float _358 = -_264;
        float _360 = _358 + _284;
        float _362 = fma(_348, _336, _220);
        float _364 = -_262;
        float _366 = _364 + _282;
        float _368 = fma(_356, _336, _222);
        float _370 = fma(_360, _336, _264);
        float _372 = -_266;
        float _374 = _372 + _286;
        float _376 = -_302;
        float _378 = _376 + _322;
        float _380 = -_304;
        float _382 = _380 + _324;
        float _384 = -_306;
        float _386 = _384 + _326;
        float _388 = fma(_366, _336, _262);
        float _390 = fma(_374, _336, _266);
        float _392 = fma(_378, _336, _302);
        float _394 = fma(_382, _336, _304);
        float _396 = fma(_386, _336, _306);
        float _398 = _368 * 2.0;
        _161 = _350;
        _169 = _362;
        _171 = _398;
        _177 = _352;
        _131 = _388;
        _143 = _370;
        _153 = _390;
        _145 = _392;
        _133 = _394;
        _155 = _396;
        _179 = _306;
        _181 = _302;
        _183 = _322;
    }
    float _400 = _161;
    float _402 = _169;
    float _404 = _171;
    float _406 = _177;
    float _408 = _131;
    float _410 = _143;
    float _412 = _153;
    float _414 = _145;
    float _416 = _133;
    float _418 = _155;
    float _420 = _179;
    float _422 = _181;
    float _424 = _183;
    float _426 = _400 * _400;
    float _428 = _400 * 2.0;
    float _430 = _402 * _404;
    float _432 = _400 * _404;
    float _434 = _406 * _404;
    float _436 = _406 * _406;
    float _438 = -_430;
    float _440 = fma(_428, _406, _438);
    float _442 = fma(_428, _406, _430);
    float _444 = _406 * 2.0;
    float _446 = _402 * _402;
    float _448 = fma(_436, -2.0, 1.0);
    float _450 = fma(_426, -2.0, 1.0);
    float _452 = fma(_428, _402, _434);
    float _454 = -_434;
    float _456 = fma(_428, _402, _454);
    float _458 = -_432;
    float _460 = fma(_444, _402, _458);
    float _462 = fma(_446, -2.0, _448);
    float _464 = fma(_444, _402, _432);
    float _466 = fma(_446, -2.0, _450);
    float _468 = fma(_436, -2.0, _450);
    float _470 = _462 * _408;
    float _472 = _442 * _408;
    float _474 = _456 * _408;
    float _476 = _440 * _410;
    float _478 = _464 * _410;
    float _480 = _466 * _410;
    float _482 = _452 * _412;
    float _484 = _460 * _412;
    bool _486 = _66 != 0;
    int _488 = _66 * 48;
    float _490 = _468 * _412;
    float _492 = _444;
    float _494 = _452;
    float _496 = _428;
    float _498 = _424;
    float _500 = _440;
    float _502 = _422;
    float _504 = _420;
    float _506 = _442;
    float _508 = _466;
    float _510 = _416;
    float _512 = _414;
    float _514 = _418;
    if (!_115)
    {
        int _516 = _66 * 48;
        int _518 = _516 + 16;
        uint _520 = uint(int(uint(_516) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_520)] = as_type<uint>(_470);
        int _522 = _516 + 4;
        uint _524 = uint(int(uint(_522) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_524)] = as_type<uint>(_476);
        int _526 = _516 + 8;
        uint _528 = uint(int(uint(_526) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_528)] = as_type<uint>(_482);
        int _530 = _516 + 12;
        uint _532 = uint(int(uint(_530) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_532)] = as_type<uint>(_414);
        int _534 = _516 + 32;
        uint _536 = uint(int(uint(_518) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_536)] = as_type<uint>(_472);
        int _538 = _518 + 4;
        uint _540 = uint(int(uint(_538) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_540)] = as_type<uint>(_480);
        int _542 = _518 + 8;
        uint _544 = uint(int(uint(_542) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_544)] = as_type<uint>(_484);
        int _546 = _518 + 12;
        uint _548 = uint(int(uint(_546) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_548)] = as_type<uint>(_416);
        uint _550 = uint(int(uint(_534) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_550)] = as_type<uint>(_474);
        int _552 = _534 + 4;
        uint _554 = uint(int(uint(_552) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_554)] = as_type<uint>(_478);
        int _556 = _534 + 8;
        uint _558 = uint(int(uint(_556) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_558)] = as_type<uint>(_490);
        int _560 = _534 + 12;
        uint _562 = uint(int(uint(_560) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_562)] = as_type<uint>(_418);
        _492 = as_type<float>(_518);
        _494 = as_type<float>(_534);
        _496 = as_type<float>(_516);
    }
    float _564 = _492;
    float _566 = _494;
    float _568 = _496;
    uint _570 = uint(int(uint(_488) >> uint(2)));
    _39[int(_570)] = as_type<uint>(_470);
    int _572 = _488 + 4;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    _39[int(_574)] = as_type<uint>(_476);
    int _576 = _488 + 8;
    uint _578 = uint(int(uint(_576) >> uint(2)));
    _39[int(_578)] = as_type<uint>(_482);
    int _580 = _488 + 12;
    uint _582 = uint(int(uint(_580) >> uint(2)));
    _39[int(_582)] = as_type<uint>(_414);
    int _584 = _66 * 112;
    float _586 = _566;
    float _588 = _564;
    float _590 = _568;
    if (!_486)
    {
        _498 = _476;
    }
    float _592 = _498;
    int _594 = _488 + 16;
    uint _596 = uint(int(uint(_594) >> uint(2)));
    _39[int(_596)] = as_type<uint>(_472);
    int _598 = _488 + 20;
    uint _600 = uint(int(uint(_598) >> uint(2)));
    _39[int(_600)] = as_type<uint>(_480);
    int _602 = _488 + 24;
    uint _604 = uint(int(uint(_602) >> uint(2)));
    _39[int(_604)] = as_type<uint>(_484);
    int _606 = _488 + 28;
    uint _608 = uint(int(uint(_606) >> uint(2)));
    _39[int(_608)] = as_type<uint>(_416);
    float _610 = _592;
    if (!_486)
    {
        _500 = _482;
    }
    float _612 = _500;
    float _614 = _612;
    if (!_486)
    {
        _502 = _472;
    }
    float _616 = _502;
    int _618 = _488 + 32;
    uint _620 = uint(int(uint(_618) >> uint(2)));
    _39[int(_620)] = as_type<uint>(_474);
    int _622 = _488 + 36;
    uint _624 = uint(int(uint(_622) >> uint(2)));
    _39[int(_624)] = as_type<uint>(_478);
    int _626 = _488 + 40;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    _39[int(_628)] = as_type<uint>(_490);
    int _630 = _488 + 44;
    uint _632 = uint(int(uint(_630) >> uint(2)));
    _39[int(_632)] = as_type<uint>(_418);
    float _634 = _616;
    if (!_486)
    {
        _504 = _484;
    }
    float _636 = _504;
    float _638 = _636;
    if (!_486)
    {
        _586 = _474;
    }
    float _640 = _586;
    float _642 = _640;
    if (!_486)
    {
        _588 = _478;
    }
    float _644 = _588;
    float _646 = _644;
    if (!_486)
    {
        _506 = _470;
    }
    float _648 = _506;
    float _650 = _648;
    if (!_486)
    {
        _508 = _480;
    }
    float _652 = _508;
    float _654 = _652;
    if (!_486)
    {
        _590 = _490;
    }
    float _656 = _590;
    bool _658 = !_486;
    float _660 = _656;
    if (!_658)
    {
        bool _662 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _664 = !_662;
        if (!_664)
        {
            uint _666 = uint(int(uint(_584) >> uint(2)));
            uint _668 = uint(int(uint(int(_666)) >> uint(2)));
            int _670 = int(_666) & 3;
            float _672 = (*spvDescriptorSet0.cp_c6)._m0[int(_668)][_670];
            int _674 = as_type<int>(_672) * 48;
            int _676 = 0;
            bool _678;
            float _774;
            float _778;
            float _782;
            float _786;
            float _800;
            float _802;
            float _814;
            float _824;
            float _826;
            float _828;
            float _830;
            float _832;
            do
            {
                int _680 = _676;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _682 = uint(int(uint(_674) >> uint(2)));
                float _684 = as_type<float>(_39[int(_682)]);
                int _686 = _674 + 4;
                uint _688 = uint(int(uint(_686) >> uint(2)));
                float _690 = as_type<float>(_39[int(_688)]);
                int _692 = _674 + 8;
                uint _694 = uint(int(uint(_692) >> uint(2)));
                float _696 = as_type<float>(_39[int(_694)]);
                int _698 = _674 + 12;
                uint _700 = uint(int(uint(_698) >> uint(2)));
                float _702 = as_type<float>(_39[int(_700)]);
                int _704 = _680 + 1;
                int _706 = _674 + 16;
                uint _708 = uint(int(uint(_706) >> uint(2)));
                float _710 = as_type<float>(_39[int(_708)]);
                int _712 = _674 + 20;
                uint _714 = uint(int(uint(_712) >> uint(2)));
                float _716 = as_type<float>(_39[int(_714)]);
                int _718 = _674 + 24;
                uint _720 = uint(int(uint(_718) >> uint(2)));
                float _722 = as_type<float>(_39[int(_720)]);
                int _724 = _674 + 28;
                uint _726 = uint(int(uint(_724) >> uint(2)));
                float _728 = as_type<float>(_39[int(_726)]);
                bool _730 = uint(_704) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _732 = _674 + 32;
                uint _734 = uint(int(uint(_732) >> uint(2)));
                float _736 = as_type<float>(_39[int(_734)]);
                int _738 = _674 + 36;
                uint _740 = uint(int(uint(_738) >> uint(2)));
                float _742 = as_type<float>(_39[int(_740)]);
                int _744 = _674 + 40;
                uint _746 = uint(int(uint(_744) >> uint(2)));
                float _748 = as_type<float>(_39[int(_746)]);
                int _750 = _674 + 44;
                uint _752 = uint(int(uint(_750) >> uint(2)));
                float _754 = as_type<float>(_39[int(_752)]);
                float _756 = _690 * _416;
                float _758 = _472 * _690;
                float _760 = _480 * _690;
                float _762 = _484 * _690;
                float _764 = fma(_684, _414, _756);
                float _766 = fma(_470, _684, _758);
                float _768 = fma(_476, _684, _760);
                float _770 = fma(_482, _684, _762);
                float _772 = fma(_696, _418, _764);
                _774 = fma(_474, _696, _766);
                float _776 = _472 * _716;
                _778 = fma(_490, _696, _770);
                float _780 = _716 * _416;
                _782 = _702 + _772;
                float _784 = _480 * _716;
                _786 = fma(_478, _696, _768);
                float _788 = fma(_710, _414, _780);
                float _790 = fma(_470, _710, _776);
                float _792 = fma(_476, _710, _784);
                float _794 = _484 * _716;
                float _796 = fma(_722, _418, _788);
                float _798 = _742 * _416;
                _800 = fma(_474, _722, _790);
                _802 = fma(_478, _722, _792);
                float _804 = _472 * _742;
                float _806 = _480 * _742;
                float _808 = _484 * _742;
                float _810 = fma(_736, _414, _798);
                float _812 = fma(_482, _710, _794);
                _814 = _728 + _796;
                float _816 = fma(_470, _736, _804);
                float _818 = fma(_476, _736, _806);
                float _820 = fma(_482, _736, _808);
                float _822 = fma(_748, _418, _810);
                _824 = fma(_490, _722, _812);
                _826 = fma(_474, _748, _816);
                _828 = fma(_478, _748, _818);
                _830 = fma(_490, _748, _820);
                _832 = _754 + _822;
                uint _834 = uint(int(uint(_488) >> uint(2)));
                _39[int(_834)] = as_type<uint>(_774);
                int _836 = _488 + 4;
                uint _838 = uint(int(uint(_836) >> uint(2)));
                _39[int(_838)] = as_type<uint>(_786);
                int _840 = _488 + 8;
                uint _842 = uint(int(uint(_840) >> uint(2)));
                _39[int(_842)] = as_type<uint>(_778);
                int _844 = _488 + 12;
                uint _846 = uint(int(uint(_844) >> uint(2)));
                _39[int(_846)] = as_type<uint>(_782);
                int _848 = _488 + 16;
                uint _850 = uint(int(uint(_848) >> uint(2)));
                _39[int(_850)] = as_type<uint>(_800);
                int _852 = _488 + 20;
                uint _854 = uint(int(uint(_852) >> uint(2)));
                _39[int(_854)] = as_type<uint>(_802);
                int _856 = _488 + 24;
                uint _858 = uint(int(uint(_856) >> uint(2)));
                _39[int(_858)] = as_type<uint>(_824);
                int _860 = _488 + 28;
                uint _862 = uint(int(uint(_860) >> uint(2)));
                _39[int(_862)] = as_type<uint>(_814);
                int _864 = _488 + 32;
                uint _866 = uint(int(uint(_864) >> uint(2)));
                _39[int(_866)] = as_type<uint>(_826);
                int _868 = _488 + 36;
                uint _870 = uint(int(uint(_868) >> uint(2)));
                _39[int(_870)] = as_type<uint>(_828);
                int _872 = _488 + 40;
                uint _874 = uint(int(uint(_872) >> uint(2)));
                _39[int(_874)] = as_type<uint>(_830);
                int _876 = _488 + 44;
                uint _878 = uint(int(uint(_876) >> uint(2)));
                _39[int(_878)] = as_type<uint>(_832);
                _678 = !_730;
                _676 = _704;
            } while (_678);
            _654 = _802;
            _646 = _828;
            _610 = _786;
            _634 = _800;
            _642 = _826;
            _650 = _774;
            _614 = _778;
            _638 = _824;
            _660 = _830;
            _510 = _814;
            _512 = _782;
            _514 = _832;
            _880 = true;
        }
        else
        {
            _654 = 0.0;
            _646 = 0.0;
            _610 = 0.0;
            _634 = 0.0;
            _642 = 0.0;
            _650 = 0.0;
            _614 = 0.0;
            _638 = 0.0;
            _660 = 0.0;
            _510 = 0.0;
            _512 = 0.0;
            _514 = 0.0;
        }
    }
    _880 = false;
    float _882 = _654;
    float _884 = _646;
    float _886 = _610;
    float _888 = _634;
    float _890 = _642;
    float _892 = _650;
    float _894 = _614;
    float _896 = _638;
    float _898 = _660;
    float _900 = _510;
    float _902 = _512;
    float _904 = _514;
    int _906 = _584 + 80;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.cp_c6)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.cp_c6)._m0[int(_918)][_920];
    int _924 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _926 = _924 + _66;
    int _928 = _584 + 64;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    uint _932 = uint(int(uint(int(_930)) >> uint(2)));
    int _934 = int(_930) & 3;
    float _936 = (*spvDescriptorSet0.cp_c6)._m0[int(_932)][_934];
    int _938 = int(_930) + 1;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    int _942 = _938 & 3;
    float _944 = (*spvDescriptorSet0.cp_c6)._m0[int(_940)][_942];
    int _946 = _926 * 48;
    int _948 = _584 + 88;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.cp_c6)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.cp_c6)._m0[int(_960)][_962];
    int _966 = _584 + 72;
    uint _968 = uint(int(uint(_966) >> uint(2)));
    uint _970 = uint(int(uint(int(_968)) >> uint(2)));
    int _972 = int(_968) & 3;
    float _974 = (*spvDescriptorSet0.cp_c6)._m0[int(_970)][_972];
    int _976 = int(_968) + 1;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    int _980 = _976 & 3;
    float _982 = (*spvDescriptorSet0.cp_c6)._m0[int(_978)][_980];
    int _984 = _584 + 96;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    uint _988 = uint(int(uint(int(_986)) >> uint(2)));
    int _990 = int(_986) & 3;
    float _992 = (*spvDescriptorSet0.cp_c6)._m0[int(_988)][_990];
    int _994 = int(_986) + 1;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    int _998 = _994 & 3;
    float _1000 = (*spvDescriptorSet0.cp_c6)._m0[int(_996)][_998];
    int _1002 = _584 + 104;
    uint _1004 = uint(int(uint(_1002) >> uint(2)));
    uint _1006 = uint(int(uint(int(_1004)) >> uint(2)));
    int _1008 = int(_1004) & 3;
    float _1010 = (*spvDescriptorSet0.cp_c6)._m0[int(_1006)][_1008];
    int _1012 = int(_1004) + 1;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    int _1016 = _1012 & 3;
    float _1018 = (*spvDescriptorSet0.cp_c6)._m0[int(_1014)][_1016];
    float _1020 = _882 * _914;
    float _1022 = _884 * _914;
    float _1024 = _884 * _922;
    int _1026 = _584 + 16;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.cp_c6)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.cp_c6)._m0[int(_1038)][_1040];
    float _1044 = _886 * _914;
    float _1046 = fma(_888, _936, _1020);
    float _1048 = _882 * _922;
    float _1050 = fma(_890, _936, _1022);
    int _1052 = _584 + 32;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    uint _1056 = uint(int(uint(int(_1054)) >> uint(2)));
    int _1058 = int(_1054) & 3;
    float _1060 = (*spvDescriptorSet0.cp_c6)._m0[int(_1056)][_1058];
    int _1062 = int(_1054) + 1;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    int _1066 = _1062 & 3;
    float _1068 = (*spvDescriptorSet0.cp_c6)._m0[int(_1064)][_1066];
    float _1070 = fma(_890, _944, _1024);
    float _1072 = _886 * _922;
    float _1074 = fma(_888, _944, _1048);
    float _1076 = fma(_892, _936, _1044);
    float _1078 = _886 * _956;
    float _1080 = _886 * _964;
    float _1082 = _882 * _956;
    int _1084 = _584 + 48;
    uint _1086 = uint(int(uint(_1084) >> uint(2)));
    uint _1088 = uint(int(uint(int(_1086)) >> uint(2)));
    int _1090 = int(_1086) & 3;
    float _1092 = (*spvDescriptorSet0.cp_c6)._m0[int(_1088)][_1090];
    int _1094 = int(_1086) + 1;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    int _1098 = _1094 & 3;
    float _1100 = (*spvDescriptorSet0.cp_c6)._m0[int(_1096)][_1098];
    float _1102 = _884 * _956;
    float _1104 = _882 * _964;
    float _1106 = _884 * _964;
    float _1108 = fma(_892, _944, _1072);
    float _1110 = fma(_892, _974, _1078);
    float _1112 = fma(_892, _982, _1080);
    float _1114 = fma(_888, _974, _1082);
    int _1116 = _584 + 24;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    uint _1120 = uint(int(uint(int(_1118)) >> uint(2)));
    int _1122 = int(_1118) & 3;
    float _1124 = (*spvDescriptorSet0.cp_c6)._m0[int(_1120)][_1122];
    int _1126 = int(_1118) + 1;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    int _1130 = _1126 & 3;
    float _1132 = (*spvDescriptorSet0.cp_c6)._m0[int(_1128)][_1130];
    float _1134 = fma(_888, _982, _1104);
    float _1136 = fma(_890, _974, _1102);
    float _1138 = fma(_890, _982, _1106);
    float _1140 = fma(_894, _992, _1076);
    float _1142 = fma(_896, _992, _1046);
    float _1144 = fma(_894, _1000, _1108);
    int _1146 = _584 + 40;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1152 = int(_1148) & 3;
    float _1154 = (*spvDescriptorSet0.cp_c6)._m0[int(_1150)][_1152];
    int _1156 = int(_1148) + 1;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    int _1160 = _1156 & 3;
    float _1162 = (*spvDescriptorSet0.cp_c6)._m0[int(_1158)][_1160];
    float _1164 = fma(_896, _1000, _1074);
    float _1166 = fma(_898, _992, _1050);
    float _1168 = fma(_898, _1000, _1070);
    float _1170 = fma(_896, _1010, _1114);
    float _1172 = fma(_896, _1018, _1134);
    float _1174 = fma(_894, _1018, _1112);
    int _1176 = _584 + 56;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
    int _1182 = int(_1178) & 3;
    float _1184 = (*spvDescriptorSet0.cp_c6)._m0[int(_1180)][_1182];
    int _1186 = int(_1178) + 1;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    int _1190 = _1186 & 3;
    float _1192 = (*spvDescriptorSet0.cp_c6)._m0[int(_1188)][_1190];
    float _1194 = fma(_898, _1018, _1138);
    float _1196 = _1172 + _900;
    float _1198 = fma(_898, _1010, _1136);
    float _1200 = _1174 + _902;
    float _1202 = _1194 + _904;
    float _1204 = fma(_894, _1010, _1110);
    float _1206 = _1196 * _1042;
    float _1208 = _1164 * _1042;
    float _1210 = _1142 * _1042;
    float _1212 = _1170 * _1042;
    float _1214 = fma(_1200, _1034, _1206);
    float _1216 = fma(_1144, _1034, _1208);
    float _1218 = fma(_1140, _1034, _1210);
    float _1220 = fma(_1204, _1034, _1212);
    float _1222 = _1196 * _1068;
    float _1224 = _1142 * _1068;
    float _1226 = _1164 * _1068;
    float _1228 = _1170 * _1068;
    float _1230 = fma(_1200, _1060, _1222);
    float _1232 = fma(_1140, _1060, _1224);
    float _1234 = fma(_1144, _1060, _1226);
    float _1236 = fma(_1204, _1060, _1228);
    float _1238 = _1196 * _1100;
    float _1240 = _1142 * _1100;
    float _1242 = _1164 * _1100;
    float _1244 = _1170 * _1100;
    float _1246 = fma(_1200, _1092, _1238);
    float _1248 = fma(_1140, _1092, _1240);
    float _1250 = fma(_1144, _1092, _1242);
    float _1252 = fma(_1204, _1092, _1244);
    float _1254 = fma(_1202, _1124, _1214);
    float _1256 = fma(_1168, _1124, _1216);
    float _1258 = fma(_1166, _1124, _1218);
    float _1260 = fma(_1198, _1124, _1220);
    float _1262 = _1254 + _1132;
    int _1264 = _946 + 16;
    int _1266 = _946 + 32;
    float _1268 = fma(_1202, _1154, _1230);
    float _1270 = fma(_1166, _1154, _1232);
    float _1272 = fma(_1168, _1154, _1234);
    float _1274 = fma(_1198, _1154, _1236);
    float _1276 = _1268 + _1162;
    int _1278 = _946 + 48;
    uint _1280 = uint(int(uint(_1264) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1280)] = as_type<uint>(_1258);
    int _1282 = _1264 + 4;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1284)] = as_type<uint>(_1256);
    int _1286 = _1264 + 8;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1288)] = as_type<uint>(_1260);
    int _1290 = _1264 + 12;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1292)] = as_type<uint>(_1262);
    float _1294 = fma(_1202, _1184, _1246);
    float _1296 = fma(_1166, _1184, _1248);
    float _1298 = fma(_1168, _1184, _1250);
    float _1300 = fma(_1198, _1184, _1252);
    float _1302 = _1294 + _1192;
    uint _1304 = uint(int(uint(_1266) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1304)] = as_type<uint>(_1270);
    int _1306 = _1266 + 4;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1308)] = as_type<uint>(_1272);
    int _1310 = _1266 + 8;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1312)] = as_type<uint>(_1274);
    int _1314 = _1266 + 12;
    uint _1316 = uint(int(uint(_1314) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1316)] = as_type<uint>(_1276);
    uint _1318 = uint(int(uint(_1278) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1318)] = as_type<uint>(_1296);
    int _1320 = _1278 + 4;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1322)] = as_type<uint>(_1298);
    int _1324 = _1278 + 8;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1326)] = as_type<uint>(_1300);
    int _1328 = _1278 + 12;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1330)] = as_type<uint>(_1302);
}

