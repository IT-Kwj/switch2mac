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
int _54(thread const int& _3259, thread const int& _3260, constant _10& support_buffer)
{
    int _3263 = 1 + _3260;
    float _3265 = support_buffer._m5[_3263].x;
    bool _3267 = _3265 == 1.0;
    if (_3267)
    {
        return _3259;
    }
    float _3269 = float(_3259);
    float _3271 = _3269 * _3265;
    int _3273 = int(_3271);
    return _3273;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _820 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = _64 & 31;
    bool _72 = _70 == 0;
    bool _74 = uint(_70) < 32u;
    int _76 = 32 - _70;
    int _78 = _70 - 32;
    int _80 = 1 << _70;
    uint _83 = uint(int(uint(0) >> uint(_76)));
    int _85 = _80 | int(_83);
    int _87 = _72 ? 1 : _85;
    bool _89 = uint(_78) < 32u;
    int _91 = 0 << _78;
    int _93 = _89 ? _91 : 0;
    float _95 = _74 ? as_type<float>(_87) : as_type<float>(_93);
    int _97 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _99 = _97 + 32;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.cp_c5)._m0[int(_103)][_105];
    int _109 = as_type<int>(_95) & as_type<int>(_107);
    bool _111 = _109 != 0;
    float _113 = 0.0;
    int _115 = 0;
    float _117 = _95;
    if (!_111)
    {
        _113 = 0.0;
        _115 = 0;
    }
    float _119 = _113;
    int _121 = _115;
    float _123 = 0.0;
    int _125 = 0;
    float _127 = _119;
    int _129 = _121;
    if (!_111)
    {
        _123 = 0.0;
        _125 = 0;
    }
    float _131 = _123;
    int _133 = _125;
    float _135 = 0.0;
    int _137 = 0;
    float _139 = _131;
    int _141 = _133;
    if (!_111)
    {
        _135 = 0.0;
        _137 = 0;
    }
    float _143 = _135;
    int _145 = _137;
    float _147 = 0.0;
    float _149 = _143;
    int _151 = _145;
    if (!_111)
    {
        _147 = 0.0;
    }
    float _153 = _147;
    float _155 = 0.0;
    float _157 = _153;
    if (!_111)
    {
        _117 = 0.0;
        _155 = 0.0;
    }
    float _159 = _117;
    float _161 = _155;
    float _163 = 0.0;
    float _165 = _161;
    float _167 = _159;
    if (!_111)
    {
        _163 = 0.0;
    }
    float _169 = _163;
    bool _171 = !_111;
    float _173 = _169;
    float _175 = 0.0;
    float _177 = 0.0;
    float _179 = 0.0;
    float _181 = 0.0;
    if (!_171)
    {
        uint _183 = uint(int(uint(_97) >> uint(2)));
        uint _185 = uint(int(uint(int(_183)) >> uint(2)));
        int _187 = int(_183) & 3;
        float _189 = (*spvDescriptorSet0.cp_c5)._m0[int(_185)][_187];
        int _191 = int(_183) + 1;
        uint _193 = uint(int(uint(_191) >> uint(2)));
        int _195 = _191 & 3;
        float _197 = (*spvDescriptorSet0.cp_c5)._m0[int(_193)][_195];
        int _199 = _64;
        int _201 = 0;
        int _203 = _54(_199, _201, (*spvDescriptorSet0.support_buffer));
        int _205 = as_type<int>(_189);
        int _207 = 0;
        int _209 = _54(_205, _207, (*spvDescriptorSet0.support_buffer));
        int3 _1458 = int3(_203, _209, 1);
        float4 _212 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1458.xy), uint(_1458.z), 0).xyzw;
        float _214 = _212.x;
        float _216 = _212.y;
        float _218 = _212.z;
        float _220 = _212.w;
        int _222 = _64;
        int _224 = 0;
        int _226 = _54(_222, _224, (*spvDescriptorSet0.support_buffer));
        int _228 = as_type<int>(_197);
        int _230 = 0;
        int _232 = _54(_228, _230, (*spvDescriptorSet0.support_buffer));
        int3 _1478 = int3(_226, _232, 1);
        float4 _234 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1478.xy), uint(_1478.z), 0).xyzw;
        float _236 = _234.x;
        float _238 = _234.y;
        float _240 = _234.z;
        float _242 = _234.w;
        int _244 = _64;
        int _246 = 0;
        int _248 = _54(_244, _246, (*spvDescriptorSet0.support_buffer));
        int _250 = as_type<int>(_189);
        int _252 = 0;
        int _254 = _54(_250, _252, (*spvDescriptorSet0.support_buffer));
        int3 _1498 = int3(_248, _254, 0);
        float3 _258 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1498.xy), uint(_1498.z), 0).xyz;
        float _260 = _258.x;
        float _262 = _258.y;
        float _264 = _258.z;
        int _266 = _64;
        int _268 = 0;
        int _270 = _54(_266, _268, (*spvDescriptorSet0.support_buffer));
        int _272 = as_type<int>(_197);
        int _274 = 0;
        int _276 = _54(_272, _274, (*spvDescriptorSet0.support_buffer));
        int3 _1516 = int3(_270, _276, 0);
        float3 _278 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1516.xy), uint(_1516.z), 0).xyz;
        float _280 = _278.x;
        float _282 = _278.y;
        float _284 = _278.z;
        int _286 = _64;
        int _288 = 0;
        int _290 = _54(_286, _288, (*spvDescriptorSet0.support_buffer));
        int _292 = as_type<int>(_189);
        int _294 = 0;
        int _296 = _54(_292, _294, (*spvDescriptorSet0.support_buffer));
        int3 _1534 = int3(_290, _296, 2);
        float3 _298 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1534.xy), uint(_1534.z), 0).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        int _306 = _64;
        int _308 = 0;
        int _310 = _54(_306, _308, (*spvDescriptorSet0.support_buffer));
        int _312 = as_type<int>(_197);
        int _314 = 0;
        int _316 = _54(_312, _314, (*spvDescriptorSet0.support_buffer));
        int3 _1552 = int3(_310, _316, 2);
        float3 _318 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1552.xy), uint(_1552.z), 0).xyz;
        float _320 = _318.x;
        float _322 = _318.y;
        float _324 = _318.z;
        int _326 = _97 + 16;
        uint _328 = uint(int(uint(_326) >> uint(2)));
        uint _330 = uint(int(uint(int(_328)) >> uint(2)));
        int _332 = int(_328) & 3;
        float _334 = (*spvDescriptorSet0.cp_c5)._m0[int(_330)][_332];
        float _336 = -_214;
        float _338 = _336 + _236;
        float _340 = -_216;
        float _342 = _340 + _238;
        float _344 = -_218;
        float _346 = _344 + _240;
        float _348 = fma(_338, _334, _214);
        float _350 = fma(_342, _334, _216);
        float _352 = -_220;
        float _354 = _352 + _242;
        float _356 = -_262;
        float _358 = _356 + _282;
        float _360 = fma(_346, _334, _218);
        float _362 = -_260;
        float _364 = _362 + _280;
        float _366 = fma(_354, _334, _220);
        float _368 = fma(_358, _334, _262);
        float _370 = -_264;
        float _372 = _370 + _284;
        float _374 = -_300;
        float _376 = _374 + _320;
        float _378 = -_302;
        float _380 = _378 + _322;
        float _382 = -_304;
        float _384 = _382 + _324;
        float _386 = fma(_364, _334, _260);
        float _388 = fma(_372, _334, _264);
        float _390 = fma(_376, _334, _300);
        float _392 = fma(_380, _334, _302);
        float _394 = fma(_384, _334, _304);
        float _396 = _366 * 2.0;
        _157 = _348;
        _165 = _360;
        _167 = _396;
        _173 = _350;
        _127 = _386;
        _139 = _368;
        _149 = _388;
        _141 = as_type<int>(_390);
        _129 = as_type<int>(_392);
        _151 = as_type<int>(_394);
        _175 = _280;
        _177 = _304;
        _179 = _300;
        _181 = _320;
    }
    float _398 = _157;
    float _400 = _165;
    float _402 = _167;
    float _404 = _173;
    float _406 = _127;
    float _408 = _139;
    float _410 = _149;
    int _412 = _141;
    int _414 = _129;
    int _416 = _151;
    float _418 = _175;
    float _420 = _177;
    float _422 = _179;
    float _424 = _181;
    float _426 = _398 * 2.0;
    float _428 = _400 * _402;
    float _430 = _404 * _402;
    int _432 = _64 * 48;
    float _434 = -_428;
    float _436 = fma(_426, _404, _434);
    float _438 = fma(_426, _404, _428);
    float _440 = _398 * _402;
    float _442 = _404 * _404;
    float _444 = _398 * _398;
    float _446 = fma(_426, _400, _430);
    float _448 = -_430;
    float _450 = fma(_426, _400, _448);
    float _452 = _404 * 2.0;
    float _454 = _400 * _400;
    float _456 = fma(_442, -2.0, 1.0);
    float _458 = fma(_444, -2.0, 1.0);
    float _460 = -_440;
    float _462 = fma(_452, _400, _460);
    float _464 = fma(_452, _400, _440);
    float _466 = fma(_454, -2.0, _456);
    float _468 = fma(_454, -2.0, _458);
    float _470 = fma(_442, -2.0, _458);
    float _472 = _438 * _406;
    float _474 = _466 * _406;
    float _476 = _450 * _406;
    float _478 = _436 * _408;
    float _480 = _464 * _408;
    float _482 = _468 * _408;
    float _484 = _446 * _410;
    float _486 = _462 * _410;
    float _488 = _470 * _410;
    bool _490 = _64 != 0;
    uint _492 = uint(int(uint(_432) >> uint(2)));
    _37[int(_492)] = as_type<uint>(_474);
    int _494 = _432 + 4;
    uint _496 = uint(int(uint(_494) >> uint(2)));
    _37[int(_496)] = as_type<uint>(_478);
    int _498 = _432 + 8;
    uint _500 = uint(int(uint(_498) >> uint(2)));
    _37[int(_500)] = as_type<uint>(_484);
    int _502 = _432 + 12;
    uint _504 = uint(int(uint(_502) >> uint(2)));
    _37[int(_504)] = uint(_412);
    int _506 = _64 * 112;
    int _508 = _432 + 16;
    uint _510 = uint(int(uint(_508) >> uint(2)));
    _37[int(_510)] = as_type<uint>(_472);
    int _512 = _432 + 20;
    uint _514 = uint(int(uint(_512) >> uint(2)));
    _37[int(_514)] = as_type<uint>(_482);
    int _516 = _432 + 24;
    uint _518 = uint(int(uint(_516) >> uint(2)));
    _37[int(_518)] = as_type<uint>(_486);
    int _520 = _432 + 28;
    uint _522 = uint(int(uint(_520) >> uint(2)));
    _37[int(_522)] = uint(_414);
    int _524 = _432 + 32;
    uint _526 = uint(int(uint(_524) >> uint(2)));
    _37[int(_526)] = as_type<uint>(_476);
    int _528 = _432 + 36;
    uint _530 = uint(int(uint(_528) >> uint(2)));
    _37[int(_530)] = as_type<uint>(_480);
    int _532 = _432 + 40;
    uint _534 = uint(int(uint(_532) >> uint(2)));
    _37[int(_534)] = as_type<uint>(_488);
    int _536 = _432 + 44;
    uint _538 = uint(int(uint(_536) >> uint(2)));
    _37[int(_538)] = uint(_416);
    float _540 = _446;
    float _542 = _420;
    float _544 = 2.0;
    float _546 = _438;
    float _548 = _424;
    float _550 = _422;
    float _552 = _436;
    float _554 = _468;
    float _556 = _418;
    float _558 = _482;
    float _560 = _474;
    float _562 = _488;
    if (!_490)
    {
        _540 = as_type<float>(_412);
    }
    float _564 = _540;
    float _566 = _564;
    if (!_490)
    {
        _542 = as_type<float>(_414);
    }
    float _568 = _542;
    float _570 = _568;
    if (!_490)
    {
        _544 = as_type<float>(_416);
    }
    float _572 = _544;
    float _574 = _572;
    if (!_490)
    {
        _546 = _478;
    }
    float _576 = _546;
    float _578 = _576;
    if (!_490)
    {
        _548 = _484;
    }
    float _580 = _548;
    float _582 = _580;
    if (!_490)
    {
        _550 = _472;
    }
    float _584 = _550;
    float _586 = _584;
    if (!_490)
    {
        _552 = _486;
    }
    float _588 = _552;
    float _590 = _588;
    if (!_490)
    {
        _554 = _476;
    }
    float _592 = _554;
    float _594 = _592;
    if (!_490)
    {
        _556 = _480;
    }
    float _596 = _556;
    bool _598 = !_490;
    float _600 = _596;
    if (!_598)
    {
        bool _602 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _604 = !_602;
        if (!_604)
        {
            uint _606 = uint(int(uint(_506) >> uint(2)));
            uint _608 = uint(int(uint(int(_606)) >> uint(2)));
            int _610 = int(_606) & 3;
            float _612 = (*spvDescriptorSet0.cp_c6)._m0[int(_608)][_610];
            int _614 = as_type<int>(_612) * 48;
            int _616 = 0;
            bool _618;
            float _714;
            float _718;
            float _722;
            float _726;
            float _740;
            float _742;
            float _754;
            float _764;
            float _766;
            float _768;
            float _770;
            float _772;
            do
            {
                int _620 = _616;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _622 = uint(int(uint(_614) >> uint(2)));
                float _624 = as_type<float>(_37[int(_622)]);
                int _626 = _614 + 4;
                uint _628 = uint(int(uint(_626) >> uint(2)));
                float _630 = as_type<float>(_37[int(_628)]);
                int _632 = _614 + 8;
                uint _634 = uint(int(uint(_632) >> uint(2)));
                float _636 = as_type<float>(_37[int(_634)]);
                int _638 = _614 + 12;
                uint _640 = uint(int(uint(_638) >> uint(2)));
                float _642 = as_type<float>(_37[int(_640)]);
                int _644 = _620 + 1;
                int _646 = _614 + 16;
                uint _648 = uint(int(uint(_646) >> uint(2)));
                float _650 = as_type<float>(_37[int(_648)]);
                int _652 = _614 + 20;
                uint _654 = uint(int(uint(_652) >> uint(2)));
                float _656 = as_type<float>(_37[int(_654)]);
                int _658 = _614 + 24;
                uint _660 = uint(int(uint(_658) >> uint(2)));
                float _662 = as_type<float>(_37[int(_660)]);
                int _664 = _614 + 28;
                uint _666 = uint(int(uint(_664) >> uint(2)));
                float _668 = as_type<float>(_37[int(_666)]);
                bool _670 = uint(_644) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _672 = _614 + 32;
                uint _674 = uint(int(uint(_672) >> uint(2)));
                float _676 = as_type<float>(_37[int(_674)]);
                int _678 = _614 + 36;
                uint _680 = uint(int(uint(_678) >> uint(2)));
                float _682 = as_type<float>(_37[int(_680)]);
                int _684 = _614 + 40;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                float _688 = as_type<float>(_37[int(_686)]);
                int _690 = _614 + 44;
                uint _692 = uint(int(uint(_690) >> uint(2)));
                float _694 = as_type<float>(_37[int(_692)]);
                float _696 = _630 * as_type<float>(_414);
                float _698 = _472 * _630;
                float _700 = _482 * _630;
                float _702 = _486 * _630;
                float _704 = fma(_624, as_type<float>(_412), _696);
                float _706 = fma(_474, _624, _698);
                float _708 = fma(_478, _624, _700);
                float _710 = fma(_484, _624, _702);
                float _712 = fma(_636, as_type<float>(_416), _704);
                _714 = fma(_476, _636, _706);
                float _716 = _472 * _656;
                _718 = fma(_488, _636, _710);
                float _720 = _656 * as_type<float>(_414);
                _722 = _642 + _712;
                float _724 = _482 * _656;
                _726 = fma(_480, _636, _708);
                float _728 = fma(_650, as_type<float>(_412), _720);
                float _730 = fma(_474, _650, _716);
                float _732 = fma(_478, _650, _724);
                float _734 = _486 * _656;
                float _736 = fma(_662, as_type<float>(_416), _728);
                float _738 = _682 * as_type<float>(_414);
                _740 = fma(_476, _662, _730);
                _742 = fma(_480, _662, _732);
                float _744 = _472 * _682;
                float _746 = _482 * _682;
                float _748 = _486 * _682;
                float _750 = fma(_676, as_type<float>(_412), _738);
                float _752 = fma(_484, _650, _734);
                _754 = _668 + _736;
                float _756 = fma(_474, _676, _744);
                float _758 = fma(_478, _676, _746);
                float _760 = fma(_484, _676, _748);
                float _762 = fma(_688, as_type<float>(_416), _750);
                _764 = fma(_488, _662, _752);
                _766 = fma(_476, _688, _756);
                _768 = fma(_480, _688, _758);
                _770 = fma(_488, _688, _760);
                _772 = _694 + _762;
                uint _774 = uint(int(uint(_432) >> uint(2)));
                _37[int(_774)] = as_type<uint>(_714);
                int _776 = _432 + 4;
                uint _778 = uint(int(uint(_776) >> uint(2)));
                _37[int(_778)] = as_type<uint>(_726);
                int _780 = _432 + 8;
                uint _782 = uint(int(uint(_780) >> uint(2)));
                _37[int(_782)] = as_type<uint>(_718);
                int _784 = _432 + 12;
                uint _786 = uint(int(uint(_784) >> uint(2)));
                _37[int(_786)] = as_type<uint>(_722);
                int _788 = _432 + 16;
                uint _790 = uint(int(uint(_788) >> uint(2)));
                _37[int(_790)] = as_type<uint>(_740);
                int _792 = _432 + 20;
                uint _794 = uint(int(uint(_792) >> uint(2)));
                _37[int(_794)] = as_type<uint>(_742);
                int _796 = _432 + 24;
                uint _798 = uint(int(uint(_796) >> uint(2)));
                _37[int(_798)] = as_type<uint>(_764);
                int _800 = _432 + 28;
                uint _802 = uint(int(uint(_800) >> uint(2)));
                _37[int(_802)] = as_type<uint>(_754);
                int _804 = _432 + 32;
                uint _806 = uint(int(uint(_804) >> uint(2)));
                _37[int(_806)] = as_type<uint>(_766);
                int _808 = _432 + 36;
                uint _810 = uint(int(uint(_808) >> uint(2)));
                _37[int(_810)] = as_type<uint>(_768);
                int _812 = _432 + 40;
                uint _814 = uint(int(uint(_812) >> uint(2)));
                _37[int(_814)] = as_type<uint>(_770);
                int _816 = _432 + 44;
                uint _818 = uint(int(uint(_816) >> uint(2)));
                _37[int(_818)] = as_type<uint>(_772);
                _618 = !_670;
                _616 = _644;
            } while (_618);
            _558 = _742;
            _600 = _768;
            _578 = _726;
            _586 = _740;
            _594 = _766;
            _560 = _714;
            _590 = _764;
            _582 = _718;
            _562 = _770;
            _570 = _754;
            _574 = _772;
            _566 = _722;
            _820 = true;
        }
        else
        {
            _558 = 0.0;
            _600 = 0.0;
            _578 = 0.0;
            _586 = 0.0;
            _594 = 0.0;
            _560 = 0.0;
            _590 = 0.0;
            _582 = 0.0;
            _562 = 0.0;
            _570 = 0.0;
            _574 = 0.0;
            _566 = 0.0;
        }
    }
    _820 = false;
    float _822 = _558;
    float _824 = _600;
    float _826 = _578;
    float _828 = _586;
    float _830 = _594;
    float _832 = _560;
    float _834 = _590;
    float _836 = _582;
    float _838 = _562;
    float _840 = _570;
    float _842 = _574;
    float _844 = _566;
    int _846 = _506 + 80;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.cp_c6)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.cp_c6)._m0[int(_858)][_860];
    int _864 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _866 = _864 + _64;
    int _868 = _506 + 64;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    uint _872 = uint(int(uint(int(_870)) >> uint(2)));
    int _874 = int(_870) & 3;
    float _876 = (*spvDescriptorSet0.cp_c6)._m0[int(_872)][_874];
    int _878 = int(_870) + 1;
    uint _880 = uint(int(uint(_878) >> uint(2)));
    int _882 = _878 & 3;
    float _884 = (*spvDescriptorSet0.cp_c6)._m0[int(_880)][_882];
    int _886 = _866 * 48;
    int _888 = _506 + 88;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.cp_c6)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.cp_c6)._m0[int(_900)][_902];
    int _906 = _506 + 72;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.cp_c6)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.cp_c6)._m0[int(_918)][_920];
    int _924 = _506 + 96;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    uint _928 = uint(int(uint(int(_926)) >> uint(2)));
    int _930 = int(_926) & 3;
    float _932 = (*spvDescriptorSet0.cp_c6)._m0[int(_928)][_930];
    int _934 = int(_926) + 1;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    int _938 = _934 & 3;
    float _940 = (*spvDescriptorSet0.cp_c6)._m0[int(_936)][_938];
    int _942 = _506 + 104;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    uint _946 = uint(int(uint(int(_944)) >> uint(2)));
    int _948 = int(_944) & 3;
    float _950 = (*spvDescriptorSet0.cp_c6)._m0[int(_946)][_948];
    int _952 = int(_944) + 1;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    int _956 = _952 & 3;
    float _958 = (*spvDescriptorSet0.cp_c6)._m0[int(_954)][_956];
    float _960 = _822 * _854;
    float _962 = _824 * _854;
    float _964 = _824 * _862;
    float _966 = _822 * _862;
    float _968 = _826 * _854;
    int _970 = _506 + 16;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    uint _974 = uint(int(uint(int(_972)) >> uint(2)));
    int _976 = int(_972) & 3;
    float _978 = (*spvDescriptorSet0.cp_c6)._m0[int(_974)][_976];
    int _980 = int(_972) + 1;
    uint _982 = uint(int(uint(_980) >> uint(2)));
    int _984 = _980 & 3;
    float _986 = (*spvDescriptorSet0.cp_c6)._m0[int(_982)][_984];
    float _988 = fma(_828, _876, _960);
    float _990 = _826 * _862;
    float _992 = fma(_830, _876, _962);
    float _994 = fma(_830, _884, _964);
    float _996 = fma(_828, _884, _966);
    int _998 = _506 + 32;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
    int _1004 = int(_1000) & 3;
    float _1006 = (*spvDescriptorSet0.cp_c6)._m0[int(_1002)][_1004];
    int _1008 = int(_1000) + 1;
    uint _1010 = uint(int(uint(_1008) >> uint(2)));
    int _1012 = _1008 & 3;
    float _1014 = (*spvDescriptorSet0.cp_c6)._m0[int(_1010)][_1012];
    float _1016 = fma(_832, _884, _990);
    float _1018 = fma(_832, _876, _968);
    float _1020 = _826 * _896;
    float _1022 = _826 * _904;
    float _1024 = _822 * _896;
    float _1026 = _824 * _896;
    float _1028 = _822 * _904;
    int _1030 = _506 + 48;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    uint _1034 = uint(int(uint(int(_1032)) >> uint(2)));
    int _1036 = int(_1032) & 3;
    float _1038 = (*spvDescriptorSet0.cp_c6)._m0[int(_1034)][_1036];
    int _1040 = int(_1032) + 1;
    uint _1042 = uint(int(uint(_1040) >> uint(2)));
    int _1044 = _1040 & 3;
    float _1046 = (*spvDescriptorSet0.cp_c6)._m0[int(_1042)][_1044];
    float _1048 = _824 * _904;
    float _1050 = fma(_832, _914, _1020);
    float _1052 = fma(_832, _922, _1022);
    float _1054 = fma(_828, _914, _1024);
    float _1056 = fma(_830, _914, _1026);
    float _1058 = fma(_828, _922, _1028);
    int _1060 = _506 + 24;
    uint _1062 = uint(int(uint(_1060) >> uint(2)));
    uint _1064 = uint(int(uint(int(_1062)) >> uint(2)));
    int _1066 = int(_1062) & 3;
    float _1068 = (*spvDescriptorSet0.cp_c6)._m0[int(_1064)][_1066];
    int _1070 = int(_1062) + 1;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    int _1074 = _1070 & 3;
    float _1076 = (*spvDescriptorSet0.cp_c6)._m0[int(_1072)][_1074];
    float _1078 = fma(_830, _922, _1048);
    float _1080 = fma(_834, _932, _988);
    float _1082 = fma(_834, _940, _996);
    float _1084 = fma(_836, _940, _1016);
    float _1086 = fma(_836, _932, _1018);
    float _1088 = fma(_838, _932, _992);
    int _1090 = _506 + 40;
    uint _1092 = uint(int(uint(_1090) >> uint(2)));
    uint _1094 = uint(int(uint(int(_1092)) >> uint(2)));
    int _1096 = int(_1092) & 3;
    float _1098 = (*spvDescriptorSet0.cp_c6)._m0[int(_1094)][_1096];
    int _1100 = int(_1092) + 1;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    int _1104 = _1100 & 3;
    float _1106 = (*spvDescriptorSet0.cp_c6)._m0[int(_1102)][_1104];
    float _1108 = fma(_838, _940, _994);
    float _1110 = fma(_834, _950, _1054);
    float _1112 = fma(_834, _958, _1058);
    float _1114 = fma(_838, _958, _1078);
    float _1116 = fma(_836, _958, _1052);
    float _1118 = fma(_838, _950, _1056);
    int _1120 = _506 + 56;
    uint _1122 = uint(int(uint(_1120) >> uint(2)));
    uint _1124 = uint(int(uint(int(_1122)) >> uint(2)));
    int _1126 = int(_1122) & 3;
    float _1128 = (*spvDescriptorSet0.cp_c6)._m0[int(_1124)][_1126];
    int _1130 = int(_1122) + 1;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    int _1134 = _1130 & 3;
    float _1136 = (*spvDescriptorSet0.cp_c6)._m0[int(_1132)][_1134];
    float _1138 = _1112 + _840;
    float _1140 = _1114 + _842;
    float _1142 = _1116 + _844;
    float _1144 = fma(_836, _950, _1050);
    float _1146 = _1138 * _986;
    float _1148 = _1080 * _986;
    float _1150 = _1082 * _986;
    float _1152 = _1110 * _986;
    float _1154 = fma(_1142, _978, _1146);
    float _1156 = fma(_1086, _978, _1148);
    float _1158 = fma(_1084, _978, _1150);
    float _1160 = fma(_1144, _978, _1152);
    float _1162 = _1138 * _1014;
    float _1164 = _1082 * _1014;
    float _1166 = _1080 * _1014;
    float _1168 = _1110 * _1014;
    float _1170 = fma(_1142, _1006, _1162);
    float _1172 = fma(_1084, _1006, _1164);
    float _1174 = fma(_1086, _1006, _1166);
    float _1176 = fma(_1144, _1006, _1168);
    float _1178 = _1138 * _1046;
    float _1180 = _1080 * _1046;
    float _1182 = _1082 * _1046;
    float _1184 = _1110 * _1046;
    float _1186 = fma(_1142, _1038, _1178);
    float _1188 = fma(_1086, _1038, _1180);
    float _1190 = fma(_1084, _1038, _1182);
    float _1192 = fma(_1144, _1038, _1184);
    float _1194 = fma(_1140, _1068, _1154);
    float _1196 = fma(_1088, _1068, _1156);
    float _1198 = fma(_1108, _1068, _1158);
    float _1200 = fma(_1118, _1068, _1160);
    float _1202 = _1194 + _1076;
    int _1204 = _886 + 16;
    int _1206 = _886 + 32;
    float _1208 = fma(_1140, _1098, _1170);
    float _1210 = fma(_1108, _1098, _1172);
    float _1212 = fma(_1088, _1098, _1174);
    float _1214 = fma(_1118, _1098, _1176);
    float _1216 = _1208 + _1106;
    int _1218 = _886 + 48;
    uint _1220 = uint(int(uint(_1204) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1220)] = as_type<uint>(_1196);
    int _1222 = _1204 + 4;
    uint _1224 = uint(int(uint(_1222) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1224)] = as_type<uint>(_1198);
    int _1226 = _1204 + 8;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1228)] = as_type<uint>(_1200);
    int _1230 = _1204 + 12;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1232)] = as_type<uint>(_1202);
    float _1234 = fma(_1140, _1128, _1186);
    float _1236 = fma(_1088, _1128, _1188);
    float _1238 = fma(_1108, _1128, _1190);
    float _1240 = fma(_1118, _1128, _1192);
    float _1242 = _1234 + _1136;
    uint _1244 = uint(int(uint(_1206) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1244)] = as_type<uint>(_1212);
    int _1246 = _1206 + 4;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1248)] = as_type<uint>(_1210);
    int _1250 = _1206 + 8;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1252)] = as_type<uint>(_1214);
    int _1254 = _1206 + 12;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1256)] = as_type<uint>(_1216);
    uint _1258 = uint(int(uint(_1218) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1258)] = as_type<uint>(_1236);
    int _1260 = _1218 + 4;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1262)] = as_type<uint>(_1238);
    int _1264 = _1218 + 8;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1266)] = as_type<uint>(_1240);
    int _1268 = _1218 + 12;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1270)] = as_type<uint>(_1242);
}

