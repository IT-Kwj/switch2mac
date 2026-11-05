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
int _56(thread const int& _2843, thread const int& _2844, constant _10& support_buffer)
{
    int _2847 = 1 + _2844;
    float _2849 = support_buffer._m5[_2847].x;
    bool _2851 = _2849 == 1.0;
    if (_2851)
    {
        return _2843;
    }
    float _2853 = float(_2843);
    float _2855 = _2853 * _2849;
    int _2857 = int(_2855);
    return _2857;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _604 = false;
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
    int3 _1114 = int3(_87, _93, 1);
    float4 _96 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1114.xy), uint(_1114.z), 0).xyzw;
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
    int3 _1134 = int3(_110, _116, 0);
    float3 _120 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1134.xy), uint(_1134.z), 0).xyz;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    int _128 = _66;
    int _130 = 0;
    int _132 = _56(_128, _130, (*spvDescriptorSet0.support_buffer));
    int _134 = as_type<int>(_81);
    int _136 = 0;
    int _138 = _56(_134, _136, (*spvDescriptorSet0.support_buffer));
    int3 _1152 = int3(_132, _138, 2);
    float3 _140 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1152.xy), uint(_1152.z), 0).xyz;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    bool _148 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x);
    bool _150 = _66 != 0;
    int _152 = _66 * 48;
    float _154 = _104 * 2.0;
    float _156 = _98 * 2.0;
    float _158 = _100 * 2.0;
    float _160 = _102 * 2.0;
    float _162 = _102 * _154;
    float _164 = _98 * _154;
    float _166 = _100 * _154;
    float _168 = -_156;
    float _170 = fma(_98, _168, 1.0);
    float _172 = -_158;
    float _174 = fma(_100, _172, 1.0);
    float _176 = -_162;
    float _178 = fma(_100, _156, _176);
    float _180 = fma(_102, _156, _166);
    float _182 = fma(_100, _156, _162);
    float _184 = -_166;
    float _186 = fma(_102, _156, _184);
    float _188 = -_160;
    float _190 = fma(_102, _188, _174);
    float _192 = -_160;
    float _194 = fma(_102, _192, _170);
    float _196 = -_164;
    float _198 = fma(_102, _158, _196);
    float _200 = fma(_102, _158, _164);
    float _202 = -_158;
    float _204 = fma(_100, _202, _170);
    float _206 = _122 * _190;
    float _208 = _122 * _182;
    float _210 = _122 * _186;
    float _212 = _124 * _194;
    float _214 = _126 * _198;
    float _216 = _124 * _200;
    float _218 = _126 * _180;
    float _220 = _124 * _178;
    float _222 = _126 * _204;
    float _224 = _124;
    float _226 = _178;
    float _228 = _204;
    float _230 = _170;
    float _232 = _194;
    float _234 = _180;
    float _236 = _212;
    float _238 = _216;
    float _240 = _208;
    float _242 = _210;
    float _244 = _214;
    float _246 = _222;
    if (!_148)
    {
        int _248 = _66 * 48;
        int _250 = _248 + 16;
        uint _252 = uint(int(uint(_248) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_252)] = as_type<uint>(_206);
        int _254 = _248 + 4;
        uint _256 = uint(int(uint(_254) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_256)] = as_type<uint>(_220);
        int _258 = _248 + 8;
        uint _260 = uint(int(uint(_258) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_260)] = as_type<uint>(_218);
        int _262 = _248 + 12;
        uint _264 = uint(int(uint(_262) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_264)] = as_type<uint>(_142);
        int _266 = _248 + 32;
        uint _268 = uint(int(uint(_250) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_268)] = as_type<uint>(_208);
        int _270 = _250 + 4;
        uint _272 = uint(int(uint(_270) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_272)] = as_type<uint>(_212);
        int _274 = _250 + 8;
        uint _276 = uint(int(uint(_274) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_276)] = as_type<uint>(_214);
        int _278 = _250 + 12;
        uint _280 = uint(int(uint(_278) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_280)] = as_type<uint>(_144);
        uint _282 = uint(int(uint(_266) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_282)] = as_type<uint>(_210);
        int _284 = _266 + 4;
        uint _286 = uint(int(uint(_284) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_286)] = as_type<uint>(_216);
        int _288 = _266 + 8;
        uint _290 = uint(int(uint(_288) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_290)] = as_type<uint>(_222);
        int _292 = _266 + 12;
        uint _294 = uint(int(uint(_292) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_294)] = as_type<uint>(_146);
        _224 = _144;
        _226 = as_type<float>(_248);
        _228 = as_type<float>(_250);
        _230 = as_type<float>(_266);
    }
    float _296 = _224;
    float _298 = _226;
    float _300 = _228;
    float _302 = _230;
    int _304 = _152 + 16;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    _39[int(_306)] = as_type<uint>(_208);
    int _308 = _152 + 20;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    _39[int(_310)] = as_type<uint>(_212);
    int _312 = _152 + 24;
    uint _314 = uint(int(uint(_312) >> uint(2)));
    _39[int(_314)] = as_type<uint>(_214);
    int _316 = _152 + 28;
    uint _318 = uint(int(uint(_316) >> uint(2)));
    _39[int(_318)] = as_type<uint>(_144);
    int _320 = _66 * 112;
    float _322 = _300;
    float _324 = _298;
    float _326 = _296;
    float _328 = _302;
    if (!_150)
    {
        _322 = _142;
    }
    float _330 = _322;
    uint _332 = uint(int(uint(_152) >> uint(2)));
    _39[int(_332)] = as_type<uint>(_206);
    int _334 = _152 + 4;
    uint _336 = uint(int(uint(_334) >> uint(2)));
    _39[int(_336)] = as_type<uint>(_220);
    int _338 = _152 + 8;
    uint _340 = uint(int(uint(_338) >> uint(2)));
    _39[int(_340)] = as_type<uint>(_218);
    int _342 = _152 + 12;
    uint _344 = uint(int(uint(_342) >> uint(2)));
    _39[int(_344)] = as_type<uint>(_142);
    float _346 = _330;
    if (!_150)
    {
        _324 = _144;
    }
    float _348 = _324;
    float _350 = _348;
    if (!_150)
    {
        _326 = _146;
    }
    float _352 = _326;
    int _354 = _152 + 32;
    uint _356 = uint(int(uint(_354) >> uint(2)));
    _39[int(_356)] = as_type<uint>(_210);
    int _358 = _152 + 36;
    uint _360 = uint(int(uint(_358) >> uint(2)));
    _39[int(_360)] = as_type<uint>(_216);
    int _362 = _152 + 40;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    _39[int(_364)] = as_type<uint>(_222);
    int _366 = _152 + 44;
    uint _368 = uint(int(uint(_366) >> uint(2)));
    _39[int(_368)] = as_type<uint>(_146);
    float _370 = _352;
    if (!_150)
    {
        _232 = _206;
    }
    float _372 = _232;
    float _374 = _372;
    if (!_150)
    {
        _234 = _220;
    }
    float _376 = _234;
    float _378 = _376;
    if (!_150)
    {
        _328 = _218;
    }
    float _380 = _328;
    bool _382 = !_150;
    float _384 = _380;
    if (!_382)
    {
        bool _386 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _388 = !_386;
        if (!_388)
        {
            uint _390 = uint(int(uint(_320) >> uint(2)));
            uint _392 = uint(int(uint(int(_390)) >> uint(2)));
            int _394 = int(_390) & 3;
            float _396 = (*spvDescriptorSet0.cp_c6)._m0[int(_392)][_394];
            int _398 = as_type<int>(_396) * 48;
            int _400 = 0;
            bool _402;
            float _498;
            float _500;
            float _502;
            float _504;
            float _524;
            float _526;
            float _528;
            float _532;
            float _550;
            float _552;
            float _554;
            float _556;
            do
            {
                int _404 = _400;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _406 = uint(int(uint(_398) >> uint(2)));
                float _408 = as_type<float>(_39[int(_406)]);
                int _410 = _398 + 4;
                uint _412 = uint(int(uint(_410) >> uint(2)));
                float _414 = as_type<float>(_39[int(_412)]);
                int _416 = _398 + 8;
                uint _418 = uint(int(uint(_416) >> uint(2)));
                float _420 = as_type<float>(_39[int(_418)]);
                int _422 = _398 + 12;
                uint _424 = uint(int(uint(_422) >> uint(2)));
                float _426 = as_type<float>(_39[int(_424)]);
                int _428 = _404 + 1;
                int _430 = _398 + 16;
                uint _432 = uint(int(uint(_430) >> uint(2)));
                float _434 = as_type<float>(_39[int(_432)]);
                int _436 = _398 + 20;
                uint _438 = uint(int(uint(_436) >> uint(2)));
                float _440 = as_type<float>(_39[int(_438)]);
                int _442 = _398 + 24;
                uint _444 = uint(int(uint(_442) >> uint(2)));
                float _446 = as_type<float>(_39[int(_444)]);
                int _448 = _398 + 28;
                uint _450 = uint(int(uint(_448) >> uint(2)));
                float _452 = as_type<float>(_39[int(_450)]);
                bool _454 = uint(_428) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _456 = _398 + 32;
                uint _458 = uint(int(uint(_456) >> uint(2)));
                float _460 = as_type<float>(_39[int(_458)]);
                int _462 = _398 + 36;
                uint _464 = uint(int(uint(_462) >> uint(2)));
                float _466 = as_type<float>(_39[int(_464)]);
                int _468 = _398 + 40;
                uint _470 = uint(int(uint(_468) >> uint(2)));
                float _472 = as_type<float>(_39[int(_470)]);
                int _474 = _398 + 44;
                uint _476 = uint(int(uint(_474) >> uint(2)));
                float _478 = as_type<float>(_39[int(_476)]);
                float _480 = _144 * _414;
                float _482 = _208 * _414;
                float _484 = _212 * _414;
                float _486 = _214 * _414;
                float _488 = fma(_142, _408, _480);
                float _490 = fma(_206, _408, _482);
                float _492 = fma(_220, _408, _484);
                float _494 = fma(_218, _408, _486);
                float _496 = fma(_146, _420, _488);
                _498 = fma(_210, _420, _490);
                _500 = fma(_216, _420, _492);
                _502 = fma(_222, _420, _494);
                _504 = _426 + _496;
                float _506 = _144 * _440;
                float _508 = _208 * _440;
                float _510 = _212 * _440;
                float _512 = _214 * _440;
                float _514 = fma(_142, _434, _506);
                float _516 = fma(_206, _434, _508);
                float _518 = fma(_220, _434, _510);
                float _520 = fma(_218, _434, _512);
                float _522 = fma(_146, _446, _514);
                _524 = fma(_210, _446, _516);
                _526 = fma(_216, _446, _518);
                _528 = fma(_222, _446, _520);
                float _530 = _144 * _466;
                _532 = _452 + _522;
                float _534 = _208 * _466;
                float _536 = _212 * _466;
                float _538 = _214 * _466;
                float _540 = fma(_142, _460, _530);
                float _542 = fma(_206, _460, _534);
                float _544 = fma(_220, _460, _536);
                float _546 = fma(_218, _460, _538);
                float _548 = fma(_146, _472, _540);
                _550 = fma(_210, _472, _542);
                _552 = fma(_216, _472, _544);
                _554 = fma(_222, _472, _546);
                _556 = _478 + _548;
                uint _558 = uint(int(uint(_152) >> uint(2)));
                _39[int(_558)] = as_type<uint>(_498);
                int _560 = _152 + 4;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                _39[int(_562)] = as_type<uint>(_500);
                int _564 = _152 + 8;
                uint _566 = uint(int(uint(_564) >> uint(2)));
                _39[int(_566)] = as_type<uint>(_502);
                int _568 = _152 + 12;
                uint _570 = uint(int(uint(_568) >> uint(2)));
                _39[int(_570)] = as_type<uint>(_504);
                int _572 = _152 + 16;
                uint _574 = uint(int(uint(_572) >> uint(2)));
                _39[int(_574)] = as_type<uint>(_524);
                int _576 = _152 + 20;
                uint _578 = uint(int(uint(_576) >> uint(2)));
                _39[int(_578)] = as_type<uint>(_526);
                int _580 = _152 + 24;
                uint _582 = uint(int(uint(_580) >> uint(2)));
                _39[int(_582)] = as_type<uint>(_528);
                int _584 = _152 + 28;
                uint _586 = uint(int(uint(_584) >> uint(2)));
                _39[int(_586)] = as_type<uint>(_532);
                int _588 = _152 + 32;
                uint _590 = uint(int(uint(_588) >> uint(2)));
                _39[int(_590)] = as_type<uint>(_550);
                int _592 = _152 + 36;
                uint _594 = uint(int(uint(_592) >> uint(2)));
                _39[int(_594)] = as_type<uint>(_552);
                int _596 = _152 + 40;
                uint _598 = uint(int(uint(_596) >> uint(2)));
                _39[int(_598)] = as_type<uint>(_554);
                int _600 = _152 + 44;
                uint _602 = uint(int(uint(_600) >> uint(2)));
                _39[int(_602)] = as_type<uint>(_556);
                _402 = !_454;
                _400 = _428;
            } while (_402);
            _236 = _526;
            _238 = _552;
            _378 = _500;
            _240 = _524;
            _242 = _550;
            _374 = _498;
            _244 = _528;
            _384 = _502;
            _350 = _532;
            _346 = _504;
            _246 = _554;
            _370 = _556;
            _604 = true;
        }
        else
        {
            _236 = 0.0;
            _238 = 0.0;
            _378 = 0.0;
            _240 = 0.0;
            _242 = 0.0;
            _374 = 0.0;
            _244 = 0.0;
            _384 = 0.0;
            _350 = 0.0;
            _346 = 0.0;
            _246 = 0.0;
            _370 = 0.0;
        }
    }
    _604 = false;
    float _606 = _236;
    float _608 = _238;
    float _610 = _378;
    float _612 = _240;
    float _614 = _242;
    float _616 = _374;
    float _618 = _244;
    float _620 = _384;
    float _622 = _350;
    float _624 = _346;
    float _626 = _246;
    float _628 = _370;
    int _630 = _320 + 80;
    uint _632 = uint(int(uint(_630) >> uint(2)));
    uint _634 = uint(int(uint(int(_632)) >> uint(2)));
    int _636 = int(_632) & 3;
    float _638 = (*spvDescriptorSet0.cp_c6)._m0[int(_634)][_636];
    int _640 = int(_632) + 1;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    int _644 = _640 & 3;
    float _646 = (*spvDescriptorSet0.cp_c6)._m0[int(_642)][_644];
    int _648 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _650 = _648 + _66;
    int _652 = _320 + 64;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    uint _656 = uint(int(uint(int(_654)) >> uint(2)));
    int _658 = int(_654) & 3;
    float _660 = (*spvDescriptorSet0.cp_c6)._m0[int(_656)][_658];
    int _662 = int(_654) + 1;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    int _666 = _662 & 3;
    float _668 = (*spvDescriptorSet0.cp_c6)._m0[int(_664)][_666];
    int _670 = _650 * 48;
    int _672 = _320 + 88;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.cp_c6)._m0[int(_676)][_678];
    int _682 = int(_674) + 1;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    int _686 = _682 & 3;
    float _688 = (*spvDescriptorSet0.cp_c6)._m0[int(_684)][_686];
    int _690 = _320 + 72;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.cp_c6)._m0[int(_694)][_696];
    int _700 = int(_692) + 1;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    int _704 = _700 & 3;
    float _706 = (*spvDescriptorSet0.cp_c6)._m0[int(_702)][_704];
    int _708 = _320 + 104;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.cp_c6)._m0[int(_712)][_714];
    int _718 = int(_710) + 1;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    int _722 = _718 & 3;
    float _724 = (*spvDescriptorSet0.cp_c6)._m0[int(_720)][_722];
    int _726 = _320 + 96;
    uint _728 = uint(int(uint(_726) >> uint(2)));
    uint _730 = uint(int(uint(int(_728)) >> uint(2)));
    int _732 = int(_728) & 3;
    float _734 = (*spvDescriptorSet0.cp_c6)._m0[int(_730)][_732];
    int _736 = int(_728) + 1;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    int _740 = _736 & 3;
    float _742 = (*spvDescriptorSet0.cp_c6)._m0[int(_738)][_740];
    float _744 = _606 * _638;
    float _746 = _608 * _638;
    int _748 = _320 + 16;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.cp_c6)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.cp_c6)._m0[int(_760)][_762];
    float _766 = _610 * _638;
    float _768 = fma(_612, _660, _744);
    float _770 = fma(_614, _660, _746);
    float _772 = _610 * _646;
    float _774 = _606 * _646;
    float _776 = _608 * _646;
    int _778 = _320 + 32;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    uint _782 = uint(int(uint(int(_780)) >> uint(2)));
    int _784 = int(_780) & 3;
    float _786 = (*spvDescriptorSet0.cp_c6)._m0[int(_782)][_784];
    int _788 = int(_780) + 1;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    int _792 = _788 & 3;
    float _794 = (*spvDescriptorSet0.cp_c6)._m0[int(_790)][_792];
    float _796 = fma(_616, _668, _772);
    float _798 = fma(_612, _668, _774);
    float _800 = fma(_614, _668, _776);
    float _802 = _610 * _680;
    float _804 = _610 * _688;
    float _806 = _606 * _680;
    float _808 = _608 * _680;
    int _810 = _320 + 48;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    uint _814 = uint(int(uint(int(_812)) >> uint(2)));
    int _816 = int(_812) & 3;
    float _818 = (*spvDescriptorSet0.cp_c6)._m0[int(_814)][_816];
    int _820 = int(_812) + 1;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    int _824 = _820 & 3;
    float _826 = (*spvDescriptorSet0.cp_c6)._m0[int(_822)][_824];
    float _828 = _606 * _688;
    float _830 = _608 * _688;
    float _832 = fma(_616, _698, _802);
    float _834 = fma(_616, _706, _804);
    float _836 = fma(_612, _698, _806);
    float _838 = fma(_612, _706, _828);
    float _840 = fma(_614, _698, _808);
    int _842 = _320 + 24;
    uint _844 = uint(int(uint(_842) >> uint(2)));
    uint _846 = uint(int(uint(int(_844)) >> uint(2)));
    int _848 = int(_844) & 3;
    float _850 = (*spvDescriptorSet0.cp_c6)._m0[int(_846)][_848];
    int _852 = int(_844) + 1;
    uint _854 = uint(int(uint(_852) >> uint(2)));
    int _856 = _852 & 3;
    float _858 = (*spvDescriptorSet0.cp_c6)._m0[int(_854)][_856];
    float _860 = fma(_614, _706, _830);
    float _862 = fma(_616, _660, _766);
    float _864 = fma(_618, _724, _838);
    float _866 = fma(_620, _724, _834);
    float _868 = fma(_618, _716, _836);
    float _870 = fma(_620, _716, _832);
    float _872 = _864 + _622;
    int _874 = _320 + 40;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    uint _878 = uint(int(uint(int(_876)) >> uint(2)));
    int _880 = int(_876) & 3;
    float _882 = (*spvDescriptorSet0.cp_c6)._m0[int(_878)][_880];
    int _884 = int(_876) + 1;
    uint _886 = uint(int(uint(_884) >> uint(2)));
    int _888 = _884 & 3;
    float _890 = (*spvDescriptorSet0.cp_c6)._m0[int(_886)][_888];
    float _892 = _866 + _624;
    float _894 = fma(_626, _716, _840);
    float _896 = fma(_620, _742, _796);
    float _898 = fma(_618, _734, _768);
    float _900 = fma(_618, _742, _798);
    float _902 = fma(_626, _724, _860);
    float _904 = fma(_620, _734, _862);
    int _906 = _320 + 56;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.cp_c6)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.cp_c6)._m0[int(_918)][_920];
    float _924 = fma(_626, _734, _770);
    float _926 = _902 + _628;
    float _928 = fma(_626, _742, _800);
    int _930 = _670 + 32;
    float _932 = _872 * _764;
    float _934 = _900 * _764;
    float _936 = _868 * _764;
    float _938 = _898 * _764;
    float _940 = fma(_892, _756, _932);
    float _942 = fma(_896, _756, _934);
    float _944 = fma(_870, _756, _936);
    float _946 = fma(_904, _756, _938);
    float _948 = _872 * _794;
    float _950 = _868 * _794;
    float _952 = _900 * _794;
    float _954 = _898 * _794;
    float _956 = fma(_892, _786, _948);
    float _958 = fma(_870, _786, _950);
    float _960 = fma(_896, _786, _952);
    float _962 = fma(_904, _786, _954);
    float _964 = _872 * _826;
    float _966 = _868 * _826;
    float _968 = _900 * _826;
    float _970 = _898 * _826;
    float _972 = fma(_892, _818, _964);
    float _974 = fma(_870, _818, _966);
    float _976 = fma(_896, _818, _968);
    float _978 = fma(_904, _818, _970);
    float _980 = fma(_926, _850, _940);
    float _982 = fma(_928, _850, _942);
    float _984 = fma(_924, _850, _946);
    float _986 = fma(_894, _850, _944);
    float _988 = _980 + _858;
    float _990 = fma(_926, _882, _956);
    float _992 = fma(_928, _882, _960);
    float _994 = fma(_924, _882, _962);
    float _996 = fma(_894, _882, _958);
    float _998 = _990 + _890;
    float _1000 = fma(_926, _914, _972);
    float _1002 = fma(_894, _914, _974);
    int _1004 = _670 + 16;
    float _1006 = fma(_924, _914, _978);
    float _1008 = fma(_928, _914, _976);
    float _1010 = _1000 + _922;
    int _1012 = _670 + 48;
    uint _1014 = uint(int(uint(_1004) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1014)] = as_type<uint>(_984);
    int _1016 = _1004 + 4;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1018)] = as_type<uint>(_982);
    int _1020 = _1004 + 8;
    uint _1022 = uint(int(uint(_1020) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1022)] = as_type<uint>(_986);
    int _1024 = _1004 + 12;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1026)] = as_type<uint>(_988);
    uint _1028 = uint(int(uint(_930) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1028)] = as_type<uint>(_994);
    int _1030 = _930 + 4;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1032)] = as_type<uint>(_992);
    int _1034 = _930 + 8;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1036)] = as_type<uint>(_996);
    int _1038 = _930 + 12;
    uint _1040 = uint(int(uint(_1038) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1040)] = as_type<uint>(_998);
    uint _1042 = uint(int(uint(_1012) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1042)] = as_type<uint>(_1006);
    int _1044 = _1012 + 4;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1046)] = as_type<uint>(_1008);
    int _1048 = _1012 + 8;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1050)] = as_type<uint>(_1002);
    int _1052 = _1012 + 12;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1054)] = as_type<uint>(_1010);
}

