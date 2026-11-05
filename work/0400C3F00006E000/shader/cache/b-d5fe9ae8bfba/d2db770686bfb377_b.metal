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
int _54(thread const int& _3198, thread const int& _3199, constant _10& support_buffer)
{
    int _3202 = 1 + _3199;
    float _3204 = support_buffer._m5[_3202].x;
    bool _3206 = _3204 == 1.0;
    if (_3206)
    {
        return _3198;
    }
    float _3208 = float(_3198);
    float _3210 = _3208 * _3204;
    int _3212 = int(_3210);
    return _3212;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _799 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = _64 & 31;
    bool _72 = _70 == 0;
    bool _74 = uint(_70) < 32u;
    int _76 = 32 - _70;
    int _78 = _70 - 32;
    int _80 = 1 << _70;
    uint _83 = uint(int(uint(0) >> uint(_76)));
    int _85 = _80 | int(_83);
    int _87 = _72 ? 1 : _85;
    bool _89 = uint(_78) < 32u;
    int _91 = 0 << _78;
    int _93 = _89 ? _91 : 0;
    float _95 = _74 ? as_type<float>(_87) : as_type<float>(_93);
    int _97 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _99 = _97 + 32;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.cp_c5)._m0[int(_103)][_105];
    int _109 = as_type<int>(_95) & as_type<int>(_107);
    bool _111 = _109 != 0;
    float _113 = 0.0;
    float _115 = 0.0;
    float _117 = _95;
    if (!_111)
    {
        _113 = 0.0;
        _115 = 0.0;
    }
    float _119 = _113;
    float _121 = _115;
    float _123 = 0.0;
    float _125 = 0.0;
    float _127 = _119;
    float _129 = _121;
    if (!_111)
    {
        _123 = 0.0;
        _125 = 0.0;
    }
    float _131 = _123;
    float _133 = _125;
    float _135 = 0.0;
    float _137 = 0.0;
    float _139 = _133;
    float _141 = _131;
    if (!_111)
    {
        _135 = 0.0;
        _137 = 0.0;
    }
    float _143 = _135;
    float _145 = _137;
    float _147 = 0.0;
    float _149 = _143;
    float _151 = _145;
    if (!_111)
    {
        _117 = 0.0;
        _147 = 0.0;
    }
    float _153 = _117;
    float _155 = _147;
    float _157 = 0.0;
    float _159 = _153;
    float _161 = _155;
    if (!_111)
    {
        _157 = 0.0;
    }
    float _163 = _157;
    bool _165 = !_111;
    float _167 = _163;
    if (!_165)
    {
        uint _169 = uint(int(uint(_97) >> uint(2)));
        uint _171 = uint(int(uint(int(_169)) >> uint(2)));
        int _173 = int(_169) & 3;
        float _175 = (*spvDescriptorSet0.cp_c5)._m0[int(_171)][_173];
        int _177 = int(_169) + 1;
        uint _179 = uint(int(uint(_177) >> uint(2)));
        int _181 = _177 & 3;
        float _183 = (*spvDescriptorSet0.cp_c5)._m0[int(_179)][_181];
        int _185 = _64;
        int _187 = 0;
        int _189 = _54(_185, _187, (*spvDescriptorSet0.support_buffer));
        int _191 = as_type<int>(_175);
        int _193 = 0;
        int _195 = _54(_191, _193, (*spvDescriptorSet0.support_buffer));
        int3 _1431 = int3(_189, _195, 1);
        float3 _199 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1431.xy), uint(_1431.z), 0).xyz;
        float _201 = _199.x;
        float _203 = _199.y;
        float _205 = _199.z;
        int _207 = _64;
        int _209 = 0;
        int _211 = _54(_207, _209, (*spvDescriptorSet0.support_buffer));
        int _213 = as_type<int>(_183);
        int _215 = 0;
        int _217 = _54(_213, _215, (*spvDescriptorSet0.support_buffer));
        int3 _1449 = int3(_211, _217, 1);
        float3 _219 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1449.xy), uint(_1449.z), 0).xyz;
        float _221 = _219.x;
        float _223 = _219.y;
        float _225 = _219.z;
        int _227 = _64;
        int _229 = 0;
        int _231 = _54(_227, _229, (*spvDescriptorSet0.support_buffer));
        int _233 = as_type<int>(_175);
        int _235 = 0;
        int _237 = _54(_233, _235, (*spvDescriptorSet0.support_buffer));
        int3 _1467 = int3(_231, _237, 0);
        float3 _239 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1467.xy), uint(_1467.z), 0).xyz;
        float _241 = _239.x;
        float _243 = _239.y;
        float _245 = _239.z;
        int _247 = _64;
        int _249 = 0;
        int _251 = _54(_247, _249, (*spvDescriptorSet0.support_buffer));
        int _253 = as_type<int>(_183);
        int _255 = 0;
        int _257 = _54(_253, _255, (*spvDescriptorSet0.support_buffer));
        int3 _1485 = int3(_251, _257, 0);
        float3 _259 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1485.xy), uint(_1485.z), 0).xyz;
        float _261 = _259.x;
        float _263 = _259.y;
        float _265 = _259.z;
        int _267 = _64;
        int _269 = 0;
        int _271 = _54(_267, _269, (*spvDescriptorSet0.support_buffer));
        int _273 = as_type<int>(_175);
        int _275 = 0;
        int _277 = _54(_273, _275, (*spvDescriptorSet0.support_buffer));
        int3 _1503 = int3(_271, _277, 2);
        float3 _279 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1503.xy), uint(_1503.z), 0).xyz;
        float _281 = _279.x;
        float _283 = _279.y;
        float _285 = _279.z;
        int _287 = _64;
        int _289 = 0;
        int _291 = _54(_287, _289, (*spvDescriptorSet0.support_buffer));
        int _293 = as_type<int>(_183);
        int _295 = 0;
        int _297 = _54(_293, _295, (*spvDescriptorSet0.support_buffer));
        int3 _1521 = int3(_291, _297, 2);
        float3 _299 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1521.xy), uint(_1521.z), 0).xyz;
        float _301 = _299.x;
        float _303 = _299.y;
        float _305 = _299.z;
        int _307 = _97 + 16;
        uint _309 = uint(int(uint(_307) >> uint(2)));
        uint _311 = uint(int(uint(int(_309)) >> uint(2)));
        int _313 = int(_309) & 3;
        float _315 = (*spvDescriptorSet0.cp_c5)._m0[int(_311)][_313];
        float _317 = -_201;
        float _319 = _317 + _221;
        float _321 = -_205;
        float _323 = _321 + _225;
        float _325 = fma(_319, _315, _201);
        float _327 = -_203;
        float _329 = _327 + _223;
        float _331 = -_241;
        float _333 = _331 + _261;
        float _335 = -_245;
        float _337 = _335 + _265;
        float _339 = -_243;
        float _341 = _339 + _263;
        float _343 = fma(_329, _315, _203);
        float _345 = fma(_323, _315, _205);
        float _347 = fma(_333, _315, _241);
        float _349 = -_281;
        float _351 = _349 + _301;
        float _353 = -_283;
        float _355 = _353 + _303;
        float _357 = -_285;
        float _359 = _357 + _305;
        float _361 = fma(_337, _315, _245);
        float _363 = fma(_341, _315, _243);
        float _365 = fma(_351, _315, _281);
        float _367 = fma(_355, _315, _283);
        float _369 = fma(_359, _315, _285);
        _149 = _325;
        _159 = _345;
        _161 = _343;
        _151 = _365;
        _139 = _367;
        _127 = _347;
        _129 = _363;
        _141 = _361;
        _167 = _369;
    }
    float _371 = _149;
    float _373 = _159;
    float _375 = _161;
    float _377 = _151;
    float _379 = _139;
    float _381 = _127;
    float _383 = _129;
    float _385 = _141;
    float _387 = _167;
    float _389 = _371 * 0.15915493667125701904296875;
    float _391 = _373 * 0.15915493667125701904296875;
    float _393 = _375 * 0.15915493667125701904296875;
    int _395 = _64 * 48;
    float _397 = _389 * 6.283185482025146484375;
    float _399 = sin(_397);
    bool _401 = _64 != 0;
    int _403 = _64 * 112;
    float _405 = _389 * 6.283185482025146484375;
    float _407 = cos(_405);
    float _409 = _391 * 6.283185482025146484375;
    float _411 = sin(_409);
    float _413 = _391 * 6.283185482025146484375;
    float _415 = cos(_413);
    float _417 = _393 * 6.283185482025146484375;
    float _419 = cos(_417);
    float _421 = _411 * _407;
    float _423 = _399 * _411;
    float _425 = _391;
    float _427 = _393;
    float _429 = _423;
    if (!_401)
    {
        _425 = _377;
    }
    float _431 = _425;
    float _433 = _393 * 6.283185482025146484375;
    float _435 = sin(_433);
    float _437 = _407 * _415;
    float _439 = _399 * _415;
    float _441 = _407 * _419;
    float _443 = _399 * _419;
    float _445 = _443;
    float _447 = _415;
    float _449 = _431;
    if (!_401)
    {
        _427 = _379;
    }
    float _451 = _427;
    float _453 = _399 * _435;
    float _455 = _419 * _381;
    float _457 = -_439;
    float _459 = fma(_435, _421, _457);
    float _461 = fma(_435, _437, _423);
    float _463 = -_421;
    float _465 = fma(_415, _453, _463);
    float _467 = fma(_411, _453, _437);
    float _469 = _435 * _381;
    float _471 = _411 * _455;
    float _473 = _415 * _455;
    float _475 = _443 * _383;
    float _477 = _465 * _383;
    float _479 = _467 * _383;
    float _481 = _441 * _385;
    float _483 = _461 * _385;
    float _485 = -_469;
    float _487 = _485 + (-0.0);
    float _489 = _459 * _385;
    float _491 = _461;
    float _493 = _459;
    float _495 = _479;
    float _497 = _477;
    float _499 = _489;
    float _501 = _483;
    float _503 = _481;
    float _505 = _451;
    if (!_401)
    {
        _445 = _387;
    }
    float _507 = _445;
    uint _509 = uint(int(uint(_395) >> uint(2)));
    _37[int(_509)] = as_type<uint>(_473);
    int _511 = _395 + 4;
    uint _513 = uint(int(uint(_511) >> uint(2)));
    _37[int(_513)] = as_type<uint>(_477);
    int _515 = _395 + 8;
    uint _517 = uint(int(uint(_515) >> uint(2)));
    _37[int(_517)] = as_type<uint>(_483);
    int _519 = _395 + 12;
    uint _521 = uint(int(uint(_519) >> uint(2)));
    _37[int(_521)] = as_type<uint>(_377);
    float _523 = _507;
    if (!_401)
    {
        _491 = _487;
    }
    float _525 = _491;
    float _527 = _525;
    if (!_401)
    {
        _493 = _473;
    }
    float _529 = _493;
    int _531 = _395 + 32;
    uint _533 = uint(int(uint(_531) >> uint(2)));
    _37[int(_533)] = as_type<uint>(_487);
    int _535 = _395 + 36;
    uint _537 = uint(int(uint(_535) >> uint(2)));
    _37[int(_537)] = as_type<uint>(_475);
    int _539 = _395 + 40;
    uint _541 = uint(int(uint(_539) >> uint(2)));
    _37[int(_541)] = as_type<uint>(_481);
    int _543 = _395 + 44;
    uint _545 = uint(int(uint(_543) >> uint(2)));
    _37[int(_545)] = as_type<uint>(_387);
    float _547 = _529;
    if (!_401)
    {
        _447 = _471;
    }
    float _549 = _447;
    float _551 = _549;
    if (!_401)
    {
        _429 = _475;
    }
    float _553 = _429;
    int _555 = _395 + 16;
    uint _557 = uint(int(uint(_555) >> uint(2)));
    _37[int(_557)] = as_type<uint>(_471);
    int _559 = _395 + 20;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    _37[int(_561)] = as_type<uint>(_479);
    int _563 = _395 + 24;
    uint _565 = uint(int(uint(_563) >> uint(2)));
    _37[int(_565)] = as_type<uint>(_489);
    int _567 = _395 + 28;
    uint _569 = uint(int(uint(_567) >> uint(2)));
    _37[int(_569)] = as_type<uint>(_379);
    bool _571 = !_401;
    float _573 = _553;
    if (!_571)
    {
        bool _575 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _577 = !_575;
        if (!_577)
        {
            uint _579 = uint(int(uint(_403) >> uint(2)));
            uint _581 = uint(int(uint(int(_579)) >> uint(2)));
            int _583 = int(_579) & 3;
            float _585 = (*spvDescriptorSet0.cp_c6)._m0[int(_581)][_583];
            int _587 = as_type<int>(_585) * 48;
            int _589 = 0;
            bool _591;
            float _689;
            float _691;
            float _693;
            float _701;
            float _717;
            float _719;
            float _731;
            float _741;
            float _745;
            float _747;
            float _749;
            float _751;
            do
            {
                int _593 = _589;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _595 = uint(int(uint(_587) >> uint(2)));
                float _597 = as_type<float>(_37[int(_595)]);
                int _599 = _587 + 4;
                uint _601 = uint(int(uint(_599) >> uint(2)));
                float _603 = as_type<float>(_37[int(_601)]);
                int _605 = _587 + 8;
                uint _607 = uint(int(uint(_605) >> uint(2)));
                float _609 = as_type<float>(_37[int(_607)]);
                int _611 = _587 + 12;
                uint _613 = uint(int(uint(_611) >> uint(2)));
                float _615 = as_type<float>(_37[int(_613)]);
                int _617 = _593 + 1;
                int _619 = _587 + 16;
                uint _621 = uint(int(uint(_619) >> uint(2)));
                float _623 = as_type<float>(_37[int(_621)]);
                int _625 = _587 + 20;
                uint _627 = uint(int(uint(_625) >> uint(2)));
                float _629 = as_type<float>(_37[int(_627)]);
                int _631 = _587 + 24;
                uint _633 = uint(int(uint(_631) >> uint(2)));
                float _635 = as_type<float>(_37[int(_633)]);
                int _637 = _587 + 28;
                uint _639 = uint(int(uint(_637) >> uint(2)));
                float _641 = as_type<float>(_37[int(_639)]);
                bool _643 = uint(_617) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _645 = _587 + 32;
                uint _647 = uint(int(uint(_645) >> uint(2)));
                float _649 = as_type<float>(_37[int(_647)]);
                int _651 = _587 + 36;
                uint _653 = uint(int(uint(_651) >> uint(2)));
                float _655 = as_type<float>(_37[int(_653)]);
                int _657 = _587 + 40;
                uint _659 = uint(int(uint(_657) >> uint(2)));
                float _661 = as_type<float>(_37[int(_659)]);
                int _663 = _587 + 44;
                uint _665 = uint(int(uint(_663) >> uint(2)));
                float _667 = as_type<float>(_37[int(_665)]);
                float _669 = _603 * _379;
                float _671 = _471 * _603;
                float _673 = _479 * _603;
                float _675 = _489 * _603;
                float _677 = fma(_597, _377, _669);
                float _679 = fma(_473, _597, _671);
                float _681 = fma(_477, _597, _673);
                float _683 = fma(_483, _597, _675);
                float _685 = fma(_609, _387, _677);
                float _687 = -_469;
                _689 = fma(_687, _609, _679);
                _691 = fma(_475, _609, _681);
                _693 = fma(_481, _609, _683);
                float _695 = _629 * _379;
                float _697 = _471 * _629;
                float _699 = _479 * _629;
                _701 = _615 + _685;
                float _703 = fma(_623, _377, _695);
                float _705 = fma(_473, _623, _697);
                float _707 = fma(_477, _623, _699);
                float _709 = _489 * _629;
                float _711 = fma(_635, _387, _703);
                float _713 = _655 * _379;
                float _715 = -_469;
                _717 = fma(_715, _635, _705);
                _719 = fma(_475, _635, _707);
                float _721 = _471 * _655;
                float _723 = _479 * _655;
                float _725 = _489 * _655;
                float _727 = fma(_649, _377, _713);
                float _729 = fma(_483, _623, _709);
                _731 = _641 + _711;
                float _733 = fma(_473, _649, _721);
                float _735 = fma(_477, _649, _723);
                float _737 = fma(_483, _649, _725);
                float _739 = fma(_661, _387, _727);
                _741 = fma(_481, _635, _729);
                float _743 = -_469;
                _745 = fma(_743, _661, _733);
                _747 = fma(_475, _661, _735);
                _749 = fma(_481, _661, _737);
                _751 = _667 + _739;
                uint _753 = uint(int(uint(_395) >> uint(2)));
                _37[int(_753)] = as_type<uint>(_689);
                int _755 = _395 + 4;
                uint _757 = uint(int(uint(_755) >> uint(2)));
                _37[int(_757)] = as_type<uint>(_691);
                int _759 = _395 + 8;
                uint _761 = uint(int(uint(_759) >> uint(2)));
                _37[int(_761)] = as_type<uint>(_693);
                int _763 = _395 + 12;
                uint _765 = uint(int(uint(_763) >> uint(2)));
                _37[int(_765)] = as_type<uint>(_701);
                int _767 = _395 + 16;
                uint _769 = uint(int(uint(_767) >> uint(2)));
                _37[int(_769)] = as_type<uint>(_717);
                int _771 = _395 + 20;
                uint _773 = uint(int(uint(_771) >> uint(2)));
                _37[int(_773)] = as_type<uint>(_719);
                int _775 = _395 + 24;
                uint _777 = uint(int(uint(_775) >> uint(2)));
                _37[int(_777)] = as_type<uint>(_741);
                int _779 = _395 + 28;
                uint _781 = uint(int(uint(_779) >> uint(2)));
                _37[int(_781)] = as_type<uint>(_731);
                int _783 = _395 + 32;
                uint _785 = uint(int(uint(_783) >> uint(2)));
                _37[int(_785)] = as_type<uint>(_745);
                int _787 = _395 + 36;
                uint _789 = uint(int(uint(_787) >> uint(2)));
                _37[int(_789)] = as_type<uint>(_747);
                int _791 = _395 + 40;
                uint _793 = uint(int(uint(_791) >> uint(2)));
                _37[int(_793)] = as_type<uint>(_749);
                int _795 = _395 + 44;
                uint _797 = uint(int(uint(_795) >> uint(2)));
                _37[int(_797)] = as_type<uint>(_751);
                _591 = !_643;
                _589 = _617;
            } while (_591);
            _495 = _719;
            _497 = _691;
            _573 = _747;
            _551 = _717;
            _527 = _745;
            _547 = _689;
            _499 = _741;
            _501 = _693;
            _503 = _749;
            _505 = _731;
            _449 = _701;
            _523 = _751;
            _799 = true;
        }
        else
        {
            _495 = 0.0;
            _497 = 0.0;
            _573 = 0.0;
            _551 = 0.0;
            _527 = 0.0;
            _547 = 0.0;
            _499 = 0.0;
            _501 = 0.0;
            _503 = 0.0;
            _505 = 0.0;
            _449 = 0.0;
            _523 = 0.0;
        }
    }
    _799 = false;
    float _801 = _495;
    float _803 = _497;
    float _805 = _573;
    float _807 = _551;
    float _809 = _527;
    float _811 = _547;
    float _813 = _499;
    float _815 = _501;
    float _817 = _503;
    float _819 = _505;
    float _821 = _449;
    float _823 = _523;
    int _825 = _403 + 80;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.cp_c6)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.cp_c6)._m0[int(_837)][_839];
    int _843 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _845 = _843 + _64;
    int _847 = _403 + 64;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    uint _851 = uint(int(uint(int(_849)) >> uint(2)));
    int _853 = int(_849) & 3;
    float _855 = (*spvDescriptorSet0.cp_c6)._m0[int(_851)][_853];
    int _857 = int(_849) + 1;
    uint _859 = uint(int(uint(_857) >> uint(2)));
    int _861 = _857 & 3;
    float _863 = (*spvDescriptorSet0.cp_c6)._m0[int(_859)][_861];
    int _865 = _403 + 88;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    uint _869 = uint(int(uint(int(_867)) >> uint(2)));
    int _871 = int(_867) & 3;
    float _873 = (*spvDescriptorSet0.cp_c6)._m0[int(_869)][_871];
    int _875 = int(_867) + 1;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    int _879 = _875 & 3;
    float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
    int _883 = _403 + 72;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    uint _887 = uint(int(uint(int(_885)) >> uint(2)));
    int _889 = int(_885) & 3;
    float _891 = (*spvDescriptorSet0.cp_c6)._m0[int(_887)][_889];
    int _893 = int(_885) + 1;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    int _897 = _893 & 3;
    float _899 = (*spvDescriptorSet0.cp_c6)._m0[int(_895)][_897];
    int _901 = _403 + 96;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    uint _905 = uint(int(uint(int(_903)) >> uint(2)));
    int _907 = int(_903) & 3;
    float _909 = (*spvDescriptorSet0.cp_c6)._m0[int(_905)][_907];
    int _911 = int(_903) + 1;
    uint _913 = uint(int(uint(_911) >> uint(2)));
    int _915 = _911 & 3;
    float _917 = (*spvDescriptorSet0.cp_c6)._m0[int(_913)][_915];
    int _919 = _403 + 104;
    uint _921 = uint(int(uint(_919) >> uint(2)));
    uint _923 = uint(int(uint(int(_921)) >> uint(2)));
    int _925 = int(_921) & 3;
    float _927 = (*spvDescriptorSet0.cp_c6)._m0[int(_923)][_925];
    int _929 = int(_921) + 1;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    int _933 = _929 & 3;
    float _935 = (*spvDescriptorSet0.cp_c6)._m0[int(_931)][_933];
    float _937 = _801 * _833;
    float _939 = _803 * _833;
    float _941 = _805 * _833;
    int _943 = _403 + 16;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    uint _947 = uint(int(uint(int(_945)) >> uint(2)));
    int _949 = int(_945) & 3;
    float _951 = (*spvDescriptorSet0.cp_c6)._m0[int(_947)][_949];
    int _953 = int(_945) + 1;
    uint _955 = uint(int(uint(_953) >> uint(2)));
    int _957 = _953 & 3;
    float _959 = (*spvDescriptorSet0.cp_c6)._m0[int(_955)][_957];
    float _961 = fma(_807, _855, _937);
    float _963 = _801 * _841;
    float _965 = fma(_809, _855, _941);
    int _967 = _403 + 32;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    uint _971 = uint(int(uint(int(_969)) >> uint(2)));
    int _973 = int(_969) & 3;
    float _975 = (*spvDescriptorSet0.cp_c6)._m0[int(_971)][_973];
    int _977 = int(_969) + 1;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    int _981 = _977 & 3;
    float _983 = (*spvDescriptorSet0.cp_c6)._m0[int(_979)][_981];
    float _985 = fma(_811, _855, _939);
    float _987 = _805 * _841;
    float _989 = _803 * _841;
    float _991 = fma(_807, _863, _963);
    float _993 = _803 * _873;
    float _995 = _801 * _873;
    float _997 = _801 * _881;
    int _999 = _403 + 48;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    uint _1003 = uint(int(uint(int(_1001)) >> uint(2)));
    int _1005 = int(_1001) & 3;
    float _1007 = (*spvDescriptorSet0.cp_c6)._m0[int(_1003)][_1005];
    int _1009 = int(_1001) + 1;
    uint _1011 = uint(int(uint(_1009) >> uint(2)));
    int _1013 = _1009 & 3;
    float _1015 = (*spvDescriptorSet0.cp_c6)._m0[int(_1011)][_1013];
    float _1017 = fma(_809, _863, _987);
    float _1019 = _805 * _873;
    float _1021 = _803 * _881;
    float _1023 = _805 * _881;
    float _1025 = fma(_807, _891, _995);
    float _1027 = fma(_807, _899, _997);
    float _1029 = fma(_809, _891, _1019);
    int _1031 = _403 + 24;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    uint _1035 = uint(int(uint(int(_1033)) >> uint(2)));
    int _1037 = int(_1033) & 3;
    float _1039 = (*spvDescriptorSet0.cp_c6)._m0[int(_1035)][_1037];
    int _1041 = int(_1033) + 1;
    uint _1043 = uint(int(uint(_1041) >> uint(2)));
    int _1045 = _1041 & 3;
    float _1047 = (*spvDescriptorSet0.cp_c6)._m0[int(_1043)][_1045];
    float _1049 = fma(_811, _891, _993);
    float _1051 = fma(_811, _899, _1021);
    float _1053 = fma(_809, _899, _1023);
    float _1055 = fma(_811, _863, _989);
    float _1057 = fma(_813, _909, _961);
    float _1059 = fma(_815, _909, _985);
    float _1061 = fma(_817, _909, _965);
    int _1063 = _403 + 40;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
    int _1069 = int(_1065) & 3;
    float _1071 = (*spvDescriptorSet0.cp_c6)._m0[int(_1067)][_1069];
    int _1073 = int(_1065) + 1;
    uint _1075 = uint(int(uint(_1073) >> uint(2)));
    int _1077 = _1073 & 3;
    float _1079 = (*spvDescriptorSet0.cp_c6)._m0[int(_1075)][_1077];
    float _1081 = fma(_815, _917, _1055);
    float _1083 = fma(_813, _917, _991);
    float _1085 = fma(_817, _917, _1017);
    float _1087 = fma(_813, _935, _1027);
    float _1089 = fma(_815, _935, _1051);
    float _1091 = fma(_817, _935, _1053);
    int _1093 = _403 + 56;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
    int _1099 = int(_1095) & 3;
    float _1101 = (*spvDescriptorSet0.cp_c6)._m0[int(_1097)][_1099];
    int _1103 = int(_1095) + 1;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    int _1107 = _1103 & 3;
    float _1109 = (*spvDescriptorSet0.cp_c6)._m0[int(_1105)][_1107];
    float _1111 = _1087 + _819;
    float _1113 = fma(_815, _927, _1049);
    float _1115 = _1089 + _821;
    float _1117 = _1091 + _823;
    float _1119 = fma(_813, _927, _1025);
    float _1121 = fma(_817, _927, _1029);
    float _1123 = _1083 * _959;
    float _1125 = _1111 * _959;
    float _1127 = _1057 * _959;
    float _1129 = _1119 * _959;
    float _1131 = fma(_1081, _951, _1123);
    float _1133 = fma(_1115, _951, _1125);
    float _1135 = fma(_1059, _951, _1127);
    float _1137 = fma(_1113, _951, _1129);
    float _1139 = _1083 * _983;
    float _1141 = _1111 * _983;
    float _1143 = _1057 * _983;
    float _1145 = _1119 * _983;
    float _1147 = fma(_1081, _975, _1139);
    float _1149 = fma(_1115, _975, _1141);
    float _1151 = fma(_1059, _975, _1143);
    float _1153 = fma(_1113, _975, _1145);
    float _1155 = _1083 * _1015;
    float _1157 = _1111 * _1015;
    float _1159 = _1057 * _1015;
    float _1161 = _1119 * _1015;
    float _1163 = fma(_1081, _1007, _1155);
    float _1165 = fma(_1115, _1007, _1157);
    float _1167 = fma(_1059, _1007, _1159);
    float _1169 = fma(_1113, _1007, _1161);
    float _1171 = fma(_1085, _1039, _1131);
    int _1173 = _845 * 48;
    float _1175 = fma(_1117, _1039, _1133);
    float _1177 = fma(_1061, _1039, _1135);
    float _1179 = fma(_1121, _1039, _1137);
    float _1181 = _1175 + _1047;
    int _1183 = _1173 + 16;
    float _1185 = fma(_1117, _1071, _1149);
    float _1187 = fma(_1061, _1071, _1151);
    float _1189 = fma(_1085, _1071, _1147);
    float _1191 = fma(_1121, _1071, _1153);
    float _1193 = _1185 + _1079;
    int _1195 = _1173 + 32;
    uint _1197 = uint(int(uint(_1183) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1197)] = as_type<uint>(_1177);
    int _1199 = _1183 + 4;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1201)] = as_type<uint>(_1171);
    int _1203 = _1183 + 8;
    uint _1205 = uint(int(uint(_1203) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1205)] = as_type<uint>(_1179);
    int _1207 = _1183 + 12;
    uint _1209 = uint(int(uint(_1207) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1209)] = as_type<uint>(_1181);
    int _1211 = _1173 + 48;
    float _1213 = fma(_1117, _1101, _1165);
    float _1215 = fma(_1061, _1101, _1167);
    float _1217 = fma(_1085, _1101, _1163);
    float _1219 = fma(_1121, _1101, _1169);
    float _1221 = _1213 + _1109;
    uint _1223 = uint(int(uint(_1195) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1223)] = as_type<uint>(_1187);
    int _1225 = _1195 + 4;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1227)] = as_type<uint>(_1189);
    int _1229 = _1195 + 8;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1231)] = as_type<uint>(_1191);
    int _1233 = _1195 + 12;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1235)] = as_type<uint>(_1193);
    uint _1237 = uint(int(uint(_1211) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1237)] = as_type<uint>(_1215);
    int _1239 = _1211 + 4;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1241)] = as_type<uint>(_1217);
    int _1243 = _1211 + 8;
    uint _1245 = uint(int(uint(_1243) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1245)] = as_type<uint>(_1219);
    int _1247 = _1211 + 12;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1249)] = as_type<uint>(_1221);
}

