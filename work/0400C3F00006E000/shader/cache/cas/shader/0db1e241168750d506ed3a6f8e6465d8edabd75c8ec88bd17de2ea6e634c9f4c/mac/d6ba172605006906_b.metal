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
    float2 _1095 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1095, float2(0.0), isnan(_1095))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1095, float2(0.0), isnan(_1095))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1110 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1110, float2(0.0), isnan(_1110))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1110, float2(0.0), isnan(_1110))).x;
    float2 _1118 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1118, float2(0.0), isnan(_1118))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1118, float2(0.0), isnan(_1118))).x;
    float2 _1126 = float2(_81, _83);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1126, float2(0.0), isnan(_1126))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1126, float2(0.0), isnan(_1126))).xy;
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
    float _139 = _79 * _107;
    float _141 = _79 * _113;
    float _143 = _79 * _119;
    float _145 = _79 * _131;
    float _147 = -_87;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _151 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[41].x, _149);
    float _153 = _151 * _139;
    float _155 = _151 * _141;
    float _157 = -_91;
    float _159 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _161 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[41].x, _159);
    float _163 = -_93;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _167 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[41].x, _165);
    float _169 = _153 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _171 = _153 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _173 = _79 * _125;
    float _175 = _79 * _137;
    float _177 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[32].x, _169);
    float _179 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[30].x, _171);
    float _181 = -_155;
    float _183 = fma(_161, _143, _181);
    float _185 = -_151;
    float _187 = _185 + _161;
    float _189 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].z, _177);
    float _191 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].z, _179);
    float _193 = -_153;
    float _195 = fma(_161, _173, _193);
    float _197 = -_155;
    float _199 = fma(_167, _145, _197);
    float _201 = _189 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _205 = -_153;
    float _207 = fma(_167, _175, _205);
    float _209 = -_151;
    float _211 = _209 + _167;
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _215 = _201 + _213;
    float _217 = _187 * _199;
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _221 = _203 + _219;
    float _223 = _195 * _211;
    float _225 = _215 * _215;
    float _227 = -_217;
    float _229 = fma(_183, _211, _227);
    float _231 = _183 * _207;
    float _233 = -_223;
    float _235 = fma(_187, _207, _233);
    float _237 = fma(_221, _221, _225);
    float _239 = _229 * _229;
    float _241 = -_231;
    float _243 = fma(_195, _199, _241);
    float _245 = sqrt(_237);
    float _247 = fma(_235, _235, _239);
    float _249 = _153 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _251 = fma(_243, _243, _247);
    float _253 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[31].x, _249);
    float _255 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].z, _253);
    float _257 = rsqrt(_251);
    float _259 = _255 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _263 = _245 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _265 = _229 * _257;
    float _267 = _235 * _257;
    float _269 = _243 * _257;
    bool _271 = !_263;
    float _273 = _259;
    float _275 = _203;
    float _277 = _201;
    if (!_271)
    {
        float _279 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _281 = _245 + _279;
        float _283 = _259 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _285 = rsqrt(_237);
        float _287 = -_259;
        float _289 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = _287 + _289;
        float _293 = abs(_283);
        float _295 = abs(_281);
        float _297 = precise::max(_293, _295);
        float _299 = _291 * _291;
        bool _301 = _297 >= 16.0;
        float _303 = _221 * _285;
        float _305 = _215 * _285;
        float _307 = -_221;
        float _309 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[41].z, _307);
        float _311 = -_215;
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
    float _536 = _265 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _538 = _530 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _540 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].x, _536);
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
    float _564 = fma(_562, (*spvDescriptorSet0.fp_c3)._m0[35].y, _265);
    float _566 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].x, _556);
    float _568 = -_544;
    float _570 = fma(_568, (*spvDescriptorSet0.fp_c3)._m0[35].x, _267);
    float _572 = fma(_554, _560, _151);
    float _574 = fma(_564, _560, _153);
    float _576 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].z, _566);
    float _578 = fma(_570, _560, _155);
    float _580 = -_572;
    bool _582 = _580 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _584 = float(_582);
    float _586 = _576 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _588 = -_572;
    bool _590 = _588 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _592 = float(_590);
    float _594 = fma(_99, 2.0, -1.0);
    float _596 = fma(_101, 2.0, -1.0);
    float _598 = _584 + _592;
    float _600 = _594 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _602 = trunc(_558);
    int _604 = int(_602);
    float _606 = _596 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _608 = precise::min(_598, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _610 = fma(_600, 2.0, _81);
    float _612 = fma(_606, 2.0, _83);
    float _614 = trunc(_586);
    int _616 = int(_614);
    int _618 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _620 = _604 + _618;
    int _622 = _620 + 1;
    float _624 = trunc(_608);
    int _626 = int(_624);
    bool _628 = _622 >= 0;
    int _630 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _632 = _616 + _630;
    int _634 = _632 + 1;
    float _636 = rint(_608);
    float _638 = precise::max(_636, 0.0);
    uint _641 = uint(_638);
    uint _643 = clamp(_641, 0u, 65535u);
    bool _645 = _622 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _647 = !_628;
    bool _649 = _645 || _647;
    bool _651 = _634 < 0;
    bool _653 = _651 || _649;
    int _655 = _626 << 6;
    bool _657 = _634 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _659 = _657 || _653;
    int _661 = _655 + 48;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    uint _665 = uint(int(uint(int(_663)) >> uint(2)));
    int _667 = int(_663) & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    int _671 = int(_663) + 1;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    int _675 = _671 & 3;
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[int(_673)][_675];
    int _679 = _655 + 56;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    uint _683 = uint(int(uint(int(_681)) >> uint(2)));
    int _685 = int(_681) & 3;
    float _687 = (*spvDescriptorSet0.fp_c3)._m0[int(_683)][_685];
    int _689 = int(_681) + 1;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    int _693 = _689 & 3;
    float _695 = (*spvDescriptorSet0.fp_c3)._m0[int(_691)][_693];
    int _697 = _622;
    if (!_659)
    {
        int _699 = _634 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _701 = _699 + _622;
        _697 = _701;
    }
    int _703 = _697;
    uint _705 = uint(int(uint(_655) >> uint(2)));
    uint _707 = uint(int(uint(int(_705)) >> uint(2)));
    int _709 = int(_705) & 3;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[int(_707)][_709];
    int _713 = int(_705) + 1;
    uint _715 = uint(int(uint(_713) >> uint(2)));
    int _717 = _713 & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = 0;
    if (!_659)
    {
        int _723 = _703 << 2;
        _721 = _723;
    }
    int _725 = _721;
    int _727 = 0;
    int _729 = _725;
    if (!_659)
    {
        int _731 = _703 >> 2;
        _727 = _731;
    }
    int _733 = _727;
    int _735 = _733;
    if (!_659)
    {
        int _737 = 12 & _725;
        _729 = _737;
    }
    int _739 = _729;
    int _741 = _655 + 8;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    uint _745 = uint(int(uint(int(_743)) >> uint(2)));
    int _747 = int(_743) & 3;
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[int(_745)][_747];
    int _751 = int(_743) + 1;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    int _755 = _751 & 3;
    float _757 = (*spvDescriptorSet0.fp_c3)._m0[int(_753)][_755];
    if (!_659)
    {
        int _759 = _733 << 4;
        int _761 = _759 + _739;
        _735 = _761;
    }
    int _763 = _735;
    int _765 = _655 + 16;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.fp_c3)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.fp_c3)._m0[int(_777)][_779];
    int _783 = _655 + 32;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    uint _787 = uint(int(uint(int(_785)) >> uint(2)));
    int _789 = int(_785) & 3;
    float _791 = (*spvDescriptorSet0.fp_c3)._m0[int(_787)][_789];
    int _793 = int(_785) + 1;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    int _797 = _793 & 3;
    float _799 = (*spvDescriptorSet0.fp_c3)._m0[int(_795)][_797];
    float _801 = as_type<float>(_739);
    if (!_659)
    {
        uint _803 = uint(int(uint(_763) >> uint(2)));
        uint _805 = uint(int(uint(int(_803)) >> uint(2)));
        int _807 = int(_803) & 3;
        float _809 = (*spvDescriptorSet0.fp_c5)._m0[int(_805)][_807];
        _801 = _809;
    }
    float _811 = _801;
    float _813 = _574 * _677;
    float _815 = _677;
    if (!_659)
    {
        float _817 = floor(_586);
        _815 = _817;
    }
    float _819 = _815;
    float _821 = fma(_578, _669, _813);
    int _823 = _655 + 24;
    uint _825 = uint(int(uint(_823) >> uint(2)));
    uint _827 = uint(int(uint(int(_825)) >> uint(2)));
    int _829 = int(_825) & 3;
    float _831 = (*spvDescriptorSet0.fp_c3)._m0[int(_827)][_829];
    int _833 = int(_825) + 1;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    int _837 = _833 & 3;
    float _839 = (*spvDescriptorSet0.fp_c3)._m0[int(_835)][_837];
    float _841 = fma(_572, _687, _821);
    float _843 = _669;
    if (!_659)
    {
        float _845 = floor(_558);
        _843 = _845;
    }
    float _847 = _843;
    float _849 = _841 + _695;
    int _851 = _655 + 40;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    uint _855 = uint(int(uint(int(_853)) >> uint(2)));
    int _857 = int(_853) & 3;
    float _859 = (*spvDescriptorSet0.fp_c3)._m0[int(_855)][_857];
    int _861 = int(_853) + 1;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    int _865 = _861 & 3;
    float _867 = (*spvDescriptorSet0.fp_c3)._m0[int(_863)][_865];
    float _869 = _574 * _719;
    float _871 = 1.0 / _849;
    float _873 = _819;
    float _875 = _719;
    if (!_659)
    {
        float _877 = -_819;
        float _879 = _586 + _877;
        _873 = _879;
    }
    float _881 = _873;
    float _883 = fma(_578, _711, _869);
    float _885 = fma(_572, _749, _883);
    float _887 = _847;
    if (!_659)
    {
        float _889 = -_847;
        float _891 = _558 + _889;
        _875 = _891;
    }
    float _893 = _875;
    float _895 = _885 + _757;
    float _897 = _574 * _781;
    float _899 = _895 * _871;
    float _901 = fma(_578, _773, _897);
    float _903 = _574 * _799;
    float _905 = fma(_578, _791, _903);
    float _907 = _885;
    if (!_659)
    {
        float _909 = rint(_811);
        float _911 = precise::max(_909, 0.0);
        uint _913 = uint(_911);
        uint _915 = clamp(_913, 0u, 65535u);
        _907 = as_type<float>(_915);
    }
    float _917 = _907;
    float _919 = fma(_572, _831, _901);
    float _921 = _919 + _839;
    float _923 = fma(_572, _859, _905);
    float _925 = _923 + _867;
    float _927 = _921 * _871;
    float _929 = _925 * _871;
    float _931 = precise::clamp(_929, 0.0, 1.0);
    float2 _2449 = float2(_610, _612);
    float _933 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2449, float2(0.0), isnan(_2449))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2449, float2(0.0), isnan(_2449))).x;
    float3 _2461 = float3(_899, _927, float(int(_643)));
    float3 _2465 = select(_2461, float3(0.0), isnan(_2461));
    float _935 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2465.xy, uint(rint(_2465.z)), _931);
    float _937 = _881;
    if (!_659)
    {
        float3 _2478 = float3(_893, _881, float(as_type<int>(_917)));
        float3 _2480 = select(_2478, float3(0.0), isnan(_2478));
        float _939 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2480.xy, uint(rint(_2480.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2480.xy, uint(rint(_2480.z)), level(0.0)).x;
        _937 = _939;
    }
    float _941 = _937;
    if (_659)
    {
        _887 = 1.0;
    }
    float _943 = _887;
    float _945 = _943;
    if (!_659)
    {
        int _947 = _703 << 4;
        int _949 = _947 + 1648;
        int _951 = _763 + 8048;
        uint _953 = uint(int(uint(_951) >> uint(2)));
        uint _955 = uint(int(uint(int(_953)) >> uint(2)));
        int _957 = int(_953) & 3;
        float _959 = (*spvDescriptorSet0.fp_c5)._m0[int(_955)][_957];
        uint _961 = uint(int(uint(_949) >> uint(2)));
        uint _963 = uint(int(uint(int(_961)) >> uint(2)));
        int _965 = int(_961) & 3;
        float _967 = (*spvDescriptorSet0.fp_c5)._m0[int(_963)][_965];
        int _969 = int(_961) + 1;
        uint _971 = uint(int(uint(_969) >> uint(2)));
        int _973 = _969 & 3;
        float _975 = (*spvDescriptorSet0.fp_c5)._m0[int(_971)][_973];
        int _977 = _949 + 8;
        uint _979 = uint(int(uint(_977) >> uint(2)));
        uint _981 = uint(int(uint(int(_979)) >> uint(2)));
        int _983 = int(_979) & 3;
        float _985 = (*spvDescriptorSet0.fp_c5)._m0[int(_981)][_983];
        int _987 = int(_979) + 1;
        uint _989 = uint(int(uint(_987) >> uint(2)));
        int _991 = _987 & 3;
        float _993 = (*spvDescriptorSet0.fp_c5)._m0[int(_989)][_991];
        float _995 = 1.0 / _959;
        float _997 = _959 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _999 = _530 * _975;
        float _1001 = fma(_532, _967, _999);
        float _1003 = fma(_534, _985, _1001);
        float _1005 = _1003 + _993;
        float _1007 = precise::clamp(_1005, 0.0, 1.0);
        float _1009 = -_1007;
        float _1011 = _1009 + _941;
        float _1013 = fma(_995, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1011);
        float _1015 = _997 * _1013;
        float _1017 = exp2(_1015);
        float _1019 = 0.0 + _1017;
        float _1021 = precise::clamp(_1019, 0.0, 1.0);
        _945 = _1021;
    }
    float _1023 = _945;
    float _1025 = -_151;
    float _1027 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1029 = _1025 + _1027;
    float _1031 = precise::min(_1023, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1033 = -_151;
    float _1035 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1037 = _1033 + _1035;
    float _1039 = -_935;
    float _1041 = _1039 + 1.0;
    float _1043 = _1029 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1045 = precise::clamp(_1043, 0.0, 1.0);
    float _1047 = _1037 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1049 = precise::clamp(_1047, 0.0, 1.0);
    float _1051 = -_1031;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_1045, _1041, _935);
    float _1057 = fma(_1049, _1053, _1031);
    out.m_56.x = _1055;
    out.m_56.y = _1057;
    out.m_56.z = 1.0;
    out.m_56.w = 1.0;
    out.m_58.x = _933;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

