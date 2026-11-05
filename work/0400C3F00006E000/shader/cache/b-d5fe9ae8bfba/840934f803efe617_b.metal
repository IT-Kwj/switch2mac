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
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_ESmplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
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
    float2 _1107 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1107, float2(0.0), isnan(_1107))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1107, float2(0.0), isnan(_1107))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1122 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1122, float2(0.0), isnan(_1122))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1122, float2(0.0), isnan(_1122))).x;
    float2 _1130 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1130, float2(0.0), isnan(_1130))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1130, float2(0.0), isnan(_1130))).x;
    float2 _1138 = float2(_81, _83);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1138, float2(0.0), isnan(_1138))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1138, float2(0.0), isnan(_1138))).xy;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = in.m_49.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_49.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_51.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_51.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_53.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_53.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = _79 * _113;
    float _141 = _79 * _119;
    float _143 = _79 * _131;
    float _145 = -_87;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _149 = 1.0 / _147;
    float _151 = -_91;
    float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _155 = -_93;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _159 = _79 * _107;
    float _161 = 1.0 / _153;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _165 = _149 * _163;
    float _167 = 1.0 / _157;
    float _169 = _165 * _159;
    float _171 = _165 * _139;
    float _173 = _79 * _125;
    float _175 = _79 * _137;
    float _177 = _169 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _181 = _161 * _179;
    float _183 = _169 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _185 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[32].x, _177);
    float _187 = -_171;
    float _189 = fma(_181, _141, _187);
    float _191 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[30].x, _183);
    float _193 = -_165;
    float _195 = _193 + _181;
    float _197 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[32].z, _185);
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _201 = _167 * _199;
    float _203 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[30].z, _191);
    float _205 = -_169;
    float _207 = fma(_181, _173, _205);
    float _209 = _197 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _211 = -_171;
    float _213 = fma(_201, _143, _211);
    float _215 = _203 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _217 = -_169;
    float _219 = fma(_201, _175, _217);
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _223 = _209 + _221;
    float _225 = -_165;
    float _227 = _225 + _201;
    float _229 = _195 * _213;
    float _231 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _233 = _215 + _231;
    float _235 = _223 * _223;
    float _237 = _207 * _227;
    float _239 = -_229;
    float _241 = fma(_189, _227, _239);
    float _243 = _189 * _219;
    float _245 = fma(_233, _233, _235);
    float _247 = -_237;
    float _249 = fma(_195, _219, _247);
    float _251 = _241 * _241;
    float _253 = -_243;
    float _255 = fma(_207, _213, _253);
    float _257 = sqrt(_245);
    float _259 = fma(_249, _249, _251);
    float _261 = _169 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _263 = fma(_255, _255, _259);
    float _265 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[31].x, _261);
    float _267 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[31].z, _265);
    float _269 = rsqrt(_263);
    float _271 = _267 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _275 = _257 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _277 = _241 * _269;
    float _279 = _249 * _269;
    float _281 = _255 * _269;
    bool _283 = !_275;
    float _285 = _271;
    float _287 = _215;
    float _289 = _209;
    if (!_283)
    {
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _293 = _257 + _291;
        float _295 = _271 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = rsqrt(_245);
        float _299 = -_271;
        float _301 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _303 = _299 + _301;
        float _305 = abs(_295);
        float _307 = abs(_293);
        float _309 = precise::max(_305, _307);
        float _311 = _303 * _303;
        bool _313 = _309 >= 16.0;
        float _315 = _233 * _297;
        float _317 = _223 * _297;
        float _319 = -_233;
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
        _285 = _536;
        _287 = _538;
        _289 = _540;
    }
    float _542 = _285;
    float _544 = _287;
    float _546 = _289;
    float _548 = _277 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _550 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _552 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].x, _548);
    float _554 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].x, _550);
    float _556 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[35].z, _552);
    float _558 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].z, _554);
    float _560 = -_556;
    float _562 = fma(_560, _556, 1.0);
    float _564 = -_556;
    float _566 = fma(_564, (*spvDescriptorSet0.fp_c3)._m0[35].z, _281);
    float _568 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _570 = _558 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _572 = _562 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _574 = -_556;
    float _576 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[35].y, _277);
    float _578 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].x, _568);
    float _580 = -_556;
    float _582 = fma(_580, (*spvDescriptorSet0.fp_c3)._m0[35].x, _279);
    float _584 = fma(_566, _572, _165);
    float _586 = fma(_576, _572, _169);
    float _588 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].z, _578);
    float _590 = fma(_582, _572, _171);
    float _592 = -_584;
    bool _594 = _592 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _596 = float(_594);
    float _598 = _588 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _600 = -_584;
    bool _602 = _600 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _604 = float(_602);
    float _606 = fma(_99, 2.0, -1.0);
    float _608 = fma(_101, 2.0, -1.0);
    float _610 = _596 + _604;
    float _612 = _606 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _614 = trunc(_570);
    int _616 = int(_614);
    float _618 = _608 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _620 = precise::min(_610, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _622 = fma(_612, 2.0, _81);
    float _624 = fma(_618, 2.0, _83);
    float _626 = trunc(_598);
    int _628 = int(_626);
    int _630 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _632 = _616 + _630;
    int _634 = _632 + 1;
    float _636 = trunc(_620);
    int _638 = int(_636);
    bool _640 = _634 >= 0;
    int _642 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _644 = _628 + _642;
    int _646 = _644 + 1;
    float _648 = rint(_620);
    float _650 = precise::max(_648, 0.0);
    uint _653 = uint(_650);
    uint _655 = clamp(_653, 0u, 65535u);
    bool _657 = _634 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _659 = !_640;
    bool _661 = _657 || _659;
    bool _663 = _646 < 0;
    bool _665 = _663 || _661;
    int _667 = _638 << 6;
    bool _669 = _646 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _671 = _669 || _665;
    int _673 = _667 + 48;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    uint _677 = uint(int(uint(int(_675)) >> uint(2)));
    int _679 = int(_675) & 3;
    float _681 = (*spvDescriptorSet0.fp_c3)._m0[int(_677)][_679];
    int _683 = int(_675) + 1;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    int _687 = _683 & 3;
    float _689 = (*spvDescriptorSet0.fp_c3)._m0[int(_685)][_687];
    int _691 = _667 + 56;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    int _701 = int(_693) + 1;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    int _705 = _701 & 3;
    float _707 = (*spvDescriptorSet0.fp_c3)._m0[int(_703)][_705];
    int _709 = _634;
    if (!_671)
    {
        int _711 = _646 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _713 = _711 + _634;
        _709 = _713;
    }
    int _715 = _709;
    uint _717 = uint(int(uint(_667) >> uint(2)));
    uint _719 = uint(int(uint(int(_717)) >> uint(2)));
    int _721 = int(_717) & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    int _725 = int(_717) + 1;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    int _729 = _725 & 3;
    float _731 = (*spvDescriptorSet0.fp_c3)._m0[int(_727)][_729];
    int _733 = 0;
    if (!_671)
    {
        int _735 = _715 << 2;
        _733 = _735;
    }
    int _737 = _733;
    int _739 = 0;
    int _741 = _737;
    if (!_671)
    {
        int _743 = _715 >> 2;
        _739 = _743;
    }
    int _745 = _739;
    int _747 = _745;
    if (!_671)
    {
        int _749 = 12 & _737;
        _741 = _749;
    }
    int _751 = _741;
    int _753 = _667 + 8;
    uint _755 = uint(int(uint(_753) >> uint(2)));
    uint _757 = uint(int(uint(int(_755)) >> uint(2)));
    int _759 = int(_755) & 3;
    float _761 = (*spvDescriptorSet0.fp_c3)._m0[int(_757)][_759];
    int _763 = int(_755) + 1;
    uint _765 = uint(int(uint(_763) >> uint(2)));
    int _767 = _763 & 3;
    float _769 = (*spvDescriptorSet0.fp_c3)._m0[int(_765)][_767];
    if (!_671)
    {
        int _771 = _745 << 4;
        int _773 = _771 + _751;
        _747 = _773;
    }
    int _775 = _747;
    int _777 = _667 + 16;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    uint _781 = uint(int(uint(int(_779)) >> uint(2)));
    int _783 = int(_779) & 3;
    float _785 = (*spvDescriptorSet0.fp_c3)._m0[int(_781)][_783];
    int _787 = int(_779) + 1;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    int _791 = _787 & 3;
    float _793 = (*spvDescriptorSet0.fp_c3)._m0[int(_789)][_791];
    int _795 = _667 + 32;
    uint _797 = uint(int(uint(_795) >> uint(2)));
    uint _799 = uint(int(uint(int(_797)) >> uint(2)));
    int _801 = int(_797) & 3;
    float _803 = (*spvDescriptorSet0.fp_c3)._m0[int(_799)][_801];
    int _805 = int(_797) + 1;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    int _809 = _805 & 3;
    float _811 = (*spvDescriptorSet0.fp_c3)._m0[int(_807)][_809];
    float _813 = as_type<float>(_751);
    if (!_671)
    {
        uint _815 = uint(int(uint(_775) >> uint(2)));
        uint _817 = uint(int(uint(int(_815)) >> uint(2)));
        int _819 = int(_815) & 3;
        float _821 = (*spvDescriptorSet0.fp_c5)._m0[int(_817)][_819];
        _813 = _821;
    }
    float _823 = _813;
    float _825 = _586 * _689;
    float _827 = _689;
    if (!_671)
    {
        float _829 = floor(_598);
        _827 = _829;
    }
    float _831 = _827;
    float _833 = fma(_590, _681, _825);
    int _835 = _667 + 24;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    uint _839 = uint(int(uint(int(_837)) >> uint(2)));
    int _841 = int(_837) & 3;
    float _843 = (*spvDescriptorSet0.fp_c3)._m0[int(_839)][_841];
    int _845 = int(_837) + 1;
    uint _847 = uint(int(uint(_845) >> uint(2)));
    int _849 = _845 & 3;
    float _851 = (*spvDescriptorSet0.fp_c3)._m0[int(_847)][_849];
    float _853 = fma(_584, _699, _833);
    float _855 = _681;
    if (!_671)
    {
        float _857 = floor(_570);
        _855 = _857;
    }
    float _859 = _855;
    float _861 = _853 + _707;
    int _863 = _667 + 40;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    uint _867 = uint(int(uint(int(_865)) >> uint(2)));
    int _869 = int(_865) & 3;
    float _871 = (*spvDescriptorSet0.fp_c3)._m0[int(_867)][_869];
    int _873 = int(_865) + 1;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    int _877 = _873 & 3;
    float _879 = (*spvDescriptorSet0.fp_c3)._m0[int(_875)][_877];
    float _881 = _586 * _731;
    float _883 = 1.0 / _861;
    float _885 = _831;
    float _887 = _731;
    if (!_671)
    {
        float _889 = -_831;
        float _891 = _598 + _889;
        _885 = _891;
    }
    float _893 = _885;
    float _895 = fma(_590, _723, _881);
    float _897 = fma(_584, _761, _895);
    float _899 = _859;
    if (!_671)
    {
        float _901 = -_859;
        float _903 = _570 + _901;
        _887 = _903;
    }
    float _905 = _887;
    float _907 = _897 + _769;
    float _909 = _586 * _793;
    float _911 = _907 * _883;
    float _913 = fma(_590, _785, _909);
    float _915 = _586 * _811;
    float _917 = fma(_590, _803, _915);
    float _919 = _897;
    if (!_671)
    {
        float _921 = rint(_823);
        float _923 = precise::max(_921, 0.0);
        uint _925 = uint(_923);
        uint _927 = clamp(_925, 0u, 65535u);
        _919 = as_type<float>(_927);
    }
    float _929 = _919;
    float _931 = fma(_584, _843, _913);
    float _933 = _931 + _851;
    float _935 = fma(_584, _871, _917);
    float _937 = _935 + _879;
    float _939 = _933 * _883;
    float _941 = _937 * _883;
    float _943 = precise::clamp(_941, 0.0, 1.0);
    float2 _2473 = float2(_622, _624);
    float _945 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2473, float2(0.0), isnan(_2473))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2473, float2(0.0), isnan(_2473))).x;
    float3 _2485 = float3(_911, _939, float(int(_655)));
    float3 _2489 = select(_2485, float3(0.0), isnan(_2485));
    float _947 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2489.xy, uint(rint(_2489.z)), _943);
    float _949 = _893;
    if (!_671)
    {
        float3 _2502 = float3(_905, _893, float(as_type<int>(_929)));
        float3 _2504 = select(_2502, float3(0.0), isnan(_2502));
        float _951 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2504.xy, uint(rint(_2504.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2504.xy, uint(rint(_2504.z)), level(0.0)).x;
        _949 = _951;
    }
    float _953 = _949;
    if (_671)
    {
        _899 = 1.0;
    }
    float _955 = _899;
    float _957 = _955;
    if (!_671)
    {
        int _959 = _715 << 4;
        int _961 = _959 + 1648;
        int _963 = _775 + 8048;
        uint _965 = uint(int(uint(_963) >> uint(2)));
        uint _967 = uint(int(uint(int(_965)) >> uint(2)));
        int _969 = int(_965) & 3;
        float _971 = (*spvDescriptorSet0.fp_c5)._m0[int(_967)][_969];
        uint _973 = uint(int(uint(_961) >> uint(2)));
        uint _975 = uint(int(uint(int(_973)) >> uint(2)));
        int _977 = int(_973) & 3;
        float _979 = (*spvDescriptorSet0.fp_c5)._m0[int(_975)][_977];
        int _981 = int(_973) + 1;
        uint _983 = uint(int(uint(_981) >> uint(2)));
        int _985 = _981 & 3;
        float _987 = (*spvDescriptorSet0.fp_c5)._m0[int(_983)][_985];
        int _989 = _961 + 8;
        uint _991 = uint(int(uint(_989) >> uint(2)));
        uint _993 = uint(int(uint(int(_991)) >> uint(2)));
        int _995 = int(_991) & 3;
        float _997 = (*spvDescriptorSet0.fp_c5)._m0[int(_993)][_995];
        int _999 = int(_991) + 1;
        uint _1001 = uint(int(uint(_999) >> uint(2)));
        int _1003 = _999 & 3;
        float _1005 = (*spvDescriptorSet0.fp_c5)._m0[int(_1001)][_1003];
        float _1007 = 1.0 / _971;
        float _1009 = _971 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1011 = _542 * _987;
        float _1013 = fma(_544, _979, _1011);
        float _1015 = fma(_546, _997, _1013);
        float _1017 = _1015 + _1005;
        float _1019 = precise::clamp(_1017, 0.0, 1.0);
        float _1021 = -_1019;
        float _1023 = _1021 + _953;
        float _1025 = fma(_1007, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1023);
        float _1027 = _1009 * _1025;
        float _1029 = exp2(_1027);
        float _1031 = 0.0 + _1029;
        float _1033 = precise::clamp(_1031, 0.0, 1.0);
        _957 = _1033;
    }
    float _1035 = _957;
    float _1037 = -_165;
    float _1039 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1041 = _1037 + _1039;
    float _1043 = precise::min(_1035, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1045 = -_165;
    float _1047 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1049 = _1045 + _1047;
    float _1051 = -_947;
    float _1053 = _1051 + 1.0;
    float _1055 = _1041 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1057 = precise::clamp(_1055, 0.0, 1.0);
    float _1059 = _1049 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1061 = precise::clamp(_1059, 0.0, 1.0);
    float _1063 = -_1043;
    float _1065 = _1063 + 1.0;
    float _1067 = fma(_1057, _1053, _947);
    float _1069 = fma(_1061, _1065, _1043);
    out.m_56.x = _1067;
    out.m_56.y = _1069;
    out.m_56.z = 1.0;
    out.m_56.w = 1.0;
    out.m_58.x = _945;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

