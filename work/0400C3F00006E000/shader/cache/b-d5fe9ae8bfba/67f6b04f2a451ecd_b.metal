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
int _56(thread const int& _4460, thread const int& _4461, constant _10& support_buffer)
{
    int _4464 = 1 + _4461;
    float _4466 = support_buffer._m5[_4464].x;
    bool _4468 = _4466 == 1.0;
    if (_4468)
    {
        return _4460;
    }
    float _4470 = float(_4460);
    float _4472 = _4470 * _4466;
    int _4474 = int(_4472);
    return _4474;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1345 = false;
    bool _895 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _72 = _62;
    if (_70)
    {
        return;
    }
    int _74 = _66 & 31;
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
    int _99 = _78 ? _91 : _97;
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _99 & as_type<int>(_111);
    bool _115 = _113 != 0;
    float _117 = 0.0;
    float _119 = 0.0;
    if (!_115)
    {
        _117 = 0.0;
        _119 = 0.0;
    }
    float _121 = _117;
    float _123 = _119;
    float _125 = 0.0;
    float _127 = _121;
    float _129 = _123;
    if (!_115)
    {
        _125 = 0.0;
    }
    float _131 = _125;
    float _133 = 0.0;
    float _135 = 0.0;
    float _137 = _131;
    if (!_115)
    {
        _133 = 0.0;
        _135 = 0.0;
    }
    float _139 = _133;
    float _141 = _135;
    float _143 = 0.0;
    float _145 = _139;
    float _147 = _141;
    if (!_115)
    {
        _143 = 0.0;
    }
    float _149 = _143;
    float _151 = 0.0;
    float _153 = _149;
    if (!_115)
    {
        _151 = 0.0;
    }
    float _155 = _151;
    float _157 = 0.0;
    float _159 = _155;
    if (!_115)
    {
        _157 = 0.0;
    }
    float _161 = _157;
    float _163 = _161;
    if (!_115)
    {
        _72 = 0.0;
    }
    float _165 = _72;
    bool _167 = !_115;
    float _169 = _165;
    if (!_167)
    {
        uint _171 = uint(int(uint(_101) >> uint(2)));
        uint _173 = uint(int(uint(int(_171)) >> uint(2)));
        int _175 = int(_171) & 3;
        float _177 = (*spvDescriptorSet0.cp_c5)._m0[int(_173)][_175];
        int _179 = int(_171) + 1;
        uint _181 = uint(int(uint(_179) >> uint(2)));
        int _183 = _179 & 3;
        float _185 = (*spvDescriptorSet0.cp_c5)._m0[int(_181)][_183];
        int _187 = _66;
        int _189 = 0;
        int _191 = _56(_187, _189, (*spvDescriptorSet0.support_buffer));
        int _193 = as_type<int>(_177);
        int _195 = 0;
        int _197 = _56(_193, _195, (*spvDescriptorSet0.support_buffer));
        int3 _1982 = int3(_191, _197, 1);
        float3 _201 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1982.xy), uint(_1982.z), 0).xyz;
        float _203 = _201.x;
        float _205 = _201.y;
        float _207 = _201.z;
        int _209 = _66;
        int _211 = 0;
        int _213 = _56(_209, _211, (*spvDescriptorSet0.support_buffer));
        int _215 = as_type<int>(_185);
        int _217 = 0;
        int _219 = _56(_215, _217, (*spvDescriptorSet0.support_buffer));
        int3 _2000 = int3(_213, _219, 1);
        float3 _221 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2000.xy), uint(_2000.z), 0).xyz;
        float _223 = _221.x;
        float _225 = _221.y;
        float _227 = _221.z;
        int _229 = _66;
        int _231 = 0;
        int _233 = _56(_229, _231, (*spvDescriptorSet0.support_buffer));
        int _235 = as_type<int>(_177);
        int _237 = 0;
        int _239 = _56(_235, _237, (*spvDescriptorSet0.support_buffer));
        int3 _2018 = int3(_233, _239, 0);
        float3 _241 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2018.xy), uint(_2018.z), 0).xyz;
        float _243 = _241.x;
        float _245 = _241.y;
        float _247 = _241.z;
        int _249 = _66;
        int _251 = 0;
        int _253 = _56(_249, _251, (*spvDescriptorSet0.support_buffer));
        int _255 = as_type<int>(_185);
        int _257 = 0;
        int _259 = _56(_255, _257, (*spvDescriptorSet0.support_buffer));
        int3 _2036 = int3(_253, _259, 0);
        float3 _261 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2036.xy), uint(_2036.z), 0).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        int _269 = _66;
        int _271 = 0;
        int _273 = _56(_269, _271, (*spvDescriptorSet0.support_buffer));
        int _275 = as_type<int>(_177);
        int _277 = 0;
        int _279 = _56(_275, _277, (*spvDescriptorSet0.support_buffer));
        int3 _2054 = int3(_273, _279, 2);
        float3 _281 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2054.xy), uint(_2054.z), 0).xyz;
        float _283 = _281.x;
        float _285 = _281.y;
        float _287 = _281.z;
        int _289 = _66;
        int _291 = 0;
        int _293 = _56(_289, _291, (*spvDescriptorSet0.support_buffer));
        int _295 = as_type<int>(_185);
        int _297 = 0;
        int _299 = _56(_295, _297, (*spvDescriptorSet0.support_buffer));
        int3 _2072 = int3(_293, _299, 2);
        float3 _301 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2072.xy), uint(_2072.z), 0).xyz;
        float _303 = _301.x;
        float _305 = _301.y;
        float _307 = _301.z;
        int _309 = _101 + 16;
        uint _311 = uint(int(uint(_309) >> uint(2)));
        uint _313 = uint(int(uint(int(_311)) >> uint(2)));
        int _315 = int(_311) & 3;
        float _317 = (*spvDescriptorSet0.cp_c5)._m0[int(_313)][_315];
        float _319 = -_203;
        float _321 = _319 + _223;
        float _323 = -_207;
        float _325 = _323 + _227;
        float _327 = -_245;
        float _329 = _327 + _265;
        float _331 = -_247;
        float _333 = _331 + _267;
        float _335 = fma(_321, _317, _203);
        float _337 = fma(_325, _317, _207);
        float _339 = -_205;
        float _341 = _339 + _225;
        float _343 = -_243;
        float _345 = _343 + _263;
        float _347 = -_283;
        float _349 = _347 + _303;
        float _351 = -_285;
        float _353 = _351 + _305;
        float _355 = -_287;
        float _357 = _355 + _307;
        float _359 = fma(_329, _317, _245);
        float _361 = fma(_333, _317, _247);
        float _363 = fma(_341, _317, _205);
        float _365 = fma(_345, _317, _243);
        float _367 = fma(_349, _317, _283);
        float _369 = fma(_353, _317, _285);
        float _371 = fma(_357, _317, _287);
        _145 = _335;
        _169 = _337;
        _147 = _363;
        _163 = _371;
        _153 = _367;
        _127 = _365;
        _129 = _361;
        _159 = _369;
        _137 = _359;
    }
    float _373 = _145;
    float _375 = _169;
    float _377 = _147;
    float _379 = _163;
    float _381 = _153;
    float _383 = _127;
    float _385 = _129;
    float _387 = _159;
    float _389 = _137;
    int _391 = _101 + 36;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    uint _395 = uint(int(uint(int(_393)) >> uint(2)));
    int _397 = int(_393) & 3;
    float _399 = (*spvDescriptorSet0.cp_c5)._m0[int(_395)][_397];
    int _401 = _99 & as_type<int>(_399);
    bool _403 = _401 != 0;
    bool _405 = !_403;
    float _407 = _383;
    int _409 = as_type<int>(_381);
    int _411 = as_type<int>(_387);
    int _413 = as_type<int>(_379);
    float _415 = _389;
    float _417 = _385;
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
    float _891;
    float _893;
    if (!_405)
    {
        int _419 = _101 + 8;
        uint _421 = uint(int(uint(_419) >> uint(2)));
        uint _423 = uint(int(uint(int(_421)) >> uint(2)));
        int _425 = int(_421) & 3;
        float _427 = (*spvDescriptorSet0.cp_c5)._m0[int(_423)][_425];
        int _429 = int(_421) + 1;
        uint _431 = uint(int(uint(_429) >> uint(2)));
        int _433 = _429 & 3;
        float _435 = (*spvDescriptorSet0.cp_c5)._m0[int(_431)][_433];
        int _437 = _66;
        int _439 = 1;
        int _441 = _56(_437, _439, (*spvDescriptorSet0.support_buffer));
        int _443 = as_type<int>(_427);
        int _445 = 1;
        int _447 = _56(_443, _445, (*spvDescriptorSet0.support_buffer));
        int3 _2278 = int3(_441, _447, 1);
        float3 _449 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2278.xy), uint(_2278.z), 0).xyz;
        float _451 = _449.x;
        float _453 = _449.y;
        float _455 = _449.z;
        int _457 = _66;
        int _459 = 1;
        int _461 = _56(_457, _459, (*spvDescriptorSet0.support_buffer));
        int _463 = as_type<int>(_435);
        int _465 = 1;
        int _467 = _56(_463, _465, (*spvDescriptorSet0.support_buffer));
        int3 _2296 = int3(_461, _467, 1);
        float3 _469 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2296.xy), uint(_2296.z), 0).xyz;
        float _471 = _469.x;
        float _473 = _469.y;
        float _475 = _469.z;
        int _477 = _66;
        int _479 = 1;
        int _481 = _56(_477, _479, (*spvDescriptorSet0.support_buffer));
        int _483 = as_type<int>(_427);
        int _485 = 1;
        int _487 = _56(_483, _485, (*spvDescriptorSet0.support_buffer));
        int3 _2314 = int3(_481, _487, 0);
        float3 _489 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2314.xy), uint(_2314.z), 0).xyz;
        float _491 = _489.x;
        float _493 = _489.y;
        float _495 = _489.z;
        int _497 = _66;
        int _499 = 1;
        int _501 = _56(_497, _499, (*spvDescriptorSet0.support_buffer));
        int _503 = as_type<int>(_435);
        int _505 = 1;
        int _507 = _56(_503, _505, (*spvDescriptorSet0.support_buffer));
        int3 _2332 = int3(_501, _507, 0);
        float3 _509 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2332.xy), uint(_2332.z), 0).xyz;
        float _511 = _509.x;
        float _513 = _509.y;
        float _515 = _509.z;
        int _517 = _66;
        int _519 = 1;
        int _521 = _56(_517, _519, (*spvDescriptorSet0.support_buffer));
        int _523 = as_type<int>(_427);
        int _525 = 1;
        int _527 = _56(_523, _525, (*spvDescriptorSet0.support_buffer));
        int3 _2350 = int3(_521, _527, 2);
        float3 _529 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2350.xy), uint(_2350.z), 0).xyz;
        float _531 = _529.x;
        float _533 = _529.y;
        float _535 = _529.z;
        int _537 = _66;
        int _539 = 1;
        int _541 = _56(_537, _539, (*spvDescriptorSet0.support_buffer));
        int _543 = as_type<int>(_435);
        int _545 = 1;
        int _547 = _56(_543, _545, (*spvDescriptorSet0.support_buffer));
        int3 _2368 = int3(_541, _547, 2);
        float3 _549 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2368.xy), uint(_2368.z), 0).xyz;
        float _551 = _549.x;
        float _553 = _549.y;
        float _555 = _549.z;
        float _557 = _373 * 0.15915493667125701904296875;
        float _559 = _375 * 0.15915493667125701904296875;
        float _561 = _377 * 0.15915493667125701904296875;
        int _563 = _101 + 24;
        uint _565 = uint(int(uint(_563) >> uint(2)));
        uint _567 = uint(int(uint(int(_565)) >> uint(2)));
        int _569 = int(_565) & 3;
        float _571 = (*spvDescriptorSet0.cp_c5)._m0[int(_567)][_569];
        int _573 = int(_565) + 1;
        uint _575 = uint(int(uint(_573) >> uint(2)));
        int _577 = _573 & 3;
        float _579 = (*spvDescriptorSet0.cp_c5)._m0[int(_575)][_577];
        float _581 = _557 * 6.283185482025146484375;
        float _583 = cos(_581);
        int _585 = _101 + 20;
        uint _587 = uint(int(uint(_585) >> uint(2)));
        uint _589 = uint(int(uint(int(_587)) >> uint(2)));
        int _591 = int(_587) & 3;
        float _593 = (*spvDescriptorSet0.cp_c5)._m0[int(_589)][_591];
        float _595 = _559 * 6.283185482025146484375;
        float _597 = sin(_595);
        float _599 = _559 * 6.283185482025146484375;
        float _601 = cos(_599);
        float _603 = _561 * 6.283185482025146484375;
        float _605 = cos(_603);
        float _607 = _597 * _583;
        float _609 = _557 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _583 * _601;
        float _615 = _561 * 6.283185482025146484375;
        float _617 = sin(_615);
        float _619 = _583 * _605;
        float _621 = _605 * _601;
        float _623 = _597 * _605;
        float _625 = _611 * _601;
        float _627 = _611 * _597;
        float _629 = _611 * _605;
        float _631 = _611 * _617;
        float _633 = -_625;
        float _635 = fma(_617, _607, _633);
        float _637 = fma(_617, _613, _627);
        float _639 = _617 * _593;
        float _641 = -_607;
        float _643 = fma(_601, _631, _641);
        float _645 = fma(_597, _631, _613);
        float _647 = -_453;
        float _649 = _647 + _473;
        float _651 = -_455;
        float _653 = _651 + _475;
        float _655 = -_451;
        float _657 = _655 + _471;
        float _659 = -_495;
        float _661 = _659 + _515;
        float _663 = fma(_649, _571, _453);
        float _665 = fma(_653, _571, _455);
        float _667 = fma(_657, _571, _451);
        float _669 = -_535;
        float _671 = _669 + _555;
        float _673 = _663 * 0.15915493667125701904296875;
        float _675 = _665 * 0.15915493667125701904296875;
        float _677 = _667 * 0.15915493667125701904296875;
        float _679 = fma(_661, _571, _495);
        float _681 = _673 * 6.283185482025146484375;
        float _683 = cos(_681);
        float _685 = fma(_671, _571, _535);
        float _687 = _685 * _579;
        float _689 = _675 * 6.283185482025146484375;
        float _691 = sin(_689);
        float _693 = fma(_379, _593, _687);
        float _695 = _675 * 6.283185482025146484375;
        float _697 = cos(_695);
        float _699 = _677 * 6.283185482025146484375;
        float _701 = cos(_699);
        float _703 = _673 * 6.283185482025146484375;
        float _705 = sin(_703);
        float _707 = _683 * _697;
        float _709 = _707 * _579;
        float _711 = _677 * 6.283185482025146484375;
        float _713 = sin(_711);
        float _715 = _691 * _683;
        float _717 = _701 * _697;
        float _719 = _691 * _701;
        float _721 = _701 * _683;
        float _723 = _715 * _579;
        float _725 = fma(_621, _593, _709);
        float _727 = fma(_623, _593, _723);
        float _729 = _727 * _727;
        float _731 = _713 * _705;
        float _733 = _713 * _697;
        float _735 = _713 * _691;
        float _737 = _713 * _683;
        float _739 = -_719;
        float _741 = fma(_697, _731, _739);
        float _743 = fma(_691, _731, _717);
        float _745 = -_733;
        float _747 = fma(_705, _719, _745);
        float _749 = fma(_705, _717, _735);
        float _751 = -_705;
        float _753 = -_639;
        float _755 = fma(_751, _579, _753);
        float _757 = _743 * _579;
        float _759 = _747 * _579;
        float _761 = _741 * _579;
        float _763 = fma(_725, _725, _729);
        float _765 = fma(_645, _593, _757);
        float _767 = _749 * _579;
        float _769 = fma(_635, _593, _759);
        float _771 = _737 * _579;
        float _773 = fma(_643, _593, _761);
        float _775 = _765 * _765;
        float _777 = fma(_755, _755, _763);
        float _779 = _721 * _579;
        float _781 = fma(_637, _593, _767);
        float _783 = _769 * _769;
        float _785 = fma(_629, _593, _771);
        float _787 = fma(_773, _773, _775);
        float _789 = fma(_619, _593, _779);
        float _791 = fma(_781, _781, _783);
        float _793 = rsqrt(_777);
        float _795 = fma(_785, _785, _787);
        float _797 = -_531;
        float _799 = _797 + _551;
        float _801 = fma(_789, _789, _791);
        float _803 = -_491;
        float _805 = _803 + _511;
        float _807 = fma(_799, _571, _531);
        float _809 = rsqrt(_795);
        float _811 = fma(_805, _571, _491);
        float _813 = _807 * _579;
        float _815 = _811 * _579;
        float _817 = fma(_381, _593, _813);
        float _819 = rsqrt(_801);
        float _821 = _725 * _793;
        float _823 = _755 * _793;
        float _825 = -_493;
        float _827 = _825 + _513;
        float _829 = -_533;
        float _831 = _829 + _553;
        float _833 = _727 * _793;
        float _835 = fma(_383, _593, _815);
        float _837 = fma(_827, _571, _493);
        float _839 = fma(_831, _571, _533);
        float _841 = _773 * _809;
        float _843 = _765 * _809;
        float _845 = _785 * _809;
        float _847 = _679 * _579;
        float _849 = _839 * _579;
        float _851 = _781 * _819;
        float _853 = _769 * _819;
        float _855 = _789 * _819;
        float _857 = _837 * _579;
        float _859 = fma(_385, _593, _847);
        float _861 = fma(_387, _593, _849);
        float _863 = fma(_389, _593, _857);
        _407 = _835;
        _865 = _821;
        _867 = _833;
        _869 = _823;
        _871 = _863;
        _873 = _841;
        _875 = _843;
        _877 = _845;
        _879 = _859;
        _881 = _851;
        _883 = _853;
        _885 = _855;
        _409 = as_type<int>(_817);
        _411 = as_type<int>(_861);
        _413 = as_type<int>(_693);
        _887 = _813;
        _889 = _857;
        _891 = _849;
        _893 = _807;
        _895 = true;
    }
    else
    {
        float _897 = _375 * 0.15915493667125701904296875;
        float _899 = _373 * 0.15915493667125701904296875;
        float _901 = _377 * 0.15915493667125701904296875;
        float _903 = _897 * 6.283185482025146484375;
        float _905 = sin(_903);
        float _907 = _899 * 6.283185482025146484375;
        float _909 = sin(_907);
        float _911 = _899 * 6.283185482025146484375;
        float _913 = cos(_911);
        float _915 = _897 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _909 * _905;
        float _921 = _901 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = _905 * _913;
        float _927 = _901 * 6.283185482025146484375;
        float _929 = cos(_927);
        float _931 = _913 * _917;
        float _933 = _909 * _917;
        float _935 = _909 * _923;
        float _937 = -_925;
        float _939 = fma(_917, _935, _937);
        float _941 = _905 * _929;
        float _943 = fma(_905, _935, _931);
        float _945 = _913 * _929;
        float _947 = _929 * _917;
        float _949 = -_933;
        float _951 = fma(_923, _925, _949);
        float _953 = _909 * _929;
        float _955 = fma(_923, _931, _919);
        float _957 = -_923;
        float _959 = _957 + (-0.0);
        _865 = _947;
        _867 = _941;
        _869 = _959;
        _871 = _389;
        _873 = _939;
        _875 = _943;
        _877 = _953;
        _879 = _385;
        _881 = _955;
        _883 = _951;
        _885 = _945;
        _887 = _909;
        _889 = _923;
        _891 = _919;
        _893 = _917;
    }
    _895 = false;
    float _961 = _407;
    float _963 = _865;
    float _965 = _867;
    float _967 = _869;
    float _969 = _871;
    float _971 = _873;
    float _973 = _875;
    float _975 = _877;
    float _977 = _879;
    float _979 = _881;
    float _981 = _883;
    float _983 = _885;
    int _985 = _409;
    int _987 = _411;
    int _989 = _413;
    float _991 = _887;
    float _993 = _889;
    float _995 = _891;
    float _997 = _893;
    float _999 = _961 * _963;
    float _1001 = _961 * _965;
    float _1003 = _961 * _967;
    float _1005 = _969 * _971;
    float _1007 = _969 * _973;
    float _1009 = _969 * _975;
    int _1011 = _66 * 48;
    float _1013 = _977 * _979;
    float _1015 = _977 * _981;
    float _1017 = _977 * _983;
    bool _1019 = _66 != 0;
    uint _1021 = uint(int(uint(_1011) >> uint(2)));
    _37[int(_1021)] = as_type<uint>(_999);
    int _1023 = _1011 + 4;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    _37[int(_1025)] = as_type<uint>(_1005);
    int _1027 = _1011 + 8;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    _37[int(_1029)] = as_type<uint>(_1013);
    int _1031 = _1011 + 12;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    _37[int(_1033)] = uint(_985);
    int _1035 = _66 * 112;
    int _1037 = _1011 + 16;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    _37[int(_1039)] = as_type<uint>(_1001);
    int _1041 = _1011 + 20;
    uint _1043 = uint(int(uint(_1041) >> uint(2)));
    _37[int(_1043)] = as_type<uint>(_1007);
    int _1045 = _1011 + 24;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    _37[int(_1047)] = as_type<uint>(_1015);
    int _1049 = _1011 + 28;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    _37[int(_1051)] = uint(_987);
    int _1053 = _1011 + 32;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    _37[int(_1055)] = as_type<uint>(_1003);
    int _1057 = _1011 + 36;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    _37[int(_1059)] = as_type<uint>(_1009);
    int _1061 = _1011 + 40;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    _37[int(_1063)] = as_type<uint>(_1017);
    int _1065 = _1011 + 44;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    _37[int(_1067)] = uint(_989);
    float _1069 = _997;
    float _1071 = _995;
    float _1073 = _993;
    float _1075 = _961;
    float _1077 = _977;
    float _1079 = _991;
    float _1081 = _969;
    float _1083 = _1009;
    float _1085 = _1017;
    float _1087 = as_type<float>(_989);
    if (!_1019)
    {
        _1069 = _999;
    }
    float _1089 = _1069;
    float _1091 = _1089;
    if (!_1019)
    {
        _1071 = _1005;
    }
    float _1093 = _1071;
    float _1095 = _1093;
    if (!_1019)
    {
        _1073 = _1013;
    }
    float _1097 = _1073;
    float _1099 = _1097;
    if (!_1019)
    {
        _415 = as_type<float>(_985);
    }
    float _1101 = _415;
    float _1103 = _1101;
    if (!_1019)
    {
        _1075 = _1001;
    }
    float _1105 = _1075;
    float _1107 = _1105;
    if (!_1019)
    {
        _417 = _1007;
    }
    float _1109 = _417;
    float _1111 = _1109;
    if (!_1019)
    {
        _1077 = _1015;
    }
    float _1113 = _1077;
    float _1115 = _1113;
    if (!_1019)
    {
        _1079 = as_type<float>(_987);
    }
    float _1117 = _1079;
    float _1119 = _1117;
    if (!_1019)
    {
        _1081 = _1003;
    }
    float _1121 = _1081;
    bool _1123 = !_1019;
    float _1125 = _1121;
    if (!_1123)
    {
        bool _1127 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1129 = !_1127;
        if (!_1129)
        {
            uint _1131 = uint(int(uint(_1035) >> uint(2)));
            uint _1133 = uint(int(uint(int(_1131)) >> uint(2)));
            int _1135 = int(_1131) & 3;
            float _1137 = (*spvDescriptorSet0.cp_c6)._m0[int(_1133)][_1135];
            int _1139 = as_type<int>(_1137) * 48;
            int _1141 = 0;
            bool _1143;
            float _1239;
            float _1243;
            float _1247;
            float _1251;
            float _1265;
            float _1267;
            float _1279;
            float _1289;
            float _1291;
            float _1293;
            float _1295;
            float _1297;
            do
            {
                int _1145 = _1141;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1147 = uint(int(uint(_1139) >> uint(2)));
                float _1149 = as_type<float>(_37[int(_1147)]);
                int _1151 = _1139 + 4;
                uint _1153 = uint(int(uint(_1151) >> uint(2)));
                float _1155 = as_type<float>(_37[int(_1153)]);
                int _1157 = _1139 + 8;
                uint _1159 = uint(int(uint(_1157) >> uint(2)));
                float _1161 = as_type<float>(_37[int(_1159)]);
                int _1163 = _1139 + 12;
                uint _1165 = uint(int(uint(_1163) >> uint(2)));
                float _1167 = as_type<float>(_37[int(_1165)]);
                int _1169 = _1145 + 1;
                int _1171 = _1139 + 16;
                uint _1173 = uint(int(uint(_1171) >> uint(2)));
                float _1175 = as_type<float>(_37[int(_1173)]);
                int _1177 = _1139 + 20;
                uint _1179 = uint(int(uint(_1177) >> uint(2)));
                float _1181 = as_type<float>(_37[int(_1179)]);
                int _1183 = _1139 + 24;
                uint _1185 = uint(int(uint(_1183) >> uint(2)));
                float _1187 = as_type<float>(_37[int(_1185)]);
                int _1189 = _1139 + 28;
                uint _1191 = uint(int(uint(_1189) >> uint(2)));
                float _1193 = as_type<float>(_37[int(_1191)]);
                bool _1195 = uint(_1169) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1197 = _1139 + 32;
                uint _1199 = uint(int(uint(_1197) >> uint(2)));
                float _1201 = as_type<float>(_37[int(_1199)]);
                int _1203 = _1139 + 36;
                uint _1205 = uint(int(uint(_1203) >> uint(2)));
                float _1207 = as_type<float>(_37[int(_1205)]);
                int _1209 = _1139 + 40;
                uint _1211 = uint(int(uint(_1209) >> uint(2)));
                float _1213 = as_type<float>(_37[int(_1211)]);
                int _1215 = _1139 + 44;
                uint _1217 = uint(int(uint(_1215) >> uint(2)));
                float _1219 = as_type<float>(_37[int(_1217)]);
                float _1221 = _1155 * as_type<float>(_987);
                float _1223 = _1001 * _1155;
                float _1225 = _1007 * _1155;
                float _1227 = _1015 * _1155;
                float _1229 = fma(_1149, as_type<float>(_985), _1221);
                float _1231 = fma(_999, _1149, _1223);
                float _1233 = fma(_1005, _1149, _1225);
                float _1235 = fma(_1013, _1149, _1227);
                float _1237 = fma(_1161, as_type<float>(_989), _1229);
                _1239 = fma(_1003, _1161, _1231);
                float _1241 = _1001 * _1181;
                _1243 = fma(_1017, _1161, _1235);
                float _1245 = _1181 * as_type<float>(_987);
                _1247 = _1167 + _1237;
                float _1249 = _1007 * _1181;
                _1251 = fma(_1009, _1161, _1233);
                float _1253 = fma(_1175, as_type<float>(_985), _1245);
                float _1255 = fma(_999, _1175, _1241);
                float _1257 = fma(_1005, _1175, _1249);
                float _1259 = _1015 * _1181;
                float _1261 = fma(_1187, as_type<float>(_989), _1253);
                float _1263 = _1207 * as_type<float>(_987);
                _1265 = fma(_1003, _1187, _1255);
                _1267 = fma(_1009, _1187, _1257);
                float _1269 = _1001 * _1207;
                float _1271 = _1007 * _1207;
                float _1273 = _1015 * _1207;
                float _1275 = fma(_1201, as_type<float>(_985), _1263);
                float _1277 = fma(_1013, _1175, _1259);
                _1279 = _1193 + _1261;
                float _1281 = fma(_999, _1201, _1269);
                float _1283 = fma(_1005, _1201, _1271);
                float _1285 = fma(_1013, _1201, _1273);
                float _1287 = fma(_1213, as_type<float>(_989), _1275);
                _1289 = fma(_1017, _1187, _1277);
                _1291 = fma(_1003, _1213, _1281);
                _1293 = fma(_1009, _1213, _1283);
                _1295 = fma(_1017, _1213, _1285);
                _1297 = _1219 + _1287;
                uint _1299 = uint(int(uint(_1011) >> uint(2)));
                _37[int(_1299)] = as_type<uint>(_1239);
                int _1301 = _1011 + 4;
                uint _1303 = uint(int(uint(_1301) >> uint(2)));
                _37[int(_1303)] = as_type<uint>(_1251);
                int _1305 = _1011 + 8;
                uint _1307 = uint(int(uint(_1305) >> uint(2)));
                _37[int(_1307)] = as_type<uint>(_1243);
                int _1309 = _1011 + 12;
                uint _1311 = uint(int(uint(_1309) >> uint(2)));
                _37[int(_1311)] = as_type<uint>(_1247);
                int _1313 = _1011 + 16;
                uint _1315 = uint(int(uint(_1313) >> uint(2)));
                _37[int(_1315)] = as_type<uint>(_1265);
                int _1317 = _1011 + 20;
                uint _1319 = uint(int(uint(_1317) >> uint(2)));
                _37[int(_1319)] = as_type<uint>(_1267);
                int _1321 = _1011 + 24;
                uint _1323 = uint(int(uint(_1321) >> uint(2)));
                _37[int(_1323)] = as_type<uint>(_1289);
                int _1325 = _1011 + 28;
                uint _1327 = uint(int(uint(_1325) >> uint(2)));
                _37[int(_1327)] = as_type<uint>(_1279);
                int _1329 = _1011 + 32;
                uint _1331 = uint(int(uint(_1329) >> uint(2)));
                _37[int(_1331)] = as_type<uint>(_1291);
                int _1333 = _1011 + 36;
                uint _1335 = uint(int(uint(_1333) >> uint(2)));
                _37[int(_1335)] = as_type<uint>(_1293);
                int _1337 = _1011 + 40;
                uint _1339 = uint(int(uint(_1337) >> uint(2)));
                _37[int(_1339)] = as_type<uint>(_1295);
                int _1341 = _1011 + 44;
                uint _1343 = uint(int(uint(_1341) >> uint(2)));
                _37[int(_1343)] = as_type<uint>(_1297);
                _1143 = !_1195;
                _1141 = _1169;
            } while (_1143);
            _1083 = _1293;
            _1095 = _1251;
            _1111 = _1267;
            _1125 = _1291;
            _1091 = _1239;
            _1107 = _1265;
            _1115 = _1289;
            _1085 = _1295;
            _1099 = _1243;
            _1119 = _1279;
            _1103 = _1247;
            _1087 = _1297;
            _1345 = true;
        }
        else
        {
            _1083 = 0.0;
            _1095 = 0.0;
            _1111 = 0.0;
            _1125 = 0.0;
            _1091 = 0.0;
            _1107 = 0.0;
            _1115 = 0.0;
            _1085 = 0.0;
            _1099 = 0.0;
            _1119 = 0.0;
            _1103 = 0.0;
            _1087 = 0.0;
        }
    }
    _1345 = false;
    float _1347 = _1083;
    float _1349 = _1095;
    float _1351 = _1111;
    float _1353 = _1125;
    float _1355 = _1091;
    float _1357 = _1107;
    float _1359 = _1115;
    float _1361 = _1085;
    float _1363 = _1099;
    float _1365 = _1119;
    float _1367 = _1103;
    float _1369 = _1087;
    int _1371 = _1035 + 80;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.cp_c6)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.cp_c6)._m0[int(_1383)][_1385];
    int _1389 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1391 = _1389 + _66;
    int _1393 = _1035 + 64;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    uint _1397 = uint(int(uint(int(_1395)) >> uint(2)));
    int _1399 = int(_1395) & 3;
    float _1401 = (*spvDescriptorSet0.cp_c6)._m0[int(_1397)][_1399];
    int _1403 = int(_1395) + 1;
    uint _1405 = uint(int(uint(_1403) >> uint(2)));
    int _1407 = _1403 & 3;
    float _1409 = (*spvDescriptorSet0.cp_c6)._m0[int(_1405)][_1407];
    int _1411 = _1391 * 48;
    int _1413 = _1035 + 88;
    uint _1415 = uint(int(uint(_1413) >> uint(2)));
    uint _1417 = uint(int(uint(int(_1415)) >> uint(2)));
    int _1419 = int(_1415) & 3;
    float _1421 = (*spvDescriptorSet0.cp_c6)._m0[int(_1417)][_1419];
    int _1423 = int(_1415) + 1;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    int _1427 = _1423 & 3;
    float _1429 = (*spvDescriptorSet0.cp_c6)._m0[int(_1425)][_1427];
    int _1431 = _1035 + 72;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    uint _1435 = uint(int(uint(int(_1433)) >> uint(2)));
    int _1437 = int(_1433) & 3;
    float _1439 = (*spvDescriptorSet0.cp_c6)._m0[int(_1435)][_1437];
    int _1441 = int(_1433) + 1;
    uint _1443 = uint(int(uint(_1441) >> uint(2)));
    int _1445 = _1441 & 3;
    float _1447 = (*spvDescriptorSet0.cp_c6)._m0[int(_1443)][_1445];
    int _1449 = _1035 + 96;
    uint _1451 = uint(int(uint(_1449) >> uint(2)));
    uint _1453 = uint(int(uint(int(_1451)) >> uint(2)));
    int _1455 = int(_1451) & 3;
    float _1457 = (*spvDescriptorSet0.cp_c6)._m0[int(_1453)][_1455];
    int _1459 = int(_1451) + 1;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    int _1463 = _1459 & 3;
    float _1465 = (*spvDescriptorSet0.cp_c6)._m0[int(_1461)][_1463];
    int _1467 = _1035 + 104;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.cp_c6)._m0[int(_1471)][_1473];
    int _1477 = int(_1469) + 1;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    int _1481 = _1477 & 3;
    float _1483 = (*spvDescriptorSet0.cp_c6)._m0[int(_1479)][_1481];
    float _1485 = _1347 * _1379;
    int _1487 = _1035 + 16;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    uint _1491 = uint(int(uint(int(_1489)) >> uint(2)));
    int _1493 = int(_1489) & 3;
    float _1495 = (*spvDescriptorSet0.cp_c6)._m0[int(_1491)][_1493];
    int _1497 = int(_1489) + 1;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    int _1501 = _1497 & 3;
    float _1503 = (*spvDescriptorSet0.cp_c6)._m0[int(_1499)][_1501];
    float _1505 = _1349 * _1379;
    float _1507 = _1351 * _1379;
    float _1509 = _1351 * _1387;
    float _1511 = fma(_1353, _1401, _1485);
    float _1513 = _1347 * _1387;
    int _1515 = _1035 + 32;
    uint _1517 = uint(int(uint(_1515) >> uint(2)));
    uint _1519 = uint(int(uint(int(_1517)) >> uint(2)));
    int _1521 = int(_1517) & 3;
    float _1523 = (*spvDescriptorSet0.cp_c6)._m0[int(_1519)][_1521];
    int _1525 = int(_1517) + 1;
    uint _1527 = uint(int(uint(_1525) >> uint(2)));
    int _1529 = _1525 & 3;
    float _1531 = (*spvDescriptorSet0.cp_c6)._m0[int(_1527)][_1529];
    float _1533 = fma(_1355, _1401, _1505);
    float _1535 = fma(_1357, _1401, _1507);
    float _1537 = fma(_1357, _1409, _1509);
    float _1539 = _1349 * _1387;
    float _1541 = fma(_1353, _1409, _1513);
    float _1543 = _1349 * _1421;
    float _1545 = _1351 * _1421;
    int _1547 = _1035 + 48;
    uint _1549 = uint(int(uint(_1547) >> uint(2)));
    uint _1551 = uint(int(uint(int(_1549)) >> uint(2)));
    int _1553 = int(_1549) & 3;
    float _1555 = (*spvDescriptorSet0.cp_c6)._m0[int(_1551)][_1553];
    int _1557 = int(_1549) + 1;
    uint _1559 = uint(int(uint(_1557) >> uint(2)));
    int _1561 = _1557 & 3;
    float _1563 = (*spvDescriptorSet0.cp_c6)._m0[int(_1559)][_1561];
    float _1565 = _1349 * _1429;
    float _1567 = _1351 * _1429;
    float _1569 = _1347 * _1421;
    float _1571 = _1347 * _1429;
    float _1573 = fma(_1355, _1409, _1539);
    float _1575 = fma(_1357, _1439, _1545);
    float _1577 = fma(_1357, _1447, _1567);
    int _1579 = _1035 + 24;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.cp_c6)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.cp_c6)._m0[int(_1591)][_1593];
    float _1597 = fma(_1355, _1439, _1543);
    float _1599 = fma(_1355, _1447, _1565);
    float _1601 = fma(_1353, _1439, _1569);
    float _1603 = fma(_1353, _1447, _1571);
    float _1605 = fma(_1359, _1457, _1535);
    float _1607 = fma(_1359, _1465, _1537);
    int _1609 = _1035 + 40;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    uint _1613 = uint(int(uint(int(_1611)) >> uint(2)));
    int _1615 = int(_1611) & 3;
    float _1617 = (*spvDescriptorSet0.cp_c6)._m0[int(_1613)][_1615];
    int _1619 = int(_1611) + 1;
    uint _1621 = uint(int(uint(_1619) >> uint(2)));
    int _1623 = _1619 & 3;
    float _1625 = (*spvDescriptorSet0.cp_c6)._m0[int(_1621)][_1623];
    float _1627 = fma(_1361, _1457, _1511);
    float _1629 = fma(_1363, _1457, _1533);
    float _1631 = fma(_1363, _1465, _1573);
    float _1633 = fma(_1361, _1465, _1541);
    float _1635 = fma(_1359, _1475, _1575);
    float _1637 = fma(_1359, _1483, _1577);
    int _1639 = _1035 + 56;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    uint _1643 = uint(int(uint(int(_1641)) >> uint(2)));
    int _1645 = int(_1641) & 3;
    float _1647 = (*spvDescriptorSet0.cp_c6)._m0[int(_1643)][_1645];
    int _1649 = int(_1641) + 1;
    uint _1651 = uint(int(uint(_1649) >> uint(2)));
    int _1653 = _1649 & 3;
    float _1655 = (*spvDescriptorSet0.cp_c6)._m0[int(_1651)][_1653];
    float _1657 = fma(_1363, _1475, _1597);
    float _1659 = fma(_1363, _1483, _1599);
    float _1661 = _1637 + _1365;
    float _1663 = fma(_1361, _1483, _1603);
    float _1665 = fma(_1361, _1475, _1601);
    float _1667 = _1659 + _1367;
    float _1669 = _1661 * _1503;
    float _1671 = _1663 + _1369;
    float _1673 = _1605 * _1503;
    float _1675 = _1607 * _1503;
    float _1677 = fma(_1667, _1495, _1669);
    float _1679 = _1635 * _1503;
    float _1681 = fma(_1629, _1495, _1673);
    float _1683 = fma(_1631, _1495, _1675);
    float _1685 = _1605 * _1531;
    float _1687 = _1661 * _1531;
    float _1689 = _1607 * _1531;
    float _1691 = _1635 * _1531;
    float _1693 = fma(_1629, _1523, _1685);
    float _1695 = fma(_1667, _1523, _1687);
    float _1697 = fma(_1657, _1495, _1679);
    float _1699 = fma(_1657, _1523, _1691);
    float _1701 = _1605 * _1563;
    float _1703 = _1661 * _1563;
    float _1705 = _1607 * _1563;
    float _1707 = _1635 * _1563;
    float _1709 = fma(_1629, _1555, _1701);
    float _1711 = fma(_1667, _1555, _1703);
    float _1713 = fma(_1631, _1555, _1705);
    float _1715 = fma(_1657, _1555, _1707);
    float _1717 = fma(_1671, _1587, _1677);
    float _1719 = fma(_1631, _1523, _1689);
    float _1721 = fma(_1633, _1587, _1683);
    float _1723 = fma(_1627, _1587, _1681);
    float _1725 = _1717 + _1595;
    float _1727 = fma(_1665, _1587, _1697);
    float _1729 = fma(_1671, _1617, _1695);
    float _1731 = fma(_1627, _1617, _1693);
    float _1733 = fma(_1665, _1617, _1699);
    float _1735 = fma(_1633, _1617, _1719);
    float _1737 = _1729 + _1625;
    float _1739 = fma(_1671, _1647, _1711);
    float _1741 = fma(_1627, _1647, _1709);
    float _1743 = fma(_1633, _1647, _1713);
    float _1745 = fma(_1665, _1647, _1715);
    int _1747 = _1411 + 16;
    float _1749 = _1739 + _1655;
    int _1751 = _1411 + 32;
    int _1753 = _1411 + 48;
    uint _1755 = uint(int(uint(_1747) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1755)] = as_type<uint>(_1723);
    int _1757 = _1747 + 4;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1759)] = as_type<uint>(_1721);
    int _1761 = _1747 + 8;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1763)] = as_type<uint>(_1727);
    int _1765 = _1747 + 12;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1767)] = as_type<uint>(_1725);
    uint _1769 = uint(int(uint(_1751) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1769)] = as_type<uint>(_1731);
    int _1771 = _1751 + 4;
    uint _1773 = uint(int(uint(_1771) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1773)] = as_type<uint>(_1735);
    int _1775 = _1751 + 8;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1777)] = as_type<uint>(_1733);
    int _1779 = _1751 + 12;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1781)] = as_type<uint>(_1737);
    uint _1783 = uint(int(uint(_1753) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1783)] = as_type<uint>(_1741);
    int _1785 = _1753 + 4;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1787)] = as_type<uint>(_1743);
    int _1789 = _1753 + 8;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1791)] = as_type<uint>(_1745);
    int _1793 = _1753 + 12;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1795)] = as_type<uint>(_1749);
}

