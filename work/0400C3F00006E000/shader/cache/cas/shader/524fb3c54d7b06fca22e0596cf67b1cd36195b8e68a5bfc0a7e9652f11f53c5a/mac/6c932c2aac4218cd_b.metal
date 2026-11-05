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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_18 [[id(7)]];
    sampler fp_t_tcb_18Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_16 [[id(11)]];
    sampler fp_t_tcb_16Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_1A [[id(15)]];
    sampler fp_t_tcb_1ASmplr [[id(16)]];
    texture2d<float> fp_t_tcb_14 [[id(17)]];
    sampler fp_t_tcb_14Smplr [[id(18)]];
    texture2d_array<float> fp_t_tcb_C [[id(19)]];
    sampler fp_t_tcb_CSmplr [[id(20)]];
    texture2d_array<float> fp_t_tcb_E [[id(21)]];
    sampler fp_t_tcb_ESmplr [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_ASmplr_w [[id(24)]];
    sampler fp_t_tcb_18Smplr_w [[id(25)]];
    sampler fp_t_tcb_16Smplr_w [[id(26)]];
    sampler fp_t_tcb_1ASmplr_w [[id(27)]];
    sampler fp_t_tcb_14Smplr_w [[id(28)]];
    sampler fp_t_tcb_ESmplr_w [[id(29)]];
    constant dm_border_t* dm_border [[id(30)]];
};

struct main0_out
{
    float4 m_66 [[color(0)]];
    float4 m_68 [[color(1)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1170 = false;
    float _75 = gl_FragCoord.w;
    float _77 = in.m_57.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_57.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _75;
    float _91 = _89 * _81;
    float _93 = _89 * _87;
    float _95 = _91 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1433 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1433, float2(0.0), isnan(_1433))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1433, float2(0.0), isnan(_1433))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1448 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1448, float2(0.0), isnan(_1448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1448, float2(0.0), isnan(_1448))).x;
    float2 _1456 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1456, float2(0.0), isnan(_1456))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1456, float2(0.0), isnan(_1456))).x;
    float _105 = in.m_59.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_59.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_61.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_63.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_61.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_63.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _89 * _109;
    float _143 = _89 * _115;
    float _145 = _89 * _121;
    float _147 = _89 * _127;
    float _149 = _89 * _133;
    float _151 = _89 * _139;
    float _153 = -_97;
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _157 = 1.0 / _155;
    float _159 = -_101;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _163 = -_103;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _167 = 1.0 / _165;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _171 = _157 * _169;
    float _173 = 1.0 / _161;
    float _175 = _171 * _141;
    float _177 = _171 * _143;
    float _179 = _175 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _181 = _175 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _183 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[32].x, _179);
    float _185 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _187 = _167 * _185;
    float _189 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[30].x, _181);
    float _191 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[32].z, _183);
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _195 = _173 * _193;
    float _197 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[30].z, _189);
    float _199 = -_177;
    float _201 = fma(_187, _147, _199);
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _205 = -_177;
    float _207 = fma(_195, _149, _205);
    float _209 = -_175;
    float _211 = fma(_195, _145, _209);
    float _213 = -_171;
    float _215 = _213 + _195;
    float _217 = _197 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _221 = _203 + _219;
    float _223 = -_175;
    float _225 = fma(_187, _151, _223);
    float _227 = -_171;
    float _229 = _227 + _187;
    float _231 = _215 * _201;
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _235 = _217 + _233;
    float _237 = _221 * _221;
    float _239 = _211 * _229;
    float _241 = -_231;
    float _243 = fma(_207, _229, _241);
    float _245 = _207 * _225;
    float _247 = fma(_235, _235, _237);
    float _249 = -_239;
    float _251 = fma(_215, _225, _249);
    float _253 = _243 * _243;
    float _255 = -_245;
    float _257 = fma(_211, _201, _255);
    float _259 = sqrt(_247);
    float _261 = _175 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _263 = fma(_251, _251, _253);
    float _265 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[31].x, _261);
    float _267 = fma(_257, _257, _263);
    float _269 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[31].z, _265);
    float _271 = rsqrt(_267);
    float _273 = _269 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _277 = _259 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _279 = _251 * _271;
    float _281 = _243 * _271;
    float _283 = _257 * _271;
    float _285 = _269;
    float _287 = _271;
    float _289 = _203;
    float _291 = _171;
    if (!_277)
    {
        _285 = _217;
    }
    float _293 = _285;
    float _295 = _293;
    if (!_277)
    {
        _287 = _273;
    }
    float _297 = _287;
    bool _299 = !_277;
    float _301 = _297;
    if (!_299)
    {
        float _303 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _305 = _259 + _303;
        float _307 = _273 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _309 = rsqrt(_247);
        float _311 = -_273;
        float _313 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _315 = _311 + _313;
        float _317 = abs(_307);
        float _319 = abs(_305);
        float _321 = precise::max(_317, _319);
        float _323 = _315 * _315;
        bool _325 = _321 >= 16.0;
        float _327 = _235 * _309;
        float _329 = _221 * _309;
        float _331 = -_235;
        float _333 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[41].z, _331);
        float _335 = -_221;
        float _337 = fma(_329, (*spvDescriptorSet0.fp_c3)._m0[41].z, _335);
        float _339 = _305;
        float _341 = _307;
        int _344 = as_type<int>(_337);
        if (_325)
        {
            float _346 = _305 * 0.0625;
            _339 = _346;
        }
        float _348 = _339;
        if (_325)
        {
            float _350 = _307 * 0.0625;
            _341 = _350;
        }
        float _352 = _341;
        float _354 = fma(_333, _333, _323);
        float _356 = abs(_348);
        bool _358 = _356 != 0.0;
        bool _360 = isnan(_356);
        bool _362 = _358 || _360;
        bool _364 = isnan(0.0);
        bool _366 = _362 || _364;
        float _368 = fma(_337, _337, _354);
        float _370 = abs(_352);
        bool _372 = _370 == 0.0;
        float _374 = abs(_352);
        bool _376 = _374 == 0.0;
        bool _378 = !_366;
        bool _380 = _376 && _378;
        float _382 = sqrt(_368);
        bool _384 = false;
        if (_380)
        {
            bool _386 = as_type<int>(_352) >= 0;
            _384 = _386;
        }
        bool _388 = _384;
        int _390 = _388 ? (-1) : 0;
        if (_380)
        {
            int _392 = _388 ? 0 : 1078530011;
            _344 = _392;
        }
        int _394 = _344;
        int _396 = _394;
        if (_380)
        {
            int _398 = int(0x80000000) & as_type<int>(_348);
            int _400 = _394 | _398;
            _396 = _400;
        }
        int _402 = _396;
        bool _404 = !_366;
        bool _406 = _404 && _372;
        int _408 = _402;
        float _410 = as_type<float>(_402);
        if (!_406)
        {
            float _412 = abs(_348);
            bool _414 = _412 != as_type<float>(0x7f800000u /* inf */);
            bool _416 = isnan(_412);
            bool _418 = _414 || _416;
            bool _420 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _422 = _418 || _420;
            float _424 = abs(_352);
            bool _426 = _424 == as_type<float>(0x7f800000u /* inf */);
            float _428 = abs(_352);
            bool _430 = _428 == as_type<float>(0x7f800000u /* inf */);
            bool _432 = !_422;
            bool _434 = _430 && _432;
            if (_434)
            {
                bool _436 = as_type<int>(_352) >= 0;
                _390 = _436 ? (-1) : 0;
            }
            int _438 = _390;
            if (_434)
            {
                _408 = 1075235812;
            }
            int _440 = _408;
            int _442 = _440;
            if (_434)
            {
                int _444 = ~_438;
                int _446 = (_444 != 0) ? _440 : 1061752795;
                _442 = _446;
            }
            int _448 = _442;
            float _450 = as_type<float>(_448);
            if (_434)
            {
                int _452 = int(0x80000000) & as_type<int>(_348);
                int _454 = _448 | _452;
                _450 = as_type<float>(_454);
            }
            float _456 = _450;
            bool _458 = !_422;
            bool _460 = _458 && _426;
            _410 = _456;
            if (!_460)
            {
                float _462 = abs(_348);
                float _464 = abs(_352);
                float _466 = precise::max(_462, _464);
                float _468 = abs(_348);
                float _470 = abs(_352);
                float _472 = precise::min(_468, _470);
                float _474 = 1.0 / _466;
                float _476 = abs(_348);
                float _478 = abs(_352);
                bool _480 = _476 > _478;
                bool _482 = as_type<int>(_352) >= 0;
                float _484 = _472 * _474;
                float _486 = abs(_348);
                float _488 = abs(_352);
                float _490 = _486 + _488;
                int _492 = as_type<int>(_348) & int(0x80000000);
                float _494 = _484 * _484;
                bool _496 = _490 > as_type<float>(0x7f800000u /* inf */);
                bool _498 = isnan(_490);
                bool _500 = _496 || _498;
                bool _502 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _504 = _500 || _502;
                float _506 = _494 + 11.33538818359375;
                float _508 = fma(_494, _506, 28.84246826171875);
                float _510 = fma(_494, _508, 19.6966705322265625);
                float _512 = fma(_494, -0.82336294651031494140625, -5.674867153167724609375);
                float _514 = fma(_494, _512, -6.565555095672607421875);
                float _516 = 1.0 / _510;
                float _518 = _494 * _514;
                float _520 = _484 * _518;
                float _522 = fma(_520, _516, _484);
                float _524 = _522;
                _410 = _490;
                if (_480)
                {
                    float _526 = -_522;
                    float _528 = _526 + 1.57079637050628662109375;
                    _524 = _528;
                }
                float _530 = _524;
                int _532 = as_type<int>(_530);
                if (!_482)
                {
                    float _534 = -_530;
                    float _536 = _534 + 3.1415927410125732421875;
                    _532 = as_type<int>(_536);
                }
                int _538 = _532;
                if (!_504)
                {
                    int _540 = _492 | _538;
                    _410 = as_type<float>(_540);
                }
            }
        }
        float _542 = _410;
        float _544 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _546 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _548 = _382 + _546;
        float _550 = fma(_327, _544, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _552 = fma(_329, _544, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _295 = _550;
        _289 = _552;
        _301 = _548;
    }
    float _554 = _295;
    float _556 = _289;
    float _558 = _301;
    float2 _2144 = float2(_91, _93);
    float2 _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2144, float2(0.0), isnan(_2144))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2144, float2(0.0), isnan(_2144))).xy;
    float _564 = _562.x;
    float _566 = _562.y;
    float _568 = fma(_554, 6.2500002968590706586837768554688e-05, 0.5);
    float _570 = fma(_556, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2162 = float2(_568, _570);
    float _572 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2162, float2(0.0), isnan(_2162))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2162, float2(0.0), isnan(_2162))).x;
    float _574 = _281 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _576 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _578 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].x, _574);
    float _580 = floor(_576);
    float _582 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[35].z, _578);
    float _584 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _586 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _588 = -_582;
    float _590 = fma(_588, _582, 1.0);
    float _592 = floor(_584);
    float _594 = -_582;
    float _596 = fma(_594, (*spvDescriptorSet0.fp_c3)._m0[35].z, _283);
    float _598 = _590 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _600 = fma(_596, _598, _171);
    float _602 = -_580;
    float _604 = _576 + _602;
    float _606 = -_600;
    bool _608 = _606 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _614 = _604 + _612;
    float _616 = -_600;
    bool _618 = _616 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _620 = float(_618);
    float _622 = -_592;
    float _624 = _584 + _622;
    float _626 = _610 + _620;
    float _628 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _630 = _624 + _628;
    float _632 = -_614;
    float _634 = _632 + 1.0;
    float _636 = -_630;
    float _638 = _636 + 1.0;
    float _640 = _614 * _630;
    float _642 = precise::min(_626, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _644 = _630 * _634;
    float _646 = _614 * _638;
    float _648 = _634 * _638;
    float _650 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _652 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _654 = trunc(_642);
    int _656 = int(_654);
    float _658 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    int _660 = _656 << 6;
    uint _663 = uint(int(uint(_660) >> uint(2)));
    uint _665 = uint(int(uint(int(_663)) >> uint(2)));
    int _667 = int(_663) & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    int _671 = int(_663) + 1;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    int _675 = _671 & 3;
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[int(_673)][_675];
    float _679 = fma(_564, 2.0, -1.0);
    float _681 = fma(_566, 2.0, -1.0);
    float _683 = _679 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _685 = _681 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _687 = fma(_683, 2.0, _91);
    float _689 = fma(_685, 2.0, _93);
    float2 _2359 = float2(_650, _652);
    float4 _692 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2359, float2(0.0), isnan(_2359)), int2(0), component::x).xyzw;
    float _694 = _692.x;
    float _696 = _692.y;
    float _698 = _692.z;
    float _700 = _692.w;
    float2 _2375 = float2(_568, _570);
    float _702 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2375, float2(0.0), isnan(_2375)), level(_572)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2375, float2(0.0), isnan(_2375)), level(_572)).x;
    float2 _2384 = float2(_650, _652);
    float4 _704 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2384, float2(0.0), isnan(_2384)), int2(0), component::w).xyzw;
    float _706 = _704.x;
    float _708 = _704.y;
    float _710 = _704.z;
    float _712 = _704.w;
    float2 _2400 = float2(_658, _586);
    float _714 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2400, float2(0.0), isnan(_2400))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2400, float2(0.0), isnan(_2400))).x;
    float2 _2408 = float2(_687, _689);
    float2 _716 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2408, float2(0.0), isnan(_2408))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2408, float2(0.0), isnan(_2408))).yz;
    float _718 = _716.x;
    float _720 = _716.y;
    float _722 = -_582;
    float _724 = fma(_722, (*spvDescriptorSet0.fp_c3)._m0[35].x, _279);
    float _726 = -_582;
    float _728 = fma(_726, (*spvDescriptorSet0.fp_c3)._m0[35].y, _281);
    bool _730 = _656 != 0;
    int _732 = _660 + 16;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    uint _736 = uint(int(uint(int(_734)) >> uint(2)));
    int _738 = int(_734) & 3;
    float _740 = (*spvDescriptorSet0.fp_c3)._m0[int(_736)][_738];
    int _742 = int(_734) + 1;
    uint _744 = uint(int(uint(_742) >> uint(2)));
    int _746 = _742 & 3;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[int(_744)][_746];
    float _750 = fma(_724, _598, _177);
    float _752 = fma(_728, _598, _175);
    float _754 = _752 * _677;
    int _756 = _660 + 32;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    uint _760 = uint(int(uint(int(_758)) >> uint(2)));
    int _762 = int(_758) & 3;
    float _764 = (*spvDescriptorSet0.fp_c3)._m0[int(_760)][_762];
    int _766 = int(_758) + 1;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    int _770 = _766 & 3;
    float _772 = (*spvDescriptorSet0.fp_c3)._m0[int(_768)][_770];
    float _774 = fma(_750, _669, _754);
    int _776 = _660 + 48;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    uint _780 = uint(int(uint(int(_778)) >> uint(2)));
    int _782 = int(_778) & 3;
    float _784 = (*spvDescriptorSet0.fp_c3)._m0[int(_780)][_782];
    int _786 = int(_778) + 1;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    int _790 = _786 & 3;
    float _792 = (*spvDescriptorSet0.fp_c3)._m0[int(_788)][_790];
    float _794 = _752 * _748;
    float _796 = fma(_750, _740, _794);
    float _798 = abs(_171);
    float _800 = log2(_798);
    float _802 = _752 * _772;
    float _804 = fma(_750, _764, _802);
    int _806 = _660 + 8;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    uint _810 = uint(int(uint(int(_808)) >> uint(2)));
    int _812 = int(_808) & 3;
    float _814 = (*spvDescriptorSet0.fp_c3)._m0[int(_810)][_812];
    int _816 = int(_808) + 1;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    int _820 = _816 & 3;
    float _822 = (*spvDescriptorSet0.fp_c3)._m0[int(_818)][_820];
    float _824 = _800 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _826 = _752 * _792;
    float _828 = fma(_750, _784, _826);
    float _830 = exp2(_824);
    float _832 = fma(_830, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _834 = precise::clamp(_832, 0.0, 1.0);
    int _836 = _660 + 24;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    uint _840 = uint(int(uint(int(_838)) >> uint(2)));
    int _842 = int(_838) & 3;
    float _844 = (*spvDescriptorSet0.fp_c3)._m0[int(_840)][_842];
    int _846 = int(_838) + 1;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    int _850 = _846 & 3;
    float _852 = (*spvDescriptorSet0.fp_c3)._m0[int(_848)][_850];
    float _854 = fma(_834, -2.0, 3.0);
    float _856 = _834 * _834;
    float _858 = _856 * _854;
    float _860 = -_858;
    float _862 = _860 + 1.0;
    float _864 = fma(_862, (*spvDescriptorSet0.fp_c3)._m0[44].w, _858);
    float _866 = fma(_600, _814, _774);
    float _868 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _870 = _866 + _822;
    float _872 = precise::min(_171, -1.0000000116860974230803549289703e-07);
    float _874 = precise::max(0.0, _868);
    int _876 = _660 + 40;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    uint _880 = uint(int(uint(int(_878)) >> uint(2)));
    int _882 = int(_878) & 3;
    float _884 = (*spvDescriptorSet0.fp_c3)._m0[int(_880)][_882];
    int _886 = int(_878) + 1;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    int _890 = _886 & 3;
    float _892 = (*spvDescriptorSet0.fp_c3)._m0[int(_888)][_890];
    float _894 = _864 * _874;
    float _896 = fma(_600, _844, _796);
    float _898 = 1.0 / _872;
    float _900 = _896 + _852;
    float _902 = _898 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _904 = fma(_600, _884, _804);
    float _906 = _904 + _892;
    float _908 = -_694;
    float _910 = fma(_908, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _912 = -_696;
    float _914 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _916 = -_698;
    float _918 = fma(_916, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _920 = -_700;
    float _922 = fma(_920, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _924 = 1.0 / _910;
    float _926 = abs(_702);
    float _928 = _926 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _930 = -_714;
    float _932 = _930 + 1.0;
    float _934 = 1.0 / _914;
    float _936 = 1.0 / _918;
    float _938 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _940 = -_171;
    float _942 = fma(_924, _938, _940);
    float _944 = abs(_942);
    float _946 = _944 * _902;
    float _948 = 1.0 / _922;
    float _950 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _952 = -_171;
    float _954 = fma(_934, _950, _952);
    float _956 = abs(_954);
    float _958 = _956 * _902;
    float _960 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _962 = -_171;
    float _964 = fma(_936, _960, _962);
    float _966 = exp2(_946);
    float _968 = abs(_964);
    float _970 = _968 * _902;
    float _972 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _974 = -_171;
    float _976 = fma(_948, _972, _974);
    float _978 = exp2(_958);
    float _980 = abs(_976);
    float _982 = _980 * _902;
    int _984 = _660 + 56;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    uint _988 = uint(int(uint(int(_986)) >> uint(2)));
    int _990 = int(_986) & 3;
    float _992 = (*spvDescriptorSet0.fp_c3)._m0[int(_988)][_990];
    int _994 = int(_986) + 1;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    int _998 = _994 & 3;
    float _1000 = (*spvDescriptorSet0.fp_c3)._m0[int(_996)][_998];
    float _1002 = exp2(_970);
    float _1004 = abs(_644);
    float _1006 = _1004 * _966;
    float _1008 = exp2(_982);
    float _1010 = abs(_640);
    float _1012 = _1010 * _978;
    float _1014 = _1006 + _1012;
    float _1016 = abs(_646);
    float _1018 = _1016 * _1002;
    float _1020 = _1018 + _1014;
    float _1022 = abs(_648);
    float _1024 = _1022 * _1008;
    float _1026 = _1024 + _1020;
    float _1028 = -_1024;
    bool _1030 = _1020 != _1028;
    bool _1032 = isnan(_1020);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(_1028);
    bool _1038 = _1034 || _1036;
    float _1040 = 1.0 / _1026;
    float _1042 = fma(_600, _992, _828);
    bool _1044 = _171 >= (-8000.0);
    bool _1046 = isnan(_171);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan(-8000.0);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = _1042 + _1000;
    float _1058 = _1012 * _1040;
    float _1060 = _1006 * _1040;
    float _1062 = _1018 * _1040;
    float _1064 = _1054 * _894;
    float _1066 = _1024 * _1040;
    float _1068 = _1038 ? _1058 : 0.25;
    float _1070 = -_928;
    float _1072 = fma(_1054, _1070, 1.0);
    float _1074 = _1038 ? _1060 : 0.25;
    float _1076 = _1064 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1078 = 1.0 / _1056;
    float _1080 = _1068 * _708;
    float _1082 = _1038 ? _1062 : 0.25;
    float _1084 = _932 * _1076;
    float _1086 = precise::clamp(_1084, 0.0, 1.0);
    float _1088 = _1038 ? _1066 : 0.25;
    float _1090 = fma(_1074, _706, _1080);
    float _1092 = precise::min(_1072, 1.0);
    float _1094 = -_1086;
    float _1096 = fma(_1094, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1098 = fma(_1082, _710, _1090);
    float _1100 = precise::min(_1092, _1096);
    float _1102 = fma(_1088, _712, _1098);
    float _1104 = _870 * _1078;
    float _1106 = _900 * _1078;
    float _1108 = _906 * _1078;
    float _1110 = precise::clamp(_1108, 0.0, 1.0);
    float _1112 = precise::min(_1102, 1.0);
    float _1168;
    if (!_730)
    {
        float _1114 = rint(_642);
        float _1116 = precise::max(_1114, 0.0);
        uint _1118 = uint(_1116);
        uint _1120 = clamp(_1118, 0u, 65535u);
        float _1122 = _1110 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1124 = fma(_1122, 0.5, _1106);
        float _1126 = fma(_1122, 0.5, _1104);
        float _1128 = fma(_1122, -0.5, _1104);
        float _1130 = fma(_1122, -0.5, _1106);
        float3 _3057 = float3(_1104, _1124, float(int(_1120)));
        float3 _3061 = select(_3057, float3(0.0), isnan(_3057));
        float _1132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3061.xy, uint(rint(_3061.z)), _1110);
        float3 _3070 = float3(_1126, _1124, float(int(_1120)));
        float3 _3072 = select(_3070, float3(0.0), isnan(_3070));
        float _1134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3072.xy, uint(rint(_3072.z)), _1110);
        float3 _3081 = float3(_1128, _1124, float(int(_1120)));
        float3 _3083 = select(_3081, float3(0.0), isnan(_3081));
        float _1136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3083.xy, uint(rint(_3083.z)), _1110);
        float3 _3092 = float3(_1126, _1106, float(int(_1120)));
        float3 _3094 = select(_3092, float3(0.0), isnan(_3092));
        float _1138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3094.xy, uint(rint(_3094.z)), _1110);
        float3 _3103 = float3(_1104, _1106, float(int(_1120)));
        float3 _3105 = select(_3103, float3(0.0), isnan(_3103));
        float _1140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3105.xy, uint(rint(_3105.z)), _1110);
        float3 _3114 = float3(_1128, _1106, float(int(_1120)));
        float3 _3116 = select(_3114, float3(0.0), isnan(_3114));
        float _1142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3116.xy, uint(rint(_3116.z)), _1110);
        float3 _3125 = float3(_1126, _1130, float(int(_1120)));
        float3 _3127 = select(_3125, float3(0.0), isnan(_3125));
        float _1144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3127.xy, uint(rint(_3127.z)), _1110);
        float3 _3136 = float3(_1104, _1130, float(int(_1120)));
        float3 _3138 = select(_3136, float3(0.0), isnan(_3136));
        float _1146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3138.xy, uint(rint(_3138.z)), _1110);
        float3 _3147 = float3(_1128, _1130, float(int(_1120)));
        float3 _3149 = select(_3147, float3(0.0), isnan(_3147));
        float _1148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3149.xy, uint(rint(_3149.z)), _1110);
        float _1150 = _1134 + _1132;
        float _1152 = _1150 + _1136;
        float _1154 = _1152 + _1138;
        float _1156 = _1154 + _1140;
        float _1158 = _1156 + _1142;
        float _1160 = _1158 + _1144;
        float _1162 = _1160 + _1146;
        float _1164 = _1162 + _1148;
        float _1166 = _1164 * 0.111111111938953399658203125;
        _1168 = _1166;
        _1170 = true;
    }
    else
    {
        float _1172 = rint(_642);
        float _1174 = precise::max(_1172, 0.0);
        uint _1176 = uint(_1174);
        uint _1178 = clamp(_1176, 0u, 65535u);
        float3 _3196 = float3(_1104, _1106, float(int(_1178)));
        float3 _3198 = select(_3196, float3(0.0), isnan(_3196));
        float _1180 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3198.xy, uint(rint(_3198.z)), _1110);
        _1168 = _1180;
    }
    _1170 = false;
    float _1182 = _1168;
    float _1184 = _558 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1186 = _558 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1188 = fma(_554, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1184);
    float _1190 = fma(_554, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1186);
    float _1192 = fma(_556, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1188);
    float _1194 = fma(_556, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1190);
    float _1196 = _1192 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1198 = _1194 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1200 = trunc(_1196);
    int _1202 = int(_1200);
    float _1204 = trunc(_1198);
    int _1206 = int(_1204);
    int _1208 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1210 = _1202 + _1208;
    int _1212 = _1210 + 1;
    float _1214 = -_171;
    float _1216 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1218 = _1214 + _1216;
    bool _1220 = _1212 >= 0;
    int _1222 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1224 = _1206 + _1222;
    int _1226 = _1224 + 1;
    float _1228 = -_171;
    float _1230 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1232 = _1228 + _1230;
    bool _1234 = _1212 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1236 = !_1220;
    bool _1238 = _1234 || _1236;
    bool _1240 = _1226 < 0;
    bool _1242 = _1240 || _1238;
    bool _1244 = _1226 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1246 = _1244 || _1242;
    if (_1246)
    {
        _291 = 1.0;
    }
    float _1248 = _291;
    float _1250 = _1248;
    if (!_1246)
    {
        int _1252 = _1226 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1254 = _1252 + _1212;
        float _1256 = floor(_1198);
        int _1258 = _1254 << 2;
        int _1260 = _1254 >> 2;
        int _1262 = 12 & _1258;
        int _1264 = _1260 << 4;
        int _1266 = _1264 + _1262;
        float _1268 = floor(_1196);
        uint _1270 = uint(int(uint(_1266) >> uint(2)));
        uint _1272 = uint(int(uint(int(_1270)) >> uint(2)));
        int _1274 = int(_1270) & 3;
        float _1276 = (*spvDescriptorSet0.fp_c5)._m0[int(_1272)][_1274];
        float _1278 = -_1256;
        float _1280 = _1198 + _1278;
        float _1282 = -_1268;
        float _1284 = _1196 + _1282;
        float _1286 = rint(_1276);
        float _1288 = precise::max(_1286, 0.0);
        uint _1290 = uint(_1288);
        uint _1292 = clamp(_1290, 0u, 65535u);
        float3 _3383 = float3(_1284, _1280, float(int(_1292)));
        float3 _3385 = select(_3383, float3(0.0), isnan(_3383));
        float _1294 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3385.xy, uint(rint(_3385.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3385.xy, uint(rint(_3385.z)), level(0.0)).x;
        int _1296 = _1254 << 4;
        int _1298 = _1296 + 1648;
        int _1300 = _1266 + 8048;
        uint _1302 = uint(int(uint(_1300) >> uint(2)));
        uint _1304 = uint(int(uint(int(_1302)) >> uint(2)));
        int _1306 = int(_1302) & 3;
        float _1308 = (*spvDescriptorSet0.fp_c5)._m0[int(_1304)][_1306];
        uint _1310 = uint(int(uint(_1298) >> uint(2)));
        uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
        int _1314 = int(_1310) & 3;
        float _1316 = (*spvDescriptorSet0.fp_c5)._m0[int(_1312)][_1314];
        int _1318 = int(_1310) + 1;
        uint _1320 = uint(int(uint(_1318) >> uint(2)));
        int _1322 = _1318 & 3;
        float _1324 = (*spvDescriptorSet0.fp_c5)._m0[int(_1320)][_1322];
        int _1326 = _1298 + 8;
        uint _1328 = uint(int(uint(_1326) >> uint(2)));
        uint _1330 = uint(int(uint(int(_1328)) >> uint(2)));
        int _1332 = int(_1328) & 3;
        float _1334 = (*spvDescriptorSet0.fp_c5)._m0[int(_1330)][_1332];
        int _1336 = int(_1328) + 1;
        uint _1338 = uint(int(uint(_1336) >> uint(2)));
        int _1340 = _1336 & 3;
        float _1342 = (*spvDescriptorSet0.fp_c5)._m0[int(_1338)][_1340];
        float _1344 = _1308 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1346 = _558 * _1324;
        float _1348 = fma(_554, _1316, _1346);
        float _1350 = 1.0 / _1308;
        float _1352 = fma(_556, _1334, _1348);
        float _1354 = _1352 + _1342;
        float _1356 = precise::clamp(_1354, 0.0, 1.0);
        float _1358 = -_1356;
        float _1360 = _1358 + _1294;
        float _1362 = fma(_1350, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1360);
        float _1364 = _1344 * _1362;
        float _1366 = exp2(_1364);
        float _1368 = 0.0 + _1366;
        float _1370 = precise::clamp(_1368, 0.0, 1.0);
        _1250 = _1370;
    }
    float _1372 = _1250;
    float _1374 = precise::min(_1372, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1376 = -_1182;
    float _1378 = _1376 + 1.0;
    float _1380 = _1218 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1382 = precise::clamp(_1380, 0.0, 1.0);
    float _1384 = _1232 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1386 = precise::clamp(_1384, 0.0, 1.0);
    float _1388 = -_1374;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_1382, _1378, _1182);
    float _1394 = fma(_1386, _1390, _1374);
    out.m_66.x = _1392;
    out.m_66.y = _1394;
    out.m_66.z = _1112;
    out.m_66.w = _1100;
    out.m_68.x = 1.0;
    out.m_68.y = _718;
    out.m_68.z = _720;
    out.m_68.w = 1.0;
    return out;
}

