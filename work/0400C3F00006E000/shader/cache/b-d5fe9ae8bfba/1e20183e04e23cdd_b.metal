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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _5008, thread const int& _5009, constant _10& support_buffer)
{
    int _5012 = 1 + _5009;
    float _5014 = support_buffer._m5[_5012].x;
    bool _5016 = _5014 == 1.0;
    if (_5016)
    {
        return _5008;
    }
    float _5018 = float(_5008);
    float _5020 = _5018 * _5014;
    int _5022 = int(_5020);
    return _5022;
}

static inline __attribute__((always_inline))
void _54(thread const int& _4700, thread const int& _4701, thread const int& _4702, thread const int& _4703, thread int& _4704, thread int& _4705, thread int& _4706, thread int& _4707, thread int& _4708, thread int& _4709)
{
    float _4712 = as_type<float>(_4702) + 0.0;
    bool _4714 = _4712 != 0.0;
    bool _4716 = isnan(_4712);
    bool _4718 = _4714 || _4716;
    bool _4720 = isnan(0.0);
    bool _4722 = _4718 || _4720;
    int _4724 = _4700;
    int _4726 = _4701;
    int _4728 = _4702;
    int _4730 = _4722 ? (-1) : 0;
    if (!_4722)
    {
        float _4732 = as_type<float>(_4702) * 1.0;
        _4724 = as_type<int>(_4732);
    }
    int _4734 = _4724;
    bool _4736 = !_4722;
    int _4738 = _4734;
    int _4740 = _4734;
    if (!_4736)
    {
        float _4742 = as_type<float>(_4702) + 0.0;
        bool _4744 = _4742 >= 0.0;
        bool _4746 = isnan(_4742);
        bool _4748 = _4744 || _4746;
        bool _4750 = isnan(0.0);
        bool _4752 = _4748 || _4750;
        _4730 = _4752 ? (-1) : 0;
        if (!_4752)
        {
            _4738 = 2147483647;
        }
        int _4754 = _4738;
        bool _4756 = !_4752;
        int _4758 = _4754;
        _4740 = _4754;
        if (!_4756)
        {
            float _4760 = as_type<float>(_4702) + 0.0;
            bool _4762 = _4760 > as_type<float>(0x7f800000u /* inf */);
            bool _4764 = isnan(_4760);
            bool _4766 = _4762 || _4764;
            bool _4768 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4770 = _4766 || _4768;
            _4730 = _4770 ? (-1) : 0;
            if (_4770)
            {
                float _4772 = as_type<float>(_4702) + 1.0;
                _4758 = as_type<int>(_4772);
            }
            int _4774 = _4758;
            int _4776 = _4774;
            _4740 = _4774;
            if (!_4770)
            {
                float _4778 = 0.0 + as_type<float>(_4702);
                bool _4780 = _4778 != as_type<float>(0x7f800000u /* inf */);
                bool _4782 = isnan(_4778);
                bool _4784 = _4780 || _4782;
                bool _4786 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4788 = _4784 || _4786;
                _4730 = _4788 ? (-1) : 0;
                if (!_4788)
                {
                    _4776 = _4702;
                }
                int _4790 = _4776;
                bool _4792 = !_4788;
                _4740 = _4790;
                if (!_4792)
                {
                    float _4794 = as_type<float>(_4702) * 18446744073709551616.0;
                    float _4796 = rsqrt(_4794);
                    float _4798 = _4794 * _4796;
                    float _4800 = _4796 * 0.5;
                    float _4802 = -_4798;
                    float _4804 = 0.0 + _4802;
                    float _4806 = fma(_4800, _4804, 0.5);
                    float _4808 = fma(_4798, _4806, _4798);
                    float _4810 = -_4808;
                    float _4812 = 0.0 + _4810;
                    float _4814 = fma(_4808, _4812, _4794);
                    float _4816 = fma(_4800, _4814, _4808);
                    float _4818 = _4816 * 2.3283064365386962890625e-10;
                    _4740 = as_type<int>(_4818);
                    _4726 = as_type<int>(_4808);
                    _4728 = as_type<int>(_4804);
                }
            }
        }
    }
    int _4820 = _4740;
    int _4822 = _4726;
    int _4824 = _4728;
    int _4826 = _4730;
    _4704 = _4703;
    _4705 = 0;
    _4706 = _4820;
    _4707 = _4822;
    _4708 = _4824;
    _4709 = _4826;
}

static inline __attribute__((always_inline))
int _58(thread const int& _5043, thread const int& _5044, thread const int& _5045, thread int& _5046, thread uint& gl_SubgroupInvocationID)
{
    int _5049 = _5045 & 31;
    uint _5051 = uint(int(uint(_5045) >> uint(8)));
    int _5053 = int(_5051) & 31;
    float _5055 = as_type<float>(gl_SubgroupInvocationID);
    int _5057 = as_type<int>(_5055) & _5053;
    int _5059 = ~_5053;
    int _5061 = _5049 & _5059;
    int _5063 = _5061 | _5057;
    int _5065 = ~_5053;
    int _5067 = _5044 & _5065;
    int _5069 = _5067 | _5057;
    bool _5071 = uint(_5069) <= uint(_5063);
    _5046 = _5071 ? (-1) : 0;
    float _5073 = spvSubgroupShuffle(as_type<float>(_5043), uint(_5069));
    uint _5075 = uint(_5071 ? as_type<int>(_5073) : _5043);
    return int(_5075);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1565 = false;
    bool _1105 = false;
    bool _707 = false;
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
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _101 + 36;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.cp_c5)._m0[int(_117)][_119];
    int _123 = as_type<int>(_99) & as_type<int>(_111);
    bool _125 = _123 != 0;
    int _127 = as_type<int>(_99) & as_type<int>(_121);
    bool _129 = _127 != 0;
    float _131 = _99;
    if (!_125)
    {
        _131 = 0.0;
    }
    float _133 = _131;
    float _135 = 0.0;
    float _137 = 0.0;
    float _139 = _133;
    if (!_125)
    {
        _135 = 0.0;
        _137 = 0.0;
    }
    float _141 = _135;
    float _143 = _137;
    float _145 = 0.0;
    float _147 = _141;
    float _149 = _143;
    if (!_125)
    {
        _145 = 0.0;
    }
    float _151 = _145;
    float _153 = 0.0;
    float _155 = 0.0;
    float _157 = _151;
    if (!_125)
    {
        _153 = 0.0;
        _155 = 0.0;
    }
    float _159 = _153;
    float _161 = _155;
    float _163 = 0.0;
    float _165 = _161;
    float _167 = _159;
    if (!_125)
    {
        _163 = 0.0;
    }
    float _169 = _163;
    float _171 = 0.0;
    float _173 = 0.0;
    float _175 = _169;
    if (!_125)
    {
        _171 = 0.0;
        _173 = 0.0;
    }
    float _177 = _171;
    float _179 = _173;
    bool _181 = !_125;
    float _183 = _177;
    float _185 = _179;
    if (!_181)
    {
        uint _187 = uint(int(uint(_101) >> uint(2)));
        uint _189 = uint(int(uint(int(_187)) >> uint(2)));
        int _191 = int(_187) & 3;
        float _193 = (*spvDescriptorSet0.cp_c5)._m0[int(_189)][_191];
        int _195 = int(_187) + 1;
        uint _197 = uint(int(uint(_195) >> uint(2)));
        int _199 = _195 & 3;
        float _201 = (*spvDescriptorSet0.cp_c5)._m0[int(_197)][_199];
        int _203 = _68;
        int _205 = 0;
        int _207 = _56(_203, _205, (*spvDescriptorSet0.support_buffer));
        int _209 = as_type<int>(_193);
        int _211 = 0;
        int _213 = _56(_209, _211, (*spvDescriptorSet0.support_buffer));
        int3 _2225 = int3(_207, _213, 1);
        float3 _217 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2225.xy), uint(_2225.z), 0).xyz;
        float _219 = _217.x;
        float _221 = _217.y;
        float _223 = _217.z;
        int _225 = _68;
        int _227 = 0;
        int _229 = _56(_225, _227, (*spvDescriptorSet0.support_buffer));
        int _231 = as_type<int>(_201);
        int _233 = 0;
        int _235 = _56(_231, _233, (*spvDescriptorSet0.support_buffer));
        int3 _2243 = int3(_229, _235, 1);
        float3 _237 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2243.xy), uint(_2243.z), 0).xyz;
        float _239 = _237.x;
        float _241 = _237.y;
        float _243 = _237.z;
        int _245 = _68;
        int _247 = 0;
        int _249 = _56(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = as_type<int>(_193);
        int _253 = 0;
        int _255 = _56(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _2261 = int3(_249, _255, 0);
        float3 _257 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2261.xy), uint(_2261.z), 0).xyz;
        float _259 = _257.x;
        float _261 = _257.y;
        float _263 = _257.z;
        int _265 = _68;
        int _267 = 0;
        int _269 = _56(_265, _267, (*spvDescriptorSet0.support_buffer));
        int _271 = as_type<int>(_201);
        int _273 = 0;
        int _275 = _56(_271, _273, (*spvDescriptorSet0.support_buffer));
        int3 _2279 = int3(_269, _275, 0);
        float3 _277 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2279.xy), uint(_2279.z), 0).xyz;
        float _279 = _277.x;
        float _281 = _277.y;
        float _283 = _277.z;
        int _285 = _68;
        int _287 = 0;
        int _289 = _56(_285, _287, (*spvDescriptorSet0.support_buffer));
        int _291 = as_type<int>(_193);
        int _293 = 0;
        int _295 = _56(_291, _293, (*spvDescriptorSet0.support_buffer));
        int3 _2297 = int3(_289, _295, 2);
        float3 _297 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2297.xy), uint(_2297.z), 0).xyz;
        float _299 = _297.x;
        float _301 = _297.y;
        float _303 = _297.z;
        int _305 = _68;
        int _307 = 0;
        int _309 = _56(_305, _307, (*spvDescriptorSet0.support_buffer));
        int _311 = as_type<int>(_201);
        int _313 = 0;
        int _315 = _56(_311, _313, (*spvDescriptorSet0.support_buffer));
        int3 _2315 = int3(_309, _315, 2);
        float3 _317 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2315.xy), uint(_2315.z), 0).xyz;
        float _319 = _317.x;
        float _321 = _317.y;
        float _323 = _317.z;
        int _325 = _101 + 16;
        uint _327 = uint(int(uint(_325) >> uint(2)));
        uint _329 = uint(int(uint(int(_327)) >> uint(2)));
        int _331 = int(_327) & 3;
        float _333 = (*spvDescriptorSet0.cp_c5)._m0[int(_329)][_331];
        float _335 = -_219;
        float _337 = _335 + _239;
        float _339 = -_223;
        float _341 = _339 + _243;
        float _343 = fma(_337, _333, _219);
        float _345 = -_221;
        float _347 = _345 + _241;
        float _349 = -_259;
        float _351 = _349 + _279;
        float _353 = -_261;
        float _355 = _353 + _281;
        float _357 = -_263;
        float _359 = _357 + _283;
        float _361 = fma(_347, _333, _221);
        float _363 = fma(_341, _333, _223);
        float _365 = fma(_355, _333, _261);
        float _367 = -_299;
        float _369 = _367 + _319;
        float _371 = -_301;
        float _373 = _371 + _321;
        float _375 = -_303;
        float _377 = _375 + _323;
        float _379 = fma(_351, _333, _259);
        float _381 = fma(_359, _333, _263);
        float _383 = fma(_369, _333, _299);
        float _385 = fma(_373, _333, _301);
        float _387 = fma(_377, _333, _303);
        _183 = _363;
        _185 = _361;
        _175 = _343;
        _147 = _381;
        _139 = _379;
        _157 = _365;
        _149 = _383;
        _165 = _385;
        _167 = _387;
    }
    float _389 = _183;
    float _391 = _185;
    float _393 = _175;
    float _395 = _147;
    float _397 = _139;
    float _399 = _157;
    float _401 = _149;
    float _403 = _165;
    float _405 = _167;
    bool _407 = !_129;
    float _409 = _397;
    float _411 = _399;
    float _413 = _395;
    float _1081;
    float _1083;
    float _1085;
    float _1087;
    float _1089;
    float _1091;
    float _1093;
    float _1095;
    float _1097;
    float _1099;
    float _1101;
    float _1103;
    if (!_407)
    {
        int _415 = _101 + 8;
        uint _417 = uint(int(uint(_415) >> uint(2)));
        uint _419 = uint(int(uint(int(_417)) >> uint(2)));
        int _421 = int(_417) & 3;
        float _423 = (*spvDescriptorSet0.cp_c5)._m0[int(_419)][_421];
        int _425 = int(_417) + 1;
        uint _427 = uint(int(uint(_425) >> uint(2)));
        int _429 = _425 & 3;
        float _431 = (*spvDescriptorSet0.cp_c5)._m0[int(_427)][_429];
        int _433 = _68;
        int _435 = 1;
        int _437 = _56(_433, _435, (*spvDescriptorSet0.support_buffer));
        int _439 = as_type<int>(_423);
        int _441 = 1;
        int _443 = _56(_439, _441, (*spvDescriptorSet0.support_buffer));
        int3 _2491 = int3(_437, _443, 1);
        float3 _445 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2491.xy), uint(_2491.z), 0).xyz;
        float _447 = _445.x;
        float _449 = _445.y;
        float _451 = _445.z;
        int _453 = _68;
        int _455 = 1;
        int _457 = _56(_453, _455, (*spvDescriptorSet0.support_buffer));
        int _459 = as_type<int>(_431);
        int _461 = 1;
        int _463 = _56(_459, _461, (*spvDescriptorSet0.support_buffer));
        int3 _2509 = int3(_457, _463, 1);
        float3 _465 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2509.xy), uint(_2509.z), 0).xyz;
        float _467 = _465.x;
        float _469 = _465.y;
        float _471 = _465.z;
        float _473 = _389 * 0.5;
        float _475 = _391 * 0.5;
        float _477 = _393 * 0.5;
        int _479 = _101 + 24;
        uint _481 = uint(int(uint(_479) >> uint(2)));
        uint _483 = uint(int(uint(int(_481)) >> uint(2)));
        int _485 = int(_481) & 3;
        float _487 = (*spvDescriptorSet0.cp_c5)._m0[int(_483)][_485];
        float _489 = _473 * 0.15915493667125701904296875;
        float _491 = _475 * 0.15915493667125701904296875;
        float _493 = _477 * 0.15915493667125701904296875;
        float _495 = _489 * 6.283185482025146484375;
        float _497 = sin(_495);
        float _499 = _491 * 6.283185482025146484375;
        float _501 = sin(_499);
        float _503 = _491 * 6.283185482025146484375;
        float _505 = cos(_503);
        float _507 = _493 * 6.283185482025146484375;
        float _509 = sin(_507);
        float _511 = _493 * 6.283185482025146484375;
        float _513 = cos(_511);
        float _515 = _489 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _497 * _501;
        float _521 = _505 * _497;
        float _523 = _509 * _519;
        float _525 = _509 * _521;
        float _527 = _513 * _519;
        float _529 = _517 * _505;
        float _531 = _517 * _501;
        float _533 = -_527;
        float _535 = fma(_509, _529, _533);
        float _537 = _509 * _531;
        float _539 = fma(_513, _529, _523);
        float _541 = -_451;
        float _543 = _541 + _471;
        float _545 = fma(_513, _531, _525);
        float _547 = -_537;
        float _549 = fma(_513, _521, _547);
        float _551 = fma(_543, _487, _451);
        float _553 = _551 * 0.5;
        float _555 = _553 * 0.15915493667125701904296875;
        float _557 = -_449;
        float _559 = _557 + _469;
        float _561 = _555 * 6.283185482025146484375;
        float _563 = sin(_561);
        float _565 = fma(_559, _487, _449);
        float _567 = -_447;
        float _569 = _567 + _467;
        float _571 = _565 * 0.5;
        float _573 = fma(_569, _487, _447);
        float _575 = _555 * 6.283185482025146484375;
        float _577 = cos(_575);
        float _579 = _571 * 0.15915493667125701904296875;
        float _581 = _573 * 0.5;
        float _583 = _581 * 0.15915493667125701904296875;
        float _585 = _579 * 6.283185482025146484375;
        float _587 = cos(_585);
        float _589 = _579 * 6.283185482025146484375;
        float _591 = sin(_589);
        float _593 = _583 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _587 * _563;
        float _599 = _577 * _587;
        float _601 = _583 * 6.283185482025146484375;
        float _603 = cos(_601);
        float _605 = _563 * _591;
        float _607 = _577 * _591;
        float _609 = _595 * _597;
        float _611 = _603 * _605;
        float _613 = fma(_603, _607, _609);
        float _615 = _595 * _607;
        float _617 = -_611;
        float _619 = fma(_595, _599, _617);
        float _621 = _545 * _613;
        float _623 = _595 * _605;
        float _625 = -_615;
        float _627 = fma(_603, _597, _625);
        float _629 = fma(_535, _619, _621);
        float _631 = fma(_603, _599, _623);
        float _633 = fma(_549, _627, _629);
        float _635 = fma(_539, _631, _633);
        float _637 = precise::max(_635, -1.0);
        float _639 = precise::min(_637, 1.0);
        bool _641 = _639 >= 0.0;
        bool _643 = isnan(_639);
        bool _645 = _641 || _643;
        bool _647 = isnan(0.0);
        bool _649 = _645 || _647;
        bool _651 = !_649;
        float _653 = -_639;
        float _655 = _651 ? _653 : _639;
        bool _657 = _655 < 0.0;
        float _659 = float(_657);
        float _661 = abs(_655);
        float _663 = -_661;
        float _665 = _663 + 1.0;
        float _667 = abs(_655);
        float _669 = fma(_667, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _671 = as_type<int>(_665) + (-218103808);
        float _673 = abs(_655);
        float _675 = fma(_673, _669, -0.212114393711090087890625);
        bool _677 = uint(_671) >= 1920991232u;
        float _679 = abs(_655);
        float _681 = fma(_679, _675, 1.570728778839111328125);
        bool _683 = !_677;
        float _705;
        if (!_683)
        {
            int _685 = _671;
            int _687 = as_type<int>(_577);
            int _689 = as_type<int>(_665);
            int _691 = 2272;
            int _693;
            int _695;
            int _697;
            int _699;
            int _701;
            int _703;
            _54(_685, _687, _689, _691, _693, _695, _697, _699, _701, _703);
            _705 = as_type<float>(_697);
            _707 = true;
        }
        else
        {
            float _709 = rsqrt(_665);
            float _711 = _665 * _709;
            float _713 = _709 * 0.5;
            float _715 = -_711;
            float _717 = 0.0 + _715;
            float _719 = fma(_713, _717, 0.5);
            float _721 = fma(_711, _719, _711);
            float _723 = -_721;
            float _725 = 0.0 + _723;
            float _727 = fma(_721, _725, _665);
            float _729 = fma(_713, _727, _721);
            _705 = _729;
        }
        _707 = false;
        float _731 = _705;
        int _733 = _101 + 8;
        uint _735 = uint(int(uint(_733) >> uint(2)));
        uint _737 = uint(int(uint(int(_735)) >> uint(2)));
        int _739 = int(_735) & 3;
        float _741 = (*spvDescriptorSet0.cp_c5)._m0[int(_737)][_739];
        int _743 = int(_735) + 1;
        uint _745 = uint(int(uint(_743) >> uint(2)));
        int _747 = _743 & 3;
        float _749 = (*spvDescriptorSet0.cp_c5)._m0[int(_745)][_747];
        int _751 = _68;
        int _753 = 1;
        int _755 = _56(_751, _753, (*spvDescriptorSet0.support_buffer));
        int _757 = as_type<int>(_741);
        int _759 = 1;
        int _761 = _56(_757, _759, (*spvDescriptorSet0.support_buffer));
        int3 _2890 = int3(_755, _761, 0);
        float3 _763 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2890.xy), uint(_2890.z), 0).xyz;
        float _765 = _763.x;
        float _767 = _763.y;
        float _769 = _763.z;
        int _771 = _68;
        int _773 = 1;
        int _775 = _56(_771, _773, (*spvDescriptorSet0.support_buffer));
        int _777 = as_type<int>(_741);
        int _779 = 1;
        int _781 = _56(_777, _779, (*spvDescriptorSet0.support_buffer));
        int3 _2908 = int3(_775, _781, 2);
        float3 _783 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2908.xy), uint(_2908.z), 0).xyz;
        float _785 = _783.x;
        float _787 = _783.y;
        float _789 = _783.z;
        int _791 = _68;
        int _793 = 1;
        int _795 = _56(_791, _793, (*spvDescriptorSet0.support_buffer));
        int _797 = as_type<int>(_749);
        int _799 = 1;
        int _801 = _56(_797, _799, (*spvDescriptorSet0.support_buffer));
        int3 _2926 = int3(_795, _801, 0);
        float3 _803 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2926.xy), uint(_2926.z), 0).xyz;
        float _805 = _803.x;
        float _807 = _803.y;
        float _809 = _803.z;
        int _811 = _68;
        int _813 = 1;
        int _815 = _56(_811, _813, (*spvDescriptorSet0.support_buffer));
        int _817 = as_type<int>(_749);
        int _819 = 1;
        int _821 = _56(_817, _819, (*spvDescriptorSet0.support_buffer));
        int3 _2944 = int3(_815, _821, 2);
        float3 _823 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2944.xy), uint(_2944.z), 0).xyz;
        float _825 = _823.x;
        float _827 = _823.y;
        float _829 = _823.z;
        float _831 = _681 * _731;
        float _833 = _659 * 2.0;
        float _835 = -_833;
        float _837 = fma(_831, _835, _831);
        float _839 = fma(_659, 3.1415927410125732421875, _837);
        float _841 = _839 * 0.15915493667125701904296875;
        float _843 = _841 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = abs(_845);
        bool _849 = _847 >= 0.001000000047497451305389404296875;
        bool _851 = isnan(_847);
        bool _853 = _849 || _851;
        bool _855 = isnan(0.001000000047497451305389404296875);
        bool _857 = _853 || _855;
        float _859 = _659;
        float _861 = _837;
        if (!_857)
        {
            int _863 = _101 + 28;
            uint _865 = uint(int(uint(_863) >> uint(2)));
            uint _867 = uint(int(uint(int(_865)) >> uint(2)));
            int _869 = int(_865) & 3;
            float _871 = (*spvDescriptorSet0.cp_c5)._m0[int(_867)][_869];
            _859 = _871;
        }
        float _873 = _859;
        float _875 = 0.0;
        float _877 = _873;
        if (!_857)
        {
            float _879 = -_873;
            float _881 = _879 + 1.0;
            _875 = _881;
        }
        float _883 = _875;
        float _885 = _883;
        if (!_857)
        {
            _861 = _873;
        }
        float _887 = _861;
        bool _889 = !_857;
        float _891 = _887;
        if (!_889)
        {
            int _893 = _101 + 28;
            uint _895 = uint(int(uint(_893) >> uint(2)));
            uint _897 = uint(int(uint(int(_895)) >> uint(2)));
            int _899 = int(_895) & 3;
            float _901 = (*spvDescriptorSet0.cp_c5)._m0[int(_897)][_899];
            float _903 = 1.0 / _845;
            float _905 = _839 * _901;
            float _907 = _905 * 0.15915493667125701904296875;
            float _909 = -_905;
            float _911 = _839 + _909;
            float _913 = _911 * 0.15915493667125701904296875;
            float _915 = _907 * 6.283185482025146484375;
            float _917 = sin(_915);
            float _919 = _913 * 6.283185482025146484375;
            float _921 = sin(_919);
            float _923 = _917 * _903;
            float _925 = _921 * _903;
            _891 = _923;
            _885 = _925;
            _877 = _901;
        }
        float _927 = _891;
        float _929 = _885;
        float _931 = _877;
        bool _933 = !_649;
        float _935 = -_927;
        float _937 = _933 ? _935 : _927;
        float _939 = -_769;
        float _941 = _939 + _809;
        float _943 = -_789;
        float _945 = _943 + _829;
        float _947 = _619 * _937;
        float _949 = _631 * _937;
        float _951 = _613 * _937;
        float _953 = _627 * _937;
        float _955 = fma(_535, _929, _947);
        float _957 = fma(_539, _929, _949);
        int _959 = _101 + 24;
        uint _961 = uint(int(uint(_959) >> uint(2)));
        uint _963 = uint(int(uint(int(_961)) >> uint(2)));
        int _965 = int(_961) & 3;
        float _967 = (*spvDescriptorSet0.cp_c5)._m0[int(_963)][_965];
        float _969 = fma(_549, _929, _953);
        float _971 = fma(_545, _929, _951);
        float _973 = _957 * 2.0;
        float _975 = _955 * 2.0;
        float _977 = _971 * 2.0;
        float _979 = _955 * _973;
        int _981 = _101 + 20;
        uint _983 = uint(int(uint(_981) >> uint(2)));
        uint _985 = uint(int(uint(int(_983)) >> uint(2)));
        int _987 = int(_983) & 3;
        float _989 = (*spvDescriptorSet0.cp_c5)._m0[int(_985)][_987];
        float _991 = _969 * _973;
        float _993 = _971 * _973;
        float _995 = -_979;
        float _997 = fma(_969, _977, _995);
        float _999 = _955 * _955;
        float _1001 = -_991;
        float _1003 = fma(_971, _975, _1001);
        float _1005 = fma(_971, _975, _991);
        float _1007 = _971 * _971;
        float _1009 = fma(_969, _977, _979);
        float _1011 = -_765;
        float _1013 = _1011 + _805;
        float _1015 = -_767;
        float _1017 = _1015 + _807;
        float _1019 = fma(_969, _975, _993);
        float _1021 = -_993;
        float _1023 = fma(_969, _975, _1021);
        float _1025 = _969 * _969;
        float _1027 = fma(_1007, -2.0, 1.0);
        float _1029 = fma(_999, -2.0, 1.0);
        float _1031 = fma(_941, _967, _769);
        float _1033 = -_785;
        float _1035 = _1033 + _825;
        float _1037 = -_787;
        float _1039 = _1037 + _827;
        float _1041 = fma(_1013, _967, _765);
        float _1043 = fma(_1017, _967, _767);
        float _1045 = fma(_1035, _967, _785);
        float _1047 = fma(_1039, _967, _787);
        float _1049 = fma(_945, _967, _789);
        float _1051 = _1031 * _931;
        float _1053 = _1041 * _931;
        float _1055 = _1043 * _931;
        float _1057 = _1045 * _931;
        float _1059 = _1047 * _931;
        float _1061 = _1049 * _931;
        float _1063 = fma(_1025, -2.0, _1027);
        float _1065 = fma(_1025, -2.0, _1029);
        float _1067 = fma(_395, _989, _1051);
        float _1069 = fma(_1007, -2.0, _1029);
        float _1071 = fma(_397, _989, _1053);
        float _1073 = fma(_399, _989, _1055);
        float _1075 = fma(_401, _989, _1057);
        float _1077 = fma(_403, _989, _1059);
        float _1079 = fma(_405, _989, _1061);
        _409 = _1071;
        _1081 = _1063;
        _1083 = _1005;
        _1085 = _1023;
        _411 = _1073;
        _1087 = _1009;
        _1089 = _1003;
        _1091 = _1065;
        _413 = _1067;
        _1093 = _1019;
        _1095 = _997;
        _1097 = _1069;
        _1099 = _1079;
        _1101 = _1077;
        _1103 = _1075;
        _1105 = true;
    }
    else
    {
        float _1107 = _393 * 0.15915493667125701904296875;
        float _1109 = _389 * 0.15915493667125701904296875;
        float _1111 = _391 * 0.15915493667125701904296875;
        float _1113 = _1107 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1107 * 6.283185482025146484375;
        float _1119 = cos(_1117);
        float _1121 = _1109 * 6.283185482025146484375;
        float _1123 = sin(_1121);
        float _1125 = _1111 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = _1109 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = _1123 * _1119;
        float _1135 = _1111 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1115 * _1127;
        float _1141 = -_1127;
        float _1143 = _1141 + (-0.0);
        float _1145 = _1119 * _1131;
        float _1147 = -_1133;
        float _1149 = fma(_1131, _1139, _1147);
        float _1151 = fma(_1123, _1139, _1145);
        float _1153 = _1119 * _1137;
        float _1155 = _1137 * _1131;
        float _1157 = _1123 * _1137;
        float _1159 = _1115 * _1137;
        float _1161 = _1115 * _1123;
        float _1163 = _1115 * _1131;
        float _1165 = fma(_1127, _1145, _1161);
        float _1167 = -_1163;
        float _1169 = fma(_1127, _1133, _1167);
        _1081 = _1155;
        _1083 = _1157;
        _1085 = _1143;
        _1087 = _1159;
        _1089 = _1149;
        _1091 = _1151;
        _1093 = _1165;
        _1095 = _1169;
        _1097 = _1153;
        _1099 = _405;
        _1101 = _403;
        _1103 = _401;
    }
    _1105 = false;
    float _1171 = _409;
    float _1173 = _1081;
    float _1175 = _1083;
    float _1177 = _1085;
    float _1179 = _411;
    float _1181 = _1087;
    float _1183 = _1089;
    float _1185 = _1091;
    float _1187 = _413;
    float _1189 = _1093;
    float _1191 = _1095;
    float _1193 = _1097;
    float _1195 = _1099;
    float _1197 = _1101;
    float _1199 = _1103;
    bool _1201 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _1203 = _1171 * _1173;
    float _1205 = _1171 * _1175;
    float _1207 = _1171 * _1177;
    float _1209 = _1179 * _1181;
    float _1211 = _1179 * _1183;
    float _1213 = _1179 * _1185;
    float _1215 = _1187 * _1189;
    float _1217 = _1187 * _1191;
    float _1219 = _1187 * _1193;
    int _1221 = _68 * 112;
    bool _1223 = !_1201;
    float _1225 = _1215;
    float _1543;
    float _1545;
    float _1547;
    float _1549;
    float _1551;
    float _1553;
    float _1555;
    float _1557;
    float _1559;
    float _1561;
    float _1563;
    if (!_1223)
    {
        int _1227 = 0;
        float _1229 = _1203;
        float _1231 = _1211;
        float _1233 = _1215;
        float _1235 = _1199;
        float _1237 = _1205;
        float _1239 = _1213;
        float _1241 = _1217;
        float _1243 = _1197;
        float _1245 = _1207;
        float _1247 = _1209;
        float _1249 = _1219;
        float _1251 = _1195;
        bool _1253;
        int _1301;
        int _1311;
        int _1321;
        int _1331;
        int _1341;
        int _1351;
        int _1361;
        int _1371;
        int _1381;
        int _1391;
        int _1401;
        int _1411;
        int _1523;
        int _1525;
        int _1527;
        int _1529;
        int _1531;
        int _1533;
        float _1537;
        int _1539;
        int _1541;
        do
        {
            int _1255 = _1227;
            int _1257 = as_type<int>(_1229);
            int _1259 = as_type<int>(_1231);
            int _1261 = as_type<int>(_1233);
            int _1263 = as_type<int>(_1235);
            int _1265 = as_type<int>(_1237);
            int _1267 = as_type<int>(_1239);
            int _1269 = as_type<int>(_1241);
            int _1271 = as_type<int>(_1243);
            int _1273 = as_type<int>(_1245);
            float _1275 = _1247;
            int _1277 = as_type<int>(_1249);
            int _1279 = as_type<int>(_1251);
            uint _1281 = uint(int(uint(_1221) >> uint(2)));
            uint _1283 = uint(int(uint(int(_1281)) >> uint(2)));
            int _1285 = int(_1281) & 3;
            float _1287 = (*spvDescriptorSet0.cp_c6)._m0[int(_1283)][_1285];
            bool _1289 = _68 != 0;
            int _1291 = _1255 + 1;
            bool _1293 = uint(_1291) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1295 = _1257;
            int _1297 = as_type<int>(_1287);
            int _1299 = 31;
            int _3559 = _58(_1295, _1297, _1299, _1301, gl_SubgroupInvocationID);
            int _1303 = _3559;
            int _1305 = _1259;
            int _1307 = as_type<int>(_1287);
            int _1309 = 31;
            int _3563 = _58(_1305, _1307, _1309, _1311, gl_SubgroupInvocationID);
            int _1313 = _3563;
            int _1315 = _1261;
            int _1317 = as_type<int>(_1287);
            int _1319 = 31;
            int _3567 = _58(_1315, _1317, _1319, _1321, gl_SubgroupInvocationID);
            int _1323 = _3567;
            int _1325 = _1263;
            int _1327 = as_type<int>(_1287);
            int _1329 = 31;
            int _3571 = _58(_1325, _1327, _1329, _1331, gl_SubgroupInvocationID);
            int _1333 = _3571;
            int _1335 = _1265;
            int _1337 = as_type<int>(_1287);
            int _1339 = 31;
            int _3575 = _58(_1335, _1337, _1339, _1341, gl_SubgroupInvocationID);
            int _1343 = _3575;
            int _1345 = _1267;
            int _1347 = as_type<int>(_1287);
            int _1349 = 31;
            int _3579 = _58(_1345, _1347, _1349, _1351, gl_SubgroupInvocationID);
            int _1353 = _3579;
            int _1355 = _1269;
            int _1357 = as_type<int>(_1287);
            int _1359 = 31;
            int _3583 = _58(_1355, _1357, _1359, _1361, gl_SubgroupInvocationID);
            int _1363 = _3583;
            int _1365 = _1271;
            int _1367 = as_type<int>(_1287);
            int _1369 = 31;
            int _3587 = _58(_1365, _1367, _1369, _1371, gl_SubgroupInvocationID);
            int _1373 = _3587;
            int _1375 = _1273;
            int _1377 = as_type<int>(_1287);
            int _1379 = 31;
            int _3591 = _58(_1375, _1377, _1379, _1381, gl_SubgroupInvocationID);
            int _1383 = _3591;
            int _1385 = as_type<int>(_1275);
            int _1387 = as_type<int>(_1287);
            int _1389 = 31;
            int _3596 = _58(_1385, _1387, _1389, _1391, gl_SubgroupInvocationID);
            int _1393 = _3596;
            int _1395 = _1277;
            int _1397 = as_type<int>(_1287);
            int _1399 = 31;
            int _3600 = _58(_1395, _1397, _1399, _1401, gl_SubgroupInvocationID);
            int _1403 = _3600;
            int _1405 = _1279;
            int _1407 = as_type<int>(_1287);
            int _1409 = 31;
            int _3604 = _58(_1405, _1407, _1409, _1411, gl_SubgroupInvocationID);
            int _1413 = _3604;
            bool _1415 = !_1289;
            _1227 = _1291;
            int _1417 = _1257;
            int _1419 = _1259;
            int _1421 = _1261;
            int _1423 = _1263;
            int _1425 = _1265;
            int _1427 = _1267;
            int _1429 = _1269;
            int _1431 = _1271;
            int _1433 = _1273;
            float _1435 = _1275;
            int _1437 = _1277;
            int _1439 = _1279;
            if (!_1415)
            {
                float _1441 = _1205 * as_type<float>(_1313);
                float _1443 = _1217 * as_type<float>(_1313);
                float _1445 = as_type<float>(_1313) * _1197;
                float _1447 = _1205 * as_type<float>(_1353);
                float _1449 = fma(_1203, as_type<float>(_1303), _1441);
                float _1451 = _1213 * as_type<float>(_1313);
                float _1453 = fma(_1215, as_type<float>(_1303), _1443);
                float _1455 = fma(as_type<float>(_1303), _1199, _1445);
                float _1457 = _1213 * as_type<float>(_1353);
                float _1459 = _1217 * as_type<float>(_1353);
                float _1461 = as_type<float>(_1353) * _1197;
                float _1463 = fma(_1203, as_type<float>(_1343), _1447);
                float _1465 = as_type<float>(_1393) * _1197;
                float _1467 = _1205 * as_type<float>(_1393);
                float _1469 = fma(_1211, as_type<float>(_1303), _1451);
                float _1471 = fma(_1211, as_type<float>(_1343), _1457);
                float _1473 = fma(_1215, as_type<float>(_1343), _1459);
                float _1475 = fma(as_type<float>(_1343), _1199, _1461);
                float _1477 = _1213 * as_type<float>(_1393);
                float _1479 = _1217 * as_type<float>(_1393);
                float _1481 = fma(as_type<float>(_1383), _1199, _1465);
                float _1483 = fma(_1203, as_type<float>(_1383), _1467);
                float _1485 = fma(_1207, as_type<float>(_1323), _1449);
                float _1487 = fma(as_type<float>(_1323), _1195, _1455);
                float _1489 = fma(_1207, as_type<float>(_1363), _1463);
                float _1491 = fma(_1209, as_type<float>(_1363), _1471);
                float _1493 = fma(_1219, as_type<float>(_1363), _1473);
                float _1495 = fma(_1211, as_type<float>(_1383), _1477);
                float _1497 = fma(_1215, as_type<float>(_1383), _1479);
                float _1499 = fma(as_type<float>(_1363), _1195, _1475);
                float _1501 = fma(as_type<float>(_1403), _1195, _1481);
                float _1503 = fma(_1209, as_type<float>(_1323), _1469);
                float _1505 = fma(_1219, as_type<float>(_1323), _1453);
                float _1507 = as_type<float>(_1333) + _1487;
                float _1509 = fma(_1207, as_type<float>(_1403), _1483);
                float _1511 = fma(_1209, as_type<float>(_1403), _1495);
                float _1513 = fma(_1219, as_type<float>(_1403), _1497);
                float _1515 = as_type<float>(_1373) + _1499;
                float _1517 = as_type<float>(_1413) + _1501;
                _1417 = as_type<int>(_1485);
                _1419 = as_type<int>(_1503);
                _1421 = as_type<int>(_1505);
                _1423 = as_type<int>(_1507);
                _1425 = as_type<int>(_1489);
                _1427 = as_type<int>(_1491);
                _1429 = as_type<int>(_1493);
                _1431 = as_type<int>(_1515);
                _1433 = as_type<int>(_1509);
                _1435 = _1511;
                _1437 = as_type<int>(_1513);
                _1439 = as_type<int>(_1517);
            }
            int _1519 = _1417;
            int _1521 = _1419;
            _1523 = _1421;
            _1525 = _1423;
            _1527 = _1425;
            _1529 = _1427;
            _1531 = _1429;
            _1533 = _1431;
            int _1535 = _1433;
            _1537 = _1435;
            _1539 = _1437;
            _1541 = _1439;
            _1253 = !_1293;
            _1229 = as_type<float>(_1519);
            _1231 = as_type<float>(_1521);
            _1233 = as_type<float>(_1523);
            _1235 = as_type<float>(_1525);
            _1237 = as_type<float>(_1527);
            _1239 = as_type<float>(_1529);
            _1241 = as_type<float>(_1531);
            _1243 = as_type<float>(_1533);
            _1245 = as_type<float>(_1535);
            _1247 = _1537;
            _1249 = as_type<float>(_1539);
            _1251 = as_type<float>(_1541);
            _1543 = as_type<float>(_1521);
            _1545 = as_type<float>(_1519);
            _1547 = as_type<float>(_1535);
        } while (_1253);
        _1549 = as_type<float>(_1529);
        _1551 = _1537;
        _1553 = as_type<float>(_1527);
        _1555 = as_type<float>(_1531);
        _1225 = as_type<float>(_1523);
        _1557 = as_type<float>(_1539);
        _1559 = as_type<float>(_1533);
        _1561 = as_type<float>(_1541);
        _1563 = as_type<float>(_1525);
        _1565 = true;
    }
    else
    {
        _1543 = _1211;
        _1549 = _1213;
        _1551 = _1209;
        _1545 = _1203;
        _1553 = _1205;
        _1547 = _1207;
        _1555 = _1217;
        _1557 = _1219;
        _1559 = _1197;
        _1561 = _1195;
        _1563 = _1199;
    }
    _1565 = false;
    float _1567 = _1543;
    float _1569 = _1549;
    float _1571 = _1551;
    float _1573 = _1545;
    float _1575 = _1553;
    float _1577 = _1547;
    float _1579 = _1555;
    float _1581 = _1225;
    float _1583 = _1557;
    float _1585 = _1559;
    float _1587 = _1561;
    float _1589 = _1563;
    int _1591 = _1221 + 80;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.cp_c6)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.cp_c6)._m0[int(_1603)][_1605];
    int _1609 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1611 = _1609 + _68;
    int _1613 = _1221 + 64;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    uint _1617 = uint(int(uint(int(_1615)) >> uint(2)));
    int _1619 = int(_1615) & 3;
    float _1621 = (*spvDescriptorSet0.cp_c6)._m0[int(_1617)][_1619];
    int _1623 = int(_1615) + 1;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    int _1627 = _1623 & 3;
    float _1629 = (*spvDescriptorSet0.cp_c6)._m0[int(_1625)][_1627];
    int _1631 = _1611 * 48;
    int _1633 = _1221 + 88;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    uint _1637 = uint(int(uint(int(_1635)) >> uint(2)));
    int _1639 = int(_1635) & 3;
    float _1641 = (*spvDescriptorSet0.cp_c6)._m0[int(_1637)][_1639];
    int _1643 = int(_1635) + 1;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    int _1647 = _1643 & 3;
    float _1649 = (*spvDescriptorSet0.cp_c6)._m0[int(_1645)][_1647];
    int _1651 = _1221 + 72;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    uint _1655 = uint(int(uint(int(_1653)) >> uint(2)));
    int _1657 = int(_1653) & 3;
    float _1659 = (*spvDescriptorSet0.cp_c6)._m0[int(_1655)][_1657];
    int _1661 = int(_1653) + 1;
    uint _1663 = uint(int(uint(_1661) >> uint(2)));
    int _1665 = _1661 & 3;
    float _1667 = (*spvDescriptorSet0.cp_c6)._m0[int(_1663)][_1665];
    int _1669 = _1221 + 104;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    uint _1673 = uint(int(uint(int(_1671)) >> uint(2)));
    int _1675 = int(_1671) & 3;
    float _1677 = (*spvDescriptorSet0.cp_c6)._m0[int(_1673)][_1675];
    int _1679 = int(_1671) + 1;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    int _1683 = _1679 & 3;
    float _1685 = (*spvDescriptorSet0.cp_c6)._m0[int(_1681)][_1683];
    int _1687 = _1221 + 96;
    uint _1689 = uint(int(uint(_1687) >> uint(2)));
    uint _1691 = uint(int(uint(int(_1689)) >> uint(2)));
    int _1693 = int(_1689) & 3;
    float _1695 = (*spvDescriptorSet0.cp_c6)._m0[int(_1691)][_1693];
    int _1697 = int(_1689) + 1;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    int _1701 = _1697 & 3;
    float _1703 = (*spvDescriptorSet0.cp_c6)._m0[int(_1699)][_1701];
    float _1705 = _1567 * _1599;
    float _1707 = _1569 * _1599;
    float _1709 = _1571 * _1599;
    float _1711 = _1567 * _1607;
    float _1713 = _1571 * _1607;
    int _1715 = _1221 + 16;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    uint _1719 = uint(int(uint(int(_1717)) >> uint(2)));
    int _1721 = int(_1717) & 3;
    float _1723 = (*spvDescriptorSet0.cp_c6)._m0[int(_1719)][_1721];
    int _1725 = int(_1717) + 1;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    int _1729 = _1725 & 3;
    float _1731 = (*spvDescriptorSet0.cp_c6)._m0[int(_1727)][_1729];
    float _1733 = fma(_1573, _1621, _1705);
    float _1735 = fma(_1575, _1621, _1707);
    float _1737 = fma(_1577, _1621, _1709);
    float _1739 = _1569 * _1607;
    float _1741 = fma(_1573, _1629, _1711);
    int _1743 = _1221 + 32;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    uint _1747 = uint(int(uint(int(_1745)) >> uint(2)));
    int _1749 = int(_1745) & 3;
    float _1751 = (*spvDescriptorSet0.cp_c6)._m0[int(_1747)][_1749];
    int _1753 = int(_1745) + 1;
    uint _1755 = uint(int(uint(_1753) >> uint(2)));
    int _1757 = _1753 & 3;
    float _1759 = (*spvDescriptorSet0.cp_c6)._m0[int(_1755)][_1757];
    float _1761 = fma(_1577, _1629, _1713);
    float _1763 = fma(_1575, _1629, _1739);
    float _1765 = _1567 * _1641;
    float _1767 = _1567 * _1649;
    float _1769 = _1569 * _1641;
    float _1771 = _1569 * _1649;
    float _1773 = _1571 * _1641;
    int _1775 = _1221 + 48;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    uint _1779 = uint(int(uint(int(_1777)) >> uint(2)));
    int _1781 = int(_1777) & 3;
    float _1783 = (*spvDescriptorSet0.cp_c6)._m0[int(_1779)][_1781];
    int _1785 = int(_1777) + 1;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    int _1789 = _1785 & 3;
    float _1791 = (*spvDescriptorSet0.cp_c6)._m0[int(_1787)][_1789];
    float _1793 = _1571 * _1649;
    float _1795 = fma(_1573, _1659, _1765);
    float _1797 = fma(_1573, _1667, _1767);
    float _1799 = fma(_1575, _1659, _1769);
    float _1801 = fma(_1575, _1667, _1771);
    float _1803 = fma(_1577, _1659, _1773);
    int _1805 = _1221 + 24;
    uint _1807 = uint(int(uint(_1805) >> uint(2)));
    uint _1809 = uint(int(uint(int(_1807)) >> uint(2)));
    int _1811 = int(_1807) & 3;
    float _1813 = (*spvDescriptorSet0.cp_c6)._m0[int(_1809)][_1811];
    int _1815 = int(_1807) + 1;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    int _1819 = _1815 & 3;
    float _1821 = (*spvDescriptorSet0.cp_c6)._m0[int(_1817)][_1819];
    float _1823 = fma(_1577, _1667, _1793);
    float _1825 = fma(_1579, _1685, _1801);
    float _1827 = fma(_1581, _1685, _1797);
    float _1829 = fma(_1583, _1685, _1823);
    float _1831 = _1825 + _1585;
    int _1833 = _1221 + 40;
    uint _1835 = uint(int(uint(_1833) >> uint(2)));
    uint _1837 = uint(int(uint(int(_1835)) >> uint(2)));
    int _1839 = int(_1835) & 3;
    float _1841 = (*spvDescriptorSet0.cp_c6)._m0[int(_1837)][_1839];
    int _1843 = int(_1835) + 1;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    int _1847 = _1843 & 3;
    float _1849 = (*spvDescriptorSet0.cp_c6)._m0[int(_1845)][_1847];
    float _1851 = _1829 + _1587;
    float _1853 = _1827 + _1589;
    float _1855 = fma(_1581, _1695, _1733);
    float _1857 = fma(_1581, _1703, _1741);
    float _1859 = fma(_1581, _1677, _1795);
    float _1861 = fma(_1579, _1695, _1735);
    float _1863 = fma(_1579, _1703, _1763);
    int _1865 = _1221 + 56;
    uint _1867 = uint(int(uint(_1865) >> uint(2)));
    uint _1869 = uint(int(uint(int(_1867)) >> uint(2)));
    int _1871 = int(_1867) & 3;
    float _1873 = (*spvDescriptorSet0.cp_c6)._m0[int(_1869)][_1871];
    int _1875 = int(_1867) + 1;
    uint _1877 = uint(int(uint(_1875) >> uint(2)));
    int _1879 = _1875 & 3;
    float _1881 = (*spvDescriptorSet0.cp_c6)._m0[int(_1877)][_1879];
    float _1883 = fma(_1579, _1677, _1799);
    float _1885 = fma(_1583, _1695, _1737);
    float _1887 = fma(_1583, _1703, _1761);
    float _1889 = fma(_1583, _1677, _1803);
    float _1891 = _1861 * _1731;
    float _1893 = _1863 * _1731;
    float _1895 = _1883 * _1731;
    float _1897 = _1831 * _1731;
    float _1899 = fma(_1855, _1723, _1891);
    float _1901 = fma(_1857, _1723, _1893);
    float _1903 = fma(_1859, _1723, _1895);
    float _1905 = fma(_1853, _1723, _1897);
    float _1907 = _1831 * _1759;
    float _1909 = _1861 * _1759;
    float _1911 = _1863 * _1759;
    float _1913 = _1883 * _1759;
    float _1915 = fma(_1853, _1751, _1907);
    float _1917 = fma(_1855, _1751, _1909);
    float _1919 = fma(_1857, _1751, _1911);
    float _1921 = fma(_1859, _1751, _1913);
    float _1923 = _1831 * _1791;
    float _1925 = _1861 * _1791;
    float _1927 = _1863 * _1791;
    float _1929 = _1883 * _1791;
    float _1931 = fma(_1853, _1783, _1923);
    float _1933 = fma(_1855, _1783, _1925);
    float _1935 = fma(_1857, _1783, _1927);
    float _1937 = fma(_1859, _1783, _1929);
    float _1939 = fma(_1851, _1813, _1905);
    float _1941 = fma(_1885, _1813, _1899);
    float _1943 = fma(_1887, _1813, _1901);
    float _1945 = fma(_1889, _1813, _1903);
    float _1947 = _1939 + _1821;
    float _1949 = fma(_1851, _1841, _1915);
    float _1951 = fma(_1885, _1841, _1917);
    float _1953 = fma(_1887, _1841, _1919);
    int _1955 = _1631 + 16;
    float _1957 = fma(_1889, _1841, _1921);
    float _1959 = _1949 + _1849;
    int _1961 = _1631 + 32;
    float _1963 = fma(_1851, _1873, _1931);
    float _1965 = fma(_1885, _1873, _1933);
    float _1967 = fma(_1887, _1873, _1935);
    float _1969 = fma(_1889, _1873, _1937);
    float _1971 = _1963 + _1881;
    int _1973 = _1631 + 48;
    uint _1975 = uint(int(uint(_1955) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1975)] = as_type<uint>(_1941);
    int _1977 = _1955 + 4;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1979)] = as_type<uint>(_1943);
    int _1981 = _1955 + 8;
    uint _1983 = uint(int(uint(_1981) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1983)] = as_type<uint>(_1945);
    int _1985 = _1955 + 12;
    uint _1987 = uint(int(uint(_1985) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1987)] = as_type<uint>(_1947);
    uint _1989 = uint(int(uint(_1961) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1989)] = as_type<uint>(_1951);
    int _1991 = _1961 + 4;
    uint _1993 = uint(int(uint(_1991) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1993)] = as_type<uint>(_1953);
    int _1995 = _1961 + 8;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1997)] = as_type<uint>(_1957);
    int _1999 = _1961 + 12;
    uint _2001 = uint(int(uint(_1999) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2001)] = as_type<uint>(_1959);
    uint _2003 = uint(int(uint(_1973) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2003)] = as_type<uint>(_1965);
    int _2005 = _1973 + 4;
    uint _2007 = uint(int(uint(_2005) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2007)] = as_type<uint>(_1967);
    int _2009 = _1973 + 8;
    uint _2011 = uint(int(uint(_2009) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2011)] = as_type<uint>(_1969);
    int _2013 = _1973 + 12;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2015)] = as_type<uint>(_1971);
}

