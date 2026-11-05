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
int _56(thread const int& _3366, thread const int& _3367, constant _10& support_buffer)
{
    int _3370 = 1 + _3367;
    float _3372 = support_buffer._m5[_3370].x;
    bool _3374 = _3372 == 1.0;
    if (_3374)
    {
        return _3366;
    }
    float _3376 = float(_3366);
    float _3378 = _3376 * _3372;
    int _3380 = int(_3378);
    return _3380;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _794 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _72 = _62;
    if (_70)
    {
        return;
    }
    int _74 = _66 & 31;
    bool _76 = _74 == 0;
    bool _78 = uint(_74) < 32u;
    int _80 = 32 - _74;
    int _82 = _74 - 32;
    int _84 = 1 << _74;
    uint _87 = uint(int(uint(0) >> uint(_80)));
    int _89 = _84 | int(_87);
    int _91 = _76 ? 1 : _89;
    bool _93 = uint(_82) < 32u;
    int _95 = 0 << _82;
    int _97 = _93 ? _95 : 0;
    float _99 = _78 ? as_type<float>(_91) : as_type<float>(_97);
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = as_type<int>(_99) & as_type<int>(_111);
    bool _115 = _113 != 0;
    float _117 = 0.0;
    int _119 = 0;
    float _121 = _99;
    if (!_115)
    {
        _117 = 0.0;
        _119 = 0;
    }
    float _123 = _117;
    int _125 = _119;
    float _127 = 0.0;
    int _129 = 0;
    float _131 = _123;
    int _133 = _125;
    if (!_115)
    {
        _127 = 0.0;
        _129 = 0;
    }
    float _135 = _127;
    int _137 = _129;
    float _139 = 0.0;
    int _141 = 0;
    float _143 = _135;
    int _145 = _137;
    if (!_115)
    {
        _139 = 0.0;
        _141 = 0;
    }
    float _147 = _139;
    int _149 = _141;
    float _151 = 0.0;
    float _153 = _147;
    int _155 = _149;
    if (!_115)
    {
        _151 = 0.0;
    }
    float _157 = _151;
    float _159 = _157;
    if (!_115)
    {
        _121 = 0.0;
        _72 = 0.0;
    }
    float _161 = _121;
    float _163 = _72;
    float _165 = 0.0;
    float _167 = _163;
    float _169 = _161;
    if (!_115)
    {
        _165 = 0.0;
    }
    float _171 = _165;
    bool _173 = !_115;
    float _175 = _171;
    float _177 = 0.0;
    if (!_173)
    {
        uint _179 = uint(int(uint(_101) >> uint(2)));
        uint _181 = uint(int(uint(int(_179)) >> uint(2)));
        int _183 = int(_179) & 3;
        float _185 = (*spvDescriptorSet0.cp_c5)._m0[int(_181)][_183];
        int _187 = int(_179) + 1;
        uint _189 = uint(int(uint(_187) >> uint(2)));
        int _191 = _187 & 3;
        float _193 = (*spvDescriptorSet0.cp_c5)._m0[int(_189)][_191];
        int _195 = _66;
        int _197 = 0;
        int _199 = _56(_195, _197, (*spvDescriptorSet0.support_buffer));
        int _201 = as_type<int>(_185);
        int _203 = 0;
        int _205 = _56(_201, _203, (*spvDescriptorSet0.support_buffer));
        int3 _1477 = int3(_199, _205, 1);
        float4 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1477.xy), uint(_1477.z), 0).xyzw;
        float _210 = _208.x;
        float _212 = _208.y;
        float _214 = _208.z;
        float _216 = _208.w;
        int _218 = _66;
        int _220 = 0;
        int _222 = _56(_218, _220, (*spvDescriptorSet0.support_buffer));
        int _224 = as_type<int>(_193);
        int _226 = 0;
        int _228 = _56(_224, _226, (*spvDescriptorSet0.support_buffer));
        int3 _1497 = int3(_222, _228, 1);
        float4 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1497.xy), uint(_1497.z), 0).xyzw;
        float _232 = _230.x;
        float _234 = _230.y;
        float _236 = _230.z;
        float _238 = _230.w;
        int _240 = _66;
        int _242 = 0;
        int _244 = _56(_240, _242, (*spvDescriptorSet0.support_buffer));
        int _246 = as_type<int>(_185);
        int _248 = 0;
        int _250 = _56(_246, _248, (*spvDescriptorSet0.support_buffer));
        int3 _1517 = int3(_244, _250, 0);
        float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1517.xy), uint(_1517.z), 0).xyz;
        float _256 = _254.x;
        float _258 = _254.y;
        float _260 = _254.z;
        int _262 = _66;
        int _264 = 0;
        int _266 = _56(_262, _264, (*spvDescriptorSet0.support_buffer));
        int _268 = as_type<int>(_193);
        int _270 = 0;
        int _272 = _56(_268, _270, (*spvDescriptorSet0.support_buffer));
        int3 _1535 = int3(_266, _272, 0);
        float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1535.xy), uint(_1535.z), 0).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        int _282 = _66;
        int _284 = 0;
        int _286 = _56(_282, _284, (*spvDescriptorSet0.support_buffer));
        int _288 = as_type<int>(_185);
        int _290 = 0;
        int _292 = _56(_288, _290, (*spvDescriptorSet0.support_buffer));
        int3 _1553 = int3(_286, _292, 2);
        float3 _294 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1553.xy), uint(_1553.z), 0).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        int _302 = _66;
        int _304 = 0;
        int _306 = _56(_302, _304, (*spvDescriptorSet0.support_buffer));
        int _308 = as_type<int>(_193);
        int _310 = 0;
        int _312 = _56(_308, _310, (*spvDescriptorSet0.support_buffer));
        int3 _1571 = int3(_306, _312, 2);
        float3 _314 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1571.xy), uint(_1571.z), 0).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        int _322 = _101 + 16;
        uint _324 = uint(int(uint(_322) >> uint(2)));
        uint _326 = uint(int(uint(int(_324)) >> uint(2)));
        int _328 = int(_324) & 3;
        float _330 = (*spvDescriptorSet0.cp_c5)._m0[int(_326)][_328];
        float _332 = -_210;
        float _334 = _332 + _232;
        float _336 = -_212;
        float _338 = _336 + _234;
        float _340 = -_214;
        float _342 = _340 + _236;
        float _344 = fma(_334, _330, _210);
        float _346 = fma(_338, _330, _212);
        float _348 = -_216;
        float _350 = _348 + _238;
        float _352 = -_258;
        float _354 = _352 + _278;
        float _356 = fma(_342, _330, _214);
        float _358 = -_256;
        float _360 = _358 + _276;
        float _362 = fma(_350, _330, _216);
        float _364 = fma(_354, _330, _258);
        float _366 = -_260;
        float _368 = _366 + _280;
        float _370 = -_296;
        float _372 = _370 + _316;
        float _374 = -_298;
        float _376 = _374 + _318;
        float _378 = -_300;
        float _380 = _378 + _320;
        float _382 = fma(_360, _330, _256);
        float _384 = fma(_368, _330, _260);
        float _386 = fma(_372, _330, _296);
        float _388 = fma(_376, _330, _298);
        float _390 = fma(_380, _330, _300);
        float _392 = _362 * 2.0;
        _159 = _344;
        _167 = _356;
        _169 = _392;
        _175 = _346;
        _131 = _382;
        _143 = _364;
        _153 = _384;
        _145 = as_type<int>(_386);
        _133 = as_type<int>(_388);
        _155 = as_type<int>(_390);
        _177 = _300;
    }
    float _394 = _159;
    float _396 = _167;
    float _398 = _169;
    float _400 = _175;
    float _402 = _131;
    float _404 = _143;
    float _406 = _153;
    int _408 = _145;
    int _410 = _133;
    int _412 = _155;
    float _414 = _177;
    float _416 = _394 * 2.0;
    float _418 = _396 * _398;
    float _420 = _400 * _398;
    int _422 = _66 * 48;
    float _424 = -_418;
    float _426 = fma(_416, _400, _424);
    float _428 = fma(_416, _400, _418);
    float _430 = _394 * _398;
    float _432 = _400 * _400;
    float _434 = _394 * _394;
    float _436 = fma(_416, _396, _420);
    float _438 = -_420;
    float _440 = fma(_416, _396, _438);
    float _442 = _400 * 2.0;
    float _444 = _396 * _396;
    float _446 = fma(_432, -2.0, 1.0);
    float _448 = fma(_434, -2.0, 1.0);
    float _450 = -_430;
    float _452 = fma(_442, _396, _450);
    float _454 = fma(_442, _396, _430);
    float _456 = fma(_444, -2.0, _446);
    float _458 = fma(_444, -2.0, _448);
    float _460 = fma(_432, -2.0, _448);
    float _462 = _428 * _402;
    float _464 = _456 * _402;
    float _466 = _440 * _402;
    float _468 = _426 * _404;
    float _470 = _454 * _404;
    float _472 = _458 * _404;
    float _474 = _436 * _406;
    float _476 = _452 * _406;
    float _478 = _460 * _406;
    bool _480 = _66 != 0;
    uint _482 = uint(int(uint(_422) >> uint(2)));
    _39[int(_482)] = as_type<uint>(_464);
    int _484 = _422 + 4;
    uint _486 = uint(int(uint(_484) >> uint(2)));
    _39[int(_486)] = as_type<uint>(_468);
    int _488 = _422 + 8;
    uint _490 = uint(int(uint(_488) >> uint(2)));
    _39[int(_490)] = as_type<uint>(_474);
    int _492 = _422 + 12;
    uint _494 = uint(int(uint(_492) >> uint(2)));
    _39[int(_494)] = uint(_408);
    int _496 = _66 * 112;
    int _498 = _422 + 16;
    int _500 = _422 + 16;
    uint _502 = uint(int(uint(_500) >> uint(2)));
    _39[int(_502)] = as_type<uint>(_462);
    int _504 = _422 + 20;
    uint _506 = uint(int(uint(_504) >> uint(2)));
    _39[int(_506)] = as_type<uint>(_472);
    int _508 = _422 + 24;
    uint _510 = uint(int(uint(_508) >> uint(2)));
    _39[int(_510)] = as_type<uint>(_476);
    int _512 = _422 + 28;
    uint _514 = uint(int(uint(_512) >> uint(2)));
    _39[int(_514)] = uint(_410);
    int _516 = _422 + 32;
    int _518 = _422 + 32;
    uint _520 = uint(int(uint(_518) >> uint(2)));
    _39[int(_520)] = as_type<uint>(_466);
    int _522 = _422 + 36;
    uint _524 = uint(int(uint(_522) >> uint(2)));
    _39[int(_524)] = as_type<uint>(_470);
    int _526 = _422 + 40;
    uint _528 = uint(int(uint(_526) >> uint(2)));
    _39[int(_528)] = as_type<uint>(_478);
    int _530 = _422 + 44;
    uint _532 = uint(int(uint(_530) >> uint(2)));
    _39[int(_532)] = uint(_412);
    float _534 = _426;
    float _536 = _458;
    float _538 = _414;
    float _540 = 2.0;
    float _542 = _462;
    float _544 = _472;
    float _546 = _476;
    float _548 = as_type<float>(_410);
    float _550 = _466;
    float _552 = _470;
    float _554 = _478;
    float _556 = as_type<float>(_412);
    if (!_480)
    {
        _534 = as_type<float>(_408);
    }
    float _558 = _534;
    float _560 = _558;
    if (!_480)
    {
        _536 = _468;
    }
    float _562 = _536;
    float _564 = _562;
    if (!_480)
    {
        _538 = _474;
    }
    float _566 = _538;
    float _568 = _566;
    if (!_480)
    {
        _540 = _464;
    }
    float _570 = _540;
    bool _572 = !_480;
    float _574 = _570;
    if (!_572)
    {
        bool _576 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _578 = !_576;
        if (!_578)
        {
            uint _580 = uint(int(uint(_496) >> uint(2)));
            uint _582 = uint(int(uint(int(_580)) >> uint(2)));
            int _584 = int(_580) & 3;
            float _586 = (*spvDescriptorSet0.cp_c6)._m0[int(_582)][_584];
            int _588 = as_type<int>(_586) * 48;
            int _590 = 0;
            bool _592;
            float _688;
            float _690;
            float _692;
            float _700;
            float _714;
            float _716;
            float _728;
            float _738;
            float _740;
            float _742;
            float _744;
            float _746;
            do
            {
                int _594 = _590;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _596 = uint(int(uint(_588) >> uint(2)));
                float _598 = as_type<float>(_39[int(_596)]);
                int _600 = _588 + 4;
                uint _602 = uint(int(uint(_600) >> uint(2)));
                float _604 = as_type<float>(_39[int(_602)]);
                int _606 = _588 + 8;
                uint _608 = uint(int(uint(_606) >> uint(2)));
                float _610 = as_type<float>(_39[int(_608)]);
                int _612 = _588 + 12;
                uint _614 = uint(int(uint(_612) >> uint(2)));
                float _616 = as_type<float>(_39[int(_614)]);
                int _618 = _594 + 1;
                int _620 = _588 + 16;
                uint _622 = uint(int(uint(_620) >> uint(2)));
                float _624 = as_type<float>(_39[int(_622)]);
                int _626 = _588 + 20;
                uint _628 = uint(int(uint(_626) >> uint(2)));
                float _630 = as_type<float>(_39[int(_628)]);
                int _632 = _588 + 24;
                uint _634 = uint(int(uint(_632) >> uint(2)));
                float _636 = as_type<float>(_39[int(_634)]);
                int _638 = _588 + 28;
                uint _640 = uint(int(uint(_638) >> uint(2)));
                float _642 = as_type<float>(_39[int(_640)]);
                bool _644 = uint(_618) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _646 = _588 + 32;
                uint _648 = uint(int(uint(_646) >> uint(2)));
                float _650 = as_type<float>(_39[int(_648)]);
                int _652 = _588 + 36;
                uint _654 = uint(int(uint(_652) >> uint(2)));
                float _656 = as_type<float>(_39[int(_654)]);
                int _658 = _588 + 40;
                uint _660 = uint(int(uint(_658) >> uint(2)));
                float _662 = as_type<float>(_39[int(_660)]);
                int _664 = _588 + 44;
                uint _666 = uint(int(uint(_664) >> uint(2)));
                float _668 = as_type<float>(_39[int(_666)]);
                float _670 = _604 * as_type<float>(_410);
                float _672 = _462 * _604;
                float _674 = _472 * _604;
                float _676 = _476 * _604;
                float _678 = fma(_598, as_type<float>(_408), _670);
                float _680 = fma(_464, _598, _672);
                float _682 = fma(_468, _598, _674);
                float _684 = fma(_474, _598, _676);
                float _686 = fma(_610, as_type<float>(_412), _678);
                _688 = fma(_466, _610, _680);
                _690 = fma(_470, _610, _682);
                _692 = fma(_478, _610, _684);
                float _694 = _630 * as_type<float>(_410);
                float _696 = _462 * _630;
                float _698 = _472 * _630;
                _700 = _616 + _686;
                float _702 = fma(_624, as_type<float>(_408), _694);
                float _704 = fma(_464, _624, _696);
                float _706 = fma(_468, _624, _698);
                float _708 = _476 * _630;
                float _710 = fma(_636, as_type<float>(_412), _702);
                float _712 = _656 * as_type<float>(_410);
                _714 = fma(_466, _636, _704);
                _716 = fma(_470, _636, _706);
                float _718 = _462 * _656;
                float _720 = _472 * _656;
                float _722 = _476 * _656;
                float _724 = fma(_650, as_type<float>(_408), _712);
                float _726 = fma(_474, _624, _708);
                _728 = _642 + _710;
                float _730 = fma(_464, _650, _718);
                float _732 = fma(_468, _650, _720);
                float _734 = fma(_474, _650, _722);
                float _736 = fma(_662, as_type<float>(_412), _724);
                _738 = fma(_478, _636, _726);
                _740 = fma(_466, _662, _730);
                _742 = fma(_470, _662, _732);
                _744 = fma(_478, _662, _734);
                _746 = _668 + _736;
                uint _748 = uint(int(uint(_422) >> uint(2)));
                _39[int(_748)] = as_type<uint>(_688);
                int _750 = _422 + 4;
                uint _752 = uint(int(uint(_750) >> uint(2)));
                _39[int(_752)] = as_type<uint>(_690);
                int _754 = _422 + 8;
                uint _756 = uint(int(uint(_754) >> uint(2)));
                _39[int(_756)] = as_type<uint>(_692);
                int _758 = _422 + 12;
                uint _760 = uint(int(uint(_758) >> uint(2)));
                _39[int(_760)] = as_type<uint>(_700);
                int _762 = _422 + 16;
                uint _764 = uint(int(uint(_762) >> uint(2)));
                _39[int(_764)] = as_type<uint>(_714);
                int _766 = _422 + 20;
                uint _768 = uint(int(uint(_766) >> uint(2)));
                _39[int(_768)] = as_type<uint>(_716);
                int _770 = _422 + 24;
                uint _772 = uint(int(uint(_770) >> uint(2)));
                _39[int(_772)] = as_type<uint>(_738);
                int _774 = _422 + 28;
                uint _776 = uint(int(uint(_774) >> uint(2)));
                _39[int(_776)] = as_type<uint>(_728);
                int _778 = _422 + 32;
                uint _780 = uint(int(uint(_778) >> uint(2)));
                _39[int(_780)] = as_type<uint>(_740);
                int _782 = _422 + 36;
                uint _784 = uint(int(uint(_782) >> uint(2)));
                _39[int(_784)] = as_type<uint>(_742);
                int _786 = _422 + 40;
                uint _788 = uint(int(uint(_786) >> uint(2)));
                _39[int(_788)] = as_type<uint>(_744);
                int _790 = _422 + 44;
                uint _792 = uint(int(uint(_790) >> uint(2)));
                _39[int(_792)] = as_type<uint>(_746);
                _592 = !_644;
                _590 = _618;
            } while (_592);
            _574 = _688;
            _564 = _690;
            _568 = _692;
            _560 = _700;
            _542 = _714;
            _544 = _716;
            _546 = _738;
            _548 = _728;
            _550 = _740;
            _552 = _742;
            _554 = _744;
            _556 = _746;
            _794 = true;
        }
        else
        {
            _574 = 0.0;
            _564 = 0.0;
            _568 = 0.0;
            _560 = 0.0;
            _542 = 0.0;
            _544 = 0.0;
            _546 = 0.0;
            _548 = 0.0;
            _550 = 0.0;
            _552 = 0.0;
            _554 = 0.0;
            _556 = 0.0;
        }
    }
    _794 = false;
    float _796 = _574;
    float _798 = _564;
    float _800 = _568;
    float _802 = _560;
    float _804 = _542;
    float _806 = _544;
    float _808 = _546;
    float _810 = _548;
    float _812 = _550;
    float _814 = _552;
    float _816 = _554;
    float _818 = _556;
    int _820 = _496 + 80;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.cp_c6)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.cp_c6)._m0[int(_832)][_834];
    bool _838 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _840 = _496 + 64;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    uint _844 = uint(int(uint(int(_842)) >> uint(2)));
    int _846 = int(_842) & 3;
    float _848 = (*spvDescriptorSet0.cp_c6)._m0[int(_844)][_846];
    int _850 = int(_842) + 1;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    int _854 = _850 & 3;
    float _856 = (*spvDescriptorSet0.cp_c6)._m0[int(_852)][_854];
    int _858 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _860 = _858 + _66;
    int _862 = _496 + 88;
    uint _864 = uint(int(uint(_862) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.cp_c6)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.cp_c6)._m0[int(_874)][_876];
    int _880 = _496 + 72;
    uint _882 = uint(int(uint(_880) >> uint(2)));
    uint _884 = uint(int(uint(int(_882)) >> uint(2)));
    int _886 = int(_882) & 3;
    float _888 = (*spvDescriptorSet0.cp_c6)._m0[int(_884)][_886];
    int _890 = int(_882) + 1;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    int _894 = _890 & 3;
    float _896 = (*spvDescriptorSet0.cp_c6)._m0[int(_892)][_894];
    int _898 = _496 + 96;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    uint _902 = uint(int(uint(int(_900)) >> uint(2)));
    int _904 = int(_900) & 3;
    float _906 = (*spvDescriptorSet0.cp_c6)._m0[int(_902)][_904];
    int _908 = int(_900) + 1;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    int _912 = _908 & 3;
    float _914 = (*spvDescriptorSet0.cp_c6)._m0[int(_910)][_912];
    int _916 = _496 + 104;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    uint _920 = uint(int(uint(int(_918)) >> uint(2)));
    int _922 = int(_918) & 3;
    float _924 = (*spvDescriptorSet0.cp_c6)._m0[int(_920)][_922];
    int _926 = int(_918) + 1;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    int _930 = _926 & 3;
    float _932 = (*spvDescriptorSet0.cp_c6)._m0[int(_928)][_930];
    int _934 = _496 + 16;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    uint _938 = uint(int(uint(int(_936)) >> uint(2)));
    int _940 = int(_936) & 3;
    float _942 = (*spvDescriptorSet0.cp_c6)._m0[int(_938)][_940];
    int _944 = int(_936) + 1;
    uint _946 = uint(int(uint(_944) >> uint(2)));
    int _948 = _944 & 3;
    float _950 = (*spvDescriptorSet0.cp_c6)._m0[int(_946)][_948];
    if (!_838)
    {
        uint _952 = uint(int(uint(_422) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_952)] = as_type<uint>(_796);
        int _954 = _422 + 4;
        uint _956 = uint(int(uint(_954) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_956)] = as_type<uint>(_798);
        int _958 = _422 + 8;
        uint _960 = uint(int(uint(_958) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_960)] = as_type<uint>(_800);
        int _962 = _422 + 12;
        uint _964 = uint(int(uint(_962) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_964)] = as_type<uint>(_802);
        uint _966 = uint(int(uint(_498) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_966)] = as_type<uint>(_804);
        int _968 = _498 + 4;
        uint _970 = uint(int(uint(_968) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_970)] = as_type<uint>(_806);
        int _972 = _498 + 8;
        uint _974 = uint(int(uint(_972) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_974)] = as_type<uint>(_808);
        int _976 = _498 + 12;
        uint _978 = uint(int(uint(_976) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_978)] = as_type<uint>(_810);
        uint _980 = uint(int(uint(_516) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_980)] = as_type<uint>(_812);
        int _982 = _516 + 4;
        uint _984 = uint(int(uint(_982) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_984)] = as_type<uint>(_814);
        int _986 = _516 + 8;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_988)] = as_type<uint>(_816);
        int _990 = _516 + 12;
        uint _992 = uint(int(uint(_990) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_992)] = as_type<uint>(_818);
    }
    float _994 = _806 * _828;
    float _996 = _814 * _828;
    int _998 = _496 + 32;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
    int _1004 = int(_1000) & 3;
    float _1006 = (*spvDescriptorSet0.cp_c6)._m0[int(_1002)][_1004];
    int _1008 = int(_1000) + 1;
    uint _1010 = uint(int(uint(_1008) >> uint(2)));
    int _1012 = _1008 & 3;
    float _1014 = (*spvDescriptorSet0.cp_c6)._m0[int(_1010)][_1012];
    float _1016 = _798 * _828;
    float _1018 = fma(_804, _848, _994);
    float _1020 = fma(_812, _848, _996);
    float _1022 = _798 * _836;
    float _1024 = _806 * _836;
    float _1026 = _814 * _836;
    float _1028 = _798 * _878;
    int _1030 = _496 + 48;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    uint _1034 = uint(int(uint(int(_1032)) >> uint(2)));
    int _1036 = int(_1032) & 3;
    float _1038 = (*spvDescriptorSet0.cp_c6)._m0[int(_1034)][_1036];
    int _1040 = int(_1032) + 1;
    uint _1042 = uint(int(uint(_1040) >> uint(2)));
    int _1044 = _1040 & 3;
    float _1046 = (*spvDescriptorSet0.cp_c6)._m0[int(_1042)][_1044];
    float _1048 = fma(_796, _856, _1022);
    float _1050 = fma(_804, _856, _1024);
    float _1052 = fma(_812, _856, _1026);
    float _1054 = _798 * _870;
    float _1056 = _814 * _870;
    float _1058 = _806 * _870;
    float _1060 = _806 * _878;
    float _1062 = _814 * _878;
    float _1064 = fma(_796, _888, _1054);
    int _1066 = _496 + 24;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    uint _1070 = uint(int(uint(int(_1068)) >> uint(2)));
    int _1072 = int(_1068) & 3;
    float _1074 = (*spvDescriptorSet0.cp_c6)._m0[int(_1070)][_1072];
    int _1076 = int(_1068) + 1;
    uint _1078 = uint(int(uint(_1076) >> uint(2)));
    int _1080 = _1076 & 3;
    float _1082 = (*spvDescriptorSet0.cp_c6)._m0[int(_1078)][_1080];
    float _1084 = fma(_796, _896, _1028);
    float _1086 = fma(_804, _888, _1058);
    float _1088 = fma(_804, _896, _1060);
    float _1090 = fma(_812, _888, _1056);
    float _1092 = fma(_812, _896, _1062);
    float _1094 = fma(_800, _932, _1084);
    float _1096 = fma(_808, _932, _1088);
    int _1098 = _496 + 40;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    uint _1102 = uint(int(uint(int(_1100)) >> uint(2)));
    int _1104 = int(_1100) & 3;
    float _1106 = (*spvDescriptorSet0.cp_c6)._m0[int(_1102)][_1104];
    int _1108 = int(_1100) + 1;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    int _1112 = _1108 & 3;
    float _1114 = (*spvDescriptorSet0.cp_c6)._m0[int(_1110)][_1112];
    float _1116 = fma(_800, _914, _1048);
    float _1118 = fma(_796, _848, _1016);
    float _1120 = _1096 + _810;
    float _1122 = fma(_808, _906, _1018);
    float _1124 = fma(_808, _914, _1050);
    float _1126 = fma(_808, _924, _1086);
    float _1128 = fma(_816, _932, _1092);
    int _1130 = _496 + 56;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
    int _1136 = int(_1132) & 3;
    float _1138 = (*spvDescriptorSet0.cp_c6)._m0[int(_1134)][_1136];
    int _1140 = int(_1132) + 1;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    int _1144 = _1140 & 3;
    float _1146 = (*spvDescriptorSet0.cp_c6)._m0[int(_1142)][_1144];
    float _1148 = _1094 + _802;
    float _1150 = _1120 * _950;
    float _1152 = fma(_800, _906, _1118);
    float _1154 = fma(_816, _906, _1020);
    float _1156 = fma(_816, _914, _1052);
    float _1158 = fma(_816, _924, _1090);
    float _1160 = _1128 + _818;
    float _1162 = _1122 * _950;
    float _1164 = fma(_1148, _942, _1150);
    float _1166 = fma(_800, _924, _1064);
    float _1168 = _1124 * _950;
    float _1170 = _1126 * _950;
    float _1172 = fma(_1152, _942, _1162);
    float _1174 = _1120 * _1014;
    float _1176 = _1122 * _1014;
    float _1178 = _1124 * _1014;
    float _1180 = _1126 * _1014;
    float _1182 = fma(_1148, _1006, _1174);
    int _1184 = _860 * 48;
    float _1186 = fma(_1116, _942, _1168);
    float _1188 = fma(_1166, _942, _1170);
    float _1190 = _1120 * _1046;
    float _1192 = _1122 * _1046;
    float _1194 = _1124 * _1046;
    float _1196 = _1126 * _1046;
    float _1198 = fma(_1148, _1038, _1190);
    float _1200 = fma(_1152, _1006, _1176);
    float _1202 = fma(_1116, _1006, _1178);
    float _1204 = fma(_1166, _1006, _1180);
    float _1206 = fma(_1152, _1038, _1192);
    float _1208 = fma(_1116, _1038, _1194);
    float _1210 = fma(_1160, _1074, _1164);
    float _1212 = fma(_1166, _1038, _1196);
    float _1214 = fma(_1154, _1074, _1172);
    float _1216 = fma(_1156, _1074, _1186);
    float _1218 = _1210 + _1082;
    float _1220 = fma(_1158, _1074, _1188);
    int _1222 = _1184 + 16;
    float _1224 = fma(_1160, _1106, _1182);
    float _1226 = fma(_1154, _1106, _1200);
    float _1228 = fma(_1156, _1106, _1202);
    float _1230 = fma(_1158, _1106, _1204);
    float _1232 = _1224 + _1114;
    int _1234 = _1184 + 32;
    uint _1236 = uint(int(uint(_1222) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1236)] = as_type<uint>(_1214);
    int _1238 = _1222 + 4;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1240)] = as_type<uint>(_1216);
    int _1242 = _1222 + 8;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1244)] = as_type<uint>(_1220);
    int _1246 = _1222 + 12;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1248)] = as_type<uint>(_1218);
    int _1250 = _1184 + 48;
    float _1252 = fma(_1160, _1138, _1198);
    float _1254 = fma(_1154, _1138, _1206);
    float _1256 = fma(_1156, _1138, _1208);
    float _1258 = fma(_1158, _1138, _1212);
    float _1260 = _1252 + _1146;
    uint _1262 = uint(int(uint(_1234) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1262)] = as_type<uint>(_1226);
    int _1264 = _1234 + 4;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1266)] = as_type<uint>(_1228);
    int _1268 = _1234 + 8;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1270)] = as_type<uint>(_1230);
    int _1272 = _1234 + 12;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1274)] = as_type<uint>(_1232);
    uint _1276 = uint(int(uint(_1250) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1276)] = as_type<uint>(_1254);
    int _1278 = _1250 + 4;
    uint _1280 = uint(int(uint(_1278) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1280)] = as_type<uint>(_1256);
    int _1282 = _1250 + 8;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1284)] = as_type<uint>(_1258);
    int _1286 = _1250 + 12;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1288)] = as_type<uint>(_1260);
}

