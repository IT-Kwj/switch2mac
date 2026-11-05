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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_ESmplr_w [[id(17)]];
    sampler fp_t_tcb_12Smplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
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
    bool _935 = false;
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
    float2 _1199 = float2(_83, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1199, float2(0.0), isnan(_1199))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1199, float2(0.0), isnan(_1199))).x;
    float _91 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1214 = float2(_87, _85);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1214, float2(0.0), isnan(_1214))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1214, float2(0.0), isnan(_1214))).x;
    float2 _1222 = float2(_83, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1222, float2(0.0), isnan(_1222))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1222, float2(0.0), isnan(_1222))).x;
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
    float _149 = -_93;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _153 = 1.0 / _147;
    float _155 = -_95;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _159 = 1.0 / _151;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _163 = _153 * _161;
    float _165 = 1.0 / _157;
    float _167 = _163 * _133;
    float _169 = _163 * _135;
    float _171 = _167 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _175 = _159 * _173;
    float _177 = _167 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _179 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[32].x, _171);
    float _181 = -_169;
    float _183 = fma(_175, _137, _181);
    float _185 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[30].x, _177);
    float _187 = -_167;
    float _189 = fma(_175, _139, _187);
    float _191 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[32].z, _179);
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _195 = _165 * _193;
    float _197 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _199 = -_163;
    float _201 = _199 + _175;
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
    float _235 = fma(_183, _221, _233);
    float _237 = _183 * _213;
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
    float _271 = _249 * _263;
    float _273 = _243 * _263;
    float _275 = _235 * _263;
    float _277 = _253;
    float _279 = _183;
    float _281 = _249;
    int _284 = as_type<int>(_203);
    float _286 = _163;
    if (!_269)
    {
        _277 = _209;
    }
    float _288 = _277;
    float _290 = _288;
    if (!_269)
    {
        _279 = _203;
    }
    float _292 = _279;
    float _294 = _292;
    if (!_269)
    {
        _281 = _265;
    }
    float _296 = _281;
    bool _298 = !_269;
    float _300 = _296;
    if (!_298)
    {
        float _302 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _304 = _251 + _302;
        float _306 = _265 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _308 = rsqrt(_239);
        float _310 = -_265;
        float _312 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _314 = _310 + _312;
        float _316 = abs(_306);
        float _318 = abs(_304);
        float _320 = precise::max(_316, _318);
        float _322 = _314 * _314;
        bool _324 = _320 >= 16.0;
        float _326 = _227 * _308;
        float _328 = _217 * _308;
        float _330 = -_227;
        float _332 = fma(_326, (*spvDescriptorSet0.fp_c3)._m0[41].z, _330);
        float _334 = _304;
        float _336 = _306;
        if (_324)
        {
            float _338 = _304 * 0.0625;
            _334 = _338;
        }
        float _340 = _334;
        if (_324)
        {
            float _342 = _306 * 0.0625;
            _336 = _342;
        }
        float _344 = _336;
        float _346 = -_217;
        float _348 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[41].z, _346);
        float _350 = fma(_332, _332, _322);
        float _352 = abs(_340);
        bool _354 = _352 != 0.0;
        bool _356 = isnan(_352);
        bool _358 = _354 || _356;
        bool _360 = isnan(0.0);
        bool _362 = _358 || _360;
        float _364 = fma(_348, _348, _350);
        float _366 = abs(_344);
        bool _368 = _366 == 0.0;
        float _370 = abs(_344);
        bool _372 = _370 == 0.0;
        bool _374 = !_362;
        bool _376 = _372 && _374;
        float _378 = sqrt(_364);
        bool _380 = false;
        float _382 = _348;
        int _384 = as_type<int>(_364);
        if (_376)
        {
            bool _386 = as_type<int>(_344) >= 0;
            _380 = _386;
        }
        bool _388 = _380;
        int _390 = _388 ? (-1) : 0;
        if (_376)
        {
            int _392 = _388 ? 0 : 1078530011;
            _284 = _392;
        }
        int _394 = _284;
        if (_376)
        {
            int _396 = int(0x80000000) & as_type<int>(_340);
            int _398 = _394 | _396;
            _382 = as_type<float>(_398);
        }
        float _400 = _382;
        bool _402 = !_362;
        bool _404 = _402 && _368;
        float _406 = _400;
        float _408 = _400;
        if (!_404)
        {
            float _410 = abs(_340);
            bool _412 = _410 != as_type<float>(0x7f800000u /* inf */);
            bool _414 = isnan(_410);
            bool _416 = _412 || _414;
            bool _418 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _420 = _416 || _418;
            float _422 = abs(_344);
            bool _424 = _422 == as_type<float>(0x7f800000u /* inf */);
            float _426 = abs(_344);
            bool _428 = _426 == as_type<float>(0x7f800000u /* inf */);
            bool _430 = !_420;
            bool _432 = _428 && _430;
            if (_432)
            {
                bool _434 = as_type<int>(_344) >= 0;
                _390 = _434 ? (-1) : 0;
            }
            int _436 = _390;
            if (_432)
            {
                _384 = 1075235812;
            }
            int _438 = _384;
            int _440 = _438;
            if (_432)
            {
                int _442 = ~_436;
                int _444 = (_442 != 0) ? _438 : 1061752795;
                _440 = _444;
            }
            int _446 = _440;
            if (_432)
            {
                int _448 = int(0x80000000) & as_type<int>(_340);
                int _450 = _446 | _448;
                _406 = as_type<float>(_450);
            }
            float _452 = _406;
            bool _454 = !_420;
            bool _456 = _454 && _424;
            _408 = _452;
            if (!_456)
            {
                float _458 = abs(_340);
                float _460 = abs(_344);
                float _462 = precise::max(_458, _460);
                float _464 = abs(_340);
                float _466 = abs(_344);
                float _468 = precise::min(_464, _466);
                float _470 = 1.0 / _462;
                float _472 = abs(_340);
                float _474 = abs(_344);
                bool _476 = _472 > _474;
                bool _478 = as_type<int>(_344) >= 0;
                float _480 = abs(_340);
                float _482 = abs(_344);
                float _484 = _480 + _482;
                int _486 = as_type<int>(_340) & int(0x80000000);
                bool _488 = _484 > as_type<float>(0x7f800000u /* inf */);
                bool _490 = isnan(_484);
                bool _492 = _488 || _490;
                bool _494 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _496 = _492 || _494;
                float _498 = _468 * _470;
                float _500 = _498 * _498;
                float _502 = _500 + 11.33538818359375;
                float _504 = fma(_500, _502, 28.84246826171875);
                float _506 = fma(_500, _504, 19.6966705322265625);
                float _508 = fma(_500, -0.82336294651031494140625, -5.674867153167724609375);
                float _510 = fma(_500, _508, -6.565555095672607421875);
                float _512 = 1.0 / _506;
                float _514 = _500 * _510;
                float _516 = _498 * _514;
                float _518 = fma(_516, _512, _498);
                float _520 = _518;
                _408 = _484;
                if (_476)
                {
                    float _522 = -_518;
                    float _524 = _522 + 1.57079637050628662109375;
                    _520 = _524;
                }
                float _526 = _520;
                int _528 = as_type<int>(_526);
                if (!_478)
                {
                    float _530 = -_526;
                    float _532 = _530 + 3.1415927410125732421875;
                    _528 = as_type<int>(_532);
                }
                int _534 = _528;
                if (!_496)
                {
                    int _536 = _486 | _534;
                    _408 = as_type<float>(_536);
                }
            }
        }
        float _538 = _408;
        float _540 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _542 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _544 = _378 + _542;
        float _546 = fma(_326, _540, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _548 = fma(_328, _540, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _290 = _546;
        _294 = _548;
        _300 = _544;
    }
    float _550 = _290;
    float _552 = _294;
    float _554 = _300;
    float _556 = fma(_550, 6.2500002968590706586837768554688e-05, 0.5);
    float _558 = fma(_552, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1923 = float2(_556, _558);
    float _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1923, float2(0.0), isnan(_1923))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1923, float2(0.0), isnan(_1923))).x;
    float _562 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _564 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float2 _1944 = float2(_556, _558);
    float _566 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1944, float2(0.0), isnan(_1944)), level(_560)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1944, float2(0.0), isnan(_1944)), level(_560)).x;
    float2 _1953 = float2(_562, _564);
    float _568 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1953, float2(0.0), isnan(_1953))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1953, float2(0.0), isnan(_1953))).x;
    float _570 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _572 = abs(_163);
    float _574 = log2(_572);
    float _576 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].x, _570);
    float _578 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[35].z, _576);
    float _580 = -_578;
    float _582 = fma(_580, _578, 1.0);
    float _584 = -_578;
    float _586 = fma(_584, (*spvDescriptorSet0.fp_c3)._m0[35].z, _271);
    float _588 = -_578;
    float _590 = fma(_588, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _592 = -_578;
    float _594 = fma(_592, (*spvDescriptorSet0.fp_c3)._m0[35].x, _273);
    float _596 = _582 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _598 = _574 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _600 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _602 = fma(_586, _596, _163);
    float _604 = fma(_590, _596, _167);
    float _606 = fma(_594, _596, _169);
    float _608 = exp2(_598);
    float _610 = precise::max(0.0, _600);
    float _612 = -_602;
    bool _614 = _612 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _616 = float(_614);
    float _618 = -_602;
    bool _620 = _618 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _622 = float(_620);
    float _624 = _616 + _622;
    float _626 = precise::min(_624, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _628 = fma(_608, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _630 = precise::clamp(_628, 0.0, 1.0);
    float _632 = trunc(_626);
    int _634 = int(_632);
    float _636 = fma(_630, -2.0, 3.0);
    float _638 = _630 * _630;
    float _640 = _638 * _636;
    float _642 = -_640;
    float _644 = _642 + 1.0;
    float _646 = fma(_644, (*spvDescriptorSet0.fp_c3)._m0[44].w, _640);
    int _648 = _634 << 6;
    float _650 = _646 * _610;
    bool _652 = _634 != 0;
    int _654 = _648 + 48;
    uint _657 = uint(int(uint(_654) >> uint(2)));
    uint _659 = uint(int(uint(int(_657)) >> uint(2)));
    int _661 = int(_657) & 3;
    float _663 = (*spvDescriptorSet0.fp_c3)._m0[int(_659)][_661];
    int _665 = int(_657) + 1;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    int _669 = _665 & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    uint _673 = uint(int(uint(_648) >> uint(2)));
    uint _675 = uint(int(uint(int(_673)) >> uint(2)));
    int _677 = int(_673) & 3;
    float _679 = (*spvDescriptorSet0.fp_c3)._m0[int(_675)][_677];
    int _681 = int(_673) + 1;
    uint _683 = uint(int(uint(_681) >> uint(2)));
    int _685 = _681 & 3;
    float _687 = (*spvDescriptorSet0.fp_c3)._m0[int(_683)][_685];
    int _689 = _648 + 16;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    uint _693 = uint(int(uint(int(_691)) >> uint(2)));
    int _695 = int(_691) & 3;
    float _697 = (*spvDescriptorSet0.fp_c3)._m0[int(_693)][_695];
    int _699 = int(_691) + 1;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    int _703 = _699 & 3;
    float _705 = (*spvDescriptorSet0.fp_c3)._m0[int(_701)][_703];
    int _707 = _648 + 32;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    uint _711 = uint(int(uint(int(_709)) >> uint(2)));
    int _713 = int(_709) & 3;
    float _715 = (*spvDescriptorSet0.fp_c3)._m0[int(_711)][_713];
    int _717 = int(_709) + 1;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    int _721 = _717 & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    int _725 = _648 + 56;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    uint _729 = uint(int(uint(int(_727)) >> uint(2)));
    int _731 = int(_727) & 3;
    float _733 = (*spvDescriptorSet0.fp_c3)._m0[int(_729)][_731];
    int _735 = int(_727) + 1;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    int _739 = _735 & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    int _743 = _648 + 8;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    uint _747 = uint(int(uint(int(_745)) >> uint(2)));
    int _749 = int(_745) & 3;
    float _751 = (*spvDescriptorSet0.fp_c3)._m0[int(_747)][_749];
    int _753 = int(_745) + 1;
    uint _755 = uint(int(uint(_753) >> uint(2)));
    int _757 = _753 & 3;
    float _759 = (*spvDescriptorSet0.fp_c3)._m0[int(_755)][_757];
    int _761 = _648 + 24;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    uint _765 = uint(int(uint(int(_763)) >> uint(2)));
    int _767 = int(_763) & 3;
    float _769 = (*spvDescriptorSet0.fp_c3)._m0[int(_765)][_767];
    int _771 = int(_763) + 1;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    int _775 = _771 & 3;
    float _777 = (*spvDescriptorSet0.fp_c3)._m0[int(_773)][_775];
    float _779 = _604 * _671;
    float _781 = fma(_606, _663, _779);
    int _783 = _648 + 40;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    uint _787 = uint(int(uint(int(_785)) >> uint(2)));
    int _789 = int(_785) & 3;
    float _791 = (*spvDescriptorSet0.fp_c3)._m0[int(_787)][_789];
    int _793 = int(_785) + 1;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    int _797 = _793 & 3;
    float _799 = (*spvDescriptorSet0.fp_c3)._m0[int(_795)][_797];
    float _801 = _604 * _687;
    float _803 = fma(_606, _679, _801);
    float _805 = _604 * _705;
    float _807 = fma(_606, _697, _805);
    float _809 = _604 * _723;
    float _811 = fma(_606, _715, _809);
    bool _813 = _163 >= (-8000.0);
    bool _815 = isnan(_163);
    bool _817 = _813 || _815;
    bool _819 = isnan(-8000.0);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = fma(_602, _733, _781);
    float _827 = _823 * _650;
    float _829 = _825 + _741;
    float _831 = _827 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _833 = fma(_602, _751, _803);
    float _835 = 1.0 / _829;
    float _837 = fma(_602, _769, _807);
    float _839 = _833 + _759;
    float _841 = _837 + _777;
    float _843 = fma(_602, _791, _811);
    float _845 = _839 * _835;
    float _847 = _841 * _835;
    float _849 = _843 + _799;
    float _851 = abs(_566);
    float _853 = _851 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _855 = -_568;
    float _857 = _855 + 1.0;
    float _859 = -_853;
    float _861 = fma(_823, _859, 1.0);
    float _863 = _857 * _831;
    float _865 = precise::clamp(_863, 0.0, 1.0);
    float _867 = -_865;
    float _869 = fma(_867, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _871 = precise::min(_861, 1.0);
    float _873 = _849 * _835;
    float _875 = precise::clamp(_873, 0.0, 1.0);
    float _877 = precise::min(_871, _869);
    float _933;
    if (!_652)
    {
        float _879 = rint(_626);
        float _881 = precise::max(_879, 0.0);
        uint _883 = uint(_881);
        uint _885 = clamp(_883, 0u, 65535u);
        float _887 = _875 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _889 = fma(_887, 0.5, _847);
        float _891 = fma(_887, 0.5, _845);
        float _893 = fma(_887, -0.5, _845);
        float _895 = fma(_887, -0.5, _847);
        float3 _2499 = float3(_845, _889, float(int(_885)));
        float3 _2503 = select(_2499, float3(0.0), isnan(_2499));
        float _897 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2503.xy, uint(rint(_2503.z)), _875);
        float3 _2512 = float3(_891, _889, float(int(_885)));
        float3 _2514 = select(_2512, float3(0.0), isnan(_2512));
        float _899 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2514.xy, uint(rint(_2514.z)), _875);
        float3 _2523 = float3(_893, _889, float(int(_885)));
        float3 _2525 = select(_2523, float3(0.0), isnan(_2523));
        float _901 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2525.xy, uint(rint(_2525.z)), _875);
        float3 _2534 = float3(_891, _847, float(int(_885)));
        float3 _2536 = select(_2534, float3(0.0), isnan(_2534));
        float _903 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2536.xy, uint(rint(_2536.z)), _875);
        float3 _2545 = float3(_845, _847, float(int(_885)));
        float3 _2547 = select(_2545, float3(0.0), isnan(_2545));
        float _905 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2547.xy, uint(rint(_2547.z)), _875);
        float3 _2556 = float3(_893, _847, float(int(_885)));
        float3 _2558 = select(_2556, float3(0.0), isnan(_2556));
        float _907 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2558.xy, uint(rint(_2558.z)), _875);
        float3 _2567 = float3(_891, _895, float(int(_885)));
        float3 _2569 = select(_2567, float3(0.0), isnan(_2567));
        float _909 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2569.xy, uint(rint(_2569.z)), _875);
        float3 _2578 = float3(_845, _895, float(int(_885)));
        float3 _2580 = select(_2578, float3(0.0), isnan(_2578));
        float _911 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2580.xy, uint(rint(_2580.z)), _875);
        float3 _2589 = float3(_893, _895, float(int(_885)));
        float3 _2591 = select(_2589, float3(0.0), isnan(_2589));
        float _913 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2591.xy, uint(rint(_2591.z)), _875);
        float _915 = _899 + _897;
        float _917 = _915 + _901;
        float _919 = _917 + _903;
        float _921 = _919 + _905;
        float _923 = _921 + _907;
        float _925 = _923 + _909;
        float _927 = _925 + _911;
        float _929 = _927 + _913;
        float _931 = _929 * 0.111111111938953399658203125;
        _933 = _931;
        _935 = true;
    }
    else
    {
        float _937 = rint(_626);
        float _939 = precise::max(_937, 0.0);
        uint _941 = uint(_939);
        uint _943 = clamp(_941, 0u, 65535u);
        float3 _2638 = float3(_845, _847, float(int(_943)));
        float3 _2640 = select(_2638, float3(0.0), isnan(_2638));
        float _945 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2640.xy, uint(rint(_2640.z)), _875);
        _933 = _945;
    }
    _935 = false;
    float _947 = _933;
    float _949 = _554 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _951 = _554 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _953 = -_163;
    float _955 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _957 = _953 + _955;
    float _959 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[101].x, _949);
    float _961 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[102].x, _951);
    float _963 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[101].z, _959);
    float _965 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[102].z, _961);
    float _967 = _963 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _969 = _965 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _971 = trunc(_967);
    int _973 = int(_971);
    float _975 = trunc(_969);
    int _977 = int(_975);
    int _979 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _981 = _973 + _979;
    int _983 = _981 + 1;
    bool _985 = _983 >= 0;
    int _987 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _989 = _977 + _987;
    int _991 = _989 + 1;
    float _993 = -_163;
    float _995 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _997 = _993 + _995;
    bool _999 = _983 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1001 = !_985;
    bool _1003 = _999 || _1001;
    bool _1005 = _991 < 0;
    bool _1007 = _1005 || _1003;
    bool _1009 = _991 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1011 = _1009 || _1007;
    if (_1011)
    {
        _286 = 1.0;
    }
    float _1013 = _286;
    float _1015 = _1013;
    if (!_1011)
    {
        int _1017 = _991 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1019 = _1017 + _983;
        float _1021 = floor(_969);
        int _1023 = _1019 << 2;
        int _1025 = _1019 >> 2;
        int _1027 = 12 & _1023;
        int _1029 = _1025 << 4;
        int _1031 = _1029 + _1027;
        float _1033 = floor(_967);
        uint _1035 = uint(int(uint(_1031) >> uint(2)));
        uint _1037 = uint(int(uint(int(_1035)) >> uint(2)));
        int _1039 = int(_1035) & 3;
        float _1041 = (*spvDescriptorSet0.fp_c5)._m0[int(_1037)][_1039];
        float _1043 = -_1021;
        float _1045 = _969 + _1043;
        float _1047 = -_1033;
        float _1049 = _967 + _1047;
        float _1051 = rint(_1041);
        float _1053 = precise::max(_1051, 0.0);
        uint _1055 = uint(_1053);
        uint _1057 = clamp(_1055, 0u, 65535u);
        float3 _2825 = float3(_1049, _1045, float(int(_1057)));
        float3 _2827 = select(_2825, float3(0.0), isnan(_2825));
        float _1059 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2827.xy, uint(rint(_2827.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2827.xy, uint(rint(_2827.z)), level(0.0)).x;
        int _1061 = _1019 << 4;
        int _1063 = _1061 + 1648;
        int _1065 = _1031 + 8048;
        uint _1067 = uint(int(uint(_1065) >> uint(2)));
        uint _1069 = uint(int(uint(int(_1067)) >> uint(2)));
        int _1071 = int(_1067) & 3;
        float _1073 = (*spvDescriptorSet0.fp_c5)._m0[int(_1069)][_1071];
        uint _1075 = uint(int(uint(_1063) >> uint(2)));
        uint _1077 = uint(int(uint(int(_1075)) >> uint(2)));
        int _1079 = int(_1075) & 3;
        float _1081 = (*spvDescriptorSet0.fp_c5)._m0[int(_1077)][_1079];
        int _1083 = int(_1075) + 1;
        uint _1085 = uint(int(uint(_1083) >> uint(2)));
        int _1087 = _1083 & 3;
        float _1089 = (*spvDescriptorSet0.fp_c5)._m0[int(_1085)][_1087];
        int _1091 = _1063 + 8;
        uint _1093 = uint(int(uint(_1091) >> uint(2)));
        uint _1095 = uint(int(uint(int(_1093)) >> uint(2)));
        int _1097 = int(_1093) & 3;
        float _1099 = (*spvDescriptorSet0.fp_c5)._m0[int(_1095)][_1097];
        int _1101 = int(_1093) + 1;
        uint _1103 = uint(int(uint(_1101) >> uint(2)));
        int _1105 = _1101 & 3;
        float _1107 = (*spvDescriptorSet0.fp_c5)._m0[int(_1103)][_1105];
        float _1109 = _1073 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1111 = _554 * _1089;
        float _1113 = fma(_550, _1081, _1111);
        float _1115 = 1.0 / _1073;
        float _1117 = fma(_552, _1099, _1113);
        float _1119 = _1117 + _1107;
        float _1121 = precise::clamp(_1119, 0.0, 1.0);
        float _1123 = -_1121;
        float _1125 = _1123 + _1059;
        float _1127 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1125);
        float _1129 = _1109 * _1127;
        float _1131 = exp2(_1129);
        float _1133 = 0.0 + _1131;
        float _1135 = precise::clamp(_1133, 0.0, 1.0);
        _1015 = _1135;
    }
    float _1137 = _1015;
    float _1139 = precise::min(_1137, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1141 = _997 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1143 = precise::clamp(_1141, 0.0, 1.0);
    float _1145 = -_947;
    float _1147 = _1145 + 1.0;
    float _1149 = _957 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1151 = precise::clamp(_1149, 0.0, 1.0);
    float _1153 = -_1139;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1143, _1147, _947);
    float _1159 = fma(_1151, _1155, _1139);
    out.m_58.x = _1157;
    out.m_58.y = _1159;
    out.m_58.z = 1.0;
    out.m_58.w = _877;
    out.m_60.x = 1.0;
    out.m_60.y = 0.5;
    out.m_60.z = 0.5;
    out.m_60.w = 1.0;
    return out;
}

