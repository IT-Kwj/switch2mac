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
int _54(thread const int& _3021, thread const int& _3022, constant _10& support_buffer)
{
    int _3025 = 1 + _3022;
    float _3027 = support_buffer._m5[_3025].x;
    bool _3029 = _3027 == 1.0;
    if (_3029)
    {
        return _3021;
    }
    float _3031 = float(_3021);
    float _3033 = _3031 * _3027;
    int _3035 = int(_3033);
    return _3035;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3057, thread const int& _3058, thread const int& _3059, thread int& _3060, thread uint& gl_SubgroupInvocationID)
{
    int _3063 = _3059 & 31;
    uint _3065 = uint(int(uint(_3059) >> uint(8)));
    int _3067 = int(_3065) & 31;
    float _3069 = as_type<float>(gl_SubgroupInvocationID);
    int _3071 = as_type<int>(_3069) & _3067;
    int _3073 = ~_3067;
    int _3075 = _3063 & _3073;
    int _3077 = _3075 | _3071;
    int _3079 = ~_3067;
    int _3081 = _3058 & _3079;
    int _3083 = _3081 | _3071;
    bool _3085 = uint(_3083) <= uint(_3077);
    _3060 = _3085 ? (-1) : 0;
    float _3087 = spvSubgroupShuffle(as_type<float>(_3057), uint(_3083));
    uint _3089 = uint(_3085 ? as_type<int>(_3087) : _3057);
    return int(_3089);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _775 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = _66 & 31;
    bool _74 = _72 == 0;
    bool _76 = uint(_72) < 32u;
    int _78 = 32 - _72;
    int _80 = _72 - 32;
    int _82 = 1 << _72;
    uint _85 = uint(int(uint(0) >> uint(_78)));
    int _87 = _82 | int(_85);
    int _89 = _74 ? 1 : _87;
    bool _91 = uint(_80) < 32u;
    int _93 = 0 << _80;
    int _95 = _91 ? _93 : 0;
    float _97 = _76 ? as_type<float>(_89) : as_type<float>(_95);
    int _99 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _101 = _99 + 32;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = as_type<int>(_97) & as_type<int>(_109);
    bool _113 = _111 != 0;
    int _115 = 0;
    float _117 = _97;
    float _119 = _109;
    if (_113)
    {
        uint _121 = uint(int(uint(_99) >> uint(2)));
        uint _123 = uint(int(uint(int(_121)) >> uint(2)));
        int _125 = int(_121) & 3;
        float _127 = (*spvDescriptorSet0.cp_c5)._m0[int(_123)][_125];
        _115 = as_type<int>(_127);
    }
    int _129 = _115;
    if (!_113)
    {
        _117 = 0.0;
    }
    float _131 = _117;
    float _133 = 0.0;
    float _135 = 0.0;
    if (!_113)
    {
        _133 = 0.0;
        _135 = 0.0;
    }
    float _137 = _133;
    float _139 = _135;
    float _141 = 0.0;
    if (_113)
    {
        _141 = 1.4012984643248170709237295832899e-45;
    }
    float _143 = _141;
    float _145 = 0.0;
    float _147 = 0.0;
    if (!_113)
    {
        _145 = 0.0;
        _147 = 0.0;
    }
    float _149 = _145;
    float _151 = _147;
    float _153 = 0.0;
    float _155 = _149;
    float _157 = _151;
    if (!_113)
    {
        _153 = 0.0;
    }
    float _159 = _153;
    float _161 = 0.0;
    float _163 = 0.0;
    float _165 = _159;
    if (!_113)
    {
        _161 = 0.0;
        _163 = 0.0;
    }
    float _167 = _161;
    float _169 = _163;
    if (!_113)
    {
        _119 = 0.0;
    }
    float _171 = _119;
    float _173 = 0.0;
    if (_113)
    {
        _173 = 2.8025969286496341418474591665798e-45;
    }
    float _175 = _173;
    float _177 = _137;
    float _179 = _139;
    float _181 = _131;
    if (_113)
    {
        int _183 = _66;
        int _185 = 0;
        int _187 = _54(_183, _185, (*spvDescriptorSet0.support_buffer));
        int _189 = _129;
        int _191 = 0;
        int _193 = _54(_189, _191, (*spvDescriptorSet0.support_buffer));
        int3 _1413 = int3(_187, _193, as_type<int>(_143));
        float3 _197 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1413.xy), uint(_1413.z), 0).xyz;
        float _199 = _197.x;
        float _201 = _197.y;
        float _203 = _197.z;
        _177 = _199;
        _179 = _201;
        _181 = _203;
    }
    float _205 = _177;
    float _207 = _179;
    float _209 = _181;
    if (_113)
    {
        int _211 = _66;
        int _213 = 0;
        int _215 = _54(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = _129;
        int _219 = 0;
        int _221 = _54(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1439 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1439.xy), uint(_1439.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        _155 = _225;
        _157 = _227;
        _165 = _229;
    }
    float _231 = _155;
    float _233 = _157;
    float _235 = _165;
    float _237 = _167;
    float _239 = _169;
    float _241 = _171;
    int _243 = as_type<int>(_235);
    if (_113)
    {
        int _245 = _66;
        int _247 = 0;
        int _249 = _54(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = _129;
        int _253 = 0;
        int _255 = _54(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _1472 = int3(_249, _255, as_type<int>(_175));
        float3 _257 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1472.xy), uint(_1472.z), 0).xyz;
        float _259 = _257.x;
        float _261 = _257.y;
        float _263 = _257.z;
        _237 = _259;
        _239 = _261;
        _241 = _263;
    }
    float _265 = _237;
    float _267 = _239;
    float _269 = _241;
    float _271 = _205 * 0.15915493667125701904296875;
    float _273 = _209 * 0.15915493667125701904296875;
    float _275 = _207 * 0.15915493667125701904296875;
    float _277 = _271 * 6.283185482025146484375;
    float _279 = sin(_277);
    float _281 = _271 * 6.283185482025146484375;
    float _283 = cos(_281);
    float _285 = _273 * 6.283185482025146484375;
    float _287 = sin(_285);
    float _289 = _273 * 6.283185482025146484375;
    float _291 = cos(_289);
    float _293 = _275 * 6.283185482025146484375;
    float _295 = cos(_293);
    float _297 = _275 * 6.283185482025146484375;
    float _299 = sin(_297);
    bool _301 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _303 = _283 * _291;
    float _305 = _287 * _283;
    float _307 = _279 * _287;
    float _309 = _279 * _291;
    float _311 = _283 * _295;
    float _313 = _279 * _295;
    int _315 = 0;
    int _317 = as_type<int>(_305);
    if (!_301)
    {
        _315 = as_type<int>(_265);
    }
    int _319 = _315;
    float _321 = _279 * _299;
    float _323 = _295 * _231;
    float _325 = _299 * _231;
    float _327 = fma(_299, _303, _307);
    float _329 = -_309;
    float _331 = fma(_299, _305, _329);
    float _333 = -_305;
    float _335 = fma(_291, _321, _333);
    float _337 = fma(_287, _321, _303);
    int _339 = as_type<int>(_335);
    uint _341 = as_type<uint>(_331);
    if (!_301)
    {
        int _343 = _66 * 48;
        _317 = _343;
    }
    int _345 = _317;
    float _347 = _291 * _323;
    float _349 = _287 * _323;
    float _351 = _313 * _233;
    float _353 = _335 * _233;
    float _355 = _337 * _233;
    float _357 = _311 * _235;
    float _359 = _327 * _235;
    float _361 = _331 * _235;
    float _363 = _359;
    if (!_301)
    {
        int _365 = _345 + 16;
        _243 = _365;
    }
    int _367 = _243;
    if (!_301)
    {
        float _369 = -_325;
        float _371 = (-0.0) + _369;
        _339 = as_type<int>(_371);
    }
    int _373 = _339;
    if (!_301)
    {
        uint _375 = uint(int(uint(_345) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_375)] = as_type<uint>(_347);
        int _377 = _345 + 4;
        uint _379 = uint(int(uint(_377) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_379)] = as_type<uint>(_353);
        int _381 = _345 + 8;
        uint _383 = uint(int(uint(_381) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_383)] = as_type<uint>(_359);
        int _385 = _345 + 12;
        uint _387 = uint(int(uint(_385) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_387)] = uint(_319);
    }
    if (!_301)
    {
        int _389 = _345 + 32;
        _341 = uint(_389);
    }
    uint _391 = _341;
    int _393 = _66 * 112;
    if (!_301)
    {
        uint _395 = uint(int(uint(_367) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_395)] = as_type<uint>(_349);
        int _397 = _367 + 4;
        uint _399 = uint(int(uint(_397) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_399)] = as_type<uint>(_355);
        int _401 = _367 + 8;
        uint _403 = uint(int(uint(_401) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_403)] = as_type<uint>(_361);
        int _405 = _367 + 12;
        uint _407 = uint(int(uint(_405) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_407)] = as_type<uint>(_267);
    }
    if (!_301)
    {
        uint _409 = uint(int(uint(int(_391)) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_409)] = uint(_373);
        int _411 = int(_391) + 4;
        uint _413 = uint(int(uint(_411) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_413)] = as_type<uint>(_351);
        int _415 = int(_391) + 8;
        uint _417 = uint(int(uint(_415) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_417)] = as_type<uint>(_357);
        int _419 = int(_391) + 12;
        uint _421 = uint(int(uint(_419) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_421)] = as_type<uint>(_269);
    }
    bool _423 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    bool _425 = !_423;
    float _753;
    float _755;
    float _757;
    float _759;
    float _761;
    float _763;
    float _765;
    float _767;
    float _769;
    float _771;
    float _773;
    if (!_425)
    {
        float _427 = -_325;
        float _429 = (-0.0) + _427;
        int _431 = 0;
        float _433 = _347;
        float _435 = _353;
        float _437 = _359;
        float _439 = _265;
        float _441 = _349;
        float _443 = _355;
        float _445 = _361;
        float _447 = _267;
        float _449 = _429;
        float _451 = _351;
        float _453 = _357;
        float _455 = _269;
        bool _457;
        int _505;
        int _515;
        int _525;
        int _535;
        int _545;
        int _555;
        int _565;
        int _575;
        int _585;
        int _595;
        int _605;
        int _615;
        int _729;
        int _733;
        int _735;
        int _739;
        int _741;
        int _743;
        int _747;
        int _749;
        int _751;
        do
        {
            int _459 = _431;
            int _461 = as_type<int>(_433);
            int _463 = as_type<int>(_435);
            int _465 = as_type<int>(_437);
            int _467 = as_type<int>(_439);
            int _469 = as_type<int>(_441);
            int _471 = as_type<int>(_443);
            int _473 = as_type<int>(_445);
            int _475 = as_type<int>(_447);
            int _477 = as_type<int>(_449);
            int _479 = as_type<int>(_451);
            int _481 = as_type<int>(_453);
            int _483 = as_type<int>(_455);
            uint _485 = uint(int(uint(_393) >> uint(2)));
            uint _487 = uint(int(uint(int(_485)) >> uint(2)));
            int _489 = int(_485) & 3;
            float _491 = (*spvDescriptorSet0.cp_c6)._m0[int(_487)][_489];
            bool _493 = _66 != 0;
            int _495 = _459 + 1;
            bool _497 = uint(_495) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _499 = _461;
            int _501 = as_type<int>(_491);
            int _503 = 31;
            int _1869 = _56(_499, _501, _503, _505, gl_SubgroupInvocationID);
            int _507 = _1869;
            int _509 = _463;
            int _511 = as_type<int>(_491);
            int _513 = 31;
            int _1873 = _56(_509, _511, _513, _515, gl_SubgroupInvocationID);
            int _517 = _1873;
            int _519 = _465;
            int _521 = as_type<int>(_491);
            int _523 = 31;
            int _1877 = _56(_519, _521, _523, _525, gl_SubgroupInvocationID);
            int _527 = _1877;
            int _529 = _467;
            int _531 = as_type<int>(_491);
            int _533 = 31;
            int _1881 = _56(_529, _531, _533, _535, gl_SubgroupInvocationID);
            int _537 = _1881;
            int _539 = _469;
            int _541 = as_type<int>(_491);
            int _543 = 31;
            int _1885 = _56(_539, _541, _543, _545, gl_SubgroupInvocationID);
            int _547 = _1885;
            int _549 = _471;
            int _551 = as_type<int>(_491);
            int _553 = 31;
            int _1889 = _56(_549, _551, _553, _555, gl_SubgroupInvocationID);
            int _557 = _1889;
            int _559 = _473;
            int _561 = as_type<int>(_491);
            int _563 = 31;
            int _1893 = _56(_559, _561, _563, _565, gl_SubgroupInvocationID);
            int _567 = _1893;
            int _569 = _475;
            int _571 = as_type<int>(_491);
            int _573 = 31;
            int _1897 = _56(_569, _571, _573, _575, gl_SubgroupInvocationID);
            int _577 = _1897;
            int _579 = _477;
            int _581 = as_type<int>(_491);
            int _583 = 31;
            int _1901 = _56(_579, _581, _583, _585, gl_SubgroupInvocationID);
            int _587 = _1901;
            int _589 = _479;
            int _591 = as_type<int>(_491);
            int _593 = 31;
            int _1905 = _56(_589, _591, _593, _595, gl_SubgroupInvocationID);
            int _597 = _1905;
            int _599 = _481;
            int _601 = as_type<int>(_491);
            int _603 = 31;
            int _1909 = _56(_599, _601, _603, _605, gl_SubgroupInvocationID);
            int _607 = _1909;
            int _609 = _483;
            int _611 = as_type<int>(_491);
            int _613 = 31;
            int _1913 = _56(_609, _611, _613, _615, gl_SubgroupInvocationID);
            int _617 = _1913;
            bool _619 = !_493;
            _431 = _495;
            int _621 = _461;
            int _623 = _463;
            int _625 = _465;
            int _627 = _467;
            int _629 = _469;
            int _631 = _471;
            int _633 = _473;
            int _635 = _475;
            int _637 = _477;
            int _639 = _479;
            int _641 = _481;
            int _643 = _483;
            if (!_619)
            {
                float _645 = as_type<float>(_517) * _267;
                float _647 = _355 * as_type<float>(_557);
                float _649 = _355 * as_type<float>(_517);
                float _651 = _361 * as_type<float>(_517);
                float _653 = fma(as_type<float>(_507), _265, _645);
                float _655 = _349 * as_type<float>(_517);
                float _657 = _349 * as_type<float>(_557);
                float _659 = _361 * as_type<float>(_557);
                float _661 = as_type<float>(_557) * _267;
                float _663 = fma(_353, as_type<float>(_547), _647);
                float _665 = as_type<float>(_597) * _267;
                float _667 = _355 * as_type<float>(_597);
                float _669 = fma(_353, as_type<float>(_507), _649);
                float _671 = fma(_359, as_type<float>(_507), _651);
                float _673 = fma(_347, as_type<float>(_507), _655);
                float _675 = fma(_347, as_type<float>(_547), _657);
                float _677 = fma(_359, as_type<float>(_547), _659);
                float _679 = fma(as_type<float>(_547), _265, _661);
                float _681 = _349 * as_type<float>(_597);
                float _683 = _361 * as_type<float>(_597);
                float _685 = fma(as_type<float>(_587), _265, _665);
                float _687 = fma(_353, as_type<float>(_587), _667);
                float _689 = fma(_351, as_type<float>(_527), _669);
                float _691 = fma(_357, as_type<float>(_527), _671);
                float _693 = fma(as_type<float>(_527), _269, _653);
                float _695 = -_325;
                float _697 = fma(_695, as_type<float>(_567), _675);
                float _699 = fma(_351, as_type<float>(_567), _663);
                float _701 = fma(_357, as_type<float>(_567), _677);
                float _703 = fma(_347, as_type<float>(_587), _681);
                float _705 = fma(_359, as_type<float>(_587), _683);
                float _707 = fma(as_type<float>(_567), _269, _679);
                float _709 = fma(as_type<float>(_607), _269, _685);
                float _711 = -_325;
                float _713 = fma(_711, as_type<float>(_527), _673);
                float _715 = as_type<float>(_537) + _693;
                float _717 = -_325;
                float _719 = fma(_717, as_type<float>(_607), _703);
                float _721 = fma(_351, as_type<float>(_607), _687);
                float _723 = fma(_357, as_type<float>(_607), _705);
                float _725 = as_type<float>(_577) + _707;
                float _727 = as_type<float>(_617) + _709;
                _621 = as_type<int>(_713);
                _623 = as_type<int>(_689);
                _625 = as_type<int>(_691);
                _627 = as_type<int>(_715);
                _629 = as_type<int>(_697);
                _631 = as_type<int>(_699);
                _633 = as_type<int>(_701);
                _635 = as_type<int>(_725);
                _637 = as_type<int>(_719);
                _639 = as_type<int>(_721);
                _641 = as_type<int>(_723);
                _643 = as_type<int>(_727);
            }
            _729 = _621;
            int _731 = _623;
            _733 = _625;
            _735 = _627;
            int _737 = _629;
            _739 = _631;
            _741 = _633;
            _743 = _635;
            int _745 = _637;
            _747 = _639;
            _749 = _641;
            _751 = _643;
            _457 = !_497;
            _433 = as_type<float>(_729);
            _435 = as_type<float>(_731);
            _437 = as_type<float>(_733);
            _439 = as_type<float>(_735);
            _441 = as_type<float>(_737);
            _443 = as_type<float>(_739);
            _445 = as_type<float>(_741);
            _447 = as_type<float>(_743);
            _449 = as_type<float>(_745);
            _451 = as_type<float>(_747);
            _453 = as_type<float>(_749);
            _455 = as_type<float>(_751);
            _753 = as_type<float>(_731);
            _755 = as_type<float>(_737);
            _757 = as_type<float>(_745);
        } while (_457);
        _759 = as_type<float>(_739);
        _761 = as_type<float>(_747);
        _763 = as_type<float>(_729);
        _765 = as_type<float>(_749);
        _363 = as_type<float>(_733);
        _767 = as_type<float>(_741);
        _769 = as_type<float>(_743);
        _771 = as_type<float>(_735);
        _773 = as_type<float>(_751);
        _775 = true;
    }
    else
    {
        float _777 = -_325;
        float _779 = (-0.0) + _777;
        _753 = _353;
        _759 = _355;
        _761 = _351;
        _763 = _347;
        _755 = _349;
        _757 = _779;
        _765 = _357;
        _767 = _361;
        _769 = _267;
        _771 = _265;
        _773 = _269;
    }
    _775 = false;
    float _781 = _753;
    float _783 = _759;
    float _785 = _761;
    float _787 = _763;
    float _789 = _755;
    float _791 = _757;
    float _793 = _765;
    float _795 = _363;
    float _797 = _767;
    float _799 = _769;
    float _801 = _771;
    float _803 = _773;
    int _805 = _393 + 80;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    uint _809 = uint(int(uint(int(_807)) >> uint(2)));
    int _811 = int(_807) & 3;
    float _813 = (*spvDescriptorSet0.cp_c6)._m0[int(_809)][_811];
    int _815 = int(_807) + 1;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    int _819 = _815 & 3;
    float _821 = (*spvDescriptorSet0.cp_c6)._m0[int(_817)][_819];
    int _823 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _825 = _823 + _66;
    int _827 = _393 + 64;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    uint _831 = uint(int(uint(int(_829)) >> uint(2)));
    int _833 = int(_829) & 3;
    float _835 = (*spvDescriptorSet0.cp_c6)._m0[int(_831)][_833];
    int _837 = int(_829) + 1;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    int _841 = _837 & 3;
    float _843 = (*spvDescriptorSet0.cp_c6)._m0[int(_839)][_841];
    int _845 = _393 + 88;
    uint _847 = uint(int(uint(_845) >> uint(2)));
    uint _849 = uint(int(uint(int(_847)) >> uint(2)));
    int _851 = int(_847) & 3;
    float _853 = (*spvDescriptorSet0.cp_c6)._m0[int(_849)][_851];
    int _855 = int(_847) + 1;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    int _859 = _855 & 3;
    float _861 = (*spvDescriptorSet0.cp_c6)._m0[int(_857)][_859];
    int _863 = _393 + 72;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    uint _867 = uint(int(uint(int(_865)) >> uint(2)));
    int _869 = int(_865) & 3;
    float _871 = (*spvDescriptorSet0.cp_c6)._m0[int(_867)][_869];
    int _873 = int(_865) + 1;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    int _877 = _873 & 3;
    float _879 = (*spvDescriptorSet0.cp_c6)._m0[int(_875)][_877];
    int _881 = _393 + 96;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.cp_c6)._m0[int(_893)][_895];
    int _899 = _393 + 104;
    uint _901 = uint(int(uint(_899) >> uint(2)));
    uint _903 = uint(int(uint(int(_901)) >> uint(2)));
    int _905 = int(_901) & 3;
    float _907 = (*spvDescriptorSet0.cp_c6)._m0[int(_903)][_905];
    int _909 = int(_901) + 1;
    uint _911 = uint(int(uint(_909) >> uint(2)));
    int _913 = _909 & 3;
    float _915 = (*spvDescriptorSet0.cp_c6)._m0[int(_911)][_913];
    float _917 = _781 * _813;
    float _919 = _783 * _813;
    float _921 = _785 * _813;
    int _923 = _393 + 16;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    uint _927 = uint(int(uint(int(_925)) >> uint(2)));
    int _929 = int(_925) & 3;
    float _931 = (*spvDescriptorSet0.cp_c6)._m0[int(_927)][_929];
    int _933 = int(_925) + 1;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    int _937 = _933 & 3;
    float _939 = (*spvDescriptorSet0.cp_c6)._m0[int(_935)][_937];
    float _941 = _785 * _821;
    float _943 = _783 * _821;
    float _945 = fma(_787, _835, _917);
    float _947 = fma(_789, _835, _919);
    float _949 = fma(_791, _835, _921);
    float _951 = _781 * _821;
    int _953 = _393 + 32;
    uint _955 = uint(int(uint(_953) >> uint(2)));
    uint _957 = uint(int(uint(int(_955)) >> uint(2)));
    int _959 = int(_955) & 3;
    float _961 = (*spvDescriptorSet0.cp_c6)._m0[int(_957)][_959];
    int _963 = int(_955) + 1;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    int _967 = _963 & 3;
    float _969 = (*spvDescriptorSet0.cp_c6)._m0[int(_965)][_967];
    float _971 = fma(_791, _843, _941);
    float _973 = fma(_789, _843, _943);
    float _975 = fma(_787, _843, _951);
    float _977 = _781 * _853;
    float _979 = _781 * _861;
    float _981 = _783 * _853;
    float _983 = _783 * _861;
    int _985 = _393 + 48;
    uint _987 = uint(int(uint(_985) >> uint(2)));
    uint _989 = uint(int(uint(int(_987)) >> uint(2)));
    int _991 = int(_987) & 3;
    float _993 = (*spvDescriptorSet0.cp_c6)._m0[int(_989)][_991];
    int _995 = int(_987) + 1;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    int _999 = _995 & 3;
    float _1001 = (*spvDescriptorSet0.cp_c6)._m0[int(_997)][_999];
    float _1003 = _785 * _853;
    float _1005 = _785 * _861;
    float _1007 = fma(_787, _871, _977);
    float _1009 = fma(_787, _879, _979);
    float _1011 = fma(_789, _871, _981);
    float _1013 = fma(_789, _879, _983);
    int _1015 = _393 + 24;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    uint _1019 = uint(int(uint(int(_1017)) >> uint(2)));
    int _1021 = int(_1017) & 3;
    float _1023 = (*spvDescriptorSet0.cp_c6)._m0[int(_1019)][_1021];
    int _1025 = int(_1017) + 1;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    int _1029 = _1025 & 3;
    float _1031 = (*spvDescriptorSet0.cp_c6)._m0[int(_1027)][_1029];
    float _1033 = fma(_791, _871, _1003);
    float _1035 = fma(_791, _879, _1005);
    float _1037 = fma(_793, _889, _949);
    float _1039 = fma(_795, _889, _945);
    float _1041 = fma(_797, _889, _947);
    float _1043 = fma(_797, _897, _973);
    int _1045 = _393 + 56;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    uint _1049 = uint(int(uint(int(_1047)) >> uint(2)));
    int _1051 = int(_1047) & 3;
    float _1053 = (*spvDescriptorSet0.cp_c6)._m0[int(_1049)][_1051];
    int _1055 = int(_1047) + 1;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    int _1059 = _1055 & 3;
    float _1061 = (*spvDescriptorSet0.cp_c6)._m0[int(_1057)][_1059];
    float _1063 = fma(_795, _897, _975);
    float _1065 = fma(_793, _897, _971);
    float _1067 = fma(_797, _915, _1013);
    float _1069 = fma(_795, _915, _1009);
    float _1071 = fma(_793, _915, _1035);
    float _1073 = fma(_797, _907, _1011);
    int _1075 = _393 + 40;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    uint _1079 = uint(int(uint(int(_1077)) >> uint(2)));
    int _1081 = int(_1077) & 3;
    float _1083 = (*spvDescriptorSet0.cp_c6)._m0[int(_1079)][_1081];
    int _1085 = int(_1077) + 1;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    int _1089 = _1085 & 3;
    float _1091 = (*spvDescriptorSet0.cp_c6)._m0[int(_1087)][_1089];
    float _1093 = _1067 + _799;
    float _1095 = fma(_795, _907, _1007);
    float _1097 = fma(_793, _907, _1033);
    float _1099 = _1069 + _801;
    float _1101 = _1071 + _803;
    float _1103 = _1041 * _939;
    float _1105 = _1043 * _939;
    float _1107 = _1073 * _939;
    float _1109 = _1093 * _939;
    float _1111 = fma(_1039, _931, _1103);
    float _1113 = fma(_1063, _931, _1105);
    float _1115 = fma(_1095, _931, _1107);
    float _1117 = fma(_1099, _931, _1109);
    float _1119 = _1093 * _969;
    float _1121 = _1041 * _969;
    float _1123 = _1043 * _969;
    float _1125 = _1073 * _969;
    float _1127 = fma(_1099, _961, _1119);
    float _1129 = fma(_1039, _961, _1121);
    float _1131 = fma(_1063, _961, _1123);
    float _1133 = fma(_1095, _961, _1125);
    float _1135 = _1093 * _1001;
    float _1137 = _1041 * _1001;
    float _1139 = _1043 * _1001;
    float _1141 = _1073 * _1001;
    float _1143 = fma(_1099, _993, _1135);
    float _1145 = fma(_1039, _993, _1137);
    float _1147 = fma(_1063, _993, _1139);
    float _1149 = fma(_1095, _993, _1141);
    float _1151 = fma(_1037, _1023, _1111);
    float _1153 = fma(_1097, _1023, _1115);
    int _1155 = _825 * 48;
    float _1157 = fma(_1101, _1023, _1117);
    float _1159 = fma(_1065, _1023, _1113);
    float _1161 = _1157 + _1031;
    float _1163 = fma(_1101, _1053, _1143);
    float _1165 = fma(_1065, _1053, _1147);
    float _1167 = fma(_1097, _1053, _1149);
    float _1169 = fma(_1101, _1083, _1127);
    float _1171 = fma(_1037, _1083, _1129);
    float _1173 = fma(_1065, _1083, _1131);
    float _1175 = fma(_1037, _1053, _1145);
    float _1177 = _1163 + _1061;
    int _1179 = _1155 + 16;
    float _1181 = fma(_1097, _1083, _1133);
    float _1183 = _1169 + _1091;
    int _1185 = _1155 + 32;
    int _1187 = _1155 + 48;
    uint _1189 = uint(int(uint(_1179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1189)] = as_type<uint>(_1151);
    int _1191 = _1179 + 4;
    uint _1193 = uint(int(uint(_1191) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1193)] = as_type<uint>(_1159);
    int _1195 = _1179 + 8;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1197)] = as_type<uint>(_1153);
    int _1199 = _1179 + 12;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1201)] = as_type<uint>(_1161);
    uint _1203 = uint(int(uint(_1185) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1203)] = as_type<uint>(_1171);
    int _1205 = _1185 + 4;
    uint _1207 = uint(int(uint(_1205) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1207)] = as_type<uint>(_1173);
    int _1209 = _1185 + 8;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1211)] = as_type<uint>(_1181);
    int _1213 = _1185 + 12;
    uint _1215 = uint(int(uint(_1213) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1215)] = as_type<uint>(_1183);
    uint _1217 = uint(int(uint(_1187) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1217)] = as_type<uint>(_1175);
    int _1219 = _1187 + 4;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1221)] = as_type<uint>(_1165);
    int _1223 = _1187 + 8;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1225)] = as_type<uint>(_1167);
    int _1227 = _1187 + 12;
    uint _1229 = uint(int(uint(_1227) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1229)] = as_type<uint>(_1177);
}

