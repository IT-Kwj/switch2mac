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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_16 [[id(5)]];
    sampler fp_t_tcb_16Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_18 [[id(11)]];
    sampler fp_t_tcb_18Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_E [[id(17)]];
    sampler fp_t_tcb_ESmplr [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_16Smplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    sampler fp_t_tcb_18Smplr_w [[id(22)]];
    sampler fp_t_tcb_ESmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
    float4 m_64 [[color(1)]];
};

struct main0_in
{
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1144 = false;
    float _71 = gl_FragCoord.w;
    float _73 = in.m_53.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_53.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _71;
    float _87 = _85 * _77;
    float _89 = _85 * _83;
    float _91 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1408 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1408, float2(0.0), isnan(_1408))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1408, float2(0.0), isnan(_1408))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1423 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1423, float2(0.0), isnan(_1423))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1423, float2(0.0), isnan(_1423))).x;
    float2 _1431 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1431, float2(0.0), isnan(_1431))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1431, float2(0.0), isnan(_1431))).x;
    float _101 = in.m_55.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_55.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_57.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_57.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_59.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_59.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _85 * _105;
    float _139 = _85 * _111;
    float _141 = _85 * _117;
    float _143 = _85 * _123;
    float _145 = _85 * _129;
    float _147 = _85 * _135;
    float _149 = -_93;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _153 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].x, _151);
    float _155 = _153 * _137;
    float _157 = _153 * _139;
    float _159 = _155 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _161 = -_97;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _165 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[41].x, _163);
    float _167 = _155 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _169 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].x, _159);
    float _171 = -_99;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _175 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[41].x, _173);
    float _177 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].x, _167);
    float _179 = -_157;
    float _181 = fma(_165, _141, _179);
    float _183 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _169);
    float _185 = -_155;
    float _187 = fma(_165, _143, _185);
    float _189 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _177);
    float _191 = -_153;
    float _193 = _191 + _165;
    float _195 = _183 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _197 = -_157;
    float _199 = fma(_175, _145, _197);
    float _201 = _189 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _203 = -_155;
    float _205 = fma(_175, _147, _203);
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _209 = _195 + _207;
    float _211 = -_153;
    float _213 = _211 + _175;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _217 = _201 + _215;
    float _219 = _193 * _199;
    float _221 = _209 * _209;
    float _223 = _187 * _213;
    float _225 = -_219;
    float _227 = fma(_181, _213, _225);
    float _229 = fma(_217, _217, _221);
    float _231 = -_223;
    float _233 = fma(_193, _205, _231);
    float _235 = _181 * _205;
    float _237 = _227 * _227;
    float _239 = sqrt(_229);
    float _241 = -_235;
    float _243 = fma(_187, _199, _241);
    float _245 = fma(_233, _233, _237);
    float _247 = fma(_243, _243, _245);
    float _249 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _251 = rsqrt(_247);
    float _253 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _249);
    bool _257 = _239 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _259 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _253);
    float _261 = _259 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _263 = _233 * _251;
    float _265 = _227 * _251;
    float _267 = _243 * _251;
    float _269 = _251;
    float _271 = _247;
    float _273 = _195;
    float _275 = _153;
    if (!_257)
    {
        _269 = _201;
    }
    float _277 = _269;
    float _279 = _277;
    if (!_257)
    {
        _271 = _261;
    }
    float _281 = _271;
    bool _283 = !_257;
    float _285 = _281;
    if (!_283)
    {
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _289 = _239 + _287;
        float _291 = _261 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = rsqrt(_229);
        float _295 = abs(_291);
        float _297 = abs(_289);
        float _299 = precise::max(_295, _297);
        bool _301 = _299 >= 16.0;
        float _303 = -_261;
        float _305 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _307 = _303 + _305;
        float _309 = _307 * _307;
        float _311 = _217 * _293;
        float _313 = _209 * _293;
        float _315 = -_217;
        float _317 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[41].z, _315);
        float _319 = _289;
        float _321 = _291;
        if (_301)
        {
            float _323 = _289 * 0.0625;
            _319 = _323;
        }
        float _325 = _319;
        if (_301)
        {
            float _327 = _291 * 0.0625;
            _321 = _327;
        }
        float _329 = _321;
        float _331 = -_209;
        float _333 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[41].z, _331);
        float _335 = fma(_317, _317, _309);
        float _337 = abs(_325);
        bool _339 = _337 != 0.0;
        bool _341 = isnan(_337);
        bool _343 = _339 || _341;
        bool _345 = isnan(0.0);
        bool _347 = _343 || _345;
        float _349 = fma(_333, _333, _335);
        float _351 = abs(_329);
        bool _353 = _351 == 0.0;
        float _355 = abs(_329);
        bool _357 = _355 == 0.0;
        bool _359 = !_347;
        bool _361 = _357 && _359;
        float _363 = sqrt(_349);
        bool _365 = false;
        int _368 = as_type<int>(_333);
        if (_361)
        {
            bool _370 = as_type<int>(_329) >= 0;
            _365 = _370;
        }
        bool _372 = _365;
        int _374 = _372 ? (-1) : 0;
        if (_361)
        {
            int _376 = _372 ? 0 : 1078530011;
            _368 = _376;
        }
        int _378 = _368;
        int _380 = _378;
        if (_361)
        {
            int _382 = int(0x80000000) & as_type<int>(_325);
            int _384 = _378 | _382;
            _380 = _384;
        }
        int _386 = _380;
        bool _388 = !_347;
        bool _390 = _388 && _353;
        int _392 = _386;
        float _394 = as_type<float>(_386);
        if (!_390)
        {
            float _396 = abs(_325);
            bool _398 = _396 != as_type<float>(0x7f800000u /* inf */);
            bool _400 = isnan(_396);
            bool _402 = _398 || _400;
            bool _404 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _406 = _402 || _404;
            float _408 = abs(_329);
            bool _410 = _408 == as_type<float>(0x7f800000u /* inf */);
            float _412 = abs(_329);
            bool _414 = _412 == as_type<float>(0x7f800000u /* inf */);
            bool _416 = !_406;
            bool _418 = _414 && _416;
            if (_418)
            {
                bool _420 = as_type<int>(_329) >= 0;
                _374 = _420 ? (-1) : 0;
            }
            int _422 = _374;
            if (_418)
            {
                _392 = 1075235812;
            }
            int _424 = _392;
            int _426 = _424;
            if (_418)
            {
                int _428 = ~_422;
                int _430 = (_428 != 0) ? _424 : 1061752795;
                _426 = _430;
            }
            int _432 = _426;
            float _434 = as_type<float>(_432);
            if (_418)
            {
                int _436 = int(0x80000000) & as_type<int>(_325);
                int _438 = _432 | _436;
                _434 = as_type<float>(_438);
            }
            float _440 = _434;
            bool _442 = !_406;
            bool _444 = _442 && _410;
            _394 = _440;
            if (!_444)
            {
                float _446 = abs(_325);
                float _448 = abs(_329);
                float _450 = precise::max(_446, _448);
                float _452 = abs(_325);
                float _454 = abs(_329);
                float _456 = precise::min(_452, _454);
                float _458 = 1.0 / _450;
                float _460 = abs(_325);
                float _462 = abs(_329);
                bool _464 = _460 > _462;
                bool _466 = as_type<int>(_329) >= 0;
                float _468 = _456 * _458;
                float _470 = abs(_325);
                float _472 = abs(_329);
                float _474 = _470 + _472;
                int _476 = as_type<int>(_325) & int(0x80000000);
                float _478 = _468 * _468;
                bool _480 = _474 > as_type<float>(0x7f800000u /* inf */);
                bool _482 = isnan(_474);
                bool _484 = _480 || _482;
                bool _486 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _488 = _484 || _486;
                float _490 = _478 + 11.33538818359375;
                float _492 = fma(_478, _490, 28.84246826171875);
                float _494 = fma(_478, _492, 19.6966705322265625);
                float _496 = fma(_478, -0.82336294651031494140625, -5.674867153167724609375);
                float _498 = fma(_478, _496, -6.565555095672607421875);
                float _500 = 1.0 / _494;
                float _502 = _478 * _498;
                float _504 = _468 * _502;
                float _506 = fma(_504, _500, _468);
                float _508 = _506;
                _394 = _474;
                if (_464)
                {
                    float _510 = -_506;
                    float _512 = _510 + 1.57079637050628662109375;
                    _508 = _512;
                }
                float _514 = _508;
                int _516 = as_type<int>(_514);
                if (!_466)
                {
                    float _518 = -_514;
                    float _520 = _518 + 3.1415927410125732421875;
                    _516 = as_type<int>(_520);
                }
                int _522 = _516;
                if (!_488)
                {
                    int _524 = _476 | _522;
                    _394 = as_type<float>(_524);
                }
            }
        }
        float _526 = _394;
        float _528 = fma(_526, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _530 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _532 = _363 + _530;
        float _534 = fma(_311, _528, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _536 = fma(_313, _528, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _279 = _534;
        _273 = _536;
        _285 = _532;
    }
    float _538 = _279;
    float _540 = _273;
    float _542 = _285;
    float _544 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float _546 = fma(_540, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2113 = float2(_544, _546);
    float _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2113, float2(0.0), isnan(_2113))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2113, float2(0.0), isnan(_2113))).x;
    float _550 = _265 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _552 = abs(_153);
    float _554 = log2(_552);
    float _556 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _558 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[35].x, _550);
    float _560 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].z, _558);
    float _562 = floor(_556);
    float _564 = -_560;
    float _566 = fma(_564, _560, 1.0);
    float _568 = -_560;
    float _570 = fma(_568, (*spvDescriptorSet0.fp_c3)._m0[35].z, _267);
    float _572 = _566 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _574 = _554 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _576 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _578 = fma(_570, _572, _153);
    float _580 = floor(_576);
    float _582 = -_578;
    bool _584 = _582 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _586 = float(_584);
    float _588 = -_562;
    float _590 = _556 + _588;
    float _592 = -_578;
    bool _594 = _592 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _596 = float(_594);
    float _598 = exp2(_574);
    float _600 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _602 = _590 + _600;
    float _604 = _586 + _596;
    float _606 = precise::min(_604, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _608 = -_580;
    float _610 = _576 + _608;
    float _612 = -_560;
    float _614 = fma(_612, (*spvDescriptorSet0.fp_c3)._m0[35].y, _265);
    float _616 = trunc(_606);
    int _618 = int(_616);
    float _620 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _622 = _610 + _620;
    float _624 = fma(_614, _572, _155);
    float _626 = -_602;
    float _628 = _626 + 1.0;
    float _630 = fma(_598, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = -_560;
    float _636 = fma(_634, (*spvDescriptorSet0.fp_c3)._m0[35].x, _263);
    float _638 = -_622;
    float _640 = _638 + 1.0;
    float _642 = _622 * _628;
    float _644 = fma(_632, -2.0, 3.0);
    float _646 = _632 * _632;
    float _648 = fma(_636, _572, _157);
    float _650 = _602 * _640;
    float _652 = _640 * _628;
    float _654 = _646 * _644;
    int _656 = _618 << 6;
    float _658 = -_654;
    float _660 = _658 + 1.0;
    float _662 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    uint _665 = uint(int(uint(_656) >> uint(2)));
    uint _667 = uint(int(uint(int(_665)) >> uint(2)));
    int _669 = int(_665) & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    int _673 = int(_665) + 1;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    int _677 = _673 & 3;
    float _679 = (*spvDescriptorSet0.fp_c3)._m0[int(_675)][_677];
    float _681 = fma(_660, (*spvDescriptorSet0.fp_c3)._m0[44].w, _654);
    float _683 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _685 = precise::max(0.0, _683);
    float _687 = _622 * _602;
    float _689 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    int _691 = _656 + 16;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    int _701 = int(_693) + 1;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    int _705 = _701 & 3;
    float _707 = (*spvDescriptorSet0.fp_c3)._m0[int(_703)][_705];
    float _709 = _681 * _685;
    int _711 = _656 + 32;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    float _729 = _624 * _679;
    float _731 = fma(_648, _671, _729);
    float2 _2420 = float2(_87, _89);
    float4 _734 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2420, float2(0.0), isnan(_2420)), int2(0), component::x).xyzw;
    float _736 = _734.x;
    float _738 = _734.y;
    float _740 = _734.z;
    float _742 = _734.w;
    float2 _2436 = float2(_544, _546);
    float _744 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2436, float2(0.0), isnan(_2436)), level(_548)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2436, float2(0.0), isnan(_2436)), level(_548)).x;
    float2 _2445 = float2(_662, _689);
    float _746 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2445, float2(0.0), isnan(_2445))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2445, float2(0.0), isnan(_2445))).x;
    float2 _2453 = float2(_87, _89);
    float4 _748 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2453, float2(0.0), isnan(_2453)), int2(0), component::x).xyzw;
    float _750 = _748.x;
    float _752 = _748.y;
    float _754 = _748.z;
    float _756 = _748.w;
    float2 _2469 = float2(_87, _89);
    float4 _758 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2469, float2(0.0), isnan(_2469)), int2(0), component::w).xyzw;
    float _760 = _758.x;
    float _762 = _758.y;
    float _764 = _758.z;
    float _766 = _758.w;
    float _768 = _624 * _707;
    float _770 = _624 * _727;
    bool _772 = _618 != 0;
    float _774 = fma(_648, _699, _768);
    float _776 = fma(_648, _719, _770);
    int _778 = _656 + 48;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    uint _782 = uint(int(uint(int(_780)) >> uint(2)));
    int _784 = int(_780) & 3;
    float _786 = (*spvDescriptorSet0.fp_c3)._m0[int(_782)][_784];
    int _788 = int(_780) + 1;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    int _792 = _788 & 3;
    float _794 = (*spvDescriptorSet0.fp_c3)._m0[int(_790)][_792];
    int _796 = _656 + 24;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    uint _800 = uint(int(uint(int(_798)) >> uint(2)));
    int _802 = int(_798) & 3;
    float _804 = (*spvDescriptorSet0.fp_c3)._m0[int(_800)][_802];
    int _806 = int(_798) + 1;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    int _810 = _806 & 3;
    float _812 = (*spvDescriptorSet0.fp_c3)._m0[int(_808)][_810];
    float _814 = _624 * _794;
    float _816 = fma(_648, _786, _814);
    int _818 = _656 + 8;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    uint _822 = uint(int(uint(int(_820)) >> uint(2)));
    int _824 = int(_820) & 3;
    float _826 = (*spvDescriptorSet0.fp_c3)._m0[int(_822)][_824];
    int _828 = int(_820) + 1;
    uint _830 = uint(int(uint(_828) >> uint(2)));
    int _832 = _828 & 3;
    float _834 = (*spvDescriptorSet0.fp_c3)._m0[int(_830)][_832];
    float _836 = fma(_578, _804, _774);
    float _838 = _836 + _812;
    float _840 = fma(_578, _826, _731);
    float _842 = -_736;
    float _844 = fma(_842, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _846 = precise::min(_153, -1.0000000116860974230803549289703e-07);
    float _848 = -_738;
    float _850 = fma(_848, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _852 = -_742;
    float _854 = fma(_852, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _856 = 1.0 / _844;
    float _858 = -_740;
    float _860 = fma(_858, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _862 = _840 + _834;
    int _864 = _656 + 40;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.fp_c3)._m0[int(_868)][_870];
    int _874 = int(_866) + 1;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    int _878 = _874 & 3;
    float _880 = (*spvDescriptorSet0.fp_c3)._m0[int(_876)][_878];
    float _882 = 1.0 / _846;
    float _884 = 1.0 / _850;
    float _886 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _888 = -_153;
    float _890 = fma(_856, _886, _888);
    float _892 = 1.0 / _860;
    float _894 = _882 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _896 = abs(_890);
    float _898 = _896 * _894;
    float _900 = 1.0 / _854;
    float _902 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _904 = -_153;
    float _906 = fma(_884, _902, _904);
    float _908 = abs(_906);
    float _910 = _908 * _894;
    float _912 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _914 = -_153;
    float _916 = fma(_892, _912, _914);
    float _918 = exp2(_898);
    float _920 = abs(_916);
    float _922 = _920 * _894;
    float _924 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _926 = -_153;
    float _928 = fma(_900, _924, _926);
    float _930 = exp2(_910);
    float _932 = abs(_928);
    float _934 = _932 * _894;
    float _936 = fma(_578, _872, _776);
    int _938 = _656 + 56;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.fp_c3)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.fp_c3)._m0[int(_950)][_952];
    float _956 = exp2(_922);
    float _958 = abs(_650);
    float _960 = _958 * _918;
    float _962 = _936 + _880;
    float _964 = exp2(_934);
    float _966 = abs(_687);
    float _968 = _966 * _930;
    float _970 = abs(_642);
    float _972 = _970 * _956;
    float _974 = _960 + _968;
    float _976 = _972 + _974;
    float _978 = abs(_652);
    float _980 = _978 * _964;
    float _982 = _980 + _976;
    float _984 = -_980;
    bool _986 = _976 != _984;
    bool _988 = isnan(_976);
    bool _990 = _986 || _988;
    bool _992 = isnan(_984);
    bool _994 = _990 || _992;
    float _996 = 1.0 / _982;
    float _998 = fma(_578, _946, _816);
    float _1000 = _998 + _954;
    float _1002 = _968 * _996;
    float _1004 = _960 * _996;
    float _1006 = _972 * _996;
    float _1008 = 1.0 / _1000;
    float _1010 = _980 * _996;
    float _1012 = _994 ? _1002 : 0.25;
    bool _1014 = _153 >= (-8000.0);
    bool _1016 = isnan(_153);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(-8000.0);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _994 ? _1004 : 0.25;
    float _1028 = _994 ? _1006 : 0.25;
    float _1030 = _1024 * _709;
    float _1032 = _1030 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1034 = _838 * _1008;
    float _1036 = -_746;
    float _1038 = _1036 + 1.0;
    float _1040 = _1012 * _752;
    float _1042 = _1012 * _762;
    float _1044 = _1038 * _1032;
    float _1046 = precise::clamp(_1044, 0.0, 1.0);
    float _1048 = fma(_1026, _750, _1040);
    float _1050 = fma(_1026, _760, _1042);
    float _1052 = abs(_744);
    float _1054 = _1052 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1056 = -_1046;
    float _1058 = fma(_1056, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1060 = fma(_1028, _754, _1048);
    float _1062 = _994 ? _1010 : 0.25;
    float _1064 = fma(_1028, _764, _1050);
    float _1066 = -_1054;
    float _1068 = fma(_1024, _1066, 1.0);
    float _1070 = _862 * _1008;
    float _1072 = _962 * _1008;
    float _1074 = precise::clamp(_1072, 0.0, 1.0);
    float _1076 = fma(_1062, _756, _1060);
    float _1078 = fma(_1062, _766, _1064);
    float _1080 = precise::min(_1068, 1.0);
    float _1082 = precise::min(_1076, 1.0);
    float _1084 = precise::min(_1080, _1058);
    float _1086 = precise::min(_1078, 1.0);
    float _1142;
    if (!_772)
    {
        float _1088 = rint(_606);
        float _1090 = precise::max(_1088, 0.0);
        uint _1092 = uint(_1090);
        uint _1094 = clamp(_1092, 0u, 65535u);
        float _1096 = _1074 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1098 = fma(_1096, 0.5, _1034);
        float _1100 = fma(_1096, 0.5, _1070);
        float _1102 = fma(_1096, -0.5, _1070);
        float _1104 = fma(_1096, -0.5, _1034);
        float3 _3001 = float3(_1070, _1098, float(int(_1094)));
        float3 _3005 = select(_3001, float3(0.0), isnan(_3001));
        float _1106 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3005.xy, uint(rint(_3005.z)), _1074);
        float3 _3014 = float3(_1100, _1098, float(int(_1094)));
        float3 _3016 = select(_3014, float3(0.0), isnan(_3014));
        float _1108 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3016.xy, uint(rint(_3016.z)), _1074);
        float3 _3025 = float3(_1102, _1098, float(int(_1094)));
        float3 _3027 = select(_3025, float3(0.0), isnan(_3025));
        float _1110 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3027.xy, uint(rint(_3027.z)), _1074);
        float3 _3036 = float3(_1100, _1034, float(int(_1094)));
        float3 _3038 = select(_3036, float3(0.0), isnan(_3036));
        float _1112 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3038.xy, uint(rint(_3038.z)), _1074);
        float3 _3047 = float3(_1070, _1034, float(int(_1094)));
        float3 _3049 = select(_3047, float3(0.0), isnan(_3047));
        float _1114 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3049.xy, uint(rint(_3049.z)), _1074);
        float3 _3058 = float3(_1102, _1034, float(int(_1094)));
        float3 _3060 = select(_3058, float3(0.0), isnan(_3058));
        float _1116 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3060.xy, uint(rint(_3060.z)), _1074);
        float3 _3069 = float3(_1100, _1104, float(int(_1094)));
        float3 _3071 = select(_3069, float3(0.0), isnan(_3069));
        float _1118 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3071.xy, uint(rint(_3071.z)), _1074);
        float3 _3080 = float3(_1070, _1104, float(int(_1094)));
        float3 _3082 = select(_3080, float3(0.0), isnan(_3080));
        float _1120 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3082.xy, uint(rint(_3082.z)), _1074);
        float3 _3091 = float3(_1102, _1104, float(int(_1094)));
        float3 _3093 = select(_3091, float3(0.0), isnan(_3091));
        float _1122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3093.xy, uint(rint(_3093.z)), _1074);
        float _1124 = _1108 + _1106;
        float _1126 = _1124 + _1110;
        float _1128 = _1126 + _1112;
        float _1130 = _1128 + _1114;
        float _1132 = _1130 + _1116;
        float _1134 = _1132 + _1118;
        float _1136 = _1134 + _1120;
        float _1138 = _1136 + _1122;
        float _1140 = _1138 * 0.111111111938953399658203125;
        _1142 = _1140;
        _1144 = true;
    }
    else
    {
        float _1146 = rint(_606);
        float _1148 = precise::max(_1146, 0.0);
        uint _1150 = uint(_1148);
        uint _1152 = clamp(_1150, 0u, 65535u);
        float3 _3140 = float3(_1070, _1034, float(int(_1152)));
        float3 _3142 = select(_3140, float3(0.0), isnan(_3140));
        float _1154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3142.xy, uint(rint(_3142.z)), _1074);
        _1142 = _1154;
    }
    _1144 = false;
    float _1156 = _1142;
    float _1158 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1160 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1162 = -_153;
    float _1164 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1166 = _1162 + _1164;
    float _1168 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1158);
    float _1170 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1160);
    float _1172 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1168);
    float _1174 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1170);
    float _1176 = _1172 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1178 = _1174 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1180 = trunc(_1176);
    int _1182 = int(_1180);
    float _1184 = trunc(_1178);
    int _1186 = int(_1184);
    int _1188 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1190 = _1182 + _1188;
    int _1192 = _1190 + 1;
    bool _1194 = _1192 >= 0;
    int _1196 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1198 = _1186 + _1196;
    int _1200 = _1198 + 1;
    float _1202 = -_153;
    float _1204 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1206 = _1202 + _1204;
    bool _1208 = _1192 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1210 = !_1194;
    bool _1212 = _1208 || _1210;
    bool _1214 = _1200 < 0;
    bool _1216 = _1214 || _1212;
    bool _1218 = _1200 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1220 = _1218 || _1216;
    if (_1220)
    {
        _275 = 1.0;
    }
    float _1222 = _275;
    float _1224 = _1222;
    if (!_1220)
    {
        int _1226 = _1200 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1228 = _1226 + _1192;
        float _1230 = floor(_1178);
        int _1232 = _1228 << 2;
        int _1234 = _1228 >> 2;
        int _1236 = 12 & _1232;
        int _1238 = _1234 << 4;
        int _1240 = _1238 + _1236;
        float _1242 = floor(_1176);
        uint _1244 = uint(int(uint(_1240) >> uint(2)));
        uint _1246 = uint(int(uint(int(_1244)) >> uint(2)));
        int _1248 = int(_1244) & 3;
        float _1250 = (*spvDescriptorSet0.fp_c5)._m0[int(_1246)][_1248];
        float _1252 = -_1230;
        float _1254 = _1178 + _1252;
        float _1256 = -_1242;
        float _1258 = _1176 + _1256;
        float _1260 = rint(_1250);
        float _1262 = precise::max(_1260, 0.0);
        uint _1264 = uint(_1262);
        uint _1266 = clamp(_1264, 0u, 65535u);
        float3 _3327 = float3(_1258, _1254, float(int(_1266)));
        float3 _3329 = select(_3327, float3(0.0), isnan(_3327));
        float _1268 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3329.xy, uint(rint(_3329.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3329.xy, uint(rint(_3329.z)), level(0.0)).x;
        int _1270 = _1228 << 4;
        int _1272 = _1270 + 1648;
        int _1274 = _1240 + 8048;
        uint _1276 = uint(int(uint(_1274) >> uint(2)));
        uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
        int _1280 = int(_1276) & 3;
        float _1282 = (*spvDescriptorSet0.fp_c5)._m0[int(_1278)][_1280];
        uint _1284 = uint(int(uint(_1272) >> uint(2)));
        uint _1286 = uint(int(uint(int(_1284)) >> uint(2)));
        int _1288 = int(_1284) & 3;
        float _1290 = (*spvDescriptorSet0.fp_c5)._m0[int(_1286)][_1288];
        int _1292 = int(_1284) + 1;
        uint _1294 = uint(int(uint(_1292) >> uint(2)));
        int _1296 = _1292 & 3;
        float _1298 = (*spvDescriptorSet0.fp_c5)._m0[int(_1294)][_1296];
        int _1300 = _1272 + 8;
        uint _1302 = uint(int(uint(_1300) >> uint(2)));
        uint _1304 = uint(int(uint(int(_1302)) >> uint(2)));
        int _1306 = int(_1302) & 3;
        float _1308 = (*spvDescriptorSet0.fp_c5)._m0[int(_1304)][_1306];
        int _1310 = int(_1302) + 1;
        uint _1312 = uint(int(uint(_1310) >> uint(2)));
        int _1314 = _1310 & 3;
        float _1316 = (*spvDescriptorSet0.fp_c5)._m0[int(_1312)][_1314];
        float _1318 = _1282 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1320 = _542 * _1298;
        float _1322 = fma(_538, _1290, _1320);
        float _1324 = 1.0 / _1282;
        float _1326 = fma(_540, _1308, _1322);
        float _1328 = _1326 + _1316;
        float _1330 = precise::clamp(_1328, 0.0, 1.0);
        float _1332 = -_1330;
        float _1334 = _1332 + _1268;
        float _1336 = fma(_1324, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1334);
        float _1338 = _1318 * _1336;
        float _1340 = exp2(_1338);
        float _1342 = 0.0 + _1340;
        float _1344 = precise::clamp(_1342, 0.0, 1.0);
        _1224 = _1344;
    }
    float _1346 = _1224;
    float _1348 = precise::min(_1346, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1350 = _1206 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1352 = precise::clamp(_1350, 0.0, 1.0);
    float _1354 = -_1156;
    float _1356 = _1354 + 1.0;
    float _1358 = _1166 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1360 = precise::clamp(_1358, 0.0, 1.0);
    float _1362 = -_1348;
    float _1364 = _1362 + 1.0;
    float _1366 = fma(_1352, _1356, _1156);
    float _1368 = fma(_1360, _1364, _1348);
    out.m_62.x = _1366;
    out.m_62.y = _1368;
    out.m_62.z = _1086;
    out.m_62.w = _1084;
    out.m_64.x = _1082;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

