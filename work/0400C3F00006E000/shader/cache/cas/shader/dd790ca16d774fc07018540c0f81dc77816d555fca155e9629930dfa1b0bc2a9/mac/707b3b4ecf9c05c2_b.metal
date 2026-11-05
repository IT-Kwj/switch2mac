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
    texture2d<float> fp_t_tcb_14 [[id(7)]];
    sampler fp_t_tcb_14Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_16 [[id(9)]];
    sampler fp_t_tcb_16Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d<float> fp_t_tcb_E [[id(13)]];
    sampler fp_t_tcb_ESmplr [[id(14)]];
    texture2d<float> fp_t_tcb_12 [[id(15)]];
    sampler fp_t_tcb_12Smplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_10 [[id(17)]];
    sampler fp_t_tcb_10Smplr [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_ASmplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    sampler fp_t_tcb_16Smplr_w [[id(22)]];
    sampler fp_t_tcb_ESmplr_w [[id(23)]];
    sampler fp_t_tcb_12Smplr_w [[id(24)]];
    sampler fp_t_tcb_10Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
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
    float2 _1149 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1149, float2(0.0), isnan(_1149))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1149, float2(0.0), isnan(_1149))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1164 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1164, float2(0.0), isnan(_1164))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1164, float2(0.0), isnan(_1164))).x;
    float2 _1172 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1172, float2(0.0), isnan(_1172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1172, float2(0.0), isnan(_1172))).x;
    float _101 = in.m_55.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_55.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_57.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_57.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_59.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_59.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _85 * _105;
    float _139 = _85 * _117;
    float _141 = _85 * _123;
    float _143 = -_93;
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _147 = 1.0 / _145;
    float _149 = -_97;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _153 = -_99;
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _157 = _85 * _111;
    float _159 = 1.0 / _151;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _163 = _147 * _161;
    float _165 = 1.0 / _155;
    float _167 = _85 * _129;
    float _169 = _85 * _135;
    float _171 = _163 * _137;
    float _173 = _163 * _157;
    float _175 = _171 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _179 = _159 * _177;
    float _181 = _171 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[32].x, _175);
    float _185 = -_173;
    float _187 = fma(_179, _139, _185);
    float _189 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[30].x, _181);
    float _191 = -_171;
    float _193 = fma(_179, _141, _191);
    float _195 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[32].z, _183);
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _199 = _165 * _197;
    float _201 = -_163;
    float _203 = _201 + _179;
    float _205 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[30].z, _189);
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _209 = -_173;
    float _211 = fma(_199, _167, _209);
    float _213 = -_171;
    float _215 = fma(_199, _169, _213);
    float _217 = _205 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _221 = _207 + _219;
    float _223 = -_163;
    float _225 = _223 + _199;
    float _227 = _203 * _211;
    float _229 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _231 = _217 + _229;
    float _233 = _221 * _221;
    float _235 = _193 * _225;
    float _237 = -_227;
    float _239 = fma(_187, _225, _237);
    float _241 = _187 * _215;
    float _243 = fma(_231, _231, _233);
    float _245 = -_235;
    float _247 = fma(_203, _215, _245);
    float _249 = _239 * _239;
    float _251 = -_241;
    float _253 = fma(_193, _211, _251);
    float _255 = sqrt(_243);
    float _257 = fma(_247, _247, _249);
    float _259 = _171 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _261 = fma(_253, _253, _257);
    float _263 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].x, _259);
    float _265 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[31].z, _263);
    float _267 = rsqrt(_261);
    float _269 = _265 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _273 = _255 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _275 = _247 * _267;
    float _277 = _239 * _267;
    float _279 = _253 * _267;
    bool _281 = !_273;
    float _283 = _217;
    float _285 = _207;
    float _287 = _269;
    if (!_281)
    {
        float _289 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _291 = _255 + _289;
        float _293 = _269 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _295 = rsqrt(_243);
        float _297 = -_269;
        float _299 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _301 = _297 + _299;
        float _303 = abs(_293);
        float _305 = abs(_291);
        float _307 = precise::max(_303, _305);
        float _309 = _301 * _301;
        bool _311 = _307 >= 16.0;
        float _313 = _231 * _295;
        float _315 = _221 * _295;
        float _317 = -_231;
        float _319 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[41].z, _317);
        float _321 = -_221;
        float _323 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[41].z, _321);
        float _325 = _291;
        float _327 = _293;
        int _330 = as_type<int>(_323);
        if (_311)
        {
            float _332 = _291 * 0.0625;
            _325 = _332;
        }
        float _334 = _325;
        if (_311)
        {
            float _336 = _293 * 0.0625;
            _327 = _336;
        }
        float _338 = _327;
        float _340 = fma(_319, _319, _309);
        float _342 = abs(_334);
        bool _344 = _342 != 0.0;
        bool _346 = isnan(_342);
        bool _348 = _344 || _346;
        bool _350 = isnan(0.0);
        bool _352 = _348 || _350;
        float _354 = fma(_323, _323, _340);
        float _356 = abs(_338);
        bool _358 = _356 == 0.0;
        float _360 = abs(_338);
        bool _362 = _360 == 0.0;
        bool _364 = !_352;
        bool _366 = _362 && _364;
        float _368 = sqrt(_354);
        bool _370 = false;
        if (_366)
        {
            bool _372 = as_type<int>(_338) >= 0;
            _370 = _372;
        }
        bool _374 = _370;
        int _376 = _374 ? (-1) : 0;
        if (_366)
        {
            int _378 = _374 ? 0 : 1078530011;
            _330 = _378;
        }
        int _380 = _330;
        int _382 = _380;
        if (_366)
        {
            int _384 = int(0x80000000) & as_type<int>(_334);
            int _386 = _380 | _384;
            _382 = _386;
        }
        int _388 = _382;
        bool _390 = !_352;
        bool _392 = _390 && _358;
        int _394 = _388;
        float _396 = as_type<float>(_388);
        if (!_392)
        {
            float _398 = abs(_334);
            bool _400 = _398 != as_type<float>(0x7f800000u /* inf */);
            bool _402 = isnan(_398);
            bool _404 = _400 || _402;
            bool _406 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _408 = _404 || _406;
            float _410 = abs(_338);
            bool _412 = _410 == as_type<float>(0x7f800000u /* inf */);
            float _414 = abs(_338);
            bool _416 = _414 == as_type<float>(0x7f800000u /* inf */);
            bool _418 = !_408;
            bool _420 = _416 && _418;
            if (_420)
            {
                bool _422 = as_type<int>(_338) >= 0;
                _376 = _422 ? (-1) : 0;
            }
            int _424 = _376;
            if (_420)
            {
                _394 = 1075235812;
            }
            int _426 = _394;
            int _428 = _426;
            if (_420)
            {
                int _430 = ~_424;
                int _432 = (_430 != 0) ? _426 : 1061752795;
                _428 = _432;
            }
            int _434 = _428;
            float _436 = as_type<float>(_434);
            if (_420)
            {
                int _438 = int(0x80000000) & as_type<int>(_334);
                int _440 = _434 | _438;
                _436 = as_type<float>(_440);
            }
            float _442 = _436;
            bool _444 = !_408;
            bool _446 = _444 && _412;
            _396 = _442;
            if (!_446)
            {
                float _448 = abs(_334);
                float _450 = abs(_338);
                float _452 = precise::max(_448, _450);
                float _454 = abs(_334);
                float _456 = abs(_338);
                float _458 = precise::min(_454, _456);
                float _460 = 1.0 / _452;
                float _462 = abs(_334);
                float _464 = abs(_338);
                bool _466 = _462 > _464;
                bool _468 = as_type<int>(_338) >= 0;
                float _470 = _458 * _460;
                float _472 = abs(_334);
                float _474 = abs(_338);
                float _476 = _472 + _474;
                int _478 = as_type<int>(_334) & int(0x80000000);
                float _480 = _470 * _470;
                bool _482 = _476 > as_type<float>(0x7f800000u /* inf */);
                bool _484 = isnan(_476);
                bool _486 = _482 || _484;
                bool _488 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _490 = _486 || _488;
                float _492 = _480 + 11.33538818359375;
                float _494 = fma(_480, _492, 28.84246826171875);
                float _496 = fma(_480, _494, 19.6966705322265625);
                float _498 = fma(_480, -0.82336294651031494140625, -5.674867153167724609375);
                float _500 = fma(_480, _498, -6.565555095672607421875);
                float _502 = 1.0 / _496;
                float _504 = _480 * _500;
                float _506 = _470 * _504;
                float _508 = fma(_506, _502, _470);
                float _510 = _508;
                _396 = _476;
                if (_466)
                {
                    float _512 = -_508;
                    float _514 = _512 + 1.57079637050628662109375;
                    _510 = _514;
                }
                float _516 = _510;
                int _518 = as_type<int>(_516);
                if (!_468)
                {
                    float _520 = -_516;
                    float _522 = _520 + 3.1415927410125732421875;
                    _518 = as_type<int>(_522);
                }
                int _524 = _518;
                if (!_490)
                {
                    int _526 = _478 | _524;
                    _396 = as_type<float>(_526);
                }
            }
        }
        float _528 = _396;
        float _530 = fma(_528, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _532 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _534 = _368 + _532;
        float _536 = fma(_313, _530, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _538 = fma(_315, _530, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _283 = _536;
        _285 = _538;
        _287 = _534;
    }
    float _540 = _283;
    float _542 = _285;
    float _544 = _287;
    float _546 = _277 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _548 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[35].x, _546);
    float _550 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].z, _548);
    float _552 = -_550;
    float _554 = fma(_552, _550, 1.0);
    float _556 = -_550;
    float _558 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[35].z, _279);
    float _560 = -_550;
    float _562 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[35].y, _277);
    float _564 = -_550;
    float _566 = fma(_564, (*spvDescriptorSet0.fp_c3)._m0[35].x, _275);
    float _568 = _554 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _570 = fma(_558, _568, _163);
    float _572 = fma(_562, _568, _171);
    float _574 = fma(_566, _568, _173);
    float _576 = -_570;
    bool _578 = _576 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _580 = float(_578);
    float _582 = -_570;
    bool _584 = _582 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _586 = float(_584);
    float _588 = _580 + _586;
    float _590 = precise::min(_588, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _592 = trunc(_590);
    int _594 = int(_592);
    float _596 = rint(_590);
    float _598 = precise::max(_596, 0.0);
    uint _601 = uint(_598);
    uint _603 = clamp(_601, 0u, 65535u);
    int _605 = _594 << 6;
    int _607 = _605 + 48;
    uint _609 = uint(int(uint(_607) >> uint(2)));
    uint _611 = uint(int(uint(int(_609)) >> uint(2)));
    int _613 = int(_609) & 3;
    float _615 = (*spvDescriptorSet0.fp_c3)._m0[int(_611)][_613];
    int _617 = int(_609) + 1;
    uint _619 = uint(int(uint(_617) >> uint(2)));
    int _621 = _617 & 3;
    float _623 = (*spvDescriptorSet0.fp_c3)._m0[int(_619)][_621];
    int _625 = _605 + 56;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    uint _629 = uint(int(uint(int(_627)) >> uint(2)));
    int _631 = int(_627) & 3;
    float _633 = (*spvDescriptorSet0.fp_c3)._m0[int(_629)][_631];
    int _635 = int(_627) + 1;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    int _639 = _635 & 3;
    float _641 = (*spvDescriptorSet0.fp_c3)._m0[int(_637)][_639];
    uint _643 = uint(int(uint(_605) >> uint(2)));
    uint _645 = uint(int(uint(int(_643)) >> uint(2)));
    int _647 = int(_643) & 3;
    float _649 = (*spvDescriptorSet0.fp_c3)._m0[int(_645)][_647];
    int _651 = int(_643) + 1;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    int _655 = _651 & 3;
    float _657 = (*spvDescriptorSet0.fp_c3)._m0[int(_653)][_655];
    int _659 = _605 + 16;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    uint _663 = uint(int(uint(int(_661)) >> uint(2)));
    int _665 = int(_661) & 3;
    float _667 = (*spvDescriptorSet0.fp_c3)._m0[int(_663)][_665];
    int _669 = int(_661) + 1;
    uint _671 = uint(int(uint(_669) >> uint(2)));
    int _673 = _669 & 3;
    float _675 = (*spvDescriptorSet0.fp_c3)._m0[int(_671)][_673];
    int _677 = _605 + 32;
    uint _679 = uint(int(uint(_677) >> uint(2)));
    uint _681 = uint(int(uint(int(_679)) >> uint(2)));
    int _683 = int(_679) & 3;
    float _685 = (*spvDescriptorSet0.fp_c3)._m0[int(_681)][_683];
    int _687 = int(_679) + 1;
    uint _689 = uint(int(uint(_687) >> uint(2)));
    int _691 = _687 & 3;
    float _693 = (*spvDescriptorSet0.fp_c3)._m0[int(_689)][_691];
    int _695 = _605 + 8;
    uint _697 = uint(int(uint(_695) >> uint(2)));
    uint _699 = uint(int(uint(int(_697)) >> uint(2)));
    int _701 = int(_697) & 3;
    float _703 = (*spvDescriptorSet0.fp_c3)._m0[int(_699)][_701];
    int _705 = int(_697) + 1;
    uint _707 = uint(int(uint(_705) >> uint(2)));
    int _709 = _705 & 3;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[int(_707)][_709];
    int _713 = _605 + 24;
    uint _715 = uint(int(uint(_713) >> uint(2)));
    uint _717 = uint(int(uint(int(_715)) >> uint(2)));
    int _719 = int(_715) & 3;
    float _721 = (*spvDescriptorSet0.fp_c3)._m0[int(_717)][_719];
    int _723 = int(_715) + 1;
    uint _725 = uint(int(uint(_723) >> uint(2)));
    int _727 = _723 & 3;
    float _729 = (*spvDescriptorSet0.fp_c3)._m0[int(_725)][_727];
    float _731 = _572 * _623;
    float _733 = fma(_574, _615, _731);
    int _735 = _605 + 40;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    uint _739 = uint(int(uint(int(_737)) >> uint(2)));
    int _741 = int(_737) & 3;
    float _743 = (*spvDescriptorSet0.fp_c3)._m0[int(_739)][_741];
    int _745 = int(_737) + 1;
    uint _747 = uint(int(uint(_745) >> uint(2)));
    int _749 = _745 & 3;
    float _751 = (*spvDescriptorSet0.fp_c3)._m0[int(_747)][_749];
    float _753 = fma(_570, _633, _733);
    float _755 = _753 + _641;
    float _757 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _759 = _572 * _657;
    float _761 = 1.0 / _755;
    float _763 = fma(_574, _649, _759);
    float _765 = _572 * _675;
    float _767 = fma(_540, 6.2500002968590706586837768554688e-05, 0.5);
    float _769 = fma(_574, _667, _765);
    float _771 = _572 * _693;
    float _773 = fma(_574, _685, _771);
    float _775 = fma(_570, _703, _763);
    float _777 = _775 + _711;
    float _779 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _781 = fma(_570, _721, _769);
    float _783 = _777 * _761;
    float _785 = _781 + _729;
    float _787 = fma(_570, _743, _773);
    float _789 = _785 * _761;
    float _791 = _787 + _751;
    float _793 = _791 * _761;
    float _795 = precise::clamp(_793, 0.0, 1.0);
    float _797 = fma(_542, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2276 = float2(_87, _89);
    float2 _801 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2276, float2(0.0), isnan(_2276))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2276, float2(0.0), isnan(_2276))).xy;
    float _803 = _801.x;
    float _805 = _801.y;
    float2 _2288 = float2(_767, _797);
    float _807 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2288, float2(0.0), isnan(_2288))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2288, float2(0.0), isnan(_2288))).x;
    float2 _2296 = float2(_757, _779);
    float _809 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2296, float2(0.0), isnan(_2296))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2296, float2(0.0), isnan(_2296))).x;
    float3 _2308 = float3(_783, _789, float(int(_603)));
    float3 _2312 = select(_2308, float3(0.0), isnan(_2308));
    float _811 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2312.xy, uint(rint(_2312.z)), _795);
    float _813 = fma(_803, 2.0, -1.0);
    float _815 = fma(_805, 2.0, -1.0);
    float _817 = _813 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _819 = _815 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _821 = fma(_817, 2.0, _87);
    float _823 = fma(_819, 2.0, _89);
    float2 _2338 = float2(_821, _823);
    float _825 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2338, float2(0.0), isnan(_2338))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2338, float2(0.0), isnan(_2338))).x;
    float2 _2346 = float2(_767, _797);
    float _827 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2346, float2(0.0), isnan(_2346)), level(_807)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2346, float2(0.0), isnan(_2346)), level(_807)).x;
    float _829 = abs(_163);
    float _831 = log2(_829);
    float _833 = _544 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _835 = _544 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _837 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].x, _833);
    float _839 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].x, _835);
    float _841 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[101].z, _837);
    float _843 = _841 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _845 = _831 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _847 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[102].z, _839);
    float _849 = trunc(_843);
    int _851 = int(_849);
    float _853 = _847 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _855 = exp2(_845);
    float _857 = trunc(_853);
    int _859 = int(_857);
    int _861 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _863 = _851 + _861;
    int _865 = _863 + 1;
    bool _867 = _865 >= 0;
    float _869 = fma(_855, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _871 = precise::clamp(_869, 0.0, 1.0);
    bool _873 = _865 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _875 = !_867;
    bool _877 = _873 || _875;
    float _879 = fma(_871, -2.0, 3.0);
    float _881 = _871 * _871;
    int _883 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _885 = _859 + _883;
    int _887 = _885 + 1;
    float _889 = _881 * _879;
    float _891 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    bool _893 = _887 < 0;
    bool _895 = _893 || _877;
    float _897 = -_889;
    float _899 = _897 + 1.0;
    bool _901 = _887 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _903 = _901 || _895;
    float _905 = fma(_899, (*spvDescriptorSet0.fp_c3)._m0[44].w, _889);
    float _907 = precise::max(0.0, _891);
    bool _909 = _163 >= (-8000.0);
    bool _911 = isnan(_163);
    bool _913 = _909 || _911;
    bool _915 = isnan(-8000.0);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = _905 * _907;
    float _923 = _919 * _921;
    float _925 = -_809;
    float _927 = _925 + 1.0;
    float _929 = _809;
    if (_903)
    {
        _929 = 1.0;
    }
    float _931 = _929;
    float _933 = _923 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _935 = _931;
    if (!_903)
    {
        int _937 = _887 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _939 = _937 + _865;
        float _941 = floor(_853);
        int _943 = _939 << 2;
        int _945 = _939 >> 2;
        int _947 = 12 & _943;
        int _949 = _945 << 4;
        int _951 = _949 + _947;
        float _953 = floor(_843);
        uint _955 = uint(int(uint(_951) >> uint(2)));
        uint _957 = uint(int(uint(int(_955)) >> uint(2)));
        int _959 = int(_955) & 3;
        float _961 = (*spvDescriptorSet0.fp_c5)._m0[int(_957)][_959];
        float _963 = -_941;
        float _965 = _853 + _963;
        float _967 = -_953;
        float _969 = _843 + _967;
        float _971 = rint(_961);
        float _973 = precise::max(_971, 0.0);
        uint _975 = uint(_973);
        uint _977 = clamp(_975, 0u, 65535u);
        float3 _2588 = float3(_969, _965, float(int(_977)));
        float3 _2590 = select(_2588, float3(0.0), isnan(_2588));
        float _979 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2590.xy, uint(rint(_2590.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2590.xy, uint(rint(_2590.z)), level(0.0)).x;
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
        float _1029 = 1.0 / _993;
        float _1031 = _993 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1033 = _544 * _1009;
        float _1035 = fma(_540, _1001, _1033);
        float _1037 = fma(_542, _1019, _1035);
        float _1039 = _1037 + _1027;
        float _1041 = precise::clamp(_1039, 0.0, 1.0);
        float _1043 = -_1041;
        float _1045 = _1043 + _979;
        float _1047 = fma(_1029, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1045);
        float _1049 = _1031 * _1047;
        float _1051 = exp2(_1049);
        float _1053 = 0.0 + _1051;
        float _1055 = precise::clamp(_1053, 0.0, 1.0);
        _935 = _1055;
    }
    float _1057 = _935;
    float _1059 = abs(_827);
    float _1061 = _1059 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1063 = _927 * _933;
    float _1065 = precise::clamp(_1063, 0.0, 1.0);
    float _1067 = -_163;
    float _1069 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1071 = _1067 + _1069;
    float _1073 = precise::min(_1057, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1075 = -_1061;
    float _1077 = fma(_919, _1075, 1.0);
    float _1079 = -_163;
    float _1081 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1083 = _1079 + _1081;
    float _1085 = -_1065;
    float _1087 = fma(_1085, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1089 = _1071 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1091 = precise::clamp(_1089, 0.0, 1.0);
    float _1093 = -_1073;
    float _1095 = _1093 + 1.0;
    float _1097 = _1083 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1099 = precise::clamp(_1097, 0.0, 1.0);
    float _1101 = precise::min(_1077, 1.0);
    float _1103 = -_811;
    float _1105 = _1103 + 1.0;
    float _1107 = fma(_1099, _1095, _1073);
    float _1109 = precise::min(_1101, _1087);
    float _1111 = fma(_1091, _1105, _811);
    out.m_62.x = _1111;
    out.m_62.y = _1107;
    out.m_62.z = 1.0;
    out.m_62.w = _1109;
    out.m_64.x = _825;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

