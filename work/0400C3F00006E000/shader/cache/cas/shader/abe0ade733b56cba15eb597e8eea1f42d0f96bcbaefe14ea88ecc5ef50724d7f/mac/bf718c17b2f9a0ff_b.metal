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
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d<float> fp_t_tcb_E [[id(13)]];
    sampler fp_t_tcb_ESmplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_10 [[id(17)]];
    sampler fp_t_tcb_10Smplr [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_ASmplr_w [[id(20)]];
    sampler fp_t_tcb_ESmplr_w [[id(21)]];
    sampler fp_t_tcb_16Smplr_w [[id(22)]];
    sampler fp_t_tcb_10Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
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
    float2 _1284 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1284, float2(0.0), isnan(_1284))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1284, float2(0.0), isnan(_1284))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1299 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1299, float2(0.0), isnan(_1299))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1299, float2(0.0), isnan(_1299))).x;
    float2 _1307 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1307, float2(0.0), isnan(_1307))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1307, float2(0.0), isnan(_1307))).x;
    float _101 = in.m_55.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_55.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_57.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_57.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_59.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_59.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _85 * _105;
    float _139 = _85 * _111;
    float _141 = _85 * _117;
    float _143 = _85 * _123;
    float _145 = _85 * _129;
    float _147 = _85 * _135;
    float _149 = -_93;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _153 = 1.0 / _151;
    float _155 = -_97;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _159 = -_99;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _163 = 1.0 / _157;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _167 = _153 * _165;
    float _169 = 1.0 / _161;
    float _171 = _167 * _139;
    float _173 = _167 * _137;
    float _175 = _171 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _177 = _171 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _181 = _163 * _179;
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[32].x, _175);
    float _185 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[30].x, _177);
    float _187 = -_173;
    float _189 = fma(_181, _143, _187);
    float _191 = -_171;
    float _193 = fma(_181, _141, _191);
    float _195 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[32].z, _183);
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _199 = _169 * _197;
    float _201 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _203 = -_167;
    float _205 = _203 + _181;
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _209 = -_173;
    float _211 = fma(_199, _145, _209);
    float _213 = _201 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _215 = -_171;
    float _217 = fma(_199, _147, _215);
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _221 = _207 + _219;
    float _223 = -_167;
    float _225 = _223 + _199;
    float _227 = _205 * _211;
    float _229 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _231 = _213 + _229;
    float _233 = _221 * _221;
    float _235 = _193 * _225;
    float _237 = -_227;
    float _239 = fma(_189, _225, _237);
    float _241 = _189 * _217;
    float _243 = fma(_231, _231, _233);
    float _245 = -_235;
    float _247 = fma(_205, _217, _245);
    float _249 = _239 * _239;
    float _251 = -_241;
    float _253 = fma(_193, _211, _251);
    float _255 = sqrt(_243);
    float _257 = _171 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _259 = fma(_247, _247, _249);
    float _261 = fma(_253, _253, _259);
    float _263 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].x, _257);
    float _265 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].z, _263);
    float _267 = rsqrt(_261);
    float _269 = _265 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _273 = _255 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _275 = _239 * _267;
    float _277 = _247 * _267;
    float _279 = _253 * _267;
    float _281 = _265;
    float _283 = _239;
    float _285 = _207;
    if (!_273)
    {
        _281 = _213;
    }
    float _287 = _281;
    float _289 = _287;
    if (!_273)
    {
        _283 = _269;
    }
    float _291 = _283;
    bool _293 = !_273;
    float _295 = _291;
    if (!_293)
    {
        float _297 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _299 = _255 + _297;
        float _301 = _269 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _303 = rsqrt(_243);
        float _305 = -_269;
        float _307 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _309 = _305 + _307;
        float _311 = abs(_301);
        float _313 = abs(_299);
        float _315 = precise::max(_311, _313);
        float _317 = _309 * _309;
        bool _319 = _315 >= 16.0;
        float _321 = _231 * _303;
        float _323 = _221 * _303;
        float _325 = -_231;
        float _327 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[41].z, _325);
        float _329 = -_221;
        float _331 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[41].z, _329);
        float _333 = _299;
        float _335 = _301;
        int _338 = as_type<int>(_331);
        if (_319)
        {
            float _340 = _299 * 0.0625;
            _333 = _340;
        }
        float _342 = _333;
        if (_319)
        {
            float _344 = _301 * 0.0625;
            _335 = _344;
        }
        float _346 = _335;
        float _348 = fma(_327, _327, _317);
        float _350 = abs(_342);
        bool _352 = _350 != 0.0;
        bool _354 = isnan(_350);
        bool _356 = _352 || _354;
        bool _358 = isnan(0.0);
        bool _360 = _356 || _358;
        float _362 = fma(_331, _331, _348);
        float _364 = abs(_346);
        bool _366 = _364 == 0.0;
        float _368 = abs(_346);
        bool _370 = _368 == 0.0;
        bool _372 = !_360;
        bool _374 = _370 && _372;
        float _376 = sqrt(_362);
        bool _378 = false;
        if (_374)
        {
            bool _380 = as_type<int>(_346) >= 0;
            _378 = _380;
        }
        bool _382 = _378;
        int _384 = _382 ? (-1) : 0;
        if (_374)
        {
            int _386 = _382 ? 0 : 1078530011;
            _338 = _386;
        }
        int _388 = _338;
        int _390 = _388;
        if (_374)
        {
            int _392 = int(0x80000000) & as_type<int>(_342);
            int _394 = _388 | _392;
            _390 = _394;
        }
        int _396 = _390;
        bool _398 = !_360;
        bool _400 = _398 && _366;
        int _402 = _396;
        float _404 = as_type<float>(_396);
        if (!_400)
        {
            float _406 = abs(_342);
            bool _408 = _406 != as_type<float>(0x7f800000u /* inf */);
            bool _410 = isnan(_406);
            bool _412 = _408 || _410;
            bool _414 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _416 = _412 || _414;
            float _418 = abs(_346);
            bool _420 = _418 == as_type<float>(0x7f800000u /* inf */);
            float _422 = abs(_346);
            bool _424 = _422 == as_type<float>(0x7f800000u /* inf */);
            bool _426 = !_416;
            bool _428 = _424 && _426;
            if (_428)
            {
                bool _430 = as_type<int>(_346) >= 0;
                _384 = _430 ? (-1) : 0;
            }
            int _432 = _384;
            if (_428)
            {
                _402 = 1075235812;
            }
            int _434 = _402;
            int _436 = _434;
            if (_428)
            {
                int _438 = ~_432;
                int _440 = (_438 != 0) ? _434 : 1061752795;
                _436 = _440;
            }
            int _442 = _436;
            float _444 = as_type<float>(_442);
            if (_428)
            {
                int _446 = int(0x80000000) & as_type<int>(_342);
                int _448 = _442 | _446;
                _444 = as_type<float>(_448);
            }
            float _450 = _444;
            bool _452 = !_416;
            bool _454 = _452 && _420;
            _404 = _450;
            if (!_454)
            {
                float _456 = abs(_342);
                float _458 = abs(_346);
                float _460 = precise::max(_456, _458);
                float _462 = abs(_342);
                float _464 = abs(_346);
                float _466 = precise::min(_462, _464);
                float _468 = 1.0 / _460;
                float _470 = abs(_342);
                float _472 = abs(_346);
                bool _474 = _470 > _472;
                bool _476 = as_type<int>(_346) >= 0;
                float _478 = _466 * _468;
                float _480 = abs(_342);
                float _482 = abs(_346);
                float _484 = _480 + _482;
                int _486 = as_type<int>(_342) & int(0x80000000);
                float _488 = _478 * _478;
                bool _490 = _484 > as_type<float>(0x7f800000u /* inf */);
                bool _492 = isnan(_484);
                bool _494 = _490 || _492;
                bool _496 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _498 = _494 || _496;
                float _500 = _488 + 11.33538818359375;
                float _502 = fma(_488, _500, 28.84246826171875);
                float _504 = fma(_488, _502, 19.6966705322265625);
                float _506 = fma(_488, -0.82336294651031494140625, -5.674867153167724609375);
                float _508 = fma(_488, _506, -6.565555095672607421875);
                float _510 = 1.0 / _504;
                float _512 = _488 * _508;
                float _514 = _478 * _512;
                float _516 = fma(_514, _510, _478);
                float _518 = _516;
                _404 = _484;
                if (_474)
                {
                    float _520 = -_516;
                    float _522 = _520 + 1.57079637050628662109375;
                    _518 = _522;
                }
                float _524 = _518;
                int _526 = as_type<int>(_524);
                if (!_476)
                {
                    float _528 = -_524;
                    float _530 = _528 + 3.1415927410125732421875;
                    _526 = as_type<int>(_530);
                }
                int _532 = _526;
                if (!_498)
                {
                    int _534 = _486 | _532;
                    _404 = as_type<float>(_534);
                }
            }
        }
        float _536 = _404;
        float _538 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _540 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _542 = _376 + _540;
        float _544 = fma(_321, _538, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _546 = fma(_323, _538, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _295 = _542;
        _289 = _544;
        _285 = _546;
    }
    float _548 = _295;
    float _550 = _289;
    float _552 = _285;
    float _554 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _556 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].x, _554);
    float _558 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].z, _556);
    float _560 = -_558;
    float _562 = fma(_560, _558, 1.0);
    float _564 = -_558;
    float _566 = fma(_564, (*spvDescriptorSet0.fp_c3)._m0[35].z, _279);
    float _568 = -_558;
    float _570 = fma(_568, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _572 = -_558;
    float _574 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[35].x, _277);
    float _576 = _562 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _578 = fma(_566, _576, _167);
    float _580 = fma(_570, _576, _171);
    float _582 = fma(_574, _576, _173);
    float _584 = -_578;
    bool _586 = _584 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _588 = float(_586);
    float _590 = -_578;
    bool _592 = _590 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _594 = float(_592);
    float _596 = _588 + _594;
    float _598 = precise::min(_596, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _600 = trunc(_598);
    int _602 = int(_600);
    int _604 = _602 << 6;
    int _606 = _604 + 48;
    uint _609 = uint(int(uint(_606) >> uint(2)));
    uint _611 = uint(int(uint(int(_609)) >> uint(2)));
    int _613 = int(_609) & 3;
    float _615 = (*spvDescriptorSet0.fp_c3)._m0[int(_611)][_613];
    int _617 = int(_609) + 1;
    uint _619 = uint(int(uint(_617) >> uint(2)));
    int _621 = _617 & 3;
    float _623 = (*spvDescriptorSet0.fp_c3)._m0[int(_619)][_621];
    int _625 = _604 + 56;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    uint _629 = uint(int(uint(int(_627)) >> uint(2)));
    int _631 = int(_627) & 3;
    float _633 = (*spvDescriptorSet0.fp_c3)._m0[int(_629)][_631];
    int _635 = int(_627) + 1;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    int _639 = _635 & 3;
    float _641 = (*spvDescriptorSet0.fp_c3)._m0[int(_637)][_639];
    int _643 = _604 + 16;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    uint _647 = uint(int(uint(int(_645)) >> uint(2)));
    int _649 = int(_645) & 3;
    float _651 = (*spvDescriptorSet0.fp_c3)._m0[int(_647)][_649];
    int _653 = int(_645) + 1;
    uint _655 = uint(int(uint(_653) >> uint(2)));
    int _657 = _653 & 3;
    float _659 = (*spvDescriptorSet0.fp_c3)._m0[int(_655)][_657];
    int _661 = _604 + 32;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    uint _665 = uint(int(uint(int(_663)) >> uint(2)));
    int _667 = int(_663) & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    int _671 = int(_663) + 1;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    int _675 = _671 & 3;
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[int(_673)][_675];
    uint _679 = uint(int(uint(_604) >> uint(2)));
    uint _681 = uint(int(uint(int(_679)) >> uint(2)));
    int _683 = int(_679) & 3;
    float _685 = (*spvDescriptorSet0.fp_c3)._m0[int(_681)][_683];
    int _687 = int(_679) + 1;
    uint _689 = uint(int(uint(_687) >> uint(2)));
    int _691 = _687 & 3;
    float _693 = (*spvDescriptorSet0.fp_c3)._m0[int(_689)][_691];
    int _695 = _604 + 24;
    uint _697 = uint(int(uint(_695) >> uint(2)));
    uint _699 = uint(int(uint(int(_697)) >> uint(2)));
    int _701 = int(_697) & 3;
    float _703 = (*spvDescriptorSet0.fp_c3)._m0[int(_699)][_701];
    int _705 = int(_697) + 1;
    uint _707 = uint(int(uint(_705) >> uint(2)));
    int _709 = _705 & 3;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[int(_707)][_709];
    float _713 = _580 * _623;
    int _715 = _604 + 40;
    uint _717 = uint(int(uint(_715) >> uint(2)));
    uint _719 = uint(int(uint(int(_717)) >> uint(2)));
    int _721 = int(_717) & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    int _725 = int(_717) + 1;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    int _729 = _725 & 3;
    float _731 = (*spvDescriptorSet0.fp_c3)._m0[int(_727)][_729];
    float _733 = fma(_582, _615, _713);
    float _735 = fma(_578, _633, _733);
    int _737 = _604 + 8;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    uint _741 = uint(int(uint(int(_739)) >> uint(2)));
    int _743 = int(_739) & 3;
    float _745 = (*spvDescriptorSet0.fp_c3)._m0[int(_741)][_743];
    int _747 = int(_739) + 1;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    int _751 = _747 & 3;
    float _753 = (*spvDescriptorSet0.fp_c3)._m0[int(_749)][_751];
    float _755 = _735 + _641;
    float _757 = 1.0 / _755;
    float _759 = _580 * _659;
    float _761 = fma(_582, _651, _759);
    float _763 = _580 * _677;
    float2 _2353 = float2(_87, _89);
    float2 _767 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2353, float2(0.0), isnan(_2353))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2353, float2(0.0), isnan(_2353))).xy;
    float _769 = _767.x;
    float _771 = _767.y;
    float _773 = fma(_582, _669, _763);
    float _775 = _580 * _693;
    float _777 = fma(_582, _685, _775);
    float _779 = fma(_578, _703, _761);
    float _781 = _779 + _711;
    float _783 = _781 * _757;
    float _785 = fma(_578, _723, _773);
    float _787 = _785 + _731;
    float _789 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _87);
    float _791 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _89);
    float _793 = fma(_578, _745, _777);
    float _795 = _787 * _757;
    float _797 = precise::clamp(_795, 0.0, 1.0);
    float2 _2411 = float2(_789, _791);
    float4 _800 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2411, float2(0.0), isnan(_2411)), int2(0), component::x).xyzw;
    float _802 = _800.x;
    float _804 = _800.y;
    float _806 = _800.z;
    float _808 = _800.w;
    float2 _2427 = float2(_789, _791);
    float4 _810 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2427, float2(0.0), isnan(_2427)), int2(0), component::w).xyzw;
    float _812 = _810.x;
    float _814 = _810.y;
    float _816 = _810.z;
    float _818 = _810.w;
    float _820 = rint(_598);
    float _822 = precise::max(_820, 0.0);
    uint _824 = uint(_822);
    uint _826 = clamp(_824, 0u, 65535u);
    float _828 = _793 + _753;
    float _830 = _828 * _757;
    float3 _2463 = float3(_830, _783, float(int(_826)));
    float3 _2467 = select(_2463, float3(0.0), isnan(_2463));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2467.xy, uint(rint(_2467.z)), _797);
    float _834 = fma(_769, 2.0, -1.0);
    float _836 = fma(_771, 2.0, -1.0);
    float _838 = _834 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _840 = _836 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _842 = fma(_838, 2.0, _87);
    float _844 = fma(_840, 2.0, _89);
    float2 _2493 = float2(_842, _844);
    float _846 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2493, float2(0.0), isnan(_2493))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2493, float2(0.0), isnan(_2493))).x;
    float2 _2501 = float2(_842, _844);
    float2 _848 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2501, float2(0.0), isnan(_2501))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2501, float2(0.0), isnan(_2501))).yz;
    float _850 = _848.x;
    float _852 = _848.y;
    float _854 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _856 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _858 = precise::min(_167, -1.0000000116860974230803549289703e-07);
    float _860 = floor(_854);
    float _862 = floor(_856);
    float _864 = -_802;
    float _866 = fma(_864, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _868 = -_860;
    float _870 = _854 + _868;
    float _872 = -_804;
    float _874 = fma(_872, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _876 = 1.0 / _858;
    float _878 = -_806;
    float _880 = fma(_878, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _882 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _884 = _870 + _882;
    float _886 = -_808;
    float _888 = fma(_886, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _890 = -_862;
    float _892 = _856 + _890;
    float _894 = -_884;
    float _896 = _894 + 1.0;
    float _898 = 1.0 / _874;
    float _900 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _902 = _892 + _900;
    float _904 = -_902;
    float _906 = _904 + 1.0;
    float _908 = _884 * _902;
    float _910 = _902 * _896;
    float _912 = 1.0 / _888;
    float _914 = _896 * _906;
    float _916 = _884 * _906;
    float _918 = _876 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _920 = _548 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _922 = _548 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _924 = 1.0 / _866;
    float _926 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[101].x, _920);
    float _928 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[102].x, _922);
    float _930 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[102].z, _928);
    float _932 = 1.0 / _880;
    float _934 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _936 = -_167;
    float _938 = fma(_924, _934, _936);
    float _940 = abs(_938);
    float _942 = _940 * _918;
    float _944 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _946 = -_167;
    float _948 = fma(_898, _944, _946);
    float _950 = abs(_948);
    float _952 = _950 * _918;
    float _954 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _956 = -_167;
    float _958 = fma(_932, _954, _956);
    float _960 = exp2(_942);
    float _962 = abs(_958);
    float _964 = _962 * _918;
    float _966 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _968 = -_167;
    float _970 = fma(_912, _966, _968);
    float _972 = exp2(_952);
    float _974 = abs(_970);
    float _976 = _974 * _918;
    float _978 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[101].z, _926);
    float _980 = _978 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _982 = exp2(_964);
    float _984 = abs(_910);
    float _986 = _984 * _960;
    float _988 = _930 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _990 = exp2(_976);
    float _992 = abs(_908);
    float _994 = _992 * _972;
    float _996 = _986 + _994;
    float _998 = trunc(_980);
    int _1000 = int(_998);
    float _1002 = abs(_916);
    float _1004 = _1002 * _982;
    float _1006 = _1004 + _996;
    float _1008 = trunc(_988);
    int _1010 = int(_1008);
    float _1012 = abs(_914);
    float _1014 = _1012 * _990;
    float _1016 = _1014 + _1006;
    float _1018 = -_1014;
    bool _1020 = _1006 != _1018;
    bool _1022 = isnan(_1006);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan(_1018);
    bool _1028 = _1024 || _1026;
    int _1030 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1032 = _1000 + _1030;
    int _1034 = _1032 + 1;
    float _1036 = 1.0 / _1016;
    bool _1038 = _1034 >= 0;
    int _1040 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1042 = _1010 + _1040;
    int _1044 = _1042 + 1;
    bool _1046 = _1034 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1048 = !_1038;
    bool _1050 = _1046 || _1048;
    bool _1052 = _1044 < 0;
    bool _1054 = _1052 || _1050;
    bool _1056 = _1044 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1058 = _1056 || _1054;
    float _1060 = _994 * _1036;
    float _1062 = _986 * _1036;
    float _1064 = _1004 * _1036;
    float _1066 = _1028 ? _1060 : 0.25;
    float _1068 = _1028 ? _1062 : 0.25;
    float _1070 = _1066 * _814;
    float _1072 = _1066;
    if (_1058)
    {
        _1072 = 1.0;
    }
    float _1074 = _1072;
    float _1076 = _1074;
    if (!_1058)
    {
        int _1078 = _1044 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1080 = _1078 + _1034;
        float _1082 = floor(_980);
        int _1084 = _1080 << 2;
        int _1086 = _1080 >> 2;
        int _1088 = 12 & _1084;
        int _1090 = _1086 << 4;
        int _1092 = _1090 + _1088;
        float _1094 = floor(_988);
        uint _1096 = uint(int(uint(_1092) >> uint(2)));
        uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
        int _1100 = int(_1096) & 3;
        float _1102 = (*spvDescriptorSet0.fp_c5)._m0[int(_1098)][_1100];
        float _1104 = -_1094;
        float _1106 = _988 + _1104;
        float _1108 = -_1082;
        float _1110 = _980 + _1108;
        float _1112 = rint(_1102);
        float _1114 = precise::max(_1112, 0.0);
        uint _1116 = uint(_1114);
        uint _1118 = clamp(_1116, 0u, 65535u);
        float3 _2897 = float3(_1110, _1106, float(int(_1118)));
        float3 _2899 = select(_2897, float3(0.0), isnan(_2897));
        float _1120 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2899.xy, uint(rint(_2899.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2899.xy, uint(rint(_2899.z)), level(0.0)).x;
        int _1122 = _1080 << 4;
        int _1124 = _1122 + 1648;
        int _1126 = _1092 + 8048;
        uint _1128 = uint(int(uint(_1126) >> uint(2)));
        uint _1130 = uint(int(uint(int(_1128)) >> uint(2)));
        int _1132 = int(_1128) & 3;
        float _1134 = (*spvDescriptorSet0.fp_c5)._m0[int(_1130)][_1132];
        uint _1136 = uint(int(uint(_1124) >> uint(2)));
        uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
        int _1140 = int(_1136) & 3;
        float _1142 = (*spvDescriptorSet0.fp_c5)._m0[int(_1138)][_1140];
        int _1144 = int(_1136) + 1;
        uint _1146 = uint(int(uint(_1144) >> uint(2)));
        int _1148 = _1144 & 3;
        float _1150 = (*spvDescriptorSet0.fp_c5)._m0[int(_1146)][_1148];
        int _1152 = _1124 + 8;
        uint _1154 = uint(int(uint(_1152) >> uint(2)));
        uint _1156 = uint(int(uint(int(_1154)) >> uint(2)));
        int _1158 = int(_1154) & 3;
        float _1160 = (*spvDescriptorSet0.fp_c5)._m0[int(_1156)][_1158];
        int _1162 = int(_1154) + 1;
        uint _1164 = uint(int(uint(_1162) >> uint(2)));
        int _1166 = _1162 & 3;
        float _1168 = (*spvDescriptorSet0.fp_c5)._m0[int(_1164)][_1166];
        float _1170 = 1.0 / _1134;
        float _1172 = _548 * _1150;
        float _1174 = fma(_550, _1142, _1172);
        float _1176 = _1134 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1178 = fma(_552, _1160, _1174);
        float _1180 = _1178 + _1168;
        float _1182 = precise::clamp(_1180, 0.0, 1.0);
        float _1184 = -_1182;
        float _1186 = _1184 + _1120;
        float _1188 = fma(_1170, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1186);
        float _1190 = _1176 * _1188;
        float _1192 = exp2(_1190);
        float _1194 = 0.0 + _1192;
        float _1196 = precise::clamp(_1194, 0.0, 1.0);
        _1076 = _1196;
    }
    float _1198 = _1076;
    float _1200 = _1028 ? _1064 : 0.25;
    float _1202 = fma(_1068, _812, _1070);
    float _1204 = -_167;
    float _1206 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1208 = _1204 + _1206;
    float _1210 = precise::min(_1198, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1212 = _1014 * _1036;
    float _1214 = -_167;
    float _1216 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1218 = _1214 + _1216;
    float _1220 = fma(_1200, _816, _1202);
    float _1222 = _1208 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1224 = precise::clamp(_1222, 0.0, 1.0);
    float _1226 = -_1210;
    float _1228 = _1226 + 1.0;
    float _1230 = _1028 ? _1212 : 0.25;
    float _1232 = _1218 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1234 = precise::clamp(_1232, 0.0, 1.0);
    float _1236 = -_832;
    float _1238 = _1236 + 1.0;
    float _1240 = fma(_1224, _1228, _1210);
    float _1242 = fma(_1230, _818, _1220);
    float _1244 = fma(_1234, _1238, _832);
    float _1246 = precise::min(_1242, 1.0);
    out.m_62.x = _1244;
    out.m_62.y = _1240;
    out.m_62.z = _1246;
    out.m_62.w = 1.0;
    out.m_64.x = _846;
    out.m_64.y = _850;
    out.m_64.z = _852;
    out.m_64.w = 1.0;
    return out;
}

