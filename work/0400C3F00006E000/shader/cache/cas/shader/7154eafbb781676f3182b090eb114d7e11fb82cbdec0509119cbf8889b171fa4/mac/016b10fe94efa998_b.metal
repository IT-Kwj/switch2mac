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
};

static inline __attribute__((always_inline))
int _54(thread const int& _3639, thread const int& _3640, constant _10& support_buffer)
{
    int _3643 = 1 + _3640;
    float _3645 = support_buffer._m5[_3643].x;
    bool _3647 = _3645 == 1.0;
    if (_3647)
    {
        return _3639;
    }
    float _3649 = float(_3639);
    float _3651 = _3649 * _3645;
    int _3653 = int(_3651);
    return _3653;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    if (_68)
    {
        return;
    }
    bool _70 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _72 = _64 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _74 = _72 << 4;
    bool _76 = !_70;
    if (!_76)
    {
        uint _79 = uint(int(uint(_74) >> uint(2)));
        uint _81 = uint(int(uint(int(_79)) >> uint(2)));
        int _83 = int(_79) & 3;
        float _85 = (*spvDescriptorSet0.cp_c4)._m0[int(_81)][_83];
        int _87 = as_type<int>(_85) * 48;
        int _89 = 0;
        float _91 = 0.0;
        float _93 = 0.0;
        float _95 = 0.0;
        float _97 = 0.0;
        int _99 = 0;
        int _101 = 0;
        int _103 = 0;
        int _105 = 0;
        bool _107;
        do
        {
            int _109 = _89;
            float _111 = _91;
            float _113 = _93;
            float _115 = _95;
            float _117 = _97;
            int _119 = _99;
            int _121 = _101;
            int _123 = _103;
            int _125 = _105;
            int _127 = _87 + 32;
            uint _129 = uint(int(uint(_127) >> uint(2)));
            uint _131 = uint(int(uint(int(_129)) >> uint(2)));
            int _133 = int(_129) & 3;
            float _135 = (*spvDescriptorSet0.cp_c5)._m0[int(_131)][_133];
            int _137 = _109 & 31;
            bool _139 = _137 == 0;
            bool _141 = uint(_137) < 32u;
            int _143 = 32 - _137;
            int _145 = _137 - 32;
            int _147 = 1 << _137;
            uint _149 = uint(int(uint(0) >> uint(_143)));
            int _151 = _147 | int(_149);
            int _153 = _139 ? 1 : _151;
            bool _155 = uint(_145) < 32u;
            int _157 = 0 << _145;
            int _159 = _155 ? _157 : 0;
            float _161 = _141 ? as_type<float>(_153) : as_type<float>(_159);
            int _163 = as_type<int>(_161) & as_type<int>(_135);
            bool _165 = _163 != 0;
            float _167 = _161;
            float _169 = _115;
            float _171 = _117;
            float _173 = _111;
            float _175 = _113;
            float _177 = _135;
            int _179 = _121;
            int _181 = _123;
            int _183 = _119;
            int _185 = _125;
            if (!_165)
            {
                _167 = 0.0;
            }
            float _187 = _167;
            float _189 = _187;
            if (!_165)
            {
                _169 = 0.0;
                _171 = 0.0;
            }
            float _191 = _169;
            float _193 = _171;
            float _195 = _191;
            float _197 = _193;
            if (!_165)
            {
                _173 = 0.0;
                _175 = 0.0;
            }
            float _199 = _173;
            float _201 = _175;
            float _203 = _199;
            float _205 = _201;
            if (!_165)
            {
                _177 = 0.0;
            }
            float _207 = _177;
            float _209 = _207;
            if (!_165)
            {
                _179 = 0;
            }
            int _211 = _179;
            int _213 = _211;
            if (!_165)
            {
                _181 = 0;
            }
            int _215 = _181;
            int _217 = _215;
            if (!_165)
            {
                _183 = 0;
            }
            int _219 = _183;
            bool _221 = !_165;
            int _223 = _219;
            if (!_221)
            {
                uint _225 = uint(int(uint(_87) >> uint(2)));
                uint _227 = uint(int(uint(int(_225)) >> uint(2)));
                int _229 = int(_225) & 3;
                float _231 = (*spvDescriptorSet0.cp_c5)._m0[int(_227)][_229];
                int _233 = int(_225) + 1;
                uint _235 = uint(int(uint(_233) >> uint(2)));
                int _237 = _233 & 3;
                float _239 = (*spvDescriptorSet0.cp_c5)._m0[int(_235)][_237];
                int _241 = _109;
                int _243 = 0;
                int _245 = _54(_241, _243, (*spvDescriptorSet0.support_buffer));
                int _247 = as_type<int>(_231);
                int _249 = 0;
                int _251 = _54(_247, _249, (*spvDescriptorSet0.support_buffer));
                int3 _1641 = int3(_245, _251, 1);
                float3 _255 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1641.xy), uint(_1641.z), 0).xyz;
                float _257 = _255.x;
                float _259 = _255.y;
                float _261 = _255.z;
                int _263 = _109;
                int _265 = 0;
                int _267 = _54(_263, _265, (*spvDescriptorSet0.support_buffer));
                int _269 = as_type<int>(_239);
                int _271 = 0;
                int _273 = _54(_269, _271, (*spvDescriptorSet0.support_buffer));
                int3 _1659 = int3(_267, _273, 1);
                float3 _275 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1659.xy), uint(_1659.z), 0).xyz;
                float _277 = _275.x;
                float _279 = _275.y;
                float _281 = _275.z;
                int _283 = _109;
                int _285 = 0;
                int _287 = _54(_283, _285, (*spvDescriptorSet0.support_buffer));
                int _289 = as_type<int>(_231);
                int _291 = 0;
                int _293 = _54(_289, _291, (*spvDescriptorSet0.support_buffer));
                int3 _1677 = int3(_287, _293, 0);
                float3 _295 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1677.xy), uint(_1677.z), 0).xyz;
                float _297 = _295.x;
                float _299 = _295.y;
                float _301 = _295.z;
                int _303 = _109;
                int _305 = 0;
                int _307 = _54(_303, _305, (*spvDescriptorSet0.support_buffer));
                int _309 = as_type<int>(_239);
                int _311 = 0;
                int _313 = _54(_309, _311, (*spvDescriptorSet0.support_buffer));
                int3 _1695 = int3(_307, _313, 0);
                float3 _315 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1695.xy), uint(_1695.z), 0).xyz;
                float _317 = _315.x;
                float _319 = _315.y;
                float _321 = _315.z;
                int _323 = _109;
                int _325 = 0;
                int _327 = _54(_323, _325, (*spvDescriptorSet0.support_buffer));
                int _329 = as_type<int>(_231);
                int _331 = 0;
                int _333 = _54(_329, _331, (*spvDescriptorSet0.support_buffer));
                int3 _1713 = int3(_327, _333, 2);
                float3 _335 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1713.xy), uint(_1713.z), 0).xyz;
                float _337 = _335.x;
                float _339 = _335.y;
                float _341 = _335.z;
                int _343 = _109;
                int _345 = 0;
                int _347 = _54(_343, _345, (*spvDescriptorSet0.support_buffer));
                int _349 = as_type<int>(_239);
                int _351 = 0;
                int _353 = _54(_349, _351, (*spvDescriptorSet0.support_buffer));
                int3 _1731 = int3(_347, _353, 2);
                float3 _355 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1731.xy), uint(_1731.z), 0).xyz;
                float _357 = _355.x;
                float _359 = _355.y;
                float _361 = _355.z;
                int _363 = _87 + 16;
                uint _365 = uint(int(uint(_363) >> uint(2)));
                uint _367 = uint(int(uint(int(_365)) >> uint(2)));
                int _369 = int(_365) & 3;
                float _371 = (*spvDescriptorSet0.cp_c5)._m0[int(_367)][_369];
                float _373 = -_257;
                float _375 = _373 + _277;
                float _377 = -_259;
                float _379 = _377 + _279;
                float _381 = -_261;
                float _383 = _381 + _281;
                float _385 = -_297;
                float _387 = _385 + _317;
                float _389 = fma(_375, _371, _257);
                float _391 = -_299;
                float _393 = _391 + _319;
                float _395 = fma(_383, _371, _261);
                float _397 = fma(_387, _371, _297);
                float _399 = -_301;
                float _401 = _399 + _321;
                float _403 = -_337;
                float _405 = _403 + _357;
                float _407 = -_339;
                float _409 = _407 + _359;
                float _411 = -_341;
                float _413 = _411 + _361;
                float _415 = fma(_379, _371, _259);
                float _417 = fma(_393, _371, _299);
                float _419 = fma(_401, _371, _301);
                float _421 = fma(_405, _371, _337);
                float _423 = fma(_409, _371, _339);
                float _425 = fma(_413, _371, _341);
                _203 = _389;
                _209 = _395;
                _205 = _415;
                _189 = _397;
                _195 = _419;
                _197 = _417;
                _223 = as_type<int>(_425);
                _213 = as_type<int>(_421);
                _217 = as_type<int>(_423);
                _185 = 1;
            }
            float _427 = _203;
            float _429 = _209;
            float _431 = _205;
            float _433 = _189;
            float _435 = _195;
            float _437 = _197;
            int _439 = _223;
            int _441 = _213;
            int _443 = _217;
            int _445 = _185;
            float _447 = _427 * 0.15915493667125701904296875;
            float _449 = _429 * 0.15915493667125701904296875;
            float _451 = _431 * 0.15915493667125701904296875;
            float _453 = _447 * 6.283185482025146484375;
            float _455 = cos(_453);
            float _457 = _449 * 6.283185482025146484375;
            float _459 = sin(_457);
            float _461 = _449 * 6.283185482025146484375;
            float _463 = cos(_461);
            float _465 = _451 * 6.283185482025146484375;
            float _467 = cos(_465);
            float _469 = _459 * _455;
            float _471 = _447 * 6.283185482025146484375;
            float _473 = sin(_471);
            float _475 = _455 * _463;
            float _477 = _451 * 6.283185482025146484375;
            float _479 = sin(_477);
            float _481 = _455 * _467;
            float _483 = _467 * _433;
            float _485 = _481 * _435;
            float _487 = _463 * _483;
            float _489 = _459 * _483;
            float _491 = _473 * _459;
            float _493 = _473 * _463;
            float _495 = _473 * _467;
            float _497 = _495 * _437;
            float _499 = _473 * _479;
            float _501 = fma(_479, _475, _491);
            float _503 = -_479;
            float _505 = fma(_503, _433, -0.0);
            int _507 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _509 = _507 + _109;
            float _511 = -_469;
            float _513 = fma(_463, _499, _511);
            float _515 = fma(_459, _499, _475);
            float _517 = -_493;
            float _519 = fma(_479, _469, _517);
            int _521 = _509 * 48;
            float _523 = _513 * _437;
            float _525 = _515 * _437;
            float _527 = _501 * _435;
            float _529 = _519 * _435;
            int _531 = _521 + 32;
            uint _533 = uint(int(uint(_531) >> uint(2)));
            _37[int(_533)] = as_type<uint>(_505);
            int _535 = _521 + 36;
            uint _537 = uint(int(uint(_535) >> uint(2)));
            _37[int(_537)] = as_type<uint>(_497);
            int _539 = _521 + 40;
            uint _541 = uint(int(uint(_539) >> uint(2)));
            _37[int(_541)] = as_type<uint>(_485);
            int _543 = _521 + 44;
            uint _545 = uint(int(uint(_543) >> uint(2)));
            _37[int(_545)] = uint(_439);
            int _547 = _109 + 1;
            uint _549 = uint(int(uint(_521) >> uint(2)));
            _37[int(_549)] = as_type<uint>(_487);
            int _551 = _521 + 4;
            uint _553 = uint(int(uint(_551) >> uint(2)));
            _37[int(_553)] = as_type<uint>(_523);
            int _555 = _521 + 8;
            uint _557 = uint(int(uint(_555) >> uint(2)));
            _37[int(_557)] = as_type<uint>(_527);
            int _559 = _521 + 12;
            uint _561 = uint(int(uint(_559) >> uint(2)));
            _37[int(_561)] = uint(_441);
            bool _563 = uint(_547) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _565 = _521 + 16;
            uint _567 = uint(int(uint(_565) >> uint(2)));
            _37[int(_567)] = as_type<uint>(_489);
            int _569 = _521 + 20;
            uint _571 = uint(int(uint(_569) >> uint(2)));
            _37[int(_571)] = as_type<uint>(_525);
            int _573 = _521 + 24;
            uint _575 = uint(int(uint(_573) >> uint(2)));
            _37[int(_575)] = as_type<uint>(_529);
            int _577 = _521 + 28;
            uint _579 = uint(int(uint(_577) >> uint(2)));
            _37[int(_579)] = uint(_443);
            _107 = !_563;
            _89 = _547;
            _91 = _501;
            _93 = _513;
            _95 = _435;
            _97 = _437;
            _99 = _439;
            _101 = _441;
            _103 = _443;
            _105 = _445;
        } while (_107);
    }
    bool _581 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _583 = !_581;
    if (!_583)
    {
        int _585 = 1;
        bool _587;
        do
        {
            int _589 = _585;
            int _591 = _589 * 112;
            int _593 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _595 = _593 + _589;
            int _597 = _589 + 1;
            uint _599 = uint(int(uint(_591) >> uint(2)));
            uint _601 = uint(int(uint(int(_599)) >> uint(2)));
            int _603 = int(_599) & 3;
            float _605 = (*spvDescriptorSet0.cp_c6)._m0[int(_601)][_603];
            int _607 = _595 * 48;
            bool _609 = uint(_597) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _611 = _607 + 16;
            uint _613 = uint(int(uint(_611) >> uint(2)));
            float _615 = as_type<float>(_37[int(_613)]);
            int _617 = _607 + 20;
            uint _619 = uint(int(uint(_617) >> uint(2)));
            float _621 = as_type<float>(_37[int(_619)]);
            int _623 = _607 + 24;
            uint _625 = uint(int(uint(_623) >> uint(2)));
            float _627 = as_type<float>(_37[int(_625)]);
            int _629 = _607 + 28;
            uint _631 = uint(int(uint(_629) >> uint(2)));
            float _633 = as_type<float>(_37[int(_631)]);
            int _635 = _607 + 32;
            uint _637 = uint(int(uint(_635) >> uint(2)));
            float _639 = as_type<float>(_37[int(_637)]);
            int _641 = _607 + 36;
            uint _643 = uint(int(uint(_641) >> uint(2)));
            float _645 = as_type<float>(_37[int(_643)]);
            int _647 = _607 + 40;
            uint _649 = uint(int(uint(_647) >> uint(2)));
            float _651 = as_type<float>(_37[int(_649)]);
            int _653 = _607 + 44;
            uint _655 = uint(int(uint(_653) >> uint(2)));
            float _657 = as_type<float>(_37[int(_655)]);
            int _659 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _661 = _659 + as_type<int>(_605);
            int _663 = _661 * 48;
            uint _665 = uint(int(uint(_607) >> uint(2)));
            float _667 = as_type<float>(_37[int(_665)]);
            int _669 = _607 + 4;
            uint _671 = uint(int(uint(_669) >> uint(2)));
            float _673 = as_type<float>(_37[int(_671)]);
            int _675 = _607 + 8;
            uint _677 = uint(int(uint(_675) >> uint(2)));
            float _679 = as_type<float>(_37[int(_677)]);
            int _681 = _607 + 12;
            uint _683 = uint(int(uint(_681) >> uint(2)));
            float _685 = as_type<float>(_37[int(_683)]);
            uint _687 = uint(int(uint(_663) >> uint(2)));
            float _689 = as_type<float>(_37[int(_687)]);
            int _691 = _663 + 4;
            uint _693 = uint(int(uint(_691) >> uint(2)));
            float _695 = as_type<float>(_37[int(_693)]);
            int _697 = _663 + 8;
            uint _699 = uint(int(uint(_697) >> uint(2)));
            float _701 = as_type<float>(_37[int(_699)]);
            int _703 = _663 + 12;
            uint _705 = uint(int(uint(_703) >> uint(2)));
            float _707 = as_type<float>(_37[int(_705)]);
            int _709 = _663 + 16;
            uint _711 = uint(int(uint(_709) >> uint(2)));
            float _713 = as_type<float>(_37[int(_711)]);
            int _715 = _663 + 20;
            uint _717 = uint(int(uint(_715) >> uint(2)));
            float _719 = as_type<float>(_37[int(_717)]);
            int _721 = _663 + 24;
            uint _723 = uint(int(uint(_721) >> uint(2)));
            float _725 = as_type<float>(_37[int(_723)]);
            int _727 = _663 + 28;
            uint _729 = uint(int(uint(_727) >> uint(2)));
            float _731 = as_type<float>(_37[int(_729)]);
            int _733 = _663 + 32;
            uint _735 = uint(int(uint(_733) >> uint(2)));
            float _737 = as_type<float>(_37[int(_735)]);
            int _739 = _663 + 36;
            uint _741 = uint(int(uint(_739) >> uint(2)));
            float _743 = as_type<float>(_37[int(_741)]);
            int _745 = _663 + 40;
            uint _747 = uint(int(uint(_745) >> uint(2)));
            float _749 = as_type<float>(_37[int(_747)]);
            int _751 = _663 + 44;
            uint _753 = uint(int(uint(_751) >> uint(2)));
            float _755 = as_type<float>(_37[int(_753)]);
            float _757 = _633 * _695;
            float _759 = _621 * _695;
            float _761 = _615 * _695;
            float _763 = _627 * _695;
            float _765 = fma(_685, _689, _757);
            float _767 = fma(_673, _689, _759);
            float _769 = fma(_667, _689, _761);
            float _771 = fma(_679, _689, _763);
            float _773 = fma(_657, _701, _765);
            float _775 = fma(_645, _701, _767);
            float _777 = _621 * _719;
            float _779 = _615 * _719;
            float _781 = _707 + _773;
            float _783 = _633 * _719;
            float _785 = _627 * _719;
            float _787 = fma(_673, _713, _777);
            float _789 = fma(_639, _701, _769);
            float _791 = fma(_685, _713, _783);
            float _793 = fma(_679, _713, _785);
            float _795 = fma(_645, _725, _787);
            float _797 = _633 * _743;
            float _799 = _615 * _743;
            float _801 = _621 * _743;
            float _803 = _627 * _743;
            float _805 = fma(_685, _737, _797);
            float _807 = fma(_667, _713, _779);
            float _809 = fma(_657, _725, _791);
            float _811 = fma(_667, _737, _799);
            float _813 = fma(_673, _737, _801);
            float _815 = fma(_679, _737, _803);
            float _817 = fma(_657, _749, _805);
            float _819 = fma(_639, _725, _807);
            float _821 = fma(_651, _701, _771);
            float _823 = fma(_651, _725, _793);
            float _825 = _731 + _809;
            float _827 = fma(_639, _749, _811);
            float _829 = fma(_645, _749, _813);
            float _831 = fma(_651, _749, _815);
            float _833 = _755 + _817;
            uint _835 = uint(int(uint(_607) >> uint(2)));
            _37[int(_835)] = as_type<uint>(_789);
            int _837 = _607 + 4;
            uint _839 = uint(int(uint(_837) >> uint(2)));
            _37[int(_839)] = as_type<uint>(_775);
            int _841 = _607 + 8;
            uint _843 = uint(int(uint(_841) >> uint(2)));
            _37[int(_843)] = as_type<uint>(_821);
            int _845 = _607 + 12;
            uint _847 = uint(int(uint(_845) >> uint(2)));
            _37[int(_847)] = as_type<uint>(_781);
            int _849 = _607 + 16;
            uint _851 = uint(int(uint(_849) >> uint(2)));
            _37[int(_851)] = as_type<uint>(_819);
            int _853 = _607 + 20;
            uint _855 = uint(int(uint(_853) >> uint(2)));
            _37[int(_855)] = as_type<uint>(_795);
            int _857 = _607 + 24;
            uint _859 = uint(int(uint(_857) >> uint(2)));
            _37[int(_859)] = as_type<uint>(_823);
            int _861 = _607 + 28;
            uint _863 = uint(int(uint(_861) >> uint(2)));
            _37[int(_863)] = as_type<uint>(_825);
            int _865 = _607 + 32;
            uint _867 = uint(int(uint(_865) >> uint(2)));
            _37[int(_867)] = as_type<uint>(_827);
            int _869 = _607 + 36;
            uint _871 = uint(int(uint(_869) >> uint(2)));
            _37[int(_871)] = as_type<uint>(_829);
            int _873 = _607 + 40;
            uint _875 = uint(int(uint(_873) >> uint(2)));
            _37[int(_875)] = as_type<uint>(_831);
            int _877 = _607 + 44;
            uint _879 = uint(int(uint(_877) >> uint(2)));
            _37[int(_879)] = as_type<uint>(_833);
            _587 = !_609;
            _585 = _597;
        } while (_587);
    }
    if (!_70)
    {
        return;
    }
    int _881 = 0;
    bool _883;
    do
    {
        int _885 = _881;
        int _887 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _889 = _887 + _885;
        int _891 = _885 * 112;
        int _893 = _889 * 48;
        int _895 = _891 + 80;
        uint _897 = uint(int(uint(_895) >> uint(2)));
        uint _899 = uint(int(uint(int(_897)) >> uint(2)));
        int _901 = int(_897) & 3;
        float _903 = (*spvDescriptorSet0.cp_c6)._m0[int(_899)][_901];
        int _905 = int(_897) + 1;
        uint _907 = uint(int(uint(_905) >> uint(2)));
        int _909 = _905 & 3;
        float _911 = (*spvDescriptorSet0.cp_c6)._m0[int(_907)][_909];
        uint _913 = uint(int(uint(_893) >> uint(2)));
        float _915 = as_type<float>(_37[int(_913)]);
        int _917 = _893 + 4;
        uint _919 = uint(int(uint(_917) >> uint(2)));
        float _921 = as_type<float>(_37[int(_919)]);
        int _923 = _893 + 8;
        uint _925 = uint(int(uint(_923) >> uint(2)));
        float _927 = as_type<float>(_37[int(_925)]);
        int _929 = _893 + 12;
        uint _931 = uint(int(uint(_929) >> uint(2)));
        float _933 = as_type<float>(_37[int(_931)]);
        int _935 = _893 + 16;
        uint _937 = uint(int(uint(_935) >> uint(2)));
        float _939 = as_type<float>(_37[int(_937)]);
        int _941 = _893 + 20;
        uint _943 = uint(int(uint(_941) >> uint(2)));
        float _945 = as_type<float>(_37[int(_943)]);
        int _947 = _893 + 24;
        uint _949 = uint(int(uint(_947) >> uint(2)));
        float _951 = as_type<float>(_37[int(_949)]);
        int _953 = _893 + 28;
        uint _955 = uint(int(uint(_953) >> uint(2)));
        float _957 = as_type<float>(_37[int(_955)]);
        int _959 = _891 + 88;
        uint _961 = uint(int(uint(_959) >> uint(2)));
        uint _963 = uint(int(uint(int(_961)) >> uint(2)));
        int _965 = int(_961) & 3;
        float _967 = (*spvDescriptorSet0.cp_c6)._m0[int(_963)][_965];
        int _969 = int(_961) + 1;
        uint _971 = uint(int(uint(_969) >> uint(2)));
        int _973 = _969 & 3;
        float _975 = (*spvDescriptorSet0.cp_c6)._m0[int(_971)][_973];
        int _977 = _893 + 32;
        uint _979 = uint(int(uint(_977) >> uint(2)));
        float _981 = as_type<float>(_37[int(_979)]);
        int _983 = _893 + 36;
        uint _985 = uint(int(uint(_983) >> uint(2)));
        float _987 = as_type<float>(_37[int(_985)]);
        int _989 = _893 + 40;
        uint _991 = uint(int(uint(_989) >> uint(2)));
        float _993 = as_type<float>(_37[int(_991)]);
        int _995 = _893 + 44;
        uint _997 = uint(int(uint(_995) >> uint(2)));
        float _999 = as_type<float>(_37[int(_997)]);
        int _1001 = _891 + 64;
        uint _1003 = uint(int(uint(_1001) >> uint(2)));
        uint _1005 = uint(int(uint(int(_1003)) >> uint(2)));
        int _1007 = int(_1003) & 3;
        float _1009 = (*spvDescriptorSet0.cp_c6)._m0[int(_1005)][_1007];
        int _1011 = int(_1003) + 1;
        uint _1013 = uint(int(uint(_1011) >> uint(2)));
        int _1015 = _1011 & 3;
        float _1017 = (*spvDescriptorSet0.cp_c6)._m0[int(_1013)][_1015];
        int _1019 = _891 + 72;
        uint _1021 = uint(int(uint(_1019) >> uint(2)));
        uint _1023 = uint(int(uint(int(_1021)) >> uint(2)));
        int _1025 = int(_1021) & 3;
        float _1027 = (*spvDescriptorSet0.cp_c6)._m0[int(_1023)][_1025];
        int _1029 = int(_1021) + 1;
        uint _1031 = uint(int(uint(_1029) >> uint(2)));
        int _1033 = _1029 & 3;
        float _1035 = (*spvDescriptorSet0.cp_c6)._m0[int(_1031)][_1033];
        int _1037 = _891 + 104;
        uint _1039 = uint(int(uint(_1037) >> uint(2)));
        uint _1041 = uint(int(uint(int(_1039)) >> uint(2)));
        int _1043 = int(_1039) & 3;
        float _1045 = (*spvDescriptorSet0.cp_c6)._m0[int(_1041)][_1043];
        int _1047 = int(_1039) + 1;
        uint _1049 = uint(int(uint(_1047) >> uint(2)));
        int _1051 = _1047 & 3;
        float _1053 = (*spvDescriptorSet0.cp_c6)._m0[int(_1049)][_1051];
        int _1055 = _891 + 96;
        uint _1057 = uint(int(uint(_1055) >> uint(2)));
        uint _1059 = uint(int(uint(int(_1057)) >> uint(2)));
        int _1061 = int(_1057) & 3;
        float _1063 = (*spvDescriptorSet0.cp_c6)._m0[int(_1059)][_1061];
        int _1065 = int(_1057) + 1;
        uint _1067 = uint(int(uint(_1065) >> uint(2)));
        int _1069 = _1065 & 3;
        float _1071 = (*spvDescriptorSet0.cp_c6)._m0[int(_1067)][_1069];
        float _1073 = _921 * _903;
        float _1075 = _921 * _911;
        float _1077 = _921 * _967;
        float _1079 = _921 * _975;
        float _1081 = fma(_915, _1009, _1073);
        float _1083 = fma(_915, _1017, _1075);
        float _1085 = fma(_915, _1027, _1077);
        float _1087 = fma(_915, _1035, _1079);
        float _1089 = _945 * _903;
        float _1091 = _945 * _911;
        float _1093 = _945 * _967;
        float _1095 = _945 * _975;
        float _1097 = _987 * _903;
        float _1099 = fma(_939, _1009, _1089);
        float _1101 = fma(_939, _1017, _1091);
        float _1103 = fma(_939, _1027, _1093);
        uint _1105 = uint(int(uint(_74) >> uint(2)));
        uint _1107 = uint(int(uint(int(_1105)) >> uint(2)));
        int _1109 = int(_1105) & 3;
        float _1111 = (*spvDescriptorSet0.cp_c4)._m0[int(_1107)][_1109];
        float _1113 = fma(_939, _1035, _1095);
        float _1115 = _987 * _911;
        float _1117 = _987 * _967;
        float _1119 = _987 * _975;
        float _1121 = fma(_981, _1009, _1097);
        float _1123 = fma(_981, _1017, _1115);
        float _1125 = fma(_981, _1027, _1117);
        int _1127 = _891 + 16;
        uint _1129 = uint(int(uint(_1127) >> uint(2)));
        uint _1131 = uint(int(uint(int(_1129)) >> uint(2)));
        int _1133 = int(_1129) & 3;
        float _1135 = (*spvDescriptorSet0.cp_c6)._m0[int(_1131)][_1133];
        int _1137 = int(_1129) + 1;
        uint _1139 = uint(int(uint(_1137) >> uint(2)));
        int _1141 = _1137 & 3;
        float _1143 = (*spvDescriptorSet0.cp_c6)._m0[int(_1139)][_1141];
        float _1145 = fma(_981, _1035, _1119);
        float _1147 = fma(_951, _1053, _1113);
        float _1149 = fma(_927, _1063, _1081);
        float _1151 = fma(_927, _1071, _1083);
        float _1153 = fma(_927, _1045, _1085);
        float _1155 = fma(_927, _1053, _1087);
        float _1157 = fma(_951, _1063, _1099);
        int _1159 = _891 + 24;
        uint _1161 = uint(int(uint(_1159) >> uint(2)));
        uint _1163 = uint(int(uint(int(_1161)) >> uint(2)));
        int _1165 = int(_1161) & 3;
        float _1167 = (*spvDescriptorSet0.cp_c6)._m0[int(_1163)][_1165];
        int _1169 = int(_1161) + 1;
        uint _1171 = uint(int(uint(_1169) >> uint(2)));
        int _1173 = _1169 & 3;
        float _1175 = (*spvDescriptorSet0.cp_c6)._m0[int(_1171)][_1173];
        float _1177 = fma(_951, _1071, _1101);
        float _1179 = fma(_951, _1045, _1103);
        float _1181 = fma(_993, _1063, _1121);
        float _1183 = fma(_993, _1071, _1123);
        float _1185 = fma(_993, _1053, _1145);
        float _1187 = fma(_993, _1045, _1125);
        float _1189 = _957 + _1147;
        int _1191 = _891 + 32;
        uint _1193 = uint(int(uint(_1191) >> uint(2)));
        uint _1195 = uint(int(uint(int(_1193)) >> uint(2)));
        int _1197 = int(_1193) & 3;
        float _1199 = (*spvDescriptorSet0.cp_c6)._m0[int(_1195)][_1197];
        int _1201 = int(_1193) + 1;
        uint _1203 = uint(int(uint(_1201) >> uint(2)));
        int _1205 = _1201 & 3;
        float _1207 = (*spvDescriptorSet0.cp_c6)._m0[int(_1203)][_1205];
        float _1209 = _999 + _1185;
        float _1211 = _933 + _1155;
        int _1213 = _891 + 48;
        uint _1215 = uint(int(uint(_1213) >> uint(2)));
        uint _1217 = uint(int(uint(int(_1215)) >> uint(2)));
        int _1219 = int(_1215) & 3;
        float _1221 = (*spvDescriptorSet0.cp_c6)._m0[int(_1217)][_1219];
        int _1223 = int(_1215) + 1;
        uint _1225 = uint(int(uint(_1223) >> uint(2)));
        int _1227 = _1223 & 3;
        float _1229 = (*spvDescriptorSet0.cp_c6)._m0[int(_1225)][_1227];
        float _1231 = _1157 * _1143;
        float _1233 = _1177 * _1143;
        float _1235 = _1189 * _1143;
        float _1237 = _1179 * _1143;
        float _1239 = fma(_1149, _1135, _1231);
        float _1241 = fma(_1151, _1135, _1233);
        float _1243 = fma(_1211, _1135, _1235);
        float _1245 = fma(_1153, _1135, _1237);
        int _1247 = _891 + 40;
        uint _1249 = uint(int(uint(_1247) >> uint(2)));
        uint _1251 = uint(int(uint(int(_1249)) >> uint(2)));
        int _1253 = int(_1249) & 3;
        float _1255 = (*spvDescriptorSet0.cp_c6)._m0[int(_1251)][_1253];
        int _1257 = int(_1249) + 1;
        uint _1259 = uint(int(uint(_1257) >> uint(2)));
        int _1261 = _1257 & 3;
        float _1263 = (*spvDescriptorSet0.cp_c6)._m0[int(_1259)][_1261];
        float _1265 = fma(_1181, _1167, _1239);
        float _1267 = fma(_1209, _1167, _1243);
        float _1269 = fma(_1183, _1167, _1241);
        float _1271 = fma(_1187, _1167, _1245);
        float _1273 = _1267 + _1175;
        float _1275 = _1189 * _1207;
        int _1277 = _891 + 56;
        uint _1279 = uint(int(uint(_1277) >> uint(2)));
        uint _1281 = uint(int(uint(int(_1279)) >> uint(2)));
        int _1283 = int(_1279) & 3;
        float _1285 = (*spvDescriptorSet0.cp_c6)._m0[int(_1281)][_1283];
        int _1287 = int(_1279) + 1;
        uint _1289 = uint(int(uint(_1287) >> uint(2)));
        int _1291 = _1287 & 3;
        float _1293 = (*spvDescriptorSet0.cp_c6)._m0[int(_1289)][_1291];
        float _1295 = _1157 * _1207;
        float _1297 = _1177 * _1207;
        int _1299 = as_type<int>(_1111) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1301 = _1299 + _885;
        int _1303 = _885 + 1;
        float _1305 = _1179 * _1207;
        float _1307 = fma(_1211, _1199, _1275);
        float _1309 = _1189 * _1229;
        float _1311 = _1157 * _1229;
        float _1313 = _1177 * _1229;
        float _1315 = fma(_1151, _1199, _1297);
        float _1317 = _1179 * _1229;
        float _1319 = fma(_1211, _1221, _1309);
        float _1321 = fma(_1149, _1221, _1311);
        int _1323 = _1301 * 48;
        bool _1325 = uint(_1303) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1327 = fma(_1151, _1221, _1313);
        float _1329 = fma(_1149, _1199, _1295);
        float _1331 = fma(_1153, _1199, _1305);
        float _1333 = fma(_1209, _1255, _1307);
        float _1335 = fma(_1153, _1221, _1317);
        float _1337 = fma(_1183, _1255, _1315);
        float _1339 = fma(_1181, _1255, _1329);
        float _1341 = fma(_1187, _1255, _1331);
        float _1343 = fma(_1209, _1285, _1319);
        float _1345 = fma(_1181, _1285, _1321);
        float _1347 = fma(_1183, _1285, _1327);
        int _1349 = _1323 + 16;
        float _1351 = _1333 + _1263;
        int _1353 = _1323 + 32;
        float _1355 = fma(_1187, _1285, _1335);
        float _1357 = _1343 + _1293;
        int _1359 = _1323 + 48;
        uint _1361 = uint(int(uint(_1349) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1361)] = as_type<uint>(_1265);
        int _1363 = _1349 + 4;
        uint _1365 = uint(int(uint(_1363) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1365)] = as_type<uint>(_1269);
        int _1367 = _1349 + 8;
        uint _1369 = uint(int(uint(_1367) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1369)] = as_type<uint>(_1271);
        int _1371 = _1349 + 12;
        uint _1373 = uint(int(uint(_1371) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1373)] = as_type<uint>(_1273);
        uint _1375 = uint(int(uint(_1353) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1375)] = as_type<uint>(_1339);
        int _1377 = _1353 + 4;
        uint _1379 = uint(int(uint(_1377) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1379)] = as_type<uint>(_1337);
        int _1381 = _1353 + 8;
        uint _1383 = uint(int(uint(_1381) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1383)] = as_type<uint>(_1341);
        int _1385 = _1353 + 12;
        uint _1387 = uint(int(uint(_1385) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1387)] = as_type<uint>(_1351);
        uint _1389 = uint(int(uint(_1359) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1389)] = as_type<uint>(_1345);
        int _1391 = _1359 + 4;
        uint _1393 = uint(int(uint(_1391) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1393)] = as_type<uint>(_1347);
        int _1395 = _1359 + 8;
        uint _1397 = uint(int(uint(_1395) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1397)] = as_type<uint>(_1355);
        int _1399 = _1359 + 12;
        uint _1401 = uint(int(uint(_1399) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1401)] = as_type<uint>(_1357);
        _883 = !_1325;
        _881 = _1303;
    } while (_883);
}

