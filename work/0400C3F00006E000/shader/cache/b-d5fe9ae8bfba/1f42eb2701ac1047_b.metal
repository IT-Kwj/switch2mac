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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
    float4 m_56 [[color(1)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_45.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_45.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float _83 = _79 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1074 = float2(_79, _81);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1074, float2(0.0), isnan(_1074))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1074, float2(0.0), isnan(_1074))).x;
    float _87 = _81 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1089 = float2(_83, _81);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1089, float2(0.0), isnan(_1089))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1089, float2(0.0), isnan(_1089))).x;
    float2 _1097 = float2(_79, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1097, float2(0.0), isnan(_1097))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1097, float2(0.0), isnan(_1097))).x;
    float2 _1105 = float2(_79, _81);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1105, float2(0.0), isnan(_1105))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1105, float2(0.0), isnan(_1105))).x;
    float _95 = in.m_47.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_47.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_49.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_49.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_51.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_51.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _77 * _99;
    float _133 = _77 * _105;
    float _135 = _77 * _111;
    float _137 = _77 * _117;
    float _139 = _77 * _123;
    float _141 = _77 * _129;
    float _143 = -_85;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _147 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].x, _145);
    float _149 = _147 * _131;
    float _151 = _147 * _133;
    float _153 = -_89;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].x, _155);
    float _159 = -_91;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].x, _161);
    float _165 = _149 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _167 = _149 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _169 = -_151;
    float _171 = fma(_157, _135, _169);
    float _173 = -_151;
    float _175 = fma(_163, _139, _173);
    float _177 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].x, _165);
    float _179 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].x, _167);
    float _181 = -_149;
    float _183 = fma(_163, _141, _181);
    float _185 = -_149;
    float _187 = fma(_157, _137, _185);
    float _189 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[32].z, _177);
    float _191 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[30].z, _179);
    float _193 = -_147;
    float _195 = _193 + _157;
    float _197 = -_147;
    float _199 = _197 + _163;
    float _201 = _189 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _205 = _195 * _175;
    float _207 = _187 * _199;
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _211 = _201 + _209;
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _215 = _203 + _213;
    float _217 = -_205;
    float _219 = fma(_171, _199, _217);
    float _221 = _171 * _183;
    float _223 = _211 * _211;
    float _225 = -_207;
    float _227 = fma(_195, _183, _225);
    float _229 = _219 * _219;
    float _231 = -_221;
    float _233 = fma(_187, _175, _231);
    float _235 = fma(_215, _215, _223);
    float _237 = _149 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _239 = fma(_227, _227, _229);
    float _241 = sqrt(_235);
    float _243 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].x, _237);
    float _245 = fma(_233, _233, _239);
    float _247 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[31].z, _243);
    float _249 = rsqrt(_245);
    float _251 = _247 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _255 = _241 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _257 = _227 * _249;
    float _259 = _219 * _249;
    float _261 = _233 * _249;
    bool _263 = !_255;
    float _265 = _251;
    float _267 = _203;
    float _269 = _201;
    float _271 = _151;
    if (!_263)
    {
        float _273 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _275 = _241 + _273;
        float _277 = _251 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _279 = rsqrt(_235);
        float _281 = -_251;
        float _283 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _285 = _281 + _283;
        float _287 = abs(_277);
        float _289 = abs(_275);
        float _291 = precise::max(_287, _289);
        float _293 = _285 * _285;
        bool _295 = _291 >= 16.0;
        float _297 = _215 * _279;
        float _299 = _211 * _279;
        float _301 = -_215;
        float _303 = fma(_297, (*spvDescriptorSet0.fp_c3)._m0[41].z, _301);
        float _305 = -_211;
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
        _265 = _518;
        _267 = _520;
        _269 = _522;
    }
    float _524 = _265;
    float _526 = _267;
    float _528 = _269;
    float _530 = _259 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _532 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[35].x, _530);
    float _534 = _524 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _536 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].z, _532);
    float _538 = fma(_526, (*spvDescriptorSet0.fp_c5)._m0[101].x, _534);
    float _540 = -_536;
    float _542 = fma(_540, _536, 1.0);
    float _544 = -_536;
    float _546 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[35].z, _261);
    float _548 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[101].z, _538);
    float _550 = -_536;
    float _552 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[35].x, _257);
    float _554 = _542 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _556 = _548 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _558 = fma(_546, _554, _147);
    float _560 = _524 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _562 = -_558;
    bool _564 = _562 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _566 = float(_564);
    float _568 = fma(_526, (*spvDescriptorSet0.fp_c5)._m0[102].x, _560);
    float _570 = -_558;
    bool _572 = _570 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _574 = float(_572);
    float _576 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[102].z, _568);
    float _578 = _566 + _574;
    float _580 = trunc(_556);
    int _582 = int(_580);
    float _584 = _576 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _586 = precise::min(_578, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _588 = trunc(_584);
    int _590 = int(_588);
    float _592 = trunc(_586);
    int _594 = int(_592);
    int _596 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _598 = _582 + _596;
    int _600 = _598 + 1;
    bool _602 = _600 >= 0;
    int _604 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _606 = _590 + _604;
    int _608 = _606 + 1;
    bool _610 = _600 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _612 = !_602;
    bool _614 = _610 || _612;
    bool _616 = _608 < 0;
    bool _618 = _616 || _614;
    int _620 = _594 << 6;
    bool _622 = _608 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _624 = _622 || _618;
    int _626 = _620 + 48;
    uint _629 = uint(int(uint(_626) >> uint(2)));
    uint _631 = uint(int(uint(int(_629)) >> uint(2)));
    int _633 = int(_629) & 3;
    float _635 = (*spvDescriptorSet0.fp_c3)._m0[int(_631)][_633];
    int _637 = int(_629) + 1;
    uint _639 = uint(int(uint(_637) >> uint(2)));
    int _641 = _637 & 3;
    float _643 = (*spvDescriptorSet0.fp_c3)._m0[int(_639)][_641];
    int _645 = _620 + 56;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.fp_c3)._m0[int(_657)][_659];
    int _663 = _600;
    if (!_624)
    {
        int _665 = _608 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _667 = _665 + _600;
        _663 = _667;
    }
    int _669 = _663;
    uint _671 = uint(int(uint(_620) >> uint(2)));
    uint _673 = uint(int(uint(int(_671)) >> uint(2)));
    int _675 = int(_671) & 3;
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[int(_673)][_675];
    int _679 = int(_671) + 1;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    int _683 = _679 & 3;
    float _685 = (*spvDescriptorSet0.fp_c3)._m0[int(_681)][_683];
    int _687 = 0;
    if (!_624)
    {
        int _689 = _669 << 2;
        _687 = _689;
    }
    int _691 = _687;
    int _693 = 0;
    int _695 = _691;
    if (!_624)
    {
        int _697 = _669 >> 2;
        _693 = _697;
    }
    int _699 = _693;
    int _701 = _699;
    if (!_624)
    {
        int _703 = 12 & _691;
        _695 = _703;
    }
    int _705 = _695;
    int _707 = _620 + 8;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    uint _711 = uint(int(uint(int(_709)) >> uint(2)));
    int _713 = int(_709) & 3;
    float _715 = (*spvDescriptorSet0.fp_c3)._m0[int(_711)][_713];
    int _717 = int(_709) + 1;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    int _721 = _717 & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    if (!_624)
    {
        int _725 = _699 << 4;
        int _727 = _725 + _705;
        _701 = _727;
    }
    int _729 = _701;
    float _731 = -_536;
    float _733 = fma(_731, (*spvDescriptorSet0.fp_c3)._m0[35].y, _259);
    float _735 = fma(_733, _554, _149);
    float _737 = fma(_552, _554, _151);
    int _739 = _620 + 16;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    uint _743 = uint(int(uint(int(_741)) >> uint(2)));
    int _745 = int(_741) & 3;
    float _747 = (*spvDescriptorSet0.fp_c3)._m0[int(_743)][_745];
    int _749 = int(_741) + 1;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    int _753 = _749 & 3;
    float _755 = (*spvDescriptorSet0.fp_c3)._m0[int(_751)][_753];
    if (!_624)
    {
        float _757 = floor(_556);
        _271 = _757;
    }
    float _759 = _271;
    int _761 = _620 + 32;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    uint _765 = uint(int(uint(int(_763)) >> uint(2)));
    int _767 = int(_763) & 3;
    float _769 = (*spvDescriptorSet0.fp_c3)._m0[int(_765)][_767];
    int _771 = int(_763) + 1;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    int _775 = _771 & 3;
    float _777 = (*spvDescriptorSet0.fp_c3)._m0[int(_773)][_775];
    float _779 = _552;
    if (!_624)
    {
        float _781 = floor(_584);
        _779 = _781;
    }
    float _783 = _779;
    float _785 = _259;
    if (!_624)
    {
        uint _787 = uint(int(uint(_729) >> uint(2)));
        uint _789 = uint(int(uint(int(_787)) >> uint(2)));
        int _791 = int(_787) & 3;
        float _793 = (*spvDescriptorSet0.fp_c5)._m0[int(_789)][_791];
        _785 = _793;
    }
    float _795 = _785;
    float _797 = _735 * _643;
    float _799 = fma(_737, _635, _797);
    int _801 = _620 + 24;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    uint _805 = uint(int(uint(int(_803)) >> uint(2)));
    int _807 = int(_803) & 3;
    float _809 = (*spvDescriptorSet0.fp_c3)._m0[int(_805)][_807];
    int _811 = int(_803) + 1;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    int _815 = _811 & 3;
    float _817 = (*spvDescriptorSet0.fp_c3)._m0[int(_813)][_815];
    float _819 = fma(_558, _653, _799);
    float _821 = _783;
    if (!_624)
    {
        float _823 = -_783;
        float _825 = _584 + _823;
        _821 = _825;
    }
    float _827 = _821;
    float _829 = _819 + _661;
    int _831 = _620 + 40;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.fp_c3)._m0[int(_835)][_837];
    int _841 = int(_833) + 1;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    int _845 = _841 & 3;
    float _847 = (*spvDescriptorSet0.fp_c3)._m0[int(_843)][_845];
    float _849 = _735 * _685;
    float _851 = _685;
    if (!_624)
    {
        float _853 = -_759;
        float _855 = _556 + _853;
        _851 = _855;
    }
    float _857 = _851;
    float _859 = 1.0 / _829;
    float _861 = fma(_737, _677, _849);
    float _863 = fma(_558, _715, _861);
    float _865 = rint(_586);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    uint _871 = clamp(_869, 0u, 65535u);
    float _873 = _863 + _723;
    float _875 = _735 * _755;
    float _877 = _873 * _859;
    float _879 = fma(_737, _747, _875);
    float _881 = _735 * _777;
    float _883 = fma(_737, _769, _881);
    float _885 = _863;
    float _887 = _859;
    if (!_624)
    {
        float _889 = rint(_795);
        float _891 = precise::max(_889, 0.0);
        uint _893 = uint(_891);
        uint _895 = clamp(_893, 0u, 65535u);
        _885 = as_type<float>(_895);
    }
    float _897 = _885;
    float _899 = fma(_558, _809, _879);
    float _901 = _899 + _817;
    float _903 = fma(_558, _839, _883);
    float _905 = _903 + _847;
    float _907 = _901 * _859;
    float _909 = _905 * _859;
    float _911 = precise::clamp(_909, 0.0, 1.0);
    float3 _2407 = float3(_877, _907, float(int(_871)));
    float3 _2411 = select(_2407, float3(0.0), isnan(_2407));
    float _913 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2411.xy, uint(rint(_2411.z)), _911);
    float _915 = _857;
    if (!_624)
    {
        float3 _2424 = float3(_857, _827, float(as_type<int>(_897)));
        float3 _2426 = select(_2424, float3(0.0), isnan(_2424));
        float _917 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2426.xy, uint(rint(_2426.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2426.xy, uint(rint(_2426.z)), level(0.0)).x;
        _915 = _917;
    }
    float _919 = _915;
    float _921 = -_147;
    float _923 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _925 = _921 + _923;
    if (_624)
    {
        _887 = 1.0;
    }
    float _927 = _887;
    float _929 = _927;
    if (!_624)
    {
        int _931 = _669 << 4;
        int _933 = _931 + 1648;
        int _935 = _729 + 8048;
        uint _937 = uint(int(uint(_935) >> uint(2)));
        uint _939 = uint(int(uint(int(_937)) >> uint(2)));
        int _941 = int(_937) & 3;
        float _943 = (*spvDescriptorSet0.fp_c5)._m0[int(_939)][_941];
        uint _945 = uint(int(uint(_933) >> uint(2)));
        uint _947 = uint(int(uint(int(_945)) >> uint(2)));
        int _949 = int(_945) & 3;
        float _951 = (*spvDescriptorSet0.fp_c5)._m0[int(_947)][_949];
        int _953 = int(_945) + 1;
        uint _955 = uint(int(uint(_953) >> uint(2)));
        int _957 = _953 & 3;
        float _959 = (*spvDescriptorSet0.fp_c5)._m0[int(_955)][_957];
        int _961 = _933 + 8;
        uint _963 = uint(int(uint(_961) >> uint(2)));
        uint _965 = uint(int(uint(int(_963)) >> uint(2)));
        int _967 = int(_963) & 3;
        float _969 = (*spvDescriptorSet0.fp_c5)._m0[int(_965)][_967];
        int _971 = int(_963) + 1;
        uint _973 = uint(int(uint(_971) >> uint(2)));
        int _975 = _971 & 3;
        float _977 = (*spvDescriptorSet0.fp_c5)._m0[int(_973)][_975];
        float _979 = 1.0 / _943;
        float _981 = _943 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _983 = _524 * _959;
        float _985 = fma(_526, _951, _983);
        float _987 = fma(_528, _969, _985);
        float _989 = _987 + _977;
        float _991 = precise::clamp(_989, 0.0, 1.0);
        float _993 = -_991;
        float _995 = _993 + _919;
        float _997 = fma(_979, (*spvDescriptorSet0.fp_c3)._m0[39].y, _995);
        float _999 = _981 * _997;
        float _1001 = exp2(_999);
        float _1003 = 0.0 + _1001;
        float _1005 = precise::clamp(_1003, 0.0, 1.0);
        _929 = _1005;
    }
    float _1007 = _929;
    float _1009 = -_147;
    float _1011 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1013 = _1009 + _1011;
    float _1015 = precise::min(_1007, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1017 = _925 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1019 = precise::clamp(_1017, 0.0, 1.0);
    float _1021 = -_913;
    float _1023 = _1021 + 1.0;
    float _1025 = _1013 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = -_1015;
    float _1031 = _1029 + 1.0;
    float _1033 = fma(_1019, _1023, _913);
    float _1035 = fma(_1027, _1031, _1015);
    out.m_54.x = _1033;
    out.m_54.y = _1035;
    out.m_54.z = 1.0;
    out.m_54.w = 1.0;
    out.m_56.x = _93;
    out.m_56.y = 0.5;
    out.m_56.z = 0.5;
    out.m_56.w = 1.0;
    return out;
}

