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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _5845, thread const int& _5846, constant _10& support_buffer)
{
    int _5849 = 1 + _5846;
    float _5851 = support_buffer._m5[_5849].x;
    bool _5853 = _5851 == 1.0;
    if (_5853)
    {
        return _5845;
    }
    float _5855 = float(_5845);
    float _5857 = _5855 * _5851;
    int _5859 = int(_5857);
    return _5859;
}

static inline __attribute__((always_inline))
void _56(thread const int& _5533, thread const int& _5534, thread const int& _5535, thread const int& _5536, thread int& _5537, thread int& _5538, thread int& _5539, thread int& _5540, thread int& _5541, thread int& _5542)
{
    float _5545 = as_type<float>(_5535) + 0.0;
    bool _5547 = _5545 != 0.0;
    bool _5549 = isnan(_5545);
    bool _5551 = _5547 || _5549;
    bool _5553 = isnan(0.0);
    bool _5555 = _5551 || _5553;
    int _5557 = as_type<int>(_5545);
    int _5559 = _5534;
    int _5561 = _5535;
    int _5563 = _5555 ? (-1) : 0;
    if (!_5555)
    {
        float _5565 = as_type<float>(_5535) * 1.0;
        _5557 = as_type<int>(_5565);
    }
    int _5567 = _5557;
    bool _5569 = !_5555;
    int _5571 = _5567;
    if (!_5569)
    {
        float _5573 = as_type<float>(_5535) + 0.0;
        bool _5575 = _5573 >= 0.0;
        bool _5577 = isnan(_5573);
        bool _5579 = _5575 || _5577;
        bool _5581 = isnan(0.0);
        bool _5583 = _5579 || _5581;
        int _5585 = as_type<int>(_5573);
        _5563 = _5583 ? (-1) : 0;
        if (!_5583)
        {
            _5585 = 2147483647;
        }
        int _5587 = _5585;
        bool _5589 = !_5583;
        _5571 = _5587;
        if (!_5589)
        {
            float _5591 = as_type<float>(_5535) + 0.0;
            bool _5593 = _5591 > as_type<float>(0x7f800000u /* inf */);
            bool _5595 = isnan(_5591);
            bool _5597 = _5593 || _5595;
            bool _5599 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5601 = _5597 || _5599;
            int _5603 = as_type<int>(_5591);
            _5563 = _5601 ? (-1) : 0;
            if (_5601)
            {
                float _5605 = as_type<float>(_5535) + 1.0;
                _5603 = as_type<int>(_5605);
            }
            int _5607 = _5603;
            _5571 = _5607;
            if (!_5601)
            {
                float _5609 = 0.0 + as_type<float>(_5535);
                bool _5611 = _5609 != as_type<float>(0x7f800000u /* inf */);
                bool _5613 = isnan(_5609);
                bool _5615 = _5611 || _5613;
                bool _5617 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5619 = _5615 || _5617;
                int _5621 = as_type<int>(_5609);
                _5563 = _5619 ? (-1) : 0;
                if (!_5619)
                {
                    _5621 = _5535;
                }
                int _5623 = _5621;
                bool _5625 = !_5619;
                _5571 = _5623;
                if (!_5625)
                {
                    float _5627 = as_type<float>(_5535) * 18446744073709551616.0;
                    float _5629 = rsqrt(_5627);
                    float _5631 = _5627 * _5629;
                    float _5633 = _5629 * 0.5;
                    float _5635 = -_5631;
                    float _5637 = 0.0 + _5635;
                    float _5639 = fma(_5633, _5637, 0.5);
                    float _5641 = fma(_5631, _5639, _5631);
                    float _5643 = -_5641;
                    float _5645 = 0.0 + _5643;
                    float _5647 = fma(_5641, _5645, _5627);
                    float _5649 = fma(_5633, _5647, _5641);
                    float _5651 = _5649 * 2.3283064365386962890625e-10;
                    _5571 = as_type<int>(_5651);
                    _5559 = as_type<int>(_5641);
                    _5561 = as_type<int>(_5637);
                }
            }
        }
    }
    int _5653 = _5571;
    int _5655 = _5559;
    int _5657 = _5561;
    int _5659 = _5563;
    _5537 = _5653;
    _5538 = _5536;
    _5539 = 0;
    _5540 = _5655;
    _5541 = _5657;
    _5542 = _5659;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1439 = false;
    bool _1239 = false;
    bool _839 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    if (_72)
    {
        return;
    }
    bool _74 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _76 = _68 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _78 = _76 << 4;
    bool _80 = !_74;
    if (!_80)
    {
        int _82 = 0;
        float _84 = 0.0;
        float _86 = 0.0;
        int _88 = 0;
        int _90 = 0;
        int _92 = 0;
        int _94 = 0;
        int _96 = 0;
        int _98 = 0;
        float _100 = 0.0;
        float _102 = 0.0;
        float _104 = 0.0;
        float _106 = 0.0;
        int _108 = 0;
        int _110 = 0;
        int _112 = 0;
        int _114 = 0;
        int _116 = 0;
        int _118 = 0;
        int _823;
        int _825;
        int _827;
        int _829;
        int _831;
        int _833;
        float _835;
        float _837;
        float _1215;
        float _1217;
        float _1219;
        float _1221;
        float _1223;
        float _1225;
        float _1227;
        float _1229;
        float _1231;
        int _1233;
        int _1235;
        int _1237;
        do
        {
            int _120 = _82;
            float _122 = _84;
            float _124 = _86;
            int _126 = _88;
            int _128 = _90;
            int _130 = _92;
            int _132 = _94;
            int _134 = _96;
            int _136 = _98;
            float _138 = _100;
            float _140 = _102;
            float _142 = _104;
            float _144 = _106;
            int _146 = _108;
            int _148 = _110;
            int _150 = _112;
            int _152 = _114;
            int _154 = _116;
            int _156 = _118;
            uint _159 = uint(int(uint(_78) >> uint(2)));
            uint _161 = uint(int(uint(int(_159)) >> uint(2)));
            int _163 = int(_159) & 3;
            float _165 = (*spvDescriptorSet0.cp_c4)._m0[int(_161)][_163];
            int _167 = _120 & 31;
            bool _169 = _167 == 0;
            bool _171 = uint(_167) < 32u;
            int _173 = 32 - _167;
            int _175 = _167 - 32;
            int _177 = 1 << _167;
            uint _179 = uint(int(uint(0) >> uint(_173)));
            int _181 = _177 | int(_179);
            int _183 = _169 ? 1 : _181;
            bool _185 = uint(_175) < 32u;
            int _187 = 0 << _175;
            int _189 = _185 ? _187 : 0;
            float _191 = _171 ? as_type<float>(_183) : as_type<float>(_189);
            int _193 = as_type<int>(_165) * 48;
            int _195 = _193 + 32;
            uint _197 = uint(int(uint(_195) >> uint(2)));
            uint _199 = uint(int(uint(int(_197)) >> uint(2)));
            int _201 = int(_197) & 3;
            float _203 = (*spvDescriptorSet0.cp_c5)._m0[int(_199)][_201];
            int _205 = _193 + 36;
            uint _207 = uint(int(uint(_205) >> uint(2)));
            uint _209 = uint(int(uint(int(_207)) >> uint(2)));
            int _211 = int(_207) & 3;
            float _213 = (*spvDescriptorSet0.cp_c5)._m0[int(_209)][_211];
            int _215 = as_type<int>(_191) & as_type<int>(_203);
            bool _217 = _215 != 0;
            int _219 = as_type<int>(_191) & as_type<int>(_213);
            bool _221 = _219 != 0;
            float _223 = _138;
            float _225 = _142;
            float _227 = _140;
            float _229 = _144;
            float _231 = _122;
            float _233 = _124;
            float _235 = _213;
            float _237 = _191;
            float _239 = _203;
            int _241 = _126;
            int _243 = _146;
            int _245 = _128;
            int _247 = _130;
            int _249 = _132;
            int _251 = _134;
            int _253 = _136;
            int _255 = _148;
            int _257 = _150;
            int _259 = _152;
            int _261 = _154;
            int _263 = _156;
            if (!_217)
            {
                _223 = 0.0;
                _225 = 0.0;
            }
            float _265 = _223;
            float _267 = _225;
            float _269 = _265;
            float _271 = _267;
            if (!_217)
            {
                _227 = 0.0;
                _229 = 0.0;
            }
            float _273 = _227;
            float _275 = _229;
            float _277 = _273;
            float _279 = _275;
            if (!_217)
            {
                _231 = 0.0;
                _233 = 0.0;
            }
            float _281 = _231;
            float _283 = _233;
            float _285 = _283;
            float _287 = _281;
            if (!_217)
            {
                _235 = 0.0;
                _237 = 0.0;
            }
            float _289 = _235;
            float _291 = _237;
            float _293 = _289;
            float _295 = _291;
            if (!_217)
            {
                _239 = 0.0;
            }
            float _297 = _239;
            bool _299 = !_217;
            float _301 = _297;
            if (!_299)
            {
                uint _303 = uint(int(uint(_193) >> uint(2)));
                uint _305 = uint(int(uint(int(_303)) >> uint(2)));
                int _307 = int(_303) & 3;
                float _309 = (*spvDescriptorSet0.cp_c5)._m0[int(_305)][_307];
                int _311 = int(_303) + 1;
                uint _313 = uint(int(uint(_311) >> uint(2)));
                int _315 = _311 & 3;
                float _317 = (*spvDescriptorSet0.cp_c5)._m0[int(_313)][_315];
                int _319 = _120;
                int _321 = 0;
                int _323 = _58(_319, _321, (*spvDescriptorSet0.support_buffer));
                int _325 = as_type<int>(_309);
                int _327 = 0;
                int _329 = _58(_325, _327, (*spvDescriptorSet0.support_buffer));
                int3 _2540 = int3(_323, _329, 1);
                float3 _333 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2540.xy), uint(_2540.z), 0).xyz;
                float _335 = _333.x;
                float _337 = _333.y;
                float _339 = _333.z;
                int _341 = _120;
                int _343 = 0;
                int _345 = _58(_341, _343, (*spvDescriptorSet0.support_buffer));
                int _347 = as_type<int>(_317);
                int _349 = 0;
                int _351 = _58(_347, _349, (*spvDescriptorSet0.support_buffer));
                int3 _2558 = int3(_345, _351, 1);
                float3 _353 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2558.xy), uint(_2558.z), 0).xyz;
                float _355 = _353.x;
                float _357 = _353.y;
                float _359 = _353.z;
                int _361 = _120;
                int _363 = 0;
                int _365 = _58(_361, _363, (*spvDescriptorSet0.support_buffer));
                int _367 = as_type<int>(_309);
                int _369 = 0;
                int _371 = _58(_367, _369, (*spvDescriptorSet0.support_buffer));
                int3 _2576 = int3(_365, _371, 0);
                float3 _373 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2576.xy), uint(_2576.z), 0).xyz;
                float _375 = _373.x;
                float _377 = _373.y;
                float _379 = _373.z;
                int _381 = _120;
                int _383 = 0;
                int _385 = _58(_381, _383, (*spvDescriptorSet0.support_buffer));
                int _387 = as_type<int>(_317);
                int _389 = 0;
                int _391 = _58(_387, _389, (*spvDescriptorSet0.support_buffer));
                int3 _2594 = int3(_385, _391, 0);
                float3 _393 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2594.xy), uint(_2594.z), 0).xyz;
                float _395 = _393.x;
                float _397 = _393.y;
                float _399 = _393.z;
                int _401 = _120;
                int _403 = 0;
                int _405 = _58(_401, _403, (*spvDescriptorSet0.support_buffer));
                int _407 = as_type<int>(_309);
                int _409 = 0;
                int _411 = _58(_407, _409, (*spvDescriptorSet0.support_buffer));
                int3 _2612 = int3(_405, _411, 2);
                float3 _413 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2612.xy), uint(_2612.z), 0).xyz;
                float _415 = _413.x;
                float _417 = _413.y;
                float _419 = _413.z;
                int _421 = _120;
                int _423 = 0;
                int _425 = _58(_421, _423, (*spvDescriptorSet0.support_buffer));
                int _427 = as_type<int>(_317);
                int _429 = 0;
                int _431 = _58(_427, _429, (*spvDescriptorSet0.support_buffer));
                int3 _2630 = int3(_425, _431, 2);
                float3 _433 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2630.xy), uint(_2630.z), 0).xyz;
                float _435 = _433.x;
                float _437 = _433.y;
                float _439 = _433.z;
                int _441 = _193 + 16;
                uint _443 = uint(int(uint(_441) >> uint(2)));
                uint _445 = uint(int(uint(int(_443)) >> uint(2)));
                int _447 = int(_443) & 3;
                float _449 = (*spvDescriptorSet0.cp_c5)._m0[int(_445)][_447];
                float _451 = -_335;
                float _453 = _451 + _355;
                float _455 = -_339;
                float _457 = _455 + _359;
                float _459 = fma(_453, _449, _335);
                float _461 = -_337;
                float _463 = _461 + _357;
                float _465 = -_375;
                float _467 = _465 + _395;
                float _469 = -_377;
                float _471 = _469 + _397;
                float _473 = -_379;
                float _475 = _473 + _399;
                float _477 = -_415;
                float _479 = _477 + _435;
                float _481 = -_419;
                float _483 = _481 + _439;
                float _485 = fma(_471, _449, _377);
                float _487 = -_417;
                float _489 = _487 + _437;
                float _491 = fma(_475, _449, _379);
                float _493 = fma(_463, _449, _337);
                float _495 = fma(_457, _449, _339);
                float _497 = fma(_467, _449, _375);
                float _499 = fma(_479, _449, _415);
                float _501 = fma(_489, _449, _417);
                float _503 = fma(_483, _449, _419);
                _241 = 0;
                _301 = _495;
                _293 = _493;
                _295 = _459;
                _269 = _497;
                _277 = _485;
                _271 = _491;
                _285 = _499;
                _287 = _501;
                _279 = _503;
                _243 = _120;
            }
            int _505 = _241;
            float _507 = _301;
            float _509 = _293;
            float _511 = _295;
            float _513 = _269;
            float _515 = _277;
            float _517 = _271;
            float _519 = _285;
            float _521 = _287;
            float _523 = _279;
            int _525 = _243;
            bool _527 = !_221;
            _106 = _523;
            int _529 = _505;
            float _531 = _513;
            float _533 = _515;
            float _535 = _517;
            float _537 = _513;
            float _539 = _515;
            float _541 = _517;
            int _543 = _525;
            if (!_527)
            {
                int _545 = _193 + 8;
                uint _547 = uint(int(uint(_545) >> uint(2)));
                uint _549 = uint(int(uint(int(_547)) >> uint(2)));
                int _551 = int(_547) & 3;
                float _553 = (*spvDescriptorSet0.cp_c5)._m0[int(_549)][_551];
                int _555 = int(_547) + 1;
                uint _557 = uint(int(uint(_555) >> uint(2)));
                int _559 = _555 & 3;
                float _561 = (*spvDescriptorSet0.cp_c5)._m0[int(_557)][_559];
                int _563 = _120;
                int _565 = 1;
                int _567 = _58(_563, _565, (*spvDescriptorSet0.support_buffer));
                int _569 = as_type<int>(_553);
                int _571 = 1;
                int _573 = _58(_569, _571, (*spvDescriptorSet0.support_buffer));
                int3 _2815 = int3(_567, _573, 1);
                float3 _575 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2815.xy), uint(_2815.z), 0).xyz;
                float _577 = _575.x;
                float _579 = _575.y;
                float _581 = _575.z;
                int _583 = _120;
                int _585 = 1;
                int _587 = _58(_583, _585, (*spvDescriptorSet0.support_buffer));
                int _589 = as_type<int>(_561);
                int _591 = 1;
                int _593 = _58(_589, _591, (*spvDescriptorSet0.support_buffer));
                int3 _2833 = int3(_587, _593, 1);
                float3 _595 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2833.xy), uint(_2833.z), 0).xyz;
                float _597 = _595.x;
                float _599 = _595.y;
                float _601 = _595.z;
                int _603 = _193 + 24;
                uint _605 = uint(int(uint(_603) >> uint(2)));
                uint _607 = uint(int(uint(int(_605)) >> uint(2)));
                int _609 = int(_605) & 3;
                float _611 = (*spvDescriptorSet0.cp_c5)._m0[int(_607)][_609];
                float _613 = _507 * 0.5;
                float _615 = _509 * 0.5;
                float _617 = _511 * 0.5;
                float _619 = _613 * 0.15915493667125701904296875;
                float _621 = _615 * 0.15915493667125701904296875;
                float _623 = _617 * 0.15915493667125701904296875;
                float _625 = _619 * 6.283185482025146484375;
                float _627 = sin(_625);
                float _629 = _621 * 6.283185482025146484375;
                float _631 = sin(_629);
                float _633 = _621 * 6.283185482025146484375;
                float _635 = cos(_633);
                float _637 = _619 * 6.283185482025146484375;
                float _639 = cos(_637);
                float _641 = _627 * _631;
                float _643 = _623 * 6.283185482025146484375;
                float _645 = sin(_643);
                float _647 = _635 * _627;
                float _649 = _623 * 6.283185482025146484375;
                float _651 = cos(_649);
                float _653 = _639 * _635;
                float _655 = _639 * _631;
                float _657 = _645 * _641;
                float _659 = _645 * _647;
                float _661 = _651 * _641;
                float _663 = fma(_651, _655, _659);
                float _665 = fma(_651, _653, _657);
                float _667 = -_661;
                float _669 = fma(_645, _653, _667);
                float _671 = _645 * _655;
                float _673 = -_671;
                float _675 = fma(_651, _647, _673);
                float _677 = -_581;
                float _679 = _677 + _601;
                float _681 = -_579;
                float _683 = _681 + _599;
                float _685 = -_577;
                float _687 = _685 + _597;
                float _689 = fma(_679, _611, _581);
                float _691 = fma(_683, _611, _579);
                float _693 = fma(_687, _611, _577);
                float _695 = _689 * 0.5;
                float _697 = _691 * 0.5;
                float _699 = _693 * 0.5;
                float _701 = _695 * 0.15915493667125701904296875;
                float _703 = _697 * 0.15915493667125701904296875;
                float _705 = _699 * 0.15915493667125701904296875;
                float _707 = _701 * 6.283185482025146484375;
                float _709 = sin(_707);
                float _711 = _703 * 6.283185482025146484375;
                float _713 = cos(_711);
                float _715 = _703 * 6.283185482025146484375;
                float _717 = sin(_715);
                float _719 = _701 * 6.283185482025146484375;
                float _721 = cos(_719);
                float _723 = _713 * _709;
                float _725 = _705 * 6.283185482025146484375;
                float _727 = sin(_725);
                float _729 = _709 * _717;
                float _731 = _705 * 6.283185482025146484375;
                float _733 = cos(_731);
                float _735 = _721 * _717;
                float _737 = _721 * _713;
                float _739 = _727 * _723;
                float _741 = _733 * _729;
                float _743 = fma(_733, _735, _739);
                float _745 = _727 * _735;
                float _747 = -_741;
                float _749 = fma(_727, _737, _747);
                float _751 = _663 * _743;
                float _753 = _727 * _729;
                float _755 = -_745;
                float _757 = fma(_733, _723, _755);
                float _759 = fma(_669, _749, _751);
                float _761 = fma(_733, _737, _753);
                float _763 = fma(_675, _757, _759);
                float _765 = fma(_665, _761, _763);
                float _767 = precise::max(_765, -1.0);
                float _769 = precise::min(_767, 1.0);
                bool _771 = _769 >= 0.0;
                bool _773 = isnan(_769);
                bool _775 = _771 || _773;
                bool _777 = isnan(0.0);
                bool _779 = _775 || _777;
                bool _781 = !_779;
                float _783 = -_769;
                float _785 = _781 ? _783 : _769;
                bool _787 = _785 < 0.0;
                float _789 = float(_787);
                float _791 = abs(_785);
                float _793 = -_791;
                float _795 = _793 + 1.0;
                float _797 = abs(_785);
                float _799 = fma(_797, -0.0187292993068695068359375, 0.074261002242565155029296875);
                int _801 = as_type<int>(_795) + (-218103808);
                float _803 = abs(_785);
                float _805 = fma(_803, _799, -0.212114393711090087890625);
                bool _807 = uint(_801) >= 1920991232u;
                float _809 = abs(_785);
                float _811 = fma(_809, _805, 1.570728778839111328125);
                bool _813 = !_807;
                _261 = as_type<int>(_757);
                _263 = as_type<int>(_665);
                if (!_813)
                {
                    int _815 = _801;
                    int _817 = as_type<int>(_785);
                    int _819 = as_type<int>(_795);
                    int _821 = 2320;
                    _56(_815, _817, _819, _821, _823, _825, _827, _829, _831, _833);
                    _835 = as_type<float>(_823);
                    _837 = as_type<float>(_825);
                    _839 = true;
                }
                else
                {
                    float _841 = rsqrt(_795);
                    float _843 = _795 * _841;
                    float _845 = _841 * 0.5;
                    float _847 = -_843;
                    float _849 = 0.0 + _847;
                    float _851 = fma(_845, _849, 0.5);
                    float _853 = fma(_843, _851, _843);
                    float _855 = -_853;
                    float _857 = 0.0 + _855;
                    float _859 = fma(_853, _857, _795);
                    float _861 = fma(_845, _859, _853);
                    _835 = _861;
                    _837 = _859;
                }
                _839 = false;
                float _863 = _835;
                float _865 = _837;
                int _867 = _193 + 8;
                uint _869 = uint(int(uint(_867) >> uint(2)));
                uint _871 = uint(int(uint(int(_869)) >> uint(2)));
                int _873 = int(_869) & 3;
                float _875 = (*spvDescriptorSet0.cp_c5)._m0[int(_871)][_873];
                int _877 = int(_869) + 1;
                uint _879 = uint(int(uint(_877) >> uint(2)));
                int _881 = _877 & 3;
                float _883 = (*spvDescriptorSet0.cp_c5)._m0[int(_879)][_881];
                int _885 = _120;
                int _887 = 1;
                int _889 = _58(_885, _887, (*spvDescriptorSet0.support_buffer));
                int _891 = as_type<int>(_875);
                int _893 = 1;
                int _895 = _58(_891, _893, (*spvDescriptorSet0.support_buffer));
                int3 _3222 = int3(_889, _895, 0);
                float3 _897 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3222.xy), uint(_3222.z), 0).xyz;
                float _899 = _897.x;
                float _901 = _897.y;
                float _903 = _897.z;
                int _905 = _120;
                int _907 = 1;
                int _909 = _58(_905, _907, (*spvDescriptorSet0.support_buffer));
                int _911 = as_type<int>(_875);
                int _913 = 1;
                int _915 = _58(_911, _913, (*spvDescriptorSet0.support_buffer));
                int3 _3240 = int3(_909, _915, 2);
                float3 _917 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3240.xy), uint(_3240.z), 0).xyz;
                float _919 = _917.x;
                float _921 = _917.y;
                float _923 = _917.z;
                int _925 = _120;
                int _927 = 1;
                int _929 = _58(_925, _927, (*spvDescriptorSet0.support_buffer));
                int _931 = as_type<int>(_883);
                int _933 = 1;
                int _935 = _58(_931, _933, (*spvDescriptorSet0.support_buffer));
                int3 _3258 = int3(_929, _935, 0);
                float3 _937 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3258.xy), uint(_3258.z), 0).xyz;
                float _939 = _937.x;
                float _941 = _937.y;
                float _943 = _937.z;
                int _945 = _120;
                int _947 = 1;
                int _949 = _58(_945, _947, (*spvDescriptorSet0.support_buffer));
                int _951 = as_type<int>(_883);
                int _953 = 1;
                int _955 = _58(_951, _953, (*spvDescriptorSet0.support_buffer));
                int3 _3276 = int3(_949, _955, 2);
                float3 _957 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3276.xy), uint(_3276.z), 0).xyz;
                float _959 = _957.x;
                float _961 = _957.y;
                float _963 = _957.z;
                float _965 = _811 * _863;
                float _967 = _789 * 2.0;
                int _969 = _193 + 24;
                uint _971 = uint(int(uint(_969) >> uint(2)));
                uint _973 = uint(int(uint(int(_971)) >> uint(2)));
                int _975 = int(_971) & 3;
                float _977 = (*spvDescriptorSet0.cp_c5)._m0[int(_973)][_975];
                float _979 = -_967;
                float _981 = fma(_965, _979, _965);
                float _983 = fma(_789, 3.1415927410125732421875, _981);
                int _985 = _193 + 20;
                uint _987 = uint(int(uint(_985) >> uint(2)));
                uint _989 = uint(int(uint(int(_987)) >> uint(2)));
                int _991 = int(_987) & 3;
                float _993 = (*spvDescriptorSet0.cp_c5)._m0[int(_989)][_991];
                float _995 = _983 * 0.15915493667125701904296875;
                float _997 = _995 * 6.283185482025146484375;
                float _999 = sin(_997);
                float _1001 = abs(_999);
                bool _1003 = _1001 >= 0.001000000047497451305389404296875;
                bool _1005 = isnan(_1001);
                bool _1007 = _1003 || _1005;
                bool _1009 = isnan(0.001000000047497451305389404296875);
                bool _1011 = _1007 || _1009;
                float _1013 = _811;
                float _1015 = _865;
                float _1017 = _965;
                _245 = as_type<int>(_875);
                _247 = as_type<int>(_883);
                if (!_1011)
                {
                    int _1019 = _193 + 28;
                    uint _1021 = uint(int(uint(_1019) >> uint(2)));
                    uint _1023 = uint(int(uint(int(_1021)) >> uint(2)));
                    int _1025 = int(_1021) & 3;
                    float _1027 = (*spvDescriptorSet0.cp_c5)._m0[int(_1023)][_1025];
                    _1013 = _1027;
                }
                float _1029 = _1013;
                float _1031 = _1029;
                if (!_1011)
                {
                    float _1033 = -_1029;
                    float _1035 = _1033 + 1.0;
                    _1015 = _1035;
                }
                float _1037 = _1015;
                float _1039 = _1037;
                if (!_1011)
                {
                    _1017 = _1029;
                }
                float _1041 = _1017;
                bool _1043 = !_1011;
                float _1045 = _1041;
                _529 = as_type<int>(_919);
                _251 = as_type<int>(_977);
                _253 = as_type<int>(_993);
                _543 = as_type<int>(_921);
                _255 = as_type<int>(_959);
                _257 = as_type<int>(_961);
                if (!_1043)
                {
                    int _1047 = _193 + 28;
                    uint _1049 = uint(int(uint(_1047) >> uint(2)));
                    uint _1051 = uint(int(uint(int(_1049)) >> uint(2)));
                    int _1053 = int(_1049) & 3;
                    float _1055 = (*spvDescriptorSet0.cp_c5)._m0[int(_1051)][_1053];
                    float _1057 = 1.0 / _999;
                    float _1059 = _983 * _1055;
                    float _1061 = _1059 * 0.15915493667125701904296875;
                    float _1063 = -_1059;
                    float _1065 = _983 + _1063;
                    float _1067 = _1065 * 0.15915493667125701904296875;
                    float _1069 = _1061 * 6.283185482025146484375;
                    float _1071 = sin(_1069);
                    float _1073 = _1067 * 6.283185482025146484375;
                    float _1075 = sin(_1073);
                    float _1077 = _1071 * _1057;
                    float _1079 = _1075 * _1057;
                    _1045 = _1077;
                    _1039 = _1079;
                    _1031 = _1055;
                }
                float _1081 = _1045;
                float _1083 = _1039;
                float _1085 = _1031;
                bool _1087 = !_779;
                float _1089 = -_1081;
                float _1091 = _1087 ? _1089 : _1081;
                float _1093 = -_903;
                float _1095 = _1093 + _943;
                float _1097 = -_923;
                float _1099 = _1097 + _963;
                float _1101 = _761 * _1091;
                float _1103 = _749 * _1091;
                float _1105 = _757 * _1091;
                float _1107 = fma(_1095, _977, _903);
                float _1109 = fma(_665, _1083, _1101);
                float _1111 = _743 * _1091;
                float _1113 = fma(_669, _1083, _1103);
                float _1115 = fma(_675, _1083, _1105);
                float _1117 = _1109 * 2.0;
                float _1119 = fma(_663, _1083, _1111);
                float _1121 = _1113 * 2.0;
                float _1123 = fma(_1099, _977, _923);
                float _1125 = _1115 * _1117;
                float _1127 = _1119 * _1117;
                float _1129 = _1119 * 2.0;
                float _1131 = _1113 * _1117;
                float _1133 = -_1125;
                float _1135 = fma(_1119, _1121, _1133);
                float _1137 = fma(_1119, _1121, _1125);
                float _1139 = fma(_1115, _1121, _1127);
                float _1141 = -_1127;
                float _1143 = fma(_1115, _1121, _1141);
                float _1145 = -_1131;
                float _1147 = fma(_1115, _1129, _1145);
                float _1149 = fma(_1115, _1129, _1131);
                float _1151 = _1113 * _1113;
                float _1153 = _1119 * _1119;
                float _1155 = _1115 * _1115;
                float _1157 = -_899;
                float _1159 = _1157 + _939;
                float _1161 = -_901;
                float _1163 = _1161 + _941;
                float _1165 = fma(_1153, -2.0, 1.0);
                float _1167 = fma(_1151, -2.0, 1.0);
                float _1169 = fma(_1159, _977, _899);
                float _1171 = -_921;
                float _1173 = _1171 + _961;
                float _1175 = fma(_1155, -2.0, _1165);
                float _1177 = fma(_1155, -2.0, _1167);
                float _1179 = fma(_1153, -2.0, _1167);
                float _1181 = -_919;
                float _1183 = _1181 + _959;
                float _1185 = fma(_1163, _977, _901);
                float _1187 = fma(_1173, _977, _921);
                float _1189 = _1169 * _1085;
                float _1191 = fma(_1183, _977, _919);
                float _1193 = _1185 * _1085;
                float _1195 = _1107 * _1085;
                float _1197 = _1123 * _1085;
                float _1199 = _1191 * _1085;
                float _1201 = _1187 * _1085;
                float _1203 = fma(_513, _993, _1189);
                float _1205 = fma(_515, _993, _1193);
                float _1207 = fma(_517, _993, _1195);
                float _1209 = fma(_519, _993, _1199);
                float _1211 = fma(_521, _993, _1201);
                float _1213 = fma(_523, _993, _1197);
                _249 = as_type<int>(_1123);
                _531 = _1203;
                _533 = _1205;
                _535 = _1207;
                _537 = _1203;
                _1215 = _1143;
                _1217 = _1175;
                _1219 = _1137;
                _539 = _1205;
                _1221 = _1135;
                _1223 = _1177;
                _1225 = _1149;
                _541 = _1207;
                _1227 = _1139;
                _1229 = _1147;
                _1231 = _1179;
                _1233 = as_type<int>(_1209);
                _1235 = as_type<int>(_1211);
                _1237 = as_type<int>(_1213);
                _259 = as_type<int>(_1085);
                _1239 = true;
            }
            else
            {
                float _1241 = _511 * 0.15915493667125701904296875;
                float _1243 = _507 * 0.15915493667125701904296875;
                float _1245 = _509 * 0.15915493667125701904296875;
                float _1247 = _1241 * 6.283185482025146484375;
                float _1249 = cos(_1247);
                float _1251 = _1243 * 6.283185482025146484375;
                float _1253 = sin(_1251);
                float _1255 = _1243 * 6.283185482025146484375;
                float _1257 = cos(_1255);
                float _1259 = _1245 * 6.283185482025146484375;
                float _1261 = cos(_1259);
                float _1263 = _1253 * _1249;
                float _1265 = _1241 * 6.283185482025146484375;
                float _1267 = sin(_1265);
                float _1269 = _1249 * _1257;
                float _1271 = _1245 * 6.283185482025146484375;
                float _1273 = sin(_1271);
                float _1275 = _1249 * _1261;
                float _1277 = _1261 * _1257;
                float _1279 = _1253 * _1261;
                float _1281 = _1267 * _1257;
                float _1283 = _1267 * _1253;
                float _1285 = _1267 * _1261;
                float _1287 = _1267 * _1273;
                float _1289 = -_1273;
                float _1291 = _1289 + (-0.0);
                float _1293 = -_1263;
                float _1295 = fma(_1257, _1287, _1293);
                float _1297 = fma(_1253, _1287, _1269);
                float _1299 = -_1281;
                float _1301 = fma(_1273, _1263, _1299);
                float _1303 = fma(_1273, _1269, _1283);
                _1215 = _1291;
                _1217 = _1277;
                _1219 = _1279;
                _1221 = _1295;
                _1223 = _1297;
                _1225 = _1285;
                _1227 = _1303;
                _1229 = _1301;
                _1231 = _1275;
                _1233 = as_type<int>(_519);
                _1235 = as_type<int>(_521);
                _1237 = as_type<int>(_523);
            }
            _1239 = false;
            int _1305 = _529;
            int _1307 = _245;
            int _1309 = _247;
            int _1311 = _249;
            int _1313 = _251;
            int _1315 = _253;
            float _1317 = _531;
            float _1319 = _533;
            float _1321 = _535;
            float _1323 = _537;
            float _1325 = _1215;
            float _1327 = _1217;
            float _1329 = _1219;
            float _1331 = _539;
            float _1333 = _1221;
            float _1335 = _1223;
            float _1337 = _1225;
            float _1339 = _541;
            float _1341 = _1227;
            float _1343 = _1229;
            float _1345 = _1231;
            int _1347 = _1233;
            int _1349 = _1235;
            int _1351 = _1237;
            int _1353 = _543;
            int _1355 = _255;
            int _1357 = _257;
            int _1359 = _259;
            int _1361 = _261;
            int _1363 = _263;
            float _1365 = _1323 * _1325;
            int _1367 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1369 = _1367 + _120;
            float _1371 = _1323 * _1327;
            float _1373 = _1323 * _1329;
            float _1375 = _1331 * _1333;
            float _1377 = _1331 * _1335;
            float _1379 = _1331 * _1337;
            float _1381 = _1339 * _1341;
            int _1383 = _1369 * 48;
            float _1385 = _1339 * _1343;
            float _1387 = _1339 * _1345;
            int _1389 = _120 + 1;
            uint _1391 = uint(int(uint(_1383) >> uint(2)));
            _37[int(_1391)] = as_type<uint>(_1371);
            int _1393 = _1383 + 4;
            uint _1395 = uint(int(uint(_1393) >> uint(2)));
            _37[int(_1395)] = as_type<uint>(_1375);
            int _1397 = _1383 + 8;
            uint _1399 = uint(int(uint(_1397) >> uint(2)));
            _37[int(_1399)] = as_type<uint>(_1381);
            int _1401 = _1383 + 12;
            uint _1403 = uint(int(uint(_1401) >> uint(2)));
            _37[int(_1403)] = uint(_1347);
            bool _1405 = uint(_1389) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1407 = _1383 + 16;
            uint _1409 = uint(int(uint(_1407) >> uint(2)));
            _37[int(_1409)] = as_type<uint>(_1373);
            int _1411 = _1383 + 20;
            uint _1413 = uint(int(uint(_1411) >> uint(2)));
            _37[int(_1413)] = as_type<uint>(_1377);
            int _1415 = _1383 + 24;
            uint _1417 = uint(int(uint(_1415) >> uint(2)));
            _37[int(_1417)] = as_type<uint>(_1385);
            int _1419 = _1383 + 28;
            uint _1421 = uint(int(uint(_1419) >> uint(2)));
            _37[int(_1421)] = uint(_1349);
            int _1423 = _1383 + 32;
            uint _1425 = uint(int(uint(_1423) >> uint(2)));
            _37[int(_1425)] = as_type<uint>(_1365);
            int _1427 = _1383 + 36;
            uint _1429 = uint(int(uint(_1427) >> uint(2)));
            _37[int(_1429)] = as_type<uint>(_1379);
            int _1431 = _1383 + 40;
            uint _1433 = uint(int(uint(_1431) >> uint(2)));
            _37[int(_1433)] = as_type<uint>(_1387);
            int _1435 = _1383 + 44;
            uint _1437 = uint(int(uint(_1435) >> uint(2)));
            _37[int(_1437)] = uint(_1351);
            _82 = _1389;
            _84 = _1373;
            _86 = _1377;
            _88 = _1305;
            _90 = _1307;
            _92 = _1309;
            _94 = _1311;
            _96 = _1313;
            _98 = _1315;
            _100 = _1317;
            _102 = _1319;
            _104 = _1321;
            _108 = _1353;
            _110 = _1355;
            _112 = _1357;
            _114 = _1359;
            _116 = _1361;
            _118 = _1363;
            if (_1405)
            {
                _1439 = true;
                if (_1439)
                {
                    break;
                }
            }
        } while (true);
    }
    _1439 = false;
    bool _1441 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _1443 = !_1441;
    if (!_1443)
    {
        int _1445 = 1;
        bool _1447;
        do
        {
            int _1449 = _1445;
            int _1451 = _1449 * 112;
            int _1453 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1455 = _1453 + _1449;
            int _1457 = _1449 + 1;
            uint _1459 = uint(int(uint(_1451) >> uint(2)));
            uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
            int _1463 = int(_1459) & 3;
            float _1465 = (*spvDescriptorSet0.cp_c6)._m0[int(_1461)][_1463];
            int _1467 = _1455 * 48;
            bool _1469 = uint(_1457) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1471 = _1467 + 16;
            uint _1473 = uint(int(uint(_1471) >> uint(2)));
            float _1475 = as_type<float>(_37[int(_1473)]);
            int _1477 = _1467 + 20;
            uint _1479 = uint(int(uint(_1477) >> uint(2)));
            float _1481 = as_type<float>(_37[int(_1479)]);
            int _1483 = _1467 + 24;
            uint _1485 = uint(int(uint(_1483) >> uint(2)));
            float _1487 = as_type<float>(_37[int(_1485)]);
            int _1489 = _1467 + 28;
            uint _1491 = uint(int(uint(_1489) >> uint(2)));
            float _1493 = as_type<float>(_37[int(_1491)]);
            int _1495 = _1467 + 32;
            uint _1497 = uint(int(uint(_1495) >> uint(2)));
            float _1499 = as_type<float>(_37[int(_1497)]);
            int _1501 = _1467 + 36;
            uint _1503 = uint(int(uint(_1501) >> uint(2)));
            float _1505 = as_type<float>(_37[int(_1503)]);
            int _1507 = _1467 + 40;
            uint _1509 = uint(int(uint(_1507) >> uint(2)));
            float _1511 = as_type<float>(_37[int(_1509)]);
            int _1513 = _1467 + 44;
            uint _1515 = uint(int(uint(_1513) >> uint(2)));
            float _1517 = as_type<float>(_37[int(_1515)]);
            int _1519 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1521 = _1519 + as_type<int>(_1465);
            int _1523 = _1521 * 48;
            uint _1525 = uint(int(uint(_1467) >> uint(2)));
            float _1527 = as_type<float>(_37[int(_1525)]);
            int _1529 = _1467 + 4;
            uint _1531 = uint(int(uint(_1529) >> uint(2)));
            float _1533 = as_type<float>(_37[int(_1531)]);
            int _1535 = _1467 + 8;
            uint _1537 = uint(int(uint(_1535) >> uint(2)));
            float _1539 = as_type<float>(_37[int(_1537)]);
            int _1541 = _1467 + 12;
            uint _1543 = uint(int(uint(_1541) >> uint(2)));
            float _1545 = as_type<float>(_37[int(_1543)]);
            uint _1547 = uint(int(uint(_1523) >> uint(2)));
            float _1549 = as_type<float>(_37[int(_1547)]);
            int _1551 = _1523 + 4;
            uint _1553 = uint(int(uint(_1551) >> uint(2)));
            float _1555 = as_type<float>(_37[int(_1553)]);
            int _1557 = _1523 + 8;
            uint _1559 = uint(int(uint(_1557) >> uint(2)));
            float _1561 = as_type<float>(_37[int(_1559)]);
            int _1563 = _1523 + 12;
            uint _1565 = uint(int(uint(_1563) >> uint(2)));
            float _1567 = as_type<float>(_37[int(_1565)]);
            int _1569 = _1523 + 16;
            uint _1571 = uint(int(uint(_1569) >> uint(2)));
            float _1573 = as_type<float>(_37[int(_1571)]);
            int _1575 = _1523 + 20;
            uint _1577 = uint(int(uint(_1575) >> uint(2)));
            float _1579 = as_type<float>(_37[int(_1577)]);
            int _1581 = _1523 + 24;
            uint _1583 = uint(int(uint(_1581) >> uint(2)));
            float _1585 = as_type<float>(_37[int(_1583)]);
            int _1587 = _1523 + 28;
            uint _1589 = uint(int(uint(_1587) >> uint(2)));
            float _1591 = as_type<float>(_37[int(_1589)]);
            int _1593 = _1523 + 32;
            uint _1595 = uint(int(uint(_1593) >> uint(2)));
            float _1597 = as_type<float>(_37[int(_1595)]);
            int _1599 = _1523 + 36;
            uint _1601 = uint(int(uint(_1599) >> uint(2)));
            float _1603 = as_type<float>(_37[int(_1601)]);
            int _1605 = _1523 + 40;
            uint _1607 = uint(int(uint(_1605) >> uint(2)));
            float _1609 = as_type<float>(_37[int(_1607)]);
            int _1611 = _1523 + 44;
            uint _1613 = uint(int(uint(_1611) >> uint(2)));
            float _1615 = as_type<float>(_37[int(_1613)]);
            float _1617 = _1493 * _1555;
            float _1619 = _1481 * _1555;
            float _1621 = _1475 * _1555;
            float _1623 = _1487 * _1555;
            float _1625 = fma(_1545, _1549, _1617);
            float _1627 = fma(_1533, _1549, _1619);
            float _1629 = fma(_1527, _1549, _1621);
            float _1631 = fma(_1539, _1549, _1623);
            float _1633 = fma(_1517, _1561, _1625);
            float _1635 = fma(_1505, _1561, _1627);
            float _1637 = _1481 * _1579;
            float _1639 = _1475 * _1579;
            float _1641 = _1567 + _1633;
            float _1643 = _1493 * _1579;
            float _1645 = _1487 * _1579;
            float _1647 = fma(_1533, _1573, _1637);
            float _1649 = fma(_1499, _1561, _1629);
            float _1651 = fma(_1545, _1573, _1643);
            float _1653 = fma(_1539, _1573, _1645);
            float _1655 = fma(_1505, _1585, _1647);
            float _1657 = _1493 * _1603;
            float _1659 = _1475 * _1603;
            float _1661 = _1481 * _1603;
            float _1663 = _1487 * _1603;
            float _1665 = fma(_1545, _1597, _1657);
            float _1667 = fma(_1527, _1573, _1639);
            float _1669 = fma(_1517, _1585, _1651);
            float _1671 = fma(_1527, _1597, _1659);
            float _1673 = fma(_1533, _1597, _1661);
            float _1675 = fma(_1539, _1597, _1663);
            float _1677 = fma(_1517, _1609, _1665);
            float _1679 = fma(_1499, _1585, _1667);
            float _1681 = fma(_1511, _1561, _1631);
            float _1683 = fma(_1511, _1585, _1653);
            float _1685 = _1591 + _1669;
            float _1687 = fma(_1499, _1609, _1671);
            float _1689 = fma(_1505, _1609, _1673);
            float _1691 = fma(_1511, _1609, _1675);
            float _1693 = _1615 + _1677;
            uint _1695 = uint(int(uint(_1467) >> uint(2)));
            _37[int(_1695)] = as_type<uint>(_1649);
            int _1697 = _1467 + 4;
            uint _1699 = uint(int(uint(_1697) >> uint(2)));
            _37[int(_1699)] = as_type<uint>(_1635);
            int _1701 = _1467 + 8;
            uint _1703 = uint(int(uint(_1701) >> uint(2)));
            _37[int(_1703)] = as_type<uint>(_1681);
            int _1705 = _1467 + 12;
            uint _1707 = uint(int(uint(_1705) >> uint(2)));
            _37[int(_1707)] = as_type<uint>(_1641);
            int _1709 = _1467 + 16;
            uint _1711 = uint(int(uint(_1709) >> uint(2)));
            _37[int(_1711)] = as_type<uint>(_1679);
            int _1713 = _1467 + 20;
            uint _1715 = uint(int(uint(_1713) >> uint(2)));
            _37[int(_1715)] = as_type<uint>(_1655);
            int _1717 = _1467 + 24;
            uint _1719 = uint(int(uint(_1717) >> uint(2)));
            _37[int(_1719)] = as_type<uint>(_1683);
            int _1721 = _1467 + 28;
            uint _1723 = uint(int(uint(_1721) >> uint(2)));
            _37[int(_1723)] = as_type<uint>(_1685);
            int _1725 = _1467 + 32;
            uint _1727 = uint(int(uint(_1725) >> uint(2)));
            _37[int(_1727)] = as_type<uint>(_1687);
            int _1729 = _1467 + 36;
            uint _1731 = uint(int(uint(_1729) >> uint(2)));
            _37[int(_1731)] = as_type<uint>(_1689);
            int _1733 = _1467 + 40;
            uint _1735 = uint(int(uint(_1733) >> uint(2)));
            _37[int(_1735)] = as_type<uint>(_1691);
            int _1737 = _1467 + 44;
            uint _1739 = uint(int(uint(_1737) >> uint(2)));
            _37[int(_1739)] = as_type<uint>(_1693);
            _1447 = !_1469;
            _1445 = _1457;
        } while (_1447);
    }
    if (!_74)
    {
        return;
    }
    int _1741 = 0;
    bool _1743;
    do
    {
        int _1745 = _1741;
        int _1747 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1749 = _1747 + _1745;
        int _1751 = _1745 * 112;
        int _1753 = _1749 * 48;
        int _1755 = _1751 + 80;
        uint _1757 = uint(int(uint(_1755) >> uint(2)));
        uint _1759 = uint(int(uint(int(_1757)) >> uint(2)));
        int _1761 = int(_1757) & 3;
        float _1763 = (*spvDescriptorSet0.cp_c6)._m0[int(_1759)][_1761];
        int _1765 = int(_1757) + 1;
        uint _1767 = uint(int(uint(_1765) >> uint(2)));
        int _1769 = _1765 & 3;
        float _1771 = (*spvDescriptorSet0.cp_c6)._m0[int(_1767)][_1769];
        uint _1773 = uint(int(uint(_1753) >> uint(2)));
        float _1775 = as_type<float>(_37[int(_1773)]);
        int _1777 = _1753 + 4;
        uint _1779 = uint(int(uint(_1777) >> uint(2)));
        float _1781 = as_type<float>(_37[int(_1779)]);
        int _1783 = _1753 + 8;
        uint _1785 = uint(int(uint(_1783) >> uint(2)));
        float _1787 = as_type<float>(_37[int(_1785)]);
        int _1789 = _1753 + 12;
        uint _1791 = uint(int(uint(_1789) >> uint(2)));
        float _1793 = as_type<float>(_37[int(_1791)]);
        int _1795 = _1753 + 16;
        uint _1797 = uint(int(uint(_1795) >> uint(2)));
        float _1799 = as_type<float>(_37[int(_1797)]);
        int _1801 = _1753 + 20;
        uint _1803 = uint(int(uint(_1801) >> uint(2)));
        float _1805 = as_type<float>(_37[int(_1803)]);
        int _1807 = _1753 + 24;
        uint _1809 = uint(int(uint(_1807) >> uint(2)));
        float _1811 = as_type<float>(_37[int(_1809)]);
        int _1813 = _1753 + 28;
        uint _1815 = uint(int(uint(_1813) >> uint(2)));
        float _1817 = as_type<float>(_37[int(_1815)]);
        int _1819 = _1751 + 88;
        uint _1821 = uint(int(uint(_1819) >> uint(2)));
        uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
        int _1825 = int(_1821) & 3;
        float _1827 = (*spvDescriptorSet0.cp_c6)._m0[int(_1823)][_1825];
        int _1829 = int(_1821) + 1;
        uint _1831 = uint(int(uint(_1829) >> uint(2)));
        int _1833 = _1829 & 3;
        float _1835 = (*spvDescriptorSet0.cp_c6)._m0[int(_1831)][_1833];
        int _1837 = _1753 + 32;
        uint _1839 = uint(int(uint(_1837) >> uint(2)));
        float _1841 = as_type<float>(_37[int(_1839)]);
        int _1843 = _1753 + 36;
        uint _1845 = uint(int(uint(_1843) >> uint(2)));
        float _1847 = as_type<float>(_37[int(_1845)]);
        int _1849 = _1753 + 40;
        uint _1851 = uint(int(uint(_1849) >> uint(2)));
        float _1853 = as_type<float>(_37[int(_1851)]);
        int _1855 = _1753 + 44;
        uint _1857 = uint(int(uint(_1855) >> uint(2)));
        float _1859 = as_type<float>(_37[int(_1857)]);
        int _1861 = _1751 + 64;
        uint _1863 = uint(int(uint(_1861) >> uint(2)));
        uint _1865 = uint(int(uint(int(_1863)) >> uint(2)));
        int _1867 = int(_1863) & 3;
        float _1869 = (*spvDescriptorSet0.cp_c6)._m0[int(_1865)][_1867];
        int _1871 = int(_1863) + 1;
        uint _1873 = uint(int(uint(_1871) >> uint(2)));
        int _1875 = _1871 & 3;
        float _1877 = (*spvDescriptorSet0.cp_c6)._m0[int(_1873)][_1875];
        int _1879 = _1751 + 72;
        uint _1881 = uint(int(uint(_1879) >> uint(2)));
        uint _1883 = uint(int(uint(int(_1881)) >> uint(2)));
        int _1885 = int(_1881) & 3;
        float _1887 = (*spvDescriptorSet0.cp_c6)._m0[int(_1883)][_1885];
        int _1889 = int(_1881) + 1;
        uint _1891 = uint(int(uint(_1889) >> uint(2)));
        int _1893 = _1889 & 3;
        float _1895 = (*spvDescriptorSet0.cp_c6)._m0[int(_1891)][_1893];
        int _1897 = _1751 + 104;
        uint _1899 = uint(int(uint(_1897) >> uint(2)));
        uint _1901 = uint(int(uint(int(_1899)) >> uint(2)));
        int _1903 = int(_1899) & 3;
        float _1905 = (*spvDescriptorSet0.cp_c6)._m0[int(_1901)][_1903];
        int _1907 = int(_1899) + 1;
        uint _1909 = uint(int(uint(_1907) >> uint(2)));
        int _1911 = _1907 & 3;
        float _1913 = (*spvDescriptorSet0.cp_c6)._m0[int(_1909)][_1911];
        int _1915 = _1751 + 96;
        uint _1917 = uint(int(uint(_1915) >> uint(2)));
        uint _1919 = uint(int(uint(int(_1917)) >> uint(2)));
        int _1921 = int(_1917) & 3;
        float _1923 = (*spvDescriptorSet0.cp_c6)._m0[int(_1919)][_1921];
        int _1925 = int(_1917) + 1;
        uint _1927 = uint(int(uint(_1925) >> uint(2)));
        int _1929 = _1925 & 3;
        float _1931 = (*spvDescriptorSet0.cp_c6)._m0[int(_1927)][_1929];
        float _1933 = _1781 * _1763;
        float _1935 = _1781 * _1771;
        float _1937 = _1781 * _1827;
        float _1939 = _1781 * _1835;
        float _1941 = fma(_1775, _1869, _1933);
        float _1943 = fma(_1775, _1877, _1935);
        float _1945 = fma(_1775, _1887, _1937);
        float _1947 = fma(_1775, _1895, _1939);
        float _1949 = _1805 * _1763;
        float _1951 = _1805 * _1771;
        float _1953 = _1805 * _1827;
        float _1955 = _1805 * _1835;
        float _1957 = _1847 * _1763;
        float _1959 = fma(_1799, _1869, _1949);
        float _1961 = fma(_1799, _1877, _1951);
        float _1963 = fma(_1799, _1887, _1953);
        uint _1965 = uint(int(uint(_78) >> uint(2)));
        uint _1967 = uint(int(uint(int(_1965)) >> uint(2)));
        int _1969 = int(_1965) & 3;
        float _1971 = (*spvDescriptorSet0.cp_c4)._m0[int(_1967)][_1969];
        float _1973 = fma(_1799, _1895, _1955);
        float _1975 = _1847 * _1771;
        float _1977 = _1847 * _1827;
        float _1979 = _1847 * _1835;
        float _1981 = fma(_1841, _1869, _1957);
        float _1983 = fma(_1841, _1877, _1975);
        float _1985 = fma(_1841, _1887, _1977);
        int _1987 = _1751 + 16;
        uint _1989 = uint(int(uint(_1987) >> uint(2)));
        uint _1991 = uint(int(uint(int(_1989)) >> uint(2)));
        int _1993 = int(_1989) & 3;
        float _1995 = (*spvDescriptorSet0.cp_c6)._m0[int(_1991)][_1993];
        int _1997 = int(_1989) + 1;
        uint _1999 = uint(int(uint(_1997) >> uint(2)));
        int _2001 = _1997 & 3;
        float _2003 = (*spvDescriptorSet0.cp_c6)._m0[int(_1999)][_2001];
        float _2005 = fma(_1841, _1895, _1979);
        float _2007 = fma(_1811, _1913, _1973);
        float _2009 = fma(_1787, _1923, _1941);
        float _2011 = fma(_1787, _1931, _1943);
        float _2013 = fma(_1787, _1905, _1945);
        float _2015 = fma(_1787, _1913, _1947);
        float _2017 = fma(_1811, _1923, _1959);
        int _2019 = _1751 + 24;
        uint _2021 = uint(int(uint(_2019) >> uint(2)));
        uint _2023 = uint(int(uint(int(_2021)) >> uint(2)));
        int _2025 = int(_2021) & 3;
        float _2027 = (*spvDescriptorSet0.cp_c6)._m0[int(_2023)][_2025];
        int _2029 = int(_2021) + 1;
        uint _2031 = uint(int(uint(_2029) >> uint(2)));
        int _2033 = _2029 & 3;
        float _2035 = (*spvDescriptorSet0.cp_c6)._m0[int(_2031)][_2033];
        float _2037 = fma(_1811, _1931, _1961);
        float _2039 = fma(_1811, _1905, _1963);
        float _2041 = fma(_1853, _1923, _1981);
        float _2043 = fma(_1853, _1931, _1983);
        float _2045 = fma(_1853, _1913, _2005);
        float _2047 = fma(_1853, _1905, _1985);
        float _2049 = _1817 + _2007;
        int _2051 = _1751 + 32;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        uint _2055 = uint(int(uint(int(_2053)) >> uint(2)));
        int _2057 = int(_2053) & 3;
        float _2059 = (*spvDescriptorSet0.cp_c6)._m0[int(_2055)][_2057];
        int _2061 = int(_2053) + 1;
        uint _2063 = uint(int(uint(_2061) >> uint(2)));
        int _2065 = _2061 & 3;
        float _2067 = (*spvDescriptorSet0.cp_c6)._m0[int(_2063)][_2065];
        float _2069 = _1859 + _2045;
        float _2071 = _1793 + _2015;
        int _2073 = _1751 + 48;
        uint _2075 = uint(int(uint(_2073) >> uint(2)));
        uint _2077 = uint(int(uint(int(_2075)) >> uint(2)));
        int _2079 = int(_2075) & 3;
        float _2081 = (*spvDescriptorSet0.cp_c6)._m0[int(_2077)][_2079];
        int _2083 = int(_2075) + 1;
        uint _2085 = uint(int(uint(_2083) >> uint(2)));
        int _2087 = _2083 & 3;
        float _2089 = (*spvDescriptorSet0.cp_c6)._m0[int(_2085)][_2087];
        float _2091 = _2017 * _2003;
        float _2093 = _2037 * _2003;
        float _2095 = _2049 * _2003;
        float _2097 = _2039 * _2003;
        float _2099 = fma(_2009, _1995, _2091);
        float _2101 = fma(_2011, _1995, _2093);
        float _2103 = fma(_2071, _1995, _2095);
        float _2105 = fma(_2013, _1995, _2097);
        int _2107 = _1751 + 40;
        uint _2109 = uint(int(uint(_2107) >> uint(2)));
        uint _2111 = uint(int(uint(int(_2109)) >> uint(2)));
        int _2113 = int(_2109) & 3;
        float _2115 = (*spvDescriptorSet0.cp_c6)._m0[int(_2111)][_2113];
        int _2117 = int(_2109) + 1;
        uint _2119 = uint(int(uint(_2117) >> uint(2)));
        int _2121 = _2117 & 3;
        float _2123 = (*spvDescriptorSet0.cp_c6)._m0[int(_2119)][_2121];
        float _2125 = fma(_2041, _2027, _2099);
        float _2127 = fma(_2069, _2027, _2103);
        float _2129 = fma(_2043, _2027, _2101);
        float _2131 = fma(_2047, _2027, _2105);
        float _2133 = _2127 + _2035;
        float _2135 = _2049 * _2067;
        int _2137 = _1751 + 56;
        uint _2139 = uint(int(uint(_2137) >> uint(2)));
        uint _2141 = uint(int(uint(int(_2139)) >> uint(2)));
        int _2143 = int(_2139) & 3;
        float _2145 = (*spvDescriptorSet0.cp_c6)._m0[int(_2141)][_2143];
        int _2147 = int(_2139) + 1;
        uint _2149 = uint(int(uint(_2147) >> uint(2)));
        int _2151 = _2147 & 3;
        float _2153 = (*spvDescriptorSet0.cp_c6)._m0[int(_2149)][_2151];
        float _2155 = _2017 * _2067;
        float _2157 = _2037 * _2067;
        int _2159 = as_type<int>(_1971) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _2161 = _2159 + _1745;
        int _2163 = _1745 + 1;
        float _2165 = _2039 * _2067;
        float _2167 = fma(_2071, _2059, _2135);
        float _2169 = _2049 * _2089;
        float _2171 = _2017 * _2089;
        float _2173 = _2037 * _2089;
        float _2175 = fma(_2011, _2059, _2157);
        float _2177 = _2039 * _2089;
        float _2179 = fma(_2071, _2081, _2169);
        float _2181 = fma(_2009, _2081, _2171);
        int _2183 = _2161 * 48;
        bool _2185 = uint(_2163) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _2187 = fma(_2011, _2081, _2173);
        float _2189 = fma(_2009, _2059, _2155);
        float _2191 = fma(_2013, _2059, _2165);
        float _2193 = fma(_2069, _2115, _2167);
        float _2195 = fma(_2013, _2081, _2177);
        float _2197 = fma(_2043, _2115, _2175);
        float _2199 = fma(_2041, _2115, _2189);
        float _2201 = fma(_2047, _2115, _2191);
        float _2203 = fma(_2069, _2145, _2179);
        float _2205 = fma(_2041, _2145, _2181);
        float _2207 = fma(_2043, _2145, _2187);
        int _2209 = _2183 + 16;
        float _2211 = _2193 + _2123;
        int _2213 = _2183 + 32;
        float _2215 = fma(_2047, _2145, _2195);
        float _2217 = _2203 + _2153;
        int _2219 = _2183 + 48;
        uint _2221 = uint(int(uint(_2209) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2221)] = as_type<uint>(_2125);
        int _2223 = _2209 + 4;
        uint _2225 = uint(int(uint(_2223) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2225)] = as_type<uint>(_2129);
        int _2227 = _2209 + 8;
        uint _2229 = uint(int(uint(_2227) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2229)] = as_type<uint>(_2131);
        int _2231 = _2209 + 12;
        uint _2233 = uint(int(uint(_2231) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2233)] = as_type<uint>(_2133);
        uint _2235 = uint(int(uint(_2213) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2235)] = as_type<uint>(_2199);
        int _2237 = _2213 + 4;
        uint _2239 = uint(int(uint(_2237) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2239)] = as_type<uint>(_2197);
        int _2241 = _2213 + 8;
        uint _2243 = uint(int(uint(_2241) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2243)] = as_type<uint>(_2201);
        int _2245 = _2213 + 12;
        uint _2247 = uint(int(uint(_2245) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2247)] = as_type<uint>(_2211);
        uint _2249 = uint(int(uint(_2219) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2249)] = as_type<uint>(_2205);
        int _2251 = _2219 + 4;
        uint _2253 = uint(int(uint(_2251) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2253)] = as_type<uint>(_2207);
        int _2255 = _2219 + 8;
        uint _2257 = uint(int(uint(_2255) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2257)] = as_type<uint>(_2215);
        int _2259 = _2219 + 12;
        uint _2261 = uint(int(uint(_2259) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2261)] = as_type<uint>(_2217);
        _1743 = !_2185;
        _1741 = _2163;
    } while (_1743);
}

