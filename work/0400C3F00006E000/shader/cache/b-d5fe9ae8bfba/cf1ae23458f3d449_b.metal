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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4676, thread const int& _4677, constant _10& support_buffer)
{
    int _4680 = 1 + _4677;
    float _4682 = support_buffer._m5[_4680].x;
    bool _4684 = _4682 == 1.0;
    if (_4684)
    {
        return _4676;
    }
    float _4686 = float(_4676);
    float _4688 = _4686 * _4682;
    int _4690 = int(_4688);
    return _4690;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4364, thread const int& _4365, thread const int& _4366, thread const int& _4367, thread int& _4368, thread int& _4369, thread int& _4370, thread int& _4371, thread int& _4372, thread int& _4373)
{
    float _4376 = as_type<float>(_4364) + 0.0;
    bool _4378 = _4376 != 0.0;
    bool _4380 = isnan(_4376);
    bool _4382 = _4378 || _4380;
    bool _4384 = isnan(0.0);
    bool _4386 = _4382 || _4384;
    int _4388 = as_type<int>(_4376);
    int _4390 = _4365;
    int _4392 = _4367;
    int _4394 = _4386 ? (-1) : 0;
    if (!_4386)
    {
        float _4396 = as_type<float>(_4364) * 1.0;
        _4388 = as_type<int>(_4396);
    }
    int _4398 = _4388;
    bool _4400 = !_4386;
    int _4402 = _4398;
    if (!_4400)
    {
        float _4404 = as_type<float>(_4364) + 0.0;
        bool _4406 = _4404 >= 0.0;
        bool _4408 = isnan(_4404);
        bool _4410 = _4406 || _4408;
        bool _4412 = isnan(0.0);
        bool _4414 = _4410 || _4412;
        int _4416 = as_type<int>(_4404);
        _4394 = _4414 ? (-1) : 0;
        if (!_4414)
        {
            _4416 = 2147483647;
        }
        int _4418 = _4416;
        bool _4420 = !_4414;
        _4402 = _4418;
        if (!_4420)
        {
            float _4422 = as_type<float>(_4364) + 0.0;
            bool _4424 = _4422 > as_type<float>(0x7f800000u /* inf */);
            bool _4426 = isnan(_4422);
            bool _4428 = _4424 || _4426;
            bool _4430 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4432 = _4428 || _4430;
            int _4434 = as_type<int>(_4422);
            _4394 = _4432 ? (-1) : 0;
            if (_4432)
            {
                float _4436 = as_type<float>(_4364) + 1.0;
                _4434 = as_type<int>(_4436);
            }
            int _4438 = _4434;
            _4402 = _4438;
            if (!_4432)
            {
                float _4440 = 0.0 + as_type<float>(_4364);
                bool _4442 = _4440 != as_type<float>(0x7f800000u /* inf */);
                bool _4444 = isnan(_4440);
                bool _4446 = _4442 || _4444;
                bool _4448 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4450 = _4446 || _4448;
                int _4452 = as_type<int>(_4440);
                _4394 = _4450 ? (-1) : 0;
                if (!_4450)
                {
                    _4452 = _4364;
                }
                int _4454 = _4452;
                bool _4456 = !_4450;
                _4402 = _4454;
                if (!_4456)
                {
                    float _4458 = as_type<float>(_4364) * 18446744073709551616.0;
                    float _4460 = rsqrt(_4458);
                    float _4462 = _4458 * _4460;
                    float _4464 = _4460 * 0.5;
                    float _4466 = -_4462;
                    float _4468 = 0.0 + _4466;
                    float _4470 = fma(_4464, _4468, 0.5);
                    float _4472 = fma(_4462, _4470, _4462);
                    float _4474 = -_4472;
                    float _4476 = 0.0 + _4474;
                    float _4478 = fma(_4472, _4476, _4458);
                    float _4480 = fma(_4464, _4478, _4472);
                    float _4482 = _4480 * 2.3283064365386962890625e-10;
                    _4402 = as_type<int>(_4482);
                    _4390 = as_type<int>(_4472);
                    _4392 = as_type<int>(_4468);
                }
            }
        }
    }
    int _4484 = _4402;
    int _4486 = _4390;
    int _4488 = _4392;
    int _4490 = _4394;
    _4368 = _4484;
    _4369 = _4366;
    _4370 = 0;
    _4371 = _4486;
    _4372 = _4488;
    _4373 = _4490;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1295 = false;
    bool _575 = false;
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
    int _115 = _58(_111, _113, (*spvDescriptorSet0.support_buffer));
    int _117 = as_type<int>(_83);
    int _119 = 0;
    int _121 = _58(_117, _119, (*spvDescriptorSet0.support_buffer));
    int3 _1849 = int3(_115, _121, 1);
    float3 _125 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1849.xy), uint(_1849.z), 0).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    int _133 = _68;
    int _135 = 0;
    int _137 = _58(_133, _135, (*spvDescriptorSet0.support_buffer));
    int _139 = as_type<int>(_91);
    int _141 = 0;
    int _143 = _58(_139, _141, (*spvDescriptorSet0.support_buffer));
    int3 _1867 = int3(_137, _143, 1);
    float3 _145 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1867.xy), uint(_1867.z), 0).xyz;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    int _153 = _68;
    int _155 = 0;
    int _157 = _58(_153, _155, (*spvDescriptorSet0.support_buffer));
    int _159 = as_type<int>(_83);
    int _161 = 0;
    int _163 = _58(_159, _161, (*spvDescriptorSet0.support_buffer));
    int3 _1885 = int3(_157, _163, 0);
    float3 _165 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1885.xy), uint(_1885.z), 0).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    int _173 = _68;
    int _175 = 0;
    int _177 = _58(_173, _175, (*spvDescriptorSet0.support_buffer));
    int _179 = as_type<int>(_91);
    int _181 = 0;
    int _183 = _58(_179, _181, (*spvDescriptorSet0.support_buffer));
    int3 _1903 = int3(_177, _183, 0);
    float3 _185 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1903.xy), uint(_1903.z), 0).xyz;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    int _193 = _68;
    int _195 = 1;
    int _197 = _58(_193, _195, (*spvDescriptorSet0.support_buffer));
    int _199 = as_type<int>(_101);
    int _201 = 1;
    int _203 = _58(_199, _201, (*spvDescriptorSet0.support_buffer));
    int3 _1921 = int3(_197, _203, 1);
    float3 _205 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1921.xy), uint(_1921.z), 0).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    int _213 = _68;
    int _215 = 1;
    int _217 = _58(_213, _215, (*spvDescriptorSet0.support_buffer));
    int _219 = as_type<int>(_109);
    int _221 = 1;
    int _223 = _58(_219, _221, (*spvDescriptorSet0.support_buffer));
    int3 _1939 = int3(_217, _223, 1);
    float3 _225 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1939.xy), uint(_1939.z), 0).xyz;
    float _227 = _225.x;
    float _229 = _225.y;
    float _231 = _225.z;
    int _233 = _68;
    int _235 = 0;
    int _237 = _58(_233, _235, (*spvDescriptorSet0.support_buffer));
    int _239 = as_type<int>(_83);
    int _241 = 0;
    int _243 = _58(_239, _241, (*spvDescriptorSet0.support_buffer));
    int3 _1957 = int3(_237, _243, 2);
    float3 _245 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1957.xy), uint(_1957.z), 0).xyz;
    float _247 = _245.x;
    float _249 = _245.y;
    float _251 = _245.z;
    int _253 = _68;
    int _255 = 0;
    int _257 = _58(_253, _255, (*spvDescriptorSet0.support_buffer));
    int _259 = as_type<int>(_91);
    int _261 = 0;
    int _263 = _58(_259, _261, (*spvDescriptorSet0.support_buffer));
    int3 _1975 = int3(_257, _263, 2);
    float3 _265 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1975.xy), uint(_1975.z), 0).xyz;
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
    float _297 = fma(_295, _281, _131);
    float _299 = _297 * 0.5;
    float _301 = _299 * 0.15915493667125701904296875;
    float _303 = -_129;
    float _305 = _303 + _149;
    float _307 = _301 * 6.283185482025146484375;
    float _309 = sin(_307);
    float _311 = fma(_305, _281, _129);
    float _313 = -_127;
    float _315 = _313 + _147;
    float _317 = _311 * 0.5;
    float _319 = fma(_315, _281, _127);
    float _321 = _301 * 6.283185482025146484375;
    float _323 = cos(_321);
    float _325 = _317 * 0.15915493667125701904296875;
    float _327 = _319 * 0.5;
    float _329 = -_211;
    float _331 = _329 + _231;
    float _333 = -_171;
    float _335 = _333 + _191;
    float _337 = _327 * 0.15915493667125701904296875;
    float _339 = fma(_331, _291, _211);
    float _341 = _325 * 6.283185482025146484375;
    float _343 = sin(_341);
    float _345 = fma(_335, _281, _171);
    float _347 = _339 * 0.5;
    float _349 = _347 * 0.15915493667125701904296875;
    float _351 = _325 * 6.283185482025146484375;
    float _353 = cos(_351);
    float _355 = _337 * 6.283185482025146484375;
    float _357 = sin(_355);
    float _359 = _309 * _343;
    float _361 = _337 * 6.283185482025146484375;
    float _363 = cos(_361);
    float _365 = _353 * _309;
    float _367 = _323 * _353;
    float _369 = _323 * _343;
    float _371 = _357 * _359;
    float _373 = _357 * _365;
    float _375 = _357 * _369;
    float _377 = _363 * _359;
    float _379 = fma(_363, _367, _371);
    float _381 = fma(_363, _369, _373);
    float _383 = -_375;
    float _385 = fma(_363, _365, _383);
    float _387 = -_377;
    float _389 = fma(_357, _367, _387);
    float _391 = -_169;
    float _393 = _391 + _189;
    float _395 = -_167;
    float _397 = _395 + _187;
    float _399 = _349 * 6.283185482025146484375;
    float _401 = sin(_399);
    float _403 = -_251;
    float _405 = _403 + _271;
    float _407 = fma(_393, _281, _169);
    float _409 = -_209;
    float _411 = _409 + _229;
    float _413 = fma(_397, _281, _167);
    float _415 = -_207;
    float _417 = _415 + _227;
    float _419 = fma(_405, _281, _251);
    float _421 = fma(_411, _291, _209);
    float _423 = _349 * 6.283185482025146484375;
    float _425 = cos(_423);
    float _427 = fma(_417, _291, _207);
    float _429 = _421 * 0.5;
    float _431 = _427 * 0.5;
    float _433 = _429 * 0.15915493667125701904296875;
    float _435 = _431 * 0.15915493667125701904296875;
    float _437 = _433 * 6.283185482025146484375;
    float _439 = cos(_437);
    float _441 = _433 * 6.283185482025146484375;
    float _443 = sin(_441);
    float _445 = _435 * 6.283185482025146484375;
    float _447 = sin(_445);
    float _449 = _439 * _401;
    float _451 = _435 * 6.283185482025146484375;
    float _453 = cos(_451);
    float _455 = _401 * _443;
    float _457 = _425 * _443;
    float _459 = _425 * _439;
    float _461 = _447 * _449;
    float _463 = _453 * _455;
    float _465 = fma(_453, _457, _461);
    float _467 = _447 * _457;
    float _469 = -_463;
    float _471 = fma(_447, _459, _469);
    float _473 = _381 * _465;
    float _475 = _447 * _455;
    float _477 = -_467;
    float _479 = fma(_453, _449, _477);
    float _481 = fma(_389, _471, _473);
    float _483 = fma(_453, _459, _475);
    float _485 = -_247;
    float _487 = _485 + _267;
    float _489 = fma(_385, _479, _481);
    float _491 = fma(_487, _281, _247);
    float _493 = fma(_379, _483, _489);
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
    float _515 = abs(_513);
    float _517 = -_515;
    float _519 = _517 + 1.0;
    float _521 = abs(_513);
    float _523 = fma(_521, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _525 = as_type<int>(_519) + (-218103808);
    float _527 = abs(_513);
    float _529 = fma(_527, _523, -0.212114393711090087890625);
    bool _531 = uint(_525) >= 1920991232u;
    float _533 = -_249;
    float _535 = _533 + _269;
    float _537 = abs(_513);
    float _539 = fma(_537, _529, 1.570728778839111328125);
    bool _541 = _513 < 0.0;
    float _543 = float(_541);
    float _545 = fma(_535, _281, _249);
    bool _547 = !_531;
    float _549 = _519;
    float _551 = _491;
    float _573;
    if (!_547)
    {
        int _553 = as_type<int>(_519);
        int _555 = as_type<int>(_461);
        int _557 = 1968;
        int _559 = as_type<int>(_267);
        int _561;
        int _563;
        int _565;
        int _567;
        int _569;
        int _571;
        _56(_553, _555, _557, _559, _561, _563, _565, _567, _569, _571);
        _573 = as_type<float>(_561);
        _549 = as_type<float>(_563);
        _575 = true;
    }
    else
    {
        float _577 = rsqrt(_519);
        float _579 = _519 * _577;
        float _581 = _577 * 0.5;
        float _583 = -_579;
        float _585 = 0.0 + _583;
        float _587 = fma(_581, _585, 0.5);
        float _589 = fma(_579, _587, _579);
        float _591 = -_589;
        float _593 = 0.0 + _591;
        float _595 = fma(_589, _593, _519);
        float _597 = fma(_581, _595, _589);
        _573 = _597;
    }
    _575 = false;
    float _599 = _573;
    float _601 = _549;
    int _603 = _74 + 8;
    uint _605 = uint(int(uint(_603) >> uint(2)));
    uint _607 = uint(int(uint(int(_605)) >> uint(2)));
    int _609 = int(_605) & 3;
    float _611 = (*spvDescriptorSet0.cp_c5)._m0[int(_607)][_609];
    int _613 = int(_605) + 1;
    uint _615 = uint(int(uint(_613) >> uint(2)));
    int _617 = _613 & 3;
    float _619 = (*spvDescriptorSet0.cp_c5)._m0[int(_615)][_617];
    int _621 = _68;
    int _623 = 1;
    int _625 = _58(_621, _623, (*spvDescriptorSet0.support_buffer));
    int _627 = as_type<int>(_611);
    int _629 = 1;
    int _631 = _58(_627, _629, (*spvDescriptorSet0.support_buffer));
    int3 _2463 = int3(_625, _631, 0);
    float3 _633 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2463.xy), uint(_2463.z), 0).xyz;
    float _635 = _633.x;
    float _637 = _633.y;
    float _639 = _633.z;
    int _641 = _68;
    int _643 = 1;
    int _645 = _58(_641, _643, (*spvDescriptorSet0.support_buffer));
    int _647 = as_type<int>(_611);
    int _649 = 1;
    int _651 = _58(_647, _649, (*spvDescriptorSet0.support_buffer));
    int3 _2481 = int3(_645, _651, 2);
    float3 _653 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2481.xy), uint(_2481.z), 0).xyz;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    int _661 = _68;
    int _663 = 1;
    int _665 = _58(_661, _663, (*spvDescriptorSet0.support_buffer));
    int _667 = as_type<int>(_619);
    int _669 = 1;
    int _671 = _58(_667, _669, (*spvDescriptorSet0.support_buffer));
    int3 _2499 = int3(_665, _671, 0);
    float3 _673 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2499.xy), uint(_2499.z), 0).xyz;
    float _675 = _673.x;
    float _677 = _673.y;
    float _679 = _673.z;
    int _681 = _68;
    int _683 = 1;
    int _685 = _58(_681, _683, (*spvDescriptorSet0.support_buffer));
    int _687 = as_type<int>(_619);
    int _689 = 1;
    int _691 = _58(_687, _689, (*spvDescriptorSet0.support_buffer));
    int3 _2517 = int3(_685, _691, 2);
    float3 _693 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2517.xy), uint(_2517.z), 0).xyz;
    float _695 = _693.x;
    float _697 = _693.y;
    float _699 = _693.z;
    float _701 = _539 * _599;
    float _703 = _543 * 2.0;
    float _705 = -_703;
    float _707 = fma(_701, _705, _701);
    float _709 = fma(_543, 3.1415927410125732421875, _707);
    float _711 = _709 * 0.15915493667125701904296875;
    float _713 = _711 * 6.283185482025146484375;
    float _715 = sin(_713);
    float _717 = abs(_715);
    bool _719 = _717 >= 0.001000000047497451305389404296875;
    bool _721 = isnan(_717);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.001000000047497451305389404296875);
    bool _727 = _723 || _725;
    float _729 = _543;
    float _731 = _601;
    float _733 = _701;
    if (!_727)
    {
        int _735 = _74 + 28;
        uint _737 = uint(int(uint(_735) >> uint(2)));
        uint _739 = uint(int(uint(int(_737)) >> uint(2)));
        int _741 = int(_737) & 3;
        float _743 = (*spvDescriptorSet0.cp_c5)._m0[int(_739)][_741];
        _729 = _743;
    }
    float _745 = _729;
    float _747 = _745;
    if (!_727)
    {
        float _749 = -_745;
        float _751 = _749 + 1.0;
        _731 = _751;
    }
    float _753 = _731;
    float _755 = _753;
    if (!_727)
    {
        _733 = _745;
    }
    float _757 = _733;
    bool _759 = !_727;
    float _761 = _757;
    float _763 = _635;
    if (!_759)
    {
        int _765 = _74 + 28;
        uint _767 = uint(int(uint(_765) >> uint(2)));
        uint _769 = uint(int(uint(int(_767)) >> uint(2)));
        int _771 = int(_767) & 3;
        float _773 = (*spvDescriptorSet0.cp_c5)._m0[int(_769)][_771];
        float _775 = 1.0 / _715;
        float _777 = _709 * _773;
        float _779 = _777 * 0.15915493667125701904296875;
        float _781 = -_777;
        float _783 = _709 + _781;
        float _785 = _783 * 0.15915493667125701904296875;
        float _787 = _779 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = _785 * 6.283185482025146484375;
        float _793 = sin(_791);
        float _795 = _789 * _775;
        float _797 = _793 * _775;
        _761 = _795;
        _755 = _797;
        _747 = _773;
    }
    float _799 = _761;
    float _801 = _755;
    float _803 = _747;
    bool _805 = !_507;
    float _807 = -_799;
    float _809 = _805 ? _807 : _799;
    float _811 = -_635;
    float _813 = _811 + _675;
    float _815 = -_639;
    float _817 = _815 + _679;
    float _819 = -_659;
    float _821 = _819 + _699;
    bool _823 = _68 != 0;
    float _825 = _471 * _809;
    float _827 = _483 * _809;
    float _829 = _479 * _809;
    float _831 = _465 * _809;
    float _833 = fma(_389, _801, _825);
    float _835 = fma(_379, _801, _827);
    int _837 = _74 + 24;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    uint _841 = uint(int(uint(int(_839)) >> uint(2)));
    int _843 = int(_839) & 3;
    float _845 = (*spvDescriptorSet0.cp_c5)._m0[int(_841)][_843];
    float _847 = fma(_385, _801, _829);
    float _849 = fma(_381, _801, _831);
    float _851 = _835 * 2.0;
    float _853 = _833 * 2.0;
    float _855 = _849 * 2.0;
    float _857 = _847 * _851;
    int _859 = _74 + 20;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    uint _863 = uint(int(uint(int(_861)) >> uint(2)));
    int _865 = int(_861) & 3;
    float _867 = (*spvDescriptorSet0.cp_c5)._m0[int(_863)][_865];
    float _869 = _849 * _851;
    float _871 = _833 * _851;
    float _873 = -_857;
    float _875 = fma(_849, _853, _873);
    float _877 = fma(_849, _853, _857);
    float _879 = fma(_847, _853, _869);
    float _881 = -_869;
    float _883 = fma(_847, _853, _881);
    float _885 = -_871;
    float _887 = fma(_847, _855, _885);
    float _889 = fma(_847, _855, _871);
    float _891 = _833 * _833;
    float _893 = -_637;
    float _895 = _893 + _677;
    float _897 = _849 * _849;
    float _899 = _847 * _847;
    float _901 = fma(_891, -2.0, 1.0);
    float _903 = fma(_813, _845, _635);
    float _905 = fma(_895, _845, _637);
    float _907 = fma(_897, -2.0, 1.0);
    float _909 = fma(_899, -2.0, _901);
    float _911 = _903 * _803;
    float _913 = _905 * _803;
    float _915 = fma(_899, -2.0, _907);
    float _917 = fma(_817, _845, _639);
    float _919 = fma(_413, _867, _911);
    float _921 = fma(_407, _867, _913);
    float _923 = fma(_897, -2.0, _901);
    float _925 = -_655;
    float _927 = _925 + _695;
    float _929 = _877 * _919;
    float _931 = _915 * _919;
    float _933 = _883 * _919;
    float _935 = -_657;
    float _937 = _935 + _697;
    float _939 = _917 * _803;
    float _941 = fma(_927, _845, _655);
    float _943 = fma(_821, _845, _659);
    float _945 = fma(_937, _845, _657);
    float _947 = fma(_345, _867, _939);
    float _949 = _875 * _921;
    float _951 = _909 * _921;
    float _953 = _889 * _921;
    float _955 = _941 * _803;
    float _957 = _945 * _803;
    float _959 = _943 * _803;
    float _961 = _923 * _947;
    float _963 = _879 * _947;
    float _965 = _887 * _947;
    float _967 = fma(_491, _867, _955);
    int _969 = _68 * 48;
    float _971 = fma(_545, _867, _957);
    float _973 = fma(_419, _867, _959);
    int _975 = _68 * 112;
    float _977 = _883;
    float _979 = _879;
    float _981 = _957;
    float _983 = _947;
    float _985 = _889;
    float _987 = _915;
    float _989 = _953;
    float _991 = _933;
    float _993 = _965;
    float _995 = _961;
    if (!_823)
    {
        _977 = _967;
    }
    float _997 = _977;
    uint _999 = uint(int(uint(_969) >> uint(2)));
    _37[int(_999)] = as_type<uint>(_931);
    int _1001 = _969 + 4;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    _37[int(_1003)] = as_type<uint>(_949);
    int _1005 = _969 + 8;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    _37[int(_1007)] = as_type<uint>(_963);
    int _1009 = _969 + 12;
    uint _1011 = uint(int(uint(_1009) >> uint(2)));
    _37[int(_1011)] = as_type<uint>(_967);
    float _1013 = _997;
    if (!_823)
    {
        _979 = _971;
    }
    float _1015 = _979;
    float _1017 = _1015;
    if (!_823)
    {
        _981 = _973;
    }
    float _1019 = _981;
    int _1021 = _969 + 16;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    _37[int(_1023)] = as_type<uint>(_929);
    int _1025 = _969 + 20;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    _37[int(_1027)] = as_type<uint>(_951);
    int _1029 = _969 + 24;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    _37[int(_1031)] = as_type<uint>(_965);
    int _1033 = _969 + 28;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    _37[int(_1035)] = as_type<uint>(_971);
    float _1037 = _1019;
    if (!_823)
    {
        _763 = _931;
    }
    float _1039 = _763;
    float _1041 = _1039;
    if (!_823)
    {
        _983 = _949;
    }
    float _1043 = _983;
    int _1045 = _969 + 32;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    _37[int(_1047)] = as_type<uint>(_933);
    int _1049 = _969 + 36;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    _37[int(_1051)] = as_type<uint>(_953);
    int _1053 = _969 + 40;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    _37[int(_1055)] = as_type<uint>(_961);
    int _1057 = _969 + 44;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    _37[int(_1059)] = as_type<uint>(_973);
    float _1061 = _1043;
    if (!_823)
    {
        _985 = _963;
    }
    float _1063 = _985;
    float _1065 = _1063;
    if (!_823)
    {
        _551 = _929;
    }
    float _1067 = _551;
    float _1069 = _1067;
    if (!_823)
    {
        _987 = _951;
    }
    float _1071 = _987;
    bool _1073 = !_823;
    float _1075 = _1071;
    if (!_1073)
    {
        bool _1077 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1079 = !_1077;
        if (!_1079)
        {
            uint _1081 = uint(int(uint(_975) >> uint(2)));
            uint _1083 = uint(int(uint(int(_1081)) >> uint(2)));
            int _1085 = int(_1081) & 3;
            float _1087 = (*spvDescriptorSet0.cp_c6)._m0[int(_1083)][_1085];
            int _1089 = as_type<int>(_1087) * 48;
            int _1091 = 0;
            bool _1093;
            float _1189;
            float _1191;
            float _1193;
            float _1201;
            float _1213;
            float _1215;
            float _1219;
            float _1239;
            float _1241;
            float _1243;
            float _1245;
            float _1247;
            do
            {
                int _1095 = _1091;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1097 = uint(int(uint(_1089) >> uint(2)));
                float _1099 = as_type<float>(_37[int(_1097)]);
                int _1101 = _1089 + 4;
                uint _1103 = uint(int(uint(_1101) >> uint(2)));
                float _1105 = as_type<float>(_37[int(_1103)]);
                int _1107 = _1089 + 8;
                uint _1109 = uint(int(uint(_1107) >> uint(2)));
                float _1111 = as_type<float>(_37[int(_1109)]);
                int _1113 = _1089 + 12;
                uint _1115 = uint(int(uint(_1113) >> uint(2)));
                float _1117 = as_type<float>(_37[int(_1115)]);
                int _1119 = _1095 + 1;
                int _1121 = _1089 + 16;
                uint _1123 = uint(int(uint(_1121) >> uint(2)));
                float _1125 = as_type<float>(_37[int(_1123)]);
                int _1127 = _1089 + 20;
                uint _1129 = uint(int(uint(_1127) >> uint(2)));
                float _1131 = as_type<float>(_37[int(_1129)]);
                int _1133 = _1089 + 24;
                uint _1135 = uint(int(uint(_1133) >> uint(2)));
                float _1137 = as_type<float>(_37[int(_1135)]);
                int _1139 = _1089 + 28;
                uint _1141 = uint(int(uint(_1139) >> uint(2)));
                float _1143 = as_type<float>(_37[int(_1141)]);
                bool _1145 = uint(_1119) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1147 = _1089 + 32;
                uint _1149 = uint(int(uint(_1147) >> uint(2)));
                float _1151 = as_type<float>(_37[int(_1149)]);
                int _1153 = _1089 + 36;
                uint _1155 = uint(int(uint(_1153) >> uint(2)));
                float _1157 = as_type<float>(_37[int(_1155)]);
                int _1159 = _1089 + 40;
                uint _1161 = uint(int(uint(_1159) >> uint(2)));
                float _1163 = as_type<float>(_37[int(_1161)]);
                int _1165 = _1089 + 44;
                uint _1167 = uint(int(uint(_1165) >> uint(2)));
                float _1169 = as_type<float>(_37[int(_1167)]);
                float _1171 = _971 * _1105;
                float _1173 = _929 * _1105;
                float _1175 = _951 * _1105;
                float _1177 = _965 * _1105;
                float _1179 = fma(_967, _1099, _1171);
                float _1181 = fma(_931, _1099, _1173);
                float _1183 = fma(_949, _1099, _1175);
                float _1185 = fma(_963, _1099, _1177);
                float _1187 = fma(_973, _1111, _1179);
                _1189 = fma(_933, _1111, _1181);
                _1191 = fma(_953, _1111, _1183);
                _1193 = fma(_961, _1111, _1185);
                float _1195 = _971 * _1131;
                float _1197 = _929 * _1131;
                float _1199 = _951 * _1131;
                _1201 = _1117 + _1187;
                float _1203 = fma(_967, _1125, _1195);
                float _1205 = fma(_931, _1125, _1197);
                float _1207 = fma(_949, _1125, _1199);
                float _1209 = _965 * _1131;
                float _1211 = fma(_973, _1137, _1203);
                _1213 = fma(_933, _1137, _1205);
                _1215 = fma(_953, _1137, _1207);
                float _1217 = _929 * _1157;
                _1219 = _1143 + _1211;
                float _1221 = _971 * _1157;
                float _1223 = _951 * _1157;
                float _1225 = _965 * _1157;
                float _1227 = fma(_963, _1125, _1209);
                float _1229 = fma(_967, _1151, _1221);
                float _1231 = fma(_931, _1151, _1217);
                float _1233 = fma(_949, _1151, _1223);
                float _1235 = fma(_963, _1151, _1225);
                float _1237 = fma(_973, _1163, _1229);
                _1239 = fma(_961, _1137, _1227);
                _1241 = fma(_933, _1163, _1231);
                _1243 = fma(_953, _1163, _1233);
                _1245 = fma(_961, _1163, _1235);
                _1247 = _1169 + _1237;
                uint _1249 = uint(int(uint(_969) >> uint(2)));
                _37[int(_1249)] = as_type<uint>(_1189);
                int _1251 = _969 + 4;
                uint _1253 = uint(int(uint(_1251) >> uint(2)));
                _37[int(_1253)] = as_type<uint>(_1191);
                int _1255 = _969 + 8;
                uint _1257 = uint(int(uint(_1255) >> uint(2)));
                _37[int(_1257)] = as_type<uint>(_1193);
                int _1259 = _969 + 12;
                uint _1261 = uint(int(uint(_1259) >> uint(2)));
                _37[int(_1261)] = as_type<uint>(_1201);
                int _1263 = _969 + 16;
                uint _1265 = uint(int(uint(_1263) >> uint(2)));
                _37[int(_1265)] = as_type<uint>(_1213);
                int _1267 = _969 + 20;
                uint _1269 = uint(int(uint(_1267) >> uint(2)));
                _37[int(_1269)] = as_type<uint>(_1215);
                int _1271 = _969 + 24;
                uint _1273 = uint(int(uint(_1271) >> uint(2)));
                _37[int(_1273)] = as_type<uint>(_1239);
                int _1275 = _969 + 28;
                uint _1277 = uint(int(uint(_1275) >> uint(2)));
                _37[int(_1277)] = as_type<uint>(_1219);
                int _1279 = _969 + 32;
                uint _1281 = uint(int(uint(_1279) >> uint(2)));
                _37[int(_1281)] = as_type<uint>(_1241);
                int _1283 = _969 + 36;
                uint _1285 = uint(int(uint(_1283) >> uint(2)));
                _37[int(_1285)] = as_type<uint>(_1243);
                int _1287 = _969 + 40;
                uint _1289 = uint(int(uint(_1287) >> uint(2)));
                _37[int(_1289)] = as_type<uint>(_1245);
                int _1291 = _969 + 44;
                uint _1293 = uint(int(uint(_1291) >> uint(2)));
                _37[int(_1293)] = as_type<uint>(_1247);
                _1093 = !_1145;
                _1091 = _1119;
            } while (_1093);
            _1075 = _1215;
            _989 = _1243;
            _1061 = _1191;
            _1069 = _1213;
            _991 = _1241;
            _1041 = _1189;
            _993 = _1239;
            _1065 = _1193;
            _995 = _1245;
            _1017 = _1219;
            _1013 = _1201;
            _1037 = _1247;
            _1295 = true;
        }
        else
        {
            _1075 = 0.0;
            _989 = 0.0;
            _1061 = 0.0;
            _1069 = 0.0;
            _991 = 0.0;
            _1041 = 0.0;
            _993 = 0.0;
            _1065 = 0.0;
            _995 = 0.0;
            _1017 = 0.0;
            _1013 = 0.0;
            _1037 = 0.0;
        }
    }
    _1295 = false;
    float _1297 = _1075;
    float _1299 = _989;
    float _1301 = _1061;
    float _1303 = _1069;
    float _1305 = _991;
    float _1307 = _1041;
    float _1309 = _993;
    float _1311 = _1065;
    float _1313 = _995;
    float _1315 = _1017;
    float _1317 = _1013;
    float _1319 = _1037;
    int _1321 = _975 + 80;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    uint _1325 = uint(int(uint(int(_1323)) >> uint(2)));
    int _1327 = int(_1323) & 3;
    float _1329 = (*spvDescriptorSet0.cp_c6)._m0[int(_1325)][_1327];
    int _1331 = int(_1323) + 1;
    uint _1333 = uint(int(uint(_1331) >> uint(2)));
    int _1335 = _1331 & 3;
    float _1337 = (*spvDescriptorSet0.cp_c6)._m0[int(_1333)][_1335];
    int _1339 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1341 = _1339 + _68;
    int _1343 = _975 + 64;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    uint _1347 = uint(int(uint(int(_1345)) >> uint(2)));
    int _1349 = int(_1345) & 3;
    float _1351 = (*spvDescriptorSet0.cp_c6)._m0[int(_1347)][_1349];
    int _1353 = int(_1345) + 1;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    int _1357 = _1353 & 3;
    float _1359 = (*spvDescriptorSet0.cp_c6)._m0[int(_1355)][_1357];
    int _1361 = _1341 * 48;
    int _1363 = _975 + 88;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.cp_c6)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.cp_c6)._m0[int(_1375)][_1377];
    int _1381 = _975 + 72;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.cp_c6)._m0[int(_1385)][_1387];
    int _1391 = int(_1383) + 1;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    int _1395 = _1391 & 3;
    float _1397 = (*spvDescriptorSet0.cp_c6)._m0[int(_1393)][_1395];
    int _1399 = _975 + 96;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.cp_c6)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.cp_c6)._m0[int(_1411)][_1413];
    int _1417 = _975 + 104;
    uint _1419 = uint(int(uint(_1417) >> uint(2)));
    uint _1421 = uint(int(uint(int(_1419)) >> uint(2)));
    int _1423 = int(_1419) & 3;
    float _1425 = (*spvDescriptorSet0.cp_c6)._m0[int(_1421)][_1423];
    int _1427 = int(_1419) + 1;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    int _1431 = _1427 & 3;
    float _1433 = (*spvDescriptorSet0.cp_c6)._m0[int(_1429)][_1431];
    float _1435 = _1297 * _1329;
    float _1437 = _1299 * _1329;
    int _1439 = _975 + 16;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    uint _1443 = uint(int(uint(int(_1441)) >> uint(2)));
    int _1445 = int(_1441) & 3;
    float _1447 = (*spvDescriptorSet0.cp_c6)._m0[int(_1443)][_1445];
    int _1449 = int(_1441) + 1;
    uint _1451 = uint(int(uint(_1449) >> uint(2)));
    int _1453 = _1449 & 3;
    float _1455 = (*spvDescriptorSet0.cp_c6)._m0[int(_1451)][_1453];
    float _1457 = _1301 * _1329;
    float _1459 = fma(_1303, _1351, _1435);
    float _1461 = fma(_1305, _1351, _1437);
    float _1463 = _1301 * _1337;
    float _1465 = _1297 * _1337;
    float _1467 = _1299 * _1337;
    int _1469 = _975 + 32;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    uint _1473 = uint(int(uint(int(_1471)) >> uint(2)));
    int _1475 = int(_1471) & 3;
    float _1477 = (*spvDescriptorSet0.cp_c6)._m0[int(_1473)][_1475];
    int _1479 = int(_1471) + 1;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    int _1483 = _1479 & 3;
    float _1485 = (*spvDescriptorSet0.cp_c6)._m0[int(_1481)][_1483];
    float _1487 = fma(_1307, _1359, _1463);
    float _1489 = fma(_1303, _1359, _1465);
    float _1491 = fma(_1305, _1359, _1467);
    float _1493 = _1301 * _1371;
    float _1495 = _1301 * _1379;
    float _1497 = _1297 * _1371;
    float _1499 = _1299 * _1371;
    int _1501 = _975 + 48;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
    int _1507 = int(_1503) & 3;
    float _1509 = (*spvDescriptorSet0.cp_c6)._m0[int(_1505)][_1507];
    int _1511 = int(_1503) + 1;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    int _1515 = _1511 & 3;
    float _1517 = (*spvDescriptorSet0.cp_c6)._m0[int(_1513)][_1515];
    float _1519 = _1297 * _1379;
    float _1521 = _1299 * _1379;
    float _1523 = fma(_1303, _1389, _1497);
    float _1525 = fma(_1307, _1389, _1493);
    float _1527 = fma(_1307, _1397, _1495);
    float _1529 = fma(_1303, _1397, _1519);
    float _1531 = fma(_1305, _1389, _1499);
    int _1533 = _975 + 24;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    uint _1537 = uint(int(uint(int(_1535)) >> uint(2)));
    int _1539 = int(_1535) & 3;
    float _1541 = (*spvDescriptorSet0.cp_c6)._m0[int(_1537)][_1539];
    int _1543 = int(_1535) + 1;
    uint _1545 = uint(int(uint(_1543) >> uint(2)));
    int _1547 = _1543 & 3;
    float _1549 = (*spvDescriptorSet0.cp_c6)._m0[int(_1545)][_1547];
    float _1551 = fma(_1305, _1397, _1521);
    float _1553 = fma(_1307, _1351, _1457);
    float _1555 = fma(_1309, _1407, _1459);
    float _1557 = fma(_1311, _1415, _1487);
    float _1559 = fma(_1309, _1415, _1489);
    float _1561 = fma(_1313, _1407, _1461);
    float _1563 = fma(_1313, _1415, _1491);
    int _1565 = _975 + 40;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    uint _1569 = uint(int(uint(int(_1567)) >> uint(2)));
    int _1571 = int(_1567) & 3;
    float _1573 = (*spvDescriptorSet0.cp_c6)._m0[int(_1569)][_1571];
    int _1575 = int(_1567) + 1;
    uint _1577 = uint(int(uint(_1575) >> uint(2)));
    int _1579 = _1575 & 3;
    float _1581 = (*spvDescriptorSet0.cp_c6)._m0[int(_1577)][_1579];
    float _1583 = fma(_1311, _1407, _1553);
    float _1585 = fma(_1309, _1433, _1529);
    float _1587 = fma(_1311, _1433, _1527);
    float _1589 = fma(_1313, _1433, _1551);
    float _1591 = fma(_1313, _1425, _1531);
    float _1593 = _1585 + _1315;
    int _1595 = _975 + 56;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    uint _1599 = uint(int(uint(int(_1597)) >> uint(2)));
    int _1601 = int(_1597) & 3;
    float _1603 = (*spvDescriptorSet0.cp_c6)._m0[int(_1599)][_1601];
    int _1605 = int(_1597) + 1;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    int _1609 = _1605 & 3;
    float _1611 = (*spvDescriptorSet0.cp_c6)._m0[int(_1607)][_1609];
    float _1613 = fma(_1309, _1425, _1523);
    float _1615 = _1587 + _1317;
    float _1617 = fma(_1311, _1425, _1525);
    float _1619 = _1589 + _1319;
    float _1621 = _1593 * _1455;
    float _1623 = _1559 * _1455;
    float _1625 = _1555 * _1455;
    float _1627 = _1613 * _1455;
    float _1629 = fma(_1615, _1447, _1621);
    float _1631 = fma(_1557, _1447, _1623);
    float _1633 = fma(_1583, _1447, _1625);
    float _1635 = fma(_1617, _1447, _1627);
    float _1637 = _1593 * _1485;
    float _1639 = _1559 * _1485;
    float _1641 = _1555 * _1485;
    float _1643 = _1613 * _1485;
    float _1645 = fma(_1615, _1477, _1637);
    float _1647 = fma(_1557, _1477, _1639);
    float _1649 = fma(_1583, _1477, _1641);
    float _1651 = fma(_1617, _1477, _1643);
    float _1653 = _1593 * _1517;
    float _1655 = _1559 * _1517;
    float _1657 = _1555 * _1517;
    float _1659 = _1613 * _1517;
    float _1661 = fma(_1615, _1509, _1653);
    float _1663 = fma(_1557, _1509, _1655);
    float _1665 = fma(_1583, _1509, _1657);
    float _1667 = fma(_1617, _1509, _1659);
    float _1669 = fma(_1619, _1541, _1629);
    float _1671 = fma(_1563, _1541, _1631);
    float _1673 = fma(_1561, _1541, _1633);
    float _1675 = fma(_1591, _1541, _1635);
    float _1677 = _1669 + _1549;
    float _1679 = fma(_1619, _1573, _1645);
    float _1681 = fma(_1563, _1573, _1647);
    float _1683 = fma(_1561, _1573, _1649);
    float _1685 = fma(_1591, _1573, _1651);
    float _1687 = _1679 + _1581;
    float _1689 = fma(_1619, _1603, _1661);
    float _1691 = fma(_1563, _1603, _1663);
    int _1693 = _1361 + 16;
    float _1695 = fma(_1561, _1603, _1665);
    int _1697 = _1361 + 32;
    float _1699 = fma(_1591, _1603, _1667);
    float _1701 = _1689 + _1611;
    int _1703 = _1361 + 48;
    uint _1705 = uint(int(uint(_1693) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1705)] = as_type<uint>(_1673);
    int _1707 = _1693 + 4;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1709)] = as_type<uint>(_1671);
    int _1711 = _1693 + 8;
    uint _1713 = uint(int(uint(_1711) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1713)] = as_type<uint>(_1675);
    int _1715 = _1693 + 12;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1717)] = as_type<uint>(_1677);
    uint _1719 = uint(int(uint(_1697) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1719)] = as_type<uint>(_1683);
    int _1721 = _1697 + 4;
    uint _1723 = uint(int(uint(_1721) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1723)] = as_type<uint>(_1681);
    int _1725 = _1697 + 8;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1727)] = as_type<uint>(_1685);
    int _1729 = _1697 + 12;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1731)] = as_type<uint>(_1687);
    uint _1733 = uint(int(uint(_1703) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1733)] = as_type<uint>(_1695);
    int _1735 = _1703 + 4;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1737)] = as_type<uint>(_1691);
    int _1739 = _1703 + 8;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1741)] = as_type<uint>(_1699);
    int _1743 = _1703 + 12;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1745)] = as_type<uint>(_1701);
}

