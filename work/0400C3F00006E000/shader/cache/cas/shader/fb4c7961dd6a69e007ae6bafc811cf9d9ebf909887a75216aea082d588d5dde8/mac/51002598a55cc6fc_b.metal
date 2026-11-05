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
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _60(thread const int& _4826, thread const int& _4827, constant _10& support_buffer)
{
    int _4830 = 1 + _4827;
    float _4832 = support_buffer._m5[_4830].x;
    bool _4834 = _4832 == 1.0;
    if (_4834)
    {
        return _4826;
    }
    float _4836 = float(_4826);
    float _4838 = _4836 * _4832;
    int _4840 = int(_4838);
    return _4840;
}

static inline __attribute__((always_inline))
void _58(thread const int& _4514, thread const int& _4515, thread const int& _4516, thread const int& _4517, thread int& _4518, thread int& _4519, thread int& _4520, thread int& _4521, thread int& _4522, thread int& _4523)
{
    float _4526 = as_type<float>(_4514) + 0.0;
    bool _4528 = _4526 != 0.0;
    bool _4530 = isnan(_4526);
    bool _4532 = _4528 || _4530;
    bool _4534 = isnan(0.0);
    bool _4536 = _4532 || _4534;
    int _4538 = as_type<int>(_4526);
    int _4540 = _4515;
    int _4542 = _4517;
    int _4544 = _4536 ? (-1) : 0;
    if (!_4536)
    {
        float _4546 = as_type<float>(_4514) * 1.0;
        _4538 = as_type<int>(_4546);
    }
    int _4548 = _4538;
    bool _4550 = !_4536;
    int _4552 = _4548;
    if (!_4550)
    {
        float _4554 = as_type<float>(_4514) + 0.0;
        bool _4556 = _4554 >= 0.0;
        bool _4558 = isnan(_4554);
        bool _4560 = _4556 || _4558;
        bool _4562 = isnan(0.0);
        bool _4564 = _4560 || _4562;
        int _4566 = as_type<int>(_4554);
        _4544 = _4564 ? (-1) : 0;
        if (!_4564)
        {
            _4566 = 2147483647;
        }
        int _4568 = _4566;
        bool _4570 = !_4564;
        _4552 = _4568;
        if (!_4570)
        {
            float _4572 = as_type<float>(_4514) + 0.0;
            bool _4574 = _4572 > as_type<float>(0x7f800000u /* inf */);
            bool _4576 = isnan(_4572);
            bool _4578 = _4574 || _4576;
            bool _4580 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4582 = _4578 || _4580;
            int _4584 = as_type<int>(_4572);
            _4544 = _4582 ? (-1) : 0;
            if (_4582)
            {
                float _4586 = as_type<float>(_4514) + 1.0;
                _4584 = as_type<int>(_4586);
            }
            int _4588 = _4584;
            _4552 = _4588;
            if (!_4582)
            {
                float _4590 = 0.0 + as_type<float>(_4514);
                bool _4592 = _4590 != as_type<float>(0x7f800000u /* inf */);
                bool _4594 = isnan(_4590);
                bool _4596 = _4592 || _4594;
                bool _4598 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4600 = _4596 || _4598;
                int _4602 = as_type<int>(_4590);
                _4544 = _4600 ? (-1) : 0;
                if (!_4600)
                {
                    _4602 = _4514;
                }
                int _4604 = _4602;
                bool _4606 = !_4600;
                _4552 = _4604;
                if (!_4606)
                {
                    float _4608 = as_type<float>(_4514) * 18446744073709551616.0;
                    float _4610 = rsqrt(_4608);
                    float _4612 = _4608 * _4610;
                    float _4614 = _4610 * 0.5;
                    float _4616 = -_4612;
                    float _4618 = 0.0 + _4616;
                    float _4620 = fma(_4614, _4618, 0.5);
                    float _4622 = fma(_4612, _4620, _4612);
                    float _4624 = -_4622;
                    float _4626 = 0.0 + _4624;
                    float _4628 = fma(_4622, _4626, _4608);
                    float _4630 = fma(_4614, _4628, _4622);
                    float _4632 = _4630 * 2.3283064365386962890625e-10;
                    _4552 = as_type<int>(_4632);
                    _4540 = as_type<int>(_4622);
                    _4542 = as_type<int>(_4618);
                }
            }
        }
    }
    int _4634 = _4552;
    int _4636 = _4540;
    int _4638 = _4542;
    int _4640 = _4544;
    _4518 = _4634;
    _4519 = _4516;
    _4520 = 0;
    _4521 = _4636;
    _4522 = _4638;
    _4523 = _4640;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1335 = false;
    bool _577 = false;
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
    int _117 = _60(_113, _115, (*spvDescriptorSet0.support_buffer));
    int _119 = as_type<int>(_85);
    int _121 = 0;
    int _123 = _60(_119, _121, (*spvDescriptorSet0.support_buffer));
    int3 _1889 = int3(_117, _123, 1);
    float3 _127 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1889.xy), uint(_1889.z), 0).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    int _135 = _70;
    int _137 = 0;
    int _139 = _60(_135, _137, (*spvDescriptorSet0.support_buffer));
    int _141 = as_type<int>(_93);
    int _143 = 0;
    int _145 = _60(_141, _143, (*spvDescriptorSet0.support_buffer));
    int3 _1907 = int3(_139, _145, 1);
    float3 _147 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1907.xy), uint(_1907.z), 0).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    int _155 = _70;
    int _157 = 0;
    int _159 = _60(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = as_type<int>(_85);
    int _163 = 0;
    int _165 = _60(_161, _163, (*spvDescriptorSet0.support_buffer));
    int3 _1925 = int3(_159, _165, 0);
    float3 _167 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1925.xy), uint(_1925.z), 0).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    int _175 = _70;
    int _177 = 0;
    int _179 = _60(_175, _177, (*spvDescriptorSet0.support_buffer));
    int _181 = as_type<int>(_93);
    int _183 = 0;
    int _185 = _60(_181, _183, (*spvDescriptorSet0.support_buffer));
    int3 _1943 = int3(_179, _185, 0);
    float3 _187 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1943.xy), uint(_1943.z), 0).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    int _195 = _70;
    int _197 = 1;
    int _199 = _60(_195, _197, (*spvDescriptorSet0.support_buffer));
    int _201 = as_type<int>(_103);
    int _203 = 1;
    int _205 = _60(_201, _203, (*spvDescriptorSet0.support_buffer));
    int3 _1961 = int3(_199, _205, 1);
    float3 _207 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1961.xy), uint(_1961.z), 0).xyz;
    float _209 = _207.x;
    float _211 = _207.y;
    float _213 = _207.z;
    int _215 = _70;
    int _217 = 1;
    int _219 = _60(_215, _217, (*spvDescriptorSet0.support_buffer));
    int _221 = as_type<int>(_111);
    int _223 = 1;
    int _225 = _60(_221, _223, (*spvDescriptorSet0.support_buffer));
    int3 _1979 = int3(_219, _225, 1);
    float3 _227 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1979.xy), uint(_1979.z), 0).xyz;
    float _229 = _227.x;
    float _231 = _227.y;
    float _233 = _227.z;
    int _235 = _70;
    int _237 = 0;
    int _239 = _60(_235, _237, (*spvDescriptorSet0.support_buffer));
    int _241 = as_type<int>(_85);
    int _243 = 0;
    int _245 = _60(_241, _243, (*spvDescriptorSet0.support_buffer));
    int3 _1997 = int3(_239, _245, 2);
    float3 _247 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1997.xy), uint(_1997.z), 0).xyz;
    float _249 = _247.x;
    float _251 = _247.y;
    float _253 = _247.z;
    int _255 = _70;
    int _257 = 0;
    int _259 = _60(_255, _257, (*spvDescriptorSet0.support_buffer));
    int _261 = as_type<int>(_93);
    int _263 = 0;
    int _265 = _60(_261, _263, (*spvDescriptorSet0.support_buffer));
    int3 _2015 = int3(_259, _265, 2);
    float3 _267 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2015.xy), uint(_2015.z), 0).xyz;
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
    float _299 = fma(_297, _283, _133);
    float _301 = _299 * 0.5;
    float _303 = _301 * 0.15915493667125701904296875;
    float _305 = -_131;
    float _307 = _305 + _151;
    float _309 = _303 * 6.283185482025146484375;
    float _311 = sin(_309);
    float _313 = fma(_307, _283, _131);
    float _315 = -_129;
    float _317 = _315 + _149;
    float _319 = _313 * 0.5;
    float _321 = fma(_317, _283, _129);
    float _323 = _303 * 6.283185482025146484375;
    float _325 = cos(_323);
    float _327 = _319 * 0.15915493667125701904296875;
    float _329 = _321 * 0.5;
    float _331 = -_213;
    float _333 = _331 + _233;
    float _335 = -_173;
    float _337 = _335 + _193;
    float _339 = _329 * 0.15915493667125701904296875;
    float _341 = fma(_333, _293, _213);
    float _343 = _327 * 6.283185482025146484375;
    float _345 = sin(_343);
    float _347 = fma(_337, _283, _173);
    float _349 = _341 * 0.5;
    float _351 = _349 * 0.15915493667125701904296875;
    float _353 = _327 * 6.283185482025146484375;
    float _355 = cos(_353);
    float _357 = _339 * 6.283185482025146484375;
    float _359 = sin(_357);
    float _361 = _311 * _345;
    float _363 = _339 * 6.283185482025146484375;
    float _365 = cos(_363);
    float _367 = _355 * _311;
    float _369 = _325 * _355;
    float _371 = _325 * _345;
    float _373 = _359 * _361;
    float _375 = _359 * _367;
    float _377 = _359 * _371;
    float _379 = _365 * _361;
    float _381 = fma(_365, _369, _373);
    float _383 = fma(_365, _371, _375);
    float _385 = -_377;
    float _387 = fma(_365, _367, _385);
    float _389 = -_379;
    float _391 = fma(_359, _369, _389);
    float _393 = -_171;
    float _395 = _393 + _191;
    float _397 = -_169;
    float _399 = _397 + _189;
    float _401 = _351 * 6.283185482025146484375;
    float _403 = sin(_401);
    float _405 = -_253;
    float _407 = _405 + _273;
    float _409 = fma(_395, _283, _171);
    float _411 = -_211;
    float _413 = _411 + _231;
    float _415 = fma(_399, _283, _169);
    float _417 = -_209;
    float _419 = _417 + _229;
    float _421 = fma(_407, _283, _253);
    float _423 = fma(_413, _293, _211);
    float _425 = _351 * 6.283185482025146484375;
    float _427 = cos(_425);
    float _429 = fma(_419, _293, _209);
    float _431 = _423 * 0.5;
    float _433 = _429 * 0.5;
    float _435 = _431 * 0.15915493667125701904296875;
    float _437 = _433 * 0.15915493667125701904296875;
    float _439 = _435 * 6.283185482025146484375;
    float _441 = cos(_439);
    float _443 = _435 * 6.283185482025146484375;
    float _445 = sin(_443);
    float _447 = _437 * 6.283185482025146484375;
    float _449 = sin(_447);
    float _451 = _441 * _403;
    float _453 = _437 * 6.283185482025146484375;
    float _455 = cos(_453);
    float _457 = _403 * _445;
    float _459 = _427 * _445;
    float _461 = _427 * _441;
    float _463 = _449 * _451;
    float _465 = _455 * _457;
    float _467 = fma(_455, _459, _463);
    float _469 = _449 * _459;
    float _471 = -_465;
    float _473 = fma(_449, _461, _471);
    float _475 = _383 * _467;
    float _477 = _449 * _457;
    float _479 = -_469;
    float _481 = fma(_455, _451, _479);
    float _483 = fma(_391, _473, _475);
    float _485 = fma(_455, _461, _477);
    float _487 = -_249;
    float _489 = _487 + _269;
    float _491 = fma(_387, _481, _483);
    float _493 = fma(_489, _283, _249);
    float _495 = fma(_381, _485, _491);
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
    float _517 = abs(_515);
    float _519 = -_517;
    float _521 = _519 + 1.0;
    float _523 = abs(_515);
    float _525 = fma(_523, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _527 = as_type<int>(_521) + (-218103808);
    float _529 = abs(_515);
    float _531 = fma(_529, _525, -0.212114393711090087890625);
    bool _533 = uint(_527) >= 1920991232u;
    float _535 = -_251;
    float _537 = _535 + _271;
    float _539 = abs(_515);
    float _541 = fma(_539, _531, 1.570728778839111328125);
    bool _543 = _515 < 0.0;
    float _545 = float(_543);
    float _547 = fma(_537, _283, _251);
    bool _549 = !_533;
    float _551 = _521;
    float _553 = _493;
    float _575;
    if (!_549)
    {
        int _555 = as_type<int>(_521);
        int _557 = as_type<int>(_463);
        int _559 = 1968;
        int _561 = as_type<int>(_269);
        int _563;
        int _565;
        int _567;
        int _569;
        int _571;
        int _573;
        _58(_555, _557, _559, _561, _563, _565, _567, _569, _571, _573);
        _575 = as_type<float>(_563);
        _551 = as_type<float>(_565);
        _577 = true;
    }
    else
    {
        float _579 = rsqrt(_521);
        float _581 = _521 * _579;
        float _583 = _579 * 0.5;
        float _585 = -_581;
        float _587 = 0.0 + _585;
        float _589 = fma(_583, _587, 0.5);
        float _591 = fma(_581, _589, _581);
        float _593 = -_591;
        float _595 = 0.0 + _593;
        float _597 = fma(_591, _595, _521);
        float _599 = fma(_583, _597, _591);
        _575 = _599;
    }
    _577 = false;
    float _601 = _575;
    float _603 = _551;
    int _605 = _76 + 8;
    uint _607 = uint(int(uint(_605) >> uint(2)));
    uint _609 = uint(int(uint(int(_607)) >> uint(2)));
    int _611 = int(_607) & 3;
    float _613 = (*spvDescriptorSet0.cp_c5)._m0[int(_609)][_611];
    int _615 = int(_607) + 1;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    int _619 = _615 & 3;
    float _621 = (*spvDescriptorSet0.cp_c5)._m0[int(_617)][_619];
    int _623 = _70;
    int _625 = 1;
    int _627 = _60(_623, _625, (*spvDescriptorSet0.support_buffer));
    int _629 = as_type<int>(_613);
    int _631 = 1;
    int _633 = _60(_629, _631, (*spvDescriptorSet0.support_buffer));
    int3 _2503 = int3(_627, _633, 0);
    float3 _635 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2503.xy), uint(_2503.z), 0).xyz;
    float _637 = _635.x;
    float _639 = _635.y;
    float _641 = _635.z;
    int _643 = _70;
    int _645 = 1;
    int _647 = _60(_643, _645, (*spvDescriptorSet0.support_buffer));
    int _649 = as_type<int>(_613);
    int _651 = 1;
    int _653 = _60(_649, _651, (*spvDescriptorSet0.support_buffer));
    int3 _2521 = int3(_647, _653, 2);
    float3 _655 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2521.xy), uint(_2521.z), 0).xyz;
    float _657 = _655.x;
    float _659 = _655.y;
    float _661 = _655.z;
    int _663 = _70;
    int _665 = 1;
    int _667 = _60(_663, _665, (*spvDescriptorSet0.support_buffer));
    int _669 = as_type<int>(_621);
    int _671 = 1;
    int _673 = _60(_669, _671, (*spvDescriptorSet0.support_buffer));
    int3 _2539 = int3(_667, _673, 0);
    float3 _675 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2539.xy), uint(_2539.z), 0).xyz;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    int _683 = _70;
    int _685 = 1;
    int _687 = _60(_683, _685, (*spvDescriptorSet0.support_buffer));
    int _689 = as_type<int>(_621);
    int _691 = 1;
    int _693 = _60(_689, _691, (*spvDescriptorSet0.support_buffer));
    int3 _2557 = int3(_687, _693, 2);
    float3 _695 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2557.xy), uint(_2557.z), 0).xyz;
    float _697 = _695.x;
    float _699 = _695.y;
    float _701 = _695.z;
    float _703 = _541 * _601;
    float _705 = _545 * 2.0;
    float _707 = -_705;
    float _709 = fma(_703, _707, _703);
    float _711 = fma(_545, 3.1415927410125732421875, _709);
    float _713 = _711 * 0.15915493667125701904296875;
    float _715 = _713 * 6.283185482025146484375;
    float _717 = sin(_715);
    float _719 = abs(_717);
    bool _721 = _719 >= 0.001000000047497451305389404296875;
    bool _723 = isnan(_719);
    bool _725 = _721 || _723;
    bool _727 = isnan(0.001000000047497451305389404296875);
    bool _729 = _725 || _727;
    float _731 = 0.0;
    float _733 = _603;
    float _735 = _703;
    if (!_729)
    {
        int _737 = _76 + 28;
        uint _739 = uint(int(uint(_737) >> uint(2)));
        uint _741 = uint(int(uint(int(_739)) >> uint(2)));
        int _743 = int(_739) & 3;
        float _745 = (*spvDescriptorSet0.cp_c5)._m0[int(_741)][_743];
        _731 = _745;
    }
    float _747 = _731;
    float _749 = _747;
    if (!_729)
    {
        float _751 = -_747;
        float _753 = _751 + 1.0;
        _733 = _753;
    }
    float _755 = _733;
    float _757 = _755;
    if (!_729)
    {
        _735 = _747;
    }
    float _759 = _735;
    bool _761 = !_729;
    float _763 = _759;
    if (!_761)
    {
        int _765 = _76 + 28;
        uint _767 = uint(int(uint(_765) >> uint(2)));
        uint _769 = uint(int(uint(int(_767)) >> uint(2)));
        int _771 = int(_767) & 3;
        float _773 = (*spvDescriptorSet0.cp_c5)._m0[int(_769)][_771];
        float _775 = 1.0 / _717;
        float _777 = _711 * _773;
        float _779 = _777 * 0.15915493667125701904296875;
        float _781 = -_777;
        float _783 = _711 + _781;
        float _785 = _783 * 0.15915493667125701904296875;
        float _787 = _779 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = _785 * 6.283185482025146484375;
        float _793 = sin(_791);
        float _795 = _789 * _775;
        float _797 = _793 * _775;
        _763 = _795;
        _757 = _797;
        _749 = _773;
    }
    float _799 = _763;
    float _801 = _757;
    float _803 = _749;
    bool _805 = !_509;
    float _807 = -_799;
    float _809 = _805 ? _807 : _799;
    int _811 = _76 + 20;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    uint _815 = uint(int(uint(int(_813)) >> uint(2)));
    int _817 = int(_813) & 3;
    float _819 = (*spvDescriptorSet0.cp_c5)._m0[int(_815)][_817];
    float _821 = -_641;
    float _823 = _821 + _681;
    float _825 = -_637;
    float _827 = _825 + _677;
    float _829 = -_661;
    float _831 = _829 + _701;
    float _833 = _485 * _809;
    float _835 = _473 * _809;
    float _837 = _481 * _809;
    float _839 = _467 * _809;
    float _841 = fma(_381, _801, _833);
    float _843 = fma(_391, _801, _835);
    int _845 = _76 + 24;
    uint _847 = uint(int(uint(_845) >> uint(2)));
    uint _849 = uint(int(uint(int(_847)) >> uint(2)));
    int _851 = int(_847) & 3;
    float _853 = (*spvDescriptorSet0.cp_c5)._m0[int(_849)][_851];
    float _855 = fma(_387, _801, _837);
    float _857 = _841 * 2.0;
    float _859 = fma(_383, _801, _839);
    float _861 = _843 * 2.0;
    bool _863 = _70 != 0;
    float _865 = _855 * _857;
    float _867 = _859 * _857;
    float _869 = _859 * 2.0;
    float _871 = _843 * _857;
    float _873 = -_865;
    float _875 = fma(_859, _861, _873);
    float _877 = fma(_855, _861, _867);
    float _879 = fma(_859, _861, _865);
    float _881 = -_867;
    float _883 = fma(_855, _861, _881);
    float _885 = -_871;
    float _887 = fma(_855, _869, _885);
    float _889 = fma(_855, _869, _871);
    float _891 = _843 * _843;
    float _893 = -_639;
    float _895 = _893 + _679;
    float _897 = _859 * _859;
    float _899 = _855 * _855;
    float _901 = fma(_891, -2.0, 1.0);
    float _903 = fma(_897, -2.0, 1.0);
    float _905 = fma(_823, _853, _641);
    float _907 = fma(_827, _853, _637);
    float _909 = fma(_895, _853, _639);
    float _911 = fma(_899, -2.0, _901);
    float _913 = _905 * _803;
    float _915 = _907 * _803;
    float _917 = _909 * _803;
    float _919 = fma(_897, -2.0, _901);
    float _921 = fma(_347, _819, _913);
    float _923 = -_657;
    float _925 = _923 + _697;
    float _927 = -_659;
    float _929 = _927 + _699;
    float _931 = fma(_415, _819, _915);
    float _933 = fma(_409, _819, _917);
    float _935 = fma(_925, _853, _657);
    float _937 = fma(_929, _853, _659);
    float _939 = fma(_831, _853, _661);
    float _941 = _879 * _931;
    float _943 = fma(_899, -2.0, _903);
    float _945 = _875 * _933;
    float _947 = _911 * _933;
    float _949 = _889 * _933;
    float _951 = _935 * _803;
    float _953 = _937 * _803;
    float _955 = _939 * _803;
    float _957 = _943 * _931;
    float _959 = _883 * _931;
    float _961 = _877 * _921;
    float _963 = _887 * _921;
    float _965 = _919 * _921;
    float _967 = fma(_493, _819, _951);
    float _969 = fma(_547, _819, _953);
    int _971 = _70 * 48;
    float _973 = fma(_421, _819, _955);
    int _975 = _70 * 112;
    float _977 = _943;
    float _979 = _877;
    float _981 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _983 = _883;
    float _985 = _947;
    float _987 = _949;
    float _989 = _941;
    float _991 = _959;
    float _993 = _963;
    float _995 = _961;
    float _997 = _965;
    if (!_863)
    {
        _977 = _967;
    }
    float _999 = _977;
    uint _1001 = uint(int(uint(_971) >> uint(2)));
    _39[int(_1001)] = as_type<uint>(_957);
    int _1003 = _971 + 4;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    _39[int(_1005)] = as_type<uint>(_945);
    int _1007 = _971 + 8;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    _39[int(_1009)] = as_type<uint>(_961);
    int _1011 = _971 + 12;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    _39[int(_1013)] = as_type<uint>(_967);
    bool _1015 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _1017 = _999;
    if (!_863)
    {
        _979 = _969;
    }
    float _1019 = _979;
    int _1021 = _971 + 16;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    _39[int(_1023)] = as_type<uint>(_941);
    int _1025 = _971 + 20;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    _39[int(_1027)] = as_type<uint>(_947);
    int _1029 = _971 + 24;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    _39[int(_1031)] = as_type<uint>(_963);
    int _1033 = _971 + 28;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    _39[int(_1035)] = as_type<uint>(_969);
    float _1037 = _1019;
    if (!_863)
    {
        _981 = _973;
    }
    float _1039 = _981;
    float _1041 = _1039;
    if (!_863)
    {
        _983 = _957;
    }
    float _1043 = _983;
    int _1045 = _971 + 32;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    _39[int(_1047)] = as_type<uint>(_959);
    int _1049 = _971 + 36;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    _39[int(_1051)] = as_type<uint>(_949);
    int _1053 = _971 + 40;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    _39[int(_1055)] = as_type<uint>(_965);
    int _1057 = _971 + 44;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    _39[int(_1059)] = as_type<uint>(_973);
    float _1061 = _1043;
    if (!_863)
    {
        _553 = _945;
    }
    float _1063 = _553;
    float _1065 = _1063;
    if (!_1015)
    {
        int _1067 = _70 * 48;
        int _1069 = _1067 + 16;
        uint _1071 = uint(int(uint(_1067) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1071)] = as_type<uint>(_957);
        int _1073 = _1067 + 4;
        uint _1075 = uint(int(uint(_1073) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1075)] = as_type<uint>(_945);
        int _1077 = _1067 + 8;
        uint _1079 = uint(int(uint(_1077) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1079)] = as_type<uint>(_961);
        int _1081 = _1067 + 12;
        uint _1083 = uint(int(uint(_1081) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1083)] = as_type<uint>(_967);
        int _1085 = _1067 + 32;
        uint _1087 = uint(int(uint(_1069) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1087)] = as_type<uint>(_941);
        int _1089 = _1069 + 4;
        uint _1091 = uint(int(uint(_1089) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1091)] = as_type<uint>(_947);
        int _1093 = _1069 + 8;
        uint _1095 = uint(int(uint(_1093) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1095)] = as_type<uint>(_963);
        int _1097 = _1069 + 12;
        uint _1099 = uint(int(uint(_1097) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1099)] = as_type<uint>(_969);
        uint _1101 = uint(int(uint(_1085) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1101)] = as_type<uint>(_959);
        int _1103 = _1085 + 4;
        uint _1105 = uint(int(uint(_1103) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1105)] = as_type<uint>(_949);
        int _1107 = _1085 + 8;
        uint _1109 = uint(int(uint(_1107) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1109)] = as_type<uint>(_965);
        int _1111 = _1085 + 12;
        uint _1113 = uint(int(uint(_1111) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1113)] = as_type<uint>(_973);
    }
    bool _1115 = !_863;
    if (!_1115)
    {
        bool _1117 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1119 = !_1117;
        if (!_1119)
        {
            uint _1121 = uint(int(uint(_975) >> uint(2)));
            uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
            int _1125 = int(_1121) & 3;
            float _1127 = (*spvDescriptorSet0.cp_c6)._m0[int(_1123)][_1125];
            int _1129 = as_type<int>(_1127) * 48;
            int _1131 = 0;
            bool _1133;
            float _1229;
            float _1231;
            float _1233;
            float _1253;
            float _1255;
            float _1259;
            float _1275;
            float _1279;
            float _1281;
            float _1283;
            float _1285;
            float _1287;
            do
            {
                int _1135 = _1131;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1137 = uint(int(uint(_1129) >> uint(2)));
                float _1139 = as_type<float>(_39[int(_1137)]);
                int _1141 = _1129 + 4;
                uint _1143 = uint(int(uint(_1141) >> uint(2)));
                float _1145 = as_type<float>(_39[int(_1143)]);
                int _1147 = _1129 + 8;
                uint _1149 = uint(int(uint(_1147) >> uint(2)));
                float _1151 = as_type<float>(_39[int(_1149)]);
                int _1153 = _1129 + 12;
                uint _1155 = uint(int(uint(_1153) >> uint(2)));
                float _1157 = as_type<float>(_39[int(_1155)]);
                int _1159 = _1135 + 1;
                int _1161 = _1129 + 16;
                uint _1163 = uint(int(uint(_1161) >> uint(2)));
                float _1165 = as_type<float>(_39[int(_1163)]);
                int _1167 = _1129 + 20;
                uint _1169 = uint(int(uint(_1167) >> uint(2)));
                float _1171 = as_type<float>(_39[int(_1169)]);
                int _1173 = _1129 + 24;
                uint _1175 = uint(int(uint(_1173) >> uint(2)));
                float _1177 = as_type<float>(_39[int(_1175)]);
                int _1179 = _1129 + 28;
                uint _1181 = uint(int(uint(_1179) >> uint(2)));
                float _1183 = as_type<float>(_39[int(_1181)]);
                bool _1185 = uint(_1159) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1187 = _1129 + 32;
                uint _1189 = uint(int(uint(_1187) >> uint(2)));
                float _1191 = as_type<float>(_39[int(_1189)]);
                int _1193 = _1129 + 36;
                uint _1195 = uint(int(uint(_1193) >> uint(2)));
                float _1197 = as_type<float>(_39[int(_1195)]);
                int _1199 = _1129 + 40;
                uint _1201 = uint(int(uint(_1199) >> uint(2)));
                float _1203 = as_type<float>(_39[int(_1201)]);
                int _1205 = _1129 + 44;
                uint _1207 = uint(int(uint(_1205) >> uint(2)));
                float _1209 = as_type<float>(_39[int(_1207)]);
                float _1211 = _969 * _1145;
                float _1213 = _941 * _1145;
                float _1215 = _947 * _1145;
                float _1217 = _963 * _1145;
                float _1219 = fma(_967, _1139, _1211);
                float _1221 = fma(_957, _1139, _1213);
                float _1223 = fma(_945, _1139, _1215);
                float _1225 = fma(_961, _1139, _1217);
                float _1227 = fma(_973, _1151, _1219);
                _1229 = fma(_959, _1151, _1221);
                _1231 = fma(_949, _1151, _1223);
                _1233 = fma(_965, _1151, _1225);
                float _1235 = _969 * _1171;
                float _1237 = _941 * _1171;
                float _1239 = _947 * _1171;
                float _1241 = _963 * _1171;
                float _1243 = fma(_967, _1165, _1235);
                float _1245 = fma(_957, _1165, _1237);
                float _1247 = fma(_945, _1165, _1239);
                float _1249 = fma(_961, _1165, _1241);
                float _1251 = fma(_973, _1177, _1243);
                _1253 = fma(_959, _1177, _1245);
                _1255 = fma(_949, _1177, _1247);
                float _1257 = _941 * _1197;
                _1259 = _1183 + _1251;
                float _1261 = _969 * _1197;
                float _1263 = _947 * _1197;
                float _1265 = _963 * _1197;
                float _1267 = fma(_957, _1191, _1257);
                float _1269 = fma(_967, _1191, _1261);
                float _1271 = fma(_945, _1191, _1263);
                float _1273 = fma(_961, _1191, _1265);
                _1275 = fma(_965, _1177, _1249);
                float _1277 = fma(_973, _1203, _1269);
                _1279 = _1157 + _1227;
                _1281 = fma(_959, _1203, _1267);
                _1283 = fma(_949, _1203, _1271);
                _1285 = fma(_965, _1203, _1273);
                _1287 = _1209 + _1277;
                uint _1289 = uint(int(uint(_971) >> uint(2)));
                _39[int(_1289)] = as_type<uint>(_1229);
                int _1291 = _971 + 4;
                uint _1293 = uint(int(uint(_1291) >> uint(2)));
                _39[int(_1293)] = as_type<uint>(_1231);
                int _1295 = _971 + 8;
                uint _1297 = uint(int(uint(_1295) >> uint(2)));
                _39[int(_1297)] = as_type<uint>(_1233);
                int _1299 = _971 + 12;
                uint _1301 = uint(int(uint(_1299) >> uint(2)));
                _39[int(_1301)] = as_type<uint>(_1279);
                int _1303 = _971 + 16;
                uint _1305 = uint(int(uint(_1303) >> uint(2)));
                _39[int(_1305)] = as_type<uint>(_1253);
                int _1307 = _971 + 20;
                uint _1309 = uint(int(uint(_1307) >> uint(2)));
                _39[int(_1309)] = as_type<uint>(_1255);
                int _1311 = _971 + 24;
                uint _1313 = uint(int(uint(_1311) >> uint(2)));
                _39[int(_1313)] = as_type<uint>(_1275);
                int _1315 = _971 + 28;
                uint _1317 = uint(int(uint(_1315) >> uint(2)));
                _39[int(_1317)] = as_type<uint>(_1259);
                int _1319 = _971 + 32;
                uint _1321 = uint(int(uint(_1319) >> uint(2)));
                _39[int(_1321)] = as_type<uint>(_1281);
                int _1323 = _971 + 36;
                uint _1325 = uint(int(uint(_1323) >> uint(2)));
                _39[int(_1325)] = as_type<uint>(_1283);
                int _1327 = _971 + 40;
                uint _1329 = uint(int(uint(_1327) >> uint(2)));
                _39[int(_1329)] = as_type<uint>(_1285);
                int _1331 = _971 + 44;
                uint _1333 = uint(int(uint(_1331) >> uint(2)));
                _39[int(_1333)] = as_type<uint>(_1287);
                _1133 = !_1185;
                _1131 = _1159;
            } while (_1133);
            _1065 = _1231;
            _985 = _1255;
            _987 = _1283;
            _1061 = _1229;
            _989 = _1253;
            _991 = _1281;
            _993 = _1275;
            _995 = _1233;
            _1037 = _1259;
            _997 = _1285;
            _1017 = _1279;
            _1041 = _1287;
            _1335 = true;
        }
        else
        {
            _1065 = 0.0;
            _985 = 0.0;
            _987 = 0.0;
            _1061 = 0.0;
            _989 = 0.0;
            _991 = 0.0;
            _993 = 0.0;
            _995 = 0.0;
            _1037 = 0.0;
            _997 = 0.0;
            _1017 = 0.0;
            _1041 = 0.0;
        }
    }
    _1335 = false;
    float _1337 = _1065;
    float _1339 = _985;
    float _1341 = _987;
    float _1343 = _1061;
    float _1345 = _989;
    float _1347 = _991;
    float _1349 = _993;
    float _1351 = _995;
    float _1353 = _1037;
    float _1355 = _997;
    float _1357 = _1017;
    float _1359 = _1041;
    int _1361 = _975 + 80;
    uint _1363 = uint(int(uint(_1361) >> uint(2)));
    uint _1365 = uint(int(uint(int(_1363)) >> uint(2)));
    int _1367 = int(_1363) & 3;
    float _1369 = (*spvDescriptorSet0.cp_c6)._m0[int(_1365)][_1367];
    int _1371 = int(_1363) + 1;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    int _1375 = _1371 & 3;
    float _1377 = (*spvDescriptorSet0.cp_c6)._m0[int(_1373)][_1375];
    int _1379 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1381 = _1379 + _70;
    int _1383 = _975 + 64;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.cp_c6)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.cp_c6)._m0[int(_1395)][_1397];
    int _1401 = _1381 * 48;
    int _1403 = _975 + 88;
    uint _1405 = uint(int(uint(_1403) >> uint(2)));
    uint _1407 = uint(int(uint(int(_1405)) >> uint(2)));
    int _1409 = int(_1405) & 3;
    float _1411 = (*spvDescriptorSet0.cp_c6)._m0[int(_1407)][_1409];
    int _1413 = int(_1405) + 1;
    uint _1415 = uint(int(uint(_1413) >> uint(2)));
    int _1417 = _1413 & 3;
    float _1419 = (*spvDescriptorSet0.cp_c6)._m0[int(_1415)][_1417];
    int _1421 = _975 + 72;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
    int _1427 = int(_1423) & 3;
    float _1429 = (*spvDescriptorSet0.cp_c6)._m0[int(_1425)][_1427];
    int _1431 = int(_1423) + 1;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    int _1435 = _1431 & 3;
    float _1437 = (*spvDescriptorSet0.cp_c6)._m0[int(_1433)][_1435];
    int _1439 = _975 + 104;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    uint _1443 = uint(int(uint(int(_1441)) >> uint(2)));
    int _1445 = int(_1441) & 3;
    float _1447 = (*spvDescriptorSet0.cp_c6)._m0[int(_1443)][_1445];
    int _1449 = int(_1441) + 1;
    uint _1451 = uint(int(uint(_1449) >> uint(2)));
    int _1453 = _1449 & 3;
    float _1455 = (*spvDescriptorSet0.cp_c6)._m0[int(_1451)][_1453];
    int _1457 = _975 + 96;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.cp_c6)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.cp_c6)._m0[int(_1469)][_1471];
    float _1475 = _1337 * _1369;
    float _1477 = _1339 * _1369;
    float _1479 = _1341 * _1377;
    int _1481 = _975 + 16;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    uint _1485 = uint(int(uint(int(_1483)) >> uint(2)));
    int _1487 = int(_1483) & 3;
    float _1489 = (*spvDescriptorSet0.cp_c6)._m0[int(_1485)][_1487];
    int _1491 = int(_1483) + 1;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    int _1495 = _1491 & 3;
    float _1497 = (*spvDescriptorSet0.cp_c6)._m0[int(_1493)][_1495];
    float _1499 = _1341 * _1369;
    float _1501 = fma(_1343, _1391, _1475);
    float _1503 = fma(_1345, _1391, _1477);
    float _1505 = _1337 * _1377;
    int _1507 = _975 + 32;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    uint _1511 = uint(int(uint(int(_1509)) >> uint(2)));
    int _1513 = int(_1509) & 3;
    float _1515 = (*spvDescriptorSet0.cp_c6)._m0[int(_1511)][_1513];
    int _1517 = int(_1509) + 1;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    int _1521 = _1517 & 3;
    float _1523 = (*spvDescriptorSet0.cp_c6)._m0[int(_1519)][_1521];
    float _1525 = _1339 * _1377;
    float _1527 = fma(_1347, _1399, _1479);
    float _1529 = fma(_1347, _1391, _1499);
    float _1531 = fma(_1343, _1399, _1505);
    float _1533 = _1337 * _1411;
    float _1535 = _1337 * _1419;
    float _1537 = _1339 * _1411;
    int _1539 = _975 + 48;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    uint _1543 = uint(int(uint(int(_1541)) >> uint(2)));
    int _1545 = int(_1541) & 3;
    float _1547 = (*spvDescriptorSet0.cp_c6)._m0[int(_1543)][_1545];
    int _1549 = int(_1541) + 1;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    int _1553 = _1549 & 3;
    float _1555 = (*spvDescriptorSet0.cp_c6)._m0[int(_1551)][_1553];
    float _1557 = _1339 * _1419;
    float _1559 = _1341 * _1411;
    float _1561 = _1341 * _1419;
    float _1563 = fma(_1345, _1399, _1525);
    float _1565 = fma(_1343, _1429, _1533);
    float _1567 = fma(_1343, _1437, _1535);
    float _1569 = fma(_1345, _1429, _1537);
    int _1571 = _975 + 24;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.cp_c6)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.cp_c6)._m0[int(_1583)][_1585];
    float _1589 = fma(_1345, _1437, _1557);
    float _1591 = fma(_1347, _1429, _1559);
    float _1593 = fma(_1347, _1437, _1561);
    float _1595 = fma(_1349, _1455, _1589);
    float _1597 = fma(_1351, _1455, _1567);
    float _1599 = fma(_1351, _1447, _1565);
    int _1601 = _975 + 40;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    uint _1605 = uint(int(uint(int(_1603)) >> uint(2)));
    int _1607 = int(_1603) & 3;
    float _1609 = (*spvDescriptorSet0.cp_c6)._m0[int(_1605)][_1607];
    int _1611 = int(_1603) + 1;
    uint _1613 = uint(int(uint(_1611) >> uint(2)));
    int _1615 = _1611 & 3;
    float _1617 = (*spvDescriptorSet0.cp_c6)._m0[int(_1613)][_1615];
    float _1619 = _1595 + _1353;
    float _1621 = fma(_1355, _1455, _1593);
    float _1623 = fma(_1355, _1447, _1591);
    float _1625 = _1597 + _1357;
    float _1627 = fma(_1351, _1465, _1501);
    float _1629 = fma(_1349, _1465, _1503);
    float _1631 = fma(_1351, _1473, _1531);
    int _1633 = _975 + 56;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    uint _1637 = uint(int(uint(int(_1635)) >> uint(2)));
    int _1639 = int(_1635) & 3;
    float _1641 = (*spvDescriptorSet0.cp_c6)._m0[int(_1637)][_1639];
    int _1643 = int(_1635) + 1;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    int _1647 = _1643 & 3;
    float _1649 = (*spvDescriptorSet0.cp_c6)._m0[int(_1645)][_1647];
    float _1651 = fma(_1355, _1465, _1529);
    float _1653 = fma(_1355, _1473, _1527);
    float _1655 = fma(_1349, _1447, _1569);
    float _1657 = fma(_1349, _1473, _1563);
    float _1659 = _1621 + _1359;
    int _1661 = _1401 + 32;
    float _1663 = _1619 * _1497;
    float _1665 = _1655 * _1497;
    float _1667 = _1629 * _1497;
    float _1669 = _1657 * _1497;
    float _1671 = fma(_1625, _1489, _1663);
    float _1673 = fma(_1599, _1489, _1665);
    float _1675 = fma(_1627, _1489, _1667);
    float _1677 = fma(_1631, _1489, _1669);
    float _1679 = _1619 * _1523;
    float _1681 = _1629 * _1523;
    float _1683 = _1657 * _1523;
    float _1685 = _1655 * _1523;
    float _1687 = fma(_1625, _1515, _1679);
    float _1689 = fma(_1627, _1515, _1681);
    float _1691 = fma(_1631, _1515, _1683);
    float _1693 = fma(_1599, _1515, _1685);
    float _1695 = _1619 * _1555;
    float _1697 = _1629 * _1555;
    float _1699 = _1657 * _1555;
    float _1701 = _1655 * _1555;
    float _1703 = fma(_1625, _1547, _1695);
    float _1705 = fma(_1627, _1547, _1697);
    float _1707 = fma(_1631, _1547, _1699);
    float _1709 = fma(_1599, _1547, _1701);
    float _1711 = fma(_1659, _1579, _1671);
    float _1713 = fma(_1623, _1579, _1673);
    float _1715 = fma(_1651, _1579, _1675);
    float _1717 = fma(_1653, _1579, _1677);
    float _1719 = _1711 + _1587;
    int _1721 = _1401 + 16;
    int _1723 = _1401 + 48;
    float _1725 = fma(_1659, _1609, _1687);
    float _1727 = fma(_1651, _1609, _1689);
    float _1729 = fma(_1653, _1609, _1691);
    float _1731 = fma(_1623, _1609, _1693);
    float _1733 = _1725 + _1617;
    uint _1735 = uint(int(uint(_1721) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1735)] = as_type<uint>(_1715);
    int _1737 = _1721 + 4;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1739)] = as_type<uint>(_1717);
    int _1741 = _1721 + 8;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1743)] = as_type<uint>(_1713);
    int _1745 = _1721 + 12;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1747)] = as_type<uint>(_1719);
    float _1749 = fma(_1659, _1641, _1703);
    float _1751 = fma(_1651, _1641, _1705);
    float _1753 = fma(_1653, _1641, _1707);
    float _1755 = fma(_1623, _1641, _1709);
    float _1757 = _1749 + _1649;
    uint _1759 = uint(int(uint(_1661) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1759)] = as_type<uint>(_1727);
    int _1761 = _1661 + 4;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1763)] = as_type<uint>(_1729);
    int _1765 = _1661 + 8;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1767)] = as_type<uint>(_1731);
    int _1769 = _1661 + 12;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1771)] = as_type<uint>(_1733);
    uint _1773 = uint(int(uint(_1723) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1773)] = as_type<uint>(_1751);
    int _1775 = _1723 + 4;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1777)] = as_type<uint>(_1753);
    int _1779 = _1723 + 8;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1781)] = as_type<uint>(_1755);
    int _1783 = _1723 + 12;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1785)] = as_type<uint>(_1757);
}

