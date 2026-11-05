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
int _56(thread const int& _4267, thread const int& _4268, constant _10& support_buffer)
{
    int _4271 = 1 + _4268;
    float _4273 = support_buffer._m5[_4271].x;
    bool _4275 = _4273 == 1.0;
    if (_4275)
    {
        return _4267;
    }
    float _4277 = float(_4267);
    float _4279 = _4277 * _4273;
    int _4281 = int(_4279);
    return _4281;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _695 = false;
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
    int _76 = _74 << 4;
    bool _78 = !_72;
    if (!_78)
    {
        uint _81 = uint(int(uint(_76) >> uint(2)));
        uint _83 = uint(int(uint(int(_81)) >> uint(2)));
        int _85 = int(_81) & 3;
        float _87 = (*spvDescriptorSet0.cp_c4)._m0[int(_83)][_85];
        int _89 = as_type<int>(_87) * 48;
        int _91 = 0;
        int _93 = 0;
        int _95 = 0;
        float _97 = 0.0;
        float _99 = 0.0;
        float _101 = 0.0;
        float _103 = 0.0;
        float _105 = 0.0;
        float _107 = 0.0;
        float _109 = 0.0;
        float _111 = 0.0;
        float _113 = 0.0;
        int _115 = 0;
        float _117 = 0.0;
        float _119 = 0.0;
        int _121 = 0;
        float _123 = 0.0;
        float _125 = 0.0;
        float _127 = 0.0;
        bool _129;
        int _657;
        float _659;
        float _661;
        float _663;
        float _665;
        float _667;
        float _669;
        float _671;
        float _673;
        float _675;
        float _677;
        float _679;
        float _681;
        float _683;
        float _685;
        float _687;
        int _689;
        int _691;
        int _693;
        do
        {
            int _131 = _91;
            int _133 = _93;
            int _135 = _95;
            float _137 = _97;
            float _139 = _99;
            float _141 = _101;
            float _143 = _103;
            float _145 = _105;
            float _147 = _107;
            float _149 = _109;
            float _151 = _111;
            float _153 = _113;
            int _155 = _115;
            float _157 = _117;
            float _159 = _119;
            int _161 = _121;
            float _163 = _123;
            float _165 = _125;
            float _167 = _127;
            int _169 = _89 + 36;
            uint _171 = uint(int(uint(_169) >> uint(2)));
            uint _173 = uint(int(uint(int(_171)) >> uint(2)));
            int _175 = int(_171) & 3;
            float _177 = (*spvDescriptorSet0.cp_c5)._m0[int(_173)][_175];
            int _179 = _131 & 31;
            bool _181 = _179 == 0;
            bool _183 = uint(_179) < 32u;
            int _185 = 32 - _179;
            int _187 = _179 - 32;
            int _189 = 1 << _179;
            uint _191 = uint(int(uint(0) >> uint(_185)));
            int _193 = _189 | int(_191);
            int _195 = _181 ? 1 : _193;
            bool _197 = uint(_187) < 32u;
            int _199 = 0 << _187;
            int _201 = _197 ? _199 : 0;
            float _203 = _183 ? as_type<float>(_195) : as_type<float>(_201);
            int _205 = _89 + 32;
            uint _207 = uint(int(uint(_205) >> uint(2)));
            uint _209 = uint(int(uint(int(_207)) >> uint(2)));
            int _211 = int(_207) & 3;
            float _213 = (*spvDescriptorSet0.cp_c5)._m0[int(_209)][_211];
            int _215 = as_type<int>(_203) & as_type<int>(_177);
            bool _217 = _215 != 0;
            int _219 = as_type<int>(_203) & as_type<int>(_213);
            bool _221 = _219 != 0;
            int _223 = _133;
            float _225 = _137;
            float _227 = _143;
            int _229 = _155;
            float _231 = _163;
            float _233 = _165;
            float _235 = _159;
            float _237 = _167;
            float _239 = _203;
            float _241 = _177;
            float _243 = _157;
            float _245 = _213;
            int _247 = _161;
            if (_217)
            {
                int _249 = _89 + 8;
                uint _251 = uint(int(uint(_249) >> uint(2)));
                uint _253 = uint(int(uint(int(_251)) >> uint(2)));
                int _255 = int(_251) & 3;
                float _257 = (*spvDescriptorSet0.cp_c5)._m0[int(_253)][_255];
                _223 = as_type<int>(_257);
            }
            int _259 = _223;
            if (_217)
            {
                _225 = 1.4012984643248170709237295832899e-45;
            }
            float _261 = _225;
            if (_217)
            {
                _227 = 2.8025969286496341418474591665798e-45;
            }
            float _263 = _227;
            int _265 = _135;
            if (_221)
            {
                uint _267 = uint(int(uint(_89) >> uint(2)));
                uint _269 = uint(int(uint(int(_267)) >> uint(2)));
                int _271 = int(_267) & 3;
                float _273 = (*spvDescriptorSet0.cp_c5)._m0[int(_269)][_271];
                _265 = as_type<int>(_273);
            }
            int _275 = _265;
            if (_221)
            {
                _229 = 1;
            }
            int _277 = _229;
            float _279 = _261;
            float _281 = as_type<float>(_131);
            float _283 = _139;
            float _285 = as_type<float>(_259);
            float _287 = as_type<float>(_277);
            if (_217)
            {
                int _289 = _131;
                int _291 = 0;
                int _293 = _56(_289, _291, (*spvDescriptorSet0.support_buffer));
                int _295 = _259;
                int _297 = 0;
                int _299 = _56(_295, _297, (*spvDescriptorSet0.support_buffer));
                int3 _1980 = int3(_293, _299, as_type<int>(_261));
                float3 _303 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1980.xy), uint(_1980.z), 0).xyz;
                float _305 = _303.x;
                float _307 = _303.y;
                float _309 = _303.z;
                _279 = _305;
                _281 = _307;
                _283 = _309;
            }
            float _311 = _279;
            float _313 = _281;
            float _315 = _283;
            float _317 = 0.0;
            float _319 = as_type<float>(_131);
            float _321 = _141;
            if (_217)
            {
                int _323 = _131;
                int _325 = 0;
                int _327 = _56(_323, _325, (*spvDescriptorSet0.support_buffer));
                int _329 = _259;
                int _331 = 0;
                int _333 = _56(_329, _331, (*spvDescriptorSet0.support_buffer));
                int3 _2009 = int3(_327, _333, 0);
                float3 _335 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2009.xy), uint(_2009.z), 0).xyz;
                float _337 = _335.x;
                float _339 = _335.y;
                float _341 = _335.z;
                _317 = _337;
                _319 = _339;
                _321 = _341;
            }
            float _343 = _317;
            float _345 = _319;
            float _347 = _321;
            float _349 = _263;
            float _351 = as_type<float>(_131);
            float _353 = _145;
            if (_217)
            {
                int _355 = _131;
                int _357 = 0;
                int _359 = _56(_355, _357, (*spvDescriptorSet0.support_buffer));
                int _361 = _259;
                int _363 = 0;
                int _365 = _56(_361, _363, (*spvDescriptorSet0.support_buffer));
                int3 _2041 = int3(_359, _365, as_type<int>(_263));
                float3 _367 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2041.xy), uint(_2041.z), 0).xyz;
                float _369 = _367.x;
                float _371 = _367.y;
                float _373 = _367.z;
                _349 = _369;
                _351 = _371;
                _353 = _373;
            }
            float _375 = _349;
            float _377 = _351;
            float _379 = _353;
            float _381 = 0.0;
            float _383 = as_type<float>(_131);
            float _385 = _147;
            if (_221)
            {
                int _387 = _131;
                int _389 = 1;
                int _391 = _56(_387, _389, (*spvDescriptorSet0.support_buffer));
                int _393 = _275;
                int _395 = 1;
                int _397 = _56(_393, _395, (*spvDescriptorSet0.support_buffer));
                int3 _2070 = int3(_391, _397, 0);
                float3 _399 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2070.xy), uint(_2070.z), 0).xyz;
                float _401 = _399.x;
                float _403 = _399.y;
                float _405 = _399.z;
                _381 = _401;
                _383 = _403;
                _385 = _405;
            }
            float _407 = _381;
            float _409 = _383;
            float _411 = _385;
            float _413 = _149;
            float _415 = _151;
            float _417 = _153;
            if (_221)
            {
                int _419 = _131;
                int _421 = 1;
                int _423 = _56(_419, _421, (*spvDescriptorSet0.support_buffer));
                int _425 = _275;
                int _427 = 1;
                int _429 = _56(_425, _427, (*spvDescriptorSet0.support_buffer));
                int3 _2100 = int3(_423, _429, _277);
                float3 _431 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2100.xy), uint(_2100.z), 0).xyz;
                float _433 = _431.x;
                float _435 = _431.y;
                float _437 = _431.z;
                _413 = _433;
                _415 = _435;
                _417 = _437;
            }
            float _439 = _413;
            float _441 = _415;
            float _443 = _417;
            if (!_221)
            {
                _231 = 0.0;
                _233 = 0.0;
            }
            float _445 = _231;
            float _447 = _233;
            float _449 = _445;
            float _451 = _447;
            if (!_221)
            {
                _235 = 0.0;
                _237 = 0.0;
            }
            float _453 = _235;
            float _455 = _237;
            float _457 = _453;
            float _459 = _455;
            if (!_221)
            {
                _239 = 0.0;
            }
            float _461 = _239;
            float _463 = _461;
            if (!_221)
            {
                _241 = 0.0;
            }
            float _465 = _241;
            float _467 = _465;
            if (!_221)
            {
                _285 = 0.0;
                _243 = 0.0;
            }
            float _469 = _285;
            float _471 = _243;
            float _473 = _469;
            float _475 = _471;
            if (!_221)
            {
                _245 = 0.0;
            }
            float _477 = _245;
            bool _479 = !_221;
            float _481 = _477;
            if (!_479)
            {
                int _483 = _131;
                int _485 = 1;
                int _487 = _56(_483, _485, (*spvDescriptorSet0.support_buffer));
                int _489 = _275;
                int _491 = 1;
                int _493 = _56(_489, _491, (*spvDescriptorSet0.support_buffer));
                int3 _2171 = int3(_487, _493, 2);
                float3 _495 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2171.xy), uint(_2171.z), 0).xyz;
                float _497 = _495.x;
                float _499 = _495.y;
                float _501 = _495.z;
                _473 = _499;
                _287 = 2.8025969286496341418474591665798e-45;
                _475 = _497;
                _457 = _501;
                _481 = _443;
                _463 = _439;
                _449 = _409;
                _467 = _441;
                _451 = _407;
                _459 = _411;
            }
            float _503 = _473;
            int _505 = as_type<int>(_287);
            float _507 = _475;
            float _509 = _457;
            float _511 = _481;
            float _513 = _463;
            float _515 = _449;
            float _517 = _467;
            float _519 = _451;
            float _521 = _459;
            bool _523 = !_217;
            _119 = _509;
            int _525 = as_type<int>(_503);
            int _527 = _505;
            float _529 = _507;
            float _531 = _515;
            float _533 = _519;
            float _535 = _521;
            float _537 = _515;
            float _539 = _521;
            if (!_523)
            {
                int _541 = _89 + 28;
                uint _543 = uint(int(uint(_541) >> uint(2)));
                uint _545 = uint(int(uint(int(_543)) >> uint(2)));
                int _547 = int(_543) & 3;
                float _549 = (*spvDescriptorSet0.cp_c5)._m0[int(_545)][_547];
                int _551 = _89 + 20;
                uint _553 = uint(int(uint(_551) >> uint(2)));
                uint _555 = uint(int(uint(int(_553)) >> uint(2)));
                int _557 = int(_553) & 3;
                float _559 = (*spvDescriptorSet0.cp_c5)._m0[int(_555)][_557];
                float _561 = _315 * _549;
                float _563 = _311 * _549;
                float _565 = _345 * _549;
                float _567 = _377 * _549;
                float _569 = _347 * _549;
                float _571 = _379 * _549;
                float _573 = fma(_511, _559, _561);
                float _575 = _313 * _549;
                float _577 = fma(_513, _559, _563);
                float _579 = fma(_515, _559, _565);
                float _581 = _573 * 0.15915493667125701904296875;
                float _583 = fma(_517, _559, _575);
                float _585 = _577 * 0.15915493667125701904296875;
                float _587 = _343 * _549;
                float _589 = _581 * 6.283185482025146484375;
                float _591 = cos(_589);
                float _593 = _583 * 0.15915493667125701904296875;
                float _595 = fma(_503, _559, _567);
                float _597 = fma(_519, _559, _587);
                float _599 = fma(_521, _559, _569);
                float _601 = fma(_509, _559, _571);
                float _603 = _585 * 6.283185482025146484375;
                float _605 = sin(_603);
                float _607 = _585 * 6.283185482025146484375;
                float _609 = cos(_607);
                float _611 = _593 * 6.283185482025146484375;
                float _613 = sin(_611);
                float _615 = _375 * _549;
                float _617 = _605 * _591;
                float _619 = fma(_507, _559, _615);
                float _621 = _581 * 6.283185482025146484375;
                float _623 = sin(_621);
                float _625 = _609 * _591;
                float _627 = _593 * 6.283185482025146484375;
                float _629 = cos(_627);
                float _631 = _605 * _613;
                float _633 = _623 * _609;
                float _635 = _605 * _623;
                float _637 = -_633;
                float _639 = fma(_591, _631, _637);
                float _641 = _609 * _629;
                float _643 = _623 * _629;
                float _645 = _605 * _629;
                float _647 = fma(_623, _631, _625);
                float _649 = _629 * _591;
                float _651 = fma(_613, _625, _635);
                float _653 = -_617;
                float _655 = fma(_613, _633, _653);
                _525 = as_type<int>(_617);
                _657 = as_type<int>(_629);
                _659 = _649;
                _661 = _639;
                _663 = _655;
                _665 = _647;
                _667 = _613;
                _527 = as_type<int>(_549);
                _529 = _633;
                _247 = as_type<int>(_559);
                _531 = _579;
                _533 = _631;
                _535 = _599;
                _537 = _579;
                _669 = _645;
                _671 = _639;
                _673 = _647;
                _539 = _599;
                _675 = _651;
                _677 = _655;
                _679 = _641;
                _681 = _597;
                _683 = _649;
                _685 = _643;
                _687 = _613;
                _689 = as_type<int>(_619);
                _691 = as_type<int>(_595);
                _693 = as_type<int>(_601);
                _695 = true;
            }
            else
            {
                float _697 = _513 * 0.15915493667125701904296875;
                float _699 = _511 * 0.15915493667125701904296875;
                float _701 = _517 * 0.15915493667125701904296875;
                float _703 = _697 * 6.283185482025146484375;
                float _705 = cos(_703);
                float _707 = _699 * 6.283185482025146484375;
                float _709 = sin(_707);
                float _711 = _699 * 6.283185482025146484375;
                float _713 = cos(_711);
                float _715 = _701 * 6.283185482025146484375;
                float _717 = cos(_715);
                float _719 = _709 * _705;
                float _721 = _697 * 6.283185482025146484375;
                float _723 = sin(_721);
                float _725 = _705 * _713;
                float _727 = _701 * 6.283185482025146484375;
                float _729 = sin(_727);
                float _731 = _705 * _717;
                float _733 = _717 * _713;
                float _735 = _709 * _717;
                float _737 = _723 * _717;
                float _739 = _723 * _709;
                float _741 = _723 * _713;
                float _743 = _723 * _729;
                float _745 = -_741;
                float _747 = fma(_729, _719, _745);
                float _749 = -_719;
                float _751 = fma(_713, _743, _749);
                float _753 = fma(_709, _743, _725);
                float _755 = fma(_729, _725, _739);
                _657 = as_type<int>(_741);
                _659 = _733;
                _661 = _751;
                _663 = _747;
                _665 = _753;
                _667 = _729;
                _669 = _737;
                _671 = _751;
                _673 = _753;
                _675 = _755;
                _677 = _747;
                _679 = _731;
                _681 = _519;
                _683 = _733;
                _685 = _735;
                _687 = _729;
                _689 = as_type<int>(_507);
                _691 = as_type<int>(_503);
                _693 = as_type<int>(_509);
            }
            _695 = false;
            int _757 = _525;
            int _759 = _657;
            float _761 = _659;
            float _763 = _661;
            float _765 = _663;
            float _767 = _665;
            float _769 = _667;
            int _771 = _527;
            float _773 = _529;
            int _775 = _247;
            float _777 = _531;
            float _779 = _533;
            float _781 = _535;
            float _783 = _537;
            float _785 = _669;
            float _787 = _671;
            float _789 = _673;
            float _791 = _539;
            float _793 = _675;
            float _795 = _677;
            float _797 = _679;
            float _799 = _681;
            float _801 = _683;
            float _803 = _685;
            float _805 = _687;
            int _807 = _689;
            int _809 = _691;
            int _811 = _693;
            float _813 = _783 * _785;
            int _815 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _817 = _815 + _131;
            float _819 = _783 * _787;
            float _821 = _783 * _789;
            float _823 = _791 * _793;
            float _825 = _791 * _795;
            float _827 = _791 * _797;
            float _829 = _799 * _801;
            int _831 = _817 * 48;
            float _833 = _799 * _803;
            float _835 = -_799;
            float _837 = fma(_835, _805, -0.0);
            int _839 = _131 + 1;
            uint _841 = uint(int(uint(_831) >> uint(2)));
            _37[int(_841)] = as_type<uint>(_829);
            int _843 = _831 + 4;
            uint _845 = uint(int(uint(_843) >> uint(2)));
            _37[int(_845)] = as_type<uint>(_819);
            int _847 = _831 + 8;
            uint _849 = uint(int(uint(_847) >> uint(2)));
            _37[int(_849)] = as_type<uint>(_823);
            int _851 = _831 + 12;
            uint _853 = uint(int(uint(_851) >> uint(2)));
            _37[int(_853)] = uint(_807);
            bool _855 = uint(_839) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _857 = _831 + 16;
            uint _859 = uint(int(uint(_857) >> uint(2)));
            _37[int(_859)] = as_type<uint>(_833);
            int _861 = _831 + 20;
            uint _863 = uint(int(uint(_861) >> uint(2)));
            _37[int(_863)] = as_type<uint>(_821);
            int _865 = _831 + 24;
            uint _867 = uint(int(uint(_865) >> uint(2)));
            _37[int(_867)] = as_type<uint>(_825);
            int _869 = _831 + 28;
            uint _871 = uint(int(uint(_869) >> uint(2)));
            _37[int(_871)] = uint(_809);
            int _873 = _831 + 32;
            uint _875 = uint(int(uint(_873) >> uint(2)));
            _37[int(_875)] = as_type<uint>(_837);
            int _877 = _831 + 36;
            uint _879 = uint(int(uint(_877) >> uint(2)));
            _37[int(_879)] = as_type<uint>(_813);
            int _881 = _831 + 40;
            uint _883 = uint(int(uint(_881) >> uint(2)));
            _37[int(_883)] = as_type<uint>(_827);
            int _885 = _831 + 44;
            uint _887 = uint(int(uint(_885) >> uint(2)));
            _37[int(_887)] = uint(_811);
            _129 = !_855;
            _91 = _839;
            _93 = _757;
            _95 = _759;
            _97 = _829;
            _99 = _761;
            _101 = _833;
            _103 = _825;
            _105 = _821;
            _107 = _763;
            _109 = _765;
            _111 = _767;
            _113 = _769;
            _115 = _771;
            _117 = _773;
            _121 = _775;
            _123 = _777;
            _125 = _779;
            _127 = _781;
        } while (_129);
    }
    bool _889 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _891 = !_889;
    if (!_891)
    {
        int _893 = 1;
        bool _895;
        do
        {
            int _897 = _893;
            int _899 = _897 * 112;
            int _901 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _903 = _901 + _897;
            int _905 = _897 + 1;
            uint _907 = uint(int(uint(_899) >> uint(2)));
            uint _909 = uint(int(uint(int(_907)) >> uint(2)));
            int _911 = int(_907) & 3;
            float _913 = (*spvDescriptorSet0.cp_c6)._m0[int(_909)][_911];
            int _915 = _903 * 48;
            bool _917 = uint(_905) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _919 = _915 + 16;
            uint _921 = uint(int(uint(_919) >> uint(2)));
            float _923 = as_type<float>(_37[int(_921)]);
            int _925 = _915 + 20;
            uint _927 = uint(int(uint(_925) >> uint(2)));
            float _929 = as_type<float>(_37[int(_927)]);
            int _931 = _915 + 24;
            uint _933 = uint(int(uint(_931) >> uint(2)));
            float _935 = as_type<float>(_37[int(_933)]);
            int _937 = _915 + 28;
            uint _939 = uint(int(uint(_937) >> uint(2)));
            float _941 = as_type<float>(_37[int(_939)]);
            int _943 = _915 + 32;
            uint _945 = uint(int(uint(_943) >> uint(2)));
            float _947 = as_type<float>(_37[int(_945)]);
            int _949 = _915 + 36;
            uint _951 = uint(int(uint(_949) >> uint(2)));
            float _953 = as_type<float>(_37[int(_951)]);
            int _955 = _915 + 40;
            uint _957 = uint(int(uint(_955) >> uint(2)));
            float _959 = as_type<float>(_37[int(_957)]);
            int _961 = _915 + 44;
            uint _963 = uint(int(uint(_961) >> uint(2)));
            float _965 = as_type<float>(_37[int(_963)]);
            int _967 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _969 = _967 + as_type<int>(_913);
            int _971 = _969 * 48;
            uint _973 = uint(int(uint(_915) >> uint(2)));
            float _975 = as_type<float>(_37[int(_973)]);
            int _977 = _915 + 4;
            uint _979 = uint(int(uint(_977) >> uint(2)));
            float _981 = as_type<float>(_37[int(_979)]);
            int _983 = _915 + 8;
            uint _985 = uint(int(uint(_983) >> uint(2)));
            float _987 = as_type<float>(_37[int(_985)]);
            int _989 = _915 + 12;
            uint _991 = uint(int(uint(_989) >> uint(2)));
            float _993 = as_type<float>(_37[int(_991)]);
            uint _995 = uint(int(uint(_971) >> uint(2)));
            float _997 = as_type<float>(_37[int(_995)]);
            int _999 = _971 + 4;
            uint _1001 = uint(int(uint(_999) >> uint(2)));
            float _1003 = as_type<float>(_37[int(_1001)]);
            int _1005 = _971 + 8;
            uint _1007 = uint(int(uint(_1005) >> uint(2)));
            float _1009 = as_type<float>(_37[int(_1007)]);
            int _1011 = _971 + 12;
            uint _1013 = uint(int(uint(_1011) >> uint(2)));
            float _1015 = as_type<float>(_37[int(_1013)]);
            int _1017 = _971 + 16;
            uint _1019 = uint(int(uint(_1017) >> uint(2)));
            float _1021 = as_type<float>(_37[int(_1019)]);
            int _1023 = _971 + 20;
            uint _1025 = uint(int(uint(_1023) >> uint(2)));
            float _1027 = as_type<float>(_37[int(_1025)]);
            int _1029 = _971 + 24;
            uint _1031 = uint(int(uint(_1029) >> uint(2)));
            float _1033 = as_type<float>(_37[int(_1031)]);
            int _1035 = _971 + 28;
            uint _1037 = uint(int(uint(_1035) >> uint(2)));
            float _1039 = as_type<float>(_37[int(_1037)]);
            int _1041 = _971 + 32;
            uint _1043 = uint(int(uint(_1041) >> uint(2)));
            float _1045 = as_type<float>(_37[int(_1043)]);
            int _1047 = _971 + 36;
            uint _1049 = uint(int(uint(_1047) >> uint(2)));
            float _1051 = as_type<float>(_37[int(_1049)]);
            int _1053 = _971 + 40;
            uint _1055 = uint(int(uint(_1053) >> uint(2)));
            float _1057 = as_type<float>(_37[int(_1055)]);
            int _1059 = _971 + 44;
            uint _1061 = uint(int(uint(_1059) >> uint(2)));
            float _1063 = as_type<float>(_37[int(_1061)]);
            float _1065 = _941 * _1003;
            float _1067 = _929 * _1003;
            float _1069 = _923 * _1003;
            float _1071 = _935 * _1003;
            float _1073 = fma(_993, _997, _1065);
            float _1075 = fma(_981, _997, _1067);
            float _1077 = fma(_975, _997, _1069);
            float _1079 = fma(_987, _997, _1071);
            float _1081 = fma(_965, _1009, _1073);
            float _1083 = fma(_953, _1009, _1075);
            float _1085 = _929 * _1027;
            float _1087 = _923 * _1027;
            float _1089 = _1015 + _1081;
            float _1091 = _941 * _1027;
            float _1093 = _935 * _1027;
            float _1095 = fma(_981, _1021, _1085);
            float _1097 = fma(_947, _1009, _1077);
            float _1099 = fma(_993, _1021, _1091);
            float _1101 = fma(_987, _1021, _1093);
            float _1103 = fma(_953, _1033, _1095);
            float _1105 = _941 * _1051;
            float _1107 = _923 * _1051;
            float _1109 = _929 * _1051;
            float _1111 = _935 * _1051;
            float _1113 = fma(_993, _1045, _1105);
            float _1115 = fma(_975, _1021, _1087);
            float _1117 = fma(_965, _1033, _1099);
            float _1119 = fma(_975, _1045, _1107);
            float _1121 = fma(_981, _1045, _1109);
            float _1123 = fma(_987, _1045, _1111);
            float _1125 = fma(_965, _1057, _1113);
            float _1127 = fma(_947, _1033, _1115);
            float _1129 = fma(_959, _1009, _1079);
            float _1131 = fma(_959, _1033, _1101);
            float _1133 = _1039 + _1117;
            float _1135 = fma(_947, _1057, _1119);
            float _1137 = fma(_953, _1057, _1121);
            float _1139 = fma(_959, _1057, _1123);
            float _1141 = _1063 + _1125;
            uint _1143 = uint(int(uint(_915) >> uint(2)));
            _37[int(_1143)] = as_type<uint>(_1097);
            int _1145 = _915 + 4;
            uint _1147 = uint(int(uint(_1145) >> uint(2)));
            _37[int(_1147)] = as_type<uint>(_1083);
            int _1149 = _915 + 8;
            uint _1151 = uint(int(uint(_1149) >> uint(2)));
            _37[int(_1151)] = as_type<uint>(_1129);
            int _1153 = _915 + 12;
            uint _1155 = uint(int(uint(_1153) >> uint(2)));
            _37[int(_1155)] = as_type<uint>(_1089);
            int _1157 = _915 + 16;
            uint _1159 = uint(int(uint(_1157) >> uint(2)));
            _37[int(_1159)] = as_type<uint>(_1127);
            int _1161 = _915 + 20;
            uint _1163 = uint(int(uint(_1161) >> uint(2)));
            _37[int(_1163)] = as_type<uint>(_1103);
            int _1165 = _915 + 24;
            uint _1167 = uint(int(uint(_1165) >> uint(2)));
            _37[int(_1167)] = as_type<uint>(_1131);
            int _1169 = _915 + 28;
            uint _1171 = uint(int(uint(_1169) >> uint(2)));
            _37[int(_1171)] = as_type<uint>(_1133);
            int _1173 = _915 + 32;
            uint _1175 = uint(int(uint(_1173) >> uint(2)));
            _37[int(_1175)] = as_type<uint>(_1135);
            int _1177 = _915 + 36;
            uint _1179 = uint(int(uint(_1177) >> uint(2)));
            _37[int(_1179)] = as_type<uint>(_1137);
            int _1181 = _915 + 40;
            uint _1183 = uint(int(uint(_1181) >> uint(2)));
            _37[int(_1183)] = as_type<uint>(_1139);
            int _1185 = _915 + 44;
            uint _1187 = uint(int(uint(_1185) >> uint(2)));
            _37[int(_1187)] = as_type<uint>(_1141);
            _895 = !_917;
            _893 = _905;
        } while (_895);
    }
    if (!_72)
    {
        return;
    }
    int _1189 = 0;
    bool _1191;
    do
    {
        int _1193 = _1189;
        int _1195 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1197 = _1195 + _1193;
        int _1199 = _1193 * 112;
        int _1201 = _1197 * 48;
        int _1203 = _1199 + 80;
        uint _1205 = uint(int(uint(_1203) >> uint(2)));
        uint _1207 = uint(int(uint(int(_1205)) >> uint(2)));
        int _1209 = int(_1205) & 3;
        float _1211 = (*spvDescriptorSet0.cp_c6)._m0[int(_1207)][_1209];
        int _1213 = int(_1205) + 1;
        uint _1215 = uint(int(uint(_1213) >> uint(2)));
        int _1217 = _1213 & 3;
        float _1219 = (*spvDescriptorSet0.cp_c6)._m0[int(_1215)][_1217];
        uint _1221 = uint(int(uint(_1201) >> uint(2)));
        float _1223 = as_type<float>(_37[int(_1221)]);
        int _1225 = _1201 + 4;
        uint _1227 = uint(int(uint(_1225) >> uint(2)));
        float _1229 = as_type<float>(_37[int(_1227)]);
        int _1231 = _1201 + 8;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        float _1235 = as_type<float>(_37[int(_1233)]);
        int _1237 = _1201 + 12;
        uint _1239 = uint(int(uint(_1237) >> uint(2)));
        float _1241 = as_type<float>(_37[int(_1239)]);
        int _1243 = _1201 + 16;
        uint _1245 = uint(int(uint(_1243) >> uint(2)));
        float _1247 = as_type<float>(_37[int(_1245)]);
        int _1249 = _1201 + 20;
        uint _1251 = uint(int(uint(_1249) >> uint(2)));
        float _1253 = as_type<float>(_37[int(_1251)]);
        int _1255 = _1201 + 24;
        uint _1257 = uint(int(uint(_1255) >> uint(2)));
        float _1259 = as_type<float>(_37[int(_1257)]);
        int _1261 = _1201 + 28;
        uint _1263 = uint(int(uint(_1261) >> uint(2)));
        float _1265 = as_type<float>(_37[int(_1263)]);
        int _1267 = _1199 + 88;
        uint _1269 = uint(int(uint(_1267) >> uint(2)));
        uint _1271 = uint(int(uint(int(_1269)) >> uint(2)));
        int _1273 = int(_1269) & 3;
        float _1275 = (*spvDescriptorSet0.cp_c6)._m0[int(_1271)][_1273];
        int _1277 = int(_1269) + 1;
        uint _1279 = uint(int(uint(_1277) >> uint(2)));
        int _1281 = _1277 & 3;
        float _1283 = (*spvDescriptorSet0.cp_c6)._m0[int(_1279)][_1281];
        int _1285 = _1201 + 32;
        uint _1287 = uint(int(uint(_1285) >> uint(2)));
        float _1289 = as_type<float>(_37[int(_1287)]);
        int _1291 = _1201 + 36;
        uint _1293 = uint(int(uint(_1291) >> uint(2)));
        float _1295 = as_type<float>(_37[int(_1293)]);
        int _1297 = _1201 + 40;
        uint _1299 = uint(int(uint(_1297) >> uint(2)));
        float _1301 = as_type<float>(_37[int(_1299)]);
        int _1303 = _1201 + 44;
        uint _1305 = uint(int(uint(_1303) >> uint(2)));
        float _1307 = as_type<float>(_37[int(_1305)]);
        int _1309 = _1199 + 64;
        uint _1311 = uint(int(uint(_1309) >> uint(2)));
        uint _1313 = uint(int(uint(int(_1311)) >> uint(2)));
        int _1315 = int(_1311) & 3;
        float _1317 = (*spvDescriptorSet0.cp_c6)._m0[int(_1313)][_1315];
        int _1319 = int(_1311) + 1;
        uint _1321 = uint(int(uint(_1319) >> uint(2)));
        int _1323 = _1319 & 3;
        float _1325 = (*spvDescriptorSet0.cp_c6)._m0[int(_1321)][_1323];
        int _1327 = _1199 + 72;
        uint _1329 = uint(int(uint(_1327) >> uint(2)));
        uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
        int _1333 = int(_1329) & 3;
        float _1335 = (*spvDescriptorSet0.cp_c6)._m0[int(_1331)][_1333];
        int _1337 = int(_1329) + 1;
        uint _1339 = uint(int(uint(_1337) >> uint(2)));
        int _1341 = _1337 & 3;
        float _1343 = (*spvDescriptorSet0.cp_c6)._m0[int(_1339)][_1341];
        int _1345 = _1199 + 104;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
        int _1351 = int(_1347) & 3;
        float _1353 = (*spvDescriptorSet0.cp_c6)._m0[int(_1349)][_1351];
        int _1355 = int(_1347) + 1;
        uint _1357 = uint(int(uint(_1355) >> uint(2)));
        int _1359 = _1355 & 3;
        float _1361 = (*spvDescriptorSet0.cp_c6)._m0[int(_1357)][_1359];
        int _1363 = _1199 + 96;
        uint _1365 = uint(int(uint(_1363) >> uint(2)));
        uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
        int _1369 = int(_1365) & 3;
        float _1371 = (*spvDescriptorSet0.cp_c6)._m0[int(_1367)][_1369];
        int _1373 = int(_1365) + 1;
        uint _1375 = uint(int(uint(_1373) >> uint(2)));
        int _1377 = _1373 & 3;
        float _1379 = (*spvDescriptorSet0.cp_c6)._m0[int(_1375)][_1377];
        float _1381 = _1229 * _1211;
        float _1383 = _1229 * _1219;
        float _1385 = _1229 * _1275;
        float _1387 = _1229 * _1283;
        float _1389 = fma(_1223, _1317, _1381);
        float _1391 = fma(_1223, _1325, _1383);
        float _1393 = fma(_1223, _1335, _1385);
        float _1395 = fma(_1223, _1343, _1387);
        float _1397 = _1253 * _1211;
        float _1399 = _1253 * _1219;
        float _1401 = _1253 * _1275;
        float _1403 = _1253 * _1283;
        float _1405 = _1295 * _1211;
        float _1407 = fma(_1247, _1317, _1397);
        float _1409 = fma(_1247, _1325, _1399);
        float _1411 = fma(_1247, _1335, _1401);
        uint _1413 = uint(int(uint(_76) >> uint(2)));
        uint _1415 = uint(int(uint(int(_1413)) >> uint(2)));
        int _1417 = int(_1413) & 3;
        float _1419 = (*spvDescriptorSet0.cp_c4)._m0[int(_1415)][_1417];
        float _1421 = fma(_1247, _1343, _1403);
        float _1423 = _1295 * _1219;
        float _1425 = _1295 * _1275;
        float _1427 = _1295 * _1283;
        float _1429 = fma(_1289, _1317, _1405);
        float _1431 = fma(_1289, _1325, _1423);
        float _1433 = fma(_1289, _1335, _1425);
        int _1435 = _1199 + 16;
        uint _1437 = uint(int(uint(_1435) >> uint(2)));
        uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
        int _1441 = int(_1437) & 3;
        float _1443 = (*spvDescriptorSet0.cp_c6)._m0[int(_1439)][_1441];
        int _1445 = int(_1437) + 1;
        uint _1447 = uint(int(uint(_1445) >> uint(2)));
        int _1449 = _1445 & 3;
        float _1451 = (*spvDescriptorSet0.cp_c6)._m0[int(_1447)][_1449];
        float _1453 = fma(_1289, _1343, _1427);
        float _1455 = fma(_1259, _1361, _1421);
        float _1457 = fma(_1235, _1371, _1389);
        float _1459 = fma(_1235, _1379, _1391);
        float _1461 = fma(_1235, _1353, _1393);
        float _1463 = fma(_1235, _1361, _1395);
        float _1465 = fma(_1259, _1371, _1407);
        int _1467 = _1199 + 24;
        uint _1469 = uint(int(uint(_1467) >> uint(2)));
        uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
        int _1473 = int(_1469) & 3;
        float _1475 = (*spvDescriptorSet0.cp_c6)._m0[int(_1471)][_1473];
        int _1477 = int(_1469) + 1;
        uint _1479 = uint(int(uint(_1477) >> uint(2)));
        int _1481 = _1477 & 3;
        float _1483 = (*spvDescriptorSet0.cp_c6)._m0[int(_1479)][_1481];
        float _1485 = fma(_1259, _1379, _1409);
        float _1487 = fma(_1259, _1353, _1411);
        float _1489 = fma(_1301, _1371, _1429);
        float _1491 = fma(_1301, _1379, _1431);
        float _1493 = fma(_1301, _1361, _1453);
        float _1495 = fma(_1301, _1353, _1433);
        float _1497 = _1265 + _1455;
        int _1499 = _1199 + 32;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
        int _1505 = int(_1501) & 3;
        float _1507 = (*spvDescriptorSet0.cp_c6)._m0[int(_1503)][_1505];
        int _1509 = int(_1501) + 1;
        uint _1511 = uint(int(uint(_1509) >> uint(2)));
        int _1513 = _1509 & 3;
        float _1515 = (*spvDescriptorSet0.cp_c6)._m0[int(_1511)][_1513];
        float _1517 = _1307 + _1493;
        float _1519 = _1241 + _1463;
        int _1521 = _1199 + 48;
        uint _1523 = uint(int(uint(_1521) >> uint(2)));
        uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
        int _1527 = int(_1523) & 3;
        float _1529 = (*spvDescriptorSet0.cp_c6)._m0[int(_1525)][_1527];
        int _1531 = int(_1523) + 1;
        uint _1533 = uint(int(uint(_1531) >> uint(2)));
        int _1535 = _1531 & 3;
        float _1537 = (*spvDescriptorSet0.cp_c6)._m0[int(_1533)][_1535];
        float _1539 = _1465 * _1451;
        float _1541 = _1485 * _1451;
        float _1543 = _1497 * _1451;
        float _1545 = _1487 * _1451;
        float _1547 = fma(_1457, _1443, _1539);
        float _1549 = fma(_1459, _1443, _1541);
        float _1551 = fma(_1519, _1443, _1543);
        float _1553 = fma(_1461, _1443, _1545);
        int _1555 = _1199 + 40;
        uint _1557 = uint(int(uint(_1555) >> uint(2)));
        uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
        int _1561 = int(_1557) & 3;
        float _1563 = (*spvDescriptorSet0.cp_c6)._m0[int(_1559)][_1561];
        int _1565 = int(_1557) + 1;
        uint _1567 = uint(int(uint(_1565) >> uint(2)));
        int _1569 = _1565 & 3;
        float _1571 = (*spvDescriptorSet0.cp_c6)._m0[int(_1567)][_1569];
        float _1573 = fma(_1489, _1475, _1547);
        float _1575 = fma(_1517, _1475, _1551);
        float _1577 = fma(_1491, _1475, _1549);
        float _1579 = fma(_1495, _1475, _1553);
        float _1581 = _1575 + _1483;
        float _1583 = _1497 * _1515;
        int _1585 = _1199 + 56;
        uint _1587 = uint(int(uint(_1585) >> uint(2)));
        uint _1589 = uint(int(uint(int(_1587)) >> uint(2)));
        int _1591 = int(_1587) & 3;
        float _1593 = (*spvDescriptorSet0.cp_c6)._m0[int(_1589)][_1591];
        int _1595 = int(_1587) + 1;
        uint _1597 = uint(int(uint(_1595) >> uint(2)));
        int _1599 = _1595 & 3;
        float _1601 = (*spvDescriptorSet0.cp_c6)._m0[int(_1597)][_1599];
        float _1603 = _1465 * _1515;
        float _1605 = _1485 * _1515;
        int _1607 = as_type<int>(_1419) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1609 = _1607 + _1193;
        int _1611 = _1193 + 1;
        float _1613 = _1487 * _1515;
        float _1615 = fma(_1519, _1507, _1583);
        float _1617 = _1497 * _1537;
        float _1619 = _1465 * _1537;
        float _1621 = _1485 * _1537;
        float _1623 = fma(_1459, _1507, _1605);
        float _1625 = _1487 * _1537;
        float _1627 = fma(_1519, _1529, _1617);
        float _1629 = fma(_1457, _1529, _1619);
        int _1631 = _1609 * 48;
        bool _1633 = uint(_1611) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1635 = fma(_1459, _1529, _1621);
        float _1637 = fma(_1457, _1507, _1603);
        float _1639 = fma(_1461, _1507, _1613);
        float _1641 = fma(_1517, _1563, _1615);
        float _1643 = fma(_1461, _1529, _1625);
        float _1645 = fma(_1491, _1563, _1623);
        float _1647 = fma(_1489, _1563, _1637);
        float _1649 = fma(_1495, _1563, _1639);
        float _1651 = fma(_1517, _1593, _1627);
        float _1653 = fma(_1489, _1593, _1629);
        float _1655 = fma(_1491, _1593, _1635);
        int _1657 = _1631 + 16;
        float _1659 = _1641 + _1571;
        int _1661 = _1631 + 32;
        float _1663 = fma(_1495, _1593, _1643);
        float _1665 = _1651 + _1601;
        int _1667 = _1631 + 48;
        uint _1669 = uint(int(uint(_1657) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1669)] = as_type<uint>(_1573);
        int _1671 = _1657 + 4;
        uint _1673 = uint(int(uint(_1671) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1673)] = as_type<uint>(_1577);
        int _1675 = _1657 + 8;
        uint _1677 = uint(int(uint(_1675) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1677)] = as_type<uint>(_1579);
        int _1679 = _1657 + 12;
        uint _1681 = uint(int(uint(_1679) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1681)] = as_type<uint>(_1581);
        uint _1683 = uint(int(uint(_1661) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1683)] = as_type<uint>(_1647);
        int _1685 = _1661 + 4;
        uint _1687 = uint(int(uint(_1685) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1687)] = as_type<uint>(_1645);
        int _1689 = _1661 + 8;
        uint _1691 = uint(int(uint(_1689) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1691)] = as_type<uint>(_1649);
        int _1693 = _1661 + 12;
        uint _1695 = uint(int(uint(_1693) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1695)] = as_type<uint>(_1659);
        uint _1697 = uint(int(uint(_1667) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1697)] = as_type<uint>(_1653);
        int _1699 = _1667 + 4;
        uint _1701 = uint(int(uint(_1699) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1701)] = as_type<uint>(_1655);
        int _1703 = _1667 + 8;
        uint _1705 = uint(int(uint(_1703) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1705)] = as_type<uint>(_1663);
        int _1707 = _1667 + 12;
        uint _1709 = uint(int(uint(_1707) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1709)] = as_type<uint>(_1665);
        _1191 = !_1633;
        _1189 = _1611;
    } while (_1191);
}

