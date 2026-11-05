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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
};

static inline __attribute__((always_inline))
int _59(thread const int& _1641, thread const int& _1642, thread const int& _1643, thread int& _1644, thread uint& gl_SubgroupInvocationID)
{
    int _1647 = _1643 & 31;
    uint _1650 = uint(int(uint(_1643) >> uint(8)));
    int _1652 = int(_1650) & 31;
    float _1654 = as_type<float>(gl_SubgroupInvocationID);
    int _1656 = as_type<int>(_1654) & _1652;
    int _1658 = ~_1652;
    int _1660 = _1647 & _1658;
    int _1662 = _1660 | _1656;
    int _1664 = ~_1652;
    int _1666 = _1642 & _1664;
    int _1668 = _1666 | _1656;
    bool _1670 = uint(_1668) <= uint(_1662);
    _1644 = _1670 ? (-1) : 0;
    float _1672 = spvSubgroupShuffle(as_type<float>(_1641), uint(_1668));
    uint _1674 = uint(_1670 ? as_type<int>(_1672) : _1641);
    return int(_1674);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float _83 = _79 * 0.0625;
    float _85 = _81 * 0.0625;
    float _87 = abs(_79);
    float _89 = abs(_81);
    float _91 = precise::max(_87, _89);
    bool _95 = _91 >= 16.0;
    float _97 = _95 ? _85 : _81;
    float _99 = _95 ? _83 : _79;
    float _101 = abs(_97);
    bool _103 = _101 != 0.0;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan(0.0);
    bool _111 = _107 || _109;
    float _113 = abs(_99);
    bool _115 = _113 == 0.0;
    float _117 = abs(_99);
    bool _119 = _117 == 0.0;
    bool _121 = !_111;
    bool _123 = _119 && _121;
    bool _125 = false;
    float _127 = _91;
    if (_123)
    {
        bool _129 = as_type<int>(_99) >= 0;
        _125 = _129;
    }
    bool _131 = _125;
    int _133 = 0;
    int _135 = _131 ? (-1) : 0;
    if (_123)
    {
        int _137 = _131 ? 0 : 1078530011;
        _133 = _137;
    }
    int _139 = _133;
    int _141 = _139;
    if (_123)
    {
        int _143 = int(0x80000000) & as_type<int>(_97);
        int _145 = _139 | _143;
        _127 = as_type<float>(_145);
    }
    float _147 = _127;
    bool _149 = !_111;
    bool _151 = _149 && _115;
    float _153 = _147;
    float _155 = _147;
    if (!_151)
    {
        float _157 = abs(_97);
        bool _159 = _157 != as_type<float>(0x7f800000u /* inf */);
        bool _161 = isnan(_157);
        bool _163 = _159 || _161;
        bool _165 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _167 = _163 || _165;
        float _169 = abs(_99);
        bool _171 = _169 == as_type<float>(0x7f800000u /* inf */);
        float _173 = abs(_99);
        bool _175 = _173 == as_type<float>(0x7f800000u /* inf */);
        bool _177 = !_167;
        bool _179 = _175 && _177;
        if (_179)
        {
            bool _181 = as_type<int>(_99) >= 0;
            _135 = _181 ? (-1) : 0;
        }
        int _183 = _135;
        if (_179)
        {
            _141 = 1075235812;
        }
        int _185 = _141;
        int _187 = _185;
        if (_179)
        {
            int _189 = ~_183;
            int _191 = (_189 != 0) ? _185 : 1061752795;
            _187 = _191;
        }
        int _193 = _187;
        if (_179)
        {
            int _195 = int(0x80000000) & as_type<int>(_97);
            int _197 = _193 | _195;
            _153 = as_type<float>(_197);
        }
        float _199 = _153;
        bool _201 = !_167;
        bool _203 = _201 && _171;
        _155 = _199;
        if (!_203)
        {
            float _205 = abs(_97);
            float _207 = abs(_99);
            float _209 = precise::max(_205, _207);
            float _211 = abs(_97);
            float _213 = abs(_99);
            float _215 = precise::min(_211, _213);
            float _217 = 1.0 / _209;
            float _219 = abs(_97);
            float _221 = abs(_99);
            bool _223 = _219 > _221;
            bool _225 = as_type<int>(_99) >= 0;
            float _227 = abs(_97);
            float _229 = abs(_99);
            float _231 = _227 + _229;
            int _233 = as_type<int>(_97) & int(0x80000000);
            bool _235 = _231 > as_type<float>(0x7f800000u /* inf */);
            bool _237 = isnan(_231);
            bool _239 = _235 || _237;
            bool _241 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _243 = _239 || _241;
            float _245 = _215 * _217;
            float _247 = _245 * _245;
            float _249 = _247 + 11.33538818359375;
            float _251 = fma(_247, _249, 28.84246826171875);
            float _253 = fma(_247, _251, 19.6966705322265625);
            float _255 = fma(_247, -0.82336294651031494140625, -5.674867153167724609375);
            float _257 = fma(_247, _255, -6.565555095672607421875);
            float _259 = 1.0 / _253;
            float _261 = _247 * _257;
            float _263 = _245 * _261;
            float _265 = fma(_263, _259, _245);
            float _267 = _265;
            _155 = _231;
            if (_223)
            {
                float _269 = -_265;
                float _271 = _269 + 1.57079637050628662109375;
                _267 = _271;
            }
            float _273 = _267;
            int _275 = as_type<int>(_273);
            if (!_225)
            {
                float _277 = -_273;
                float _279 = _277 + 3.1415927410125732421875;
                _275 = as_type<int>(_279);
            }
            int _281 = _275;
            if (!_243)
            {
                int _283 = _233 | _281;
                _155 = as_type<float>(_283);
            }
        }
    }
    float _285 = _155;
    float _287 = _285 * 0.3183098733425140380859375;
    float _289 = in.m_41.w;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_41.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = _81 * _81;
    float _303 = _287 + 0.5;
    int _305 = as_type<int>(_287);
    int _307 = 0;
    int _309 = 7171;
    int _311;
    int _1061 = _59(_305, _307, _309, _311, gl_SubgroupInvocationID);
    int _313 = _1061;
    float _315 = fma(_79, _79, _301);
    float _317 = floor(_303);
    float _319 = sqrt(_315);
    float _321 = -_317;
    float _323 = _303 + _321;
    int _325 = as_type<int>(_323);
    int _327 = 0;
    int _329 = 7171;
    int _331;
    int _1077 = _59(_325, _327, _329, _331, gl_SubgroupInvocationID);
    int _333 = _1077;
    uint _1091 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _335 = (as_type<float>(_313) * float4(1.0, -1.0, 1.0, 0.0)[_1091]) + (_287 * float4(1.0, 1.0, -1.0, 1.0)[_1091]);
    float _337 = _77 * _293;
    int _339 = as_type<int>(_335);
    int _341 = 1;
    int _343 = 7171;
    int _345;
    int _1102 = _59(_339, _341, _343, _345, gl_SubgroupInvocationID);
    int _347 = _1102;
    int _349 = as_type<int>(_335);
    int _351 = 2;
    int _353 = 7171;
    int _355;
    int _1106 = _59(_349, _351, _353, _355, gl_SubgroupInvocationID);
    int _357 = _1106;
    float _359 = 1.0 / _337;
    uint _1116 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _361 = (as_type<float>(_333) * float4(1.0, -1.0, 1.0, 0.0)[_1116]) + (_323 * float4(1.0, 1.0, -1.0, 1.0)[_1116]);
    float _363 = in.m_41.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    int _369 = as_type<int>(_361);
    int _371 = 1;
    int _373 = 7171;
    int _375;
    int _1131 = _59(_369, _371, _373, _375, gl_SubgroupInvocationID);
    int _377 = _1131;
    float _379 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    int _381 = as_type<int>(_361);
    int _383 = 2;
    int _385 = 7171;
    int _387;
    int _1139 = _59(_381, _383, _385, _387, gl_SubgroupInvocationID);
    int _389 = _1139;
    float _391 = abs(as_type<float>(_347));
    float _393 = abs(as_type<float>(_357));
    float _395 = _391 + _393;
    float _397 = _379 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _399 = _395 + (-9.9999997473787516355514526367188e-05);
    float _401 = _77 * _299;
    float _403 = _401 * _359;
    float _405 = abs(as_type<float>(_377));
    float _407 = abs(as_type<float>(_389));
    float _409 = _405 + _407;
    float _411 = fma(_319, (*spvDescriptorSet0.fp_c9)._m0[194].z, _397);
    bool _413 = _399 >= _409;
    bool _415 = isnan(_399);
    bool _417 = _413 || _415;
    bool _419 = isnan(_409);
    bool _421 = _417 || _419;
    float _423 = _77 * _367;
    bool _425 = !_421;
    float _427 = _425 ? _287 : 0.0;
    float _429 = _423 * _359;
    float2 _1206;
    _1206.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_427, _411));
    _1206.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_427, _411));
    float _431 = _1206.x;
    float _433 = _431 * 256.0;
    int _435 = int(_433);
    float2 _1216 = float2(_429, _403);
    float _437 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1216, float2(0.0), isnan(_1216))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1216, float2(0.0), isnan(_1216))).x;
    float2 _1226 = float2(_427, _411);
    float4 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1226, float2(0.0), isnan(_1226))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1226, float2(0.0), isnan(_1226))).xyzw;
    float _442 = _440.x;
    float _444 = _440.y;
    float _446 = _440.z;
    float _448 = _440.w;
    float _450 = float(uint(_435));
    float _452 = _450 * 0.00390625;
    float _454 = precise::min(_452, 2.0);
    float2 _1251 = float2(_427, _411);
    float4 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1251, float2(0.0), isnan(_1251)), level(_454)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1251, float2(0.0), isnan(_1251)), level(_454)).xyzw;
    float _458 = _456.x;
    float _460 = _456.y;
    float _462 = _456.z;
    float _464 = _456.w;
    float _466 = in.m_41.z;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_43.w;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = _319 * 2.0;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = in.m_45.x;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _490 = fma(_437, (*spvDescriptorSet0.fp_c8)._m0[30].w, _488);
    float _492 = -_480;
    float _494 = _492 + 1.0;
    float _496 = _494 * _494;
    float _498 = 1.0 / _490;
    float _500 = _77 * _470;
    float _502 = in.m_47.w;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = _500 * _359;
    float _510 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _512 = fma(_508, (*spvDescriptorSet0.fp_c8)._m0[30].w, _510);
    float _514 = 1.0 / _512;
    float _516 = _496 * _496;
    float _518 = _77 * _476;
    float _520 = in.m_47.z;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = in.m_43.z;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = fma(_448, 0.5, _464);
    float _534 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _536 = _514 * _534;
    float _538 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _540 = _516 + _532;
    float _542 = _516 * _540;
    float _544 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _546 = -_536;
    float _548 = fma(_498, _544, _546);
    float _550 = _518 * _542;
    float _552 = _77 * _506;
    float _554 = _552 * _550;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    float _558 = _548 * _538;
    float _560 = precise::clamp(_558, 0.0, 1.0);
    float _562 = _77 * _486;
    float _564 = _556 * _560;
    float _566 = _564 * _562;
    bool _568 = _566 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _570 = isnan(_566);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _576 = _572 || _574;
    float _578 = in.m_47.x;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = in.m_47.y;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = in.m_43.x;
    float _592 = gl_FragCoord.w;
    float _594 = _590 * _592;
    float _596 = in.m_43.y;
    float _598 = gl_FragCoord.w;
    float _600 = _596 * _598;
    float _602 = _536;
    if (!_576)
    {
        discard_fragment();
    }
    float _604 = _442 * _442;
    float _606 = _604 * 0.5;
    float _608 = _444 * _444;
    float _610 = _608 * 0.5;
    float _612 = _446 * _446;
    float _614 = _612 * 0.5;
    float _616 = _77 * _530;
    float _618 = fma(_458, _458, _606);
    float _620 = fma(_460, _460, _610);
    float _622 = fma(_462, _462, _614);
    float _624 = _77 * _524;
    float _626 = -_618;
    float _628 = _626 + 1.0;
    float _630 = -_620;
    float _632 = _630 + 1.0;
    float _634 = -_622;
    float _636 = _634 + 1.0;
    float _638 = _624 * _636;
    float _640 = _77 * _582;
    float _642 = _77 * _588;
    float _644 = _77 * _594;
    float _646 = _77 * _600;
    float _648 = _640 * _628;
    float _650 = _642 * _632;
    float _652 = fma(_622, _616, _638);
    float _654 = fma(_618, _644, _648);
    float _656 = fma(_620, _646, _650);
    float _658 = fma(_516, _516, _654);
    float _660 = fma(_516, _516, _656);
    float _662 = fma(_516, _516, _652);
    float _664 = _656;
    if (!_576)
    {
        out.m_50.x = _658;
        out.m_50.y = _660;
        out.m_50.z = _662;
        out.m_50.w = _556;
        return out;
    }
    float _666 = _660 * 0.715200006961822509765625;
    float _668 = fma(_658, 0.2125999927520751953125, _666);
    float _670 = fma(_662, 0.072200000286102294921875, _668);
    bool _672 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _674 = 1.0 / _670;
    float _676 = 0.0 + _566;
    float _678 = precise::clamp(_676, 0.0, 1.0);
    float _680 = _678;
    if (_672)
    {
        float _682 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _684 = _536 + _682;
        _602 = _684;
    }
    float _686 = _602;
    float _688 = _674 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _690 = precise::clamp(_688, 0.0, 1.0);
    if (_672)
    {
        float _692 = _686 * 8.0;
        float _694 = precise::clamp(_692, 0.0, 1.0);
        _664 = _694;
    }
    float _696 = _664;
    float _698 = fma(_690, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_672)
    {
        float _700 = _678 * _696;
        _680 = _700;
    }
    float _702 = _680;
    float _704 = _658 * _698;
    float _706 = _660 * _698;
    float _708 = _662 * _698;
    float _710 = 0.0 + _702;
    float _712 = precise::clamp(_710, 0.0, 1.0);
    out.m_50.x = _704;
    out.m_50.y = _706;
    out.m_50.z = _708;
    out.m_50.w = _712;
    return out;
}

