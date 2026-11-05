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
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4782, thread const int& _4783, constant _10& support_buffer)
{
    int _4786 = 1 + _4783;
    float _4788 = support_buffer._m5[_4786].x;
    bool _4790 = _4788 == 1.0;
    if (_4790)
    {
        return _4782;
    }
    float _4792 = float(_4782);
    float _4794 = _4792 * _4788;
    int _4796 = int(_4794);
    return _4796;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4470, thread const int& _4471, thread const int& _4472, thread const int& _4473, thread int& _4474, thread int& _4475, thread int& _4476, thread int& _4477, thread int& _4478, thread int& _4479)
{
    float _4482 = as_type<float>(_4471) + 0.0;
    bool _4484 = _4482 != 0.0;
    bool _4486 = isnan(_4482);
    bool _4488 = _4484 || _4486;
    bool _4490 = isnan(0.0);
    bool _4492 = _4488 || _4490;
    int _4494 = as_type<int>(_4482);
    int _4496 = _4471;
    int _4498 = _4472;
    int _4500 = _4492 ? (-1) : 0;
    if (!_4492)
    {
        float _4502 = as_type<float>(_4471) * 1.0;
        _4494 = as_type<int>(_4502);
    }
    int _4504 = _4494;
    bool _4506 = !_4492;
    int _4508 = _4504;
    if (!_4506)
    {
        float _4510 = as_type<float>(_4471) + 0.0;
        bool _4512 = _4510 >= 0.0;
        bool _4514 = isnan(_4510);
        bool _4516 = _4512 || _4514;
        bool _4518 = isnan(0.0);
        bool _4520 = _4516 || _4518;
        int _4522 = as_type<int>(_4510);
        _4500 = _4520 ? (-1) : 0;
        if (!_4520)
        {
            _4522 = 2147483647;
        }
        int _4524 = _4522;
        bool _4526 = !_4520;
        _4508 = _4524;
        if (!_4526)
        {
            float _4528 = as_type<float>(_4471) + 0.0;
            bool _4530 = _4528 > as_type<float>(0x7f800000u /* inf */);
            bool _4532 = isnan(_4528);
            bool _4534 = _4530 || _4532;
            bool _4536 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4538 = _4534 || _4536;
            int _4540 = as_type<int>(_4528);
            _4500 = _4538 ? (-1) : 0;
            if (_4538)
            {
                float _4542 = as_type<float>(_4471) + 1.0;
                _4540 = as_type<int>(_4542);
            }
            int _4544 = _4540;
            _4508 = _4544;
            if (!_4538)
            {
                float _4546 = 0.0 + as_type<float>(_4471);
                bool _4548 = _4546 != as_type<float>(0x7f800000u /* inf */);
                bool _4550 = isnan(_4546);
                bool _4552 = _4548 || _4550;
                bool _4554 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4556 = _4552 || _4554;
                int _4558 = as_type<int>(_4546);
                _4500 = _4556 ? (-1) : 0;
                if (!_4556)
                {
                    _4558 = _4471;
                }
                int _4560 = _4558;
                bool _4562 = !_4556;
                _4508 = _4560;
                if (!_4562)
                {
                    float _4564 = as_type<float>(_4471) * 18446744073709551616.0;
                    float _4566 = rsqrt(_4564);
                    float _4568 = _4564 * _4566;
                    float _4570 = _4566 * 0.5;
                    float _4572 = -_4568;
                    float _4574 = 0.0 + _4572;
                    float _4576 = fma(_4570, _4574, 0.5);
                    float _4578 = fma(_4568, _4576, _4568);
                    float _4580 = -_4578;
                    float _4582 = 0.0 + _4580;
                    float _4584 = fma(_4578, _4582, _4564);
                    float _4586 = fma(_4570, _4584, _4578);
                    float _4588 = _4586 * 2.3283064365386962890625e-10;
                    _4508 = as_type<int>(_4588);
                    _4496 = as_type<int>(_4574);
                    _4498 = as_type<int>(_4578);
                }
            }
        }
    }
    int _4590 = _4508;
    int _4592 = _4496;
    int _4594 = _4498;
    int _4596 = _4500;
    _4474 = _4590;
    _4475 = _4473;
    _4476 = 0;
    _4477 = _4592;
    _4478 = _4594;
    _4479 = _4596;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1357 = false;
    bool _907 = false;
    bool _597 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = _68 & 31;
    bool _76 = _74 == 0;
    bool _78 = uint(_74) < 32u;
    int _80 = 32 - _74;
    int _82 = _74 - 32;
    int _84 = 1 << _74;
    uint _87 = uint(int(uint(0) >> uint(_80)));
    int _89 = _84 | int(_87);
    int _91 = _76 ? 1 : _89;
    bool _93 = uint(_82) < 32u;
    int _95 = 0 << _82;
    int _97 = _93 ? _95 : 0;
    float _99 = _78 ? as_type<float>(_91) : as_type<float>(_97);
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 36;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _101 + 32;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.cp_c5)._m0[int(_117)][_119];
    int _123 = as_type<int>(_99) & as_type<int>(_111);
    bool _125 = _123 != 0;
    int _127 = as_type<int>(_99) & as_type<int>(_121);
    bool _129 = _127 != 0;
    int _131 = 0;
    float _133 = _99;
    float _135 = _121;
    if (_125)
    {
        int _137 = _101 + 8;
        uint _139 = uint(int(uint(_137) >> uint(2)));
        uint _141 = uint(int(uint(int(_139)) >> uint(2)));
        int _143 = int(_139) & 3;
        float _145 = (*spvDescriptorSet0.cp_c5)._m0[int(_141)][_143];
        _131 = as_type<int>(_145);
    }
    int _147 = _131;
    float _149 = 0.0;
    if (_125)
    {
        _149 = 1.4012984643248170709237295832899e-45;
    }
    float _151 = _149;
    int _153 = 0;
    if (_129)
    {
        uint _155 = uint(int(uint(_101) >> uint(2)));
        uint _157 = uint(int(uint(int(_155)) >> uint(2)));
        int _159 = int(_155) & 3;
        float _161 = (*spvDescriptorSet0.cp_c5)._m0[int(_157)][_159];
        _153 = as_type<int>(_161);
    }
    int _163 = _153;
    float _165 = 0.0;
    if (_129)
    {
        _165 = 2.8025969286496341418474591665798e-45;
    }
    float _167 = _165;
    if (_129)
    {
        _133 = 1.4012984643248170709237295832899e-45;
    }
    float _169 = _133;
    float _171 = _151;
    float _173 = as_type<float>(_68);
    float _175 = as_type<float>(_147);
    if (_125)
    {
        int _177 = _68;
        int _179 = 0;
        int _181 = _58(_177, _179, (*spvDescriptorSet0.support_buffer));
        int _183 = _147;
        int _185 = 0;
        int _187 = _58(_183, _185, (*spvDescriptorSet0.support_buffer));
        int3 _2011 = int3(_181, _187, as_type<int>(_151));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2011.xy), uint(_2011.z), 0).xyz;
        float _193 = _191.x;
        float _195 = _191.y;
        float _197 = _191.z;
        _171 = _193;
        _173 = _195;
        _175 = _197;
    }
    float _199 = _171;
    float _201 = _173;
    float _203 = _175;
    float _205 = 0.0;
    float _207 = as_type<float>(_68);
    float _209 = _111;
    if (_129)
    {
        int _211 = _68;
        int _213 = 1;
        int _215 = _58(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = _163;
        int _219 = 1;
        int _221 = _58(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _2040 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2040.xy), uint(_2040.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        _205 = _225;
        _207 = _227;
        _209 = _229;
    }
    float _231 = _205;
    float _233 = _207;
    float _235 = _209;
    float _237 = _167;
    float _239 = as_type<float>(_68);
    float _241 = 0.0;
    if (_129)
    {
        int _243 = _68;
        int _245 = 1;
        int _247 = _58(_243, _245, (*spvDescriptorSet0.support_buffer));
        int _249 = _163;
        int _251 = 1;
        int _253 = _58(_249, _251, (*spvDescriptorSet0.support_buffer));
        int3 _2071 = int3(_247, _253, as_type<int>(_167));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2071.xy), uint(_2071.z), 0).xyz;
        float _257 = _255.x;
        float _259 = _255.y;
        float _261 = _255.z;
        _237 = _257;
        _239 = _259;
        _241 = _261;
    }
    float _263 = _237;
    float _265 = _239;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = 0.0;
    float _273 = _169;
    if (_129)
    {
        int _275 = _68;
        int _277 = 1;
        int _279 = _58(_275, _277, (*spvDescriptorSet0.support_buffer));
        int _281 = _163;
        int _283 = 1;
        int _285 = _58(_281, _283, (*spvDescriptorSet0.support_buffer));
        int3 _2100 = int3(_279, _285, as_type<int>(_169));
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2100.xy), uint(_2100.z), 0).xyz;
        float _289 = _287.x;
        float _291 = _287.y;
        float _293 = _287.z;
        _269 = _289;
        _271 = _291;
        _273 = _293;
    }
    float _295 = _269;
    float _297 = _271;
    float _299 = _273;
    float _301 = 0.0;
    float _303 = 0.0;
    if (!_129)
    {
        _301 = 0.0;
        _303 = 0.0;
    }
    float _305 = _301;
    float _307 = _303;
    float _309 = 0.0;
    float _311 = _305;
    float _313 = _307;
    if (!_129)
    {
        _309 = 0.0;
    }
    float _315 = _309;
    float _317 = 0.0;
    float _319 = _315;
    if (!_129)
    {
        _317 = 0.0;
        _135 = 0.0;
    }
    float _321 = _317;
    float _323 = _135;
    float _325 = 0.0;
    float _327 = _321;
    float _329 = _323;
    if (!_129)
    {
        _325 = 0.0;
    }
    float _331 = _325;
    float _333 = 0.0;
    float _335 = _331;
    if (!_129)
    {
        _333 = 0.0;
    }
    float _337 = _333;
    float _339 = 0.0;
    float _341 = _337;
    if (!_129)
    {
        _339 = 0.0;
    }
    float _343 = _339;
    float _345 = 0.0;
    float _347 = _343;
    if (!_129)
    {
        _345 = 0.0;
    }
    float _349 = _345;
    bool _351 = !_129;
    float _353 = _349;
    float _355 = _265;
    if (!_351)
    {
        _327 = _299;
        _329 = _297;
        _353 = _295;
        _311 = _231;
        _319 = _233;
        _313 = _235;
        _335 = _263;
        _341 = _265;
        _347 = _267;
    }
    float _357 = _327;
    float _359 = _329;
    float _361 = _353;
    float _363 = _311;
    float _365 = _319;
    float _367 = _313;
    float _369 = _335;
    float _371 = _341;
    float _373 = _347;
    bool _375 = !_125;
    float _377 = _363;
    int _379 = as_type<int>(_369);
    int _381 = as_type<int>(_371);
    int _383 = as_type<int>(_373);
    float _385 = _365;
    float _387 = _367;
    float _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    float _891;
    float _893;
    float _895;
    float _897;
    float _899;
    float _901;
    float _903;
    float _905;
    if (!_375)
    {
        float _389 = _357 * 0.5;
        float _391 = _359 * 0.5;
        float _393 = _203 * 0.5;
        float _395 = _201 * 0.5;
        float _397 = _389 * 0.15915493667125701904296875;
        float _399 = _391 * 0.15915493667125701904296875;
        float _401 = _361 * 0.5;
        float _403 = _393 * 0.15915493667125701904296875;
        float _405 = _395 * 0.15915493667125701904296875;
        float _407 = _199 * 0.5;
        float _409 = _397 * 6.283185482025146484375;
        float _411 = cos(_409);
        float _413 = _401 * 0.15915493667125701904296875;
        float _415 = _407 * 0.15915493667125701904296875;
        float _417 = _399 * 6.283185482025146484375;
        float _419 = cos(_417);
        float _421 = _397 * 6.283185482025146484375;
        float _423 = sin(_421);
        float _425 = _403 * 6.283185482025146484375;
        float _427 = sin(_425);
        float _429 = _411 * _419;
        float _431 = _405 * 6.283185482025146484375;
        float _433 = cos(_431);
        float _435 = _419 * _423;
        float _437 = _399 * 6.283185482025146484375;
        float _439 = sin(_437);
        float _441 = _403 * 6.283185482025146484375;
        float _443 = cos(_441);
        float _445 = _433 * _427;
        float _447 = _413 * 6.283185482025146484375;
        float _449 = sin(_447);
        float _451 = _405 * 6.283185482025146484375;
        float _453 = sin(_451);
        float _455 = _443 * _433;
        float _457 = _415 * 6.283185482025146484375;
        float _459 = sin(_457);
        float _461 = _449 * _435;
        float _463 = _413 * 6.283185482025146484375;
        float _465 = cos(_463);
        float _467 = _443 * _453;
        float _469 = _427 * _453;
        float _471 = _415 * 6.283185482025146484375;
        float _473 = cos(_471);
        float _475 = _411 * _439;
        float _477 = _423 * _439;
        float _479 = _459 * _445;
        float _481 = _449 * _477;
        float _483 = _465 * _477;
        float _485 = fma(_465, _475, _461);
        float _487 = _449 * _475;
        float _489 = fma(_465, _429, _481);
        float _491 = -_483;
        float _493 = fma(_449, _429, _491);
        float _495 = -_487;
        float _497 = fma(_465, _435, _495);
        float _499 = _473 * _469;
        float _501 = fma(_473, _467, _479);
        float _503 = _459 * _467;
        float _505 = -_499;
        float _507 = fma(_459, _455, _505);
        float _509 = _485 * _501;
        float _511 = _459 * _469;
        float _513 = -_503;
        float _515 = fma(_473, _445, _513);
        float _517 = fma(_493, _507, _509);
        float _519 = fma(_473, _455, _511);
        float _521 = fma(_497, _515, _517);
        float _523 = fma(_489, _519, _521);
        float _525 = precise::max(_523, -1.0);
        float _527 = precise::min(_525, 1.0);
        bool _529 = _527 >= 0.0;
        bool _531 = isnan(_527);
        bool _533 = _529 || _531;
        bool _535 = isnan(0.0);
        bool _537 = _533 || _535;
        bool _539 = !_537;
        float _541 = -_527;
        float _543 = _539 ? _541 : _527;
        bool _545 = _543 < 0.0;
        float _547 = float(_545);
        float _549 = abs(_543);
        float _551 = -_549;
        float _553 = _551 + 1.0;
        float _555 = abs(_543);
        float _557 = fma(_555, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _559 = as_type<int>(_553) + (-218103808);
        float _561 = abs(_543);
        float _563 = fma(_561, _557, -0.212114393711090087890625);
        bool _565 = uint(_559) >= 1920991232u;
        float _567 = abs(_543);
        float _569 = fma(_567, _563, 1.570728778839111328125);
        bool _571 = !_565;
        float _593;
        float _595;
        if (!_571)
        {
            int _573 = _559;
            int _575 = as_type<int>(_553);
            int _577 = as_type<int>(_483);
            int _579 = 1840;
            int _581;
            int _583;
            int _585;
            int _587;
            int _589;
            int _591;
            _56(_573, _575, _577, _579, _581, _583, _585, _587, _589, _591);
            _593 = as_type<float>(_581);
            _595 = as_type<float>(_583);
            _597 = true;
        }
        else
        {
            float _599 = rsqrt(_553);
            float _601 = _553 * _599;
            float _603 = _599 * 0.5;
            float _605 = -_601;
            float _607 = 0.0 + _605;
            float _609 = fma(_603, _607, 0.5);
            float _611 = fma(_601, _609, _601);
            float _613 = -_611;
            float _615 = 0.0 + _613;
            float _617 = fma(_611, _615, _553);
            float _619 = fma(_603, _617, _611);
            _593 = _619;
            _595 = _617;
        }
        _597 = false;
        float _621 = _593;
        float _623 = _595;
        int _625 = _101 + 8;
        uint _627 = uint(int(uint(_625) >> uint(2)));
        uint _629 = uint(int(uint(int(_627)) >> uint(2)));
        int _631 = int(_627) & 3;
        float _633 = (*spvDescriptorSet0.cp_c5)._m0[int(_629)][_631];
        int _635 = _68;
        int _637 = 0;
        int _639 = _58(_635, _637, (*spvDescriptorSet0.support_buffer));
        int _641 = as_type<int>(_633);
        int _643 = 0;
        int _645 = _58(_641, _643, (*spvDescriptorSet0.support_buffer));
        int3 _2520 = int3(_639, _645, 0);
        float3 _647 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2520.xy), uint(_2520.z), 0).xyz;
        float _649 = _647.x;
        float _651 = _647.y;
        float _653 = _647.z;
        int _655 = _68;
        int _657 = 0;
        int _659 = _58(_655, _657, (*spvDescriptorSet0.support_buffer));
        int _661 = as_type<int>(_633);
        int _663 = 0;
        int _665 = _58(_661, _663, (*spvDescriptorSet0.support_buffer));
        int3 _2538 = int3(_659, _665, 2);
        float3 _667 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2538.xy), uint(_2538.z), 0).xyz;
        float _669 = _667.x;
        float _671 = _667.y;
        float _673 = _667.z;
        float _675 = _569 * _621;
        float _677 = _547 * 2.0;
        float _679 = -_677;
        float _681 = fma(_675, _679, _675);
        float _683 = fma(_547, 3.1415927410125732421875, _681);
        float _685 = _683 * 0.15915493667125701904296875;
        float _687 = _685 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = abs(_689);
        bool _693 = _691 >= 0.001000000047497451305389404296875;
        bool _695 = isnan(_691);
        bool _697 = _693 || _695;
        bool _699 = isnan(0.001000000047497451305389404296875);
        bool _701 = _697 || _699;
        float _703 = 0.0;
        float _705 = _623;
        float _707 = _675;
        if (!_701)
        {
            int _709 = _101 + 28;
            uint _711 = uint(int(uint(_709) >> uint(2)));
            uint _713 = uint(int(uint(int(_711)) >> uint(2)));
            int _715 = int(_711) & 3;
            float _717 = (*spvDescriptorSet0.cp_c5)._m0[int(_713)][_715];
            _703 = _717;
        }
        float _719 = _703;
        float _721 = _719;
        if (!_701)
        {
            float _723 = -_719;
            float _725 = _723 + 1.0;
            _705 = _725;
        }
        float _727 = _705;
        float _729 = _727;
        if (!_701)
        {
            _707 = _719;
        }
        float _731 = _707;
        bool _733 = !_701;
        float _735 = _731;
        if (!_733)
        {
            int _737 = _101 + 28;
            uint _739 = uint(int(uint(_737) >> uint(2)));
            uint _741 = uint(int(uint(int(_739)) >> uint(2)));
            int _743 = int(_739) & 3;
            float _745 = (*spvDescriptorSet0.cp_c5)._m0[int(_741)][_743];
            float _747 = 1.0 / _689;
            float _749 = _683 * _745;
            float _751 = _749 * 0.15915493667125701904296875;
            float _753 = -_749;
            float _755 = _683 + _753;
            float _757 = _755 * 0.15915493667125701904296875;
            float _759 = _751 * 6.283185482025146484375;
            float _761 = sin(_759);
            float _763 = _757 * 6.283185482025146484375;
            float _765 = sin(_763);
            float _767 = _761 * _747;
            float _769 = _765 * _747;
            _735 = _767;
            _721 = _745;
            _729 = _769;
        }
        float _771 = _735;
        float _773 = _721;
        float _775 = _729;
        bool _777 = !_537;
        float _779 = -_771;
        float _781 = _777 ? _779 : _771;
        float _783 = _649 * _773;
        float _785 = _651 * _773;
        float _787 = _653 * _773;
        float _789 = _519 * _781;
        float _791 = _507 * _781;
        int _793 = _101 + 20;
        uint _795 = uint(int(uint(_793) >> uint(2)));
        uint _797 = uint(int(uint(int(_795)) >> uint(2)));
        int _799 = int(_795) & 3;
        float _801 = (*spvDescriptorSet0.cp_c5)._m0[int(_797)][_799];
        float _803 = _501 * _781;
        float _805 = _515 * _781;
        float _807 = fma(_489, _775, _789);
        float _809 = fma(_493, _775, _791);
        float _811 = fma(_485, _775, _803);
        float _813 = fma(_497, _775, _805);
        float _815 = _807 * 2.0;
        float _817 = _809 * _809;
        float _819 = _811 * _811;
        float _821 = _809 * 2.0;
        float _823 = _813 * _815;
        float _825 = _809 * _815;
        float _827 = _811 * _815;
        float _829 = _811 * 2.0;
        float _831 = fma(_817, -2.0, 1.0);
        float _833 = _813 * _813;
        float _835 = fma(_819, -2.0, 1.0);
        float _837 = -_825;
        float _839 = fma(_813, _829, _837);
        float _841 = -_823;
        float _843 = fma(_811, _821, _841);
        float _845 = fma(_813, _829, _825);
        float _847 = fma(_811, _821, _823);
        float _849 = fma(_813, _821, _827);
        float _851 = _669 * _773;
        float _853 = _671 * _773;
        float _855 = _673 * _773;
        float _857 = -_827;
        float _859 = fma(_813, _821, _857);
        float _861 = fma(_833, -2.0, _835);
        float _863 = fma(_833, -2.0, _831);
        float _865 = fma(_819, -2.0, _831);
        float _867 = fma(_363, _801, _783);
        float _869 = fma(_365, _801, _785);
        float _871 = fma(_367, _801, _787);
        float _873 = fma(_369, _801, _851);
        float _875 = fma(_371, _801, _853);
        float _877 = fma(_373, _801, _855);
        _377 = _867;
        _879 = _861;
        _881 = _847;
        _883 = _859;
        _885 = _869;
        _887 = _843;
        _889 = _863;
        _891 = _845;
        _893 = _871;
        _895 = _849;
        _897 = _839;
        _899 = _865;
        _379 = as_type<int>(_873);
        _381 = as_type<int>(_875);
        _383 = as_type<int>(_877);
        _901 = _853;
        _903 = _809;
        _905 = _801;
        _355 = _787;
        _907 = true;
    }
    else
    {
        float _909 = _361 * 0.15915493667125701904296875;
        float _911 = _357 * 0.15915493667125701904296875;
        float _913 = _359 * 0.15915493667125701904296875;
        float _915 = _909 * 6.283185482025146484375;
        float _917 = sin(_915);
        float _919 = _909 * 6.283185482025146484375;
        float _921 = cos(_919);
        float _923 = _911 * 6.283185482025146484375;
        float _925 = sin(_923);
        float _927 = _911 * 6.283185482025146484375;
        float _929 = cos(_927);
        float _931 = _913 * 6.283185482025146484375;
        float _933 = sin(_931);
        float _935 = _925 * _921;
        float _937 = _917 * _925;
        float _939 = _913 * 6.283185482025146484375;
        float _941 = cos(_939);
        float _943 = _921 * _929;
        float _945 = _917 * _929;
        float _947 = _917 * _933;
        float _949 = _941 * _929;
        float _951 = _925 * _941;
        float _953 = _921 * _941;
        float _955 = -_935;
        float _957 = fma(_929, _947, _955);
        float _959 = fma(_925, _947, _943);
        float _961 = _917 * _941;
        float _963 = fma(_933, _943, _937);
        float _965 = -_945;
        float _967 = fma(_933, _935, _965);
        float _969 = -_933;
        float _971 = _969 + (-0.0);
        _879 = _949;
        _881 = _951;
        _883 = _971;
        _885 = _365;
        _887 = _957;
        _889 = _959;
        _891 = _961;
        _893 = _367;
        _895 = _963;
        _897 = _967;
        _899 = _953;
        _901 = _947;
        _903 = _933;
        _905 = _913;
    }
    _907 = false;
    float _973 = _377;
    float _975 = _879;
    float _977 = _881;
    float _979 = _883;
    float _981 = _885;
    float _983 = _887;
    float _985 = _889;
    float _987 = _891;
    float _989 = _893;
    float _991 = _895;
    float _993 = _897;
    float _995 = _899;
    int _997 = _379;
    int _999 = _381;
    int _1001 = _383;
    float _1003 = _901;
    float _1005 = _903;
    float _1007 = _905;
    float _1009 = _355;
    float _1011 = _973 * _975;
    float _1013 = _973 * _977;
    float _1015 = _973 * _979;
    float _1017 = _981 * _983;
    float _1019 = _981 * _985;
    float _1021 = _981 * _987;
    int _1023 = _68 * 48;
    float _1025 = _989 * _991;
    float _1027 = _989 * _993;
    float _1029 = _989 * _995;
    bool _1031 = _68 != 0;
    uint _1033 = uint(int(uint(_1023) >> uint(2)));
    _37[int(_1033)] = as_type<uint>(_1011);
    int _1035 = _1023 + 4;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    _37[int(_1037)] = as_type<uint>(_1017);
    int _1039 = _1023 + 8;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    _37[int(_1041)] = as_type<uint>(_1025);
    int _1043 = _1023 + 12;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    _37[int(_1045)] = uint(_997);
    int _1047 = _68 * 112;
    int _1049 = _1023 + 16;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    _37[int(_1051)] = as_type<uint>(_1013);
    int _1053 = _1023 + 20;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    _37[int(_1055)] = as_type<uint>(_1019);
    int _1057 = _1023 + 24;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    _37[int(_1059)] = as_type<uint>(_1027);
    int _1061 = _1023 + 28;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    _37[int(_1063)] = uint(_999);
    int _1065 = _1023 + 32;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    _37[int(_1067)] = as_type<uint>(_1015);
    int _1069 = _1023 + 36;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    _37[int(_1071)] = as_type<uint>(_1021);
    int _1073 = _1023 + 40;
    uint _1075 = uint(int(uint(_1073) >> uint(2)));
    _37[int(_1075)] = as_type<uint>(_1029);
    int _1077 = _1023 + 44;
    uint _1079 = uint(int(uint(_1077) >> uint(2)));
    _37[int(_1079)] = uint(_1001);
    float _1081 = _1009;
    float _1083 = _1007;
    float _1085 = _1005;
    float _1087 = _973;
    float _1089 = _989;
    float _1091 = _1003;
    float _1093 = _981;
    float _1095 = _1021;
    float _1097 = _1029;
    float _1099 = as_type<float>(_1001);
    if (!_1031)
    {
        _1081 = _1011;
    }
    float _1101 = _1081;
    float _1103 = _1101;
    if (!_1031)
    {
        _1083 = _1017;
    }
    float _1105 = _1083;
    float _1107 = _1105;
    if (!_1031)
    {
        _1085 = _1025;
    }
    float _1109 = _1085;
    float _1111 = _1109;
    if (!_1031)
    {
        _385 = as_type<float>(_997);
    }
    float _1113 = _385;
    float _1115 = _1113;
    if (!_1031)
    {
        _1087 = _1013;
    }
    float _1117 = _1087;
    float _1119 = _1117;
    if (!_1031)
    {
        _387 = _1019;
    }
    float _1121 = _387;
    float _1123 = _1121;
    if (!_1031)
    {
        _1089 = _1027;
    }
    float _1125 = _1089;
    float _1127 = _1125;
    if (!_1031)
    {
        _1091 = as_type<float>(_999);
    }
    float _1129 = _1091;
    float _1131 = _1129;
    if (!_1031)
    {
        _1093 = _1015;
    }
    float _1133 = _1093;
    bool _1135 = !_1031;
    float _1137 = _1133;
    if (!_1135)
    {
        bool _1139 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1141 = !_1139;
        if (!_1141)
        {
            uint _1143 = uint(int(uint(_1047) >> uint(2)));
            uint _1145 = uint(int(uint(int(_1143)) >> uint(2)));
            int _1147 = int(_1143) & 3;
            float _1149 = (*spvDescriptorSet0.cp_c6)._m0[int(_1145)][_1147];
            int _1151 = as_type<int>(_1149) * 48;
            int _1153 = 0;
            bool _1155;
            float _1251;
            float _1255;
            float _1259;
            float _1263;
            float _1277;
            float _1279;
            float _1291;
            float _1301;
            float _1303;
            float _1305;
            float _1307;
            float _1309;
            do
            {
                int _1157 = _1153;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1159 = uint(int(uint(_1151) >> uint(2)));
                float _1161 = as_type<float>(_37[int(_1159)]);
                int _1163 = _1151 + 4;
                uint _1165 = uint(int(uint(_1163) >> uint(2)));
                float _1167 = as_type<float>(_37[int(_1165)]);
                int _1169 = _1151 + 8;
                uint _1171 = uint(int(uint(_1169) >> uint(2)));
                float _1173 = as_type<float>(_37[int(_1171)]);
                int _1175 = _1151 + 12;
                uint _1177 = uint(int(uint(_1175) >> uint(2)));
                float _1179 = as_type<float>(_37[int(_1177)]);
                int _1181 = _1157 + 1;
                int _1183 = _1151 + 16;
                uint _1185 = uint(int(uint(_1183) >> uint(2)));
                float _1187 = as_type<float>(_37[int(_1185)]);
                int _1189 = _1151 + 20;
                uint _1191 = uint(int(uint(_1189) >> uint(2)));
                float _1193 = as_type<float>(_37[int(_1191)]);
                int _1195 = _1151 + 24;
                uint _1197 = uint(int(uint(_1195) >> uint(2)));
                float _1199 = as_type<float>(_37[int(_1197)]);
                int _1201 = _1151 + 28;
                uint _1203 = uint(int(uint(_1201) >> uint(2)));
                float _1205 = as_type<float>(_37[int(_1203)]);
                bool _1207 = uint(_1181) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1209 = _1151 + 32;
                uint _1211 = uint(int(uint(_1209) >> uint(2)));
                float _1213 = as_type<float>(_37[int(_1211)]);
                int _1215 = _1151 + 36;
                uint _1217 = uint(int(uint(_1215) >> uint(2)));
                float _1219 = as_type<float>(_37[int(_1217)]);
                int _1221 = _1151 + 40;
                uint _1223 = uint(int(uint(_1221) >> uint(2)));
                float _1225 = as_type<float>(_37[int(_1223)]);
                int _1227 = _1151 + 44;
                uint _1229 = uint(int(uint(_1227) >> uint(2)));
                float _1231 = as_type<float>(_37[int(_1229)]);
                float _1233 = _1167 * as_type<float>(_999);
                float _1235 = _1013 * _1167;
                float _1237 = _1019 * _1167;
                float _1239 = _1027 * _1167;
                float _1241 = fma(_1161, as_type<float>(_997), _1233);
                float _1243 = fma(_1011, _1161, _1235);
                float _1245 = fma(_1017, _1161, _1237);
                float _1247 = fma(_1025, _1161, _1239);
                float _1249 = fma(_1173, as_type<float>(_1001), _1241);
                _1251 = fma(_1015, _1173, _1243);
                float _1253 = _1013 * _1193;
                _1255 = fma(_1029, _1173, _1247);
                float _1257 = _1193 * as_type<float>(_999);
                _1259 = _1179 + _1249;
                float _1261 = _1019 * _1193;
                _1263 = fma(_1021, _1173, _1245);
                float _1265 = fma(_1187, as_type<float>(_997), _1257);
                float _1267 = fma(_1011, _1187, _1253);
                float _1269 = fma(_1017, _1187, _1261);
                float _1271 = _1027 * _1193;
                float _1273 = fma(_1199, as_type<float>(_1001), _1265);
                float _1275 = _1219 * as_type<float>(_999);
                _1277 = fma(_1015, _1199, _1267);
                _1279 = fma(_1021, _1199, _1269);
                float _1281 = _1013 * _1219;
                float _1283 = _1019 * _1219;
                float _1285 = _1027 * _1219;
                float _1287 = fma(_1213, as_type<float>(_997), _1275);
                float _1289 = fma(_1025, _1187, _1271);
                _1291 = _1205 + _1273;
                float _1293 = fma(_1011, _1213, _1281);
                float _1295 = fma(_1017, _1213, _1283);
                float _1297 = fma(_1025, _1213, _1285);
                float _1299 = fma(_1225, as_type<float>(_1001), _1287);
                _1301 = fma(_1029, _1199, _1289);
                _1303 = fma(_1015, _1225, _1293);
                _1305 = fma(_1021, _1225, _1295);
                _1307 = fma(_1029, _1225, _1297);
                _1309 = _1231 + _1299;
                uint _1311 = uint(int(uint(_1023) >> uint(2)));
                _37[int(_1311)] = as_type<uint>(_1251);
                int _1313 = _1023 + 4;
                uint _1315 = uint(int(uint(_1313) >> uint(2)));
                _37[int(_1315)] = as_type<uint>(_1263);
                int _1317 = _1023 + 8;
                uint _1319 = uint(int(uint(_1317) >> uint(2)));
                _37[int(_1319)] = as_type<uint>(_1255);
                int _1321 = _1023 + 12;
                uint _1323 = uint(int(uint(_1321) >> uint(2)));
                _37[int(_1323)] = as_type<uint>(_1259);
                int _1325 = _1023 + 16;
                uint _1327 = uint(int(uint(_1325) >> uint(2)));
                _37[int(_1327)] = as_type<uint>(_1277);
                int _1329 = _1023 + 20;
                uint _1331 = uint(int(uint(_1329) >> uint(2)));
                _37[int(_1331)] = as_type<uint>(_1279);
                int _1333 = _1023 + 24;
                uint _1335 = uint(int(uint(_1333) >> uint(2)));
                _37[int(_1335)] = as_type<uint>(_1301);
                int _1337 = _1023 + 28;
                uint _1339 = uint(int(uint(_1337) >> uint(2)));
                _37[int(_1339)] = as_type<uint>(_1291);
                int _1341 = _1023 + 32;
                uint _1343 = uint(int(uint(_1341) >> uint(2)));
                _37[int(_1343)] = as_type<uint>(_1303);
                int _1345 = _1023 + 36;
                uint _1347 = uint(int(uint(_1345) >> uint(2)));
                _37[int(_1347)] = as_type<uint>(_1305);
                int _1349 = _1023 + 40;
                uint _1351 = uint(int(uint(_1349) >> uint(2)));
                _37[int(_1351)] = as_type<uint>(_1307);
                int _1353 = _1023 + 44;
                uint _1355 = uint(int(uint(_1353) >> uint(2)));
                _37[int(_1355)] = as_type<uint>(_1309);
                _1155 = !_1207;
                _1153 = _1181;
            } while (_1155);
            _1095 = _1305;
            _1107 = _1263;
            _1123 = _1279;
            _1137 = _1303;
            _1103 = _1251;
            _1119 = _1277;
            _1127 = _1301;
            _1097 = _1307;
            _1111 = _1255;
            _1131 = _1291;
            _1115 = _1259;
            _1099 = _1309;
            _1357 = true;
        }
        else
        {
            _1095 = 0.0;
            _1107 = 0.0;
            _1123 = 0.0;
            _1137 = 0.0;
            _1103 = 0.0;
            _1119 = 0.0;
            _1127 = 0.0;
            _1097 = 0.0;
            _1111 = 0.0;
            _1131 = 0.0;
            _1115 = 0.0;
            _1099 = 0.0;
        }
    }
    _1357 = false;
    float _1359 = _1095;
    float _1361 = _1107;
    float _1363 = _1123;
    float _1365 = _1137;
    float _1367 = _1103;
    float _1369 = _1119;
    float _1371 = _1127;
    float _1373 = _1097;
    float _1375 = _1111;
    float _1377 = _1131;
    float _1379 = _1115;
    float _1381 = _1099;
    int _1383 = _1047 + 80;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.cp_c6)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.cp_c6)._m0[int(_1395)][_1397];
    int _1401 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1403 = _1401 + _68;
    int _1405 = _1047 + 64;
    uint _1407 = uint(int(uint(_1405) >> uint(2)));
    uint _1409 = uint(int(uint(int(_1407)) >> uint(2)));
    int _1411 = int(_1407) & 3;
    float _1413 = (*spvDescriptorSet0.cp_c6)._m0[int(_1409)][_1411];
    int _1415 = int(_1407) + 1;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    int _1419 = _1415 & 3;
    float _1421 = (*spvDescriptorSet0.cp_c6)._m0[int(_1417)][_1419];
    int _1423 = _1403 * 48;
    int _1425 = _1047 + 88;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    uint _1429 = uint(int(uint(int(_1427)) >> uint(2)));
    int _1431 = int(_1427) & 3;
    float _1433 = (*spvDescriptorSet0.cp_c6)._m0[int(_1429)][_1431];
    int _1435 = int(_1427) + 1;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    int _1439 = _1435 & 3;
    float _1441 = (*spvDescriptorSet0.cp_c6)._m0[int(_1437)][_1439];
    int _1443 = _1047 + 72;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    uint _1447 = uint(int(uint(int(_1445)) >> uint(2)));
    int _1449 = int(_1445) & 3;
    float _1451 = (*spvDescriptorSet0.cp_c6)._m0[int(_1447)][_1449];
    int _1453 = int(_1445) + 1;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    int _1457 = _1453 & 3;
    float _1459 = (*spvDescriptorSet0.cp_c6)._m0[int(_1455)][_1457];
    int _1461 = _1047 + 96;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.cp_c6)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.cp_c6)._m0[int(_1473)][_1475];
    int _1479 = _1047 + 104;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    uint _1483 = uint(int(uint(int(_1481)) >> uint(2)));
    int _1485 = int(_1481) & 3;
    float _1487 = (*spvDescriptorSet0.cp_c6)._m0[int(_1483)][_1485];
    int _1489 = int(_1481) + 1;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    int _1493 = _1489 & 3;
    float _1495 = (*spvDescriptorSet0.cp_c6)._m0[int(_1491)][_1493];
    float _1497 = _1359 * _1391;
    int _1499 = _1047 + 16;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.cp_c6)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.cp_c6)._m0[int(_1511)][_1513];
    float _1517 = _1361 * _1391;
    float _1519 = _1363 * _1391;
    float _1521 = _1363 * _1399;
    float _1523 = fma(_1365, _1413, _1497);
    float _1525 = _1359 * _1399;
    int _1527 = _1047 + 32;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    uint _1531 = uint(int(uint(int(_1529)) >> uint(2)));
    int _1533 = int(_1529) & 3;
    float _1535 = (*spvDescriptorSet0.cp_c6)._m0[int(_1531)][_1533];
    int _1537 = int(_1529) + 1;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    int _1541 = _1537 & 3;
    float _1543 = (*spvDescriptorSet0.cp_c6)._m0[int(_1539)][_1541];
    float _1545 = fma(_1367, _1413, _1517);
    float _1547 = fma(_1369, _1413, _1519);
    float _1549 = fma(_1369, _1421, _1521);
    float _1551 = _1361 * _1399;
    float _1553 = fma(_1365, _1421, _1525);
    float _1555 = _1361 * _1433;
    float _1557 = _1363 * _1433;
    int _1559 = _1047 + 48;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    uint _1563 = uint(int(uint(int(_1561)) >> uint(2)));
    int _1565 = int(_1561) & 3;
    float _1567 = (*spvDescriptorSet0.cp_c6)._m0[int(_1563)][_1565];
    int _1569 = int(_1561) + 1;
    uint _1571 = uint(int(uint(_1569) >> uint(2)));
    int _1573 = _1569 & 3;
    float _1575 = (*spvDescriptorSet0.cp_c6)._m0[int(_1571)][_1573];
    float _1577 = _1361 * _1441;
    float _1579 = _1363 * _1441;
    float _1581 = _1359 * _1433;
    float _1583 = _1359 * _1441;
    float _1585 = fma(_1367, _1421, _1551);
    float _1587 = fma(_1369, _1451, _1557);
    float _1589 = fma(_1369, _1459, _1579);
    int _1591 = _1047 + 24;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.cp_c6)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.cp_c6)._m0[int(_1603)][_1605];
    float _1609 = fma(_1367, _1451, _1555);
    float _1611 = fma(_1367, _1459, _1577);
    float _1613 = fma(_1365, _1451, _1581);
    float _1615 = fma(_1365, _1459, _1583);
    float _1617 = fma(_1371, _1469, _1547);
    float _1619 = fma(_1371, _1477, _1549);
    int _1621 = _1047 + 40;
    uint _1623 = uint(int(uint(_1621) >> uint(2)));
    uint _1625 = uint(int(uint(int(_1623)) >> uint(2)));
    int _1627 = int(_1623) & 3;
    float _1629 = (*spvDescriptorSet0.cp_c6)._m0[int(_1625)][_1627];
    int _1631 = int(_1623) + 1;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    int _1635 = _1631 & 3;
    float _1637 = (*spvDescriptorSet0.cp_c6)._m0[int(_1633)][_1635];
    float _1639 = fma(_1373, _1469, _1523);
    float _1641 = fma(_1375, _1469, _1545);
    float _1643 = fma(_1375, _1477, _1585);
    float _1645 = fma(_1373, _1477, _1553);
    float _1647 = fma(_1371, _1487, _1587);
    float _1649 = fma(_1371, _1495, _1589);
    int _1651 = _1047 + 56;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    uint _1655 = uint(int(uint(int(_1653)) >> uint(2)));
    int _1657 = int(_1653) & 3;
    float _1659 = (*spvDescriptorSet0.cp_c6)._m0[int(_1655)][_1657];
    int _1661 = int(_1653) + 1;
    uint _1663 = uint(int(uint(_1661) >> uint(2)));
    int _1665 = _1661 & 3;
    float _1667 = (*spvDescriptorSet0.cp_c6)._m0[int(_1663)][_1665];
    float _1669 = fma(_1375, _1487, _1609);
    float _1671 = fma(_1375, _1495, _1611);
    float _1673 = _1649 + _1377;
    float _1675 = fma(_1373, _1495, _1615);
    float _1677 = fma(_1373, _1487, _1613);
    float _1679 = _1671 + _1379;
    float _1681 = _1673 * _1515;
    float _1683 = _1675 + _1381;
    float _1685 = _1617 * _1515;
    float _1687 = _1619 * _1515;
    float _1689 = fma(_1679, _1507, _1681);
    float _1691 = _1647 * _1515;
    float _1693 = fma(_1641, _1507, _1685);
    float _1695 = fma(_1643, _1507, _1687);
    float _1697 = _1617 * _1543;
    float _1699 = _1673 * _1543;
    float _1701 = _1619 * _1543;
    float _1703 = _1647 * _1543;
    float _1705 = fma(_1641, _1535, _1697);
    float _1707 = fma(_1679, _1535, _1699);
    float _1709 = fma(_1669, _1507, _1691);
    float _1711 = fma(_1669, _1535, _1703);
    float _1713 = _1617 * _1575;
    float _1715 = _1673 * _1575;
    float _1717 = _1619 * _1575;
    float _1719 = _1647 * _1575;
    float _1721 = fma(_1641, _1567, _1713);
    float _1723 = fma(_1679, _1567, _1715);
    float _1725 = fma(_1643, _1567, _1717);
    float _1727 = fma(_1669, _1567, _1719);
    float _1729 = fma(_1683, _1599, _1689);
    float _1731 = fma(_1643, _1535, _1701);
    float _1733 = fma(_1645, _1599, _1695);
    float _1735 = fma(_1639, _1599, _1693);
    float _1737 = _1729 + _1607;
    float _1739 = fma(_1677, _1599, _1709);
    float _1741 = fma(_1683, _1629, _1707);
    float _1743 = fma(_1639, _1629, _1705);
    float _1745 = fma(_1677, _1629, _1711);
    float _1747 = fma(_1645, _1629, _1731);
    float _1749 = _1741 + _1637;
    float _1751 = fma(_1683, _1659, _1723);
    float _1753 = fma(_1639, _1659, _1721);
    float _1755 = fma(_1645, _1659, _1725);
    float _1757 = fma(_1677, _1659, _1727);
    int _1759 = _1423 + 16;
    float _1761 = _1751 + _1667;
    int _1763 = _1423 + 32;
    int _1765 = _1423 + 48;
    uint _1767 = uint(int(uint(_1759) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1767)] = as_type<uint>(_1735);
    int _1769 = _1759 + 4;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1771)] = as_type<uint>(_1733);
    int _1773 = _1759 + 8;
    uint _1775 = uint(int(uint(_1773) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1775)] = as_type<uint>(_1739);
    int _1777 = _1759 + 12;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1779)] = as_type<uint>(_1737);
    uint _1781 = uint(int(uint(_1763) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1781)] = as_type<uint>(_1743);
    int _1783 = _1763 + 4;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1785)] = as_type<uint>(_1747);
    int _1787 = _1763 + 8;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1789)] = as_type<uint>(_1745);
    int _1791 = _1763 + 12;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1793)] = as_type<uint>(_1749);
    uint _1795 = uint(int(uint(_1765) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1795)] = as_type<uint>(_1753);
    int _1797 = _1765 + 4;
    uint _1799 = uint(int(uint(_1797) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1799)] = as_type<uint>(_1755);
    int _1801 = _1765 + 8;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1803)] = as_type<uint>(_1757);
    int _1805 = _1765 + 12;
    uint _1807 = uint(int(uint(_1805) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1807)] = as_type<uint>(_1761);
}

