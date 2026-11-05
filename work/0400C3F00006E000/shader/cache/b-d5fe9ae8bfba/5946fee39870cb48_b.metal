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
    texture2d<float> fp_t_tcb_18 [[id(9)]];
    sampler fp_t_tcb_18Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
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
    float2 _1357 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1357, float2(0.0), isnan(_1357))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1357, float2(0.0), isnan(_1357))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1372 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1372, float2(0.0), isnan(_1372))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1372, float2(0.0), isnan(_1372))).x;
    float2 _1380 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1380, float2(0.0), isnan(_1380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1380, float2(0.0), isnan(_1380))).x;
    float _101 = in.m_55.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_55.x;
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
    float _155 = -_99;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _159 = -_97;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _163 = 1.0 / _161;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _167 = _153 * _165;
    float _169 = 1.0 / _157;
    float _171 = _167 * _137;
    float _173 = _167 * _139;
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
    float _257 = fma(_247, _247, _249);
    float _259 = fma(_253, _253, _257);
    float _261 = _171 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _263 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].x, _261);
    float _265 = rsqrt(_259);
    float _267 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].z, _263);
    bool _271 = _255 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _273 = _267 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _275 = _239 * _265;
    float _277 = _253 * _265;
    float _279 = _247 * _265;
    float _281 = _253;
    float _283 = _239;
    float _285 = _207;
    if (!_271)
    {
        _281 = _213;
    }
    float _287 = _281;
    float _289 = _287;
    if (!_271)
    {
        _283 = _273;
    }
    float _291 = _283;
    bool _293 = !_271;
    float _295 = _291;
    if (!_293)
    {
        float _297 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _299 = _255 + _297;
        float _301 = _273 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _303 = rsqrt(_243);
        float _305 = -_273;
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
        _289 = _544;
        _285 = _546;
        _295 = _542;
    }
    float _548 = _289;
    float _550 = _285;
    float _552 = _295;
    float _554 = fma(_548, 6.2500002968590706586837768554688e-05, 0.5);
    float _556 = fma(_550, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2074 = float2(_554, _556);
    float _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2074, float2(0.0), isnan(_2074))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2074, float2(0.0), isnan(_2074))).x;
    float _560 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _562 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].x, _560);
    float _564 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].z, _562);
    float _566 = -_564;
    float _568 = fma(_566, _564, 1.0);
    float _570 = -_564;
    float _572 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[35].z, _277);
    float _574 = -_564;
    float _576 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _578 = -_564;
    float _580 = fma(_578, (*spvDescriptorSet0.fp_c3)._m0[35].x, _279);
    float _582 = _568 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _584 = fma(_572, _582, _167);
    float _586 = fma(_576, _582, _171);
    float _588 = fma(_580, _582, _173);
    float _590 = -_584;
    bool _592 = _590 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _594 = float(_592);
    float _596 = -_584;
    bool _598 = _596 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _600 = float(_598);
    float _602 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _604 = _594 + _600;
    float _606 = precise::min(_604, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _608 = trunc(_606);
    int _610 = int(_608);
    float _612 = rint(_606);
    float _614 = precise::max(_612, 0.0);
    uint _617 = uint(_614);
    uint _619 = clamp(_617, 0u, 65535u);
    int _621 = _610 << 6;
    int _623 = _621 + 48;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    uint _627 = uint(int(uint(int(_625)) >> uint(2)));
    int _629 = int(_625) & 3;
    float _631 = (*spvDescriptorSet0.fp_c3)._m0[int(_627)][_629];
    int _633 = int(_625) + 1;
    uint _635 = uint(int(uint(_633) >> uint(2)));
    int _637 = _633 & 3;
    float _639 = (*spvDescriptorSet0.fp_c3)._m0[int(_635)][_637];
    int _641 = _621 + 56;
    uint _643 = uint(int(uint(_641) >> uint(2)));
    uint _645 = uint(int(uint(int(_643)) >> uint(2)));
    int _647 = int(_643) & 3;
    float _649 = (*spvDescriptorSet0.fp_c3)._m0[int(_645)][_647];
    int _651 = int(_643) + 1;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    int _655 = _651 & 3;
    float _657 = (*spvDescriptorSet0.fp_c3)._m0[int(_653)][_655];
    uint _659 = uint(int(uint(_621) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.fp_c3)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = _621 + 16;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    uint _679 = uint(int(uint(int(_677)) >> uint(2)));
    int _681 = int(_677) & 3;
    float _683 = (*spvDescriptorSet0.fp_c3)._m0[int(_679)][_681];
    int _685 = int(_677) + 1;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    int _689 = _685 & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = _621 + 32;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    uint _697 = uint(int(uint(int(_695)) >> uint(2)));
    int _699 = int(_695) & 3;
    float _701 = (*spvDescriptorSet0.fp_c3)._m0[int(_697)][_699];
    int _703 = int(_695) + 1;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    int _707 = _703 & 3;
    float _709 = (*spvDescriptorSet0.fp_c3)._m0[int(_705)][_707];
    int _711 = _621 + 8;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    int _729 = _621 + 24;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    uint _733 = uint(int(uint(int(_731)) >> uint(2)));
    int _735 = int(_731) & 3;
    float _737 = (*spvDescriptorSet0.fp_c3)._m0[int(_733)][_735];
    int _739 = int(_731) + 1;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    int _743 = _739 & 3;
    float _745 = (*spvDescriptorSet0.fp_c3)._m0[int(_741)][_743];
    float _747 = _586 * _639;
    float _749 = fma(_588, _631, _747);
    int _751 = _621 + 40;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    uint _755 = uint(int(uint(int(_753)) >> uint(2)));
    int _757 = int(_753) & 3;
    float _759 = (*spvDescriptorSet0.fp_c3)._m0[int(_755)][_757];
    int _761 = int(_753) + 1;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    int _765 = _761 & 3;
    float _767 = (*spvDescriptorSet0.fp_c3)._m0[int(_763)][_765];
    float _769 = fma(_584, _649, _749);
    float _771 = _769 + _657;
    float _773 = _586 * _673;
    float _775 = 1.0 / _771;
    float _777 = fma(_588, _665, _773);
    float _779 = _586 * _691;
    float _781 = fma(_588, _683, _779);
    float _783 = _586 * _709;
    float _785 = fma(_588, _701, _783);
    float _787 = fma(_584, _719, _777);
    float _789 = _787 + _727;
    float _791 = fma(_584, _737, _781);
    float _793 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _795 = _791 + _745;
    float _797 = fma(_584, _759, _785);
    float _799 = _789 * _775;
    float _801 = _795 * _775;
    float2 _2498 = float2(_87, _89);
    float4 _804 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2498, float2(0.0), isnan(_2498)), int2(0), component::x).xyzw;
    float _806 = _804.x;
    float _808 = _804.y;
    float _810 = _804.z;
    float _812 = _804.w;
    float2 _2514 = float2(_793, _602);
    float _814 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2514, float2(0.0), isnan(_2514))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2514, float2(0.0), isnan(_2514))).x;
    float _816 = _797 + _767;
    float _818 = _816 * _775;
    float _820 = precise::clamp(_818, 0.0, 1.0);
    float3 _2534 = float3(_799, _801, float(int(_619)));
    float3 _2538 = select(_2534, float3(0.0), isnan(_2534));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2538.xy, uint(rint(_2538.z)), _820);
    float2 _2544 = float2(_87, _89);
    float4 _824 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2544, float2(0.0), isnan(_2544)), int2(0), component::x).xyzw;
    float _826 = _824.x;
    float _828 = _824.y;
    float _830 = _824.z;
    float _832 = _824.w;
    float2 _2560 = float2(_87, _89);
    float4 _834 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2560, float2(0.0), isnan(_2560)), int2(0), component::w).xyzw;
    float _836 = _834.x;
    float _838 = _834.y;
    float _840 = _834.z;
    float _842 = _834.w;
    float2 _2576 = float2(_554, _556);
    float _844 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2576, float2(0.0), isnan(_2576)), level(_558)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2576, float2(0.0), isnan(_2576)), level(_558)).x;
    float _846 = abs(_167);
    float _848 = log2(_846);
    float _850 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _852 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _854 = floor(_850);
    float _856 = _848 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _858 = floor(_852);
    float _860 = -_854;
    float _862 = _850 + _860;
    float _864 = exp2(_856);
    float _866 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _868 = _862 + _866;
    float _870 = -_858;
    float _872 = _852 + _870;
    float _874 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _876 = _872 + _874;
    float _878 = fma(_864, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _880 = precise::clamp(_878, 0.0, 1.0);
    float _882 = -_876;
    float _884 = _882 + 1.0;
    float _886 = _876 * _868;
    float _888 = fma(_880, -2.0, 3.0);
    float _890 = _880 * _880;
    float _892 = -_868;
    float _894 = _892 + 1.0;
    float _896 = _868 * _884;
    float _898 = _890 * _888;
    float _900 = _876 * _894;
    float _902 = precise::min(_167, -1.0000000116860974230803549289703e-07);
    float _904 = _884 * _894;
    float _906 = -_898;
    float _908 = _906 + 1.0;
    float _910 = 1.0 / _902;
    float _912 = fma(_908, (*spvDescriptorSet0.fp_c3)._m0[44].w, _898);
    float _914 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _916 = precise::max(0.0, _914);
    float _918 = _912 * _916;
    float _920 = _552 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _922 = _910 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _924 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[101].x, _920);
    float _926 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[101].z, _924);
    float _928 = _926 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _930 = -_806;
    float _932 = fma(_930, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _934 = -_808;
    float _936 = fma(_934, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _938 = -_810;
    float _940 = fma(_938, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _942 = -_812;
    float _944 = fma(_942, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _946 = _552 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _948 = 1.0 / _936;
    float _950 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[102].x, _946);
    float _952 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[102].z, _950);
    float _954 = 1.0 / _932;
    float _956 = _952 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _958 = 1.0 / _940;
    float _960 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _962 = -_167;
    float _964 = fma(_954, _960, _962);
    float _966 = 1.0 / _944;
    float _968 = abs(_964);
    float _970 = _968 * _922;
    float _972 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _974 = -_167;
    float _976 = fma(_948, _972, _974);
    float _978 = abs(_976);
    float _980 = _978 * _922;
    float _982 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _984 = -_167;
    float _986 = fma(_958, _982, _984);
    float _988 = trunc(_928);
    int _990 = int(_988);
    float _992 = abs(_986);
    float _994 = _992 * _922;
    float _996 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _998 = -_167;
    float _1000 = fma(_966, _996, _998);
    float _1002 = exp2(_970);
    float _1004 = abs(_1000);
    float _1006 = _1004 * _922;
    float _1008 = exp2(_980);
    int _1010 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1012 = _990 + _1010;
    int _1014 = _1012 + 1;
    bool _1016 = _1014 >= 0;
    float _1018 = exp2(_994);
    float _1020 = abs(_896);
    float _1022 = _1020 * _1002;
    bool _1024 = _1014 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1026 = !_1016;
    bool _1028 = _1024 || _1026;
    float _1030 = trunc(_956);
    int _1032 = int(_1030);
    float _1034 = abs(_886);
    float _1036 = _1034 * _1008;
    float _1038 = exp2(_1006);
    float _1040 = abs(_900);
    float _1042 = _1040 * _1018;
    float _1044 = _1022 + _1036;
    float _1046 = _1042 + _1044;
    int _1048 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1050 = _1032 + _1048;
    int _1052 = _1050 + 1;
    bool _1054 = _1052 < 0;
    bool _1056 = _1054 || _1028;
    float _1058 = abs(_904);
    float _1060 = _1058 * _1038;
    bool _1062 = _1052 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1064 = _1062 || _1056;
    float _1066 = _1060 + _1046;
    float _1068 = 1.0 / _1066;
    float _1070 = _904;
    if (_1064)
    {
        _1070 = 1.0;
    }
    float _1072 = _1070;
    float _1074 = _1072;
    if (!_1064)
    {
        int _1076 = _1052 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1078 = _1076 + _1014;
        float _1080 = floor(_956);
        int _1082 = _1078 << 2;
        int _1084 = _1078 >> 2;
        int _1086 = 12 & _1082;
        int _1088 = _1084 << 4;
        int _1090 = _1088 + _1086;
        float _1092 = floor(_928);
        uint _1094 = uint(int(uint(_1090) >> uint(2)));
        uint _1096 = uint(int(uint(int(_1094)) >> uint(2)));
        int _1098 = int(_1094) & 3;
        float _1100 = (*spvDescriptorSet0.fp_c5)._m0[int(_1096)][_1098];
        float _1102 = -_1080;
        float _1104 = _956 + _1102;
        float _1106 = -_1092;
        float _1108 = _928 + _1106;
        float _1110 = rint(_1100);
        float _1112 = precise::max(_1110, 0.0);
        uint _1114 = uint(_1112);
        uint _1116 = clamp(_1114, 0u, 65535u);
        float3 _2983 = float3(_1108, _1104, float(int(_1116)));
        float3 _2985 = select(_2983, float3(0.0), isnan(_2983));
        float _1118 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2985.xy, uint(rint(_2985.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2985.xy, uint(rint(_2985.z)), level(0.0)).x;
        int _1120 = _1078 << 4;
        int _1122 = _1120 + 1648;
        int _1124 = _1090 + 8048;
        uint _1126 = uint(int(uint(_1124) >> uint(2)));
        uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
        int _1130 = int(_1126) & 3;
        float _1132 = (*spvDescriptorSet0.fp_c5)._m0[int(_1128)][_1130];
        uint _1134 = uint(int(uint(_1122) >> uint(2)));
        uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
        int _1138 = int(_1134) & 3;
        float _1140 = (*spvDescriptorSet0.fp_c5)._m0[int(_1136)][_1138];
        int _1142 = int(_1134) + 1;
        uint _1144 = uint(int(uint(_1142) >> uint(2)));
        int _1146 = _1142 & 3;
        float _1148 = (*spvDescriptorSet0.fp_c5)._m0[int(_1144)][_1146];
        int _1150 = _1122 + 8;
        uint _1152 = uint(int(uint(_1150) >> uint(2)));
        uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
        int _1156 = int(_1152) & 3;
        float _1158 = (*spvDescriptorSet0.fp_c5)._m0[int(_1154)][_1156];
        int _1160 = int(_1152) + 1;
        uint _1162 = uint(int(uint(_1160) >> uint(2)));
        int _1164 = _1160 & 3;
        float _1166 = (*spvDescriptorSet0.fp_c5)._m0[int(_1162)][_1164];
        float _1168 = _552 * _1148;
        float _1170 = 1.0 / _1132;
        float _1172 = fma(_548, _1140, _1168);
        float _1174 = _1132 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1176 = fma(_550, _1158, _1172);
        float _1178 = _1176 + _1166;
        float _1180 = precise::clamp(_1178, 0.0, 1.0);
        float _1182 = -_1180;
        float _1184 = _1182 + _1118;
        float _1186 = fma(_1170, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1184);
        float _1188 = _1174 * _1186;
        float _1190 = exp2(_1188);
        float _1192 = 0.0 + _1190;
        float _1194 = precise::clamp(_1192, 0.0, 1.0);
        _1074 = _1194;
    }
    float _1196 = _1074;
    float _1198 = _1036 * _1068;
    float _1200 = -_1060;
    bool _1202 = _1046 != _1200;
    bool _1204 = isnan(_1046);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan(_1200);
    bool _1210 = _1206 || _1208;
    float _1212 = -_167;
    float _1214 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1216 = _1212 + _1214;
    float _1218 = precise::min(_1196, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1220 = _1022 * _1068;
    float _1222 = _1210 ? _1198 : 0.25;
    float _1224 = _1216 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1226 = precise::clamp(_1224, 0.0, 1.0);
    bool _1228 = _167 >= (-8000.0);
    bool _1230 = isnan(_167);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan(-8000.0);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = -_1218;
    float _1242 = _1240 + 1.0;
    float _1244 = _1042 * _1068;
    float _1246 = _1210 ? _1220 : 0.25;
    float _1248 = _1222 * _828;
    float _1250 = _1222 * _838;
    float _1252 = fma(_1226, _1242, _1218);
    float _1254 = _1238 * _918;
    float _1256 = _1210 ? _1244 : 0.25;
    float _1258 = _1060 * _1068;
    float _1260 = fma(_1246, _836, _1250);
    float _1262 = fma(_1246, _826, _1248);
    float _1264 = _1254 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1266 = abs(_844);
    float _1268 = _1266 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1270 = -_814;
    float _1272 = _1270 + 1.0;
    float _1274 = fma(_1256, _840, _1260);
    float _1276 = _1210 ? _1258 : 0.25;
    float _1278 = fma(_1256, _830, _1262);
    float _1280 = -_1268;
    float _1282 = fma(_1238, _1280, 1.0);
    float _1284 = _1272 * _1264;
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = -_167;
    float _1290 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1292 = _1288 + _1290;
    float _1294 = fma(_1276, _832, _1278);
    float _1296 = fma(_1276, _842, _1274);
    float _1298 = -_1286;
    float _1300 = fma(_1298, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1302 = _1292 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1304 = precise::clamp(_1302, 0.0, 1.0);
    float _1306 = precise::min(_1282, 1.0);
    float _1308 = -_822;
    float _1310 = _1308 + 1.0;
    float _1312 = precise::min(_1294, 1.0);
    float _1314 = precise::min(_1306, _1300);
    float _1316 = fma(_1304, _1310, _822);
    float _1318 = precise::min(_1296, 1.0);
    out.m_62.x = _1316;
    out.m_62.y = _1252;
    out.m_62.z = _1318;
    out.m_62.w = _1314;
    out.m_64.x = _1312;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

