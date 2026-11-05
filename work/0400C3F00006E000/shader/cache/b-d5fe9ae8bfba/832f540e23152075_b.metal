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
int _56(thread const int& _3154, thread const int& _3155, constant _10& support_buffer)
{
    int _3158 = 1 + _3155;
    float _3160 = support_buffer._m5[_3158].x;
    bool _3162 = _3160 == 1.0;
    if (_3162)
    {
        return _3154;
    }
    float _3164 = float(_3154);
    float _3166 = _3164 * _3160;
    int _3168 = int(_3166);
    return _3168;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _728 = false;
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
    float _117 = as_type<float>(_99);
    if (_113)
    {
        uint _119 = uint(int(uint(_99) >> uint(2)));
        uint _121 = uint(int(uint(int(_119)) >> uint(2)));
        int _123 = int(_119) & 3;
        float _125 = (*spvDescriptorSet0.cp_c5)._m0[int(_121)][_123];
        _115 = as_type<int>(_125);
    }
    int _127 = _115;
    float _129 = 0.0;
    float _131 = 0.0;
    if (!_113)
    {
        _129 = 0.0;
        _131 = 0.0;
    }
    float _133 = _129;
    float _135 = _131;
    float _137 = 0.0;
    if (!_113)
    {
        _137 = 0.0;
    }
    float _139 = _137;
    float _141 = 0.0;
    int _143 = 0;
    if (!_113)
    {
        _141 = 0.0;
        _143 = 0;
    }
    float _145 = _141;
    int _147 = _143;
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
    float _173 = _133;
    float _175 = _135;
    float _177 = _139;
    float _179 = _109;
    if (_113)
    {
        int _181 = _66;
        int _183 = 0;
        int _185 = _56(_181, _183, (*spvDescriptorSet0.support_buffer));
        int _187 = _127;
        int _189 = 0;
        int _191 = _56(_187, _189, (*spvDescriptorSet0.support_buffer));
        int3 _1354 = int3(_185, _191, as_type<int>(_151));
        float4 _194 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1354.xy), uint(_1354.z), 0).xyzw;
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
        int _224 = _127;
        int _226 = 0;
        int _228 = _56(_224, _226, (*spvDescriptorSet0.support_buffer));
        int3 _1387 = int3(_222, _228, 0);
        float3 _232 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1387.xy), uint(_1387.z), 0).xyz;
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
    int _250 = _147;
    if (_113)
    {
        int _252 = _66;
        int _254 = 0;
        int _256 = _56(_252, _254, (*spvDescriptorSet0.support_buffer));
        int _258 = _127;
        int _260 = 0;
        int _262 = _56(_258, _260, (*spvDescriptorSet0.support_buffer));
        int3 _1418 = int3(_256, _262, as_type<int>(_171));
        float3 _264 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1418.xy), uint(_1418.z), 0).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        _246 = as_type<int>(_266);
        _248 = as_type<int>(_268);
        _250 = as_type<int>(_270);
    }
    int _272 = _246;
    int _274 = _248;
    int _276 = _250;
    if (!_113)
    {
        _117 = 0.0;
    }
    float _278 = _117;
    int _280 = _66 * 112;
    bool _282 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _284 = _66 * 48;
    uint _286 = 0u;
    float _288 = _278;
    float _290 = 2.0;
    if (!_282)
    {
        int _292 = _284 + 32;
        _286 = uint(_292);
    }
    uint _294 = _286;
    if (_113)
    {
        float _296 = _210 * 2.0;
        _288 = _296;
    }
    float _298 = _288;
    float _300 = _204 * _204;
    float _302 = _206 * _206;
    float _304 = _204 * 2.0;
    float _306 = _204 * _298;
    float _308 = fma(_300, -2.0, 1.0);
    float _310 = _208 * _298;
    float _312 = _208 * _208;
    float _314 = fma(_302, -2.0, 1.0);
    float _316 = _206 * _298;
    float _318 = -_310;
    float _320 = fma(_304, _206, _318);
    float _322 = fma(_304, _206, _310);
    float _324 = _206 * 2.0;
    float _326 = fma(_304, _208, _316);
    float _328 = fma(_312, -2.0, _314);
    float _330 = -_316;
    float _332 = fma(_304, _208, _330);
    float _334 = fma(_312, -2.0, _308);
    float _336 = -_306;
    float _338 = fma(_324, _208, _336);
    float _340 = fma(_324, _208, _306);
    float _342 = fma(_302, -2.0, _308);
    float _344 = _332 * _240;
    float _346 = _334 * _242;
    float _348 = _328 * _240;
    float _350 = _322 * _240;
    int _352 = 0;
    uint _354 = as_type<uint>(_338);
    float _356 = _320;
    float _358 = _328;
    float _360 = _340;
    float _362 = _342;
    float _364 = _322;
    float _366 = _346;
    float _368 = _350;
    float _370 = _344;
    if (!_282)
    {
        _352 = _272;
    }
    int _372 = _352;
    float _374 = _320 * _242;
    float _376 = _326 * _244;
    float _378 = _338 * _244;
    float _380 = _340 * _242;
    float _382 = _342 * _244;
    float _384 = _380;
    float _386 = _378;
    float _388 = _382;
    if (!_282)
    {
        uint _390 = uint(int(uint(_284) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_390)] = as_type<uint>(_348);
        int _392 = _284 + 4;
        uint _394 = uint(int(uint(_392) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_394)] = as_type<uint>(_374);
        int _396 = _284 + 8;
        uint _398 = uint(int(uint(_396) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_398)] = as_type<uint>(_376);
        int _400 = _284 + 12;
        uint _402 = uint(int(uint(_400) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_402)] = uint(_372);
    }
    int _404 = _284 + 32;
    uint _406 = uint(int(uint(_404) >> uint(2)));
    _39[int(_406)] = as_type<uint>(_344);
    int _408 = _284 + 36;
    uint _410 = uint(int(uint(_408) >> uint(2)));
    _39[int(_410)] = as_type<uint>(_380);
    int _412 = _284 + 40;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    _39[int(_414)] = as_type<uint>(_382);
    int _416 = _284 + 44;
    uint _418 = uint(int(uint(_416) >> uint(2)));
    _39[int(_418)] = uint(_276);
    bool _420 = _66 != 0;
    if (!_282)
    {
        int _422 = _284 + 16;
        _354 = uint(_422);
    }
    uint _424 = _354;
    int _426 = _284 + 16;
    uint _428 = uint(int(uint(_426) >> uint(2)));
    _39[int(_428)] = as_type<uint>(_350);
    int _430 = _284 + 20;
    uint _432 = uint(int(uint(_430) >> uint(2)));
    _39[int(_432)] = as_type<uint>(_346);
    int _434 = _284 + 24;
    uint _436 = uint(int(uint(_434) >> uint(2)));
    _39[int(_436)] = as_type<uint>(_378);
    int _438 = _284 + 28;
    uint _440 = uint(int(uint(_438) >> uint(2)));
    _39[int(_440)] = uint(_274);
    if (!_282)
    {
        uint _442 = uint(int(uint(int(_424)) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_442)] = as_type<uint>(_350);
        int _444 = int(_424) + 4;
        uint _446 = uint(int(uint(_444) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_446)] = as_type<uint>(_346);
        int _448 = int(_424) + 8;
        uint _450 = uint(int(uint(_448) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_450)] = as_type<uint>(_378);
        int _452 = int(_424) + 12;
        uint _454 = uint(int(uint(_452) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_454)] = uint(_274);
    }
    if (!_420)
    {
        _356 = as_type<float>(_272);
    }
    float _456 = _356;
    uint _458 = uint(int(uint(_284) >> uint(2)));
    _39[int(_458)] = as_type<uint>(_348);
    int _460 = _284 + 4;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    _39[int(_462)] = as_type<uint>(_374);
    int _464 = _284 + 8;
    uint _466 = uint(int(uint(_464) >> uint(2)));
    _39[int(_466)] = as_type<uint>(_376);
    int _468 = _284 + 12;
    uint _470 = uint(int(uint(_468) >> uint(2)));
    _39[int(_470)] = uint(_272);
    float _472 = _456;
    if (!_420)
    {
        _358 = as_type<float>(_274);
    }
    float _474 = _358;
    float _476 = _474;
    if (!_420)
    {
        _360 = as_type<float>(_276);
    }
    float _478 = _360;
    float _480 = _478;
    if (!_282)
    {
        uint _482 = uint(int(uint(int(_294)) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_482)] = as_type<uint>(_344);
        int _484 = int(_294) + 4;
        uint _486 = uint(int(uint(_484) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_486)] = as_type<uint>(_380);
        int _488 = int(_294) + 8;
        uint _490 = uint(int(uint(_488) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_490)] = as_type<uint>(_382);
        int _492 = int(_294) + 12;
        uint _494 = uint(int(uint(_492) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_494)] = uint(_276);
    }
    if (!_420)
    {
        _362 = _348;
    }
    float _496 = _362;
    float _498 = _496;
    if (!_420)
    {
        _290 = _374;
    }
    float _500 = _290;
    float _502 = _500;
    if (!_420)
    {
        _364 = _376;
    }
    float _504 = _364;
    bool _506 = !_420;
    float _508 = _504;
    if (!_506)
    {
        bool _510 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _512 = !_510;
        if (!_512)
        {
            uint _514 = uint(int(uint(_280) >> uint(2)));
            uint _516 = uint(int(uint(int(_514)) >> uint(2)));
            int _518 = int(_514) & 3;
            float _520 = (*spvDescriptorSet0.cp_c6)._m0[int(_516)][_518];
            int _522 = as_type<int>(_520) * 48;
            int _524 = 0;
            bool _526;
            float _622;
            float _624;
            float _626;
            float _628;
            float _650;
            float _652;
            float _662;
            float _672;
            float _674;
            float _676;
            float _678;
            float _680;
            do
            {
                int _528 = _524;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _530 = uint(int(uint(_522) >> uint(2)));
                float _532 = as_type<float>(_39[int(_530)]);
                int _534 = _522 + 4;
                uint _536 = uint(int(uint(_534) >> uint(2)));
                float _538 = as_type<float>(_39[int(_536)]);
                int _540 = _522 + 8;
                uint _542 = uint(int(uint(_540) >> uint(2)));
                float _544 = as_type<float>(_39[int(_542)]);
                int _546 = _522 + 12;
                uint _548 = uint(int(uint(_546) >> uint(2)));
                float _550 = as_type<float>(_39[int(_548)]);
                int _552 = _528 + 1;
                int _554 = _522 + 16;
                uint _556 = uint(int(uint(_554) >> uint(2)));
                float _558 = as_type<float>(_39[int(_556)]);
                int _560 = _522 + 20;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                float _564 = as_type<float>(_39[int(_562)]);
                int _566 = _522 + 24;
                uint _568 = uint(int(uint(_566) >> uint(2)));
                float _570 = as_type<float>(_39[int(_568)]);
                int _572 = _522 + 28;
                uint _574 = uint(int(uint(_572) >> uint(2)));
                float _576 = as_type<float>(_39[int(_574)]);
                bool _578 = uint(_552) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _580 = _522 + 32;
                uint _582 = uint(int(uint(_580) >> uint(2)));
                float _584 = as_type<float>(_39[int(_582)]);
                int _586 = _522 + 36;
                uint _588 = uint(int(uint(_586) >> uint(2)));
                float _590 = as_type<float>(_39[int(_588)]);
                int _592 = _522 + 40;
                uint _594 = uint(int(uint(_592) >> uint(2)));
                float _596 = as_type<float>(_39[int(_594)]);
                int _598 = _522 + 44;
                uint _600 = uint(int(uint(_598) >> uint(2)));
                float _602 = as_type<float>(_39[int(_600)]);
                float _604 = _538 * as_type<float>(_274);
                float _606 = _350 * _538;
                float _608 = _346 * _538;
                float _610 = _378 * _538;
                float _612 = fma(_532, as_type<float>(_272), _604);
                float _614 = fma(_348, _532, _606);
                float _616 = fma(_374, _532, _608);
                float _618 = fma(_376, _532, _610);
                float _620 = fma(_544, as_type<float>(_276), _612);
                _622 = fma(_344, _544, _614);
                _624 = fma(_380, _544, _616);
                _626 = fma(_382, _544, _618);
                _628 = _550 + _620;
                float _630 = _564 * as_type<float>(_274);
                float _632 = _350 * _564;
                float _634 = _346 * _564;
                float _636 = _378 * _564;
                float _638 = fma(_558, as_type<float>(_272), _630);
                float _640 = fma(_348, _558, _632);
                float _642 = fma(_374, _558, _634);
                float _644 = fma(_376, _558, _636);
                float _646 = fma(_570, as_type<float>(_276), _638);
                float _648 = _590 * as_type<float>(_274);
                _650 = fma(_344, _570, _640);
                _652 = fma(_380, _570, _642);
                float _654 = _350 * _590;
                float _656 = _346 * _590;
                float _658 = _378 * _590;
                float _660 = fma(_584, as_type<float>(_272), _648);
                _662 = _576 + _646;
                float _664 = fma(_348, _584, _654);
                float _666 = fma(_374, _584, _656);
                float _668 = fma(_376, _584, _658);
                float _670 = fma(_596, as_type<float>(_276), _660);
                _672 = fma(_382, _570, _644);
                _674 = fma(_344, _596, _664);
                _676 = fma(_380, _596, _666);
                _678 = fma(_382, _596, _668);
                _680 = _602 + _670;
                uint _682 = uint(int(uint(_284) >> uint(2)));
                _39[int(_682)] = as_type<uint>(_622);
                int _684 = _284 + 4;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                _39[int(_686)] = as_type<uint>(_624);
                int _688 = _284 + 8;
                uint _690 = uint(int(uint(_688) >> uint(2)));
                _39[int(_690)] = as_type<uint>(_626);
                int _692 = _284 + 12;
                uint _694 = uint(int(uint(_692) >> uint(2)));
                _39[int(_694)] = as_type<uint>(_628);
                int _696 = _284 + 16;
                uint _698 = uint(int(uint(_696) >> uint(2)));
                _39[int(_698)] = as_type<uint>(_650);
                int _700 = _284 + 20;
                uint _702 = uint(int(uint(_700) >> uint(2)));
                _39[int(_702)] = as_type<uint>(_652);
                int _704 = _284 + 24;
                uint _706 = uint(int(uint(_704) >> uint(2)));
                _39[int(_706)] = as_type<uint>(_672);
                int _708 = _284 + 28;
                uint _710 = uint(int(uint(_708) >> uint(2)));
                _39[int(_710)] = as_type<uint>(_662);
                int _712 = _284 + 32;
                uint _714 = uint(int(uint(_712) >> uint(2)));
                _39[int(_714)] = as_type<uint>(_674);
                int _716 = _284 + 36;
                uint _718 = uint(int(uint(_716) >> uint(2)));
                _39[int(_718)] = as_type<uint>(_676);
                int _720 = _284 + 40;
                uint _722 = uint(int(uint(_720) >> uint(2)));
                _39[int(_722)] = as_type<uint>(_678);
                int _724 = _284 + 44;
                uint _726 = uint(int(uint(_724) >> uint(2)));
                _39[int(_726)] = as_type<uint>(_680);
                _526 = !_578;
                _524 = _552;
            } while (_526);
            _366 = _652;
            _384 = _676;
            _502 = _624;
            _368 = _650;
            _370 = _674;
            _498 = _622;
            _508 = _626;
            _386 = _672;
            _388 = _678;
            _476 = _662;
            _472 = _628;
            _480 = _680;
            _728 = true;
        }
        else
        {
            _366 = 0.0;
            _384 = 0.0;
            _502 = 0.0;
            _368 = 0.0;
            _370 = 0.0;
            _498 = 0.0;
            _508 = 0.0;
            _386 = 0.0;
            _388 = 0.0;
            _476 = 0.0;
            _472 = 0.0;
            _480 = 0.0;
        }
    }
    _728 = false;
    float _730 = _366;
    float _732 = _384;
    float _734 = _502;
    float _736 = _368;
    float _738 = _370;
    float _740 = _498;
    float _742 = _508;
    float _744 = _386;
    float _746 = _388;
    float _748 = _476;
    float _750 = _472;
    float _752 = _480;
    int _754 = _280 + 80;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    uint _758 = uint(int(uint(int(_756)) >> uint(2)));
    int _760 = int(_756) & 3;
    float _762 = (*spvDescriptorSet0.cp_c6)._m0[int(_758)][_760];
    int _764 = int(_756) + 1;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    int _768 = _764 & 3;
    float _770 = (*spvDescriptorSet0.cp_c6)._m0[int(_766)][_768];
    int _772 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _774 = _772 + _66;
    int _776 = _280 + 64;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    uint _780 = uint(int(uint(int(_778)) >> uint(2)));
    int _782 = int(_778) & 3;
    float _784 = (*spvDescriptorSet0.cp_c6)._m0[int(_780)][_782];
    int _786 = int(_778) + 1;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    int _790 = _786 & 3;
    float _792 = (*spvDescriptorSet0.cp_c6)._m0[int(_788)][_790];
    int _794 = _774 * 48;
    int _796 = _280 + 88;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    uint _800 = uint(int(uint(int(_798)) >> uint(2)));
    int _802 = int(_798) & 3;
    float _804 = (*spvDescriptorSet0.cp_c6)._m0[int(_800)][_802];
    int _806 = int(_798) + 1;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    int _810 = _806 & 3;
    float _812 = (*spvDescriptorSet0.cp_c6)._m0[int(_808)][_810];
    int _814 = _280 + 72;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    uint _818 = uint(int(uint(int(_816)) >> uint(2)));
    int _820 = int(_816) & 3;
    float _822 = (*spvDescriptorSet0.cp_c6)._m0[int(_818)][_820];
    int _824 = int(_816) + 1;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    int _828 = _824 & 3;
    float _830 = (*spvDescriptorSet0.cp_c6)._m0[int(_826)][_828];
    int _832 = _280 + 96;
    uint _834 = uint(int(uint(_832) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.cp_c6)._m0[int(_836)][_838];
    int _842 = int(_834) + 1;
    uint _844 = uint(int(uint(_842) >> uint(2)));
    int _846 = _842 & 3;
    float _848 = (*spvDescriptorSet0.cp_c6)._m0[int(_844)][_846];
    int _850 = _280 + 104;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    uint _854 = uint(int(uint(int(_852)) >> uint(2)));
    int _856 = int(_852) & 3;
    float _858 = (*spvDescriptorSet0.cp_c6)._m0[int(_854)][_856];
    int _860 = int(_852) + 1;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    int _864 = _860 & 3;
    float _866 = (*spvDescriptorSet0.cp_c6)._m0[int(_862)][_864];
    float _868 = _730 * _762;
    float _870 = _732 * _762;
    int _872 = _280 + 16;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    uint _876 = uint(int(uint(int(_874)) >> uint(2)));
    int _878 = int(_874) & 3;
    float _880 = (*spvDescriptorSet0.cp_c6)._m0[int(_876)][_878];
    int _882 = int(_874) + 1;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    int _886 = _882 & 3;
    float _888 = (*spvDescriptorSet0.cp_c6)._m0[int(_884)][_886];
    float _890 = _732 * _770;
    float _892 = _734 * _762;
    float _894 = _734 * _770;
    float _896 = fma(_736, _784, _868);
    float _898 = _730 * _770;
    int _900 = _280 + 32;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    uint _904 = uint(int(uint(int(_902)) >> uint(2)));
    int _906 = int(_902) & 3;
    float _908 = (*spvDescriptorSet0.cp_c6)._m0[int(_904)][_906];
    int _910 = int(_902) + 1;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    int _914 = _910 & 3;
    float _916 = (*spvDescriptorSet0.cp_c6)._m0[int(_912)][_914];
    float _918 = fma(_738, _784, _870);
    float _920 = fma(_738, _792, _890);
    float _922 = fma(_736, _792, _898);
    float _924 = fma(_740, _784, _892);
    float _926 = fma(_740, _792, _894);
    float _928 = _734 * _804;
    float _930 = _734 * _812;
    int _932 = _280 + 48;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    uint _936 = uint(int(uint(int(_934)) >> uint(2)));
    int _938 = int(_934) & 3;
    float _940 = (*spvDescriptorSet0.cp_c6)._m0[int(_936)][_938];
    int _942 = int(_934) + 1;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    int _946 = _942 & 3;
    float _948 = (*spvDescriptorSet0.cp_c6)._m0[int(_944)][_946];
    float _950 = _730 * _804;
    float _952 = _730 * _812;
    float _954 = _732 * _804;
    float _956 = _732 * _812;
    float _958 = fma(_740, _822, _928);
    float _960 = fma(_740, _830, _930);
    int _962 = _280 + 24;
    uint _964 = uint(int(uint(_962) >> uint(2)));
    uint _966 = uint(int(uint(int(_964)) >> uint(2)));
    int _968 = int(_964) & 3;
    float _970 = (*spvDescriptorSet0.cp_c6)._m0[int(_966)][_968];
    int _972 = int(_964) + 1;
    uint _974 = uint(int(uint(_972) >> uint(2)));
    int _976 = _972 & 3;
    float _978 = (*spvDescriptorSet0.cp_c6)._m0[int(_974)][_976];
    float _980 = fma(_736, _822, _950);
    float _982 = fma(_736, _830, _952);
    float _984 = fma(_738, _822, _954);
    float _986 = fma(_738, _830, _956);
    float _988 = fma(_742, _840, _924);
    float _990 = fma(_744, _840, _896);
    int _992 = _280 + 40;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    uint _996 = uint(int(uint(int(_994)) >> uint(2)));
    int _998 = int(_994) & 3;
    float _1000 = (*spvDescriptorSet0.cp_c6)._m0[int(_996)][_998];
    int _1002 = int(_994) + 1;
    uint _1004 = uint(int(uint(_1002) >> uint(2)));
    int _1006 = _1002 & 3;
    float _1008 = (*spvDescriptorSet0.cp_c6)._m0[int(_1004)][_1006];
    float _1010 = fma(_742, _848, _926);
    float _1012 = fma(_744, _848, _922);
    float _1014 = fma(_746, _840, _918);
    float _1016 = fma(_746, _848, _920);
    float _1018 = fma(_744, _858, _980);
    float _1020 = fma(_744, _866, _982);
    int _1022 = _280 + 56;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    uint _1026 = uint(int(uint(int(_1024)) >> uint(2)));
    int _1028 = int(_1024) & 3;
    float _1030 = (*spvDescriptorSet0.cp_c6)._m0[int(_1026)][_1028];
    int _1032 = int(_1024) + 1;
    uint _1034 = uint(int(uint(_1032) >> uint(2)));
    int _1036 = _1032 & 3;
    float _1038 = (*spvDescriptorSet0.cp_c6)._m0[int(_1034)][_1036];
    float _1040 = fma(_742, _858, _958);
    float _1042 = fma(_742, _866, _960);
    float _1044 = _1020 + _748;
    float _1046 = fma(_746, _866, _986);
    float _1048 = fma(_746, _858, _984);
    float _1050 = _1042 + _750;
    int _1052 = _794 + 32;
    float _1054 = _1044 * _888;
    float _1056 = _1046 + _752;
    float _1058 = _1018 * _888;
    float _1060 = _990 * _888;
    float _1062 = _1012 * _888;
    float _1064 = fma(_1050, _880, _1054);
    float _1066 = fma(_1040, _880, _1058);
    float _1068 = fma(_988, _880, _1060);
    float _1070 = _1044 * _916;
    float _1072 = _1012 * _916;
    float _1074 = _990 * _916;
    float _1076 = _1018 * _916;
    float _1078 = fma(_1050, _908, _1070);
    float _1080 = fma(_1010, _880, _1062);
    float _1082 = fma(_988, _908, _1074);
    float _1084 = fma(_1010, _908, _1072);
    float _1086 = _1044 * _948;
    float _1088 = _1012 * _948;
    float _1090 = _990 * _948;
    float _1092 = _1018 * _948;
    float _1094 = fma(_1050, _940, _1086);
    float _1096 = fma(_1040, _908, _1076);
    float _1098 = fma(_1010, _940, _1088);
    float _1100 = fma(_988, _940, _1090);
    float _1102 = fma(_1056, _970, _1064);
    float _1104 = fma(_1040, _940, _1092);
    float _1106 = fma(_1048, _970, _1066);
    float _1108 = fma(_1014, _970, _1068);
    float _1110 = fma(_1016, _970, _1080);
    float _1112 = _1102 + _978;
    int _1114 = _794 + 16;
    float _1116 = fma(_1056, _1000, _1078);
    float _1118 = fma(_1014, _1000, _1082);
    float _1120 = fma(_1016, _1000, _1084);
    float _1122 = fma(_1048, _1000, _1096);
    float _1124 = _1116 + _1008;
    int _1126 = _794 + 48;
    uint _1128 = uint(int(uint(_1114) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1128)] = as_type<uint>(_1108);
    int _1130 = _1114 + 4;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1132)] = as_type<uint>(_1110);
    int _1134 = _1114 + 8;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1136)] = as_type<uint>(_1106);
    int _1138 = _1114 + 12;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1140)] = as_type<uint>(_1112);
    float _1142 = fma(_1056, _1030, _1094);
    float _1144 = fma(_1016, _1030, _1098);
    float _1146 = fma(_1014, _1030, _1100);
    float _1148 = fma(_1048, _1030, _1104);
    float _1150 = _1142 + _1038;
    uint _1152 = uint(int(uint(_1052) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1152)] = as_type<uint>(_1118);
    int _1154 = _1052 + 4;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1156)] = as_type<uint>(_1120);
    int _1158 = _1052 + 8;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1160)] = as_type<uint>(_1122);
    int _1162 = _1052 + 12;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1164)] = as_type<uint>(_1124);
    uint _1166 = uint(int(uint(_1126) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1166)] = as_type<uint>(_1146);
    int _1168 = _1126 + 4;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1170)] = as_type<uint>(_1144);
    int _1172 = _1126 + 8;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1174)] = as_type<uint>(_1148);
    int _1176 = _1126 + 12;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1178)] = as_type<uint>(_1150);
}

