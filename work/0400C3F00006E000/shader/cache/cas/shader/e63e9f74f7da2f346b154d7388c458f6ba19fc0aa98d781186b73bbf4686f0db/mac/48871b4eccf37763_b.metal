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
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_16 [[id(13)]];
    sampler fp_t_tcb_16Smplr [[id(14)]];
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
    bool _1148 = false;
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
    float2 _1413 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1413, float2(0.0), isnan(_1413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1413, float2(0.0), isnan(_1413))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1428 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1428, float2(0.0), isnan(_1428))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1428, float2(0.0), isnan(_1428))).x;
    float2 _1436 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1436, float2(0.0), isnan(_1436))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1436, float2(0.0), isnan(_1436))).x;
    float _105 = in.m_59.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_59.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_61.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_61.y;
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
    float _147 = _89 * _133;
    float _149 = -_97;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _153 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].x, _151);
    float _155 = _153 * _141;
    float _157 = _153 * _143;
    float _159 = -_101;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].x, _161);
    float _165 = _89 * _127;
    float _167 = _155 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _169 = _155 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _171 = _89 * _139;
    float _173 = -_157;
    float _175 = fma(_163, _145, _173);
    float _177 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].x, _167);
    float _179 = -_103;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[41].x, _181);
    float _185 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].x, _169);
    float _187 = -_155;
    float _189 = fma(_163, _165, _187);
    float _191 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _177);
    float _193 = -_153;
    float _195 = _193 + _163;
    float _197 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _199 = -_157;
    float _201 = fma(_183, _147, _199);
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _205 = -_155;
    float _207 = fma(_183, _171, _205);
    float _209 = _197 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _211 = -_153;
    float _213 = _211 + _183;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _217 = _203 + _215;
    float _219 = _195 * _201;
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _223 = _209 + _221;
    float _225 = _189 * _213;
    float _227 = _217 * _217;
    float _229 = -_219;
    float _231 = fma(_175, _213, _229);
    float _233 = _175 * _207;
    float _235 = -_225;
    float _237 = fma(_195, _207, _235);
    float _239 = fma(_223, _223, _227);
    float _241 = _231 * _231;
    float _243 = -_233;
    float _245 = fma(_189, _201, _243);
    float _247 = sqrt(_239);
    float _249 = fma(_237, _237, _241);
    float _251 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _253 = fma(_245, _245, _249);
    float _255 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _251);
    float _257 = rsqrt(_253);
    float _259 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _255);
    float _261 = _259 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _265 = _247 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _267 = _237 * _257;
    float _269 = _231 * _257;
    float _271 = _245 * _257;
    bool _273 = !_265;
    float _275 = _209;
    float _277 = _203;
    float _279 = _261;
    if (!_273)
    {
        float _281 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _283 = _247 + _281;
        float _285 = _261 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _287 = rsqrt(_239);
        float _289 = -_261;
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = _289 + _291;
        float _295 = abs(_285);
        float _297 = abs(_283);
        float _299 = precise::max(_295, _297);
        float _301 = _293 * _293;
        bool _303 = _299 >= 16.0;
        float _305 = _223 * _287;
        float _307 = _217 * _287;
        float _309 = -_223;
        float _311 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[41].z, _309);
        float _313 = -_217;
        float _315 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = _283;
        float _319 = _285;
        int _322 = as_type<int>(_315);
        if (_303)
        {
            float _324 = _283 * 0.0625;
            _317 = _324;
        }
        float _326 = _317;
        if (_303)
        {
            float _328 = _285 * 0.0625;
            _319 = _328;
        }
        float _330 = _319;
        float _332 = fma(_311, _311, _301);
        float _334 = abs(_326);
        bool _336 = _334 != 0.0;
        bool _338 = isnan(_334);
        bool _340 = _336 || _338;
        bool _342 = isnan(0.0);
        bool _344 = _340 || _342;
        float _346 = fma(_315, _315, _332);
        float _348 = abs(_330);
        bool _350 = _348 == 0.0;
        float _352 = abs(_330);
        bool _354 = _352 == 0.0;
        bool _356 = !_344;
        bool _358 = _354 && _356;
        float _360 = sqrt(_346);
        bool _362 = false;
        if (_358)
        {
            bool _364 = as_type<int>(_330) >= 0;
            _362 = _364;
        }
        bool _366 = _362;
        int _368 = _366 ? (-1) : 0;
        if (_358)
        {
            int _370 = _366 ? 0 : 1078530011;
            _322 = _370;
        }
        int _372 = _322;
        int _374 = _372;
        if (_358)
        {
            int _376 = int(0x80000000) & as_type<int>(_326);
            int _378 = _372 | _376;
            _374 = _378;
        }
        int _380 = _374;
        bool _382 = !_344;
        bool _384 = _382 && _350;
        int _386 = _380;
        float _388 = as_type<float>(_380);
        if (!_384)
        {
            float _390 = abs(_326);
            bool _392 = _390 != as_type<float>(0x7f800000u /* inf */);
            bool _394 = isnan(_390);
            bool _396 = _392 || _394;
            bool _398 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _400 = _396 || _398;
            float _402 = abs(_330);
            bool _404 = _402 == as_type<float>(0x7f800000u /* inf */);
            float _406 = abs(_330);
            bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
            bool _410 = !_400;
            bool _412 = _408 && _410;
            if (_412)
            {
                bool _414 = as_type<int>(_330) >= 0;
                _368 = _414 ? (-1) : 0;
            }
            int _416 = _368;
            if (_412)
            {
                _386 = 1075235812;
            }
            int _418 = _386;
            int _420 = _418;
            if (_412)
            {
                int _422 = ~_416;
                int _424 = (_422 != 0) ? _418 : 1061752795;
                _420 = _424;
            }
            int _426 = _420;
            float _428 = as_type<float>(_426);
            if (_412)
            {
                int _430 = int(0x80000000) & as_type<int>(_326);
                int _432 = _426 | _430;
                _428 = as_type<float>(_432);
            }
            float _434 = _428;
            bool _436 = !_400;
            bool _438 = _436 && _404;
            _388 = _434;
            if (!_438)
            {
                float _440 = abs(_326);
                float _442 = abs(_330);
                float _444 = precise::max(_440, _442);
                float _446 = abs(_326);
                float _448 = abs(_330);
                float _450 = precise::min(_446, _448);
                float _452 = 1.0 / _444;
                float _454 = abs(_326);
                float _456 = abs(_330);
                bool _458 = _454 > _456;
                bool _460 = as_type<int>(_330) >= 0;
                float _462 = _450 * _452;
                float _464 = abs(_326);
                float _466 = abs(_330);
                float _468 = _464 + _466;
                int _470 = as_type<int>(_326) & int(0x80000000);
                float _472 = _462 * _462;
                bool _474 = _468 > as_type<float>(0x7f800000u /* inf */);
                bool _476 = isnan(_468);
                bool _478 = _474 || _476;
                bool _480 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _482 = _478 || _480;
                float _484 = _472 + 11.33538818359375;
                float _486 = fma(_472, _484, 28.84246826171875);
                float _488 = fma(_472, _486, 19.6966705322265625);
                float _490 = fma(_472, -0.82336294651031494140625, -5.674867153167724609375);
                float _492 = fma(_472, _490, -6.565555095672607421875);
                float _494 = 1.0 / _488;
                float _496 = _472 * _492;
                float _498 = _462 * _496;
                float _500 = fma(_498, _494, _462);
                float _502 = _500;
                _388 = _468;
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
                if (!_482)
                {
                    int _518 = _470 | _516;
                    _388 = as_type<float>(_518);
                }
            }
        }
        float _520 = _388;
        float _522 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _524 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _526 = _360 + _524;
        float _528 = fma(_305, _522, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _530 = fma(_307, _522, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _275 = _528;
        _277 = _530;
        _279 = _526;
    }
    float _532 = _275;
    float _534 = _277;
    float _536 = _279;
    float2 _2097 = float2(_91, _93);
    float2 _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2097, float2(0.0), isnan(_2097))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2097, float2(0.0), isnan(_2097))).xy;
    float _542 = _540.x;
    float _544 = _540.y;
    float _546 = fma(_532, 6.2500002968590706586837768554688e-05, 0.5);
    float _548 = fma(_534, 6.2500002968590706586837768554688e-05, 0.5);
    float _550 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _552 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float2 _2123 = float2(_546, _548);
    float _554 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2123, float2(0.0), isnan(_2123))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2123, float2(0.0), isnan(_2123))).x;
    float2 _2131 = float2(_550, _552);
    float4 _557 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2131, float2(0.0), isnan(_2131)), int2(0), component::x).xyzw;
    float _559 = _557.x;
    float _561 = _557.y;
    float _563 = _557.z;
    float _565 = _557.w;
    float2 _2147 = float2(_550, _552);
    float4 _567 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2147, float2(0.0), isnan(_2147)), int2(0), component::w).xyzw;
    float _569 = _567.x;
    float _571 = _567.y;
    float _573 = _567.z;
    float _575 = _567.w;
    float _577 = _269 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _579 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _581 = fma(_534, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _583 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].x, _577);
    float _585 = fma(_542, 2.0, -1.0);
    float _587 = fma(_544, 2.0, -1.0);
    float _589 = _585 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _591 = _587 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _593 = fma(_589, 2.0, _91);
    float2 _2203 = float2(_546, _548);
    float _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2203, float2(0.0), isnan(_2203)), level(_554)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2203, float2(0.0), isnan(_2203)), level(_554)).x;
    float2 _2212 = float2(_579, _581);
    float _597 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2212, float2(0.0), isnan(_2212))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2212, float2(0.0), isnan(_2212))).x;
    float _599 = fma(_591, 2.0, _93);
    float2 _2223 = float2(_593, _599);
    float2 _601 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2223, float2(0.0), isnan(_2223))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2223, float2(0.0), isnan(_2223))).yz;
    float _603 = _601.x;
    float _605 = _601.y;
    float _607 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[35].z, _583);
    float _609 = abs(_153);
    float _611 = log2(_609);
    float _613 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _615 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _617 = -_607;
    float _619 = fma(_617, _607, 1.0);
    float _621 = -_607;
    float _623 = fma(_621, (*spvDescriptorSet0.fp_c3)._m0[35].z, _271);
    float _625 = -_607;
    float _627 = fma(_625, (*spvDescriptorSet0.fp_c3)._m0[35].x, _267);
    float _629 = -_607;
    float _631 = fma(_629, (*spvDescriptorSet0.fp_c3)._m0[35].y, _269);
    float _633 = _619 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _635 = floor(_613);
    float _637 = fma(_623, _633, _153);
    float _639 = fma(_627, _633, _157);
    float _641 = fma(_631, _633, _155);
    float _643 = -_637;
    bool _645 = _643 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _647 = float(_645);
    float _649 = _611 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _651 = -_637;
    bool _653 = _651 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _655 = float(_653);
    float _657 = floor(_615);
    float _659 = _647 + _655;
    float _661 = -_635;
    float _663 = _613 + _661;
    float _665 = exp2(_649);
    float _667 = precise::min(_659, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _669 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _671 = _663 + _669;
    float _673 = trunc(_667);
    int _675 = int(_673);
    float _677 = -_657;
    float _679 = _615 + _677;
    float _681 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _683 = _679 + _681;
    float _685 = fma(_665, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _687 = precise::clamp(_685, 0.0, 1.0);
    float _689 = -_671;
    float _691 = _689 + 1.0;
    float _693 = -_683;
    float _695 = _693 + 1.0;
    float _697 = _671 * _683;
    float _699 = fma(_687, -2.0, 3.0);
    float _701 = _683 * _691;
    float _703 = _671 * _695;
    float _705 = _691 * _695;
    int _707 = _675 << 6;
    float _709 = _687 * _687;
    bool _711 = _675 != 0;
    uint _714 = uint(int(uint(_707) >> uint(2)));
    uint _716 = uint(int(uint(int(_714)) >> uint(2)));
    int _718 = int(_714) & 3;
    float _720 = (*spvDescriptorSet0.fp_c3)._m0[int(_716)][_718];
    int _722 = int(_714) + 1;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    int _726 = _722 & 3;
    float _728 = (*spvDescriptorSet0.fp_c3)._m0[int(_724)][_726];
    float _730 = _709 * _699;
    int _732 = _707 + 16;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    uint _736 = uint(int(uint(int(_734)) >> uint(2)));
    int _738 = int(_734) & 3;
    float _740 = (*spvDescriptorSet0.fp_c3)._m0[int(_736)][_738];
    int _742 = int(_734) + 1;
    uint _744 = uint(int(uint(_742) >> uint(2)));
    int _746 = _742 & 3;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[int(_744)][_746];
    int _750 = _707 + 32;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.fp_c3)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.fp_c3)._m0[int(_762)][_764];
    int _768 = _707 + 48;
    uint _770 = uint(int(uint(_768) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.fp_c3)._m0[int(_772)][_774];
    int _778 = int(_770) + 1;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    int _782 = _778 & 3;
    float _784 = (*spvDescriptorSet0.fp_c3)._m0[int(_780)][_782];
    float _786 = _641 * _728;
    float _788 = fma(_639, _720, _786);
    int _790 = _707 + 8;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    uint _794 = uint(int(uint(int(_792)) >> uint(2)));
    int _796 = int(_792) & 3;
    float _798 = (*spvDescriptorSet0.fp_c3)._m0[int(_794)][_796];
    int _800 = int(_792) + 1;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    int _804 = _800 & 3;
    float _806 = (*spvDescriptorSet0.fp_c3)._m0[int(_802)][_804];
    float _808 = _641 * _748;
    float _810 = fma(_639, _740, _808);
    float _812 = _641 * _766;
    float _814 = fma(_639, _758, _812);
    int _816 = _707 + 24;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.fp_c3)._m0[int(_820)][_822];
    int _826 = int(_818) + 1;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    int _830 = _826 & 3;
    float _832 = (*spvDescriptorSet0.fp_c3)._m0[int(_828)][_830];
    float _834 = _641 * _784;
    float _836 = fma(_639, _776, _834);
    float _838 = -_730;
    float _840 = _838 + 1.0;
    float _842 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _844 = fma(_840, (*spvDescriptorSet0.fp_c3)._m0[44].w, _730);
    float _846 = precise::max(0.0, _842);
    float _848 = fma(_637, _798, _788);
    float _850 = _844 * _846;
    int _852 = _707 + 40;
    uint _854 = uint(int(uint(_852) >> uint(2)));
    uint _856 = uint(int(uint(int(_854)) >> uint(2)));
    int _858 = int(_854) & 3;
    float _860 = (*spvDescriptorSet0.fp_c3)._m0[int(_856)][_858];
    int _862 = int(_854) + 1;
    uint _864 = uint(int(uint(_862) >> uint(2)));
    int _866 = _862 & 3;
    float _868 = (*spvDescriptorSet0.fp_c3)._m0[int(_864)][_866];
    float _870 = _848 + _806;
    float _872 = precise::min(_153, -1.0000000116860974230803549289703e-07);
    float _874 = fma(_637, _824, _810);
    float _876 = 1.0 / _872;
    float _878 = _874 + _832;
    float _880 = -_559;
    float _882 = fma(_880, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _884 = -_561;
    float _886 = fma(_884, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _888 = -_563;
    float _890 = fma(_888, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _892 = -_565;
    float _894 = fma(_892, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _896 = 1.0 / _882;
    float _898 = 1.0 / _886;
    float _900 = _876 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _902 = 1.0 / _890;
    float _904 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _906 = -_153;
    float _908 = fma(_896, _904, _906);
    float _910 = abs(_908);
    float _912 = _910 * _900;
    float _914 = 1.0 / _894;
    float _916 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _918 = -_153;
    float _920 = fma(_898, _916, _918);
    float _922 = fma(_637, _860, _814);
    float _924 = abs(_920);
    float _926 = _924 * _900;
    float _928 = _922 + _868;
    float _930 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _932 = -_153;
    float _934 = fma(_902, _930, _932);
    float _936 = exp2(_912);
    float _938 = abs(_934);
    float _940 = _938 * _900;
    float _942 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _944 = -_153;
    float _946 = fma(_914, _942, _944);
    float _948 = exp2(_926);
    int _950 = _707 + 56;
    uint _952 = uint(int(uint(_950) >> uint(2)));
    uint _954 = uint(int(uint(int(_952)) >> uint(2)));
    int _956 = int(_952) & 3;
    float _958 = (*spvDescriptorSet0.fp_c3)._m0[int(_954)][_956];
    int _960 = int(_952) + 1;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    int _964 = _960 & 3;
    float _966 = (*spvDescriptorSet0.fp_c3)._m0[int(_962)][_964];
    float _968 = abs(_946);
    float _970 = _968 * _900;
    float _972 = exp2(_940);
    float _974 = abs(_701);
    float _976 = _974 * _936;
    float _978 = exp2(_970);
    float _980 = abs(_697);
    float _982 = _980 * _948;
    float _984 = abs(_703);
    float _986 = _984 * _972;
    float _988 = _976 + _982;
    float _990 = _986 + _988;
    float _992 = abs(_705);
    float _994 = _992 * _978;
    float _996 = _994 + _990;
    float _998 = -_994;
    bool _1000 = _990 != _998;
    bool _1002 = isnan(_990);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(_998);
    bool _1008 = _1004 || _1006;
    float _1010 = 1.0 / _996;
    float _1012 = fma(_637, _958, _836);
    float _1014 = _1012 + _966;
    float _1016 = _982 * _1010;
    float _1018 = _976 * _1010;
    bool _1020 = _153 >= (-8000.0);
    bool _1022 = isnan(_153);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan(-8000.0);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = _986 * _1010;
    float _1034 = _994 * _1010;
    float _1036 = _1008 ? _1016 : 0.25;
    float _1038 = _1030 * _850;
    float _1040 = _1008 ? _1032 : 0.25;
    float _1042 = abs(_595);
    float _1044 = _1042 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1046 = _1036 * _571;
    float _1048 = _1008 ? _1018 : 0.25;
    float _1050 = -_597;
    float _1052 = _1050 + 1.0;
    float _1054 = 1.0 / _1014;
    float _1056 = _1008 ? _1034 : 0.25;
    float _1058 = -_1044;
    float _1060 = fma(_1030, _1058, 1.0);
    float _1062 = fma(_1048, _569, _1046);
    float _1064 = _1038 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1066 = fma(_1040, _573, _1062);
    float _1068 = _1052 * _1064;
    float _1070 = precise::clamp(_1068, 0.0, 1.0);
    float _1072 = precise::min(_1060, 1.0);
    float _1074 = fma(_1056, _575, _1066);
    float _1076 = -_1070;
    float _1078 = fma(_1076, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1080 = _870 * _1054;
    float _1082 = _878 * _1054;
    float _1084 = _928 * _1054;
    float _1086 = precise::clamp(_1084, 0.0, 1.0);
    float _1088 = precise::min(_1072, _1078);
    float _1090 = precise::min(_1074, 1.0);
    float _1146;
    if (!_711)
    {
        float _1092 = rint(_667);
        float _1094 = precise::max(_1092, 0.0);
        uint _1096 = uint(_1094);
        uint _1098 = clamp(_1096, 0u, 65535u);
        float _1100 = _1086 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1102 = fma(_1100, 0.5, _1082);
        float _1104 = fma(_1100, 0.5, _1080);
        float _1106 = fma(_1100, -0.5, _1080);
        float _1108 = fma(_1100, -0.5, _1082);
        float3 _3010 = float3(_1080, _1102, float(int(_1098)));
        float3 _3014 = select(_3010, float3(0.0), isnan(_3010));
        float _1110 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3014.xy, uint(rint(_3014.z)), _1086);
        float3 _3023 = float3(_1104, _1102, float(int(_1098)));
        float3 _3025 = select(_3023, float3(0.0), isnan(_3023));
        float _1112 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3025.xy, uint(rint(_3025.z)), _1086);
        float3 _3034 = float3(_1106, _1102, float(int(_1098)));
        float3 _3036 = select(_3034, float3(0.0), isnan(_3034));
        float _1114 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3036.xy, uint(rint(_3036.z)), _1086);
        float3 _3045 = float3(_1104, _1082, float(int(_1098)));
        float3 _3047 = select(_3045, float3(0.0), isnan(_3045));
        float _1116 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3047.xy, uint(rint(_3047.z)), _1086);
        float3 _3056 = float3(_1080, _1082, float(int(_1098)));
        float3 _3058 = select(_3056, float3(0.0), isnan(_3056));
        float _1118 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3058.xy, uint(rint(_3058.z)), _1086);
        float3 _3067 = float3(_1106, _1082, float(int(_1098)));
        float3 _3069 = select(_3067, float3(0.0), isnan(_3067));
        float _1120 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3069.xy, uint(rint(_3069.z)), _1086);
        float3 _3078 = float3(_1104, _1108, float(int(_1098)));
        float3 _3080 = select(_3078, float3(0.0), isnan(_3078));
        float _1122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3080.xy, uint(rint(_3080.z)), _1086);
        float3 _3089 = float3(_1080, _1108, float(int(_1098)));
        float3 _3091 = select(_3089, float3(0.0), isnan(_3089));
        float _1124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3091.xy, uint(rint(_3091.z)), _1086);
        float3 _3100 = float3(_1106, _1108, float(int(_1098)));
        float3 _3102 = select(_3100, float3(0.0), isnan(_3100));
        float _1126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3102.xy, uint(rint(_3102.z)), _1086);
        float _1128 = _1112 + _1110;
        float _1130 = _1128 + _1114;
        float _1132 = _1130 + _1116;
        float _1134 = _1132 + _1118;
        float _1136 = _1134 + _1120;
        float _1138 = _1136 + _1122;
        float _1140 = _1138 + _1124;
        float _1142 = _1140 + _1126;
        float _1144 = _1142 * 0.111111111938953399658203125;
        _1146 = _1144;
        _1148 = true;
    }
    else
    {
        float _1150 = rint(_667);
        float _1152 = precise::max(_1150, 0.0);
        uint _1154 = uint(_1152);
        uint _1156 = clamp(_1154, 0u, 65535u);
        float3 _3149 = float3(_1080, _1082, float(int(_1156)));
        float3 _3151 = select(_3149, float3(0.0), isnan(_3149));
        float _1158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3151.xy, uint(rint(_3151.z)), _1086);
        _1146 = _1158;
    }
    _1148 = false;
    float _1160 = _1146;
    float _1162 = _536 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1164 = _536 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1166 = -_153;
    float _1168 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1170 = _1166 + _1168;
    float _1172 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1162);
    float _1174 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1164);
    float _1176 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1172);
    float _1178 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1174);
    float _1180 = _1176 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1182 = _1178 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1184 = trunc(_1180);
    int _1186 = int(_1184);
    float _1188 = trunc(_1182);
    int _1190 = int(_1188);
    int _1192 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1194 = _1186 + _1192;
    int _1196 = _1194 + 1;
    bool _1198 = _1196 >= 0;
    int _1200 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1202 = _1190 + _1200;
    int _1204 = _1202 + 1;
    float _1206 = -_153;
    float _1208 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1210 = _1206 + _1208;
    bool _1212 = _1196 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1214 = !_1198;
    bool _1216 = _1212 || _1214;
    bool _1218 = _1204 < 0;
    bool _1220 = _1218 || _1216;
    bool _1222 = _1204 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1224 = _1222 || _1220;
    float _1226 = as_type<float>(_1186);
    if (_1224)
    {
        _1226 = 1.0;
    }
    float _1228 = _1226;
    float _1230 = _1228;
    if (!_1224)
    {
        int _1232 = _1204 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1234 = _1232 + _1196;
        float _1236 = floor(_1182);
        int _1238 = _1234 << 2;
        int _1240 = _1234 >> 2;
        int _1242 = 12 & _1238;
        int _1244 = _1240 << 4;
        int _1246 = _1244 + _1242;
        float _1248 = floor(_1180);
        uint _1250 = uint(int(uint(_1246) >> uint(2)));
        uint _1252 = uint(int(uint(int(_1250)) >> uint(2)));
        int _1254 = int(_1250) & 3;
        float _1256 = (*spvDescriptorSet0.fp_c5)._m0[int(_1252)][_1254];
        float _1258 = -_1236;
        float _1260 = _1182 + _1258;
        float _1262 = -_1248;
        float _1264 = _1180 + _1262;
        float _1266 = rint(_1256);
        float _1268 = precise::max(_1266, 0.0);
        uint _1270 = uint(_1268);
        uint _1272 = clamp(_1270, 0u, 65535u);
        float3 _3338 = float3(_1264, _1260, float(int(_1272)));
        float3 _3340 = select(_3338, float3(0.0), isnan(_3338));
        float _1274 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3340.xy, uint(rint(_3340.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3340.xy, uint(rint(_3340.z)), level(0.0)).x;
        int _1276 = _1234 << 4;
        int _1278 = _1276 + 1648;
        int _1280 = _1246 + 8048;
        uint _1282 = uint(int(uint(_1280) >> uint(2)));
        uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
        int _1286 = int(_1282) & 3;
        float _1288 = (*spvDescriptorSet0.fp_c5)._m0[int(_1284)][_1286];
        uint _1290 = uint(int(uint(_1278) >> uint(2)));
        uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
        int _1294 = int(_1290) & 3;
        float _1296 = (*spvDescriptorSet0.fp_c5)._m0[int(_1292)][_1294];
        int _1298 = int(_1290) + 1;
        uint _1300 = uint(int(uint(_1298) >> uint(2)));
        int _1302 = _1298 & 3;
        float _1304 = (*spvDescriptorSet0.fp_c5)._m0[int(_1300)][_1302];
        int _1306 = _1278 + 8;
        uint _1308 = uint(int(uint(_1306) >> uint(2)));
        uint _1310 = uint(int(uint(int(_1308)) >> uint(2)));
        int _1312 = int(_1308) & 3;
        float _1314 = (*spvDescriptorSet0.fp_c5)._m0[int(_1310)][_1312];
        int _1316 = int(_1308) + 1;
        uint _1318 = uint(int(uint(_1316) >> uint(2)));
        int _1320 = _1316 & 3;
        float _1322 = (*spvDescriptorSet0.fp_c5)._m0[int(_1318)][_1320];
        float _1324 = 1.0 / _1288;
        float _1326 = _1288 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1328 = _536 * _1304;
        float _1330 = fma(_532, _1296, _1328);
        float _1332 = fma(_534, _1314, _1330);
        float _1334 = _1332 + _1322;
        float _1336 = precise::clamp(_1334, 0.0, 1.0);
        float _1338 = -_1336;
        float _1340 = _1338 + _1274;
        float _1342 = fma(_1324, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1340);
        float _1344 = _1326 * _1342;
        float _1346 = exp2(_1344);
        float _1348 = 0.0 + _1346;
        float _1350 = precise::clamp(_1348, 0.0, 1.0);
        _1230 = _1350;
    }
    float _1352 = _1230;
    float _1354 = precise::min(_1352, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1356 = -_1160;
    float _1358 = _1356 + 1.0;
    float _1360 = _1170 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1362 = precise::clamp(_1360, 0.0, 1.0);
    float _1364 = _1210 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1366 = precise::clamp(_1364, 0.0, 1.0);
    float _1368 = -_1354;
    float _1370 = _1368 + 1.0;
    float _1372 = fma(_1362, _1358, _1160);
    float _1374 = fma(_1366, _1370, _1354);
    out.m_66.x = _1372;
    out.m_66.y = _1374;
    out.m_66.z = _1090;
    out.m_66.w = _1088;
    out.m_68.x = 1.0;
    out.m_68.y = _603;
    out.m_68.z = _605;
    out.m_68.w = 1.0;
    return out;
}

