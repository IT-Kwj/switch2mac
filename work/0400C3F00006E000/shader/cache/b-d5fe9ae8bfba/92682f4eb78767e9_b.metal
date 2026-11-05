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
int _54(thread const int& _3028, thread const int& _3029, constant _10& support_buffer)
{
    int _3032 = 1 + _3029;
    float _3034 = support_buffer._m5[_3032].x;
    bool _3036 = _3034 == 1.0;
    if (_3036)
    {
        return _3028;
    }
    float _3038 = float(_3028);
    float _3040 = _3038 * _3034;
    int _3042 = int(_3040);
    return _3042;
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
    bool _72 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _74 = _64 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _76 = _74 << 4;
    bool _78 = !_70;
    if (!_78)
    {
        uint _81 = uint(int(uint(_76) >> uint(2)));
        uint _83 = uint(int(uint(int(_81)) >> uint(2)));
        int _85 = int(_81) & 3;
        float _87 = (*spvDescriptorSet0.cp_c4)._m0[int(_83)][_85];
        int _89 = as_type<int>(_87) * 48;
        int _91 = 0;
        bool _93;
        do
        {
            int _95 = _91;
            uint _97 = uint(int(uint(_89) >> uint(2)));
            uint _99 = uint(int(uint(int(_97)) >> uint(2)));
            int _101 = int(_97) & 3;
            float _103 = (*spvDescriptorSet0.cp_c5)._m0[int(_99)][_101];
            int _105 = _95;
            int _107 = 0;
            int _109 = _54(_105, _107, (*spvDescriptorSet0.support_buffer));
            int _111 = as_type<int>(_103);
            int _113 = 0;
            int _115 = _54(_111, _113, (*spvDescriptorSet0.support_buffer));
            int3 _1217 = int3(_109, _115, 1);
            float3 _119 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1217.xy), uint(_1217.z), 0).xyz;
            float _121 = _119.x;
            float _123 = _119.y;
            float _125 = _119.z;
            int _127 = _95;
            int _129 = 0;
            int _131 = _54(_127, _129, (*spvDescriptorSet0.support_buffer));
            int _133 = as_type<int>(_103);
            int _135 = 0;
            int _137 = _54(_133, _135, (*spvDescriptorSet0.support_buffer));
            int3 _1235 = int3(_131, _137, 0);
            float3 _139 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1235.xy), uint(_1235.z), 0).xyz;
            float _141 = _139.x;
            float _143 = _139.y;
            float _145 = _139.z;
            int _147 = _95;
            int _149 = 0;
            int _151 = _54(_147, _149, (*spvDescriptorSet0.support_buffer));
            int _153 = as_type<int>(_103);
            int _155 = 0;
            int _157 = _54(_153, _155, (*spvDescriptorSet0.support_buffer));
            int3 _1253 = int3(_151, _157, 2);
            float3 _159 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1253.xy), uint(_1253.z), 0).xyz;
            float _161 = _159.x;
            float _163 = _159.y;
            float _165 = _159.z;
            float _167 = _121 * 0.15915493667125701904296875;
            float _169 = _125 * 0.15915493667125701904296875;
            float _171 = _123 * 0.15915493667125701904296875;
            float _173 = _167 * 6.283185482025146484375;
            float _175 = sin(_173);
            float _177 = _167 * 6.283185482025146484375;
            float _179 = cos(_177);
            float _181 = _169 * 6.283185482025146484375;
            float _183 = sin(_181);
            float _185 = _169 * 6.283185482025146484375;
            float _187 = cos(_185);
            float _189 = _171 * 6.283185482025146484375;
            float _191 = cos(_189);
            float _193 = _171 * 6.283185482025146484375;
            float _195 = sin(_193);
            float _197 = _179 * _187;
            float _199 = _183 * _179;
            float _201 = _175 * _183;
            float _203 = _175 * _187;
            float _205 = _179 * _191;
            float _207 = _175 * _191;
            float _209 = _191 * _141;
            float _211 = _145 * _205;
            float _213 = _143 * _207;
            float _215 = _175 * _195;
            float _217 = fma(_195, _197, _201);
            float _219 = -_141;
            float _221 = fma(_219, _195, -0.0);
            float _223 = -_203;
            float _225 = fma(_195, _199, _223);
            float _227 = fma(_183, _215, _197);
            float _229 = -_199;
            float _231 = fma(_187, _215, _229);
            int _233 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _235 = _233 + _95;
            float _237 = _187 * _209;
            float _239 = _183 * _209;
            float _241 = _143 * _231;
            float _243 = _143 * _227;
            float _245 = _145 * _217;
            float _247 = _145 * _225;
            int _249 = _235 * 48;
            int _251 = _95 + 1;
            int _253 = _249 + 32;
            uint _255 = uint(int(uint(_253) >> uint(2)));
            _37[int(_255)] = as_type<uint>(_221);
            int _257 = _249 + 36;
            uint _259 = uint(int(uint(_257) >> uint(2)));
            _37[int(_259)] = as_type<uint>(_213);
            int _261 = _249 + 40;
            uint _263 = uint(int(uint(_261) >> uint(2)));
            _37[int(_263)] = as_type<uint>(_211);
            int _265 = _249 + 44;
            uint _267 = uint(int(uint(_265) >> uint(2)));
            _37[int(_267)] = as_type<uint>(_165);
            bool _269 = uint(_251) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            uint _271 = uint(int(uint(_249) >> uint(2)));
            _37[int(_271)] = as_type<uint>(_237);
            int _273 = _249 + 4;
            uint _275 = uint(int(uint(_273) >> uint(2)));
            _37[int(_275)] = as_type<uint>(_241);
            int _277 = _249 + 8;
            uint _279 = uint(int(uint(_277) >> uint(2)));
            _37[int(_279)] = as_type<uint>(_245);
            int _281 = _249 + 12;
            uint _283 = uint(int(uint(_281) >> uint(2)));
            _37[int(_283)] = as_type<uint>(_161);
            int _285 = _249 + 16;
            uint _287 = uint(int(uint(_285) >> uint(2)));
            _37[int(_287)] = as_type<uint>(_239);
            int _289 = _249 + 20;
            uint _291 = uint(int(uint(_289) >> uint(2)));
            _37[int(_291)] = as_type<uint>(_243);
            int _293 = _249 + 24;
            uint _295 = uint(int(uint(_293) >> uint(2)));
            _37[int(_295)] = as_type<uint>(_247);
            int _297 = _249 + 28;
            uint _299 = uint(int(uint(_297) >> uint(2)));
            _37[int(_299)] = as_type<uint>(_163);
            _93 = !_269;
            _91 = _251;
        } while (_93);
    }
    bool _301 = !_72;
    if (!_301)
    {
        int _303 = 1;
        bool _305;
        do
        {
            int _307 = _303;
            int _309 = _307 * 112;
            int _311 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _313 = _311 + _307;
            int _315 = _307 + 1;
            uint _317 = uint(int(uint(_309) >> uint(2)));
            uint _319 = uint(int(uint(int(_317)) >> uint(2)));
            int _321 = int(_317) & 3;
            float _323 = (*spvDescriptorSet0.cp_c6)._m0[int(_319)][_321];
            int _325 = _313 * 48;
            bool _327 = uint(_315) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _329 = _325 + 16;
            uint _331 = uint(int(uint(_329) >> uint(2)));
            float _333 = as_type<float>(_37[int(_331)]);
            int _335 = _325 + 20;
            uint _337 = uint(int(uint(_335) >> uint(2)));
            float _339 = as_type<float>(_37[int(_337)]);
            int _341 = _325 + 24;
            uint _343 = uint(int(uint(_341) >> uint(2)));
            float _345 = as_type<float>(_37[int(_343)]);
            int _347 = _325 + 28;
            uint _349 = uint(int(uint(_347) >> uint(2)));
            float _351 = as_type<float>(_37[int(_349)]);
            int _353 = _325 + 32;
            uint _355 = uint(int(uint(_353) >> uint(2)));
            float _357 = as_type<float>(_37[int(_355)]);
            int _359 = _325 + 36;
            uint _361 = uint(int(uint(_359) >> uint(2)));
            float _363 = as_type<float>(_37[int(_361)]);
            int _365 = _325 + 40;
            uint _367 = uint(int(uint(_365) >> uint(2)));
            float _369 = as_type<float>(_37[int(_367)]);
            int _371 = _325 + 44;
            uint _373 = uint(int(uint(_371) >> uint(2)));
            float _375 = as_type<float>(_37[int(_373)]);
            int _377 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _379 = _377 + as_type<int>(_323);
            int _381 = _379 * 48;
            uint _383 = uint(int(uint(_325) >> uint(2)));
            float _385 = as_type<float>(_37[int(_383)]);
            int _387 = _325 + 4;
            uint _389 = uint(int(uint(_387) >> uint(2)));
            float _391 = as_type<float>(_37[int(_389)]);
            int _393 = _325 + 8;
            uint _395 = uint(int(uint(_393) >> uint(2)));
            float _397 = as_type<float>(_37[int(_395)]);
            int _399 = _325 + 12;
            uint _401 = uint(int(uint(_399) >> uint(2)));
            float _403 = as_type<float>(_37[int(_401)]);
            uint _405 = uint(int(uint(_381) >> uint(2)));
            float _407 = as_type<float>(_37[int(_405)]);
            int _409 = _381 + 4;
            uint _411 = uint(int(uint(_409) >> uint(2)));
            float _413 = as_type<float>(_37[int(_411)]);
            int _415 = _381 + 8;
            uint _417 = uint(int(uint(_415) >> uint(2)));
            float _419 = as_type<float>(_37[int(_417)]);
            int _421 = _381 + 12;
            uint _423 = uint(int(uint(_421) >> uint(2)));
            float _425 = as_type<float>(_37[int(_423)]);
            int _427 = _381 + 16;
            uint _429 = uint(int(uint(_427) >> uint(2)));
            float _431 = as_type<float>(_37[int(_429)]);
            int _433 = _381 + 20;
            uint _435 = uint(int(uint(_433) >> uint(2)));
            float _437 = as_type<float>(_37[int(_435)]);
            int _439 = _381 + 24;
            uint _441 = uint(int(uint(_439) >> uint(2)));
            float _443 = as_type<float>(_37[int(_441)]);
            int _445 = _381 + 28;
            uint _447 = uint(int(uint(_445) >> uint(2)));
            float _449 = as_type<float>(_37[int(_447)]);
            int _451 = _381 + 32;
            uint _453 = uint(int(uint(_451) >> uint(2)));
            float _455 = as_type<float>(_37[int(_453)]);
            int _457 = _381 + 36;
            uint _459 = uint(int(uint(_457) >> uint(2)));
            float _461 = as_type<float>(_37[int(_459)]);
            int _463 = _381 + 40;
            uint _465 = uint(int(uint(_463) >> uint(2)));
            float _467 = as_type<float>(_37[int(_465)]);
            int _469 = _381 + 44;
            uint _471 = uint(int(uint(_469) >> uint(2)));
            float _473 = as_type<float>(_37[int(_471)]);
            float _475 = _351 * _413;
            float _477 = _339 * _413;
            float _479 = _333 * _413;
            float _481 = _345 * _413;
            float _483 = fma(_403, _407, _475);
            float _485 = fma(_391, _407, _477);
            float _487 = fma(_385, _407, _479);
            float _489 = fma(_397, _407, _481);
            float _491 = fma(_375, _419, _483);
            float _493 = fma(_363, _419, _485);
            float _495 = _339 * _437;
            float _497 = _333 * _437;
            float _499 = _425 + _491;
            float _501 = _351 * _437;
            float _503 = _345 * _437;
            float _505 = fma(_391, _431, _495);
            float _507 = fma(_357, _419, _487);
            float _509 = fma(_403, _431, _501);
            float _511 = fma(_397, _431, _503);
            float _513 = fma(_363, _443, _505);
            float _515 = _351 * _461;
            float _517 = _333 * _461;
            float _519 = _339 * _461;
            float _521 = _345 * _461;
            float _523 = fma(_403, _455, _515);
            float _525 = fma(_385, _431, _497);
            float _527 = fma(_375, _443, _509);
            float _529 = fma(_385, _455, _517);
            float _531 = fma(_391, _455, _519);
            float _533 = fma(_397, _455, _521);
            float _535 = fma(_375, _467, _523);
            float _537 = fma(_357, _443, _525);
            float _539 = fma(_369, _419, _489);
            float _541 = fma(_369, _443, _511);
            float _543 = _449 + _527;
            float _545 = fma(_357, _467, _529);
            float _547 = fma(_363, _467, _531);
            float _549 = fma(_369, _467, _533);
            float _551 = _473 + _535;
            uint _553 = uint(int(uint(_325) >> uint(2)));
            _37[int(_553)] = as_type<uint>(_507);
            int _555 = _325 + 4;
            uint _557 = uint(int(uint(_555) >> uint(2)));
            _37[int(_557)] = as_type<uint>(_493);
            int _559 = _325 + 8;
            uint _561 = uint(int(uint(_559) >> uint(2)));
            _37[int(_561)] = as_type<uint>(_539);
            int _563 = _325 + 12;
            uint _565 = uint(int(uint(_563) >> uint(2)));
            _37[int(_565)] = as_type<uint>(_499);
            int _567 = _325 + 16;
            uint _569 = uint(int(uint(_567) >> uint(2)));
            _37[int(_569)] = as_type<uint>(_537);
            int _571 = _325 + 20;
            uint _573 = uint(int(uint(_571) >> uint(2)));
            _37[int(_573)] = as_type<uint>(_513);
            int _575 = _325 + 24;
            uint _577 = uint(int(uint(_575) >> uint(2)));
            _37[int(_577)] = as_type<uint>(_541);
            int _579 = _325 + 28;
            uint _581 = uint(int(uint(_579) >> uint(2)));
            _37[int(_581)] = as_type<uint>(_543);
            int _583 = _325 + 32;
            uint _585 = uint(int(uint(_583) >> uint(2)));
            _37[int(_585)] = as_type<uint>(_545);
            int _587 = _325 + 36;
            uint _589 = uint(int(uint(_587) >> uint(2)));
            _37[int(_589)] = as_type<uint>(_547);
            int _591 = _325 + 40;
            uint _593 = uint(int(uint(_591) >> uint(2)));
            _37[int(_593)] = as_type<uint>(_549);
            int _595 = _325 + 44;
            uint _597 = uint(int(uint(_595) >> uint(2)));
            _37[int(_597)] = as_type<uint>(_551);
            _305 = !_327;
            _303 = _315;
        } while (_305);
    }
    if (!_70)
    {
        return;
    }
    int _599 = 0;
    bool _601;
    do
    {
        int _603 = _599;
        int _605 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _607 = _605 + _603;
        uint _609 = uint(int(uint(_76) >> uint(2)));
        uint _611 = uint(int(uint(int(_609)) >> uint(2)));
        int _613 = int(_609) & 3;
        float _615 = (*spvDescriptorSet0.cp_c4)._m0[int(_611)][_613];
        int _617 = _603 * 112;
        int _619 = _607 * 48;
        uint _621 = uint(int(uint(_619) >> uint(2)));
        float _623 = as_type<float>(_37[int(_621)]);
        int _625 = _619 + 4;
        uint _627 = uint(int(uint(_625) >> uint(2)));
        float _629 = as_type<float>(_37[int(_627)]);
        int _631 = _619 + 8;
        uint _633 = uint(int(uint(_631) >> uint(2)));
        float _635 = as_type<float>(_37[int(_633)]);
        int _637 = _619 + 12;
        uint _639 = uint(int(uint(_637) >> uint(2)));
        float _641 = as_type<float>(_37[int(_639)]);
        int _643 = _617 + 80;
        uint _645 = uint(int(uint(_643) >> uint(2)));
        uint _647 = uint(int(uint(int(_645)) >> uint(2)));
        int _649 = int(_645) & 3;
        float _651 = (*spvDescriptorSet0.cp_c6)._m0[int(_647)][_649];
        int _653 = int(_645) + 1;
        uint _655 = uint(int(uint(_653) >> uint(2)));
        int _657 = _653 & 3;
        float _659 = (*spvDescriptorSet0.cp_c6)._m0[int(_655)][_657];
        int _661 = _619 + 16;
        uint _663 = uint(int(uint(_661) >> uint(2)));
        float _665 = as_type<float>(_37[int(_663)]);
        int _667 = _619 + 20;
        uint _669 = uint(int(uint(_667) >> uint(2)));
        float _671 = as_type<float>(_37[int(_669)]);
        int _673 = _619 + 24;
        uint _675 = uint(int(uint(_673) >> uint(2)));
        float _677 = as_type<float>(_37[int(_675)]);
        int _679 = _619 + 28;
        uint _681 = uint(int(uint(_679) >> uint(2)));
        float _683 = as_type<float>(_37[int(_681)]);
        int _685 = _619 + 32;
        uint _687 = uint(int(uint(_685) >> uint(2)));
        float _689 = as_type<float>(_37[int(_687)]);
        int _691 = _619 + 36;
        uint _693 = uint(int(uint(_691) >> uint(2)));
        float _695 = as_type<float>(_37[int(_693)]);
        int _697 = _619 + 40;
        uint _699 = uint(int(uint(_697) >> uint(2)));
        float _701 = as_type<float>(_37[int(_699)]);
        int _703 = _619 + 44;
        uint _705 = uint(int(uint(_703) >> uint(2)));
        float _707 = as_type<float>(_37[int(_705)]);
        int _709 = _617 + 88;
        uint _711 = uint(int(uint(_709) >> uint(2)));
        uint _713 = uint(int(uint(int(_711)) >> uint(2)));
        int _715 = int(_711) & 3;
        float _717 = (*spvDescriptorSet0.cp_c6)._m0[int(_713)][_715];
        int _719 = int(_711) + 1;
        uint _721 = uint(int(uint(_719) >> uint(2)));
        int _723 = _719 & 3;
        float _725 = (*spvDescriptorSet0.cp_c6)._m0[int(_721)][_723];
        int _727 = _617 + 64;
        uint _729 = uint(int(uint(_727) >> uint(2)));
        uint _731 = uint(int(uint(int(_729)) >> uint(2)));
        int _733 = int(_729) & 3;
        float _735 = (*spvDescriptorSet0.cp_c6)._m0[int(_731)][_733];
        int _737 = int(_729) + 1;
        uint _739 = uint(int(uint(_737) >> uint(2)));
        int _741 = _737 & 3;
        float _743 = (*spvDescriptorSet0.cp_c6)._m0[int(_739)][_741];
        int _745 = _617 + 72;
        uint _747 = uint(int(uint(_745) >> uint(2)));
        uint _749 = uint(int(uint(int(_747)) >> uint(2)));
        int _751 = int(_747) & 3;
        float _753 = (*spvDescriptorSet0.cp_c6)._m0[int(_749)][_751];
        int _755 = int(_747) + 1;
        uint _757 = uint(int(uint(_755) >> uint(2)));
        int _759 = _755 & 3;
        float _761 = (*spvDescriptorSet0.cp_c6)._m0[int(_757)][_759];
        int _763 = _617 + 96;
        uint _765 = uint(int(uint(_763) >> uint(2)));
        uint _767 = uint(int(uint(int(_765)) >> uint(2)));
        int _769 = int(_765) & 3;
        float _771 = (*spvDescriptorSet0.cp_c6)._m0[int(_767)][_769];
        int _773 = int(_765) + 1;
        uint _775 = uint(int(uint(_773) >> uint(2)));
        int _777 = _773 & 3;
        float _779 = (*spvDescriptorSet0.cp_c6)._m0[int(_775)][_777];
        float _781 = _629 * _651;
        int _783 = _617 + 104;
        uint _785 = uint(int(uint(_783) >> uint(2)));
        uint _787 = uint(int(uint(int(_785)) >> uint(2)));
        int _789 = int(_785) & 3;
        float _791 = (*spvDescriptorSet0.cp_c6)._m0[int(_787)][_789];
        int _793 = int(_785) + 1;
        uint _795 = uint(int(uint(_793) >> uint(2)));
        int _797 = _793 & 3;
        float _799 = (*spvDescriptorSet0.cp_c6)._m0[int(_795)][_797];
        float _801 = _629 * _659;
        float _803 = _629 * _717;
        float _805 = _629 * _725;
        float _807 = fma(_623, _735, _781);
        float _809 = fma(_623, _743, _801);
        float _811 = _671 * _651;
        float _813 = _671 * _717;
        float _815 = fma(_623, _753, _803);
        float _817 = fma(_623, _761, _805);
        float _819 = _671 * _659;
        float _821 = _671 * _725;
        float _823 = fma(_665, _735, _811);
        float _825 = fma(_665, _753, _813);
        float _827 = fma(_665, _743, _819);
        float _829 = fma(_665, _761, _821);
        float _831 = _695 * _659;
        float _833 = _695 * _717;
        float _835 = _695 * _725;
        float _837 = _695 * _651;
        int _839 = _617 + 16;
        uint _841 = uint(int(uint(_839) >> uint(2)));
        uint _843 = uint(int(uint(int(_841)) >> uint(2)));
        int _845 = int(_841) & 3;
        float _847 = (*spvDescriptorSet0.cp_c6)._m0[int(_843)][_845];
        int _849 = int(_841) + 1;
        uint _851 = uint(int(uint(_849) >> uint(2)));
        int _853 = _849 & 3;
        float _855 = (*spvDescriptorSet0.cp_c6)._m0[int(_851)][_853];
        float _857 = fma(_689, _743, _831);
        float _859 = fma(_689, _753, _833);
        float _861 = fma(_689, _761, _835);
        float _863 = fma(_635, _771, _807);
        float _865 = fma(_635, _779, _809);
        float _867 = fma(_635, _791, _815);
        float _869 = fma(_635, _799, _817);
        int _871 = _617 + 24;
        uint _873 = uint(int(uint(_871) >> uint(2)));
        uint _875 = uint(int(uint(int(_873)) >> uint(2)));
        int _877 = int(_873) & 3;
        float _879 = (*spvDescriptorSet0.cp_c6)._m0[int(_875)][_877];
        int _881 = int(_873) + 1;
        uint _883 = uint(int(uint(_881) >> uint(2)));
        int _885 = _881 & 3;
        float _887 = (*spvDescriptorSet0.cp_c6)._m0[int(_883)][_885];
        float _889 = fma(_677, _771, _823);
        float _891 = fma(_677, _779, _827);
        float _893 = fma(_677, _791, _825);
        float _895 = fma(_677, _799, _829);
        float _897 = fma(_701, _799, _861);
        float _899 = fma(_701, _791, _859);
        float _901 = fma(_689, _735, _837);
        int _903 = _617 + 32;
        uint _905 = uint(int(uint(_903) >> uint(2)));
        uint _907 = uint(int(uint(int(_905)) >> uint(2)));
        int _909 = int(_905) & 3;
        float _911 = (*spvDescriptorSet0.cp_c6)._m0[int(_907)][_909];
        int _913 = int(_905) + 1;
        uint _915 = uint(int(uint(_913) >> uint(2)));
        int _917 = _913 & 3;
        float _919 = (*spvDescriptorSet0.cp_c6)._m0[int(_915)][_917];
        float _921 = _683 + _895;
        float _923 = _641 + _869;
        float _925 = _707 + _897;
        float _927 = fma(_701, _771, _901);
        float _929 = fma(_701, _779, _857);
        int _931 = as_type<int>(_615) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _933 = _931 + _603;
        int _935 = _603 + 1;
        int _937 = _617 + 48;
        uint _939 = uint(int(uint(_937) >> uint(2)));
        uint _941 = uint(int(uint(int(_939)) >> uint(2)));
        int _943 = int(_939) & 3;
        float _945 = (*spvDescriptorSet0.cp_c6)._m0[int(_941)][_943];
        int _947 = int(_939) + 1;
        uint _949 = uint(int(uint(_947) >> uint(2)));
        int _951 = _947 & 3;
        float _953 = (*spvDescriptorSet0.cp_c6)._m0[int(_949)][_951];
        float _955 = _921 * _855;
        float _957 = _891 * _855;
        float _959 = _889 * _855;
        float _961 = _893 * _855;
        float _963 = fma(_923, _847, _955);
        float _965 = fma(_865, _847, _957);
        float _967 = fma(_863, _847, _959);
        int _969 = _617 + 40;
        uint _971 = uint(int(uint(_969) >> uint(2)));
        uint _973 = uint(int(uint(int(_971)) >> uint(2)));
        int _975 = int(_971) & 3;
        float _977 = (*spvDescriptorSet0.cp_c6)._m0[int(_973)][_975];
        int _979 = int(_971) + 1;
        uint _981 = uint(int(uint(_979) >> uint(2)));
        int _983 = _979 & 3;
        float _985 = (*spvDescriptorSet0.cp_c6)._m0[int(_981)][_983];
        float _987 = fma(_925, _879, _963);
        float _989 = fma(_867, _847, _961);
        float _991 = fma(_929, _879, _965);
        float _993 = fma(_927, _879, _967);
        float _995 = _987 + _887;
        float _997 = fma(_899, _879, _989);
        int _999 = _933 * 48;
        int _1001 = _617 + 56;
        uint _1003 = uint(int(uint(_1001) >> uint(2)));
        uint _1005 = uint(int(uint(int(_1003)) >> uint(2)));
        int _1007 = int(_1003) & 3;
        float _1009 = (*spvDescriptorSet0.cp_c6)._m0[int(_1005)][_1007];
        int _1011 = int(_1003) + 1;
        uint _1013 = uint(int(uint(_1011) >> uint(2)));
        int _1015 = _1011 & 3;
        float _1017 = (*spvDescriptorSet0.cp_c6)._m0[int(_1013)][_1015];
        float _1019 = _921 * _919;
        float _1021 = _891 * _919;
        float _1023 = _889 * _919;
        float _1025 = _893 * _919;
        float _1027 = fma(_923, _911, _1019);
        float _1029 = fma(_865, _911, _1021);
        bool _1031 = uint(_935) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1033 = _921 * _953;
        float _1035 = _891 * _953;
        float _1037 = _889 * _953;
        float _1039 = _893 * _953;
        float _1041 = fma(_923, _945, _1033);
        float _1043 = fma(_865, _945, _1035);
        float _1045 = fma(_863, _911, _1023);
        float _1047 = fma(_867, _911, _1025);
        float _1049 = fma(_925, _977, _1027);
        float _1051 = fma(_863, _945, _1037);
        float _1053 = fma(_867, _945, _1039);
        float _1055 = fma(_929, _977, _1029);
        int _1057 = _999 + 16;
        float _1059 = fma(_927, _977, _1045);
        float _1061 = fma(_899, _977, _1047);
        float _1063 = _1049 + _985;
        float _1065 = fma(_925, _1009, _1041);
        float _1067 = fma(_929, _1009, _1043);
        int _1069 = _999 + 32;
        float _1071 = fma(_927, _1009, _1051);
        float _1073 = fma(_899, _1009, _1053);
        float _1075 = _1065 + _1017;
        int _1077 = _999 + 48;
        uint _1079 = uint(int(uint(_1057) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1079)] = as_type<uint>(_993);
        int _1081 = _1057 + 4;
        uint _1083 = uint(int(uint(_1081) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1083)] = as_type<uint>(_991);
        int _1085 = _1057 + 8;
        uint _1087 = uint(int(uint(_1085) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1087)] = as_type<uint>(_997);
        int _1089 = _1057 + 12;
        uint _1091 = uint(int(uint(_1089) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1091)] = as_type<uint>(_995);
        uint _1093 = uint(int(uint(_1069) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1093)] = as_type<uint>(_1059);
        int _1095 = _1069 + 4;
        uint _1097 = uint(int(uint(_1095) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1097)] = as_type<uint>(_1055);
        int _1099 = _1069 + 8;
        uint _1101 = uint(int(uint(_1099) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1101)] = as_type<uint>(_1061);
        int _1103 = _1069 + 12;
        uint _1105 = uint(int(uint(_1103) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1105)] = as_type<uint>(_1063);
        uint _1107 = uint(int(uint(_1077) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1107)] = as_type<uint>(_1071);
        int _1109 = _1077 + 4;
        uint _1111 = uint(int(uint(_1109) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1111)] = as_type<uint>(_1067);
        int _1113 = _1077 + 8;
        uint _1115 = uint(int(uint(_1113) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1115)] = as_type<uint>(_1073);
        int _1117 = _1077 + 12;
        uint _1119 = uint(int(uint(_1117) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1119)] = as_type<uint>(_1075);
        _601 = !_1031;
        _599 = _935;
    } while (_601);
}

