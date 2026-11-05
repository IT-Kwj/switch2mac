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
int _56(thread const int& _4466, thread const int& _4467, constant _10& support_buffer)
{
    int _4470 = 1 + _4467;
    float _4472 = support_buffer._m5[_4470].x;
    bool _4474 = _4472 == 1.0;
    if (_4474)
    {
        return _4466;
    }
    float _4476 = float(_4466);
    float _4478 = _4476 * _4472;
    int _4480 = int(_4478);
    return _4480;
}

static inline __attribute__((always_inline))
void _54(thread const int& _4158, thread const int& _4159, thread const int& _4160, thread const int& _4161, thread int& _4162, thread int& _4163, thread int& _4164, thread int& _4165, thread int& _4166, thread int& _4167)
{
    float _4170 = as_type<float>(_4160) + 0.0;
    bool _4172 = _4170 != 0.0;
    bool _4174 = isnan(_4170);
    bool _4176 = _4172 || _4174;
    bool _4178 = isnan(0.0);
    bool _4180 = _4176 || _4178;
    int _4182 = _4158;
    int _4184 = _4159;
    int _4186 = _4160;
    int _4188 = _4180 ? (-1) : 0;
    if (!_4180)
    {
        float _4190 = as_type<float>(_4160) * 1.0;
        _4182 = as_type<int>(_4190);
    }
    int _4192 = _4182;
    bool _4194 = !_4180;
    int _4196 = _4192;
    int _4198 = _4192;
    if (!_4194)
    {
        float _4200 = as_type<float>(_4160) + 0.0;
        bool _4202 = _4200 >= 0.0;
        bool _4204 = isnan(_4200);
        bool _4206 = _4202 || _4204;
        bool _4208 = isnan(0.0);
        bool _4210 = _4206 || _4208;
        _4188 = _4210 ? (-1) : 0;
        if (!_4210)
        {
            _4196 = 2147483647;
        }
        int _4212 = _4196;
        bool _4214 = !_4210;
        int _4216 = _4212;
        _4198 = _4212;
        if (!_4214)
        {
            float _4218 = as_type<float>(_4160) + 0.0;
            bool _4220 = _4218 > as_type<float>(0x7f800000u /* inf */);
            bool _4222 = isnan(_4218);
            bool _4224 = _4220 || _4222;
            bool _4226 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4228 = _4224 || _4226;
            _4188 = _4228 ? (-1) : 0;
            if (_4228)
            {
                float _4230 = as_type<float>(_4160) + 1.0;
                _4216 = as_type<int>(_4230);
            }
            int _4232 = _4216;
            int _4234 = _4232;
            _4198 = _4232;
            if (!_4228)
            {
                float _4236 = 0.0 + as_type<float>(_4160);
                bool _4238 = _4236 != as_type<float>(0x7f800000u /* inf */);
                bool _4240 = isnan(_4236);
                bool _4242 = _4238 || _4240;
                bool _4244 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4246 = _4242 || _4244;
                _4188 = _4246 ? (-1) : 0;
                if (!_4246)
                {
                    _4234 = _4160;
                }
                int _4248 = _4234;
                bool _4250 = !_4246;
                _4198 = _4248;
                if (!_4250)
                {
                    float _4252 = as_type<float>(_4160) * 18446744073709551616.0;
                    float _4254 = rsqrt(_4252);
                    float _4256 = _4252 * _4254;
                    float _4258 = _4254 * 0.5;
                    float _4260 = -_4256;
                    float _4262 = 0.0 + _4260;
                    float _4264 = fma(_4258, _4262, 0.5);
                    float _4266 = fma(_4256, _4264, _4256);
                    float _4268 = -_4266;
                    float _4270 = 0.0 + _4268;
                    float _4272 = fma(_4266, _4270, _4252);
                    float _4274 = fma(_4258, _4272, _4266);
                    float _4276 = _4274 * 2.3283064365386962890625e-10;
                    _4198 = as_type<int>(_4276);
                    _4184 = as_type<int>(_4266);
                    _4186 = as_type<int>(_4252);
                }
            }
        }
    }
    int _4278 = _4198;
    int _4280 = _4184;
    int _4282 = _4186;
    int _4284 = _4188;
    _4162 = _4161;
    _4163 = 0;
    _4164 = _4278;
    _4165 = _4280;
    _4166 = _4282;
    _4167 = _4284;
}

static inline __attribute__((always_inline))
int _58(thread const int& _4501, thread const int& _4502, thread const int& _4503, thread int& _4504, thread uint& gl_SubgroupInvocationID)
{
    int _4507 = _4503 & 31;
    uint _4509 = uint(int(uint(_4503) >> uint(8)));
    int _4511 = int(_4509) & 31;
    float _4513 = as_type<float>(gl_SubgroupInvocationID);
    int _4515 = as_type<int>(_4513) & _4511;
    int _4517 = ~_4511;
    int _4519 = _4507 & _4517;
    int _4521 = _4519 | _4515;
    int _4523 = ~_4511;
    int _4525 = _4502 & _4523;
    int _4527 = _4525 | _4515;
    bool _4529 = uint(_4527) <= uint(_4521);
    _4504 = _4529 ? (-1) : 0;
    float _4531 = spvSubgroupShuffle(as_type<float>(_4501), uint(_4527));
    uint _4533 = uint(_4529 ? as_type<int>(_4531) : _4501);
    return int(_4533);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1309 = false;
    bool _571 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.cp_c5)._m0[int(_79)][_81];
    int _85 = int(_77) + 1;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    int _89 = _85 & 3;
    float _91 = (*spvDescriptorSet0.cp_c5)._m0[int(_87)][_89];
    int _93 = _74 + 8;
    uint _95 = uint(int(uint(_93) >> uint(2)));
    uint _97 = uint(int(uint(int(_95)) >> uint(2)));
    int _99 = int(_95) & 3;
    float _101 = (*spvDescriptorSet0.cp_c5)._m0[int(_97)][_99];
    int _103 = int(_95) + 1;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    int _107 = _103 & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = _68;
    int _113 = 0;
    int _115 = _56(_111, _113, (*spvDescriptorSet0.support_buffer));
    int _117 = as_type<int>(_83);
    int _119 = 0;
    int _121 = _56(_117, _119, (*spvDescriptorSet0.support_buffer));
    int3 _1862 = int3(_115, _121, 1);
    float3 _125 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1862.xy), uint(_1862.z), 0).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    int _133 = _68;
    int _135 = 0;
    int _137 = _56(_133, _135, (*spvDescriptorSet0.support_buffer));
    int _139 = as_type<int>(_91);
    int _141 = 0;
    int _143 = _56(_139, _141, (*spvDescriptorSet0.support_buffer));
    int3 _1880 = int3(_137, _143, 1);
    float3 _145 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1880.xy), uint(_1880.z), 0).xyz;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    int _153 = _68;
    int _155 = 0;
    int _157 = _56(_153, _155, (*spvDescriptorSet0.support_buffer));
    int _159 = as_type<int>(_83);
    int _161 = 0;
    int _163 = _56(_159, _161, (*spvDescriptorSet0.support_buffer));
    int3 _1898 = int3(_157, _163, 0);
    float3 _165 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1898.xy), uint(_1898.z), 0).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    int _173 = _68;
    int _175 = 0;
    int _177 = _56(_173, _175, (*spvDescriptorSet0.support_buffer));
    int _179 = as_type<int>(_91);
    int _181 = 0;
    int _183 = _56(_179, _181, (*spvDescriptorSet0.support_buffer));
    int3 _1916 = int3(_177, _183, 0);
    float3 _185 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1916.xy), uint(_1916.z), 0).xyz;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    int _193 = _68;
    int _195 = 1;
    int _197 = _56(_193, _195, (*spvDescriptorSet0.support_buffer));
    int _199 = as_type<int>(_101);
    int _201 = 1;
    int _203 = _56(_199, _201, (*spvDescriptorSet0.support_buffer));
    int3 _1934 = int3(_197, _203, 1);
    float3 _205 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1934.xy), uint(_1934.z), 0).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    int _213 = _68;
    int _215 = 1;
    int _217 = _56(_213, _215, (*spvDescriptorSet0.support_buffer));
    int _219 = as_type<int>(_109);
    int _221 = 1;
    int _223 = _56(_219, _221, (*spvDescriptorSet0.support_buffer));
    int3 _1952 = int3(_217, _223, 1);
    float3 _225 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1952.xy), uint(_1952.z), 0).xyz;
    float _227 = _225.x;
    float _229 = _225.y;
    float _231 = _225.z;
    int _233 = _68;
    int _235 = 0;
    int _237 = _56(_233, _235, (*spvDescriptorSet0.support_buffer));
    int _239 = as_type<int>(_83);
    int _241 = 0;
    int _243 = _56(_239, _241, (*spvDescriptorSet0.support_buffer));
    int3 _1970 = int3(_237, _243, 2);
    float3 _245 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1970.xy), uint(_1970.z), 0).xyz;
    float _247 = _245.x;
    float _249 = _245.y;
    float _251 = _245.z;
    int _253 = _68;
    int _255 = 0;
    int _257 = _56(_253, _255, (*spvDescriptorSet0.support_buffer));
    int _259 = as_type<int>(_91);
    int _261 = 0;
    int _263 = _56(_259, _261, (*spvDescriptorSet0.support_buffer));
    int3 _1988 = int3(_257, _263, 2);
    float3 _265 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1988.xy), uint(_1988.z), 0).xyz;
    float _267 = _265.x;
    float _269 = _265.y;
    float _271 = _265.z;
    int _273 = _74 + 16;
    uint _275 = uint(int(uint(_273) >> uint(2)));
    uint _277 = uint(int(uint(int(_275)) >> uint(2)));
    int _279 = int(_275) & 3;
    float _281 = (*spvDescriptorSet0.cp_c5)._m0[int(_277)][_279];
    int _283 = _74 + 24;
    uint _285 = uint(int(uint(_283) >> uint(2)));
    uint _287 = uint(int(uint(int(_285)) >> uint(2)));
    int _289 = int(_285) & 3;
    float _291 = (*spvDescriptorSet0.cp_c5)._m0[int(_287)][_289];
    float _293 = -_131;
    float _295 = _293 + _151;
    float _297 = -_171;
    float _299 = _297 + _191;
    float _301 = fma(_295, _281, _131);
    float _303 = -_129;
    float _305 = _303 + _149;
    float _307 = _301 * 0.5;
    float _309 = fma(_305, _281, _129);
    float _311 = -_211;
    float _313 = _311 + _231;
    float _315 = _307 * 0.15915493667125701904296875;
    float _317 = -_127;
    float _319 = _317 + _147;
    float _321 = _309 * 0.5;
    float _323 = fma(_313, _291, _211);
    float _325 = _315 * 6.283185482025146484375;
    float _327 = sin(_325);
    float _329 = fma(_319, _281, _127);
    float _331 = _321 * 0.15915493667125701904296875;
    float _333 = -_209;
    float _335 = _333 + _229;
    float _337 = -_207;
    float _339 = _337 + _227;
    float _341 = _329 * 0.5;
    float _343 = _323 * 0.5;
    float _345 = fma(_335, _291, _209);
    float _347 = _331 * 6.283185482025146484375;
    float _349 = sin(_347);
    float _351 = _341 * 0.15915493667125701904296875;
    float _353 = fma(_339, _291, _207);
    float _355 = _345 * 0.5;
    float _357 = _343 * 0.15915493667125701904296875;
    float _359 = _353 * 0.5;
    float _361 = _331 * 6.283185482025146484375;
    float _363 = cos(_361);
    float _365 = _315 * 6.283185482025146484375;
    float _367 = cos(_365);
    float _369 = _327 * _349;
    float _371 = _351 * 6.283185482025146484375;
    float _373 = sin(_371);
    float _375 = _363 * _327;
    float _377 = _351 * 6.283185482025146484375;
    float _379 = cos(_377);
    float _381 = _367 * _363;
    float _383 = _367 * _349;
    float _385 = _373 * _369;
    float _387 = _373 * _375;
    float _389 = _357 * 6.283185482025146484375;
    float _391 = sin(_389);
    float _393 = _379 * _369;
    float _395 = fma(_379, _381, _385);
    float _397 = _359 * 0.15915493667125701904296875;
    float _399 = -_393;
    float _401 = fma(_373, _381, _399);
    float _403 = _373 * _383;
    float _405 = fma(_379, _383, _387);
    float _407 = -_167;
    float _409 = _407 + _187;
    float _411 = -_169;
    float _413 = _411 + _189;
    float _415 = _397 * 6.283185482025146484375;
    float _417 = sin(_415);
    float _419 = -_403;
    float _421 = fma(_379, _375, _419);
    float _423 = fma(_409, _281, _167);
    float _425 = fma(_413, _281, _169);
    float _427 = fma(_299, _281, _171);
    float _429 = _355 * 0.15915493667125701904296875;
    float _431 = _357 * 6.283185482025146484375;
    float _433 = cos(_431);
    float _435 = _429 * 6.283185482025146484375;
    float _437 = cos(_435);
    float _439 = _429 * 6.283185482025146484375;
    float _441 = sin(_439);
    float _443 = _397 * 6.283185482025146484375;
    float _445 = cos(_443);
    float _447 = _437 * _391;
    float _449 = _433 * _437;
    float _451 = _417 * _447;
    float _453 = _391 * _441;
    float _455 = _433 * _441;
    float _457 = _417 * _455;
    float _459 = _445 * _453;
    float _461 = fma(_445, _455, _451);
    float _463 = -_457;
    float _465 = fma(_445, _447, _463);
    float _467 = -_459;
    float _469 = fma(_417, _449, _467);
    float _471 = _405 * _461;
    float _473 = _417 * _453;
    float _475 = -_249;
    float _477 = _475 + _269;
    float _479 = fma(_401, _469, _471);
    float _481 = fma(_445, _449, _473);
    float _483 = -_251;
    float _485 = _483 + _271;
    float _487 = fma(_477, _281, _249);
    float _489 = fma(_421, _465, _479);
    float _491 = fma(_485, _281, _251);
    float _493 = fma(_395, _481, _489);
    float _495 = precise::max(_493, -1.0);
    float _497 = precise::min(_495, 1.0);
    bool _499 = _497 >= 0.0;
    bool _501 = isnan(_497);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    bool _509 = !_507;
    float _511 = -_497;
    float _513 = _509 ? _511 : _497;
    bool _515 = _513 < 0.0;
    float _517 = float(_515);
    float _519 = abs(_513);
    float _521 = -_519;
    float _523 = _521 + 1.0;
    float _525 = abs(_513);
    float _527 = fma(_525, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _529 = as_type<int>(_523) + (-218103808);
    float _531 = abs(_513);
    float _533 = fma(_531, _527, -0.212114393711090087890625);
    bool _535 = uint(_529) >= 1920991232u;
    float _537 = -_247;
    float _539 = _537 + _267;
    float _541 = abs(_513);
    float _543 = fma(_541, _533, 1.570728778839111328125);
    float _545 = fma(_539, _281, _247);
    bool _547 = !_535;
    float _569;
    if (!_547)
    {
        int _549 = as_type<int>(_267);
        int _551 = as_type<int>(_485);
        int _553 = as_type<int>(_523);
        int _555 = 1968;
        int _557;
        int _559;
        int _561;
        int _563;
        int _565;
        int _567;
        _54(_549, _551, _553, _555, _557, _559, _561, _563, _565, _567);
        _569 = as_type<float>(_561);
        _571 = true;
    }
    else
    {
        float _573 = rsqrt(_523);
        float _575 = _523 * _573;
        float _577 = _573 * 0.5;
        float _579 = -_575;
        float _581 = 0.0 + _579;
        float _583 = fma(_577, _581, 0.5);
        float _585 = fma(_575, _583, _575);
        float _587 = -_585;
        float _589 = 0.0 + _587;
        float _591 = fma(_585, _589, _523);
        float _593 = fma(_577, _591, _585);
        _569 = _593;
    }
    _571 = false;
    float _595 = _569;
    int _597 = _74 + 8;
    uint _599 = uint(int(uint(_597) >> uint(2)));
    uint _601 = uint(int(uint(int(_599)) >> uint(2)));
    int _603 = int(_599) & 3;
    float _605 = (*spvDescriptorSet0.cp_c5)._m0[int(_601)][_603];
    int _607 = int(_599) + 1;
    uint _609 = uint(int(uint(_607) >> uint(2)));
    int _611 = _607 & 3;
    float _613 = (*spvDescriptorSet0.cp_c5)._m0[int(_609)][_611];
    int _615 = _68;
    int _617 = 1;
    int _619 = _56(_615, _617, (*spvDescriptorSet0.support_buffer));
    int _621 = as_type<int>(_605);
    int _623 = 1;
    int _625 = _56(_621, _623, (*spvDescriptorSet0.support_buffer));
    int3 _2471 = int3(_619, _625, 0);
    float3 _627 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2471.xy), uint(_2471.z), 0).xyz;
    float _629 = _627.x;
    float _631 = _627.y;
    float _633 = _627.z;
    int _635 = _68;
    int _637 = 1;
    int _639 = _56(_635, _637, (*spvDescriptorSet0.support_buffer));
    int _641 = as_type<int>(_605);
    int _643 = 1;
    int _645 = _56(_641, _643, (*spvDescriptorSet0.support_buffer));
    int3 _2489 = int3(_639, _645, 2);
    float3 _647 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2489.xy), uint(_2489.z), 0).xyz;
    float _649 = _647.x;
    float _651 = _647.y;
    float _653 = _647.z;
    int _655 = _68;
    int _657 = 1;
    int _659 = _56(_655, _657, (*spvDescriptorSet0.support_buffer));
    int _661 = as_type<int>(_613);
    int _663 = 1;
    int _665 = _56(_661, _663, (*spvDescriptorSet0.support_buffer));
    int3 _2507 = int3(_659, _665, 0);
    float3 _667 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2507.xy), uint(_2507.z), 0).xyz;
    float _669 = _667.x;
    float _671 = _667.y;
    float _673 = _667.z;
    int _675 = _68;
    int _677 = 1;
    int _679 = _56(_675, _677, (*spvDescriptorSet0.support_buffer));
    int _681 = as_type<int>(_613);
    int _683 = 1;
    int _685 = _56(_681, _683, (*spvDescriptorSet0.support_buffer));
    int3 _2525 = int3(_679, _685, 2);
    float3 _687 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2525.xy), uint(_2525.z), 0).xyz;
    float _689 = _687.x;
    float _691 = _687.y;
    float _693 = _687.z;
    float _695 = _543 * _595;
    float _697 = _517 * 2.0;
    float _699 = -_697;
    float _701 = fma(_695, _699, _695);
    float _703 = fma(_517, 3.1415927410125732421875, _701);
    float _705 = _703 * 0.15915493667125701904296875;
    float _707 = _705 * 6.283185482025146484375;
    float _709 = sin(_707);
    float _711 = abs(_709);
    bool _713 = _711 >= 0.001000000047497451305389404296875;
    bool _715 = isnan(_711);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.001000000047497451305389404296875);
    bool _721 = _717 || _719;
    float _723 = _517;
    float _725 = _701;
    float _727 = _695;
    if (!_721)
    {
        int _729 = _74 + 28;
        uint _731 = uint(int(uint(_729) >> uint(2)));
        uint _733 = uint(int(uint(int(_731)) >> uint(2)));
        int _735 = int(_731) & 3;
        float _737 = (*spvDescriptorSet0.cp_c5)._m0[int(_733)][_735];
        _723 = _737;
    }
    float _739 = _723;
    float _741 = _739;
    if (!_721)
    {
        float _743 = -_739;
        float _745 = _743 + 1.0;
        _725 = _745;
    }
    float _747 = _725;
    float _749 = _747;
    if (!_721)
    {
        _727 = _739;
    }
    float _751 = _727;
    bool _753 = !_721;
    float _755 = _751;
    if (!_753)
    {
        int _757 = _74 + 28;
        uint _759 = uint(int(uint(_757) >> uint(2)));
        uint _761 = uint(int(uint(int(_759)) >> uint(2)));
        int _763 = int(_759) & 3;
        float _765 = (*spvDescriptorSet0.cp_c5)._m0[int(_761)][_763];
        float _767 = 1.0 / _709;
        float _769 = _703 * _765;
        float _771 = _769 * 0.15915493667125701904296875;
        float _773 = -_769;
        float _775 = _703 + _773;
        float _777 = _775 * 0.15915493667125701904296875;
        float _779 = _771 * 6.283185482025146484375;
        float _781 = sin(_779);
        float _783 = _777 * 6.283185482025146484375;
        float _785 = sin(_783);
        float _787 = _781 * _767;
        float _789 = _785 * _767;
        _755 = _787;
        _749 = _789;
        _741 = _765;
    }
    float _791 = _755;
    float _793 = _749;
    float _795 = _741;
    bool _797 = !_507;
    float _799 = -_791;
    float _801 = _797 ? _799 : _791;
    float _803 = -_633;
    float _805 = _803 + _673;
    float _807 = -_653;
    float _809 = _807 + _693;
    bool _811 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _813 = _469 * _801;
    float _815 = _481 * _801;
    float _817 = _465 * _801;
    float _819 = _461 * _801;
    float _821 = fma(_401, _793, _813);
    float _823 = fma(_395, _793, _815);
    int _825 = _74 + 24;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.cp_c5)._m0[int(_829)][_831];
    float _835 = fma(_421, _793, _817);
    float _837 = fma(_405, _793, _819);
    float _839 = _823 * 2.0;
    float _841 = _821 * 2.0;
    float _843 = _837 * 2.0;
    float _845 = _835 * _839;
    int _847 = _74 + 20;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    uint _851 = uint(int(uint(int(_849)) >> uint(2)));
    int _853 = int(_849) & 3;
    float _855 = (*spvDescriptorSet0.cp_c5)._m0[int(_851)][_853];
    float _857 = _837 * _839;
    float _859 = _821 * _839;
    float _861 = _821 * _821;
    float _863 = -_845;
    float _865 = fma(_837, _841, _863);
    float _867 = fma(_837, _841, _845);
    float _869 = fma(_835, _841, _857);
    float _871 = -_857;
    float _873 = fma(_835, _841, _871);
    float _875 = fma(_861, -2.0, 1.0);
    float _877 = -_629;
    float _879 = _877 + _669;
    float _881 = -_631;
    float _883 = _881 + _671;
    float _885 = -_859;
    float _887 = fma(_835, _843, _885);
    float _889 = fma(_835, _843, _859);
    float _891 = _837 * _837;
    float _893 = _835 * _835;
    float _895 = fma(_883, _833, _631);
    float _897 = fma(_879, _833, _629);
    float _899 = fma(_891, -2.0, 1.0);
    float _901 = fma(_805, _833, _633);
    float _903 = _895 * _795;
    float _905 = _897 * _795;
    float _907 = fma(_893, -2.0, _899);
    float _909 = fma(_891, -2.0, _875);
    float _911 = fma(_425, _855, _903);
    float _913 = -_649;
    float _915 = _913 + _689;
    float _917 = -_651;
    float _919 = _917 + _691;
    float _921 = fma(_423, _855, _905);
    float _923 = _901 * _795;
    float _925 = fma(_915, _833, _649);
    float _927 = fma(_919, _833, _651);
    float _929 = fma(_809, _833, _653);
    float _931 = fma(_427, _855, _923);
    float _933 = _925 * _795;
    float _935 = _927 * _795;
    float _937 = fma(_893, -2.0, _875);
    float _939 = _929 * _795;
    float _941 = _869 * _931;
    float _943 = _867 * _921;
    float _945 = _907 * _921;
    float _947 = _873 * _921;
    float _949 = _865 * _911;
    float _951 = _937 * _911;
    float _953 = _889 * _911;
    float _955 = _887 * _931;
    float _957 = _909 * _931;
    float _959 = fma(_545, _855, _933);
    float _961 = fma(_487, _855, _935);
    float _963 = fma(_491, _855, _939);
    int _965 = _68 * 112;
    bool _967 = !_811;
    float _969 = _963;
    float _971 = _959;
    float _1289;
    float _1291;
    float _1293;
    float _1295;
    float _1297;
    float _1299;
    float _1301;
    float _1303;
    float _1305;
    float _1307;
    if (!_967)
    {
        int _973 = 0;
        float _975 = _945;
        float _977 = _949;
        float _979 = _941;
        float _981 = _959;
        float _983 = _943;
        float _985 = _951;
        float _987 = _955;
        float _989 = _961;
        float _991 = _947;
        float _993 = _953;
        float _995 = _957;
        float _997 = _963;
        bool _999;
        int _1047;
        int _1057;
        int _1067;
        int _1077;
        int _1087;
        int _1097;
        int _1107;
        int _1117;
        int _1127;
        int _1137;
        int _1147;
        int _1157;
        int _1265;
        int _1269;
        int _1271;
        int _1275;
        int _1277;
        int _1279;
        float _1283;
        int _1285;
        int _1287;
        do
        {
            int _1001 = _973;
            int _1003 = as_type<int>(_975);
            int _1005 = as_type<int>(_977);
            int _1007 = as_type<int>(_979);
            int _1009 = as_type<int>(_981);
            int _1011 = as_type<int>(_983);
            int _1013 = as_type<int>(_985);
            int _1015 = as_type<int>(_987);
            int _1017 = as_type<int>(_989);
            int _1019 = as_type<int>(_991);
            float _1021 = _993;
            int _1023 = as_type<int>(_995);
            int _1025 = as_type<int>(_997);
            uint _1027 = uint(int(uint(_965) >> uint(2)));
            uint _1029 = uint(int(uint(int(_1027)) >> uint(2)));
            int _1031 = int(_1027) & 3;
            float _1033 = (*spvDescriptorSet0.cp_c6)._m0[int(_1029)][_1031];
            bool _1035 = _68 != 0;
            int _1037 = _1001 + 1;
            bool _1039 = uint(_1037) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1041 = _1003;
            int _1043 = as_type<int>(_1033);
            int _1045 = 31;
            int _3017 = _58(_1041, _1043, _1045, _1047, gl_SubgroupInvocationID);
            int _1049 = _3017;
            int _1051 = _1005;
            int _1053 = as_type<int>(_1033);
            int _1055 = 31;
            int _3021 = _58(_1051, _1053, _1055, _1057, gl_SubgroupInvocationID);
            int _1059 = _3021;
            int _1061 = _1007;
            int _1063 = as_type<int>(_1033);
            int _1065 = 31;
            int _3025 = _58(_1061, _1063, _1065, _1067, gl_SubgroupInvocationID);
            int _1069 = _3025;
            int _1071 = _1009;
            int _1073 = as_type<int>(_1033);
            int _1075 = 31;
            int _3029 = _58(_1071, _1073, _1075, _1077, gl_SubgroupInvocationID);
            int _1079 = _3029;
            int _1081 = _1011;
            int _1083 = as_type<int>(_1033);
            int _1085 = 31;
            int _3033 = _58(_1081, _1083, _1085, _1087, gl_SubgroupInvocationID);
            int _1089 = _3033;
            int _1091 = _1013;
            int _1093 = as_type<int>(_1033);
            int _1095 = 31;
            int _3037 = _58(_1091, _1093, _1095, _1097, gl_SubgroupInvocationID);
            int _1099 = _3037;
            int _1101 = _1015;
            int _1103 = as_type<int>(_1033);
            int _1105 = 31;
            int _3041 = _58(_1101, _1103, _1105, _1107, gl_SubgroupInvocationID);
            int _1109 = _3041;
            int _1111 = _1017;
            int _1113 = as_type<int>(_1033);
            int _1115 = 31;
            int _3045 = _58(_1111, _1113, _1115, _1117, gl_SubgroupInvocationID);
            int _1119 = _3045;
            int _1121 = _1019;
            int _1123 = as_type<int>(_1033);
            int _1125 = 31;
            int _3049 = _58(_1121, _1123, _1125, _1127, gl_SubgroupInvocationID);
            int _1129 = _3049;
            int _1131 = as_type<int>(_1021);
            int _1133 = as_type<int>(_1033);
            int _1135 = 31;
            int _3054 = _58(_1131, _1133, _1135, _1137, gl_SubgroupInvocationID);
            int _1139 = _3054;
            int _1141 = _1023;
            int _1143 = as_type<int>(_1033);
            int _1145 = 31;
            int _3058 = _58(_1141, _1143, _1145, _1147, gl_SubgroupInvocationID);
            int _1149 = _3058;
            int _1151 = _1025;
            int _1153 = as_type<int>(_1033);
            int _1155 = 31;
            int _3062 = _58(_1151, _1153, _1155, _1157, gl_SubgroupInvocationID);
            int _1159 = _3062;
            bool _1161 = !_1035;
            _973 = _1037;
            int _1163 = _1003;
            int _1165 = _1005;
            int _1167 = _1007;
            int _1169 = _1009;
            int _1171 = _1011;
            int _1173 = _1013;
            int _1175 = _1015;
            int _1177 = _1017;
            int _1179 = _1019;
            float _1181 = _1021;
            int _1183 = _1023;
            int _1185 = _1025;
            if (!_1161)
            {
                float _1187 = _951 * as_type<float>(_1059);
                float _1189 = _961 * as_type<float>(_1059);
                float _1191 = _943 * as_type<float>(_1059);
                float _1193 = _955 * as_type<float>(_1059);
                float _1195 = fma(_949, as_type<float>(_1049), _1187);
                float _1197 = fma(_959, as_type<float>(_1049), _1189);
                float _1199 = _951 * as_type<float>(_1099);
                float _1201 = _955 * as_type<float>(_1099);
                float _1203 = _943 * as_type<float>(_1099);
                float _1205 = _961 * as_type<float>(_1099);
                float _1207 = fma(_949, as_type<float>(_1089), _1199);
                float _1209 = fma(_941, as_type<float>(_1089), _1201);
                float _1211 = _961 * as_type<float>(_1139);
                float _1213 = fma(_945, as_type<float>(_1049), _1191);
                float _1215 = fma(_941, as_type<float>(_1049), _1193);
                float _1217 = _951 * as_type<float>(_1139);
                float _1219 = fma(_945, as_type<float>(_1089), _1203);
                float _1221 = fma(_959, as_type<float>(_1089), _1205);
                float _1223 = _943 * as_type<float>(_1139);
                float _1225 = _955 * as_type<float>(_1139);
                float _1227 = fma(_959, as_type<float>(_1129), _1211);
                float _1229 = fma(_949, as_type<float>(_1129), _1217);
                float _1231 = fma(_953, as_type<float>(_1069), _1195);
                float _1233 = fma(_945, as_type<float>(_1129), _1223);
                float _1235 = fma(_941, as_type<float>(_1129), _1225);
                float _1237 = fma(_947, as_type<float>(_1109), _1219);
                float _1239 = fma(_963, as_type<float>(_1069), _1197);
                float _1241 = fma(_963, as_type<float>(_1109), _1221);
                float _1243 = fma(_963, as_type<float>(_1149), _1227);
                float _1245 = fma(_957, as_type<float>(_1069), _1215);
                float _1247 = fma(_947, as_type<float>(_1069), _1213);
                float _1249 = fma(_953, as_type<float>(_1109), _1207);
                float _1251 = fma(_957, as_type<float>(_1109), _1209);
                float _1253 = fma(_947, as_type<float>(_1149), _1233);
                float _1255 = fma(_953, as_type<float>(_1149), _1229);
                float _1257 = fma(_957, as_type<float>(_1149), _1235);
                float _1259 = as_type<float>(_1079) + _1239;
                float _1261 = as_type<float>(_1119) + _1241;
                float _1263 = as_type<float>(_1159) + _1243;
                _1163 = as_type<int>(_1247);
                _1165 = as_type<int>(_1231);
                _1167 = as_type<int>(_1245);
                _1169 = as_type<int>(_1259);
                _1171 = as_type<int>(_1237);
                _1173 = as_type<int>(_1249);
                _1175 = as_type<int>(_1251);
                _1177 = as_type<int>(_1261);
                _1179 = as_type<int>(_1253);
                _1181 = _1255;
                _1183 = as_type<int>(_1257);
                _1185 = as_type<int>(_1263);
            }
            _1265 = _1163;
            int _1267 = _1165;
            _1269 = _1167;
            _1271 = _1169;
            int _1273 = _1171;
            _1275 = _1173;
            _1277 = _1175;
            _1279 = _1177;
            int _1281 = _1179;
            _1283 = _1181;
            _1285 = _1183;
            _1287 = _1185;
            _999 = !_1039;
            _975 = as_type<float>(_1265);
            _977 = as_type<float>(_1267);
            _979 = as_type<float>(_1269);
            _981 = as_type<float>(_1271);
            _983 = as_type<float>(_1273);
            _985 = as_type<float>(_1275);
            _987 = as_type<float>(_1277);
            _989 = as_type<float>(_1279);
            _991 = as_type<float>(_1281);
            _993 = _1283;
            _995 = as_type<float>(_1285);
            _997 = as_type<float>(_1287);
            _1289 = as_type<float>(_1267);
            _1291 = as_type<float>(_1273);
            _1293 = as_type<float>(_1281);
        } while (_999);
        _1295 = as_type<float>(_1275);
        _1297 = _1283;
        _1299 = as_type<float>(_1265);
        _1301 = as_type<float>(_1269);
        _1303 = as_type<float>(_1277);
        _1305 = as_type<float>(_1285);
        _1307 = as_type<float>(_1279);
        _969 = as_type<float>(_1287);
        _971 = as_type<float>(_1271);
        _1309 = true;
    }
    else
    {
        _1289 = _949;
        _1295 = _951;
        _1297 = _953;
        _1299 = _945;
        _1291 = _943;
        _1293 = _947;
        _1301 = _941;
        _1303 = _955;
        _1305 = _957;
        _1307 = _961;
    }
    _1309 = false;
    float _1311 = _1289;
    float _1313 = _1295;
    float _1315 = _1297;
    float _1317 = _1299;
    float _1319 = _1291;
    float _1321 = _1293;
    float _1323 = _1301;
    float _1325 = _1303;
    float _1327 = _1305;
    float _1329 = _1307;
    float _1331 = _969;
    float _1333 = _971;
    int _1335 = _965 + 80;
    uint _1337 = uint(int(uint(_1335) >> uint(2)));
    uint _1339 = uint(int(uint(int(_1337)) >> uint(2)));
    int _1341 = int(_1337) & 3;
    float _1343 = (*spvDescriptorSet0.cp_c6)._m0[int(_1339)][_1341];
    int _1345 = int(_1337) + 1;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    int _1349 = _1345 & 3;
    float _1351 = (*spvDescriptorSet0.cp_c6)._m0[int(_1347)][_1349];
    int _1353 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1355 = _1353 + _68;
    int _1357 = _965 + 64;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    uint _1361 = uint(int(uint(int(_1359)) >> uint(2)));
    int _1363 = int(_1359) & 3;
    float _1365 = (*spvDescriptorSet0.cp_c6)._m0[int(_1361)][_1363];
    int _1367 = int(_1359) + 1;
    uint _1369 = uint(int(uint(_1367) >> uint(2)));
    int _1371 = _1367 & 3;
    float _1373 = (*spvDescriptorSet0.cp_c6)._m0[int(_1369)][_1371];
    int _1375 = _1355 * 48;
    int _1377 = _965 + 88;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.cp_c6)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.cp_c6)._m0[int(_1389)][_1391];
    int _1395 = _965 + 72;
    uint _1397 = uint(int(uint(_1395) >> uint(2)));
    uint _1399 = uint(int(uint(int(_1397)) >> uint(2)));
    int _1401 = int(_1397) & 3;
    float _1403 = (*spvDescriptorSet0.cp_c6)._m0[int(_1399)][_1401];
    int _1405 = int(_1397) + 1;
    uint _1407 = uint(int(uint(_1405) >> uint(2)));
    int _1409 = _1405 & 3;
    float _1411 = (*spvDescriptorSet0.cp_c6)._m0[int(_1407)][_1409];
    int _1413 = _965 + 96;
    uint _1415 = uint(int(uint(_1413) >> uint(2)));
    uint _1417 = uint(int(uint(int(_1415)) >> uint(2)));
    int _1419 = int(_1415) & 3;
    float _1421 = (*spvDescriptorSet0.cp_c6)._m0[int(_1417)][_1419];
    int _1423 = int(_1415) + 1;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    int _1427 = _1423 & 3;
    float _1429 = (*spvDescriptorSet0.cp_c6)._m0[int(_1425)][_1427];
    int _1431 = _965 + 104;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    uint _1435 = uint(int(uint(int(_1433)) >> uint(2)));
    int _1437 = int(_1433) & 3;
    float _1439 = (*spvDescriptorSet0.cp_c6)._m0[int(_1435)][_1437];
    int _1441 = int(_1433) + 1;
    uint _1443 = uint(int(uint(_1441) >> uint(2)));
    int _1445 = _1441 & 3;
    float _1447 = (*spvDescriptorSet0.cp_c6)._m0[int(_1443)][_1445];
    float _1449 = _1311 * _1343;
    float _1451 = _1313 * _1343;
    float _1453 = _1315 * _1343;
    int _1455 = _965 + 16;
    uint _1457 = uint(int(uint(_1455) >> uint(2)));
    uint _1459 = uint(int(uint(int(_1457)) >> uint(2)));
    int _1461 = int(_1457) & 3;
    float _1463 = (*spvDescriptorSet0.cp_c6)._m0[int(_1459)][_1461];
    int _1465 = int(_1457) + 1;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    int _1469 = _1465 & 3;
    float _1471 = (*spvDescriptorSet0.cp_c6)._m0[int(_1467)][_1469];
    float _1473 = _1313 * _1351;
    float _1475 = _1315 * _1351;
    float _1477 = fma(_1317, _1365, _1449);
    float _1479 = fma(_1319, _1365, _1451);
    float _1481 = fma(_1321, _1365, _1453);
    float _1483 = _1311 * _1351;
    int _1485 = _965 + 32;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    uint _1489 = uint(int(uint(int(_1487)) >> uint(2)));
    int _1491 = int(_1487) & 3;
    float _1493 = (*spvDescriptorSet0.cp_c6)._m0[int(_1489)][_1491];
    int _1495 = int(_1487) + 1;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    int _1499 = _1495 & 3;
    float _1501 = (*spvDescriptorSet0.cp_c6)._m0[int(_1497)][_1499];
    float _1503 = fma(_1321, _1373, _1475);
    float _1505 = fma(_1319, _1373, _1473);
    float _1507 = fma(_1317, _1373, _1483);
    float _1509 = _1311 * _1385;
    float _1511 = _1311 * _1393;
    float _1513 = _1313 * _1385;
    float _1515 = _1313 * _1393;
    int _1517 = _965 + 48;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.cp_c6)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.cp_c6)._m0[int(_1529)][_1531];
    float _1535 = _1315 * _1385;
    float _1537 = _1315 * _1393;
    float _1539 = fma(_1317, _1403, _1509);
    float _1541 = fma(_1317, _1411, _1511);
    float _1543 = fma(_1319, _1403, _1513);
    float _1545 = fma(_1319, _1411, _1515);
    int _1547 = _965 + 24;
    uint _1549 = uint(int(uint(_1547) >> uint(2)));
    uint _1551 = uint(int(uint(int(_1549)) >> uint(2)));
    int _1553 = int(_1549) & 3;
    float _1555 = (*spvDescriptorSet0.cp_c6)._m0[int(_1551)][_1553];
    int _1557 = int(_1549) + 1;
    uint _1559 = uint(int(uint(_1557) >> uint(2)));
    int _1561 = _1557 & 3;
    float _1563 = (*spvDescriptorSet0.cp_c6)._m0[int(_1559)][_1561];
    float _1565 = fma(_1321, _1403, _1535);
    float _1567 = fma(_1321, _1411, _1537);
    float _1569 = fma(_1323, _1421, _1477);
    float _1571 = fma(_1325, _1421, _1479);
    float _1573 = fma(_1325, _1429, _1505);
    float _1575 = fma(_1327, _1421, _1481);
    int _1577 = _965 + 40;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.cp_c6)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.cp_c6)._m0[int(_1589)][_1591];
    float _1595 = fma(_1323, _1429, _1507);
    float _1597 = fma(_1327, _1429, _1503);
    float _1599 = fma(_1325, _1447, _1545);
    float _1601 = fma(_1327, _1447, _1567);
    float _1603 = fma(_1323, _1447, _1541);
    float _1605 = fma(_1325, _1439, _1543);
    int _1607 = _965 + 56;
    uint _1609 = uint(int(uint(_1607) >> uint(2)));
    uint _1611 = uint(int(uint(int(_1609)) >> uint(2)));
    int _1613 = int(_1609) & 3;
    float _1615 = (*spvDescriptorSet0.cp_c6)._m0[int(_1611)][_1613];
    int _1617 = int(_1609) + 1;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    int _1621 = _1617 & 3;
    float _1623 = (*spvDescriptorSet0.cp_c6)._m0[int(_1619)][_1621];
    float _1625 = _1599 + _1329;
    float _1627 = fma(_1323, _1439, _1539);
    float _1629 = fma(_1327, _1439, _1565);
    float _1631 = _1601 + _1331;
    float _1633 = _1603 + _1333;
    float _1635 = _1571 * _1471;
    float _1637 = _1573 * _1471;
    float _1639 = _1605 * _1471;
    float _1641 = _1625 * _1471;
    float _1643 = fma(_1569, _1463, _1635);
    float _1645 = fma(_1595, _1463, _1637);
    float _1647 = fma(_1627, _1463, _1639);
    float _1649 = fma(_1633, _1463, _1641);
    float _1651 = _1571 * _1501;
    float _1653 = _1573 * _1501;
    float _1655 = _1605 * _1501;
    float _1657 = _1625 * _1501;
    float _1659 = fma(_1569, _1493, _1651);
    float _1661 = fma(_1595, _1493, _1653);
    float _1663 = fma(_1627, _1493, _1655);
    float _1665 = fma(_1633, _1493, _1657);
    float _1667 = _1571 * _1533;
    float _1669 = _1573 * _1533;
    float _1671 = _1605 * _1533;
    float _1673 = _1625 * _1533;
    float _1675 = fma(_1569, _1525, _1667);
    float _1677 = fma(_1595, _1525, _1669);
    float _1679 = fma(_1627, _1525, _1671);
    float _1681 = fma(_1633, _1525, _1673);
    float _1683 = fma(_1631, _1555, _1649);
    float _1685 = fma(_1575, _1555, _1643);
    float _1687 = fma(_1597, _1555, _1645);
    float _1689 = fma(_1629, _1555, _1647);
    float _1691 = _1683 + _1563;
    float _1693 = fma(_1631, _1585, _1665);
    float _1695 = fma(_1575, _1585, _1659);
    float _1697 = fma(_1597, _1585, _1661);
    int _1699 = _1375 + 16;
    float _1701 = fma(_1629, _1585, _1663);
    float _1703 = _1693 + _1593;
    int _1705 = _1375 + 32;
    float _1707 = fma(_1631, _1615, _1681);
    float _1709 = fma(_1575, _1615, _1675);
    float _1711 = fma(_1597, _1615, _1677);
    float _1713 = fma(_1629, _1615, _1679);
    float _1715 = _1707 + _1623;
    int _1717 = _1375 + 48;
    uint _1719 = uint(int(uint(_1699) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1719)] = as_type<uint>(_1685);
    int _1721 = _1699 + 4;
    uint _1723 = uint(int(uint(_1721) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1723)] = as_type<uint>(_1687);
    int _1725 = _1699 + 8;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1727)] = as_type<uint>(_1689);
    int _1729 = _1699 + 12;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1731)] = as_type<uint>(_1691);
    uint _1733 = uint(int(uint(_1705) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1733)] = as_type<uint>(_1695);
    int _1735 = _1705 + 4;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1737)] = as_type<uint>(_1697);
    int _1739 = _1705 + 8;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1741)] = as_type<uint>(_1701);
    int _1743 = _1705 + 12;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1745)] = as_type<uint>(_1703);
    uint _1747 = uint(int(uint(_1717) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1747)] = as_type<uint>(_1709);
    int _1749 = _1717 + 4;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1751)] = as_type<uint>(_1711);
    int _1753 = _1717 + 8;
    uint _1755 = uint(int(uint(_1753) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1755)] = as_type<uint>(_1713);
    int _1757 = _1717 + 12;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1759)] = as_type<uint>(_1715);
}

