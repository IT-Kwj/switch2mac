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
int _56(thread const int& _3173, thread const int& _3174, constant _10& support_buffer)
{
    int _3177 = 1 + _3174;
    float _3179 = support_buffer._m5[_3177].x;
    bool _3181 = _3179 == 1.0;
    if (_3181)
    {
        return _3173;
    }
    float _3183 = float(_3173);
    float _3185 = _3183 * _3179;
    int _3187 = int(_3185);
    return _3187;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _753 = false;
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
    int _91 = _66;
    int _93 = 0;
    int _95 = _56(_91, _93, (*spvDescriptorSet0.support_buffer));
    int _97 = as_type<int>(_81);
    int _99 = 0;
    int _101 = _56(_97, _99, (*spvDescriptorSet0.support_buffer));
    int3 _1276 = int3(_95, _101, 1);
    float3 _105 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1276.xy), uint(_1276.z), 0).xyz;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    int _113 = _66;
    int _115 = 0;
    int _117 = _56(_113, _115, (*spvDescriptorSet0.support_buffer));
    int _119 = as_type<int>(_89);
    int _121 = 0;
    int _123 = _56(_119, _121, (*spvDescriptorSet0.support_buffer));
    int3 _1294 = int3(_117, _123, 1);
    float3 _125 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1294.xy), uint(_1294.z), 0).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    int _133 = _66;
    int _135 = 0;
    int _137 = _56(_133, _135, (*spvDescriptorSet0.support_buffer));
    int _139 = as_type<int>(_81);
    int _141 = 0;
    int _143 = _56(_139, _141, (*spvDescriptorSet0.support_buffer));
    int3 _1312 = int3(_137, _143, 0);
    float3 _145 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1312.xy), uint(_1312.z), 0).xyz;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    int _153 = _66;
    int _155 = 0;
    int _157 = _56(_153, _155, (*spvDescriptorSet0.support_buffer));
    int _159 = as_type<int>(_89);
    int _161 = 0;
    int _163 = _56(_159, _161, (*spvDescriptorSet0.support_buffer));
    int3 _1330 = int3(_157, _163, 0);
    float3 _165 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1330.xy), uint(_1330.z), 0).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    int _173 = _66;
    int _175 = 0;
    int _177 = _56(_173, _175, (*spvDescriptorSet0.support_buffer));
    int _179 = as_type<int>(_81);
    int _181 = 0;
    int _183 = _56(_179, _181, (*spvDescriptorSet0.support_buffer));
    int3 _1348 = int3(_177, _183, 2);
    float3 _185 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1348.xy), uint(_1348.z), 0).xyz;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    int _193 = _66;
    int _195 = 0;
    int _197 = _56(_193, _195, (*spvDescriptorSet0.support_buffer));
    int _199 = as_type<int>(_89);
    int _201 = 0;
    int _203 = _56(_199, _201, (*spvDescriptorSet0.support_buffer));
    int3 _1366 = int3(_197, _203, 2);
    float3 _205 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1366.xy), uint(_1366.z), 0).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    int _213 = _72 + 16;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    uint _217 = uint(int(uint(int(_215)) >> uint(2)));
    int _219 = int(_215) & 3;
    float _221 = (*spvDescriptorSet0.cp_c5)._m0[int(_217)][_219];
    bool _223 = _66 != 0;
    float _225 = -_107;
    float _227 = _225 + _127;
    float _229 = -_111;
    float _231 = _229 + _131;
    float _233 = fma(_227, _221, _107);
    float _235 = -_109;
    float _237 = _235 + _129;
    float _239 = fma(_231, _221, _111);
    float _241 = _233 * 0.15915493667125701904296875;
    float _243 = fma(_237, _221, _109);
    float _245 = _239 * 0.15915493667125701904296875;
    float _247 = _241 * 6.283185482025146484375;
    float _249 = sin(_247);
    float _251 = _243 * 0.15915493667125701904296875;
    float _253 = -_147;
    float _255 = _253 + _167;
    float _257 = -_151;
    float _259 = _257 + _171;
    bool _261 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _263 = fma(_255, _221, _147);
    float _265 = _241 * 6.283185482025146484375;
    float _267 = cos(_265);
    float _269 = fma(_259, _221, _151);
    float _271 = _245 * 6.283185482025146484375;
    float _273 = sin(_271);
    float _275 = _245 * 6.283185482025146484375;
    float _277 = cos(_275);
    float _279 = _251 * 6.283185482025146484375;
    float _281 = sin(_279);
    float _283 = _249 * _273;
    float _285 = _273 * _267;
    float _287 = _251 * 6.283185482025146484375;
    float _289 = cos(_287);
    float _291 = _267 * _277;
    float _293 = _249 * _281;
    float _295 = fma(_281, _291, _283);
    float _297 = _249 * _277;
    float _299 = _263 * _281;
    float _301 = fma(_273, _293, _291);
    float _303 = -_149;
    float _305 = _303 + _169;
    float _307 = -_285;
    float _309 = fma(_277, _293, _307);
    float _311 = -_297;
    float _313 = fma(_281, _285, _311);
    float _315 = _249 * _289;
    float _317 = _267 * _289;
    float _319 = _289 * _263;
    float _321 = fma(_305, _221, _149);
    float _323 = _269 * _295;
    int _325 = _66 * 48;
    float _327 = _277 * _319;
    float _329 = _321 * _309;
    float _331 = _273 * _319;
    float _333 = _321 * _315;
    float _335 = _269 * _317;
    float _337 = -_187;
    float _339 = _337 + _207;
    float _341 = -_189;
    float _343 = _341 + _209;
    float _345 = -_191;
    float _347 = _345 + _211;
    float _349 = _321 * _301;
    float _351 = fma(_339, _221, _187);
    float _353 = fma(_343, _221, _189);
    float _355 = fma(_347, _221, _191);
    float _357 = _269 * _313;
    float _359 = -_299;
    float _361 = _359 + (-0.0);
    float _363 = _267;
    float _365 = _259;
    float _367 = _191;
    float _369 = _209;
    float _371 = _189;
    float _373 = _285;
    float _375 = _207;
    float _377 = _349;
    float _379 = _329;
    float _381 = _361;
    float _383 = _357;
    float _385 = _323;
    if (!_261)
    {
        int _387 = _66 * 48;
        float _389 = -_299;
        float _391 = _389 + (-0.0);
        int _393 = _387 + 16;
        uint _395 = uint(int(uint(_387) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_395)] = as_type<uint>(_327);
        int _397 = _387 + 4;
        uint _399 = uint(int(uint(_397) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_399)] = as_type<uint>(_329);
        int _401 = _387 + 8;
        uint _403 = uint(int(uint(_401) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_403)] = as_type<uint>(_323);
        int _405 = _387 + 12;
        uint _407 = uint(int(uint(_405) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_407)] = as_type<uint>(_351);
        int _409 = _387 + 32;
        uint _411 = uint(int(uint(_393) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_411)] = as_type<uint>(_331);
        int _413 = _393 + 4;
        uint _415 = uint(int(uint(_413) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_415)] = as_type<uint>(_349);
        int _417 = _393 + 8;
        uint _419 = uint(int(uint(_417) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_419)] = as_type<uint>(_357);
        int _421 = _393 + 12;
        uint _423 = uint(int(uint(_421) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_423)] = as_type<uint>(_353);
        uint _425 = uint(int(uint(_409) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_425)] = as_type<uint>(_391);
        int _427 = _409 + 4;
        uint _429 = uint(int(uint(_427) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_429)] = as_type<uint>(_333);
        int _431 = _409 + 8;
        uint _433 = uint(int(uint(_431) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_433)] = as_type<uint>(_335);
        int _435 = _409 + 12;
        uint _437 = uint(int(uint(_435) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_437)] = as_type<uint>(_355);
        _363 = as_type<float>(_387);
        _365 = as_type<float>(_409);
        _367 = as_type<float>(_393);
    }
    float _439 = _363;
    float _441 = _365;
    float _443 = _367;
    uint _445 = uint(int(uint(_325) >> uint(2)));
    _39[int(_445)] = as_type<uint>(_327);
    int _447 = _325 + 4;
    uint _449 = uint(int(uint(_447) >> uint(2)));
    _39[int(_449)] = as_type<uint>(_329);
    int _451 = _325 + 8;
    uint _453 = uint(int(uint(_451) >> uint(2)));
    _39[int(_453)] = as_type<uint>(_323);
    int _455 = _325 + 12;
    uint _457 = uint(int(uint(_455) >> uint(2)));
    _39[int(_457)] = as_type<uint>(_351);
    int _459 = _66 * 112;
    float _461 = _439;
    float _463 = _441;
    float _465 = _443;
    if (!_223)
    {
        _369 = _351;
    }
    float _467 = _369;
    int _469 = _325 + 32;
    uint _471 = uint(int(uint(_469) >> uint(2)));
    _39[int(_471)] = as_type<uint>(_361);
    int _473 = _325 + 36;
    uint _475 = uint(int(uint(_473) >> uint(2)));
    _39[int(_475)] = as_type<uint>(_333);
    int _477 = _325 + 40;
    uint _479 = uint(int(uint(_477) >> uint(2)));
    _39[int(_479)] = as_type<uint>(_335);
    int _481 = _325 + 44;
    uint _483 = uint(int(uint(_481) >> uint(2)));
    _39[int(_483)] = as_type<uint>(_355);
    float _485 = _467;
    if (!_223)
    {
        _371 = _353;
    }
    float _487 = _371;
    float _489 = _487;
    if (!_223)
    {
        _461 = _355;
    }
    float _491 = _461;
    int _493 = _325 + 16;
    uint _495 = uint(int(uint(_493) >> uint(2)));
    _39[int(_495)] = as_type<uint>(_331);
    int _497 = _325 + 20;
    uint _499 = uint(int(uint(_497) >> uint(2)));
    _39[int(_499)] = as_type<uint>(_349);
    int _501 = _325 + 24;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    _39[int(_503)] = as_type<uint>(_357);
    int _505 = _325 + 28;
    uint _507 = uint(int(uint(_505) >> uint(2)));
    _39[int(_507)] = as_type<uint>(_353);
    float _509 = _491;
    if (!_223)
    {
        _373 = _327;
    }
    float _511 = _373;
    float _513 = _511;
    if (!_223)
    {
        _375 = _331;
    }
    float _515 = _375;
    float _517 = _515;
    if (!_223)
    {
        _463 = _333;
    }
    float _519 = _463;
    float _521 = _519;
    if (!_223)
    {
        _465 = _335;
    }
    float _523 = _465;
    bool _525 = !_223;
    float _527 = _523;
    if (!_525)
    {
        bool _529 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _531 = !_529;
        if (!_531)
        {
            uint _533 = uint(int(uint(_459) >> uint(2)));
            uint _535 = uint(int(uint(int(_533)) >> uint(2)));
            int _537 = int(_533) & 3;
            float _539 = (*spvDescriptorSet0.cp_c6)._m0[int(_535)][_537];
            int _541 = as_type<int>(_539) * 48;
            int _543 = 0;
            bool _545;
            float _643;
            float _645;
            float _647;
            float _671;
            float _675;
            float _677;
            float _679;
            float _699;
            float _701;
            float _703;
            float _705;
            do
            {
                int _547 = _543;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _549 = uint(int(uint(_541) >> uint(2)));
                float _551 = as_type<float>(_39[int(_549)]);
                int _553 = _541 + 4;
                uint _555 = uint(int(uint(_553) >> uint(2)));
                float _557 = as_type<float>(_39[int(_555)]);
                int _559 = _541 + 8;
                uint _561 = uint(int(uint(_559) >> uint(2)));
                float _563 = as_type<float>(_39[int(_561)]);
                int _565 = _541 + 12;
                uint _567 = uint(int(uint(_565) >> uint(2)));
                float _569 = as_type<float>(_39[int(_567)]);
                int _571 = _547 + 1;
                int _573 = _541 + 16;
                uint _575 = uint(int(uint(_573) >> uint(2)));
                float _577 = as_type<float>(_39[int(_575)]);
                int _579 = _541 + 20;
                uint _581 = uint(int(uint(_579) >> uint(2)));
                float _583 = as_type<float>(_39[int(_581)]);
                int _585 = _541 + 24;
                uint _587 = uint(int(uint(_585) >> uint(2)));
                float _589 = as_type<float>(_39[int(_587)]);
                int _591 = _541 + 28;
                uint _593 = uint(int(uint(_591) >> uint(2)));
                float _595 = as_type<float>(_39[int(_593)]);
                bool _597 = uint(_571) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _599 = _541 + 32;
                uint _601 = uint(int(uint(_599) >> uint(2)));
                float _603 = as_type<float>(_39[int(_601)]);
                int _605 = _541 + 36;
                uint _607 = uint(int(uint(_605) >> uint(2)));
                float _609 = as_type<float>(_39[int(_607)]);
                int _611 = _541 + 40;
                uint _613 = uint(int(uint(_611) >> uint(2)));
                float _615 = as_type<float>(_39[int(_613)]);
                int _617 = _541 + 44;
                uint _619 = uint(int(uint(_617) >> uint(2)));
                float _621 = as_type<float>(_39[int(_619)]);
                float _623 = _353 * _557;
                float _625 = _331 * _557;
                float _627 = _349 * _557;
                float _629 = _357 * _557;
                float _631 = fma(_351, _551, _623);
                float _633 = fma(_327, _551, _625);
                float _635 = fma(_329, _551, _627);
                float _637 = fma(_323, _551, _629);
                float _639 = fma(_355, _563, _631);
                float _641 = -_299;
                _643 = fma(_641, _563, _633);
                _645 = fma(_333, _563, _635);
                _647 = fma(_335, _563, _637);
                float _649 = _353 * _583;
                float _651 = _331 * _583;
                float _653 = _569 + _639;
                float _655 = _349 * _583;
                float _657 = _357 * _583;
                float _659 = fma(_351, _577, _649);
                float _661 = fma(_327, _577, _651);
                float _663 = fma(_329, _577, _655);
                float _665 = fma(_323, _577, _657);
                float _667 = fma(_355, _589, _659);
                float _669 = -_299;
                _671 = fma(_669, _589, _661);
                float _673 = _353 * _609;
                _675 = fma(_333, _589, _663);
                _677 = fma(_335, _589, _665);
                _679 = _595 + _667;
                float _681 = _331 * _609;
                float _683 = _349 * _609;
                float _685 = _357 * _609;
                float _687 = fma(_351, _603, _673);
                float _689 = fma(_327, _603, _681);
                float _691 = fma(_329, _603, _683);
                float _693 = fma(_323, _603, _685);
                float _695 = fma(_355, _615, _687);
                float _697 = -_299;
                _699 = fma(_697, _615, _689);
                _701 = fma(_333, _615, _691);
                _703 = fma(_335, _615, _693);
                _705 = _621 + _695;
                uint _707 = uint(int(uint(_325) >> uint(2)));
                _39[int(_707)] = as_type<uint>(_643);
                int _709 = _325 + 4;
                uint _711 = uint(int(uint(_709) >> uint(2)));
                _39[int(_711)] = as_type<uint>(_645);
                int _713 = _325 + 8;
                uint _715 = uint(int(uint(_713) >> uint(2)));
                _39[int(_715)] = as_type<uint>(_647);
                int _717 = _325 + 12;
                uint _719 = uint(int(uint(_717) >> uint(2)));
                _39[int(_719)] = as_type<uint>(_653);
                int _721 = _325 + 16;
                uint _723 = uint(int(uint(_721) >> uint(2)));
                _39[int(_723)] = as_type<uint>(_671);
                int _725 = _325 + 20;
                uint _727 = uint(int(uint(_725) >> uint(2)));
                _39[int(_727)] = as_type<uint>(_675);
                int _729 = _325 + 24;
                uint _731 = uint(int(uint(_729) >> uint(2)));
                _39[int(_731)] = as_type<uint>(_677);
                int _733 = _325 + 28;
                uint _735 = uint(int(uint(_733) >> uint(2)));
                _39[int(_735)] = as_type<uint>(_679);
                int _737 = _325 + 32;
                uint _739 = uint(int(uint(_737) >> uint(2)));
                _39[int(_739)] = as_type<uint>(_699);
                int _741 = _325 + 36;
                uint _743 = uint(int(uint(_741) >> uint(2)));
                _39[int(_743)] = as_type<uint>(_701);
                int _745 = _325 + 40;
                uint _747 = uint(int(uint(_745) >> uint(2)));
                _39[int(_747)] = as_type<uint>(_703);
                int _749 = _325 + 44;
                uint _751 = uint(int(uint(_749) >> uint(2)));
                _39[int(_751)] = as_type<uint>(_705);
                _545 = !_597;
                _543 = _571;
                _485 = _653;
            } while (_545);
            _377 = _675;
            _521 = _701;
            _379 = _645;
            _517 = _671;
            _381 = _699;
            _513 = _643;
            _383 = _677;
            _385 = _647;
            _527 = _703;
            _489 = _679;
            _509 = _705;
            _753 = true;
        }
        else
        {
            _377 = 0.0;
            _521 = 0.0;
            _379 = 0.0;
            _517 = 0.0;
            _381 = 0.0;
            _513 = 0.0;
            _383 = 0.0;
            _385 = 0.0;
            _527 = 0.0;
            _489 = 0.0;
            _509 = 0.0;
            _485 = 0.0;
        }
    }
    _753 = false;
    float _755 = _377;
    float _757 = _521;
    float _759 = _379;
    float _761 = _517;
    float _763 = _381;
    float _765 = _513;
    float _767 = _383;
    float _769 = _385;
    float _771 = _527;
    float _773 = _489;
    float _775 = _509;
    float _777 = _485;
    int _779 = _459 + 80;
    uint _781 = uint(int(uint(_779) >> uint(2)));
    uint _783 = uint(int(uint(int(_781)) >> uint(2)));
    int _785 = int(_781) & 3;
    float _787 = (*spvDescriptorSet0.cp_c6)._m0[int(_783)][_785];
    int _789 = int(_781) + 1;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    int _793 = _789 & 3;
    float _795 = (*spvDescriptorSet0.cp_c6)._m0[int(_791)][_793];
    int _797 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _799 = _797 + _66;
    int _801 = _459 + 64;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    uint _805 = uint(int(uint(int(_803)) >> uint(2)));
    int _807 = int(_803) & 3;
    float _809 = (*spvDescriptorSet0.cp_c6)._m0[int(_805)][_807];
    int _811 = int(_803) + 1;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    int _815 = _811 & 3;
    float _817 = (*spvDescriptorSet0.cp_c6)._m0[int(_813)][_815];
    int _819 = _799 * 48;
    int _821 = _459 + 88;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    uint _825 = uint(int(uint(int(_823)) >> uint(2)));
    int _827 = int(_823) & 3;
    float _829 = (*spvDescriptorSet0.cp_c6)._m0[int(_825)][_827];
    int _831 = int(_823) + 1;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    int _835 = _831 & 3;
    float _837 = (*spvDescriptorSet0.cp_c6)._m0[int(_833)][_835];
    int _839 = _459 + 72;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
    int _845 = int(_841) & 3;
    float _847 = (*spvDescriptorSet0.cp_c6)._m0[int(_843)][_845];
    int _849 = int(_841) + 1;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    int _853 = _849 & 3;
    float _855 = (*spvDescriptorSet0.cp_c6)._m0[int(_851)][_853];
    int _857 = _459 + 104;
    uint _859 = uint(int(uint(_857) >> uint(2)));
    uint _861 = uint(int(uint(int(_859)) >> uint(2)));
    int _863 = int(_859) & 3;
    float _865 = (*spvDescriptorSet0.cp_c6)._m0[int(_861)][_863];
    int _867 = int(_859) + 1;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    int _871 = _867 & 3;
    float _873 = (*spvDescriptorSet0.cp_c6)._m0[int(_869)][_871];
    int _875 = _459 + 96;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    uint _879 = uint(int(uint(int(_877)) >> uint(2)));
    int _881 = int(_877) & 3;
    float _883 = (*spvDescriptorSet0.cp_c6)._m0[int(_879)][_881];
    int _885 = int(_877) + 1;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    int _889 = _885 & 3;
    float _891 = (*spvDescriptorSet0.cp_c6)._m0[int(_887)][_889];
    float _893 = _755 * _787;
    float _895 = _757 * _787;
    int _897 = _459 + 16;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.cp_c6)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.cp_c6)._m0[int(_909)][_911];
    float _915 = _759 * _787;
    float _917 = fma(_761, _809, _893);
    float _919 = fma(_763, _809, _895);
    float _921 = _759 * _795;
    float _923 = _755 * _795;
    float _925 = _757 * _795;
    int _927 = _459 + 32;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.cp_c6)._m0[int(_931)][_933];
    int _937 = int(_929) + 1;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    int _941 = _937 & 3;
    float _943 = (*spvDescriptorSet0.cp_c6)._m0[int(_939)][_941];
    float _945 = fma(_765, _817, _921);
    float _947 = fma(_761, _817, _923);
    float _949 = fma(_763, _817, _925);
    float _951 = _759 * _829;
    float _953 = _759 * _837;
    float _955 = _755 * _829;
    float _957 = _757 * _829;
    int _959 = _459 + 48;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    uint _963 = uint(int(uint(int(_961)) >> uint(2)));
    int _965 = int(_961) & 3;
    float _967 = (*spvDescriptorSet0.cp_c6)._m0[int(_963)][_965];
    int _969 = int(_961) + 1;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    int _973 = _969 & 3;
    float _975 = (*spvDescriptorSet0.cp_c6)._m0[int(_971)][_973];
    float _977 = _755 * _837;
    float _979 = _757 * _837;
    float _981 = fma(_761, _847, _955);
    float _983 = fma(_765, _847, _951);
    float _985 = fma(_765, _855, _953);
    float _987 = fma(_761, _855, _977);
    float _989 = fma(_763, _847, _957);
    int _991 = _459 + 24;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    uint _995 = uint(int(uint(int(_993)) >> uint(2)));
    int _997 = int(_993) & 3;
    float _999 = (*spvDescriptorSet0.cp_c6)._m0[int(_995)][_997];
    int _1001 = int(_993) + 1;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    int _1005 = _1001 & 3;
    float _1007 = (*spvDescriptorSet0.cp_c6)._m0[int(_1003)][_1005];
    float _1009 = fma(_763, _855, _979);
    float _1011 = fma(_765, _809, _915);
    float _1013 = fma(_767, _873, _987);
    float _1015 = fma(_769, _873, _985);
    float _1017 = fma(_771, _873, _1009);
    float _1019 = fma(_769, _865, _983);
    float _1021 = _1013 + _773;
    int _1023 = _459 + 40;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.cp_c6)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.cp_c6)._m0[int(_1035)][_1037];
    float _1041 = _1017 + _775;
    float _1043 = _1015 + _777;
    float _1045 = fma(_769, _891, _945);
    float _1047 = fma(_769, _883, _1011);
    float _1049 = fma(_767, _883, _917);
    float _1051 = fma(_767, _891, _947);
    float _1053 = fma(_767, _865, _981);
    int _1055 = _459 + 56;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    uint _1059 = uint(int(uint(int(_1057)) >> uint(2)));
    int _1061 = int(_1057) & 3;
    float _1063 = (*spvDescriptorSet0.cp_c6)._m0[int(_1059)][_1061];
    int _1065 = int(_1057) + 1;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    int _1069 = _1065 & 3;
    float _1071 = (*spvDescriptorSet0.cp_c6)._m0[int(_1067)][_1069];
    float _1073 = fma(_771, _883, _919);
    float _1075 = fma(_771, _891, _949);
    float _1077 = fma(_771, _865, _989);
    float _1079 = _1021 * _913;
    float _1081 = _1049 * _913;
    float _1083 = _1051 * _913;
    float _1085 = _1053 * _913;
    float _1087 = fma(_1043, _905, _1079);
    float _1089 = fma(_1047, _905, _1081);
    float _1091 = fma(_1045, _905, _1083);
    float _1093 = fma(_1019, _905, _1085);
    float _1095 = _1021 * _943;
    float _1097 = _1049 * _943;
    float _1099 = _1051 * _943;
    float _1101 = _1053 * _943;
    float _1103 = fma(_1043, _935, _1095);
    float _1105 = fma(_1047, _935, _1097);
    float _1107 = fma(_1045, _935, _1099);
    float _1109 = fma(_1019, _935, _1101);
    float _1111 = _1021 * _975;
    float _1113 = _1049 * _975;
    float _1115 = _1051 * _975;
    float _1117 = _1053 * _975;
    float _1119 = fma(_1043, _967, _1111);
    float _1121 = fma(_1047, _967, _1113);
    float _1123 = fma(_1045, _967, _1115);
    float _1125 = fma(_1019, _967, _1117);
    float _1127 = fma(_1041, _999, _1087);
    float _1129 = fma(_1075, _999, _1091);
    float _1131 = fma(_1073, _999, _1089);
    float _1133 = fma(_1077, _999, _1093);
    float _1135 = _1127 + _1007;
    int _1137 = _819 + 16;
    float _1139 = fma(_1041, _1031, _1103);
    float _1141 = fma(_1073, _1031, _1105);
    float _1143 = fma(_1075, _1031, _1107);
    float _1145 = fma(_1077, _1031, _1109);
    float _1147 = _1139 + _1039;
    uint _1149 = uint(int(uint(_1137) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1149)] = as_type<uint>(_1131);
    int _1151 = _1137 + 4;
    uint _1153 = uint(int(uint(_1151) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1153)] = as_type<uint>(_1129);
    int _1155 = _1137 + 8;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1157)] = as_type<uint>(_1133);
    int _1159 = _1137 + 12;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1161)] = as_type<uint>(_1135);
    float _1163 = fma(_1041, _1063, _1119);
    float _1165 = fma(_1073, _1063, _1121);
    int _1167 = _819 + 32;
    float _1169 = fma(_1075, _1063, _1123);
    float _1171 = fma(_1077, _1063, _1125);
    float _1173 = _1163 + _1071;
    int _1175 = _819 + 48;
    uint _1177 = uint(int(uint(_1167) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1177)] = as_type<uint>(_1141);
    int _1179 = _1167 + 4;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1181)] = as_type<uint>(_1143);
    int _1183 = _1167 + 8;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1185)] = as_type<uint>(_1145);
    int _1187 = _1167 + 12;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1189)] = as_type<uint>(_1147);
    uint _1191 = uint(int(uint(_1175) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1191)] = as_type<uint>(_1165);
    int _1193 = _1175 + 4;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1195)] = as_type<uint>(_1169);
    int _1197 = _1175 + 8;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1199)] = as_type<uint>(_1171);
    int _1201 = _1175 + 12;
    uint _1203 = uint(int(uint(_1201) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1203)] = as_type<uint>(_1173);
}

