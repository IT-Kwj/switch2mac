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
int _58(thread const int& _5194, thread const int& _5195, constant _10& support_buffer)
{
    int _5198 = 1 + _5195;
    float _5200 = support_buffer._m5[_5198].x;
    bool _5202 = _5200 == 1.0;
    if (_5202)
    {
        return _5194;
    }
    float _5204 = float(_5194);
    float _5206 = _5204 * _5200;
    int _5208 = int(_5206);
    return _5208;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4886, thread const int& _4887, thread const int& _4888, thread const int& _4889, thread int& _4890, thread int& _4891, thread int& _4892, thread int& _4893, thread int& _4894, thread int& _4895)
{
    float _4898 = as_type<float>(_4888) + 0.0;
    bool _4900 = _4898 != 0.0;
    bool _4902 = isnan(_4898);
    bool _4904 = _4900 || _4902;
    bool _4906 = isnan(0.0);
    bool _4908 = _4904 || _4906;
    int _4910 = _4886;
    int _4912 = _4887;
    int _4914 = _4888;
    int _4916 = _4908 ? (-1) : 0;
    if (!_4908)
    {
        float _4918 = as_type<float>(_4888) * 1.0;
        _4910 = as_type<int>(_4918);
    }
    int _4920 = _4910;
    bool _4922 = !_4908;
    int _4924 = _4920;
    int _4926 = _4920;
    if (!_4922)
    {
        float _4928 = as_type<float>(_4888) + 0.0;
        bool _4930 = _4928 >= 0.0;
        bool _4932 = isnan(_4928);
        bool _4934 = _4930 || _4932;
        bool _4936 = isnan(0.0);
        bool _4938 = _4934 || _4936;
        _4916 = _4938 ? (-1) : 0;
        if (!_4938)
        {
            _4924 = 2147483647;
        }
        int _4940 = _4924;
        bool _4942 = !_4938;
        int _4944 = _4940;
        _4926 = _4940;
        if (!_4942)
        {
            float _4946 = as_type<float>(_4888) + 0.0;
            bool _4948 = _4946 > as_type<float>(0x7f800000u /* inf */);
            bool _4950 = isnan(_4946);
            bool _4952 = _4948 || _4950;
            bool _4954 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4956 = _4952 || _4954;
            _4916 = _4956 ? (-1) : 0;
            if (_4956)
            {
                float _4958 = as_type<float>(_4888) + 1.0;
                _4944 = as_type<int>(_4958);
            }
            int _4960 = _4944;
            int _4962 = _4960;
            _4926 = _4960;
            if (!_4956)
            {
                float _4964 = 0.0 + as_type<float>(_4888);
                bool _4966 = _4964 != as_type<float>(0x7f800000u /* inf */);
                bool _4968 = isnan(_4964);
                bool _4970 = _4966 || _4968;
                bool _4972 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4974 = _4970 || _4972;
                _4916 = _4974 ? (-1) : 0;
                if (!_4974)
                {
                    _4962 = _4888;
                }
                int _4976 = _4962;
                bool _4978 = !_4974;
                _4926 = _4976;
                if (!_4978)
                {
                    float _4980 = as_type<float>(_4888) * 18446744073709551616.0;
                    float _4982 = rsqrt(_4980);
                    float _4984 = _4980 * _4982;
                    float _4986 = _4982 * 0.5;
                    float _4988 = -_4984;
                    float _4990 = 0.0 + _4988;
                    float _4992 = fma(_4986, _4990, 0.5);
                    float _4994 = fma(_4984, _4992, _4984);
                    float _4996 = -_4994;
                    float _4998 = 0.0 + _4996;
                    float _5000 = fma(_4994, _4998, _4980);
                    float _5002 = fma(_4986, _5000, _4994);
                    float _5004 = _5002 * 2.3283064365386962890625e-10;
                    _4926 = as_type<int>(_5004);
                    _4912 = as_type<int>(_4994);
                    _4914 = as_type<int>(_4990);
                }
            }
        }
    }
    int _5006 = _4926;
    int _5008 = _4912;
    int _5010 = _4914;
    int _5012 = _4916;
    _4890 = _4889;
    _4891 = 0;
    _4892 = _5006;
    _4893 = _5008;
    _4894 = _5010;
    _4895 = _5012;
}

static inline __attribute__((always_inline))
int _60(thread const int& _5229, thread const int& _5230, thread const int& _5231, thread int& _5232, thread uint& gl_SubgroupInvocationID)
{
    int _5235 = _5231 & 31;
    uint _5237 = uint(int(uint(_5231) >> uint(8)));
    int _5239 = int(_5237) & 31;
    float _5241 = as_type<float>(gl_SubgroupInvocationID);
    int _5243 = as_type<int>(_5241) & _5239;
    int _5245 = ~_5239;
    int _5247 = _5235 & _5245;
    int _5249 = _5247 | _5243;
    int _5251 = ~_5239;
    int _5253 = _5230 & _5251;
    int _5255 = _5253 | _5243;
    bool _5257 = uint(_5255) <= uint(_5249);
    _5232 = _5257 ? (-1) : 0;
    float _5259 = spvSubgroupShuffle(as_type<float>(_5229), uint(_5255));
    uint _5261 = uint(_5257 ? as_type<int>(_5259) : _5229);
    return int(_5261);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1617 = false;
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
        float _939 = -_789;
        float _941 = _939 + _829;
        float _943 = _619 * _937;
        float _945 = _631 * _937;
        float _947 = _613 * _937;
        float _949 = _627 * _937;
        float _951 = fma(_535, _929, _943);
        float _953 = fma(_539, _929, _945);
        int _955 = _103 + 24;
        uint _957 = uint(int(uint(_955) >> uint(2)));
        uint _959 = uint(int(uint(int(_957)) >> uint(2)));
        int _961 = int(_957) & 3;
        float _963 = (*spvDescriptorSet0.cp_c5)._m0[int(_959)][_961];
        float _965 = fma(_549, _929, _949);
        float _967 = fma(_545, _929, _947);
        float _969 = _953 * 2.0;
        float _971 = _951 * 2.0;
        float _973 = _967 * 2.0;
        float _975 = _965 * _969;
        int _977 = _103 + 20;
        uint _979 = uint(int(uint(_977) >> uint(2)));
        uint _981 = uint(int(uint(int(_979)) >> uint(2)));
        int _983 = int(_979) & 3;
        float _985 = (*spvDescriptorSet0.cp_c5)._m0[int(_981)][_983];
        float _987 = _951 * _969;
        float _989 = _967 * _969;
        float _991 = _951 * _951;
        float _993 = -_975;
        float _995 = fma(_967, _971, _993);
        float _997 = -_987;
        float _999 = fma(_965, _973, _997);
        float _1001 = fma(_967, _971, _975);
        float _1003 = fma(_965, _971, _989);
        float _1005 = fma(_965, _973, _987);
        float _1007 = -_765;
        float _1009 = _1007 + _805;
        float _1011 = -_989;
        float _1013 = fma(_965, _971, _1011);
        float _1015 = -_767;
        float _1017 = _1015 + _807;
        float _1019 = _967 * _967;
        float _1021 = _965 * _965;
        float _1023 = fma(_991, -2.0, 1.0);
        float _1025 = fma(_1009, _963, _765);
        float _1027 = fma(_1017, _963, _767);
        float _1029 = -_769;
        float _1031 = _1029 + _809;
        float _1033 = fma(_1021, -2.0, _1023);
        float _1035 = fma(_1019, -2.0, _1023);
        float _1037 = -_785;
        float _1039 = _1037 + _825;
        float _1041 = -_787;
        float _1043 = _1041 + _827;
        float _1045 = _1027 * _931;
        float _1047 = fma(_1031, _963, _769);
        float _1049 = fma(_1039, _963, _785);
        float _1051 = fma(_1043, _963, _787);
        float _1053 = fma(_941, _963, _789);
        float _1055 = fma(_397, _985, _1045);
        float _1057 = fma(_1019, -2.0, 1.0);
        float _1059 = _1025 * _931;
        float _1061 = _1047 * _931;
        float _1063 = _1049 * _931;
        float _1065 = _1051 * _931;
        float _1067 = _1053 * _931;
        float _1069 = fma(_1021, -2.0, _1057);
        float _1071 = fma(_399, _985, _1059);
        float _1073 = fma(_401, _985, _1061);
        float _1075 = fma(_403, _985, _1063);
        float _1077 = fma(_405, _985, _1065);
        float _1079 = fma(_407, _985, _1067);
        _1081 = _1055;
        _1083 = _1005;
        _411 = _1071;
        _1085 = _1069;
        _1087 = _1001;
        _1089 = _1013;
        _1091 = _995;
        _1093 = _1033;
        _1095 = _1073;
        _1097 = _1003;
        _1099 = _999;
        _1101 = _1035;
        _1103 = _1075;
        _1105 = _1077;
        _413 = _1079;
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
        _1081 = _397;
        _1083 = _1151;
        _1085 = _1147;
        _1087 = _1149;
        _1089 = _1159;
        _1091 = _1163;
        _1093 = _1165;
        _1095 = _401;
        _1097 = _1171;
        _1099 = _1169;
        _1101 = _1145;
        _1103 = _403;
        _1105 = _405;
    }
    _1107 = false;
    float _1173 = _1081;
    float _1175 = _1083;
    float _1177 = _411;
    float _1179 = _1085;
    float _1181 = _1087;
    float _1183 = _1089;
    float _1185 = _1091;
    float _1187 = _1093;
    float _1189 = _1095;
    float _1191 = _1097;
    float _1193 = _1099;
    float _1195 = _1101;
    float _1197 = _1103;
    float _1199 = _1105;
    float _1201 = _413;
    float _1203 = _1173 * _1175;
    bool _1205 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _1207 = _1177 * _1179;
    bool _1209 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _1211 = _1177 * _1181;
    float _1213 = _1177 * _1183;
    float _1215 = _1173 * _1185;
    float _1217 = _1173 * _1187;
    float _1219 = _1189 * _1191;
    float _1221 = _1189 * _1193;
    float _1223 = _1189 * _1195;
    if (!_1209)
    {
        int _1225 = _70 * 48;
        int _1227 = _1225 + 16;
        uint _1229 = uint(int(uint(_1225) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1229)] = as_type<uint>(_1207);
        int _1231 = _1225 + 4;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1233)] = as_type<uint>(_1215);
        int _1235 = _1225 + 8;
        uint _1237 = uint(int(uint(_1235) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1237)] = as_type<uint>(_1219);
        int _1239 = _1225 + 12;
        uint _1241 = uint(int(uint(_1239) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1241)] = as_type<uint>(_1197);
        int _1243 = _1225 + 32;
        uint _1245 = uint(int(uint(_1227) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1245)] = as_type<uint>(_1211);
        int _1247 = _1227 + 4;
        uint _1249 = uint(int(uint(_1247) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1249)] = as_type<uint>(_1217);
        int _1251 = _1227 + 8;
        uint _1253 = uint(int(uint(_1251) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1253)] = as_type<uint>(_1221);
        int _1255 = _1227 + 12;
        uint _1257 = uint(int(uint(_1255) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1257)] = as_type<uint>(_1199);
        uint _1259 = uint(int(uint(_1243) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1259)] = as_type<uint>(_1213);
        int _1261 = _1243 + 4;
        uint _1263 = uint(int(uint(_1261) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1263)] = as_type<uint>(_1203);
        int _1265 = _1243 + 8;
        uint _1267 = uint(int(uint(_1265) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1267)] = as_type<uint>(_1223);
        int _1269 = _1243 + 12;
        uint _1271 = uint(int(uint(_1269) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1271)] = as_type<uint>(_1201);
    }
    int _1273 = _70 * 112;
    bool _1275 = !_1205;
    float _1593;
    float _1595;
    float _1597;
    float _1599;
    float _1601;
    float _1603;
    float _1605;
    float _1607;
    float _1609;
    float _1611;
    float _1613;
    float _1615;
    if (!_1275)
    {
        int _1277 = 0;
        float _1279 = _1207;
        float _1281 = _1215;
        float _1283 = _1219;
        float _1285 = _1197;
        float _1287 = _1211;
        float _1289 = _1217;
        float _1291 = _1221;
        float _1293 = _1199;
        float _1295 = _1213;
        float _1297 = _1203;
        float _1299 = _1223;
        float _1301 = _1201;
        bool _1303;
        int _1351;
        int _1361;
        int _1371;
        int _1381;
        int _1391;
        int _1401;
        int _1411;
        int _1421;
        int _1431;
        int _1441;
        int _1451;
        int _1461;
        int _1569;
        int _1573;
        int _1575;
        int _1579;
        int _1581;
        int _1583;
        int _1587;
        int _1589;
        int _1591;
        do
        {
            int _1305 = _1277;
            int _1307 = as_type<int>(_1279);
            int _1309 = as_type<int>(_1281);
            int _1311 = as_type<int>(_1283);
            int _1313 = as_type<int>(_1285);
            int _1315 = as_type<int>(_1287);
            int _1317 = as_type<int>(_1289);
            int _1319 = as_type<int>(_1291);
            int _1321 = as_type<int>(_1293);
            int _1323 = as_type<int>(_1295);
            int _1325 = as_type<int>(_1297);
            int _1327 = as_type<int>(_1299);
            int _1329 = as_type<int>(_1301);
            uint _1331 = uint(int(uint(_1273) >> uint(2)));
            uint _1333 = uint(int(uint(int(_1331)) >> uint(2)));
            int _1335 = int(_1331) & 3;
            float _1337 = (*spvDescriptorSet0.cp_c6)._m0[int(_1333)][_1335];
            bool _1339 = _70 != 0;
            int _1341 = _1305 + 1;
            bool _1343 = uint(_1341) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1345 = _1307;
            int _1347 = as_type<int>(_1337);
            int _1349 = 31;
            int _3745 = _60(_1345, _1347, _1349, _1351, gl_SubgroupInvocationID);
            int _1353 = _3745;
            int _1355 = _1309;
            int _1357 = as_type<int>(_1337);
            int _1359 = 31;
            int _3749 = _60(_1355, _1357, _1359, _1361, gl_SubgroupInvocationID);
            int _1363 = _3749;
            int _1365 = _1311;
            int _1367 = as_type<int>(_1337);
            int _1369 = 31;
            int _3753 = _60(_1365, _1367, _1369, _1371, gl_SubgroupInvocationID);
            int _1373 = _3753;
            int _1375 = _1313;
            int _1377 = as_type<int>(_1337);
            int _1379 = 31;
            int _3757 = _60(_1375, _1377, _1379, _1381, gl_SubgroupInvocationID);
            int _1383 = _3757;
            int _1385 = _1315;
            int _1387 = as_type<int>(_1337);
            int _1389 = 31;
            int _3761 = _60(_1385, _1387, _1389, _1391, gl_SubgroupInvocationID);
            int _1393 = _3761;
            int _1395 = _1317;
            int _1397 = as_type<int>(_1337);
            int _1399 = 31;
            int _3765 = _60(_1395, _1397, _1399, _1401, gl_SubgroupInvocationID);
            int _1403 = _3765;
            int _1405 = _1319;
            int _1407 = as_type<int>(_1337);
            int _1409 = 31;
            int _3769 = _60(_1405, _1407, _1409, _1411, gl_SubgroupInvocationID);
            int _1413 = _3769;
            int _1415 = _1321;
            int _1417 = as_type<int>(_1337);
            int _1419 = 31;
            int _3773 = _60(_1415, _1417, _1419, _1421, gl_SubgroupInvocationID);
            int _1423 = _3773;
            int _1425 = _1323;
            int _1427 = as_type<int>(_1337);
            int _1429 = 31;
            int _3777 = _60(_1425, _1427, _1429, _1431, gl_SubgroupInvocationID);
            int _1433 = _3777;
            int _1435 = _1325;
            int _1437 = as_type<int>(_1337);
            int _1439 = 31;
            int _3781 = _60(_1435, _1437, _1439, _1441, gl_SubgroupInvocationID);
            int _1443 = _3781;
            int _1445 = _1327;
            int _1447 = as_type<int>(_1337);
            int _1449 = 31;
            int _3785 = _60(_1445, _1447, _1449, _1451, gl_SubgroupInvocationID);
            int _1453 = _3785;
            int _1455 = _1329;
            int _1457 = as_type<int>(_1337);
            int _1459 = 31;
            int _3789 = _60(_1455, _1457, _1459, _1461, gl_SubgroupInvocationID);
            int _1463 = _3789;
            bool _1465 = !_1339;
            _1277 = _1341;
            int _1467 = _1307;
            int _1469 = _1309;
            int _1471 = _1311;
            int _1473 = _1313;
            int _1475 = _1315;
            int _1477 = _1317;
            int _1479 = _1319;
            int _1481 = _1321;
            int _1483 = _1323;
            int _1485 = _1325;
            int _1487 = _1327;
            int _1489 = _1329;
            if (!_1465)
            {
                float _1491 = as_type<float>(_1363) * _1199;
                float _1493 = _1211 * as_type<float>(_1363);
                float _1495 = _1217 * as_type<float>(_1363);
                float _1497 = _1221 * as_type<float>(_1363);
                float _1499 = as_type<float>(_1403) * _1199;
                float _1501 = _1211 * as_type<float>(_1403);
                float _1503 = fma(as_type<float>(_1353), _1197, _1491);
                float _1505 = fma(_1207, as_type<float>(_1353), _1493);
                float _1507 = fma(_1215, as_type<float>(_1353), _1495);
                float _1509 = fma(_1219, as_type<float>(_1353), _1497);
                float _1511 = _1217 * as_type<float>(_1403);
                float _1513 = _1221 * as_type<float>(_1403);
                float _1515 = fma(as_type<float>(_1393), _1197, _1499);
                float _1517 = as_type<float>(_1443) * _1199;
                float _1519 = fma(_1207, as_type<float>(_1393), _1501);
                float _1521 = _1217 * as_type<float>(_1443);
                float _1523 = _1211 * as_type<float>(_1443);
                float _1525 = fma(_1215, as_type<float>(_1393), _1511);
                float _1527 = fma(_1219, as_type<float>(_1393), _1513);
                float _1529 = _1221 * as_type<float>(_1443);
                float _1531 = fma(as_type<float>(_1433), _1197, _1517);
                float _1533 = fma(_1215, as_type<float>(_1433), _1521);
                float _1535 = fma(_1207, as_type<float>(_1433), _1523);
                float _1537 = fma(_1203, as_type<float>(_1373), _1507);
                float _1539 = fma(_1223, as_type<float>(_1373), _1509);
                float _1541 = fma(_1213, as_type<float>(_1373), _1505);
                float _1543 = fma(_1213, as_type<float>(_1413), _1519);
                float _1545 = fma(_1203, as_type<float>(_1413), _1525);
                float _1547 = fma(_1223, as_type<float>(_1413), _1527);
                float _1549 = fma(_1219, as_type<float>(_1433), _1529);
                float _1551 = fma(as_type<float>(_1373), _1201, _1503);
                float _1553 = fma(as_type<float>(_1413), _1201, _1515);
                float _1555 = fma(as_type<float>(_1453), _1201, _1531);
                float _1557 = fma(_1203, as_type<float>(_1453), _1533);
                float _1559 = fma(_1213, as_type<float>(_1453), _1535);
                float _1561 = fma(_1223, as_type<float>(_1453), _1549);
                float _1563 = as_type<float>(_1383) + _1551;
                float _1565 = as_type<float>(_1423) + _1553;
                float _1567 = as_type<float>(_1463) + _1555;
                _1467 = as_type<int>(_1541);
                _1469 = as_type<int>(_1537);
                _1471 = as_type<int>(_1539);
                _1473 = as_type<int>(_1563);
                _1475 = as_type<int>(_1543);
                _1477 = as_type<int>(_1545);
                _1479 = as_type<int>(_1547);
                _1481 = as_type<int>(_1565);
                _1483 = as_type<int>(_1559);
                _1485 = as_type<int>(_1557);
                _1487 = as_type<int>(_1561);
                _1489 = as_type<int>(_1567);
            }
            _1569 = _1467;
            int _1571 = _1469;
            _1573 = _1471;
            _1575 = _1473;
            int _1577 = _1475;
            _1579 = _1477;
            _1581 = _1479;
            _1583 = _1481;
            int _1585 = _1483;
            _1587 = _1485;
            _1589 = _1487;
            _1591 = _1489;
            _1303 = !_1343;
            _1279 = as_type<float>(_1569);
            _1281 = as_type<float>(_1571);
            _1283 = as_type<float>(_1573);
            _1285 = as_type<float>(_1575);
            _1287 = as_type<float>(_1577);
            _1289 = as_type<float>(_1579);
            _1291 = as_type<float>(_1581);
            _1293 = as_type<float>(_1583);
            _1295 = as_type<float>(_1585);
            _1297 = as_type<float>(_1587);
            _1299 = as_type<float>(_1589);
            _1301 = as_type<float>(_1591);
            _1593 = as_type<float>(_1571);
            _1595 = as_type<float>(_1577);
            _1597 = as_type<float>(_1585);
        } while (_1303);
        _1599 = as_type<float>(_1579);
        _1601 = as_type<float>(_1587);
        _1603 = as_type<float>(_1569);
        _1605 = as_type<float>(_1573);
        _1607 = as_type<float>(_1581);
        _1609 = as_type<float>(_1589);
        _1611 = as_type<float>(_1583);
        _1613 = as_type<float>(_1591);
        _1615 = as_type<float>(_1575);
        _1617 = true;
    }
    else
    {
        _1593 = _1215;
        _1599 = _1217;
        _1601 = _1203;
        _1603 = _1207;
        _1595 = _1211;
        _1597 = _1213;
        _1605 = _1219;
        _1607 = _1221;
        _1609 = _1223;
        _1611 = _1199;
        _1613 = _1201;
        _1615 = _1197;
    }
    _1617 = false;
    float _1619 = _1593;
    float _1621 = _1599;
    float _1623 = _1601;
    float _1625 = _1603;
    float _1627 = _1595;
    float _1629 = _1597;
    float _1631 = _1605;
    float _1633 = _1607;
    float _1635 = _1609;
    float _1637 = _1611;
    float _1639 = _1613;
    float _1641 = _1615;
    int _1643 = _1273 + 80;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    uint _1647 = uint(int(uint(int(_1645)) >> uint(2)));
    int _1649 = int(_1645) & 3;
    float _1651 = (*spvDescriptorSet0.cp_c6)._m0[int(_1647)][_1649];
    int _1653 = int(_1645) + 1;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    int _1657 = _1653 & 3;
    float _1659 = (*spvDescriptorSet0.cp_c6)._m0[int(_1655)][_1657];
    int _1661 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1663 = _1661 + _70;
    int _1665 = _1273 + 64;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    uint _1669 = uint(int(uint(int(_1667)) >> uint(2)));
    int _1671 = int(_1667) & 3;
    float _1673 = (*spvDescriptorSet0.cp_c6)._m0[int(_1669)][_1671];
    int _1675 = int(_1667) + 1;
    uint _1677 = uint(int(uint(_1675) >> uint(2)));
    int _1679 = _1675 & 3;
    float _1681 = (*spvDescriptorSet0.cp_c6)._m0[int(_1677)][_1679];
    int _1683 = _1273 + 88;
    uint _1685 = uint(int(uint(_1683) >> uint(2)));
    uint _1687 = uint(int(uint(int(_1685)) >> uint(2)));
    int _1689 = int(_1685) & 3;
    float _1691 = (*spvDescriptorSet0.cp_c6)._m0[int(_1687)][_1689];
    int _1693 = int(_1685) + 1;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    int _1697 = _1693 & 3;
    float _1699 = (*spvDescriptorSet0.cp_c6)._m0[int(_1695)][_1697];
    int _1701 = _1273 + 72;
    uint _1703 = uint(int(uint(_1701) >> uint(2)));
    uint _1705 = uint(int(uint(int(_1703)) >> uint(2)));
    int _1707 = int(_1703) & 3;
    float _1709 = (*spvDescriptorSet0.cp_c6)._m0[int(_1705)][_1707];
    int _1711 = int(_1703) + 1;
    uint _1713 = uint(int(uint(_1711) >> uint(2)));
    int _1715 = _1711 & 3;
    float _1717 = (*spvDescriptorSet0.cp_c6)._m0[int(_1713)][_1715];
    int _1719 = _1273 + 96;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    uint _1723 = uint(int(uint(int(_1721)) >> uint(2)));
    int _1725 = int(_1721) & 3;
    float _1727 = (*spvDescriptorSet0.cp_c6)._m0[int(_1723)][_1725];
    int _1729 = int(_1721) + 1;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    int _1733 = _1729 & 3;
    float _1735 = (*spvDescriptorSet0.cp_c6)._m0[int(_1731)][_1733];
    int _1737 = _1273 + 104;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    uint _1741 = uint(int(uint(int(_1739)) >> uint(2)));
    int _1743 = int(_1739) & 3;
    float _1745 = (*spvDescriptorSet0.cp_c6)._m0[int(_1741)][_1743];
    int _1747 = int(_1739) + 1;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    int _1751 = _1747 & 3;
    float _1753 = (*spvDescriptorSet0.cp_c6)._m0[int(_1749)][_1751];
    float _1755 = _1619 * _1651;
    float _1757 = _1621 * _1651;
    float _1759 = _1623 * _1651;
    int _1761 = _1273 + 16;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    uint _1765 = uint(int(uint(int(_1763)) >> uint(2)));
    int _1767 = int(_1763) & 3;
    float _1769 = (*spvDescriptorSet0.cp_c6)._m0[int(_1765)][_1767];
    int _1771 = int(_1763) + 1;
    uint _1773 = uint(int(uint(_1771) >> uint(2)));
    int _1775 = _1771 & 3;
    float _1777 = (*spvDescriptorSet0.cp_c6)._m0[int(_1773)][_1775];
    float _1779 = _1619 * _1659;
    float _1781 = _1623 * _1659;
    float _1783 = fma(_1625, _1673, _1755);
    float _1785 = fma(_1627, _1673, _1757);
    float _1787 = fma(_1629, _1673, _1759);
    float _1789 = _1621 * _1659;
    int _1791 = _1273 + 32;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    uint _1795 = uint(int(uint(int(_1793)) >> uint(2)));
    int _1797 = int(_1793) & 3;
    float _1799 = (*spvDescriptorSet0.cp_c6)._m0[int(_1795)][_1797];
    int _1801 = int(_1793) + 1;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    int _1805 = _1801 & 3;
    float _1807 = (*spvDescriptorSet0.cp_c6)._m0[int(_1803)][_1805];
    float _1809 = fma(_1625, _1681, _1779);
    float _1811 = fma(_1629, _1681, _1781);
    float _1813 = fma(_1627, _1681, _1789);
    float _1815 = _1619 * _1691;
    float _1817 = _1621 * _1691;
    float _1819 = _1623 * _1691;
    float _1821 = _1623 * _1699;
    int _1823 = _1273 + 48;
    uint _1825 = uint(int(uint(_1823) >> uint(2)));
    uint _1827 = uint(int(uint(int(_1825)) >> uint(2)));
    int _1829 = int(_1825) & 3;
    float _1831 = (*spvDescriptorSet0.cp_c6)._m0[int(_1827)][_1829];
    int _1833 = int(_1825) + 1;
    uint _1835 = uint(int(uint(_1833) >> uint(2)));
    int _1837 = _1833 & 3;
    float _1839 = (*spvDescriptorSet0.cp_c6)._m0[int(_1835)][_1837];
    float _1841 = _1619 * _1699;
    float _1843 = _1621 * _1699;
    float _1845 = fma(_1625, _1709, _1815);
    float _1847 = fma(_1627, _1709, _1817);
    float _1849 = fma(_1625, _1717, _1841);
    float _1851 = fma(_1627, _1717, _1843);
    int _1853 = _1273 + 40;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    uint _1857 = uint(int(uint(int(_1855)) >> uint(2)));
    int _1859 = int(_1855) & 3;
    float _1861 = (*spvDescriptorSet0.cp_c6)._m0[int(_1857)][_1859];
    int _1863 = int(_1855) + 1;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    int _1867 = _1863 & 3;
    float _1869 = (*spvDescriptorSet0.cp_c6)._m0[int(_1865)][_1867];
    float _1871 = fma(_1629, _1709, _1819);
    float _1873 = fma(_1629, _1717, _1821);
    float _1875 = fma(_1631, _1727, _1783);
    float _1877 = fma(_1633, _1727, _1785);
    float _1879 = fma(_1635, _1727, _1787);
    float _1881 = fma(_1633, _1735, _1813);
    int _1883 = _1273 + 24;
    uint _1885 = uint(int(uint(_1883) >> uint(2)));
    uint _1887 = uint(int(uint(int(_1885)) >> uint(2)));
    int _1889 = int(_1885) & 3;
    float _1891 = (*spvDescriptorSet0.cp_c6)._m0[int(_1887)][_1889];
    int _1893 = int(_1885) + 1;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    int _1897 = _1893 & 3;
    float _1899 = (*spvDescriptorSet0.cp_c6)._m0[int(_1895)][_1897];
    float _1901 = fma(_1631, _1735, _1809);
    float _1903 = fma(_1635, _1735, _1811);
    float _1905 = fma(_1631, _1745, _1845);
    float _1907 = fma(_1633, _1753, _1851);
    float _1909 = fma(_1635, _1753, _1873);
    float _1911 = fma(_1631, _1753, _1849);
    int _1913 = _1273 + 56;
    uint _1915 = uint(int(uint(_1913) >> uint(2)));
    uint _1917 = uint(int(uint(int(_1915)) >> uint(2)));
    int _1919 = int(_1915) & 3;
    float _1921 = (*spvDescriptorSet0.cp_c6)._m0[int(_1917)][_1919];
    int _1923 = int(_1915) + 1;
    uint _1925 = uint(int(uint(_1923) >> uint(2)));
    int _1927 = _1923 & 3;
    float _1929 = (*spvDescriptorSet0.cp_c6)._m0[int(_1925)][_1927];
    float _1931 = fma(_1633, _1745, _1847);
    float _1933 = _1907 + _1637;
    float _1935 = fma(_1635, _1745, _1871);
    float _1937 = _1909 + _1639;
    float _1939 = _1911 + _1641;
    float _1941 = _1877 * _1777;
    float _1943 = _1881 * _1777;
    float _1945 = _1931 * _1777;
    float _1947 = _1933 * _1777;
    float _1949 = fma(_1875, _1769, _1941);
    float _1951 = fma(_1901, _1769, _1943);
    float _1953 = fma(_1905, _1769, _1945);
    float _1955 = fma(_1939, _1769, _1947);
    float _1957 = _1877 * _1807;
    float _1959 = _1881 * _1807;
    float _1961 = _1931 * _1807;
    float _1963 = _1933 * _1807;
    float _1965 = fma(_1875, _1799, _1957);
    float _1967 = fma(_1901, _1799, _1959);
    float _1969 = fma(_1905, _1799, _1961);
    float _1971 = fma(_1939, _1799, _1963);
    float _1973 = _1877 * _1839;
    float _1975 = _1881 * _1839;
    float _1977 = _1931 * _1839;
    float _1979 = _1933 * _1839;
    float _1981 = fma(_1875, _1831, _1973);
    float _1983 = fma(_1901, _1831, _1975);
    float _1985 = fma(_1905, _1831, _1977);
    float _1987 = fma(_1939, _1831, _1979);
    float _1989 = fma(_1937, _1861, _1971);
    float _1991 = fma(_1879, _1861, _1965);
    float _1993 = fma(_1903, _1861, _1967);
    float _1995 = fma(_1935, _1861, _1969);
    float _1997 = _1989 + _1869;
    int _1999 = _1663 * 48;
    float _2001 = fma(_1937, _1891, _1955);
    float _2003 = fma(_1879, _1891, _1949);
    float _2005 = fma(_1903, _1891, _1951);
    float _2007 = fma(_1935, _1891, _1953);
    float _2009 = _2001 + _1899;
    int _2011 = _1999 + 16;
    int _2013 = _1999 + 32;
    float _2015 = fma(_1937, _1921, _1987);
    float _2017 = fma(_1879, _1921, _1981);
    float _2019 = fma(_1903, _1921, _1983);
    float _2021 = fma(_1935, _1921, _1985);
    float _2023 = _2015 + _1929;
    int _2025 = _1999 + 48;
    uint _2027 = uint(int(uint(_2011) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2027)] = as_type<uint>(_2003);
    int _2029 = _2011 + 4;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2031)] = as_type<uint>(_2005);
    int _2033 = _2011 + 8;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2035)] = as_type<uint>(_2007);
    int _2037 = _2011 + 12;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2039)] = as_type<uint>(_2009);
    uint _2041 = uint(int(uint(_2013) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2041)] = as_type<uint>(_1991);
    int _2043 = _2013 + 4;
    uint _2045 = uint(int(uint(_2043) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2045)] = as_type<uint>(_1993);
    int _2047 = _2013 + 8;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2049)] = as_type<uint>(_1995);
    int _2051 = _2013 + 12;
    uint _2053 = uint(int(uint(_2051) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2053)] = as_type<uint>(_1997);
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

