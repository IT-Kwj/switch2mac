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
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4590, thread const int& _4591, constant _10& support_buffer)
{
    int _4594 = 1 + _4591;
    float _4596 = support_buffer._m5[_4594].x;
    bool _4598 = _4596 == 1.0;
    if (_4598)
    {
        return _4590;
    }
    float _4600 = float(_4590);
    float _4602 = _4600 * _4596;
    int _4604 = int(_4602);
    return _4604;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1373 = false;
    bool _891 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _74 = _64;
    if (_72)
    {
        return;
    }
    int _76 = _68 & 31;
    bool _78 = _76 == 0;
    bool _80 = uint(_76) < 32u;
    int _82 = 32 - _76;
    int _84 = _76 - 32;
    int _86 = 1 << _76;
    uint _89 = uint(int(uint(0) >> uint(_82)));
    int _91 = _86 | int(_89);
    int _93 = _78 ? 1 : _91;
    bool _95 = uint(_84) < 32u;
    int _97 = 0 << _84;
    int _99 = _95 ? _97 : 0;
    int _101 = _80 ? _93 : _99;
    int _103 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _105 = _103 + 32;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _101 & as_type<int>(_113);
    bool _117 = _115 != 0;
    float _119 = 0.0;
    float _121 = 0.0;
    if (!_117)
    {
        _119 = 0.0;
        _121 = 0.0;
    }
    float _123 = _119;
    float _125 = _121;
    float _127 = 0.0;
    float _129 = _123;
    float _131 = _125;
    if (!_117)
    {
        _127 = 0.0;
    }
    float _133 = _127;
    float _135 = 0.0;
    float _137 = 0.0;
    float _139 = _133;
    if (!_117)
    {
        _135 = 0.0;
        _137 = 0.0;
    }
    float _141 = _135;
    float _143 = _137;
    float _145 = 0.0;
    float _147 = _141;
    float _149 = _143;
    if (!_117)
    {
        _145 = 0.0;
    }
    float _151 = _145;
    float _153 = 0.0;
    float _155 = _151;
    if (!_117)
    {
        _153 = 0.0;
    }
    float _157 = _153;
    float _159 = 0.0;
    float _161 = _157;
    if (!_117)
    {
        _159 = 0.0;
    }
    float _163 = _159;
    float _165 = _163;
    if (!_117)
    {
        _74 = 0.0;
    }
    float _167 = _74;
    bool _169 = !_117;
    float _171 = _167;
    if (!_169)
    {
        uint _173 = uint(int(uint(_103) >> uint(2)));
        uint _175 = uint(int(uint(int(_173)) >> uint(2)));
        int _177 = int(_173) & 3;
        float _179 = (*spvDescriptorSet0.cp_c5)._m0[int(_175)][_177];
        int _181 = int(_173) + 1;
        uint _183 = uint(int(uint(_181) >> uint(2)));
        int _185 = _181 & 3;
        float _187 = (*spvDescriptorSet0.cp_c5)._m0[int(_183)][_185];
        int _189 = _68;
        int _191 = 0;
        int _193 = _58(_189, _191, (*spvDescriptorSet0.support_buffer));
        int _195 = as_type<int>(_179);
        int _197 = 0;
        int _199 = _58(_195, _197, (*spvDescriptorSet0.support_buffer));
        int3 _2010 = int3(_193, _199, 1);
        float3 _203 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2010.xy), uint(_2010.z), 0).xyz;
        float _205 = _203.x;
        float _207 = _203.y;
        float _209 = _203.z;
        int _211 = _68;
        int _213 = 0;
        int _215 = _58(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = as_type<int>(_187);
        int _219 = 0;
        int _221 = _58(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _2028 = int3(_215, _221, 1);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2028.xy), uint(_2028.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        int _231 = _68;
        int _233 = 0;
        int _235 = _58(_231, _233, (*spvDescriptorSet0.support_buffer));
        int _237 = as_type<int>(_179);
        int _239 = 0;
        int _241 = _58(_237, _239, (*spvDescriptorSet0.support_buffer));
        int3 _2046 = int3(_235, _241, 0);
        float3 _243 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2046.xy), uint(_2046.z), 0).xyz;
        float _245 = _243.x;
        float _247 = _243.y;
        float _249 = _243.z;
        int _251 = _68;
        int _253 = 0;
        int _255 = _58(_251, _253, (*spvDescriptorSet0.support_buffer));
        int _257 = as_type<int>(_187);
        int _259 = 0;
        int _261 = _58(_257, _259, (*spvDescriptorSet0.support_buffer));
        int3 _2064 = int3(_255, _261, 0);
        float3 _263 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2064.xy), uint(_2064.z), 0).xyz;
        float _265 = _263.x;
        float _267 = _263.y;
        float _269 = _263.z;
        int _271 = _68;
        int _273 = 0;
        int _275 = _58(_271, _273, (*spvDescriptorSet0.support_buffer));
        int _277 = as_type<int>(_179);
        int _279 = 0;
        int _281 = _58(_277, _279, (*spvDescriptorSet0.support_buffer));
        int3 _2082 = int3(_275, _281, 2);
        float3 _283 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2082.xy), uint(_2082.z), 0).xyz;
        float _285 = _283.x;
        float _287 = _283.y;
        float _289 = _283.z;
        int _291 = _68;
        int _293 = 0;
        int _295 = _58(_291, _293, (*spvDescriptorSet0.support_buffer));
        int _297 = as_type<int>(_187);
        int _299 = 0;
        int _301 = _58(_297, _299, (*spvDescriptorSet0.support_buffer));
        int3 _2100 = int3(_295, _301, 2);
        float3 _303 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2100.xy), uint(_2100.z), 0).xyz;
        float _305 = _303.x;
        float _307 = _303.y;
        float _309 = _303.z;
        int _311 = _103 + 16;
        uint _313 = uint(int(uint(_311) >> uint(2)));
        uint _315 = uint(int(uint(int(_313)) >> uint(2)));
        int _317 = int(_313) & 3;
        float _319 = (*spvDescriptorSet0.cp_c5)._m0[int(_315)][_317];
        float _321 = -_205;
        float _323 = _321 + _225;
        float _325 = -_209;
        float _327 = _325 + _229;
        float _329 = -_247;
        float _331 = _329 + _267;
        float _333 = -_249;
        float _335 = _333 + _269;
        float _337 = fma(_323, _319, _205);
        float _339 = fma(_327, _319, _209);
        float _341 = -_207;
        float _343 = _341 + _227;
        float _345 = -_245;
        float _347 = _345 + _265;
        float _349 = -_285;
        float _351 = _349 + _305;
        float _353 = -_287;
        float _355 = _353 + _307;
        float _357 = -_289;
        float _359 = _357 + _309;
        float _361 = fma(_331, _319, _247);
        float _363 = fma(_335, _319, _249);
        float _365 = fma(_343, _319, _207);
        float _367 = fma(_347, _319, _245);
        float _369 = fma(_351, _319, _285);
        float _371 = fma(_355, _319, _287);
        float _373 = fma(_359, _319, _289);
        _147 = _337;
        _171 = _339;
        _149 = _365;
        _165 = _373;
        _155 = _369;
        _129 = _367;
        _131 = _363;
        _161 = _371;
        _139 = _361;
    }
    float _375 = _147;
    float _377 = _171;
    float _379 = _149;
    float _381 = _165;
    float _383 = _155;
    float _385 = _129;
    float _387 = _131;
    float _389 = _161;
    float _391 = _139;
    int _393 = _103 + 36;
    uint _395 = uint(int(uint(_393) >> uint(2)));
    uint _397 = uint(int(uint(int(_395)) >> uint(2)));
    int _399 = int(_395) & 3;
    float _401 = (*spvDescriptorSet0.cp_c5)._m0[int(_397)][_399];
    int _403 = _101 & as_type<int>(_401);
    bool _405 = _403 != 0;
    bool _407 = !_405;
    float _409 = _385;
    int _411 = as_type<int>(_383);
    int _413 = as_type<int>(_389);
    int _415 = as_type<int>(_381);
    float _417 = _391;
    float _419 = _387;
    float _867;
    float _869;
    float _871;
    float _873;
    float _875;
    float _877;
    float _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    if (!_407)
    {
        int _421 = _103 + 8;
        uint _423 = uint(int(uint(_421) >> uint(2)));
        uint _425 = uint(int(uint(int(_423)) >> uint(2)));
        int _427 = int(_423) & 3;
        float _429 = (*spvDescriptorSet0.cp_c5)._m0[int(_425)][_427];
        int _431 = int(_423) + 1;
        uint _433 = uint(int(uint(_431) >> uint(2)));
        int _435 = _431 & 3;
        float _437 = (*spvDescriptorSet0.cp_c5)._m0[int(_433)][_435];
        int _439 = _68;
        int _441 = 1;
        int _443 = _58(_439, _441, (*spvDescriptorSet0.support_buffer));
        int _445 = as_type<int>(_429);
        int _447 = 1;
        int _449 = _58(_445, _447, (*spvDescriptorSet0.support_buffer));
        int3 _2306 = int3(_443, _449, 1);
        float3 _451 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2306.xy), uint(_2306.z), 0).xyz;
        float _453 = _451.x;
        float _455 = _451.y;
        float _457 = _451.z;
        int _459 = _68;
        int _461 = 1;
        int _463 = _58(_459, _461, (*spvDescriptorSet0.support_buffer));
        int _465 = as_type<int>(_437);
        int _467 = 1;
        int _469 = _58(_465, _467, (*spvDescriptorSet0.support_buffer));
        int3 _2324 = int3(_463, _469, 1);
        float3 _471 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2324.xy), uint(_2324.z), 0).xyz;
        float _473 = _471.x;
        float _475 = _471.y;
        float _477 = _471.z;
        int _479 = _68;
        int _481 = 1;
        int _483 = _58(_479, _481, (*spvDescriptorSet0.support_buffer));
        int _485 = as_type<int>(_429);
        int _487 = 1;
        int _489 = _58(_485, _487, (*spvDescriptorSet0.support_buffer));
        int3 _2342 = int3(_483, _489, 0);
        float3 _491 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2342.xy), uint(_2342.z), 0).xyz;
        float _493 = _491.x;
        float _495 = _491.y;
        float _497 = _491.z;
        int _499 = _68;
        int _501 = 1;
        int _503 = _58(_499, _501, (*spvDescriptorSet0.support_buffer));
        int _505 = as_type<int>(_437);
        int _507 = 1;
        int _509 = _58(_505, _507, (*spvDescriptorSet0.support_buffer));
        int3 _2360 = int3(_503, _509, 0);
        float3 _511 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2360.xy), uint(_2360.z), 0).xyz;
        float _513 = _511.x;
        float _515 = _511.y;
        float _517 = _511.z;
        int _519 = _68;
        int _521 = 1;
        int _523 = _58(_519, _521, (*spvDescriptorSet0.support_buffer));
        int _525 = as_type<int>(_429);
        int _527 = 1;
        int _529 = _58(_525, _527, (*spvDescriptorSet0.support_buffer));
        int3 _2378 = int3(_523, _529, 2);
        float3 _531 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2378.xy), uint(_2378.z), 0).xyz;
        float _533 = _531.x;
        float _535 = _531.y;
        float _537 = _531.z;
        int _539 = _68;
        int _541 = 1;
        int _543 = _58(_539, _541, (*spvDescriptorSet0.support_buffer));
        int _545 = as_type<int>(_437);
        int _547 = 1;
        int _549 = _58(_545, _547, (*spvDescriptorSet0.support_buffer));
        int3 _2396 = int3(_543, _549, 2);
        float3 _551 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2396.xy), uint(_2396.z), 0).xyz;
        float _553 = _551.x;
        float _555 = _551.y;
        float _557 = _551.z;
        float _559 = _375 * 0.15915493667125701904296875;
        float _561 = _377 * 0.15915493667125701904296875;
        float _563 = _379 * 0.15915493667125701904296875;
        int _565 = _103 + 24;
        uint _567 = uint(int(uint(_565) >> uint(2)));
        uint _569 = uint(int(uint(int(_567)) >> uint(2)));
        int _571 = int(_567) & 3;
        float _573 = (*spvDescriptorSet0.cp_c5)._m0[int(_569)][_571];
        int _575 = int(_567) + 1;
        uint _577 = uint(int(uint(_575) >> uint(2)));
        int _579 = _575 & 3;
        float _581 = (*spvDescriptorSet0.cp_c5)._m0[int(_577)][_579];
        float _583 = _559 * 6.283185482025146484375;
        float _585 = cos(_583);
        int _587 = _103 + 20;
        uint _589 = uint(int(uint(_587) >> uint(2)));
        uint _591 = uint(int(uint(int(_589)) >> uint(2)));
        int _593 = int(_589) & 3;
        float _595 = (*spvDescriptorSet0.cp_c5)._m0[int(_591)][_593];
        float _597 = _561 * 6.283185482025146484375;
        float _599 = sin(_597);
        float _601 = _561 * 6.283185482025146484375;
        float _603 = cos(_601);
        float _605 = _563 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _599 * _585;
        float _611 = _559 * 6.283185482025146484375;
        float _613 = sin(_611);
        float _615 = _585 * _603;
        float _617 = _563 * 6.283185482025146484375;
        float _619 = sin(_617);
        float _621 = _585 * _607;
        float _623 = _607 * _603;
        float _625 = _599 * _607;
        float _627 = _613 * _603;
        float _629 = _613 * _599;
        float _631 = _613 * _607;
        float _633 = _613 * _619;
        float _635 = -_627;
        float _637 = fma(_619, _609, _635);
        float _639 = fma(_619, _615, _629);
        float _641 = _619 * _595;
        float _643 = -_609;
        float _645 = fma(_603, _633, _643);
        float _647 = fma(_599, _633, _615);
        float _649 = -_455;
        float _651 = _649 + _475;
        float _653 = -_457;
        float _655 = _653 + _477;
        float _657 = -_453;
        float _659 = _657 + _473;
        float _661 = -_497;
        float _663 = _661 + _517;
        float _665 = fma(_651, _573, _455);
        float _667 = fma(_655, _573, _457);
        float _669 = fma(_659, _573, _453);
        float _671 = -_537;
        float _673 = _671 + _557;
        float _675 = _665 * 0.15915493667125701904296875;
        float _677 = _667 * 0.15915493667125701904296875;
        float _679 = _669 * 0.15915493667125701904296875;
        float _681 = fma(_663, _573, _497);
        float _683 = _675 * 6.283185482025146484375;
        float _685 = cos(_683);
        float _687 = fma(_673, _573, _537);
        float _689 = _687 * _581;
        float _691 = _677 * 6.283185482025146484375;
        float _693 = sin(_691);
        float _695 = fma(_381, _595, _689);
        float _697 = _677 * 6.283185482025146484375;
        float _699 = cos(_697);
        float _701 = _679 * 6.283185482025146484375;
        float _703 = cos(_701);
        float _705 = _675 * 6.283185482025146484375;
        float _707 = sin(_705);
        float _709 = _685 * _699;
        float _711 = _709 * _581;
        float _713 = _679 * 6.283185482025146484375;
        float _715 = sin(_713);
        float _717 = _693 * _685;
        float _719 = _703 * _699;
        float _721 = _693 * _703;
        float _723 = _703 * _685;
        float _725 = _717 * _581;
        float _727 = fma(_623, _595, _711);
        float _729 = fma(_625, _595, _725);
        float _731 = _729 * _729;
        float _733 = _715 * _707;
        float _735 = _715 * _699;
        float _737 = _715 * _693;
        float _739 = _715 * _685;
        float _741 = -_721;
        float _743 = fma(_699, _733, _741);
        float _745 = fma(_693, _733, _719);
        float _747 = -_735;
        float _749 = fma(_707, _721, _747);
        float _751 = fma(_707, _719, _737);
        float _753 = -_707;
        float _755 = -_641;
        float _757 = fma(_753, _581, _755);
        float _759 = _745 * _581;
        float _761 = _749 * _581;
        float _763 = _743 * _581;
        float _765 = fma(_727, _727, _731);
        float _767 = fma(_647, _595, _759);
        float _769 = _751 * _581;
        float _771 = fma(_637, _595, _761);
        float _773 = _739 * _581;
        float _775 = fma(_645, _595, _763);
        float _777 = _767 * _767;
        float _779 = fma(_757, _757, _765);
        float _781 = _723 * _581;
        float _783 = fma(_639, _595, _769);
        float _785 = _771 * _771;
        float _787 = fma(_631, _595, _773);
        float _789 = fma(_775, _775, _777);
        float _791 = fma(_621, _595, _781);
        float _793 = fma(_783, _783, _785);
        float _795 = rsqrt(_779);
        float _797 = fma(_787, _787, _789);
        float _799 = -_533;
        float _801 = _799 + _553;
        float _803 = fma(_791, _791, _793);
        float _805 = -_493;
        float _807 = _805 + _513;
        float _809 = fma(_801, _573, _533);
        float _811 = rsqrt(_797);
        float _813 = fma(_807, _573, _493);
        float _815 = _809 * _581;
        float _817 = _813 * _581;
        float _819 = fma(_383, _595, _815);
        float _821 = rsqrt(_803);
        float _823 = _727 * _795;
        float _825 = _757 * _795;
        float _827 = -_495;
        float _829 = _827 + _515;
        float _831 = -_535;
        float _833 = _831 + _555;
        float _835 = _729 * _795;
        float _837 = fma(_385, _595, _817);
        float _839 = fma(_829, _573, _495);
        float _841 = fma(_833, _573, _535);
        float _843 = _775 * _811;
        float _845 = _767 * _811;
        float _847 = _787 * _811;
        float _849 = _681 * _581;
        float _851 = _841 * _581;
        float _853 = _783 * _821;
        float _855 = _771 * _821;
        float _857 = _791 * _821;
        float _859 = _839 * _581;
        float _861 = fma(_387, _595, _849);
        float _863 = fma(_389, _595, _851);
        float _865 = fma(_391, _595, _859);
        _409 = _837;
        _867 = _823;
        _869 = _835;
        _871 = _825;
        _873 = _865;
        _875 = _843;
        _877 = _845;
        _879 = _847;
        _881 = _861;
        _883 = _853;
        _885 = _855;
        _887 = _857;
        _411 = as_type<int>(_819);
        _413 = as_type<int>(_863);
        _415 = as_type<int>(_695);
        _889 = _815;
        _891 = true;
    }
    else
    {
        float _893 = _377 * 0.15915493667125701904296875;
        float _895 = _375 * 0.15915493667125701904296875;
        float _897 = _379 * 0.15915493667125701904296875;
        float _899 = _893 * 6.283185482025146484375;
        float _901 = sin(_899);
        float _903 = _895 * 6.283185482025146484375;
        float _905 = sin(_903);
        float _907 = _895 * 6.283185482025146484375;
        float _909 = cos(_907);
        float _911 = _893 * 6.283185482025146484375;
        float _913 = cos(_911);
        float _915 = _905 * _901;
        float _917 = _897 * 6.283185482025146484375;
        float _919 = sin(_917);
        float _921 = _901 * _909;
        float _923 = _897 * 6.283185482025146484375;
        float _925 = cos(_923);
        float _927 = _909 * _913;
        float _929 = _905 * _913;
        float _931 = _905 * _919;
        float _933 = -_921;
        float _935 = fma(_913, _931, _933);
        float _937 = _901 * _925;
        float _939 = fma(_901, _931, _927);
        float _941 = _909 * _925;
        float _943 = _925 * _913;
        float _945 = -_929;
        float _947 = fma(_919, _921, _945);
        float _949 = _905 * _925;
        float _951 = fma(_919, _927, _915);
        float _953 = -_919;
        float _955 = _953 + (-0.0);
        _867 = _943;
        _869 = _937;
        _871 = _955;
        _873 = _391;
        _875 = _935;
        _877 = _939;
        _879 = _949;
        _881 = _387;
        _883 = _951;
        _885 = _947;
        _887 = _941;
        _889 = _905;
    }
    _891 = false;
    float _957 = _409;
    float _959 = _867;
    float _961 = _869;
    float _963 = _871;
    float _965 = _873;
    float _967 = _875;
    float _969 = _877;
    float _971 = _879;
    float _973 = _881;
    float _975 = _883;
    float _977 = _885;
    float _979 = _887;
    int _981 = _411;
    int _983 = _413;
    int _985 = _415;
    float _987 = _889;
    float _989 = _957 * _959;
    float _991 = _957 * _961;
    float _993 = _957 * _963;
    float _995 = _965 * _967;
    float _997 = _965 * _969;
    float _999 = _965 * _971;
    int _1001 = _68 * 48;
    float _1003 = _973 * _975;
    float _1005 = _973 * _977;
    float _1007 = _973 * _979;
    int _1009 = _68 * 112;
    uint _1011 = uint(int(uint(_1001) >> uint(2)));
    _39[int(_1011)] = as_type<uint>(_989);
    int _1013 = _1001 + 4;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    _39[int(_1015)] = as_type<uint>(_995);
    int _1017 = _1001 + 8;
    uint _1019 = uint(int(uint(_1017) >> uint(2)));
    _39[int(_1019)] = as_type<uint>(_1003);
    int _1021 = _1001 + 12;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    _39[int(_1023)] = uint(_981);
    bool _1025 = _68 != 0;
    bool _1027 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1029 = _1001 + 16;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    _39[int(_1031)] = as_type<uint>(_991);
    int _1033 = _1001 + 20;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    _39[int(_1035)] = as_type<uint>(_997);
    int _1037 = _1001 + 24;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    _39[int(_1039)] = as_type<uint>(_1005);
    int _1041 = _1001 + 28;
    uint _1043 = uint(int(uint(_1041) >> uint(2)));
    _39[int(_1043)] = uint(_983);
    int _1045 = _1001 + 32;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    _39[int(_1047)] = as_type<uint>(_993);
    int _1049 = _1001 + 36;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    _39[int(_1051)] = as_type<uint>(_999);
    int _1053 = _1001 + 40;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    _39[int(_1055)] = as_type<uint>(_1007);
    int _1057 = _1001 + 44;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    _39[int(_1059)] = uint(_985);
    float _1061 = _957;
    float _1063 = _973;
    float _1065 = _987;
    float _1067 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _1069 = _999;
    float _1071 = _993;
    float _1073 = _1005;
    float _1075 = _1007;
    float _1077 = as_type<float>(_983);
    float _1079 = as_type<float>(_985);
    if (!_1025)
    {
        _417 = _989;
    }
    float _1081 = _417;
    float _1083 = _1081;
    if (!_1025)
    {
        _1061 = _995;
    }
    float _1085 = _1061;
    float _1087 = _1085;
    if (!_1025)
    {
        _419 = _1003;
    }
    float _1089 = _419;
    float _1091 = _1089;
    if (!_1025)
    {
        _1063 = as_type<float>(_981);
    }
    float _1093 = _1063;
    float _1095 = _1093;
    if (!_1025)
    {
        _1065 = _991;
    }
    float _1097 = _1065;
    float _1099 = _1097;
    if (!_1025)
    {
        _1067 = _997;
    }
    float _1101 = _1067;
    float _1103 = _1101;
    if (!_1027)
    {
        int _1105 = _68 * 48;
        int _1107 = _1105 + 16;
        uint _1109 = uint(int(uint(_1105) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1109)] = as_type<uint>(_989);
        int _1111 = _1105 + 4;
        uint _1113 = uint(int(uint(_1111) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1113)] = as_type<uint>(_995);
        int _1115 = _1105 + 8;
        uint _1117 = uint(int(uint(_1115) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1117)] = as_type<uint>(_1003);
        int _1119 = _1105 + 12;
        uint _1121 = uint(int(uint(_1119) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1121)] = uint(_981);
        int _1123 = _1105 + 32;
        uint _1125 = uint(int(uint(_1107) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1125)] = as_type<uint>(_991);
        int _1127 = _1107 + 4;
        uint _1129 = uint(int(uint(_1127) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1129)] = as_type<uint>(_997);
        int _1131 = _1107 + 8;
        uint _1133 = uint(int(uint(_1131) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1133)] = as_type<uint>(_1005);
        int _1135 = _1107 + 12;
        uint _1137 = uint(int(uint(_1135) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1137)] = uint(_983);
        uint _1139 = uint(int(uint(_1123) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1139)] = as_type<uint>(_993);
        int _1141 = _1123 + 4;
        uint _1143 = uint(int(uint(_1141) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1143)] = as_type<uint>(_999);
        int _1145 = _1123 + 8;
        uint _1147 = uint(int(uint(_1145) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1147)] = as_type<uint>(_1007);
        int _1149 = _1123 + 12;
        uint _1151 = uint(int(uint(_1149) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1151)] = uint(_985);
    }
    bool _1153 = !_1025;
    if (!_1153)
    {
        bool _1155 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1157 = !_1155;
        if (!_1157)
        {
            uint _1159 = uint(int(uint(_1009) >> uint(2)));
            uint _1161 = uint(int(uint(int(_1159)) >> uint(2)));
            int _1163 = int(_1159) & 3;
            float _1165 = (*spvDescriptorSet0.cp_c6)._m0[int(_1161)][_1163];
            int _1167 = as_type<int>(_1165) * 48;
            int _1169 = 0;
            bool _1171;
            float _1267;
            float _1271;
            float _1275;
            float _1279;
            float _1293;
            float _1295;
            float _1307;
            float _1317;
            float _1319;
            float _1321;
            float _1323;
            float _1325;
            do
            {
                int _1173 = _1169;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1175 = uint(int(uint(_1167) >> uint(2)));
                float _1177 = as_type<float>(_39[int(_1175)]);
                int _1179 = _1167 + 4;
                uint _1181 = uint(int(uint(_1179) >> uint(2)));
                float _1183 = as_type<float>(_39[int(_1181)]);
                int _1185 = _1167 + 8;
                uint _1187 = uint(int(uint(_1185) >> uint(2)));
                float _1189 = as_type<float>(_39[int(_1187)]);
                int _1191 = _1167 + 12;
                uint _1193 = uint(int(uint(_1191) >> uint(2)));
                float _1195 = as_type<float>(_39[int(_1193)]);
                int _1197 = _1173 + 1;
                int _1199 = _1167 + 16;
                uint _1201 = uint(int(uint(_1199) >> uint(2)));
                float _1203 = as_type<float>(_39[int(_1201)]);
                int _1205 = _1167 + 20;
                uint _1207 = uint(int(uint(_1205) >> uint(2)));
                float _1209 = as_type<float>(_39[int(_1207)]);
                int _1211 = _1167 + 24;
                uint _1213 = uint(int(uint(_1211) >> uint(2)));
                float _1215 = as_type<float>(_39[int(_1213)]);
                int _1217 = _1167 + 28;
                uint _1219 = uint(int(uint(_1217) >> uint(2)));
                float _1221 = as_type<float>(_39[int(_1219)]);
                bool _1223 = uint(_1197) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1225 = _1167 + 32;
                uint _1227 = uint(int(uint(_1225) >> uint(2)));
                float _1229 = as_type<float>(_39[int(_1227)]);
                int _1231 = _1167 + 36;
                uint _1233 = uint(int(uint(_1231) >> uint(2)));
                float _1235 = as_type<float>(_39[int(_1233)]);
                int _1237 = _1167 + 40;
                uint _1239 = uint(int(uint(_1237) >> uint(2)));
                float _1241 = as_type<float>(_39[int(_1239)]);
                int _1243 = _1167 + 44;
                uint _1245 = uint(int(uint(_1243) >> uint(2)));
                float _1247 = as_type<float>(_39[int(_1245)]);
                float _1249 = _1183 * as_type<float>(_983);
                float _1251 = _991 * _1183;
                float _1253 = _997 * _1183;
                float _1255 = _1005 * _1183;
                float _1257 = fma(_1177, as_type<float>(_981), _1249);
                float _1259 = fma(_989, _1177, _1251);
                float _1261 = fma(_995, _1177, _1253);
                float _1263 = fma(_1003, _1177, _1255);
                float _1265 = fma(_1189, as_type<float>(_985), _1257);
                _1267 = fma(_993, _1189, _1259);
                float _1269 = _991 * _1209;
                _1271 = fma(_1007, _1189, _1263);
                float _1273 = _1209 * as_type<float>(_983);
                _1275 = _1195 + _1265;
                float _1277 = _997 * _1209;
                _1279 = fma(_999, _1189, _1261);
                float _1281 = fma(_1203, as_type<float>(_981), _1273);
                float _1283 = fma(_989, _1203, _1269);
                float _1285 = fma(_995, _1203, _1277);
                float _1287 = _1005 * _1209;
                float _1289 = fma(_1215, as_type<float>(_985), _1281);
                float _1291 = _1235 * as_type<float>(_983);
                _1293 = fma(_993, _1215, _1283);
                _1295 = fma(_999, _1215, _1285);
                float _1297 = _991 * _1235;
                float _1299 = _997 * _1235;
                float _1301 = _1005 * _1235;
                float _1303 = fma(_1229, as_type<float>(_981), _1291);
                float _1305 = fma(_1003, _1203, _1287);
                _1307 = _1221 + _1289;
                float _1309 = fma(_989, _1229, _1297);
                float _1311 = fma(_995, _1229, _1299);
                float _1313 = fma(_1003, _1229, _1301);
                float _1315 = fma(_1241, as_type<float>(_985), _1303);
                _1317 = fma(_1007, _1215, _1305);
                _1319 = fma(_993, _1241, _1309);
                _1321 = fma(_999, _1241, _1311);
                _1323 = fma(_1007, _1241, _1313);
                _1325 = _1247 + _1315;
                uint _1327 = uint(int(uint(_1001) >> uint(2)));
                _39[int(_1327)] = as_type<uint>(_1267);
                int _1329 = _1001 + 4;
                uint _1331 = uint(int(uint(_1329) >> uint(2)));
                _39[int(_1331)] = as_type<uint>(_1279);
                int _1333 = _1001 + 8;
                uint _1335 = uint(int(uint(_1333) >> uint(2)));
                _39[int(_1335)] = as_type<uint>(_1271);
                int _1337 = _1001 + 12;
                uint _1339 = uint(int(uint(_1337) >> uint(2)));
                _39[int(_1339)] = as_type<uint>(_1275);
                int _1341 = _1001 + 16;
                uint _1343 = uint(int(uint(_1341) >> uint(2)));
                _39[int(_1343)] = as_type<uint>(_1293);
                int _1345 = _1001 + 20;
                uint _1347 = uint(int(uint(_1345) >> uint(2)));
                _39[int(_1347)] = as_type<uint>(_1295);
                int _1349 = _1001 + 24;
                uint _1351 = uint(int(uint(_1349) >> uint(2)));
                _39[int(_1351)] = as_type<uint>(_1317);
                int _1353 = _1001 + 28;
                uint _1355 = uint(int(uint(_1353) >> uint(2)));
                _39[int(_1355)] = as_type<uint>(_1307);
                int _1357 = _1001 + 32;
                uint _1359 = uint(int(uint(_1357) >> uint(2)));
                _39[int(_1359)] = as_type<uint>(_1319);
                int _1361 = _1001 + 36;
                uint _1363 = uint(int(uint(_1361) >> uint(2)));
                _39[int(_1363)] = as_type<uint>(_1321);
                int _1365 = _1001 + 40;
                uint _1367 = uint(int(uint(_1365) >> uint(2)));
                _39[int(_1367)] = as_type<uint>(_1323);
                int _1369 = _1001 + 44;
                uint _1371 = uint(int(uint(_1369) >> uint(2)));
                _39[int(_1371)] = as_type<uint>(_1325);
                _1171 = !_1223;
                _1169 = _1197;
            } while (_1171);
            _1103 = _1295;
            _1069 = _1321;
            _1087 = _1279;
            _1099 = _1293;
            _1071 = _1319;
            _1083 = _1267;
            _1073 = _1317;
            _1091 = _1271;
            _1075 = _1323;
            _1077 = _1307;
            _1095 = _1275;
            _1079 = _1325;
            _1373 = true;
        }
        else
        {
            _1103 = 0.0;
            _1069 = 0.0;
            _1087 = 0.0;
            _1099 = 0.0;
            _1071 = 0.0;
            _1083 = 0.0;
            _1073 = 0.0;
            _1091 = 0.0;
            _1075 = 0.0;
            _1077 = 0.0;
            _1095 = 0.0;
            _1079 = 0.0;
        }
    }
    _1373 = false;
    float _1375 = _1103;
    float _1377 = _1069;
    float _1379 = _1087;
    float _1381 = _1099;
    float _1383 = _1071;
    float _1385 = _1083;
    float _1387 = _1073;
    float _1389 = _1091;
    float _1391 = _1075;
    float _1393 = _1077;
    float _1395 = _1095;
    float _1397 = _1079;
    int _1399 = _1009 + 80;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.cp_c6)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.cp_c6)._m0[int(_1411)][_1413];
    int _1417 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1419 = _1417 + _68;
    int _1421 = _1009 + 64;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
    int _1427 = int(_1423) & 3;
    float _1429 = (*spvDescriptorSet0.cp_c6)._m0[int(_1425)][_1427];
    int _1431 = int(_1423) + 1;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    int _1435 = _1431 & 3;
    float _1437 = (*spvDescriptorSet0.cp_c6)._m0[int(_1433)][_1435];
    int _1439 = _1419 * 48;
    int _1441 = _1009 + 88;
    uint _1443 = uint(int(uint(_1441) >> uint(2)));
    uint _1445 = uint(int(uint(int(_1443)) >> uint(2)));
    int _1447 = int(_1443) & 3;
    float _1449 = (*spvDescriptorSet0.cp_c6)._m0[int(_1445)][_1447];
    int _1451 = int(_1443) + 1;
    uint _1453 = uint(int(uint(_1451) >> uint(2)));
    int _1455 = _1451 & 3;
    float _1457 = (*spvDescriptorSet0.cp_c6)._m0[int(_1453)][_1455];
    int _1459 = _1009 + 72;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.cp_c6)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.cp_c6)._m0[int(_1471)][_1473];
    int _1477 = _1009 + 96;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    uint _1481 = uint(int(uint(int(_1479)) >> uint(2)));
    int _1483 = int(_1479) & 3;
    float _1485 = (*spvDescriptorSet0.cp_c6)._m0[int(_1481)][_1483];
    int _1487 = int(_1479) + 1;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    int _1491 = _1487 & 3;
    float _1493 = (*spvDescriptorSet0.cp_c6)._m0[int(_1489)][_1491];
    int _1495 = _1009 + 104;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.cp_c6)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.cp_c6)._m0[int(_1507)][_1509];
    float _1513 = _1375 * _1407;
    float _1515 = _1377 * _1407;
    int _1517 = _1009 + 16;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.cp_c6)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.cp_c6)._m0[int(_1529)][_1531];
    float _1535 = _1379 * _1407;
    float _1537 = fma(_1381, _1429, _1513);
    float _1539 = _1379 * _1415;
    int _1541 = _1009 + 32;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    uint _1545 = uint(int(uint(int(_1543)) >> uint(2)));
    int _1547 = int(_1543) & 3;
    float _1549 = (*spvDescriptorSet0.cp_c6)._m0[int(_1545)][_1547];
    int _1551 = int(_1543) + 1;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    int _1555 = _1551 & 3;
    float _1557 = (*spvDescriptorSet0.cp_c6)._m0[int(_1553)][_1555];
    float _1559 = fma(_1383, _1429, _1515);
    float _1561 = _1375 * _1415;
    float _1563 = fma(_1385, _1437, _1539);
    float _1565 = _1377 * _1415;
    float _1567 = fma(_1385, _1429, _1535);
    float _1569 = _1379 * _1449;
    float _1571 = _1379 * _1457;
    int _1573 = _1009 + 48;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    uint _1577 = uint(int(uint(int(_1575)) >> uint(2)));
    int _1579 = int(_1575) & 3;
    float _1581 = (*spvDescriptorSet0.cp_c6)._m0[int(_1577)][_1579];
    int _1583 = int(_1575) + 1;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    int _1587 = _1583 & 3;
    float _1589 = (*spvDescriptorSet0.cp_c6)._m0[int(_1585)][_1587];
    float _1591 = _1375 * _1449;
    float _1593 = _1375 * _1457;
    float _1595 = _1377 * _1449;
    float _1597 = _1377 * _1457;
    float _1599 = fma(_1381, _1437, _1561);
    float _1601 = fma(_1383, _1437, _1565);
    float _1603 = fma(_1385, _1467, _1569);
    int _1605 = _1009 + 24;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.cp_c6)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.cp_c6)._m0[int(_1617)][_1619];
    float _1623 = fma(_1385, _1475, _1571);
    float _1625 = fma(_1381, _1467, _1591);
    float _1627 = fma(_1381, _1475, _1593);
    float _1629 = fma(_1383, _1467, _1595);
    float _1631 = fma(_1383, _1475, _1597);
    float _1633 = fma(_1387, _1485, _1537);
    float _1635 = fma(_1387, _1493, _1599);
    int _1637 = _1009 + 40;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    uint _1641 = uint(int(uint(int(_1639)) >> uint(2)));
    int _1643 = int(_1639) & 3;
    float _1645 = (*spvDescriptorSet0.cp_c6)._m0[int(_1641)][_1643];
    int _1647 = int(_1639) + 1;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    int _1651 = _1647 & 3;
    float _1653 = (*spvDescriptorSet0.cp_c6)._m0[int(_1649)][_1651];
    float _1655 = fma(_1389, _1493, _1563);
    float _1657 = fma(_1391, _1485, _1559);
    float _1659 = fma(_1391, _1493, _1601);
    float _1661 = fma(_1389, _1485, _1567);
    float _1663 = fma(_1387, _1503, _1625);
    float _1665 = fma(_1387, _1511, _1627);
    int _1667 = _1009 + 56;
    uint _1669 = uint(int(uint(_1667) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.cp_c6)._m0[int(_1671)][_1673];
    int _1677 = int(_1669) + 1;
    uint _1679 = uint(int(uint(_1677) >> uint(2)));
    int _1681 = _1677 & 3;
    float _1683 = (*spvDescriptorSet0.cp_c6)._m0[int(_1679)][_1681];
    float _1685 = fma(_1389, _1511, _1623);
    float _1687 = fma(_1391, _1511, _1631);
    float _1689 = _1665 + _1393;
    float _1691 = fma(_1391, _1503, _1629);
    float _1693 = _1685 + _1395;
    float _1695 = fma(_1389, _1503, _1603);
    float _1697 = _1687 + _1397;
    float _1699 = _1689 * _1533;
    float _1701 = _1635 * _1533;
    float _1703 = _1663 * _1533;
    float _1705 = _1633 * _1533;
    float _1707 = fma(_1693, _1525, _1699);
    float _1709 = fma(_1655, _1525, _1701);
    float _1711 = fma(_1695, _1525, _1703);
    float _1713 = fma(_1661, _1525, _1705);
    float _1715 = _1689 * _1557;
    float _1717 = _1633 * _1557;
    float _1719 = _1635 * _1557;
    float _1721 = _1663 * _1557;
    float _1723 = fma(_1693, _1549, _1715);
    float _1725 = fma(_1661, _1549, _1717);
    float _1727 = fma(_1655, _1549, _1719);
    float _1729 = fma(_1695, _1549, _1721);
    float _1731 = _1689 * _1589;
    float _1733 = _1635 * _1589;
    float _1735 = _1633 * _1589;
    float _1737 = _1663 * _1589;
    float _1739 = fma(_1693, _1581, _1731);
    float _1741 = fma(_1655, _1581, _1733);
    float _1743 = fma(_1661, _1581, _1735);
    float _1745 = fma(_1695, _1581, _1737);
    float _1747 = fma(_1697, _1613, _1707);
    float _1749 = fma(_1659, _1613, _1709);
    float _1751 = fma(_1691, _1613, _1711);
    float _1753 = fma(_1657, _1613, _1713);
    float _1755 = _1747 + _1621;
    int _1757 = _1439 + 16;
    int _1759 = _1439 + 32;
    float _1761 = fma(_1697, _1645, _1723);
    float _1763 = fma(_1657, _1645, _1725);
    float _1765 = fma(_1659, _1645, _1727);
    float _1767 = fma(_1691, _1645, _1729);
    float _1769 = _1761 + _1653;
    int _1771 = _1439 + 48;
    uint _1773 = uint(int(uint(_1757) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1773)] = as_type<uint>(_1753);
    int _1775 = _1757 + 4;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1777)] = as_type<uint>(_1749);
    int _1779 = _1757 + 8;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1781)] = as_type<uint>(_1751);
    int _1783 = _1757 + 12;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1785)] = as_type<uint>(_1755);
    float _1787 = fma(_1697, _1675, _1739);
    float _1789 = fma(_1657, _1675, _1743);
    float _1791 = fma(_1659, _1675, _1741);
    float _1793 = fma(_1691, _1675, _1745);
    float _1795 = _1787 + _1683;
    uint _1797 = uint(int(uint(_1759) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1797)] = as_type<uint>(_1763);
    int _1799 = _1759 + 4;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1801)] = as_type<uint>(_1765);
    int _1803 = _1759 + 8;
    uint _1805 = uint(int(uint(_1803) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1805)] = as_type<uint>(_1767);
    int _1807 = _1759 + 12;
    uint _1809 = uint(int(uint(_1807) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1809)] = as_type<uint>(_1769);
    uint _1811 = uint(int(uint(_1771) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1811)] = as_type<uint>(_1789);
    int _1813 = _1771 + 4;
    uint _1815 = uint(int(uint(_1813) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1815)] = as_type<uint>(_1791);
    int _1817 = _1771 + 8;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1819)] = as_type<uint>(_1793);
    int _1821 = _1771 + 12;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1823)] = as_type<uint>(_1795);
}

