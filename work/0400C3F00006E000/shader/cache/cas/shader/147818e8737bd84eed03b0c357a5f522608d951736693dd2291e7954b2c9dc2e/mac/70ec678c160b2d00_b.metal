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
int _60(thread const int& _5423, thread const int& _5424, constant _10& support_buffer)
{
    int _5427 = 1 + _5424;
    float _5429 = support_buffer._m5[_5427].x;
    bool _5431 = _5429 == 1.0;
    if (_5431)
    {
        return _5423;
    }
    float _5433 = float(_5423);
    float _5435 = _5433 * _5429;
    int _5437 = int(_5435);
    return _5437;
}

static inline __attribute__((always_inline))
void _58(thread const int& _5110, thread const int& _5111, thread const int& _5112, thread const int& _5113, thread const int& _5114, thread int& _5115, thread int& _5116, thread int& _5117, thread int& _5118, thread int& _5119, thread int& _5120)
{
    float _5123 = as_type<float>(_5112) + 0.0;
    bool _5125 = _5123 != 0.0;
    bool _5127 = isnan(_5123);
    bool _5129 = _5125 || _5127;
    bool _5131 = isnan(0.0);
    bool _5133 = _5129 || _5131;
    int _5135 = as_type<int>(_5123);
    int _5137 = _5111;
    int _5139 = _5114;
    int _5141 = _5133 ? (-1) : 0;
    if (!_5133)
    {
        float _5143 = as_type<float>(_5112) * 1.0;
        _5135 = as_type<int>(_5143);
    }
    int _5145 = _5135;
    bool _5147 = !_5133;
    int _5149 = _5145;
    if (!_5147)
    {
        float _5151 = as_type<float>(_5112) + 0.0;
        bool _5153 = _5151 >= 0.0;
        bool _5155 = isnan(_5151);
        bool _5157 = _5153 || _5155;
        bool _5159 = isnan(0.0);
        bool _5161 = _5157 || _5159;
        int _5163 = as_type<int>(_5151);
        _5141 = _5161 ? (-1) : 0;
        if (!_5161)
        {
            _5163 = 2147483647;
        }
        int _5165 = _5163;
        bool _5167 = !_5161;
        _5149 = _5165;
        if (!_5167)
        {
            float _5169 = as_type<float>(_5112) + 0.0;
            bool _5171 = _5169 > as_type<float>(0x7f800000u /* inf */);
            bool _5173 = isnan(_5169);
            bool _5175 = _5171 || _5173;
            bool _5177 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5179 = _5175 || _5177;
            int _5181 = as_type<int>(_5169);
            _5141 = _5179 ? (-1) : 0;
            if (_5179)
            {
                float _5183 = as_type<float>(_5112) + 1.0;
                _5181 = as_type<int>(_5183);
            }
            int _5185 = _5181;
            _5149 = _5185;
            if (!_5179)
            {
                float _5187 = 0.0 + as_type<float>(_5112);
                bool _5189 = _5187 != as_type<float>(0x7f800000u /* inf */);
                bool _5191 = isnan(_5187);
                bool _5193 = _5189 || _5191;
                bool _5195 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5197 = _5193 || _5195;
                int _5199 = as_type<int>(_5187);
                _5141 = _5197 ? (-1) : 0;
                if (!_5197)
                {
                    _5199 = _5112;
                }
                int _5201 = _5199;
                bool _5203 = !_5197;
                _5149 = _5201;
                if (!_5203)
                {
                    float _5205 = as_type<float>(_5112) * 18446744073709551616.0;
                    float _5207 = rsqrt(_5205);
                    float _5209 = _5205 * _5207;
                    float _5211 = _5207 * 0.5;
                    float _5213 = -_5209;
                    float _5215 = 0.0 + _5213;
                    float _5217 = fma(_5211, _5215, 0.5);
                    float _5219 = fma(_5209, _5217, _5209);
                    float _5221 = -_5219;
                    float _5223 = 0.0 + _5221;
                    float _5225 = fma(_5219, _5223, _5205);
                    float _5227 = fma(_5211, _5225, _5219);
                    float _5229 = _5227 * 2.3283064365386962890625e-10;
                    _5149 = as_type<int>(_5229);
                    _5137 = as_type<int>(_5215);
                    _5139 = as_type<int>(_5219);
                }
            }
        }
    }
    int _5231 = _5149;
    int _5233 = _5137;
    int _5235 = _5139;
    int _5237 = _5141;
    _5115 = _5231;
    _5116 = _5113;
    _5117 = 0;
    _5118 = _5233;
    _5119 = _5235;
    _5120 = _5237;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1605 = false;
    bool _1119 = false;
    bool _719 = false;
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
    int _105 = _103 + 32;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _103 + 36;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.cp_c5)._m0[int(_119)][_121];
    int _125 = as_type<int>(_101) & as_type<int>(_113);
    bool _127 = _125 != 0;
    int _129 = as_type<int>(_101) & as_type<int>(_123);
    bool _131 = _129 != 0;
    float _133 = 0.0;
    float _135 = 0.0;
    float _137 = _113;
    float _139 = _101;
    if (!_127)
    {
        _133 = 0.0;
        _135 = 0.0;
    }
    float _141 = _133;
    float _143 = _135;
    float _145 = 0.0;
    float _147 = _141;
    float _149 = _143;
    if (!_127)
    {
        _145 = 0.0;
    }
    float _151 = _145;
    float _153 = 0.0;
    float _155 = _151;
    if (!_127)
    {
        _153 = 0.0;
        _137 = 0.0;
    }
    float _157 = _153;
    float _159 = _137;
    float _161 = 0.0;
    float _163 = _157;
    float _165 = _159;
    if (!_127)
    {
        _161 = 0.0;
    }
    float _167 = _161;
    float _169 = 0.0;
    float _171 = _167;
    if (!_127)
    {
        _169 = 0.0;
    }
    float _173 = _169;
    float _175 = 0.0;
    float _177 = _173;
    if (!_127)
    {
        _175 = 0.0;
    }
    float _179 = _175;
    float _181 = _179;
    if (!_127)
    {
        _139 = 0.0;
    }
    float _183 = _139;
    bool _185 = !_127;
    float _187 = _183;
    if (!_185)
    {
        uint _189 = uint(int(uint(_103) >> uint(2)));
        uint _191 = uint(int(uint(int(_189)) >> uint(2)));
        int _193 = int(_189) & 3;
        float _195 = (*spvDescriptorSet0.cp_c5)._m0[int(_191)][_193];
        int _197 = int(_189) + 1;
        uint _199 = uint(int(uint(_197) >> uint(2)));
        int _201 = _197 & 3;
        float _203 = (*spvDescriptorSet0.cp_c5)._m0[int(_199)][_201];
        int _205 = _70;
        int _207 = 0;
        int _209 = _60(_205, _207, (*spvDescriptorSet0.support_buffer));
        int _211 = as_type<int>(_195);
        int _213 = 0;
        int _215 = _60(_211, _213, (*spvDescriptorSet0.support_buffer));
        int3 _2271 = int3(_209, _215, 1);
        float3 _219 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2271.xy), uint(_2271.z), 0).xyz;
        float _221 = _219.x;
        float _223 = _219.y;
        float _225 = _219.z;
        int _227 = _70;
        int _229 = 0;
        int _231 = _60(_227, _229, (*spvDescriptorSet0.support_buffer));
        int _233 = as_type<int>(_203);
        int _235 = 0;
        int _237 = _60(_233, _235, (*spvDescriptorSet0.support_buffer));
        int3 _2289 = int3(_231, _237, 1);
        float3 _239 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2289.xy), uint(_2289.z), 0).xyz;
        float _241 = _239.x;
        float _243 = _239.y;
        float _245 = _239.z;
        int _247 = _70;
        int _249 = 0;
        int _251 = _60(_247, _249, (*spvDescriptorSet0.support_buffer));
        int _253 = as_type<int>(_195);
        int _255 = 0;
        int _257 = _60(_253, _255, (*spvDescriptorSet0.support_buffer));
        int3 _2307 = int3(_251, _257, 0);
        float3 _259 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2307.xy), uint(_2307.z), 0).xyz;
        float _261 = _259.x;
        float _263 = _259.y;
        float _265 = _259.z;
        int _267 = _70;
        int _269 = 0;
        int _271 = _60(_267, _269, (*spvDescriptorSet0.support_buffer));
        int _273 = as_type<int>(_203);
        int _275 = 0;
        int _277 = _60(_273, _275, (*spvDescriptorSet0.support_buffer));
        int3 _2325 = int3(_271, _277, 0);
        float3 _279 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2325.xy), uint(_2325.z), 0).xyz;
        float _281 = _279.x;
        float _283 = _279.y;
        float _285 = _279.z;
        int _287 = _70;
        int _289 = 0;
        int _291 = _60(_287, _289, (*spvDescriptorSet0.support_buffer));
        int _293 = as_type<int>(_195);
        int _295 = 0;
        int _297 = _60(_293, _295, (*spvDescriptorSet0.support_buffer));
        int3 _2343 = int3(_291, _297, 2);
        float3 _299 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2343.xy), uint(_2343.z), 0).xyz;
        float _301 = _299.x;
        float _303 = _299.y;
        float _305 = _299.z;
        int _307 = _70;
        int _309 = 0;
        int _311 = _60(_307, _309, (*spvDescriptorSet0.support_buffer));
        int _313 = as_type<int>(_203);
        int _315 = 0;
        int _317 = _60(_313, _315, (*spvDescriptorSet0.support_buffer));
        int3 _2361 = int3(_311, _317, 2);
        float3 _319 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2361.xy), uint(_2361.z), 0).xyz;
        float _321 = _319.x;
        float _323 = _319.y;
        float _325 = _319.z;
        int _327 = _103 + 16;
        uint _329 = uint(int(uint(_327) >> uint(2)));
        uint _331 = uint(int(uint(int(_329)) >> uint(2)));
        int _333 = int(_329) & 3;
        float _335 = (*spvDescriptorSet0.cp_c5)._m0[int(_331)][_333];
        float _337 = -_221;
        float _339 = _337 + _241;
        float _341 = -_225;
        float _343 = _341 + _245;
        float _345 = fma(_339, _335, _221);
        float _347 = -_223;
        float _349 = _347 + _243;
        float _351 = -_263;
        float _353 = _351 + _283;
        float _355 = -_265;
        float _357 = _355 + _285;
        float _359 = -_261;
        float _361 = _359 + _281;
        float _363 = fma(_349, _335, _223);
        float _365 = -_301;
        float _367 = _365 + _321;
        float _369 = -_303;
        float _371 = _369 + _323;
        float _373 = -_305;
        float _375 = _373 + _325;
        float _377 = fma(_353, _335, _263);
        float _379 = fma(_357, _335, _265);
        float _381 = fma(_343, _335, _225);
        float _383 = fma(_361, _335, _261);
        float _385 = fma(_367, _335, _301);
        float _387 = fma(_371, _335, _303);
        float _389 = fma(_375, _335, _305);
        _187 = _381;
        _163 = _363;
        _165 = _345;
        _147 = _383;
        _155 = _377;
        _149 = _379;
        _171 = _385;
        _177 = _387;
        _181 = _389;
    }
    float _391 = _187;
    float _393 = _163;
    float _395 = _165;
    float _397 = _147;
    float _399 = _155;
    float _401 = _149;
    float _403 = _171;
    float _405 = _177;
    float _407 = _181;
    bool _409 = !_131;
    float _411 = _397;
    int _413 = as_type<int>(_403);
    int _415 = as_type<int>(_405);
    int _417 = as_type<int>(_407);
    float _419 = _399;
    float _421 = _401;
    float _1095;
    float _1097;
    float _1099;
    float _1101;
    float _1103;
    float _1105;
    float _1107;
    float _1109;
    float _1111;
    float _1113;
    float _1115;
    float _1117;
    if (!_409)
    {
        int _423 = _103 + 8;
        uint _425 = uint(int(uint(_423) >> uint(2)));
        uint _427 = uint(int(uint(int(_425)) >> uint(2)));
        int _429 = int(_425) & 3;
        float _431 = (*spvDescriptorSet0.cp_c5)._m0[int(_427)][_429];
        int _433 = int(_425) + 1;
        uint _435 = uint(int(uint(_433) >> uint(2)));
        int _437 = _433 & 3;
        float _439 = (*spvDescriptorSet0.cp_c5)._m0[int(_435)][_437];
        int _441 = _70;
        int _443 = 1;
        int _445 = _60(_441, _443, (*spvDescriptorSet0.support_buffer));
        int _447 = as_type<int>(_431);
        int _449 = 1;
        int _451 = _60(_447, _449, (*spvDescriptorSet0.support_buffer));
        int3 _2543 = int3(_445, _451, 1);
        float3 _453 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2543.xy), uint(_2543.z), 0).xyz;
        float _455 = _453.x;
        float _457 = _453.y;
        float _459 = _453.z;
        int _461 = _70;
        int _463 = 1;
        int _465 = _60(_461, _463, (*spvDescriptorSet0.support_buffer));
        int _467 = as_type<int>(_439);
        int _469 = 1;
        int _471 = _60(_467, _469, (*spvDescriptorSet0.support_buffer));
        int3 _2561 = int3(_465, _471, 1);
        float3 _473 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2561.xy), uint(_2561.z), 0).xyz;
        float _475 = _473.x;
        float _477 = _473.y;
        float _479 = _473.z;
        float _481 = _391 * 0.5;
        float _483 = _393 * 0.5;
        float _485 = _395 * 0.5;
        float _487 = _481 * 0.15915493667125701904296875;
        float _489 = _483 * 0.15915493667125701904296875;
        float _491 = _487 * 6.283185482025146484375;
        float _493 = sin(_491);
        float _495 = _485 * 0.15915493667125701904296875;
        float _497 = _489 * 6.283185482025146484375;
        float _499 = sin(_497);
        int _501 = _103 + 24;
        uint _503 = uint(int(uint(_501) >> uint(2)));
        uint _505 = uint(int(uint(int(_503)) >> uint(2)));
        int _507 = int(_503) & 3;
        float _509 = (*spvDescriptorSet0.cp_c5)._m0[int(_505)][_507];
        float _511 = _489 * 6.283185482025146484375;
        float _513 = cos(_511);
        float _515 = _487 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _493 * _499;
        float _521 = _495 * 6.283185482025146484375;
        float _523 = sin(_521);
        float _525 = _513 * _493;
        float _527 = _495 * 6.283185482025146484375;
        float _529 = cos(_527);
        float _531 = _517 * _513;
        float _533 = _517 * _499;
        float _535 = _523 * _519;
        float _537 = _523 * _525;
        float _539 = _529 * _519;
        float _541 = fma(_529, _533, _537);
        float _543 = fma(_529, _531, _535);
        float _545 = -_539;
        float _547 = fma(_523, _531, _545);
        float _549 = _523 * _533;
        float _551 = -_549;
        float _553 = fma(_529, _525, _551);
        float _555 = -_459;
        float _557 = _555 + _479;
        float _559 = -_457;
        float _561 = _559 + _477;
        float _563 = -_455;
        float _565 = _563 + _475;
        float _567 = fma(_557, _509, _459);
        float _569 = fma(_561, _509, _457);
        float _571 = fma(_565, _509, _455);
        float _573 = _567 * 0.5;
        float _575 = _569 * 0.5;
        float _577 = _571 * 0.5;
        float _579 = _573 * 0.15915493667125701904296875;
        float _581 = _575 * 0.15915493667125701904296875;
        float _583 = _577 * 0.15915493667125701904296875;
        float _585 = _579 * 6.283185482025146484375;
        float _587 = sin(_585);
        float _589 = _581 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _581 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _579 * 6.283185482025146484375;
        float _599 = cos(_597);
        float _601 = _591 * _587;
        float _603 = _583 * 6.283185482025146484375;
        float _605 = sin(_603);
        float _607 = _587 * _595;
        float _609 = _583 * 6.283185482025146484375;
        float _611 = cos(_609);
        float _613 = _599 * _595;
        float _615 = _599 * _591;
        float _617 = _605 * _601;
        float _619 = _611 * _607;
        float _621 = fma(_611, _613, _617);
        float _623 = _605 * _613;
        float _625 = -_619;
        float _627 = fma(_605, _615, _625);
        float _629 = _541 * _621;
        float _631 = _605 * _607;
        float _633 = -_623;
        float _635 = fma(_611, _601, _633);
        float _637 = fma(_547, _627, _629);
        float _639 = fma(_611, _615, _631);
        float _641 = fma(_553, _635, _637);
        float _643 = fma(_543, _639, _641);
        float _645 = precise::max(_643, -1.0);
        float _647 = precise::min(_645, 1.0);
        bool _649 = _647 >= 0.0;
        bool _651 = isnan(_647);
        bool _653 = _649 || _651;
        bool _655 = isnan(0.0);
        bool _657 = _653 || _655;
        bool _659 = !_657;
        float _661 = -_647;
        float _663 = _659 ? _661 : _647;
        bool _665 = _663 < 0.0;
        float _667 = float(_665);
        float _669 = abs(_663);
        float _671 = -_669;
        float _673 = _671 + 1.0;
        float _675 = abs(_663);
        float _677 = fma(_675, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _679 = as_type<int>(_673) + (-218103808);
        float _681 = abs(_663);
        float _683 = fma(_681, _677, -0.212114393711090087890625);
        bool _685 = uint(_679) >= 1920991232u;
        float _687 = abs(_663);
        float _689 = fma(_687, _683, 1.570728778839111328125);
        bool _691 = !_685;
        float _715;
        float _717;
        if (!_691)
        {
            int _693 = as_type<int>(_615);
            int _695 = as_type<int>(_663);
            int _697 = as_type<int>(_673);
            int _699 = 2288;
            int _701 = as_type<int>(_531);
            int _703;
            int _705;
            int _707;
            int _709;
            int _711;
            int _713;
            _58(_693, _695, _697, _699, _701, _703, _705, _707, _709, _711, _713);
            _715 = as_type<float>(_703);
            _717 = as_type<float>(_705);
            _719 = true;
        }
        else
        {
            float _721 = rsqrt(_673);
            float _723 = _673 * _721;
            float _725 = _721 * 0.5;
            float _727 = -_723;
            float _729 = 0.0 + _727;
            float _731 = fma(_725, _729, 0.5);
            float _733 = fma(_723, _731, _723);
            float _735 = -_733;
            float _737 = 0.0 + _735;
            float _739 = fma(_733, _737, _673);
            float _741 = fma(_725, _739, _733);
            _715 = _741;
            _717 = _739;
        }
        _719 = false;
        float _743 = _715;
        float _745 = _717;
        int _747 = _103 + 8;
        uint _749 = uint(int(uint(_747) >> uint(2)));
        uint _751 = uint(int(uint(int(_749)) >> uint(2)));
        int _753 = int(_749) & 3;
        float _755 = (*spvDescriptorSet0.cp_c5)._m0[int(_751)][_753];
        int _757 = int(_749) + 1;
        uint _759 = uint(int(uint(_757) >> uint(2)));
        int _761 = _757 & 3;
        float _763 = (*spvDescriptorSet0.cp_c5)._m0[int(_759)][_761];
        int _765 = _70;
        int _767 = 1;
        int _769 = _60(_765, _767, (*spvDescriptorSet0.support_buffer));
        int _771 = as_type<int>(_755);
        int _773 = 1;
        int _775 = _60(_771, _773, (*spvDescriptorSet0.support_buffer));
        int3 _2949 = int3(_769, _775, 0);
        float3 _777 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2949.xy), uint(_2949.z), 0).xyz;
        float _779 = _777.x;
        float _781 = _777.y;
        float _783 = _777.z;
        int _785 = _70;
        int _787 = 1;
        int _789 = _60(_785, _787, (*spvDescriptorSet0.support_buffer));
        int _791 = as_type<int>(_755);
        int _793 = 1;
        int _795 = _60(_791, _793, (*spvDescriptorSet0.support_buffer));
        int3 _2967 = int3(_789, _795, 2);
        float3 _797 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2967.xy), uint(_2967.z), 0).xyz;
        float _799 = _797.x;
        float _801 = _797.y;
        float _803 = _797.z;
        int _805 = _70;
        int _807 = 1;
        int _809 = _60(_805, _807, (*spvDescriptorSet0.support_buffer));
        int _811 = as_type<int>(_763);
        int _813 = 1;
        int _815 = _60(_811, _813, (*spvDescriptorSet0.support_buffer));
        int3 _2985 = int3(_809, _815, 0);
        float3 _817 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2985.xy), uint(_2985.z), 0).xyz;
        float _819 = _817.x;
        float _821 = _817.y;
        float _823 = _817.z;
        int _825 = _70;
        int _827 = 1;
        int _829 = _60(_825, _827, (*spvDescriptorSet0.support_buffer));
        int _831 = as_type<int>(_763);
        int _833 = 1;
        int _835 = _60(_831, _833, (*spvDescriptorSet0.support_buffer));
        int3 _3003 = int3(_829, _835, 2);
        float3 _837 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3003.xy), uint(_3003.z), 0).xyz;
        float _839 = _837.x;
        float _841 = _837.y;
        float _843 = _837.z;
        float _845 = _689 * _743;
        float _847 = _667 * 2.0;
        float _849 = -_847;
        float _851 = fma(_845, _849, _845);
        float _853 = fma(_667, 3.1415927410125732421875, _851);
        float _855 = _853 * 0.15915493667125701904296875;
        float _857 = _855 * 6.283185482025146484375;
        float _859 = sin(_857);
        float _861 = abs(_859);
        bool _863 = _861 >= 0.001000000047497451305389404296875;
        bool _865 = isnan(_861);
        bool _867 = _863 || _865;
        bool _869 = isnan(0.001000000047497451305389404296875);
        bool _871 = _867 || _869;
        float _873 = 0.0;
        float _875 = _745;
        float _877 = _845;
        if (!_871)
        {
            int _879 = _103 + 28;
            uint _881 = uint(int(uint(_879) >> uint(2)));
            uint _883 = uint(int(uint(int(_881)) >> uint(2)));
            int _885 = int(_881) & 3;
            float _887 = (*spvDescriptorSet0.cp_c5)._m0[int(_883)][_885];
            _873 = _887;
        }
        float _889 = _873;
        float _891 = _889;
        if (!_871)
        {
            float _893 = -_889;
            float _895 = _893 + 1.0;
            _875 = _895;
        }
        float _897 = _875;
        float _899 = _897;
        if (!_871)
        {
            _877 = _889;
        }
        float _901 = _877;
        bool _903 = !_871;
        float _905 = _901;
        if (!_903)
        {
            int _907 = _103 + 28;
            uint _909 = uint(int(uint(_907) >> uint(2)));
            uint _911 = uint(int(uint(int(_909)) >> uint(2)));
            int _913 = int(_909) & 3;
            float _915 = (*spvDescriptorSet0.cp_c5)._m0[int(_911)][_913];
            float _917 = 1.0 / _859;
            float _919 = _853 * _915;
            float _921 = _919 * 0.15915493667125701904296875;
            float _923 = -_919;
            float _925 = _853 + _923;
            float _927 = _925 * 0.15915493667125701904296875;
            float _929 = _921 * 6.283185482025146484375;
            float _931 = sin(_929);
            float _933 = _927 * 6.283185482025146484375;
            float _935 = sin(_933);
            float _937 = _931 * _917;
            float _939 = _935 * _917;
            _905 = _937;
            _899 = _939;
            _891 = _915;
        }
        float _941 = _905;
        float _943 = _899;
        float _945 = _891;
        bool _947 = !_657;
        float _949 = -_941;
        float _951 = _947 ? _949 : _941;
        float _953 = -_783;
        float _955 = _953 + _823;
        float _957 = -_803;
        float _959 = _957 + _843;
        float _961 = _627 * _951;
        float _963 = _639 * _951;
        float _965 = _635 * _951;
        float _967 = _621 * _951;
        float _969 = fma(_547, _943, _961);
        float _971 = fma(_543, _943, _963);
        int _973 = _103 + 24;
        uint _975 = uint(int(uint(_973) >> uint(2)));
        uint _977 = uint(int(uint(int(_975)) >> uint(2)));
        int _979 = int(_975) & 3;
        float _981 = (*spvDescriptorSet0.cp_c5)._m0[int(_977)][_979];
        float _983 = fma(_553, _943, _965);
        float _985 = fma(_541, _943, _967);
        float _987 = _971 * 2.0;
        float _989 = _969 * 2.0;
        float _991 = _985 * 2.0;
        float _993 = _983 * _987;
        int _995 = _103 + 20;
        uint _997 = uint(int(uint(_995) >> uint(2)));
        uint _999 = uint(int(uint(int(_997)) >> uint(2)));
        int _1001 = int(_997) & 3;
        float _1003 = (*spvDescriptorSet0.cp_c5)._m0[int(_999)][_1001];
        float _1005 = _985 * _987;
        float _1007 = _969 * _987;
        float _1009 = -_993;
        float _1011 = fma(_985, _989, _1009);
        float _1013 = fma(_985, _989, _993);
        float _1015 = fma(_983, _989, _1005);
        float _1017 = -_1005;
        float _1019 = fma(_983, _989, _1017);
        float _1021 = -_1007;
        float _1023 = fma(_983, _991, _1021);
        float _1025 = fma(_983, _991, _1007);
        float _1027 = _969 * _969;
        float _1029 = -_779;
        float _1031 = _1029 + _819;
        float _1033 = _985 * _985;
        float _1035 = -_781;
        float _1037 = _1035 + _821;
        float _1039 = fma(_1027, -2.0, 1.0);
        float _1041 = _983 * _983;
        float _1043 = fma(_1033, -2.0, 1.0);
        float _1045 = fma(_1031, _981, _779);
        float _1047 = fma(_1037, _981, _781);
        float _1049 = fma(_1033, -2.0, _1039);
        float _1051 = -_801;
        float _1053 = _1051 + _841;
        float _1055 = _1045 * _945;
        float _1057 = -_799;
        float _1059 = _1057 + _839;
        float _1061 = fma(_1041, -2.0, _1043);
        float _1063 = fma(_1041, -2.0, _1039);
        float _1065 = _1047 * _945;
        float _1067 = fma(_955, _981, _783);
        float _1069 = fma(_1059, _981, _799);
        float _1071 = fma(_1053, _981, _801);
        float _1073 = fma(_959, _981, _803);
        float _1075 = fma(_397, _1003, _1055);
        float _1077 = fma(_399, _1003, _1065);
        float _1079 = _1067 * _945;
        float _1081 = _1069 * _945;
        float _1083 = _1071 * _945;
        float _1085 = _1073 * _945;
        float _1087 = fma(_401, _1003, _1079);
        float _1089 = fma(_403, _1003, _1081);
        float _1091 = fma(_405, _1003, _1083);
        float _1093 = fma(_407, _1003, _1085);
        _411 = _1075;
        _1095 = _1061;
        _1097 = _1013;
        _1099 = _1019;
        _1101 = _1077;
        _1103 = _1011;
        _1105 = _1063;
        _1107 = _1025;
        _1109 = _1087;
        _1111 = _1015;
        _1113 = _1023;
        _1115 = _1049;
        _413 = as_type<int>(_1089);
        _415 = as_type<int>(_1091);
        _417 = as_type<int>(_1093);
        _1117 = _1083;
        _419 = _1081;
        _1119 = true;
    }
    else
    {
        float _1121 = _395 * 0.15915493667125701904296875;
        float _1123 = _391 * 0.15915493667125701904296875;
        float _1125 = _393 * 0.15915493667125701904296875;
        float _1127 = _1121 * 6.283185482025146484375;
        float _1129 = sin(_1127);
        float _1131 = _1121 * 6.283185482025146484375;
        float _1133 = cos(_1131);
        float _1135 = _1123 * 6.283185482025146484375;
        float _1137 = sin(_1135);
        float _1139 = _1125 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1123 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1137 * _1133;
        float _1149 = _1129 * _1137;
        float _1151 = _1125 * 6.283185482025146484375;
        float _1153 = cos(_1151);
        float _1155 = _1129 * _1141;
        float _1157 = _1133 * _1145;
        float _1159 = _1129 * _1145;
        float _1161 = -_1159;
        float _1163 = fma(_1141, _1147, _1161);
        float _1165 = _1133 * _1153;
        float _1167 = _1153 * _1145;
        float _1169 = -_1147;
        float _1171 = fma(_1145, _1155, _1169);
        float _1173 = _1137 * _1153;
        float _1175 = _1129 * _1153;
        float _1177 = fma(_1137, _1155, _1157);
        float _1179 = fma(_1141, _1157, _1149);
        float _1181 = -_1141;
        float _1183 = _1181 + (-0.0);
        _1095 = _1167;
        _1097 = _1173;
        _1099 = _1183;
        _1101 = _399;
        _1103 = _1171;
        _1105 = _1177;
        _1107 = _1175;
        _1109 = _401;
        _1111 = _1179;
        _1113 = _1163;
        _1115 = _1165;
        _1117 = _1153;
    }
    _1119 = false;
    float _1185 = _411;
    float _1187 = _1095;
    float _1189 = _1097;
    float _1191 = _1099;
    float _1193 = _1101;
    float _1195 = _1103;
    float _1197 = _1105;
    float _1199 = _1107;
    float _1201 = _1109;
    float _1203 = _1111;
    float _1205 = _1113;
    float _1207 = _1115;
    int _1209 = _413;
    int _1211 = _415;
    int _1213 = _417;
    float _1215 = _1117;
    float _1217 = _419;
    float _1219 = _1185 * _1187;
    float _1221 = _1185 * _1189;
    float _1223 = _1185 * _1191;
    float _1225 = _1193 * _1195;
    float _1227 = _1193 * _1197;
    float _1229 = _1193 * _1199;
    int _1231 = _70 * 48;
    float _1233 = _1201 * _1203;
    float _1235 = _1201 * _1205;
    float _1237 = _1201 * _1207;
    int _1239 = _70 * 112;
    uint _1241 = uint(int(uint(_1231) >> uint(2)));
    _39[int(_1241)] = as_type<uint>(_1219);
    int _1243 = _1231 + 4;
    uint _1245 = uint(int(uint(_1243) >> uint(2)));
    _39[int(_1245)] = as_type<uint>(_1225);
    int _1247 = _1231 + 8;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    _39[int(_1249)] = as_type<uint>(_1233);
    int _1251 = _1231 + 12;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    _39[int(_1253)] = uint(_1209);
    bool _1255 = _70 != 0;
    bool _1257 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1259 = _1231 + 16;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    _39[int(_1261)] = as_type<uint>(_1221);
    int _1263 = _1231 + 20;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    _39[int(_1265)] = as_type<uint>(_1227);
    int _1267 = _1231 + 24;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    _39[int(_1269)] = as_type<uint>(_1235);
    int _1271 = _1231 + 28;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    _39[int(_1273)] = uint(_1211);
    int _1275 = _1231 + 32;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    _39[int(_1277)] = as_type<uint>(_1223);
    int _1279 = _1231 + 36;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    _39[int(_1281)] = as_type<uint>(_1229);
    int _1283 = _1231 + 40;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    _39[int(_1285)] = as_type<uint>(_1237);
    int _1287 = _1231 + 44;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    _39[int(_1289)] = uint(_1213);
    float _1291 = _1217;
    float _1293 = _1185;
    float _1295 = _1201;
    float _1297 = _1215;
    float _1299 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _1301 = _1229;
    float _1303 = _1223;
    float _1305 = _1235;
    float _1307 = _1237;
    float _1309 = as_type<float>(_1211);
    float _1311 = as_type<float>(_1213);
    if (!_1255)
    {
        _1291 = _1219;
    }
    float _1313 = _1291;
    float _1315 = _1313;
    if (!_1255)
    {
        _1293 = _1225;
    }
    float _1317 = _1293;
    float _1319 = _1317;
    if (!_1255)
    {
        _421 = _1233;
    }
    float _1321 = _421;
    float _1323 = _1321;
    if (!_1255)
    {
        _1295 = as_type<float>(_1209);
    }
    float _1325 = _1295;
    float _1327 = _1325;
    if (!_1255)
    {
        _1297 = _1221;
    }
    float _1329 = _1297;
    float _1331 = _1329;
    if (!_1255)
    {
        _1299 = _1227;
    }
    float _1333 = _1299;
    float _1335 = _1333;
    if (!_1257)
    {
        int _1337 = _70 * 48;
        int _1339 = _1337 + 16;
        uint _1341 = uint(int(uint(_1337) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1341)] = as_type<uint>(_1219);
        int _1343 = _1337 + 4;
        uint _1345 = uint(int(uint(_1343) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1345)] = as_type<uint>(_1225);
        int _1347 = _1337 + 8;
        uint _1349 = uint(int(uint(_1347) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1349)] = as_type<uint>(_1233);
        int _1351 = _1337 + 12;
        uint _1353 = uint(int(uint(_1351) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1353)] = uint(_1209);
        int _1355 = _1337 + 32;
        uint _1357 = uint(int(uint(_1339) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1357)] = as_type<uint>(_1221);
        int _1359 = _1339 + 4;
        uint _1361 = uint(int(uint(_1359) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1361)] = as_type<uint>(_1227);
        int _1363 = _1339 + 8;
        uint _1365 = uint(int(uint(_1363) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1365)] = as_type<uint>(_1235);
        int _1367 = _1339 + 12;
        uint _1369 = uint(int(uint(_1367) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1369)] = uint(_1211);
        uint _1371 = uint(int(uint(_1355) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1371)] = as_type<uint>(_1223);
        int _1373 = _1355 + 4;
        uint _1375 = uint(int(uint(_1373) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1375)] = as_type<uint>(_1229);
        int _1377 = _1355 + 8;
        uint _1379 = uint(int(uint(_1377) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1379)] = as_type<uint>(_1237);
        int _1381 = _1355 + 12;
        uint _1383 = uint(int(uint(_1381) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1383)] = uint(_1213);
    }
    bool _1385 = !_1255;
    if (!_1385)
    {
        bool _1387 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1389 = !_1387;
        if (!_1389)
        {
            uint _1391 = uint(int(uint(_1239) >> uint(2)));
            uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
            int _1395 = int(_1391) & 3;
            float _1397 = (*spvDescriptorSet0.cp_c6)._m0[int(_1393)][_1395];
            int _1399 = as_type<int>(_1397) * 48;
            int _1401 = 0;
            bool _1403;
            float _1499;
            float _1503;
            float _1507;
            float _1511;
            float _1525;
            float _1527;
            float _1539;
            float _1549;
            float _1551;
            float _1553;
            float _1555;
            float _1557;
            do
            {
                int _1405 = _1401;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1407 = uint(int(uint(_1399) >> uint(2)));
                float _1409 = as_type<float>(_39[int(_1407)]);
                int _1411 = _1399 + 4;
                uint _1413 = uint(int(uint(_1411) >> uint(2)));
                float _1415 = as_type<float>(_39[int(_1413)]);
                int _1417 = _1399 + 8;
                uint _1419 = uint(int(uint(_1417) >> uint(2)));
                float _1421 = as_type<float>(_39[int(_1419)]);
                int _1423 = _1399 + 12;
                uint _1425 = uint(int(uint(_1423) >> uint(2)));
                float _1427 = as_type<float>(_39[int(_1425)]);
                int _1429 = _1405 + 1;
                int _1431 = _1399 + 16;
                uint _1433 = uint(int(uint(_1431) >> uint(2)));
                float _1435 = as_type<float>(_39[int(_1433)]);
                int _1437 = _1399 + 20;
                uint _1439 = uint(int(uint(_1437) >> uint(2)));
                float _1441 = as_type<float>(_39[int(_1439)]);
                int _1443 = _1399 + 24;
                uint _1445 = uint(int(uint(_1443) >> uint(2)));
                float _1447 = as_type<float>(_39[int(_1445)]);
                int _1449 = _1399 + 28;
                uint _1451 = uint(int(uint(_1449) >> uint(2)));
                float _1453 = as_type<float>(_39[int(_1451)]);
                bool _1455 = uint(_1429) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1457 = _1399 + 32;
                uint _1459 = uint(int(uint(_1457) >> uint(2)));
                float _1461 = as_type<float>(_39[int(_1459)]);
                int _1463 = _1399 + 36;
                uint _1465 = uint(int(uint(_1463) >> uint(2)));
                float _1467 = as_type<float>(_39[int(_1465)]);
                int _1469 = _1399 + 40;
                uint _1471 = uint(int(uint(_1469) >> uint(2)));
                float _1473 = as_type<float>(_39[int(_1471)]);
                int _1475 = _1399 + 44;
                uint _1477 = uint(int(uint(_1475) >> uint(2)));
                float _1479 = as_type<float>(_39[int(_1477)]);
                float _1481 = _1415 * as_type<float>(_1211);
                float _1483 = _1221 * _1415;
                float _1485 = _1227 * _1415;
                float _1487 = _1235 * _1415;
                float _1489 = fma(_1409, as_type<float>(_1209), _1481);
                float _1491 = fma(_1219, _1409, _1483);
                float _1493 = fma(_1225, _1409, _1485);
                float _1495 = fma(_1233, _1409, _1487);
                float _1497 = fma(_1421, as_type<float>(_1213), _1489);
                _1499 = fma(_1223, _1421, _1491);
                float _1501 = _1221 * _1441;
                _1503 = fma(_1237, _1421, _1495);
                float _1505 = _1441 * as_type<float>(_1211);
                _1507 = _1427 + _1497;
                float _1509 = _1227 * _1441;
                _1511 = fma(_1229, _1421, _1493);
                float _1513 = fma(_1435, as_type<float>(_1209), _1505);
                float _1515 = fma(_1219, _1435, _1501);
                float _1517 = fma(_1225, _1435, _1509);
                float _1519 = _1235 * _1441;
                float _1521 = fma(_1447, as_type<float>(_1213), _1513);
                float _1523 = _1467 * as_type<float>(_1211);
                _1525 = fma(_1223, _1447, _1515);
                _1527 = fma(_1229, _1447, _1517);
                float _1529 = _1221 * _1467;
                float _1531 = _1227 * _1467;
                float _1533 = _1235 * _1467;
                float _1535 = fma(_1461, as_type<float>(_1209), _1523);
                float _1537 = fma(_1233, _1435, _1519);
                _1539 = _1453 + _1521;
                float _1541 = fma(_1219, _1461, _1529);
                float _1543 = fma(_1225, _1461, _1531);
                float _1545 = fma(_1233, _1461, _1533);
                float _1547 = fma(_1473, as_type<float>(_1213), _1535);
                _1549 = fma(_1237, _1447, _1537);
                _1551 = fma(_1223, _1473, _1541);
                _1553 = fma(_1229, _1473, _1543);
                _1555 = fma(_1237, _1473, _1545);
                _1557 = _1479 + _1547;
                uint _1559 = uint(int(uint(_1231) >> uint(2)));
                _39[int(_1559)] = as_type<uint>(_1499);
                int _1561 = _1231 + 4;
                uint _1563 = uint(int(uint(_1561) >> uint(2)));
                _39[int(_1563)] = as_type<uint>(_1511);
                int _1565 = _1231 + 8;
                uint _1567 = uint(int(uint(_1565) >> uint(2)));
                _39[int(_1567)] = as_type<uint>(_1503);
                int _1569 = _1231 + 12;
                uint _1571 = uint(int(uint(_1569) >> uint(2)));
                _39[int(_1571)] = as_type<uint>(_1507);
                int _1573 = _1231 + 16;
                uint _1575 = uint(int(uint(_1573) >> uint(2)));
                _39[int(_1575)] = as_type<uint>(_1525);
                int _1577 = _1231 + 20;
                uint _1579 = uint(int(uint(_1577) >> uint(2)));
                _39[int(_1579)] = as_type<uint>(_1527);
                int _1581 = _1231 + 24;
                uint _1583 = uint(int(uint(_1581) >> uint(2)));
                _39[int(_1583)] = as_type<uint>(_1549);
                int _1585 = _1231 + 28;
                uint _1587 = uint(int(uint(_1585) >> uint(2)));
                _39[int(_1587)] = as_type<uint>(_1539);
                int _1589 = _1231 + 32;
                uint _1591 = uint(int(uint(_1589) >> uint(2)));
                _39[int(_1591)] = as_type<uint>(_1551);
                int _1593 = _1231 + 36;
                uint _1595 = uint(int(uint(_1593) >> uint(2)));
                _39[int(_1595)] = as_type<uint>(_1553);
                int _1597 = _1231 + 40;
                uint _1599 = uint(int(uint(_1597) >> uint(2)));
                _39[int(_1599)] = as_type<uint>(_1555);
                int _1601 = _1231 + 44;
                uint _1603 = uint(int(uint(_1601) >> uint(2)));
                _39[int(_1603)] = as_type<uint>(_1557);
                _1403 = !_1455;
                _1401 = _1429;
            } while (_1403);
            _1335 = _1527;
            _1301 = _1553;
            _1319 = _1511;
            _1331 = _1525;
            _1303 = _1551;
            _1315 = _1499;
            _1305 = _1549;
            _1323 = _1503;
            _1307 = _1555;
            _1309 = _1539;
            _1327 = _1507;
            _1311 = _1557;
            _1605 = true;
        }
        else
        {
            _1335 = 0.0;
            _1301 = 0.0;
            _1319 = 0.0;
            _1331 = 0.0;
            _1303 = 0.0;
            _1315 = 0.0;
            _1305 = 0.0;
            _1323 = 0.0;
            _1307 = 0.0;
            _1309 = 0.0;
            _1327 = 0.0;
            _1311 = 0.0;
        }
    }
    _1605 = false;
    float _1607 = _1335;
    float _1609 = _1301;
    float _1611 = _1319;
    float _1613 = _1331;
    float _1615 = _1303;
    float _1617 = _1315;
    float _1619 = _1305;
    float _1621 = _1323;
    float _1623 = _1307;
    float _1625 = _1309;
    float _1627 = _1327;
    float _1629 = _1311;
    int _1631 = _1239 + 80;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
    int _1637 = int(_1633) & 3;
    float _1639 = (*spvDescriptorSet0.cp_c6)._m0[int(_1635)][_1637];
    int _1641 = int(_1633) + 1;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    int _1645 = _1641 & 3;
    float _1647 = (*spvDescriptorSet0.cp_c6)._m0[int(_1643)][_1645];
    int _1649 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1651 = _1649 + _70;
    int _1653 = _1239 + 64;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    uint _1657 = uint(int(uint(int(_1655)) >> uint(2)));
    int _1659 = int(_1655) & 3;
    float _1661 = (*spvDescriptorSet0.cp_c6)._m0[int(_1657)][_1659];
    int _1663 = int(_1655) + 1;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    int _1667 = _1663 & 3;
    float _1669 = (*spvDescriptorSet0.cp_c6)._m0[int(_1665)][_1667];
    int _1671 = _1651 * 48;
    int _1673 = _1239 + 88;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
    int _1679 = int(_1675) & 3;
    float _1681 = (*spvDescriptorSet0.cp_c6)._m0[int(_1677)][_1679];
    int _1683 = int(_1675) + 1;
    uint _1685 = uint(int(uint(_1683) >> uint(2)));
    int _1687 = _1683 & 3;
    float _1689 = (*spvDescriptorSet0.cp_c6)._m0[int(_1685)][_1687];
    int _1691 = _1239 + 72;
    uint _1693 = uint(int(uint(_1691) >> uint(2)));
    uint _1695 = uint(int(uint(int(_1693)) >> uint(2)));
    int _1697 = int(_1693) & 3;
    float _1699 = (*spvDescriptorSet0.cp_c6)._m0[int(_1695)][_1697];
    int _1701 = int(_1693) + 1;
    uint _1703 = uint(int(uint(_1701) >> uint(2)));
    int _1705 = _1701 & 3;
    float _1707 = (*spvDescriptorSet0.cp_c6)._m0[int(_1703)][_1705];
    int _1709 = _1239 + 96;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    uint _1713 = uint(int(uint(int(_1711)) >> uint(2)));
    int _1715 = int(_1711) & 3;
    float _1717 = (*spvDescriptorSet0.cp_c6)._m0[int(_1713)][_1715];
    int _1719 = int(_1711) + 1;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    int _1723 = _1719 & 3;
    float _1725 = (*spvDescriptorSet0.cp_c6)._m0[int(_1721)][_1723];
    int _1727 = _1239 + 104;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    uint _1731 = uint(int(uint(int(_1729)) >> uint(2)));
    int _1733 = int(_1729) & 3;
    float _1735 = (*spvDescriptorSet0.cp_c6)._m0[int(_1731)][_1733];
    int _1737 = int(_1729) + 1;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    int _1741 = _1737 & 3;
    float _1743 = (*spvDescriptorSet0.cp_c6)._m0[int(_1739)][_1741];
    float _1745 = _1607 * _1639;
    float _1747 = _1609 * _1639;
    int _1749 = _1239 + 16;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    uint _1753 = uint(int(uint(int(_1751)) >> uint(2)));
    int _1755 = int(_1751) & 3;
    float _1757 = (*spvDescriptorSet0.cp_c6)._m0[int(_1753)][_1755];
    int _1759 = int(_1751) + 1;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    int _1763 = _1759 & 3;
    float _1765 = (*spvDescriptorSet0.cp_c6)._m0[int(_1761)][_1763];
    float _1767 = _1611 * _1639;
    float _1769 = fma(_1613, _1661, _1745);
    float _1771 = _1611 * _1647;
    int _1773 = _1239 + 32;
    uint _1775 = uint(int(uint(_1773) >> uint(2)));
    uint _1777 = uint(int(uint(int(_1775)) >> uint(2)));
    int _1779 = int(_1775) & 3;
    float _1781 = (*spvDescriptorSet0.cp_c6)._m0[int(_1777)][_1779];
    int _1783 = int(_1775) + 1;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    int _1787 = _1783 & 3;
    float _1789 = (*spvDescriptorSet0.cp_c6)._m0[int(_1785)][_1787];
    float _1791 = fma(_1615, _1661, _1747);
    float _1793 = _1607 * _1647;
    float _1795 = fma(_1617, _1669, _1771);
    float _1797 = _1609 * _1647;
    float _1799 = fma(_1617, _1661, _1767);
    float _1801 = _1611 * _1681;
    float _1803 = _1611 * _1689;
    int _1805 = _1239 + 48;
    uint _1807 = uint(int(uint(_1805) >> uint(2)));
    uint _1809 = uint(int(uint(int(_1807)) >> uint(2)));
    int _1811 = int(_1807) & 3;
    float _1813 = (*spvDescriptorSet0.cp_c6)._m0[int(_1809)][_1811];
    int _1815 = int(_1807) + 1;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    int _1819 = _1815 & 3;
    float _1821 = (*spvDescriptorSet0.cp_c6)._m0[int(_1817)][_1819];
    float _1823 = _1607 * _1681;
    float _1825 = _1607 * _1689;
    float _1827 = _1609 * _1681;
    float _1829 = _1609 * _1689;
    float _1831 = fma(_1613, _1669, _1793);
    float _1833 = fma(_1615, _1669, _1797);
    float _1835 = fma(_1617, _1699, _1801);
    int _1837 = _1239 + 24;
    uint _1839 = uint(int(uint(_1837) >> uint(2)));
    uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
    int _1843 = int(_1839) & 3;
    float _1845 = (*spvDescriptorSet0.cp_c6)._m0[int(_1841)][_1843];
    int _1847 = int(_1839) + 1;
    uint _1849 = uint(int(uint(_1847) >> uint(2)));
    int _1851 = _1847 & 3;
    float _1853 = (*spvDescriptorSet0.cp_c6)._m0[int(_1849)][_1851];
    float _1855 = fma(_1617, _1707, _1803);
    float _1857 = fma(_1613, _1699, _1823);
    float _1859 = fma(_1613, _1707, _1825);
    float _1861 = fma(_1615, _1699, _1827);
    float _1863 = fma(_1615, _1707, _1829);
    float _1865 = fma(_1619, _1717, _1769);
    float _1867 = fma(_1619, _1725, _1831);
    int _1869 = _1239 + 40;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.cp_c6)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.cp_c6)._m0[int(_1881)][_1883];
    float _1887 = fma(_1621, _1725, _1795);
    float _1889 = fma(_1623, _1717, _1791);
    float _1891 = fma(_1623, _1725, _1833);
    float _1893 = fma(_1621, _1717, _1799);
    float _1895 = fma(_1619, _1735, _1857);
    float _1897 = fma(_1619, _1743, _1859);
    int _1899 = _1239 + 56;
    uint _1901 = uint(int(uint(_1899) >> uint(2)));
    uint _1903 = uint(int(uint(int(_1901)) >> uint(2)));
    int _1905 = int(_1901) & 3;
    float _1907 = (*spvDescriptorSet0.cp_c6)._m0[int(_1903)][_1905];
    int _1909 = int(_1901) + 1;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    int _1913 = _1909 & 3;
    float _1915 = (*spvDescriptorSet0.cp_c6)._m0[int(_1911)][_1913];
    float _1917 = fma(_1621, _1743, _1855);
    float _1919 = fma(_1623, _1743, _1863);
    float _1921 = _1897 + _1625;
    float _1923 = fma(_1623, _1735, _1861);
    float _1925 = _1917 + _1627;
    float _1927 = fma(_1621, _1735, _1835);
    float _1929 = _1919 + _1629;
    float _1931 = _1921 * _1765;
    float _1933 = _1867 * _1765;
    float _1935 = _1895 * _1765;
    float _1937 = _1865 * _1765;
    float _1939 = fma(_1925, _1757, _1931);
    float _1941 = fma(_1887, _1757, _1933);
    float _1943 = fma(_1927, _1757, _1935);
    float _1945 = fma(_1893, _1757, _1937);
    float _1947 = _1921 * _1789;
    float _1949 = _1865 * _1789;
    float _1951 = _1867 * _1789;
    float _1953 = _1895 * _1789;
    float _1955 = fma(_1925, _1781, _1947);
    float _1957 = fma(_1893, _1781, _1949);
    float _1959 = fma(_1887, _1781, _1951);
    float _1961 = fma(_1927, _1781, _1953);
    float _1963 = _1921 * _1821;
    float _1965 = _1867 * _1821;
    float _1967 = _1865 * _1821;
    float _1969 = _1895 * _1821;
    float _1971 = fma(_1925, _1813, _1963);
    float _1973 = fma(_1887, _1813, _1965);
    float _1975 = fma(_1893, _1813, _1967);
    float _1977 = fma(_1927, _1813, _1969);
    float _1979 = fma(_1929, _1845, _1939);
    float _1981 = fma(_1891, _1845, _1941);
    float _1983 = fma(_1923, _1845, _1943);
    float _1985 = fma(_1889, _1845, _1945);
    float _1987 = _1979 + _1853;
    int _1989 = _1671 + 16;
    int _1991 = _1671 + 32;
    float _1993 = fma(_1929, _1877, _1955);
    float _1995 = fma(_1889, _1877, _1957);
    float _1997 = fma(_1891, _1877, _1959);
    float _1999 = fma(_1923, _1877, _1961);
    float _2001 = _1993 + _1885;
    int _2003 = _1671 + 48;
    uint _2005 = uint(int(uint(_1989) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2005)] = as_type<uint>(_1985);
    int _2007 = _1989 + 4;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2009)] = as_type<uint>(_1981);
    int _2011 = _1989 + 8;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2013)] = as_type<uint>(_1983);
    int _2015 = _1989 + 12;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2017)] = as_type<uint>(_1987);
    float _2019 = fma(_1929, _1907, _1971);
    float _2021 = fma(_1889, _1907, _1975);
    float _2023 = fma(_1891, _1907, _1973);
    float _2025 = fma(_1923, _1907, _1977);
    float _2027 = _2019 + _1915;
    uint _2029 = uint(int(uint(_1991) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2029)] = as_type<uint>(_1995);
    int _2031 = _1991 + 4;
    uint _2033 = uint(int(uint(_2031) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2033)] = as_type<uint>(_1997);
    int _2035 = _1991 + 8;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2037)] = as_type<uint>(_1999);
    int _2039 = _1991 + 12;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2041)] = as_type<uint>(_2001);
    uint _2043 = uint(int(uint(_2003) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2043)] = as_type<uint>(_2021);
    int _2045 = _2003 + 4;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2047)] = as_type<uint>(_2023);
    int _2049 = _2003 + 8;
    uint _2051 = uint(int(uint(_2049) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2051)] = as_type<uint>(_2025);
    int _2053 = _2003 + 12;
    uint _2055 = uint(int(uint(_2053) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2055)] = as_type<uint>(_2027);
}

