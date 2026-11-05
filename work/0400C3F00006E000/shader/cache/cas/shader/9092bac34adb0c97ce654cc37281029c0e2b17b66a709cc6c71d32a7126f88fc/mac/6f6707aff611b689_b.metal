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
    float2 _1300 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1300, float2(0.0), isnan(_1300))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1300, float2(0.0), isnan(_1300))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1315 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1315, float2(0.0), isnan(_1315))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1315, float2(0.0), isnan(_1315))).x;
    float2 _1323 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1323, float2(0.0), isnan(_1323))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1323, float2(0.0), isnan(_1323))).x;
    float _99 = in.m_53.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_53.y;
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
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _151 = -_95;
    float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _155 = 1.0 / _149;
    float _157 = -_97;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _161 = 1.0 / _159;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _165 = _155 * _163;
    float _167 = 1.0 / _153;
    float _169 = _165 * _137;
    float _171 = _165 * _135;
    float _173 = _169 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _175 = _169 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _179 = _161 * _177;
    float _181 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[32].x, _173);
    float _183 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[30].x, _175);
    float _185 = -_171;
    float _187 = fma(_179, _141, _185);
    float _189 = -_169;
    float _191 = fma(_179, _145, _189);
    float _193 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[32].z, _181);
    float _195 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[30].z, _183);
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _199 = _167 * _197;
    float _201 = -_165;
    float _203 = _201 + _179;
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _209 = -_165;
    float _211 = _209 + _199;
    float _213 = -_171;
    float _215 = fma(_199, _139, _213);
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _219 = _205 + _217;
    float _221 = -_169;
    float _223 = fma(_199, _143, _221);
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _227 = _207 + _225;
    float _229 = _211 * _187;
    float _231 = _219 * _219;
    float _233 = _223 * _203;
    float _235 = -_229;
    float _237 = fma(_215, _203, _235);
    float _239 = fma(_227, _227, _231);
    float _241 = _215 * _191;
    float _243 = -_233;
    float _245 = fma(_211, _191, _243);
    float _247 = _237 * _237;
    float _249 = sqrt(_239);
    float _251 = -_241;
    float _253 = fma(_223, _187, _251);
    float _255 = fma(_245, _245, _247);
    float _257 = _169 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _259 = fma(_253, _253, _255);
    float _261 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[31].x, _257);
    float _263 = rsqrt(_259);
    float _265 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[31].z, _261);
    bool _269 = _249 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _271 = _265 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _273 = _245 * _263;
    float _275 = _237 * _263;
    float _277 = _253 * _263;
    float _279 = _253;
    float _281 = _245;
    float _283 = _205;
    if (!_269)
    {
        _279 = _207;
    }
    float _285 = _279;
    float _287 = _285;
    if (!_269)
    {
        _281 = _271;
    }
    float _289 = _281;
    bool _291 = !_269;
    float _293 = _289;
    if (!_291)
    {
        float _295 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _297 = _249 + _295;
        float _299 = _271 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _301 = rsqrt(_239);
        float _303 = -_271;
        float _305 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _307 = _303 + _305;
        float _309 = abs(_299);
        float _311 = abs(_297);
        float _313 = precise::max(_309, _311);
        float _315 = _307 * _307;
        bool _317 = _313 >= 16.0;
        float _319 = _227 * _301;
        float _321 = _219 * _301;
        float _323 = -_227;
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
    float2 _2011 = float2(_85, _87);
    float2 _554 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2011, float2(0.0), isnan(_2011))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2011, float2(0.0), isnan(_2011))).xy;
    float _556 = _554.x;
    float _558 = _554.y;
    float _560 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _562 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].x, _560);
    float _564 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].z, _562);
    float _566 = -_564;
    float _568 = fma(_566, _564, 1.0);
    float _570 = -_564;
    float _572 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[35].z, _277);
    float _574 = -_564;
    float _576 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _578 = -_564;
    float _580 = fma(_578, (*spvDescriptorSet0.fp_c3)._m0[35].x, _273);
    float _582 = _568 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _584 = fma(_572, _582, _165);
    float _586 = fma(_576, _582, _169);
    float _588 = fma(_580, _582, _171);
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
    int _612 = _610 + 48;
    uint _615 = uint(int(uint(_612) >> uint(2)));
    uint _617 = uint(int(uint(int(_615)) >> uint(2)));
    int _619 = int(_615) & 3;
    float _621 = (*spvDescriptorSet0.fp_c3)._m0[int(_617)][_619];
    int _623 = int(_615) + 1;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    int _627 = _623 & 3;
    float _629 = (*spvDescriptorSet0.fp_c3)._m0[int(_625)][_627];
    int _631 = _610 + 56;
    uint _633 = uint(int(uint(_631) >> uint(2)));
    uint _635 = uint(int(uint(int(_633)) >> uint(2)));
    int _637 = int(_633) & 3;
    float _639 = (*spvDescriptorSet0.fp_c3)._m0[int(_635)][_637];
    int _641 = int(_633) + 1;
    uint _643 = uint(int(uint(_641) >> uint(2)));
    int _645 = _641 & 3;
    float _647 = (*spvDescriptorSet0.fp_c3)._m0[int(_643)][_645];
    uint _649 = uint(int(uint(_610) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.fp_c3)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.fp_c3)._m0[int(_659)][_661];
    int _665 = _610 + 16;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = int(_667) + 1;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    int _679 = _675 & 3;
    float _681 = (*spvDescriptorSet0.fp_c3)._m0[int(_677)][_679];
    int _683 = _610 + 32;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = int(_685) + 1;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    int _697 = _693 & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    int _701 = _610 + 8;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    uint _705 = uint(int(uint(int(_703)) >> uint(2)));
    int _707 = int(_703) & 3;
    float _709 = (*spvDescriptorSet0.fp_c3)._m0[int(_705)][_707];
    int _711 = int(_703) + 1;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    int _715 = _711 & 3;
    float _717 = (*spvDescriptorSet0.fp_c3)._m0[int(_713)][_715];
    int _719 = _610 + 24;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    int _729 = int(_721) + 1;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    int _733 = _729 & 3;
    float _735 = (*spvDescriptorSet0.fp_c3)._m0[int(_731)][_733];
    float _737 = _586 * _629;
    float _739 = fma(_588, _621, _737);
    int _741 = _610 + 40;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    uint _745 = uint(int(uint(int(_743)) >> uint(2)));
    int _747 = int(_743) & 3;
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[int(_745)][_747];
    int _751 = int(_743) + 1;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    int _755 = _751 & 3;
    float _757 = (*spvDescriptorSet0.fp_c3)._m0[int(_753)][_755];
    float _759 = fma(_584, _639, _739);
    float _761 = _759 + _647;
    float _763 = _586 * _663;
    float _765 = rint(_604);
    float _767 = precise::max(_765, 0.0);
    uint _769 = uint(_767);
    uint _771 = clamp(_769, 0u, 65535u);
    float _773 = fma(_588, _655, _763);
    float _775 = _586 * _681;
    float _777 = 1.0 / _761;
    float _779 = fma(_588, _673, _775);
    float _781 = _586 * _699;
    float _783 = fma(_588, _691, _781);
    float _785 = fma(_584, _709, _773);
    float _787 = _785 + _717;
    float _789 = fma(_584, _727, _779);
    float _791 = _789 + _735;
    float _793 = fma(_584, _749, _783);
    float _795 = _787 * _777;
    float _797 = _791 * _777;
    float _799 = _793 + _757;
    float _801 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _803 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float _805 = _799 * _777;
    float _807 = precise::clamp(_805, 0.0, 1.0);
    float2 _2443 = float2(_801, _803);
    float4 _810 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2443, float2(0.0), isnan(_2443)), int2(0), component::x).xyzw;
    float _812 = _810.x;
    float _814 = _810.y;
    float _816 = _810.z;
    float _818 = _810.w;
    float3 _2463 = float3(_795, _797, float(int(_771)));
    float3 _2467 = select(_2463, float3(0.0), isnan(_2463));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2467.xy, uint(rint(_2467.z)), _807);
    float2 _2473 = float2(_801, _803);
    float4 _822 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2473, float2(0.0), isnan(_2473)), int2(0), component::x).xyzw;
    float _824 = _822.x;
    float _826 = _822.y;
    float _828 = _822.z;
    float _830 = _822.w;
    float2 _2489 = float2(_801, _803);
    float4 _832 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2489, float2(0.0), isnan(_2489)), int2(0), component::w).xyzw;
    float _834 = _832.x;
    float _836 = _832.y;
    float _838 = _832.z;
    float _840 = _832.w;
    float _842 = fma(_556, 2.0, -1.0);
    float _844 = fma(_558, 2.0, -1.0);
    float _846 = _842 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _848 = _844 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _850 = fma(_846, 2.0, _85);
    float _852 = fma(_848, 2.0, _87);
    float2 _2525 = float2(_850, _852);
    float2 _854 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2525, float2(0.0), isnan(_2525))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2525, float2(0.0), isnan(_2525))).yz;
    float _856 = _854.x;
    float _858 = _854.y;
    float _860 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _862 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _864 = _546 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _866 = floor(_860);
    float _868 = precise::min(_165, -1.0000000116860974230803549289703e-07);
    float _870 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[101].x, _864);
    float _872 = _546 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _874 = fma(_548, (*spvDescriptorSet0.fp_c5)._m0[102].x, _872);
    float _876 = floor(_862);
    float _878 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[102].z, _874);
    float _880 = -_866;
    float _882 = _860 + _880;
    float _884 = 1.0 / _868;
    float _886 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _888 = _882 + _886;
    float _890 = -_876;
    float _892 = _862 + _890;
    float _894 = -_888;
    float _896 = _894 + 1.0;
    float _898 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _900 = _892 + _898;
    float _902 = -_900;
    float _904 = _902 + 1.0;
    float _906 = _888 * _900;
    float _908 = _900 * _896;
    float _910 = _888 * _904;
    float _912 = _896 * _904;
    float _914 = _884 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _916 = -_812;
    float _918 = fma(_916, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _920 = -_814;
    float _922 = fma(_920, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _924 = -_816;
    float _926 = fma(_924, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _928 = -_818;
    float _930 = fma(_928, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _932 = 1.0 / _918;
    float _934 = 1.0 / _922;
    float _936 = 1.0 / _926;
    float _938 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _940 = -_165;
    float _942 = fma(_932, _938, _940);
    float _944 = abs(_942);
    float _946 = _944 * _914;
    float _948 = 1.0 / _930;
    float _950 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _952 = -_165;
    float _954 = fma(_934, _950, _952);
    float _956 = abs(_954);
    float _958 = _956 * _914;
    float _960 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _962 = -_165;
    float _964 = fma(_936, _960, _962);
    float _966 = exp2(_946);
    float _968 = abs(_964);
    float _970 = _968 * _914;
    float _972 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _974 = -_165;
    float _976 = fma(_948, _972, _974);
    float _978 = exp2(_958);
    float _980 = abs(_976);
    float _982 = _980 * _914;
    float _984 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[101].z, _870);
    float _986 = exp2(_970);
    float _988 = _984 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _990 = abs(_908);
    float _992 = _990 * _966;
    float _994 = exp2(_982);
    float _996 = abs(_906);
    float _998 = _996 * _978;
    float _1000 = _878 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1002 = _992 + _998;
    float _1004 = trunc(_988);
    int _1006 = int(_1004);
    float _1008 = abs(_910);
    float _1010 = _1008 * _986;
    float _1012 = _1010 + _1002;
    float _1014 = trunc(_1000);
    int _1016 = int(_1014);
    float _1018 = abs(_912);
    float _1020 = _1018 * _994;
    float _1022 = _1020 + _1012;
    float _1024 = -_1020;
    bool _1026 = _1012 != _1024;
    bool _1028 = isnan(_1012);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan(_1024);
    bool _1034 = _1030 || _1032;
    int _1036 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1038 = _1006 + _1036;
    int _1040 = _1038 + 1;
    float _1042 = 1.0 / _1022;
    bool _1044 = _1040 >= 0;
    int _1046 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1048 = _1016 + _1046;
    int _1050 = _1048 + 1;
    bool _1052 = _1040 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1054 = !_1044;
    bool _1056 = _1052 || _1054;
    bool _1058 = _1050 < 0;
    bool _1060 = _1058 || _1056;
    bool _1062 = _1050 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1064 = _1062 || _1060;
    float _1066 = _998 * _1042;
    float _1068 = _992 * _1042;
    float _1070 = _1010 * _1042;
    float _1072 = _1034 ? _1066 : 0.25;
    float _1074 = _1034 ? _1068 : 0.25;
    float _1076 = _1072 * _826;
    float _1078 = _826;
    if (_1064)
    {
        _1078 = 1.0;
    }
    float _1080 = _1078;
    float _1082 = _1080;
    if (!_1064)
    {
        int _1084 = _1050 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1086 = _1084 + _1040;
        float _1088 = floor(_988);
        int _1090 = _1086 << 2;
        int _1092 = _1086 >> 2;
        int _1094 = 12 & _1090;
        int _1096 = _1092 << 4;
        int _1098 = _1096 + _1094;
        float _1100 = floor(_1000);
        uint _1102 = uint(int(uint(_1098) >> uint(2)));
        uint _1104 = uint(int(uint(int(_1102)) >> uint(2)));
        int _1106 = int(_1102) & 3;
        float _1108 = (*spvDescriptorSet0.fp_c5)._m0[int(_1104)][_1106];
        float _1110 = -_1100;
        float _1112 = _1000 + _1110;
        float _1114 = -_1088;
        float _1116 = _988 + _1114;
        float _1118 = rint(_1108);
        float _1120 = precise::max(_1118, 0.0);
        uint _1122 = uint(_1120);
        uint _1124 = clamp(_1122, 0u, 65535u);
        float3 _2921 = float3(_1116, _1112, float(int(_1124)));
        float3 _2923 = select(_2921, float3(0.0), isnan(_2921));
        float _1126 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2923.xy, uint(rint(_2923.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2923.xy, uint(rint(_2923.z)), level(0.0)).x;
        int _1128 = _1086 << 4;
        int _1130 = _1128 + 1648;
        int _1132 = _1098 + 8048;
        uint _1134 = uint(int(uint(_1132) >> uint(2)));
        uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
        int _1138 = int(_1134) & 3;
        float _1140 = (*spvDescriptorSet0.fp_c5)._m0[int(_1136)][_1138];
        uint _1142 = uint(int(uint(_1130) >> uint(2)));
        uint _1144 = uint(int(uint(int(_1142)) >> uint(2)));
        int _1146 = int(_1142) & 3;
        float _1148 = (*spvDescriptorSet0.fp_c5)._m0[int(_1144)][_1146];
        int _1150 = int(_1142) + 1;
        uint _1152 = uint(int(uint(_1150) >> uint(2)));
        int _1154 = _1150 & 3;
        float _1156 = (*spvDescriptorSet0.fp_c5)._m0[int(_1152)][_1154];
        int _1158 = _1130 + 8;
        uint _1160 = uint(int(uint(_1158) >> uint(2)));
        uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
        int _1164 = int(_1160) & 3;
        float _1166 = (*spvDescriptorSet0.fp_c5)._m0[int(_1162)][_1164];
        int _1168 = int(_1160) + 1;
        uint _1170 = uint(int(uint(_1168) >> uint(2)));
        int _1172 = _1168 & 3;
        float _1174 = (*spvDescriptorSet0.fp_c5)._m0[int(_1170)][_1172];
        float _1176 = 1.0 / _1140;
        float _1178 = _546 * _1156;
        float _1180 = fma(_548, _1148, _1178);
        float _1182 = _1140 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1184 = fma(_550, _1166, _1180);
        float _1186 = _1184 + _1174;
        float _1188 = precise::clamp(_1186, 0.0, 1.0);
        float _1190 = -_1188;
        float _1192 = _1190 + _1126;
        float _1194 = fma(_1176, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1192);
        float _1196 = _1182 * _1194;
        float _1198 = exp2(_1196);
        float _1200 = 0.0 + _1198;
        float _1202 = precise::clamp(_1200, 0.0, 1.0);
        _1082 = _1202;
    }
    float _1204 = _1082;
    float _1206 = _1072 * _836;
    float _1208 = _1034 ? _1070 : 0.25;
    float _1210 = _1020 * _1042;
    float _1212 = fma(_1074, _824, _1076);
    float _1214 = precise::min(_1204, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1216 = -_165;
    float _1218 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1220 = _1216 + _1218;
    float _1222 = fma(_1074, _834, _1206);
    float _1224 = fma(_1208, _828, _1212);
    float _1226 = -_165;
    float _1228 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1230 = _1226 + _1228;
    float _1232 = _1220 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1234 = precise::clamp(_1232, 0.0, 1.0);
    float _1236 = -_1214;
    float _1238 = _1236 + 1.0;
    float _1240 = _1034 ? _1210 : 0.25;
    float _1242 = fma(_1208, _838, _1222);
    float _1244 = _1230 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1246 = precise::clamp(_1244, 0.0, 1.0);
    float _1248 = fma(_1234, _1238, _1214);
    float _1250 = -_820;
    float _1252 = _1250 + 1.0;
    float _1254 = fma(_1240, _830, _1224);
    float _1256 = fma(_1240, _840, _1242);
    float _1258 = fma(_1246, _1252, _820);
    float _1260 = precise::min(_1254, 1.0);
    float _1262 = precise::min(_1256, 1.0);
    out.m_60.x = _1258;
    out.m_60.y = _1248;
    out.m_60.z = _1262;
    out.m_60.w = 1.0;
    out.m_62.x = _1260;
    out.m_62.y = _856;
    out.m_62.z = _858;
    out.m_62.w = 1.0;
    return out;
}

