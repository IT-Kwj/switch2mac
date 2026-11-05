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
int _60(thread const int& _4811, thread const int& _4812, constant _10& support_buffer)
{
    int _4815 = 1 + _4812;
    float _4817 = support_buffer._m5[_4815].x;
    bool _4819 = _4817 == 1.0;
    if (_4819)
    {
        return _4811;
    }
    float _4821 = float(_4811);
    float _4823 = _4821 * _4817;
    int _4825 = int(_4823);
    return _4825;
}

static inline __attribute__((always_inline))
void _58(thread const int& _4499, thread const int& _4500, thread const int& _4501, thread const int& _4502, thread int& _4503, thread int& _4504, thread int& _4505, thread int& _4506, thread int& _4507, thread int& _4508)
{
    float _4511 = as_type<float>(_4499) + 0.0;
    bool _4513 = _4511 != 0.0;
    bool _4515 = isnan(_4511);
    bool _4517 = _4513 || _4515;
    bool _4519 = isnan(0.0);
    bool _4521 = _4517 || _4519;
    int _4523 = as_type<int>(_4511);
    int _4525 = _4500;
    int _4527 = _4502;
    int _4529 = _4521 ? (-1) : 0;
    if (!_4521)
    {
        float _4531 = as_type<float>(_4499) * 1.0;
        _4523 = as_type<int>(_4531);
    }
    int _4533 = _4523;
    bool _4535 = !_4521;
    int _4537 = _4533;
    if (!_4535)
    {
        float _4539 = as_type<float>(_4499) + 0.0;
        bool _4541 = _4539 >= 0.0;
        bool _4543 = isnan(_4539);
        bool _4545 = _4541 || _4543;
        bool _4547 = isnan(0.0);
        bool _4549 = _4545 || _4547;
        int _4551 = as_type<int>(_4539);
        _4529 = _4549 ? (-1) : 0;
        if (!_4549)
        {
            _4551 = 2147483647;
        }
        int _4553 = _4551;
        bool _4555 = !_4549;
        _4537 = _4553;
        if (!_4555)
        {
            float _4557 = as_type<float>(_4499) + 0.0;
            bool _4559 = _4557 > as_type<float>(0x7f800000u /* inf */);
            bool _4561 = isnan(_4557);
            bool _4563 = _4559 || _4561;
            bool _4565 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4567 = _4563 || _4565;
            int _4569 = as_type<int>(_4557);
            _4529 = _4567 ? (-1) : 0;
            if (_4567)
            {
                float _4571 = as_type<float>(_4499) + 1.0;
                _4569 = as_type<int>(_4571);
            }
            int _4573 = _4569;
            _4537 = _4573;
            if (!_4567)
            {
                float _4575 = 0.0 + as_type<float>(_4499);
                bool _4577 = _4575 != as_type<float>(0x7f800000u /* inf */);
                bool _4579 = isnan(_4575);
                bool _4581 = _4577 || _4579;
                bool _4583 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4585 = _4581 || _4583;
                int _4587 = as_type<int>(_4575);
                _4529 = _4585 ? (-1) : 0;
                if (!_4585)
                {
                    _4587 = _4499;
                }
                int _4589 = _4587;
                bool _4591 = !_4585;
                _4537 = _4589;
                if (!_4591)
                {
                    float _4593 = as_type<float>(_4499) * 18446744073709551616.0;
                    float _4595 = rsqrt(_4593);
                    float _4597 = _4593 * _4595;
                    float _4599 = _4595 * 0.5;
                    float _4601 = -_4597;
                    float _4603 = 0.0 + _4601;
                    float _4605 = fma(_4599, _4603, 0.5);
                    float _4607 = fma(_4597, _4605, _4597);
                    float _4609 = -_4607;
                    float _4611 = 0.0 + _4609;
                    float _4613 = fma(_4607, _4611, _4593);
                    float _4615 = fma(_4599, _4613, _4607);
                    float _4617 = _4615 * 2.3283064365386962890625e-10;
                    _4537 = as_type<int>(_4617);
                    _4525 = as_type<int>(_4607);
                    _4527 = as_type<int>(_4603);
                }
            }
        }
    }
    int _4619 = _4537;
    int _4621 = _4525;
    int _4623 = _4527;
    int _4625 = _4529;
    _4503 = _4619;
    _4504 = _4501;
    _4505 = 0;
    _4506 = _4621;
    _4507 = _4623;
    _4508 = _4625;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1285 = false;
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
    int3 _1883 = int3(_117, _123, 1);
    float3 _127 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1883.xy), uint(_1883.z), 0).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    int _135 = _70;
    int _137 = 0;
    int _139 = _60(_135, _137, (*spvDescriptorSet0.support_buffer));
    int _141 = as_type<int>(_93);
    int _143 = 0;
    int _145 = _60(_141, _143, (*spvDescriptorSet0.support_buffer));
    int3 _1901 = int3(_139, _145, 1);
    float3 _147 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1901.xy), uint(_1901.z), 0).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    int _155 = _70;
    int _157 = 0;
    int _159 = _60(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = as_type<int>(_85);
    int _163 = 0;
    int _165 = _60(_161, _163, (*spvDescriptorSet0.support_buffer));
    int3 _1919 = int3(_159, _165, 0);
    float3 _167 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1919.xy), uint(_1919.z), 0).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    int _175 = _70;
    int _177 = 0;
    int _179 = _60(_175, _177, (*spvDescriptorSet0.support_buffer));
    int _181 = as_type<int>(_93);
    int _183 = 0;
    int _185 = _60(_181, _183, (*spvDescriptorSet0.support_buffer));
    int3 _1937 = int3(_179, _185, 0);
    float3 _187 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1937.xy), uint(_1937.z), 0).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    int _195 = _70;
    int _197 = 1;
    int _199 = _60(_195, _197, (*spvDescriptorSet0.support_buffer));
    int _201 = as_type<int>(_103);
    int _203 = 1;
    int _205 = _60(_201, _203, (*spvDescriptorSet0.support_buffer));
    int3 _1955 = int3(_199, _205, 1);
    float3 _207 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1955.xy), uint(_1955.z), 0).xyz;
    float _209 = _207.x;
    float _211 = _207.y;
    float _213 = _207.z;
    int _215 = _70;
    int _217 = 1;
    int _219 = _60(_215, _217, (*spvDescriptorSet0.support_buffer));
    int _221 = as_type<int>(_111);
    int _223 = 1;
    int _225 = _60(_221, _223, (*spvDescriptorSet0.support_buffer));
    int3 _1973 = int3(_219, _225, 1);
    float3 _227 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1973.xy), uint(_1973.z), 0).xyz;
    float _229 = _227.x;
    float _231 = _227.y;
    float _233 = _227.z;
    int _235 = _70;
    int _237 = 0;
    int _239 = _60(_235, _237, (*spvDescriptorSet0.support_buffer));
    int _241 = as_type<int>(_85);
    int _243 = 0;
    int _245 = _60(_241, _243, (*spvDescriptorSet0.support_buffer));
    int3 _1991 = int3(_239, _245, 2);
    float3 _247 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1991.xy), uint(_1991.z), 0).xyz;
    float _249 = _247.x;
    float _251 = _247.y;
    float _253 = _247.z;
    int _255 = _70;
    int _257 = 0;
    int _259 = _60(_255, _257, (*spvDescriptorSet0.support_buffer));
    int _261 = as_type<int>(_93);
    int _263 = 0;
    int _265 = _60(_261, _263, (*spvDescriptorSet0.support_buffer));
    int3 _2009 = int3(_259, _265, 2);
    float3 _267 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2009.xy), uint(_2009.z), 0).xyz;
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
    int3 _2497 = int3(_627, _633, 0);
    float3 _635 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2497.xy), uint(_2497.z), 0).xyz;
    float _637 = _635.x;
    float _639 = _635.y;
    float _641 = _635.z;
    int _643 = _70;
    int _645 = 1;
    int _647 = _60(_643, _645, (*spvDescriptorSet0.support_buffer));
    int _649 = as_type<int>(_613);
    int _651 = 1;
    int _653 = _60(_649, _651, (*spvDescriptorSet0.support_buffer));
    int3 _2515 = int3(_647, _653, 2);
    float3 _655 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2515.xy), uint(_2515.z), 0).xyz;
    float _657 = _655.x;
    float _659 = _655.y;
    float _661 = _655.z;
    int _663 = _70;
    int _665 = 1;
    int _667 = _60(_663, _665, (*spvDescriptorSet0.support_buffer));
    int _669 = as_type<int>(_621);
    int _671 = 1;
    int _673 = _60(_669, _671, (*spvDescriptorSet0.support_buffer));
    int3 _2533 = int3(_667, _673, 0);
    float3 _675 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2533.xy), uint(_2533.z), 0).xyz;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    int _683 = _70;
    int _685 = 1;
    int _687 = _60(_683, _685, (*spvDescriptorSet0.support_buffer));
    int _689 = as_type<int>(_621);
    int _691 = 1;
    int _693 = _60(_689, _691, (*spvDescriptorSet0.support_buffer));
    int3 _2551 = int3(_687, _693, 2);
    float3 _695 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2551.xy), uint(_2551.z), 0).xyz;
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
    float _731 = _545;
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
    float _811 = -_637;
    float _813 = _811 + _677;
    float _815 = -_641;
    float _817 = _815 + _681;
    float _819 = -_661;
    float _821 = _819 + _701;
    bool _823 = _70 != 0;
    float _825 = _473 * _809;
    float _827 = _485 * _809;
    float _829 = _481 * _809;
    float _831 = _467 * _809;
    float _833 = fma(_391, _801, _825);
    float _835 = fma(_381, _801, _827);
    int _837 = _76 + 24;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    uint _841 = uint(int(uint(int(_839)) >> uint(2)));
    int _843 = int(_839) & 3;
    float _845 = (*spvDescriptorSet0.cp_c5)._m0[int(_841)][_843];
    float _847 = fma(_387, _801, _829);
    float _849 = fma(_383, _801, _831);
    float _851 = _835 * 2.0;
    float _853 = _833 * 2.0;
    float _855 = _849 * 2.0;
    float _857 = _847 * _851;
    int _859 = _76 + 20;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    uint _863 = uint(int(uint(int(_861)) >> uint(2)));
    int _865 = int(_861) & 3;
    float _867 = (*spvDescriptorSet0.cp_c5)._m0[int(_863)][_865];
    float _869 = _849 * _851;
    float _871 = _833 * _851;
    float _873 = -_857;
    float _875 = fma(_849, _853, _873);
    float _877 = fma(_849, _853, _857);
    float _879 = fma(_847, _853, _869);
    float _881 = -_869;
    float _883 = fma(_847, _853, _881);
    float _885 = -_871;
    float _887 = fma(_847, _855, _885);
    float _889 = fma(_847, _855, _871);
    float _891 = _833 * _833;
    float _893 = -_639;
    float _895 = _893 + _679;
    float _897 = _849 * _849;
    float _899 = _847 * _847;
    float _901 = fma(_891, -2.0, 1.0);
    float _903 = fma(_813, _845, _637);
    float _905 = fma(_895, _845, _639);
    float _907 = fma(_897, -2.0, 1.0);
    float _909 = fma(_899, -2.0, _901);
    float _911 = _903 * _803;
    float _913 = _905 * _803;
    float _915 = fma(_899, -2.0, _907);
    float _917 = fma(_897, -2.0, _901);
    float _919 = fma(_415, _867, _911);
    float _921 = fma(_409, _867, _913);
    float _923 = fma(_817, _845, _641);
    float _925 = -_657;
    float _927 = _925 + _697;
    float _929 = _877 * _919;
    float _931 = _915 * _919;
    float _933 = _883 * _919;
    float _935 = -_659;
    float _937 = _935 + _699;
    float _939 = _923 * _803;
    float _941 = fma(_927, _845, _657);
    float _943 = fma(_821, _845, _661);
    float _945 = fma(_937, _845, _659);
    float _947 = _875 * _921;
    float _949 = _909 * _921;
    float _951 = _889 * _921;
    float _953 = fma(_347, _867, _939);
    float _955 = _941 * _803;
    float _957 = _945 * _803;
    float _959 = _943 * _803;
    float _961 = _879 * _953;
    float _963 = _887 * _953;
    float _965 = _917 * _953;
    float _967 = fma(_493, _867, _955);
    int _969 = _70 * 48;
    float _971 = fma(_547, _867, _957);
    float _973 = fma(_421, _867, _959);
    int _975 = _70 * 112;
    float _977 = _953;
    float _979 = _883;
    float _981 = _889;
    float _983 = _929;
    float _985 = _949;
    float _987 = _963;
    float _989 = _971;
    float _991 = _933;
    float _993 = _951;
    float _995 = _965;
    float _997 = _973;
    if (!_823)
    {
        _977 = _967;
    }
    float _999 = _977;
    uint _1001 = uint(int(uint(_969) >> uint(2)));
    _39[int(_1001)] = as_type<uint>(_931);
    int _1003 = _969 + 4;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    _39[int(_1005)] = as_type<uint>(_947);
    int _1007 = _969 + 8;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    _39[int(_1009)] = as_type<uint>(_961);
    int _1011 = _969 + 12;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    _39[int(_1013)] = as_type<uint>(_967);
    int _1015 = _969 + 16;
    int _1017 = _969 + 32;
    int _1019 = _969 + 16;
    uint _1021 = uint(int(uint(_1019) >> uint(2)));
    _39[int(_1021)] = as_type<uint>(_929);
    int _1023 = _969 + 20;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    _39[int(_1025)] = as_type<uint>(_949);
    int _1027 = _969 + 24;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    _39[int(_1029)] = as_type<uint>(_963);
    int _1031 = _969 + 28;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    _39[int(_1033)] = as_type<uint>(_971);
    float _1035 = _999;
    if (!_823)
    {
        _553 = _931;
    }
    float _1037 = _553;
    float _1039 = _1037;
    if (!_823)
    {
        _979 = _947;
    }
    float _1041 = _979;
    int _1043 = _969 + 32;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    _39[int(_1045)] = as_type<uint>(_933);
    int _1047 = _969 + 36;
    uint _1049 = uint(int(uint(_1047) >> uint(2)));
    _39[int(_1049)] = as_type<uint>(_951);
    int _1051 = _969 + 40;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    _39[int(_1053)] = as_type<uint>(_965);
    int _1055 = _969 + 44;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    _39[int(_1057)] = as_type<uint>(_973);
    float _1059 = _1041;
    if (!_823)
    {
        _981 = _961;
    }
    float _1061 = _981;
    bool _1063 = !_823;
    float _1065 = _1061;
    if (!_1063)
    {
        bool _1067 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1069 = !_1067;
        if (!_1069)
        {
            uint _1071 = uint(int(uint(_975) >> uint(2)));
            uint _1073 = uint(int(uint(int(_1071)) >> uint(2)));
            int _1075 = int(_1071) & 3;
            float _1077 = (*spvDescriptorSet0.cp_c6)._m0[int(_1073)][_1075];
            int _1079 = as_type<int>(_1077) * 48;
            int _1081 = 0;
            bool _1083;
            float _1179;
            float _1181;
            float _1185;
            float _1193;
            float _1199;
            float _1205;
            float _1211;
            float _1227;
            float _1231;
            float _1233;
            float _1235;
            float _1237;
            do
            {
                int _1085 = _1081;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1087 = uint(int(uint(_1079) >> uint(2)));
                float _1089 = as_type<float>(_39[int(_1087)]);
                int _1091 = _1079 + 4;
                uint _1093 = uint(int(uint(_1091) >> uint(2)));
                float _1095 = as_type<float>(_39[int(_1093)]);
                int _1097 = _1079 + 8;
                uint _1099 = uint(int(uint(_1097) >> uint(2)));
                float _1101 = as_type<float>(_39[int(_1099)]);
                int _1103 = _1079 + 12;
                uint _1105 = uint(int(uint(_1103) >> uint(2)));
                float _1107 = as_type<float>(_39[int(_1105)]);
                int _1109 = _1085 + 1;
                int _1111 = _1079 + 16;
                uint _1113 = uint(int(uint(_1111) >> uint(2)));
                float _1115 = as_type<float>(_39[int(_1113)]);
                int _1117 = _1079 + 20;
                uint _1119 = uint(int(uint(_1117) >> uint(2)));
                float _1121 = as_type<float>(_39[int(_1119)]);
                int _1123 = _1079 + 24;
                uint _1125 = uint(int(uint(_1123) >> uint(2)));
                float _1127 = as_type<float>(_39[int(_1125)]);
                int _1129 = _1079 + 28;
                uint _1131 = uint(int(uint(_1129) >> uint(2)));
                float _1133 = as_type<float>(_39[int(_1131)]);
                bool _1135 = uint(_1109) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1137 = _1079 + 32;
                uint _1139 = uint(int(uint(_1137) >> uint(2)));
                float _1141 = as_type<float>(_39[int(_1139)]);
                int _1143 = _1079 + 36;
                uint _1145 = uint(int(uint(_1143) >> uint(2)));
                float _1147 = as_type<float>(_39[int(_1145)]);
                int _1149 = _1079 + 40;
                uint _1151 = uint(int(uint(_1149) >> uint(2)));
                float _1153 = as_type<float>(_39[int(_1151)]);
                int _1155 = _1079 + 44;
                uint _1157 = uint(int(uint(_1155) >> uint(2)));
                float _1159 = as_type<float>(_39[int(_1157)]);
                float _1161 = _971 * _1095;
                float _1163 = _929 * _1095;
                float _1165 = _949 * _1095;
                float _1167 = _963 * _1095;
                float _1169 = fma(_967, _1089, _1161);
                float _1171 = fma(_931, _1089, _1163);
                float _1173 = fma(_947, _1089, _1165);
                float _1175 = fma(_961, _1089, _1167);
                float _1177 = fma(_973, _1101, _1169);
                _1179 = fma(_933, _1101, _1171);
                _1181 = fma(_951, _1101, _1173);
                float _1183 = _929 * _1121;
                _1185 = _1107 + _1177;
                float _1187 = _971 * _1121;
                float _1189 = _949 * _1121;
                float _1191 = fma(_931, _1115, _1183);
                _1193 = fma(_965, _1101, _1175);
                float _1195 = fma(_967, _1115, _1187);
                float _1197 = fma(_947, _1115, _1189);
                _1199 = fma(_933, _1127, _1191);
                float _1201 = _963 * _1121;
                float _1203 = fma(_973, _1127, _1195);
                _1205 = fma(_951, _1127, _1197);
                float _1207 = _929 * _1147;
                float _1209 = _949 * _1147;
                _1211 = _1133 + _1203;
                float _1213 = _971 * _1147;
                float _1215 = _963 * _1147;
                float _1217 = fma(_961, _1115, _1201);
                float _1219 = fma(_931, _1141, _1207);
                float _1221 = fma(_967, _1141, _1213);
                float _1223 = fma(_947, _1141, _1209);
                float _1225 = fma(_961, _1141, _1215);
                _1227 = fma(_965, _1127, _1217);
                float _1229 = fma(_973, _1153, _1221);
                _1231 = fma(_933, _1153, _1219);
                _1233 = fma(_951, _1153, _1223);
                _1235 = fma(_965, _1153, _1225);
                _1237 = _1159 + _1229;
                uint _1239 = uint(int(uint(_969) >> uint(2)));
                _39[int(_1239)] = as_type<uint>(_1179);
                int _1241 = _969 + 4;
                uint _1243 = uint(int(uint(_1241) >> uint(2)));
                _39[int(_1243)] = as_type<uint>(_1181);
                int _1245 = _969 + 8;
                uint _1247 = uint(int(uint(_1245) >> uint(2)));
                _39[int(_1247)] = as_type<uint>(_1193);
                int _1249 = _969 + 12;
                uint _1251 = uint(int(uint(_1249) >> uint(2)));
                _39[int(_1251)] = as_type<uint>(_1185);
                int _1253 = _969 + 16;
                uint _1255 = uint(int(uint(_1253) >> uint(2)));
                _39[int(_1255)] = as_type<uint>(_1199);
                int _1257 = _969 + 20;
                uint _1259 = uint(int(uint(_1257) >> uint(2)));
                _39[int(_1259)] = as_type<uint>(_1205);
                int _1261 = _969 + 24;
                uint _1263 = uint(int(uint(_1261) >> uint(2)));
                _39[int(_1263)] = as_type<uint>(_1227);
                int _1265 = _969 + 28;
                uint _1267 = uint(int(uint(_1265) >> uint(2)));
                _39[int(_1267)] = as_type<uint>(_1211);
                int _1269 = _969 + 32;
                uint _1271 = uint(int(uint(_1269) >> uint(2)));
                _39[int(_1271)] = as_type<uint>(_1231);
                int _1273 = _969 + 36;
                uint _1275 = uint(int(uint(_1273) >> uint(2)));
                _39[int(_1275)] = as_type<uint>(_1233);
                int _1277 = _969 + 40;
                uint _1279 = uint(int(uint(_1277) >> uint(2)));
                _39[int(_1279)] = as_type<uint>(_1235);
                int _1281 = _969 + 44;
                uint _1283 = uint(int(uint(_1281) >> uint(2)));
                _39[int(_1283)] = as_type<uint>(_1237);
                _1083 = !_1135;
                _1081 = _1109;
            } while (_1083);
            _1039 = _1179;
            _1059 = _1181;
            _1065 = _1193;
            _1035 = _1185;
            _983 = _1199;
            _985 = _1205;
            _987 = _1227;
            _989 = _1211;
            _991 = _1231;
            _993 = _1233;
            _995 = _1235;
            _997 = _1237;
            _1285 = true;
        }
        else
        {
            _1039 = 0.0;
            _1059 = 0.0;
            _1065 = 0.0;
            _1035 = 0.0;
            _983 = 0.0;
            _985 = 0.0;
            _987 = 0.0;
            _989 = 0.0;
            _991 = 0.0;
            _993 = 0.0;
            _995 = 0.0;
            _997 = 0.0;
        }
    }
    _1285 = false;
    float _1287 = _1039;
    float _1289 = _1059;
    float _1291 = _1065;
    float _1293 = _1035;
    float _1295 = _983;
    float _1297 = _985;
    float _1299 = _987;
    float _1301 = _989;
    float _1303 = _991;
    float _1305 = _993;
    float _1307 = _995;
    float _1309 = _997;
    int _1311 = _975 + 80;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.cp_c6)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.cp_c6)._m0[int(_1323)][_1325];
    bool _1329 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1331 = _975 + 64;
    uint _1333 = uint(int(uint(_1331) >> uint(2)));
    uint _1335 = uint(int(uint(int(_1333)) >> uint(2)));
    int _1337 = int(_1333) & 3;
    float _1339 = (*spvDescriptorSet0.cp_c6)._m0[int(_1335)][_1337];
    int _1341 = int(_1333) + 1;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    int _1345 = _1341 & 3;
    float _1347 = (*spvDescriptorSet0.cp_c6)._m0[int(_1343)][_1345];
    int _1349 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1351 = _1349 + _70;
    int _1353 = _975 + 88;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    uint _1357 = uint(int(uint(int(_1355)) >> uint(2)));
    int _1359 = int(_1355) & 3;
    float _1361 = (*spvDescriptorSet0.cp_c6)._m0[int(_1357)][_1359];
    int _1363 = int(_1355) + 1;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    int _1367 = _1363 & 3;
    float _1369 = (*spvDescriptorSet0.cp_c6)._m0[int(_1365)][_1367];
    int _1371 = _975 + 72;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.cp_c6)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.cp_c6)._m0[int(_1383)][_1385];
    int _1389 = _975 + 96;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
    int _1395 = int(_1391) & 3;
    float _1397 = (*spvDescriptorSet0.cp_c6)._m0[int(_1393)][_1395];
    int _1399 = int(_1391) + 1;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    int _1403 = _1399 & 3;
    float _1405 = (*spvDescriptorSet0.cp_c6)._m0[int(_1401)][_1403];
    int _1407 = _975 + 104;
    uint _1409 = uint(int(uint(_1407) >> uint(2)));
    uint _1411 = uint(int(uint(int(_1409)) >> uint(2)));
    int _1413 = int(_1409) & 3;
    float _1415 = (*spvDescriptorSet0.cp_c6)._m0[int(_1411)][_1413];
    int _1417 = int(_1409) + 1;
    uint _1419 = uint(int(uint(_1417) >> uint(2)));
    int _1421 = _1417 & 3;
    float _1423 = (*spvDescriptorSet0.cp_c6)._m0[int(_1419)][_1421];
    int _1425 = _975 + 16;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    uint _1429 = uint(int(uint(int(_1427)) >> uint(2)));
    int _1431 = int(_1427) & 3;
    float _1433 = (*spvDescriptorSet0.cp_c6)._m0[int(_1429)][_1431];
    int _1435 = int(_1427) + 1;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    int _1439 = _1435 & 3;
    float _1441 = (*spvDescriptorSet0.cp_c6)._m0[int(_1437)][_1439];
    if (!_1329)
    {
        uint _1443 = uint(int(uint(_969) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1443)] = as_type<uint>(_1287);
        int _1445 = _969 + 4;
        uint _1447 = uint(int(uint(_1445) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1447)] = as_type<uint>(_1289);
        int _1449 = _969 + 8;
        uint _1451 = uint(int(uint(_1449) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1451)] = as_type<uint>(_1291);
        int _1453 = _969 + 12;
        uint _1455 = uint(int(uint(_1453) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1455)] = as_type<uint>(_1293);
        uint _1457 = uint(int(uint(_1015) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1457)] = as_type<uint>(_1295);
        int _1459 = _1015 + 4;
        uint _1461 = uint(int(uint(_1459) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1461)] = as_type<uint>(_1297);
        int _1463 = _1015 + 8;
        uint _1465 = uint(int(uint(_1463) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1465)] = as_type<uint>(_1299);
        int _1467 = _1015 + 12;
        uint _1469 = uint(int(uint(_1467) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1469)] = as_type<uint>(_1301);
        uint _1471 = uint(int(uint(_1017) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1471)] = as_type<uint>(_1303);
        int _1473 = _1017 + 4;
        uint _1475 = uint(int(uint(_1473) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1475)] = as_type<uint>(_1305);
        int _1477 = _1017 + 8;
        uint _1479 = uint(int(uint(_1477) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1479)] = as_type<uint>(_1307);
        int _1481 = _1017 + 12;
        uint _1483 = uint(int(uint(_1481) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1483)] = as_type<uint>(_1309);
    }
    float _1485 = _1297 * _1319;
    float _1487 = _1305 * _1319;
    int _1489 = _975 + 32;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    uint _1493 = uint(int(uint(int(_1491)) >> uint(2)));
    int _1495 = int(_1491) & 3;
    float _1497 = (*spvDescriptorSet0.cp_c6)._m0[int(_1493)][_1495];
    int _1499 = int(_1491) + 1;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    int _1503 = _1499 & 3;
    float _1505 = (*spvDescriptorSet0.cp_c6)._m0[int(_1501)][_1503];
    float _1507 = _1289 * _1319;
    float _1509 = fma(_1295, _1339, _1485);
    float _1511 = fma(_1303, _1339, _1487);
    float _1513 = _1289 * _1327;
    float _1515 = _1297 * _1327;
    float _1517 = _1305 * _1327;
    float _1519 = _1289 * _1369;
    int _1521 = _975 + 48;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
    int _1527 = int(_1523) & 3;
    float _1529 = (*spvDescriptorSet0.cp_c6)._m0[int(_1525)][_1527];
    int _1531 = int(_1523) + 1;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    int _1535 = _1531 & 3;
    float _1537 = (*spvDescriptorSet0.cp_c6)._m0[int(_1533)][_1535];
    float _1539 = fma(_1287, _1347, _1513);
    float _1541 = fma(_1295, _1347, _1515);
    float _1543 = fma(_1303, _1347, _1517);
    float _1545 = _1289 * _1361;
    float _1547 = _1297 * _1361;
    float _1549 = _1297 * _1369;
    float _1551 = _1305 * _1361;
    float _1553 = _1305 * _1369;
    int _1555 = _975 + 24;
    uint _1557 = uint(int(uint(_1555) >> uint(2)));
    uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
    int _1561 = int(_1557) & 3;
    float _1563 = (*spvDescriptorSet0.cp_c6)._m0[int(_1559)][_1561];
    int _1565 = int(_1557) + 1;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    int _1569 = _1565 & 3;
    float _1571 = (*spvDescriptorSet0.cp_c6)._m0[int(_1567)][_1569];
    float _1573 = fma(_1287, _1379, _1545);
    float _1575 = fma(_1287, _1387, _1519);
    float _1577 = fma(_1295, _1379, _1547);
    float _1579 = fma(_1295, _1387, _1549);
    float _1581 = fma(_1303, _1379, _1551);
    float _1583 = fma(_1303, _1387, _1553);
    float _1585 = fma(_1291, _1405, _1539);
    int _1587 = _975 + 40;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    uint _1591 = uint(int(uint(int(_1589)) >> uint(2)));
    int _1593 = int(_1589) & 3;
    float _1595 = (*spvDescriptorSet0.cp_c6)._m0[int(_1591)][_1593];
    int _1597 = int(_1589) + 1;
    uint _1599 = uint(int(uint(_1597) >> uint(2)));
    int _1601 = _1597 & 3;
    float _1603 = (*spvDescriptorSet0.cp_c6)._m0[int(_1599)][_1601];
    float _1605 = fma(_1299, _1397, _1509);
    float _1607 = fma(_1299, _1405, _1541);
    float _1609 = fma(_1299, _1415, _1577);
    float _1611 = fma(_1299, _1423, _1579);
    float _1613 = fma(_1291, _1423, _1575);
    float _1615 = fma(_1307, _1423, _1583);
    float _1617 = fma(_1287, _1339, _1507);
    int _1619 = _975 + 56;
    uint _1621 = uint(int(uint(_1619) >> uint(2)));
    uint _1623 = uint(int(uint(int(_1621)) >> uint(2)));
    int _1625 = int(_1621) & 3;
    float _1627 = (*spvDescriptorSet0.cp_c6)._m0[int(_1623)][_1625];
    int _1629 = int(_1621) + 1;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    int _1633 = _1629 & 3;
    float _1635 = (*spvDescriptorSet0.cp_c6)._m0[int(_1631)][_1633];
    float _1637 = _1611 + _1301;
    float _1639 = _1613 + _1293;
    float _1641 = _1615 + _1309;
    float _1643 = fma(_1291, _1397, _1617);
    float _1645 = _1637 * _1441;
    float _1647 = fma(_1307, _1397, _1511);
    float _1649 = fma(_1307, _1405, _1543);
    float _1651 = fma(_1291, _1415, _1573);
    float _1653 = fma(_1307, _1415, _1581);
    float _1655 = _1607 * _1441;
    float _1657 = _1605 * _1441;
    float _1659 = _1609 * _1441;
    float _1661 = fma(_1639, _1433, _1645);
    float _1663 = fma(_1585, _1433, _1655);
    float _1665 = _1637 * _1505;
    float _1667 = _1605 * _1505;
    float _1669 = _1607 * _1505;
    float _1671 = _1609 * _1505;
    float _1673 = fma(_1639, _1497, _1665);
    int _1675 = _1351 * 48;
    float _1677 = fma(_1643, _1433, _1657);
    float _1679 = fma(_1651, _1433, _1659);
    float _1681 = _1637 * _1537;
    float _1683 = _1607 * _1537;
    float _1685 = _1605 * _1537;
    float _1687 = _1609 * _1537;
    float _1689 = fma(_1639, _1529, _1681);
    float _1691 = fma(_1643, _1497, _1667);
    float _1693 = fma(_1585, _1497, _1669);
    float _1695 = fma(_1651, _1497, _1671);
    float _1697 = fma(_1585, _1529, _1683);
    float _1699 = fma(_1641, _1563, _1661);
    float _1701 = fma(_1643, _1529, _1685);
    float _1703 = fma(_1651, _1529, _1687);
    float _1705 = fma(_1649, _1563, _1663);
    float _1707 = fma(_1647, _1563, _1677);
    float _1709 = fma(_1653, _1563, _1679);
    float _1711 = _1699 + _1571;
    int _1713 = _1675 + 16;
    float _1715 = fma(_1641, _1595, _1673);
    float _1717 = fma(_1647, _1595, _1691);
    float _1719 = fma(_1649, _1595, _1693);
    float _1721 = fma(_1653, _1595, _1695);
    float _1723 = _1715 + _1603;
    int _1725 = _1675 + 32;
    int _1727 = _1675 + 48;
    float _1729 = fma(_1641, _1627, _1689);
    float _1731 = fma(_1649, _1627, _1697);
    float _1733 = fma(_1647, _1627, _1701);
    float _1735 = fma(_1653, _1627, _1703);
    float _1737 = _1729 + _1635;
    uint _1739 = uint(int(uint(_1713) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1739)] = as_type<uint>(_1707);
    int _1741 = _1713 + 4;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1743)] = as_type<uint>(_1705);
    int _1745 = _1713 + 8;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1747)] = as_type<uint>(_1709);
    int _1749 = _1713 + 12;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1751)] = as_type<uint>(_1711);
    uint _1753 = uint(int(uint(_1725) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1753)] = as_type<uint>(_1717);
    int _1755 = _1725 + 4;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1757)] = as_type<uint>(_1719);
    int _1759 = _1725 + 8;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1761)] = as_type<uint>(_1721);
    int _1763 = _1725 + 12;
    uint _1765 = uint(int(uint(_1763) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1765)] = as_type<uint>(_1723);
    uint _1767 = uint(int(uint(_1727) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1767)] = as_type<uint>(_1733);
    int _1769 = _1727 + 4;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1771)] = as_type<uint>(_1731);
    int _1773 = _1727 + 8;
    uint _1775 = uint(int(uint(_1773) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1775)] = as_type<uint>(_1735);
    int _1777 = _1727 + 12;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1779)] = as_type<uint>(_1737);
}

