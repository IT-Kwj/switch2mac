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
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
    float4 m_58 [[color(1)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1044 = false;
    float _65 = gl_FragCoord.w;
    float _67 = in.m_47.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_47.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = _79 * _71;
    float _83 = _79 * _77;
    float _85 = _81 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1314 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1314, float2(0.0), isnan(_1314))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1314, float2(0.0), isnan(_1314))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1329 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1329, float2(0.0), isnan(_1329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1329, float2(0.0), isnan(_1329))).x;
    float2 _1337 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1337, float2(0.0), isnan(_1337))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1337, float2(0.0), isnan(_1337))).x;
    float _95 = in.m_49.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_49.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_51.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_51.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_53.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_53.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _79 * _99;
    float _133 = _79 * _105;
    float _135 = _79 * _111;
    float _137 = _79 * _117;
    float _139 = _79 * _123;
    float _141 = _79 * _129;
    float _143 = -_87;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _147 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].x, _145);
    float _149 = _147 * _131;
    float _151 = _147 * _133;
    float _153 = _149 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _155 = _149 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _157 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].x, _153);
    float _159 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].x, _155);
    float _161 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[32].z, _157);
    float _163 = -_91;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _167 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[41].x, _165);
    float _169 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[30].z, _159);
    float _171 = _161 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _173 = -_93;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[41].x, _175);
    float _179 = -_151;
    float _181 = fma(_167, _137, _179);
    float _183 = -_149;
    float _185 = fma(_167, _135, _183);
    float _187 = -_147;
    float _189 = _187 + _167;
    float _191 = _169 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _195 = _171 + _193;
    float _197 = -_151;
    float _199 = fma(_177, _139, _197);
    float _201 = -_149;
    float _203 = fma(_177, _141, _201);
    float _205 = -_147;
    float _207 = _205 + _177;
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _211 = _191 + _209;
    float _213 = _195 * _195;
    float _215 = _189 * _199;
    float _217 = _185 * _207;
    float _219 = fma(_211, _211, _213);
    float _221 = -_215;
    float _223 = fma(_181, _207, _221);
    float _225 = _181 * _203;
    float _227 = -_217;
    float _229 = fma(_189, _203, _227);
    float _231 = sqrt(_219);
    float _233 = _223 * _223;
    float _235 = -_225;
    float _237 = fma(_185, _199, _235);
    float _239 = fma(_229, _229, _233);
    float _241 = _149 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _243 = fma(_237, _237, _239);
    float _245 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].x, _241);
    float _247 = rsqrt(_243);
    float _249 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[31].z, _245);
    bool _253 = _231 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _255 = _249 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _257 = _229 * _247;
    float _259 = _223 * _247;
    float _261 = _237 * _247;
    float _263 = _247;
    float _265 = _255;
    float _267 = _171;
    if (!_253)
    {
        _263 = _191;
    }
    float _269 = _263;
    bool _271 = !_253;
    float _273 = _269;
    if (!_271)
    {
        float _275 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _277 = _231 + _275;
        float _279 = _255 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _281 = rsqrt(_219);
        float _283 = -_255;
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _287 = _283 + _285;
        float _289 = abs(_279);
        float _291 = abs(_277);
        float _293 = precise::max(_289, _291);
        float _295 = _287 * _287;
        bool _297 = _293 >= 16.0;
        float _299 = _211 * _281;
        float _301 = _195 * _281;
        float _303 = -_211;
        float _305 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[41].z, _303);
        float _307 = -_195;
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
        _265 = _520;
        _273 = _522;
        _267 = _524;
    }
    float _526 = _265;
    float _528 = _273;
    float _530 = _267;
    float2 _2005 = float2(_81, _83);
    float4 _533 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2005, float2(0.0), isnan(_2005)), int2(0), component::x).xyzw;
    float _535 = _533.x;
    float _537 = _533.y;
    float _539 = _533.z;
    float _541 = _533.w;
    float2 _2021 = float2(_81, _83);
    float4 _543 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2021, float2(0.0), isnan(_2021)), int2(0), component::x).xyzw;
    float _545 = _543.x;
    float _547 = _543.y;
    float _549 = _543.z;
    float _551 = _543.w;
    float2 _2037 = float2(_81, _83);
    float4 _553 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2037, float2(0.0), isnan(_2037)), int2(0), component::w).xyzw;
    float _555 = _553.x;
    float _557 = _553.y;
    float _559 = _553.z;
    float _561 = _553.w;
    float _563 = _259 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _565 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[35].x, _563);
    float _567 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].z, _565);
    float _569 = -_567;
    float _571 = fma(_569, _567, 1.0);
    float _573 = -_567;
    float _575 = fma(_573, (*spvDescriptorSet0.fp_c3)._m0[35].z, _261);
    float _577 = -_567;
    float _579 = fma(_577, (*spvDescriptorSet0.fp_c3)._m0[35].x, _257);
    float _581 = -_567;
    float _583 = fma(_581, (*spvDescriptorSet0.fp_c3)._m0[35].y, _259);
    float _585 = _571 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _587 = fma(_575, _585, _147);
    float _589 = fma(_583, _585, _149);
    float _591 = fma(_579, _585, _151);
    float _593 = -_587;
    bool _595 = _593 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _597 = float(_595);
    float _599 = -_587;
    bool _601 = _599 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _603 = float(_601);
    float _605 = _597 + _603;
    float _607 = precise::min(_605, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _609 = trunc(_607);
    int _611 = int(_609);
    int _613 = _611 << 6;
    bool _615 = _611 != 0;
    uint _618 = uint(int(uint(_613) >> uint(2)));
    uint _620 = uint(int(uint(int(_618)) >> uint(2)));
    int _622 = int(_618) & 3;
    float _624 = (*spvDescriptorSet0.fp_c3)._m0[int(_620)][_622];
    int _626 = int(_618) + 1;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    int _630 = _626 & 3;
    float _632 = (*spvDescriptorSet0.fp_c3)._m0[int(_628)][_630];
    int _634 = _613 + 16;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    uint _638 = uint(int(uint(int(_636)) >> uint(2)));
    int _640 = int(_636) & 3;
    float _642 = (*spvDescriptorSet0.fp_c3)._m0[int(_638)][_640];
    int _644 = int(_636) + 1;
    uint _646 = uint(int(uint(_644) >> uint(2)));
    int _648 = _644 & 3;
    float _650 = (*spvDescriptorSet0.fp_c3)._m0[int(_646)][_648];
    int _652 = _613 + 32;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    uint _656 = uint(int(uint(int(_654)) >> uint(2)));
    int _658 = int(_654) & 3;
    float _660 = (*spvDescriptorSet0.fp_c3)._m0[int(_656)][_658];
    int _662 = int(_654) + 1;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    int _666 = _662 & 3;
    float _668 = (*spvDescriptorSet0.fp_c3)._m0[int(_664)][_666];
    int _670 = _613 + 48;
    uint _672 = uint(int(uint(_670) >> uint(2)));
    uint _674 = uint(int(uint(int(_672)) >> uint(2)));
    int _676 = int(_672) & 3;
    float _678 = (*spvDescriptorSet0.fp_c3)._m0[int(_674)][_676];
    int _680 = int(_672) + 1;
    uint _682 = uint(int(uint(_680) >> uint(2)));
    int _684 = _680 & 3;
    float _686 = (*spvDescriptorSet0.fp_c3)._m0[int(_682)][_684];
    int _688 = _613 + 24;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    uint _692 = uint(int(uint(int(_690)) >> uint(2)));
    int _694 = int(_690) & 3;
    float _696 = (*spvDescriptorSet0.fp_c3)._m0[int(_692)][_694];
    int _698 = int(_690) + 1;
    uint _700 = uint(int(uint(_698) >> uint(2)));
    int _702 = _698 & 3;
    float _704 = (*spvDescriptorSet0.fp_c3)._m0[int(_700)][_702];
    float _706 = _589 * _632;
    float _708 = fma(_591, _624, _706);
    int _710 = _613 + 8;
    uint _712 = uint(int(uint(_710) >> uint(2)));
    uint _714 = uint(int(uint(int(_712)) >> uint(2)));
    int _716 = int(_712) & 3;
    float _718 = (*spvDescriptorSet0.fp_c3)._m0[int(_714)][_716];
    int _720 = int(_712) + 1;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    int _724 = _720 & 3;
    float _726 = (*spvDescriptorSet0.fp_c3)._m0[int(_722)][_724];
    float _728 = _589 * _650;
    float _730 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _732 = fma(_591, _642, _728);
    float _734 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _736 = floor(_730);
    float _738 = _589 * _668;
    float _740 = fma(_591, _660, _738);
    float _742 = floor(_734);
    float _744 = _589 * _686;
    float _746 = fma(_591, _678, _744);
    float _748 = -_736;
    float _750 = _730 + _748;
    float _752 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _754 = _750 + _752;
    int _756 = _613 + 40;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    uint _760 = uint(int(uint(int(_758)) >> uint(2)));
    int _762 = int(_758) & 3;
    float _764 = (*spvDescriptorSet0.fp_c3)._m0[int(_760)][_762];
    int _766 = int(_758) + 1;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    int _770 = _766 & 3;
    float _772 = (*spvDescriptorSet0.fp_c3)._m0[int(_768)][_770];
    float _774 = -_742;
    float _776 = _734 + _774;
    float _778 = -_754;
    float _780 = _778 + 1.0;
    float _782 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _784 = _776 + _782;
    float _786 = -_784;
    float _788 = _786 + 1.0;
    float _790 = _754 * _784;
    float _792 = _784 * _780;
    float _794 = _754 * _788;
    float _796 = _780 * _788;
    float _798 = fma(_587, _696, _732);
    float _800 = fma(_587, _718, _708);
    float _802 = _798 + _704;
    float _804 = precise::min(_147, -1.0000000116860974230803549289703e-07);
    float _806 = _800 + _726;
    float _808 = 1.0 / _804;
    float _810 = fma(_587, _764, _740);
    float _812 = _810 + _772;
    float _814 = -_535;
    float _816 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _818 = -_539;
    float _820 = fma(_818, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _822 = -_537;
    float _824 = fma(_822, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _826 = -_541;
    float _828 = fma(_826, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _830 = 1.0 / _816;
    float _832 = _808 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _834 = 1.0 / _824;
    float _836 = 1.0 / _820;
    float _838 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _840 = -_147;
    float _842 = fma(_830, _838, _840);
    float _844 = abs(_842);
    float _846 = _844 * _832;
    float _848 = 1.0 / _828;
    float _850 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _852 = -_147;
    float _854 = fma(_834, _850, _852);
    float _856 = abs(_854);
    float _858 = _856 * _832;
    float _860 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _862 = -_147;
    float _864 = fma(_836, _860, _862);
    float _866 = exp2(_846);
    int _868 = _613 + 56;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    uint _872 = uint(int(uint(int(_870)) >> uint(2)));
    int _874 = int(_870) & 3;
    float _876 = (*spvDescriptorSet0.fp_c3)._m0[int(_872)][_874];
    int _878 = int(_870) + 1;
    uint _880 = uint(int(uint(_878) >> uint(2)));
    int _882 = _878 & 3;
    float _884 = (*spvDescriptorSet0.fp_c3)._m0[int(_880)][_882];
    float _886 = abs(_864);
    float _888 = _886 * _832;
    float _890 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _892 = -_147;
    float _894 = fma(_848, _890, _892);
    float _896 = exp2(_858);
    float _898 = abs(_894);
    float _900 = _898 * _832;
    float _902 = exp2(_888);
    float _904 = abs(_792);
    float _906 = _904 * _866;
    float _908 = exp2(_900);
    float _910 = abs(_790);
    float _912 = _910 * _896;
    float _914 = _906 + _912;
    float _916 = abs(_794);
    float _918 = _916 * _902;
    float _920 = _918 + _914;
    float _922 = abs(_796);
    float _924 = _922 * _908;
    float _926 = _924 + _920;
    float _928 = -_924;
    bool _930 = _920 != _928;
    bool _932 = isnan(_920);
    bool _934 = _930 || _932;
    bool _936 = isnan(_928);
    bool _938 = _934 || _936;
    float _940 = fma(_587, _876, _746);
    float _942 = 1.0 / _926;
    float _944 = _940 + _884;
    float _946 = 1.0 / _944;
    float _948 = _912 * _942;
    float _950 = _906 * _942;
    float _952 = _918 * _942;
    float _954 = _924 * _942;
    float _956 = _938 ? _948 : 0.25;
    float _958 = _938 ? _950 : 0.25;
    float _960 = _938 ? _952 : 0.25;
    float _962 = _956 * _547;
    float _964 = _956 * _557;
    float _966 = _806 * _946;
    float _968 = fma(_958, _545, _962);
    float _970 = fma(_958, _555, _964);
    float _972 = _812 * _946;
    float _974 = precise::clamp(_972, 0.0, 1.0);
    float _976 = fma(_960, _549, _968);
    float _978 = _938 ? _954 : 0.25;
    float _980 = fma(_960, _559, _970);
    float _982 = _802 * _946;
    float _984 = fma(_978, _551, _976);
    float _986 = fma(_978, _561, _980);
    float _1042;
    if (!_615)
    {
        float _988 = rint(_607);
        float _990 = precise::max(_988, 0.0);
        uint _992 = uint(_990);
        uint _994 = clamp(_992, 0u, 65535u);
        float _996 = _974 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _998 = fma(_996, 0.5, _982);
        float _1000 = fma(_996, 0.5, _966);
        float _1002 = fma(_996, -0.5, _966);
        float _1004 = fma(_996, -0.5, _982);
        float3 _2752 = float3(_966, _998, float(int(_994)));
        float3 _2756 = select(_2752, float3(0.0), isnan(_2752));
        float _1006 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2756.xy, uint(rint(_2756.z)), _974);
        float3 _2765 = float3(_1000, _998, float(int(_994)));
        float3 _2767 = select(_2765, float3(0.0), isnan(_2765));
        float _1008 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2767.xy, uint(rint(_2767.z)), _974);
        float3 _2776 = float3(_1002, _998, float(int(_994)));
        float3 _2778 = select(_2776, float3(0.0), isnan(_2776));
        float _1010 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2778.xy, uint(rint(_2778.z)), _974);
        float3 _2787 = float3(_1000, _982, float(int(_994)));
        float3 _2789 = select(_2787, float3(0.0), isnan(_2787));
        float _1012 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2789.xy, uint(rint(_2789.z)), _974);
        float3 _2798 = float3(_966, _982, float(int(_994)));
        float3 _2800 = select(_2798, float3(0.0), isnan(_2798));
        float _1014 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2800.xy, uint(rint(_2800.z)), _974);
        float3 _2809 = float3(_1002, _982, float(int(_994)));
        float3 _2811 = select(_2809, float3(0.0), isnan(_2809));
        float _1016 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2811.xy, uint(rint(_2811.z)), _974);
        float3 _2820 = float3(_1000, _1004, float(int(_994)));
        float3 _2822 = select(_2820, float3(0.0), isnan(_2820));
        float _1018 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2822.xy, uint(rint(_2822.z)), _974);
        float3 _2831 = float3(_966, _1004, float(int(_994)));
        float3 _2833 = select(_2831, float3(0.0), isnan(_2831));
        float _1020 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2833.xy, uint(rint(_2833.z)), _974);
        float3 _2842 = float3(_1002, _1004, float(int(_994)));
        float3 _2844 = select(_2842, float3(0.0), isnan(_2842));
        float _1022 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2844.xy, uint(rint(_2844.z)), _974);
        float _1024 = _1008 + _1006;
        float _1026 = _1024 + _1010;
        float _1028 = _1026 + _1012;
        float _1030 = _1028 + _1014;
        float _1032 = _1030 + _1016;
        float _1034 = _1032 + _1018;
        float _1036 = _1034 + _1020;
        float _1038 = _1036 + _1022;
        float _1040 = _1038 * 0.111111111938953399658203125;
        _1042 = _1040;
        _1044 = true;
    }
    else
    {
        float _1046 = rint(_607);
        float _1048 = precise::max(_1046, 0.0);
        uint _1050 = uint(_1048);
        uint _1052 = clamp(_1050, 0u, 65535u);
        float3 _2891 = float3(_966, _982, float(int(_1052)));
        float3 _2893 = select(_2891, float3(0.0), isnan(_2891));
        float _1054 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2893.xy, uint(rint(_2893.z)), _974);
        _1042 = _1054;
    }
    _1044 = false;
    float _1056 = _1042;
    float _1058 = _526 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1060 = _526 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1062 = -_147;
    float _1064 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1066 = _1062 + _1064;
    float _1068 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1058);
    float _1070 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1060);
    float _1072 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1068);
    float _1074 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1070);
    float _1076 = _1072 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1078 = _1074 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1080 = trunc(_1076);
    int _1082 = int(_1080);
    float _1084 = trunc(_1078);
    int _1086 = int(_1084);
    int _1088 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1090 = _1082 + _1088;
    int _1092 = _1090 + 1;
    bool _1094 = _1092 >= 0;
    int _1096 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1098 = _1086 + _1096;
    int _1100 = _1098 + 1;
    float _1102 = -_147;
    float _1104 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1106 = _1102 + _1104;
    bool _1108 = _1092 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1110 = !_1094;
    bool _1112 = _1108 || _1110;
    bool _1114 = _1100 < 0;
    bool _1116 = _1114 || _1112;
    bool _1118 = _1100 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1120 = _1118 || _1116;
    float _1122 = as_type<float>(_1082);
    if (_1120)
    {
        _1122 = 1.0;
    }
    float _1124 = _1122;
    float _1126 = _1124;
    if (!_1120)
    {
        int _1128 = _1100 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1130 = _1128 + _1092;
        float _1132 = floor(_1078);
        int _1134 = _1130 << 2;
        int _1136 = _1130 >> 2;
        int _1138 = 12 & _1134;
        int _1140 = _1136 << 4;
        int _1142 = _1140 + _1138;
        float _1144 = floor(_1076);
        uint _1146 = uint(int(uint(_1142) >> uint(2)));
        uint _1148 = uint(int(uint(int(_1146)) >> uint(2)));
        int _1150 = int(_1146) & 3;
        float _1152 = (*spvDescriptorSet0.fp_c5)._m0[int(_1148)][_1150];
        float _1154 = -_1132;
        float _1156 = _1078 + _1154;
        float _1158 = -_1144;
        float _1160 = _1076 + _1158;
        float _1162 = rint(_1152);
        float _1164 = precise::max(_1162, 0.0);
        uint _1166 = uint(_1164);
        uint _1168 = clamp(_1166, 0u, 65535u);
        float3 _3080 = float3(_1160, _1156, float(int(_1168)));
        float3 _3082 = select(_3080, float3(0.0), isnan(_3080));
        float _1170 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3082.xy, uint(rint(_3082.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3082.xy, uint(rint(_3082.z)), level(0.0)).x;
        int _1172 = _1130 << 4;
        int _1174 = _1172 + 1648;
        int _1176 = _1142 + 8048;
        uint _1178 = uint(int(uint(_1176) >> uint(2)));
        uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
        int _1182 = int(_1178) & 3;
        float _1184 = (*spvDescriptorSet0.fp_c5)._m0[int(_1180)][_1182];
        uint _1186 = uint(int(uint(_1174) >> uint(2)));
        uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
        int _1190 = int(_1186) & 3;
        float _1192 = (*spvDescriptorSet0.fp_c5)._m0[int(_1188)][_1190];
        int _1194 = int(_1186) + 1;
        uint _1196 = uint(int(uint(_1194) >> uint(2)));
        int _1198 = _1194 & 3;
        float _1200 = (*spvDescriptorSet0.fp_c5)._m0[int(_1196)][_1198];
        int _1202 = _1174 + 8;
        uint _1204 = uint(int(uint(_1202) >> uint(2)));
        uint _1206 = uint(int(uint(int(_1204)) >> uint(2)));
        int _1208 = int(_1204) & 3;
        float _1210 = (*spvDescriptorSet0.fp_c5)._m0[int(_1206)][_1208];
        int _1212 = int(_1204) + 1;
        uint _1214 = uint(int(uint(_1212) >> uint(2)));
        int _1216 = _1212 & 3;
        float _1218 = (*spvDescriptorSet0.fp_c5)._m0[int(_1214)][_1216];
        float _1220 = _1184 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1222 = _526 * _1200;
        float _1224 = fma(_528, _1192, _1222);
        float _1226 = 1.0 / _1184;
        float _1228 = fma(_530, _1210, _1224);
        float _1230 = _1228 + _1218;
        float _1232 = precise::clamp(_1230, 0.0, 1.0);
        float _1234 = -_1232;
        float _1236 = _1234 + _1170;
        float _1238 = fma(_1226, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1236);
        float _1240 = _1220 * _1238;
        float _1242 = exp2(_1240);
        float _1244 = 0.0 + _1242;
        float _1246 = precise::clamp(_1244, 0.0, 1.0);
        _1126 = _1246;
    }
    float _1248 = _1126;
    float _1250 = precise::min(_1248, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1252 = _1106 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = _1066 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1258 = precise::clamp(_1256, 0.0, 1.0);
    float _1260 = -_1056;
    float _1262 = _1260 + 1.0;
    float _1264 = precise::min(_986, 1.0);
    float _1266 = -_1250;
    float _1268 = _1266 + 1.0;
    float _1270 = precise::min(_984, 1.0);
    float _1272 = fma(_1254, _1262, _1056);
    float _1274 = fma(_1258, _1268, _1250);
    out.m_56.x = _1272;
    out.m_56.y = _1274;
    out.m_56.z = _1264;
    out.m_56.w = 1.0;
    out.m_58.x = _1270;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

