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
    texture2d<float> fp_t_tcb_1A [[id(13)]];
    sampler fp_t_tcb_1ASmplr [[id(14)]];
    texture2d<float> fp_t_tcb_10 [[id(15)]];
    sampler fp_t_tcb_10Smplr [[id(16)]];
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
    bool _1190 = false;
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
    float2 _1453 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1453, float2(0.0), isnan(_1453))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1453, float2(0.0), isnan(_1453))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1468 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1468, float2(0.0), isnan(_1468))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1468, float2(0.0), isnan(_1468))).x;
    float2 _1476 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1476, float2(0.0), isnan(_1476))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1476, float2(0.0), isnan(_1476))).x;
    float _105 = in.m_59.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_61.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_61.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_59.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_63.x;
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
    float _167 = 1.0 / _161;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _171 = _157 * _169;
    float _173 = 1.0 / _165;
    float _175 = _171 * _141;
    float _177 = _171 * _147;
    float _179 = _175 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _181 = _175 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _183 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _185 = _167 * _183;
    float _187 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[32].x, _179);
    float _189 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[30].x, _181);
    float _191 = -_177;
    float _193 = fma(_185, _143, _191);
    float _195 = -_175;
    float _197 = fma(_185, _145, _195);
    float _199 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[32].z, _187);
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _203 = _173 * _201;
    float _205 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[30].z, _189);
    float _207 = -_171;
    float _209 = _207 + _185;
    float _211 = _199 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _213 = -_177;
    float _215 = fma(_203, _149, _213);
    float _217 = _205 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _219 = -_175;
    float _221 = fma(_203, _151, _219);
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _225 = _211 + _223;
    float _227 = -_171;
    float _229 = _227 + _203;
    float _231 = _209 * _215;
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _235 = _217 + _233;
    float _237 = _225 * _225;
    float _239 = _197 * _229;
    float _241 = -_231;
    float _243 = fma(_193, _229, _241);
    float _245 = _193 * _221;
    float _247 = fma(_235, _235, _237);
    float _249 = -_239;
    float _251 = fma(_209, _221, _249);
    float _253 = _243 * _243;
    float _255 = -_245;
    float _257 = fma(_197, _215, _255);
    float _259 = sqrt(_247);
    float _261 = _175 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _263 = fma(_251, _251, _253);
    float _265 = fma(_257, _257, _263);
    float _267 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[31].x, _261);
    float _269 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[31].z, _267);
    float _271 = rsqrt(_265);
    float _273 = _269 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _277 = _259 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _279 = _251 * _271;
    float _281 = _243 * _271;
    float _283 = _257 * _271;
    float _285 = _269;
    float _287 = _215;
    float _289 = _211;
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
        float _329 = _225 * _309;
        float _331 = -_235;
        float _333 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[41].z, _331);
        float _335 = -_225;
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
    float2 _2164 = float2(_91, _93);
    float2 _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2164, float2(0.0), isnan(_2164))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2164, float2(0.0), isnan(_2164))).xy;
    float _564 = _562.x;
    float _566 = _562.y;
    float _568 = fma(_554, 6.2500002968590706586837768554688e-05, 0.5);
    float _570 = fma(_556, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2182 = float2(_568, _570);
    float _572 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2182, float2(0.0), isnan(_2182))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2182, float2(0.0), isnan(_2182))).x;
    float _574 = _281 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _576 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _578 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _580 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].x, _574);
    float _582 = floor(_576);
    float _584 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[35].z, _580);
    float _586 = -_584;
    float _588 = fma(_586, _584, 1.0);
    float _590 = -_584;
    float _592 = fma(_590, (*spvDescriptorSet0.fp_c3)._m0[35].z, _283);
    float _594 = floor(_578);
    float _596 = -_584;
    float _598 = fma(_596, (*spvDescriptorSet0.fp_c3)._m0[35].x, _279);
    float _600 = _588 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _602 = -_584;
    float _604 = fma(_602, (*spvDescriptorSet0.fp_c3)._m0[35].y, _281);
    float _606 = fma(_592, _600, _171);
    float _608 = -_582;
    float _610 = _576 + _608;
    float _612 = fma(_604, _600, _175);
    float _614 = fma(_598, _600, _177);
    float _616 = -_606;
    bool _618 = _616 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _624 = _610 + _622;
    float _626 = -_606;
    bool _628 = _626 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _630 = float(_628);
    float _632 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _634 = -_594;
    float _636 = _578 + _634;
    float _638 = -_624;
    float _640 = _638 + 1.0;
    float _642 = _620 + _630;
    float _644 = abs(_171);
    float _646 = log2(_644);
    float _648 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _650 = _636 + _648;
    float _652 = precise::min(_642, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _654 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _656 = -_650;
    float _658 = _656 + 1.0;
    float _660 = _650 * _624;
    float _662 = _650 * _640;
    float _664 = trunc(_652);
    int _666 = int(_664);
    float _668 = _624 * _658;
    float _670 = _658 * _640;
    float _672 = precise::max(0.0, _654);
    float _674 = _646 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _676 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _678 = exp2(_674);
    int _680 = _666 << 6;
    bool _682 = _666 != 0;
    uint _685 = uint(int(uint(_680) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = int(_685) + 1;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    int _697 = _693 & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    float _701 = fma(_678, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _703 = precise::clamp(_701, 0.0, 1.0);
    float _705 = _703 * _703;
    float _707 = fma(_703, -2.0, 3.0);
    float _709 = _705 * _707;
    float _711 = -_709;
    float _713 = _711 + 1.0;
    float _715 = fma(_713, (*spvDescriptorSet0.fp_c3)._m0[44].w, _709);
    float _717 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _719 = _715 * _672;
    float _721 = _612 * _699;
    float _723 = fma(_614, _691, _721);
    float _725 = fma(_564, 2.0, -1.0);
    float _727 = fma(_566, 2.0, -1.0);
    float _729 = _725 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _731 = _727 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _733 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float2 _2452 = float2(_632, _717);
    float4 _736 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2452, float2(0.0), isnan(_2452)), int2(0), component::x).xyzw;
    float _738 = _736.x;
    float _740 = _736.y;
    float _742 = _736.z;
    float _744 = _736.w;
    float _746 = fma(_729, 2.0, _91);
    float _748 = fma(_731, 2.0, _93);
    int _750 = _680 + 16;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.fp_c3)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.fp_c3)._m0[int(_762)][_764];
    float2 _2505 = float2(_568, _570);
    float _768 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2505, float2(0.0), isnan(_2505)), level(_572)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2505, float2(0.0), isnan(_2505)), level(_572)).x;
    float2 _2514 = float2(_733, _676);
    float _770 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2514, float2(0.0), isnan(_2514))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2514, float2(0.0), isnan(_2514))).x;
    float2 _2522 = float2(_632, _717);
    float4 _772 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2522, float2(0.0), isnan(_2522)), int2(0), component::x).xyzw;
    float _774 = _772.x;
    float _776 = _772.y;
    float _778 = _772.z;
    float _780 = _772.w;
    float2 _2538 = float2(_632, _717);
    float4 _782 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2538, float2(0.0), isnan(_2538)), int2(0), component::w).xyzw;
    float _784 = _782.x;
    float _786 = _782.y;
    float _788 = _782.z;
    float _790 = _782.w;
    float2 _2554 = float2(_746, _748);
    float2 _792 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2554, float2(0.0), isnan(_2554))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2554, float2(0.0), isnan(_2554))).yz;
    float _794 = _792.x;
    float _796 = _792.y;
    float _798 = _612 * _766;
    float _800 = fma(_614, _758, _798);
    float _802 = -_738;
    float _804 = fma(_802, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _806 = -_740;
    float _808 = fma(_806, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _810 = precise::min(_171, -1.0000000116860974230803549289703e-07);
    float _812 = -_742;
    float _814 = fma(_812, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _816 = -_744;
    float _818 = fma(_816, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _820 = 1.0 / _804;
    float _822 = abs(_768);
    float _824 = _822 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _826 = -_770;
    float _828 = _826 + 1.0;
    float _830 = 1.0 / _808;
    float _832 = 1.0 / _814;
    float _834 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _836 = -_171;
    float _838 = fma(_820, _834, _836);
    float _840 = 1.0 / _810;
    float _842 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _844 = -_171;
    float _846 = fma(_830, _842, _844);
    float _848 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _850 = -_171;
    float _852 = fma(_832, _848, _850);
    float _854 = 1.0 / _818;
    float _856 = _840 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _858 = abs(_846);
    float _860 = _858 * _856;
    float _862 = abs(_852);
    float _864 = _862 * _856;
    int _866 = _680 + 32;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    uint _870 = uint(int(uint(int(_868)) >> uint(2)));
    int _872 = int(_868) & 3;
    float _874 = (*spvDescriptorSet0.fp_c3)._m0[int(_870)][_872];
    int _876 = int(_868) + 1;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    int _880 = _876 & 3;
    float _882 = (*spvDescriptorSet0.fp_c3)._m0[int(_878)][_880];
    float _884 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _886 = -_171;
    float _888 = fma(_854, _884, _886);
    float _890 = abs(_838);
    float _892 = _890 * _856;
    float _894 = abs(_888);
    float _896 = _894 * _856;
    float _898 = exp2(_892);
    float _900 = exp2(_860);
    float _902 = abs(_668);
    float _904 = _902 * _898;
    float _906 = exp2(_896);
    float _908 = abs(_660);
    float _910 = _908 * _900;
    float _912 = _904 + _910;
    float _914 = abs(_670);
    float _916 = _914 * _906;
    float _918 = _612 * _882;
    float _920 = fma(_614, _874, _918);
    int _922 = _680 + 48;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.fp_c3)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.fp_c3)._m0[int(_934)][_936];
    float _940 = _612 * _938;
    float _942 = fma(_614, _930, _940);
    int _944 = _680 + 8;
    uint _946 = uint(int(uint(_944) >> uint(2)));
    uint _948 = uint(int(uint(int(_946)) >> uint(2)));
    int _950 = int(_946) & 3;
    float _952 = (*spvDescriptorSet0.fp_c3)._m0[int(_948)][_950];
    int _954 = int(_946) + 1;
    uint _956 = uint(int(uint(_954) >> uint(2)));
    int _958 = _954 & 3;
    float _960 = (*spvDescriptorSet0.fp_c3)._m0[int(_956)][_958];
    float _962 = fma(_606, _952, _723);
    float _964 = _962 + _960;
    int _966 = _680 + 24;
    uint _968 = uint(int(uint(_966) >> uint(2)));
    uint _970 = uint(int(uint(int(_968)) >> uint(2)));
    int _972 = int(_968) & 3;
    float _974 = (*spvDescriptorSet0.fp_c3)._m0[int(_970)][_972];
    int _976 = int(_968) + 1;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    int _980 = _976 & 3;
    float _982 = (*spvDescriptorSet0.fp_c3)._m0[int(_978)][_980];
    float _984 = fma(_606, _974, _800);
    float _986 = exp2(_864);
    float _988 = _984 + _982;
    int _990 = _680 + 40;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    uint _994 = uint(int(uint(int(_992)) >> uint(2)));
    int _996 = int(_992) & 3;
    float _998 = (*spvDescriptorSet0.fp_c3)._m0[int(_994)][_996];
    int _1000 = int(_992) + 1;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    int _1004 = _1000 & 3;
    float _1006 = (*spvDescriptorSet0.fp_c3)._m0[int(_1002)][_1004];
    float _1008 = abs(_662);
    float _1010 = _1008 * _986;
    float _1012 = _1010 + _912;
    float _1014 = _916 + _1012;
    float _1016 = -_916;
    bool _1018 = _1012 != _1016;
    bool _1020 = isnan(_1012);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(_1016);
    bool _1026 = _1022 || _1024;
    float _1028 = 1.0 / _1014;
    float _1030 = _910 * _1028;
    float _1032 = _904 * _1028;
    float _1034 = _1010 * _1028;
    float _1036 = _916 * _1028;
    float _1038 = _1026 ? _1030 : 0.25;
    float _1040 = fma(_606, _998, _920);
    float _1042 = _1026 ? _1032 : 0.25;
    float _1044 = _1026 ? _1036 : 0.25;
    float _1046 = _1040 + _1006;
    int _1048 = _680 + 56;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.fp_c3)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.fp_c3)._m0[int(_1060)][_1062];
    float _1066 = fma(_606, _1056, _942);
    bool _1068 = _171 >= (-8000.0);
    bool _1070 = isnan(_171);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(-8000.0);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    float _1080 = _1038 * _776;
    float _1082 = _1066 + _1064;
    float _1084 = _1038 * _786;
    float _1086 = _1078 * _719;
    float _1088 = _1026 ? _1034 : 0.25;
    float _1090 = 1.0 / _1082;
    float _1092 = fma(_1042, _774, _1080);
    float _1094 = fma(_1042, _784, _1084);
    float _1096 = _1086 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1098 = -_824;
    float _1100 = fma(_1078, _1098, 1.0);
    float _1102 = fma(_1088, _778, _1092);
    float _1104 = fma(_1088, _788, _1094);
    float _1106 = _828 * _1096;
    float _1108 = precise::clamp(_1106, 0.0, 1.0);
    float _1110 = fma(_1044, _780, _1102);
    float _1112 = fma(_1044, _790, _1104);
    float _1114 = -_1108;
    float _1116 = fma(_1114, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1118 = precise::min(_1100, 1.0);
    float _1120 = precise::min(_1110, 1.0);
    float _1122 = _964 * _1090;
    float _1124 = _988 * _1090;
    float _1126 = _1046 * _1090;
    float _1128 = precise::clamp(_1126, 0.0, 1.0);
    float _1130 = precise::min(_1118, _1116);
    float _1132 = precise::min(_1112, 1.0);
    float _1188;
    if (!_682)
    {
        float _1134 = rint(_652);
        float _1136 = precise::max(_1134, 0.0);
        uint _1138 = uint(_1136);
        uint _1140 = clamp(_1138, 0u, 65535u);
        float _1142 = _1128 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1144 = fma(_1142, 0.5, _1124);
        float _1146 = fma(_1142, 0.5, _1122);
        float _1148 = fma(_1142, -0.5, _1122);
        float _1150 = fma(_1142, -0.5, _1124);
        float3 _3110 = float3(_1122, _1144, float(int(_1140)));
        float3 _3114 = select(_3110, float3(0.0), isnan(_3110));
        float _1152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3114.xy, uint(rint(_3114.z)), _1128);
        float3 _3123 = float3(_1146, _1144, float(int(_1140)));
        float3 _3125 = select(_3123, float3(0.0), isnan(_3123));
        float _1154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3125.xy, uint(rint(_3125.z)), _1128);
        float3 _3134 = float3(_1148, _1144, float(int(_1140)));
        float3 _3136 = select(_3134, float3(0.0), isnan(_3134));
        float _1156 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3136.xy, uint(rint(_3136.z)), _1128);
        float3 _3145 = float3(_1146, _1124, float(int(_1140)));
        float3 _3147 = select(_3145, float3(0.0), isnan(_3145));
        float _1158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3147.xy, uint(rint(_3147.z)), _1128);
        float3 _3156 = float3(_1122, _1124, float(int(_1140)));
        float3 _3158 = select(_3156, float3(0.0), isnan(_3156));
        float _1160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3158.xy, uint(rint(_3158.z)), _1128);
        float3 _3167 = float3(_1148, _1124, float(int(_1140)));
        float3 _3169 = select(_3167, float3(0.0), isnan(_3167));
        float _1162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3169.xy, uint(rint(_3169.z)), _1128);
        float3 _3178 = float3(_1146, _1150, float(int(_1140)));
        float3 _3180 = select(_3178, float3(0.0), isnan(_3178));
        float _1164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3180.xy, uint(rint(_3180.z)), _1128);
        float3 _3189 = float3(_1122, _1150, float(int(_1140)));
        float3 _3191 = select(_3189, float3(0.0), isnan(_3189));
        float _1166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3191.xy, uint(rint(_3191.z)), _1128);
        float3 _3200 = float3(_1148, _1150, float(int(_1140)));
        float3 _3202 = select(_3200, float3(0.0), isnan(_3200));
        float _1168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3202.xy, uint(rint(_3202.z)), _1128);
        float _1170 = _1154 + _1152;
        float _1172 = _1170 + _1156;
        float _1174 = _1172 + _1158;
        float _1176 = _1174 + _1160;
        float _1178 = _1176 + _1162;
        float _1180 = _1178 + _1164;
        float _1182 = _1180 + _1166;
        float _1184 = _1182 + _1168;
        float _1186 = _1184 * 0.111111111938953399658203125;
        _1188 = _1186;
        _1190 = true;
    }
    else
    {
        float _1192 = rint(_652);
        float _1194 = precise::max(_1192, 0.0);
        uint _1196 = uint(_1194);
        uint _1198 = clamp(_1196, 0u, 65535u);
        float3 _3249 = float3(_1122, _1124, float(int(_1198)));
        float3 _3251 = select(_3249, float3(0.0), isnan(_3249));
        float _1200 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3251.xy, uint(rint(_3251.z)), _1128);
        _1188 = _1200;
    }
    _1190 = false;
    float _1202 = _1188;
    float _1204 = _558 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1206 = _558 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1208 = fma(_554, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1204);
    float _1210 = fma(_554, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1206);
    float _1212 = fma(_556, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1208);
    float _1214 = fma(_556, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1210);
    float _1216 = _1212 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1218 = _1214 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1220 = trunc(_1216);
    int _1222 = int(_1220);
    float _1224 = trunc(_1218);
    int _1226 = int(_1224);
    int _1228 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1230 = _1222 + _1228;
    int _1232 = _1230 + 1;
    float _1234 = -_171;
    float _1236 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1238 = _1234 + _1236;
    bool _1240 = _1232 >= 0;
    int _1242 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1244 = _1226 + _1242;
    int _1246 = _1244 + 1;
    float _1248 = -_171;
    float _1250 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1252 = _1248 + _1250;
    bool _1254 = _1232 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1256 = !_1240;
    bool _1258 = _1254 || _1256;
    bool _1260 = _1246 < 0;
    bool _1262 = _1260 || _1258;
    bool _1264 = _1246 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1266 = _1264 || _1262;
    if (_1266)
    {
        _291 = 1.0;
    }
    float _1268 = _291;
    float _1270 = _1268;
    if (!_1266)
    {
        int _1272 = _1246 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1274 = _1272 + _1232;
        float _1276 = floor(_1218);
        int _1278 = _1274 << 2;
        int _1280 = _1274 >> 2;
        int _1282 = 12 & _1278;
        int _1284 = _1280 << 4;
        int _1286 = _1284 + _1282;
        float _1288 = floor(_1216);
        uint _1290 = uint(int(uint(_1286) >> uint(2)));
        uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
        int _1294 = int(_1290) & 3;
        float _1296 = (*spvDescriptorSet0.fp_c5)._m0[int(_1292)][_1294];
        float _1298 = -_1276;
        float _1300 = _1218 + _1298;
        float _1302 = -_1288;
        float _1304 = _1216 + _1302;
        float _1306 = rint(_1296);
        float _1308 = precise::max(_1306, 0.0);
        uint _1310 = uint(_1308);
        uint _1312 = clamp(_1310, 0u, 65535u);
        float3 _3436 = float3(_1304, _1300, float(int(_1312)));
        float3 _3438 = select(_3436, float3(0.0), isnan(_3436));
        float _1314 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3438.xy, uint(rint(_3438.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3438.xy, uint(rint(_3438.z)), level(0.0)).x;
        int _1316 = _1274 << 4;
        int _1318 = _1316 + 1648;
        int _1320 = _1286 + 8048;
        uint _1322 = uint(int(uint(_1320) >> uint(2)));
        uint _1324 = uint(int(uint(int(_1322)) >> uint(2)));
        int _1326 = int(_1322) & 3;
        float _1328 = (*spvDescriptorSet0.fp_c5)._m0[int(_1324)][_1326];
        uint _1330 = uint(int(uint(_1318) >> uint(2)));
        uint _1332 = uint(int(uint(int(_1330)) >> uint(2)));
        int _1334 = int(_1330) & 3;
        float _1336 = (*spvDescriptorSet0.fp_c5)._m0[int(_1332)][_1334];
        int _1338 = int(_1330) + 1;
        uint _1340 = uint(int(uint(_1338) >> uint(2)));
        int _1342 = _1338 & 3;
        float _1344 = (*spvDescriptorSet0.fp_c5)._m0[int(_1340)][_1342];
        int _1346 = _1318 + 8;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        uint _1350 = uint(int(uint(int(_1348)) >> uint(2)));
        int _1352 = int(_1348) & 3;
        float _1354 = (*spvDescriptorSet0.fp_c5)._m0[int(_1350)][_1352];
        int _1356 = int(_1348) + 1;
        uint _1358 = uint(int(uint(_1356) >> uint(2)));
        int _1360 = _1356 & 3;
        float _1362 = (*spvDescriptorSet0.fp_c5)._m0[int(_1358)][_1360];
        float _1364 = _1328 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1366 = _558 * _1344;
        float _1368 = fma(_554, _1336, _1366);
        float _1370 = 1.0 / _1328;
        float _1372 = fma(_556, _1354, _1368);
        float _1374 = _1372 + _1362;
        float _1376 = precise::clamp(_1374, 0.0, 1.0);
        float _1378 = -_1376;
        float _1380 = _1378 + _1314;
        float _1382 = fma(_1370, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1380);
        float _1384 = _1364 * _1382;
        float _1386 = exp2(_1384);
        float _1388 = 0.0 + _1386;
        float _1390 = precise::clamp(_1388, 0.0, 1.0);
        _1270 = _1390;
    }
    float _1392 = _1270;
    float _1394 = precise::min(_1392, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1396 = -_1202;
    float _1398 = _1396 + 1.0;
    float _1400 = _1252 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1402 = precise::clamp(_1400, 0.0, 1.0);
    float _1404 = _1238 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1406 = precise::clamp(_1404, 0.0, 1.0);
    float _1408 = -_1394;
    float _1410 = _1408 + 1.0;
    float _1412 = fma(_1402, _1398, _1202);
    float _1414 = fma(_1406, _1410, _1394);
    out.m_66.x = _1412;
    out.m_66.y = _1414;
    out.m_66.z = _1132;
    out.m_66.w = _1130;
    out.m_68.x = _1120;
    out.m_68.y = _794;
    out.m_68.z = _796;
    out.m_68.w = 1.0;
    return out;
}

