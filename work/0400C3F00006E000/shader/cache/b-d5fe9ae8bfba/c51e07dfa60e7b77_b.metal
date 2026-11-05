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
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
    float4 m_54 [[color(1)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_43.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_43.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float _81 = _77 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1082 = float2(_77, _79);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1082, float2(0.0), isnan(_1082))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1082, float2(0.0), isnan(_1082))).x;
    float _85 = _79 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1097 = float2(_81, _79);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1097, float2(0.0), isnan(_1097))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1097, float2(0.0), isnan(_1097))).x;
    float2 _1105 = float2(_77, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1105, float2(0.0), isnan(_1105))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1105, float2(0.0), isnan(_1105))).x;
    float _91 = in.m_45.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_45.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_47.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_47.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_49.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_49.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _75 * _95;
    float _129 = _75 * _101;
    float _131 = _75 * _107;
    float _133 = _75 * _113;
    float _135 = -_83;
    float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _139 = -_87;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _143 = 1.0 / _137;
    float _145 = -_89;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _149 = 1.0 / _141;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _153 = _143 * _151;
    float _155 = 1.0 / _147;
    float _157 = _75 * _119;
    float _159 = _75 * _125;
    float _161 = _153 * _127;
    float _163 = _153 * _129;
    float _165 = _161 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _169 = _149 * _167;
    float _171 = _161 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _173 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[32].x, _165);
    float _175 = -_163;
    float _177 = fma(_169, _133, _175);
    float _179 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[30].x, _171);
    float _181 = -_153;
    float _183 = _181 + _169;
    float _185 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _173);
    float _187 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _189 = _155 * _187;
    float _191 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _179);
    float _193 = -_161;
    float _195 = fma(_169, _131, _193);
    float _197 = _185 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _199 = -_163;
    float _201 = fma(_189, _157, _199);
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _205 = -_161;
    float _207 = fma(_189, _159, _205);
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _211 = _197 + _209;
    float _213 = -_153;
    float _215 = _213 + _189;
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _219 = _203 + _217;
    float _221 = _183 * _201;
    float _223 = _211 * _211;
    float _225 = _195 * _215;
    float _227 = -_221;
    float _229 = fma(_177, _215, _227);
    float _231 = fma(_219, _219, _223);
    float _233 = _177 * _207;
    float _235 = -_225;
    float _237 = fma(_183, _207, _235);
    float _239 = _229 * _229;
    float _241 = sqrt(_231);
    float _243 = -_233;
    float _245 = fma(_195, _201, _243);
    float _247 = _161 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _249 = fma(_237, _237, _239);
    float _251 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[31].x, _247);
    float _253 = fma(_245, _245, _249);
    float _255 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _251);
    float _257 = rsqrt(_253);
    float _259 = _255 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _263 = _241 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _265 = _237 * _257;
    float _267 = _229 * _257;
    float _269 = _245 * _257;
    bool _271 = !_263;
    float _273 = _259;
    float _275 = _203;
    float _277 = _197;
    if (!_271)
    {
        float _279 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _281 = _241 + _279;
        float _283 = _259 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _285 = rsqrt(_231);
        float _287 = -_259;
        float _289 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = _287 + _289;
        float _293 = abs(_283);
        float _295 = abs(_281);
        float _297 = precise::max(_293, _295);
        float _299 = _291 * _291;
        bool _301 = _297 >= 16.0;
        float _303 = _219 * _285;
        float _305 = _211 * _285;
        float _307 = -_219;
        float _309 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[41].z, _307);
        float _311 = -_211;
        float _313 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[41].z, _311);
        float _315 = _281;
        float _317 = _283;
        int _320 = as_type<int>(_313);
        if (_301)
        {
            float _322 = _281 * 0.0625;
            _315 = _322;
        }
        float _324 = _315;
        if (_301)
        {
            float _326 = _283 * 0.0625;
            _317 = _326;
        }
        float _328 = _317;
        float _330 = fma(_309, _309, _299);
        float _332 = abs(_324);
        bool _334 = _332 != 0.0;
        bool _336 = isnan(_332);
        bool _338 = _334 || _336;
        bool _340 = isnan(0.0);
        bool _342 = _338 || _340;
        float _344 = fma(_313, _313, _330);
        float _346 = abs(_328);
        bool _348 = _346 == 0.0;
        float _350 = abs(_328);
        bool _352 = _350 == 0.0;
        bool _354 = !_342;
        bool _356 = _352 && _354;
        float _358 = sqrt(_344);
        bool _360 = false;
        if (_356)
        {
            bool _362 = as_type<int>(_328) >= 0;
            _360 = _362;
        }
        bool _364 = _360;
        int _366 = _364 ? (-1) : 0;
        if (_356)
        {
            int _368 = _364 ? 0 : 1078530011;
            _320 = _368;
        }
        int _370 = _320;
        int _372 = _370;
        if (_356)
        {
            int _374 = int(0x80000000) & as_type<int>(_324);
            int _376 = _370 | _374;
            _372 = _376;
        }
        int _378 = _372;
        bool _380 = !_342;
        bool _382 = _380 && _348;
        int _384 = _378;
        float _386 = as_type<float>(_378);
        if (!_382)
        {
            float _388 = abs(_324);
            bool _390 = _388 != as_type<float>(0x7f800000u /* inf */);
            bool _392 = isnan(_388);
            bool _394 = _390 || _392;
            bool _396 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _398 = _394 || _396;
            float _400 = abs(_328);
            bool _402 = _400 == as_type<float>(0x7f800000u /* inf */);
            float _404 = abs(_328);
            bool _406 = _404 == as_type<float>(0x7f800000u /* inf */);
            bool _408 = !_398;
            bool _410 = _406 && _408;
            if (_410)
            {
                bool _412 = as_type<int>(_328) >= 0;
                _366 = _412 ? (-1) : 0;
            }
            int _414 = _366;
            if (_410)
            {
                _384 = 1075235812;
            }
            int _416 = _384;
            int _418 = _416;
            if (_410)
            {
                int _420 = ~_414;
                int _422 = (_420 != 0) ? _416 : 1061752795;
                _418 = _422;
            }
            int _424 = _418;
            float _426 = as_type<float>(_424);
            if (_410)
            {
                int _428 = int(0x80000000) & as_type<int>(_324);
                int _430 = _424 | _428;
                _426 = as_type<float>(_430);
            }
            float _432 = _426;
            bool _434 = !_398;
            bool _436 = _434 && _402;
            _386 = _432;
            if (!_436)
            {
                float _438 = abs(_324);
                float _440 = abs(_328);
                float _442 = precise::max(_438, _440);
                float _444 = abs(_324);
                float _446 = abs(_328);
                float _448 = precise::min(_444, _446);
                float _450 = 1.0 / _442;
                float _452 = abs(_324);
                float _454 = abs(_328);
                bool _456 = _452 > _454;
                bool _458 = as_type<int>(_328) >= 0;
                float _460 = _448 * _450;
                float _462 = abs(_324);
                float _464 = abs(_328);
                float _466 = _462 + _464;
                int _468 = as_type<int>(_324) & int(0x80000000);
                float _470 = _460 * _460;
                bool _472 = _466 > as_type<float>(0x7f800000u /* inf */);
                bool _474 = isnan(_466);
                bool _476 = _472 || _474;
                bool _478 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _480 = _476 || _478;
                float _482 = _470 + 11.33538818359375;
                float _484 = fma(_470, _482, 28.84246826171875);
                float _486 = fma(_470, _484, 19.6966705322265625);
                float _488 = fma(_470, -0.82336294651031494140625, -5.674867153167724609375);
                float _490 = fma(_470, _488, -6.565555095672607421875);
                float _492 = 1.0 / _486;
                float _494 = _470 * _490;
                float _496 = _460 * _494;
                float _498 = fma(_496, _492, _460);
                float _500 = _498;
                _386 = _466;
                if (_456)
                {
                    float _502 = -_498;
                    float _504 = _502 + 1.57079637050628662109375;
                    _500 = _504;
                }
                float _506 = _500;
                int _508 = as_type<int>(_506);
                if (!_458)
                {
                    float _510 = -_506;
                    float _512 = _510 + 3.1415927410125732421875;
                    _508 = as_type<int>(_512);
                }
                int _514 = _508;
                if (!_480)
                {
                    int _516 = _468 | _514;
                    _386 = as_type<float>(_516);
                }
            }
        }
        float _518 = _386;
        float _520 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _522 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _524 = _358 + _522;
        float _526 = fma(_303, _520, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _528 = fma(_305, _520, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _273 = _524;
        _275 = _526;
        _277 = _528;
    }
    float _530 = _273;
    float _532 = _275;
    float _534 = _277;
    float _536 = _267 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _538 = _530 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _540 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].x, _536);
    float _542 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].x, _538);
    float _544 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[35].z, _540);
    float _546 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].z, _542);
    float _548 = -_544;
    float _550 = fma(_548, _544, 1.0);
    float _552 = -_544;
    float _554 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[35].z, _269);
    float _556 = _530 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _558 = _546 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _560 = _550 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _562 = -_544;
    float _564 = fma(_562, (*spvDescriptorSet0.fp_c3)._m0[35].y, _267);
    float _566 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].x, _556);
    float _568 = -_544;
    float _570 = fma(_568, (*spvDescriptorSet0.fp_c3)._m0[35].x, _265);
    float _572 = fma(_554, _560, _153);
    float _574 = fma(_564, _560, _161);
    float _576 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].z, _566);
    float _578 = fma(_570, _560, _163);
    float _580 = -_572;
    bool _582 = _580 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _584 = float(_582);
    float _586 = _576 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _588 = -_572;
    bool _590 = _588 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _592 = float(_590);
    float _594 = trunc(_586);
    int _596 = int(_594);
    float _598 = _584 + _592;
    float _600 = precise::min(_598, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _602 = trunc(_558);
    int _604 = int(_602);
    float _606 = trunc(_600);
    int _608 = int(_606);
    int _610 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _612 = _596 + _610;
    int _614 = _612 + 1;
    int _616 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _618 = _604 + _616;
    int _620 = _618 + 1;
    bool _622 = _620 >= 0;
    bool _624 = _620 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _626 = !_622;
    bool _628 = _624 || _626;
    int _630 = _608 << 6;
    bool _632 = _614 < 0;
    bool _634 = _632 || _628;
    int _636 = _630 + 48;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.fp_c3)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    bool _655 = _614 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _657 = _655 || _634;
    int _659 = _630 + 56;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    uint _663 = uint(int(uint(int(_661)) >> uint(2)));
    int _665 = int(_661) & 3;
    float _667 = (*spvDescriptorSet0.fp_c3)._m0[int(_663)][_665];
    int _669 = int(_661) + 1;
    uint _671 = uint(int(uint(_669) >> uint(2)));
    int _673 = _669 & 3;
    float _675 = (*spvDescriptorSet0.fp_c3)._m0[int(_671)][_673];
    int _677 = _620;
    float _679 = _558;
    if (!_657)
    {
        int _681 = _614 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _683 = _681 + _620;
        _677 = _683;
    }
    int _685 = _677;
    uint _687 = uint(int(uint(_630) >> uint(2)));
    uint _689 = uint(int(uint(int(_687)) >> uint(2)));
    int _691 = int(_687) & 3;
    float _693 = (*spvDescriptorSet0.fp_c3)._m0[int(_689)][_691];
    int _695 = int(_687) + 1;
    uint _697 = uint(int(uint(_695) >> uint(2)));
    int _699 = _695 & 3;
    float _701 = (*spvDescriptorSet0.fp_c3)._m0[int(_697)][_699];
    float _703 = _163;
    if (!_657)
    {
        float _705 = floor(_558);
        _703 = _705;
    }
    float _707 = _703;
    int _709 = 0;
    if (!_657)
    {
        int _711 = _685 << 2;
        _709 = _711;
    }
    int _713 = _709;
    int _715 = 0;
    int _717 = _713;
    if (!_657)
    {
        int _719 = _685 >> 2;
        _715 = _719;
    }
    int _721 = _715;
    int _723 = _721;
    if (!_657)
    {
        int _725 = 12 & _713;
        _717 = _725;
    }
    int _727 = _717;
    int _729 = _630 + 16;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    uint _733 = uint(int(uint(int(_731)) >> uint(2)));
    int _735 = int(_731) & 3;
    float _737 = (*spvDescriptorSet0.fp_c3)._m0[int(_733)][_735];
    int _739 = int(_731) + 1;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    int _743 = _739 & 3;
    float _745 = (*spvDescriptorSet0.fp_c3)._m0[int(_741)][_743];
    float _747 = _570;
    if (!_657)
    {
        float _749 = floor(_586);
        _747 = _749;
    }
    float _751 = _747;
    if (!_657)
    {
        int _753 = _721 << 4;
        int _755 = _753 + _727;
        _723 = _755;
    }
    int _757 = _723;
    int _759 = _630 + 32;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    uint _763 = uint(int(uint(int(_761)) >> uint(2)));
    int _765 = int(_761) & 3;
    float _767 = (*spvDescriptorSet0.fp_c3)._m0[int(_763)][_765];
    int _769 = int(_761) + 1;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    int _773 = _769 & 3;
    float _775 = (*spvDescriptorSet0.fp_c3)._m0[int(_771)][_773];
    if (!_657)
    {
        float _777 = -_707;
        float _779 = _558 + _777;
        _679 = _779;
    }
    float _781 = _679;
    float _783 = as_type<float>(_727);
    if (!_657)
    {
        uint _785 = uint(int(uint(_757) >> uint(2)));
        uint _787 = uint(int(uint(int(_785)) >> uint(2)));
        int _789 = int(_785) & 3;
        float _791 = (*spvDescriptorSet0.fp_c5)._m0[int(_787)][_789];
        _783 = _791;
    }
    float _793 = _783;
    float _795 = _751;
    if (!_657)
    {
        float _797 = -_751;
        float _799 = _586 + _797;
        _795 = _799;
    }
    float _801 = _795;
    float _803 = _574 * _653;
    int _805 = _630 + 8;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    uint _809 = uint(int(uint(int(_807)) >> uint(2)));
    int _811 = int(_807) & 3;
    float _813 = (*spvDescriptorSet0.fp_c3)._m0[int(_809)][_811];
    int _815 = int(_807) + 1;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    int _819 = _815 & 3;
    float _821 = (*spvDescriptorSet0.fp_c3)._m0[int(_817)][_819];
    float _823 = fma(_578, _645, _803);
    float _825 = fma(_572, _667, _823);
    int _827 = _630 + 24;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    uint _831 = uint(int(uint(int(_829)) >> uint(2)));
    int _833 = int(_829) & 3;
    float _835 = (*spvDescriptorSet0.fp_c3)._m0[int(_831)][_833];
    int _837 = int(_829) + 1;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    int _841 = _837 & 3;
    float _843 = (*spvDescriptorSet0.fp_c3)._m0[int(_839)][_841];
    float _845 = _825 + _675;
    float _847 = _574 * _701;
    int _849 = _630 + 40;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    uint _853 = uint(int(uint(int(_851)) >> uint(2)));
    int _855 = int(_851) & 3;
    float _857 = (*spvDescriptorSet0.fp_c3)._m0[int(_853)][_855];
    int _859 = int(_851) + 1;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    int _863 = _859 & 3;
    float _865 = (*spvDescriptorSet0.fp_c3)._m0[int(_861)][_863];
    float _867 = 1.0 / _845;
    float _869 = fma(_578, _693, _847);
    float _871 = _574 * _745;
    float _873 = rint(_600);
    float _875 = precise::max(_873, 0.0);
    uint _877 = uint(_875);
    uint _879 = clamp(_877, 0u, 65535u);
    float _881 = fma(_578, _737, _871);
    float _883 = _574 * _775;
    float _885 = fma(_578, _767, _883);
    float _887 = _793;
    if (!_657)
    {
        float _889 = rint(_793);
        float _891 = precise::max(_889, 0.0);
        uint _893 = uint(_891);
        uint _895 = clamp(_893, 0u, 65535u);
        _887 = as_type<float>(_895);
    }
    float _897 = _887;
    float _899 = fma(_572, _813, _869);
    float _901 = _899 + _821;
    float _903 = fma(_572, _835, _881);
    float _905 = _901 * _867;
    float _907 = _903 + _843;
    float _909 = fma(_572, _857, _885);
    float _911 = _909 + _865;
    float _913 = _907 * _867;
    float _915 = _911 * _867;
    float _917 = precise::clamp(_915, 0.0, 1.0);
    float3 _2419 = float3(_905, _913, float(int(_879)));
    float3 _2423 = select(_2419, float3(0.0), isnan(_2419));
    float _919 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2423.xy, uint(rint(_2423.z)), _917);
    float _921 = _781;
    float _923 = _867;
    if (!_657)
    {
        float3 _2437 = float3(_781, _801, float(as_type<int>(_897)));
        float3 _2439 = select(_2437, float3(0.0), isnan(_2437));
        float _925 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2439.xy, uint(rint(_2439.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2439.xy, uint(rint(_2439.z)), level(0.0)).x;
        _921 = _925;
    }
    float _927 = _921;
    float _929 = -_153;
    float _931 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _933 = _929 + _931;
    if (_657)
    {
        _923 = 1.0;
    }
    float _935 = _923;
    float _937 = _935;
    if (!_657)
    {
        int _939 = _685 << 4;
        int _941 = _939 + 1648;
        int _943 = _757 + 8048;
        uint _945 = uint(int(uint(_943) >> uint(2)));
        uint _947 = uint(int(uint(int(_945)) >> uint(2)));
        int _949 = int(_945) & 3;
        float _951 = (*spvDescriptorSet0.fp_c5)._m0[int(_947)][_949];
        uint _953 = uint(int(uint(_941) >> uint(2)));
        uint _955 = uint(int(uint(int(_953)) >> uint(2)));
        int _957 = int(_953) & 3;
        float _959 = (*spvDescriptorSet0.fp_c5)._m0[int(_955)][_957];
        int _961 = int(_953) + 1;
        uint _963 = uint(int(uint(_961) >> uint(2)));
        int _965 = _961 & 3;
        float _967 = (*spvDescriptorSet0.fp_c5)._m0[int(_963)][_965];
        int _969 = _941 + 8;
        uint _971 = uint(int(uint(_969) >> uint(2)));
        uint _973 = uint(int(uint(int(_971)) >> uint(2)));
        int _975 = int(_971) & 3;
        float _977 = (*spvDescriptorSet0.fp_c5)._m0[int(_973)][_975];
        int _979 = int(_971) + 1;
        uint _981 = uint(int(uint(_979) >> uint(2)));
        int _983 = _979 & 3;
        float _985 = (*spvDescriptorSet0.fp_c5)._m0[int(_981)][_983];
        float _987 = _951 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _989 = _530 * _967;
        float _991 = 1.0 / _951;
        float _993 = fma(_532, _959, _989);
        float _995 = fma(_534, _977, _993);
        float _997 = _995 + _985;
        float _999 = precise::clamp(_997, 0.0, 1.0);
        float _1001 = -_999;
        float _1003 = _1001 + _927;
        float _1005 = fma(_991, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1003);
        float _1007 = _987 * _1005;
        float _1009 = exp2(_1007);
        float _1011 = 0.0 + _1009;
        float _1013 = precise::clamp(_1011, 0.0, 1.0);
        _937 = _1013;
    }
    float _1015 = _937;
    float _1017 = precise::min(_1015, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1019 = -_153;
    float _1021 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1023 = _1019 + _1021;
    float _1025 = _933 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = -_919;
    float _1031 = _1029 + 1.0;
    float _1033 = _1023 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1035 = precise::clamp(_1033, 0.0, 1.0);
    float _1037 = -_1017;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_1027, _1031, _919);
    float _1043 = fma(_1035, _1039, _1017);
    out.m_52.x = _1041;
    out.m_52.y = _1043;
    out.m_52.z = 1.0;
    out.m_52.w = 1.0;
    out.m_54.x = 1.0;
    out.m_54.y = 0.5;
    out.m_54.z = 0.5;
    out.m_54.w = 1.0;
    return out;
}

