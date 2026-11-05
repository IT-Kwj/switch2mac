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
    texture2d<float> fp_t_tcb_14 [[id(5)]];
    sampler fp_t_tcb_14Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
    float4 m_60 [[color(1)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1030 = false;
    float _67 = gl_FragCoord.w;
    float _69 = in.m_49.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_49.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float _87 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1298 = float2(_83, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1298, float2(0.0), isnan(_1298))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1298, float2(0.0), isnan(_1298))).x;
    float _91 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1313 = float2(_87, _85);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1313, float2(0.0), isnan(_1313))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1313, float2(0.0), isnan(_1313))).x;
    float2 _1321 = float2(_83, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1321, float2(0.0), isnan(_1321))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1321, float2(0.0), isnan(_1321))).x;
    float _97 = in.m_51.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_51.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_53.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_53.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_55.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_55.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _81 * _101;
    float _135 = _81 * _107;
    float _137 = _81 * _113;
    float _139 = _81 * _119;
    float _141 = _81 * _125;
    float _143 = _81 * _131;
    float _145 = -_89;
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _149 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[41].x, _147);
    float _151 = _149 * _133;
    float _153 = _149 * _135;
    float _155 = _151 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _157 = _151 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _159 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].x, _155);
    float _161 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].x, _157);
    float _163 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[32].z, _159);
    float _165 = -_93;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _169 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[41].x, _167);
    float _171 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[30].z, _161);
    float _173 = _163 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _175 = -_95;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _179 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[41].x, _177);
    float _181 = -_153;
    float _183 = fma(_169, _139, _181);
    float _185 = -_151;
    float _187 = fma(_169, _137, _185);
    float _189 = -_149;
    float _191 = _189 + _169;
    float _193 = _171 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _197 = _173 + _195;
    float _199 = -_153;
    float _201 = fma(_179, _141, _199);
    float _203 = -_151;
    float _205 = fma(_179, _143, _203);
    float _207 = -_149;
    float _209 = _207 + _179;
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _213 = _193 + _211;
    float _215 = _197 * _197;
    float _217 = _191 * _201;
    float _219 = _187 * _209;
    float _221 = fma(_213, _213, _215);
    float _223 = -_217;
    float _225 = fma(_183, _209, _223);
    float _227 = _183 * _205;
    float _229 = -_219;
    float _231 = fma(_191, _205, _229);
    float _233 = sqrt(_221);
    float _235 = _225 * _225;
    float _237 = -_227;
    float _239 = fma(_187, _201, _237);
    float _241 = fma(_231, _231, _235);
    float _243 = _151 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _245 = fma(_239, _239, _241);
    float _247 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].x, _243);
    float _249 = rsqrt(_245);
    float _251 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[31].z, _247);
    bool _255 = _233 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _257 = _251 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _259 = _231 * _249;
    float _261 = _225 * _249;
    float _263 = _239 * _249;
    float _265 = _241;
    float _267 = _257;
    float _269 = _173;
    if (!_255)
    {
        _265 = _193;
    }
    float _271 = _265;
    bool _273 = !_255;
    float _275 = _271;
    if (!_273)
    {
        float _277 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _279 = _233 + _277;
        float _281 = _257 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _283 = rsqrt(_221);
        float _285 = -_257;
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _289 = _285 + _287;
        float _291 = abs(_281);
        float _293 = abs(_279);
        float _295 = precise::max(_291, _293);
        float _297 = _289 * _289;
        bool _299 = _295 >= 16.0;
        float _301 = _213 * _283;
        float _303 = _197 * _283;
        float _305 = -_213;
        float _307 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[41].z, _305);
        float _309 = -_197;
        float _311 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[41].z, _309);
        float _313 = _279;
        float _315 = _281;
        int _318 = as_type<int>(_311);
        if (_299)
        {
            float _320 = _279 * 0.0625;
            _313 = _320;
        }
        float _322 = _313;
        if (_299)
        {
            float _324 = _281 * 0.0625;
            _315 = _324;
        }
        float _326 = _315;
        float _328 = fma(_307, _307, _297);
        float _330 = abs(_322);
        bool _332 = _330 != 0.0;
        bool _334 = isnan(_330);
        bool _336 = _332 || _334;
        bool _338 = isnan(0.0);
        bool _340 = _336 || _338;
        float _342 = fma(_311, _311, _328);
        float _344 = abs(_326);
        bool _346 = _344 == 0.0;
        float _348 = abs(_326);
        bool _350 = _348 == 0.0;
        bool _352 = !_340;
        bool _354 = _350 && _352;
        float _356 = sqrt(_342);
        bool _358 = false;
        if (_354)
        {
            bool _360 = as_type<int>(_326) >= 0;
            _358 = _360;
        }
        bool _362 = _358;
        int _364 = _362 ? (-1) : 0;
        if (_354)
        {
            int _366 = _362 ? 0 : 1078530011;
            _318 = _366;
        }
        int _368 = _318;
        int _370 = _368;
        if (_354)
        {
            int _372 = int(0x80000000) & as_type<int>(_322);
            int _374 = _368 | _372;
            _370 = _374;
        }
        int _376 = _370;
        bool _378 = !_340;
        bool _380 = _378 && _346;
        int _382 = _376;
        float _384 = as_type<float>(_376);
        if (!_380)
        {
            float _386 = abs(_322);
            bool _388 = _386 != as_type<float>(0x7f800000u /* inf */);
            bool _390 = isnan(_386);
            bool _392 = _388 || _390;
            bool _394 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _396 = _392 || _394;
            float _398 = abs(_326);
            bool _400 = _398 == as_type<float>(0x7f800000u /* inf */);
            float _402 = abs(_326);
            bool _404 = _402 == as_type<float>(0x7f800000u /* inf */);
            bool _406 = !_396;
            bool _408 = _404 && _406;
            if (_408)
            {
                bool _410 = as_type<int>(_326) >= 0;
                _364 = _410 ? (-1) : 0;
            }
            int _412 = _364;
            if (_408)
            {
                _382 = 1075235812;
            }
            int _414 = _382;
            int _416 = _414;
            if (_408)
            {
                int _418 = ~_412;
                int _420 = (_418 != 0) ? _414 : 1061752795;
                _416 = _420;
            }
            int _422 = _416;
            float _424 = as_type<float>(_422);
            if (_408)
            {
                int _426 = int(0x80000000) & as_type<int>(_322);
                int _428 = _422 | _426;
                _424 = as_type<float>(_428);
            }
            float _430 = _424;
            bool _432 = !_396;
            bool _434 = _432 && _400;
            _384 = _430;
            if (!_434)
            {
                float _436 = abs(_322);
                float _438 = abs(_326);
                float _440 = precise::max(_436, _438);
                float _442 = abs(_322);
                float _444 = abs(_326);
                float _446 = precise::min(_442, _444);
                float _448 = 1.0 / _440;
                float _450 = abs(_322);
                float _452 = abs(_326);
                bool _454 = _450 > _452;
                bool _456 = as_type<int>(_326) >= 0;
                float _458 = _446 * _448;
                float _460 = abs(_322);
                float _462 = abs(_326);
                float _464 = _460 + _462;
                int _466 = as_type<int>(_322) & int(0x80000000);
                float _468 = _458 * _458;
                bool _470 = _464 > as_type<float>(0x7f800000u /* inf */);
                bool _472 = isnan(_464);
                bool _474 = _470 || _472;
                bool _476 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _478 = _474 || _476;
                float _480 = _468 + 11.33538818359375;
                float _482 = fma(_468, _480, 28.84246826171875);
                float _484 = fma(_468, _482, 19.6966705322265625);
                float _486 = fma(_468, -0.82336294651031494140625, -5.674867153167724609375);
                float _488 = fma(_468, _486, -6.565555095672607421875);
                float _490 = 1.0 / _484;
                float _492 = _468 * _488;
                float _494 = _458 * _492;
                float _496 = fma(_494, _490, _458);
                float _498 = _496;
                _384 = _464;
                if (_454)
                {
                    float _500 = -_496;
                    float _502 = _500 + 1.57079637050628662109375;
                    _498 = _502;
                }
                float _504 = _498;
                int _506 = as_type<int>(_504);
                if (!_456)
                {
                    float _508 = -_504;
                    float _510 = _508 + 3.1415927410125732421875;
                    _506 = as_type<int>(_510);
                }
                int _512 = _506;
                if (!_478)
                {
                    int _514 = _466 | _512;
                    _384 = as_type<float>(_514);
                }
            }
        }
        float _516 = _384;
        float _518 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _520 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _522 = _356 + _520;
        float _524 = fma(_301, _518, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _526 = fma(_303, _518, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _267 = _522;
        _275 = _524;
        _269 = _526;
    }
    float _528 = _267;
    float _530 = _275;
    float _532 = _269;
    float2 _1989 = float2(_83, _85);
    float4 _535 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1989, float2(0.0), isnan(_1989)), int2(0), component::x).xyzw;
    float _537 = _535.x;
    float _539 = _535.y;
    float _541 = _535.z;
    float _543 = _535.w;
    float2 _2005 = float2(_83, _85);
    float4 _545 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2005, float2(0.0), isnan(_2005)), int2(0), component::w).xyzw;
    float _547 = _545.x;
    float _549 = _545.y;
    float _551 = _545.z;
    float _553 = _545.w;
    float2 _2021 = float2(_83, _85);
    float _555 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2021, float2(0.0), isnan(_2021))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2021, float2(0.0), isnan(_2021))).x;
    float _557 = _261 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _559 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[35].x, _557);
    float _561 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[35].z, _559);
    float _563 = -_561;
    float _565 = fma(_563, _561, 1.0);
    float _567 = -_561;
    float _569 = fma(_567, (*spvDescriptorSet0.fp_c3)._m0[35].z, _263);
    float _571 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _573 = -_561;
    float _575 = fma(_573, (*spvDescriptorSet0.fp_c3)._m0[35].x, _259);
    float _577 = _565 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _579 = -_561;
    float _581 = fma(_579, (*spvDescriptorSet0.fp_c3)._m0[35].y, _261);
    float _583 = fma(_569, _577, _149);
    float _585 = fma(_575, _577, _153);
    float _587 = fma(_581, _577, _151);
    float _589 = -_583;
    bool _591 = _589 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _593 = float(_591);
    float _595 = -_583;
    bool _597 = _595 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _599 = float(_597);
    float _601 = _593 + _599;
    float _603 = floor(_571);
    float _605 = precise::min(_601, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _607 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _609 = trunc(_605);
    int _611 = int(_609);
    float _613 = floor(_607);
    float _615 = -_603;
    float _617 = _571 + _615;
    float _619 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _621 = _617 + _619;
    int _623 = _611 << 6;
    float _625 = -_621;
    float _627 = _625 + 1.0;
    bool _629 = _611 != 0;
    uint _632 = uint(int(uint(_623) >> uint(2)));
    uint _634 = uint(int(uint(int(_632)) >> uint(2)));
    int _636 = int(_632) & 3;
    float _638 = (*spvDescriptorSet0.fp_c3)._m0[int(_634)][_636];
    int _640 = int(_632) + 1;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    int _644 = _640 & 3;
    float _646 = (*spvDescriptorSet0.fp_c3)._m0[int(_642)][_644];
    float _648 = -_613;
    float _650 = _607 + _648;
    int _652 = _623 + 16;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    uint _656 = uint(int(uint(int(_654)) >> uint(2)));
    int _658 = int(_654) & 3;
    float _660 = (*spvDescriptorSet0.fp_c3)._m0[int(_656)][_658];
    int _662 = int(_654) + 1;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    int _666 = _662 & 3;
    float _668 = (*spvDescriptorSet0.fp_c3)._m0[int(_664)][_666];
    float _670 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _672 = _650 + _670;
    float _674 = -_672;
    float _676 = _674 + 1.0;
    float _678 = _621 * _672;
    float _680 = _672 * _627;
    int _682 = _623 + 32;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    uint _686 = uint(int(uint(int(_684)) >> uint(2)));
    int _688 = int(_684) & 3;
    float _690 = (*spvDescriptorSet0.fp_c3)._m0[int(_686)][_688];
    int _692 = int(_684) + 1;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    int _696 = _692 & 3;
    float _698 = (*spvDescriptorSet0.fp_c3)._m0[int(_694)][_696];
    float _700 = _621 * _676;
    float _702 = _627 * _676;
    int _704 = _623 + 8;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    uint _708 = uint(int(uint(int(_706)) >> uint(2)));
    int _710 = int(_706) & 3;
    float _712 = (*spvDescriptorSet0.fp_c3)._m0[int(_708)][_710];
    int _714 = int(_706) + 1;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    int _718 = _714 & 3;
    float _720 = (*spvDescriptorSet0.fp_c3)._m0[int(_716)][_718];
    int _722 = _623 + 24;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.fp_c3)._m0[int(_726)][_728];
    int _732 = int(_724) + 1;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    int _736 = _732 & 3;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[int(_734)][_736];
    int _740 = _623 + 48;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[int(_744)][_746];
    int _750 = int(_742) + 1;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    int _754 = _750 & 3;
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[int(_752)][_754];
    float _758 = _587 * _646;
    float _760 = fma(_585, _638, _758);
    int _762 = _623 + 40;
    uint _764 = uint(int(uint(_762) >> uint(2)));
    uint _766 = uint(int(uint(int(_764)) >> uint(2)));
    int _768 = int(_764) & 3;
    float _770 = (*spvDescriptorSet0.fp_c3)._m0[int(_766)][_768];
    int _772 = int(_764) + 1;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    int _776 = _772 & 3;
    float _778 = (*spvDescriptorSet0.fp_c3)._m0[int(_774)][_776];
    float _780 = _587 * _668;
    float _782 = _587 * _698;
    float _784 = fma(_585, _660, _780);
    float _786 = precise::min(_149, -1.0000000116860974230803549289703e-07);
    float _788 = fma(_585, _690, _782);
    float _790 = fma(_583, _712, _760);
    float _792 = 1.0 / _786;
    float _794 = fma(_583, _730, _784);
    float _796 = _794 + _738;
    float _798 = _587 * _756;
    float _800 = _790 + _720;
    float _802 = fma(_585, _748, _798);
    float _804 = fma(_583, _770, _788);
    float _806 = -_537;
    float _808 = fma(_806, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _810 = -_539;
    float _812 = fma(_810, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _814 = -_541;
    float _816 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _818 = -_543;
    float _820 = fma(_818, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _822 = _792 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _824 = 1.0 / _812;
    float _826 = 1.0 / _808;
    float _828 = 1.0 / _816;
    float _830 = 1.0 / _820;
    float _832 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _834 = -_149;
    float _836 = fma(_826, _832, _834);
    int _838 = _623 + 56;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.fp_c3)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.fp_c3)._m0[int(_850)][_852];
    float _856 = abs(_836);
    float _858 = _856 * _822;
    float _860 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _862 = -_149;
    float _864 = fma(_824, _860, _862);
    float _866 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _868 = -_149;
    float _870 = fma(_828, _866, _868);
    float _872 = abs(_864);
    float _874 = _872 * _822;
    float _876 = exp2(_858);
    float _878 = abs(_870);
    float _880 = _878 * _822;
    float _882 = _804 + _778;
    float _884 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _886 = -_149;
    float _888 = fma(_830, _884, _886);
    float _890 = exp2(_874);
    float _892 = abs(_888);
    float _894 = _892 * _822;
    float _896 = exp2(_880);
    float _898 = abs(_680);
    float _900 = _898 * _876;
    float _902 = exp2(_894);
    float _904 = abs(_678);
    float _906 = _904 * _890;
    float _908 = _900 + _906;
    float _910 = abs(_700);
    float _912 = _910 * _896;
    float _914 = _912 + _908;
    float _916 = abs(_702);
    float _918 = _916 * _902;
    float _920 = fma(_583, _846, _802);
    float _922 = _918 + _914;
    float _924 = _920 + _854;
    float _926 = -_918;
    bool _928 = _914 != _926;
    bool _930 = isnan(_914);
    bool _932 = _928 || _930;
    bool _934 = isnan(_926);
    bool _936 = _932 || _934;
    float _938 = 1.0 / _922;
    float _940 = 1.0 / _924;
    float _942 = _906 * _938;
    float _944 = _900 * _938;
    float _946 = _912 * _938;
    float _948 = _918 * _938;
    float _950 = _936 ? _942 : 0.25;
    float _952 = _936 ? _944 : 0.25;
    float _954 = _800 * _940;
    float _956 = _936 ? _946 : 0.25;
    float _958 = _950 * _549;
    float _960 = _936 ? _948 : 0.25;
    float _962 = _882 * _940;
    float _964 = precise::clamp(_962, 0.0, 1.0);
    float _966 = fma(_952, _547, _958);
    float _968 = fma(_956, _551, _966);
    float _970 = _796 * _940;
    float _972 = fma(_960, _553, _968);
    float _1028;
    if (!_629)
    {
        float _974 = rint(_605);
        float _976 = precise::max(_974, 0.0);
        uint _978 = uint(_976);
        uint _980 = clamp(_978, 0u, 65535u);
        float _982 = _964 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _984 = fma(_982, 0.5, _970);
        float _986 = fma(_982, 0.5, _954);
        float _988 = fma(_982, -0.5, _954);
        float _990 = fma(_982, -0.5, _970);
        float3 _2713 = float3(_954, _984, float(int(_980)));
        float3 _2717 = select(_2713, float3(0.0), isnan(_2713));
        float _992 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2717.xy, uint(rint(_2717.z)), _964);
        float3 _2726 = float3(_986, _984, float(int(_980)));
        float3 _2728 = select(_2726, float3(0.0), isnan(_2726));
        float _994 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2728.xy, uint(rint(_2728.z)), _964);
        float3 _2737 = float3(_988, _984, float(int(_980)));
        float3 _2739 = select(_2737, float3(0.0), isnan(_2737));
        float _996 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2739.xy, uint(rint(_2739.z)), _964);
        float3 _2748 = float3(_986, _970, float(int(_980)));
        float3 _2750 = select(_2748, float3(0.0), isnan(_2748));
        float _998 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2750.xy, uint(rint(_2750.z)), _964);
        float3 _2759 = float3(_954, _970, float(int(_980)));
        float3 _2761 = select(_2759, float3(0.0), isnan(_2759));
        float _1000 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2761.xy, uint(rint(_2761.z)), _964);
        float3 _2770 = float3(_988, _970, float(int(_980)));
        float3 _2772 = select(_2770, float3(0.0), isnan(_2770));
        float _1002 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2772.xy, uint(rint(_2772.z)), _964);
        float3 _2781 = float3(_986, _990, float(int(_980)));
        float3 _2783 = select(_2781, float3(0.0), isnan(_2781));
        float _1004 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2783.xy, uint(rint(_2783.z)), _964);
        float3 _2792 = float3(_954, _990, float(int(_980)));
        float3 _2794 = select(_2792, float3(0.0), isnan(_2792));
        float _1006 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2794.xy, uint(rint(_2794.z)), _964);
        float3 _2803 = float3(_988, _990, float(int(_980)));
        float3 _2805 = select(_2803, float3(0.0), isnan(_2803));
        float _1008 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2805.xy, uint(rint(_2805.z)), _964);
        float _1010 = _994 + _992;
        float _1012 = _1010 + _996;
        float _1014 = _1012 + _998;
        float _1016 = _1014 + _1000;
        float _1018 = _1016 + _1002;
        float _1020 = _1018 + _1004;
        float _1022 = _1020 + _1006;
        float _1024 = _1022 + _1008;
        float _1026 = _1024 * 0.111111111938953399658203125;
        _1028 = _1026;
        _1030 = true;
    }
    else
    {
        float _1032 = rint(_605);
        float _1034 = precise::max(_1032, 0.0);
        uint _1036 = uint(_1034);
        uint _1038 = clamp(_1036, 0u, 65535u);
        float3 _2852 = float3(_954, _970, float(int(_1038)));
        float3 _2854 = select(_2852, float3(0.0), isnan(_2852));
        float _1040 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2854.xy, uint(rint(_2854.z)), _964);
        _1028 = _1040;
    }
    _1030 = false;
    float _1042 = _1028;
    float _1044 = _528 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1046 = _528 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1048 = -_149;
    float _1050 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1052 = _1048 + _1050;
    float _1054 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1044);
    float _1056 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1046);
    float _1058 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1054);
    float _1060 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1056);
    float _1062 = _1058 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1064 = _1060 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1066 = trunc(_1062);
    int _1068 = int(_1066);
    float _1070 = trunc(_1064);
    int _1072 = int(_1070);
    int _1074 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1076 = _1068 + _1074;
    int _1078 = _1076 + 1;
    bool _1080 = _1078 >= 0;
    int _1082 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1084 = _1072 + _1082;
    int _1086 = _1084 + 1;
    float _1088 = -_149;
    float _1090 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1092 = _1088 + _1090;
    bool _1094 = _1078 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1096 = !_1080;
    bool _1098 = _1094 || _1096;
    bool _1100 = _1086 < 0;
    bool _1102 = _1100 || _1098;
    bool _1104 = _1086 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1106 = _1104 || _1102;
    float _1108 = as_type<float>(_1068);
    if (_1106)
    {
        _1108 = 1.0;
    }
    float _1110 = _1108;
    float _1112 = _1110;
    if (!_1106)
    {
        int _1114 = _1086 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1116 = _1114 + _1078;
        float _1118 = floor(_1064);
        int _1120 = _1116 << 2;
        int _1122 = _1116 >> 2;
        int _1124 = 12 & _1120;
        int _1126 = _1122 << 4;
        int _1128 = _1126 + _1124;
        float _1130 = floor(_1062);
        uint _1132 = uint(int(uint(_1128) >> uint(2)));
        uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
        int _1136 = int(_1132) & 3;
        float _1138 = (*spvDescriptorSet0.fp_c5)._m0[int(_1134)][_1136];
        float _1140 = -_1118;
        float _1142 = _1064 + _1140;
        float _1144 = -_1130;
        float _1146 = _1062 + _1144;
        float _1148 = rint(_1138);
        float _1150 = precise::max(_1148, 0.0);
        uint _1152 = uint(_1150);
        uint _1154 = clamp(_1152, 0u, 65535u);
        float3 _3041 = float3(_1146, _1142, float(int(_1154)));
        float3 _3043 = select(_3041, float3(0.0), isnan(_3041));
        float _1156 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3043.xy, uint(rint(_3043.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3043.xy, uint(rint(_3043.z)), level(0.0)).x;
        int _1158 = _1116 << 4;
        int _1160 = _1158 + 1648;
        int _1162 = _1128 + 8048;
        uint _1164 = uint(int(uint(_1162) >> uint(2)));
        uint _1166 = uint(int(uint(int(_1164)) >> uint(2)));
        int _1168 = int(_1164) & 3;
        float _1170 = (*spvDescriptorSet0.fp_c5)._m0[int(_1166)][_1168];
        uint _1172 = uint(int(uint(_1160) >> uint(2)));
        uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
        int _1176 = int(_1172) & 3;
        float _1178 = (*spvDescriptorSet0.fp_c5)._m0[int(_1174)][_1176];
        int _1180 = int(_1172) + 1;
        uint _1182 = uint(int(uint(_1180) >> uint(2)));
        int _1184 = _1180 & 3;
        float _1186 = (*spvDescriptorSet0.fp_c5)._m0[int(_1182)][_1184];
        int _1188 = _1160 + 8;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
        int _1194 = int(_1190) & 3;
        float _1196 = (*spvDescriptorSet0.fp_c5)._m0[int(_1192)][_1194];
        int _1198 = int(_1190) + 1;
        uint _1200 = uint(int(uint(_1198) >> uint(2)));
        int _1202 = _1198 & 3;
        float _1204 = (*spvDescriptorSet0.fp_c5)._m0[int(_1200)][_1202];
        float _1206 = _1170 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1208 = _528 * _1186;
        float _1210 = fma(_530, _1178, _1208);
        float _1212 = 1.0 / _1170;
        float _1214 = fma(_532, _1196, _1210);
        float _1216 = _1214 + _1204;
        float _1218 = precise::clamp(_1216, 0.0, 1.0);
        float _1220 = -_1218;
        float _1222 = _1220 + _1156;
        float _1224 = fma(_1212, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1222);
        float _1226 = _1206 * _1224;
        float _1228 = exp2(_1226);
        float _1230 = 0.0 + _1228;
        float _1232 = precise::clamp(_1230, 0.0, 1.0);
        _1112 = _1232;
    }
    float _1234 = _1112;
    float _1236 = precise::min(_1234, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1238 = _1092 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1240 = precise::clamp(_1238, 0.0, 1.0);
    float _1242 = _1052 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1244 = precise::clamp(_1242, 0.0, 1.0);
    float _1246 = -_1042;
    float _1248 = _1246 + 1.0;
    float _1250 = precise::min(_972, 1.0);
    float _1252 = -_1236;
    float _1254 = _1252 + 1.0;
    float _1256 = fma(_1240, _1248, _1042);
    float _1258 = fma(_1244, _1254, _1236);
    out.m_58.x = _1256;
    out.m_58.y = _1258;
    out.m_58.z = _1250;
    out.m_58.w = 1.0;
    out.m_60.x = _555;
    out.m_60.y = 0.5;
    out.m_60.z = 0.5;
    out.m_60.w = 1.0;
    return out;
}

