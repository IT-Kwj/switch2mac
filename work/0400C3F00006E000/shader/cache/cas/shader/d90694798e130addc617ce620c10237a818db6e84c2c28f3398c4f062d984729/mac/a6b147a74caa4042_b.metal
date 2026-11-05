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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn6)]];
};

static inline __attribute__((always_inline))
int _59(thread const int& _1664, thread const int& _1665, thread const int& _1666, thread int& _1667, thread uint& gl_SubgroupInvocationID)
{
    int _1670 = _1666 & 31;
    uint _1673 = uint(int(uint(_1666) >> uint(8)));
    int _1675 = int(_1673) & 31;
    float _1677 = as_type<float>(gl_SubgroupInvocationID);
    int _1679 = as_type<int>(_1677) & _1675;
    int _1681 = ~_1675;
    int _1683 = _1670 & _1681;
    int _1685 = _1683 | _1679;
    int _1687 = ~_1675;
    int _1689 = _1665 & _1687;
    int _1691 = _1689 | _1679;
    bool _1693 = uint(_1691) <= uint(_1685);
    _1667 = _1693 ? (-1) : 0;
    float _1695 = spvSubgroupShuffle(as_type<float>(_1664), uint(_1691));
    uint _1697 = uint(_1693 ? as_type<int>(_1695) : _1664);
    return int(_1697);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _85 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _83);
    float _87 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _85);
    float _89 = _87 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _91 = 1.0 / _63;
    float _93 = _91 * _69;
    float _95 = _91 * _75;
    float _97 = _91 * _81;
    float _99 = _93 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _101 = fma(_95, (*spvDescriptorSet0.fp_c8)._m0[2].x, _99);
    float _103 = fma(_97, (*spvDescriptorSet0.fp_c8)._m0[2].z, _101);
    float _105 = _103 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _107 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _109 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _111 = 1.0 / _105;
    float _113 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _107);
    float _115 = _93 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _117 = _93 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _119 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _109);
    float _121 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _113);
    float _123 = fma(_95, (*spvDescriptorSet0.fp_c8)._m0[0].x, _115);
    float _125 = fma(_95, (*spvDescriptorSet0.fp_c8)._m0[1].x, _117);
    float _127 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _119);
    float _129 = _121 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _131 = fma(_97, (*spvDescriptorSet0.fp_c8)._m0[0].z, _123);
    float _133 = fma(_97, (*spvDescriptorSet0.fp_c8)._m0[1].z, _125);
    float _135 = _127 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _137 = _131 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _139 = _133 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _141 = _89 * _111;
    float _143 = -_129;
    float _145 = fma(_137, _141, _143);
    float _147 = -_135;
    float _149 = fma(_139, _141, _147);
    float _151 = _145 * 0.0625;
    float _153 = _149 * 0.0625;
    float _155 = abs(_145);
    float _157 = abs(_149);
    float _159 = precise::max(_155, _157);
    bool _163 = _159 >= 16.0;
    float _165 = _163 ? _153 : _149;
    float _167 = _163 ? _151 : _145;
    float _169 = abs(_165);
    bool _171 = _169 != 0.0;
    bool _173 = isnan(_169);
    bool _175 = _171 || _173;
    bool _177 = isnan(0.0);
    bool _179 = _175 || _177;
    float _181 = abs(_167);
    bool _183 = _181 == 0.0;
    float _185 = abs(_167);
    bool _187 = _185 == 0.0;
    bool _189 = !_179;
    bool _191 = _187 && _189;
    bool _193 = false;
    int _195 = as_type<int>(_153);
    if (_191)
    {
        bool _197 = as_type<int>(_167) >= 0;
        _193 = _197;
    }
    bool _199 = _193;
    int _201 = _199 ? (-1) : 0;
    if (_191)
    {
        int _203 = _199 ? 0 : 1078530011;
        _195 = _203;
    }
    int _205 = _195;
    int _207 = _205;
    if (_191)
    {
        int _209 = int(0x80000000) & as_type<int>(_165);
        int _211 = _205 | _209;
        _207 = _211;
    }
    int _213 = _207;
    bool _215 = !_179;
    bool _217 = _215 && _183;
    int _219 = _213;
    float _221 = as_type<float>(_213);
    if (!_217)
    {
        float _223 = abs(_165);
        bool _225 = _223 != as_type<float>(0x7f800000u /* inf */);
        bool _227 = isnan(_223);
        bool _229 = _225 || _227;
        bool _231 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _233 = _229 || _231;
        float _235 = abs(_167);
        bool _237 = _235 == as_type<float>(0x7f800000u /* inf */);
        float _239 = abs(_167);
        bool _241 = _239 == as_type<float>(0x7f800000u /* inf */);
        bool _243 = !_233;
        bool _245 = _241 && _243;
        if (_245)
        {
            bool _247 = as_type<int>(_167) >= 0;
            _201 = _247 ? (-1) : 0;
        }
        int _249 = _201;
        if (_245)
        {
            _219 = 1075235812;
        }
        int _251 = _219;
        int _253 = _251;
        if (_245)
        {
            int _255 = ~_249;
            int _257 = (_255 != 0) ? _251 : 1061752795;
            _253 = _257;
        }
        int _259 = _253;
        float _261 = as_type<float>(_259);
        if (_245)
        {
            int _263 = int(0x80000000) & as_type<int>(_165);
            int _265 = _259 | _263;
            _261 = as_type<float>(_265);
        }
        float _267 = _261;
        bool _269 = !_233;
        bool _271 = _269 && _237;
        _221 = _267;
        if (!_271)
        {
            float _273 = abs(_165);
            float _275 = abs(_167);
            float _277 = precise::max(_273, _275);
            float _279 = abs(_165);
            float _281 = abs(_167);
            float _283 = precise::min(_279, _281);
            float _285 = 1.0 / _277;
            float _287 = abs(_165);
            float _289 = abs(_167);
            bool _291 = _287 > _289;
            bool _293 = as_type<int>(_167) >= 0;
            float _295 = _283 * _285;
            float _297 = abs(_165);
            float _299 = abs(_167);
            float _301 = _297 + _299;
            int _303 = as_type<int>(_165) & int(0x80000000);
            float _305 = _295 * _295;
            bool _307 = _301 > as_type<float>(0x7f800000u /* inf */);
            bool _309 = isnan(_301);
            bool _311 = _307 || _309;
            bool _313 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _315 = _311 || _313;
            float _317 = _305 + 11.33538818359375;
            float _319 = fma(_305, _317, 28.84246826171875);
            float _321 = fma(_305, _319, 19.6966705322265625);
            float _323 = fma(_305, -0.82336294651031494140625, -5.674867153167724609375);
            float _325 = fma(_305, _323, -6.565555095672607421875);
            float _327 = 1.0 / _321;
            float _329 = _305 * _325;
            float _331 = _295 * _329;
            float _333 = fma(_331, _327, _295);
            float _335 = _333;
            _221 = _301;
            if (_291)
            {
                float _337 = -_333;
                float _339 = _337 + 1.57079637050628662109375;
                _335 = _339;
            }
            float _341 = _335;
            int _343 = as_type<int>(_341);
            if (!_293)
            {
                float _345 = -_341;
                float _347 = _345 + 3.1415927410125732421875;
                _343 = as_type<int>(_347);
            }
            int _349 = _343;
            if (!_315)
            {
                int _351 = _303 | _349;
                _221 = as_type<float>(_351);
            }
        }
    }
    float _353 = _221;
    float _355 = _353 * 0.31830990314483642578125;
    float _357 = in.m_39.x;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = _355 + 0.5;
    int _365 = as_type<int>(_355);
    int _367 = 0;
    int _369 = 7171;
    int _371;
    int _1191 = _59(_365, _367, _369, _371, gl_SubgroupInvocationID);
    int _373 = _1191;
    float _375 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _377 = floor(_363);
    float _379 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _375);
    float _381 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _379);
    float _383 = rsqrt(_381);
    float _385 = -_377;
    float _387 = _363 + _385;
    int _389 = as_type<int>(_387);
    int _391 = 0;
    int _393 = 7171;
    int _395;
    int _1223 = _59(_389, _391, _393, _395, gl_SubgroupInvocationID);
    int _397 = _1223;
    uint _1237 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _399 = (as_type<float>(_373) * float4(1.0, -1.0, 1.0, 0.0)[_1237]) + (_355 * float4(1.0, 1.0, -1.0, 1.0)[_1237]);
    int _401 = as_type<int>(_399);
    int _403 = 1;
    int _405 = 7171;
    int _407;
    int _1245 = _59(_401, _403, _405, _407, gl_SubgroupInvocationID);
    int _409 = _1245;
    float _411 = _149 * _383;
    float _413 = _145 * _383;
    int _415 = as_type<int>(_399);
    int _417 = 2;
    int _419 = 7171;
    int _421;
    int _1254 = _59(_415, _417, _419, _421, gl_SubgroupInvocationID);
    int _423 = _1254;
    float _425 = _411 * _411;
    float _427 = fma(_413, _413, _425);
    float _429 = sqrt(_427);
    uint _1271 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _431 = (as_type<float>(_397) * float4(1.0, -1.0, 1.0, 0.0)[_1271]) + (_387 * float4(1.0, 1.0, -1.0, 1.0)[_1271]);
    float _433 = in.m_39.y;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    int _439 = as_type<int>(_431);
    int _441 = 1;
    int _443 = 7171;
    int _445;
    int _1286 = _59(_439, _441, _443, _445, gl_SubgroupInvocationID);
    int _447 = _1286;
    int _449 = as_type<int>(_431);
    int _451 = 2;
    int _453 = 7171;
    int _455;
    int _1289 = _59(_449, _451, _453, _455, gl_SubgroupInvocationID);
    int _457 = _1289;
    float _459 = abs(as_type<float>(_409));
    float _461 = abs(as_type<float>(_423));
    float _463 = _459 + _461;
    float _465 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.0166666693985462188720703125, _429);
    float _467 = _463 + (-9.9999997473787516355514526367188e-05);
    float _469 = _465 * 0.0625;
    float _471 = abs(as_type<float>(_447));
    float _473 = abs(as_type<float>(_457));
    float _475 = _471 + _473;
    bool _477 = _467 >= _475;
    bool _479 = isnan(_467);
    bool _481 = _477 || _479;
    bool _483 = isnan(_475);
    bool _485 = _481 || _483;
    float _487 = _91 * _361;
    float _489 = _91 * _437;
    bool _491 = !_485;
    float _493 = _491 ? _355 : 0.0;
    float2 _1346 = float2(_487, _489);
    float4 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1346, float2(0.0), isnan(_1346))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1346, float2(0.0), isnan(_1346))).xyzw;
    float _498 = _496.x;
    float _500 = _496.y;
    float _502 = _496.z;
    float _504 = _496.w;
    float2 _1364 = float2(_493, _469);
    float _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1364, float2(0.0), isnan(_1364))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1364, float2(0.0), isnan(_1364))).w;
    float _508 = in.m_41.w;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = in.m_43.w;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = in.m_45.x;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = _91 * _512;
    float _528 = _91 * _518;
    float _530 = _91 * _524;
    float _532 = in.m_41.y;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = in.m_41.x;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = in.m_41.z;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = _504 * _506;
    float _552 = _526 * _550;
    float _554 = _528 * _552;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    float _558 = _556 * _530;
    bool _560 = _558 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _562 = isnan(_558);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _568 = _564 || _566;
    float _570 = in.m_43.x;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = in.m_43.y;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = in.m_43.z;
    float _584 = gl_FragCoord.w;
    float _586 = _582 * _584;
    if (!_568)
    {
        discard_fragment();
    }
    float _588 = -_498;
    float _590 = _588 + 1.0;
    float _592 = -_500;
    float _594 = _592 + 1.0;
    float _596 = _91 * _574;
    float _598 = _91 * _580;
    float _600 = _91 * _586;
    float _602 = -_502;
    float _604 = _602 + 1.0;
    float _606 = _596 * _590;
    float _608 = _598 * _594;
    float _610 = _91 * _536;
    float _612 = _600 * _604;
    float _614 = _91 * _542;
    float _616 = _91 * _548;
    float _618 = fma(_500, _610, _608);
    float _620 = fma(_498, _614, _606);
    float _622 = fma(_502, _616, _612);
    if (!_568)
    {
        out.m_48.x = _620;
        out.m_48.y = _618;
        out.m_48.z = _622;
        out.m_48.w = _556;
        return out;
    }
    float _624 = _618 * 0.715200006961822509765625;
    float _626 = 0.0 + _558;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = fma(_620, 0.2125999927520751953125, _624);
    bool _632 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _634 = fma(_622, 0.072200000286102294921875, _630);
    float _636 = 1.0 / _634;
    float _638 = _636 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _640 = precise::clamp(_638, 0.0, 1.0);
    float _642 = fma(_640, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _644 = _620 * _642;
    float _646 = _618 * _642;
    float _648 = _622 * _642;
    float _650 = _642;
    if (!_632)
    {
        _650 = _628;
    }
    float _652 = _650;
    bool _654 = !_632;
    float _656 = _652;
    if (!_654)
    {
        float _658 = in.m_50.w;
        float _660 = gl_FragCoord.w;
        float _662 = _658 * _660;
        float _664 = in.m_50.z;
        float _666 = gl_FragCoord.w;
        float _668 = _664 * _666;
        float _670 = _91 * _662;
        float _672 = _91 * _668;
        float _674 = 1.0 / _670;
        float _676 = _672 * _674;
        float _678 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _680 = fma(_676, (*spvDescriptorSet0.fp_c8)._m0[30].w, _678);
        float _682 = 1.0 / _680;
        float _684 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _686 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _688 = fma(_682, _684, _686);
        float _690 = _688 * 8.0;
        float _692 = precise::clamp(_690, 0.0, 1.0);
        float _694 = _628 * _692;
        _656 = _694;
    }
    float _696 = _656;
    float _698 = 0.0 + _696;
    float _700 = precise::clamp(_698, 0.0, 1.0);
    out.m_48.x = _644;
    out.m_48.y = _646;
    out.m_48.z = _648;
    out.m_48.w = _700;
    return out;
}

