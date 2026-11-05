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
    bool _1078 = false;
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
    float2 _1347 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1347, float2(0.0), isnan(_1347))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1347, float2(0.0), isnan(_1347))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1362 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1362, float2(0.0), isnan(_1362))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1362, float2(0.0), isnan(_1362))).x;
    float2 _1370 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1370, float2(0.0), isnan(_1370))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1370, float2(0.0), isnan(_1370))).x;
    float _99 = in.m_53.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_53.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_55.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_55.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_57.x;
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
    float _185 = fma(_171, _141, _183);
    float _187 = -_153;
    float _189 = fma(_171, _139, _187);
    float _191 = -_151;
    float _193 = _191 + _171;
    float _195 = _173 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _199 = _175 + _197;
    float _201 = -_155;
    float _203 = fma(_181, _143, _201);
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
    float _243 = fma(_233, _233, _237);
    float _245 = _153 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _247 = fma(_241, _241, _243);
    float _249 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[31].x, _245);
    float _251 = rsqrt(_247);
    float _253 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].z, _249);
    bool _257 = _235 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _259 = _253 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _261 = _233 * _251;
    float _263 = _227 * _251;
    float _265 = _241 * _251;
    float _267 = _251;
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
    float2 _2038 = float2(_85, _87);
    float2 _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2038, float2(0.0), isnan(_2038))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2038, float2(0.0), isnan(_2038))).xy;
    float _540 = _538.x;
    float _542 = _538.y;
    float _544 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _546 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float2 _2059 = float2(_544, _546);
    float4 _549 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2059, float2(0.0), isnan(_2059)), int2(0), component::x).xyzw;
    float _551 = _549.x;
    float _553 = _549.y;
    float _555 = _549.z;
    float _557 = _549.w;
    float2 _2075 = float2(_544, _546);
    float4 _559 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2075, float2(0.0), isnan(_2075)), int2(0), component::x).xyzw;
    float _561 = _559.x;
    float _563 = _559.y;
    float _565 = _559.z;
    float _567 = _559.w;
    float2 _2091 = float2(_544, _546);
    float4 _569 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2091, float2(0.0), isnan(_2091)), int2(0), component::w).xyzw;
    float _571 = _569.x;
    float _573 = _569.y;
    float _575 = _569.z;
    float _577 = _569.w;
    float _579 = _263 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _581 = fma(_540, 2.0, -1.0);
    float _583 = fma(_542, 2.0, -1.0);
    float _585 = _581 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _587 = _583 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _589 = fma(_585, 2.0, _85);
    float _591 = fma(_587, 2.0, _87);
    float2 _2132 = float2(_589, _591);
    float2 _593 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2132, float2(0.0), isnan(_2132))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2132, float2(0.0), isnan(_2132))).yz;
    float _595 = _593.x;
    float _597 = _593.y;
    float _599 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].x, _579);
    float _601 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _603 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].z, _599);
    float _605 = -_603;
    float _607 = fma(_605, _603, 1.0);
    float _609 = -_603;
    float _611 = fma(_609, (*spvDescriptorSet0.fp_c3)._m0[35].z, _265);
    float _613 = -_603;
    float _615 = fma(_613, (*spvDescriptorSet0.fp_c3)._m0[35].x, _261);
    float _617 = -_603;
    float _619 = fma(_617, (*spvDescriptorSet0.fp_c3)._m0[35].y, _263);
    float _621 = _607 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _623 = fma(_611, _621, _151);
    float _625 = fma(_615, _621, _155);
    float _627 = fma(_619, _621, _153);
    float _629 = -_623;
    bool _631 = _629 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _633 = float(_631);
    float _635 = -_623;
    bool _637 = _635 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _639 = float(_637);
    float _641 = _633 + _639;
    float _643 = precise::min(_641, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _645 = trunc(_643);
    int _647 = int(_645);
    int _649 = _647 << 6;
    bool _651 = _647 != 0;
    int _653 = _649 + 32;
    uint _656 = uint(int(uint(_653) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.fp_c3)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.fp_c3)._m0[int(_666)][_668];
    float _672 = precise::min(_151, -1.0000000116860974230803549289703e-07);
    int _674 = _649 + 48;
    uint _676 = uint(int(uint(_674) >> uint(2)));
    uint _678 = uint(int(uint(int(_676)) >> uint(2)));
    int _680 = int(_676) & 3;
    float _682 = (*spvDescriptorSet0.fp_c3)._m0[int(_678)][_680];
    int _684 = int(_676) + 1;
    uint _686 = uint(int(uint(_684) >> uint(2)));
    int _688 = _684 & 3;
    float _690 = (*spvDescriptorSet0.fp_c3)._m0[int(_686)][_688];
    uint _692 = uint(int(uint(_649) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.fp_c3)._m0[int(_694)][_696];
    int _700 = int(_692) + 1;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    int _704 = _700 & 3;
    float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
    int _708 = _649 + 16;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.fp_c3)._m0[int(_712)][_714];
    int _718 = int(_710) + 1;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    int _722 = _718 & 3;
    float _724 = (*spvDescriptorSet0.fp_c3)._m0[int(_720)][_722];
    float _726 = _627 * _670;
    float _728 = _627 * _690;
    float _730 = floor(_601);
    float _732 = _627 * _706;
    float _734 = fma(_625, _698, _732);
    int _736 = _649 + 8;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.fp_c3)._m0[int(_740)][_742];
    int _746 = int(_738) + 1;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    int _750 = _746 & 3;
    float _752 = (*spvDescriptorSet0.fp_c3)._m0[int(_748)][_750];
    float _754 = _627 * _724;
    float _756 = fma(_625, _662, _726);
    float _758 = fma(_625, _682, _728);
    float _760 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _762 = fma(_625, _716, _754);
    float _764 = -_730;
    float _766 = _601 + _764;
    int _768 = _649 + 24;
    uint _770 = uint(int(uint(_768) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.fp_c3)._m0[int(_772)][_774];
    int _778 = int(_770) + 1;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    int _782 = _778 & 3;
    float _784 = (*spvDescriptorSet0.fp_c3)._m0[int(_780)][_782];
    float _786 = floor(_760);
    float _788 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _790 = _766 + _788;
    float _792 = -_790;
    float _794 = _792 + 1.0;
    float _796 = -_786;
    float _798 = _760 + _796;
    float _800 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _802 = _798 + _800;
    float _804 = -_802;
    float _806 = _804 + 1.0;
    float _808 = _790 * _802;
    float _810 = _802 * _794;
    float _812 = _790 * _806;
    float _814 = _794 * _806;
    int _816 = _649 + 40;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.fp_c3)._m0[int(_820)][_822];
    int _826 = int(_818) + 1;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    int _830 = _826 & 3;
    float _832 = (*spvDescriptorSet0.fp_c3)._m0[int(_828)][_830];
    float _834 = fma(_623, _744, _734);
    float _836 = _834 + _752;
    float _838 = 1.0 / _672;
    float _840 = fma(_623, _776, _762);
    float _842 = _840 + _784;
    float _844 = -_551;
    float _846 = fma(_844, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _848 = -_553;
    float _850 = fma(_848, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _852 = -_555;
    float _854 = fma(_852, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _856 = -_557;
    float _858 = fma(_856, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _860 = 1.0 / _850;
    float _862 = _838 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _864 = 1.0 / _846;
    float _866 = 1.0 / _854;
    float _868 = fma(_623, _824, _756);
    float _870 = 1.0 / _858;
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _874 = -_151;
    float _876 = fma(_864, _872, _874);
    float _878 = _868 + _832;
    float _880 = abs(_876);
    float _882 = _880 * _862;
    float _884 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _886 = -_151;
    float _888 = fma(_860, _884, _886);
    float _890 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _892 = -_151;
    float _894 = fma(_866, _890, _892);
    float _896 = exp2(_882);
    float _898 = abs(_888);
    float _900 = _898 * _862;
    float _902 = abs(_894);
    float _904 = _902 * _862;
    int _906 = _649 + 56;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.fp_c3)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.fp_c3)._m0[int(_918)][_920];
    float _924 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _926 = -_151;
    float _928 = fma(_870, _924, _926);
    float _930 = exp2(_900);
    float _932 = abs(_928);
    float _934 = _932 * _862;
    float _936 = exp2(_904);
    float _938 = abs(_810);
    float _940 = _938 * _896;
    float _942 = exp2(_934);
    float _944 = abs(_808);
    float _946 = _944 * _930;
    float _948 = _940 + _946;
    float _950 = abs(_812);
    float _952 = _950 * _936;
    float _954 = _952 + _948;
    float _956 = abs(_814);
    float _958 = _956 * _942;
    float _960 = _958 + _954;
    float _962 = -_958;
    bool _964 = _954 != _962;
    bool _966 = isnan(_954);
    bool _968 = _964 || _966;
    bool _970 = isnan(_962);
    bool _972 = _968 || _970;
    float _974 = 1.0 / _960;
    float _976 = fma(_623, _914, _758);
    float _978 = _976 + _922;
    float _980 = 1.0 / _978;
    float _982 = _946 * _974;
    float _984 = _940 * _974;
    float _986 = _952 * _974;
    float _988 = _958 * _974;
    float _990 = _972 ? _982 : 0.25;
    float _992 = _972 ? _984 : 0.25;
    float _994 = _972 ? _986 : 0.25;
    float _996 = _990 * _563;
    float _998 = _990 * _573;
    float _1000 = _836 * _980;
    float _1002 = fma(_992, _561, _996);
    float _1004 = fma(_992, _571, _998);
    float _1006 = fma(_994, _565, _1002);
    float _1008 = _972 ? _988 : 0.25;
    float _1010 = fma(_994, _575, _1004);
    float _1012 = _842 * _980;
    float _1014 = _878 * _980;
    float _1016 = precise::clamp(_1014, 0.0, 1.0);
    float _1018 = fma(_1008, _567, _1006);
    float _1020 = fma(_1008, _577, _1010);
    float _1076;
    if (!_651)
    {
        float _1022 = rint(_643);
        float _1024 = precise::max(_1022, 0.0);
        uint _1026 = uint(_1024);
        uint _1028 = clamp(_1026, 0u, 65535u);
        float _1030 = _1016 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1032 = fma(_1030, 0.5, _1012);
        float _1034 = fma(_1030, 0.5, _1000);
        float _1036 = fma(_1030, -0.5, _1000);
        float _1038 = fma(_1030, -0.5, _1012);
        float3 _2837 = float3(_1000, _1032, float(int(_1028)));
        float3 _2841 = select(_2837, float3(0.0), isnan(_2837));
        float _1040 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2841.xy, uint(rint(_2841.z)), _1016);
        float3 _2850 = float3(_1034, _1032, float(int(_1028)));
        float3 _2852 = select(_2850, float3(0.0), isnan(_2850));
        float _1042 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2852.xy, uint(rint(_2852.z)), _1016);
        float3 _2861 = float3(_1036, _1032, float(int(_1028)));
        float3 _2863 = select(_2861, float3(0.0), isnan(_2861));
        float _1044 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2863.xy, uint(rint(_2863.z)), _1016);
        float3 _2872 = float3(_1034, _1012, float(int(_1028)));
        float3 _2874 = select(_2872, float3(0.0), isnan(_2872));
        float _1046 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2874.xy, uint(rint(_2874.z)), _1016);
        float3 _2883 = float3(_1000, _1012, float(int(_1028)));
        float3 _2885 = select(_2883, float3(0.0), isnan(_2883));
        float _1048 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2885.xy, uint(rint(_2885.z)), _1016);
        float3 _2894 = float3(_1036, _1012, float(int(_1028)));
        float3 _2896 = select(_2894, float3(0.0), isnan(_2894));
        float _1050 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2896.xy, uint(rint(_2896.z)), _1016);
        float3 _2905 = float3(_1034, _1038, float(int(_1028)));
        float3 _2907 = select(_2905, float3(0.0), isnan(_2905));
        float _1052 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2907.xy, uint(rint(_2907.z)), _1016);
        float3 _2916 = float3(_1000, _1038, float(int(_1028)));
        float3 _2918 = select(_2916, float3(0.0), isnan(_2916));
        float _1054 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2918.xy, uint(rint(_2918.z)), _1016);
        float3 _2927 = float3(_1036, _1038, float(int(_1028)));
        float3 _2929 = select(_2927, float3(0.0), isnan(_2927));
        float _1056 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2929.xy, uint(rint(_2929.z)), _1016);
        float _1058 = _1042 + _1040;
        float _1060 = _1058 + _1044;
        float _1062 = _1060 + _1046;
        float _1064 = _1062 + _1048;
        float _1066 = _1064 + _1050;
        float _1068 = _1066 + _1052;
        float _1070 = _1068 + _1054;
        float _1072 = _1070 + _1056;
        float _1074 = _1072 * 0.111111111938953399658203125;
        _1076 = _1074;
        _1078 = true;
    }
    else
    {
        float _1080 = rint(_643);
        float _1082 = precise::max(_1080, 0.0);
        uint _1084 = uint(_1082);
        uint _1086 = clamp(_1084, 0u, 65535u);
        float3 _2976 = float3(_1000, _1012, float(int(_1086)));
        float3 _2978 = select(_2976, float3(0.0), isnan(_2976));
        float _1088 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2978.xy, uint(rint(_2978.z)), _1016);
        _1076 = _1088;
    }
    _1078 = false;
    float _1090 = _1076;
    float _1092 = _530 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1094 = _530 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1096 = -_151;
    float _1098 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1100 = _1096 + _1098;
    float _1102 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1092);
    float _1104 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1094);
    float _1106 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1102);
    float _1108 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1104);
    float _1110 = _1106 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1112 = _1108 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1114 = trunc(_1110);
    int _1116 = int(_1114);
    float _1118 = trunc(_1112);
    int _1120 = int(_1118);
    int _1122 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1124 = _1116 + _1122;
    int _1126 = _1124 + 1;
    bool _1128 = _1126 >= 0;
    int _1130 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1132 = _1120 + _1130;
    int _1134 = _1132 + 1;
    float _1136 = -_151;
    float _1138 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1140 = _1136 + _1138;
    bool _1142 = _1126 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1144 = !_1128;
    bool _1146 = _1142 || _1144;
    bool _1148 = _1134 < 0;
    bool _1150 = _1148 || _1146;
    bool _1152 = _1134 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1154 = _1152 || _1150;
    float _1156 = as_type<float>(_1116);
    if (_1154)
    {
        _1156 = 1.0;
    }
    float _1158 = _1156;
    float _1160 = _1158;
    if (!_1154)
    {
        int _1162 = _1134 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1164 = _1162 + _1126;
        float _1166 = floor(_1112);
        int _1168 = _1164 << 2;
        int _1170 = _1164 >> 2;
        int _1172 = 12 & _1168;
        int _1174 = _1170 << 4;
        int _1176 = _1174 + _1172;
        float _1178 = floor(_1110);
        uint _1180 = uint(int(uint(_1176) >> uint(2)));
        uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
        int _1184 = int(_1180) & 3;
        float _1186 = (*spvDescriptorSet0.fp_c5)._m0[int(_1182)][_1184];
        float _1188 = -_1166;
        float _1190 = _1112 + _1188;
        float _1192 = -_1178;
        float _1194 = _1110 + _1192;
        float _1196 = rint(_1186);
        float _1198 = precise::max(_1196, 0.0);
        uint _1200 = uint(_1198);
        uint _1202 = clamp(_1200, 0u, 65535u);
        float3 _3165 = float3(_1194, _1190, float(int(_1202)));
        float3 _3167 = select(_3165, float3(0.0), isnan(_3165));
        float _1204 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3167.xy, uint(rint(_3167.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3167.xy, uint(rint(_3167.z)), level(0.0)).x;
        int _1206 = _1164 << 4;
        int _1208 = _1206 + 1648;
        int _1210 = _1176 + 8048;
        uint _1212 = uint(int(uint(_1210) >> uint(2)));
        uint _1214 = uint(int(uint(int(_1212)) >> uint(2)));
        int _1216 = int(_1212) & 3;
        float _1218 = (*spvDescriptorSet0.fp_c5)._m0[int(_1214)][_1216];
        uint _1220 = uint(int(uint(_1208) >> uint(2)));
        uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
        int _1224 = int(_1220) & 3;
        float _1226 = (*spvDescriptorSet0.fp_c5)._m0[int(_1222)][_1224];
        int _1228 = int(_1220) + 1;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        int _1232 = _1228 & 3;
        float _1234 = (*spvDescriptorSet0.fp_c5)._m0[int(_1230)][_1232];
        int _1236 = _1208 + 8;
        uint _1238 = uint(int(uint(_1236) >> uint(2)));
        uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
        int _1242 = int(_1238) & 3;
        float _1244 = (*spvDescriptorSet0.fp_c5)._m0[int(_1240)][_1242];
        int _1246 = int(_1238) + 1;
        uint _1248 = uint(int(uint(_1246) >> uint(2)));
        int _1250 = _1246 & 3;
        float _1252 = (*spvDescriptorSet0.fp_c5)._m0[int(_1248)][_1250];
        float _1254 = _1218 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1256 = _530 * _1234;
        float _1258 = fma(_532, _1226, _1256);
        float _1260 = 1.0 / _1218;
        float _1262 = fma(_534, _1244, _1258);
        float _1264 = _1262 + _1252;
        float _1266 = precise::clamp(_1264, 0.0, 1.0);
        float _1268 = -_1266;
        float _1270 = _1268 + _1204;
        float _1272 = fma(_1260, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1270);
        float _1274 = _1254 * _1272;
        float _1276 = exp2(_1274);
        float _1278 = 0.0 + _1276;
        float _1280 = precise::clamp(_1278, 0.0, 1.0);
        _1160 = _1280;
    }
    float _1282 = _1160;
    float _1284 = precise::min(_1282, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1286 = -_1090;
    float _1288 = _1286 + 1.0;
    float _1290 = _1140 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1292 = precise::clamp(_1290, 0.0, 1.0);
    float _1294 = _1100 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1296 = precise::clamp(_1294, 0.0, 1.0);
    float _1298 = precise::min(_1020, 1.0);
    float _1300 = -_1284;
    float _1302 = _1300 + 1.0;
    float _1304 = fma(_1292, _1288, _1090);
    float _1306 = fma(_1296, _1302, _1284);
    float _1308 = precise::min(_1018, 1.0);
    out.m_60.x = _1304;
    out.m_60.y = _1306;
    out.m_60.z = _1298;
    out.m_60.w = 1.0;
    out.m_62.x = _1308;
    out.m_62.y = _595;
    out.m_62.z = _597;
    out.m_62.w = 1.0;
    return out;
}

