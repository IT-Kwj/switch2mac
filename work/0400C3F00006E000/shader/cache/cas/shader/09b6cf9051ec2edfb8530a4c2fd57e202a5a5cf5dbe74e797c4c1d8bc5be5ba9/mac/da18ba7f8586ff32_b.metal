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
int _58(thread const int& _3754, thread const int& _3755, constant _10& support_buffer)
{
    int _3758 = 1 + _3755;
    float _3760 = support_buffer._m5[_3758].x;
    bool _3762 = _3760 == 1.0;
    if (_3762)
    {
        return _3754;
    }
    float _3764 = float(_3754);
    float _3766 = _3764 * _3760;
    int _3768 = int(_3766);
    return _3768;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1009 = false;
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
    int3 _1563 = int3(_115, _121, 0);
    float3 _125 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1563.xy), uint(_1563.z), 0).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    int _133 = _68;
    int _135 = 0;
    int _137 = _58(_133, _135, (*spvDescriptorSet0.support_buffer));
    int _139 = as_type<int>(_91);
    int _141 = 0;
    int _143 = _58(_139, _141, (*spvDescriptorSet0.support_buffer));
    int3 _1581 = int3(_137, _143, 0);
    float3 _145 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1581.xy), uint(_1581.z), 0).xyz;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    int _153 = _68;
    int _155 = 1;
    int _157 = _58(_153, _155, (*spvDescriptorSet0.support_buffer));
    int _159 = as_type<int>(_101);
    int _161 = 1;
    int _163 = _58(_159, _161, (*spvDescriptorSet0.support_buffer));
    int3 _1599 = int3(_157, _163, 0);
    float3 _165 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1599.xy), uint(_1599.z), 0).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    int _173 = _68;
    int _175 = 1;
    int _177 = _58(_173, _175, (*spvDescriptorSet0.support_buffer));
    int _179 = as_type<int>(_109);
    int _181 = 1;
    int _183 = _58(_179, _181, (*spvDescriptorSet0.support_buffer));
    int3 _1617 = int3(_177, _183, 0);
    float3 _185 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1617.xy), uint(_1617.z), 0).xyz;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    int _193 = _68;
    int _195 = 0;
    int _197 = _58(_193, _195, (*spvDescriptorSet0.support_buffer));
    int _199 = as_type<int>(_83);
    int _201 = 0;
    int _203 = _58(_199, _201, (*spvDescriptorSet0.support_buffer));
    int3 _1635 = int3(_197, _203, 1);
    float3 _205 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1635.xy), uint(_1635.z), 0).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    int _213 = _68;
    int _215 = 0;
    int _217 = _58(_213, _215, (*spvDescriptorSet0.support_buffer));
    int _219 = as_type<int>(_91);
    int _221 = 0;
    int _223 = _58(_219, _221, (*spvDescriptorSet0.support_buffer));
    int3 _1653 = int3(_217, _223, 1);
    float3 _225 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1653.xy), uint(_1653.z), 0).xyz;
    float _227 = _225.x;
    float _229 = _225.y;
    float _231 = _225.z;
    int _233 = _68;
    int _235 = 1;
    int _237 = _58(_233, _235, (*spvDescriptorSet0.support_buffer));
    int _239 = as_type<int>(_101);
    int _241 = 1;
    int _243 = _58(_239, _241, (*spvDescriptorSet0.support_buffer));
    int3 _1671 = int3(_237, _243, 1);
    float3 _245 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1671.xy), uint(_1671.z), 0).xyz;
    float _247 = _245.x;
    float _249 = _245.y;
    float _251 = _245.z;
    int _253 = _68;
    int _255 = 1;
    int _257 = _58(_253, _255, (*spvDescriptorSet0.support_buffer));
    int _259 = as_type<int>(_109);
    int _261 = 1;
    int _263 = _58(_259, _261, (*spvDescriptorSet0.support_buffer));
    int3 _1689 = int3(_257, _263, 1);
    float3 _265 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1689.xy), uint(_1689.z), 0).xyz;
    float _267 = _265.x;
    float _269 = _265.y;
    float _271 = _265.z;
    int _273 = _68;
    int _275 = 0;
    int _277 = _58(_273, _275, (*spvDescriptorSet0.support_buffer));
    int _279 = as_type<int>(_83);
    int _281 = 0;
    int _283 = _58(_279, _281, (*spvDescriptorSet0.support_buffer));
    int3 _1707 = int3(_277, _283, 2);
    float3 _285 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1707.xy), uint(_1707.z), 0).xyz;
    float _287 = _285.x;
    float _289 = _285.y;
    float _291 = _285.z;
    int _293 = _68;
    int _295 = 0;
    int _297 = _58(_293, _295, (*spvDescriptorSet0.support_buffer));
    int _299 = as_type<int>(_91);
    int _301 = 0;
    int _303 = _58(_299, _301, (*spvDescriptorSet0.support_buffer));
    int3 _1725 = int3(_297, _303, 2);
    float3 _305 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1725.xy), uint(_1725.z), 0).xyz;
    float _307 = _305.x;
    float _309 = _305.y;
    float _311 = _305.z;
    int _313 = _68;
    int _315 = 1;
    int _317 = _58(_313, _315, (*spvDescriptorSet0.support_buffer));
    int _319 = as_type<int>(_101);
    int _321 = 1;
    int _323 = _58(_319, _321, (*spvDescriptorSet0.support_buffer));
    int3 _1743 = int3(_317, _323, 2);
    float3 _325 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1743.xy), uint(_1743.z), 0).xyz;
    float _327 = _325.x;
    float _329 = _325.y;
    float _331 = _325.z;
    int _333 = _68;
    int _335 = 1;
    int _337 = _58(_333, _335, (*spvDescriptorSet0.support_buffer));
    int _339 = as_type<int>(_109);
    int _341 = 1;
    int _343 = _58(_339, _341, (*spvDescriptorSet0.support_buffer));
    int3 _1761 = int3(_337, _343, 2);
    float3 _345 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1761.xy), uint(_1761.z), 0).xyz;
    float _347 = _345.x;
    float _349 = _345.y;
    float _351 = _345.z;
    int _353 = _74 + 16;
    uint _355 = uint(int(uint(_353) >> uint(2)));
    uint _357 = uint(int(uint(int(_355)) >> uint(2)));
    int _359 = int(_355) & 3;
    float _361 = (*spvDescriptorSet0.cp_c5)._m0[int(_357)][_359];
    int _363 = int(_355) + 1;
    uint _365 = uint(int(uint(_363) >> uint(2)));
    int _367 = _363 & 3;
    float _369 = (*spvDescriptorSet0.cp_c5)._m0[int(_365)][_367];
    bool _371 = _68 != 0;
    int _373 = _74 + 24;
    uint _375 = uint(int(uint(_373) >> uint(2)));
    uint _377 = uint(int(uint(int(_375)) >> uint(2)));
    int _379 = int(_375) & 3;
    float _381 = (*spvDescriptorSet0.cp_c5)._m0[int(_377)][_379];
    int _383 = int(_375) + 1;
    uint _385 = uint(int(uint(_383) >> uint(2)));
    int _387 = _383 & 3;
    float _389 = (*spvDescriptorSet0.cp_c5)._m0[int(_385)][_387];
    float _391 = -_127;
    float _393 = _391 + _147;
    float _395 = -_129;
    float _397 = _395 + _149;
    float _399 = -_131;
    float _401 = _399 + _151;
    float _403 = fma(_393, _361, _127);
    float _405 = fma(_397, _361, _129);
    float _407 = fma(_401, _361, _131);
    float _409 = -_167;
    float _411 = _409 + _187;
    float _413 = -_169;
    float _415 = _413 + _189;
    float _417 = -_171;
    float _419 = _417 + _191;
    float _421 = -_211;
    float _423 = _421 + _231;
    float _425 = fma(_411, _381, _167);
    float _427 = fma(_415, _381, _169);
    float _429 = fma(_419, _381, _171);
    float _431 = -_251;
    float _433 = _431 + _271;
    float _435 = _425 * _389;
    float _437 = _427 * _389;
    float _439 = _429 * _389;
    float _441 = fma(_433, _381, _251);
    float _443 = fma(_403, _369, _435);
    float _445 = fma(_405, _369, _437);
    float _447 = fma(_407, _369, _439);
    float _449 = -_209;
    float _451 = _449 + _229;
    float _453 = -_207;
    float _455 = _453 + _227;
    float _457 = fma(_423, _361, _211);
    float _459 = fma(_451, _361, _209);
    float _461 = -_247;
    float _463 = _461 + _267;
    float _465 = fma(_455, _361, _207);
    float _467 = fma(_463, _381, _247);
    float _469 = _467 * _389;
    float _471 = fma(_465, _369, _469);
    float _473 = _471 * 0.15915493667125701904296875;
    float _475 = _441 * _389;
    float _477 = _473 * 6.283185482025146484375;
    float _479 = cos(_477);
    float _481 = fma(_457, _369, _475);
    float _483 = -_249;
    float _485 = _483 + _269;
    float _487 = _481 * 0.15915493667125701904296875;
    float _489 = fma(_485, _381, _249);
    float _491 = _473 * 6.283185482025146484375;
    float _493 = sin(_491);
    float _495 = _489 * _389;
    float _497 = fma(_459, _369, _495);
    float _499 = _487 * 6.283185482025146484375;
    float _501 = sin(_499);
    float _503 = _497 * 0.15915493667125701904296875;
    bool _505 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _507 = _487 * 6.283185482025146484375;
    float _509 = cos(_507);
    float _511 = _503 * 6.283185482025146484375;
    float _513 = cos(_511);
    float _515 = _501 * _479;
    float _517 = _503 * 6.283185482025146484375;
    float _519 = sin(_517);
    float _521 = _479 * _509;
    float _523 = _493 * _509;
    float _525 = _479 * _513;
    float _527 = _493 * _501;
    float _529 = _513 * _443;
    float _531 = _493 * _513;
    float _533 = _493 * _519;
    float _535 = _519 * _443;
    float _537 = fma(_519, _521, _527);
    float _539 = -_523;
    float _541 = fma(_519, _515, _539);
    float _543 = -_515;
    float _545 = fma(_509, _533, _543);
    float _547 = fma(_501, _533, _521);
    float _549 = -_329;
    float _551 = _549 + _349;
    float _553 = -_327;
    float _555 = _553 + _347;
    float _557 = -_331;
    float _559 = _557 + _351;
    float _561 = _509 * _529;
    float _563 = _501 * _529;
    float _565 = _545 * _445;
    float _567 = _547 * _445;
    float _569 = fma(_551, _381, _329);
    float _571 = -_287;
    float _573 = _571 + _307;
    float _575 = -_289;
    float _577 = _575 + _309;
    float _579 = fma(_555, _381, _327);
    float _581 = fma(_559, _381, _331);
    float _583 = -_291;
    float _585 = _583 + _311;
    float _587 = _531 * _445;
    float _589 = _525 * _447;
    float _591 = _537 * _447;
    float _593 = _541 * _447;
    float _595 = _569 * _389;
    float _597 = fma(_573, _361, _287);
    float _599 = fma(_577, _361, _289);
    float _601 = _579 * _389;
    float _603 = fma(_585, _361, _291);
    float _605 = _581 * _389;
    float _607 = fma(_599, _369, _595);
    float _609 = fma(_597, _369, _601);
    int _611 = _68 * 48;
    float _613 = fma(_603, _369, _605);
    float _615 = -_535;
    float _617 = _615 + (-0.0);
    float _619 = _605;
    float _621 = _597;
    float _623 = _599;
    float _625 = _585;
    float _627 = _289;
    float _629 = _307;
    float _631 = _291;
    float _633 = _567;
    float _635 = _565;
    float _637 = _617;
    float _639 = _591;
    float _641 = _593;
    if (!_505)
    {
        int _643 = _68 * 48;
        float _645 = -_535;
        float _647 = _645 + (-0.0);
        int _649 = _643 + 16;
        uint _651 = uint(int(uint(_643) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_651)] = as_type<uint>(_561);
        int _653 = _643 + 4;
        uint _655 = uint(int(uint(_653) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_655)] = as_type<uint>(_565);
        int _657 = _643 + 8;
        uint _659 = uint(int(uint(_657) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_659)] = as_type<uint>(_591);
        int _661 = _643 + 12;
        uint _663 = uint(int(uint(_661) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_663)] = as_type<uint>(_609);
        int _665 = _643 + 32;
        uint _667 = uint(int(uint(_649) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_667)] = as_type<uint>(_563);
        int _669 = _649 + 4;
        uint _671 = uint(int(uint(_669) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_671)] = as_type<uint>(_567);
        int _673 = _649 + 8;
        uint _675 = uint(int(uint(_673) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_675)] = as_type<uint>(_593);
        int _677 = _649 + 12;
        uint _679 = uint(int(uint(_677) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_679)] = as_type<uint>(_607);
        uint _681 = uint(int(uint(_665) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_681)] = as_type<uint>(_647);
        int _683 = _665 + 4;
        uint _685 = uint(int(uint(_683) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_685)] = as_type<uint>(_587);
        int _687 = _665 + 8;
        uint _689 = uint(int(uint(_687) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_689)] = as_type<uint>(_589);
        int _691 = _665 + 12;
        uint _693 = uint(int(uint(_691) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_693)] = as_type<uint>(_613);
        _619 = as_type<float>(_649);
        _621 = as_type<float>(_665);
        _623 = as_type<float>(_643);
    }
    float _695 = _619;
    float _697 = _621;
    float _699 = _623;
    uint _701 = uint(int(uint(_611) >> uint(2)));
    _39[int(_701)] = as_type<uint>(_561);
    int _703 = _611 + 4;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    _39[int(_705)] = as_type<uint>(_565);
    int _707 = _611 + 8;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    _39[int(_709)] = as_type<uint>(_591);
    int _711 = _611 + 12;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    _39[int(_713)] = as_type<uint>(_609);
    int _715 = _68 * 112;
    float _717 = _699;
    float _719 = _697;
    float _721 = _695;
    if (!_371)
    {
        _625 = _609;
    }
    float _723 = _625;
    int _725 = _611 + 32;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    _39[int(_727)] = as_type<uint>(_617);
    int _729 = _611 + 36;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    _39[int(_731)] = as_type<uint>(_587);
    int _733 = _611 + 40;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    _39[int(_735)] = as_type<uint>(_589);
    int _737 = _611 + 44;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    _39[int(_739)] = as_type<uint>(_613);
    float _741 = _723;
    if (!_371)
    {
        _627 = _607;
    }
    float _743 = _627;
    float _745 = _743;
    if (!_371)
    {
        _717 = _613;
    }
    float _747 = _717;
    int _749 = _611 + 16;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    _39[int(_751)] = as_type<uint>(_563);
    int _753 = _611 + 20;
    uint _755 = uint(int(uint(_753) >> uint(2)));
    _39[int(_755)] = as_type<uint>(_567);
    int _757 = _611 + 24;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    _39[int(_759)] = as_type<uint>(_593);
    int _761 = _611 + 28;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    _39[int(_763)] = as_type<uint>(_607);
    float _765 = _747;
    if (!_371)
    {
        _629 = _561;
    }
    float _767 = _629;
    float _769 = _767;
    if (!_371)
    {
        _631 = _563;
    }
    float _771 = _631;
    float _773 = _771;
    if (!_371)
    {
        _719 = _587;
    }
    float _775 = _719;
    float _777 = _775;
    if (!_371)
    {
        _721 = _589;
    }
    float _779 = _721;
    bool _781 = !_371;
    float _783 = _779;
    if (!_781)
    {
        bool _785 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _787 = !_785;
        if (!_787)
        {
            uint _789 = uint(int(uint(_715) >> uint(2)));
            uint _791 = uint(int(uint(int(_789)) >> uint(2)));
            int _793 = int(_789) & 3;
            float _795 = (*spvDescriptorSet0.cp_c6)._m0[int(_791)][_793];
            int _797 = as_type<int>(_795) * 48;
            int _799 = 0;
            bool _801;
            float _899;
            float _901;
            float _903;
            float _927;
            float _931;
            float _933;
            float _935;
            float _955;
            float _957;
            float _959;
            float _961;
            do
            {
                int _803 = _799;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _805 = uint(int(uint(_797) >> uint(2)));
                float _807 = as_type<float>(_39[int(_805)]);
                int _809 = _797 + 4;
                uint _811 = uint(int(uint(_809) >> uint(2)));
                float _813 = as_type<float>(_39[int(_811)]);
                int _815 = _797 + 8;
                uint _817 = uint(int(uint(_815) >> uint(2)));
                float _819 = as_type<float>(_39[int(_817)]);
                int _821 = _797 + 12;
                uint _823 = uint(int(uint(_821) >> uint(2)));
                float _825 = as_type<float>(_39[int(_823)]);
                int _827 = _803 + 1;
                int _829 = _797 + 16;
                uint _831 = uint(int(uint(_829) >> uint(2)));
                float _833 = as_type<float>(_39[int(_831)]);
                int _835 = _797 + 20;
                uint _837 = uint(int(uint(_835) >> uint(2)));
                float _839 = as_type<float>(_39[int(_837)]);
                int _841 = _797 + 24;
                uint _843 = uint(int(uint(_841) >> uint(2)));
                float _845 = as_type<float>(_39[int(_843)]);
                int _847 = _797 + 28;
                uint _849 = uint(int(uint(_847) >> uint(2)));
                float _851 = as_type<float>(_39[int(_849)]);
                bool _853 = uint(_827) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _855 = _797 + 32;
                uint _857 = uint(int(uint(_855) >> uint(2)));
                float _859 = as_type<float>(_39[int(_857)]);
                int _861 = _797 + 36;
                uint _863 = uint(int(uint(_861) >> uint(2)));
                float _865 = as_type<float>(_39[int(_863)]);
                int _867 = _797 + 40;
                uint _869 = uint(int(uint(_867) >> uint(2)));
                float _871 = as_type<float>(_39[int(_869)]);
                int _873 = _797 + 44;
                uint _875 = uint(int(uint(_873) >> uint(2)));
                float _877 = as_type<float>(_39[int(_875)]);
                float _879 = _607 * _813;
                float _881 = _563 * _813;
                float _883 = _567 * _813;
                float _885 = _593 * _813;
                float _887 = fma(_609, _807, _879);
                float _889 = fma(_561, _807, _881);
                float _891 = fma(_565, _807, _883);
                float _893 = fma(_591, _807, _885);
                float _895 = fma(_613, _819, _887);
                float _897 = -_535;
                _899 = fma(_897, _819, _889);
                _901 = fma(_587, _819, _891);
                _903 = fma(_589, _819, _893);
                float _905 = _607 * _839;
                float _907 = _563 * _839;
                float _909 = _825 + _895;
                float _911 = _567 * _839;
                float _913 = _593 * _839;
                float _915 = fma(_609, _833, _905);
                float _917 = fma(_561, _833, _907);
                float _919 = fma(_565, _833, _911);
                float _921 = fma(_591, _833, _913);
                float _923 = fma(_613, _845, _915);
                float _925 = -_535;
                _927 = fma(_925, _845, _917);
                float _929 = _607 * _865;
                _931 = fma(_587, _845, _919);
                _933 = fma(_589, _845, _921);
                _935 = _851 + _923;
                float _937 = _563 * _865;
                float _939 = _567 * _865;
                float _941 = _593 * _865;
                float _943 = fma(_609, _859, _929);
                float _945 = fma(_561, _859, _937);
                float _947 = fma(_565, _859, _939);
                float _949 = fma(_591, _859, _941);
                float _951 = fma(_613, _871, _943);
                float _953 = -_535;
                _955 = fma(_953, _871, _945);
                _957 = fma(_587, _871, _947);
                _959 = fma(_589, _871, _949);
                _961 = _877 + _951;
                uint _963 = uint(int(uint(_611) >> uint(2)));
                _39[int(_963)] = as_type<uint>(_899);
                int _965 = _611 + 4;
                uint _967 = uint(int(uint(_965) >> uint(2)));
                _39[int(_967)] = as_type<uint>(_901);
                int _969 = _611 + 8;
                uint _971 = uint(int(uint(_969) >> uint(2)));
                _39[int(_971)] = as_type<uint>(_903);
                int _973 = _611 + 12;
                uint _975 = uint(int(uint(_973) >> uint(2)));
                _39[int(_975)] = as_type<uint>(_909);
                int _977 = _611 + 16;
                uint _979 = uint(int(uint(_977) >> uint(2)));
                _39[int(_979)] = as_type<uint>(_927);
                int _981 = _611 + 20;
                uint _983 = uint(int(uint(_981) >> uint(2)));
                _39[int(_983)] = as_type<uint>(_931);
                int _985 = _611 + 24;
                uint _987 = uint(int(uint(_985) >> uint(2)));
                _39[int(_987)] = as_type<uint>(_933);
                int _989 = _611 + 28;
                uint _991 = uint(int(uint(_989) >> uint(2)));
                _39[int(_991)] = as_type<uint>(_935);
                int _993 = _611 + 32;
                uint _995 = uint(int(uint(_993) >> uint(2)));
                _39[int(_995)] = as_type<uint>(_955);
                int _997 = _611 + 36;
                uint _999 = uint(int(uint(_997) >> uint(2)));
                _39[int(_999)] = as_type<uint>(_957);
                int _1001 = _611 + 40;
                uint _1003 = uint(int(uint(_1001) >> uint(2)));
                _39[int(_1003)] = as_type<uint>(_959);
                int _1005 = _611 + 44;
                uint _1007 = uint(int(uint(_1005) >> uint(2)));
                _39[int(_1007)] = as_type<uint>(_961);
                _801 = !_853;
                _799 = _827;
                _741 = _909;
            } while (_801);
            _633 = _931;
            _777 = _957;
            _635 = _901;
            _773 = _927;
            _637 = _955;
            _769 = _899;
            _639 = _903;
            _641 = _933;
            _783 = _959;
            _745 = _935;
            _765 = _961;
            _1009 = true;
        }
        else
        {
            _633 = 0.0;
            _777 = 0.0;
            _635 = 0.0;
            _773 = 0.0;
            _637 = 0.0;
            _769 = 0.0;
            _639 = 0.0;
            _641 = 0.0;
            _783 = 0.0;
            _741 = 0.0;
            _745 = 0.0;
            _765 = 0.0;
        }
    }
    _1009 = false;
    float _1011 = _633;
    float _1013 = _777;
    float _1015 = _635;
    float _1017 = _773;
    float _1019 = _637;
    float _1021 = _769;
    float _1023 = _639;
    float _1025 = _641;
    float _1027 = _783;
    float _1029 = _741;
    float _1031 = _745;
    float _1033 = _765;
    int _1035 = _715 + 80;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    uint _1039 = uint(int(uint(int(_1037)) >> uint(2)));
    int _1041 = int(_1037) & 3;
    float _1043 = (*spvDescriptorSet0.cp_c6)._m0[int(_1039)][_1041];
    int _1045 = int(_1037) + 1;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    int _1049 = _1045 & 3;
    float _1051 = (*spvDescriptorSet0.cp_c6)._m0[int(_1047)][_1049];
    int _1053 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1055 = _1053 + _68;
    int _1057 = _715 + 64;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    uint _1061 = uint(int(uint(int(_1059)) >> uint(2)));
    int _1063 = int(_1059) & 3;
    float _1065 = (*spvDescriptorSet0.cp_c6)._m0[int(_1061)][_1063];
    int _1067 = int(_1059) + 1;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    int _1071 = _1067 & 3;
    float _1073 = (*spvDescriptorSet0.cp_c6)._m0[int(_1069)][_1071];
    int _1075 = _1055 * 48;
    int _1077 = _715 + 88;
    uint _1079 = uint(int(uint(_1077) >> uint(2)));
    uint _1081 = uint(int(uint(int(_1079)) >> uint(2)));
    int _1083 = int(_1079) & 3;
    float _1085 = (*spvDescriptorSet0.cp_c6)._m0[int(_1081)][_1083];
    int _1087 = int(_1079) + 1;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    int _1091 = _1087 & 3;
    float _1093 = (*spvDescriptorSet0.cp_c6)._m0[int(_1089)][_1091];
    int _1095 = _715 + 72;
    uint _1097 = uint(int(uint(_1095) >> uint(2)));
    uint _1099 = uint(int(uint(int(_1097)) >> uint(2)));
    int _1101 = int(_1097) & 3;
    float _1103 = (*spvDescriptorSet0.cp_c6)._m0[int(_1099)][_1101];
    int _1105 = int(_1097) + 1;
    uint _1107 = uint(int(uint(_1105) >> uint(2)));
    int _1109 = _1105 & 3;
    float _1111 = (*spvDescriptorSet0.cp_c6)._m0[int(_1107)][_1109];
    int _1113 = _715 + 96;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.cp_c6)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.cp_c6)._m0[int(_1125)][_1127];
    int _1131 = _715 + 104;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    uint _1135 = uint(int(uint(int(_1133)) >> uint(2)));
    int _1137 = int(_1133) & 3;
    float _1139 = (*spvDescriptorSet0.cp_c6)._m0[int(_1135)][_1137];
    int _1141 = int(_1133) + 1;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    int _1145 = _1141 & 3;
    float _1147 = (*spvDescriptorSet0.cp_c6)._m0[int(_1143)][_1145];
    float _1149 = _1011 * _1043;
    float _1151 = _1013 * _1043;
    int _1153 = _715 + 16;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    uint _1157 = uint(int(uint(int(_1155)) >> uint(2)));
    int _1159 = int(_1155) & 3;
    float _1161 = (*spvDescriptorSet0.cp_c6)._m0[int(_1157)][_1159];
    int _1163 = int(_1155) + 1;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    int _1167 = _1163 & 3;
    float _1169 = (*spvDescriptorSet0.cp_c6)._m0[int(_1165)][_1167];
    float _1171 = _1015 * _1043;
    float _1173 = fma(_1017, _1065, _1149);
    float _1175 = _1015 * _1051;
    int _1177 = _715 + 32;
    uint _1179 = uint(int(uint(_1177) >> uint(2)));
    uint _1181 = uint(int(uint(int(_1179)) >> uint(2)));
    int _1183 = int(_1179) & 3;
    float _1185 = (*spvDescriptorSet0.cp_c6)._m0[int(_1181)][_1183];
    int _1187 = int(_1179) + 1;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    int _1191 = _1187 & 3;
    float _1193 = (*spvDescriptorSet0.cp_c6)._m0[int(_1189)][_1191];
    float _1195 = fma(_1019, _1065, _1151);
    float _1197 = _1011 * _1051;
    float _1199 = fma(_1021, _1073, _1175);
    float _1201 = _1013 * _1051;
    float _1203 = fma(_1021, _1065, _1171);
    float _1205 = _1015 * _1085;
    float _1207 = _1015 * _1093;
    int _1209 = _715 + 48;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    uint _1213 = uint(int(uint(int(_1211)) >> uint(2)));
    int _1215 = int(_1211) & 3;
    float _1217 = (*spvDescriptorSet0.cp_c6)._m0[int(_1213)][_1215];
    int _1219 = int(_1211) + 1;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    int _1223 = _1219 & 3;
    float _1225 = (*spvDescriptorSet0.cp_c6)._m0[int(_1221)][_1223];
    float _1227 = _1011 * _1085;
    float _1229 = _1013 * _1085;
    float _1231 = _1011 * _1093;
    float _1233 = _1013 * _1093;
    float _1235 = fma(_1017, _1073, _1197);
    float _1237 = fma(_1019, _1073, _1201);
    float _1239 = fma(_1021, _1103, _1205);
    int _1241 = _715 + 24;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
    int _1247 = int(_1243) & 3;
    float _1249 = (*spvDescriptorSet0.cp_c6)._m0[int(_1245)][_1247];
    int _1251 = int(_1243) + 1;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    int _1255 = _1251 & 3;
    float _1257 = (*spvDescriptorSet0.cp_c6)._m0[int(_1253)][_1255];
    float _1259 = fma(_1021, _1111, _1207);
    float _1261 = fma(_1017, _1103, _1227);
    float _1263 = fma(_1017, _1111, _1231);
    float _1265 = fma(_1019, _1103, _1229);
    float _1267 = fma(_1019, _1111, _1233);
    float _1269 = fma(_1023, _1121, _1203);
    float _1271 = fma(_1023, _1129, _1199);
    int _1273 = _715 + 40;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    uint _1277 = uint(int(uint(int(_1275)) >> uint(2)));
    int _1279 = int(_1275) & 3;
    float _1281 = (*spvDescriptorSet0.cp_c6)._m0[int(_1277)][_1279];
    int _1283 = int(_1275) + 1;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    int _1287 = _1283 & 3;
    float _1289 = (*spvDescriptorSet0.cp_c6)._m0[int(_1285)][_1287];
    float _1291 = fma(_1025, _1121, _1173);
    float _1293 = fma(_1025, _1129, _1235);
    float _1295 = fma(_1027, _1121, _1195);
    float _1297 = fma(_1027, _1129, _1237);
    float _1299 = fma(_1023, _1139, _1239);
    float _1301 = fma(_1023, _1147, _1259);
    int _1303 = _715 + 56;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    uint _1307 = uint(int(uint(int(_1305)) >> uint(2)));
    int _1309 = int(_1305) & 3;
    float _1311 = (*spvDescriptorSet0.cp_c6)._m0[int(_1307)][_1309];
    int _1313 = int(_1305) + 1;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    int _1317 = _1313 & 3;
    float _1319 = (*spvDescriptorSet0.cp_c6)._m0[int(_1315)][_1317];
    float _1321 = fma(_1025, _1139, _1261);
    float _1323 = fma(_1025, _1147, _1263);
    float _1325 = fma(_1027, _1147, _1267);
    float _1327 = _1301 + _1029;
    float _1329 = fma(_1027, _1139, _1265);
    float _1331 = _1323 + _1031;
    float _1333 = _1325 + _1033;
    float _1335 = _1293 * _1169;
    float _1337 = _1291 * _1169;
    float _1339 = _1331 * _1169;
    float _1341 = _1321 * _1169;
    float _1343 = fma(_1271, _1161, _1335);
    float _1345 = fma(_1269, _1161, _1337);
    float _1347 = fma(_1327, _1161, _1339);
    float _1349 = fma(_1299, _1161, _1341);
    float _1351 = _1331 * _1193;
    float _1353 = _1293 * _1193;
    float _1355 = _1291 * _1193;
    float _1357 = _1321 * _1193;
    float _1359 = fma(_1327, _1185, _1351);
    float _1361 = fma(_1271, _1185, _1353);
    float _1363 = fma(_1269, _1185, _1355);
    float _1365 = fma(_1299, _1185, _1357);
    float _1367 = _1331 * _1225;
    float _1369 = _1293 * _1225;
    float _1371 = _1291 * _1225;
    float _1373 = _1321 * _1225;
    float _1375 = fma(_1327, _1217, _1367);
    float _1377 = fma(_1271, _1217, _1369);
    float _1379 = fma(_1269, _1217, _1371);
    float _1381 = fma(_1299, _1217, _1373);
    float _1383 = fma(_1333, _1249, _1347);
    float _1385 = fma(_1297, _1249, _1343);
    float _1387 = fma(_1295, _1249, _1345);
    float _1389 = fma(_1329, _1249, _1349);
    float _1391 = _1383 + _1257;
    int _1393 = _1075 + 32;
    float _1395 = fma(_1333, _1281, _1359);
    float _1397 = fma(_1297, _1281, _1361);
    float _1399 = fma(_1295, _1281, _1363);
    float _1401 = fma(_1329, _1281, _1365);
    float _1403 = _1395 + _1289;
    float _1405 = fma(_1333, _1311, _1375);
    float _1407 = fma(_1297, _1311, _1377);
    int _1409 = _1075 + 16;
    float _1411 = fma(_1295, _1311, _1379);
    float _1413 = fma(_1329, _1311, _1381);
    float _1415 = _1405 + _1319;
    int _1417 = _1075 + 48;
    uint _1419 = uint(int(uint(_1409) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1419)] = as_type<uint>(_1387);
    int _1421 = _1409 + 4;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1423)] = as_type<uint>(_1385);
    int _1425 = _1409 + 8;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1427)] = as_type<uint>(_1389);
    int _1429 = _1409 + 12;
    uint _1431 = uint(int(uint(_1429) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1431)] = as_type<uint>(_1391);
    uint _1433 = uint(int(uint(_1393) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1433)] = as_type<uint>(_1399);
    int _1435 = _1393 + 4;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1437)] = as_type<uint>(_1397);
    int _1439 = _1393 + 8;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1441)] = as_type<uint>(_1401);
    int _1443 = _1393 + 12;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1445)] = as_type<uint>(_1403);
    uint _1447 = uint(int(uint(_1417) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1447)] = as_type<uint>(_1411);
    int _1449 = _1417 + 4;
    uint _1451 = uint(int(uint(_1449) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1451)] = as_type<uint>(_1407);
    int _1453 = _1417 + 8;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1455)] = as_type<uint>(_1413);
    int _1457 = _1417 + 12;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1459)] = as_type<uint>(_1415);
}

