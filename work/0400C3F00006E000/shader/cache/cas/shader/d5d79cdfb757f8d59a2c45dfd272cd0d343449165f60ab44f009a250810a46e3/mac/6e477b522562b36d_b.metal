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
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _4505, thread const int& _4506, constant _10& support_buffer)
{
    int _4509 = 1 + _4506;
    float _4511 = support_buffer._m5[_4509].x;
    bool _4513 = _4511 == 1.0;
    if (_4513)
    {
        return _4505;
    }
    float _4515 = float(_4505);
    float _4517 = _4515 * _4511;
    int _4519 = int(_4517);
    return _4519;
}

static inline __attribute__((always_inline))
void _54(thread const int& _4197, thread const int& _4198, thread const int& _4199, thread const int& _4200, thread int& _4201, thread int& _4202, thread int& _4203, thread int& _4204, thread int& _4205, thread int& _4206)
{
    float _4209 = as_type<float>(_4200) + 0.0;
    bool _4211 = _4209 != 0.0;
    bool _4213 = isnan(_4209);
    bool _4215 = _4211 || _4213;
    bool _4217 = isnan(0.0);
    bool _4219 = _4215 || _4217;
    int _4221 = _4197;
    int _4223 = _4198;
    int _4225 = _4200;
    int _4227 = _4219 ? (-1) : 0;
    if (!_4219)
    {
        float _4229 = as_type<float>(_4200) * 1.0;
        _4221 = as_type<int>(_4229);
    }
    int _4231 = _4221;
    bool _4233 = !_4219;
    int _4235 = _4231;
    int _4237 = _4231;
    if (!_4233)
    {
        float _4239 = as_type<float>(_4200) + 0.0;
        bool _4241 = _4239 >= 0.0;
        bool _4243 = isnan(_4239);
        bool _4245 = _4241 || _4243;
        bool _4247 = isnan(0.0);
        bool _4249 = _4245 || _4247;
        _4227 = _4249 ? (-1) : 0;
        if (!_4249)
        {
            _4235 = 2147483647;
        }
        int _4251 = _4235;
        bool _4253 = !_4249;
        int _4255 = _4251;
        _4237 = _4251;
        if (!_4253)
        {
            float _4257 = as_type<float>(_4200) + 0.0;
            bool _4259 = _4257 > as_type<float>(0x7f800000u /* inf */);
            bool _4261 = isnan(_4257);
            bool _4263 = _4259 || _4261;
            bool _4265 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4267 = _4263 || _4265;
            _4227 = _4267 ? (-1) : 0;
            if (_4267)
            {
                float _4269 = as_type<float>(_4200) + 1.0;
                _4255 = as_type<int>(_4269);
            }
            int _4271 = _4255;
            int _4273 = _4271;
            _4237 = _4271;
            if (!_4267)
            {
                float _4275 = 0.0 + as_type<float>(_4200);
                bool _4277 = _4275 != as_type<float>(0x7f800000u /* inf */);
                bool _4279 = isnan(_4275);
                bool _4281 = _4277 || _4279;
                bool _4283 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4285 = _4281 || _4283;
                _4227 = _4285 ? (-1) : 0;
                if (!_4285)
                {
                    _4273 = _4200;
                }
                int _4287 = _4273;
                bool _4289 = !_4285;
                _4237 = _4287;
                if (!_4289)
                {
                    float _4291 = as_type<float>(_4200) * 18446744073709551616.0;
                    float _4293 = rsqrt(_4291);
                    float _4295 = _4291 * _4293;
                    float _4297 = _4293 * 0.5;
                    float _4299 = -_4295;
                    float _4301 = 0.0 + _4299;
                    float _4303 = fma(_4297, _4301, 0.5);
                    float _4305 = fma(_4295, _4303, _4295);
                    float _4307 = -_4305;
                    float _4309 = 0.0 + _4307;
                    float _4311 = fma(_4305, _4309, _4291);
                    float _4313 = fma(_4297, _4311, _4305);
                    float _4315 = _4313 * 2.3283064365386962890625e-10;
                    _4237 = as_type<int>(_4315);
                    _4223 = as_type<int>(_4305);
                    _4225 = as_type<int>(_4301);
                }
            }
        }
    }
    int _4317 = _4237;
    int _4319 = _4223;
    int _4321 = _4225;
    int _4323 = _4227;
    _4201 = _4199;
    _4202 = 0;
    _4203 = _4317;
    _4204 = _4319;
    _4205 = _4321;
    _4206 = _4323;
}

static inline __attribute__((always_inline))
int _58(thread const int& _4540, thread const int& _4541, thread const int& _4542, thread int& _4543, thread uint& gl_SubgroupInvocationID)
{
    int _4546 = _4542 & 31;
    uint _4548 = uint(int(uint(_4542) >> uint(8)));
    int _4550 = int(_4548) & 31;
    float _4552 = as_type<float>(gl_SubgroupInvocationID);
    int _4554 = as_type<int>(_4552) & _4550;
    int _4556 = ~_4550;
    int _4558 = _4546 & _4556;
    int _4560 = _4558 | _4554;
    int _4562 = ~_4550;
    int _4564 = _4541 & _4562;
    int _4566 = _4564 | _4554;
    bool _4568 = uint(_4566) <= uint(_4560);
    _4543 = _4568 ? (-1) : 0;
    float _4570 = spvSubgroupShuffle(as_type<float>(_4540), uint(_4566));
    uint _4572 = uint(_4568 ? as_type<int>(_4570) : _4540);
    return int(_4572);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1351 = false;
    bool _891 = false;
    bool _581 = false;
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
    float _135 = as_type<float>(_68);
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
    float _155 = _151;
    if (_129)
    {
        uint _157 = uint(int(uint(_101) >> uint(2)));
        uint _159 = uint(int(uint(int(_157)) >> uint(2)));
        int _161 = int(_157) & 3;
        float _163 = (*spvDescriptorSet0.cp_c5)._m0[int(_159)][_161];
        _153 = as_type<int>(_163);
    }
    int _165 = _153;
    float _167 = 0.0;
    if (_129)
    {
        _167 = 2.8025969286496341418474591665798e-45;
    }
    float _169 = _167;
    if (_129)
    {
        _133 = 1.4012984643248170709237295832899e-45;
    }
    float _171 = _133;
    float _173 = as_type<float>(_147);
    float _175 = _121;
    float _177 = 0.0;
    if (_125)
    {
        int _179 = _68;
        int _181 = 0;
        int _183 = _56(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = _147;
        int _187 = 0;
        int _189 = _56(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _2004 = int3(_183, _189, as_type<int>(_151));
        float3 _193 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2004.xy), uint(_2004.z), 0).xyz;
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
    float _209 = as_type<float>(_68);
    float _211 = 0.0;
    if (_129)
    {
        int _213 = _68;
        int _215 = 1;
        int _217 = _56(_213, _215, (*spvDescriptorSet0.support_buffer));
        int _219 = _165;
        int _221 = 1;
        int _223 = _56(_219, _221, (*spvDescriptorSet0.support_buffer));
        int3 _2032 = int3(_217, _223, 0);
        float3 _225 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2032.xy), uint(_2032.z), 0).xyz;
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
    float _241 = as_type<float>(_68);
    float _243 = 0.0;
    if (_129)
    {
        int _245 = _68;
        int _247 = 1;
        int _249 = _56(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = _165;
        int _253 = 1;
        int _255 = _56(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _2063 = int3(_249, _255, as_type<int>(_169));
        float3 _257 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2063.xy), uint(_2063.z), 0).xyz;
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
    if (_129)
    {
        int _277 = _68;
        int _279 = 1;
        int _281 = _56(_277, _279, (*spvDescriptorSet0.support_buffer));
        int _283 = _165;
        int _285 = 1;
        int _287 = _56(_283, _285, (*spvDescriptorSet0.support_buffer));
        int3 _2092 = int3(_281, _287, as_type<int>(_171));
        float3 _289 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2092.xy), uint(_2092.z), 0).xyz;
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
    if (!_129)
    {
        _303 = 0.0;
        _305 = 0.0;
    }
    float _307 = _303;
    float _309 = _305;
    float _311 = 0.0;
    float _313 = 0.0;
    float _315 = _307;
    float _317 = _309;
    if (!_129)
    {
        _311 = 0.0;
        _313 = 0.0;
    }
    float _319 = _311;
    float _321 = _313;
    float _323 = 0.0;
    float _325 = 0.0;
    float _327 = _319;
    float _329 = _321;
    if (!_129)
    {
        _323 = 0.0;
        _325 = 0.0;
    }
    float _331 = _323;
    float _333 = _325;
    float _335 = 0.0;
    float _337 = _331;
    float _339 = _333;
    if (!_129)
    {
        _335 = 0.0;
    }
    float _341 = _335;
    float _343 = _341;
    if (!_129)
    {
        _155 = 0.0;
        _135 = 0.0;
    }
    float _345 = _155;
    float _347 = _135;
    bool _349 = !_129;
    float _351 = _345;
    float _353 = _347;
    if (!_349)
    {
        _351 = _301;
        _353 = _299;
        _343 = _297;
        _315 = _233;
        _327 = _237;
        _337 = _267;
        _317 = _235;
        _329 = _265;
        _339 = _269;
    }
    float _355 = _351;
    float _357 = _353;
    float _359 = _343;
    float _361 = _315;
    float _363 = _327;
    float _365 = _337;
    float _367 = _317;
    float _369 = _329;
    float _371 = _339;
    bool _373 = !_125;
    float _861;
    float _863;
    float _865;
    float _867;
    float _869;
    float _871;
    float _873;
    float _875;
    float _877;
    float _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    if (!_373)
    {
        float _375 = _355 * 0.5;
        float _377 = _357 * 0.5;
        float _379 = _205 * 0.5;
        float _381 = _203 * 0.5;
        float _383 = _375 * 0.15915493667125701904296875;
        float _385 = _377 * 0.15915493667125701904296875;
        float _387 = _359 * 0.5;
        float _389 = _379 * 0.15915493667125701904296875;
        float _391 = _381 * 0.15915493667125701904296875;
        float _393 = _383 * 6.283185482025146484375;
        float _395 = cos(_393);
        float _397 = _201 * 0.5;
        float _399 = _387 * 0.15915493667125701904296875;
        float _401 = _397 * 0.15915493667125701904296875;
        float _403 = _385 * 6.283185482025146484375;
        float _405 = cos(_403);
        float _407 = _385 * 6.283185482025146484375;
        float _409 = sin(_407);
        float _411 = _383 * 6.283185482025146484375;
        float _413 = sin(_411);
        float _415 = _395 * _405;
        float _417 = _389 * 6.283185482025146484375;
        float _419 = cos(_417);
        float _421 = _391 * 6.283185482025146484375;
        float _423 = cos(_421);
        float _425 = _405 * _413;
        float _427 = _391 * 6.283185482025146484375;
        float _429 = sin(_427);
        float _431 = _389 * 6.283185482025146484375;
        float _433 = sin(_431);
        float _435 = _399 * 6.283185482025146484375;
        float _437 = sin(_435);
        float _439 = _419 * _429;
        float _441 = _401 * 6.283185482025146484375;
        float _443 = sin(_441);
        float _445 = _399 * 6.283185482025146484375;
        float _447 = cos(_445);
        float _449 = _401 * 6.283185482025146484375;
        float _451 = cos(_449);
        float _453 = _395 * _409;
        float _455 = _413 * _409;
        float _457 = _419 * _423;
        float _459 = _433 * _429;
        float _461 = _423 * _433;
        float _463 = _437 * _425;
        float _465 = _437 * _455;
        float _467 = _447 * _455;
        float _469 = _443 * _461;
        float _471 = fma(_447, _453, _463);
        float _473 = _437 * _453;
        float _475 = -_467;
        float _477 = fma(_437, _415, _475);
        float _479 = _451 * _459;
        float _481 = fma(_451, _439, _469);
        float _483 = _443 * _439;
        float _485 = -_479;
        float _487 = fma(_443, _457, _485);
        float _489 = _471 * _481;
        float _491 = _443 * _459;
        float _493 = -_473;
        float _495 = fma(_447, _425, _493);
        float _497 = -_483;
        float _499 = fma(_451, _461, _497);
        float _501 = fma(_477, _487, _489);
        float _503 = fma(_447, _415, _465);
        float _505 = fma(_451, _457, _491);
        float _507 = fma(_495, _499, _501);
        float _509 = fma(_503, _505, _507);
        float _511 = precise::max(_509, -1.0);
        float _513 = precise::min(_511, 1.0);
        bool _515 = _513 >= 0.0;
        bool _517 = isnan(_513);
        bool _519 = _515 || _517;
        bool _521 = isnan(0.0);
        bool _523 = _519 || _521;
        bool _525 = !_523;
        float _527 = -_513;
        float _529 = _525 ? _527 : _513;
        bool _531 = _529 < 0.0;
        float _533 = float(_531);
        float _535 = abs(_529);
        float _537 = -_535;
        float _539 = _537 + 1.0;
        float _541 = abs(_529);
        float _543 = fma(_541, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _545 = as_type<int>(_539) + (-218103808);
        float _547 = abs(_529);
        float _549 = fma(_547, _543, -0.212114393711090087890625);
        bool _551 = uint(_545) >= 1920991232u;
        float _553 = abs(_529);
        float _555 = fma(_553, _549, 1.570728778839111328125);
        bool _557 = !_551;
        float _579;
        if (!_557)
        {
            int _559 = as_type<int>(_457);
            int _561 = as_type<int>(_425);
            int _563 = 1808;
            int _565 = as_type<int>(_539);
            int _567;
            int _569;
            int _571;
            int _573;
            int _575;
            int _577;
            _54(_559, _561, _563, _565, _567, _569, _571, _573, _575, _577);
            _579 = as_type<float>(_571);
            _581 = true;
        }
        else
        {
            float _583 = rsqrt(_539);
            float _585 = _539 * _583;
            float _587 = _583 * 0.5;
            float _589 = -_585;
            float _591 = 0.0 + _589;
            float _593 = fma(_587, _591, 0.5);
            float _595 = fma(_585, _593, _585);
            float _597 = -_595;
            float _599 = 0.0 + _597;
            float _601 = fma(_595, _599, _539);
            float _603 = fma(_587, _601, _595);
            _579 = _603;
        }
        _581 = false;
        float _605 = _579;
        int _607 = _101 + 8;
        uint _609 = uint(int(uint(_607) >> uint(2)));
        uint _611 = uint(int(uint(int(_609)) >> uint(2)));
        int _613 = int(_609) & 3;
        float _615 = (*spvDescriptorSet0.cp_c5)._m0[int(_611)][_613];
        int _617 = _68;
        int _619 = 0;
        int _621 = _56(_617, _619, (*spvDescriptorSet0.support_buffer));
        int _623 = as_type<int>(_615);
        int _625 = 0;
        int _627 = _56(_623, _625, (*spvDescriptorSet0.support_buffer));
        int3 _2491 = int3(_621, _627, 0);
        float3 _629 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2491.xy), uint(_2491.z), 0).xyz;
        float _631 = _629.x;
        float _633 = _629.y;
        float _635 = _629.z;
        int _637 = _68;
        int _639 = 0;
        int _641 = _56(_637, _639, (*spvDescriptorSet0.support_buffer));
        int _643 = as_type<int>(_615);
        int _645 = 0;
        int _647 = _56(_643, _645, (*spvDescriptorSet0.support_buffer));
        int3 _2509 = int3(_641, _647, 2);
        float3 _649 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2509.xy), uint(_2509.z), 0).xyz;
        float _651 = _649.x;
        float _653 = _649.y;
        float _655 = _649.z;
        float _657 = _555 * _605;
        float _659 = _533 * 2.0;
        float _661 = -_659;
        float _663 = fma(_657, _661, _657);
        float _665 = fma(_533, 3.1415927410125732421875, _663);
        float _667 = _665 * 0.15915493667125701904296875;
        float _669 = _667 * 6.283185482025146484375;
        float _671 = sin(_669);
        float _673 = abs(_671);
        bool _675 = _673 >= 0.001000000047497451305389404296875;
        bool _677 = isnan(_673);
        bool _679 = _675 || _677;
        bool _681 = isnan(0.001000000047497451305389404296875);
        bool _683 = _679 || _681;
        float _685 = _533;
        float _687 = _659;
        float _689 = _663;
        if (!_683)
        {
            int _691 = _101 + 28;
            uint _693 = uint(int(uint(_691) >> uint(2)));
            uint _695 = uint(int(uint(int(_693)) >> uint(2)));
            int _697 = int(_693) & 3;
            float _699 = (*spvDescriptorSet0.cp_c5)._m0[int(_695)][_697];
            _685 = _699;
        }
        float _701 = _685;
        float _703 = _701;
        if (!_683)
        {
            float _705 = -_701;
            float _707 = _705 + 1.0;
            _687 = _707;
        }
        float _709 = _687;
        float _711 = _709;
        if (!_683)
        {
            _689 = _701;
        }
        float _713 = _689;
        bool _715 = !_683;
        float _717 = _713;
        if (!_715)
        {
            int _719 = _101 + 28;
            uint _721 = uint(int(uint(_719) >> uint(2)));
            uint _723 = uint(int(uint(int(_721)) >> uint(2)));
            int _725 = int(_721) & 3;
            float _727 = (*spvDescriptorSet0.cp_c5)._m0[int(_723)][_725];
            float _729 = 1.0 / _671;
            float _731 = _665 * _727;
            float _733 = _731 * 0.15915493667125701904296875;
            float _735 = -_731;
            float _737 = _665 + _735;
            float _739 = _737 * 0.15915493667125701904296875;
            float _741 = _733 * 6.283185482025146484375;
            float _743 = sin(_741);
            float _745 = _739 * 6.283185482025146484375;
            float _747 = sin(_745);
            float _749 = _743 * _729;
            float _751 = _747 * _729;
            _717 = _749;
            _703 = _727;
            _711 = _751;
        }
        float _753 = _717;
        float _755 = _703;
        float _757 = _711;
        bool _759 = !_523;
        float _761 = -_753;
        float _763 = _759 ? _761 : _753;
        int _765 = _101 + 20;
        uint _767 = uint(int(uint(_765) >> uint(2)));
        uint _769 = uint(int(uint(int(_767)) >> uint(2)));
        int _771 = int(_767) & 3;
        float _773 = (*spvDescriptorSet0.cp_c5)._m0[int(_769)][_771];
        float _775 = _631 * _755;
        float _777 = _505 * _763;
        float _779 = _487 * _763;
        float _781 = _481 * _763;
        float _783 = _499 * _763;
        float _785 = fma(_503, _757, _777);
        float _787 = fma(_477, _757, _779);
        float _789 = fma(_471, _757, _781);
        float _791 = fma(_495, _757, _783);
        float _793 = _785 * 2.0;
        float _795 = _787 * _787;
        float _797 = _789 * 2.0;
        float _799 = _787 * _793;
        float _801 = _787 * 2.0;
        float _803 = fma(_795, -2.0, 1.0);
        float _805 = _791 * _793;
        float _807 = -_799;
        float _809 = fma(_791, _797, _807);
        float _811 = fma(_791, _797, _799);
        float _813 = _789 * _789;
        float _815 = _633 * _755;
        float _817 = fma(_361, _773, _775);
        float _819 = _789 * _793;
        float _821 = _635 * _755;
        float _823 = -_805;
        float _825 = fma(_789, _801, _823);
        float _827 = fma(_789, _801, _805);
        float _829 = _651 * _755;
        float _831 = _791 * _791;
        float _833 = fma(_813, -2.0, 1.0);
        float _835 = _653 * _755;
        float _837 = _655 * _755;
        float _839 = fma(_791, _801, _819);
        float _841 = -_819;
        float _843 = fma(_791, _801, _841);
        float _845 = fma(_831, -2.0, _833);
        float _847 = fma(_363, _773, _821);
        float _849 = fma(_365, _773, _835);
        float _851 = fma(_831, -2.0, _803);
        float _853 = fma(_813, -2.0, _803);
        float _855 = fma(_367, _773, _815);
        float _857 = fma(_369, _773, _829);
        float _859 = fma(_371, _773, _837);
        _861 = _817;
        _863 = _845;
        _865 = _827;
        _867 = _843;
        _869 = _855;
        _871 = _811;
        _873 = _847;
        _875 = _839;
        _877 = _809;
        _879 = _853;
        _881 = _825;
        _883 = _851;
        _885 = _859;
        _887 = _849;
        _889 = _857;
        _891 = true;
    }
    else
    {
        float _893 = _359 * 0.15915493667125701904296875;
        float _895 = _355 * 0.15915493667125701904296875;
        float _897 = _357 * 0.15915493667125701904296875;
        float _899 = _893 * 6.283185482025146484375;
        float _901 = cos(_899);
        float _903 = _895 * 6.283185482025146484375;
        float _905 = sin(_903);
        float _907 = _895 * 6.283185482025146484375;
        float _909 = cos(_907);
        float _911 = _893 * 6.283185482025146484375;
        float _913 = sin(_911);
        float _915 = _905 * _901;
        float _917 = _897 * 6.283185482025146484375;
        float _919 = cos(_917);
        float _921 = _901 * _909;
        float _923 = _897 * 6.283185482025146484375;
        float _925 = sin(_923);
        float _927 = _913 * _905;
        float _929 = _901 * _919;
        float _931 = _919 * _909;
        float _933 = _905 * _919;
        float _935 = _913 * _919;
        float _937 = _913 * _909;
        float _939 = _913 * _925;
        float _941 = -_915;
        float _943 = fma(_909, _939, _941);
        float _945 = fma(_905, _939, _921);
        float _947 = fma(_925, _921, _927);
        float _949 = -_937;
        float _951 = fma(_925, _915, _949);
        float _953 = -_925;
        float _955 = _953 + (-0.0);
        _861 = _361;
        _863 = _931;
        _865 = _933;
        _867 = _955;
        _869 = _367;
        _871 = _935;
        _873 = _363;
        _875 = _947;
        _877 = _951;
        _879 = _929;
        _881 = _943;
        _883 = _945;
        _885 = _371;
        _887 = _365;
        _889 = _369;
    }
    _891 = false;
    float _957 = _861;
    float _959 = _863;
    float _961 = _865;
    float _963 = _867;
    float _965 = _869;
    float _967 = _871;
    float _969 = _873;
    float _971 = _875;
    float _973 = _877;
    float _975 = _879;
    float _977 = _881;
    float _979 = _883;
    float _981 = _885;
    float _983 = _887;
    float _985 = _889;
    bool _987 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _989 = _957 * _959;
    float _991 = _957 * _961;
    float _993 = _957 * _963;
    float _995 = _965 * _967;
    float _997 = _969 * _971;
    float _999 = _969 * _973;
    float _1001 = _969 * _975;
    float _1003 = _965 * _977;
    float _1005 = _965 * _979;
    int _1007 = _68 * 112;
    bool _1009 = !_987;
    float _1327;
    float _1329;
    float _1331;
    float _1333;
    float _1335;
    float _1337;
    float _1339;
    float _1341;
    float _1343;
    float _1345;
    float _1347;
    float _1349;
    if (!_1009)
    {
        int _1011 = 0;
        float _1013 = _989;
        float _1015 = _1003;
        float _1017 = _997;
        float _1019 = _985;
        float _1021 = _991;
        float _1023 = _1005;
        float _1025 = _999;
        float _1027 = _983;
        float _1029 = _993;
        float _1031 = _995;
        float _1033 = _1001;
        float _1035 = _981;
        bool _1037;
        int _1085;
        int _1095;
        int _1105;
        int _1115;
        int _1125;
        int _1135;
        int _1145;
        int _1155;
        int _1165;
        int _1175;
        int _1185;
        int _1195;
        int _1303;
        int _1307;
        int _1309;
        int _1313;
        float _1315;
        int _1317;
        float _1321;
        int _1323;
        int _1325;
        do
        {
            int _1039 = _1011;
            int _1041 = as_type<int>(_1013);
            int _1043 = as_type<int>(_1015);
            int _1045 = as_type<int>(_1017);
            int _1047 = as_type<int>(_1019);
            int _1049 = as_type<int>(_1021);
            int _1051 = as_type<int>(_1023);
            float _1053 = _1025;
            int _1055 = as_type<int>(_1027);
            int _1057 = as_type<int>(_1029);
            float _1059 = _1031;
            int _1061 = as_type<int>(_1033);
            int _1063 = as_type<int>(_1035);
            uint _1065 = uint(int(uint(_1007) >> uint(2)));
            uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
            int _1069 = int(_1065) & 3;
            float _1071 = (*spvDescriptorSet0.cp_c6)._m0[int(_1067)][_1069];
            bool _1073 = _68 != 0;
            int _1075 = _1039 + 1;
            bool _1077 = uint(_1075) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1079 = _1041;
            int _1081 = as_type<int>(_1071);
            int _1083 = 31;
            int _3055 = _58(_1079, _1081, _1083, _1085, gl_SubgroupInvocationID);
            int _1087 = _3055;
            int _1089 = _1043;
            int _1091 = as_type<int>(_1071);
            int _1093 = 31;
            int _3059 = _58(_1089, _1091, _1093, _1095, gl_SubgroupInvocationID);
            int _1097 = _3059;
            int _1099 = _1045;
            int _1101 = as_type<int>(_1071);
            int _1103 = 31;
            int _3063 = _58(_1099, _1101, _1103, _1105, gl_SubgroupInvocationID);
            int _1107 = _3063;
            int _1109 = _1047;
            int _1111 = as_type<int>(_1071);
            int _1113 = 31;
            int _3067 = _58(_1109, _1111, _1113, _1115, gl_SubgroupInvocationID);
            int _1117 = _3067;
            int _1119 = _1049;
            int _1121 = as_type<int>(_1071);
            int _1123 = 31;
            int _3071 = _58(_1119, _1121, _1123, _1125, gl_SubgroupInvocationID);
            int _1127 = _3071;
            int _1129 = _1051;
            int _1131 = as_type<int>(_1071);
            int _1133 = 31;
            int _3075 = _58(_1129, _1131, _1133, _1135, gl_SubgroupInvocationID);
            int _1137 = _3075;
            int _1139 = as_type<int>(_1053);
            int _1141 = as_type<int>(_1071);
            int _1143 = 31;
            int _3080 = _58(_1139, _1141, _1143, _1145, gl_SubgroupInvocationID);
            int _1147 = _3080;
            int _1149 = _1055;
            int _1151 = as_type<int>(_1071);
            int _1153 = 31;
            int _3084 = _58(_1149, _1151, _1153, _1155, gl_SubgroupInvocationID);
            int _1157 = _3084;
            int _1159 = _1057;
            int _1161 = as_type<int>(_1071);
            int _1163 = 31;
            int _3088 = _58(_1159, _1161, _1163, _1165, gl_SubgroupInvocationID);
            int _1167 = _3088;
            int _1169 = as_type<int>(_1059);
            int _1171 = as_type<int>(_1071);
            int _1173 = 31;
            int _3093 = _58(_1169, _1171, _1173, _1175, gl_SubgroupInvocationID);
            int _1177 = _3093;
            int _1179 = _1061;
            int _1181 = as_type<int>(_1071);
            int _1183 = 31;
            int _3097 = _58(_1179, _1181, _1183, _1185, gl_SubgroupInvocationID);
            int _1187 = _3097;
            int _1189 = _1063;
            int _1191 = as_type<int>(_1071);
            int _1193 = 31;
            int _3101 = _58(_1189, _1191, _1193, _1195, gl_SubgroupInvocationID);
            int _1197 = _3101;
            bool _1199 = !_1073;
            _1011 = _1075;
            int _1201 = _1041;
            int _1203 = _1043;
            int _1205 = _1045;
            int _1207 = _1047;
            int _1209 = _1049;
            int _1211 = _1051;
            float _1213 = _1053;
            int _1215 = _1055;
            int _1217 = _1057;
            float _1219 = _1059;
            int _1221 = _1061;
            int _1223 = _1063;
            if (!_1199)
            {
                float _1225 = _991 * as_type<float>(_1097);
                float _1227 = _1005 * as_type<float>(_1097);
                float _1229 = _999 * as_type<float>(_1137);
                float _1231 = _999 * as_type<float>(_1097);
                float _1233 = fma(_989, as_type<float>(_1087), _1225);
                float _1235 = fma(_1003, as_type<float>(_1087), _1227);
                float _1237 = _991 * as_type<float>(_1137);
                float _1239 = _1005 * as_type<float>(_1137);
                float _1241 = as_type<float>(_1097) * _983;
                float _1243 = as_type<float>(_1137) * _983;
                float _1245 = fma(_989, as_type<float>(_1127), _1237);
                float _1247 = fma(_1003, as_type<float>(_1127), _1239);
                float _1249 = fma(_997, as_type<float>(_1127), _1229);
                float _1251 = _991 * as_type<float>(_1177);
                float _1253 = _1005 * as_type<float>(_1177);
                float _1255 = _999 * as_type<float>(_1177);
                float _1257 = as_type<float>(_1177) * _983;
                float _1259 = fma(_997, as_type<float>(_1087), _1231);
                float _1261 = fma(as_type<float>(_1087), _985, _1241);
                float _1263 = fma(as_type<float>(_1127), _985, _1243);
                float _1265 = fma(_989, as_type<float>(_1167), _1251);
                float _1267 = fma(_1003, as_type<float>(_1167), _1253);
                float _1269 = fma(_997, as_type<float>(_1167), _1255);
                float _1271 = fma(as_type<float>(_1167), _985, _1257);
                float _1273 = fma(_1001, as_type<float>(_1107), _1259);
                float _1275 = fma(_993, as_type<float>(_1107), _1233);
                float _1277 = fma(_995, as_type<float>(_1107), _1235);
                float _1279 = fma(_993, as_type<float>(_1147), _1245);
                float _1281 = fma(_995, as_type<float>(_1147), _1247);
                float _1283 = fma(_1001, as_type<float>(_1147), _1249);
                float _1285 = fma(as_type<float>(_1107), _981, _1261);
                float _1287 = fma(as_type<float>(_1147), _981, _1263);
                float _1289 = fma(as_type<float>(_1187), _981, _1271);
                float _1291 = fma(_993, as_type<float>(_1187), _1265);
                float _1293 = fma(_995, as_type<float>(_1187), _1267);
                float _1295 = fma(_1001, as_type<float>(_1187), _1269);
                float _1297 = as_type<float>(_1117) + _1285;
                float _1299 = as_type<float>(_1157) + _1287;
                float _1301 = as_type<float>(_1197) + _1289;
                _1201 = as_type<int>(_1275);
                _1203 = as_type<int>(_1277);
                _1205 = as_type<int>(_1273);
                _1207 = as_type<int>(_1297);
                _1209 = as_type<int>(_1279);
                _1211 = as_type<int>(_1281);
                _1213 = _1283;
                _1215 = as_type<int>(_1299);
                _1217 = as_type<int>(_1291);
                _1219 = _1293;
                _1221 = as_type<int>(_1295);
                _1223 = as_type<int>(_1301);
            }
            _1303 = _1201;
            int _1305 = _1203;
            _1307 = _1205;
            _1309 = _1207;
            int _1311 = _1209;
            _1313 = _1211;
            _1315 = _1213;
            _1317 = _1215;
            int _1319 = _1217;
            _1321 = _1219;
            _1323 = _1221;
            _1325 = _1223;
            _1037 = !_1077;
            _1013 = as_type<float>(_1303);
            _1015 = as_type<float>(_1305);
            _1017 = as_type<float>(_1307);
            _1019 = as_type<float>(_1309);
            _1021 = as_type<float>(_1311);
            _1023 = as_type<float>(_1313);
            _1025 = _1315;
            _1027 = as_type<float>(_1317);
            _1029 = as_type<float>(_1319);
            _1031 = _1321;
            _1033 = as_type<float>(_1323);
            _1035 = as_type<float>(_1325);
            _1327 = as_type<float>(_1305);
            _1329 = as_type<float>(_1311);
            _1331 = as_type<float>(_1319);
        } while (_1037);
        _1333 = as_type<float>(_1313);
        _1335 = _1321;
        _1337 = as_type<float>(_1303);
        _1339 = _1315;
        _1341 = as_type<float>(_1317);
        _1343 = as_type<float>(_1307);
        _1345 = as_type<float>(_1323);
        _1347 = as_type<float>(_1309);
        _1349 = as_type<float>(_1325);
        _1351 = true;
    }
    else
    {
        _1327 = _1003;
        _1333 = _1005;
        _1335 = _995;
        _1337 = _989;
        _1329 = _991;
        _1331 = _993;
        _1339 = _999;
        _1341 = _983;
        _1343 = _997;
        _1345 = _1001;
        _1347 = _985;
        _1349 = _981;
    }
    _1351 = false;
    float _1353 = _1327;
    float _1355 = _1333;
    float _1357 = _1335;
    float _1359 = _1337;
    float _1361 = _1329;
    float _1363 = _1331;
    float _1365 = _1339;
    float _1367 = _1341;
    float _1369 = _1343;
    float _1371 = _1345;
    float _1373 = _1347;
    float _1375 = _1349;
    int _1377 = _1007 + 80;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.cp_c6)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.cp_c6)._m0[int(_1389)][_1391];
    int _1395 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1397 = _1395 + _68;
    int _1399 = _1007 + 64;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.cp_c6)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.cp_c6)._m0[int(_1411)][_1413];
    int _1417 = _1397 * 48;
    int _1419 = _1007 + 88;
    uint _1421 = uint(int(uint(_1419) >> uint(2)));
    uint _1423 = uint(int(uint(int(_1421)) >> uint(2)));
    int _1425 = int(_1421) & 3;
    float _1427 = (*spvDescriptorSet0.cp_c6)._m0[int(_1423)][_1425];
    int _1429 = int(_1421) + 1;
    uint _1431 = uint(int(uint(_1429) >> uint(2)));
    int _1433 = _1429 & 3;
    float _1435 = (*spvDescriptorSet0.cp_c6)._m0[int(_1431)][_1433];
    int _1437 = _1007 + 72;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.cp_c6)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.cp_c6)._m0[int(_1449)][_1451];
    int _1455 = _1007 + 104;
    uint _1457 = uint(int(uint(_1455) >> uint(2)));
    uint _1459 = uint(int(uint(int(_1457)) >> uint(2)));
    int _1461 = int(_1457) & 3;
    float _1463 = (*spvDescriptorSet0.cp_c6)._m0[int(_1459)][_1461];
    int _1465 = int(_1457) + 1;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    int _1469 = _1465 & 3;
    float _1471 = (*spvDescriptorSet0.cp_c6)._m0[int(_1467)][_1469];
    int _1473 = _1007 + 96;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    uint _1477 = uint(int(uint(int(_1475)) >> uint(2)));
    int _1479 = int(_1475) & 3;
    float _1481 = (*spvDescriptorSet0.cp_c6)._m0[int(_1477)][_1479];
    int _1483 = int(_1475) + 1;
    uint _1485 = uint(int(uint(_1483) >> uint(2)));
    int _1487 = _1483 & 3;
    float _1489 = (*spvDescriptorSet0.cp_c6)._m0[int(_1485)][_1487];
    float _1491 = _1353 * _1385;
    float _1493 = _1355 * _1385;
    float _1495 = _1357 * _1385;
    int _1497 = _1007 + 16;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.cp_c6)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.cp_c6)._m0[int(_1509)][_1511];
    float _1515 = _1357 * _1393;
    float _1517 = fma(_1359, _1407, _1491);
    float _1519 = fma(_1361, _1407, _1493);
    float _1521 = fma(_1363, _1407, _1495);
    float _1523 = _1353 * _1393;
    int _1525 = _1007 + 32;
    uint _1527 = uint(int(uint(_1525) >> uint(2)));
    uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
    int _1531 = int(_1527) & 3;
    float _1533 = (*spvDescriptorSet0.cp_c6)._m0[int(_1529)][_1531];
    int _1535 = int(_1527) + 1;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    int _1539 = _1535 & 3;
    float _1541 = (*spvDescriptorSet0.cp_c6)._m0[int(_1537)][_1539];
    float _1543 = _1355 * _1393;
    float _1545 = fma(_1363, _1415, _1515);
    float _1547 = fma(_1359, _1415, _1523);
    float _1549 = _1353 * _1427;
    float _1551 = _1353 * _1435;
    float _1553 = _1355 * _1427;
    float _1555 = _1355 * _1435;
    int _1557 = _1007 + 48;
    uint _1559 = uint(int(uint(_1557) >> uint(2)));
    uint _1561 = uint(int(uint(int(_1559)) >> uint(2)));
    int _1563 = int(_1559) & 3;
    float _1565 = (*spvDescriptorSet0.cp_c6)._m0[int(_1561)][_1563];
    int _1567 = int(_1559) + 1;
    uint _1569 = uint(int(uint(_1567) >> uint(2)));
    int _1571 = _1567 & 3;
    float _1573 = (*spvDescriptorSet0.cp_c6)._m0[int(_1569)][_1571];
    float _1575 = _1357 * _1427;
    float _1577 = _1357 * _1435;
    float _1579 = fma(_1361, _1415, _1543);
    float _1581 = fma(_1359, _1445, _1549);
    float _1583 = fma(_1359, _1453, _1551);
    float _1585 = fma(_1361, _1445, _1553);
    float _1587 = fma(_1361, _1453, _1555);
    int _1589 = _1007 + 24;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.cp_c6)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.cp_c6)._m0[int(_1601)][_1603];
    float _1607 = fma(_1363, _1445, _1575);
    float _1609 = fma(_1363, _1453, _1577);
    float _1611 = fma(_1365, _1471, _1587);
    int _1613 = _1007 + 40;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    uint _1617 = uint(int(uint(int(_1615)) >> uint(2)));
    int _1619 = int(_1615) & 3;
    float _1621 = (*spvDescriptorSet0.cp_c6)._m0[int(_1617)][_1619];
    int _1623 = int(_1615) + 1;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    int _1627 = _1623 & 3;
    float _1629 = (*spvDescriptorSet0.cp_c6)._m0[int(_1625)][_1627];
    float _1631 = _1611 + _1367;
    float _1633 = fma(_1369, _1481, _1517);
    float _1635 = fma(_1365, _1481, _1519);
    float _1637 = fma(_1371, _1481, _1521);
    float _1639 = fma(_1369, _1489, _1547);
    int _1641 = _1007 + 56;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    uint _1645 = uint(int(uint(int(_1643)) >> uint(2)));
    int _1647 = int(_1643) & 3;
    float _1649 = (*spvDescriptorSet0.cp_c6)._m0[int(_1645)][_1647];
    int _1651 = int(_1643) + 1;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    int _1655 = _1651 & 3;
    float _1657 = (*spvDescriptorSet0.cp_c6)._m0[int(_1653)][_1655];
    float _1659 = fma(_1369, _1463, _1581);
    float _1661 = fma(_1369, _1471, _1583);
    float _1663 = fma(_1371, _1471, _1609);
    float _1665 = fma(_1365, _1489, _1579);
    float _1667 = fma(_1365, _1463, _1585);
    float _1669 = fma(_1371, _1463, _1607);
    float _1671 = _1661 + _1373;
    float _1673 = _1663 + _1375;
    float _1675 = _1631 * _1513;
    float _1677 = _1635 * _1513;
    float _1679 = _1665 * _1513;
    float _1681 = _1667 * _1513;
    float _1683 = fma(_1671, _1505, _1675);
    float _1685 = fma(_1633, _1505, _1677);
    float _1687 = fma(_1639, _1505, _1679);
    float _1689 = _1631 * _1541;
    float _1691 = fma(_1659, _1505, _1681);
    float _1693 = _1635 * _1541;
    float _1695 = fma(_1371, _1489, _1545);
    float _1697 = _1665 * _1541;
    float _1699 = _1667 * _1541;
    float _1701 = fma(_1671, _1533, _1689);
    float _1703 = fma(_1633, _1533, _1693);
    float _1705 = _1631 * _1573;
    float _1707 = _1635 * _1573;
    float _1709 = _1665 * _1573;
    float _1711 = _1667 * _1573;
    float _1713 = fma(_1671, _1565, _1705);
    float _1715 = fma(_1639, _1533, _1697);
    float _1717 = fma(_1659, _1533, _1699);
    float _1719 = fma(_1633, _1565, _1707);
    float _1721 = fma(_1673, _1597, _1683);
    float _1723 = fma(_1639, _1565, _1709);
    float _1725 = fma(_1659, _1565, _1711);
    float _1727 = fma(_1637, _1597, _1685);
    float _1729 = _1721 + _1605;
    float _1731 = fma(_1695, _1597, _1687);
    float _1733 = fma(_1669, _1597, _1691);
    float _1735 = fma(_1673, _1621, _1701);
    float _1737 = fma(_1637, _1621, _1703);
    float _1739 = fma(_1695, _1621, _1715);
    int _1741 = _1417 + 16;
    float _1743 = fma(_1669, _1621, _1717);
    float _1745 = _1735 + _1629;
    int _1747 = _1417 + 32;
    float _1749 = fma(_1673, _1649, _1713);
    float _1751 = fma(_1637, _1649, _1719);
    float _1753 = fma(_1695, _1649, _1723);
    float _1755 = fma(_1669, _1649, _1725);
    float _1757 = _1749 + _1657;
    int _1759 = _1417 + 48;
    uint _1761 = uint(int(uint(_1741) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1761)] = as_type<uint>(_1727);
    int _1763 = _1741 + 4;
    uint _1765 = uint(int(uint(_1763) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1765)] = as_type<uint>(_1731);
    int _1767 = _1741 + 8;
    uint _1769 = uint(int(uint(_1767) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1769)] = as_type<uint>(_1733);
    int _1771 = _1741 + 12;
    uint _1773 = uint(int(uint(_1771) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1773)] = as_type<uint>(_1729);
    uint _1775 = uint(int(uint(_1747) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1775)] = as_type<uint>(_1737);
    int _1777 = _1747 + 4;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1779)] = as_type<uint>(_1739);
    int _1781 = _1747 + 8;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1783)] = as_type<uint>(_1743);
    int _1785 = _1747 + 12;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1787)] = as_type<uint>(_1745);
    uint _1789 = uint(int(uint(_1759) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1789)] = as_type<uint>(_1751);
    int _1791 = _1759 + 4;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1793)] = as_type<uint>(_1753);
    int _1795 = _1759 + 8;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1797)] = as_type<uint>(_1755);
    int _1799 = _1759 + 12;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1801)] = as_type<uint>(_1757);
}

