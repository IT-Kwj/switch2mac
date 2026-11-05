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
    texture2d<float> fp_t_tcb_16 [[id(5)]];
    sampler fp_t_tcb_16Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_18 [[id(11)]];
    sampler fp_t_tcb_18Smplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> fp_t_tcb_14 [[id(15)]];
    sampler fp_t_tcb_14Smplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_E [[id(17)]];
    sampler fp_t_tcb_ESmplr [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_16Smplr_w [[id(20)]];
    sampler fp_t_tcb_18Smplr_w [[id(21)]];
    sampler fp_t_tcb_14Smplr_w [[id(22)]];
    sampler fp_t_tcb_ESmplr_w [[id(23)]];
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
    float2 _1337 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1337, float2(0.0), isnan(_1337))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1337, float2(0.0), isnan(_1337))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1352 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1352, float2(0.0), isnan(_1352))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1352, float2(0.0), isnan(_1352))).x;
    float2 _1360 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1360, float2(0.0), isnan(_1360))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1360, float2(0.0), isnan(_1360))).x;
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
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _229 = _213 + _227;
    float _231 = _205 * _211;
    float _233 = _221 * _221;
    float _235 = _193 * _225;
    float _237 = -_231;
    float _239 = fma(_189, _225, _237);
    float _241 = fma(_229, _229, _233);
    float _243 = _189 * _217;
    float _245 = -_235;
    float _247 = fma(_205, _217, _245);
    float _249 = _239 * _239;
    float _251 = sqrt(_241);
    float _253 = -_243;
    float _255 = fma(_193, _211, _253);
    float _257 = _171 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _259 = fma(_247, _247, _249);
    float _261 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].x, _257);
    float _263 = fma(_255, _255, _259);
    float _265 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].z, _261);
    float _267 = rsqrt(_263);
    float _269 = _265 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _273 = _251 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _275 = _247 * _267;
    float _277 = _239 * _267;
    float _279 = _255 * _267;
    float _281 = _267;
    float _283 = _263;
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
        float _299 = _251 + _297;
        float _301 = _269 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _303 = rsqrt(_241);
        float _305 = -_269;
        float _307 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _309 = _305 + _307;
        float _311 = abs(_301);
        float _313 = abs(_299);
        float _315 = precise::max(_311, _313);
        float _317 = _309 * _309;
        bool _319 = _315 >= 16.0;
        float _321 = _229 * _303;
        float _323 = _221 * _303;
        float _325 = -_229;
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
        _285 = _546;
        _289 = _544;
        _295 = _542;
    }
    float _548 = _285;
    float _550 = _289;
    float _552 = _295;
    float _554 = _277 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _556 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[35].x, _554);
    float _558 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].z, _556);
    float _560 = -_558;
    float _562 = fma(_560, _558, 1.0);
    float _564 = -_558;
    float _566 = fma(_564, (*spvDescriptorSet0.fp_c3)._m0[35].z, _279);
    float _568 = -_558;
    float _570 = fma(_568, (*spvDescriptorSet0.fp_c3)._m0[35].y, _277);
    float _572 = -_558;
    float _574 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[35].x, _275);
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
    uint _643 = uint(int(uint(_604) >> uint(2)));
    uint _645 = uint(int(uint(int(_643)) >> uint(2)));
    int _647 = int(_643) & 3;
    float _649 = (*spvDescriptorSet0.fp_c3)._m0[int(_645)][_647];
    int _651 = int(_643) + 1;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    int _655 = _651 & 3;
    float _657 = (*spvDescriptorSet0.fp_c3)._m0[int(_653)][_655];
    int _659 = _604 + 32;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    uint _663 = uint(int(uint(int(_661)) >> uint(2)));
    int _665 = int(_661) & 3;
    float _667 = (*spvDescriptorSet0.fp_c3)._m0[int(_663)][_665];
    int _669 = int(_661) + 1;
    uint _671 = uint(int(uint(_669) >> uint(2)));
    int _673 = _669 & 3;
    float _675 = (*spvDescriptorSet0.fp_c3)._m0[int(_671)][_673];
    int _677 = _604 + 8;
    uint _679 = uint(int(uint(_677) >> uint(2)));
    uint _681 = uint(int(uint(int(_679)) >> uint(2)));
    int _683 = int(_679) & 3;
    float _685 = (*spvDescriptorSet0.fp_c3)._m0[int(_681)][_683];
    int _687 = int(_679) + 1;
    uint _689 = uint(int(uint(_687) >> uint(2)));
    int _691 = _687 & 3;
    float _693 = (*spvDescriptorSet0.fp_c3)._m0[int(_689)][_691];
    int _695 = _604 + 40;
    uint _697 = uint(int(uint(_695) >> uint(2)));
    uint _699 = uint(int(uint(int(_697)) >> uint(2)));
    int _701 = int(_697) & 3;
    float _703 = (*spvDescriptorSet0.fp_c3)._m0[int(_699)][_701];
    int _705 = int(_697) + 1;
    uint _707 = uint(int(uint(_705) >> uint(2)));
    int _709 = _705 & 3;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[int(_707)][_709];
    float _713 = _580 * _623;
    int _715 = _604 + 16;
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
    int _737 = _604 + 24;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    uint _741 = uint(int(uint(int(_739)) >> uint(2)));
    int _743 = int(_739) & 3;
    float _745 = (*spvDescriptorSet0.fp_c3)._m0[int(_741)][_743];
    int _747 = int(_739) + 1;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    int _751 = _747 & 3;
    float _753 = (*spvDescriptorSet0.fp_c3)._m0[int(_749)][_751];
    float _755 = _735 + _641;
    float _757 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _759 = _580 * _657;
    float _761 = 1.0 / _755;
    float _763 = fma(_582, _649, _759);
    float _765 = _580 * _675;
    float _767 = fma(_582, _667, _765);
    float _769 = fma(_578, _685, _763);
    float _771 = fma(_550, 6.2500002968590706586837768554688e-05, 0.5);
    float _773 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _775 = _769 + _693;
    float _777 = fma(_548, 6.2500002968590706586837768554688e-05, 0.5);
    float _779 = fma(_578, _703, _767);
    float2 _2440 = float2(_771, _777);
    float _781 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2440, float2(0.0), isnan(_2440))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2440, float2(0.0), isnan(_2440))).x;
    float _783 = _779 + _711;
    float _785 = _783 * _761;
    float _787 = precise::clamp(_785, 0.0, 1.0);
    float _789 = _580 * _731;
    float _791 = fma(_582, _723, _789);
    float _793 = fma(_578, _745, _791);
    float2 _2467 = float2(_87, _89);
    float4 _796 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2467, float2(0.0), isnan(_2467)), int2(0), component::x).xyzw;
    float _798 = _796.x;
    float _800 = _796.y;
    float _802 = _796.z;
    float _804 = _796.w;
    float _806 = _793 + _753;
    float _808 = _775 * _761;
    float _810 = _806 * _761;
    float2 _2492 = float2(_87, _89);
    float4 _812 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2492, float2(0.0), isnan(_2492)), int2(0), component::w).xyzw;
    float _814 = _812.x;
    float _816 = _812.y;
    float _818 = _812.z;
    float _820 = _812.w;
    float2 _2508 = float2(_773, _757);
    float _822 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2508, float2(0.0), isnan(_2508))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2508, float2(0.0), isnan(_2508))).x;
    float _824 = rint(_598);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    uint _830 = clamp(_828, 0u, 65535u);
    float3 _2530 = float3(_808, _810, float(int(_830)));
    float3 _2534 = select(_2530, float3(0.0), isnan(_2530));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2534.xy, uint(rint(_2534.z)), _787);
    float2 _2540 = float2(_771, _777);
    float _834 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2540, float2(0.0), isnan(_2540)), level(_781)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2540, float2(0.0), isnan(_2540)), level(_781)).x;
    float _836 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _838 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _840 = abs(_167);
    float _842 = log2(_840);
    float _844 = precise::min(_167, -1.0000000116860974230803549289703e-07);
    float _846 = floor(_836);
    float _848 = floor(_838);
    float _850 = _842 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _852 = -_846;
    float _854 = _836 + _852;
    float _856 = exp2(_850);
    float _858 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _860 = _854 + _858;
    float _862 = -_848;
    float _864 = _838 + _862;
    float _866 = -_860;
    float _868 = _866 + 1.0;
    float _870 = 1.0 / _844;
    float _872 = -_800;
    float _874 = fma(_872, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _876 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _878 = _864 + _876;
    float _880 = -_802;
    float _882 = fma(_880, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _884 = -_804;
    float _886 = fma(_884, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _888 = -_878;
    float _890 = _888 + 1.0;
    float _892 = _860 * _878;
    float _894 = _878 * _868;
    float _896 = 1.0 / _874;
    float _898 = _860 * _890;
    float _900 = _868 * _890;
    float _902 = -_798;
    float _904 = fma(_902, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _906 = _552 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _908 = _870 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _910 = 1.0 / _904;
    float _912 = fma(_856, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _914 = precise::clamp(_912, 0.0, 1.0);
    float _916 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[102].x, _906);
    float _918 = fma(_914, -2.0, 3.0);
    float _920 = _914 * _914;
    float _922 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[102].z, _916);
    float _924 = 1.0 / _882;
    float _926 = _920 * _918;
    float _928 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _930 = -_167;
    float _932 = fma(_910, _928, _930);
    float _934 = 1.0 / _886;
    float _936 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _938 = abs(_932);
    float _940 = _938 * _908;
    float _942 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _944 = -_167;
    float _946 = fma(_896, _942, _944);
    float _948 = precise::max(0.0, _936);
    float _950 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _952 = -_167;
    float _954 = fma(_924, _950, _952);
    float _956 = abs(_946);
    float _958 = _956 * _908;
    float _960 = -_926;
    float _962 = _960 + 1.0;
    float _964 = exp2(_940);
    float _966 = abs(_954);
    float _968 = _966 * _908;
    float _970 = fma(_962, (*spvDescriptorSet0.fp_c3)._m0[44].w, _926);
    float _972 = _970 * _948;
    float _974 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _976 = -_167;
    float _978 = fma(_934, _974, _976);
    float _980 = _552 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _982 = exp2(_958);
    float _984 = abs(_978);
    float _986 = _984 * _908;
    float _988 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[101].x, _980);
    float _990 = abs(_894);
    float _992 = _990 * _964;
    float _994 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[101].z, _988);
    float _996 = exp2(_968);
    float _998 = _994 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1000 = exp2(_986);
    float _1002 = abs(_892);
    float _1004 = _1002 * _982;
    float _1006 = _922 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1008 = _992 + _1004;
    float _1010 = trunc(_998);
    int _1012 = int(_1010);
    float _1014 = abs(_898);
    float _1016 = _1014 * _996;
    float _1018 = _1016 + _1008;
    float _1020 = abs(_900);
    float _1022 = _1020 * _1000;
    float _1024 = trunc(_1006);
    int _1026 = int(_1024);
    float _1028 = _1022 + _1018;
    float _1030 = -_1022;
    bool _1032 = _1018 != _1030;
    bool _1034 = isnan(_1018);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan(_1030);
    bool _1040 = _1036 || _1038;
    bool _1042 = _167 >= (-8000.0);
    bool _1044 = isnan(_167);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(-8000.0);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    int _1054 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1056 = _1012 + _1054;
    int _1058 = _1056 + 1;
    float _1060 = 1.0 / _1028;
    float _1062 = _1052 * _972;
    bool _1064 = _1058 >= 0;
    bool _1066 = _1058 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1068 = !_1064;
    bool _1070 = _1066 || _1068;
    int _1072 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1074 = _1026 + _1072;
    int _1076 = _1074 + 1;
    bool _1078 = _1076 < 0;
    bool _1080 = _1078 || _1070;
    float _1082 = _1004 * _1060;
    bool _1084 = _1076 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1086 = _1084 || _1080;
    float _1088 = _992 * _1060;
    float _1090 = _1016 * _1060;
    float _1092 = _1040 ? _1082 : 0.25;
    float _1094 = _1040 ? _1088 : 0.25;
    float _1096 = _1092 * _816;
    float _1098 = _1092;
    if (_1086)
    {
        _1098 = 1.0;
    }
    float _1100 = _1098;
    float _1102 = _1100;
    if (!_1086)
    {
        int _1104 = _1076 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1106 = _1104 + _1058;
        float _1108 = floor(_1006);
        int _1110 = _1106 << 2;
        int _1112 = _1106 >> 2;
        int _1114 = 12 & _1110;
        int _1116 = _1112 << 4;
        int _1118 = _1116 + _1114;
        float _1120 = floor(_998);
        uint _1122 = uint(int(uint(_1118) >> uint(2)));
        uint _1124 = uint(int(uint(int(_1122)) >> uint(2)));
        int _1126 = int(_1122) & 3;
        float _1128 = (*spvDescriptorSet0.fp_c5)._m0[int(_1124)][_1126];
        float _1130 = -_1108;
        float _1132 = _1006 + _1130;
        float _1134 = -_1120;
        float _1136 = _998 + _1134;
        float _1138 = rint(_1128);
        float _1140 = precise::max(_1138, 0.0);
        uint _1142 = uint(_1140);
        uint _1144 = clamp(_1142, 0u, 65535u);
        float3 _2998 = float3(_1136, _1132, float(int(_1144)));
        float3 _3000 = select(_2998, float3(0.0), isnan(_2998));
        float _1146 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3000.xy, uint(rint(_3000.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3000.xy, uint(rint(_3000.z)), level(0.0)).x;
        int _1148 = _1106 << 4;
        int _1150 = _1148 + 1648;
        int _1152 = _1118 + 8048;
        uint _1154 = uint(int(uint(_1152) >> uint(2)));
        uint _1156 = uint(int(uint(int(_1154)) >> uint(2)));
        int _1158 = int(_1154) & 3;
        float _1160 = (*spvDescriptorSet0.fp_c5)._m0[int(_1156)][_1158];
        uint _1162 = uint(int(uint(_1150) >> uint(2)));
        uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
        int _1166 = int(_1162) & 3;
        float _1168 = (*spvDescriptorSet0.fp_c5)._m0[int(_1164)][_1166];
        int _1170 = int(_1162) + 1;
        uint _1172 = uint(int(uint(_1170) >> uint(2)));
        int _1174 = _1170 & 3;
        float _1176 = (*spvDescriptorSet0.fp_c5)._m0[int(_1172)][_1174];
        int _1178 = _1150 + 8;
        uint _1180 = uint(int(uint(_1178) >> uint(2)));
        uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
        int _1184 = int(_1180) & 3;
        float _1186 = (*spvDescriptorSet0.fp_c5)._m0[int(_1182)][_1184];
        int _1188 = int(_1180) + 1;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        int _1192 = _1188 & 3;
        float _1194 = (*spvDescriptorSet0.fp_c5)._m0[int(_1190)][_1192];
        float _1196 = 1.0 / _1160;
        float _1198 = _552 * _1176;
        float _1200 = fma(_550, _1168, _1198);
        float _1202 = _1160 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1204 = fma(_548, _1186, _1200);
        float _1206 = _1204 + _1194;
        float _1208 = precise::clamp(_1206, 0.0, 1.0);
        float _1210 = -_1208;
        float _1212 = _1210 + _1146;
        float _1214 = fma(_1196, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1212);
        float _1216 = _1202 * _1214;
        float _1218 = exp2(_1216);
        float _1220 = 0.0 + _1218;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        _1102 = _1222;
    }
    float _1224 = _1102;
    float _1226 = _1040 ? _1090 : 0.25;
    float _1228 = _1062 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1230 = -_822;
    float _1232 = _1230 + 1.0;
    float _1234 = fma(_1094, _814, _1096);
    float _1236 = _1022 * _1060;
    float _1238 = -_167;
    float _1240 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1242 = _1238 + _1240;
    float _1244 = _1232 * _1228;
    float _1246 = precise::clamp(_1244, 0.0, 1.0);
    float _1248 = fma(_1226, _818, _1234);
    float _1250 = precise::min(_1224, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1252 = abs(_834);
    float _1254 = _1252 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1256 = -_1246;
    float _1258 = fma(_1256, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1260 = -_167;
    float _1262 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1264 = _1260 + _1262;
    float _1266 = _1242 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1268 = precise::clamp(_1266, 0.0, 1.0);
    float _1270 = -_1250;
    float _1272 = _1270 + 1.0;
    float _1274 = _1040 ? _1236 : 0.25;
    float _1276 = -_1254;
    float _1278 = fma(_1052, _1276, 1.0);
    float _1280 = _1264 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = fma(_1268, _1272, _1250);
    float _1286 = -_832;
    float _1288 = _1286 + 1.0;
    float _1290 = fma(_1274, _820, _1248);
    float _1292 = precise::min(_1278, 1.0);
    float _1294 = fma(_1282, _1288, _832);
    float _1296 = precise::min(_1292, _1258);
    float _1298 = precise::min(_1290, 1.0);
    out.m_62.x = _1294;
    out.m_62.y = _1284;
    out.m_62.z = _1298;
    out.m_62.w = _1296;
    out.m_64.x = 1.0;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

