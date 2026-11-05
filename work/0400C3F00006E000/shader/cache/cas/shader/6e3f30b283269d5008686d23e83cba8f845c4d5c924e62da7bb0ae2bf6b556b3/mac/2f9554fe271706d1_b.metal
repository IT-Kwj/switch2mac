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
    bool _833 = false;
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
    float2 _1097 = float2(_77, _79);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1097, float2(0.0), isnan(_1097))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1097, float2(0.0), isnan(_1097))).x;
    float _85 = _79 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1112 = float2(_81, _79);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1112, float2(0.0), isnan(_1112))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1112, float2(0.0), isnan(_1112))).x;
    float2 _1120 = float2(_77, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1120, float2(0.0), isnan(_1120))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1120, float2(0.0), isnan(_1120))).x;
    float _91 = in.m_45.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_45.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_47.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_47.y;
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
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _139 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[41].x, _137);
    float _141 = -_87;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _145 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[41].x, _143);
    float _147 = _139 * _127;
    float _149 = _139 * _129;
    float _151 = _75 * _119;
    float _153 = _75 * _125;
    float _155 = _147 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _157 = _147 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _159 = -_89;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].x, _161);
    float _165 = -_149;
    float _167 = fma(_145, _131, _165);
    float _169 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[32].x, _155);
    float _171 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[30].x, _157);
    float _173 = -_149;
    float _175 = fma(_163, _151, _173);
    float _177 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[32].z, _169);
    float _179 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[30].z, _171);
    float _181 = -_147;
    float _183 = fma(_145, _133, _181);
    float _185 = -_139;
    float _187 = _185 + _145;
    float _189 = _177 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _191 = -_147;
    float _193 = fma(_163, _153, _191);
    float _195 = _179 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _197 = -_139;
    float _199 = _197 + _163;
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _203 = _189 + _201;
    float _205 = _187 * _175;
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _209 = _195 + _207;
    float _211 = _183 * _199;
    float _213 = _203 * _203;
    float _215 = -_205;
    float _217 = fma(_167, _199, _215);
    float _219 = _167 * _193;
    float _221 = -_211;
    float _223 = fma(_187, _193, _221);
    float _225 = fma(_209, _209, _213);
    float _227 = _217 * _217;
    float _229 = -_219;
    float _231 = fma(_183, _175, _229);
    float _233 = sqrt(_225);
    float _235 = fma(_223, _223, _227);
    float _237 = _147 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _239 = fma(_231, _231, _235);
    float _241 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[31].x, _237);
    float _243 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[31].z, _241);
    float _245 = rsqrt(_239);
    float _247 = _243 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _251 = _233 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _253 = _223 * _245;
    float _255 = _217 * _245;
    float _257 = _231 * _245;
    float _259 = _231;
    float _261 = _237;
    float _263 = _245;
    float _265 = _139;
    if (!_251)
    {
        _259 = _195;
    }
    float _267 = _259;
    float _269 = _267;
    if (!_251)
    {
        _261 = _189;
    }
    float _271 = _261;
    float _273 = _271;
    if (!_251)
    {
        _263 = _247;
    }
    float _275 = _263;
    bool _277 = !_251;
    float _279 = _275;
    if (!_277)
    {
        float _281 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _283 = _233 + _281;
        float _285 = _247 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _287 = rsqrt(_225);
        float _289 = -_247;
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = _289 + _291;
        float _295 = abs(_285);
        float _297 = abs(_283);
        float _299 = precise::max(_295, _297);
        float _301 = _293 * _293;
        bool _303 = _299 >= 16.0;
        float _305 = _209 * _287;
        float _307 = _203 * _287;
        float _309 = -_209;
        float _311 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[41].z, _309);
        float _313 = -_203;
        float _315 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = _283;
        float _319 = _285;
        int _322 = as_type<int>(_299);
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
        _269 = _528;
        _273 = _530;
    }
    float _532 = _279;
    float _534 = _269;
    float _536 = _273;
    float _538 = _255 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _540 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[35].x, _538);
    float _542 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[35].z, _540);
    float _544 = -_542;
    float _546 = fma(_544, _542, 1.0);
    float _548 = -_542;
    float _550 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[35].z, _257);
    float _552 = -_542;
    float _554 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[35].y, _255);
    float _556 = -_542;
    float _558 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[35].x, _253);
    float _560 = _546 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _562 = fma(_550, _560, _139);
    float _564 = fma(_554, _560, _147);
    float _566 = fma(_558, _560, _149);
    float _568 = -_562;
    bool _570 = _568 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _572 = float(_570);
    float _574 = -_562;
    bool _576 = _574 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _578 = float(_576);
    float _580 = _572 + _578;
    float _582 = precise::min(_580, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _584 = trunc(_582);
    int _586 = int(_584);
    int _588 = _586 << 6;
    bool _590 = _586 != 0;
    int _592 = _588 + 48;
    uint _595 = uint(int(uint(_592) >> uint(2)));
    uint _597 = uint(int(uint(int(_595)) >> uint(2)));
    int _599 = int(_595) & 3;
    float _601 = (*spvDescriptorSet0.fp_c3)._m0[int(_597)][_599];
    int _603 = int(_595) + 1;
    uint _605 = uint(int(uint(_603) >> uint(2)));
    int _607 = _603 & 3;
    float _609 = (*spvDescriptorSet0.fp_c3)._m0[int(_605)][_607];
    int _611 = _588 + 56;
    uint _613 = uint(int(uint(_611) >> uint(2)));
    uint _615 = uint(int(uint(int(_613)) >> uint(2)));
    int _617 = int(_613) & 3;
    float _619 = (*spvDescriptorSet0.fp_c3)._m0[int(_615)][_617];
    int _621 = int(_613) + 1;
    uint _623 = uint(int(uint(_621) >> uint(2)));
    int _625 = _621 & 3;
    float _627 = (*spvDescriptorSet0.fp_c3)._m0[int(_623)][_625];
    uint _629 = uint(int(uint(_588) >> uint(2)));
    uint _631 = uint(int(uint(int(_629)) >> uint(2)));
    int _633 = int(_629) & 3;
    float _635 = (*spvDescriptorSet0.fp_c3)._m0[int(_631)][_633];
    int _637 = int(_629) + 1;
    uint _639 = uint(int(uint(_637) >> uint(2)));
    int _641 = _637 & 3;
    float _643 = (*spvDescriptorSet0.fp_c3)._m0[int(_639)][_641];
    int _645 = _588 + 16;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.fp_c3)._m0[int(_657)][_659];
    int _663 = _588 + 32;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    uint _667 = uint(int(uint(int(_665)) >> uint(2)));
    int _669 = int(_665) & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    int _673 = int(_665) + 1;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    int _677 = _673 & 3;
    float _679 = (*spvDescriptorSet0.fp_c3)._m0[int(_675)][_677];
    int _681 = _588 + 8;
    uint _683 = uint(int(uint(_681) >> uint(2)));
    uint _685 = uint(int(uint(int(_683)) >> uint(2)));
    int _687 = int(_683) & 3;
    float _689 = (*spvDescriptorSet0.fp_c3)._m0[int(_685)][_687];
    int _691 = int(_683) + 1;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    int _695 = _691 & 3;
    float _697 = (*spvDescriptorSet0.fp_c3)._m0[int(_693)][_695];
    int _699 = _588 + 24;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    uint _703 = uint(int(uint(int(_701)) >> uint(2)));
    int _705 = int(_701) & 3;
    float _707 = (*spvDescriptorSet0.fp_c3)._m0[int(_703)][_705];
    int _709 = int(_701) + 1;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    int _713 = _709 & 3;
    float _715 = (*spvDescriptorSet0.fp_c3)._m0[int(_711)][_713];
    float _717 = _564 * _609;
    float _719 = fma(_566, _601, _717);
    int _721 = _588 + 40;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    uint _725 = uint(int(uint(int(_723)) >> uint(2)));
    int _727 = int(_723) & 3;
    float _729 = (*spvDescriptorSet0.fp_c3)._m0[int(_725)][_727];
    int _731 = int(_723) + 1;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    int _735 = _731 & 3;
    float _737 = (*spvDescriptorSet0.fp_c3)._m0[int(_733)][_735];
    float _739 = fma(_562, _619, _719);
    float _741 = _739 + _627;
    float _743 = _564 * _643;
    float _745 = 1.0 / _741;
    float _747 = fma(_566, _635, _743);
    float _749 = _564 * _661;
    float _751 = fma(_566, _653, _749);
    float _753 = _564 * _679;
    float _755 = fma(_566, _671, _753);
    float _757 = fma(_562, _689, _747);
    float _759 = _757 + _697;
    float _761 = fma(_562, _707, _751);
    float _763 = _759 * _745;
    float _765 = _761 + _715;
    float _767 = fma(_562, _729, _755);
    float _769 = _765 * _745;
    float _771 = _767 + _737;
    float _773 = _771 * _745;
    float _775 = precise::clamp(_773, 0.0, 1.0);
    float _831;
    if (!_590)
    {
        float _777 = rint(_582);
        float _779 = precise::max(_777, 0.0);
        uint _781 = uint(_779);
        uint _783 = clamp(_781, 0u, 65535u);
        float _785 = _775 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _787 = fma(_785, 0.5, _769);
        float _789 = fma(_785, 0.5, _763);
        float _791 = fma(_785, -0.5, _763);
        float _793 = fma(_785, -0.5, _769);
        float3 _2242 = float3(_763, _787, float(int(_783)));
        float3 _2246 = select(_2242, float3(0.0), isnan(_2242));
        float _795 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2246.xy, uint(rint(_2246.z)), _775);
        float3 _2255 = float3(_789, _787, float(int(_783)));
        float3 _2257 = select(_2255, float3(0.0), isnan(_2255));
        float _797 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2257.xy, uint(rint(_2257.z)), _775);
        float3 _2266 = float3(_791, _787, float(int(_783)));
        float3 _2268 = select(_2266, float3(0.0), isnan(_2266));
        float _799 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2268.xy, uint(rint(_2268.z)), _775);
        float3 _2277 = float3(_789, _769, float(int(_783)));
        float3 _2279 = select(_2277, float3(0.0), isnan(_2277));
        float _801 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2279.xy, uint(rint(_2279.z)), _775);
        float3 _2288 = float3(_763, _769, float(int(_783)));
        float3 _2290 = select(_2288, float3(0.0), isnan(_2288));
        float _803 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2290.xy, uint(rint(_2290.z)), _775);
        float3 _2299 = float3(_791, _769, float(int(_783)));
        float3 _2301 = select(_2299, float3(0.0), isnan(_2299));
        float _805 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2301.xy, uint(rint(_2301.z)), _775);
        float3 _2310 = float3(_789, _793, float(int(_783)));
        float3 _2312 = select(_2310, float3(0.0), isnan(_2310));
        float _807 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2312.xy, uint(rint(_2312.z)), _775);
        float3 _2321 = float3(_763, _793, float(int(_783)));
        float3 _2323 = select(_2321, float3(0.0), isnan(_2321));
        float _809 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2323.xy, uint(rint(_2323.z)), _775);
        float3 _2332 = float3(_791, _793, float(int(_783)));
        float3 _2334 = select(_2332, float3(0.0), isnan(_2332));
        float _811 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2334.xy, uint(rint(_2334.z)), _775);
        float _813 = _797 + _795;
        float _815 = _813 + _799;
        float _817 = _815 + _801;
        float _819 = _817 + _803;
        float _821 = _819 + _805;
        float _823 = _821 + _807;
        float _825 = _823 + _809;
        float _827 = _825 + _811;
        float _829 = _827 * 0.111111111938953399658203125;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = rint(_582);
        float _837 = precise::max(_835, 0.0);
        uint _839 = uint(_837);
        uint _841 = clamp(_839, 0u, 65535u);
        float3 _2381 = float3(_763, _769, float(int(_841)));
        float3 _2383 = select(_2381, float3(0.0), isnan(_2381));
        float _843 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2383.xy, uint(rint(_2383.z)), _775);
        _831 = _843;
    }
    _833 = false;
    float _845 = _831;
    float _847 = _532 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _849 = _532 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _851 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].x, _847);
    float _853 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].x, _849);
    float _855 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].z, _851);
    float _857 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].z, _853);
    float _859 = _855 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _861 = _857 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _863 = trunc(_859);
    int _865 = int(_863);
    float _867 = trunc(_861);
    int _869 = int(_867);
    int _871 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _873 = _865 + _871;
    int _875 = _873 + 1;
    float _877 = -_139;
    float _879 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _881 = _877 + _879;
    bool _883 = _875 >= 0;
    int _885 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _887 = _869 + _885;
    int _889 = _887 + 1;
    float _891 = -_139;
    float _893 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _895 = _891 + _893;
    bool _897 = _875 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _899 = !_883;
    bool _901 = _897 || _899;
    bool _903 = _889 < 0;
    bool _905 = _903 || _901;
    bool _907 = _889 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _909 = _907 || _905;
    if (_909)
    {
        _265 = 1.0;
    }
    float _911 = _265;
    float _913 = _911;
    if (!_909)
    {
        int _915 = _889 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _917 = _915 + _875;
        float _919 = floor(_861);
        int _921 = _917 << 2;
        int _923 = _917 >> 2;
        int _925 = 12 & _921;
        int _927 = _923 << 4;
        int _929 = _927 + _925;
        float _931 = floor(_859);
        uint _933 = uint(int(uint(_929) >> uint(2)));
        uint _935 = uint(int(uint(int(_933)) >> uint(2)));
        int _937 = int(_933) & 3;
        float _939 = (*spvDescriptorSet0.fp_c5)._m0[int(_935)][_937];
        float _941 = -_919;
        float _943 = _861 + _941;
        float _945 = -_931;
        float _947 = _859 + _945;
        float _949 = rint(_939);
        float _951 = precise::max(_949, 0.0);
        uint _953 = uint(_951);
        uint _955 = clamp(_953, 0u, 65535u);
        float3 _2568 = float3(_947, _943, float(int(_955)));
        float3 _2570 = select(_2568, float3(0.0), isnan(_2568));
        float _957 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2570.xy, uint(rint(_2570.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2570.xy, uint(rint(_2570.z)), level(0.0)).x;
        int _959 = _917 << 4;
        int _961 = _959 + 1648;
        int _963 = _929 + 8048;
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
        float _1007 = _971 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1009 = _532 * _987;
        float _1011 = fma(_534, _979, _1009);
        float _1013 = 1.0 / _971;
        float _1015 = fma(_536, _997, _1011);
        float _1017 = _1015 + _1005;
        float _1019 = precise::clamp(_1017, 0.0, 1.0);
        float _1021 = -_1019;
        float _1023 = _1021 + _957;
        float _1025 = fma(_1013, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1023);
        float _1027 = _1007 * _1025;
        float _1029 = exp2(_1027);
        float _1031 = 0.0 + _1029;
        float _1033 = precise::clamp(_1031, 0.0, 1.0);
        _913 = _1033;
    }
    float _1035 = _913;
    float _1037 = precise::min(_1035, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1039 = _881 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1041 = precise::clamp(_1039, 0.0, 1.0);
    float _1043 = -_845;
    float _1045 = _1043 + 1.0;
    float _1047 = _895 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1049 = precise::clamp(_1047, 0.0, 1.0);
    float _1051 = -_1037;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_1041, _1045, _845);
    float _1057 = fma(_1049, _1053, _1037);
    out.m_52.x = _1055;
    out.m_52.y = _1057;
    out.m_52.z = 1.0;
    out.m_52.w = 1.0;
    out.m_54.x = 1.0;
    out.m_54.y = 0.5;
    out.m_54.z = 0.5;
    out.m_54.w = 1.0;
    return out;
}

