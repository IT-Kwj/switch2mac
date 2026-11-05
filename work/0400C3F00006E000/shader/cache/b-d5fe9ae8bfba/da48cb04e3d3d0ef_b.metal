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
    float4 m_63 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1172 = false;
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
    float2 _1435 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1435, float2(0.0), isnan(_1435))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1435, float2(0.0), isnan(_1435))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1450 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1450, float2(0.0), isnan(_1450))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1450, float2(0.0), isnan(_1450))).x;
    float2 _1458 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1458, float2(0.0), isnan(_1458))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1458, float2(0.0), isnan(_1458))).x;
    float _105 = in.m_59.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_61.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_59.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_63.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_63.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_61.y;
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
    float _177 = _171 * _145;
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
    float _199 = -_175;
    float _201 = fma(_187, _151, _199);
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _205 = -_177;
    float _207 = fma(_195, _147, _205);
    float _209 = -_175;
    float _211 = fma(_195, _149, _209);
    float _213 = -_171;
    float _215 = _213 + _195;
    float _217 = _197 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _221 = _203 + _219;
    float _223 = -_177;
    float _225 = fma(_187, _143, _223);
    float _227 = -_171;
    float _229 = _227 + _187;
    float _231 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _233 = _217 + _231;
    float _235 = _221 * _221;
    float _237 = _215 * _225;
    float _239 = _211 * _229;
    float _241 = fma(_233, _233, _235);
    float _243 = -_237;
    float _245 = fma(_207, _229, _243);
    float _247 = -_239;
    float _249 = fma(_215, _201, _247);
    float _251 = _207 * _201;
    float _253 = sqrt(_241);
    float _255 = _245 * _245;
    float _257 = -_251;
    float _259 = fma(_211, _225, _257);
    float _261 = _175 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _263 = fma(_249, _249, _255);
    float _265 = fma(_259, _259, _263);
    float _267 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[31].x, _261);
    float _269 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[31].z, _267);
    float _271 = rsqrt(_265);
    bool _275 = _253 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _277 = _269 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _279 = _269;
    float _281 = _203;
    float _283 = _277;
    float _285 = _171;
    if (!_275)
    {
        _279 = _217;
    }
    float _287 = _279;
    float _289 = _249 * _271;
    float _291 = _245 * _271;
    float _293 = _259 * _271;
    bool _295 = !_275;
    float _297 = _287;
    if (!_295)
    {
        float _299 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _301 = _253 + _299;
        float _303 = _277 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _305 = rsqrt(_241);
        float _307 = -_277;
        float _309 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _311 = _307 + _309;
        float _313 = abs(_303);
        float _315 = abs(_301);
        float _317 = precise::max(_313, _315);
        float _319 = _311 * _311;
        bool _321 = _317 >= 16.0;
        float _323 = _233 * _305;
        float _325 = _221 * _305;
        float _327 = -_233;
        float _329 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[41].z, _327);
        float _331 = -_221;
        float _333 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[41].z, _331);
        float _335 = _301;
        float _337 = _303;
        int _340 = as_type<int>(_333);
        if (_321)
        {
            float _342 = _301 * 0.0625;
            _335 = _342;
        }
        float _344 = _335;
        if (_321)
        {
            float _346 = _303 * 0.0625;
            _337 = _346;
        }
        float _348 = _337;
        float _350 = fma(_329, _329, _319);
        float _352 = abs(_344);
        bool _354 = _352 != 0.0;
        bool _356 = isnan(_352);
        bool _358 = _354 || _356;
        bool _360 = isnan(0.0);
        bool _362 = _358 || _360;
        float _364 = fma(_333, _333, _350);
        float _366 = abs(_348);
        bool _368 = _366 == 0.0;
        float _370 = abs(_348);
        bool _372 = _370 == 0.0;
        bool _374 = !_362;
        bool _376 = _372 && _374;
        float _378 = sqrt(_364);
        bool _380 = false;
        if (_376)
        {
            bool _382 = as_type<int>(_348) >= 0;
            _380 = _382;
        }
        bool _384 = _380;
        int _386 = _384 ? (-1) : 0;
        if (_376)
        {
            int _388 = _384 ? 0 : 1078530011;
            _340 = _388;
        }
        int _390 = _340;
        int _392 = _390;
        if (_376)
        {
            int _394 = int(0x80000000) & as_type<int>(_344);
            int _396 = _390 | _394;
            _392 = _396;
        }
        int _398 = _392;
        bool _400 = !_362;
        bool _402 = _400 && _368;
        int _404 = _398;
        float _406 = as_type<float>(_398);
        if (!_402)
        {
            float _408 = abs(_344);
            bool _410 = _408 != as_type<float>(0x7f800000u /* inf */);
            bool _412 = isnan(_408);
            bool _414 = _410 || _412;
            bool _416 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _418 = _414 || _416;
            float _420 = abs(_348);
            bool _422 = _420 == as_type<float>(0x7f800000u /* inf */);
            float _424 = abs(_348);
            bool _426 = _424 == as_type<float>(0x7f800000u /* inf */);
            bool _428 = !_418;
            bool _430 = _426 && _428;
            if (_430)
            {
                bool _432 = as_type<int>(_348) >= 0;
                _386 = _432 ? (-1) : 0;
            }
            int _434 = _386;
            if (_430)
            {
                _404 = 1075235812;
            }
            int _436 = _404;
            int _438 = _436;
            if (_430)
            {
                int _440 = ~_434;
                int _442 = (_440 != 0) ? _436 : 1061752795;
                _438 = _442;
            }
            int _444 = _438;
            float _446 = as_type<float>(_444);
            if (_430)
            {
                int _448 = int(0x80000000) & as_type<int>(_344);
                int _450 = _444 | _448;
                _446 = as_type<float>(_450);
            }
            float _452 = _446;
            bool _454 = !_418;
            bool _456 = _454 && _422;
            _406 = _452;
            if (!_456)
            {
                float _458 = abs(_344);
                float _460 = abs(_348);
                float _462 = precise::max(_458, _460);
                float _464 = abs(_344);
                float _466 = abs(_348);
                float _468 = precise::min(_464, _466);
                float _470 = 1.0 / _462;
                float _472 = abs(_344);
                float _474 = abs(_348);
                bool _476 = _472 > _474;
                bool _478 = as_type<int>(_348) >= 0;
                float _480 = _468 * _470;
                float _482 = abs(_344);
                float _484 = abs(_348);
                float _486 = _482 + _484;
                int _488 = as_type<int>(_344) & int(0x80000000);
                float _490 = _480 * _480;
                bool _492 = _486 > as_type<float>(0x7f800000u /* inf */);
                bool _494 = isnan(_486);
                bool _496 = _492 || _494;
                bool _498 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _500 = _496 || _498;
                float _502 = _490 + 11.33538818359375;
                float _504 = fma(_490, _502, 28.84246826171875);
                float _506 = fma(_490, _504, 19.6966705322265625);
                float _508 = fma(_490, -0.82336294651031494140625, -5.674867153167724609375);
                float _510 = fma(_490, _508, -6.565555095672607421875);
                float _512 = 1.0 / _506;
                float _514 = _490 * _510;
                float _516 = _480 * _514;
                float _518 = fma(_516, _512, _480);
                float _520 = _518;
                _406 = _486;
                if (_476)
                {
                    float _522 = -_518;
                    float _524 = _522 + 1.57079637050628662109375;
                    _520 = _524;
                }
                float _526 = _520;
                int _528 = as_type<int>(_526);
                if (!_478)
                {
                    float _530 = -_526;
                    float _532 = _530 + 3.1415927410125732421875;
                    _528 = as_type<int>(_532);
                }
                int _534 = _528;
                if (!_500)
                {
                    int _536 = _488 | _534;
                    _406 = as_type<float>(_536);
                }
            }
        }
        float _538 = _406;
        float _540 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _542 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _544 = _378 + _542;
        float _546 = fma(_323, _540, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _548 = fma(_325, _540, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _297 = _546;
        _281 = _548;
        _283 = _544;
    }
    float _550 = _297;
    float _552 = _281;
    float _554 = _283;
    float2 _2139 = float2(_91, _93);
    float2 _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2139, float2(0.0), isnan(_2139))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2139, float2(0.0), isnan(_2139))).xy;
    float _560 = _558.x;
    float _562 = _558.y;
    float _564 = fma(_550, 6.2500002968590706586837768554688e-05, 0.5);
    float _566 = fma(_552, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2157 = float2(_564, _566);
    float _568 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2157, float2(0.0), isnan(_2157))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2157, float2(0.0), isnan(_2157))).x;
    float _570 = _291 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _572 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _574 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _576 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[35].x, _570);
    float _578 = floor(_572);
    float _580 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[35].z, _576);
    float _582 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _584 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _586 = -_580;
    float _588 = fma(_586, _580, 1.0);
    float _590 = floor(_574);
    float _592 = -_580;
    float _594 = fma(_592, (*spvDescriptorSet0.fp_c3)._m0[35].z, _293);
    float _596 = -_580;
    float _598 = fma(_596, (*spvDescriptorSet0.fp_c3)._m0[35].x, _289);
    float _600 = _588 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _602 = -_580;
    float _604 = fma(_602, (*spvDescriptorSet0.fp_c3)._m0[35].y, _291);
    float _606 = fma(_594, _600, _171);
    float _608 = fma(_598, _600, _177);
    float _610 = -_578;
    float _612 = _572 + _610;
    float _614 = abs(_171);
    float _616 = log2(_614);
    float _618 = fma(_604, _600, _175);
    float _620 = -_606;
    bool _622 = _620 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _624 = float(_622);
    float _626 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _628 = _612 + _626;
    float _630 = -_606;
    bool _632 = _630 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _634 = float(_632);
    float _636 = -_590;
    float _638 = _574 + _636;
    float _640 = -_628;
    float _642 = _640 + 1.0;
    float _644 = _624 + _634;
    float _646 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _648 = _638 + _646;
    float _650 = -_648;
    float _652 = _650 + 1.0;
    float _654 = precise::min(_644, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _656 = _628 * _648;
    float _658 = _648 * _642;
    float _660 = _628 * _652;
    float _662 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _664 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _666 = _642 * _652;
    float _668 = _616 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _670 = trunc(_654);
    int _672 = int(_670);
    float2 _2334 = float2(_662, _664);
    float4 _675 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2334, float2(0.0), isnan(_2334)), int2(0), component::x).xyzw;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    float _683 = _675.w;
    float _685 = exp2(_668);
    float _687 = fma(_560, 2.0, -1.0);
    float _689 = fma(_562, 2.0, -1.0);
    float _691 = _687 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _693 = _689 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _695 = fma(_691, 2.0, _91);
    float2 _2369 = float2(_564, _566);
    float _697 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2369, float2(0.0), isnan(_2369)), level(_568)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2369, float2(0.0), isnan(_2369)), level(_568)).x;
    float2 _2378 = float2(_662, _664);
    float4 _699 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2378, float2(0.0), isnan(_2378)), int2(0), component::w).xyzw;
    float _701 = _699.x;
    float _703 = _699.y;
    float _705 = _699.z;
    float _707 = _699.w;
    float2 _2394 = float2(_584, _582);
    float _709 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2394, float2(0.0), isnan(_2394))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2394, float2(0.0), isnan(_2394))).x;
    float _711 = fma(_693, 2.0, _93);
    int _713 = _672 << 6;
    uint _716 = uint(int(uint(_713) >> uint(2)));
    uint _718 = uint(int(uint(int(_716)) >> uint(2)));
    int _720 = int(_716) & 3;
    float _722 = (*spvDescriptorSet0.fp_c3)._m0[int(_718)][_720];
    int _724 = int(_716) + 1;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    int _728 = _724 & 3;
    float _730 = (*spvDescriptorSet0.fp_c3)._m0[int(_726)][_728];
    float2 _2436 = float2(_695, _711);
    float3 _734 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2436, float2(0.0), isnan(_2436))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2436, float2(0.0), isnan(_2436))).xyz;
    float _736 = _734.x;
    float _738 = _734.y;
    float _740 = _734.z;
    bool _742 = _672 != 0;
    float _744 = fma(_685, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _746 = precise::clamp(_744, 0.0, 1.0);
    int _748 = _713 + 16;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.fp_c3)._m0[int(_760)][_762];
    float _766 = fma(_746, -2.0, 3.0);
    float _768 = _746 * _746;
    float _770 = _768 * _766;
    float _772 = -_679;
    float _774 = fma(_772, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _776 = -_677;
    float _778 = fma(_776, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _780 = -_681;
    float _782 = fma(_780, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _784 = 1.0 / _774;
    float _786 = _618 * _730;
    float _788 = fma(_608, _722, _786);
    int _790 = _713 + 32;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    uint _794 = uint(int(uint(int(_792)) >> uint(2)));
    int _796 = int(_792) & 3;
    float _798 = (*spvDescriptorSet0.fp_c3)._m0[int(_794)][_796];
    int _800 = int(_792) + 1;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    int _804 = _800 & 3;
    float _806 = (*spvDescriptorSet0.fp_c3)._m0[int(_802)][_804];
    float _808 = _618 * _764;
    float _810 = fma(_608, _756, _808);
    int _812 = _713 + 48;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.fp_c3)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.fp_c3)._m0[int(_824)][_826];
    float _830 = _618 * _806;
    float _832 = fma(_608, _798, _830);
    int _834 = _713 + 8;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    uint _838 = uint(int(uint(int(_836)) >> uint(2)));
    int _840 = int(_836) & 3;
    float _842 = (*spvDescriptorSet0.fp_c3)._m0[int(_838)][_840];
    int _844 = int(_836) + 1;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    int _848 = _844 & 3;
    float _850 = (*spvDescriptorSet0.fp_c3)._m0[int(_846)][_848];
    float _852 = _618 * _828;
    float _854 = fma(_608, _820, _852);
    float _856 = -_770;
    float _858 = _856 + 1.0;
    float _860 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _862 = fma(_858, (*spvDescriptorSet0.fp_c3)._m0[44].w, _770);
    float _864 = precise::max(0.0, _860);
    float _866 = _862 * _864;
    int _868 = _713 + 24;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    uint _872 = uint(int(uint(int(_870)) >> uint(2)));
    int _874 = int(_870) & 3;
    float _876 = (*spvDescriptorSet0.fp_c3)._m0[int(_872)][_874];
    int _878 = int(_870) + 1;
    uint _880 = uint(int(uint(_878) >> uint(2)));
    int _882 = _878 & 3;
    float _884 = (*spvDescriptorSet0.fp_c3)._m0[int(_880)][_882];
    float _886 = -_683;
    float _888 = fma(_886, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _890 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _892 = -_171;
    float _894 = fma(_784, _890, _892);
    float _896 = 1.0 / _888;
    float _898 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _900 = -_171;
    float _902 = fma(_896, _898, _900);
    float _904 = fma(_606, _842, _788);
    float _906 = 1.0 / _782;
    float _908 = _904 + _850;
    int _910 = _713 + 40;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.fp_c3)._m0[int(_914)][_916];
    int _920 = int(_912) + 1;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    int _924 = _920 & 3;
    float _926 = (*spvDescriptorSet0.fp_c3)._m0[int(_922)][_924];
    float _928 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _930 = -_171;
    float _932 = fma(_906, _928, _930);
    float _934 = fma(_606, _876, _810);
    float _936 = precise::min(_171, -1.0000000116860974230803549289703e-07);
    float _938 = _934 + _884;
    float _940 = 1.0 / _936;
    float _942 = 1.0 / _778;
    float _944 = _940 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _946 = abs(_894);
    float _948 = _946 * _944;
    float _950 = abs(_932);
    float _952 = _950 * _944;
    float _954 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _956 = -_171;
    float _958 = fma(_942, _954, _956);
    float _960 = exp2(_952);
    float _962 = fma(_606, _918, _832);
    float _964 = abs(_958);
    float _966 = _964 * _944;
    float _968 = abs(_902);
    float _970 = _968 * _944;
    float _972 = _962 + _926;
    int _974 = _713 + 56;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    uint _978 = uint(int(uint(int(_976)) >> uint(2)));
    int _980 = int(_976) & 3;
    float _982 = (*spvDescriptorSet0.fp_c3)._m0[int(_978)][_980];
    int _984 = int(_976) + 1;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    int _988 = _984 & 3;
    float _990 = (*spvDescriptorSet0.fp_c3)._m0[int(_986)][_988];
    float _992 = exp2(_948);
    float _994 = exp2(_966);
    float _996 = abs(_660);
    float _998 = _996 * _960;
    float _1000 = exp2(_970);
    float _1002 = abs(_656);
    float _1004 = _1002 * _992;
    float _1006 = abs(_658);
    float _1008 = _1006 * _994;
    float _1010 = _1008 + _1004;
    float _1012 = abs(_666);
    float _1014 = _1012 * _1000;
    float _1016 = _998 + _1010;
    float _1018 = _1014 + _1016;
    float _1020 = -_1014;
    bool _1022 = _1016 != _1020;
    bool _1024 = isnan(_1016);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(_1020);
    bool _1030 = _1026 || _1028;
    float _1032 = 1.0 / _1018;
    float _1034 = fma(_606, _982, _854);
    float _1036 = _1034 + _990;
    float _1038 = _1004 * _1032;
    float _1040 = _1008 * _1032;
    float _1042 = _998 * _1032;
    float _1044 = _1014 * _1032;
    float _1046 = _1030 ? _1038 : 0.25;
    bool _1048 = _171 >= (-8000.0);
    bool _1050 = isnan(_171);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(-8000.0);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = _1030 ? _1040 : 0.25;
    float _1062 = _1030 ? _1042 : 0.25;
    float _1064 = _1058 * _866;
    float _1066 = _1030 ? _1044 : 0.25;
    float _1068 = abs(_697);
    float _1070 = _1068 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1072 = _1046 * _703;
    float _1074 = _1064 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1076 = 1.0 / _1036;
    float _1078 = -_709;
    float _1080 = _1078 + 1.0;
    float _1082 = fma(_1060, _701, _1072);
    float _1084 = -_1070;
    float _1086 = fma(_1058, _1084, 1.0);
    float _1088 = _1080 * _1074;
    float _1090 = precise::clamp(_1088, 0.0, 1.0);
    float _1092 = fma(_1062, _705, _1082);
    float _1094 = precise::min(_1086, 1.0);
    float _1096 = -_1090;
    float _1098 = fma(_1096, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1100 = fma(_1066, _707, _1092);
    float _1102 = precise::min(_736, 1.0);
    float _1104 = precise::min(_1094, _1098);
    float _1106 = _908 * _1076;
    float _1108 = _938 * _1076;
    float _1110 = _972 * _1076;
    float _1112 = precise::clamp(_1110, 0.0, 1.0);
    float _1114 = precise::min(_1100, 1.0);
    float _1170;
    if (!_742)
    {
        float _1116 = rint(_654);
        float _1118 = precise::max(_1116, 0.0);
        uint _1120 = uint(_1118);
        uint _1122 = clamp(_1120, 0u, 65535u);
        float _1124 = _1112 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1126 = fma(_1124, 0.5, _1108);
        float _1128 = fma(_1124, 0.5, _1106);
        float _1130 = fma(_1124, -0.5, _1106);
        float _1132 = fma(_1124, -0.5, _1108);
        float3 _3055 = float3(_1106, _1126, float(int(_1122)));
        float3 _3059 = select(_3055, float3(0.0), isnan(_3055));
        float _1134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3059.xy, uint(rint(_3059.z)), _1112);
        float3 _3068 = float3(_1128, _1126, float(int(_1122)));
        float3 _3070 = select(_3068, float3(0.0), isnan(_3068));
        float _1136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3070.xy, uint(rint(_3070.z)), _1112);
        float3 _3079 = float3(_1130, _1126, float(int(_1122)));
        float3 _3081 = select(_3079, float3(0.0), isnan(_3079));
        float _1138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3081.xy, uint(rint(_3081.z)), _1112);
        float3 _3090 = float3(_1128, _1108, float(int(_1122)));
        float3 _3092 = select(_3090, float3(0.0), isnan(_3090));
        float _1140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3092.xy, uint(rint(_3092.z)), _1112);
        float3 _3101 = float3(_1106, _1108, float(int(_1122)));
        float3 _3103 = select(_3101, float3(0.0), isnan(_3101));
        float _1142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3103.xy, uint(rint(_3103.z)), _1112);
        float3 _3112 = float3(_1130, _1108, float(int(_1122)));
        float3 _3114 = select(_3112, float3(0.0), isnan(_3112));
        float _1144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3114.xy, uint(rint(_3114.z)), _1112);
        float3 _3123 = float3(_1128, _1132, float(int(_1122)));
        float3 _3125 = select(_3123, float3(0.0), isnan(_3123));
        float _1146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3125.xy, uint(rint(_3125.z)), _1112);
        float3 _3134 = float3(_1106, _1132, float(int(_1122)));
        float3 _3136 = select(_3134, float3(0.0), isnan(_3134));
        float _1148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3136.xy, uint(rint(_3136.z)), _1112);
        float3 _3145 = float3(_1130, _1132, float(int(_1122)));
        float3 _3147 = select(_3145, float3(0.0), isnan(_3145));
        float _1150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3147.xy, uint(rint(_3147.z)), _1112);
        float _1152 = _1136 + _1134;
        float _1154 = _1152 + _1138;
        float _1156 = _1154 + _1140;
        float _1158 = _1156 + _1142;
        float _1160 = _1158 + _1144;
        float _1162 = _1160 + _1146;
        float _1164 = _1162 + _1148;
        float _1166 = _1164 + _1150;
        float _1168 = _1166 * 0.111111111938953399658203125;
        _1170 = _1168;
        _1172 = true;
    }
    else
    {
        float _1174 = rint(_654);
        float _1176 = precise::max(_1174, 0.0);
        uint _1178 = uint(_1176);
        uint _1180 = clamp(_1178, 0u, 65535u);
        float3 _3194 = float3(_1106, _1108, float(int(_1180)));
        float3 _3196 = select(_3194, float3(0.0), isnan(_3194));
        float _1182 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3196.xy, uint(rint(_3196.z)), _1112);
        _1170 = _1182;
    }
    _1172 = false;
    float _1184 = _1170;
    float _1186 = _554 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1188 = _554 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1190 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1186);
    float _1192 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1188);
    float _1194 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1190);
    float _1196 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1192);
    float _1198 = _1194 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1200 = _1196 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1202 = trunc(_1198);
    int _1204 = int(_1202);
    float _1206 = trunc(_1200);
    int _1208 = int(_1206);
    int _1210 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1212 = _1204 + _1210;
    int _1214 = _1212 + 1;
    float _1216 = -_171;
    float _1218 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1220 = _1216 + _1218;
    bool _1222 = _1214 >= 0;
    int _1224 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1226 = _1208 + _1224;
    int _1228 = _1226 + 1;
    float _1230 = -_171;
    float _1232 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1234 = _1230 + _1232;
    bool _1236 = _1214 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1238 = !_1222;
    bool _1240 = _1236 || _1238;
    bool _1242 = _1228 < 0;
    bool _1244 = _1242 || _1240;
    bool _1246 = _1228 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1248 = _1246 || _1244;
    if (_1248)
    {
        _285 = 1.0;
    }
    float _1250 = _285;
    float _1252 = _1250;
    if (!_1248)
    {
        int _1254 = _1228 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1256 = _1254 + _1214;
        float _1258 = floor(_1200);
        int _1260 = _1256 << 2;
        int _1262 = _1256 >> 2;
        int _1264 = 12 & _1260;
        int _1266 = _1262 << 4;
        int _1268 = _1266 + _1264;
        float _1270 = floor(_1198);
        uint _1272 = uint(int(uint(_1268) >> uint(2)));
        uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
        int _1276 = int(_1272) & 3;
        float _1278 = (*spvDescriptorSet0.fp_c5)._m0[int(_1274)][_1276];
        float _1280 = -_1258;
        float _1282 = _1200 + _1280;
        float _1284 = -_1270;
        float _1286 = _1198 + _1284;
        float _1288 = rint(_1278);
        float _1290 = precise::max(_1288, 0.0);
        uint _1292 = uint(_1290);
        uint _1294 = clamp(_1292, 0u, 65535u);
        float3 _3381 = float3(_1286, _1282, float(int(_1294)));
        float3 _3383 = select(_3381, float3(0.0), isnan(_3381));
        float _1296 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3383.xy, uint(rint(_3383.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3383.xy, uint(rint(_3383.z)), level(0.0)).x;
        int _1298 = _1256 << 4;
        int _1300 = _1298 + 1648;
        int _1302 = _1268 + 8048;
        uint _1304 = uint(int(uint(_1302) >> uint(2)));
        uint _1306 = uint(int(uint(int(_1304)) >> uint(2)));
        int _1308 = int(_1304) & 3;
        float _1310 = (*spvDescriptorSet0.fp_c5)._m0[int(_1306)][_1308];
        uint _1312 = uint(int(uint(_1300) >> uint(2)));
        uint _1314 = uint(int(uint(int(_1312)) >> uint(2)));
        int _1316 = int(_1312) & 3;
        float _1318 = (*spvDescriptorSet0.fp_c5)._m0[int(_1314)][_1316];
        int _1320 = int(_1312) + 1;
        uint _1322 = uint(int(uint(_1320) >> uint(2)));
        int _1324 = _1320 & 3;
        float _1326 = (*spvDescriptorSet0.fp_c5)._m0[int(_1322)][_1324];
        int _1328 = _1300 + 8;
        uint _1330 = uint(int(uint(_1328) >> uint(2)));
        uint _1332 = uint(int(uint(int(_1330)) >> uint(2)));
        int _1334 = int(_1330) & 3;
        float _1336 = (*spvDescriptorSet0.fp_c5)._m0[int(_1332)][_1334];
        int _1338 = int(_1330) + 1;
        uint _1340 = uint(int(uint(_1338) >> uint(2)));
        int _1342 = _1338 & 3;
        float _1344 = (*spvDescriptorSet0.fp_c5)._m0[int(_1340)][_1342];
        float _1346 = _1310 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1348 = _554 * _1326;
        float _1350 = fma(_550, _1318, _1348);
        float _1352 = 1.0 / _1310;
        float _1354 = fma(_552, _1336, _1350);
        float _1356 = _1354 + _1344;
        float _1358 = precise::clamp(_1356, 0.0, 1.0);
        float _1360 = -_1358;
        float _1362 = _1360 + _1296;
        float _1364 = fma(_1352, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1362);
        float _1366 = _1346 * _1364;
        float _1368 = exp2(_1366);
        float _1370 = 0.0 + _1368;
        float _1372 = precise::clamp(_1370, 0.0, 1.0);
        _1252 = _1372;
    }
    float _1374 = _1252;
    float _1376 = precise::min(_1374, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1378 = -_1184;
    float _1380 = _1378 + 1.0;
    float _1382 = _1220 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1384 = precise::clamp(_1382, 0.0, 1.0);
    float _1386 = _1234 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1388 = precise::clamp(_1386, 0.0, 1.0);
    float _1390 = -_1376;
    float _1392 = _1390 + 1.0;
    float _1394 = fma(_1384, _1380, _1184);
    float _1396 = fma(_1388, _1392, _1376);
    out.m_66.x = _1394;
    out.m_66.y = _1396;
    out.m_66.z = _1114;
    out.m_66.w = _1104;
    out.m_68.x = _1102;
    out.m_68.y = _738;
    out.m_68.z = _740;
    out.m_68.w = 1.0;
    return out;
}

