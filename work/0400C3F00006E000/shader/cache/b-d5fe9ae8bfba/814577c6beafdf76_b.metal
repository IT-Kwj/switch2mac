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
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_14 [[id(7)]];
    sampler fp_t_tcb_14Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_A [[id(13)]];
    sampler fp_t_tcb_ASmplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_E [[id(15)]];
    sampler fp_t_tcb_ESmplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_12Smplr_w [[id(18)]];
    sampler fp_t_tcb_14Smplr_w [[id(19)]];
    sampler fp_t_tcb_10Smplr_w [[id(20)]];
    sampler fp_t_tcb_CSmplr_w [[id(21)]];
    sampler fp_t_tcb_ESmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
    float4 m_62 [[color(1)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_51.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_51.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _69;
    float _85 = _83 * _75;
    float _87 = _83 * _81;
    float _89 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1176 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1176, float2(0.0), isnan(_1176))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1176, float2(0.0), isnan(_1176))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1191 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1191, float2(0.0), isnan(_1191))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1191, float2(0.0), isnan(_1191))).x;
    float2 _1199 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1199, float2(0.0), isnan(_1199))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1199, float2(0.0), isnan(_1199))).x;
    float _99 = in.m_53.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_53.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_55.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_55.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_57.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_57.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _83 * _109;
    float _137 = _83 * _115;
    float _139 = _83 * _127;
    float _141 = -_91;
    float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _145 = 1.0 / _143;
    float _147 = -_95;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _151 = -_97;
    float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _155 = _83 * _103;
    float _157 = 1.0 / _149;
    float _159 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _161 = _145 * _159;
    float _163 = 1.0 / _153;
    float _165 = _161 * _155;
    float _167 = _161 * _135;
    float _169 = _83 * _121;
    float _171 = _83 * _133;
    float _173 = _165 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = _157 * _175;
    float _179 = _165 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _181 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[32].x, _173);
    float _183 = -_167;
    float _185 = fma(_177, _137, _183);
    float _187 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[30].x, _179);
    float _189 = -_161;
    float _191 = _189 + _177;
    float _193 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[32].z, _181);
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _197 = _163 * _195;
    float _199 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[30].z, _187);
    float _201 = -_165;
    float _203 = fma(_177, _169, _201);
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _207 = -_167;
    float _209 = fma(_197, _139, _207);
    float _211 = _199 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _213 = -_165;
    float _215 = fma(_197, _171, _213);
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _219 = _205 + _217;
    float _221 = -_161;
    float _223 = _221 + _197;
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _227 = _211 + _225;
    float _229 = _191 * _209;
    float _231 = _219 * _219;
    float _233 = _203 * _223;
    float _235 = -_229;
    float _237 = fma(_185, _223, _235);
    float _239 = fma(_227, _227, _231);
    float _241 = _185 * _215;
    float _243 = -_233;
    float _245 = fma(_191, _215, _243);
    float _247 = _237 * _237;
    float _249 = sqrt(_239);
    float _251 = -_241;
    float _253 = fma(_203, _209, _251);
    float _255 = _165 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _257 = fma(_245, _245, _247);
    float _259 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].x, _255);
    float _261 = fma(_253, _253, _257);
    float _263 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[31].z, _259);
    float _265 = rsqrt(_261);
    float _267 = _263 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _271 = _249 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _273 = _245 * _265;
    float _275 = _237 * _265;
    float _277 = _253 * _265;
    bool _279 = !_271;
    float _281 = _211;
    float _283 = _205;
    float _285 = _267;
    if (!_279)
    {
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _289 = _249 + _287;
        float _291 = _267 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = rsqrt(_239);
        float _295 = -_267;
        float _297 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = _295 + _297;
        float _301 = abs(_291);
        float _303 = abs(_289);
        float _305 = precise::max(_301, _303);
        float _307 = _299 * _299;
        bool _309 = _305 >= 16.0;
        float _311 = _227 * _293;
        float _313 = _219 * _293;
        float _315 = -_227;
        float _317 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[41].z, _315);
        float _319 = -_219;
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
        _281 = _534;
        _283 = _536;
        _285 = _532;
    }
    float _538 = _281;
    float _540 = _283;
    float _542 = _285;
    float _544 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float _546 = fma(_540, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1879 = float2(_544, _546);
    float _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1879, float2(0.0), isnan(_1879))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1879, float2(0.0), isnan(_1879))).x;
    float _550 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _552 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _554 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].x, _550);
    float _556 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].x, _552);
    float _558 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].z, _554);
    float _560 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].z, _556);
    float _562 = -_558;
    float _564 = fma(_562, _558, 1.0);
    float _566 = -_558;
    float _568 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[35].z, _277);
    float _570 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _572 = _560 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _574 = _564 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _576 = -_558;
    float _578 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _580 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].x, _570);
    float _582 = -_558;
    float _584 = fma(_582, (*spvDescriptorSet0.fp_c3)._m0[35].x, _273);
    float _586 = fma(_568, _574, _161);
    float _588 = fma(_578, _574, _165);
    float _590 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].z, _580);
    float _592 = fma(_584, _574, _167);
    float _594 = -_586;
    bool _596 = _594 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _598 = float(_596);
    float _600 = _590 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _602 = -_586;
    bool _604 = _602 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _606 = float(_604);
    float _608 = _598 + _606;
    float _610 = trunc(_572);
    int _612 = int(_610);
    float _614 = precise::min(_608, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _616 = trunc(_600);
    int _618 = int(_616);
    float _620 = trunc(_614);
    int _622 = int(_620);
    int _624 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _626 = _612 + _624;
    int _628 = _626 + 1;
    bool _630 = _628 >= 0;
    int _632 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _634 = _618 + _632;
    int _636 = _634 + 1;
    bool _638 = _628 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _640 = !_630;
    bool _642 = _638 || _640;
    bool _644 = _636 < 0;
    bool _646 = _644 || _642;
    int _648 = _622 << 6;
    bool _650 = _636 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _652 = _650 || _646;
    int _654 = _648 + 48;
    uint _657 = uint(int(uint(_654) >> uint(2)));
    uint _659 = uint(int(uint(int(_657)) >> uint(2)));
    int _661 = int(_657) & 3;
    float _663 = (*spvDescriptorSet0.fp_c3)._m0[int(_659)][_661];
    int _665 = int(_657) + 1;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    int _669 = _665 & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    int _673 = _648 + 56;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    uint _677 = uint(int(uint(int(_675)) >> uint(2)));
    int _679 = int(_675) & 3;
    float _681 = (*spvDescriptorSet0.fp_c3)._m0[int(_677)][_679];
    int _683 = int(_675) + 1;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    int _687 = _683 & 3;
    float _689 = (*spvDescriptorSet0.fp_c3)._m0[int(_685)][_687];
    int _691 = _628;
    int _693 = _636;
    float _695 = _600;
    if (!_652)
    {
        int _697 = _636 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _699 = _697 + _628;
        _691 = _699;
    }
    int _701 = _691;
    int _703 = _648 + 16;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    uint _707 = uint(int(uint(int(_705)) >> uint(2)));
    int _709 = int(_705) & 3;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[int(_707)][_709];
    int _713 = int(_705) + 1;
    uint _715 = uint(int(uint(_713) >> uint(2)));
    int _717 = _713 & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = 0;
    if (!_652)
    {
        int _723 = _701 << 2;
        _721 = _723;
    }
    int _725 = _721;
    int _727 = _725;
    if (!_652)
    {
        int _729 = _701 >> 2;
        _693 = _729;
    }
    int _731 = _693;
    int _733 = _731;
    if (!_652)
    {
        int _735 = 12 & _725;
        _727 = _735;
    }
    int _737 = _727;
    uint _739 = uint(int(uint(_648) >> uint(2)));
    uint _741 = uint(int(uint(int(_739)) >> uint(2)));
    int _743 = int(_739) & 3;
    float _745 = (*spvDescriptorSet0.fp_c3)._m0[int(_741)][_743];
    int _747 = int(_739) + 1;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    int _751 = _747 & 3;
    float _753 = (*spvDescriptorSet0.fp_c3)._m0[int(_749)][_751];
    if (!_652)
    {
        int _755 = _731 << 4;
        int _757 = _755 + _737;
        _733 = _757;
    }
    int _759 = _733;
    int _761 = _648 + 32;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    uint _765 = uint(int(uint(int(_763)) >> uint(2)));
    int _767 = int(_763) & 3;
    float _769 = (*spvDescriptorSet0.fp_c3)._m0[int(_765)][_767];
    int _771 = int(_763) + 1;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    int _775 = _771 & 3;
    float _777 = (*spvDescriptorSet0.fp_c3)._m0[int(_773)][_775];
    int _779 = _648 + 8;
    uint _781 = uint(int(uint(_779) >> uint(2)));
    uint _783 = uint(int(uint(int(_781)) >> uint(2)));
    int _785 = int(_781) & 3;
    float _787 = (*spvDescriptorSet0.fp_c3)._m0[int(_783)][_785];
    int _789 = int(_781) + 1;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    int _793 = _789 & 3;
    float _795 = (*spvDescriptorSet0.fp_c3)._m0[int(_791)][_793];
    int _797 = _648 + 24;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    uint _801 = uint(int(uint(int(_799)) >> uint(2)));
    int _803 = int(_799) & 3;
    float _805 = (*spvDescriptorSet0.fp_c3)._m0[int(_801)][_803];
    int _807 = int(_799) + 1;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    int _811 = _807 & 3;
    float _813 = (*spvDescriptorSet0.fp_c3)._m0[int(_809)][_811];
    float _815 = _588 * _671;
    float _817 = _671;
    if (!_652)
    {
        float _819 = floor(_600);
        _817 = _819;
    }
    float _821 = _817;
    float _823 = fma(_592, _663, _815);
    float _825 = 0.0;
    if (!_652)
    {
        uint _827 = uint(int(uint(_759) >> uint(2)));
        uint _829 = uint(int(uint(int(_827)) >> uint(2)));
        int _831 = int(_827) & 3;
        float _833 = (*spvDescriptorSet0.fp_c5)._m0[int(_829)][_831];
        _825 = _833;
    }
    float _835 = _825;
    float _837 = fma(_586, _681, _823);
    float _839 = _681;
    if (!_652)
    {
        float _841 = floor(_572);
        _839 = _841;
    }
    float _843 = _839;
    float _845 = _837 + _689;
    int _847 = _648 + 40;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    uint _851 = uint(int(uint(int(_849)) >> uint(2)));
    int _853 = int(_849) & 3;
    float _855 = (*spvDescriptorSet0.fp_c3)._m0[int(_851)][_853];
    int _857 = int(_849) + 1;
    uint _859 = uint(int(uint(_857) >> uint(2)));
    int _861 = _857 & 3;
    float _863 = (*spvDescriptorSet0.fp_c3)._m0[int(_859)][_861];
    float _865 = _588 * _719;
    if (!_652)
    {
        float _867 = -_821;
        float _869 = _600 + _867;
        _695 = _869;
    }
    float _871 = _695;
    float _873 = fma(_592, _711, _865);
    float _875 = 1.0 / _845;
    float _877 = _588 * _753;
    float _879 = _753;
    if (!_652)
    {
        float _881 = -_843;
        float _883 = _572 + _881;
        _879 = _883;
    }
    float _885 = _879;
    float _887 = fma(_592, _745, _877);
    float _889 = _588 * _777;
    float _891 = fma(_592, _769, _889);
    float _893 = fma(_586, _787, _887);
    float _895 = _893 + _795;
    float _897 = rint(_614);
    float _899 = precise::max(_897, 0.0);
    uint _901 = uint(_899);
    uint _903 = clamp(_901, 0u, 65535u);
    float _905 = fma(_586, _805, _873);
    float _907 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _909 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _911 = _895 * _875;
    float _913 = _905 + _813;
    float _915 = _895;
    if (!_652)
    {
        float _917 = rint(_835);
        float _919 = precise::max(_917, 0.0);
        uint _921 = uint(_919);
        uint _923 = clamp(_921, 0u, 65535u);
        _915 = as_type<float>(_923);
    }
    float _925 = _915;
    float2 _2520 = float2(_907, _909);
    float _927 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2520, float2(0.0), isnan(_2520))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2520, float2(0.0), isnan(_2520))).x;
    float _929 = _913 * _875;
    float _931 = fma(_586, _855, _891);
    float _933 = _931 + _863;
    float _935 = _933 * _875;
    float _937 = precise::clamp(_935, 0.0, 1.0);
    float2 _2543 = float2(_544, _546);
    float _939 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2543, float2(0.0), isnan(_2543)), level(_548)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2543, float2(0.0), isnan(_2543)), level(_548)).x;
    float2 _2552 = float2(_85, _87);
    float _941 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2552, float2(0.0), isnan(_2552))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2552, float2(0.0), isnan(_2552))).x;
    float3 _2564 = float3(_911, _929, float(int(_903)));
    float3 _2568 = select(_2564, float3(0.0), isnan(_2564));
    float _943 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2568.xy, uint(rint(_2568.z)), _937);
    float _945 = _925;
    if (!_652)
    {
        float3 _2581 = float3(_885, _871, float(as_type<int>(_925)));
        float3 _2583 = select(_2581, float3(0.0), isnan(_2581));
        float _947 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2583.xy, uint(rint(_2583.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2583.xy, uint(rint(_2583.z)), level(0.0)).x;
        _945 = _947;
    }
    float _949 = _945;
    float _951 = abs(_161);
    float _953 = log2(_951);
    float _955 = _953 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _957 = exp2(_955);
    float _959 = fma(_957, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _961 = precise::clamp(_959, 0.0, 1.0);
    float _963 = fma(_961, -2.0, 3.0);
    float _965 = _961 * _961;
    float _967 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _969 = _965 * _963;
    float _971 = precise::max(0.0, _967);
    float _973 = -_161;
    float _975 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _977 = _973 + _975;
    float _979 = -_969;
    float _981 = _979 + 1.0;
    float _983 = fma(_981, (*spvDescriptorSet0.fp_c3)._m0[44].w, _969);
    bool _985 = _161 >= (-8000.0);
    bool _987 = isnan(_161);
    bool _989 = _985 || _987;
    bool _991 = isnan(-8000.0);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = _983 * _971;
    float _999 = _995 * _997;
    float _1001 = _999 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1003 = -_927;
    float _1005 = _1003 + 1.0;
    float _1007 = _1005 * _1001;
    float _1009 = precise::clamp(_1007, 0.0, 1.0);
    float _1011 = -_1009;
    float _1013 = fma(_1011, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1015 = -_161;
    float _1017 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1019 = _1015 + _1017;
    float _1021 = abs(_939);
    float _1023 = _1021 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1025 = -_1023;
    float _1027 = fma(_995, _1025, 1.0);
    float _1029 = _995;
    if (_652)
    {
        _1029 = 1.0;
    }
    float _1031 = _1029;
    float _1033 = _1031;
    if (!_652)
    {
        int _1035 = _701 << 4;
        int _1037 = _1035 + 1648;
        int _1039 = _759 + 8048;
        uint _1041 = uint(int(uint(_1039) >> uint(2)));
        uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
        int _1045 = int(_1041) & 3;
        float _1047 = (*spvDescriptorSet0.fp_c5)._m0[int(_1043)][_1045];
        uint _1049 = uint(int(uint(_1037) >> uint(2)));
        uint _1051 = uint(int(uint(int(_1049)) >> uint(2)));
        int _1053 = int(_1049) & 3;
        float _1055 = (*spvDescriptorSet0.fp_c5)._m0[int(_1051)][_1053];
        int _1057 = int(_1049) + 1;
        uint _1059 = uint(int(uint(_1057) >> uint(2)));
        int _1061 = _1057 & 3;
        float _1063 = (*spvDescriptorSet0.fp_c5)._m0[int(_1059)][_1061];
        int _1065 = _1037 + 8;
        uint _1067 = uint(int(uint(_1065) >> uint(2)));
        uint _1069 = uint(int(uint(int(_1067)) >> uint(2)));
        int _1071 = int(_1067) & 3;
        float _1073 = (*spvDescriptorSet0.fp_c5)._m0[int(_1069)][_1071];
        int _1075 = int(_1067) + 1;
        uint _1077 = uint(int(uint(_1075) >> uint(2)));
        int _1079 = _1075 & 3;
        float _1081 = (*spvDescriptorSet0.fp_c5)._m0[int(_1077)][_1079];
        float _1083 = 1.0 / _1047;
        float _1085 = _542 * _1063;
        float _1087 = fma(_538, _1055, _1085);
        float _1089 = fma(_540, _1073, _1087);
        float _1091 = _1089 + _1081;
        float _1093 = precise::clamp(_1091, 0.0, 1.0);
        float _1095 = -_1093;
        float _1097 = _1095 + _949;
        float _1099 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1101 = fma(_1083, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1097);
        float _1103 = _1099 * _1101;
        float _1105 = exp2(_1103);
        float _1107 = 0.0 + _1105;
        float _1109 = precise::clamp(_1107, 0.0, 1.0);
        _1033 = _1109;
    }
    float _1111 = _1033;
    float _1113 = precise::min(_1111, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1115 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1117 = precise::clamp(_1115, 0.0, 1.0);
    float _1119 = _977 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1121 = precise::clamp(_1119, 0.0, 1.0);
    float _1123 = -_943;
    float _1125 = _1123 + 1.0;
    float _1127 = precise::min(_1027, 1.0);
    float _1129 = -_1113;
    float _1131 = _1129 + 1.0;
    float _1133 = fma(_1117, _1125, _943);
    float _1135 = precise::min(_1127, _1013);
    float _1137 = fma(_1121, _1131, _1113);
    out.m_60.x = _1133;
    out.m_60.y = _1137;
    out.m_60.z = 1.0;
    out.m_60.w = _1135;
    out.m_62.x = _941;
    out.m_62.y = 0.5;
    out.m_62.z = 0.5;
    out.m_62.w = 1.0;
    return out;
}

