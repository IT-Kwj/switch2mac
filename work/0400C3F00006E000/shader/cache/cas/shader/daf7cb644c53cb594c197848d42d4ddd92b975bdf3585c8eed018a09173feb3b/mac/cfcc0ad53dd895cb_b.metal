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
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _3437, thread const int& _3438, constant _10& support_buffer)
{
    int _3441 = 1 + _3438;
    float _3443 = support_buffer._m5[_3441].x;
    bool _3445 = _3443 == 1.0;
    if (_3445)
    {
        return _3437;
    }
    float _3447 = float(_3437);
    float _3449 = _3447 * _3443;
    int _3451 = int(_3449);
    return _3451;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _855 = false;
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
    int _85 = _74 + 8;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.cp_c5)._m0[int(_89)][_91];
    int _95 = _68;
    int _97 = 0;
    int _99 = _58(_95, _97, (*spvDescriptorSet0.support_buffer));
    int _101 = as_type<int>(_83);
    int _103 = 0;
    int _105 = _58(_101, _103, (*spvDescriptorSet0.support_buffer));
    int3 _1383 = int3(_99, _105, 1);
    float3 _109 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1383.xy), uint(_1383.z), 0).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    int _117 = _68;
    int _119 = 1;
    int _121 = _58(_117, _119, (*spvDescriptorSet0.support_buffer));
    int _123 = as_type<int>(_93);
    int _125 = 1;
    int _127 = _58(_123, _125, (*spvDescriptorSet0.support_buffer));
    int3 _1401 = int3(_121, _127, 1);
    float3 _129 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1401.xy), uint(_1401.z), 0).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    int _137 = _68;
    int _139 = 1;
    int _141 = _58(_137, _139, (*spvDescriptorSet0.support_buffer));
    int _143 = as_type<int>(_93);
    int _145 = 1;
    int _147 = _58(_143, _145, (*spvDescriptorSet0.support_buffer));
    int3 _1419 = int3(_141, _147, 0);
    float3 _149 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1419.xy), uint(_1419.z), 0).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    int _157 = _68;
    int _159 = 0;
    int _161 = _58(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = as_type<int>(_83);
    int _165 = 0;
    int _167 = _58(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _1437 = int3(_161, _167, 0);
    float3 _169 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1437.xy), uint(_1437.z), 0).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    int _177 = _68;
    int _179 = 1;
    int _181 = _58(_177, _179, (*spvDescriptorSet0.support_buffer));
    int _183 = as_type<int>(_93);
    int _185 = 1;
    int _187 = _58(_183, _185, (*spvDescriptorSet0.support_buffer));
    int3 _1455 = int3(_181, _187, 2);
    float3 _189 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1455.xy), uint(_1455.z), 0).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    int _197 = _68;
    int _199 = 0;
    int _201 = _58(_197, _199, (*spvDescriptorSet0.support_buffer));
    int _203 = as_type<int>(_83);
    int _205 = 0;
    int _207 = _58(_203, _205, (*spvDescriptorSet0.support_buffer));
    int3 _1473 = int3(_201, _207, 2);
    float3 _209 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1473.xy), uint(_1473.z), 0).xyz;
    float _211 = _209.x;
    float _213 = _209.y;
    float _215 = _209.z;
    int _217 = _74 + 20;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    uint _221 = uint(int(uint(int(_219)) >> uint(2)));
    int _223 = int(_219) & 3;
    float _225 = (*spvDescriptorSet0.cp_c5)._m0[int(_221)][_223];
    bool _227 = _68 != 0;
    int _229 = _74 + 28;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    uint _233 = uint(int(uint(int(_231)) >> uint(2)));
    int _235 = int(_231) & 3;
    float _237 = (*spvDescriptorSet0.cp_c5)._m0[int(_233)][_235];
    float _239 = _111 * 0.15915493667125701904296875;
    float _241 = _113 * 0.15915493667125701904296875;
    float _243 = _115 * 0.15915493667125701904296875;
    float _245 = _239 * 6.283185482025146484375;
    float _247 = cos(_245);
    float _249 = _133 * 0.15915493667125701904296875;
    float _251 = _135 * 0.15915493667125701904296875;
    float _253 = _131 * 0.15915493667125701904296875;
    float _255 = _195 * _237;
    float _257 = _241 * 6.283185482025146484375;
    float _259 = cos(_257);
    float _261 = _243 * 6.283185482025146484375;
    float _263 = sin(_261);
    float _265 = _243 * 6.283185482025146484375;
    float _267 = cos(_265);
    float _269 = _239 * 6.283185482025146484375;
    float _271 = sin(_269);
    float _273 = _241 * 6.283185482025146484375;
    float _275 = sin(_273);
    float _277 = _247 * _267;
    float _279 = _263 * _247;
    float _281 = _259 * _267;
    float _283 = _249 * 6.283185482025146484375;
    float _285 = sin(_283);
    float _287 = _247 * _259;
    float _289 = _271 * _263;
    float _291 = _249 * 6.283185482025146484375;
    float _293 = cos(_291);
    float _295 = _271 * _275;
    float _297 = fma(_275, _277, _289);
    float _299 = _251 * 6.283185482025146484375;
    float _301 = sin(_299);
    float _303 = _263 * _259;
    float _305 = _271 * _259;
    float _307 = fma(_263, _295, _277);
    float _309 = _251 * 6.283185482025146484375;
    float _311 = cos(_309);
    float _313 = _253 * 6.283185482025146484375;
    float _315 = cos(_313);
    float _317 = _271 * _267;
    float _319 = -_279;
    float _321 = fma(_267, _295, _319);
    float _323 = -_317;
    float _325 = fma(_275, _279, _323);
    float _327 = _301 * _293;
    float _329 = _253 * 6.283185482025146484375;
    float _331 = sin(_329);
    float _333 = _293 * _311;
    float _335 = _327 * _237;
    float _337 = fma(_215, _225, _255);
    float _339 = _333 * _237;
    float _341 = fma(_303, _225, _335);
    float _343 = _315 * _311;
    float _345 = _301 * _315;
    float _347 = _315 * _293;
    float _349 = fma(_281, _225, _339);
    float _351 = _331 * _285;
    float _353 = _331 * _301;
    float _355 = _331 * _311;
    float _357 = _331 * _293;
    float _359 = -_345;
    float _361 = fma(_311, _351, _359);
    float _363 = fma(_301, _351, _343);
    float _365 = fma(_285, _343, _353);
    float _367 = _275 * _225;
    float _369 = -_355;
    float _371 = fma(_285, _345, _369);
    float _373 = _357 * _237;
    float _375 = _363 * _237;
    float _377 = -_285;
    float _379 = -_367;
    float _381 = fma(_377, _237, _379);
    float _383 = _361 * _237;
    float _385 = _365 * _237;
    float _387 = fma(_305, _225, _373);
    float _389 = fma(_307, _225, _375);
    float _391 = fma(_321, _225, _383);
    float _393 = _371 * _237;
    float _395 = _341 * _341;
    float _397 = fma(_297, _225, _385);
    float _399 = _389 * _389;
    float _401 = fma(_325, _225, _393);
    float _403 = fma(_349, _349, _395);
    float _405 = _347 * _237;
    float _407 = fma(_391, _391, _399);
    float _409 = _401 * _401;
    float _411 = fma(_381, _381, _403);
    float _413 = fma(_287, _225, _405);
    float _415 = fma(_387, _387, _407);
    float _417 = fma(_397, _397, _409);
    float _419 = _151 * _237;
    float _421 = _153 * _237;
    float _423 = rsqrt(_411);
    float _425 = fma(_413, _413, _417);
    float _427 = fma(_171, _225, _419);
    float _429 = _155 * _237;
    float _431 = fma(_173, _225, _421);
    bool _433 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _435 = rsqrt(_415);
    float _437 = fma(_175, _225, _429);
    float _439 = rsqrt(_425);
    float _441 = _427 * _423;
    float _443 = _349 * _441;
    float _445 = _341 * _441;
    float _447 = _431 * _435;
    float _449 = _381 * _441;
    float _451 = _191 * _237;
    float _453 = _193 * _237;
    float _455 = _391 * _447;
    float _457 = _389 * _447;
    float _459 = _387 * _447;
    float _461 = fma(_211, _225, _451);
    float _463 = _437 * _439;
    float _465 = fma(_213, _225, _453);
    float _467 = _397 * _463;
    float _469 = _401 * _463;
    float _471 = _413 * _463;
    int _473 = _68 * 48;
    float _475 = _397;
    float _477 = _413;
    float _479 = _401;
    float _481 = _213;
    float _483 = _391;
    float _485 = _211;
    float _487 = _453;
    float _489 = _459;
    float _491 = _457;
    float _493 = _469;
    float _495 = _467;
    float _497 = _471;
    if (!_433)
    {
        int _499 = _68 * 48;
        int _501 = _499 + 16;
        uint _503 = uint(int(uint(_499) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_503)] = as_type<uint>(_443);
        int _505 = _499 + 4;
        uint _507 = uint(int(uint(_505) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_507)] = as_type<uint>(_455);
        int _509 = _499 + 8;
        uint _511 = uint(int(uint(_509) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_511)] = as_type<uint>(_467);
        int _513 = _499 + 12;
        uint _515 = uint(int(uint(_513) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_515)] = as_type<uint>(_461);
        int _517 = _499 + 32;
        uint _519 = uint(int(uint(_501) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_519)] = as_type<uint>(_445);
        int _521 = _501 + 4;
        uint _523 = uint(int(uint(_521) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_523)] = as_type<uint>(_457);
        int _525 = _501 + 8;
        uint _527 = uint(int(uint(_525) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_527)] = as_type<uint>(_469);
        int _529 = _501 + 12;
        uint _531 = uint(int(uint(_529) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_531)] = as_type<uint>(_465);
        uint _533 = uint(int(uint(_517) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_533)] = as_type<uint>(_449);
        int _535 = _517 + 4;
        uint _537 = uint(int(uint(_535) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_537)] = as_type<uint>(_459);
        int _539 = _517 + 8;
        uint _541 = uint(int(uint(_539) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_541)] = as_type<uint>(_471);
        int _543 = _517 + 12;
        uint _545 = uint(int(uint(_543) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_545)] = as_type<uint>(_337);
        _475 = as_type<float>(_501);
        _477 = as_type<float>(_517);
        _479 = as_type<float>(_499);
    }
    float _547 = _475;
    float _549 = _477;
    float _551 = _479;
    uint _553 = uint(int(uint(_473) >> uint(2)));
    _39[int(_553)] = as_type<uint>(_443);
    int _555 = _473 + 4;
    uint _557 = uint(int(uint(_555) >> uint(2)));
    _39[int(_557)] = as_type<uint>(_455);
    int _559 = _473 + 8;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    _39[int(_561)] = as_type<uint>(_467);
    int _563 = _473 + 12;
    uint _565 = uint(int(uint(_563) >> uint(2)));
    _39[int(_565)] = as_type<uint>(_461);
    int _567 = _68 * 112;
    float _569 = _549;
    float _571 = _551;
    float _573 = _547;
    if (!_227)
    {
        _481 = _461;
    }
    float _575 = _481;
    int _577 = _473 + 16;
    uint _579 = uint(int(uint(_577) >> uint(2)));
    _39[int(_579)] = as_type<uint>(_445);
    int _581 = _473 + 20;
    uint _583 = uint(int(uint(_581) >> uint(2)));
    _39[int(_583)] = as_type<uint>(_457);
    int _585 = _473 + 24;
    uint _587 = uint(int(uint(_585) >> uint(2)));
    _39[int(_587)] = as_type<uint>(_469);
    int _589 = _473 + 28;
    uint _591 = uint(int(uint(_589) >> uint(2)));
    _39[int(_591)] = as_type<uint>(_465);
    float _593 = _575;
    if (!_227)
    {
        _569 = _465;
    }
    float _595 = _569;
    float _597 = _595;
    if (!_227)
    {
        _571 = _337;
    }
    float _599 = _571;
    int _601 = _473 + 32;
    uint _603 = uint(int(uint(_601) >> uint(2)));
    _39[int(_603)] = as_type<uint>(_449);
    int _605 = _473 + 36;
    uint _607 = uint(int(uint(_605) >> uint(2)));
    _39[int(_607)] = as_type<uint>(_459);
    int _609 = _473 + 40;
    uint _611 = uint(int(uint(_609) >> uint(2)));
    _39[int(_611)] = as_type<uint>(_471);
    int _613 = _473 + 44;
    uint _615 = uint(int(uint(_613) >> uint(2)));
    _39[int(_615)] = as_type<uint>(_337);
    float _617 = _599;
    if (!_227)
    {
        _483 = _443;
    }
    float _619 = _483;
    float _621 = _619;
    if (!_227)
    {
        _485 = _445;
    }
    float _623 = _485;
    float _625 = _623;
    if (!_227)
    {
        _573 = _449;
    }
    float _627 = _573;
    float _629 = _627;
    if (!_227)
    {
        _487 = _455;
    }
    float _631 = _487;
    bool _633 = !_227;
    float _635 = _631;
    if (!_633)
    {
        bool _637 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _639 = !_637;
        if (!_639)
        {
            uint _641 = uint(int(uint(_567) >> uint(2)));
            uint _643 = uint(int(uint(int(_641)) >> uint(2)));
            int _645 = int(_641) & 3;
            float _647 = (*spvDescriptorSet0.cp_c6)._m0[int(_643)][_645];
            int _649 = as_type<int>(_647) * 48;
            int _651 = 0;
            bool _653;
            float _749;
            float _751;
            float _753;
            float _757;
            float _775;
            float _777;
            float _779;
            float _791;
            float _801;
            float _803;
            float _805;
            float _807;
            do
            {
                int _655 = _651;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _657 = uint(int(uint(_649) >> uint(2)));
                float _659 = as_type<float>(_39[int(_657)]);
                int _661 = _649 + 4;
                uint _663 = uint(int(uint(_661) >> uint(2)));
                float _665 = as_type<float>(_39[int(_663)]);
                int _667 = _649 + 8;
                uint _669 = uint(int(uint(_667) >> uint(2)));
                float _671 = as_type<float>(_39[int(_669)]);
                int _673 = _649 + 12;
                uint _675 = uint(int(uint(_673) >> uint(2)));
                float _677 = as_type<float>(_39[int(_675)]);
                int _679 = _655 + 1;
                int _681 = _649 + 16;
                uint _683 = uint(int(uint(_681) >> uint(2)));
                float _685 = as_type<float>(_39[int(_683)]);
                int _687 = _649 + 20;
                uint _689 = uint(int(uint(_687) >> uint(2)));
                float _691 = as_type<float>(_39[int(_689)]);
                int _693 = _649 + 24;
                uint _695 = uint(int(uint(_693) >> uint(2)));
                float _697 = as_type<float>(_39[int(_695)]);
                int _699 = _649 + 28;
                uint _701 = uint(int(uint(_699) >> uint(2)));
                float _703 = as_type<float>(_39[int(_701)]);
                bool _705 = uint(_679) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _707 = _649 + 32;
                uint _709 = uint(int(uint(_707) >> uint(2)));
                float _711 = as_type<float>(_39[int(_709)]);
                int _713 = _649 + 36;
                uint _715 = uint(int(uint(_713) >> uint(2)));
                float _717 = as_type<float>(_39[int(_715)]);
                int _719 = _649 + 40;
                uint _721 = uint(int(uint(_719) >> uint(2)));
                float _723 = as_type<float>(_39[int(_721)]);
                int _725 = _649 + 44;
                uint _727 = uint(int(uint(_725) >> uint(2)));
                float _729 = as_type<float>(_39[int(_727)]);
                float _731 = _465 * _665;
                float _733 = _445 * _665;
                float _735 = _457 * _665;
                float _737 = _469 * _665;
                float _739 = fma(_461, _659, _731);
                float _741 = fma(_443, _659, _733);
                float _743 = fma(_455, _659, _735);
                float _745 = fma(_467, _659, _737);
                float _747 = fma(_337, _671, _739);
                _749 = fma(_449, _671, _741);
                _751 = fma(_459, _671, _743);
                _753 = fma(_471, _671, _745);
                float _755 = _465 * _691;
                _757 = _677 + _747;
                float _759 = _445 * _691;
                float _761 = _457 * _691;
                float _763 = fma(_461, _685, _755);
                float _765 = _469 * _691;
                float _767 = fma(_443, _685, _759);
                float _769 = fma(_455, _685, _761);
                float _771 = fma(_337, _697, _763);
                float _773 = fma(_467, _685, _765);
                _775 = fma(_449, _697, _767);
                _777 = fma(_459, _697, _769);
                _779 = _703 + _771;
                float _781 = _465 * _717;
                float _783 = _445 * _717;
                float _785 = _457 * _717;
                float _787 = _469 * _717;
                float _789 = fma(_461, _711, _781);
                _791 = fma(_471, _697, _773);
                float _793 = fma(_443, _711, _783);
                float _795 = fma(_455, _711, _785);
                float _797 = fma(_467, _711, _787);
                float _799 = fma(_337, _723, _789);
                _801 = fma(_449, _723, _793);
                _803 = fma(_459, _723, _795);
                _805 = fma(_471, _723, _797);
                _807 = _729 + _799;
                uint _809 = uint(int(uint(_473) >> uint(2)));
                _39[int(_809)] = as_type<uint>(_749);
                int _811 = _473 + 4;
                uint _813 = uint(int(uint(_811) >> uint(2)));
                _39[int(_813)] = as_type<uint>(_751);
                int _815 = _473 + 8;
                uint _817 = uint(int(uint(_815) >> uint(2)));
                _39[int(_817)] = as_type<uint>(_753);
                int _819 = _473 + 12;
                uint _821 = uint(int(uint(_819) >> uint(2)));
                _39[int(_821)] = as_type<uint>(_757);
                int _823 = _473 + 16;
                uint _825 = uint(int(uint(_823) >> uint(2)));
                _39[int(_825)] = as_type<uint>(_775);
                int _827 = _473 + 20;
                uint _829 = uint(int(uint(_827) >> uint(2)));
                _39[int(_829)] = as_type<uint>(_777);
                int _831 = _473 + 24;
                uint _833 = uint(int(uint(_831) >> uint(2)));
                _39[int(_833)] = as_type<uint>(_791);
                int _835 = _473 + 28;
                uint _837 = uint(int(uint(_835) >> uint(2)));
                _39[int(_837)] = as_type<uint>(_779);
                int _839 = _473 + 32;
                uint _841 = uint(int(uint(_839) >> uint(2)));
                _39[int(_841)] = as_type<uint>(_801);
                int _843 = _473 + 36;
                uint _845 = uint(int(uint(_843) >> uint(2)));
                _39[int(_845)] = as_type<uint>(_803);
                int _847 = _473 + 40;
                uint _849 = uint(int(uint(_847) >> uint(2)));
                _39[int(_849)] = as_type<uint>(_805);
                int _851 = _473 + 44;
                uint _853 = uint(int(uint(_851) >> uint(2)));
                _39[int(_853)] = as_type<uint>(_807);
                _653 = !_705;
                _651 = _679;
            } while (_653);
            _635 = _751;
            _489 = _803;
            _491 = _777;
            _621 = _749;
            _629 = _801;
            _625 = _775;
            _493 = _791;
            _495 = _753;
            _497 = _805;
            _593 = _757;
            _597 = _779;
            _617 = _807;
            _855 = true;
        }
        else
        {
            _635 = 0.0;
            _489 = 0.0;
            _491 = 0.0;
            _621 = 0.0;
            _629 = 0.0;
            _625 = 0.0;
            _493 = 0.0;
            _495 = 0.0;
            _497 = 0.0;
            _593 = 0.0;
            _597 = 0.0;
            _617 = 0.0;
        }
    }
    _855 = false;
    float _857 = _635;
    float _859 = _489;
    float _861 = _491;
    float _863 = _621;
    float _865 = _629;
    float _867 = _625;
    float _869 = _493;
    float _871 = _495;
    float _873 = _497;
    float _875 = _593;
    float _877 = _597;
    float _879 = _617;
    int _881 = _567 + 80;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.cp_c6)._m0[int(_893)][_895];
    int _899 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _901 = _899 + _68;
    int _903 = _567 + 64;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    uint _907 = uint(int(uint(int(_905)) >> uint(2)));
    int _909 = int(_905) & 3;
    float _911 = (*spvDescriptorSet0.cp_c6)._m0[int(_907)][_909];
    int _913 = int(_905) + 1;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    int _917 = _913 & 3;
    float _919 = (*spvDescriptorSet0.cp_c6)._m0[int(_915)][_917];
    int _921 = _901 * 48;
    int _923 = _567 + 88;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    uint _927 = uint(int(uint(int(_925)) >> uint(2)));
    int _929 = int(_925) & 3;
    float _931 = (*spvDescriptorSet0.cp_c6)._m0[int(_927)][_929];
    int _933 = int(_925) + 1;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    int _937 = _933 & 3;
    float _939 = (*spvDescriptorSet0.cp_c6)._m0[int(_935)][_937];
    int _941 = _567 + 72;
    uint _943 = uint(int(uint(_941) >> uint(2)));
    uint _945 = uint(int(uint(int(_943)) >> uint(2)));
    int _947 = int(_943) & 3;
    float _949 = (*spvDescriptorSet0.cp_c6)._m0[int(_945)][_947];
    int _951 = int(_943) + 1;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    int _955 = _951 & 3;
    float _957 = (*spvDescriptorSet0.cp_c6)._m0[int(_953)][_955];
    int _959 = _567 + 96;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    uint _963 = uint(int(uint(int(_961)) >> uint(2)));
    int _965 = int(_961) & 3;
    float _967 = (*spvDescriptorSet0.cp_c6)._m0[int(_963)][_965];
    int _969 = int(_961) + 1;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    int _973 = _969 & 3;
    float _975 = (*spvDescriptorSet0.cp_c6)._m0[int(_971)][_973];
    int _977 = _567 + 104;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    uint _981 = uint(int(uint(int(_979)) >> uint(2)));
    int _983 = int(_979) & 3;
    float _985 = (*spvDescriptorSet0.cp_c6)._m0[int(_981)][_983];
    int _987 = int(_979) + 1;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    int _991 = _987 & 3;
    float _993 = (*spvDescriptorSet0.cp_c6)._m0[int(_989)][_991];
    float _995 = _857 * _889;
    float _997 = _859 * _889;
    float _999 = _859 * _897;
    int _1001 = _567 + 16;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    uint _1005 = uint(int(uint(int(_1003)) >> uint(2)));
    int _1007 = int(_1003) & 3;
    float _1009 = (*spvDescriptorSet0.cp_c6)._m0[int(_1005)][_1007];
    int _1011 = int(_1003) + 1;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    int _1015 = _1011 & 3;
    float _1017 = (*spvDescriptorSet0.cp_c6)._m0[int(_1013)][_1015];
    float _1019 = _861 * _889;
    float _1021 = fma(_863, _911, _995);
    float _1023 = fma(_865, _911, _997);
    float _1025 = _857 * _897;
    int _1027 = _567 + 32;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    uint _1031 = uint(int(uint(int(_1029)) >> uint(2)));
    int _1033 = int(_1029) & 3;
    float _1035 = (*spvDescriptorSet0.cp_c6)._m0[int(_1031)][_1033];
    int _1037 = int(_1029) + 1;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    int _1041 = _1037 & 3;
    float _1043 = (*spvDescriptorSet0.cp_c6)._m0[int(_1039)][_1041];
    float _1045 = _861 * _897;
    float _1047 = fma(_865, _919, _999);
    float _1049 = fma(_867, _911, _1019);
    float _1051 = fma(_863, _919, _1025);
    float _1053 = _857 * _931;
    float _1055 = _861 * _931;
    float _1057 = _859 * _931;
    int _1059 = _567 + 48;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.cp_c6)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.cp_c6)._m0[int(_1071)][_1073];
    float _1077 = _857 * _939;
    float _1079 = _861 * _939;
    float _1081 = _859 * _939;
    float _1083 = fma(_867, _919, _1045);
    float _1085 = fma(_863, _949, _1053);
    float _1087 = fma(_863, _957, _1077);
    float _1089 = fma(_867, _949, _1055);
    int _1091 = _567 + 24;
    uint _1093 = uint(int(uint(_1091) >> uint(2)));
    uint _1095 = uint(int(uint(int(_1093)) >> uint(2)));
    int _1097 = int(_1093) & 3;
    float _1099 = (*spvDescriptorSet0.cp_c6)._m0[int(_1095)][_1097];
    int _1101 = int(_1093) + 1;
    uint _1103 = uint(int(uint(_1101) >> uint(2)));
    int _1105 = _1101 & 3;
    float _1107 = (*spvDescriptorSet0.cp_c6)._m0[int(_1103)][_1105];
    float _1109 = fma(_867, _957, _1079);
    float _1111 = fma(_865, _949, _1057);
    float _1113 = fma(_865, _957, _1081);
    float _1115 = fma(_869, _967, _1049);
    float _1117 = fma(_871, _967, _1021);
    float _1119 = fma(_871, _975, _1051);
    int _1121 = _567 + 40;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    uint _1125 = uint(int(uint(int(_1123)) >> uint(2)));
    int _1127 = int(_1123) & 3;
    float _1129 = (*spvDescriptorSet0.cp_c6)._m0[int(_1125)][_1127];
    int _1131 = int(_1123) + 1;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    int _1135 = _1131 & 3;
    float _1137 = (*spvDescriptorSet0.cp_c6)._m0[int(_1133)][_1135];
    float _1139 = fma(_869, _975, _1083);
    float _1141 = fma(_873, _967, _1023);
    float _1143 = fma(_873, _975, _1047);
    float _1145 = fma(_871, _985, _1085);
    float _1147 = fma(_871, _993, _1087);
    float _1149 = fma(_869, _985, _1089);
    int _1151 = _567 + 56;
    uint _1153 = uint(int(uint(_1151) >> uint(2)));
    uint _1155 = uint(int(uint(int(_1153)) >> uint(2)));
    int _1157 = int(_1153) & 3;
    float _1159 = (*spvDescriptorSet0.cp_c6)._m0[int(_1155)][_1157];
    int _1161 = int(_1153) + 1;
    uint _1163 = uint(int(uint(_1161) >> uint(2)));
    int _1165 = _1161 & 3;
    float _1167 = (*spvDescriptorSet0.cp_c6)._m0[int(_1163)][_1165];
    float _1169 = fma(_869, _993, _1109);
    float _1171 = fma(_873, _993, _1113);
    float _1173 = fma(_873, _985, _1111);
    float _1175 = _1147 + _875;
    float _1177 = _1169 + _877;
    float _1179 = _1171 + _879;
    int _1181 = _921 + 32;
    float _1183 = _1139 * _1017;
    float _1185 = _1177 * _1017;
    float _1187 = _1115 * _1017;
    float _1189 = _1149 * _1017;
    float _1191 = fma(_1119, _1009, _1183);
    float _1193 = fma(_1175, _1009, _1185);
    float _1195 = fma(_1117, _1009, _1187);
    float _1197 = fma(_1145, _1009, _1189);
    float _1199 = _1177 * _1043;
    float _1201 = _1139 * _1043;
    float _1203 = _1115 * _1043;
    float _1205 = _1149 * _1043;
    float _1207 = fma(_1175, _1035, _1199);
    float _1209 = fma(_1119, _1035, _1201);
    float _1211 = fma(_1117, _1035, _1203);
    float _1213 = fma(_1145, _1035, _1205);
    float _1215 = _1177 * _1075;
    float _1217 = _1115 * _1075;
    float _1219 = _1139 * _1075;
    float _1221 = _1149 * _1075;
    float _1223 = fma(_1175, _1067, _1215);
    float _1225 = fma(_1117, _1067, _1217);
    float _1227 = fma(_1119, _1067, _1219);
    float _1229 = fma(_1145, _1067, _1221);
    float _1231 = fma(_1179, _1099, _1193);
    float _1233 = fma(_1143, _1099, _1191);
    float _1235 = fma(_1141, _1099, _1195);
    float _1237 = fma(_1173, _1099, _1197);
    float _1239 = _1231 + _1107;
    int _1241 = _921 + 16;
    int _1243 = _921 + 48;
    float _1245 = fma(_1179, _1129, _1207);
    float _1247 = fma(_1143, _1129, _1209);
    float _1249 = fma(_1141, _1129, _1211);
    float _1251 = fma(_1173, _1129, _1213);
    float _1253 = _1245 + _1137;
    uint _1255 = uint(int(uint(_1241) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1255)] = as_type<uint>(_1235);
    int _1257 = _1241 + 4;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1259)] = as_type<uint>(_1233);
    int _1261 = _1241 + 8;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1263)] = as_type<uint>(_1237);
    int _1265 = _1241 + 12;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1267)] = as_type<uint>(_1239);
    float _1269 = fma(_1179, _1159, _1223);
    float _1271 = fma(_1141, _1159, _1225);
    float _1273 = fma(_1143, _1159, _1227);
    float _1275 = fma(_1173, _1159, _1229);
    float _1277 = _1269 + _1167;
    uint _1279 = uint(int(uint(_1181) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1279)] = as_type<uint>(_1249);
    int _1281 = _1181 + 4;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1283)] = as_type<uint>(_1247);
    int _1285 = _1181 + 8;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1287)] = as_type<uint>(_1251);
    int _1289 = _1181 + 12;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1291)] = as_type<uint>(_1253);
    uint _1293 = uint(int(uint(_1243) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1293)] = as_type<uint>(_1271);
    int _1295 = _1243 + 4;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1297)] = as_type<uint>(_1273);
    int _1299 = _1243 + 8;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1301)] = as_type<uint>(_1275);
    int _1303 = _1243 + 12;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1305)] = as_type<uint>(_1277);
}

