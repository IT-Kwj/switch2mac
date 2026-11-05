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
    texture2d<float> fp_t_tcb_18 [[id(11)]];
    sampler fp_t_tcb_18Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_12 [[id(13)]];
    sampler fp_t_tcb_12Smplr [[id(14)]];
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
    bool _1170 = false;
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
    float2 _1433 = float2(_93, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1433, float2(0.0), isnan(_1433))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1433, float2(0.0), isnan(_1433))).x;
    float _101 = _95 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1448 = float2(_97, _95);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1448, float2(0.0), isnan(_1448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1448, float2(0.0), isnan(_1448))).x;
    float2 _1456 = float2(_93, _101);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1456, float2(0.0), isnan(_1456))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1456, float2(0.0), isnan(_1456))).x;
    float _107 = in.m_61.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_61.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_63.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_63.y;
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
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _159 = 1.0 / _157;
    float _161 = -_103;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _165 = -_105;
    float _167 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _169 = 1.0 / _163;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _173 = _159 * _171;
    float _175 = 1.0 / _167;
    float _177 = _173 * _143;
    float _179 = _173 * _145;
    float _181 = _177 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _183 = _177 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _185 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _187 = _169 * _185;
    float _189 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[32].x, _181);
    float _191 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[30].x, _183);
    float _193 = -_179;
    float _195 = fma(_187, _147, _193);
    float _197 = -_173;
    float _199 = _197 + _187;
    float _201 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[32].z, _189);
    float _203 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[30].z, _191);
    float _205 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _207 = _175 * _205;
    float _209 = -_177;
    float _211 = fma(_187, _149, _209);
    float _213 = _201 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _215 = _203 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _217 = -_179;
    float _219 = fma(_207, _151, _217);
    float _221 = -_177;
    float _223 = fma(_207, _153, _221);
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _227 = _213 + _225;
    float _229 = -_173;
    float _231 = _229 + _207;
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _235 = _215 + _233;
    float _237 = _199 * _219;
    float _239 = _227 * _227;
    float _241 = _211 * _231;
    float _243 = -_237;
    float _245 = fma(_195, _231, _243);
    float _247 = fma(_235, _235, _239);
    float _249 = _195 * _223;
    float _251 = -_241;
    float _253 = fma(_199, _223, _251);
    float _255 = _245 * _245;
    float _257 = sqrt(_247);
    float _259 = -_249;
    float _261 = fma(_211, _219, _259);
    float _263 = _177 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _265 = fma(_253, _253, _255);
    float _267 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[31].x, _263);
    float _269 = fma(_261, _261, _265);
    float _271 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].z, _267);
    float _273 = rsqrt(_269);
    float _275 = _271 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _279 = _257 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _281 = _253 * _273;
    float _283 = _245 * _273;
    float _285 = _261 * _273;
    float _287 = _273;
    float _289 = _213;
    float _291 = _275;
    float _293 = _173;
    if (!_279)
    {
        _287 = _215;
    }
    float _295 = _287;
    bool _297 = !_279;
    float _299 = _295;
    if (!_297)
    {
        float _301 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _303 = _257 + _301;
        float _305 = _275 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _307 = rsqrt(_247);
        float _309 = -_275;
        float _311 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _313 = _309 + _311;
        float _315 = abs(_305);
        float _317 = abs(_303);
        float _319 = precise::max(_315, _317);
        float _321 = _313 * _313;
        bool _323 = _319 >= 16.0;
        float _325 = _235 * _307;
        float _327 = _227 * _307;
        float _329 = -_235;
        float _331 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[41].z, _329);
        float _333 = -_227;
        float _335 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[41].z, _333);
        float _337 = _303;
        float _339 = _305;
        int _342 = as_type<int>(_335);
        if (_323)
        {
            float _344 = _303 * 0.0625;
            _337 = _344;
        }
        float _346 = _337;
        if (_323)
        {
            float _348 = _305 * 0.0625;
            _339 = _348;
        }
        float _350 = _339;
        float _352 = fma(_331, _331, _321);
        float _354 = abs(_346);
        bool _356 = _354 != 0.0;
        bool _358 = isnan(_354);
        bool _360 = _356 || _358;
        bool _362 = isnan(0.0);
        bool _364 = _360 || _362;
        float _366 = fma(_335, _335, _352);
        float _368 = abs(_350);
        bool _370 = _368 == 0.0;
        float _372 = abs(_350);
        bool _374 = _372 == 0.0;
        bool _376 = !_364;
        bool _378 = _374 && _376;
        float _380 = sqrt(_366);
        bool _382 = false;
        if (_378)
        {
            bool _384 = as_type<int>(_350) >= 0;
            _382 = _384;
        }
        bool _386 = _382;
        int _388 = _386 ? (-1) : 0;
        if (_378)
        {
            int _390 = _386 ? 0 : 1078530011;
            _342 = _390;
        }
        int _392 = _342;
        int _394 = _392;
        if (_378)
        {
            int _396 = int(0x80000000) & as_type<int>(_346);
            int _398 = _392 | _396;
            _394 = _398;
        }
        int _400 = _394;
        bool _402 = !_364;
        bool _404 = _402 && _370;
        int _406 = _400;
        float _408 = as_type<float>(_400);
        if (!_404)
        {
            float _410 = abs(_346);
            bool _412 = _410 != as_type<float>(0x7f800000u /* inf */);
            bool _414 = isnan(_410);
            bool _416 = _412 || _414;
            bool _418 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _420 = _416 || _418;
            float _422 = abs(_350);
            bool _424 = _422 == as_type<float>(0x7f800000u /* inf */);
            float _426 = abs(_350);
            bool _428 = _426 == as_type<float>(0x7f800000u /* inf */);
            bool _430 = !_420;
            bool _432 = _428 && _430;
            if (_432)
            {
                bool _434 = as_type<int>(_350) >= 0;
                _388 = _434 ? (-1) : 0;
            }
            int _436 = _388;
            if (_432)
            {
                _406 = 1075235812;
            }
            int _438 = _406;
            int _440 = _438;
            if (_432)
            {
                int _442 = ~_436;
                int _444 = (_442 != 0) ? _438 : 1061752795;
                _440 = _444;
            }
            int _446 = _440;
            float _448 = as_type<float>(_446);
            if (_432)
            {
                int _450 = int(0x80000000) & as_type<int>(_346);
                int _452 = _446 | _450;
                _448 = as_type<float>(_452);
            }
            float _454 = _448;
            bool _456 = !_420;
            bool _458 = _456 && _424;
            _408 = _454;
            if (!_458)
            {
                float _460 = abs(_346);
                float _462 = abs(_350);
                float _464 = precise::max(_460, _462);
                float _466 = abs(_346);
                float _468 = abs(_350);
                float _470 = precise::min(_466, _468);
                float _472 = 1.0 / _464;
                float _474 = abs(_346);
                float _476 = abs(_350);
                bool _478 = _474 > _476;
                bool _480 = as_type<int>(_350) >= 0;
                float _482 = _470 * _472;
                float _484 = abs(_346);
                float _486 = abs(_350);
                float _488 = _484 + _486;
                int _490 = as_type<int>(_346) & int(0x80000000);
                float _492 = _482 * _482;
                bool _494 = _488 > as_type<float>(0x7f800000u /* inf */);
                bool _496 = isnan(_488);
                bool _498 = _494 || _496;
                bool _500 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _502 = _498 || _500;
                float _504 = _492 + 11.33538818359375;
                float _506 = fma(_492, _504, 28.84246826171875);
                float _508 = fma(_492, _506, 19.6966705322265625);
                float _510 = fma(_492, -0.82336294651031494140625, -5.674867153167724609375);
                float _512 = fma(_492, _510, -6.565555095672607421875);
                float _514 = 1.0 / _508;
                float _516 = _492 * _512;
                float _518 = _482 * _516;
                float _520 = fma(_518, _514, _482);
                float _522 = _520;
                _408 = _488;
                if (_478)
                {
                    float _524 = -_520;
                    float _526 = _524 + 1.57079637050628662109375;
                    _522 = _526;
                }
                float _528 = _522;
                int _530 = as_type<int>(_528);
                if (!_480)
                {
                    float _532 = -_528;
                    float _534 = _532 + 3.1415927410125732421875;
                    _530 = as_type<int>(_534);
                }
                int _536 = _530;
                if (!_502)
                {
                    int _538 = _490 | _536;
                    _408 = as_type<float>(_538);
                }
            }
        }
        float _540 = _408;
        float _542 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _544 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _546 = _380 + _544;
        float _548 = fma(_325, _542, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _550 = fma(_327, _542, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _299 = _548;
        _289 = _550;
        _291 = _546;
    }
    float _552 = _299;
    float _554 = _289;
    float _556 = _291;
    float2 _2137 = float2(_93, _95);
    float2 _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2137, float2(0.0), isnan(_2137))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2137, float2(0.0), isnan(_2137))).xy;
    float _562 = _560.x;
    float _564 = _560.y;
    float _566 = fma(_552, 6.2500002968590706586837768554688e-05, 0.5);
    float _568 = fma(_554, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2155 = float2(_566, _568);
    float _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2155, float2(0.0), isnan(_2155))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2155, float2(0.0), isnan(_2155))).x;
    float _572 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _93);
    float _574 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _95);
    float _576 = _283 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float2 _2176 = float2(_572, _574);
    float4 _579 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2176, float2(0.0), isnan(_2176)), int2(0), component::x).xyzw;
    float _581 = _579.x;
    float _583 = _579.y;
    float _585 = _579.z;
    float _587 = _579.w;
    float _589 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[35].x, _576);
    float _591 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[35].z, _589);
    float _593 = -_591;
    float _595 = fma(_593, _591, 1.0);
    float _597 = -_591;
    float _599 = fma(_597, (*spvDescriptorSet0.fp_c3)._m0[35].z, _285);
    float _601 = _595 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _603 = fma(_599, _601, _173);
    float _605 = -_603;
    bool _607 = _605 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _609 = float(_607);
    float _611 = -_603;
    bool _613 = _611 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _615 = float(_613);
    float _617 = _609 + _615;
    float _619 = precise::min(_617, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _621 = trunc(_619);
    int _623 = int(_621);
    int _625 = _623 << 6;
    float _627 = fma(_562, 2.0, -1.0);
    float _629 = fma(_564, 2.0, -1.0);
    float _631 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _633 = _627 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _635 = _629 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _637 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    uint _640 = uint(int(uint(_625) >> uint(2)));
    uint _642 = uint(int(uint(int(_640)) >> uint(2)));
    int _644 = int(_640) & 3;
    float _646 = (*spvDescriptorSet0.fp_c3)._m0[int(_642)][_644];
    int _648 = int(_640) + 1;
    uint _650 = uint(int(uint(_648) >> uint(2)));
    int _652 = _648 & 3;
    float _654 = (*spvDescriptorSet0.fp_c3)._m0[int(_650)][_652];
    float2 _2308 = float2(_566, _568);
    float _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2308, float2(0.0), isnan(_2308)), level(_570)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2308, float2(0.0), isnan(_2308)), level(_570)).x;
    float2 _2317 = float2(_572, _574);
    float4 _658 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2317, float2(0.0), isnan(_2317)), int2(0), component::w).xyzw;
    float _660 = _658.x;
    float _662 = _658.y;
    float _664 = _658.z;
    float _666 = _658.w;
    float2 _2333 = float2(_631, _637);
    float _668 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2333, float2(0.0), isnan(_2333))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2333, float2(0.0), isnan(_2333))).x;
    float _670 = fma(_635, 2.0, _95);
    float _672 = fma(_633, 2.0, _93);
    float2 _2347 = float2(_672, _670);
    float _674 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2347, float2(0.0), isnan(_2347))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2347, float2(0.0), isnan(_2347))).x;
    float2 _2355 = float2(_672, _670);
    float2 _676 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2355, float2(0.0), isnan(_2355))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2355, float2(0.0), isnan(_2355))).yz;
    float _678 = _676.x;
    float _680 = _676.y;
    float _682 = -_591;
    float _684 = fma(_682, (*spvDescriptorSet0.fp_c3)._m0[35].x, _281);
    float _686 = -_591;
    float _688 = fma(_686, (*spvDescriptorSet0.fp_c3)._m0[35].y, _283);
    float _690 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    int _692 = _625 + 16;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    uint _696 = uint(int(uint(int(_694)) >> uint(2)));
    int _698 = int(_694) & 3;
    float _700 = (*spvDescriptorSet0.fp_c3)._m0[int(_696)][_698];
    int _702 = int(_694) + 1;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    int _706 = _702 & 3;
    float _708 = (*spvDescriptorSet0.fp_c3)._m0[int(_704)][_706];
    float _710 = fma(_684, _601, _179);
    float _712 = fma(_688, _601, _177);
    float _714 = _95 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    bool _716 = _623 != 0;
    float _718 = -_581;
    float _720 = fma(_718, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _722 = -_585;
    float _724 = fma(_722, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _726 = -_587;
    float _728 = fma(_726, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    int _730 = _625 + 32;
    uint _732 = uint(int(uint(_730) >> uint(2)));
    uint _734 = uint(int(uint(int(_732)) >> uint(2)));
    int _736 = int(_732) & 3;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[int(_734)][_736];
    int _740 = int(_732) + 1;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    int _744 = _740 & 3;
    float _746 = (*spvDescriptorSet0.fp_c3)._m0[int(_742)][_744];
    int _748 = _625 + 48;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.fp_c3)._m0[int(_760)][_762];
    float _766 = _712 * _654;
    float _768 = _712 * _708;
    float _770 = fma(_710, _646, _766);
    float _772 = 1.0 / _724;
    float _774 = fma(_710, _700, _768);
    float _776 = abs(_173);
    float _778 = log2(_776);
    float _780 = floor(_690);
    float _782 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _784 = -_173;
    float _786 = fma(_772, _782, _784);
    float _788 = _778 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _790 = _712 * _746;
    float _792 = 1.0 / _728;
    float _794 = fma(_710, _738, _790);
    float _796 = _712 * _764;
    float _798 = -_780;
    float _800 = _690 + _798;
    float _802 = floor(_714);
    float _804 = fma(_710, _756, _796);
    float _806 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _808 = _800 + _806;
    int _810 = _625 + 8;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    uint _814 = uint(int(uint(int(_812)) >> uint(2)));
    int _816 = int(_812) & 3;
    float _818 = (*spvDescriptorSet0.fp_c3)._m0[int(_814)][_816];
    int _820 = int(_812) + 1;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    int _824 = _820 & 3;
    float _826 = (*spvDescriptorSet0.fp_c3)._m0[int(_822)][_824];
    float _828 = exp2(_788);
    float _830 = -_802;
    float _832 = _714 + _830;
    float _834 = 1.0 / _720;
    float _836 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _838 = _832 + _836;
    float _840 = fma(_828, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _842 = precise::clamp(_840, 0.0, 1.0);
    float _844 = -_838;
    float _846 = _844 + 1.0;
    float _848 = _808 * _838;
    float _850 = fma(_842, -2.0, 3.0);
    float _852 = _842 * _842;
    float _854 = -_808;
    float _856 = _854 + 1.0;
    float _858 = _808 * _846;
    float _860 = _852 * _850;
    float _862 = _838 * _856;
    float _864 = _856 * _846;
    float _866 = -_860;
    float _868 = _866 + 1.0;
    float _870 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _872 = -_173;
    float _874 = fma(_834, _870, _872);
    float _876 = fma(_868, (*spvDescriptorSet0.fp_c3)._m0[44].w, _860);
    float _878 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _880 = precise::max(0.0, _878);
    float _882 = fma(_603, _818, _770);
    float _884 = _876 * _880;
    float _886 = precise::min(_173, -1.0000000116860974230803549289703e-07);
    int _888 = _625 + 24;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.fp_c3)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.fp_c3)._m0[int(_900)][_902];
    float _906 = _882 + _826;
    int _908 = _625 + 40;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    uint _912 = uint(int(uint(int(_910)) >> uint(2)));
    int _914 = int(_910) & 3;
    float _916 = (*spvDescriptorSet0.fp_c3)._m0[int(_912)][_914];
    int _918 = int(_910) + 1;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    int _922 = _918 & 3;
    float _924 = (*spvDescriptorSet0.fp_c3)._m0[int(_920)][_922];
    float _926 = fma(_603, _896, _774);
    float _928 = 1.0 / _886;
    float _930 = _926 + _904;
    float _932 = -_583;
    float _934 = fma(_932, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _936 = fma(_603, _916, _794);
    float _938 = 1.0 / _934;
    float _940 = _928 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _942 = abs(_874);
    float _944 = _942 * _940;
    float _946 = abs(_786);
    float _948 = _946 * _940;
    float _950 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _952 = -_173;
    float _954 = fma(_938, _950, _952);
    float _956 = exp2(_944);
    float _958 = abs(_954);
    float _960 = _958 * _940;
    float _962 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _964 = -_173;
    float _966 = fma(_792, _962, _964);
    float _968 = _936 + _924;
    int _970 = _625 + 56;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    uint _974 = uint(int(uint(int(_972)) >> uint(2)));
    int _976 = int(_972) & 3;
    float _978 = (*spvDescriptorSet0.fp_c3)._m0[int(_974)][_976];
    int _980 = int(_972) + 1;
    uint _982 = uint(int(uint(_980) >> uint(2)));
    int _984 = _980 & 3;
    float _986 = (*spvDescriptorSet0.fp_c3)._m0[int(_982)][_984];
    float _988 = abs(_966);
    float _990 = _988 * _940;
    float _992 = exp2(_960);
    float _994 = exp2(_948);
    float _996 = abs(_862);
    float _998 = _996 * _956;
    float _1000 = exp2(_990);
    float _1002 = abs(_848);
    float _1004 = _1002 * _992;
    float _1006 = _998 + _1004;
    float _1008 = abs(_858);
    float _1010 = _1008 * _994;
    float _1012 = _1010 + _1006;
    float _1014 = abs(_864);
    float _1016 = _1014 * _1000;
    float _1018 = _1016 + _1012;
    float _1020 = -_1016;
    bool _1022 = _1012 != _1020;
    bool _1024 = isnan(_1012);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(_1020);
    bool _1030 = _1026 || _1028;
    bool _1032 = _173 >= (-8000.0);
    bool _1034 = isnan(_173);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan(-8000.0);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = 1.0 / _1018;
    float _1046 = _1042 * _884;
    float _1048 = fma(_603, _978, _804);
    float _1050 = _1048 + _986;
    float _1052 = _1004 * _1044;
    float _1054 = _998 * _1044;
    float _1056 = _1010 * _1044;
    float _1058 = _1016 * _1044;
    float _1060 = _1030 ? _1052 : 0.25;
    float _1062 = _1030 ? _1054 : 0.25;
    float _1064 = abs(_656);
    float _1066 = _1064 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1068 = _1030 ? _1056 : 0.25;
    float _1070 = _1060 * _662;
    float _1072 = -_668;
    float _1074 = _1072 + 1.0;
    float _1076 = 1.0 / _1050;
    float _1078 = _1030 ? _1058 : 0.25;
    float _1080 = fma(_1062, _660, _1070);
    float _1082 = _1046 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1084 = -_1066;
    float _1086 = fma(_1042, _1084, 1.0);
    float _1088 = fma(_1068, _664, _1080);
    float _1090 = _1074 * _1082;
    float _1092 = precise::clamp(_1090, 0.0, 1.0);
    float _1094 = precise::min(_1086, 1.0);
    float _1096 = fma(_1078, _666, _1088);
    float _1098 = -_1092;
    float _1100 = fma(_1098, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1102 = precise::min(_1096, 1.0);
    float _1104 = _906 * _1076;
    float _1106 = _930 * _1076;
    float _1108 = _968 * _1076;
    float _1110 = precise::clamp(_1108, 0.0, 1.0);
    float _1112 = precise::min(_1094, _1100);
    float _1168;
    if (!_716)
    {
        float _1114 = rint(_619);
        float _1116 = precise::max(_1114, 0.0);
        uint _1118 = uint(_1116);
        uint _1120 = clamp(_1118, 0u, 65535u);
        float _1122 = _1110 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1124 = fma(_1122, 0.5, _1106);
        float _1126 = fma(_1122, 0.5, _1104);
        float _1128 = fma(_1122, -0.5, _1104);
        float _1130 = fma(_1122, -0.5, _1106);
        float3 _3058 = float3(_1104, _1124, float(int(_1120)));
        float3 _3062 = select(_3058, float3(0.0), isnan(_3058));
        float _1132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3062.xy, uint(rint(_3062.z)), _1110);
        float3 _3071 = float3(_1126, _1124, float(int(_1120)));
        float3 _3073 = select(_3071, float3(0.0), isnan(_3071));
        float _1134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3073.xy, uint(rint(_3073.z)), _1110);
        float3 _3082 = float3(_1128, _1124, float(int(_1120)));
        float3 _3084 = select(_3082, float3(0.0), isnan(_3082));
        float _1136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3084.xy, uint(rint(_3084.z)), _1110);
        float3 _3093 = float3(_1126, _1106, float(int(_1120)));
        float3 _3095 = select(_3093, float3(0.0), isnan(_3093));
        float _1138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3095.xy, uint(rint(_3095.z)), _1110);
        float3 _3104 = float3(_1104, _1106, float(int(_1120)));
        float3 _3106 = select(_3104, float3(0.0), isnan(_3104));
        float _1140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3106.xy, uint(rint(_3106.z)), _1110);
        float3 _3115 = float3(_1128, _1106, float(int(_1120)));
        float3 _3117 = select(_3115, float3(0.0), isnan(_3115));
        float _1142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3117.xy, uint(rint(_3117.z)), _1110);
        float3 _3126 = float3(_1126, _1130, float(int(_1120)));
        float3 _3128 = select(_3126, float3(0.0), isnan(_3126));
        float _1144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3128.xy, uint(rint(_3128.z)), _1110);
        float3 _3137 = float3(_1104, _1130, float(int(_1120)));
        float3 _3139 = select(_3137, float3(0.0), isnan(_3137));
        float _1146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3139.xy, uint(rint(_3139.z)), _1110);
        float3 _3148 = float3(_1128, _1130, float(int(_1120)));
        float3 _3150 = select(_3148, float3(0.0), isnan(_3148));
        float _1148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3150.xy, uint(rint(_3150.z)), _1110);
        float _1150 = _1134 + _1132;
        float _1152 = _1150 + _1136;
        float _1154 = _1152 + _1138;
        float _1156 = _1154 + _1140;
        float _1158 = _1156 + _1142;
        float _1160 = _1158 + _1144;
        float _1162 = _1160 + _1146;
        float _1164 = _1162 + _1148;
        float _1166 = _1164 * 0.111111111938953399658203125;
        _1168 = _1166;
        _1170 = true;
    }
    else
    {
        float _1172 = rint(_619);
        float _1174 = precise::max(_1172, 0.0);
        uint _1176 = uint(_1174);
        uint _1178 = clamp(_1176, 0u, 65535u);
        float3 _3197 = float3(_1104, _1106, float(int(_1178)));
        float3 _3199 = select(_3197, float3(0.0), isnan(_3197));
        float _1180 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3199.xy, uint(rint(_3199.z)), _1110);
        _1168 = _1180;
    }
    _1170 = false;
    float _1182 = _1168;
    float _1184 = _556 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1186 = _556 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1188 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1184);
    float _1190 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1186);
    float _1192 = fma(_554, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1188);
    float _1194 = fma(_554, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1190);
    float _1196 = _1192 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1198 = _1194 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1200 = trunc(_1196);
    int _1202 = int(_1200);
    float _1204 = trunc(_1198);
    int _1206 = int(_1204);
    int _1208 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1210 = _1202 + _1208;
    int _1212 = _1210 + 1;
    float _1214 = -_173;
    float _1216 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1218 = _1214 + _1216;
    bool _1220 = _1212 >= 0;
    int _1222 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1224 = _1206 + _1222;
    int _1226 = _1224 + 1;
    float _1228 = -_173;
    float _1230 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1232 = _1228 + _1230;
    bool _1234 = _1212 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1236 = !_1220;
    bool _1238 = _1234 || _1236;
    bool _1240 = _1226 < 0;
    bool _1242 = _1240 || _1238;
    bool _1244 = _1226 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1246 = _1244 || _1242;
    if (_1246)
    {
        _293 = 1.0;
    }
    float _1248 = _293;
    float _1250 = _1248;
    if (!_1246)
    {
        int _1252 = _1226 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1254 = _1252 + _1212;
        float _1256 = floor(_1198);
        int _1258 = _1254 << 2;
        int _1260 = _1254 >> 2;
        int _1262 = 12 & _1258;
        int _1264 = _1260 << 4;
        int _1266 = _1264 + _1262;
        float _1268 = floor(_1196);
        uint _1270 = uint(int(uint(_1266) >> uint(2)));
        uint _1272 = uint(int(uint(int(_1270)) >> uint(2)));
        int _1274 = int(_1270) & 3;
        float _1276 = (*spvDescriptorSet0.fp_c5)._m0[int(_1272)][_1274];
        float _1278 = -_1256;
        float _1280 = _1198 + _1278;
        float _1282 = -_1268;
        float _1284 = _1196 + _1282;
        float _1286 = rint(_1276);
        float _1288 = precise::max(_1286, 0.0);
        uint _1290 = uint(_1288);
        uint _1292 = clamp(_1290, 0u, 65535u);
        float3 _3384 = float3(_1284, _1280, float(int(_1292)));
        float3 _3386 = select(_3384, float3(0.0), isnan(_3384));
        float _1294 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3386.xy, uint(rint(_3386.z)), level(0.0)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3386.xy, uint(rint(_3386.z)), level(0.0)).x;
        int _1296 = _1254 << 4;
        int _1298 = _1296 + 1648;
        int _1300 = _1266 + 8048;
        uint _1302 = uint(int(uint(_1300) >> uint(2)));
        uint _1304 = uint(int(uint(int(_1302)) >> uint(2)));
        int _1306 = int(_1302) & 3;
        float _1308 = (*spvDescriptorSet0.fp_c5)._m0[int(_1304)][_1306];
        uint _1310 = uint(int(uint(_1298) >> uint(2)));
        uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
        int _1314 = int(_1310) & 3;
        float _1316 = (*spvDescriptorSet0.fp_c5)._m0[int(_1312)][_1314];
        int _1318 = int(_1310) + 1;
        uint _1320 = uint(int(uint(_1318) >> uint(2)));
        int _1322 = _1318 & 3;
        float _1324 = (*spvDescriptorSet0.fp_c5)._m0[int(_1320)][_1322];
        int _1326 = _1298 + 8;
        uint _1328 = uint(int(uint(_1326) >> uint(2)));
        uint _1330 = uint(int(uint(int(_1328)) >> uint(2)));
        int _1332 = int(_1328) & 3;
        float _1334 = (*spvDescriptorSet0.fp_c5)._m0[int(_1330)][_1332];
        int _1336 = int(_1328) + 1;
        uint _1338 = uint(int(uint(_1336) >> uint(2)));
        int _1340 = _1336 & 3;
        float _1342 = (*spvDescriptorSet0.fp_c5)._m0[int(_1338)][_1340];
        float _1344 = _1308 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1346 = _556 * _1324;
        float _1348 = fma(_552, _1316, _1346);
        float _1350 = 1.0 / _1308;
        float _1352 = fma(_554, _1334, _1348);
        float _1354 = _1352 + _1342;
        float _1356 = precise::clamp(_1354, 0.0, 1.0);
        float _1358 = -_1356;
        float _1360 = _1358 + _1294;
        float _1362 = fma(_1350, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1360);
        float _1364 = _1344 * _1362;
        float _1366 = exp2(_1364);
        float _1368 = 0.0 + _1366;
        float _1370 = precise::clamp(_1368, 0.0, 1.0);
        _1250 = _1370;
    }
    float _1372 = _1250;
    float _1374 = precise::min(_1372, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1376 = -_1182;
    float _1378 = _1376 + 1.0;
    float _1380 = _1218 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1382 = precise::clamp(_1380, 0.0, 1.0);
    float _1384 = _1232 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1386 = precise::clamp(_1384, 0.0, 1.0);
    float _1388 = -_1374;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_1382, _1378, _1182);
    float _1394 = fma(_1386, _1390, _1374);
    out.m_68.x = _1392;
    out.m_68.y = _1394;
    out.m_68.z = _1102;
    out.m_68.w = _1112;
    out.m_70.x = _674;
    out.m_70.y = _678;
    out.m_70.z = _680;
    out.m_70.w = 1.0;
    return out;
}

