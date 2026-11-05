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
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4631, thread const int& _4632, constant _10& support_buffer)
{
    int _4635 = 1 + _4632;
    float _4637 = support_buffer._m5[_4635].x;
    bool _4639 = _4637 == 1.0;
    if (_4639)
    {
        return _4631;
    }
    float _4641 = float(_4631);
    float _4643 = _4641 * _4637;
    int _4645 = int(_4643);
    return _4645;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4323, thread const int& _4324, thread const int& _4325, thread const int& _4326, thread int& _4327, thread int& _4328, thread int& _4329, thread int& _4330, thread int& _4331, thread int& _4332)
{
    float _4335 = as_type<float>(_4325) + 0.0;
    bool _4337 = _4335 != 0.0;
    bool _4339 = isnan(_4335);
    bool _4341 = _4337 || _4339;
    bool _4343 = isnan(0.0);
    bool _4345 = _4341 || _4343;
    int _4347 = _4323;
    int _4349 = _4324;
    int _4351 = _4325;
    int _4353 = _4345 ? (-1) : 0;
    if (!_4345)
    {
        float _4355 = as_type<float>(_4325) * 1.0;
        _4347 = as_type<int>(_4355);
    }
    int _4357 = _4347;
    bool _4359 = !_4345;
    int _4361 = _4357;
    int _4363 = _4357;
    if (!_4359)
    {
        float _4365 = as_type<float>(_4325) + 0.0;
        bool _4367 = _4365 >= 0.0;
        bool _4369 = isnan(_4365);
        bool _4371 = _4367 || _4369;
        bool _4373 = isnan(0.0);
        bool _4375 = _4371 || _4373;
        _4353 = _4375 ? (-1) : 0;
        if (!_4375)
        {
            _4361 = 2147483647;
        }
        int _4377 = _4361;
        bool _4379 = !_4375;
        int _4381 = _4377;
        _4363 = _4377;
        if (!_4379)
        {
            float _4383 = as_type<float>(_4325) + 0.0;
            bool _4385 = _4383 > as_type<float>(0x7f800000u /* inf */);
            bool _4387 = isnan(_4383);
            bool _4389 = _4385 || _4387;
            bool _4391 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4393 = _4389 || _4391;
            _4353 = _4393 ? (-1) : 0;
            if (_4393)
            {
                float _4395 = as_type<float>(_4325) + 1.0;
                _4381 = as_type<int>(_4395);
            }
            int _4397 = _4381;
            int _4399 = _4397;
            _4363 = _4397;
            if (!_4393)
            {
                float _4401 = 0.0 + as_type<float>(_4325);
                bool _4403 = _4401 != as_type<float>(0x7f800000u /* inf */);
                bool _4405 = isnan(_4401);
                bool _4407 = _4403 || _4405;
                bool _4409 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4411 = _4407 || _4409;
                _4353 = _4411 ? (-1) : 0;
                if (!_4411)
                {
                    _4399 = _4325;
                }
                int _4413 = _4399;
                bool _4415 = !_4411;
                _4363 = _4413;
                if (!_4415)
                {
                    float _4417 = as_type<float>(_4325) * 18446744073709551616.0;
                    float _4419 = rsqrt(_4417);
                    float _4421 = _4417 * _4419;
                    float _4423 = _4419 * 0.5;
                    float _4425 = -_4421;
                    float _4427 = 0.0 + _4425;
                    float _4429 = fma(_4423, _4427, 0.5);
                    float _4431 = fma(_4421, _4429, _4421);
                    float _4433 = -_4431;
                    float _4435 = 0.0 + _4433;
                    float _4437 = fma(_4431, _4435, _4417);
                    float _4439 = fma(_4423, _4437, _4431);
                    float _4441 = _4439 * 2.3283064365386962890625e-10;
                    _4363 = as_type<int>(_4441);
                    _4349 = as_type<int>(_4431);
                    _4351 = as_type<int>(_4417);
                }
            }
        }
    }
    int _4443 = _4363;
    int _4445 = _4349;
    int _4447 = _4351;
    int _4449 = _4353;
    _4327 = _4326;
    _4328 = 0;
    _4329 = _4443;
    _4330 = _4445;
    _4331 = _4447;
    _4332 = _4449;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4666, thread const int& _4667, thread const int& _4668, thread int& _4669, thread uint& gl_SubgroupInvocationID)
{
    int _4672 = _4668 & 31;
    uint _4674 = uint(int(uint(_4668) >> uint(8)));
    int _4676 = int(_4674) & 31;
    float _4678 = as_type<float>(gl_SubgroupInvocationID);
    int _4680 = as_type<int>(_4678) & _4676;
    int _4682 = ~_4676;
    int _4684 = _4672 & _4682;
    int _4686 = _4684 | _4680;
    int _4688 = ~_4676;
    int _4690 = _4667 & _4688;
    int _4692 = _4690 | _4680;
    bool _4694 = uint(_4692) <= uint(_4686);
    _4669 = _4694 ? (-1) : 0;
    float _4696 = spvSubgroupShuffle(as_type<float>(_4666), uint(_4692));
    uint _4698 = uint(_4694 ? as_type<int>(_4696) : _4666);
    return int(_4698);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1311 = false;
    bool _573 = false;
    float _64 = as_type<float>(gl_WorkGroupID.x);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    int _68 = as_type<int>(_64) << 6;
    int _70 = _68 + as_type<int>(_66);
    bool _74 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_74)
    {
        return;
    }
    int _76 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _79 = uint(int(uint(_76) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.cp_c5)._m0[int(_81)][_83];
    int _87 = int(_79) + 1;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    int _91 = _87 & 3;
    float _93 = (*spvDescriptorSet0.cp_c5)._m0[int(_89)][_91];
    int _95 = _76 + 8;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    uint _99 = uint(int(uint(int(_97)) >> uint(2)));
    int _101 = int(_97) & 3;
    float _103 = (*spvDescriptorSet0.cp_c5)._m0[int(_99)][_101];
    int _105 = int(_97) + 1;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    int _109 = _105 & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _70;
    int _115 = 0;
    int _117 = _58(_113, _115, (*spvDescriptorSet0.support_buffer));
    int _119 = as_type<int>(_85);
    int _121 = 0;
    int _123 = _58(_119, _121, (*spvDescriptorSet0.support_buffer));
    int3 _1914 = int3(_117, _123, 1);
    float3 _127 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1914.xy), uint(_1914.z), 0).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    int _135 = _70;
    int _137 = 0;
    int _139 = _58(_135, _137, (*spvDescriptorSet0.support_buffer));
    int _141 = as_type<int>(_93);
    int _143 = 0;
    int _145 = _58(_141, _143, (*spvDescriptorSet0.support_buffer));
    int3 _1932 = int3(_139, _145, 1);
    float3 _147 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1932.xy), uint(_1932.z), 0).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    int _155 = _70;
    int _157 = 0;
    int _159 = _58(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = as_type<int>(_85);
    int _163 = 0;
    int _165 = _58(_161, _163, (*spvDescriptorSet0.support_buffer));
    int3 _1950 = int3(_159, _165, 0);
    float3 _167 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1950.xy), uint(_1950.z), 0).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    int _175 = _70;
    int _177 = 0;
    int _179 = _58(_175, _177, (*spvDescriptorSet0.support_buffer));
    int _181 = as_type<int>(_93);
    int _183 = 0;
    int _185 = _58(_181, _183, (*spvDescriptorSet0.support_buffer));
    int3 _1968 = int3(_179, _185, 0);
    float3 _187 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1968.xy), uint(_1968.z), 0).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    int _195 = _70;
    int _197 = 1;
    int _199 = _58(_195, _197, (*spvDescriptorSet0.support_buffer));
    int _201 = as_type<int>(_103);
    int _203 = 1;
    int _205 = _58(_201, _203, (*spvDescriptorSet0.support_buffer));
    int3 _1986 = int3(_199, _205, 1);
    float3 _207 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1986.xy), uint(_1986.z), 0).xyz;
    float _209 = _207.x;
    float _211 = _207.y;
    float _213 = _207.z;
    int _215 = _70;
    int _217 = 1;
    int _219 = _58(_215, _217, (*spvDescriptorSet0.support_buffer));
    int _221 = as_type<int>(_111);
    int _223 = 1;
    int _225 = _58(_221, _223, (*spvDescriptorSet0.support_buffer));
    int3 _2004 = int3(_219, _225, 1);
    float3 _227 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2004.xy), uint(_2004.z), 0).xyz;
    float _229 = _227.x;
    float _231 = _227.y;
    float _233 = _227.z;
    int _235 = _70;
    int _237 = 0;
    int _239 = _58(_235, _237, (*spvDescriptorSet0.support_buffer));
    int _241 = as_type<int>(_85);
    int _243 = 0;
    int _245 = _58(_241, _243, (*spvDescriptorSet0.support_buffer));
    int3 _2022 = int3(_239, _245, 2);
    float3 _247 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2022.xy), uint(_2022.z), 0).xyz;
    float _249 = _247.x;
    float _251 = _247.y;
    float _253 = _247.z;
    int _255 = _70;
    int _257 = 0;
    int _259 = _58(_255, _257, (*spvDescriptorSet0.support_buffer));
    int _261 = as_type<int>(_93);
    int _263 = 0;
    int _265 = _58(_261, _263, (*spvDescriptorSet0.support_buffer));
    int3 _2040 = int3(_259, _265, 2);
    float3 _267 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2040.xy), uint(_2040.z), 0).xyz;
    float _269 = _267.x;
    float _271 = _267.y;
    float _273 = _267.z;
    int _275 = _76 + 16;
    uint _277 = uint(int(uint(_275) >> uint(2)));
    uint _279 = uint(int(uint(int(_277)) >> uint(2)));
    int _281 = int(_277) & 3;
    float _283 = (*spvDescriptorSet0.cp_c5)._m0[int(_279)][_281];
    int _285 = _76 + 24;
    uint _287 = uint(int(uint(_285) >> uint(2)));
    uint _289 = uint(int(uint(int(_287)) >> uint(2)));
    int _291 = int(_287) & 3;
    float _293 = (*spvDescriptorSet0.cp_c5)._m0[int(_289)][_291];
    float _295 = -_133;
    float _297 = _295 + _153;
    float _299 = -_173;
    float _301 = _299 + _193;
    float _303 = fma(_297, _283, _133);
    float _305 = -_131;
    float _307 = _305 + _151;
    float _309 = _303 * 0.5;
    float _311 = fma(_307, _283, _131);
    float _313 = -_213;
    float _315 = _313 + _233;
    float _317 = _309 * 0.15915493667125701904296875;
    float _319 = -_129;
    float _321 = _319 + _149;
    float _323 = _311 * 0.5;
    float _325 = fma(_315, _293, _213);
    float _327 = _317 * 6.283185482025146484375;
    float _329 = sin(_327);
    float _331 = fma(_321, _283, _129);
    float _333 = _323 * 0.15915493667125701904296875;
    float _335 = -_211;
    float _337 = _335 + _231;
    float _339 = -_209;
    float _341 = _339 + _229;
    float _343 = _331 * 0.5;
    float _345 = _325 * 0.5;
    float _347 = fma(_337, _293, _211);
    float _349 = _333 * 6.283185482025146484375;
    float _351 = sin(_349);
    float _353 = _343 * 0.15915493667125701904296875;
    float _355 = fma(_341, _293, _209);
    float _357 = _347 * 0.5;
    float _359 = _345 * 0.15915493667125701904296875;
    float _361 = _355 * 0.5;
    float _363 = _333 * 6.283185482025146484375;
    float _365 = cos(_363);
    float _367 = _317 * 6.283185482025146484375;
    float _369 = cos(_367);
    float _371 = _329 * _351;
    float _373 = _353 * 6.283185482025146484375;
    float _375 = sin(_373);
    float _377 = _365 * _329;
    float _379 = _353 * 6.283185482025146484375;
    float _381 = cos(_379);
    float _383 = _369 * _365;
    float _385 = _369 * _351;
    float _387 = _375 * _371;
    float _389 = _375 * _377;
    float _391 = _359 * 6.283185482025146484375;
    float _393 = sin(_391);
    float _395 = _381 * _371;
    float _397 = fma(_381, _383, _387);
    float _399 = _361 * 0.15915493667125701904296875;
    float _401 = -_395;
    float _403 = fma(_375, _383, _401);
    float _405 = _375 * _385;
    float _407 = fma(_381, _385, _389);
    float _409 = -_169;
    float _411 = _409 + _189;
    float _413 = -_171;
    float _415 = _413 + _191;
    float _417 = _399 * 6.283185482025146484375;
    float _419 = sin(_417);
    float _421 = -_405;
    float _423 = fma(_381, _377, _421);
    float _425 = fma(_411, _283, _169);
    float _427 = fma(_415, _283, _171);
    float _429 = fma(_301, _283, _173);
    float _431 = _357 * 0.15915493667125701904296875;
    float _433 = _359 * 6.283185482025146484375;
    float _435 = cos(_433);
    float _437 = _431 * 6.283185482025146484375;
    float _439 = cos(_437);
    float _441 = _431 * 6.283185482025146484375;
    float _443 = sin(_441);
    float _445 = _399 * 6.283185482025146484375;
    float _447 = cos(_445);
    float _449 = _439 * _393;
    float _451 = _435 * _439;
    float _453 = _419 * _449;
    float _455 = _393 * _443;
    float _457 = _435 * _443;
    float _459 = _419 * _457;
    float _461 = _447 * _455;
    float _463 = fma(_447, _457, _453);
    float _465 = -_459;
    float _467 = fma(_447, _449, _465);
    float _469 = -_461;
    float _471 = fma(_419, _451, _469);
    float _473 = _407 * _463;
    float _475 = _419 * _455;
    float _477 = -_251;
    float _479 = _477 + _271;
    float _481 = fma(_403, _471, _473);
    float _483 = fma(_447, _451, _475);
    float _485 = -_253;
    float _487 = _485 + _273;
    float _489 = fma(_479, _283, _251);
    float _491 = fma(_423, _467, _481);
    float _493 = fma(_487, _283, _253);
    float _495 = fma(_397, _483, _491);
    float _497 = precise::max(_495, -1.0);
    float _499 = precise::min(_497, 1.0);
    bool _501 = _499 >= 0.0;
    bool _503 = isnan(_499);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    bool _511 = !_509;
    float _513 = -_499;
    float _515 = _511 ? _513 : _499;
    bool _517 = _515 < 0.0;
    float _519 = float(_517);
    float _521 = abs(_515);
    float _523 = -_521;
    float _525 = _523 + 1.0;
    float _527 = abs(_515);
    float _529 = fma(_527, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _531 = as_type<int>(_525) + (-218103808);
    float _533 = abs(_515);
    float _535 = fma(_533, _529, -0.212114393711090087890625);
    bool _537 = uint(_531) >= 1920991232u;
    float _539 = -_249;
    float _541 = _539 + _269;
    float _543 = abs(_515);
    float _545 = fma(_543, _535, 1.570728778839111328125);
    float _547 = fma(_541, _283, _249);
    bool _549 = !_537;
    float _571;
    if (!_549)
    {
        int _551 = as_type<int>(_269);
        int _553 = as_type<int>(_487);
        int _555 = as_type<int>(_525);
        int _557 = 1968;
        int _559;
        int _561;
        int _563;
        int _565;
        int _567;
        int _569;
        _56(_551, _553, _555, _557, _559, _561, _563, _565, _567, _569);
        _571 = as_type<float>(_563);
        _573 = true;
    }
    else
    {
        float _575 = rsqrt(_525);
        float _577 = _525 * _575;
        float _579 = _575 * 0.5;
        float _581 = -_577;
        float _583 = 0.0 + _581;
        float _585 = fma(_579, _583, 0.5);
        float _587 = fma(_577, _585, _577);
        float _589 = -_587;
        float _591 = 0.0 + _589;
        float _593 = fma(_587, _591, _525);
        float _595 = fma(_579, _593, _587);
        _571 = _595;
    }
    _573 = false;
    float _597 = _571;
    int _599 = _76 + 8;
    uint _601 = uint(int(uint(_599) >> uint(2)));
    uint _603 = uint(int(uint(int(_601)) >> uint(2)));
    int _605 = int(_601) & 3;
    float _607 = (*spvDescriptorSet0.cp_c5)._m0[int(_603)][_605];
    int _609 = int(_601) + 1;
    uint _611 = uint(int(uint(_609) >> uint(2)));
    int _613 = _609 & 3;
    float _615 = (*spvDescriptorSet0.cp_c5)._m0[int(_611)][_613];
    int _617 = _70;
    int _619 = 1;
    int _621 = _58(_617, _619, (*spvDescriptorSet0.support_buffer));
    int _623 = as_type<int>(_607);
    int _625 = 1;
    int _627 = _58(_623, _625, (*spvDescriptorSet0.support_buffer));
    int3 _2523 = int3(_621, _627, 0);
    float3 _629 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2523.xy), uint(_2523.z), 0).xyz;
    float _631 = _629.x;
    float _633 = _629.y;
    float _635 = _629.z;
    int _637 = _70;
    int _639 = 1;
    int _641 = _58(_637, _639, (*spvDescriptorSet0.support_buffer));
    int _643 = as_type<int>(_607);
    int _645 = 1;
    int _647 = _58(_643, _645, (*spvDescriptorSet0.support_buffer));
    int3 _2541 = int3(_641, _647, 2);
    float3 _649 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2541.xy), uint(_2541.z), 0).xyz;
    float _651 = _649.x;
    float _653 = _649.y;
    float _655 = _649.z;
    int _657 = _70;
    int _659 = 1;
    int _661 = _58(_657, _659, (*spvDescriptorSet0.support_buffer));
    int _663 = as_type<int>(_615);
    int _665 = 1;
    int _667 = _58(_663, _665, (*spvDescriptorSet0.support_buffer));
    int3 _2559 = int3(_661, _667, 0);
    float3 _669 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2559.xy), uint(_2559.z), 0).xyz;
    float _671 = _669.x;
    float _673 = _669.y;
    float _675 = _669.z;
    int _677 = _70;
    int _679 = 1;
    int _681 = _58(_677, _679, (*spvDescriptorSet0.support_buffer));
    int _683 = as_type<int>(_615);
    int _685 = 1;
    int _687 = _58(_683, _685, (*spvDescriptorSet0.support_buffer));
    int3 _2577 = int3(_681, _687, 2);
    float3 _689 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2577.xy), uint(_2577.z), 0).xyz;
    float _691 = _689.x;
    float _693 = _689.y;
    float _695 = _689.z;
    float _697 = _545 * _597;
    float _699 = _519 * 2.0;
    float _701 = -_699;
    float _703 = fma(_697, _701, _697);
    float _705 = fma(_519, 3.1415927410125732421875, _703);
    float _707 = _705 * 0.15915493667125701904296875;
    float _709 = _707 * 6.283185482025146484375;
    float _711 = sin(_709);
    float _713 = abs(_711);
    bool _715 = _713 >= 0.001000000047497451305389404296875;
    bool _717 = isnan(_713);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.001000000047497451305389404296875);
    bool _723 = _719 || _721;
    float _725 = _519;
    float _727 = _703;
    float _729 = _697;
    if (!_723)
    {
        int _731 = _76 + 28;
        uint _733 = uint(int(uint(_731) >> uint(2)));
        uint _735 = uint(int(uint(int(_733)) >> uint(2)));
        int _737 = int(_733) & 3;
        float _739 = (*spvDescriptorSet0.cp_c5)._m0[int(_735)][_737];
        _725 = _739;
    }
    float _741 = _725;
    float _743 = _741;
    if (!_723)
    {
        float _745 = -_741;
        float _747 = _745 + 1.0;
        _727 = _747;
    }
    float _749 = _727;
    float _751 = _749;
    if (!_723)
    {
        _729 = _741;
    }
    float _753 = _729;
    bool _755 = !_723;
    float _757 = _753;
    if (!_755)
    {
        int _759 = _76 + 28;
        uint _761 = uint(int(uint(_759) >> uint(2)));
        uint _763 = uint(int(uint(int(_761)) >> uint(2)));
        int _765 = int(_761) & 3;
        float _767 = (*spvDescriptorSet0.cp_c5)._m0[int(_763)][_765];
        float _769 = 1.0 / _711;
        float _771 = _705 * _767;
        float _773 = _771 * 0.15915493667125701904296875;
        float _775 = -_771;
        float _777 = _705 + _775;
        float _779 = _777 * 0.15915493667125701904296875;
        float _781 = _773 * 6.283185482025146484375;
        float _783 = sin(_781);
        float _785 = _779 * 6.283185482025146484375;
        float _787 = sin(_785);
        float _789 = _783 * _769;
        float _791 = _787 * _769;
        _757 = _789;
        _751 = _791;
        _743 = _767;
    }
    float _793 = _757;
    float _795 = _751;
    float _797 = _743;
    bool _799 = !_509;
    float _801 = -_793;
    float _803 = _799 ? _801 : _793;
    float _805 = -_635;
    float _807 = _805 + _675;
    float _809 = -_655;
    float _811 = _809 + _695;
    bool _813 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _815 = _471 * _803;
    float _817 = _483 * _803;
    float _819 = _467 * _803;
    float _821 = _463 * _803;
    float _823 = fma(_403, _795, _815);
    float _825 = fma(_397, _795, _817);
    int _827 = _76 + 24;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    uint _831 = uint(int(uint(int(_829)) >> uint(2)));
    int _833 = int(_829) & 3;
    float _835 = (*spvDescriptorSet0.cp_c5)._m0[int(_831)][_833];
    float _837 = fma(_423, _795, _819);
    float _839 = fma(_407, _795, _821);
    float _841 = _825 * 2.0;
    float _843 = _823 * 2.0;
    float _845 = _839 * 2.0;
    float _847 = _837 * _841;
    int _849 = _76 + 20;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    uint _853 = uint(int(uint(int(_851)) >> uint(2)));
    int _855 = int(_851) & 3;
    float _857 = (*spvDescriptorSet0.cp_c5)._m0[int(_853)][_855];
    float _859 = _839 * _841;
    float _861 = _823 * _841;
    float _863 = _823 * _823;
    float _865 = -_847;
    float _867 = fma(_839, _843, _865);
    float _869 = fma(_839, _843, _847);
    float _871 = fma(_837, _843, _859);
    float _873 = -_859;
    float _875 = fma(_837, _843, _873);
    float _877 = fma(_863, -2.0, 1.0);
    float _879 = _839 * _839;
    float _881 = -_631;
    float _883 = _881 + _671;
    float _885 = -_633;
    float _887 = _885 + _673;
    float _889 = -_861;
    float _891 = fma(_837, _845, _889);
    float _893 = fma(_837, _845, _861);
    float _895 = _837 * _837;
    float _897 = fma(_879, -2.0, 1.0);
    float _899 = fma(_887, _835, _633);
    float _901 = fma(_807, _835, _635);
    float _903 = fma(_883, _835, _631);
    float _905 = fma(_895, -2.0, _897);
    float _907 = _899 * _797;
    float _909 = _901 * _797;
    float _911 = _903 * _797;
    float _913 = fma(_811, _835, _655);
    float _915 = fma(_427, _857, _907);
    float _917 = fma(_429, _857, _909);
    float _919 = -_651;
    float _921 = _919 + _691;
    float _923 = -_653;
    float _925 = _923 + _693;
    float _927 = fma(_425, _857, _911);
    float _929 = fma(_895, -2.0, _877);
    float _931 = fma(_921, _835, _651);
    float _933 = fma(_925, _835, _653);
    float _935 = _869 * _927;
    float _937 = _905 * _927;
    float _939 = _875 * _927;
    float _941 = fma(_879, -2.0, _877);
    float _943 = _867 * _915;
    float _945 = _931 * _797;
    float _947 = _933 * _797;
    float _949 = _913 * _797;
    float _951 = _929 * _915;
    float _953 = _893 * _915;
    float _955 = _871 * _917;
    float _957 = _891 * _917;
    float _959 = _941 * _917;
    float _961 = fma(_547, _857, _945);
    float _963 = fma(_489, _857, _947);
    float _965 = fma(_493, _857, _949);
    int _967 = _70 * 112;
    bool _969 = !_813;
    float _971 = _937;
    float _973 = _943;
    float _975 = _955;
    float _977 = _961;
    float _979 = _935;
    float _981 = _951;
    float _983 = _957;
    float _985 = _939;
    float _987 = _953;
    float _989 = _959;
    float _991 = _965;
    float _1309;
    if (!_969)
    {
        int _993 = 0;
        float _995 = _937;
        float _997 = _943;
        float _999 = _955;
        float _1001 = _961;
        float _1003 = _935;
        float _1005 = _951;
        float _1007 = _957;
        float _1009 = _963;
        float _1011 = _939;
        float _1013 = _953;
        float _1015 = _959;
        float _1017 = _965;
        bool _1019;
        int _1067;
        int _1077;
        int _1087;
        int _1097;
        int _1107;
        int _1117;
        int _1127;
        int _1137;
        int _1147;
        int _1157;
        int _1167;
        int _1177;
        float _1285;
        float _1287;
        float _1289;
        int _1291;
        float _1293;
        int _1295;
        int _1297;
        int _1299;
        int _1301;
        float _1303;
        float _1305;
        float _1307;
        do
        {
            int _1021 = _993;
            float _1023 = _995;
            float _1025 = _997;
            float _1027 = _999;
            int _1029 = as_type<int>(_1001);
            float _1031 = _1003;
            int _1033 = as_type<int>(_1005);
            int _1035 = as_type<int>(_1007);
            int _1037 = as_type<int>(_1009);
            int _1039 = as_type<int>(_1011);
            float _1041 = _1013;
            float _1043 = _1015;
            float _1045 = _1017;
            uint _1047 = uint(int(uint(_967) >> uint(2)));
            uint _1049 = uint(int(uint(int(_1047)) >> uint(2)));
            int _1051 = int(_1047) & 3;
            float _1053 = (*spvDescriptorSet0.cp_c6)._m0[int(_1049)][_1051];
            bool _1055 = _70 != 0;
            int _1057 = _1021 + 1;
            bool _1059 = uint(_1057) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1061 = as_type<int>(_1023);
            int _1063 = as_type<int>(_1053);
            int _1065 = 31;
            int _3073 = _60(_1061, _1063, _1065, _1067, gl_SubgroupInvocationID);
            int _1069 = _3073;
            int _1071 = as_type<int>(_1025);
            int _1073 = as_type<int>(_1053);
            int _1075 = 31;
            int _3078 = _60(_1071, _1073, _1075, _1077, gl_SubgroupInvocationID);
            int _1079 = _3078;
            int _1081 = as_type<int>(_1027);
            int _1083 = as_type<int>(_1053);
            int _1085 = 31;
            int _3083 = _60(_1081, _1083, _1085, _1087, gl_SubgroupInvocationID);
            int _1089 = _3083;
            int _1091 = _1029;
            int _1093 = as_type<int>(_1053);
            int _1095 = 31;
            int _3087 = _60(_1091, _1093, _1095, _1097, gl_SubgroupInvocationID);
            int _1099 = _3087;
            int _1101 = as_type<int>(_1031);
            int _1103 = as_type<int>(_1053);
            int _1105 = 31;
            int _3092 = _60(_1101, _1103, _1105, _1107, gl_SubgroupInvocationID);
            int _1109 = _3092;
            int _1111 = _1033;
            int _1113 = as_type<int>(_1053);
            int _1115 = 31;
            int _3096 = _60(_1111, _1113, _1115, _1117, gl_SubgroupInvocationID);
            int _1119 = _3096;
            int _1121 = _1035;
            int _1123 = as_type<int>(_1053);
            int _1125 = 31;
            int _3100 = _60(_1121, _1123, _1125, _1127, gl_SubgroupInvocationID);
            int _1129 = _3100;
            int _1131 = _1037;
            int _1133 = as_type<int>(_1053);
            int _1135 = 31;
            int _3104 = _60(_1131, _1133, _1135, _1137, gl_SubgroupInvocationID);
            int _1139 = _3104;
            int _1141 = _1039;
            int _1143 = as_type<int>(_1053);
            int _1145 = 31;
            int _3108 = _60(_1141, _1143, _1145, _1147, gl_SubgroupInvocationID);
            int _1149 = _3108;
            int _1151 = as_type<int>(_1041);
            int _1153 = as_type<int>(_1053);
            int _1155 = 31;
            int _3113 = _60(_1151, _1153, _1155, _1157, gl_SubgroupInvocationID);
            int _1159 = _3113;
            int _1161 = as_type<int>(_1043);
            int _1163 = as_type<int>(_1053);
            int _1165 = 31;
            int _3118 = _60(_1161, _1163, _1165, _1167, gl_SubgroupInvocationID);
            int _1169 = _3118;
            int _1171 = as_type<int>(_1045);
            int _1173 = as_type<int>(_1053);
            int _1175 = 31;
            int _3123 = _60(_1171, _1173, _1175, _1177, gl_SubgroupInvocationID);
            int _1179 = _3123;
            bool _1181 = !_1055;
            _993 = _1057;
            float _1183 = _1023;
            float _1185 = _1025;
            float _1187 = _1027;
            int _1189 = _1029;
            float _1191 = _1031;
            int _1193 = _1033;
            int _1195 = _1035;
            int _1197 = _1037;
            int _1199 = _1039;
            float _1201 = _1041;
            float _1203 = _1043;
            float _1205 = _1045;
            if (!_1181)
            {
                float _1207 = _935 * as_type<float>(_1119);
                float _1209 = _951 * as_type<float>(_1119);
                float _1211 = _957 * as_type<float>(_1119);
                float _1213 = _963 * as_type<float>(_1119);
                float _1215 = _963 * as_type<float>(_1079);
                float _1217 = _951 * as_type<float>(_1079);
                float _1219 = _935 * as_type<float>(_1079);
                float _1221 = _957 * as_type<float>(_1079);
                float _1223 = fma(_937, as_type<float>(_1109), _1207);
                float _1225 = fma(_943, as_type<float>(_1109), _1209);
                float _1227 = fma(_955, as_type<float>(_1109), _1211);
                float _1229 = fma(_961, as_type<float>(_1109), _1213);
                float _1231 = _935 * as_type<float>(_1159);
                float _1233 = _951 * as_type<float>(_1159);
                float _1235 = _957 * as_type<float>(_1159);
                float _1237 = _963 * as_type<float>(_1159);
                float _1239 = fma(_961, as_type<float>(_1069), _1215);
                float _1241 = fma(_943, as_type<float>(_1069), _1217);
                float _1243 = fma(_937, as_type<float>(_1069), _1219);
                float _1245 = fma(_955, as_type<float>(_1069), _1221);
                float _1247 = fma(_937, as_type<float>(_1149), _1231);
                float _1249 = fma(_943, as_type<float>(_1149), _1233);
                float _1251 = fma(_955, as_type<float>(_1149), _1235);
                float _1253 = fma(_961, as_type<float>(_1149), _1237);
                float _1255 = fma(_965, as_type<float>(_1089), _1239);
                float _1257 = fma(_953, as_type<float>(_1089), _1241);
                float _1259 = fma(_939, as_type<float>(_1129), _1223);
                float _1261 = fma(_953, as_type<float>(_1129), _1225);
                float _1263 = fma(_959, as_type<float>(_1129), _1227);
                float _1265 = fma(_965, as_type<float>(_1129), _1229);
                float _1267 = fma(_965, as_type<float>(_1169), _1253);
                float _1269 = fma(_959, as_type<float>(_1089), _1245);
                float _1271 = fma(_939, as_type<float>(_1089), _1243);
                float _1273 = fma(_939, as_type<float>(_1169), _1247);
                float _1275 = fma(_953, as_type<float>(_1169), _1249);
                float _1277 = fma(_959, as_type<float>(_1169), _1251);
                float _1279 = as_type<float>(_1099) + _1255;
                float _1281 = as_type<float>(_1139) + _1265;
                float _1283 = as_type<float>(_1179) + _1267;
                _1183 = _1271;
                _1185 = _1257;
                _1187 = _1269;
                _1189 = as_type<int>(_1279);
                _1191 = _1259;
                _1193 = as_type<int>(_1261);
                _1195 = as_type<int>(_1263);
                _1197 = as_type<int>(_1281);
                _1199 = as_type<int>(_1273);
                _1201 = _1275;
                _1203 = _1277;
                _1205 = _1283;
            }
            _1285 = _1183;
            _1287 = _1185;
            _1289 = _1187;
            _1291 = _1189;
            _1293 = _1191;
            _1295 = _1193;
            _1297 = _1195;
            _1299 = _1197;
            _1301 = _1199;
            _1303 = _1201;
            _1305 = _1203;
            _1307 = _1205;
            _1019 = !_1059;
            _995 = _1285;
            _997 = _1287;
            _999 = _1289;
            _1001 = as_type<float>(_1291);
            _1003 = _1293;
            _1005 = as_type<float>(_1295);
            _1007 = as_type<float>(_1297);
            _1009 = as_type<float>(_1299);
            _1011 = as_type<float>(_1301);
            _1013 = _1303;
            _1015 = _1305;
            _1017 = _1307;
        } while (_1019);
        _971 = _1285;
        _973 = _1287;
        _975 = _1289;
        _977 = as_type<float>(_1291);
        _979 = _1293;
        _981 = as_type<float>(_1295);
        _983 = as_type<float>(_1297);
        _1309 = as_type<float>(_1299);
        _985 = as_type<float>(_1301);
        _987 = _1303;
        _989 = _1305;
        _991 = _1307;
        _1311 = true;
    }
    else
    {
        _1309 = _963;
    }
    _1311 = false;
    float _1313 = _971;
    float _1315 = _973;
    float _1317 = _975;
    float _1319 = _977;
    float _1321 = _979;
    float _1323 = _981;
    float _1325 = _983;
    float _1327 = _1309;
    float _1329 = _985;
    float _1331 = _987;
    float _1333 = _989;
    float _1335 = _991;
    int _1337 = _967 + 80;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    uint _1341 = uint(int(uint(int(_1339)) >> uint(2)));
    int _1343 = int(_1339) & 3;
    float _1345 = (*spvDescriptorSet0.cp_c6)._m0[int(_1341)][_1343];
    int _1347 = int(_1339) + 1;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    int _1351 = _1347 & 3;
    float _1353 = (*spvDescriptorSet0.cp_c6)._m0[int(_1349)][_1351];
    bool _1355 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1357 = _967 + 64;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    uint _1361 = uint(int(uint(int(_1359)) >> uint(2)));
    int _1363 = int(_1359) & 3;
    float _1365 = (*spvDescriptorSet0.cp_c6)._m0[int(_1361)][_1363];
    int _1367 = int(_1359) + 1;
    uint _1369 = uint(int(uint(_1367) >> uint(2)));
    int _1371 = _1367 & 3;
    float _1373 = (*spvDescriptorSet0.cp_c6)._m0[int(_1369)][_1371];
    int _1375 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1377 = _1375 + _70;
    int _1379 = _967 + 88;
    uint _1381 = uint(int(uint(_1379) >> uint(2)));
    uint _1383 = uint(int(uint(int(_1381)) >> uint(2)));
    int _1385 = int(_1381) & 3;
    float _1387 = (*spvDescriptorSet0.cp_c6)._m0[int(_1383)][_1385];
    int _1389 = int(_1381) + 1;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    int _1393 = _1389 & 3;
    float _1395 = (*spvDescriptorSet0.cp_c6)._m0[int(_1391)][_1393];
    int _1397 = _967 + 72;
    uint _1399 = uint(int(uint(_1397) >> uint(2)));
    uint _1401 = uint(int(uint(int(_1399)) >> uint(2)));
    int _1403 = int(_1399) & 3;
    float _1405 = (*spvDescriptorSet0.cp_c6)._m0[int(_1401)][_1403];
    int _1407 = int(_1399) + 1;
    uint _1409 = uint(int(uint(_1407) >> uint(2)));
    int _1411 = _1407 & 3;
    float _1413 = (*spvDescriptorSet0.cp_c6)._m0[int(_1409)][_1411];
    int _1415 = _967 + 96;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
    int _1421 = int(_1417) & 3;
    float _1423 = (*spvDescriptorSet0.cp_c6)._m0[int(_1419)][_1421];
    int _1425 = int(_1417) + 1;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    int _1429 = _1425 & 3;
    float _1431 = (*spvDescriptorSet0.cp_c6)._m0[int(_1427)][_1429];
    int _1433 = _967 + 104;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    uint _1437 = uint(int(uint(int(_1435)) >> uint(2)));
    int _1439 = int(_1435) & 3;
    float _1441 = (*spvDescriptorSet0.cp_c6)._m0[int(_1437)][_1439];
    int _1443 = int(_1435) + 1;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    int _1447 = _1443 & 3;
    float _1449 = (*spvDescriptorSet0.cp_c6)._m0[int(_1445)][_1447];
    int _1451 = _967 + 16;
    uint _1453 = uint(int(uint(_1451) >> uint(2)));
    uint _1455 = uint(int(uint(int(_1453)) >> uint(2)));
    int _1457 = int(_1453) & 3;
    float _1459 = (*spvDescriptorSet0.cp_c6)._m0[int(_1455)][_1457];
    int _1461 = int(_1453) + 1;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    int _1465 = _1461 & 3;
    float _1467 = (*spvDescriptorSet0.cp_c6)._m0[int(_1463)][_1465];
    if (!_1355)
    {
        int _1469 = _70 * 48;
        int _1471 = _1469 + 16;
        uint _1473 = uint(int(uint(_1469) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1473)] = as_type<uint>(_1313);
        int _1475 = _1469 + 4;
        uint _1477 = uint(int(uint(_1475) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1477)] = as_type<uint>(_1315);
        int _1479 = _1469 + 8;
        uint _1481 = uint(int(uint(_1479) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1481)] = as_type<uint>(_1317);
        int _1483 = _1469 + 12;
        uint _1485 = uint(int(uint(_1483) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1485)] = as_type<uint>(_1319);
        int _1487 = _1469 + 32;
        uint _1489 = uint(int(uint(_1471) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1489)] = as_type<uint>(_1321);
        int _1491 = _1471 + 4;
        uint _1493 = uint(int(uint(_1491) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1493)] = as_type<uint>(_1323);
        int _1495 = _1471 + 8;
        uint _1497 = uint(int(uint(_1495) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1497)] = as_type<uint>(_1325);
        int _1499 = _1471 + 12;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1501)] = as_type<uint>(_1327);
        uint _1503 = uint(int(uint(_1487) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1503)] = as_type<uint>(_1329);
        int _1505 = _1487 + 4;
        uint _1507 = uint(int(uint(_1505) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1507)] = as_type<uint>(_1331);
        int _1509 = _1487 + 8;
        uint _1511 = uint(int(uint(_1509) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1511)] = as_type<uint>(_1333);
        int _1513 = _1487 + 12;
        uint _1515 = uint(int(uint(_1513) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1515)] = as_type<uint>(_1335);
    }
    float _1517 = _1331 * _1345;
    float _1519 = _1315 * _1345;
    float _1521 = _1323 * _1345;
    int _1523 = _967 + 32;
    uint _1525 = uint(int(uint(_1523) >> uint(2)));
    uint _1527 = uint(int(uint(int(_1525)) >> uint(2)));
    int _1529 = int(_1525) & 3;
    float _1531 = (*spvDescriptorSet0.cp_c6)._m0[int(_1527)][_1529];
    int _1533 = int(_1525) + 1;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    int _1537 = _1533 & 3;
    float _1539 = (*spvDescriptorSet0.cp_c6)._m0[int(_1535)][_1537];
    float _1541 = fma(_1329, _1365, _1517);
    float _1543 = _1315 * _1353;
    float _1545 = fma(_1313, _1365, _1519);
    float _1547 = fma(_1321, _1365, _1521);
    float _1549 = _1323 * _1353;
    float _1551 = fma(_1313, _1373, _1543);
    float _1553 = _1315 * _1387;
    float _1555 = _1315 * _1395;
    float _1557 = _1331 * _1353;
    int _1559 = _967 + 48;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
    int _1565 = int(_1561) & 3;
    float _1567 = (*spvDescriptorSet0.cp_c6)._m0[int(_1563)][_1565];
    int _1569 = int(_1561) + 1;
    uint _1571 = uint(int(uint(_1569) >> uint(2)));
    int _1573 = _1569 & 3;
    float _1575 = (*spvDescriptorSet0.cp_c6)._m0[int(_1571)][_1573];
    float _1577 = _1323 * _1387;
    float _1579 = _1323 * _1395;
    float _1581 = fma(_1321, _1373, _1549);
    float _1583 = fma(_1329, _1373, _1557);
    float _1585 = _1331 * _1387;
    float _1587 = _1331 * _1395;
    float _1589 = fma(_1313, _1405, _1553);
    float _1591 = fma(_1313, _1413, _1555);
    float _1593 = fma(_1321, _1405, _1577);
    int _1595 = _967 + 24;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    uint _1599 = uint(int(uint(int(_1597)) >> uint(2)));
    int _1601 = int(_1597) & 3;
    float _1603 = (*spvDescriptorSet0.cp_c6)._m0[int(_1599)][_1601];
    int _1605 = int(_1597) + 1;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    int _1609 = _1605 & 3;
    float _1611 = (*spvDescriptorSet0.cp_c6)._m0[int(_1607)][_1609];
    float _1613 = fma(_1321, _1413, _1579);
    float _1615 = fma(_1329, _1413, _1587);
    float _1617 = fma(_1329, _1405, _1585);
    float _1619 = fma(_1317, _1423, _1545);
    float _1621 = fma(_1325, _1449, _1613);
    float _1623 = fma(_1325, _1423, _1547);
    float _1625 = fma(_1333, _1423, _1541);
    int _1627 = _967 + 40;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
    int _1633 = int(_1629) & 3;
    float _1635 = (*spvDescriptorSet0.cp_c6)._m0[int(_1631)][_1633];
    int _1637 = int(_1629) + 1;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    int _1641 = _1637 & 3;
    float _1643 = (*spvDescriptorSet0.cp_c6)._m0[int(_1639)][_1641];
    float _1645 = fma(_1317, _1431, _1551);
    float _1647 = fma(_1317, _1441, _1589);
    float _1649 = fma(_1317, _1449, _1591);
    float _1651 = fma(_1325, _1431, _1581);
    float _1653 = fma(_1325, _1441, _1593);
    float _1655 = fma(_1333, _1449, _1615);
    float _1657 = _1621 + _1327;
    int _1659 = _967 + 56;
    uint _1661 = uint(int(uint(_1659) >> uint(2)));
    uint _1663 = uint(int(uint(int(_1661)) >> uint(2)));
    int _1665 = int(_1661) & 3;
    float _1667 = (*spvDescriptorSet0.cp_c6)._m0[int(_1663)][_1665];
    int _1669 = int(_1661) + 1;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    int _1673 = _1669 & 3;
    float _1675 = (*spvDescriptorSet0.cp_c6)._m0[int(_1671)][_1673];
    float _1677 = fma(_1333, _1431, _1583);
    float _1679 = fma(_1333, _1441, _1617);
    float _1681 = _1655 + _1335;
    float _1683 = _1649 + _1319;
    float _1685 = _1623 * _1467;
    float _1687 = _1651 * _1467;
    float _1689 = _1653 * _1467;
    float _1691 = _1657 * _1467;
    float _1693 = fma(_1619, _1459, _1685);
    float _1695 = fma(_1645, _1459, _1687);
    float _1697 = fma(_1647, _1459, _1689);
    float _1699 = fma(_1683, _1459, _1691);
    float _1701 = _1657 * _1539;
    float _1703 = _1623 * _1539;
    float _1705 = _1651 * _1539;
    float _1707 = _1653 * _1539;
    float _1709 = fma(_1683, _1531, _1701);
    float _1711 = fma(_1619, _1531, _1703);
    float _1713 = fma(_1645, _1531, _1705);
    float _1715 = fma(_1647, _1531, _1707);
    int _1717 = _1377 * 48;
    float _1719 = _1657 * _1575;
    float _1721 = _1623 * _1575;
    float _1723 = _1651 * _1575;
    float _1725 = _1653 * _1575;
    float _1727 = fma(_1683, _1567, _1719);
    float _1729 = fma(_1619, _1567, _1721);
    float _1731 = fma(_1645, _1567, _1723);
    float _1733 = fma(_1647, _1567, _1725);
    float _1735 = fma(_1681, _1603, _1699);
    float _1737 = fma(_1677, _1603, _1695);
    float _1739 = fma(_1625, _1603, _1693);
    float _1741 = fma(_1679, _1603, _1697);
    float _1743 = _1735 + _1611;
    float _1745 = fma(_1681, _1635, _1709);
    float _1747 = fma(_1625, _1635, _1711);
    float _1749 = fma(_1677, _1635, _1713);
    float _1751 = fma(_1679, _1635, _1715);
    float _1753 = _1745 + _1643;
    int _1755 = _1717 + 16;
    int _1757 = _1717 + 32;
    float _1759 = fma(_1681, _1667, _1727);
    float _1761 = fma(_1625, _1667, _1729);
    float _1763 = fma(_1677, _1667, _1731);
    float _1765 = fma(_1679, _1667, _1733);
    float _1767 = _1759 + _1675;
    int _1769 = _1717 + 48;
    uint _1771 = uint(int(uint(_1755) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1771)] = as_type<uint>(_1739);
    int _1773 = _1755 + 4;
    uint _1775 = uint(int(uint(_1773) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1775)] = as_type<uint>(_1737);
    int _1777 = _1755 + 8;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1779)] = as_type<uint>(_1741);
    int _1781 = _1755 + 12;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1783)] = as_type<uint>(_1743);
    uint _1785 = uint(int(uint(_1757) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1785)] = as_type<uint>(_1747);
    int _1787 = _1757 + 4;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1789)] = as_type<uint>(_1749);
    int _1791 = _1757 + 8;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1793)] = as_type<uint>(_1751);
    int _1795 = _1757 + 12;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1797)] = as_type<uint>(_1753);
    uint _1799 = uint(int(uint(_1769) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1799)] = as_type<uint>(_1761);
    int _1801 = _1769 + 4;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1803)] = as_type<uint>(_1763);
    int _1805 = _1769 + 8;
    uint _1807 = uint(int(uint(_1805) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1807)] = as_type<uint>(_1765);
    int _1809 = _1769 + 12;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1811)] = as_type<uint>(_1767);
}

