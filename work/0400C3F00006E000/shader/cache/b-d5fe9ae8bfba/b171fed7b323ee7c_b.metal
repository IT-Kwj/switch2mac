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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_34 [[id(12)]];
    sampler fp_t_tcb_34Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_36 [[id(14)]];
    sampler fp_t_tcb_36Smplr [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    sampler fp_t_tcb_8Smplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    sampler fp_t_tcb_34Smplr_w [[id(20)]];
    sampler fp_t_tcb_36Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_47 [[user(locn1), flat]];
    float4 m_53 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_45 [[user(locn6)]];
};

static inline __attribute__((always_inline))
int _67(thread const int& _4738, thread const int& _4739, thread const int& _4740, thread int& _4741, thread uint& gl_SubgroupInvocationID)
{
    int _4744 = _4740 & 31;
    uint _4747 = uint(int(uint(_4740) >> uint(8)));
    int _4749 = int(_4747) & 31;
    float _4751 = as_type<float>(gl_SubgroupInvocationID);
    int _4753 = as_type<int>(_4751) & _4749;
    int _4755 = ~_4749;
    int _4757 = _4744 & _4755;
    int _4759 = _4757 | _4753;
    int _4761 = ~_4749;
    int _4763 = _4739 & _4761;
    int _4765 = _4763 | _4753;
    bool _4767 = uint(_4765) <= uint(_4759);
    _4741 = _4767 ? (-1) : 0;
    float _4769 = spvSubgroupShuffle(as_type<float>(_4738), uint(_4765));
    uint _4771 = uint(_4767 ? as_type<int>(_4769) : _4738);
    return int(_4771);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_45.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_45.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_45.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _71;
    float _93 = _91 * _77;
    float _95 = _91 * _83;
    float _97 = _91 * _89;
    float _99 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _101 = _93 + _99;
    float _103 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _105 = _95 + _103;
    float _107 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _109 = _97 + _107;
    float _111 = _101 * _101;
    float _113 = fma(_105, _105, _111);
    float _115 = fma(_109, _109, _113);
    float _117 = rsqrt(_115);
    float _119 = _105 * _117;
    float _121 = _109 * _117;
    float _123 = _121 * 0.0625;
    float _125 = abs(_119);
    float _127 = abs(_121);
    float _129 = precise::max(_125, _127);
    bool _133 = _129 >= 16.0;
    float _135 = _119 * 0.0625;
    float _137 = _133 ? _123 : _121;
    float _139 = _133 ? _135 : _119;
    float _141 = abs(_137);
    bool _143 = _141 != 0.0;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan(0.0);
    bool _151 = _147 || _149;
    float _153 = abs(_139);
    bool _155 = _153 == 0.0;
    bool _157 = !_151;
    bool _159 = _155 && _157;
    bool _161 = false;
    int _163 = as_type<int>(_135);
    if (_159)
    {
        bool _165 = as_type<int>(_139) >= 0;
        _161 = _165;
    }
    bool _167 = _161;
    int _169 = _167 ? (-1) : 0;
    bool _171 = _167;
    if (_159)
    {
        int _173 = as_type<int>(_137) & int(0x80000000);
        _163 = _173;
    }
    int _175 = _163;
    int _177 = 0;
    int _179 = _175;
    int _181 = _175;
    if (_159)
    {
        int _183 = _167 ? 0 : 1078530011;
        _177 = _183;
    }
    int _185 = _177;
    int _187 = _185;
    if (_159)
    {
        int _189 = _185 | _175;
        _187 = _189;
    }
    int _191 = _187;
    int _193 = _191;
    float _195 = as_type<float>(_191);
    bool _197 = false;
    if (!_159)
    {
        float _199 = abs(_137);
        bool _201 = _199 != as_type<float>(0x7f800000u /* inf */);
        bool _203 = isnan(_199);
        bool _205 = _201 || _203;
        bool _207 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _209 = _205 || _207;
        float _211 = abs(_139);
        bool _213 = _211 == as_type<float>(0x7f800000u /* inf */);
        float _215 = abs(_139);
        bool _217 = _215 == as_type<float>(0x7f800000u /* inf */);
        bool _219 = !_209;
        bool _221 = _217 && _219;
        _197 = _213;
        if (_221)
        {
            bool _223 = as_type<int>(_139) >= 0;
            _169 = _223 ? (-1) : 0;
        }
        int _225 = _169;
        _171 = _225 != 0;
        if (_221)
        {
            _193 = 1075235812;
        }
        int _227 = _193;
        int _229 = _227;
        if (_221)
        {
            int _231 = as_type<int>(_137) & int(0x80000000);
            _179 = _231;
        }
        int _233 = _179;
        _181 = _233;
        if (_221)
        {
            int _235 = ~_225;
            int _237 = (_235 != 0) ? _227 : 1061752795;
            _229 = _237;
        }
        int _239 = _229;
        float _241 = as_type<float>(_239);
        if (_221)
        {
            int _243 = _239 | _233;
            _241 = as_type<float>(_243);
        }
        float _245 = _241;
        bool _247 = !_209;
        bool _249 = _247 && _213;
        _195 = _245;
        if (!_249)
        {
            float _251 = abs(_137);
            float _253 = abs(_139);
            float _255 = precise::max(_251, _253);
            float _257 = abs(_137);
            float _259 = abs(_139);
            float _261 = precise::min(_257, _259);
            float _263 = 1.0 / _255;
            float _265 = abs(_137);
            float _267 = abs(_139);
            bool _269 = _265 > _267;
            bool _271 = as_type<int>(_139) >= 0;
            int _273 = as_type<int>(_137) & int(0x80000000);
            float _275 = _261 * _263;
            float _277 = _275 * _275;
            float _279 = _277 + 11.33538818359375;
            float _281 = fma(_277, _279, 28.84246826171875);
            float _283 = fma(_277, _281, 19.6966705322265625);
            float _285 = fma(_277, -0.82336294651031494140625, -5.674867153167724609375);
            float _287 = fma(_277, _285, -6.565555095672607421875);
            float _289 = 1.0 / _283;
            float _291 = _277 * _287;
            float _293 = abs(_137);
            float _295 = abs(_139);
            float _297 = _293 + _295;
            float _299 = _275 * _291;
            bool _301 = _297 > as_type<float>(0x7f800000u /* inf */);
            bool _303 = isnan(_297);
            bool _305 = _301 || _303;
            bool _307 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _309 = _305 || _307;
            float _311 = fma(_299, _289, _275);
            float _313 = _311;
            _195 = _297;
            _171 = _271;
            _181 = _273;
            if (_269)
            {
                float _315 = -_311;
                float _317 = _315 + 1.57079637050628662109375;
                _313 = _317;
            }
            float _319 = _313;
            int _321 = as_type<int>(_319);
            if (!_271)
            {
                float _323 = -_319;
                float _325 = _323 + 3.1415927410125732421875;
                _321 = as_type<int>(_325);
            }
            int _327 = _321;
            if (!_309)
            {
                int _329 = _273 | _327;
                _195 = as_type<float>(_329);
            }
        }
    }
    float _331 = _195;
    bool _333 = _197;
    bool _335 = _171;
    int _337 = _181;
    float _339 = fma(_331, 0.15915493667125701904296875, 0.11000001430511474609375);
    float _341 = _119 * (-0.66627597808837890625);
    float _343 = _101 * _117;
    float _345 = floor(_339);
    float _347 = fma(_121, 0.74570524692535400390625, _341);
    float _349 = abs(_343);
    float _351 = abs(_347);
    float _353 = precise::max(_349, _351);
    bool _355 = _353 >= 16.0;
    float _357 = _343 * 0.0625;
    float _359 = -_345;
    float _361 = _339 + _359;
    float _363 = _355 ? _357 : _343;
    float _365 = _361 + 0.5;
    int _367 = as_type<int>(_361);
    int _369 = 0;
    int _371 = 7171;
    int _373;
    int _2484 = _67(_367, _369, _371, _373, gl_SubgroupInvocationID);
    int _375 = _2484;
    float _377 = abs(_363);
    bool _379 = _377 != 0.0;
    bool _381 = isnan(_377);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    float _389 = _347;
    bool _391 = _333;
    int _393 = as_type<int>(_357);
    if (_355)
    {
        float _395 = _347 * 0.0625;
        _389 = _395;
    }
    float _397 = _389;
    float _399 = floor(_365);
    float _401 = abs(_397);
    bool _403 = _401 == 0.0;
    bool _405 = !_387;
    bool _407 = _403 && _405;
    float _409 = abs(_397);
    bool _411 = _409 == 0.0;
    float _413 = -_399;
    float _415 = _365 + _413;
    if (_407)
    {
        bool _417 = as_type<int>(_397) >= 0;
        _391 = _417;
    }
    bool _419 = _391;
    int _421 = as_type<int>(_415);
    int _423 = 0;
    int _425 = 7171;
    int _427;
    int _2539 = _67(_421, _423, _425, _427, gl_SubgroupInvocationID);
    int _429 = _2539;
    uint _2553 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _431 = (as_type<float>(_375) * float4(1.0, -1.0, 1.0, 0.0)[_2553]) + (_361 * float4(1.0, 1.0, -1.0, 1.0)[_2553]);
    int _433 = _419 ? (-1) : 0;
    bool _435 = _419;
    if (_407)
    {
        int _437 = _419 ? 0 : 1078530011;
        _393 = _437;
    }
    int _439 = _393;
    int _441 = as_type<int>(_431);
    int _443 = 1;
    int _445 = 7171;
    int _447;
    int _2571 = _67(_441, _443, _445, _447, gl_SubgroupInvocationID);
    int _449 = _2571;
    int _451 = _439;
    if (_407)
    {
        int _453 = int(0x80000000) & as_type<int>(_363);
        int _455 = _439 | _453;
        _451 = _455;
    }
    int _457 = _451;
    uint _2591 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _459 = (as_type<float>(_429) * float4(1.0, -1.0, 1.0, 0.0)[_2591]) + (_415 * float4(1.0, 1.0, -1.0, 1.0)[_2591]);
    int _461 = as_type<int>(_431);
    int _463 = 2;
    int _465 = 7171;
    int _467;
    int _2599 = _67(_461, _463, _465, _467, gl_SubgroupInvocationID);
    int _469 = _2599;
    int _471 = as_type<int>(_459);
    int _473 = 1;
    int _475 = 7171;
    int _477;
    int _2602 = _67(_471, _473, _475, _477, gl_SubgroupInvocationID);
    int _479 = _2602;
    int _481 = as_type<int>(_459);
    int _483 = 2;
    int _485 = 7171;
    int _487;
    int _2605 = _67(_481, _483, _485, _487, gl_SubgroupInvocationID);
    int _489 = _2605;
    bool _491 = !_387;
    bool _493 = _491 && _411;
    int _495 = _457;
    float _497 = as_type<float>(_457);
    if (!_493)
    {
        float _499 = abs(_363);
        bool _501 = _499 != as_type<float>(0x7f800000u /* inf */);
        bool _503 = isnan(_499);
        bool _505 = _501 || _503;
        bool _507 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _509 = _505 || _507;
        float _511 = abs(_397);
        bool _513 = _511 == as_type<float>(0x7f800000u /* inf */);
        float _515 = abs(_397);
        bool _517 = _515 == as_type<float>(0x7f800000u /* inf */);
        bool _519 = !_509;
        bool _521 = _517 && _519;
        if (_521)
        {
            bool _523 = as_type<int>(_397) >= 0;
            _433 = _523 ? (-1) : 0;
        }
        int _525 = _433;
        _435 = _525 != 0;
        if (_521)
        {
            _495 = 1075235812;
        }
        int _527 = _495;
        int _529 = _527;
        if (_521)
        {
            int _531 = ~_525;
            int _533 = (_531 != 0) ? _527 : 1061752795;
            _529 = _533;
        }
        int _535 = _529;
        float _537 = as_type<float>(_535);
        if (_521)
        {
            int _539 = int(0x80000000) & as_type<int>(_363);
            int _541 = _535 | _539;
            _537 = as_type<float>(_541);
        }
        float _543 = _537;
        bool _545 = !_509;
        bool _547 = _545 && _513;
        _497 = _543;
        if (!_547)
        {
            float _549 = abs(_397);
            float _551 = abs(_363);
            float _553 = precise::max(_549, _551);
            float _555 = abs(_397);
            float _557 = abs(_363);
            float _559 = precise::min(_555, _557);
            float _561 = 1.0 / _553;
            float _563 = abs(_363);
            float _565 = abs(_397);
            bool _567 = _563 > _565;
            bool _569 = as_type<int>(_397) >= 0;
            float _571 = abs(_397);
            float _573 = abs(_363);
            float _575 = _571 + _573;
            int _577 = as_type<int>(_363) & int(0x80000000);
            bool _579 = _575 > as_type<float>(0x7f800000u /* inf */);
            bool _581 = isnan(_575);
            bool _583 = _579 || _581;
            bool _585 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _587 = _583 || _585;
            float _589 = _559 * _561;
            float _591 = _589 * _589;
            float _593 = _591 + 11.33538818359375;
            float _595 = fma(_591, _593, 28.84246826171875);
            float _597 = fma(_591, _595, 19.6966705322265625);
            float _599 = fma(_591, -0.82336294651031494140625, -5.674867153167724609375);
            float _601 = fma(_591, _599, -6.565555095672607421875);
            float _603 = 1.0 / _597;
            float _605 = _591 * _601;
            float _607 = _589 * _605;
            float _609 = fma(_607, _603, _589);
            float _611 = _609;
            _497 = _575;
            _435 = _569;
            if (_567)
            {
                float _613 = -_609;
                float _615 = _613 + 1.57079637050628662109375;
                _611 = _615;
            }
            float _617 = _611;
            int _619 = as_type<int>(_617);
            if (!_569)
            {
                float _621 = -_617;
                float _623 = _621 + 3.1415927410125732421875;
                _619 = as_type<int>(_623);
            }
            int _625 = _619;
            if (!_587)
            {
                int _627 = _577 | _625;
                _497 = as_type<float>(_627);
            }
        }
    }
    float _629 = _497;
    bool _631 = _435;
    float _633 = fma(_629, 2.8647887706756591796875, 10.43999958038330078125);
    float _635 = in.m_47.y;
    float _637 = _121 * (-0.66627597808837890625);
    float _639 = floor(_633);
    float _641 = -_639;
    float _643 = _633 + _641;
    float _645 = _643 + 0.5;
    int _647 = as_type<int>(_643);
    int _649 = 0;
    int _651 = 7171;
    int _653;
    int _2828 = _67(_647, _649, _651, _653, gl_SubgroupInvocationID);
    int _655 = _2828;
    float _657 = floor(_645);
    float _659 = -_657;
    float _661 = _645 + _659;
    int _663 = as_type<int>(_661);
    int _665 = 0;
    int _667 = 7171;
    int _669;
    int _2838 = _67(_663, _665, _667, _669, gl_SubgroupInvocationID);
    int _671 = _2838;
    uint _2846 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _673 = (as_type<float>(_655) * float4(1.0, -1.0, 1.0, 0.0)[_2846]) + (_643 * float4(1.0, 1.0, -1.0, 1.0)[_2846]);
    int _675 = as_type<int>(_673);
    int _677 = 1;
    int _679 = 7171;
    int _681;
    int _2854 = _67(_675, _677, _679, _681, gl_SubgroupInvocationID);
    int _683 = _2854;
    int _685 = as_type<int>(_673);
    int _687 = 2;
    int _689 = 7171;
    int _691;
    int _2857 = _67(_685, _687, _689, _691, gl_SubgroupInvocationID);
    int _693 = _2857;
    uint _2865 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _695 = (as_type<float>(_671) * float4(1.0, -1.0, 1.0, 0.0)[_2865]) + (_661 * float4(1.0, 1.0, -1.0, 1.0)[_2865]);
    float _697 = -_637;
    float _699 = fma(_119, 0.74570524692535400390625, _697);
    int _701 = as_type<int>(_695);
    int _703 = 1;
    int _705 = 7171;
    int _707;
    int _2878 = _67(_701, _703, _705, _707, gl_SubgroupInvocationID);
    int _709 = _2878;
    int _711 = as_type<int>(_695);
    int _713 = 2;
    int _715 = 7171;
    int _717;
    int _2881 = _67(_711, _713, _715, _717, gl_SubgroupInvocationID);
    int _719 = _2881;
    float _721 = abs(as_type<float>(_683));
    float _723 = abs(as_type<float>(_693));
    float _725 = _721 + _723;
    float _727 = fma(_699, 2.0, 2.0);
    float _729 = _725 + (-9.9999997473787516355514526367188e-05);
    float _731 = fma(_635, (*spvDescriptorSet0.fp_c9)._m0[191].y, _727);
    float _733 = abs(as_type<float>(_709));
    float _735 = abs(as_type<float>(_719));
    float _737 = _733 + _735;
    bool _739 = _729 >= _737;
    bool _741 = isnan(_729);
    bool _743 = _739 || _741;
    bool _745 = isnan(_737);
    bool _747 = _743 || _745;
    bool _749 = !_747;
    float _751 = _749 ? _643 : 0.0;
    float2 _2933 = float2(_751, _731);
    float _753 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2933, float2(0.0), isnan(_2933))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2933, float2(0.0), isnan(_2933))).w;
    float _755 = _119 * 0.100000001490116119384765625;
    float _757 = _121 * 0.100000001490116119384765625;
    float _759 = abs(_755);
    float _761 = abs(_757);
    float _763 = precise::max(_759, _761);
    bool _765 = _763 >= 16.0;
    float _767 = _757;
    float _769 = _755;
    bool _771 = _631;
    int _773 = as_type<int>(_763);
    int _775 = 1073741824;
    if (_765)
    {
        float _777 = _121 * 0.0062500000931322574615478515625;
        _767 = _777;
    }
    float _779 = _767;
    if (_765)
    {
        float _781 = _119 * 0.0062500000931322574615478515625;
        _769 = _781;
    }
    float _783 = _769;
    float _785 = abs(_779);
    bool _787 = _785 != 0.0;
    bool _789 = isnan(_785);
    bool _791 = _787 || _789;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    float _797 = abs(_783);
    bool _799 = _797 == 0.0;
    float _801 = abs(_783);
    bool _803 = _801 == 0.0;
    bool _805 = !_795;
    bool _807 = _803 && _805;
    if (_807)
    {
        bool _809 = as_type<int>(_783) >= 0;
        _771 = _809;
    }
    bool _811 = _771;
    int _813 = _811 ? (-1) : 0;
    if (_807)
    {
        int _815 = _811 ? 0 : 1078530011;
        _773 = _815;
    }
    int _817 = _773;
    int _819 = _817;
    if (_807)
    {
        int _821 = int(0x80000000) & as_type<int>(_779);
        int _823 = _817 | _821;
        _819 = _823;
    }
    int _825 = _819;
    bool _827 = !_795;
    bool _829 = _827 && _799;
    int _831 = _825;
    float _833 = as_type<float>(_825);
    if (!_829)
    {
        float _835 = abs(_779);
        bool _837 = _835 != as_type<float>(0x7f800000u /* inf */);
        bool _839 = isnan(_835);
        bool _841 = _837 || _839;
        bool _843 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _845 = _841 || _843;
        float _847 = abs(_783);
        bool _849 = _847 == as_type<float>(0x7f800000u /* inf */);
        float _851 = abs(_783);
        bool _853 = _851 == as_type<float>(0x7f800000u /* inf */);
        bool _855 = !_845;
        bool _857 = _853 && _855;
        if (_857)
        {
            bool _859 = as_type<int>(_783) >= 0;
            _813 = _859 ? (-1) : 0;
        }
        int _861 = _813;
        if (_857)
        {
            _831 = 1075235812;
        }
        int _863 = _831;
        int _865 = _863;
        if (_857)
        {
            int _867 = ~_861;
            int _869 = (_867 != 0) ? _863 : 1061752795;
            _865 = _869;
        }
        int _871 = _865;
        float _873 = as_type<float>(_871);
        if (_857)
        {
            int _875 = int(0x80000000) & as_type<int>(_779);
            int _877 = _871 | _875;
            _873 = as_type<float>(_877);
        }
        float _879 = _873;
        bool _881 = !_845;
        bool _883 = _881 && _849;
        _833 = _879;
        if (!_883)
        {
            float _885 = abs(_783);
            float _887 = abs(_779);
            float _889 = precise::max(_885, _887);
            float _891 = abs(_783);
            float _893 = abs(_779);
            float _895 = precise::min(_891, _893);
            float _897 = 1.0 / _889;
            float _899 = abs(_779);
            float _901 = abs(_783);
            bool _903 = _899 > _901;
            bool _905 = as_type<int>(_783) >= 0;
            float _907 = _895 * _897;
            float _909 = _907 * _907;
            float _911 = _909 + 11.33538818359375;
            float _913 = fma(_909, _911, 28.84246826171875);
            float _915 = fma(_909, _913, 19.6966705322265625);
            float _917 = fma(_909, -0.82336294651031494140625, -5.674867153167724609375);
            float _919 = fma(_909, _917, -6.565555095672607421875);
            float _921 = 1.0 / _915;
            float _923 = _909 * _919;
            float _925 = abs(_783);
            float _927 = abs(_779);
            float _929 = _925 + _927;
            int _931 = as_type<int>(_779) & int(0x80000000);
            float _933 = _907 * _923;
            bool _935 = _929 > as_type<float>(0x7f800000u /* inf */);
            bool _937 = isnan(_929);
            bool _939 = _935 || _937;
            bool _941 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _943 = _939 || _941;
            float _945 = fma(_933, _921, _907);
            float _947 = _945;
            _833 = _929;
            if (_903)
            {
                float _949 = -_945;
                float _951 = _949 + 1.57079637050628662109375;
                _947 = _951;
            }
            float _953 = _947;
            int _955 = as_type<int>(_953);
            if (!_905)
            {
                float _957 = -_953;
                float _959 = _957 + 3.1415927410125732421875;
                _955 = as_type<int>(_959);
            }
            int _961 = _955;
            if (!_943)
            {
                int _963 = _931 | _961;
                _833 = as_type<float>(_963);
            }
        }
    }
    float _965 = _833;
    float _967 = fma(_965, 0.15915493667125701904296875, 0.5);
    float _969 = in.m_49.w;
    float _971 = gl_FragCoord.w;
    float _973 = _969 * _971;
    float _975 = abs(as_type<float>(_449));
    float _977 = abs(as_type<float>(_469));
    float _979 = _975 + _977;
    float _981 = abs(as_type<float>(_479));
    float _983 = abs(as_type<float>(_489));
    float _985 = _981 + _983;
    float _987 = _967 * 12.0;
    float _989 = _699 * _699;
    float _991 = fma(_753, 2.0, -1.0);
    float _993 = _979 + (-9.9999997473787516355514526367188e-05);
    float _995 = floor(_987);
    float _997 = abs(_699);
    float _999 = -_989;
    float _1001 = fma(_997, _999, 1.0);
    float _1003 = fma(_343, -2.0, _967);
    float _1005 = _991 * _1001;
    float _1007 = -_995;
    float _1009 = _987 + _1007;
    float _1011 = _1009 + 0.5;
    int _1013 = as_type<int>(_1009);
    int _1015 = 0;
    int _1017 = 7171;
    int _1019;
    int _3291 = _67(_1013, _1015, _1017, _1019, gl_SubgroupInvocationID);
    int _1021 = _3291;
    float _1023 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.20000000298023223876953125;
    float _1025 = floor(_1011);
    float _1027 = _91 * _973;
    float _1029 = 1.0 / _1027;
    float _1031 = -_1025;
    float _1033 = _1011 + _1031;
    float _1035 = floor(_1023);
    int _1037 = as_type<int>(_1033);
    int _1039 = 0;
    int _1041 = 7171;
    int _1043;
    int _3312 = _67(_1037, _1039, _1041, _1043, gl_SubgroupInvocationID);
    int _1045 = _3312;
    uint _3320 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _1047 = (as_type<float>(_1021) * float4(1.0, -1.0, 1.0, 0.0)[_3320]) + (_1009 * float4(1.0, 1.0, -1.0, 1.0)[_3320]);
    float _1049 = fma(_343, -0.5, 0.5);
    int _1051 = as_type<int>(_1047);
    int _1053 = 1;
    int _1055 = 7171;
    int _1057;
    int _3331 = _67(_1051, _1053, _1055, _1057, gl_SubgroupInvocationID);
    int _1059 = _3331;
    float _1061 = precise::max(_1049, -0.100000001490116119384765625);
    int _1063 = as_type<int>(_1047);
    int _1065 = 2;
    int _1067 = 7171;
    int _1069;
    int _3337 = _67(_1063, _1065, _1067, _1069, gl_SubgroupInvocationID);
    int _1071 = _3337;
    float _1073 = precise::min(_1061, 0.60000002384185791015625);
    float _1075 = fma(_1073, 1.42857134342193603515625, 0.142857134342193603515625);
    float _1077 = in.m_49.x;
    float _1079 = gl_FragCoord.w;
    float _1081 = _1077 * _1079;
    uint _3359 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _1083 = (as_type<float>(_1045) * float4(1.0, -1.0, 1.0, 0.0)[_3359]) + (_1033 * float4(1.0, 1.0, -1.0, 1.0)[_3359]);
    float _1085 = in.m_49.y;
    float _1087 = gl_FragCoord.w;
    float _1089 = _1085 * _1087;
    int _1091 = as_type<int>(_1083);
    int _1093 = 1;
    int _1095 = 7171;
    int _1097;
    int _3374 = _67(_1091, _1093, _1095, _1097, gl_SubgroupInvocationID);
    int _1099 = _3374;
    int _1101 = as_type<int>(_1083);
    int _1103 = 2;
    int _1105 = 7171;
    int _1107;
    int _3377 = _67(_1101, _1103, _1105, _1107, gl_SubgroupInvocationID);
    int _1109 = _3377;
    float _1111 = abs(as_type<float>(_1059));
    float _1113 = abs(as_type<float>(_1071));
    float _1115 = _1111 + _1113;
    float _1117 = _1115 + (-9.9999997473787516355514526367188e-05);
    float _1119 = abs(as_type<float>(_1099));
    float _1121 = abs(as_type<float>(_1109));
    float _1123 = _1119 + _1121;
    bool _1125 = _1117 >= _1123;
    bool _1127 = isnan(_1117);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan(_1123);
    bool _1133 = _1129 || _1131;
    float _1135 = _1035 * 2.900000095367431640625;
    bool _1137 = !_1133;
    float _1139 = _1137 ? _1009 : 0.0;
    float _1141 = _91 * _1089;
    bool _1143 = _993 >= _985;
    bool _1145 = isnan(_993);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(_985);
    bool _1151 = _1147 || _1149;
    float _1153 = _1005 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _1155 = _91 * _1081;
    float _1157 = fma(_1003, 1.2000000476837158203125, _1135);
    bool _1159 = !_1151;
    float _1161 = _1159 ? _361 : 0.0;
    float _1163 = fma(_1075, _1075, _1153);
    float _1165 = _1155 * _1029;
    float _1167 = _1141 * _1029;
    float _1169 = fma(_1035, 0.430000007152557373046875, _1139);
    float2 _3468 = float2(_1165, _1167);
    float _1171 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3468, float2(0.0), isnan(_3468))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3468, float2(0.0), isnan(_3468))).x;
    float2 _3476 = float2(_1161, _1163);
    float2 _1175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3476, float2(0.0), isnan(_3476))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3476, float2(0.0), isnan(_3476))).xw;
    float _1177 = _1175.x;
    float _1179 = _1175.y;
    float2 _3488 = float2(_1169, _1157);
    float _1181 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3488, float2(0.0), isnan(_3488))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3488, float2(0.0), isnan(_3488))).w;
    float _1183 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.02999999932944774627685546875;
    float _1185 = floor(_1183);
    float _1187 = _1185 * 12.98980045318603515625;
    float _1189 = _1187 + 78.233001708984375;
    float _1191 = _1187 * 0.15915493667125701904296875;
    float _1193 = _1189 * 0.15915493667125701904296875;
    float _1195 = _1191 * 6.283185482025146484375;
    float _1197 = sin(_1195);
    float _1199 = _1193 * 6.283185482025146484375;
    float _1201 = sin(_1199);
    float _1203 = _1197 * 43758.546875;
    float _1205 = _1187 + 39.1165008544921875;
    float _1207 = floor(_1203);
    float _1209 = _1201 * 43758.546875;
    float _1211 = floor(_1209);
    float _1213 = _1205 * 0.15915493667125701904296875;
    float _1215 = -_1207;
    float _1217 = _1203 + _1215;
    float _1219 = _1213 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = in.m_49.z;
    float _1225 = gl_FragCoord.w;
    float _1227 = _1223 * _1225;
    float _1229 = -_1211;
    float _1231 = _1209 + _1229;
    float _1233 = fma(_1217, 2.0, -1.0);
    float _1235 = fma(_1231, 2.0, -1.0);
    float _1237 = fma(_1233, _1233, 0.25);
    float _1239 = _1235 * _1235;
    float _1241 = fma(_1235, _1235, _1237);
    float _1243 = _1221 * 43758.546875;
    float _1245 = fma(_1167, 2.0, -1.0);
    float _1247 = fma(_1233, _1233, _1239);
    float _1249 = fma(_1165, 2.0, -1.0);
    float _1251 = rsqrt(_1241);
    float _1253 = _1245 * _1245;
    float _1255 = fma(_1249, _1249, _1253);
    float _1257 = -_1185;
    float _1259 = _1183 + _1257;
    float _1261 = rsqrt(_1247);
    float _1263 = fma(_1259, 2.0, -1.0);
    float _1265 = fma(_1251, -0.5, _343);
    float _1267 = floor(_1243);
    float _1269 = -_1233;
    float _1271 = fma(_1269, _1251, _119);
    float _1273 = -_1235;
    float _1275 = fma(_1273, _1251, _121);
    float _1277 = _1265 * _1265;
    float _1279 = fma(_1271, _1271, _1277);
    float _1281 = _343 * _343;
    float _1283 = fma(_1233, _1261, _119);
    float _1285 = fma(_1235, _1261, _121);
    float _1287 = fma(_1275, _1275, _1279);
    float _1289 = sqrt(_1255);
    float _1291 = fma(_1283, _1283, _1281);
    float _1293 = -_1267;
    float _1295 = _1243 + _1293;
    float _1297 = fma(_1285, _1285, _1291);
    int _1299 = as_type<int>(_1285);
    if (_159)
    {
        int _1301 = _335 ? 0 : 1078530011;
        _1299 = _1301;
    }
    int _1303 = _1299;
    float _1305 = sqrt(_1287);
    float _1307 = fma(_1295, 0.0999999940395355224609375, 0.4000000059604644775390625);
    float _1309 = _91 * _1227;
    if (_159)
    {
        int _1311 = _1303 | _337;
        _775 = _1311;
    }
    int _1313 = _775;
    float _1315 = _1309 * _1029;
    float _1317 = precise::max(_1307, 0.4000000059604644775390625);
    float _1319 = sqrt(_1297);
    int _1321 = _1313;
    float _1323 = as_type<float>(_1313);
    if (!_159)
    {
        float _1325 = abs(_137);
        bool _1327 = _1325 != as_type<float>(0x7f800000u /* inf */);
        bool _1329 = isnan(_1325);
        bool _1331 = _1327 || _1329;
        bool _1333 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1335 = _1331 || _1333;
        float _1337 = abs(_139);
        bool _1339 = _1337 == as_type<float>(0x7f800000u /* inf */);
        float _1341 = abs(_139);
        bool _1343 = _1341 == as_type<float>(0x7f800000u /* inf */);
        bool _1345 = !_1335;
        bool _1347 = _1343 && _1345;
        if (_1347)
        {
            _1321 = 1075235812;
        }
        int _1349 = _1321;
        int _1351 = _1349;
        if (_1347)
        {
            bool _1353 = !_335;
            int _1355 = _1353 ? _1349 : 1061752795;
            _1351 = _1355;
        }
        int _1357 = _1351;
        float _1359 = as_type<float>(_1357);
        if (_1347)
        {
            int _1361 = _1357 | _337;
            _1359 = as_type<float>(_1361);
        }
        float _1363 = _1359;
        bool _1365 = !_1335;
        bool _1367 = _1365 && _1339;
        _1323 = _1363;
        if (!_1367)
        {
            float _1369 = abs(_137);
            float _1371 = abs(_139);
            float _1373 = precise::max(_1369, _1371);
            float _1375 = abs(_137);
            float _1377 = abs(_139);
            float _1379 = precise::min(_1375, _1377);
            float _1381 = abs(_137);
            float _1383 = abs(_139);
            bool _1385 = _1381 > _1383;
            float _1387 = 1.0 / _1373;
            float _1389 = _1379 * _1387;
            float _1391 = abs(_137);
            float _1393 = abs(_139);
            float _1395 = _1391 + _1393;
            float _1397 = _1389 * _1389;
            bool _1399 = _1395 > as_type<float>(0x7f800000u /* inf */);
            bool _1401 = isnan(_1395);
            bool _1403 = _1399 || _1401;
            bool _1405 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1407 = _1403 || _1405;
            float _1409 = _1397 + 11.33538818359375;
            float _1411 = fma(_1397, _1409, 28.84246826171875);
            float _1413 = fma(_1397, _1411, 19.6966705322265625);
            float _1415 = fma(_1397, -0.82336294651031494140625, -5.674867153167724609375);
            float _1417 = 1.0 / _1413;
            float _1419 = fma(_1397, _1415, -6.565555095672607421875);
            float _1421 = _1397 * _1419;
            float _1423 = _1389 * _1421;
            float _1425 = fma(_1423, _1417, _1389);
            float _1427 = _1425;
            _1323 = _1395;
            if (_1385)
            {
                float _1429 = -_1425;
                float _1431 = _1429 + 1.57079637050628662109375;
                _1427 = _1431;
            }
            float _1433 = _1427;
            int _1435 = as_type<int>(_1433);
            if (!_335)
            {
                float _1437 = -_1433;
                float _1439 = _1437 + 3.1415927410125732421875;
                _1435 = as_type<int>(_1439);
            }
            int _1441 = _1435;
            if (!_1407)
            {
                int _1443 = _337 | _1441;
                _1323 = as_type<float>(_1443);
            }
        }
    }
    float _1445 = _1323;
    float _1447 = _343 + (-0.3358770310878753662109375);
    float _1449 = fma(_1445, 0.3183098733425140380859375, _1217);
    float _1451 = _119 + (-0.783713042736053466796875);
    float _1453 = precise::min(_1317, 0.5);
    float _1455 = _1447 * _1447;
    float _1457 = fma(_1449, 4.5, 4.5);
    float _1459 = fma(_1289, -1.11111104488372802734375, 1.3333332538604736328125);
    float _1461 = precise::clamp(_1459, 0.0, 1.0);
    float _1463 = -_1453;
    float _1465 = 1.0 / _1463;
    float _1467 = fma(_1451, _1451, _1455);
    float _1469 = -_1453;
    float _1471 = _1469 + _1305;
    float _1473 = fma(_343, -3.3333339691162109375, 2.66666698455810546875);
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = floor(_1457);
    float _1479 = fma(_1319, -2.22222232818603515625, 1.0);
    float _1481 = precise::clamp(_1479, 0.0, 1.0);
    float _1483 = fma(_1475, -2.0, 3.0);
    float _1485 = _1475 * _1475;
    float _1487 = _121 + 0.52247536182403564453125;
    float _1489 = fma(_1481, -2.0, 3.0);
    float _1491 = _1481 * _1481;
    float _1493 = _1483 * _1485;
    float _1495 = fma(_1487, _1487, _1467);
    float _1497 = _1471 * _1465;
    float _1499 = precise::clamp(_1497, 0.0, 1.0);
    float _1501 = _1489 * _1491;
    float _1503 = _343 * 0.783713042736053466796875;
    float _1505 = _121 * 0.3358770310878753662109375;
    float _1507 = in.m_51.w;
    float _1509 = gl_FragCoord.w;
    float _1511 = _1507 * _1509;
    float _1513 = -_1503;
    float _1515 = fma(_119, 0.3358770310878753662109375, _1513);
    float _1517 = -_1477;
    float _1519 = _1457 + _1517;
    float _1521 = -_1505;
    float _1523 = fma(_343, -0.52247536182403564453125, _1521);
    float _1525 = sqrt(_1495);
    float _1527 = in.m_53.w;
    float _1529 = gl_FragCoord.w;
    float _1531 = _1527 * _1529;
    float _1533 = _119 * _1515;
    float _1535 = _119 * (-0.52247536182403564453125);
    float _1537 = fma(_1499, -2.0, 3.0);
    float _1539 = _1499 * _1499;
    float _1541 = -_1533;
    float _1543 = fma(_121, _1523, _1541);
    float _1545 = -_1535;
    float _1547 = fma(_121, 0.783713042736053466796875, _1545);
    float _1549 = _1519 + 0.5;
    float _1551 = fma(_1537, _1539, _1501);
    float _1553 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.5;
    float _1555 = floor(_1549);
    float _1557 = _1553 * 0.15915493667125701904296875;
    float _1559 = abs(_1263);
    float _1561 = -_1559;
    float _1563 = _1561 + 1.0;
    float _1565 = precise::max(_1525, 0.104999996721744537353515625);
    float _1567 = _1177 * _1177;
    float _1569 = precise::max(_1525, 0.100000001490116119384765625);
    float _1571 = _1563 * _1563;
    float _1573 = precise::min(_1565, 0.11499999463558197021484375);
    float _1575 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _1577 = fma(_1315, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1575);
    float _1579 = _1557 * 6.283185482025146484375;
    float _1581 = sin(_1579);
    float _1583 = precise::min(_1569, 0.104999996721744537353515625);
    float _1585 = fma(_1547, 4.875, 0.5);
    float _1587 = _1573 * 25.0000057220458984375;
    float _1589 = _1551 * _1551;
    float _1591 = -_1555;
    float _1593 = _1549 + _1591;
    float _1595 = fma(_1583, 200.0001983642578125, _1587);
    float _1597 = in.m_55.x;
    float _1599 = gl_FragCoord.w;
    float _1601 = _1597 * _1599;
    float _1603 = _1589 * _1571;
    float _1605 = _91 * _1531;
    float _1607 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _1609 = fma(_1171, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1607);
    float _1611 = 1.0 / _1577;
    float _1613 = _91 * _1511;
    float _1615 = _1179 * _1605;
    float _1617 = fma(_1581, 0.25, 0.25);
    float _1619 = fma(_1461, -2.0, 3.0);
    float _1621 = _1461 * _1461;
    float _1623 = _1615 * _1613;
    float _1625 = _1181 + _1617;
    float _1627 = 1.0 / _1609;
    int _1629 = as_type<int>(_1519);
    int _1631 = 0;
    int _1633 = 7171;
    int _1635;
    int _4108 = _67(_1629, _1631, _1633, _1635, gl_SubgroupInvocationID);
    int _1637 = _4108;
    float _1639 = _1623 * _1493;
    float _1641 = fma(_1619, _1621, _1625);
    float _1643 = precise::clamp(_1641, 0.0, 1.0);
    float _1645 = -_1595;
    float _1647 = _1645 + 23.8750209808349609375;
    float _1649 = precise::clamp(_1647, 0.0, 1.0);
    int _1651 = as_type<int>(_1593);
    int _1653 = 0;
    int _1655 = 7171;
    int _1657;
    int _4127 = _67(_1651, _1653, _1655, _1657, gl_SubgroupInvocationID);
    int _1659 = _4127;
    float _1661 = -_1643;
    float _1663 = _1661 + 1.0;
    float _1665 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _1667 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _1669 = _1611 * _1667;
    float _1671 = fma(_1543, -4.875, 0.4900000095367431640625);
    float _1673 = _1639 + _1663;
    float _1675 = precise::clamp(_1673, 0.0, 1.0);
    float _1677 = fma(_1649, 0.5, _1675);
    float _1679 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _1681 = -_1669;
    float _1683 = fma(_1627, _1679, _1681);
    float _1685 = 0.0 + _1677;
    float _1687 = precise::clamp(_1685, 0.0, 1.0);
    float _1689 = _91 * _1601;
    float _1691 = _1683 * _1665;
    float _1693 = precise::clamp(_1691, 0.0, 1.0);
    float _1695 = _1687 * _1693;
    uint _4185 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _1697 = (as_type<float>(_1637) * float4(1.0, -1.0, 1.0, 0.0)[_4185]) + (_1519 * float4(1.0, 1.0, -1.0, 1.0)[_4185]);
    uint _4198 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _1699 = (as_type<float>(_1659) * float4(1.0, -1.0, 1.0, 0.0)[_4198]) + (_1593 * float4(1.0, 1.0, -1.0, 1.0)[_4198]);
    float _1701 = _1695 * _1689;
    int _1703 = as_type<int>(_1697);
    int _1705 = 1;
    int _1707 = 7171;
    int _1709;
    int _4209 = _67(_1703, _1705, _1707, _1709, gl_SubgroupInvocationID);
    int _1711 = _4209;
    bool _1713 = _1701 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _1715 = isnan(_1701);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _1721 = _1717 || _1719;
    int _1723 = as_type<int>(_1697);
    int _1725 = 2;
    int _1727 = 7171;
    int _1729;
    int _4228 = _67(_1723, _1725, _1727, _1729, gl_SubgroupInvocationID);
    int _1731 = _4228;
    int _1733 = as_type<int>(_1699);
    int _1735 = 1;
    int _1737 = 7171;
    int _1739;
    int _4231 = _67(_1733, _1735, _1737, _1739, gl_SubgroupInvocationID);
    int _1741 = _4231;
    int _1743 = as_type<int>(_1699);
    int _1745 = 2;
    int _1747 = 7171;
    int _1749;
    int _4234 = _67(_1743, _1745, _1747, _1749, gl_SubgroupInvocationID);
    int _1751 = _4234;
    float _1753 = _1669;
    if (!_1721)
    {
        discard_fragment();
    }
    float _1755 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _1757 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _1755;
    float _1759 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _1761 = _1759 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _1763 = 0.0 + _1567;
    float _1765 = precise::clamp(_1763, 0.0, 1.0);
    float _1767 = _1643 * _1639;
    float _1769 = 1.0 / _1757;
    float _1771 = abs(as_type<float>(_1711));
    float _1773 = abs(as_type<float>(_1731));
    float _1775 = _1771 + _1773;
    float _1777 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _1779 = _1765 + _1777;
    bool _1781 = _1765 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _1783 = isnan(_1765);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    float _1793 = _1775 + (-9.9999997473787516355514526367188e-05);
    float _1795 = abs(as_type<float>(_1741));
    float _1797 = abs(as_type<float>(_1751));
    float _1799 = _1795 + _1797;
    float _1801 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _1803 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _1801;
    float _1805 = 1.0 / _1761;
    float _1807 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _1809 = _1807 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _1811 = _1793 >= _1799;
    bool _1813 = isnan(_1793);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(_1799);
    bool _1819 = _1815 || _1817;
    float _1821 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _1823 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _1821;
    float _1825 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _1827 = _1825 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _1829 = fma(_343, -1.875, 1.875);
    float _1831 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _1833 = _1765 + _1831;
    float _1835 = _1833 * _1769;
    bool _1837 = _1765 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _1839 = isnan(_1765);
    bool _1841 = _1837 || _1839;
    bool _1843 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _1845 = _1841 || _1843;
    float _1847 = float(_1845);
    float _1849 = _1779 * _1805;
    bool _1851 = _1765 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _1853 = isnan(_1765);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _1865 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _1863;
    float _1867 = fma(_1803, _1835, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _1869 = -_1847;
    float _1871 = _1869 + 1.0;
    float _1873 = fma(_1823, _1835, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _1875 = -_1861;
    float _1877 = _1875 + 1.0;
    float _1879 = fma(_1865, _1835, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _1881 = _1791 * _1871;
    float _1883 = fma(_1827, _1849, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _1885 = _1847 * _1877;
    bool _1887 = !_1819;
    float _1889 = _1887 ? _1519 : 0.0;
    float _1891 = _1867 * _1881;
    float _1893 = _1217 + _1829;
    float _1895 = -_1791;
    float _1897 = _1895 + 1.0;
    float _1899 = _1873 * _1881;
    float _1901 = fma(_1809, _1849, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float2 _4469 = float2(_1889, _1893);
    float _1903 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_4469, float2(0.0), isnan(_4469))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_4469, float2(0.0), isnan(_4469))).w;
    float _1905 = fma(_1897, (*spvDescriptorSet0.fp_c9)._m0[107].y, _1891);
    float _1907 = fma(_1897, (*spvDescriptorSet0.fp_c9)._m0[107].x, _1899);
    float _1909 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _1911 = _1909 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _1913 = _1879 * _1881;
    float _1915 = fma(_1901, _1885, _1905);
    float _1917 = fma(_1883, _1885, _1907);
    float _1919 = fma(_1911, _1849, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float2 _4510 = float2(_1585, _1671);
    float3 _1923 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_4510, float2(0.0), isnan(_4510))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_4510, float2(0.0), isnan(_4510))).xyz;
    float _1925 = _1923.x;
    float _1927 = _1923.y;
    float _1929 = _1923.z;
    float _1931 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 1.10000002384185791015625;
    float _1933 = precise::max(_1525, 0.20000000298023223876953125);
    float _1935 = fma(_1897, (*spvDescriptorSet0.fp_c9)._m0[107].z, _1913);
    float _1937 = _1931 * 0.15915493667125701904296875;
    float _1939 = precise::min(_1933, 0.4000000059604644775390625);
    float _1941 = _1603 * _1603;
    float _1943 = fma(_1919, _1885, _1935);
    float _1945 = fma(_1861, (*spvDescriptorSet0.fp_c9)._m0[109].x, _1917);
    float _1947 = _1937 * 6.283185482025146484375;
    float _1949 = sin(_1947);
    float _1951 = fma(_1939, 5.0, -1.0);
    float _1953 = fma(_1567, 4.0, 0.4000000059604644775390625);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = fma(_1861, (*spvDescriptorSet0.fp_c9)._m0[109].y, _1915);
    float _1959 = fma(_1861, (*spvDescriptorSet0.fp_c9)._m0[109].z, _1943);
    float _1961 = _1955 * _1955;
    float _1963 = fma(_1949, -0.25, 0.75);
    float _1965 = _1903 * _1951;
    float _1967 = _1965 * _1941;
    float _1969 = -_1179;
    float _1971 = _1969 + 1.0;
    float _1973 = _1967 * 12.0;
    float _1975 = _1925 * _1925;
    float _1977 = _1927 * _1927;
    float _1979 = fma(_1961, _1603, _1973);
    float _1981 = _1929 * _1929;
    float _1983 = _1649 * _1971;
    float _1985 = fma(_1975, 0.3499999940395355224609375, 0.0500000007450580596923828125);
    float _1987 = _1979 * _1963;
    float _1989 = fma(_1977, 0.3499999940395355224609375, 0.0500000007450580596923828125);
    float _1991 = fma(_1981, 0.3499999940395355224609375, 0.0500000007450580596923828125);
    float _1993 = fma(_1945, _1767, _1987);
    float _1995 = fma(_1957, _1767, _1987);
    float _1997 = fma(_1959, _1767, _1987);
    float _1999 = fma(_1985, _1983, _1993);
    float _2001 = fma(_1989, _1983, _1995);
    float _2003 = fma(_1991, _1983, _1997);
    if (!_1721)
    {
        out.m_58.x = _1999;
        out.m_58.y = _2001;
        out.m_58.z = _2003;
        out.m_58.w = _1677;
        return out;
    }
    float _2005 = _2001 * 0.715200006961822509765625;
    float _2007 = fma(_1999, 0.2125999927520751953125, _2005);
    float _2009 = fma(_2003, 0.072200000286102294921875, _2007);
    bool _2011 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _2013 = 1.0 / _2009;
    float _2015 = 0.0 + _1701;
    float _2017 = precise::clamp(_2015, 0.0, 1.0);
    float _2019 = _2017;
    if (_2011)
    {
        float _2021 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _2023 = _1669 + _2021;
        _1753 = _2023;
    }
    float _2025 = _1753;
    float _2027 = _2013 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _2029 = precise::clamp(_2027, 0.0, 1.0);
    float _2031 = _2025;
    if (_2011)
    {
        float _2033 = _2025 * 8.0;
        float _2035 = precise::clamp(_2033, 0.0, 1.0);
        _2031 = _2035;
    }
    float _2037 = _2031;
    float _2039 = fma(_2029, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_2011)
    {
        float _2041 = _2017 * _2037;
        _2019 = _2041;
    }
    float _2043 = _2019;
    float _2045 = _1999 * _2039;
    float _2047 = _2001 * _2039;
    float _2049 = _2003 * _2039;
    float _2051 = 0.0 + _2043;
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    out.m_58.x = _2045;
    out.m_58.y = _2047;
    out.m_58.z = _2049;
    out.m_58.w = _2053;
    return out;
}

