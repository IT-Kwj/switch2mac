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
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
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
    float2 _1334 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1334, float2(0.0), isnan(_1334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1334, float2(0.0), isnan(_1334))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1349 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1349, float2(0.0), isnan(_1349))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1349, float2(0.0), isnan(_1349))).x;
    float2 _1357 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1357, float2(0.0), isnan(_1357))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1357, float2(0.0), isnan(_1357))).x;
    float _99 = in.m_53.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_53.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_55.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_55.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_57.x;
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
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _151 = -_95;
    float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _155 = 1.0 / _149;
    float _157 = -_97;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _161 = 1.0 / _153;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _165 = _155 * _163;
    float _167 = 1.0 / _159;
    float _169 = _165 * _135;
    float _171 = _165 * _137;
    float _173 = _169 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _175 = _169 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _179 = _161 * _177;
    float _181 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[32].x, _173);
    float _183 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[30].x, _175);
    float _185 = -_171;
    float _187 = fma(_179, _141, _185);
    float _189 = -_165;
    float _191 = _189 + _179;
    float _193 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[32].z, _181);
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _197 = _167 * _195;
    float _199 = -_169;
    float _201 = fma(_179, _139, _199);
    float _203 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[30].z, _183);
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _207 = -_171;
    float _209 = fma(_197, _143, _207);
    float _211 = -_169;
    float _213 = fma(_197, _145, _211);
    float _215 = _203 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _219 = _205 + _217;
    float _221 = -_165;
    float _223 = _221 + _197;
    float _225 = _191 * _209;
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _229 = _215 + _227;
    float _231 = _219 * _219;
    float _233 = _201 * _223;
    float _235 = -_225;
    float _237 = fma(_187, _223, _235);
    float _239 = _187 * _213;
    float _241 = fma(_229, _229, _231);
    float _243 = -_233;
    float _245 = fma(_191, _213, _243);
    float _247 = _237 * _237;
    float _249 = -_239;
    float _251 = fma(_201, _209, _249);
    float _253 = sqrt(_241);
    float _255 = _169 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _257 = fma(_245, _245, _247);
    float _259 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[31].x, _255);
    float _261 = fma(_251, _251, _257);
    float _263 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[31].z, _259);
    float _265 = rsqrt(_261);
    float _267 = _263 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _271 = _253 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _273 = _245 * _265;
    float _275 = _237 * _265;
    float _277 = _251 * _265;
    float _279 = _251;
    float _281 = _265;
    float _283 = _205;
    if (!_271)
    {
        _279 = _215;
    }
    float _285 = _279;
    float _287 = _285;
    if (!_271)
    {
        _281 = _267;
    }
    float _289 = _281;
    bool _291 = !_271;
    float _293 = _289;
    if (!_291)
    {
        float _295 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _297 = _253 + _295;
        float _299 = _267 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _301 = rsqrt(_241);
        float _303 = -_267;
        float _305 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _307 = _303 + _305;
        float _309 = abs(_299);
        float _311 = abs(_297);
        float _313 = precise::max(_309, _311);
        float _315 = _307 * _307;
        bool _317 = _313 >= 16.0;
        float _319 = _229 * _301;
        float _321 = _219 * _301;
        float _323 = -_229;
        float _325 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[41].z, _323);
        float _327 = -_219;
        float _329 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[41].z, _327);
        float _331 = _297;
        float _333 = _299;
        int _336 = as_type<int>(_329);
        if (_317)
        {
            float _338 = _297 * 0.0625;
            _331 = _338;
        }
        float _340 = _331;
        if (_317)
        {
            float _342 = _299 * 0.0625;
            _333 = _342;
        }
        float _344 = _333;
        float _346 = fma(_325, _325, _315);
        float _348 = abs(_340);
        bool _350 = _348 != 0.0;
        bool _352 = isnan(_348);
        bool _354 = _350 || _352;
        bool _356 = isnan(0.0);
        bool _358 = _354 || _356;
        float _360 = fma(_329, _329, _346);
        float _362 = abs(_344);
        bool _364 = _362 == 0.0;
        float _366 = abs(_344);
        bool _368 = _366 == 0.0;
        bool _370 = !_358;
        bool _372 = _368 && _370;
        float _374 = sqrt(_360);
        bool _376 = false;
        if (_372)
        {
            bool _378 = as_type<int>(_344) >= 0;
            _376 = _378;
        }
        bool _380 = _376;
        int _382 = _380 ? (-1) : 0;
        if (_372)
        {
            int _384 = _380 ? 0 : 1078530011;
            _336 = _384;
        }
        int _386 = _336;
        int _388 = _386;
        if (_372)
        {
            int _390 = int(0x80000000) & as_type<int>(_340);
            int _392 = _386 | _390;
            _388 = _392;
        }
        int _394 = _388;
        bool _396 = !_358;
        bool _398 = _396 && _364;
        int _400 = _394;
        float _402 = as_type<float>(_394);
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
                _382 = _428 ? (-1) : 0;
            }
            int _430 = _382;
            if (_426)
            {
                _400 = 1075235812;
            }
            int _432 = _400;
            int _434 = _432;
            if (_426)
            {
                int _436 = ~_430;
                int _438 = (_436 != 0) ? _432 : 1061752795;
                _434 = _438;
            }
            int _440 = _434;
            float _442 = as_type<float>(_440);
            if (_426)
            {
                int _444 = int(0x80000000) & as_type<int>(_340);
                int _446 = _440 | _444;
                _442 = as_type<float>(_446);
            }
            float _448 = _442;
            bool _450 = !_414;
            bool _452 = _450 && _418;
            _402 = _448;
            if (!_452)
            {
                float _454 = abs(_340);
                float _456 = abs(_344);
                float _458 = precise::max(_454, _456);
                float _460 = abs(_340);
                float _462 = abs(_344);
                float _464 = precise::min(_460, _462);
                float _466 = 1.0 / _458;
                float _468 = abs(_340);
                float _470 = abs(_344);
                bool _472 = _468 > _470;
                bool _474 = as_type<int>(_344) >= 0;
                float _476 = _464 * _466;
                float _478 = abs(_340);
                float _480 = abs(_344);
                float _482 = _478 + _480;
                int _484 = as_type<int>(_340) & int(0x80000000);
                float _486 = _476 * _476;
                bool _488 = _482 > as_type<float>(0x7f800000u /* inf */);
                bool _490 = isnan(_482);
                bool _492 = _488 || _490;
                bool _494 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _496 = _492 || _494;
                float _498 = _486 + 11.33538818359375;
                float _500 = fma(_486, _498, 28.84246826171875);
                float _502 = fma(_486, _500, 19.6966705322265625);
                float _504 = fma(_486, -0.82336294651031494140625, -5.674867153167724609375);
                float _506 = fma(_486, _504, -6.565555095672607421875);
                float _508 = 1.0 / _502;
                float _510 = _486 * _506;
                float _512 = _476 * _510;
                float _514 = fma(_512, _508, _476);
                float _516 = _514;
                _402 = _482;
                if (_472)
                {
                    float _518 = -_514;
                    float _520 = _518 + 1.57079637050628662109375;
                    _516 = _520;
                }
                float _522 = _516;
                int _524 = as_type<int>(_522);
                if (!_474)
                {
                    float _526 = -_522;
                    float _528 = _526 + 3.1415927410125732421875;
                    _524 = as_type<int>(_528);
                }
                int _530 = _524;
                if (!_496)
                {
                    int _532 = _484 | _530;
                    _402 = as_type<float>(_532);
                }
            }
        }
        float _534 = _402;
        float _536 = fma(_534, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _538 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _540 = _374 + _538;
        float _542 = fma(_319, _536, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _544 = fma(_321, _536, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _293 = _540;
        _287 = _542;
        _283 = _544;
    }
    float _546 = _293;
    float _548 = _287;
    float _550 = _283;
    float _552 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _554 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].x, _552);
    float _556 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].z, _554);
    float _558 = -_556;
    float _560 = fma(_558, _556, 1.0);
    float _562 = -_556;
    float _564 = fma(_562, (*spvDescriptorSet0.fp_c3)._m0[35].z, _277);
    float _566 = -_556;
    float _568 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _570 = -_556;
    float _572 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[35].x, _273);
    float _574 = _560 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _576 = fma(_564, _574, _165);
    float _578 = fma(_568, _574, _169);
    float _580 = fma(_572, _574, _171);
    float _582 = -_576;
    bool _584 = _582 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _586 = float(_584);
    float _588 = -_576;
    bool _590 = _588 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _592 = float(_590);
    float _594 = _586 + _592;
    float _596 = precise::min(_594, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _598 = trunc(_596);
    int _600 = int(_598);
    int _602 = _600 << 6;
    int _604 = _602 + 48;
    uint _607 = uint(int(uint(_604) >> uint(2)));
    uint _609 = uint(int(uint(int(_607)) >> uint(2)));
    int _611 = int(_607) & 3;
    float _613 = (*spvDescriptorSet0.fp_c3)._m0[int(_609)][_611];
    int _615 = int(_607) + 1;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    int _619 = _615 & 3;
    float _621 = (*spvDescriptorSet0.fp_c3)._m0[int(_617)][_619];
    int _623 = _602 + 56;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    uint _627 = uint(int(uint(int(_625)) >> uint(2)));
    int _629 = int(_625) & 3;
    float _631 = (*spvDescriptorSet0.fp_c3)._m0[int(_627)][_629];
    int _633 = int(_625) + 1;
    uint _635 = uint(int(uint(_633) >> uint(2)));
    int _637 = _633 & 3;
    float _639 = (*spvDescriptorSet0.fp_c3)._m0[int(_635)][_637];
    int _641 = _602 + 16;
    uint _643 = uint(int(uint(_641) >> uint(2)));
    uint _645 = uint(int(uint(int(_643)) >> uint(2)));
    int _647 = int(_643) & 3;
    float _649 = (*spvDescriptorSet0.fp_c3)._m0[int(_645)][_647];
    int _651 = int(_643) + 1;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    int _655 = _651 & 3;
    float _657 = (*spvDescriptorSet0.fp_c3)._m0[int(_653)][_655];
    uint _659 = uint(int(uint(_602) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.fp_c3)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = _602 + 32;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    uint _679 = uint(int(uint(int(_677)) >> uint(2)));
    int _681 = int(_677) & 3;
    float _683 = (*spvDescriptorSet0.fp_c3)._m0[int(_679)][_681];
    int _685 = int(_677) + 1;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    int _689 = _685 & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = _602 + 24;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    uint _697 = uint(int(uint(int(_695)) >> uint(2)));
    int _699 = int(_695) & 3;
    float _701 = (*spvDescriptorSet0.fp_c3)._m0[int(_697)][_699];
    int _703 = int(_695) + 1;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    int _707 = _703 & 3;
    float _709 = (*spvDescriptorSet0.fp_c3)._m0[int(_705)][_707];
    int _711 = _602 + 8;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    float _729 = _578 * _621;
    float _731 = fma(_580, _613, _729);
    int _733 = _602 + 40;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[int(_745)][_747];
    float _751 = fma(_576, _631, _731);
    float _753 = _751 + _639;
    float _755 = _578 * _657;
    float _757 = 1.0 / _753;
    float _759 = fma(_580, _649, _755);
    float _761 = _578 * _673;
    float _763 = fma(_580, _665, _761);
    float _765 = _578 * _691;
    float _767 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float _769 = fma(_580, _683, _765);
    float _771 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _773 = fma(_576, _701, _759);
    float _775 = _773 + _709;
    float _777 = fma(_576, _719, _763);
    float _779 = _775 * _757;
    float _781 = rint(_596);
    float _783 = precise::max(_781, 0.0);
    uint _785 = uint(_783);
    uint _787 = clamp(_785, 0u, 65535u);
    float _789 = _777 + _727;
    float _791 = fma(_576, _741, _769);
    float _793 = _789 * _757;
    float _795 = _791 + _749;
    float _797 = _795 * _757;
    float _799 = precise::clamp(_797, 0.0, 1.0);
    float2 _2465 = float2(_85, _87);
    float2 _803 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2465, float2(0.0), isnan(_2465))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2465, float2(0.0), isnan(_2465))).xy;
    float _805 = _803.x;
    float _807 = _803.y;
    float2 _2477 = float2(_771, _767);
    float4 _810 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2477, float2(0.0), isnan(_2477)), int2(0), component::x).xyzw;
    float _812 = _810.x;
    float _814 = _810.y;
    float _816 = _810.z;
    float _818 = _810.w;
    float2 _2493 = float2(_771, _767);
    float4 _820 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2493, float2(0.0), isnan(_2493)), int2(0), component::w).xyzw;
    float _822 = _820.x;
    float _824 = _820.y;
    float _826 = _820.z;
    float _828 = _820.w;
    float3 _2512 = float3(_793, _779, float(int(_787)));
    float3 _2516 = select(_2512, float3(0.0), isnan(_2512));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2516.xy, uint(rint(_2516.z)), _799);
    float _832 = _546 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _834 = _546 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _836 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[101].x, _832);
    float _838 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[102].x, _834);
    float _840 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[101].z, _836);
    float _842 = _840 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _844 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[102].z, _838);
    float _846 = trunc(_842);
    int _848 = int(_846);
    float _850 = _844 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _852 = trunc(_850);
    int _854 = int(_852);
    int _856 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _858 = _848 + _856;
    int _860 = _858 + 1;
    bool _862 = _860 >= 0;
    int _864 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _866 = _854 + _864;
    int _868 = _866 + 1;
    bool _870 = _860 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _872 = !_862;
    bool _874 = _870 || _872;
    bool _876 = _868 < 0;
    bool _878 = _876 || _874;
    bool _880 = _868 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _882 = _880 || _878;
    int _884 = _854;
    int _886 = as_type<int>(_793);
    int _888 = _868;
    if (!_882)
    {
        int _890 = _868 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _892 = _890 + _860;
        _884 = _892;
    }
    int _894 = _884;
    float _896 = _799;
    if (!_882)
    {
        float _898 = floor(_842);
        _896 = _898;
    }
    float _900 = _896;
    if (!_882)
    {
        int _902 = _894 << 2;
        _886 = _902;
    }
    int _904 = _886;
    int _906 = _904;
    if (!_882)
    {
        int _908 = _894 >> 2;
        _888 = _908;
    }
    int _910 = _888;
    int _912 = _910;
    if (!_882)
    {
        int _914 = 12 & _904;
        _906 = _914;
    }
    int _916 = _906;
    float _918 = as_type<float>(_860);
    if (!_882)
    {
        float _920 = floor(_850);
        _918 = _920;
    }
    float _922 = _918;
    if (!_882)
    {
        int _924 = _910 << 4;
        int _926 = _924 + _916;
        _912 = _926;
    }
    int _928 = _912;
    float _930 = _779;
    if (!_882)
    {
        uint _932 = uint(int(uint(_928) >> uint(2)));
        uint _934 = uint(int(uint(int(_932)) >> uint(2)));
        int _936 = int(_932) & 3;
        float _938 = (*spvDescriptorSet0.fp_c5)._m0[int(_934)][_936];
        _930 = _938;
    }
    float _940 = _930;
    float _942 = _900;
    if (!_882)
    {
        float _944 = -_900;
        float _946 = _842 + _944;
        _942 = _946;
    }
    float _948 = _942;
    float _950 = _940;
    if (!_882)
    {
        float _952 = rint(_940);
        float _954 = precise::max(_952, 0.0);
        uint _956 = uint(_954);
        uint _958 = clamp(_956, 0u, 65535u);
        _950 = as_type<float>(_958);
    }
    float _960 = _950;
    float _962 = fma(_805, 2.0, -1.0);
    float _964 = fma(_807, 2.0, -1.0);
    float _966 = _962 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _968 = _964 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _970 = fma(_966, 2.0, _85);
    float _972 = fma(_968, 2.0, _87);
    float _974 = _966;
    if (!_882)
    {
        float _976 = -_922;
        float _978 = _850 + _976;
        _974 = _978;
    }
    float _980 = _974;
    float2 _2770 = float2(_970, _972);
    float3 _984 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2770, float2(0.0), isnan(_2770))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2770, float2(0.0), isnan(_2770))).xyz;
    float _986 = _984.x;
    float _988 = _984.y;
    float _990 = _984.z;
    float _992 = _980;
    if (!_882)
    {
        float3 _2791 = float3(_948, _980, float(as_type<int>(_960)));
        float3 _2793 = select(_2791, float3(0.0), isnan(_2791));
        float _994 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2793.xy, uint(rint(_2793.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2793.xy, uint(rint(_2793.z)), level(0.0)).x;
        _992 = _994;
    }
    float _996 = _992;
    float _998 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _1000 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _1002 = precise::min(_165, -1.0000000116860974230803549289703e-07);
    float _1004 = -_812;
    float _1006 = fma(_1004, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1008 = floor(_998);
    float _1010 = -_814;
    float _1012 = fma(_1010, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1014 = -_816;
    float _1016 = fma(_1014, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1018 = -_818;
    float _1020 = fma(_1018, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1022 = floor(_1000);
    float _1024 = -_1008;
    float _1026 = _998 + _1024;
    float _1028 = 1.0 / _1002;
    float _1030 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1032 = _1026 + _1030;
    float _1034 = -_1022;
    float _1036 = _1000 + _1034;
    float _1038 = -_1032;
    float _1040 = _1038 + 1.0;
    float _1042 = 1.0 / _1006;
    float _1044 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1046 = _1036 + _1044;
    float _1048 = -_1046;
    float _1050 = _1048 + 1.0;
    float _1052 = _1032 * _1046;
    float _1054 = _1046 * _1040;
    float _1056 = 1.0 / _1016;
    float _1058 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1060 = -_165;
    float _1062 = fma(_1042, _1058, _1060);
    float _1064 = 1.0 / _1012;
    float _1066 = _1032 * _1050;
    float _1068 = _1040 * _1050;
    float _1070 = _1028 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _1072 = abs(_1062);
    float _1074 = _1072 * _1070;
    float _1076 = 1.0 / _1020;
    float _1078 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1080 = -_165;
    float _1082 = fma(_1064, _1078, _1080);
    float _1084 = exp2(_1074);
    float _1086 = abs(_1082);
    float _1088 = _1086 * _1070;
    float _1090 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1092 = -_165;
    float _1094 = fma(_1056, _1090, _1092);
    float _1096 = abs(_1094);
    float _1098 = _1096 * _1070;
    float _1100 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1102 = -_165;
    float _1104 = fma(_1076, _1100, _1102);
    float _1106 = exp2(_1088);
    float _1108 = abs(_1104);
    float _1110 = _1108 * _1070;
    float _1112 = abs(_1054);
    float _1114 = _1112 * _1084;
    float _1116 = exp2(_1098);
    float _1118 = exp2(_1110);
    float _1120 = abs(_1052);
    float _1122 = _1120 * _1106;
    float _1124 = _1114 + _1122;
    float _1126 = abs(_1066);
    float _1128 = _1126 * _1116;
    float _1130 = _1128 + _1124;
    float _1132 = abs(_1068);
    float _1134 = _1132 * _1118;
    float _1136 = _1134 + _1130;
    float _1138 = -_1134;
    bool _1140 = _1130 != _1138;
    bool _1142 = isnan(_1130);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan(_1138);
    bool _1148 = _1144 || _1146;
    float _1150 = 1.0 / _1136;
    float _1152 = _1122 * _1150;
    float _1154 = _1114 * _1150;
    float _1156 = _1128 * _1150;
    float _1158 = _1134 * _1150;
    float _1160 = _1148 ? _1152 : 0.25;
    float _1162 = _1148 ? _1154 : 0.25;
    float _1164 = -_165;
    float _1166 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1168 = _1164 + _1166;
    float _1170 = _1160 * _824;
    float _1172 = _1148 ? _1156 : 0.25;
    float _1174 = fma(_1162, _822, _1170);
    float _1176 = _1162;
    if (_882)
    {
        _1176 = 1.0;
    }
    float _1178 = _1176;
    float _1180 = fma(_1172, _826, _1174);
    float _1182 = _1178;
    if (!_882)
    {
        int _1184 = _894 << 4;
        int _1186 = _1184 + 1648;
        int _1188 = _928 + 8048;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
        int _1194 = int(_1190) & 3;
        float _1196 = (*spvDescriptorSet0.fp_c5)._m0[int(_1192)][_1194];
        uint _1198 = uint(int(uint(_1186) >> uint(2)));
        uint _1200 = uint(int(uint(int(_1198)) >> uint(2)));
        int _1202 = int(_1198) & 3;
        float _1204 = (*spvDescriptorSet0.fp_c5)._m0[int(_1200)][_1202];
        int _1206 = int(_1198) + 1;
        uint _1208 = uint(int(uint(_1206) >> uint(2)));
        int _1210 = _1206 & 3;
        float _1212 = (*spvDescriptorSet0.fp_c5)._m0[int(_1208)][_1210];
        int _1214 = _1186 + 8;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        uint _1218 = uint(int(uint(int(_1216)) >> uint(2)));
        int _1220 = int(_1216) & 3;
        float _1222 = (*spvDescriptorSet0.fp_c5)._m0[int(_1218)][_1220];
        int _1224 = int(_1216) + 1;
        uint _1226 = uint(int(uint(_1224) >> uint(2)));
        int _1228 = _1224 & 3;
        float _1230 = (*spvDescriptorSet0.fp_c5)._m0[int(_1226)][_1228];
        float _1232 = _1196 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1234 = _546 * _1212;
        float _1236 = 1.0 / _1196;
        float _1238 = fma(_548, _1204, _1234);
        float _1240 = fma(_550, _1222, _1238);
        float _1242 = _1240 + _1230;
        float _1244 = precise::clamp(_1242, 0.0, 1.0);
        float _1246 = -_1244;
        float _1248 = _1246 + _996;
        float _1250 = fma(_1236, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1248);
        float _1252 = _1232 * _1250;
        float _1254 = exp2(_1252);
        float _1256 = 0.0 + _1254;
        float _1258 = precise::clamp(_1256, 0.0, 1.0);
        _1182 = _1258;
    }
    float _1260 = _1182;
    float _1262 = -_165;
    float _1264 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1266 = _1262 + _1264;
    float _1268 = _1148 ? _1158 : 0.25;
    float _1270 = precise::min(_1260, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1272 = _1168 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = _1266 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1278 = precise::clamp(_1276, 0.0, 1.0);
    float _1280 = -_830;
    float _1282 = _1280 + 1.0;
    float _1284 = fma(_1268, _828, _1180);
    float _1286 = -_1270;
    float _1288 = _1286 + 1.0;
    float _1290 = precise::min(_986, 1.0);
    float _1292 = fma(_1274, _1282, _830);
    float _1294 = fma(_1278, _1288, _1270);
    float _1296 = precise::min(_1284, 1.0);
    out.m_60.x = _1292;
    out.m_60.y = _1294;
    out.m_60.z = _1296;
    out.m_60.w = 1.0;
    out.m_62.x = _1290;
    out.m_62.y = _988;
    out.m_62.z = _990;
    out.m_62.w = 1.0;
    return out;
}

