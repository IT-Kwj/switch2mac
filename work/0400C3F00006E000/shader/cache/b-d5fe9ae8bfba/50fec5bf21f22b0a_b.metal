#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
}

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
int _56(thread const int& _3823, thread const int& _3824, constant _10& support_buffer)
{
    int _3827 = 1 + _3824;
    float _3829 = support_buffer._m5[_3827].x;
    bool _3831 = _3829 == 1.0;
    if (_3831)
    {
        return _3823;
    }
    float _3833 = float(_3823);
    float _3835 = _3833 * _3829;
    int _3837 = int(_3835);
    return _3837;
}

static inline __attribute__((always_inline))
void _54(thread const int& _3515, thread const int& _3516, thread const int& _3517, thread const int& _3518, thread int& _3519, thread int& _3520, thread int& _3521, thread int& _3522, thread int& _3523, thread int& _3524)
{
    float _3527 = as_type<float>(_3515) + 0.0;
    bool _3529 = _3527 != 0.0;
    bool _3531 = isnan(_3527);
    bool _3533 = _3529 || _3531;
    bool _3535 = isnan(0.0);
    bool _3537 = _3533 || _3535;
    int _3539 = _3516;
    int _3541 = _3517;
    int _3543 = 0;
    int _3545 = _3537 ? (-1) : 0;
    if (!_3537)
    {
        float _3547 = as_type<float>(_3515) * 1.0;
        _3539 = as_type<int>(_3547);
    }
    int _3549 = _3539;
    bool _3551 = !_3537;
    int _3553 = _3549;
    int _3555 = _3549;
    if (!_3551)
    {
        float _3557 = as_type<float>(_3515) + 0.0;
        bool _3559 = _3557 >= 0.0;
        bool _3561 = isnan(_3557);
        bool _3563 = _3559 || _3561;
        bool _3565 = isnan(0.0);
        bool _3567 = _3563 || _3565;
        _3545 = _3567 ? (-1) : 0;
        if (!_3567)
        {
            _3553 = 2147483647;
        }
        int _3569 = _3553;
        bool _3571 = !_3567;
        int _3573 = _3569;
        _3555 = _3569;
        if (!_3571)
        {
            float _3575 = as_type<float>(_3515) + 0.0;
            bool _3577 = _3575 > as_type<float>(0x7f800000u /* inf */);
            bool _3579 = isnan(_3575);
            bool _3581 = _3577 || _3579;
            bool _3583 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3585 = _3581 || _3583;
            _3543 = 2139095040;
            _3545 = _3585 ? (-1) : 0;
            if (_3585)
            {
                float _3587 = as_type<float>(_3515) + 1.0;
                _3573 = as_type<int>(_3587);
            }
            int _3589 = _3573;
            int _3591 = _3589;
            _3555 = _3589;
            if (!_3585)
            {
                float _3593 = 0.0 + as_type<float>(_3515);
                bool _3595 = _3593 != as_type<float>(0x7f800000u /* inf */);
                bool _3597 = isnan(_3593);
                bool _3599 = _3595 || _3597;
                bool _3601 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3603 = _3599 || _3601;
                _3545 = _3603 ? (-1) : 0;
                if (!_3603)
                {
                    _3591 = _3515;
                }
                int _3605 = _3591;
                bool _3607 = !_3603;
                _3555 = _3605;
                if (!_3607)
                {
                    float _3609 = as_type<float>(_3515) * 18446744073709551616.0;
                    float _3611 = rsqrt(_3609);
                    float _3613 = _3609 * _3611;
                    float _3615 = _3611 * 0.5;
                    float _3617 = -_3613;
                    float _3619 = 0.0 + _3617;
                    float _3621 = fma(_3615, _3619, 0.5);
                    float _3623 = fma(_3613, _3621, _3613);
                    float _3625 = -_3623;
                    float _3627 = 0.0 + _3625;
                    float _3629 = fma(_3623, _3627, _3609);
                    float _3631 = fma(_3615, _3629, _3623);
                    float _3633 = _3631 * 2.3283064365386962890625e-10;
                    _3555 = as_type<int>(_3633);
                    _3541 = as_type<int>(_3623);
                    _3543 = as_type<int>(_3619);
                }
            }
        }
    }
    int _3635 = _3555;
    int _3637 = _3541;
    int _3639 = _3543;
    int _3641 = _3545;
    _3519 = _3518;
    _3520 = 0;
    _3521 = _3635;
    _3522 = _3637;
    _3523 = _3639;
    _3524 = _3641;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3858, thread const int& _3859, thread const int& _3860, thread int& _3861, thread uint& gl_SubgroupInvocationID)
{
    int _3864 = _3860 & 31;
    uint _3866 = uint(int(uint(_3860) >> uint(8)));
    int _3868 = int(_3866) & 31;
    float _3870 = as_type<float>(gl_SubgroupInvocationID);
    int _3872 = as_type<int>(_3870) & _3868;
    int _3874 = ~_3868;
    int _3876 = _3864 & _3874;
    int _3878 = _3876 | _3872;
    int _3880 = ~_3868;
    int _3882 = _3859 & _3880;
    int _3884 = _3882 | _3872;
    bool _3886 = uint(_3884) <= uint(_3878);
    _3861 = _3886 ? (-1) : 0;
    float _3888 = spvSubgroupShuffle(as_type<float>(_3858), uint(_3884));
    uint _3890 = uint(_3886 ? as_type<int>(_3888) : _3858);
    return int(_3890);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1027 = false;
    bool _383 = false;
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
    int _99 = _56(_95, _97, (*spvDescriptorSet0.support_buffer));
    int _101 = as_type<int>(_83);
    int _103 = 0;
    int _105 = _56(_101, _103, (*spvDescriptorSet0.support_buffer));
    int3 _1554 = int3(_99, _105, 1);
    float3 _109 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1554.xy), uint(_1554.z), 0).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    int _117 = _68;
    int _119 = 1;
    int _121 = _56(_117, _119, (*spvDescriptorSet0.support_buffer));
    int _123 = as_type<int>(_93);
    int _125 = 1;
    int _127 = _56(_123, _125, (*spvDescriptorSet0.support_buffer));
    int3 _1572 = int3(_121, _127, 1);
    float3 _129 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1572.xy), uint(_1572.z), 0).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    int _137 = _68;
    int _139 = 0;
    int _141 = _56(_137, _139, (*spvDescriptorSet0.support_buffer));
    int _143 = as_type<int>(_83);
    int _145 = 0;
    int _147 = _56(_143, _145, (*spvDescriptorSet0.support_buffer));
    int3 _1590 = int3(_141, _147, 0);
    float3 _149 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1590.xy), uint(_1590.z), 0).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    int _157 = _68;
    int _159 = 0;
    int _161 = _56(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = as_type<int>(_83);
    int _165 = 0;
    int _167 = _56(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _1608 = int3(_161, _167, 2);
    float3 _169 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1608.xy), uint(_1608.z), 0).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    float _177 = _115 * 0.5;
    float _179 = _113 * 0.5;
    float _181 = _111 * 0.5;
    float _183 = _177 * 0.15915493667125701904296875;
    float _185 = _179 * 0.15915493667125701904296875;
    float _187 = _181 * 0.15915493667125701904296875;
    float _189 = _135 * 0.5;
    float _191 = _133 * 0.5;
    float _193 = _183 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = _131 * 0.5;
    float _199 = _189 * 0.15915493667125701904296875;
    float _201 = _191 * 0.15915493667125701904296875;
    float _203 = _197 * 0.15915493667125701904296875;
    float _205 = _185 * 6.283185482025146484375;
    float _207 = cos(_205);
    float _209 = _185 * 6.283185482025146484375;
    float _211 = sin(_209);
    float _213 = _183 * 6.283185482025146484375;
    float _215 = sin(_213);
    float _217 = _195 * _207;
    float _219 = _199 * 6.283185482025146484375;
    float _221 = sin(_219);
    float _223 = _195 * _211;
    float _225 = _201 * 6.283185482025146484375;
    float _227 = sin(_225);
    float _229 = _215 * _211;
    float _231 = _207 * _215;
    float _233 = _201 * 6.283185482025146484375;
    float _235 = cos(_233);
    float _237 = _187 * 6.283185482025146484375;
    float _239 = sin(_237);
    float _241 = _199 * 6.283185482025146484375;
    float _243 = cos(_241);
    float _245 = _203 * 6.283185482025146484375;
    float _247 = sin(_245);
    float _249 = _221 * _227;
    float _251 = _235 * _221;
    float _253 = _187 * 6.283185482025146484375;
    float _255 = cos(_253);
    float _257 = _243 * _235;
    float _259 = _243 * _227;
    float _261 = _239 * _229;
    float _263 = _203 * 6.283185482025146484375;
    float _265 = cos(_263);
    float _267 = _239 * _231;
    float _269 = fma(_255, _223, _267);
    float _271 = _247 * _251;
    float _273 = _255 * _229;
    float _275 = _239 * _223;
    float _277 = _265 * _249;
    float _279 = fma(_265, _259, _271);
    float _281 = -_273;
    float _283 = fma(_239, _217, _281);
    float _285 = _247 * _259;
    float _287 = -_277;
    float _289 = fma(_247, _257, _287);
    float _291 = _269 * _279;
    float _293 = -_275;
    float _295 = fma(_255, _231, _293);
    float _297 = _247 * _249;
    float _299 = -_285;
    float _301 = fma(_265, _251, _299);
    float _303 = fma(_283, _289, _291);
    float _305 = fma(_255, _217, _261);
    float _307 = fma(_265, _257, _297);
    float _309 = fma(_295, _301, _303);
    float _311 = fma(_305, _307, _309);
    float _313 = precise::max(_311, -1.0);
    float _315 = precise::min(_313, 1.0);
    bool _317 = _315 >= 0.0;
    bool _319 = isnan(_315);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    bool _327 = !_325;
    float _329 = -_315;
    float _331 = _327 ? _329 : _315;
    float _333 = abs(_331);
    float _335 = -_333;
    float _337 = _335 + 1.0;
    float _339 = abs(_331);
    float _341 = fma(_339, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _343 = as_type<int>(_337) + (-218103808);
    float _345 = abs(_331);
    float _347 = fma(_345, _341, -0.212114393711090087890625);
    bool _349 = uint(_343) >= 1920991232u;
    float _351 = abs(_331);
    float _353 = fma(_351, _347, 1.570728778839111328125);
    bool _355 = _331 < 0.0;
    float _357 = float(_355);
    bool _359 = !_349;
    float _381;
    if (!_359)
    {
        int _361 = as_type<int>(_337);
        int _363 = _343;
        int _365 = as_type<int>(_261);
        int _367 = 1408;
        int _369;
        int _371;
        int _373;
        int _375;
        int _377;
        int _379;
        _54(_361, _363, _365, _367, _369, _371, _373, _375, _377, _379);
        _381 = as_type<float>(_373);
        _383 = true;
    }
    else
    {
        float _385 = rsqrt(_337);
        float _387 = _337 * _385;
        float _389 = _385 * 0.5;
        float _391 = -_387;
        float _393 = 0.0 + _391;
        float _395 = fma(_389, _393, 0.5);
        float _397 = fma(_387, _395, _387);
        float _399 = -_397;
        float _401 = 0.0 + _399;
        float _403 = fma(_397, _401, _337);
        float _405 = fma(_389, _403, _397);
        _381 = _405;
    }
    _383 = false;
    float _407 = _381;
    int _409 = _74 + 8;
    uint _411 = uint(int(uint(_409) >> uint(2)));
    uint _413 = uint(int(uint(int(_411)) >> uint(2)));
    int _415 = int(_411) & 3;
    float _417 = (*spvDescriptorSet0.cp_c5)._m0[int(_413)][_415];
    int _419 = _68;
    int _421 = 1;
    int _423 = _56(_419, _421, (*spvDescriptorSet0.support_buffer));
    int _425 = as_type<int>(_417);
    int _427 = 1;
    int _429 = _56(_425, _427, (*spvDescriptorSet0.support_buffer));
    int3 _1933 = int3(_423, _429, 0);
    float3 _431 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1933.xy), uint(_1933.z), 0).xyz;
    float _433 = _431.x;
    float _435 = _431.y;
    float _437 = _431.z;
    int _439 = _68;
    int _441 = 1;
    int _443 = _56(_439, _441, (*spvDescriptorSet0.support_buffer));
    int _445 = as_type<int>(_417);
    int _447 = 1;
    int _449 = _56(_445, _447, (*spvDescriptorSet0.support_buffer));
    int3 _1951 = int3(_443, _449, 2);
    float3 _451 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1951.xy), uint(_1951.z), 0).xyz;
    float _453 = _451.x;
    float _455 = _451.y;
    float _457 = _451.z;
    float _459 = _353 * _407;
    float _461 = _357 * 2.0;
    float _463 = -_461;
    float _465 = fma(_459, _463, _459);
    float _467 = fma(_357, 3.1415927410125732421875, _465);
    float _469 = _467 * 0.15915493667125701904296875;
    float _471 = _469 * 6.283185482025146484375;
    float _473 = sin(_471);
    float _475 = abs(_473);
    bool _477 = _475 >= 0.001000000047497451305389404296875;
    bool _479 = isnan(_475);
    bool _481 = _477 || _479;
    bool _483 = isnan(0.001000000047497451305389404296875);
    bool _485 = _481 || _483;
    float _487 = _357;
    float _489 = _465;
    float _491 = _459;
    if (!_485)
    {
        int _493 = _74 + 28;
        uint _495 = uint(int(uint(_493) >> uint(2)));
        uint _497 = uint(int(uint(int(_495)) >> uint(2)));
        int _499 = int(_495) & 3;
        float _501 = (*spvDescriptorSet0.cp_c5)._m0[int(_497)][_499];
        _487 = _501;
    }
    float _503 = _487;
    float _505 = _503;
    if (!_485)
    {
        float _507 = -_503;
        float _509 = _507 + 1.0;
        _489 = _509;
    }
    float _511 = _489;
    float _513 = _511;
    if (!_485)
    {
        _491 = _503;
    }
    float _515 = _491;
    bool _517 = !_485;
    float _519 = _515;
    if (!_517)
    {
        int _521 = _74 + 28;
        uint _523 = uint(int(uint(_521) >> uint(2)));
        uint _525 = uint(int(uint(int(_523)) >> uint(2)));
        int _527 = int(_523) & 3;
        float _529 = (*spvDescriptorSet0.cp_c5)._m0[int(_525)][_527];
        float _531 = 1.0 / _473;
        float _533 = _467 * _529;
        float _535 = _533 * 0.15915493667125701904296875;
        float _537 = -_533;
        float _539 = _467 + _537;
        float _541 = _539 * 0.15915493667125701904296875;
        float _543 = _535 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = _541 * 6.283185482025146484375;
        float _549 = sin(_547);
        float _551 = _545 * _531;
        float _553 = _549 * _531;
        _519 = _551;
        _505 = _529;
        _513 = _553;
    }
    float _555 = _519;
    float _557 = _505;
    float _559 = _513;
    bool _561 = !_325;
    float _563 = -_555;
    float _565 = _561 ? _563 : _555;
    float _567 = _437 * _557;
    bool _569 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _571 = _457 * _557;
    float _573 = _289 * _565;
    float _575 = _307 * _565;
    float _577 = _301 * _565;
    float _579 = _279 * _565;
    float _581 = fma(_283, _559, _573);
    float _583 = fma(_305, _559, _575);
    int _585 = _74 + 20;
    uint _587 = uint(int(uint(_585) >> uint(2)));
    uint _589 = uint(int(uint(int(_587)) >> uint(2)));
    int _591 = int(_587) & 3;
    float _593 = (*spvDescriptorSet0.cp_c5)._m0[int(_589)][_591];
    float _595 = fma(_295, _559, _577);
    float _597 = fma(_269, _559, _579);
    float _599 = _583 * 2.0;
    float _601 = _581 * 2.0;
    float _603 = _597 * 2.0;
    float _605 = _595 * _599;
    float _607 = _597 * _599;
    float _609 = _581 * _599;
    float _611 = _581 * _581;
    float _613 = -_605;
    float _615 = fma(_597, _601, _613);
    float _617 = fma(_597, _601, _605);
    float _619 = fma(_595, _601, _607);
    float _621 = -_607;
    float _623 = fma(_595, _601, _621);
    float _625 = -_609;
    float _627 = fma(_595, _603, _625);
    float _629 = fma(_595, _603, _609);
    float _631 = _597 * _597;
    float _633 = _433 * _557;
    float _635 = _595 * _595;
    float _637 = fma(_631, -2.0, 1.0);
    float _639 = fma(_611, -2.0, 1.0);
    float _641 = fma(_151, _593, _633);
    float _643 = _435 * _557;
    float _645 = fma(_635, -2.0, _637);
    float _647 = fma(_635, -2.0, _639);
    float _649 = fma(_631, -2.0, _639);
    float _651 = fma(_153, _593, _643);
    float _653 = fma(_155, _593, _567);
    float _655 = _645 * _641;
    float _657 = _455 * _557;
    float _659 = _647 * _651;
    float _661 = _453 * _557;
    float _663 = _629 * _651;
    float _665 = fma(_173, _593, _657);
    float _667 = _617 * _641;
    float _669 = _623 * _641;
    float _671 = _615 * _651;
    float _673 = _619 * _653;
    float _675 = _627 * _653;
    float _677 = _649 * _653;
    float _679 = fma(_171, _593, _661);
    float _681 = fma(_175, _593, _571);
    int _683 = _68 * 112;
    bool _685 = !_569;
    float _1003;
    float _1005;
    float _1007;
    float _1009;
    float _1011;
    float _1013;
    float _1015;
    float _1017;
    float _1019;
    float _1021;
    float _1023;
    float _1025;
    if (!_685)
    {
        int _687 = 0;
        float _689 = _655;
        float _691 = _671;
        float _693 = _673;
        float _695 = _679;
        float _697 = _667;
        float _699 = _659;
        float _701 = _675;
        float _703 = _665;
        float _705 = _669;
        float _707 = _663;
        float _709 = _677;
        float _711 = _681;
        bool _713;
        int _761;
        int _771;
        int _781;
        int _791;
        int _801;
        int _811;
        int _821;
        int _831;
        int _841;
        int _851;
        int _861;
        int _871;
        int _979;
        int _983;
        int _985;
        int _989;
        int _991;
        int _993;
        float _997;
        int _999;
        int _1001;
        do
        {
            int _715 = _687;
            int _717 = as_type<int>(_689);
            int _719 = as_type<int>(_691);
            int _721 = as_type<int>(_693);
            int _723 = as_type<int>(_695);
            int _725 = as_type<int>(_697);
            int _727 = as_type<int>(_699);
            int _729 = as_type<int>(_701);
            int _731 = as_type<int>(_703);
            int _733 = as_type<int>(_705);
            float _735 = _707;
            int _737 = as_type<int>(_709);
            int _739 = as_type<int>(_711);
            uint _741 = uint(int(uint(_683) >> uint(2)));
            uint _743 = uint(int(uint(int(_741)) >> uint(2)));
            int _745 = int(_741) & 3;
            float _747 = (*spvDescriptorSet0.cp_c6)._m0[int(_743)][_745];
            bool _749 = _68 != 0;
            int _751 = _715 + 1;
            bool _753 = uint(_751) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _755 = _717;
            int _757 = as_type<int>(_747);
            int _759 = 31;
            int _2370 = _58(_755, _757, _759, _761, gl_SubgroupInvocationID);
            int _763 = _2370;
            int _765 = _719;
            int _767 = as_type<int>(_747);
            int _769 = 31;
            int _2374 = _58(_765, _767, _769, _771, gl_SubgroupInvocationID);
            int _773 = _2374;
            int _775 = _721;
            int _777 = as_type<int>(_747);
            int _779 = 31;
            int _2378 = _58(_775, _777, _779, _781, gl_SubgroupInvocationID);
            int _783 = _2378;
            int _785 = _723;
            int _787 = as_type<int>(_747);
            int _789 = 31;
            int _2382 = _58(_785, _787, _789, _791, gl_SubgroupInvocationID);
            int _793 = _2382;
            int _795 = _725;
            int _797 = as_type<int>(_747);
            int _799 = 31;
            int _2386 = _58(_795, _797, _799, _801, gl_SubgroupInvocationID);
            int _803 = _2386;
            int _805 = _727;
            int _807 = as_type<int>(_747);
            int _809 = 31;
            int _2390 = _58(_805, _807, _809, _811, gl_SubgroupInvocationID);
            int _813 = _2390;
            int _815 = _729;
            int _817 = as_type<int>(_747);
            int _819 = 31;
            int _2394 = _58(_815, _817, _819, _821, gl_SubgroupInvocationID);
            int _823 = _2394;
            int _825 = _731;
            int _827 = as_type<int>(_747);
            int _829 = 31;
            int _2398 = _58(_825, _827, _829, _831, gl_SubgroupInvocationID);
            int _833 = _2398;
            int _835 = _733;
            int _837 = as_type<int>(_747);
            int _839 = 31;
            int _2402 = _58(_835, _837, _839, _841, gl_SubgroupInvocationID);
            int _843 = _2402;
            int _845 = as_type<int>(_735);
            int _847 = as_type<int>(_747);
            int _849 = 31;
            int _2407 = _58(_845, _847, _849, _851, gl_SubgroupInvocationID);
            int _853 = _2407;
            int _855 = _737;
            int _857 = as_type<int>(_747);
            int _859 = 31;
            int _2411 = _58(_855, _857, _859, _861, gl_SubgroupInvocationID);
            int _863 = _2411;
            int _865 = _739;
            int _867 = as_type<int>(_747);
            int _869 = 31;
            int _2415 = _58(_865, _867, _869, _871, gl_SubgroupInvocationID);
            int _873 = _2415;
            bool _875 = !_749;
            _687 = _751;
            int _877 = _717;
            int _879 = _719;
            int _881 = _721;
            int _883 = _723;
            int _885 = _725;
            int _887 = _727;
            int _889 = _729;
            int _891 = _731;
            int _893 = _733;
            float _895 = _735;
            int _897 = _737;
            int _899 = _739;
            if (!_875)
            {
                float _901 = _665 * as_type<float>(_773);
                float _903 = _665 * as_type<float>(_813);
                float _905 = _665 * as_type<float>(_853);
                float _907 = _659 * as_type<float>(_773);
                float _909 = fma(_679, as_type<float>(_763), _901);
                float _911 = _659 * as_type<float>(_813);
                float _913 = _675 * as_type<float>(_773);
                float _915 = _667 * as_type<float>(_773);
                float _917 = _667 * as_type<float>(_813);
                float _919 = fma(_671, as_type<float>(_803), _911);
                float _921 = _667 * as_type<float>(_853);
                float _923 = _675 * as_type<float>(_813);
                float _925 = fma(_679, as_type<float>(_803), _903);
                float _927 = _659 * as_type<float>(_853);
                float _929 = _675 * as_type<float>(_853);
                float _931 = fma(_679, as_type<float>(_843), _905);
                float _933 = fma(_671, as_type<float>(_763), _907);
                float _935 = fma(_673, as_type<float>(_763), _913);
                float _937 = fma(_655, as_type<float>(_763), _915);
                float _939 = fma(_655, as_type<float>(_803), _917);
                float _941 = fma(_655, as_type<float>(_843), _921);
                float _943 = fma(_681, as_type<float>(_783), _909);
                float _945 = fma(_673, as_type<float>(_803), _923);
                float _947 = fma(_671, as_type<float>(_843), _927);
                float _949 = fma(_673, as_type<float>(_843), _929);
                float _951 = fma(_681, as_type<float>(_823), _925);
                float _953 = fma(_681, as_type<float>(_863), _931);
                float _955 = fma(_663, as_type<float>(_783), _933);
                float _957 = fma(_677, as_type<float>(_783), _935);
                float _959 = fma(_663, as_type<float>(_823), _919);
                float _961 = fma(_669, as_type<float>(_783), _937);
                float _963 = fma(_669, as_type<float>(_823), _939);
                float _965 = fma(_669, as_type<float>(_863), _941);
                float _967 = as_type<float>(_793) + _943;
                float _969 = fma(_677, as_type<float>(_823), _945);
                float _971 = fma(_663, as_type<float>(_863), _947);
                float _973 = fma(_677, as_type<float>(_863), _949);
                float _975 = as_type<float>(_833) + _951;
                float _977 = as_type<float>(_873) + _953;
                _877 = as_type<int>(_961);
                _879 = as_type<int>(_955);
                _881 = as_type<int>(_957);
                _883 = as_type<int>(_967);
                _885 = as_type<int>(_963);
                _887 = as_type<int>(_959);
                _889 = as_type<int>(_969);
                _891 = as_type<int>(_975);
                _893 = as_type<int>(_965);
                _895 = _971;
                _897 = as_type<int>(_973);
                _899 = as_type<int>(_977);
            }
            _979 = _877;
            int _981 = _879;
            _983 = _881;
            _985 = _883;
            int _987 = _885;
            _989 = _887;
            _991 = _889;
            _993 = _891;
            int _995 = _893;
            _997 = _895;
            _999 = _897;
            _1001 = _899;
            _713 = !_753;
            _689 = as_type<float>(_979);
            _691 = as_type<float>(_981);
            _693 = as_type<float>(_983);
            _695 = as_type<float>(_985);
            _697 = as_type<float>(_987);
            _699 = as_type<float>(_989);
            _701 = as_type<float>(_991);
            _703 = as_type<float>(_993);
            _705 = as_type<float>(_995);
            _707 = _997;
            _709 = as_type<float>(_999);
            _711 = as_type<float>(_1001);
            _1003 = as_type<float>(_981);
            _1005 = as_type<float>(_987);
            _1007 = as_type<float>(_995);
        } while (_713);
        _1009 = as_type<float>(_989);
        _1011 = _997;
        _1013 = as_type<float>(_979);
        _1015 = as_type<float>(_983);
        _1017 = as_type<float>(_991);
        _1019 = as_type<float>(_999);
        _1021 = as_type<float>(_993);
        _1023 = as_type<float>(_1001);
        _1025 = as_type<float>(_985);
        _1027 = true;
    }
    else
    {
        _1003 = _671;
        _1009 = _659;
        _1011 = _663;
        _1013 = _655;
        _1005 = _667;
        _1007 = _669;
        _1015 = _673;
        _1017 = _675;
        _1019 = _677;
        _1021 = _665;
        _1023 = _681;
        _1025 = _679;
    }
    _1027 = false;
    float _1029 = _1003;
    float _1031 = _1009;
    float _1033 = _1011;
    float _1035 = _1013;
    float _1037 = _1005;
    float _1039 = _1007;
    float _1041 = _1015;
    float _1043 = _1017;
    float _1045 = _1019;
    float _1047 = _1021;
    float _1049 = _1023;
    float _1051 = _1025;
    int _1053 = _683 + 80;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    uint _1057 = uint(int(uint(int(_1055)) >> uint(2)));
    int _1059 = int(_1055) & 3;
    float _1061 = (*spvDescriptorSet0.cp_c6)._m0[int(_1057)][_1059];
    int _1063 = int(_1055) + 1;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    int _1067 = _1063 & 3;
    float _1069 = (*spvDescriptorSet0.cp_c6)._m0[int(_1065)][_1067];
    int _1071 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1073 = _1071 + _68;
    int _1075 = _683 + 64;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    uint _1079 = uint(int(uint(int(_1077)) >> uint(2)));
    int _1081 = int(_1077) & 3;
    float _1083 = (*spvDescriptorSet0.cp_c6)._m0[int(_1079)][_1081];
    int _1085 = int(_1077) + 1;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    int _1089 = _1085 & 3;
    float _1091 = (*spvDescriptorSet0.cp_c6)._m0[int(_1087)][_1089];
    int _1093 = _1073 * 48;
    int _1095 = _683 + 88;
    uint _1097 = uint(int(uint(_1095) >> uint(2)));
    uint _1099 = uint(int(uint(int(_1097)) >> uint(2)));
    int _1101 = int(_1097) & 3;
    float _1103 = (*spvDescriptorSet0.cp_c6)._m0[int(_1099)][_1101];
    int _1105 = int(_1097) + 1;
    uint _1107 = uint(int(uint(_1105) >> uint(2)));
    int _1109 = _1105 & 3;
    float _1111 = (*spvDescriptorSet0.cp_c6)._m0[int(_1107)][_1109];
    int _1113 = _683 + 72;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.cp_c6)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.cp_c6)._m0[int(_1125)][_1127];
    int _1131 = _683 + 96;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    uint _1135 = uint(int(uint(int(_1133)) >> uint(2)));
    int _1137 = int(_1133) & 3;
    float _1139 = (*spvDescriptorSet0.cp_c6)._m0[int(_1135)][_1137];
    int _1141 = int(_1133) + 1;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    int _1145 = _1141 & 3;
    float _1147 = (*spvDescriptorSet0.cp_c6)._m0[int(_1143)][_1145];
    int _1149 = _683 + 104;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    uint _1153 = uint(int(uint(int(_1151)) >> uint(2)));
    int _1155 = int(_1151) & 3;
    float _1157 = (*spvDescriptorSet0.cp_c6)._m0[int(_1153)][_1155];
    int _1159 = int(_1151) + 1;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    int _1163 = _1159 & 3;
    float _1165 = (*spvDescriptorSet0.cp_c6)._m0[int(_1161)][_1163];
    float _1167 = _1029 * _1061;
    float _1169 = _1031 * _1061;
    float _1171 = _1033 * _1061;
    float _1173 = _1029 * _1069;
    float _1175 = _1033 * _1069;
    int _1177 = _683 + 16;
    uint _1179 = uint(int(uint(_1177) >> uint(2)));
    uint _1181 = uint(int(uint(int(_1179)) >> uint(2)));
    int _1183 = int(_1179) & 3;
    float _1185 = (*spvDescriptorSet0.cp_c6)._m0[int(_1181)][_1183];
    int _1187 = int(_1179) + 1;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    int _1191 = _1187 & 3;
    float _1193 = (*spvDescriptorSet0.cp_c6)._m0[int(_1189)][_1191];
    float _1195 = fma(_1035, _1083, _1167);
    float _1197 = fma(_1037, _1083, _1169);
    float _1199 = fma(_1039, _1083, _1171);
    float _1201 = _1031 * _1069;
    float _1203 = fma(_1035, _1091, _1173);
    int _1205 = _683 + 32;
    uint _1207 = uint(int(uint(_1205) >> uint(2)));
    uint _1209 = uint(int(uint(int(_1207)) >> uint(2)));
    int _1211 = int(_1207) & 3;
    float _1213 = (*spvDescriptorSet0.cp_c6)._m0[int(_1209)][_1211];
    int _1215 = int(_1207) + 1;
    uint _1217 = uint(int(uint(_1215) >> uint(2)));
    int _1219 = _1215 & 3;
    float _1221 = (*spvDescriptorSet0.cp_c6)._m0[int(_1217)][_1219];
    float _1223 = fma(_1039, _1091, _1175);
    float _1225 = fma(_1037, _1091, _1201);
    float _1227 = _1029 * _1103;
    float _1229 = _1031 * _1103;
    float _1231 = _1029 * _1111;
    float _1233 = _1031 * _1111;
    float _1235 = _1033 * _1103;
    int _1237 = _683 + 48;
    uint _1239 = uint(int(uint(_1237) >> uint(2)));
    uint _1241 = uint(int(uint(int(_1239)) >> uint(2)));
    int _1243 = int(_1239) & 3;
    float _1245 = (*spvDescriptorSet0.cp_c6)._m0[int(_1241)][_1243];
    int _1247 = int(_1239) + 1;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    int _1251 = _1247 & 3;
    float _1253 = (*spvDescriptorSet0.cp_c6)._m0[int(_1249)][_1251];
    float _1255 = _1033 * _1111;
    float _1257 = fma(_1035, _1121, _1227);
    float _1259 = fma(_1037, _1121, _1229);
    float _1261 = fma(_1035, _1129, _1231);
    float _1263 = fma(_1037, _1129, _1233);
    float _1265 = fma(_1039, _1121, _1235);
    int _1267 = _683 + 24;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    uint _1271 = uint(int(uint(int(_1269)) >> uint(2)));
    int _1273 = int(_1269) & 3;
    float _1275 = (*spvDescriptorSet0.cp_c6)._m0[int(_1271)][_1273];
    int _1277 = int(_1269) + 1;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    int _1281 = _1277 & 3;
    float _1283 = (*spvDescriptorSet0.cp_c6)._m0[int(_1279)][_1281];
    float _1285 = fma(_1039, _1129, _1255);
    float _1287 = fma(_1041, _1139, _1195);
    float _1289 = fma(_1041, _1147, _1203);
    float _1291 = fma(_1043, _1139, _1197);
    float _1293 = fma(_1043, _1147, _1225);
    float _1295 = fma(_1045, _1139, _1199);
    int _1297 = _683 + 40;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    uint _1301 = uint(int(uint(int(_1299)) >> uint(2)));
    int _1303 = int(_1299) & 3;
    float _1305 = (*spvDescriptorSet0.cp_c6)._m0[int(_1301)][_1303];
    int _1307 = int(_1299) + 1;
    uint _1309 = uint(int(uint(_1307) >> uint(2)));
    int _1311 = _1307 & 3;
    float _1313 = (*spvDescriptorSet0.cp_c6)._m0[int(_1309)][_1311];
    float _1315 = fma(_1045, _1147, _1223);
    float _1317 = fma(_1041, _1157, _1257);
    float _1319 = fma(_1043, _1165, _1263);
    float _1321 = fma(_1041, _1165, _1261);
    float _1323 = fma(_1045, _1165, _1285);
    float _1325 = fma(_1043, _1157, _1259);
    int _1327 = _683 + 56;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.cp_c6)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.cp_c6)._m0[int(_1339)][_1341];
    float _1345 = _1319 + _1047;
    float _1347 = fma(_1045, _1157, _1265);
    float _1349 = _1323 + _1049;
    float _1351 = _1321 + _1051;
    float _1353 = _1291 * _1193;
    float _1355 = _1293 * _1193;
    float _1357 = _1325 * _1193;
    float _1359 = _1345 * _1193;
    float _1361 = fma(_1287, _1185, _1353);
    float _1363 = fma(_1289, _1185, _1355);
    float _1365 = fma(_1317, _1185, _1357);
    float _1367 = fma(_1351, _1185, _1359);
    float _1369 = _1345 * _1221;
    float _1371 = _1291 * _1221;
    float _1373 = _1293 * _1221;
    float _1375 = _1325 * _1221;
    float _1377 = fma(_1351, _1213, _1369);
    float _1379 = fma(_1287, _1213, _1371);
    float _1381 = fma(_1289, _1213, _1373);
    float _1383 = fma(_1317, _1213, _1375);
    float _1385 = _1345 * _1253;
    float _1387 = _1291 * _1253;
    float _1389 = _1293 * _1253;
    float _1391 = _1325 * _1253;
    float _1393 = fma(_1351, _1245, _1385);
    float _1395 = fma(_1287, _1245, _1387);
    float _1397 = fma(_1289, _1245, _1389);
    float _1399 = fma(_1317, _1245, _1391);
    float _1401 = fma(_1349, _1275, _1367);
    float _1403 = fma(_1295, _1275, _1361);
    float _1405 = fma(_1315, _1275, _1363);
    float _1407 = fma(_1347, _1275, _1365);
    float _1409 = _1401 + _1283;
    float _1411 = fma(_1349, _1305, _1377);
    float _1413 = fma(_1295, _1305, _1379);
    float _1415 = fma(_1315, _1305, _1381);
    int _1417 = _1093 + 16;
    float _1419 = fma(_1347, _1305, _1383);
    float _1421 = _1411 + _1313;
    int _1423 = _1093 + 32;
    float _1425 = fma(_1349, _1335, _1393);
    float _1427 = fma(_1295, _1335, _1395);
    float _1429 = fma(_1315, _1335, _1397);
    float _1431 = fma(_1347, _1335, _1399);
    float _1433 = _1425 + _1343;
    int _1435 = _1093 + 48;
    uint _1437 = uint(int(uint(_1417) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1437)] = as_type<uint>(_1403);
    int _1439 = _1417 + 4;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1441)] = as_type<uint>(_1405);
    int _1443 = _1417 + 8;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1445)] = as_type<uint>(_1407);
    int _1447 = _1417 + 12;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1449)] = as_type<uint>(_1409);
    uint _1451 = uint(int(uint(_1423) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1451)] = as_type<uint>(_1413);
    int _1453 = _1423 + 4;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1455)] = as_type<uint>(_1415);
    int _1457 = _1423 + 8;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1459)] = as_type<uint>(_1419);
    int _1461 = _1423 + 12;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1463)] = as_type<uint>(_1421);
    uint _1465 = uint(int(uint(_1435) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1465)] = as_type<uint>(_1427);
    int _1467 = _1435 + 4;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1469)] = as_type<uint>(_1429);
    int _1471 = _1435 + 8;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1473)] = as_type<uint>(_1431);
    int _1475 = _1435 + 12;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1477)] = as_type<uint>(_1433);
}

