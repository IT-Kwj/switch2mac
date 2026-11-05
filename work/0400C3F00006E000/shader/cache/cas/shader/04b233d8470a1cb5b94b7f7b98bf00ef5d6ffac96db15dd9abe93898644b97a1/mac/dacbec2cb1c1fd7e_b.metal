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
    float2 _1325 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1325, float2(0.0), isnan(_1325))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1325, float2(0.0), isnan(_1325))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1340 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1340, float2(0.0), isnan(_1340))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1340, float2(0.0), isnan(_1340))).x;
    float2 _1348 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1348, float2(0.0), isnan(_1348))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1348, float2(0.0), isnan(_1348))).x;
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
    float _139 = _85 * _111;
    float _141 = _85 * _117;
    float _143 = _85 * _123;
    float _145 = _85 * _129;
    float _147 = _85 * _135;
    float _149 = -_93;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _153 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].x, _151);
    float _155 = _153 * _137;
    float _157 = _153 * _139;
    float _159 = _155 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _161 = _155 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _163 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].x, _159);
    float _165 = -_99;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _169 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[41].x, _167);
    float _171 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].x, _161);
    float _173 = -_97;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[41].x, _175);
    float _179 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _163);
    float _181 = -_157;
    float _183 = fma(_169, _145, _181);
    float _185 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _171);
    float _187 = -_157;
    float _189 = fma(_177, _141, _187);
    float _191 = _179 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _193 = -_155;
    float _195 = fma(_177, _143, _193);
    float _197 = -_153;
    float _199 = _197 + _177;
    float _201 = _185 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _203 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _205 = _191 + _203;
    float _207 = -_155;
    float _209 = fma(_169, _147, _207);
    float _211 = -_153;
    float _213 = _211 + _169;
    float _215 = _199 * _183;
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _219 = _201 + _217;
    float _221 = _205 * _205;
    float _223 = _195 * _213;
    float _225 = -_215;
    float _227 = fma(_189, _213, _225);
    float _229 = _189 * _209;
    float _231 = fma(_219, _219, _221);
    float _233 = -_223;
    float _235 = fma(_199, _209, _233);
    float _237 = _227 * _227;
    float _239 = -_229;
    float _241 = fma(_195, _183, _239);
    float _243 = sqrt(_231);
    float _245 = fma(_235, _235, _237);
    float _247 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _249 = fma(_241, _241, _245);
    float _251 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _247);
    float _253 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _251);
    float _255 = rsqrt(_249);
    float _257 = _253 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _261 = _243 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _263 = _235 * _255;
    float _265 = _227 * _255;
    float _267 = _241 * _255;
    float _269 = _253;
    float _271 = _255;
    float _273 = _191;
    if (!_261)
    {
        _269 = _201;
    }
    float _275 = _269;
    float _277 = _275;
    if (!_261)
    {
        _271 = _257;
    }
    float _279 = _271;
    bool _281 = !_261;
    float _283 = _279;
    if (!_281)
    {
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _287 = _243 + _285;
        float _289 = _257 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = rsqrt(_231);
        float _293 = -_257;
        float _295 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = _293 + _295;
        float _299 = abs(_289);
        float _301 = abs(_287);
        float _303 = precise::max(_299, _301);
        float _305 = _297 * _297;
        bool _307 = _303 >= 16.0;
        float _309 = _219 * _291;
        float _311 = _205 * _291;
        float _313 = -_219;
        float _315 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = -_205;
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
        _273 = _534;
        _277 = _532;
        _283 = _530;
    }
    float _536 = _273;
    float _538 = _277;
    float _540 = _283;
    float _542 = _265 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _544 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[35].x, _542);
    float _546 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].z, _544);
    float _548 = -_546;
    float _550 = fma(_548, _546, 1.0);
    float _552 = -_546;
    float _554 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[35].z, _267);
    float _556 = -_546;
    float _558 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[35].y, _265);
    float _560 = -_546;
    float _562 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[35].x, _263);
    float _564 = _550 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _566 = fma(_554, _564, _153);
    float _568 = fma(_558, _564, _155);
    float _570 = fma(_562, _564, _157);
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
    int _639 = _601 + 16;
    uint _641 = uint(int(uint(_639) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.fp_c3)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.fp_c3)._m0[int(_651)][_653];
    uint _657 = uint(int(uint(_601) >> uint(2)));
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
    int _691 = _601 + 24;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    int _701 = int(_693) + 1;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    int _705 = _701 & 3;
    float _707 = (*spvDescriptorSet0.fp_c3)._m0[int(_703)][_705];
    int _709 = _601 + 8;
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
    float _753 = _568 * _655;
    float _755 = 1.0 / _751;
    float _757 = fma(_570, _647, _753);
    float _759 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _761 = _568 * _671;
    float _763 = fma(_570, _663, _761);
    float _765 = _568 * _689;
    float _767 = fma(_570, _681, _765);
    float _769 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _771 = fma(_566, _699, _757);
    float _773 = fma(_566, _717, _763);
    float _775 = _771 + _707;
    float _777 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float _779 = fma(_536, 6.2500002968590706586837768554688e-05, 0.5);
    float _781 = _773 + _725;
    float _783 = _775 * _755;
    float2 _2439 = float2(_777, _779);
    float _785 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2439, float2(0.0), isnan(_2439))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2439, float2(0.0), isnan(_2439))).x;
    float _787 = fma(_566, _739, _767);
    float _789 = _781 * _755;
    float2 _2454 = float2(_87, _89);
    float4 _792 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2454, float2(0.0), isnan(_2454)), int2(0), component::x).xyzw;
    float _794 = _792.x;
    float _796 = _792.y;
    float _798 = _792.z;
    float _800 = _792.w;
    float _802 = _787 + _747;
    float _804 = _802 * _755;
    float _806 = precise::clamp(_804, 0.0, 1.0);
    float2 _2478 = float2(_87, _89);
    float4 _808 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2478, float2(0.0), isnan(_2478)), int2(0), component::w).xyzw;
    float _810 = _808.x;
    float _812 = _808.y;
    float _814 = _808.z;
    float _816 = _808.w;
    float2 _2494 = float2(_769, _759);
    float _818 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2494, float2(0.0), isnan(_2494))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2494, float2(0.0), isnan(_2494))).x;
    float3 _2506 = float3(_789, _783, float(int(_599)));
    float3 _2510 = select(_2506, float3(0.0), isnan(_2506));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2510.xy, uint(rint(_2510.z)), _806);
    float2 _2516 = float2(_777, _779);
    float _822 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2516, float2(0.0), isnan(_2516)), level(_785)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2516, float2(0.0), isnan(_2516)), level(_785)).x;
    float _824 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _826 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _828 = abs(_153);
    float _830 = log2(_828);
    float _832 = precise::min(_153, -1.0000000116860974230803549289703e-07);
    float _834 = floor(_824);
    float _836 = floor(_826);
    float _838 = _830 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _840 = -_794;
    float _842 = fma(_840, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _844 = -_834;
    float _846 = _824 + _844;
    float _848 = exp2(_838);
    float _850 = -_798;
    float _852 = fma(_850, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _854 = -_800;
    float _856 = fma(_854, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _858 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _860 = _846 + _858;
    float _862 = -_836;
    float _864 = _826 + _862;
    float _866 = -_860;
    float _868 = _866 + 1.0;
    float _870 = 1.0 / _832;
    float _872 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _874 = _864 + _872;
    float _876 = -_874;
    float _878 = _876 + 1.0;
    float _880 = _860 * _874;
    float _882 = _874 * _868;
    float _884 = 1.0 / _852;
    float _886 = _860 * _878;
    float _888 = _868 * _878;
    float _890 = -_796;
    float _892 = fma(_890, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _894 = fma(_848, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = _540 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _900 = _870 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _902 = 1.0 / _842;
    float _904 = fma(_896, -2.0, 3.0);
    float _906 = _896 * _896;
    float _908 = _540 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _910 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].x, _898);
    float _912 = _906 * _904;
    float _914 = 1.0 / _892;
    float _916 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].x, _908);
    float _918 = -_912;
    float _920 = _918 + 1.0;
    float _922 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].z, _910);
    float _924 = fma(_920, (*spvDescriptorSet0.fp_c3)._m0[44].w, _912);
    float _926 = 1.0 / _856;
    float _928 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _930 = -_153;
    float _932 = fma(_902, _928, _930);
    float _934 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _936 = abs(_932);
    float _938 = _936 * _900;
    float _940 = precise::max(0.0, _934);
    float _942 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _944 = -_153;
    float _946 = fma(_914, _942, _944);
    float _948 = exp2(_938);
    float _950 = abs(_946);
    float _952 = _950 * _900;
    float _954 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _956 = -_153;
    float _958 = fma(_884, _954, _956);
    float _960 = abs(_958);
    float _962 = _960 * _900;
    float _964 = _924 * _940;
    float _966 = exp2(_952);
    float _968 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _970 = -_153;
    float _972 = fma(_926, _968, _970);
    float _974 = abs(_972);
    float _976 = _974 * _900;
    float _978 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].z, _916);
    float _980 = exp2(_962);
    float _982 = abs(_882);
    float _984 = _982 * _948;
    float _986 = _978 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _988 = exp2(_976);
    float _990 = abs(_880);
    float _992 = _990 * _966;
    float _994 = _922 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _996 = _984 + _992;
    float _998 = trunc(_986);
    int _1000 = int(_998);
    float _1002 = abs(_886);
    float _1004 = _1002 * _980;
    float _1006 = _1004 + _996;
    float _1008 = trunc(_994);
    int _1010 = int(_1008);
    float _1012 = abs(_888);
    float _1014 = _1012 * _988;
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
    float _1060 = _992 * _1036;
    float _1062 = _984 * _1036;
    float _1064 = _1004 * _1036;
    float _1066 = _1028 ? _1060 : 0.25;
    bool _1068 = _153 >= (-8000.0);
    bool _1070 = isnan(_153);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(-8000.0);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    float _1080 = _1028 ? _1062 : 0.25;
    float _1082 = _1066 * _812;
    float _1084 = _1078 * _964;
    float _1086 = _964;
    if (_1058)
    {
        _1086 = 1.0;
    }
    float _1088 = _1086;
    float _1090 = _1088;
    if (!_1058)
    {
        int _1092 = _1044 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1094 = _1092 + _1034;
        float _1096 = floor(_994);
        int _1098 = _1094 << 2;
        int _1100 = _1094 >> 2;
        int _1102 = 12 & _1098;
        int _1104 = _1100 << 4;
        int _1106 = _1104 + _1102;
        float _1108 = floor(_986);
        uint _1110 = uint(int(uint(_1106) >> uint(2)));
        uint _1112 = uint(int(uint(int(_1110)) >> uint(2)));
        int _1114 = int(_1110) & 3;
        float _1116 = (*spvDescriptorSet0.fp_c5)._m0[int(_1112)][_1114];
        float _1118 = -_1096;
        float _1120 = _994 + _1118;
        float _1122 = -_1108;
        float _1124 = _986 + _1122;
        float _1126 = rint(_1116);
        float _1128 = precise::max(_1126, 0.0);
        uint _1130 = uint(_1128);
        uint _1132 = clamp(_1130, 0u, 65535u);
        float3 _2974 = float3(_1124, _1120, float(int(_1132)));
        float3 _2976 = select(_2974, float3(0.0), isnan(_2974));
        float _1134 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2976.xy, uint(rint(_2976.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2976.xy, uint(rint(_2976.z)), level(0.0)).x;
        int _1136 = _1094 << 4;
        int _1138 = _1136 + 1648;
        int _1140 = _1106 + 8048;
        uint _1142 = uint(int(uint(_1140) >> uint(2)));
        uint _1144 = uint(int(uint(int(_1142)) >> uint(2)));
        int _1146 = int(_1142) & 3;
        float _1148 = (*spvDescriptorSet0.fp_c5)._m0[int(_1144)][_1146];
        uint _1150 = uint(int(uint(_1138) >> uint(2)));
        uint _1152 = uint(int(uint(int(_1150)) >> uint(2)));
        int _1154 = int(_1150) & 3;
        float _1156 = (*spvDescriptorSet0.fp_c5)._m0[int(_1152)][_1154];
        int _1158 = int(_1150) + 1;
        uint _1160 = uint(int(uint(_1158) >> uint(2)));
        int _1162 = _1158 & 3;
        float _1164 = (*spvDescriptorSet0.fp_c5)._m0[int(_1160)][_1162];
        int _1166 = _1138 + 8;
        uint _1168 = uint(int(uint(_1166) >> uint(2)));
        uint _1170 = uint(int(uint(int(_1168)) >> uint(2)));
        int _1172 = int(_1168) & 3;
        float _1174 = (*spvDescriptorSet0.fp_c5)._m0[int(_1170)][_1172];
        int _1176 = int(_1168) + 1;
        uint _1178 = uint(int(uint(_1176) >> uint(2)));
        int _1180 = _1176 & 3;
        float _1182 = (*spvDescriptorSet0.fp_c5)._m0[int(_1178)][_1180];
        float _1184 = 1.0 / _1148;
        float _1186 = _540 * _1164;
        float _1188 = fma(_538, _1156, _1186);
        float _1190 = _1148 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1192 = fma(_536, _1174, _1188);
        float _1194 = _1192 + _1182;
        float _1196 = precise::clamp(_1194, 0.0, 1.0);
        float _1198 = -_1196;
        float _1200 = _1198 + _1134;
        float _1202 = fma(_1184, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1200);
        float _1204 = _1190 * _1202;
        float _1206 = exp2(_1204);
        float _1208 = 0.0 + _1206;
        float _1210 = precise::clamp(_1208, 0.0, 1.0);
        _1090 = _1210;
    }
    float _1212 = _1090;
    float _1214 = _1028 ? _1064 : 0.25;
    float _1216 = _1084 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1218 = -_818;
    float _1220 = _1218 + 1.0;
    float _1222 = fma(_1080, _810, _1082);
    float _1224 = _1014 * _1036;
    float _1226 = abs(_822);
    float _1228 = _1226 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1230 = _1220 * _1216;
    float _1232 = precise::clamp(_1230, 0.0, 1.0);
    float _1234 = fma(_1214, _814, _1222);
    float _1236 = -_153;
    float _1238 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1240 = _1236 + _1238;
    float _1242 = precise::min(_1212, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1244 = -_1232;
    float _1246 = fma(_1244, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1248 = -_153;
    float _1250 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1252 = _1248 + _1250;
    float _1254 = _1240 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1256 = precise::clamp(_1254, 0.0, 1.0);
    float _1258 = _1028 ? _1224 : 0.25;
    float _1260 = -_1242;
    float _1262 = _1260 + 1.0;
    float _1264 = -_1228;
    float _1266 = fma(_1078, _1264, 1.0);
    float _1268 = _1252 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1270 = precise::clamp(_1268, 0.0, 1.0);
    float _1272 = -_820;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_1256, _1262, _1242);
    float _1278 = fma(_1258, _816, _1234);
    float _1280 = precise::min(_1266, 1.0);
    float _1282 = fma(_1270, _1274, _820);
    float _1284 = precise::min(_1280, _1246);
    float _1286 = precise::min(_1278, 1.0);
    out.m_62.x = _1282;
    out.m_62.y = _1276;
    out.m_62.z = _1286;
    out.m_62.w = _1284;
    out.m_64.x = 1.0;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

