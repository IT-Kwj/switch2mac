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
int _60(thread const int& _4912, thread const int& _4913, constant _10& support_buffer)
{
    int _4916 = 1 + _4913;
    float _4918 = support_buffer._m5[_4916].x;
    bool _4920 = _4918 == 1.0;
    if (_4920)
    {
        return _4912;
    }
    float _4922 = float(_4912);
    float _4924 = _4922 * _4918;
    int _4926 = int(_4924);
    return _4926;
}

static inline __attribute__((always_inline))
void _58(thread const int& _4600, thread const int& _4601, thread const int& _4602, thread const int& _4603, thread int& _4604, thread int& _4605, thread int& _4606, thread int& _4607, thread int& _4608, thread int& _4609)
{
    float _4612 = as_type<float>(_4601) + 0.0;
    bool _4614 = _4612 != 0.0;
    bool _4616 = isnan(_4612);
    bool _4618 = _4614 || _4616;
    bool _4620 = isnan(0.0);
    bool _4622 = _4618 || _4620;
    int _4624 = as_type<int>(_4612);
    int _4626 = _4601;
    int _4628 = _4602;
    int _4630 = _4622 ? (-1) : 0;
    if (!_4622)
    {
        float _4632 = as_type<float>(_4601) * 1.0;
        _4624 = as_type<int>(_4632);
    }
    int _4634 = _4624;
    bool _4636 = !_4622;
    int _4638 = _4634;
    if (!_4636)
    {
        float _4640 = as_type<float>(_4601) + 0.0;
        bool _4642 = _4640 >= 0.0;
        bool _4644 = isnan(_4640);
        bool _4646 = _4642 || _4644;
        bool _4648 = isnan(0.0);
        bool _4650 = _4646 || _4648;
        int _4652 = as_type<int>(_4640);
        _4630 = _4650 ? (-1) : 0;
        if (!_4650)
        {
            _4652 = 2147483647;
        }
        int _4654 = _4652;
        bool _4656 = !_4650;
        _4638 = _4654;
        if (!_4656)
        {
            float _4658 = as_type<float>(_4601) + 0.0;
            bool _4660 = _4658 > as_type<float>(0x7f800000u /* inf */);
            bool _4662 = isnan(_4658);
            bool _4664 = _4660 || _4662;
            bool _4666 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4668 = _4664 || _4666;
            int _4670 = as_type<int>(_4658);
            _4630 = _4668 ? (-1) : 0;
            if (_4668)
            {
                float _4672 = as_type<float>(_4601) + 1.0;
                _4670 = as_type<int>(_4672);
            }
            int _4674 = _4670;
            _4638 = _4674;
            if (!_4668)
            {
                float _4676 = 0.0 + as_type<float>(_4601);
                bool _4678 = _4676 != as_type<float>(0x7f800000u /* inf */);
                bool _4680 = isnan(_4676);
                bool _4682 = _4678 || _4680;
                bool _4684 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4686 = _4682 || _4684;
                int _4688 = as_type<int>(_4676);
                _4630 = _4686 ? (-1) : 0;
                if (!_4686)
                {
                    _4688 = _4601;
                }
                int _4690 = _4688;
                bool _4692 = !_4686;
                _4638 = _4690;
                if (!_4692)
                {
                    float _4694 = as_type<float>(_4601) * 18446744073709551616.0;
                    float _4696 = rsqrt(_4694);
                    float _4698 = _4694 * _4696;
                    float _4700 = _4696 * 0.5;
                    float _4702 = -_4698;
                    float _4704 = 0.0 + _4702;
                    float _4706 = fma(_4700, _4704, 0.5);
                    float _4708 = fma(_4698, _4706, _4698);
                    float _4710 = -_4708;
                    float _4712 = 0.0 + _4710;
                    float _4714 = fma(_4708, _4712, _4694);
                    float _4716 = fma(_4700, _4714, _4708);
                    float _4718 = _4716 * 2.3283064365386962890625e-10;
                    _4638 = as_type<int>(_4718);
                    _4626 = as_type<int>(_4704);
                    _4628 = as_type<int>(_4708);
                }
            }
        }
    }
    int _4720 = _4638;
    int _4722 = _4626;
    int _4724 = _4628;
    int _4726 = _4630;
    _4604 = _4720;
    _4605 = _4603;
    _4606 = 0;
    _4607 = _4722;
    _4608 = _4724;
    _4609 = _4726;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1385 = false;
    bool _903 = false;
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
    float _137 = _123;
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
    if (_131)
    {
        uint _157 = uint(int(uint(_103) >> uint(2)));
        uint _159 = uint(int(uint(int(_157)) >> uint(2)));
        int _161 = int(_157) & 3;
        float _163 = (*spvDescriptorSet0.cp_c5)._m0[int(_159)][_161];
        _155 = as_type<int>(_163);
    }
    int _165 = _155;
    float _167 = 0.0;
    if (_131)
    {
        _167 = 2.8025969286496341418474591665798e-45;
    }
    float _169 = _167;
    if (_131)
    {
        _135 = 1.4012984643248170709237295832899e-45;
    }
    float _171 = _135;
    float _173 = _153;
    float _175 = as_type<float>(_70);
    float _177 = as_type<float>(_149);
    if (_127)
    {
        int _179 = _70;
        int _181 = 0;
        int _183 = _60(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = _149;
        int _187 = 0;
        int _189 = _60(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _2039 = int3(_183, _189, as_type<int>(_153));
        float3 _193 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2039.xy), uint(_2039.z), 0).xyz;
        float _195 = _193.x;
        float _197 = _193.y;
        float _199 = _193.z;
        _173 = _195;
        _175 = _197;
        _177 = _199;
    }
    float _201 = _173;
    float _203 = _175;
    float _205 = _177;
    float _207 = 0.0;
    float _209 = as_type<float>(_70);
    float _211 = _113;
    if (_131)
    {
        int _213 = _70;
        int _215 = 1;
        int _217 = _60(_213, _215, (*spvDescriptorSet0.support_buffer));
        int _219 = _165;
        int _221 = 1;
        int _223 = _60(_219, _221, (*spvDescriptorSet0.support_buffer));
        int3 _2068 = int3(_217, _223, 0);
        float3 _225 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2068.xy), uint(_2068.z), 0).xyz;
        float _227 = _225.x;
        float _229 = _225.y;
        float _231 = _225.z;
        _207 = _227;
        _209 = _229;
        _211 = _231;
    }
    float _233 = _207;
    float _235 = _209;
    float _237 = _211;
    float _239 = _169;
    float _241 = as_type<float>(_70);
    float _243 = 0.0;
    if (_131)
    {
        int _245 = _70;
        int _247 = 1;
        int _249 = _60(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = _165;
        int _253 = 1;
        int _255 = _60(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _2099 = int3(_249, _255, as_type<int>(_169));
        float3 _257 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2099.xy), uint(_2099.z), 0).xyz;
        float _259 = _257.x;
        float _261 = _257.y;
        float _263 = _257.z;
        _239 = _259;
        _241 = _261;
        _243 = _263;
    }
    float _265 = _239;
    float _267 = _241;
    float _269 = _243;
    float _271 = 0.0;
    float _273 = 0.0;
    float _275 = _171;
    if (_131)
    {
        int _277 = _70;
        int _279 = 1;
        int _281 = _60(_277, _279, (*spvDescriptorSet0.support_buffer));
        int _283 = _165;
        int _285 = 1;
        int _287 = _60(_283, _285, (*spvDescriptorSet0.support_buffer));
        int3 _2128 = int3(_281, _287, as_type<int>(_171));
        float3 _289 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2128.xy), uint(_2128.z), 0).xyz;
        float _291 = _289.x;
        float _293 = _289.y;
        float _295 = _289.z;
        _271 = _291;
        _273 = _293;
        _275 = _295;
    }
    float _297 = _271;
    float _299 = _273;
    float _301 = _275;
    float _303 = 0.0;
    float _305 = 0.0;
    if (!_131)
    {
        _303 = 0.0;
        _305 = 0.0;
    }
    float _307 = _303;
    float _309 = _305;
    float _311 = 0.0;
    float _313 = _307;
    float _315 = _309;
    if (!_131)
    {
        _311 = 0.0;
    }
    float _317 = _311;
    float _319 = 0.0;
    float _321 = _317;
    if (!_131)
    {
        _319 = 0.0;
        _137 = 0.0;
    }
    float _323 = _319;
    float _325 = _137;
    float _327 = 0.0;
    float _329 = _323;
    float _331 = _325;
    if (!_131)
    {
        _327 = 0.0;
    }
    float _333 = _327;
    float _335 = 0.0;
    float _337 = _333;
    if (!_131)
    {
        _335 = 0.0;
    }
    float _339 = _335;
    float _341 = 0.0;
    float _343 = _339;
    if (!_131)
    {
        _341 = 0.0;
    }
    float _345 = _341;
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
        _329 = _301;
        _331 = _299;
        _355 = _297;
        _313 = _233;
        _321 = _235;
        _315 = _237;
        _337 = _265;
        _343 = _267;
        _349 = _269;
    }
    float _357 = _329;
    float _359 = _331;
    float _361 = _355;
    float _363 = _313;
    float _365 = _321;
    float _367 = _315;
    float _369 = _337;
    float _371 = _343;
    float _373 = _349;
    bool _375 = !_127;
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
    if (!_375)
    {
        float _389 = _357 * 0.5;
        float _391 = _359 * 0.5;
        float _393 = _205 * 0.5;
        float _395 = _203 * 0.5;
        float _397 = _389 * 0.15915493667125701904296875;
        float _399 = _391 * 0.15915493667125701904296875;
        float _401 = _361 * 0.5;
        float _403 = _393 * 0.15915493667125701904296875;
        float _405 = _395 * 0.15915493667125701904296875;
        float _407 = _201 * 0.5;
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
        int3 _2547 = int3(_639, _645, 0);
        float3 _647 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2547.xy), uint(_2547.z), 0).xyz;
        float _649 = _647.x;
        float _651 = _647.y;
        float _653 = _647.z;
        int _655 = _70;
        int _657 = 0;
        int _659 = _60(_655, _657, (*spvDescriptorSet0.support_buffer));
        int _661 = as_type<int>(_633);
        int _663 = 0;
        int _665 = _60(_661, _663, (*spvDescriptorSet0.support_buffer));
        int3 _2565 = int3(_659, _665, 2);
        float3 _667 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2565.xy), uint(_2565.z), 0).xyz;
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
        float _783 = _649 * _773;
        float _785 = _651 * _773;
        float _787 = _653 * _773;
        float _789 = _519 * _781;
        float _791 = _507 * _781;
        int _793 = _103 + 20;
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
        _903 = true;
    }
    else
    {
        float _905 = _361 * 0.15915493667125701904296875;
        float _907 = _357 * 0.15915493667125701904296875;
        float _909 = _359 * 0.15915493667125701904296875;
        float _911 = _905 * 6.283185482025146484375;
        float _913 = sin(_911);
        float _915 = _905 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _907 * 6.283185482025146484375;
        float _921 = sin(_919);
        float _923 = _907 * 6.283185482025146484375;
        float _925 = cos(_923);
        float _927 = _909 * 6.283185482025146484375;
        float _929 = sin(_927);
        float _931 = _921 * _917;
        float _933 = _913 * _921;
        float _935 = _909 * 6.283185482025146484375;
        float _937 = cos(_935);
        float _939 = _917 * _925;
        float _941 = _913 * _925;
        float _943 = _913 * _929;
        float _945 = _937 * _925;
        float _947 = _921 * _937;
        float _949 = _917 * _937;
        float _951 = -_931;
        float _953 = fma(_925, _943, _951);
        float _955 = fma(_921, _943, _939);
        float _957 = _913 * _937;
        float _959 = fma(_929, _939, _933);
        float _961 = -_941;
        float _963 = fma(_929, _931, _961);
        float _965 = -_929;
        float _967 = _965 + (-0.0);
        _879 = _945;
        _881 = _947;
        _883 = _967;
        _885 = _365;
        _887 = _953;
        _889 = _955;
        _891 = _957;
        _893 = _367;
        _895 = _959;
        _897 = _963;
        _899 = _949;
        _901 = _943;
    }
    _903 = false;
    float _969 = _377;
    float _971 = _879;
    float _973 = _881;
    float _975 = _883;
    float _977 = _885;
    float _979 = _887;
    float _981 = _889;
    float _983 = _891;
    float _985 = _893;
    float _987 = _895;
    float _989 = _897;
    float _991 = _899;
    int _993 = _379;
    int _995 = _381;
    int _997 = _383;
    float _999 = _901;
    float _1001 = _969 * _971;
    float _1003 = _969 * _973;
    float _1005 = _969 * _975;
    float _1007 = _977 * _979;
    float _1009 = _977 * _981;
    float _1011 = _977 * _983;
    int _1013 = _70 * 48;
    float _1015 = _985 * _987;
    float _1017 = _985 * _989;
    float _1019 = _985 * _991;
    int _1021 = _70 * 112;
    uint _1023 = uint(int(uint(_1013) >> uint(2)));
    _39[int(_1023)] = as_type<uint>(_1001);
    int _1025 = _1013 + 4;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    _39[int(_1027)] = as_type<uint>(_1007);
    int _1029 = _1013 + 8;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    _39[int(_1031)] = as_type<uint>(_1015);
    int _1033 = _1013 + 12;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    _39[int(_1035)] = uint(_993);
    bool _1037 = _70 != 0;
    bool _1039 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1041 = _1013 + 16;
    uint _1043 = uint(int(uint(_1041) >> uint(2)));
    _39[int(_1043)] = as_type<uint>(_1003);
    int _1045 = _1013 + 20;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    _39[int(_1047)] = as_type<uint>(_1009);
    int _1049 = _1013 + 24;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    _39[int(_1051)] = as_type<uint>(_1017);
    int _1053 = _1013 + 28;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    _39[int(_1055)] = uint(_995);
    int _1057 = _1013 + 32;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    _39[int(_1059)] = as_type<uint>(_1005);
    int _1061 = _1013 + 36;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    _39[int(_1063)] = as_type<uint>(_1011);
    int _1065 = _1013 + 40;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    _39[int(_1067)] = as_type<uint>(_1019);
    int _1069 = _1013 + 44;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    _39[int(_1071)] = uint(_997);
    float _1073 = _969;
    float _1075 = _985;
    float _1077 = _999;
    float _1079 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _1081 = _1011;
    float _1083 = _1005;
    float _1085 = _1017;
    float _1087 = _1019;
    float _1089 = as_type<float>(_995);
    float _1091 = as_type<float>(_997);
    if (!_1037)
    {
        _385 = _1001;
    }
    float _1093 = _385;
    float _1095 = _1093;
    if (!_1037)
    {
        _1073 = _1007;
    }
    float _1097 = _1073;
    float _1099 = _1097;
    if (!_1037)
    {
        _387 = _1015;
    }
    float _1101 = _387;
    float _1103 = _1101;
    if (!_1037)
    {
        _1075 = as_type<float>(_993);
    }
    float _1105 = _1075;
    float _1107 = _1105;
    if (!_1037)
    {
        _1077 = _1003;
    }
    float _1109 = _1077;
    float _1111 = _1109;
    if (!_1037)
    {
        _1079 = _1009;
    }
    float _1113 = _1079;
    float _1115 = _1113;
    if (!_1039)
    {
        int _1117 = _70 * 48;
        int _1119 = _1117 + 16;
        uint _1121 = uint(int(uint(_1117) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1121)] = as_type<uint>(_1001);
        int _1123 = _1117 + 4;
        uint _1125 = uint(int(uint(_1123) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1125)] = as_type<uint>(_1007);
        int _1127 = _1117 + 8;
        uint _1129 = uint(int(uint(_1127) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1129)] = as_type<uint>(_1015);
        int _1131 = _1117 + 12;
        uint _1133 = uint(int(uint(_1131) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1133)] = uint(_993);
        int _1135 = _1117 + 32;
        uint _1137 = uint(int(uint(_1119) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1137)] = as_type<uint>(_1003);
        int _1139 = _1119 + 4;
        uint _1141 = uint(int(uint(_1139) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1141)] = as_type<uint>(_1009);
        int _1143 = _1119 + 8;
        uint _1145 = uint(int(uint(_1143) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1145)] = as_type<uint>(_1017);
        int _1147 = _1119 + 12;
        uint _1149 = uint(int(uint(_1147) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1149)] = uint(_995);
        uint _1151 = uint(int(uint(_1135) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1151)] = as_type<uint>(_1005);
        int _1153 = _1135 + 4;
        uint _1155 = uint(int(uint(_1153) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1155)] = as_type<uint>(_1011);
        int _1157 = _1135 + 8;
        uint _1159 = uint(int(uint(_1157) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1159)] = as_type<uint>(_1019);
        int _1161 = _1135 + 12;
        uint _1163 = uint(int(uint(_1161) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1163)] = uint(_997);
    }
    bool _1165 = !_1037;
    if (!_1165)
    {
        bool _1167 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1169 = !_1167;
        if (!_1169)
        {
            uint _1171 = uint(int(uint(_1021) >> uint(2)));
            uint _1173 = uint(int(uint(int(_1171)) >> uint(2)));
            int _1175 = int(_1171) & 3;
            float _1177 = (*spvDescriptorSet0.cp_c6)._m0[int(_1173)][_1175];
            int _1179 = as_type<int>(_1177) * 48;
            int _1181 = 0;
            bool _1183;
            float _1279;
            float _1283;
            float _1287;
            float _1291;
            float _1305;
            float _1307;
            float _1319;
            float _1329;
            float _1331;
            float _1333;
            float _1335;
            float _1337;
            do
            {
                int _1185 = _1181;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1187 = uint(int(uint(_1179) >> uint(2)));
                float _1189 = as_type<float>(_39[int(_1187)]);
                int _1191 = _1179 + 4;
                uint _1193 = uint(int(uint(_1191) >> uint(2)));
                float _1195 = as_type<float>(_39[int(_1193)]);
                int _1197 = _1179 + 8;
                uint _1199 = uint(int(uint(_1197) >> uint(2)));
                float _1201 = as_type<float>(_39[int(_1199)]);
                int _1203 = _1179 + 12;
                uint _1205 = uint(int(uint(_1203) >> uint(2)));
                float _1207 = as_type<float>(_39[int(_1205)]);
                int _1209 = _1185 + 1;
                int _1211 = _1179 + 16;
                uint _1213 = uint(int(uint(_1211) >> uint(2)));
                float _1215 = as_type<float>(_39[int(_1213)]);
                int _1217 = _1179 + 20;
                uint _1219 = uint(int(uint(_1217) >> uint(2)));
                float _1221 = as_type<float>(_39[int(_1219)]);
                int _1223 = _1179 + 24;
                uint _1225 = uint(int(uint(_1223) >> uint(2)));
                float _1227 = as_type<float>(_39[int(_1225)]);
                int _1229 = _1179 + 28;
                uint _1231 = uint(int(uint(_1229) >> uint(2)));
                float _1233 = as_type<float>(_39[int(_1231)]);
                bool _1235 = uint(_1209) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1237 = _1179 + 32;
                uint _1239 = uint(int(uint(_1237) >> uint(2)));
                float _1241 = as_type<float>(_39[int(_1239)]);
                int _1243 = _1179 + 36;
                uint _1245 = uint(int(uint(_1243) >> uint(2)));
                float _1247 = as_type<float>(_39[int(_1245)]);
                int _1249 = _1179 + 40;
                uint _1251 = uint(int(uint(_1249) >> uint(2)));
                float _1253 = as_type<float>(_39[int(_1251)]);
                int _1255 = _1179 + 44;
                uint _1257 = uint(int(uint(_1255) >> uint(2)));
                float _1259 = as_type<float>(_39[int(_1257)]);
                float _1261 = _1195 * as_type<float>(_995);
                float _1263 = _1003 * _1195;
                float _1265 = _1009 * _1195;
                float _1267 = _1017 * _1195;
                float _1269 = fma(_1189, as_type<float>(_993), _1261);
                float _1271 = fma(_1001, _1189, _1263);
                float _1273 = fma(_1007, _1189, _1265);
                float _1275 = fma(_1015, _1189, _1267);
                float _1277 = fma(_1201, as_type<float>(_997), _1269);
                _1279 = fma(_1005, _1201, _1271);
                float _1281 = _1003 * _1221;
                _1283 = fma(_1019, _1201, _1275);
                float _1285 = _1221 * as_type<float>(_995);
                _1287 = _1207 + _1277;
                float _1289 = _1009 * _1221;
                _1291 = fma(_1011, _1201, _1273);
                float _1293 = fma(_1215, as_type<float>(_993), _1285);
                float _1295 = fma(_1001, _1215, _1281);
                float _1297 = fma(_1007, _1215, _1289);
                float _1299 = _1017 * _1221;
                float _1301 = fma(_1227, as_type<float>(_997), _1293);
                float _1303 = _1247 * as_type<float>(_995);
                _1305 = fma(_1005, _1227, _1295);
                _1307 = fma(_1011, _1227, _1297);
                float _1309 = _1003 * _1247;
                float _1311 = _1009 * _1247;
                float _1313 = _1017 * _1247;
                float _1315 = fma(_1241, as_type<float>(_993), _1303);
                float _1317 = fma(_1015, _1215, _1299);
                _1319 = _1233 + _1301;
                float _1321 = fma(_1001, _1241, _1309);
                float _1323 = fma(_1007, _1241, _1311);
                float _1325 = fma(_1015, _1241, _1313);
                float _1327 = fma(_1253, as_type<float>(_997), _1315);
                _1329 = fma(_1019, _1227, _1317);
                _1331 = fma(_1005, _1253, _1321);
                _1333 = fma(_1011, _1253, _1323);
                _1335 = fma(_1019, _1253, _1325);
                _1337 = _1259 + _1327;
                uint _1339 = uint(int(uint(_1013) >> uint(2)));
                _39[int(_1339)] = as_type<uint>(_1279);
                int _1341 = _1013 + 4;
                uint _1343 = uint(int(uint(_1341) >> uint(2)));
                _39[int(_1343)] = as_type<uint>(_1291);
                int _1345 = _1013 + 8;
                uint _1347 = uint(int(uint(_1345) >> uint(2)));
                _39[int(_1347)] = as_type<uint>(_1283);
                int _1349 = _1013 + 12;
                uint _1351 = uint(int(uint(_1349) >> uint(2)));
                _39[int(_1351)] = as_type<uint>(_1287);
                int _1353 = _1013 + 16;
                uint _1355 = uint(int(uint(_1353) >> uint(2)));
                _39[int(_1355)] = as_type<uint>(_1305);
                int _1357 = _1013 + 20;
                uint _1359 = uint(int(uint(_1357) >> uint(2)));
                _39[int(_1359)] = as_type<uint>(_1307);
                int _1361 = _1013 + 24;
                uint _1363 = uint(int(uint(_1361) >> uint(2)));
                _39[int(_1363)] = as_type<uint>(_1329);
                int _1365 = _1013 + 28;
                uint _1367 = uint(int(uint(_1365) >> uint(2)));
                _39[int(_1367)] = as_type<uint>(_1319);
                int _1369 = _1013 + 32;
                uint _1371 = uint(int(uint(_1369) >> uint(2)));
                _39[int(_1371)] = as_type<uint>(_1331);
                int _1373 = _1013 + 36;
                uint _1375 = uint(int(uint(_1373) >> uint(2)));
                _39[int(_1375)] = as_type<uint>(_1333);
                int _1377 = _1013 + 40;
                uint _1379 = uint(int(uint(_1377) >> uint(2)));
                _39[int(_1379)] = as_type<uint>(_1335);
                int _1381 = _1013 + 44;
                uint _1383 = uint(int(uint(_1381) >> uint(2)));
                _39[int(_1383)] = as_type<uint>(_1337);
                _1183 = !_1235;
                _1181 = _1209;
            } while (_1183);
            _1115 = _1307;
            _1081 = _1333;
            _1099 = _1291;
            _1111 = _1305;
            _1083 = _1331;
            _1095 = _1279;
            _1085 = _1329;
            _1103 = _1283;
            _1087 = _1335;
            _1089 = _1319;
            _1107 = _1287;
            _1091 = _1337;
            _1385 = true;
        }
        else
        {
            _1115 = 0.0;
            _1081 = 0.0;
            _1099 = 0.0;
            _1111 = 0.0;
            _1083 = 0.0;
            _1095 = 0.0;
            _1085 = 0.0;
            _1103 = 0.0;
            _1087 = 0.0;
            _1089 = 0.0;
            _1107 = 0.0;
            _1091 = 0.0;
        }
    }
    _1385 = false;
    float _1387 = _1115;
    float _1389 = _1081;
    float _1391 = _1099;
    float _1393 = _1111;
    float _1395 = _1083;
    float _1397 = _1095;
    float _1399 = _1085;
    float _1401 = _1103;
    float _1403 = _1087;
    float _1405 = _1089;
    float _1407 = _1107;
    float _1409 = _1091;
    int _1411 = _1021 + 80;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    uint _1415 = uint(int(uint(int(_1413)) >> uint(2)));
    int _1417 = int(_1413) & 3;
    float _1419 = (*spvDescriptorSet0.cp_c6)._m0[int(_1415)][_1417];
    int _1421 = int(_1413) + 1;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    int _1425 = _1421 & 3;
    float _1427 = (*spvDescriptorSet0.cp_c6)._m0[int(_1423)][_1425];
    int _1429 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1431 = _1429 + _70;
    int _1433 = _1021 + 64;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    uint _1437 = uint(int(uint(int(_1435)) >> uint(2)));
    int _1439 = int(_1435) & 3;
    float _1441 = (*spvDescriptorSet0.cp_c6)._m0[int(_1437)][_1439];
    int _1443 = int(_1435) + 1;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    int _1447 = _1443 & 3;
    float _1449 = (*spvDescriptorSet0.cp_c6)._m0[int(_1445)][_1447];
    int _1451 = _1431 * 48;
    int _1453 = _1021 + 88;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    uint _1457 = uint(int(uint(int(_1455)) >> uint(2)));
    int _1459 = int(_1455) & 3;
    float _1461 = (*spvDescriptorSet0.cp_c6)._m0[int(_1457)][_1459];
    int _1463 = int(_1455) + 1;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    int _1467 = _1463 & 3;
    float _1469 = (*spvDescriptorSet0.cp_c6)._m0[int(_1465)][_1467];
    int _1471 = _1021 + 72;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    uint _1475 = uint(int(uint(int(_1473)) >> uint(2)));
    int _1477 = int(_1473) & 3;
    float _1479 = (*spvDescriptorSet0.cp_c6)._m0[int(_1475)][_1477];
    int _1481 = int(_1473) + 1;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    int _1485 = _1481 & 3;
    float _1487 = (*spvDescriptorSet0.cp_c6)._m0[int(_1483)][_1485];
    int _1489 = _1021 + 96;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    uint _1493 = uint(int(uint(int(_1491)) >> uint(2)));
    int _1495 = int(_1491) & 3;
    float _1497 = (*spvDescriptorSet0.cp_c6)._m0[int(_1493)][_1495];
    int _1499 = int(_1491) + 1;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    int _1503 = _1499 & 3;
    float _1505 = (*spvDescriptorSet0.cp_c6)._m0[int(_1501)][_1503];
    int _1507 = _1021 + 104;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    uint _1511 = uint(int(uint(int(_1509)) >> uint(2)));
    int _1513 = int(_1509) & 3;
    float _1515 = (*spvDescriptorSet0.cp_c6)._m0[int(_1511)][_1513];
    int _1517 = int(_1509) + 1;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    int _1521 = _1517 & 3;
    float _1523 = (*spvDescriptorSet0.cp_c6)._m0[int(_1519)][_1521];
    float _1525 = _1387 * _1419;
    float _1527 = _1389 * _1419;
    int _1529 = _1021 + 16;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    uint _1533 = uint(int(uint(int(_1531)) >> uint(2)));
    int _1535 = int(_1531) & 3;
    float _1537 = (*spvDescriptorSet0.cp_c6)._m0[int(_1533)][_1535];
    int _1539 = int(_1531) + 1;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    int _1543 = _1539 & 3;
    float _1545 = (*spvDescriptorSet0.cp_c6)._m0[int(_1541)][_1543];
    float _1547 = _1391 * _1419;
    float _1549 = fma(_1393, _1441, _1525);
    float _1551 = _1391 * _1427;
    int _1553 = _1021 + 32;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
    int _1559 = int(_1555) & 3;
    float _1561 = (*spvDescriptorSet0.cp_c6)._m0[int(_1557)][_1559];
    int _1563 = int(_1555) + 1;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    int _1567 = _1563 & 3;
    float _1569 = (*spvDescriptorSet0.cp_c6)._m0[int(_1565)][_1567];
    float _1571 = fma(_1395, _1441, _1527);
    float _1573 = _1387 * _1427;
    float _1575 = fma(_1397, _1449, _1551);
    float _1577 = _1389 * _1427;
    float _1579 = fma(_1397, _1441, _1547);
    float _1581 = _1391 * _1461;
    float _1583 = _1391 * _1469;
    int _1585 = _1021 + 48;
    uint _1587 = uint(int(uint(_1585) >> uint(2)));
    uint _1589 = uint(int(uint(int(_1587)) >> uint(2)));
    int _1591 = int(_1587) & 3;
    float _1593 = (*spvDescriptorSet0.cp_c6)._m0[int(_1589)][_1591];
    int _1595 = int(_1587) + 1;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    int _1599 = _1595 & 3;
    float _1601 = (*spvDescriptorSet0.cp_c6)._m0[int(_1597)][_1599];
    float _1603 = _1387 * _1461;
    float _1605 = _1387 * _1469;
    float _1607 = _1389 * _1461;
    float _1609 = _1389 * _1469;
    float _1611 = fma(_1393, _1449, _1573);
    float _1613 = fma(_1395, _1449, _1577);
    float _1615 = fma(_1397, _1479, _1581);
    int _1617 = _1021 + 24;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    uint _1621 = uint(int(uint(int(_1619)) >> uint(2)));
    int _1623 = int(_1619) & 3;
    float _1625 = (*spvDescriptorSet0.cp_c6)._m0[int(_1621)][_1623];
    int _1627 = int(_1619) + 1;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    int _1631 = _1627 & 3;
    float _1633 = (*spvDescriptorSet0.cp_c6)._m0[int(_1629)][_1631];
    float _1635 = fma(_1397, _1487, _1583);
    float _1637 = fma(_1393, _1479, _1603);
    float _1639 = fma(_1393, _1487, _1605);
    float _1641 = fma(_1395, _1479, _1607);
    float _1643 = fma(_1395, _1487, _1609);
    float _1645 = fma(_1399, _1497, _1549);
    float _1647 = fma(_1399, _1505, _1611);
    int _1649 = _1021 + 40;
    uint _1651 = uint(int(uint(_1649) >> uint(2)));
    uint _1653 = uint(int(uint(int(_1651)) >> uint(2)));
    int _1655 = int(_1651) & 3;
    float _1657 = (*spvDescriptorSet0.cp_c6)._m0[int(_1653)][_1655];
    int _1659 = int(_1651) + 1;
    uint _1661 = uint(int(uint(_1659) >> uint(2)));
    int _1663 = _1659 & 3;
    float _1665 = (*spvDescriptorSet0.cp_c6)._m0[int(_1661)][_1663];
    float _1667 = fma(_1401, _1505, _1575);
    float _1669 = fma(_1403, _1497, _1571);
    float _1671 = fma(_1403, _1505, _1613);
    float _1673 = fma(_1401, _1497, _1579);
    float _1675 = fma(_1399, _1515, _1637);
    float _1677 = fma(_1399, _1523, _1639);
    int _1679 = _1021 + 56;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    uint _1683 = uint(int(uint(int(_1681)) >> uint(2)));
    int _1685 = int(_1681) & 3;
    float _1687 = (*spvDescriptorSet0.cp_c6)._m0[int(_1683)][_1685];
    int _1689 = int(_1681) + 1;
    uint _1691 = uint(int(uint(_1689) >> uint(2)));
    int _1693 = _1689 & 3;
    float _1695 = (*spvDescriptorSet0.cp_c6)._m0[int(_1691)][_1693];
    float _1697 = fma(_1401, _1523, _1635);
    float _1699 = fma(_1403, _1523, _1643);
    float _1701 = _1677 + _1405;
    float _1703 = fma(_1403, _1515, _1641);
    float _1705 = _1697 + _1407;
    float _1707 = fma(_1401, _1515, _1615);
    float _1709 = _1699 + _1409;
    float _1711 = _1701 * _1545;
    float _1713 = _1647 * _1545;
    float _1715 = _1675 * _1545;
    float _1717 = _1645 * _1545;
    float _1719 = fma(_1705, _1537, _1711);
    float _1721 = fma(_1667, _1537, _1713);
    float _1723 = fma(_1707, _1537, _1715);
    float _1725 = fma(_1673, _1537, _1717);
    float _1727 = _1701 * _1569;
    float _1729 = _1645 * _1569;
    float _1731 = _1647 * _1569;
    float _1733 = _1675 * _1569;
    float _1735 = fma(_1705, _1561, _1727);
    float _1737 = fma(_1673, _1561, _1729);
    float _1739 = fma(_1667, _1561, _1731);
    float _1741 = fma(_1707, _1561, _1733);
    float _1743 = _1701 * _1601;
    float _1745 = _1647 * _1601;
    float _1747 = _1645 * _1601;
    float _1749 = _1675 * _1601;
    float _1751 = fma(_1705, _1593, _1743);
    float _1753 = fma(_1667, _1593, _1745);
    float _1755 = fma(_1673, _1593, _1747);
    float _1757 = fma(_1707, _1593, _1749);
    float _1759 = fma(_1709, _1625, _1719);
    float _1761 = fma(_1671, _1625, _1721);
    float _1763 = fma(_1703, _1625, _1723);
    float _1765 = fma(_1669, _1625, _1725);
    float _1767 = _1759 + _1633;
    int _1769 = _1451 + 16;
    int _1771 = _1451 + 32;
    float _1773 = fma(_1709, _1657, _1735);
    float _1775 = fma(_1669, _1657, _1737);
    float _1777 = fma(_1671, _1657, _1739);
    float _1779 = fma(_1703, _1657, _1741);
    float _1781 = _1773 + _1665;
    int _1783 = _1451 + 48;
    uint _1785 = uint(int(uint(_1769) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1785)] = as_type<uint>(_1765);
    int _1787 = _1769 + 4;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1789)] = as_type<uint>(_1761);
    int _1791 = _1769 + 8;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1793)] = as_type<uint>(_1763);
    int _1795 = _1769 + 12;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1797)] = as_type<uint>(_1767);
    float _1799 = fma(_1709, _1687, _1751);
    float _1801 = fma(_1669, _1687, _1755);
    float _1803 = fma(_1671, _1687, _1753);
    float _1805 = fma(_1703, _1687, _1757);
    float _1807 = _1799 + _1695;
    uint _1809 = uint(int(uint(_1771) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1809)] = as_type<uint>(_1775);
    int _1811 = _1771 + 4;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1813)] = as_type<uint>(_1777);
    int _1815 = _1771 + 8;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1817)] = as_type<uint>(_1779);
    int _1819 = _1771 + 12;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1821)] = as_type<uint>(_1781);
    uint _1823 = uint(int(uint(_1783) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1823)] = as_type<uint>(_1801);
    int _1825 = _1783 + 4;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1827)] = as_type<uint>(_1803);
    int _1829 = _1783 + 8;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1831)] = as_type<uint>(_1805);
    int _1833 = _1783 + 12;
    uint _1835 = uint(int(uint(_1833) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1835)] = as_type<uint>(_1807);
}

