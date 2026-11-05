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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_34 [[id(5)]];
    sampler fp_t_tcb_34Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_36 [[id(7)]];
    sampler fp_t_tcb_36Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_8 [[id(11)]];
    sampler fp_t_tcb_8Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_A [[id(13)]];
    sampler fp_t_tcb_ASmplr [[id(14)]];
    sampler fp_t_tcb_34Smplr_w [[id(15)]];
    sampler fp_t_tcb_36Smplr_w [[id(16)]];
    sampler fp_t_tcb_CSmplr_w [[id(17)]];
    sampler fp_t_tcb_8Smplr_w [[id(18)]];
    sampler fp_t_tcb_ASmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_57 [[user(locn1), flat]];
    float4 m_68 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_47 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
    float4 m_66 [[user(locn11)]];
};

static inline __attribute__((always_inline))
int _77(thread const int& _2791, thread const int& _2792, thread const int& _2793, thread int& _2794, thread uint& gl_SubgroupInvocationID)
{
    int _2797 = _2793 & 31;
    uint _2799 = uint(int(uint(_2793) >> uint(8)));
    int _2801 = int(_2799) & 31;
    float _2803 = as_type<float>(gl_SubgroupInvocationID);
    int _2805 = as_type<int>(_2803) & _2801;
    int _2807 = ~_2801;
    int _2809 = _2797 & _2807;
    int _2811 = _2809 | _2805;
    int _2813 = ~_2801;
    int _2815 = _2792 & _2813;
    int _2817 = _2815 | _2805;
    bool _2819 = uint(_2817) <= uint(_2811);
    _2794 = _2819 ? (-1) : 0;
    float _2821 = spvSubgroupShuffle(as_type<float>(_2791), uint(_2817));
    uint _2823 = uint(_2819 ? as_type<int>(_2821) : _2791);
    return int(_2823);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    bool _413 = false;
    float _81 = gl_FragCoord.w;
    float _83 = in.m_43.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_43.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = 1.0 / _81;
    float _97 = _95 * _87;
    float _99 = _95 * _93;
    float2 _1204 = float2(_97, _99);
    float2 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1204, float2(0.0), isnan(_1204))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1204, float2(0.0), isnan(_1204))).xy;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = in.m_45.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_45.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_45.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_47.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_47.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_49.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_47.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_49.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_49.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_51.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_51.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_51.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = _95 * _113;
    float _183 = _95 * _119;
    float _185 = _95 * _125;
    float _187 = _95 * _131;
    float _189 = _181 * _181;
    float _191 = _95 * _137;
    float _193 = _95 * _143;
    float _195 = _187 * _187;
    float _197 = fma(_183, _183, _189);
    float _199 = _95 * _149;
    float _201 = _95 * _155;
    float _203 = fma(_191, _191, _195);
    float _205 = fma(_185, _185, _197);
    float _207 = _193 * _193;
    float _209 = _95 * _161;
    float _211 = _95 * _167;
    float _213 = rsqrt(_205);
    float _215 = fma(_201, _201, _207);
    float _217 = fma(_199, _199, _203);
    float _219 = _95 * _173;
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _223 = _211 + _221;
    float _225 = fma(_209, _209, _215);
    float _227 = rsqrt(_217);
    float _229 = _95 * _179;
    float _231 = _223 * _223;
    float _233 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.06666667759418487548828125;
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _237 = _229 + _235;
    float _239 = _233 * 0.15915493667125701904296875;
    float _241 = _181 * _213;
    float _243 = _183 * _213;
    float _245 = _185 * _213;
    float _247 = fma(_237, _237, _231);
    float _249 = _241 * _241;
    float _251 = rsqrt(_225);
    float _253 = fma(_243, _243, _249);
    float _255 = fma(_245, _245, _253);
    float _257 = _239 * 6.283185482025146484375;
    float _259 = cos(_257);
    float _261 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _263 = _219 + _261;
    float _265 = fma(_263, _263, _247);
    float _267 = rsqrt(_255);
    float _269 = _209 * _251;
    float _271 = rsqrt(_265);
    float _273 = _237 * _271;
    float _275 = _107 * _107;
    float _277 = _251 * _107;
    float _279 = _105 * _227;
    float _281 = _107 * _269;
    float _283 = fma(_105, _105, _275);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _201 * _277;
    float _289 = _193 * _277;
    float _291 = _239 * 6.283185482025146484375;
    float _293 = sin(_291);
    float _295 = -_285;
    float _297 = _295 + 1.0;
    float _299 = fma(_191, _279, _287);
    float _301 = fma(_199, _279, _281);
    float _303 = fma(_187, _279, _289);
    float _305 = _223 * _271;
    float _307 = sqrt(_297);
    float _309 = _267 * _307;
    float _311 = fma(_243, _309, _299);
    float _313 = fma(_245, _309, _301);
    float _315 = fma(_241, _309, _303);
    float _317 = _263 * _271;
    float _319 = _311 * _259;
    float _321 = _311 * _293;
    float _323 = fma(_313, _293, _319);
    float _325 = -_305;
    float _327 = _315 * _325;
    float _329 = -_321;
    float _331 = fma(_313, _259, _329);
    float _333 = -_273;
    float _335 = fma(_323, _333, _327);
    float _337 = -_317;
    float _339 = fma(_331, _337, _335);
    float _341 = _339 + _339;
    float _343 = -_341;
    float _345 = -_317;
    float _347 = fma(_331, _343, _345);
    float _349 = -_341;
    float _351 = -_273;
    float _353 = fma(_323, _349, _351);
    float _355 = -_341;
    float _357 = -_305;
    float _359 = fma(_315, _355, _357);
    bool _363 = _347 != 0.0;
    bool _365 = isnan(_347);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    float _373 = _347;
    float _375 = _353;
    float _377 = _187;
    float _411;
    if (!_371)
    {
        bool _379 = _353 > 0.0;
        bool _381 = _353 >= 0.0;
        bool _383 = isnan(_353);
        bool _385 = _381 || _383;
        bool _387 = isnan(0.0);
        bool _389 = _385 || _387;
        int _391 = _389 ? 0 : 1;
        int _393 = ~_391;
        int _395 = _393 + 1;
        int _397 = _395 + 1;
        int _399 = _397;
        if (!_379)
        {
            int _401 = ~_391;
            int _403 = _401 + 1;
            _399 = _403;
        }
        int _405 = _399;
        float _407 = float(_405);
        float _409 = _407 * 1.57079637050628662109375;
        _411 = _409;
        _413 = true;
    }
    else
    {
        float _415 = abs(_353);
        float _417 = abs(_347);
        float _419 = precise::max(_415, _417);
        bool _421 = _419 >= 16.0;
        int _423 = as_type<int>(_419);
        if (_421)
        {
            float _425 = _347 * 0.0625;
            _373 = _425;
        }
        float _427 = _373;
        if (_421)
        {
            float _429 = _353 * 0.0625;
            _375 = _429;
        }
        float _431 = _375;
        float _433 = abs(_427);
        bool _435 = _433 != 0.0;
        bool _437 = isnan(_433);
        bool _439 = _435 || _437;
        bool _441 = isnan(0.0);
        bool _443 = _439 || _441;
        float _445 = abs(_431);
        bool _447 = _445 == 0.0;
        float _449 = abs(_431);
        bool _451 = _449 == 0.0;
        bool _453 = !_443;
        bool _455 = _451 && _453;
        bool _457 = false;
        if (_455)
        {
            bool _459 = as_type<int>(_431) >= 0;
            _457 = _459;
        }
        bool _461 = _457;
        int _463 = _461 ? (-1) : 0;
        if (_455)
        {
            int _465 = _461 ? 0 : 1078530011;
            _423 = _465;
        }
        int _467 = _423;
        int _469 = _467;
        if (_455)
        {
            int _471 = int(0x80000000) & as_type<int>(_427);
            int _473 = _467 | _471;
            _377 = as_type<float>(_473);
        }
        float _475 = _377;
        bool _477 = !_443;
        bool _479 = _477 && _447;
        float _481 = _475;
        float _483 = _475;
        if (!_479)
        {
            float _485 = abs(_427);
            bool _487 = _485 != as_type<float>(0x7f800000u /* inf */);
            bool _489 = isnan(_485);
            bool _491 = _487 || _489;
            bool _493 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _495 = _491 || _493;
            float _497 = abs(_431);
            bool _499 = _497 == as_type<float>(0x7f800000u /* inf */);
            float _501 = abs(_431);
            bool _503 = _501 == as_type<float>(0x7f800000u /* inf */);
            bool _505 = !_495;
            bool _507 = _503 && _505;
            if (_507)
            {
                bool _509 = as_type<int>(_431) >= 0;
                _463 = _509 ? (-1) : 0;
            }
            int _511 = _463;
            if (_507)
            {
                _469 = 1075235812;
            }
            int _513 = _469;
            int _515 = _513;
            if (_507)
            {
                int _517 = ~_511;
                int _519 = (_517 != 0) ? _513 : 1061752795;
                _515 = _519;
            }
            int _521 = _515;
            if (_507)
            {
                int _523 = int(0x80000000) & as_type<int>(_427);
                int _525 = _521 | _523;
                _481 = as_type<float>(_525);
            }
            float _527 = _481;
            bool _529 = !_495;
            bool _531 = _529 && _499;
            _483 = _527;
            if (!_531)
            {
                float _533 = abs(_427);
                float _535 = abs(_431);
                float _537 = precise::max(_533, _535);
                float _539 = abs(_427);
                float _541 = abs(_431);
                float _543 = precise::min(_539, _541);
                float _545 = 1.0 / _537;
                float _547 = abs(_427);
                float _549 = abs(_431);
                bool _551 = _547 > _549;
                bool _553 = as_type<int>(_431) >= 0;
                float _555 = _543 * _545;
                float _557 = _555 * _555;
                float _559 = _557 + 11.33538818359375;
                float _561 = fma(_557, _559, 28.84246826171875);
                float _563 = fma(_557, _561, 19.6966705322265625);
                float _565 = fma(_557, -0.82336294651031494140625, -5.674867153167724609375);
                float _567 = fma(_557, _565, -6.565555095672607421875);
                float _569 = 1.0 / _563;
                float _571 = _557 * _567;
                float _573 = abs(_427);
                float _575 = abs(_431);
                float _577 = _573 + _575;
                int _579 = as_type<int>(_427) & int(0x80000000);
                float _581 = _555 * _571;
                bool _583 = _577 > as_type<float>(0x7f800000u /* inf */);
                bool _585 = isnan(_577);
                bool _587 = _583 || _585;
                bool _589 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _591 = _587 || _589;
                float _593 = fma(_581, _569, _555);
                float _595 = _593;
                _483 = _577;
                if (_551)
                {
                    float _597 = -_593;
                    float _599 = _597 + 1.57079637050628662109375;
                    _595 = _599;
                }
                float _601 = _595;
                int _603 = as_type<int>(_601);
                if (!_553)
                {
                    float _605 = -_601;
                    float _607 = _605 + 3.1415927410125732421875;
                    _603 = as_type<int>(_607);
                }
                int _609 = _603;
                if (!_591)
                {
                    int _611 = _579 | _609;
                    _483 = as_type<float>(_611);
                }
            }
        }
        float _613 = _483;
        _411 = _613;
    }
    _413 = false;
    float _615 = _411;
    float _617 = in.m_53.x;
    float _619 = gl_FragCoord.w;
    float _621 = _617 * _619;
    float _623 = in.m_53.y;
    float _625 = gl_FragCoord.w;
    float _627 = _623 * _625;
    float _629 = _95 * _621;
    float _631 = _95 * _627;
    float2 _1952 = float2(_629, _631);
    float _633 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_1952, float2(0.0), isnan(_1952))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_1952, float2(0.0), isnan(_1952))).w;
    float _635 = in.m_55.x;
    float _637 = gl_FragCoord.w;
    float _639 = _635 * _637;
    float _641 = fma(_615, 0.15915493667125701904296875, 1.0);
    float _643 = fma(_615, 0.15915493667125701904296875, 0.5);
    float _645 = floor(_641);
    int _647 = as_type<int>(_643);
    int _649 = 0;
    int _651 = 7171;
    int _653;
    int _1974 = _77(_647, _649, _651, _653, gl_SubgroupInvocationID);
    int _655 = _1974;
    float _657 = -_645;
    float _659 = _641 + _657;
    int _661 = as_type<int>(_659);
    int _663 = 0;
    int _665 = 7171;
    int _667;
    int _1982 = _77(_661, _663, _665, _667, gl_SubgroupInvocationID);
    int _669 = _1982;
    float _671 = _95 * _639;
    uint _1999 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _673 = (as_type<float>(_655) * float4(1.0, -1.0, 1.0, 0.0)[_1999]) + (_643 * float4(1.0, 1.0, -1.0, 1.0)[_1999]);
    int _675 = as_type<int>(_673);
    int _677 = 1;
    int _679 = 7171;
    int _681;
    int _2007 = _77(_675, _677, _679, _681, gl_SubgroupInvocationID);
    int _683 = _2007;
    int _685 = as_type<int>(_673);
    int _687 = 2;
    int _689 = 7171;
    int _691;
    int _2010 = _77(_685, _687, _689, _691, gl_SubgroupInvocationID);
    int _693 = _2010;
    uint _2018 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _695 = (as_type<float>(_669) * float4(1.0, -1.0, 1.0, 0.0)[_2018]) + (_659 * float4(1.0, 1.0, -1.0, 1.0)[_2018]);
    int _697 = as_type<int>(_695);
    int _699 = 2;
    int _701 = 7171;
    int _703;
    int _2026 = _77(_697, _699, _701, _703, gl_SubgroupInvocationID);
    int _705 = _2026;
    float _707 = abs(as_type<float>(_683));
    float _709 = abs(as_type<float>(_693));
    float _711 = _707 + _709;
    float _713 = _711 + (-9.9999997473787516355514526367188e-05);
    float _715 = 0.0 + _633;
    float _717 = precise::clamp(_715, 0.0, 1.0);
    float _719 = _717 * _671;
    int _721 = as_type<int>(_695);
    int _723 = 1;
    int _725 = 7171;
    int _727;
    int _2048 = _77(_721, _723, _725, _727, gl_SubgroupInvocationID);
    int _729 = _2048;
    bool _731 = _719 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _733 = isnan(_719);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _739 = _735 || _737;
    if (!_739)
    {
        discard_fragment();
    }
    float _741 = abs(as_type<float>(_729));
    float _743 = abs(as_type<float>(_705));
    float _745 = _741 + _743;
    float _747 = _211 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    bool _749 = _713 >= _745;
    bool _751 = isnan(_713);
    bool _753 = _749 || _751;
    bool _755 = isnan(_745);
    bool _757 = _753 || _755;
    float _759 = _315 * _305;
    float _761 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[1].x, _747);
    float _763 = fma(_359, 0.5, 0.5);
    bool _765 = !_757;
    float _767 = _765 ? _643 : 0.0;
    float _769 = fma(_311, _273, _759);
    float _771 = fma(_219, (*spvDescriptorSet0.fp_c8)._m0[1].z, _761);
    float _773 = fma(_313, _317, _769);
    float _775 = _211 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _777 = _211 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _779 = _771 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _781 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[0].x, _775);
    float _783 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[2].x, _777);
    float _785 = fma(_219, (*spvDescriptorSet0.fp_c8)._m0[0].z, _781);
    float _787 = fma(_219, (*spvDescriptorSet0.fp_c8)._m0[2].z, _783);
    float _789 = _785 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _791 = _787 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _793 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _795 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _797 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _799 = 1.0 / _791;
    float _801 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _793);
    float _803 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _795);
    float _805 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _797);
    float _807 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _805);
    float _809 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _801);
    float _811 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _803);
    float _813 = _807 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _815 = _809 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _817 = _811 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _819 = _813 * _799;
    float _821 = fma(_315, 0.5, 0.5);
    float _823 = -_815;
    float _825 = fma(_789, _819, _823);
    float _827 = _315 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _829 = _315 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _831 = -_817;
    float _833 = fma(_779, _819, _831);
    float _835 = fma(_311, (*spvDescriptorSet0.fp_c8)._m0[0].x, _827);
    float _837 = fma(_311, (*spvDescriptorSet0.fp_c8)._m0[1].x, _829);
    float _839 = fma(_313, (*spvDescriptorSet0.fp_c8)._m0[0].z, _835);
    float _841 = fma(_313, (*spvDescriptorSet0.fp_c8)._m0[1].z, _837);
    float _843 = _839 * 0.0500000007450580596923828125;
    float _845 = _841 * 0.0500000007450580596923828125;
    float _847 = fma(_825, 0.25, _843);
    float _849 = fma(_833, -0.25, _845);
    float _851 = in.m_57.w;
    float _853 = abs(_773);
    float _855 = 0.0 + _853;
    float _857 = precise::clamp(_855, 0.0, 1.0);
    float2 _2300 = float2(_847, _849);
    float3 _861 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2300, float2(0.0), isnan(_2300))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2300, float2(0.0), isnan(_2300))).xyz;
    float _863 = _861.x;
    float _865 = _861.y;
    float _867 = _861.z;
    float _869 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.033333338797092437744140625, _851);
    float _871 = fma(_857, 0.5, _869);
    float2 _2322 = float2(_821, _869);
    float3 _873 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2322, float2(0.0), isnan(_2322))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2322, float2(0.0), isnan(_2322))).xyz;
    float _875 = _873.x;
    float _877 = _873.y;
    float _879 = _873.z;
    float2 _2336 = float2(_821, _871);
    float3 _881 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2336, float2(0.0), isnan(_2336))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2336, float2(0.0), isnan(_2336))).xyz;
    float _883 = _881.x;
    float _885 = _881.y;
    float _887 = _881.z;
    float2 _2350 = float2(_767, _763);
    float3 _889 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2350, float2(0.0), isnan(_2350))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2350, float2(0.0), isnan(_2350))).xyz;
    float _891 = _889.x;
    float _893 = _889.y;
    float _895 = _889.z;
    float _897 = in.m_59.x;
    float _899 = gl_FragCoord.w;
    float _901 = _897 * _899;
    float _903 = in.m_59.y;
    float _905 = gl_FragCoord.w;
    float _907 = _903 * _905;
    float _909 = in.m_59.z;
    float _911 = gl_FragCoord.w;
    float _913 = _909 * _911;
    float _915 = -_857;
    float _917 = _915 + 1.0;
    float _919 = _863 * _863;
    float _921 = _865 * _865;
    float _923 = _867 * _867;
    float _925 = _95 * _913;
    float _927 = _875 * _919;
    float _929 = _877 * _921;
    float _931 = _879 * _923;
    float _933 = _917 * _917;
    float _935 = -_927;
    float _937 = fma(_883, 2.0, _935);
    float _939 = -_929;
    float _941 = fma(_885, 2.0, _939);
    float _943 = -_931;
    float _945 = fma(_887, 2.0, _943);
    float _947 = _95 * _907;
    float _949 = fma(_933, _937, _927);
    float _951 = fma(_933, _941, _929);
    float _953 = fma(_933, _945, _931);
    float _955 = _95 * _901;
    float _957 = _895 * 20.0;
    float _959 = _951 * _947;
    float _961 = _953 * _925;
    float _963 = _949 * _955;
    float _965 = _891 * 20.0;
    float _967 = _893 * 20.0;
    float _969 = fma(_957, _887, _961);
    float _971 = fma(_965, _883, _963);
    float _973 = fma(_967, _885, _959);
    if (!_739)
    {
        out.m_62.x = _971;
        out.m_62.y = _973;
        out.m_62.z = _969;
        out.m_62.w = _633;
        return out;
    }
    float _975 = in.m_64.w;
    float _977 = gl_FragCoord.w;
    float _979 = _975 * _977;
    float _981 = _95 * _979;
    bool _983 = _981 != 1.0;
    bool _985 = isnan(_981);
    bool _987 = _983 || _985;
    bool _989 = isnan(1.0);
    bool _991 = _987 || _989;
    bool _993 = !_991;
    if (!_993)
    {
        float _995 = gl_FragCoord.x;
        float _997 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _999 = _995 / _997;
        float _1001 = gl_FragCoord.y;
        float _1003 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _1005 = _1001 / _1003;
        float _1007 = _981 * 256.0;
        float _1009 = trunc(_1007);
        int _1011 = int(_1009);
        uint _1014 = uint(int(uint(_1011) >> uint(7)));
        int _1016 = int(_1014) + _1011;
        float _1018 = trunc(_999);
        int _1020 = int(_1018);
        float _1022 = trunc(_1005);
        int _1024 = int(_1022);
        int _1026 = _1020 + 2;
        int _1028 = _1026 >> 1;
        uint _1030 = uint(int(uint(_1024) >> uint(1)));
        int _1032 = _1028 ^ int(_1030);
        int _1034 = _1032 << 16;
        int _1036 = _1034 ^ _1028;
        int _1038 = 983055 & _1036;
        int _1040 = _1038 << 6;
        int _1042 = _1040 + _1038;
        int _1044 = _1042 & 13369548;
        uint _1046 = uint(int(uint(_1044) >> uint(3)));
        int _1048 = _1044 | int(_1046);
        int _1050 = _1048 & 5570560;
        int _1052 = _1048 & 85;
        uint _1054 = uint(int(uint(_1050) >> uint(15)));
        int _1056 = int(_1054) + _1052;
        bool _1058 = uint(_1016) > uint(_1056);
        if (!_1058)
        {
            discard_fragment();
        }
        if (!_1058)
        {
            out.m_62.x = _971;
            out.m_62.y = _973;
            out.m_62.z = _969;
            out.m_62.w = _719;
            return out;
        }
    }
    float _1060 = _973 * 0.715200006961822509765625;
    float _1062 = in.m_66.w;
    float _1064 = gl_FragCoord.w;
    float _1066 = _1062 * _1064;
    float _1068 = in.m_66.z;
    float _1070 = gl_FragCoord.w;
    float _1072 = _1068 * _1070;
    float _1074 = in.m_66.x;
    float _1076 = gl_FragCoord.w;
    float _1078 = _1074 * _1076;
    float _1080 = fma(_971, 0.2125999927520751953125, _1060);
    float _1082 = in.m_66.y;
    float _1084 = gl_FragCoord.w;
    float _1086 = _1082 * _1084;
    float _1088 = fma(_969, 0.072200000286102294921875, _1080);
    bool _1090 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1092 = 1.0 / _1088;
    float _1094 = _1092 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = fma(_1096, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1100 = _95 * _1066;
    float _1102 = 0.0 + _719;
    float _1104 = precise::clamp(_1102, 0.0, 1.0);
    float _1106 = _95 * _1072;
    float _1108 = _95 * _1086;
    float _1110 = _1098 * _1100;
    float _1112 = _95 * _1078;
    float _1114 = fma(_969, _1110, _1106);
    float _1116 = fma(_971, _1110, _1112);
    float _1118 = fma(_973, _1110, _1108);
    float _1120 = _1106;
    if (!_1090)
    {
        _1120 = _1104;
    }
    float _1122 = _1120;
    bool _1124 = !_1090;
    float _1126 = _1122;
    if (!_1124)
    {
        float _1128 = in.m_68.w;
        float _1130 = gl_FragCoord.w;
        float _1132 = _1128 * _1130;
        float _1134 = in.m_68.z;
        float _1136 = gl_FragCoord.w;
        float _1138 = _1134 * _1136;
        float _1140 = _95 * _1132;
        float _1142 = _95 * _1138;
        float _1144 = 1.0 / _1140;
        float _1146 = _1142 * _1144;
        float _1148 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _1150 = fma(_1146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1148);
        float _1152 = 1.0 / _1150;
        float _1154 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _1156 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1158 = fma(_1152, _1154, _1156);
        float _1160 = _1158 * 8.0;
        float _1162 = precise::clamp(_1160, 0.0, 1.0);
        float _1164 = _1104 * _1162;
        _1126 = _1164;
    }
    float _1166 = _1126;
    float _1168 = 0.0 + _1166;
    float _1170 = precise::clamp(_1168, 0.0, 1.0);
    out.m_62.x = _1116;
    out.m_62.y = _1118;
    out.m_62.z = _1114;
    out.m_62.w = _1170;
    return out;
}

