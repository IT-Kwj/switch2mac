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
int _54(thread const int& _3325, thread const int& _3326, constant _10& support_buffer)
{
    int _3329 = 1 + _3326;
    float _3331 = support_buffer._m5[_3329].x;
    bool _3333 = _3331 == 1.0;
    if (_3333)
    {
        return _3325;
    }
    float _3335 = float(_3325);
    float _3337 = _3335 * _3331;
    int _3339 = int(_3337);
    return _3339;
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
    bool _74 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _76 = _72 << 4;
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
            int _105 = int(_97) + 1;
            uint _107 = uint(int(uint(_105) >> uint(2)));
            int _109 = _105 & 3;
            float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
            int _113 = _95;
            int _115 = 0;
            int _117 = _54(_113, _115, (*spvDescriptorSet0.support_buffer));
            int _119 = as_type<int>(_103);
            int _121 = 0;
            int _123 = _54(_119, _121, (*spvDescriptorSet0.support_buffer));
            int3 _1362 = int3(_117, _123, 1);
            float3 _127 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1362.xy), uint(_1362.z), 0).xyz;
            float _129 = _127.x;
            float _131 = _127.y;
            float _133 = _127.z;
            int _135 = _95;
            int _137 = 0;
            int _139 = _54(_135, _137, (*spvDescriptorSet0.support_buffer));
            int _141 = as_type<int>(_111);
            int _143 = 0;
            int _145 = _54(_141, _143, (*spvDescriptorSet0.support_buffer));
            int3 _1380 = int3(_139, _145, 1);
            float3 _147 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1380.xy), uint(_1380.z), 0).xyz;
            float _149 = _147.x;
            float _151 = _147.y;
            float _153 = _147.z;
            int _155 = _95;
            int _157 = 0;
            int _159 = _54(_155, _157, (*spvDescriptorSet0.support_buffer));
            int _161 = as_type<int>(_103);
            int _163 = 0;
            int _165 = _54(_161, _163, (*spvDescriptorSet0.support_buffer));
            int3 _1398 = int3(_159, _165, 0);
            float3 _167 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1398.xy), uint(_1398.z), 0).xyz;
            float _169 = _167.x;
            float _171 = _167.y;
            float _173 = _167.z;
            int _175 = _95;
            int _177 = 0;
            int _179 = _54(_175, _177, (*spvDescriptorSet0.support_buffer));
            int _181 = as_type<int>(_111);
            int _183 = 0;
            int _185 = _54(_181, _183, (*spvDescriptorSet0.support_buffer));
            int3 _1416 = int3(_179, _185, 0);
            float3 _187 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1416.xy), uint(_1416.z), 0).xyz;
            float _189 = _187.x;
            float _191 = _187.y;
            float _193 = _187.z;
            int _195 = _95;
            int _197 = 0;
            int _199 = _54(_195, _197, (*spvDescriptorSet0.support_buffer));
            int _201 = as_type<int>(_103);
            int _203 = 0;
            int _205 = _54(_201, _203, (*spvDescriptorSet0.support_buffer));
            int3 _1434 = int3(_199, _205, 2);
            float3 _207 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1434.xy), uint(_1434.z), 0).xyz;
            float _209 = _207.x;
            float _211 = _207.y;
            float _213 = _207.z;
            int _215 = _95;
            int _217 = 0;
            int _219 = _54(_215, _217, (*spvDescriptorSet0.support_buffer));
            int _221 = as_type<int>(_111);
            int _223 = 0;
            int _225 = _54(_221, _223, (*spvDescriptorSet0.support_buffer));
            int3 _1452 = int3(_219, _225, 2);
            float3 _227 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1452.xy), uint(_1452.z), 0).xyz;
            float _229 = _227.x;
            float _231 = _227.y;
            float _233 = _227.z;
            int _235 = _89 + 16;
            uint _237 = uint(int(uint(_235) >> uint(2)));
            uint _239 = uint(int(uint(int(_237)) >> uint(2)));
            int _241 = int(_237) & 3;
            float _243 = (*spvDescriptorSet0.cp_c5)._m0[int(_239)][_241];
            float _245 = -_133;
            float _247 = _245 + _153;
            float _249 = -_129;
            float _251 = _249 + _149;
            float _253 = fma(_247, _243, _133);
            float _255 = -_131;
            float _257 = _255 + _151;
            float _259 = fma(_251, _243, _129);
            float _261 = _253 * 0.15915493667125701904296875;
            float _263 = fma(_257, _243, _131);
            float _265 = _259 * 0.15915493667125701904296875;
            float _267 = _261 * 6.283185482025146484375;
            float _269 = sin(_267);
            float _271 = _263 * 0.15915493667125701904296875;
            float _273 = -_169;
            float _275 = _273 + _189;
            float _277 = -_173;
            float _279 = _277 + _193;
            float _281 = -_171;
            float _283 = _281 + _191;
            float _285 = fma(_275, _243, _169);
            float _287 = fma(_279, _243, _173);
            float _289 = _265 * 6.283185482025146484375;
            float _291 = sin(_289);
            float _293 = fma(_283, _243, _171);
            float _295 = _265 * 6.283185482025146484375;
            float _297 = cos(_295);
            float _299 = _261 * 6.283185482025146484375;
            float _301 = cos(_299);
            float _303 = -_213;
            float _305 = _303 + _233;
            float _307 = fma(_305, _243, _213);
            float _309 = _271 * 6.283185482025146484375;
            float _311 = sin(_309);
            float _313 = _269 * _297;
            float _315 = _271 * 6.283185482025146484375;
            float _317 = cos(_315);
            float _319 = _297 * _301;
            float _321 = _291 * _301;
            float _323 = _291 * _311;
            float _325 = -_285;
            float _327 = fma(_325, _311, -0.0);
            float _329 = -_313;
            float _331 = fma(_301, _323, _329);
            float _333 = -_321;
            float _335 = fma(_311, _313, _333);
            float _337 = _297 * _317;
            float _339 = _291 * _317;
            float _341 = _317 * _285;
            float _343 = fma(_269, _323, _319);
            float _345 = _291 * _269;
            float _347 = _293 * _339;
            float _349 = _301 * _341;
            float _351 = _293 * _331;
            float _353 = _293 * _343;
            float _355 = fma(_311, _319, _345);
            int _357 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _359 = _357 + _95;
            float _361 = -_209;
            float _363 = _361 + _229;
            float _365 = -_211;
            float _367 = _365 + _231;
            float _369 = _269 * _341;
            float _371 = _287 * _337;
            float _373 = _287 * _355;
            float _375 = _287 * _335;
            int _377 = _359 * 48;
            float _379 = fma(_363, _243, _209);
            float _381 = fma(_367, _243, _211);
            int _383 = _95 + 1;
            int _385 = _377 + 32;
            uint _387 = uint(int(uint(_385) >> uint(2)));
            _37[int(_387)] = as_type<uint>(_327);
            int _389 = _377 + 36;
            uint _391 = uint(int(uint(_389) >> uint(2)));
            _37[int(_391)] = as_type<uint>(_347);
            int _393 = _377 + 40;
            uint _395 = uint(int(uint(_393) >> uint(2)));
            _37[int(_395)] = as_type<uint>(_371);
            int _397 = _377 + 44;
            uint _399 = uint(int(uint(_397) >> uint(2)));
            _37[int(_399)] = as_type<uint>(_307);
            bool _401 = uint(_383) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            uint _403 = uint(int(uint(_377) >> uint(2)));
            _37[int(_403)] = as_type<uint>(_349);
            int _405 = _377 + 4;
            uint _407 = uint(int(uint(_405) >> uint(2)));
            _37[int(_407)] = as_type<uint>(_351);
            int _409 = _377 + 8;
            uint _411 = uint(int(uint(_409) >> uint(2)));
            _37[int(_411)] = as_type<uint>(_373);
            int _413 = _377 + 12;
            uint _415 = uint(int(uint(_413) >> uint(2)));
            _37[int(_415)] = as_type<uint>(_379);
            int _417 = _377 + 16;
            uint _419 = uint(int(uint(_417) >> uint(2)));
            _37[int(_419)] = as_type<uint>(_369);
            int _421 = _377 + 20;
            uint _423 = uint(int(uint(_421) >> uint(2)));
            _37[int(_423)] = as_type<uint>(_353);
            int _425 = _377 + 24;
            uint _427 = uint(int(uint(_425) >> uint(2)));
            _37[int(_427)] = as_type<uint>(_375);
            int _429 = _377 + 28;
            uint _431 = uint(int(uint(_429) >> uint(2)));
            _37[int(_431)] = as_type<uint>(_381);
            _93 = !_401;
            _91 = _383;
        } while (_93);
    }
    bool _433 = !_74;
    if (!_433)
    {
        int _435 = 1;
        bool _437;
        do
        {
            int _439 = _435;
            int _441 = _439 * 112;
            int _443 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _445 = _443 + _439;
            int _447 = _439 + 1;
            uint _449 = uint(int(uint(_441) >> uint(2)));
            uint _451 = uint(int(uint(int(_449)) >> uint(2)));
            int _453 = int(_449) & 3;
            float _455 = (*spvDescriptorSet0.cp_c6)._m0[int(_451)][_453];
            int _457 = _445 * 48;
            bool _459 = uint(_447) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _461 = _457 + 16;
            uint _463 = uint(int(uint(_461) >> uint(2)));
            float _465 = as_type<float>(_37[int(_463)]);
            int _467 = _457 + 20;
            uint _469 = uint(int(uint(_467) >> uint(2)));
            float _471 = as_type<float>(_37[int(_469)]);
            int _473 = _457 + 24;
            uint _475 = uint(int(uint(_473) >> uint(2)));
            float _477 = as_type<float>(_37[int(_475)]);
            int _479 = _457 + 28;
            uint _481 = uint(int(uint(_479) >> uint(2)));
            float _483 = as_type<float>(_37[int(_481)]);
            int _485 = _457 + 32;
            uint _487 = uint(int(uint(_485) >> uint(2)));
            float _489 = as_type<float>(_37[int(_487)]);
            int _491 = _457 + 36;
            uint _493 = uint(int(uint(_491) >> uint(2)));
            float _495 = as_type<float>(_37[int(_493)]);
            int _497 = _457 + 40;
            uint _499 = uint(int(uint(_497) >> uint(2)));
            float _501 = as_type<float>(_37[int(_499)]);
            int _503 = _457 + 44;
            uint _505 = uint(int(uint(_503) >> uint(2)));
            float _507 = as_type<float>(_37[int(_505)]);
            int _509 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _511 = _509 + as_type<int>(_455);
            int _513 = _511 * 48;
            uint _515 = uint(int(uint(_457) >> uint(2)));
            float _517 = as_type<float>(_37[int(_515)]);
            int _519 = _457 + 4;
            uint _521 = uint(int(uint(_519) >> uint(2)));
            float _523 = as_type<float>(_37[int(_521)]);
            int _525 = _457 + 8;
            uint _527 = uint(int(uint(_525) >> uint(2)));
            float _529 = as_type<float>(_37[int(_527)]);
            int _531 = _457 + 12;
            uint _533 = uint(int(uint(_531) >> uint(2)));
            float _535 = as_type<float>(_37[int(_533)]);
            uint _537 = uint(int(uint(_513) >> uint(2)));
            float _539 = as_type<float>(_37[int(_537)]);
            int _541 = _513 + 4;
            uint _543 = uint(int(uint(_541) >> uint(2)));
            float _545 = as_type<float>(_37[int(_543)]);
            int _547 = _513 + 8;
            uint _549 = uint(int(uint(_547) >> uint(2)));
            float _551 = as_type<float>(_37[int(_549)]);
            int _553 = _513 + 12;
            uint _555 = uint(int(uint(_553) >> uint(2)));
            float _557 = as_type<float>(_37[int(_555)]);
            int _559 = _513 + 16;
            uint _561 = uint(int(uint(_559) >> uint(2)));
            float _563 = as_type<float>(_37[int(_561)]);
            int _565 = _513 + 20;
            uint _567 = uint(int(uint(_565) >> uint(2)));
            float _569 = as_type<float>(_37[int(_567)]);
            int _571 = _513 + 24;
            uint _573 = uint(int(uint(_571) >> uint(2)));
            float _575 = as_type<float>(_37[int(_573)]);
            int _577 = _513 + 28;
            uint _579 = uint(int(uint(_577) >> uint(2)));
            float _581 = as_type<float>(_37[int(_579)]);
            int _583 = _513 + 32;
            uint _585 = uint(int(uint(_583) >> uint(2)));
            float _587 = as_type<float>(_37[int(_585)]);
            int _589 = _513 + 36;
            uint _591 = uint(int(uint(_589) >> uint(2)));
            float _593 = as_type<float>(_37[int(_591)]);
            int _595 = _513 + 40;
            uint _597 = uint(int(uint(_595) >> uint(2)));
            float _599 = as_type<float>(_37[int(_597)]);
            int _601 = _513 + 44;
            uint _603 = uint(int(uint(_601) >> uint(2)));
            float _605 = as_type<float>(_37[int(_603)]);
            float _607 = _483 * _545;
            float _609 = _471 * _545;
            float _611 = _465 * _545;
            float _613 = _477 * _545;
            float _615 = fma(_535, _539, _607);
            float _617 = fma(_523, _539, _609);
            float _619 = fma(_517, _539, _611);
            float _621 = fma(_529, _539, _613);
            float _623 = fma(_507, _551, _615);
            float _625 = fma(_495, _551, _617);
            float _627 = _471 * _569;
            float _629 = _465 * _569;
            float _631 = _557 + _623;
            float _633 = _483 * _569;
            float _635 = _477 * _569;
            float _637 = fma(_523, _563, _627);
            float _639 = fma(_489, _551, _619);
            float _641 = fma(_535, _563, _633);
            float _643 = fma(_529, _563, _635);
            float _645 = fma(_495, _575, _637);
            float _647 = _483 * _593;
            float _649 = _465 * _593;
            float _651 = _471 * _593;
            float _653 = _477 * _593;
            float _655 = fma(_535, _587, _647);
            float _657 = fma(_517, _563, _629);
            float _659 = fma(_507, _575, _641);
            float _661 = fma(_517, _587, _649);
            float _663 = fma(_523, _587, _651);
            float _665 = fma(_529, _587, _653);
            float _667 = fma(_507, _599, _655);
            float _669 = fma(_489, _575, _657);
            float _671 = fma(_501, _551, _621);
            float _673 = fma(_501, _575, _643);
            float _675 = _581 + _659;
            float _677 = fma(_489, _599, _661);
            float _679 = fma(_495, _599, _663);
            float _681 = fma(_501, _599, _665);
            float _683 = _605 + _667;
            uint _685 = uint(int(uint(_457) >> uint(2)));
            _37[int(_685)] = as_type<uint>(_639);
            int _687 = _457 + 4;
            uint _689 = uint(int(uint(_687) >> uint(2)));
            _37[int(_689)] = as_type<uint>(_625);
            int _691 = _457 + 8;
            uint _693 = uint(int(uint(_691) >> uint(2)));
            _37[int(_693)] = as_type<uint>(_671);
            int _695 = _457 + 12;
            uint _697 = uint(int(uint(_695) >> uint(2)));
            _37[int(_697)] = as_type<uint>(_631);
            int _699 = _457 + 16;
            uint _701 = uint(int(uint(_699) >> uint(2)));
            _37[int(_701)] = as_type<uint>(_669);
            int _703 = _457 + 20;
            uint _705 = uint(int(uint(_703) >> uint(2)));
            _37[int(_705)] = as_type<uint>(_645);
            int _707 = _457 + 24;
            uint _709 = uint(int(uint(_707) >> uint(2)));
            _37[int(_709)] = as_type<uint>(_673);
            int _711 = _457 + 28;
            uint _713 = uint(int(uint(_711) >> uint(2)));
            _37[int(_713)] = as_type<uint>(_675);
            int _715 = _457 + 32;
            uint _717 = uint(int(uint(_715) >> uint(2)));
            _37[int(_717)] = as_type<uint>(_677);
            int _719 = _457 + 36;
            uint _721 = uint(int(uint(_719) >> uint(2)));
            _37[int(_721)] = as_type<uint>(_679);
            int _723 = _457 + 40;
            uint _725 = uint(int(uint(_723) >> uint(2)));
            _37[int(_725)] = as_type<uint>(_681);
            int _727 = _457 + 44;
            uint _729 = uint(int(uint(_727) >> uint(2)));
            _37[int(_729)] = as_type<uint>(_683);
            _437 = !_459;
            _435 = _447;
        } while (_437);
    }
    if (!_70)
    {
        return;
    }
    int _731 = 0;
    bool _733;
    do
    {
        int _735 = _731;
        int _737 = _64 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _739 = _737 + _735;
        int _741 = _735 * 112;
        int _743 = _739 * 48;
        int _745 = _741 + 80;
        uint _747 = uint(int(uint(_745) >> uint(2)));
        uint _749 = uint(int(uint(int(_747)) >> uint(2)));
        int _751 = int(_747) & 3;
        float _753 = (*spvDescriptorSet0.cp_c6)._m0[int(_749)][_751];
        int _755 = int(_747) + 1;
        uint _757 = uint(int(uint(_755) >> uint(2)));
        int _759 = _755 & 3;
        float _761 = (*spvDescriptorSet0.cp_c6)._m0[int(_757)][_759];
        uint _763 = uint(int(uint(_743) >> uint(2)));
        float _765 = as_type<float>(_37[int(_763)]);
        int _767 = _743 + 4;
        uint _769 = uint(int(uint(_767) >> uint(2)));
        float _771 = as_type<float>(_37[int(_769)]);
        int _773 = _743 + 8;
        uint _775 = uint(int(uint(_773) >> uint(2)));
        float _777 = as_type<float>(_37[int(_775)]);
        int _779 = _743 + 12;
        uint _781 = uint(int(uint(_779) >> uint(2)));
        float _783 = as_type<float>(_37[int(_781)]);
        int _785 = _743 + 16;
        uint _787 = uint(int(uint(_785) >> uint(2)));
        float _789 = as_type<float>(_37[int(_787)]);
        int _791 = _743 + 20;
        uint _793 = uint(int(uint(_791) >> uint(2)));
        float _795 = as_type<float>(_37[int(_793)]);
        int _797 = _743 + 24;
        uint _799 = uint(int(uint(_797) >> uint(2)));
        float _801 = as_type<float>(_37[int(_799)]);
        int _803 = _743 + 28;
        uint _805 = uint(int(uint(_803) >> uint(2)));
        float _807 = as_type<float>(_37[int(_805)]);
        int _809 = _741 + 88;
        uint _811 = uint(int(uint(_809) >> uint(2)));
        uint _813 = uint(int(uint(int(_811)) >> uint(2)));
        int _815 = int(_811) & 3;
        float _817 = (*spvDescriptorSet0.cp_c6)._m0[int(_813)][_815];
        int _819 = int(_811) + 1;
        uint _821 = uint(int(uint(_819) >> uint(2)));
        int _823 = _819 & 3;
        float _825 = (*spvDescriptorSet0.cp_c6)._m0[int(_821)][_823];
        int _827 = _743 + 32;
        uint _829 = uint(int(uint(_827) >> uint(2)));
        float _831 = as_type<float>(_37[int(_829)]);
        int _833 = _743 + 36;
        uint _835 = uint(int(uint(_833) >> uint(2)));
        float _837 = as_type<float>(_37[int(_835)]);
        int _839 = _743 + 40;
        uint _841 = uint(int(uint(_839) >> uint(2)));
        float _843 = as_type<float>(_37[int(_841)]);
        int _845 = _743 + 44;
        uint _847 = uint(int(uint(_845) >> uint(2)));
        float _849 = as_type<float>(_37[int(_847)]);
        int _851 = _741 + 64;
        uint _853 = uint(int(uint(_851) >> uint(2)));
        uint _855 = uint(int(uint(int(_853)) >> uint(2)));
        int _857 = int(_853) & 3;
        float _859 = (*spvDescriptorSet0.cp_c6)._m0[int(_855)][_857];
        int _861 = int(_853) + 1;
        uint _863 = uint(int(uint(_861) >> uint(2)));
        int _865 = _861 & 3;
        float _867 = (*spvDescriptorSet0.cp_c6)._m0[int(_863)][_865];
        int _869 = _741 + 72;
        uint _871 = uint(int(uint(_869) >> uint(2)));
        uint _873 = uint(int(uint(int(_871)) >> uint(2)));
        int _875 = int(_871) & 3;
        float _877 = (*spvDescriptorSet0.cp_c6)._m0[int(_873)][_875];
        int _879 = int(_871) + 1;
        uint _881 = uint(int(uint(_879) >> uint(2)));
        int _883 = _879 & 3;
        float _885 = (*spvDescriptorSet0.cp_c6)._m0[int(_881)][_883];
        int _887 = _741 + 104;
        uint _889 = uint(int(uint(_887) >> uint(2)));
        uint _891 = uint(int(uint(int(_889)) >> uint(2)));
        int _893 = int(_889) & 3;
        float _895 = (*spvDescriptorSet0.cp_c6)._m0[int(_891)][_893];
        int _897 = int(_889) + 1;
        uint _899 = uint(int(uint(_897) >> uint(2)));
        int _901 = _897 & 3;
        float _903 = (*spvDescriptorSet0.cp_c6)._m0[int(_899)][_901];
        int _905 = _741 + 96;
        uint _907 = uint(int(uint(_905) >> uint(2)));
        uint _909 = uint(int(uint(int(_907)) >> uint(2)));
        int _911 = int(_907) & 3;
        float _913 = (*spvDescriptorSet0.cp_c6)._m0[int(_909)][_911];
        int _915 = int(_907) + 1;
        uint _917 = uint(int(uint(_915) >> uint(2)));
        int _919 = _915 & 3;
        float _921 = (*spvDescriptorSet0.cp_c6)._m0[int(_917)][_919];
        float _923 = _771 * _753;
        float _925 = _771 * _761;
        float _927 = _771 * _817;
        float _929 = _771 * _825;
        float _931 = fma(_765, _859, _923);
        float _933 = fma(_765, _867, _925);
        float _935 = fma(_765, _877, _927);
        float _937 = fma(_765, _885, _929);
        float _939 = _795 * _753;
        float _941 = _795 * _761;
        float _943 = _795 * _817;
        float _945 = _795 * _825;
        float _947 = _837 * _753;
        float _949 = fma(_789, _859, _939);
        float _951 = fma(_789, _867, _941);
        float _953 = fma(_789, _877, _943);
        uint _955 = uint(int(uint(_76) >> uint(2)));
        uint _957 = uint(int(uint(int(_955)) >> uint(2)));
        int _959 = int(_955) & 3;
        float _961 = (*spvDescriptorSet0.cp_c4)._m0[int(_957)][_959];
        float _963 = fma(_789, _885, _945);
        float _965 = _837 * _761;
        float _967 = _837 * _817;
        float _969 = _837 * _825;
        float _971 = fma(_831, _859, _947);
        float _973 = fma(_831, _867, _965);
        float _975 = fma(_831, _877, _967);
        int _977 = _741 + 16;
        uint _979 = uint(int(uint(_977) >> uint(2)));
        uint _981 = uint(int(uint(int(_979)) >> uint(2)));
        int _983 = int(_979) & 3;
        float _985 = (*spvDescriptorSet0.cp_c6)._m0[int(_981)][_983];
        int _987 = int(_979) + 1;
        uint _989 = uint(int(uint(_987) >> uint(2)));
        int _991 = _987 & 3;
        float _993 = (*spvDescriptorSet0.cp_c6)._m0[int(_989)][_991];
        float _995 = fma(_831, _885, _969);
        float _997 = fma(_801, _903, _963);
        float _999 = fma(_777, _913, _931);
        float _1001 = fma(_777, _921, _933);
        float _1003 = fma(_777, _895, _935);
        float _1005 = fma(_777, _903, _937);
        float _1007 = fma(_801, _913, _949);
        int _1009 = _741 + 24;
        uint _1011 = uint(int(uint(_1009) >> uint(2)));
        uint _1013 = uint(int(uint(int(_1011)) >> uint(2)));
        int _1015 = int(_1011) & 3;
        float _1017 = (*spvDescriptorSet0.cp_c6)._m0[int(_1013)][_1015];
        int _1019 = int(_1011) + 1;
        uint _1021 = uint(int(uint(_1019) >> uint(2)));
        int _1023 = _1019 & 3;
        float _1025 = (*spvDescriptorSet0.cp_c6)._m0[int(_1021)][_1023];
        float _1027 = fma(_801, _921, _951);
        float _1029 = fma(_801, _895, _953);
        float _1031 = fma(_843, _913, _971);
        float _1033 = fma(_843, _921, _973);
        float _1035 = fma(_843, _903, _995);
        float _1037 = fma(_843, _895, _975);
        float _1039 = _807 + _997;
        int _1041 = _741 + 32;
        uint _1043 = uint(int(uint(_1041) >> uint(2)));
        uint _1045 = uint(int(uint(int(_1043)) >> uint(2)));
        int _1047 = int(_1043) & 3;
        float _1049 = (*spvDescriptorSet0.cp_c6)._m0[int(_1045)][_1047];
        int _1051 = int(_1043) + 1;
        uint _1053 = uint(int(uint(_1051) >> uint(2)));
        int _1055 = _1051 & 3;
        float _1057 = (*spvDescriptorSet0.cp_c6)._m0[int(_1053)][_1055];
        float _1059 = _849 + _1035;
        float _1061 = _783 + _1005;
        int _1063 = _741 + 48;
        uint _1065 = uint(int(uint(_1063) >> uint(2)));
        uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
        int _1069 = int(_1065) & 3;
        float _1071 = (*spvDescriptorSet0.cp_c6)._m0[int(_1067)][_1069];
        int _1073 = int(_1065) + 1;
        uint _1075 = uint(int(uint(_1073) >> uint(2)));
        int _1077 = _1073 & 3;
        float _1079 = (*spvDescriptorSet0.cp_c6)._m0[int(_1075)][_1077];
        float _1081 = _1007 * _993;
        float _1083 = _1027 * _993;
        float _1085 = _1039 * _993;
        float _1087 = _1029 * _993;
        float _1089 = fma(_999, _985, _1081);
        float _1091 = fma(_1001, _985, _1083);
        float _1093 = fma(_1061, _985, _1085);
        float _1095 = fma(_1003, _985, _1087);
        int _1097 = _741 + 40;
        uint _1099 = uint(int(uint(_1097) >> uint(2)));
        uint _1101 = uint(int(uint(int(_1099)) >> uint(2)));
        int _1103 = int(_1099) & 3;
        float _1105 = (*spvDescriptorSet0.cp_c6)._m0[int(_1101)][_1103];
        int _1107 = int(_1099) + 1;
        uint _1109 = uint(int(uint(_1107) >> uint(2)));
        int _1111 = _1107 & 3;
        float _1113 = (*spvDescriptorSet0.cp_c6)._m0[int(_1109)][_1111];
        float _1115 = fma(_1031, _1017, _1089);
        float _1117 = fma(_1059, _1017, _1093);
        float _1119 = fma(_1033, _1017, _1091);
        float _1121 = fma(_1037, _1017, _1095);
        float _1123 = _1117 + _1025;
        float _1125 = _1039 * _1057;
        int _1127 = _741 + 56;
        uint _1129 = uint(int(uint(_1127) >> uint(2)));
        uint _1131 = uint(int(uint(int(_1129)) >> uint(2)));
        int _1133 = int(_1129) & 3;
        float _1135 = (*spvDescriptorSet0.cp_c6)._m0[int(_1131)][_1133];
        int _1137 = int(_1129) + 1;
        uint _1139 = uint(int(uint(_1137) >> uint(2)));
        int _1141 = _1137 & 3;
        float _1143 = (*spvDescriptorSet0.cp_c6)._m0[int(_1139)][_1141];
        float _1145 = _1007 * _1057;
        float _1147 = _1027 * _1057;
        int _1149 = as_type<int>(_961) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1151 = _1149 + _735;
        int _1153 = _735 + 1;
        float _1155 = _1029 * _1057;
        float _1157 = fma(_1061, _1049, _1125);
        float _1159 = _1039 * _1079;
        float _1161 = _1007 * _1079;
        float _1163 = _1027 * _1079;
        float _1165 = fma(_1001, _1049, _1147);
        float _1167 = _1029 * _1079;
        float _1169 = fma(_1061, _1071, _1159);
        float _1171 = fma(_999, _1071, _1161);
        int _1173 = _1151 * 48;
        bool _1175 = uint(_1153) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1177 = fma(_1001, _1071, _1163);
        float _1179 = fma(_999, _1049, _1145);
        float _1181 = fma(_1003, _1049, _1155);
        float _1183 = fma(_1059, _1105, _1157);
        float _1185 = fma(_1003, _1071, _1167);
        float _1187 = fma(_1033, _1105, _1165);
        float _1189 = fma(_1031, _1105, _1179);
        float _1191 = fma(_1037, _1105, _1181);
        float _1193 = fma(_1059, _1135, _1169);
        float _1195 = fma(_1031, _1135, _1171);
        float _1197 = fma(_1033, _1135, _1177);
        int _1199 = _1173 + 16;
        float _1201 = _1183 + _1113;
        int _1203 = _1173 + 32;
        float _1205 = fma(_1037, _1135, _1185);
        float _1207 = _1193 + _1143;
        int _1209 = _1173 + 48;
        uint _1211 = uint(int(uint(_1199) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1211)] = as_type<uint>(_1115);
        int _1213 = _1199 + 4;
        uint _1215 = uint(int(uint(_1213) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1215)] = as_type<uint>(_1119);
        int _1217 = _1199 + 8;
        uint _1219 = uint(int(uint(_1217) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1219)] = as_type<uint>(_1121);
        int _1221 = _1199 + 12;
        uint _1223 = uint(int(uint(_1221) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1223)] = as_type<uint>(_1123);
        uint _1225 = uint(int(uint(_1203) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1225)] = as_type<uint>(_1189);
        int _1227 = _1203 + 4;
        uint _1229 = uint(int(uint(_1227) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1229)] = as_type<uint>(_1187);
        int _1231 = _1203 + 8;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1233)] = as_type<uint>(_1191);
        int _1235 = _1203 + 12;
        uint _1237 = uint(int(uint(_1235) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1237)] = as_type<uint>(_1201);
        uint _1239 = uint(int(uint(_1209) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1239)] = as_type<uint>(_1195);
        int _1241 = _1209 + 4;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1243)] = as_type<uint>(_1197);
        int _1245 = _1209 + 8;
        uint _1247 = uint(int(uint(_1245) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1247)] = as_type<uint>(_1205);
        int _1249 = _1209 + 12;
        uint _1251 = uint(int(uint(_1249) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1251)] = as_type<uint>(_1207);
        _733 = !_1175;
        _731 = _1153;
    } while (_733);
}

