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
    bool _1130 = false;
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
    float2 _1396 = float2(_89, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1396, float2(0.0), isnan(_1396))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1396, float2(0.0), isnan(_1396))).x;
    float _97 = _91 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1411 = float2(_93, _91);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1411, float2(0.0), isnan(_1411))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1411, float2(0.0), isnan(_1411))).x;
    float2 _1419 = float2(_89, _97);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1419, float2(0.0), isnan(_1419))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1419, float2(0.0), isnan(_1419))).x;
    float _103 = in.m_57.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_57.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_59.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_59.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_61.x;
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
    float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _155 = -_99;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _159 = 1.0 / _153;
    float _161 = -_101;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _165 = 1.0 / _157;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _169 = _159 * _167;
    float _171 = 1.0 / _163;
    float _173 = _169 * _139;
    float _175 = _169 * _141;
    float _177 = _173 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _179 = _173 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _183 = _165 * _181;
    float _185 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[32].x, _177);
    float _187 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[30].x, _179);
    float _189 = -_175;
    float _191 = fma(_183, _143, _189);
    float _193 = -_173;
    float _195 = fma(_183, _145, _193);
    float _197 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[32].z, _185);
    float _199 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[30].z, _187);
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _203 = _171 * _201;
    float _205 = -_169;
    float _207 = _205 + _183;
    float _209 = _197 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _211 = _199 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _213 = -_175;
    float _215 = fma(_203, _147, _213);
    float _217 = -_173;
    float _219 = fma(_203, _149, _217);
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _223 = _209 + _221;
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _227 = _211 + _225;
    float _229 = -_169;
    float _231 = _229 + _203;
    float _233 = _207 * _215;
    float _235 = _223 * _223;
    float _237 = _195 * _231;
    float _239 = -_233;
    float _241 = fma(_191, _231, _239);
    float _243 = fma(_227, _227, _235);
    float _245 = _191 * _219;
    float _247 = -_237;
    float _249 = fma(_207, _219, _247);
    float _251 = _241 * _241;
    float _253 = sqrt(_243);
    float _255 = -_245;
    float _257 = fma(_195, _215, _255);
    float _259 = fma(_249, _249, _251);
    float _261 = _173 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _263 = fma(_257, _257, _259);
    float _265 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[31].x, _261);
    float _267 = rsqrt(_263);
    float _269 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[31].z, _265);
    bool _273 = _253 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _275 = _269 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _277 = _249 * _267;
    float _279 = _241 * _267;
    float _281 = _257 * _267;
    bool _283 = !_273;
    float _285 = _211;
    float _287 = _209;
    float _289 = _275;
    if (!_283)
    {
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _293 = _253 + _291;
        float _295 = _275 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = rsqrt(_243);
        float _299 = -_275;
        float _301 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _303 = _299 + _301;
        float _305 = abs(_295);
        float _307 = abs(_293);
        float _309 = precise::max(_305, _307);
        float _311 = _303 * _303;
        bool _313 = _309 >= 16.0;
        float _315 = _227 * _297;
        float _317 = _223 * _297;
        float _319 = -_227;
        float _321 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[41].z, _319);
        float _323 = -_223;
        float _325 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[41].z, _323);
        float _327 = _293;
        float _329 = _295;
        int _332 = as_type<int>(_325);
        if (_313)
        {
            float _334 = _293 * 0.0625;
            _327 = _334;
        }
        float _336 = _327;
        if (_313)
        {
            float _338 = _295 * 0.0625;
            _329 = _338;
        }
        float _340 = _329;
        float _342 = fma(_321, _321, _311);
        float _344 = abs(_336);
        bool _346 = _344 != 0.0;
        bool _348 = isnan(_344);
        bool _350 = _346 || _348;
        bool _352 = isnan(0.0);
        bool _354 = _350 || _352;
        float _356 = fma(_325, _325, _342);
        float _358 = abs(_340);
        bool _360 = _358 == 0.0;
        float _362 = abs(_340);
        bool _364 = _362 == 0.0;
        bool _366 = !_354;
        bool _368 = _364 && _366;
        float _370 = sqrt(_356);
        bool _372 = false;
        if (_368)
        {
            bool _374 = as_type<int>(_340) >= 0;
            _372 = _374;
        }
        bool _376 = _372;
        int _378 = _376 ? (-1) : 0;
        if (_368)
        {
            int _380 = _376 ? 0 : 1078530011;
            _332 = _380;
        }
        int _382 = _332;
        int _384 = _382;
        if (_368)
        {
            int _386 = int(0x80000000) & as_type<int>(_336);
            int _388 = _382 | _386;
            _384 = _388;
        }
        int _390 = _384;
        bool _392 = !_354;
        bool _394 = _392 && _360;
        int _396 = _390;
        float _398 = as_type<float>(_390);
        if (!_394)
        {
            float _400 = abs(_336);
            bool _402 = _400 != as_type<float>(0x7f800000u /* inf */);
            bool _404 = isnan(_400);
            bool _406 = _402 || _404;
            bool _408 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _410 = _406 || _408;
            float _412 = abs(_340);
            bool _414 = _412 == as_type<float>(0x7f800000u /* inf */);
            float _416 = abs(_340);
            bool _418 = _416 == as_type<float>(0x7f800000u /* inf */);
            bool _420 = !_410;
            bool _422 = _418 && _420;
            if (_422)
            {
                bool _424 = as_type<int>(_340) >= 0;
                _378 = _424 ? (-1) : 0;
            }
            int _426 = _378;
            if (_422)
            {
                _396 = 1075235812;
            }
            int _428 = _396;
            int _430 = _428;
            if (_422)
            {
                int _432 = ~_426;
                int _434 = (_432 != 0) ? _428 : 1061752795;
                _430 = _434;
            }
            int _436 = _430;
            float _438 = as_type<float>(_436);
            if (_422)
            {
                int _440 = int(0x80000000) & as_type<int>(_336);
                int _442 = _436 | _440;
                _438 = as_type<float>(_442);
            }
            float _444 = _438;
            bool _446 = !_410;
            bool _448 = _446 && _414;
            _398 = _444;
            if (!_448)
            {
                float _450 = abs(_336);
                float _452 = abs(_340);
                float _454 = precise::max(_450, _452);
                float _456 = abs(_336);
                float _458 = abs(_340);
                float _460 = precise::min(_456, _458);
                float _462 = 1.0 / _454;
                float _464 = abs(_336);
                float _466 = abs(_340);
                bool _468 = _464 > _466;
                bool _470 = as_type<int>(_340) >= 0;
                float _472 = _460 * _462;
                float _474 = abs(_336);
                float _476 = abs(_340);
                float _478 = _474 + _476;
                int _480 = as_type<int>(_336) & int(0x80000000);
                float _482 = _472 * _472;
                bool _484 = _478 > as_type<float>(0x7f800000u /* inf */);
                bool _486 = isnan(_478);
                bool _488 = _484 || _486;
                bool _490 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _492 = _488 || _490;
                float _494 = _482 + 11.33538818359375;
                float _496 = fma(_482, _494, 28.84246826171875);
                float _498 = fma(_482, _496, 19.6966705322265625);
                float _500 = fma(_482, -0.82336294651031494140625, -5.674867153167724609375);
                float _502 = fma(_482, _500, -6.565555095672607421875);
                float _504 = 1.0 / _498;
                float _506 = _482 * _502;
                float _508 = _472 * _506;
                float _510 = fma(_508, _504, _472);
                float _512 = _510;
                _398 = _478;
                if (_468)
                {
                    float _514 = -_510;
                    float _516 = _514 + 1.57079637050628662109375;
                    _512 = _516;
                }
                float _518 = _512;
                int _520 = as_type<int>(_518);
                if (!_470)
                {
                    float _522 = -_518;
                    float _524 = _522 + 3.1415927410125732421875;
                    _520 = as_type<int>(_524);
                }
                int _526 = _520;
                if (!_492)
                {
                    int _528 = _480 | _526;
                    _398 = as_type<float>(_528);
                }
            }
        }
        float _530 = _398;
        float _532 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _534 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _536 = _370 + _534;
        float _538 = fma(_315, _532, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _540 = fma(_317, _532, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _285 = _538;
        _287 = _540;
        _289 = _536;
    }
    float _542 = _285;
    float _544 = _287;
    float _546 = _289;
    float _548 = fma(_542, 6.2500002968590706586837768554688e-05, 0.5);
    float _550 = fma(_544, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2098 = float2(_548, _550);
    float _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2098, float2(0.0), isnan(_2098))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2098, float2(0.0), isnan(_2098))).x;
    float2 _2106 = float2(_89, _91);
    float4 _555 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2106, float2(0.0), isnan(_2106)), int2(0), component::x).xyzw;
    float _557 = _555.x;
    float _559 = _555.y;
    float _561 = _555.z;
    float _563 = _555.w;
    float2 _2122 = float2(_89, _91);
    float4 _565 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2122, float2(0.0), isnan(_2122)), int2(0), component::w).xyzw;
    float _567 = _565.x;
    float _569 = _565.y;
    float _571 = _565.z;
    float _573 = _565.w;
    float _575 = _279 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _577 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _579 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].x, _575);
    float _581 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float2 _2161 = float2(_548, _550);
    float _583 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2161, float2(0.0), isnan(_2161)), level(_552)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2161, float2(0.0), isnan(_2161)), level(_552)).x;
    float2 _2170 = float2(_577, _581);
    float _585 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2170, float2(0.0), isnan(_2170))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2170, float2(0.0), isnan(_2170))).x;
    float2 _2178 = float2(_89, _91);
    float _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2178, float2(0.0), isnan(_2178))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2178, float2(0.0), isnan(_2178))).x;
    float _589 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[35].z, _579);
    float _591 = -_589;
    float _593 = fma(_591, _589, 1.0);
    float _595 = -_589;
    float _597 = fma(_595, (*spvDescriptorSet0.fp_c3)._m0[35].z, _281);
    float _599 = -_589;
    float _601 = fma(_599, (*spvDescriptorSet0.fp_c3)._m0[35].x, _277);
    float _603 = -_589;
    float _605 = fma(_603, (*spvDescriptorSet0.fp_c3)._m0[35].y, _279);
    float _607 = _593 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _609 = abs(_169);
    float _611 = log2(_609);
    float _613 = fma(_597, _607, _169);
    float _615 = fma(_601, _607, _175);
    float _617 = fma(_605, _607, _173);
    float _619 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _621 = -_613;
    bool _623 = _621 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _625 = float(_623);
    float _627 = -_613;
    bool _629 = _627 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _631 = float(_629);
    float _633 = _625 + _631;
    float _635 = _611 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _637 = precise::min(_633, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _639 = exp2(_635);
    float _641 = trunc(_637);
    int _643 = int(_641);
    int _645 = _643 << 6;
    float _647 = -_557;
    float _649 = fma(_647, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    bool _651 = _643 != 0;
    float _653 = -_559;
    float _655 = fma(_653, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    int _657 = _645 + 16;
    uint _660 = uint(int(uint(_657) >> uint(2)));
    uint _662 = uint(int(uint(int(_660)) >> uint(2)));
    int _664 = int(_660) & 3;
    float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
    int _668 = int(_660) + 1;
    uint _670 = uint(int(uint(_668) >> uint(2)));
    int _672 = _668 & 3;
    float _674 = (*spvDescriptorSet0.fp_c3)._m0[int(_670)][_672];
    float _676 = precise::min(_169, -1.0000000116860974230803549289703e-07);
    float _678 = -_561;
    float _680 = fma(_678, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _682 = 1.0 / _649;
    uint _684 = uint(int(uint(_645) >> uint(2)));
    uint _686 = uint(int(uint(int(_684)) >> uint(2)));
    int _688 = int(_684) & 3;
    float _690 = (*spvDescriptorSet0.fp_c3)._m0[int(_686)][_688];
    int _692 = int(_684) + 1;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    int _696 = _692 & 3;
    float _698 = (*spvDescriptorSet0.fp_c3)._m0[int(_694)][_696];
    float _700 = 1.0 / _680;
    int _702 = _645 + 32;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    uint _706 = uint(int(uint(int(_704)) >> uint(2)));
    int _708 = int(_704) & 3;
    float _710 = (*spvDescriptorSet0.fp_c3)._m0[int(_706)][_708];
    int _712 = int(_704) + 1;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    int _716 = _712 & 3;
    float _718 = (*spvDescriptorSet0.fp_c3)._m0[int(_714)][_716];
    int _720 = _645 + 48;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    uint _724 = uint(int(uint(int(_722)) >> uint(2)));
    int _726 = int(_722) & 3;
    float _728 = (*spvDescriptorSet0.fp_c3)._m0[int(_724)][_726];
    int _730 = int(_722) + 1;
    uint _732 = uint(int(uint(_730) >> uint(2)));
    int _734 = _730 & 3;
    float _736 = (*spvDescriptorSet0.fp_c3)._m0[int(_732)][_734];
    float _738 = _617 * _674;
    float _740 = _617 * _698;
    float _742 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _744 = fma(_615, _666, _738);
    int _746 = _645 + 8;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    uint _750 = uint(int(uint(int(_748)) >> uint(2)));
    int _752 = int(_748) & 3;
    float _754 = (*spvDescriptorSet0.fp_c3)._m0[int(_750)][_752];
    int _756 = int(_748) + 1;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    int _760 = _756 & 3;
    float _762 = (*spvDescriptorSet0.fp_c3)._m0[int(_758)][_760];
    float _764 = fma(_615, _690, _740);
    float _766 = floor(_619);
    float _768 = _617 * _718;
    float _770 = fma(_615, _710, _768);
    int _772 = _645 + 24;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    uint _776 = uint(int(uint(int(_774)) >> uint(2)));
    int _778 = int(_774) & 3;
    float _780 = (*spvDescriptorSet0.fp_c3)._m0[int(_776)][_778];
    int _782 = int(_774) + 1;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    int _786 = _782 & 3;
    float _788 = (*spvDescriptorSet0.fp_c3)._m0[int(_784)][_786];
    float _790 = floor(_742);
    float _792 = _617 * _736;
    float _794 = fma(_615, _728, _792);
    float _796 = -_766;
    float _798 = _619 + _796;
    float _800 = fma(_639, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _802 = precise::clamp(_800, 0.0, 1.0);
    float _804 = _802 * _802;
    float _806 = -_790;
    float _808 = _742 + _806;
    float _810 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _812 = _798 + _810;
    float _814 = fma(_802, -2.0, 3.0);
    float _816 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _818 = _808 + _816;
    float _820 = -_812;
    float _822 = _820 + 1.0;
    float _824 = _804 * _814;
    float _826 = -_818;
    float _828 = _826 + 1.0;
    float _830 = _818 * _812;
    float _832 = _818 * _822;
    float _834 = -_824;
    float _836 = _834 + 1.0;
    float _838 = _812 * _828;
    float _840 = _828 * _822;
    float _842 = fma(_836, (*spvDescriptorSet0.fp_c3)._m0[44].w, _824);
    float _844 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _846 = fma(_613, _754, _764);
    float _848 = -_563;
    float _850 = fma(_848, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _852 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _854 = -_169;
    float _856 = fma(_682, _852, _854);
    float _858 = precise::max(0.0, _844);
    float _860 = _846 + _762;
    float _862 = 1.0 / _850;
    float _864 = _842 * _858;
    int _866 = _645 + 40;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    uint _870 = uint(int(uint(int(_868)) >> uint(2)));
    int _872 = int(_868) & 3;
    float _874 = (*spvDescriptorSet0.fp_c3)._m0[int(_870)][_872];
    int _876 = int(_868) + 1;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    int _880 = _876 & 3;
    float _882 = (*spvDescriptorSet0.fp_c3)._m0[int(_878)][_880];
    float _884 = fma(_613, _780, _744);
    float _886 = 1.0 / _676;
    float _888 = _884 + _788;
    float _890 = 1.0 / _655;
    float _892 = _886 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _894 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _896 = -_169;
    float _898 = fma(_700, _894, _896);
    float _900 = abs(_856);
    float _902 = _900 * _892;
    float _904 = abs(_898);
    float _906 = _904 * _892;
    float _908 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _910 = -_169;
    float _912 = fma(_862, _908, _910);
    float _914 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _916 = -_169;
    float _918 = fma(_890, _914, _916);
    float _920 = exp2(_902);
    float _922 = abs(_918);
    float _924 = _922 * _892;
    float _926 = abs(_912);
    float _928 = _926 * _892;
    int _930 = _645 + 56;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    uint _934 = uint(int(uint(int(_932)) >> uint(2)));
    int _936 = int(_932) & 3;
    float _938 = (*spvDescriptorSet0.fp_c3)._m0[int(_934)][_936];
    int _940 = int(_932) + 1;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    int _944 = _940 & 3;
    float _946 = (*spvDescriptorSet0.fp_c3)._m0[int(_942)][_944];
    float _948 = exp2(_924);
    float _950 = exp2(_906);
    float _952 = fma(_613, _874, _770);
    float _954 = abs(_838);
    float _956 = _954 * _920;
    float _958 = _952 + _882;
    float _960 = exp2(_928);
    float _962 = abs(_830);
    float _964 = _962 * _948;
    bool _966 = _169 >= (-8000.0);
    bool _968 = isnan(_169);
    bool _970 = _966 || _968;
    bool _972 = isnan(-8000.0);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = _956 + _964;
    float _980 = _976 * _864;
    float _982 = abs(_832);
    float _984 = _982 * _950;
    float _986 = _984 + _978;
    float _988 = abs(_840);
    float _990 = _988 * _960;
    float _992 = _990 + _986;
    float _994 = -_990;
    bool _996 = _986 != _994;
    bool _998 = isnan(_986);
    bool _1000 = _996 || _998;
    bool _1002 = isnan(_994);
    bool _1004 = _1000 || _1002;
    float _1006 = 1.0 / _992;
    float _1008 = fma(_613, _938, _794);
    float _1010 = _1008 + _946;
    float _1012 = 1.0 / _1010;
    float _1014 = _964 * _1006;
    float _1016 = _956 * _1006;
    float _1018 = _984 * _1006;
    float _1020 = _990 * _1006;
    float _1022 = _1004 ? _1014 : 0.25;
    float _1024 = _1004 ? _1016 : 0.25;
    float _1026 = _1004 ? _1018 : 0.25;
    float _1028 = _1022 * _569;
    float _1030 = fma(_1024, _567, _1028);
    float _1032 = _980 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1034 = fma(_1026, _571, _1030);
    float _1036 = _1004 ? _1020 : 0.25;
    float _1038 = abs(_583);
    float _1040 = _1038 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1042 = -_585;
    float _1044 = _1042 + 1.0;
    float _1046 = fma(_1036, _573, _1034);
    float _1048 = _888 * _1012;
    float _1050 = -_1040;
    float _1052 = fma(_976, _1050, 1.0);
    float _1054 = _1044 * _1032;
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = _860 * _1012;
    float _1060 = _958 * _1012;
    float _1062 = precise::clamp(_1060, 0.0, 1.0);
    float _1064 = precise::min(_1046, 1.0);
    float _1066 = -_1056;
    float _1068 = fma(_1066, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1070 = precise::min(_1052, 1.0);
    float _1072 = precise::min(_1070, _1068);
    float _1128;
    if (!_651)
    {
        float _1074 = rint(_637);
        float _1076 = precise::max(_1074, 0.0);
        uint _1078 = uint(_1076);
        uint _1080 = clamp(_1078, 0u, 65535u);
        float _1082 = _1062 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1084 = fma(_1082, 0.5, _1048);
        float _1086 = fma(_1082, 0.5, _1058);
        float _1088 = fma(_1082, -0.5, _1058);
        float _1090 = fma(_1082, -0.5, _1048);
        float3 _2961 = float3(_1058, _1084, float(int(_1080)));
        float3 _2965 = select(_2961, float3(0.0), isnan(_2961));
        float _1092 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2965.xy, uint(rint(_2965.z)), _1062);
        float3 _2974 = float3(_1086, _1084, float(int(_1080)));
        float3 _2976 = select(_2974, float3(0.0), isnan(_2974));
        float _1094 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2976.xy, uint(rint(_2976.z)), _1062);
        float3 _2985 = float3(_1088, _1084, float(int(_1080)));
        float3 _2987 = select(_2985, float3(0.0), isnan(_2985));
        float _1096 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2987.xy, uint(rint(_2987.z)), _1062);
        float3 _2996 = float3(_1086, _1048, float(int(_1080)));
        float3 _2998 = select(_2996, float3(0.0), isnan(_2996));
        float _1098 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2998.xy, uint(rint(_2998.z)), _1062);
        float3 _3007 = float3(_1058, _1048, float(int(_1080)));
        float3 _3009 = select(_3007, float3(0.0), isnan(_3007));
        float _1100 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3009.xy, uint(rint(_3009.z)), _1062);
        float3 _3018 = float3(_1088, _1048, float(int(_1080)));
        float3 _3020 = select(_3018, float3(0.0), isnan(_3018));
        float _1102 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3020.xy, uint(rint(_3020.z)), _1062);
        float3 _3029 = float3(_1086, _1090, float(int(_1080)));
        float3 _3031 = select(_3029, float3(0.0), isnan(_3029));
        float _1104 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3031.xy, uint(rint(_3031.z)), _1062);
        float3 _3040 = float3(_1058, _1090, float(int(_1080)));
        float3 _3042 = select(_3040, float3(0.0), isnan(_3040));
        float _1106 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3042.xy, uint(rint(_3042.z)), _1062);
        float3 _3051 = float3(_1088, _1090, float(int(_1080)));
        float3 _3053 = select(_3051, float3(0.0), isnan(_3051));
        float _1108 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3053.xy, uint(rint(_3053.z)), _1062);
        float _1110 = _1094 + _1092;
        float _1112 = _1110 + _1096;
        float _1114 = _1112 + _1098;
        float _1116 = _1114 + _1100;
        float _1118 = _1116 + _1102;
        float _1120 = _1118 + _1104;
        float _1122 = _1120 + _1106;
        float _1124 = _1122 + _1108;
        float _1126 = _1124 * 0.111111111938953399658203125;
        _1128 = _1126;
        _1130 = true;
    }
    else
    {
        float _1132 = rint(_637);
        float _1134 = precise::max(_1132, 0.0);
        uint _1136 = uint(_1134);
        uint _1138 = clamp(_1136, 0u, 65535u);
        float3 _3100 = float3(_1058, _1048, float(int(_1138)));
        float3 _3102 = select(_3100, float3(0.0), isnan(_3100));
        float _1140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3102.xy, uint(rint(_3102.z)), _1062);
        _1128 = _1140;
    }
    _1130 = false;
    float _1142 = _1128;
    float _1144 = _546 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1146 = _546 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1148 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1144);
    float _1150 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1146);
    float _1152 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1148);
    float _1154 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1150);
    float _1156 = _1152 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1158 = _1154 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1160 = -_169;
    float _1162 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1164 = _1160 + _1162;
    float _1166 = trunc(_1156);
    int _1168 = int(_1166);
    float _1170 = trunc(_1158);
    int _1172 = int(_1170);
    int _1174 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1176 = _1168 + _1174;
    int _1178 = _1176 + 1;
    bool _1180 = _1178 >= 0;
    int _1182 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1184 = _1172 + _1182;
    int _1186 = _1184 + 1;
    float _1188 = -_169;
    float _1190 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1192 = _1188 + _1190;
    bool _1194 = _1178 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1196 = !_1180;
    bool _1198 = _1194 || _1196;
    bool _1200 = _1186 < 0;
    bool _1202 = _1200 || _1198;
    bool _1204 = _1186 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1206 = _1204 || _1202;
    float _1208 = as_type<float>(_1168);
    if (_1206)
    {
        _1208 = 1.0;
    }
    float _1210 = _1208;
    float _1212 = _1210;
    if (!_1206)
    {
        int _1214 = _1186 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1216 = _1214 + _1178;
        float _1218 = floor(_1158);
        int _1220 = _1216 << 2;
        int _1222 = _1216 >> 2;
        int _1224 = 12 & _1220;
        float _1226 = floor(_1156);
        int _1228 = _1222 << 4;
        int _1230 = _1228 + _1224;
        uint _1232 = uint(int(uint(_1230) >> uint(2)));
        uint _1234 = uint(int(uint(int(_1232)) >> uint(2)));
        int _1236 = int(_1232) & 3;
        float _1238 = (*spvDescriptorSet0.fp_c5)._m0[int(_1234)][_1236];
        float _1240 = -_1218;
        float _1242 = _1158 + _1240;
        float _1244 = -_1226;
        float _1246 = _1156 + _1244;
        float _1248 = rint(_1238);
        float _1250 = precise::max(_1248, 0.0);
        uint _1252 = uint(_1250);
        uint _1254 = clamp(_1252, 0u, 65535u);
        float3 _3289 = float3(_1246, _1242, float(int(_1254)));
        float3 _3291 = select(_3289, float3(0.0), isnan(_3289));
        float _1256 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3291.xy, uint(rint(_3291.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3291.xy, uint(rint(_3291.z)), level(0.0)).x;
        int _1258 = _1216 << 4;
        int _1260 = _1258 + 1648;
        int _1262 = _1230 + 8048;
        uint _1264 = uint(int(uint(_1262) >> uint(2)));
        uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
        int _1268 = int(_1264) & 3;
        float _1270 = (*spvDescriptorSet0.fp_c5)._m0[int(_1266)][_1268];
        uint _1272 = uint(int(uint(_1260) >> uint(2)));
        uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
        int _1276 = int(_1272) & 3;
        float _1278 = (*spvDescriptorSet0.fp_c5)._m0[int(_1274)][_1276];
        int _1280 = int(_1272) + 1;
        uint _1282 = uint(int(uint(_1280) >> uint(2)));
        int _1284 = _1280 & 3;
        float _1286 = (*spvDescriptorSet0.fp_c5)._m0[int(_1282)][_1284];
        int _1288 = _1260 + 8;
        uint _1290 = uint(int(uint(_1288) >> uint(2)));
        uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
        int _1294 = int(_1290) & 3;
        float _1296 = (*spvDescriptorSet0.fp_c5)._m0[int(_1292)][_1294];
        int _1298 = int(_1290) + 1;
        uint _1300 = uint(int(uint(_1298) >> uint(2)));
        int _1302 = _1298 & 3;
        float _1304 = (*spvDescriptorSet0.fp_c5)._m0[int(_1300)][_1302];
        float _1306 = _1270 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1308 = _546 * _1286;
        float _1310 = 1.0 / _1270;
        float _1312 = fma(_542, _1278, _1308);
        float _1314 = fma(_544, _1296, _1312);
        float _1316 = _1314 + _1304;
        float _1318 = precise::clamp(_1316, 0.0, 1.0);
        float _1320 = -_1318;
        float _1322 = _1320 + _1256;
        float _1324 = fma(_1310, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1322);
        float _1326 = _1306 * _1324;
        float _1328 = exp2(_1326);
        float _1330 = 0.0 + _1328;
        float _1332 = precise::clamp(_1330, 0.0, 1.0);
        _1212 = _1332;
    }
    float _1334 = _1212;
    float _1336 = precise::min(_1334, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1338 = _1192 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1340 = precise::clamp(_1338, 0.0, 1.0);
    float _1342 = _1164 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1344 = precise::clamp(_1342, 0.0, 1.0);
    float _1346 = -_1142;
    float _1348 = _1346 + 1.0;
    float _1350 = -_1336;
    float _1352 = _1350 + 1.0;
    float _1354 = fma(_1340, _1348, _1142);
    float _1356 = fma(_1344, _1352, _1336);
    out.m_64.x = _1354;
    out.m_64.y = _1356;
    out.m_64.z = _1064;
    out.m_64.w = _1072;
    out.m_66.x = _587;
    out.m_66.y = 0.5;
    out.m_66.z = 0.5;
    out.m_66.w = 1.0;
    return out;
}

