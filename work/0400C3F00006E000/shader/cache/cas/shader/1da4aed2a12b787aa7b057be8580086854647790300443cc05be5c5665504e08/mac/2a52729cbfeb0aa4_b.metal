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
    float4 m_57 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
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
    float2 _1322 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1322, float2(0.0), isnan(_1322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1322, float2(0.0), isnan(_1322))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1337 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1337, float2(0.0), isnan(_1337))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1337, float2(0.0), isnan(_1337))).x;
    float2 _1345 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1345, float2(0.0), isnan(_1345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1345, float2(0.0), isnan(_1345))).x;
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
    float _123 = in.m_57.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_55.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _83 * _103;
    float _137 = _83 * _109;
    float _139 = _83 * _115;
    float _141 = _83 * _121;
    float _143 = -_91;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _147 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].x, _145);
    float _149 = _147 * _135;
    float _151 = _147 * _137;
    float _153 = -_95;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].x, _155);
    float _159 = _83 * _127;
    float _161 = _149 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _163 = _149 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _165 = _83 * _133;
    float _167 = -_147;
    float _169 = _167 + _157;
    float _171 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].x, _161);
    float _173 = -_97;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[41].x, _175);
    float _179 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].x, _163);
    float _181 = -_151;
    float _183 = fma(_157, _141, _181);
    float _185 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[32].z, _171);
    float _187 = -_151;
    float _189 = fma(_177, _139, _187);
    float _191 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[30].z, _179);
    float _193 = -_149;
    float _195 = fma(_177, _165, _193);
    float _197 = _185 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _199 = -_149;
    float _201 = fma(_157, _159, _199);
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _205 = -_147;
    float _207 = _205 + _177;
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _211 = _197 + _209;
    float _213 = _169 * _189;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _217 = _203 + _215;
    float _219 = _201 * _207;
    float _221 = _211 * _211;
    float _223 = -_213;
    float _225 = fma(_183, _207, _223);
    float _227 = _183 * _195;
    float _229 = -_219;
    float _231 = fma(_169, _195, _229);
    float _233 = fma(_217, _217, _221);
    float _235 = _225 * _225;
    float _237 = -_227;
    float _239 = fma(_201, _189, _237);
    float _241 = sqrt(_233);
    float _243 = fma(_231, _231, _235);
    float _245 = _149 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _247 = fma(_239, _239, _243);
    float _249 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].x, _245);
    float _251 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[31].z, _249);
    float _253 = rsqrt(_247);
    float _255 = _251 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _259 = _241 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _231 * _253;
    float _263 = _225 * _253;
    float _265 = _239 * _253;
    float _267 = _239;
    float _269 = _253;
    float _271 = _197;
    float _273 = _149;
    if (!_259)
    {
        _267 = _203;
    }
    float _275 = _267;
    float _277 = _275;
    if (!_259)
    {
        _269 = _255;
    }
    float _279 = _269;
    bool _281 = !_259;
    float _283 = _279;
    if (!_281)
    {
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _287 = _241 + _285;
        float _289 = _255 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = rsqrt(_233);
        float _293 = -_255;
        float _295 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = _293 + _295;
        float _299 = abs(_289);
        float _301 = abs(_287);
        float _303 = precise::max(_299, _301);
        float _305 = _297 * _297;
        bool _307 = _303 >= 16.0;
        float _309 = _217 * _291;
        float _311 = _211 * _291;
        float _313 = -_217;
        float _315 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = -_211;
        float _319 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[41].z, _317);
        float _321 = _287;
        float _323 = _289;
        int _326 = as_type<int>(_319);
        if (_307)
        {
            float _328 = _287 * 0.0625;
            _321 = _328;
        }
        float _330 = _321;
        if (_307)
        {
            float _332 = _289 * 0.0625;
            _323 = _332;
        }
        float _334 = _323;
        float _336 = fma(_315, _315, _305);
        float _338 = abs(_330);
        bool _340 = _338 != 0.0;
        bool _342 = isnan(_338);
        bool _344 = _340 || _342;
        bool _346 = isnan(0.0);
        bool _348 = _344 || _346;
        float _350 = fma(_319, _319, _336);
        float _352 = abs(_334);
        bool _354 = _352 == 0.0;
        float _356 = abs(_334);
        bool _358 = _356 == 0.0;
        bool _360 = !_348;
        bool _362 = _358 && _360;
        float _364 = sqrt(_350);
        bool _366 = false;
        if (_362)
        {
            bool _368 = as_type<int>(_334) >= 0;
            _366 = _368;
        }
        bool _370 = _366;
        int _372 = _370 ? (-1) : 0;
        if (_362)
        {
            int _374 = _370 ? 0 : 1078530011;
            _326 = _374;
        }
        int _376 = _326;
        int _378 = _376;
        if (_362)
        {
            int _380 = int(0x80000000) & as_type<int>(_330);
            int _382 = _376 | _380;
            _378 = _382;
        }
        int _384 = _378;
        bool _386 = !_348;
        bool _388 = _386 && _354;
        int _390 = _384;
        float _392 = as_type<float>(_384);
        if (!_388)
        {
            float _394 = abs(_330);
            bool _396 = _394 != as_type<float>(0x7f800000u /* inf */);
            bool _398 = isnan(_394);
            bool _400 = _396 || _398;
            bool _402 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _404 = _400 || _402;
            float _406 = abs(_334);
            bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
            float _410 = abs(_334);
            bool _412 = _410 == as_type<float>(0x7f800000u /* inf */);
            bool _414 = !_404;
            bool _416 = _412 && _414;
            if (_416)
            {
                bool _418 = as_type<int>(_334) >= 0;
                _372 = _418 ? (-1) : 0;
            }
            int _420 = _372;
            if (_416)
            {
                _390 = 1075235812;
            }
            int _422 = _390;
            int _424 = _422;
            if (_416)
            {
                int _426 = ~_420;
                int _428 = (_426 != 0) ? _422 : 1061752795;
                _424 = _428;
            }
            int _430 = _424;
            float _432 = as_type<float>(_430);
            if (_416)
            {
                int _434 = int(0x80000000) & as_type<int>(_330);
                int _436 = _430 | _434;
                _432 = as_type<float>(_436);
            }
            float _438 = _432;
            bool _440 = !_404;
            bool _442 = _440 && _408;
            _392 = _438;
            if (!_442)
            {
                float _444 = abs(_330);
                float _446 = abs(_334);
                float _448 = precise::max(_444, _446);
                float _450 = abs(_330);
                float _452 = abs(_334);
                float _454 = precise::min(_450, _452);
                float _456 = 1.0 / _448;
                float _458 = abs(_330);
                float _460 = abs(_334);
                bool _462 = _458 > _460;
                bool _464 = as_type<int>(_334) >= 0;
                float _466 = _454 * _456;
                float _468 = abs(_330);
                float _470 = abs(_334);
                float _472 = _468 + _470;
                int _474 = as_type<int>(_330) & int(0x80000000);
                float _476 = _466 * _466;
                bool _478 = _472 > as_type<float>(0x7f800000u /* inf */);
                bool _480 = isnan(_472);
                bool _482 = _478 || _480;
                bool _484 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _486 = _482 || _484;
                float _488 = _476 + 11.33538818359375;
                float _490 = fma(_476, _488, 28.84246826171875);
                float _492 = fma(_476, _490, 19.6966705322265625);
                float _494 = fma(_476, -0.82336294651031494140625, -5.674867153167724609375);
                float _496 = fma(_476, _494, -6.565555095672607421875);
                float _498 = 1.0 / _492;
                float _500 = _476 * _496;
                float _502 = _466 * _500;
                float _504 = fma(_502, _498, _466);
                float _506 = _504;
                _392 = _472;
                if (_462)
                {
                    float _508 = -_504;
                    float _510 = _508 + 1.57079637050628662109375;
                    _506 = _510;
                }
                float _512 = _506;
                int _514 = as_type<int>(_512);
                if (!_464)
                {
                    float _516 = -_512;
                    float _518 = _516 + 3.1415927410125732421875;
                    _514 = as_type<int>(_518);
                }
                int _520 = _514;
                if (!_486)
                {
                    int _522 = _474 | _520;
                    _392 = as_type<float>(_522);
                }
            }
        }
        float _524 = _392;
        float _526 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _528 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _530 = _364 + _528;
        float _532 = fma(_309, _526, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _534 = fma(_311, _526, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _283 = _530;
        _277 = _532;
        _271 = _534;
    }
    float _536 = _283;
    float _538 = _277;
    float _540 = _271;
    float _542 = _263 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _544 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].x, _542);
    float _546 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].z, _544);
    float _548 = -_546;
    float _550 = fma(_548, _546, 1.0);
    float _552 = -_546;
    float _554 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[35].z, _265);
    float _556 = -_546;
    float _558 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[35].y, _263);
    float _560 = -_546;
    float _562 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[35].x, _261);
    float _564 = _550 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _566 = fma(_554, _564, _147);
    float _568 = fma(_558, _564, _149);
    float _570 = fma(_562, _564, _151);
    float _572 = -_566;
    bool _574 = _572 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _576 = float(_574);
    float _578 = -_566;
    bool _580 = _578 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _582 = float(_580);
    float _584 = _576 + _582;
    float _586 = precise::min(_584, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _588 = trunc(_586);
    int _590 = int(_588);
    float _592 = rint(_586);
    float _594 = precise::max(_592, 0.0);
    uint _597 = uint(_594);
    uint _599 = clamp(_597, 0u, 65535u);
    int _601 = _590 << 6;
    int _603 = _601 + 48;
    uint _605 = uint(int(uint(_603) >> uint(2)));
    uint _607 = uint(int(uint(int(_605)) >> uint(2)));
    int _609 = int(_605) & 3;
    float _611 = (*spvDescriptorSet0.fp_c3)._m0[int(_607)][_609];
    int _613 = int(_605) + 1;
    uint _615 = uint(int(uint(_613) >> uint(2)));
    int _617 = _613 & 3;
    float _619 = (*spvDescriptorSet0.fp_c3)._m0[int(_615)][_617];
    int _621 = _601 + 56;
    uint _623 = uint(int(uint(_621) >> uint(2)));
    uint _625 = uint(int(uint(int(_623)) >> uint(2)));
    int _627 = int(_623) & 3;
    float _629 = (*spvDescriptorSet0.fp_c3)._m0[int(_625)][_627];
    int _631 = int(_623) + 1;
    uint _633 = uint(int(uint(_631) >> uint(2)));
    int _635 = _631 & 3;
    float _637 = (*spvDescriptorSet0.fp_c3)._m0[int(_633)][_635];
    uint _639 = uint(int(uint(_601) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.fp_c3)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    int _655 = _601 + 16;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    uint _659 = uint(int(uint(int(_657)) >> uint(2)));
    int _661 = int(_657) & 3;
    float _663 = (*spvDescriptorSet0.fp_c3)._m0[int(_659)][_661];
    int _665 = int(_657) + 1;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    int _669 = _665 & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    int _673 = _601 + 32;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    uint _677 = uint(int(uint(int(_675)) >> uint(2)));
    int _679 = int(_675) & 3;
    float _681 = (*spvDescriptorSet0.fp_c3)._m0[int(_677)][_679];
    int _683 = int(_675) + 1;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    int _687 = _683 & 3;
    float _689 = (*spvDescriptorSet0.fp_c3)._m0[int(_685)][_687];
    int _691 = _601 + 8;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    int _701 = int(_693) + 1;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    int _705 = _701 & 3;
    float _707 = (*spvDescriptorSet0.fp_c3)._m0[int(_703)][_705];
    int _709 = _601 + 24;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    uint _713 = uint(int(uint(int(_711)) >> uint(2)));
    int _715 = int(_711) & 3;
    float _717 = (*spvDescriptorSet0.fp_c3)._m0[int(_713)][_715];
    int _719 = int(_711) + 1;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    int _723 = _719 & 3;
    float _725 = (*spvDescriptorSet0.fp_c3)._m0[int(_721)][_723];
    float _727 = _568 * _619;
    float _729 = fma(_570, _611, _727);
    int _731 = _601 + 40;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    uint _735 = uint(int(uint(int(_733)) >> uint(2)));
    int _737 = int(_733) & 3;
    float _739 = (*spvDescriptorSet0.fp_c3)._m0[int(_735)][_737];
    int _741 = int(_733) + 1;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    int _745 = _741 & 3;
    float _747 = (*spvDescriptorSet0.fp_c3)._m0[int(_743)][_745];
    float _749 = fma(_566, _629, _729);
    float _751 = _749 + _637;
    float _753 = _568 * _653;
    float _755 = 1.0 / _751;
    float _757 = fma(_570, _645, _753);
    float _759 = _568 * _671;
    float _761 = fma(_570, _663, _759);
    float _763 = _568 * _689;
    float _765 = fma(_570, _681, _763);
    float _767 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _769 = fma(_566, _699, _757);
    float _771 = _769 + _707;
    float _773 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float _775 = fma(_566, _717, _761);
    float _777 = _775 + _725;
    float _779 = fma(_566, _739, _765);
    float _781 = _771 * _755;
    float _783 = _777 * _755;
    float2 _2434 = float2(_85, _87);
    float2 _787 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2434, float2(0.0), isnan(_2434))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2434, float2(0.0), isnan(_2434))).xy;
    float _789 = _787.x;
    float _791 = _787.y;
    float2 _2446 = float2(_767, _773);
    float4 _794 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2446, float2(0.0), isnan(_2446)), int2(0), component::x).xyzw;
    float _796 = _794.x;
    float _798 = _794.y;
    float _800 = _794.z;
    float _802 = _794.w;
    float _804 = _779 + _747;
    float _806 = _804 * _755;
    float _808 = precise::clamp(_806, 0.0, 1.0);
    float2 _2470 = float2(_767, _773);
    float4 _810 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2470, float2(0.0), isnan(_2470)), int2(0), component::w).xyzw;
    float _812 = _810.x;
    float _814 = _810.y;
    float _816 = _810.z;
    float _818 = _810.w;
    float3 _2489 = float3(_781, _783, float(int(_599)));
    float3 _2493 = select(_2489, float3(0.0), isnan(_2489));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2493.xy, uint(rint(_2493.z)), _808);
    float _822 = _536 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _824 = _536 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _826 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].x, _822);
    float _828 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].x, _824);
    float _830 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].z, _826);
    float _832 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].z, _828);
    float _834 = _830 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _836 = _832 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _838 = trunc(_834);
    int _840 = int(_838);
    float _842 = trunc(_836);
    int _844 = int(_842);
    int _846 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _848 = _840 + _846;
    int _850 = _848 + 1;
    bool _852 = _850 >= 0;
    int _854 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _856 = _844 + _854;
    int _858 = _856 + 1;
    bool _860 = _850 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _862 = !_852;
    bool _864 = _860 || _862;
    bool _866 = _858 < 0;
    bool _868 = _866 || _864;
    bool _870 = _858 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _872 = _870 || _868;
    int _874 = _850;
    int _876 = _844;
    int _878 = _858;
    if (!_872)
    {
        int _880 = _858 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _882 = _880 + _850;
        _874 = _882;
    }
    int _884 = _874;
    if (!_872)
    {
        int _886 = _884 << 2;
        _876 = _886;
    }
    int _888 = _876;
    int _890 = _888;
    if (!_872)
    {
        int _892 = _884 >> 2;
        _878 = _892;
    }
    int _894 = _878;
    int _896 = _894;
    if (!_872)
    {
        int _898 = 12 & _888;
        _890 = _898;
    }
    int _900 = _890;
    float _902 = _808;
    if (!_872)
    {
        float _904 = floor(_834);
        _902 = _904;
    }
    float _906 = _902;
    if (!_872)
    {
        int _908 = _894 << 4;
        int _910 = _908 + _900;
        _896 = _910;
    }
    int _912 = _896;
    float _914 = _564;
    if (!_872)
    {
        uint _916 = uint(int(uint(_912) >> uint(2)));
        uint _918 = uint(int(uint(int(_916)) >> uint(2)));
        int _920 = int(_916) & 3;
        float _922 = (*spvDescriptorSet0.fp_c5)._m0[int(_918)][_920];
        _914 = _922;
    }
    float _924 = _914;
    float _926 = as_type<float>(_900);
    if (!_872)
    {
        float _928 = floor(_836);
        _926 = _928;
    }
    float _930 = _926;
    float _932 = _906;
    if (!_872)
    {
        float _934 = -_906;
        float _936 = _834 + _934;
        _932 = _936;
    }
    float _938 = _932;
    if (!_872)
    {
        float _940 = -_930;
        float _942 = _836 + _940;
        _273 = _942;
    }
    float _944 = _273;
    float _946 = fma(_789, 2.0, -1.0);
    float _948 = fma(_791, 2.0, -1.0);
    float _950 = 2.0;
    if (!_872)
    {
        float _952 = rint(_924);
        float _954 = precise::max(_952, 0.0);
        uint _956 = uint(_954);
        uint _958 = clamp(_956, 0u, 65535u);
        _950 = as_type<float>(_958);
    }
    float _960 = _950;
    float _962 = _946 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _964 = _948 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _966 = fma(_962, 2.0, _85);
    float _968 = fma(_964, 2.0, _87);
    float2 _2744 = float2(_966, _968);
    float3 _972 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2744, float2(0.0), isnan(_2744))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2744, float2(0.0), isnan(_2744))).xyz;
    float _974 = _972.x;
    float _976 = _972.y;
    float _978 = _972.z;
    float _980 = _960;
    if (!_872)
    {
        float3 _2765 = float3(_938, _944, float(as_type<int>(_960)));
        float3 _2767 = select(_2765, float3(0.0), isnan(_2765));
        float _982 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2767.xy, uint(rint(_2767.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2767.xy, uint(rint(_2767.z)), level(0.0)).x;
        _980 = _982;
    }
    float _984 = _980;
    float _986 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _988 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _990 = floor(_986);
    float _992 = precise::min(_147, -1.0000000116860974230803549289703e-07);
    float _994 = -_796;
    float _996 = fma(_994, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _998 = -_798;
    float _1000 = fma(_998, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1002 = -_800;
    float _1004 = fma(_1002, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1006 = -_802;
    float _1008 = fma(_1006, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1010 = floor(_988);
    float _1012 = -_990;
    float _1014 = _986 + _1012;
    float _1016 = 1.0 / _992;
    float _1018 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1020 = _1014 + _1018;
    float _1022 = -_1010;
    float _1024 = _988 + _1022;
    float _1026 = -_1020;
    float _1028 = _1026 + 1.0;
    float _1030 = 1.0 / _996;
    float _1032 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1034 = _1024 + _1032;
    float _1036 = -_1034;
    float _1038 = _1036 + 1.0;
    float _1040 = _1034 * _1028;
    float _1042 = 1.0 / _1004;
    float _1044 = _1020 * _1034;
    float _1046 = _1028 * _1038;
    float _1048 = _1020 * _1038;
    float _1050 = _1016 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _1052 = 1.0 / _1000;
    float _1054 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1056 = -_147;
    float _1058 = fma(_1030, _1054, _1056);
    float _1060 = abs(_1058);
    float _1062 = _1060 * _1050;
    float _1064 = 1.0 / _1008;
    float _1066 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1068 = -_147;
    float _1070 = fma(_1042, _1066, _1068);
    float _1072 = abs(_1070);
    float _1074 = _1072 * _1050;
    float _1076 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1078 = -_147;
    float _1080 = fma(_1052, _1076, _1078);
    float _1082 = exp2(_1062);
    float _1084 = abs(_1080);
    float _1086 = _1084 * _1050;
    float _1088 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1090 = -_147;
    float _1092 = fma(_1064, _1088, _1090);
    float _1094 = exp2(_1086);
    float _1096 = abs(_1092);
    float _1098 = _1096 * _1050;
    float _1100 = exp2(_1074);
    float _1102 = abs(_1040);
    float _1104 = _1102 * _1082;
    float _1106 = exp2(_1098);
    float _1108 = abs(_1044);
    float _1110 = _1108 * _1094;
    float _1112 = _1104 + _1110;
    float _1114 = abs(_1048);
    float _1116 = _1114 * _1100;
    float _1118 = _1116 + _1112;
    float _1120 = abs(_1046);
    float _1122 = _1120 * _1106;
    float _1124 = _1122 + _1118;
    float _1126 = -_1122;
    bool _1128 = _1118 != _1126;
    bool _1130 = isnan(_1118);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan(_1126);
    bool _1136 = _1132 || _1134;
    float _1138 = 1.0 / _1124;
    float _1140 = _1110 * _1138;
    float _1142 = _1104 * _1138;
    float _1144 = _1116 * _1138;
    float _1146 = _1122 * _1138;
    float _1148 = _1136 ? _1140 : 0.25;
    float _1150 = _1136 ? _1142 : 0.25;
    float _1152 = _1136 ? _1144 : 0.25;
    float _1154 = _1148 * _814;
    float _1156 = fma(_1150, _812, _1154);
    float _1158 = _1150;
    if (_872)
    {
        _1158 = 1.0;
    }
    float _1160 = _1158;
    float _1162 = fma(_1152, _816, _1156);
    float _1164 = -_147;
    float _1166 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1168 = _1164 + _1166;
    float _1170 = _1160;
    if (!_872)
    {
        int _1172 = _884 << 4;
        int _1174 = _1172 + 1648;
        int _1176 = _912 + 8048;
        uint _1178 = uint(int(uint(_1176) >> uint(2)));
        uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
        int _1182 = int(_1178) & 3;
        float _1184 = (*spvDescriptorSet0.fp_c5)._m0[int(_1180)][_1182];
        uint _1186 = uint(int(uint(_1174) >> uint(2)));
        uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
        int _1190 = int(_1186) & 3;
        float _1192 = (*spvDescriptorSet0.fp_c5)._m0[int(_1188)][_1190];
        int _1194 = int(_1186) + 1;
        uint _1196 = uint(int(uint(_1194) >> uint(2)));
        int _1198 = _1194 & 3;
        float _1200 = (*spvDescriptorSet0.fp_c5)._m0[int(_1196)][_1198];
        int _1202 = _1174 + 8;
        uint _1204 = uint(int(uint(_1202) >> uint(2)));
        uint _1206 = uint(int(uint(int(_1204)) >> uint(2)));
        int _1208 = int(_1204) & 3;
        float _1210 = (*spvDescriptorSet0.fp_c5)._m0[int(_1206)][_1208];
        int _1212 = int(_1204) + 1;
        uint _1214 = uint(int(uint(_1212) >> uint(2)));
        int _1216 = _1212 & 3;
        float _1218 = (*spvDescriptorSet0.fp_c5)._m0[int(_1214)][_1216];
        float _1220 = _536 * _1200;
        float _1222 = 1.0 / _1184;
        float _1224 = fma(_538, _1192, _1220);
        float _1226 = fma(_540, _1210, _1224);
        float _1228 = _1226 + _1218;
        float _1230 = precise::clamp(_1228, 0.0, 1.0);
        float _1232 = -_1230;
        float _1234 = _1232 + _984;
        float _1236 = _1184 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1238 = fma(_1222, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1234);
        float _1240 = _1236 * _1238;
        float _1242 = exp2(_1240);
        float _1244 = 0.0 + _1242;
        float _1246 = precise::clamp(_1244, 0.0, 1.0);
        _1170 = _1246;
    }
    float _1248 = _1170;
    float _1250 = -_147;
    float _1252 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1254 = _1250 + _1252;
    float _1256 = _1136 ? _1146 : 0.25;
    float _1258 = -_820;
    float _1260 = _1258 + 1.0;
    float _1262 = precise::min(_1248, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1264 = _1168 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1266 = precise::clamp(_1264, 0.0, 1.0);
    float _1268 = _1254 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1270 = precise::clamp(_1268, 0.0, 1.0);
    float _1272 = fma(_1256, _818, _1162);
    float _1274 = precise::min(_974, 1.0);
    float _1276 = -_1262;
    float _1278 = _1276 + 1.0;
    float _1280 = fma(_1266, _1260, _820);
    float _1282 = fma(_1270, _1278, _1262);
    float _1284 = precise::min(_1272, 1.0);
    out.m_60.x = _1280;
    out.m_60.y = _1282;
    out.m_60.z = _1284;
    out.m_60.w = 1.0;
    out.m_62.x = _1274;
    out.m_62.y = _976;
    out.m_62.z = _978;
    out.m_62.w = 1.0;
    return out;
}

