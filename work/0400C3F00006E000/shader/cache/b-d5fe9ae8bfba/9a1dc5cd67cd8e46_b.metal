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
    bool _845 = false;
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
    float2 _1109 = float2(_77, _79);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1109, float2(0.0), isnan(_1109))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1109, float2(0.0), isnan(_1109))).x;
    float _85 = _79 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1124 = float2(_81, _79);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1124, float2(0.0), isnan(_1124))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1124, float2(0.0), isnan(_1124))).x;
    float2 _1132 = float2(_77, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1132, float2(0.0), isnan(_1132))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1132, float2(0.0), isnan(_1132))).x;
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
    float _129 = -_83;
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _133 = -_87;
    float _135 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _137 = 1.0 / _131;
    float _139 = -_89;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _143 = _75 * _101;
    float _145 = _75 * _107;
    float _147 = _75 * _113;
    float _149 = 1.0 / _135;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _153 = _137 * _151;
    float _155 = 1.0 / _141;
    float _157 = _75 * _119;
    float _159 = _75 * _125;
    float _161 = _153 * _127;
    float _163 = _153 * _143;
    float _165 = _161 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _167 = _161 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _171 = _149 * _169;
    float _173 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[32].x, _165);
    float _175 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[30].x, _167);
    float _177 = -_163;
    float _179 = fma(_171, _145, _177);
    float _181 = -_161;
    float _183 = fma(_171, _147, _181);
    float _185 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _173);
    float _187 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _175);
    float _189 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _191 = _155 * _189;
    float _193 = -_153;
    float _195 = _193 + _171;
    float _197 = _185 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _199 = _187 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _201 = -_163;
    float _203 = fma(_191, _157, _201);
    float _205 = -_161;
    float _207 = fma(_191, _159, _205);
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _211 = _197 + _209;
    float _213 = -_153;
    float _215 = _213 + _191;
    float _217 = _195 * _203;
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _221 = _199 + _219;
    float _223 = _211 * _211;
    float _225 = _183 * _215;
    float _227 = -_217;
    float _229 = fma(_179, _215, _227);
    float _231 = _179 * _207;
    float _233 = fma(_221, _221, _223);
    float _235 = -_225;
    float _237 = fma(_195, _207, _235);
    float _239 = _229 * _229;
    float _241 = -_231;
    float _243 = fma(_183, _203, _241);
    float _245 = sqrt(_233);
    float _247 = fma(_237, _237, _239);
    float _249 = fma(_243, _243, _247);
    float _251 = _161 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _253 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[31].x, _251);
    float _255 = rsqrt(_249);
    float _257 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _253);
    bool _261 = _245 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _263 = _257 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _265 = _243 * _255;
    float _267 = _237 * _255;
    float _269 = _229 * _255;
    float _271 = _251;
    float _273 = _215;
    float _275 = _243;
    float _277 = _153;
    if (!_261)
    {
        _271 = _199;
    }
    float _279 = _271;
    float _281 = _279;
    if (!_261)
    {
        _273 = _197;
    }
    float _283 = _273;
    float _285 = _283;
    if (!_261)
    {
        _275 = _263;
    }
    float _287 = _275;
    bool _289 = !_261;
    float _291 = _287;
    if (!_289)
    {
        float _293 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _295 = _245 + _293;
        float _297 = _263 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = rsqrt(_233);
        float _301 = -_263;
        float _303 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _305 = _301 + _303;
        float _307 = abs(_297);
        float _309 = abs(_295);
        float _311 = precise::max(_307, _309);
        float _313 = _305 * _305;
        bool _315 = _311 >= 16.0;
        float _317 = _221 * _299;
        float _319 = _211 * _299;
        float _321 = -_221;
        float _323 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[41].z, _321);
        float _325 = -_211;
        float _327 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[41].z, _325);
        float _329 = _295;
        float _331 = _297;
        int _334 = as_type<int>(_311);
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
        _281 = _540;
        _285 = _542;
    }
    float _544 = _291;
    float _546 = _281;
    float _548 = _285;
    float _550 = _269 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _552 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].x, _550);
    float _554 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].z, _552);
    float _556 = -_554;
    float _558 = fma(_556, _554, 1.0);
    float _560 = -_554;
    float _562 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[35].z, _265);
    float _564 = -_554;
    float _566 = fma(_564, (*spvDescriptorSet0.fp_c3)._m0[35].y, _269);
    float _568 = -_554;
    float _570 = fma(_568, (*spvDescriptorSet0.fp_c3)._m0[35].x, _267);
    float _572 = _558 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _574 = fma(_562, _572, _153);
    float _576 = fma(_566, _572, _161);
    float _578 = fma(_570, _572, _163);
    float _580 = -_574;
    bool _582 = _580 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _584 = float(_582);
    float _586 = -_574;
    bool _588 = _586 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _590 = float(_588);
    float _592 = _584 + _590;
    float _594 = precise::min(_592, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _596 = trunc(_594);
    int _598 = int(_596);
    int _600 = _598 << 6;
    bool _602 = _598 != 0;
    int _604 = _600 + 48;
    uint _607 = uint(int(uint(_604) >> uint(2)));
    uint _609 = uint(int(uint(int(_607)) >> uint(2)));
    int _611 = int(_607) & 3;
    float _613 = (*spvDescriptorSet0.fp_c3)._m0[int(_609)][_611];
    int _615 = int(_607) + 1;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    int _619 = _615 & 3;
    float _621 = (*spvDescriptorSet0.fp_c3)._m0[int(_617)][_619];
    int _623 = _600 + 56;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    uint _627 = uint(int(uint(int(_625)) >> uint(2)));
    int _629 = int(_625) & 3;
    float _631 = (*spvDescriptorSet0.fp_c3)._m0[int(_627)][_629];
    int _633 = int(_625) + 1;
    uint _635 = uint(int(uint(_633) >> uint(2)));
    int _637 = _633 & 3;
    float _639 = (*spvDescriptorSet0.fp_c3)._m0[int(_635)][_637];
    uint _641 = uint(int(uint(_600) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.fp_c3)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.fp_c3)._m0[int(_651)][_653];
    int _657 = _600 + 16;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.fp_c3)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = _600 + 32;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    uint _679 = uint(int(uint(int(_677)) >> uint(2)));
    int _681 = int(_677) & 3;
    float _683 = (*spvDescriptorSet0.fp_c3)._m0[int(_679)][_681];
    int _685 = int(_677) + 1;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    int _689 = _685 & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = _600 + 8;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    uint _697 = uint(int(uint(int(_695)) >> uint(2)));
    int _699 = int(_695) & 3;
    float _701 = (*spvDescriptorSet0.fp_c3)._m0[int(_697)][_699];
    int _703 = int(_695) + 1;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    int _707 = _703 & 3;
    float _709 = (*spvDescriptorSet0.fp_c3)._m0[int(_705)][_707];
    int _711 = _600 + 24;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    float _729 = _576 * _621;
    float _731 = fma(_578, _613, _729);
    int _733 = _600 + 40;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[int(_745)][_747];
    float _751 = fma(_574, _631, _731);
    float _753 = _751 + _639;
    float _755 = _576 * _655;
    float _757 = 1.0 / _753;
    float _759 = fma(_578, _647, _755);
    float _761 = _576 * _673;
    float _763 = fma(_578, _665, _761);
    float _765 = _576 * _691;
    float _767 = fma(_578, _683, _765);
    float _769 = fma(_574, _701, _759);
    float _771 = _769 + _709;
    float _773 = fma(_574, _719, _763);
    float _775 = _771 * _757;
    float _777 = _773 + _727;
    float _779 = fma(_574, _741, _767);
    float _781 = _777 * _757;
    float _783 = _779 + _749;
    float _785 = _783 * _757;
    float _787 = precise::clamp(_785, 0.0, 1.0);
    float _843;
    if (!_602)
    {
        float _789 = rint(_594);
        float _791 = precise::max(_789, 0.0);
        uint _793 = uint(_791);
        uint _795 = clamp(_793, 0u, 65535u);
        float _797 = _787 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _799 = fma(_797, 0.5, _781);
        float _801 = fma(_797, 0.5, _775);
        float _803 = fma(_797, -0.5, _775);
        float _805 = fma(_797, -0.5, _781);
        float3 _2266 = float3(_775, _799, float(int(_795)));
        float3 _2270 = select(_2266, float3(0.0), isnan(_2266));
        float _807 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2270.xy, uint(rint(_2270.z)), _787);
        float3 _2279 = float3(_801, _799, float(int(_795)));
        float3 _2281 = select(_2279, float3(0.0), isnan(_2279));
        float _809 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2281.xy, uint(rint(_2281.z)), _787);
        float3 _2290 = float3(_803, _799, float(int(_795)));
        float3 _2292 = select(_2290, float3(0.0), isnan(_2290));
        float _811 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2292.xy, uint(rint(_2292.z)), _787);
        float3 _2301 = float3(_801, _781, float(int(_795)));
        float3 _2303 = select(_2301, float3(0.0), isnan(_2301));
        float _813 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2303.xy, uint(rint(_2303.z)), _787);
        float3 _2312 = float3(_775, _781, float(int(_795)));
        float3 _2314 = select(_2312, float3(0.0), isnan(_2312));
        float _815 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2314.xy, uint(rint(_2314.z)), _787);
        float3 _2323 = float3(_803, _781, float(int(_795)));
        float3 _2325 = select(_2323, float3(0.0), isnan(_2323));
        float _817 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2325.xy, uint(rint(_2325.z)), _787);
        float3 _2334 = float3(_801, _805, float(int(_795)));
        float3 _2336 = select(_2334, float3(0.0), isnan(_2334));
        float _819 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2336.xy, uint(rint(_2336.z)), _787);
        float3 _2345 = float3(_775, _805, float(int(_795)));
        float3 _2347 = select(_2345, float3(0.0), isnan(_2345));
        float _821 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2347.xy, uint(rint(_2347.z)), _787);
        float3 _2356 = float3(_803, _805, float(int(_795)));
        float3 _2358 = select(_2356, float3(0.0), isnan(_2356));
        float _823 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2358.xy, uint(rint(_2358.z)), _787);
        float _825 = _809 + _807;
        float _827 = _825 + _811;
        float _829 = _827 + _813;
        float _831 = _829 + _815;
        float _833 = _831 + _817;
        float _835 = _833 + _819;
        float _837 = _835 + _821;
        float _839 = _837 + _823;
        float _841 = _839 * 0.111111111938953399658203125;
        _843 = _841;
        _845 = true;
    }
    else
    {
        float _847 = rint(_594);
        float _849 = precise::max(_847, 0.0);
        uint _851 = uint(_849);
        uint _853 = clamp(_851, 0u, 65535u);
        float3 _2405 = float3(_775, _781, float(int(_853)));
        float3 _2407 = select(_2405, float3(0.0), isnan(_2405));
        float _855 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2407.xy, uint(rint(_2407.z)), _787);
        _843 = _855;
    }
    _845 = false;
    float _857 = _843;
    float _859 = _544 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _861 = _544 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _863 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].x, _859);
    float _865 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].x, _861);
    float _867 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[101].z, _863);
    float _869 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[102].z, _865);
    float _871 = _867 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _873 = _869 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _875 = trunc(_871);
    int _877 = int(_875);
    float _879 = trunc(_873);
    int _881 = int(_879);
    int _883 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _885 = _877 + _883;
    int _887 = _885 + 1;
    float _889 = -_153;
    float _891 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _893 = _889 + _891;
    bool _895 = _887 >= 0;
    int _897 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _899 = _881 + _897;
    int _901 = _899 + 1;
    float _903 = -_153;
    float _905 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _907 = _903 + _905;
    bool _909 = _887 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _911 = !_895;
    bool _913 = _909 || _911;
    bool _915 = _901 < 0;
    bool _917 = _915 || _913;
    bool _919 = _901 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _921 = _919 || _917;
    if (_921)
    {
        _277 = 1.0;
    }
    float _923 = _277;
    float _925 = _923;
    if (!_921)
    {
        int _927 = _901 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _929 = _927 + _887;
        float _931 = floor(_873);
        int _933 = _929 << 2;
        int _935 = _929 >> 2;
        int _937 = 12 & _933;
        int _939 = _935 << 4;
        int _941 = _939 + _937;
        float _943 = floor(_871);
        uint _945 = uint(int(uint(_941) >> uint(2)));
        uint _947 = uint(int(uint(int(_945)) >> uint(2)));
        int _949 = int(_945) & 3;
        float _951 = (*spvDescriptorSet0.fp_c5)._m0[int(_947)][_949];
        float _953 = -_931;
        float _955 = _873 + _953;
        float _957 = -_943;
        float _959 = _871 + _957;
        float _961 = rint(_951);
        float _963 = precise::max(_961, 0.0);
        uint _965 = uint(_963);
        uint _967 = clamp(_965, 0u, 65535u);
        float3 _2592 = float3(_959, _955, float(int(_967)));
        float3 _2594 = select(_2592, float3(0.0), isnan(_2592));
        float _969 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2594.xy, uint(rint(_2594.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2594.xy, uint(rint(_2594.z)), level(0.0)).x;
        int _971 = _929 << 4;
        int _973 = _971 + 1648;
        int _975 = _941 + 8048;
        uint _977 = uint(int(uint(_975) >> uint(2)));
        uint _979 = uint(int(uint(int(_977)) >> uint(2)));
        int _981 = int(_977) & 3;
        float _983 = (*spvDescriptorSet0.fp_c5)._m0[int(_979)][_981];
        uint _985 = uint(int(uint(_973) >> uint(2)));
        uint _987 = uint(int(uint(int(_985)) >> uint(2)));
        int _989 = int(_985) & 3;
        float _991 = (*spvDescriptorSet0.fp_c5)._m0[int(_987)][_989];
        int _993 = int(_985) + 1;
        uint _995 = uint(int(uint(_993) >> uint(2)));
        int _997 = _993 & 3;
        float _999 = (*spvDescriptorSet0.fp_c5)._m0[int(_995)][_997];
        int _1001 = _973 + 8;
        uint _1003 = uint(int(uint(_1001) >> uint(2)));
        uint _1005 = uint(int(uint(int(_1003)) >> uint(2)));
        int _1007 = int(_1003) & 3;
        float _1009 = (*spvDescriptorSet0.fp_c5)._m0[int(_1005)][_1007];
        int _1011 = int(_1003) + 1;
        uint _1013 = uint(int(uint(_1011) >> uint(2)));
        int _1015 = _1011 & 3;
        float _1017 = (*spvDescriptorSet0.fp_c5)._m0[int(_1013)][_1015];
        float _1019 = _983 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1021 = _544 * _999;
        float _1023 = fma(_546, _991, _1021);
        float _1025 = 1.0 / _983;
        float _1027 = fma(_548, _1009, _1023);
        float _1029 = _1027 + _1017;
        float _1031 = precise::clamp(_1029, 0.0, 1.0);
        float _1033 = -_1031;
        float _1035 = _1033 + _969;
        float _1037 = fma(_1025, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1035);
        float _1039 = _1019 * _1037;
        float _1041 = exp2(_1039);
        float _1043 = 0.0 + _1041;
        float _1045 = precise::clamp(_1043, 0.0, 1.0);
        _925 = _1045;
    }
    float _1047 = _925;
    float _1049 = precise::min(_1047, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1051 = _893 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1053 = precise::clamp(_1051, 0.0, 1.0);
    float _1055 = -_857;
    float _1057 = _1055 + 1.0;
    float _1059 = _907 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1061 = precise::clamp(_1059, 0.0, 1.0);
    float _1063 = -_1049;
    float _1065 = _1063 + 1.0;
    float _1067 = fma(_1053, _1057, _857);
    float _1069 = fma(_1061, _1065, _1049);
    out.m_52.x = _1067;
    out.m_52.y = _1069;
    out.m_52.z = 1.0;
    out.m_52.w = 1.0;
    out.m_54.x = 1.0;
    out.m_54.y = 0.5;
    out.m_54.z = 0.5;
    out.m_54.w = 1.0;
    return out;
}

