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
    texture2d<float> fp_t_tcb_18 [[id(5)]];
    sampler fp_t_tcb_18Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_14 [[id(7)]];
    sampler fp_t_tcb_14Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_16 [[id(11)]];
    sampler fp_t_tcb_16Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_1A [[id(13)]];
    sampler fp_t_tcb_1ASmplr [[id(14)]];
    texture2d<float> fp_t_tcb_E [[id(15)]];
    sampler fp_t_tcb_ESmplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_C [[id(17)]];
    sampler fp_t_tcb_CSmplr [[id(18)]];
    texture2d_array<float> fp_t_tcb_10 [[id(19)]];
    sampler fp_t_tcb_10Smplr [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_18Smplr_w [[id(22)]];
    sampler fp_t_tcb_16Smplr_w [[id(23)]];
    sampler fp_t_tcb_1ASmplr_w [[id(24)]];
    sampler fp_t_tcb_ESmplr_w [[id(25)]];
    sampler fp_t_tcb_10Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_64 [[color(0)]];
    float4 m_66 [[color(1)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1118 = false;
    float _73 = gl_FragCoord.w;
    float _75 = in.m_55.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_55.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _73;
    float _89 = _87 * _79;
    float _91 = _87 * _85;
    float _93 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1384 = float2(_89, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1384, float2(0.0), isnan(_1384))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1384, float2(0.0), isnan(_1384))).x;
    float _97 = _91 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1399 = float2(_93, _91);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1399, float2(0.0), isnan(_1399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1399, float2(0.0), isnan(_1399))).x;
    float2 _1407 = float2(_89, _97);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1407, float2(0.0), isnan(_1407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1407, float2(0.0), isnan(_1407))).x;
    float _103 = in.m_57.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_57.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_59.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_61.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_59.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_61.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = _87 * _107;
    float _141 = _87 * _113;
    float _143 = _87 * _119;
    float _145 = _87 * _125;
    float _147 = _87 * _131;
    float _149 = _87 * _137;
    float _151 = -_95;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _155 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].x, _153);
    float _157 = _155 * _139;
    float _159 = _155 * _141;
    float _161 = _157 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _163 = _157 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _165 = -_99;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _169 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[41].x, _167);
    float _171 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[32].x, _161);
    float _173 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[30].x, _163);
    float _175 = -_101;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _179 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[41].x, _177);
    float _181 = -_155;
    float _183 = _181 + _169;
    float _185 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[32].z, _171);
    float _187 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[30].z, _173);
    float _189 = -_159;
    float _191 = fma(_179, _145, _189);
    float _193 = -_157;
    float _195 = fma(_179, _149, _193);
    float _197 = _185 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _199 = _187 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _201 = -_159;
    float _203 = fma(_169, _147, _201);
    float _205 = -_157;
    float _207 = fma(_169, _143, _205);
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _211 = _197 + _209;
    float _213 = -_155;
    float _215 = _213 + _179;
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _219 = _199 + _217;
    float _221 = _183 * _191;
    float _223 = _211 * _211;
    float _225 = _207 * _215;
    float _227 = -_221;
    float _229 = fma(_203, _215, _227);
    float _231 = fma(_219, _219, _223);
    float _233 = _203 * _195;
    float _235 = -_225;
    float _237 = fma(_183, _195, _235);
    float _239 = _229 * _229;
    float _241 = sqrt(_231);
    float _243 = -_233;
    float _245 = fma(_207, _191, _243);
    float _247 = _157 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _249 = fma(_237, _237, _239);
    float _251 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[31].x, _247);
    float _253 = fma(_245, _245, _249);
    float _255 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[31].z, _251);
    float _257 = rsqrt(_253);
    float _259 = _255 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _263 = _241 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _265 = _237 * _257;
    float _267 = _229 * _257;
    float _269 = _245 * _257;
    bool _271 = !_263;
    float _273 = _199;
    float _275 = _197;
    float _277 = _259;
    if (!_271)
    {
        float _279 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _281 = _241 + _279;
        float _283 = _259 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _285 = rsqrt(_231);
        float _287 = -_259;
        float _289 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = _287 + _289;
        float _293 = abs(_283);
        float _295 = abs(_281);
        float _297 = precise::max(_293, _295);
        float _299 = _291 * _291;
        bool _301 = _297 >= 16.0;
        float _303 = _219 * _285;
        float _305 = _211 * _285;
        float _307 = -_219;
        float _309 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[41].z, _307);
        float _311 = -_211;
        float _313 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[41].z, _311);
        float _315 = _281;
        float _317 = _283;
        int _320 = as_type<int>(_313);
        if (_301)
        {
            float _322 = _281 * 0.0625;
            _315 = _322;
        }
        float _324 = _315;
        if (_301)
        {
            float _326 = _283 * 0.0625;
            _317 = _326;
        }
        float _328 = _317;
        float _330 = fma(_309, _309, _299);
        float _332 = abs(_324);
        bool _334 = _332 != 0.0;
        bool _336 = isnan(_332);
        bool _338 = _334 || _336;
        bool _340 = isnan(0.0);
        bool _342 = _338 || _340;
        float _344 = fma(_313, _313, _330);
        float _346 = abs(_328);
        bool _348 = _346 == 0.0;
        float _350 = abs(_328);
        bool _352 = _350 == 0.0;
        bool _354 = !_342;
        bool _356 = _352 && _354;
        float _358 = sqrt(_344);
        bool _360 = false;
        if (_356)
        {
            bool _362 = as_type<int>(_328) >= 0;
            _360 = _362;
        }
        bool _364 = _360;
        int _366 = _364 ? (-1) : 0;
        if (_356)
        {
            int _368 = _364 ? 0 : 1078530011;
            _320 = _368;
        }
        int _370 = _320;
        int _372 = _370;
        if (_356)
        {
            int _374 = int(0x80000000) & as_type<int>(_324);
            int _376 = _370 | _374;
            _372 = _376;
        }
        int _378 = _372;
        bool _380 = !_342;
        bool _382 = _380 && _348;
        int _384 = _378;
        float _386 = as_type<float>(_378);
        if (!_382)
        {
            float _388 = abs(_324);
            bool _390 = _388 != as_type<float>(0x7f800000u /* inf */);
            bool _392 = isnan(_388);
            bool _394 = _390 || _392;
            bool _396 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _398 = _394 || _396;
            float _400 = abs(_328);
            bool _402 = _400 == as_type<float>(0x7f800000u /* inf */);
            float _404 = abs(_328);
            bool _406 = _404 == as_type<float>(0x7f800000u /* inf */);
            bool _408 = !_398;
            bool _410 = _406 && _408;
            if (_410)
            {
                bool _412 = as_type<int>(_328) >= 0;
                _366 = _412 ? (-1) : 0;
            }
            int _414 = _366;
            if (_410)
            {
                _384 = 1075235812;
            }
            int _416 = _384;
            int _418 = _416;
            if (_410)
            {
                int _420 = ~_414;
                int _422 = (_420 != 0) ? _416 : 1061752795;
                _418 = _422;
            }
            int _424 = _418;
            float _426 = as_type<float>(_424);
            if (_410)
            {
                int _428 = int(0x80000000) & as_type<int>(_324);
                int _430 = _424 | _428;
                _426 = as_type<float>(_430);
            }
            float _432 = _426;
            bool _434 = !_398;
            bool _436 = _434 && _402;
            _386 = _432;
            if (!_436)
            {
                float _438 = abs(_324);
                float _440 = abs(_328);
                float _442 = precise::max(_438, _440);
                float _444 = abs(_324);
                float _446 = abs(_328);
                float _448 = precise::min(_444, _446);
                float _450 = 1.0 / _442;
                float _452 = abs(_324);
                float _454 = abs(_328);
                bool _456 = _452 > _454;
                bool _458 = as_type<int>(_328) >= 0;
                float _460 = _448 * _450;
                float _462 = abs(_324);
                float _464 = abs(_328);
                float _466 = _462 + _464;
                int _468 = as_type<int>(_324) & int(0x80000000);
                float _470 = _460 * _460;
                bool _472 = _466 > as_type<float>(0x7f800000u /* inf */);
                bool _474 = isnan(_466);
                bool _476 = _472 || _474;
                bool _478 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _480 = _476 || _478;
                float _482 = _470 + 11.33538818359375;
                float _484 = fma(_470, _482, 28.84246826171875);
                float _486 = fma(_470, _484, 19.6966705322265625);
                float _488 = fma(_470, -0.82336294651031494140625, -5.674867153167724609375);
                float _490 = fma(_470, _488, -6.565555095672607421875);
                float _492 = 1.0 / _486;
                float _494 = _470 * _490;
                float _496 = _460 * _494;
                float _498 = fma(_496, _492, _460);
                float _500 = _498;
                _386 = _466;
                if (_456)
                {
                    float _502 = -_498;
                    float _504 = _502 + 1.57079637050628662109375;
                    _500 = _504;
                }
                float _506 = _500;
                int _508 = as_type<int>(_506);
                if (!_458)
                {
                    float _510 = -_506;
                    float _512 = _510 + 3.1415927410125732421875;
                    _508 = as_type<int>(_512);
                }
                int _514 = _508;
                if (!_480)
                {
                    int _516 = _468 | _514;
                    _386 = as_type<float>(_516);
                }
            }
        }
        float _518 = _386;
        float _520 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _522 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _524 = _358 + _522;
        float _526 = fma(_303, _520, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _528 = fma(_305, _520, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _273 = _526;
        _275 = _528;
        _277 = _524;
    }
    float _530 = _273;
    float _532 = _275;
    float _534 = _277;
    float _536 = fma(_530, 6.2500002968590706586837768554688e-05, 0.5);
    float _538 = fma(_532, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2074 = float2(_536, _538);
    float _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2074, float2(0.0), isnan(_2074))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2074, float2(0.0), isnan(_2074))).x;
    float2 _2082 = float2(_89, _91);
    float4 _543 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2082, float2(0.0), isnan(_2082)), int2(0), component::x).xyzw;
    float _545 = _543.x;
    float _547 = _543.y;
    float _549 = _543.z;
    float _551 = _543.w;
    float2 _2098 = float2(_89, _91);
    float4 _553 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2098, float2(0.0), isnan(_2098)), int2(0), component::w).xyzw;
    float _555 = _553.x;
    float _557 = _553.y;
    float _559 = _553.z;
    float _561 = _553.w;
    float _563 = _267 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _565 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _567 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float2 _2132 = float2(_536, _538);
    float _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2132, float2(0.0), isnan(_2132)), level(_540)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2132, float2(0.0), isnan(_2132)), level(_540)).x;
    float2 _2141 = float2(_565, _567);
    float _571 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2141, float2(0.0), isnan(_2141))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2141, float2(0.0), isnan(_2141))).x;
    float2 _2149 = float2(_89, _91);
    float _573 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2149, float2(0.0), isnan(_2149))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2149, float2(0.0), isnan(_2149))).x;
    float _575 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].x, _563);
    float _577 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[35].z, _575);
    float _579 = -_577;
    float _581 = fma(_579, _577, 1.0);
    float _583 = -_577;
    float _585 = fma(_583, (*spvDescriptorSet0.fp_c3)._m0[35].z, _269);
    float _587 = -_577;
    float _589 = fma(_587, (*spvDescriptorSet0.fp_c3)._m0[35].y, _267);
    float _591 = -_577;
    float _593 = fma(_591, (*spvDescriptorSet0.fp_c3)._m0[35].x, _265);
    float _595 = _581 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _597 = abs(_155);
    float _599 = log2(_597);
    float _601 = fma(_585, _595, _155);
    float _603 = fma(_589, _595, _157);
    float _605 = fma(_593, _595, _159);
    float _607 = -_601;
    bool _609 = _607 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _611 = float(_609);
    float _613 = -_601;
    bool _615 = _613 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _617 = float(_615);
    float _619 = _611 + _617;
    float _621 = precise::min(_619, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _623 = trunc(_621);
    int _625 = int(_623);
    int _627 = _625 << 6;
    float _629 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    bool _631 = _625 != 0;
    uint _634 = uint(int(uint(_627) >> uint(2)));
    uint _636 = uint(int(uint(int(_634)) >> uint(2)));
    int _638 = int(_634) & 3;
    float _640 = (*spvDescriptorSet0.fp_c3)._m0[int(_636)][_638];
    int _642 = int(_634) + 1;
    uint _644 = uint(int(uint(_642) >> uint(2)));
    int _646 = _642 & 3;
    float _648 = (*spvDescriptorSet0.fp_c3)._m0[int(_644)][_646];
    float _650 = floor(_629);
    float _652 = precise::min(_155, -1.0000000116860974230803549289703e-07);
    int _654 = _627 + 16;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.fp_c3)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.fp_c3)._m0[int(_666)][_668];
    int _672 = _627 + 32;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.fp_c3)._m0[int(_676)][_678];
    int _682 = int(_674) + 1;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    int _686 = _682 & 3;
    float _688 = (*spvDescriptorSet0.fp_c3)._m0[int(_684)][_686];
    float _690 = -_650;
    float _692 = _629 + _690;
    int _694 = _627 + 48;
    uint _696 = uint(int(uint(_694) >> uint(2)));
    uint _698 = uint(int(uint(int(_696)) >> uint(2)));
    int _700 = int(_696) & 3;
    float _702 = (*spvDescriptorSet0.fp_c3)._m0[int(_698)][_700];
    int _704 = int(_696) + 1;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    int _708 = _704 & 3;
    float _710 = (*spvDescriptorSet0.fp_c3)._m0[int(_706)][_708];
    float _712 = _603 * _648;
    float _714 = _599 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _716 = fma(_605, _640, _712);
    int _718 = _627 + 8;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    uint _722 = uint(int(uint(int(_720)) >> uint(2)));
    int _724 = int(_720) & 3;
    float _726 = (*spvDescriptorSet0.fp_c3)._m0[int(_722)][_724];
    int _728 = int(_720) + 1;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    int _732 = _728 & 3;
    float _734 = (*spvDescriptorSet0.fp_c3)._m0[int(_730)][_732];
    float _736 = exp2(_714);
    float _738 = _603 * _670;
    float _740 = _603 * _688;
    float _742 = fma(_605, _662, _738);
    float _744 = _603 * _710;
    float _746 = fma(_605, _680, _740);
    float _748 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    int _750 = _627 + 24;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.fp_c3)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.fp_c3)._m0[int(_762)][_764];
    float _768 = fma(_605, _702, _744);
    float _770 = floor(_748);
    float _772 = fma(_736, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _774 = precise::clamp(_772, 0.0, 1.0);
    float _776 = fma(_774, -2.0, 3.0);
    float _778 = _774 * _774;
    float _780 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _782 = _692 + _780;
    float _784 = _778 * _776;
    float _786 = -_770;
    float _788 = _748 + _786;
    float _790 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _792 = -_782;
    float _794 = _792 + 1.0;
    float _796 = -_784;
    float _798 = _796 + 1.0;
    float _800 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _802 = _788 + _800;
    float _804 = precise::max(0.0, _790);
    float _806 = fma(_798, (*spvDescriptorSet0.fp_c3)._m0[44].w, _784);
    float _808 = fma(_601, _726, _716);
    float _810 = -_802;
    float _812 = _810 + 1.0;
    float _814 = _802 * _782;
    float _816 = _806 * _804;
    float _818 = _808 + _734;
    float _820 = _802 * _794;
    float _822 = 1.0 / _652;
    float _824 = _782 * _812;
    float _826 = _812 * _794;
    int _828 = _627 + 40;
    uint _830 = uint(int(uint(_828) >> uint(2)));
    uint _832 = uint(int(uint(int(_830)) >> uint(2)));
    int _834 = int(_830) & 3;
    float _836 = (*spvDescriptorSet0.fp_c3)._m0[int(_832)][_834];
    int _838 = int(_830) + 1;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    int _842 = _838 & 3;
    float _844 = (*spvDescriptorSet0.fp_c3)._m0[int(_840)][_842];
    int _846 = _627 + 56;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.fp_c3)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.fp_c3)._m0[int(_858)][_860];
    float _864 = fma(_601, _758, _742);
    float _866 = _822 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _868 = _864 + _766;
    float _870 = -_545;
    float _872 = fma(_870, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _874 = -_547;
    float _876 = fma(_874, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _878 = -_549;
    float _880 = fma(_878, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _882 = -_551;
    float _884 = fma(_882, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _886 = 1.0 / _876;
    float _888 = 1.0 / _872;
    float _890 = 1.0 / _880;
    float _892 = 1.0 / _884;
    float _894 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _896 = -_155;
    float _898 = fma(_888, _894, _896);
    float _900 = fma(_601, _836, _746);
    float _902 = abs(_898);
    float _904 = _902 * _866;
    float _906 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _908 = -_155;
    float _910 = fma(_886, _906, _908);
    float _912 = _900 + _844;
    float _914 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _916 = -_155;
    float _918 = fma(_890, _914, _916);
    float _920 = exp2(_904);
    float _922 = abs(_910);
    float _924 = _922 * _866;
    float _926 = fma(_601, _854, _768);
    float _928 = abs(_918);
    float _930 = _928 * _866;
    float _932 = _926 + _862;
    float _934 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _936 = -_155;
    float _938 = fma(_892, _934, _936);
    float _940 = exp2(_924);
    float _942 = abs(_938);
    float _944 = _942 * _866;
    float _946 = exp2(_930);
    float _948 = abs(_824);
    float _950 = _948 * _920;
    float _952 = exp2(_944);
    float _954 = abs(_814);
    float _956 = _954 * _940;
    float _958 = _950 + _956;
    float _960 = abs(_820);
    float _962 = _960 * _946;
    float _964 = 1.0 / _932;
    float _966 = _962 + _958;
    float _968 = abs(_826);
    float _970 = _968 * _952;
    float _972 = _970 + _966;
    float _974 = -_970;
    bool _976 = _966 != _974;
    bool _978 = isnan(_966);
    bool _980 = _976 || _978;
    bool _982 = isnan(_974);
    bool _984 = _980 || _982;
    float _986 = _818 * _964;
    float _988 = 1.0 / _972;
    float _990 = _912 * _964;
    float _992 = precise::clamp(_990, 0.0, 1.0);
    float _994 = _956 * _988;
    float _996 = _950 * _988;
    bool _998 = _155 >= (-8000.0);
    bool _1000 = isnan(_155);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(-8000.0);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _962 * _988;
    float _1012 = _970 * _988;
    float _1014 = _984 ? _994 : 0.25;
    float _1016 = _984 ? _996 : 0.25;
    float _1018 = _1008 * _816;
    float _1020 = abs(_569);
    float _1022 = _1020 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1024 = _1014 * _557;
    float _1026 = _984 ? _1010 : 0.25;
    float _1028 = _1018 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1030 = -_571;
    float _1032 = _1030 + 1.0;
    float _1034 = fma(_1016, _555, _1024);
    float _1036 = -_1022;
    float _1038 = fma(_1008, _1036, 1.0);
    float _1040 = _868 * _964;
    float _1042 = _1032 * _1028;
    float _1044 = precise::clamp(_1042, 0.0, 1.0);
    float _1046 = fma(_1026, _559, _1034);
    float _1048 = _984 ? _1012 : 0.25;
    float _1050 = -_1044;
    float _1052 = fma(_1050, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1054 = fma(_1048, _561, _1046);
    float _1056 = precise::min(_1038, 1.0);
    float _1058 = precise::min(_1056, _1052);
    float _1060 = precise::min(_1054, 1.0);
    float _1116;
    if (!_631)
    {
        float _1062 = rint(_621);
        float _1064 = precise::max(_1062, 0.0);
        uint _1066 = uint(_1064);
        uint _1068 = clamp(_1066, 0u, 65535u);
        float _1070 = _992 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1072 = fma(_1070, 0.5, _1040);
        float _1074 = fma(_1070, 0.5, _986);
        float _1076 = fma(_1070, -0.5, _986);
        float _1078 = fma(_1070, -0.5, _1040);
        float3 _2937 = float3(_986, _1072, float(int(_1068)));
        float3 _2941 = select(_2937, float3(0.0), isnan(_2937));
        float _1080 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2941.xy, uint(rint(_2941.z)), _992);
        float3 _2950 = float3(_1074, _1072, float(int(_1068)));
        float3 _2952 = select(_2950, float3(0.0), isnan(_2950));
        float _1082 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2952.xy, uint(rint(_2952.z)), _992);
        float3 _2961 = float3(_1076, _1072, float(int(_1068)));
        float3 _2963 = select(_2961, float3(0.0), isnan(_2961));
        float _1084 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2963.xy, uint(rint(_2963.z)), _992);
        float3 _2972 = float3(_1074, _1040, float(int(_1068)));
        float3 _2974 = select(_2972, float3(0.0), isnan(_2972));
        float _1086 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2974.xy, uint(rint(_2974.z)), _992);
        float3 _2983 = float3(_986, _1040, float(int(_1068)));
        float3 _2985 = select(_2983, float3(0.0), isnan(_2983));
        float _1088 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2985.xy, uint(rint(_2985.z)), _992);
        float3 _2994 = float3(_1076, _1040, float(int(_1068)));
        float3 _2996 = select(_2994, float3(0.0), isnan(_2994));
        float _1090 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2996.xy, uint(rint(_2996.z)), _992);
        float3 _3005 = float3(_1074, _1078, float(int(_1068)));
        float3 _3007 = select(_3005, float3(0.0), isnan(_3005));
        float _1092 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3007.xy, uint(rint(_3007.z)), _992);
        float3 _3016 = float3(_986, _1078, float(int(_1068)));
        float3 _3018 = select(_3016, float3(0.0), isnan(_3016));
        float _1094 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3018.xy, uint(rint(_3018.z)), _992);
        float3 _3027 = float3(_1076, _1078, float(int(_1068)));
        float3 _3029 = select(_3027, float3(0.0), isnan(_3027));
        float _1096 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3029.xy, uint(rint(_3029.z)), _992);
        float _1098 = _1082 + _1080;
        float _1100 = _1098 + _1084;
        float _1102 = _1100 + _1086;
        float _1104 = _1102 + _1088;
        float _1106 = _1104 + _1090;
        float _1108 = _1106 + _1092;
        float _1110 = _1108 + _1094;
        float _1112 = _1110 + _1096;
        float _1114 = _1112 * 0.111111111938953399658203125;
        _1116 = _1114;
        _1118 = true;
    }
    else
    {
        float _1120 = rint(_621);
        float _1122 = precise::max(_1120, 0.0);
        uint _1124 = uint(_1122);
        uint _1126 = clamp(_1124, 0u, 65535u);
        float3 _3076 = float3(_986, _1040, float(int(_1126)));
        float3 _3078 = select(_3076, float3(0.0), isnan(_3076));
        float _1128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3078.xy, uint(rint(_3078.z)), _992);
        _1116 = _1128;
    }
    _1118 = false;
    float _1130 = _1116;
    float _1132 = _534 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1134 = _534 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1136 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1132);
    float _1138 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1134);
    float _1140 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1136);
    float _1142 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1138);
    float _1144 = _1140 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1146 = _1142 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1148 = -_155;
    float _1150 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1152 = _1148 + _1150;
    float _1154 = trunc(_1144);
    int _1156 = int(_1154);
    float _1158 = trunc(_1146);
    int _1160 = int(_1158);
    int _1162 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1164 = _1156 + _1162;
    int _1166 = _1164 + 1;
    bool _1168 = _1166 >= 0;
    int _1170 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1172 = _1160 + _1170;
    int _1174 = _1172 + 1;
    float _1176 = -_155;
    float _1178 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1180 = _1176 + _1178;
    bool _1182 = _1166 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1184 = !_1168;
    bool _1186 = _1182 || _1184;
    bool _1188 = _1174 < 0;
    bool _1190 = _1188 || _1186;
    bool _1192 = _1174 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1194 = _1192 || _1190;
    float _1196 = as_type<float>(_1156);
    if (_1194)
    {
        _1196 = 1.0;
    }
    float _1198 = _1196;
    float _1200 = _1198;
    if (!_1194)
    {
        int _1202 = _1174 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1204 = _1202 + _1166;
        float _1206 = floor(_1146);
        int _1208 = _1204 << 2;
        int _1210 = _1204 >> 2;
        int _1212 = 12 & _1208;
        float _1214 = floor(_1144);
        int _1216 = _1210 << 4;
        int _1218 = _1216 + _1212;
        uint _1220 = uint(int(uint(_1218) >> uint(2)));
        uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
        int _1224 = int(_1220) & 3;
        float _1226 = (*spvDescriptorSet0.fp_c5)._m0[int(_1222)][_1224];
        float _1228 = -_1206;
        float _1230 = _1146 + _1228;
        float _1232 = -_1214;
        float _1234 = _1144 + _1232;
        float _1236 = rint(_1226);
        float _1238 = precise::max(_1236, 0.0);
        uint _1240 = uint(_1238);
        uint _1242 = clamp(_1240, 0u, 65535u);
        float3 _3265 = float3(_1234, _1230, float(int(_1242)));
        float3 _3267 = select(_3265, float3(0.0), isnan(_3265));
        float _1244 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3267.xy, uint(rint(_3267.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3267.xy, uint(rint(_3267.z)), level(0.0)).x;
        int _1246 = _1204 << 4;
        int _1248 = _1246 + 1648;
        int _1250 = _1218 + 8048;
        uint _1252 = uint(int(uint(_1250) >> uint(2)));
        uint _1254 = uint(int(uint(int(_1252)) >> uint(2)));
        int _1256 = int(_1252) & 3;
        float _1258 = (*spvDescriptorSet0.fp_c5)._m0[int(_1254)][_1256];
        uint _1260 = uint(int(uint(_1248) >> uint(2)));
        uint _1262 = uint(int(uint(int(_1260)) >> uint(2)));
        int _1264 = int(_1260) & 3;
        float _1266 = (*spvDescriptorSet0.fp_c5)._m0[int(_1262)][_1264];
        int _1268 = int(_1260) + 1;
        uint _1270 = uint(int(uint(_1268) >> uint(2)));
        int _1272 = _1268 & 3;
        float _1274 = (*spvDescriptorSet0.fp_c5)._m0[int(_1270)][_1272];
        int _1276 = _1248 + 8;
        uint _1278 = uint(int(uint(_1276) >> uint(2)));
        uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
        int _1282 = int(_1278) & 3;
        float _1284 = (*spvDescriptorSet0.fp_c5)._m0[int(_1280)][_1282];
        int _1286 = int(_1278) + 1;
        uint _1288 = uint(int(uint(_1286) >> uint(2)));
        int _1290 = _1286 & 3;
        float _1292 = (*spvDescriptorSet0.fp_c5)._m0[int(_1288)][_1290];
        float _1294 = _1258 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1296 = _534 * _1274;
        float _1298 = 1.0 / _1258;
        float _1300 = fma(_530, _1266, _1296);
        float _1302 = fma(_532, _1284, _1300);
        float _1304 = _1302 + _1292;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        float _1308 = -_1306;
        float _1310 = _1308 + _1244;
        float _1312 = fma(_1298, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1310);
        float _1314 = _1294 * _1312;
        float _1316 = exp2(_1314);
        float _1318 = 0.0 + _1316;
        float _1320 = precise::clamp(_1318, 0.0, 1.0);
        _1200 = _1320;
    }
    float _1322 = _1200;
    float _1324 = precise::min(_1322, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1326 = _1180 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1328 = precise::clamp(_1326, 0.0, 1.0);
    float _1330 = _1152 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1332 = precise::clamp(_1330, 0.0, 1.0);
    float _1334 = -_1130;
    float _1336 = _1334 + 1.0;
    float _1338 = -_1324;
    float _1340 = _1338 + 1.0;
    float _1342 = fma(_1328, _1336, _1130);
    float _1344 = fma(_1332, _1340, _1324);
    out.m_64.x = _1342;
    out.m_64.y = _1344;
    out.m_64.z = _1060;
    out.m_64.w = _1058;
    out.m_66.x = _573;
    out.m_66.y = 0.5;
    out.m_66.z = 0.5;
    out.m_66.w = 1.0;
    return out;
}

