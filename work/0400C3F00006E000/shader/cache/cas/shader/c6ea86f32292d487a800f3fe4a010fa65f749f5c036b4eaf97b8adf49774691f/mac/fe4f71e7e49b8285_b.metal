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
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_14 [[id(11)]];
    sampler fp_t_tcb_14Smplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_E [[id(15)]];
    sampler fp_t_tcb_ESmplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_14Smplr_w [[id(19)]];
    sampler fp_t_tcb_ESmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
    float4 m_62 [[color(1)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1056 = false;
    float _69 = gl_FragCoord.w;
    float _71 = in.m_51.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_51.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _69;
    float _85 = _83 * _75;
    float _87 = _83 * _81;
    float _89 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1323 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1323, float2(0.0), isnan(_1323))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1323, float2(0.0), isnan(_1323))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1338 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1338, float2(0.0), isnan(_1338))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1338, float2(0.0), isnan(_1338))).x;
    float2 _1346 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1346, float2(0.0), isnan(_1346))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1346, float2(0.0), isnan(_1346))).x;
    float _99 = in.m_53.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_53.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_55.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_57.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_55.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_57.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _83 * _103;
    float _137 = _83 * _109;
    float _139 = _83 * _115;
    float _141 = _83 * _121;
    float _143 = _83 * _127;
    float _145 = _83 * _133;
    float _147 = -_91;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _151 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[41].x, _149);
    float _153 = _151 * _135;
    float _155 = _151 * _137;
    float _157 = _153 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _159 = _153 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _161 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[32].x, _157);
    float _163 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[30].x, _159);
    float _165 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].z, _161);
    float _167 = -_95;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _171 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[41].x, _169);
    float _173 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].z, _163);
    float _175 = _165 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _177 = -_97;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[41].x, _179);
    float _183 = -_155;
    float _185 = fma(_171, _139, _183);
    float _187 = -_153;
    float _189 = fma(_171, _143, _187);
    float _191 = -_151;
    float _193 = _191 + _171;
    float _195 = _173 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _199 = _175 + _197;
    float _201 = -_155;
    float _203 = fma(_181, _141, _201);
    float _205 = -_153;
    float _207 = fma(_181, _145, _205);
    float _209 = -_151;
    float _211 = _209 + _181;
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _215 = _195 + _213;
    float _217 = _199 * _199;
    float _219 = _193 * _203;
    float _221 = _189 * _211;
    float _223 = fma(_215, _215, _217);
    float _225 = -_219;
    float _227 = fma(_185, _211, _225);
    float _229 = _185 * _207;
    float _231 = -_221;
    float _233 = fma(_193, _207, _231);
    float _235 = sqrt(_223);
    float _237 = _227 * _227;
    float _239 = -_229;
    float _241 = fma(_189, _203, _239);
    float _243 = _153 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _245 = fma(_233, _233, _237);
    float _247 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[31].x, _243);
    float _249 = fma(_241, _241, _245);
    float _251 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].z, _247);
    float _253 = rsqrt(_249);
    float _255 = _251 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _259 = _235 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _233 * _253;
    float _263 = _227 * _253;
    float _265 = _241 * _253;
    bool _267 = !_259;
    float _269 = _255;
    float _271 = _195;
    float _273 = _175;
    if (!_267)
    {
        float _275 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _277 = _235 + _275;
        float _279 = _255 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _281 = rsqrt(_223);
        float _283 = -_255;
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _287 = _283 + _285;
        float _289 = abs(_279);
        float _291 = abs(_277);
        float _293 = precise::max(_289, _291);
        float _295 = _287 * _287;
        bool _297 = _293 >= 16.0;
        float _299 = _215 * _281;
        float _301 = _199 * _281;
        float _303 = -_215;
        float _305 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[41].z, _303);
        float _307 = -_199;
        float _309 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[41].z, _307);
        float _311 = _277;
        float _313 = _279;
        int _316 = as_type<int>(_309);
        if (_297)
        {
            float _318 = _277 * 0.0625;
            _311 = _318;
        }
        float _320 = _311;
        if (_297)
        {
            float _322 = _279 * 0.0625;
            _313 = _322;
        }
        float _324 = _313;
        float _326 = fma(_305, _305, _295);
        float _328 = abs(_320);
        bool _330 = _328 != 0.0;
        bool _332 = isnan(_328);
        bool _334 = _330 || _332;
        bool _336 = isnan(0.0);
        bool _338 = _334 || _336;
        float _340 = fma(_309, _309, _326);
        float _342 = abs(_324);
        bool _344 = _342 == 0.0;
        float _346 = abs(_324);
        bool _348 = _346 == 0.0;
        bool _350 = !_338;
        bool _352 = _348 && _350;
        float _354 = sqrt(_340);
        bool _356 = false;
        if (_352)
        {
            bool _358 = as_type<int>(_324) >= 0;
            _356 = _358;
        }
        bool _360 = _356;
        int _362 = _360 ? (-1) : 0;
        if (_352)
        {
            int _364 = _360 ? 0 : 1078530011;
            _316 = _364;
        }
        int _366 = _316;
        int _368 = _366;
        if (_352)
        {
            int _370 = int(0x80000000) & as_type<int>(_320);
            int _372 = _366 | _370;
            _368 = _372;
        }
        int _374 = _368;
        bool _376 = !_338;
        bool _378 = _376 && _344;
        int _380 = _374;
        float _382 = as_type<float>(_374);
        if (!_378)
        {
            float _384 = abs(_320);
            bool _386 = _384 != as_type<float>(0x7f800000u /* inf */);
            bool _388 = isnan(_384);
            bool _390 = _386 || _388;
            bool _392 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _394 = _390 || _392;
            float _396 = abs(_324);
            bool _398 = _396 == as_type<float>(0x7f800000u /* inf */);
            float _400 = abs(_324);
            bool _402 = _400 == as_type<float>(0x7f800000u /* inf */);
            bool _404 = !_394;
            bool _406 = _402 && _404;
            if (_406)
            {
                bool _408 = as_type<int>(_324) >= 0;
                _362 = _408 ? (-1) : 0;
            }
            int _410 = _362;
            if (_406)
            {
                _380 = 1075235812;
            }
            int _412 = _380;
            int _414 = _412;
            if (_406)
            {
                int _416 = ~_410;
                int _418 = (_416 != 0) ? _412 : 1061752795;
                _414 = _418;
            }
            int _420 = _414;
            float _422 = as_type<float>(_420);
            if (_406)
            {
                int _424 = int(0x80000000) & as_type<int>(_320);
                int _426 = _420 | _424;
                _422 = as_type<float>(_426);
            }
            float _428 = _422;
            bool _430 = !_394;
            bool _432 = _430 && _398;
            _382 = _428;
            if (!_432)
            {
                float _434 = abs(_320);
                float _436 = abs(_324);
                float _438 = precise::max(_434, _436);
                float _440 = abs(_320);
                float _442 = abs(_324);
                float _444 = precise::min(_440, _442);
                float _446 = 1.0 / _438;
                float _448 = abs(_320);
                float _450 = abs(_324);
                bool _452 = _448 > _450;
                bool _454 = as_type<int>(_324) >= 0;
                float _456 = _444 * _446;
                float _458 = abs(_320);
                float _460 = abs(_324);
                float _462 = _458 + _460;
                int _464 = as_type<int>(_320) & int(0x80000000);
                float _466 = _456 * _456;
                bool _468 = _462 > as_type<float>(0x7f800000u /* inf */);
                bool _470 = isnan(_462);
                bool _472 = _468 || _470;
                bool _474 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _476 = _472 || _474;
                float _478 = _466 + 11.33538818359375;
                float _480 = fma(_466, _478, 28.84246826171875);
                float _482 = fma(_466, _480, 19.6966705322265625);
                float _484 = fma(_466, -0.82336294651031494140625, -5.674867153167724609375);
                float _486 = fma(_466, _484, -6.565555095672607421875);
                float _488 = 1.0 / _482;
                float _490 = _466 * _486;
                float _492 = _456 * _490;
                float _494 = fma(_492, _488, _456);
                float _496 = _494;
                _382 = _462;
                if (_452)
                {
                    float _498 = -_494;
                    float _500 = _498 + 1.57079637050628662109375;
                    _496 = _500;
                }
                float _502 = _496;
                int _504 = as_type<int>(_502);
                if (!_454)
                {
                    float _506 = -_502;
                    float _508 = _506 + 3.1415927410125732421875;
                    _504 = as_type<int>(_508);
                }
                int _510 = _504;
                if (!_476)
                {
                    int _512 = _464 | _510;
                    _382 = as_type<float>(_512);
                }
            }
        }
        float _514 = _382;
        float _516 = fma(_514, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _518 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _520 = _354 + _518;
        float _522 = fma(_299, _516, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _524 = fma(_301, _516, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _269 = _520;
        _271 = _522;
        _273 = _524;
    }
    float _526 = _269;
    float _528 = _271;
    float _530 = _273;
    float2 _2007 = float2(_85, _87);
    float2 _534 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2007, float2(0.0), isnan(_2007))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2007, float2(0.0), isnan(_2007))).xy;
    float _536 = _534.x;
    float _538 = _534.y;
    float _540 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _542 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float2 _2028 = float2(_540, _542);
    float4 _545 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2028, float2(0.0), isnan(_2028)), int2(0), component::x).xyzw;
    float _547 = _545.x;
    float _549 = _545.y;
    float _551 = _545.z;
    float _553 = _545.w;
    float2 _2044 = float2(_540, _542);
    float4 _555 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2044, float2(0.0), isnan(_2044)), int2(0), component::w).xyzw;
    float _557 = _555.x;
    float _559 = _555.y;
    float _561 = _555.z;
    float _563 = _555.w;
    float _565 = fma(_536, 2.0, -1.0);
    float _567 = fma(_538, 2.0, -1.0);
    float _569 = _565 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _571 = _567 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _573 = fma(_569, 2.0, _85);
    float _575 = fma(_571, 2.0, _87);
    float2 _2080 = float2(_573, _575);
    float2 _577 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2080, float2(0.0), isnan(_2080))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2080, float2(0.0), isnan(_2080))).yz;
    float _579 = _577.x;
    float _581 = _577.y;
    float _583 = _263 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _585 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _587 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _589 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].x, _583);
    float _591 = floor(_585);
    float _593 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].z, _589);
    float _595 = -_593;
    float _597 = fma(_595, _593, 1.0);
    float _599 = -_593;
    float _601 = fma(_599, (*spvDescriptorSet0.fp_c3)._m0[35].z, _265);
    float _603 = -_593;
    float _605 = fma(_603, (*spvDescriptorSet0.fp_c3)._m0[35].x, _261);
    float _607 = -_593;
    float _609 = fma(_607, (*spvDescriptorSet0.fp_c3)._m0[35].y, _263);
    float _611 = _597 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _613 = fma(_601, _611, _151);
    float _615 = fma(_605, _611, _155);
    float _617 = fma(_609, _611, _153);
    float _619 = -_591;
    float _621 = _585 + _619;
    float _623 = -_613;
    bool _625 = _623 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _627 = float(_625);
    float _629 = -_613;
    bool _631 = _629 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _637 = _621 + _635;
    float _639 = _627 + _633;
    float _641 = precise::min(_639, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _643 = trunc(_641);
    int _645 = int(_643);
    int _647 = _645 << 6;
    bool _649 = _645 != 0;
    uint _652 = uint(int(uint(_647) >> uint(2)));
    uint _654 = uint(int(uint(int(_652)) >> uint(2)));
    int _656 = int(_652) & 3;
    float _658 = (*spvDescriptorSet0.fp_c3)._m0[int(_654)][_656];
    int _660 = int(_652) + 1;
    uint _662 = uint(int(uint(_660) >> uint(2)));
    int _664 = _660 & 3;
    float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
    int _668 = _647 + 16;
    uint _670 = uint(int(uint(_668) >> uint(2)));
    uint _672 = uint(int(uint(int(_670)) >> uint(2)));
    int _674 = int(_670) & 3;
    float _676 = (*spvDescriptorSet0.fp_c3)._m0[int(_672)][_674];
    int _678 = int(_670) + 1;
    uint _680 = uint(int(uint(_678) >> uint(2)));
    int _682 = _678 & 3;
    float _684 = (*spvDescriptorSet0.fp_c3)._m0[int(_680)][_682];
    int _686 = _647 + 32;
    uint _688 = uint(int(uint(_686) >> uint(2)));
    uint _690 = uint(int(uint(int(_688)) >> uint(2)));
    int _692 = int(_688) & 3;
    float _694 = (*spvDescriptorSet0.fp_c3)._m0[int(_690)][_692];
    int _696 = int(_688) + 1;
    uint _698 = uint(int(uint(_696) >> uint(2)));
    int _700 = _696 & 3;
    float _702 = (*spvDescriptorSet0.fp_c3)._m0[int(_698)][_700];
    int _704 = _647 + 48;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    uint _708 = uint(int(uint(int(_706)) >> uint(2)));
    int _710 = int(_706) & 3;
    float _712 = (*spvDescriptorSet0.fp_c3)._m0[int(_708)][_710];
    int _714 = int(_706) + 1;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    int _718 = _714 & 3;
    float _720 = (*spvDescriptorSet0.fp_c3)._m0[int(_716)][_718];
    int _722 = _647 + 8;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.fp_c3)._m0[int(_726)][_728];
    int _732 = int(_724) + 1;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    int _736 = _732 & 3;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[int(_734)][_736];
    int _740 = _647 + 24;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[int(_744)][_746];
    int _750 = int(_742) + 1;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    int _754 = _750 & 3;
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[int(_752)][_754];
    float _758 = _617 * _666;
    float _760 = fma(_615, _658, _758);
    float _762 = floor(_587);
    float _764 = _617 * _684;
    float _766 = fma(_615, _676, _764);
    float _768 = _617 * _702;
    float _770 = fma(_615, _694, _768);
    int _772 = _647 + 40;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    uint _776 = uint(int(uint(int(_774)) >> uint(2)));
    int _778 = int(_774) & 3;
    float _780 = (*spvDescriptorSet0.fp_c3)._m0[int(_776)][_778];
    int _782 = int(_774) + 1;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    int _786 = _782 & 3;
    float _788 = (*spvDescriptorSet0.fp_c3)._m0[int(_784)][_786];
    float _790 = -_762;
    float _792 = _587 + _790;
    float _794 = _617 * _720;
    float _796 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _798 = _792 + _796;
    float _800 = fma(_615, _712, _794);
    float _802 = -_637;
    float _804 = _802 + 1.0;
    float _806 = precise::min(_151, -1.0000000116860974230803549289703e-07);
    float _808 = -_798;
    float _810 = _808 + 1.0;
    float _812 = _637 * _798;
    float _814 = _798 * _804;
    float _816 = fma(_613, _730, _760);
    float _818 = _637 * _810;
    float _820 = _804 * _810;
    float _822 = 1.0 / _806;
    float _824 = _816 + _738;
    float _826 = fma(_613, _748, _766);
    float _828 = _826 + _756;
    float _830 = -_547;
    float _832 = fma(_830, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _834 = -_549;
    float _836 = fma(_834, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _838 = -_551;
    float _840 = fma(_838, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _842 = -_553;
    float _844 = fma(_842, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _846 = 1.0 / _832;
    float _848 = _822 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _850 = 1.0 / _836;
    float _852 = 1.0 / _840;
    float _854 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _856 = -_151;
    float _858 = fma(_846, _854, _856);
    float _860 = fma(_613, _780, _770);
    float _862 = abs(_858);
    float _864 = _862 * _848;
    float _866 = 1.0 / _844;
    float _868 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _870 = -_151;
    float _872 = fma(_850, _868, _870);
    float _874 = _860 + _788;
    float _876 = abs(_872);
    float _878 = _876 * _848;
    float _880 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _882 = -_151;
    float _884 = fma(_852, _880, _882);
    float _886 = exp2(_864);
    int _888 = _647 + 56;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.fp_c3)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.fp_c3)._m0[int(_900)][_902];
    float _906 = abs(_884);
    float _908 = _906 * _848;
    float _910 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _912 = -_151;
    float _914 = fma(_866, _910, _912);
    float _916 = exp2(_878);
    float _918 = abs(_914);
    float _920 = _918 * _848;
    float _922 = exp2(_908);
    float _924 = abs(_814);
    float _926 = _924 * _886;
    float _928 = exp2(_920);
    float _930 = abs(_812);
    float _932 = _930 * _916;
    float _934 = _926 + _932;
    float _936 = abs(_818);
    float _938 = _936 * _922;
    float _940 = abs(_820);
    float _942 = _940 * _928;
    float _944 = _938 + _934;
    float _946 = _942 + _944;
    float _948 = -_942;
    bool _950 = _944 != _948;
    bool _952 = isnan(_944);
    bool _954 = _950 || _952;
    bool _956 = isnan(_948);
    bool _958 = _954 || _956;
    float _960 = fma(_613, _896, _800);
    float _962 = 1.0 / _946;
    float _964 = _960 + _904;
    float _966 = 1.0 / _964;
    float _968 = _932 * _962;
    float _970 = _926 * _962;
    float _972 = _938 * _962;
    float _974 = _942 * _962;
    float _976 = _958 ? _968 : 0.25;
    float _978 = _958 ? _970 : 0.25;
    float _980 = _824 * _966;
    float _982 = _958 ? _974 : 0.25;
    float _984 = _976 * _559;
    float _986 = _958 ? _972 : 0.25;
    float _988 = fma(_978, _557, _984);
    float _990 = _874 * _966;
    float _992 = precise::clamp(_990, 0.0, 1.0);
    float _994 = fma(_986, _561, _988);
    float _996 = _828 * _966;
    float _998 = fma(_982, _563, _994);
    float _1054;
    if (!_649)
    {
        float _1000 = rint(_641);
        float _1002 = precise::max(_1000, 0.0);
        uint _1004 = uint(_1002);
        uint _1006 = clamp(_1004, 0u, 65535u);
        float _1008 = _992 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1010 = fma(_1008, 0.5, _996);
        float _1012 = fma(_1008, 0.5, _980);
        float _1014 = fma(_1008, -0.5, _980);
        float _1016 = fma(_1008, -0.5, _996);
        float3 _2775 = float3(_980, _1010, float(int(_1006)));
        float3 _2779 = select(_2775, float3(0.0), isnan(_2775));
        float _1018 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2779.xy, uint(rint(_2779.z)), _992);
        float3 _2788 = float3(_1012, _1010, float(int(_1006)));
        float3 _2790 = select(_2788, float3(0.0), isnan(_2788));
        float _1020 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2790.xy, uint(rint(_2790.z)), _992);
        float3 _2799 = float3(_1014, _1010, float(int(_1006)));
        float3 _2801 = select(_2799, float3(0.0), isnan(_2799));
        float _1022 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2801.xy, uint(rint(_2801.z)), _992);
        float3 _2810 = float3(_1012, _996, float(int(_1006)));
        float3 _2812 = select(_2810, float3(0.0), isnan(_2810));
        float _1024 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2812.xy, uint(rint(_2812.z)), _992);
        float3 _2821 = float3(_980, _996, float(int(_1006)));
        float3 _2823 = select(_2821, float3(0.0), isnan(_2821));
        float _1026 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2823.xy, uint(rint(_2823.z)), _992);
        float3 _2832 = float3(_1014, _996, float(int(_1006)));
        float3 _2834 = select(_2832, float3(0.0), isnan(_2832));
        float _1028 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2834.xy, uint(rint(_2834.z)), _992);
        float3 _2843 = float3(_1012, _1016, float(int(_1006)));
        float3 _2845 = select(_2843, float3(0.0), isnan(_2843));
        float _1030 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2845.xy, uint(rint(_2845.z)), _992);
        float3 _2854 = float3(_980, _1016, float(int(_1006)));
        float3 _2856 = select(_2854, float3(0.0), isnan(_2854));
        float _1032 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2856.xy, uint(rint(_2856.z)), _992);
        float3 _2865 = float3(_1014, _1016, float(int(_1006)));
        float3 _2867 = select(_2865, float3(0.0), isnan(_2865));
        float _1034 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2867.xy, uint(rint(_2867.z)), _992);
        float _1036 = _1020 + _1018;
        float _1038 = _1036 + _1022;
        float _1040 = _1038 + _1024;
        float _1042 = _1040 + _1026;
        float _1044 = _1042 + _1028;
        float _1046 = _1044 + _1030;
        float _1048 = _1046 + _1032;
        float _1050 = _1048 + _1034;
        float _1052 = _1050 * 0.111111111938953399658203125;
        _1054 = _1052;
        _1056 = true;
    }
    else
    {
        float _1058 = rint(_641);
        float _1060 = precise::max(_1058, 0.0);
        uint _1062 = uint(_1060);
        uint _1064 = clamp(_1062, 0u, 65535u);
        float3 _2914 = float3(_980, _996, float(int(_1064)));
        float3 _2916 = select(_2914, float3(0.0), isnan(_2914));
        float _1066 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2916.xy, uint(rint(_2916.z)), _992);
        _1054 = _1066;
    }
    _1056 = false;
    float _1068 = _1054;
    float _1070 = _526 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1072 = _526 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1074 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1070);
    float _1076 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1072);
    float _1078 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1074);
    float _1080 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1076);
    float _1082 = _1078 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1084 = _1080 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1086 = -_151;
    float _1088 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1090 = _1086 + _1088;
    float _1092 = trunc(_1082);
    int _1094 = int(_1092);
    float _1096 = trunc(_1084);
    int _1098 = int(_1096);
    int _1100 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1102 = _1094 + _1100;
    int _1104 = _1102 + 1;
    bool _1106 = _1104 >= 0;
    int _1108 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1110 = _1098 + _1108;
    int _1112 = _1110 + 1;
    float _1114 = -_151;
    float _1116 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1118 = _1114 + _1116;
    bool _1120 = _1104 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1122 = !_1106;
    bool _1124 = _1120 || _1122;
    bool _1126 = _1112 < 0;
    bool _1128 = _1126 || _1124;
    bool _1130 = _1112 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1132 = _1130 || _1128;
    float _1134 = as_type<float>(_1094);
    if (_1132)
    {
        _1134 = 1.0;
    }
    float _1136 = _1134;
    float _1138 = _1136;
    if (!_1132)
    {
        int _1140 = _1112 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1142 = _1140 + _1104;
        float _1144 = floor(_1084);
        int _1146 = _1142 << 2;
        int _1148 = _1142 >> 2;
        int _1150 = 12 & _1146;
        float _1152 = floor(_1082);
        int _1154 = _1148 << 4;
        int _1156 = _1154 + _1150;
        uint _1158 = uint(int(uint(_1156) >> uint(2)));
        uint _1160 = uint(int(uint(int(_1158)) >> uint(2)));
        int _1162 = int(_1158) & 3;
        float _1164 = (*spvDescriptorSet0.fp_c5)._m0[int(_1160)][_1162];
        float _1166 = -_1144;
        float _1168 = _1084 + _1166;
        float _1170 = -_1152;
        float _1172 = _1082 + _1170;
        float _1174 = rint(_1164);
        float _1176 = precise::max(_1174, 0.0);
        uint _1178 = uint(_1176);
        uint _1180 = clamp(_1178, 0u, 65535u);
        float3 _3103 = float3(_1172, _1168, float(int(_1180)));
        float3 _3105 = select(_3103, float3(0.0), isnan(_3103));
        float _1182 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3105.xy, uint(rint(_3105.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3105.xy, uint(rint(_3105.z)), level(0.0)).x;
        int _1184 = _1142 << 4;
        int _1186 = _1184 + 1648;
        int _1188 = _1156 + 8048;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
        int _1194 = int(_1190) & 3;
        float _1196 = (*spvDescriptorSet0.fp_c5)._m0[int(_1192)][_1194];
        uint _1198 = uint(int(uint(_1186) >> uint(2)));
        uint _1200 = uint(int(uint(int(_1198)) >> uint(2)));
        int _1202 = int(_1198) & 3;
        float _1204 = (*spvDescriptorSet0.fp_c5)._m0[int(_1200)][_1202];
        int _1206 = int(_1198) + 1;
        uint _1208 = uint(int(uint(_1206) >> uint(2)));
        int _1210 = _1206 & 3;
        float _1212 = (*spvDescriptorSet0.fp_c5)._m0[int(_1208)][_1210];
        int _1214 = _1186 + 8;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        uint _1218 = uint(int(uint(int(_1216)) >> uint(2)));
        int _1220 = int(_1216) & 3;
        float _1222 = (*spvDescriptorSet0.fp_c5)._m0[int(_1218)][_1220];
        int _1224 = int(_1216) + 1;
        uint _1226 = uint(int(uint(_1224) >> uint(2)));
        int _1228 = _1224 & 3;
        float _1230 = (*spvDescriptorSet0.fp_c5)._m0[int(_1226)][_1228];
        float _1232 = _1196 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1234 = _526 * _1212;
        float _1236 = 1.0 / _1196;
        float _1238 = fma(_528, _1204, _1234);
        float _1240 = fma(_530, _1222, _1238);
        float _1242 = _1240 + _1230;
        float _1244 = precise::clamp(_1242, 0.0, 1.0);
        float _1246 = -_1244;
        float _1248 = _1246 + _1182;
        float _1250 = fma(_1236, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1248);
        float _1252 = _1232 * _1250;
        float _1254 = exp2(_1252);
        float _1256 = 0.0 + _1254;
        float _1258 = precise::clamp(_1256, 0.0, 1.0);
        _1138 = _1258;
    }
    float _1260 = _1138;
    float _1262 = precise::min(_1260, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1264 = -_1068;
    float _1266 = _1264 + 1.0;
    float _1268 = _1118 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1270 = precise::clamp(_1268, 0.0, 1.0);
    float _1272 = _1090 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = precise::min(_998, 1.0);
    float _1278 = -_1262;
    float _1280 = _1278 + 1.0;
    float _1282 = fma(_1270, _1266, _1068);
    float _1284 = fma(_1274, _1280, _1262);
    out.m_60.x = _1282;
    out.m_60.y = _1284;
    out.m_60.z = _1276;
    out.m_60.w = 1.0;
    out.m_62.x = 1.0;
    out.m_62.y = _579;
    out.m_62.z = _581;
    out.m_62.w = 1.0;
    return out;
}

