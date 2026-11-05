#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_34 [[id(4)]];
    sampler fp_t_tcb_34Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_34Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_52 [[user(locn7)]];
};

static inline __attribute__((always_inline))
int _63(thread const int& _1772, thread const int& _1773, thread const int& _1774, thread int& _1775, thread uint& gl_SubgroupInvocationID)
{
    int _1778 = _1774 & 31;
    uint _1781 = uint(int(uint(_1774) >> uint(8)));
    int _1783 = int(_1781) & 31;
    float _1785 = as_type<float>(gl_SubgroupInvocationID);
    int _1787 = as_type<int>(_1785) & _1783;
    int _1789 = ~_1783;
    int _1791 = _1778 & _1789;
    int _1793 = _1791 | _1787;
    int _1795 = ~_1783;
    int _1797 = _1773 & _1795;
    int _1799 = _1797 | _1787;
    bool _1801 = uint(_1799) <= uint(_1793);
    _1775 = _1801 ? (-1) : 0;
    float _1803 = spvSubgroupShuffle(as_type<float>(_1772), uint(_1799));
    uint _1805 = uint(_1801 ? as_type<int>(_1803) : _1772);
    return int(_1805);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float _87 = _83 * 0.0625;
    float _89 = _85 * 0.0625;
    float _91 = abs(_83);
    float _93 = abs(_85);
    float _95 = precise::max(_91, _93);
    bool _99 = _95 >= 16.0;
    float _101 = _99 ? _89 : _85;
    float _103 = _99 ? _87 : _83;
    float _105 = abs(_101);
    bool _107 = _105 != 0.0;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    float _117 = abs(_103);
    bool _119 = _117 == 0.0;
    float _121 = abs(_103);
    bool _123 = _121 == 0.0;
    bool _125 = !_115;
    bool _127 = _123 && _125;
    bool _129 = false;
    float _131 = _95;
    if (_127)
    {
        bool _133 = as_type<int>(_103) >= 0;
        _129 = _133;
    }
    bool _135 = _129;
    int _137 = 0;
    int _139 = _135 ? (-1) : 0;
    if (_127)
    {
        int _141 = _135 ? 0 : 1078530011;
        _137 = _141;
    }
    int _143 = _137;
    int _145 = _143;
    if (_127)
    {
        int _147 = int(0x80000000) & as_type<int>(_101);
        int _149 = _143 | _147;
        _131 = as_type<float>(_149);
    }
    float _151 = _131;
    bool _153 = !_115;
    bool _155 = _153 && _119;
    float _157 = _151;
    float _159 = _151;
    if (!_155)
    {
        float _161 = abs(_101);
        bool _163 = _161 != as_type<float>(0x7f800000u /* inf */);
        bool _165 = isnan(_161);
        bool _167 = _163 || _165;
        bool _169 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _171 = _167 || _169;
        float _173 = abs(_103);
        bool _175 = _173 == as_type<float>(0x7f800000u /* inf */);
        float _177 = abs(_103);
        bool _179 = _177 == as_type<float>(0x7f800000u /* inf */);
        bool _181 = !_171;
        bool _183 = _179 && _181;
        if (_183)
        {
            bool _185 = as_type<int>(_103) >= 0;
            _139 = _185 ? (-1) : 0;
        }
        int _187 = _139;
        if (_183)
        {
            _145 = 1075235812;
        }
        int _189 = _145;
        int _191 = _189;
        if (_183)
        {
            int _193 = ~_187;
            int _195 = (_193 != 0) ? _189 : 1061752795;
            _191 = _195;
        }
        int _197 = _191;
        if (_183)
        {
            int _199 = int(0x80000000) & as_type<int>(_101);
            int _201 = _197 | _199;
            _157 = as_type<float>(_201);
        }
        float _203 = _157;
        bool _205 = !_171;
        bool _207 = _205 && _175;
        _159 = _203;
        if (!_207)
        {
            float _209 = abs(_101);
            float _211 = abs(_103);
            float _213 = precise::max(_209, _211);
            float _215 = abs(_101);
            float _217 = abs(_103);
            float _219 = precise::min(_215, _217);
            float _221 = 1.0 / _213;
            float _223 = abs(_101);
            float _225 = abs(_103);
            bool _227 = _223 > _225;
            bool _229 = as_type<int>(_103) >= 0;
            float _231 = _219 * _221;
            float _233 = abs(_101);
            float _235 = abs(_103);
            float _237 = _233 + _235;
            int _239 = as_type<int>(_101) & int(0x80000000);
            float _241 = _231 * _231;
            bool _243 = _237 > as_type<float>(0x7f800000u /* inf */);
            bool _245 = isnan(_237);
            bool _247 = _243 || _245;
            bool _249 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _251 = _247 || _249;
            float _253 = _241 + 11.33538818359375;
            float _255 = fma(_241, _253, 28.84246826171875);
            float _257 = fma(_241, _255, 19.6966705322265625);
            float _259 = fma(_241, -0.82336294651031494140625, -5.674867153167724609375);
            float _261 = fma(_241, _259, -6.565555095672607421875);
            float _263 = 1.0 / _257;
            float _265 = _241 * _261;
            float _267 = _231 * _265;
            float _269 = fma(_267, _263, _231);
            float _271 = _269;
            _159 = _237;
            if (_227)
            {
                float _273 = -_269;
                float _275 = _273 + 1.57079637050628662109375;
                _271 = _275;
            }
            float _277 = _271;
            int _279 = as_type<int>(_277);
            if (!_229)
            {
                float _281 = -_277;
                float _283 = _281 + 3.1415927410125732421875;
                _279 = as_type<int>(_283);
            }
            int _285 = _279;
            if (!_251)
            {
                int _287 = _239 | _285;
                _159 = as_type<float>(_287);
            }
        }
    }
    float _289 = _159;
    float _291 = fma(_289, 0.159154951572418212890625, 1.0);
    float _293 = fma(_289, 0.159154951572418212890625, 0.5);
    float _295 = in.m_39.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = _85 * _85;
    float _303 = floor(_291);
    int _305 = as_type<int>(_293);
    int _307 = 0;
    int _309 = 7171;
    int _311;
    int _1116 = _63(_305, _307, _309, _311, gl_SubgroupInvocationID);
    int _313 = _1116;
    float _315 = fma(_83, _83, _301);
    float _317 = -_303;
    float _319 = _291 + _317;
    int _321 = as_type<int>(_319);
    int _323 = 0;
    int _325 = 7171;
    int _327;
    int _1128 = _63(_321, _323, _325, _327, gl_SubgroupInvocationID);
    int _329 = _1128;
    uint _1142 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _331 = (as_type<float>(_313) * float4(1.0, -1.0, 1.0, 0.0)[_1142]) + (_293 * float4(1.0, 1.0, -1.0, 1.0)[_1142]);
    float _333 = _81 * _299;
    int _335 = as_type<int>(_331);
    int _337 = 1;
    int _339 = 7171;
    int _341;
    int _1153 = _63(_335, _337, _339, _341, gl_SubgroupInvocationID);
    int _343 = _1153;
    float _345 = fma(_333, _333, _315);
    int _347 = as_type<int>(_331);
    int _349 = 2;
    int _351 = 7171;
    int _353;
    int _1160 = _63(_347, _349, _351, _353, gl_SubgroupInvocationID);
    int _355 = _1160;
    float _357 = sqrt(_345);
    uint _1170 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _359 = (as_type<float>(_329) * float4(1.0, -1.0, 1.0, 0.0)[_1170]) + (_319 * float4(1.0, 1.0, -1.0, 1.0)[_1170]);
    int _361 = as_type<int>(_359);
    int _363 = 1;
    int _365 = 7171;
    int _367;
    int _1178 = _63(_361, _363, _365, _367, gl_SubgroupInvocationID);
    int _369 = _1178;
    int _371 = as_type<int>(_359);
    int _373 = 2;
    int _375 = 7171;
    int _377;
    int _1181 = _63(_371, _373, _375, _377, gl_SubgroupInvocationID);
    int _379 = _1181;
    float _381 = _357 * (*spvDescriptorSet0.fp_c9)._m0[194].x;
    float _383 = abs(as_type<float>(_343));
    float _385 = abs(as_type<float>(_355));
    float _387 = _383 + _385;
    float _389 = _387 + (-9.9999997473787516355514526367188e-05);
    float _391 = abs(as_type<float>(_369));
    float _393 = abs(as_type<float>(_379));
    float _395 = _391 + _393;
    bool _397 = _389 >= _395;
    bool _399 = isnan(_389);
    bool _401 = _397 || _399;
    bool _403 = isnan(_395);
    bool _405 = _401 || _403;
    bool _407 = !_405;
    float _409 = _407 ? _293 : 0.0;
    float _411 = _409 * (*spvDescriptorSet0.fp_c9)._m0[193].w;
    float2 _1236 = float2(_411, _381);
    float _413 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1236, float2(0.0), isnan(_1236))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1236, float2(0.0), isnan(_1236))).x;
    float _415 = in.m_41.z;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_41.w;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.06666667759418487548828125;
    float _429 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.033333338797092437744140625;
    float _431 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.33333337306976318359375;
    float _433 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _435 = ceil(_427);
    float _437 = ceil(_429);
    float _439 = ceil(_431);
    float _441 = _435 * 0.3333333432674407958984375;
    float _443 = ceil(_433);
    float _445 = _437 * 0.3333333432674407958984375;
    float _447 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _449 = _447 * (*spvDescriptorSet0.fp_c9)._m0[194].y;
    float _451 = floor(_445);
    float _453 = _439 * 0.3333333432674407958984375;
    float _455 = -_449;
    float _457 = fma(_357, (*spvDescriptorSet0.fp_c9)._m0[194].z, _455);
    float _459 = _457 * 0.15915493667125701904296875;
    float _461 = _81 * _419;
    float _463 = floor(_441);
    float _465 = _443 * 0.5;
    float _467 = floor(_453);
    float _469 = fma(_451, -3.0, _437);
    float _471 = precise::clamp(_469, 0.0, 1.0);
    float _473 = floor(_465);
    float _475 = fma(_463, -3.0, _435);
    float _477 = precise::clamp(_475, 0.0, 1.0);
    float _479 = _471 + _477;
    float _481 = fma(_467, -3.0, _439);
    float _483 = precise::clamp(_481, 0.0, 1.0);
    float _485 = _459 * 6.283185482025146484375;
    float _487 = sin(_485);
    float _489 = -_479;
    float _491 = _489 + 2.0;
    float _493 = _491 * _483;
    float _495 = fma(_473, -2.0, _443);
    float _497 = precise::clamp(_495, 0.0, 1.0);
    float _499 = _493 * _497;
    float _501 = fma(_487, (*spvDescriptorSet0.fp_c9)._m0[194].w, _461);
    float _503 = _413 * _499;
    float _505 = fma(_503, 2.0, -1.0);
    float _507 = _81 * _425;
    float _509 = fma(_505, (*spvDescriptorSet0.fp_c9)._m0[193].z, _501);
    float2 _1382;
    _1382.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_509, _507));
    _1382.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_509, _507));
    float _511 = _1382.x;
    float _513 = _511 * 256.0;
    int _515 = int(_513);
    float _517 = float(uint(_515));
    float _519 = _517 * 0.00390625;
    float _521 = precise::min(_519, 2.0);
    float2 _1400 = float2(_509, _507);
    float _523 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1400, float2(0.0), isnan(_1400)), level(_521)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1400, float2(0.0), isnan(_1400)), level(_521)).w;
    float _525 = in.m_43.w;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = in.m_45.w;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = in.m_47.x;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = _81 * _529;
    float _545 = fma(_487, 0.5, 0.5);
    float _547 = _81 * _541;
    float _549 = _543 * _523;
    float _551 = _81 * _535;
    float _553 = fma(_503, -0.5, 0.5);
    float _555 = _551 * _549;
    float _557 = _503 + _553;
    float _559 = _555 * _545;
    float _561 = _559 * _557;
    float _563 = 0.0 + _561;
    float _565 = precise::clamp(_563, 0.0, 1.0);
    float _567 = _565 * _547;
    bool _569 = _567 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _571 = isnan(_567);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _577 = _573 || _575;
    if (!_577)
    {
        discard_fragment();
    }
    float2 _1485 = float2(_409, 0.0);
    float3 _581 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1485, float2(0.0), isnan(_1485))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1485, float2(0.0), isnan(_1485))).xyz;
    float _583 = _581.x;
    float _585 = _581.y;
    float _587 = _581.z;
    float _589 = in.m_45.y;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    float _595 = in.m_45.x;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    float _601 = in.m_45.z;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = in.m_43.x;
    float _609 = gl_FragCoord.w;
    float _611 = _607 * _609;
    float _613 = in.m_43.y;
    float _615 = gl_FragCoord.w;
    float _617 = _613 * _615;
    float _619 = in.m_43.z;
    float _621 = gl_FragCoord.w;
    float _623 = _619 * _621;
    float _625 = _81 * _593;
    float _627 = _81 * _599;
    float _629 = _81 * _605;
    float _631 = -_583;
    float _633 = _631 + 1.0;
    float _635 = -_585;
    float _637 = _635 + 1.0;
    float _639 = -_587;
    float _641 = _639 + 1.0;
    float _643 = _627 * _633;
    float _645 = _625 * _637;
    float _647 = _629 * _641;
    float _649 = _81 * _611;
    float _651 = _81 * _617;
    float _653 = _81 * _623;
    float _655 = fma(_583, _649, _643);
    float _657 = fma(_585, _651, _645);
    float _659 = fma(_587, _653, _647);
    if (!_577)
    {
        out.m_50.x = _655;
        out.m_50.y = _657;
        out.m_50.z = _659;
        out.m_50.w = _561;
        return out;
    }
    float _661 = _657 * 0.715200006961822509765625;
    float _663 = in.m_52.w;
    float _665 = gl_FragCoord.w;
    float _667 = _663 * _665;
    float _669 = in.m_52.x;
    float _671 = gl_FragCoord.w;
    float _673 = _669 * _671;
    float _675 = in.m_52.y;
    float _677 = gl_FragCoord.w;
    float _679 = _675 * _677;
    float _681 = fma(_655, 0.2125999927520751953125, _661);
    float _683 = in.m_52.z;
    float _685 = gl_FragCoord.w;
    float _687 = _683 * _685;
    float _689 = fma(_659, 0.072200000286102294921875, _681);
    bool _691 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _693 = 1.0 / _689;
    float _695 = _693 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = fma(_697, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _701 = _81 * _667;
    float _703 = _81 * _673;
    float _705 = _699 * _701;
    float _707 = 0.0 + _567;
    float _709 = precise::clamp(_707, 0.0, 1.0);
    float _711 = _81 * _679;
    float _713 = _81 * _687;
    float _715 = fma(_655, _705, _703);
    float _717 = fma(_657, _705, _711);
    float _719 = fma(_659, _705, _713);
    float _721 = _693;
    if (!_691)
    {
        _721 = _709;
    }
    float _723 = _721;
    bool _725 = !_691;
    float _727 = _723;
    if (!_725)
    {
        float _729 = in.m_54.w;
        float _731 = gl_FragCoord.w;
        float _733 = _729 * _731;
        float _735 = in.m_54.z;
        float _737 = gl_FragCoord.w;
        float _739 = _735 * _737;
        float _741 = _81 * _733;
        float _743 = _81 * _739;
        float _745 = 1.0 / _741;
        float _747 = _743 * _745;
        float _749 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _751 = fma(_747, (*spvDescriptorSet0.fp_c8)._m0[30].w, _749);
        float _753 = 1.0 / _751;
        float _755 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _757 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _759 = fma(_753, _755, _757);
        float _761 = _759 * 8.0;
        float _763 = precise::clamp(_761, 0.0, 1.0);
        float _765 = _709 * _763;
        _727 = _765;
    }
    float _767 = _727;
    float _769 = 0.0 + _767;
    float _771 = precise::clamp(_769, 0.0, 1.0);
    out.m_50.x = _715;
    out.m_50.y = _717;
    out.m_50.z = _719;
    out.m_50.w = _771;
    return out;
}

