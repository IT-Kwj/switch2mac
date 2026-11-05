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
    texture2d_array<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _60(thread const int& _4989, thread const int& _4990, constant _10& support_buffer)
{
    int _4993 = 1 + _4990;
    float _4995 = support_buffer._m5[_4993].x;
    bool _4997 = _4995 == 1.0;
    if (_4997)
    {
        return _4989;
    }
    float _4999 = float(_4989);
    float _5001 = _4999 * _4995;
    int _5003 = int(_5001);
    return _5003;
}

static inline __attribute__((always_inline))
void _58(thread const int& _4677, thread const int& _4678, thread const int& _4679, thread const int& _4680, thread int& _4681, thread int& _4682, thread int& _4683, thread int& _4684, thread int& _4685, thread int& _4686)
{
    float _4689 = as_type<float>(_4678) + 0.0;
    bool _4691 = _4689 != 0.0;
    bool _4693 = isnan(_4689);
    bool _4695 = _4691 || _4693;
    bool _4697 = isnan(0.0);
    bool _4699 = _4695 || _4697;
    int _4701 = as_type<int>(_4689);
    int _4703 = _4678;
    int _4705 = _4679;
    int _4707 = _4699 ? (-1) : 0;
    if (!_4699)
    {
        float _4709 = as_type<float>(_4678) * 1.0;
        _4701 = as_type<int>(_4709);
    }
    int _4711 = _4701;
    bool _4713 = !_4699;
    int _4715 = _4711;
    if (!_4713)
    {
        float _4717 = as_type<float>(_4678) + 0.0;
        bool _4719 = _4717 >= 0.0;
        bool _4721 = isnan(_4717);
        bool _4723 = _4719 || _4721;
        bool _4725 = isnan(0.0);
        bool _4727 = _4723 || _4725;
        int _4729 = as_type<int>(_4717);
        _4707 = _4727 ? (-1) : 0;
        if (!_4727)
        {
            _4729 = 2147483647;
        }
        int _4731 = _4729;
        bool _4733 = !_4727;
        _4715 = _4731;
        if (!_4733)
        {
            float _4735 = as_type<float>(_4678) + 0.0;
            bool _4737 = _4735 > as_type<float>(0x7f800000u /* inf */);
            bool _4739 = isnan(_4735);
            bool _4741 = _4737 || _4739;
            bool _4743 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4745 = _4741 || _4743;
            int _4747 = as_type<int>(_4735);
            _4707 = _4745 ? (-1) : 0;
            if (_4745)
            {
                float _4749 = as_type<float>(_4678) + 1.0;
                _4747 = as_type<int>(_4749);
            }
            int _4751 = _4747;
            _4715 = _4751;
            if (!_4745)
            {
                float _4753 = 0.0 + as_type<float>(_4678);
                bool _4755 = _4753 != as_type<float>(0x7f800000u /* inf */);
                bool _4757 = isnan(_4753);
                bool _4759 = _4755 || _4757;
                bool _4761 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4763 = _4759 || _4761;
                int _4765 = as_type<int>(_4753);
                _4707 = _4763 ? (-1) : 0;
                if (!_4763)
                {
                    _4765 = _4678;
                }
                int _4767 = _4765;
                bool _4769 = !_4763;
                _4715 = _4767;
                if (!_4769)
                {
                    float _4771 = as_type<float>(_4678) * 18446744073709551616.0;
                    float _4773 = rsqrt(_4771);
                    float _4775 = _4771 * _4773;
                    float _4777 = _4773 * 0.5;
                    float _4779 = -_4775;
                    float _4781 = 0.0 + _4779;
                    float _4783 = fma(_4777, _4781, 0.5);
                    float _4785 = fma(_4775, _4783, _4775);
                    float _4787 = -_4785;
                    float _4789 = 0.0 + _4787;
                    float _4791 = fma(_4785, _4789, _4771);
                    float _4793 = fma(_4777, _4791, _4785);
                    float _4795 = _4793 * 2.3283064365386962890625e-10;
                    _4715 = as_type<int>(_4795);
                    _4703 = as_type<int>(_4781);
                    _4705 = as_type<int>(_4785);
                }
            }
        }
    }
    int _4797 = _4715;
    int _4799 = _4703;
    int _4801 = _4705;
    int _4803 = _4707;
    _4681 = _4797;
    _4682 = _4680;
    _4683 = 0;
    _4684 = _4799;
    _4685 = _4801;
    _4686 = _4803;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1375 = false;
    bool _909 = false;
    bool _597 = false;
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
    float _177 = 0.0;
    float _179 = 0.0;
    if (_127)
    {
        int _181 = _70;
        int _183 = 0;
        int _185 = _60(_181, _183, (*spvDescriptorSet0.support_buffer));
        int _187 = _149;
        int _189 = 0;
        int _191 = _60(_187, _189, (*spvDescriptorSet0.support_buffer));
        int3 _2072 = int3(_185, _191, as_type<int>(_153));
        float3 _195 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2072.xy), uint(_2072.z), 0).xyz;
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
    float _213 = _113;
    if (_131)
    {
        int _215 = _70;
        int _217 = 1;
        int _219 = _60(_215, _217, (*spvDescriptorSet0.support_buffer));
        int _221 = _167;
        int _223 = 1;
        int _225 = _60(_221, _223, (*spvDescriptorSet0.support_buffer));
        int3 _2101 = int3(_219, _225, 0);
        float3 _227 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2101.xy), uint(_2101.z), 0).xyz;
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
        int _251 = _60(_247, _249, (*spvDescriptorSet0.support_buffer));
        int _253 = _167;
        int _255 = 1;
        int _257 = _60(_253, _255, (*spvDescriptorSet0.support_buffer));
        int3 _2132 = int3(_251, _257, as_type<int>(_171));
        float3 _259 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2132.xy), uint(_2132.z), 0).xyz;
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
        int _283 = _60(_279, _281, (*spvDescriptorSet0.support_buffer));
        int _285 = _167;
        int _287 = 1;
        int _289 = _60(_285, _287, (*spvDescriptorSet0.support_buffer));
        int3 _2161 = int3(_283, _289, as_type<int>(_173));
        float3 _291 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2161.xy), uint(_2161.z), 0).xyz;
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
    float _315 = _309;
    float _317 = _311;
    if (!_131)
    {
        _313 = 0.0;
    }
    float _319 = _313;
    float _321 = 0.0;
    float _323 = 0.0;
    float _325 = _319;
    if (!_131)
    {
        _321 = 0.0;
        _323 = 0.0;
    }
    float _327 = _321;
    float _329 = _323;
    float _331 = 0.0;
    float _333 = _327;
    float _335 = _329;
    if (!_131)
    {
        _331 = 0.0;
    }
    float _337 = _331;
    float _339 = _337;
    if (!_131)
    {
        _157 = 0.0;
        _137 = 0.0;
    }
    float _341 = _157;
    float _343 = _137;
    float _345 = 0.0;
    float _347 = _341;
    float _349 = _343;
    if (!_131)
    {
        _345 = 0.0;
    }
    float _351 = _345;
    bool _353 = !_131;
    float _355 = _351;
    if (!_353)
    {
        _347 = _303;
        _349 = _301;
        _355 = _299;
        _315 = _235;
        _317 = _237;
        _325 = _239;
        _339 = _267;
        _333 = _269;
        _335 = _271;
    }
    float _357 = _347;
    float _359 = _349;
    float _361 = _355;
    float _363 = _315;
    float _365 = _317;
    float _367 = _325;
    float _369 = _339;
    float _371 = _333;
    float _373 = _335;
    bool _375 = !_127;
    float _377 = _363;
    float _379 = _365;
    float _381 = _367;
    int _383 = as_type<int>(_369);
    float _385 = _373;
    float _387 = _371;
    float _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    float _891;
    float _893;
    float _895;
    int _897;
    int _899;
    float _901;
    float _903;
    float _905;
    float _907;
    if (!_375)
    {
        float _389 = _357 * 0.5;
        float _391 = _359 * 0.5;
        float _393 = _207 * 0.5;
        float _395 = _205 * 0.5;
        float _397 = _389 * 0.15915493667125701904296875;
        float _399 = _391 * 0.15915493667125701904296875;
        float _401 = _361 * 0.5;
        float _403 = _393 * 0.15915493667125701904296875;
        float _405 = _395 * 0.15915493667125701904296875;
        float _407 = _203 * 0.5;
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
            int _579 = 1824;
            int _581;
            int _583;
            int _585;
            int _587;
            int _589;
            int _591;
            _58(_573, _575, _577, _579, _581, _583, _585, _587, _589, _591);
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
        int _625 = _103 + 8;
        uint _627 = uint(int(uint(_625) >> uint(2)));
        uint _629 = uint(int(uint(int(_627)) >> uint(2)));
        int _631 = int(_627) & 3;
        float _633 = (*spvDescriptorSet0.cp_c5)._m0[int(_629)][_631];
        int _635 = _70;
        int _637 = 0;
        int _639 = _60(_635, _637, (*spvDescriptorSet0.support_buffer));
        int _641 = as_type<int>(_633);
        int _643 = 0;
        int _645 = _60(_641, _643, (*spvDescriptorSet0.support_buffer));
        int3 _2574 = int3(_639, _645, 0);
        float3 _647 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2574.xy), uint(_2574.z), 0).xyz;
        float _649 = _647.x;
        float _651 = _647.y;
        float _653 = _647.z;
        int _655 = _70;
        int _657 = 0;
        int _659 = _60(_655, _657, (*spvDescriptorSet0.support_buffer));
        int _661 = as_type<int>(_633);
        int _663 = 0;
        int _665 = _60(_661, _663, (*spvDescriptorSet0.support_buffer));
        int3 _2592 = int3(_659, _665, 2);
        float3 _667 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2592.xy), uint(_2592.z), 0).xyz;
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
            int _709 = _103 + 28;
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
            int _737 = _103 + 28;
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
        float _783 = _653 * _773;
        float _785 = _669 * _773;
        float _787 = _519 * _781;
        float _789 = _507 * _781;
        int _791 = _103 + 20;
        uint _793 = uint(int(uint(_791) >> uint(2)));
        uint _795 = uint(int(uint(int(_793)) >> uint(2)));
        int _797 = int(_793) & 3;
        float _799 = (*spvDescriptorSet0.cp_c5)._m0[int(_795)][_797];
        float _801 = _501 * _781;
        float _803 = _515 * _781;
        float _805 = fma(_489, _775, _787);
        float _807 = fma(_493, _775, _789);
        float _809 = fma(_485, _775, _801);
        float _811 = fma(_497, _775, _803);
        float _813 = _805 * 2.0;
        float _815 = _807 * _807;
        float _817 = _809 * _809;
        float _819 = _807 * 2.0;
        float _821 = _811 * _813;
        float _823 = _809 * _813;
        float _825 = _807 * _813;
        float _827 = fma(_815, -2.0, 1.0);
        float _829 = fma(_817, -2.0, 1.0);
        float _831 = -_821;
        float _833 = fma(_809, _819, _831);
        float _835 = fma(_809, _819, _821);
        float _837 = fma(_811, _819, _823);
        float _839 = -_823;
        float _841 = fma(_811, _819, _839);
        float _843 = _649 * _773;
        float _845 = _651 * _773;
        float _847 = _809 * 2.0;
        float _849 = _811 * _811;
        float _851 = fma(_363, _799, _843);
        float _853 = fma(_365, _799, _845);
        float _855 = _671 * _773;
        float _857 = _673 * _773;
        float _859 = -_825;
        float _861 = fma(_811, _847, _859);
        float _863 = fma(_849, -2.0, _829);
        float _865 = fma(_811, _847, _825);
        float _867 = fma(_849, -2.0, _827);
        float _869 = fma(_817, -2.0, _827);
        float _871 = fma(_367, _799, _783);
        float _873 = fma(_369, _799, _785);
        float _875 = fma(_371, _799, _855);
        float _877 = fma(_373, _799, _857);
        _377 = _851;
        _879 = _835;
        _881 = _841;
        _379 = _853;
        _883 = _867;
        _885 = _863;
        _887 = _833;
        _889 = _865;
        _381 = _871;
        _891 = _837;
        _893 = _861;
        _895 = _869;
        _383 = as_type<int>(_873);
        _897 = as_type<int>(_875);
        _899 = as_type<int>(_877);
        _901 = _855;
        _903 = _857;
        _905 = _825;
        _907 = _829;
        _909 = true;
    }
    else
    {
        float _911 = _361 * 0.15915493667125701904296875;
        float _913 = _357 * 0.15915493667125701904296875;
        float _915 = _359 * 0.15915493667125701904296875;
        float _917 = _911 * 6.283185482025146484375;
        float _919 = sin(_917);
        float _921 = _911 * 6.283185482025146484375;
        float _923 = cos(_921);
        float _925 = _913 * 6.283185482025146484375;
        float _927 = sin(_925);
        float _929 = _913 * 6.283185482025146484375;
        float _931 = cos(_929);
        float _933 = _915 * 6.283185482025146484375;
        float _935 = sin(_933);
        float _937 = _927 * _923;
        float _939 = _919 * _927;
        float _941 = _915 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _923 * _931;
        float _947 = _919 * _935;
        float _949 = -_937;
        float _951 = fma(_931, _947, _949);
        float _953 = _923 * _943;
        float _955 = _943 * _931;
        float _957 = _927 * _943;
        float _959 = _919 * _943;
        float _961 = _919 * _931;
        float _963 = fma(_927, _947, _945);
        float _965 = fma(_935, _945, _939);
        float _967 = -_961;
        float _969 = fma(_935, _937, _967);
        float _971 = -_935;
        float _973 = _971 + (-0.0);
        _879 = _957;
        _881 = _973;
        _883 = _963;
        _885 = _955;
        _887 = _951;
        _889 = _959;
        _891 = _965;
        _893 = _969;
        _895 = _953;
        _897 = as_type<int>(_371);
        _899 = as_type<int>(_373);
        _901 = _947;
        _903 = _961;
        _905 = _937;
        _907 = _931;
    }
    _909 = false;
    float _975 = _377;
    float _977 = _879;
    float _979 = _881;
    float _981 = _379;
    float _983 = _883;
    float _985 = _885;
    float _987 = _887;
    float _989 = _889;
    float _991 = _381;
    float _993 = _891;
    float _995 = _893;
    float _997 = _895;
    int _999 = _383;
    int _1001 = _897;
    int _1003 = _899;
    float _1005 = _901;
    float _1007 = _903;
    float _1009 = _905;
    float _1011 = _907;
    float _1013 = _975 * _977;
    float _1015 = _975 * _979;
    float _1017 = _981 * _983;
    float _1019 = _975 * _985;
    float _1021 = _981 * _987;
    float _1023 = _981 * _989;
    int _1025 = _70 * 48;
    float _1027 = _991 * _993;
    float _1029 = _991 * _995;
    float _1031 = _991 * _997;
    bool _1033 = _70 != 0;
    uint _1035 = uint(int(uint(_1025) >> uint(2)));
    _39[int(_1035)] = as_type<uint>(_1019);
    int _1037 = _1025 + 4;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    _39[int(_1039)] = as_type<uint>(_1021);
    int _1041 = _1025 + 8;
    uint _1043 = uint(int(uint(_1041) >> uint(2)));
    _39[int(_1043)] = as_type<uint>(_1027);
    int _1045 = _1025 + 12;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    _39[int(_1047)] = uint(_999);
    int _1049 = _70 * 112;
    int _1051 = _1025 + 16;
    int _1053 = _1025 + 16;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    _39[int(_1055)] = as_type<uint>(_1013);
    int _1057 = _1025 + 20;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    _39[int(_1059)] = as_type<uint>(_1017);
    int _1061 = _1025 + 24;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    _39[int(_1063)] = as_type<uint>(_1029);
    int _1065 = _1025 + 28;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    _39[int(_1067)] = uint(_1001);
    int _1069 = _1025 + 32;
    int _1071 = _1025 + 32;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    _39[int(_1073)] = as_type<uint>(_1015);
    int _1075 = _1025 + 36;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    _39[int(_1077)] = as_type<uint>(_1023);
    int _1079 = _1025 + 40;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    _39[int(_1081)] = as_type<uint>(_1031);
    int _1083 = _1025 + 44;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    _39[int(_1085)] = uint(_1003);
    float _1087 = _1005;
    float _1089 = _1007;
    float _1091 = _1009;
    float _1093 = _1011;
    float _1095 = _975;
    float _1097 = _981;
    float _1099 = _995;
    float _1101 = _993;
    float _1103 = _987;
    float _1105 = _991;
    if (!_1033)
    {
        _1087 = _1019;
    }
    float _1107 = _1087;
    float _1109 = _1107;
    if (!_1033)
    {
        _1089 = _1021;
    }
    float _1111 = _1089;
    float _1113 = _1111;
    if (!_1033)
    {
        _1091 = _1027;
    }
    float _1115 = _1091;
    float _1117 = _1115;
    if (!_1033)
    {
        _1093 = as_type<float>(_999);
    }
    float _1119 = _1093;
    float _1121 = _1119;
    if (!_1033)
    {
        _1095 = _1013;
    }
    float _1123 = _1095;
    float _1125 = _1123;
    if (!_1033)
    {
        _1097 = _1017;
    }
    float _1127 = _1097;
    float _1129 = _1127;
    if (!_1033)
    {
        _385 = _1029;
    }
    float _1131 = _385;
    float _1133 = _1131;
    if (!_1033)
    {
        _387 = as_type<float>(_1001);
    }
    float _1135 = _387;
    float _1137 = _1135;
    if (!_1033)
    {
        _1099 = _1015;
    }
    float _1139 = _1099;
    float _1141 = _1139;
    if (!_1033)
    {
        _1101 = _1023;
    }
    float _1143 = _1101;
    float _1145 = _1143;
    if (!_1033)
    {
        _1103 = _1031;
    }
    float _1147 = _1103;
    float _1149 = _1147;
    if (!_1033)
    {
        _1105 = as_type<float>(_1003);
    }
    float _1151 = _1105;
    bool _1153 = !_1033;
    float _1155 = _1151;
    if (!_1153)
    {
        bool _1157 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1159 = !_1157;
        if (!_1159)
        {
            uint _1161 = uint(int(uint(_1049) >> uint(2)));
            uint _1163 = uint(int(uint(int(_1161)) >> uint(2)));
            int _1165 = int(_1161) & 3;
            float _1167 = (*spvDescriptorSet0.cp_c6)._m0[int(_1163)][_1165];
            int _1169 = as_type<int>(_1167) * 48;
            int _1171 = 0;
            bool _1173;
            float _1271;
            float _1273;
            float _1281;
            float _1291;
            float _1293;
            float _1305;
            float _1317;
            float _1319;
            float _1321;
            float _1323;
            float _1325;
            float _1327;
            do
            {
                int _1175 = _1171;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1177 = uint(int(uint(_1169) >> uint(2)));
                float _1179 = as_type<float>(_39[int(_1177)]);
                int _1181 = _1169 + 4;
                uint _1183 = uint(int(uint(_1181) >> uint(2)));
                float _1185 = as_type<float>(_39[int(_1183)]);
                int _1187 = _1169 + 8;
                uint _1189 = uint(int(uint(_1187) >> uint(2)));
                float _1191 = as_type<float>(_39[int(_1189)]);
                int _1193 = _1169 + 12;
                uint _1195 = uint(int(uint(_1193) >> uint(2)));
                float _1197 = as_type<float>(_39[int(_1195)]);
                int _1199 = _1175 + 1;
                int _1201 = _1169 + 16;
                uint _1203 = uint(int(uint(_1201) >> uint(2)));
                float _1205 = as_type<float>(_39[int(_1203)]);
                int _1207 = _1169 + 20;
                uint _1209 = uint(int(uint(_1207) >> uint(2)));
                float _1211 = as_type<float>(_39[int(_1209)]);
                int _1213 = _1169 + 24;
                uint _1215 = uint(int(uint(_1213) >> uint(2)));
                float _1217 = as_type<float>(_39[int(_1215)]);
                int _1219 = _1169 + 28;
                uint _1221 = uint(int(uint(_1219) >> uint(2)));
                float _1223 = as_type<float>(_39[int(_1221)]);
                bool _1225 = uint(_1199) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1227 = _1169 + 32;
                uint _1229 = uint(int(uint(_1227) >> uint(2)));
                float _1231 = as_type<float>(_39[int(_1229)]);
                int _1233 = _1169 + 36;
                uint _1235 = uint(int(uint(_1233) >> uint(2)));
                float _1237 = as_type<float>(_39[int(_1235)]);
                int _1239 = _1169 + 40;
                uint _1241 = uint(int(uint(_1239) >> uint(2)));
                float _1243 = as_type<float>(_39[int(_1241)]);
                int _1245 = _1169 + 44;
                uint _1247 = uint(int(uint(_1245) >> uint(2)));
                float _1249 = as_type<float>(_39[int(_1247)]);
                float _1251 = _1185 * as_type<float>(_1001);
                float _1253 = _1013 * _1185;
                float _1255 = _1017 * _1185;
                float _1257 = _1029 * _1185;
                float _1259 = fma(_1179, as_type<float>(_999), _1251);
                float _1261 = fma(_1019, _1179, _1253);
                float _1263 = fma(_1021, _1179, _1255);
                float _1265 = fma(_1027, _1179, _1257);
                float _1267 = fma(_1191, as_type<float>(_1003), _1259);
                float _1269 = _1211 * as_type<float>(_1001);
                _1271 = fma(_1015, _1191, _1261);
                _1273 = fma(_1023, _1191, _1263);
                float _1275 = _1013 * _1211;
                float _1277 = _1017 * _1211;
                float _1279 = fma(_1205, as_type<float>(_999), _1269);
                _1281 = _1197 + _1267;
                float _1283 = fma(_1019, _1205, _1275);
                float _1285 = fma(_1021, _1205, _1277);
                float _1287 = fma(_1217, as_type<float>(_1003), _1279);
                float _1289 = _1237 * as_type<float>(_1001);
                _1291 = fma(_1015, _1217, _1283);
                _1293 = fma(_1023, _1217, _1285);
                float _1295 = _1013 * _1237;
                float _1297 = _1017 * _1237;
                float _1299 = _1029 * _1211;
                float _1301 = _1029 * _1237;
                float _1303 = fma(_1231, as_type<float>(_999), _1289);
                _1305 = _1223 + _1287;
                float _1307 = fma(_1027, _1205, _1299);
                float _1309 = fma(_1019, _1231, _1295);
                float _1311 = fma(_1021, _1231, _1297);
                float _1313 = fma(_1027, _1231, _1301);
                float _1315 = fma(_1243, as_type<float>(_1003), _1303);
                _1317 = fma(_1031, _1191, _1265);
                _1319 = fma(_1031, _1217, _1307);
                _1321 = fma(_1015, _1243, _1309);
                _1323 = fma(_1023, _1243, _1311);
                _1325 = fma(_1031, _1243, _1313);
                _1327 = _1249 + _1315;
                uint _1329 = uint(int(uint(_1025) >> uint(2)));
                _39[int(_1329)] = as_type<uint>(_1271);
                int _1331 = _1025 + 4;
                uint _1333 = uint(int(uint(_1331) >> uint(2)));
                _39[int(_1333)] = as_type<uint>(_1273);
                int _1335 = _1025 + 8;
                uint _1337 = uint(int(uint(_1335) >> uint(2)));
                _39[int(_1337)] = as_type<uint>(_1317);
                int _1339 = _1025 + 12;
                uint _1341 = uint(int(uint(_1339) >> uint(2)));
                _39[int(_1341)] = as_type<uint>(_1281);
                int _1343 = _1025 + 16;
                uint _1345 = uint(int(uint(_1343) >> uint(2)));
                _39[int(_1345)] = as_type<uint>(_1291);
                int _1347 = _1025 + 20;
                uint _1349 = uint(int(uint(_1347) >> uint(2)));
                _39[int(_1349)] = as_type<uint>(_1293);
                int _1351 = _1025 + 24;
                uint _1353 = uint(int(uint(_1351) >> uint(2)));
                _39[int(_1353)] = as_type<uint>(_1319);
                int _1355 = _1025 + 28;
                uint _1357 = uint(int(uint(_1355) >> uint(2)));
                _39[int(_1357)] = as_type<uint>(_1305);
                int _1359 = _1025 + 32;
                uint _1361 = uint(int(uint(_1359) >> uint(2)));
                _39[int(_1361)] = as_type<uint>(_1321);
                int _1363 = _1025 + 36;
                uint _1365 = uint(int(uint(_1363) >> uint(2)));
                _39[int(_1365)] = as_type<uint>(_1323);
                int _1367 = _1025 + 40;
                uint _1369 = uint(int(uint(_1367) >> uint(2)));
                _39[int(_1369)] = as_type<uint>(_1325);
                int _1371 = _1025 + 44;
                uint _1373 = uint(int(uint(_1371) >> uint(2)));
                _39[int(_1373)] = as_type<uint>(_1327);
                _1173 = !_1225;
                _1171 = _1199;
            } while (_1173);
            _1109 = _1271;
            _1113 = _1273;
            _1117 = _1317;
            _1121 = _1281;
            _1125 = _1291;
            _1129 = _1293;
            _1133 = _1319;
            _1137 = _1305;
            _1141 = _1321;
            _1145 = _1323;
            _1149 = _1325;
            _1155 = _1327;
            _1375 = true;
        }
        else
        {
            _1109 = 0.0;
            _1113 = 0.0;
            _1117 = 0.0;
            _1121 = 0.0;
            _1125 = 0.0;
            _1129 = 0.0;
            _1133 = 0.0;
            _1137 = 0.0;
            _1141 = 0.0;
            _1145 = 0.0;
            _1149 = 0.0;
            _1155 = 0.0;
        }
    }
    _1375 = false;
    float _1377 = _1109;
    float _1379 = _1113;
    float _1381 = _1117;
    float _1383 = _1121;
    float _1385 = _1125;
    float _1387 = _1129;
    float _1389 = _1133;
    float _1391 = _1137;
    float _1393 = _1141;
    float _1395 = _1145;
    float _1397 = _1149;
    float _1399 = _1155;
    int _1401 = _1049 + 80;
    uint _1403 = uint(int(uint(_1401) >> uint(2)));
    uint _1405 = uint(int(uint(int(_1403)) >> uint(2)));
    int _1407 = int(_1403) & 3;
    float _1409 = (*spvDescriptorSet0.cp_c6)._m0[int(_1405)][_1407];
    int _1411 = int(_1403) + 1;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    int _1415 = _1411 & 3;
    float _1417 = (*spvDescriptorSet0.cp_c6)._m0[int(_1413)][_1415];
    bool _1419 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1421 = _1049 + 64;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
    int _1427 = int(_1423) & 3;
    float _1429 = (*spvDescriptorSet0.cp_c6)._m0[int(_1425)][_1427];
    int _1431 = int(_1423) + 1;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    int _1435 = _1431 & 3;
    float _1437 = (*spvDescriptorSet0.cp_c6)._m0[int(_1433)][_1435];
    int _1439 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1441 = _1439 + _70;
    int _1443 = _1049 + 88;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    uint _1447 = uint(int(uint(int(_1445)) >> uint(2)));
    int _1449 = int(_1445) & 3;
    float _1451 = (*spvDescriptorSet0.cp_c6)._m0[int(_1447)][_1449];
    int _1453 = int(_1445) + 1;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    int _1457 = _1453 & 3;
    float _1459 = (*spvDescriptorSet0.cp_c6)._m0[int(_1455)][_1457];
    int _1461 = _1049 + 72;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.cp_c6)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.cp_c6)._m0[int(_1473)][_1475];
    int _1479 = _1049 + 96;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    uint _1483 = uint(int(uint(int(_1481)) >> uint(2)));
    int _1485 = int(_1481) & 3;
    float _1487 = (*spvDescriptorSet0.cp_c6)._m0[int(_1483)][_1485];
    int _1489 = int(_1481) + 1;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    int _1493 = _1489 & 3;
    float _1495 = (*spvDescriptorSet0.cp_c6)._m0[int(_1491)][_1493];
    int _1497 = _1049 + 104;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.cp_c6)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.cp_c6)._m0[int(_1509)][_1511];
    int _1515 = _1049 + 16;
    uint _1517 = uint(int(uint(_1515) >> uint(2)));
    uint _1519 = uint(int(uint(int(_1517)) >> uint(2)));
    int _1521 = int(_1517) & 3;
    float _1523 = (*spvDescriptorSet0.cp_c6)._m0[int(_1519)][_1521];
    int _1525 = int(_1517) + 1;
    uint _1527 = uint(int(uint(_1525) >> uint(2)));
    int _1529 = _1525 & 3;
    float _1531 = (*spvDescriptorSet0.cp_c6)._m0[int(_1527)][_1529];
    if (!_1419)
    {
        uint _1533 = uint(int(uint(_1025) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1533)] = as_type<uint>(_1377);
        int _1535 = _1025 + 4;
        uint _1537 = uint(int(uint(_1535) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1537)] = as_type<uint>(_1379);
        int _1539 = _1025 + 8;
        uint _1541 = uint(int(uint(_1539) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1541)] = as_type<uint>(_1381);
        int _1543 = _1025 + 12;
        uint _1545 = uint(int(uint(_1543) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1545)] = as_type<uint>(_1383);
        uint _1547 = uint(int(uint(_1051) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1547)] = as_type<uint>(_1385);
        int _1549 = _1051 + 4;
        uint _1551 = uint(int(uint(_1549) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1551)] = as_type<uint>(_1387);
        int _1553 = _1051 + 8;
        uint _1555 = uint(int(uint(_1553) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1555)] = as_type<uint>(_1389);
        int _1557 = _1051 + 12;
        uint _1559 = uint(int(uint(_1557) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1559)] = as_type<uint>(_1391);
        uint _1561 = uint(int(uint(_1069) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1561)] = as_type<uint>(_1393);
        int _1563 = _1069 + 4;
        uint _1565 = uint(int(uint(_1563) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1565)] = as_type<uint>(_1395);
        int _1567 = _1069 + 8;
        uint _1569 = uint(int(uint(_1567) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1569)] = as_type<uint>(_1397);
        int _1571 = _1069 + 12;
        uint _1573 = uint(int(uint(_1571) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1573)] = as_type<uint>(_1399);
    }
    float _1575 = _1387 * _1409;
    float _1577 = _1395 * _1409;
    int _1579 = _1049 + 32;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.cp_c6)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.cp_c6)._m0[int(_1591)][_1593];
    float _1597 = _1379 * _1409;
    float _1599 = fma(_1385, _1429, _1575);
    float _1601 = fma(_1393, _1429, _1577);
    float _1603 = _1379 * _1417;
    float _1605 = _1387 * _1417;
    float _1607 = _1395 * _1417;
    float _1609 = _1379 * _1459;
    int _1611 = _1049 + 48;
    uint _1613 = uint(int(uint(_1611) >> uint(2)));
    uint _1615 = uint(int(uint(int(_1613)) >> uint(2)));
    int _1617 = int(_1613) & 3;
    float _1619 = (*spvDescriptorSet0.cp_c6)._m0[int(_1615)][_1617];
    int _1621 = int(_1613) + 1;
    uint _1623 = uint(int(uint(_1621) >> uint(2)));
    int _1625 = _1621 & 3;
    float _1627 = (*spvDescriptorSet0.cp_c6)._m0[int(_1623)][_1625];
    float _1629 = fma(_1377, _1437, _1603);
    float _1631 = fma(_1385, _1437, _1605);
    float _1633 = fma(_1393, _1437, _1607);
    float _1635 = _1379 * _1451;
    float _1637 = _1387 * _1451;
    float _1639 = _1395 * _1451;
    float _1641 = _1387 * _1459;
    float _1643 = _1395 * _1459;
    float _1645 = fma(_1377, _1469, _1635);
    int _1647 = _1049 + 24;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    uint _1651 = uint(int(uint(int(_1649)) >> uint(2)));
    int _1653 = int(_1649) & 3;
    float _1655 = (*spvDescriptorSet0.cp_c6)._m0[int(_1651)][_1653];
    int _1657 = int(_1649) + 1;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    int _1661 = _1657 & 3;
    float _1663 = (*spvDescriptorSet0.cp_c6)._m0[int(_1659)][_1661];
    float _1665 = fma(_1377, _1477, _1609);
    float _1667 = fma(_1385, _1469, _1637);
    float _1669 = fma(_1385, _1477, _1641);
    float _1671 = fma(_1393, _1469, _1639);
    float _1673 = fma(_1393, _1477, _1643);
    float _1675 = fma(_1381, _1495, _1629);
    float _1677 = fma(_1389, _1487, _1599);
    int _1679 = _1049 + 40;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    uint _1683 = uint(int(uint(int(_1681)) >> uint(2)));
    int _1685 = int(_1681) & 3;
    float _1687 = (*spvDescriptorSet0.cp_c6)._m0[int(_1683)][_1685];
    int _1689 = int(_1681) + 1;
    uint _1691 = uint(int(uint(_1689) >> uint(2)));
    int _1693 = _1689 & 3;
    float _1695 = (*spvDescriptorSet0.cp_c6)._m0[int(_1691)][_1693];
    float _1697 = fma(_1389, _1495, _1631);
    float _1699 = fma(_1389, _1505, _1667);
    float _1701 = fma(_1389, _1513, _1669);
    float _1703 = fma(_1381, _1513, _1665);
    float _1705 = fma(_1397, _1513, _1673);
    float _1707 = fma(_1377, _1429, _1597);
    float _1709 = _1701 + _1391;
    int _1711 = _1049 + 56;
    uint _1713 = uint(int(uint(_1711) >> uint(2)));
    uint _1715 = uint(int(uint(int(_1713)) >> uint(2)));
    int _1717 = int(_1713) & 3;
    float _1719 = (*spvDescriptorSet0.cp_c6)._m0[int(_1715)][_1717];
    int _1721 = int(_1713) + 1;
    uint _1723 = uint(int(uint(_1721) >> uint(2)));
    int _1725 = _1721 & 3;
    float _1727 = (*spvDescriptorSet0.cp_c6)._m0[int(_1723)][_1725];
    float _1729 = _1703 + _1383;
    float _1731 = fma(_1397, _1487, _1601);
    float _1733 = _1709 * _1531;
    float _1735 = fma(_1397, _1495, _1633);
    float _1737 = fma(_1397, _1505, _1671);
    float _1739 = _1705 + _1399;
    float _1741 = fma(_1729, _1523, _1733);
    float _1743 = fma(_1381, _1487, _1707);
    float _1745 = fma(_1381, _1505, _1645);
    float _1747 = _1677 * _1531;
    float _1749 = _1697 * _1531;
    float _1751 = _1699 * _1531;
    int _1753 = _1441 * 48;
    float _1755 = _1709 * _1595;
    float _1757 = _1677 * _1595;
    float _1759 = _1697 * _1595;
    float _1761 = _1699 * _1595;
    float _1763 = fma(_1729, _1587, _1755);
    float _1765 = fma(_1743, _1523, _1747);
    float _1767 = fma(_1675, _1523, _1749);
    float _1769 = fma(_1745, _1523, _1751);
    float _1771 = _1709 * _1627;
    float _1773 = _1677 * _1627;
    float _1775 = _1697 * _1627;
    float _1777 = _1699 * _1627;
    float _1779 = fma(_1729, _1619, _1771);
    float _1781 = fma(_1743, _1587, _1757);
    float _1783 = fma(_1675, _1587, _1759);
    float _1785 = fma(_1745, _1587, _1761);
    float _1787 = fma(_1743, _1619, _1773);
    float _1789 = fma(_1675, _1619, _1775);
    float _1791 = fma(_1739, _1655, _1741);
    float _1793 = fma(_1745, _1619, _1777);
    float _1795 = fma(_1731, _1655, _1765);
    float _1797 = fma(_1735, _1655, _1767);
    float _1799 = _1791 + _1663;
    float _1801 = fma(_1737, _1655, _1769);
    int _1803 = _1753 + 16;
    float _1805 = fma(_1739, _1687, _1763);
    float _1807 = fma(_1731, _1687, _1781);
    float _1809 = fma(_1735, _1687, _1783);
    float _1811 = fma(_1737, _1687, _1785);
    float _1813 = _1805 + _1695;
    int _1815 = _1753 + 32;
    uint _1817 = uint(int(uint(_1803) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1817)] = as_type<uint>(_1795);
    int _1819 = _1803 + 4;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1821)] = as_type<uint>(_1797);
    int _1823 = _1803 + 8;
    uint _1825 = uint(int(uint(_1823) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1825)] = as_type<uint>(_1801);
    int _1827 = _1803 + 12;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1829)] = as_type<uint>(_1799);
    int _1831 = _1753 + 48;
    float _1833 = fma(_1739, _1719, _1779);
    float _1835 = fma(_1731, _1719, _1787);
    float _1837 = fma(_1735, _1719, _1789);
    float _1839 = fma(_1737, _1719, _1793);
    float _1841 = _1833 + _1727;
    uint _1843 = uint(int(uint(_1815) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1843)] = as_type<uint>(_1807);
    int _1845 = _1815 + 4;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1847)] = as_type<uint>(_1809);
    int _1849 = _1815 + 8;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1851)] = as_type<uint>(_1811);
    int _1853 = _1815 + 12;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1855)] = as_type<uint>(_1813);
    uint _1857 = uint(int(uint(_1831) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1857)] = as_type<uint>(_1835);
    int _1859 = _1831 + 4;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1861)] = as_type<uint>(_1837);
    int _1863 = _1831 + 8;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1865)] = as_type<uint>(_1839);
    int _1867 = _1831 + 12;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1869)] = as_type<uint>(_1841);
}

