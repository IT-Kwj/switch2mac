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
int _54(thread const int& _3398, thread const int& _3399, constant _10& support_buffer)
{
    int _3402 = 1 + _3399;
    float _3404 = support_buffer._m5[_3402].x;
    bool _3406 = _3404 == 1.0;
    if (_3406)
    {
        return _3398;
    }
    float _3408 = float(_3398);
    float _3410 = _3408 * _3404;
    int _3412 = int(_3410);
    return _3412;
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
        int _93 = 0;
        float _95 = 0.0;
        float _97 = 0.0;
        float _99 = 0.0;
        float _101 = 0.0;
        float _103 = 0.0;
        float _105 = 0.0;
        int _107 = 0;
        int _109 = 0;
        int _111 = 0;
        float _113 = 0.0;
        bool _115;
        do
        {
            int _117 = _91;
            int _119 = _93;
            float _121 = _95;
            float _123 = _97;
            int _125 = as_type<int>(_99);
            int _127 = as_type<int>(_101);
            int _129 = as_type<int>(_103);
            int _131 = as_type<int>(_105);
            int _133 = _107;
            int _135 = _109;
            int _137 = _111;
            float _139 = _113;
            int _141 = _89 + 32;
            uint _143 = uint(int(uint(_141) >> uint(2)));
            uint _145 = uint(int(uint(int(_143)) >> uint(2)));
            int _147 = int(_143) & 3;
            float _149 = (*spvDescriptorSet0.cp_c5)._m0[int(_145)][_147];
            int _151 = _117 & 31;
            bool _153 = _151 == 0;
            bool _155 = uint(_151) < 32u;
            int _157 = 32 - _151;
            int _159 = _151 - 32;
            int _161 = 1 << _151;
            uint _163 = uint(int(uint(0) >> uint(_157)));
            int _165 = _161 | int(_163);
            int _167 = _153 ? 1 : _165;
            bool _169 = uint(_159) < 32u;
            int _171 = 0 << _159;
            int _173 = _169 ? _171 : 0;
            float _175 = _155 ? as_type<float>(_167) : as_type<float>(_173);
            int _177 = as_type<int>(_175) & as_type<int>(_149);
            bool _179 = _177 != 0;
            int _181 = _119;
            float _183 = _121;
            float _185 = _123;
            float _187 = _175;
            float _189 = _149;
            int _191 = _125;
            int _193 = _127;
            int _195 = _129;
            int _197 = _131;
            int _199 = _133;
            int _201 = _135;
            int _203 = _137;
            float _205 = _139;
            if (_179)
            {
                uint _207 = uint(int(uint(_89) >> uint(2)));
                uint _209 = uint(int(uint(int(_207)) >> uint(2)));
                int _211 = int(_207) & 3;
                float _213 = (*spvDescriptorSet0.cp_c5)._m0[int(_209)][_211];
                _181 = as_type<int>(_213);
            }
            int _215 = _181;
            if (!_179)
            {
                _183 = 0.0;
                _185 = 0.0;
            }
            float _217 = _183;
            float _219 = _185;
            if (!_179)
            {
                _187 = 0.0;
                _189 = 0.0;
            }
            float _221 = _187;
            float _223 = _189;
            if (_179)
            {
                _191 = 1;
            }
            int _225 = _191;
            _99 = as_type<float>(_225);
            if (!_179)
            {
                _193 = 0;
                _195 = 0;
            }
            int _227 = _193;
            int _229 = _195;
            if (!_179)
            {
                _197 = 0;
            }
            int _231 = _197;
            if (!_179)
            {
                _199 = 0;
                _201 = 0;
            }
            int _233 = _199;
            int _235 = _201;
            if (!_179)
            {
                _203 = 0;
            }
            int _237 = _203;
            if (_179)
            {
                _205 = 2.8025969286496341418474591665798e-45;
            }
            float _239 = _205;
            float _241 = _217;
            float _243 = _219;
            float _245 = _221;
            float _247 = _223;
            if (_179)
            {
                int _249 = _117;
                int _251 = 0;
                int _253 = _54(_249, _251, (*spvDescriptorSet0.support_buffer));
                int _255 = _215;
                int _257 = 0;
                int _259 = _54(_255, _257, (*spvDescriptorSet0.support_buffer));
                int3 _1532 = int3(_253, _259, _225);
                float4 _262 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1532.xy), uint(_1532.z), 0).xyzw;
                float _264 = _262.x;
                float _266 = _262.y;
                float _268 = _262.z;
                float _270 = _262.w;
                _241 = _264;
                _243 = _266;
                _245 = _268;
                _247 = _270;
            }
            float _272 = _241;
            float _274 = _243;
            float _276 = _245;
            float _278 = _247;
            int _280 = _227;
            int _282 = _229;
            int _284 = _231;
            if (_179)
            {
                int _286 = _117;
                int _288 = 0;
                int _290 = _54(_286, _288, (*spvDescriptorSet0.support_buffer));
                int _292 = _215;
                int _294 = 0;
                int _296 = _54(_292, _294, (*spvDescriptorSet0.support_buffer));
                int3 _1565 = int3(_290, _296, 0);
                float3 _300 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1565.xy), uint(_1565.z), 0).xyz;
                float _302 = _300.x;
                float _304 = _300.y;
                float _306 = _300.z;
                _280 = as_type<int>(_302);
                _282 = as_type<int>(_304);
                _284 = as_type<int>(_306);
            }
            int _308 = _280;
            int _310 = _282;
            int _312 = _284;
            int _314 = _233;
            int _316 = _235;
            int _318 = _237;
            if (_179)
            {
                int _320 = _117;
                int _322 = 0;
                int _324 = _54(_320, _322, (*spvDescriptorSet0.support_buffer));
                int _326 = _215;
                int _328 = 0;
                int _330 = _54(_326, _328, (*spvDescriptorSet0.support_buffer));
                int3 _1599 = int3(_324, _330, as_type<int>(_239));
                float3 _332 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1599.xy), uint(_1599.z), 0).xyz;
                float _334 = _332.x;
                float _336 = _332.y;
                float _338 = _332.z;
                _314 = as_type<int>(_334);
                _316 = as_type<int>(_336);
                _318 = as_type<int>(_338);
            }
            int _340 = _314;
            int _342 = _316;
            int _344 = _318;
            float _346 = _272 * _272;
            float _348 = _278 * 2.0;
            float _350 = _272 * 2.0;
            float _352 = _274 * _274;
            float _354 = fma(_346, -2.0, 1.0);
            float _356 = _348 * _276;
            float _358 = _348 * _272;
            float _360 = _348 * _274;
            float _362 = _276 * _276;
            float _364 = -_356;
            float _366 = fma(_350, _274, _364);
            float _368 = fma(_350, _274, _356);
            float _370 = _274 * 2.0;
            float _372 = fma(_352, -2.0, 1.0);
            float _374 = fma(_350, _276, _360);
            float _376 = -_360;
            float _378 = fma(_350, _276, _376);
            float _380 = -_358;
            float _382 = fma(_370, _276, _380);
            float _384 = fma(_362, -2.0, _372);
            float _386 = fma(_370, _276, _358);
            float _388 = fma(_362, -2.0, _354);
            float _390 = fma(_352, -2.0, _354);
            int _392 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _394 = _392 + _117;
            float _396 = _378 * as_type<float>(_308);
            float _398 = _384 * as_type<float>(_308);
            float _400 = _368 * as_type<float>(_308);
            float _402 = _388 * as_type<float>(_310);
            float _404 = _366 * as_type<float>(_310);
            float _406 = _386 * as_type<float>(_310);
            int _408 = _394 * 48;
            float _410 = _374 * as_type<float>(_312);
            float _412 = _382 * as_type<float>(_312);
            float _414 = _390 * as_type<float>(_312);
            int _416 = _117 + 1;
            uint _418 = uint(int(uint(_408) >> uint(2)));
            _37[int(_418)] = as_type<uint>(_398);
            int _420 = _408 + 4;
            uint _422 = uint(int(uint(_420) >> uint(2)));
            _37[int(_422)] = as_type<uint>(_404);
            int _424 = _408 + 8;
            uint _426 = uint(int(uint(_424) >> uint(2)));
            _37[int(_426)] = as_type<uint>(_410);
            int _428 = _408 + 12;
            uint _430 = uint(int(uint(_428) >> uint(2)));
            _37[int(_430)] = uint(_340);
            bool _432 = uint(_416) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _434 = _408 + 16;
            uint _436 = uint(int(uint(_434) >> uint(2)));
            _37[int(_436)] = as_type<uint>(_400);
            int _438 = _408 + 20;
            uint _440 = uint(int(uint(_438) >> uint(2)));
            _37[int(_440)] = as_type<uint>(_402);
            int _442 = _408 + 24;
            uint _444 = uint(int(uint(_442) >> uint(2)));
            _37[int(_444)] = as_type<uint>(_412);
            int _446 = _408 + 28;
            uint _448 = uint(int(uint(_446) >> uint(2)));
            _37[int(_448)] = uint(_342);
            int _450 = _408 + 32;
            uint _452 = uint(int(uint(_450) >> uint(2)));
            _37[int(_452)] = as_type<uint>(_396);
            int _454 = _408 + 36;
            uint _456 = uint(int(uint(_454) >> uint(2)));
            _37[int(_456)] = as_type<uint>(_406);
            int _458 = _408 + 40;
            uint _460 = uint(int(uint(_458) >> uint(2)));
            _37[int(_460)] = as_type<uint>(_414);
            int _462 = _408 + 44;
            uint _464 = uint(int(uint(_462) >> uint(2)));
            _37[int(_464)] = uint(_344);
            _115 = !_432;
            _91 = _416;
            _93 = as_type<int>(_366);
            _95 = as_type<float>(_408);
            _97 = _370;
            _101 = as_type<float>(_308);
            _103 = as_type<float>(_310);
            _105 = as_type<float>(_312);
            _107 = _340;
            _109 = _342;
            _111 = _344;
            _113 = _398;
        } while (_115);
    }
    bool _466 = !_72;
    if (!_466)
    {
        int _468 = 1;
        bool _470;
        do
        {
            int _472 = _468;
            int _474 = _472 * 112;
            int _476 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _478 = _476 + _472;
            int _480 = _472 + 1;
            uint _482 = uint(int(uint(_474) >> uint(2)));
            uint _484 = uint(int(uint(int(_482)) >> uint(2)));
            int _486 = int(_482) & 3;
            float _488 = (*spvDescriptorSet0.cp_c6)._m0[int(_484)][_486];
            int _490 = _478 * 48;
            bool _492 = uint(_480) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _494 = _490 + 16;
            uint _496 = uint(int(uint(_494) >> uint(2)));
            float _498 = as_type<float>(_37[int(_496)]);
            int _500 = _490 + 20;
            uint _502 = uint(int(uint(_500) >> uint(2)));
            float _504 = as_type<float>(_37[int(_502)]);
            int _506 = _490 + 24;
            uint _508 = uint(int(uint(_506) >> uint(2)));
            float _510 = as_type<float>(_37[int(_508)]);
            int _512 = _490 + 28;
            uint _514 = uint(int(uint(_512) >> uint(2)));
            float _516 = as_type<float>(_37[int(_514)]);
            uint _518 = uint(int(uint(_490) >> uint(2)));
            float _520 = as_type<float>(_37[int(_518)]);
            int _522 = _490 + 4;
            uint _524 = uint(int(uint(_522) >> uint(2)));
            float _526 = as_type<float>(_37[int(_524)]);
            int _528 = _490 + 8;
            uint _530 = uint(int(uint(_528) >> uint(2)));
            float _532 = as_type<float>(_37[int(_530)]);
            int _534 = _490 + 12;
            uint _536 = uint(int(uint(_534) >> uint(2)));
            float _538 = as_type<float>(_37[int(_536)]);
            int _540 = _490 + 32;
            uint _542 = uint(int(uint(_540) >> uint(2)));
            float _544 = as_type<float>(_37[int(_542)]);
            int _546 = _490 + 36;
            uint _548 = uint(int(uint(_546) >> uint(2)));
            float _550 = as_type<float>(_37[int(_548)]);
            int _552 = _490 + 40;
            uint _554 = uint(int(uint(_552) >> uint(2)));
            float _556 = as_type<float>(_37[int(_554)]);
            int _558 = _490 + 44;
            uint _560 = uint(int(uint(_558) >> uint(2)));
            float _562 = as_type<float>(_37[int(_560)]);
            int _564 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _566 = _564 + as_type<int>(_488);
            int _568 = _566 * 48;
            uint _570 = uint(int(uint(_568) >> uint(2)));
            float _572 = as_type<float>(_37[int(_570)]);
            int _574 = _568 + 4;
            uint _576 = uint(int(uint(_574) >> uint(2)));
            float _578 = as_type<float>(_37[int(_576)]);
            int _580 = _568 + 8;
            uint _582 = uint(int(uint(_580) >> uint(2)));
            float _584 = as_type<float>(_37[int(_582)]);
            int _586 = _568 + 12;
            uint _588 = uint(int(uint(_586) >> uint(2)));
            float _590 = as_type<float>(_37[int(_588)]);
            int _592 = _568 + 16;
            uint _594 = uint(int(uint(_592) >> uint(2)));
            float _596 = as_type<float>(_37[int(_594)]);
            int _598 = _568 + 20;
            uint _600 = uint(int(uint(_598) >> uint(2)));
            float _602 = as_type<float>(_37[int(_600)]);
            int _604 = _568 + 24;
            uint _606 = uint(int(uint(_604) >> uint(2)));
            float _608 = as_type<float>(_37[int(_606)]);
            int _610 = _568 + 28;
            uint _612 = uint(int(uint(_610) >> uint(2)));
            float _614 = as_type<float>(_37[int(_612)]);
            int _616 = _568 + 32;
            uint _618 = uint(int(uint(_616) >> uint(2)));
            float _620 = as_type<float>(_37[int(_618)]);
            int _622 = _568 + 36;
            uint _624 = uint(int(uint(_622) >> uint(2)));
            float _626 = as_type<float>(_37[int(_624)]);
            int _628 = _568 + 40;
            uint _630 = uint(int(uint(_628) >> uint(2)));
            float _632 = as_type<float>(_37[int(_630)]);
            int _634 = _568 + 44;
            uint _636 = uint(int(uint(_634) >> uint(2)));
            float _638 = as_type<float>(_37[int(_636)]);
            float _640 = _516 * _578;
            float _642 = _504 * _578;
            float _644 = _498 * _578;
            float _646 = _510 * _578;
            float _648 = fma(_538, _572, _640);
            float _650 = fma(_526, _572, _642);
            float _652 = _498 * _602;
            float _654 = fma(_532, _572, _646);
            float _656 = fma(_562, _584, _648);
            float _658 = fma(_550, _584, _650);
            float _660 = _504 * _602;
            float _662 = fma(_520, _572, _644);
            float _664 = _590 + _656;
            float _666 = _516 * _602;
            float _668 = _510 * _602;
            float _670 = fma(_520, _596, _652);
            float _672 = fma(_526, _596, _660);
            float _674 = fma(_538, _596, _666);
            float _676 = fma(_544, _584, _662);
            float _678 = fma(_532, _596, _668);
            float _680 = fma(_544, _608, _670);
            float _682 = fma(_562, _608, _674);
            float _684 = fma(_550, _608, _672);
            float _686 = _498 * _626;
            float _688 = _504 * _626;
            float _690 = _614 + _682;
            float _692 = _516 * _626;
            float _694 = _510 * _626;
            float _696 = fma(_520, _620, _686);
            float _698 = fma(_526, _620, _688);
            float _700 = fma(_538, _620, _692);
            float _702 = fma(_532, _620, _694);
            float _704 = fma(_556, _584, _654);
            float _706 = fma(_556, _608, _678);
            float _708 = fma(_562, _632, _700);
            float _710 = fma(_544, _632, _696);
            float _712 = fma(_550, _632, _698);
            float _714 = fma(_556, _632, _702);
            float _716 = _638 + _708;
            uint _718 = uint(int(uint(_490) >> uint(2)));
            _37[int(_718)] = as_type<uint>(_676);
            int _720 = _490 + 4;
            uint _722 = uint(int(uint(_720) >> uint(2)));
            _37[int(_722)] = as_type<uint>(_658);
            int _724 = _490 + 8;
            uint _726 = uint(int(uint(_724) >> uint(2)));
            _37[int(_726)] = as_type<uint>(_704);
            int _728 = _490 + 12;
            uint _730 = uint(int(uint(_728) >> uint(2)));
            _37[int(_730)] = as_type<uint>(_664);
            int _732 = _490 + 16;
            uint _734 = uint(int(uint(_732) >> uint(2)));
            _37[int(_734)] = as_type<uint>(_680);
            int _736 = _490 + 20;
            uint _738 = uint(int(uint(_736) >> uint(2)));
            _37[int(_738)] = as_type<uint>(_684);
            int _740 = _490 + 24;
            uint _742 = uint(int(uint(_740) >> uint(2)));
            _37[int(_742)] = as_type<uint>(_706);
            int _744 = _490 + 28;
            uint _746 = uint(int(uint(_744) >> uint(2)));
            _37[int(_746)] = as_type<uint>(_690);
            int _748 = _490 + 32;
            uint _750 = uint(int(uint(_748) >> uint(2)));
            _37[int(_750)] = as_type<uint>(_710);
            int _752 = _490 + 36;
            uint _754 = uint(int(uint(_752) >> uint(2)));
            _37[int(_754)] = as_type<uint>(_712);
            int _756 = _490 + 40;
            uint _758 = uint(int(uint(_756) >> uint(2)));
            _37[int(_758)] = as_type<uint>(_714);
            int _760 = _490 + 44;
            uint _762 = uint(int(uint(_760) >> uint(2)));
            _37[int(_762)] = as_type<uint>(_716);
            _470 = !_492;
            _468 = _480;
        } while (_470);
    }
    if (!_70)
    {
        return;
    }
    int _764 = 0;
    bool _766;
    do
    {
        int _768 = _764;
        int _770 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _772 = _770 + _768;
        uint _774 = uint(int(uint(_76) >> uint(2)));
        uint _776 = uint(int(uint(int(_774)) >> uint(2)));
        int _778 = int(_774) & 3;
        float _780 = (*spvDescriptorSet0.cp_c4)._m0[int(_776)][_778];
        int _782 = _768 * 112;
        int _784 = _772 * 48;
        uint _786 = uint(int(uint(_784) >> uint(2)));
        float _788 = as_type<float>(_37[int(_786)]);
        int _790 = _784 + 4;
        uint _792 = uint(int(uint(_790) >> uint(2)));
        float _794 = as_type<float>(_37[int(_792)]);
        int _796 = _784 + 8;
        uint _798 = uint(int(uint(_796) >> uint(2)));
        float _800 = as_type<float>(_37[int(_798)]);
        int _802 = _784 + 12;
        uint _804 = uint(int(uint(_802) >> uint(2)));
        float _806 = as_type<float>(_37[int(_804)]);
        int _808 = _782 + 80;
        uint _810 = uint(int(uint(_808) >> uint(2)));
        uint _812 = uint(int(uint(int(_810)) >> uint(2)));
        int _814 = int(_810) & 3;
        float _816 = (*spvDescriptorSet0.cp_c6)._m0[int(_812)][_814];
        int _818 = int(_810) + 1;
        uint _820 = uint(int(uint(_818) >> uint(2)));
        int _822 = _818 & 3;
        float _824 = (*spvDescriptorSet0.cp_c6)._m0[int(_820)][_822];
        int _826 = _784 + 16;
        uint _828 = uint(int(uint(_826) >> uint(2)));
        float _830 = as_type<float>(_37[int(_828)]);
        int _832 = _784 + 20;
        uint _834 = uint(int(uint(_832) >> uint(2)));
        float _836 = as_type<float>(_37[int(_834)]);
        int _838 = _784 + 24;
        uint _840 = uint(int(uint(_838) >> uint(2)));
        float _842 = as_type<float>(_37[int(_840)]);
        int _844 = _784 + 28;
        uint _846 = uint(int(uint(_844) >> uint(2)));
        float _848 = as_type<float>(_37[int(_846)]);
        int _850 = _784 + 32;
        uint _852 = uint(int(uint(_850) >> uint(2)));
        float _854 = as_type<float>(_37[int(_852)]);
        int _856 = _784 + 36;
        uint _858 = uint(int(uint(_856) >> uint(2)));
        float _860 = as_type<float>(_37[int(_858)]);
        int _862 = _784 + 40;
        uint _864 = uint(int(uint(_862) >> uint(2)));
        float _866 = as_type<float>(_37[int(_864)]);
        int _868 = _784 + 44;
        uint _870 = uint(int(uint(_868) >> uint(2)));
        float _872 = as_type<float>(_37[int(_870)]);
        int _874 = _782 + 88;
        uint _876 = uint(int(uint(_874) >> uint(2)));
        uint _878 = uint(int(uint(int(_876)) >> uint(2)));
        int _880 = int(_876) & 3;
        float _882 = (*spvDescriptorSet0.cp_c6)._m0[int(_878)][_880];
        int _884 = int(_876) + 1;
        uint _886 = uint(int(uint(_884) >> uint(2)));
        int _888 = _884 & 3;
        float _890 = (*spvDescriptorSet0.cp_c6)._m0[int(_886)][_888];
        int _892 = _782 + 64;
        uint _894 = uint(int(uint(_892) >> uint(2)));
        uint _896 = uint(int(uint(int(_894)) >> uint(2)));
        int _898 = int(_894) & 3;
        float _900 = (*spvDescriptorSet0.cp_c6)._m0[int(_896)][_898];
        int _902 = int(_894) + 1;
        uint _904 = uint(int(uint(_902) >> uint(2)));
        int _906 = _902 & 3;
        float _908 = (*spvDescriptorSet0.cp_c6)._m0[int(_904)][_906];
        int _910 = _782 + 72;
        uint _912 = uint(int(uint(_910) >> uint(2)));
        uint _914 = uint(int(uint(int(_912)) >> uint(2)));
        int _916 = int(_912) & 3;
        float _918 = (*spvDescriptorSet0.cp_c6)._m0[int(_914)][_916];
        int _920 = int(_912) + 1;
        uint _922 = uint(int(uint(_920) >> uint(2)));
        int _924 = _920 & 3;
        float _926 = (*spvDescriptorSet0.cp_c6)._m0[int(_922)][_924];
        int _928 = _782 + 96;
        uint _930 = uint(int(uint(_928) >> uint(2)));
        uint _932 = uint(int(uint(int(_930)) >> uint(2)));
        int _934 = int(_930) & 3;
        float _936 = (*spvDescriptorSet0.cp_c6)._m0[int(_932)][_934];
        int _938 = int(_930) + 1;
        uint _940 = uint(int(uint(_938) >> uint(2)));
        int _942 = _938 & 3;
        float _944 = (*spvDescriptorSet0.cp_c6)._m0[int(_940)][_942];
        float _946 = _794 * _824;
        int _948 = _782 + 104;
        uint _950 = uint(int(uint(_948) >> uint(2)));
        uint _952 = uint(int(uint(int(_950)) >> uint(2)));
        int _954 = int(_950) & 3;
        float _956 = (*spvDescriptorSet0.cp_c6)._m0[int(_952)][_954];
        int _958 = int(_950) + 1;
        uint _960 = uint(int(uint(_958) >> uint(2)));
        int _962 = _958 & 3;
        float _964 = (*spvDescriptorSet0.cp_c6)._m0[int(_960)][_962];
        float _966 = _794 * _816;
        float _968 = _794 * _882;
        float _970 = _794 * _890;
        float _972 = fma(_788, _908, _946);
        float _974 = _836 * _816;
        float _976 = _836 * _824;
        float _978 = _836 * _882;
        float _980 = _836 * _890;
        float _982 = fma(_830, _900, _974);
        float _984 = fma(_830, _908, _976);
        float _986 = fma(_830, _918, _978);
        float _988 = fma(_830, _926, _980);
        float _990 = _860 * _824;
        float _992 = _860 * _882;
        float _994 = _860 * _890;
        float _996 = _860 * _816;
        int _998 = _782 + 16;
        uint _1000 = uint(int(uint(_998) >> uint(2)));
        uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
        int _1004 = int(_1000) & 3;
        float _1006 = (*spvDescriptorSet0.cp_c6)._m0[int(_1002)][_1004];
        int _1008 = int(_1000) + 1;
        uint _1010 = uint(int(uint(_1008) >> uint(2)));
        int _1012 = _1008 & 3;
        float _1014 = (*spvDescriptorSet0.cp_c6)._m0[int(_1010)][_1012];
        float _1016 = fma(_854, _908, _990);
        float _1018 = fma(_788, _918, _968);
        float _1020 = fma(_788, _926, _970);
        float _1022 = fma(_854, _918, _992);
        float _1024 = fma(_854, _926, _994);
        float _1026 = fma(_788, _900, _966);
        float _1028 = fma(_800, _944, _972);
        int _1030 = _782 + 24;
        uint _1032 = uint(int(uint(_1030) >> uint(2)));
        uint _1034 = uint(int(uint(int(_1032)) >> uint(2)));
        int _1036 = int(_1032) & 3;
        float _1038 = (*spvDescriptorSet0.cp_c6)._m0[int(_1034)][_1036];
        int _1040 = int(_1032) + 1;
        uint _1042 = uint(int(uint(_1040) >> uint(2)));
        int _1044 = _1040 & 3;
        float _1046 = (*spvDescriptorSet0.cp_c6)._m0[int(_1042)][_1044];
        float _1048 = fma(_800, _956, _1018);
        float _1050 = fma(_800, _936, _1026);
        float _1052 = fma(_800, _964, _1020);
        float _1054 = fma(_842, _956, _986);
        float _1056 = fma(_842, _964, _988);
        float _1058 = fma(_866, _964, _1024);
        float _1060 = fma(_866, _956, _1022);
        int _1062 = _782 + 32;
        uint _1064 = uint(int(uint(_1062) >> uint(2)));
        uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
        int _1068 = int(_1064) & 3;
        float _1070 = (*spvDescriptorSet0.cp_c6)._m0[int(_1066)][_1068];
        int _1072 = int(_1064) + 1;
        uint _1074 = uint(int(uint(_1072) >> uint(2)));
        int _1076 = _1072 & 3;
        float _1078 = (*spvDescriptorSet0.cp_c6)._m0[int(_1074)][_1076];
        float _1080 = fma(_854, _900, _996);
        float _1082 = _848 + _1056;
        float _1084 = _806 + _1052;
        float _1086 = fma(_842, _944, _984);
        float _1088 = fma(_842, _936, _982);
        float _1090 = _872 + _1058;
        float _1092 = fma(_866, _944, _1016);
        int _1094 = _782 + 48;
        uint _1096 = uint(int(uint(_1094) >> uint(2)));
        uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
        int _1100 = int(_1096) & 3;
        float _1102 = (*spvDescriptorSet0.cp_c6)._m0[int(_1098)][_1100];
        int _1104 = int(_1096) + 1;
        uint _1106 = uint(int(uint(_1104) >> uint(2)));
        int _1108 = _1104 & 3;
        float _1110 = (*spvDescriptorSet0.cp_c6)._m0[int(_1106)][_1108];
        float _1112 = _1082 * _1014;
        float _1114 = _1086 * _1014;
        float _1116 = _1088 * _1014;
        float _1118 = _1054 * _1014;
        float _1120 = fma(_1084, _1006, _1112);
        float _1122 = fma(_1028, _1006, _1114);
        float _1124 = fma(_866, _936, _1080);
        int _1126 = _782 + 40;
        uint _1128 = uint(int(uint(_1126) >> uint(2)));
        uint _1130 = uint(int(uint(int(_1128)) >> uint(2)));
        int _1132 = int(_1128) & 3;
        float _1134 = (*spvDescriptorSet0.cp_c6)._m0[int(_1130)][_1132];
        int _1136 = int(_1128) + 1;
        uint _1138 = uint(int(uint(_1136) >> uint(2)));
        int _1140 = _1136 & 3;
        float _1142 = (*spvDescriptorSet0.cp_c6)._m0[int(_1138)][_1140];
        float _1144 = fma(_1090, _1038, _1120);
        float _1146 = fma(_1050, _1006, _1116);
        float _1148 = fma(_1048, _1006, _1118);
        int _1150 = as_type<int>(_780) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1152 = _1150 + _768;
        float _1154 = _1144 + _1046;
        float _1156 = fma(_1092, _1038, _1122);
        int _1158 = _768 + 1;
        int _1160 = _782 + 56;
        uint _1162 = uint(int(uint(_1160) >> uint(2)));
        uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
        int _1166 = int(_1162) & 3;
        float _1168 = (*spvDescriptorSet0.cp_c6)._m0[int(_1164)][_1166];
        int _1170 = int(_1162) + 1;
        uint _1172 = uint(int(uint(_1170) >> uint(2)));
        int _1174 = _1170 & 3;
        float _1176 = (*spvDescriptorSet0.cp_c6)._m0[int(_1172)][_1174];
        float _1178 = _1082 * _1078;
        float _1180 = fma(_1124, _1038, _1146);
        float _1182 = fma(_1060, _1038, _1148);
        float _1184 = _1086 * _1078;
        float _1186 = _1088 * _1078;
        float _1188 = _1054 * _1078;
        float _1190 = fma(_1084, _1070, _1178);
        float _1192 = _1082 * _1110;
        float _1194 = _1088 * _1110;
        float _1196 = _1086 * _1110;
        float _1198 = _1054 * _1110;
        float _1200 = fma(_1084, _1102, _1192);
        int _1202 = _1152 * 48;
        bool _1204 = uint(_1158) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1206 = fma(_1028, _1070, _1184);
        float _1208 = fma(_1050, _1070, _1186);
        float _1210 = fma(_1048, _1070, _1188);
        float _1212 = fma(_1090, _1134, _1190);
        float _1214 = fma(_1050, _1102, _1194);
        float _1216 = fma(_1028, _1102, _1196);
        float _1218 = fma(_1048, _1102, _1198);
        float _1220 = fma(_1092, _1134, _1206);
        int _1222 = _1202 + 16;
        float _1224 = fma(_1090, _1168, _1200);
        float _1226 = fma(_1124, _1134, _1208);
        float _1228 = fma(_1060, _1134, _1210);
        float _1230 = _1212 + _1142;
        int _1232 = _1202 + 32;
        float _1234 = fma(_1124, _1168, _1214);
        float _1236 = fma(_1092, _1168, _1216);
        float _1238 = fma(_1060, _1168, _1218);
        float _1240 = _1224 + _1176;
        int _1242 = _1202 + 48;
        uint _1244 = uint(int(uint(_1222) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1244)] = as_type<uint>(_1180);
        int _1246 = _1222 + 4;
        uint _1248 = uint(int(uint(_1246) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1248)] = as_type<uint>(_1156);
        int _1250 = _1222 + 8;
        uint _1252 = uint(int(uint(_1250) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1252)] = as_type<uint>(_1182);
        int _1254 = _1222 + 12;
        uint _1256 = uint(int(uint(_1254) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1256)] = as_type<uint>(_1154);
        uint _1258 = uint(int(uint(_1232) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1258)] = as_type<uint>(_1226);
        int _1260 = _1232 + 4;
        uint _1262 = uint(int(uint(_1260) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1262)] = as_type<uint>(_1220);
        int _1264 = _1232 + 8;
        uint _1266 = uint(int(uint(_1264) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1266)] = as_type<uint>(_1228);
        int _1268 = _1232 + 12;
        uint _1270 = uint(int(uint(_1268) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1270)] = as_type<uint>(_1230);
        uint _1272 = uint(int(uint(_1242) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1272)] = as_type<uint>(_1234);
        int _1274 = _1242 + 4;
        uint _1276 = uint(int(uint(_1274) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1276)] = as_type<uint>(_1236);
        int _1278 = _1242 + 8;
        uint _1280 = uint(int(uint(_1278) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1280)] = as_type<uint>(_1238);
        int _1282 = _1242 + 12;
        uint _1284 = uint(int(uint(_1282) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1284)] = as_type<uint>(_1240);
        _766 = !_1204;
        _764 = _1158;
    } while (_766);
}

