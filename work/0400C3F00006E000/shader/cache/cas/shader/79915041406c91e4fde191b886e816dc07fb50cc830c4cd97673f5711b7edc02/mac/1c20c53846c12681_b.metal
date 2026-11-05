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
    bool _855 = false;
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
    float2 _1118 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1118, float2(0.0), isnan(_1118))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1118, float2(0.0), isnan(_1118))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1133 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1133, float2(0.0), isnan(_1133))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1133, float2(0.0), isnan(_1133))).x;
    float2 _1141 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1141, float2(0.0), isnan(_1141))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1141, float2(0.0), isnan(_1141))).x;
    float _95 = in.m_49.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_49.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_51.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_51.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_53.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_53.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _79 * _99;
    float _133 = _79 * _105;
    float _135 = _79 * _111;
    float _137 = _79 * _117;
    float _139 = _79 * _123;
    float _141 = _79 * _129;
    float _143 = -_87;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _147 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].x, _145);
    float _149 = _147 * _131;
    float _151 = _147 * _133;
    float _153 = -_91;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].x, _155);
    float _159 = _149 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _161 = _149 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _163 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].x, _159);
    float _165 = -_93;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _169 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[41].x, _167);
    float _171 = -_151;
    float _173 = fma(_157, _135, _171);
    float _175 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].x, _161);
    float _177 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[32].z, _163);
    float _179 = -_149;
    float _181 = fma(_157, _137, _179);
    float _183 = -_147;
    float _185 = _183 + _157;
    float _187 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[30].z, _175);
    float _189 = _177 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _191 = -_151;
    float _193 = fma(_169, _139, _191);
    float _195 = -_149;
    float _197 = fma(_169, _141, _195);
    float _199 = _187 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _203 = _189 + _201;
    float _205 = -_147;
    float _207 = _205 + _169;
    float _209 = _185 * _193;
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _213 = _199 + _211;
    float _215 = _203 * _203;
    float _217 = _181 * _207;
    float _219 = -_209;
    float _221 = fma(_173, _207, _219);
    float _223 = _173 * _197;
    float _225 = fma(_213, _213, _215);
    float _227 = -_217;
    float _229 = fma(_185, _197, _227);
    float _231 = _221 * _221;
    float _233 = -_223;
    float _235 = fma(_181, _193, _233);
    float _237 = sqrt(_225);
    float _239 = _149 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _241 = fma(_229, _229, _231);
    float _243 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].x, _239);
    float _245 = fma(_235, _235, _241);
    float _247 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[31].z, _243);
    float _249 = rsqrt(_245);
    float _251 = _247 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _255 = _237 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _257 = _229 * _249;
    float _259 = _221 * _249;
    float _261 = _235 * _249;
    float _263 = _249;
    float _265 = _245;
    float _267 = _189;
    float _269 = _147;
    if (!_255)
    {
        _263 = _199;
    }
    float _271 = _263;
    float _273 = _271;
    if (!_255)
    {
        _265 = _251;
    }
    float _275 = _265;
    bool _277 = !_255;
    float _279 = _275;
    if (!_277)
    {
        float _281 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _283 = _237 + _281;
        float _285 = _251 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _287 = rsqrt(_225);
        float _289 = -_251;
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = _289 + _291;
        float _295 = abs(_285);
        float _297 = abs(_283);
        float _299 = precise::max(_295, _297);
        float _301 = _293 * _293;
        bool _303 = _299 >= 16.0;
        float _305 = _213 * _287;
        float _307 = _203 * _287;
        float _309 = -_213;
        float _311 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[41].z, _309);
        float _313 = -_203;
        float _315 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = _283;
        float _319 = _285;
        int _322 = as_type<int>(_293);
        float _324 = _315;
        if (_303)
        {
            float _326 = _283 * 0.0625;
            _317 = _326;
        }
        float _328 = _317;
        if (_303)
        {
            float _330 = _285 * 0.0625;
            _319 = _330;
        }
        float _332 = _319;
        float _334 = fma(_311, _311, _301);
        float _336 = abs(_328);
        bool _338 = _336 != 0.0;
        bool _340 = isnan(_336);
        bool _342 = _338 || _340;
        bool _344 = isnan(0.0);
        bool _346 = _342 || _344;
        float _348 = fma(_315, _315, _334);
        float _350 = abs(_332);
        bool _352 = _350 == 0.0;
        float _354 = abs(_332);
        bool _356 = _354 == 0.0;
        bool _358 = !_346;
        bool _360 = _356 && _358;
        float _362 = sqrt(_348);
        bool _364 = false;
        int _366 = as_type<int>(_348);
        if (_360)
        {
            bool _368 = as_type<int>(_332) >= 0;
            _364 = _368;
        }
        bool _370 = _364;
        int _372 = _370 ? (-1) : 0;
        if (_360)
        {
            int _374 = _370 ? 0 : 1078530011;
            _322 = _374;
        }
        int _376 = _322;
        if (_360)
        {
            int _378 = int(0x80000000) & as_type<int>(_328);
            int _380 = _376 | _378;
            _324 = as_type<float>(_380);
        }
        float _382 = _324;
        bool _384 = !_346;
        bool _386 = _384 && _352;
        float _388 = _382;
        float _390 = _382;
        if (!_386)
        {
            float _392 = abs(_328);
            bool _394 = _392 != as_type<float>(0x7f800000u /* inf */);
            bool _396 = isnan(_392);
            bool _398 = _394 || _396;
            bool _400 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _402 = _398 || _400;
            float _404 = abs(_332);
            bool _406 = _404 == as_type<float>(0x7f800000u /* inf */);
            float _408 = abs(_332);
            bool _410 = _408 == as_type<float>(0x7f800000u /* inf */);
            bool _412 = !_402;
            bool _414 = _410 && _412;
            if (_414)
            {
                bool _416 = as_type<int>(_332) >= 0;
                _372 = _416 ? (-1) : 0;
            }
            int _418 = _372;
            if (_414)
            {
                _366 = 1075235812;
            }
            int _420 = _366;
            int _422 = _420;
            if (_414)
            {
                int _424 = ~_418;
                int _426 = (_424 != 0) ? _420 : 1061752795;
                _422 = _426;
            }
            int _428 = _422;
            if (_414)
            {
                int _430 = int(0x80000000) & as_type<int>(_328);
                int _432 = _428 | _430;
                _388 = as_type<float>(_432);
            }
            float _434 = _388;
            bool _436 = !_402;
            bool _438 = _436 && _406;
            _390 = _434;
            if (!_438)
            {
                float _440 = abs(_328);
                float _442 = abs(_332);
                float _444 = precise::max(_440, _442);
                float _446 = abs(_328);
                float _448 = abs(_332);
                float _450 = precise::min(_446, _448);
                float _452 = 1.0 / _444;
                float _454 = abs(_328);
                float _456 = abs(_332);
                bool _458 = _454 > _456;
                bool _460 = as_type<int>(_332) >= 0;
                float _462 = _450 * _452;
                float _464 = abs(_328);
                float _466 = abs(_332);
                float _468 = _464 + _466;
                int _470 = as_type<int>(_328) & int(0x80000000);
                float _472 = _462 * _462;
                bool _474 = _468 > as_type<float>(0x7f800000u /* inf */);
                bool _476 = isnan(_468);
                bool _478 = _474 || _476;
                bool _480 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _482 = _478 || _480;
                float _484 = _472 + 11.33538818359375;
                float _486 = fma(_472, _484, 28.84246826171875);
                float _488 = fma(_472, _486, 19.6966705322265625);
                float _490 = fma(_472, -0.82336294651031494140625, -5.674867153167724609375);
                float _492 = fma(_472, _490, -6.565555095672607421875);
                float _494 = 1.0 / _488;
                float _496 = _472 * _492;
                float _498 = _462 * _496;
                float _500 = fma(_498, _494, _462);
                float _502 = _500;
                _390 = _468;
                if (_458)
                {
                    float _504 = -_500;
                    float _506 = _504 + 1.57079637050628662109375;
                    _502 = _506;
                }
                float _508 = _502;
                int _510 = as_type<int>(_508);
                if (!_460)
                {
                    float _512 = -_508;
                    float _514 = _512 + 3.1415927410125732421875;
                    _510 = as_type<int>(_514);
                }
                int _516 = _510;
                if (!_482)
                {
                    int _518 = _470 | _516;
                    _390 = as_type<float>(_518);
                }
            }
        }
        float _520 = _390;
        float _522 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _524 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _526 = _362 + _524;
        float _528 = fma(_305, _522, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _530 = fma(_307, _522, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _279 = _526;
        _273 = _528;
        _267 = _530;
    }
    float _532 = _279;
    float _534 = _273;
    float _536 = _267;
    float2 _1817 = float2(_81, _83);
    float2 _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1817, float2(0.0), isnan(_1817))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1817, float2(0.0), isnan(_1817))).xy;
    float _542 = _540.x;
    float _544 = _540.y;
    float _546 = fma(_542, 2.0, -1.0);
    float _548 = fma(_544, 2.0, -1.0);
    float _550 = _546 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _552 = _548 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _554 = fma(_550, 2.0, _81);
    float _556 = fma(_552, 2.0, _83);
    float2 _1849 = float2(_554, _556);
    float _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1849, float2(0.0), isnan(_1849))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1849, float2(0.0), isnan(_1849))).x;
    float _560 = _259 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _562 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[35].x, _560);
    float _564 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].z, _562);
    float _566 = -_564;
    float _568 = fma(_566, _564, 1.0);
    float _570 = -_564;
    float _572 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[35].z, _261);
    float _574 = -_564;
    float _576 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[35].y, _259);
    float _578 = -_564;
    float _580 = fma(_578, (*spvDescriptorSet0.fp_c3)._m0[35].x, _257);
    float _582 = _568 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _584 = fma(_572, _582, _147);
    float _586 = fma(_576, _582, _149);
    float _588 = fma(_580, _582, _151);
    float _590 = -_584;
    bool _592 = _590 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _594 = float(_592);
    float _596 = -_584;
    bool _598 = _596 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _600 = float(_598);
    float _602 = _594 + _600;
    float _604 = precise::min(_602, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _606 = trunc(_604);
    int _608 = int(_606);
    int _610 = _608 << 6;
    bool _612 = _608 != 0;
    int _614 = _610 + 48;
    uint _617 = uint(int(uint(_614) >> uint(2)));
    uint _619 = uint(int(uint(int(_617)) >> uint(2)));
    int _621 = int(_617) & 3;
    float _623 = (*spvDescriptorSet0.fp_c3)._m0[int(_619)][_621];
    int _625 = int(_617) + 1;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    int _629 = _625 & 3;
    float _631 = (*spvDescriptorSet0.fp_c3)._m0[int(_627)][_629];
    int _633 = _610 + 56;
    uint _635 = uint(int(uint(_633) >> uint(2)));
    uint _637 = uint(int(uint(int(_635)) >> uint(2)));
    int _639 = int(_635) & 3;
    float _641 = (*spvDescriptorSet0.fp_c3)._m0[int(_637)][_639];
    int _643 = int(_635) + 1;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    int _647 = _643 & 3;
    float _649 = (*spvDescriptorSet0.fp_c3)._m0[int(_645)][_647];
    uint _651 = uint(int(uint(_610) >> uint(2)));
    uint _653 = uint(int(uint(int(_651)) >> uint(2)));
    int _655 = int(_651) & 3;
    float _657 = (*spvDescriptorSet0.fp_c3)._m0[int(_653)][_655];
    int _659 = int(_651) + 1;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    int _663 = _659 & 3;
    float _665 = (*spvDescriptorSet0.fp_c3)._m0[int(_661)][_663];
    int _667 = _610 + 16;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    uint _671 = uint(int(uint(int(_669)) >> uint(2)));
    int _673 = int(_669) & 3;
    float _675 = (*spvDescriptorSet0.fp_c3)._m0[int(_671)][_673];
    int _677 = int(_669) + 1;
    uint _679 = uint(int(uint(_677) >> uint(2)));
    int _681 = _677 & 3;
    float _683 = (*spvDescriptorSet0.fp_c3)._m0[int(_679)][_681];
    int _685 = _610 + 32;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    uint _689 = uint(int(uint(int(_687)) >> uint(2)));
    int _691 = int(_687) & 3;
    float _693 = (*spvDescriptorSet0.fp_c3)._m0[int(_689)][_691];
    int _695 = int(_687) + 1;
    uint _697 = uint(int(uint(_695) >> uint(2)));
    int _699 = _695 & 3;
    float _701 = (*spvDescriptorSet0.fp_c3)._m0[int(_697)][_699];
    int _703 = _610 + 8;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    uint _707 = uint(int(uint(int(_705)) >> uint(2)));
    int _709 = int(_705) & 3;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[int(_707)][_709];
    int _713 = int(_705) + 1;
    uint _715 = uint(int(uint(_713) >> uint(2)));
    int _717 = _713 & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = _610 + 24;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    uint _725 = uint(int(uint(int(_723)) >> uint(2)));
    int _727 = int(_723) & 3;
    float _729 = (*spvDescriptorSet0.fp_c3)._m0[int(_725)][_727];
    int _731 = int(_723) + 1;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    int _735 = _731 & 3;
    float _737 = (*spvDescriptorSet0.fp_c3)._m0[int(_733)][_735];
    float _739 = _586 * _631;
    float _741 = fma(_588, _623, _739);
    int _743 = _610 + 40;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    uint _747 = uint(int(uint(int(_745)) >> uint(2)));
    int _749 = int(_745) & 3;
    float _751 = (*spvDescriptorSet0.fp_c3)._m0[int(_747)][_749];
    int _753 = int(_745) + 1;
    uint _755 = uint(int(uint(_753) >> uint(2)));
    int _757 = _753 & 3;
    float _759 = (*spvDescriptorSet0.fp_c3)._m0[int(_755)][_757];
    float _761 = fma(_584, _641, _741);
    float _763 = _761 + _649;
    float _765 = _586 * _665;
    float _767 = 1.0 / _763;
    float _769 = fma(_588, _657, _765);
    float _771 = _586 * _683;
    float _773 = fma(_588, _675, _771);
    float _775 = _586 * _701;
    float _777 = fma(_588, _693, _775);
    float _779 = fma(_584, _711, _769);
    float _781 = _779 + _719;
    float _783 = fma(_584, _729, _773);
    float _785 = _783 + _737;
    float _787 = fma(_584, _751, _777);
    float _789 = _781 * _767;
    float _791 = _785 * _767;
    float _793 = _787 + _759;
    float _795 = _793 * _767;
    float _797 = precise::clamp(_795, 0.0, 1.0);
    float _853;
    if (!_612)
    {
        float _799 = rint(_604);
        float _801 = precise::max(_799, 0.0);
        uint _803 = uint(_801);
        uint _805 = clamp(_803, 0u, 65535u);
        float _807 = _797 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _809 = fma(_807, 0.5, _791);
        float _811 = fma(_807, 0.5, _789);
        float _813 = fma(_807, -0.5, _789);
        float _815 = fma(_807, -0.5, _791);
        float3 _2296 = float3(_789, _809, float(int(_805)));
        float3 _2300 = select(_2296, float3(0.0), isnan(_2296));
        float _817 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2300.xy, uint(rint(_2300.z)), _797);
        float3 _2309 = float3(_811, _809, float(int(_805)));
        float3 _2311 = select(_2309, float3(0.0), isnan(_2309));
        float _819 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2311.xy, uint(rint(_2311.z)), _797);
        float3 _2320 = float3(_813, _809, float(int(_805)));
        float3 _2322 = select(_2320, float3(0.0), isnan(_2320));
        float _821 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2322.xy, uint(rint(_2322.z)), _797);
        float3 _2331 = float3(_811, _791, float(int(_805)));
        float3 _2333 = select(_2331, float3(0.0), isnan(_2331));
        float _823 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2333.xy, uint(rint(_2333.z)), _797);
        float3 _2342 = float3(_789, _791, float(int(_805)));
        float3 _2344 = select(_2342, float3(0.0), isnan(_2342));
        float _825 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2344.xy, uint(rint(_2344.z)), _797);
        float3 _2353 = float3(_813, _791, float(int(_805)));
        float3 _2355 = select(_2353, float3(0.0), isnan(_2353));
        float _827 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2355.xy, uint(rint(_2355.z)), _797);
        float3 _2364 = float3(_811, _815, float(int(_805)));
        float3 _2366 = select(_2364, float3(0.0), isnan(_2364));
        float _829 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2366.xy, uint(rint(_2366.z)), _797);
        float3 _2375 = float3(_789, _815, float(int(_805)));
        float3 _2377 = select(_2375, float3(0.0), isnan(_2375));
        float _831 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2377.xy, uint(rint(_2377.z)), _797);
        float3 _2386 = float3(_813, _815, float(int(_805)));
        float3 _2388 = select(_2386, float3(0.0), isnan(_2386));
        float _833 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2388.xy, uint(rint(_2388.z)), _797);
        float _835 = _819 + _817;
        float _837 = _835 + _821;
        float _839 = _837 + _823;
        float _841 = _839 + _825;
        float _843 = _841 + _827;
        float _845 = _843 + _829;
        float _847 = _845 + _831;
        float _849 = _847 + _833;
        float _851 = _849 * 0.111111111938953399658203125;
        _853 = _851;
        _855 = true;
    }
    else
    {
        float _857 = rint(_604);
        float _859 = precise::max(_857, 0.0);
        uint _861 = uint(_859);
        uint _863 = clamp(_861, 0u, 65535u);
        float3 _2435 = float3(_789, _791, float(int(_863)));
        float3 _2437 = select(_2435, float3(0.0), isnan(_2435));
        float _865 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2437.xy, uint(rint(_2437.z)), _797);
        _853 = _865;
    }
    _855 = false;
    float _867 = _853;
    float _869 = _532 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _871 = _532 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _873 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].x, _869);
    float _875 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].x, _871);
    float _877 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].z, _873);
    float _879 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].z, _875);
    float _881 = _877 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _883 = _879 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _885 = trunc(_881);
    int _887 = int(_885);
    float _889 = trunc(_883);
    int _891 = int(_889);
    int _893 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _895 = _887 + _893;
    int _897 = _895 + 1;
    float _899 = -_147;
    float _901 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _903 = _899 + _901;
    bool _905 = _897 >= 0;
    int _907 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _909 = _891 + _907;
    int _911 = _909 + 1;
    float _913 = -_147;
    float _915 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _917 = _913 + _915;
    bool _919 = _897 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _921 = !_905;
    bool _923 = _919 || _921;
    bool _925 = _911 < 0;
    bool _927 = _925 || _923;
    bool _929 = _911 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _931 = _929 || _927;
    if (_931)
    {
        _269 = 1.0;
    }
    float _933 = _269;
    float _935 = _933;
    if (!_931)
    {
        int _937 = _911 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _939 = _937 + _897;
        float _941 = floor(_883);
        int _943 = _939 << 2;
        int _945 = _939 >> 2;
        int _947 = 12 & _943;
        int _949 = _945 << 4;
        int _951 = _949 + _947;
        float _953 = floor(_881);
        uint _955 = uint(int(uint(_951) >> uint(2)));
        uint _957 = uint(int(uint(int(_955)) >> uint(2)));
        int _959 = int(_955) & 3;
        float _961 = (*spvDescriptorSet0.fp_c5)._m0[int(_957)][_959];
        float _963 = -_941;
        float _965 = _883 + _963;
        float _967 = -_953;
        float _969 = _881 + _967;
        float _971 = rint(_961);
        float _973 = precise::max(_971, 0.0);
        uint _975 = uint(_973);
        uint _977 = clamp(_975, 0u, 65535u);
        float3 _2622 = float3(_969, _965, float(int(_977)));
        float3 _2624 = select(_2622, float3(0.0), isnan(_2622));
        float _979 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2624.xy, uint(rint(_2624.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2624.xy, uint(rint(_2624.z)), level(0.0)).x;
        int _981 = _939 << 4;
        int _983 = _981 + 1648;
        int _985 = _951 + 8048;
        uint _987 = uint(int(uint(_985) >> uint(2)));
        uint _989 = uint(int(uint(int(_987)) >> uint(2)));
        int _991 = int(_987) & 3;
        float _993 = (*spvDescriptorSet0.fp_c5)._m0[int(_989)][_991];
        uint _995 = uint(int(uint(_983) >> uint(2)));
        uint _997 = uint(int(uint(int(_995)) >> uint(2)));
        int _999 = int(_995) & 3;
        float _1001 = (*spvDescriptorSet0.fp_c5)._m0[int(_997)][_999];
        int _1003 = int(_995) + 1;
        uint _1005 = uint(int(uint(_1003) >> uint(2)));
        int _1007 = _1003 & 3;
        float _1009 = (*spvDescriptorSet0.fp_c5)._m0[int(_1005)][_1007];
        int _1011 = _983 + 8;
        uint _1013 = uint(int(uint(_1011) >> uint(2)));
        uint _1015 = uint(int(uint(int(_1013)) >> uint(2)));
        int _1017 = int(_1013) & 3;
        float _1019 = (*spvDescriptorSet0.fp_c5)._m0[int(_1015)][_1017];
        int _1021 = int(_1013) + 1;
        uint _1023 = uint(int(uint(_1021) >> uint(2)));
        int _1025 = _1021 & 3;
        float _1027 = (*spvDescriptorSet0.fp_c5)._m0[int(_1023)][_1025];
        float _1029 = _993 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1031 = _532 * _1009;
        float _1033 = fma(_534, _1001, _1031);
        float _1035 = 1.0 / _993;
        float _1037 = fma(_536, _1019, _1033);
        float _1039 = _1037 + _1027;
        float _1041 = precise::clamp(_1039, 0.0, 1.0);
        float _1043 = -_1041;
        float _1045 = _1043 + _979;
        float _1047 = fma(_1035, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1045);
        float _1049 = _1029 * _1047;
        float _1051 = exp2(_1049);
        float _1053 = 0.0 + _1051;
        float _1055 = precise::clamp(_1053, 0.0, 1.0);
        _935 = _1055;
    }
    float _1057 = _935;
    float _1059 = precise::min(_1057, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1061 = _903 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1063 = precise::clamp(_1061, 0.0, 1.0);
    float _1065 = -_867;
    float _1067 = _1065 + 1.0;
    float _1069 = _917 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1071 = precise::clamp(_1069, 0.0, 1.0);
    float _1073 = -_1059;
    float _1075 = _1073 + 1.0;
    float _1077 = fma(_1063, _1067, _867);
    float _1079 = fma(_1071, _1075, _1059);
    out.m_56.x = _1077;
    out.m_56.y = _1079;
    out.m_56.z = 1.0;
    out.m_56.w = 1.0;
    out.m_58.x = _558;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

