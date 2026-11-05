#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
}

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
    texture2d_array<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4698, thread const int& _4699, constant _10& support_buffer)
{
    int _4702 = 1 + _4699;
    float _4704 = support_buffer._m5[_4702].x;
    bool _4706 = _4704 == 1.0;
    if (_4706)
    {
        return _4698;
    }
    float _4708 = float(_4698);
    float _4710 = _4708 * _4704;
    int _4712 = int(_4710);
    return _4712;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4390, thread const int& _4391, thread const int& _4392, thread const int& _4393, thread int& _4394, thread int& _4395, thread int& _4396, thread int& _4397, thread int& _4398, thread int& _4399)
{
    float _4402 = as_type<float>(_4392) + 0.0;
    bool _4404 = _4402 != 0.0;
    bool _4406 = isnan(_4402);
    bool _4408 = _4404 || _4406;
    bool _4410 = isnan(0.0);
    bool _4412 = _4408 || _4410;
    int _4414 = _4390;
    int _4416 = _4391;
    int _4418 = _4392;
    int _4420 = _4412 ? (-1) : 0;
    if (!_4412)
    {
        float _4422 = as_type<float>(_4392) * 1.0;
        _4414 = as_type<int>(_4422);
    }
    int _4424 = _4414;
    bool _4426 = !_4412;
    int _4428 = _4424;
    int _4430 = _4424;
    if (!_4426)
    {
        float _4432 = as_type<float>(_4392) + 0.0;
        bool _4434 = _4432 >= 0.0;
        bool _4436 = isnan(_4432);
        bool _4438 = _4434 || _4436;
        bool _4440 = isnan(0.0);
        bool _4442 = _4438 || _4440;
        _4420 = _4442 ? (-1) : 0;
        if (!_4442)
        {
            _4428 = 2147483647;
        }
        int _4444 = _4428;
        bool _4446 = !_4442;
        int _4448 = _4444;
        _4430 = _4444;
        if (!_4446)
        {
            float _4450 = as_type<float>(_4392) + 0.0;
            bool _4452 = _4450 > as_type<float>(0x7f800000u /* inf */);
            bool _4454 = isnan(_4450);
            bool _4456 = _4452 || _4454;
            bool _4458 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4460 = _4456 || _4458;
            _4420 = _4460 ? (-1) : 0;
            if (_4460)
            {
                float _4462 = as_type<float>(_4392) + 1.0;
                _4448 = as_type<int>(_4462);
            }
            int _4464 = _4448;
            int _4466 = _4464;
            _4430 = _4464;
            if (!_4460)
            {
                float _4468 = 0.0 + as_type<float>(_4392);
                bool _4470 = _4468 != as_type<float>(0x7f800000u /* inf */);
                bool _4472 = isnan(_4468);
                bool _4474 = _4470 || _4472;
                bool _4476 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4478 = _4474 || _4476;
                _4420 = _4478 ? (-1) : 0;
                if (!_4478)
                {
                    _4466 = _4392;
                }
                int _4480 = _4466;
                bool _4482 = !_4478;
                _4430 = _4480;
                if (!_4482)
                {
                    float _4484 = as_type<float>(_4392) * 18446744073709551616.0;
                    float _4486 = rsqrt(_4484);
                    float _4488 = _4484 * _4486;
                    float _4490 = _4486 * 0.5;
                    float _4492 = -_4488;
                    float _4494 = 0.0 + _4492;
                    float _4496 = fma(_4490, _4494, 0.5);
                    float _4498 = fma(_4488, _4496, _4488);
                    float _4500 = -_4498;
                    float _4502 = 0.0 + _4500;
                    float _4504 = fma(_4498, _4502, _4484);
                    float _4506 = fma(_4490, _4504, _4498);
                    float _4508 = _4506 * 2.3283064365386962890625e-10;
                    _4430 = as_type<int>(_4508);
                    _4416 = as_type<int>(_4498);
                    _4418 = as_type<int>(_4494);
                }
            }
        }
    }
    int _4510 = _4430;
    int _4512 = _4416;
    int _4514 = _4418;
    int _4516 = _4420;
    _4394 = _4393;
    _4395 = 0;
    _4396 = _4510;
    _4397 = _4512;
    _4398 = _4514;
    _4399 = _4516;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4733, thread const int& _4734, thread const int& _4735, thread int& _4736, thread uint& gl_SubgroupInvocationID)
{
    int _4739 = _4735 & 31;
    uint _4741 = uint(int(uint(_4735) >> uint(8)));
    int _4743 = int(_4741) & 31;
    float _4745 = as_type<float>(gl_SubgroupInvocationID);
    int _4747 = as_type<int>(_4745) & _4743;
    int _4749 = ~_4743;
    int _4751 = _4739 & _4749;
    int _4753 = _4751 | _4747;
    int _4755 = ~_4743;
    int _4757 = _4734 & _4755;
    int _4759 = _4757 | _4747;
    bool _4761 = uint(_4759) <= uint(_4753);
    _4736 = _4761 ? (-1) : 0;
    float _4763 = spvSubgroupShuffle(as_type<float>(_4733), uint(_4759));
    uint _4765 = uint(_4761 ? as_type<int>(_4763) : _4733);
    return int(_4765);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1403 = false;
    bool _893 = false;
    bool _593 = false;
    float _64 = as_type<float>(gl_WorkGroupID.x);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    int _68 = as_type<int>(_64) << 6;
    int _70 = _68 + as_type<int>(_66);
    bool _74 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_74)
    {
        return;
    }
    int _76 = _70 & 31;
    bool _78 = _76 == 0;
    bool _80 = uint(_76) < 32u;
    int _82 = 32 - _76;
    int _84 = _76 - 32;
    int _86 = 1 << _76;
    uint _89 = uint(int(uint(0) >> uint(_82)));
    int _91 = _86 | int(_89);
    int _93 = _78 ? 1 : _91;
    bool _95 = uint(_84) < 32u;
    int _97 = 0 << _84;
    int _99 = _95 ? _97 : 0;
    float _101 = _80 ? as_type<float>(_93) : as_type<float>(_99);
    int _103 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _105 = _103 + 36;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _103 + 32;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.cp_c5)._m0[int(_119)][_121];
    int _125 = as_type<int>(_101) & as_type<int>(_113);
    bool _127 = _125 != 0;
    int _129 = as_type<int>(_101) & as_type<int>(_123);
    bool _131 = _129 != 0;
    int _133 = 0;
    float _135 = _101;
    float _137 = as_type<float>(_70);
    if (_127)
    {
        int _139 = _103 + 8;
        uint _141 = uint(int(uint(_139) >> uint(2)));
        uint _143 = uint(int(uint(int(_141)) >> uint(2)));
        int _145 = int(_141) & 3;
        float _147 = (*spvDescriptorSet0.cp_c5)._m0[int(_143)][_145];
        _133 = as_type<int>(_147);
    }
    int _149 = _133;
    float _151 = 0.0;
    if (_127)
    {
        _151 = 1.4012984643248170709237295832899e-45;
    }
    float _153 = _151;
    int _155 = 0;
    float _157 = _153;
    if (_131)
    {
        uint _159 = uint(int(uint(_103) >> uint(2)));
        uint _161 = uint(int(uint(int(_159)) >> uint(2)));
        int _163 = int(_159) & 3;
        float _165 = (*spvDescriptorSet0.cp_c5)._m0[int(_161)][_163];
        _155 = as_type<int>(_165);
    }
    int _167 = _155;
    float _169 = 0.0;
    if (_131)
    {
        _169 = 2.8025969286496341418474591665798e-45;
    }
    float _171 = _169;
    if (_131)
    {
        _135 = 1.4012984643248170709237295832899e-45;
    }
    float _173 = _135;
    float _175 = as_type<float>(_149);
    float _177 = _123;
    float _179 = 0.0;
    if (_127)
    {
        int _181 = _70;
        int _183 = 0;
        int _185 = _58(_181, _183, (*spvDescriptorSet0.support_buffer));
        int _187 = _149;
        int _189 = 0;
        int _191 = _58(_187, _189, (*spvDescriptorSet0.support_buffer));
        int3 _2056 = int3(_185, _191, as_type<int>(_153));
        float3 _195 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2056.xy), uint(_2056.z), 0).xyz;
        float _197 = _195.x;
        float _199 = _195.y;
        float _201 = _195.z;
        _175 = _197;
        _177 = _199;
        _179 = _201;
    }
    float _203 = _175;
    float _205 = _177;
    float _207 = _179;
    float _209 = 0.0;
    float _211 = as_type<float>(_70);
    float _213 = 0.0;
    if (_131)
    {
        int _215 = _70;
        int _217 = 1;
        int _219 = _58(_215, _217, (*spvDescriptorSet0.support_buffer));
        int _221 = _167;
        int _223 = 1;
        int _225 = _58(_221, _223, (*spvDescriptorSet0.support_buffer));
        int3 _2084 = int3(_219, _225, 0);
        float3 _227 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2084.xy), uint(_2084.z), 0).xyz;
        float _229 = _227.x;
        float _231 = _227.y;
        float _233 = _227.z;
        _209 = _229;
        _211 = _231;
        _213 = _233;
    }
    float _235 = _209;
    float _237 = _211;
    float _239 = _213;
    float _241 = _171;
    float _243 = as_type<float>(_70);
    float _245 = 0.0;
    if (_131)
    {
        int _247 = _70;
        int _249 = 1;
        int _251 = _58(_247, _249, (*spvDescriptorSet0.support_buffer));
        int _253 = _167;
        int _255 = 1;
        int _257 = _58(_253, _255, (*spvDescriptorSet0.support_buffer));
        int3 _2115 = int3(_251, _257, as_type<int>(_171));
        float3 _259 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2115.xy), uint(_2115.z), 0).xyz;
        float _261 = _259.x;
        float _263 = _259.y;
        float _265 = _259.z;
        _241 = _261;
        _243 = _263;
        _245 = _265;
    }
    float _267 = _241;
    float _269 = _243;
    float _271 = _245;
    float _273 = 0.0;
    float _275 = 0.0;
    float _277 = _173;
    if (_131)
    {
        int _279 = _70;
        int _281 = 1;
        int _283 = _58(_279, _281, (*spvDescriptorSet0.support_buffer));
        int _285 = _167;
        int _287 = 1;
        int _289 = _58(_285, _287, (*spvDescriptorSet0.support_buffer));
        int3 _2144 = int3(_283, _289, as_type<int>(_173));
        float3 _291 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2144.xy), uint(_2144.z), 0).xyz;
        float _293 = _291.x;
        float _295 = _291.y;
        float _297 = _291.z;
        _273 = _293;
        _275 = _295;
        _277 = _297;
    }
    float _299 = _273;
    float _301 = _275;
    float _303 = _277;
    float _305 = 0.0;
    float _307 = 0.0;
    if (!_131)
    {
        _305 = 0.0;
        _307 = 0.0;
    }
    float _309 = _305;
    float _311 = _307;
    float _313 = 0.0;
    float _315 = 0.0;
    float _317 = _309;
    float _319 = _311;
    if (!_131)
    {
        _313 = 0.0;
        _315 = 0.0;
    }
    float _321 = _313;
    float _323 = _315;
    float _325 = 0.0;
    float _327 = _321;
    float _329 = _323;
    if (!_131)
    {
        _325 = 0.0;
    }
    float _331 = _325;
    float _333 = _331;
    if (!_131)
    {
        _157 = 0.0;
        _137 = 0.0;
    }
    float _335 = _157;
    float _337 = _137;
    float _339 = 0.0;
    float _341 = _335;
    float _343 = _337;
    if (!_131)
    {
        _339 = 0.0;
    }
    float _345 = _339;
    float _347 = 0.0;
    float _349 = _345;
    if (!_131)
    {
        _347 = 0.0;
    }
    float _351 = _347;
    bool _353 = !_131;
    float _355 = _351;
    if (!_353)
    {
        _341 = _303;
        _343 = _301;
        _355 = _299;
        _317 = _235;
        _319 = _237;
        _327 = _239;
        _333 = _267;
        _349 = _269;
        _329 = _271;
    }
    float _357 = _341;
    float _359 = _343;
    float _361 = _355;
    float _363 = _317;
    float _365 = _319;
    float _367 = _327;
    float _369 = _333;
    float _371 = _349;
    float _373 = _329;
    bool _375 = !_127;
    float _377 = _363;
    float _379 = _367;
    float _381 = _369;
    float _383 = _371;
    float _385 = _373;
    float _873;
    float _875;
    float _877;
    float _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    float _891;
    if (!_375)
    {
        float _387 = _357 * 0.5;
        float _389 = _359 * 0.5;
        float _391 = _207 * 0.5;
        float _393 = _205 * 0.5;
        float _395 = _387 * 0.15915493667125701904296875;
        float _397 = _389 * 0.15915493667125701904296875;
        float _399 = _361 * 0.5;
        float _401 = _391 * 0.15915493667125701904296875;
        float _403 = _393 * 0.15915493667125701904296875;
        float _405 = _395 * 6.283185482025146484375;
        float _407 = cos(_405);
        float _409 = _203 * 0.5;
        float _411 = _399 * 0.15915493667125701904296875;
        float _413 = _409 * 0.15915493667125701904296875;
        float _415 = _397 * 6.283185482025146484375;
        float _417 = cos(_415);
        float _419 = _397 * 6.283185482025146484375;
        float _421 = sin(_419);
        float _423 = _395 * 6.283185482025146484375;
        float _425 = sin(_423);
        float _427 = _407 * _417;
        float _429 = _401 * 6.283185482025146484375;
        float _431 = cos(_429);
        float _433 = _407 * _421;
        float _435 = _403 * 6.283185482025146484375;
        float _437 = cos(_435);
        float _439 = _425 * _421;
        float _441 = _417 * _425;
        float _443 = _403 * 6.283185482025146484375;
        float _445 = sin(_443);
        float _447 = _401 * 6.283185482025146484375;
        float _449 = sin(_447);
        float _451 = _431 * _437;
        float _453 = _411 * 6.283185482025146484375;
        float _455 = sin(_453);
        float _457 = _431 * _445;
        float _459 = _413 * 6.283185482025146484375;
        float _461 = sin(_459);
        float _463 = _449 * _445;
        float _465 = _437 * _449;
        float _467 = _411 * 6.283185482025146484375;
        float _469 = cos(_467);
        float _471 = _455 * _441;
        float _473 = _455 * _439;
        float _475 = _413 * 6.283185482025146484375;
        float _477 = cos(_475);
        float _479 = _461 * _465;
        float _481 = fma(_469, _433, _471);
        float _483 = _469 * _439;
        float _485 = _455 * _433;
        float _487 = _461 * _463;
        float _489 = -_483;
        float _491 = fma(_455, _427, _489);
        float _493 = _477 * _463;
        float _495 = fma(_477, _457, _479);
        float _497 = _461 * _457;
        float _499 = -_485;
        float _501 = fma(_469, _441, _499);
        float _503 = -_493;
        float _505 = fma(_461, _451, _503);
        float _507 = _481 * _495;
        float _509 = -_497;
        float _511 = fma(_477, _465, _509);
        float _513 = fma(_469, _427, _473);
        float _515 = fma(_477, _451, _487);
        float _517 = fma(_491, _505, _507);
        float _519 = fma(_501, _511, _517);
        float _521 = fma(_513, _515, _519);
        float _523 = precise::max(_521, -1.0);
        float _525 = precise::min(_523, 1.0);
        bool _527 = _525 >= 0.0;
        bool _529 = isnan(_525);
        bool _531 = _527 || _529;
        bool _533 = isnan(0.0);
        bool _535 = _531 || _533;
        bool _537 = !_535;
        float _539 = -_525;
        float _541 = _537 ? _539 : _525;
        bool _543 = _541 < 0.0;
        float _545 = float(_543);
        float _547 = abs(_541);
        float _549 = -_547;
        float _551 = _549 + 1.0;
        float _553 = abs(_541);
        float _555 = fma(_553, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _557 = as_type<int>(_551) + (-218103808);
        float _559 = abs(_541);
        float _561 = fma(_559, _555, -0.212114393711090087890625);
        bool _563 = uint(_557) >= 1920991232u;
        float _565 = abs(_541);
        float _567 = fma(_565, _561, 1.570728778839111328125);
        bool _569 = !_563;
        float _591;
        if (!_569)
        {
            int _571 = as_type<int>(_451);
            int _573 = as_type<int>(_441);
            int _575 = as_type<int>(_551);
            int _577 = 1824;
            int _579;
            int _581;
            int _583;
            int _585;
            int _587;
            int _589;
            _56(_571, _573, _575, _577, _579, _581, _583, _585, _587, _589);
            _591 = as_type<float>(_583);
            _593 = true;
        }
        else
        {
            float _595 = rsqrt(_551);
            float _597 = _551 * _595;
            float _599 = _595 * 0.5;
            float _601 = -_597;
            float _603 = 0.0 + _601;
            float _605 = fma(_599, _603, 0.5);
            float _607 = fma(_597, _605, _597);
            float _609 = -_607;
            float _611 = 0.0 + _609;
            float _613 = fma(_607, _611, _551);
            float _615 = fma(_599, _613, _607);
            _591 = _615;
        }
        _593 = false;
        float _617 = _591;
        int _619 = _103 + 8;
        uint _621 = uint(int(uint(_619) >> uint(2)));
        uint _623 = uint(int(uint(int(_621)) >> uint(2)));
        int _625 = int(_621) & 3;
        float _627 = (*spvDescriptorSet0.cp_c5)._m0[int(_623)][_625];
        int _629 = _70;
        int _631 = 0;
        int _633 = _58(_629, _631, (*spvDescriptorSet0.support_buffer));
        int _635 = as_type<int>(_627);
        int _637 = 0;
        int _639 = _58(_635, _637, (*spvDescriptorSet0.support_buffer));
        int3 _2552 = int3(_633, _639, 0);
        float3 _641 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2552.xy), uint(_2552.z), 0).xyz;
        float _643 = _641.x;
        float _645 = _641.y;
        float _647 = _641.z;
        int _649 = _70;
        int _651 = 0;
        int _653 = _58(_649, _651, (*spvDescriptorSet0.support_buffer));
        int _655 = as_type<int>(_627);
        int _657 = 0;
        int _659 = _58(_655, _657, (*spvDescriptorSet0.support_buffer));
        int3 _2570 = int3(_653, _659, 2);
        float3 _661 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2570.xy), uint(_2570.z), 0).xyz;
        float _663 = _661.x;
        float _665 = _661.y;
        float _667 = _661.z;
        float _669 = _567 * _617;
        float _671 = _545 * 2.0;
        float _673 = -_671;
        float _675 = fma(_669, _673, _669);
        float _677 = fma(_545, 3.1415927410125732421875, _675);
        float _679 = _677 * 0.15915493667125701904296875;
        float _681 = _679 * 6.283185482025146484375;
        float _683 = sin(_681);
        float _685 = abs(_683);
        bool _687 = _685 >= 0.001000000047497451305389404296875;
        bool _689 = isnan(_685);
        bool _691 = _687 || _689;
        bool _693 = isnan(0.001000000047497451305389404296875);
        bool _695 = _691 || _693;
        float _697 = _545;
        float _699 = _671;
        float _701 = _675;
        if (!_695)
        {
            int _703 = _103 + 28;
            uint _705 = uint(int(uint(_703) >> uint(2)));
            uint _707 = uint(int(uint(int(_705)) >> uint(2)));
            int _709 = int(_705) & 3;
            float _711 = (*spvDescriptorSet0.cp_c5)._m0[int(_707)][_709];
            _697 = _711;
        }
        float _713 = _697;
        float _715 = _713;
        if (!_695)
        {
            float _717 = -_713;
            float _719 = _717 + 1.0;
            _699 = _719;
        }
        float _721 = _699;
        float _723 = _721;
        if (!_695)
        {
            _701 = _713;
        }
        float _725 = _701;
        bool _727 = !_695;
        float _729 = _725;
        if (!_727)
        {
            int _731 = _103 + 28;
            uint _733 = uint(int(uint(_731) >> uint(2)));
            uint _735 = uint(int(uint(int(_733)) >> uint(2)));
            int _737 = int(_733) & 3;
            float _739 = (*spvDescriptorSet0.cp_c5)._m0[int(_735)][_737];
            float _741 = 1.0 / _683;
            float _743 = _677 * _739;
            float _745 = _743 * 0.15915493667125701904296875;
            float _747 = -_743;
            float _749 = _677 + _747;
            float _751 = _749 * 0.15915493667125701904296875;
            float _753 = _745 * 6.283185482025146484375;
            float _755 = sin(_753);
            float _757 = _751 * 6.283185482025146484375;
            float _759 = sin(_757);
            float _761 = _755 * _741;
            float _763 = _759 * _741;
            _729 = _761;
            _715 = _739;
            _723 = _763;
        }
        float _765 = _729;
        float _767 = _715;
        float _769 = _723;
        bool _771 = !_535;
        float _773 = -_765;
        float _775 = _771 ? _773 : _765;
        int _777 = _103 + 20;
        uint _779 = uint(int(uint(_777) >> uint(2)));
        uint _781 = uint(int(uint(int(_779)) >> uint(2)));
        int _783 = int(_779) & 3;
        float _785 = (*spvDescriptorSet0.cp_c5)._m0[int(_781)][_783];
        float _787 = _643 * _767;
        float _789 = _663 * _767;
        float _791 = _515 * _775;
        float _793 = _505 * _775;
        float _795 = _495 * _775;
        float _797 = _511 * _775;
        float _799 = fma(_513, _769, _791);
        float _801 = fma(_491, _769, _793);
        float _803 = fma(_481, _769, _795);
        float _805 = fma(_501, _769, _797);
        float _807 = _799 * 2.0;
        float _809 = _801 * 2.0;
        float _811 = _801 * _801;
        float _813 = _803 * 2.0;
        float _815 = _805 * _807;
        float _817 = _803 * _807;
        float _819 = _801 * _807;
        float _821 = _803 * _803;
        float _823 = -_815;
        float _825 = fma(_803, _809, _823);
        float _827 = fma(_803, _809, _815);
        float _829 = fma(_805, _809, _817);
        float _831 = -_817;
        float _833 = fma(_805, _809, _831);
        float _835 = fma(_811, -2.0, 1.0);
        float _837 = -_819;
        float _839 = fma(_805, _813, _837);
        float _841 = _805 * _805;
        float _843 = fma(_821, -2.0, 1.0);
        float _845 = fma(_805, _813, _819);
        float _847 = _645 * _767;
        float _849 = fma(_841, -2.0, _835);
        float _851 = fma(_841, -2.0, _843);
        float _853 = fma(_363, _785, _787);
        float _855 = fma(_365, _785, _847);
        float _857 = _647 * _767;
        float _859 = _665 * _767;
        float _861 = _667 * _767;
        float _863 = fma(_821, -2.0, _835);
        float _865 = fma(_367, _785, _857);
        float _867 = fma(_369, _785, _789);
        float _869 = fma(_371, _785, _859);
        float _871 = fma(_373, _785, _861);
        _377 = _853;
        _873 = _851;
        _875 = _827;
        _877 = _833;
        _879 = _855;
        _881 = _849;
        _883 = _845;
        _379 = _865;
        _885 = _829;
        _887 = _839;
        _889 = _825;
        _891 = _863;
        _381 = _867;
        _383 = _869;
        _385 = _871;
        _893 = true;
    }
    else
    {
        float _895 = _361 * 0.15915493667125701904296875;
        float _897 = _357 * 0.15915493667125701904296875;
        float _899 = _359 * 0.15915493667125701904296875;
        float _901 = _895 * 6.283185482025146484375;
        float _903 = sin(_901);
        float _905 = _895 * 6.283185482025146484375;
        float _907 = cos(_905);
        float _909 = _897 * 6.283185482025146484375;
        float _911 = sin(_909);
        float _913 = _897 * 6.283185482025146484375;
        float _915 = cos(_913);
        float _917 = _899 * 6.283185482025146484375;
        float _919 = sin(_917);
        float _921 = _911 * _907;
        float _923 = _903 * _911;
        float _925 = _899 * 6.283185482025146484375;
        float _927 = cos(_925);
        float _929 = _907 * _915;
        float _931 = _903 * _915;
        float _933 = _903 * _919;
        float _935 = fma(_919, _929, _923);
        float _937 = _907 * _927;
        float _939 = _927 * _915;
        float _941 = _911 * _927;
        float _943 = _903 * _927;
        float _945 = -_921;
        float _947 = fma(_915, _933, _945);
        float _949 = fma(_911, _933, _929);
        float _951 = -_931;
        float _953 = fma(_919, _921, _951);
        float _955 = -_919;
        float _957 = _955 + (-0.0);
        _873 = _939;
        _875 = _941;
        _877 = _957;
        _879 = _365;
        _881 = _949;
        _883 = _943;
        _885 = _935;
        _887 = _953;
        _889 = _947;
        _891 = _937;
    }
    _893 = false;
    float _959 = _377;
    float _961 = _873;
    float _963 = _875;
    float _965 = _877;
    float _967 = _879;
    float _969 = _881;
    float _971 = _883;
    float _973 = _379;
    float _975 = _885;
    float _977 = _887;
    float _979 = _889;
    float _981 = _891;
    float _983 = _381;
    float _985 = _383;
    float _987 = _385;
    float _989 = _959 * _961;
    float _991 = _959 * _963;
    float _993 = _959 * _965;
    bool _995 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _997 = _967 * _969;
    float _999 = _967 * _971;
    float _1001 = _973 * _975;
    float _1003 = _973 * _977;
    bool _1005 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _1007 = _967 * _979;
    float _1009 = _973 * _981;
    float _1011 = _1001;
    float _1013 = _983;
    if (!_995)
    {
        int _1015 = _70 * 48;
        int _1017 = _1015 + 16;
        uint _1019 = uint(int(uint(_1015) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1019)] = as_type<uint>(_989);
        int _1021 = _1015 + 4;
        uint _1023 = uint(int(uint(_1021) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1023)] = as_type<uint>(_1007);
        int _1025 = _1015 + 8;
        uint _1027 = uint(int(uint(_1025) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1027)] = as_type<uint>(_1001);
        int _1029 = _1015 + 12;
        uint _1031 = uint(int(uint(_1029) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1031)] = as_type<uint>(_983);
        int _1033 = _1015 + 32;
        uint _1035 = uint(int(uint(_1017) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1035)] = as_type<uint>(_991);
        int _1037 = _1017 + 4;
        uint _1039 = uint(int(uint(_1037) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1039)] = as_type<uint>(_997);
        int _1041 = _1017 + 8;
        uint _1043 = uint(int(uint(_1041) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1043)] = as_type<uint>(_1003);
        int _1045 = _1017 + 12;
        uint _1047 = uint(int(uint(_1045) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1047)] = as_type<uint>(_985);
        uint _1049 = uint(int(uint(_1033) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1049)] = as_type<uint>(_993);
        int _1051 = _1033 + 4;
        uint _1053 = uint(int(uint(_1051) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1053)] = as_type<uint>(_999);
        int _1055 = _1033 + 8;
        uint _1057 = uint(int(uint(_1055) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1057)] = as_type<uint>(_1009);
        int _1059 = _1033 + 12;
        uint _1061 = uint(int(uint(_1059) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1061)] = as_type<uint>(_987);
    }
    int _1063 = _70 * 112;
    bool _1065 = !_1005;
    float _1383;
    float _1385;
    float _1387;
    float _1389;
    float _1391;
    float _1393;
    float _1395;
    float _1397;
    float _1399;
    float _1401;
    if (!_1065)
    {
        int _1067 = 0;
        float _1069 = _989;
        float _1071 = _1007;
        float _1073 = _1001;
        float _1075 = _983;
        float _1077 = _991;
        float _1079 = _997;
        float _1081 = _1003;
        float _1083 = _985;
        float _1085 = _993;
        float _1087 = _999;
        float _1089 = _1009;
        float _1091 = _987;
        bool _1093;
        int _1141;
        int _1151;
        int _1161;
        int _1171;
        int _1181;
        int _1191;
        int _1201;
        int _1211;
        int _1221;
        int _1231;
        int _1241;
        int _1251;
        int _1359;
        int _1363;
        int _1365;
        int _1369;
        int _1371;
        int _1373;
        int _1377;
        int _1379;
        int _1381;
        do
        {
            int _1095 = _1067;
            int _1097 = as_type<int>(_1069);
            int _1099 = as_type<int>(_1071);
            int _1101 = as_type<int>(_1073);
            int _1103 = as_type<int>(_1075);
            int _1105 = as_type<int>(_1077);
            int _1107 = as_type<int>(_1079);
            int _1109 = as_type<int>(_1081);
            int _1111 = as_type<int>(_1083);
            int _1113 = as_type<int>(_1085);
            int _1115 = as_type<int>(_1087);
            int _1117 = as_type<int>(_1089);
            int _1119 = as_type<int>(_1091);
            uint _1121 = uint(int(uint(_1063) >> uint(2)));
            uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
            int _1125 = int(_1121) & 3;
            float _1127 = (*spvDescriptorSet0.cp_c6)._m0[int(_1123)][_1125];
            bool _1129 = _70 != 0;
            int _1131 = _1095 + 1;
            bool _1133 = uint(_1131) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1135 = _1097;
            int _1137 = as_type<int>(_1127);
            int _1139 = 31;
            int _3250 = _60(_1135, _1137, _1139, _1141, gl_SubgroupInvocationID);
            int _1143 = _3250;
            int _1145 = _1099;
            int _1147 = as_type<int>(_1127);
            int _1149 = 31;
            int _3254 = _60(_1145, _1147, _1149, _1151, gl_SubgroupInvocationID);
            int _1153 = _3254;
            int _1155 = _1101;
            int _1157 = as_type<int>(_1127);
            int _1159 = 31;
            int _3258 = _60(_1155, _1157, _1159, _1161, gl_SubgroupInvocationID);
            int _1163 = _3258;
            int _1165 = _1103;
            int _1167 = as_type<int>(_1127);
            int _1169 = 31;
            int _3262 = _60(_1165, _1167, _1169, _1171, gl_SubgroupInvocationID);
            int _1173 = _3262;
            int _1175 = _1105;
            int _1177 = as_type<int>(_1127);
            int _1179 = 31;
            int _3266 = _60(_1175, _1177, _1179, _1181, gl_SubgroupInvocationID);
            int _1183 = _3266;
            int _1185 = _1107;
            int _1187 = as_type<int>(_1127);
            int _1189 = 31;
            int _3270 = _60(_1185, _1187, _1189, _1191, gl_SubgroupInvocationID);
            int _1193 = _3270;
            int _1195 = _1109;
            int _1197 = as_type<int>(_1127);
            int _1199 = 31;
            int _3274 = _60(_1195, _1197, _1199, _1201, gl_SubgroupInvocationID);
            int _1203 = _3274;
            int _1205 = _1111;
            int _1207 = as_type<int>(_1127);
            int _1209 = 31;
            int _3278 = _60(_1205, _1207, _1209, _1211, gl_SubgroupInvocationID);
            int _1213 = _3278;
            int _1215 = _1113;
            int _1217 = as_type<int>(_1127);
            int _1219 = 31;
            int _3282 = _60(_1215, _1217, _1219, _1221, gl_SubgroupInvocationID);
            int _1223 = _3282;
            int _1225 = _1115;
            int _1227 = as_type<int>(_1127);
            int _1229 = 31;
            int _3286 = _60(_1225, _1227, _1229, _1231, gl_SubgroupInvocationID);
            int _1233 = _3286;
            int _1235 = _1117;
            int _1237 = as_type<int>(_1127);
            int _1239 = 31;
            int _3290 = _60(_1235, _1237, _1239, _1241, gl_SubgroupInvocationID);
            int _1243 = _3290;
            int _1245 = _1119;
            int _1247 = as_type<int>(_1127);
            int _1249 = 31;
            int _3294 = _60(_1245, _1247, _1249, _1251, gl_SubgroupInvocationID);
            int _1253 = _3294;
            bool _1255 = !_1129;
            _1067 = _1131;
            int _1257 = _1097;
            int _1259 = _1099;
            int _1261 = _1101;
            int _1263 = _1103;
            int _1265 = _1105;
            int _1267 = _1107;
            int _1269 = _1109;
            int _1271 = _1111;
            int _1273 = _1113;
            int _1275 = _1115;
            int _1277 = _1117;
            int _1279 = _1119;
            if (!_1255)
            {
                float _1281 = as_type<float>(_1153) * _985;
                float _1283 = _991 * as_type<float>(_1153);
                float _1285 = _997 * as_type<float>(_1153);
                float _1287 = _1003 * as_type<float>(_1153);
                float _1289 = as_type<float>(_1193) * _985;
                float _1291 = _991 * as_type<float>(_1193);
                float _1293 = fma(as_type<float>(_1143), _983, _1281);
                float _1295 = fma(_989, as_type<float>(_1143), _1283);
                float _1297 = fma(_1007, as_type<float>(_1143), _1285);
                float _1299 = fma(_1001, as_type<float>(_1143), _1287);
                float _1301 = _997 * as_type<float>(_1193);
                float _1303 = _1003 * as_type<float>(_1193);
                float _1305 = fma(as_type<float>(_1183), _983, _1289);
                float _1307 = as_type<float>(_1233) * _985;
                float _1309 = fma(_989, as_type<float>(_1183), _1291);
                float _1311 = _997 * as_type<float>(_1233);
                float _1313 = _991 * as_type<float>(_1233);
                float _1315 = fma(_1007, as_type<float>(_1183), _1301);
                float _1317 = fma(_1001, as_type<float>(_1183), _1303);
                float _1319 = _1003 * as_type<float>(_1233);
                float _1321 = fma(as_type<float>(_1223), _983, _1307);
                float _1323 = fma(_1007, as_type<float>(_1223), _1311);
                float _1325 = fma(_989, as_type<float>(_1223), _1313);
                float _1327 = fma(_999, as_type<float>(_1163), _1297);
                float _1329 = fma(_1009, as_type<float>(_1163), _1299);
                float _1331 = fma(_993, as_type<float>(_1163), _1295);
                float _1333 = fma(_993, as_type<float>(_1203), _1309);
                float _1335 = fma(_999, as_type<float>(_1203), _1315);
                float _1337 = fma(_1009, as_type<float>(_1203), _1317);
                float _1339 = fma(_1001, as_type<float>(_1223), _1319);
                float _1341 = fma(as_type<float>(_1163), _987, _1293);
                float _1343 = fma(as_type<float>(_1203), _987, _1305);
                float _1345 = fma(as_type<float>(_1243), _987, _1321);
                float _1347 = fma(_999, as_type<float>(_1243), _1323);
                float _1349 = fma(_993, as_type<float>(_1243), _1325);
                float _1351 = fma(_1009, as_type<float>(_1243), _1339);
                float _1353 = as_type<float>(_1173) + _1341;
                float _1355 = as_type<float>(_1213) + _1343;
                float _1357 = as_type<float>(_1253) + _1345;
                _1257 = as_type<int>(_1331);
                _1259 = as_type<int>(_1327);
                _1261 = as_type<int>(_1329);
                _1263 = as_type<int>(_1353);
                _1265 = as_type<int>(_1333);
                _1267 = as_type<int>(_1335);
                _1269 = as_type<int>(_1337);
                _1271 = as_type<int>(_1355);
                _1273 = as_type<int>(_1349);
                _1275 = as_type<int>(_1347);
                _1277 = as_type<int>(_1351);
                _1279 = as_type<int>(_1357);
            }
            _1359 = _1257;
            int _1361 = _1259;
            _1363 = _1261;
            _1365 = _1263;
            int _1367 = _1265;
            _1369 = _1267;
            _1371 = _1269;
            _1373 = _1271;
            int _1375 = _1273;
            _1377 = _1275;
            _1379 = _1277;
            _1381 = _1279;
            _1093 = !_1133;
            _1069 = as_type<float>(_1359);
            _1071 = as_type<float>(_1361);
            _1073 = as_type<float>(_1363);
            _1075 = as_type<float>(_1365);
            _1077 = as_type<float>(_1367);
            _1079 = as_type<float>(_1369);
            _1081 = as_type<float>(_1371);
            _1083 = as_type<float>(_1373);
            _1085 = as_type<float>(_1375);
            _1087 = as_type<float>(_1377);
            _1089 = as_type<float>(_1379);
            _1091 = as_type<float>(_1381);
            _1383 = as_type<float>(_1361);
            _1385 = as_type<float>(_1367);
            _1387 = as_type<float>(_1375);
        } while (_1093);
        _1389 = as_type<float>(_1369);
        _1391 = as_type<float>(_1377);
        _1393 = as_type<float>(_1359);
        _1011 = as_type<float>(_1363);
        _1395 = as_type<float>(_1371);
        _1397 = as_type<float>(_1379);
        _1399 = as_type<float>(_1373);
        _1401 = as_type<float>(_1381);
        _1013 = as_type<float>(_1365);
        _1403 = true;
    }
    else
    {
        _1383 = _1007;
        _1389 = _997;
        _1391 = _999;
        _1393 = _989;
        _1385 = _991;
        _1387 = _993;
        _1395 = _1003;
        _1397 = _1009;
        _1399 = _985;
        _1401 = _987;
    }
    _1403 = false;
    float _1405 = _1383;
    float _1407 = _1389;
    float _1409 = _1391;
    float _1411 = _1393;
    float _1413 = _1385;
    float _1415 = _1387;
    float _1417 = _1011;
    float _1419 = _1395;
    float _1421 = _1397;
    float _1423 = _1399;
    float _1425 = _1401;
    float _1427 = _1013;
    int _1429 = _1063 + 80;
    uint _1431 = uint(int(uint(_1429) >> uint(2)));
    uint _1433 = uint(int(uint(int(_1431)) >> uint(2)));
    int _1435 = int(_1431) & 3;
    float _1437 = (*spvDescriptorSet0.cp_c6)._m0[int(_1433)][_1435];
    int _1439 = int(_1431) + 1;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    int _1443 = _1439 & 3;
    float _1445 = (*spvDescriptorSet0.cp_c6)._m0[int(_1441)][_1443];
    int _1447 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1449 = _1447 + _70;
    int _1451 = _1063 + 64;
    uint _1453 = uint(int(uint(_1451) >> uint(2)));
    uint _1455 = uint(int(uint(int(_1453)) >> uint(2)));
    int _1457 = int(_1453) & 3;
    float _1459 = (*spvDescriptorSet0.cp_c6)._m0[int(_1455)][_1457];
    int _1461 = int(_1453) + 1;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    int _1465 = _1461 & 3;
    float _1467 = (*spvDescriptorSet0.cp_c6)._m0[int(_1463)][_1465];
    int _1469 = _1063 + 88;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    uint _1473 = uint(int(uint(int(_1471)) >> uint(2)));
    int _1475 = int(_1471) & 3;
    float _1477 = (*spvDescriptorSet0.cp_c6)._m0[int(_1473)][_1475];
    int _1479 = int(_1471) + 1;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    int _1483 = _1479 & 3;
    float _1485 = (*spvDescriptorSet0.cp_c6)._m0[int(_1481)][_1483];
    int _1487 = _1063 + 72;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    uint _1491 = uint(int(uint(int(_1489)) >> uint(2)));
    int _1493 = int(_1489) & 3;
    float _1495 = (*spvDescriptorSet0.cp_c6)._m0[int(_1491)][_1493];
    int _1497 = int(_1489) + 1;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    int _1501 = _1497 & 3;
    float _1503 = (*spvDescriptorSet0.cp_c6)._m0[int(_1499)][_1501];
    int _1505 = _1063 + 96;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    uint _1509 = uint(int(uint(int(_1507)) >> uint(2)));
    int _1511 = int(_1507) & 3;
    float _1513 = (*spvDescriptorSet0.cp_c6)._m0[int(_1509)][_1511];
    int _1515 = int(_1507) + 1;
    uint _1517 = uint(int(uint(_1515) >> uint(2)));
    int _1519 = _1515 & 3;
    float _1521 = (*spvDescriptorSet0.cp_c6)._m0[int(_1517)][_1519];
    int _1523 = _1063 + 104;
    uint _1525 = uint(int(uint(_1523) >> uint(2)));
    uint _1527 = uint(int(uint(int(_1525)) >> uint(2)));
    int _1529 = int(_1525) & 3;
    float _1531 = (*spvDescriptorSet0.cp_c6)._m0[int(_1527)][_1529];
    int _1533 = int(_1525) + 1;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    int _1537 = _1533 & 3;
    float _1539 = (*spvDescriptorSet0.cp_c6)._m0[int(_1535)][_1537];
    float _1541 = _1405 * _1437;
    float _1543 = _1407 * _1437;
    float _1545 = _1409 * _1437;
    int _1547 = _1063 + 16;
    uint _1549 = uint(int(uint(_1547) >> uint(2)));
    uint _1551 = uint(int(uint(int(_1549)) >> uint(2)));
    int _1553 = int(_1549) & 3;
    float _1555 = (*spvDescriptorSet0.cp_c6)._m0[int(_1551)][_1553];
    int _1557 = int(_1549) + 1;
    uint _1559 = uint(int(uint(_1557) >> uint(2)));
    int _1561 = _1557 & 3;
    float _1563 = (*spvDescriptorSet0.cp_c6)._m0[int(_1559)][_1561];
    float _1565 = _1405 * _1445;
    float _1567 = _1409 * _1445;
    float _1569 = fma(_1411, _1459, _1541);
    float _1571 = fma(_1413, _1459, _1543);
    float _1573 = fma(_1415, _1459, _1545);
    float _1575 = _1407 * _1445;
    int _1577 = _1063 + 32;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.cp_c6)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.cp_c6)._m0[int(_1589)][_1591];
    float _1595 = fma(_1411, _1467, _1565);
    float _1597 = fma(_1415, _1467, _1567);
    float _1599 = fma(_1413, _1467, _1575);
    float _1601 = _1405 * _1477;
    float _1603 = _1407 * _1477;
    float _1605 = _1409 * _1477;
    float _1607 = _1409 * _1485;
    int _1609 = _1063 + 48;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    uint _1613 = uint(int(uint(int(_1611)) >> uint(2)));
    int _1615 = int(_1611) & 3;
    float _1617 = (*spvDescriptorSet0.cp_c6)._m0[int(_1613)][_1615];
    int _1619 = int(_1611) + 1;
    uint _1621 = uint(int(uint(_1619) >> uint(2)));
    int _1623 = _1619 & 3;
    float _1625 = (*spvDescriptorSet0.cp_c6)._m0[int(_1621)][_1623];
    float _1627 = _1405 * _1485;
    float _1629 = _1407 * _1485;
    float _1631 = fma(_1411, _1495, _1601);
    float _1633 = fma(_1413, _1495, _1603);
    float _1635 = fma(_1411, _1503, _1627);
    float _1637 = fma(_1413, _1503, _1629);
    int _1639 = _1063 + 40;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    uint _1643 = uint(int(uint(int(_1641)) >> uint(2)));
    int _1645 = int(_1641) & 3;
    float _1647 = (*spvDescriptorSet0.cp_c6)._m0[int(_1643)][_1645];
    int _1649 = int(_1641) + 1;
    uint _1651 = uint(int(uint(_1649) >> uint(2)));
    int _1653 = _1649 & 3;
    float _1655 = (*spvDescriptorSet0.cp_c6)._m0[int(_1651)][_1653];
    float _1657 = fma(_1415, _1495, _1605);
    float _1659 = fma(_1415, _1503, _1607);
    float _1661 = fma(_1417, _1513, _1569);
    float _1663 = fma(_1419, _1513, _1571);
    float _1665 = fma(_1421, _1513, _1573);
    float _1667 = fma(_1419, _1521, _1599);
    int _1669 = _1063 + 24;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    uint _1673 = uint(int(uint(int(_1671)) >> uint(2)));
    int _1675 = int(_1671) & 3;
    float _1677 = (*spvDescriptorSet0.cp_c6)._m0[int(_1673)][_1675];
    int _1679 = int(_1671) + 1;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    int _1683 = _1679 & 3;
    float _1685 = (*spvDescriptorSet0.cp_c6)._m0[int(_1681)][_1683];
    float _1687 = fma(_1417, _1521, _1595);
    float _1689 = fma(_1421, _1521, _1597);
    float _1691 = fma(_1417, _1531, _1631);
    float _1693 = fma(_1419, _1539, _1637);
    float _1695 = fma(_1421, _1539, _1659);
    float _1697 = fma(_1417, _1539, _1635);
    int _1699 = _1063 + 56;
    uint _1701 = uint(int(uint(_1699) >> uint(2)));
    uint _1703 = uint(int(uint(int(_1701)) >> uint(2)));
    int _1705 = int(_1701) & 3;
    float _1707 = (*spvDescriptorSet0.cp_c6)._m0[int(_1703)][_1705];
    int _1709 = int(_1701) + 1;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    int _1713 = _1709 & 3;
    float _1715 = (*spvDescriptorSet0.cp_c6)._m0[int(_1711)][_1713];
    float _1717 = fma(_1419, _1531, _1633);
    float _1719 = _1693 + _1423;
    float _1721 = fma(_1421, _1531, _1657);
    float _1723 = _1695 + _1425;
    float _1725 = _1697 + _1427;
    float _1727 = _1663 * _1563;
    float _1729 = _1667 * _1563;
    float _1731 = _1717 * _1563;
    float _1733 = _1719 * _1563;
    float _1735 = fma(_1661, _1555, _1727);
    float _1737 = fma(_1687, _1555, _1729);
    float _1739 = fma(_1691, _1555, _1731);
    float _1741 = fma(_1725, _1555, _1733);
    float _1743 = _1663 * _1593;
    float _1745 = _1667 * _1593;
    float _1747 = _1717 * _1593;
    float _1749 = _1719 * _1593;
    float _1751 = fma(_1661, _1585, _1743);
    float _1753 = fma(_1687, _1585, _1745);
    float _1755 = fma(_1691, _1585, _1747);
    float _1757 = fma(_1725, _1585, _1749);
    float _1759 = _1663 * _1625;
    float _1761 = _1667 * _1625;
    float _1763 = _1717 * _1625;
    float _1765 = _1719 * _1625;
    float _1767 = fma(_1661, _1617, _1759);
    float _1769 = fma(_1687, _1617, _1761);
    float _1771 = fma(_1691, _1617, _1763);
    float _1773 = fma(_1725, _1617, _1765);
    float _1775 = fma(_1723, _1647, _1757);
    float _1777 = fma(_1665, _1647, _1751);
    float _1779 = fma(_1689, _1647, _1753);
    float _1781 = fma(_1721, _1647, _1755);
    float _1783 = _1775 + _1655;
    int _1785 = _1449 * 48;
    float _1787 = fma(_1723, _1677, _1741);
    float _1789 = fma(_1665, _1677, _1735);
    float _1791 = fma(_1689, _1677, _1737);
    float _1793 = fma(_1721, _1677, _1739);
    float _1795 = _1787 + _1685;
    int _1797 = _1785 + 16;
    int _1799 = _1785 + 32;
    float _1801 = fma(_1723, _1707, _1773);
    float _1803 = fma(_1665, _1707, _1767);
    float _1805 = fma(_1689, _1707, _1769);
    float _1807 = fma(_1721, _1707, _1771);
    float _1809 = _1801 + _1715;
    int _1811 = _1785 + 48;
    uint _1813 = uint(int(uint(_1797) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1813)] = as_type<uint>(_1789);
    int _1815 = _1797 + 4;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1817)] = as_type<uint>(_1791);
    int _1819 = _1797 + 8;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1821)] = as_type<uint>(_1793);
    int _1823 = _1797 + 12;
    uint _1825 = uint(int(uint(_1823) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1825)] = as_type<uint>(_1795);
    uint _1827 = uint(int(uint(_1799) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1827)] = as_type<uint>(_1777);
    int _1829 = _1799 + 4;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1831)] = as_type<uint>(_1779);
    int _1833 = _1799 + 8;
    uint _1835 = uint(int(uint(_1833) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1835)] = as_type<uint>(_1781);
    int _1837 = _1799 + 12;
    uint _1839 = uint(int(uint(_1837) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1839)] = as_type<uint>(_1783);
    uint _1841 = uint(int(uint(_1811) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1841)] = as_type<uint>(_1803);
    int _1843 = _1811 + 4;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1845)] = as_type<uint>(_1805);
    int _1847 = _1811 + 8;
    uint _1849 = uint(int(uint(_1847) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1849)] = as_type<uint>(_1807);
    int _1851 = _1811 + 12;
    uint _1853 = uint(int(uint(_1851) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1853)] = as_type<uint>(_1809);
}

