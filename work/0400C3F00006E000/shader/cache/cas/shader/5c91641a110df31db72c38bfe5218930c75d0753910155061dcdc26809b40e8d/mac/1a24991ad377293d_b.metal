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
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_41 [[user(locn5), flat]];
    float4 m_43 [[user(locn6), flat]];
    float4 m_54 [[user(locn8)]];
};

static inline __attribute__((always_inline))
int _63(thread const int& _1791, thread const int& _1792, thread const int& _1793, thread int& _1794, thread uint& gl_SubgroupInvocationID)
{
    int _1797 = _1793 & 31;
    uint _1800 = uint(int(uint(_1793) >> uint(8)));
    int _1802 = int(_1800) & 31;
    float _1804 = as_type<float>(gl_SubgroupInvocationID);
    int _1806 = as_type<int>(_1804) & _1802;
    int _1808 = ~_1802;
    int _1810 = _1797 & _1808;
    int _1812 = _1810 | _1806;
    int _1814 = ~_1802;
    int _1816 = _1792 & _1814;
    int _1818 = _1816 | _1806;
    bool _1820 = uint(_1818) <= uint(_1812);
    _1794 = _1820 ? (-1) : 0;
    float _1822 = spvSubgroupShuffle(as_type<float>(_1791), uint(_1818));
    uint _1824 = uint(_1820 ? as_type<int>(_1822) : _1791);
    return int(_1824);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_37.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float _87 = fma(_83, 2.0, -1.0);
    float _89 = fma(_85, 2.0, -1.0);
    float _91 = _89 * _89;
    float _93 = abs(_87);
    float _95 = abs(_89);
    float _97 = precise::max(_93, _95);
    bool _101 = _97 >= 16.0;
    float _103 = fma(_87, _87, _91);
    float _105 = _89;
    float _107 = _87;
    int _109 = 1073741824;
    float _111 = _91;
    if (_101)
    {
        float _113 = _89 * 0.0625;
        _105 = _113;
    }
    float _115 = _105;
    if (_101)
    {
        float _117 = _87 * 0.0625;
        _107 = _117;
    }
    float _119 = _107;
    float _121 = abs(_115);
    bool _123 = _121 != 0.0;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan(0.0);
    bool _131 = _127 || _129;
    float _133 = abs(_119);
    bool _135 = _133 == 0.0;
    float _137 = abs(_119);
    bool _139 = _137 == 0.0;
    bool _141 = !_131;
    bool _143 = _139 && _141;
    bool _145 = false;
    if (_143)
    {
        bool _147 = as_type<int>(_119) >= 0;
        _145 = _147;
    }
    bool _149 = _145;
    int _151 = _149 ? (-1) : 0;
    if (_143)
    {
        int _153 = _149 ? 0 : 1078530011;
        _109 = _153;
    }
    int _155 = _109;
    int _157 = _155;
    if (_143)
    {
        int _159 = int(0x80000000) & as_type<int>(_115);
        int _161 = _155 | _159;
        _111 = as_type<float>(_161);
    }
    float _163 = _111;
    bool _165 = !_131;
    bool _167 = _165 && _135;
    float _169 = _163;
    float _171 = _163;
    if (!_167)
    {
        float _173 = abs(_115);
        bool _175 = _173 != as_type<float>(0x7f800000u /* inf */);
        bool _177 = isnan(_173);
        bool _179 = _175 || _177;
        bool _181 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _183 = _179 || _181;
        float _185 = abs(_119);
        bool _187 = _185 == as_type<float>(0x7f800000u /* inf */);
        float _189 = abs(_119);
        bool _191 = _189 == as_type<float>(0x7f800000u /* inf */);
        bool _193 = !_183;
        bool _195 = _191 && _193;
        if (_195)
        {
            bool _197 = as_type<int>(_119) >= 0;
            _151 = _197 ? (-1) : 0;
        }
        int _199 = _151;
        if (_195)
        {
            _157 = 1075235812;
        }
        int _201 = _157;
        int _203 = _201;
        if (_195)
        {
            int _205 = ~_199;
            int _207 = (_205 != 0) ? _201 : 1061752795;
            _203 = _207;
        }
        int _209 = _203;
        if (_195)
        {
            int _211 = int(0x80000000) & as_type<int>(_115);
            int _213 = _209 | _211;
            _169 = as_type<float>(_213);
        }
        float _215 = _169;
        bool _217 = !_183;
        bool _219 = _217 && _187;
        _171 = _215;
        if (!_219)
        {
            float _221 = abs(_119);
            float _223 = abs(_115);
            float _225 = precise::max(_221, _223);
            float _227 = abs(_119);
            float _229 = abs(_115);
            float _231 = precise::min(_227, _229);
            float _233 = 1.0 / _225;
            float _235 = abs(_115);
            float _237 = abs(_119);
            bool _239 = _235 > _237;
            bool _241 = as_type<int>(_119) >= 0;
            float _243 = _231 * _233;
            float _245 = _243 * _243;
            float _247 = _245 + 11.33538818359375;
            float _249 = fma(_245, _247, 28.84246826171875);
            float _251 = fma(_245, _249, 19.6966705322265625);
            float _253 = fma(_245, -0.82336294651031494140625, -5.674867153167724609375);
            float _255 = fma(_245, _253, -6.565555095672607421875);
            float _257 = 1.0 / _251;
            float _259 = _245 * _255;
            float _261 = abs(_119);
            float _263 = abs(_115);
            float _265 = _261 + _263;
            int _267 = as_type<int>(_115) & int(0x80000000);
            float _269 = _243 * _259;
            bool _271 = _265 > as_type<float>(0x7f800000u /* inf */);
            bool _273 = isnan(_265);
            bool _275 = _271 || _273;
            bool _277 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _279 = _275 || _277;
            float _281 = fma(_269, _257, _243);
            float _283 = _281;
            _171 = _265;
            if (_239)
            {
                float _285 = -_281;
                float _287 = _285 + 1.57079637050628662109375;
                _283 = _287;
            }
            float _289 = _283;
            int _291 = as_type<int>(_289);
            if (!_241)
            {
                float _293 = -_289;
                float _295 = _293 + 3.1415927410125732421875;
                _291 = as_type<int>(_295);
            }
            int _297 = _291;
            if (!_279)
            {
                int _299 = _267 | _297;
                _171 = as_type<float>(_299);
            }
        }
    }
    float _301 = _171;
    float _303 = fma(_301, 0.159154951572418212890625, 1.0);
    float _305 = fma(_301, 0.159154951572418212890625, 0.5);
    float _307 = in.m_39.w;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_41.y;
    float _315 = floor(_303);
    float _317 = in.m_39.x;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    int _323 = as_type<int>(_305);
    int _325 = 0;
    int _327 = 7171;
    int _329;
    int _1153 = _63(_323, _325, _327, _329, gl_SubgroupInvocationID);
    int _331 = _1153;
    float _333 = in.m_37.x;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_39.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_37.y;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = sqrt(_103);
    float _353 = -_315;
    float _355 = _303 + _353;
    int _357 = as_type<int>(_355);
    int _359 = 0;
    int _361 = 7171;
    int _363;
    int _1184 = _63(_357, _359, _361, _363, gl_SubgroupInvocationID);
    int _365 = _1184;
    uint _1197 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _367 = (as_type<float>(_331) * float4(1.0, -1.0, 1.0, 0.0)[_1197]) + (_305 * float4(1.0, 1.0, -1.0, 1.0)[_1197]);
    float _369 = in.m_41.x;
    int _371 = as_type<int>(_367);
    int _373 = 1;
    int _375 = 7171;
    int _377;
    int _1207 = _63(_371, _373, _375, _377, gl_SubgroupInvocationID);
    int _379 = _1207;
    float _381 = fma(_351, (*spvDescriptorSet0.fp_c9)._m0[191].x, _313);
    int _383 = as_type<int>(_367);
    int _385 = 2;
    int _387 = 7171;
    int _389;
    int _1217 = _63(_383, _385, _387, _389, gl_SubgroupInvocationID);
    int _391 = _1217;
    float _393 = _81 * _343;
    float _395 = _81 * _311;
    uint _1231 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _397 = (as_type<float>(_365) * float4(1.0, -1.0, 1.0, 0.0)[_1231]) + (_355 * float4(1.0, 1.0, -1.0, 1.0)[_1231]);
    float _399 = 1.0 / _395;
    int _401 = as_type<int>(_397);
    int _403 = 1;
    int _405 = 7171;
    int _407;
    int _1241 = _63(_401, _403, _405, _407, gl_SubgroupInvocationID);
    int _409 = _1241;
    int _411 = as_type<int>(_397);
    int _413 = 2;
    int _415 = 7171;
    int _417;
    int _1244 = _63(_411, _413, _415, _417, gl_SubgroupInvocationID);
    int _419 = _1244;
    float _421 = abs(as_type<float>(_379));
    float _423 = abs(as_type<float>(_391));
    float _425 = _421 + _423;
    float _427 = _81 * _337;
    float _429 = _425 + (-9.9999997473787516355514526367188e-05);
    float _431 = _81 * _349;
    float _433 = _393 * _399;
    float _435 = abs(as_type<float>(_409));
    float _437 = abs(as_type<float>(_419));
    float _439 = _435 + _437;
    bool _441 = _429 >= _439;
    bool _443 = isnan(_429);
    bool _445 = _441 || _443;
    bool _447 = isnan(_439);
    bool _449 = _445 || _447;
    bool _451 = !_449;
    float _453 = _451 ? _305 : 0.0;
    float _455 = fma(_453, (*spvDescriptorSet0.fp_c9)._m0[191].y, _369);
    float _457 = _81 * _321;
    float _459 = _457 * _399;
    float2 _1308 = float2(_455, _381);
    float4 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1308, float2(0.0), isnan(_1308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1308, float2(0.0), isnan(_1308))).xyzw;
    float _464 = _462.x;
    float _466 = _462.y;
    float _468 = _462.z;
    float _470 = _462.w;
    float2 _1326 = float2(_427, _431);
    float4 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1326, float2(0.0), isnan(_1326))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1326, float2(0.0), isnan(_1326))).xyzw;
    float _474 = _472.x;
    float _476 = _472.y;
    float _478 = _472.z;
    float _480 = _472.w;
    float2 _1342 = float2(_459, _433);
    float _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1342, float2(0.0), isnan(_1342))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1342, float2(0.0), isnan(_1342))).x;
    float _484 = in.m_43.y;
    float _486 = in.m_39.z;
    float _488 = gl_FragCoord.w;
    float _490 = _486 * _488;
    float _492 = in.m_43.x;
    float _494 = in.m_43.z;
    float _496 = in.m_45.w;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = 1.0 / _484;
    float _504 = _81 * _490;
    float _506 = _504 * _399;
    float _508 = -_492;
    float _510 = spvFAdd(_508, 1.0);
    float _512 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _514 = fma(_506, (*spvDescriptorSet0.fp_c8)._m0[30].w, _512);
    float _516 = 1.0 / _510;
    float _518 = 1.0 / _514;
    float _520 = in.m_47.y;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = in.m_45.z;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = _470 * _502;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = precise::max(_480, _492);
    float _538 = in.m_47.w;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = fma(_534, -2.0, 3.0);
    float _546 = _534 * _534;
    float _548 = in.m_49.x;
    float _550 = gl_FragCoord.w;
    float _552 = _548 * _550;
    float _554 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _556 = fma(_482, (*spvDescriptorSet0.fp_c8)._m0[30].w, _554);
    float _558 = precise::min(_536, 1.0);
    float _560 = _544 * _546;
    float _562 = -_494;
    float _564 = _562 + 1.0;
    float _566 = 1.0 / _556;
    float _568 = fma(_560, _564, _494);
    float _570 = -_492;
    float _572 = _570 + _558;
    float _574 = -_568;
    float _576 = fma(_568, _568, _574);
    float _578 = _572 * _516;
    float _580 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _582 = fma(_576, (*spvDescriptorSet0.fp_c9)._m0[191].z, _568);
    float _584 = _81 * _500;
    float _586 = -_584;
    float _588 = fma(_578, _582, _586);
    float _590 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _592 = _518 * _590;
    float _594 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _596 = -_592;
    float _598 = fma(_566, _594, _596);
    float _600 = _81 * _542;
    float _602 = _598 * _580;
    float _604 = precise::clamp(_602, 0.0, 1.0);
    float _606 = _600 * _588;
    float _608 = _81 * _552;
    float _610 = 0.0 + _606;
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = _612 * _604;
    float _616 = _614 * _608;
    bool _618 = _616 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _620 = isnan(_616);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _626 = _622 || _624;
    float _628 = in.m_47.x;
    float _630 = gl_FragCoord.w;
    float _632 = _628 * _630;
    float _634 = in.m_47.z;
    float _636 = gl_FragCoord.w;
    float _638 = _634 * _636;
    float _640 = in.m_45.x;
    float _642 = gl_FragCoord.w;
    float _644 = _640 * _642;
    float _646 = in.m_45.y;
    float _648 = gl_FragCoord.w;
    float _650 = _646 * _648;
    if (!_626)
    {
        discard_fragment();
    }
    float _652 = fma(_476, _476, _466);
    float _654 = precise::clamp(_652, 0.0, 1.0);
    float _656 = fma(_474, _474, _464);
    float _658 = precise::clamp(_656, 0.0, 1.0);
    float _660 = fma(_478, _478, _468);
    float _662 = precise::clamp(_660, 0.0, 1.0);
    float _664 = -_654;
    float _666 = _664 + 1.0;
    float _668 = -_658;
    float _670 = _668 + 1.0;
    float _672 = _81 * _632;
    float _674 = _81 * _524;
    float _676 = _81 * _638;
    float _678 = -_662;
    float _680 = _678 + 1.0;
    float _682 = _672 * _670;
    float _684 = _674 * _666;
    float _686 = _81 * _644;
    float _688 = _676 * _680;
    float _690 = _81 * _650;
    float _692 = _81 * _530;
    float _694 = fma(_658, _686, _682);
    float _696 = fma(_654, _690, _684);
    float _698 = fma(_662, _692, _688);
    if (!_626)
    {
        out.m_52.x = _694;
        out.m_52.y = _696;
        out.m_52.z = _698;
        out.m_52.w = _606;
        return out;
    }
    float _700 = _696 * 0.715200006961822509765625;
    float _702 = in.m_54.w;
    float _704 = gl_FragCoord.w;
    float _706 = _702 * _704;
    float _708 = in.m_54.x;
    float _710 = gl_FragCoord.w;
    float _712 = _708 * _710;
    float _714 = in.m_54.y;
    float _716 = gl_FragCoord.w;
    float _718 = _714 * _716;
    float _720 = fma(_694, 0.2125999927520751953125, _700);
    float _722 = in.m_54.z;
    float _724 = gl_FragCoord.w;
    float _726 = _722 * _724;
    float _728 = fma(_698, 0.072200000286102294921875, _720);
    bool _730 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _732 = 1.0 / _728;
    float _734 = _732 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = fma(_736, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _740 = _81 * _706;
    float _742 = _706;
    float _744 = _740;
    if (_730)
    {
        float _746 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _748 = _592 + _746;
        _742 = _748;
    }
    float _750 = _742;
    float _752 = _81 * _712;
    float _754 = _738 * _740;
    float _756 = 0.0 + _616;
    float _758 = precise::clamp(_756, 0.0, 1.0);
    float _760 = _758;
    if (_730)
    {
        float _762 = _750 * 8.0;
        float _764 = precise::clamp(_762, 0.0, 1.0);
        _744 = _764;
    }
    float _766 = _744;
    float _768 = _81 * _718;
    float _770 = _81 * _726;
    float _772 = fma(_694, _754, _752);
    if (_730)
    {
        float _774 = _758 * _766;
        _760 = _774;
    }
    float _776 = _760;
    float _778 = fma(_696, _754, _768);
    float _780 = fma(_698, _754, _770);
    float _782 = 0.0 + _776;
    float _784 = precise::clamp(_782, 0.0, 1.0);
    out.m_52.x = _772;
    out.m_52.y = _778;
    out.m_52.z = _780;
    out.m_52.w = _784;
    return out;
}

