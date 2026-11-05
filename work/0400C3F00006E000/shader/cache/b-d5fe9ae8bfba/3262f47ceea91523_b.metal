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
int _54(thread const int& _3675, thread const int& _3676, constant _10& support_buffer)
{
    int _3679 = 1 + _3676;
    float _3681 = support_buffer._m5[_3679].x;
    bool _3683 = _3681 == 1.0;
    if (_3683)
    {
        return _3675;
    }
    float _3685 = float(_3675);
    float _3687 = _3685 * _3681;
    int _3689 = int(_3687);
    return _3689;
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
    int _72 = _64 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _74 = _72 << 4;
    bool _76 = !_70;
    if (!_76)
    {
        uint _79 = uint(int(uint(_74) >> uint(2)));
        uint _81 = uint(int(uint(int(_79)) >> uint(2)));
        int _83 = int(_79) & 3;
        float _85 = (*spvDescriptorSet0.cp_c4)._m0[int(_81)][_83];
        int _87 = as_type<int>(_85) * 48;
        int _89 = 0;
        int _91 = 0;
        float _93 = 0.0;
        float _95 = 0.0;
        int _97 = 0;
        float _99 = 0.0;
        float _101 = 0.0;
        float _103 = 0.0;
        int _105 = 0;
        int _107 = 0;
        bool _109;
        do
        {
            int _111 = _89;
            int _113 = _91;
            float _115 = _93;
            float _117 = _95;
            int _119 = _97;
            float _121 = _99;
            float _123 = _101;
            float _125 = _103;
            int _127 = _105;
            int _129 = _107;
            int _131 = _87 + 32;
            uint _133 = uint(int(uint(_131) >> uint(2)));
            uint _135 = uint(int(uint(int(_133)) >> uint(2)));
            int _137 = int(_133) & 3;
            float _139 = (*spvDescriptorSet0.cp_c5)._m0[int(_135)][_137];
            int _141 = _111 & 31;
            bool _143 = _141 == 0;
            bool _145 = uint(_141) < 32u;
            int _147 = 32 - _141;
            int _149 = _141 - 32;
            int _151 = 1 << _141;
            uint _153 = uint(int(uint(0) >> uint(_147)));
            int _155 = _151 | int(_153);
            int _157 = _143 ? 1 : _155;
            bool _159 = uint(_149) < 32u;
            int _161 = 0 << _149;
            int _163 = _159 ? _161 : 0;
            float _165 = _145 ? as_type<float>(_157) : as_type<float>(_163);
            int _167 = as_type<int>(_165) & as_type<int>(_139);
            bool _169 = _167 != 0;
            float _171 = _121;
            float _173 = _123;
            float _175 = _125;
            float _177 = _115;
            float _179 = _117;
            float _181 = _139;
            float _183 = _165;
            int _185 = _127;
            int _187 = _113;
            int _189 = _119;
            int _191 = _129;
            if (!_169)
            {
                _171 = 0.0;
            }
            float _193 = _171;
            float _195 = _193;
            if (!_169)
            {
                _173 = 0.0;
                _175 = 0.0;
            }
            float _197 = _173;
            float _199 = _175;
            float _201 = _197;
            float _203 = _199;
            if (!_169)
            {
                _177 = 0.0;
                _179 = 0.0;
            }
            float _205 = _177;
            float _207 = _179;
            float _209 = _207;
            float _211 = _205;
            if (!_169)
            {
                _181 = 0.0;
                _183 = 0.0;
            }
            float _213 = _181;
            float _215 = _183;
            float _217 = _215;
            float _219 = _213;
            if (!_169)
            {
                _185 = 0;
            }
            int _221 = _185;
            int _223 = _221;
            if (!_169)
            {
                _187 = 0;
            }
            int _225 = _187;
            int _227 = _225;
            int _229 = _225;
            if (!_169)
            {
                _189 = 0;
            }
            int _231 = _189;
            bool _233 = !_169;
            int _235 = _231;
            int _237 = _231;
            if (!_233)
            {
                uint _239 = uint(int(uint(_87) >> uint(2)));
                uint _241 = uint(int(uint(int(_239)) >> uint(2)));
                int _243 = int(_239) & 3;
                float _245 = (*spvDescriptorSet0.cp_c5)._m0[int(_241)][_243];
                int _247 = int(_239) + 1;
                uint _249 = uint(int(uint(_247) >> uint(2)));
                int _251 = _247 & 3;
                float _253 = (*spvDescriptorSet0.cp_c5)._m0[int(_249)][_251];
                int _255 = _111;
                int _257 = 0;
                int _259 = _54(_255, _257, (*spvDescriptorSet0.support_buffer));
                int _261 = as_type<int>(_245);
                int _263 = 0;
                int _265 = _54(_261, _263, (*spvDescriptorSet0.support_buffer));
                int3 _1664 = int3(_259, _265, 1);
                float4 _268 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1664.xy), uint(_1664.z), 0).xyzw;
                float _270 = _268.x;
                float _272 = _268.y;
                float _274 = _268.z;
                float _276 = _268.w;
                int _278 = _111;
                int _280 = 0;
                int _282 = _54(_278, _280, (*spvDescriptorSet0.support_buffer));
                int _284 = as_type<int>(_253);
                int _286 = 0;
                int _288 = _54(_284, _286, (*spvDescriptorSet0.support_buffer));
                int3 _1684 = int3(_282, _288, 1);
                float4 _290 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1684.xy), uint(_1684.z), 0).xyzw;
                float _292 = _290.x;
                float _294 = _290.y;
                float _296 = _290.z;
                float _298 = _290.w;
                int _300 = _111;
                int _302 = 0;
                int _304 = _54(_300, _302, (*spvDescriptorSet0.support_buffer));
                int _306 = as_type<int>(_245);
                int _308 = 0;
                int _310 = _54(_306, _308, (*spvDescriptorSet0.support_buffer));
                int3 _1704 = int3(_304, _310, 0);
                float3 _314 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1704.xy), uint(_1704.z), 0).xyz;
                float _316 = _314.x;
                float _318 = _314.y;
                float _320 = _314.z;
                int _322 = _111;
                int _324 = 0;
                int _326 = _54(_322, _324, (*spvDescriptorSet0.support_buffer));
                int _328 = as_type<int>(_253);
                int _330 = 0;
                int _332 = _54(_328, _330, (*spvDescriptorSet0.support_buffer));
                int3 _1722 = int3(_326, _332, 0);
                float3 _334 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1722.xy), uint(_1722.z), 0).xyz;
                float _336 = _334.x;
                float _338 = _334.y;
                float _340 = _334.z;
                int _342 = _111;
                int _344 = 0;
                int _346 = _54(_342, _344, (*spvDescriptorSet0.support_buffer));
                int _348 = as_type<int>(_245);
                int _350 = 0;
                int _352 = _54(_348, _350, (*spvDescriptorSet0.support_buffer));
                int3 _1740 = int3(_346, _352, 2);
                float3 _354 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1740.xy), uint(_1740.z), 0).xyz;
                float _356 = _354.x;
                float _358 = _354.y;
                float _360 = _354.z;
                int _362 = _111;
                int _364 = 0;
                int _366 = _54(_362, _364, (*spvDescriptorSet0.support_buffer));
                int _368 = as_type<int>(_253);
                int _370 = 0;
                int _372 = _54(_368, _370, (*spvDescriptorSet0.support_buffer));
                int3 _1758 = int3(_366, _372, 2);
                float3 _374 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1758.xy), uint(_1758.z), 0).xyz;
                float _376 = _374.x;
                float _378 = _374.y;
                float _380 = _374.z;
                int _382 = _87 + 16;
                uint _384 = uint(int(uint(_382) >> uint(2)));
                uint _386 = uint(int(uint(int(_384)) >> uint(2)));
                int _388 = int(_384) & 3;
                float _390 = (*spvDescriptorSet0.cp_c5)._m0[int(_386)][_388];
                float _392 = -_270;
                float _394 = _392 + _292;
                float _396 = -_272;
                float _398 = _396 + _294;
                float _400 = fma(_394, _390, _270);
                float _402 = fma(_398, _390, _272);
                float _404 = -_274;
                float _406 = _404 + _296;
                float _408 = -_276;
                float _410 = _408 + _298;
                float _412 = -_316;
                float _414 = _412 + _336;
                float _416 = -_318;
                float _418 = _416 + _338;
                float _420 = -_320;
                float _422 = _420 + _340;
                float _424 = fma(_410, _390, _276);
                float _426 = fma(_414, _390, _316);
                float _428 = fma(_418, _390, _318);
                float _430 = -_356;
                float _432 = _430 + _376;
                float _434 = -_358;
                float _436 = _434 + _378;
                float _438 = -_360;
                float _440 = _438 + _380;
                float _442 = fma(_406, _390, _274);
                float _444 = fma(_422, _390, _320);
                float _446 = fma(_432, _390, _356);
                float _448 = fma(_436, _390, _358);
                float _450 = fma(_440, _390, _360);
                _227 = as_type<int>(_448);
                _235 = as_type<int>(_450);
                _209 = _400;
                _217 = _424;
                _211 = _402;
                _219 = _442;
                _195 = _426;
                _201 = _428;
                _203 = _444;
                _223 = as_type<int>(_446);
                _229 = as_type<int>(_448);
                _237 = as_type<int>(_450);
                _191 = 1;
            }
            int _452 = _227;
            int _454 = _235;
            float _456 = _209;
            float _458 = _217;
            float _460 = _211;
            float _462 = _219;
            float _464 = _195;
            float _466 = _201;
            float _468 = _203;
            int _470 = _223;
            int _472 = _229;
            int _474 = _237;
            int _476 = _191;
            float _478 = _456 * _456;
            float _480 = _458 * 2.0;
            float _482 = _460 * _460;
            float _484 = _456 * 2.0;
            float _486 = fma(_478, -2.0, 1.0);
            float _488 = _480 * _462;
            float _490 = _462 * _462;
            float _492 = fma(_482, -2.0, 1.0);
            float _494 = _480 * _456;
            float _496 = _480 * _460;
            float _498 = -_488;
            float _500 = fma(_484, _460, _498);
            float _502 = fma(_484, _460, _488);
            float _504 = _460 * 2.0;
            float _506 = fma(_490, -2.0, _492);
            float _508 = fma(_490, -2.0, _486);
            float _510 = -_496;
            float _512 = fma(_484, _462, _510);
            float _514 = -_494;
            float _516 = fma(_504, _462, _514);
            float _518 = fma(_482, -2.0, _486);
            float _520 = fma(_484, _462, _496);
            float _522 = fma(_504, _462, _494);
            int _524 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _526 = _524 + _111;
            float _528 = _512 * _464;
            float _530 = _506 * _464;
            float _532 = _502 * _464;
            float _534 = _508 * _466;
            float _536 = _500 * _466;
            float _538 = _522 * _466;
            int _540 = _526 * 48;
            float _542 = _520 * _468;
            float _544 = _516 * _468;
            float _546 = _518 * _468;
            int _548 = _111 + 1;
            uint _550 = uint(int(uint(_540) >> uint(2)));
            _37[int(_550)] = as_type<uint>(_530);
            int _552 = _540 + 4;
            uint _554 = uint(int(uint(_552) >> uint(2)));
            _37[int(_554)] = as_type<uint>(_536);
            int _556 = _540 + 8;
            uint _558 = uint(int(uint(_556) >> uint(2)));
            _37[int(_558)] = as_type<uint>(_542);
            int _560 = _540 + 12;
            uint _562 = uint(int(uint(_560) >> uint(2)));
            _37[int(_562)] = uint(_470);
            bool _564 = uint(_548) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _566 = _540 + 16;
            uint _568 = uint(int(uint(_566) >> uint(2)));
            _37[int(_568)] = as_type<uint>(_532);
            int _570 = _540 + 20;
            uint _572 = uint(int(uint(_570) >> uint(2)));
            _37[int(_572)] = as_type<uint>(_534);
            int _574 = _540 + 24;
            uint _576 = uint(int(uint(_574) >> uint(2)));
            _37[int(_576)] = as_type<uint>(_544);
            int _578 = _540 + 28;
            uint _580 = uint(int(uint(_578) >> uint(2)));
            _37[int(_580)] = uint(_472);
            int _582 = _540 + 32;
            uint _584 = uint(int(uint(_582) >> uint(2)));
            _37[int(_584)] = as_type<uint>(_528);
            int _586 = _540 + 36;
            uint _588 = uint(int(uint(_586) >> uint(2)));
            _37[int(_588)] = as_type<uint>(_538);
            int _590 = _540 + 40;
            uint _592 = uint(int(uint(_590) >> uint(2)));
            _37[int(_592)] = as_type<uint>(_546);
            int _594 = _540 + 44;
            uint _596 = uint(int(uint(_594) >> uint(2)));
            _37[int(_596)] = uint(_474);
            _109 = !_564;
            _89 = _548;
            _91 = _452;
            _93 = _522;
            _95 = _494;
            _97 = _454;
            _99 = _464;
            _101 = _466;
            _103 = _468;
            _105 = _470;
            _107 = _476;
        } while (_109);
    }
    bool _598 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _600 = !_598;
    if (!_600)
    {
        int _602 = 1;
        bool _604;
        do
        {
            int _606 = _602;
            int _608 = _606 * 112;
            int _610 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _612 = _610 + _606;
            int _614 = _606 + 1;
            uint _616 = uint(int(uint(_608) >> uint(2)));
            uint _618 = uint(int(uint(int(_616)) >> uint(2)));
            int _620 = int(_616) & 3;
            float _622 = (*spvDescriptorSet0.cp_c6)._m0[int(_618)][_620];
            int _624 = _612 * 48;
            bool _626 = uint(_614) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _628 = _624 + 16;
            uint _630 = uint(int(uint(_628) >> uint(2)));
            float _632 = as_type<float>(_37[int(_630)]);
            int _634 = _624 + 20;
            uint _636 = uint(int(uint(_634) >> uint(2)));
            float _638 = as_type<float>(_37[int(_636)]);
            int _640 = _624 + 24;
            uint _642 = uint(int(uint(_640) >> uint(2)));
            float _644 = as_type<float>(_37[int(_642)]);
            int _646 = _624 + 28;
            uint _648 = uint(int(uint(_646) >> uint(2)));
            float _650 = as_type<float>(_37[int(_648)]);
            int _652 = _624 + 32;
            uint _654 = uint(int(uint(_652) >> uint(2)));
            float _656 = as_type<float>(_37[int(_654)]);
            int _658 = _624 + 36;
            uint _660 = uint(int(uint(_658) >> uint(2)));
            float _662 = as_type<float>(_37[int(_660)]);
            int _664 = _624 + 40;
            uint _666 = uint(int(uint(_664) >> uint(2)));
            float _668 = as_type<float>(_37[int(_666)]);
            int _670 = _624 + 44;
            uint _672 = uint(int(uint(_670) >> uint(2)));
            float _674 = as_type<float>(_37[int(_672)]);
            int _676 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _678 = _676 + as_type<int>(_622);
            int _680 = _678 * 48;
            uint _682 = uint(int(uint(_624) >> uint(2)));
            float _684 = as_type<float>(_37[int(_682)]);
            int _686 = _624 + 4;
            uint _688 = uint(int(uint(_686) >> uint(2)));
            float _690 = as_type<float>(_37[int(_688)]);
            int _692 = _624 + 8;
            uint _694 = uint(int(uint(_692) >> uint(2)));
            float _696 = as_type<float>(_37[int(_694)]);
            int _698 = _624 + 12;
            uint _700 = uint(int(uint(_698) >> uint(2)));
            float _702 = as_type<float>(_37[int(_700)]);
            uint _704 = uint(int(uint(_680) >> uint(2)));
            float _706 = as_type<float>(_37[int(_704)]);
            int _708 = _680 + 4;
            uint _710 = uint(int(uint(_708) >> uint(2)));
            float _712 = as_type<float>(_37[int(_710)]);
            int _714 = _680 + 8;
            uint _716 = uint(int(uint(_714) >> uint(2)));
            float _718 = as_type<float>(_37[int(_716)]);
            int _720 = _680 + 12;
            uint _722 = uint(int(uint(_720) >> uint(2)));
            float _724 = as_type<float>(_37[int(_722)]);
            int _726 = _680 + 16;
            uint _728 = uint(int(uint(_726) >> uint(2)));
            float _730 = as_type<float>(_37[int(_728)]);
            int _732 = _680 + 20;
            uint _734 = uint(int(uint(_732) >> uint(2)));
            float _736 = as_type<float>(_37[int(_734)]);
            int _738 = _680 + 24;
            uint _740 = uint(int(uint(_738) >> uint(2)));
            float _742 = as_type<float>(_37[int(_740)]);
            int _744 = _680 + 28;
            uint _746 = uint(int(uint(_744) >> uint(2)));
            float _748 = as_type<float>(_37[int(_746)]);
            int _750 = _680 + 32;
            uint _752 = uint(int(uint(_750) >> uint(2)));
            float _754 = as_type<float>(_37[int(_752)]);
            int _756 = _680 + 36;
            uint _758 = uint(int(uint(_756) >> uint(2)));
            float _760 = as_type<float>(_37[int(_758)]);
            int _762 = _680 + 40;
            uint _764 = uint(int(uint(_762) >> uint(2)));
            float _766 = as_type<float>(_37[int(_764)]);
            int _768 = _680 + 44;
            uint _770 = uint(int(uint(_768) >> uint(2)));
            float _772 = as_type<float>(_37[int(_770)]);
            float _774 = _650 * _712;
            float _776 = _638 * _712;
            float _778 = _632 * _712;
            float _780 = _644 * _712;
            float _782 = fma(_702, _706, _774);
            float _784 = fma(_690, _706, _776);
            float _786 = fma(_684, _706, _778);
            float _788 = fma(_696, _706, _780);
            float _790 = fma(_674, _718, _782);
            float _792 = fma(_662, _718, _784);
            float _794 = _638 * _736;
            float _796 = _632 * _736;
            float _798 = _724 + _790;
            float _800 = _650 * _736;
            float _802 = _644 * _736;
            float _804 = fma(_690, _730, _794);
            float _806 = fma(_656, _718, _786);
            float _808 = fma(_702, _730, _800);
            float _810 = fma(_696, _730, _802);
            float _812 = fma(_662, _742, _804);
            float _814 = _650 * _760;
            float _816 = _632 * _760;
            float _818 = _638 * _760;
            float _820 = _644 * _760;
            float _822 = fma(_702, _754, _814);
            float _824 = fma(_684, _730, _796);
            float _826 = fma(_674, _742, _808);
            float _828 = fma(_684, _754, _816);
            float _830 = fma(_690, _754, _818);
            float _832 = fma(_696, _754, _820);
            float _834 = fma(_674, _766, _822);
            float _836 = fma(_656, _742, _824);
            float _838 = fma(_668, _718, _788);
            float _840 = fma(_668, _742, _810);
            float _842 = _748 + _826;
            float _844 = fma(_656, _766, _828);
            float _846 = fma(_662, _766, _830);
            float _848 = fma(_668, _766, _832);
            float _850 = _772 + _834;
            uint _852 = uint(int(uint(_624) >> uint(2)));
            _37[int(_852)] = as_type<uint>(_806);
            int _854 = _624 + 4;
            uint _856 = uint(int(uint(_854) >> uint(2)));
            _37[int(_856)] = as_type<uint>(_792);
            int _858 = _624 + 8;
            uint _860 = uint(int(uint(_858) >> uint(2)));
            _37[int(_860)] = as_type<uint>(_838);
            int _862 = _624 + 12;
            uint _864 = uint(int(uint(_862) >> uint(2)));
            _37[int(_864)] = as_type<uint>(_798);
            int _866 = _624 + 16;
            uint _868 = uint(int(uint(_866) >> uint(2)));
            _37[int(_868)] = as_type<uint>(_836);
            int _870 = _624 + 20;
            uint _872 = uint(int(uint(_870) >> uint(2)));
            _37[int(_872)] = as_type<uint>(_812);
            int _874 = _624 + 24;
            uint _876 = uint(int(uint(_874) >> uint(2)));
            _37[int(_876)] = as_type<uint>(_840);
            int _878 = _624 + 28;
            uint _880 = uint(int(uint(_878) >> uint(2)));
            _37[int(_880)] = as_type<uint>(_842);
            int _882 = _624 + 32;
            uint _884 = uint(int(uint(_882) >> uint(2)));
            _37[int(_884)] = as_type<uint>(_844);
            int _886 = _624 + 36;
            uint _888 = uint(int(uint(_886) >> uint(2)));
            _37[int(_888)] = as_type<uint>(_846);
            int _890 = _624 + 40;
            uint _892 = uint(int(uint(_890) >> uint(2)));
            _37[int(_892)] = as_type<uint>(_848);
            int _894 = _624 + 44;
            uint _896 = uint(int(uint(_894) >> uint(2)));
            _37[int(_896)] = as_type<uint>(_850);
            _604 = !_626;
            _602 = _614;
        } while (_604);
    }
    if (!_70)
    {
        return;
    }
    int _898 = 0;
    bool _900;
    do
    {
        int _902 = _898;
        int _904 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _906 = _904 + _902;
        int _908 = _902 * 112;
        int _910 = _906 * 48;
        int _912 = _908 + 80;
        uint _914 = uint(int(uint(_912) >> uint(2)));
        uint _916 = uint(int(uint(int(_914)) >> uint(2)));
        int _918 = int(_914) & 3;
        float _920 = (*spvDescriptorSet0.cp_c6)._m0[int(_916)][_918];
        int _922 = int(_914) + 1;
        uint _924 = uint(int(uint(_922) >> uint(2)));
        int _926 = _922 & 3;
        float _928 = (*spvDescriptorSet0.cp_c6)._m0[int(_924)][_926];
        uint _930 = uint(int(uint(_910) >> uint(2)));
        float _932 = as_type<float>(_37[int(_930)]);
        int _934 = _910 + 4;
        uint _936 = uint(int(uint(_934) >> uint(2)));
        float _938 = as_type<float>(_37[int(_936)]);
        int _940 = _910 + 8;
        uint _942 = uint(int(uint(_940) >> uint(2)));
        float _944 = as_type<float>(_37[int(_942)]);
        int _946 = _910 + 12;
        uint _948 = uint(int(uint(_946) >> uint(2)));
        float _950 = as_type<float>(_37[int(_948)]);
        int _952 = _910 + 16;
        uint _954 = uint(int(uint(_952) >> uint(2)));
        float _956 = as_type<float>(_37[int(_954)]);
        int _958 = _910 + 20;
        uint _960 = uint(int(uint(_958) >> uint(2)));
        float _962 = as_type<float>(_37[int(_960)]);
        int _964 = _910 + 24;
        uint _966 = uint(int(uint(_964) >> uint(2)));
        float _968 = as_type<float>(_37[int(_966)]);
        int _970 = _910 + 28;
        uint _972 = uint(int(uint(_970) >> uint(2)));
        float _974 = as_type<float>(_37[int(_972)]);
        int _976 = _908 + 88;
        uint _978 = uint(int(uint(_976) >> uint(2)));
        uint _980 = uint(int(uint(int(_978)) >> uint(2)));
        int _982 = int(_978) & 3;
        float _984 = (*spvDescriptorSet0.cp_c6)._m0[int(_980)][_982];
        int _986 = int(_978) + 1;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        int _990 = _986 & 3;
        float _992 = (*spvDescriptorSet0.cp_c6)._m0[int(_988)][_990];
        int _994 = _910 + 32;
        uint _996 = uint(int(uint(_994) >> uint(2)));
        float _998 = as_type<float>(_37[int(_996)]);
        int _1000 = _910 + 36;
        uint _1002 = uint(int(uint(_1000) >> uint(2)));
        float _1004 = as_type<float>(_37[int(_1002)]);
        int _1006 = _910 + 40;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        float _1010 = as_type<float>(_37[int(_1008)]);
        int _1012 = _910 + 44;
        uint _1014 = uint(int(uint(_1012) >> uint(2)));
        float _1016 = as_type<float>(_37[int(_1014)]);
        int _1018 = _908 + 64;
        uint _1020 = uint(int(uint(_1018) >> uint(2)));
        uint _1022 = uint(int(uint(int(_1020)) >> uint(2)));
        int _1024 = int(_1020) & 3;
        float _1026 = (*spvDescriptorSet0.cp_c6)._m0[int(_1022)][_1024];
        int _1028 = int(_1020) + 1;
        uint _1030 = uint(int(uint(_1028) >> uint(2)));
        int _1032 = _1028 & 3;
        float _1034 = (*spvDescriptorSet0.cp_c6)._m0[int(_1030)][_1032];
        int _1036 = _908 + 72;
        uint _1038 = uint(int(uint(_1036) >> uint(2)));
        uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
        int _1042 = int(_1038) & 3;
        float _1044 = (*spvDescriptorSet0.cp_c6)._m0[int(_1040)][_1042];
        int _1046 = int(_1038) + 1;
        uint _1048 = uint(int(uint(_1046) >> uint(2)));
        int _1050 = _1046 & 3;
        float _1052 = (*spvDescriptorSet0.cp_c6)._m0[int(_1048)][_1050];
        int _1054 = _908 + 104;
        uint _1056 = uint(int(uint(_1054) >> uint(2)));
        uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
        int _1060 = int(_1056) & 3;
        float _1062 = (*spvDescriptorSet0.cp_c6)._m0[int(_1058)][_1060];
        int _1064 = int(_1056) + 1;
        uint _1066 = uint(int(uint(_1064) >> uint(2)));
        int _1068 = _1064 & 3;
        float _1070 = (*spvDescriptorSet0.cp_c6)._m0[int(_1066)][_1068];
        int _1072 = _908 + 96;
        uint _1074 = uint(int(uint(_1072) >> uint(2)));
        uint _1076 = uint(int(uint(int(_1074)) >> uint(2)));
        int _1078 = int(_1074) & 3;
        float _1080 = (*spvDescriptorSet0.cp_c6)._m0[int(_1076)][_1078];
        int _1082 = int(_1074) + 1;
        uint _1084 = uint(int(uint(_1082) >> uint(2)));
        int _1086 = _1082 & 3;
        float _1088 = (*spvDescriptorSet0.cp_c6)._m0[int(_1084)][_1086];
        float _1090 = _938 * _920;
        float _1092 = _938 * _928;
        float _1094 = _938 * _984;
        float _1096 = _938 * _992;
        float _1098 = fma(_932, _1026, _1090);
        float _1100 = fma(_932, _1034, _1092);
        float _1102 = fma(_932, _1044, _1094);
        float _1104 = fma(_932, _1052, _1096);
        float _1106 = _962 * _920;
        float _1108 = _962 * _928;
        float _1110 = _962 * _984;
        float _1112 = _962 * _992;
        float _1114 = _1004 * _920;
        float _1116 = fma(_956, _1026, _1106);
        float _1118 = fma(_956, _1034, _1108);
        float _1120 = fma(_956, _1044, _1110);
        uint _1122 = uint(int(uint(_74) >> uint(2)));
        uint _1124 = uint(int(uint(int(_1122)) >> uint(2)));
        int _1126 = int(_1122) & 3;
        float _1128 = (*spvDescriptorSet0.cp_c4)._m0[int(_1124)][_1126];
        float _1130 = fma(_956, _1052, _1112);
        float _1132 = _1004 * _928;
        float _1134 = _1004 * _984;
        float _1136 = _1004 * _992;
        float _1138 = fma(_998, _1026, _1114);
        float _1140 = fma(_998, _1034, _1132);
        float _1142 = fma(_998, _1044, _1134);
        int _1144 = _908 + 16;
        uint _1146 = uint(int(uint(_1144) >> uint(2)));
        uint _1148 = uint(int(uint(int(_1146)) >> uint(2)));
        int _1150 = int(_1146) & 3;
        float _1152 = (*spvDescriptorSet0.cp_c6)._m0[int(_1148)][_1150];
        int _1154 = int(_1146) + 1;
        uint _1156 = uint(int(uint(_1154) >> uint(2)));
        int _1158 = _1154 & 3;
        float _1160 = (*spvDescriptorSet0.cp_c6)._m0[int(_1156)][_1158];
        float _1162 = fma(_998, _1052, _1136);
        float _1164 = fma(_968, _1070, _1130);
        float _1166 = fma(_944, _1080, _1098);
        float _1168 = fma(_944, _1088, _1100);
        float _1170 = fma(_944, _1062, _1102);
        float _1172 = fma(_944, _1070, _1104);
        float _1174 = fma(_968, _1080, _1116);
        int _1176 = _908 + 24;
        uint _1178 = uint(int(uint(_1176) >> uint(2)));
        uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
        int _1182 = int(_1178) & 3;
        float _1184 = (*spvDescriptorSet0.cp_c6)._m0[int(_1180)][_1182];
        int _1186 = int(_1178) + 1;
        uint _1188 = uint(int(uint(_1186) >> uint(2)));
        int _1190 = _1186 & 3;
        float _1192 = (*spvDescriptorSet0.cp_c6)._m0[int(_1188)][_1190];
        float _1194 = fma(_968, _1088, _1118);
        float _1196 = fma(_968, _1062, _1120);
        float _1198 = fma(_1010, _1080, _1138);
        float _1200 = fma(_1010, _1088, _1140);
        float _1202 = fma(_1010, _1070, _1162);
        float _1204 = fma(_1010, _1062, _1142);
        float _1206 = _974 + _1164;
        int _1208 = _908 + 32;
        uint _1210 = uint(int(uint(_1208) >> uint(2)));
        uint _1212 = uint(int(uint(int(_1210)) >> uint(2)));
        int _1214 = int(_1210) & 3;
        float _1216 = (*spvDescriptorSet0.cp_c6)._m0[int(_1212)][_1214];
        int _1218 = int(_1210) + 1;
        uint _1220 = uint(int(uint(_1218) >> uint(2)));
        int _1222 = _1218 & 3;
        float _1224 = (*spvDescriptorSet0.cp_c6)._m0[int(_1220)][_1222];
        float _1226 = _1016 + _1202;
        float _1228 = _950 + _1172;
        int _1230 = _908 + 48;
        uint _1232 = uint(int(uint(_1230) >> uint(2)));
        uint _1234 = uint(int(uint(int(_1232)) >> uint(2)));
        int _1236 = int(_1232) & 3;
        float _1238 = (*spvDescriptorSet0.cp_c6)._m0[int(_1234)][_1236];
        int _1240 = int(_1232) + 1;
        uint _1242 = uint(int(uint(_1240) >> uint(2)));
        int _1244 = _1240 & 3;
        float _1246 = (*spvDescriptorSet0.cp_c6)._m0[int(_1242)][_1244];
        float _1248 = _1174 * _1160;
        float _1250 = _1194 * _1160;
        float _1252 = _1206 * _1160;
        float _1254 = _1196 * _1160;
        float _1256 = fma(_1166, _1152, _1248);
        float _1258 = fma(_1168, _1152, _1250);
        float _1260 = fma(_1228, _1152, _1252);
        float _1262 = fma(_1170, _1152, _1254);
        int _1264 = _908 + 40;
        uint _1266 = uint(int(uint(_1264) >> uint(2)));
        uint _1268 = uint(int(uint(int(_1266)) >> uint(2)));
        int _1270 = int(_1266) & 3;
        float _1272 = (*spvDescriptorSet0.cp_c6)._m0[int(_1268)][_1270];
        int _1274 = int(_1266) + 1;
        uint _1276 = uint(int(uint(_1274) >> uint(2)));
        int _1278 = _1274 & 3;
        float _1280 = (*spvDescriptorSet0.cp_c6)._m0[int(_1276)][_1278];
        float _1282 = fma(_1198, _1184, _1256);
        float _1284 = fma(_1226, _1184, _1260);
        float _1286 = fma(_1200, _1184, _1258);
        float _1288 = fma(_1204, _1184, _1262);
        float _1290 = _1284 + _1192;
        float _1292 = _1206 * _1224;
        int _1294 = _908 + 56;
        uint _1296 = uint(int(uint(_1294) >> uint(2)));
        uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
        int _1300 = int(_1296) & 3;
        float _1302 = (*spvDescriptorSet0.cp_c6)._m0[int(_1298)][_1300];
        int _1304 = int(_1296) + 1;
        uint _1306 = uint(int(uint(_1304) >> uint(2)));
        int _1308 = _1304 & 3;
        float _1310 = (*spvDescriptorSet0.cp_c6)._m0[int(_1306)][_1308];
        float _1312 = _1174 * _1224;
        float _1314 = _1194 * _1224;
        int _1316 = as_type<int>(_1128) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1318 = _1316 + _902;
        int _1320 = _902 + 1;
        float _1322 = _1196 * _1224;
        float _1324 = fma(_1228, _1216, _1292);
        float _1326 = _1206 * _1246;
        float _1328 = _1174 * _1246;
        float _1330 = _1194 * _1246;
        float _1332 = fma(_1168, _1216, _1314);
        float _1334 = _1196 * _1246;
        float _1336 = fma(_1228, _1238, _1326);
        float _1338 = fma(_1166, _1238, _1328);
        int _1340 = _1318 * 48;
        bool _1342 = uint(_1320) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1344 = fma(_1168, _1238, _1330);
        float _1346 = fma(_1166, _1216, _1312);
        float _1348 = fma(_1170, _1216, _1322);
        float _1350 = fma(_1226, _1272, _1324);
        float _1352 = fma(_1170, _1238, _1334);
        float _1354 = fma(_1200, _1272, _1332);
        float _1356 = fma(_1198, _1272, _1346);
        float _1358 = fma(_1204, _1272, _1348);
        float _1360 = fma(_1226, _1302, _1336);
        float _1362 = fma(_1198, _1302, _1338);
        float _1364 = fma(_1200, _1302, _1344);
        int _1366 = _1340 + 16;
        float _1368 = _1350 + _1280;
        int _1370 = _1340 + 32;
        float _1372 = fma(_1204, _1302, _1352);
        float _1374 = _1360 + _1310;
        int _1376 = _1340 + 48;
        uint _1378 = uint(int(uint(_1366) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1378)] = as_type<uint>(_1282);
        int _1380 = _1366 + 4;
        uint _1382 = uint(int(uint(_1380) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1382)] = as_type<uint>(_1286);
        int _1384 = _1366 + 8;
        uint _1386 = uint(int(uint(_1384) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1386)] = as_type<uint>(_1288);
        int _1388 = _1366 + 12;
        uint _1390 = uint(int(uint(_1388) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1390)] = as_type<uint>(_1290);
        uint _1392 = uint(int(uint(_1370) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1392)] = as_type<uint>(_1356);
        int _1394 = _1370 + 4;
        uint _1396 = uint(int(uint(_1394) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1396)] = as_type<uint>(_1354);
        int _1398 = _1370 + 8;
        uint _1400 = uint(int(uint(_1398) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1400)] = as_type<uint>(_1358);
        int _1402 = _1370 + 12;
        uint _1404 = uint(int(uint(_1402) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1404)] = as_type<uint>(_1368);
        uint _1406 = uint(int(uint(_1376) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1406)] = as_type<uint>(_1362);
        int _1408 = _1376 + 4;
        uint _1410 = uint(int(uint(_1408) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1410)] = as_type<uint>(_1364);
        int _1412 = _1376 + 8;
        uint _1414 = uint(int(uint(_1412) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1414)] = as_type<uint>(_1372);
        int _1416 = _1376 + 12;
        uint _1418 = uint(int(uint(_1416) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1418)] = as_type<uint>(_1374);
        _900 = !_1342;
        _898 = _1320;
    } while (_900);
}

