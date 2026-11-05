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
int _56(thread const int& _2830, thread const int& _2831, constant _10& support_buffer)
{
    int _2834 = 1 + _2831;
    float _2836 = support_buffer._m5[_2834].x;
    bool _2838 = _2836 == 1.0;
    if (_2838)
    {
        return _2830;
    }
    float _2840 = float(_2830);
    float _2842 = _2840 * _2836;
    int _2844 = int(_2842);
    return _2844;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _550 = false;
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
    int _83 = _66;
    int _85 = 0;
    int _87 = _56(_83, _85, (*spvDescriptorSet0.support_buffer));
    int _89 = as_type<int>(_81);
    int _91 = 0;
    int _93 = _56(_89, _91, (*spvDescriptorSet0.support_buffer));
    int3 _1104 = int3(_87, _93, 1);
    float4 _96 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1104.xy), uint(_1104.z), 0).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    int _106 = _66;
    int _108 = 0;
    int _110 = _56(_106, _108, (*spvDescriptorSet0.support_buffer));
    int _112 = as_type<int>(_81);
    int _114 = 0;
    int _116 = _56(_112, _114, (*spvDescriptorSet0.support_buffer));
    int3 _1124 = int3(_110, _116, 0);
    float3 _120 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1124.xy), uint(_1124.z), 0).xyz;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    int _128 = _66;
    int _130 = 0;
    int _132 = _56(_128, _130, (*spvDescriptorSet0.support_buffer));
    int _134 = as_type<int>(_81);
    int _136 = 0;
    int _138 = _56(_134, _136, (*spvDescriptorSet0.support_buffer));
    int3 _1142 = int3(_132, _138, 2);
    float3 _140 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1142.xy), uint(_1142.z), 0).xyz;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    bool _148 = _66 != 0;
    float _150 = _104 * 2.0;
    float _152 = _98 * 2.0;
    float _154 = _100 * 2.0;
    float _156 = _102 * 2.0;
    float _158 = _102 * _150;
    float _160 = _98 * _150;
    float _162 = _100 * _150;
    float _164 = -_152;
    float _166 = fma(_98, _164, 1.0);
    float _168 = -_154;
    float _170 = fma(_100, _168, 1.0);
    float _172 = -_158;
    float _174 = fma(_100, _152, _172);
    float _176 = fma(_100, _152, _158);
    float _178 = fma(_102, _152, _162);
    float _180 = -_162;
    float _182 = fma(_102, _152, _180);
    float _184 = -_156;
    float _186 = fma(_102, _184, _170);
    float _188 = -_156;
    float _190 = fma(_102, _188, _166);
    float _192 = -_160;
    float _194 = fma(_102, _154, _192);
    float _196 = fma(_102, _154, _160);
    float _198 = -_154;
    float _200 = fma(_100, _198, _166);
    float _202 = _122 * _182;
    float _204 = _126 * _178;
    float _206 = _126 * _194;
    float _208 = _122 * _186;
    float _210 = _122 * _176;
    float _212 = _124 * _174;
    float _214 = _124 * _190;
    float _216 = _124 * _196;
    int _218 = _66 * 48;
    float _220 = _126 * _200;
    int _222 = _66 * 112;
    int _224 = _218 + 16;
    uint _226 = uint(int(uint(_218) >> uint(2)));
    _39[int(_226)] = as_type<uint>(_208);
    int _228 = _218 + 4;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    _39[int(_230)] = as_type<uint>(_212);
    int _232 = _218 + 8;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    _39[int(_234)] = as_type<uint>(_204);
    int _236 = _218 + 12;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    _39[int(_238)] = as_type<uint>(_142);
    int _240 = _218 + 32;
    float _242 = _186;
    float _244 = _194;
    float _246 = _190;
    float _248 = _200;
    float _250 = _196;
    float _252 = _122;
    float _254 = _124;
    float _256 = _158;
    float _258 = _202;
    float _260 = _216;
    float _262 = _220;
    float _264 = _146;
    if (!_148)
    {
        _242 = _142;
    }
    float _266 = _242;
    int _268 = _218 + 16;
    uint _270 = uint(int(uint(_268) >> uint(2)));
    _39[int(_270)] = as_type<uint>(_210);
    int _272 = _218 + 20;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    _39[int(_274)] = as_type<uint>(_214);
    int _276 = _218 + 24;
    uint _278 = uint(int(uint(_276) >> uint(2)));
    _39[int(_278)] = as_type<uint>(_206);
    int _280 = _218 + 28;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    _39[int(_282)] = as_type<uint>(_144);
    float _284 = _266;
    if (!_148)
    {
        _244 = _144;
    }
    float _286 = _244;
    float _288 = _286;
    if (!_148)
    {
        _246 = _208;
    }
    float _290 = _246;
    int _292 = _218 + 32;
    uint _294 = uint(int(uint(_292) >> uint(2)));
    _39[int(_294)] = as_type<uint>(_202);
    int _296 = _218 + 36;
    uint _298 = uint(int(uint(_296) >> uint(2)));
    _39[int(_298)] = as_type<uint>(_216);
    int _300 = _218 + 40;
    uint _302 = uint(int(uint(_300) >> uint(2)));
    _39[int(_302)] = as_type<uint>(_220);
    int _304 = _218 + 44;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    _39[int(_306)] = as_type<uint>(_146);
    float _308 = _290;
    if (!_148)
    {
        _248 = _212;
    }
    float _310 = _248;
    float _312 = _310;
    if (!_148)
    {
        _250 = _204;
    }
    float _314 = _250;
    float _316 = _314;
    if (!_148)
    {
        _252 = _210;
    }
    float _318 = _252;
    float _320 = _318;
    if (!_148)
    {
        _254 = _214;
    }
    float _322 = _254;
    float _324 = _322;
    if (!_148)
    {
        _256 = _206;
    }
    float _326 = _256;
    bool _328 = !_148;
    float _330 = _326;
    if (!_328)
    {
        bool _332 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _334 = !_332;
        if (!_334)
        {
            uint _336 = uint(int(uint(_222) >> uint(2)));
            uint _338 = uint(int(uint(int(_336)) >> uint(2)));
            int _340 = int(_336) & 3;
            float _342 = (*spvDescriptorSet0.cp_c6)._m0[int(_338)][_340];
            int _344 = as_type<int>(_342) * 48;
            int _346 = 0;
            bool _348;
            float _444;
            float _446;
            float _448;
            float _458;
            float _470;
            float _472;
            float _474;
            float _478;
            float _496;
            float _498;
            float _500;
            float _502;
            do
            {
                int _350 = _346;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _352 = uint(int(uint(_344) >> uint(2)));
                float _354 = as_type<float>(_39[int(_352)]);
                int _356 = _344 + 4;
                uint _358 = uint(int(uint(_356) >> uint(2)));
                float _360 = as_type<float>(_39[int(_358)]);
                int _362 = _344 + 8;
                uint _364 = uint(int(uint(_362) >> uint(2)));
                float _366 = as_type<float>(_39[int(_364)]);
                int _368 = _344 + 12;
                uint _370 = uint(int(uint(_368) >> uint(2)));
                float _372 = as_type<float>(_39[int(_370)]);
                int _374 = _350 + 1;
                int _376 = _344 + 16;
                uint _378 = uint(int(uint(_376) >> uint(2)));
                float _380 = as_type<float>(_39[int(_378)]);
                int _382 = _344 + 20;
                uint _384 = uint(int(uint(_382) >> uint(2)));
                float _386 = as_type<float>(_39[int(_384)]);
                int _388 = _344 + 24;
                uint _390 = uint(int(uint(_388) >> uint(2)));
                float _392 = as_type<float>(_39[int(_390)]);
                int _394 = _344 + 28;
                uint _396 = uint(int(uint(_394) >> uint(2)));
                float _398 = as_type<float>(_39[int(_396)]);
                bool _400 = uint(_374) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _402 = _344 + 32;
                uint _404 = uint(int(uint(_402) >> uint(2)));
                float _406 = as_type<float>(_39[int(_404)]);
                int _408 = _344 + 36;
                uint _410 = uint(int(uint(_408) >> uint(2)));
                float _412 = as_type<float>(_39[int(_410)]);
                int _414 = _344 + 40;
                uint _416 = uint(int(uint(_414) >> uint(2)));
                float _418 = as_type<float>(_39[int(_416)]);
                int _420 = _344 + 44;
                uint _422 = uint(int(uint(_420) >> uint(2)));
                float _424 = as_type<float>(_39[int(_422)]);
                float _426 = _144 * _360;
                float _428 = _210 * _360;
                float _430 = _214 * _360;
                float _432 = _206 * _360;
                float _434 = fma(_142, _354, _426);
                float _436 = fma(_208, _354, _428);
                float _438 = fma(_212, _354, _430);
                float _440 = fma(_204, _354, _432);
                float _442 = fma(_146, _366, _434);
                _444 = fma(_202, _366, _436);
                _446 = fma(_216, _366, _438);
                _448 = fma(_220, _366, _440);
                float _450 = _144 * _386;
                float _452 = _210 * _386;
                float _454 = _214 * _386;
                float _456 = _206 * _386;
                _458 = _372 + _442;
                float _460 = fma(_142, _380, _450);
                float _462 = fma(_208, _380, _452);
                float _464 = fma(_212, _380, _454);
                float _466 = fma(_204, _380, _456);
                float _468 = fma(_146, _392, _460);
                _470 = fma(_202, _392, _462);
                _472 = fma(_216, _392, _464);
                _474 = fma(_220, _392, _466);
                float _476 = _144 * _412;
                _478 = _398 + _468;
                float _480 = _210 * _412;
                float _482 = _214 * _412;
                float _484 = _206 * _412;
                float _486 = fma(_142, _406, _476);
                float _488 = fma(_208, _406, _480);
                float _490 = fma(_212, _406, _482);
                float _492 = fma(_204, _406, _484);
                float _494 = fma(_146, _418, _486);
                _496 = fma(_202, _418, _488);
                _498 = fma(_216, _418, _490);
                _500 = fma(_220, _418, _492);
                _502 = _424 + _494;
                uint _504 = uint(int(uint(_218) >> uint(2)));
                _39[int(_504)] = as_type<uint>(_444);
                int _506 = _218 + 4;
                uint _508 = uint(int(uint(_506) >> uint(2)));
                _39[int(_508)] = as_type<uint>(_446);
                int _510 = _218 + 8;
                uint _512 = uint(int(uint(_510) >> uint(2)));
                _39[int(_512)] = as_type<uint>(_448);
                int _514 = _218 + 12;
                uint _516 = uint(int(uint(_514) >> uint(2)));
                _39[int(_516)] = as_type<uint>(_458);
                int _518 = _218 + 16;
                uint _520 = uint(int(uint(_518) >> uint(2)));
                _39[int(_520)] = as_type<uint>(_470);
                int _522 = _218 + 20;
                uint _524 = uint(int(uint(_522) >> uint(2)));
                _39[int(_524)] = as_type<uint>(_472);
                int _526 = _218 + 24;
                uint _528 = uint(int(uint(_526) >> uint(2)));
                _39[int(_528)] = as_type<uint>(_474);
                int _530 = _218 + 28;
                uint _532 = uint(int(uint(_530) >> uint(2)));
                _39[int(_532)] = as_type<uint>(_478);
                int _534 = _218 + 32;
                uint _536 = uint(int(uint(_534) >> uint(2)));
                _39[int(_536)] = as_type<uint>(_496);
                int _538 = _218 + 36;
                uint _540 = uint(int(uint(_538) >> uint(2)));
                _39[int(_540)] = as_type<uint>(_498);
                int _542 = _218 + 40;
                uint _544 = uint(int(uint(_542) >> uint(2)));
                _39[int(_544)] = as_type<uint>(_500);
                int _546 = _218 + 44;
                uint _548 = uint(int(uint(_546) >> uint(2)));
                _39[int(_548)] = as_type<uint>(_502);
                _348 = !_400;
                _346 = _374;
            } while (_348);
            _308 = _444;
            _312 = _446;
            _316 = _448;
            _284 = _458;
            _320 = _470;
            _324 = _472;
            _330 = _474;
            _288 = _478;
            _258 = _496;
            _260 = _498;
            _262 = _500;
            _264 = _502;
            _550 = true;
        }
        else
        {
            _308 = 0.0;
            _312 = 0.0;
            _316 = 0.0;
            _284 = 0.0;
            _320 = 0.0;
            _324 = 0.0;
            _330 = 0.0;
            _288 = 0.0;
            _258 = 0.0;
            _260 = 0.0;
            _262 = 0.0;
            _264 = 0.0;
        }
    }
    _550 = false;
    float _552 = _308;
    float _554 = _312;
    float _556 = _316;
    float _558 = _284;
    float _560 = _320;
    float _562 = _324;
    float _564 = _330;
    float _566 = _288;
    float _568 = _258;
    float _570 = _260;
    float _572 = _262;
    float _574 = _264;
    int _576 = _222 + 80;
    uint _578 = uint(int(uint(_576) >> uint(2)));
    uint _580 = uint(int(uint(int(_578)) >> uint(2)));
    int _582 = int(_578) & 3;
    float _584 = (*spvDescriptorSet0.cp_c6)._m0[int(_580)][_582];
    int _586 = int(_578) + 1;
    uint _588 = uint(int(uint(_586) >> uint(2)));
    int _590 = _586 & 3;
    float _592 = (*spvDescriptorSet0.cp_c6)._m0[int(_588)][_590];
    bool _594 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _596 = _222 + 64;
    uint _598 = uint(int(uint(_596) >> uint(2)));
    uint _600 = uint(int(uint(int(_598)) >> uint(2)));
    int _602 = int(_598) & 3;
    float _604 = (*spvDescriptorSet0.cp_c6)._m0[int(_600)][_602];
    int _606 = int(_598) + 1;
    uint _608 = uint(int(uint(_606) >> uint(2)));
    int _610 = _606 & 3;
    float _612 = (*spvDescriptorSet0.cp_c6)._m0[int(_608)][_610];
    int _614 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _616 = _614 + _66;
    int _618 = _222 + 88;
    uint _620 = uint(int(uint(_618) >> uint(2)));
    uint _622 = uint(int(uint(int(_620)) >> uint(2)));
    int _624 = int(_620) & 3;
    float _626 = (*spvDescriptorSet0.cp_c6)._m0[int(_622)][_624];
    int _628 = int(_620) + 1;
    uint _630 = uint(int(uint(_628) >> uint(2)));
    int _632 = _628 & 3;
    float _634 = (*spvDescriptorSet0.cp_c6)._m0[int(_630)][_632];
    int _636 = _222 + 72;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    uint _640 = uint(int(uint(int(_638)) >> uint(2)));
    int _642 = int(_638) & 3;
    float _644 = (*spvDescriptorSet0.cp_c6)._m0[int(_640)][_642];
    int _646 = int(_638) + 1;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    int _650 = _646 & 3;
    float _652 = (*spvDescriptorSet0.cp_c6)._m0[int(_648)][_650];
    int _654 = _222 + 96;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.cp_c6)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.cp_c6)._m0[int(_666)][_668];
    int _672 = _222 + 104;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.cp_c6)._m0[int(_676)][_678];
    int _682 = int(_674) + 1;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    int _686 = _682 & 3;
    float _688 = (*spvDescriptorSet0.cp_c6)._m0[int(_684)][_686];
    int _690 = _222 + 16;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.cp_c6)._m0[int(_694)][_696];
    int _700 = int(_692) + 1;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    int _704 = _700 & 3;
    float _706 = (*spvDescriptorSet0.cp_c6)._m0[int(_702)][_704];
    if (!_594)
    {
        uint _708 = uint(int(uint(_218) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_708)] = as_type<uint>(_552);
        int _710 = _218 + 4;
        uint _712 = uint(int(uint(_710) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_712)] = as_type<uint>(_554);
        int _714 = _218 + 8;
        uint _716 = uint(int(uint(_714) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_716)] = as_type<uint>(_556);
        int _718 = _218 + 12;
        uint _720 = uint(int(uint(_718) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_720)] = as_type<uint>(_558);
        uint _722 = uint(int(uint(_224) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_722)] = as_type<uint>(_560);
        int _724 = _224 + 4;
        uint _726 = uint(int(uint(_724) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_726)] = as_type<uint>(_562);
        int _728 = _224 + 8;
        uint _730 = uint(int(uint(_728) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_730)] = as_type<uint>(_564);
        int _732 = _224 + 12;
        uint _734 = uint(int(uint(_732) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_734)] = as_type<uint>(_566);
        uint _736 = uint(int(uint(_240) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_736)] = as_type<uint>(_568);
        int _738 = _240 + 4;
        uint _740 = uint(int(uint(_738) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_740)] = as_type<uint>(_570);
        int _742 = _240 + 8;
        uint _744 = uint(int(uint(_742) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_744)] = as_type<uint>(_572);
        int _746 = _240 + 12;
        uint _748 = uint(int(uint(_746) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_748)] = as_type<uint>(_574);
    }
    float _750 = _562 * _584;
    float _752 = _570 * _584;
    int _754 = _222 + 32;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    uint _758 = uint(int(uint(int(_756)) >> uint(2)));
    int _760 = int(_756) & 3;
    float _762 = (*spvDescriptorSet0.cp_c6)._m0[int(_758)][_760];
    int _764 = int(_756) + 1;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    int _768 = _764 & 3;
    float _770 = (*spvDescriptorSet0.cp_c6)._m0[int(_766)][_768];
    float _772 = _554 * _584;
    float _774 = fma(_560, _604, _750);
    float _776 = fma(_568, _604, _752);
    float _778 = _554 * _592;
    float _780 = _562 * _592;
    float _782 = _570 * _592;
    float _784 = _554 * _634;
    int _786 = _222 + 48;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    uint _790 = uint(int(uint(int(_788)) >> uint(2)));
    int _792 = int(_788) & 3;
    float _794 = (*spvDescriptorSet0.cp_c6)._m0[int(_790)][_792];
    int _796 = int(_788) + 1;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    int _800 = _796 & 3;
    float _802 = (*spvDescriptorSet0.cp_c6)._m0[int(_798)][_800];
    float _804 = fma(_552, _612, _778);
    float _806 = fma(_560, _612, _780);
    float _808 = fma(_568, _612, _782);
    float _810 = _554 * _626;
    float _812 = _562 * _626;
    float _814 = _570 * _626;
    float _816 = _562 * _634;
    float _818 = _570 * _634;
    int _820 = _222 + 24;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.cp_c6)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.cp_c6)._m0[int(_832)][_834];
    float _838 = fma(_552, _644, _810);
    float _840 = fma(_552, _652, _784);
    float _842 = fma(_560, _644, _812);
    float _844 = fma(_560, _652, _816);
    float _846 = fma(_568, _644, _814);
    float _848 = fma(_568, _652, _818);
    float _850 = fma(_552, _604, _772);
    int _852 = _222 + 40;
    uint _854 = uint(int(uint(_852) >> uint(2)));
    uint _856 = uint(int(uint(int(_854)) >> uint(2)));
    int _858 = int(_854) & 3;
    float _860 = (*spvDescriptorSet0.cp_c6)._m0[int(_856)][_858];
    int _862 = int(_854) + 1;
    uint _864 = uint(int(uint(_862) >> uint(2)));
    int _866 = _862 & 3;
    float _868 = (*spvDescriptorSet0.cp_c6)._m0[int(_864)][_866];
    float _870 = fma(_556, _670, _804);
    float _872 = fma(_556, _680, _838);
    float _874 = fma(_556, _662, _850);
    float _876 = fma(_556, _688, _840);
    float _878 = fma(_564, _662, _774);
    float _880 = fma(_564, _670, _806);
    float _882 = fma(_564, _680, _842);
    int _884 = _222 + 56;
    uint _886 = uint(int(uint(_884) >> uint(2)));
    uint _888 = uint(int(uint(int(_886)) >> uint(2)));
    int _890 = int(_886) & 3;
    float _892 = (*spvDescriptorSet0.cp_c6)._m0[int(_888)][_890];
    int _894 = int(_886) + 1;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    int _898 = _894 & 3;
    float _900 = (*spvDescriptorSet0.cp_c6)._m0[int(_896)][_898];
    float _902 = fma(_564, _688, _844);
    float _904 = fma(_572, _688, _848);
    float _906 = _876 + _558;
    float _908 = fma(_572, _662, _776);
    float _910 = _902 + _566;
    float _912 = fma(_572, _670, _808);
    float _914 = fma(_572, _680, _846);
    float _916 = _904 + _574;
    float _918 = _910 * _706;
    float _920 = _882 * _706;
    float _922 = _878 * _706;
    float _924 = _880 * _706;
    float _926 = fma(_906, _698, _918);
    float _928 = fma(_872, _698, _920);
    float _930 = _910 * _770;
    float _932 = _878 * _770;
    float _934 = _880 * _770;
    float _936 = _882 * _770;
    float _938 = fma(_906, _762, _930);
    int _940 = _616 * 48;
    float _942 = fma(_874, _698, _922);
    float _944 = fma(_870, _698, _924);
    float _946 = _910 * _802;
    float _948 = _878 * _802;
    float _950 = _880 * _802;
    float _952 = _882 * _802;
    float _954 = fma(_906, _794, _946);
    float _956 = fma(_874, _762, _932);
    float _958 = fma(_870, _762, _934);
    float _960 = fma(_872, _762, _936);
    float _962 = fma(_874, _794, _948);
    float _964 = fma(_916, _828, _926);
    float _966 = fma(_870, _794, _950);
    float _968 = fma(_872, _794, _952);
    float _970 = fma(_914, _828, _928);
    float _972 = fma(_908, _828, _942);
    float _974 = fma(_912, _828, _944);
    float _976 = _964 + _836;
    int _978 = _940 + 16;
    float _980 = fma(_916, _860, _938);
    float _982 = fma(_908, _860, _956);
    float _984 = fma(_912, _860, _958);
    float _986 = fma(_914, _860, _960);
    float _988 = _980 + _868;
    int _990 = _940 + 32;
    int _992 = _940 + 48;
    float _994 = fma(_916, _892, _954);
    float _996 = fma(_908, _892, _962);
    float _998 = fma(_912, _892, _966);
    float _1000 = fma(_914, _892, _968);
    float _1002 = _994 + _900;
    uint _1004 = uint(int(uint(_978) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1004)] = as_type<uint>(_972);
    int _1006 = _978 + 4;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1008)] = as_type<uint>(_974);
    int _1010 = _978 + 8;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1012)] = as_type<uint>(_970);
    int _1014 = _978 + 12;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1016)] = as_type<uint>(_976);
    uint _1018 = uint(int(uint(_990) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1018)] = as_type<uint>(_982);
    int _1020 = _990 + 4;
    uint _1022 = uint(int(uint(_1020) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1022)] = as_type<uint>(_984);
    int _1024 = _990 + 8;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1026)] = as_type<uint>(_986);
    int _1028 = _990 + 12;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1030)] = as_type<uint>(_988);
    uint _1032 = uint(int(uint(_992) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1032)] = as_type<uint>(_996);
    int _1034 = _992 + 4;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1036)] = as_type<uint>(_998);
    int _1038 = _992 + 8;
    uint _1040 = uint(int(uint(_1038) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1040)] = as_type<uint>(_1000);
    int _1042 = _992 + 12;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1044)] = as_type<uint>(_1002);
}

