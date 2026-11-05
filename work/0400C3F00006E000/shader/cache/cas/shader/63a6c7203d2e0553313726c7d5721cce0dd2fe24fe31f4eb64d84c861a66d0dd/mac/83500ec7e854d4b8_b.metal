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
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _5054, thread const int& _5055, constant _10& support_buffer)
{
    int _5058 = 1 + _5055;
    float _5060 = support_buffer._m5[_5058].x;
    bool _5062 = _5060 == 1.0;
    if (_5062)
    {
        return _5054;
    }
    float _5064 = float(_5054);
    float _5066 = _5064 * _5060;
    int _5068 = int(_5066);
    return _5068;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4742, thread const int& _4743, thread const int& _4744, thread const int& _4745, thread int& _4746, thread int& _4747, thread int& _4748, thread int& _4749, thread int& _4750, thread int& _4751)
{
    float _4754 = as_type<float>(_4744) + 0.0;
    bool _4756 = _4754 != 0.0;
    bool _4758 = isnan(_4754);
    bool _4760 = _4756 || _4758;
    bool _4762 = isnan(0.0);
    bool _4764 = _4760 || _4762;
    int _4766 = as_type<int>(_4754);
    int _4768 = _4743;
    int _4770 = _4744;
    int _4772 = _4764 ? (-1) : 0;
    if (!_4764)
    {
        float _4774 = as_type<float>(_4744) * 1.0;
        _4766 = as_type<int>(_4774);
    }
    int _4776 = _4766;
    bool _4778 = !_4764;
    int _4780 = _4776;
    if (!_4778)
    {
        float _4782 = as_type<float>(_4744) + 0.0;
        bool _4784 = _4782 >= 0.0;
        bool _4786 = isnan(_4782);
        bool _4788 = _4784 || _4786;
        bool _4790 = isnan(0.0);
        bool _4792 = _4788 || _4790;
        int _4794 = as_type<int>(_4782);
        _4772 = _4792 ? (-1) : 0;
        if (!_4792)
        {
            _4794 = 2147483647;
        }
        int _4796 = _4794;
        bool _4798 = !_4792;
        _4780 = _4796;
        if (!_4798)
        {
            float _4800 = as_type<float>(_4744) + 0.0;
            bool _4802 = _4800 > as_type<float>(0x7f800000u /* inf */);
            bool _4804 = isnan(_4800);
            bool _4806 = _4802 || _4804;
            bool _4808 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4810 = _4806 || _4808;
            int _4812 = as_type<int>(_4800);
            _4772 = _4810 ? (-1) : 0;
            if (_4810)
            {
                float _4814 = as_type<float>(_4744) + 1.0;
                _4812 = as_type<int>(_4814);
            }
            int _4816 = _4812;
            _4780 = _4816;
            if (!_4810)
            {
                float _4818 = 0.0 + as_type<float>(_4744);
                bool _4820 = _4818 != as_type<float>(0x7f800000u /* inf */);
                bool _4822 = isnan(_4818);
                bool _4824 = _4820 || _4822;
                bool _4826 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4828 = _4824 || _4826;
                int _4830 = as_type<int>(_4818);
                _4772 = _4828 ? (-1) : 0;
                if (!_4828)
                {
                    _4830 = _4744;
                }
                int _4832 = _4830;
                bool _4834 = !_4828;
                _4780 = _4832;
                if (!_4834)
                {
                    float _4836 = as_type<float>(_4744) * 18446744073709551616.0;
                    float _4838 = rsqrt(_4836);
                    float _4840 = _4836 * _4838;
                    float _4842 = _4838 * 0.5;
                    float _4844 = -_4840;
                    float _4846 = 0.0 + _4844;
                    float _4848 = fma(_4842, _4846, 0.5);
                    float _4850 = fma(_4840, _4848, _4840);
                    float _4852 = -_4850;
                    float _4854 = 0.0 + _4852;
                    float _4856 = fma(_4850, _4854, _4836);
                    float _4858 = fma(_4842, _4856, _4850);
                    float _4860 = _4858 * 2.3283064365386962890625e-10;
                    _4780 = as_type<int>(_4860);
                    _4768 = as_type<int>(_4850);
                    _4770 = as_type<int>(_4846);
                }
            }
        }
    }
    int _4862 = _4780;
    int _4864 = _4768;
    int _4866 = _4770;
    int _4868 = _4772;
    _4746 = _4862;
    _4747 = _4745;
    _4748 = 0;
    _4749 = _4864;
    _4750 = _4866;
    _4751 = _4868;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1043 = false;
    bool _593 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    if (_72)
    {
        return;
    }
    bool _74 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _76 = _68 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _78 = _76 << 4;
    bool _80 = !_74;
    if (!_80)
    {
        int _82 = 0;
        int _577;
        int _579;
        int _581;
        int _583;
        int _585;
        int _587;
        float _589;
        float _591;
        do
        {
            int _84 = _82;
            uint _87 = uint(int(uint(_78) >> uint(2)));
            uint _89 = uint(int(uint(int(_87)) >> uint(2)));
            int _91 = int(_87) & 3;
            float _93 = (*spvDescriptorSet0.cp_c4)._m0[int(_89)][_91];
            int _95 = as_type<int>(_93) * 48;
            uint _97 = uint(int(uint(_95) >> uint(2)));
            uint _99 = uint(int(uint(int(_97)) >> uint(2)));
            int _101 = int(_97) & 3;
            float _103 = (*spvDescriptorSet0.cp_c5)._m0[int(_99)][_101];
            int _105 = int(_97) + 1;
            uint _107 = uint(int(uint(_105) >> uint(2)));
            int _109 = _105 & 3;
            float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
            int _113 = _95 + 8;
            uint _115 = uint(int(uint(_113) >> uint(2)));
            uint _117 = uint(int(uint(int(_115)) >> uint(2)));
            int _119 = int(_115) & 3;
            float _121 = (*spvDescriptorSet0.cp_c5)._m0[int(_117)][_119];
            int _123 = int(_115) + 1;
            uint _125 = uint(int(uint(_123) >> uint(2)));
            int _127 = _123 & 3;
            float _129 = (*spvDescriptorSet0.cp_c5)._m0[int(_125)][_127];
            int _131 = _84;
            int _133 = 0;
            int _135 = _58(_131, _133, (*spvDescriptorSet0.support_buffer));
            int _137 = as_type<int>(_103);
            int _139 = 0;
            int _141 = _58(_137, _139, (*spvDescriptorSet0.support_buffer));
            int3 _2003 = int3(_135, _141, 1);
            float3 _145 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2003.xy), uint(_2003.z), 0).xyz;
            float _147 = _145.x;
            float _149 = _145.y;
            float _151 = _145.z;
            int _153 = _84;
            int _155 = 0;
            int _157 = _58(_153, _155, (*spvDescriptorSet0.support_buffer));
            int _159 = as_type<int>(_111);
            int _161 = 0;
            int _163 = _58(_159, _161, (*spvDescriptorSet0.support_buffer));
            int3 _2021 = int3(_157, _163, 1);
            float3 _165 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2021.xy), uint(_2021.z), 0).xyz;
            float _167 = _165.x;
            float _169 = _165.y;
            float _171 = _165.z;
            int _173 = _84;
            int _175 = 0;
            int _177 = _58(_173, _175, (*spvDescriptorSet0.support_buffer));
            int _179 = as_type<int>(_103);
            int _181 = 0;
            int _183 = _58(_179, _181, (*spvDescriptorSet0.support_buffer));
            int3 _2039 = int3(_177, _183, 0);
            float3 _185 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2039.xy), uint(_2039.z), 0).xyz;
            float _187 = _185.x;
            float _189 = _185.y;
            float _191 = _185.z;
            int _193 = _84;
            int _195 = 0;
            int _197 = _58(_193, _195, (*spvDescriptorSet0.support_buffer));
            int _199 = as_type<int>(_111);
            int _201 = 0;
            int _203 = _58(_199, _201, (*spvDescriptorSet0.support_buffer));
            int3 _2057 = int3(_197, _203, 0);
            float3 _205 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2057.xy), uint(_2057.z), 0).xyz;
            float _207 = _205.x;
            float _209 = _205.y;
            float _211 = _205.z;
            int _213 = _84;
            int _215 = 1;
            int _217 = _58(_213, _215, (*spvDescriptorSet0.support_buffer));
            int _219 = as_type<int>(_121);
            int _221 = 1;
            int _223 = _58(_219, _221, (*spvDescriptorSet0.support_buffer));
            int3 _2075 = int3(_217, _223, 1);
            float3 _225 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2075.xy), uint(_2075.z), 0).xyz;
            float _227 = _225.x;
            float _229 = _225.y;
            float _231 = _225.z;
            int _233 = _84;
            int _235 = 1;
            int _237 = _58(_233, _235, (*spvDescriptorSet0.support_buffer));
            int _239 = as_type<int>(_129);
            int _241 = 1;
            int _243 = _58(_239, _241, (*spvDescriptorSet0.support_buffer));
            int3 _2093 = int3(_237, _243, 1);
            float3 _245 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2093.xy), uint(_2093.z), 0).xyz;
            float _247 = _245.x;
            float _249 = _245.y;
            float _251 = _245.z;
            int _253 = _84;
            int _255 = 0;
            int _257 = _58(_253, _255, (*spvDescriptorSet0.support_buffer));
            int _259 = as_type<int>(_103);
            int _261 = 0;
            int _263 = _58(_259, _261, (*spvDescriptorSet0.support_buffer));
            int3 _2111 = int3(_257, _263, 2);
            float3 _265 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2111.xy), uint(_2111.z), 0).xyz;
            float _267 = _265.x;
            float _269 = _265.y;
            float _271 = _265.z;
            int _273 = _84;
            int _275 = 0;
            int _277 = _58(_273, _275, (*spvDescriptorSet0.support_buffer));
            int _279 = as_type<int>(_111);
            int _281 = 0;
            int _283 = _58(_279, _281, (*spvDescriptorSet0.support_buffer));
            int3 _2129 = int3(_277, _283, 2);
            float3 _285 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2129.xy), uint(_2129.z), 0).xyz;
            float _287 = _285.x;
            float _289 = _285.y;
            float _291 = _285.z;
            int _293 = _95 + 16;
            uint _295 = uint(int(uint(_293) >> uint(2)));
            uint _297 = uint(int(uint(int(_295)) >> uint(2)));
            int _299 = int(_295) & 3;
            float _301 = (*spvDescriptorSet0.cp_c5)._m0[int(_297)][_299];
            int _303 = _95 + 24;
            uint _305 = uint(int(uint(_303) >> uint(2)));
            uint _307 = uint(int(uint(int(_305)) >> uint(2)));
            int _309 = int(_305) & 3;
            float _311 = (*spvDescriptorSet0.cp_c5)._m0[int(_307)][_309];
            float _313 = -_151;
            float _315 = _313 + _171;
            float _317 = fma(_315, _301, _151);
            float _319 = _317 * 0.5;
            float _321 = _319 * 0.15915493667125701904296875;
            float _323 = -_149;
            float _325 = _323 + _169;
            float _327 = _321 * 6.283185482025146484375;
            float _329 = sin(_327);
            float _331 = fma(_325, _301, _149);
            float _333 = -_147;
            float _335 = _333 + _167;
            float _337 = _331 * 0.5;
            float _339 = fma(_335, _301, _147);
            float _341 = _321 * 6.283185482025146484375;
            float _343 = cos(_341);
            float _345 = _337 * 0.15915493667125701904296875;
            float _347 = _339 * 0.5;
            float _349 = -_231;
            float _351 = _349 + _251;
            float _353 = -_191;
            float _355 = _353 + _211;
            float _357 = _347 * 0.15915493667125701904296875;
            float _359 = fma(_351, _311, _231);
            float _361 = _345 * 6.283185482025146484375;
            float _363 = sin(_361);
            float _365 = fma(_355, _301, _191);
            float _367 = -_271;
            float _369 = _367 + _291;
            float _371 = _359 * 0.5;
            float _373 = fma(_369, _301, _271);
            float _375 = _371 * 0.15915493667125701904296875;
            float _377 = _345 * 6.283185482025146484375;
            float _379 = cos(_377);
            float _381 = _357 * 6.283185482025146484375;
            float _383 = sin(_381);
            float _385 = _329 * _363;
            float _387 = _357 * 6.283185482025146484375;
            float _389 = cos(_387);
            float _391 = _379 * _329;
            float _393 = _343 * _379;
            float _395 = _343 * _363;
            float _397 = _383 * _385;
            float _399 = _383 * _391;
            float _401 = _389 * _385;
            float _403 = fma(_389, _393, _397);
            float _405 = _383 * _395;
            float _407 = fma(_389, _395, _399);
            float _409 = -_401;
            float _411 = fma(_383, _393, _409);
            float _413 = -_189;
            float _415 = _413 + _209;
            float _417 = -_405;
            float _419 = fma(_389, _391, _417);
            float _421 = -_187;
            float _423 = _421 + _207;
            float _425 = _375 * 6.283185482025146484375;
            float _427 = sin(_425);
            float _429 = fma(_415, _301, _189);
            float _431 = -_229;
            float _433 = _431 + _249;
            float _435 = fma(_423, _301, _187);
            float _437 = -_227;
            float _439 = _437 + _247;
            float _441 = fma(_433, _311, _229);
            float _443 = fma(_439, _311, _227);
            float _445 = _375 * 6.283185482025146484375;
            float _447 = cos(_445);
            float _449 = _441 * 0.5;
            float _451 = _443 * 0.5;
            float _453 = _449 * 0.15915493667125701904296875;
            float _455 = _451 * 0.15915493667125701904296875;
            float _457 = _453 * 6.283185482025146484375;
            float _459 = cos(_457);
            float _461 = _453 * 6.283185482025146484375;
            float _463 = sin(_461);
            float _465 = _455 * 6.283185482025146484375;
            float _467 = sin(_465);
            float _469 = _459 * _427;
            float _471 = _455 * 6.283185482025146484375;
            float _473 = cos(_471);
            float _475 = _427 * _463;
            float _477 = _447 * _463;
            float _479 = _447 * _459;
            float _481 = _467 * _469;
            float _483 = _473 * _475;
            float _485 = fma(_473, _477, _481);
            float _487 = _467 * _477;
            float _489 = -_483;
            float _491 = fma(_467, _479, _489);
            float _493 = _407 * _485;
            float _495 = _467 * _475;
            float _497 = -_487;
            float _499 = fma(_473, _469, _497);
            float _501 = fma(_411, _491, _493);
            float _503 = fma(_473, _479, _495);
            float _505 = -_267;
            float _507 = _505 + _287;
            float _509 = fma(_419, _499, _501);
            float _511 = fma(_507, _301, _267);
            float _513 = fma(_403, _503, _509);
            float _515 = precise::max(_513, -1.0);
            float _517 = precise::min(_515, 1.0);
            bool _519 = _517 >= 0.0;
            bool _521 = isnan(_517);
            bool _523 = _519 || _521;
            bool _525 = isnan(0.0);
            bool _527 = _523 || _525;
            bool _529 = !_527;
            float _531 = -_517;
            float _533 = _529 ? _531 : _517;
            bool _535 = _533 < 0.0;
            float _537 = float(_535);
            float _539 = abs(_533);
            float _541 = -_539;
            float _543 = _541 + 1.0;
            float _545 = abs(_533);
            float _547 = fma(_545, -0.0187292993068695068359375, 0.074261002242565155029296875);
            int _549 = as_type<int>(_543) + (-218103808);
            float _551 = abs(_533);
            float _553 = fma(_551, _547, -0.212114393711090087890625);
            bool _555 = uint(_549) >= 1920991232u;
            float _557 = -_269;
            float _559 = _557 + _289;
            float _561 = abs(_533);
            float _563 = fma(_561, _553, 1.570728778839111328125);
            float _565 = fma(_559, _301, _269);
            bool _567 = !_555;
            if (!_567)
            {
                int _569 = as_type<int>(_553);
                int _571 = as_type<int>(_533);
                int _573 = as_type<int>(_543);
                int _575 = 2032;
                _56(_569, _571, _573, _575, _577, _579, _581, _583, _585, _587);
                _589 = as_type<float>(_577);
                _591 = as_type<float>(_579);
                _593 = true;
            }
            else
            {
                float _595 = rsqrt(_543);
                float _597 = _543 * _595;
                float _599 = _595 * 0.5;
                float _601 = -_597;
                float _603 = 0.0 + _601;
                float _605 = fma(_599, _603, 0.5);
                float _607 = fma(_597, _605, _597);
                float _609 = -_607;
                float _611 = 0.0 + _609;
                float _613 = fma(_607, _611, _543);
                float _615 = fma(_599, _613, _607);
                _589 = _615;
                _591 = _613;
            }
            _593 = false;
            float _617 = _589;
            float _619 = _591;
            float _621 = _563 * _617;
            float _623 = _537 * 2.0;
            float _625 = -_623;
            float _627 = fma(_621, _625, _621);
            float _629 = fma(_537, 3.1415927410125732421875, _627);
            float _631 = _629 * 0.15915493667125701904296875;
            float _633 = _631 * 6.283185482025146484375;
            float _635 = sin(_633);
            float _637 = abs(_635);
            bool _639 = _637 >= 0.001000000047497451305389404296875;
            bool _641 = isnan(_637);
            bool _643 = _639 || _641;
            bool _645 = isnan(0.001000000047497451305389404296875);
            bool _647 = _643 || _645;
            float _649 = _357;
            float _651 = _619;
            float _653 = _621;
            if (!_647)
            {
                int _655 = _95 + 28;
                uint _657 = uint(int(uint(_655) >> uint(2)));
                uint _659 = uint(int(uint(int(_657)) >> uint(2)));
                int _661 = int(_657) & 3;
                float _663 = (*spvDescriptorSet0.cp_c5)._m0[int(_659)][_661];
                _649 = _663;
            }
            float _665 = _649;
            float _667 = _665;
            if (!_647)
            {
                float _669 = -_665;
                float _671 = _669 + 1.0;
                _651 = _671;
            }
            float _673 = _651;
            float _675 = _673;
            if (!_647)
            {
                _653 = _665;
            }
            float _677 = _653;
            bool _679 = !_647;
            float _681 = _677;
            if (!_679)
            {
                int _683 = _95 + 28;
                uint _685 = uint(int(uint(_683) >> uint(2)));
                uint _687 = uint(int(uint(int(_685)) >> uint(2)));
                int _689 = int(_685) & 3;
                float _691 = (*spvDescriptorSet0.cp_c5)._m0[int(_687)][_689];
                float _693 = 1.0 / _635;
                float _695 = _629 * _691;
                float _697 = _695 * 0.15915493667125701904296875;
                float _699 = -_695;
                float _701 = _629 + _699;
                float _703 = _701 * 0.15915493667125701904296875;
                float _705 = _697 * 6.283185482025146484375;
                float _707 = sin(_705);
                float _709 = _703 * 6.283185482025146484375;
                float _711 = sin(_709);
                float _713 = _707 * _693;
                float _715 = _711 * _693;
                _681 = _713;
                _675 = _715;
                _667 = _691;
            }
            float _717 = _681;
            float _719 = _675;
            float _721 = _667;
            int _723 = _95 + 8;
            uint _725 = uint(int(uint(_723) >> uint(2)));
            uint _727 = uint(int(uint(int(_725)) >> uint(2)));
            int _729 = int(_725) & 3;
            float _731 = (*spvDescriptorSet0.cp_c5)._m0[int(_727)][_729];
            int _733 = int(_725) + 1;
            uint _735 = uint(int(uint(_733) >> uint(2)));
            int _737 = _733 & 3;
            float _739 = (*spvDescriptorSet0.cp_c5)._m0[int(_735)][_737];
            int _741 = _84;
            int _743 = 1;
            int _745 = _58(_741, _743, (*spvDescriptorSet0.support_buffer));
            int _747 = as_type<int>(_731);
            int _749 = 1;
            int _751 = _58(_747, _749, (*spvDescriptorSet0.support_buffer));
            int3 _2755 = int3(_745, _751, 0);
            float3 _753 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2755.xy), uint(_2755.z), 0).xyz;
            float _755 = _753.x;
            float _757 = _753.y;
            float _759 = _753.z;
            int _761 = _84;
            int _763 = 1;
            int _765 = _58(_761, _763, (*spvDescriptorSet0.support_buffer));
            int _767 = as_type<int>(_739);
            int _769 = 1;
            int _771 = _58(_767, _769, (*spvDescriptorSet0.support_buffer));
            int3 _2773 = int3(_765, _771, 0);
            float3 _773 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2773.xy), uint(_2773.z), 0).xyz;
            float _775 = _773.x;
            float _777 = _773.y;
            float _779 = _773.z;
            int _781 = _84;
            int _783 = 1;
            int _785 = _58(_781, _783, (*spvDescriptorSet0.support_buffer));
            int _787 = as_type<int>(_731);
            int _789 = 1;
            int _791 = _58(_787, _789, (*spvDescriptorSet0.support_buffer));
            int3 _2791 = int3(_785, _791, 2);
            float3 _793 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2791.xy), uint(_2791.z), 0).xyz;
            float _795 = _793.x;
            float _797 = _793.y;
            float _799 = _793.z;
            int _801 = _84;
            int _803 = 1;
            int _805 = _58(_801, _803, (*spvDescriptorSet0.support_buffer));
            int _807 = as_type<int>(_739);
            int _809 = 1;
            int _811 = _58(_807, _809, (*spvDescriptorSet0.support_buffer));
            int3 _2809 = int3(_805, _811, 2);
            float3 _813 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2809.xy), uint(_2809.z), 0).xyz;
            float _815 = _813.x;
            float _817 = _813.y;
            float _819 = _813.z;
            int _821 = _95 + 24;
            uint _823 = uint(int(uint(_821) >> uint(2)));
            uint _825 = uint(int(uint(int(_823)) >> uint(2)));
            int _827 = int(_823) & 3;
            float _829 = (*spvDescriptorSet0.cp_c5)._m0[int(_825)][_827];
            bool _831 = !_527;
            float _833 = -_717;
            float _835 = _831 ? _833 : _717;
            float _837 = _503 * _835;
            float _839 = _491 * _835;
            int _841 = _95 + 20;
            uint _843 = uint(int(uint(_841) >> uint(2)));
            uint _845 = uint(int(uint(int(_843)) >> uint(2)));
            int _847 = int(_843) & 3;
            float _849 = (*spvDescriptorSet0.cp_c5)._m0[int(_845)][_847];
            float _851 = _499 * _835;
            float _853 = fma(_403, _719, _837);
            float _855 = _485 * _835;
            float _857 = fma(_411, _719, _839);
            float _859 = fma(_419, _719, _851);
            float _861 = _853 * 2.0;
            float _863 = fma(_407, _719, _855);
            float _865 = _857 * 2.0;
            float _867 = _859 * _861;
            float _869 = _863 * _861;
            float _871 = _857 * _861;
            float _873 = _863 * 2.0;
            float _875 = -_867;
            float _877 = fma(_863, _865, _875);
            float _879 = fma(_863, _865, _867);
            float _881 = fma(_859, _865, _869);
            float _883 = -_869;
            float _885 = fma(_859, _865, _883);
            float _887 = _857 * _857;
            float _889 = _863 * _863;
            float _891 = -_871;
            float _893 = fma(_859, _873, _891);
            float _895 = fma(_859, _873, _871);
            float _897 = fma(_887, -2.0, 1.0);
            float _899 = _859 * _859;
            float _901 = fma(_889, -2.0, 1.0);
            float _903 = fma(_899, -2.0, _901);
            float _905 = fma(_899, -2.0, _897);
            float _907 = fma(_889, -2.0, _897);
            float _909 = -_755;
            float _911 = _909 + _775;
            float _913 = -_759;
            float _915 = _913 + _779;
            float _917 = -_757;
            float _919 = _917 + _777;
            float _921 = fma(_911, _829, _755);
            float _923 = fma(_915, _829, _759);
            float _925 = fma(_919, _829, _757);
            float _927 = _921 * _721;
            float _929 = _923 * _721;
            float _931 = -_795;
            float _933 = _931 + _815;
            float _935 = -_799;
            float _937 = _935 + _819;
            float _939 = fma(_435, _849, _927);
            float _941 = fma(_365, _849, _929);
            float _943 = _925 * _721;
            float _945 = fma(_933, _829, _795);
            float _947 = _903 * _939;
            float _949 = -_797;
            float _951 = _949 + _817;
            float _953 = fma(_937, _829, _799);
            float _955 = _907 * _941;
            float _957 = fma(_429, _849, _943);
            float _959 = fma(_951, _829, _797);
            float _961 = _945 * _721;
            int _963 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _965 = _963 + _84;
            float _967 = _953 * _721;
            float _969 = _959 * _721;
            float _971 = _879 * _939;
            float _973 = _885 * _939;
            float _975 = _877 * _957;
            float _977 = _905 * _957;
            float _979 = _895 * _957;
            float _981 = _881 * _941;
            float _983 = _893 * _941;
            float _985 = fma(_511, _849, _961);
            int _987 = _965 * 48;
            float _989 = fma(_565, _849, _969);
            float _991 = fma(_373, _849, _967);
            int _993 = _84 + 1;
            uint _995 = uint(int(uint(_987) >> uint(2)));
            _37[int(_995)] = as_type<uint>(_947);
            int _997 = _987 + 4;
            uint _999 = uint(int(uint(_997) >> uint(2)));
            _37[int(_999)] = as_type<uint>(_975);
            int _1001 = _987 + 8;
            uint _1003 = uint(int(uint(_1001) >> uint(2)));
            _37[int(_1003)] = as_type<uint>(_981);
            int _1005 = _987 + 12;
            uint _1007 = uint(int(uint(_1005) >> uint(2)));
            _37[int(_1007)] = as_type<uint>(_985);
            bool _1009 = uint(_993) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1011 = _987 + 16;
            uint _1013 = uint(int(uint(_1011) >> uint(2)));
            _37[int(_1013)] = as_type<uint>(_971);
            int _1015 = _987 + 20;
            uint _1017 = uint(int(uint(_1015) >> uint(2)));
            _37[int(_1017)] = as_type<uint>(_977);
            int _1019 = _987 + 24;
            uint _1021 = uint(int(uint(_1019) >> uint(2)));
            _37[int(_1021)] = as_type<uint>(_983);
            int _1023 = _987 + 28;
            uint _1025 = uint(int(uint(_1023) >> uint(2)));
            _37[int(_1025)] = as_type<uint>(_989);
            int _1027 = _987 + 32;
            uint _1029 = uint(int(uint(_1027) >> uint(2)));
            _37[int(_1029)] = as_type<uint>(_973);
            int _1031 = _987 + 36;
            uint _1033 = uint(int(uint(_1031) >> uint(2)));
            _37[int(_1033)] = as_type<uint>(_979);
            int _1035 = _987 + 40;
            uint _1037 = uint(int(uint(_1035) >> uint(2)));
            _37[int(_1037)] = as_type<uint>(_955);
            int _1039 = _987 + 44;
            uint _1041 = uint(int(uint(_1039) >> uint(2)));
            _37[int(_1041)] = as_type<uint>(_991);
            _82 = _993;
            if (_1009)
            {
                _1043 = true;
                if (_1043)
                {
                    break;
                }
            }
        } while (true);
    }
    _1043 = false;
    bool _1045 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _1047 = !_1045;
    if (!_1047)
    {
        int _1049 = 1;
        bool _1051;
        do
        {
            int _1053 = _1049;
            int _1055 = _1053 * 112;
            int _1057 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1059 = _1057 + _1053;
            int _1061 = _1053 + 1;
            uint _1063 = uint(int(uint(_1055) >> uint(2)));
            uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
            int _1067 = int(_1063) & 3;
            float _1069 = (*spvDescriptorSet0.cp_c6)._m0[int(_1065)][_1067];
            int _1071 = _1059 * 48;
            bool _1073 = uint(_1061) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1075 = _1071 + 16;
            uint _1077 = uint(int(uint(_1075) >> uint(2)));
            float _1079 = as_type<float>(_37[int(_1077)]);
            int _1081 = _1071 + 20;
            uint _1083 = uint(int(uint(_1081) >> uint(2)));
            float _1085 = as_type<float>(_37[int(_1083)]);
            int _1087 = _1071 + 24;
            uint _1089 = uint(int(uint(_1087) >> uint(2)));
            float _1091 = as_type<float>(_37[int(_1089)]);
            int _1093 = _1071 + 28;
            uint _1095 = uint(int(uint(_1093) >> uint(2)));
            float _1097 = as_type<float>(_37[int(_1095)]);
            int _1099 = _1071 + 32;
            uint _1101 = uint(int(uint(_1099) >> uint(2)));
            float _1103 = as_type<float>(_37[int(_1101)]);
            int _1105 = _1071 + 36;
            uint _1107 = uint(int(uint(_1105) >> uint(2)));
            float _1109 = as_type<float>(_37[int(_1107)]);
            int _1111 = _1071 + 40;
            uint _1113 = uint(int(uint(_1111) >> uint(2)));
            float _1115 = as_type<float>(_37[int(_1113)]);
            int _1117 = _1071 + 44;
            uint _1119 = uint(int(uint(_1117) >> uint(2)));
            float _1121 = as_type<float>(_37[int(_1119)]);
            int _1123 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1125 = _1123 + as_type<int>(_1069);
            int _1127 = _1125 * 48;
            uint _1129 = uint(int(uint(_1071) >> uint(2)));
            float _1131 = as_type<float>(_37[int(_1129)]);
            int _1133 = _1071 + 4;
            uint _1135 = uint(int(uint(_1133) >> uint(2)));
            float _1137 = as_type<float>(_37[int(_1135)]);
            int _1139 = _1071 + 8;
            uint _1141 = uint(int(uint(_1139) >> uint(2)));
            float _1143 = as_type<float>(_37[int(_1141)]);
            int _1145 = _1071 + 12;
            uint _1147 = uint(int(uint(_1145) >> uint(2)));
            float _1149 = as_type<float>(_37[int(_1147)]);
            uint _1151 = uint(int(uint(_1127) >> uint(2)));
            float _1153 = as_type<float>(_37[int(_1151)]);
            int _1155 = _1127 + 4;
            uint _1157 = uint(int(uint(_1155) >> uint(2)));
            float _1159 = as_type<float>(_37[int(_1157)]);
            int _1161 = _1127 + 8;
            uint _1163 = uint(int(uint(_1161) >> uint(2)));
            float _1165 = as_type<float>(_37[int(_1163)]);
            int _1167 = _1127 + 12;
            uint _1169 = uint(int(uint(_1167) >> uint(2)));
            float _1171 = as_type<float>(_37[int(_1169)]);
            int _1173 = _1127 + 16;
            uint _1175 = uint(int(uint(_1173) >> uint(2)));
            float _1177 = as_type<float>(_37[int(_1175)]);
            int _1179 = _1127 + 20;
            uint _1181 = uint(int(uint(_1179) >> uint(2)));
            float _1183 = as_type<float>(_37[int(_1181)]);
            int _1185 = _1127 + 24;
            uint _1187 = uint(int(uint(_1185) >> uint(2)));
            float _1189 = as_type<float>(_37[int(_1187)]);
            int _1191 = _1127 + 28;
            uint _1193 = uint(int(uint(_1191) >> uint(2)));
            float _1195 = as_type<float>(_37[int(_1193)]);
            int _1197 = _1127 + 32;
            uint _1199 = uint(int(uint(_1197) >> uint(2)));
            float _1201 = as_type<float>(_37[int(_1199)]);
            int _1203 = _1127 + 36;
            uint _1205 = uint(int(uint(_1203) >> uint(2)));
            float _1207 = as_type<float>(_37[int(_1205)]);
            int _1209 = _1127 + 40;
            uint _1211 = uint(int(uint(_1209) >> uint(2)));
            float _1213 = as_type<float>(_37[int(_1211)]);
            int _1215 = _1127 + 44;
            uint _1217 = uint(int(uint(_1215) >> uint(2)));
            float _1219 = as_type<float>(_37[int(_1217)]);
            float _1221 = _1097 * _1159;
            float _1223 = _1085 * _1159;
            float _1225 = _1079 * _1159;
            float _1227 = _1091 * _1159;
            float _1229 = fma(_1149, _1153, _1221);
            float _1231 = fma(_1137, _1153, _1223);
            float _1233 = fma(_1131, _1153, _1225);
            float _1235 = fma(_1143, _1153, _1227);
            float _1237 = fma(_1121, _1165, _1229);
            float _1239 = fma(_1109, _1165, _1231);
            float _1241 = _1085 * _1183;
            float _1243 = _1079 * _1183;
            float _1245 = _1171 + _1237;
            float _1247 = _1097 * _1183;
            float _1249 = _1091 * _1183;
            float _1251 = fma(_1137, _1177, _1241);
            float _1253 = fma(_1103, _1165, _1233);
            float _1255 = fma(_1149, _1177, _1247);
            float _1257 = fma(_1143, _1177, _1249);
            float _1259 = fma(_1109, _1189, _1251);
            float _1261 = _1097 * _1207;
            float _1263 = _1079 * _1207;
            float _1265 = _1085 * _1207;
            float _1267 = _1091 * _1207;
            float _1269 = fma(_1149, _1201, _1261);
            float _1271 = fma(_1131, _1177, _1243);
            float _1273 = fma(_1121, _1189, _1255);
            float _1275 = fma(_1131, _1201, _1263);
            float _1277 = fma(_1137, _1201, _1265);
            float _1279 = fma(_1143, _1201, _1267);
            float _1281 = fma(_1121, _1213, _1269);
            float _1283 = fma(_1103, _1189, _1271);
            float _1285 = fma(_1115, _1165, _1235);
            float _1287 = fma(_1115, _1189, _1257);
            float _1289 = _1195 + _1273;
            float _1291 = fma(_1103, _1213, _1275);
            float _1293 = fma(_1109, _1213, _1277);
            float _1295 = fma(_1115, _1213, _1279);
            float _1297 = _1219 + _1281;
            uint _1299 = uint(int(uint(_1071) >> uint(2)));
            _37[int(_1299)] = as_type<uint>(_1253);
            int _1301 = _1071 + 4;
            uint _1303 = uint(int(uint(_1301) >> uint(2)));
            _37[int(_1303)] = as_type<uint>(_1239);
            int _1305 = _1071 + 8;
            uint _1307 = uint(int(uint(_1305) >> uint(2)));
            _37[int(_1307)] = as_type<uint>(_1285);
            int _1309 = _1071 + 12;
            uint _1311 = uint(int(uint(_1309) >> uint(2)));
            _37[int(_1311)] = as_type<uint>(_1245);
            int _1313 = _1071 + 16;
            uint _1315 = uint(int(uint(_1313) >> uint(2)));
            _37[int(_1315)] = as_type<uint>(_1283);
            int _1317 = _1071 + 20;
            uint _1319 = uint(int(uint(_1317) >> uint(2)));
            _37[int(_1319)] = as_type<uint>(_1259);
            int _1321 = _1071 + 24;
            uint _1323 = uint(int(uint(_1321) >> uint(2)));
            _37[int(_1323)] = as_type<uint>(_1287);
            int _1325 = _1071 + 28;
            uint _1327 = uint(int(uint(_1325) >> uint(2)));
            _37[int(_1327)] = as_type<uint>(_1289);
            int _1329 = _1071 + 32;
            uint _1331 = uint(int(uint(_1329) >> uint(2)));
            _37[int(_1331)] = as_type<uint>(_1291);
            int _1333 = _1071 + 36;
            uint _1335 = uint(int(uint(_1333) >> uint(2)));
            _37[int(_1335)] = as_type<uint>(_1293);
            int _1337 = _1071 + 40;
            uint _1339 = uint(int(uint(_1337) >> uint(2)));
            _37[int(_1339)] = as_type<uint>(_1295);
            int _1341 = _1071 + 44;
            uint _1343 = uint(int(uint(_1341) >> uint(2)));
            _37[int(_1343)] = as_type<uint>(_1297);
            _1051 = !_1073;
            _1049 = _1061;
        } while (_1051);
    }
    if (!_74)
    {
        return;
    }
    int _1345 = 0;
    bool _1347;
    do
    {
        int _1349 = _1345;
        int _1351 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1353 = _1351 + _1349;
        int _1355 = _1349 * 112;
        int _1357 = _1353 * 48;
        int _1359 = _1355 + 80;
        uint _1361 = uint(int(uint(_1359) >> uint(2)));
        uint _1363 = uint(int(uint(int(_1361)) >> uint(2)));
        int _1365 = int(_1361) & 3;
        float _1367 = (*spvDescriptorSet0.cp_c6)._m0[int(_1363)][_1365];
        int _1369 = int(_1361) + 1;
        uint _1371 = uint(int(uint(_1369) >> uint(2)));
        int _1373 = _1369 & 3;
        float _1375 = (*spvDescriptorSet0.cp_c6)._m0[int(_1371)][_1373];
        uint _1377 = uint(int(uint(_1357) >> uint(2)));
        float _1379 = as_type<float>(_37[int(_1377)]);
        int _1381 = _1357 + 4;
        uint _1383 = uint(int(uint(_1381) >> uint(2)));
        float _1385 = as_type<float>(_37[int(_1383)]);
        int _1387 = _1357 + 8;
        uint _1389 = uint(int(uint(_1387) >> uint(2)));
        float _1391 = as_type<float>(_37[int(_1389)]);
        int _1393 = _1357 + 12;
        uint _1395 = uint(int(uint(_1393) >> uint(2)));
        float _1397 = as_type<float>(_37[int(_1395)]);
        int _1399 = _1357 + 16;
        uint _1401 = uint(int(uint(_1399) >> uint(2)));
        float _1403 = as_type<float>(_37[int(_1401)]);
        int _1405 = _1357 + 20;
        uint _1407 = uint(int(uint(_1405) >> uint(2)));
        float _1409 = as_type<float>(_37[int(_1407)]);
        int _1411 = _1357 + 24;
        uint _1413 = uint(int(uint(_1411) >> uint(2)));
        float _1415 = as_type<float>(_37[int(_1413)]);
        int _1417 = _1357 + 28;
        uint _1419 = uint(int(uint(_1417) >> uint(2)));
        float _1421 = as_type<float>(_37[int(_1419)]);
        int _1423 = _1355 + 88;
        uint _1425 = uint(int(uint(_1423) >> uint(2)));
        uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
        int _1429 = int(_1425) & 3;
        float _1431 = (*spvDescriptorSet0.cp_c6)._m0[int(_1427)][_1429];
        int _1433 = int(_1425) + 1;
        uint _1435 = uint(int(uint(_1433) >> uint(2)));
        int _1437 = _1433 & 3;
        float _1439 = (*spvDescriptorSet0.cp_c6)._m0[int(_1435)][_1437];
        int _1441 = _1357 + 32;
        uint _1443 = uint(int(uint(_1441) >> uint(2)));
        float _1445 = as_type<float>(_37[int(_1443)]);
        int _1447 = _1357 + 36;
        uint _1449 = uint(int(uint(_1447) >> uint(2)));
        float _1451 = as_type<float>(_37[int(_1449)]);
        int _1453 = _1357 + 40;
        uint _1455 = uint(int(uint(_1453) >> uint(2)));
        float _1457 = as_type<float>(_37[int(_1455)]);
        int _1459 = _1357 + 44;
        uint _1461 = uint(int(uint(_1459) >> uint(2)));
        float _1463 = as_type<float>(_37[int(_1461)]);
        int _1465 = _1355 + 64;
        uint _1467 = uint(int(uint(_1465) >> uint(2)));
        uint _1469 = uint(int(uint(int(_1467)) >> uint(2)));
        int _1471 = int(_1467) & 3;
        float _1473 = (*spvDescriptorSet0.cp_c6)._m0[int(_1469)][_1471];
        int _1475 = int(_1467) + 1;
        uint _1477 = uint(int(uint(_1475) >> uint(2)));
        int _1479 = _1475 & 3;
        float _1481 = (*spvDescriptorSet0.cp_c6)._m0[int(_1477)][_1479];
        int _1483 = _1355 + 72;
        uint _1485 = uint(int(uint(_1483) >> uint(2)));
        uint _1487 = uint(int(uint(int(_1485)) >> uint(2)));
        int _1489 = int(_1485) & 3;
        float _1491 = (*spvDescriptorSet0.cp_c6)._m0[int(_1487)][_1489];
        int _1493 = int(_1485) + 1;
        uint _1495 = uint(int(uint(_1493) >> uint(2)));
        int _1497 = _1493 & 3;
        float _1499 = (*spvDescriptorSet0.cp_c6)._m0[int(_1495)][_1497];
        int _1501 = _1355 + 104;
        uint _1503 = uint(int(uint(_1501) >> uint(2)));
        uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
        int _1507 = int(_1503) & 3;
        float _1509 = (*spvDescriptorSet0.cp_c6)._m0[int(_1505)][_1507];
        int _1511 = int(_1503) + 1;
        uint _1513 = uint(int(uint(_1511) >> uint(2)));
        int _1515 = _1511 & 3;
        float _1517 = (*spvDescriptorSet0.cp_c6)._m0[int(_1513)][_1515];
        int _1519 = _1355 + 96;
        uint _1521 = uint(int(uint(_1519) >> uint(2)));
        uint _1523 = uint(int(uint(int(_1521)) >> uint(2)));
        int _1525 = int(_1521) & 3;
        float _1527 = (*spvDescriptorSet0.cp_c6)._m0[int(_1523)][_1525];
        int _1529 = int(_1521) + 1;
        uint _1531 = uint(int(uint(_1529) >> uint(2)));
        int _1533 = _1529 & 3;
        float _1535 = (*spvDescriptorSet0.cp_c6)._m0[int(_1531)][_1533];
        float _1537 = _1385 * _1367;
        float _1539 = _1385 * _1375;
        float _1541 = _1385 * _1431;
        float _1543 = _1385 * _1439;
        float _1545 = fma(_1379, _1473, _1537);
        float _1547 = fma(_1379, _1481, _1539);
        float _1549 = fma(_1379, _1491, _1541);
        float _1551 = fma(_1379, _1499, _1543);
        float _1553 = _1409 * _1367;
        float _1555 = _1409 * _1375;
        float _1557 = _1409 * _1431;
        float _1559 = _1409 * _1439;
        float _1561 = _1451 * _1367;
        float _1563 = fma(_1403, _1473, _1553);
        float _1565 = fma(_1403, _1481, _1555);
        float _1567 = fma(_1403, _1491, _1557);
        uint _1569 = uint(int(uint(_78) >> uint(2)));
        uint _1571 = uint(int(uint(int(_1569)) >> uint(2)));
        int _1573 = int(_1569) & 3;
        float _1575 = (*spvDescriptorSet0.cp_c4)._m0[int(_1571)][_1573];
        float _1577 = fma(_1403, _1499, _1559);
        float _1579 = _1451 * _1375;
        float _1581 = _1451 * _1431;
        float _1583 = _1451 * _1439;
        float _1585 = fma(_1445, _1473, _1561);
        float _1587 = fma(_1445, _1481, _1579);
        float _1589 = fma(_1445, _1491, _1581);
        int _1591 = _1355 + 16;
        uint _1593 = uint(int(uint(_1591) >> uint(2)));
        uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
        int _1597 = int(_1593) & 3;
        float _1599 = (*spvDescriptorSet0.cp_c6)._m0[int(_1595)][_1597];
        int _1601 = int(_1593) + 1;
        uint _1603 = uint(int(uint(_1601) >> uint(2)));
        int _1605 = _1601 & 3;
        float _1607 = (*spvDescriptorSet0.cp_c6)._m0[int(_1603)][_1605];
        float _1609 = fma(_1445, _1499, _1583);
        float _1611 = fma(_1415, _1517, _1577);
        float _1613 = fma(_1391, _1527, _1545);
        float _1615 = fma(_1391, _1535, _1547);
        float _1617 = fma(_1391, _1509, _1549);
        float _1619 = fma(_1391, _1517, _1551);
        float _1621 = fma(_1415, _1527, _1563);
        int _1623 = _1355 + 24;
        uint _1625 = uint(int(uint(_1623) >> uint(2)));
        uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
        int _1629 = int(_1625) & 3;
        float _1631 = (*spvDescriptorSet0.cp_c6)._m0[int(_1627)][_1629];
        int _1633 = int(_1625) + 1;
        uint _1635 = uint(int(uint(_1633) >> uint(2)));
        int _1637 = _1633 & 3;
        float _1639 = (*spvDescriptorSet0.cp_c6)._m0[int(_1635)][_1637];
        float _1641 = fma(_1415, _1535, _1565);
        float _1643 = fma(_1415, _1509, _1567);
        float _1645 = fma(_1457, _1527, _1585);
        float _1647 = fma(_1457, _1535, _1587);
        float _1649 = fma(_1457, _1517, _1609);
        float _1651 = fma(_1457, _1509, _1589);
        float _1653 = _1421 + _1611;
        int _1655 = _1355 + 32;
        uint _1657 = uint(int(uint(_1655) >> uint(2)));
        uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
        int _1661 = int(_1657) & 3;
        float _1663 = (*spvDescriptorSet0.cp_c6)._m0[int(_1659)][_1661];
        int _1665 = int(_1657) + 1;
        uint _1667 = uint(int(uint(_1665) >> uint(2)));
        int _1669 = _1665 & 3;
        float _1671 = (*spvDescriptorSet0.cp_c6)._m0[int(_1667)][_1669];
        float _1673 = _1463 + _1649;
        float _1675 = _1397 + _1619;
        int _1677 = _1355 + 48;
        uint _1679 = uint(int(uint(_1677) >> uint(2)));
        uint _1681 = uint(int(uint(int(_1679)) >> uint(2)));
        int _1683 = int(_1679) & 3;
        float _1685 = (*spvDescriptorSet0.cp_c6)._m0[int(_1681)][_1683];
        int _1687 = int(_1679) + 1;
        uint _1689 = uint(int(uint(_1687) >> uint(2)));
        int _1691 = _1687 & 3;
        float _1693 = (*spvDescriptorSet0.cp_c6)._m0[int(_1689)][_1691];
        float _1695 = _1621 * _1607;
        float _1697 = _1641 * _1607;
        float _1699 = _1653 * _1607;
        float _1701 = _1643 * _1607;
        float _1703 = fma(_1613, _1599, _1695);
        float _1705 = fma(_1615, _1599, _1697);
        float _1707 = fma(_1675, _1599, _1699);
        float _1709 = fma(_1617, _1599, _1701);
        int _1711 = _1355 + 40;
        uint _1713 = uint(int(uint(_1711) >> uint(2)));
        uint _1715 = uint(int(uint(int(_1713)) >> uint(2)));
        int _1717 = int(_1713) & 3;
        float _1719 = (*spvDescriptorSet0.cp_c6)._m0[int(_1715)][_1717];
        int _1721 = int(_1713) + 1;
        uint _1723 = uint(int(uint(_1721) >> uint(2)));
        int _1725 = _1721 & 3;
        float _1727 = (*spvDescriptorSet0.cp_c6)._m0[int(_1723)][_1725];
        float _1729 = fma(_1645, _1631, _1703);
        float _1731 = fma(_1673, _1631, _1707);
        float _1733 = fma(_1647, _1631, _1705);
        float _1735 = fma(_1651, _1631, _1709);
        float _1737 = _1731 + _1639;
        float _1739 = _1653 * _1671;
        int _1741 = _1355 + 56;
        uint _1743 = uint(int(uint(_1741) >> uint(2)));
        uint _1745 = uint(int(uint(int(_1743)) >> uint(2)));
        int _1747 = int(_1743) & 3;
        float _1749 = (*spvDescriptorSet0.cp_c6)._m0[int(_1745)][_1747];
        int _1751 = int(_1743) + 1;
        uint _1753 = uint(int(uint(_1751) >> uint(2)));
        int _1755 = _1751 & 3;
        float _1757 = (*spvDescriptorSet0.cp_c6)._m0[int(_1753)][_1755];
        float _1759 = _1621 * _1671;
        float _1761 = _1641 * _1671;
        int _1763 = as_type<int>(_1575) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1765 = _1763 + _1349;
        int _1767 = _1349 + 1;
        float _1769 = _1643 * _1671;
        float _1771 = fma(_1675, _1663, _1739);
        float _1773 = _1653 * _1693;
        float _1775 = _1621 * _1693;
        float _1777 = _1641 * _1693;
        float _1779 = fma(_1615, _1663, _1761);
        float _1781 = _1643 * _1693;
        float _1783 = fma(_1675, _1685, _1773);
        float _1785 = fma(_1613, _1685, _1775);
        int _1787 = _1765 * 48;
        bool _1789 = uint(_1767) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1791 = fma(_1615, _1685, _1777);
        float _1793 = fma(_1613, _1663, _1759);
        float _1795 = fma(_1617, _1663, _1769);
        float _1797 = fma(_1673, _1719, _1771);
        float _1799 = fma(_1617, _1685, _1781);
        float _1801 = fma(_1647, _1719, _1779);
        float _1803 = fma(_1645, _1719, _1793);
        float _1805 = fma(_1651, _1719, _1795);
        float _1807 = fma(_1673, _1749, _1783);
        float _1809 = fma(_1645, _1749, _1785);
        float _1811 = fma(_1647, _1749, _1791);
        int _1813 = _1787 + 16;
        float _1815 = _1797 + _1727;
        int _1817 = _1787 + 32;
        float _1819 = fma(_1651, _1749, _1799);
        float _1821 = _1807 + _1757;
        int _1823 = _1787 + 48;
        uint _1825 = uint(int(uint(_1813) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1825)] = as_type<uint>(_1729);
        int _1827 = _1813 + 4;
        uint _1829 = uint(int(uint(_1827) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1829)] = as_type<uint>(_1733);
        int _1831 = _1813 + 8;
        uint _1833 = uint(int(uint(_1831) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1833)] = as_type<uint>(_1735);
        int _1835 = _1813 + 12;
        uint _1837 = uint(int(uint(_1835) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1837)] = as_type<uint>(_1737);
        uint _1839 = uint(int(uint(_1817) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1839)] = as_type<uint>(_1803);
        int _1841 = _1817 + 4;
        uint _1843 = uint(int(uint(_1841) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1843)] = as_type<uint>(_1801);
        int _1845 = _1817 + 8;
        uint _1847 = uint(int(uint(_1845) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1847)] = as_type<uint>(_1805);
        int _1849 = _1817 + 12;
        uint _1851 = uint(int(uint(_1849) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1851)] = as_type<uint>(_1815);
        uint _1853 = uint(int(uint(_1823) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1853)] = as_type<uint>(_1809);
        int _1855 = _1823 + 4;
        uint _1857 = uint(int(uint(_1855) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1857)] = as_type<uint>(_1811);
        int _1859 = _1823 + 8;
        uint _1861 = uint(int(uint(_1859) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1861)] = as_type<uint>(_1819);
        int _1863 = _1823 + 12;
        uint _1865 = uint(int(uint(_1863) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1865)] = as_type<uint>(_1821);
        _1347 = !_1789;
        _1345 = _1767;
    } while (_1347);
}

