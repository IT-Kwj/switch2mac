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
    bool _1064 = false;
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
    float2 _1333 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1333, float2(0.0), isnan(_1333))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1333, float2(0.0), isnan(_1333))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1348 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1348, float2(0.0), isnan(_1348))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1348, float2(0.0), isnan(_1348))).x;
    float2 _1356 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1356, float2(0.0), isnan(_1356))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1356, float2(0.0), isnan(_1356))).x;
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
    float _229 = -_221;
    float _231 = fma(_193, _207, _229);
    float _233 = _185 * _207;
    float _235 = sqrt(_223);
    float _237 = _227 * _227;
    float _239 = -_233;
    float _241 = fma(_189, _203, _239);
    float _243 = _153 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _245 = fma(_231, _231, _237);
    float _247 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[31].x, _243);
    float _249 = fma(_241, _241, _245);
    float _251 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].z, _247);
    float _253 = rsqrt(_249);
    bool _257 = _235 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _259 = _251 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _261 = _231 * _253;
    float _263 = _227 * _253;
    float _265 = _241 * _253;
    float _267 = _207;
    float _269 = _259;
    float _271 = _175;
    if (!_257)
    {
        _267 = _195;
    }
    float _273 = _267;
    bool _275 = !_257;
    float _277 = _273;
    if (!_275)
    {
        float _279 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _281 = _235 + _279;
        float _283 = _259 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _285 = rsqrt(_223);
        float _287 = -_259;
        float _289 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = _287 + _289;
        float _293 = abs(_283);
        float _295 = abs(_281);
        float _297 = precise::max(_293, _295);
        float _299 = _291 * _291;
        bool _301 = _297 >= 16.0;
        float _303 = _215 * _285;
        float _305 = _199 * _285;
        float _307 = -_215;
        float _309 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[41].z, _307);
        float _311 = -_199;
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
        _269 = _524;
        _277 = _526;
        _271 = _528;
    }
    float _530 = _269;
    float _532 = _277;
    float _534 = _271;
    float2 _2024 = float2(_85, _87);
    float2 _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2024, float2(0.0), isnan(_2024))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2024, float2(0.0), isnan(_2024))).xy;
    float _540 = _538.x;
    float _542 = _538.y;
    float _544 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _546 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float2 _2045 = float2(_544, _546);
    float4 _549 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2045, float2(0.0), isnan(_2045)), int2(0), component::x).xyzw;
    float _551 = _549.x;
    float _553 = _549.y;
    float _555 = _549.z;
    float _557 = _549.w;
    float2 _2061 = float2(_544, _546);
    float4 _559 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2061, float2(0.0), isnan(_2061)), int2(0), component::w).xyzw;
    float _561 = _559.x;
    float _563 = _559.y;
    float _565 = _559.z;
    float _567 = _559.w;
    float _569 = fma(_540, 2.0, -1.0);
    float _571 = fma(_542, 2.0, -1.0);
    float _573 = _569 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _575 = _571 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _577 = fma(_573, 2.0, _85);
    float _579 = fma(_575, 2.0, _87);
    float2 _2097 = float2(_577, _579);
    float3 _583 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2097, float2(0.0), isnan(_2097))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2097, float2(0.0), isnan(_2097))).xyz;
    float _585 = _583.x;
    float _587 = _583.y;
    float _589 = _583.z;
    float _591 = _263 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _593 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _595 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _597 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].x, _591);
    float _599 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].z, _597);
    float _601 = -_599;
    float _603 = fma(_601, _599, 1.0);
    float _605 = -_599;
    float _607 = fma(_605, (*spvDescriptorSet0.fp_c3)._m0[35].z, _265);
    float _609 = -_599;
    float _611 = fma(_609, (*spvDescriptorSet0.fp_c3)._m0[35].y, _263);
    float _613 = -_599;
    float _615 = fma(_613, (*spvDescriptorSet0.fp_c3)._m0[35].x, _261);
    float _617 = _603 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _619 = fma(_607, _617, _151);
    float _621 = fma(_611, _617, _153);
    float _623 = fma(_615, _617, _155);
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
    float _814 = -_551;
    float _816 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _818 = -_553;
    float _820 = fma(_818, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _822 = _621 * _754;
    float _824 = -_792;
    float _826 = _824 + 1.0;
    float _828 = 1.0 / _816;
    float _830 = -_555;
    float _832 = fma(_830, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _834 = fma(_623, _746, _822);
    float _836 = precise::min(_151, -1.0000000116860974230803549289703e-07);
    float _838 = -_786;
    float _840 = _838 + 1.0;
    float _842 = _786 * _792;
    float _844 = _786 * _826;
    float _846 = -_557;
    float _848 = fma(_846, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _850 = 1.0 / _836;
    float _852 = _792 * _840;
    float _854 = _840 * _826;
    float _856 = 1.0 / _820;
    float _858 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _860 = -_151;
    float _862 = fma(_828, _858, _860);
    float _864 = 1.0 / _832;
    float _866 = _850 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _868 = abs(_862);
    float _870 = _868 * _866;
    float _872 = 1.0 / _848;
    float _874 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _876 = -_151;
    float _878 = fma(_856, _874, _876);
    float _880 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _882 = -_151;
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
    float _920 = -_151;
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
    float _990 = _984 * _563;
    float _992 = _966 ? _980 : 0.25;
    float _994 = _778 * _974;
    float _996 = _912 * _974;
    float _998 = precise::clamp(_996, 0.0, 1.0);
    float _1000 = fma(_986, _561, _990);
    float _1002 = fma(_992, _565, _1000);
    float _1004 = _812 * _974;
    float _1006 = fma(_988, _567, _1002);
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
        float3 _2793 = float3(_994, _1018, float(int(_1014)));
        float3 _2797 = select(_2793, float3(0.0), isnan(_2793));
        float _1026 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2797.xy, uint(rint(_2797.z)), _998);
        float3 _2806 = float3(_1020, _1018, float(int(_1014)));
        float3 _2808 = select(_2806, float3(0.0), isnan(_2806));
        float _1028 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2808.xy, uint(rint(_2808.z)), _998);
        float3 _2817 = float3(_1022, _1018, float(int(_1014)));
        float3 _2819 = select(_2817, float3(0.0), isnan(_2817));
        float _1030 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2819.xy, uint(rint(_2819.z)), _998);
        float3 _2828 = float3(_1020, _1004, float(int(_1014)));
        float3 _2830 = select(_2828, float3(0.0), isnan(_2828));
        float _1032 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2830.xy, uint(rint(_2830.z)), _998);
        float3 _2839 = float3(_994, _1004, float(int(_1014)));
        float3 _2841 = select(_2839, float3(0.0), isnan(_2839));
        float _1034 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2841.xy, uint(rint(_2841.z)), _998);
        float3 _2850 = float3(_1022, _1004, float(int(_1014)));
        float3 _2852 = select(_2850, float3(0.0), isnan(_2850));
        float _1036 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2852.xy, uint(rint(_2852.z)), _998);
        float3 _2861 = float3(_1020, _1024, float(int(_1014)));
        float3 _2863 = select(_2861, float3(0.0), isnan(_2861));
        float _1038 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2863.xy, uint(rint(_2863.z)), _998);
        float3 _2872 = float3(_994, _1024, float(int(_1014)));
        float3 _2874 = select(_2872, float3(0.0), isnan(_2872));
        float _1040 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2874.xy, uint(rint(_2874.z)), _998);
        float3 _2883 = float3(_1022, _1024, float(int(_1014)));
        float3 _2885 = select(_2883, float3(0.0), isnan(_2883));
        float _1042 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2885.xy, uint(rint(_2885.z)), _998);
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
        float3 _2932 = float3(_994, _1004, float(int(_1072)));
        float3 _2934 = select(_2932, float3(0.0), isnan(_2932));
        float _1074 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2934.xy, uint(rint(_2934.z)), _998);
        _1062 = _1074;
    }
    _1064 = false;
    float _1076 = _1062;
    float _1078 = _530 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1080 = _530 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1082 = -_151;
    float _1084 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1086 = _1082 + _1084;
    float _1088 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1078);
    float _1090 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1080);
    float _1092 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1088);
    float _1094 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1090);
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
    float _1122 = -_151;
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
        float3 _3121 = float3(_1180, _1176, float(int(_1188)));
        float3 _3123 = select(_3121, float3(0.0), isnan(_3121));
        float _1190 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3123.xy, uint(rint(_3123.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3123.xy, uint(rint(_3123.z)), level(0.0)).x;
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
        float _1242 = _530 * _1220;
        float _1244 = fma(_532, _1212, _1242);
        float _1246 = 1.0 / _1204;
        float _1248 = fma(_534, _1230, _1244);
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
    float _1272 = _1126 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = -_1076;
    float _1278 = _1276 + 1.0;
    float _1280 = _1086 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = precise::min(_1006, 1.0);
    float _1286 = -_1270;
    float _1288 = _1286 + 1.0;
    float _1290 = fma(_1274, _1278, _1076);
    float _1292 = precise::min(_585, 1.0);
    float _1294 = fma(_1282, _1288, _1270);
    out.m_60.x = _1290;
    out.m_60.y = _1294;
    out.m_60.z = _1284;
    out.m_60.w = 1.0;
    out.m_62.x = _1292;
    out.m_62.y = _587;
    out.m_62.z = _589;
    out.m_62.w = 1.0;
    return out;
}

