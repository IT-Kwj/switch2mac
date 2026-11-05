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
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_18 [[id(11)]];
    sampler fp_t_tcb_18Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
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
    float4 m_57 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1152 = false;
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
    float2 _1416 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1416, float2(0.0), isnan(_1416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1416, float2(0.0), isnan(_1416))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1431 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1431, float2(0.0), isnan(_1431))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1431, float2(0.0), isnan(_1431))).x;
    float2 _1439 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1439, float2(0.0), isnan(_1439))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1439, float2(0.0), isnan(_1439))).x;
    float _101 = in.m_55.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_55.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_57.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_57.x;
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
    float _153 = 1.0 / _151;
    float _155 = -_97;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _159 = -_99;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _163 = 1.0 / _157;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _167 = _153 * _165;
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
    float _189 = fma(_181, _143, _187);
    float _191 = -_171;
    float _193 = fma(_181, _141, _191);
    float _195 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[32].z, _183);
    float _197 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _201 = _169 * _199;
    float _203 = -_167;
    float _205 = _203 + _181;
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _209 = _197 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _211 = -_173;
    float _213 = fma(_201, _145, _211);
    float _215 = -_171;
    float _217 = fma(_201, _147, _215);
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _221 = _207 + _219;
    float _223 = -_167;
    float _225 = _223 + _201;
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _229 = _209 + _227;
    float _231 = _205 * _213;
    float _233 = _221 * _221;
    float _235 = _193 * _225;
    float _237 = -_231;
    float _239 = fma(_189, _225, _237);
    float _241 = fma(_229, _229, _233);
    float _243 = _189 * _217;
    float _245 = -_235;
    float _247 = fma(_205, _217, _245);
    float _249 = _239 * _239;
    float _251 = sqrt(_241);
    float _253 = -_243;
    float _255 = fma(_193, _213, _253);
    float _257 = fma(_247, _247, _249);
    float _259 = fma(_255, _255, _257);
    float _261 = _171 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _263 = rsqrt(_259);
    float _265 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].x, _261);
    bool _269 = _251 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _271 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].z, _265);
    float _273 = _271 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _275 = _247 * _263;
    float _277 = _239 * _263;
    float _279 = _255 * _263;
    float _281 = _263;
    int _284 = as_type<int>(_247);
    float _286 = _207;
    float _288 = _273;
    float _290 = _167;
    if (!_269)
    {
        _281 = _209;
    }
    float _292 = _281;
    bool _294 = !_269;
    float _296 = _292;
    if (!_294)
    {
        float _298 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _300 = _251 + _298;
        float _302 = _273 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _304 = rsqrt(_241);
        float _306 = -_273;
        float _308 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _310 = _306 + _308;
        float _312 = abs(_302);
        float _314 = abs(_300);
        float _316 = precise::max(_312, _314);
        float _318 = _310 * _310;
        bool _320 = _316 >= 16.0;
        float _322 = _229 * _304;
        float _324 = _221 * _304;
        float _326 = -_229;
        float _328 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[41].z, _326);
        float _330 = -_221;
        float _332 = fma(_324, (*spvDescriptorSet0.fp_c3)._m0[41].z, _330);
        float _334 = _300;
        float _336 = _302;
        float _338 = _332;
        if (_320)
        {
            float _340 = _300 * 0.0625;
            _334 = _340;
        }
        float _342 = _334;
        if (_320)
        {
            float _344 = _302 * 0.0625;
            _336 = _344;
        }
        float _346 = _336;
        float _348 = fma(_328, _328, _318);
        float _350 = abs(_342);
        bool _352 = _350 != 0.0;
        bool _354 = isnan(_350);
        bool _356 = _352 || _354;
        bool _358 = isnan(0.0);
        bool _360 = _356 || _358;
        float _362 = fma(_332, _332, _348);
        float _364 = abs(_346);
        bool _366 = _364 == 0.0;
        float _368 = abs(_346);
        bool _370 = _368 == 0.0;
        bool _372 = !_360;
        bool _374 = _370 && _372;
        float _376 = sqrt(_362);
        bool _378 = false;
        int _380 = as_type<int>(_362);
        if (_374)
        {
            bool _382 = as_type<int>(_346) >= 0;
            _378 = _382;
        }
        bool _384 = _378;
        int _386 = _384 ? (-1) : 0;
        if (_374)
        {
            int _388 = _384 ? 0 : 1078530011;
            _284 = _388;
        }
        int _390 = _284;
        if (_374)
        {
            int _392 = int(0x80000000) & as_type<int>(_342);
            int _394 = _390 | _392;
            _338 = as_type<float>(_394);
        }
        float _396 = _338;
        bool _398 = !_360;
        bool _400 = _398 && _366;
        float _402 = _396;
        float _404 = _396;
        if (!_400)
        {
            float _406 = abs(_342);
            bool _408 = _406 != as_type<float>(0x7f800000u /* inf */);
            bool _410 = isnan(_406);
            bool _412 = _408 || _410;
            bool _414 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _416 = _412 || _414;
            float _418 = abs(_346);
            bool _420 = _418 == as_type<float>(0x7f800000u /* inf */);
            float _422 = abs(_346);
            bool _424 = _422 == as_type<float>(0x7f800000u /* inf */);
            bool _426 = !_416;
            bool _428 = _424 && _426;
            if (_428)
            {
                bool _430 = as_type<int>(_346) >= 0;
                _386 = _430 ? (-1) : 0;
            }
            int _432 = _386;
            if (_428)
            {
                _380 = 1075235812;
            }
            int _434 = _380;
            int _436 = _434;
            if (_428)
            {
                int _438 = ~_432;
                int _440 = (_438 != 0) ? _434 : 1061752795;
                _436 = _440;
            }
            int _442 = _436;
            if (_428)
            {
                int _444 = int(0x80000000) & as_type<int>(_342);
                int _446 = _442 | _444;
                _402 = as_type<float>(_446);
            }
            float _448 = _402;
            bool _450 = !_416;
            bool _452 = _450 && _420;
            _404 = _448;
            if (!_452)
            {
                float _454 = abs(_342);
                float _456 = abs(_346);
                float _458 = precise::max(_454, _456);
                float _460 = abs(_342);
                float _462 = abs(_346);
                float _464 = precise::min(_460, _462);
                float _466 = 1.0 / _458;
                float _468 = abs(_342);
                float _470 = abs(_346);
                bool _472 = _468 > _470;
                bool _474 = as_type<int>(_346) >= 0;
                float _476 = _464 * _466;
                float _478 = abs(_342);
                float _480 = abs(_346);
                float _482 = _478 + _480;
                int _484 = as_type<int>(_342) & int(0x80000000);
                float _486 = _476 * _476;
                bool _488 = _482 > as_type<float>(0x7f800000u /* inf */);
                bool _490 = isnan(_482);
                bool _492 = _488 || _490;
                bool _494 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _496 = _492 || _494;
                float _498 = _486 + 11.33538818359375;
                float _500 = fma(_486, _498, 28.84246826171875);
                float _502 = fma(_486, _500, 19.6966705322265625);
                float _504 = fma(_486, -0.82336294651031494140625, -5.674867153167724609375);
                float _506 = fma(_486, _504, -6.565555095672607421875);
                float _508 = 1.0 / _502;
                float _510 = _486 * _506;
                float _512 = _476 * _510;
                float _514 = fma(_512, _508, _476);
                float _516 = _514;
                _404 = _482;
                if (_472)
                {
                    float _518 = -_514;
                    float _520 = _518 + 1.57079637050628662109375;
                    _516 = _520;
                }
                float _522 = _516;
                int _524 = as_type<int>(_522);
                if (!_474)
                {
                    float _526 = -_522;
                    float _528 = _526 + 3.1415927410125732421875;
                    _524 = as_type<int>(_528);
                }
                int _530 = _524;
                if (!_496)
                {
                    int _532 = _484 | _530;
                    _404 = as_type<float>(_532);
                }
            }
        }
        float _534 = _404;
        float _536 = fma(_534, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _538 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _540 = _376 + _538;
        float _542 = fma(_322, _536, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _544 = fma(_324, _536, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _296 = _542;
        _286 = _544;
        _288 = _540;
    }
    float _546 = _296;
    float _548 = _286;
    float _550 = _288;
    float _552 = fma(_546, 6.2500002968590706586837768554688e-05, 0.5);
    float _554 = fma(_548, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2126 = float2(_552, _554);
    float _556 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2126, float2(0.0), isnan(_2126))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2126, float2(0.0), isnan(_2126))).x;
    float _558 = _277 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _560 = abs(_167);
    float _562 = log2(_560);
    float _564 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _566 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _568 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[35].x, _558);
    float _570 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].z, _568);
    float _572 = floor(_564);
    float _574 = -_570;
    float _576 = fma(_574, _570, 1.0);
    float _578 = -_570;
    float _580 = fma(_578, (*spvDescriptorSet0.fp_c3)._m0[35].z, _279);
    float _582 = -_570;
    float _584 = fma(_582, (*spvDescriptorSet0.fp_c3)._m0[35].x, _275);
    float _586 = _576 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _588 = _562 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _590 = floor(_566);
    float _592 = fma(_580, _586, _167);
    float _594 = fma(_584, _586, _173);
    float _596 = -_592;
    bool _598 = _596 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _600 = float(_598);
    float _602 = exp2(_588);
    float _604 = -_592;
    bool _606 = _604 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _608 = float(_606);
    float _610 = -_572;
    float _612 = _564 + _610;
    float _614 = -_570;
    float _616 = fma(_614, (*spvDescriptorSet0.fp_c3)._m0[35].y, _277);
    float _618 = _600 + _608;
    float _620 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _622 = _612 + _620;
    float _624 = -_590;
    float _626 = _566 + _624;
    float _628 = fma(_616, _586, _171);
    float _630 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _632 = precise::min(_618, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _634 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _636 = _626 + _634;
    float _638 = -_622;
    float _640 = _638 + 1.0;
    float _642 = trunc(_632);
    int _644 = int(_642);
    float _646 = fma(_602, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _648 = precise::clamp(_646, 0.0, 1.0);
    float _650 = -_636;
    float _652 = _650 + 1.0;
    float _654 = _636 * _640;
    float _656 = fma(_648, -2.0, 3.0);
    float _658 = _648 * _648;
    float _660 = precise::max(0.0, _630);
    float _662 = _658 * _656;
    float _664 = _622 * _636;
    float _666 = _622 * _652;
    float _668 = _640 * _652;
    float _670 = -_662;
    float _672 = _670 + 1.0;
    int _674 = _644 << 6;
    float _676 = fma(_672, (*spvDescriptorSet0.fp_c3)._m0[44].w, _662);
    uint _679 = uint(int(uint(_674) >> uint(2)));
    uint _681 = uint(int(uint(int(_679)) >> uint(2)));
    int _683 = int(_679) & 3;
    float _685 = (*spvDescriptorSet0.fp_c3)._m0[int(_681)][_683];
    int _687 = int(_679) + 1;
    uint _689 = uint(int(uint(_687) >> uint(2)));
    int _691 = _687 & 3;
    float _693 = (*spvDescriptorSet0.fp_c3)._m0[int(_689)][_691];
    bool _695 = _644 != 0;
    float _697 = _676 * _660;
    float _699 = fma(_546, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _701 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    int _703 = _674 + 16;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    uint _707 = uint(int(uint(int(_705)) >> uint(2)));
    int _709 = int(_705) & 3;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[int(_707)][_709];
    int _713 = int(_705) + 1;
    uint _715 = uint(int(uint(_713) >> uint(2)));
    int _717 = _713 & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = _674 + 32;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    uint _725 = uint(int(uint(int(_723)) >> uint(2)));
    int _727 = int(_723) & 3;
    float _729 = (*spvDescriptorSet0.fp_c3)._m0[int(_725)][_727];
    int _731 = int(_723) + 1;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    int _735 = _731 & 3;
    float _737 = (*spvDescriptorSet0.fp_c3)._m0[int(_733)][_735];
    float _739 = _628 * _693;
    float _741 = fma(_594, _685, _739);
    float2 _2435 = float2(_87, _89);
    float4 _744 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2435, float2(0.0), isnan(_2435)), int2(0), component::x).xyzw;
    float _746 = _744.x;
    float _748 = _744.y;
    float _750 = _744.z;
    float _752 = _744.w;
    float2 _2451 = float2(_552, _554);
    float _754 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2451, float2(0.0), isnan(_2451)), level(_556)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2451, float2(0.0), isnan(_2451)), level(_556)).x;
    float2 _2460 = float2(_699, _701);
    float _756 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2460, float2(0.0), isnan(_2460))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2460, float2(0.0), isnan(_2460))).x;
    float2 _2468 = float2(_87, _89);
    float4 _758 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2468, float2(0.0), isnan(_2468)), int2(0), component::x).xyzw;
    float _760 = _758.x;
    float _762 = _758.y;
    float _764 = _758.z;
    float _766 = _758.w;
    float2 _2484 = float2(_87, _89);
    float4 _768 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2484, float2(0.0), isnan(_2484)), int2(0), component::w).xyzw;
    float _770 = _768.x;
    float _772 = _768.y;
    float _774 = _768.z;
    float _776 = _768.w;
    float _778 = _628 * _719;
    float _780 = _628 * _737;
    float _782 = fma(_594, _711, _778);
    float _784 = fma(_594, _729, _780);
    int _786 = _674 + 48;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    uint _790 = uint(int(uint(int(_788)) >> uint(2)));
    int _792 = int(_788) & 3;
    float _794 = (*spvDescriptorSet0.fp_c3)._m0[int(_790)][_792];
    int _796 = int(_788) + 1;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    int _800 = _796 & 3;
    float _802 = (*spvDescriptorSet0.fp_c3)._m0[int(_798)][_800];
    int _804 = _674 + 24;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    uint _808 = uint(int(uint(int(_806)) >> uint(2)));
    int _810 = int(_806) & 3;
    float _812 = (*spvDescriptorSet0.fp_c3)._m0[int(_808)][_810];
    int _814 = int(_806) + 1;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    int _818 = _814 & 3;
    float _820 = (*spvDescriptorSet0.fp_c3)._m0[int(_816)][_818];
    float _822 = _628 * _802;
    float _824 = fma(_594, _794, _822);
    int _826 = _674 + 8;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    uint _830 = uint(int(uint(int(_828)) >> uint(2)));
    int _832 = int(_828) & 3;
    float _834 = (*spvDescriptorSet0.fp_c3)._m0[int(_830)][_832];
    int _836 = int(_828) + 1;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    int _840 = _836 & 3;
    float _842 = (*spvDescriptorSet0.fp_c3)._m0[int(_838)][_840];
    float _844 = fma(_592, _812, _782);
    float _846 = _844 + _820;
    float _848 = -_746;
    float _850 = fma(_848, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _852 = fma(_592, _834, _741);
    float _854 = precise::min(_167, -1.0000000116860974230803549289703e-07);
    float _856 = -_748;
    float _858 = fma(_856, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _860 = -_750;
    float _862 = fma(_860, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _864 = -_752;
    float _866 = fma(_864, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _868 = 1.0 / _850;
    float _870 = _852 + _842;
    int _872 = _674 + 40;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    uint _876 = uint(int(uint(int(_874)) >> uint(2)));
    int _878 = int(_874) & 3;
    float _880 = (*spvDescriptorSet0.fp_c3)._m0[int(_876)][_878];
    int _882 = int(_874) + 1;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    int _886 = _882 & 3;
    float _888 = (*spvDescriptorSet0.fp_c3)._m0[int(_884)][_886];
    float _890 = 1.0 / _854;
    float _892 = 1.0 / _858;
    float _894 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _896 = -_167;
    float _898 = fma(_868, _894, _896);
    float _900 = 1.0 / _862;
    float _902 = _890 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _904 = abs(_898);
    float _906 = _904 * _902;
    float _908 = 1.0 / _866;
    float _910 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _912 = -_167;
    float _914 = fma(_892, _910, _912);
    float _916 = abs(_914);
    float _918 = _916 * _902;
    float _920 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _922 = -_167;
    float _924 = fma(_900, _920, _922);
    float _926 = exp2(_906);
    float _928 = abs(_924);
    float _930 = _928 * _902;
    float _932 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _934 = -_167;
    float _936 = fma(_908, _932, _934);
    float _938 = exp2(_918);
    int _940 = _674 + 56;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    uint _944 = uint(int(uint(int(_942)) >> uint(2)));
    int _946 = int(_942) & 3;
    float _948 = (*spvDescriptorSet0.fp_c3)._m0[int(_944)][_946];
    int _950 = int(_942) + 1;
    uint _952 = uint(int(uint(_950) >> uint(2)));
    int _954 = _950 & 3;
    float _956 = (*spvDescriptorSet0.fp_c3)._m0[int(_952)][_954];
    float _958 = fma(_592, _880, _784);
    float _960 = abs(_936);
    float _962 = _960 * _902;
    float _964 = _958 + _888;
    float _966 = exp2(_930);
    float _968 = abs(_654);
    float _970 = _968 * _926;
    float _972 = exp2(_962);
    float _974 = abs(_664);
    float _976 = _974 * _938;
    float _978 = abs(_666);
    float _980 = _978 * _966;
    float _982 = _970 + _976;
    float _984 = _980 + _982;
    float _986 = abs(_668);
    float _988 = _986 * _972;
    float _990 = _988 + _984;
    float _992 = -_988;
    bool _994 = _984 != _992;
    bool _996 = isnan(_984);
    bool _998 = _994 || _996;
    bool _1000 = isnan(_992);
    bool _1002 = _998 || _1000;
    float _1004 = 1.0 / _990;
    float _1006 = fma(_592, _948, _824);
    float _1008 = _976 * _1004;
    float _1010 = _970 * _1004;
    float _1012 = _980 * _1004;
    bool _1014 = _167 >= (-8000.0);
    bool _1016 = isnan(_167);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(-8000.0);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _988 * _1004;
    float _1028 = _1002 ? _1008 : 0.25;
    float _1030 = _1002 ? _1010 : 0.25;
    float _1032 = _1002 ? _1012 : 0.25;
    float _1034 = -_756;
    float _1036 = _1034 + 1.0;
    float _1038 = _1028 * _762;
    float _1040 = _1006 + _956;
    float _1042 = _1028 * _772;
    float _1044 = _1024 * _697;
    float _1046 = fma(_1030, _760, _1038);
    float _1048 = 1.0 / _1040;
    float _1050 = fma(_1030, _770, _1042);
    float _1052 = _1044 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1054 = abs(_754);
    float _1056 = _1054 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1058 = _1002 ? _1026 : 0.25;
    float _1060 = fma(_1032, _764, _1046);
    float _1062 = fma(_1032, _774, _1050);
    float _1064 = -_1056;
    float _1066 = fma(_1024, _1064, 1.0);
    float _1068 = _1036 * _1052;
    float _1070 = precise::clamp(_1068, 0.0, 1.0);
    float _1072 = fma(_1058, _766, _1060);
    float _1074 = fma(_1058, _776, _1062);
    float _1076 = -_1070;
    float _1078 = fma(_1076, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1080 = precise::min(_1066, 1.0);
    float _1082 = precise::min(_1074, 1.0);
    float _1084 = _870 * _1048;
    float _1086 = _846 * _1048;
    float _1088 = _964 * _1048;
    float _1090 = precise::clamp(_1088, 0.0, 1.0);
    float _1092 = precise::min(_1080, _1078);
    float _1094 = precise::min(_1072, 1.0);
    float _1150;
    if (!_695)
    {
        float _1096 = rint(_632);
        float _1098 = precise::max(_1096, 0.0);
        uint _1100 = uint(_1098);
        uint _1102 = clamp(_1100, 0u, 65535u);
        float _1104 = _1090 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1106 = fma(_1104, 0.5, _1086);
        float _1108 = fma(_1104, 0.5, _1084);
        float _1110 = fma(_1104, -0.5, _1084);
        float _1112 = fma(_1104, -0.5, _1086);
        float3 _3014 = float3(_1084, _1106, float(int(_1102)));
        float3 _3018 = select(_3014, float3(0.0), isnan(_3014));
        float _1114 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3018.xy, uint(rint(_3018.z)), _1090);
        float3 _3027 = float3(_1108, _1106, float(int(_1102)));
        float3 _3029 = select(_3027, float3(0.0), isnan(_3027));
        float _1116 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3029.xy, uint(rint(_3029.z)), _1090);
        float3 _3038 = float3(_1110, _1106, float(int(_1102)));
        float3 _3040 = select(_3038, float3(0.0), isnan(_3038));
        float _1118 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3040.xy, uint(rint(_3040.z)), _1090);
        float3 _3049 = float3(_1108, _1086, float(int(_1102)));
        float3 _3051 = select(_3049, float3(0.0), isnan(_3049));
        float _1120 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3051.xy, uint(rint(_3051.z)), _1090);
        float3 _3060 = float3(_1084, _1086, float(int(_1102)));
        float3 _3062 = select(_3060, float3(0.0), isnan(_3060));
        float _1122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3062.xy, uint(rint(_3062.z)), _1090);
        float3 _3071 = float3(_1110, _1086, float(int(_1102)));
        float3 _3073 = select(_3071, float3(0.0), isnan(_3071));
        float _1124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3073.xy, uint(rint(_3073.z)), _1090);
        float3 _3082 = float3(_1108, _1112, float(int(_1102)));
        float3 _3084 = select(_3082, float3(0.0), isnan(_3082));
        float _1126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3084.xy, uint(rint(_3084.z)), _1090);
        float3 _3093 = float3(_1084, _1112, float(int(_1102)));
        float3 _3095 = select(_3093, float3(0.0), isnan(_3093));
        float _1128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3095.xy, uint(rint(_3095.z)), _1090);
        float3 _3104 = float3(_1110, _1112, float(int(_1102)));
        float3 _3106 = select(_3104, float3(0.0), isnan(_3104));
        float _1130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3106.xy, uint(rint(_3106.z)), _1090);
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
        float _1154 = rint(_632);
        float _1156 = precise::max(_1154, 0.0);
        uint _1158 = uint(_1156);
        uint _1160 = clamp(_1158, 0u, 65535u);
        float3 _3153 = float3(_1084, _1086, float(int(_1160)));
        float3 _3155 = select(_3153, float3(0.0), isnan(_3153));
        float _1162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3155.xy, uint(rint(_3155.z)), _1090);
        _1150 = _1162;
    }
    _1152 = false;
    float _1164 = _1150;
    float _1166 = _550 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1168 = _550 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1170 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1166);
    float _1172 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1168);
    float _1174 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1170);
    float _1176 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1172);
    float _1178 = _1174 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1180 = _1176 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1182 = -_167;
    float _1184 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1186 = _1182 + _1184;
    float _1188 = trunc(_1178);
    int _1190 = int(_1188);
    float _1192 = trunc(_1180);
    int _1194 = int(_1192);
    int _1196 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1198 = _1190 + _1196;
    int _1200 = _1198 + 1;
    float _1202 = -_167;
    float _1204 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1206 = _1202 + _1204;
    bool _1208 = _1200 >= 0;
    int _1210 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1212 = _1194 + _1210;
    int _1214 = _1212 + 1;
    bool _1216 = _1200 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1218 = !_1208;
    bool _1220 = _1216 || _1218;
    bool _1222 = _1214 < 0;
    bool _1224 = _1222 || _1220;
    bool _1226 = _1214 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1228 = _1226 || _1224;
    if (_1228)
    {
        _290 = 1.0;
    }
    float _1230 = _290;
    float _1232 = _1230;
    if (!_1228)
    {
        int _1234 = _1214 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1236 = _1234 + _1200;
        float _1238 = floor(_1178);
        int _1240 = _1236 << 2;
        int _1242 = _1236 >> 2;
        int _1244 = 12 & _1240;
        int _1246 = _1242 << 4;
        int _1248 = _1246 + _1244;
        float _1250 = floor(_1180);
        uint _1252 = uint(int(uint(_1248) >> uint(2)));
        uint _1254 = uint(int(uint(int(_1252)) >> uint(2)));
        int _1256 = int(_1252) & 3;
        float _1258 = (*spvDescriptorSet0.fp_c5)._m0[int(_1254)][_1256];
        float _1260 = -_1238;
        float _1262 = _1178 + _1260;
        float _1264 = -_1250;
        float _1266 = _1180 + _1264;
        float _1268 = rint(_1258);
        float _1270 = precise::max(_1268, 0.0);
        uint _1272 = uint(_1270);
        uint _1274 = clamp(_1272, 0u, 65535u);
        float3 _3340 = float3(_1262, _1266, float(int(_1274)));
        float3 _3342 = select(_3340, float3(0.0), isnan(_3340));
        float _1276 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3342.xy, uint(rint(_3342.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3342.xy, uint(rint(_3342.z)), level(0.0)).x;
        int _1278 = _1236 << 4;
        int _1280 = _1278 + 1648;
        int _1282 = _1248 + 8048;
        uint _1284 = uint(int(uint(_1282) >> uint(2)));
        uint _1286 = uint(int(uint(int(_1284)) >> uint(2)));
        int _1288 = int(_1284) & 3;
        float _1290 = (*spvDescriptorSet0.fp_c5)._m0[int(_1286)][_1288];
        uint _1292 = uint(int(uint(_1280) >> uint(2)));
        uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
        int _1296 = int(_1292) & 3;
        float _1298 = (*spvDescriptorSet0.fp_c5)._m0[int(_1294)][_1296];
        int _1300 = int(_1292) + 1;
        uint _1302 = uint(int(uint(_1300) >> uint(2)));
        int _1304 = _1300 & 3;
        float _1306 = (*spvDescriptorSet0.fp_c5)._m0[int(_1302)][_1304];
        int _1308 = _1280 + 8;
        uint _1310 = uint(int(uint(_1308) >> uint(2)));
        uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
        int _1314 = int(_1310) & 3;
        float _1316 = (*spvDescriptorSet0.fp_c5)._m0[int(_1312)][_1314];
        int _1318 = int(_1310) + 1;
        uint _1320 = uint(int(uint(_1318) >> uint(2)));
        int _1322 = _1318 & 3;
        float _1324 = (*spvDescriptorSet0.fp_c5)._m0[int(_1320)][_1322];
        float _1326 = _1290 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1328 = _550 * _1306;
        float _1330 = fma(_546, _1298, _1328);
        float _1332 = 1.0 / _1290;
        float _1334 = fma(_548, _1316, _1330);
        float _1336 = _1334 + _1324;
        float _1338 = precise::clamp(_1336, 0.0, 1.0);
        float _1340 = -_1338;
        float _1342 = _1340 + _1276;
        float _1344 = fma(_1332, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1342);
        float _1346 = _1326 * _1344;
        float _1348 = exp2(_1346);
        float _1350 = 0.0 + _1348;
        float _1352 = precise::clamp(_1350, 0.0, 1.0);
        _1232 = _1352;
    }
    float _1354 = _1232;
    float _1356 = precise::min(_1354, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1358 = -_1164;
    float _1360 = _1358 + 1.0;
    float _1362 = _1206 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1364 = precise::clamp(_1362, 0.0, 1.0);
    float _1366 = _1186 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1368 = precise::clamp(_1366, 0.0, 1.0);
    float _1370 = -_1356;
    float _1372 = _1370 + 1.0;
    float _1374 = fma(_1364, _1360, _1164);
    float _1376 = fma(_1368, _1372, _1356);
    out.m_62.x = _1374;
    out.m_62.y = _1376;
    out.m_62.z = _1082;
    out.m_62.w = _1092;
    out.m_64.x = _1094;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

