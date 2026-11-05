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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_18 [[id(9)]];
    sampler fp_t_tcb_18Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_1A [[id(11)]];
    sampler fp_t_tcb_1ASmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> fp_t_tcb_10 [[id(15)]];
    sampler fp_t_tcb_10Smplr [[id(16)]];
    texture2d<float> fp_t_tcb_14 [[id(17)]];
    sampler fp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_16 [[id(19)]];
    sampler fp_t_tcb_16Smplr [[id(20)]];
    texture2d_array<float> fp_t_tcb_E [[id(21)]];
    sampler fp_t_tcb_ESmplr [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_ASmplr_w [[id(24)]];
    sampler fp_t_tcb_18Smplr_w [[id(25)]];
    sampler fp_t_tcb_1ASmplr_w [[id(26)]];
    sampler fp_t_tcb_14Smplr_w [[id(27)]];
    sampler fp_t_tcb_16Smplr_w [[id(28)]];
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
    float2 _1374 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1374, float2(0.0), isnan(_1374))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1374, float2(0.0), isnan(_1374))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1389 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1389, float2(0.0), isnan(_1389))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1389, float2(0.0), isnan(_1389))).x;
    float2 _1397 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1397, float2(0.0), isnan(_1397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1397, float2(0.0), isnan(_1397))).x;
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
    float _159 = _89 * _127;
    float _161 = -_101;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _165 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[41].x, _163);
    float _167 = _155 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _169 = _155 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _171 = _89 * _139;
    float _173 = -_157;
    float _175 = fma(_165, _145, _173);
    float _177 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].x, _167);
    float _179 = -_103;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[41].x, _181);
    float _185 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].x, _169);
    float _187 = -_155;
    float _189 = fma(_165, _159, _187);
    float _191 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _177);
    float _193 = -_153;
    float _195 = _193 + _165;
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
    float _247 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _249 = sqrt(_239);
    float _251 = fma(_237, _237, _241);
    float _253 = fma(_245, _245, _251);
    float _255 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _247);
    float _257 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _255);
    float _259 = rsqrt(_253);
    float _261 = _257 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _265 = _249 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _267 = _231 * _259;
    float _269 = _237 * _259;
    float _271 = _245 * _259;
    float _273 = _257;
    float _275 = _203;
    float _277 = _261;
    if (!_265)
    {
        _273 = _209;
    }
    float _279 = _273;
    bool _281 = !_265;
    float _283 = _279;
    if (!_281)
    {
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _287 = _249 + _285;
        float _289 = _261 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = rsqrt(_239);
        float _293 = -_261;
        float _295 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = _293 + _295;
        float _299 = abs(_289);
        float _301 = abs(_287);
        float _303 = precise::max(_299, _301);
        float _305 = _297 * _297;
        bool _307 = _303 >= 16.0;
        float _309 = _223 * _291;
        float _311 = _217 * _291;
        float _313 = -_223;
        float _315 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = -_217;
        float _319 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[41].z, _317);
        float _321 = _287;
        float _323 = _289;
        int _326 = as_type<int>(_319);
        if (_307)
        {
            float _328 = _287 * 0.0625;
            _321 = _328;
        }
        float _330 = _321;
        if (_307)
        {
            float _332 = _289 * 0.0625;
            _323 = _332;
        }
        float _334 = _323;
        float _336 = fma(_315, _315, _305);
        float _338 = abs(_330);
        bool _340 = _338 != 0.0;
        bool _342 = isnan(_338);
        bool _344 = _340 || _342;
        bool _346 = isnan(0.0);
        bool _348 = _344 || _346;
        float _350 = fma(_319, _319, _336);
        float _352 = abs(_334);
        bool _354 = _352 == 0.0;
        float _356 = abs(_334);
        bool _358 = _356 == 0.0;
        bool _360 = !_348;
        bool _362 = _358 && _360;
        float _364 = sqrt(_350);
        bool _366 = false;
        if (_362)
        {
            bool _368 = as_type<int>(_334) >= 0;
            _366 = _368;
        }
        bool _370 = _366;
        int _372 = _370 ? (-1) : 0;
        if (_362)
        {
            int _374 = _370 ? 0 : 1078530011;
            _326 = _374;
        }
        int _376 = _326;
        int _378 = _376;
        if (_362)
        {
            int _380 = int(0x80000000) & as_type<int>(_330);
            int _382 = _376 | _380;
            _378 = _382;
        }
        int _384 = _378;
        bool _386 = !_348;
        bool _388 = _386 && _354;
        int _390 = _384;
        float _392 = as_type<float>(_384);
        if (!_388)
        {
            float _394 = abs(_330);
            bool _396 = _394 != as_type<float>(0x7f800000u /* inf */);
            bool _398 = isnan(_394);
            bool _400 = _396 || _398;
            bool _402 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _404 = _400 || _402;
            float _406 = abs(_334);
            bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
            float _410 = abs(_334);
            bool _412 = _410 == as_type<float>(0x7f800000u /* inf */);
            bool _414 = !_404;
            bool _416 = _412 && _414;
            if (_416)
            {
                bool _418 = as_type<int>(_334) >= 0;
                _372 = _418 ? (-1) : 0;
            }
            int _420 = _372;
            if (_416)
            {
                _390 = 1075235812;
            }
            int _422 = _390;
            int _424 = _422;
            if (_416)
            {
                int _426 = ~_420;
                int _428 = (_426 != 0) ? _422 : 1061752795;
                _424 = _428;
            }
            int _430 = _424;
            float _432 = as_type<float>(_430);
            if (_416)
            {
                int _434 = int(0x80000000) & as_type<int>(_330);
                int _436 = _430 | _434;
                _432 = as_type<float>(_436);
            }
            float _438 = _432;
            bool _440 = !_404;
            bool _442 = _440 && _408;
            _392 = _438;
            if (!_442)
            {
                float _444 = abs(_330);
                float _446 = abs(_334);
                float _448 = precise::max(_444, _446);
                float _450 = abs(_330);
                float _452 = abs(_334);
                float _454 = precise::min(_450, _452);
                float _456 = 1.0 / _448;
                float _458 = abs(_330);
                float _460 = abs(_334);
                bool _462 = _458 > _460;
                bool _464 = as_type<int>(_334) >= 0;
                float _466 = _454 * _456;
                float _468 = abs(_330);
                float _470 = abs(_334);
                float _472 = _468 + _470;
                int _474 = as_type<int>(_330) & int(0x80000000);
                float _476 = _466 * _466;
                bool _478 = _472 > as_type<float>(0x7f800000u /* inf */);
                bool _480 = isnan(_472);
                bool _482 = _478 || _480;
                bool _484 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _486 = _482 || _484;
                float _488 = _476 + 11.33538818359375;
                float _490 = fma(_476, _488, 28.84246826171875);
                float _492 = fma(_476, _490, 19.6966705322265625);
                float _494 = fma(_476, -0.82336294651031494140625, -5.674867153167724609375);
                float _496 = fma(_476, _494, -6.565555095672607421875);
                float _498 = 1.0 / _492;
                float _500 = _476 * _496;
                float _502 = _466 * _500;
                float _504 = fma(_502, _498, _466);
                float _506 = _504;
                _392 = _472;
                if (_462)
                {
                    float _508 = -_504;
                    float _510 = _508 + 1.57079637050628662109375;
                    _506 = _510;
                }
                float _512 = _506;
                int _514 = as_type<int>(_512);
                if (!_464)
                {
                    float _516 = -_512;
                    float _518 = _516 + 3.1415927410125732421875;
                    _514 = as_type<int>(_518);
                }
                int _520 = _514;
                if (!_486)
                {
                    int _522 = _474 | _520;
                    _392 = as_type<float>(_522);
                }
            }
        }
        float _524 = _392;
        float _526 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _528 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _530 = _364 + _528;
        float _532 = fma(_309, _526, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _534 = fma(_311, _526, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _283 = _532;
        _275 = _534;
        _277 = _530;
    }
    float _536 = _283;
    float _538 = _275;
    float _540 = _277;
    float _542 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _544 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _546 = fma(_536, 6.2500002968590706586837768554688e-05, 0.5);
    float _548 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2080 = float2(_542, _544);
    float4 _551 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2080, float2(0.0), isnan(_2080)), int2(0), component::x).xyzw;
    float _553 = _551.x;
    float _555 = _551.y;
    float _557 = _551.z;
    float _559 = _551.w;
    float2 _2096 = float2(_91, _93);
    float2 _563 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2096, float2(0.0), isnan(_2096))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2096, float2(0.0), isnan(_2096))).xy;
    float _565 = _563.x;
    float _567 = _563.y;
    float2 _2108 = float2(_546, _548);
    float _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2108, float2(0.0), isnan(_2108))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2108, float2(0.0), isnan(_2108))).x;
    float _571 = _267 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _573 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[35].x, _571);
    float _575 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _577 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[35].z, _573);
    float _579 = -_577;
    float _581 = fma(_579, _577, 1.0);
    float _583 = -_577;
    float _585 = fma(_583, (*spvDescriptorSet0.fp_c3)._m0[35].z, _271);
    float _587 = -_577;
    float _589 = fma(_587, (*spvDescriptorSet0.fp_c3)._m0[35].x, _269);
    float _591 = -_577;
    float _593 = fma(_591, (*spvDescriptorSet0.fp_c3)._m0[35].y, _267);
    float _595 = _581 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _597 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _599 = fma(_585, _595, _153);
    float _601 = fma(_593, _595, _155);
    float _603 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _605 = fma(_589, _595, _157);
    float _607 = -_599;
    bool _609 = _607 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _611 = float(_609);
    float _613 = floor(_597);
    float _615 = -_599;
    bool _617 = _615 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _619 = float(_617);
    float _621 = _611 + _619;
    float _623 = floor(_603);
    float _625 = precise::min(_621, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _627 = trunc(_625);
    int _629 = int(_627);
    float _631 = -_613;
    float _633 = _597 + _631;
    float _635 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _637 = _633 + _635;
    float _639 = -_623;
    float _641 = _603 + _639;
    float _643 = rint(_625);
    float _645 = precise::max(_643, 0.0);
    uint _648 = uint(_645);
    uint _650 = clamp(_648, 0u, 65535u);
    int _652 = _629 << 6;
    int _654 = _652 + 32;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.fp_c3)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.fp_c3)._m0[int(_666)][_668];
    int _672 = _652 + 48;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.fp_c3)._m0[int(_676)][_678];
    int _682 = int(_674) + 1;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    int _686 = _682 & 3;
    float _688 = (*spvDescriptorSet0.fp_c3)._m0[int(_684)][_686];
    uint _690 = uint(int(uint(_652) >> uint(2)));
    uint _692 = uint(int(uint(int(_690)) >> uint(2)));
    int _694 = int(_690) & 3;
    float _696 = (*spvDescriptorSet0.fp_c3)._m0[int(_692)][_694];
    int _698 = int(_690) + 1;
    uint _700 = uint(int(uint(_698) >> uint(2)));
    int _702 = _698 & 3;
    float _704 = (*spvDescriptorSet0.fp_c3)._m0[int(_700)][_702];
    int _706 = _652 + 16;
    uint _708 = uint(int(uint(_706) >> uint(2)));
    uint _710 = uint(int(uint(int(_708)) >> uint(2)));
    int _712 = int(_708) & 3;
    float _714 = (*spvDescriptorSet0.fp_c3)._m0[int(_710)][_712];
    int _716 = int(_708) + 1;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    int _720 = _716 & 3;
    float _722 = (*spvDescriptorSet0.fp_c3)._m0[int(_718)][_720];
    float _724 = _601 * _670;
    float _726 = fma(_605, _662, _724);
    float _728 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _730 = _641 + _728;
    float _732 = -_637;
    float _734 = _732 + 1.0;
    float _736 = _601 * _688;
    float _738 = _637 * _730;
    float _740 = fma(_605, _680, _736);
    float _742 = -_730;
    float _744 = _742 + 1.0;
    float _746 = _730 * _734;
    float _748 = _601 * _704;
    float _750 = _637 * _744;
    float _752 = _734 * _744;
    int _754 = _652 + 40;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    uint _758 = uint(int(uint(int(_756)) >> uint(2)));
    int _760 = int(_756) & 3;
    float _762 = (*spvDescriptorSet0.fp_c3)._m0[int(_758)][_760];
    int _764 = int(_756) + 1;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    int _768 = _764 & 3;
    float _770 = (*spvDescriptorSet0.fp_c3)._m0[int(_766)][_768];
    float _772 = _601 * _722;
    float _774 = fma(_605, _696, _748);
    int _776 = _652 + 8;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    uint _780 = uint(int(uint(int(_778)) >> uint(2)));
    int _782 = int(_778) & 3;
    float _784 = (*spvDescriptorSet0.fp_c3)._m0[int(_780)][_782];
    int _786 = int(_778) + 1;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    int _790 = _786 & 3;
    float _792 = (*spvDescriptorSet0.fp_c3)._m0[int(_788)][_790];
    float _794 = fma(_605, _714, _772);
    int _796 = _652 + 24;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    uint _800 = uint(int(uint(int(_798)) >> uint(2)));
    int _802 = int(_798) & 3;
    float _804 = (*spvDescriptorSet0.fp_c3)._m0[int(_800)][_802];
    int _806 = int(_798) + 1;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    int _810 = _806 & 3;
    float _812 = (*spvDescriptorSet0.fp_c3)._m0[int(_808)][_810];
    int _814 = _652 + 56;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    uint _818 = uint(int(uint(int(_816)) >> uint(2)));
    int _820 = int(_816) & 3;
    float _822 = (*spvDescriptorSet0.fp_c3)._m0[int(_818)][_820];
    int _824 = int(_816) + 1;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    int _828 = _824 & 3;
    float _830 = (*spvDescriptorSet0.fp_c3)._m0[int(_826)][_828];
    float _832 = fma(_599, _762, _726);
    float _834 = fma(_599, _784, _774);
    float _836 = precise::min(_153, -1.0000000116860974230803549289703e-07);
    float _838 = 1.0 / _836;
    float _840 = fma(_599, _804, _794);
    float _842 = _840 + _812;
    float _844 = _832 + _770;
    float _846 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _848 = fma(_599, _822, _740);
    float _850 = _834 + _792;
    float _852 = _848 + _830;
    float _854 = _838 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _856 = 1.0 / _852;
    float2 _2592 = float2(_846, _575);
    float _858 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2592, float2(0.0), isnan(_2592))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2592, float2(0.0), isnan(_2592))).x;
    float _860 = _850 * _856;
    float _862 = _844 * _856;
    float _864 = precise::clamp(_862, 0.0, 1.0);
    float _866 = -_555;
    float _868 = fma(_866, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _870 = -_559;
    float _872 = fma(_870, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _874 = -_557;
    float _876 = fma(_874, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _878 = -_553;
    float _880 = fma(_878, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _882 = fma(_565, 2.0, -1.0);
    float _884 = fma(_567, 2.0, -1.0);
    float _886 = 1.0 / _868;
    float _888 = _842 * _856;
    float _890 = _882 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _892 = 1.0 / _876;
    float _894 = 1.0 / _880;
    float _896 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _898 = -_153;
    float _900 = fma(_886, _896, _898);
    float _902 = abs(_900);
    float _904 = _902 * _854;
    float _906 = fma(_890, 2.0, _91);
    float _908 = 1.0 / _872;
    float _910 = _884 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _912 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _914 = -_153;
    float _916 = fma(_892, _912, _914);
    float _918 = fma(_910, 2.0, _93);
    float _920 = abs(_916);
    float _922 = _920 * _854;
    float _924 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _926 = -_153;
    float _928 = fma(_894, _924, _926);
    float3 _2704 = float3(_860, _888, float(int(_650)));
    float3 _2708 = select(_2704, float3(0.0), isnan(_2704));
    float _930 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2708.xy, uint(rint(_2708.z)), _864);
    float2 _2714 = float2(_542, _544);
    float4 _932 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2714, float2(0.0), isnan(_2714)), int2(0), component::x).xyzw;
    float _934 = _932.x;
    float _936 = _932.y;
    float _938 = _932.z;
    float _940 = _932.w;
    float _942 = abs(_928);
    float _944 = _942 * _854;
    float _946 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _948 = -_153;
    float _950 = fma(_908, _946, _948);
    float _952 = abs(_950);
    float _954 = _952 * _854;
    float2 _2749 = float2(_542, _544);
    float4 _956 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2749, float2(0.0), isnan(_2749)), int2(0), component::w).xyzw;
    float _958 = _956.x;
    float _960 = _956.y;
    float _962 = _956.z;
    float _964 = _956.w;
    float2 _2765 = float2(_906, _918);
    float2 _966 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2765, float2(0.0), isnan(_2765))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2765, float2(0.0), isnan(_2765))).yz;
    float _968 = _966.x;
    float _970 = _966.y;
    float2 _2777 = float2(_546, _548);
    float _972 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2777, float2(0.0), isnan(_2777)), level(_569)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2777, float2(0.0), isnan(_2777)), level(_569)).x;
    float _974 = abs(_153);
    float _976 = log2(_974);
    float _978 = _540 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _980 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].x, _978);
    float _982 = exp2(_944);
    float _984 = _540 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _986 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].z, _980);
    float _988 = _976 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _990 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].x, _984);
    float _992 = _986 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _994 = exp2(_904);
    float _996 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].z, _990);
    float _998 = abs(_746);
    float _1000 = _998 * _982;
    float _1002 = _996 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1004 = exp2(_988);
    float _1006 = trunc(_992);
    int _1008 = int(_1006);
    float _1010 = exp2(_922);
    float _1012 = fma(_1004, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _1014 = precise::clamp(_1012, 0.0, 1.0);
    float _1016 = fma(_1014, -2.0, 3.0);
    float _1018 = _1014 * _1014;
    float _1020 = trunc(_1002);
    int _1022 = int(_1020);
    int _1024 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1026 = _1008 + _1024;
    int _1028 = _1026 + 1;
    float _1030 = _1018 * _1016;
    float _1032 = abs(_738);
    float _1034 = _1032 * _994;
    bool _1036 = _1028 >= 0;
    float _1038 = _1000 + _1034;
    float _1040 = exp2(_954);
    float _1042 = abs(_750);
    float _1044 = _1042 * _1010;
    bool _1046 = _1028 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1048 = !_1036;
    bool _1050 = _1046 || _1048;
    float _1052 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    int _1054 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1056 = _1022 + _1054;
    int _1058 = _1056 + 1;
    float _1060 = _1044 + _1038;
    float _1062 = -_1030;
    float _1064 = _1062 + 1.0;
    bool _1066 = _1058 < 0;
    bool _1068 = _1066 || _1050;
    float _1070 = fma(_1064, (*spvDescriptorSet0.fp_c3)._m0[44].w, _1030);
    float _1072 = abs(_752);
    float _1074 = _1072 * _1040;
    bool _1076 = _1058 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1078 = _1076 || _1068;
    float _1080 = precise::max(0.0, _1052);
    float _1082 = _1074 + _1060;
    float _1084 = _1070 * _1080;
    float _1086 = 1.0 / _1082;
    float _1088 = _1052;
    if (_1078)
    {
        _1088 = 1.0;
    }
    float _1090 = _1088;
    float _1092 = _1090;
    if (!_1078)
    {
        int _1094 = _1058 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1096 = _1094 + _1028;
        float _1098 = floor(_1002);
        int _1100 = _1096 << 2;
        int _1102 = _1096 >> 2;
        int _1104 = 12 & _1100;
        int _1106 = _1102 << 4;
        int _1108 = _1106 + _1104;
        float _1110 = floor(_992);
        uint _1112 = uint(int(uint(_1108) >> uint(2)));
        uint _1114 = uint(int(uint(int(_1112)) >> uint(2)));
        int _1116 = int(_1112) & 3;
        float _1118 = (*spvDescriptorSet0.fp_c5)._m0[int(_1114)][_1116];
        float _1120 = -_1098;
        float _1122 = _1002 + _1120;
        float _1124 = -_1110;
        float _1126 = _992 + _1124;
        float _1128 = rint(_1118);
        float _1130 = precise::max(_1128, 0.0);
        uint _1132 = uint(_1130);
        uint _1134 = clamp(_1132, 0u, 65535u);
        float3 _3033 = float3(_1126, _1122, float(int(_1134)));
        float3 _3035 = select(_3033, float3(0.0), isnan(_3033));
        float _1136 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3035.xy, uint(rint(_3035.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3035.xy, uint(rint(_3035.z)), level(0.0)).x;
        int _1138 = _1096 << 4;
        int _1140 = _1138 + 1648;
        int _1142 = _1108 + 8048;
        uint _1144 = uint(int(uint(_1142) >> uint(2)));
        uint _1146 = uint(int(uint(int(_1144)) >> uint(2)));
        int _1148 = int(_1144) & 3;
        float _1150 = (*spvDescriptorSet0.fp_c5)._m0[int(_1146)][_1148];
        uint _1152 = uint(int(uint(_1140) >> uint(2)));
        uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
        int _1156 = int(_1152) & 3;
        float _1158 = (*spvDescriptorSet0.fp_c5)._m0[int(_1154)][_1156];
        int _1160 = int(_1152) + 1;
        uint _1162 = uint(int(uint(_1160) >> uint(2)));
        int _1164 = _1160 & 3;
        float _1166 = (*spvDescriptorSet0.fp_c5)._m0[int(_1162)][_1164];
        int _1168 = _1140 + 8;
        uint _1170 = uint(int(uint(_1168) >> uint(2)));
        uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
        int _1174 = int(_1170) & 3;
        float _1176 = (*spvDescriptorSet0.fp_c5)._m0[int(_1172)][_1174];
        int _1178 = int(_1170) + 1;
        uint _1180 = uint(int(uint(_1178) >> uint(2)));
        int _1182 = _1178 & 3;
        float _1184 = (*spvDescriptorSet0.fp_c5)._m0[int(_1180)][_1182];
        float _1186 = _540 * _1166;
        float _1188 = fma(_536, _1158, _1186);
        float _1190 = _1150 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1192 = 1.0 / _1150;
        float _1194 = fma(_538, _1176, _1188);
        float _1196 = _1194 + _1184;
        float _1198 = precise::clamp(_1196, 0.0, 1.0);
        float _1200 = -_1198;
        float _1202 = _1200 + _1136;
        float _1204 = fma(_1192, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1202);
        float _1206 = _1190 * _1204;
        float _1208 = exp2(_1206);
        float _1210 = 0.0 + _1208;
        float _1212 = precise::clamp(_1210, 0.0, 1.0);
        _1092 = _1212;
    }
    float _1214 = _1092;
    float _1216 = _1034 * _1086;
    float _1218 = -_1074;
    bool _1220 = _1060 != _1218;
    bool _1222 = isnan(_1060);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan(_1218);
    bool _1228 = _1224 || _1226;
    float _1230 = -_153;
    float _1232 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1234 = _1230 + _1232;
    float _1236 = precise::min(_1214, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1238 = _1000 * _1086;
    bool _1240 = _153 >= (-8000.0);
    bool _1242 = isnan(_153);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan(-8000.0);
    bool _1248 = _1244 || _1246;
    float _1250 = float(_1248);
    float _1252 = _1234 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = _1228 ? _1216 : 0.25;
    float _1258 = -_1236;
    float _1260 = _1258 + 1.0;
    float _1262 = _1044 * _1086;
    float _1264 = _1250 * _1084;
    float _1266 = _1228 ? _1238 : 0.25;
    float _1268 = _1256 * _936;
    float _1270 = fma(_1254, _1260, _1236);
    float _1272 = _1256 * _960;
    float _1274 = abs(_972);
    float _1276 = _1274 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1278 = _1074 * _1086;
    float _1280 = _1264 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1282 = -_858;
    float _1284 = _1282 + 1.0;
    float _1286 = _1228 ? _1262 : 0.25;
    float _1288 = fma(_1266, _958, _1272);
    float _1290 = fma(_1266, _934, _1268);
    float _1292 = -_1276;
    float _1294 = fma(_1250, _1292, 1.0);
    float _1296 = _1284 * _1280;
    float _1298 = precise::clamp(_1296, 0.0, 1.0);
    float _1300 = -_153;
    float _1302 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1304 = _1300 + _1302;
    float _1306 = _1228 ? _1278 : 0.25;
    float _1308 = fma(_1286, _962, _1288);
    float _1310 = fma(_1286, _938, _1290);
    float _1312 = -_1298;
    float _1314 = fma(_1312, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1316 = precise::min(_1294, 1.0);
    float _1318 = _1304 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1320 = precise::clamp(_1318, 0.0, 1.0);
    float _1322 = -_930;
    float _1324 = _1322 + 1.0;
    float _1326 = fma(_1306, _964, _1308);
    float _1328 = fma(_1306, _940, _1310);
    float _1330 = precise::min(_1316, _1314);
    float _1332 = fma(_1320, _1324, _930);
    float _1334 = precise::min(_1326, 1.0);
    float _1336 = precise::min(_1328, 1.0);
    out.m_66.x = _1332;
    out.m_66.y = _1270;
    out.m_66.z = _1334;
    out.m_66.w = _1330;
    out.m_68.x = _1336;
    out.m_68.y = _968;
    out.m_68.z = _970;
    out.m_68.w = 1.0;
    return out;
}

