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
    texture2d<float> fp_t_tcb_18 [[id(7)]];
    sampler fp_t_tcb_18Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_16 [[id(11)]];
    sampler fp_t_tcb_16Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_1A [[id(15)]];
    sampler fp_t_tcb_1ASmplr [[id(16)]];
    texture2d<float> fp_t_tcb_14 [[id(17)]];
    sampler fp_t_tcb_14Smplr [[id(18)]];
    texture2d_array<float> fp_t_tcb_C [[id(19)]];
    sampler fp_t_tcb_CSmplr [[id(20)]];
    texture2d_array<float> fp_t_tcb_E [[id(21)]];
    sampler fp_t_tcb_ESmplr [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_ASmplr_w [[id(24)]];
    sampler fp_t_tcb_18Smplr_w [[id(25)]];
    sampler fp_t_tcb_16Smplr_w [[id(26)]];
    sampler fp_t_tcb_1ASmplr_w [[id(27)]];
    sampler fp_t_tcb_14Smplr_w [[id(28)]];
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
    bool _1160 = false;
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
    float2 _1423 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1423, float2(0.0), isnan(_1423))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1423, float2(0.0), isnan(_1423))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1438 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1438, float2(0.0), isnan(_1438))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1438, float2(0.0), isnan(_1438))).x;
    float2 _1446 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1446, float2(0.0), isnan(_1446))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1446, float2(0.0), isnan(_1446))).x;
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
    float _147 = _89 * _127;
    float _149 = _89 * _133;
    float _151 = _89 * _139;
    float _153 = -_97;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].x, _155);
    float _159 = _157 * _141;
    float _161 = _157 * _143;
    float _163 = _159 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _165 = -_101;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _169 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[41].x, _167);
    float _171 = _159 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _173 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[32].x, _163);
    float _175 = -_103;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _179 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[41].x, _177);
    float _181 = -_161;
    float _183 = fma(_169, _145, _181);
    float _185 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[30].x, _171);
    float _187 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].z, _173);
    float _189 = -_159;
    float _191 = fma(_169, _147, _189);
    float _193 = -_157;
    float _195 = _193 + _169;
    float _197 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _199 = _187 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _201 = -_161;
    float _203 = fma(_179, _149, _201);
    float _205 = -_159;
    float _207 = fma(_179, _151, _205);
    float _209 = _197 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _213 = _199 + _211;
    float _215 = -_157;
    float _217 = _215 + _179;
    float _219 = _195 * _203;
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _223 = _209 + _221;
    float _225 = _213 * _213;
    float _227 = _191 * _217;
    float _229 = -_219;
    float _231 = fma(_183, _217, _229);
    float _233 = _183 * _207;
    float _235 = fma(_223, _223, _225);
    float _237 = -_227;
    float _239 = fma(_195, _207, _237);
    float _241 = _231 * _231;
    float _243 = -_233;
    float _245 = fma(_191, _203, _243);
    float _247 = sqrt(_235);
    float _249 = _159 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _251 = fma(_239, _239, _241);
    float _253 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[31].x, _249);
    float _255 = fma(_245, _245, _251);
    float _257 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].z, _253);
    float _259 = rsqrt(_255);
    float _261 = _257 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _265 = _247 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _267 = _239 * _259;
    float _269 = _231 * _259;
    float _271 = _245 * _259;
    float _273 = _245;
    float _275 = _199;
    float _277 = _261;
    float _279 = _157;
    if (!_265)
    {
        _273 = _209;
    }
    float _281 = _273;
    bool _283 = !_265;
    float _285 = _281;
    if (!_283)
    {
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _289 = _247 + _287;
        float _291 = _261 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = rsqrt(_235);
        float _295 = -_261;
        float _297 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = _295 + _297;
        float _301 = abs(_291);
        float _303 = abs(_289);
        float _305 = precise::max(_301, _303);
        float _307 = _299 * _299;
        bool _309 = _305 >= 16.0;
        float _311 = _223 * _293;
        float _313 = _213 * _293;
        float _315 = -_223;
        float _317 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[41].z, _315);
        float _319 = -_213;
        float _321 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[41].z, _319);
        float _323 = _289;
        float _325 = _291;
        int _328 = as_type<int>(_321);
        if (_309)
        {
            float _330 = _289 * 0.0625;
            _323 = _330;
        }
        float _332 = _323;
        if (_309)
        {
            float _334 = _291 * 0.0625;
            _325 = _334;
        }
        float _336 = _325;
        float _338 = fma(_317, _317, _307);
        float _340 = abs(_332);
        bool _342 = _340 != 0.0;
        bool _344 = isnan(_340);
        bool _346 = _342 || _344;
        bool _348 = isnan(0.0);
        bool _350 = _346 || _348;
        float _352 = fma(_321, _321, _338);
        float _354 = abs(_336);
        bool _356 = _354 == 0.0;
        float _358 = abs(_336);
        bool _360 = _358 == 0.0;
        bool _362 = !_350;
        bool _364 = _360 && _362;
        float _366 = sqrt(_352);
        bool _368 = false;
        if (_364)
        {
            bool _370 = as_type<int>(_336) >= 0;
            _368 = _370;
        }
        bool _372 = _368;
        int _374 = _372 ? (-1) : 0;
        if (_364)
        {
            int _376 = _372 ? 0 : 1078530011;
            _328 = _376;
        }
        int _378 = _328;
        int _380 = _378;
        if (_364)
        {
            int _382 = int(0x80000000) & as_type<int>(_332);
            int _384 = _378 | _382;
            _380 = _384;
        }
        int _386 = _380;
        bool _388 = !_350;
        bool _390 = _388 && _356;
        int _392 = _386;
        float _394 = as_type<float>(_386);
        if (!_390)
        {
            float _396 = abs(_332);
            bool _398 = _396 != as_type<float>(0x7f800000u /* inf */);
            bool _400 = isnan(_396);
            bool _402 = _398 || _400;
            bool _404 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _406 = _402 || _404;
            float _408 = abs(_336);
            bool _410 = _408 == as_type<float>(0x7f800000u /* inf */);
            float _412 = abs(_336);
            bool _414 = _412 == as_type<float>(0x7f800000u /* inf */);
            bool _416 = !_406;
            bool _418 = _414 && _416;
            if (_418)
            {
                bool _420 = as_type<int>(_336) >= 0;
                _374 = _420 ? (-1) : 0;
            }
            int _422 = _374;
            if (_418)
            {
                _392 = 1075235812;
            }
            int _424 = _392;
            int _426 = _424;
            if (_418)
            {
                int _428 = ~_422;
                int _430 = (_428 != 0) ? _424 : 1061752795;
                _426 = _430;
            }
            int _432 = _426;
            float _434 = as_type<float>(_432);
            if (_418)
            {
                int _436 = int(0x80000000) & as_type<int>(_332);
                int _438 = _432 | _436;
                _434 = as_type<float>(_438);
            }
            float _440 = _434;
            bool _442 = !_406;
            bool _444 = _442 && _410;
            _394 = _440;
            if (!_444)
            {
                float _446 = abs(_332);
                float _448 = abs(_336);
                float _450 = precise::max(_446, _448);
                float _452 = abs(_332);
                float _454 = abs(_336);
                float _456 = precise::min(_452, _454);
                float _458 = 1.0 / _450;
                float _460 = abs(_332);
                float _462 = abs(_336);
                bool _464 = _460 > _462;
                bool _466 = as_type<int>(_336) >= 0;
                float _468 = _456 * _458;
                float _470 = abs(_332);
                float _472 = abs(_336);
                float _474 = _470 + _472;
                int _476 = as_type<int>(_332) & int(0x80000000);
                float _478 = _468 * _468;
                bool _480 = _474 > as_type<float>(0x7f800000u /* inf */);
                bool _482 = isnan(_474);
                bool _484 = _480 || _482;
                bool _486 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _488 = _484 || _486;
                float _490 = _478 + 11.33538818359375;
                float _492 = fma(_478, _490, 28.84246826171875);
                float _494 = fma(_478, _492, 19.6966705322265625);
                float _496 = fma(_478, -0.82336294651031494140625, -5.674867153167724609375);
                float _498 = fma(_478, _496, -6.565555095672607421875);
                float _500 = 1.0 / _494;
                float _502 = _478 * _498;
                float _504 = _468 * _502;
                float _506 = fma(_504, _500, _468);
                float _508 = _506;
                _394 = _474;
                if (_464)
                {
                    float _510 = -_506;
                    float _512 = _510 + 1.57079637050628662109375;
                    _508 = _512;
                }
                float _514 = _508;
                int _516 = as_type<int>(_514);
                if (!_466)
                {
                    float _518 = -_514;
                    float _520 = _518 + 3.1415927410125732421875;
                    _516 = as_type<int>(_520);
                }
                int _522 = _516;
                if (!_488)
                {
                    int _524 = _476 | _522;
                    _394 = as_type<float>(_524);
                }
            }
        }
        float _526 = _394;
        float _528 = fma(_526, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _530 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _532 = _366 + _530;
        float _534 = fma(_311, _528, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _536 = fma(_313, _528, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _285 = _534;
        _275 = _536;
        _277 = _532;
    }
    float _538 = _285;
    float _540 = _275;
    float _542 = _277;
    float2 _2115 = float2(_91, _93);
    float2 _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2115, float2(0.0), isnan(_2115))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2115, float2(0.0), isnan(_2115))).xy;
    float _548 = _546.x;
    float _550 = _546.y;
    float _552 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float _554 = fma(_540, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2133 = float2(_552, _554);
    float _556 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2133, float2(0.0), isnan(_2133))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2133, float2(0.0), isnan(_2133))).x;
    float _558 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _560 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _562 = _269 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _564 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _566 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float2 _2165 = float2(_558, _560);
    float4 _569 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2165, float2(0.0), isnan(_2165)), int2(0), component::x).xyzw;
    float _571 = _569.x;
    float _573 = _569.y;
    float _575 = _569.z;
    float _577 = _569.w;
    float _579 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].x, _562);
    float _581 = floor(_564);
    float _583 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[35].z, _579);
    float _585 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _587 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _589 = -_583;
    float _591 = fma(_589, _583, 1.0);
    float _593 = floor(_585);
    float _595 = -_583;
    float _597 = fma(_595, (*spvDescriptorSet0.fp_c3)._m0[35].z, _271);
    float _599 = _591 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _601 = fma(_597, _599, _157);
    float _603 = -_581;
    float _605 = _564 + _603;
    float _607 = -_601;
    bool _609 = _607 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _615 = _605 + _613;
    float _617 = -_601;
    bool _619 = _617 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _621 = float(_619);
    float _623 = -_593;
    float _625 = _585 + _623;
    float _627 = _611 + _621;
    float _629 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _631 = _625 + _629;
    float _633 = -_615;
    float _635 = _633 + 1.0;
    float _637 = -_631;
    float _639 = _637 + 1.0;
    float _641 = precise::min(_627, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _643 = _615 * _631;
    float _645 = _631 * _635;
    float _647 = _615 * _639;
    float _649 = _635 * _639;
    float _651 = trunc(_641);
    int _653 = int(_651);
    float _655 = fma(_548, 2.0, -1.0);
    float _657 = fma(_550, 2.0, -1.0);
    float _659 = _655 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _661 = _657 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _663 = fma(_659, 2.0, _91);
    float _665 = fma(_661, 2.0, _93);
    float2 _2315 = float2(_552, _554);
    float _667 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2315, float2(0.0), isnan(_2315)), level(_556)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2315, float2(0.0), isnan(_2315)), level(_556)).x;
    float2 _2324 = float2(_558, _560);
    float4 _669 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2324, float2(0.0), isnan(_2324)), int2(0), component::w).xyzw;
    float _671 = _669.x;
    float _673 = _669.y;
    float _675 = _669.z;
    float _677 = _669.w;
    float2 _2340 = float2(_587, _566);
    float _679 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2340, float2(0.0), isnan(_2340))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2340, float2(0.0), isnan(_2340))).x;
    int _681 = _653 << 6;
    float2 _2351 = float2(_663, _665);
    float3 _685 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2351, float2(0.0), isnan(_2351))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2351, float2(0.0), isnan(_2351))).xyz;
    float _687 = _685.x;
    float _689 = _685.y;
    float _691 = _685.z;
    float _693 = -_583;
    float _695 = fma(_693, (*spvDescriptorSet0.fp_c3)._m0[35].x, _267);
    uint _698 = uint(int(uint(_681) >> uint(2)));
    uint _700 = uint(int(uint(int(_698)) >> uint(2)));
    int _702 = int(_698) & 3;
    float _704 = (*spvDescriptorSet0.fp_c3)._m0[int(_700)][_702];
    int _706 = int(_698) + 1;
    uint _708 = uint(int(uint(_706) >> uint(2)));
    int _710 = _706 & 3;
    float _712 = (*spvDescriptorSet0.fp_c3)._m0[int(_708)][_710];
    float _714 = -_583;
    float _716 = fma(_714, (*spvDescriptorSet0.fp_c3)._m0[35].y, _269);
    bool _718 = _653 != 0;
    float _720 = fma(_695, _599, _161);
    float _722 = fma(_716, _599, _159);
    int _724 = _681 + 16;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    uint _728 = uint(int(uint(int(_726)) >> uint(2)));
    int _730 = int(_726) & 3;
    float _732 = (*spvDescriptorSet0.fp_c3)._m0[int(_728)][_730];
    int _734 = int(_726) + 1;
    uint _736 = uint(int(uint(_734) >> uint(2)));
    int _738 = _734 & 3;
    float _740 = (*spvDescriptorSet0.fp_c3)._m0[int(_736)][_738];
    int _742 = _681 + 32;
    uint _744 = uint(int(uint(_742) >> uint(2)));
    uint _746 = uint(int(uint(int(_744)) >> uint(2)));
    int _748 = int(_744) & 3;
    float _750 = (*spvDescriptorSet0.fp_c3)._m0[int(_746)][_748];
    int _752 = int(_744) + 1;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    int _756 = _752 & 3;
    float _758 = (*spvDescriptorSet0.fp_c3)._m0[int(_754)][_756];
    float _760 = _722 * _712;
    float _762 = fma(_720, _704, _760);
    int _764 = _681 + 48;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.fp_c3)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.fp_c3)._m0[int(_776)][_778];
    float _782 = _722 * _740;
    float _784 = fma(_720, _732, _782);
    float _786 = abs(_157);
    float _788 = log2(_786);
    float _790 = _722 * _758;
    float _792 = fma(_720, _750, _790);
    int _794 = _681 + 8;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.fp_c3)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.fp_c3)._m0[int(_806)][_808];
    float _812 = _788 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _814 = exp2(_812);
    float _816 = _722 * _780;
    float _818 = fma(_720, _772, _816);
    float _820 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _822 = precise::clamp(_820, 0.0, 1.0);
    int _824 = _681 + 24;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    uint _828 = uint(int(uint(int(_826)) >> uint(2)));
    int _830 = int(_826) & 3;
    float _832 = (*spvDescriptorSet0.fp_c3)._m0[int(_828)][_830];
    int _834 = int(_826) + 1;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    int _838 = _834 & 3;
    float _840 = (*spvDescriptorSet0.fp_c3)._m0[int(_836)][_838];
    float _842 = fma(_822, -2.0, 3.0);
    float _844 = _822 * _822;
    float _846 = fma(_601, _802, _762);
    float _848 = _844 * _842;
    float _850 = -_848;
    float _852 = _850 + 1.0;
    float _854 = fma(_852, (*spvDescriptorSet0.fp_c3)._m0[44].w, _848);
    float _856 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _858 = precise::max(0.0, _856);
    float _860 = _854 * _858;
    float _862 = -_571;
    float _864 = fma(_862, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _866 = -_573;
    float _868 = fma(_866, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _870 = -_575;
    float _872 = fma(_870, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _874 = -_577;
    float _876 = fma(_874, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _878 = 1.0 / _864;
    float _880 = fma(_601, _832, _784);
    float _882 = _846 + _810;
    float _884 = precise::min(_157, -1.0000000116860974230803549289703e-07);
    int _886 = _681 + 40;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
    int _892 = int(_888) & 3;
    float _894 = (*spvDescriptorSet0.fp_c3)._m0[int(_890)][_892];
    int _896 = int(_888) + 1;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    int _900 = _896 & 3;
    float _902 = (*spvDescriptorSet0.fp_c3)._m0[int(_898)][_900];
    float _904 = 1.0 / _868;
    float _906 = _880 + _840;
    float _908 = 1.0 / _884;
    float _910 = 1.0 / _872;
    float _912 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _914 = -_157;
    float _916 = fma(_878, _912, _914);
    float _918 = 1.0 / _876;
    float _920 = _908 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _922 = abs(_916);
    float _924 = _922 * _920;
    float _926 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _928 = -_157;
    float _930 = fma(_904, _926, _928);
    float _932 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _934 = -_157;
    float _936 = fma(_910, _932, _934);
    float _938 = abs(_930);
    float _940 = _938 * _920;
    float _942 = exp2(_924);
    float _944 = abs(_936);
    float _946 = _944 * _920;
    float _948 = exp2(_940);
    float _950 = fma(_601, _894, _792);
    float _952 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _954 = -_157;
    float _956 = fma(_918, _952, _954);
    float _958 = exp2(_946);
    float _960 = abs(_956);
    float _962 = _960 * _920;
    float _964 = _950 + _902;
    float _966 = abs(_645);
    float _968 = _966 * _942;
    int _970 = _681 + 56;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    uint _974 = uint(int(uint(int(_972)) >> uint(2)));
    int _976 = int(_972) & 3;
    float _978 = (*spvDescriptorSet0.fp_c3)._m0[int(_974)][_976];
    int _980 = int(_972) + 1;
    uint _982 = uint(int(uint(_980) >> uint(2)));
    int _984 = _980 & 3;
    float _986 = (*spvDescriptorSet0.fp_c3)._m0[int(_982)][_984];
    float _988 = exp2(_962);
    float _990 = abs(_643);
    float _992 = _990 * _948;
    float _994 = abs(_647);
    float _996 = _994 * _958;
    float _998 = _968 + _992;
    float _1000 = _996 + _998;
    float _1002 = abs(_649);
    float _1004 = _1002 * _988;
    float _1006 = _1004 + _1000;
    float _1008 = -_1004;
    bool _1010 = _1000 != _1008;
    bool _1012 = isnan(_1000);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(_1008);
    bool _1018 = _1014 || _1016;
    float _1020 = 1.0 / _1006;
    float _1022 = _992 * _1020;
    float _1024 = _968 * _1020;
    float _1026 = fma(_601, _978, _818);
    bool _1028 = _157 >= (-8000.0);
    bool _1030 = isnan(_157);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(-8000.0);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = _996 * _1020;
    float _1042 = _1018 ? _1022 : 0.25;
    float _1044 = _1026 + _986;
    float _1046 = _1018 ? _1024 : 0.25;
    float _1048 = _1038 * _860;
    float _1050 = _1004 * _1020;
    float _1052 = _1018 ? _1040 : 0.25;
    float _1054 = 1.0 / _1044;
    float _1056 = _1018 ? _1050 : 0.25;
    float _1058 = abs(_667);
    float _1060 = _1058 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1062 = _1042 * _673;
    float _1064 = -_679;
    float _1066 = _1064 + 1.0;
    float _1068 = _882 * _1054;
    float _1070 = -_1060;
    float _1072 = fma(_1038, _1070, 1.0);
    float _1074 = fma(_1046, _671, _1062);
    float _1076 = _1048 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1078 = fma(_1052, _675, _1074);
    float _1080 = _1066 * _1076;
    float _1082 = precise::clamp(_1080, 0.0, 1.0);
    float _1084 = precise::min(_1072, 1.0);
    float _1086 = _906 * _1054;
    float _1088 = fma(_1056, _677, _1078);
    float _1090 = -_1082;
    float _1092 = fma(_1090, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1094 = _964 * _1054;
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = precise::min(_687, 1.0);
    float _1100 = precise::min(_1088, 1.0);
    float _1102 = precise::min(_1084, _1092);
    float _1158;
    if (!_718)
    {
        float _1104 = rint(_641);
        float _1106 = precise::max(_1104, 0.0);
        uint _1108 = uint(_1106);
        uint _1110 = clamp(_1108, 0u, 65535u);
        float _1112 = _1096 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1114 = fma(_1112, 0.5, _1086);
        float _1116 = fma(_1112, 0.5, _1068);
        float _1118 = fma(_1112, -0.5, _1068);
        float _1120 = fma(_1112, -0.5, _1086);
        float3 _3031 = float3(_1068, _1114, float(int(_1110)));
        float3 _3035 = select(_3031, float3(0.0), isnan(_3031));
        float _1122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3035.xy, uint(rint(_3035.z)), _1096);
        float3 _3044 = float3(_1116, _1114, float(int(_1110)));
        float3 _3046 = select(_3044, float3(0.0), isnan(_3044));
        float _1124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3046.xy, uint(rint(_3046.z)), _1096);
        float3 _3055 = float3(_1118, _1114, float(int(_1110)));
        float3 _3057 = select(_3055, float3(0.0), isnan(_3055));
        float _1126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3057.xy, uint(rint(_3057.z)), _1096);
        float3 _3066 = float3(_1116, _1086, float(int(_1110)));
        float3 _3068 = select(_3066, float3(0.0), isnan(_3066));
        float _1128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3068.xy, uint(rint(_3068.z)), _1096);
        float3 _3077 = float3(_1068, _1086, float(int(_1110)));
        float3 _3079 = select(_3077, float3(0.0), isnan(_3077));
        float _1130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3079.xy, uint(rint(_3079.z)), _1096);
        float3 _3088 = float3(_1118, _1086, float(int(_1110)));
        float3 _3090 = select(_3088, float3(0.0), isnan(_3088));
        float _1132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3090.xy, uint(rint(_3090.z)), _1096);
        float3 _3099 = float3(_1116, _1120, float(int(_1110)));
        float3 _3101 = select(_3099, float3(0.0), isnan(_3099));
        float _1134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3101.xy, uint(rint(_3101.z)), _1096);
        float3 _3110 = float3(_1068, _1120, float(int(_1110)));
        float3 _3112 = select(_3110, float3(0.0), isnan(_3110));
        float _1136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3112.xy, uint(rint(_3112.z)), _1096);
        float3 _3121 = float3(_1118, _1120, float(int(_1110)));
        float3 _3123 = select(_3121, float3(0.0), isnan(_3121));
        float _1138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3123.xy, uint(rint(_3123.z)), _1096);
        float _1140 = _1124 + _1122;
        float _1142 = _1140 + _1126;
        float _1144 = _1142 + _1128;
        float _1146 = _1144 + _1130;
        float _1148 = _1146 + _1132;
        float _1150 = _1148 + _1134;
        float _1152 = _1150 + _1136;
        float _1154 = _1152 + _1138;
        float _1156 = _1154 * 0.111111111938953399658203125;
        _1158 = _1156;
        _1160 = true;
    }
    else
    {
        float _1162 = rint(_641);
        float _1164 = precise::max(_1162, 0.0);
        uint _1166 = uint(_1164);
        uint _1168 = clamp(_1166, 0u, 65535u);
        float3 _3170 = float3(_1068, _1086, float(int(_1168)));
        float3 _3172 = select(_3170, float3(0.0), isnan(_3170));
        float _1170 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3172.xy, uint(rint(_3172.z)), _1096);
        _1158 = _1170;
    }
    _1160 = false;
    float _1172 = _1158;
    float _1174 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1176 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1178 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1174);
    float _1180 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1176);
    float _1182 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1178);
    float _1184 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1180);
    float _1186 = _1182 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1188 = _1184 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1190 = trunc(_1186);
    int _1192 = int(_1190);
    float _1194 = trunc(_1188);
    int _1196 = int(_1194);
    int _1198 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1200 = _1192 + _1198;
    int _1202 = _1200 + 1;
    float _1204 = -_157;
    float _1206 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1208 = _1204 + _1206;
    bool _1210 = _1202 >= 0;
    int _1212 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1214 = _1196 + _1212;
    int _1216 = _1214 + 1;
    float _1218 = -_157;
    float _1220 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1222 = _1218 + _1220;
    bool _1224 = _1202 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1226 = !_1210;
    bool _1228 = _1224 || _1226;
    bool _1230 = _1216 < 0;
    bool _1232 = _1230 || _1228;
    bool _1234 = _1216 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1236 = _1234 || _1232;
    if (_1236)
    {
        _279 = 1.0;
    }
    float _1238 = _279;
    float _1240 = _1238;
    if (!_1236)
    {
        int _1242 = _1216 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1244 = _1242 + _1202;
        float _1246 = floor(_1188);
        int _1248 = _1244 << 2;
        int _1250 = _1244 >> 2;
        int _1252 = 12 & _1248;
        int _1254 = _1250 << 4;
        int _1256 = _1254 + _1252;
        float _1258 = floor(_1186);
        uint _1260 = uint(int(uint(_1256) >> uint(2)));
        uint _1262 = uint(int(uint(int(_1260)) >> uint(2)));
        int _1264 = int(_1260) & 3;
        float _1266 = (*spvDescriptorSet0.fp_c5)._m0[int(_1262)][_1264];
        float _1268 = -_1246;
        float _1270 = _1188 + _1268;
        float _1272 = -_1258;
        float _1274 = _1186 + _1272;
        float _1276 = rint(_1266);
        float _1278 = precise::max(_1276, 0.0);
        uint _1280 = uint(_1278);
        uint _1282 = clamp(_1280, 0u, 65535u);
        float3 _3357 = float3(_1274, _1270, float(int(_1282)));
        float3 _3359 = select(_3357, float3(0.0), isnan(_3357));
        float _1284 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3359.xy, uint(rint(_3359.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3359.xy, uint(rint(_3359.z)), level(0.0)).x;
        int _1286 = _1244 << 4;
        int _1288 = _1286 + 1648;
        int _1290 = _1256 + 8048;
        uint _1292 = uint(int(uint(_1290) >> uint(2)));
        uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
        int _1296 = int(_1292) & 3;
        float _1298 = (*spvDescriptorSet0.fp_c5)._m0[int(_1294)][_1296];
        uint _1300 = uint(int(uint(_1288) >> uint(2)));
        uint _1302 = uint(int(uint(int(_1300)) >> uint(2)));
        int _1304 = int(_1300) & 3;
        float _1306 = (*spvDescriptorSet0.fp_c5)._m0[int(_1302)][_1304];
        int _1308 = int(_1300) + 1;
        uint _1310 = uint(int(uint(_1308) >> uint(2)));
        int _1312 = _1308 & 3;
        float _1314 = (*spvDescriptorSet0.fp_c5)._m0[int(_1310)][_1312];
        int _1316 = _1288 + 8;
        uint _1318 = uint(int(uint(_1316) >> uint(2)));
        uint _1320 = uint(int(uint(int(_1318)) >> uint(2)));
        int _1322 = int(_1318) & 3;
        float _1324 = (*spvDescriptorSet0.fp_c5)._m0[int(_1320)][_1322];
        int _1326 = int(_1318) + 1;
        uint _1328 = uint(int(uint(_1326) >> uint(2)));
        int _1330 = _1326 & 3;
        float _1332 = (*spvDescriptorSet0.fp_c5)._m0[int(_1328)][_1330];
        float _1334 = _1298 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1336 = _542 * _1314;
        float _1338 = fma(_538, _1306, _1336);
        float _1340 = 1.0 / _1298;
        float _1342 = fma(_540, _1324, _1338);
        float _1344 = _1342 + _1332;
        float _1346 = precise::clamp(_1344, 0.0, 1.0);
        float _1348 = -_1346;
        float _1350 = _1348 + _1284;
        float _1352 = fma(_1340, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1350);
        float _1354 = _1334 * _1352;
        float _1356 = exp2(_1354);
        float _1358 = 0.0 + _1356;
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        _1240 = _1360;
    }
    float _1362 = _1240;
    float _1364 = precise::min(_1362, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1366 = -_1172;
    float _1368 = _1366 + 1.0;
    float _1370 = _1208 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1372 = precise::clamp(_1370, 0.0, 1.0);
    float _1374 = _1222 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1376 = precise::clamp(_1374, 0.0, 1.0);
    float _1378 = -_1364;
    float _1380 = _1378 + 1.0;
    float _1382 = fma(_1372, _1368, _1172);
    float _1384 = fma(_1376, _1380, _1364);
    out.m_66.x = _1382;
    out.m_66.y = _1384;
    out.m_66.z = _1100;
    out.m_66.w = _1102;
    out.m_68.x = _1098;
    out.m_68.y = _689;
    out.m_68.z = _691;
    out.m_68.w = 1.0;
    return out;
}

