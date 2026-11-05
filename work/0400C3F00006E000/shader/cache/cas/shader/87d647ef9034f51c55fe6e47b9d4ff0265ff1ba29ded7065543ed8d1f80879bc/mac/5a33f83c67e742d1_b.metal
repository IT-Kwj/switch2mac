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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _2667, thread const int& _2668, constant _10& support_buffer)
{
    int _2671 = 1 + _2668;
    float _2673 = support_buffer._m5[_2671].x;
    bool _2675 = _2673 == 1.0;
    if (_2675)
    {
        return _2667;
    }
    float _2677 = float(_2667);
    float _2679 = _2677 * _2673;
    int _2681 = int(_2679);
    return _2681;
}

static inline __attribute__((always_inline))
int _56(thread const int& _2703, thread const int& _2704, thread const int& _2705, thread int& _2706, thread uint& gl_SubgroupInvocationID)
{
    int _2709 = _2705 & 31;
    uint _2711 = uint(int(uint(_2705) >> uint(8)));
    int _2713 = int(_2711) & 31;
    float _2715 = as_type<float>(gl_SubgroupInvocationID);
    int _2717 = as_type<int>(_2715) & _2713;
    int _2719 = ~_2713;
    int _2721 = _2709 & _2719;
    int _2723 = _2721 | _2717;
    int _2725 = ~_2713;
    int _2727 = _2704 & _2725;
    int _2729 = _2727 | _2717;
    bool _2731 = uint(_2729) <= uint(_2723);
    _2706 = _2731 ? (-1) : 0;
    float _2733 = spvSubgroupShuffle(as_type<float>(_2703), uint(_2729));
    uint _2735 = uint(_2731 ? as_type<int>(_2733) : _2703);
    return int(_2735);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _631 = false;
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
    int _83 = _66;
    int _85 = 0;
    int _87 = _54(_83, _85, (*spvDescriptorSet0.support_buffer));
    int _89 = as_type<int>(_81);
    int _91 = 0;
    int _93 = _54(_89, _91, (*spvDescriptorSet0.support_buffer));
    int3 _1144 = int3(_87, _93, 1);
    float3 _97 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1144.xy), uint(_1144.z), 0).xyz;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    int _105 = _66;
    int _107 = 0;
    int _109 = _54(_105, _107, (*spvDescriptorSet0.support_buffer));
    int _111 = as_type<int>(_81);
    int _113 = 0;
    int _115 = _54(_111, _113, (*spvDescriptorSet0.support_buffer));
    int3 _1162 = int3(_109, _115, 0);
    float3 _117 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1162.xy), uint(_1162.z), 0).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    int _125 = _66;
    int _127 = 0;
    int _129 = _54(_125, _127, (*spvDescriptorSet0.support_buffer));
    int _131 = as_type<int>(_81);
    int _133 = 0;
    int _135 = _54(_131, _133, (*spvDescriptorSet0.support_buffer));
    int3 _1180 = int3(_129, _135, 2);
    float3 _137 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1180.xy), uint(_1180.z), 0).xyz;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    bool _145 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x);
    bool _147 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _149 = _99 * 0.15915493667125701904296875;
    float _151 = _103 * 0.15915493667125701904296875;
    float _153 = _101 * 0.15915493667125701904296875;
    float _155 = _149 * 6.283185482025146484375;
    float _157 = sin(_155);
    float _159 = _149 * 6.283185482025146484375;
    float _161 = cos(_159);
    float _163 = _151 * 6.283185482025146484375;
    float _165 = sin(_163);
    float _167 = _151 * 6.283185482025146484375;
    float _169 = cos(_167);
    float _171 = _153 * 6.283185482025146484375;
    float _173 = cos(_171);
    float _175 = _165 * _161;
    float _177 = _157 * _165;
    float _179 = _153 * 6.283185482025146484375;
    float _181 = sin(_179);
    float _183 = _161 * _169;
    float _185 = _157 * _169;
    float _187 = _161 * _173;
    float _189 = _157 * _173;
    float _191 = _173 * _119;
    float _193 = _157 * _181;
    float _195 = fma(_181, _183, _177);
    float _197 = -_185;
    float _199 = fma(_181, _175, _197);
    float _201 = _169 * _191;
    float _203 = fma(_165, _193, _183);
    float _205 = -_175;
    float _207 = fma(_169, _193, _205);
    float _209 = _119 * _181;
    float _211 = _165 * _191;
    float _213 = _121 * _189;
    float _215 = _121 * _207;
    float _217 = _121 * _203;
    float _219 = _123 * _187;
    float _221 = _123 * _195;
    float _223 = _123 * _199;
    float _225 = _221;
    if (!_145)
    {
        int _227 = _66 * 48;
        float _229 = -_209;
        float _231 = _229 + (-0.0);
        int _233 = _227 + 16;
        uint _235 = uint(int(uint(_227) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_235)] = as_type<uint>(_201);
        int _237 = _227 + 4;
        uint _239 = uint(int(uint(_237) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_239)] = as_type<uint>(_215);
        int _241 = _227 + 8;
        uint _243 = uint(int(uint(_241) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_243)] = as_type<uint>(_221);
        int _245 = _227 + 12;
        uint _247 = uint(int(uint(_245) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_247)] = as_type<uint>(_139);
        int _249 = _227 + 32;
        uint _251 = uint(int(uint(_233) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_251)] = as_type<uint>(_211);
        int _253 = _233 + 4;
        uint _255 = uint(int(uint(_253) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_255)] = as_type<uint>(_217);
        int _257 = _233 + 8;
        uint _259 = uint(int(uint(_257) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_259)] = as_type<uint>(_223);
        int _261 = _233 + 12;
        uint _263 = uint(int(uint(_261) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_263)] = as_type<uint>(_141);
        uint _265 = uint(int(uint(_249) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_265)] = as_type<uint>(_231);
        int _267 = _249 + 4;
        uint _269 = uint(int(uint(_267) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_269)] = as_type<uint>(_213);
        int _271 = _249 + 8;
        uint _273 = uint(int(uint(_271) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_273)] = as_type<uint>(_219);
        int _275 = _249 + 12;
        uint _277 = uint(int(uint(_275) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_277)] = as_type<uint>(_143);
    }
    int _279 = _66 * 112;
    bool _281 = !_147;
    float _609;
    float _611;
    float _613;
    float _615;
    float _617;
    float _619;
    float _621;
    float _623;
    float _625;
    float _627;
    float _629;
    if (!_281)
    {
        float _283 = -_209;
        float _285 = _283 + (-0.0);
        int _287 = 0;
        float _289 = _201;
        float _291 = _215;
        float _293 = _221;
        float _295 = _139;
        float _297 = _211;
        float _299 = _217;
        float _301 = _223;
        float _303 = _141;
        float _305 = _285;
        float _307 = _213;
        float _309 = _219;
        float _311 = _143;
        bool _313;
        int _361;
        int _371;
        int _381;
        int _391;
        int _401;
        int _411;
        int _421;
        int _431;
        int _441;
        int _451;
        int _461;
        int _471;
        float _585;
        float _589;
        int _591;
        int _595;
        int _597;
        int _599;
        int _603;
        int _605;
        int _607;
        do
        {
            int _315 = _287;
            float _317 = _289;
            int _319 = as_type<int>(_291);
            float _321 = _293;
            int _323 = as_type<int>(_295);
            int _325 = as_type<int>(_297);
            int _327 = as_type<int>(_299);
            int _329 = as_type<int>(_301);
            int _331 = as_type<int>(_303);
            int _333 = as_type<int>(_305);
            int _335 = as_type<int>(_307);
            int _337 = as_type<int>(_309);
            int _339 = as_type<int>(_311);
            uint _341 = uint(int(uint(_279) >> uint(2)));
            uint _343 = uint(int(uint(int(_341)) >> uint(2)));
            int _345 = int(_341) & 3;
            float _347 = (*spvDescriptorSet0.cp_c6)._m0[int(_343)][_345];
            bool _349 = _66 != 0;
            int _351 = _315 + 1;
            bool _353 = uint(_351) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _355 = as_type<int>(_317);
            int _357 = as_type<int>(_347);
            int _359 = 31;
            int _1520 = _56(_355, _357, _359, _361, gl_SubgroupInvocationID);
            int _363 = _1520;
            int _365 = _319;
            int _367 = as_type<int>(_347);
            int _369 = 31;
            int _1524 = _56(_365, _367, _369, _371, gl_SubgroupInvocationID);
            int _373 = _1524;
            int _375 = as_type<int>(_321);
            int _377 = as_type<int>(_347);
            int _379 = 31;
            int _1529 = _56(_375, _377, _379, _381, gl_SubgroupInvocationID);
            int _383 = _1529;
            int _385 = _323;
            int _387 = as_type<int>(_347);
            int _389 = 31;
            int _1533 = _56(_385, _387, _389, _391, gl_SubgroupInvocationID);
            int _393 = _1533;
            int _395 = _325;
            int _397 = as_type<int>(_347);
            int _399 = 31;
            int _1537 = _56(_395, _397, _399, _401, gl_SubgroupInvocationID);
            int _403 = _1537;
            int _405 = _327;
            int _407 = as_type<int>(_347);
            int _409 = 31;
            int _1541 = _56(_405, _407, _409, _411, gl_SubgroupInvocationID);
            int _413 = _1541;
            int _415 = _329;
            int _417 = as_type<int>(_347);
            int _419 = 31;
            int _1545 = _56(_415, _417, _419, _421, gl_SubgroupInvocationID);
            int _423 = _1545;
            int _425 = _331;
            int _427 = as_type<int>(_347);
            int _429 = 31;
            int _1549 = _56(_425, _427, _429, _431, gl_SubgroupInvocationID);
            int _433 = _1549;
            int _435 = _333;
            int _437 = as_type<int>(_347);
            int _439 = 31;
            int _1553 = _56(_435, _437, _439, _441, gl_SubgroupInvocationID);
            int _443 = _1553;
            int _445 = _335;
            int _447 = as_type<int>(_347);
            int _449 = 31;
            int _1557 = _56(_445, _447, _449, _451, gl_SubgroupInvocationID);
            int _453 = _1557;
            int _455 = _337;
            int _457 = as_type<int>(_347);
            int _459 = 31;
            int _1561 = _56(_455, _457, _459, _461, gl_SubgroupInvocationID);
            int _463 = _1561;
            int _465 = _339;
            int _467 = as_type<int>(_347);
            int _469 = 31;
            int _1565 = _56(_465, _467, _469, _471, gl_SubgroupInvocationID);
            int _473 = _1565;
            bool _475 = !_349;
            _287 = _351;
            float _477 = _317;
            int _479 = _319;
            float _481 = _321;
            int _483 = _323;
            int _485 = _325;
            int _487 = _327;
            int _489 = _329;
            int _491 = _331;
            int _493 = _333;
            int _495 = _335;
            int _497 = _337;
            int _499 = _339;
            if (!_475)
            {
                float _501 = _141 * as_type<float>(_373);
                float _503 = _223 * as_type<float>(_413);
                float _505 = _217 * as_type<float>(_413);
                float _507 = _141 * as_type<float>(_413);
                float _509 = fma(_139, as_type<float>(_363), _501);
                float _511 = _211 * as_type<float>(_413);
                float _513 = _211 * as_type<float>(_373);
                float _515 = _217 * as_type<float>(_373);
                float _517 = _223 * as_type<float>(_373);
                float _519 = fma(_221, as_type<float>(_403), _503);
                float _521 = fma(_201, as_type<float>(_403), _511);
                float _523 = fma(_215, as_type<float>(_403), _505);
                float _525 = fma(_139, as_type<float>(_403), _507);
                float _527 = _211 * as_type<float>(_453);
                float _529 = _217 * as_type<float>(_453);
                float _531 = _141 * as_type<float>(_453);
                float _533 = fma(_201, as_type<float>(_363), _513);
                float _535 = fma(_215, as_type<float>(_363), _515);
                float _537 = fma(_221, as_type<float>(_363), _517);
                float _539 = fma(_201, as_type<float>(_443), _527);
                float _541 = _223 * as_type<float>(_453);
                float _543 = fma(_215, as_type<float>(_443), _529);
                float _545 = fma(_139, as_type<float>(_443), _531);
                float _547 = -_209;
                float _549 = fma(_547, as_type<float>(_383), _533);
                float _551 = fma(_213, as_type<float>(_383), _535);
                float _553 = fma(_219, as_type<float>(_383), _537);
                float _555 = fma(_143, as_type<float>(_383), _509);
                float _557 = -_209;
                float _559 = fma(_557, as_type<float>(_423), _521);
                float _561 = fma(_213, as_type<float>(_423), _523);
                float _563 = fma(_219, as_type<float>(_423), _519);
                float _565 = -_209;
                float _567 = fma(_565, as_type<float>(_463), _539);
                float _569 = fma(_221, as_type<float>(_443), _541);
                float _571 = fma(_143, as_type<float>(_423), _525);
                float _573 = fma(_143, as_type<float>(_463), _545);
                float _575 = fma(_213, as_type<float>(_463), _543);
                float _577 = fma(_219, as_type<float>(_463), _569);
                float _579 = as_type<float>(_393) + _555;
                float _581 = as_type<float>(_433) + _571;
                float _583 = as_type<float>(_473) + _573;
                _477 = _549;
                _479 = as_type<int>(_551);
                _481 = _553;
                _483 = as_type<int>(_579);
                _485 = as_type<int>(_559);
                _487 = as_type<int>(_561);
                _489 = as_type<int>(_563);
                _491 = as_type<int>(_581);
                _493 = as_type<int>(_567);
                _495 = as_type<int>(_575);
                _497 = as_type<int>(_577);
                _499 = as_type<int>(_583);
            }
            _585 = _477;
            int _587 = _479;
            _589 = _481;
            _591 = _483;
            int _593 = _485;
            _595 = _487;
            _597 = _489;
            _599 = _491;
            int _601 = _493;
            _603 = _495;
            _605 = _497;
            _607 = _499;
            _313 = !_353;
            _289 = _585;
            _291 = as_type<float>(_587);
            _293 = _589;
            _295 = as_type<float>(_591);
            _297 = as_type<float>(_593);
            _299 = as_type<float>(_595);
            _301 = as_type<float>(_597);
            _303 = as_type<float>(_599);
            _305 = as_type<float>(_601);
            _307 = as_type<float>(_603);
            _309 = as_type<float>(_605);
            _311 = as_type<float>(_607);
            _609 = as_type<float>(_587);
            _611 = as_type<float>(_593);
            _613 = as_type<float>(_601);
        } while (_313);
        _615 = as_type<float>(_595);
        _617 = as_type<float>(_603);
        _619 = _585;
        _225 = _589;
        _621 = as_type<float>(_597);
        _623 = as_type<float>(_605);
        _625 = as_type<float>(_599);
        _627 = as_type<float>(_591);
        _629 = as_type<float>(_607);
        _631 = true;
    }
    else
    {
        float _633 = -_209;
        float _635 = _633 + (-0.0);
        _609 = _215;
        _615 = _217;
        _617 = _213;
        _619 = _201;
        _611 = _211;
        _613 = _635;
        _621 = _223;
        _623 = _219;
        _625 = _141;
        _627 = _139;
        _629 = _143;
    }
    _631 = false;
    float _637 = _609;
    float _639 = _615;
    float _641 = _617;
    float _643 = _619;
    float _645 = _611;
    float _647 = _613;
    float _649 = _225;
    float _651 = _621;
    float _653 = _623;
    float _655 = _625;
    float _657 = _627;
    float _659 = _629;
    int _661 = _279 + 80;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    uint _665 = uint(int(uint(int(_663)) >> uint(2)));
    int _667 = int(_663) & 3;
    float _669 = (*spvDescriptorSet0.cp_c6)._m0[int(_665)][_667];
    int _671 = int(_663) + 1;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    int _675 = _671 & 3;
    float _677 = (*spvDescriptorSet0.cp_c6)._m0[int(_673)][_675];
    int _679 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _681 = _679 + _66;
    int _683 = _279 + 64;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.cp_c6)._m0[int(_687)][_689];
    int _693 = int(_685) + 1;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    int _697 = _693 & 3;
    float _699 = (*spvDescriptorSet0.cp_c6)._m0[int(_695)][_697];
    int _701 = _681 * 48;
    int _703 = _279 + 88;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    uint _707 = uint(int(uint(int(_705)) >> uint(2)));
    int _709 = int(_705) & 3;
    float _711 = (*spvDescriptorSet0.cp_c6)._m0[int(_707)][_709];
    int _713 = int(_705) + 1;
    uint _715 = uint(int(uint(_713) >> uint(2)));
    int _717 = _713 & 3;
    float _719 = (*spvDescriptorSet0.cp_c6)._m0[int(_715)][_717];
    int _721 = _279 + 72;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    uint _725 = uint(int(uint(int(_723)) >> uint(2)));
    int _727 = int(_723) & 3;
    float _729 = (*spvDescriptorSet0.cp_c6)._m0[int(_725)][_727];
    int _731 = int(_723) + 1;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    int _735 = _731 & 3;
    float _737 = (*spvDescriptorSet0.cp_c6)._m0[int(_733)][_735];
    int _739 = _279 + 96;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    uint _743 = uint(int(uint(int(_741)) >> uint(2)));
    int _745 = int(_741) & 3;
    float _747 = (*spvDescriptorSet0.cp_c6)._m0[int(_743)][_745];
    int _749 = int(_741) + 1;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    int _753 = _749 & 3;
    float _755 = (*spvDescriptorSet0.cp_c6)._m0[int(_751)][_753];
    int _757 = _279 + 104;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    uint _761 = uint(int(uint(int(_759)) >> uint(2)));
    int _763 = int(_759) & 3;
    float _765 = (*spvDescriptorSet0.cp_c6)._m0[int(_761)][_763];
    int _767 = int(_759) + 1;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    int _771 = _767 & 3;
    float _773 = (*spvDescriptorSet0.cp_c6)._m0[int(_769)][_771];
    float _775 = _637 * _669;
    float _777 = _639 * _669;
    float _779 = _641 * _669;
    int _781 = _279 + 16;
    uint _783 = uint(int(uint(_781) >> uint(2)));
    uint _785 = uint(int(uint(int(_783)) >> uint(2)));
    int _787 = int(_783) & 3;
    float _789 = (*spvDescriptorSet0.cp_c6)._m0[int(_785)][_787];
    int _791 = int(_783) + 1;
    uint _793 = uint(int(uint(_791) >> uint(2)));
    int _795 = _791 & 3;
    float _797 = (*spvDescriptorSet0.cp_c6)._m0[int(_793)][_795];
    float _799 = _641 * _677;
    float _801 = fma(_643, _691, _775);
    float _803 = fma(_645, _691, _777);
    float _805 = fma(_647, _691, _779);
    float _807 = _637 * _677;
    int _809 = _279 + 32;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    uint _813 = uint(int(uint(int(_811)) >> uint(2)));
    int _815 = int(_811) & 3;
    float _817 = (*spvDescriptorSet0.cp_c6)._m0[int(_813)][_815];
    int _819 = int(_811) + 1;
    uint _821 = uint(int(uint(_819) >> uint(2)));
    int _823 = _819 & 3;
    float _825 = (*spvDescriptorSet0.cp_c6)._m0[int(_821)][_823];
    float _827 = fma(_647, _699, _799);
    float _829 = _639 * _677;
    float _831 = fma(_643, _699, _807);
    float _833 = _637 * _711;
    float _835 = _639 * _711;
    float _837 = _637 * _719;
    float _839 = _639 * _719;
    int _841 = _279 + 48;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    uint _845 = uint(int(uint(int(_843)) >> uint(2)));
    int _847 = int(_843) & 3;
    float _849 = (*spvDescriptorSet0.cp_c6)._m0[int(_845)][_847];
    int _851 = int(_843) + 1;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    int _855 = _851 & 3;
    float _857 = (*spvDescriptorSet0.cp_c6)._m0[int(_853)][_855];
    float _859 = _641 * _711;
    float _861 = _641 * _719;
    float _863 = fma(_645, _699, _829);
    float _865 = fma(_643, _729, _833);
    float _867 = fma(_643, _737, _837);
    float _869 = fma(_645, _729, _835);
    float _871 = fma(_645, _737, _839);
    int _873 = _279 + 24;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    uint _877 = uint(int(uint(int(_875)) >> uint(2)));
    int _879 = int(_875) & 3;
    float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
    int _883 = int(_875) + 1;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    int _887 = _883 & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    float _891 = fma(_647, _729, _859);
    float _893 = fma(_647, _737, _861);
    float _895 = fma(_649, _747, _801);
    float _897 = fma(_651, _747, _803);
    float _899 = fma(_653, _747, _805);
    float _901 = fma(_649, _755, _831);
    int _903 = _279 + 40;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    uint _907 = uint(int(uint(int(_905)) >> uint(2)));
    int _909 = int(_905) & 3;
    float _911 = (*spvDescriptorSet0.cp_c6)._m0[int(_907)][_909];
    int _913 = int(_905) + 1;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    int _917 = _913 & 3;
    float _919 = (*spvDescriptorSet0.cp_c6)._m0[int(_915)][_917];
    float _921 = fma(_651, _755, _863);
    float _923 = fma(_653, _755, _827);
    float _925 = fma(_651, _765, _869);
    float _927 = fma(_651, _773, _871);
    float _929 = fma(_649, _765, _865);
    float _931 = fma(_649, _773, _867);
    int _933 = _279 + 56;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.cp_c6)._m0[int(_937)][_939];
    int _943 = int(_935) + 1;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    int _947 = _943 & 3;
    float _949 = (*spvDescriptorSet0.cp_c6)._m0[int(_945)][_947];
    float _951 = fma(_653, _773, _893);
    float _953 = _927 + _655;
    float _955 = fma(_653, _765, _891);
    float _957 = _931 + _657;
    float _959 = _951 + _659;
    float _961 = _897 * _797;
    float _963 = _921 * _797;
    float _965 = _925 * _797;
    float _967 = _953 * _797;
    float _969 = fma(_895, _789, _961);
    float _971 = fma(_901, _789, _963);
    float _973 = fma(_929, _789, _965);
    float _975 = fma(_957, _789, _967);
    float _977 = _953 * _825;
    float _979 = _925 * _825;
    float _981 = _921 * _825;
    float _983 = _897 * _825;
    float _985 = fma(_957, _817, _977);
    float _987 = fma(_929, _817, _979);
    float _989 = fma(_901, _817, _981);
    float _991 = fma(_895, _817, _983);
    float _993 = _953 * _857;
    float _995 = _925 * _857;
    float _997 = _921 * _857;
    float _999 = _897 * _857;
    float _1001 = fma(_957, _849, _993);
    float _1003 = fma(_929, _849, _995);
    float _1005 = fma(_901, _849, _997);
    float _1007 = fma(_895, _849, _999);
    float _1009 = fma(_959, _881, _975);
    float _1011 = fma(_899, _881, _969);
    float _1013 = fma(_923, _881, _971);
    float _1015 = fma(_955, _881, _973);
    float _1017 = _1009 + _889;
    int _1019 = _701 + 16;
    float _1021 = fma(_959, _911, _985);
    float _1023 = fma(_955, _911, _987);
    float _1025 = fma(_899, _911, _991);
    float _1027 = fma(_923, _911, _989);
    float _1029 = _1021 + _919;
    uint _1031 = uint(int(uint(_1019) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1031)] = as_type<uint>(_1011);
    int _1033 = _1019 + 4;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1035)] = as_type<uint>(_1013);
    int _1037 = _1019 + 8;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1039)] = as_type<uint>(_1015);
    int _1041 = _1019 + 12;
    uint _1043 = uint(int(uint(_1041) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1043)] = as_type<uint>(_1017);
    float _1045 = fma(_959, _941, _1001);
    float _1047 = fma(_955, _941, _1003);
    float _1049 = fma(_923, _941, _1005);
    int _1051 = _701 + 32;
    float _1053 = fma(_899, _941, _1007);
    float _1055 = _1045 + _949;
    int _1057 = _701 + 48;
    uint _1059 = uint(int(uint(_1051) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1059)] = as_type<uint>(_1025);
    int _1061 = _1051 + 4;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1063)] = as_type<uint>(_1027);
    int _1065 = _1051 + 8;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1067)] = as_type<uint>(_1023);
    int _1069 = _1051 + 12;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1071)] = as_type<uint>(_1029);
    uint _1073 = uint(int(uint(_1057) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1073)] = as_type<uint>(_1053);
    int _1075 = _1057 + 4;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1077)] = as_type<uint>(_1049);
    int _1079 = _1057 + 8;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1081)] = as_type<uint>(_1047);
    int _1083 = _1057 + 12;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1085)] = as_type<uint>(_1055);
}

