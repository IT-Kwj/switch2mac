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
};

static inline __attribute__((always_inline))
int _54(thread const int& _2650, thread const int& _2651, constant _10& support_buffer)
{
    int _2654 = 1 + _2651;
    float _2656 = support_buffer._m5[_2654].x;
    bool _2658 = _2656 == 1.0;
    if (_2658)
    {
        return _2650;
    }
    float _2660 = float(_2650);
    float _2662 = _2660 * _2656;
    int _2664 = int(_2662);
    return _2664;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _544 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _73 = uint(int(uint(_70) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.cp_c5)._m0[int(_75)][_77];
    int _81 = _64;
    int _83 = 0;
    int _85 = _54(_81, _83, (*spvDescriptorSet0.support_buffer));
    int _87 = as_type<int>(_79);
    int _89 = 0;
    int _91 = _54(_87, _89, (*spvDescriptorSet0.support_buffer));
    int3 _1054 = int3(_85, _91, 1);
    float4 _94 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1054.xy), uint(_1054.z), 0).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    int _104 = _64;
    int _106 = 0;
    int _108 = _54(_104, _106, (*spvDescriptorSet0.support_buffer));
    int _110 = as_type<int>(_79);
    int _112 = 0;
    int _114 = _54(_110, _112, (*spvDescriptorSet0.support_buffer));
    int3 _1074 = int3(_108, _114, 0);
    float3 _118 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1074.xy), uint(_1074.z), 0).xyz;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    int _126 = _64;
    int _128 = 0;
    int _130 = _54(_126, _128, (*spvDescriptorSet0.support_buffer));
    int _132 = as_type<int>(_79);
    int _134 = 0;
    int _136 = _54(_132, _134, (*spvDescriptorSet0.support_buffer));
    int3 _1092 = int3(_130, _136, 2);
    float3 _138 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1092.xy), uint(_1092.z), 0).xyz;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    int _146 = _64 * 48;
    bool _148 = _64 != 0;
    float _150 = _102 * 2.0;
    float _152 = _96 * 2.0;
    float _154 = _98 * 2.0;
    float _156 = _100 * 2.0;
    float _158 = _100 * _150;
    float _160 = _96 * _150;
    float _162 = _98 * _150;
    float _164 = -_152;
    float _166 = fma(_96, _164, 1.0);
    float _168 = -_154;
    float _170 = fma(_98, _168, 1.0);
    float _172 = -_158;
    float _174 = fma(_98, _152, _172);
    float _176 = fma(_100, _152, _162);
    float _178 = fma(_98, _152, _158);
    float _180 = -_162;
    float _182 = fma(_100, _152, _180);
    float _184 = -_156;
    float _186 = fma(_100, _184, _170);
    float _188 = -_156;
    float _190 = fma(_100, _188, _166);
    float _192 = -_160;
    float _194 = fma(_100, _154, _192);
    float _196 = fma(_100, _154, _160);
    float _198 = -_154;
    float _200 = fma(_98, _198, _166);
    float _202 = _120 * _186;
    float _204 = _120 * _178;
    float _206 = _120 * _182;
    float _208 = _122 * _196;
    float _210 = _122 * _174;
    float _212 = _122 * _190;
    float _214 = _124 * _176;
    float _216 = _124 * _194;
    float _218 = _124 * _200;
    int _220 = _64 * 112;
    float _222 = _176;
    float _224 = _200;
    float _226 = _174;
    float _228 = _178;
    float _230 = _190;
    float _232 = _166;
    float _234 = _140;
    float _236 = _208;
    float _238 = _206;
    float _240 = _216;
    float _242 = _218;
    if (!_148)
    {
        _222 = _140;
    }
    float _244 = _222;
    int _246 = _146 + 16;
    uint _248 = uint(int(uint(_246) >> uint(2)));
    _37[int(_248)] = as_type<uint>(_204);
    int _250 = _146 + 20;
    uint _252 = uint(int(uint(_250) >> uint(2)));
    _37[int(_252)] = as_type<uint>(_212);
    int _254 = _146 + 24;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    _37[int(_256)] = as_type<uint>(_216);
    int _258 = _146 + 28;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    _37[int(_260)] = as_type<uint>(_142);
    float _262 = _244;
    if (!_148)
    {
        _224 = _142;
    }
    float _264 = _224;
    float _266 = _264;
    if (!_148)
    {
        _226 = _144;
    }
    float _268 = _226;
    int _270 = _146 + 32;
    uint _272 = uint(int(uint(_270) >> uint(2)));
    _37[int(_272)] = as_type<uint>(_206);
    int _274 = _146 + 36;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    _37[int(_276)] = as_type<uint>(_208);
    int _278 = _146 + 40;
    uint _280 = uint(int(uint(_278) >> uint(2)));
    _37[int(_280)] = as_type<uint>(_218);
    int _282 = _146 + 44;
    uint _284 = uint(int(uint(_282) >> uint(2)));
    _37[int(_284)] = as_type<uint>(_144);
    float _286 = 0.0;
    float _288 = _268;
    if (!_148)
    {
        _286 = _202;
    }
    float _290 = _286;
    float _292 = _290;
    if (!_148)
    {
        _228 = _210;
    }
    float _294 = _228;
    uint _296 = uint(int(uint(_146) >> uint(2)));
    _37[int(_296)] = as_type<uint>(_202);
    int _298 = _146 + 4;
    uint _300 = uint(int(uint(_298) >> uint(2)));
    _37[int(_300)] = as_type<uint>(_210);
    int _302 = _146 + 8;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    _37[int(_304)] = as_type<uint>(_214);
    int _306 = _146 + 12;
    uint _308 = uint(int(uint(_306) >> uint(2)));
    _37[int(_308)] = as_type<uint>(_140);
    float _310 = _294;
    if (!_148)
    {
        _230 = _214;
    }
    float _312 = _230;
    float _314 = _312;
    if (!_148)
    {
        _232 = _204;
    }
    float _316 = _232;
    float _318 = _316;
    if (!_148)
    {
        _234 = _212;
    }
    float _320 = _234;
    bool _322 = !_148;
    float _324 = _320;
    if (!_322)
    {
        bool _326 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _328 = !_326;
        if (!_328)
        {
            uint _330 = uint(int(uint(_220) >> uint(2)));
            uint _332 = uint(int(uint(int(_330)) >> uint(2)));
            int _334 = int(_330) & 3;
            float _336 = (*spvDescriptorSet0.cp_c6)._m0[int(_332)][_334];
            int _338 = as_type<int>(_336) * 48;
            int _340 = 0;
            bool _342;
            float _438;
            float _440;
            float _442;
            float _464;
            float _466;
            float _468;
            float _472;
            float _490;
            float _492;
            float _494;
            float _496;
            do
            {
                int _344 = _340;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _346 = uint(int(uint(_338) >> uint(2)));
                float _348 = as_type<float>(_37[int(_346)]);
                int _350 = _338 + 4;
                uint _352 = uint(int(uint(_350) >> uint(2)));
                float _354 = as_type<float>(_37[int(_352)]);
                int _356 = _338 + 8;
                uint _358 = uint(int(uint(_356) >> uint(2)));
                float _360 = as_type<float>(_37[int(_358)]);
                int _362 = _338 + 12;
                uint _364 = uint(int(uint(_362) >> uint(2)));
                float _366 = as_type<float>(_37[int(_364)]);
                int _368 = _344 + 1;
                int _370 = _338 + 16;
                uint _372 = uint(int(uint(_370) >> uint(2)));
                float _374 = as_type<float>(_37[int(_372)]);
                int _376 = _338 + 20;
                uint _378 = uint(int(uint(_376) >> uint(2)));
                float _380 = as_type<float>(_37[int(_378)]);
                int _382 = _338 + 24;
                uint _384 = uint(int(uint(_382) >> uint(2)));
                float _386 = as_type<float>(_37[int(_384)]);
                int _388 = _338 + 28;
                uint _390 = uint(int(uint(_388) >> uint(2)));
                float _392 = as_type<float>(_37[int(_390)]);
                bool _394 = uint(_368) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _396 = _338 + 32;
                uint _398 = uint(int(uint(_396) >> uint(2)));
                float _400 = as_type<float>(_37[int(_398)]);
                int _402 = _338 + 36;
                uint _404 = uint(int(uint(_402) >> uint(2)));
                float _406 = as_type<float>(_37[int(_404)]);
                int _408 = _338 + 40;
                uint _410 = uint(int(uint(_408) >> uint(2)));
                float _412 = as_type<float>(_37[int(_410)]);
                int _414 = _338 + 44;
                uint _416 = uint(int(uint(_414) >> uint(2)));
                float _418 = as_type<float>(_37[int(_416)]);
                float _420 = _142 * _354;
                float _422 = _204 * _354;
                float _424 = _212 * _354;
                float _426 = _216 * _354;
                float _428 = fma(_140, _348, _420);
                float _430 = fma(_202, _348, _422);
                float _432 = fma(_210, _348, _424);
                float _434 = fma(_214, _348, _426);
                float _436 = fma(_144, _360, _428);
                _438 = fma(_206, _360, _430);
                _440 = fma(_208, _360, _432);
                _442 = fma(_218, _360, _434);
                float _444 = _142 * _380;
                float _446 = _204 * _380;
                float _448 = _212 * _380;
                float _450 = _216 * _380;
                float _452 = _366 + _436;
                float _454 = fma(_140, _374, _444);
                float _456 = fma(_202, _374, _446);
                float _458 = fma(_210, _374, _448);
                float _460 = fma(_214, _374, _450);
                float _462 = fma(_144, _386, _454);
                _464 = fma(_206, _386, _456);
                _466 = fma(_208, _386, _458);
                _468 = fma(_218, _386, _460);
                float _470 = _142 * _406;
                _472 = _392 + _462;
                float _474 = _204 * _406;
                float _476 = _212 * _406;
                float _478 = _216 * _406;
                float _480 = fma(_140, _400, _470);
                float _482 = fma(_202, _400, _474);
                float _484 = fma(_210, _400, _476);
                float _486 = fma(_214, _400, _478);
                float _488 = fma(_144, _412, _480);
                _490 = fma(_206, _412, _482);
                _492 = fma(_208, _412, _484);
                _494 = fma(_218, _412, _486);
                _496 = _418 + _488;
                uint _498 = uint(int(uint(_146) >> uint(2)));
                _37[int(_498)] = as_type<uint>(_438);
                int _500 = _146 + 4;
                uint _502 = uint(int(uint(_500) >> uint(2)));
                _37[int(_502)] = as_type<uint>(_440);
                int _504 = _146 + 8;
                uint _506 = uint(int(uint(_504) >> uint(2)));
                _37[int(_506)] = as_type<uint>(_442);
                int _508 = _146 + 12;
                uint _510 = uint(int(uint(_508) >> uint(2)));
                _37[int(_510)] = as_type<uint>(_452);
                int _512 = _146 + 16;
                uint _514 = uint(int(uint(_512) >> uint(2)));
                _37[int(_514)] = as_type<uint>(_464);
                int _516 = _146 + 20;
                uint _518 = uint(int(uint(_516) >> uint(2)));
                _37[int(_518)] = as_type<uint>(_466);
                int _520 = _146 + 24;
                uint _522 = uint(int(uint(_520) >> uint(2)));
                _37[int(_522)] = as_type<uint>(_468);
                int _524 = _146 + 28;
                uint _526 = uint(int(uint(_524) >> uint(2)));
                _37[int(_526)] = as_type<uint>(_472);
                int _528 = _146 + 32;
                uint _530 = uint(int(uint(_528) >> uint(2)));
                _37[int(_530)] = as_type<uint>(_490);
                int _532 = _146 + 36;
                uint _534 = uint(int(uint(_532) >> uint(2)));
                _37[int(_534)] = as_type<uint>(_492);
                int _536 = _146 + 40;
                uint _538 = uint(int(uint(_536) >> uint(2)));
                _37[int(_538)] = as_type<uint>(_494);
                int _540 = _146 + 44;
                uint _542 = uint(int(uint(_540) >> uint(2)));
                _37[int(_542)] = as_type<uint>(_496);
                _342 = !_394;
                _340 = _368;
                _262 = _452;
            } while (_342);
            _324 = _466;
            _236 = _492;
            _310 = _440;
            _318 = _464;
            _238 = _490;
            _292 = _438;
            _314 = _442;
            _240 = _468;
            _242 = _494;
            _266 = _472;
            _288 = _496;
            _544 = true;
        }
        else
        {
            _324 = 0.0;
            _236 = 0.0;
            _310 = 0.0;
            _318 = 0.0;
            _238 = 0.0;
            _292 = 0.0;
            _314 = 0.0;
            _240 = 0.0;
            _242 = 0.0;
            _266 = 0.0;
            _262 = 0.0;
            _288 = 0.0;
        }
    }
    _544 = false;
    float _546 = _324;
    float _548 = _236;
    float _550 = _310;
    float _552 = _318;
    float _554 = _238;
    float _556 = _292;
    float _558 = _314;
    float _560 = _240;
    float _562 = _242;
    float _564 = _266;
    float _566 = _262;
    float _568 = _288;
    int _570 = _220 + 80;
    uint _572 = uint(int(uint(_570) >> uint(2)));
    uint _574 = uint(int(uint(int(_572)) >> uint(2)));
    int _576 = int(_572) & 3;
    float _578 = (*spvDescriptorSet0.cp_c6)._m0[int(_574)][_576];
    int _580 = int(_572) + 1;
    uint _582 = uint(int(uint(_580) >> uint(2)));
    int _584 = _580 & 3;
    float _586 = (*spvDescriptorSet0.cp_c6)._m0[int(_582)][_584];
    int _588 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _590 = _588 + _64;
    int _592 = _220 + 64;
    uint _594 = uint(int(uint(_592) >> uint(2)));
    uint _596 = uint(int(uint(int(_594)) >> uint(2)));
    int _598 = int(_594) & 3;
    float _600 = (*spvDescriptorSet0.cp_c6)._m0[int(_596)][_598];
    int _602 = int(_594) + 1;
    uint _604 = uint(int(uint(_602) >> uint(2)));
    int _606 = _602 & 3;
    float _608 = (*spvDescriptorSet0.cp_c6)._m0[int(_604)][_606];
    int _610 = _590 * 48;
    int _612 = _220 + 88;
    uint _614 = uint(int(uint(_612) >> uint(2)));
    uint _616 = uint(int(uint(int(_614)) >> uint(2)));
    int _618 = int(_614) & 3;
    float _620 = (*spvDescriptorSet0.cp_c6)._m0[int(_616)][_618];
    int _622 = int(_614) + 1;
    uint _624 = uint(int(uint(_622) >> uint(2)));
    int _626 = _622 & 3;
    float _628 = (*spvDescriptorSet0.cp_c6)._m0[int(_624)][_626];
    int _630 = _220 + 72;
    uint _632 = uint(int(uint(_630) >> uint(2)));
    uint _634 = uint(int(uint(int(_632)) >> uint(2)));
    int _636 = int(_632) & 3;
    float _638 = (*spvDescriptorSet0.cp_c6)._m0[int(_634)][_636];
    int _640 = int(_632) + 1;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    int _644 = _640 & 3;
    float _646 = (*spvDescriptorSet0.cp_c6)._m0[int(_642)][_644];
    int _648 = _220 + 96;
    uint _650 = uint(int(uint(_648) >> uint(2)));
    uint _652 = uint(int(uint(int(_650)) >> uint(2)));
    int _654 = int(_650) & 3;
    float _656 = (*spvDescriptorSet0.cp_c6)._m0[int(_652)][_654];
    int _658 = int(_650) + 1;
    uint _660 = uint(int(uint(_658) >> uint(2)));
    int _662 = _658 & 3;
    float _664 = (*spvDescriptorSet0.cp_c6)._m0[int(_660)][_662];
    int _666 = _220 + 104;
    uint _668 = uint(int(uint(_666) >> uint(2)));
    uint _670 = uint(int(uint(int(_668)) >> uint(2)));
    int _672 = int(_668) & 3;
    float _674 = (*spvDescriptorSet0.cp_c6)._m0[int(_670)][_672];
    int _676 = int(_668) + 1;
    uint _678 = uint(int(uint(_676) >> uint(2)));
    int _680 = _676 & 3;
    float _682 = (*spvDescriptorSet0.cp_c6)._m0[int(_678)][_680];
    float _684 = _546 * _578;
    float _686 = _548 * _578;
    int _688 = _220 + 16;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    uint _692 = uint(int(uint(int(_690)) >> uint(2)));
    int _694 = int(_690) & 3;
    float _696 = (*spvDescriptorSet0.cp_c6)._m0[int(_692)][_694];
    int _698 = int(_690) + 1;
    uint _700 = uint(int(uint(_698) >> uint(2)));
    int _702 = _698 & 3;
    float _704 = (*spvDescriptorSet0.cp_c6)._m0[int(_700)][_702];
    float _706 = _550 * _578;
    float _708 = fma(_552, _600, _684);
    float _710 = fma(_554, _600, _686);
    float _712 = _550 * _586;
    float _714 = _546 * _586;
    float _716 = _548 * _586;
    int _718 = _220 + 32;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    uint _722 = uint(int(uint(int(_720)) >> uint(2)));
    int _724 = int(_720) & 3;
    float _726 = (*spvDescriptorSet0.cp_c6)._m0[int(_722)][_724];
    int _728 = int(_720) + 1;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    int _732 = _728 & 3;
    float _734 = (*spvDescriptorSet0.cp_c6)._m0[int(_730)][_732];
    float _736 = fma(_556, _608, _712);
    float _738 = fma(_552, _608, _714);
    float _740 = fma(_554, _608, _716);
    float _742 = _550 * _620;
    float _744 = _550 * _628;
    float _746 = _546 * _620;
    float _748 = _548 * _620;
    int _750 = _220 + 48;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.cp_c6)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.cp_c6)._m0[int(_762)][_764];
    float _768 = _546 * _628;
    float _770 = _548 * _628;
    float _772 = fma(_556, _638, _742);
    float _774 = fma(_556, _646, _744);
    float _776 = fma(_552, _638, _746);
    float _778 = fma(_552, _646, _768);
    float _780 = fma(_554, _638, _748);
    int _782 = _220 + 24;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    uint _786 = uint(int(uint(int(_784)) >> uint(2)));
    int _788 = int(_784) & 3;
    float _790 = (*spvDescriptorSet0.cp_c6)._m0[int(_786)][_788];
    int _792 = int(_784) + 1;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    int _796 = _792 & 3;
    float _798 = (*spvDescriptorSet0.cp_c6)._m0[int(_794)][_796];
    float _800 = fma(_554, _646, _770);
    float _802 = fma(_556, _600, _706);
    float _804 = fma(_558, _664, _736);
    float _806 = fma(_560, _656, _708);
    float _808 = fma(_560, _664, _738);
    float _810 = fma(_562, _656, _710);
    float _812 = fma(_562, _664, _740);
    int _814 = _220 + 40;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    uint _818 = uint(int(uint(int(_816)) >> uint(2)));
    int _820 = int(_816) & 3;
    float _822 = (*spvDescriptorSet0.cp_c6)._m0[int(_818)][_820];
    int _824 = int(_816) + 1;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    int _828 = _824 & 3;
    float _830 = (*spvDescriptorSet0.cp_c6)._m0[int(_826)][_828];
    float _832 = fma(_558, _656, _802);
    int _834 = _610 + 32;
    float _836 = fma(_560, _674, _776);
    float _838 = fma(_560, _682, _778);
    float _840 = fma(_558, _682, _774);
    float _842 = fma(_562, _682, _800);
    float _844 = fma(_562, _674, _780);
    int _846 = _220 + 56;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.cp_c6)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.cp_c6)._m0[int(_858)][_860];
    float _864 = _838 + _564;
    float _866 = _840 + _566;
    float _868 = _842 + _568;
    float _870 = fma(_558, _674, _772);
    float _872 = _864 * _704;
    float _874 = _808 * _704;
    float _876 = _836 * _704;
    float _878 = _806 * _704;
    float _880 = fma(_866, _696, _872);
    float _882 = fma(_804, _696, _874);
    float _884 = fma(_870, _696, _876);
    float _886 = fma(_832, _696, _878);
    float _888 = _864 * _734;
    float _890 = _836 * _734;
    float _892 = _808 * _734;
    float _894 = _806 * _734;
    float _896 = fma(_866, _726, _888);
    float _898 = fma(_870, _726, _890);
    float _900 = fma(_804, _726, _892);
    float _902 = fma(_832, _726, _894);
    float _904 = _864 * _766;
    float _906 = _836 * _766;
    float _908 = _808 * _766;
    float _910 = _806 * _766;
    float _912 = fma(_866, _758, _904);
    float _914 = fma(_870, _758, _906);
    float _916 = fma(_804, _758, _908);
    float _918 = fma(_832, _758, _910);
    float _920 = fma(_868, _790, _880);
    float _922 = fma(_812, _790, _882);
    float _924 = fma(_810, _790, _886);
    float _926 = fma(_844, _790, _884);
    float _928 = _920 + _798;
    float _930 = fma(_868, _822, _896);
    float _932 = fma(_812, _822, _900);
    float _934 = fma(_810, _822, _902);
    float _936 = fma(_844, _822, _898);
    float _938 = _930 + _830;
    float _940 = fma(_868, _854, _912);
    float _942 = fma(_844, _854, _914);
    int _944 = _610 + 16;
    float _946 = fma(_810, _854, _918);
    float _948 = fma(_812, _854, _916);
    float _950 = _940 + _862;
    int _952 = _610 + 48;
    uint _954 = uint(int(uint(_944) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_954)] = as_type<uint>(_924);
    int _956 = _944 + 4;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_958)] = as_type<uint>(_922);
    int _960 = _944 + 8;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_962)] = as_type<uint>(_926);
    int _964 = _944 + 12;
    uint _966 = uint(int(uint(_964) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_966)] = as_type<uint>(_928);
    uint _968 = uint(int(uint(_834) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_968)] = as_type<uint>(_934);
    int _970 = _834 + 4;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_972)] = as_type<uint>(_932);
    int _974 = _834 + 8;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_976)] = as_type<uint>(_936);
    int _978 = _834 + 12;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_980)] = as_type<uint>(_938);
    uint _982 = uint(int(uint(_952) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_982)] = as_type<uint>(_946);
    int _984 = _952 + 4;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_986)] = as_type<uint>(_948);
    int _988 = _952 + 8;
    uint _990 = uint(int(uint(_988) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_990)] = as_type<uint>(_942);
    int _992 = _952 + 12;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_994)] = as_type<uint>(_950);
}

