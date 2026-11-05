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
int _54(thread const int& _2954, thread const int& _2955, constant _10& support_buffer)
{
    int _2958 = 1 + _2955;
    float _2960 = support_buffer._m5[_2958].x;
    bool _2962 = _2960 == 1.0;
    if (_2962)
    {
        return _2954;
    }
    float _2964 = float(_2954);
    float _2966 = _2964 * _2960;
    int _2968 = int(_2966);
    return _2968;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _678 = false;
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
    int _81 = int(_73) + 1;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    int _85 = _81 & 3;
    float _87 = (*spvDescriptorSet0.cp_c5)._m0[int(_83)][_85];
    int _89 = _64;
    int _91 = 0;
    int _93 = _54(_89, _91, (*spvDescriptorSet0.support_buffer));
    int _95 = as_type<int>(_79);
    int _97 = 0;
    int _99 = _54(_95, _97, (*spvDescriptorSet0.support_buffer));
    int3 _1201 = int3(_93, _99, 1);
    float4 _102 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1201.xy), uint(_1201.z), 0).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    int _112 = _64;
    int _114 = 0;
    int _116 = _54(_112, _114, (*spvDescriptorSet0.support_buffer));
    int _118 = as_type<int>(_87);
    int _120 = 0;
    int _122 = _54(_118, _120, (*spvDescriptorSet0.support_buffer));
    int3 _1221 = int3(_116, _122, 1);
    float4 _124 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1221.xy), uint(_1221.z), 0).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    int _134 = _64;
    int _136 = 0;
    int _138 = _54(_134, _136, (*spvDescriptorSet0.support_buffer));
    int _140 = as_type<int>(_79);
    int _142 = 0;
    int _144 = _54(_140, _142, (*spvDescriptorSet0.support_buffer));
    int3 _1241 = int3(_138, _144, 0);
    float3 _148 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1241.xy), uint(_1241.z), 0).xyz;
    float _150 = _148.x;
    float _152 = _148.y;
    float _154 = _148.z;
    int _156 = _64;
    int _158 = 0;
    int _160 = _54(_156, _158, (*spvDescriptorSet0.support_buffer));
    int _162 = as_type<int>(_87);
    int _164 = 0;
    int _166 = _54(_162, _164, (*spvDescriptorSet0.support_buffer));
    int3 _1259 = int3(_160, _166, 0);
    float3 _168 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1259.xy), uint(_1259.z), 0).xyz;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = _168.z;
    int _176 = _64;
    int _178 = 0;
    int _180 = _54(_176, _178, (*spvDescriptorSet0.support_buffer));
    int _182 = as_type<int>(_79);
    int _184 = 0;
    int _186 = _54(_182, _184, (*spvDescriptorSet0.support_buffer));
    int3 _1277 = int3(_180, _186, 2);
    float3 _188 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1277.xy), uint(_1277.z), 0).xyz;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    int _196 = _64;
    int _198 = 0;
    int _200 = _54(_196, _198, (*spvDescriptorSet0.support_buffer));
    int _202 = as_type<int>(_87);
    int _204 = 0;
    int _206 = _54(_202, _204, (*spvDescriptorSet0.support_buffer));
    int3 _1295 = int3(_200, _206, 2);
    float3 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1295.xy), uint(_1295.z), 0).xyz;
    float _210 = _208.x;
    float _212 = _208.y;
    float _214 = _208.z;
    int _216 = _70 + 16;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    uint _220 = uint(int(uint(int(_218)) >> uint(2)));
    int _222 = int(_218) & 3;
    float _224 = (*spvDescriptorSet0.cp_c5)._m0[int(_220)][_222];
    bool _226 = _64 != 0;
    float _228 = -_110;
    float _230 = _228 + _132;
    float _232 = -_104;
    float _234 = _232 + _126;
    float _236 = -_106;
    float _238 = _236 + _128;
    float _240 = -_108;
    float _242 = _240 + _130;
    float _244 = fma(_230, _224, _110);
    float _246 = fma(_234, _224, _104);
    float _248 = fma(_238, _224, _106);
    float _250 = fma(_242, _224, _108);
    float _252 = _244 * 2.0;
    float _254 = _246 * 2.0;
    float _256 = _248 * 2.0;
    float _258 = _246 * _252;
    float _260 = _250 * _252;
    float _262 = _248 * _252;
    float _264 = _246 * _246;
    float _266 = -_258;
    float _268 = fma(_250, _256, _266);
    float _270 = fma(_250, _256, _258);
    float _272 = -_260;
    float _274 = fma(_248, _254, _272);
    float _276 = fma(_248, _254, _260);
    float _278 = _248 * _248;
    float _280 = fma(_250, _254, _262);
    float _282 = -_262;
    float _284 = fma(_250, _254, _282);
    float _286 = -_150;
    float _288 = _286 + _170;
    float _290 = fma(_264, -2.0, 1.0);
    float _292 = _250 * _250;
    float _294 = fma(_278, -2.0, 1.0);
    float _296 = -_152;
    float _298 = _296 + _172;
    float _300 = fma(_288, _224, _150);
    float _302 = fma(_292, -2.0, _290);
    float _304 = fma(_292, -2.0, _294);
    float _306 = fma(_298, _224, _152);
    float _308 = -_154;
    float _310 = _308 + _174;
    float _312 = fma(_278, -2.0, _290);
    float _314 = _300 * _276;
    float _316 = _300 * _304;
    float _318 = _300 * _284;
    float _320 = _306 * _274;
    float _322 = fma(_310, _224, _154);
    float _324 = -_190;
    float _326 = _324 + _210;
    float _328 = -_192;
    float _330 = _328 + _212;
    float _332 = -_194;
    float _334 = _332 + _214;
    float _336 = _306 * _302;
    float _338 = _306 * _270;
    float _340 = _322 * _280;
    float _342 = _322 * _268;
    float _344 = _322 * _312;
    float _346 = fma(_326, _224, _190);
    int _348 = _64 * 48;
    float _350 = fma(_330, _224, _192);
    float _352 = fma(_334, _224, _194);
    int _354 = _64 * 112;
    float _356 = _172;
    float _358 = _154;
    float _360 = _330;
    float _362 = _194;
    float _364 = _192;
    float _366 = _190;
    float _368 = _170;
    float _370 = _322;
    float _372 = _338;
    float _374 = _318;
    float _376 = _342;
    float _378 = _344;
    if (!_226)
    {
        _356 = _346;
    }
    float _380 = _356;
    uint _382 = uint(int(uint(_348) >> uint(2)));
    _37[int(_382)] = as_type<uint>(_316);
    int _384 = _348 + 4;
    uint _386 = uint(int(uint(_384) >> uint(2)));
    _37[int(_386)] = as_type<uint>(_320);
    int _388 = _348 + 8;
    uint _390 = uint(int(uint(_388) >> uint(2)));
    _37[int(_390)] = as_type<uint>(_340);
    int _392 = _348 + 12;
    uint _394 = uint(int(uint(_392) >> uint(2)));
    _37[int(_394)] = as_type<uint>(_346);
    float _396 = _380;
    if (!_226)
    {
        _358 = _350;
    }
    float _398 = _358;
    float _400 = _398;
    if (!_226)
    {
        _360 = _352;
    }
    float _402 = _360;
    int _404 = _348 + 16;
    uint _406 = uint(int(uint(_404) >> uint(2)));
    _37[int(_406)] = as_type<uint>(_314);
    int _408 = _348 + 20;
    uint _410 = uint(int(uint(_408) >> uint(2)));
    _37[int(_410)] = as_type<uint>(_336);
    int _412 = _348 + 24;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    _37[int(_414)] = as_type<uint>(_342);
    int _416 = _348 + 28;
    uint _418 = uint(int(uint(_416) >> uint(2)));
    _37[int(_418)] = as_type<uint>(_350);
    float _420 = _402;
    if (!_226)
    {
        _362 = _316;
    }
    float _422 = _362;
    float _424 = _422;
    if (!_226)
    {
        _364 = _320;
    }
    float _426 = _364;
    int _428 = _348 + 32;
    uint _430 = uint(int(uint(_428) >> uint(2)));
    _37[int(_430)] = as_type<uint>(_318);
    int _432 = _348 + 36;
    uint _434 = uint(int(uint(_432) >> uint(2)));
    _37[int(_434)] = as_type<uint>(_338);
    int _436 = _348 + 40;
    uint _438 = uint(int(uint(_436) >> uint(2)));
    _37[int(_438)] = as_type<uint>(_344);
    int _440 = _348 + 44;
    uint _442 = uint(int(uint(_440) >> uint(2)));
    _37[int(_442)] = as_type<uint>(_352);
    float _444 = _426;
    if (!_226)
    {
        _366 = _340;
    }
    float _446 = _366;
    float _448 = _446;
    if (!_226)
    {
        _368 = _314;
    }
    float _450 = _368;
    float _452 = _450;
    if (!_226)
    {
        _370 = _336;
    }
    float _454 = _370;
    bool _456 = !_226;
    float _458 = _454;
    if (!_456)
    {
        bool _460 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _462 = !_460;
        if (!_462)
        {
            uint _464 = uint(int(uint(_354) >> uint(2)));
            uint _466 = uint(int(uint(int(_464)) >> uint(2)));
            int _468 = int(_464) & 3;
            float _470 = (*spvDescriptorSet0.cp_c6)._m0[int(_466)][_468];
            int _472 = as_type<int>(_470) * 48;
            int _474 = 0;
            bool _476;
            float _572;
            float _574;
            float _576;
            float _580;
            float _598;
            float _600;
            float _602;
            float _614;
            float _624;
            float _626;
            float _628;
            float _630;
            do
            {
                int _478 = _474;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _480 = uint(int(uint(_472) >> uint(2)));
                float _482 = as_type<float>(_37[int(_480)]);
                int _484 = _472 + 4;
                uint _486 = uint(int(uint(_484) >> uint(2)));
                float _488 = as_type<float>(_37[int(_486)]);
                int _490 = _472 + 8;
                uint _492 = uint(int(uint(_490) >> uint(2)));
                float _494 = as_type<float>(_37[int(_492)]);
                int _496 = _472 + 12;
                uint _498 = uint(int(uint(_496) >> uint(2)));
                float _500 = as_type<float>(_37[int(_498)]);
                int _502 = _478 + 1;
                int _504 = _472 + 16;
                uint _506 = uint(int(uint(_504) >> uint(2)));
                float _508 = as_type<float>(_37[int(_506)]);
                int _510 = _472 + 20;
                uint _512 = uint(int(uint(_510) >> uint(2)));
                float _514 = as_type<float>(_37[int(_512)]);
                int _516 = _472 + 24;
                uint _518 = uint(int(uint(_516) >> uint(2)));
                float _520 = as_type<float>(_37[int(_518)]);
                int _522 = _472 + 28;
                uint _524 = uint(int(uint(_522) >> uint(2)));
                float _526 = as_type<float>(_37[int(_524)]);
                bool _528 = uint(_502) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _530 = _472 + 32;
                uint _532 = uint(int(uint(_530) >> uint(2)));
                float _534 = as_type<float>(_37[int(_532)]);
                int _536 = _472 + 36;
                uint _538 = uint(int(uint(_536) >> uint(2)));
                float _540 = as_type<float>(_37[int(_538)]);
                int _542 = _472 + 40;
                uint _544 = uint(int(uint(_542) >> uint(2)));
                float _546 = as_type<float>(_37[int(_544)]);
                int _548 = _472 + 44;
                uint _550 = uint(int(uint(_548) >> uint(2)));
                float _552 = as_type<float>(_37[int(_550)]);
                float _554 = _350 * _488;
                float _556 = _314 * _488;
                float _558 = _336 * _488;
                float _560 = _342 * _488;
                float _562 = fma(_346, _482, _554);
                float _564 = fma(_316, _482, _556);
                float _566 = fma(_320, _482, _558);
                float _568 = fma(_340, _482, _560);
                float _570 = fma(_352, _494, _562);
                _572 = fma(_318, _494, _564);
                _574 = fma(_338, _494, _566);
                _576 = fma(_344, _494, _568);
                float _578 = _350 * _514;
                _580 = _500 + _570;
                float _582 = _314 * _514;
                float _584 = _336 * _514;
                float _586 = fma(_346, _508, _578);
                float _588 = _342 * _514;
                float _590 = fma(_316, _508, _582);
                float _592 = fma(_320, _508, _584);
                float _594 = fma(_352, _520, _586);
                float _596 = fma(_340, _508, _588);
                _598 = fma(_318, _520, _590);
                _600 = fma(_338, _520, _592);
                _602 = _526 + _594;
                float _604 = _350 * _540;
                float _606 = _314 * _540;
                float _608 = _336 * _540;
                float _610 = _342 * _540;
                float _612 = fma(_346, _534, _604);
                _614 = fma(_344, _520, _596);
                float _616 = fma(_316, _534, _606);
                float _618 = fma(_320, _534, _608);
                float _620 = fma(_340, _534, _610);
                float _622 = fma(_352, _546, _612);
                _624 = fma(_318, _546, _616);
                _626 = fma(_338, _546, _618);
                _628 = fma(_344, _546, _620);
                _630 = _552 + _622;
                uint _632 = uint(int(uint(_348) >> uint(2)));
                _37[int(_632)] = as_type<uint>(_572);
                int _634 = _348 + 4;
                uint _636 = uint(int(uint(_634) >> uint(2)));
                _37[int(_636)] = as_type<uint>(_574);
                int _638 = _348 + 8;
                uint _640 = uint(int(uint(_638) >> uint(2)));
                _37[int(_640)] = as_type<uint>(_576);
                int _642 = _348 + 12;
                uint _644 = uint(int(uint(_642) >> uint(2)));
                _37[int(_644)] = as_type<uint>(_580);
                int _646 = _348 + 16;
                uint _648 = uint(int(uint(_646) >> uint(2)));
                _37[int(_648)] = as_type<uint>(_598);
                int _650 = _348 + 20;
                uint _652 = uint(int(uint(_650) >> uint(2)));
                _37[int(_652)] = as_type<uint>(_600);
                int _654 = _348 + 24;
                uint _656 = uint(int(uint(_654) >> uint(2)));
                _37[int(_656)] = as_type<uint>(_614);
                int _658 = _348 + 28;
                uint _660 = uint(int(uint(_658) >> uint(2)));
                _37[int(_660)] = as_type<uint>(_602);
                int _662 = _348 + 32;
                uint _664 = uint(int(uint(_662) >> uint(2)));
                _37[int(_664)] = as_type<uint>(_624);
                int _666 = _348 + 36;
                uint _668 = uint(int(uint(_666) >> uint(2)));
                _37[int(_668)] = as_type<uint>(_626);
                int _670 = _348 + 40;
                uint _672 = uint(int(uint(_670) >> uint(2)));
                _37[int(_672)] = as_type<uint>(_628);
                int _674 = _348 + 44;
                uint _676 = uint(int(uint(_674) >> uint(2)));
                _37[int(_676)] = as_type<uint>(_630);
                _476 = !_528;
                _474 = _502;
            } while (_476);
            _458 = _600;
            _372 = _626;
            _444 = _574;
            _452 = _598;
            _374 = _624;
            _424 = _572;
            _376 = _614;
            _448 = _576;
            _378 = _628;
            _400 = _602;
            _396 = _580;
            _420 = _630;
            _678 = true;
        }
        else
        {
            _458 = 0.0;
            _372 = 0.0;
            _444 = 0.0;
            _452 = 0.0;
            _374 = 0.0;
            _424 = 0.0;
            _376 = 0.0;
            _448 = 0.0;
            _378 = 0.0;
            _400 = 0.0;
            _396 = 0.0;
            _420 = 0.0;
        }
    }
    _678 = false;
    float _680 = _458;
    float _682 = _372;
    float _684 = _444;
    float _686 = _452;
    float _688 = _374;
    float _690 = _424;
    float _692 = _376;
    float _694 = _448;
    float _696 = _378;
    float _698 = _400;
    float _700 = _396;
    float _702 = _420;
    int _704 = _354 + 80;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    uint _708 = uint(int(uint(int(_706)) >> uint(2)));
    int _710 = int(_706) & 3;
    float _712 = (*spvDescriptorSet0.cp_c6)._m0[int(_708)][_710];
    int _714 = int(_706) + 1;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    int _718 = _714 & 3;
    float _720 = (*spvDescriptorSet0.cp_c6)._m0[int(_716)][_718];
    int _722 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _724 = _722 + _64;
    int _726 = _354 + 64;
    uint _728 = uint(int(uint(_726) >> uint(2)));
    uint _730 = uint(int(uint(int(_728)) >> uint(2)));
    int _732 = int(_728) & 3;
    float _734 = (*spvDescriptorSet0.cp_c6)._m0[int(_730)][_732];
    int _736 = int(_728) + 1;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    int _740 = _736 & 3;
    float _742 = (*spvDescriptorSet0.cp_c6)._m0[int(_738)][_740];
    int _744 = _724 * 48;
    int _746 = _354 + 88;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    uint _750 = uint(int(uint(int(_748)) >> uint(2)));
    int _752 = int(_748) & 3;
    float _754 = (*spvDescriptorSet0.cp_c6)._m0[int(_750)][_752];
    int _756 = int(_748) + 1;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    int _760 = _756 & 3;
    float _762 = (*spvDescriptorSet0.cp_c6)._m0[int(_758)][_760];
    int _764 = _354 + 72;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.cp_c6)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.cp_c6)._m0[int(_776)][_778];
    int _782 = _354 + 104;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    uint _786 = uint(int(uint(int(_784)) >> uint(2)));
    int _788 = int(_784) & 3;
    float _790 = (*spvDescriptorSet0.cp_c6)._m0[int(_786)][_788];
    int _792 = int(_784) + 1;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    int _796 = _792 & 3;
    float _798 = (*spvDescriptorSet0.cp_c6)._m0[int(_794)][_796];
    int _800 = _354 + 96;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    uint _804 = uint(int(uint(int(_802)) >> uint(2)));
    int _806 = int(_802) & 3;
    float _808 = (*spvDescriptorSet0.cp_c6)._m0[int(_804)][_806];
    int _810 = int(_802) + 1;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    int _814 = _810 & 3;
    float _816 = (*spvDescriptorSet0.cp_c6)._m0[int(_812)][_814];
    float _818 = _680 * _712;
    float _820 = _682 * _712;
    float _822 = _682 * _720;
    int _824 = _354 + 16;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    uint _828 = uint(int(uint(int(_826)) >> uint(2)));
    int _830 = int(_826) & 3;
    float _832 = (*spvDescriptorSet0.cp_c6)._m0[int(_828)][_830];
    int _834 = int(_826) + 1;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    int _838 = _834 & 3;
    float _840 = (*spvDescriptorSet0.cp_c6)._m0[int(_836)][_838];
    float _842 = _684 * _712;
    float _844 = fma(_686, _734, _818);
    float _846 = _684 * _720;
    float _848 = fma(_688, _734, _820);
    int _850 = _354 + 32;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    uint _854 = uint(int(uint(int(_852)) >> uint(2)));
    int _856 = int(_852) & 3;
    float _858 = (*spvDescriptorSet0.cp_c6)._m0[int(_854)][_856];
    int _860 = int(_852) + 1;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    int _864 = _860 & 3;
    float _866 = (*spvDescriptorSet0.cp_c6)._m0[int(_862)][_864];
    float _868 = _680 * _720;
    float _870 = fma(_690, _742, _846);
    float _872 = fma(_688, _742, _822);
    float _874 = fma(_690, _734, _842);
    float _876 = _684 * _754;
    float _878 = _684 * _762;
    float _880 = _680 * _754;
    int _882 = _354 + 48;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    uint _886 = uint(int(uint(int(_884)) >> uint(2)));
    int _888 = int(_884) & 3;
    float _890 = (*spvDescriptorSet0.cp_c6)._m0[int(_886)][_888];
    int _892 = int(_884) + 1;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    int _896 = _892 & 3;
    float _898 = (*spvDescriptorSet0.cp_c6)._m0[int(_894)][_896];
    float _900 = _682 * _754;
    float _902 = _680 * _762;
    float _904 = _682 * _762;
    float _906 = fma(_686, _742, _868);
    float _908 = fma(_690, _772, _876);
    float _910 = fma(_690, _780, _878);
    float _912 = fma(_686, _772, _880);
    int _914 = _354 + 24;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.cp_c6)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.cp_c6)._m0[int(_926)][_928];
    float _932 = fma(_686, _780, _902);
    float _934 = fma(_688, _772, _900);
    float _936 = fma(_688, _780, _904);
    float _938 = fma(_692, _798, _932);
    float _940 = fma(_694, _798, _910);
    float _942 = fma(_696, _798, _936);
    int _944 = _354 + 40;
    uint _946 = uint(int(uint(_944) >> uint(2)));
    uint _948 = uint(int(uint(int(_946)) >> uint(2)));
    int _950 = int(_946) & 3;
    float _952 = (*spvDescriptorSet0.cp_c6)._m0[int(_948)][_950];
    int _954 = int(_946) + 1;
    uint _956 = uint(int(uint(_954) >> uint(2)));
    int _958 = _954 & 3;
    float _960 = (*spvDescriptorSet0.cp_c6)._m0[int(_956)][_958];
    float _962 = _938 + _698;
    float _964 = fma(_692, _790, _912);
    float _966 = fma(_694, _790, _908);
    float _968 = _940 + _700;
    float _970 = fma(_694, _816, _870);
    float _972 = fma(_692, _808, _844);
    float _974 = fma(_692, _816, _906);
    int _976 = _354 + 56;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    uint _980 = uint(int(uint(int(_978)) >> uint(2)));
    int _982 = int(_978) & 3;
    float _984 = (*spvDescriptorSet0.cp_c6)._m0[int(_980)][_982];
    int _986 = int(_978) + 1;
    uint _988 = uint(int(uint(_986) >> uint(2)));
    int _990 = _986 & 3;
    float _992 = (*spvDescriptorSet0.cp_c6)._m0[int(_988)][_990];
    float _994 = fma(_694, _808, _874);
    float _996 = _942 + _702;
    float _998 = fma(_696, _816, _872);
    float _1000 = fma(_696, _808, _848);
    float _1002 = fma(_696, _790, _934);
    float _1004 = _972 * _840;
    float _1006 = _974 * _840;
    float _1008 = _962 * _840;
    float _1010 = _964 * _840;
    float _1012 = fma(_994, _832, _1004);
    float _1014 = fma(_970, _832, _1006);
    float _1016 = fma(_968, _832, _1008);
    float _1018 = fma(_966, _832, _1010);
    float _1020 = _972 * _866;
    float _1022 = _974 * _866;
    float _1024 = _962 * _866;
    float _1026 = _964 * _866;
    float _1028 = fma(_994, _858, _1020);
    float _1030 = fma(_970, _858, _1022);
    float _1032 = fma(_968, _858, _1024);
    float _1034 = fma(_966, _858, _1026);
    float _1036 = _972 * _898;
    float _1038 = _974 * _898;
    float _1040 = _964 * _898;
    float _1042 = _962 * _898;
    float _1044 = fma(_994, _890, _1036);
    float _1046 = fma(_970, _890, _1038);
    float _1048 = fma(_966, _890, _1040);
    float _1050 = fma(_968, _890, _1042);
    float _1052 = fma(_996, _922, _1016);
    float _1054 = fma(_1000, _922, _1012);
    float _1056 = fma(_998, _922, _1014);
    float _1058 = fma(_1002, _922, _1018);
    float _1060 = _1052 + _930;
    float _1062 = fma(_996, _952, _1032);
    float _1064 = fma(_1000, _952, _1028);
    float _1066 = fma(_998, _952, _1030);
    float _1068 = fma(_1002, _952, _1034);
    float _1070 = _1062 + _960;
    float _1072 = fma(_996, _984, _1050);
    float _1074 = fma(_998, _984, _1046);
    int _1076 = _744 + 16;
    float _1078 = fma(_1000, _984, _1044);
    int _1080 = _744 + 32;
    float _1082 = fma(_1002, _984, _1048);
    float _1084 = _1072 + _992;
    int _1086 = _744 + 48;
    uint _1088 = uint(int(uint(_1076) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1088)] = as_type<uint>(_1054);
    int _1090 = _1076 + 4;
    uint _1092 = uint(int(uint(_1090) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1092)] = as_type<uint>(_1056);
    int _1094 = _1076 + 8;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1096)] = as_type<uint>(_1058);
    int _1098 = _1076 + 12;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1100)] = as_type<uint>(_1060);
    uint _1102 = uint(int(uint(_1080) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1102)] = as_type<uint>(_1064);
    int _1104 = _1080 + 4;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1106)] = as_type<uint>(_1066);
    int _1108 = _1080 + 8;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1110)] = as_type<uint>(_1068);
    int _1112 = _1080 + 12;
    uint _1114 = uint(int(uint(_1112) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1114)] = as_type<uint>(_1070);
    uint _1116 = uint(int(uint(_1086) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1116)] = as_type<uint>(_1078);
    int _1118 = _1086 + 4;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1120)] = as_type<uint>(_1074);
    int _1122 = _1086 + 8;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1124)] = as_type<uint>(_1082);
    int _1126 = _1086 + 12;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1128)] = as_type<uint>(_1084);
}

