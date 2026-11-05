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
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
};

static inline __attribute__((always_inline))
int _57(thread const int& _1609, thread const int& _1610, thread const int& _1611, thread int& _1612, thread uint& gl_SubgroupInvocationID)
{
    int _1615 = _1611 & 31;
    uint _1618 = uint(int(uint(_1611) >> uint(8)));
    int _1620 = int(_1618) & 31;
    float _1622 = as_type<float>(gl_SubgroupInvocationID);
    int _1624 = as_type<int>(_1622) & _1620;
    int _1626 = ~_1620;
    int _1628 = _1615 & _1626;
    int _1630 = _1628 | _1624;
    int _1632 = ~_1620;
    int _1634 = _1610 & _1632;
    int _1636 = _1634 | _1624;
    bool _1638 = uint(_1636) <= uint(_1630);
    _1612 = _1638 ? (-1) : 0;
    float _1640 = spvSubgroupShuffle(as_type<float>(_1609), uint(_1636));
    uint _1642 = uint(_1638 ? as_type<int>(_1640) : _1609);
    return int(_1642);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float _81 = _77 * 0.0625;
    float _83 = _79 * 0.0625;
    float _85 = abs(_77);
    float _87 = abs(_79);
    float _89 = precise::max(_85, _87);
    bool _93 = _89 >= 16.0;
    float _95 = _93 ? _83 : _79;
    float _97 = _93 ? _81 : _77;
    float _99 = abs(_95);
    bool _101 = _99 != 0.0;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.0);
    bool _109 = _105 || _107;
    float _111 = abs(_97);
    bool _113 = _111 == 0.0;
    float _115 = abs(_97);
    bool _117 = _115 == 0.0;
    bool _119 = !_109;
    bool _121 = _117 && _119;
    bool _123 = false;
    float _125 = _89;
    if (_121)
    {
        bool _127 = as_type<int>(_97) >= 0;
        _123 = _127;
    }
    bool _129 = _123;
    int _131 = 0;
    int _133 = _129 ? (-1) : 0;
    if (_121)
    {
        int _135 = _129 ? 0 : 1078530011;
        _131 = _135;
    }
    int _137 = _131;
    int _139 = _137;
    if (_121)
    {
        int _141 = int(0x80000000) & as_type<int>(_95);
        int _143 = _137 | _141;
        _125 = as_type<float>(_143);
    }
    float _145 = _125;
    bool _147 = !_109;
    bool _149 = _147 && _113;
    float _151 = _145;
    float _153 = _145;
    if (!_149)
    {
        float _155 = abs(_95);
        bool _157 = _155 != as_type<float>(0x7f800000u /* inf */);
        bool _159 = isnan(_155);
        bool _161 = _157 || _159;
        bool _163 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _165 = _161 || _163;
        float _167 = abs(_97);
        bool _169 = _167 == as_type<float>(0x7f800000u /* inf */);
        float _171 = abs(_97);
        bool _173 = _171 == as_type<float>(0x7f800000u /* inf */);
        bool _175 = !_165;
        bool _177 = _173 && _175;
        if (_177)
        {
            bool _179 = as_type<int>(_97) >= 0;
            _133 = _179 ? (-1) : 0;
        }
        int _181 = _133;
        if (_177)
        {
            _139 = 1075235812;
        }
        int _183 = _139;
        int _185 = _183;
        if (_177)
        {
            int _187 = ~_181;
            int _189 = (_187 != 0) ? _183 : 1061752795;
            _185 = _189;
        }
        int _191 = _185;
        if (_177)
        {
            int _193 = int(0x80000000) & as_type<int>(_95);
            int _195 = _191 | _193;
            _151 = as_type<float>(_195);
        }
        float _197 = _151;
        bool _199 = !_165;
        bool _201 = _199 && _169;
        _153 = _197;
        if (!_201)
        {
            float _203 = abs(_95);
            float _205 = abs(_97);
            float _207 = precise::max(_203, _205);
            float _209 = abs(_95);
            float _211 = abs(_97);
            float _213 = precise::min(_209, _211);
            float _215 = 1.0 / _207;
            float _217 = abs(_95);
            float _219 = abs(_97);
            bool _221 = _217 > _219;
            bool _223 = as_type<int>(_97) >= 0;
            float _225 = _213 * _215;
            float _227 = abs(_95);
            float _229 = abs(_97);
            float _231 = _227 + _229;
            int _233 = as_type<int>(_95) & int(0x80000000);
            float _235 = _225 * _225;
            bool _237 = _231 > as_type<float>(0x7f800000u /* inf */);
            bool _239 = isnan(_231);
            bool _241 = _237 || _239;
            bool _243 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _245 = _241 || _243;
            float _247 = _235 + 11.33538818359375;
            float _249 = fma(_235, _247, 28.84246826171875);
            float _251 = fma(_235, _249, 19.6966705322265625);
            float _253 = fma(_235, -0.82336294651031494140625, -5.674867153167724609375);
            float _255 = fma(_235, _253, -6.565555095672607421875);
            float _257 = 1.0 / _251;
            float _259 = _235 * _255;
            float _261 = _225 * _259;
            float _263 = fma(_261, _257, _225);
            float _265 = _263;
            _153 = _231;
            if (_221)
            {
                float _267 = -_263;
                float _269 = _267 + 1.57079637050628662109375;
                _265 = _269;
            }
            float _271 = _265;
            int _273 = as_type<int>(_271);
            if (!_223)
            {
                float _275 = -_271;
                float _277 = _275 + 3.1415927410125732421875;
                _273 = as_type<int>(_277);
            }
            int _279 = _273;
            if (!_245)
            {
                int _281 = _233 | _279;
                _153 = as_type<float>(_281);
            }
        }
    }
    float _283 = _153;
    float _285 = _283 * 0.3183098733425140380859375;
    float _287 = _79 * _79;
    float _289 = _285 + 0.5;
    int _291 = as_type<int>(_285);
    int _293 = 0;
    int _295 = 7171;
    int _297;
    int _1027 = _57(_291, _293, _295, _297, gl_SubgroupInvocationID);
    int _299 = _1027;
    float _301 = fma(_77, _77, _287);
    float _303 = floor(_289);
    float _305 = sqrt(_301);
    float _307 = -_303;
    float _309 = _289 + _307;
    int _311 = as_type<int>(_309);
    int _313 = 0;
    int _315 = 7171;
    int _317;
    int _1043 = _57(_311, _313, _315, _317, gl_SubgroupInvocationID);
    int _319 = _1043;
    uint _1057 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _321 = (as_type<float>(_299) * float4(1.0, -1.0, 1.0, 0.0)[_1057]) + (_285 * float4(1.0, 1.0, -1.0, 1.0)[_1057]);
    float _323 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    int _325 = as_type<int>(_321);
    int _327 = 1;
    int _329 = 7171;
    int _331;
    int _1071 = _57(_325, _327, _329, _331, gl_SubgroupInvocationID);
    int _333 = _1071;
    float _335 = _323 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    int _337 = as_type<int>(_321);
    int _339 = 2;
    int _341 = 7171;
    int _343;
    int _1079 = _57(_337, _339, _341, _343, gl_SubgroupInvocationID);
    int _345 = _1079;
    float _347 = fma(_305, (*spvDescriptorSet0.fp_c9)._m0[194].z, _335);
    uint _1092 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _349 = (as_type<float>(_319) * float4(1.0, -1.0, 1.0, 0.0)[_1092]) + (_309 * float4(1.0, 1.0, -1.0, 1.0)[_1092]);
    int _351 = as_type<int>(_349);
    int _353 = 1;
    int _355 = 7171;
    int _357;
    int _1100 = _57(_351, _353, _355, _357, gl_SubgroupInvocationID);
    int _359 = _1100;
    int _361 = as_type<int>(_349);
    int _363 = 2;
    int _365 = 7171;
    int _367;
    int _1103 = _57(_361, _363, _365, _367, gl_SubgroupInvocationID);
    int _369 = _1103;
    float _371 = abs(as_type<float>(_333));
    float _373 = abs(as_type<float>(_345));
    float _375 = _371 + _373;
    float _377 = _375 + (-9.9999997473787516355514526367188e-05);
    float _379 = abs(as_type<float>(_359));
    float _381 = abs(as_type<float>(_369));
    float _383 = _379 + _381;
    bool _385 = _377 >= _383;
    bool _387 = isnan(_377);
    bool _389 = _385 || _387;
    bool _391 = isnan(_383);
    bool _393 = _389 || _391;
    bool _395 = !_393;
    float _397 = _395 ? _285 : 0.0;
    float2 _1148;
    _1148.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_397, _347));
    _1148.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_397, _347));
    float _399 = _1148.x;
    float _401 = _399 * 256.0;
    int _403 = int(_401);
    float2 _1158 = float2(_397, _347);
    float4 _406 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1158, float2(0.0), isnan(_1158))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1158, float2(0.0), isnan(_1158))).xyzw;
    float _408 = _406.x;
    float _410 = _406.y;
    float _412 = _406.z;
    float _414 = _406.w;
    float _416 = float(uint(_403));
    float _418 = _416 * 0.00390625;
    float _420 = precise::min(_418, 2.0);
    float2 _1185 = float2(_397, _347);
    float4 _422 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1185, float2(0.0), isnan(_1185)), level(_420)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1185, float2(0.0), isnan(_1185)), level(_420)).xyzw;
    float _424 = _422.x;
    float _426 = _422.y;
    float _428 = _422.z;
    float _430 = _422.w;
    float _432 = in.m_39.w;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = in.m_41.w;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _446 = in.m_43.x;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = _305 * 2.0;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _444);
    float _458 = -_454;
    float _460 = _458 + 1.0;
    float _462 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _456);
    float _464 = _460 * _460;
    float _466 = rsqrt(_462);
    float _468 = _466 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _470 = _466 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _472 = _468 * (*spvDescriptorSet0.fp_c10)._m0[9].z;
    float _474 = fma(_470, (*spvDescriptorSet0.fp_c10)._m0[8].z, _472);
    float _476 = _466 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _478 = _464 * _464;
    float _480 = _75 * _436;
    float _482 = fma(_476, (*spvDescriptorSet0.fp_c10)._m0[10].z, _474);
    float _484 = precise::clamp(_482, 0.0, 1.0);
    float _486 = in.m_41.y;
    float _488 = gl_FragCoord.w;
    float _490 = _486 * _488;
    float _492 = in.m_41.z;
    float _494 = gl_FragCoord.w;
    float _496 = _492 * _494;
    float _498 = in.m_39.z;
    float _500 = gl_FragCoord.w;
    float _502 = _498 * _500;
    float _504 = fma(_414, 0.5, _430);
    float _506 = _478 * _504;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _75 * _442;
    float _512 = _478 * _478;
    float _514 = _480 * _508;
    float _516 = _484 * _484;
    float _518 = fma(_510, _514, _512);
    float _520 = _75 * _450;
    float _522 = _518 * _516;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    float _526 = _524 * _520;
    bool _528 = _526 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _530 = isnan(_526);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _536 = _532 || _534;
    float _538 = in.m_41.x;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = in.m_39.x;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = in.m_39.y;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    if (!_536)
    {
        discard_fragment();
    }
    float _556 = _408 * _408;
    float _558 = _556 * 0.5;
    float _560 = _410 * _410;
    float _562 = _560 * 0.5;
    float _564 = _412 * _412;
    float _566 = _564 * 0.5;
    float _568 = fma(_424, _424, _558);
    float _570 = fma(_426, _426, _562);
    float _572 = fma(_428, _428, _566);
    float _574 = _75 * _490;
    float _576 = _75 * _496;
    float _578 = -_570;
    float _580 = _578 + 1.0;
    float _582 = -_572;
    float _584 = _582 + 1.0;
    float _586 = _574 * _580;
    float _588 = _576 * _584;
    float _590 = _75 * _542;
    float _592 = -_568;
    float _594 = _592 + 1.0;
    float _596 = _75 * _554;
    float _598 = _75 * _502;
    float _600 = _590 * _594;
    float _602 = _75 * _548;
    float _604 = fma(_572, _598, _588);
    float _606 = fma(_568, _602, _600);
    float _608 = fma(_570, _596, _586);
    float _610 = _606 + _512;
    float _612 = _608 + _512;
    float _614 = _604 + _512;
    if (!_536)
    {
        out.m_46.x = _610;
        out.m_46.y = _612;
        out.m_46.z = _614;
        out.m_46.w = _524;
        return out;
    }
    float _616 = _612 * 0.715200006961822509765625;
    float _618 = 0.0 + _526;
    float _620 = precise::clamp(_618, 0.0, 1.0);
    float _622 = fma(_610, 0.2125999927520751953125, _616);
    bool _624 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _626 = fma(_614, 0.072200000286102294921875, _622);
    float _628 = 1.0 / _626;
    float _630 = _628 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = fma(_632, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _636 = _610 * _634;
    float _638 = _612 * _634;
    float _640 = _614 * _634;
    float _642 = _634;
    if (!_624)
    {
        _642 = _620;
    }
    float _644 = _642;
    bool _646 = !_624;
    float _648 = _644;
    if (!_646)
    {
        float _650 = in.m_48.w;
        float _652 = gl_FragCoord.w;
        float _654 = _650 * _652;
        float _656 = in.m_48.z;
        float _658 = gl_FragCoord.w;
        float _660 = _656 * _658;
        float _662 = _75 * _654;
        float _664 = _75 * _660;
        float _666 = 1.0 / _662;
        float _668 = _664 * _666;
        float _670 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _672 = fma(_668, (*spvDescriptorSet0.fp_c8)._m0[30].w, _670);
        float _674 = 1.0 / _672;
        float _676 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _678 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _680 = fma(_674, _676, _678);
        float _682 = _680 * 8.0;
        float _684 = precise::clamp(_682, 0.0, 1.0);
        float _686 = _620 * _684;
        _648 = _686;
    }
    float _688 = _648;
    float _690 = 0.0 + _688;
    float _692 = precise::clamp(_690, 0.0, 1.0);
    out.m_46.x = _636;
    out.m_46.y = _638;
    out.m_46.z = _640;
    out.m_46.w = _692;
    return out;
}

