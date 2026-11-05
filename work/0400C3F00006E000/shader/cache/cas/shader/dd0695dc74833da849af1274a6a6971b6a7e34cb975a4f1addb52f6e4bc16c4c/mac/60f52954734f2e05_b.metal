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
    float2 _1164 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1164, float2(0.0), isnan(_1164))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1164, float2(0.0), isnan(_1164))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1179 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1179, float2(0.0), isnan(_1179))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1179, float2(0.0), isnan(_1179))).x;
    float2 _1187 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1187, float2(0.0), isnan(_1187))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1187, float2(0.0), isnan(_1187))).x;
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
    float _135 = _83 * _103;
    float _137 = _83 * _109;
    float _139 = _83 * _115;
    float _141 = _83 * _127;
    float _143 = -_91;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _147 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].x, _145);
    float _149 = _147 * _135;
    float _151 = _147 * _137;
    float _153 = -_95;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].x, _155);
    float _159 = _83 * _121;
    float _161 = _149 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _163 = _149 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _165 = _83 * _133;
    float _167 = -_151;
    float _169 = fma(_157, _139, _167);
    float _171 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].x, _161);
    float _173 = -_97;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[41].x, _175);
    float _179 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].x, _163);
    float _181 = -_149;
    float _183 = fma(_157, _159, _181);
    float _185 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[32].z, _171);
    float _187 = -_147;
    float _189 = _187 + _157;
    float _191 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[30].z, _179);
    float _193 = -_151;
    float _195 = fma(_177, _141, _193);
    float _197 = _185 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _199 = -_149;
    float _201 = fma(_177, _165, _199);
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _205 = -_147;
    float _207 = _205 + _177;
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _211 = _197 + _209;
    float _213 = _189 * _195;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _217 = _203 + _215;
    float _219 = _183 * _207;
    float _221 = _211 * _211;
    float _223 = -_213;
    float _225 = fma(_169, _207, _223);
    float _227 = _169 * _201;
    float _229 = -_219;
    float _231 = fma(_189, _201, _229);
    float _233 = fma(_217, _217, _221);
    float _235 = _225 * _225;
    float _237 = -_227;
    float _239 = fma(_183, _195, _237);
    float _241 = _149 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _243 = sqrt(_233);
    float _245 = fma(_231, _231, _235);
    float _247 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].x, _241);
    float _249 = fma(_239, _239, _245);
    float _251 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[31].z, _247);
    float _253 = rsqrt(_249);
    float _255 = _251 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _259 = _243 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _231 * _253;
    float _263 = _225 * _253;
    float _265 = _239 * _253;
    bool _267 = !_259;
    float _269 = _203;
    float _271 = _197;
    float _273 = _255;
    if (!_267)
    {
        float _275 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _277 = _243 + _275;
        float _279 = _255 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _281 = rsqrt(_233);
        float _283 = -_255;
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _287 = _283 + _285;
        float _289 = abs(_279);
        float _291 = abs(_277);
        float _293 = precise::max(_289, _291);
        float _295 = _287 * _287;
        bool _297 = _293 >= 16.0;
        float _299 = _217 * _281;
        float _301 = _211 * _281;
        float _303 = -_217;
        float _305 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[41].z, _303);
        float _307 = -_211;
        float _309 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[41].z, _307);
        float _311 = _277;
        float _313 = _279;
        int _316 = as_type<int>(_309);
        if (_297)
        {
            float _318 = _277 * 0.0625;
            _311 = _318;
        }
        float _320 = _311;
        if (_297)
        {
            float _322 = _279 * 0.0625;
            _313 = _322;
        }
        float _324 = _313;
        float _326 = fma(_305, _305, _295);
        float _328 = abs(_320);
        bool _330 = _328 != 0.0;
        bool _332 = isnan(_328);
        bool _334 = _330 || _332;
        bool _336 = isnan(0.0);
        bool _338 = _334 || _336;
        float _340 = fma(_309, _309, _326);
        float _342 = abs(_324);
        bool _344 = _342 == 0.0;
        float _346 = abs(_324);
        bool _348 = _346 == 0.0;
        bool _350 = !_338;
        bool _352 = _348 && _350;
        float _354 = sqrt(_340);
        bool _356 = false;
        if (_352)
        {
            bool _358 = as_type<int>(_324) >= 0;
            _356 = _358;
        }
        bool _360 = _356;
        int _362 = _360 ? (-1) : 0;
        if (_352)
        {
            int _364 = _360 ? 0 : 1078530011;
            _316 = _364;
        }
        int _366 = _316;
        int _368 = _366;
        if (_352)
        {
            int _370 = int(0x80000000) & as_type<int>(_320);
            int _372 = _366 | _370;
            _368 = _372;
        }
        int _374 = _368;
        bool _376 = !_338;
        bool _378 = _376 && _344;
        int _380 = _374;
        float _382 = as_type<float>(_374);
        if (!_378)
        {
            float _384 = abs(_320);
            bool _386 = _384 != as_type<float>(0x7f800000u /* inf */);
            bool _388 = isnan(_384);
            bool _390 = _386 || _388;
            bool _392 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _394 = _390 || _392;
            float _396 = abs(_324);
            bool _398 = _396 == as_type<float>(0x7f800000u /* inf */);
            float _400 = abs(_324);
            bool _402 = _400 == as_type<float>(0x7f800000u /* inf */);
            bool _404 = !_394;
            bool _406 = _402 && _404;
            if (_406)
            {
                bool _408 = as_type<int>(_324) >= 0;
                _362 = _408 ? (-1) : 0;
            }
            int _410 = _362;
            if (_406)
            {
                _380 = 1075235812;
            }
            int _412 = _380;
            int _414 = _412;
            if (_406)
            {
                int _416 = ~_410;
                int _418 = (_416 != 0) ? _412 : 1061752795;
                _414 = _418;
            }
            int _420 = _414;
            float _422 = as_type<float>(_420);
            if (_406)
            {
                int _424 = int(0x80000000) & as_type<int>(_320);
                int _426 = _420 | _424;
                _422 = as_type<float>(_426);
            }
            float _428 = _422;
            bool _430 = !_394;
            bool _432 = _430 && _398;
            _382 = _428;
            if (!_432)
            {
                float _434 = abs(_320);
                float _436 = abs(_324);
                float _438 = precise::max(_434, _436);
                float _440 = abs(_320);
                float _442 = abs(_324);
                float _444 = precise::min(_440, _442);
                float _446 = 1.0 / _438;
                float _448 = abs(_320);
                float _450 = abs(_324);
                bool _452 = _448 > _450;
                bool _454 = as_type<int>(_324) >= 0;
                float _456 = _444 * _446;
                float _458 = abs(_320);
                float _460 = abs(_324);
                float _462 = _458 + _460;
                int _464 = as_type<int>(_320) & int(0x80000000);
                float _466 = _456 * _456;
                bool _468 = _462 > as_type<float>(0x7f800000u /* inf */);
                bool _470 = isnan(_462);
                bool _472 = _468 || _470;
                bool _474 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _476 = _472 || _474;
                float _478 = _466 + 11.33538818359375;
                float _480 = fma(_466, _478, 28.84246826171875);
                float _482 = fma(_466, _480, 19.6966705322265625);
                float _484 = fma(_466, -0.82336294651031494140625, -5.674867153167724609375);
                float _486 = fma(_466, _484, -6.565555095672607421875);
                float _488 = 1.0 / _482;
                float _490 = _466 * _486;
                float _492 = _456 * _490;
                float _494 = fma(_492, _488, _456);
                float _496 = _494;
                _382 = _462;
                if (_452)
                {
                    float _498 = -_494;
                    float _500 = _498 + 1.57079637050628662109375;
                    _496 = _500;
                }
                float _502 = _496;
                int _504 = as_type<int>(_502);
                if (!_454)
                {
                    float _506 = -_502;
                    float _508 = _506 + 3.1415927410125732421875;
                    _504 = as_type<int>(_508);
                }
                int _510 = _504;
                if (!_476)
                {
                    int _512 = _464 | _510;
                    _382 = as_type<float>(_512);
                }
            }
        }
        float _514 = _382;
        float _516 = fma(_514, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _518 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _520 = _354 + _518;
        float _522 = fma(_299, _516, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _524 = fma(_301, _516, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _269 = _522;
        _271 = _524;
        _273 = _520;
    }
    float _526 = _269;
    float _528 = _271;
    float _530 = _273;
    float _532 = fma(_526, 6.2500002968590706586837768554688e-05, 0.5);
    float _534 = fma(_528, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1855 = float2(_532, _534);
    float _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1855, float2(0.0), isnan(_1855))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1855, float2(0.0), isnan(_1855))).x;
    float _538 = _263 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _540 = _530 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _542 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].x, _538);
    float _544 = fma(_526, (*spvDescriptorSet0.fp_c5)._m0[101].x, _540);
    float _546 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].z, _542);
    float _548 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[101].z, _544);
    float _550 = -_546;
    float _552 = fma(_550, _546, 1.0);
    float _554 = -_546;
    float _556 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[35].z, _265);
    float _558 = _530 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _560 = _548 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _562 = _552 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _564 = -_546;
    float _566 = fma(_564, (*spvDescriptorSet0.fp_c3)._m0[35].y, _263);
    float _568 = fma(_526, (*spvDescriptorSet0.fp_c5)._m0[102].x, _558);
    float _570 = -_546;
    float _572 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[35].x, _261);
    float _574 = fma(_556, _562, _147);
    float _576 = fma(_566, _562, _149);
    float _578 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[102].z, _568);
    float _580 = fma(_572, _562, _151);
    float _582 = -_574;
    bool _584 = _582 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _586 = float(_584);
    float _588 = _578 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _590 = -_574;
    bool _592 = _590 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _594 = float(_592);
    float _596 = _586 + _594;
    float _598 = trunc(_560);
    int _600 = int(_598);
    float _602 = precise::min(_596, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _604 = trunc(_588);
    int _606 = int(_604);
    float _608 = trunc(_602);
    int _610 = int(_608);
    int _612 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _614 = _600 + _612;
    int _616 = _614 + 1;
    bool _618 = _616 >= 0;
    int _620 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _622 = _606 + _620;
    int _624 = _622 + 1;
    bool _626 = _616 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _628 = !_618;
    bool _630 = _626 || _628;
    bool _632 = _624 < 0;
    bool _634 = _632 || _630;
    int _636 = _610 << 6;
    bool _638 = _624 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _640 = _638 || _634;
    int _642 = _636 + 48;
    uint _645 = uint(int(uint(_642) >> uint(2)));
    uint _647 = uint(int(uint(int(_645)) >> uint(2)));
    int _649 = int(_645) & 3;
    float _651 = (*spvDescriptorSet0.fp_c3)._m0[int(_647)][_649];
    int _653 = int(_645) + 1;
    uint _655 = uint(int(uint(_653) >> uint(2)));
    int _657 = _653 & 3;
    float _659 = (*spvDescriptorSet0.fp_c3)._m0[int(_655)][_657];
    int _661 = _636 + 56;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    uint _665 = uint(int(uint(int(_663)) >> uint(2)));
    int _667 = int(_663) & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    int _671 = int(_663) + 1;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    int _675 = _671 & 3;
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[int(_673)][_675];
    int _679 = _616;
    int _681 = _624;
    float _683 = _588;
    if (!_640)
    {
        int _685 = _624 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _687 = _685 + _616;
        _679 = _687;
    }
    int _689 = _679;
    int _691 = _636 + 16;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    int _701 = int(_693) + 1;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    int _705 = _701 & 3;
    float _707 = (*spvDescriptorSet0.fp_c3)._m0[int(_703)][_705];
    int _709 = 0;
    if (!_640)
    {
        int _711 = _689 << 2;
        _709 = _711;
    }
    int _713 = _709;
    int _715 = _713;
    if (!_640)
    {
        int _717 = _689 >> 2;
        _681 = _717;
    }
    int _719 = _681;
    int _721 = _719;
    if (!_640)
    {
        int _723 = 12 & _713;
        _715 = _723;
    }
    int _725 = _715;
    uint _727 = uint(int(uint(_636) >> uint(2)));
    uint _729 = uint(int(uint(int(_727)) >> uint(2)));
    int _731 = int(_727) & 3;
    float _733 = (*spvDescriptorSet0.fp_c3)._m0[int(_729)][_731];
    int _735 = int(_727) + 1;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    int _739 = _735 & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    if (!_640)
    {
        int _743 = _719 << 4;
        int _745 = _743 + _725;
        _721 = _745;
    }
    int _747 = _721;
    int _749 = _636 + 32;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    uint _753 = uint(int(uint(int(_751)) >> uint(2)));
    int _755 = int(_751) & 3;
    float _757 = (*spvDescriptorSet0.fp_c3)._m0[int(_753)][_755];
    int _759 = int(_751) + 1;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    int _763 = _759 & 3;
    float _765 = (*spvDescriptorSet0.fp_c3)._m0[int(_761)][_763];
    int _767 = _636 + 8;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    uint _771 = uint(int(uint(int(_769)) >> uint(2)));
    int _773 = int(_769) & 3;
    float _775 = (*spvDescriptorSet0.fp_c3)._m0[int(_771)][_773];
    int _777 = int(_769) + 1;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    int _781 = _777 & 3;
    float _783 = (*spvDescriptorSet0.fp_c3)._m0[int(_779)][_781];
    int _785 = _636 + 24;
    uint _787 = uint(int(uint(_785) >> uint(2)));
    uint _789 = uint(int(uint(int(_787)) >> uint(2)));
    int _791 = int(_787) & 3;
    float _793 = (*spvDescriptorSet0.fp_c3)._m0[int(_789)][_791];
    int _795 = int(_787) + 1;
    uint _797 = uint(int(uint(_795) >> uint(2)));
    int _799 = _795 & 3;
    float _801 = (*spvDescriptorSet0.fp_c3)._m0[int(_797)][_799];
    float _803 = _576 * _659;
    float _805 = _659;
    if (!_640)
    {
        float _807 = floor(_588);
        _805 = _807;
    }
    float _809 = _805;
    float _811 = fma(_580, _651, _803);
    float _813 = 0.0;
    if (!_640)
    {
        uint _815 = uint(int(uint(_747) >> uint(2)));
        uint _817 = uint(int(uint(int(_815)) >> uint(2)));
        int _819 = int(_815) & 3;
        float _821 = (*spvDescriptorSet0.fp_c5)._m0[int(_817)][_819];
        _813 = _821;
    }
    float _823 = _813;
    float _825 = fma(_574, _669, _811);
    float _827 = _669;
    if (!_640)
    {
        float _829 = floor(_560);
        _827 = _829;
    }
    float _831 = _827;
    float _833 = _825 + _677;
    int _835 = _636 + 40;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    uint _839 = uint(int(uint(int(_837)) >> uint(2)));
    int _841 = int(_837) & 3;
    float _843 = (*spvDescriptorSet0.fp_c3)._m0[int(_839)][_841];
    int _845 = int(_837) + 1;
    uint _847 = uint(int(uint(_845) >> uint(2)));
    int _849 = _845 & 3;
    float _851 = (*spvDescriptorSet0.fp_c3)._m0[int(_847)][_849];
    float _853 = _576 * _707;
    if (!_640)
    {
        float _855 = -_809;
        float _857 = _588 + _855;
        _683 = _857;
    }
    float _859 = _683;
    float _861 = fma(_580, _699, _853);
    float _863 = 1.0 / _833;
    float _865 = _576 * _741;
    float _867 = _741;
    if (!_640)
    {
        float _869 = -_831;
        float _871 = _560 + _869;
        _867 = _871;
    }
    float _873 = _867;
    float _875 = fma(_580, _733, _865);
    float _877 = _576 * _765;
    float _879 = fma(_580, _757, _877);
    float _881 = fma(_574, _775, _875);
    float _883 = _881 + _783;
    float _885 = rint(_602);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    uint _891 = clamp(_889, 0u, 65535u);
    float _893 = fma(_574, _793, _861);
    float _895 = fma(_526, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _897 = fma(_528, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _899 = _883 * _863;
    float _901 = _893 + _801;
    float _903 = _883;
    if (!_640)
    {
        float _905 = rint(_823);
        float _907 = precise::max(_905, 0.0);
        uint _909 = uint(_907);
        uint _911 = clamp(_909, 0u, 65535u);
        _903 = as_type<float>(_911);
    }
    float _913 = _903;
    float2 _2496 = float2(_895, _897);
    float _915 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2496, float2(0.0), isnan(_2496))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2496, float2(0.0), isnan(_2496))).x;
    float _917 = _901 * _863;
    float _919 = fma(_574, _843, _879);
    float _921 = _919 + _851;
    float _923 = _921 * _863;
    float _925 = precise::clamp(_923, 0.0, 1.0);
    float2 _2519 = float2(_532, _534);
    float _927 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2519, float2(0.0), isnan(_2519)), level(_536)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2519, float2(0.0), isnan(_2519)), level(_536)).x;
    float2 _2528 = float2(_85, _87);
    float _929 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2528, float2(0.0), isnan(_2528))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2528, float2(0.0), isnan(_2528))).x;
    float3 _2540 = float3(_899, _917, float(int(_891)));
    float3 _2544 = select(_2540, float3(0.0), isnan(_2540));
    float _931 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2544.xy, uint(rint(_2544.z)), _925);
    float _933 = _913;
    if (!_640)
    {
        float3 _2557 = float3(_873, _859, float(as_type<int>(_913)));
        float3 _2559 = select(_2557, float3(0.0), isnan(_2557));
        float _935 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2559.xy, uint(rint(_2559.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2559.xy, uint(rint(_2559.z)), level(0.0)).x;
        _933 = _935;
    }
    float _937 = _933;
    float _939 = abs(_147);
    float _941 = log2(_939);
    float _943 = _941 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _945 = exp2(_943);
    float _947 = fma(_945, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _949 = precise::clamp(_947, 0.0, 1.0);
    float _951 = fma(_949, -2.0, 3.0);
    float _953 = _949 * _949;
    float _955 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _957 = _953 * _951;
    float _959 = precise::max(0.0, _955);
    float _961 = -_147;
    float _963 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _965 = _961 + _963;
    float _967 = -_957;
    float _969 = _967 + 1.0;
    float _971 = fma(_969, (*spvDescriptorSet0.fp_c3)._m0[44].w, _957);
    bool _973 = _147 >= (-8000.0);
    bool _975 = isnan(_147);
    bool _977 = _973 || _975;
    bool _979 = isnan(-8000.0);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = _971 * _959;
    float _987 = _983 * _985;
    float _989 = _987 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _991 = -_915;
    float _993 = _991 + 1.0;
    float _995 = _993 * _989;
    float _997 = precise::clamp(_995, 0.0, 1.0);
    float _999 = -_997;
    float _1001 = fma(_999, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1003 = -_147;
    float _1005 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1007 = _1003 + _1005;
    float _1009 = abs(_927);
    float _1011 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1013 = -_1011;
    float _1015 = fma(_983, _1013, 1.0);
    float _1017 = _983;
    if (_640)
    {
        _1017 = 1.0;
    }
    float _1019 = _1017;
    float _1021 = _1019;
    if (!_640)
    {
        int _1023 = _689 << 4;
        int _1025 = _1023 + 1648;
        int _1027 = _747 + 8048;
        uint _1029 = uint(int(uint(_1027) >> uint(2)));
        uint _1031 = uint(int(uint(int(_1029)) >> uint(2)));
        int _1033 = int(_1029) & 3;
        float _1035 = (*spvDescriptorSet0.fp_c5)._m0[int(_1031)][_1033];
        uint _1037 = uint(int(uint(_1025) >> uint(2)));
        uint _1039 = uint(int(uint(int(_1037)) >> uint(2)));
        int _1041 = int(_1037) & 3;
        float _1043 = (*spvDescriptorSet0.fp_c5)._m0[int(_1039)][_1041];
        int _1045 = int(_1037) + 1;
        uint _1047 = uint(int(uint(_1045) >> uint(2)));
        int _1049 = _1045 & 3;
        float _1051 = (*spvDescriptorSet0.fp_c5)._m0[int(_1047)][_1049];
        int _1053 = _1025 + 8;
        uint _1055 = uint(int(uint(_1053) >> uint(2)));
        uint _1057 = uint(int(uint(int(_1055)) >> uint(2)));
        int _1059 = int(_1055) & 3;
        float _1061 = (*spvDescriptorSet0.fp_c5)._m0[int(_1057)][_1059];
        int _1063 = int(_1055) + 1;
        uint _1065 = uint(int(uint(_1063) >> uint(2)));
        int _1067 = _1063 & 3;
        float _1069 = (*spvDescriptorSet0.fp_c5)._m0[int(_1065)][_1067];
        float _1071 = 1.0 / _1035;
        float _1073 = _530 * _1051;
        float _1075 = fma(_526, _1043, _1073);
        float _1077 = fma(_528, _1061, _1075);
        float _1079 = _1077 + _1069;
        float _1081 = precise::clamp(_1079, 0.0, 1.0);
        float _1083 = -_1081;
        float _1085 = _1083 + _937;
        float _1087 = _1035 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1089 = fma(_1071, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1085);
        float _1091 = _1087 * _1089;
        float _1093 = exp2(_1091);
        float _1095 = 0.0 + _1093;
        float _1097 = precise::clamp(_1095, 0.0, 1.0);
        _1021 = _1097;
    }
    float _1099 = _1021;
    float _1101 = precise::min(_1099, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1103 = _1007 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1105 = precise::clamp(_1103, 0.0, 1.0);
    float _1107 = _965 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1109 = precise::clamp(_1107, 0.0, 1.0);
    float _1111 = -_931;
    float _1113 = _1111 + 1.0;
    float _1115 = precise::min(_1015, 1.0);
    float _1117 = -_1101;
    float _1119 = _1117 + 1.0;
    float _1121 = fma(_1105, _1113, _931);
    float _1123 = precise::min(_1115, _1001);
    float _1125 = fma(_1109, _1119, _1101);
    out.m_60.x = _1121;
    out.m_60.y = _1125;
    out.m_60.z = 1.0;
    out.m_60.w = _1123;
    out.m_62.x = _929;
    out.m_62.y = 0.5;
    out.m_62.z = 0.5;
    out.m_62.w = 1.0;
    return out;
}

