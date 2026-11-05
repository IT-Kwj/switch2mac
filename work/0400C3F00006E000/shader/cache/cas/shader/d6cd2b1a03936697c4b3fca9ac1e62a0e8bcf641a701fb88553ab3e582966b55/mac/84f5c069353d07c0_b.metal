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
int _56(thread const int& _3539, thread const int& _3540, constant _10& support_buffer)
{
    int _3543 = 1 + _3540;
    float _3545 = support_buffer._m5[_3543].x;
    bool _3547 = _3545 == 1.0;
    if (_3547)
    {
        return _3539;
    }
    float _3549 = float(_3539);
    float _3551 = _3549 * _3545;
    int _3553 = int(_3551);
    return _3553;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _941 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.cp_c5)._m0[int(_77)][_79];
    int _83 = int(_75) + 1;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    int _87 = _83 & 3;
    float _89 = (*spvDescriptorSet0.cp_c5)._m0[int(_85)][_87];
    int _91 = _72 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    uint _95 = uint(int(uint(int(_93)) >> uint(2)));
    int _97 = int(_93) & 3;
    float _99 = (*spvDescriptorSet0.cp_c5)._m0[int(_95)][_97];
    int _101 = int(_93) + 1;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    int _105 = _101 & 3;
    float _107 = (*spvDescriptorSet0.cp_c5)._m0[int(_103)][_105];
    int _109 = _66;
    int _111 = 0;
    int _113 = _56(_109, _111, (*spvDescriptorSet0.support_buffer));
    int _115 = as_type<int>(_81);
    int _117 = 0;
    int _119 = _56(_115, _117, (*spvDescriptorSet0.support_buffer));
    int3 _1495 = int3(_113, _119, 0);
    float3 _123 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1495.xy), uint(_1495.z), 0).xyz;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    int _131 = _66;
    int _133 = 0;
    int _135 = _56(_131, _133, (*spvDescriptorSet0.support_buffer));
    int _137 = as_type<int>(_89);
    int _139 = 0;
    int _141 = _56(_137, _139, (*spvDescriptorSet0.support_buffer));
    int3 _1513 = int3(_135, _141, 0);
    float3 _143 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1513.xy), uint(_1513.z), 0).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    int _151 = _66;
    int _153 = 1;
    int _155 = _56(_151, _153, (*spvDescriptorSet0.support_buffer));
    int _157 = as_type<int>(_99);
    int _159 = 1;
    int _161 = _56(_157, _159, (*spvDescriptorSet0.support_buffer));
    int3 _1531 = int3(_155, _161, 0);
    float3 _163 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1531.xy), uint(_1531.z), 0).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    int _171 = _66;
    int _173 = 1;
    int _175 = _56(_171, _173, (*spvDescriptorSet0.support_buffer));
    int _177 = as_type<int>(_107);
    int _179 = 1;
    int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
    int3 _1549 = int3(_175, _181, 0);
    float3 _183 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1549.xy), uint(_1549.z), 0).xyz;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    int _191 = _66;
    int _193 = 0;
    int _195 = _56(_191, _193, (*spvDescriptorSet0.support_buffer));
    int _197 = as_type<int>(_81);
    int _199 = 0;
    int _201 = _56(_197, _199, (*spvDescriptorSet0.support_buffer));
    int3 _1567 = int3(_195, _201, 1);
    float3 _203 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1567.xy), uint(_1567.z), 0).xyz;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    int _211 = _66;
    int _213 = 0;
    int _215 = _56(_211, _213, (*spvDescriptorSet0.support_buffer));
    int _217 = as_type<int>(_89);
    int _219 = 0;
    int _221 = _56(_217, _219, (*spvDescriptorSet0.support_buffer));
    int3 _1585 = int3(_215, _221, 1);
    float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1585.xy), uint(_1585.z), 0).xyz;
    float _225 = _223.x;
    float _227 = _223.y;
    float _229 = _223.z;
    int _231 = _66;
    int _233 = 1;
    int _235 = _56(_231, _233, (*spvDescriptorSet0.support_buffer));
    int _237 = as_type<int>(_99);
    int _239 = 1;
    int _241 = _56(_237, _239, (*spvDescriptorSet0.support_buffer));
    int3 _1603 = int3(_235, _241, 1);
    float3 _243 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1603.xy), uint(_1603.z), 0).xyz;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    int _251 = _66;
    int _253 = 1;
    int _255 = _56(_251, _253, (*spvDescriptorSet0.support_buffer));
    int _257 = as_type<int>(_107);
    int _259 = 1;
    int _261 = _56(_257, _259, (*spvDescriptorSet0.support_buffer));
    int3 _1621 = int3(_255, _261, 1);
    float3 _263 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1621.xy), uint(_1621.z), 0).xyz;
    float _265 = _263.x;
    float _267 = _263.y;
    float _269 = _263.z;
    int _271 = _66;
    int _273 = 0;
    int _275 = _56(_271, _273, (*spvDescriptorSet0.support_buffer));
    int _277 = as_type<int>(_81);
    int _279 = 0;
    int _281 = _56(_277, _279, (*spvDescriptorSet0.support_buffer));
    int3 _1639 = int3(_275, _281, 2);
    float3 _283 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1639.xy), uint(_1639.z), 0).xyz;
    float _285 = _283.x;
    float _287 = _283.y;
    float _289 = _283.z;
    int _291 = _66;
    int _293 = 0;
    int _295 = _56(_291, _293, (*spvDescriptorSet0.support_buffer));
    int _297 = as_type<int>(_89);
    int _299 = 0;
    int _301 = _56(_297, _299, (*spvDescriptorSet0.support_buffer));
    int3 _1657 = int3(_295, _301, 2);
    float3 _303 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1657.xy), uint(_1657.z), 0).xyz;
    float _305 = _303.x;
    float _307 = _303.y;
    float _309 = _303.z;
    int _311 = _66;
    int _313 = 1;
    int _315 = _56(_311, _313, (*spvDescriptorSet0.support_buffer));
    int _317 = as_type<int>(_99);
    int _319 = 1;
    int _321 = _56(_317, _319, (*spvDescriptorSet0.support_buffer));
    int3 _1675 = int3(_315, _321, 2);
    float3 _323 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1675.xy), uint(_1675.z), 0).xyz;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    int _331 = _66;
    int _333 = 1;
    int _335 = _56(_331, _333, (*spvDescriptorSet0.support_buffer));
    int _337 = as_type<int>(_107);
    int _339 = 1;
    int _341 = _56(_337, _339, (*spvDescriptorSet0.support_buffer));
    int3 _1693 = int3(_335, _341, 2);
    float3 _343 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1693.xy), uint(_1693.z), 0).xyz;
    float _345 = _343.x;
    float _347 = _343.y;
    float _349 = _343.z;
    int _351 = _72 + 16;
    uint _353 = uint(int(uint(_351) >> uint(2)));
    uint _355 = uint(int(uint(int(_353)) >> uint(2)));
    int _357 = int(_353) & 3;
    float _359 = (*spvDescriptorSet0.cp_c5)._m0[int(_355)][_357];
    int _361 = int(_353) + 1;
    uint _363 = uint(int(uint(_361) >> uint(2)));
    int _365 = _361 & 3;
    float _367 = (*spvDescriptorSet0.cp_c5)._m0[int(_363)][_365];
    bool _369 = _66 != 0;
    int _371 = _72 + 24;
    uint _373 = uint(int(uint(_371) >> uint(2)));
    uint _375 = uint(int(uint(int(_373)) >> uint(2)));
    int _377 = int(_373) & 3;
    float _379 = (*spvDescriptorSet0.cp_c5)._m0[int(_375)][_377];
    int _381 = int(_373) + 1;
    uint _383 = uint(int(uint(_381) >> uint(2)));
    int _385 = _381 & 3;
    float _387 = (*spvDescriptorSet0.cp_c5)._m0[int(_383)][_385];
    float _389 = -_125;
    float _391 = _389 + _145;
    float _393 = -_127;
    float _395 = _393 + _147;
    float _397 = -_129;
    float _399 = _397 + _149;
    float _401 = fma(_391, _359, _125);
    float _403 = fma(_395, _359, _127);
    float _405 = fma(_399, _359, _129);
    float _407 = -_165;
    float _409 = _407 + _185;
    float _411 = -_167;
    float _413 = _411 + _187;
    float _415 = -_169;
    float _417 = _415 + _189;
    float _419 = -_209;
    float _421 = _419 + _229;
    float _423 = fma(_409, _379, _165);
    float _425 = fma(_413, _379, _167);
    float _427 = fma(_417, _379, _169);
    float _429 = -_249;
    float _431 = _429 + _269;
    float _433 = _423 * _387;
    float _435 = _425 * _387;
    float _437 = _427 * _387;
    float _439 = fma(_431, _379, _249);
    float _441 = fma(_401, _367, _433);
    float _443 = fma(_403, _367, _435);
    float _445 = fma(_405, _367, _437);
    float _447 = -_207;
    float _449 = _447 + _227;
    float _451 = -_205;
    float _453 = _451 + _225;
    float _455 = fma(_421, _359, _209);
    float _457 = fma(_449, _359, _207);
    float _459 = -_245;
    float _461 = _459 + _265;
    float _463 = fma(_453, _359, _205);
    float _465 = fma(_461, _379, _245);
    float _467 = _465 * _387;
    float _469 = fma(_463, _367, _467);
    float _471 = _469 * 0.15915493667125701904296875;
    float _473 = _439 * _387;
    float _475 = _471 * 6.283185482025146484375;
    float _477 = cos(_475);
    float _479 = fma(_455, _367, _473);
    float _481 = -_247;
    float _483 = _481 + _267;
    float _485 = _479 * 0.15915493667125701904296875;
    float _487 = fma(_483, _379, _247);
    float _489 = _471 * 6.283185482025146484375;
    float _491 = sin(_489);
    float _493 = _487 * _387;
    float _495 = fma(_457, _367, _493);
    float _497 = _485 * 6.283185482025146484375;
    float _499 = sin(_497);
    float _501 = _495 * 0.15915493667125701904296875;
    float _503 = _485 * 6.283185482025146484375;
    float _505 = cos(_503);
    float _507 = _501 * 6.283185482025146484375;
    float _509 = cos(_507);
    float _511 = _499 * _477;
    float _513 = _501 * 6.283185482025146484375;
    float _515 = sin(_513);
    float _517 = _477 * _505;
    float _519 = _491 * _505;
    float _521 = _477 * _509;
    float _523 = _491 * _499;
    float _525 = _509 * _441;
    float _527 = _491 * _509;
    float _529 = _491 * _515;
    float _531 = _515 * _441;
    float _533 = fma(_515, _517, _523);
    float _535 = -_519;
    float _537 = fma(_515, _511, _535);
    float _539 = -_511;
    float _541 = fma(_505, _529, _539);
    float _543 = fma(_499, _529, _517);
    float _545 = -_329;
    float _547 = _545 + _349;
    float _549 = -_325;
    float _551 = _549 + _345;
    float _553 = -_327;
    float _555 = _553 + _347;
    float _557 = _499 * _525;
    float _559 = _505 * _525;
    float _561 = _541 * _443;
    float _563 = _543 * _443;
    float _565 = -_285;
    float _567 = _565 + _305;
    float _569 = -_289;
    float _571 = _569 + _309;
    float _573 = fma(_547, _379, _329);
    float _575 = -_287;
    float _577 = _575 + _307;
    float _579 = fma(_551, _379, _325);
    float _581 = fma(_555, _379, _327);
    float _583 = _527 * _443;
    float _585 = _521 * _445;
    float _587 = _533 * _445;
    float _589 = _537 * _445;
    float _591 = fma(_567, _359, _285);
    float _593 = fma(_571, _359, _289);
    float _595 = _573 * _387;
    float _597 = fma(_577, _359, _287);
    float _599 = _579 * _387;
    float _601 = _581 * _387;
    float _603 = fma(_593, _367, _595);
    int _605 = _66 * 48;
    float _607 = -_531;
    float _609 = _607 + (-0.0);
    float _611 = fma(_591, _367, _599);
    float _613 = fma(_597, _367, _601);
    int _615 = _66 * 112;
    float _617 = _597;
    float _619 = _289;
    float _621 = _599;
    float _623 = _591;
    float _625 = _571;
    float _627 = _287;
    float _629 = _581;
    float _631 = _563;
    float _633 = _561;
    float _635 = _589;
    float _637 = _587;
    float _639 = _585;
    if (!_369)
    {
        _617 = _603;
    }
    float _641 = _617;
    int _643 = _605 + 32;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    _37[int(_645)] = as_type<uint>(_609);
    int _647 = _605 + 36;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    _37[int(_649)] = as_type<uint>(_583);
    int _651 = _605 + 40;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    _37[int(_653)] = as_type<uint>(_585);
    int _655 = _605 + 44;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    _37[int(_657)] = as_type<uint>(_603);
    float _659 = _641;
    if (!_369)
    {
        _619 = _611;
    }
    float _661 = _619;
    float _663 = _661;
    if (!_369)
    {
        _621 = _613;
    }
    float _665 = _621;
    uint _667 = uint(int(uint(_605) >> uint(2)));
    _37[int(_667)] = as_type<uint>(_559);
    int _669 = _605 + 4;
    uint _671 = uint(int(uint(_669) >> uint(2)));
    _37[int(_671)] = as_type<uint>(_561);
    int _673 = _605 + 8;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    _37[int(_675)] = as_type<uint>(_587);
    int _677 = _605 + 12;
    uint _679 = uint(int(uint(_677) >> uint(2)));
    _37[int(_679)] = as_type<uint>(_611);
    float _681 = _665;
    if (!_369)
    {
        _623 = _609;
    }
    float _683 = _623;
    float _685 = _683;
    if (!_369)
    {
        _625 = _559;
    }
    float _687 = _625;
    int _689 = _605 + 16;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    _37[int(_691)] = as_type<uint>(_557);
    int _693 = _605 + 20;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    _37[int(_695)] = as_type<uint>(_563);
    int _697 = _605 + 24;
    uint _699 = uint(int(uint(_697) >> uint(2)));
    _37[int(_699)] = as_type<uint>(_589);
    int _701 = _605 + 28;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    _37[int(_703)] = as_type<uint>(_613);
    float _705 = _687;
    if (!_369)
    {
        _627 = _557;
    }
    float _707 = _627;
    float _709 = _707;
    if (!_369)
    {
        _629 = _583;
    }
    float _711 = _629;
    bool _713 = !_369;
    float _715 = _711;
    if (!_713)
    {
        bool _717 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _719 = !_717;
        if (!_719)
        {
            uint _721 = uint(int(uint(_615) >> uint(2)));
            uint _723 = uint(int(uint(int(_721)) >> uint(2)));
            int _725 = int(_721) & 3;
            float _727 = (*spvDescriptorSet0.cp_c6)._m0[int(_723)][_725];
            int _729 = as_type<int>(_727) * 48;
            int _731 = 0;
            bool _733;
            float _831;
            float _837;
            float _839;
            float _841;
            float _859;
            float _863;
            float _865;
            float _867;
            float _887;
            float _889;
            float _891;
            float _893;
            do
            {
                int _735 = _731;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _737 = uint(int(uint(_729) >> uint(2)));
                float _739 = as_type<float>(_37[int(_737)]);
                int _741 = _729 + 4;
                uint _743 = uint(int(uint(_741) >> uint(2)));
                float _745 = as_type<float>(_37[int(_743)]);
                int _747 = _729 + 8;
                uint _749 = uint(int(uint(_747) >> uint(2)));
                float _751 = as_type<float>(_37[int(_749)]);
                int _753 = _729 + 12;
                uint _755 = uint(int(uint(_753) >> uint(2)));
                float _757 = as_type<float>(_37[int(_755)]);
                int _759 = _735 + 1;
                int _761 = _729 + 16;
                uint _763 = uint(int(uint(_761) >> uint(2)));
                float _765 = as_type<float>(_37[int(_763)]);
                int _767 = _729 + 20;
                uint _769 = uint(int(uint(_767) >> uint(2)));
                float _771 = as_type<float>(_37[int(_769)]);
                int _773 = _729 + 24;
                uint _775 = uint(int(uint(_773) >> uint(2)));
                float _777 = as_type<float>(_37[int(_775)]);
                int _779 = _729 + 28;
                uint _781 = uint(int(uint(_779) >> uint(2)));
                float _783 = as_type<float>(_37[int(_781)]);
                bool _785 = uint(_759) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _787 = _729 + 32;
                uint _789 = uint(int(uint(_787) >> uint(2)));
                float _791 = as_type<float>(_37[int(_789)]);
                int _793 = _729 + 36;
                uint _795 = uint(int(uint(_793) >> uint(2)));
                float _797 = as_type<float>(_37[int(_795)]);
                int _799 = _729 + 40;
                uint _801 = uint(int(uint(_799) >> uint(2)));
                float _803 = as_type<float>(_37[int(_801)]);
                int _805 = _729 + 44;
                uint _807 = uint(int(uint(_805) >> uint(2)));
                float _809 = as_type<float>(_37[int(_807)]);
                float _811 = _613 * _745;
                float _813 = _557 * _745;
                float _815 = _563 * _745;
                float _817 = _589 * _745;
                float _819 = fma(_611, _739, _811);
                float _821 = fma(_559, _739, _813);
                float _823 = fma(_561, _739, _815);
                float _825 = fma(_587, _739, _817);
                float _827 = fma(_603, _751, _819);
                float _829 = -_531;
                _831 = fma(_829, _751, _821);
                float _833 = _613 * _771;
                float _835 = _557 * _771;
                _837 = _757 + _827;
                _839 = fma(_583, _751, _823);
                _841 = fma(_585, _751, _825);
                float _843 = _563 * _771;
                float _845 = _589 * _771;
                float _847 = fma(_611, _765, _833);
                float _849 = fma(_559, _765, _835);
                float _851 = fma(_561, _765, _843);
                float _853 = fma(_587, _765, _845);
                float _855 = fma(_603, _777, _847);
                float _857 = -_531;
                _859 = fma(_857, _777, _849);
                float _861 = _613 * _797;
                _863 = fma(_583, _777, _851);
                _865 = fma(_585, _777, _853);
                _867 = _783 + _855;
                float _869 = _557 * _797;
                float _871 = _563 * _797;
                float _873 = _589 * _797;
                float _875 = fma(_611, _791, _861);
                float _877 = fma(_559, _791, _869);
                float _879 = fma(_561, _791, _871);
                float _881 = fma(_587, _791, _873);
                float _883 = fma(_603, _803, _875);
                float _885 = -_531;
                _887 = fma(_885, _803, _877);
                _889 = fma(_583, _803, _879);
                _891 = fma(_585, _803, _881);
                _893 = _809 + _883;
                uint _895 = uint(int(uint(_605) >> uint(2)));
                _37[int(_895)] = as_type<uint>(_831);
                int _897 = _605 + 4;
                uint _899 = uint(int(uint(_897) >> uint(2)));
                _37[int(_899)] = as_type<uint>(_839);
                int _901 = _605 + 8;
                uint _903 = uint(int(uint(_901) >> uint(2)));
                _37[int(_903)] = as_type<uint>(_841);
                int _905 = _605 + 12;
                uint _907 = uint(int(uint(_905) >> uint(2)));
                _37[int(_907)] = as_type<uint>(_837);
                int _909 = _605 + 16;
                uint _911 = uint(int(uint(_909) >> uint(2)));
                _37[int(_911)] = as_type<uint>(_859);
                int _913 = _605 + 20;
                uint _915 = uint(int(uint(_913) >> uint(2)));
                _37[int(_915)] = as_type<uint>(_863);
                int _917 = _605 + 24;
                uint _919 = uint(int(uint(_917) >> uint(2)));
                _37[int(_919)] = as_type<uint>(_865);
                int _921 = _605 + 28;
                uint _923 = uint(int(uint(_921) >> uint(2)));
                _37[int(_923)] = as_type<uint>(_867);
                int _925 = _605 + 32;
                uint _927 = uint(int(uint(_925) >> uint(2)));
                _37[int(_927)] = as_type<uint>(_887);
                int _929 = _605 + 36;
                uint _931 = uint(int(uint(_929) >> uint(2)));
                _37[int(_931)] = as_type<uint>(_889);
                int _933 = _605 + 40;
                uint _935 = uint(int(uint(_933) >> uint(2)));
                _37[int(_935)] = as_type<uint>(_891);
                int _937 = _605 + 44;
                uint _939 = uint(int(uint(_937) >> uint(2)));
                _37[int(_939)] = as_type<uint>(_893);
                _733 = !_785;
                _731 = _759;
            } while (_733);
            _631 = _863;
            _715 = _889;
            _633 = _839;
            _709 = _859;
            _685 = _887;
            _705 = _831;
            _635 = _865;
            _637 = _841;
            _639 = _891;
            _663 = _837;
            _681 = _867;
            _659 = _893;
            _941 = true;
        }
        else
        {
            _631 = 0.0;
            _715 = 0.0;
            _633 = 0.0;
            _709 = 0.0;
            _685 = 0.0;
            _705 = 0.0;
            _635 = 0.0;
            _637 = 0.0;
            _639 = 0.0;
            _663 = 0.0;
            _681 = 0.0;
            _659 = 0.0;
        }
    }
    _941 = false;
    float _943 = _631;
    float _945 = _715;
    float _947 = _633;
    float _949 = _709;
    float _951 = _685;
    float _953 = _705;
    float _955 = _635;
    float _957 = _637;
    float _959 = _639;
    float _961 = _663;
    float _963 = _681;
    float _965 = _659;
    int _967 = _615 + 80;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    uint _971 = uint(int(uint(int(_969)) >> uint(2)));
    int _973 = int(_969) & 3;
    float _975 = (*spvDescriptorSet0.cp_c6)._m0[int(_971)][_973];
    int _977 = int(_969) + 1;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    int _981 = _977 & 3;
    float _983 = (*spvDescriptorSet0.cp_c6)._m0[int(_979)][_981];
    int _985 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _987 = _985 + _66;
    int _989 = _615 + 64;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.cp_c6)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.cp_c6)._m0[int(_1001)][_1003];
    int _1007 = _987 * 48;
    int _1009 = _615 + 88;
    uint _1011 = uint(int(uint(_1009) >> uint(2)));
    uint _1013 = uint(int(uint(int(_1011)) >> uint(2)));
    int _1015 = int(_1011) & 3;
    float _1017 = (*spvDescriptorSet0.cp_c6)._m0[int(_1013)][_1015];
    int _1019 = int(_1011) + 1;
    uint _1021 = uint(int(uint(_1019) >> uint(2)));
    int _1023 = _1019 & 3;
    float _1025 = (*spvDescriptorSet0.cp_c6)._m0[int(_1021)][_1023];
    int _1027 = _615 + 72;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    uint _1031 = uint(int(uint(int(_1029)) >> uint(2)));
    int _1033 = int(_1029) & 3;
    float _1035 = (*spvDescriptorSet0.cp_c6)._m0[int(_1031)][_1033];
    int _1037 = int(_1029) + 1;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    int _1041 = _1037 & 3;
    float _1043 = (*spvDescriptorSet0.cp_c6)._m0[int(_1039)][_1041];
    int _1045 = _615 + 96;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    uint _1049 = uint(int(uint(int(_1047)) >> uint(2)));
    int _1051 = int(_1047) & 3;
    float _1053 = (*spvDescriptorSet0.cp_c6)._m0[int(_1049)][_1051];
    int _1055 = int(_1047) + 1;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    int _1059 = _1055 & 3;
    float _1061 = (*spvDescriptorSet0.cp_c6)._m0[int(_1057)][_1059];
    int _1063 = _615 + 104;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
    int _1069 = int(_1065) & 3;
    float _1071 = (*spvDescriptorSet0.cp_c6)._m0[int(_1067)][_1069];
    int _1073 = int(_1065) + 1;
    uint _1075 = uint(int(uint(_1073) >> uint(2)));
    int _1077 = _1073 & 3;
    float _1079 = (*spvDescriptorSet0.cp_c6)._m0[int(_1075)][_1077];
    float _1081 = _943 * _975;
    float _1083 = _945 * _975;
    int _1085 = _615 + 16;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    uint _1089 = uint(int(uint(int(_1087)) >> uint(2)));
    int _1091 = int(_1087) & 3;
    float _1093 = (*spvDescriptorSet0.cp_c6)._m0[int(_1089)][_1091];
    int _1095 = int(_1087) + 1;
    uint _1097 = uint(int(uint(_1095) >> uint(2)));
    int _1099 = _1095 & 3;
    float _1101 = (*spvDescriptorSet0.cp_c6)._m0[int(_1097)][_1099];
    float _1103 = _947 * _975;
    float _1105 = fma(_949, _997, _1081);
    float _1107 = fma(_951, _997, _1083);
    float _1109 = _943 * _983;
    float _1111 = _945 * _983;
    int _1113 = _615 + 32;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.cp_c6)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.cp_c6)._m0[int(_1125)][_1127];
    float _1131 = fma(_953, _997, _1103);
    float _1133 = fma(_949, _1005, _1109);
    float _1135 = fma(_951, _1005, _1111);
    float _1137 = _947 * _1017;
    float _1139 = _943 * _1017;
    float _1141 = _947 * _983;
    float _1143 = _947 * _1025;
    int _1145 = _615 + 48;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    uint _1149 = uint(int(uint(int(_1147)) >> uint(2)));
    int _1151 = int(_1147) & 3;
    float _1153 = (*spvDescriptorSet0.cp_c6)._m0[int(_1149)][_1151];
    int _1155 = int(_1147) + 1;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    int _1159 = _1155 & 3;
    float _1161 = (*spvDescriptorSet0.cp_c6)._m0[int(_1157)][_1159];
    float _1163 = _943 * _1025;
    float _1165 = _945 * _1017;
    float _1167 = _945 * _1025;
    float _1169 = fma(_953, _1005, _1141);
    float _1171 = fma(_953, _1035, _1137);
    float _1173 = fma(_953, _1043, _1143);
    float _1175 = fma(_949, _1035, _1139);
    int _1177 = _615 + 24;
    uint _1179 = uint(int(uint(_1177) >> uint(2)));
    uint _1181 = uint(int(uint(int(_1179)) >> uint(2)));
    int _1183 = int(_1179) & 3;
    float _1185 = (*spvDescriptorSet0.cp_c6)._m0[int(_1181)][_1183];
    int _1187 = int(_1179) + 1;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    int _1191 = _1187 & 3;
    float _1193 = (*spvDescriptorSet0.cp_c6)._m0[int(_1189)][_1191];
    float _1195 = fma(_949, _1043, _1163);
    float _1197 = fma(_951, _1035, _1165);
    float _1199 = fma(_951, _1043, _1167);
    float _1201 = fma(_955, _1053, _1105);
    float _1203 = fma(_957, _1053, _1131);
    float _1205 = fma(_957, _1061, _1169);
    float _1207 = fma(_955, _1061, _1133);
    int _1209 = _615 + 40;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    uint _1213 = uint(int(uint(int(_1211)) >> uint(2)));
    int _1215 = int(_1211) & 3;
    float _1217 = (*spvDescriptorSet0.cp_c6)._m0[int(_1213)][_1215];
    int _1219 = int(_1211) + 1;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    int _1223 = _1219 & 3;
    float _1225 = (*spvDescriptorSet0.cp_c6)._m0[int(_1221)][_1223];
    float _1227 = fma(_959, _1053, _1107);
    float _1229 = fma(_959, _1061, _1135);
    float _1231 = fma(_957, _1071, _1171);
    float _1233 = fma(_957, _1079, _1173);
    float _1235 = fma(_955, _1071, _1175);
    float _1237 = fma(_955, _1079, _1195);
    int _1239 = _615 + 56;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    uint _1243 = uint(int(uint(int(_1241)) >> uint(2)));
    int _1245 = int(_1241) & 3;
    float _1247 = (*spvDescriptorSet0.cp_c6)._m0[int(_1243)][_1245];
    int _1249 = int(_1241) + 1;
    uint _1251 = uint(int(uint(_1249) >> uint(2)));
    int _1253 = _1249 & 3;
    float _1255 = (*spvDescriptorSet0.cp_c6)._m0[int(_1251)][_1253];
    float _1257 = fma(_959, _1079, _1199);
    float _1259 = _1233 + _961;
    float _1261 = _1237 + _963;
    float _1263 = fma(_959, _1071, _1197);
    float _1265 = _1257 + _965;
    float _1267 = _1201 * _1101;
    float _1269 = _1261 * _1101;
    float _1271 = _1207 * _1101;
    float _1273 = _1235 * _1101;
    float _1275 = fma(_1203, _1093, _1267);
    float _1277 = fma(_1259, _1093, _1269);
    float _1279 = fma(_1205, _1093, _1271);
    float _1281 = fma(_1231, _1093, _1273);
    float _1283 = _1261 * _1129;
    float _1285 = _1201 * _1129;
    float _1287 = _1207 * _1129;
    float _1289 = _1235 * _1129;
    float _1291 = fma(_1259, _1121, _1283);
    float _1293 = fma(_1203, _1121, _1285);
    float _1295 = fma(_1205, _1121, _1287);
    float _1297 = fma(_1231, _1121, _1289);
    float _1299 = _1261 * _1161;
    float _1301 = _1201 * _1161;
    float _1303 = _1207 * _1161;
    float _1305 = _1235 * _1161;
    float _1307 = fma(_1259, _1153, _1299);
    float _1309 = fma(_1203, _1153, _1301);
    float _1311 = fma(_1205, _1153, _1303);
    float _1313 = fma(_1231, _1153, _1305);
    float _1315 = fma(_1265, _1185, _1277);
    float _1317 = fma(_1229, _1185, _1279);
    float _1319 = fma(_1227, _1185, _1275);
    float _1321 = fma(_1263, _1185, _1281);
    float _1323 = _1315 + _1193;
    int _1325 = _1007 + 16;
    float _1327 = fma(_1265, _1217, _1291);
    float _1329 = fma(_1227, _1217, _1293);
    float _1331 = fma(_1229, _1217, _1295);
    float _1333 = fma(_1263, _1217, _1297);
    float _1335 = _1327 + _1225;
    uint _1337 = uint(int(uint(_1325) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1337)] = as_type<uint>(_1319);
    int _1339 = _1325 + 4;
    uint _1341 = uint(int(uint(_1339) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1341)] = as_type<uint>(_1317);
    int _1343 = _1325 + 8;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1345)] = as_type<uint>(_1321);
    int _1347 = _1325 + 12;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1349)] = as_type<uint>(_1323);
    float _1351 = fma(_1265, _1247, _1307);
    float _1353 = fma(_1227, _1247, _1309);
    int _1355 = _1007 + 32;
    float _1357 = fma(_1229, _1247, _1311);
    float _1359 = fma(_1263, _1247, _1313);
    float _1361 = _1351 + _1255;
    int _1363 = _1007 + 48;
    uint _1365 = uint(int(uint(_1355) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1365)] = as_type<uint>(_1329);
    int _1367 = _1355 + 4;
    uint _1369 = uint(int(uint(_1367) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1369)] = as_type<uint>(_1331);
    int _1371 = _1355 + 8;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1373)] = as_type<uint>(_1333);
    int _1375 = _1355 + 12;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1377)] = as_type<uint>(_1335);
    uint _1379 = uint(int(uint(_1363) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1379)] = as_type<uint>(_1353);
    int _1381 = _1363 + 4;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1383)] = as_type<uint>(_1357);
    int _1385 = _1363 + 8;
    uint _1387 = uint(int(uint(_1385) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1387)] = as_type<uint>(_1359);
    int _1389 = _1363 + 12;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1391)] = as_type<uint>(_1361);
}

