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
int _54(thread const int& _2947, thread const int& _2948, constant _10& support_buffer)
{
    int _2951 = 1 + _2948;
    float _2953 = support_buffer._m5[_2951].x;
    bool _2955 = _2953 == 1.0;
    if (_2955)
    {
        return _2947;
    }
    float _2957 = float(_2947);
    float _2959 = _2957 * _2953;
    int _2961 = int(_2959);
    return _2961;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _674 = false;
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
    int _95 = _74 ? _87 : _93;
    int _97 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _99 = _97 + 32;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.cp_c5)._m0[int(_103)][_105];
    int _109 = _95 & as_type<int>(_107);
    bool _111 = _109 != 0;
    int _113 = 0;
    int _115 = as_type<int>(_107);
    float _117 = as_type<float>(_97);
    if (_111)
    {
        uint _119 = uint(int(uint(_97) >> uint(2)));
        uint _121 = uint(int(uint(int(_119)) >> uint(2)));
        int _123 = int(_119) & 3;
        float _125 = (*spvDescriptorSet0.cp_c5)._m0[int(_121)][_123];
        _113 = as_type<int>(_125);
    }
    int _127 = _113;
    float _129 = 0.0;
    float _131 = 0.0;
    if (!_111)
    {
        _129 = 0.0;
        _131 = 0.0;
    }
    float _133 = _129;
    float _135 = _131;
    float _137 = 0.0;
    if (!_111)
    {
        _137 = 0.0;
    }
    float _139 = _137;
    float _141 = 0.0;
    if (!_111)
    {
        _141 = 0.0;
        _115 = 0;
    }
    float _143 = _141;
    int _145 = _115;
    float _147 = 0.0;
    if (_111)
    {
        _147 = 1.4012984643248170709237295832899e-45;
    }
    float _149 = _147;
    float _151 = 0.0;
    float _153 = 0.0;
    if (!_111)
    {
        _151 = 0.0;
        _153 = 0.0;
    }
    float _155 = _151;
    float _157 = _153;
    int _159 = 0;
    int _161 = 0;
    if (!_111)
    {
        _159 = 0;
        _161 = 0;
    }
    int _163 = _159;
    int _165 = _161;
    float _167 = 0.0;
    if (_111)
    {
        _167 = 2.8025969286496341418474591665798e-45;
    }
    float _169 = _167;
    float _171 = _133;
    float _173 = _135;
    float _175 = _139;
    float _177 = 0.0;
    if (_111)
    {
        int _179 = _64;
        int _181 = 0;
        int _183 = _54(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = _127;
        int _187 = 0;
        int _189 = _54(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _1301 = int3(_183, _189, as_type<int>(_149));
        float4 _192 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1301.xy), uint(_1301.z), 0).xyzw;
        float _194 = _192.x;
        float _196 = _192.y;
        float _198 = _192.z;
        float _200 = _192.w;
        _171 = _194;
        _173 = _196;
        _175 = _198;
        _177 = _200;
    }
    float _202 = _171;
    float _204 = _173;
    float _206 = _175;
    float _208 = _177;
    float _210 = _155;
    float _212 = _157;
    float _214 = _143;
    if (_111)
    {
        int _216 = _64;
        int _218 = 0;
        int _220 = _54(_216, _218, (*spvDescriptorSet0.support_buffer));
        int _222 = _127;
        int _224 = 0;
        int _226 = _54(_222, _224, (*spvDescriptorSet0.support_buffer));
        int3 _1334 = int3(_220, _226, 0);
        float3 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1334.xy), uint(_1334.z), 0).xyz;
        float _232 = _230.x;
        float _234 = _230.y;
        float _236 = _230.z;
        _210 = _232;
        _212 = _234;
        _214 = _236;
    }
    float _238 = _210;
    float _240 = _212;
    float _242 = _214;
    int _244 = _163;
    int _246 = _165;
    int _248 = _145;
    if (_111)
    {
        int _250 = _64;
        int _252 = 0;
        int _254 = _54(_250, _252, (*spvDescriptorSet0.support_buffer));
        int _256 = _127;
        int _258 = 0;
        int _260 = _54(_256, _258, (*spvDescriptorSet0.support_buffer));
        int3 _1365 = int3(_254, _260, as_type<int>(_169));
        float3 _262 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1365.xy), uint(_1365.z), 0).xyz;
        float _264 = _262.x;
        float _266 = _262.y;
        float _268 = _262.z;
        _244 = as_type<int>(_264);
        _246 = as_type<int>(_266);
        _248 = as_type<int>(_268);
    }
    int _270 = _244;
    int _272 = _246;
    int _274 = _248;
    if (!_111)
    {
        _117 = 0.0;
    }
    float _276 = _117;
    int _278 = _64 * 48;
    float _280 = _202 * _202;
    float _282 = _276;
    if (_111)
    {
        float _284 = _208 * 2.0;
        _282 = _284;
    }
    float _286 = _282;
    float _288 = _204 * _204;
    float _290 = _202 * 2.0;
    float _292 = fma(_280, -2.0, 1.0);
    float _294 = _206 * _286;
    float _296 = _202 * _286;
    float _298 = _204 * _286;
    float _300 = _206 * _206;
    float _302 = fma(_288, -2.0, 1.0);
    float _304 = -_294;
    float _306 = fma(_290, _204, _304);
    float _308 = fma(_290, _204, _294);
    float _310 = _204 * 2.0;
    float _312 = fma(_290, _206, _298);
    float _314 = -_298;
    float _316 = fma(_290, _206, _314);
    float _318 = fma(_300, -2.0, _302);
    float _320 = -_296;
    float _322 = fma(_310, _206, _320);
    float _324 = fma(_310, _206, _296);
    float _326 = fma(_300, -2.0, _292);
    float _328 = fma(_288, -2.0, _292);
    float _330 = _316 * _238;
    float _332 = _318 * _238;
    float _334 = _308 * _238;
    float _336 = _326 * _240;
    float _338 = _306 * _240;
    float _340 = _324 * _240;
    float _342 = _312 * _242;
    float _344 = _322 * _242;
    float _346 = _328 * _242;
    bool _348 = _64 != 0;
    int _350 = _64 * 112;
    int _352 = _278 + 16;
    uint _354 = uint(int(uint(_352) >> uint(2)));
    _37[int(_354)] = as_type<uint>(_334);
    int _356 = _278 + 20;
    uint _358 = uint(int(uint(_356) >> uint(2)));
    _37[int(_358)] = as_type<uint>(_336);
    int _360 = _278 + 24;
    uint _362 = uint(int(uint(_360) >> uint(2)));
    _37[int(_362)] = as_type<uint>(_344);
    int _364 = _278 + 28;
    uint _366 = uint(int(uint(_364) >> uint(2)));
    _37[int(_366)] = uint(_272);
    int _368 = _278 + 32;
    uint _370 = uint(int(uint(_368) >> uint(2)));
    _37[int(_370)] = as_type<uint>(_330);
    int _372 = _278 + 36;
    uint _374 = uint(int(uint(_372) >> uint(2)));
    _37[int(_374)] = as_type<uint>(_340);
    int _376 = _278 + 40;
    uint _378 = uint(int(uint(_376) >> uint(2)));
    _37[int(_378)] = as_type<uint>(_346);
    int _380 = _278 + 44;
    uint _382 = uint(int(uint(_380) >> uint(2)));
    _37[int(_382)] = uint(_274);
    uint _384 = uint(int(uint(_278) >> uint(2)));
    _37[int(_384)] = as_type<uint>(_332);
    int _386 = _278 + 4;
    uint _388 = uint(int(uint(_386) >> uint(2)));
    _37[int(_388)] = as_type<uint>(_338);
    int _390 = _278 + 8;
    uint _392 = uint(int(uint(_390) >> uint(2)));
    _37[int(_392)] = as_type<uint>(_342);
    int _394 = _278 + 12;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    _37[int(_396)] = uint(_270);
    float _398 = _308;
    float _400 = _312;
    float _402 = _324;
    float _404 = _328;
    float _406 = _306;
    float _408 = as_type<float>(_270);
    float _410 = _340;
    float _412 = _330;
    float _414 = _344;
    float _416 = _346;
    if (!_348)
    {
        _398 = as_type<float>(_270);
    }
    float _418 = _398;
    float _420 = _418;
    if (!_348)
    {
        _400 = as_type<float>(_272);
    }
    float _422 = _400;
    float _424 = _422;
    if (!_348)
    {
        _402 = as_type<float>(_274);
    }
    float _426 = _402;
    float _428 = 0.0;
    float _430 = _426;
    if (!_348)
    {
        _428 = _332;
    }
    float _432 = _428;
    float _434 = _432;
    if (!_348)
    {
        _404 = _338;
    }
    float _436 = _404;
    float _438 = 0.0;
    float _440 = _436;
    if (!_348)
    {
        _438 = _342;
    }
    float _442 = _438;
    float _444 = _442;
    if (!_348)
    {
        _406 = _334;
    }
    float _446 = _406;
    float _448 = _446;
    if (!_348)
    {
        _408 = _336;
    }
    float _450 = _408;
    bool _452 = !_348;
    float _454 = _450;
    if (!_452)
    {
        bool _456 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _458 = !_456;
        if (!_458)
        {
            uint _460 = uint(int(uint(_350) >> uint(2)));
            uint _462 = uint(int(uint(int(_460)) >> uint(2)));
            int _464 = int(_460) & 3;
            float _466 = (*spvDescriptorSet0.cp_c6)._m0[int(_462)][_464];
            int _468 = as_type<int>(_466) * 48;
            int _470 = 0;
            bool _472;
            float _568;
            float _570;
            float _572;
            float _574;
            float _596;
            float _598;
            float _608;
            float _618;
            float _620;
            float _622;
            float _624;
            float _626;
            do
            {
                int _474 = _470;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _476 = uint(int(uint(_468) >> uint(2)));
                float _478 = as_type<float>(_37[int(_476)]);
                int _480 = _468 + 4;
                uint _482 = uint(int(uint(_480) >> uint(2)));
                float _484 = as_type<float>(_37[int(_482)]);
                int _486 = _468 + 8;
                uint _488 = uint(int(uint(_486) >> uint(2)));
                float _490 = as_type<float>(_37[int(_488)]);
                int _492 = _468 + 12;
                uint _494 = uint(int(uint(_492) >> uint(2)));
                float _496 = as_type<float>(_37[int(_494)]);
                int _498 = _474 + 1;
                int _500 = _468 + 16;
                uint _502 = uint(int(uint(_500) >> uint(2)));
                float _504 = as_type<float>(_37[int(_502)]);
                int _506 = _468 + 20;
                uint _508 = uint(int(uint(_506) >> uint(2)));
                float _510 = as_type<float>(_37[int(_508)]);
                int _512 = _468 + 24;
                uint _514 = uint(int(uint(_512) >> uint(2)));
                float _516 = as_type<float>(_37[int(_514)]);
                int _518 = _468 + 28;
                uint _520 = uint(int(uint(_518) >> uint(2)));
                float _522 = as_type<float>(_37[int(_520)]);
                bool _524 = uint(_498) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _526 = _468 + 32;
                uint _528 = uint(int(uint(_526) >> uint(2)));
                float _530 = as_type<float>(_37[int(_528)]);
                int _532 = _468 + 36;
                uint _534 = uint(int(uint(_532) >> uint(2)));
                float _536 = as_type<float>(_37[int(_534)]);
                int _538 = _468 + 40;
                uint _540 = uint(int(uint(_538) >> uint(2)));
                float _542 = as_type<float>(_37[int(_540)]);
                int _544 = _468 + 44;
                uint _546 = uint(int(uint(_544) >> uint(2)));
                float _548 = as_type<float>(_37[int(_546)]);
                float _550 = _484 * as_type<float>(_272);
                float _552 = _334 * _484;
                float _554 = _336 * _484;
                float _556 = _344 * _484;
                float _558 = fma(_478, as_type<float>(_270), _550);
                float _560 = fma(_332, _478, _552);
                float _562 = fma(_338, _478, _554);
                float _564 = fma(_342, _478, _556);
                float _566 = fma(_490, as_type<float>(_274), _558);
                _568 = fma(_330, _490, _560);
                _570 = fma(_340, _490, _562);
                _572 = fma(_346, _490, _564);
                _574 = _496 + _566;
                float _576 = _510 * as_type<float>(_272);
                float _578 = _334 * _510;
                float _580 = _336 * _510;
                float _582 = _344 * _510;
                float _584 = fma(_504, as_type<float>(_270), _576);
                float _586 = fma(_332, _504, _578);
                float _588 = fma(_338, _504, _580);
                float _590 = fma(_342, _504, _582);
                float _592 = fma(_516, as_type<float>(_274), _584);
                float _594 = _536 * as_type<float>(_272);
                _596 = fma(_330, _516, _586);
                _598 = fma(_340, _516, _588);
                float _600 = _334 * _536;
                float _602 = _336 * _536;
                float _604 = _344 * _536;
                float _606 = fma(_530, as_type<float>(_270), _594);
                _608 = _522 + _592;
                float _610 = fma(_332, _530, _600);
                float _612 = fma(_338, _530, _602);
                float _614 = fma(_342, _530, _604);
                float _616 = fma(_542, as_type<float>(_274), _606);
                _618 = fma(_346, _516, _590);
                _620 = fma(_330, _542, _610);
                _622 = fma(_340, _542, _612);
                _624 = fma(_346, _542, _614);
                _626 = _548 + _616;
                uint _628 = uint(int(uint(_278) >> uint(2)));
                _37[int(_628)] = as_type<uint>(_568);
                int _630 = _278 + 4;
                uint _632 = uint(int(uint(_630) >> uint(2)));
                _37[int(_632)] = as_type<uint>(_570);
                int _634 = _278 + 8;
                uint _636 = uint(int(uint(_634) >> uint(2)));
                _37[int(_636)] = as_type<uint>(_572);
                int _638 = _278 + 12;
                uint _640 = uint(int(uint(_638) >> uint(2)));
                _37[int(_640)] = as_type<uint>(_574);
                int _642 = _278 + 16;
                uint _644 = uint(int(uint(_642) >> uint(2)));
                _37[int(_644)] = as_type<uint>(_596);
                int _646 = _278 + 20;
                uint _648 = uint(int(uint(_646) >> uint(2)));
                _37[int(_648)] = as_type<uint>(_598);
                int _650 = _278 + 24;
                uint _652 = uint(int(uint(_650) >> uint(2)));
                _37[int(_652)] = as_type<uint>(_618);
                int _654 = _278 + 28;
                uint _656 = uint(int(uint(_654) >> uint(2)));
                _37[int(_656)] = as_type<uint>(_608);
                int _658 = _278 + 32;
                uint _660 = uint(int(uint(_658) >> uint(2)));
                _37[int(_660)] = as_type<uint>(_620);
                int _662 = _278 + 36;
                uint _664 = uint(int(uint(_662) >> uint(2)));
                _37[int(_664)] = as_type<uint>(_622);
                int _666 = _278 + 40;
                uint _668 = uint(int(uint(_666) >> uint(2)));
                _37[int(_668)] = as_type<uint>(_624);
                int _670 = _278 + 44;
                uint _672 = uint(int(uint(_670) >> uint(2)));
                _37[int(_672)] = as_type<uint>(_626);
                _472 = !_524;
                _470 = _498;
            } while (_472);
            _454 = _598;
            _410 = _622;
            _440 = _570;
            _448 = _596;
            _412 = _620;
            _434 = _568;
            _444 = _572;
            _414 = _618;
            _416 = _624;
            _424 = _608;
            _420 = _574;
            _430 = _626;
            _674 = true;
        }
        else
        {
            _454 = 0.0;
            _410 = 0.0;
            _440 = 0.0;
            _448 = 0.0;
            _412 = 0.0;
            _434 = 0.0;
            _444 = 0.0;
            _414 = 0.0;
            _416 = 0.0;
            _424 = 0.0;
            _420 = 0.0;
            _430 = 0.0;
        }
    }
    _674 = false;
    float _676 = _454;
    float _678 = _410;
    float _680 = _440;
    float _682 = _448;
    float _684 = _412;
    float _686 = _434;
    float _688 = _444;
    float _690 = _414;
    float _692 = _416;
    float _694 = _424;
    float _696 = _420;
    float _698 = _430;
    int _700 = _350 + 80;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    uint _704 = uint(int(uint(int(_702)) >> uint(2)));
    int _706 = int(_702) & 3;
    float _708 = (*spvDescriptorSet0.cp_c6)._m0[int(_704)][_706];
    int _710 = int(_702) + 1;
    uint _712 = uint(int(uint(_710) >> uint(2)));
    int _714 = _710 & 3;
    float _716 = (*spvDescriptorSet0.cp_c6)._m0[int(_712)][_714];
    int _718 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _720 = _718 + _64;
    int _722 = _350 + 64;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.cp_c6)._m0[int(_726)][_728];
    int _732 = int(_724) + 1;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    int _736 = _732 & 3;
    float _738 = (*spvDescriptorSet0.cp_c6)._m0[int(_734)][_736];
    int _740 = _720 * 48;
    int _742 = _350 + 88;
    uint _744 = uint(int(uint(_742) >> uint(2)));
    uint _746 = uint(int(uint(int(_744)) >> uint(2)));
    int _748 = int(_744) & 3;
    float _750 = (*spvDescriptorSet0.cp_c6)._m0[int(_746)][_748];
    int _752 = int(_744) + 1;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    int _756 = _752 & 3;
    float _758 = (*spvDescriptorSet0.cp_c6)._m0[int(_754)][_756];
    int _760 = _350 + 72;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    uint _764 = uint(int(uint(int(_762)) >> uint(2)));
    int _766 = int(_762) & 3;
    float _768 = (*spvDescriptorSet0.cp_c6)._m0[int(_764)][_766];
    int _770 = int(_762) + 1;
    uint _772 = uint(int(uint(_770) >> uint(2)));
    int _774 = _770 & 3;
    float _776 = (*spvDescriptorSet0.cp_c6)._m0[int(_772)][_774];
    int _778 = _350 + 96;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    uint _782 = uint(int(uint(int(_780)) >> uint(2)));
    int _784 = int(_780) & 3;
    float _786 = (*spvDescriptorSet0.cp_c6)._m0[int(_782)][_784];
    int _788 = int(_780) + 1;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    int _792 = _788 & 3;
    float _794 = (*spvDescriptorSet0.cp_c6)._m0[int(_790)][_792];
    int _796 = _350 + 104;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    uint _800 = uint(int(uint(int(_798)) >> uint(2)));
    int _802 = int(_798) & 3;
    float _804 = (*spvDescriptorSet0.cp_c6)._m0[int(_800)][_802];
    int _806 = int(_798) + 1;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    int _810 = _806 & 3;
    float _812 = (*spvDescriptorSet0.cp_c6)._m0[int(_808)][_810];
    float _814 = _676 * _708;
    float _816 = _678 * _708;
    int _818 = _350 + 16;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    uint _822 = uint(int(uint(int(_820)) >> uint(2)));
    int _824 = int(_820) & 3;
    float _826 = (*spvDescriptorSet0.cp_c6)._m0[int(_822)][_824];
    int _828 = int(_820) + 1;
    uint _830 = uint(int(uint(_828) >> uint(2)));
    int _832 = _828 & 3;
    float _834 = (*spvDescriptorSet0.cp_c6)._m0[int(_830)][_832];
    float _836 = _680 * _708;
    float _838 = fma(_682, _730, _814);
    float _840 = fma(_684, _730, _816);
    float _842 = _680 * _716;
    float _844 = _676 * _716;
    float _846 = _678 * _716;
    int _848 = _350 + 32;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    uint _852 = uint(int(uint(int(_850)) >> uint(2)));
    int _854 = int(_850) & 3;
    float _856 = (*spvDescriptorSet0.cp_c6)._m0[int(_852)][_854];
    int _858 = int(_850) + 1;
    uint _860 = uint(int(uint(_858) >> uint(2)));
    int _862 = _858 & 3;
    float _864 = (*spvDescriptorSet0.cp_c6)._m0[int(_860)][_862];
    float _866 = fma(_686, _738, _842);
    float _868 = fma(_682, _738, _844);
    float _870 = fma(_684, _738, _846);
    float _872 = _680 * _750;
    float _874 = _680 * _758;
    float _876 = _676 * _750;
    float _878 = _678 * _750;
    int _880 = _350 + 48;
    uint _882 = uint(int(uint(_880) >> uint(2)));
    uint _884 = uint(int(uint(int(_882)) >> uint(2)));
    int _886 = int(_882) & 3;
    float _888 = (*spvDescriptorSet0.cp_c6)._m0[int(_884)][_886];
    int _890 = int(_882) + 1;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    int _894 = _890 & 3;
    float _896 = (*spvDescriptorSet0.cp_c6)._m0[int(_892)][_894];
    float _898 = _676 * _758;
    float _900 = _678 * _758;
    float _902 = fma(_686, _768, _872);
    float _904 = fma(_686, _776, _874);
    float _906 = fma(_682, _768, _876);
    float _908 = fma(_682, _776, _898);
    float _910 = fma(_684, _768, _878);
    int _912 = _350 + 24;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.cp_c6)._m0[int(_916)][_918];
    int _922 = int(_914) + 1;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    int _926 = _922 & 3;
    float _928 = (*spvDescriptorSet0.cp_c6)._m0[int(_924)][_926];
    float _930 = fma(_684, _776, _900);
    float _932 = fma(_686, _730, _836);
    float _934 = fma(_688, _794, _866);
    float _936 = fma(_690, _786, _838);
    float _938 = fma(_690, _794, _868);
    float _940 = fma(_692, _786, _840);
    float _942 = fma(_692, _794, _870);
    int _944 = _350 + 40;
    uint _946 = uint(int(uint(_944) >> uint(2)));
    uint _948 = uint(int(uint(int(_946)) >> uint(2)));
    int _950 = int(_946) & 3;
    float _952 = (*spvDescriptorSet0.cp_c6)._m0[int(_948)][_950];
    int _954 = int(_946) + 1;
    uint _956 = uint(int(uint(_954) >> uint(2)));
    int _958 = _954 & 3;
    float _960 = (*spvDescriptorSet0.cp_c6)._m0[int(_956)][_958];
    float _962 = fma(_688, _786, _932);
    int _964 = _740 + 32;
    float _966 = fma(_690, _804, _906);
    float _968 = fma(_690, _812, _908);
    float _970 = fma(_688, _812, _904);
    float _972 = fma(_692, _812, _930);
    float _974 = fma(_692, _804, _910);
    int _976 = _350 + 56;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    uint _980 = uint(int(uint(int(_978)) >> uint(2)));
    int _982 = int(_978) & 3;
    float _984 = (*spvDescriptorSet0.cp_c6)._m0[int(_980)][_982];
    int _986 = int(_978) + 1;
    uint _988 = uint(int(uint(_986) >> uint(2)));
    int _990 = _986 & 3;
    float _992 = (*spvDescriptorSet0.cp_c6)._m0[int(_988)][_990];
    float _994 = _968 + _694;
    float _996 = _970 + _696;
    float _998 = _972 + _698;
    float _1000 = fma(_688, _804, _902);
    float _1002 = _994 * _834;
    float _1004 = _938 * _834;
    float _1006 = _966 * _834;
    float _1008 = _936 * _834;
    float _1010 = fma(_996, _826, _1002);
    float _1012 = fma(_934, _826, _1004);
    float _1014 = fma(_1000, _826, _1006);
    float _1016 = fma(_962, _826, _1008);
    float _1018 = _994 * _864;
    float _1020 = _966 * _864;
    float _1022 = _938 * _864;
    float _1024 = _936 * _864;
    float _1026 = fma(_996, _856, _1018);
    float _1028 = fma(_1000, _856, _1020);
    float _1030 = fma(_934, _856, _1022);
    float _1032 = fma(_962, _856, _1024);
    float _1034 = _994 * _896;
    float _1036 = _966 * _896;
    float _1038 = _938 * _896;
    float _1040 = _936 * _896;
    float _1042 = fma(_996, _888, _1034);
    float _1044 = fma(_1000, _888, _1036);
    float _1046 = fma(_934, _888, _1038);
    float _1048 = fma(_962, _888, _1040);
    float _1050 = fma(_998, _920, _1010);
    float _1052 = fma(_942, _920, _1012);
    float _1054 = fma(_940, _920, _1016);
    float _1056 = fma(_974, _920, _1014);
    float _1058 = _1050 + _928;
    float _1060 = fma(_998, _952, _1026);
    float _1062 = fma(_942, _952, _1030);
    float _1064 = fma(_940, _952, _1032);
    float _1066 = fma(_974, _952, _1028);
    float _1068 = _1060 + _960;
    float _1070 = fma(_998, _984, _1042);
    float _1072 = fma(_974, _984, _1044);
    int _1074 = _740 + 16;
    float _1076 = fma(_940, _984, _1048);
    float _1078 = fma(_942, _984, _1046);
    float _1080 = _1070 + _992;
    int _1082 = _740 + 48;
    uint _1084 = uint(int(uint(_1074) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1084)] = as_type<uint>(_1054);
    int _1086 = _1074 + 4;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1088)] = as_type<uint>(_1052);
    int _1090 = _1074 + 8;
    uint _1092 = uint(int(uint(_1090) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1092)] = as_type<uint>(_1056);
    int _1094 = _1074 + 12;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1096)] = as_type<uint>(_1058);
    uint _1098 = uint(int(uint(_964) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1098)] = as_type<uint>(_1064);
    int _1100 = _964 + 4;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1102)] = as_type<uint>(_1062);
    int _1104 = _964 + 8;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1106)] = as_type<uint>(_1066);
    int _1108 = _964 + 12;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1110)] = as_type<uint>(_1068);
    uint _1112 = uint(int(uint(_1082) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1112)] = as_type<uint>(_1076);
    int _1114 = _1082 + 4;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1116)] = as_type<uint>(_1078);
    int _1118 = _1082 + 8;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1120)] = as_type<uint>(_1072);
    int _1122 = _1082 + 12;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1124)] = as_type<uint>(_1080);
}

