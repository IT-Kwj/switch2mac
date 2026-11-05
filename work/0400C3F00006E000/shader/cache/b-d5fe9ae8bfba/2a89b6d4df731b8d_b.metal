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
int _54(thread const int& _3023, thread const int& _3024, constant _10& support_buffer)
{
    int _3027 = 1 + _3024;
    float _3029 = support_buffer._m5[_3027].x;
    bool _3031 = _3029 == 1.0;
    if (_3031)
    {
        return _3023;
    }
    float _3033 = float(_3023);
    float _3035 = _3033 * _3029;
    int _3037 = int(_3035);
    return _3037;
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
            int _105 = _95;
            int _107 = 0;
            int _109 = _54(_105, _107, (*spvDescriptorSet0.support_buffer));
            int _111 = as_type<int>(_103);
            int _113 = 0;
            int _115 = _54(_111, _113, (*spvDescriptorSet0.support_buffer));
            int3 _1212 = int3(_109, _115, 1);
            float4 _118 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1212.xy), uint(_1212.z), 0).xyzw;
            float _120 = _118.x;
            float _122 = _118.y;
            float _124 = _118.z;
            float _126 = _118.w;
            int _128 = _95;
            int _130 = 0;
            int _132 = _54(_128, _130, (*spvDescriptorSet0.support_buffer));
            int _134 = as_type<int>(_103);
            int _136 = 0;
            int _138 = _54(_134, _136, (*spvDescriptorSet0.support_buffer));
            int3 _1232 = int3(_132, _138, 0);
            float3 _142 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1232.xy), uint(_1232.z), 0).xyz;
            float _144 = _142.x;
            float _146 = _142.y;
            float _148 = _142.z;
            int _150 = _95;
            int _152 = 0;
            int _154 = _54(_150, _152, (*spvDescriptorSet0.support_buffer));
            int _156 = as_type<int>(_103);
            int _158 = 0;
            int _160 = _54(_156, _158, (*spvDescriptorSet0.support_buffer));
            int3 _1250 = int3(_154, _160, 2);
            float3 _162 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1250.xy), uint(_1250.z), 0).xyz;
            float _164 = _162.x;
            float _166 = _162.y;
            float _168 = _162.z;
            float _170 = _126 * 2.0;
            float _172 = _120 * 2.0;
            float _174 = _122 * 2.0;
            float _176 = _124 * 2.0;
            float _178 = _124 * _170;
            float _180 = _120 * _170;
            float _182 = _122 * _170;
            float _184 = -_172;
            float _186 = fma(_120, _184, 1.0);
            float _188 = -_174;
            float _190 = fma(_122, _188, 1.0);
            float _192 = -_178;
            float _194 = fma(_122, _172, _192);
            float _196 = fma(_122, _172, _178);
            float _198 = fma(_124, _172, _182);
            float _200 = -_182;
            float _202 = fma(_124, _172, _200);
            float _204 = -_176;
            float _206 = fma(_124, _204, _190);
            float _208 = -_176;
            float _210 = fma(_124, _208, _186);
            float _212 = -_180;
            float _214 = fma(_124, _174, _212);
            float _216 = -_174;
            float _218 = fma(_122, _216, _186);
            float _220 = fma(_124, _174, _180);
            int _222 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _224 = _222 + _95;
            float _226 = _144 * _196;
            float _228 = _144 * _206;
            float _230 = _144 * _202;
            float _232 = _146 * _194;
            float _234 = _146 * _210;
            float _236 = _146 * _220;
            int _238 = _224 * 48;
            float _240 = _148 * _198;
            float _242 = _148 * _214;
            float _244 = _148 * _218;
            int _246 = _95 + 1;
            uint _248 = uint(int(uint(_238) >> uint(2)));
            _37[int(_248)] = as_type<uint>(_228);
            int _250 = _238 + 4;
            uint _252 = uint(int(uint(_250) >> uint(2)));
            _37[int(_252)] = as_type<uint>(_232);
            int _254 = _238 + 8;
            uint _256 = uint(int(uint(_254) >> uint(2)));
            _37[int(_256)] = as_type<uint>(_240);
            int _258 = _238 + 12;
            uint _260 = uint(int(uint(_258) >> uint(2)));
            _37[int(_260)] = as_type<uint>(_164);
            bool _262 = uint(_246) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _264 = _238 + 16;
            uint _266 = uint(int(uint(_264) >> uint(2)));
            _37[int(_266)] = as_type<uint>(_226);
            int _268 = _238 + 20;
            uint _270 = uint(int(uint(_268) >> uint(2)));
            _37[int(_270)] = as_type<uint>(_234);
            int _272 = _238 + 24;
            uint _274 = uint(int(uint(_272) >> uint(2)));
            _37[int(_274)] = as_type<uint>(_242);
            int _276 = _238 + 28;
            uint _278 = uint(int(uint(_276) >> uint(2)));
            _37[int(_278)] = as_type<uint>(_166);
            int _280 = _238 + 32;
            uint _282 = uint(int(uint(_280) >> uint(2)));
            _37[int(_282)] = as_type<uint>(_230);
            int _284 = _238 + 36;
            uint _286 = uint(int(uint(_284) >> uint(2)));
            _37[int(_286)] = as_type<uint>(_236);
            int _288 = _238 + 40;
            uint _290 = uint(int(uint(_288) >> uint(2)));
            _37[int(_290)] = as_type<uint>(_244);
            int _292 = _238 + 44;
            uint _294 = uint(int(uint(_292) >> uint(2)));
            _37[int(_294)] = as_type<uint>(_168);
            _93 = !_262;
            _91 = _246;
        } while (_93);
    }
    bool _296 = !_72;
    if (!_296)
    {
        int _298 = 1;
        bool _300;
        do
        {
            int _302 = _298;
            int _304 = _302 * 112;
            int _306 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _308 = _306 + _302;
            int _310 = _302 + 1;
            uint _312 = uint(int(uint(_304) >> uint(2)));
            uint _314 = uint(int(uint(int(_312)) >> uint(2)));
            int _316 = int(_312) & 3;
            float _318 = (*spvDescriptorSet0.cp_c6)._m0[int(_314)][_316];
            int _320 = _308 * 48;
            bool _322 = uint(_310) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _324 = _320 + 16;
            uint _326 = uint(int(uint(_324) >> uint(2)));
            float _328 = as_type<float>(_37[int(_326)]);
            int _330 = _320 + 20;
            uint _332 = uint(int(uint(_330) >> uint(2)));
            float _334 = as_type<float>(_37[int(_332)]);
            int _336 = _320 + 24;
            uint _338 = uint(int(uint(_336) >> uint(2)));
            float _340 = as_type<float>(_37[int(_338)]);
            int _342 = _320 + 28;
            uint _344 = uint(int(uint(_342) >> uint(2)));
            float _346 = as_type<float>(_37[int(_344)]);
            int _348 = _320 + 32;
            uint _350 = uint(int(uint(_348) >> uint(2)));
            float _352 = as_type<float>(_37[int(_350)]);
            int _354 = _320 + 36;
            uint _356 = uint(int(uint(_354) >> uint(2)));
            float _358 = as_type<float>(_37[int(_356)]);
            int _360 = _320 + 40;
            uint _362 = uint(int(uint(_360) >> uint(2)));
            float _364 = as_type<float>(_37[int(_362)]);
            int _366 = _320 + 44;
            uint _368 = uint(int(uint(_366) >> uint(2)));
            float _370 = as_type<float>(_37[int(_368)]);
            int _372 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _374 = _372 + as_type<int>(_318);
            int _376 = _374 * 48;
            uint _378 = uint(int(uint(_320) >> uint(2)));
            float _380 = as_type<float>(_37[int(_378)]);
            int _382 = _320 + 4;
            uint _384 = uint(int(uint(_382) >> uint(2)));
            float _386 = as_type<float>(_37[int(_384)]);
            int _388 = _320 + 8;
            uint _390 = uint(int(uint(_388) >> uint(2)));
            float _392 = as_type<float>(_37[int(_390)]);
            int _394 = _320 + 12;
            uint _396 = uint(int(uint(_394) >> uint(2)));
            float _398 = as_type<float>(_37[int(_396)]);
            uint _400 = uint(int(uint(_376) >> uint(2)));
            float _402 = as_type<float>(_37[int(_400)]);
            int _404 = _376 + 4;
            uint _406 = uint(int(uint(_404) >> uint(2)));
            float _408 = as_type<float>(_37[int(_406)]);
            int _410 = _376 + 8;
            uint _412 = uint(int(uint(_410) >> uint(2)));
            float _414 = as_type<float>(_37[int(_412)]);
            int _416 = _376 + 12;
            uint _418 = uint(int(uint(_416) >> uint(2)));
            float _420 = as_type<float>(_37[int(_418)]);
            int _422 = _376 + 16;
            uint _424 = uint(int(uint(_422) >> uint(2)));
            float _426 = as_type<float>(_37[int(_424)]);
            int _428 = _376 + 20;
            uint _430 = uint(int(uint(_428) >> uint(2)));
            float _432 = as_type<float>(_37[int(_430)]);
            int _434 = _376 + 24;
            uint _436 = uint(int(uint(_434) >> uint(2)));
            float _438 = as_type<float>(_37[int(_436)]);
            int _440 = _376 + 28;
            uint _442 = uint(int(uint(_440) >> uint(2)));
            float _444 = as_type<float>(_37[int(_442)]);
            int _446 = _376 + 32;
            uint _448 = uint(int(uint(_446) >> uint(2)));
            float _450 = as_type<float>(_37[int(_448)]);
            int _452 = _376 + 36;
            uint _454 = uint(int(uint(_452) >> uint(2)));
            float _456 = as_type<float>(_37[int(_454)]);
            int _458 = _376 + 40;
            uint _460 = uint(int(uint(_458) >> uint(2)));
            float _462 = as_type<float>(_37[int(_460)]);
            int _464 = _376 + 44;
            uint _466 = uint(int(uint(_464) >> uint(2)));
            float _468 = as_type<float>(_37[int(_466)]);
            float _470 = _346 * _408;
            float _472 = _334 * _408;
            float _474 = _328 * _408;
            float _476 = _340 * _408;
            float _478 = fma(_398, _402, _470);
            float _480 = fma(_386, _402, _472);
            float _482 = fma(_380, _402, _474);
            float _484 = fma(_392, _402, _476);
            float _486 = fma(_370, _414, _478);
            float _488 = fma(_358, _414, _480);
            float _490 = _334 * _432;
            float _492 = _328 * _432;
            float _494 = _420 + _486;
            float _496 = _346 * _432;
            float _498 = _340 * _432;
            float _500 = fma(_386, _426, _490);
            float _502 = fma(_352, _414, _482);
            float _504 = fma(_398, _426, _496);
            float _506 = fma(_392, _426, _498);
            float _508 = fma(_358, _438, _500);
            float _510 = _346 * _456;
            float _512 = _328 * _456;
            float _514 = _334 * _456;
            float _516 = _340 * _456;
            float _518 = fma(_398, _450, _510);
            float _520 = fma(_380, _426, _492);
            float _522 = fma(_370, _438, _504);
            float _524 = fma(_380, _450, _512);
            float _526 = fma(_386, _450, _514);
            float _528 = fma(_392, _450, _516);
            float _530 = fma(_370, _462, _518);
            float _532 = fma(_352, _438, _520);
            float _534 = fma(_364, _414, _484);
            float _536 = fma(_364, _438, _506);
            float _538 = _444 + _522;
            float _540 = fma(_352, _462, _524);
            float _542 = fma(_358, _462, _526);
            float _544 = fma(_364, _462, _528);
            float _546 = _468 + _530;
            uint _548 = uint(int(uint(_320) >> uint(2)));
            _37[int(_548)] = as_type<uint>(_502);
            int _550 = _320 + 4;
            uint _552 = uint(int(uint(_550) >> uint(2)));
            _37[int(_552)] = as_type<uint>(_488);
            int _554 = _320 + 8;
            uint _556 = uint(int(uint(_554) >> uint(2)));
            _37[int(_556)] = as_type<uint>(_534);
            int _558 = _320 + 12;
            uint _560 = uint(int(uint(_558) >> uint(2)));
            _37[int(_560)] = as_type<uint>(_494);
            int _562 = _320 + 16;
            uint _564 = uint(int(uint(_562) >> uint(2)));
            _37[int(_564)] = as_type<uint>(_532);
            int _566 = _320 + 20;
            uint _568 = uint(int(uint(_566) >> uint(2)));
            _37[int(_568)] = as_type<uint>(_508);
            int _570 = _320 + 24;
            uint _572 = uint(int(uint(_570) >> uint(2)));
            _37[int(_572)] = as_type<uint>(_536);
            int _574 = _320 + 28;
            uint _576 = uint(int(uint(_574) >> uint(2)));
            _37[int(_576)] = as_type<uint>(_538);
            int _578 = _320 + 32;
            uint _580 = uint(int(uint(_578) >> uint(2)));
            _37[int(_580)] = as_type<uint>(_540);
            int _582 = _320 + 36;
            uint _584 = uint(int(uint(_582) >> uint(2)));
            _37[int(_584)] = as_type<uint>(_542);
            int _586 = _320 + 40;
            uint _588 = uint(int(uint(_586) >> uint(2)));
            _37[int(_588)] = as_type<uint>(_544);
            int _590 = _320 + 44;
            uint _592 = uint(int(uint(_590) >> uint(2)));
            _37[int(_592)] = as_type<uint>(_546);
            _300 = !_322;
            _298 = _310;
        } while (_300);
    }
    if (!_70)
    {
        return;
    }
    int _594 = 0;
    bool _596;
    do
    {
        int _598 = _594;
        int _600 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _602 = _600 + _598;
        uint _604 = uint(int(uint(_76) >> uint(2)));
        uint _606 = uint(int(uint(int(_604)) >> uint(2)));
        int _608 = int(_604) & 3;
        float _610 = (*spvDescriptorSet0.cp_c4)._m0[int(_606)][_608];
        int _612 = _598 * 112;
        int _614 = _602 * 48;
        uint _616 = uint(int(uint(_614) >> uint(2)));
        float _618 = as_type<float>(_37[int(_616)]);
        int _620 = _614 + 4;
        uint _622 = uint(int(uint(_620) >> uint(2)));
        float _624 = as_type<float>(_37[int(_622)]);
        int _626 = _614 + 8;
        uint _628 = uint(int(uint(_626) >> uint(2)));
        float _630 = as_type<float>(_37[int(_628)]);
        int _632 = _614 + 12;
        uint _634 = uint(int(uint(_632) >> uint(2)));
        float _636 = as_type<float>(_37[int(_634)]);
        int _638 = _612 + 80;
        uint _640 = uint(int(uint(_638) >> uint(2)));
        uint _642 = uint(int(uint(int(_640)) >> uint(2)));
        int _644 = int(_640) & 3;
        float _646 = (*spvDescriptorSet0.cp_c6)._m0[int(_642)][_644];
        int _648 = int(_640) + 1;
        uint _650 = uint(int(uint(_648) >> uint(2)));
        int _652 = _648 & 3;
        float _654 = (*spvDescriptorSet0.cp_c6)._m0[int(_650)][_652];
        int _656 = _614 + 16;
        uint _658 = uint(int(uint(_656) >> uint(2)));
        float _660 = as_type<float>(_37[int(_658)]);
        int _662 = _614 + 20;
        uint _664 = uint(int(uint(_662) >> uint(2)));
        float _666 = as_type<float>(_37[int(_664)]);
        int _668 = _614 + 24;
        uint _670 = uint(int(uint(_668) >> uint(2)));
        float _672 = as_type<float>(_37[int(_670)]);
        int _674 = _614 + 28;
        uint _676 = uint(int(uint(_674) >> uint(2)));
        float _678 = as_type<float>(_37[int(_676)]);
        int _680 = _614 + 32;
        uint _682 = uint(int(uint(_680) >> uint(2)));
        float _684 = as_type<float>(_37[int(_682)]);
        int _686 = _614 + 36;
        uint _688 = uint(int(uint(_686) >> uint(2)));
        float _690 = as_type<float>(_37[int(_688)]);
        int _692 = _614 + 40;
        uint _694 = uint(int(uint(_692) >> uint(2)));
        float _696 = as_type<float>(_37[int(_694)]);
        int _698 = _614 + 44;
        uint _700 = uint(int(uint(_698) >> uint(2)));
        float _702 = as_type<float>(_37[int(_700)]);
        int _704 = _612 + 88;
        uint _706 = uint(int(uint(_704) >> uint(2)));
        uint _708 = uint(int(uint(int(_706)) >> uint(2)));
        int _710 = int(_706) & 3;
        float _712 = (*spvDescriptorSet0.cp_c6)._m0[int(_708)][_710];
        int _714 = int(_706) + 1;
        uint _716 = uint(int(uint(_714) >> uint(2)));
        int _718 = _714 & 3;
        float _720 = (*spvDescriptorSet0.cp_c6)._m0[int(_716)][_718];
        int _722 = _612 + 64;
        uint _724 = uint(int(uint(_722) >> uint(2)));
        uint _726 = uint(int(uint(int(_724)) >> uint(2)));
        int _728 = int(_724) & 3;
        float _730 = (*spvDescriptorSet0.cp_c6)._m0[int(_726)][_728];
        int _732 = int(_724) + 1;
        uint _734 = uint(int(uint(_732) >> uint(2)));
        int _736 = _732 & 3;
        float _738 = (*spvDescriptorSet0.cp_c6)._m0[int(_734)][_736];
        int _740 = _612 + 72;
        uint _742 = uint(int(uint(_740) >> uint(2)));
        uint _744 = uint(int(uint(int(_742)) >> uint(2)));
        int _746 = int(_742) & 3;
        float _748 = (*spvDescriptorSet0.cp_c6)._m0[int(_744)][_746];
        int _750 = int(_742) + 1;
        uint _752 = uint(int(uint(_750) >> uint(2)));
        int _754 = _750 & 3;
        float _756 = (*spvDescriptorSet0.cp_c6)._m0[int(_752)][_754];
        int _758 = _612 + 96;
        uint _760 = uint(int(uint(_758) >> uint(2)));
        uint _762 = uint(int(uint(int(_760)) >> uint(2)));
        int _764 = int(_760) & 3;
        float _766 = (*spvDescriptorSet0.cp_c6)._m0[int(_762)][_764];
        int _768 = int(_760) + 1;
        uint _770 = uint(int(uint(_768) >> uint(2)));
        int _772 = _768 & 3;
        float _774 = (*spvDescriptorSet0.cp_c6)._m0[int(_770)][_772];
        float _776 = _624 * _646;
        int _778 = _612 + 104;
        uint _780 = uint(int(uint(_778) >> uint(2)));
        uint _782 = uint(int(uint(int(_780)) >> uint(2)));
        int _784 = int(_780) & 3;
        float _786 = (*spvDescriptorSet0.cp_c6)._m0[int(_782)][_784];
        int _788 = int(_780) + 1;
        uint _790 = uint(int(uint(_788) >> uint(2)));
        int _792 = _788 & 3;
        float _794 = (*spvDescriptorSet0.cp_c6)._m0[int(_790)][_792];
        float _796 = _624 * _654;
        float _798 = _624 * _712;
        float _800 = _624 * _720;
        float _802 = fma(_618, _730, _776);
        float _804 = fma(_618, _738, _796);
        float _806 = _666 * _646;
        float _808 = _666 * _712;
        float _810 = fma(_618, _748, _798);
        float _812 = fma(_618, _756, _800);
        float _814 = _666 * _654;
        float _816 = _666 * _720;
        float _818 = fma(_660, _730, _806);
        float _820 = fma(_660, _748, _808);
        float _822 = fma(_660, _738, _814);
        float _824 = fma(_660, _756, _816);
        float _826 = _690 * _654;
        float _828 = _690 * _712;
        float _830 = _690 * _720;
        float _832 = _690 * _646;
        int _834 = _612 + 16;
        uint _836 = uint(int(uint(_834) >> uint(2)));
        uint _838 = uint(int(uint(int(_836)) >> uint(2)));
        int _840 = int(_836) & 3;
        float _842 = (*spvDescriptorSet0.cp_c6)._m0[int(_838)][_840];
        int _844 = int(_836) + 1;
        uint _846 = uint(int(uint(_844) >> uint(2)));
        int _848 = _844 & 3;
        float _850 = (*spvDescriptorSet0.cp_c6)._m0[int(_846)][_848];
        float _852 = fma(_684, _738, _826);
        float _854 = fma(_684, _748, _828);
        float _856 = fma(_684, _756, _830);
        float _858 = fma(_630, _766, _802);
        float _860 = fma(_630, _774, _804);
        float _862 = fma(_630, _786, _810);
        float _864 = fma(_630, _794, _812);
        int _866 = _612 + 24;
        uint _868 = uint(int(uint(_866) >> uint(2)));
        uint _870 = uint(int(uint(int(_868)) >> uint(2)));
        int _872 = int(_868) & 3;
        float _874 = (*spvDescriptorSet0.cp_c6)._m0[int(_870)][_872];
        int _876 = int(_868) + 1;
        uint _878 = uint(int(uint(_876) >> uint(2)));
        int _880 = _876 & 3;
        float _882 = (*spvDescriptorSet0.cp_c6)._m0[int(_878)][_880];
        float _884 = fma(_672, _766, _818);
        float _886 = fma(_672, _774, _822);
        float _888 = fma(_672, _786, _820);
        float _890 = fma(_672, _794, _824);
        float _892 = fma(_696, _794, _856);
        float _894 = fma(_696, _786, _854);
        float _896 = fma(_684, _730, _832);
        int _898 = _612 + 32;
        uint _900 = uint(int(uint(_898) >> uint(2)));
        uint _902 = uint(int(uint(int(_900)) >> uint(2)));
        int _904 = int(_900) & 3;
        float _906 = (*spvDescriptorSet0.cp_c6)._m0[int(_902)][_904];
        int _908 = int(_900) + 1;
        uint _910 = uint(int(uint(_908) >> uint(2)));
        int _912 = _908 & 3;
        float _914 = (*spvDescriptorSet0.cp_c6)._m0[int(_910)][_912];
        float _916 = _678 + _890;
        float _918 = _636 + _864;
        float _920 = _702 + _892;
        float _922 = fma(_696, _766, _896);
        float _924 = fma(_696, _774, _852);
        int _926 = as_type<int>(_610) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _928 = _926 + _598;
        int _930 = _598 + 1;
        int _932 = _612 + 48;
        uint _934 = uint(int(uint(_932) >> uint(2)));
        uint _936 = uint(int(uint(int(_934)) >> uint(2)));
        int _938 = int(_934) & 3;
        float _940 = (*spvDescriptorSet0.cp_c6)._m0[int(_936)][_938];
        int _942 = int(_934) + 1;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        int _946 = _942 & 3;
        float _948 = (*spvDescriptorSet0.cp_c6)._m0[int(_944)][_946];
        float _950 = _916 * _850;
        float _952 = _886 * _850;
        float _954 = _884 * _850;
        float _956 = _888 * _850;
        float _958 = fma(_918, _842, _950);
        float _960 = fma(_860, _842, _952);
        float _962 = fma(_858, _842, _954);
        int _964 = _612 + 40;
        uint _966 = uint(int(uint(_964) >> uint(2)));
        uint _968 = uint(int(uint(int(_966)) >> uint(2)));
        int _970 = int(_966) & 3;
        float _972 = (*spvDescriptorSet0.cp_c6)._m0[int(_968)][_970];
        int _974 = int(_966) + 1;
        uint _976 = uint(int(uint(_974) >> uint(2)));
        int _978 = _974 & 3;
        float _980 = (*spvDescriptorSet0.cp_c6)._m0[int(_976)][_978];
        float _982 = fma(_920, _874, _958);
        float _984 = fma(_862, _842, _956);
        float _986 = fma(_924, _874, _960);
        float _988 = fma(_922, _874, _962);
        float _990 = _982 + _882;
        float _992 = fma(_894, _874, _984);
        int _994 = _928 * 48;
        int _996 = _612 + 56;
        uint _998 = uint(int(uint(_996) >> uint(2)));
        uint _1000 = uint(int(uint(int(_998)) >> uint(2)));
        int _1002 = int(_998) & 3;
        float _1004 = (*spvDescriptorSet0.cp_c6)._m0[int(_1000)][_1002];
        int _1006 = int(_998) + 1;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        int _1010 = _1006 & 3;
        float _1012 = (*spvDescriptorSet0.cp_c6)._m0[int(_1008)][_1010];
        float _1014 = _916 * _914;
        float _1016 = _886 * _914;
        float _1018 = _884 * _914;
        float _1020 = _888 * _914;
        float _1022 = fma(_918, _906, _1014);
        float _1024 = fma(_860, _906, _1016);
        bool _1026 = uint(_930) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1028 = _916 * _948;
        float _1030 = _886 * _948;
        float _1032 = _884 * _948;
        float _1034 = _888 * _948;
        float _1036 = fma(_918, _940, _1028);
        float _1038 = fma(_860, _940, _1030);
        float _1040 = fma(_858, _906, _1018);
        float _1042 = fma(_862, _906, _1020);
        float _1044 = fma(_920, _972, _1022);
        float _1046 = fma(_858, _940, _1032);
        float _1048 = fma(_862, _940, _1034);
        float _1050 = fma(_924, _972, _1024);
        int _1052 = _994 + 16;
        float _1054 = fma(_922, _972, _1040);
        float _1056 = fma(_894, _972, _1042);
        float _1058 = _1044 + _980;
        float _1060 = fma(_920, _1004, _1036);
        float _1062 = fma(_924, _1004, _1038);
        int _1064 = _994 + 32;
        float _1066 = fma(_922, _1004, _1046);
        float _1068 = fma(_894, _1004, _1048);
        float _1070 = _1060 + _1012;
        int _1072 = _994 + 48;
        uint _1074 = uint(int(uint(_1052) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1074)] = as_type<uint>(_988);
        int _1076 = _1052 + 4;
        uint _1078 = uint(int(uint(_1076) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1078)] = as_type<uint>(_986);
        int _1080 = _1052 + 8;
        uint _1082 = uint(int(uint(_1080) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1082)] = as_type<uint>(_992);
        int _1084 = _1052 + 12;
        uint _1086 = uint(int(uint(_1084) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1086)] = as_type<uint>(_990);
        uint _1088 = uint(int(uint(_1064) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1088)] = as_type<uint>(_1054);
        int _1090 = _1064 + 4;
        uint _1092 = uint(int(uint(_1090) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1092)] = as_type<uint>(_1050);
        int _1094 = _1064 + 8;
        uint _1096 = uint(int(uint(_1094) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1096)] = as_type<uint>(_1056);
        int _1098 = _1064 + 12;
        uint _1100 = uint(int(uint(_1098) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1100)] = as_type<uint>(_1058);
        uint _1102 = uint(int(uint(_1072) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1102)] = as_type<uint>(_1066);
        int _1104 = _1072 + 4;
        uint _1106 = uint(int(uint(_1104) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1106)] = as_type<uint>(_1062);
        int _1108 = _1072 + 8;
        uint _1110 = uint(int(uint(_1108) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1110)] = as_type<uint>(_1068);
        int _1112 = _1072 + 12;
        uint _1114 = uint(int(uint(_1112) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1114)] = as_type<uint>(_1070);
        _596 = !_1026;
        _594 = _930;
    } while (_596);
}

