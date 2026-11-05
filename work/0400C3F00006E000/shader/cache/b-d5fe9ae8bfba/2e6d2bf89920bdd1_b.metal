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
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3324, thread const int& _3325, constant _10& support_buffer)
{
    int _3328 = 1 + _3325;
    float _3330 = support_buffer._m5[_3328].x;
    bool _3332 = _3330 == 1.0;
    if (_3332)
    {
        return _3324;
    }
    float _3334 = float(_3324);
    float _3336 = _3334 * _3330;
    int _3338 = int(_3336);
    return _3338;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    if (_70)
    {
        return;
    }
    bool _72 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _74 = _66 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    bool _76 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _78 = _74 << 4;
    bool _80 = !_72;
    if (!_80)
    {
        uint _83 = uint(int(uint(_78) >> uint(2)));
        uint _85 = uint(int(uint(int(_83)) >> uint(2)));
        int _87 = int(_83) & 3;
        float _89 = (*spvDescriptorSet0.cp_c4)._m0[int(_85)][_87];
        int _91 = as_type<int>(_89) * 48;
        int _93 = 0;
        bool _95;
        do
        {
            int _97 = _93;
            int _99 = _91 + 8;
            uint _101 = uint(int(uint(_99) >> uint(2)));
            uint _103 = uint(int(uint(int(_101)) >> uint(2)));
            int _105 = int(_101) & 3;
            float _107 = (*spvDescriptorSet0.cp_c5)._m0[int(_103)][_105];
            uint _109 = uint(int(uint(_91) >> uint(2)));
            uint _111 = uint(int(uint(int(_109)) >> uint(2)));
            int _113 = int(_109) & 3;
            float _115 = (*spvDescriptorSet0.cp_c5)._m0[int(_111)][_113];
            int _117 = _97;
            int _119 = 0;
            int _121 = _56(_117, _119, (*spvDescriptorSet0.support_buffer));
            int _123 = as_type<int>(_107);
            int _125 = 0;
            int _127 = _56(_123, _125, (*spvDescriptorSet0.support_buffer));
            int3 _1363 = int3(_121, _127, 1);
            float3 _131 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1363.xy), uint(_1363.z), 0).xyz;
            float _133 = _131.x;
            float _135 = _131.y;
            float _137 = _131.z;
            int _139 = _97;
            int _141 = 1;
            int _143 = _56(_139, _141, (*spvDescriptorSet0.support_buffer));
            int _145 = as_type<int>(_115);
            int _147 = 1;
            int _149 = _56(_145, _147, (*spvDescriptorSet0.support_buffer));
            int3 _1381 = int3(_143, _149, 1);
            float3 _151 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1381.xy), uint(_1381.z), 0).xyz;
            float _153 = _151.x;
            float _155 = _151.y;
            float _157 = _151.z;
            int _159 = _97;
            int _161 = 0;
            int _163 = _56(_159, _161, (*spvDescriptorSet0.support_buffer));
            int _165 = as_type<int>(_107);
            int _167 = 0;
            int _169 = _56(_165, _167, (*spvDescriptorSet0.support_buffer));
            int3 _1399 = int3(_163, _169, 0);
            float3 _171 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1399.xy), uint(_1399.z), 0).xyz;
            float _173 = _171.x;
            float _175 = _171.y;
            float _177 = _171.z;
            int _179 = _97;
            int _181 = 1;
            int _183 = _56(_179, _181, (*spvDescriptorSet0.support_buffer));
            int _185 = as_type<int>(_115);
            int _187 = 1;
            int _189 = _56(_185, _187, (*spvDescriptorSet0.support_buffer));
            int3 _1417 = int3(_183, _189, 0);
            float3 _191 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1417.xy), uint(_1417.z), 0).xyz;
            float _193 = _191.x;
            float _195 = _191.y;
            float _197 = _191.z;
            int _199 = _97;
            int _201 = 0;
            int _203 = _56(_199, _201, (*spvDescriptorSet0.support_buffer));
            int _205 = as_type<int>(_107);
            int _207 = 0;
            int _209 = _56(_205, _207, (*spvDescriptorSet0.support_buffer));
            int3 _1435 = int3(_203, _209, 2);
            float3 _211 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1435.xy), uint(_1435.z), 0).xyz;
            float _213 = _211.x;
            float _215 = _211.y;
            float _217 = _211.z;
            int _219 = _97;
            int _221 = 1;
            int _223 = _56(_219, _221, (*spvDescriptorSet0.support_buffer));
            int _225 = as_type<int>(_115);
            int _227 = 1;
            int _229 = _56(_225, _227, (*spvDescriptorSet0.support_buffer));
            int3 _1453 = int3(_223, _229, 2);
            float3 _231 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1453.xy), uint(_1453.z), 0).xyz;
            float _233 = _231.x;
            float _235 = _231.y;
            float _237 = _231.z;
            int _239 = _91 + 28;
            uint _241 = uint(int(uint(_239) >> uint(2)));
            uint _243 = uint(int(uint(int(_241)) >> uint(2)));
            int _245 = int(_241) & 3;
            float _247 = (*spvDescriptorSet0.cp_c5)._m0[int(_243)][_245];
            int _249 = _91 + 20;
            uint _251 = uint(int(uint(_249) >> uint(2)));
            uint _253 = uint(int(uint(int(_251)) >> uint(2)));
            int _255 = int(_251) & 3;
            float _257 = (*spvDescriptorSet0.cp_c5)._m0[int(_253)][_255];
            float _259 = _133 * _247;
            float _261 = fma(_153, _257, _259);
            float _263 = _137 * _247;
            float _265 = _261 * 0.15915493667125701904296875;
            float _267 = fma(_157, _257, _263);
            float _269 = _265 * 6.283185482025146484375;
            float _271 = sin(_269);
            float _273 = _267 * 0.15915493667125701904296875;
            float _275 = _135 * _247;
            float _277 = fma(_155, _257, _275);
            float _279 = _265 * 6.283185482025146484375;
            float _281 = cos(_279);
            float _283 = _277 * 0.15915493667125701904296875;
            float _285 = _273 * 6.283185482025146484375;
            float _287 = sin(_285);
            float _289 = _273 * 6.283185482025146484375;
            float _291 = cos(_289);
            float _293 = _173 * _247;
            float _295 = _175 * _247;
            float _297 = _177 * _247;
            float _299 = _217 * _247;
            float _301 = fma(_193, _257, _293);
            float _303 = fma(_195, _257, _295);
            float _305 = fma(_197, _257, _297);
            float _307 = _283 * 6.283185482025146484375;
            float _309 = cos(_307);
            float _311 = _287 * _281;
            float _313 = fma(_237, _257, _299);
            float _315 = _283 * 6.283185482025146484375;
            float _317 = sin(_315);
            float _319 = _281 * _291;
            float _321 = _281 * _309;
            float _323 = _271 * _309;
            float _325 = _309 * _301;
            float _327 = _271 * _287;
            float _329 = _271 * _291;
            float _331 = _323 * _303;
            float _333 = _291 * _325;
            float _335 = _287 * _325;
            float _337 = _271 * _317;
            float _339 = fma(_317, _319, _327);
            float _341 = -_329;
            float _343 = fma(_317, _311, _341);
            float _345 = -_317;
            float _347 = fma(_345, _301, -0.0);
            float _349 = fma(_287, _337, _319);
            float _351 = _213 * _247;
            float _353 = -_311;
            float _355 = fma(_291, _337, _353);
            int _357 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _359 = _357 + _97;
            float _361 = _215 * _247;
            float _363 = fma(_233, _257, _351);
            float _365 = _355 * _303;
            float _367 = _349 * _303;
            float _369 = _321 * _305;
            float _371 = _339 * _305;
            float _373 = _343 * _305;
            int _375 = _359 * 48;
            float _377 = fma(_235, _257, _361);
            int _379 = _97 + 1;
            int _381 = _375 + 32;
            uint _383 = uint(int(uint(_381) >> uint(2)));
            _37[int(_383)] = as_type<uint>(_347);
            int _385 = _375 + 36;
            uint _387 = uint(int(uint(_385) >> uint(2)));
            _37[int(_387)] = as_type<uint>(_331);
            int _389 = _375 + 40;
            uint _391 = uint(int(uint(_389) >> uint(2)));
            _37[int(_391)] = as_type<uint>(_369);
            int _393 = _375 + 44;
            uint _395 = uint(int(uint(_393) >> uint(2)));
            _37[int(_395)] = as_type<uint>(_313);
            bool _397 = uint(_379) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            uint _399 = uint(int(uint(_375) >> uint(2)));
            _37[int(_399)] = as_type<uint>(_333);
            int _401 = _375 + 4;
            uint _403 = uint(int(uint(_401) >> uint(2)));
            _37[int(_403)] = as_type<uint>(_365);
            int _405 = _375 + 8;
            uint _407 = uint(int(uint(_405) >> uint(2)));
            _37[int(_407)] = as_type<uint>(_371);
            int _409 = _375 + 12;
            uint _411 = uint(int(uint(_409) >> uint(2)));
            _37[int(_411)] = as_type<uint>(_363);
            int _413 = _375 + 16;
            uint _415 = uint(int(uint(_413) >> uint(2)));
            _37[int(_415)] = as_type<uint>(_335);
            int _417 = _375 + 20;
            uint _419 = uint(int(uint(_417) >> uint(2)));
            _37[int(_419)] = as_type<uint>(_367);
            int _421 = _375 + 24;
            uint _423 = uint(int(uint(_421) >> uint(2)));
            _37[int(_423)] = as_type<uint>(_373);
            int _425 = _375 + 28;
            uint _427 = uint(int(uint(_425) >> uint(2)));
            _37[int(_427)] = as_type<uint>(_377);
            _95 = !_397;
            _93 = _379;
        } while (_95);
    }
    bool _429 = !_76;
    if (!_429)
    {
        int _431 = 1;
        bool _433;
        do
        {
            int _435 = _431;
            int _437 = _435 * 112;
            int _439 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _441 = _439 + _435;
            int _443 = _435 + 1;
            uint _445 = uint(int(uint(_437) >> uint(2)));
            uint _447 = uint(int(uint(int(_445)) >> uint(2)));
            int _449 = int(_445) & 3;
            float _451 = (*spvDescriptorSet0.cp_c6)._m0[int(_447)][_449];
            int _453 = _441 * 48;
            bool _455 = uint(_443) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _457 = _453 + 16;
            uint _459 = uint(int(uint(_457) >> uint(2)));
            float _461 = as_type<float>(_37[int(_459)]);
            int _463 = _453 + 20;
            uint _465 = uint(int(uint(_463) >> uint(2)));
            float _467 = as_type<float>(_37[int(_465)]);
            int _469 = _453 + 24;
            uint _471 = uint(int(uint(_469) >> uint(2)));
            float _473 = as_type<float>(_37[int(_471)]);
            int _475 = _453 + 28;
            uint _477 = uint(int(uint(_475) >> uint(2)));
            float _479 = as_type<float>(_37[int(_477)]);
            int _481 = _453 + 32;
            uint _483 = uint(int(uint(_481) >> uint(2)));
            float _485 = as_type<float>(_37[int(_483)]);
            int _487 = _453 + 36;
            uint _489 = uint(int(uint(_487) >> uint(2)));
            float _491 = as_type<float>(_37[int(_489)]);
            int _493 = _453 + 40;
            uint _495 = uint(int(uint(_493) >> uint(2)));
            float _497 = as_type<float>(_37[int(_495)]);
            int _499 = _453 + 44;
            uint _501 = uint(int(uint(_499) >> uint(2)));
            float _503 = as_type<float>(_37[int(_501)]);
            int _505 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _507 = _505 + as_type<int>(_451);
            int _509 = _507 * 48;
            uint _511 = uint(int(uint(_453) >> uint(2)));
            float _513 = as_type<float>(_37[int(_511)]);
            int _515 = _453 + 4;
            uint _517 = uint(int(uint(_515) >> uint(2)));
            float _519 = as_type<float>(_37[int(_517)]);
            int _521 = _453 + 8;
            uint _523 = uint(int(uint(_521) >> uint(2)));
            float _525 = as_type<float>(_37[int(_523)]);
            int _527 = _453 + 12;
            uint _529 = uint(int(uint(_527) >> uint(2)));
            float _531 = as_type<float>(_37[int(_529)]);
            uint _533 = uint(int(uint(_509) >> uint(2)));
            float _535 = as_type<float>(_37[int(_533)]);
            int _537 = _509 + 4;
            uint _539 = uint(int(uint(_537) >> uint(2)));
            float _541 = as_type<float>(_37[int(_539)]);
            int _543 = _509 + 8;
            uint _545 = uint(int(uint(_543) >> uint(2)));
            float _547 = as_type<float>(_37[int(_545)]);
            int _549 = _509 + 12;
            uint _551 = uint(int(uint(_549) >> uint(2)));
            float _553 = as_type<float>(_37[int(_551)]);
            int _555 = _509 + 16;
            uint _557 = uint(int(uint(_555) >> uint(2)));
            float _559 = as_type<float>(_37[int(_557)]);
            int _561 = _509 + 20;
            uint _563 = uint(int(uint(_561) >> uint(2)));
            float _565 = as_type<float>(_37[int(_563)]);
            int _567 = _509 + 24;
            uint _569 = uint(int(uint(_567) >> uint(2)));
            float _571 = as_type<float>(_37[int(_569)]);
            int _573 = _509 + 28;
            uint _575 = uint(int(uint(_573) >> uint(2)));
            float _577 = as_type<float>(_37[int(_575)]);
            int _579 = _509 + 32;
            uint _581 = uint(int(uint(_579) >> uint(2)));
            float _583 = as_type<float>(_37[int(_581)]);
            int _585 = _509 + 36;
            uint _587 = uint(int(uint(_585) >> uint(2)));
            float _589 = as_type<float>(_37[int(_587)]);
            int _591 = _509 + 40;
            uint _593 = uint(int(uint(_591) >> uint(2)));
            float _595 = as_type<float>(_37[int(_593)]);
            int _597 = _509 + 44;
            uint _599 = uint(int(uint(_597) >> uint(2)));
            float _601 = as_type<float>(_37[int(_599)]);
            float _603 = _479 * _541;
            float _605 = _467 * _541;
            float _607 = _461 * _541;
            float _609 = _473 * _541;
            float _611 = fma(_531, _535, _603);
            float _613 = fma(_519, _535, _605);
            float _615 = fma(_513, _535, _607);
            float _617 = fma(_525, _535, _609);
            float _619 = fma(_503, _547, _611);
            float _621 = fma(_491, _547, _613);
            float _623 = _467 * _565;
            float _625 = _461 * _565;
            float _627 = _553 + _619;
            float _629 = _479 * _565;
            float _631 = _473 * _565;
            float _633 = fma(_519, _559, _623);
            float _635 = fma(_485, _547, _615);
            float _637 = fma(_531, _559, _629);
            float _639 = fma(_525, _559, _631);
            float _641 = fma(_491, _571, _633);
            float _643 = _479 * _589;
            float _645 = _461 * _589;
            float _647 = _467 * _589;
            float _649 = _473 * _589;
            float _651 = fma(_531, _583, _643);
            float _653 = fma(_513, _559, _625);
            float _655 = fma(_503, _571, _637);
            float _657 = fma(_513, _583, _645);
            float _659 = fma(_519, _583, _647);
            float _661 = fma(_525, _583, _649);
            float _663 = fma(_503, _595, _651);
            float _665 = fma(_485, _571, _653);
            float _667 = fma(_497, _547, _617);
            float _669 = fma(_497, _571, _639);
            float _671 = _577 + _655;
            float _673 = fma(_485, _595, _657);
            float _675 = fma(_491, _595, _659);
            float _677 = fma(_497, _595, _661);
            float _679 = _601 + _663;
            uint _681 = uint(int(uint(_453) >> uint(2)));
            _37[int(_681)] = as_type<uint>(_635);
            int _683 = _453 + 4;
            uint _685 = uint(int(uint(_683) >> uint(2)));
            _37[int(_685)] = as_type<uint>(_621);
            int _687 = _453 + 8;
            uint _689 = uint(int(uint(_687) >> uint(2)));
            _37[int(_689)] = as_type<uint>(_667);
            int _691 = _453 + 12;
            uint _693 = uint(int(uint(_691) >> uint(2)));
            _37[int(_693)] = as_type<uint>(_627);
            int _695 = _453 + 16;
            uint _697 = uint(int(uint(_695) >> uint(2)));
            _37[int(_697)] = as_type<uint>(_665);
            int _699 = _453 + 20;
            uint _701 = uint(int(uint(_699) >> uint(2)));
            _37[int(_701)] = as_type<uint>(_641);
            int _703 = _453 + 24;
            uint _705 = uint(int(uint(_703) >> uint(2)));
            _37[int(_705)] = as_type<uint>(_669);
            int _707 = _453 + 28;
            uint _709 = uint(int(uint(_707) >> uint(2)));
            _37[int(_709)] = as_type<uint>(_671);
            int _711 = _453 + 32;
            uint _713 = uint(int(uint(_711) >> uint(2)));
            _37[int(_713)] = as_type<uint>(_673);
            int _715 = _453 + 36;
            uint _717 = uint(int(uint(_715) >> uint(2)));
            _37[int(_717)] = as_type<uint>(_675);
            int _719 = _453 + 40;
            uint _721 = uint(int(uint(_719) >> uint(2)));
            _37[int(_721)] = as_type<uint>(_677);
            int _723 = _453 + 44;
            uint _725 = uint(int(uint(_723) >> uint(2)));
            _37[int(_725)] = as_type<uint>(_679);
            _433 = !_455;
            _431 = _443;
        } while (_433);
    }
    if (!_72)
    {
        return;
    }
    int _727 = 0;
    bool _729;
    do
    {
        int _731 = _727;
        int _733 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _735 = _733 + _731;
        int _737 = _731 * 112;
        int _739 = _735 * 48;
        int _741 = _737 + 80;
        uint _743 = uint(int(uint(_741) >> uint(2)));
        uint _745 = uint(int(uint(int(_743)) >> uint(2)));
        int _747 = int(_743) & 3;
        float _749 = (*spvDescriptorSet0.cp_c6)._m0[int(_745)][_747];
        int _751 = int(_743) + 1;
        uint _753 = uint(int(uint(_751) >> uint(2)));
        int _755 = _751 & 3;
        float _757 = (*spvDescriptorSet0.cp_c6)._m0[int(_753)][_755];
        uint _759 = uint(int(uint(_739) >> uint(2)));
        float _761 = as_type<float>(_37[int(_759)]);
        int _763 = _739 + 4;
        uint _765 = uint(int(uint(_763) >> uint(2)));
        float _767 = as_type<float>(_37[int(_765)]);
        int _769 = _739 + 8;
        uint _771 = uint(int(uint(_769) >> uint(2)));
        float _773 = as_type<float>(_37[int(_771)]);
        int _775 = _739 + 12;
        uint _777 = uint(int(uint(_775) >> uint(2)));
        float _779 = as_type<float>(_37[int(_777)]);
        int _781 = _739 + 16;
        uint _783 = uint(int(uint(_781) >> uint(2)));
        float _785 = as_type<float>(_37[int(_783)]);
        int _787 = _739 + 20;
        uint _789 = uint(int(uint(_787) >> uint(2)));
        float _791 = as_type<float>(_37[int(_789)]);
        int _793 = _739 + 24;
        uint _795 = uint(int(uint(_793) >> uint(2)));
        float _797 = as_type<float>(_37[int(_795)]);
        int _799 = _739 + 28;
        uint _801 = uint(int(uint(_799) >> uint(2)));
        float _803 = as_type<float>(_37[int(_801)]);
        int _805 = _737 + 88;
        uint _807 = uint(int(uint(_805) >> uint(2)));
        uint _809 = uint(int(uint(int(_807)) >> uint(2)));
        int _811 = int(_807) & 3;
        float _813 = (*spvDescriptorSet0.cp_c6)._m0[int(_809)][_811];
        int _815 = int(_807) + 1;
        uint _817 = uint(int(uint(_815) >> uint(2)));
        int _819 = _815 & 3;
        float _821 = (*spvDescriptorSet0.cp_c6)._m0[int(_817)][_819];
        int _823 = _739 + 32;
        uint _825 = uint(int(uint(_823) >> uint(2)));
        float _827 = as_type<float>(_37[int(_825)]);
        int _829 = _739 + 36;
        uint _831 = uint(int(uint(_829) >> uint(2)));
        float _833 = as_type<float>(_37[int(_831)]);
        int _835 = _739 + 40;
        uint _837 = uint(int(uint(_835) >> uint(2)));
        float _839 = as_type<float>(_37[int(_837)]);
        int _841 = _739 + 44;
        uint _843 = uint(int(uint(_841) >> uint(2)));
        float _845 = as_type<float>(_37[int(_843)]);
        int _847 = _737 + 64;
        uint _849 = uint(int(uint(_847) >> uint(2)));
        uint _851 = uint(int(uint(int(_849)) >> uint(2)));
        int _853 = int(_849) & 3;
        float _855 = (*spvDescriptorSet0.cp_c6)._m0[int(_851)][_853];
        int _857 = int(_849) + 1;
        uint _859 = uint(int(uint(_857) >> uint(2)));
        int _861 = _857 & 3;
        float _863 = (*spvDescriptorSet0.cp_c6)._m0[int(_859)][_861];
        int _865 = _737 + 72;
        uint _867 = uint(int(uint(_865) >> uint(2)));
        uint _869 = uint(int(uint(int(_867)) >> uint(2)));
        int _871 = int(_867) & 3;
        float _873 = (*spvDescriptorSet0.cp_c6)._m0[int(_869)][_871];
        int _875 = int(_867) + 1;
        uint _877 = uint(int(uint(_875) >> uint(2)));
        int _879 = _875 & 3;
        float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
        int _883 = _737 + 104;
        uint _885 = uint(int(uint(_883) >> uint(2)));
        uint _887 = uint(int(uint(int(_885)) >> uint(2)));
        int _889 = int(_885) & 3;
        float _891 = (*spvDescriptorSet0.cp_c6)._m0[int(_887)][_889];
        int _893 = int(_885) + 1;
        uint _895 = uint(int(uint(_893) >> uint(2)));
        int _897 = _893 & 3;
        float _899 = (*spvDescriptorSet0.cp_c6)._m0[int(_895)][_897];
        int _901 = _737 + 96;
        uint _903 = uint(int(uint(_901) >> uint(2)));
        uint _905 = uint(int(uint(int(_903)) >> uint(2)));
        int _907 = int(_903) & 3;
        float _909 = (*spvDescriptorSet0.cp_c6)._m0[int(_905)][_907];
        int _911 = int(_903) + 1;
        uint _913 = uint(int(uint(_911) >> uint(2)));
        int _915 = _911 & 3;
        float _917 = (*spvDescriptorSet0.cp_c6)._m0[int(_913)][_915];
        float _919 = _767 * _749;
        float _921 = _767 * _757;
        float _923 = _767 * _813;
        float _925 = _767 * _821;
        float _927 = fma(_761, _855, _919);
        float _929 = fma(_761, _863, _921);
        float _931 = fma(_761, _873, _923);
        float _933 = fma(_761, _881, _925);
        float _935 = _791 * _749;
        float _937 = _791 * _757;
        float _939 = _791 * _813;
        float _941 = _791 * _821;
        float _943 = _833 * _749;
        float _945 = fma(_785, _855, _935);
        float _947 = fma(_785, _863, _937);
        float _949 = fma(_785, _873, _939);
        uint _951 = uint(int(uint(_78) >> uint(2)));
        uint _953 = uint(int(uint(int(_951)) >> uint(2)));
        int _955 = int(_951) & 3;
        float _957 = (*spvDescriptorSet0.cp_c4)._m0[int(_953)][_955];
        float _959 = fma(_785, _881, _941);
        float _961 = _833 * _757;
        float _963 = _833 * _813;
        float _965 = _833 * _821;
        float _967 = fma(_827, _855, _943);
        float _969 = fma(_827, _863, _961);
        float _971 = fma(_827, _873, _963);
        int _973 = _737 + 16;
        uint _975 = uint(int(uint(_973) >> uint(2)));
        uint _977 = uint(int(uint(int(_975)) >> uint(2)));
        int _979 = int(_975) & 3;
        float _981 = (*spvDescriptorSet0.cp_c6)._m0[int(_977)][_979];
        int _983 = int(_975) + 1;
        uint _985 = uint(int(uint(_983) >> uint(2)));
        int _987 = _983 & 3;
        float _989 = (*spvDescriptorSet0.cp_c6)._m0[int(_985)][_987];
        float _991 = fma(_827, _881, _965);
        float _993 = fma(_797, _899, _959);
        float _995 = fma(_773, _909, _927);
        float _997 = fma(_773, _917, _929);
        float _999 = fma(_773, _891, _931);
        float _1001 = fma(_773, _899, _933);
        float _1003 = fma(_797, _909, _945);
        int _1005 = _737 + 24;
        uint _1007 = uint(int(uint(_1005) >> uint(2)));
        uint _1009 = uint(int(uint(int(_1007)) >> uint(2)));
        int _1011 = int(_1007) & 3;
        float _1013 = (*spvDescriptorSet0.cp_c6)._m0[int(_1009)][_1011];
        int _1015 = int(_1007) + 1;
        uint _1017 = uint(int(uint(_1015) >> uint(2)));
        int _1019 = _1015 & 3;
        float _1021 = (*spvDescriptorSet0.cp_c6)._m0[int(_1017)][_1019];
        float _1023 = fma(_797, _917, _947);
        float _1025 = fma(_797, _891, _949);
        float _1027 = fma(_839, _909, _967);
        float _1029 = fma(_839, _917, _969);
        float _1031 = fma(_839, _899, _991);
        float _1033 = fma(_839, _891, _971);
        float _1035 = _803 + _993;
        int _1037 = _737 + 32;
        uint _1039 = uint(int(uint(_1037) >> uint(2)));
        uint _1041 = uint(int(uint(int(_1039)) >> uint(2)));
        int _1043 = int(_1039) & 3;
        float _1045 = (*spvDescriptorSet0.cp_c6)._m0[int(_1041)][_1043];
        int _1047 = int(_1039) + 1;
        uint _1049 = uint(int(uint(_1047) >> uint(2)));
        int _1051 = _1047 & 3;
        float _1053 = (*spvDescriptorSet0.cp_c6)._m0[int(_1049)][_1051];
        float _1055 = _845 + _1031;
        float _1057 = _779 + _1001;
        int _1059 = _737 + 48;
        uint _1061 = uint(int(uint(_1059) >> uint(2)));
        uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
        int _1065 = int(_1061) & 3;
        float _1067 = (*spvDescriptorSet0.cp_c6)._m0[int(_1063)][_1065];
        int _1069 = int(_1061) + 1;
        uint _1071 = uint(int(uint(_1069) >> uint(2)));
        int _1073 = _1069 & 3;
        float _1075 = (*spvDescriptorSet0.cp_c6)._m0[int(_1071)][_1073];
        float _1077 = _1003 * _989;
        float _1079 = _1023 * _989;
        float _1081 = _1035 * _989;
        float _1083 = _1025 * _989;
        float _1085 = fma(_995, _981, _1077);
        float _1087 = fma(_997, _981, _1079);
        float _1089 = fma(_1057, _981, _1081);
        float _1091 = fma(_999, _981, _1083);
        int _1093 = _737 + 40;
        uint _1095 = uint(int(uint(_1093) >> uint(2)));
        uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
        int _1099 = int(_1095) & 3;
        float _1101 = (*spvDescriptorSet0.cp_c6)._m0[int(_1097)][_1099];
        int _1103 = int(_1095) + 1;
        uint _1105 = uint(int(uint(_1103) >> uint(2)));
        int _1107 = _1103 & 3;
        float _1109 = (*spvDescriptorSet0.cp_c6)._m0[int(_1105)][_1107];
        float _1111 = fma(_1027, _1013, _1085);
        float _1113 = fma(_1055, _1013, _1089);
        float _1115 = fma(_1029, _1013, _1087);
        float _1117 = fma(_1033, _1013, _1091);
        float _1119 = _1113 + _1021;
        float _1121 = _1035 * _1053;
        int _1123 = _737 + 56;
        uint _1125 = uint(int(uint(_1123) >> uint(2)));
        uint _1127 = uint(int(uint(int(_1125)) >> uint(2)));
        int _1129 = int(_1125) & 3;
        float _1131 = (*spvDescriptorSet0.cp_c6)._m0[int(_1127)][_1129];
        int _1133 = int(_1125) + 1;
        uint _1135 = uint(int(uint(_1133) >> uint(2)));
        int _1137 = _1133 & 3;
        float _1139 = (*spvDescriptorSet0.cp_c6)._m0[int(_1135)][_1137];
        float _1141 = _1003 * _1053;
        float _1143 = _1023 * _1053;
        int _1145 = as_type<int>(_957) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1147 = _1145 + _731;
        int _1149 = _731 + 1;
        float _1151 = _1025 * _1053;
        float _1153 = fma(_1057, _1045, _1121);
        float _1155 = _1035 * _1075;
        float _1157 = _1003 * _1075;
        float _1159 = _1023 * _1075;
        float _1161 = fma(_997, _1045, _1143);
        float _1163 = _1025 * _1075;
        float _1165 = fma(_1057, _1067, _1155);
        float _1167 = fma(_995, _1067, _1157);
        int _1169 = _1147 * 48;
        bool _1171 = uint(_1149) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1173 = fma(_997, _1067, _1159);
        float _1175 = fma(_995, _1045, _1141);
        float _1177 = fma(_999, _1045, _1151);
        float _1179 = fma(_1055, _1101, _1153);
        float _1181 = fma(_999, _1067, _1163);
        float _1183 = fma(_1029, _1101, _1161);
        float _1185 = fma(_1027, _1101, _1175);
        float _1187 = fma(_1033, _1101, _1177);
        float _1189 = fma(_1055, _1131, _1165);
        float _1191 = fma(_1027, _1131, _1167);
        float _1193 = fma(_1029, _1131, _1173);
        int _1195 = _1169 + 16;
        float _1197 = _1179 + _1109;
        int _1199 = _1169 + 32;
        float _1201 = fma(_1033, _1131, _1181);
        float _1203 = _1189 + _1139;
        int _1205 = _1169 + 48;
        uint _1207 = uint(int(uint(_1195) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1207)] = as_type<uint>(_1111);
        int _1209 = _1195 + 4;
        uint _1211 = uint(int(uint(_1209) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1211)] = as_type<uint>(_1115);
        int _1213 = _1195 + 8;
        uint _1215 = uint(int(uint(_1213) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1215)] = as_type<uint>(_1117);
        int _1217 = _1195 + 12;
        uint _1219 = uint(int(uint(_1217) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1219)] = as_type<uint>(_1119);
        uint _1221 = uint(int(uint(_1199) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1221)] = as_type<uint>(_1185);
        int _1223 = _1199 + 4;
        uint _1225 = uint(int(uint(_1223) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1225)] = as_type<uint>(_1183);
        int _1227 = _1199 + 8;
        uint _1229 = uint(int(uint(_1227) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1229)] = as_type<uint>(_1187);
        int _1231 = _1199 + 12;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1233)] = as_type<uint>(_1197);
        uint _1235 = uint(int(uint(_1205) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1235)] = as_type<uint>(_1191);
        int _1237 = _1205 + 4;
        uint _1239 = uint(int(uint(_1237) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1239)] = as_type<uint>(_1193);
        int _1241 = _1205 + 8;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1243)] = as_type<uint>(_1201);
        int _1245 = _1205 + 12;
        uint _1247 = uint(int(uint(_1245) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1247)] = as_type<uint>(_1203);
        _729 = !_1171;
        _727 = _1149;
    } while (_729);
}

