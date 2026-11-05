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
    bool _1076 = false;
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
    float2 _1343 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1343, float2(0.0), isnan(_1343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1343, float2(0.0), isnan(_1343))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1358 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1358, float2(0.0), isnan(_1358))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1358, float2(0.0), isnan(_1358))).x;
    float2 _1366 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1366, float2(0.0), isnan(_1366))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1366, float2(0.0), isnan(_1366))).x;
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
    float _143 = _85 * _123;
    float _145 = _85 * _129;
    float _147 = _85 * _135;
    float _149 = -_93;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _153 = -_97;
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _157 = 1.0 / _151;
    float _159 = -_99;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _163 = 1.0 / _155;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _167 = _157 * _165;
    float _169 = 1.0 / _161;
    float _171 = _167 * _137;
    float _173 = _167 * _139;
    float _175 = _171 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _177 = _171 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _181 = _163 * _179;
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[32].x, _175);
    float _185 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[30].x, _177);
    float _187 = -_173;
    float _189 = fma(_181, _141, _187);
    float _191 = -_171;
    float _193 = fma(_181, _143, _191);
    float _195 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[32].z, _183);
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _199 = _169 * _197;
    float _201 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _203 = -_167;
    float _205 = _203 + _181;
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _209 = -_173;
    float _211 = fma(_199, _145, _209);
    float _213 = _201 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _215 = -_171;
    float _217 = fma(_199, _147, _215);
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _221 = _207 + _219;
    float _223 = -_167;
    float _225 = _223 + _199;
    float _227 = _205 * _211;
    float _229 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _231 = _213 + _229;
    float _233 = _221 * _221;
    float _235 = _193 * _225;
    float _237 = -_227;
    float _239 = fma(_189, _225, _237);
    float _241 = _189 * _217;
    float _243 = fma(_231, _231, _233);
    float _245 = -_235;
    float _247 = fma(_205, _217, _245);
    float _249 = _239 * _239;
    float _251 = -_241;
    float _253 = fma(_193, _211, _251);
    float _255 = sqrt(_243);
    float _257 = fma(_247, _247, _249);
    float _259 = _171 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _261 = fma(_253, _253, _257);
    float _263 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].x, _259);
    float _265 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].z, _263);
    float _267 = rsqrt(_261);
    float _269 = _265 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _273 = _255 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _275 = _247 * _267;
    float _277 = _239 * _267;
    float _279 = _253 * _267;
    float _281 = _257;
    float _283 = _269;
    float _285 = _207;
    if (!_273)
    {
        _281 = _213;
    }
    float _287 = _281;
    bool _289 = !_273;
    float _291 = _287;
    if (!_289)
    {
        float _293 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _295 = _255 + _293;
        float _297 = _269 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = rsqrt(_243);
        float _301 = -_269;
        float _303 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _305 = _301 + _303;
        float _307 = abs(_297);
        float _309 = abs(_295);
        float _311 = precise::max(_307, _309);
        float _313 = _305 * _305;
        bool _315 = _311 >= 16.0;
        float _317 = _231 * _299;
        float _319 = _221 * _299;
        float _321 = -_231;
        float _323 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[41].z, _321);
        float _325 = -_221;
        float _327 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[41].z, _325);
        float _329 = _295;
        float _331 = _297;
        int _334 = as_type<int>(_327);
        if (_315)
        {
            float _336 = _295 * 0.0625;
            _329 = _336;
        }
        float _338 = _329;
        if (_315)
        {
            float _340 = _297 * 0.0625;
            _331 = _340;
        }
        float _342 = _331;
        float _344 = fma(_323, _323, _313);
        float _346 = abs(_338);
        bool _348 = _346 != 0.0;
        bool _350 = isnan(_346);
        bool _352 = _348 || _350;
        bool _354 = isnan(0.0);
        bool _356 = _352 || _354;
        float _358 = fma(_327, _327, _344);
        float _360 = abs(_342);
        bool _362 = _360 == 0.0;
        float _364 = abs(_342);
        bool _366 = _364 == 0.0;
        bool _368 = !_356;
        bool _370 = _366 && _368;
        float _372 = sqrt(_358);
        bool _374 = false;
        if (_370)
        {
            bool _376 = as_type<int>(_342) >= 0;
            _374 = _376;
        }
        bool _378 = _374;
        int _380 = _378 ? (-1) : 0;
        if (_370)
        {
            int _382 = _378 ? 0 : 1078530011;
            _334 = _382;
        }
        int _384 = _334;
        int _386 = _384;
        if (_370)
        {
            int _388 = int(0x80000000) & as_type<int>(_338);
            int _390 = _384 | _388;
            _386 = _390;
        }
        int _392 = _386;
        bool _394 = !_356;
        bool _396 = _394 && _362;
        int _398 = _392;
        float _400 = as_type<float>(_392);
        if (!_396)
        {
            float _402 = abs(_338);
            bool _404 = _402 != as_type<float>(0x7f800000u /* inf */);
            bool _406 = isnan(_402);
            bool _408 = _404 || _406;
            bool _410 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _412 = _408 || _410;
            float _414 = abs(_342);
            bool _416 = _414 == as_type<float>(0x7f800000u /* inf */);
            float _418 = abs(_342);
            bool _420 = _418 == as_type<float>(0x7f800000u /* inf */);
            bool _422 = !_412;
            bool _424 = _420 && _422;
            if (_424)
            {
                bool _426 = as_type<int>(_342) >= 0;
                _380 = _426 ? (-1) : 0;
            }
            int _428 = _380;
            if (_424)
            {
                _398 = 1075235812;
            }
            int _430 = _398;
            int _432 = _430;
            if (_424)
            {
                int _434 = ~_428;
                int _436 = (_434 != 0) ? _430 : 1061752795;
                _432 = _436;
            }
            int _438 = _432;
            float _440 = as_type<float>(_438);
            if (_424)
            {
                int _442 = int(0x80000000) & as_type<int>(_338);
                int _444 = _438 | _442;
                _440 = as_type<float>(_444);
            }
            float _446 = _440;
            bool _448 = !_412;
            bool _450 = _448 && _416;
            _400 = _446;
            if (!_450)
            {
                float _452 = abs(_338);
                float _454 = abs(_342);
                float _456 = precise::max(_452, _454);
                float _458 = abs(_338);
                float _460 = abs(_342);
                float _462 = precise::min(_458, _460);
                float _464 = 1.0 / _456;
                float _466 = abs(_338);
                float _468 = abs(_342);
                bool _470 = _466 > _468;
                bool _472 = as_type<int>(_342) >= 0;
                float _474 = _462 * _464;
                float _476 = abs(_338);
                float _478 = abs(_342);
                float _480 = _476 + _478;
                int _482 = as_type<int>(_338) & int(0x80000000);
                float _484 = _474 * _474;
                bool _486 = _480 > as_type<float>(0x7f800000u /* inf */);
                bool _488 = isnan(_480);
                bool _490 = _486 || _488;
                bool _492 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _494 = _490 || _492;
                float _496 = _484 + 11.33538818359375;
                float _498 = fma(_484, _496, 28.84246826171875);
                float _500 = fma(_484, _498, 19.6966705322265625);
                float _502 = fma(_484, -0.82336294651031494140625, -5.674867153167724609375);
                float _504 = fma(_484, _502, -6.565555095672607421875);
                float _506 = 1.0 / _500;
                float _508 = _484 * _504;
                float _510 = _474 * _508;
                float _512 = fma(_510, _506, _474);
                float _514 = _512;
                _400 = _480;
                if (_470)
                {
                    float _516 = -_512;
                    float _518 = _516 + 1.57079637050628662109375;
                    _514 = _518;
                }
                float _520 = _514;
                int _522 = as_type<int>(_520);
                if (!_472)
                {
                    float _524 = -_520;
                    float _526 = _524 + 3.1415927410125732421875;
                    _522 = as_type<int>(_526);
                }
                int _528 = _522;
                if (!_494)
                {
                    int _530 = _482 | _528;
                    _400 = as_type<float>(_530);
                }
            }
        }
        float _532 = _400;
        float _534 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _536 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _538 = _372 + _536;
        float _540 = fma(_317, _534, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _542 = fma(_319, _534, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _283 = _538;
        _291 = _540;
        _285 = _542;
    }
    float _544 = _283;
    float _546 = _291;
    float _548 = _285;
    float2 _2046 = float2(_87, _89);
    float2 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2046, float2(0.0), isnan(_2046))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2046, float2(0.0), isnan(_2046))).xy;
    float _554 = _552.x;
    float _556 = _552.y;
    float _558 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _87);
    float _560 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _89);
    float2 _2067 = float2(_558, _560);
    float4 _563 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2067, float2(0.0), isnan(_2067)), int2(0), component::x).xyzw;
    float _565 = _563.x;
    float _567 = _563.y;
    float _569 = _563.z;
    float _571 = _563.w;
    float2 _2083 = float2(_558, _560);
    float4 _573 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2083, float2(0.0), isnan(_2083)), int2(0), component::w).xyzw;
    float _575 = _573.x;
    float _577 = _573.y;
    float _579 = _573.z;
    float _581 = _573.w;
    float _583 = fma(_554, 2.0, -1.0);
    float _585 = fma(_556, 2.0, -1.0);
    float _587 = _583 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _589 = _585 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _591 = fma(_587, 2.0, _87);
    float _593 = fma(_589, 2.0, _89);
    float2 _2119 = float2(_591, _593);
    float _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2119, float2(0.0), isnan(_2119))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2119, float2(0.0), isnan(_2119))).x;
    float2 _2127 = float2(_591, _593);
    float2 _597 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2127, float2(0.0), isnan(_2127))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2127, float2(0.0), isnan(_2127))).yz;
    float _599 = _597.x;
    float _601 = _597.y;
    float _603 = _277 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _605 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[35].x, _603);
    float _607 = -_567;
    float _609 = fma(_607, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _611 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].z, _605);
    float _613 = -_611;
    float _615 = fma(_613, _611, 1.0);
    float _617 = -_611;
    float _619 = fma(_617, (*spvDescriptorSet0.fp_c3)._m0[35].z, _279);
    float _621 = -_611;
    float _623 = fma(_621, (*spvDescriptorSet0.fp_c3)._m0[35].x, _275);
    float _625 = -_611;
    float _627 = fma(_625, (*spvDescriptorSet0.fp_c3)._m0[35].y, _277);
    float _629 = _615 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _631 = fma(_619, _629, _167);
    float _633 = fma(_627, _629, _171);
    float _635 = fma(_623, _629, _173);
    float _637 = -_631;
    bool _639 = _637 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _641 = float(_639);
    float _643 = -_631;
    bool _645 = _643 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _647 = float(_645);
    float _649 = _641 + _647;
    float _651 = precise::min(_649, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _653 = trunc(_651);
    int _655 = int(_653);
    int _657 = _655 << 6;
    bool _659 = _655 != 0;
    uint _662 = uint(int(uint(_657) >> uint(2)));
    uint _664 = uint(int(uint(int(_662)) >> uint(2)));
    int _666 = int(_662) & 3;
    float _668 = (*spvDescriptorSet0.fp_c3)._m0[int(_664)][_666];
    int _670 = int(_662) + 1;
    uint _672 = uint(int(uint(_670) >> uint(2)));
    int _674 = _670 & 3;
    float _676 = (*spvDescriptorSet0.fp_c3)._m0[int(_672)][_674];
    int _678 = _657 + 16;
    uint _680 = uint(int(uint(_678) >> uint(2)));
    uint _682 = uint(int(uint(int(_680)) >> uint(2)));
    int _684 = int(_680) & 3;
    float _686 = (*spvDescriptorSet0.fp_c3)._m0[int(_682)][_684];
    int _688 = int(_680) + 1;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    int _692 = _688 & 3;
    float _694 = (*spvDescriptorSet0.fp_c3)._m0[int(_690)][_692];
    int _696 = _657 + 48;
    uint _698 = uint(int(uint(_696) >> uint(2)));
    uint _700 = uint(int(uint(int(_698)) >> uint(2)));
    int _702 = int(_698) & 3;
    float _704 = (*spvDescriptorSet0.fp_c3)._m0[int(_700)][_702];
    int _706 = int(_698) + 1;
    uint _708 = uint(int(uint(_706) >> uint(2)));
    int _710 = _706 & 3;
    float _712 = (*spvDescriptorSet0.fp_c3)._m0[int(_708)][_710];
    int _714 = _657 + 24;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    uint _718 = uint(int(uint(int(_716)) >> uint(2)));
    int _720 = int(_716) & 3;
    float _722 = (*spvDescriptorSet0.fp_c3)._m0[int(_718)][_720];
    int _724 = int(_716) + 1;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    int _728 = _724 & 3;
    float _730 = (*spvDescriptorSet0.fp_c3)._m0[int(_726)][_728];
    int _732 = _657 + 32;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    uint _736 = uint(int(uint(int(_734)) >> uint(2)));
    int _738 = int(_734) & 3;
    float _740 = (*spvDescriptorSet0.fp_c3)._m0[int(_736)][_738];
    int _742 = int(_734) + 1;
    uint _744 = uint(int(uint(_742) >> uint(2)));
    int _746 = _742 & 3;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[int(_744)][_746];
    float _750 = _633 * _676;
    float _752 = fma(_635, _668, _750);
    int _754 = _657 + 8;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    uint _758 = uint(int(uint(int(_756)) >> uint(2)));
    int _760 = int(_756) & 3;
    float _762 = (*spvDescriptorSet0.fp_c3)._m0[int(_758)][_760];
    int _764 = int(_756) + 1;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    int _768 = _764 & 3;
    float _770 = (*spvDescriptorSet0.fp_c3)._m0[int(_766)][_768];
    float _772 = _633 * _694;
    float _774 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _776 = fma(_635, _686, _772);
    float _778 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _780 = floor(_774);
    float _782 = _633 * _712;
    float _784 = fma(_635, _704, _782);
    float _786 = fma(_631, _722, _776);
    float _788 = _786 + _730;
    float _790 = -_565;
    float _792 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _794 = -_780;
    float _796 = _774 + _794;
    float _798 = -_569;
    float _800 = fma(_798, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _802 = -_571;
    float _804 = fma(_802, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _806 = _633 * _748;
    float _808 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _810 = _796 + _808;
    float _812 = 1.0 / _792;
    int _814 = _657 + 40;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    uint _818 = uint(int(uint(int(_816)) >> uint(2)));
    int _820 = int(_816) & 3;
    float _822 = (*spvDescriptorSet0.fp_c3)._m0[int(_818)][_820];
    int _824 = int(_816) + 1;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    int _828 = _824 & 3;
    float _830 = (*spvDescriptorSet0.fp_c3)._m0[int(_826)][_828];
    float _832 = fma(_635, _740, _806);
    float _834 = 1.0 / _800;
    float _836 = floor(_778);
    float _838 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _840 = -_167;
    float _842 = fma(_812, _838, _840);
    float _844 = fma(_631, _762, _752);
    float _846 = precise::min(_167, -1.0000000116860974230803549289703e-07);
    float _848 = _844 + _770;
    float _850 = 1.0 / _609;
    float _852 = -_836;
    float _854 = _778 + _852;
    float _856 = 1.0 / _846;
    float _858 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _860 = _854 + _858;
    float _862 = -_810;
    float _864 = _862 + 1.0;
    float _866 = -_860;
    float _868 = _866 + 1.0;
    float _870 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _872 = -_167;
    float _874 = fma(_850, _870, _872);
    float _876 = _810 * _860;
    float _878 = _860 * _864;
    float _880 = _810 * _868;
    float _882 = _864 * _868;
    float _884 = _856 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _886 = fma(_631, _822, _832);
    float _888 = 1.0 / _804;
    float _890 = abs(_842);
    float _892 = _890 * _884;
    float _894 = abs(_874);
    float _896 = _894 * _884;
    float _898 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _900 = -_167;
    float _902 = fma(_834, _898, _900);
    float _904 = _886 + _830;
    int _906 = _657 + 56;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.fp_c3)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.fp_c3)._m0[int(_918)][_920];
    float _924 = abs(_902);
    float _926 = _924 * _884;
    float _928 = exp2(_892);
    float _930 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _932 = -_167;
    float _934 = fma(_888, _930, _932);
    float _936 = exp2(_896);
    float _938 = abs(_934);
    float _940 = _938 * _884;
    float _942 = exp2(_926);
    float _944 = abs(_878);
    float _946 = _944 * _928;
    float _948 = exp2(_940);
    float _950 = abs(_876);
    float _952 = _950 * _936;
    float _954 = abs(_880);
    float _956 = _954 * _942;
    float _958 = _946 + _952;
    float _960 = _956 + _958;
    float _962 = abs(_882);
    float _964 = _962 * _948;
    float _966 = _964 + _960;
    float _968 = fma(_631, _914, _784);
    float _970 = -_964;
    bool _972 = _960 != _970;
    bool _974 = isnan(_960);
    bool _976 = _972 || _974;
    bool _978 = isnan(_970);
    bool _980 = _976 || _978;
    float _982 = 1.0 / _966;
    float _984 = _968 + _922;
    float _986 = 1.0 / _984;
    float _988 = _952 * _982;
    float _990 = _946 * _982;
    float _992 = _956 * _982;
    float _994 = _964 * _982;
    float _996 = _980 ? _988 : 0.25;
    float _998 = _980 ? _990 : 0.25;
    float _1000 = _848 * _986;
    float _1002 = _980 ? _994 : 0.25;
    float _1004 = _996 * _577;
    float _1006 = _980 ? _992 : 0.25;
    float _1008 = fma(_998, _575, _1004);
    float _1010 = _904 * _986;
    float _1012 = precise::clamp(_1010, 0.0, 1.0);
    float _1014 = fma(_1006, _579, _1008);
    float _1016 = _788 * _986;
    float _1018 = fma(_1002, _581, _1014);
    float _1074;
    if (!_659)
    {
        float _1020 = rint(_651);
        float _1022 = precise::max(_1020, 0.0);
        uint _1024 = uint(_1022);
        uint _1026 = clamp(_1024, 0u, 65535u);
        float _1028 = _1012 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1030 = fma(_1028, 0.5, _1016);
        float _1032 = fma(_1028, 0.5, _1000);
        float _1034 = fma(_1028, -0.5, _1000);
        float _1036 = fma(_1028, -0.5, _1016);
        float3 _2822 = float3(_1000, _1030, float(int(_1026)));
        float3 _2826 = select(_2822, float3(0.0), isnan(_2822));
        float _1038 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2826.xy, uint(rint(_2826.z)), _1012);
        float3 _2835 = float3(_1032, _1030, float(int(_1026)));
        float3 _2837 = select(_2835, float3(0.0), isnan(_2835));
        float _1040 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2837.xy, uint(rint(_2837.z)), _1012);
        float3 _2846 = float3(_1034, _1030, float(int(_1026)));
        float3 _2848 = select(_2846, float3(0.0), isnan(_2846));
        float _1042 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2848.xy, uint(rint(_2848.z)), _1012);
        float3 _2857 = float3(_1032, _1016, float(int(_1026)));
        float3 _2859 = select(_2857, float3(0.0), isnan(_2857));
        float _1044 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2859.xy, uint(rint(_2859.z)), _1012);
        float3 _2868 = float3(_1000, _1016, float(int(_1026)));
        float3 _2870 = select(_2868, float3(0.0), isnan(_2868));
        float _1046 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2870.xy, uint(rint(_2870.z)), _1012);
        float3 _2879 = float3(_1034, _1016, float(int(_1026)));
        float3 _2881 = select(_2879, float3(0.0), isnan(_2879));
        float _1048 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2881.xy, uint(rint(_2881.z)), _1012);
        float3 _2890 = float3(_1032, _1036, float(int(_1026)));
        float3 _2892 = select(_2890, float3(0.0), isnan(_2890));
        float _1050 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2892.xy, uint(rint(_2892.z)), _1012);
        float3 _2901 = float3(_1000, _1036, float(int(_1026)));
        float3 _2903 = select(_2901, float3(0.0), isnan(_2901));
        float _1052 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2903.xy, uint(rint(_2903.z)), _1012);
        float3 _2912 = float3(_1034, _1036, float(int(_1026)));
        float3 _2914 = select(_2912, float3(0.0), isnan(_2912));
        float _1054 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2914.xy, uint(rint(_2914.z)), _1012);
        float _1056 = _1040 + _1038;
        float _1058 = _1056 + _1042;
        float _1060 = _1058 + _1044;
        float _1062 = _1060 + _1046;
        float _1064 = _1062 + _1048;
        float _1066 = _1064 + _1050;
        float _1068 = _1066 + _1052;
        float _1070 = _1068 + _1054;
        float _1072 = _1070 * 0.111111111938953399658203125;
        _1074 = _1072;
        _1076 = true;
    }
    else
    {
        float _1078 = rint(_651);
        float _1080 = precise::max(_1078, 0.0);
        uint _1082 = uint(_1080);
        uint _1084 = clamp(_1082, 0u, 65535u);
        float3 _2961 = float3(_1000, _1016, float(int(_1084)));
        float3 _2963 = select(_2961, float3(0.0), isnan(_2961));
        float _1086 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2963.xy, uint(rint(_2963.z)), _1012);
        _1074 = _1086;
    }
    _1076 = false;
    float _1088 = _1074;
    float _1090 = _544 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1092 = _544 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1094 = -_167;
    float _1096 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1098 = _1094 + _1096;
    float _1100 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1090);
    float _1102 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1092);
    float _1104 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1100);
    float _1106 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1102);
    float _1108 = _1104 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1110 = _1106 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1112 = trunc(_1108);
    int _1114 = int(_1112);
    float _1116 = trunc(_1110);
    int _1118 = int(_1116);
    int _1120 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1122 = _1114 + _1120;
    int _1124 = _1122 + 1;
    bool _1126 = _1124 >= 0;
    int _1128 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1130 = _1118 + _1128;
    int _1132 = _1130 + 1;
    float _1134 = -_167;
    float _1136 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1138 = _1134 + _1136;
    bool _1140 = _1124 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1142 = !_1126;
    bool _1144 = _1140 || _1142;
    bool _1146 = _1132 < 0;
    bool _1148 = _1146 || _1144;
    bool _1150 = _1132 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1152 = _1150 || _1148;
    float _1154 = as_type<float>(_1114);
    if (_1152)
    {
        _1154 = 1.0;
    }
    float _1156 = _1154;
    float _1158 = _1156;
    if (!_1152)
    {
        int _1160 = _1132 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1162 = _1160 + _1124;
        float _1164 = floor(_1110);
        int _1166 = _1162 << 2;
        int _1168 = _1162 >> 2;
        int _1170 = 12 & _1166;
        int _1172 = _1168 << 4;
        int _1174 = _1172 + _1170;
        float _1176 = floor(_1108);
        uint _1178 = uint(int(uint(_1174) >> uint(2)));
        uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
        int _1182 = int(_1178) & 3;
        float _1184 = (*spvDescriptorSet0.fp_c5)._m0[int(_1180)][_1182];
        float _1186 = -_1164;
        float _1188 = _1110 + _1186;
        float _1190 = -_1176;
        float _1192 = _1108 + _1190;
        float _1194 = rint(_1184);
        float _1196 = precise::max(_1194, 0.0);
        uint _1198 = uint(_1196);
        uint _1200 = clamp(_1198, 0u, 65535u);
        float3 _3150 = float3(_1192, _1188, float(int(_1200)));
        float3 _3152 = select(_3150, float3(0.0), isnan(_3150));
        float _1202 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3152.xy, uint(rint(_3152.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3152.xy, uint(rint(_3152.z)), level(0.0)).x;
        int _1204 = _1162 << 4;
        int _1206 = _1204 + 1648;
        int _1208 = _1174 + 8048;
        uint _1210 = uint(int(uint(_1208) >> uint(2)));
        uint _1212 = uint(int(uint(int(_1210)) >> uint(2)));
        int _1214 = int(_1210) & 3;
        float _1216 = (*spvDescriptorSet0.fp_c5)._m0[int(_1212)][_1214];
        uint _1218 = uint(int(uint(_1206) >> uint(2)));
        uint _1220 = uint(int(uint(int(_1218)) >> uint(2)));
        int _1222 = int(_1218) & 3;
        float _1224 = (*spvDescriptorSet0.fp_c5)._m0[int(_1220)][_1222];
        int _1226 = int(_1218) + 1;
        uint _1228 = uint(int(uint(_1226) >> uint(2)));
        int _1230 = _1226 & 3;
        float _1232 = (*spvDescriptorSet0.fp_c5)._m0[int(_1228)][_1230];
        int _1234 = _1206 + 8;
        uint _1236 = uint(int(uint(_1234) >> uint(2)));
        uint _1238 = uint(int(uint(int(_1236)) >> uint(2)));
        int _1240 = int(_1236) & 3;
        float _1242 = (*spvDescriptorSet0.fp_c5)._m0[int(_1238)][_1240];
        int _1244 = int(_1236) + 1;
        uint _1246 = uint(int(uint(_1244) >> uint(2)));
        int _1248 = _1244 & 3;
        float _1250 = (*spvDescriptorSet0.fp_c5)._m0[int(_1246)][_1248];
        float _1252 = _1216 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1254 = _544 * _1232;
        float _1256 = fma(_546, _1224, _1254);
        float _1258 = 1.0 / _1216;
        float _1260 = fma(_548, _1242, _1256);
        float _1262 = _1260 + _1250;
        float _1264 = precise::clamp(_1262, 0.0, 1.0);
        float _1266 = -_1264;
        float _1268 = _1266 + _1202;
        float _1270 = fma(_1258, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1268);
        float _1272 = _1252 * _1270;
        float _1274 = exp2(_1272);
        float _1276 = 0.0 + _1274;
        float _1278 = precise::clamp(_1276, 0.0, 1.0);
        _1158 = _1278;
    }
    float _1280 = _1158;
    float _1282 = precise::min(_1280, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1284 = -_1088;
    float _1286 = _1284 + 1.0;
    float _1288 = _1138 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1290 = precise::clamp(_1288, 0.0, 1.0);
    float _1292 = _1098 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1294 = precise::clamp(_1292, 0.0, 1.0);
    float _1296 = precise::min(_1018, 1.0);
    float _1298 = -_1282;
    float _1300 = _1298 + 1.0;
    float _1302 = fma(_1290, _1286, _1088);
    float _1304 = fma(_1294, _1300, _1282);
    out.m_62.x = _1302;
    out.m_62.y = _1304;
    out.m_62.z = _1296;
    out.m_62.w = 1.0;
    out.m_64.x = _595;
    out.m_64.y = _599;
    out.m_64.z = _601;
    out.m_64.w = 1.0;
    return out;
}

