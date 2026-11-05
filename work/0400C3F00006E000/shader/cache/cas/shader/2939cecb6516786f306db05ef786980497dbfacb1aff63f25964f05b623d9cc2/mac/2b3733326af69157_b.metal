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
    texture2d<float> fp_t_tcb_16 [[id(5)]];
    sampler fp_t_tcb_16Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_14 [[id(11)]];
    sampler fp_t_tcb_14Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_18 [[id(13)]];
    sampler fp_t_tcb_18Smplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_E [[id(17)]];
    sampler fp_t_tcb_ESmplr [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_16Smplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    sampler fp_t_tcb_18Smplr_w [[id(22)]];
    sampler fp_t_tcb_ESmplr_w [[id(23)]];
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
    float4 m_59 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1126 = false;
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
    float2 _1392 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1392, float2(0.0), isnan(_1392))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1392, float2(0.0), isnan(_1392))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1407 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1407, float2(0.0), isnan(_1407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1407, float2(0.0), isnan(_1407))).x;
    float2 _1415 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1415, float2(0.0), isnan(_1415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1415, float2(0.0), isnan(_1415))).x;
    float _101 = in.m_55.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_55.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_57.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_59.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_59.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_57.y;
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
    float _187 = -_167;
    float _189 = _187 + _181;
    float _191 = -_173;
    float _193 = fma(_181, _143, _191);
    float _195 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[32].z, _183);
    float _197 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _201 = _169 * _199;
    float _203 = -_171;
    float _205 = fma(_181, _145, _203);
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _209 = _197 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _211 = -_173;
    float _213 = fma(_201, _141, _211);
    float _215 = -_171;
    float _217 = fma(_201, _147, _215);
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _221 = _207 + _219;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _225 = _209 + _223;
    float _227 = -_167;
    float _229 = _227 + _201;
    float _231 = _189 * _213;
    float _233 = _221 * _221;
    float _235 = _205 * _229;
    float _237 = -_231;
    float _239 = fma(_193, _229, _237);
    float _241 = fma(_225, _225, _233);
    float _243 = _193 * _217;
    float _245 = -_235;
    float _247 = fma(_189, _217, _245);
    float _249 = _239 * _239;
    float _251 = sqrt(_241);
    float _253 = -_243;
    float _255 = fma(_205, _213, _253);
    float _257 = _171 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _259 = fma(_247, _247, _249);
    float _261 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].x, _257);
    float _263 = fma(_255, _255, _259);
    float _265 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].z, _261);
    float _267 = rsqrt(_263);
    float _269 = _265 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _273 = _251 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _275 = _247 * _267;
    float _277 = _239 * _267;
    float _279 = _255 * _267;
    bool _281 = !_273;
    float _283 = _209;
    float _285 = _207;
    float _287 = _269;
    if (!_281)
    {
        float _289 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _291 = _251 + _289;
        float _293 = _269 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _295 = rsqrt(_241);
        float _297 = -_269;
        float _299 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _301 = _297 + _299;
        float _303 = abs(_293);
        float _305 = abs(_291);
        float _307 = precise::max(_303, _305);
        float _309 = _301 * _301;
        bool _311 = _307 >= 16.0;
        float _313 = _225 * _295;
        float _315 = _221 * _295;
        float _317 = -_225;
        float _319 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[41].z, _317);
        float _321 = -_221;
        float _323 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[41].z, _321);
        float _325 = _291;
        float _327 = _293;
        int _330 = as_type<int>(_323);
        if (_311)
        {
            float _332 = _291 * 0.0625;
            _325 = _332;
        }
        float _334 = _325;
        if (_311)
        {
            float _336 = _293 * 0.0625;
            _327 = _336;
        }
        float _338 = _327;
        float _340 = fma(_319, _319, _309);
        float _342 = abs(_334);
        bool _344 = _342 != 0.0;
        bool _346 = isnan(_342);
        bool _348 = _344 || _346;
        bool _350 = isnan(0.0);
        bool _352 = _348 || _350;
        float _354 = fma(_323, _323, _340);
        float _356 = abs(_338);
        bool _358 = _356 == 0.0;
        float _360 = abs(_338);
        bool _362 = _360 == 0.0;
        bool _364 = !_352;
        bool _366 = _362 && _364;
        float _368 = sqrt(_354);
        bool _370 = false;
        if (_366)
        {
            bool _372 = as_type<int>(_338) >= 0;
            _370 = _372;
        }
        bool _374 = _370;
        int _376 = _374 ? (-1) : 0;
        if (_366)
        {
            int _378 = _374 ? 0 : 1078530011;
            _330 = _378;
        }
        int _380 = _330;
        int _382 = _380;
        if (_366)
        {
            int _384 = int(0x80000000) & as_type<int>(_334);
            int _386 = _380 | _384;
            _382 = _386;
        }
        int _388 = _382;
        bool _390 = !_352;
        bool _392 = _390 && _358;
        int _394 = _388;
        float _396 = as_type<float>(_388);
        if (!_392)
        {
            float _398 = abs(_334);
            bool _400 = _398 != as_type<float>(0x7f800000u /* inf */);
            bool _402 = isnan(_398);
            bool _404 = _400 || _402;
            bool _406 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _408 = _404 || _406;
            float _410 = abs(_338);
            bool _412 = _410 == as_type<float>(0x7f800000u /* inf */);
            float _414 = abs(_338);
            bool _416 = _414 == as_type<float>(0x7f800000u /* inf */);
            bool _418 = !_408;
            bool _420 = _416 && _418;
            if (_420)
            {
                bool _422 = as_type<int>(_338) >= 0;
                _376 = _422 ? (-1) : 0;
            }
            int _424 = _376;
            if (_420)
            {
                _394 = 1075235812;
            }
            int _426 = _394;
            int _428 = _426;
            if (_420)
            {
                int _430 = ~_424;
                int _432 = (_430 != 0) ? _426 : 1061752795;
                _428 = _432;
            }
            int _434 = _428;
            float _436 = as_type<float>(_434);
            if (_420)
            {
                int _438 = int(0x80000000) & as_type<int>(_334);
                int _440 = _434 | _438;
                _436 = as_type<float>(_440);
            }
            float _442 = _436;
            bool _444 = !_408;
            bool _446 = _444 && _412;
            _396 = _442;
            if (!_446)
            {
                float _448 = abs(_334);
                float _450 = abs(_338);
                float _452 = precise::max(_448, _450);
                float _454 = abs(_334);
                float _456 = abs(_338);
                float _458 = precise::min(_454, _456);
                float _460 = 1.0 / _452;
                float _462 = abs(_334);
                float _464 = abs(_338);
                bool _466 = _462 > _464;
                bool _468 = as_type<int>(_338) >= 0;
                float _470 = _458 * _460;
                float _472 = abs(_334);
                float _474 = abs(_338);
                float _476 = _472 + _474;
                int _478 = as_type<int>(_334) & int(0x80000000);
                float _480 = _470 * _470;
                bool _482 = _476 > as_type<float>(0x7f800000u /* inf */);
                bool _484 = isnan(_476);
                bool _486 = _482 || _484;
                bool _488 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _490 = _486 || _488;
                float _492 = _480 + 11.33538818359375;
                float _494 = fma(_480, _492, 28.84246826171875);
                float _496 = fma(_480, _494, 19.6966705322265625);
                float _498 = fma(_480, -0.82336294651031494140625, -5.674867153167724609375);
                float _500 = fma(_480, _498, -6.565555095672607421875);
                float _502 = 1.0 / _496;
                float _504 = _480 * _500;
                float _506 = _470 * _504;
                float _508 = fma(_506, _502, _470);
                float _510 = _508;
                _396 = _476;
                if (_466)
                {
                    float _512 = -_508;
                    float _514 = _512 + 1.57079637050628662109375;
                    _510 = _514;
                }
                float _516 = _510;
                int _518 = as_type<int>(_516);
                if (!_468)
                {
                    float _520 = -_516;
                    float _522 = _520 + 3.1415927410125732421875;
                    _518 = as_type<int>(_522);
                }
                int _524 = _518;
                if (!_490)
                {
                    int _526 = _478 | _524;
                    _396 = as_type<float>(_526);
                }
            }
        }
        float _528 = _396;
        float _530 = fma(_528, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _532 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _534 = _368 + _532;
        float _536 = fma(_313, _530, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _538 = fma(_315, _530, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _283 = _536;
        _285 = _538;
        _287 = _534;
    }
    float _540 = _283;
    float _542 = _285;
    float _544 = _287;
    float _546 = fma(_540, 6.2500002968590706586837768554688e-05, 0.5);
    float _548 = fma(_542, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2094 = float2(_546, _548);
    float _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2094, float2(0.0), isnan(_2094))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2094, float2(0.0), isnan(_2094))).x;
    float2 _2102 = float2(_87, _89);
    float4 _553 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2102, float2(0.0), isnan(_2102)), int2(0), component::x).xyzw;
    float _555 = _553.x;
    float _557 = _553.y;
    float _559 = _553.z;
    float _561 = _553.w;
    float2 _2118 = float2(_87, _89);
    float4 _563 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2118, float2(0.0), isnan(_2118)), int2(0), component::w).xyzw;
    float _565 = _563.x;
    float _567 = _563.y;
    float _569 = _563.z;
    float _571 = _563.w;
    float _573 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _575 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float2 _2147 = float2(_546, _548);
    float _577 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2147, float2(0.0), isnan(_2147)), level(_550)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2147, float2(0.0), isnan(_2147)), level(_550)).x;
    float2 _2156 = float2(_573, _575);
    float _579 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2156, float2(0.0), isnan(_2156))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2156, float2(0.0), isnan(_2156))).x;
    float _581 = _277 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _583 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[35].x, _581);
    float _585 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].z, _583);
    float _587 = -_585;
    float _589 = fma(_587, _585, 1.0);
    float _591 = -_585;
    float _593 = fma(_591, (*spvDescriptorSet0.fp_c3)._m0[35].z, _279);
    float _595 = -_585;
    float _597 = fma(_595, (*spvDescriptorSet0.fp_c3)._m0[35].y, _277);
    float _599 = -_585;
    float _601 = fma(_599, (*spvDescriptorSet0.fp_c3)._m0[35].x, _275);
    float _603 = _589 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _605 = abs(_167);
    float _607 = log2(_605);
    float _609 = fma(_593, _603, _167);
    float _611 = fma(_597, _603, _171);
    float _613 = fma(_601, _603, _173);
    float _615 = -_609;
    bool _617 = _615 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _619 = float(_617);
    float _621 = -_609;
    bool _623 = _621 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _625 = float(_623);
    float _627 = _619 + _625;
    float _629 = _607 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _631 = precise::min(_627, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _633 = exp2(_629);
    float _635 = trunc(_631);
    int _637 = int(_635);
    int _639 = _637 << 6;
    bool _641 = _637 != 0;
    int _643 = _639 + 32;
    uint _646 = uint(int(uint(_643) >> uint(2)));
    uint _648 = uint(int(uint(int(_646)) >> uint(2)));
    int _650 = int(_646) & 3;
    float _652 = (*spvDescriptorSet0.fp_c3)._m0[int(_648)][_650];
    int _654 = int(_646) + 1;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    int _658 = _654 & 3;
    float _660 = (*spvDescriptorSet0.fp_c3)._m0[int(_656)][_658];
    int _662 = _639 + 16;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    uint _666 = uint(int(uint(int(_664)) >> uint(2)));
    int _668 = int(_664) & 3;
    float _670 = (*spvDescriptorSet0.fp_c3)._m0[int(_666)][_668];
    int _672 = int(_664) + 1;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    int _676 = _672 & 3;
    float _678 = (*spvDescriptorSet0.fp_c3)._m0[int(_674)][_676];
    uint _680 = uint(int(uint(_639) >> uint(2)));
    uint _682 = uint(int(uint(int(_680)) >> uint(2)));
    int _684 = int(_680) & 3;
    float _686 = (*spvDescriptorSet0.fp_c3)._m0[int(_682)][_684];
    int _688 = int(_680) + 1;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    int _692 = _688 & 3;
    float _694 = (*spvDescriptorSet0.fp_c3)._m0[int(_690)][_692];
    int _696 = _639 + 48;
    uint _698 = uint(int(uint(_696) >> uint(2)));
    uint _700 = uint(int(uint(int(_698)) >> uint(2)));
    int _702 = int(_698) & 3;
    float _704 = (*spvDescriptorSet0.fp_c3)._m0[int(_700)][_702];
    int _706 = int(_698) + 1;
    uint _708 = uint(int(uint(_706) >> uint(2)));
    int _710 = _706 & 3;
    float _712 = (*spvDescriptorSet0.fp_c3)._m0[int(_708)][_710];
    float _714 = _611 * _660;
    float _716 = _611 * _678;
    float _718 = _611 * _694;
    float _720 = fma(_613, _670, _716);
    int _722 = _639 + 24;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.fp_c3)._m0[int(_726)][_728];
    int _732 = int(_724) + 1;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    int _736 = _732 & 3;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[int(_734)][_736];
    float _740 = fma(_613, _686, _718);
    float _742 = _611 * _712;
    float _744 = fma(_613, _652, _714);
    float _746 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    int _748 = _639 + 8;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.fp_c3)._m0[int(_760)][_762];
    float _766 = fma(_613, _704, _742);
    float _768 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _770 = floor(_746);
    float _772 = fma(_633, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _774 = precise::clamp(_772, 0.0, 1.0);
    float _776 = floor(_768);
    float _778 = fma(_774, -2.0, 3.0);
    float _780 = _774 * _774;
    float _782 = _780 * _778;
    float _784 = -_770;
    float _786 = _746 + _784;
    float _788 = -_782;
    float _790 = _788 + 1.0;
    float _792 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _794 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _796 = _786 + _794;
    float _798 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[44].w, _782);
    float _800 = -_776;
    float _802 = _768 + _800;
    float _804 = precise::max(0.0, _792);
    float _806 = -_796;
    float _808 = _806 + 1.0;
    float _810 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _812 = _802 + _810;
    float _814 = _798 * _804;
    float _816 = -_812;
    float _818 = _816 + 1.0;
    float _820 = _796 * _812;
    float _822 = _812 * _808;
    float _824 = _796 * _818;
    float _826 = _808 * _818;
    int _828 = _639 + 40;
    uint _830 = uint(int(uint(_828) >> uint(2)));
    uint _832 = uint(int(uint(int(_830)) >> uint(2)));
    int _834 = int(_830) & 3;
    float _836 = (*spvDescriptorSet0.fp_c3)._m0[int(_832)][_834];
    int _838 = int(_830) + 1;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    int _842 = _838 & 3;
    float _844 = (*spvDescriptorSet0.fp_c3)._m0[int(_840)][_842];
    float _846 = fma(_609, _756, _740);
    float _848 = fma(_609, _730, _720);
    float _850 = precise::min(_167, -1.0000000116860974230803549289703e-07);
    float _852 = -_557;
    float _854 = fma(_852, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _856 = _846 + _764;
    float _858 = _848 + _738;
    float _860 = -_555;
    float _862 = fma(_860, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _864 = -_559;
    float _866 = fma(_864, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _868 = 1.0 / _850;
    float _870 = -_561;
    float _872 = fma(_870, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _874 = 1.0 / _862;
    float _876 = 1.0 / _854;
    float _878 = _868 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _880 = 1.0 / _866;
    float _882 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _884 = -_167;
    float _886 = fma(_874, _882, _884);
    float _888 = abs(_886);
    float _890 = _888 * _878;
    float _892 = 1.0 / _872;
    float _894 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _896 = -_167;
    float _898 = fma(_876, _894, _896);
    float _900 = fma(_609, _836, _744);
    float _902 = abs(_898);
    float _904 = _902 * _878;
    float _906 = _900 + _844;
    float _908 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _910 = -_167;
    float _912 = fma(_880, _908, _910);
    float _914 = exp2(_890);
    float _916 = abs(_912);
    float _918 = _916 * _878;
    float _920 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _922 = -_167;
    float _924 = fma(_892, _920, _922);
    float _926 = exp2(_904);
    float _928 = abs(_924);
    float _930 = _928 * _878;
    int _932 = _639 + 56;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    uint _936 = uint(int(uint(int(_934)) >> uint(2)));
    int _938 = int(_934) & 3;
    float _940 = (*spvDescriptorSet0.fp_c3)._m0[int(_936)][_938];
    int _942 = int(_934) + 1;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    int _946 = _942 & 3;
    float _948 = (*spvDescriptorSet0.fp_c3)._m0[int(_944)][_946];
    float _950 = exp2(_918);
    float _952 = abs(_822);
    float _954 = _952 * _914;
    float _956 = exp2(_930);
    float _958 = abs(_820);
    float _960 = _958 * _926;
    float _962 = _954 + _960;
    float _964 = abs(_824);
    float _966 = _964 * _950;
    float _968 = _966 + _962;
    float _970 = abs(_826);
    float _972 = _970 * _956;
    float _974 = _972 + _968;
    float _976 = -_972;
    bool _978 = _968 != _976;
    bool _980 = isnan(_968);
    bool _982 = _978 || _980;
    bool _984 = isnan(_976);
    bool _986 = _982 || _984;
    float _988 = 1.0 / _974;
    float _990 = -_579;
    float _992 = _990 + 1.0;
    float _994 = fma(_609, _940, _766);
    float _996 = _994 + _948;
    float _998 = _960 * _988;
    float _1000 = _954 * _988;
    float _1002 = _966 * _988;
    float _1004 = _972 * _988;
    float _1006 = _986 ? _998 : 0.25;
    float _1008 = 1.0 / _996;
    bool _1010 = _167 >= (-8000.0);
    bool _1012 = isnan(_167);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(-8000.0);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _986 ? _1000 : 0.25;
    float _1024 = _1006 * _567;
    float _1026 = _986 ? _1002 : 0.25;
    float _1028 = _1020 * _814;
    float _1030 = fma(_1022, _565, _1024);
    float _1032 = abs(_577);
    float _1034 = _1032 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1036 = _1028 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1038 = fma(_1026, _569, _1030);
    float _1040 = _986 ? _1004 : 0.25;
    float _1042 = -_1034;
    float _1044 = fma(_1020, _1042, 1.0);
    float _1046 = _992 * _1036;
    float _1048 = precise::clamp(_1046, 0.0, 1.0);
    float _1050 = _856 * _1008;
    float _1052 = _906 * _1008;
    float _1054 = precise::clamp(_1052, 0.0, 1.0);
    float _1056 = fma(_1040, _571, _1038);
    float _1058 = -_1048;
    float _1060 = fma(_1058, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1062 = precise::min(_1044, 1.0);
    float _1064 = _858 * _1008;
    float _1066 = precise::min(_1056, 1.0);
    float _1068 = precise::min(_1062, _1060);
    float _1124;
    if (!_641)
    {
        float _1070 = rint(_631);
        float _1072 = precise::max(_1070, 0.0);
        uint _1074 = uint(_1072);
        uint _1076 = clamp(_1074, 0u, 65535u);
        float _1078 = _1054 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1080 = fma(_1078, 0.5, _1064);
        float _1082 = fma(_1078, 0.5, _1050);
        float _1084 = fma(_1078, -0.5, _1050);
        float _1086 = fma(_1078, -0.5, _1064);
        float3 _2949 = float3(_1050, _1080, float(int(_1076)));
        float3 _2953 = select(_2949, float3(0.0), isnan(_2949));
        float _1088 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2953.xy, uint(rint(_2953.z)), _1054);
        float3 _2962 = float3(_1082, _1080, float(int(_1076)));
        float3 _2964 = select(_2962, float3(0.0), isnan(_2962));
        float _1090 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2964.xy, uint(rint(_2964.z)), _1054);
        float3 _2973 = float3(_1084, _1080, float(int(_1076)));
        float3 _2975 = select(_2973, float3(0.0), isnan(_2973));
        float _1092 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2975.xy, uint(rint(_2975.z)), _1054);
        float3 _2984 = float3(_1082, _1064, float(int(_1076)));
        float3 _2986 = select(_2984, float3(0.0), isnan(_2984));
        float _1094 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2986.xy, uint(rint(_2986.z)), _1054);
        float3 _2995 = float3(_1050, _1064, float(int(_1076)));
        float3 _2997 = select(_2995, float3(0.0), isnan(_2995));
        float _1096 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2997.xy, uint(rint(_2997.z)), _1054);
        float3 _3006 = float3(_1084, _1064, float(int(_1076)));
        float3 _3008 = select(_3006, float3(0.0), isnan(_3006));
        float _1098 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3008.xy, uint(rint(_3008.z)), _1054);
        float3 _3017 = float3(_1082, _1086, float(int(_1076)));
        float3 _3019 = select(_3017, float3(0.0), isnan(_3017));
        float _1100 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3019.xy, uint(rint(_3019.z)), _1054);
        float3 _3028 = float3(_1050, _1086, float(int(_1076)));
        float3 _3030 = select(_3028, float3(0.0), isnan(_3028));
        float _1102 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3030.xy, uint(rint(_3030.z)), _1054);
        float3 _3039 = float3(_1084, _1086, float(int(_1076)));
        float3 _3041 = select(_3039, float3(0.0), isnan(_3039));
        float _1104 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3041.xy, uint(rint(_3041.z)), _1054);
        float _1106 = _1090 + _1088;
        float _1108 = _1106 + _1092;
        float _1110 = _1108 + _1094;
        float _1112 = _1110 + _1096;
        float _1114 = _1112 + _1098;
        float _1116 = _1114 + _1100;
        float _1118 = _1116 + _1102;
        float _1120 = _1118 + _1104;
        float _1122 = _1120 * 0.111111111938953399658203125;
        _1124 = _1122;
        _1126 = true;
    }
    else
    {
        float _1128 = rint(_631);
        float _1130 = precise::max(_1128, 0.0);
        uint _1132 = uint(_1130);
        uint _1134 = clamp(_1132, 0u, 65535u);
        float3 _3088 = float3(_1050, _1064, float(int(_1134)));
        float3 _3090 = select(_3088, float3(0.0), isnan(_3088));
        float _1136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3090.xy, uint(rint(_3090.z)), _1054);
        _1124 = _1136;
    }
    _1126 = false;
    float _1138 = _1124;
    float _1140 = _544 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1142 = _544 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1144 = -_167;
    float _1146 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1148 = _1144 + _1146;
    float _1150 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1140);
    float _1152 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1142);
    float _1154 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1150);
    float _1156 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1152);
    float _1158 = _1154 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1160 = _1156 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1162 = trunc(_1158);
    int _1164 = int(_1162);
    float _1166 = trunc(_1160);
    int _1168 = int(_1166);
    int _1170 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1172 = _1164 + _1170;
    int _1174 = _1172 + 1;
    bool _1176 = _1174 >= 0;
    int _1178 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1180 = _1168 + _1178;
    int _1182 = _1180 + 1;
    float _1184 = -_167;
    float _1186 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1188 = _1184 + _1186;
    bool _1190 = _1174 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1192 = !_1176;
    bool _1194 = _1190 || _1192;
    bool _1196 = _1182 < 0;
    bool _1198 = _1196 || _1194;
    bool _1200 = _1182 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1202 = _1200 || _1198;
    float _1204 = as_type<float>(_1164);
    if (_1202)
    {
        _1204 = 1.0;
    }
    float _1206 = _1204;
    float _1208 = _1206;
    if (!_1202)
    {
        int _1210 = _1182 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1212 = _1210 + _1174;
        float _1214 = floor(_1160);
        int _1216 = _1212 << 2;
        int _1218 = _1212 >> 2;
        int _1220 = 12 & _1216;
        int _1222 = _1218 << 4;
        int _1224 = _1222 + _1220;
        float _1226 = floor(_1158);
        uint _1228 = uint(int(uint(_1224) >> uint(2)));
        uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
        int _1232 = int(_1228) & 3;
        float _1234 = (*spvDescriptorSet0.fp_c5)._m0[int(_1230)][_1232];
        float _1236 = -_1214;
        float _1238 = _1160 + _1236;
        float _1240 = -_1226;
        float _1242 = _1158 + _1240;
        float _1244 = rint(_1234);
        float _1246 = precise::max(_1244, 0.0);
        uint _1248 = uint(_1246);
        uint _1250 = clamp(_1248, 0u, 65535u);
        float3 _3277 = float3(_1242, _1238, float(int(_1250)));
        float3 _3279 = select(_3277, float3(0.0), isnan(_3277));
        float _1252 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3279.xy, uint(rint(_3279.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3279.xy, uint(rint(_3279.z)), level(0.0)).x;
        int _1254 = _1212 << 4;
        int _1256 = _1254 + 1648;
        int _1258 = _1224 + 8048;
        uint _1260 = uint(int(uint(_1258) >> uint(2)));
        uint _1262 = uint(int(uint(int(_1260)) >> uint(2)));
        int _1264 = int(_1260) & 3;
        float _1266 = (*spvDescriptorSet0.fp_c5)._m0[int(_1262)][_1264];
        uint _1268 = uint(int(uint(_1256) >> uint(2)));
        uint _1270 = uint(int(uint(int(_1268)) >> uint(2)));
        int _1272 = int(_1268) & 3;
        float _1274 = (*spvDescriptorSet0.fp_c5)._m0[int(_1270)][_1272];
        int _1276 = int(_1268) + 1;
        uint _1278 = uint(int(uint(_1276) >> uint(2)));
        int _1280 = _1276 & 3;
        float _1282 = (*spvDescriptorSet0.fp_c5)._m0[int(_1278)][_1280];
        int _1284 = _1256 + 8;
        uint _1286 = uint(int(uint(_1284) >> uint(2)));
        uint _1288 = uint(int(uint(int(_1286)) >> uint(2)));
        int _1290 = int(_1286) & 3;
        float _1292 = (*spvDescriptorSet0.fp_c5)._m0[int(_1288)][_1290];
        int _1294 = int(_1286) + 1;
        uint _1296 = uint(int(uint(_1294) >> uint(2)));
        int _1298 = _1294 & 3;
        float _1300 = (*spvDescriptorSet0.fp_c5)._m0[int(_1296)][_1298];
        float _1302 = 1.0 / _1266;
        float _1304 = _1266 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1306 = _544 * _1282;
        float _1308 = fma(_540, _1274, _1306);
        float _1310 = fma(_542, _1292, _1308);
        float _1312 = _1310 + _1300;
        float _1314 = precise::clamp(_1312, 0.0, 1.0);
        float _1316 = -_1314;
        float _1318 = _1316 + _1252;
        float _1320 = fma(_1302, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1318);
        float _1322 = _1304 * _1320;
        float _1324 = exp2(_1322);
        float _1326 = 0.0 + _1324;
        float _1328 = precise::clamp(_1326, 0.0, 1.0);
        _1208 = _1328;
    }
    float _1330 = _1208;
    float _1332 = precise::min(_1330, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1334 = -_1138;
    float _1336 = _1334 + 1.0;
    float _1338 = _1148 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1340 = precise::clamp(_1338, 0.0, 1.0);
    float _1342 = _1188 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1344 = precise::clamp(_1342, 0.0, 1.0);
    float _1346 = -_1332;
    float _1348 = _1346 + 1.0;
    float _1350 = fma(_1340, _1336, _1138);
    float _1352 = fma(_1344, _1348, _1332);
    out.m_62.x = _1350;
    out.m_62.y = _1352;
    out.m_62.z = _1066;
    out.m_62.w = _1068;
    out.m_64.x = 1.0;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

