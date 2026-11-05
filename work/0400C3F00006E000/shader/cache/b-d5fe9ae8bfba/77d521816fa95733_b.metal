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
int _58(thread const int& _5173, thread const int& _5174, constant _10& support_buffer)
{
    int _5177 = 1 + _5174;
    float _5179 = support_buffer._m5[_5177].x;
    bool _5181 = _5179 == 1.0;
    if (_5181)
    {
        return _5173;
    }
    float _5183 = float(_5173);
    float _5185 = _5183 * _5179;
    int _5187 = int(_5185);
    return _5187;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4865, thread const int& _4866, thread const int& _4867, thread const int& _4868, thread int& _4869, thread int& _4870, thread int& _4871, thread int& _4872, thread int& _4873, thread int& _4874)
{
    float _4877 = as_type<float>(_4867) + 0.0;
    bool _4879 = _4877 != 0.0;
    bool _4881 = isnan(_4877);
    bool _4883 = _4879 || _4881;
    bool _4885 = isnan(0.0);
    bool _4887 = _4883 || _4885;
    int _4889 = _4865;
    int _4891 = _4866;
    int _4893 = _4867;
    int _4895 = _4887 ? (-1) : 0;
    if (!_4887)
    {
        float _4897 = as_type<float>(_4867) * 1.0;
        _4889 = as_type<int>(_4897);
    }
    int _4899 = _4889;
    bool _4901 = !_4887;
    int _4903 = _4899;
    int _4905 = _4899;
    if (!_4901)
    {
        float _4907 = as_type<float>(_4867) + 0.0;
        bool _4909 = _4907 >= 0.0;
        bool _4911 = isnan(_4907);
        bool _4913 = _4909 || _4911;
        bool _4915 = isnan(0.0);
        bool _4917 = _4913 || _4915;
        _4895 = _4917 ? (-1) : 0;
        if (!_4917)
        {
            _4903 = 2147483647;
        }
        int _4919 = _4903;
        bool _4921 = !_4917;
        int _4923 = _4919;
        _4905 = _4919;
        if (!_4921)
        {
            float _4925 = as_type<float>(_4867) + 0.0;
            bool _4927 = _4925 > as_type<float>(0x7f800000u /* inf */);
            bool _4929 = isnan(_4925);
            bool _4931 = _4927 || _4929;
            bool _4933 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4935 = _4931 || _4933;
            _4895 = _4935 ? (-1) : 0;
            if (_4935)
            {
                float _4937 = as_type<float>(_4867) + 1.0;
                _4923 = as_type<int>(_4937);
            }
            int _4939 = _4923;
            int _4941 = _4939;
            _4905 = _4939;
            if (!_4935)
            {
                float _4943 = 0.0 + as_type<float>(_4867);
                bool _4945 = _4943 != as_type<float>(0x7f800000u /* inf */);
                bool _4947 = isnan(_4943);
                bool _4949 = _4945 || _4947;
                bool _4951 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4953 = _4949 || _4951;
                _4895 = _4953 ? (-1) : 0;
                if (!_4953)
                {
                    _4941 = _4867;
                }
                int _4955 = _4941;
                bool _4957 = !_4953;
                _4905 = _4955;
                if (!_4957)
                {
                    float _4959 = as_type<float>(_4867) * 18446744073709551616.0;
                    float _4961 = rsqrt(_4959);
                    float _4963 = _4959 * _4961;
                    float _4965 = _4961 * 0.5;
                    float _4967 = -_4963;
                    float _4969 = 0.0 + _4967;
                    float _4971 = fma(_4965, _4969, 0.5);
                    float _4973 = fma(_4963, _4971, _4963);
                    float _4975 = -_4973;
                    float _4977 = 0.0 + _4975;
                    float _4979 = fma(_4973, _4977, _4959);
                    float _4981 = fma(_4965, _4979, _4973);
                    float _4983 = _4981 * 2.3283064365386962890625e-10;
                    _4905 = as_type<int>(_4983);
                    _4891 = as_type<int>(_4973);
                    _4893 = as_type<int>(_4969);
                }
            }
        }
    }
    int _4985 = _4905;
    int _4987 = _4891;
    int _4989 = _4893;
    int _4991 = _4895;
    _4869 = _4868;
    _4870 = 0;
    _4871 = _4985;
    _4872 = _4987;
    _4873 = _4989;
    _4874 = _4991;
}

static inline __attribute__((always_inline))
int _60(thread const int& _5208, thread const int& _5209, thread const int& _5210, thread int& _5211, thread uint& gl_SubgroupInvocationID)
{
    int _5214 = _5210 & 31;
    uint _5216 = uint(int(uint(_5210) >> uint(8)));
    int _5218 = int(_5216) & 31;
    float _5220 = as_type<float>(gl_SubgroupInvocationID);
    int _5222 = as_type<int>(_5220) & _5218;
    int _5224 = ~_5218;
    int _5226 = _5214 & _5224;
    int _5228 = _5226 | _5222;
    int _5230 = ~_5218;
    int _5232 = _5209 & _5230;
    int _5234 = _5232 | _5222;
    bool _5236 = uint(_5234) <= uint(_5228);
    _5211 = _5236 ? (-1) : 0;
    float _5238 = spvSubgroupShuffle(as_type<float>(_5208), uint(_5234));
    uint _5240 = uint(_5236 ? as_type<int>(_5238) : _5208);
    return int(_5240);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1567 = false;
    bool _1107 = false;
    bool _707 = false;
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
    float _133 = _101;
    if (!_127)
    {
        _133 = 0.0;
    }
    float _135 = _133;
    float _137 = 0.0;
    float _139 = 0.0;
    float _141 = _135;
    if (!_127)
    {
        _137 = 0.0;
        _139 = 0.0;
    }
    float _143 = _137;
    float _145 = _139;
    float _147 = 0.0;
    float _149 = _143;
    float _151 = _145;
    if (!_127)
    {
        _147 = 0.0;
    }
    float _153 = _147;
    float _155 = 0.0;
    float _157 = 0.0;
    float _159 = _153;
    if (!_127)
    {
        _155 = 0.0;
        _157 = 0.0;
    }
    float _161 = _155;
    float _163 = _157;
    float _165 = 0.0;
    float _167 = _163;
    float _169 = _161;
    if (!_127)
    {
        _165 = 0.0;
    }
    float _171 = _165;
    float _173 = 0.0;
    float _175 = 0.0;
    float _177 = _171;
    if (!_127)
    {
        _173 = 0.0;
        _175 = 0.0;
    }
    float _179 = _173;
    float _181 = _175;
    bool _183 = !_127;
    float _185 = _179;
    float _187 = _181;
    if (!_183)
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
        int _209 = _58(_205, _207, (*spvDescriptorSet0.support_buffer));
        int _211 = as_type<int>(_195);
        int _213 = 0;
        int _215 = _58(_211, _213, (*spvDescriptorSet0.support_buffer));
        int3 _2277 = int3(_209, _215, 1);
        float3 _219 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2277.xy), uint(_2277.z), 0).xyz;
        float _221 = _219.x;
        float _223 = _219.y;
        float _225 = _219.z;
        int _227 = _70;
        int _229 = 0;
        int _231 = _58(_227, _229, (*spvDescriptorSet0.support_buffer));
        int _233 = as_type<int>(_203);
        int _235 = 0;
        int _237 = _58(_233, _235, (*spvDescriptorSet0.support_buffer));
        int3 _2295 = int3(_231, _237, 1);
        float3 _239 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2295.xy), uint(_2295.z), 0).xyz;
        float _241 = _239.x;
        float _243 = _239.y;
        float _245 = _239.z;
        int _247 = _70;
        int _249 = 0;
        int _251 = _58(_247, _249, (*spvDescriptorSet0.support_buffer));
        int _253 = as_type<int>(_195);
        int _255 = 0;
        int _257 = _58(_253, _255, (*spvDescriptorSet0.support_buffer));
        int3 _2313 = int3(_251, _257, 0);
        float3 _259 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2313.xy), uint(_2313.z), 0).xyz;
        float _261 = _259.x;
        float _263 = _259.y;
        float _265 = _259.z;
        int _267 = _70;
        int _269 = 0;
        int _271 = _58(_267, _269, (*spvDescriptorSet0.support_buffer));
        int _273 = as_type<int>(_203);
        int _275 = 0;
        int _277 = _58(_273, _275, (*spvDescriptorSet0.support_buffer));
        int3 _2331 = int3(_271, _277, 0);
        float3 _279 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2331.xy), uint(_2331.z), 0).xyz;
        float _281 = _279.x;
        float _283 = _279.y;
        float _285 = _279.z;
        int _287 = _70;
        int _289 = 0;
        int _291 = _58(_287, _289, (*spvDescriptorSet0.support_buffer));
        int _293 = as_type<int>(_195);
        int _295 = 0;
        int _297 = _58(_293, _295, (*spvDescriptorSet0.support_buffer));
        int3 _2349 = int3(_291, _297, 2);
        float3 _299 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2349.xy), uint(_2349.z), 0).xyz;
        float _301 = _299.x;
        float _303 = _299.y;
        float _305 = _299.z;
        int _307 = _70;
        int _309 = 0;
        int _311 = _58(_307, _309, (*spvDescriptorSet0.support_buffer));
        int _313 = as_type<int>(_203);
        int _315 = 0;
        int _317 = _58(_313, _315, (*spvDescriptorSet0.support_buffer));
        int3 _2367 = int3(_311, _317, 2);
        float3 _319 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2367.xy), uint(_2367.z), 0).xyz;
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
        float _351 = -_261;
        float _353 = _351 + _281;
        float _355 = -_263;
        float _357 = _355 + _283;
        float _359 = -_265;
        float _361 = _359 + _285;
        float _363 = fma(_349, _335, _223);
        float _365 = fma(_343, _335, _225);
        float _367 = fma(_357, _335, _263);
        float _369 = -_301;
        float _371 = _369 + _321;
        float _373 = -_303;
        float _375 = _373 + _323;
        float _377 = -_305;
        float _379 = _377 + _325;
        float _381 = fma(_353, _335, _261);
        float _383 = fma(_361, _335, _265);
        float _385 = fma(_371, _335, _301);
        float _387 = fma(_375, _335, _303);
        float _389 = fma(_379, _335, _305);
        _185 = _365;
        _187 = _363;
        _177 = _345;
        _159 = _367;
        _141 = _381;
        _149 = _383;
        _151 = _385;
        _167 = _387;
        _169 = _389;
    }
    float _391 = _185;
    float _393 = _187;
    float _395 = _177;
    float _397 = _159;
    float _399 = _141;
    float _401 = _149;
    float _403 = _151;
    float _405 = _167;
    float _407 = _169;
    bool _409 = !_131;
    float _411 = _399;
    float _413 = _407;
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
    float _1105;
    if (!_409)
    {
        int _415 = _103 + 8;
        uint _417 = uint(int(uint(_415) >> uint(2)));
        uint _419 = uint(int(uint(int(_417)) >> uint(2)));
        int _421 = int(_417) & 3;
        float _423 = (*spvDescriptorSet0.cp_c5)._m0[int(_419)][_421];
        int _425 = int(_417) + 1;
        uint _427 = uint(int(uint(_425) >> uint(2)));
        int _429 = _425 & 3;
        float _431 = (*spvDescriptorSet0.cp_c5)._m0[int(_427)][_429];
        int _433 = _70;
        int _435 = 1;
        int _437 = _58(_433, _435, (*spvDescriptorSet0.support_buffer));
        int _439 = as_type<int>(_423);
        int _441 = 1;
        int _443 = _58(_439, _441, (*spvDescriptorSet0.support_buffer));
        int3 _2542 = int3(_437, _443, 1);
        float3 _445 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2542.xy), uint(_2542.z), 0).xyz;
        float _447 = _445.x;
        float _449 = _445.y;
        float _451 = _445.z;
        int _453 = _70;
        int _455 = 1;
        int _457 = _58(_453, _455, (*spvDescriptorSet0.support_buffer));
        int _459 = as_type<int>(_431);
        int _461 = 1;
        int _463 = _58(_459, _461, (*spvDescriptorSet0.support_buffer));
        int3 _2560 = int3(_457, _463, 1);
        float3 _465 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2560.xy), uint(_2560.z), 0).xyz;
        float _467 = _465.x;
        float _469 = _465.y;
        float _471 = _465.z;
        float _473 = _391 * 0.5;
        float _475 = _393 * 0.5;
        float _477 = _395 * 0.5;
        int _479 = _103 + 24;
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
            _56(_685, _687, _689, _691, _693, _695, _697, _699, _701, _703);
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
        int _733 = _103 + 8;
        uint _735 = uint(int(uint(_733) >> uint(2)));
        uint _737 = uint(int(uint(int(_735)) >> uint(2)));
        int _739 = int(_735) & 3;
        float _741 = (*spvDescriptorSet0.cp_c5)._m0[int(_737)][_739];
        int _743 = int(_735) + 1;
        uint _745 = uint(int(uint(_743) >> uint(2)));
        int _747 = _743 & 3;
        float _749 = (*spvDescriptorSet0.cp_c5)._m0[int(_745)][_747];
        int _751 = _70;
        int _753 = 1;
        int _755 = _58(_751, _753, (*spvDescriptorSet0.support_buffer));
        int _757 = as_type<int>(_741);
        int _759 = 1;
        int _761 = _58(_757, _759, (*spvDescriptorSet0.support_buffer));
        int3 _2941 = int3(_755, _761, 0);
        float3 _763 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2941.xy), uint(_2941.z), 0).xyz;
        float _765 = _763.x;
        float _767 = _763.y;
        float _769 = _763.z;
        int _771 = _70;
        int _773 = 1;
        int _775 = _58(_771, _773, (*spvDescriptorSet0.support_buffer));
        int _777 = as_type<int>(_741);
        int _779 = 1;
        int _781 = _58(_777, _779, (*spvDescriptorSet0.support_buffer));
        int3 _2959 = int3(_775, _781, 2);
        float3 _783 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2959.xy), uint(_2959.z), 0).xyz;
        float _785 = _783.x;
        float _787 = _783.y;
        float _789 = _783.z;
        int _791 = _70;
        int _793 = 1;
        int _795 = _58(_791, _793, (*spvDescriptorSet0.support_buffer));
        int _797 = as_type<int>(_749);
        int _799 = 1;
        int _801 = _58(_797, _799, (*spvDescriptorSet0.support_buffer));
        int3 _2977 = int3(_795, _801, 0);
        float3 _803 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2977.xy), uint(_2977.z), 0).xyz;
        float _805 = _803.x;
        float _807 = _803.y;
        float _809 = _803.z;
        int _811 = _70;
        int _813 = 1;
        int _815 = _58(_811, _813, (*spvDescriptorSet0.support_buffer));
        int _817 = as_type<int>(_749);
        int _819 = 1;
        int _821 = _58(_817, _819, (*spvDescriptorSet0.support_buffer));
        int3 _2995 = int3(_815, _821, 2);
        float3 _823 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2995.xy), uint(_2995.z), 0).xyz;
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
            int _863 = _103 + 28;
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
            int _893 = _103 + 28;
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
        float _939 = -_765;
        float _941 = _939 + _805;
        float _943 = -_769;
        float _945 = _943 + _809;
        float _947 = -_789;
        float _949 = _947 + _829;
        float _951 = _619 * _937;
        float _953 = _631 * _937;
        float _955 = _613 * _937;
        float _957 = _627 * _937;
        float _959 = fma(_535, _929, _951);
        float _961 = fma(_539, _929, _953);
        int _963 = _103 + 24;
        uint _965 = uint(int(uint(_963) >> uint(2)));
        uint _967 = uint(int(uint(int(_965)) >> uint(2)));
        int _969 = int(_965) & 3;
        float _971 = (*spvDescriptorSet0.cp_c5)._m0[int(_967)][_969];
        float _973 = fma(_549, _929, _957);
        float _975 = fma(_545, _929, _955);
        float _977 = _961 * 2.0;
        float _979 = _959 * 2.0;
        float _981 = _975 * 2.0;
        float _983 = _973 * _977;
        int _985 = _103 + 20;
        uint _987 = uint(int(uint(_985) >> uint(2)));
        uint _989 = uint(int(uint(int(_987)) >> uint(2)));
        int _991 = int(_987) & 3;
        float _993 = (*spvDescriptorSet0.cp_c5)._m0[int(_989)][_991];
        float _995 = _959 * _977;
        float _997 = _975 * _977;
        float _999 = -_983;
        float _1001 = fma(_975, _979, _999);
        float _1003 = fma(_975, _979, _983);
        float _1005 = -_995;
        float _1007 = fma(_973, _981, _1005);
        float _1009 = _975 * _975;
        float _1011 = _959 * _959;
        float _1013 = fma(_973, _981, _995);
        float _1015 = fma(_973, _979, _997);
        float _1017 = -_997;
        float _1019 = fma(_973, _979, _1017);
        float _1021 = -_767;
        float _1023 = _1021 + _807;
        float _1025 = _973 * _973;
        float _1027 = fma(_1009, -2.0, 1.0);
        float _1029 = fma(_1011, -2.0, 1.0);
        float _1031 = fma(_1023, _971, _767);
        float _1033 = fma(_941, _971, _765);
        float _1035 = fma(_1025, -2.0, _1027);
        float _1037 = fma(_1025, -2.0, _1029);
        float _1039 = -_785;
        float _1041 = _1039 + _825;
        float _1043 = -_787;
        float _1045 = _1043 + _827;
        float _1047 = _1031 * _931;
        float _1049 = fma(_945, _971, _769);
        float _1051 = fma(_1041, _971, _785);
        float _1053 = fma(_1045, _971, _787);
        float _1055 = fma(_949, _971, _789);
        float _1057 = fma(_397, _993, _1047);
        float _1059 = _1033 * _931;
        float _1061 = _1049 * _931;
        float _1063 = _1051 * _931;
        float _1065 = _1053 * _931;
        float _1067 = _1055 * _931;
        float _1069 = fma(_1009, -2.0, _1029);
        float _1071 = fma(_399, _993, _1059);
        float _1073 = fma(_401, _993, _1061);
        float _1075 = fma(_403, _993, _1063);
        float _1077 = fma(_405, _993, _1065);
        float _1079 = fma(_407, _993, _1067);
        _411 = _1071;
        _1081 = _1035;
        _1083 = _1003;
        _1085 = _1019;
        _1087 = _1057;
        _1089 = _1013;
        _1091 = _1001;
        _1093 = _1037;
        _1095 = _1073;
        _1097 = _1015;
        _1099 = _1007;
        _1101 = _1069;
        _413 = _1079;
        _1103 = _1077;
        _1105 = _1075;
        _1107 = true;
    }
    else
    {
        float _1109 = _395 * 0.15915493667125701904296875;
        float _1111 = _391 * 0.15915493667125701904296875;
        float _1113 = _393 * 0.15915493667125701904296875;
        float _1115 = _1109 * 6.283185482025146484375;
        float _1117 = cos(_1115);
        float _1119 = _1111 * 6.283185482025146484375;
        float _1121 = sin(_1119);
        float _1123 = _1111 * 6.283185482025146484375;
        float _1125 = cos(_1123);
        float _1127 = _1109 * 6.283185482025146484375;
        float _1129 = sin(_1127);
        float _1131 = _1121 * _1117;
        float _1133 = _1113 * 6.283185482025146484375;
        float _1135 = cos(_1133);
        float _1137 = _1117 * _1125;
        float _1139 = _1113 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1129 * _1121;
        float _1145 = _1117 * _1135;
        float _1147 = _1135 * _1125;
        float _1149 = _1121 * _1135;
        float _1151 = _1129 * _1135;
        float _1153 = _1129 * _1125;
        float _1155 = _1129 * _1141;
        float _1157 = -_1141;
        float _1159 = _1157 + (-0.0);
        float _1161 = -_1131;
        float _1163 = fma(_1125, _1155, _1161);
        float _1165 = fma(_1121, _1155, _1137);
        float _1167 = -_1153;
        float _1169 = fma(_1141, _1131, _1167);
        float _1171 = fma(_1141, _1137, _1143);
        _1081 = _1147;
        _1083 = _1149;
        _1085 = _1159;
        _1087 = _397;
        _1089 = _1151;
        _1091 = _1163;
        _1093 = _1165;
        _1095 = _401;
        _1097 = _1171;
        _1099 = _1169;
        _1101 = _1145;
        _1103 = _405;
        _1105 = _403;
    }
    _1107 = false;
    float _1173 = _411;
    float _1175 = _1081;
    float _1177 = _1083;
    float _1179 = _1085;
    float _1181 = _1087;
    float _1183 = _1089;
    float _1185 = _1091;
    float _1187 = _1093;
    float _1189 = _1095;
    float _1191 = _1097;
    float _1193 = _1099;
    float _1195 = _1101;
    float _1197 = _413;
    float _1199 = _1103;
    float _1201 = _1105;
    bool _1203 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _1205 = _1173 * _1175;
    float _1207 = _1173 * _1177;
    float _1209 = _1173 * _1179;
    float _1211 = _1181 * _1183;
    float _1213 = _1181 * _1185;
    float _1215 = _1181 * _1187;
    float _1217 = _1189 * _1191;
    float _1219 = _1189 * _1193;
    float _1221 = _1189 * _1195;
    int _1223 = _70 * 112;
    bool _1225 = !_1203;
    float _1227 = _1213;
    float _1229 = _1217;
    float _1231 = _1201;
    float _1233 = _1207;
    float _1235 = _1215;
    float _1237 = _1219;
    float _1239 = _1199;
    float _1241 = _1209;
    float _1243 = _1211;
    float _1245 = _1221;
    float _1247 = _1197;
    float _1565;
    if (!_1225)
    {
        int _1249 = 0;
        float _1251 = _1205;
        float _1253 = _1213;
        float _1255 = _1217;
        float _1257 = _1201;
        float _1259 = _1207;
        float _1261 = _1215;
        float _1263 = _1219;
        float _1265 = _1199;
        float _1267 = _1209;
        float _1269 = _1211;
        float _1271 = _1221;
        float _1273 = _1197;
        bool _1275;
        int _1323;
        int _1333;
        int _1343;
        int _1353;
        int _1363;
        int _1373;
        int _1383;
        int _1393;
        int _1403;
        int _1413;
        int _1423;
        int _1433;
        float _1541;
        float _1543;
        float _1545;
        int _1547;
        float _1549;
        int _1551;
        int _1553;
        int _1555;
        int _1557;
        float _1559;
        float _1561;
        float _1563;
        do
        {
            int _1277 = _1249;
            float _1279 = _1251;
            float _1281 = _1253;
            float _1283 = _1255;
            int _1285 = as_type<int>(_1257);
            float _1287 = _1259;
            int _1289 = as_type<int>(_1261);
            int _1291 = as_type<int>(_1263);
            int _1293 = as_type<int>(_1265);
            int _1295 = as_type<int>(_1267);
            float _1297 = _1269;
            float _1299 = _1271;
            float _1301 = _1273;
            uint _1303 = uint(int(uint(_1223) >> uint(2)));
            uint _1305 = uint(int(uint(int(_1303)) >> uint(2)));
            int _1307 = int(_1303) & 3;
            float _1309 = (*spvDescriptorSet0.cp_c6)._m0[int(_1305)][_1307];
            bool _1311 = _70 != 0;
            int _1313 = _1277 + 1;
            bool _1315 = uint(_1313) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1317 = as_type<int>(_1279);
            int _1319 = as_type<int>(_1309);
            int _1321 = 31;
            int _3616 = _60(_1317, _1319, _1321, _1323, gl_SubgroupInvocationID);
            int _1325 = _3616;
            int _1327 = as_type<int>(_1281);
            int _1329 = as_type<int>(_1309);
            int _1331 = 31;
            int _3621 = _60(_1327, _1329, _1331, _1333, gl_SubgroupInvocationID);
            int _1335 = _3621;
            int _1337 = as_type<int>(_1283);
            int _1339 = as_type<int>(_1309);
            int _1341 = 31;
            int _3626 = _60(_1337, _1339, _1341, _1343, gl_SubgroupInvocationID);
            int _1345 = _3626;
            int _1347 = _1285;
            int _1349 = as_type<int>(_1309);
            int _1351 = 31;
            int _3630 = _60(_1347, _1349, _1351, _1353, gl_SubgroupInvocationID);
            int _1355 = _3630;
            int _1357 = as_type<int>(_1287);
            int _1359 = as_type<int>(_1309);
            int _1361 = 31;
            int _3635 = _60(_1357, _1359, _1361, _1363, gl_SubgroupInvocationID);
            int _1365 = _3635;
            int _1367 = _1289;
            int _1369 = as_type<int>(_1309);
            int _1371 = 31;
            int _3639 = _60(_1367, _1369, _1371, _1373, gl_SubgroupInvocationID);
            int _1375 = _3639;
            int _1377 = _1291;
            int _1379 = as_type<int>(_1309);
            int _1381 = 31;
            int _3643 = _60(_1377, _1379, _1381, _1383, gl_SubgroupInvocationID);
            int _1385 = _3643;
            int _1387 = _1293;
            int _1389 = as_type<int>(_1309);
            int _1391 = 31;
            int _3647 = _60(_1387, _1389, _1391, _1393, gl_SubgroupInvocationID);
            int _1395 = _3647;
            int _1397 = _1295;
            int _1399 = as_type<int>(_1309);
            int _1401 = 31;
            int _3651 = _60(_1397, _1399, _1401, _1403, gl_SubgroupInvocationID);
            int _1405 = _3651;
            int _1407 = as_type<int>(_1297);
            int _1409 = as_type<int>(_1309);
            int _1411 = 31;
            int _3656 = _60(_1407, _1409, _1411, _1413, gl_SubgroupInvocationID);
            int _1415 = _3656;
            int _1417 = as_type<int>(_1299);
            int _1419 = as_type<int>(_1309);
            int _1421 = 31;
            int _3661 = _60(_1417, _1419, _1421, _1423, gl_SubgroupInvocationID);
            int _1425 = _3661;
            int _1427 = as_type<int>(_1301);
            int _1429 = as_type<int>(_1309);
            int _1431 = 31;
            int _3666 = _60(_1427, _1429, _1431, _1433, gl_SubgroupInvocationID);
            int _1435 = _3666;
            bool _1437 = !_1311;
            _1249 = _1313;
            float _1439 = _1279;
            float _1441 = _1281;
            float _1443 = _1283;
            int _1445 = _1285;
            float _1447 = _1287;
            int _1449 = _1289;
            int _1451 = _1291;
            int _1453 = _1293;
            int _1455 = _1295;
            float _1457 = _1297;
            float _1459 = _1299;
            float _1461 = _1301;
            if (!_1437)
            {
                float _1463 = as_type<float>(_1335) * _1199;
                float _1465 = _1207 * as_type<float>(_1335);
                float _1467 = _1215 * as_type<float>(_1335);
                float _1469 = _1219 * as_type<float>(_1335);
                float _1471 = fma(as_type<float>(_1325), _1201, _1463);
                float _1473 = _1207 * as_type<float>(_1375);
                float _1475 = _1215 * as_type<float>(_1375);
                float _1477 = _1219 * as_type<float>(_1375);
                float _1479 = as_type<float>(_1375) * _1199;
                float _1481 = fma(_1205, as_type<float>(_1325), _1465);
                float _1483 = fma(_1213, as_type<float>(_1325), _1467);
                float _1485 = fma(_1217, as_type<float>(_1325), _1469);
                float _1487 = fma(_1205, as_type<float>(_1365), _1473);
                float _1489 = fma(_1213, as_type<float>(_1365), _1475);
                float _1491 = fma(_1217, as_type<float>(_1365), _1477);
                float _1493 = _1207 * as_type<float>(_1415);
                float _1495 = as_type<float>(_1415) * _1199;
                float _1497 = fma(as_type<float>(_1365), _1201, _1479);
                float _1499 = _1215 * as_type<float>(_1415);
                float _1501 = _1219 * as_type<float>(_1415);
                float _1503 = fma(_1205, as_type<float>(_1405), _1493);
                float _1505 = fma(as_type<float>(_1405), _1201, _1495);
                float _1507 = fma(_1221, as_type<float>(_1345), _1485);
                float _1509 = fma(_1213, as_type<float>(_1405), _1499);
                float _1511 = fma(_1211, as_type<float>(_1385), _1489);
                float _1513 = fma(_1217, as_type<float>(_1405), _1501);
                float _1515 = fma(as_type<float>(_1345), _1197, _1471);
                float _1517 = fma(_1209, as_type<float>(_1385), _1487);
                float _1519 = fma(_1221, as_type<float>(_1385), _1491);
                float _1521 = fma(as_type<float>(_1385), _1197, _1497);
                float _1523 = fma(as_type<float>(_1425), _1197, _1505);
                float _1525 = fma(_1211, as_type<float>(_1345), _1483);
                float _1527 = fma(_1209, as_type<float>(_1345), _1481);
                float _1529 = fma(_1211, as_type<float>(_1425), _1509);
                float _1531 = as_type<float>(_1355) + _1515;
                float _1533 = fma(_1209, as_type<float>(_1425), _1503);
                float _1535 = fma(_1221, as_type<float>(_1425), _1513);
                float _1537 = as_type<float>(_1395) + _1521;
                float _1539 = as_type<float>(_1435) + _1523;
                _1439 = _1527;
                _1441 = _1525;
                _1443 = _1507;
                _1445 = as_type<int>(_1531);
                _1447 = _1517;
                _1449 = as_type<int>(_1511);
                _1451 = as_type<int>(_1519);
                _1453 = as_type<int>(_1537);
                _1455 = as_type<int>(_1533);
                _1457 = _1529;
                _1459 = _1535;
                _1461 = _1539;
            }
            _1541 = _1439;
            _1543 = _1441;
            _1545 = _1443;
            _1547 = _1445;
            _1549 = _1447;
            _1551 = _1449;
            _1553 = _1451;
            _1555 = _1453;
            _1557 = _1455;
            _1559 = _1457;
            _1561 = _1459;
            _1563 = _1461;
            _1275 = !_1315;
            _1251 = _1541;
            _1253 = _1543;
            _1255 = _1545;
            _1257 = as_type<float>(_1547);
            _1259 = _1549;
            _1261 = as_type<float>(_1551);
            _1263 = as_type<float>(_1553);
            _1265 = as_type<float>(_1555);
            _1267 = as_type<float>(_1557);
            _1269 = _1559;
            _1271 = _1561;
            _1273 = _1563;
        } while (_1275);
        _1565 = _1541;
        _1227 = _1543;
        _1229 = _1545;
        _1231 = as_type<float>(_1547);
        _1233 = _1549;
        _1235 = as_type<float>(_1551);
        _1237 = as_type<float>(_1553);
        _1239 = as_type<float>(_1555);
        _1241 = as_type<float>(_1557);
        _1243 = _1559;
        _1245 = _1561;
        _1247 = _1563;
        _1567 = true;
    }
    else
    {
        _1565 = _1205;
    }
    _1567 = false;
    float _1569 = _1565;
    float _1571 = _1227;
    float _1573 = _1229;
    float _1575 = _1231;
    float _1577 = _1233;
    float _1579 = _1235;
    float _1581 = _1237;
    float _1583 = _1239;
    float _1585 = _1241;
    float _1587 = _1243;
    float _1589 = _1245;
    float _1591 = _1247;
    int _1593 = _1223 + 80;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    uint _1597 = uint(int(uint(int(_1595)) >> uint(2)));
    int _1599 = int(_1595) & 3;
    float _1601 = (*spvDescriptorSet0.cp_c6)._m0[int(_1597)][_1599];
    int _1603 = int(_1595) + 1;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    int _1607 = _1603 & 3;
    float _1609 = (*spvDescriptorSet0.cp_c6)._m0[int(_1605)][_1607];
    bool _1611 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1613 = _1223 + 64;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    uint _1617 = uint(int(uint(int(_1615)) >> uint(2)));
    int _1619 = int(_1615) & 3;
    float _1621 = (*spvDescriptorSet0.cp_c6)._m0[int(_1617)][_1619];
    int _1623 = int(_1615) + 1;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    int _1627 = _1623 & 3;
    float _1629 = (*spvDescriptorSet0.cp_c6)._m0[int(_1625)][_1627];
    int _1631 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1633 = _1631 + _70;
    int _1635 = _1223 + 88;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    uint _1639 = uint(int(uint(int(_1637)) >> uint(2)));
    int _1641 = int(_1637) & 3;
    float _1643 = (*spvDescriptorSet0.cp_c6)._m0[int(_1639)][_1641];
    int _1645 = int(_1637) + 1;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    int _1649 = _1645 & 3;
    float _1651 = (*spvDescriptorSet0.cp_c6)._m0[int(_1647)][_1649];
    int _1653 = _1223 + 72;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    uint _1657 = uint(int(uint(int(_1655)) >> uint(2)));
    int _1659 = int(_1655) & 3;
    float _1661 = (*spvDescriptorSet0.cp_c6)._m0[int(_1657)][_1659];
    int _1663 = int(_1655) + 1;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    int _1667 = _1663 & 3;
    float _1669 = (*spvDescriptorSet0.cp_c6)._m0[int(_1665)][_1667];
    int _1671 = _1223 + 96;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.cp_c6)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.cp_c6)._m0[int(_1683)][_1685];
    int _1689 = _1223 + 104;
    uint _1691 = uint(int(uint(_1689) >> uint(2)));
    uint _1693 = uint(int(uint(int(_1691)) >> uint(2)));
    int _1695 = int(_1691) & 3;
    float _1697 = (*spvDescriptorSet0.cp_c6)._m0[int(_1693)][_1695];
    int _1699 = int(_1691) + 1;
    uint _1701 = uint(int(uint(_1699) >> uint(2)));
    int _1703 = _1699 & 3;
    float _1705 = (*spvDescriptorSet0.cp_c6)._m0[int(_1701)][_1703];
    int _1707 = _1223 + 16;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    uint _1711 = uint(int(uint(int(_1709)) >> uint(2)));
    int _1713 = int(_1709) & 3;
    float _1715 = (*spvDescriptorSet0.cp_c6)._m0[int(_1711)][_1713];
    int _1717 = int(_1709) + 1;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    int _1721 = _1717 & 3;
    float _1723 = (*spvDescriptorSet0.cp_c6)._m0[int(_1719)][_1721];
    if (!_1611)
    {
        int _1725 = _70 * 48;
        int _1727 = _1725 + 16;
        uint _1729 = uint(int(uint(_1725) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1729)] = as_type<uint>(_1569);
        int _1731 = _1725 + 4;
        uint _1733 = uint(int(uint(_1731) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1733)] = as_type<uint>(_1571);
        int _1735 = _1725 + 8;
        uint _1737 = uint(int(uint(_1735) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1737)] = as_type<uint>(_1573);
        int _1739 = _1725 + 12;
        uint _1741 = uint(int(uint(_1739) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1741)] = as_type<uint>(_1575);
        int _1743 = _1725 + 32;
        uint _1745 = uint(int(uint(_1727) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1745)] = as_type<uint>(_1577);
        int _1747 = _1727 + 4;
        uint _1749 = uint(int(uint(_1747) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1749)] = as_type<uint>(_1579);
        int _1751 = _1727 + 8;
        uint _1753 = uint(int(uint(_1751) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1753)] = as_type<uint>(_1581);
        int _1755 = _1727 + 12;
        uint _1757 = uint(int(uint(_1755) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1757)] = as_type<uint>(_1583);
        uint _1759 = uint(int(uint(_1743) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1759)] = as_type<uint>(_1585);
        int _1761 = _1743 + 4;
        uint _1763 = uint(int(uint(_1761) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1763)] = as_type<uint>(_1587);
        int _1765 = _1743 + 8;
        uint _1767 = uint(int(uint(_1765) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1767)] = as_type<uint>(_1589);
        int _1769 = _1743 + 12;
        uint _1771 = uint(int(uint(_1769) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1771)] = as_type<uint>(_1591);
    }
    float _1773 = _1587 * _1601;
    float _1775 = _1571 * _1601;
    float _1777 = _1579 * _1601;
    int _1779 = _1223 + 32;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.cp_c6)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.cp_c6)._m0[int(_1791)][_1793];
    float _1797 = fma(_1585, _1621, _1773);
    float _1799 = _1571 * _1609;
    float _1801 = fma(_1569, _1621, _1775);
    float _1803 = fma(_1577, _1621, _1777);
    float _1805 = _1579 * _1609;
    float _1807 = fma(_1569, _1629, _1799);
    float _1809 = _1571 * _1643;
    float _1811 = _1571 * _1651;
    float _1813 = _1587 * _1609;
    int _1815 = _1223 + 48;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.cp_c6)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.cp_c6)._m0[int(_1827)][_1829];
    float _1833 = _1579 * _1643;
    float _1835 = _1579 * _1651;
    float _1837 = fma(_1577, _1629, _1805);
    float _1839 = fma(_1585, _1629, _1813);
    float _1841 = _1587 * _1643;
    float _1843 = _1587 * _1651;
    float _1845 = fma(_1569, _1661, _1809);
    float _1847 = fma(_1569, _1669, _1811);
    float _1849 = fma(_1577, _1661, _1833);
    int _1851 = _1223 + 24;
    uint _1853 = uint(int(uint(_1851) >> uint(2)));
    uint _1855 = uint(int(uint(int(_1853)) >> uint(2)));
    int _1857 = int(_1853) & 3;
    float _1859 = (*spvDescriptorSet0.cp_c6)._m0[int(_1855)][_1857];
    int _1861 = int(_1853) + 1;
    uint _1863 = uint(int(uint(_1861) >> uint(2)));
    int _1865 = _1861 & 3;
    float _1867 = (*spvDescriptorSet0.cp_c6)._m0[int(_1863)][_1865];
    float _1869 = fma(_1577, _1669, _1835);
    float _1871 = fma(_1585, _1669, _1843);
    float _1873 = fma(_1585, _1661, _1841);
    float _1875 = fma(_1573, _1679, _1801);
    float _1877 = fma(_1581, _1705, _1869);
    float _1879 = fma(_1581, _1679, _1803);
    float _1881 = fma(_1589, _1679, _1797);
    int _1883 = _1223 + 40;
    uint _1885 = uint(int(uint(_1883) >> uint(2)));
    uint _1887 = uint(int(uint(int(_1885)) >> uint(2)));
    int _1889 = int(_1885) & 3;
    float _1891 = (*spvDescriptorSet0.cp_c6)._m0[int(_1887)][_1889];
    int _1893 = int(_1885) + 1;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    int _1897 = _1893 & 3;
    float _1899 = (*spvDescriptorSet0.cp_c6)._m0[int(_1895)][_1897];
    float _1901 = fma(_1573, _1687, _1807);
    float _1903 = fma(_1573, _1697, _1845);
    float _1905 = fma(_1573, _1705, _1847);
    float _1907 = fma(_1581, _1687, _1837);
    float _1909 = fma(_1581, _1697, _1849);
    float _1911 = fma(_1589, _1705, _1871);
    float _1913 = _1877 + _1583;
    int _1915 = _1223 + 56;
    uint _1917 = uint(int(uint(_1915) >> uint(2)));
    uint _1919 = uint(int(uint(int(_1917)) >> uint(2)));
    int _1921 = int(_1917) & 3;
    float _1923 = (*spvDescriptorSet0.cp_c6)._m0[int(_1919)][_1921];
    int _1925 = int(_1917) + 1;
    uint _1927 = uint(int(uint(_1925) >> uint(2)));
    int _1929 = _1925 & 3;
    float _1931 = (*spvDescriptorSet0.cp_c6)._m0[int(_1927)][_1929];
    float _1933 = fma(_1589, _1687, _1839);
    float _1935 = fma(_1589, _1697, _1873);
    float _1937 = _1911 + _1591;
    float _1939 = _1905 + _1575;
    float _1941 = _1879 * _1723;
    float _1943 = _1907 * _1723;
    float _1945 = _1909 * _1723;
    float _1947 = _1913 * _1723;
    float _1949 = fma(_1875, _1715, _1941);
    float _1951 = fma(_1901, _1715, _1943);
    float _1953 = fma(_1903, _1715, _1945);
    float _1955 = fma(_1939, _1715, _1947);
    float _1957 = _1913 * _1795;
    float _1959 = _1879 * _1795;
    float _1961 = _1907 * _1795;
    float _1963 = _1909 * _1795;
    float _1965 = fma(_1939, _1787, _1957);
    float _1967 = fma(_1875, _1787, _1959);
    float _1969 = fma(_1901, _1787, _1961);
    float _1971 = fma(_1903, _1787, _1963);
    int _1973 = _1633 * 48;
    float _1975 = _1913 * _1831;
    float _1977 = _1879 * _1831;
    float _1979 = _1907 * _1831;
    float _1981 = _1909 * _1831;
    float _1983 = fma(_1939, _1823, _1975);
    float _1985 = fma(_1875, _1823, _1977);
    float _1987 = fma(_1901, _1823, _1979);
    float _1989 = fma(_1903, _1823, _1981);
    float _1991 = fma(_1937, _1859, _1955);
    float _1993 = fma(_1933, _1859, _1951);
    float _1995 = fma(_1881, _1859, _1949);
    float _1997 = fma(_1935, _1859, _1953);
    float _1999 = _1991 + _1867;
    float _2001 = fma(_1937, _1891, _1965);
    float _2003 = fma(_1881, _1891, _1967);
    float _2005 = fma(_1933, _1891, _1969);
    float _2007 = fma(_1935, _1891, _1971);
    float _2009 = _2001 + _1899;
    int _2011 = _1973 + 16;
    int _2013 = _1973 + 32;
    float _2015 = fma(_1937, _1923, _1983);
    float _2017 = fma(_1881, _1923, _1985);
    float _2019 = fma(_1933, _1923, _1987);
    float _2021 = fma(_1935, _1923, _1989);
    float _2023 = _2015 + _1931;
    int _2025 = _1973 + 48;
    uint _2027 = uint(int(uint(_2011) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2027)] = as_type<uint>(_1995);
    int _2029 = _2011 + 4;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2031)] = as_type<uint>(_1993);
    int _2033 = _2011 + 8;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2035)] = as_type<uint>(_1997);
    int _2037 = _2011 + 12;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2039)] = as_type<uint>(_1999);
    uint _2041 = uint(int(uint(_2013) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2041)] = as_type<uint>(_2003);
    int _2043 = _2013 + 4;
    uint _2045 = uint(int(uint(_2043) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2045)] = as_type<uint>(_2005);
    int _2047 = _2013 + 8;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2049)] = as_type<uint>(_2007);
    int _2051 = _2013 + 12;
    uint _2053 = uint(int(uint(_2051) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2053)] = as_type<uint>(_2009);
    uint _2055 = uint(int(uint(_2025) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2055)] = as_type<uint>(_2017);
    int _2057 = _2025 + 4;
    uint _2059 = uint(int(uint(_2057) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2059)] = as_type<uint>(_2019);
    int _2061 = _2025 + 8;
    uint _2063 = uint(int(uint(_2061) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2063)] = as_type<uint>(_2021);
    int _2065 = _2025 + 12;
    uint _2067 = uint(int(uint(_2065) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2067)] = as_type<uint>(_2023);
}

