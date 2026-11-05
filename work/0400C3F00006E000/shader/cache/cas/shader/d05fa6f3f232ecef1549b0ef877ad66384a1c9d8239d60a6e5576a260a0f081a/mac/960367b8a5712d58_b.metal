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
    texture2d<float> fp_t_tcb_14 [[id(5)]];
    sampler fp_t_tcb_14Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
    float4 m_60 [[color(1)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1042 = false;
    float _67 = gl_FragCoord.w;
    float _69 = in.m_49.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_49.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float _87 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1310 = float2(_83, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1310, float2(0.0), isnan(_1310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1310, float2(0.0), isnan(_1310))).x;
    float _91 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1325 = float2(_87, _85);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1325, float2(0.0), isnan(_1325))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1325, float2(0.0), isnan(_1325))).x;
    float2 _1333 = float2(_83, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1333, float2(0.0), isnan(_1333))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1333, float2(0.0), isnan(_1333))).x;
    float _97 = in.m_51.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_51.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_53.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_53.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_55.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_55.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _81 * _101;
    float _135 = _81 * _107;
    float _137 = _81 * _113;
    float _139 = _81 * _119;
    float _141 = _81 * _125;
    float _143 = _81 * _131;
    float _145 = -_89;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _149 = 1.0 / _147;
    float _151 = -_93;
    float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _155 = -_95;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _159 = 1.0 / _153;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _163 = _149 * _161;
    float _165 = 1.0 / _157;
    float _167 = _163 * _133;
    float _169 = _163 * _135;
    float _171 = _167 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _173 = _167 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = _159 * _175;
    float _179 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[32].x, _171);
    float _181 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[30].x, _173);
    float _183 = -_169;
    float _185 = fma(_177, _137, _183);
    float _187 = -_167;
    float _189 = fma(_177, _139, _187);
    float _191 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[32].z, _179);
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _195 = _165 * _193;
    float _197 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[30].z, _181);
    float _199 = -_163;
    float _201 = _199 + _177;
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _205 = -_169;
    float _207 = fma(_195, _141, _205);
    float _209 = _197 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _211 = -_167;
    float _213 = fma(_195, _143, _211);
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _217 = _203 + _215;
    float _219 = -_163;
    float _221 = _219 + _195;
    float _223 = _201 * _207;
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _227 = _209 + _225;
    float _229 = _217 * _217;
    float _231 = _189 * _221;
    float _233 = -_223;
    float _235 = fma(_185, _221, _233);
    float _237 = _185 * _213;
    float _239 = fma(_227, _227, _229);
    float _241 = -_231;
    float _243 = fma(_201, _213, _241);
    float _245 = _235 * _235;
    float _247 = -_237;
    float _249 = fma(_189, _207, _247);
    float _251 = sqrt(_239);
    float _253 = fma(_243, _243, _245);
    float _255 = _167 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _257 = fma(_249, _249, _253);
    float _259 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[31].x, _255);
    float _261 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[31].z, _259);
    float _263 = rsqrt(_257);
    float _265 = _261 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _269 = _251 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _271 = _243 * _263;
    float _273 = _235 * _263;
    float _275 = _249 * _263;
    float _277 = _243;
    float _279 = _265;
    float _281 = _203;
    if (!_269)
    {
        _277 = _209;
    }
    float _283 = _277;
    bool _285 = !_269;
    float _287 = _283;
    if (!_285)
    {
        float _289 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _291 = _251 + _289;
        float _293 = _265 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _295 = rsqrt(_239);
        float _297 = -_265;
        float _299 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _301 = _297 + _299;
        float _303 = abs(_293);
        float _305 = abs(_291);
        float _307 = precise::max(_303, _305);
        float _309 = _301 * _301;
        bool _311 = _307 >= 16.0;
        float _313 = _227 * _295;
        float _315 = _217 * _295;
        float _317 = -_227;
        float _319 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[41].z, _317);
        float _321 = -_217;
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
        _279 = _534;
        _287 = _536;
        _281 = _538;
    }
    float _540 = _279;
    float _542 = _287;
    float _544 = _281;
    float2 _2013 = float2(_83, _85);
    float4 _547 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2013, float2(0.0), isnan(_2013)), int2(0), component::x).xyzw;
    float _549 = _547.x;
    float _551 = _547.y;
    float _553 = _547.z;
    float _555 = _547.w;
    float2 _2029 = float2(_83, _85);
    float4 _557 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2029, float2(0.0), isnan(_2029)), int2(0), component::w).xyzw;
    float _559 = _557.x;
    float _561 = _557.y;
    float _563 = _557.z;
    float _565 = _557.w;
    float2 _2045 = float2(_83, _85);
    float _567 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2045, float2(0.0), isnan(_2045))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2045, float2(0.0), isnan(_2045))).x;
    float _569 = _273 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _571 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[35].x, _569);
    float _573 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[35].z, _571);
    float _575 = -_573;
    float _577 = fma(_575, _573, 1.0);
    float _579 = -_573;
    float _581 = fma(_579, (*spvDescriptorSet0.fp_c3)._m0[35].z, _275);
    float _583 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _585 = -_573;
    float _587 = fma(_585, (*spvDescriptorSet0.fp_c3)._m0[35].x, _271);
    float _589 = _577 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _591 = -_573;
    float _593 = fma(_591, (*spvDescriptorSet0.fp_c3)._m0[35].y, _273);
    float _595 = floor(_583);
    float _597 = fma(_581, _589, _163);
    float _599 = fma(_587, _589, _169);
    float _601 = fma(_593, _589, _167);
    float _603 = -_597;
    bool _605 = _603 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _607 = float(_605);
    float _609 = -_597;
    bool _611 = _609 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _613 = float(_611);
    float _615 = _607 + _613;
    float _617 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _619 = -_595;
    float _621 = _583 + _619;
    float _623 = precise::min(_615, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _625 = floor(_617);
    float _627 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _629 = _621 + _627;
    float _631 = -_629;
    float _633 = _631 + 1.0;
    float _635 = trunc(_623);
    int _637 = int(_635);
    float _639 = -_625;
    float _641 = _617 + _639;
    float _643 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _645 = _641 + _643;
    int _647 = _637 << 6;
    float _649 = -_645;
    float _651 = _649 + 1.0;
    float _653 = _645 * _629;
    float _655 = _645 * _633;
    int _657 = _647 + 16;
    uint _660 = uint(int(uint(_657) >> uint(2)));
    uint _662 = uint(int(uint(int(_660)) >> uint(2)));
    int _664 = int(_660) & 3;
    float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
    int _668 = int(_660) + 1;
    uint _670 = uint(int(uint(_668) >> uint(2)));
    int _672 = _668 & 3;
    float _674 = (*spvDescriptorSet0.fp_c3)._m0[int(_670)][_672];
    float _676 = _629 * _651;
    float _678 = _651 * _633;
    bool _680 = _637 != 0;
    uint _682 = uint(int(uint(_647) >> uint(2)));
    uint _684 = uint(int(uint(int(_682)) >> uint(2)));
    int _686 = int(_682) & 3;
    float _688 = (*spvDescriptorSet0.fp_c3)._m0[int(_684)][_686];
    int _690 = int(_682) + 1;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    int _694 = _690 & 3;
    float _696 = (*spvDescriptorSet0.fp_c3)._m0[int(_692)][_694];
    int _698 = _647 + 32;
    uint _700 = uint(int(uint(_698) >> uint(2)));
    uint _702 = uint(int(uint(int(_700)) >> uint(2)));
    int _704 = int(_700) & 3;
    float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
    int _708 = int(_700) + 1;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    int _712 = _708 & 3;
    float _714 = (*spvDescriptorSet0.fp_c3)._m0[int(_710)][_712];
    int _716 = _647 + 24;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    uint _720 = uint(int(uint(int(_718)) >> uint(2)));
    int _722 = int(_718) & 3;
    float _724 = (*spvDescriptorSet0.fp_c3)._m0[int(_720)][_722];
    int _726 = int(_718) + 1;
    uint _728 = uint(int(uint(_726) >> uint(2)));
    int _730 = _726 & 3;
    float _732 = (*spvDescriptorSet0.fp_c3)._m0[int(_728)][_730];
    int _734 = _647 + 48;
    uint _736 = uint(int(uint(_734) >> uint(2)));
    uint _738 = uint(int(uint(int(_736)) >> uint(2)));
    int _740 = int(_736) & 3;
    float _742 = (*spvDescriptorSet0.fp_c3)._m0[int(_738)][_740];
    int _744 = int(_736) + 1;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    int _748 = _744 & 3;
    float _750 = (*spvDescriptorSet0.fp_c3)._m0[int(_746)][_748];
    int _752 = _647 + 8;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    uint _756 = uint(int(uint(int(_754)) >> uint(2)));
    int _758 = int(_754) & 3;
    float _760 = (*spvDescriptorSet0.fp_c3)._m0[int(_756)][_758];
    int _762 = int(_754) + 1;
    uint _764 = uint(int(uint(_762) >> uint(2)));
    int _766 = _762 & 3;
    float _768 = (*spvDescriptorSet0.fp_c3)._m0[int(_764)][_766];
    float _770 = _601 * _674;
    float _772 = _601 * _696;
    float _774 = fma(_599, _666, _770);
    int _776 = _647 + 40;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    uint _780 = uint(int(uint(int(_778)) >> uint(2)));
    int _782 = int(_778) & 3;
    float _784 = (*spvDescriptorSet0.fp_c3)._m0[int(_780)][_782];
    int _786 = int(_778) + 1;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    int _790 = _786 & 3;
    float _792 = (*spvDescriptorSet0.fp_c3)._m0[int(_788)][_790];
    float _794 = fma(_599, _688, _772);
    float _796 = _601 * _714;
    float _798 = fma(_599, _706, _796);
    float _800 = precise::min(_163, -1.0000000116860974230803549289703e-07);
    float _802 = fma(_597, _724, _774);
    float _804 = 1.0 / _800;
    float _806 = _802 + _732;
    float _808 = _601 * _750;
    float _810 = fma(_599, _742, _808);
    int _812 = _647 + 56;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.fp_c3)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.fp_c3)._m0[int(_824)][_826];
    float _830 = fma(_597, _760, _794);
    float _832 = _830 + _768;
    float _834 = fma(_597, _784, _798);
    float _836 = fma(_597, _820, _810);
    float _838 = _836 + _828;
    float _840 = 1.0 / _838;
    float _842 = _832 * _840;
    float _844 = -_549;
    float _846 = fma(_844, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _848 = -_553;
    float _850 = fma(_848, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _852 = -_551;
    float _854 = fma(_852, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _856 = -_555;
    float _858 = fma(_856, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _860 = 1.0 / _846;
    float _862 = _804 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _864 = 1.0 / _854;
    float _866 = 1.0 / _850;
    float _868 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _870 = -_163;
    float _872 = fma(_860, _868, _870);
    float _874 = abs(_872);
    float _876 = _874 * _862;
    float _878 = 1.0 / _858;
    float _880 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _882 = -_163;
    float _884 = fma(_864, _880, _882);
    float _886 = abs(_884);
    float _888 = _886 * _862;
    float _890 = _834 + _792;
    float _892 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _894 = -_163;
    float _896 = fma(_866, _892, _894);
    float _898 = exp2(_876);
    float _900 = _890 * _840;
    float _902 = precise::clamp(_900, 0.0, 1.0);
    float _904 = abs(_896);
    float _906 = _904 * _862;
    float _908 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _910 = -_163;
    float _912 = fma(_878, _908, _910);
    float _914 = exp2(_888);
    float _916 = abs(_912);
    float _918 = _916 * _862;
    float _920 = exp2(_906);
    float _922 = abs(_676);
    float _924 = _922 * _898;
    float _926 = exp2(_918);
    float _928 = abs(_653);
    float _930 = _928 * _914;
    float _932 = _924 + _930;
    float _934 = abs(_655);
    float _936 = _934 * _920;
    float _938 = _936 + _932;
    float _940 = abs(_678);
    float _942 = _940 * _926;
    float _944 = _942 + _938;
    float _946 = -_942;
    bool _948 = _938 != _946;
    bool _950 = isnan(_938);
    bool _952 = _948 || _950;
    bool _954 = isnan(_946);
    bool _956 = _952 || _954;
    float _958 = 1.0 / _944;
    float _960 = _930 * _958;
    float _962 = _924 * _958;
    float _964 = _936 * _958;
    float _966 = _942 * _958;
    float _968 = _956 ? _960 : 0.25;
    float _970 = _956 ? _962 : 0.25;
    float _972 = _956 ? _966 : 0.25;
    float _974 = _968 * _561;
    float _976 = _956 ? _964 : 0.25;
    float _978 = fma(_970, _559, _974);
    float _980 = fma(_976, _563, _978);
    float _982 = _806 * _840;
    float _984 = fma(_972, _565, _980);
    float _1040;
    if (!_680)
    {
        float _986 = rint(_623);
        float _988 = precise::max(_986, 0.0);
        uint _990 = uint(_988);
        uint _992 = clamp(_990, 0u, 65535u);
        float _994 = _902 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _996 = fma(_994, 0.5, _982);
        float _998 = fma(_994, 0.5, _842);
        float _1000 = fma(_994, -0.5, _842);
        float _1002 = fma(_994, -0.5, _982);
        float3 _2737 = float3(_842, _996, float(int(_992)));
        float3 _2741 = select(_2737, float3(0.0), isnan(_2737));
        float _1004 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2741.xy, uint(rint(_2741.z)), _902);
        float3 _2750 = float3(_998, _996, float(int(_992)));
        float3 _2752 = select(_2750, float3(0.0), isnan(_2750));
        float _1006 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2752.xy, uint(rint(_2752.z)), _902);
        float3 _2761 = float3(_1000, _996, float(int(_992)));
        float3 _2763 = select(_2761, float3(0.0), isnan(_2761));
        float _1008 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2763.xy, uint(rint(_2763.z)), _902);
        float3 _2772 = float3(_998, _982, float(int(_992)));
        float3 _2774 = select(_2772, float3(0.0), isnan(_2772));
        float _1010 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2774.xy, uint(rint(_2774.z)), _902);
        float3 _2783 = float3(_842, _982, float(int(_992)));
        float3 _2785 = select(_2783, float3(0.0), isnan(_2783));
        float _1012 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2785.xy, uint(rint(_2785.z)), _902);
        float3 _2794 = float3(_1000, _982, float(int(_992)));
        float3 _2796 = select(_2794, float3(0.0), isnan(_2794));
        float _1014 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2796.xy, uint(rint(_2796.z)), _902);
        float3 _2805 = float3(_998, _1002, float(int(_992)));
        float3 _2807 = select(_2805, float3(0.0), isnan(_2805));
        float _1016 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2807.xy, uint(rint(_2807.z)), _902);
        float3 _2816 = float3(_842, _1002, float(int(_992)));
        float3 _2818 = select(_2816, float3(0.0), isnan(_2816));
        float _1018 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2818.xy, uint(rint(_2818.z)), _902);
        float3 _2827 = float3(_1000, _1002, float(int(_992)));
        float3 _2829 = select(_2827, float3(0.0), isnan(_2827));
        float _1020 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2829.xy, uint(rint(_2829.z)), _902);
        float _1022 = _1006 + _1004;
        float _1024 = _1022 + _1008;
        float _1026 = _1024 + _1010;
        float _1028 = _1026 + _1012;
        float _1030 = _1028 + _1014;
        float _1032 = _1030 + _1016;
        float _1034 = _1032 + _1018;
        float _1036 = _1034 + _1020;
        float _1038 = _1036 * 0.111111111938953399658203125;
        _1040 = _1038;
        _1042 = true;
    }
    else
    {
        float _1044 = rint(_623);
        float _1046 = precise::max(_1044, 0.0);
        uint _1048 = uint(_1046);
        uint _1050 = clamp(_1048, 0u, 65535u);
        float3 _2876 = float3(_842, _982, float(int(_1050)));
        float3 _2878 = select(_2876, float3(0.0), isnan(_2876));
        float _1052 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2878.xy, uint(rint(_2878.z)), _902);
        _1040 = _1052;
    }
    _1042 = false;
    float _1054 = _1040;
    float _1056 = _540 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1058 = _540 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1060 = -_163;
    float _1062 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1064 = _1060 + _1062;
    float _1066 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1056);
    float _1068 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1058);
    float _1070 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1066);
    float _1072 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1068);
    float _1074 = _1070 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1076 = _1072 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1078 = trunc(_1074);
    int _1080 = int(_1078);
    float _1082 = trunc(_1076);
    int _1084 = int(_1082);
    int _1086 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1088 = _1080 + _1086;
    int _1090 = _1088 + 1;
    bool _1092 = _1090 >= 0;
    int _1094 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1096 = _1084 + _1094;
    int _1098 = _1096 + 1;
    float _1100 = -_163;
    float _1102 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1104 = _1100 + _1102;
    bool _1106 = _1090 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1108 = !_1092;
    bool _1110 = _1106 || _1108;
    bool _1112 = _1098 < 0;
    bool _1114 = _1112 || _1110;
    bool _1116 = _1098 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1118 = _1116 || _1114;
    float _1120 = as_type<float>(_1080);
    if (_1118)
    {
        _1120 = 1.0;
    }
    float _1122 = _1120;
    float _1124 = _1122;
    if (!_1118)
    {
        int _1126 = _1098 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1128 = _1126 + _1090;
        float _1130 = floor(_1076);
        int _1132 = _1128 << 2;
        int _1134 = _1128 >> 2;
        int _1136 = 12 & _1132;
        int _1138 = _1134 << 4;
        int _1140 = _1138 + _1136;
        float _1142 = floor(_1074);
        uint _1144 = uint(int(uint(_1140) >> uint(2)));
        uint _1146 = uint(int(uint(int(_1144)) >> uint(2)));
        int _1148 = int(_1144) & 3;
        float _1150 = (*spvDescriptorSet0.fp_c5)._m0[int(_1146)][_1148];
        float _1152 = -_1130;
        float _1154 = _1076 + _1152;
        float _1156 = -_1142;
        float _1158 = _1074 + _1156;
        float _1160 = rint(_1150);
        float _1162 = precise::max(_1160, 0.0);
        uint _1164 = uint(_1162);
        uint _1166 = clamp(_1164, 0u, 65535u);
        float3 _3065 = float3(_1158, _1154, float(int(_1166)));
        float3 _3067 = select(_3065, float3(0.0), isnan(_3065));
        float _1168 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3067.xy, uint(rint(_3067.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3067.xy, uint(rint(_3067.z)), level(0.0)).x;
        int _1170 = _1128 << 4;
        int _1172 = _1170 + 1648;
        int _1174 = _1140 + 8048;
        uint _1176 = uint(int(uint(_1174) >> uint(2)));
        uint _1178 = uint(int(uint(int(_1176)) >> uint(2)));
        int _1180 = int(_1176) & 3;
        float _1182 = (*spvDescriptorSet0.fp_c5)._m0[int(_1178)][_1180];
        uint _1184 = uint(int(uint(_1172) >> uint(2)));
        uint _1186 = uint(int(uint(int(_1184)) >> uint(2)));
        int _1188 = int(_1184) & 3;
        float _1190 = (*spvDescriptorSet0.fp_c5)._m0[int(_1186)][_1188];
        int _1192 = int(_1184) + 1;
        uint _1194 = uint(int(uint(_1192) >> uint(2)));
        int _1196 = _1192 & 3;
        float _1198 = (*spvDescriptorSet0.fp_c5)._m0[int(_1194)][_1196];
        int _1200 = _1172 + 8;
        uint _1202 = uint(int(uint(_1200) >> uint(2)));
        uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
        int _1206 = int(_1202) & 3;
        float _1208 = (*spvDescriptorSet0.fp_c5)._m0[int(_1204)][_1206];
        int _1210 = int(_1202) + 1;
        uint _1212 = uint(int(uint(_1210) >> uint(2)));
        int _1214 = _1210 & 3;
        float _1216 = (*spvDescriptorSet0.fp_c5)._m0[int(_1212)][_1214];
        float _1218 = _1182 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1220 = _540 * _1198;
        float _1222 = fma(_542, _1190, _1220);
        float _1224 = 1.0 / _1182;
        float _1226 = fma(_544, _1208, _1222);
        float _1228 = _1226 + _1216;
        float _1230 = precise::clamp(_1228, 0.0, 1.0);
        float _1232 = -_1230;
        float _1234 = _1232 + _1168;
        float _1236 = fma(_1224, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1234);
        float _1238 = _1218 * _1236;
        float _1240 = exp2(_1238);
        float _1242 = 0.0 + _1240;
        float _1244 = precise::clamp(_1242, 0.0, 1.0);
        _1124 = _1244;
    }
    float _1246 = _1124;
    float _1248 = precise::min(_1246, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1250 = _1104 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1252 = precise::clamp(_1250, 0.0, 1.0);
    float _1254 = _1064 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1256 = precise::clamp(_1254, 0.0, 1.0);
    float _1258 = -_1054;
    float _1260 = _1258 + 1.0;
    float _1262 = precise::min(_984, 1.0);
    float _1264 = -_1248;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_1252, _1260, _1054);
    float _1270 = fma(_1256, _1266, _1248);
    out.m_58.x = _1268;
    out.m_58.y = _1270;
    out.m_58.z = _1262;
    out.m_58.w = 1.0;
    out.m_60.x = _567;
    out.m_60.y = 0.5;
    out.m_60.z = 0.5;
    out.m_60.w = 1.0;
    return out;
}

