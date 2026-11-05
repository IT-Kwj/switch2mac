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
    texture2d<float> fp_t_tcb_1A [[id(7)]];
    sampler fp_t_tcb_1ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_18 [[id(13)]];
    sampler fp_t_tcb_18Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_1C [[id(15)]];
    sampler fp_t_tcb_1CSmplr [[id(16)]];
    texture2d<float> fp_t_tcb_E [[id(17)]];
    sampler fp_t_tcb_ESmplr [[id(18)]];
    texture2d<float> fp_t_tcb_16 [[id(19)]];
    sampler fp_t_tcb_16Smplr [[id(20)]];
    texture2d_array<float> fp_t_tcb_C [[id(21)]];
    sampler fp_t_tcb_CSmplr [[id(22)]];
    texture2d_array<float> fp_t_tcb_10 [[id(23)]];
    sampler fp_t_tcb_10Smplr [[id(24)]];
    sampler fp_t_tcb_8Smplr_w [[id(25)]];
    sampler fp_t_tcb_ASmplr_w [[id(26)]];
    sampler fp_t_tcb_1ASmplr_w [[id(27)]];
    sampler fp_t_tcb_18Smplr_w [[id(28)]];
    sampler fp_t_tcb_1CSmplr_w [[id(29)]];
    sampler fp_t_tcb_ESmplr_w [[id(30)]];
    sampler fp_t_tcb_16Smplr_w [[id(31)]];
    sampler fp_t_tcb_10Smplr_w [[id(32)]];
    constant dm_border_t* dm_border [[id(33)]];
};

struct main0_out
{
    float4 m_68 [[color(0)]];
    float4 m_70 [[color(1)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1152 = false;
    float _77 = gl_FragCoord.w;
    float _79 = in.m_59.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_59.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _77;
    float _93 = _91 * _83;
    float _95 = _91 * _89;
    float _97 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1417 = float2(_93, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1417, float2(0.0), isnan(_1417))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1417, float2(0.0), isnan(_1417))).x;
    float _101 = _95 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1432 = float2(_97, _95);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1432, float2(0.0), isnan(_1432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1432, float2(0.0), isnan(_1432))).x;
    float2 _1440 = float2(_93, _101);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1440, float2(0.0), isnan(_1440))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1440, float2(0.0), isnan(_1440))).x;
    float _107 = in.m_61.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_61.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_63.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_63.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_65.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_65.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _91 * _111;
    float _145 = _91 * _117;
    float _147 = _91 * _123;
    float _149 = _91 * _129;
    float _151 = _91 * _135;
    float _153 = _91 * _141;
    float _155 = -_99;
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _159 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].x, _157);
    float _161 = _159 * _143;
    float _163 = _159 * _145;
    float _165 = -_103;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _169 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[41].x, _167);
    float _171 = _161 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _173 = _161 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _175 = -_163;
    float _177 = fma(_169, _149, _175);
    float _179 = -_161;
    float _181 = fma(_169, _147, _179);
    float _183 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[32].x, _171);
    float _185 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[30].x, _173);
    float _187 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[32].z, _183);
    float _189 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _191 = -_105;
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _195 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[41].x, _193);
    float _197 = -_159;
    float _199 = _197 + _169;
    float _201 = _187 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _203 = _189 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _205 = -_163;
    float _207 = fma(_195, _151, _205);
    float _209 = -_161;
    float _211 = fma(_195, _153, _209);
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _215 = _201 + _213;
    float _217 = -_159;
    float _219 = _217 + _195;
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _223 = _203 + _221;
    float _225 = _199 * _207;
    float _227 = _215 * _215;
    float _229 = _181 * _219;
    float _231 = -_225;
    float _233 = fma(_177, _219, _231);
    float _235 = fma(_223, _223, _227);
    float _237 = _177 * _211;
    float _239 = -_229;
    float _241 = fma(_199, _211, _239);
    float _243 = _233 * _233;
    float _245 = sqrt(_235);
    float _247 = -_237;
    float _249 = fma(_181, _207, _247);
    float _251 = _161 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _253 = fma(_241, _241, _243);
    float _255 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[31].x, _251);
    float _257 = fma(_249, _249, _253);
    float _259 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[31].z, _255);
    float _261 = rsqrt(_257);
    float _263 = _259 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _267 = _245 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _269 = _241 * _261;
    float _271 = _233 * _261;
    float _273 = _249 * _261;
    bool _275 = !_267;
    float _277 = _203;
    float _279 = _201;
    float _281 = _263;
    if (!_275)
    {
        float _283 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _285 = _245 + _283;
        float _287 = _263 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _289 = rsqrt(_235);
        float _291 = -_263;
        float _293 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _295 = _291 + _293;
        float _297 = abs(_287);
        float _299 = abs(_285);
        float _301 = precise::max(_297, _299);
        float _303 = _295 * _295;
        bool _305 = _301 >= 16.0;
        float _307 = _223 * _289;
        float _309 = _215 * _289;
        float _311 = -_223;
        float _313 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[41].z, _311);
        float _315 = -_215;
        float _317 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _315);
        float _319 = _285;
        float _321 = _287;
        int _324 = as_type<int>(_317);
        if (_305)
        {
            float _326 = _285 * 0.0625;
            _319 = _326;
        }
        float _328 = _319;
        if (_305)
        {
            float _330 = _287 * 0.0625;
            _321 = _330;
        }
        float _332 = _321;
        float _334 = fma(_313, _313, _303);
        float _336 = abs(_328);
        bool _338 = _336 != 0.0;
        bool _340 = isnan(_336);
        bool _342 = _338 || _340;
        bool _344 = isnan(0.0);
        bool _346 = _342 || _344;
        float _348 = fma(_317, _317, _334);
        float _350 = abs(_332);
        bool _352 = _350 == 0.0;
        float _354 = abs(_332);
        bool _356 = _354 == 0.0;
        bool _358 = !_346;
        bool _360 = _356 && _358;
        float _362 = sqrt(_348);
        bool _364 = false;
        if (_360)
        {
            bool _366 = as_type<int>(_332) >= 0;
            _364 = _366;
        }
        bool _368 = _364;
        int _370 = _368 ? (-1) : 0;
        if (_360)
        {
            int _372 = _368 ? 0 : 1078530011;
            _324 = _372;
        }
        int _374 = _324;
        int _376 = _374;
        if (_360)
        {
            int _378 = int(0x80000000) & as_type<int>(_328);
            int _380 = _374 | _378;
            _376 = _380;
        }
        int _382 = _376;
        bool _384 = !_346;
        bool _386 = _384 && _352;
        int _388 = _382;
        float _390 = as_type<float>(_382);
        if (!_386)
        {
            float _392 = abs(_328);
            bool _394 = _392 != as_type<float>(0x7f800000u /* inf */);
            bool _396 = isnan(_392);
            bool _398 = _394 || _396;
            bool _400 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _402 = _398 || _400;
            float _404 = abs(_332);
            bool _406 = _404 == as_type<float>(0x7f800000u /* inf */);
            float _408 = abs(_332);
            bool _410 = _408 == as_type<float>(0x7f800000u /* inf */);
            bool _412 = !_402;
            bool _414 = _410 && _412;
            if (_414)
            {
                bool _416 = as_type<int>(_332) >= 0;
                _370 = _416 ? (-1) : 0;
            }
            int _418 = _370;
            if (_414)
            {
                _388 = 1075235812;
            }
            int _420 = _388;
            int _422 = _420;
            if (_414)
            {
                int _424 = ~_418;
                int _426 = (_424 != 0) ? _420 : 1061752795;
                _422 = _426;
            }
            int _428 = _422;
            float _430 = as_type<float>(_428);
            if (_414)
            {
                int _432 = int(0x80000000) & as_type<int>(_328);
                int _434 = _428 | _432;
                _430 = as_type<float>(_434);
            }
            float _436 = _430;
            bool _438 = !_402;
            bool _440 = _438 && _406;
            _390 = _436;
            if (!_440)
            {
                float _442 = abs(_328);
                float _444 = abs(_332);
                float _446 = precise::max(_442, _444);
                float _448 = abs(_328);
                float _450 = abs(_332);
                float _452 = precise::min(_448, _450);
                float _454 = 1.0 / _446;
                float _456 = abs(_328);
                float _458 = abs(_332);
                bool _460 = _456 > _458;
                bool _462 = as_type<int>(_332) >= 0;
                float _464 = _452 * _454;
                float _466 = abs(_328);
                float _468 = abs(_332);
                float _470 = _466 + _468;
                int _472 = as_type<int>(_328) & int(0x80000000);
                float _474 = _464 * _464;
                bool _476 = _470 > as_type<float>(0x7f800000u /* inf */);
                bool _478 = isnan(_470);
                bool _480 = _476 || _478;
                bool _482 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _484 = _480 || _482;
                float _486 = _474 + 11.33538818359375;
                float _488 = fma(_474, _486, 28.84246826171875);
                float _490 = fma(_474, _488, 19.6966705322265625);
                float _492 = fma(_474, -0.82336294651031494140625, -5.674867153167724609375);
                float _494 = fma(_474, _492, -6.565555095672607421875);
                float _496 = 1.0 / _490;
                float _498 = _474 * _494;
                float _500 = _464 * _498;
                float _502 = fma(_500, _496, _464);
                float _504 = _502;
                _390 = _470;
                if (_460)
                {
                    float _506 = -_502;
                    float _508 = _506 + 1.57079637050628662109375;
                    _504 = _508;
                }
                float _510 = _504;
                int _512 = as_type<int>(_510);
                if (!_462)
                {
                    float _514 = -_510;
                    float _516 = _514 + 3.1415927410125732421875;
                    _512 = as_type<int>(_516);
                }
                int _518 = _512;
                if (!_484)
                {
                    int _520 = _472 | _518;
                    _390 = as_type<float>(_520);
                }
            }
        }
        float _522 = _390;
        float _524 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _526 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _528 = _362 + _526;
        float _530 = fma(_307, _524, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _532 = fma(_309, _524, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _277 = _530;
        _279 = _532;
        _281 = _528;
    }
    float _534 = _277;
    float _536 = _279;
    float _538 = _281;
    float2 _2101 = float2(_93, _95);
    float2 _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2101, float2(0.0), isnan(_2101))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2101, float2(0.0), isnan(_2101))).xy;
    float _544 = _542.x;
    float _546 = _542.y;
    float _548 = fma(_534, 6.2500002968590706586837768554688e-05, 0.5);
    float _550 = fma(_536, 6.2500002968590706586837768554688e-05, 0.5);
    float _552 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _93);
    float _554 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _95);
    float2 _2127 = float2(_548, _550);
    float _556 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2127, float2(0.0), isnan(_2127))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2127, float2(0.0), isnan(_2127))).x;
    float2 _2135 = float2(_552, _554);
    float4 _559 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2135, float2(0.0), isnan(_2135)), int2(0), component::x).xyzw;
    float _561 = _559.x;
    float _563 = _559.y;
    float _565 = _559.z;
    float _567 = _559.w;
    float2 _2151 = float2(_552, _554);
    float4 _569 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2151, float2(0.0), isnan(_2151)), int2(0), component::w).xyzw;
    float _571 = _569.x;
    float _573 = _569.y;
    float _575 = _569.z;
    float _577 = _569.w;
    float _579 = _271 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _581 = fma(_534, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _583 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[35].x, _579);
    float _585 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _587 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].z, _583);
    float _589 = -_587;
    float _591 = fma(_589, _587, 1.0);
    float _593 = -_587;
    float _595 = fma(_593, (*spvDescriptorSet0.fp_c3)._m0[35].z, _273);
    float _597 = _591 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _599 = fma(_595, _597, _159);
    float _601 = fma(_544, 2.0, -1.0);
    float _603 = fma(_546, 2.0, -1.0);
    float _605 = _601 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _607 = _603 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _609 = fma(_605, 2.0, _93);
    float2 _2232 = float2(_548, _550);
    float _611 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2232, float2(0.0), isnan(_2232)), level(_556)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2232, float2(0.0), isnan(_2232)), level(_556)).x;
    float2 _2241 = float2(_581, _585);
    float _613 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2241, float2(0.0), isnan(_2241))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2241, float2(0.0), isnan(_2241))).x;
    float _615 = fma(_607, 2.0, _95);
    float2 _2252 = float2(_609, _615);
    float _617 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2252, float2(0.0), isnan(_2252))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2252, float2(0.0), isnan(_2252))).x;
    float2 _2260 = float2(_609, _615);
    float2 _619 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2260, float2(0.0), isnan(_2260))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2260, float2(0.0), isnan(_2260))).yz;
    float _621 = _619.x;
    float _623 = _619.y;
    float _625 = -_599;
    bool _627 = _625 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _629 = float(_627);
    float _631 = -_587;
    float _633 = fma(_631, (*spvDescriptorSet0.fp_c3)._m0[35].x, _269);
    float _635 = -_599;
    bool _637 = _635 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _639 = float(_637);
    float _641 = -_587;
    float _643 = fma(_641, (*spvDescriptorSet0.fp_c3)._m0[35].y, _271);
    float _645 = abs(_159);
    float _647 = log2(_645);
    float _649 = fma(_633, _597, _163);
    float _651 = _95 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _653 = _629 + _639;
    float _655 = precise::min(_653, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _657 = fma(_643, _597, _161);
    float _659 = floor(_651);
    float _661 = trunc(_655);
    int _663 = int(_661);
    float _665 = -_659;
    float _667 = _651 + _665;
    float _669 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _671 = _667 + _669;
    int _673 = _663 << 6;
    bool _675 = _663 != 0;
    int _677 = _673 + 16;
    uint _680 = uint(int(uint(_677) >> uint(2)));
    uint _682 = uint(int(uint(int(_680)) >> uint(2)));
    int _684 = int(_680) & 3;
    float _686 = (*spvDescriptorSet0.fp_c3)._m0[int(_682)][_684];
    int _688 = int(_680) + 1;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    int _692 = _688 & 3;
    float _694 = (*spvDescriptorSet0.fp_c3)._m0[int(_690)][_692];
    float _696 = -_561;
    float _698 = fma(_696, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _700 = -_563;
    float _702 = fma(_700, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    uint _704 = uint(int(uint(_673) >> uint(2)));
    uint _706 = uint(int(uint(int(_704)) >> uint(2)));
    int _708 = int(_704) & 3;
    float _710 = (*spvDescriptorSet0.fp_c3)._m0[int(_706)][_708];
    int _712 = int(_704) + 1;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    int _716 = _712 & 3;
    float _718 = (*spvDescriptorSet0.fp_c3)._m0[int(_714)][_716];
    float _720 = -_565;
    float _722 = fma(_720, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _724 = -_567;
    float _726 = fma(_724, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _728 = 1.0 / _698;
    int _730 = _673 + 32;
    uint _732 = uint(int(uint(_730) >> uint(2)));
    uint _734 = uint(int(uint(int(_732)) >> uint(2)));
    int _736 = int(_732) & 3;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[int(_734)][_736];
    int _740 = int(_732) + 1;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    int _744 = _740 & 3;
    float _746 = (*spvDescriptorSet0.fp_c3)._m0[int(_742)][_744];
    float _748 = 1.0 / _722;
    int _750 = _673 + 48;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.fp_c3)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.fp_c3)._m0[int(_762)][_764];
    float _768 = 1.0 / _726;
    float _770 = _657 * _694;
    float _772 = fma(_649, _686, _770);
    float _774 = _647 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _776 = _657 * _718;
    float _778 = exp2(_774);
    float _780 = fma(_649, _710, _776);
    float _782 = _657 * _746;
    float _784 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _786 = fma(_649, _738, _782);
    int _788 = _673 + 8;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    uint _792 = uint(int(uint(int(_790)) >> uint(2)));
    int _794 = int(_790) & 3;
    float _796 = (*spvDescriptorSet0.fp_c3)._m0[int(_792)][_794];
    int _798 = int(_790) + 1;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    int _802 = _798 & 3;
    float _804 = (*spvDescriptorSet0.fp_c3)._m0[int(_800)][_802];
    float _806 = _657 * _766;
    float _808 = floor(_784);
    float _810 = fma(_649, _758, _806);
    float _812 = fma(_778, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _814 = precise::clamp(_812, 0.0, 1.0);
    int _816 = _673 + 24;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.fp_c3)._m0[int(_820)][_822];
    int _826 = int(_818) + 1;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    int _830 = _826 & 3;
    float _832 = (*spvDescriptorSet0.fp_c3)._m0[int(_828)][_830];
    float _834 = fma(_814, -2.0, 3.0);
    float _836 = _814 * _814;
    float _838 = -_808;
    float _840 = _784 + _838;
    float _842 = _836 * _834;
    float _844 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _846 = _840 + _844;
    float _848 = -_671;
    float _850 = _848 + 1.0;
    float _852 = -_846;
    float _854 = _852 + 1.0;
    float _856 = _846 * _671;
    float _858 = _846 * _850;
    float _860 = _671 * _854;
    float _862 = _854 * _850;
    float _864 = -_842;
    float _866 = _864 + 1.0;
    float _868 = fma(_866, (*spvDescriptorSet0.fp_c3)._m0[44].w, _842);
    float _870 = fma(_599, _796, _780);
    float _872 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _874 = precise::max(0.0, _872);
    float _876 = _868 * _874;
    float _878 = precise::min(_159, -1.0000000116860974230803549289703e-07);
    float _880 = fma(_599, _824, _772);
    float _882 = _870 + _804;
    int _884 = _673 + 40;
    uint _886 = uint(int(uint(_884) >> uint(2)));
    uint _888 = uint(int(uint(int(_886)) >> uint(2)));
    int _890 = int(_886) & 3;
    float _892 = (*spvDescriptorSet0.fp_c3)._m0[int(_888)][_890];
    int _894 = int(_886) + 1;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    int _898 = _894 & 3;
    float _900 = (*spvDescriptorSet0.fp_c3)._m0[int(_896)][_898];
    float _902 = _880 + _832;
    float _904 = 1.0 / _702;
    float _906 = 1.0 / _878;
    float _908 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _910 = -_159;
    float _912 = fma(_748, _908, _910);
    float _914 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _916 = -_159;
    float _918 = fma(_728, _914, _916);
    float _920 = _906 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _922 = abs(_918);
    float _924 = _922 * _920;
    float _926 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _928 = -_159;
    float _930 = fma(_904, _926, _928);
    float _932 = exp2(_924);
    float _934 = abs(_930);
    float _936 = _934 * _920;
    float _938 = abs(_912);
    float _940 = _938 * _920;
    float _942 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _944 = -_159;
    float _946 = fma(_768, _942, _944);
    int _948 = _673 + 56;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.fp_c3)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.fp_c3)._m0[int(_960)][_962];
    float _966 = abs(_946);
    float _968 = _966 * _920;
    float _970 = exp2(_936);
    float _972 = fma(_599, _892, _786);
    float _974 = exp2(_940);
    float _976 = abs(_860);
    float _978 = _976 * _932;
    float _980 = _972 + _900;
    float _982 = exp2(_968);
    float _984 = abs(_856);
    float _986 = _984 * _970;
    float _988 = abs(_858);
    float _990 = _988 * _974;
    float _992 = _978 + _986;
    bool _994 = _159 >= (-8000.0);
    bool _996 = isnan(_159);
    bool _998 = _994 || _996;
    bool _1000 = isnan(-8000.0);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = _1004 * _876;
    float _1008 = abs(_862);
    float _1010 = _1008 * _982;
    float _1012 = _990 + _992;
    float _1014 = _1010 + _1012;
    float _1016 = -_1010;
    bool _1018 = _1012 != _1016;
    bool _1020 = isnan(_1012);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(_1016);
    bool _1026 = _1022 || _1024;
    float _1028 = 1.0 / _1014;
    float _1030 = fma(_599, _956, _810);
    float _1032 = _1030 + _964;
    float _1034 = _986 * _1028;
    float _1036 = _978 * _1028;
    float _1038 = _990 * _1028;
    float _1040 = _1010 * _1028;
    float _1042 = _1026 ? _1034 : 0.25;
    float _1044 = _1026 ? _1038 : 0.25;
    float _1046 = _1026 ? _1040 : 0.25;
    float _1048 = _1042 * _573;
    float _1050 = _1026 ? _1036 : 0.25;
    float _1052 = 1.0 / _1032;
    float _1054 = abs(_611);
    float _1056 = _1054 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1058 = -_613;
    float _1060 = _1058 + 1.0;
    float _1062 = fma(_1050, _571, _1048);
    float _1064 = _1006 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1066 = -_1056;
    float _1068 = fma(_1004, _1066, 1.0);
    float _1070 = fma(_1044, _575, _1062);
    float _1072 = _1060 * _1064;
    float _1074 = precise::clamp(_1072, 0.0, 1.0);
    float _1076 = fma(_1046, _577, _1070);
    float _1078 = -_1074;
    float _1080 = fma(_1078, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1082 = precise::min(_1068, 1.0);
    float _1084 = _902 * _1052;
    float _1086 = _882 * _1052;
    float _1088 = _980 * _1052;
    float _1090 = precise::clamp(_1088, 0.0, 1.0);
    float _1092 = precise::min(_1082, _1080);
    float _1094 = precise::min(_1076, 1.0);
    float _1150;
    if (!_675)
    {
        float _1096 = rint(_655);
        float _1098 = precise::max(_1096, 0.0);
        uint _1100 = uint(_1098);
        uint _1102 = clamp(_1100, 0u, 65535u);
        float _1104 = _1090 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1106 = fma(_1104, 0.5, _1084);
        float _1108 = fma(_1104, 0.5, _1086);
        float _1110 = fma(_1104, -0.5, _1086);
        float _1112 = fma(_1104, -0.5, _1084);
        float3 _3022 = float3(_1086, _1106, float(int(_1102)));
        float3 _3026 = select(_3022, float3(0.0), isnan(_3022));
        float _1114 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3026.xy, uint(rint(_3026.z)), _1090);
        float3 _3035 = float3(_1108, _1106, float(int(_1102)));
        float3 _3037 = select(_3035, float3(0.0), isnan(_3035));
        float _1116 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3037.xy, uint(rint(_3037.z)), _1090);
        float3 _3046 = float3(_1110, _1106, float(int(_1102)));
        float3 _3048 = select(_3046, float3(0.0), isnan(_3046));
        float _1118 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3048.xy, uint(rint(_3048.z)), _1090);
        float3 _3057 = float3(_1108, _1084, float(int(_1102)));
        float3 _3059 = select(_3057, float3(0.0), isnan(_3057));
        float _1120 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3059.xy, uint(rint(_3059.z)), _1090);
        float3 _3068 = float3(_1086, _1084, float(int(_1102)));
        float3 _3070 = select(_3068, float3(0.0), isnan(_3068));
        float _1122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3070.xy, uint(rint(_3070.z)), _1090);
        float3 _3079 = float3(_1110, _1084, float(int(_1102)));
        float3 _3081 = select(_3079, float3(0.0), isnan(_3079));
        float _1124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3081.xy, uint(rint(_3081.z)), _1090);
        float3 _3090 = float3(_1108, _1112, float(int(_1102)));
        float3 _3092 = select(_3090, float3(0.0), isnan(_3090));
        float _1126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3092.xy, uint(rint(_3092.z)), _1090);
        float3 _3101 = float3(_1086, _1112, float(int(_1102)));
        float3 _3103 = select(_3101, float3(0.0), isnan(_3101));
        float _1128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3103.xy, uint(rint(_3103.z)), _1090);
        float3 _3112 = float3(_1110, _1112, float(int(_1102)));
        float3 _3114 = select(_3112, float3(0.0), isnan(_3112));
        float _1130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3114.xy, uint(rint(_3114.z)), _1090);
        float _1132 = _1116 + _1114;
        float _1134 = _1132 + _1118;
        float _1136 = _1134 + _1120;
        float _1138 = _1136 + _1122;
        float _1140 = _1138 + _1124;
        float _1142 = _1140 + _1126;
        float _1144 = _1142 + _1128;
        float _1146 = _1144 + _1130;
        float _1148 = _1146 * 0.111111111938953399658203125;
        _1150 = _1148;
        _1152 = true;
    }
    else
    {
        float _1154 = rint(_655);
        float _1156 = precise::max(_1154, 0.0);
        uint _1158 = uint(_1156);
        uint _1160 = clamp(_1158, 0u, 65535u);
        float3 _3161 = float3(_1086, _1084, float(int(_1160)));
        float3 _3163 = select(_3161, float3(0.0), isnan(_3161));
        float _1162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3163.xy, uint(rint(_3163.z)), _1090);
        _1150 = _1162;
    }
    _1152 = false;
    float _1164 = _1150;
    float _1166 = _538 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1168 = _538 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1170 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1166);
    float _1172 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1168);
    float _1174 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1170);
    float _1176 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1172);
    float _1178 = _1174 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1180 = _1176 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1182 = -_159;
    float _1184 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1186 = _1182 + _1184;
    float _1188 = trunc(_1178);
    int _1190 = int(_1188);
    float _1192 = trunc(_1180);
    int _1194 = int(_1192);
    int _1196 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1198 = _1190 + _1196;
    int _1200 = _1198 + 1;
    bool _1202 = _1200 >= 0;
    int _1204 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1206 = _1194 + _1204;
    int _1208 = _1206 + 1;
    float _1210 = -_159;
    float _1212 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1214 = _1210 + _1212;
    bool _1216 = _1200 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1218 = !_1202;
    bool _1220 = _1216 || _1218;
    bool _1222 = _1208 < 0;
    bool _1224 = _1222 || _1220;
    bool _1226 = _1208 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1228 = _1226 || _1224;
    float _1230 = as_type<float>(_1190);
    if (_1228)
    {
        _1230 = 1.0;
    }
    float _1232 = _1230;
    float _1234 = _1232;
    if (!_1228)
    {
        int _1236 = _1208 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1238 = _1236 + _1200;
        float _1240 = floor(_1180);
        int _1242 = _1238 << 2;
        int _1244 = _1238 >> 2;
        int _1246 = 12 & _1242;
        float _1248 = floor(_1178);
        int _1250 = _1244 << 4;
        int _1252 = _1250 + _1246;
        uint _1254 = uint(int(uint(_1252) >> uint(2)));
        uint _1256 = uint(int(uint(int(_1254)) >> uint(2)));
        int _1258 = int(_1254) & 3;
        float _1260 = (*spvDescriptorSet0.fp_c5)._m0[int(_1256)][_1258];
        float _1262 = -_1240;
        float _1264 = _1180 + _1262;
        float _1266 = -_1248;
        float _1268 = _1178 + _1266;
        float _1270 = rint(_1260);
        float _1272 = precise::max(_1270, 0.0);
        uint _1274 = uint(_1272);
        uint _1276 = clamp(_1274, 0u, 65535u);
        float3 _3350 = float3(_1268, _1264, float(int(_1276)));
        float3 _3352 = select(_3350, float3(0.0), isnan(_3350));
        float _1278 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3352.xy, uint(rint(_3352.z)), level(0.0)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3352.xy, uint(rint(_3352.z)), level(0.0)).x;
        int _1280 = _1238 << 4;
        int _1282 = _1280 + 1648;
        int _1284 = _1252 + 8048;
        uint _1286 = uint(int(uint(_1284) >> uint(2)));
        uint _1288 = uint(int(uint(int(_1286)) >> uint(2)));
        int _1290 = int(_1286) & 3;
        float _1292 = (*spvDescriptorSet0.fp_c5)._m0[int(_1288)][_1290];
        uint _1294 = uint(int(uint(_1282) >> uint(2)));
        uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
        int _1298 = int(_1294) & 3;
        float _1300 = (*spvDescriptorSet0.fp_c5)._m0[int(_1296)][_1298];
        int _1302 = int(_1294) + 1;
        uint _1304 = uint(int(uint(_1302) >> uint(2)));
        int _1306 = _1302 & 3;
        float _1308 = (*spvDescriptorSet0.fp_c5)._m0[int(_1304)][_1306];
        int _1310 = _1282 + 8;
        uint _1312 = uint(int(uint(_1310) >> uint(2)));
        uint _1314 = uint(int(uint(int(_1312)) >> uint(2)));
        int _1316 = int(_1312) & 3;
        float _1318 = (*spvDescriptorSet0.fp_c5)._m0[int(_1314)][_1316];
        int _1320 = int(_1312) + 1;
        uint _1322 = uint(int(uint(_1320) >> uint(2)));
        int _1324 = _1320 & 3;
        float _1326 = (*spvDescriptorSet0.fp_c5)._m0[int(_1322)][_1324];
        float _1328 = _1292 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1330 = _538 * _1308;
        float _1332 = 1.0 / _1292;
        float _1334 = fma(_534, _1300, _1330);
        float _1336 = fma(_536, _1318, _1334);
        float _1338 = _1336 + _1326;
        float _1340 = precise::clamp(_1338, 0.0, 1.0);
        float _1342 = -_1340;
        float _1344 = _1342 + _1278;
        float _1346 = fma(_1332, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1344);
        float _1348 = _1328 * _1346;
        float _1350 = exp2(_1348);
        float _1352 = 0.0 + _1350;
        float _1354 = precise::clamp(_1352, 0.0, 1.0);
        _1234 = _1354;
    }
    float _1356 = _1234;
    float _1358 = precise::min(_1356, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1360 = -_1164;
    float _1362 = _1360 + 1.0;
    float _1364 = _1214 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1366 = precise::clamp(_1364, 0.0, 1.0);
    float _1368 = _1186 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1370 = precise::clamp(_1368, 0.0, 1.0);
    float _1372 = -_1358;
    float _1374 = _1372 + 1.0;
    float _1376 = fma(_1366, _1362, _1164);
    float _1378 = fma(_1370, _1374, _1358);
    out.m_68.x = _1376;
    out.m_68.y = _1378;
    out.m_68.z = _1094;
    out.m_68.w = _1092;
    out.m_70.x = _617;
    out.m_70.y = _621;
    out.m_70.z = _623;
    out.m_70.w = 1.0;
    return out;
}

