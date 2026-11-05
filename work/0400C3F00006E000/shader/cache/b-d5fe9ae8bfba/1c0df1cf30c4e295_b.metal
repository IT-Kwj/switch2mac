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
int _58(thread const int& _4674, thread const int& _4675, constant _10& support_buffer)
{
    int _4678 = 1 + _4675;
    float _4680 = support_buffer._m5[_4678].x;
    bool _4682 = _4680 == 1.0;
    if (_4682)
    {
        return _4674;
    }
    float _4684 = float(_4674);
    float _4686 = _4684 * _4680;
    int _4688 = int(_4686);
    return _4688;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4366, thread const int& _4367, thread const int& _4368, thread const int& _4369, thread int& _4370, thread int& _4371, thread int& _4372, thread int& _4373, thread int& _4374, thread int& _4375)
{
    float _4378 = as_type<float>(_4368) + 0.0;
    bool _4380 = _4378 != 0.0;
    bool _4382 = isnan(_4378);
    bool _4384 = _4380 || _4382;
    bool _4386 = isnan(0.0);
    bool _4388 = _4384 || _4386;
    int _4390 = _4366;
    int _4392 = _4367;
    int _4394 = _4368;
    int _4396 = _4388 ? (-1) : 0;
    if (!_4388)
    {
        float _4398 = as_type<float>(_4368) * 1.0;
        _4390 = as_type<int>(_4398);
    }
    int _4400 = _4390;
    bool _4402 = !_4388;
    int _4404 = _4400;
    int _4406 = _4400;
    if (!_4402)
    {
        float _4408 = as_type<float>(_4368) + 0.0;
        bool _4410 = _4408 >= 0.0;
        bool _4412 = isnan(_4408);
        bool _4414 = _4410 || _4412;
        bool _4416 = isnan(0.0);
        bool _4418 = _4414 || _4416;
        _4396 = _4418 ? (-1) : 0;
        if (!_4418)
        {
            _4404 = 2147483647;
        }
        int _4420 = _4404;
        bool _4422 = !_4418;
        int _4424 = _4420;
        _4406 = _4420;
        if (!_4422)
        {
            float _4426 = as_type<float>(_4368) + 0.0;
            bool _4428 = _4426 > as_type<float>(0x7f800000u /* inf */);
            bool _4430 = isnan(_4426);
            bool _4432 = _4428 || _4430;
            bool _4434 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4436 = _4432 || _4434;
            _4396 = _4436 ? (-1) : 0;
            if (_4436)
            {
                float _4438 = as_type<float>(_4368) + 1.0;
                _4424 = as_type<int>(_4438);
            }
            int _4440 = _4424;
            int _4442 = _4440;
            _4406 = _4440;
            if (!_4436)
            {
                float _4444 = 0.0 + as_type<float>(_4368);
                bool _4446 = _4444 != as_type<float>(0x7f800000u /* inf */);
                bool _4448 = isnan(_4444);
                bool _4450 = _4446 || _4448;
                bool _4452 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4454 = _4450 || _4452;
                _4396 = _4454 ? (-1) : 0;
                if (!_4454)
                {
                    _4442 = _4368;
                }
                int _4456 = _4442;
                bool _4458 = !_4454;
                _4406 = _4456;
                if (!_4458)
                {
                    float _4460 = as_type<float>(_4368) * 18446744073709551616.0;
                    float _4462 = rsqrt(_4460);
                    float _4464 = _4460 * _4462;
                    float _4466 = _4462 * 0.5;
                    float _4468 = -_4464;
                    float _4470 = 0.0 + _4468;
                    float _4472 = fma(_4466, _4470, 0.5);
                    float _4474 = fma(_4464, _4472, _4464);
                    float _4476 = -_4474;
                    float _4478 = 0.0 + _4476;
                    float _4480 = fma(_4474, _4478, _4460);
                    float _4482 = fma(_4466, _4480, _4474);
                    float _4484 = _4482 * 2.3283064365386962890625e-10;
                    _4406 = as_type<int>(_4484);
                    _4392 = as_type<int>(_4474);
                    _4394 = as_type<int>(_4470);
                }
            }
        }
    }
    int _4486 = _4406;
    int _4488 = _4392;
    int _4490 = _4394;
    int _4492 = _4396;
    _4370 = _4369;
    _4371 = 0;
    _4372 = _4486;
    _4373 = _4488;
    _4374 = _4490;
    _4375 = _4492;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4709, thread const int& _4710, thread const int& _4711, thread int& _4712, thread uint& gl_SubgroupInvocationID)
{
    int _4715 = _4711 & 31;
    uint _4717 = uint(int(uint(_4711) >> uint(8)));
    int _4719 = int(_4717) & 31;
    float _4721 = as_type<float>(gl_SubgroupInvocationID);
    int _4723 = as_type<int>(_4721) & _4719;
    int _4725 = ~_4719;
    int _4727 = _4715 & _4725;
    int _4729 = _4727 | _4723;
    int _4731 = ~_4719;
    int _4733 = _4710 & _4731;
    int _4735 = _4733 | _4723;
    bool _4737 = uint(_4735) <= uint(_4729);
    _4712 = _4737 ? (-1) : 0;
    float _4739 = spvSubgroupShuffle(as_type<float>(_4709), uint(_4735));
    uint _4741 = uint(_4737 ? as_type<int>(_4739) : _4709);
    return int(_4741);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _893 = false;
    bool _591 = false;
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
        int3 _2054 = int3(_185, _191, as_type<int>(_153));
        float3 _195 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2054.xy), uint(_2054.z), 0).xyz;
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
        int3 _2082 = int3(_219, _225, 0);
        float3 _227 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2082.xy), uint(_2082.z), 0).xyz;
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
        int3 _2113 = int3(_251, _257, as_type<int>(_171));
        float3 _259 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2113.xy), uint(_2113.z), 0).xyz;
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
        int3 _2142 = int3(_283, _289, as_type<int>(_173));
        float3 _291 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2142.xy), uint(_2142.z), 0).xyz;
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
        _329 = _267;
        _333 = _269;
        _349 = _271;
    }
    float _357 = _341;
    float _359 = _343;
    float _361 = _355;
    float _363 = _317;
    float _365 = _319;
    float _367 = _327;
    float _369 = _329;
    float _371 = _333;
    float _373 = _349;
    bool _375 = !_127;
    float _377 = _363;
    float _379 = _373;
    float _381 = _371;
    float _383 = _369;
    float _871;
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
        float _385 = _357 * 0.5;
        float _387 = _359 * 0.5;
        float _389 = _207 * 0.5;
        float _391 = _205 * 0.5;
        float _393 = _385 * 0.15915493667125701904296875;
        float _395 = _387 * 0.15915493667125701904296875;
        float _397 = _361 * 0.5;
        float _399 = _389 * 0.15915493667125701904296875;
        float _401 = _391 * 0.15915493667125701904296875;
        float _403 = _393 * 6.283185482025146484375;
        float _405 = cos(_403);
        float _407 = _203 * 0.5;
        float _409 = _397 * 0.15915493667125701904296875;
        float _411 = _407 * 0.15915493667125701904296875;
        float _413 = _395 * 6.283185482025146484375;
        float _415 = cos(_413);
        float _417 = _395 * 6.283185482025146484375;
        float _419 = sin(_417);
        float _421 = _393 * 6.283185482025146484375;
        float _423 = sin(_421);
        float _425 = _405 * _415;
        float _427 = _399 * 6.283185482025146484375;
        float _429 = cos(_427);
        float _431 = _405 * _419;
        float _433 = _401 * 6.283185482025146484375;
        float _435 = cos(_433);
        float _437 = _423 * _419;
        float _439 = _415 * _423;
        float _441 = _401 * 6.283185482025146484375;
        float _443 = sin(_441);
        float _445 = _399 * 6.283185482025146484375;
        float _447 = sin(_445);
        float _449 = _429 * _435;
        float _451 = _409 * 6.283185482025146484375;
        float _453 = sin(_451);
        float _455 = _429 * _443;
        float _457 = _411 * 6.283185482025146484375;
        float _459 = sin(_457);
        float _461 = _447 * _443;
        float _463 = _435 * _447;
        float _465 = _409 * 6.283185482025146484375;
        float _467 = cos(_465);
        float _469 = _453 * _439;
        float _471 = _453 * _437;
        float _473 = _411 * 6.283185482025146484375;
        float _475 = cos(_473);
        float _477 = _459 * _463;
        float _479 = fma(_467, _431, _469);
        float _481 = _467 * _437;
        float _483 = _453 * _431;
        float _485 = _459 * _461;
        float _487 = -_481;
        float _489 = fma(_453, _425, _487);
        float _491 = _475 * _461;
        float _493 = fma(_475, _455, _477);
        float _495 = _459 * _455;
        float _497 = -_483;
        float _499 = fma(_467, _439, _497);
        float _501 = -_491;
        float _503 = fma(_459, _449, _501);
        float _505 = _479 * _493;
        float _507 = -_495;
        float _509 = fma(_475, _463, _507);
        float _511 = fma(_467, _425, _471);
        float _513 = fma(_475, _449, _485);
        float _515 = fma(_489, _503, _505);
        float _517 = fma(_499, _509, _515);
        float _519 = fma(_511, _513, _517);
        float _521 = precise::max(_519, -1.0);
        float _523 = precise::min(_521, 1.0);
        bool _525 = _523 >= 0.0;
        bool _527 = isnan(_523);
        bool _529 = _525 || _527;
        bool _531 = isnan(0.0);
        bool _533 = _529 || _531;
        bool _535 = !_533;
        float _537 = -_523;
        float _539 = _535 ? _537 : _523;
        bool _541 = _539 < 0.0;
        float _543 = float(_541);
        float _545 = abs(_539);
        float _547 = -_545;
        float _549 = _547 + 1.0;
        float _551 = abs(_539);
        float _553 = fma(_551, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _555 = as_type<int>(_549) + (-218103808);
        float _557 = abs(_539);
        float _559 = fma(_557, _553, -0.212114393711090087890625);
        bool _561 = uint(_555) >= 1920991232u;
        float _563 = abs(_539);
        float _565 = fma(_563, _559, 1.570728778839111328125);
        bool _567 = !_561;
        float _589;
        if (!_567)
        {
            int _569 = as_type<int>(_449);
            int _571 = as_type<int>(_439);
            int _573 = as_type<int>(_549);
            int _575 = 1824;
            int _577;
            int _579;
            int _581;
            int _583;
            int _585;
            int _587;
            _56(_569, _571, _573, _575, _577, _579, _581, _583, _585, _587);
            _589 = as_type<float>(_581);
            _591 = true;
        }
        else
        {
            float _593 = rsqrt(_549);
            float _595 = _549 * _593;
            float _597 = _593 * 0.5;
            float _599 = -_595;
            float _601 = 0.0 + _599;
            float _603 = fma(_597, _601, 0.5);
            float _605 = fma(_595, _603, _595);
            float _607 = -_605;
            float _609 = 0.0 + _607;
            float _611 = fma(_605, _609, _549);
            float _613 = fma(_597, _611, _605);
            _589 = _613;
        }
        _591 = false;
        float _615 = _589;
        int _617 = _103 + 8;
        uint _619 = uint(int(uint(_617) >> uint(2)));
        uint _621 = uint(int(uint(int(_619)) >> uint(2)));
        int _623 = int(_619) & 3;
        float _625 = (*spvDescriptorSet0.cp_c5)._m0[int(_621)][_623];
        int _627 = _70;
        int _629 = 0;
        int _631 = _58(_627, _629, (*spvDescriptorSet0.support_buffer));
        int _633 = as_type<int>(_625);
        int _635 = 0;
        int _637 = _58(_633, _635, (*spvDescriptorSet0.support_buffer));
        int3 _2549 = int3(_631, _637, 0);
        float3 _639 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2549.xy), uint(_2549.z), 0).xyz;
        float _641 = _639.x;
        float _643 = _639.y;
        float _645 = _639.z;
        int _647 = _70;
        int _649 = 0;
        int _651 = _58(_647, _649, (*spvDescriptorSet0.support_buffer));
        int _653 = as_type<int>(_625);
        int _655 = 0;
        int _657 = _58(_653, _655, (*spvDescriptorSet0.support_buffer));
        int3 _2567 = int3(_651, _657, 2);
        float3 _659 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2567.xy), uint(_2567.z), 0).xyz;
        float _661 = _659.x;
        float _663 = _659.y;
        float _665 = _659.z;
        float _667 = _565 * _615;
        float _669 = _543 * 2.0;
        float _671 = -_669;
        float _673 = fma(_667, _671, _667);
        float _675 = fma(_543, 3.1415927410125732421875, _673);
        float _677 = _675 * 0.15915493667125701904296875;
        float _679 = _677 * 6.283185482025146484375;
        float _681 = sin(_679);
        float _683 = abs(_681);
        bool _685 = _683 >= 0.001000000047497451305389404296875;
        bool _687 = isnan(_683);
        bool _689 = _685 || _687;
        bool _691 = isnan(0.001000000047497451305389404296875);
        bool _693 = _689 || _691;
        float _695 = _543;
        float _697 = _669;
        float _699 = _673;
        if (!_693)
        {
            int _701 = _103 + 28;
            uint _703 = uint(int(uint(_701) >> uint(2)));
            uint _705 = uint(int(uint(int(_703)) >> uint(2)));
            int _707 = int(_703) & 3;
            float _709 = (*spvDescriptorSet0.cp_c5)._m0[int(_705)][_707];
            _695 = _709;
        }
        float _711 = _695;
        float _713 = _711;
        if (!_693)
        {
            float _715 = -_711;
            float _717 = _715 + 1.0;
            _697 = _717;
        }
        float _719 = _697;
        float _721 = _719;
        if (!_693)
        {
            _699 = _711;
        }
        float _723 = _699;
        bool _725 = !_693;
        float _727 = _723;
        if (!_725)
        {
            int _729 = _103 + 28;
            uint _731 = uint(int(uint(_729) >> uint(2)));
            uint _733 = uint(int(uint(int(_731)) >> uint(2)));
            int _735 = int(_731) & 3;
            float _737 = (*spvDescriptorSet0.cp_c5)._m0[int(_733)][_735];
            float _739 = 1.0 / _681;
            float _741 = _675 * _737;
            float _743 = _741 * 0.15915493667125701904296875;
            float _745 = -_741;
            float _747 = _675 + _745;
            float _749 = _747 * 0.15915493667125701904296875;
            float _751 = _743 * 6.283185482025146484375;
            float _753 = sin(_751);
            float _755 = _749 * 6.283185482025146484375;
            float _757 = sin(_755);
            float _759 = _753 * _739;
            float _761 = _757 * _739;
            _727 = _759;
            _713 = _737;
            _721 = _761;
        }
        float _763 = _727;
        float _765 = _713;
        float _767 = _721;
        bool _769 = !_533;
        float _771 = -_763;
        float _773 = _769 ? _771 : _763;
        int _775 = _103 + 20;
        uint _777 = uint(int(uint(_775) >> uint(2)));
        uint _779 = uint(int(uint(int(_777)) >> uint(2)));
        int _781 = int(_777) & 3;
        float _783 = (*spvDescriptorSet0.cp_c5)._m0[int(_779)][_781];
        float _785 = _641 * _765;
        float _787 = _643 * _765;
        float _789 = _513 * _773;
        float _791 = _493 * _773;
        float _793 = _503 * _773;
        float _795 = _509 * _773;
        float _797 = fma(_511, _767, _789);
        float _799 = fma(_479, _767, _791);
        float _801 = fma(_489, _767, _793);
        float _803 = fma(_499, _767, _795);
        float _805 = _797 * 2.0;
        float _807 = _799 * _799;
        float _809 = _801 * 2.0;
        float _811 = _801 * _801;
        float _813 = _803 * _805;
        float _815 = _799 * _805;
        float _817 = _801 * _805;
        float _819 = fma(_811, -2.0, 1.0);
        float _821 = -_813;
        float _823 = fma(_799, _809, _821);
        float _825 = fma(_799, _809, _813);
        float _827 = _799 * 2.0;
        float _829 = _803 * _803;
        float _831 = fma(_807, -2.0, 1.0);
        float _833 = fma(_363, _783, _785);
        float _835 = -_817;
        float _837 = fma(_803, _827, _835);
        float _839 = fma(_803, _827, _817);
        float _841 = fma(_365, _783, _787);
        float _843 = _645 * _765;
        float _845 = _661 * _765;
        float _847 = _663 * _765;
        float _849 = _665 * _765;
        float _851 = fma(_803, _809, _815);
        float _853 = -_815;
        float _855 = fma(_803, _809, _853);
        float _857 = fma(_829, -2.0, _831);
        float _859 = fma(_829, -2.0, _819);
        float _861 = fma(_807, -2.0, _819);
        float _863 = fma(_367, _783, _843);
        float _865 = fma(_369, _783, _845);
        float _867 = fma(_371, _783, _847);
        float _869 = fma(_373, _783, _849);
        _377 = _833;
        _871 = _857;
        _873 = _825;
        _875 = _855;
        _877 = _841;
        _879 = _859;
        _881 = _823;
        _883 = _839;
        _885 = _863;
        _887 = _851;
        _889 = _837;
        _891 = _861;
        _379 = _869;
        _381 = _867;
        _383 = _865;
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
        float _937 = -_919;
        float _939 = _937 + (-0.0);
        float _941 = _907 * _927;
        float _943 = _927 * _915;
        float _945 = _911 * _927;
        float _947 = _903 * _927;
        float _949 = -_921;
        float _951 = fma(_915, _933, _949);
        float _953 = fma(_911, _933, _929);
        float _955 = -_931;
        float _957 = fma(_919, _921, _955);
        _871 = _943;
        _873 = _945;
        _875 = _939;
        _877 = _365;
        _879 = _953;
        _881 = _951;
        _883 = _947;
        _885 = _367;
        _887 = _935;
        _889 = _957;
        _891 = _941;
    }
    _893 = false;
    float _959 = _377;
    float _961 = _871;
    float _963 = _873;
    float _965 = _875;
    float _967 = _877;
    float _969 = _879;
    float _971 = _881;
    float _973 = _883;
    float _975 = _885;
    float _977 = _887;
    float _979 = _889;
    float _981 = _891;
    float _983 = _379;
    float _985 = _381;
    float _987 = _383;
    bool _989 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _991 = _959 * _961;
    float _993 = _959 * _963;
    float _995 = _959 * _965;
    float _997 = _967 * _969;
    float _999 = _967 * _971;
    float _1001 = _967 * _973;
    float _1003 = _975 * _977;
    float _1005 = _975 * _979;
    float _1007 = _975 * _981;
    int _1009 = _70 * 112;
    bool _1011 = !_989;
    float _1013 = _991;
    float _1015 = _999;
    float _1017 = _1003;
    float _1019 = _987;
    float _1021 = _993;
    float _1023 = _997;
    float _1025 = _1005;
    float _1027 = _985;
    float _1029 = _995;
    float _1031 = _1001;
    float _1033 = _1007;
    float _1035 = _983;
    if (!_1011)
    {
        int _1037 = 0;
        float _1039 = _991;
        float _1041 = _999;
        float _1043 = _1003;
        float _1045 = _987;
        float _1047 = _993;
        float _1049 = _997;
        float _1051 = _1005;
        float _1053 = _985;
        float _1055 = _995;
        float _1057 = _1001;
        float _1059 = _1007;
        float _1061 = _983;
        bool _1063;
        int _1111;
        int _1121;
        int _1131;
        int _1141;
        int _1151;
        int _1161;
        int _1171;
        int _1181;
        int _1191;
        int _1201;
        int _1211;
        int _1221;
        float _1329;
        float _1331;
        float _1333;
        int _1335;
        float _1337;
        int _1339;
        int _1341;
        int _1343;
        int _1345;
        float _1347;
        float _1349;
        float _1351;
        do
        {
            int _1065 = _1037;
            float _1067 = _1039;
            float _1069 = _1041;
            float _1071 = _1043;
            int _1073 = as_type<int>(_1045);
            float _1075 = _1047;
            int _1077 = as_type<int>(_1049);
            int _1079 = as_type<int>(_1051);
            int _1081 = as_type<int>(_1053);
            int _1083 = as_type<int>(_1055);
            float _1085 = _1057;
            float _1087 = _1059;
            float _1089 = _1061;
            uint _1091 = uint(int(uint(_1009) >> uint(2)));
            uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
            int _1095 = int(_1091) & 3;
            float _1097 = (*spvDescriptorSet0.cp_c6)._m0[int(_1093)][_1095];
            bool _1099 = _70 != 0;
            int _1101 = _1065 + 1;
            bool _1103 = uint(_1101) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1105 = as_type<int>(_1067);
            int _1107 = as_type<int>(_1097);
            int _1109 = 31;
            int _3117 = _60(_1105, _1107, _1109, _1111, gl_SubgroupInvocationID);
            int _1113 = _3117;
            int _1115 = as_type<int>(_1069);
            int _1117 = as_type<int>(_1097);
            int _1119 = 31;
            int _3122 = _60(_1115, _1117, _1119, _1121, gl_SubgroupInvocationID);
            int _1123 = _3122;
            int _1125 = as_type<int>(_1071);
            int _1127 = as_type<int>(_1097);
            int _1129 = 31;
            int _3127 = _60(_1125, _1127, _1129, _1131, gl_SubgroupInvocationID);
            int _1133 = _3127;
            int _1135 = _1073;
            int _1137 = as_type<int>(_1097);
            int _1139 = 31;
            int _3131 = _60(_1135, _1137, _1139, _1141, gl_SubgroupInvocationID);
            int _1143 = _3131;
            int _1145 = as_type<int>(_1075);
            int _1147 = as_type<int>(_1097);
            int _1149 = 31;
            int _3136 = _60(_1145, _1147, _1149, _1151, gl_SubgroupInvocationID);
            int _1153 = _3136;
            int _1155 = _1077;
            int _1157 = as_type<int>(_1097);
            int _1159 = 31;
            int _3140 = _60(_1155, _1157, _1159, _1161, gl_SubgroupInvocationID);
            int _1163 = _3140;
            int _1165 = _1079;
            int _1167 = as_type<int>(_1097);
            int _1169 = 31;
            int _3144 = _60(_1165, _1167, _1169, _1171, gl_SubgroupInvocationID);
            int _1173 = _3144;
            int _1175 = _1081;
            int _1177 = as_type<int>(_1097);
            int _1179 = 31;
            int _3148 = _60(_1175, _1177, _1179, _1181, gl_SubgroupInvocationID);
            int _1183 = _3148;
            int _1185 = _1083;
            int _1187 = as_type<int>(_1097);
            int _1189 = 31;
            int _3152 = _60(_1185, _1187, _1189, _1191, gl_SubgroupInvocationID);
            int _1193 = _3152;
            int _1195 = as_type<int>(_1085);
            int _1197 = as_type<int>(_1097);
            int _1199 = 31;
            int _3157 = _60(_1195, _1197, _1199, _1201, gl_SubgroupInvocationID);
            int _1203 = _3157;
            int _1205 = as_type<int>(_1087);
            int _1207 = as_type<int>(_1097);
            int _1209 = 31;
            int _3162 = _60(_1205, _1207, _1209, _1211, gl_SubgroupInvocationID);
            int _1213 = _3162;
            int _1215 = as_type<int>(_1089);
            int _1217 = as_type<int>(_1097);
            int _1219 = 31;
            int _3167 = _60(_1215, _1217, _1219, _1221, gl_SubgroupInvocationID);
            int _1223 = _3167;
            bool _1225 = !_1099;
            _1037 = _1101;
            float _1227 = _1067;
            float _1229 = _1069;
            float _1231 = _1071;
            int _1233 = _1073;
            float _1235 = _1075;
            int _1237 = _1077;
            int _1239 = _1079;
            int _1241 = _1081;
            int _1243 = _1083;
            float _1245 = _1085;
            float _1247 = _1087;
            float _1249 = _1089;
            if (!_1225)
            {
                float _1251 = as_type<float>(_1123) * _985;
                float _1253 = _993 * as_type<float>(_1123);
                float _1255 = _997 * as_type<float>(_1123);
                float _1257 = _1005 * as_type<float>(_1123);
                float _1259 = fma(as_type<float>(_1113), _987, _1251);
                float _1261 = _993 * as_type<float>(_1163);
                float _1263 = _997 * as_type<float>(_1163);
                float _1265 = _1005 * as_type<float>(_1163);
                float _1267 = as_type<float>(_1163) * _985;
                float _1269 = fma(_991, as_type<float>(_1113), _1253);
                float _1271 = fma(_999, as_type<float>(_1113), _1255);
                float _1273 = fma(_1003, as_type<float>(_1113), _1257);
                float _1275 = fma(_991, as_type<float>(_1153), _1261);
                float _1277 = fma(_999, as_type<float>(_1153), _1263);
                float _1279 = fma(_1003, as_type<float>(_1153), _1265);
                float _1281 = _993 * as_type<float>(_1203);
                float _1283 = as_type<float>(_1203) * _985;
                float _1285 = fma(as_type<float>(_1153), _987, _1267);
                float _1287 = _1005 * as_type<float>(_1203);
                float _1289 = _997 * as_type<float>(_1203);
                float _1291 = fma(_991, as_type<float>(_1193), _1281);
                float _1293 = fma(as_type<float>(_1193), _987, _1283);
                float _1295 = fma(_1003, as_type<float>(_1193), _1287);
                float _1297 = fma(_1007, as_type<float>(_1133), _1273);
                float _1299 = fma(_999, as_type<float>(_1193), _1289);
                float _1301 = fma(_995, as_type<float>(_1133), _1269);
                float _1303 = fma(_1001, as_type<float>(_1133), _1271);
                float _1305 = fma(_1001, as_type<float>(_1173), _1277);
                float _1307 = fma(as_type<float>(_1133), _983, _1259);
                float _1309 = fma(_995, as_type<float>(_1173), _1275);
                float _1311 = fma(_1007, as_type<float>(_1173), _1279);
                float _1313 = fma(as_type<float>(_1173), _983, _1285);
                float _1315 = fma(as_type<float>(_1213), _983, _1293);
                float _1317 = fma(_1001, as_type<float>(_1213), _1299);
                float _1319 = fma(_995, as_type<float>(_1213), _1291);
                float _1321 = fma(_1007, as_type<float>(_1213), _1295);
                float _1323 = as_type<float>(_1143) + _1307;
                float _1325 = as_type<float>(_1183) + _1313;
                float _1327 = as_type<float>(_1223) + _1315;
                _1227 = _1301;
                _1229 = _1303;
                _1231 = _1297;
                _1233 = as_type<int>(_1323);
                _1235 = _1309;
                _1237 = as_type<int>(_1305);
                _1239 = as_type<int>(_1311);
                _1241 = as_type<int>(_1325);
                _1243 = as_type<int>(_1319);
                _1245 = _1317;
                _1247 = _1321;
                _1249 = _1327;
            }
            _1329 = _1227;
            _1331 = _1229;
            _1333 = _1231;
            _1335 = _1233;
            _1337 = _1235;
            _1339 = _1237;
            _1341 = _1239;
            _1343 = _1241;
            _1345 = _1243;
            _1347 = _1245;
            _1349 = _1247;
            _1351 = _1249;
            _1063 = !_1103;
            _1039 = _1329;
            _1041 = _1331;
            _1043 = _1333;
            _1045 = as_type<float>(_1335);
            _1047 = _1337;
            _1049 = as_type<float>(_1339);
            _1051 = as_type<float>(_1341);
            _1053 = as_type<float>(_1343);
            _1055 = as_type<float>(_1345);
            _1057 = _1347;
            _1059 = _1349;
            _1061 = _1351;
        } while (_1063);
        _1013 = _1329;
        _1015 = _1331;
        _1017 = _1333;
        _1019 = as_type<float>(_1335);
        _1021 = _1337;
        _1023 = as_type<float>(_1339);
        _1025 = as_type<float>(_1341);
        _1027 = as_type<float>(_1343);
        _1029 = as_type<float>(_1345);
        _1031 = _1347;
        _1033 = _1349;
        _1035 = _1351;
    }
    float _1353 = _1013;
    float _1355 = _1015;
    float _1357 = _1017;
    float _1359 = _1019;
    float _1361 = _1021;
    float _1363 = _1023;
    float _1365 = _1025;
    float _1367 = _1027;
    float _1369 = _1029;
    float _1371 = _1031;
    float _1373 = _1033;
    float _1375 = _1035;
    int _1377 = _1009 + 80;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.cp_c6)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.cp_c6)._m0[int(_1389)][_1391];
    bool _1395 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1397 = _1009 + 64;
    uint _1399 = uint(int(uint(_1397) >> uint(2)));
    uint _1401 = uint(int(uint(int(_1399)) >> uint(2)));
    int _1403 = int(_1399) & 3;
    float _1405 = (*spvDescriptorSet0.cp_c6)._m0[int(_1401)][_1403];
    int _1407 = int(_1399) + 1;
    uint _1409 = uint(int(uint(_1407) >> uint(2)));
    int _1411 = _1407 & 3;
    float _1413 = (*spvDescriptorSet0.cp_c6)._m0[int(_1409)][_1411];
    int _1415 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1417 = _1415 + _70;
    int _1419 = _1009 + 88;
    uint _1421 = uint(int(uint(_1419) >> uint(2)));
    uint _1423 = uint(int(uint(int(_1421)) >> uint(2)));
    int _1425 = int(_1421) & 3;
    float _1427 = (*spvDescriptorSet0.cp_c6)._m0[int(_1423)][_1425];
    int _1429 = int(_1421) + 1;
    uint _1431 = uint(int(uint(_1429) >> uint(2)));
    int _1433 = _1429 & 3;
    float _1435 = (*spvDescriptorSet0.cp_c6)._m0[int(_1431)][_1433];
    int _1437 = _1009 + 72;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.cp_c6)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.cp_c6)._m0[int(_1449)][_1451];
    int _1455 = _1009 + 96;
    uint _1457 = uint(int(uint(_1455) >> uint(2)));
    uint _1459 = uint(int(uint(int(_1457)) >> uint(2)));
    int _1461 = int(_1457) & 3;
    float _1463 = (*spvDescriptorSet0.cp_c6)._m0[int(_1459)][_1461];
    int _1465 = int(_1457) + 1;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    int _1469 = _1465 & 3;
    float _1471 = (*spvDescriptorSet0.cp_c6)._m0[int(_1467)][_1469];
    int _1473 = _1009 + 104;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    uint _1477 = uint(int(uint(int(_1475)) >> uint(2)));
    int _1479 = int(_1475) & 3;
    float _1481 = (*spvDescriptorSet0.cp_c6)._m0[int(_1477)][_1479];
    int _1483 = int(_1475) + 1;
    uint _1485 = uint(int(uint(_1483) >> uint(2)));
    int _1487 = _1483 & 3;
    float _1489 = (*spvDescriptorSet0.cp_c6)._m0[int(_1485)][_1487];
    int _1491 = _1009 + 16;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
    int _1497 = int(_1493) & 3;
    float _1499 = (*spvDescriptorSet0.cp_c6)._m0[int(_1495)][_1497];
    int _1501 = int(_1493) + 1;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    int _1505 = _1501 & 3;
    float _1507 = (*spvDescriptorSet0.cp_c6)._m0[int(_1503)][_1505];
    if (!_1395)
    {
        int _1509 = _70 * 48;
        int _1511 = _1509 + 16;
        uint _1513 = uint(int(uint(_1509) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1513)] = as_type<uint>(_1353);
        int _1515 = _1509 + 4;
        uint _1517 = uint(int(uint(_1515) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1517)] = as_type<uint>(_1355);
        int _1519 = _1509 + 8;
        uint _1521 = uint(int(uint(_1519) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1521)] = as_type<uint>(_1357);
        int _1523 = _1509 + 12;
        uint _1525 = uint(int(uint(_1523) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1525)] = as_type<uint>(_1359);
        int _1527 = _1509 + 32;
        uint _1529 = uint(int(uint(_1511) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1529)] = as_type<uint>(_1361);
        int _1531 = _1511 + 4;
        uint _1533 = uint(int(uint(_1531) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1533)] = as_type<uint>(_1363);
        int _1535 = _1511 + 8;
        uint _1537 = uint(int(uint(_1535) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1537)] = as_type<uint>(_1365);
        int _1539 = _1511 + 12;
        uint _1541 = uint(int(uint(_1539) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1541)] = as_type<uint>(_1367);
        uint _1543 = uint(int(uint(_1527) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1543)] = as_type<uint>(_1369);
        int _1545 = _1527 + 4;
        uint _1547 = uint(int(uint(_1545) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1547)] = as_type<uint>(_1371);
        int _1549 = _1527 + 8;
        uint _1551 = uint(int(uint(_1549) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1551)] = as_type<uint>(_1373);
        int _1553 = _1527 + 12;
        uint _1555 = uint(int(uint(_1553) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1555)] = as_type<uint>(_1375);
    }
    float _1557 = _1371 * _1385;
    float _1559 = _1355 * _1385;
    float _1561 = _1363 * _1385;
    int _1563 = _1009 + 32;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    uint _1567 = uint(int(uint(int(_1565)) >> uint(2)));
    int _1569 = int(_1565) & 3;
    float _1571 = (*spvDescriptorSet0.cp_c6)._m0[int(_1567)][_1569];
    int _1573 = int(_1565) + 1;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    int _1577 = _1573 & 3;
    float _1579 = (*spvDescriptorSet0.cp_c6)._m0[int(_1575)][_1577];
    float _1581 = fma(_1369, _1405, _1557);
    float _1583 = _1355 * _1393;
    float _1585 = fma(_1353, _1405, _1559);
    float _1587 = fma(_1361, _1405, _1561);
    float _1589 = _1363 * _1393;
    float _1591 = fma(_1353, _1413, _1583);
    float _1593 = _1355 * _1427;
    float _1595 = _1355 * _1435;
    float _1597 = _1371 * _1393;
    int _1599 = _1009 + 48;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    uint _1603 = uint(int(uint(int(_1601)) >> uint(2)));
    int _1605 = int(_1601) & 3;
    float _1607 = (*spvDescriptorSet0.cp_c6)._m0[int(_1603)][_1605];
    int _1609 = int(_1601) + 1;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    int _1613 = _1609 & 3;
    float _1615 = (*spvDescriptorSet0.cp_c6)._m0[int(_1611)][_1613];
    float _1617 = _1363 * _1427;
    float _1619 = _1363 * _1435;
    float _1621 = fma(_1361, _1413, _1589);
    float _1623 = fma(_1369, _1413, _1597);
    float _1625 = _1371 * _1427;
    float _1627 = _1371 * _1435;
    float _1629 = fma(_1353, _1445, _1593);
    float _1631 = fma(_1353, _1453, _1595);
    float _1633 = fma(_1361, _1445, _1617);
    int _1635 = _1009 + 24;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    uint _1639 = uint(int(uint(int(_1637)) >> uint(2)));
    int _1641 = int(_1637) & 3;
    float _1643 = (*spvDescriptorSet0.cp_c6)._m0[int(_1639)][_1641];
    int _1645 = int(_1637) + 1;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    int _1649 = _1645 & 3;
    float _1651 = (*spvDescriptorSet0.cp_c6)._m0[int(_1647)][_1649];
    float _1653 = fma(_1361, _1453, _1619);
    float _1655 = fma(_1369, _1453, _1627);
    float _1657 = fma(_1369, _1445, _1625);
    float _1659 = fma(_1357, _1463, _1585);
    float _1661 = fma(_1365, _1489, _1653);
    float _1663 = fma(_1365, _1463, _1587);
    float _1665 = fma(_1373, _1463, _1581);
    int _1667 = _1009 + 40;
    uint _1669 = uint(int(uint(_1667) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.cp_c6)._m0[int(_1671)][_1673];
    int _1677 = int(_1669) + 1;
    uint _1679 = uint(int(uint(_1677) >> uint(2)));
    int _1681 = _1677 & 3;
    float _1683 = (*spvDescriptorSet0.cp_c6)._m0[int(_1679)][_1681];
    float _1685 = fma(_1357, _1471, _1591);
    float _1687 = fma(_1357, _1481, _1629);
    float _1689 = fma(_1357, _1489, _1631);
    float _1691 = fma(_1365, _1471, _1621);
    float _1693 = fma(_1365, _1481, _1633);
    float _1695 = fma(_1373, _1489, _1655);
    float _1697 = _1661 + _1367;
    int _1699 = _1009 + 56;
    uint _1701 = uint(int(uint(_1699) >> uint(2)));
    uint _1703 = uint(int(uint(int(_1701)) >> uint(2)));
    int _1705 = int(_1701) & 3;
    float _1707 = (*spvDescriptorSet0.cp_c6)._m0[int(_1703)][_1705];
    int _1709 = int(_1701) + 1;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    int _1713 = _1709 & 3;
    float _1715 = (*spvDescriptorSet0.cp_c6)._m0[int(_1711)][_1713];
    float _1717 = fma(_1373, _1471, _1623);
    float _1719 = fma(_1373, _1481, _1657);
    float _1721 = _1695 + _1375;
    float _1723 = _1689 + _1359;
    float _1725 = _1663 * _1507;
    float _1727 = _1691 * _1507;
    float _1729 = _1693 * _1507;
    float _1731 = _1697 * _1507;
    float _1733 = fma(_1659, _1499, _1725);
    float _1735 = fma(_1685, _1499, _1727);
    float _1737 = fma(_1687, _1499, _1729);
    float _1739 = fma(_1723, _1499, _1731);
    float _1741 = _1697 * _1579;
    float _1743 = _1663 * _1579;
    float _1745 = _1691 * _1579;
    float _1747 = _1693 * _1579;
    float _1749 = fma(_1723, _1571, _1741);
    float _1751 = fma(_1659, _1571, _1743);
    float _1753 = fma(_1685, _1571, _1745);
    float _1755 = fma(_1687, _1571, _1747);
    int _1757 = _1417 * 48;
    float _1759 = _1697 * _1615;
    float _1761 = _1663 * _1615;
    float _1763 = _1691 * _1615;
    float _1765 = _1693 * _1615;
    float _1767 = fma(_1723, _1607, _1759);
    float _1769 = fma(_1659, _1607, _1761);
    float _1771 = fma(_1685, _1607, _1763);
    float _1773 = fma(_1687, _1607, _1765);
    float _1775 = fma(_1721, _1643, _1739);
    float _1777 = fma(_1717, _1643, _1735);
    float _1779 = fma(_1665, _1643, _1733);
    float _1781 = fma(_1719, _1643, _1737);
    float _1783 = _1775 + _1651;
    float _1785 = fma(_1721, _1675, _1749);
    float _1787 = fma(_1665, _1675, _1751);
    float _1789 = fma(_1717, _1675, _1753);
    float _1791 = fma(_1719, _1675, _1755);
    float _1793 = _1785 + _1683;
    int _1795 = _1757 + 16;
    int _1797 = _1757 + 32;
    float _1799 = fma(_1721, _1707, _1767);
    float _1801 = fma(_1665, _1707, _1769);
    float _1803 = fma(_1717, _1707, _1771);
    float _1805 = fma(_1719, _1707, _1773);
    float _1807 = _1799 + _1715;
    int _1809 = _1757 + 48;
    uint _1811 = uint(int(uint(_1795) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1811)] = as_type<uint>(_1779);
    int _1813 = _1795 + 4;
    uint _1815 = uint(int(uint(_1813) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1815)] = as_type<uint>(_1777);
    int _1817 = _1795 + 8;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1819)] = as_type<uint>(_1781);
    int _1821 = _1795 + 12;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1823)] = as_type<uint>(_1783);
    uint _1825 = uint(int(uint(_1797) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1825)] = as_type<uint>(_1787);
    int _1827 = _1797 + 4;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1829)] = as_type<uint>(_1789);
    int _1831 = _1797 + 8;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1833)] = as_type<uint>(_1791);
    int _1835 = _1797 + 12;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1837)] = as_type<uint>(_1793);
    uint _1839 = uint(int(uint(_1809) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1839)] = as_type<uint>(_1801);
    int _1841 = _1809 + 4;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1843)] = as_type<uint>(_1803);
    int _1845 = _1809 + 8;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1847)] = as_type<uint>(_1805);
    int _1849 = _1809 + 12;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1851)] = as_type<uint>(_1807);
}

