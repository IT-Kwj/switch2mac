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
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_16 [[id(13)]];
    sampler fp_t_tcb_16Smplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_10 [[id(17)]];
    sampler fp_t_tcb_10Smplr [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_ASmplr_w [[id(20)]];
    sampler fp_t_tcb_ESmplr_w [[id(21)]];
    sampler fp_t_tcb_16Smplr_w [[id(22)]];
    sampler fp_t_tcb_10Smplr_w [[id(23)]];
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
    bool _1064 = false;
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
    float2 _1331 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1331, float2(0.0), isnan(_1331))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1331, float2(0.0), isnan(_1331))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1346 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1346, float2(0.0), isnan(_1346))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1346, float2(0.0), isnan(_1346))).x;
    float2 _1354 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1354, float2(0.0), isnan(_1354))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1354, float2(0.0), isnan(_1354))).x;
    float _101 = in.m_55.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_55.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_57.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_59.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_57.y;
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
    float _169 = -_97;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _173 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[41].x, _171);
    float _175 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _165);
    float _177 = -_99;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[41].x, _179);
    float _183 = _167 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _185 = -_157;
    float _187 = fma(_173, _141, _185);
    float _189 = -_155;
    float _191 = fma(_173, _145, _189);
    float _193 = -_153;
    float _195 = _193 + _173;
    float _197 = _175 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _201 = _183 + _199;
    float _203 = -_157;
    float _205 = fma(_181, _143, _203);
    float _207 = -_155;
    float _209 = fma(_181, _147, _207);
    float _211 = -_153;
    float _213 = _211 + _181;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _217 = _197 + _215;
    float _219 = _201 * _201;
    float _221 = _195 * _205;
    float _223 = _191 * _213;
    float _225 = fma(_217, _217, _219);
    float _227 = -_221;
    float _229 = fma(_187, _213, _227);
    float _231 = _187 * _209;
    float _233 = -_223;
    float _235 = fma(_195, _209, _233);
    float _237 = sqrt(_225);
    float _239 = _229 * _229;
    float _241 = -_231;
    float _243 = fma(_191, _205, _241);
    float _245 = fma(_235, _235, _239);
    float _247 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _249 = fma(_243, _243, _245);
    float _251 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _247);
    float _253 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _251);
    float _255 = rsqrt(_249);
    bool _259 = _237 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _253 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _263 = _245;
    float _265 = _261;
    float _267 = _183;
    if (!_259)
    {
        _263 = _197;
    }
    float _269 = _263;
    float _271 = _235 * _255;
    float _273 = _229 * _255;
    float _275 = _243 * _255;
    bool _277 = !_259;
    float _279 = _269;
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
        float _307 = _201 * _287;
        float _309 = -_217;
        float _311 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[41].z, _309);
        float _313 = -_201;
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
        _265 = _526;
        _279 = _528;
        _267 = _530;
    }
    float _532 = _265;
    float _534 = _279;
    float _536 = _267;
    float2 _2022 = float2(_87, _89);
    float2 _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2022, float2(0.0), isnan(_2022))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2022, float2(0.0), isnan(_2022))).xy;
    float _542 = _540.x;
    float _544 = _540.y;
    float _546 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _87);
    float _548 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _89);
    float2 _2043 = float2(_546, _548);
    float4 _551 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2043, float2(0.0), isnan(_2043)), int2(0), component::x).xyzw;
    float _553 = _551.x;
    float _555 = _551.y;
    float _557 = _551.z;
    float _559 = _551.w;
    float2 _2059 = float2(_546, _548);
    float4 _561 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2059, float2(0.0), isnan(_2059)), int2(0), component::w).xyzw;
    float _563 = _561.x;
    float _565 = _561.y;
    float _567 = _561.z;
    float _569 = _561.w;
    float _571 = fma(_542, 2.0, -1.0);
    float _573 = fma(_544, 2.0, -1.0);
    float _575 = _571 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _577 = _573 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _579 = fma(_575, 2.0, _87);
    float _581 = fma(_577, 2.0, _89);
    float2 _2095 = float2(_579, _581);
    float _583 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2095, float2(0.0), isnan(_2095))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2095, float2(0.0), isnan(_2095))).x;
    float2 _2103 = float2(_579, _581);
    float2 _585 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2103, float2(0.0), isnan(_2103))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2103, float2(0.0), isnan(_2103))).yz;
    float _587 = _585.x;
    float _589 = _585.y;
    float _591 = _273 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _593 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _595 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _597 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[35].x, _591);
    float _599 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[35].z, _597);
    float _601 = -_599;
    float _603 = fma(_601, _599, 1.0);
    float _605 = -_599;
    float _607 = fma(_605, (*spvDescriptorSet0.fp_c3)._m0[35].z, _275);
    float _609 = -_599;
    float _611 = fma(_609, (*spvDescriptorSet0.fp_c3)._m0[35].y, _273);
    float _613 = -_599;
    float _615 = fma(_613, (*spvDescriptorSet0.fp_c3)._m0[35].x, _271);
    float _617 = _603 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _619 = fma(_607, _617, _153);
    float _621 = fma(_611, _617, _155);
    float _623 = fma(_615, _617, _157);
    float _625 = -_619;
    bool _627 = _625 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _629 = float(_627);
    float _631 = -_619;
    bool _633 = _631 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _635 = float(_633);
    float _637 = _629 + _635;
    float _639 = precise::min(_637, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _641 = trunc(_639);
    int _643 = int(_641);
    int _645 = _643 << 6;
    bool _647 = _643 != 0;
    uint _650 = uint(int(uint(_645) >> uint(2)));
    uint _652 = uint(int(uint(int(_650)) >> uint(2)));
    int _654 = int(_650) & 3;
    float _656 = (*spvDescriptorSet0.fp_c3)._m0[int(_652)][_654];
    int _658 = int(_650) + 1;
    uint _660 = uint(int(uint(_658) >> uint(2)));
    int _662 = _658 & 3;
    float _664 = (*spvDescriptorSet0.fp_c3)._m0[int(_660)][_662];
    int _666 = _645 + 16;
    uint _668 = uint(int(uint(_666) >> uint(2)));
    uint _670 = uint(int(uint(int(_668)) >> uint(2)));
    int _672 = int(_668) & 3;
    float _674 = (*spvDescriptorSet0.fp_c3)._m0[int(_670)][_672];
    int _676 = int(_668) + 1;
    uint _678 = uint(int(uint(_676) >> uint(2)));
    int _680 = _676 & 3;
    float _682 = (*spvDescriptorSet0.fp_c3)._m0[int(_678)][_680];
    int _684 = _645 + 32;
    uint _686 = uint(int(uint(_684) >> uint(2)));
    uint _688 = uint(int(uint(int(_686)) >> uint(2)));
    int _690 = int(_686) & 3;
    float _692 = (*spvDescriptorSet0.fp_c3)._m0[int(_688)][_690];
    int _694 = int(_686) + 1;
    uint _696 = uint(int(uint(_694) >> uint(2)));
    int _698 = _694 & 3;
    float _700 = (*spvDescriptorSet0.fp_c3)._m0[int(_696)][_698];
    int _702 = _645 + 8;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    uint _706 = uint(int(uint(int(_704)) >> uint(2)));
    int _708 = int(_704) & 3;
    float _710 = (*spvDescriptorSet0.fp_c3)._m0[int(_706)][_708];
    int _712 = int(_704) + 1;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    int _716 = _712 & 3;
    float _718 = (*spvDescriptorSet0.fp_c3)._m0[int(_714)][_716];
    int _720 = _645 + 24;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    uint _724 = uint(int(uint(int(_722)) >> uint(2)));
    int _726 = int(_722) & 3;
    float _728 = (*spvDescriptorSet0.fp_c3)._m0[int(_724)][_726];
    int _730 = int(_722) + 1;
    uint _732 = uint(int(uint(_730) >> uint(2)));
    int _734 = _730 & 3;
    float _736 = (*spvDescriptorSet0.fp_c3)._m0[int(_732)][_734];
    int _738 = _645 + 48;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    uint _742 = uint(int(uint(int(_740)) >> uint(2)));
    int _744 = int(_740) & 3;
    float _746 = (*spvDescriptorSet0.fp_c3)._m0[int(_742)][_744];
    int _748 = int(_740) + 1;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    int _752 = _748 & 3;
    float _754 = (*spvDescriptorSet0.fp_c3)._m0[int(_750)][_752];
    float _756 = _621 * _664;
    float _758 = fma(_623, _656, _756);
    float _760 = floor(_593);
    float _762 = _621 * _682;
    float _764 = fma(_623, _674, _762);
    float _766 = floor(_595);
    float _768 = _621 * _700;
    float _770 = fma(_623, _692, _768);
    float _772 = -_760;
    float _774 = _593 + _772;
    float _776 = fma(_619, _710, _758);
    float _778 = _776 + _718;
    float _780 = -_766;
    float _782 = _595 + _780;
    float _784 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _786 = _774 + _784;
    float _788 = fma(_619, _728, _764);
    float _790 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _792 = _782 + _790;
    int _794 = _645 + 40;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.fp_c3)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.fp_c3)._m0[int(_806)][_808];
    float _812 = _788 + _736;
    float _814 = -_553;
    float _816 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _818 = -_555;
    float _820 = fma(_818, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _822 = _621 * _754;
    float _824 = -_792;
    float _826 = _824 + 1.0;
    float _828 = 1.0 / _816;
    float _830 = -_557;
    float _832 = fma(_830, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _834 = fma(_623, _746, _822);
    float _836 = precise::min(_153, -1.0000000116860974230803549289703e-07);
    float _838 = -_786;
    float _840 = _838 + 1.0;
    float _842 = _786 * _792;
    float _844 = _786 * _826;
    float _846 = -_559;
    float _848 = fma(_846, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _850 = 1.0 / _836;
    float _852 = _792 * _840;
    float _854 = _840 * _826;
    float _856 = 1.0 / _820;
    float _858 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _860 = -_153;
    float _862 = fma(_828, _858, _860);
    float _864 = 1.0 / _832;
    float _866 = _850 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _868 = abs(_862);
    float _870 = _868 * _866;
    float _872 = 1.0 / _848;
    float _874 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _876 = -_153;
    float _878 = fma(_856, _874, _876);
    float _880 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _882 = -_153;
    float _884 = fma(_864, _880, _882);
    float _886 = exp2(_870);
    float _888 = fma(_619, _802, _770);
    float _890 = abs(_878);
    float _892 = _890 * _866;
    int _894 = _645 + 56;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    uint _898 = uint(int(uint(int(_896)) >> uint(2)));
    int _900 = int(_896) & 3;
    float _902 = (*spvDescriptorSet0.fp_c3)._m0[int(_898)][_900];
    int _904 = int(_896) + 1;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    int _908 = _904 & 3;
    float _910 = (*spvDescriptorSet0.fp_c3)._m0[int(_906)][_908];
    float _912 = _888 + _810;
    float _914 = abs(_884);
    float _916 = _914 * _866;
    float _918 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _920 = -_153;
    float _922 = fma(_872, _918, _920);
    float _924 = exp2(_892);
    float _926 = abs(_922);
    float _928 = _926 * _866;
    float _930 = exp2(_916);
    float _932 = abs(_852);
    float _934 = _932 * _886;
    float _936 = exp2(_928);
    float _938 = abs(_842);
    float _940 = _938 * _924;
    float _942 = _934 + _940;
    float _944 = abs(_844);
    float _946 = _944 * _930;
    float _948 = _946 + _942;
    float _950 = abs(_854);
    float _952 = _950 * _936;
    float _954 = _952 + _948;
    float _956 = -_952;
    bool _958 = _948 != _956;
    bool _960 = isnan(_948);
    bool _962 = _958 || _960;
    bool _964 = isnan(_956);
    bool _966 = _962 || _964;
    float _968 = 1.0 / _954;
    float _970 = fma(_619, _902, _834);
    float _972 = _970 + _910;
    float _974 = 1.0 / _972;
    float _976 = _940 * _968;
    float _978 = _934 * _968;
    float _980 = _946 * _968;
    float _982 = _952 * _968;
    float _984 = _966 ? _976 : 0.25;
    float _986 = _966 ? _978 : 0.25;
    float _988 = _966 ? _982 : 0.25;
    float _990 = _984 * _565;
    float _992 = _966 ? _980 : 0.25;
    float _994 = _778 * _974;
    float _996 = _912 * _974;
    float _998 = precise::clamp(_996, 0.0, 1.0);
    float _1000 = fma(_986, _563, _990);
    float _1002 = fma(_992, _567, _1000);
    float _1004 = _812 * _974;
    float _1006 = fma(_988, _569, _1002);
    float _1062;
    if (!_647)
    {
        float _1008 = rint(_639);
        float _1010 = precise::max(_1008, 0.0);
        uint _1012 = uint(_1010);
        uint _1014 = clamp(_1012, 0u, 65535u);
        float _1016 = _998 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1018 = fma(_1016, 0.5, _1004);
        float _1020 = fma(_1016, 0.5, _994);
        float _1022 = fma(_1016, -0.5, _994);
        float _1024 = fma(_1016, -0.5, _1004);
        float3 _2798 = float3(_994, _1018, float(int(_1014)));
        float3 _2802 = select(_2798, float3(0.0), isnan(_2798));
        float _1026 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2802.xy, uint(rint(_2802.z)), _998);
        float3 _2811 = float3(_1020, _1018, float(int(_1014)));
        float3 _2813 = select(_2811, float3(0.0), isnan(_2811));
        float _1028 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2813.xy, uint(rint(_2813.z)), _998);
        float3 _2822 = float3(_1022, _1018, float(int(_1014)));
        float3 _2824 = select(_2822, float3(0.0), isnan(_2822));
        float _1030 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2824.xy, uint(rint(_2824.z)), _998);
        float3 _2833 = float3(_1020, _1004, float(int(_1014)));
        float3 _2835 = select(_2833, float3(0.0), isnan(_2833));
        float _1032 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2835.xy, uint(rint(_2835.z)), _998);
        float3 _2844 = float3(_994, _1004, float(int(_1014)));
        float3 _2846 = select(_2844, float3(0.0), isnan(_2844));
        float _1034 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2846.xy, uint(rint(_2846.z)), _998);
        float3 _2855 = float3(_1022, _1004, float(int(_1014)));
        float3 _2857 = select(_2855, float3(0.0), isnan(_2855));
        float _1036 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2857.xy, uint(rint(_2857.z)), _998);
        float3 _2866 = float3(_1020, _1024, float(int(_1014)));
        float3 _2868 = select(_2866, float3(0.0), isnan(_2866));
        float _1038 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2868.xy, uint(rint(_2868.z)), _998);
        float3 _2877 = float3(_994, _1024, float(int(_1014)));
        float3 _2879 = select(_2877, float3(0.0), isnan(_2877));
        float _1040 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2879.xy, uint(rint(_2879.z)), _998);
        float3 _2888 = float3(_1022, _1024, float(int(_1014)));
        float3 _2890 = select(_2888, float3(0.0), isnan(_2888));
        float _1042 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2890.xy, uint(rint(_2890.z)), _998);
        float _1044 = _1028 + _1026;
        float _1046 = _1044 + _1030;
        float _1048 = _1046 + _1032;
        float _1050 = _1048 + _1034;
        float _1052 = _1050 + _1036;
        float _1054 = _1052 + _1038;
        float _1056 = _1054 + _1040;
        float _1058 = _1056 + _1042;
        float _1060 = _1058 * 0.111111111938953399658203125;
        _1062 = _1060;
        _1064 = true;
    }
    else
    {
        float _1066 = rint(_639);
        float _1068 = precise::max(_1066, 0.0);
        uint _1070 = uint(_1068);
        uint _1072 = clamp(_1070, 0u, 65535u);
        float3 _2937 = float3(_994, _1004, float(int(_1072)));
        float3 _2939 = select(_2937, float3(0.0), isnan(_2937));
        float _1074 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2939.xy, uint(rint(_2939.z)), _998);
        _1062 = _1074;
    }
    _1064 = false;
    float _1076 = _1062;
    float _1078 = _532 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1080 = _532 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1082 = -_153;
    float _1084 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1086 = _1082 + _1084;
    float _1088 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1078);
    float _1090 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1080);
    float _1092 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1088);
    float _1094 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1090);
    float _1096 = _1092 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1098 = _1094 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1100 = trunc(_1096);
    int _1102 = int(_1100);
    float _1104 = trunc(_1098);
    int _1106 = int(_1104);
    int _1108 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1110 = _1102 + _1108;
    int _1112 = _1110 + 1;
    bool _1114 = _1112 >= 0;
    int _1116 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1118 = _1106 + _1116;
    int _1120 = _1118 + 1;
    float _1122 = -_153;
    float _1124 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1126 = _1122 + _1124;
    bool _1128 = _1112 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1130 = !_1114;
    bool _1132 = _1128 || _1130;
    bool _1134 = _1120 < 0;
    bool _1136 = _1134 || _1132;
    bool _1138 = _1120 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1140 = _1138 || _1136;
    float _1142 = as_type<float>(_1102);
    if (_1140)
    {
        _1142 = 1.0;
    }
    float _1144 = _1142;
    float _1146 = _1144;
    if (!_1140)
    {
        int _1148 = _1120 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1150 = _1148 + _1112;
        float _1152 = floor(_1098);
        int _1154 = _1150 << 2;
        int _1156 = _1150 >> 2;
        int _1158 = 12 & _1154;
        int _1160 = _1156 << 4;
        int _1162 = _1160 + _1158;
        float _1164 = floor(_1096);
        uint _1166 = uint(int(uint(_1162) >> uint(2)));
        uint _1168 = uint(int(uint(int(_1166)) >> uint(2)));
        int _1170 = int(_1166) & 3;
        float _1172 = (*spvDescriptorSet0.fp_c5)._m0[int(_1168)][_1170];
        float _1174 = -_1152;
        float _1176 = _1098 + _1174;
        float _1178 = -_1164;
        float _1180 = _1096 + _1178;
        float _1182 = rint(_1172);
        float _1184 = precise::max(_1182, 0.0);
        uint _1186 = uint(_1184);
        uint _1188 = clamp(_1186, 0u, 65535u);
        float3 _3126 = float3(_1180, _1176, float(int(_1188)));
        float3 _3128 = select(_3126, float3(0.0), isnan(_3126));
        float _1190 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3128.xy, uint(rint(_3128.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3128.xy, uint(rint(_3128.z)), level(0.0)).x;
        int _1192 = _1150 << 4;
        int _1194 = _1192 + 1648;
        int _1196 = _1162 + 8048;
        uint _1198 = uint(int(uint(_1196) >> uint(2)));
        uint _1200 = uint(int(uint(int(_1198)) >> uint(2)));
        int _1202 = int(_1198) & 3;
        float _1204 = (*spvDescriptorSet0.fp_c5)._m0[int(_1200)][_1202];
        uint _1206 = uint(int(uint(_1194) >> uint(2)));
        uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
        int _1210 = int(_1206) & 3;
        float _1212 = (*spvDescriptorSet0.fp_c5)._m0[int(_1208)][_1210];
        int _1214 = int(_1206) + 1;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        int _1218 = _1214 & 3;
        float _1220 = (*spvDescriptorSet0.fp_c5)._m0[int(_1216)][_1218];
        int _1222 = _1194 + 8;
        uint _1224 = uint(int(uint(_1222) >> uint(2)));
        uint _1226 = uint(int(uint(int(_1224)) >> uint(2)));
        int _1228 = int(_1224) & 3;
        float _1230 = (*spvDescriptorSet0.fp_c5)._m0[int(_1226)][_1228];
        int _1232 = int(_1224) + 1;
        uint _1234 = uint(int(uint(_1232) >> uint(2)));
        int _1236 = _1232 & 3;
        float _1238 = (*spvDescriptorSet0.fp_c5)._m0[int(_1234)][_1236];
        float _1240 = _1204 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1242 = _532 * _1220;
        float _1244 = fma(_534, _1212, _1242);
        float _1246 = 1.0 / _1204;
        float _1248 = fma(_536, _1230, _1244);
        float _1250 = _1248 + _1238;
        float _1252 = precise::clamp(_1250, 0.0, 1.0);
        float _1254 = -_1252;
        float _1256 = _1254 + _1190;
        float _1258 = fma(_1246, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1256);
        float _1260 = _1240 * _1258;
        float _1262 = exp2(_1260);
        float _1264 = 0.0 + _1262;
        float _1266 = precise::clamp(_1264, 0.0, 1.0);
        _1146 = _1266;
    }
    float _1268 = _1146;
    float _1270 = precise::min(_1268, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1272 = -_1076;
    float _1274 = _1272 + 1.0;
    float _1276 = _1126 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1278 = precise::clamp(_1276, 0.0, 1.0);
    float _1280 = _1086 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = precise::min(_1006, 1.0);
    float _1286 = -_1270;
    float _1288 = _1286 + 1.0;
    float _1290 = fma(_1278, _1274, _1076);
    float _1292 = fma(_1282, _1288, _1270);
    out.m_62.x = _1290;
    out.m_62.y = _1292;
    out.m_62.z = _1284;
    out.m_62.w = 1.0;
    out.m_64.x = _583;
    out.m_64.y = _587;
    out.m_64.z = _589;
    out.m_64.w = 1.0;
    return out;
}

