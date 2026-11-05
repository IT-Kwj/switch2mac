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
    texture2d<float> fp_t_tcb_14 [[id(7)]];
    sampler fp_t_tcb_14Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_16 [[id(11)]];
    sampler fp_t_tcb_16Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_E [[id(13)]];
    sampler fp_t_tcb_ESmplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_10 [[id(17)]];
    sampler fp_t_tcb_10Smplr [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_ASmplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    sampler fp_t_tcb_12Smplr_w [[id(22)]];
    sampler fp_t_tcb_16Smplr_w [[id(23)]];
    sampler fp_t_tcb_ESmplr_w [[id(24)]];
    sampler fp_t_tcb_10Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
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
    bool _951 = false;
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
    float2 _1216 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1216, float2(0.0), isnan(_1216))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1216, float2(0.0), isnan(_1216))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1231 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1231, float2(0.0), isnan(_1231))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1231, float2(0.0), isnan(_1231))).x;
    float2 _1239 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1239, float2(0.0), isnan(_1239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1239, float2(0.0), isnan(_1239))).x;
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
    float _139 = _85 * _129;
    float _141 = -_93;
    float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _145 = 1.0 / _143;
    float _147 = -_99;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _151 = -_97;
    float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _155 = _85 * _111;
    float _157 = _85 * _117;
    float _159 = _85 * _123;
    float _161 = 1.0 / _153;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _165 = _145 * _163;
    float _167 = 1.0 / _149;
    float _169 = _85 * _135;
    float _171 = _165 * _137;
    float _173 = _165 * _155;
    float _175 = _171 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _177 = _171 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _181 = _161 * _179;
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[32].x, _175);
    float _185 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[30].x, _177);
    float _187 = -_173;
    float _189 = fma(_181, _157, _187);
    float _191 = -_171;
    float _193 = fma(_181, _159, _191);
    float _195 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[32].z, _183);
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _199 = _167 * _197;
    float _201 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _203 = -_165;
    float _205 = _203 + _181;
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _209 = -_171;
    float _211 = fma(_199, _169, _209);
    float _213 = _201 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _215 = -_173;
    float _217 = fma(_199, _139, _215);
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _221 = _207 + _219;
    float _223 = -_165;
    float _225 = _223 + _199;
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _229 = _213 + _227;
    float _231 = _205 * _217;
    float _233 = _221 * _221;
    float _235 = _193 * _225;
    float _237 = -_231;
    float _239 = fma(_189, _225, _237);
    float _241 = fma(_229, _229, _233);
    float _243 = _189 * _211;
    float _245 = -_235;
    float _247 = fma(_205, _211, _245);
    float _249 = _239 * _239;
    float _251 = sqrt(_241);
    float _253 = -_243;
    float _255 = fma(_193, _217, _253);
    float _257 = fma(_247, _247, _249);
    float _259 = _171 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _261 = fma(_255, _255, _257);
    float _263 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].x, _259);
    float _265 = rsqrt(_261);
    float _267 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[31].z, _263);
    bool _271 = _251 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _273 = _267 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _275 = _247 * _265;
    float _277 = _239 * _265;
    float _279 = _255 * _265;
    float _281 = _265;
    float _283 = _207;
    float _285 = _273;
    if (!_271)
    {
        _281 = _213;
    }
    float _287 = _281;
    bool _289 = !_271;
    float _291 = _287;
    if (!_289)
    {
        float _293 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _295 = _251 + _293;
        float _297 = _273 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = rsqrt(_241);
        float _301 = -_273;
        float _303 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _305 = _301 + _303;
        float _307 = abs(_297);
        float _309 = abs(_295);
        float _311 = precise::max(_307, _309);
        float _313 = _305 * _305;
        bool _315 = _311 >= 16.0;
        float _317 = _229 * _299;
        float _319 = _221 * _299;
        float _321 = -_229;
        float _323 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[41].z, _321);
        float _325 = -_221;
        float _327 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[41].z, _325);
        float _329 = _295;
        float _331 = _297;
        int _334 = as_type<int>(_299);
        float _336 = _327;
        if (_315)
        {
            float _338 = _295 * 0.0625;
            _329 = _338;
        }
        float _340 = _329;
        if (_315)
        {
            float _342 = _297 * 0.0625;
            _331 = _342;
        }
        float _344 = _331;
        float _346 = fma(_323, _323, _313);
        float _348 = abs(_340);
        bool _350 = _348 != 0.0;
        bool _352 = isnan(_348);
        bool _354 = _350 || _352;
        bool _356 = isnan(0.0);
        bool _358 = _354 || _356;
        float _360 = fma(_327, _327, _346);
        float _362 = abs(_344);
        bool _364 = _362 == 0.0;
        float _366 = abs(_344);
        bool _368 = _366 == 0.0;
        bool _370 = !_358;
        bool _372 = _368 && _370;
        float _374 = sqrt(_360);
        bool _376 = false;
        int _378 = as_type<int>(_360);
        if (_372)
        {
            bool _380 = as_type<int>(_344) >= 0;
            _376 = _380;
        }
        bool _382 = _376;
        int _384 = _382 ? (-1) : 0;
        if (_372)
        {
            int _386 = _382 ? 0 : 1078530011;
            _334 = _386;
        }
        int _388 = _334;
        if (_372)
        {
            int _390 = int(0x80000000) & as_type<int>(_340);
            int _392 = _388 | _390;
            _336 = as_type<float>(_392);
        }
        float _394 = _336;
        bool _396 = !_358;
        bool _398 = _396 && _364;
        float _400 = _394;
        float _402 = _394;
        if (!_398)
        {
            float _404 = abs(_340);
            bool _406 = _404 != as_type<float>(0x7f800000u /* inf */);
            bool _408 = isnan(_404);
            bool _410 = _406 || _408;
            bool _412 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _414 = _410 || _412;
            float _416 = abs(_344);
            bool _418 = _416 == as_type<float>(0x7f800000u /* inf */);
            float _420 = abs(_344);
            bool _422 = _420 == as_type<float>(0x7f800000u /* inf */);
            bool _424 = !_414;
            bool _426 = _422 && _424;
            if (_426)
            {
                bool _428 = as_type<int>(_344) >= 0;
                _384 = _428 ? (-1) : 0;
            }
            int _430 = _384;
            if (_426)
            {
                _378 = 1075235812;
            }
            int _432 = _378;
            int _434 = _432;
            if (_426)
            {
                int _436 = ~_430;
                int _438 = (_436 != 0) ? _432 : 1061752795;
                _434 = _438;
            }
            int _440 = _434;
            if (_426)
            {
                int _442 = int(0x80000000) & as_type<int>(_340);
                int _444 = _440 | _442;
                _400 = as_type<float>(_444);
            }
            float _446 = _400;
            bool _448 = !_414;
            bool _450 = _448 && _418;
            _402 = _446;
            if (!_450)
            {
                float _452 = abs(_340);
                float _454 = abs(_344);
                float _456 = precise::max(_452, _454);
                float _458 = abs(_340);
                float _460 = abs(_344);
                float _462 = precise::min(_458, _460);
                float _464 = 1.0 / _456;
                float _466 = abs(_340);
                float _468 = abs(_344);
                bool _470 = _466 > _468;
                bool _472 = as_type<int>(_344) >= 0;
                float _474 = abs(_340);
                float _476 = abs(_344);
                float _478 = _474 + _476;
                int _480 = as_type<int>(_340) & int(0x80000000);
                bool _482 = _478 > as_type<float>(0x7f800000u /* inf */);
                bool _484 = isnan(_478);
                bool _486 = _482 || _484;
                bool _488 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _490 = _486 || _488;
                float _492 = _462 * _464;
                float _494 = _492 * _492;
                float _496 = _494 + 11.33538818359375;
                float _498 = fma(_494, _496, 28.84246826171875);
                float _500 = fma(_494, _498, 19.6966705322265625);
                float _502 = fma(_494, -0.82336294651031494140625, -5.674867153167724609375);
                float _504 = fma(_494, _502, -6.565555095672607421875);
                float _506 = 1.0 / _500;
                float _508 = _494 * _504;
                float _510 = _492 * _508;
                float _512 = fma(_510, _506, _492);
                float _514 = _512;
                _402 = _478;
                if (_470)
                {
                    float _516 = -_512;
                    float _518 = _516 + 1.57079637050628662109375;
                    _514 = _518;
                }
                float _520 = _514;
                int _522 = as_type<int>(_520);
                if (!_472)
                {
                    float _524 = -_520;
                    float _526 = _524 + 3.1415927410125732421875;
                    _522 = as_type<int>(_526);
                }
                int _528 = _522;
                if (!_490)
                {
                    int _530 = _480 | _528;
                    _402 = as_type<float>(_530);
                }
            }
        }
        float _532 = _402;
        float _534 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _536 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _538 = _374 + _536;
        float _540 = fma(_317, _534, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _542 = fma(_319, _534, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _291 = _540;
        _283 = _542;
        _285 = _538;
    }
    float _544 = _291;
    float _546 = _283;
    float _548 = _285;
    float2 _1919 = float2(_87, _89);
    float2 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1919, float2(0.0), isnan(_1919))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1919, float2(0.0), isnan(_1919))).xy;
    float _554 = _552.x;
    float _556 = _552.y;
    float _558 = fma(_544, 6.2500002968590706586837768554688e-05, 0.5);
    float _560 = fma(_546, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1937 = float2(_558, _560);
    float _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1937, float2(0.0), isnan(_1937))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1937, float2(0.0), isnan(_1937))).x;
    float _564 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _566 = fma(_556, 2.0, -1.0);
    float _568 = fma(_554, 2.0, -1.0);
    float _570 = _566 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _572 = fma(_546, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _574 = _568 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _576 = fma(_570, 2.0, _89);
    float2 _1975 = float2(_558, _560);
    float _578 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1975, float2(0.0), isnan(_1975)), level(_562)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1975, float2(0.0), isnan(_1975)), level(_562)).x;
    float2 _1984 = float2(_564, _572);
    float _580 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1984, float2(0.0), isnan(_1984))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1984, float2(0.0), isnan(_1984))).x;
    float _582 = fma(_574, 2.0, _87);
    float2 _1995 = float2(_582, _576);
    float _584 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1995, float2(0.0), isnan(_1995))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1995, float2(0.0), isnan(_1995))).x;
    float _586 = _277 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _588 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[35].x, _586);
    float _590 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].z, _588);
    float _592 = -_590;
    float _594 = fma(_592, _590, 1.0);
    float _596 = -_590;
    float _598 = fma(_596, (*spvDescriptorSet0.fp_c3)._m0[35].z, _279);
    float _600 = _594 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _602 = fma(_598, _600, _165);
    float _604 = -_602;
    bool _606 = _604 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _608 = float(_606);
    float _610 = -_602;
    bool _612 = _610 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _614 = float(_612);
    float _616 = _608 + _614;
    float _618 = precise::min(_616, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _620 = abs(_165);
    float _622 = log2(_620);
    float _624 = trunc(_618);
    int _626 = int(_624);
    float _628 = _622 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _630 = exp2(_628);
    int _632 = _626 << 6;
    bool _634 = _626 != 0;
    int _636 = _632 + 48;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.fp_c3)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    int _655 = _632 + 56;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    uint _659 = uint(int(uint(int(_657)) >> uint(2)));
    int _661 = int(_657) & 3;
    float _663 = (*spvDescriptorSet0.fp_c3)._m0[int(_659)][_661];
    int _665 = int(_657) + 1;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    int _669 = _665 & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    float _673 = fma(_630, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _675 = precise::clamp(_673, 0.0, 1.0);
    float _677 = fma(_675, -2.0, 3.0);
    float _679 = -_590;
    float _681 = fma(_679, (*spvDescriptorSet0.fp_c3)._m0[35].x, _275);
    uint _683 = uint(int(uint(_632) >> uint(2)));
    uint _685 = uint(int(uint(int(_683)) >> uint(2)));
    int _687 = int(_683) & 3;
    float _689 = (*spvDescriptorSet0.fp_c3)._m0[int(_685)][_687];
    int _691 = int(_683) + 1;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    int _695 = _691 & 3;
    float _697 = (*spvDescriptorSet0.fp_c3)._m0[int(_693)][_695];
    float _699 = -_590;
    float _701 = fma(_699, (*spvDescriptorSet0.fp_c3)._m0[35].y, _277);
    float _703 = _675 * _675;
    float _705 = fma(_681, _600, _173);
    float _707 = fma(_701, _600, _171);
    float _709 = _703 * _677;
    int _711 = _632 + 16;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    float _729 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _731 = -_709;
    float _733 = _731 + 1.0;
    float _735 = precise::max(0.0, _729);
    float _737 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[44].w, _709);
    int _739 = _632 + 32;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    uint _743 = uint(int(uint(int(_741)) >> uint(2)));
    int _745 = int(_741) & 3;
    float _747 = (*spvDescriptorSet0.fp_c3)._m0[int(_743)][_745];
    int _749 = int(_741) + 1;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    int _753 = _749 & 3;
    float _755 = (*spvDescriptorSet0.fp_c3)._m0[int(_751)][_753];
    float _757 = _737 * _735;
    int _759 = _632 + 8;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    uint _763 = uint(int(uint(int(_761)) >> uint(2)));
    int _765 = int(_761) & 3;
    float _767 = (*spvDescriptorSet0.fp_c3)._m0[int(_763)][_765];
    int _769 = int(_761) + 1;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    int _773 = _769 & 3;
    float _775 = (*spvDescriptorSet0.fp_c3)._m0[int(_771)][_773];
    int _777 = _632 + 24;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    uint _781 = uint(int(uint(int(_779)) >> uint(2)));
    int _783 = int(_779) & 3;
    float _785 = (*spvDescriptorSet0.fp_c3)._m0[int(_781)][_783];
    int _787 = int(_779) + 1;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    int _791 = _787 & 3;
    float _793 = (*spvDescriptorSet0.fp_c3)._m0[int(_789)][_791];
    float _795 = _707 * _653;
    float _797 = fma(_705, _645, _795);
    int _799 = _632 + 40;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    uint _803 = uint(int(uint(int(_801)) >> uint(2)));
    int _805 = int(_801) & 3;
    float _807 = (*spvDescriptorSet0.fp_c3)._m0[int(_803)][_805];
    int _809 = int(_801) + 1;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    int _813 = _809 & 3;
    float _815 = (*spvDescriptorSet0.fp_c3)._m0[int(_811)][_813];
    float _817 = fma(_602, _663, _797);
    bool _819 = _165 >= (-8000.0);
    bool _821 = isnan(_165);
    bool _823 = _819 || _821;
    bool _825 = isnan(-8000.0);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = _817 + _671;
    float _833 = _829 * _757;
    float _835 = _707 * _697;
    float _837 = 1.0 / _831;
    float _839 = _833 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _841 = fma(_705, _689, _835);
    float _843 = _707 * _727;
    float _845 = fma(_705, _719, _843);
    float _847 = _707 * _755;
    float _849 = fma(_705, _747, _847);
    float _851 = fma(_602, _767, _841);
    float _853 = _851 + _775;
    float _855 = fma(_602, _785, _845);
    float _857 = _855 + _793;
    float _859 = _853 * _837;
    float _861 = fma(_602, _807, _849);
    float _863 = _861 + _815;
    float _865 = _863 * _837;
    float _867 = precise::clamp(_865, 0.0, 1.0);
    float _869 = abs(_578);
    float _871 = _869 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _873 = -_580;
    float _875 = _873 + 1.0;
    float _877 = -_871;
    float _879 = fma(_829, _877, 1.0);
    float _881 = _875 * _839;
    float _883 = precise::clamp(_881, 0.0, 1.0);
    float _885 = _857 * _837;
    float _887 = -_883;
    float _889 = fma(_887, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _891 = precise::min(_879, 1.0);
    float _893 = precise::min(_891, _889);
    float _949;
    if (!_634)
    {
        float _895 = rint(_618);
        float _897 = precise::max(_895, 0.0);
        uint _899 = uint(_897);
        uint _901 = clamp(_899, 0u, 65535u);
        float _903 = _867 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _905 = fma(_903, 0.5, _885);
        float _907 = fma(_903, 0.5, _859);
        float _909 = fma(_903, -0.5, _859);
        float _911 = fma(_903, -0.5, _885);
        float3 _2541 = float3(_859, _905, float(int(_901)));
        float3 _2545 = select(_2541, float3(0.0), isnan(_2541));
        float _913 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2545.xy, uint(rint(_2545.z)), _867);
        float3 _2554 = float3(_907, _905, float(int(_901)));
        float3 _2556 = select(_2554, float3(0.0), isnan(_2554));
        float _915 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2556.xy, uint(rint(_2556.z)), _867);
        float3 _2565 = float3(_909, _905, float(int(_901)));
        float3 _2567 = select(_2565, float3(0.0), isnan(_2565));
        float _917 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2567.xy, uint(rint(_2567.z)), _867);
        float3 _2576 = float3(_907, _885, float(int(_901)));
        float3 _2578 = select(_2576, float3(0.0), isnan(_2576));
        float _919 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2578.xy, uint(rint(_2578.z)), _867);
        float3 _2587 = float3(_859, _885, float(int(_901)));
        float3 _2589 = select(_2587, float3(0.0), isnan(_2587));
        float _921 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2589.xy, uint(rint(_2589.z)), _867);
        float3 _2598 = float3(_909, _885, float(int(_901)));
        float3 _2600 = select(_2598, float3(0.0), isnan(_2598));
        float _923 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2600.xy, uint(rint(_2600.z)), _867);
        float3 _2609 = float3(_907, _911, float(int(_901)));
        float3 _2611 = select(_2609, float3(0.0), isnan(_2609));
        float _925 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2611.xy, uint(rint(_2611.z)), _867);
        float3 _2620 = float3(_859, _911, float(int(_901)));
        float3 _2622 = select(_2620, float3(0.0), isnan(_2620));
        float _927 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2622.xy, uint(rint(_2622.z)), _867);
        float3 _2631 = float3(_909, _911, float(int(_901)));
        float3 _2633 = select(_2631, float3(0.0), isnan(_2631));
        float _929 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2633.xy, uint(rint(_2633.z)), _867);
        float _931 = _915 + _913;
        float _933 = _931 + _917;
        float _935 = _933 + _919;
        float _937 = _935 + _921;
        float _939 = _937 + _923;
        float _941 = _939 + _925;
        float _943 = _941 + _927;
        float _945 = _943 + _929;
        float _947 = _945 * 0.111111111938953399658203125;
        _949 = _947;
        _951 = true;
    }
    else
    {
        float _953 = rint(_618);
        float _955 = precise::max(_953, 0.0);
        uint _957 = uint(_955);
        uint _959 = clamp(_957, 0u, 65535u);
        float3 _2680 = float3(_859, _885, float(int(_959)));
        float3 _2682 = select(_2680, float3(0.0), isnan(_2680));
        float _961 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2682.xy, uint(rint(_2682.z)), _867);
        _949 = _961;
    }
    _951 = false;
    float _963 = _949;
    float _965 = _548 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _967 = _548 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _969 = -_165;
    float _971 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _973 = _969 + _971;
    float _975 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].x, _965);
    float _977 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].x, _967);
    float _979 = -_165;
    float _981 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _983 = _979 + _981;
    float _985 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].z, _975);
    float _987 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].z, _977);
    float _989 = _985 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _991 = _987 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _993 = trunc(_989);
    int _995 = int(_993);
    float _997 = trunc(_991);
    int _999 = int(_997);
    int _1001 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1003 = _995 + _1001;
    int _1005 = _1003 + 1;
    bool _1007 = _1005 >= 0;
    int _1009 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1011 = _999 + _1009;
    int _1013 = _1011 + 1;
    bool _1015 = _1005 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1017 = !_1007;
    bool _1019 = _1015 || _1017;
    bool _1021 = _1013 < 0;
    bool _1023 = _1021 || _1019;
    bool _1025 = _1013 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1027 = _1025 || _1023;
    float _1029 = as_type<float>(_995);
    if (_1027)
    {
        _1029 = 1.0;
    }
    float _1031 = _1029;
    float _1033 = _1031;
    if (!_1027)
    {
        int _1035 = _1013 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1037 = _1035 + _1005;
        float _1039 = floor(_989);
        int _1041 = _1037 << 2;
        int _1043 = _1037 >> 2;
        int _1045 = 12 & _1041;
        int _1047 = _1043 << 4;
        int _1049 = _1047 + _1045;
        float _1051 = floor(_991);
        uint _1053 = uint(int(uint(_1049) >> uint(2)));
        uint _1055 = uint(int(uint(int(_1053)) >> uint(2)));
        int _1057 = int(_1053) & 3;
        float _1059 = (*spvDescriptorSet0.fp_c5)._m0[int(_1055)][_1057];
        float _1061 = -_1039;
        float _1063 = _989 + _1061;
        float _1065 = -_1051;
        float _1067 = _991 + _1065;
        float _1069 = rint(_1059);
        float _1071 = precise::max(_1069, 0.0);
        uint _1073 = uint(_1071);
        uint _1075 = clamp(_1073, 0u, 65535u);
        float3 _2869 = float3(_1063, _1067, float(int(_1075)));
        float3 _2871 = select(_2869, float3(0.0), isnan(_2869));
        float _1077 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2871.xy, uint(rint(_2871.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2871.xy, uint(rint(_2871.z)), level(0.0)).x;
        int _1079 = _1037 << 4;
        int _1081 = _1079 + 1648;
        int _1083 = _1049 + 8048;
        uint _1085 = uint(int(uint(_1083) >> uint(2)));
        uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
        int _1089 = int(_1085) & 3;
        float _1091 = (*spvDescriptorSet0.fp_c5)._m0[int(_1087)][_1089];
        uint _1093 = uint(int(uint(_1081) >> uint(2)));
        uint _1095 = uint(int(uint(int(_1093)) >> uint(2)));
        int _1097 = int(_1093) & 3;
        float _1099 = (*spvDescriptorSet0.fp_c5)._m0[int(_1095)][_1097];
        int _1101 = int(_1093) + 1;
        uint _1103 = uint(int(uint(_1101) >> uint(2)));
        int _1105 = _1101 & 3;
        float _1107 = (*spvDescriptorSet0.fp_c5)._m0[int(_1103)][_1105];
        int _1109 = _1081 + 8;
        uint _1111 = uint(int(uint(_1109) >> uint(2)));
        uint _1113 = uint(int(uint(int(_1111)) >> uint(2)));
        int _1115 = int(_1111) & 3;
        float _1117 = (*spvDescriptorSet0.fp_c5)._m0[int(_1113)][_1115];
        int _1119 = int(_1111) + 1;
        uint _1121 = uint(int(uint(_1119) >> uint(2)));
        int _1123 = _1119 & 3;
        float _1125 = (*spvDescriptorSet0.fp_c5)._m0[int(_1121)][_1123];
        float _1127 = _1091 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1129 = _548 * _1107;
        float _1131 = fma(_544, _1099, _1129);
        float _1133 = 1.0 / _1091;
        float _1135 = fma(_546, _1117, _1131);
        float _1137 = _1135 + _1125;
        float _1139 = precise::clamp(_1137, 0.0, 1.0);
        float _1141 = -_1139;
        float _1143 = _1141 + _1077;
        float _1145 = fma(_1133, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1143);
        float _1147 = _1127 * _1145;
        float _1149 = exp2(_1147);
        float _1151 = 0.0 + _1149;
        float _1153 = precise::clamp(_1151, 0.0, 1.0);
        _1033 = _1153;
    }
    float _1155 = _1033;
    float _1157 = precise::min(_1155, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1159 = _973 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1161 = precise::clamp(_1159, 0.0, 1.0);
    float _1163 = -_963;
    float _1165 = _1163 + 1.0;
    float _1167 = _983 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1169 = precise::clamp(_1167, 0.0, 1.0);
    float _1171 = -_1157;
    float _1173 = _1171 + 1.0;
    float _1175 = fma(_1161, _1165, _963);
    float _1177 = fma(_1169, _1173, _1157);
    out.m_62.x = _1175;
    out.m_62.y = _1177;
    out.m_62.z = 1.0;
    out.m_62.w = _893;
    out.m_64.x = _584;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

