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
    bool _867 = false;
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
    float2 _1130 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1130, float2(0.0), isnan(_1130))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1130, float2(0.0), isnan(_1130))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1145 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1145, float2(0.0), isnan(_1145))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1145, float2(0.0), isnan(_1145))).x;
    float2 _1153 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1153, float2(0.0), isnan(_1153))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1153, float2(0.0), isnan(_1153))).x;
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
    float _131 = _79 * _105;
    float _133 = _79 * _117;
    float _135 = -_87;
    float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _139 = _79 * _99;
    float _141 = 1.0 / _137;
    float _143 = -_91;
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _147 = -_93;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _151 = _79 * _111;
    float _153 = 1.0 / _145;
    float _155 = 1.0 / _149;
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _159 = _141 * _157;
    float _161 = _79 * _123;
    float _163 = _79 * _129;
    float _165 = _159 * _139;
    float _167 = _159 * _131;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _171 = _153 * _169;
    float _173 = _165 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _175 = _165 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _177 = -_167;
    float _179 = fma(_171, _151, _177);
    float _181 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[32].x, _173);
    float _183 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _185 = _155 * _183;
    float _187 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[30].x, _175);
    float _189 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[32].z, _181);
    float _191 = -_165;
    float _193 = fma(_171, _133, _191);
    float _195 = -_159;
    float _197 = _195 + _171;
    float _199 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[30].z, _187);
    float _201 = _189 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _203 = -_167;
    float _205 = fma(_185, _161, _203);
    float _207 = -_165;
    float _209 = fma(_185, _163, _207);
    float _211 = _199 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _215 = _201 + _213;
    float _217 = -_159;
    float _219 = _217 + _185;
    float _221 = _197 * _205;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _225 = _211 + _223;
    float _227 = _215 * _215;
    float _229 = _193 * _219;
    float _231 = -_221;
    float _233 = fma(_179, _219, _231);
    float _235 = _179 * _209;
    float _237 = fma(_225, _225, _227);
    float _239 = -_229;
    float _241 = fma(_197, _209, _239);
    float _243 = _233 * _233;
    float _245 = -_235;
    float _247 = fma(_193, _205, _245);
    float _249 = sqrt(_237);
    float _251 = _165 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _253 = fma(_241, _241, _243);
    float _255 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].x, _251);
    float _257 = fma(_247, _247, _253);
    float _259 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[31].z, _255);
    float _261 = rsqrt(_257);
    float _263 = _259 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _267 = _249 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _269 = _241 * _261;
    float _271 = _233 * _261;
    float _273 = _247 * _261;
    float _275 = _261;
    float _277 = _257;
    float _279 = _201;
    float _281 = _159;
    if (!_267)
    {
        _275 = _211;
    }
    float _283 = _275;
    float _285 = _283;
    if (!_267)
    {
        _277 = _263;
    }
    float _287 = _277;
    bool _289 = !_267;
    float _291 = _287;
    if (!_289)
    {
        float _293 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _295 = _249 + _293;
        float _297 = _263 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = rsqrt(_237);
        float _301 = -_263;
        float _303 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _305 = _301 + _303;
        float _307 = abs(_297);
        float _309 = abs(_295);
        float _311 = precise::max(_307, _309);
        float _313 = _305 * _305;
        bool _315 = _311 >= 16.0;
        float _317 = _225 * _299;
        float _319 = _215 * _299;
        float _321 = -_225;
        float _323 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[41].z, _321);
        float _325 = -_215;
        float _327 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[41].z, _325);
        float _329 = _295;
        float _331 = _297;
        int _334 = as_type<int>(_305);
        float _336 = _327;
        if (_315)
        {
            float _338 = _295 * 0.0625;
            _329 = _338;
        }
        float _340 = _329;
        if (_315)
        {
            float _342 = _297 * 0.0625;
            _331 = _342;
        }
        float _344 = _331;
        float _346 = fma(_323, _323, _313);
        float _348 = abs(_340);
        bool _350 = _348 != 0.0;
        bool _352 = isnan(_348);
        bool _354 = _350 || _352;
        bool _356 = isnan(0.0);
        bool _358 = _354 || _356;
        float _360 = fma(_327, _327, _346);
        float _362 = abs(_344);
        bool _364 = _362 == 0.0;
        float _366 = abs(_344);
        bool _368 = _366 == 0.0;
        bool _370 = !_358;
        bool _372 = _368 && _370;
        float _374 = sqrt(_360);
        bool _376 = false;
        int _378 = as_type<int>(_360);
        if (_372)
        {
            bool _380 = as_type<int>(_344) >= 0;
            _376 = _380;
        }
        bool _382 = _376;
        int _384 = _382 ? (-1) : 0;
        if (_372)
        {
            int _386 = _382 ? 0 : 1078530011;
            _334 = _386;
        }
        int _388 = _334;
        if (_372)
        {
            int _390 = int(0x80000000) & as_type<int>(_340);
            int _392 = _388 | _390;
            _336 = as_type<float>(_392);
        }
        float _394 = _336;
        bool _396 = !_358;
        bool _398 = _396 && _364;
        float _400 = _394;
        float _402 = _394;
        if (!_398)
        {
            float _404 = abs(_340);
            bool _406 = _404 != as_type<float>(0x7f800000u /* inf */);
            bool _408 = isnan(_404);
            bool _410 = _406 || _408;
            bool _412 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _414 = _410 || _412;
            float _416 = abs(_344);
            bool _418 = _416 == as_type<float>(0x7f800000u /* inf */);
            float _420 = abs(_344);
            bool _422 = _420 == as_type<float>(0x7f800000u /* inf */);
            bool _424 = !_414;
            bool _426 = _422 && _424;
            if (_426)
            {
                bool _428 = as_type<int>(_344) >= 0;
                _384 = _428 ? (-1) : 0;
            }
            int _430 = _384;
            if (_426)
            {
                _378 = 1075235812;
            }
            int _432 = _378;
            int _434 = _432;
            if (_426)
            {
                int _436 = ~_430;
                int _438 = (_436 != 0) ? _432 : 1061752795;
                _434 = _438;
            }
            int _440 = _434;
            if (_426)
            {
                int _442 = int(0x80000000) & as_type<int>(_340);
                int _444 = _440 | _442;
                _400 = as_type<float>(_444);
            }
            float _446 = _400;
            bool _448 = !_414;
            bool _450 = _448 && _418;
            _402 = _446;
            if (!_450)
            {
                float _452 = abs(_340);
                float _454 = abs(_344);
                float _456 = precise::max(_452, _454);
                float _458 = abs(_340);
                float _460 = abs(_344);
                float _462 = precise::min(_458, _460);
                float _464 = 1.0 / _456;
                float _466 = abs(_340);
                float _468 = abs(_344);
                bool _470 = _466 > _468;
                bool _472 = as_type<int>(_344) >= 0;
                float _474 = _462 * _464;
                float _476 = abs(_340);
                float _478 = abs(_344);
                float _480 = _476 + _478;
                int _482 = as_type<int>(_340) & int(0x80000000);
                float _484 = _474 * _474;
                bool _486 = _480 > as_type<float>(0x7f800000u /* inf */);
                bool _488 = isnan(_480);
                bool _490 = _486 || _488;
                bool _492 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _494 = _490 || _492;
                float _496 = _484 + 11.33538818359375;
                float _498 = fma(_484, _496, 28.84246826171875);
                float _500 = fma(_484, _498, 19.6966705322265625);
                float _502 = fma(_484, -0.82336294651031494140625, -5.674867153167724609375);
                float _504 = fma(_484, _502, -6.565555095672607421875);
                float _506 = 1.0 / _500;
                float _508 = _484 * _504;
                float _510 = _474 * _508;
                float _512 = fma(_510, _506, _474);
                float _514 = _512;
                _402 = _480;
                if (_470)
                {
                    float _516 = -_512;
                    float _518 = _516 + 1.57079637050628662109375;
                    _514 = _518;
                }
                float _520 = _514;
                int _522 = as_type<int>(_520);
                if (!_472)
                {
                    float _524 = -_520;
                    float _526 = _524 + 3.1415927410125732421875;
                    _522 = as_type<int>(_526);
                }
                int _528 = _522;
                if (!_494)
                {
                    int _530 = _482 | _528;
                    _402 = as_type<float>(_530);
                }
            }
        }
        float _532 = _402;
        float _534 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _536 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _538 = _374 + _536;
        float _540 = fma(_317, _534, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _542 = fma(_319, _534, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _291 = _538;
        _285 = _540;
        _279 = _542;
    }
    float _544 = _291;
    float _546 = _285;
    float _548 = _279;
    float2 _1841 = float2(_81, _83);
    float2 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1841, float2(0.0), isnan(_1841))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1841, float2(0.0), isnan(_1841))).xy;
    float _554 = _552.x;
    float _556 = _552.y;
    float _558 = fma(_554, 2.0, -1.0);
    float _560 = fma(_556, 2.0, -1.0);
    float _562 = _558 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _564 = _560 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _566 = fma(_562, 2.0, _81);
    float _568 = fma(_564, 2.0, _83);
    float2 _1873 = float2(_566, _568);
    float _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1873, float2(0.0), isnan(_1873))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1873, float2(0.0), isnan(_1873))).x;
    float _572 = _271 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _574 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[35].x, _572);
    float _576 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].z, _574);
    float _578 = -_576;
    float _580 = fma(_578, _576, 1.0);
    float _582 = -_576;
    float _584 = fma(_582, (*spvDescriptorSet0.fp_c3)._m0[35].z, _273);
    float _586 = -_576;
    float _588 = fma(_586, (*spvDescriptorSet0.fp_c3)._m0[35].y, _271);
    float _590 = -_576;
    float _592 = fma(_590, (*spvDescriptorSet0.fp_c3)._m0[35].x, _269);
    float _594 = _580 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _596 = fma(_584, _594, _159);
    float _598 = fma(_588, _594, _165);
    float _600 = fma(_592, _594, _167);
    float _602 = -_596;
    bool _604 = _602 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _606 = float(_604);
    float _608 = -_596;
    bool _610 = _608 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _612 = float(_610);
    float _614 = _606 + _612;
    float _616 = precise::min(_614, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _618 = trunc(_616);
    int _620 = int(_618);
    int _622 = _620 << 6;
    bool _624 = _620 != 0;
    int _626 = _622 + 48;
    uint _629 = uint(int(uint(_626) >> uint(2)));
    uint _631 = uint(int(uint(int(_629)) >> uint(2)));
    int _633 = int(_629) & 3;
    float _635 = (*spvDescriptorSet0.fp_c3)._m0[int(_631)][_633];
    int _637 = int(_629) + 1;
    uint _639 = uint(int(uint(_637) >> uint(2)));
    int _641 = _637 & 3;
    float _643 = (*spvDescriptorSet0.fp_c3)._m0[int(_639)][_641];
    int _645 = _622 + 56;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.fp_c3)._m0[int(_657)][_659];
    uint _663 = uint(int(uint(_622) >> uint(2)));
    uint _665 = uint(int(uint(int(_663)) >> uint(2)));
    int _667 = int(_663) & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    int _671 = int(_663) + 1;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    int _675 = _671 & 3;
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[int(_673)][_675];
    int _679 = _622 + 16;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    uint _683 = uint(int(uint(int(_681)) >> uint(2)));
    int _685 = int(_681) & 3;
    float _687 = (*spvDescriptorSet0.fp_c3)._m0[int(_683)][_685];
    int _689 = int(_681) + 1;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    int _693 = _689 & 3;
    float _695 = (*spvDescriptorSet0.fp_c3)._m0[int(_691)][_693];
    int _697 = _622 + 32;
    uint _699 = uint(int(uint(_697) >> uint(2)));
    uint _701 = uint(int(uint(int(_699)) >> uint(2)));
    int _703 = int(_699) & 3;
    float _705 = (*spvDescriptorSet0.fp_c3)._m0[int(_701)][_703];
    int _707 = int(_699) + 1;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    int _711 = _707 & 3;
    float _713 = (*spvDescriptorSet0.fp_c3)._m0[int(_709)][_711];
    int _715 = _622 + 8;
    uint _717 = uint(int(uint(_715) >> uint(2)));
    uint _719 = uint(int(uint(int(_717)) >> uint(2)));
    int _721 = int(_717) & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    int _725 = int(_717) + 1;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    int _729 = _725 & 3;
    float _731 = (*spvDescriptorSet0.fp_c3)._m0[int(_727)][_729];
    int _733 = _622 + 24;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[int(_745)][_747];
    float _751 = _598 * _643;
    float _753 = fma(_600, _635, _751);
    int _755 = _622 + 40;
    uint _757 = uint(int(uint(_755) >> uint(2)));
    uint _759 = uint(int(uint(int(_757)) >> uint(2)));
    int _761 = int(_757) & 3;
    float _763 = (*spvDescriptorSet0.fp_c3)._m0[int(_759)][_761];
    int _765 = int(_757) + 1;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    int _769 = _765 & 3;
    float _771 = (*spvDescriptorSet0.fp_c3)._m0[int(_767)][_769];
    float _773 = fma(_596, _653, _753);
    float _775 = _773 + _661;
    float _777 = _598 * _677;
    float _779 = 1.0 / _775;
    float _781 = fma(_600, _669, _777);
    float _783 = _598 * _695;
    float _785 = fma(_600, _687, _783);
    float _787 = _598 * _713;
    float _789 = fma(_600, _705, _787);
    float _791 = fma(_596, _723, _781);
    float _793 = _791 + _731;
    float _795 = fma(_596, _741, _785);
    float _797 = _795 + _749;
    float _799 = fma(_596, _763, _789);
    float _801 = _793 * _779;
    float _803 = _797 * _779;
    float _805 = _799 + _771;
    float _807 = _805 * _779;
    float _809 = precise::clamp(_807, 0.0, 1.0);
    float _865;
    if (!_624)
    {
        float _811 = rint(_616);
        float _813 = precise::max(_811, 0.0);
        uint _815 = uint(_813);
        uint _817 = clamp(_815, 0u, 65535u);
        float _819 = _809 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _821 = fma(_819, 0.5, _803);
        float _823 = fma(_819, 0.5, _801);
        float _825 = fma(_819, -0.5, _801);
        float _827 = fma(_819, -0.5, _803);
        float3 _2320 = float3(_801, _821, float(int(_817)));
        float3 _2324 = select(_2320, float3(0.0), isnan(_2320));
        float _829 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2324.xy, uint(rint(_2324.z)), _809);
        float3 _2333 = float3(_823, _821, float(int(_817)));
        float3 _2335 = select(_2333, float3(0.0), isnan(_2333));
        float _831 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2335.xy, uint(rint(_2335.z)), _809);
        float3 _2344 = float3(_825, _821, float(int(_817)));
        float3 _2346 = select(_2344, float3(0.0), isnan(_2344));
        float _833 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2346.xy, uint(rint(_2346.z)), _809);
        float3 _2355 = float3(_823, _803, float(int(_817)));
        float3 _2357 = select(_2355, float3(0.0), isnan(_2355));
        float _835 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2357.xy, uint(rint(_2357.z)), _809);
        float3 _2366 = float3(_801, _803, float(int(_817)));
        float3 _2368 = select(_2366, float3(0.0), isnan(_2366));
        float _837 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2368.xy, uint(rint(_2368.z)), _809);
        float3 _2377 = float3(_825, _803, float(int(_817)));
        float3 _2379 = select(_2377, float3(0.0), isnan(_2377));
        float _839 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2379.xy, uint(rint(_2379.z)), _809);
        float3 _2388 = float3(_823, _827, float(int(_817)));
        float3 _2390 = select(_2388, float3(0.0), isnan(_2388));
        float _841 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2390.xy, uint(rint(_2390.z)), _809);
        float3 _2399 = float3(_801, _827, float(int(_817)));
        float3 _2401 = select(_2399, float3(0.0), isnan(_2399));
        float _843 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2401.xy, uint(rint(_2401.z)), _809);
        float3 _2410 = float3(_825, _827, float(int(_817)));
        float3 _2412 = select(_2410, float3(0.0), isnan(_2410));
        float _845 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2412.xy, uint(rint(_2412.z)), _809);
        float _847 = _831 + _829;
        float _849 = _847 + _833;
        float _851 = _849 + _835;
        float _853 = _851 + _837;
        float _855 = _853 + _839;
        float _857 = _855 + _841;
        float _859 = _857 + _843;
        float _861 = _859 + _845;
        float _863 = _861 * 0.111111111938953399658203125;
        _865 = _863;
        _867 = true;
    }
    else
    {
        float _869 = rint(_616);
        float _871 = precise::max(_869, 0.0);
        uint _873 = uint(_871);
        uint _875 = clamp(_873, 0u, 65535u);
        float3 _2459 = float3(_801, _803, float(int(_875)));
        float3 _2461 = select(_2459, float3(0.0), isnan(_2459));
        float _877 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2461.xy, uint(rint(_2461.z)), _809);
        _865 = _877;
    }
    _867 = false;
    float _879 = _865;
    float _881 = _544 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _883 = _544 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _885 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].x, _881);
    float _887 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].x, _883);
    float _889 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[101].z, _885);
    float _891 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[102].z, _887);
    float _893 = _889 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _895 = _891 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _897 = trunc(_893);
    int _899 = int(_897);
    float _901 = trunc(_895);
    int _903 = int(_901);
    int _905 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _907 = _899 + _905;
    int _909 = _907 + 1;
    float _911 = -_159;
    float _913 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _915 = _911 + _913;
    bool _917 = _909 >= 0;
    int _919 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _921 = _903 + _919;
    int _923 = _921 + 1;
    float _925 = -_159;
    float _927 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _929 = _925 + _927;
    bool _931 = _909 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _933 = !_917;
    bool _935 = _931 || _933;
    bool _937 = _923 < 0;
    bool _939 = _937 || _935;
    bool _941 = _923 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _943 = _941 || _939;
    if (_943)
    {
        _281 = 1.0;
    }
    float _945 = _281;
    float _947 = _945;
    if (!_943)
    {
        int _949 = _923 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _951 = _949 + _909;
        float _953 = floor(_895);
        int _955 = _951 << 2;
        int _957 = _951 >> 2;
        int _959 = 12 & _955;
        int _961 = _957 << 4;
        int _963 = _961 + _959;
        float _965 = floor(_893);
        uint _967 = uint(int(uint(_963) >> uint(2)));
        uint _969 = uint(int(uint(int(_967)) >> uint(2)));
        int _971 = int(_967) & 3;
        float _973 = (*spvDescriptorSet0.fp_c5)._m0[int(_969)][_971];
        float _975 = -_953;
        float _977 = _895 + _975;
        float _979 = -_965;
        float _981 = _893 + _979;
        float _983 = rint(_973);
        float _985 = precise::max(_983, 0.0);
        uint _987 = uint(_985);
        uint _989 = clamp(_987, 0u, 65535u);
        float3 _2646 = float3(_981, _977, float(int(_989)));
        float3 _2648 = select(_2646, float3(0.0), isnan(_2646));
        float _991 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2648.xy, uint(rint(_2648.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2648.xy, uint(rint(_2648.z)), level(0.0)).x;
        int _993 = _951 << 4;
        int _995 = _993 + 1648;
        int _997 = _963 + 8048;
        uint _999 = uint(int(uint(_997) >> uint(2)));
        uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
        int _1003 = int(_999) & 3;
        float _1005 = (*spvDescriptorSet0.fp_c5)._m0[int(_1001)][_1003];
        uint _1007 = uint(int(uint(_995) >> uint(2)));
        uint _1009 = uint(int(uint(int(_1007)) >> uint(2)));
        int _1011 = int(_1007) & 3;
        float _1013 = (*spvDescriptorSet0.fp_c5)._m0[int(_1009)][_1011];
        int _1015 = int(_1007) + 1;
        uint _1017 = uint(int(uint(_1015) >> uint(2)));
        int _1019 = _1015 & 3;
        float _1021 = (*spvDescriptorSet0.fp_c5)._m0[int(_1017)][_1019];
        int _1023 = _995 + 8;
        uint _1025 = uint(int(uint(_1023) >> uint(2)));
        uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
        int _1029 = int(_1025) & 3;
        float _1031 = (*spvDescriptorSet0.fp_c5)._m0[int(_1027)][_1029];
        int _1033 = int(_1025) + 1;
        uint _1035 = uint(int(uint(_1033) >> uint(2)));
        int _1037 = _1033 & 3;
        float _1039 = (*spvDescriptorSet0.fp_c5)._m0[int(_1035)][_1037];
        float _1041 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1043 = _544 * _1021;
        float _1045 = fma(_546, _1013, _1043);
        float _1047 = 1.0 / _1005;
        float _1049 = fma(_548, _1031, _1045);
        float _1051 = _1049 + _1039;
        float _1053 = precise::clamp(_1051, 0.0, 1.0);
        float _1055 = -_1053;
        float _1057 = _1055 + _991;
        float _1059 = fma(_1047, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1057);
        float _1061 = _1041 * _1059;
        float _1063 = exp2(_1061);
        float _1065 = 0.0 + _1063;
        float _1067 = precise::clamp(_1065, 0.0, 1.0);
        _947 = _1067;
    }
    float _1069 = _947;
    float _1071 = precise::min(_1069, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1073 = _915 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1075 = precise::clamp(_1073, 0.0, 1.0);
    float _1077 = -_879;
    float _1079 = _1077 + 1.0;
    float _1081 = _929 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1083 = precise::clamp(_1081, 0.0, 1.0);
    float _1085 = -_1071;
    float _1087 = _1085 + 1.0;
    float _1089 = fma(_1075, _1079, _879);
    float _1091 = fma(_1083, _1087, _1071);
    out.m_56.x = _1089;
    out.m_56.y = _1091;
    out.m_56.z = 1.0;
    out.m_56.w = 1.0;
    out.m_58.x = _570;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

