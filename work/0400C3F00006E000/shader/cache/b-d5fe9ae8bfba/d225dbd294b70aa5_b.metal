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
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_14 [[id(13)]];
    sampler fp_t_tcb_14Smplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_E [[id(15)]];
    sampler fp_t_tcb_ESmplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_14Smplr_w [[id(19)]];
    sampler fp_t_tcb_ESmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
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
    float2 _1288 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1288, float2(0.0), isnan(_1288))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1288, float2(0.0), isnan(_1288))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1303 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1303, float2(0.0), isnan(_1303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1303, float2(0.0), isnan(_1303))).x;
    float2 _1311 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1311, float2(0.0), isnan(_1311))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1311, float2(0.0), isnan(_1311))).x;
    float _99 = in.m_53.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_53.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_55.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_57.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_55.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_57.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _83 * _103;
    float _137 = _83 * _109;
    float _139 = _83 * _115;
    float _141 = _83 * _121;
    float _143 = _83 * _127;
    float _145 = _83 * _133;
    float _147 = -_91;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _151 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[41].x, _149);
    float _153 = _151 * _135;
    float _155 = _151 * _137;
    float _157 = _153 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _159 = _153 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _161 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[32].x, _157);
    float _163 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[30].x, _159);
    float _165 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].z, _161);
    float _167 = -_95;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _171 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[41].x, _169);
    float _173 = -_97;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[41].x, _175);
    float _179 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].z, _163);
    float _181 = _165 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _183 = -_155;
    float _185 = fma(_171, _139, _183);
    float _187 = -_151;
    float _189 = _187 + _171;
    float _191 = -_155;
    float _193 = fma(_177, _141, _191);
    float _195 = _179 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _199 = _181 + _197;
    float _201 = -_153;
    float _203 = fma(_177, _145, _201);
    float _205 = -_153;
    float _207 = fma(_171, _143, _205);
    float _209 = -_151;
    float _211 = _209 + _177;
    float _213 = _189 * _193;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _217 = _195 + _215;
    float _219 = _199 * _199;
    float _221 = _207 * _211;
    float _223 = -_213;
    float _225 = fma(_185, _211, _223);
    float _227 = _185 * _203;
    float _229 = fma(_217, _217, _219);
    float _231 = -_221;
    float _233 = fma(_189, _203, _231);
    float _235 = _225 * _225;
    float _237 = -_227;
    float _239 = fma(_207, _193, _237);
    float _241 = sqrt(_229);
    float _243 = fma(_233, _233, _235);
    float _245 = _153 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _247 = fma(_239, _239, _243);
    float _249 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[31].x, _245);
    float _251 = rsqrt(_247);
    float _253 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].z, _249);
    float _255 = _253 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _259 = _241 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _233 * _251;
    float _263 = _225 * _251;
    float _265 = _239 * _251;
    float _267 = _239;
    float _269 = _195;
    float _271 = _181;
    if (!_259)
    {
        _267 = _195;
    }
    float _273 = _267;
    float _275 = _273;
    if (!_259)
    {
        _269 = _255;
    }
    float _277 = _269;
    bool _279 = !_259;
    float _281 = _277;
    if (!_279)
    {
        float _283 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _285 = _241 + _283;
        float _287 = _255 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _289 = rsqrt(_229);
        float _291 = -_255;
        float _293 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _295 = _291 + _293;
        float _297 = abs(_287);
        float _299 = abs(_285);
        float _301 = precise::max(_297, _299);
        float _303 = _295 * _295;
        bool _305 = _301 >= 16.0;
        float _307 = _217 * _289;
        float _309 = _199 * _289;
        float _311 = -_217;
        float _313 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[41].z, _311);
        float _315 = -_199;
        float _317 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _315);
        float _319 = _285;
        float _321 = _287;
        int _324 = as_type<int>(_317);
        if (_305)
        {
            float _326 = _285 * 0.0625;
            _319 = _326;
        }
        float _328 = _319;
        if (_305)
        {
            float _330 = _287 * 0.0625;
            _321 = _330;
        }
        float _332 = _321;
        float _334 = fma(_313, _313, _303);
        float _336 = abs(_328);
        bool _338 = _336 != 0.0;
        bool _340 = isnan(_336);
        bool _342 = _338 || _340;
        bool _344 = isnan(0.0);
        bool _346 = _342 || _344;
        float _348 = fma(_317, _317, _334);
        float _350 = abs(_332);
        bool _352 = _350 == 0.0;
        float _354 = abs(_332);
        bool _356 = _354 == 0.0;
        bool _358 = !_346;
        bool _360 = _356 && _358;
        float _362 = sqrt(_348);
        bool _364 = false;
        if (_360)
        {
            bool _366 = as_type<int>(_332) >= 0;
            _364 = _366;
        }
        bool _368 = _364;
        int _370 = _368 ? (-1) : 0;
        if (_360)
        {
            int _372 = _368 ? 0 : 1078530011;
            _324 = _372;
        }
        int _374 = _324;
        int _376 = _374;
        if (_360)
        {
            int _378 = int(0x80000000) & as_type<int>(_328);
            int _380 = _374 | _378;
            _376 = _380;
        }
        int _382 = _376;
        bool _384 = !_346;
        bool _386 = _384 && _352;
        int _388 = _382;
        float _390 = as_type<float>(_382);
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
                _370 = _416 ? (-1) : 0;
            }
            int _418 = _370;
            if (_414)
            {
                _388 = 1075235812;
            }
            int _420 = _388;
            int _422 = _420;
            if (_414)
            {
                int _424 = ~_418;
                int _426 = (_424 != 0) ? _420 : 1061752795;
                _422 = _426;
            }
            int _428 = _422;
            float _430 = as_type<float>(_428);
            if (_414)
            {
                int _432 = int(0x80000000) & as_type<int>(_328);
                int _434 = _428 | _432;
                _430 = as_type<float>(_434);
            }
            float _436 = _430;
            bool _438 = !_402;
            bool _440 = _438 && _406;
            _390 = _436;
            if (!_440)
            {
                float _442 = abs(_328);
                float _444 = abs(_332);
                float _446 = precise::max(_442, _444);
                float _448 = abs(_328);
                float _450 = abs(_332);
                float _452 = precise::min(_448, _450);
                float _454 = 1.0 / _446;
                float _456 = abs(_328);
                float _458 = abs(_332);
                bool _460 = _456 > _458;
                bool _462 = as_type<int>(_332) >= 0;
                float _464 = _452 * _454;
                float _466 = abs(_328);
                float _468 = abs(_332);
                float _470 = _466 + _468;
                int _472 = as_type<int>(_328) & int(0x80000000);
                float _474 = _464 * _464;
                bool _476 = _470 > as_type<float>(0x7f800000u /* inf */);
                bool _478 = isnan(_470);
                bool _480 = _476 || _478;
                bool _482 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _484 = _480 || _482;
                float _486 = _474 + 11.33538818359375;
                float _488 = fma(_474, _486, 28.84246826171875);
                float _490 = fma(_474, _488, 19.6966705322265625);
                float _492 = fma(_474, -0.82336294651031494140625, -5.674867153167724609375);
                float _494 = fma(_474, _492, -6.565555095672607421875);
                float _496 = 1.0 / _490;
                float _498 = _474 * _494;
                float _500 = _464 * _498;
                float _502 = fma(_500, _496, _464);
                float _504 = _502;
                _390 = _470;
                if (_460)
                {
                    float _506 = -_502;
                    float _508 = _506 + 1.57079637050628662109375;
                    _504 = _508;
                }
                float _510 = _504;
                int _512 = as_type<int>(_510);
                if (!_462)
                {
                    float _514 = -_510;
                    float _516 = _514 + 3.1415927410125732421875;
                    _512 = as_type<int>(_516);
                }
                int _518 = _512;
                if (!_484)
                {
                    int _520 = _472 | _518;
                    _390 = as_type<float>(_520);
                }
            }
        }
        float _522 = _390;
        float _524 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _526 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _528 = _362 + _526;
        float _530 = fma(_307, _524, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _532 = fma(_309, _524, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _281 = _528;
        _275 = _530;
        _271 = _532;
    }
    float _534 = _281;
    float _536 = _275;
    float _538 = _271;
    float2 _1987 = float2(_85, _87);
    float2 _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1987, float2(0.0), isnan(_1987))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1987, float2(0.0), isnan(_1987))).xy;
    float _544 = _542.x;
    float _546 = _542.y;
    float _548 = _263 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _550 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].x, _548);
    float _552 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].z, _550);
    float _554 = -_552;
    float _556 = fma(_554, _552, 1.0);
    float _558 = -_552;
    float _560 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[35].z, _265);
    float _562 = -_552;
    float _564 = fma(_562, (*spvDescriptorSet0.fp_c3)._m0[35].y, _263);
    float _566 = -_552;
    float _568 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[35].x, _261);
    float _570 = _556 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _572 = fma(_560, _570, _151);
    float _574 = fma(_564, _570, _153);
    float _576 = fma(_568, _570, _155);
    float _578 = -_572;
    bool _580 = _578 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _582 = float(_580);
    float _584 = -_572;
    bool _586 = _584 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _588 = float(_586);
    float _590 = _582 + _588;
    float _592 = precise::min(_590, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _594 = trunc(_592);
    int _596 = int(_594);
    float _598 = rint(_592);
    float _600 = precise::max(_598, 0.0);
    uint _603 = uint(_600);
    uint _605 = clamp(_603, 0u, 65535u);
    int _607 = _596 << 6;
    int _609 = _607 + 48;
    uint _611 = uint(int(uint(_609) >> uint(2)));
    uint _613 = uint(int(uint(int(_611)) >> uint(2)));
    int _615 = int(_611) & 3;
    float _617 = (*spvDescriptorSet0.fp_c3)._m0[int(_613)][_615];
    int _619 = int(_611) + 1;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    int _623 = _619 & 3;
    float _625 = (*spvDescriptorSet0.fp_c3)._m0[int(_621)][_623];
    int _627 = _607 + 56;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    uint _631 = uint(int(uint(int(_629)) >> uint(2)));
    int _633 = int(_629) & 3;
    float _635 = (*spvDescriptorSet0.fp_c3)._m0[int(_631)][_633];
    int _637 = int(_629) + 1;
    uint _639 = uint(int(uint(_637) >> uint(2)));
    int _641 = _637 & 3;
    float _643 = (*spvDescriptorSet0.fp_c3)._m0[int(_639)][_641];
    int _645 = _607 + 16;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.fp_c3)._m0[int(_657)][_659];
    int _663 = _607 + 32;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    uint _667 = uint(int(uint(int(_665)) >> uint(2)));
    int _669 = int(_665) & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    int _673 = int(_665) + 1;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    int _677 = _673 & 3;
    float _679 = (*spvDescriptorSet0.fp_c3)._m0[int(_675)][_677];
    uint _681 = uint(int(uint(_607) >> uint(2)));
    uint _683 = uint(int(uint(int(_681)) >> uint(2)));
    int _685 = int(_681) & 3;
    float _687 = (*spvDescriptorSet0.fp_c3)._m0[int(_683)][_685];
    int _689 = int(_681) + 1;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    int _693 = _689 & 3;
    float _695 = (*spvDescriptorSet0.fp_c3)._m0[int(_691)][_693];
    int _697 = _607 + 24;
    uint _699 = uint(int(uint(_697) >> uint(2)));
    uint _701 = uint(int(uint(int(_699)) >> uint(2)));
    int _703 = int(_699) & 3;
    float _705 = (*spvDescriptorSet0.fp_c3)._m0[int(_701)][_703];
    int _707 = int(_699) + 1;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    int _711 = _707 & 3;
    float _713 = (*spvDescriptorSet0.fp_c3)._m0[int(_709)][_711];
    int _715 = _607 + 40;
    uint _717 = uint(int(uint(_715) >> uint(2)));
    uint _719 = uint(int(uint(int(_717)) >> uint(2)));
    int _721 = int(_717) & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    int _725 = int(_717) + 1;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    int _729 = _725 & 3;
    float _731 = (*spvDescriptorSet0.fp_c3)._m0[int(_727)][_729];
    float _733 = _574 * _625;
    float _735 = fma(_576, _617, _733);
    int _737 = _607 + 8;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    uint _741 = uint(int(uint(int(_739)) >> uint(2)));
    int _743 = int(_739) & 3;
    float _745 = (*spvDescriptorSet0.fp_c3)._m0[int(_741)][_743];
    int _747 = int(_739) + 1;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    int _751 = _747 & 3;
    float _753 = (*spvDescriptorSet0.fp_c3)._m0[int(_749)][_751];
    float _755 = fma(_572, _635, _735);
    float _757 = _755 + _643;
    float _759 = _574 * _661;
    float _761 = 1.0 / _757;
    float _763 = fma(_576, _653, _759);
    float _765 = _574 * _679;
    float _767 = fma(_576, _671, _765);
    float _769 = _574 * _695;
    float _771 = fma(_576, _687, _769);
    float _773 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _775 = fma(_572, _705, _763);
    float _777 = _775 + _713;
    float _779 = fma(_572, _723, _767);
    float _781 = _777 * _761;
    float _783 = _779 + _731;
    float _785 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float _787 = fma(_572, _745, _771);
    float _789 = _783 * _761;
    float _791 = precise::clamp(_789, 0.0, 1.0);
    float _793 = _787 + _753;
    float2 _2416 = float2(_773, _785);
    float4 _796 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2416, float2(0.0), isnan(_2416)), int2(0), component::x).xyzw;
    float _798 = _796.x;
    float _800 = _796.y;
    float _802 = _796.z;
    float _804 = _796.w;
    float _806 = _793 * _761;
    float3 _2439 = float3(_806, _781, float(int(_605)));
    float3 _2443 = select(_2439, float3(0.0), isnan(_2439));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2443.xy, uint(rint(_2443.z)), _791);
    float2 _2449 = float2(_773, _785);
    float4 _810 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2449, float2(0.0), isnan(_2449)), int2(0), component::x).xyzw;
    float _812 = _810.x;
    float _814 = _810.y;
    float _816 = _810.z;
    float _818 = _810.w;
    float2 _2465 = float2(_773, _785);
    float4 _820 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2465, float2(0.0), isnan(_2465)), int2(0), component::w).xyzw;
    float _822 = _820.x;
    float _824 = _820.y;
    float _826 = _820.z;
    float _828 = _820.w;
    float _830 = fma(_544, 2.0, -1.0);
    float _832 = fma(_546, 2.0, -1.0);
    float _834 = _830 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _836 = _832 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _838 = fma(_834, 2.0, _85);
    float _840 = fma(_836, 2.0, _87);
    float2 _2501 = float2(_838, _840);
    float2 _842 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2501, float2(0.0), isnan(_2501))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2501, float2(0.0), isnan(_2501))).yz;
    float _844 = _842.x;
    float _846 = _842.y;
    float _848 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _850 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _852 = precise::min(_151, -1.0000000116860974230803549289703e-07);
    float _854 = floor(_848);
    float _856 = floor(_850);
    float _858 = -_854;
    float _860 = _848 + _858;
    float _862 = 1.0 / _852;
    float _864 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _866 = _860 + _864;
    float _868 = -_856;
    float _870 = _850 + _868;
    float _872 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _874 = _870 + _872;
    float _876 = -_866;
    float _878 = _876 + 1.0;
    float _880 = -_874;
    float _882 = _880 + 1.0;
    float _884 = _874 * _878;
    float _886 = _866 * _874;
    float _888 = _878 * _882;
    float _890 = _866 * _882;
    float _892 = _862 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _894 = -_800;
    float _896 = fma(_894, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _898 = -_798;
    float _900 = fma(_898, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _902 = -_802;
    float _904 = fma(_902, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _906 = -_804;
    float _908 = fma(_906, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _910 = _534 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _912 = 1.0 / _900;
    float _914 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].x, _910);
    float _916 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].z, _914);
    float _918 = 1.0 / _896;
    float _920 = 1.0 / _904;
    float _922 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _924 = -_151;
    float _926 = fma(_912, _922, _924);
    float _928 = abs(_926);
    float _930 = _928 * _892;
    float _932 = 1.0 / _908;
    float _934 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _936 = -_151;
    float _938 = fma(_918, _934, _936);
    float _940 = _534 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _942 = abs(_938);
    float _944 = _942 * _892;
    float _946 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].x, _940);
    float _948 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _950 = -_151;
    float _952 = fma(_920, _948, _950);
    float _954 = exp2(_930);
    float _956 = abs(_952);
    float _958 = _956 * _892;
    float _960 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _962 = -_151;
    float _964 = fma(_932, _960, _962);
    float _966 = exp2(_944);
    float _968 = abs(_964);
    float _970 = _968 * _892;
    float _972 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].z, _946);
    float _974 = exp2(_958);
    float _976 = _972 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _978 = abs(_884);
    float _980 = _978 * _954;
    float _982 = exp2(_970);
    float _984 = abs(_886);
    float _986 = _984 * _966;
    float _988 = _916 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _990 = trunc(_976);
    int _992 = int(_990);
    float _994 = abs(_890);
    float _996 = _994 * _974;
    float _998 = _980 + _986;
    float _1000 = _996 + _998;
    float _1002 = trunc(_988);
    int _1004 = int(_1002);
    float _1006 = abs(_888);
    float _1008 = _1006 * _982;
    float _1010 = _1008 + _1000;
    float _1012 = -_1008;
    bool _1014 = _1000 != _1012;
    bool _1016 = isnan(_1000);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(_1012);
    bool _1022 = _1018 || _1020;
    int _1024 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1026 = _992 + _1024;
    int _1028 = _1026 + 1;
    float _1030 = 1.0 / _1010;
    bool _1032 = _1028 >= 0;
    int _1034 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1036 = _1004 + _1034;
    int _1038 = _1036 + 1;
    bool _1040 = _1028 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1042 = !_1032;
    bool _1044 = _1040 || _1042;
    bool _1046 = _1038 < 0;
    bool _1048 = _1046 || _1044;
    bool _1050 = _1038 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1052 = _1050 || _1048;
    float _1054 = _986 * _1030;
    float _1056 = _980 * _1030;
    float _1058 = _996 * _1030;
    float _1060 = _1022 ? _1054 : 0.25;
    float _1062 = _1022 ? _1056 : 0.25;
    float _1064 = _1060 * _814;
    float _1066 = _980;
    if (_1052)
    {
        _1066 = 1.0;
    }
    float _1068 = _1066;
    float _1070 = _1068;
    if (!_1052)
    {
        int _1072 = _1038 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1074 = _1072 + _1028;
        float _1076 = floor(_988);
        int _1078 = _1074 << 2;
        int _1080 = _1074 >> 2;
        int _1082 = 12 & _1078;
        float _1084 = floor(_976);
        int _1086 = _1080 << 4;
        int _1088 = _1086 + _1082;
        uint _1090 = uint(int(uint(_1088) >> uint(2)));
        uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
        int _1094 = int(_1090) & 3;
        float _1096 = (*spvDescriptorSet0.fp_c5)._m0[int(_1092)][_1094];
        float _1098 = -_1076;
        float _1100 = _988 + _1098;
        float _1102 = -_1084;
        float _1104 = _976 + _1102;
        float _1106 = rint(_1096);
        float _1108 = precise::max(_1106, 0.0);
        uint _1110 = uint(_1108);
        uint _1112 = clamp(_1110, 0u, 65535u);
        float3 _2897 = float3(_1104, _1100, float(int(_1112)));
        float3 _2899 = select(_2897, float3(0.0), isnan(_2897));
        float _1114 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2899.xy, uint(rint(_2899.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2899.xy, uint(rint(_2899.z)), level(0.0)).x;
        int _1116 = _1074 << 4;
        int _1118 = _1116 + 1648;
        int _1120 = _1088 + 8048;
        uint _1122 = uint(int(uint(_1120) >> uint(2)));
        uint _1124 = uint(int(uint(int(_1122)) >> uint(2)));
        int _1126 = int(_1122) & 3;
        float _1128 = (*spvDescriptorSet0.fp_c5)._m0[int(_1124)][_1126];
        uint _1130 = uint(int(uint(_1118) >> uint(2)));
        uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
        int _1134 = int(_1130) & 3;
        float _1136 = (*spvDescriptorSet0.fp_c5)._m0[int(_1132)][_1134];
        int _1138 = int(_1130) + 1;
        uint _1140 = uint(int(uint(_1138) >> uint(2)));
        int _1142 = _1138 & 3;
        float _1144 = (*spvDescriptorSet0.fp_c5)._m0[int(_1140)][_1142];
        int _1146 = _1118 + 8;
        uint _1148 = uint(int(uint(_1146) >> uint(2)));
        uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
        int _1152 = int(_1148) & 3;
        float _1154 = (*spvDescriptorSet0.fp_c5)._m0[int(_1150)][_1152];
        int _1156 = int(_1148) + 1;
        uint _1158 = uint(int(uint(_1156) >> uint(2)));
        int _1160 = _1156 & 3;
        float _1162 = (*spvDescriptorSet0.fp_c5)._m0[int(_1158)][_1160];
        float _1164 = _1128 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1166 = _534 * _1144;
        float _1168 = fma(_536, _1136, _1166);
        float _1170 = 1.0 / _1128;
        float _1172 = fma(_538, _1154, _1168);
        float _1174 = _1172 + _1162;
        float _1176 = precise::clamp(_1174, 0.0, 1.0);
        float _1178 = -_1176;
        float _1180 = _1178 + _1114;
        float _1182 = fma(_1170, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1180);
        float _1184 = _1164 * _1182;
        float _1186 = exp2(_1184);
        float _1188 = 0.0 + _1186;
        float _1190 = precise::clamp(_1188, 0.0, 1.0);
        _1070 = _1190;
    }
    float _1192 = _1070;
    float _1194 = _1060 * _824;
    float _1196 = _1008 * _1030;
    float _1198 = precise::min(_1192, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1200 = -_151;
    float _1202 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1204 = _1200 + _1202;
    float _1206 = _1022 ? _1058 : 0.25;
    float _1208 = fma(_1062, _812, _1064);
    float _1210 = fma(_1062, _822, _1194);
    float _1212 = -_151;
    float _1214 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1216 = _1212 + _1214;
    float _1218 = _1204 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1220 = precise::clamp(_1218, 0.0, 1.0);
    float _1222 = -_1198;
    float _1224 = _1222 + 1.0;
    float _1226 = _1022 ? _1196 : 0.25;
    float _1228 = fma(_1206, _816, _1208);
    float _1230 = fma(_1206, _826, _1210);
    float _1232 = _1216 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1234 = precise::clamp(_1232, 0.0, 1.0);
    float _1236 = fma(_1220, _1224, _1198);
    float _1238 = -_808;
    float _1240 = _1238 + 1.0;
    float _1242 = fma(_1226, _818, _1228);
    float _1244 = fma(_1226, _828, _1230);
    float _1246 = fma(_1234, _1240, _808);
    float _1248 = precise::min(_1242, 1.0);
    float _1250 = precise::min(_1244, 1.0);
    out.m_60.x = _1246;
    out.m_60.y = _1236;
    out.m_60.z = _1250;
    out.m_60.w = 1.0;
    out.m_62.x = _1248;
    out.m_62.y = _844;
    out.m_62.z = _846;
    out.m_62.w = 1.0;
    return out;
}

