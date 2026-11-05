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
int _54(thread const int& _3334, thread const int& _3335, constant _10& support_buffer)
{
    int _3338 = 1 + _3335;
    float _3340 = support_buffer._m5[_3338].x;
    bool _3342 = _3340 == 1.0;
    if (_3342)
    {
        return _3334;
    }
    float _3344 = float(_3334);
    float _3346 = _3344 * _3340;
    int _3348 = int(_3346);
    return _3348;
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
        int _93 = 0;
        float _95 = 0.0;
        float _97 = 0.0;
        float _99 = 0.0;
        int _101 = 0;
        float _103 = 0.0;
        bool _105;
        do
        {
            int _107 = _89;
            float _109 = _91;
            int _111 = _93;
            float _113 = _95;
            float _115 = _97;
            float _117 = _99;
            int _119 = _101;
            int _121 = as_type<int>(_103);
            int _123 = _87 + 32;
            uint _125 = uint(int(uint(_123) >> uint(2)));
            uint _127 = uint(int(uint(int(_125)) >> uint(2)));
            int _129 = int(_125) & 3;
            float _131 = (*spvDescriptorSet0.cp_c5)._m0[int(_127)][_129];
            int _133 = _107 & 31;
            bool _135 = _133 == 0;
            bool _137 = uint(_133) < 32u;
            int _139 = 32 - _133;
            int _141 = _133 - 32;
            int _143 = 1 << _133;
            uint _145 = uint(int(uint(0) >> uint(_139)));
            int _147 = _143 | int(_145);
            int _149 = _135 ? 1 : _147;
            bool _151 = uint(_141) < 32u;
            int _153 = 0 << _141;
            int _155 = _151 ? _153 : 0;
            float _157 = _137 ? as_type<float>(_149) : as_type<float>(_155);
            int _159 = as_type<int>(_157) & as_type<int>(_131);
            bool _161 = _159 != 0;
            float _163 = _109;
            float _165 = _117;
            float _167 = _157;
            float _169 = _131;
            int _171 = _119;
            int _173 = _121;
            float _175 = _113;
            float _177 = _115;
            int _179 = _111;
            if (!_161)
            {
                _163 = 0.0;
                _165 = 0.0;
            }
            float _181 = _163;
            float _183 = _165;
            float _185 = _183;
            float _187 = _181;
            if (!_161)
            {
                _167 = 0.0;
                _169 = 0.0;
            }
            float _189 = _167;
            float _191 = _169;
            float _193 = _189;
            float _195 = _191;
            if (!_161)
            {
                _171 = 0;
                _173 = 0;
            }
            int _197 = _171;
            int _199 = _173;
            int _201 = _197;
            int _203 = _199;
            if (!_161)
            {
                _175 = 0.0;
                _177 = 0.0;
            }
            float _205 = _175;
            float _207 = _177;
            float _209 = _205;
            float _211 = _207;
            if (!_161)
            {
                _179 = 0;
            }
            int _213 = _179;
            bool _215 = !_161;
            int _217 = _213;
            int _219 = _213;
            if (!_215)
            {
                uint _221 = uint(int(uint(_87) >> uint(2)));
                uint _223 = uint(int(uint(int(_221)) >> uint(2)));
                int _225 = int(_221) & 3;
                float _227 = (*spvDescriptorSet0.cp_c5)._m0[int(_223)][_225];
                int _229 = _107;
                int _231 = 0;
                int _233 = _54(_229, _231, (*spvDescriptorSet0.support_buffer));
                int _235 = as_type<int>(_227);
                int _237 = 0;
                int _239 = _54(_235, _237, (*spvDescriptorSet0.support_buffer));
                int3 _1484 = int3(_233, _239, 0);
                float3 _243 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1484.xy), uint(_1484.z), 0).xyz;
                float _245 = _243.x;
                float _247 = _243.y;
                float _249 = _243.z;
                int _251 = _107;
                int _253 = 0;
                int _255 = _54(_251, _253, (*spvDescriptorSet0.support_buffer));
                int _257 = as_type<int>(_227);
                int _259 = 0;
                int _261 = _54(_257, _259, (*spvDescriptorSet0.support_buffer));
                int3 _1502 = int3(_255, _261, 2);
                float3 _263 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1502.xy), uint(_1502.z), 0).xyz;
                float _265 = _263.x;
                float _267 = _263.y;
                float _269 = _263.z;
                int _271 = _107;
                int _273 = 0;
                int _275 = _54(_271, _273, (*spvDescriptorSet0.support_buffer));
                int _277 = as_type<int>(_227);
                int _279 = 0;
                int _281 = _54(_277, _279, (*spvDescriptorSet0.support_buffer));
                int3 _1520 = int3(_275, _281, 1);
                float3 _283 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1520.xy), uint(_1520.z), 0).xyz;
                float _285 = _283.x;
                float _287 = _283.y;
                float _289 = _283.z;
                _217 = as_type<int>(_269);
                _209 = _285;
                _185 = _289;
                _211 = _287;
                _201 = as_type<int>(_265);
                _193 = _245;
                _187 = _249;
                _195 = _247;
                _203 = as_type<int>(_267);
                _219 = as_type<int>(_269);
            }
            int _291 = _217;
            float _293 = _209;
            float _295 = _185;
            float _297 = _211;
            int _299 = _201;
            float _301 = _193;
            float _303 = _187;
            float _305 = _195;
            int _307 = _203;
            int _309 = _219;
            float _311 = _293 * 0.15915493667125701904296875;
            float _313 = _295 * 0.15915493667125701904296875;
            float _315 = _297 * 0.15915493667125701904296875;
            float _317 = _311 * 6.283185482025146484375;
            float _319 = sin(_317);
            float _321 = _311 * 6.283185482025146484375;
            float _323 = cos(_321);
            float _325 = _313 * 6.283185482025146484375;
            float _327 = sin(_325);
            float _329 = _313 * 6.283185482025146484375;
            float _331 = cos(_329);
            float _333 = _315 * 6.283185482025146484375;
            float _335 = cos(_333);
            float _337 = _327 * _323;
            float _339 = _319 * _327;
            float _341 = _315 * 6.283185482025146484375;
            float _343 = sin(_341);
            float _345 = _323 * _331;
            float _347 = _323 * _335;
            float _349 = _319 * _335;
            float _351 = _335 * _301;
            float _353 = _319 * _331;
            float _355 = _347 * _303;
            float _357 = _349 * _305;
            float _359 = _331 * _351;
            float _361 = _319 * _343;
            float _363 = fma(_343, _345, _339);
            int _365 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _367 = _365 + _107;
            float _369 = -_343;
            float _371 = fma(_369, _301, -0.0);
            float _373 = fma(_327, _361, _345);
            float _375 = -_337;
            float _377 = fma(_331, _361, _375);
            float _379 = -_353;
            float _381 = fma(_343, _337, _379);
            float _383 = _363 * _303;
            float _385 = _327 * _351;
            float _387 = _377 * _305;
            float _389 = _373 * _305;
            float _391 = _381 * _303;
            int _393 = _367 * 48;
            int _395 = _107 + 1;
            int _397 = _393 + 32;
            uint _399 = uint(int(uint(_397) >> uint(2)));
            _37[int(_399)] = as_type<uint>(_371);
            int _401 = _393 + 36;
            uint _403 = uint(int(uint(_401) >> uint(2)));
            _37[int(_403)] = as_type<uint>(_357);
            int _405 = _393 + 40;
            uint _407 = uint(int(uint(_405) >> uint(2)));
            _37[int(_407)] = as_type<uint>(_355);
            int _409 = _393 + 44;
            uint _411 = uint(int(uint(_409) >> uint(2)));
            _37[int(_411)] = uint(_309);
            bool _413 = uint(_395) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            uint _415 = uint(int(uint(_393) >> uint(2)));
            _37[int(_415)] = as_type<uint>(_359);
            int _417 = _393 + 4;
            uint _419 = uint(int(uint(_417) >> uint(2)));
            _37[int(_419)] = as_type<uint>(_387);
            int _421 = _393 + 8;
            uint _423 = uint(int(uint(_421) >> uint(2)));
            _37[int(_423)] = as_type<uint>(_383);
            int _425 = _393 + 12;
            uint _427 = uint(int(uint(_425) >> uint(2)));
            _37[int(_427)] = uint(_299);
            int _429 = _393 + 16;
            uint _431 = uint(int(uint(_429) >> uint(2)));
            _37[int(_431)] = as_type<uint>(_385);
            int _433 = _393 + 20;
            uint _435 = uint(int(uint(_433) >> uint(2)));
            _37[int(_435)] = as_type<uint>(_389);
            int _437 = _393 + 24;
            uint _439 = uint(int(uint(_437) >> uint(2)));
            _37[int(_439)] = as_type<uint>(_391);
            int _441 = _393 + 28;
            uint _443 = uint(int(uint(_441) >> uint(2)));
            _37[int(_443)] = uint(_307);
            _105 = !_413;
            _89 = _395;
            _91 = as_type<float>(_307);
            _93 = _291;
            _95 = as_type<float>(_393);
            _97 = _343;
            _99 = _391;
            _101 = _299;
            _103 = as_type<float>(_307);
        } while (_105);
    }
    bool _445 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _447 = !_445;
    if (!_447)
    {
        int _449 = 1;
        bool _451;
        do
        {
            int _453 = _449;
            int _455 = _453 * 112;
            int _457 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _459 = _457 + _453;
            int _461 = _453 + 1;
            uint _463 = uint(int(uint(_455) >> uint(2)));
            uint _465 = uint(int(uint(int(_463)) >> uint(2)));
            int _467 = int(_463) & 3;
            float _469 = (*spvDescriptorSet0.cp_c6)._m0[int(_465)][_467];
            int _471 = _459 * 48;
            bool _473 = uint(_461) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _475 = _471 + 16;
            uint _477 = uint(int(uint(_475) >> uint(2)));
            float _479 = as_type<float>(_37[int(_477)]);
            int _481 = _471 + 20;
            uint _483 = uint(int(uint(_481) >> uint(2)));
            float _485 = as_type<float>(_37[int(_483)]);
            int _487 = _471 + 24;
            uint _489 = uint(int(uint(_487) >> uint(2)));
            float _491 = as_type<float>(_37[int(_489)]);
            int _493 = _471 + 28;
            uint _495 = uint(int(uint(_493) >> uint(2)));
            float _497 = as_type<float>(_37[int(_495)]);
            uint _499 = uint(int(uint(_471) >> uint(2)));
            float _501 = as_type<float>(_37[int(_499)]);
            int _503 = _471 + 4;
            uint _505 = uint(int(uint(_503) >> uint(2)));
            float _507 = as_type<float>(_37[int(_505)]);
            int _509 = _471 + 8;
            uint _511 = uint(int(uint(_509) >> uint(2)));
            float _513 = as_type<float>(_37[int(_511)]);
            int _515 = _471 + 12;
            uint _517 = uint(int(uint(_515) >> uint(2)));
            float _519 = as_type<float>(_37[int(_517)]);
            int _521 = _471 + 32;
            uint _523 = uint(int(uint(_521) >> uint(2)));
            float _525 = as_type<float>(_37[int(_523)]);
            int _527 = _471 + 36;
            uint _529 = uint(int(uint(_527) >> uint(2)));
            float _531 = as_type<float>(_37[int(_529)]);
            int _533 = _471 + 40;
            uint _535 = uint(int(uint(_533) >> uint(2)));
            float _537 = as_type<float>(_37[int(_535)]);
            int _539 = _471 + 44;
            uint _541 = uint(int(uint(_539) >> uint(2)));
            float _543 = as_type<float>(_37[int(_541)]);
            int _545 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _547 = _545 + as_type<int>(_469);
            int _549 = _547 * 48;
            uint _551 = uint(int(uint(_549) >> uint(2)));
            float _553 = as_type<float>(_37[int(_551)]);
            int _555 = _549 + 4;
            uint _557 = uint(int(uint(_555) >> uint(2)));
            float _559 = as_type<float>(_37[int(_557)]);
            int _561 = _549 + 8;
            uint _563 = uint(int(uint(_561) >> uint(2)));
            float _565 = as_type<float>(_37[int(_563)]);
            int _567 = _549 + 12;
            uint _569 = uint(int(uint(_567) >> uint(2)));
            float _571 = as_type<float>(_37[int(_569)]);
            int _573 = _549 + 16;
            uint _575 = uint(int(uint(_573) >> uint(2)));
            float _577 = as_type<float>(_37[int(_575)]);
            int _579 = _549 + 20;
            uint _581 = uint(int(uint(_579) >> uint(2)));
            float _583 = as_type<float>(_37[int(_581)]);
            int _585 = _549 + 24;
            uint _587 = uint(int(uint(_585) >> uint(2)));
            float _589 = as_type<float>(_37[int(_587)]);
            int _591 = _549 + 28;
            uint _593 = uint(int(uint(_591) >> uint(2)));
            float _595 = as_type<float>(_37[int(_593)]);
            int _597 = _549 + 32;
            uint _599 = uint(int(uint(_597) >> uint(2)));
            float _601 = as_type<float>(_37[int(_599)]);
            int _603 = _549 + 36;
            uint _605 = uint(int(uint(_603) >> uint(2)));
            float _607 = as_type<float>(_37[int(_605)]);
            int _609 = _549 + 40;
            uint _611 = uint(int(uint(_609) >> uint(2)));
            float _613 = as_type<float>(_37[int(_611)]);
            int _615 = _549 + 44;
            uint _617 = uint(int(uint(_615) >> uint(2)));
            float _619 = as_type<float>(_37[int(_617)]);
            float _621 = _497 * _559;
            float _623 = _485 * _559;
            float _625 = _479 * _559;
            float _627 = _491 * _559;
            float _629 = fma(_519, _553, _621);
            float _631 = fma(_507, _553, _623);
            float _633 = _479 * _583;
            float _635 = fma(_513, _553, _627);
            float _637 = fma(_543, _565, _629);
            float _639 = fma(_531, _565, _631);
            float _641 = _485 * _583;
            float _643 = fma(_501, _553, _625);
            float _645 = _571 + _637;
            float _647 = _497 * _583;
            float _649 = _491 * _583;
            float _651 = fma(_501, _577, _633);
            float _653 = fma(_507, _577, _641);
            float _655 = fma(_519, _577, _647);
            float _657 = fma(_525, _565, _643);
            float _659 = fma(_513, _577, _649);
            float _661 = fma(_525, _589, _651);
            float _663 = fma(_543, _589, _655);
            float _665 = fma(_531, _589, _653);
            float _667 = _479 * _607;
            float _669 = _485 * _607;
            float _671 = _595 + _663;
            float _673 = _497 * _607;
            float _675 = _491 * _607;
            float _677 = fma(_501, _601, _667);
            float _679 = fma(_507, _601, _669);
            float _681 = fma(_519, _601, _673);
            float _683 = fma(_513, _601, _675);
            float _685 = fma(_537, _565, _635);
            float _687 = fma(_537, _589, _659);
            float _689 = fma(_543, _613, _681);
            float _691 = fma(_525, _613, _677);
            float _693 = fma(_531, _613, _679);
            float _695 = fma(_537, _613, _683);
            float _697 = _619 + _689;
            uint _699 = uint(int(uint(_471) >> uint(2)));
            _37[int(_699)] = as_type<uint>(_657);
            int _701 = _471 + 4;
            uint _703 = uint(int(uint(_701) >> uint(2)));
            _37[int(_703)] = as_type<uint>(_639);
            int _705 = _471 + 8;
            uint _707 = uint(int(uint(_705) >> uint(2)));
            _37[int(_707)] = as_type<uint>(_685);
            int _709 = _471 + 12;
            uint _711 = uint(int(uint(_709) >> uint(2)));
            _37[int(_711)] = as_type<uint>(_645);
            int _713 = _471 + 16;
            uint _715 = uint(int(uint(_713) >> uint(2)));
            _37[int(_715)] = as_type<uint>(_661);
            int _717 = _471 + 20;
            uint _719 = uint(int(uint(_717) >> uint(2)));
            _37[int(_719)] = as_type<uint>(_665);
            int _721 = _471 + 24;
            uint _723 = uint(int(uint(_721) >> uint(2)));
            _37[int(_723)] = as_type<uint>(_687);
            int _725 = _471 + 28;
            uint _727 = uint(int(uint(_725) >> uint(2)));
            _37[int(_727)] = as_type<uint>(_671);
            int _729 = _471 + 32;
            uint _731 = uint(int(uint(_729) >> uint(2)));
            _37[int(_731)] = as_type<uint>(_691);
            int _733 = _471 + 36;
            uint _735 = uint(int(uint(_733) >> uint(2)));
            _37[int(_735)] = as_type<uint>(_693);
            int _737 = _471 + 40;
            uint _739 = uint(int(uint(_737) >> uint(2)));
            _37[int(_739)] = as_type<uint>(_695);
            int _741 = _471 + 44;
            uint _743 = uint(int(uint(_741) >> uint(2)));
            _37[int(_743)] = as_type<uint>(_697);
            _451 = !_473;
            _449 = _461;
        } while (_451);
    }
    if (!_70)
    {
        return;
    }
    int _745 = 0;
    bool _747;
    do
    {
        int _749 = _745;
        int _751 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _753 = _751 + _749;
        uint _755 = uint(int(uint(_74) >> uint(2)));
        uint _757 = uint(int(uint(int(_755)) >> uint(2)));
        int _759 = int(_755) & 3;
        float _761 = (*spvDescriptorSet0.cp_c4)._m0[int(_757)][_759];
        int _763 = _749 * 112;
        int _765 = _753 * 48;
        uint _767 = uint(int(uint(_765) >> uint(2)));
        float _769 = as_type<float>(_37[int(_767)]);
        int _771 = _765 + 4;
        uint _773 = uint(int(uint(_771) >> uint(2)));
        float _775 = as_type<float>(_37[int(_773)]);
        int _777 = _765 + 8;
        uint _779 = uint(int(uint(_777) >> uint(2)));
        float _781 = as_type<float>(_37[int(_779)]);
        int _783 = _765 + 12;
        uint _785 = uint(int(uint(_783) >> uint(2)));
        float _787 = as_type<float>(_37[int(_785)]);
        int _789 = _763 + 80;
        uint _791 = uint(int(uint(_789) >> uint(2)));
        uint _793 = uint(int(uint(int(_791)) >> uint(2)));
        int _795 = int(_791) & 3;
        float _797 = (*spvDescriptorSet0.cp_c6)._m0[int(_793)][_795];
        int _799 = int(_791) + 1;
        uint _801 = uint(int(uint(_799) >> uint(2)));
        int _803 = _799 & 3;
        float _805 = (*spvDescriptorSet0.cp_c6)._m0[int(_801)][_803];
        int _807 = _765 + 16;
        uint _809 = uint(int(uint(_807) >> uint(2)));
        float _811 = as_type<float>(_37[int(_809)]);
        int _813 = _765 + 20;
        uint _815 = uint(int(uint(_813) >> uint(2)));
        float _817 = as_type<float>(_37[int(_815)]);
        int _819 = _765 + 24;
        uint _821 = uint(int(uint(_819) >> uint(2)));
        float _823 = as_type<float>(_37[int(_821)]);
        int _825 = _765 + 28;
        uint _827 = uint(int(uint(_825) >> uint(2)));
        float _829 = as_type<float>(_37[int(_827)]);
        int _831 = _765 + 32;
        uint _833 = uint(int(uint(_831) >> uint(2)));
        float _835 = as_type<float>(_37[int(_833)]);
        int _837 = _765 + 36;
        uint _839 = uint(int(uint(_837) >> uint(2)));
        float _841 = as_type<float>(_37[int(_839)]);
        int _843 = _765 + 40;
        uint _845 = uint(int(uint(_843) >> uint(2)));
        float _847 = as_type<float>(_37[int(_845)]);
        int _849 = _765 + 44;
        uint _851 = uint(int(uint(_849) >> uint(2)));
        float _853 = as_type<float>(_37[int(_851)]);
        int _855 = _763 + 88;
        uint _857 = uint(int(uint(_855) >> uint(2)));
        uint _859 = uint(int(uint(int(_857)) >> uint(2)));
        int _861 = int(_857) & 3;
        float _863 = (*spvDescriptorSet0.cp_c6)._m0[int(_859)][_861];
        int _865 = int(_857) + 1;
        uint _867 = uint(int(uint(_865) >> uint(2)));
        int _869 = _865 & 3;
        float _871 = (*spvDescriptorSet0.cp_c6)._m0[int(_867)][_869];
        int _873 = _763 + 64;
        uint _875 = uint(int(uint(_873) >> uint(2)));
        uint _877 = uint(int(uint(int(_875)) >> uint(2)));
        int _879 = int(_875) & 3;
        float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
        int _883 = int(_875) + 1;
        uint _885 = uint(int(uint(_883) >> uint(2)));
        int _887 = _883 & 3;
        float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
        int _891 = _763 + 72;
        uint _893 = uint(int(uint(_891) >> uint(2)));
        uint _895 = uint(int(uint(int(_893)) >> uint(2)));
        int _897 = int(_893) & 3;
        float _899 = (*spvDescriptorSet0.cp_c6)._m0[int(_895)][_897];
        int _901 = int(_893) + 1;
        uint _903 = uint(int(uint(_901) >> uint(2)));
        int _905 = _901 & 3;
        float _907 = (*spvDescriptorSet0.cp_c6)._m0[int(_903)][_905];
        int _909 = _763 + 96;
        uint _911 = uint(int(uint(_909) >> uint(2)));
        uint _913 = uint(int(uint(int(_911)) >> uint(2)));
        int _915 = int(_911) & 3;
        float _917 = (*spvDescriptorSet0.cp_c6)._m0[int(_913)][_915];
        int _919 = int(_911) + 1;
        uint _921 = uint(int(uint(_919) >> uint(2)));
        int _923 = _919 & 3;
        float _925 = (*spvDescriptorSet0.cp_c6)._m0[int(_921)][_923];
        float _927 = _775 * _797;
        int _929 = _763 + 104;
        uint _931 = uint(int(uint(_929) >> uint(2)));
        uint _933 = uint(int(uint(int(_931)) >> uint(2)));
        int _935 = int(_931) & 3;
        float _937 = (*spvDescriptorSet0.cp_c6)._m0[int(_933)][_935];
        int _939 = int(_931) + 1;
        uint _941 = uint(int(uint(_939) >> uint(2)));
        int _943 = _939 & 3;
        float _945 = (*spvDescriptorSet0.cp_c6)._m0[int(_941)][_943];
        float _947 = _775 * _805;
        float _949 = _775 * _863;
        float _951 = _775 * _871;
        float _953 = fma(_769, _881, _927);
        float _955 = fma(_769, _889, _947);
        float _957 = _817 * _797;
        float _959 = _817 * _863;
        float _961 = fma(_769, _899, _949);
        float _963 = fma(_769, _907, _951);
        float _965 = _817 * _805;
        float _967 = _817 * _871;
        float _969 = fma(_811, _881, _957);
        float _971 = fma(_811, _899, _959);
        float _973 = fma(_811, _889, _965);
        float _975 = fma(_811, _907, _967);
        float _977 = _841 * _805;
        float _979 = _841 * _863;
        float _981 = _841 * _871;
        float _983 = _841 * _797;
        int _985 = _763 + 16;
        uint _987 = uint(int(uint(_985) >> uint(2)));
        uint _989 = uint(int(uint(int(_987)) >> uint(2)));
        int _991 = int(_987) & 3;
        float _993 = (*spvDescriptorSet0.cp_c6)._m0[int(_989)][_991];
        int _995 = int(_987) + 1;
        uint _997 = uint(int(uint(_995) >> uint(2)));
        int _999 = _995 & 3;
        float _1001 = (*spvDescriptorSet0.cp_c6)._m0[int(_997)][_999];
        float _1003 = fma(_835, _889, _977);
        float _1005 = fma(_835, _899, _979);
        float _1007 = fma(_835, _907, _981);
        float _1009 = fma(_781, _917, _953);
        float _1011 = fma(_781, _925, _955);
        float _1013 = fma(_781, _937, _961);
        float _1015 = fma(_781, _945, _963);
        int _1017 = _763 + 24;
        uint _1019 = uint(int(uint(_1017) >> uint(2)));
        uint _1021 = uint(int(uint(int(_1019)) >> uint(2)));
        int _1023 = int(_1019) & 3;
        float _1025 = (*spvDescriptorSet0.cp_c6)._m0[int(_1021)][_1023];
        int _1027 = int(_1019) + 1;
        uint _1029 = uint(int(uint(_1027) >> uint(2)));
        int _1031 = _1027 & 3;
        float _1033 = (*spvDescriptorSet0.cp_c6)._m0[int(_1029)][_1031];
        float _1035 = fma(_823, _917, _969);
        float _1037 = fma(_823, _925, _973);
        float _1039 = fma(_823, _937, _971);
        float _1041 = fma(_823, _945, _975);
        float _1043 = fma(_847, _945, _1007);
        float _1045 = fma(_847, _937, _1005);
        float _1047 = fma(_835, _881, _983);
        int _1049 = _763 + 32;
        uint _1051 = uint(int(uint(_1049) >> uint(2)));
        uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
        int _1055 = int(_1051) & 3;
        float _1057 = (*spvDescriptorSet0.cp_c6)._m0[int(_1053)][_1055];
        int _1059 = int(_1051) + 1;
        uint _1061 = uint(int(uint(_1059) >> uint(2)));
        int _1063 = _1059 & 3;
        float _1065 = (*spvDescriptorSet0.cp_c6)._m0[int(_1061)][_1063];
        float _1067 = _829 + _1041;
        float _1069 = _787 + _1015;
        float _1071 = _853 + _1043;
        float _1073 = fma(_847, _917, _1047);
        float _1075 = fma(_847, _925, _1003);
        int _1077 = as_type<int>(_761) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1079 = _1077 + _749;
        int _1081 = _749 + 1;
        int _1083 = _763 + 48;
        uint _1085 = uint(int(uint(_1083) >> uint(2)));
        uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
        int _1089 = int(_1085) & 3;
        float _1091 = (*spvDescriptorSet0.cp_c6)._m0[int(_1087)][_1089];
        int _1093 = int(_1085) + 1;
        uint _1095 = uint(int(uint(_1093) >> uint(2)));
        int _1097 = _1093 & 3;
        float _1099 = (*spvDescriptorSet0.cp_c6)._m0[int(_1095)][_1097];
        float _1101 = _1067 * _1001;
        float _1103 = _1035 * _1001;
        float _1105 = _1037 * _1001;
        float _1107 = _1039 * _1001;
        float _1109 = fma(_1069, _993, _1101);
        float _1111 = fma(_1009, _993, _1103);
        float _1113 = fma(_1011, _993, _1105);
        int _1115 = _763 + 40;
        uint _1117 = uint(int(uint(_1115) >> uint(2)));
        uint _1119 = uint(int(uint(int(_1117)) >> uint(2)));
        int _1121 = int(_1117) & 3;
        float _1123 = (*spvDescriptorSet0.cp_c6)._m0[int(_1119)][_1121];
        int _1125 = int(_1117) + 1;
        uint _1127 = uint(int(uint(_1125) >> uint(2)));
        int _1129 = _1125 & 3;
        float _1131 = (*spvDescriptorSet0.cp_c6)._m0[int(_1127)][_1129];
        float _1133 = fma(_1071, _1025, _1109);
        float _1135 = fma(_1013, _993, _1107);
        float _1137 = fma(_1073, _1025, _1111);
        float _1139 = fma(_1075, _1025, _1113);
        float _1141 = _1133 + _1033;
        float _1143 = fma(_1045, _1025, _1135);
        int _1145 = _1079 * 48;
        int _1147 = _763 + 56;
        uint _1149 = uint(int(uint(_1147) >> uint(2)));
        uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
        int _1153 = int(_1149) & 3;
        float _1155 = (*spvDescriptorSet0.cp_c6)._m0[int(_1151)][_1153];
        int _1157 = int(_1149) + 1;
        uint _1159 = uint(int(uint(_1157) >> uint(2)));
        int _1161 = _1157 & 3;
        float _1163 = (*spvDescriptorSet0.cp_c6)._m0[int(_1159)][_1161];
        float _1165 = _1067 * _1065;
        float _1167 = _1035 * _1065;
        float _1169 = _1037 * _1065;
        float _1171 = _1039 * _1065;
        float _1173 = fma(_1069, _1057, _1165);
        bool _1175 = uint(_1081) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1177 = fma(_1011, _1057, _1169);
        float _1179 = _1067 * _1099;
        float _1181 = _1035 * _1099;
        float _1183 = _1037 * _1099;
        float _1185 = _1039 * _1099;
        float _1187 = fma(_1069, _1091, _1179);
        float _1189 = fma(_1009, _1091, _1181);
        float _1191 = fma(_1009, _1057, _1167);
        float _1193 = fma(_1013, _1057, _1171);
        float _1195 = fma(_1011, _1091, _1183);
        float _1197 = fma(_1071, _1123, _1173);
        float _1199 = fma(_1013, _1091, _1185);
        float _1201 = fma(_1075, _1123, _1177);
        float _1203 = fma(_1073, _1123, _1191);
        float _1205 = fma(_1045, _1123, _1193);
        float _1207 = _1197 + _1131;
        int _1209 = _1145 + 32;
        float _1211 = fma(_1071, _1155, _1187);
        float _1213 = fma(_1073, _1155, _1189);
        int _1215 = _1145 + 16;
        float _1217 = fma(_1075, _1155, _1195);
        float _1219 = fma(_1045, _1155, _1199);
        float _1221 = _1211 + _1163;
        int _1223 = _1145 + 48;
        uint _1225 = uint(int(uint(_1215) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1225)] = as_type<uint>(_1137);
        int _1227 = _1215 + 4;
        uint _1229 = uint(int(uint(_1227) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1229)] = as_type<uint>(_1139);
        int _1231 = _1215 + 8;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1233)] = as_type<uint>(_1143);
        int _1235 = _1215 + 12;
        uint _1237 = uint(int(uint(_1235) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1237)] = as_type<uint>(_1141);
        uint _1239 = uint(int(uint(_1209) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1239)] = as_type<uint>(_1203);
        int _1241 = _1209 + 4;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1243)] = as_type<uint>(_1201);
        int _1245 = _1209 + 8;
        uint _1247 = uint(int(uint(_1245) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1247)] = as_type<uint>(_1205);
        int _1249 = _1209 + 12;
        uint _1251 = uint(int(uint(_1249) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1251)] = as_type<uint>(_1207);
        uint _1253 = uint(int(uint(_1223) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1253)] = as_type<uint>(_1213);
        int _1255 = _1223 + 4;
        uint _1257 = uint(int(uint(_1255) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1257)] = as_type<uint>(_1217);
        int _1259 = _1223 + 8;
        uint _1261 = uint(int(uint(_1259) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1261)] = as_type<uint>(_1219);
        int _1263 = _1223 + 12;
        uint _1265 = uint(int(uint(_1263) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1265)] = as_type<uint>(_1221);
        _747 = !_1175;
        _745 = _1081;
    } while (_747);
}

