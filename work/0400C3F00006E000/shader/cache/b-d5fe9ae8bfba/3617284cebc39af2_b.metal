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
int _56(thread const int& _3161, thread const int& _3162, constant _10& support_buffer)
{
    int _3165 = 1 + _3162;
    float _3167 = support_buffer._m5[_3165].x;
    bool _3169 = _3167 == 1.0;
    if (_3169)
    {
        return _3161;
    }
    float _3171 = float(_3161);
    float _3173 = _3171 * _3167;
    int _3175 = int(_3173);
    return _3175;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _742 = false;
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
    int3 _1265 = int3(_95, _101, 1);
    float4 _104 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1265.xy), uint(_1265.z), 0).xyzw;
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
    int3 _1285 = int3(_118, _124, 1);
    float4 _126 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1285.xy), uint(_1285.z), 0).xyzw;
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
    int3 _1305 = int3(_140, _146, 0);
    float3 _150 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1305.xy), uint(_1305.z), 0).xyz;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    int _158 = _66;
    int _160 = 0;
    int _162 = _56(_158, _160, (*spvDescriptorSet0.support_buffer));
    int _164 = as_type<int>(_89);
    int _166 = 0;
    int _168 = _56(_164, _166, (*spvDescriptorSet0.support_buffer));
    int3 _1323 = int3(_162, _168, 0);
    float3 _170 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1323.xy), uint(_1323.z), 0).xyz;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    int _178 = _66;
    int _180 = 0;
    int _182 = _56(_178, _180, (*spvDescriptorSet0.support_buffer));
    int _184 = as_type<int>(_81);
    int _186 = 0;
    int _188 = _56(_184, _186, (*spvDescriptorSet0.support_buffer));
    int3 _1341 = int3(_182, _188, 2);
    float3 _190 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1341.xy), uint(_1341.z), 0).xyz;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    int _198 = _66;
    int _200 = 0;
    int _202 = _56(_198, _200, (*spvDescriptorSet0.support_buffer));
    int _204 = as_type<int>(_89);
    int _206 = 0;
    int _208 = _56(_204, _206, (*spvDescriptorSet0.support_buffer));
    int3 _1359 = int3(_202, _208, 2);
    float3 _210 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1359.xy), uint(_1359.z), 0).xyz;
    float _212 = _210.x;
    float _214 = _210.y;
    float _216 = _210.z;
    int _218 = _72 + 16;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    uint _222 = uint(int(uint(int(_220)) >> uint(2)));
    int _224 = int(_220) & 3;
    float _226 = (*spvDescriptorSet0.cp_c5)._m0[int(_222)][_224];
    bool _228 = _66 != 0;
    float _230 = -_106;
    float _232 = _230 + _128;
    float _234 = -_112;
    float _236 = _234 + _134;
    float _238 = -_110;
    float _240 = _238 + _132;
    float _242 = fma(_232, _226, _106);
    float _244 = fma(_236, _226, _112);
    float _246 = -_108;
    float _248 = _246 + _130;
    float _250 = fma(_240, _226, _110);
    float _252 = _244 * 2.0;
    float _254 = fma(_248, _226, _108);
    bool _256 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _258 = _242 * 2.0;
    float _260 = _242 * _252;
    float _262 = _254 * 2.0;
    float _264 = _250 * _252;
    float _266 = _254 * _252;
    float _268 = -_260;
    float _270 = fma(_250, _262, _268);
    float _272 = fma(_250, _262, _260);
    float _274 = _242 * _242;
    float _276 = _254 * _254;
    float _278 = -_264;
    float _280 = fma(_254, _258, _278);
    float _282 = fma(_254, _258, _264);
    float _284 = fma(_250, _258, _266);
    float _286 = -_266;
    float _288 = fma(_250, _258, _286);
    float _290 = fma(_274, -2.0, 1.0);
    float _292 = -_152;
    float _294 = _292 + _172;
    float _296 = _250 * _250;
    float _298 = fma(_276, -2.0, 1.0);
    float _300 = -_154;
    float _302 = _300 + _174;
    float _304 = fma(_294, _226, _152);
    float _306 = -_156;
    float _308 = _306 + _176;
    float _310 = fma(_296, -2.0, _298);
    float _312 = fma(_296, -2.0, _290);
    float _314 = fma(_276, -2.0, _290);
    float _316 = fma(_302, _226, _154);
    float _318 = fma(_308, _226, _156);
    float _320 = _304 * _310;
    float _322 = _304 * _282;
    float _324 = _304 * _288;
    float _326 = _316 * _280;
    float _328 = -_192;
    float _330 = _328 + _212;
    float _332 = -_194;
    float _334 = _332 + _214;
    float _336 = -_196;
    float _338 = _336 + _216;
    float _340 = _316 * _312;
    float _342 = fma(_330, _226, _192);
    float _344 = fma(_334, _226, _194);
    float _346 = fma(_338, _226, _196);
    float _348 = _316 * _272;
    float _350 = _318 * _284;
    float _352 = _318 * _270;
    float _354 = _318 * _314;
    int _356 = _66 * 48;
    float _358 = _172;
    float _360 = _174;
    float _362 = _334;
    float _364 = _318;
    float _366 = _212;
    float _368 = _194;
    float _370 = _192;
    float _372 = _196;
    float _374 = _348;
    float _376 = _324;
    float _378 = _352;
    float _380 = _354;
    if (!_256)
    {
        int _382 = _66 * 48;
        int _384 = _382 + 16;
        uint _386 = uint(int(uint(_382) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_386)] = as_type<uint>(_320);
        int _388 = _382 + 4;
        uint _390 = uint(int(uint(_388) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_390)] = as_type<uint>(_326);
        int _392 = _382 + 8;
        uint _394 = uint(int(uint(_392) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_394)] = as_type<uint>(_350);
        int _396 = _382 + 12;
        uint _398 = uint(int(uint(_396) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_398)] = as_type<uint>(_342);
        int _400 = _382 + 32;
        uint _402 = uint(int(uint(_384) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_402)] = as_type<uint>(_322);
        int _404 = _384 + 4;
        uint _406 = uint(int(uint(_404) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_406)] = as_type<uint>(_340);
        int _408 = _384 + 8;
        uint _410 = uint(int(uint(_408) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_410)] = as_type<uint>(_352);
        int _412 = _384 + 12;
        uint _414 = uint(int(uint(_412) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_414)] = as_type<uint>(_344);
        uint _416 = uint(int(uint(_400) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_416)] = as_type<uint>(_324);
        int _418 = _400 + 4;
        uint _420 = uint(int(uint(_418) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_420)] = as_type<uint>(_348);
        int _422 = _400 + 8;
        uint _424 = uint(int(uint(_422) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_424)] = as_type<uint>(_354);
        int _426 = _400 + 12;
        uint _428 = uint(int(uint(_426) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_428)] = as_type<uint>(_346);
        _358 = as_type<float>(_384);
        _360 = as_type<float>(_400);
        _362 = as_type<float>(_382);
    }
    float _430 = _358;
    float _432 = _360;
    float _434 = _362;
    uint _436 = uint(int(uint(_356) >> uint(2)));
    _39[int(_436)] = as_type<uint>(_320);
    int _438 = _356 + 4;
    uint _440 = uint(int(uint(_438) >> uint(2)));
    _39[int(_440)] = as_type<uint>(_326);
    int _442 = _356 + 8;
    uint _444 = uint(int(uint(_442) >> uint(2)));
    _39[int(_444)] = as_type<uint>(_350);
    int _446 = _356 + 12;
    uint _448 = uint(int(uint(_446) >> uint(2)));
    _39[int(_448)] = as_type<uint>(_342);
    int _450 = _66 * 112;
    float _452 = _430;
    float _454 = _434;
    float _456 = _432;
    if (!_228)
    {
        _364 = _342;
    }
    float _458 = _364;
    int _460 = _356 + 16;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    _39[int(_462)] = as_type<uint>(_322);
    int _464 = _356 + 20;
    uint _466 = uint(int(uint(_464) >> uint(2)));
    _39[int(_466)] = as_type<uint>(_340);
    int _468 = _356 + 24;
    uint _470 = uint(int(uint(_468) >> uint(2)));
    _39[int(_470)] = as_type<uint>(_352);
    int _472 = _356 + 28;
    uint _474 = uint(int(uint(_472) >> uint(2)));
    _39[int(_474)] = as_type<uint>(_344);
    float _476 = _458;
    if (!_228)
    {
        _452 = _344;
    }
    float _478 = _452;
    float _480 = _478;
    if (!_228)
    {
        _454 = _346;
    }
    float _482 = _454;
    int _484 = _356 + 32;
    uint _486 = uint(int(uint(_484) >> uint(2)));
    _39[int(_486)] = as_type<uint>(_324);
    int _488 = _356 + 36;
    uint _490 = uint(int(uint(_488) >> uint(2)));
    _39[int(_490)] = as_type<uint>(_348);
    int _492 = _356 + 40;
    uint _494 = uint(int(uint(_492) >> uint(2)));
    _39[int(_494)] = as_type<uint>(_354);
    int _496 = _356 + 44;
    uint _498 = uint(int(uint(_496) >> uint(2)));
    _39[int(_498)] = as_type<uint>(_346);
    float _500 = _482;
    if (!_228)
    {
        _366 = _320;
    }
    float _502 = _366;
    float _504 = _502;
    if (!_228)
    {
        _368 = _326;
    }
    float _506 = _368;
    float _508 = _506;
    if (!_228)
    {
        _370 = _350;
    }
    float _510 = _370;
    float _512 = _510;
    if (!_228)
    {
        _372 = _322;
    }
    float _514 = _372;
    float _516 = _514;
    if (!_228)
    {
        _456 = _340;
    }
    float _518 = _456;
    bool _520 = !_228;
    float _522 = _518;
    if (!_520)
    {
        bool _524 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _526 = !_524;
        if (!_526)
        {
            uint _528 = uint(int(uint(_450) >> uint(2)));
            uint _530 = uint(int(uint(int(_528)) >> uint(2)));
            int _532 = int(_528) & 3;
            float _534 = (*spvDescriptorSet0.cp_c6)._m0[int(_530)][_532];
            int _536 = as_type<int>(_534) * 48;
            int _538 = 0;
            bool _540;
            float _636;
            float _638;
            float _640;
            float _660;
            float _662;
            float _666;
            float _674;
            float _686;
            float _688;
            float _690;
            float _692;
            float _694;
            do
            {
                int _542 = _538;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _544 = uint(int(uint(_536) >> uint(2)));
                float _546 = as_type<float>(_39[int(_544)]);
                int _548 = _536 + 4;
                uint _550 = uint(int(uint(_548) >> uint(2)));
                float _552 = as_type<float>(_39[int(_550)]);
                int _554 = _536 + 8;
                uint _556 = uint(int(uint(_554) >> uint(2)));
                float _558 = as_type<float>(_39[int(_556)]);
                int _560 = _536 + 12;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                float _564 = as_type<float>(_39[int(_562)]);
                int _566 = _542 + 1;
                int _568 = _536 + 16;
                uint _570 = uint(int(uint(_568) >> uint(2)));
                float _572 = as_type<float>(_39[int(_570)]);
                int _574 = _536 + 20;
                uint _576 = uint(int(uint(_574) >> uint(2)));
                float _578 = as_type<float>(_39[int(_576)]);
                int _580 = _536 + 24;
                uint _582 = uint(int(uint(_580) >> uint(2)));
                float _584 = as_type<float>(_39[int(_582)]);
                int _586 = _536 + 28;
                uint _588 = uint(int(uint(_586) >> uint(2)));
                float _590 = as_type<float>(_39[int(_588)]);
                bool _592 = uint(_566) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _594 = _536 + 32;
                uint _596 = uint(int(uint(_594) >> uint(2)));
                float _598 = as_type<float>(_39[int(_596)]);
                int _600 = _536 + 36;
                uint _602 = uint(int(uint(_600) >> uint(2)));
                float _604 = as_type<float>(_39[int(_602)]);
                int _606 = _536 + 40;
                uint _608 = uint(int(uint(_606) >> uint(2)));
                float _610 = as_type<float>(_39[int(_608)]);
                int _612 = _536 + 44;
                uint _614 = uint(int(uint(_612) >> uint(2)));
                float _616 = as_type<float>(_39[int(_614)]);
                float _618 = _344 * _552;
                float _620 = _322 * _552;
                float _622 = _340 * _552;
                float _624 = _352 * _552;
                float _626 = fma(_342, _546, _618);
                float _628 = fma(_320, _546, _620);
                float _630 = fma(_326, _546, _622);
                float _632 = fma(_350, _546, _624);
                float _634 = fma(_346, _558, _626);
                _636 = fma(_324, _558, _628);
                _638 = fma(_348, _558, _630);
                _640 = fma(_354, _558, _632);
                float _642 = _344 * _578;
                float _644 = _322 * _578;
                float _646 = _340 * _578;
                float _648 = _352 * _578;
                float _650 = fma(_342, _572, _642);
                float _652 = fma(_320, _572, _644);
                float _654 = fma(_326, _572, _646);
                float _656 = fma(_350, _572, _648);
                float _658 = fma(_346, _584, _650);
                _660 = fma(_324, _584, _652);
                _662 = fma(_348, _584, _654);
                float _664 = _322 * _604;
                _666 = _590 + _658;
                float _668 = _344 * _604;
                float _670 = _340 * _604;
                float _672 = _352 * _604;
                _674 = fma(_354, _584, _656);
                float _676 = fma(_342, _598, _668);
                float _678 = fma(_320, _598, _664);
                float _680 = fma(_326, _598, _670);
                float _682 = fma(_350, _598, _672);
                float _684 = fma(_346, _610, _676);
                _686 = fma(_324, _610, _678);
                _688 = fma(_348, _610, _680);
                _690 = _564 + _634;
                _692 = fma(_354, _610, _682);
                _694 = _616 + _684;
                int _696 = _356 + 16;
                uint _698 = uint(int(uint(_696) >> uint(2)));
                _39[int(_698)] = as_type<uint>(_660);
                int _700 = _356 + 20;
                uint _702 = uint(int(uint(_700) >> uint(2)));
                _39[int(_702)] = as_type<uint>(_662);
                int _704 = _356 + 24;
                uint _706 = uint(int(uint(_704) >> uint(2)));
                _39[int(_706)] = as_type<uint>(_674);
                int _708 = _356 + 28;
                uint _710 = uint(int(uint(_708) >> uint(2)));
                _39[int(_710)] = as_type<uint>(_666);
                uint _712 = uint(int(uint(_356) >> uint(2)));
                _39[int(_712)] = as_type<uint>(_636);
                int _714 = _356 + 4;
                uint _716 = uint(int(uint(_714) >> uint(2)));
                _39[int(_716)] = as_type<uint>(_638);
                int _718 = _356 + 8;
                uint _720 = uint(int(uint(_718) >> uint(2)));
                _39[int(_720)] = as_type<uint>(_640);
                int _722 = _356 + 12;
                uint _724 = uint(int(uint(_722) >> uint(2)));
                _39[int(_724)] = as_type<uint>(_690);
                int _726 = _356 + 32;
                uint _728 = uint(int(uint(_726) >> uint(2)));
                _39[int(_728)] = as_type<uint>(_686);
                int _730 = _356 + 36;
                uint _732 = uint(int(uint(_730) >> uint(2)));
                _39[int(_732)] = as_type<uint>(_688);
                int _734 = _356 + 40;
                uint _736 = uint(int(uint(_734) >> uint(2)));
                _39[int(_736)] = as_type<uint>(_692);
                int _738 = _356 + 44;
                uint _740 = uint(int(uint(_738) >> uint(2)));
                _39[int(_740)] = as_type<uint>(_694);
                _540 = !_592;
                _538 = _566;
            } while (_540);
            _522 = _662;
            _374 = _688;
            _508 = _638;
            _516 = _660;
            _376 = _686;
            _504 = _636;
            _378 = _674;
            _512 = _640;
            _380 = _692;
            _480 = _666;
            _476 = _690;
            _500 = _694;
            _742 = true;
        }
        else
        {
            _522 = 0.0;
            _374 = 0.0;
            _508 = 0.0;
            _516 = 0.0;
            _376 = 0.0;
            _504 = 0.0;
            _378 = 0.0;
            _512 = 0.0;
            _380 = 0.0;
            _480 = 0.0;
            _476 = 0.0;
            _500 = 0.0;
        }
    }
    _742 = false;
    float _744 = _522;
    float _746 = _374;
    float _748 = _508;
    float _750 = _516;
    float _752 = _376;
    float _754 = _504;
    float _756 = _378;
    float _758 = _512;
    float _760 = _380;
    float _762 = _480;
    float _764 = _476;
    float _766 = _500;
    int _768 = _450 + 80;
    uint _770 = uint(int(uint(_768) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.cp_c6)._m0[int(_772)][_774];
    int _778 = int(_770) + 1;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    int _782 = _778 & 3;
    float _784 = (*spvDescriptorSet0.cp_c6)._m0[int(_780)][_782];
    int _786 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _788 = _786 + _66;
    int _790 = _450 + 64;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    uint _794 = uint(int(uint(int(_792)) >> uint(2)));
    int _796 = int(_792) & 3;
    float _798 = (*spvDescriptorSet0.cp_c6)._m0[int(_794)][_796];
    int _800 = int(_792) + 1;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    int _804 = _800 & 3;
    float _806 = (*spvDescriptorSet0.cp_c6)._m0[int(_802)][_804];
    int _808 = _788 * 48;
    int _810 = _450 + 88;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    uint _814 = uint(int(uint(int(_812)) >> uint(2)));
    int _816 = int(_812) & 3;
    float _818 = (*spvDescriptorSet0.cp_c6)._m0[int(_814)][_816];
    int _820 = int(_812) + 1;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    int _824 = _820 & 3;
    float _826 = (*spvDescriptorSet0.cp_c6)._m0[int(_822)][_824];
    int _828 = _450 + 72;
    uint _830 = uint(int(uint(_828) >> uint(2)));
    uint _832 = uint(int(uint(int(_830)) >> uint(2)));
    int _834 = int(_830) & 3;
    float _836 = (*spvDescriptorSet0.cp_c6)._m0[int(_832)][_834];
    int _838 = int(_830) + 1;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    int _842 = _838 & 3;
    float _844 = (*spvDescriptorSet0.cp_c6)._m0[int(_840)][_842];
    int _846 = _450 + 104;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.cp_c6)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.cp_c6)._m0[int(_858)][_860];
    int _864 = _450 + 96;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.cp_c6)._m0[int(_868)][_870];
    int _874 = int(_866) + 1;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    int _878 = _874 & 3;
    float _880 = (*spvDescriptorSet0.cp_c6)._m0[int(_876)][_878];
    float _882 = _744 * _776;
    float _884 = _746 * _776;
    float _886 = _746 * _784;
    int _888 = _450 + 16;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.cp_c6)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.cp_c6)._m0[int(_900)][_902];
    float _906 = _748 * _776;
    float _908 = fma(_750, _798, _882);
    float _910 = _748 * _784;
    float _912 = fma(_752, _798, _884);
    int _914 = _450 + 32;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.cp_c6)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.cp_c6)._m0[int(_926)][_928];
    float _932 = _744 * _784;
    float _934 = fma(_754, _806, _910);
    float _936 = fma(_752, _806, _886);
    float _938 = fma(_754, _798, _906);
    float _940 = _748 * _818;
    float _942 = _748 * _826;
    float _944 = _744 * _818;
    int _946 = _450 + 48;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    uint _950 = uint(int(uint(int(_948)) >> uint(2)));
    int _952 = int(_948) & 3;
    float _954 = (*spvDescriptorSet0.cp_c6)._m0[int(_950)][_952];
    int _956 = int(_948) + 1;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    int _960 = _956 & 3;
    float _962 = (*spvDescriptorSet0.cp_c6)._m0[int(_958)][_960];
    float _964 = _746 * _818;
    float _966 = _744 * _826;
    float _968 = _746 * _826;
    float _970 = fma(_750, _806, _932);
    float _972 = fma(_754, _836, _940);
    float _974 = fma(_754, _844, _942);
    float _976 = fma(_750, _836, _944);
    int _978 = _450 + 24;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    uint _982 = uint(int(uint(int(_980)) >> uint(2)));
    int _984 = int(_980) & 3;
    float _986 = (*spvDescriptorSet0.cp_c6)._m0[int(_982)][_984];
    int _988 = int(_980) + 1;
    uint _990 = uint(int(uint(_988) >> uint(2)));
    int _992 = _988 & 3;
    float _994 = (*spvDescriptorSet0.cp_c6)._m0[int(_990)][_992];
    float _996 = fma(_750, _844, _966);
    float _998 = fma(_752, _836, _964);
    float _1000 = fma(_752, _844, _968);
    float _1002 = fma(_756, _862, _996);
    float _1004 = fma(_758, _862, _974);
    float _1006 = fma(_760, _862, _1000);
    int _1008 = _450 + 40;
    uint _1010 = uint(int(uint(_1008) >> uint(2)));
    uint _1012 = uint(int(uint(int(_1010)) >> uint(2)));
    int _1014 = int(_1010) & 3;
    float _1016 = (*spvDescriptorSet0.cp_c6)._m0[int(_1012)][_1014];
    int _1018 = int(_1010) + 1;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    int _1022 = _1018 & 3;
    float _1024 = (*spvDescriptorSet0.cp_c6)._m0[int(_1020)][_1022];
    float _1026 = _1002 + _762;
    float _1028 = fma(_756, _854, _976);
    float _1030 = fma(_758, _854, _972);
    float _1032 = _1004 + _764;
    float _1034 = fma(_758, _880, _934);
    float _1036 = fma(_756, _872, _908);
    float _1038 = fma(_756, _880, _970);
    int _1040 = _450 + 56;
    uint _1042 = uint(int(uint(_1040) >> uint(2)));
    uint _1044 = uint(int(uint(int(_1042)) >> uint(2)));
    int _1046 = int(_1042) & 3;
    float _1048 = (*spvDescriptorSet0.cp_c6)._m0[int(_1044)][_1046];
    int _1050 = int(_1042) + 1;
    uint _1052 = uint(int(uint(_1050) >> uint(2)));
    int _1054 = _1050 & 3;
    float _1056 = (*spvDescriptorSet0.cp_c6)._m0[int(_1052)][_1054];
    float _1058 = fma(_758, _872, _938);
    float _1060 = _1006 + _766;
    float _1062 = fma(_760, _880, _936);
    float _1064 = fma(_760, _872, _912);
    float _1066 = fma(_760, _854, _998);
    float _1068 = _1036 * _904;
    float _1070 = _1038 * _904;
    float _1072 = _1026 * _904;
    float _1074 = _1028 * _904;
    float _1076 = fma(_1058, _896, _1068);
    float _1078 = fma(_1034, _896, _1070);
    float _1080 = fma(_1032, _896, _1072);
    float _1082 = fma(_1030, _896, _1074);
    float _1084 = _1036 * _930;
    float _1086 = _1038 * _930;
    float _1088 = _1026 * _930;
    float _1090 = _1028 * _930;
    float _1092 = fma(_1058, _922, _1084);
    float _1094 = fma(_1034, _922, _1086);
    float _1096 = fma(_1032, _922, _1088);
    float _1098 = fma(_1030, _922, _1090);
    float _1100 = _1036 * _962;
    float _1102 = _1038 * _962;
    float _1104 = _1028 * _962;
    float _1106 = _1026 * _962;
    float _1108 = fma(_1058, _954, _1100);
    float _1110 = fma(_1034, _954, _1102);
    float _1112 = fma(_1030, _954, _1104);
    float _1114 = fma(_1032, _954, _1106);
    float _1116 = fma(_1060, _986, _1080);
    float _1118 = fma(_1064, _986, _1076);
    float _1120 = fma(_1062, _986, _1078);
    float _1122 = fma(_1066, _986, _1082);
    float _1124 = _1116 + _994;
    float _1126 = fma(_1060, _1016, _1096);
    float _1128 = fma(_1064, _1016, _1092);
    float _1130 = fma(_1062, _1016, _1094);
    float _1132 = fma(_1066, _1016, _1098);
    float _1134 = _1126 + _1024;
    float _1136 = fma(_1060, _1048, _1114);
    float _1138 = fma(_1062, _1048, _1110);
    int _1140 = _808 + 16;
    float _1142 = fma(_1064, _1048, _1108);
    int _1144 = _808 + 32;
    float _1146 = fma(_1066, _1048, _1112);
    float _1148 = _1136 + _1056;
    int _1150 = _808 + 48;
    uint _1152 = uint(int(uint(_1140) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1152)] = as_type<uint>(_1118);
    int _1154 = _1140 + 4;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1156)] = as_type<uint>(_1120);
    int _1158 = _1140 + 8;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1160)] = as_type<uint>(_1122);
    int _1162 = _1140 + 12;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1164)] = as_type<uint>(_1124);
    uint _1166 = uint(int(uint(_1144) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1166)] = as_type<uint>(_1128);
    int _1168 = _1144 + 4;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1170)] = as_type<uint>(_1130);
    int _1172 = _1144 + 8;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1174)] = as_type<uint>(_1132);
    int _1176 = _1144 + 12;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1178)] = as_type<uint>(_1134);
    uint _1180 = uint(int(uint(_1150) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1180)] = as_type<uint>(_1142);
    int _1182 = _1150 + 4;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1184)] = as_type<uint>(_1138);
    int _1186 = _1150 + 8;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1188)] = as_type<uint>(_1146);
    int _1190 = _1150 + 12;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1192)] = as_type<uint>(_1148);
}

