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
int _56(thread const int& _3177, thread const int& _3178, constant _10& support_buffer)
{
    int _3181 = 1 + _3178;
    float _3183 = support_buffer._m5[_3181].x;
    bool _3185 = _3183 == 1.0;
    if (_3185)
    {
        return _3177;
    }
    float _3187 = float(_3177);
    float _3189 = _3187 * _3183;
    int _3191 = int(_3189);
    return _3191;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _700 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.cp_c5)._m0[int(_77)][_79];
    int _83 = int(_75) + 1;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    int _87 = _83 & 3;
    float _89 = (*spvDescriptorSet0.cp_c5)._m0[int(_85)][_87];
    int _91 = _66;
    int _93 = 0;
    int _95 = _56(_91, _93, (*spvDescriptorSet0.support_buffer));
    int _97 = as_type<int>(_81);
    int _99 = 0;
    int _101 = _56(_97, _99, (*spvDescriptorSet0.support_buffer));
    int3 _1267 = int3(_95, _101, 1);
    float4 _104 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1267.xy), uint(_1267.z), 0).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    int _114 = _66;
    int _116 = 0;
    int _118 = _56(_114, _116, (*spvDescriptorSet0.support_buffer));
    int _120 = as_type<int>(_89);
    int _122 = 0;
    int _124 = _56(_120, _122, (*spvDescriptorSet0.support_buffer));
    int3 _1287 = int3(_118, _124, 1);
    float4 _126 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1287.xy), uint(_1287.z), 0).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    int _136 = _66;
    int _138 = 0;
    int _140 = _56(_136, _138, (*spvDescriptorSet0.support_buffer));
    int _142 = as_type<int>(_81);
    int _144 = 0;
    int _146 = _56(_142, _144, (*spvDescriptorSet0.support_buffer));
    int3 _1307 = int3(_140, _146, 0);
    float3 _150 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1307.xy), uint(_1307.z), 0).xyz;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    int _158 = _66;
    int _160 = 0;
    int _162 = _56(_158, _160, (*spvDescriptorSet0.support_buffer));
    int _164 = as_type<int>(_89);
    int _166 = 0;
    int _168 = _56(_164, _166, (*spvDescriptorSet0.support_buffer));
    int3 _1325 = int3(_162, _168, 0);
    float3 _170 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1325.xy), uint(_1325.z), 0).xyz;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    int _178 = _66;
    int _180 = 0;
    int _182 = _56(_178, _180, (*spvDescriptorSet0.support_buffer));
    int _184 = as_type<int>(_81);
    int _186 = 0;
    int _188 = _56(_184, _186, (*spvDescriptorSet0.support_buffer));
    int3 _1343 = int3(_182, _188, 2);
    float3 _190 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1343.xy), uint(_1343.z), 0).xyz;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    int _198 = _66;
    int _200 = 0;
    int _202 = _56(_198, _200, (*spvDescriptorSet0.support_buffer));
    int _204 = as_type<int>(_89);
    int _206 = 0;
    int _208 = _56(_204, _206, (*spvDescriptorSet0.support_buffer));
    int3 _1361 = int3(_202, _208, 2);
    float3 _210 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1361.xy), uint(_1361.z), 0).xyz;
    float _212 = _210.x;
    float _214 = _210.y;
    float _216 = _210.z;
    int _218 = _72 + 16;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    uint _222 = uint(int(uint(int(_220)) >> uint(2)));
    int _224 = int(_220) & 3;
    float _226 = (*spvDescriptorSet0.cp_c5)._m0[int(_222)][_224];
    bool _228 = _66 != 0;
    float _230 = -_112;
    float _232 = _230 + _134;
    float _234 = -_106;
    float _236 = _234 + _128;
    float _238 = -_108;
    float _240 = _238 + _130;
    float _242 = -_110;
    float _244 = _242 + _132;
    float _246 = fma(_232, _226, _112);
    float _248 = fma(_236, _226, _106);
    float _250 = fma(_240, _226, _108);
    float _252 = fma(_244, _226, _110);
    float _254 = _246 * 2.0;
    float _256 = _248 * 2.0;
    float _258 = _250 * 2.0;
    float _260 = _248 * _254;
    float _262 = _252 * _254;
    float _264 = _250 * _254;
    float _266 = _248 * _248;
    float _268 = -_260;
    float _270 = fma(_252, _258, _268);
    float _272 = fma(_252, _258, _260);
    float _274 = -_262;
    float _276 = fma(_250, _256, _274);
    float _278 = fma(_250, _256, _262);
    float _280 = fma(_252, _256, _264);
    float _282 = -_264;
    float _284 = fma(_252, _256, _282);
    float _286 = _250 * _250;
    float _288 = -_154;
    float _290 = _288 + _174;
    float _292 = fma(_266, -2.0, 1.0);
    float _294 = -_156;
    float _296 = _294 + _176;
    float _298 = fma(_286, -2.0, 1.0);
    float _300 = fma(_290, _226, _154);
    float _302 = -_152;
    float _304 = _302 + _172;
    float _306 = _252 * _252;
    float _308 = fma(_286, -2.0, _292);
    float _310 = fma(_296, _226, _156);
    float _312 = _300 * _272;
    float _314 = fma(_304, _226, _152);
    float _316 = fma(_306, -2.0, _298);
    float _318 = _310 * _308;
    float _320 = fma(_306, -2.0, _292);
    float _322 = -_192;
    float _324 = _322 + _212;
    float _326 = -_194;
    float _328 = _326 + _214;
    float _330 = -_196;
    float _332 = _330 + _216;
    float _334 = _314 * _316;
    float _336 = _314 * _278;
    float _338 = _314 * _284;
    float _340 = _300 * _320;
    float _342 = _300 * _276;
    float _344 = _310 * _280;
    float _346 = _310 * _270;
    float _348 = fma(_324, _226, _192);
    int _350 = _66 * 48;
    float _352 = fma(_328, _226, _194);
    float _354 = fma(_332, _226, _196);
    int _356 = _66 * 112;
    float _358 = _174;
    float _360 = _300;
    float _362 = _292;
    float _364 = _156;
    float _366 = _310;
    float _368 = _172;
    float _370 = _276;
    float _372 = _306;
    float _374 = _152;
    float _376 = _328;
    float _378 = _130;
    float _380 = _320;
    if (!_228)
    {
        _358 = _348;
    }
    float _382 = _358;
    uint _384 = uint(int(uint(_350) >> uint(2)));
    _39[int(_384)] = as_type<uint>(_334);
    int _386 = _350 + 4;
    uint _388 = uint(int(uint(_386) >> uint(2)));
    _39[int(_388)] = as_type<uint>(_342);
    int _390 = _350 + 8;
    uint _392 = uint(int(uint(_390) >> uint(2)));
    _39[int(_392)] = as_type<uint>(_344);
    int _394 = _350 + 12;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    _39[int(_396)] = as_type<uint>(_348);
    int _398 = _350 + 16;
    int _400 = _350 + 32;
    int _402 = _350 + 16;
    uint _404 = uint(int(uint(_402) >> uint(2)));
    _39[int(_404)] = as_type<uint>(_336);
    int _406 = _350 + 20;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    _39[int(_408)] = as_type<uint>(_340);
    int _410 = _350 + 24;
    uint _412 = uint(int(uint(_410) >> uint(2)));
    _39[int(_412)] = as_type<uint>(_346);
    int _414 = _350 + 28;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    _39[int(_416)] = as_type<uint>(_352);
    float _418 = _382;
    if (!_228)
    {
        _360 = _352;
    }
    float _420 = _360;
    float _422 = _420;
    if (!_228)
    {
        _362 = _354;
    }
    float _424 = _362;
    int _426 = _350 + 32;
    uint _428 = uint(int(uint(_426) >> uint(2)));
    _39[int(_428)] = as_type<uint>(_338);
    int _430 = _350 + 36;
    uint _432 = uint(int(uint(_430) >> uint(2)));
    _39[int(_432)] = as_type<uint>(_312);
    int _434 = _350 + 40;
    uint _436 = uint(int(uint(_434) >> uint(2)));
    _39[int(_436)] = as_type<uint>(_318);
    int _438 = _350 + 44;
    uint _440 = uint(int(uint(_438) >> uint(2)));
    _39[int(_440)] = as_type<uint>(_354);
    float _442 = _424;
    if (!_228)
    {
        _364 = _334;
    }
    float _444 = _364;
    float _446 = _444;
    if (!_228)
    {
        _366 = _342;
    }
    float _448 = _366;
    float _450 = _448;
    if (!_228)
    {
        _368 = _344;
    }
    float _452 = _368;
    float _454 = _452;
    if (!_228)
    {
        _370 = _336;
    }
    float _456 = _370;
    float _458 = _456;
    if (!_228)
    {
        _372 = _340;
    }
    float _460 = _372;
    float _462 = _460;
    if (!_228)
    {
        _374 = _346;
    }
    float _464 = _374;
    float _466 = _464;
    if (!_228)
    {
        _376 = _338;
    }
    float _468 = _376;
    float _470 = _468;
    if (!_228)
    {
        _378 = _312;
    }
    float _472 = _378;
    float _474 = _472;
    if (!_228)
    {
        _380 = _318;
    }
    float _476 = _380;
    bool _478 = !_228;
    float _480 = _476;
    if (!_478)
    {
        bool _482 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _484 = !_482;
        if (!_484)
        {
            uint _486 = uint(int(uint(_356) >> uint(2)));
            uint _488 = uint(int(uint(int(_486)) >> uint(2)));
            int _490 = int(_486) & 3;
            float _492 = (*spvDescriptorSet0.cp_c6)._m0[int(_488)][_490];
            int _494 = as_type<int>(_492) * 48;
            int _496 = 0;
            bool _498;
            float _594;
            float _596;
            float _600;
            float _618;
            float _620;
            float _630;
            float _642;
            float _644;
            float _646;
            float _648;
            float _650;
            float _652;
            do
            {
                int _500 = _496;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _502 = uint(int(uint(_494) >> uint(2)));
                float _504 = as_type<float>(_39[int(_502)]);
                int _506 = _494 + 4;
                uint _508 = uint(int(uint(_506) >> uint(2)));
                float _510 = as_type<float>(_39[int(_508)]);
                int _512 = _494 + 8;
                uint _514 = uint(int(uint(_512) >> uint(2)));
                float _516 = as_type<float>(_39[int(_514)]);
                int _518 = _494 + 12;
                uint _520 = uint(int(uint(_518) >> uint(2)));
                float _522 = as_type<float>(_39[int(_520)]);
                int _524 = _500 + 1;
                int _526 = _494 + 16;
                uint _528 = uint(int(uint(_526) >> uint(2)));
                float _530 = as_type<float>(_39[int(_528)]);
                int _532 = _494 + 20;
                uint _534 = uint(int(uint(_532) >> uint(2)));
                float _536 = as_type<float>(_39[int(_534)]);
                int _538 = _494 + 24;
                uint _540 = uint(int(uint(_538) >> uint(2)));
                float _542 = as_type<float>(_39[int(_540)]);
                int _544 = _494 + 28;
                uint _546 = uint(int(uint(_544) >> uint(2)));
                float _548 = as_type<float>(_39[int(_546)]);
                bool _550 = uint(_524) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _552 = _494 + 32;
                uint _554 = uint(int(uint(_552) >> uint(2)));
                float _556 = as_type<float>(_39[int(_554)]);
                int _558 = _494 + 36;
                uint _560 = uint(int(uint(_558) >> uint(2)));
                float _562 = as_type<float>(_39[int(_560)]);
                int _564 = _494 + 40;
                uint _566 = uint(int(uint(_564) >> uint(2)));
                float _568 = as_type<float>(_39[int(_566)]);
                int _570 = _494 + 44;
                uint _572 = uint(int(uint(_570) >> uint(2)));
                float _574 = as_type<float>(_39[int(_572)]);
                float _576 = _352 * _510;
                float _578 = _336 * _510;
                float _580 = _340 * _510;
                float _582 = _346 * _510;
                float _584 = fma(_348, _504, _576);
                float _586 = fma(_334, _504, _578);
                float _588 = fma(_342, _504, _580);
                float _590 = fma(_344, _504, _582);
                float _592 = fma(_354, _516, _584);
                _594 = fma(_338, _516, _586);
                _596 = fma(_312, _516, _588);
                float _598 = _336 * _536;
                _600 = _522 + _592;
                float _602 = _352 * _536;
                float _604 = _340 * _536;
                float _606 = _346 * _536;
                float _608 = fma(_334, _530, _598);
                float _610 = fma(_348, _530, _602);
                float _612 = fma(_342, _530, _604);
                float _614 = fma(_344, _530, _606);
                float _616 = _352 * _562;
                _618 = fma(_338, _542, _608);
                _620 = fma(_312, _542, _612);
                float _622 = _336 * _562;
                float _624 = _340 * _562;
                float _626 = _346 * _562;
                float _628 = fma(_348, _556, _616);
                _630 = fma(_318, _542, _614);
                float _632 = fma(_334, _556, _622);
                float _634 = fma(_342, _556, _624);
                float _636 = fma(_354, _542, _610);
                float _638 = fma(_344, _556, _626);
                float _640 = fma(_354, _568, _628);
                _642 = fma(_338, _568, _632);
                _644 = fma(_312, _568, _634);
                _646 = fma(_318, _516, _590);
                _648 = _548 + _636;
                _650 = fma(_318, _568, _638);
                _652 = _574 + _640;
                uint _654 = uint(int(uint(_350) >> uint(2)));
                _39[int(_654)] = as_type<uint>(_594);
                int _656 = _350 + 4;
                uint _658 = uint(int(uint(_656) >> uint(2)));
                _39[int(_658)] = as_type<uint>(_596);
                int _660 = _350 + 8;
                uint _662 = uint(int(uint(_660) >> uint(2)));
                _39[int(_662)] = as_type<uint>(_646);
                int _664 = _350 + 12;
                uint _666 = uint(int(uint(_664) >> uint(2)));
                _39[int(_666)] = as_type<uint>(_600);
                int _668 = _350 + 16;
                uint _670 = uint(int(uint(_668) >> uint(2)));
                _39[int(_670)] = as_type<uint>(_618);
                int _672 = _350 + 20;
                uint _674 = uint(int(uint(_672) >> uint(2)));
                _39[int(_674)] = as_type<uint>(_620);
                int _676 = _350 + 24;
                uint _678 = uint(int(uint(_676) >> uint(2)));
                _39[int(_678)] = as_type<uint>(_630);
                int _680 = _350 + 28;
                uint _682 = uint(int(uint(_680) >> uint(2)));
                _39[int(_682)] = as_type<uint>(_648);
                int _684 = _350 + 32;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                _39[int(_686)] = as_type<uint>(_642);
                int _688 = _350 + 36;
                uint _690 = uint(int(uint(_688) >> uint(2)));
                _39[int(_690)] = as_type<uint>(_644);
                int _692 = _350 + 40;
                uint _694 = uint(int(uint(_692) >> uint(2)));
                _39[int(_694)] = as_type<uint>(_650);
                int _696 = _350 + 44;
                uint _698 = uint(int(uint(_696) >> uint(2)));
                _39[int(_698)] = as_type<uint>(_652);
                _498 = !_550;
                _496 = _524;
            } while (_498);
            _446 = _594;
            _450 = _596;
            _454 = _646;
            _418 = _600;
            _458 = _618;
            _462 = _620;
            _466 = _630;
            _422 = _648;
            _470 = _642;
            _474 = _644;
            _480 = _650;
            _442 = _652;
            _700 = true;
        }
        else
        {
            _446 = 0.0;
            _450 = 0.0;
            _454 = 0.0;
            _418 = 0.0;
            _458 = 0.0;
            _462 = 0.0;
            _466 = 0.0;
            _422 = 0.0;
            _470 = 0.0;
            _474 = 0.0;
            _480 = 0.0;
            _442 = 0.0;
        }
    }
    _700 = false;
    float _702 = _446;
    float _704 = _450;
    float _706 = _454;
    float _708 = _418;
    float _710 = _458;
    float _712 = _462;
    float _714 = _466;
    float _716 = _422;
    float _718 = _470;
    float _720 = _474;
    float _722 = _480;
    float _724 = _442;
    int _726 = _356 + 80;
    uint _728 = uint(int(uint(_726) >> uint(2)));
    uint _730 = uint(int(uint(int(_728)) >> uint(2)));
    int _732 = int(_728) & 3;
    float _734 = (*spvDescriptorSet0.cp_c6)._m0[int(_730)][_732];
    int _736 = int(_728) + 1;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    int _740 = _736 & 3;
    float _742 = (*spvDescriptorSet0.cp_c6)._m0[int(_738)][_740];
    bool _744 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _746 = _356 + 64;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    uint _750 = uint(int(uint(int(_748)) >> uint(2)));
    int _752 = int(_748) & 3;
    float _754 = (*spvDescriptorSet0.cp_c6)._m0[int(_750)][_752];
    int _756 = int(_748) + 1;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    int _760 = _756 & 3;
    float _762 = (*spvDescriptorSet0.cp_c6)._m0[int(_758)][_760];
    int _764 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _766 = _764 + _66;
    int _768 = _356 + 88;
    uint _770 = uint(int(uint(_768) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.cp_c6)._m0[int(_772)][_774];
    int _778 = int(_770) + 1;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    int _782 = _778 & 3;
    float _784 = (*spvDescriptorSet0.cp_c6)._m0[int(_780)][_782];
    int _786 = _356 + 72;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    uint _790 = uint(int(uint(int(_788)) >> uint(2)));
    int _792 = int(_788) & 3;
    float _794 = (*spvDescriptorSet0.cp_c6)._m0[int(_790)][_792];
    int _796 = int(_788) + 1;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    int _800 = _796 & 3;
    float _802 = (*spvDescriptorSet0.cp_c6)._m0[int(_798)][_800];
    int _804 = _356 + 96;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    uint _808 = uint(int(uint(int(_806)) >> uint(2)));
    int _810 = int(_806) & 3;
    float _812 = (*spvDescriptorSet0.cp_c6)._m0[int(_808)][_810];
    int _814 = int(_806) + 1;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    int _818 = _814 & 3;
    float _820 = (*spvDescriptorSet0.cp_c6)._m0[int(_816)][_818];
    int _822 = _356 + 104;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    uint _826 = uint(int(uint(int(_824)) >> uint(2)));
    int _828 = int(_824) & 3;
    float _830 = (*spvDescriptorSet0.cp_c6)._m0[int(_826)][_828];
    int _832 = int(_824) + 1;
    uint _834 = uint(int(uint(_832) >> uint(2)));
    int _836 = _832 & 3;
    float _838 = (*spvDescriptorSet0.cp_c6)._m0[int(_834)][_836];
    int _840 = _356 + 16;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    uint _844 = uint(int(uint(int(_842)) >> uint(2)));
    int _846 = int(_842) & 3;
    float _848 = (*spvDescriptorSet0.cp_c6)._m0[int(_844)][_846];
    int _850 = int(_842) + 1;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    int _854 = _850 & 3;
    float _856 = (*spvDescriptorSet0.cp_c6)._m0[int(_852)][_854];
    if (!_744)
    {
        uint _858 = uint(int(uint(_350) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_858)] = as_type<uint>(_702);
        int _860 = _350 + 4;
        uint _862 = uint(int(uint(_860) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_862)] = as_type<uint>(_704);
        int _864 = _350 + 8;
        uint _866 = uint(int(uint(_864) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_866)] = as_type<uint>(_706);
        int _868 = _350 + 12;
        uint _870 = uint(int(uint(_868) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_870)] = as_type<uint>(_708);
        uint _872 = uint(int(uint(_398) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_872)] = as_type<uint>(_710);
        int _874 = _398 + 4;
        uint _876 = uint(int(uint(_874) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_876)] = as_type<uint>(_712);
        int _878 = _398 + 8;
        uint _880 = uint(int(uint(_878) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_880)] = as_type<uint>(_714);
        int _882 = _398 + 12;
        uint _884 = uint(int(uint(_882) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_884)] = as_type<uint>(_716);
        uint _886 = uint(int(uint(_400) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_886)] = as_type<uint>(_718);
        int _888 = _400 + 4;
        uint _890 = uint(int(uint(_888) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_890)] = as_type<uint>(_720);
        int _892 = _400 + 8;
        uint _894 = uint(int(uint(_892) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_894)] = as_type<uint>(_722);
        int _896 = _400 + 12;
        uint _898 = uint(int(uint(_896) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_898)] = as_type<uint>(_724);
    }
    float _900 = _712 * _734;
    float _902 = _720 * _734;
    int _904 = _356 + 32;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    uint _908 = uint(int(uint(int(_906)) >> uint(2)));
    int _910 = int(_906) & 3;
    float _912 = (*spvDescriptorSet0.cp_c6)._m0[int(_908)][_910];
    int _914 = int(_906) + 1;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    int _918 = _914 & 3;
    float _920 = (*spvDescriptorSet0.cp_c6)._m0[int(_916)][_918];
    float _922 = _704 * _734;
    float _924 = fma(_710, _754, _900);
    float _926 = fma(_718, _754, _902);
    float _928 = _704 * _742;
    float _930 = _712 * _742;
    float _932 = _720 * _742;
    float _934 = _704 * _784;
    int _936 = _356 + 48;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    uint _940 = uint(int(uint(int(_938)) >> uint(2)));
    int _942 = int(_938) & 3;
    float _944 = (*spvDescriptorSet0.cp_c6)._m0[int(_940)][_942];
    int _946 = int(_938) + 1;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    int _950 = _946 & 3;
    float _952 = (*spvDescriptorSet0.cp_c6)._m0[int(_948)][_950];
    float _954 = fma(_702, _762, _928);
    float _956 = _704 * _776;
    float _958 = fma(_710, _762, _930);
    float _960 = fma(_718, _762, _932);
    float _962 = _712 * _776;
    float _964 = _712 * _784;
    float _966 = _720 * _776;
    float _968 = _720 * _784;
    float _970 = fma(_702, _794, _956);
    int _972 = _356 + 24;
    uint _974 = uint(int(uint(_972) >> uint(2)));
    uint _976 = uint(int(uint(int(_974)) >> uint(2)));
    int _978 = int(_974) & 3;
    float _980 = (*spvDescriptorSet0.cp_c6)._m0[int(_976)][_978];
    int _982 = int(_974) + 1;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    int _986 = _982 & 3;
    float _988 = (*spvDescriptorSet0.cp_c6)._m0[int(_984)][_986];
    float _990 = fma(_702, _802, _934);
    float _992 = fma(_710, _794, _962);
    float _994 = fma(_710, _802, _964);
    float _996 = fma(_718, _794, _966);
    float _998 = fma(_718, _802, _968);
    float _1000 = fma(_706, _820, _954);
    float _1002 = fma(_714, _812, _924);
    int _1004 = _356 + 40;
    uint _1006 = uint(int(uint(_1004) >> uint(2)));
    uint _1008 = uint(int(uint(int(_1006)) >> uint(2)));
    int _1010 = int(_1006) & 3;
    float _1012 = (*spvDescriptorSet0.cp_c6)._m0[int(_1008)][_1010];
    int _1014 = int(_1006) + 1;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    int _1018 = _1014 & 3;
    float _1020 = (*spvDescriptorSet0.cp_c6)._m0[int(_1016)][_1018];
    float _1022 = fma(_714, _820, _958);
    float _1024 = fma(_714, _830, _992);
    float _1026 = fma(_714, _838, _994);
    float _1028 = fma(_702, _754, _922);
    float _1030 = fma(_706, _838, _990);
    float _1032 = fma(_706, _830, _970);
    float _1034 = _1026 + _716;
    int _1036 = _356 + 56;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.cp_c6)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.cp_c6)._m0[int(_1048)][_1050];
    float _1054 = fma(_706, _812, _1028);
    float _1056 = fma(_722, _838, _998);
    float _1058 = _1030 + _708;
    float _1060 = _1034 * _856;
    float _1062 = fma(_722, _812, _926);
    float _1064 = fma(_722, _820, _960);
    float _1066 = fma(_722, _830, _996);
    float _1068 = _1022 * _856;
    float _1070 = _1056 + _724;
    float _1072 = _1002 * _856;
    float _1074 = _1024 * _856;
    float _1076 = fma(_1058, _848, _1060);
    int _1078 = _766 * 48;
    float _1080 = _1034 * _920;
    float _1082 = _1022 * _920;
    float _1084 = _1002 * _920;
    float _1086 = _1024 * _920;
    float _1088 = fma(_1058, _912, _1080);
    float _1090 = fma(_1054, _848, _1072);
    float _1092 = fma(_1000, _848, _1068);
    float _1094 = fma(_1032, _848, _1074);
    float _1096 = _1034 * _952;
    float _1098 = _1022 * _952;
    float _1100 = _1002 * _952;
    float _1102 = _1024 * _952;
    float _1104 = fma(_1058, _944, _1096);
    float _1106 = fma(_1000, _944, _1098);
    float _1108 = fma(_1000, _912, _1082);
    float _1110 = fma(_1054, _912, _1084);
    float _1112 = fma(_1032, _912, _1086);
    float _1114 = fma(_1054, _944, _1100);
    float _1116 = fma(_1070, _980, _1076);
    float _1118 = fma(_1032, _944, _1102);
    float _1120 = fma(_1062, _980, _1090);
    float _1122 = fma(_1064, _980, _1092);
    float _1124 = fma(_1066, _980, _1094);
    float _1126 = _1116 + _988;
    int _1128 = _1078 + 32;
    float _1130 = fma(_1070, _1012, _1088);
    float _1132 = fma(_1064, _1012, _1108);
    float _1134 = fma(_1062, _1012, _1110);
    float _1136 = fma(_1066, _1012, _1112);
    float _1138 = _1130 + _1020;
    float _1140 = fma(_1070, _1044, _1104);
    float _1142 = fma(_1064, _1044, _1106);
    int _1144 = _1078 + 16;
    float _1146 = fma(_1062, _1044, _1114);
    float _1148 = fma(_1066, _1044, _1118);
    float _1150 = _1140 + _1052;
    int _1152 = _1078 + 48;
    uint _1154 = uint(int(uint(_1144) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1154)] = as_type<uint>(_1120);
    int _1156 = _1144 + 4;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1158)] = as_type<uint>(_1122);
    int _1160 = _1144 + 8;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1162)] = as_type<uint>(_1124);
    int _1164 = _1144 + 12;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1166)] = as_type<uint>(_1126);
    uint _1168 = uint(int(uint(_1128) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1168)] = as_type<uint>(_1134);
    int _1170 = _1128 + 4;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1172)] = as_type<uint>(_1132);
    int _1174 = _1128 + 8;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1176)] = as_type<uint>(_1136);
    int _1178 = _1128 + 12;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1180)] = as_type<uint>(_1138);
    uint _1182 = uint(int(uint(_1152) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1182)] = as_type<uint>(_1146);
    int _1184 = _1152 + 4;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1186)] = as_type<uint>(_1142);
    int _1188 = _1152 + 8;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1190)] = as_type<uint>(_1148);
    int _1192 = _1152 + 12;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1194)] = as_type<uint>(_1150);
}

