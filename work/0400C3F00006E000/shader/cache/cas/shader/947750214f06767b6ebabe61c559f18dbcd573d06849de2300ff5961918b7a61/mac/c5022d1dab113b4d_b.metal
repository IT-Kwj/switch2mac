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
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_12Smplr_w [[id(17)]];
    sampler fp_t_tcb_ESmplr_w [[id(18)]];
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
    float2 _1160 = float2(_83, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1160, float2(0.0), isnan(_1160))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1160, float2(0.0), isnan(_1160))).x;
    float _91 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1175 = float2(_87, _85);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1175, float2(0.0), isnan(_1175))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1175, float2(0.0), isnan(_1175))).x;
    float2 _1183 = float2(_83, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1183, float2(0.0), isnan(_1183))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1183, float2(0.0), isnan(_1183))).x;
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
    float _139 = _81 * _125;
    float _141 = -_89;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _145 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[41].x, _143);
    float _147 = _145 * _133;
    float _149 = _145 * _135;
    float _151 = -_93;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _155 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].x, _153);
    float _157 = _81 * _119;
    float _159 = _147 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _161 = _147 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _163 = _81 * _131;
    float _165 = -_149;
    float _167 = fma(_155, _137, _165);
    float _169 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[32].x, _159);
    float _171 = -_95;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _175 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[41].x, _173);
    float _177 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[30].x, _161);
    float _179 = -_147;
    float _181 = fma(_155, _157, _179);
    float _183 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[32].z, _169);
    float _185 = -_145;
    float _187 = _185 + _155;
    float _189 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[30].z, _177);
    float _191 = -_149;
    float _193 = fma(_175, _139, _191);
    float _195 = _183 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _197 = -_147;
    float _199 = fma(_175, _163, _197);
    float _201 = _189 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _203 = -_145;
    float _205 = _203 + _175;
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _209 = _195 + _207;
    float _211 = _187 * _193;
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _215 = _201 + _213;
    float _217 = _181 * _205;
    float _219 = _209 * _209;
    float _221 = -_211;
    float _223 = fma(_167, _205, _221);
    float _225 = _167 * _199;
    float _227 = -_217;
    float _229 = fma(_187, _199, _227);
    float _231 = fma(_215, _215, _219);
    float _233 = _223 * _223;
    float _235 = -_225;
    float _237 = fma(_181, _193, _235);
    float _239 = _147 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _241 = sqrt(_231);
    float _243 = fma(_229, _229, _233);
    float _245 = fma(_237, _237, _243);
    float _247 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[31].x, _239);
    float _249 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[31].z, _247);
    float _251 = rsqrt(_245);
    float _253 = _249 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _257 = _241 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _259 = _229 * _251;
    float _261 = _223 * _251;
    float _263 = _237 * _251;
    bool _265 = !_257;
    float _267 = _201;
    float _269 = _195;
    float _271 = _253;
    if (!_265)
    {
        float _273 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _275 = _241 + _273;
        float _277 = _253 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _279 = rsqrt(_231);
        float _281 = -_253;
        float _283 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _285 = _281 + _283;
        float _287 = abs(_277);
        float _289 = abs(_275);
        float _291 = precise::max(_287, _289);
        float _293 = _285 * _285;
        bool _295 = _291 >= 16.0;
        float _297 = _215 * _279;
        float _299 = _209 * _279;
        float _301 = -_215;
        float _303 = fma(_297, (*spvDescriptorSet0.fp_c3)._m0[41].z, _301);
        float _305 = -_209;
        float _307 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[41].z, _305);
        float _309 = _275;
        float _311 = _277;
        int _314 = as_type<int>(_307);
        if (_295)
        {
            float _316 = _275 * 0.0625;
            _309 = _316;
        }
        float _318 = _309;
        if (_295)
        {
            float _320 = _277 * 0.0625;
            _311 = _320;
        }
        float _322 = _311;
        float _324 = fma(_303, _303, _293);
        float _326 = abs(_318);
        bool _328 = _326 != 0.0;
        bool _330 = isnan(_326);
        bool _332 = _328 || _330;
        bool _334 = isnan(0.0);
        bool _336 = _332 || _334;
        float _338 = fma(_307, _307, _324);
        float _340 = abs(_322);
        bool _342 = _340 == 0.0;
        float _344 = abs(_322);
        bool _346 = _344 == 0.0;
        bool _348 = !_336;
        bool _350 = _346 && _348;
        float _352 = sqrt(_338);
        bool _354 = false;
        if (_350)
        {
            bool _356 = as_type<int>(_322) >= 0;
            _354 = _356;
        }
        bool _358 = _354;
        int _360 = _358 ? (-1) : 0;
        if (_350)
        {
            int _362 = _358 ? 0 : 1078530011;
            _314 = _362;
        }
        int _364 = _314;
        int _366 = _364;
        if (_350)
        {
            int _368 = int(0x80000000) & as_type<int>(_318);
            int _370 = _364 | _368;
            _366 = _370;
        }
        int _372 = _366;
        bool _374 = !_336;
        bool _376 = _374 && _342;
        int _378 = _372;
        float _380 = as_type<float>(_372);
        if (!_376)
        {
            float _382 = abs(_318);
            bool _384 = _382 != as_type<float>(0x7f800000u /* inf */);
            bool _386 = isnan(_382);
            bool _388 = _384 || _386;
            bool _390 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _392 = _388 || _390;
            float _394 = abs(_322);
            bool _396 = _394 == as_type<float>(0x7f800000u /* inf */);
            float _398 = abs(_322);
            bool _400 = _398 == as_type<float>(0x7f800000u /* inf */);
            bool _402 = !_392;
            bool _404 = _400 && _402;
            if (_404)
            {
                bool _406 = as_type<int>(_322) >= 0;
                _360 = _406 ? (-1) : 0;
            }
            int _408 = _360;
            if (_404)
            {
                _378 = 1075235812;
            }
            int _410 = _378;
            int _412 = _410;
            if (_404)
            {
                int _414 = ~_408;
                int _416 = (_414 != 0) ? _410 : 1061752795;
                _412 = _416;
            }
            int _418 = _412;
            float _420 = as_type<float>(_418);
            if (_404)
            {
                int _422 = int(0x80000000) & as_type<int>(_318);
                int _424 = _418 | _422;
                _420 = as_type<float>(_424);
            }
            float _426 = _420;
            bool _428 = !_392;
            bool _430 = _428 && _396;
            _380 = _426;
            if (!_430)
            {
                float _432 = abs(_318);
                float _434 = abs(_322);
                float _436 = precise::max(_432, _434);
                float _438 = abs(_318);
                float _440 = abs(_322);
                float _442 = precise::min(_438, _440);
                float _444 = 1.0 / _436;
                float _446 = abs(_318);
                float _448 = abs(_322);
                bool _450 = _446 > _448;
                bool _452 = as_type<int>(_322) >= 0;
                float _454 = _442 * _444;
                float _456 = abs(_318);
                float _458 = abs(_322);
                float _460 = _456 + _458;
                int _462 = as_type<int>(_318) & int(0x80000000);
                float _464 = _454 * _454;
                bool _466 = _460 > as_type<float>(0x7f800000u /* inf */);
                bool _468 = isnan(_460);
                bool _470 = _466 || _468;
                bool _472 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _474 = _470 || _472;
                float _476 = _464 + 11.33538818359375;
                float _478 = fma(_464, _476, 28.84246826171875);
                float _480 = fma(_464, _478, 19.6966705322265625);
                float _482 = fma(_464, -0.82336294651031494140625, -5.674867153167724609375);
                float _484 = fma(_464, _482, -6.565555095672607421875);
                float _486 = 1.0 / _480;
                float _488 = _464 * _484;
                float _490 = _454 * _488;
                float _492 = fma(_490, _486, _454);
                float _494 = _492;
                _380 = _460;
                if (_450)
                {
                    float _496 = -_492;
                    float _498 = _496 + 1.57079637050628662109375;
                    _494 = _498;
                }
                float _500 = _494;
                int _502 = as_type<int>(_500);
                if (!_452)
                {
                    float _504 = -_500;
                    float _506 = _504 + 3.1415927410125732421875;
                    _502 = as_type<int>(_506);
                }
                int _508 = _502;
                if (!_474)
                {
                    int _510 = _462 | _508;
                    _380 = as_type<float>(_510);
                }
            }
        }
        float _512 = _380;
        float _514 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _516 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _518 = _352 + _516;
        float _520 = fma(_297, _514, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _522 = fma(_299, _514, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _267 = _520;
        _269 = _522;
        _271 = _518;
    }
    float _524 = _267;
    float _526 = _269;
    float _528 = _271;
    float _530 = fma(_524, 6.2500002968590706586837768554688e-05, 0.5);
    float _532 = fma(_526, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1851 = float2(_530, _532);
    float _534 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1851, float2(0.0), isnan(_1851))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1851, float2(0.0), isnan(_1851))).x;
    float _536 = _261 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _538 = _528 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _540 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[35].x, _536);
    float _542 = fma(_524, (*spvDescriptorSet0.fp_c5)._m0[101].x, _538);
    float _544 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[35].z, _540);
    float _546 = fma(_526, (*spvDescriptorSet0.fp_c5)._m0[101].z, _542);
    float _548 = -_544;
    float _550 = fma(_548, _544, 1.0);
    float _552 = -_544;
    float _554 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[35].z, _263);
    float _556 = _528 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _558 = _546 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _560 = _550 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _562 = -_544;
    float _564 = fma(_562, (*spvDescriptorSet0.fp_c3)._m0[35].x, _259);
    float _566 = fma(_524, (*spvDescriptorSet0.fp_c5)._m0[102].x, _556);
    float _568 = trunc(_558);
    int _570 = int(_568);
    float _572 = fma(_554, _560, _145);
    float _574 = -_544;
    float _576 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[35].y, _261);
    float _578 = fma(_526, (*spvDescriptorSet0.fp_c5)._m0[102].z, _566);
    float _580 = fma(_564, _560, _149);
    float _582 = -_572;
    bool _584 = _582 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _586 = float(_584);
    float _588 = _578 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _590 = -_572;
    bool _592 = _590 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _594 = float(_592);
    float _596 = fma(_576, _560, _147);
    float _598 = _586 + _594;
    float _600 = trunc(_588);
    int _602 = int(_600);
    int _604 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _606 = _570 + _604;
    int _608 = _606 + 1;
    float _610 = precise::min(_598, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    bool _612 = _608 >= 0;
    float _614 = trunc(_610);
    int _616 = int(_614);
    bool _618 = _608 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _620 = !_612;
    bool _622 = _618 || _620;
    int _624 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _626 = _602 + _624;
    int _628 = _626 + 1;
    bool _630 = _628 < 0;
    bool _632 = _630 || _622;
    int _634 = _616 << 6;
    bool _636 = _628 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _638 = _636 || _632;
    int _640 = _634 + 48;
    uint _643 = uint(int(uint(_640) >> uint(2)));
    uint _645 = uint(int(uint(int(_643)) >> uint(2)));
    int _647 = int(_643) & 3;
    float _649 = (*spvDescriptorSet0.fp_c3)._m0[int(_645)][_647];
    int _651 = int(_643) + 1;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    int _655 = _651 & 3;
    float _657 = (*spvDescriptorSet0.fp_c3)._m0[int(_653)][_655];
    int _659 = _634 + 56;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    uint _663 = uint(int(uint(int(_661)) >> uint(2)));
    int _665 = int(_661) & 3;
    float _667 = (*spvDescriptorSet0.fp_c3)._m0[int(_663)][_665];
    int _669 = int(_661) + 1;
    uint _671 = uint(int(uint(_669) >> uint(2)));
    int _673 = _669 & 3;
    float _675 = (*spvDescriptorSet0.fp_c3)._m0[int(_671)][_673];
    int _677 = _628;
    if (!_638)
    {
        int _679 = _628 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _681 = _679 + _608;
        _677 = _681;
    }
    int _683 = _677;
    uint _685 = uint(int(uint(_634) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = int(_685) + 1;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    int _697 = _693 & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    int _701 = 0;
    if (!_638)
    {
        int _703 = _683 << 2;
        _701 = _703;
    }
    int _705 = _701;
    int _707 = 0;
    int _709 = _705;
    if (!_638)
    {
        int _711 = _683 >> 2;
        _707 = _711;
    }
    int _713 = _707;
    int _715 = _713;
    if (!_638)
    {
        int _717 = 12 & _705;
        _709 = _717;
    }
    int _719 = _709;
    int _721 = _634 + 16;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    uint _725 = uint(int(uint(int(_723)) >> uint(2)));
    int _727 = int(_723) & 3;
    float _729 = (*spvDescriptorSet0.fp_c3)._m0[int(_725)][_727];
    int _731 = int(_723) + 1;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    int _735 = _731 & 3;
    float _737 = (*spvDescriptorSet0.fp_c3)._m0[int(_733)][_735];
    if (!_638)
    {
        int _739 = _713 << 4;
        int _741 = _739 + _719;
        _715 = _741;
    }
    int _743 = _715;
    int _745 = _634 + 32;
    uint _747 = uint(int(uint(_745) >> uint(2)));
    uint _749 = uint(int(uint(int(_747)) >> uint(2)));
    int _751 = int(_747) & 3;
    float _753 = (*spvDescriptorSet0.fp_c3)._m0[int(_749)][_751];
    int _755 = int(_747) + 1;
    uint _757 = uint(int(uint(_755) >> uint(2)));
    int _759 = _755 & 3;
    float _761 = (*spvDescriptorSet0.fp_c3)._m0[int(_757)][_759];
    int _763 = _634 + 8;
    uint _765 = uint(int(uint(_763) >> uint(2)));
    uint _767 = uint(int(uint(int(_765)) >> uint(2)));
    int _769 = int(_765) & 3;
    float _771 = (*spvDescriptorSet0.fp_c3)._m0[int(_767)][_769];
    int _773 = int(_765) + 1;
    uint _775 = uint(int(uint(_773) >> uint(2)));
    int _777 = _773 & 3;
    float _779 = (*spvDescriptorSet0.fp_c3)._m0[int(_775)][_777];
    int _781 = _634 + 24;
    uint _783 = uint(int(uint(_781) >> uint(2)));
    uint _785 = uint(int(uint(int(_783)) >> uint(2)));
    int _787 = int(_783) & 3;
    float _789 = (*spvDescriptorSet0.fp_c3)._m0[int(_785)][_787];
    int _791 = int(_783) + 1;
    uint _793 = uint(int(uint(_791) >> uint(2)));
    int _795 = _791 & 3;
    float _797 = (*spvDescriptorSet0.fp_c3)._m0[int(_793)][_795];
    float _799 = _596 * _657;
    float _801 = _657;
    if (!_638)
    {
        float _803 = floor(_588);
        _801 = _803;
    }
    float _805 = _801;
    float _807 = fma(_580, _649, _799);
    int _809 = _634 + 40;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    uint _813 = uint(int(uint(int(_811)) >> uint(2)));
    int _815 = int(_811) & 3;
    float _817 = (*spvDescriptorSet0.fp_c3)._m0[int(_813)][_815];
    int _819 = int(_811) + 1;
    uint _821 = uint(int(uint(_819) >> uint(2)));
    int _823 = _819 & 3;
    float _825 = (*spvDescriptorSet0.fp_c3)._m0[int(_821)][_823];
    float _827 = fma(_572, _667, _807);
    float _829 = _807;
    if (!_638)
    {
        float _831 = floor(_558);
        _829 = _831;
    }
    float _833 = _829;
    float _835 = _827 + _675;
    float _837 = _596 * _699;
    float _839 = 0.0;
    if (!_638)
    {
        uint _841 = uint(int(uint(_743) >> uint(2)));
        uint _843 = uint(int(uint(int(_841)) >> uint(2)));
        int _845 = int(_841) & 3;
        float _847 = (*spvDescriptorSet0.fp_c5)._m0[int(_843)][_845];
        _839 = _847;
    }
    float _849 = _839;
    float _851 = _805;
    if (!_638)
    {
        float _853 = -_805;
        float _855 = _588 + _853;
        _851 = _855;
    }
    float _857 = _851;
    float _859 = fma(_580, _691, _837);
    float _861 = _596 * _737;
    float _863 = fma(_580, _729, _861);
    float _865 = _596 * _761;
    float _867 = 1.0 / _835;
    float _869 = fma(_580, _753, _865);
    float _871 = fma(_572, _771, _859);
    float _873 = fma(_572, _789, _863);
    float _875 = _871 + _779;
    float _877 = fma(_526, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _879 = _873 + _797;
    float _881 = _797;
    if (!_638)
    {
        float _883 = -_833;
        float _885 = _558 + _883;
        _881 = _885;
    }
    float _887 = _881;
    float _889 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _891 = fma(_572, _817, _869);
    float _893 = _879 * _867;
    float _895 = rint(_610);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    uint _901 = clamp(_899, 0u, 65535u);
    float _903 = _891 + _825;
    float2 _2482 = float2(_889, _877);
    float _905 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2482, float2(0.0), isnan(_2482))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2482, float2(0.0), isnan(_2482))).x;
    float _907 = _875 * _867;
    float _909 = _903 * _867;
    float _911 = precise::clamp(_909, 0.0, 1.0);
    float _913 = _875;
    if (!_638)
    {
        float _915 = rint(_849);
        float _917 = precise::max(_915, 0.0);
        uint _919 = uint(_917);
        uint _921 = clamp(_919, 0u, 65535u);
        _913 = as_type<float>(_921);
    }
    float _923 = _913;
    float2 _2514 = float2(_530, _532);
    float _925 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2514, float2(0.0), isnan(_2514)), level(_534)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2514, float2(0.0), isnan(_2514)), level(_534)).x;
    float3 _2527 = float3(_907, _893, float(int(_901)));
    float3 _2531 = select(_2527, float3(0.0), isnan(_2527));
    float _927 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2531.xy, uint(rint(_2531.z)), _911);
    float _929 = _923;
    if (!_638)
    {
        float3 _2544 = float3(_887, _857, float(as_type<int>(_923)));
        float3 _2546 = select(_2544, float3(0.0), isnan(_2544));
        float _931 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2546.xy, uint(rint(_2546.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2546.xy, uint(rint(_2546.z)), level(0.0)).x;
        _929 = _931;
    }
    float _933 = _929;
    float _935 = abs(_145);
    float _937 = log2(_935);
    float _939 = _937 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _941 = exp2(_939);
    float _943 = fma(_941, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _945 = precise::clamp(_943, 0.0, 1.0);
    float _947 = fma(_945, -2.0, 3.0);
    float _949 = _945 * _945;
    float _951 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _953 = _949 * _947;
    float _955 = precise::max(0.0, _951);
    float _957 = -_953;
    float _959 = _957 + 1.0;
    float _961 = fma(_959, (*spvDescriptorSet0.fp_c3)._m0[44].w, _953);
    bool _963 = _145 >= (-8000.0);
    bool _965 = isnan(_145);
    bool _967 = _963 || _965;
    bool _969 = isnan(-8000.0);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = _961 * _955;
    float _977 = _973 * _975;
    float _979 = _977 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _981 = -_145;
    float _983 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _985 = _981 + _983;
    float _987 = -_905;
    float _989 = _987 + 1.0;
    float _991 = _989 * _979;
    float _993 = precise::clamp(_991, 0.0, 1.0);
    float _995 = -_993;
    float _997 = fma(_995, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _999 = abs(_925);
    float _1001 = _999 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1003 = -_1001;
    float _1005 = fma(_973, _1003, 1.0);
    float _1007 = -_145;
    float _1009 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1011 = _1007 + _1009;
    float _1013 = _973;
    if (_638)
    {
        _1013 = 1.0;
    }
    float _1015 = _1013;
    float _1017 = _1015;
    if (!_638)
    {
        int _1019 = _683 << 4;
        int _1021 = _1019 + 1648;
        int _1023 = _743 + 8048;
        uint _1025 = uint(int(uint(_1023) >> uint(2)));
        uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
        int _1029 = int(_1025) & 3;
        float _1031 = (*spvDescriptorSet0.fp_c5)._m0[int(_1027)][_1029];
        uint _1033 = uint(int(uint(_1021) >> uint(2)));
        uint _1035 = uint(int(uint(int(_1033)) >> uint(2)));
        int _1037 = int(_1033) & 3;
        float _1039 = (*spvDescriptorSet0.fp_c5)._m0[int(_1035)][_1037];
        int _1041 = int(_1033) + 1;
        uint _1043 = uint(int(uint(_1041) >> uint(2)));
        int _1045 = _1041 & 3;
        float _1047 = (*spvDescriptorSet0.fp_c5)._m0[int(_1043)][_1045];
        int _1049 = _1021 + 8;
        uint _1051 = uint(int(uint(_1049) >> uint(2)));
        uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
        int _1055 = int(_1051) & 3;
        float _1057 = (*spvDescriptorSet0.fp_c5)._m0[int(_1053)][_1055];
        int _1059 = int(_1051) + 1;
        uint _1061 = uint(int(uint(_1059) >> uint(2)));
        int _1063 = _1059 & 3;
        float _1065 = (*spvDescriptorSet0.fp_c5)._m0[int(_1061)][_1063];
        float _1067 = _528 * _1047;
        float _1069 = 1.0 / _1031;
        float _1071 = fma(_524, _1039, _1067);
        float _1073 = fma(_526, _1057, _1071);
        float _1075 = _1073 + _1065;
        float _1077 = precise::clamp(_1075, 0.0, 1.0);
        float _1079 = -_1077;
        float _1081 = _1079 + _933;
        float _1083 = _1031 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1085 = fma(_1069, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1081);
        float _1087 = _1083 * _1085;
        float _1089 = exp2(_1087);
        float _1091 = 0.0 + _1089;
        float _1093 = precise::clamp(_1091, 0.0, 1.0);
        _1017 = _1093;
    }
    float _1095 = _1017;
    float _1097 = precise::min(_1095, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1099 = _985 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1101 = precise::clamp(_1099, 0.0, 1.0);
    float _1103 = _1011 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1105 = precise::clamp(_1103, 0.0, 1.0);
    float _1107 = -_927;
    float _1109 = _1107 + 1.0;
    float _1111 = precise::min(_1005, 1.0);
    float _1113 = -_1097;
    float _1115 = _1113 + 1.0;
    float _1117 = fma(_1101, _1109, _927);
    float _1119 = precise::min(_1111, _997);
    float _1121 = fma(_1105, _1115, _1097);
    out.m_58.x = _1117;
    out.m_58.y = _1121;
    out.m_58.z = 1.0;
    out.m_58.w = _1119;
    out.m_60.x = 1.0;
    out.m_60.y = 0.5;
    out.m_60.z = 0.5;
    out.m_60.w = 1.0;
    return out;
}

