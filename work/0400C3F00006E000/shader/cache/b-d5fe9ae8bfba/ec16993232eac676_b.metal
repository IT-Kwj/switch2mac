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
    bool _939 = false;
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
    float2 _1204 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1204, float2(0.0), isnan(_1204))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1204, float2(0.0), isnan(_1204))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1219 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1219, float2(0.0), isnan(_1219))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1219, float2(0.0), isnan(_1219))).x;
    float2 _1227 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1227, float2(0.0), isnan(_1227))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1227, float2(0.0), isnan(_1227))).x;
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
    float _161 = _155 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _163 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].x, _159);
    float _165 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].x, _161);
    float _167 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _163);
    float _169 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _165);
    float _171 = -_97;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _175 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[41].x, _173);
    float _177 = _167 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _179 = -_99;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[41].x, _181);
    float _185 = _169 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _187 = -_157;
    float _189 = fma(_175, _141, _187);
    float _191 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _193 = _177 + _191;
    float _195 = -_155;
    float _197 = fma(_175, _143, _195);
    float _199 = -_153;
    float _201 = _199 + _175;
    float _203 = -_157;
    float _205 = fma(_183, _145, _203);
    float _207 = -_155;
    float _209 = fma(_183, _147, _207);
    float _211 = -_153;
    float _213 = _211 + _183;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _217 = _185 + _215;
    float _219 = _193 * _193;
    float _221 = _201 * _205;
    float _223 = _197 * _213;
    float _225 = fma(_217, _217, _219);
    float _227 = -_221;
    float _229 = fma(_189, _213, _227);
    float _231 = _189 * _209;
    float _233 = -_223;
    float _235 = fma(_201, _209, _233);
    float _237 = sqrt(_225);
    float _239 = _229 * _229;
    float _241 = -_231;
    float _243 = fma(_197, _205, _241);
    float _245 = fma(_235, _235, _239);
    float _247 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _249 = fma(_243, _243, _245);
    float _251 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _247);
    float _253 = rsqrt(_249);
    float _255 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _251);
    bool _259 = _237 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _255 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _263 = _235 * _253;
    float _265 = _229 * _253;
    float _267 = _243 * _253;
    float _269 = _253;
    float _271 = _177;
    float _273 = _261;
    if (!_259)
    {
        _269 = _185;
    }
    float _275 = _269;
    bool _277 = !_259;
    float _279 = _275;
    if (!_277)
    {
        float _281 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _283 = _237 + _281;
        float _285 = _261 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _287 = rsqrt(_225);
        float _289 = -_261;
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = _289 + _291;
        float _295 = abs(_285);
        float _297 = abs(_283);
        float _299 = precise::max(_295, _297);
        float _301 = _293 * _293;
        bool _303 = _299 >= 16.0;
        float _305 = _217 * _287;
        float _307 = _193 * _287;
        float _309 = -_217;
        float _311 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[41].z, _309);
        float _313 = -_193;
        float _315 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = _283;
        float _319 = _285;
        int _322 = as_type<int>(_287);
        float _324 = _315;
        if (_303)
        {
            float _326 = _283 * 0.0625;
            _317 = _326;
        }
        float _328 = _317;
        if (_303)
        {
            float _330 = _285 * 0.0625;
            _319 = _330;
        }
        float _332 = _319;
        float _334 = fma(_311, _311, _301);
        float _336 = abs(_328);
        bool _338 = _336 != 0.0;
        bool _340 = isnan(_336);
        bool _342 = _338 || _340;
        bool _344 = isnan(0.0);
        bool _346 = _342 || _344;
        float _348 = fma(_315, _315, _334);
        float _350 = abs(_332);
        bool _352 = _350 == 0.0;
        float _354 = abs(_332);
        bool _356 = _354 == 0.0;
        bool _358 = !_346;
        bool _360 = _356 && _358;
        float _362 = sqrt(_348);
        bool _364 = false;
        int _366 = as_type<int>(_348);
        if (_360)
        {
            bool _368 = as_type<int>(_332) >= 0;
            _364 = _368;
        }
        bool _370 = _364;
        int _372 = _370 ? (-1) : 0;
        if (_360)
        {
            int _374 = _370 ? 0 : 1078530011;
            _322 = _374;
        }
        int _376 = _322;
        if (_360)
        {
            int _378 = int(0x80000000) & as_type<int>(_328);
            int _380 = _376 | _378;
            _324 = as_type<float>(_380);
        }
        float _382 = _324;
        bool _384 = !_346;
        bool _386 = _384 && _352;
        float _388 = _382;
        float _390 = _382;
        if (!_386)
        {
            float _392 = abs(_328);
            bool _394 = _392 != as_type<float>(0x7f800000u /* inf */);
            bool _396 = isnan(_392);
            bool _398 = _394 || _396;
            bool _400 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _402 = _398 || _400;
            float _404 = abs(_332);
            bool _406 = _404 == as_type<float>(0x7f800000u /* inf */);
            float _408 = abs(_332);
            bool _410 = _408 == as_type<float>(0x7f800000u /* inf */);
            bool _412 = !_402;
            bool _414 = _410 && _412;
            if (_414)
            {
                bool _416 = as_type<int>(_332) >= 0;
                _372 = _416 ? (-1) : 0;
            }
            int _418 = _372;
            if (_414)
            {
                _366 = 1075235812;
            }
            int _420 = _366;
            int _422 = _420;
            if (_414)
            {
                int _424 = ~_418;
                int _426 = (_424 != 0) ? _420 : 1061752795;
                _422 = _426;
            }
            int _428 = _422;
            if (_414)
            {
                int _430 = int(0x80000000) & as_type<int>(_328);
                int _432 = _428 | _430;
                _388 = as_type<float>(_432);
            }
            float _434 = _388;
            bool _436 = !_402;
            bool _438 = _436 && _406;
            _390 = _434;
            if (!_438)
            {
                float _440 = abs(_328);
                float _442 = abs(_332);
                float _444 = precise::max(_440, _442);
                float _446 = abs(_328);
                float _448 = abs(_332);
                float _450 = precise::min(_446, _448);
                float _452 = 1.0 / _444;
                float _454 = abs(_328);
                float _456 = abs(_332);
                bool _458 = _454 > _456;
                bool _460 = as_type<int>(_332) >= 0;
                float _462 = abs(_328);
                float _464 = abs(_332);
                float _466 = _462 + _464;
                int _468 = as_type<int>(_328) & int(0x80000000);
                bool _470 = _466 > as_type<float>(0x7f800000u /* inf */);
                bool _472 = isnan(_466);
                bool _474 = _470 || _472;
                bool _476 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _478 = _474 || _476;
                float _480 = _450 * _452;
                float _482 = _480 * _480;
                float _484 = _482 + 11.33538818359375;
                float _486 = fma(_482, _484, 28.84246826171875);
                float _488 = fma(_482, _486, 19.6966705322265625);
                float _490 = fma(_482, -0.82336294651031494140625, -5.674867153167724609375);
                float _492 = fma(_482, _490, -6.565555095672607421875);
                float _494 = 1.0 / _488;
                float _496 = _482 * _492;
                float _498 = _480 * _496;
                float _500 = fma(_498, _494, _480);
                float _502 = _500;
                _390 = _466;
                if (_458)
                {
                    float _504 = -_500;
                    float _506 = _504 + 1.57079637050628662109375;
                    _502 = _506;
                }
                float _508 = _502;
                int _510 = as_type<int>(_508);
                if (!_460)
                {
                    float _512 = -_508;
                    float _514 = _512 + 3.1415927410125732421875;
                    _510 = as_type<int>(_514);
                }
                int _516 = _510;
                if (!_478)
                {
                    int _518 = _468 | _516;
                    _390 = as_type<float>(_518);
                }
            }
        }
        float _520 = _390;
        float _522 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _524 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _526 = _362 + _524;
        float _528 = fma(_305, _522, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _530 = fma(_307, _522, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _279 = _528;
        _271 = _530;
        _273 = _526;
    }
    float _532 = _279;
    float _534 = _271;
    float _536 = _273;
    float2 _1895 = float2(_87, _89);
    float2 _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1895, float2(0.0), isnan(_1895))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1895, float2(0.0), isnan(_1895))).xy;
    float _542 = _540.x;
    float _544 = _540.y;
    float _546 = fma(_532, 6.2500002968590706586837768554688e-05, 0.5);
    float _548 = fma(_534, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1913 = float2(_546, _548);
    float _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1913, float2(0.0), isnan(_1913))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1913, float2(0.0), isnan(_1913))).x;
    float _552 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _554 = fma(_544, 2.0, -1.0);
    float _556 = fma(_542, 2.0, -1.0);
    float _558 = _554 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _560 = fma(_534, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _562 = _556 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _564 = fma(_558, 2.0, _89);
    float2 _1951 = float2(_546, _548);
    float _566 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1951, float2(0.0), isnan(_1951)), level(_550)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1951, float2(0.0), isnan(_1951)), level(_550)).x;
    float2 _1960 = float2(_552, _560);
    float _568 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1960, float2(0.0), isnan(_1960))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1960, float2(0.0), isnan(_1960))).x;
    float _570 = fma(_562, 2.0, _87);
    float2 _1971 = float2(_570, _564);
    float _572 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1971, float2(0.0), isnan(_1971))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1971, float2(0.0), isnan(_1971))).x;
    float _574 = _265 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _576 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[35].x, _574);
    float _578 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].z, _576);
    float _580 = -_578;
    float _582 = fma(_580, _578, 1.0);
    float _584 = -_578;
    float _586 = fma(_584, (*spvDescriptorSet0.fp_c3)._m0[35].z, _267);
    float _588 = _582 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _590 = fma(_586, _588, _153);
    float _592 = -_590;
    bool _594 = _592 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _596 = float(_594);
    float _598 = -_590;
    bool _600 = _598 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _602 = float(_600);
    float _604 = _596 + _602;
    float _606 = precise::min(_604, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _608 = abs(_153);
    float _610 = log2(_608);
    float _612 = trunc(_606);
    int _614 = int(_612);
    float _616 = _610 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _618 = exp2(_616);
    int _620 = _614 << 6;
    bool _622 = _614 != 0;
    int _624 = _620 + 48;
    uint _627 = uint(int(uint(_624) >> uint(2)));
    uint _629 = uint(int(uint(int(_627)) >> uint(2)));
    int _631 = int(_627) & 3;
    float _633 = (*spvDescriptorSet0.fp_c3)._m0[int(_629)][_631];
    int _635 = int(_627) + 1;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    int _639 = _635 & 3;
    float _641 = (*spvDescriptorSet0.fp_c3)._m0[int(_637)][_639];
    int _643 = _620 + 56;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    uint _647 = uint(int(uint(int(_645)) >> uint(2)));
    int _649 = int(_645) & 3;
    float _651 = (*spvDescriptorSet0.fp_c3)._m0[int(_647)][_649];
    int _653 = int(_645) + 1;
    uint _655 = uint(int(uint(_653) >> uint(2)));
    int _657 = _653 & 3;
    float _659 = (*spvDescriptorSet0.fp_c3)._m0[int(_655)][_657];
    float _661 = fma(_618, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _663 = precise::clamp(_661, 0.0, 1.0);
    float _665 = fma(_663, -2.0, 3.0);
    float _667 = -_578;
    float _669 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[35].x, _263);
    uint _671 = uint(int(uint(_620) >> uint(2)));
    uint _673 = uint(int(uint(int(_671)) >> uint(2)));
    int _675 = int(_671) & 3;
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[int(_673)][_675];
    int _679 = int(_671) + 1;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    int _683 = _679 & 3;
    float _685 = (*spvDescriptorSet0.fp_c3)._m0[int(_681)][_683];
    float _687 = -_578;
    float _689 = fma(_687, (*spvDescriptorSet0.fp_c3)._m0[35].y, _265);
    float _691 = _663 * _663;
    float _693 = fma(_669, _588, _157);
    float _695 = fma(_689, _588, _155);
    float _697 = _691 * _665;
    int _699 = _620 + 16;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    uint _703 = uint(int(uint(int(_701)) >> uint(2)));
    int _705 = int(_701) & 3;
    float _707 = (*spvDescriptorSet0.fp_c3)._m0[int(_703)][_705];
    int _709 = int(_701) + 1;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    int _713 = _709 & 3;
    float _715 = (*spvDescriptorSet0.fp_c3)._m0[int(_711)][_713];
    float _717 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _719 = -_697;
    float _721 = _719 + 1.0;
    float _723 = precise::max(0.0, _717);
    float _725 = fma(_721, (*spvDescriptorSet0.fp_c3)._m0[44].w, _697);
    int _727 = _620 + 32;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    uint _731 = uint(int(uint(int(_729)) >> uint(2)));
    int _733 = int(_729) & 3;
    float _735 = (*spvDescriptorSet0.fp_c3)._m0[int(_731)][_733];
    int _737 = int(_729) + 1;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    int _741 = _737 & 3;
    float _743 = (*spvDescriptorSet0.fp_c3)._m0[int(_739)][_741];
    float _745 = _725 * _723;
    int _747 = _620 + 8;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.fp_c3)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.fp_c3)._m0[int(_759)][_761];
    int _765 = _620 + 24;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.fp_c3)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.fp_c3)._m0[int(_777)][_779];
    float _783 = _695 * _641;
    float _785 = fma(_693, _633, _783);
    int _787 = _620 + 40;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    uint _791 = uint(int(uint(int(_789)) >> uint(2)));
    int _793 = int(_789) & 3;
    float _795 = (*spvDescriptorSet0.fp_c3)._m0[int(_791)][_793];
    int _797 = int(_789) + 1;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    int _801 = _797 & 3;
    float _803 = (*spvDescriptorSet0.fp_c3)._m0[int(_799)][_801];
    float _805 = fma(_590, _651, _785);
    bool _807 = _153 >= (-8000.0);
    bool _809 = isnan(_153);
    bool _811 = _807 || _809;
    bool _813 = isnan(-8000.0);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = _805 + _659;
    float _821 = _817 * _745;
    float _823 = _695 * _685;
    float _825 = 1.0 / _819;
    float _827 = _821 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _829 = fma(_693, _677, _823);
    float _831 = _695 * _715;
    float _833 = fma(_693, _707, _831);
    float _835 = _695 * _743;
    float _837 = fma(_693, _735, _835);
    float _839 = fma(_590, _755, _829);
    float _841 = _839 + _763;
    float _843 = fma(_590, _773, _833);
    float _845 = _843 + _781;
    float _847 = _841 * _825;
    float _849 = fma(_590, _795, _837);
    float _851 = _849 + _803;
    float _853 = _851 * _825;
    float _855 = precise::clamp(_853, 0.0, 1.0);
    float _857 = abs(_566);
    float _859 = _857 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _861 = -_568;
    float _863 = _861 + 1.0;
    float _865 = -_859;
    float _867 = fma(_817, _865, 1.0);
    float _869 = _863 * _827;
    float _871 = precise::clamp(_869, 0.0, 1.0);
    float _873 = _845 * _825;
    float _875 = -_871;
    float _877 = fma(_875, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _879 = precise::min(_867, 1.0);
    float _881 = precise::min(_879, _877);
    float _937;
    if (!_622)
    {
        float _883 = rint(_606);
        float _885 = precise::max(_883, 0.0);
        uint _887 = uint(_885);
        uint _889 = clamp(_887, 0u, 65535u);
        float _891 = _855 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _893 = fma(_891, 0.5, _873);
        float _895 = fma(_891, 0.5, _847);
        float _897 = fma(_891, -0.5, _847);
        float _899 = fma(_891, -0.5, _873);
        float3 _2517 = float3(_847, _893, float(int(_889)));
        float3 _2521 = select(_2517, float3(0.0), isnan(_2517));
        float _901 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2521.xy, uint(rint(_2521.z)), _855);
        float3 _2530 = float3(_895, _893, float(int(_889)));
        float3 _2532 = select(_2530, float3(0.0), isnan(_2530));
        float _903 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2532.xy, uint(rint(_2532.z)), _855);
        float3 _2541 = float3(_897, _893, float(int(_889)));
        float3 _2543 = select(_2541, float3(0.0), isnan(_2541));
        float _905 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2543.xy, uint(rint(_2543.z)), _855);
        float3 _2552 = float3(_895, _873, float(int(_889)));
        float3 _2554 = select(_2552, float3(0.0), isnan(_2552));
        float _907 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2554.xy, uint(rint(_2554.z)), _855);
        float3 _2563 = float3(_847, _873, float(int(_889)));
        float3 _2565 = select(_2563, float3(0.0), isnan(_2563));
        float _909 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2565.xy, uint(rint(_2565.z)), _855);
        float3 _2574 = float3(_897, _873, float(int(_889)));
        float3 _2576 = select(_2574, float3(0.0), isnan(_2574));
        float _911 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2576.xy, uint(rint(_2576.z)), _855);
        float3 _2585 = float3(_895, _899, float(int(_889)));
        float3 _2587 = select(_2585, float3(0.0), isnan(_2585));
        float _913 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2587.xy, uint(rint(_2587.z)), _855);
        float3 _2596 = float3(_847, _899, float(int(_889)));
        float3 _2598 = select(_2596, float3(0.0), isnan(_2596));
        float _915 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2598.xy, uint(rint(_2598.z)), _855);
        float3 _2607 = float3(_897, _899, float(int(_889)));
        float3 _2609 = select(_2607, float3(0.0), isnan(_2607));
        float _917 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2609.xy, uint(rint(_2609.z)), _855);
        float _919 = _903 + _901;
        float _921 = _919 + _905;
        float _923 = _921 + _907;
        float _925 = _923 + _909;
        float _927 = _925 + _911;
        float _929 = _927 + _913;
        float _931 = _929 + _915;
        float _933 = _931 + _917;
        float _935 = _933 * 0.111111111938953399658203125;
        _937 = _935;
        _939 = true;
    }
    else
    {
        float _941 = rint(_606);
        float _943 = precise::max(_941, 0.0);
        uint _945 = uint(_943);
        uint _947 = clamp(_945, 0u, 65535u);
        float3 _2656 = float3(_847, _873, float(int(_947)));
        float3 _2658 = select(_2656, float3(0.0), isnan(_2656));
        float _949 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2658.xy, uint(rint(_2658.z)), _855);
        _937 = _949;
    }
    _939 = false;
    float _951 = _937;
    float _953 = _536 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _955 = _536 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _957 = -_153;
    float _959 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _961 = _957 + _959;
    float _963 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].x, _953);
    float _965 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].x, _955);
    float _967 = -_153;
    float _969 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _971 = _967 + _969;
    float _973 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].z, _963);
    float _975 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].z, _965);
    float _977 = _973 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _979 = _975 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _981 = trunc(_977);
    int _983 = int(_981);
    float _985 = trunc(_979);
    int _987 = int(_985);
    int _989 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _991 = _983 + _989;
    int _993 = _991 + 1;
    bool _995 = _993 >= 0;
    int _997 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _999 = _987 + _997;
    int _1001 = _999 + 1;
    bool _1003 = _993 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1005 = !_995;
    bool _1007 = _1003 || _1005;
    bool _1009 = _1001 < 0;
    bool _1011 = _1009 || _1007;
    bool _1013 = _1001 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1015 = _1013 || _1011;
    float _1017 = as_type<float>(_983);
    if (_1015)
    {
        _1017 = 1.0;
    }
    float _1019 = _1017;
    float _1021 = _1019;
    if (!_1015)
    {
        int _1023 = _1001 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1025 = _1023 + _993;
        float _1027 = floor(_977);
        int _1029 = _1025 << 2;
        int _1031 = _1025 >> 2;
        int _1033 = 12 & _1029;
        int _1035 = _1031 << 4;
        int _1037 = _1035 + _1033;
        float _1039 = floor(_979);
        uint _1041 = uint(int(uint(_1037) >> uint(2)));
        uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
        int _1045 = int(_1041) & 3;
        float _1047 = (*spvDescriptorSet0.fp_c5)._m0[int(_1043)][_1045];
        float _1049 = -_1027;
        float _1051 = _977 + _1049;
        float _1053 = -_1039;
        float _1055 = _979 + _1053;
        float _1057 = rint(_1047);
        float _1059 = precise::max(_1057, 0.0);
        uint _1061 = uint(_1059);
        uint _1063 = clamp(_1061, 0u, 65535u);
        float3 _2845 = float3(_1051, _1055, float(int(_1063)));
        float3 _2847 = select(_2845, float3(0.0), isnan(_2845));
        float _1065 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2847.xy, uint(rint(_2847.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2847.xy, uint(rint(_2847.z)), level(0.0)).x;
        int _1067 = _1025 << 4;
        int _1069 = _1067 + 1648;
        int _1071 = _1037 + 8048;
        uint _1073 = uint(int(uint(_1071) >> uint(2)));
        uint _1075 = uint(int(uint(int(_1073)) >> uint(2)));
        int _1077 = int(_1073) & 3;
        float _1079 = (*spvDescriptorSet0.fp_c5)._m0[int(_1075)][_1077];
        uint _1081 = uint(int(uint(_1069) >> uint(2)));
        uint _1083 = uint(int(uint(int(_1081)) >> uint(2)));
        int _1085 = int(_1081) & 3;
        float _1087 = (*spvDescriptorSet0.fp_c5)._m0[int(_1083)][_1085];
        int _1089 = int(_1081) + 1;
        uint _1091 = uint(int(uint(_1089) >> uint(2)));
        int _1093 = _1089 & 3;
        float _1095 = (*spvDescriptorSet0.fp_c5)._m0[int(_1091)][_1093];
        int _1097 = _1069 + 8;
        uint _1099 = uint(int(uint(_1097) >> uint(2)));
        uint _1101 = uint(int(uint(int(_1099)) >> uint(2)));
        int _1103 = int(_1099) & 3;
        float _1105 = (*spvDescriptorSet0.fp_c5)._m0[int(_1101)][_1103];
        int _1107 = int(_1099) + 1;
        uint _1109 = uint(int(uint(_1107) >> uint(2)));
        int _1111 = _1107 & 3;
        float _1113 = (*spvDescriptorSet0.fp_c5)._m0[int(_1109)][_1111];
        float _1115 = _1079 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1117 = _536 * _1095;
        float _1119 = fma(_532, _1087, _1117);
        float _1121 = 1.0 / _1079;
        float _1123 = fma(_534, _1105, _1119);
        float _1125 = _1123 + _1113;
        float _1127 = precise::clamp(_1125, 0.0, 1.0);
        float _1129 = -_1127;
        float _1131 = _1129 + _1065;
        float _1133 = fma(_1121, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1131);
        float _1135 = _1115 * _1133;
        float _1137 = exp2(_1135);
        float _1139 = 0.0 + _1137;
        float _1141 = precise::clamp(_1139, 0.0, 1.0);
        _1021 = _1141;
    }
    float _1143 = _1021;
    float _1145 = precise::min(_1143, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1147 = _961 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1149 = precise::clamp(_1147, 0.0, 1.0);
    float _1151 = -_951;
    float _1153 = _1151 + 1.0;
    float _1155 = _971 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1157 = precise::clamp(_1155, 0.0, 1.0);
    float _1159 = -_1145;
    float _1161 = _1159 + 1.0;
    float _1163 = fma(_1149, _1153, _951);
    float _1165 = fma(_1157, _1161, _1145);
    out.m_62.x = _1163;
    out.m_62.y = _1165;
    out.m_62.z = 1.0;
    out.m_62.w = _881;
    out.m_64.x = _572;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

