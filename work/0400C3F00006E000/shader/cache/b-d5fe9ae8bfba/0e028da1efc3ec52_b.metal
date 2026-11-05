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
int _58(thread const int& _4652, thread const int& _4653, constant _10& support_buffer)
{
    int _4656 = 1 + _4653;
    float _4658 = support_buffer._m5[_4656].x;
    bool _4660 = _4658 == 1.0;
    if (_4660)
    {
        return _4652;
    }
    float _4662 = float(_4652);
    float _4664 = _4662 * _4658;
    int _4666 = int(_4664);
    return _4666;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4344, thread const int& _4345, thread const int& _4346, thread const int& _4347, thread int& _4348, thread int& _4349, thread int& _4350, thread int& _4351, thread int& _4352, thread int& _4353)
{
    float _4356 = as_type<float>(_4346) + 0.0;
    bool _4358 = _4356 != 0.0;
    bool _4360 = isnan(_4356);
    bool _4362 = _4358 || _4360;
    bool _4364 = isnan(0.0);
    bool _4366 = _4362 || _4364;
    int _4368 = _4344;
    int _4370 = _4345;
    int _4372 = _4346;
    int _4374 = _4366 ? (-1) : 0;
    if (!_4366)
    {
        float _4376 = as_type<float>(_4346) * 1.0;
        _4368 = as_type<int>(_4376);
    }
    int _4378 = _4368;
    bool _4380 = !_4366;
    int _4382 = _4378;
    int _4384 = _4378;
    if (!_4380)
    {
        float _4386 = as_type<float>(_4346) + 0.0;
        bool _4388 = _4386 >= 0.0;
        bool _4390 = isnan(_4386);
        bool _4392 = _4388 || _4390;
        bool _4394 = isnan(0.0);
        bool _4396 = _4392 || _4394;
        _4374 = _4396 ? (-1) : 0;
        if (!_4396)
        {
            _4382 = 2147483647;
        }
        int _4398 = _4382;
        bool _4400 = !_4396;
        int _4402 = _4398;
        _4384 = _4398;
        if (!_4400)
        {
            float _4404 = as_type<float>(_4346) + 0.0;
            bool _4406 = _4404 > as_type<float>(0x7f800000u /* inf */);
            bool _4408 = isnan(_4404);
            bool _4410 = _4406 || _4408;
            bool _4412 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4414 = _4410 || _4412;
            _4374 = _4414 ? (-1) : 0;
            if (_4414)
            {
                float _4416 = as_type<float>(_4346) + 1.0;
                _4402 = as_type<int>(_4416);
            }
            int _4418 = _4402;
            int _4420 = _4418;
            _4384 = _4418;
            if (!_4414)
            {
                float _4422 = 0.0 + as_type<float>(_4346);
                bool _4424 = _4422 != as_type<float>(0x7f800000u /* inf */);
                bool _4426 = isnan(_4422);
                bool _4428 = _4424 || _4426;
                bool _4430 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4432 = _4428 || _4430;
                _4374 = _4432 ? (-1) : 0;
                if (!_4432)
                {
                    _4420 = _4346;
                }
                int _4434 = _4420;
                bool _4436 = !_4432;
                _4384 = _4434;
                if (!_4436)
                {
                    float _4438 = as_type<float>(_4346) * 18446744073709551616.0;
                    float _4440 = rsqrt(_4438);
                    float _4442 = _4438 * _4440;
                    float _4444 = _4440 * 0.5;
                    float _4446 = -_4442;
                    float _4448 = 0.0 + _4446;
                    float _4450 = fma(_4444, _4448, 0.5);
                    float _4452 = fma(_4442, _4450, _4442);
                    float _4454 = -_4452;
                    float _4456 = 0.0 + _4454;
                    float _4458 = fma(_4452, _4456, _4438);
                    float _4460 = fma(_4444, _4458, _4452);
                    float _4462 = _4460 * 2.3283064365386962890625e-10;
                    _4384 = as_type<int>(_4462);
                    _4370 = as_type<int>(_4452);
                    _4372 = as_type<int>(_4438);
                }
            }
        }
    }
    int _4464 = _4384;
    int _4466 = _4370;
    int _4468 = _4372;
    int _4470 = _4374;
    _4348 = _4347;
    _4349 = 0;
    _4350 = _4464;
    _4351 = _4466;
    _4352 = _4468;
    _4353 = _4470;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4687, thread const int& _4688, thread const int& _4689, thread int& _4690, thread uint& gl_SubgroupInvocationID)
{
    int _4693 = _4689 & 31;
    uint _4695 = uint(int(uint(_4689) >> uint(8)));
    int _4697 = int(_4695) & 31;
    float _4699 = as_type<float>(gl_SubgroupInvocationID);
    int _4701 = as_type<int>(_4699) & _4697;
    int _4703 = ~_4697;
    int _4705 = _4693 & _4703;
    int _4707 = _4705 | _4701;
    int _4709 = ~_4697;
    int _4711 = _4688 & _4709;
    int _4713 = _4711 | _4701;
    bool _4715 = uint(_4713) <= uint(_4707);
    _4690 = _4715 ? (-1) : 0;
    float _4717 = spvSubgroupShuffle(as_type<float>(_4687), uint(_4713));
    uint _4719 = uint(_4715 ? as_type<int>(_4717) : _4687);
    return int(_4719);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1361 = false;
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
    float _805 = -_631;
    float _807 = _805 + _671;
    float _809 = -_635;
    float _811 = _809 + _675;
    float _813 = -_655;
    float _815 = _813 + _695;
    bool _817 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _819 = _471 * _803;
    float _821 = _483 * _803;
    float _823 = _467 * _803;
    float _825 = _463 * _803;
    float _827 = fma(_403, _795, _819);
    float _829 = fma(_397, _795, _821);
    int _831 = _76 + 24;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.cp_c5)._m0[int(_835)][_837];
    float _841 = fma(_423, _795, _823);
    float _843 = fma(_407, _795, _825);
    float _845 = _829 * 2.0;
    float _847 = _827 * 2.0;
    float _849 = _843 * 2.0;
    float _851 = _841 * _845;
    int _853 = _76 + 20;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    uint _857 = uint(int(uint(int(_855)) >> uint(2)));
    int _859 = int(_855) & 3;
    float _861 = (*spvDescriptorSet0.cp_c5)._m0[int(_857)][_859];
    float _863 = _843 * _845;
    float _865 = _827 * _845;
    float _867 = -_851;
    float _869 = fma(_843, _847, _867);
    float _871 = fma(_843, _847, _851);
    float _873 = fma(_841, _847, _863);
    float _875 = _843 * _843;
    float _877 = _827 * _827;
    float _879 = -_863;
    float _881 = fma(_841, _847, _879);
    float _883 = -_865;
    float _885 = fma(_841, _849, _883);
    float _887 = fma(_841, _849, _865);
    float _889 = _841 * _841;
    float _891 = fma(_875, -2.0, 1.0);
    float _893 = fma(_877, -2.0, 1.0);
    float _895 = fma(_807, _839, _631);
    float _897 = -_633;
    float _899 = _897 + _673;
    float _901 = fma(_811, _839, _635);
    float _903 = fma(_815, _839, _655);
    float _905 = fma(_899, _839, _633);
    float _907 = _895 * _797;
    bool _909 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _911 = -_651;
    float _913 = _911 + _691;
    float _915 = _905 * _797;
    float _917 = -_653;
    float _919 = _917 + _693;
    float _921 = _901 * _797;
    float _923 = fma(_425, _861, _907);
    float _925 = fma(_427, _861, _915);
    float _927 = fma(_913, _839, _651);
    float _929 = fma(_919, _839, _653);
    float _931 = fma(_889, -2.0, _891);
    float _933 = fma(_429, _861, _921);
    float _935 = fma(_889, -2.0, _893);
    float _937 = _869 * _925;
    float _939 = fma(_875, -2.0, _893);
    float _941 = _927 * _797;
    float _943 = _929 * _797;
    float _945 = _903 * _797;
    float _947 = _871 * _923;
    float _949 = _931 * _923;
    float _951 = _881 * _923;
    float _953 = _935 * _925;
    float _955 = _885 * _933;
    float _957 = _887 * _925;
    float _959 = _873 * _933;
    float _961 = _939 * _933;
    float _963 = fma(_547, _861, _941);
    float _965 = fma(_489, _861, _943);
    float _967 = fma(_493, _861, _945);
    float _969 = _959;
    float _971 = _963;
    if (!_909)
    {
        int _973 = _70 * 48;
        int _975 = _973 + 16;
        uint _977 = uint(int(uint(_973) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_977)] = as_type<uint>(_949);
        int _979 = _973 + 4;
        uint _981 = uint(int(uint(_979) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_981)] = as_type<uint>(_937);
        int _983 = _973 + 8;
        uint _985 = uint(int(uint(_983) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_985)] = as_type<uint>(_959);
        int _987 = _973 + 12;
        uint _989 = uint(int(uint(_987) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_989)] = as_type<uint>(_963);
        int _991 = _973 + 32;
        uint _993 = uint(int(uint(_975) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_993)] = as_type<uint>(_947);
        int _995 = _975 + 4;
        uint _997 = uint(int(uint(_995) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_997)] = as_type<uint>(_953);
        int _999 = _975 + 8;
        uint _1001 = uint(int(uint(_999) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1001)] = as_type<uint>(_955);
        int _1003 = _975 + 12;
        uint _1005 = uint(int(uint(_1003) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1005)] = as_type<uint>(_965);
        uint _1007 = uint(int(uint(_991) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1007)] = as_type<uint>(_951);
        int _1009 = _991 + 4;
        uint _1011 = uint(int(uint(_1009) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1011)] = as_type<uint>(_957);
        int _1013 = _991 + 8;
        uint _1015 = uint(int(uint(_1013) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1015)] = as_type<uint>(_961);
        int _1017 = _991 + 12;
        uint _1019 = uint(int(uint(_1017) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1019)] = as_type<uint>(_967);
    }
    int _1021 = _70 * 112;
    bool _1023 = !_817;
    float _1341;
    float _1343;
    float _1345;
    float _1347;
    float _1349;
    float _1351;
    float _1353;
    float _1355;
    float _1357;
    float _1359;
    if (!_1023)
    {
        int _1025 = 0;
        float _1027 = _949;
        float _1029 = _937;
        float _1031 = _959;
        float _1033 = _963;
        float _1035 = _947;
        float _1037 = _953;
        float _1039 = _955;
        float _1041 = _965;
        float _1043 = _951;
        float _1045 = _957;
        float _1047 = _961;
        float _1049 = _967;
        bool _1051;
        int _1099;
        int _1109;
        int _1119;
        int _1129;
        int _1139;
        int _1149;
        int _1159;
        int _1169;
        int _1179;
        int _1189;
        int _1199;
        int _1209;
        int _1317;
        int _1321;
        int _1323;
        int _1327;
        int _1329;
        int _1331;
        int _1335;
        int _1337;
        int _1339;
        do
        {
            int _1053 = _1025;
            int _1055 = as_type<int>(_1027);
            int _1057 = as_type<int>(_1029);
            int _1059 = as_type<int>(_1031);
            int _1061 = as_type<int>(_1033);
            int _1063 = as_type<int>(_1035);
            int _1065 = as_type<int>(_1037);
            int _1067 = as_type<int>(_1039);
            int _1069 = as_type<int>(_1041);
            int _1071 = as_type<int>(_1043);
            int _1073 = as_type<int>(_1045);
            int _1075 = as_type<int>(_1047);
            int _1077 = as_type<int>(_1049);
            uint _1079 = uint(int(uint(_1021) >> uint(2)));
            uint _1081 = uint(int(uint(int(_1079)) >> uint(2)));
            int _1083 = int(_1079) & 3;
            float _1085 = (*spvDescriptorSet0.cp_c6)._m0[int(_1081)][_1083];
            bool _1087 = _70 != 0;
            int _1089 = _1053 + 1;
            bool _1091 = uint(_1089) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1093 = _1055;
            int _1095 = as_type<int>(_1085);
            int _1097 = 31;
            int _3205 = _60(_1093, _1095, _1097, _1099, gl_SubgroupInvocationID);
            int _1101 = _3205;
            int _1103 = _1057;
            int _1105 = as_type<int>(_1085);
            int _1107 = 31;
            int _3209 = _60(_1103, _1105, _1107, _1109, gl_SubgroupInvocationID);
            int _1111 = _3209;
            int _1113 = _1059;
            int _1115 = as_type<int>(_1085);
            int _1117 = 31;
            int _3213 = _60(_1113, _1115, _1117, _1119, gl_SubgroupInvocationID);
            int _1121 = _3213;
            int _1123 = _1061;
            int _1125 = as_type<int>(_1085);
            int _1127 = 31;
            int _3217 = _60(_1123, _1125, _1127, _1129, gl_SubgroupInvocationID);
            int _1131 = _3217;
            int _1133 = _1063;
            int _1135 = as_type<int>(_1085);
            int _1137 = 31;
            int _3221 = _60(_1133, _1135, _1137, _1139, gl_SubgroupInvocationID);
            int _1141 = _3221;
            int _1143 = _1065;
            int _1145 = as_type<int>(_1085);
            int _1147 = 31;
            int _3225 = _60(_1143, _1145, _1147, _1149, gl_SubgroupInvocationID);
            int _1151 = _3225;
            int _1153 = _1067;
            int _1155 = as_type<int>(_1085);
            int _1157 = 31;
            int _3229 = _60(_1153, _1155, _1157, _1159, gl_SubgroupInvocationID);
            int _1161 = _3229;
            int _1163 = _1069;
            int _1165 = as_type<int>(_1085);
            int _1167 = 31;
            int _3233 = _60(_1163, _1165, _1167, _1169, gl_SubgroupInvocationID);
            int _1171 = _3233;
            int _1173 = _1071;
            int _1175 = as_type<int>(_1085);
            int _1177 = 31;
            int _3237 = _60(_1173, _1175, _1177, _1179, gl_SubgroupInvocationID);
            int _1181 = _3237;
            int _1183 = _1073;
            int _1185 = as_type<int>(_1085);
            int _1187 = 31;
            int _3241 = _60(_1183, _1185, _1187, _1189, gl_SubgroupInvocationID);
            int _1191 = _3241;
            int _1193 = _1075;
            int _1195 = as_type<int>(_1085);
            int _1197 = 31;
            int _3245 = _60(_1193, _1195, _1197, _1199, gl_SubgroupInvocationID);
            int _1201 = _3245;
            int _1203 = _1077;
            int _1205 = as_type<int>(_1085);
            int _1207 = 31;
            int _3249 = _60(_1203, _1205, _1207, _1209, gl_SubgroupInvocationID);
            int _1211 = _3249;
            bool _1213 = !_1087;
            _1025 = _1089;
            int _1215 = _1055;
            int _1217 = _1057;
            int _1219 = _1059;
            int _1221 = _1061;
            int _1223 = _1063;
            int _1225 = _1065;
            int _1227 = _1067;
            int _1229 = _1069;
            int _1231 = _1071;
            int _1233 = _1073;
            int _1235 = _1075;
            int _1237 = _1077;
            if (!_1213)
            {
                float _1239 = _965 * as_type<float>(_1151);
                float _1241 = _953 * as_type<float>(_1151);
                float _1243 = _955 * as_type<float>(_1151);
                float _1245 = _953 * as_type<float>(_1111);
                float _1247 = _947 * as_type<float>(_1111);
                float _1249 = _955 * as_type<float>(_1111);
                float _1251 = _965 * as_type<float>(_1111);
                float _1253 = fma(_963, as_type<float>(_1141), _1239);
                float _1255 = fma(_937, as_type<float>(_1141), _1241);
                float _1257 = _965 * as_type<float>(_1191);
                float _1259 = fma(_959, as_type<float>(_1141), _1243);
                float _1261 = _953 * as_type<float>(_1191);
                float _1263 = fma(_937, as_type<float>(_1101), _1245);
                float _1265 = _947 * as_type<float>(_1151);
                float _1267 = _947 * as_type<float>(_1191);
                float _1269 = fma(_949, as_type<float>(_1101), _1247);
                float _1271 = fma(_959, as_type<float>(_1101), _1249);
                float _1273 = fma(_963, as_type<float>(_1101), _1251);
                float _1275 = _955 * as_type<float>(_1191);
                float _1277 = fma(_963, as_type<float>(_1181), _1257);
                float _1279 = fma(_937, as_type<float>(_1181), _1261);
                float _1281 = fma(_949, as_type<float>(_1141), _1265);
                float _1283 = fma(_949, as_type<float>(_1181), _1267);
                float _1285 = fma(_957, as_type<float>(_1121), _1263);
                float _1287 = fma(_951, as_type<float>(_1121), _1269);
                float _1289 = fma(_961, as_type<float>(_1121), _1271);
                float _1291 = fma(_961, as_type<float>(_1161), _1259);
                float _1293 = fma(_959, as_type<float>(_1181), _1275);
                float _1295 = fma(_967, as_type<float>(_1121), _1273);
                float _1297 = fma(_967, as_type<float>(_1161), _1253);
                float _1299 = fma(_967, as_type<float>(_1201), _1277);
                float _1301 = fma(_951, as_type<float>(_1161), _1281);
                float _1303 = fma(_957, as_type<float>(_1161), _1255);
                float _1305 = fma(_951, as_type<float>(_1201), _1283);
                float _1307 = fma(_957, as_type<float>(_1201), _1279);
                float _1309 = fma(_961, as_type<float>(_1201), _1293);
                float _1311 = as_type<float>(_1131) + _1295;
                float _1313 = as_type<float>(_1171) + _1297;
                float _1315 = as_type<float>(_1211) + _1299;
                _1215 = as_type<int>(_1287);
                _1217 = as_type<int>(_1285);
                _1219 = as_type<int>(_1289);
                _1221 = as_type<int>(_1311);
                _1223 = as_type<int>(_1301);
                _1225 = as_type<int>(_1303);
                _1227 = as_type<int>(_1291);
                _1229 = as_type<int>(_1313);
                _1231 = as_type<int>(_1305);
                _1233 = as_type<int>(_1307);
                _1235 = as_type<int>(_1309);
                _1237 = as_type<int>(_1315);
            }
            _1317 = _1215;
            int _1319 = _1217;
            _1321 = _1219;
            _1323 = _1221;
            int _1325 = _1223;
            _1327 = _1225;
            _1329 = _1227;
            _1331 = _1229;
            int _1333 = _1231;
            _1335 = _1233;
            _1337 = _1235;
            _1339 = _1237;
            _1051 = !_1091;
            _1027 = as_type<float>(_1317);
            _1029 = as_type<float>(_1319);
            _1031 = as_type<float>(_1321);
            _1033 = as_type<float>(_1323);
            _1035 = as_type<float>(_1325);
            _1037 = as_type<float>(_1327);
            _1039 = as_type<float>(_1329);
            _1041 = as_type<float>(_1331);
            _1043 = as_type<float>(_1333);
            _1045 = as_type<float>(_1335);
            _1047 = as_type<float>(_1337);
            _1049 = as_type<float>(_1339);
            _1341 = as_type<float>(_1319);
            _1343 = as_type<float>(_1325);
            _1345 = as_type<float>(_1333);
        } while (_1051);
        _1347 = as_type<float>(_1327);
        _1349 = as_type<float>(_1335);
        _1351 = as_type<float>(_1317);
        _969 = as_type<float>(_1321);
        _1353 = as_type<float>(_1329);
        _1355 = as_type<float>(_1337);
        _1357 = as_type<float>(_1331);
        _1359 = as_type<float>(_1339);
        _971 = as_type<float>(_1323);
        _1361 = true;
    }
    else
    {
        _1341 = _937;
        _1347 = _953;
        _1349 = _957;
        _1351 = _949;
        _1343 = _947;
        _1345 = _951;
        _1353 = _955;
        _1355 = _961;
        _1357 = _965;
        _1359 = _967;
    }
    _1361 = false;
    float _1363 = _1341;
    float _1365 = _1347;
    float _1367 = _1349;
    float _1369 = _1351;
    float _1371 = _1343;
    float _1373 = _1345;
    float _1375 = _969;
    float _1377 = _1353;
    float _1379 = _1355;
    float _1381 = _1357;
    float _1383 = _1359;
    float _1385 = _971;
    int _1387 = _1021 + 80;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    uint _1391 = uint(int(uint(int(_1389)) >> uint(2)));
    int _1393 = int(_1389) & 3;
    float _1395 = (*spvDescriptorSet0.cp_c6)._m0[int(_1391)][_1393];
    int _1397 = int(_1389) + 1;
    uint _1399 = uint(int(uint(_1397) >> uint(2)));
    int _1401 = _1397 & 3;
    float _1403 = (*spvDescriptorSet0.cp_c6)._m0[int(_1399)][_1401];
    int _1405 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1407 = _1405 + _70;
    int _1409 = _1021 + 64;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
    int _1415 = int(_1411) & 3;
    float _1417 = (*spvDescriptorSet0.cp_c6)._m0[int(_1413)][_1415];
    int _1419 = int(_1411) + 1;
    uint _1421 = uint(int(uint(_1419) >> uint(2)));
    int _1423 = _1419 & 3;
    float _1425 = (*spvDescriptorSet0.cp_c6)._m0[int(_1421)][_1423];
    int _1427 = _1407 * 48;
    int _1429 = _1021 + 88;
    uint _1431 = uint(int(uint(_1429) >> uint(2)));
    uint _1433 = uint(int(uint(int(_1431)) >> uint(2)));
    int _1435 = int(_1431) & 3;
    float _1437 = (*spvDescriptorSet0.cp_c6)._m0[int(_1433)][_1435];
    int _1439 = int(_1431) + 1;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    int _1443 = _1439 & 3;
    float _1445 = (*spvDescriptorSet0.cp_c6)._m0[int(_1441)][_1443];
    int _1447 = _1021 + 72;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    uint _1451 = uint(int(uint(int(_1449)) >> uint(2)));
    int _1453 = int(_1449) & 3;
    float _1455 = (*spvDescriptorSet0.cp_c6)._m0[int(_1451)][_1453];
    int _1457 = int(_1449) + 1;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    int _1461 = _1457 & 3;
    float _1463 = (*spvDescriptorSet0.cp_c6)._m0[int(_1459)][_1461];
    int _1465 = _1021 + 96;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    uint _1469 = uint(int(uint(int(_1467)) >> uint(2)));
    int _1471 = int(_1467) & 3;
    float _1473 = (*spvDescriptorSet0.cp_c6)._m0[int(_1469)][_1471];
    int _1475 = int(_1467) + 1;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    int _1479 = _1475 & 3;
    float _1481 = (*spvDescriptorSet0.cp_c6)._m0[int(_1477)][_1479];
    int _1483 = _1021 + 104;
    uint _1485 = uint(int(uint(_1483) >> uint(2)));
    uint _1487 = uint(int(uint(int(_1485)) >> uint(2)));
    int _1489 = int(_1485) & 3;
    float _1491 = (*spvDescriptorSet0.cp_c6)._m0[int(_1487)][_1489];
    int _1493 = int(_1485) + 1;
    uint _1495 = uint(int(uint(_1493) >> uint(2)));
    int _1497 = _1493 & 3;
    float _1499 = (*spvDescriptorSet0.cp_c6)._m0[int(_1495)][_1497];
    float _1501 = _1363 * _1395;
    float _1503 = _1365 * _1395;
    float _1505 = _1367 * _1395;
    float _1507 = _1363 * _1403;
    float _1509 = _1367 * _1403;
    int _1511 = _1021 + 16;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    uint _1515 = uint(int(uint(int(_1513)) >> uint(2)));
    int _1517 = int(_1513) & 3;
    float _1519 = (*spvDescriptorSet0.cp_c6)._m0[int(_1515)][_1517];
    int _1521 = int(_1513) + 1;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    int _1525 = _1521 & 3;
    float _1527 = (*spvDescriptorSet0.cp_c6)._m0[int(_1523)][_1525];
    float _1529 = fma(_1369, _1417, _1501);
    float _1531 = fma(_1371, _1417, _1503);
    float _1533 = fma(_1373, _1417, _1505);
    float _1535 = _1365 * _1403;
    float _1537 = fma(_1369, _1425, _1507);
    int _1539 = _1021 + 32;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    uint _1543 = uint(int(uint(int(_1541)) >> uint(2)));
    int _1545 = int(_1541) & 3;
    float _1547 = (*spvDescriptorSet0.cp_c6)._m0[int(_1543)][_1545];
    int _1549 = int(_1541) + 1;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    int _1553 = _1549 & 3;
    float _1555 = (*spvDescriptorSet0.cp_c6)._m0[int(_1551)][_1553];
    float _1557 = fma(_1373, _1425, _1509);
    float _1559 = fma(_1371, _1425, _1535);
    float _1561 = _1363 * _1437;
    float _1563 = _1365 * _1437;
    float _1565 = _1363 * _1445;
    float _1567 = _1365 * _1445;
    float _1569 = _1367 * _1437;
    int _1571 = _1021 + 48;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.cp_c6)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.cp_c6)._m0[int(_1583)][_1585];
    float _1589 = _1367 * _1445;
    float _1591 = fma(_1369, _1455, _1561);
    float _1593 = fma(_1371, _1455, _1563);
    float _1595 = fma(_1369, _1463, _1565);
    float _1597 = fma(_1371, _1463, _1567);
    float _1599 = fma(_1373, _1455, _1569);
    int _1601 = _1021 + 24;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    uint _1605 = uint(int(uint(int(_1603)) >> uint(2)));
    int _1607 = int(_1603) & 3;
    float _1609 = (*spvDescriptorSet0.cp_c6)._m0[int(_1605)][_1607];
    int _1611 = int(_1603) + 1;
    uint _1613 = uint(int(uint(_1611) >> uint(2)));
    int _1615 = _1611 & 3;
    float _1617 = (*spvDescriptorSet0.cp_c6)._m0[int(_1613)][_1615];
    float _1619 = fma(_1373, _1463, _1589);
    float _1621 = fma(_1375, _1473, _1529);
    float _1623 = fma(_1375, _1481, _1537);
    float _1625 = fma(_1377, _1473, _1531);
    float _1627 = fma(_1377, _1481, _1559);
    float _1629 = fma(_1379, _1473, _1533);
    int _1631 = _1021 + 40;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
    int _1637 = int(_1633) & 3;
    float _1639 = (*spvDescriptorSet0.cp_c6)._m0[int(_1635)][_1637];
    int _1641 = int(_1633) + 1;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    int _1645 = _1641 & 3;
    float _1647 = (*spvDescriptorSet0.cp_c6)._m0[int(_1643)][_1645];
    float _1649 = fma(_1379, _1481, _1557);
    float _1651 = fma(_1375, _1491, _1591);
    float _1653 = fma(_1377, _1499, _1597);
    float _1655 = fma(_1375, _1499, _1595);
    float _1657 = fma(_1379, _1499, _1619);
    float _1659 = fma(_1377, _1491, _1593);
    int _1661 = _1021 + 56;
    uint _1663 = uint(int(uint(_1661) >> uint(2)));
    uint _1665 = uint(int(uint(int(_1663)) >> uint(2)));
    int _1667 = int(_1663) & 3;
    float _1669 = (*spvDescriptorSet0.cp_c6)._m0[int(_1665)][_1667];
    int _1671 = int(_1663) + 1;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    int _1675 = _1671 & 3;
    float _1677 = (*spvDescriptorSet0.cp_c6)._m0[int(_1673)][_1675];
    float _1679 = _1653 + _1381;
    float _1681 = fma(_1379, _1491, _1599);
    float _1683 = _1657 + _1383;
    float _1685 = _1655 + _1385;
    float _1687 = _1625 * _1527;
    float _1689 = _1627 * _1527;
    float _1691 = _1659 * _1527;
    float _1693 = _1679 * _1527;
    float _1695 = fma(_1621, _1519, _1687);
    float _1697 = fma(_1623, _1519, _1689);
    float _1699 = fma(_1651, _1519, _1691);
    float _1701 = fma(_1685, _1519, _1693);
    float _1703 = _1679 * _1555;
    float _1705 = _1625 * _1555;
    float _1707 = _1627 * _1555;
    float _1709 = _1659 * _1555;
    float _1711 = fma(_1685, _1547, _1703);
    float _1713 = fma(_1621, _1547, _1705);
    float _1715 = fma(_1623, _1547, _1707);
    float _1717 = fma(_1651, _1547, _1709);
    float _1719 = _1679 * _1587;
    float _1721 = _1625 * _1587;
    float _1723 = _1627 * _1587;
    float _1725 = _1659 * _1587;
    float _1727 = fma(_1685, _1579, _1719);
    float _1729 = fma(_1621, _1579, _1721);
    float _1731 = fma(_1623, _1579, _1723);
    float _1733 = fma(_1651, _1579, _1725);
    float _1735 = fma(_1683, _1609, _1701);
    float _1737 = fma(_1629, _1609, _1695);
    float _1739 = fma(_1649, _1609, _1697);
    float _1741 = fma(_1681, _1609, _1699);
    float _1743 = _1735 + _1617;
    float _1745 = fma(_1683, _1639, _1711);
    float _1747 = fma(_1629, _1639, _1713);
    float _1749 = fma(_1649, _1639, _1715);
    int _1751 = _1427 + 16;
    float _1753 = fma(_1681, _1639, _1717);
    float _1755 = _1745 + _1647;
    int _1757 = _1427 + 32;
    float _1759 = fma(_1683, _1669, _1727);
    float _1761 = fma(_1629, _1669, _1729);
    float _1763 = fma(_1649, _1669, _1731);
    float _1765 = fma(_1681, _1669, _1733);
    float _1767 = _1759 + _1677;
    int _1769 = _1427 + 48;
    uint _1771 = uint(int(uint(_1751) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1771)] = as_type<uint>(_1737);
    int _1773 = _1751 + 4;
    uint _1775 = uint(int(uint(_1773) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1775)] = as_type<uint>(_1739);
    int _1777 = _1751 + 8;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1779)] = as_type<uint>(_1741);
    int _1781 = _1751 + 12;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1783)] = as_type<uint>(_1743);
    uint _1785 = uint(int(uint(_1757) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1785)] = as_type<uint>(_1747);
    int _1787 = _1757 + 4;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1789)] = as_type<uint>(_1749);
    int _1791 = _1757 + 8;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1793)] = as_type<uint>(_1753);
    int _1795 = _1757 + 12;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1797)] = as_type<uint>(_1755);
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

