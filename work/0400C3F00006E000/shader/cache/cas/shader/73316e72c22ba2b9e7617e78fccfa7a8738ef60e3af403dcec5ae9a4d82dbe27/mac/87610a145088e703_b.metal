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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_37 [[user(locn3), flat]];
    float4 m_35 [[user(locn4)]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_52 [[user(locn6)]];
    float4 m_50 [[user(locn8)]];
};

static inline __attribute__((always_inline))
int _61(thread const int& _1511, thread const int& _1512, thread const int& _1513, thread int& _1514, thread uint& gl_SubgroupInvocationID)
{
    int _1517 = _1513 & 31;
    uint _1520 = uint(int(uint(_1513) >> uint(8)));
    int _1522 = int(_1520) & 31;
    float _1524 = as_type<float>(gl_SubgroupInvocationID);
    int _1526 = as_type<int>(_1524) & _1522;
    int _1528 = ~_1522;
    int _1530 = _1517 & _1528;
    int _1532 = _1530 | _1526;
    int _1534 = ~_1522;
    int _1536 = _1512 & _1534;
    int _1538 = _1536 | _1526;
    bool _1540 = uint(_1538) <= uint(_1532);
    _1514 = _1540 ? (-1) : 0;
    float _1542 = spvSubgroupShuffle(as_type<float>(_1511), uint(_1538));
    uint _1544 = uint(_1540 ? as_type<int>(_1542) : _1511);
    return int(_1544);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_35.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = _79 * _71;
    float _83 = _79 * _77;
    float _85 = fma(_81, 2.0, -1.0);
    float _87 = fma(_83, 2.0, -1.0);
    float _89 = abs(_85);
    float _91 = abs(_87);
    float _93 = precise::max(_89, _91);
    bool _97 = _93 >= 16.0;
    float _99 = _85;
    float _101 = _87;
    int _103 = as_type<int>(_93);
    if (_97)
    {
        float _105 = _85 * 0.0625;
        _99 = _105;
    }
    float _107 = _99;
    if (_97)
    {
        float _109 = _87 * 0.0625;
        _101 = _109;
    }
    float _111 = _101;
    float _113 = abs(_107);
    bool _115 = _113 != 0.0;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan(0.0);
    bool _123 = _119 || _121;
    float _125 = abs(_111);
    bool _127 = _125 == 0.0;
    float _129 = abs(_111);
    bool _131 = _129 == 0.0;
    bool _133 = !_123;
    bool _135 = _131 && _133;
    bool _137 = false;
    if (_135)
    {
        bool _139 = as_type<int>(_111) >= 0;
        _137 = _139;
    }
    bool _141 = _137;
    int _143 = _141 ? (-1) : 0;
    if (_135)
    {
        int _145 = _141 ? 0 : 1078530011;
        _103 = _145;
    }
    int _147 = _103;
    int _149 = _147;
    if (_135)
    {
        int _151 = int(0x80000000) & as_type<int>(_107);
        int _153 = _147 | _151;
        _149 = _153;
    }
    int _155 = _149;
    bool _157 = !_123;
    bool _159 = _157 && _127;
    int _161 = _155;
    float _163 = as_type<float>(_155);
    if (!_159)
    {
        float _165 = abs(_107);
        bool _167 = _165 != as_type<float>(0x7f800000u /* inf */);
        bool _169 = isnan(_165);
        bool _171 = _167 || _169;
        bool _173 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _175 = _171 || _173;
        float _177 = abs(_111);
        bool _179 = _177 == as_type<float>(0x7f800000u /* inf */);
        float _181 = abs(_111);
        bool _183 = _181 == as_type<float>(0x7f800000u /* inf */);
        bool _185 = !_175;
        bool _187 = _183 && _185;
        if (_187)
        {
            bool _189 = as_type<int>(_111) >= 0;
            _143 = _189 ? (-1) : 0;
        }
        int _191 = _143;
        if (_187)
        {
            _161 = 1075235812;
        }
        int _193 = _161;
        int _195 = _193;
        if (_187)
        {
            int _197 = ~_191;
            int _199 = (_197 != 0) ? _193 : 1061752795;
            _195 = _199;
        }
        int _201 = _195;
        float _203 = as_type<float>(_201);
        if (_187)
        {
            int _205 = int(0x80000000) & as_type<int>(_107);
            int _207 = _201 | _205;
            _203 = as_type<float>(_207);
        }
        float _209 = _203;
        bool _211 = !_175;
        bool _213 = _211 && _179;
        _163 = _209;
        if (!_213)
        {
            float _215 = abs(_107);
            float _217 = abs(_111);
            float _219 = precise::max(_215, _217);
            float _221 = abs(_107);
            float _223 = abs(_111);
            float _225 = precise::min(_221, _223);
            float _227 = 1.0 / _219;
            float _229 = abs(_107);
            float _231 = abs(_111);
            bool _233 = _229 > _231;
            bool _235 = as_type<int>(_111) >= 0;
            float _237 = _225 * _227;
            float _239 = abs(_107);
            float _241 = abs(_111);
            float _243 = _239 + _241;
            int _245 = as_type<int>(_107) & int(0x80000000);
            float _247 = _237 * _237;
            bool _249 = _243 > as_type<float>(0x7f800000u /* inf */);
            bool _251 = isnan(_243);
            bool _253 = _249 || _251;
            bool _255 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _257 = _253 || _255;
            float _259 = _247 + 11.33538818359375;
            float _261 = fma(_247, _259, 28.84246826171875);
            float _263 = fma(_247, _261, 19.6966705322265625);
            float _265 = fma(_247, -0.82336294651031494140625, -5.674867153167724609375);
            float _267 = fma(_247, _265, -6.565555095672607421875);
            float _269 = 1.0 / _263;
            float _271 = _247 * _267;
            float _273 = _237 * _271;
            float _275 = fma(_273, _269, _237);
            float _277 = _275;
            _163 = _243;
            if (_233)
            {
                float _279 = -_275;
                float _281 = _279 + 1.57079637050628662109375;
                _277 = _281;
            }
            float _283 = _277;
            int _285 = as_type<int>(_283);
            if (!_235)
            {
                float _287 = -_283;
                float _289 = _287 + 3.1415927410125732421875;
                _285 = as_type<int>(_289);
            }
            int _291 = _285;
            if (!_257)
            {
                int _293 = _245 | _291;
                _163 = as_type<float>(_293);
            }
        }
    }
    float _295 = _163;
    float _297 = fma(_295, 0.15915493667125701904296875, 1.0);
    float _299 = fma(_295, 0.15915493667125701904296875, 0.5);
    float _301 = -_83;
    float _303 = _301 + 0.5;
    float _305 = -_81;
    float _307 = _305 + 0.5;
    float _309 = floor(_297);
    float _311 = in.m_37.x;
    int _313 = as_type<int>(_299);
    int _315 = 0;
    int _317 = 7171;
    int _319;
    int _1023 = _61(_313, _315, _317, _319, gl_SubgroupInvocationID);
    int _321 = _1023;
    float _323 = _303 * _303;
    float _325 = -_309;
    float _327 = _297 + _325;
    float _329 = fma(_307, _307, _323);
    int _331 = as_type<int>(_327);
    int _333 = 0;
    int _335 = 7171;
    int _337;
    int _1038 = _61(_331, _333, _335, _337, gl_SubgroupInvocationID);
    int _339 = _1038;
    float _341 = sqrt(_329);
    uint _1053 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _343 = (as_type<float>(_321) * float4(1.0, -1.0, 1.0, 0.0)[_1053]) + (_299 * float4(1.0, 1.0, -1.0, 1.0)[_1053]);
    int _345 = as_type<int>(_343);
    int _347 = 1;
    int _349 = 7171;
    int _351;
    int _1062 = _61(_345, _347, _349, _351, gl_SubgroupInvocationID);
    int _353 = _1062;
    int _355 = as_type<int>(_343);
    int _357 = 2;
    int _359 = 7171;
    int _361;
    int _1065 = _61(_355, _357, _359, _361, gl_SubgroupInvocationID);
    int _363 = _1065;
    float _365 = precise::max(0.0, _341);
    uint _1075 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _367 = (as_type<float>(_339) * float4(1.0, -1.0, 1.0, 0.0)[_1075]) + (_327 * float4(1.0, 1.0, -1.0, 1.0)[_1075]);
    float _369 = in.m_39.y;
    float _371 = precise::min(_365, 0.5);
    int _373 = as_type<int>(_367);
    int _375 = 1;
    int _377 = 7171;
    int _379;
    int _1087 = _61(_373, _375, _377, _379, gl_SubgroupInvocationID);
    int _381 = _1087;
    int _383 = as_type<int>(_367);
    int _385 = 2;
    int _387 = 7171;
    int _389;
    int _1090 = _61(_383, _385, _387, _389, gl_SubgroupInvocationID);
    int _391 = _1090;
    float _393 = abs(as_type<float>(_353));
    float _395 = abs(as_type<float>(_363));
    float _397 = _393 + _395;
    float _399 = _397 + (-9.9999997473787516355514526367188e-05);
    float _401 = abs(as_type<float>(_381));
    float _403 = abs(as_type<float>(_391));
    float _405 = _401 + _403;
    bool _407 = _399 >= _405;
    bool _409 = isnan(_399);
    bool _411 = _407 || _409;
    bool _413 = isnan(_405);
    bool _415 = _411 || _413;
    float _417 = fma(_371, 2.0, _311);
    bool _419 = !_415;
    float _421 = _419 ? _299 : 0.0;
    float _423 = fma(_369, -0.0199999995529651641845703125, _417);
    float _425 = _421 + _311;
    float _427 = _425 * 4.0;
    float2 _1147 = float2(_427, _423);
    float _429 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1147, float2(0.0), isnan(_1147))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1147, float2(0.0), isnan(_1147))).w;
    float _431 = in.m_35.y;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_35.x;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = _79 * _435;
    float _445 = _79 * _441;
    float _447 = fma(_429, 0.100000001490116119384765625, _443);
    float2 _1181 = float2(_445, _447);
    float4 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1181, float2(0.0), isnan(_1181))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1181, float2(0.0), isnan(_1181))).xyzw;
    float _452 = _450.x;
    float _454 = _450.y;
    float _456 = _450.z;
    float _458 = _450.w;
    float _460 = in.m_41.x;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_43.x;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_45.x;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = in.m_43.z;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = in.m_45.y;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_45.z;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = _79 * _464;
    float _498 = _79 * _470;
    float _500 = _79 * _482;
    float _502 = _79 * _488;
    float _504 = _79 * _494;
    float _506 = -_500;
    float _508 = _506 + _504;
    float _510 = 0.0 + _458;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = _512 * _496;
    bool _516 = _514 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _518 = isnan(_514);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _524 = _520 || _522;
    float _526 = in.m_43.y;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    if (!_524)
    {
        discard_fragment();
    }
    float _532 = _456 * _456;
    float _534 = fma(_532, _508, _500);
    float _536 = _79 * _530;
    float _538 = _79 * _476;
    float _540 = -_536;
    float _542 = _540 + _502;
    float _544 = -_498;
    float _546 = _544 + _538;
    float _548 = _452 * _452;
    float _550 = _454 * _454;
    float _552 = fma(_548, _546, _498);
    float _554 = fma(_550, _542, _536);
    if (!_524)
    {
        out.m_48.x = _552;
        out.m_48.y = _554;
        out.m_48.z = _534;
        out.m_48.w = _458;
        return out;
    }
    float _556 = _554 * 0.715200006961822509765625;
    float _558 = in.m_50.w;
    float _560 = gl_FragCoord.w;
    float _562 = _558 * _560;
    float _564 = in.m_50.z;
    float _566 = gl_FragCoord.w;
    float _568 = _564 * _566;
    float _570 = in.m_50.x;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = fma(_552, 0.2125999927520751953125, _556);
    float _578 = in.m_50.y;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = 0.0 + _514;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    float _588 = fma(_534, 0.072200000286102294921875, _576);
    bool _590 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _592 = 1.0 / _588;
    float _594 = _592 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float _598 = fma(_596, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _600 = _79 * _562;
    float _602 = _79 * _568;
    float _604 = _598 * _600;
    float _606 = _79 * _574;
    float _608 = _79 * _582;
    float _610 = fma(_534, _604, _602);
    float _612 = fma(_552, _604, _606);
    float _614 = fma(_554, _604, _608);
    float _616 = _602;
    if (!_590)
    {
        _616 = _586;
    }
    float _618 = _616;
    bool _620 = !_590;
    float _622 = _618;
    if (!_620)
    {
        float _624 = in.m_52.w;
        float _626 = gl_FragCoord.w;
        float _628 = _624 * _626;
        float _630 = in.m_52.z;
        float _632 = gl_FragCoord.w;
        float _634 = _630 * _632;
        float _636 = _79 * _628;
        float _638 = _79 * _634;
        float _640 = 1.0 / _636;
        float _642 = _638 * _640;
        float _644 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _646 = fma(_642, (*spvDescriptorSet0.fp_c8)._m0[30].w, _644);
        float _648 = 1.0 / _646;
        float _650 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _652 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _654 = fma(_648, _650, _652);
        float _656 = _654 * 8.0;
        float _658 = precise::clamp(_656, 0.0, 1.0);
        float _660 = _586 * _658;
        _622 = _660;
    }
    float _662 = _622;
    float _664 = 0.0 + _662;
    float _666 = precise::clamp(_664, 0.0, 1.0);
    out.m_48.x = _612;
    out.m_48.y = _614;
    out.m_48.z = _610;
    out.m_48.w = _666;
    return out;
}

