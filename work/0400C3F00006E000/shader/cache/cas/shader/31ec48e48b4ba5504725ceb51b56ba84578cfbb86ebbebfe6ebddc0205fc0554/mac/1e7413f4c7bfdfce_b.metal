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
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_14 [[id(11)]];
    sampler fp_t_tcb_14Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_18 [[id(13)]];
    sampler fp_t_tcb_18Smplr [[id(14)]];
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
    bool _1114 = false;
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
    float2 _1380 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1380, float2(0.0), isnan(_1380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1380, float2(0.0), isnan(_1380))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1395 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1395, float2(0.0), isnan(_1395))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1395, float2(0.0), isnan(_1395))).x;
    float2 _1403 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1403, float2(0.0), isnan(_1403))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1403, float2(0.0), isnan(_1403))).x;
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
    float _143 = _85 * _129;
    float _145 = -_93;
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _149 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[41].x, _147);
    float _151 = _149 * _137;
    float _153 = _149 * _139;
    float _155 = -_97;
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _159 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].x, _157);
    float _161 = _85 * _123;
    float _163 = _151 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _165 = _151 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _167 = _85 * _135;
    float _169 = -_153;
    float _171 = fma(_159, _141, _169);
    float _173 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].x, _163);
    float _175 = -_99;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _179 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[41].x, _177);
    float _181 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].x, _165);
    float _183 = -_151;
    float _185 = fma(_159, _161, _183);
    float _187 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[32].z, _173);
    float _189 = -_149;
    float _191 = _189 + _159;
    float _193 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[30].z, _181);
    float _195 = -_153;
    float _197 = fma(_179, _143, _195);
    float _199 = _187 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _201 = -_151;
    float _203 = fma(_179, _167, _201);
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _207 = -_149;
    float _209 = _207 + _179;
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _213 = _199 + _211;
    float _215 = _191 * _197;
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _219 = _205 + _217;
    float _221 = _185 * _209;
    float _223 = _213 * _213;
    float _225 = -_215;
    float _227 = fma(_171, _209, _225);
    float _229 = _171 * _203;
    float _231 = -_221;
    float _233 = fma(_191, _203, _231);
    float _235 = fma(_219, _219, _223);
    float _237 = _227 * _227;
    float _239 = -_229;
    float _241 = fma(_185, _197, _239);
    float _243 = sqrt(_235);
    float _245 = fma(_233, _233, _237);
    float _247 = _151 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _249 = fma(_241, _241, _245);
    float _251 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].x, _247);
    float _253 = rsqrt(_249);
    float _255 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[31].z, _251);
    float _257 = _255 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _261 = _243 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _263 = _233 * _253;
    float _265 = _227 * _253;
    float _267 = _241 * _253;
    bool _269 = !_261;
    float _271 = _205;
    float _273 = _199;
    float _275 = _257;
    if (!_269)
    {
        float _277 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _279 = _243 + _277;
        float _281 = _257 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _283 = rsqrt(_235);
        float _285 = -_257;
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _289 = _285 + _287;
        float _291 = abs(_281);
        float _293 = abs(_279);
        float _295 = precise::max(_291, _293);
        float _297 = _289 * _289;
        bool _299 = _295 >= 16.0;
        float _301 = _219 * _283;
        float _303 = _213 * _283;
        float _305 = -_219;
        float _307 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[41].z, _305);
        float _309 = -_213;
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
        _271 = _524;
        _273 = _526;
        _275 = _522;
    }
    float _528 = _271;
    float _530 = _273;
    float _532 = _275;
    float _534 = fma(_528, 6.2500002968590706586837768554688e-05, 0.5);
    float _536 = fma(_530, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2070 = float2(_534, _536);
    float _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2070, float2(0.0), isnan(_2070))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2070, float2(0.0), isnan(_2070))).x;
    float2 _2078 = float2(_87, _89);
    float4 _541 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2078, float2(0.0), isnan(_2078)), int2(0), component::x).xyzw;
    float _543 = _541.x;
    float _545 = _541.y;
    float _547 = _541.z;
    float _549 = _541.w;
    float2 _2094 = float2(_87, _89);
    float4 _551 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2094, float2(0.0), isnan(_2094)), int2(0), component::w).xyzw;
    float _553 = _551.x;
    float _555 = _551.y;
    float _557 = _551.z;
    float _559 = _551.w;
    float _561 = fma(_528, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _563 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float2 _2123 = float2(_534, _536);
    float _565 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2123, float2(0.0), isnan(_2123)), level(_538)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2123, float2(0.0), isnan(_2123)), level(_538)).x;
    float2 _2132 = float2(_561, _563);
    float _567 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2132, float2(0.0), isnan(_2132))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2132, float2(0.0), isnan(_2132))).x;
    float _569 = _265 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _571 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[35].x, _569);
    float _573 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].z, _571);
    float _575 = -_573;
    float _577 = fma(_575, _573, 1.0);
    float _579 = -_573;
    float _581 = fma(_579, (*spvDescriptorSet0.fp_c3)._m0[35].z, _267);
    float _583 = abs(_149);
    float _585 = log2(_583);
    float _587 = -_573;
    float _589 = fma(_587, (*spvDescriptorSet0.fp_c3)._m0[35].x, _263);
    float _591 = _577 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _593 = -_573;
    float _595 = fma(_593, (*spvDescriptorSet0.fp_c3)._m0[35].y, _265);
    float _597 = fma(_581, _591, _149);
    float _599 = fma(_595, _591, _151);
    float _601 = fma(_589, _591, _153);
    float _603 = -_597;
    bool _605 = _603 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _607 = float(_605);
    float _609 = -_597;
    bool _611 = _609 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _613 = float(_611);
    float _615 = _585 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _617 = _607 + _613;
    float _619 = exp2(_615);
    float _621 = precise::min(_617, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _623 = trunc(_621);
    int _625 = int(_623);
    float _627 = fma(_619, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _629 = precise::clamp(_627, 0.0, 1.0);
    float _631 = fma(_629, -2.0, 3.0);
    float _633 = _629 * _629;
    float _635 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    int _637 = _625 << 6;
    float _639 = _633 * _631;
    bool _641 = _625 != 0;
    uint _644 = uint(int(uint(_637) >> uint(2)));
    uint _646 = uint(int(uint(int(_644)) >> uint(2)));
    int _648 = int(_644) & 3;
    float _650 = (*spvDescriptorSet0.fp_c3)._m0[int(_646)][_648];
    int _652 = int(_644) + 1;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    int _656 = _652 & 3;
    float _658 = (*spvDescriptorSet0.fp_c3)._m0[int(_654)][_656];
    float _660 = precise::min(_149, -1.0000000116860974230803549289703e-07);
    int _662 = _637 + 16;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    uint _666 = uint(int(uint(int(_664)) >> uint(2)));
    int _668 = int(_664) & 3;
    float _670 = (*spvDescriptorSet0.fp_c3)._m0[int(_666)][_668];
    int _672 = int(_664) + 1;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    int _676 = _672 & 3;
    float _678 = (*spvDescriptorSet0.fp_c3)._m0[int(_674)][_676];
    int _680 = _637 + 32;
    uint _682 = uint(int(uint(_680) >> uint(2)));
    uint _684 = uint(int(uint(int(_682)) >> uint(2)));
    int _686 = int(_682) & 3;
    float _688 = (*spvDescriptorSet0.fp_c3)._m0[int(_684)][_686];
    int _690 = int(_682) + 1;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    int _694 = _690 & 3;
    float _696 = (*spvDescriptorSet0.fp_c3)._m0[int(_692)][_694];
    int _698 = _637 + 48;
    uint _700 = uint(int(uint(_698) >> uint(2)));
    uint _702 = uint(int(uint(int(_700)) >> uint(2)));
    int _704 = int(_700) & 3;
    float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
    int _708 = int(_700) + 1;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    int _712 = _708 & 3;
    float _714 = (*spvDescriptorSet0.fp_c3)._m0[int(_710)][_712];
    int _716 = _637 + 24;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    uint _720 = uint(int(uint(int(_718)) >> uint(2)));
    int _722 = int(_718) & 3;
    float _724 = (*spvDescriptorSet0.fp_c3)._m0[int(_720)][_722];
    int _726 = int(_718) + 1;
    uint _728 = uint(int(uint(_726) >> uint(2)));
    int _730 = _726 & 3;
    float _732 = (*spvDescriptorSet0.fp_c3)._m0[int(_728)][_730];
    float _734 = _599 * _658;
    float _736 = fma(_601, _650, _734);
    int _738 = _637 + 8;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    uint _742 = uint(int(uint(int(_740)) >> uint(2)));
    int _744 = int(_740) & 3;
    float _746 = (*spvDescriptorSet0.fp_c3)._m0[int(_742)][_744];
    int _748 = int(_740) + 1;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    int _752 = _748 & 3;
    float _754 = (*spvDescriptorSet0.fp_c3)._m0[int(_750)][_752];
    float _756 = floor(_635);
    float _758 = _599 * _678;
    float _760 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _762 = fma(_601, _670, _758);
    float _764 = floor(_760);
    float _766 = _599 * _696;
    float _768 = fma(_601, _688, _766);
    float _770 = -_756;
    float _772 = _635 + _770;
    float _774 = _599 * _714;
    float _776 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _778 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _780 = _772 + _778;
    float _782 = fma(_601, _706, _774);
    float _784 = -_639;
    float _786 = _784 + 1.0;
    float _788 = -_764;
    float _790 = _760 + _788;
    float _792 = precise::max(0.0, _776);
    float _794 = fma(_786, (*spvDescriptorSet0.fp_c3)._m0[44].w, _639);
    float _796 = -_780;
    float _798 = _796 + 1.0;
    float _800 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _802 = _790 + _800;
    float _804 = -_802;
    float _806 = _804 + 1.0;
    float _808 = _780 * _802;
    float _810 = _802 * _798;
    float _812 = _780 * _806;
    float _814 = _798 * _806;
    float _816 = _794 * _792;
    float _818 = fma(_597, _724, _762);
    int _820 = _637 + 40;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.fp_c3)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.fp_c3)._m0[int(_832)][_834];
    float _838 = 1.0 / _660;
    float _840 = _818 + _732;
    float _842 = fma(_597, _746, _736);
    float _844 = _842 + _754;
    float _846 = -_543;
    float _848 = fma(_846, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _850 = -_545;
    float _852 = fma(_850, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _854 = -_547;
    float _856 = fma(_854, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _858 = -_549;
    float _860 = fma(_858, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _862 = _838 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _864 = 1.0 / _852;
    float _866 = 1.0 / _848;
    float _868 = 1.0 / _856;
    float _870 = 1.0 / _860;
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _874 = -_149;
    float _876 = fma(_866, _872, _874);
    float _878 = abs(_876);
    float _880 = _878 * _862;
    float _882 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _884 = -_149;
    float _886 = fma(_864, _882, _884);
    float _888 = fma(_597, _828, _768);
    float _890 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _892 = -_149;
    float _894 = fma(_868, _890, _892);
    float _896 = abs(_886);
    float _898 = _896 * _862;
    float _900 = exp2(_880);
    float _902 = abs(_894);
    float _904 = _902 * _862;
    float _906 = _888 + _836;
    float _908 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _910 = -_149;
    float _912 = fma(_870, _908, _910);
    float _914 = exp2(_898);
    float _916 = abs(_912);
    float _918 = _916 * _862;
    int _920 = _637 + 56;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    uint _924 = uint(int(uint(int(_922)) >> uint(2)));
    int _926 = int(_922) & 3;
    float _928 = (*spvDescriptorSet0.fp_c3)._m0[int(_924)][_926];
    int _930 = int(_922) + 1;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    int _934 = _930 & 3;
    float _936 = (*spvDescriptorSet0.fp_c3)._m0[int(_932)][_934];
    float _938 = exp2(_904);
    float _940 = abs(_810);
    float _942 = _940 * _900;
    bool _944 = _149 >= (-8000.0);
    bool _946 = isnan(_149);
    bool _948 = _944 || _946;
    bool _950 = isnan(-8000.0);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _954 * _816;
    float _958 = exp2(_918);
    float _960 = abs(_808);
    float _962 = _960 * _914;
    float _964 = _942 + _962;
    float _966 = abs(_812);
    float _968 = _966 * _938;
    float _970 = _968 + _964;
    float _972 = abs(_814);
    float _974 = _972 * _958;
    float _976 = _974 + _970;
    float _978 = -_974;
    bool _980 = _970 != _978;
    bool _982 = isnan(_970);
    bool _984 = _980 || _982;
    bool _986 = isnan(_978);
    bool _988 = _984 || _986;
    float _990 = 1.0 / _976;
    float _992 = fma(_597, _928, _782);
    float _994 = _992 + _936;
    float _996 = _962 * _990;
    float _998 = _942 * _990;
    float _1000 = _968 * _990;
    float _1002 = _974 * _990;
    float _1004 = _988 ? _996 : 0.25;
    float _1006 = 1.0 / _994;
    float _1008 = _988 ? _998 : 0.25;
    float _1010 = _988 ? _1000 : 0.25;
    float _1012 = _1004 * _555;
    float _1014 = fma(_1008, _553, _1012);
    float _1016 = _956 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1018 = fma(_1010, _557, _1014);
    float _1020 = _988 ? _1002 : 0.25;
    float _1022 = abs(_565);
    float _1024 = _1022 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1026 = -_567;
    float _1028 = _1026 + 1.0;
    float _1030 = fma(_1020, _559, _1018);
    float _1032 = _844 * _1006;
    float _1034 = -_1024;
    float _1036 = fma(_954, _1034, 1.0);
    float _1038 = _1028 * _1016;
    float _1040 = precise::clamp(_1038, 0.0, 1.0);
    float _1042 = _840 * _1006;
    float _1044 = _906 * _1006;
    float _1046 = precise::clamp(_1044, 0.0, 1.0);
    float _1048 = precise::min(_1030, 1.0);
    float _1050 = -_1040;
    float _1052 = fma(_1050, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1054 = precise::min(_1036, 1.0);
    float _1056 = precise::min(_1054, _1052);
    float _1112;
    if (!_641)
    {
        float _1058 = rint(_621);
        float _1060 = precise::max(_1058, 0.0);
        uint _1062 = uint(_1060);
        uint _1064 = clamp(_1062, 0u, 65535u);
        float _1066 = _1046 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1068 = fma(_1066, 0.5, _1042);
        float _1070 = fma(_1066, 0.5, _1032);
        float _1072 = fma(_1066, -0.5, _1032);
        float _1074 = fma(_1066, -0.5, _1042);
        float3 _2925 = float3(_1032, _1068, float(int(_1064)));
        float3 _2929 = select(_2925, float3(0.0), isnan(_2925));
        float _1076 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2929.xy, uint(rint(_2929.z)), _1046);
        float3 _2938 = float3(_1070, _1068, float(int(_1064)));
        float3 _2940 = select(_2938, float3(0.0), isnan(_2938));
        float _1078 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2940.xy, uint(rint(_2940.z)), _1046);
        float3 _2949 = float3(_1072, _1068, float(int(_1064)));
        float3 _2951 = select(_2949, float3(0.0), isnan(_2949));
        float _1080 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2951.xy, uint(rint(_2951.z)), _1046);
        float3 _2960 = float3(_1070, _1042, float(int(_1064)));
        float3 _2962 = select(_2960, float3(0.0), isnan(_2960));
        float _1082 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2962.xy, uint(rint(_2962.z)), _1046);
        float3 _2971 = float3(_1032, _1042, float(int(_1064)));
        float3 _2973 = select(_2971, float3(0.0), isnan(_2971));
        float _1084 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2973.xy, uint(rint(_2973.z)), _1046);
        float3 _2982 = float3(_1072, _1042, float(int(_1064)));
        float3 _2984 = select(_2982, float3(0.0), isnan(_2982));
        float _1086 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2984.xy, uint(rint(_2984.z)), _1046);
        float3 _2993 = float3(_1070, _1074, float(int(_1064)));
        float3 _2995 = select(_2993, float3(0.0), isnan(_2993));
        float _1088 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2995.xy, uint(rint(_2995.z)), _1046);
        float3 _3004 = float3(_1032, _1074, float(int(_1064)));
        float3 _3006 = select(_3004, float3(0.0), isnan(_3004));
        float _1090 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3006.xy, uint(rint(_3006.z)), _1046);
        float3 _3015 = float3(_1072, _1074, float(int(_1064)));
        float3 _3017 = select(_3015, float3(0.0), isnan(_3015));
        float _1092 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3017.xy, uint(rint(_3017.z)), _1046);
        float _1094 = _1078 + _1076;
        float _1096 = _1094 + _1080;
        float _1098 = _1096 + _1082;
        float _1100 = _1098 + _1084;
        float _1102 = _1100 + _1086;
        float _1104 = _1102 + _1088;
        float _1106 = _1104 + _1090;
        float _1108 = _1106 + _1092;
        float _1110 = _1108 * 0.111111111938953399658203125;
        _1112 = _1110;
        _1114 = true;
    }
    else
    {
        float _1116 = rint(_621);
        float _1118 = precise::max(_1116, 0.0);
        uint _1120 = uint(_1118);
        uint _1122 = clamp(_1120, 0u, 65535u);
        float3 _3064 = float3(_1032, _1042, float(int(_1122)));
        float3 _3066 = select(_3064, float3(0.0), isnan(_3064));
        float _1124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3066.xy, uint(rint(_3066.z)), _1046);
        _1112 = _1124;
    }
    _1114 = false;
    float _1126 = _1112;
    float _1128 = _532 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1130 = _532 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1132 = -_149;
    float _1134 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1136 = _1132 + _1134;
    float _1138 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1128);
    float _1140 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1130);
    float _1142 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1138);
    float _1144 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1140);
    float _1146 = _1142 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1148 = _1144 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1150 = trunc(_1146);
    int _1152 = int(_1150);
    float _1154 = trunc(_1148);
    int _1156 = int(_1154);
    int _1158 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1160 = _1152 + _1158;
    int _1162 = _1160 + 1;
    bool _1164 = _1162 >= 0;
    int _1166 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1168 = _1156 + _1166;
    int _1170 = _1168 + 1;
    float _1172 = -_149;
    float _1174 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1176 = _1172 + _1174;
    bool _1178 = _1162 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1180 = !_1164;
    bool _1182 = _1178 || _1180;
    bool _1184 = _1170 < 0;
    bool _1186 = _1184 || _1182;
    bool _1188 = _1170 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1190 = _1188 || _1186;
    float _1192 = as_type<float>(_1152);
    if (_1190)
    {
        _1192 = 1.0;
    }
    float _1194 = _1192;
    float _1196 = _1194;
    if (!_1190)
    {
        int _1198 = _1170 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1200 = _1198 + _1162;
        float _1202 = floor(_1148);
        int _1204 = _1200 << 2;
        int _1206 = _1200 >> 2;
        int _1208 = 12 & _1204;
        int _1210 = _1206 << 4;
        int _1212 = _1210 + _1208;
        float _1214 = floor(_1146);
        uint _1216 = uint(int(uint(_1212) >> uint(2)));
        uint _1218 = uint(int(uint(int(_1216)) >> uint(2)));
        int _1220 = int(_1216) & 3;
        float _1222 = (*spvDescriptorSet0.fp_c5)._m0[int(_1218)][_1220];
        float _1224 = -_1202;
        float _1226 = _1148 + _1224;
        float _1228 = -_1214;
        float _1230 = _1146 + _1228;
        float _1232 = rint(_1222);
        float _1234 = precise::max(_1232, 0.0);
        uint _1236 = uint(_1234);
        uint _1238 = clamp(_1236, 0u, 65535u);
        float3 _3253 = float3(_1230, _1226, float(int(_1238)));
        float3 _3255 = select(_3253, float3(0.0), isnan(_3253));
        float _1240 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3255.xy, uint(rint(_3255.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3255.xy, uint(rint(_3255.z)), level(0.0)).x;
        int _1242 = _1200 << 4;
        int _1244 = _1242 + 1648;
        int _1246 = _1212 + 8048;
        uint _1248 = uint(int(uint(_1246) >> uint(2)));
        uint _1250 = uint(int(uint(int(_1248)) >> uint(2)));
        int _1252 = int(_1248) & 3;
        float _1254 = (*spvDescriptorSet0.fp_c5)._m0[int(_1250)][_1252];
        uint _1256 = uint(int(uint(_1244) >> uint(2)));
        uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
        int _1260 = int(_1256) & 3;
        float _1262 = (*spvDescriptorSet0.fp_c5)._m0[int(_1258)][_1260];
        int _1264 = int(_1256) + 1;
        uint _1266 = uint(int(uint(_1264) >> uint(2)));
        int _1268 = _1264 & 3;
        float _1270 = (*spvDescriptorSet0.fp_c5)._m0[int(_1266)][_1268];
        int _1272 = _1244 + 8;
        uint _1274 = uint(int(uint(_1272) >> uint(2)));
        uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
        int _1278 = int(_1274) & 3;
        float _1280 = (*spvDescriptorSet0.fp_c5)._m0[int(_1276)][_1278];
        int _1282 = int(_1274) + 1;
        uint _1284 = uint(int(uint(_1282) >> uint(2)));
        int _1286 = _1282 & 3;
        float _1288 = (*spvDescriptorSet0.fp_c5)._m0[int(_1284)][_1286];
        float _1290 = 1.0 / _1254;
        float _1292 = _1254 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1294 = _532 * _1270;
        float _1296 = fma(_528, _1262, _1294);
        float _1298 = fma(_530, _1280, _1296);
        float _1300 = _1298 + _1288;
        float _1302 = precise::clamp(_1300, 0.0, 1.0);
        float _1304 = -_1302;
        float _1306 = _1304 + _1240;
        float _1308 = fma(_1290, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1306);
        float _1310 = _1292 * _1308;
        float _1312 = exp2(_1310);
        float _1314 = 0.0 + _1312;
        float _1316 = precise::clamp(_1314, 0.0, 1.0);
        _1196 = _1316;
    }
    float _1318 = _1196;
    float _1320 = precise::min(_1318, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1322 = -_1126;
    float _1324 = _1322 + 1.0;
    float _1326 = _1136 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1328 = precise::clamp(_1326, 0.0, 1.0);
    float _1330 = _1176 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1332 = precise::clamp(_1330, 0.0, 1.0);
    float _1334 = -_1320;
    float _1336 = _1334 + 1.0;
    float _1338 = fma(_1328, _1324, _1126);
    float _1340 = fma(_1332, _1336, _1320);
    out.m_62.x = _1338;
    out.m_62.y = _1340;
    out.m_62.z = _1048;
    out.m_62.w = _1056;
    out.m_64.x = 1.0;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

