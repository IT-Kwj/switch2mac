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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3230, thread const int& _3231, constant _10& support_buffer)
{
    int _3234 = 1 + _3231;
    float _3236 = support_buffer._m5[_3234].x;
    bool _3238 = _3236 == 1.0;
    if (_3238)
    {
        return _3230;
    }
    float _3240 = float(_3230);
    float _3242 = _3240 * _3236;
    int _3244 = int(_3242);
    return _3244;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _791 = false;
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
    int _83 = _72 + 8;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    uint _87 = uint(int(uint(int(_85)) >> uint(2)));
    int _89 = int(_85) & 3;
    float _91 = (*spvDescriptorSet0.cp_c5)._m0[int(_87)][_89];
    int _93 = _66;
    int _95 = 0;
    int _97 = _56(_93, _95, (*spvDescriptorSet0.support_buffer));
    int _99 = as_type<int>(_81);
    int _101 = 0;
    int _103 = _56(_99, _101, (*spvDescriptorSet0.support_buffer));
    int3 _1319 = int3(_97, _103, 1);
    float3 _107 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1319.xy), uint(_1319.z), 0).xyz;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    int _115 = _66;
    int _117 = 1;
    int _119 = _56(_115, _117, (*spvDescriptorSet0.support_buffer));
    int _121 = as_type<int>(_91);
    int _123 = 1;
    int _125 = _56(_121, _123, (*spvDescriptorSet0.support_buffer));
    int3 _1337 = int3(_119, _125, 1);
    float3 _127 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1337.xy), uint(_1337.z), 0).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    int _135 = _66;
    int _137 = 1;
    int _139 = _56(_135, _137, (*spvDescriptorSet0.support_buffer));
    int _141 = as_type<int>(_91);
    int _143 = 1;
    int _145 = _56(_141, _143, (*spvDescriptorSet0.support_buffer));
    int3 _1355 = int3(_139, _145, 0);
    float3 _147 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1355.xy), uint(_1355.z), 0).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    int _155 = _66;
    int _157 = 0;
    int _159 = _56(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = as_type<int>(_81);
    int _163 = 0;
    int _165 = _56(_161, _163, (*spvDescriptorSet0.support_buffer));
    int3 _1373 = int3(_159, _165, 0);
    float3 _167 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1373.xy), uint(_1373.z), 0).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    int _175 = _66;
    int _177 = 1;
    int _179 = _56(_175, _177, (*spvDescriptorSet0.support_buffer));
    int _181 = as_type<int>(_91);
    int _183 = 1;
    int _185 = _56(_181, _183, (*spvDescriptorSet0.support_buffer));
    int3 _1391 = int3(_179, _185, 2);
    float3 _187 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1391.xy), uint(_1391.z), 0).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    int _195 = _66;
    int _197 = 0;
    int _199 = _56(_195, _197, (*spvDescriptorSet0.support_buffer));
    int _201 = as_type<int>(_81);
    int _203 = 0;
    int _205 = _56(_201, _203, (*spvDescriptorSet0.support_buffer));
    int3 _1409 = int3(_199, _205, 2);
    float3 _207 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1409.xy), uint(_1409.z), 0).xyz;
    float _209 = _207.x;
    float _211 = _207.y;
    float _213 = _207.z;
    int _215 = _72 + 20;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    uint _219 = uint(int(uint(int(_217)) >> uint(2)));
    int _221 = int(_217) & 3;
    float _223 = (*spvDescriptorSet0.cp_c5)._m0[int(_219)][_221];
    bool _225 = _66 != 0;
    int _227 = _72 + 28;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    uint _231 = uint(int(uint(int(_229)) >> uint(2)));
    int _233 = int(_229) & 3;
    float _235 = (*spvDescriptorSet0.cp_c5)._m0[int(_231)][_233];
    float _237 = _109 * 0.15915493667125701904296875;
    float _239 = _111 * 0.15915493667125701904296875;
    float _241 = _113 * 0.15915493667125701904296875;
    float _243 = _237 * 6.283185482025146484375;
    float _245 = cos(_243);
    float _247 = _131 * 0.15915493667125701904296875;
    float _249 = _133 * 0.15915493667125701904296875;
    float _251 = _129 * 0.15915493667125701904296875;
    float _253 = _193 * _235;
    float _255 = _239 * 6.283185482025146484375;
    float _257 = cos(_255);
    float _259 = _241 * 6.283185482025146484375;
    float _261 = sin(_259);
    float _263 = _241 * 6.283185482025146484375;
    float _265 = cos(_263);
    float _267 = _237 * 6.283185482025146484375;
    float _269 = sin(_267);
    float _271 = _239 * 6.283185482025146484375;
    float _273 = sin(_271);
    float _275 = _245 * _265;
    float _277 = _261 * _245;
    float _279 = _257 * _265;
    float _281 = _247 * 6.283185482025146484375;
    float _283 = sin(_281);
    float _285 = _245 * _257;
    float _287 = _269 * _261;
    float _289 = _247 * 6.283185482025146484375;
    float _291 = cos(_289);
    float _293 = _269 * _273;
    float _295 = fma(_273, _275, _287);
    float _297 = _249 * 6.283185482025146484375;
    float _299 = sin(_297);
    float _301 = _261 * _257;
    float _303 = _269 * _257;
    float _305 = fma(_261, _293, _275);
    float _307 = _249 * 6.283185482025146484375;
    float _309 = cos(_307);
    float _311 = _251 * 6.283185482025146484375;
    float _313 = cos(_311);
    float _315 = _269 * _265;
    float _317 = -_277;
    float _319 = fma(_265, _293, _317);
    float _321 = -_315;
    float _323 = fma(_273, _277, _321);
    float _325 = _299 * _291;
    float _327 = _251 * 6.283185482025146484375;
    float _329 = sin(_327);
    float _331 = _291 * _309;
    float _333 = _325 * _235;
    float _335 = fma(_213, _223, _253);
    float _337 = _331 * _235;
    float _339 = fma(_301, _223, _333);
    float _341 = _313 * _309;
    float _343 = _299 * _313;
    float _345 = _313 * _291;
    float _347 = fma(_279, _223, _337);
    float _349 = _329 * _283;
    float _351 = _329 * _299;
    float _353 = _329 * _309;
    float _355 = _329 * _291;
    float _357 = -_343;
    float _359 = fma(_309, _349, _357);
    float _361 = fma(_299, _349, _341);
    float _363 = fma(_283, _341, _351);
    float _365 = _273 * _223;
    float _367 = -_353;
    float _369 = fma(_283, _343, _367);
    float _371 = _361 * _235;
    float _373 = _355 * _235;
    float _375 = -_283;
    float _377 = -_365;
    float _379 = fma(_375, _235, _377);
    float _381 = _359 * _235;
    float _383 = _363 * _235;
    float _385 = fma(_305, _223, _371);
    float _387 = fma(_303, _223, _373);
    float _389 = fma(_319, _223, _381);
    float _391 = _369 * _235;
    float _393 = _339 * _339;
    float _395 = fma(_295, _223, _383);
    float _397 = _385 * _385;
    float _399 = fma(_323, _223, _391);
    float _401 = _345 * _235;
    float _403 = fma(_347, _347, _393);
    float _405 = fma(_389, _389, _397);
    float _407 = _399 * _399;
    float _409 = fma(_285, _223, _401);
    float _411 = fma(_379, _379, _403);
    float _413 = fma(_387, _387, _405);
    float _415 = fma(_395, _395, _407);
    float _417 = _149 * _235;
    float _419 = _151 * _235;
    float _421 = _153 * _235;
    float _423 = fma(_409, _409, _415);
    float _425 = rsqrt(_411);
    float _427 = fma(_169, _223, _417);
    float _429 = fma(_171, _223, _419);
    float _431 = fma(_173, _223, _421);
    int _433 = _66 * 112;
    float _435 = rsqrt(_413);
    float _437 = rsqrt(_423);
    float _439 = _427 * _425;
    float _441 = _347 * _439;
    float _443 = _339 * _439;
    float _445 = _429 * _435;
    float _447 = _189 * _235;
    float _449 = _379 * _439;
    float _451 = _385 * _445;
    float _453 = _389 * _445;
    float _455 = _387 * _445;
    float _457 = fma(_209, _223, _447);
    float _459 = _431 * _437;
    float _461 = _389;
    float _463 = _209;
    float _465 = _211;
    float _467 = _409;
    float _469 = _395;
    float _471 = _445;
    float _473 = _455;
    float _475 = _451;
    if (!_225)
    {
        _461 = _441;
    }
    float _477 = _461;
    float _479 = _477;
    if (!_225)
    {
        _463 = _443;
    }
    float _481 = _463;
    float _483 = _399 * _459;
    float _485 = _191 * _235;
    float _487 = _395 * _459;
    float _489 = _409 * _459;
    int _491 = _66 * 48;
    float _493 = fma(_211, _223, _485);
    float _495 = _485;
    float _497 = _481;
    float _499 = _483;
    float _501 = _487;
    float _503 = _489;
    if (!_225)
    {
        _465 = _457;
    }
    float _505 = _465;
    float _507 = _505;
    if (!_225)
    {
        _495 = _335;
    }
    float _509 = _495;
    uint _511 = uint(int(uint(_491) >> uint(2)));
    _37[int(_511)] = as_type<uint>(_441);
    int _513 = _491 + 4;
    uint _515 = uint(int(uint(_513) >> uint(2)));
    _37[int(_515)] = as_type<uint>(_453);
    int _517 = _491 + 8;
    uint _519 = uint(int(uint(_517) >> uint(2)));
    _37[int(_519)] = as_type<uint>(_487);
    int _521 = _491 + 12;
    uint _523 = uint(int(uint(_521) >> uint(2)));
    _37[int(_523)] = as_type<uint>(_457);
    float _525 = _509;
    if (!_225)
    {
        _467 = _493;
    }
    float _527 = _467;
    float _529 = _527;
    if (!_225)
    {
        _469 = _449;
    }
    float _531 = _469;
    int _533 = _491 + 16;
    uint _535 = uint(int(uint(_533) >> uint(2)));
    _37[int(_535)] = as_type<uint>(_443);
    int _537 = _491 + 20;
    uint _539 = uint(int(uint(_537) >> uint(2)));
    _37[int(_539)] = as_type<uint>(_451);
    int _541 = _491 + 24;
    uint _543 = uint(int(uint(_541) >> uint(2)));
    _37[int(_543)] = as_type<uint>(_483);
    int _545 = _491 + 28;
    uint _547 = uint(int(uint(_545) >> uint(2)));
    _37[int(_547)] = as_type<uint>(_493);
    float _549 = _531;
    if (!_225)
    {
        _471 = _453;
    }
    float _551 = _471;
    int _553 = _491 + 32;
    uint _555 = uint(int(uint(_553) >> uint(2)));
    _37[int(_555)] = as_type<uint>(_449);
    int _557 = _491 + 36;
    uint _559 = uint(int(uint(_557) >> uint(2)));
    _37[int(_559)] = as_type<uint>(_455);
    int _561 = _491 + 40;
    uint _563 = uint(int(uint(_561) >> uint(2)));
    _37[int(_563)] = as_type<uint>(_489);
    int _565 = _491 + 44;
    uint _567 = uint(int(uint(_565) >> uint(2)));
    _37[int(_567)] = as_type<uint>(_335);
    bool _569 = !_225;
    float _571 = _551;
    if (!_569)
    {
        bool _573 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _575 = !_573;
        if (!_575)
        {
            uint _577 = uint(int(uint(_433) >> uint(2)));
            uint _579 = uint(int(uint(int(_577)) >> uint(2)));
            int _581 = int(_577) & 3;
            float _583 = (*spvDescriptorSet0.cp_c6)._m0[int(_579)][_581];
            int _585 = as_type<int>(_583) * 48;
            int _587 = 0;
            bool _589;
            float _685;
            float _687;
            float _689;
            float _693;
            float _711;
            float _713;
            float _715;
            float _727;
            float _737;
            float _739;
            float _741;
            float _743;
            do
            {
                int _591 = _587;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _593 = uint(int(uint(_585) >> uint(2)));
                float _595 = as_type<float>(_37[int(_593)]);
                int _597 = _585 + 4;
                uint _599 = uint(int(uint(_597) >> uint(2)));
                float _601 = as_type<float>(_37[int(_599)]);
                int _603 = _585 + 8;
                uint _605 = uint(int(uint(_603) >> uint(2)));
                float _607 = as_type<float>(_37[int(_605)]);
                int _609 = _585 + 12;
                uint _611 = uint(int(uint(_609) >> uint(2)));
                float _613 = as_type<float>(_37[int(_611)]);
                int _615 = _591 + 1;
                int _617 = _585 + 16;
                uint _619 = uint(int(uint(_617) >> uint(2)));
                float _621 = as_type<float>(_37[int(_619)]);
                int _623 = _585 + 20;
                uint _625 = uint(int(uint(_623) >> uint(2)));
                float _627 = as_type<float>(_37[int(_625)]);
                int _629 = _585 + 24;
                uint _631 = uint(int(uint(_629) >> uint(2)));
                float _633 = as_type<float>(_37[int(_631)]);
                int _635 = _585 + 28;
                uint _637 = uint(int(uint(_635) >> uint(2)));
                float _639 = as_type<float>(_37[int(_637)]);
                bool _641 = uint(_615) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _643 = _585 + 32;
                uint _645 = uint(int(uint(_643) >> uint(2)));
                float _647 = as_type<float>(_37[int(_645)]);
                int _649 = _585 + 36;
                uint _651 = uint(int(uint(_649) >> uint(2)));
                float _653 = as_type<float>(_37[int(_651)]);
                int _655 = _585 + 40;
                uint _657 = uint(int(uint(_655) >> uint(2)));
                float _659 = as_type<float>(_37[int(_657)]);
                int _661 = _585 + 44;
                uint _663 = uint(int(uint(_661) >> uint(2)));
                float _665 = as_type<float>(_37[int(_663)]);
                float _667 = _493 * _601;
                float _669 = _443 * _601;
                float _671 = _451 * _601;
                float _673 = _483 * _601;
                float _675 = fma(_457, _595, _667);
                float _677 = fma(_441, _595, _669);
                float _679 = fma(_453, _595, _671);
                float _681 = fma(_487, _595, _673);
                float _683 = fma(_335, _607, _675);
                _685 = fma(_449, _607, _677);
                _687 = fma(_455, _607, _679);
                _689 = fma(_489, _607, _681);
                float _691 = _493 * _627;
                _693 = _613 + _683;
                float _695 = _443 * _627;
                float _697 = _451 * _627;
                float _699 = fma(_457, _621, _691);
                float _701 = _483 * _627;
                float _703 = fma(_441, _621, _695);
                float _705 = fma(_453, _621, _697);
                float _707 = fma(_335, _633, _699);
                float _709 = fma(_487, _621, _701);
                _711 = fma(_449, _633, _703);
                _713 = fma(_455, _633, _705);
                _715 = _639 + _707;
                float _717 = _493 * _653;
                float _719 = _443 * _653;
                float _721 = _451 * _653;
                float _723 = _483 * _653;
                float _725 = fma(_457, _647, _717);
                _727 = fma(_489, _633, _709);
                float _729 = fma(_441, _647, _719);
                float _731 = fma(_453, _647, _721);
                float _733 = fma(_487, _647, _723);
                float _735 = fma(_335, _659, _725);
                _737 = fma(_449, _659, _729);
                _739 = fma(_455, _659, _731);
                _741 = fma(_489, _659, _733);
                _743 = _665 + _735;
                uint _745 = uint(int(uint(_491) >> uint(2)));
                _37[int(_745)] = as_type<uint>(_685);
                int _747 = _491 + 4;
                uint _749 = uint(int(uint(_747) >> uint(2)));
                _37[int(_749)] = as_type<uint>(_687);
                int _751 = _491 + 8;
                uint _753 = uint(int(uint(_751) >> uint(2)));
                _37[int(_753)] = as_type<uint>(_689);
                int _755 = _491 + 12;
                uint _757 = uint(int(uint(_755) >> uint(2)));
                _37[int(_757)] = as_type<uint>(_693);
                int _759 = _491 + 16;
                uint _761 = uint(int(uint(_759) >> uint(2)));
                _37[int(_761)] = as_type<uint>(_711);
                int _763 = _491 + 20;
                uint _765 = uint(int(uint(_763) >> uint(2)));
                _37[int(_765)] = as_type<uint>(_713);
                int _767 = _491 + 24;
                uint _769 = uint(int(uint(_767) >> uint(2)));
                _37[int(_769)] = as_type<uint>(_727);
                int _771 = _491 + 28;
                uint _773 = uint(int(uint(_771) >> uint(2)));
                _37[int(_773)] = as_type<uint>(_715);
                int _775 = _491 + 32;
                uint _777 = uint(int(uint(_775) >> uint(2)));
                _37[int(_777)] = as_type<uint>(_737);
                int _779 = _491 + 36;
                uint _781 = uint(int(uint(_779) >> uint(2)));
                _37[int(_781)] = as_type<uint>(_739);
                int _783 = _491 + 40;
                uint _785 = uint(int(uint(_783) >> uint(2)));
                _37[int(_785)] = as_type<uint>(_741);
                int _787 = _491 + 44;
                uint _789 = uint(int(uint(_787) >> uint(2)));
                _37[int(_789)] = as_type<uint>(_743);
                _589 = !_641;
                _587 = _615;
            } while (_589);
            _571 = _687;
            _473 = _739;
            _475 = _713;
            _479 = _685;
            _549 = _737;
            _497 = _711;
            _499 = _727;
            _501 = _689;
            _503 = _741;
            _507 = _693;
            _529 = _715;
            _525 = _743;
            _791 = true;
        }
        else
        {
            _571 = 0.0;
            _473 = 0.0;
            _475 = 0.0;
            _479 = 0.0;
            _549 = 0.0;
            _497 = 0.0;
            _499 = 0.0;
            _501 = 0.0;
            _503 = 0.0;
            _507 = 0.0;
            _529 = 0.0;
            _525 = 0.0;
        }
    }
    _791 = false;
    float _793 = _571;
    float _795 = _473;
    float _797 = _475;
    float _799 = _479;
    float _801 = _549;
    float _803 = _497;
    float _805 = _499;
    float _807 = _501;
    float _809 = _503;
    float _811 = _507;
    float _813 = _529;
    float _815 = _525;
    int _817 = _433 + 80;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    uint _821 = uint(int(uint(int(_819)) >> uint(2)));
    int _823 = int(_819) & 3;
    float _825 = (*spvDescriptorSet0.cp_c6)._m0[int(_821)][_823];
    int _827 = int(_819) + 1;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    int _831 = _827 & 3;
    float _833 = (*spvDescriptorSet0.cp_c6)._m0[int(_829)][_831];
    int _835 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _837 = _835 + _66;
    int _839 = _433 + 64;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
    int _845 = int(_841) & 3;
    float _847 = (*spvDescriptorSet0.cp_c6)._m0[int(_843)][_845];
    int _849 = int(_841) + 1;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    int _853 = _849 & 3;
    float _855 = (*spvDescriptorSet0.cp_c6)._m0[int(_851)][_853];
    int _857 = _837 * 48;
    int _859 = _433 + 88;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    uint _863 = uint(int(uint(int(_861)) >> uint(2)));
    int _865 = int(_861) & 3;
    float _867 = (*spvDescriptorSet0.cp_c6)._m0[int(_863)][_865];
    int _869 = int(_861) + 1;
    uint _871 = uint(int(uint(_869) >> uint(2)));
    int _873 = _869 & 3;
    float _875 = (*spvDescriptorSet0.cp_c6)._m0[int(_871)][_873];
    int _877 = _433 + 72;
    uint _879 = uint(int(uint(_877) >> uint(2)));
    uint _881 = uint(int(uint(int(_879)) >> uint(2)));
    int _883 = int(_879) & 3;
    float _885 = (*spvDescriptorSet0.cp_c6)._m0[int(_881)][_883];
    int _887 = int(_879) + 1;
    uint _889 = uint(int(uint(_887) >> uint(2)));
    int _891 = _887 & 3;
    float _893 = (*spvDescriptorSet0.cp_c6)._m0[int(_889)][_891];
    int _895 = _433 + 96;
    uint _897 = uint(int(uint(_895) >> uint(2)));
    uint _899 = uint(int(uint(int(_897)) >> uint(2)));
    int _901 = int(_897) & 3;
    float _903 = (*spvDescriptorSet0.cp_c6)._m0[int(_899)][_901];
    int _905 = int(_897) + 1;
    uint _907 = uint(int(uint(_905) >> uint(2)));
    int _909 = _905 & 3;
    float _911 = (*spvDescriptorSet0.cp_c6)._m0[int(_907)][_909];
    int _913 = _433 + 104;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.cp_c6)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
    float _931 = _793 * _825;
    float _933 = _795 * _825;
    float _935 = _795 * _833;
    int _937 = _433 + 16;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    uint _941 = uint(int(uint(int(_939)) >> uint(2)));
    int _943 = int(_939) & 3;
    float _945 = (*spvDescriptorSet0.cp_c6)._m0[int(_941)][_943];
    int _947 = int(_939) + 1;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    int _951 = _947 & 3;
    float _953 = (*spvDescriptorSet0.cp_c6)._m0[int(_949)][_951];
    float _955 = _797 * _825;
    float _957 = fma(_799, _847, _931);
    float _959 = fma(_801, _847, _933);
    float _961 = _793 * _833;
    int _963 = _433 + 32;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.cp_c6)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.cp_c6)._m0[int(_975)][_977];
    float _981 = _797 * _833;
    float _983 = fma(_801, _855, _935);
    float _985 = fma(_803, _847, _955);
    float _987 = fma(_799, _855, _961);
    float _989 = _793 * _867;
    float _991 = _797 * _867;
    float _993 = _795 * _867;
    int _995 = _433 + 48;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    uint _999 = uint(int(uint(int(_997)) >> uint(2)));
    int _1001 = int(_997) & 3;
    float _1003 = (*spvDescriptorSet0.cp_c6)._m0[int(_999)][_1001];
    int _1005 = int(_997) + 1;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    int _1009 = _1005 & 3;
    float _1011 = (*spvDescriptorSet0.cp_c6)._m0[int(_1007)][_1009];
    float _1013 = _793 * _875;
    float _1015 = _797 * _875;
    float _1017 = _795 * _875;
    float _1019 = fma(_803, _855, _981);
    float _1021 = fma(_799, _885, _989);
    float _1023 = fma(_799, _893, _1013);
    float _1025 = fma(_803, _885, _991);
    int _1027 = _433 + 24;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    uint _1031 = uint(int(uint(int(_1029)) >> uint(2)));
    int _1033 = int(_1029) & 3;
    float _1035 = (*spvDescriptorSet0.cp_c6)._m0[int(_1031)][_1033];
    int _1037 = int(_1029) + 1;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    int _1041 = _1037 & 3;
    float _1043 = (*spvDescriptorSet0.cp_c6)._m0[int(_1039)][_1041];
    float _1045 = fma(_803, _893, _1015);
    float _1047 = fma(_801, _885, _993);
    float _1049 = fma(_801, _893, _1017);
    float _1051 = fma(_805, _903, _985);
    float _1053 = fma(_807, _903, _957);
    float _1055 = fma(_807, _911, _987);
    int _1057 = _433 + 40;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    uint _1061 = uint(int(uint(int(_1059)) >> uint(2)));
    int _1063 = int(_1059) & 3;
    float _1065 = (*spvDescriptorSet0.cp_c6)._m0[int(_1061)][_1063];
    int _1067 = int(_1059) + 1;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    int _1071 = _1067 & 3;
    float _1073 = (*spvDescriptorSet0.cp_c6)._m0[int(_1069)][_1071];
    float _1075 = fma(_805, _911, _1019);
    float _1077 = fma(_809, _903, _959);
    float _1079 = fma(_809, _911, _983);
    float _1081 = fma(_807, _921, _1021);
    float _1083 = fma(_807, _929, _1023);
    float _1085 = fma(_805, _921, _1025);
    int _1087 = _433 + 56;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    uint _1091 = uint(int(uint(int(_1089)) >> uint(2)));
    int _1093 = int(_1089) & 3;
    float _1095 = (*spvDescriptorSet0.cp_c6)._m0[int(_1091)][_1093];
    int _1097 = int(_1089) + 1;
    uint _1099 = uint(int(uint(_1097) >> uint(2)));
    int _1101 = _1097 & 3;
    float _1103 = (*spvDescriptorSet0.cp_c6)._m0[int(_1099)][_1101];
    float _1105 = fma(_805, _929, _1045);
    float _1107 = fma(_809, _929, _1049);
    float _1109 = fma(_809, _921, _1047);
    float _1111 = _1083 + _811;
    float _1113 = _1105 + _813;
    float _1115 = _1107 + _815;
    int _1117 = _857 + 32;
    float _1119 = _1075 * _953;
    float _1121 = _1113 * _953;
    float _1123 = _1051 * _953;
    float _1125 = _1085 * _953;
    float _1127 = fma(_1055, _945, _1119);
    float _1129 = fma(_1111, _945, _1121);
    float _1131 = fma(_1053, _945, _1123);
    float _1133 = fma(_1081, _945, _1125);
    float _1135 = _1113 * _979;
    float _1137 = _1075 * _979;
    float _1139 = _1051 * _979;
    float _1141 = _1085 * _979;
    float _1143 = fma(_1111, _971, _1135);
    float _1145 = fma(_1055, _971, _1137);
    float _1147 = fma(_1053, _971, _1139);
    float _1149 = fma(_1081, _971, _1141);
    float _1151 = _1113 * _1011;
    float _1153 = _1051 * _1011;
    float _1155 = _1075 * _1011;
    float _1157 = _1085 * _1011;
    float _1159 = fma(_1111, _1003, _1151);
    float _1161 = fma(_1053, _1003, _1153);
    float _1163 = fma(_1055, _1003, _1155);
    float _1165 = fma(_1081, _1003, _1157);
    float _1167 = fma(_1115, _1035, _1129);
    float _1169 = fma(_1079, _1035, _1127);
    float _1171 = fma(_1077, _1035, _1131);
    float _1173 = fma(_1109, _1035, _1133);
    float _1175 = _1167 + _1043;
    int _1177 = _857 + 16;
    int _1179 = _857 + 48;
    float _1181 = fma(_1115, _1065, _1143);
    float _1183 = fma(_1079, _1065, _1145);
    float _1185 = fma(_1077, _1065, _1147);
    float _1187 = fma(_1109, _1065, _1149);
    float _1189 = _1181 + _1073;
    uint _1191 = uint(int(uint(_1177) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1191)] = as_type<uint>(_1171);
    int _1193 = _1177 + 4;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1195)] = as_type<uint>(_1169);
    int _1197 = _1177 + 8;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1199)] = as_type<uint>(_1173);
    int _1201 = _1177 + 12;
    uint _1203 = uint(int(uint(_1201) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1203)] = as_type<uint>(_1175);
    float _1205 = fma(_1115, _1095, _1159);
    float _1207 = fma(_1077, _1095, _1161);
    float _1209 = fma(_1079, _1095, _1163);
    float _1211 = fma(_1109, _1095, _1165);
    float _1213 = _1205 + _1103;
    uint _1215 = uint(int(uint(_1117) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1215)] = as_type<uint>(_1185);
    int _1217 = _1117 + 4;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1219)] = as_type<uint>(_1183);
    int _1221 = _1117 + 8;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1223)] = as_type<uint>(_1187);
    int _1225 = _1117 + 12;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1227)] = as_type<uint>(_1189);
    uint _1229 = uint(int(uint(_1179) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1229)] = as_type<uint>(_1207);
    int _1231 = _1179 + 4;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1233)] = as_type<uint>(_1209);
    int _1235 = _1179 + 8;
    uint _1237 = uint(int(uint(_1235) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1237)] = as_type<uint>(_1211);
    int _1239 = _1179 + 12;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1241)] = as_type<uint>(_1213);
}

