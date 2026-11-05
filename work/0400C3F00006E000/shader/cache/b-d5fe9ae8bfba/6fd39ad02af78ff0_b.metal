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
int _58(thread const int& _3376, thread const int& _3377, constant _10& support_buffer)
{
    int _3380 = 1 + _3377;
    float _3382 = support_buffer._m5[_3380].x;
    bool _3384 = _3382 == 1.0;
    if (_3384)
    {
        return _3376;
    }
    float _3386 = float(_3376);
    float _3388 = _3386 * _3382;
    int _3390 = int(_3388);
    return _3390;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _785 = false;
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
    int3 _1357 = int3(_99, _105, 1);
    float3 _109 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1357.xy), uint(_1357.z), 0).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    int _117 = _68;
    int _119 = 1;
    int _121 = _58(_117, _119, (*spvDescriptorSet0.support_buffer));
    int _123 = as_type<int>(_93);
    int _125 = 1;
    int _127 = _58(_123, _125, (*spvDescriptorSet0.support_buffer));
    int3 _1375 = int3(_121, _127, 1);
    float3 _129 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1375.xy), uint(_1375.z), 0).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    int _137 = _68;
    int _139 = 1;
    int _141 = _58(_137, _139, (*spvDescriptorSet0.support_buffer));
    int _143 = as_type<int>(_93);
    int _145 = 1;
    int _147 = _58(_143, _145, (*spvDescriptorSet0.support_buffer));
    int3 _1393 = int3(_141, _147, 0);
    float3 _149 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1393.xy), uint(_1393.z), 0).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    int _157 = _68;
    int _159 = 0;
    int _161 = _58(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = as_type<int>(_83);
    int _165 = 0;
    int _167 = _58(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _1411 = int3(_161, _167, 0);
    float3 _169 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1411.xy), uint(_1411.z), 0).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    int _177 = _68;
    int _179 = 1;
    int _181 = _58(_177, _179, (*spvDescriptorSet0.support_buffer));
    int _183 = as_type<int>(_93);
    int _185 = 1;
    int _187 = _58(_183, _185, (*spvDescriptorSet0.support_buffer));
    int3 _1429 = int3(_181, _187, 2);
    float3 _189 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1429.xy), uint(_1429.z), 0).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    int _197 = _68;
    int _199 = 0;
    int _201 = _58(_197, _199, (*spvDescriptorSet0.support_buffer));
    int _203 = as_type<int>(_83);
    int _205 = 0;
    int _207 = _58(_203, _205, (*spvDescriptorSet0.support_buffer));
    int3 _1447 = int3(_201, _207, 2);
    float3 _209 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1447.xy), uint(_1447.z), 0).xyz;
    float _211 = _209.x;
    float _213 = _209.y;
    float _215 = _209.z;
    int _217 = _74 + 28;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    uint _221 = uint(int(uint(int(_219)) >> uint(2)));
    int _223 = int(_219) & 3;
    float _225 = (*spvDescriptorSet0.cp_c5)._m0[int(_221)][_223];
    bool _227 = _68 != 0;
    int _229 = _74 + 20;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    uint _233 = uint(int(uint(int(_231)) >> uint(2)));
    int _235 = int(_231) & 3;
    float _237 = (*spvDescriptorSet0.cp_c5)._m0[int(_233)][_235];
    float _239 = _111 * 0.15915493667125701904296875;
    float _241 = _113 * 0.15915493667125701904296875;
    float _243 = _115 * 0.15915493667125701904296875;
    float _245 = _239 * 6.283185482025146484375;
    float _247 = sin(_245);
    float _249 = _133 * 0.15915493667125701904296875;
    float _251 = _135 * 0.15915493667125701904296875;
    float _253 = _131 * 0.15915493667125701904296875;
    float _255 = _239 * 6.283185482025146484375;
    float _257 = cos(_255);
    float _259 = _241 * 6.283185482025146484375;
    float _261 = sin(_259);
    float _263 = _241 * 6.283185482025146484375;
    float _265 = cos(_263);
    float _267 = _243 * 6.283185482025146484375;
    float _269 = sin(_267);
    float _271 = _247 * _261;
    float _273 = _243 * 6.283185482025146484375;
    float _275 = cos(_273);
    float _277 = _249 * 6.283185482025146484375;
    float _279 = cos(_277);
    float _281 = _269 * _257;
    float _283 = _251 * 6.283185482025146484375;
    float _285 = sin(_283);
    float _287 = _257 * _275;
    float _289 = _251 * 6.283185482025146484375;
    float _291 = cos(_289);
    float _293 = _253 * 6.283185482025146484375;
    float _295 = cos(_293);
    float _297 = _249 * 6.283185482025146484375;
    float _299 = sin(_297);
    float _301 = _253 * 6.283185482025146484375;
    float _303 = sin(_301);
    float _305 = _257 * _265;
    float _307 = _247 * _269;
    float _309 = _265 * _275;
    float _311 = _269 * _265;
    float _313 = _247 * _275;
    float _315 = -_281;
    float _317 = fma(_275, _271, _315);
    float _319 = fma(_269, _271, _287);
    float _321 = fma(_261, _287, _307);
    float _323 = _295 * _291;
    float _325 = _285 * _295;
    float _327 = _295 * _279;
    float _329 = _279 * _291;
    float _331 = _247 * _265;
    float _333 = _285 * _279;
    float _335 = -_313;
    float _337 = fma(_261, _281, _335);
    float _339 = _303 * _299;
    float _341 = _303 * _291;
    float _343 = _329 * _225;
    float _345 = _303 * _285;
    float _347 = -_325;
    float _349 = fma(_291, _339, _347);
    float _351 = fma(_285, _339, _323);
    float _353 = -_341;
    float _355 = fma(_299, _325, _353);
    float _357 = _333 * _225;
    float _359 = fma(_309, _237, _343);
    float _361 = _351 * _225;
    float _363 = fma(_299, _323, _345);
    float _365 = _261 * _237;
    float _367 = fma(_311, _237, _357);
    float _369 = _355 * _225;
    float _371 = _303 * _279;
    float _373 = _349 * _225;
    float _375 = fma(_319, _237, _361);
    float _377 = -_299;
    float _379 = -_365;
    float _381 = fma(_377, _225, _379);
    float _383 = _367 * _367;
    float _385 = _363 * _225;
    float _387 = fma(_337, _237, _369);
    float _389 = _371 * _225;
    float _391 = fma(_317, _237, _373);
    float _393 = _375 * _375;
    float _395 = fma(_359, _359, _383);
    float _397 = fma(_321, _237, _385);
    float _399 = _327 * _225;
    float _401 = _387 * _387;
    float _403 = fma(_331, _237, _389);
    float _405 = fma(_391, _391, _393);
    float _407 = fma(_381, _381, _395);
    float _409 = fma(_305, _237, _399);
    float _411 = fma(_397, _397, _401);
    float _413 = fma(_403, _403, _405);
    float _415 = _151 * _225;
    float _417 = _155 * _225;
    float _419 = fma(_409, _409, _411);
    float _421 = rsqrt(_407);
    float _423 = _153 * _225;
    float _425 = fma(_171, _237, _415);
    float _427 = fma(_175, _237, _417);
    float _429 = _195 * _225;
    float _431 = fma(_173, _237, _423);
    float _433 = rsqrt(_413);
    float _435 = fma(_215, _237, _429);
    float _437 = rsqrt(_419);
    float _439 = _425 * _421;
    float _441 = _359 * _439;
    float _443 = _381 * _439;
    float _445 = _367 * _439;
    float _447 = _431 * _433;
    float _449 = _191 * _225;
    int _451 = _68 * 112;
    float _453 = _375 * _447;
    float _455 = _193 * _225;
    float _457 = _391 * _447;
    float _459 = fma(_211, _237, _449);
    float _461 = _427 * _437;
    float _463 = _403 * _447;
    float _465 = fma(_213, _237, _455);
    float _467 = _403;
    float _469 = _211;
    float _471 = _213;
    float _473 = _215;
    float _475 = _441;
    float _477 = _457;
    float _479 = _459;
    float _481 = _445;
    float _483 = _453;
    float _485 = _465;
    if (!_227)
    {
        _467 = _435;
    }
    float _487 = _467;
    float _489 = _397 * _461;
    float _491 = _387 * _461;
    float _493 = _409 * _461;
    int _495 = _68 * 48;
    float _497 = _489;
    float _499 = _491;
    float _501 = _487;
    if (!_227)
    {
        _469 = _443;
    }
    float _503 = _469;
    float _505 = _503;
    if (!_227)
    {
        _471 = _463;
    }
    float _507 = _471;
    uint _509 = uint(int(uint(_495) >> uint(2)));
    _39[int(_509)] = as_type<uint>(_441);
    int _511 = _495 + 4;
    uint _513 = uint(int(uint(_511) >> uint(2)));
    _39[int(_513)] = as_type<uint>(_457);
    int _515 = _495 + 8;
    uint _517 = uint(int(uint(_515) >> uint(2)));
    _39[int(_517)] = as_type<uint>(_489);
    int _519 = _495 + 12;
    uint _521 = uint(int(uint(_519) >> uint(2)));
    _39[int(_521)] = as_type<uint>(_459);
    int _523 = _495 + 16;
    int _525 = _495 + 32;
    int _527 = _495 + 16;
    uint _529 = uint(int(uint(_527) >> uint(2)));
    _39[int(_529)] = as_type<uint>(_445);
    int _531 = _495 + 20;
    uint _533 = uint(int(uint(_531) >> uint(2)));
    _39[int(_533)] = as_type<uint>(_453);
    int _535 = _495 + 24;
    uint _537 = uint(int(uint(_535) >> uint(2)));
    _39[int(_537)] = as_type<uint>(_491);
    int _539 = _495 + 28;
    uint _541 = uint(int(uint(_539) >> uint(2)));
    _39[int(_541)] = as_type<uint>(_465);
    float _543 = _507;
    if (!_227)
    {
        _473 = _493;
    }
    float _545 = _473;
    int _547 = _495 + 32;
    uint _549 = uint(int(uint(_547) >> uint(2)));
    _39[int(_549)] = as_type<uint>(_443);
    int _551 = _495 + 36;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    _39[int(_553)] = as_type<uint>(_463);
    int _555 = _495 + 40;
    uint _557 = uint(int(uint(_555) >> uint(2)));
    _39[int(_557)] = as_type<uint>(_493);
    int _559 = _495 + 44;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    _39[int(_561)] = as_type<uint>(_435);
    bool _563 = !_227;
    float _565 = _545;
    if (!_563)
    {
        bool _567 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _569 = !_567;
        if (!_569)
        {
            uint _571 = uint(int(uint(_451) >> uint(2)));
            uint _573 = uint(int(uint(int(_571)) >> uint(2)));
            int _575 = int(_571) & 3;
            float _577 = (*spvDescriptorSet0.cp_c6)._m0[int(_573)][_575];
            int _579 = as_type<int>(_577) * 48;
            int _581 = 0;
            bool _583;
            float _679;
            float _681;
            float _685;
            float _699;
            float _705;
            float _707;
            float _711;
            float _719;
            float _731;
            float _733;
            float _735;
            float _737;
            do
            {
                int _585 = _581;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _587 = uint(int(uint(_579) >> uint(2)));
                float _589 = as_type<float>(_39[int(_587)]);
                int _591 = _579 + 4;
                uint _593 = uint(int(uint(_591) >> uint(2)));
                float _595 = as_type<float>(_39[int(_593)]);
                int _597 = _579 + 8;
                uint _599 = uint(int(uint(_597) >> uint(2)));
                float _601 = as_type<float>(_39[int(_599)]);
                int _603 = _579 + 12;
                uint _605 = uint(int(uint(_603) >> uint(2)));
                float _607 = as_type<float>(_39[int(_605)]);
                int _609 = _585 + 1;
                int _611 = _579 + 16;
                uint _613 = uint(int(uint(_611) >> uint(2)));
                float _615 = as_type<float>(_39[int(_613)]);
                int _617 = _579 + 20;
                uint _619 = uint(int(uint(_617) >> uint(2)));
                float _621 = as_type<float>(_39[int(_619)]);
                int _623 = _579 + 24;
                uint _625 = uint(int(uint(_623) >> uint(2)));
                float _627 = as_type<float>(_39[int(_625)]);
                int _629 = _579 + 28;
                uint _631 = uint(int(uint(_629) >> uint(2)));
                float _633 = as_type<float>(_39[int(_631)]);
                bool _635 = uint(_609) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _637 = _579 + 32;
                uint _639 = uint(int(uint(_637) >> uint(2)));
                float _641 = as_type<float>(_39[int(_639)]);
                int _643 = _579 + 36;
                uint _645 = uint(int(uint(_643) >> uint(2)));
                float _647 = as_type<float>(_39[int(_645)]);
                int _649 = _579 + 40;
                uint _651 = uint(int(uint(_649) >> uint(2)));
                float _653 = as_type<float>(_39[int(_651)]);
                int _655 = _579 + 44;
                uint _657 = uint(int(uint(_655) >> uint(2)));
                float _659 = as_type<float>(_39[int(_657)]);
                float _661 = _465 * _595;
                float _663 = _445 * _595;
                float _665 = _453 * _595;
                float _667 = _491 * _595;
                float _669 = fma(_459, _589, _661);
                float _671 = fma(_441, _589, _663);
                float _673 = fma(_457, _589, _665);
                float _675 = fma(_489, _589, _667);
                float _677 = fma(_435, _601, _669);
                _679 = fma(_443, _601, _671);
                _681 = fma(_463, _601, _673);
                float _683 = _445 * _621;
                _685 = _607 + _677;
                float _687 = _465 * _621;
                float _689 = _453 * _621;
                float _691 = _491 * _621;
                float _693 = fma(_441, _615, _683);
                float _695 = fma(_459, _615, _687);
                float _697 = fma(_457, _615, _689);
                _699 = fma(_493, _601, _675);
                float _701 = fma(_489, _615, _691);
                float _703 = fma(_435, _627, _695);
                _705 = fma(_443, _627, _693);
                _707 = fma(_463, _627, _697);
                float _709 = _445 * _647;
                _711 = _633 + _703;
                float _713 = _465 * _647;
                float _715 = _453 * _647;
                float _717 = _491 * _647;
                _719 = fma(_493, _627, _701);
                float _721 = fma(_459, _641, _713);
                float _723 = fma(_441, _641, _709);
                float _725 = fma(_457, _641, _715);
                float _727 = fma(_489, _641, _717);
                float _729 = fma(_435, _653, _721);
                _731 = fma(_443, _653, _723);
                _733 = fma(_463, _653, _725);
                _735 = fma(_493, _653, _727);
                _737 = _659 + _729;
                uint _739 = uint(int(uint(_495) >> uint(2)));
                _39[int(_739)] = as_type<uint>(_679);
                int _741 = _495 + 4;
                uint _743 = uint(int(uint(_741) >> uint(2)));
                _39[int(_743)] = as_type<uint>(_681);
                int _745 = _495 + 8;
                uint _747 = uint(int(uint(_745) >> uint(2)));
                _39[int(_747)] = as_type<uint>(_699);
                int _749 = _495 + 12;
                uint _751 = uint(int(uint(_749) >> uint(2)));
                _39[int(_751)] = as_type<uint>(_685);
                int _753 = _495 + 16;
                uint _755 = uint(int(uint(_753) >> uint(2)));
                _39[int(_755)] = as_type<uint>(_705);
                int _757 = _495 + 20;
                uint _759 = uint(int(uint(_757) >> uint(2)));
                _39[int(_759)] = as_type<uint>(_707);
                int _761 = _495 + 24;
                uint _763 = uint(int(uint(_761) >> uint(2)));
                _39[int(_763)] = as_type<uint>(_719);
                int _765 = _495 + 28;
                uint _767 = uint(int(uint(_765) >> uint(2)));
                _39[int(_767)] = as_type<uint>(_711);
                int _769 = _495 + 32;
                uint _771 = uint(int(uint(_769) >> uint(2)));
                _39[int(_771)] = as_type<uint>(_731);
                int _773 = _495 + 36;
                uint _775 = uint(int(uint(_773) >> uint(2)));
                _39[int(_775)] = as_type<uint>(_733);
                int _777 = _495 + 40;
                uint _779 = uint(int(uint(_777) >> uint(2)));
                _39[int(_779)] = as_type<uint>(_735);
                int _781 = _495 + 44;
                uint _783 = uint(int(uint(_781) >> uint(2)));
                _39[int(_783)] = as_type<uint>(_737);
                _583 = !_635;
                _581 = _609;
            } while (_583);
            _475 = _679;
            _477 = _681;
            _497 = _699;
            _479 = _685;
            _481 = _705;
            _483 = _707;
            _499 = _719;
            _485 = _711;
            _505 = _731;
            _543 = _733;
            _565 = _735;
            _501 = _737;
            _785 = true;
        }
        else
        {
            _475 = 0.0;
            _477 = 0.0;
            _497 = 0.0;
            _479 = 0.0;
            _481 = 0.0;
            _483 = 0.0;
            _499 = 0.0;
            _485 = 0.0;
            _505 = 0.0;
            _543 = 0.0;
            _565 = 0.0;
            _501 = 0.0;
        }
    }
    _785 = false;
    float _787 = _475;
    float _789 = _477;
    float _791 = _497;
    float _793 = _479;
    float _795 = _481;
    float _797 = _483;
    float _799 = _499;
    float _801 = _485;
    float _803 = _505;
    float _805 = _543;
    float _807 = _565;
    float _809 = _501;
    int _811 = _451 + 80;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    uint _815 = uint(int(uint(int(_813)) >> uint(2)));
    int _817 = int(_813) & 3;
    float _819 = (*spvDescriptorSet0.cp_c6)._m0[int(_815)][_817];
    int _821 = int(_813) + 1;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    int _825 = _821 & 3;
    float _827 = (*spvDescriptorSet0.cp_c6)._m0[int(_823)][_825];
    bool _829 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _831 = _451 + 64;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.cp_c6)._m0[int(_835)][_837];
    int _841 = int(_833) + 1;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    int _845 = _841 & 3;
    float _847 = (*spvDescriptorSet0.cp_c6)._m0[int(_843)][_845];
    int _849 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _851 = _849 + _68;
    int _853 = _451 + 88;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    uint _857 = uint(int(uint(int(_855)) >> uint(2)));
    int _859 = int(_855) & 3;
    float _861 = (*spvDescriptorSet0.cp_c6)._m0[int(_857)][_859];
    int _863 = int(_855) + 1;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    int _867 = _863 & 3;
    float _869 = (*spvDescriptorSet0.cp_c6)._m0[int(_865)][_867];
    int _871 = _451 + 72;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    uint _875 = uint(int(uint(int(_873)) >> uint(2)));
    int _877 = int(_873) & 3;
    float _879 = (*spvDescriptorSet0.cp_c6)._m0[int(_875)][_877];
    int _881 = int(_873) + 1;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    int _885 = _881 & 3;
    float _887 = (*spvDescriptorSet0.cp_c6)._m0[int(_883)][_885];
    int _889 = _451 + 96;
    uint _891 = uint(int(uint(_889) >> uint(2)));
    uint _893 = uint(int(uint(int(_891)) >> uint(2)));
    int _895 = int(_891) & 3;
    float _897 = (*spvDescriptorSet0.cp_c6)._m0[int(_893)][_895];
    int _899 = int(_891) + 1;
    uint _901 = uint(int(uint(_899) >> uint(2)));
    int _903 = _899 & 3;
    float _905 = (*spvDescriptorSet0.cp_c6)._m0[int(_901)][_903];
    int _907 = _451 + 104;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.cp_c6)._m0[int(_911)][_913];
    int _917 = int(_909) + 1;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    int _921 = _917 & 3;
    float _923 = (*spvDescriptorSet0.cp_c6)._m0[int(_919)][_921];
    int _925 = _451 + 16;
    uint _927 = uint(int(uint(_925) >> uint(2)));
    uint _929 = uint(int(uint(int(_927)) >> uint(2)));
    int _931 = int(_927) & 3;
    float _933 = (*spvDescriptorSet0.cp_c6)._m0[int(_929)][_931];
    int _935 = int(_927) + 1;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    int _939 = _935 & 3;
    float _941 = (*spvDescriptorSet0.cp_c6)._m0[int(_937)][_939];
    if (!_829)
    {
        uint _943 = uint(int(uint(_495) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_943)] = as_type<uint>(_787);
        int _945 = _495 + 4;
        uint _947 = uint(int(uint(_945) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_947)] = as_type<uint>(_789);
        int _949 = _495 + 8;
        uint _951 = uint(int(uint(_949) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_951)] = as_type<uint>(_791);
        int _953 = _495 + 12;
        uint _955 = uint(int(uint(_953) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_955)] = as_type<uint>(_793);
        uint _957 = uint(int(uint(_523) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_957)] = as_type<uint>(_795);
        int _959 = _523 + 4;
        uint _961 = uint(int(uint(_959) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_961)] = as_type<uint>(_797);
        int _963 = _523 + 8;
        uint _965 = uint(int(uint(_963) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_965)] = as_type<uint>(_799);
        int _967 = _523 + 12;
        uint _969 = uint(int(uint(_967) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_969)] = as_type<uint>(_801);
        uint _971 = uint(int(uint(_525) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_971)] = as_type<uint>(_803);
        int _973 = _525 + 4;
        uint _975 = uint(int(uint(_973) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_975)] = as_type<uint>(_805);
        int _977 = _525 + 8;
        uint _979 = uint(int(uint(_977) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_979)] = as_type<uint>(_807);
        int _981 = _525 + 12;
        uint _983 = uint(int(uint(_981) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_983)] = as_type<uint>(_809);
    }
    float _985 = _797 * _819;
    float _987 = _805 * _819;
    int _989 = _451 + 32;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.cp_c6)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.cp_c6)._m0[int(_1001)][_1003];
    float _1007 = _789 * _869;
    float _1009 = fma(_795, _839, _985);
    float _1011 = fma(_803, _839, _987);
    float _1013 = _789 * _827;
    float _1015 = _797 * _827;
    float _1017 = _805 * _827;
    float _1019 = _789 * _819;
    int _1021 = _451 + 48;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    uint _1025 = uint(int(uint(int(_1023)) >> uint(2)));
    int _1027 = int(_1023) & 3;
    float _1029 = (*spvDescriptorSet0.cp_c6)._m0[int(_1025)][_1027];
    int _1031 = int(_1023) + 1;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    int _1035 = _1031 & 3;
    float _1037 = (*spvDescriptorSet0.cp_c6)._m0[int(_1033)][_1035];
    float _1039 = fma(_787, _847, _1013);
    float _1041 = fma(_795, _847, _1015);
    float _1043 = fma(_803, _847, _1017);
    float _1045 = _797 * _861;
    float _1047 = _805 * _861;
    float _1049 = _789 * _861;
    float _1051 = _797 * _869;
    float _1053 = _805 * _869;
    int _1055 = _451 + 24;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    uint _1059 = uint(int(uint(int(_1057)) >> uint(2)));
    int _1061 = int(_1057) & 3;
    float _1063 = (*spvDescriptorSet0.cp_c6)._m0[int(_1059)][_1061];
    int _1065 = int(_1057) + 1;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    int _1069 = _1065 & 3;
    float _1071 = (*spvDescriptorSet0.cp_c6)._m0[int(_1067)][_1069];
    float _1073 = fma(_787, _879, _1049);
    float _1075 = fma(_787, _887, _1007);
    float _1077 = fma(_795, _879, _1045);
    float _1079 = fma(_795, _887, _1051);
    float _1081 = fma(_803, _879, _1047);
    float _1083 = fma(_803, _887, _1053);
    float _1085 = fma(_787, _839, _1019);
    int _1087 = _451 + 40;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    uint _1091 = uint(int(uint(int(_1089)) >> uint(2)));
    int _1093 = int(_1089) & 3;
    float _1095 = (*spvDescriptorSet0.cp_c6)._m0[int(_1091)][_1093];
    int _1097 = int(_1089) + 1;
    uint _1099 = uint(int(uint(_1097) >> uint(2)));
    int _1101 = _1097 & 3;
    float _1103 = (*spvDescriptorSet0.cp_c6)._m0[int(_1099)][_1101];
    float _1105 = fma(_791, _905, _1039);
    float _1107 = fma(_791, _915, _1073);
    float _1109 = fma(_791, _897, _1085);
    float _1111 = fma(_791, _923, _1075);
    float _1113 = fma(_799, _897, _1009);
    float _1115 = fma(_799, _905, _1041);
    float _1117 = fma(_799, _915, _1077);
    int _1119 = _451 + 56;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.cp_c6)._m0[int(_1123)][_1125];
    int _1129 = int(_1121) + 1;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    int _1133 = _1129 & 3;
    float _1135 = (*spvDescriptorSet0.cp_c6)._m0[int(_1131)][_1133];
    float _1137 = fma(_799, _923, _1079);
    float _1139 = fma(_807, _923, _1083);
    float _1141 = _1111 + _793;
    float _1143 = fma(_807, _905, _1043);
    float _1145 = _1137 + _801;
    float _1147 = fma(_807, _897, _1011);
    float _1149 = fma(_807, _915, _1081);
    float _1151 = _1139 + _809;
    float _1153 = _1145 * _941;
    float _1155 = _1115 * _941;
    float _1157 = _1113 * _941;
    float _1159 = _1117 * _941;
    float _1161 = fma(_1141, _933, _1153);
    float _1163 = fma(_1105, _933, _1155);
    float _1165 = _1145 * _1005;
    float _1167 = _1115 * _1005;
    float _1169 = _1113 * _1005;
    float _1171 = _1117 * _1005;
    float _1173 = fma(_1141, _997, _1165);
    int _1175 = _851 * 48;
    float _1177 = fma(_1109, _933, _1157);
    float _1179 = fma(_1107, _933, _1159);
    float _1181 = _1145 * _1037;
    float _1183 = _1115 * _1037;
    float _1185 = _1113 * _1037;
    float _1187 = _1117 * _1037;
    float _1189 = fma(_1141, _1029, _1181);
    float _1191 = fma(_1109, _997, _1169);
    float _1193 = fma(_1105, _997, _1167);
    float _1195 = fma(_1105, _1029, _1183);
    float _1197 = fma(_1107, _997, _1171);
    float _1199 = fma(_1151, _1063, _1161);
    float _1201 = fma(_1109, _1029, _1185);
    float _1203 = fma(_1107, _1029, _1187);
    float _1205 = fma(_1143, _1063, _1163);
    float _1207 = fma(_1147, _1063, _1177);
    float _1209 = fma(_1149, _1063, _1179);
    float _1211 = _1199 + _1071;
    int _1213 = _1175 + 16;
    float _1215 = fma(_1151, _1095, _1173);
    float _1217 = fma(_1147, _1095, _1191);
    float _1219 = fma(_1143, _1095, _1193);
    float _1221 = fma(_1149, _1095, _1197);
    float _1223 = _1215 + _1103;
    uint _1225 = uint(int(uint(_1213) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1225)] = as_type<uint>(_1207);
    int _1227 = _1213 + 4;
    uint _1229 = uint(int(uint(_1227) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1229)] = as_type<uint>(_1205);
    int _1231 = _1213 + 8;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1233)] = as_type<uint>(_1209);
    int _1235 = _1213 + 12;
    uint _1237 = uint(int(uint(_1235) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1237)] = as_type<uint>(_1211);
    float _1239 = fma(_1151, _1127, _1189);
    float _1241 = fma(_1143, _1127, _1195);
    int _1243 = _1175 + 32;
    float _1245 = fma(_1147, _1127, _1201);
    float _1247 = fma(_1149, _1127, _1203);
    float _1249 = _1239 + _1135;
    int _1251 = _1175 + 48;
    uint _1253 = uint(int(uint(_1243) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1253)] = as_type<uint>(_1217);
    int _1255 = _1243 + 4;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1257)] = as_type<uint>(_1219);
    int _1259 = _1243 + 8;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1261)] = as_type<uint>(_1221);
    int _1263 = _1243 + 12;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1265)] = as_type<uint>(_1223);
    uint _1267 = uint(int(uint(_1251) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1267)] = as_type<uint>(_1245);
    int _1269 = _1251 + 4;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1271)] = as_type<uint>(_1241);
    int _1273 = _1251 + 8;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1275)] = as_type<uint>(_1247);
    int _1277 = _1251 + 12;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1279)] = as_type<uint>(_1249);
}

