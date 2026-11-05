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
int _54(thread const int& _3208, thread const int& _3209, constant _10& support_buffer)
{
    int _3212 = 1 + _3209;
    float _3214 = support_buffer._m5[_3212].x;
    bool _3216 = _3214 == 1.0;
    if (_3216)
    {
        return _3208;
    }
    float _3218 = float(_3208);
    float _3220 = _3218 * _3214;
    int _3222 = int(_3220);
    return _3222;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3244, thread const int& _3245, thread const int& _3246, thread int& _3247, thread uint& gl_SubgroupInvocationID)
{
    int _3250 = _3246 & 31;
    uint _3252 = uint(int(uint(_3246) >> uint(8)));
    int _3254 = int(_3252) & 31;
    float _3256 = as_type<float>(gl_SubgroupInvocationID);
    int _3258 = as_type<int>(_3256) & _3254;
    int _3260 = ~_3254;
    int _3262 = _3250 & _3260;
    int _3264 = _3262 | _3258;
    int _3266 = ~_3254;
    int _3268 = _3245 & _3266;
    int _3270 = _3268 | _3258;
    bool _3272 = uint(_3270) <= uint(_3264);
    _3247 = _3272 ? (-1) : 0;
    float _3274 = spvSubgroupShuffle(as_type<float>(_3244), uint(_3270));
    uint _3276 = uint(_3272 ? as_type<int>(_3274) : _3244);
    return int(_3276);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _877 = false;
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
    float _115 = 0.0;
    float _117 = _97;
    if (!_113)
    {
        _115 = 0.0;
    }
    float _119 = _115;
    float _121 = 0.0;
    float _123 = 0.0;
    float _125 = _119;
    if (!_113)
    {
        _121 = 0.0;
        _123 = 0.0;
    }
    float _127 = _121;
    float _129 = _123;
    float _131 = 0.0;
    float _133 = _127;
    float _135 = _129;
    if (!_113)
    {
        _131 = 0.0;
    }
    float _137 = _131;
    float _139 = 0.0;
    float _141 = 0.0;
    float _143 = _137;
    if (!_113)
    {
        _139 = 0.0;
        _141 = 0.0;
    }
    float _145 = _139;
    float _147 = _141;
    float _149 = 0.0;
    float _151 = _145;
    float _153 = _147;
    if (!_113)
    {
        _117 = 0.0;
        _149 = 0.0;
    }
    float _155 = _117;
    float _157 = _149;
    float _159 = 0.0;
    float _161 = _155;
    float _163 = _157;
    if (!_113)
    {
        _159 = 0.0;
    }
    float _165 = _159;
    bool _167 = !_113;
    float _169 = _165;
    if (!_167)
    {
        uint _171 = uint(int(uint(_99) >> uint(2)));
        uint _173 = uint(int(uint(int(_171)) >> uint(2)));
        int _175 = int(_171) & 3;
        float _177 = (*spvDescriptorSet0.cp_c5)._m0[int(_173)][_175];
        int _179 = int(_171) + 1;
        uint _181 = uint(int(uint(_179) >> uint(2)));
        int _183 = _179 & 3;
        float _185 = (*spvDescriptorSet0.cp_c5)._m0[int(_181)][_183];
        int _187 = _66;
        int _189 = 0;
        int _191 = _54(_187, _189, (*spvDescriptorSet0.support_buffer));
        int _193 = as_type<int>(_177);
        int _195 = 0;
        int _197 = _54(_193, _195, (*spvDescriptorSet0.support_buffer));
        int3 _1516 = int3(_191, _197, 1);
        float3 _201 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1516.xy), uint(_1516.z), 0).xyz;
        float _203 = _201.x;
        float _205 = _201.y;
        float _207 = _201.z;
        int _209 = _66;
        int _211 = 0;
        int _213 = _54(_209, _211, (*spvDescriptorSet0.support_buffer));
        int _215 = as_type<int>(_185);
        int _217 = 0;
        int _219 = _54(_215, _217, (*spvDescriptorSet0.support_buffer));
        int3 _1534 = int3(_213, _219, 1);
        float3 _221 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1534.xy), uint(_1534.z), 0).xyz;
        float _223 = _221.x;
        float _225 = _221.y;
        float _227 = _221.z;
        int _229 = _66;
        int _231 = 0;
        int _233 = _54(_229, _231, (*spvDescriptorSet0.support_buffer));
        int _235 = as_type<int>(_177);
        int _237 = 0;
        int _239 = _54(_235, _237, (*spvDescriptorSet0.support_buffer));
        int3 _1552 = int3(_233, _239, 0);
        float3 _241 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1552.xy), uint(_1552.z), 0).xyz;
        float _243 = _241.x;
        float _245 = _241.y;
        float _247 = _241.z;
        int _249 = _66;
        int _251 = 0;
        int _253 = _54(_249, _251, (*spvDescriptorSet0.support_buffer));
        int _255 = as_type<int>(_185);
        int _257 = 0;
        int _259 = _54(_255, _257, (*spvDescriptorSet0.support_buffer));
        int3 _1570 = int3(_253, _259, 0);
        float3 _261 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1570.xy), uint(_1570.z), 0).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        int _269 = _66;
        int _271 = 0;
        int _273 = _54(_269, _271, (*spvDescriptorSet0.support_buffer));
        int _275 = as_type<int>(_177);
        int _277 = 0;
        int _279 = _54(_275, _277, (*spvDescriptorSet0.support_buffer));
        int3 _1588 = int3(_273, _279, 2);
        float3 _281 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1588.xy), uint(_1588.z), 0).xyz;
        float _283 = _281.x;
        float _285 = _281.y;
        float _287 = _281.z;
        int _289 = _66;
        int _291 = 0;
        int _293 = _54(_289, _291, (*spvDescriptorSet0.support_buffer));
        int _295 = as_type<int>(_185);
        int _297 = 0;
        int _299 = _54(_295, _297, (*spvDescriptorSet0.support_buffer));
        int3 _1606 = int3(_293, _299, 2);
        float3 _301 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1606.xy), uint(_1606.z), 0).xyz;
        float _303 = _301.x;
        float _305 = _301.y;
        float _307 = _301.z;
        int _309 = _99 + 16;
        uint _311 = uint(int(uint(_309) >> uint(2)));
        uint _313 = uint(int(uint(int(_311)) >> uint(2)));
        int _315 = int(_311) & 3;
        float _317 = (*spvDescriptorSet0.cp_c5)._m0[int(_313)][_315];
        float _319 = -_203;
        float _321 = _319 + _223;
        float _323 = -_207;
        float _325 = _323 + _227;
        float _327 = fma(_321, _317, _203);
        float _329 = -_205;
        float _331 = _329 + _225;
        float _333 = -_243;
        float _335 = _333 + _263;
        float _337 = -_245;
        float _339 = _337 + _265;
        float _341 = -_247;
        float _343 = _341 + _267;
        float _345 = fma(_331, _317, _205);
        float _347 = fma(_325, _317, _207);
        float _349 = fma(_335, _317, _243);
        float _351 = fma(_339, _317, _245);
        float _353 = -_283;
        float _355 = _353 + _303;
        float _357 = -_285;
        float _359 = _357 + _305;
        float _361 = -_287;
        float _363 = _361 + _307;
        float _365 = fma(_343, _317, _247);
        float _367 = fma(_355, _317, _283);
        float _369 = fma(_359, _317, _285);
        float _371 = fma(_363, _317, _287);
        _151 = _327;
        _161 = _347;
        _163 = _345;
        _125 = _349;
        _143 = _351;
        _133 = _365;
        _169 = _367;
        _135 = _369;
        _153 = _371;
    }
    float _373 = _151;
    float _375 = _161;
    float _377 = _163;
    float _379 = _125;
    float _381 = _143;
    float _383 = _133;
    float _385 = _169;
    float _387 = _135;
    float _389 = _153;
    float _391 = _373 * 0.15915493667125701904296875;
    float _393 = _375 * 0.15915493667125701904296875;
    float _395 = _377 * 0.15915493667125701904296875;
    float _397 = _391 * 6.283185482025146484375;
    float _399 = cos(_397);
    bool _401 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    bool _403 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _405 = _393 * 6.283185482025146484375;
    float _407 = sin(_405);
    float _409 = _393 * 6.283185482025146484375;
    float _411 = cos(_409);
    float _413 = _395 * 6.283185482025146484375;
    float _415 = cos(_413);
    float _417 = _407 * _399;
    float _419 = _391 * 6.283185482025146484375;
    float _421 = sin(_419);
    float _423 = _399 * _411;
    float _425 = _395 * 6.283185482025146484375;
    float _427 = sin(_425);
    float _429 = _399 * _415;
    float _431 = _415 * _379;
    float _433 = _421 * _407;
    float _435 = _421 * _411;
    float _437 = _421 * _415;
    float _439 = _421 * _427;
    float _441 = fma(_427, _423, _433);
    float _443 = -_435;
    float _445 = fma(_427, _417, _443);
    float _447 = _427 * _379;
    float _449 = -_417;
    float _451 = fma(_411, _439, _449);
    float _453 = fma(_407, _439, _423);
    float _455 = _407 * _431;
    float _457 = _437 * _381;
    float _459 = _451 * _381;
    float _461 = _429 * _383;
    float _463 = _441 * _383;
    float _465 = _411 * _431;
    float _467 = _453 * _381;
    float _469 = _445 * _383;
    float _471 = _463;
    float _473 = _385;
    if (!_403)
    {
        int _475 = _66 * 48;
        float _477 = -_447;
        float _479 = _477 + (-0.0);
        int _481 = _475 + 16;
        uint _483 = uint(int(uint(_475) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_483)] = as_type<uint>(_465);
        int _485 = _475 + 4;
        uint _487 = uint(int(uint(_485) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_487)] = as_type<uint>(_459);
        int _489 = _475 + 8;
        uint _491 = uint(int(uint(_489) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_491)] = as_type<uint>(_463);
        int _493 = _475 + 12;
        uint _495 = uint(int(uint(_493) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_495)] = as_type<uint>(_385);
        int _497 = _475 + 32;
        uint _499 = uint(int(uint(_481) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_499)] = as_type<uint>(_455);
        int _501 = _481 + 4;
        uint _503 = uint(int(uint(_501) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_503)] = as_type<uint>(_467);
        int _505 = _481 + 8;
        uint _507 = uint(int(uint(_505) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_507)] = as_type<uint>(_469);
        int _509 = _481 + 12;
        uint _511 = uint(int(uint(_509) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_511)] = as_type<uint>(_387);
        uint _513 = uint(int(uint(_497) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_513)] = as_type<uint>(_479);
        int _515 = _497 + 4;
        uint _517 = uint(int(uint(_515) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_517)] = as_type<uint>(_457);
        int _519 = _497 + 8;
        uint _521 = uint(int(uint(_519) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_521)] = as_type<uint>(_461);
        int _523 = _497 + 12;
        uint _525 = uint(int(uint(_523) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_525)] = as_type<uint>(_389);
    }
    int _527 = _66 * 112;
    bool _529 = !_401;
    float _857;
    float _859;
    float _861;
    float _863;
    float _865;
    float _867;
    float _869;
    float _871;
    float _873;
    float _875;
    if (!_529)
    {
        float _531 = -_447;
        float _533 = _531 + (-0.0);
        int _535 = 0;
        float _537 = _465;
        float _539 = _459;
        float _541 = _463;
        float _543 = _385;
        float _545 = _455;
        float _547 = _467;
        float _549 = _469;
        float _551 = _387;
        float _553 = _533;
        float _555 = _457;
        float _557 = _461;
        float _559 = _389;
        bool _561;
        int _609;
        int _619;
        int _629;
        int _639;
        int _649;
        int _659;
        int _669;
        int _679;
        int _689;
        int _699;
        int _709;
        int _719;
        int _833;
        float _837;
        int _839;
        float _843;
        int _845;
        int _847;
        int _851;
        int _853;
        int _855;
        do
        {
            int _563 = _535;
            int _565 = as_type<int>(_537);
            int _567 = as_type<int>(_539);
            float _569 = _541;
            int _571 = as_type<int>(_543);
            int _573 = as_type<int>(_545);
            float _575 = _547;
            int _577 = as_type<int>(_549);
            int _579 = as_type<int>(_551);
            int _581 = as_type<int>(_553);
            int _583 = as_type<int>(_555);
            int _585 = as_type<int>(_557);
            int _587 = as_type<int>(_559);
            uint _589 = uint(int(uint(_527) >> uint(2)));
            uint _591 = uint(int(uint(int(_589)) >> uint(2)));
            int _593 = int(_589) & 3;
            float _595 = (*spvDescriptorSet0.cp_c6)._m0[int(_591)][_593];
            bool _597 = _66 != 0;
            int _599 = _563 + 1;
            bool _601 = uint(_599) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _603 = _565;
            int _605 = as_type<int>(_595);
            int _607 = 31;
            int _2061 = _56(_603, _605, _607, _609, gl_SubgroupInvocationID);
            int _611 = _2061;
            int _613 = _567;
            int _615 = as_type<int>(_595);
            int _617 = 31;
            int _2065 = _56(_613, _615, _617, _619, gl_SubgroupInvocationID);
            int _621 = _2065;
            int _623 = as_type<int>(_569);
            int _625 = as_type<int>(_595);
            int _627 = 31;
            int _2070 = _56(_623, _625, _627, _629, gl_SubgroupInvocationID);
            int _631 = _2070;
            int _633 = _571;
            int _635 = as_type<int>(_595);
            int _637 = 31;
            int _2074 = _56(_633, _635, _637, _639, gl_SubgroupInvocationID);
            int _641 = _2074;
            int _643 = _573;
            int _645 = as_type<int>(_595);
            int _647 = 31;
            int _2078 = _56(_643, _645, _647, _649, gl_SubgroupInvocationID);
            int _651 = _2078;
            int _653 = as_type<int>(_575);
            int _655 = as_type<int>(_595);
            int _657 = 31;
            int _2083 = _56(_653, _655, _657, _659, gl_SubgroupInvocationID);
            int _661 = _2083;
            int _663 = _577;
            int _665 = as_type<int>(_595);
            int _667 = 31;
            int _2087 = _56(_663, _665, _667, _669, gl_SubgroupInvocationID);
            int _671 = _2087;
            int _673 = _579;
            int _675 = as_type<int>(_595);
            int _677 = 31;
            int _2091 = _56(_673, _675, _677, _679, gl_SubgroupInvocationID);
            int _681 = _2091;
            int _683 = _581;
            int _685 = as_type<int>(_595);
            int _687 = 31;
            int _2095 = _56(_683, _685, _687, _689, gl_SubgroupInvocationID);
            int _691 = _2095;
            int _693 = _583;
            int _695 = as_type<int>(_595);
            int _697 = 31;
            int _2099 = _56(_693, _695, _697, _699, gl_SubgroupInvocationID);
            int _701 = _2099;
            int _703 = _585;
            int _705 = as_type<int>(_595);
            int _707 = 31;
            int _2103 = _56(_703, _705, _707, _709, gl_SubgroupInvocationID);
            int _711 = _2103;
            int _713 = _587;
            int _715 = as_type<int>(_595);
            int _717 = 31;
            int _2107 = _56(_713, _715, _717, _719, gl_SubgroupInvocationID);
            int _721 = _2107;
            bool _723 = !_597;
            _535 = _599;
            int _725 = _565;
            int _727 = _567;
            float _729 = _569;
            int _731 = _571;
            int _733 = _573;
            float _735 = _575;
            int _737 = _577;
            int _739 = _579;
            int _741 = _581;
            int _743 = _583;
            int _745 = _585;
            int _747 = _587;
            if (!_723)
            {
                float _749 = as_type<float>(_621) * _387;
                float _751 = as_type<float>(_661) * _387;
                float _753 = _455 * as_type<float>(_621);
                float _755 = _467 * as_type<float>(_621);
                float _757 = _469 * as_type<float>(_621);
                float _759 = fma(as_type<float>(_611), _385, _749);
                float _761 = _455 * as_type<float>(_661);
                float _763 = _467 * as_type<float>(_661);
                float _765 = _469 * as_type<float>(_661);
                float _767 = fma(as_type<float>(_651), _385, _751);
                float _769 = _467 * as_type<float>(_701);
                float _771 = as_type<float>(_701) * _387;
                float _773 = fma(_465, as_type<float>(_611), _753);
                float _775 = fma(_459, as_type<float>(_611), _755);
                float _777 = fma(_463, as_type<float>(_611), _757);
                float _779 = fma(_465, as_type<float>(_651), _761);
                float _781 = fma(_459, as_type<float>(_651), _763);
                float _783 = fma(_463, as_type<float>(_651), _765);
                float _785 = fma(_459, as_type<float>(_691), _769);
                float _787 = fma(as_type<float>(_691), _385, _771);
                float _789 = _455 * as_type<float>(_701);
                float _791 = _469 * as_type<float>(_701);
                float _793 = -_447;
                float _795 = fma(_793, as_type<float>(_631), _773);
                float _797 = fma(_457, as_type<float>(_631), _775);
                float _799 = fma(_461, as_type<float>(_631), _777);
                float _801 = fma(as_type<float>(_631), _389, _759);
                float _803 = -_447;
                float _805 = fma(_803, as_type<float>(_671), _779);
                float _807 = fma(_457, as_type<float>(_671), _781);
                float _809 = fma(_461, as_type<float>(_671), _783);
                float _811 = fma(as_type<float>(_671), _389, _767);
                float _813 = fma(_465, as_type<float>(_691), _789);
                float _815 = fma(_463, as_type<float>(_691), _791);
                float _817 = fma(as_type<float>(_711), _389, _787);
                float _819 = fma(_457, as_type<float>(_711), _785);
                float _821 = -_447;
                float _823 = fma(_821, as_type<float>(_711), _813);
                float _825 = fma(_461, as_type<float>(_711), _815);
                float _827 = as_type<float>(_641) + _801;
                float _829 = as_type<float>(_681) + _811;
                float _831 = as_type<float>(_721) + _817;
                _725 = as_type<int>(_795);
                _727 = as_type<int>(_797);
                _729 = _799;
                _731 = as_type<int>(_827);
                _733 = as_type<int>(_805);
                _735 = _807;
                _737 = as_type<int>(_809);
                _739 = as_type<int>(_829);
                _741 = as_type<int>(_823);
                _743 = as_type<int>(_819);
                _745 = as_type<int>(_825);
                _747 = as_type<int>(_831);
            }
            _833 = _725;
            int _835 = _727;
            _837 = _729;
            _839 = _731;
            int _841 = _733;
            _843 = _735;
            _845 = _737;
            _847 = _739;
            int _849 = _741;
            _851 = _743;
            _853 = _745;
            _855 = _747;
            _561 = !_601;
            _537 = as_type<float>(_833);
            _539 = as_type<float>(_835);
            _541 = _837;
            _543 = as_type<float>(_839);
            _545 = as_type<float>(_841);
            _547 = _843;
            _549 = as_type<float>(_845);
            _551 = as_type<float>(_847);
            _553 = as_type<float>(_849);
            _555 = as_type<float>(_851);
            _557 = as_type<float>(_853);
            _559 = as_type<float>(_855);
            _857 = as_type<float>(_835);
            _859 = as_type<float>(_841);
            _861 = as_type<float>(_849);
        } while (_561);
        _863 = _843;
        _865 = as_type<float>(_851);
        _867 = as_type<float>(_833);
        _471 = _837;
        _869 = as_type<float>(_845);
        _871 = as_type<float>(_853);
        _873 = as_type<float>(_847);
        _875 = as_type<float>(_855);
        _473 = as_type<float>(_839);
        _877 = true;
    }
    else
    {
        float _879 = -_447;
        float _881 = _879 + (-0.0);
        _857 = _459;
        _863 = _467;
        _865 = _457;
        _867 = _465;
        _859 = _455;
        _861 = _881;
        _869 = _469;
        _871 = _461;
        _873 = _387;
        _875 = _389;
    }
    _877 = false;
    float _883 = _857;
    float _885 = _863;
    float _887 = _865;
    float _889 = _867;
    float _891 = _859;
    float _893 = _861;
    float _895 = _471;
    float _897 = _869;
    float _899 = _871;
    float _901 = _873;
    float _903 = _875;
    float _905 = _473;
    int _907 = _527 + 80;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.cp_c6)._m0[int(_911)][_913];
    int _917 = int(_909) + 1;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    int _921 = _917 & 3;
    float _923 = (*spvDescriptorSet0.cp_c6)._m0[int(_919)][_921];
    int _925 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _927 = _925 + _66;
    int _929 = _527 + 64;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.cp_c6)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.cp_c6)._m0[int(_941)][_943];
    int _947 = _527 + 88;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    uint _951 = uint(int(uint(int(_949)) >> uint(2)));
    int _953 = int(_949) & 3;
    float _955 = (*spvDescriptorSet0.cp_c6)._m0[int(_951)][_953];
    int _957 = int(_949) + 1;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    int _961 = _957 & 3;
    float _963 = (*spvDescriptorSet0.cp_c6)._m0[int(_959)][_961];
    int _965 = _527 + 72;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.cp_c6)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.cp_c6)._m0[int(_977)][_979];
    int _983 = _527 + 96;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    uint _987 = uint(int(uint(int(_985)) >> uint(2)));
    int _989 = int(_985) & 3;
    float _991 = (*spvDescriptorSet0.cp_c6)._m0[int(_987)][_989];
    int _993 = int(_985) + 1;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    int _997 = _993 & 3;
    float _999 = (*spvDescriptorSet0.cp_c6)._m0[int(_995)][_997];
    int _1001 = _527 + 104;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    uint _1005 = uint(int(uint(int(_1003)) >> uint(2)));
    int _1007 = int(_1003) & 3;
    float _1009 = (*spvDescriptorSet0.cp_c6)._m0[int(_1005)][_1007];
    int _1011 = int(_1003) + 1;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    int _1015 = _1011 & 3;
    float _1017 = (*spvDescriptorSet0.cp_c6)._m0[int(_1013)][_1015];
    float _1019 = _883 * _915;
    float _1021 = _885 * _915;
    int _1023 = _527 + 16;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.cp_c6)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.cp_c6)._m0[int(_1035)][_1037];
    float _1041 = _887 * _915;
    float _1043 = _887 * _923;
    float _1045 = fma(_889, _937, _1019);
    float _1047 = fma(_891, _937, _1021);
    float _1049 = _883 * _923;
    float _1051 = _885 * _923;
    int _1053 = _527 + 32;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    uint _1057 = uint(int(uint(int(_1055)) >> uint(2)));
    int _1059 = int(_1055) & 3;
    float _1061 = (*spvDescriptorSet0.cp_c6)._m0[int(_1057)][_1059];
    int _1063 = int(_1055) + 1;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    int _1067 = _1063 & 3;
    float _1069 = (*spvDescriptorSet0.cp_c6)._m0[int(_1065)][_1067];
    float _1071 = fma(_893, _937, _1041);
    float _1073 = fma(_889, _945, _1049);
    float _1075 = fma(_891, _945, _1051);
    float _1077 = fma(_893, _945, _1043);
    float _1079 = _883 * _955;
    float _1081 = _885 * _955;
    float _1083 = _883 * _963;
    int _1085 = _527 + 48;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    uint _1089 = uint(int(uint(int(_1087)) >> uint(2)));
    int _1091 = int(_1087) & 3;
    float _1093 = (*spvDescriptorSet0.cp_c6)._m0[int(_1089)][_1091];
    int _1095 = int(_1087) + 1;
    uint _1097 = uint(int(uint(_1095) >> uint(2)));
    int _1099 = _1095 & 3;
    float _1101 = (*spvDescriptorSet0.cp_c6)._m0[int(_1097)][_1099];
    float _1103 = _885 * _963;
    float _1105 = _887 * _955;
    float _1107 = _887 * _963;
    float _1109 = fma(_889, _973, _1079);
    float _1111 = fma(_889, _981, _1083);
    float _1113 = fma(_891, _973, _1081);
    float _1115 = fma(_891, _981, _1103);
    int _1117 = _527 + 24;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    uint _1121 = uint(int(uint(int(_1119)) >> uint(2)));
    int _1123 = int(_1119) & 3;
    float _1125 = (*spvDescriptorSet0.cp_c6)._m0[int(_1121)][_1123];
    int _1127 = int(_1119) + 1;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    int _1131 = _1127 & 3;
    float _1133 = (*spvDescriptorSet0.cp_c6)._m0[int(_1129)][_1131];
    float _1135 = fma(_893, _973, _1105);
    float _1137 = fma(_893, _981, _1107);
    float _1139 = fma(_895, _991, _1045);
    float _1141 = fma(_895, _999, _1073);
    float _1143 = fma(_897, _991, _1047);
    float _1145 = fma(_897, _999, _1075);
    int _1147 = _527 + 40;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
    int _1153 = int(_1149) & 3;
    float _1155 = (*spvDescriptorSet0.cp_c6)._m0[int(_1151)][_1153];
    int _1157 = int(_1149) + 1;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    int _1161 = _1157 & 3;
    float _1163 = (*spvDescriptorSet0.cp_c6)._m0[int(_1159)][_1161];
    float _1165 = fma(_899, _991, _1071);
    float _1167 = fma(_899, _999, _1077);
    float _1169 = fma(_897, _1017, _1115);
    float _1171 = fma(_895, _1009, _1109);
    float _1173 = fma(_895, _1017, _1111);
    float _1175 = fma(_899, _1017, _1137);
    int _1177 = _527 + 56;
    uint _1179 = uint(int(uint(_1177) >> uint(2)));
    uint _1181 = uint(int(uint(int(_1179)) >> uint(2)));
    int _1183 = int(_1179) & 3;
    float _1185 = (*spvDescriptorSet0.cp_c6)._m0[int(_1181)][_1183];
    int _1187 = int(_1179) + 1;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    int _1191 = _1187 & 3;
    float _1193 = (*spvDescriptorSet0.cp_c6)._m0[int(_1189)][_1191];
    float _1195 = fma(_897, _1009, _1113);
    float _1197 = _1169 + _901;
    float _1199 = fma(_899, _1009, _1135);
    float _1201 = _1175 + _903;
    float _1203 = _1173 + _905;
    float _1205 = _1143 * _1039;
    float _1207 = _1145 * _1039;
    float _1209 = _1195 * _1039;
    float _1211 = _1197 * _1039;
    float _1213 = fma(_1139, _1031, _1205);
    float _1215 = fma(_1141, _1031, _1207);
    float _1217 = fma(_1171, _1031, _1209);
    float _1219 = fma(_1203, _1031, _1211);
    float _1221 = _1143 * _1069;
    float _1223 = _1145 * _1069;
    float _1225 = _1195 * _1069;
    float _1227 = _1197 * _1069;
    float _1229 = fma(_1139, _1061, _1221);
    float _1231 = fma(_1141, _1061, _1223);
    float _1233 = fma(_1171, _1061, _1225);
    float _1235 = fma(_1203, _1061, _1227);
    float _1237 = _1197 * _1101;
    float _1239 = _1143 * _1101;
    float _1241 = _1145 * _1101;
    float _1243 = _1195 * _1101;
    float _1245 = fma(_1203, _1093, _1237);
    float _1247 = fma(_1139, _1093, _1239);
    float _1249 = fma(_1141, _1093, _1241);
    float _1251 = fma(_1171, _1093, _1243);
    float _1253 = fma(_1201, _1125, _1219);
    float _1255 = fma(_1165, _1125, _1213);
    float _1257 = fma(_1167, _1125, _1215);
    float _1259 = fma(_1199, _1125, _1217);
    int _1261 = _927 * 48;
    float _1263 = _1253 + _1133;
    float _1265 = fma(_1201, _1155, _1235);
    int _1267 = _1261 + 16;
    float _1269 = fma(_1165, _1155, _1229);
    float _1271 = fma(_1167, _1155, _1231);
    float _1273 = fma(_1199, _1155, _1233);
    float _1275 = _1265 + _1163;
    int _1277 = _1261 + 32;
    uint _1279 = uint(int(uint(_1267) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1279)] = as_type<uint>(_1255);
    int _1281 = _1267 + 4;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1283)] = as_type<uint>(_1257);
    int _1285 = _1267 + 8;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1287)] = as_type<uint>(_1259);
    int _1289 = _1267 + 12;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1291)] = as_type<uint>(_1263);
    float _1293 = fma(_1201, _1185, _1245);
    float _1295 = fma(_1165, _1185, _1247);
    float _1297 = fma(_1167, _1185, _1249);
    float _1299 = fma(_1199, _1185, _1251);
    float _1301 = _1293 + _1193;
    int _1303 = _1261 + 48;
    uint _1305 = uint(int(uint(_1277) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1305)] = as_type<uint>(_1269);
    int _1307 = _1277 + 4;
    uint _1309 = uint(int(uint(_1307) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1309)] = as_type<uint>(_1271);
    int _1311 = _1277 + 8;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1313)] = as_type<uint>(_1273);
    int _1315 = _1277 + 12;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1317)] = as_type<uint>(_1275);
    uint _1319 = uint(int(uint(_1303) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1319)] = as_type<uint>(_1295);
    int _1321 = _1303 + 4;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1323)] = as_type<uint>(_1297);
    int _1325 = _1303 + 8;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1327)] = as_type<uint>(_1299);
    int _1329 = _1303 + 12;
    uint _1331 = uint(int(uint(_1329) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1331)] = as_type<uint>(_1301);
}

