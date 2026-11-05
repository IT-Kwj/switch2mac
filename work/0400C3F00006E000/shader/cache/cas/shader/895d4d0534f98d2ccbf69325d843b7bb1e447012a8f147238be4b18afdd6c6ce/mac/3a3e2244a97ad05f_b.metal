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
};

static inline __attribute__((always_inline))
int _56(thread const int& _3316, thread const int& _3317, constant _10& support_buffer)
{
    int _3320 = 1 + _3317;
    float _3322 = support_buffer._m5[_3320].x;
    bool _3324 = _3322 == 1.0;
    if (_3324)
    {
        return _3316;
    }
    float _3326 = float(_3316);
    float _3328 = _3326 * _3322;
    int _3330 = int(_3328);
    return _3330;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _777 = false;
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
    float _99 = _78 ? as_type<float>(_91) : as_type<float>(_97);
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = as_type<int>(_99) & as_type<int>(_111);
    bool _115 = _113 != 0;
    float _117 = 0.0;
    float _119 = 0.0;
    float _121 = _99;
    if (!_115)
    {
        _117 = 0.0;
        _119 = 0.0;
    }
    float _123 = _117;
    float _125 = _119;
    float _127 = 0.0;
    int _129 = 0;
    float _131 = _123;
    float _133 = _125;
    if (!_115)
    {
        _127 = 0.0;
        _129 = 0;
    }
    float _135 = _127;
    int _137 = _129;
    float _139 = 0.0;
    int _141 = 0;
    float _143 = _135;
    int _145 = _137;
    if (!_115)
    {
        _139 = 0.0;
        _141 = 0;
    }
    float _147 = _139;
    int _149 = _141;
    float _151 = _147;
    int _153 = _149;
    if (!_115)
    {
        _121 = 0.0;
        _72 = 0.0;
    }
    float _155 = _121;
    float _157 = _72;
    int _159 = 0;
    float _161 = _155;
    float _163 = _157;
    if (!_115)
    {
        _159 = 0;
    }
    int _165 = _159;
    bool _167 = !_115;
    int _169 = _165;
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
        int3 _1454 = int3(_191, _197, 1);
        float3 _201 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1454.xy), uint(_1454.z), 0).xyz;
        float _203 = _201.x;
        float _205 = _201.y;
        float _207 = _201.z;
        int _209 = _66;
        int _211 = 0;
        int _213 = _56(_209, _211, (*spvDescriptorSet0.support_buffer));
        int _215 = as_type<int>(_185);
        int _217 = 0;
        int _219 = _56(_215, _217, (*spvDescriptorSet0.support_buffer));
        int3 _1472 = int3(_213, _219, 1);
        float3 _221 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1472.xy), uint(_1472.z), 0).xyz;
        float _223 = _221.x;
        float _225 = _221.y;
        float _227 = _221.z;
        int _229 = _66;
        int _231 = 0;
        int _233 = _56(_229, _231, (*spvDescriptorSet0.support_buffer));
        int _235 = as_type<int>(_177);
        int _237 = 0;
        int _239 = _56(_235, _237, (*spvDescriptorSet0.support_buffer));
        int3 _1490 = int3(_233, _239, 0);
        float3 _241 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1490.xy), uint(_1490.z), 0).xyz;
        float _243 = _241.x;
        float _245 = _241.y;
        float _247 = _241.z;
        int _249 = _66;
        int _251 = 0;
        int _253 = _56(_249, _251, (*spvDescriptorSet0.support_buffer));
        int _255 = as_type<int>(_185);
        int _257 = 0;
        int _259 = _56(_255, _257, (*spvDescriptorSet0.support_buffer));
        int3 _1508 = int3(_253, _259, 0);
        float3 _261 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1508.xy), uint(_1508.z), 0).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        int _269 = _66;
        int _271 = 0;
        int _273 = _56(_269, _271, (*spvDescriptorSet0.support_buffer));
        int _275 = as_type<int>(_177);
        int _277 = 0;
        int _279 = _56(_275, _277, (*spvDescriptorSet0.support_buffer));
        int3 _1526 = int3(_273, _279, 2);
        float3 _281 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1526.xy), uint(_1526.z), 0).xyz;
        float _283 = _281.x;
        float _285 = _281.y;
        float _287 = _281.z;
        int _289 = _66;
        int _291 = 0;
        int _293 = _56(_289, _291, (*spvDescriptorSet0.support_buffer));
        int _295 = as_type<int>(_185);
        int _297 = 0;
        int _299 = _56(_295, _297, (*spvDescriptorSet0.support_buffer));
        int3 _1544 = int3(_293, _299, 2);
        float3 _301 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1544.xy), uint(_1544.z), 0).xyz;
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
        float _327 = fma(_321, _317, _203);
        float _329 = -_205;
        float _331 = _329 + _225;
        float _333 = -_243;
        float _335 = _333 + _263;
        float _337 = -_247;
        float _339 = _337 + _267;
        float _341 = -_245;
        float _343 = _341 + _265;
        float _345 = fma(_331, _317, _205);
        float _347 = fma(_325, _317, _207);
        float _349 = fma(_335, _317, _243);
        float _351 = -_283;
        float _353 = _351 + _303;
        float _355 = -_285;
        float _357 = _355 + _305;
        float _359 = -_287;
        float _361 = _359 + _307;
        float _363 = fma(_339, _317, _247);
        float _365 = fma(_343, _317, _245);
        float _367 = fma(_353, _317, _283);
        float _369 = fma(_357, _317, _285);
        float _371 = fma(_361, _317, _287);
        _151 = _327;
        _161 = _347;
        _163 = _345;
        _131 = _349;
        _133 = _365;
        _143 = _363;
        _153 = as_type<int>(_367);
        _169 = as_type<int>(_371);
        _145 = as_type<int>(_369);
    }
    float _373 = _151;
    float _375 = _161;
    float _377 = _163;
    float _379 = _131;
    float _381 = _133;
    float _383 = _143;
    int _385 = _153;
    int _387 = _169;
    int _389 = _145;
    float _391 = _373 * 0.15915493667125701904296875;
    float _393 = _375 * 0.15915493667125701904296875;
    float _395 = _377 * 0.15915493667125701904296875;
    bool _397 = _66 != 0;
    float _399 = _391 * 6.283185482025146484375;
    float _401 = sin(_399);
    float _403 = _391 * 6.283185482025146484375;
    float _405 = cos(_403);
    float _407 = _393 * 6.283185482025146484375;
    float _409 = sin(_407);
    float _411 = _393 * 6.283185482025146484375;
    float _413 = cos(_411);
    float _415 = _395 * 6.283185482025146484375;
    float _417 = cos(_415);
    float _419 = _409 * _405;
    float _421 = _401 * _409;
    float _423 = _395 * 6.283185482025146484375;
    float _425 = sin(_423);
    float _427 = _405 * _413;
    float _429 = _401 * _413;
    float _431 = _405 * _417;
    float _433 = _401 * _417;
    float _435 = _401 * _425;
    float _437 = _417 * _379;
    float _439 = -_429;
    float _441 = fma(_425, _419, _439);
    float _443 = fma(_425, _427, _421);
    float _445 = -_419;
    float _447 = fma(_413, _435, _445);
    float _449 = fma(_409, _435, _427);
    float _451 = _425 * _379;
    float _453 = _409 * _437;
    float _455 = _413 * _437;
    float _457 = _433 * _381;
    float _459 = _447 * _381;
    float _461 = _449 * _381;
    float _463 = _431 * _383;
    float _465 = _443 * _383;
    int _467 = _66 * 48;
    float _469 = -_451;
    float _471 = _469 + (-0.0);
    float _473 = _441 * _383;
    int _475 = _66 * 112;
    uint _477 = uint(int(uint(_467) >> uint(2)));
    _39[int(_477)] = as_type<uint>(_455);
    int _479 = _467 + 4;
    uint _481 = uint(int(uint(_479) >> uint(2)));
    _39[int(_481)] = as_type<uint>(_459);
    int _483 = _467 + 8;
    uint _485 = uint(int(uint(_483) >> uint(2)));
    _39[int(_485)] = as_type<uint>(_465);
    int _487 = _467 + 12;
    uint _489 = uint(int(uint(_487) >> uint(2)));
    _39[int(_489)] = uint(_385);
    int _491 = _467 + 16;
    int _493 = _467 + 32;
    int _495 = _467 + 32;
    uint _497 = uint(int(uint(_495) >> uint(2)));
    _39[int(_497)] = as_type<uint>(_471);
    int _499 = _467 + 36;
    uint _501 = uint(int(uint(_499) >> uint(2)));
    _39[int(_501)] = as_type<uint>(_457);
    int _503 = _467 + 40;
    uint _505 = uint(int(uint(_503) >> uint(2)));
    _39[int(_505)] = as_type<uint>(_463);
    int _507 = _467 + 44;
    uint _509 = uint(int(uint(_507) >> uint(2)));
    _39[int(_509)] = uint(_387);
    int _511 = _467 + 16;
    uint _513 = uint(int(uint(_511) >> uint(2)));
    _39[int(_513)] = as_type<uint>(_453);
    int _515 = _467 + 20;
    uint _517 = uint(int(uint(_515) >> uint(2)));
    _39[int(_517)] = as_type<uint>(_461);
    int _519 = _467 + 24;
    uint _521 = uint(int(uint(_519) >> uint(2)));
    _39[int(_521)] = as_type<uint>(_473);
    int _523 = _467 + 28;
    uint _525 = uint(int(uint(_523) >> uint(2)));
    _39[int(_525)] = uint(_389);
    bool _527 = !_397;
    float _529 = _455;
    float _531 = _459;
    float _533 = _465;
    float _535 = as_type<float>(_385);
    float _537 = _453;
    float _539 = _461;
    float _541 = _473;
    float _543 = as_type<float>(_389);
    float _545 = _471;
    float _547 = _457;
    float _549 = _463;
    float _551 = as_type<float>(_387);
    if (!_527)
    {
        bool _553 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _555 = !_553;
        if (!_555)
        {
            uint _557 = uint(int(uint(_475) >> uint(2)));
            uint _559 = uint(int(uint(int(_557)) >> uint(2)));
            int _561 = int(_557) & 3;
            float _563 = (*spvDescriptorSet0.cp_c6)._m0[int(_559)][_561];
            int _565 = as_type<int>(_563) * 48;
            int _567 = 0;
            bool _569;
            float _669;
            float _671;
            float _679;
            float _691;
            float _693;
            float _707;
            float _717;
            float _719;
            float _723;
            float _725;
            float _727;
            float _729;
            do
            {
                int _571 = _567;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _573 = uint(int(uint(_565) >> uint(2)));
                float _575 = as_type<float>(_39[int(_573)]);
                int _577 = _565 + 4;
                uint _579 = uint(int(uint(_577) >> uint(2)));
                float _581 = as_type<float>(_39[int(_579)]);
                int _583 = _565 + 8;
                uint _585 = uint(int(uint(_583) >> uint(2)));
                float _587 = as_type<float>(_39[int(_585)]);
                int _589 = _565 + 12;
                uint _591 = uint(int(uint(_589) >> uint(2)));
                float _593 = as_type<float>(_39[int(_591)]);
                int _595 = _571 + 1;
                int _597 = _565 + 16;
                uint _599 = uint(int(uint(_597) >> uint(2)));
                float _601 = as_type<float>(_39[int(_599)]);
                int _603 = _565 + 20;
                uint _605 = uint(int(uint(_603) >> uint(2)));
                float _607 = as_type<float>(_39[int(_605)]);
                int _609 = _565 + 24;
                uint _611 = uint(int(uint(_609) >> uint(2)));
                float _613 = as_type<float>(_39[int(_611)]);
                int _615 = _565 + 28;
                uint _617 = uint(int(uint(_615) >> uint(2)));
                float _619 = as_type<float>(_39[int(_617)]);
                bool _621 = uint(_595) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _623 = _565 + 32;
                uint _625 = uint(int(uint(_623) >> uint(2)));
                float _627 = as_type<float>(_39[int(_625)]);
                int _629 = _565 + 36;
                uint _631 = uint(int(uint(_629) >> uint(2)));
                float _633 = as_type<float>(_39[int(_631)]);
                int _635 = _565 + 40;
                uint _637 = uint(int(uint(_635) >> uint(2)));
                float _639 = as_type<float>(_39[int(_637)]);
                int _641 = _565 + 44;
                uint _643 = uint(int(uint(_641) >> uint(2)));
                float _645 = as_type<float>(_39[int(_643)]);
                float _647 = _581 * as_type<float>(_389);
                float _649 = _453 * _581;
                float _651 = _461 * _581;
                float _653 = _473 * _581;
                float _655 = fma(_575, as_type<float>(_385), _647);
                float _657 = fma(_455, _575, _649);
                float _659 = fma(_459, _575, _651);
                float _661 = fma(_465, _575, _653);
                float _663 = fma(_587, as_type<float>(_387), _655);
                float _665 = _607 * as_type<float>(_389);
                float _667 = -_451;
                _669 = fma(_667, _587, _657);
                _671 = fma(_457, _587, _659);
                float _673 = _453 * _607;
                float _675 = _461 * _607;
                float _677 = fma(_601, as_type<float>(_385), _665);
                _679 = _593 + _663;
                float _681 = fma(_455, _601, _673);
                float _683 = fma(_459, _601, _675);
                float _685 = fma(_613, as_type<float>(_387), _677);
                float _687 = _633 * as_type<float>(_389);
                float _689 = -_451;
                _691 = fma(_689, _613, _681);
                _693 = fma(_457, _613, _683);
                float _695 = _473 * _607;
                float _697 = _453 * _633;
                float _699 = _461 * _633;
                float _701 = _473 * _633;
                float _703 = fma(_627, as_type<float>(_385), _687);
                float _705 = fma(_465, _601, _695);
                _707 = _619 + _685;
                float _709 = fma(_455, _627, _697);
                float _711 = fma(_459, _627, _699);
                float _713 = fma(_465, _627, _701);
                float _715 = fma(_639, as_type<float>(_387), _703);
                _717 = fma(_463, _613, _705);
                _719 = fma(_463, _587, _661);
                float _721 = -_451;
                _723 = fma(_721, _639, _709);
                _725 = fma(_457, _639, _711);
                _727 = fma(_463, _639, _713);
                _729 = _645 + _715;
                uint _731 = uint(int(uint(_467) >> uint(2)));
                _39[int(_731)] = as_type<uint>(_669);
                int _733 = _467 + 4;
                uint _735 = uint(int(uint(_733) >> uint(2)));
                _39[int(_735)] = as_type<uint>(_671);
                int _737 = _467 + 8;
                uint _739 = uint(int(uint(_737) >> uint(2)));
                _39[int(_739)] = as_type<uint>(_719);
                int _741 = _467 + 12;
                uint _743 = uint(int(uint(_741) >> uint(2)));
                _39[int(_743)] = as_type<uint>(_679);
                int _745 = _467 + 16;
                uint _747 = uint(int(uint(_745) >> uint(2)));
                _39[int(_747)] = as_type<uint>(_691);
                int _749 = _467 + 20;
                uint _751 = uint(int(uint(_749) >> uint(2)));
                _39[int(_751)] = as_type<uint>(_693);
                int _753 = _467 + 24;
                uint _755 = uint(int(uint(_753) >> uint(2)));
                _39[int(_755)] = as_type<uint>(_717);
                int _757 = _467 + 28;
                uint _759 = uint(int(uint(_757) >> uint(2)));
                _39[int(_759)] = as_type<uint>(_707);
                int _761 = _467 + 32;
                uint _763 = uint(int(uint(_761) >> uint(2)));
                _39[int(_763)] = as_type<uint>(_723);
                int _765 = _467 + 36;
                uint _767 = uint(int(uint(_765) >> uint(2)));
                _39[int(_767)] = as_type<uint>(_725);
                int _769 = _467 + 40;
                uint _771 = uint(int(uint(_769) >> uint(2)));
                _39[int(_771)] = as_type<uint>(_727);
                int _773 = _467 + 44;
                uint _775 = uint(int(uint(_773) >> uint(2)));
                _39[int(_775)] = as_type<uint>(_729);
                _569 = !_621;
                _567 = _595;
            } while (_569);
            _529 = _669;
            _531 = _671;
            _533 = _719;
            _535 = _679;
            _537 = _691;
            _539 = _693;
            _541 = _717;
            _543 = _707;
            _545 = _723;
            _547 = _725;
            _549 = _727;
            _551 = _729;
            _777 = true;
        }
        else
        {
            _529 = 0.0;
            _531 = 0.0;
            _533 = 0.0;
            _535 = 0.0;
            _537 = 0.0;
            _539 = 0.0;
            _541 = 0.0;
            _543 = 0.0;
            _545 = 0.0;
            _547 = 0.0;
            _549 = 0.0;
            _551 = 0.0;
        }
    }
    _777 = false;
    float _779 = _529;
    float _781 = _531;
    float _783 = _533;
    float _785 = _535;
    float _787 = _537;
    float _789 = _539;
    float _791 = _541;
    float _793 = _543;
    float _795 = _545;
    float _797 = _547;
    float _799 = _549;
    float _801 = _551;
    int _803 = _475 + 80;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    uint _807 = uint(int(uint(int(_805)) >> uint(2)));
    int _809 = int(_805) & 3;
    float _811 = (*spvDescriptorSet0.cp_c6)._m0[int(_807)][_809];
    int _813 = int(_805) + 1;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    int _817 = _813 & 3;
    float _819 = (*spvDescriptorSet0.cp_c6)._m0[int(_815)][_817];
    bool _821 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _823 = _475 + 64;
    uint _825 = uint(int(uint(_823) >> uint(2)));
    uint _827 = uint(int(uint(int(_825)) >> uint(2)));
    int _829 = int(_825) & 3;
    float _831 = (*spvDescriptorSet0.cp_c6)._m0[int(_827)][_829];
    int _833 = int(_825) + 1;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    int _837 = _833 & 3;
    float _839 = (*spvDescriptorSet0.cp_c6)._m0[int(_835)][_837];
    int _841 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _843 = _841 + _66;
    int _845 = _475 + 88;
    uint _847 = uint(int(uint(_845) >> uint(2)));
    uint _849 = uint(int(uint(int(_847)) >> uint(2)));
    int _851 = int(_847) & 3;
    float _853 = (*spvDescriptorSet0.cp_c6)._m0[int(_849)][_851];
    int _855 = int(_847) + 1;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    int _859 = _855 & 3;
    float _861 = (*spvDescriptorSet0.cp_c6)._m0[int(_857)][_859];
    int _863 = _475 + 72;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    uint _867 = uint(int(uint(int(_865)) >> uint(2)));
    int _869 = int(_865) & 3;
    float _871 = (*spvDescriptorSet0.cp_c6)._m0[int(_867)][_869];
    int _873 = int(_865) + 1;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    int _877 = _873 & 3;
    float _879 = (*spvDescriptorSet0.cp_c6)._m0[int(_875)][_877];
    int _881 = _475 + 96;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.cp_c6)._m0[int(_893)][_895];
    int _899 = _475 + 104;
    uint _901 = uint(int(uint(_899) >> uint(2)));
    uint _903 = uint(int(uint(int(_901)) >> uint(2)));
    int _905 = int(_901) & 3;
    float _907 = (*spvDescriptorSet0.cp_c6)._m0[int(_903)][_905];
    int _909 = int(_901) + 1;
    uint _911 = uint(int(uint(_909) >> uint(2)));
    int _913 = _909 & 3;
    float _915 = (*spvDescriptorSet0.cp_c6)._m0[int(_911)][_913];
    int _917 = _475 + 16;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    uint _921 = uint(int(uint(int(_919)) >> uint(2)));
    int _923 = int(_919) & 3;
    float _925 = (*spvDescriptorSet0.cp_c6)._m0[int(_921)][_923];
    int _927 = int(_919) + 1;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    int _931 = _927 & 3;
    float _933 = (*spvDescriptorSet0.cp_c6)._m0[int(_929)][_931];
    if (!_821)
    {
        uint _935 = uint(int(uint(_467) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_935)] = as_type<uint>(_779);
        int _937 = _467 + 4;
        uint _939 = uint(int(uint(_937) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_939)] = as_type<uint>(_781);
        int _941 = _467 + 8;
        uint _943 = uint(int(uint(_941) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_943)] = as_type<uint>(_783);
        int _945 = _467 + 12;
        uint _947 = uint(int(uint(_945) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_947)] = as_type<uint>(_785);
        uint _949 = uint(int(uint(_491) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_949)] = as_type<uint>(_787);
        int _951 = _491 + 4;
        uint _953 = uint(int(uint(_951) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_953)] = as_type<uint>(_789);
        int _955 = _491 + 8;
        uint _957 = uint(int(uint(_955) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_957)] = as_type<uint>(_791);
        int _959 = _491 + 12;
        uint _961 = uint(int(uint(_959) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_961)] = as_type<uint>(_793);
        uint _963 = uint(int(uint(_493) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_963)] = as_type<uint>(_795);
        int _965 = _493 + 4;
        uint _967 = uint(int(uint(_965) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_967)] = as_type<uint>(_797);
        int _969 = _493 + 8;
        uint _971 = uint(int(uint(_969) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_971)] = as_type<uint>(_799);
        int _973 = _493 + 12;
        uint _975 = uint(int(uint(_973) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_975)] = as_type<uint>(_801);
    }
    float _977 = _789 * _811;
    float _979 = _797 * _811;
    int _981 = _475 + 32;
    uint _983 = uint(int(uint(_981) >> uint(2)));
    uint _985 = uint(int(uint(int(_983)) >> uint(2)));
    int _987 = int(_983) & 3;
    float _989 = (*spvDescriptorSet0.cp_c6)._m0[int(_985)][_987];
    int _991 = int(_983) + 1;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    int _995 = _991 & 3;
    float _997 = (*spvDescriptorSet0.cp_c6)._m0[int(_993)][_995];
    float _999 = _781 * _811;
    float _1001 = fma(_787, _831, _977);
    float _1003 = fma(_795, _831, _979);
    float _1005 = _781 * _819;
    float _1007 = _789 * _819;
    float _1009 = _797 * _819;
    float _1011 = _781 * _861;
    int _1013 = _475 + 48;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.cp_c6)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.cp_c6)._m0[int(_1025)][_1027];
    float _1031 = fma(_779, _839, _1005);
    float _1033 = fma(_787, _839, _1007);
    float _1035 = fma(_795, _839, _1009);
    float _1037 = _781 * _853;
    float _1039 = _797 * _853;
    float _1041 = _789 * _853;
    float _1043 = _789 * _861;
    float _1045 = _797 * _861;
    float _1047 = fma(_779, _871, _1037);
    int _1049 = _475 + 24;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
    int _1055 = int(_1051) & 3;
    float _1057 = (*spvDescriptorSet0.cp_c6)._m0[int(_1053)][_1055];
    int _1059 = int(_1051) + 1;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    int _1063 = _1059 & 3;
    float _1065 = (*spvDescriptorSet0.cp_c6)._m0[int(_1061)][_1063];
    float _1067 = fma(_779, _879, _1011);
    float _1069 = fma(_787, _871, _1041);
    float _1071 = fma(_787, _879, _1043);
    float _1073 = fma(_795, _871, _1039);
    float _1075 = fma(_795, _879, _1045);
    float _1077 = fma(_779, _831, _999);
    float _1079 = fma(_791, _915, _1071);
    int _1081 = _475 + 40;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    uint _1085 = uint(int(uint(int(_1083)) >> uint(2)));
    int _1087 = int(_1083) & 3;
    float _1089 = (*spvDescriptorSet0.cp_c6)._m0[int(_1085)][_1087];
    int _1091 = int(_1083) + 1;
    uint _1093 = uint(int(uint(_1091) >> uint(2)));
    int _1095 = _1091 & 3;
    float _1097 = (*spvDescriptorSet0.cp_c6)._m0[int(_1093)][_1095];
    float _1099 = fma(_783, _915, _1067);
    float _1101 = fma(_783, _889, _1077);
    float _1103 = _1079 + _793;
    float _1105 = fma(_783, _897, _1031);
    float _1107 = fma(_783, _907, _1047);
    float _1109 = fma(_791, _889, _1001);
    float _1111 = fma(_791, _897, _1033);
    int _1113 = _475 + 56;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.cp_c6)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.cp_c6)._m0[int(_1125)][_1127];
    float _1131 = fma(_791, _907, _1069);
    float _1133 = fma(_799, _915, _1075);
    float _1135 = _1099 + _785;
    float _1137 = _1103 * _933;
    float _1139 = fma(_799, _889, _1003);
    float _1141 = fma(_799, _897, _1035);
    float _1143 = fma(_799, _907, _1073);
    float _1145 = _1133 + _801;
    float _1147 = _1111 * _933;
    float _1149 = _1109 * _933;
    float _1151 = _1131 * _933;
    float _1153 = fma(_1135, _925, _1137);
    float _1155 = fma(_1105, _925, _1147);
    float _1157 = _1103 * _997;
    float _1159 = _1109 * _997;
    float _1161 = _1111 * _997;
    float _1163 = _1131 * _997;
    float _1165 = fma(_1135, _989, _1157);
    int _1167 = _843 * 48;
    float _1169 = fma(_1101, _925, _1149);
    float _1171 = fma(_1107, _925, _1151);
    float _1173 = _1103 * _1029;
    float _1175 = _1109 * _1029;
    float _1177 = _1111 * _1029;
    float _1179 = _1131 * _1029;
    float _1181 = fma(_1135, _1021, _1173);
    float _1183 = fma(_1101, _989, _1159);
    float _1185 = fma(_1105, _989, _1161);
    float _1187 = fma(_1107, _989, _1163);
    float _1189 = fma(_1101, _1021, _1175);
    float _1191 = fma(_1105, _1021, _1177);
    float _1193 = fma(_1145, _1057, _1153);
    float _1195 = fma(_1107, _1021, _1179);
    float _1197 = fma(_1141, _1057, _1155);
    float _1199 = fma(_1139, _1057, _1169);
    float _1201 = fma(_1143, _1057, _1171);
    float _1203 = _1193 + _1065;
    int _1205 = _1167 + 16;
    float _1207 = fma(_1145, _1089, _1165);
    float _1209 = fma(_1139, _1089, _1183);
    float _1211 = fma(_1141, _1089, _1185);
    float _1213 = fma(_1143, _1089, _1187);
    float _1215 = _1207 + _1097;
    int _1217 = _1167 + 32;
    uint _1219 = uint(int(uint(_1205) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1219)] = as_type<uint>(_1199);
    int _1221 = _1205 + 4;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1223)] = as_type<uint>(_1197);
    int _1225 = _1205 + 8;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1227)] = as_type<uint>(_1201);
    int _1229 = _1205 + 12;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1231)] = as_type<uint>(_1203);
    int _1233 = _1167 + 48;
    float _1235 = fma(_1145, _1121, _1181);
    float _1237 = fma(_1139, _1121, _1189);
    float _1239 = fma(_1141, _1121, _1191);
    float _1241 = fma(_1143, _1121, _1195);
    float _1243 = _1235 + _1129;
    uint _1245 = uint(int(uint(_1217) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1245)] = as_type<uint>(_1209);
    int _1247 = _1217 + 4;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1249)] = as_type<uint>(_1211);
    int _1251 = _1217 + 8;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1253)] = as_type<uint>(_1213);
    int _1255 = _1217 + 12;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1257)] = as_type<uint>(_1215);
    uint _1259 = uint(int(uint(_1233) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1259)] = as_type<uint>(_1237);
    int _1261 = _1233 + 4;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1263)] = as_type<uint>(_1239);
    int _1265 = _1233 + 8;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1267)] = as_type<uint>(_1241);
    int _1269 = _1233 + 12;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1271)] = as_type<uint>(_1243);
}

