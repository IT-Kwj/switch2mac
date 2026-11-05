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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3121, thread const int& _3122, constant _10& support_buffer)
{
    int _3125 = 1 + _3122;
    float _3127 = support_buffer._m5[_3125].x;
    bool _3129 = _3127 == 1.0;
    if (_3129)
    {
        return _3121;
    }
    float _3131 = float(_3121);
    float _3133 = _3131 * _3127;
    int _3135 = int(_3133);
    return _3135;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _680 = false;
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
    int _115 = 0;
    float _117 = _109;
    float _119 = as_type<float>(_99);
    if (_113)
    {
        uint _121 = uint(int(uint(_99) >> uint(2)));
        uint _123 = uint(int(uint(int(_121)) >> uint(2)));
        int _125 = int(_121) & 3;
        float _127 = (*spvDescriptorSet0.cp_c5)._m0[int(_123)][_125];
        _115 = as_type<int>(_127);
    }
    int _129 = _115;
    float _131 = 0.0;
    float _133 = 0.0;
    if (!_113)
    {
        _131 = 0.0;
        _133 = 0.0;
    }
    float _135 = _131;
    float _137 = _133;
    float _139 = 0.0;
    if (!_113)
    {
        _139 = 0.0;
    }
    float _141 = _139;
    float _143 = 0.0;
    if (!_113)
    {
        _143 = 0.0;
        _117 = 0.0;
    }
    float _145 = _143;
    float _147 = _117;
    float _149 = 0.0;
    if (_113)
    {
        _149 = 1.4012984643248170709237295832899e-45;
    }
    float _151 = _149;
    float _153 = 0.0;
    float _155 = 0.0;
    if (!_113)
    {
        _153 = 0.0;
        _155 = 0.0;
    }
    float _157 = _153;
    float _159 = _155;
    int _161 = 0;
    int _163 = 0;
    if (!_113)
    {
        _161 = 0;
        _163 = 0;
    }
    int _165 = _161;
    int _167 = _163;
    float _169 = 0.0;
    if (_113)
    {
        _169 = 2.8025969286496341418474591665798e-45;
    }
    float _171 = _169;
    float _173 = _135;
    float _175 = _137;
    float _177 = _141;
    float _179 = 0.0;
    if (_113)
    {
        int _181 = _66;
        int _183 = 0;
        int _185 = _56(_181, _183, (*spvDescriptorSet0.support_buffer));
        int _187 = _129;
        int _189 = 0;
        int _191 = _56(_187, _189, (*spvDescriptorSet0.support_buffer));
        int3 _1350 = int3(_185, _191, as_type<int>(_151));
        float4 _194 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1350.xy), uint(_1350.z), 0).xyzw;
        float _196 = _194.x;
        float _198 = _194.y;
        float _200 = _194.z;
        float _202 = _194.w;
        _173 = _196;
        _175 = _198;
        _177 = _200;
        _179 = _202;
    }
    float _204 = _173;
    float _206 = _175;
    float _208 = _177;
    float _210 = _179;
    float _212 = _157;
    float _214 = _159;
    float _216 = _145;
    if (_113)
    {
        int _218 = _66;
        int _220 = 0;
        int _222 = _56(_218, _220, (*spvDescriptorSet0.support_buffer));
        int _224 = _129;
        int _226 = 0;
        int _228 = _56(_224, _226, (*spvDescriptorSet0.support_buffer));
        int3 _1383 = int3(_222, _228, 0);
        float3 _232 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1383.xy), uint(_1383.z), 0).xyz;
        float _234 = _232.x;
        float _236 = _232.y;
        float _238 = _232.z;
        _212 = _234;
        _214 = _236;
        _216 = _238;
    }
    float _240 = _212;
    float _242 = _214;
    float _244 = _216;
    int _246 = _165;
    int _248 = _167;
    float _250 = _147;
    if (_113)
    {
        int _252 = _66;
        int _254 = 0;
        int _256 = _56(_252, _254, (*spvDescriptorSet0.support_buffer));
        int _258 = _129;
        int _260 = 0;
        int _262 = _56(_258, _260, (*spvDescriptorSet0.support_buffer));
        int3 _1414 = int3(_256, _262, as_type<int>(_171));
        float3 _264 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1414.xy), uint(_1414.z), 0).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        _246 = as_type<int>(_266);
        _248 = as_type<int>(_268);
        _250 = _270;
    }
    int _272 = _246;
    int _274 = _248;
    float _276 = _250;
    if (!_113)
    {
        _119 = 0.0;
    }
    float _278 = _119;
    float _280 = _204 * _204;
    float _282 = _278;
    float _284 = _240;
    float _286 = _242;
    float _288 = _276;
    if (_113)
    {
        float _290 = _210 * 2.0;
        _282 = _290;
    }
    float _292 = _282;
    float _294 = _204 * 2.0;
    float _296 = _206 * _206;
    float _298 = fma(_280, -2.0, 1.0);
    float _300 = _208 * _292;
    float _302 = _204 * _292;
    float _304 = _206 * _292;
    float _306 = _208 * _208;
    float _308 = -_300;
    float _310 = fma(_294, _206, _308);
    float _312 = fma(_294, _206, _300);
    float _314 = _206 * 2.0;
    float _316 = fma(_296, -2.0, 1.0);
    float _318 = fma(_294, _208, _304);
    float _320 = -_304;
    float _322 = fma(_294, _208, _320);
    float _324 = -_302;
    float _326 = fma(_314, _208, _324);
    float _328 = fma(_314, _208, _302);
    float _330 = fma(_306, -2.0, _316);
    float _332 = fma(_306, -2.0, _298);
    float _334 = fma(_296, -2.0, _298);
    float _336 = _310 * _242;
    float _338 = _330 * _240;
    float _340 = _318 * _244;
    float _342 = _326 * _244;
    float _344 = _312 * _240;
    float _346 = _322 * _240;
    float _348 = _332 * _242;
    float _350 = _328 * _242;
    int _352 = _66 * 48;
    float _354 = _334 * _244;
    int _356 = _66 * 112;
    bool _358 = _66 != 0;
    uint _360 = uint(int(uint(_352) >> uint(2)));
    _39[int(_360)] = as_type<uint>(_338);
    int _362 = _352 + 4;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    _39[int(_364)] = as_type<uint>(_336);
    int _366 = _352 + 8;
    uint _368 = uint(int(uint(_366) >> uint(2)));
    _39[int(_368)] = as_type<uint>(_340);
    int _370 = _352 + 12;
    uint _372 = uint(int(uint(_370) >> uint(2)));
    _39[int(_372)] = uint(_272);
    int _374 = _352 + 16;
    int _376 = _352 + 32;
    int _378 = _352 + 16;
    uint _380 = uint(int(uint(_378) >> uint(2)));
    _39[int(_380)] = as_type<uint>(_344);
    int _382 = _352 + 20;
    uint _384 = uint(int(uint(_382) >> uint(2)));
    _39[int(_384)] = as_type<uint>(_348);
    int _386 = _352 + 24;
    uint _388 = uint(int(uint(_386) >> uint(2)));
    _39[int(_388)] = as_type<uint>(_342);
    int _390 = _352 + 28;
    uint _392 = uint(int(uint(_390) >> uint(2)));
    _39[int(_392)] = uint(_274);
    int _394 = _352 + 32;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    _39[int(_396)] = as_type<uint>(_346);
    int _398 = _352 + 36;
    uint _400 = uint(int(uint(_398) >> uint(2)));
    _39[int(_400)] = as_type<uint>(_350);
    int _402 = _352 + 40;
    uint _404 = uint(int(uint(_402) >> uint(2)));
    _39[int(_404)] = as_type<uint>(_354);
    int _406 = _352 + 44;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    _39[int(_408)] = as_type<uint>(_276);
    float _410 = _314;
    float _412 = _326;
    float _414 = _332;
    float _416 = _306;
    float _418 = _328;
    float _420 = _300;
    float _422 = _346;
    float _424 = _350;
    float _426 = _354;
    if (!_358)
    {
        _410 = as_type<float>(_272);
    }
    float _428 = _410;
    float _430 = _428;
    if (!_358)
    {
        _412 = as_type<float>(_274);
    }
    float _432 = _412;
    float _434 = _432;
    if (!_358)
    {
        _414 = _338;
    }
    float _436 = _414;
    float _438 = _436;
    if (!_358)
    {
        _416 = _336;
    }
    float _440 = _416;
    float _442 = _440;
    if (!_358)
    {
        _418 = _340;
    }
    float _444 = _418;
    float _446 = _444;
    if (!_358)
    {
        _284 = _344;
    }
    float _448 = _284;
    float _450 = _448;
    if (!_358)
    {
        _286 = _348;
    }
    float _452 = _286;
    float _454 = _452;
    if (!_358)
    {
        _420 = _342;
    }
    float _456 = _420;
    bool _458 = !_358;
    float _460 = _456;
    if (!_458)
    {
        bool _462 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _464 = !_462;
        if (!_464)
        {
            uint _466 = uint(int(uint(_356) >> uint(2)));
            uint _468 = uint(int(uint(int(_466)) >> uint(2)));
            int _470 = int(_466) & 3;
            float _472 = (*spvDescriptorSet0.cp_c6)._m0[int(_468)][_470];
            int _474 = as_type<int>(_472) * 48;
            int _476 = 0;
            bool _478;
            float _574;
            float _576;
            float _578;
            float _586;
            float _600;
            float _602;
            float _614;
            float _624;
            float _626;
            float _628;
            float _630;
            float _632;
            do
            {
                int _480 = _476;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _482 = uint(int(uint(_474) >> uint(2)));
                float _484 = as_type<float>(_39[int(_482)]);
                int _486 = _474 + 4;
                uint _488 = uint(int(uint(_486) >> uint(2)));
                float _490 = as_type<float>(_39[int(_488)]);
                int _492 = _474 + 8;
                uint _494 = uint(int(uint(_492) >> uint(2)));
                float _496 = as_type<float>(_39[int(_494)]);
                int _498 = _474 + 12;
                uint _500 = uint(int(uint(_498) >> uint(2)));
                float _502 = as_type<float>(_39[int(_500)]);
                int _504 = _480 + 1;
                int _506 = _474 + 16;
                uint _508 = uint(int(uint(_506) >> uint(2)));
                float _510 = as_type<float>(_39[int(_508)]);
                int _512 = _474 + 20;
                uint _514 = uint(int(uint(_512) >> uint(2)));
                float _516 = as_type<float>(_39[int(_514)]);
                int _518 = _474 + 24;
                uint _520 = uint(int(uint(_518) >> uint(2)));
                float _522 = as_type<float>(_39[int(_520)]);
                int _524 = _474 + 28;
                uint _526 = uint(int(uint(_524) >> uint(2)));
                float _528 = as_type<float>(_39[int(_526)]);
                bool _530 = uint(_504) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _532 = _474 + 32;
                uint _534 = uint(int(uint(_532) >> uint(2)));
                float _536 = as_type<float>(_39[int(_534)]);
                int _538 = _474 + 36;
                uint _540 = uint(int(uint(_538) >> uint(2)));
                float _542 = as_type<float>(_39[int(_540)]);
                int _544 = _474 + 40;
                uint _546 = uint(int(uint(_544) >> uint(2)));
                float _548 = as_type<float>(_39[int(_546)]);
                int _550 = _474 + 44;
                uint _552 = uint(int(uint(_550) >> uint(2)));
                float _554 = as_type<float>(_39[int(_552)]);
                float _556 = _490 * as_type<float>(_274);
                float _558 = _344 * _490;
                float _560 = _348 * _490;
                float _562 = _342 * _490;
                float _564 = fma(_484, as_type<float>(_272), _556);
                float _566 = fma(_338, _484, _558);
                float _568 = fma(_336, _484, _560);
                float _570 = fma(_340, _484, _562);
                float _572 = fma(_496, _276, _564);
                _574 = fma(_346, _496, _566);
                _576 = fma(_350, _496, _568);
                _578 = fma(_354, _496, _570);
                float _580 = _516 * as_type<float>(_274);
                float _582 = _344 * _516;
                float _584 = _348 * _516;
                _586 = _502 + _572;
                float _588 = fma(_510, as_type<float>(_272), _580);
                float _590 = fma(_338, _510, _582);
                float _592 = fma(_336, _510, _584);
                float _594 = _342 * _516;
                float _596 = fma(_522, _276, _588);
                float _598 = _542 * as_type<float>(_274);
                _600 = fma(_346, _522, _590);
                _602 = fma(_350, _522, _592);
                float _604 = _344 * _542;
                float _606 = _348 * _542;
                float _608 = _342 * _542;
                float _610 = fma(_536, as_type<float>(_272), _598);
                float _612 = fma(_340, _510, _594);
                _614 = _528 + _596;
                float _616 = fma(_338, _536, _604);
                float _618 = fma(_336, _536, _606);
                float _620 = fma(_340, _536, _608);
                float _622 = fma(_548, _276, _610);
                _624 = fma(_354, _522, _612);
                _626 = fma(_346, _548, _616);
                _628 = fma(_350, _548, _618);
                _630 = fma(_354, _548, _620);
                _632 = _554 + _622;
                uint _634 = uint(int(uint(_352) >> uint(2)));
                _39[int(_634)] = as_type<uint>(_574);
                int _636 = _352 + 4;
                uint _638 = uint(int(uint(_636) >> uint(2)));
                _39[int(_638)] = as_type<uint>(_576);
                int _640 = _352 + 8;
                uint _642 = uint(int(uint(_640) >> uint(2)));
                _39[int(_642)] = as_type<uint>(_578);
                int _644 = _352 + 12;
                uint _646 = uint(int(uint(_644) >> uint(2)));
                _39[int(_646)] = as_type<uint>(_586);
                int _648 = _352 + 16;
                uint _650 = uint(int(uint(_648) >> uint(2)));
                _39[int(_650)] = as_type<uint>(_600);
                int _652 = _352 + 20;
                uint _654 = uint(int(uint(_652) >> uint(2)));
                _39[int(_654)] = as_type<uint>(_602);
                int _656 = _352 + 24;
                uint _658 = uint(int(uint(_656) >> uint(2)));
                _39[int(_658)] = as_type<uint>(_624);
                int _660 = _352 + 28;
                uint _662 = uint(int(uint(_660) >> uint(2)));
                _39[int(_662)] = as_type<uint>(_614);
                int _664 = _352 + 32;
                uint _666 = uint(int(uint(_664) >> uint(2)));
                _39[int(_666)] = as_type<uint>(_626);
                int _668 = _352 + 36;
                uint _670 = uint(int(uint(_668) >> uint(2)));
                _39[int(_670)] = as_type<uint>(_628);
                int _672 = _352 + 40;
                uint _674 = uint(int(uint(_672) >> uint(2)));
                _39[int(_674)] = as_type<uint>(_630);
                int _676 = _352 + 44;
                uint _678 = uint(int(uint(_676) >> uint(2)));
                _39[int(_678)] = as_type<uint>(_632);
                _478 = !_530;
                _476 = _504;
            } while (_478);
            _438 = _574;
            _442 = _576;
            _446 = _578;
            _430 = _586;
            _450 = _600;
            _454 = _602;
            _460 = _624;
            _434 = _614;
            _422 = _626;
            _424 = _628;
            _426 = _630;
            _288 = _632;
            _680 = true;
        }
        else
        {
            _438 = 0.0;
            _442 = 0.0;
            _446 = 0.0;
            _430 = 0.0;
            _450 = 0.0;
            _454 = 0.0;
            _460 = 0.0;
            _434 = 0.0;
            _422 = 0.0;
            _424 = 0.0;
            _426 = 0.0;
            _288 = 0.0;
        }
    }
    _680 = false;
    float _682 = _438;
    float _684 = _442;
    float _686 = _446;
    float _688 = _430;
    float _690 = _450;
    float _692 = _454;
    float _694 = _460;
    float _696 = _434;
    float _698 = _422;
    float _700 = _424;
    float _702 = _426;
    float _704 = _288;
    int _706 = _356 + 80;
    uint _708 = uint(int(uint(_706) >> uint(2)));
    uint _710 = uint(int(uint(int(_708)) >> uint(2)));
    int _712 = int(_708) & 3;
    float _714 = (*spvDescriptorSet0.cp_c6)._m0[int(_710)][_712];
    int _716 = int(_708) + 1;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    int _720 = _716 & 3;
    float _722 = (*spvDescriptorSet0.cp_c6)._m0[int(_718)][_720];
    bool _724 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _726 = _356 + 64;
    uint _728 = uint(int(uint(_726) >> uint(2)));
    uint _730 = uint(int(uint(int(_728)) >> uint(2)));
    int _732 = int(_728) & 3;
    float _734 = (*spvDescriptorSet0.cp_c6)._m0[int(_730)][_732];
    int _736 = int(_728) + 1;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    int _740 = _736 & 3;
    float _742 = (*spvDescriptorSet0.cp_c6)._m0[int(_738)][_740];
    int _744 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _746 = _744 + _66;
    int _748 = _356 + 88;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.cp_c6)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.cp_c6)._m0[int(_760)][_762];
    int _766 = _356 + 72;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    uint _770 = uint(int(uint(int(_768)) >> uint(2)));
    int _772 = int(_768) & 3;
    float _774 = (*spvDescriptorSet0.cp_c6)._m0[int(_770)][_772];
    int _776 = int(_768) + 1;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    int _780 = _776 & 3;
    float _782 = (*spvDescriptorSet0.cp_c6)._m0[int(_778)][_780];
    int _784 = _356 + 96;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.cp_c6)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.cp_c6)._m0[int(_796)][_798];
    int _802 = _356 + 104;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    uint _806 = uint(int(uint(int(_804)) >> uint(2)));
    int _808 = int(_804) & 3;
    float _810 = (*spvDescriptorSet0.cp_c6)._m0[int(_806)][_808];
    int _812 = int(_804) + 1;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    int _816 = _812 & 3;
    float _818 = (*spvDescriptorSet0.cp_c6)._m0[int(_814)][_816];
    int _820 = _356 + 16;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.cp_c6)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.cp_c6)._m0[int(_832)][_834];
    if (!_724)
    {
        uint _838 = uint(int(uint(_352) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_838)] = as_type<uint>(_682);
        int _840 = _352 + 4;
        uint _842 = uint(int(uint(_840) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_842)] = as_type<uint>(_684);
        int _844 = _352 + 8;
        uint _846 = uint(int(uint(_844) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_846)] = as_type<uint>(_686);
        int _848 = _352 + 12;
        uint _850 = uint(int(uint(_848) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_850)] = as_type<uint>(_688);
        uint _852 = uint(int(uint(_374) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_852)] = as_type<uint>(_690);
        int _854 = _374 + 4;
        uint _856 = uint(int(uint(_854) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_856)] = as_type<uint>(_692);
        int _858 = _374 + 8;
        uint _860 = uint(int(uint(_858) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_860)] = as_type<uint>(_694);
        int _862 = _374 + 12;
        uint _864 = uint(int(uint(_862) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_864)] = as_type<uint>(_696);
        uint _866 = uint(int(uint(_376) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_866)] = as_type<uint>(_698);
        int _868 = _376 + 4;
        uint _870 = uint(int(uint(_868) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_870)] = as_type<uint>(_700);
        int _872 = _376 + 8;
        uint _874 = uint(int(uint(_872) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_874)] = as_type<uint>(_702);
        int _876 = _376 + 12;
        uint _878 = uint(int(uint(_876) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_878)] = as_type<uint>(_704);
    }
    float _880 = _692 * _714;
    float _882 = _700 * _714;
    int _884 = _356 + 32;
    uint _886 = uint(int(uint(_884) >> uint(2)));
    uint _888 = uint(int(uint(int(_886)) >> uint(2)));
    int _890 = int(_886) & 3;
    float _892 = (*spvDescriptorSet0.cp_c6)._m0[int(_888)][_890];
    int _894 = int(_886) + 1;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    int _898 = _894 & 3;
    float _900 = (*spvDescriptorSet0.cp_c6)._m0[int(_896)][_898];
    float _902 = _684 * _714;
    float _904 = fma(_690, _734, _880);
    float _906 = fma(_698, _734, _882);
    float _908 = _684 * _722;
    float _910 = _692 * _722;
    float _912 = _700 * _722;
    float _914 = _684 * _764;
    int _916 = _356 + 48;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    uint _920 = uint(int(uint(int(_918)) >> uint(2)));
    int _922 = int(_918) & 3;
    float _924 = (*spvDescriptorSet0.cp_c6)._m0[int(_920)][_922];
    int _926 = int(_918) + 1;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    int _930 = _926 & 3;
    float _932 = (*spvDescriptorSet0.cp_c6)._m0[int(_928)][_930];
    float _934 = fma(_682, _742, _908);
    float _936 = fma(_690, _742, _910);
    float _938 = fma(_698, _742, _912);
    float _940 = _684 * _756;
    float _942 = _692 * _756;
    float _944 = _700 * _756;
    float _946 = _692 * _764;
    float _948 = _700 * _764;
    int _950 = _356 + 24;
    uint _952 = uint(int(uint(_950) >> uint(2)));
    uint _954 = uint(int(uint(int(_952)) >> uint(2)));
    int _956 = int(_952) & 3;
    float _958 = (*spvDescriptorSet0.cp_c6)._m0[int(_954)][_956];
    int _960 = int(_952) + 1;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    int _964 = _960 & 3;
    float _966 = (*spvDescriptorSet0.cp_c6)._m0[int(_962)][_964];
    float _968 = fma(_682, _774, _940);
    float _970 = fma(_682, _782, _914);
    float _972 = fma(_690, _774, _942);
    float _974 = fma(_690, _782, _946);
    float _976 = fma(_698, _774, _944);
    float _978 = fma(_698, _782, _948);
    float _980 = fma(_682, _734, _902);
    int _982 = _356 + 40;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    uint _986 = uint(int(uint(int(_984)) >> uint(2)));
    int _988 = int(_984) & 3;
    float _990 = (*spvDescriptorSet0.cp_c6)._m0[int(_986)][_988];
    int _992 = int(_984) + 1;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    int _996 = _992 & 3;
    float _998 = (*spvDescriptorSet0.cp_c6)._m0[int(_994)][_996];
    float _1000 = fma(_686, _800, _934);
    float _1002 = fma(_686, _810, _968);
    float _1004 = fma(_686, _792, _980);
    float _1006 = fma(_686, _818, _970);
    float _1008 = fma(_694, _792, _904);
    float _1010 = fma(_694, _800, _936);
    float _1012 = fma(_694, _810, _972);
    int _1014 = _356 + 56;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
    int _1020 = int(_1016) & 3;
    float _1022 = (*spvDescriptorSet0.cp_c6)._m0[int(_1018)][_1020];
    int _1024 = int(_1016) + 1;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    int _1028 = _1024 & 3;
    float _1030 = (*spvDescriptorSet0.cp_c6)._m0[int(_1026)][_1028];
    float _1032 = fma(_694, _818, _974);
    float _1034 = fma(_702, _818, _978);
    float _1036 = _1006 + _688;
    float _1038 = fma(_702, _792, _906);
    float _1040 = _1032 + _696;
    float _1042 = fma(_702, _800, _938);
    float _1044 = fma(_702, _810, _976);
    float _1046 = _1034 + _704;
    float _1048 = _1040 * _836;
    float _1050 = _1012 * _836;
    float _1052 = _1008 * _836;
    float _1054 = _1010 * _836;
    float _1056 = fma(_1036, _828, _1048);
    float _1058 = fma(_1002, _828, _1050);
    float _1060 = _1040 * _900;
    float _1062 = _1008 * _900;
    float _1064 = _1010 * _900;
    float _1066 = _1012 * _900;
    float _1068 = fma(_1036, _892, _1060);
    int _1070 = _746 * 48;
    float _1072 = fma(_1004, _828, _1052);
    float _1074 = fma(_1000, _828, _1054);
    float _1076 = _1040 * _932;
    float _1078 = _1008 * _932;
    float _1080 = _1010 * _932;
    float _1082 = _1012 * _932;
    float _1084 = fma(_1036, _924, _1076);
    float _1086 = fma(_1004, _892, _1062);
    float _1088 = fma(_1000, _892, _1064);
    float _1090 = fma(_1002, _892, _1066);
    float _1092 = fma(_1004, _924, _1078);
    float _1094 = fma(_1046, _958, _1056);
    float _1096 = fma(_1000, _924, _1080);
    float _1098 = fma(_1002, _924, _1082);
    float _1100 = fma(_1044, _958, _1058);
    float _1102 = fma(_1038, _958, _1072);
    float _1104 = fma(_1042, _958, _1074);
    float _1106 = _1094 + _966;
    int _1108 = _1070 + 16;
    float _1110 = fma(_1046, _990, _1068);
    float _1112 = fma(_1038, _990, _1086);
    float _1114 = fma(_1042, _990, _1088);
    float _1116 = fma(_1044, _990, _1090);
    float _1118 = _1110 + _998;
    int _1120 = _1070 + 32;
    int _1122 = _1070 + 48;
    float _1124 = fma(_1046, _1022, _1084);
    float _1126 = fma(_1038, _1022, _1092);
    float _1128 = fma(_1042, _1022, _1096);
    float _1130 = fma(_1044, _1022, _1098);
    float _1132 = _1124 + _1030;
    uint _1134 = uint(int(uint(_1108) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1134)] = as_type<uint>(_1102);
    int _1136 = _1108 + 4;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1138)] = as_type<uint>(_1104);
    int _1140 = _1108 + 8;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1142)] = as_type<uint>(_1100);
    int _1144 = _1108 + 12;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1146)] = as_type<uint>(_1106);
    uint _1148 = uint(int(uint(_1120) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1148)] = as_type<uint>(_1112);
    int _1150 = _1120 + 4;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1152)] = as_type<uint>(_1114);
    int _1154 = _1120 + 8;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1156)] = as_type<uint>(_1116);
    int _1158 = _1120 + 12;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1160)] = as_type<uint>(_1118);
    uint _1162 = uint(int(uint(_1122) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1162)] = as_type<uint>(_1126);
    int _1164 = _1122 + 4;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1166)] = as_type<uint>(_1128);
    int _1168 = _1122 + 8;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1170)] = as_type<uint>(_1130);
    int _1172 = _1122 + 12;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1174)] = as_type<uint>(_1132);
}

