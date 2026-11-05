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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4329, thread const int& _4330, constant _10& support_buffer)
{
    int _4333 = 1 + _4330;
    float _4335 = support_buffer._m5[_4333].x;
    bool _4337 = _4335 == 1.0;
    if (_4337)
    {
        return _4329;
    }
    float _4339 = float(_4329);
    float _4341 = _4339 * _4335;
    int _4343 = int(_4341);
    return _4343;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1223 = false;
    bool _761 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _74 = _64;
    if (_72)
    {
        return;
    }
    int _76 = _68 & 31;
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
    int _101 = _80 ? _93 : _99;
    int _103 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _105 = _103 + 32;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _101 & as_type<int>(_113);
    bool _117 = _115 != 0;
    float _119 = 0.0;
    float _121 = 0.0;
    if (!_117)
    {
        _119 = 0.0;
        _121 = 0.0;
    }
    float _123 = _119;
    float _125 = _121;
    float _127 = 0.0;
    float _129 = 0.0;
    float _131 = _123;
    float _133 = _125;
    if (!_117)
    {
        _127 = 0.0;
        _129 = 0.0;
    }
    float _135 = _127;
    float _137 = _129;
    float _139 = 0.0;
    float _141 = 0.0;
    float _143 = _135;
    float _145 = _137;
    if (!_117)
    {
        _139 = 0.0;
        _141 = 0.0;
    }
    float _147 = _139;
    float _149 = _141;
    float _151 = 0.0;
    float _153 = 0.0;
    float _155 = _147;
    float _157 = _149;
    if (!_117)
    {
        _151 = 0.0;
        _153 = 0.0;
    }
    float _159 = _151;
    float _161 = _153;
    float _163 = _159;
    float _165 = _161;
    if (!_117)
    {
        _74 = 0.0;
    }
    float _167 = _74;
    bool _169 = !_117;
    float _171 = _167;
    if (!_169)
    {
        uint _173 = uint(int(uint(_103) >> uint(2)));
        uint _175 = uint(int(uint(int(_173)) >> uint(2)));
        int _177 = int(_173) & 3;
        float _179 = (*spvDescriptorSet0.cp_c5)._m0[int(_175)][_177];
        int _181 = int(_173) + 1;
        uint _183 = uint(int(uint(_181) >> uint(2)));
        int _185 = _181 & 3;
        float _187 = (*spvDescriptorSet0.cp_c5)._m0[int(_183)][_185];
        int _189 = _68;
        int _191 = 0;
        int _193 = _58(_189, _191, (*spvDescriptorSet0.support_buffer));
        int _195 = as_type<int>(_179);
        int _197 = 0;
        int _199 = _58(_195, _197, (*spvDescriptorSet0.support_buffer));
        int3 _1896 = int3(_193, _199, 1);
        float3 _203 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1896.xy), uint(_1896.z), 0).xyz;
        float _205 = _203.x;
        float _207 = _203.y;
        float _209 = _203.z;
        int _211 = _68;
        int _213 = 0;
        int _215 = _58(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = as_type<int>(_187);
        int _219 = 0;
        int _221 = _58(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1914 = int3(_215, _221, 1);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1914.xy), uint(_1914.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        int _231 = _68;
        int _233 = 0;
        int _235 = _58(_231, _233, (*spvDescriptorSet0.support_buffer));
        int _237 = as_type<int>(_179);
        int _239 = 0;
        int _241 = _58(_237, _239, (*spvDescriptorSet0.support_buffer));
        int3 _1932 = int3(_235, _241, 0);
        float3 _243 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1932.xy), uint(_1932.z), 0).xyz;
        float _245 = _243.x;
        float _247 = _243.y;
        float _249 = _243.z;
        int _251 = _68;
        int _253 = 0;
        int _255 = _58(_251, _253, (*spvDescriptorSet0.support_buffer));
        int _257 = as_type<int>(_187);
        int _259 = 0;
        int _261 = _58(_257, _259, (*spvDescriptorSet0.support_buffer));
        int3 _1950 = int3(_255, _261, 0);
        float3 _263 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1950.xy), uint(_1950.z), 0).xyz;
        float _265 = _263.x;
        float _267 = _263.y;
        float _269 = _263.z;
        int _271 = _68;
        int _273 = 0;
        int _275 = _58(_271, _273, (*spvDescriptorSet0.support_buffer));
        int _277 = as_type<int>(_179);
        int _279 = 0;
        int _281 = _58(_277, _279, (*spvDescriptorSet0.support_buffer));
        int3 _1968 = int3(_275, _281, 2);
        float3 _283 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1968.xy), uint(_1968.z), 0).xyz;
        float _285 = _283.x;
        float _287 = _283.y;
        float _289 = _283.z;
        int _291 = _68;
        int _293 = 0;
        int _295 = _58(_291, _293, (*spvDescriptorSet0.support_buffer));
        int _297 = as_type<int>(_187);
        int _299 = 0;
        int _301 = _58(_297, _299, (*spvDescriptorSet0.support_buffer));
        int3 _1986 = int3(_295, _301, 2);
        float3 _303 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1986.xy), uint(_1986.z), 0).xyz;
        float _305 = _303.x;
        float _307 = _303.y;
        float _309 = _303.z;
        int _311 = _103 + 16;
        uint _313 = uint(int(uint(_311) >> uint(2)));
        uint _315 = uint(int(uint(int(_313)) >> uint(2)));
        int _317 = int(_313) & 3;
        float _319 = (*spvDescriptorSet0.cp_c5)._m0[int(_315)][_317];
        float _321 = -_205;
        float _323 = _321 + _225;
        float _325 = -_207;
        float _327 = _325 + _227;
        float _329 = -_245;
        float _331 = _329 + _265;
        float _333 = -_249;
        float _335 = _333 + _269;
        float _337 = fma(_323, _319, _205);
        float _339 = -_247;
        float _341 = _339 + _267;
        float _343 = -_209;
        float _345 = _343 + _229;
        float _347 = -_285;
        float _349 = _347 + _305;
        float _351 = -_287;
        float _353 = _351 + _307;
        float _355 = -_289;
        float _357 = _355 + _309;
        float _359 = fma(_341, _319, _247);
        float _361 = fma(_335, _319, _249);
        float _363 = fma(_327, _319, _207);
        float _365 = fma(_345, _319, _209);
        float _367 = fma(_331, _319, _245);
        float _369 = fma(_349, _319, _285);
        float _371 = fma(_353, _319, _287);
        float _373 = fma(_357, _319, _289);
        _171 = _365;
        _163 = _337;
        _165 = _363;
        _131 = _361;
        _133 = _367;
        _143 = _373;
        _145 = _359;
        _155 = _369;
        _157 = _371;
    }
    float _375 = _171;
    float _377 = _163;
    float _379 = _165;
    float _381 = _131;
    float _383 = _133;
    float _385 = _143;
    float _387 = _145;
    float _389 = _155;
    float _391 = _157;
    int _393 = _103 + 36;
    uint _395 = uint(int(uint(_393) >> uint(2)));
    uint _397 = uint(int(uint(int(_395)) >> uint(2)));
    int _399 = int(_395) & 3;
    float _401 = (*spvDescriptorSet0.cp_c5)._m0[int(_397)][_399];
    int _403 = _101 & as_type<int>(_401);
    bool _405 = _403 != 0;
    bool _407 = !_405;
    float _409 = _383;
    float _411 = _387;
    float _413 = _381;
    float _415 = _391;
    float _417 = _389;
    float _419 = _385;
    float _737;
    float _739;
    float _741;
    float _743;
    float _745;
    float _747;
    float _749;
    float _751;
    float _753;
    int _755;
    int _757;
    int _759;
    if (!_407)
    {
        int _421 = _103 + 8;
        uint _423 = uint(int(uint(_421) >> uint(2)));
        uint _425 = uint(int(uint(int(_423)) >> uint(2)));
        int _427 = int(_423) & 3;
        float _429 = (*spvDescriptorSet0.cp_c5)._m0[int(_425)][_427];
        int _431 = int(_423) + 1;
        uint _433 = uint(int(uint(_431) >> uint(2)));
        int _435 = _431 & 3;
        float _437 = (*spvDescriptorSet0.cp_c5)._m0[int(_433)][_435];
        int _439 = _68;
        int _441 = 1;
        int _443 = _58(_439, _441, (*spvDescriptorSet0.support_buffer));
        int _445 = as_type<int>(_429);
        int _447 = 1;
        int _449 = _58(_445, _447, (*spvDescriptorSet0.support_buffer));
        int3 _2189 = int3(_443, _449, 1);
        float3 _451 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2189.xy), uint(_2189.z), 0).xyz;
        float _453 = _451.x;
        float _455 = _451.y;
        float _457 = _451.z;
        int _459 = _68;
        int _461 = 1;
        int _463 = _58(_459, _461, (*spvDescriptorSet0.support_buffer));
        int _465 = as_type<int>(_437);
        int _467 = 1;
        int _469 = _58(_465, _467, (*spvDescriptorSet0.support_buffer));
        int3 _2207 = int3(_463, _469, 1);
        float3 _471 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2207.xy), uint(_2207.z), 0).xyz;
        float _473 = _471.x;
        float _475 = _471.y;
        float _477 = _471.z;
        int _479 = _68;
        int _481 = 1;
        int _483 = _58(_479, _481, (*spvDescriptorSet0.support_buffer));
        int _485 = as_type<int>(_429);
        int _487 = 1;
        int _489 = _58(_485, _487, (*spvDescriptorSet0.support_buffer));
        int3 _2225 = int3(_483, _489, 0);
        float3 _491 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2225.xy), uint(_2225.z), 0).xyz;
        float _493 = _491.x;
        float _495 = _491.y;
        float _497 = _491.z;
        int _499 = _68;
        int _501 = 1;
        int _503 = _58(_499, _501, (*spvDescriptorSet0.support_buffer));
        int _505 = as_type<int>(_437);
        int _507 = 1;
        int _509 = _58(_505, _507, (*spvDescriptorSet0.support_buffer));
        int3 _2243 = int3(_503, _509, 0);
        float3 _511 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2243.xy), uint(_2243.z), 0).xyz;
        float _513 = _511.x;
        float _515 = _511.y;
        float _517 = _511.z;
        int _519 = _68;
        int _521 = 1;
        int _523 = _58(_519, _521, (*spvDescriptorSet0.support_buffer));
        int _525 = as_type<int>(_429);
        int _527 = 1;
        int _529 = _58(_525, _527, (*spvDescriptorSet0.support_buffer));
        int3 _2261 = int3(_523, _529, 2);
        float3 _531 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2261.xy), uint(_2261.z), 0).xyz;
        float _533 = _531.x;
        float _535 = _531.y;
        float _537 = _531.z;
        int _539 = _68;
        int _541 = 1;
        int _543 = _58(_539, _541, (*spvDescriptorSet0.support_buffer));
        int _545 = as_type<int>(_437);
        int _547 = 1;
        int _549 = _58(_545, _547, (*spvDescriptorSet0.support_buffer));
        int3 _2279 = int3(_543, _549, 2);
        float3 _551 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2279.xy), uint(_2279.z), 0).xyz;
        float _553 = _551.x;
        float _555 = _551.y;
        float _557 = _551.z;
        int _559 = _103 + 24;
        uint _561 = uint(int(uint(_559) >> uint(2)));
        uint _563 = uint(int(uint(int(_561)) >> uint(2)));
        int _565 = int(_561) & 3;
        float _567 = (*spvDescriptorSet0.cp_c5)._m0[int(_563)][_565];
        int _569 = int(_561) + 1;
        uint _571 = uint(int(uint(_569) >> uint(2)));
        int _573 = _569 & 3;
        float _575 = (*spvDescriptorSet0.cp_c5)._m0[int(_571)][_573];
        int _577 = _103 + 20;
        uint _579 = uint(int(uint(_577) >> uint(2)));
        uint _581 = uint(int(uint(int(_579)) >> uint(2)));
        int _583 = int(_579) & 3;
        float _585 = (*spvDescriptorSet0.cp_c5)._m0[int(_581)][_583];
        float _587 = -_457;
        float _589 = _587 + _477;
        float _591 = -_453;
        float _593 = _591 + _473;
        float _595 = fma(_589, _567, _457);
        float _597 = fma(_593, _567, _453);
        float _599 = _595 * _575;
        float _601 = _597 * _575;
        float _603 = fma(_375, _585, _599);
        float _605 = -_455;
        float _607 = _605 + _475;
        float _609 = fma(_377, _585, _601);
        float _611 = fma(_607, _567, _455);
        float _613 = _609 * 0.15915493667125701904296875;
        float _615 = _611 * _575;
        float _617 = _603 * 0.15915493667125701904296875;
        float _619 = _613 * 6.283185482025146484375;
        float _621 = sin(_619);
        float _623 = -_497;
        float _625 = _623 + _517;
        float _627 = fma(_379, _585, _615);
        float _629 = -_493;
        float _631 = _629 + _513;
        float _633 = -_537;
        float _635 = _633 + _557;
        float _637 = fma(_625, _567, _497);
        float _639 = _627 * 0.15915493667125701904296875;
        float _641 = fma(_631, _567, _493);
        float _643 = _613 * 6.283185482025146484375;
        float _645 = cos(_643);
        float _647 = fma(_635, _567, _537);
        float _649 = _637 * _575;
        float _651 = _641 * _575;
        float _653 = _647 * _575;
        float _655 = fma(_381, _585, _649);
        float _657 = fma(_383, _585, _651);
        float _659 = _617 * 6.283185482025146484375;
        float _661 = sin(_659);
        float _663 = fma(_385, _585, _653);
        float _665 = _617 * 6.283185482025146484375;
        float _667 = cos(_665);
        float _669 = _639 * 6.283185482025146484375;
        float _671 = sin(_669);
        float _673 = _661 * _645;
        float _675 = _621 * _661;
        float _677 = _639 * 6.283185482025146484375;
        float _679 = cos(_677);
        float _681 = _645 * _667;
        float _683 = _621 * _671;
        float _685 = -_673;
        float _687 = fma(_667, _683, _685);
        float _689 = _645 * _679;
        float _691 = _661 * _679;
        float _693 = fma(_661, _683, _681);
        float _695 = -_495;
        float _697 = _695 + _515;
        float _699 = _621 * _679;
        float _701 = _679 * _667;
        float _703 = _621 * _667;
        float _705 = fma(_697, _567, _495);
        float _707 = fma(_671, _681, _675);
        float _709 = -_533;
        float _711 = _709 + _553;
        float _713 = -_535;
        float _715 = _713 + _555;
        float _717 = _705 * _575;
        float _719 = -_703;
        float _721 = fma(_671, _673, _719);
        float _723 = fma(_711, _567, _533);
        float _725 = fma(_715, _567, _535);
        float _727 = fma(_387, _585, _717);
        float _729 = _723 * _575;
        float _731 = _725 * _575;
        float _733 = fma(_389, _585, _729);
        float _735 = fma(_391, _585, _731);
        _409 = _657;
        _737 = _671;
        _739 = _701;
        _741 = _691;
        _411 = _727;
        _743 = _687;
        _745 = _693;
        _747 = _699;
        _413 = _655;
        _749 = _707;
        _751 = _721;
        _753 = _689;
        _755 = as_type<int>(_733);
        _757 = as_type<int>(_735);
        _759 = as_type<int>(_663);
        _761 = true;
    }
    else
    {
        float _763 = _377 * 0.15915493667125701904296875;
        float _765 = _375 * 0.15915493667125701904296875;
        float _767 = _379 * 0.15915493667125701904296875;
        float _769 = _763 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = _763 * 6.283185482025146484375;
        float _775 = cos(_773);
        float _777 = _765 * 6.283185482025146484375;
        float _779 = sin(_777);
        float _781 = _765 * 6.283185482025146484375;
        float _783 = cos(_781);
        float _785 = _767 * 6.283185482025146484375;
        float _787 = sin(_785);
        float _789 = _779 * _775;
        float _791 = _771 * _779;
        float _793 = _767 * 6.283185482025146484375;
        float _795 = cos(_793);
        float _797 = _775 * _783;
        float _799 = _771 * _783;
        float _801 = _771 * _787;
        float _803 = -_789;
        float _805 = fma(_783, _801, _803);
        float _807 = _775 * _795;
        float _809 = _795 * _783;
        float _811 = _779 * _795;
        float _813 = _771 * _795;
        float _815 = fma(_779, _801, _797);
        float _817 = fma(_787, _797, _791);
        float _819 = -_799;
        float _821 = fma(_787, _789, _819);
        _737 = _787;
        _739 = _809;
        _741 = _811;
        _743 = _805;
        _745 = _815;
        _747 = _813;
        _749 = _817;
        _751 = _821;
        _753 = _807;
        _755 = as_type<int>(_389);
        _757 = as_type<int>(_391);
        _759 = as_type<int>(_385);
    }
    _761 = false;
    float _823 = _409;
    float _825 = _737;
    float _827 = _739;
    float _829 = _741;
    float _831 = _411;
    float _833 = _743;
    float _835 = _745;
    float _837 = _747;
    float _839 = _413;
    float _841 = _749;
    float _843 = _751;
    float _845 = _753;
    int _847 = _755;
    int _849 = _757;
    int _851 = _759;
    float _853 = _823 * _825;
    float _855 = _823 * _827;
    float _857 = _823 * _829;
    float _859 = _831 * _833;
    float _861 = _831 * _835;
    float _863 = _831 * _837;
    int _865 = _68 * 48;
    float _867 = _839 * _841;
    float _869 = _839 * _843;
    float _871 = _839 * _845;
    float _873 = -_853;
    float _875 = _873 + (-0.0);
    bool _877 = _68 != 0;
    uint _879 = uint(int(uint(_865) >> uint(2)));
    _39[int(_879)] = as_type<uint>(_855);
    int _881 = _865 + 4;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    _39[int(_883)] = as_type<uint>(_859);
    int _885 = _865 + 8;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    _39[int(_887)] = as_type<uint>(_867);
    int _889 = _865 + 12;
    uint _891 = uint(int(uint(_889) >> uint(2)));
    _39[int(_891)] = uint(_847);
    int _893 = _68 * 112;
    int _895 = _865 + 16;
    int _897 = _865 + 16;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    _39[int(_899)] = as_type<uint>(_857);
    int _901 = _865 + 20;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    _39[int(_903)] = as_type<uint>(_861);
    int _905 = _865 + 24;
    uint _907 = uint(int(uint(_905) >> uint(2)));
    _39[int(_907)] = as_type<uint>(_869);
    int _909 = _865 + 28;
    uint _911 = uint(int(uint(_909) >> uint(2)));
    _39[int(_911)] = uint(_849);
    int _913 = _865 + 32;
    int _915 = _865 + 32;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    _39[int(_917)] = as_type<uint>(_875);
    int _919 = _865 + 36;
    uint _921 = uint(int(uint(_919) >> uint(2)));
    _39[int(_921)] = as_type<uint>(_863);
    int _923 = _865 + 40;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    _39[int(_925)] = as_type<uint>(_871);
    int _927 = _865 + 44;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    _39[int(_929)] = uint(_851);
    float _931 = _843;
    float _933 = _835;
    float _935 = _829;
    float _937 = _841;
    float _939 = _833;
    float _941 = _827;
    float _943 = _823;
    float _945 = _839;
    float _947 = _831;
    if (!_877)
    {
        _931 = _855;
    }
    float _949 = _931;
    float _951 = _949;
    if (!_877)
    {
        _933 = _859;
    }
    float _953 = _933;
    float _955 = _953;
    if (!_877)
    {
        _935 = _867;
    }
    float _957 = _935;
    float _959 = _957;
    if (!_877)
    {
        _937 = as_type<float>(_847);
    }
    float _961 = _937;
    float _963 = _961;
    if (!_877)
    {
        _939 = _857;
    }
    float _965 = _939;
    float _967 = _965;
    if (!_877)
    {
        _941 = _861;
    }
    float _969 = _941;
    float _971 = _969;
    if (!_877)
    {
        _943 = _869;
    }
    float _973 = _943;
    float _975 = _973;
    if (!_877)
    {
        _945 = as_type<float>(_849);
    }
    float _977 = _945;
    float _979 = _977;
    if (!_877)
    {
        _947 = _863;
    }
    float _981 = _947;
    float _983 = _981;
    if (!_877)
    {
        _415 = _871;
    }
    float _985 = _415;
    float _987 = _985;
    if (!_877)
    {
        _417 = as_type<float>(_851);
    }
    float _989 = _417;
    float _991 = _989;
    if (!_877)
    {
        _419 = _875;
    }
    float _993 = _419;
    bool _995 = !_877;
    float _997 = _993;
    if (!_995)
    {
        bool _999 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1001 = !_999;
        if (!_1001)
        {
            uint _1003 = uint(int(uint(_893) >> uint(2)));
            uint _1005 = uint(int(uint(int(_1003)) >> uint(2)));
            int _1007 = int(_1003) & 3;
            float _1009 = (*spvDescriptorSet0.cp_c6)._m0[int(_1005)][_1007];
            int _1011 = as_type<int>(_1009) * 48;
            int _1013 = 0;
            bool _1015;
            float _1115;
            float _1117;
            float _1125;
            float _1137;
            float _1139;
            float _1153;
            float _1163;
            float _1165;
            do
            {
                int _1017 = _1013;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1019 = uint(int(uint(_1011) >> uint(2)));
                float _1021 = as_type<float>(_39[int(_1019)]);
                int _1023 = _1011 + 4;
                uint _1025 = uint(int(uint(_1023) >> uint(2)));
                float _1027 = as_type<float>(_39[int(_1025)]);
                int _1029 = _1011 + 8;
                uint _1031 = uint(int(uint(_1029) >> uint(2)));
                float _1033 = as_type<float>(_39[int(_1031)]);
                int _1035 = _1011 + 12;
                uint _1037 = uint(int(uint(_1035) >> uint(2)));
                float _1039 = as_type<float>(_39[int(_1037)]);
                int _1041 = _1017 + 1;
                int _1043 = _1011 + 16;
                uint _1045 = uint(int(uint(_1043) >> uint(2)));
                float _1047 = as_type<float>(_39[int(_1045)]);
                int _1049 = _1011 + 20;
                uint _1051 = uint(int(uint(_1049) >> uint(2)));
                float _1053 = as_type<float>(_39[int(_1051)]);
                int _1055 = _1011 + 24;
                uint _1057 = uint(int(uint(_1055) >> uint(2)));
                float _1059 = as_type<float>(_39[int(_1057)]);
                int _1061 = _1011 + 28;
                uint _1063 = uint(int(uint(_1061) >> uint(2)));
                float _1065 = as_type<float>(_39[int(_1063)]);
                bool _1067 = uint(_1041) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1069 = _1011 + 32;
                uint _1071 = uint(int(uint(_1069) >> uint(2)));
                float _1073 = as_type<float>(_39[int(_1071)]);
                int _1075 = _1011 + 36;
                uint _1077 = uint(int(uint(_1075) >> uint(2)));
                float _1079 = as_type<float>(_39[int(_1077)]);
                int _1081 = _1011 + 40;
                uint _1083 = uint(int(uint(_1081) >> uint(2)));
                float _1085 = as_type<float>(_39[int(_1083)]);
                int _1087 = _1011 + 44;
                uint _1089 = uint(int(uint(_1087) >> uint(2)));
                float _1091 = as_type<float>(_39[int(_1089)]);
                float _1093 = _1027 * as_type<float>(_849);
                float _1095 = _857 * _1027;
                float _1097 = _861 * _1027;
                float _1099 = _869 * _1027;
                float _1101 = fma(_1021, as_type<float>(_847), _1093);
                float _1103 = fma(_855, _1021, _1095);
                float _1105 = fma(_859, _1021, _1097);
                float _1107 = fma(_867, _1021, _1099);
                float _1109 = fma(_1033, as_type<float>(_851), _1101);
                float _1111 = _1053 * as_type<float>(_849);
                float _1113 = -_853;
                _1115 = fma(_1113, _1033, _1103);
                _1117 = fma(_863, _1033, _1105);
                float _1119 = _857 * _1053;
                float _1121 = _861 * _1053;
                float _1123 = fma(_1047, as_type<float>(_847), _1111);
                _1125 = _1039 + _1109;
                float _1127 = fma(_855, _1047, _1119);
                float _1129 = fma(_859, _1047, _1121);
                float _1131 = fma(_1059, as_type<float>(_851), _1123);
                float _1133 = _1079 * as_type<float>(_849);
                float _1135 = -_853;
                _1137 = fma(_1135, _1059, _1127);
                _1139 = fma(_863, _1059, _1129);
                float _1141 = _869 * _1053;
                float _1143 = _857 * _1079;
                float _1145 = _861 * _1079;
                float _1147 = _869 * _1079;
                float _1149 = fma(_1073, as_type<float>(_847), _1133);
                float _1151 = fma(_867, _1047, _1141);
                _1153 = _1065 + _1131;
                float _1155 = fma(_855, _1073, _1143);
                float _1157 = fma(_859, _1073, _1145);
                float _1159 = fma(_867, _1073, _1147);
                float _1161 = fma(_1085, as_type<float>(_851), _1149);
                _1163 = fma(_871, _1059, _1151);
                _1165 = fma(_871, _1033, _1107);
                float _1167 = -_853;
                float _1169 = fma(_1167, _1085, _1155);
                float _1171 = fma(_863, _1085, _1157);
                float _1173 = fma(_871, _1085, _1159);
                float _1175 = _1091 + _1161;
                uint _1177 = uint(int(uint(_865) >> uint(2)));
                _39[int(_1177)] = as_type<uint>(_1115);
                int _1179 = _865 + 4;
                uint _1181 = uint(int(uint(_1179) >> uint(2)));
                _39[int(_1181)] = as_type<uint>(_1117);
                int _1183 = _865 + 8;
                uint _1185 = uint(int(uint(_1183) >> uint(2)));
                _39[int(_1185)] = as_type<uint>(_1165);
                int _1187 = _865 + 12;
                uint _1189 = uint(int(uint(_1187) >> uint(2)));
                _39[int(_1189)] = as_type<uint>(_1125);
                int _1191 = _865 + 16;
                uint _1193 = uint(int(uint(_1191) >> uint(2)));
                _39[int(_1193)] = as_type<uint>(_1137);
                int _1195 = _865 + 20;
                uint _1197 = uint(int(uint(_1195) >> uint(2)));
                _39[int(_1197)] = as_type<uint>(_1139);
                int _1199 = _865 + 24;
                uint _1201 = uint(int(uint(_1199) >> uint(2)));
                _39[int(_1201)] = as_type<uint>(_1163);
                int _1203 = _865 + 28;
                uint _1205 = uint(int(uint(_1203) >> uint(2)));
                _39[int(_1205)] = as_type<uint>(_1153);
                int _1207 = _865 + 32;
                uint _1209 = uint(int(uint(_1207) >> uint(2)));
                _39[int(_1209)] = as_type<uint>(_1169);
                int _1211 = _865 + 36;
                uint _1213 = uint(int(uint(_1211) >> uint(2)));
                _39[int(_1213)] = as_type<uint>(_1171);
                int _1215 = _865 + 40;
                uint _1217 = uint(int(uint(_1215) >> uint(2)));
                _39[int(_1217)] = as_type<uint>(_1173);
                int _1219 = _865 + 44;
                uint _1221 = uint(int(uint(_1219) >> uint(2)));
                _39[int(_1221)] = as_type<uint>(_1175);
                _1015 = !_1067;
                _1013 = _1041;
                _997 = _1169;
                _983 = _1171;
                _987 = _1173;
                _991 = _1175;
            } while (_1015);
            _951 = _1115;
            _955 = _1117;
            _959 = _1165;
            _963 = _1125;
            _967 = _1137;
            _971 = _1139;
            _975 = _1163;
            _979 = _1153;
            _1223 = true;
        }
        else
        {
            _951 = 0.0;
            _955 = 0.0;
            _959 = 0.0;
            _963 = 0.0;
            _967 = 0.0;
            _971 = 0.0;
            _975 = 0.0;
            _979 = 0.0;
            _997 = 0.0;
            _983 = 0.0;
            _987 = 0.0;
            _991 = 0.0;
        }
    }
    _1223 = false;
    float _1225 = _951;
    float _1227 = _955;
    float _1229 = _959;
    float _1231 = _963;
    float _1233 = _967;
    float _1235 = _971;
    float _1237 = _975;
    float _1239 = _979;
    float _1241 = _997;
    float _1243 = _983;
    float _1245 = _987;
    float _1247 = _991;
    int _1249 = _893 + 80;
    uint _1251 = uint(int(uint(_1249) >> uint(2)));
    uint _1253 = uint(int(uint(int(_1251)) >> uint(2)));
    int _1255 = int(_1251) & 3;
    float _1257 = (*spvDescriptorSet0.cp_c6)._m0[int(_1253)][_1255];
    int _1259 = int(_1251) + 1;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    int _1263 = _1259 & 3;
    float _1265 = (*spvDescriptorSet0.cp_c6)._m0[int(_1261)][_1263];
    bool _1267 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1269 = _893 + 64;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    uint _1273 = uint(int(uint(int(_1271)) >> uint(2)));
    int _1275 = int(_1271) & 3;
    float _1277 = (*spvDescriptorSet0.cp_c6)._m0[int(_1273)][_1275];
    int _1279 = int(_1271) + 1;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    int _1283 = _1279 & 3;
    float _1285 = (*spvDescriptorSet0.cp_c6)._m0[int(_1281)][_1283];
    int _1287 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1289 = _1287 + _68;
    int _1291 = _893 + 88;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    uint _1295 = uint(int(uint(int(_1293)) >> uint(2)));
    int _1297 = int(_1293) & 3;
    float _1299 = (*spvDescriptorSet0.cp_c6)._m0[int(_1295)][_1297];
    int _1301 = int(_1293) + 1;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    int _1305 = _1301 & 3;
    float _1307 = (*spvDescriptorSet0.cp_c6)._m0[int(_1303)][_1305];
    int _1309 = _893 + 72;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    uint _1313 = uint(int(uint(int(_1311)) >> uint(2)));
    int _1315 = int(_1311) & 3;
    float _1317 = (*spvDescriptorSet0.cp_c6)._m0[int(_1313)][_1315];
    int _1319 = int(_1311) + 1;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    int _1323 = _1319 & 3;
    float _1325 = (*spvDescriptorSet0.cp_c6)._m0[int(_1321)][_1323];
    int _1327 = _893 + 96;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.cp_c6)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.cp_c6)._m0[int(_1339)][_1341];
    int _1345 = _893 + 104;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
    int _1351 = int(_1347) & 3;
    float _1353 = (*spvDescriptorSet0.cp_c6)._m0[int(_1349)][_1351];
    int _1355 = int(_1347) + 1;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    int _1359 = _1355 & 3;
    float _1361 = (*spvDescriptorSet0.cp_c6)._m0[int(_1357)][_1359];
    int _1363 = _893 + 16;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.cp_c6)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.cp_c6)._m0[int(_1375)][_1377];
    if (!_1267)
    {
        uint _1381 = uint(int(uint(_865) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1381)] = as_type<uint>(_1225);
        int _1383 = _865 + 4;
        uint _1385 = uint(int(uint(_1383) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1385)] = as_type<uint>(_1227);
        int _1387 = _865 + 8;
        uint _1389 = uint(int(uint(_1387) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1389)] = as_type<uint>(_1229);
        int _1391 = _865 + 12;
        uint _1393 = uint(int(uint(_1391) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1393)] = as_type<uint>(_1231);
        uint _1395 = uint(int(uint(_895) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1395)] = as_type<uint>(_1233);
        int _1397 = _895 + 4;
        uint _1399 = uint(int(uint(_1397) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1399)] = as_type<uint>(_1235);
        int _1401 = _895 + 8;
        uint _1403 = uint(int(uint(_1401) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1403)] = as_type<uint>(_1237);
        int _1405 = _895 + 12;
        uint _1407 = uint(int(uint(_1405) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1407)] = as_type<uint>(_1239);
        uint _1409 = uint(int(uint(_913) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1409)] = as_type<uint>(_1241);
        int _1411 = _913 + 4;
        uint _1413 = uint(int(uint(_1411) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1413)] = as_type<uint>(_1243);
        int _1415 = _913 + 8;
        uint _1417 = uint(int(uint(_1415) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1417)] = as_type<uint>(_1245);
        int _1419 = _913 + 12;
        uint _1421 = uint(int(uint(_1419) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1421)] = as_type<uint>(_1247);
    }
    float _1423 = _1235 * _1257;
    float _1425 = _1243 * _1257;
    int _1427 = _893 + 32;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.cp_c6)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.cp_c6)._m0[int(_1439)][_1441];
    float _1445 = _1227 * _1307;
    float _1447 = fma(_1233, _1277, _1423);
    float _1449 = fma(_1241, _1277, _1425);
    float _1451 = _1227 * _1265;
    float _1453 = _1235 * _1265;
    float _1455 = _1243 * _1265;
    float _1457 = _1227 * _1257;
    int _1459 = _893 + 48;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.cp_c6)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.cp_c6)._m0[int(_1471)][_1473];
    float _1477 = fma(_1225, _1285, _1451);
    float _1479 = fma(_1233, _1285, _1453);
    float _1481 = fma(_1241, _1285, _1455);
    float _1483 = _1235 * _1299;
    float _1485 = _1243 * _1299;
    float _1487 = _1227 * _1299;
    float _1489 = _1235 * _1307;
    float _1491 = _1243 * _1307;
    int _1493 = _893 + 24;
    uint _1495 = uint(int(uint(_1493) >> uint(2)));
    uint _1497 = uint(int(uint(int(_1495)) >> uint(2)));
    int _1499 = int(_1495) & 3;
    float _1501 = (*spvDescriptorSet0.cp_c6)._m0[int(_1497)][_1499];
    int _1503 = int(_1495) + 1;
    uint _1505 = uint(int(uint(_1503) >> uint(2)));
    int _1507 = _1503 & 3;
    float _1509 = (*spvDescriptorSet0.cp_c6)._m0[int(_1505)][_1507];
    float _1511 = fma(_1225, _1317, _1487);
    float _1513 = fma(_1225, _1325, _1445);
    float _1515 = fma(_1233, _1317, _1483);
    float _1517 = fma(_1233, _1325, _1489);
    float _1519 = fma(_1241, _1317, _1485);
    float _1521 = fma(_1241, _1325, _1491);
    float _1523 = fma(_1225, _1277, _1457);
    int _1525 = _893 + 40;
    uint _1527 = uint(int(uint(_1525) >> uint(2)));
    uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
    int _1531 = int(_1527) & 3;
    float _1533 = (*spvDescriptorSet0.cp_c6)._m0[int(_1529)][_1531];
    int _1535 = int(_1527) + 1;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    int _1539 = _1535 & 3;
    float _1541 = (*spvDescriptorSet0.cp_c6)._m0[int(_1537)][_1539];
    float _1543 = fma(_1229, _1343, _1477);
    float _1545 = fma(_1229, _1353, _1511);
    float _1547 = fma(_1229, _1335, _1523);
    float _1549 = fma(_1229, _1361, _1513);
    float _1551 = fma(_1237, _1335, _1447);
    float _1553 = fma(_1237, _1343, _1479);
    float _1555 = fma(_1237, _1353, _1515);
    int _1557 = _893 + 56;
    uint _1559 = uint(int(uint(_1557) >> uint(2)));
    uint _1561 = uint(int(uint(int(_1559)) >> uint(2)));
    int _1563 = int(_1559) & 3;
    float _1565 = (*spvDescriptorSet0.cp_c6)._m0[int(_1561)][_1563];
    int _1567 = int(_1559) + 1;
    uint _1569 = uint(int(uint(_1567) >> uint(2)));
    int _1571 = _1567 & 3;
    float _1573 = (*spvDescriptorSet0.cp_c6)._m0[int(_1569)][_1571];
    float _1575 = fma(_1237, _1361, _1517);
    float _1577 = fma(_1245, _1361, _1521);
    float _1579 = _1549 + _1231;
    float _1581 = fma(_1245, _1343, _1481);
    float _1583 = _1575 + _1239;
    float _1585 = fma(_1245, _1335, _1449);
    float _1587 = fma(_1245, _1353, _1519);
    float _1589 = _1577 + _1247;
    float _1591 = _1583 * _1379;
    float _1593 = _1553 * _1379;
    float _1595 = _1551 * _1379;
    float _1597 = _1555 * _1379;
    float _1599 = fma(_1579, _1371, _1591);
    float _1601 = fma(_1543, _1371, _1593);
    float _1603 = _1583 * _1443;
    float _1605 = _1553 * _1443;
    float _1607 = _1551 * _1443;
    float _1609 = _1555 * _1443;
    float _1611 = fma(_1579, _1435, _1603);
    int _1613 = _1289 * 48;
    float _1615 = fma(_1547, _1371, _1595);
    float _1617 = fma(_1545, _1371, _1597);
    float _1619 = _1583 * _1475;
    float _1621 = _1553 * _1475;
    float _1623 = _1551 * _1475;
    float _1625 = _1555 * _1475;
    float _1627 = fma(_1579, _1467, _1619);
    float _1629 = fma(_1547, _1435, _1607);
    float _1631 = fma(_1543, _1435, _1605);
    float _1633 = fma(_1543, _1467, _1621);
    float _1635 = fma(_1545, _1435, _1609);
    float _1637 = fma(_1589, _1501, _1599);
    float _1639 = fma(_1547, _1467, _1623);
    float _1641 = fma(_1545, _1467, _1625);
    float _1643 = fma(_1581, _1501, _1601);
    float _1645 = fma(_1585, _1501, _1615);
    float _1647 = fma(_1587, _1501, _1617);
    float _1649 = _1637 + _1509;
    int _1651 = _1613 + 16;
    float _1653 = fma(_1589, _1533, _1611);
    float _1655 = fma(_1585, _1533, _1629);
    float _1657 = fma(_1581, _1533, _1631);
    float _1659 = fma(_1587, _1533, _1635);
    float _1661 = _1653 + _1541;
    uint _1663 = uint(int(uint(_1651) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1663)] = as_type<uint>(_1645);
    int _1665 = _1651 + 4;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1667)] = as_type<uint>(_1643);
    int _1669 = _1651 + 8;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1671)] = as_type<uint>(_1647);
    int _1673 = _1651 + 12;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1675)] = as_type<uint>(_1649);
    float _1677 = fma(_1589, _1565, _1627);
    float _1679 = fma(_1581, _1565, _1633);
    int _1681 = _1613 + 32;
    float _1683 = fma(_1585, _1565, _1639);
    float _1685 = fma(_1587, _1565, _1641);
    float _1687 = _1677 + _1573;
    int _1689 = _1613 + 48;
    uint _1691 = uint(int(uint(_1681) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1691)] = as_type<uint>(_1655);
    int _1693 = _1681 + 4;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1695)] = as_type<uint>(_1657);
    int _1697 = _1681 + 8;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1699)] = as_type<uint>(_1659);
    int _1701 = _1681 + 12;
    uint _1703 = uint(int(uint(_1701) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1703)] = as_type<uint>(_1661);
    uint _1705 = uint(int(uint(_1689) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1705)] = as_type<uint>(_1683);
    int _1707 = _1689 + 4;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1709)] = as_type<uint>(_1679);
    int _1711 = _1689 + 8;
    uint _1713 = uint(int(uint(_1711) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1713)] = as_type<uint>(_1685);
    int _1715 = _1689 + 12;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1717)] = as_type<uint>(_1687);
}

