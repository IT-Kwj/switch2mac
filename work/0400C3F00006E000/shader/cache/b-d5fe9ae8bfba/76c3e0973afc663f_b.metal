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
    float2 _1272 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1272, float2(0.0), isnan(_1272))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1272, float2(0.0), isnan(_1272))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1287 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1287, float2(0.0), isnan(_1287))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1287, float2(0.0), isnan(_1287))).x;
    float2 _1295 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1295, float2(0.0), isnan(_1295))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1295, float2(0.0), isnan(_1295))).x;
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
    float _159 = -_97;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].x, _161);
    float _165 = _155 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _167 = _155 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _169 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].x, _165);
    float _171 = -_99;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _175 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[41].x, _173);
    float _177 = -_157;
    float _179 = fma(_163, _141, _177);
    float _181 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].x, _167);
    float _183 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _169);
    float _185 = -_155;
    float _187 = fma(_163, _143, _185);
    float _189 = -_153;
    float _191 = _189 + _163;
    float _193 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _181);
    float _195 = _183 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _197 = -_157;
    float _199 = fma(_175, _145, _197);
    float _201 = -_155;
    float _203 = fma(_175, _147, _201);
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _209 = _195 + _207;
    float _211 = -_153;
    float _213 = _211 + _175;
    float _215 = _191 * _199;
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _219 = _205 + _217;
    float _221 = _209 * _209;
    float _223 = _187 * _213;
    float _225 = -_215;
    float _227 = fma(_179, _213, _225);
    float _229 = _179 * _203;
    float _231 = fma(_219, _219, _221);
    float _233 = -_223;
    float _235 = fma(_191, _203, _233);
    float _237 = _227 * _227;
    float _239 = -_229;
    float _241 = fma(_187, _199, _239);
    float _243 = sqrt(_231);
    float _245 = fma(_235, _235, _237);
    float _247 = fma(_241, _241, _245);
    float _249 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _251 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _249);
    float _253 = rsqrt(_247);
    float _255 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _251);
    bool _259 = _243 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _255 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _263 = _235 * _253;
    float _265 = _227 * _253;
    float _267 = _241 * _253;
    float _269 = _241;
    float _271 = _253;
    float _273 = _195;
    if (!_259)
    {
        _269 = _205;
    }
    float _275 = _269;
    float _277 = _275;
    if (!_259)
    {
        _271 = _261;
    }
    float _279 = _271;
    bool _281 = !_259;
    float _283 = _279;
    if (!_281)
    {
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _287 = _243 + _285;
        float _289 = _261 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = rsqrt(_231);
        float _293 = -_261;
        float _295 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = _293 + _295;
        float _299 = abs(_289);
        float _301 = abs(_287);
        float _303 = precise::max(_299, _301);
        float _305 = _297 * _297;
        bool _307 = _303 >= 16.0;
        float _309 = _219 * _291;
        float _311 = _209 * _291;
        float _313 = -_219;
        float _315 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = -_209;
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
        _273 = _534;
    }
    float _536 = _283;
    float _538 = _277;
    float _540 = _273;
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
    int _709 = _601 + 40;
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
    float2 _2289 = float2(_87, _89);
    float2 _733 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2289, float2(0.0), isnan(_2289))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2289, float2(0.0), isnan(_2289))).xy;
    float _735 = _733.x;
    float _737 = _733.y;
    int _739 = _601 + 8;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    uint _743 = uint(int(uint(int(_741)) >> uint(2)));
    int _745 = int(_741) & 3;
    float _747 = (*spvDescriptorSet0.fp_c3)._m0[int(_743)][_745];
    int _749 = int(_741) + 1;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    int _753 = _749 & 3;
    float _755 = (*spvDescriptorSet0.fp_c3)._m0[int(_751)][_753];
    float _757 = fma(_566, _629, _729);
    float _759 = _757 + _637;
    float _761 = _568 * _655;
    float _763 = 1.0 / _759;
    float _765 = fma(_570, _647, _761);
    float _767 = _568 * _671;
    float _769 = fma(_570, _663, _767);
    float _771 = _568 * _689;
    float _773 = fma(_570, _681, _771);
    float _775 = fma(_566, _699, _765);
    float _777 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _87);
    float _779 = _775 + _707;
    float _781 = _779 * _763;
    float _783 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _89);
    float _785 = fma(_566, _717, _773);
    float2 _2385 = float2(_777, _783);
    float4 _788 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2385, float2(0.0), isnan(_2385)), int2(0), component::x).xyzw;
    float _790 = _788.x;
    float _792 = _788.y;
    float _794 = _788.z;
    float _796 = _788.w;
    float _798 = _785 + _725;
    float _800 = fma(_566, _747, _769);
    float _802 = _798 * _763;
    float _804 = precise::clamp(_802, 0.0, 1.0);
    float _806 = _800 + _755;
    float _808 = _806 * _763;
    float2 _2419 = float2(_777, _783);
    float4 _810 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2419, float2(0.0), isnan(_2419)), int2(0), component::w).xyzw;
    float _812 = _810.x;
    float _814 = _810.y;
    float _816 = _810.z;
    float _818 = _810.w;
    float3 _2439 = float3(_808, _781, float(int(_599)));
    float3 _2443 = select(_2439, float3(0.0), isnan(_2439));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2443.xy, uint(rint(_2443.z)), _804);
    float _822 = fma(_735, 2.0, -1.0);
    float _824 = fma(_737, 2.0, -1.0);
    float _826 = _822 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _828 = _824 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _830 = fma(_826, 2.0, _87);
    float _832 = fma(_828, 2.0, _89);
    float2 _2469 = float2(_830, _832);
    float _834 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2469, float2(0.0), isnan(_2469))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2469, float2(0.0), isnan(_2469))).x;
    float2 _2477 = float2(_830, _832);
    float2 _836 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2477, float2(0.0), isnan(_2477))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2477, float2(0.0), isnan(_2477))).yz;
    float _838 = _836.x;
    float _840 = _836.y;
    float _842 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _844 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _846 = precise::min(_153, -1.0000000116860974230803549289703e-07);
    float _848 = floor(_842);
    float _850 = floor(_844);
    float _852 = -_848;
    float _854 = _842 + _852;
    float _856 = 1.0 / _846;
    float _858 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _860 = _854 + _858;
    float _862 = -_850;
    float _864 = _844 + _862;
    float _866 = -_860;
    float _868 = _866 + 1.0;
    float _870 = -_790;
    float _872 = fma(_870, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _874 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _876 = _864 + _874;
    float _878 = -_792;
    float _880 = fma(_878, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _882 = -_794;
    float _884 = fma(_882, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _886 = -_796;
    float _888 = fma(_886, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _890 = -_876;
    float _892 = _890 + 1.0;
    float _894 = _876 * _868;
    float _896 = 1.0 / _884;
    float _898 = _860 * _876;
    float _900 = _868 * _892;
    float _902 = _860 * _892;
    float _904 = _856 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _906 = _536 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _908 = _536 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _910 = 1.0 / _872;
    float _912 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].x, _906);
    float _914 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].x, _908);
    float _916 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].z, _914);
    float _918 = 1.0 / _880;
    float _920 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _922 = -_153;
    float _924 = fma(_896, _920, _922);
    float _926 = 1.0 / _888;
    float _928 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _930 = -_153;
    float _932 = fma(_910, _928, _930);
    float _934 = abs(_932);
    float _936 = _934 * _904;
    float _938 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _940 = -_153;
    float _942 = fma(_918, _938, _940);
    float _944 = abs(_924);
    float _946 = _944 * _904;
    float _948 = exp2(_936);
    float _950 = abs(_942);
    float _952 = _950 * _904;
    float _954 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _956 = -_153;
    float _958 = fma(_926, _954, _956);
    float _960 = exp2(_952);
    float _962 = abs(_958);
    float _964 = _962 * _904;
    float _966 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].z, _912);
    float _968 = _966 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _970 = exp2(_946);
    float _972 = abs(_894);
    float _974 = _972 * _948;
    float _976 = exp2(_964);
    float _978 = abs(_898);
    float _980 = _978 * _960;
    float _982 = _916 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _984 = _974 + _980;
    float _986 = trunc(_968);
    int _988 = int(_986);
    float _990 = abs(_902);
    float _992 = _990 * _970;
    float _994 = _992 + _984;
    float _996 = trunc(_982);
    int _998 = int(_996);
    float _1000 = abs(_900);
    float _1002 = _1000 * _976;
    float _1004 = _1002 + _994;
    float _1006 = -_1002;
    bool _1008 = _994 != _1006;
    bool _1010 = isnan(_994);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan(_1006);
    bool _1016 = _1012 || _1014;
    int _1018 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1020 = _988 + _1018;
    int _1022 = _1020 + 1;
    float _1024 = 1.0 / _1004;
    bool _1026 = _1022 >= 0;
    int _1028 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1030 = _998 + _1028;
    int _1032 = _1030 + 1;
    bool _1034 = _1022 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1036 = !_1026;
    bool _1038 = _1034 || _1036;
    bool _1040 = _1032 < 0;
    bool _1042 = _1040 || _1038;
    bool _1044 = _1032 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1046 = _1044 || _1042;
    float _1048 = _980 * _1024;
    float _1050 = _992 * _1024;
    float _1052 = _1016 ? _1048 : 0.25;
    float _1054 = _974 * _1024;
    float _1056 = _1052 * _814;
    float _1058 = _1016 ? _1054 : 0.25;
    float _1060 = as_type<float>(_998);
    if (_1046)
    {
        _1060 = 1.0;
    }
    float _1062 = _1060;
    float _1064 = _1062;
    if (!_1046)
    {
        int _1066 = _1032 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1068 = _1066 + _1022;
        float _1070 = floor(_982);
        int _1072 = _1068 << 2;
        int _1074 = _1068 >> 2;
        int _1076 = 12 & _1072;
        int _1078 = _1074 << 4;
        int _1080 = _1078 + _1076;
        float _1082 = floor(_968);
        uint _1084 = uint(int(uint(_1080) >> uint(2)));
        uint _1086 = uint(int(uint(int(_1084)) >> uint(2)));
        int _1088 = int(_1084) & 3;
        float _1090 = (*spvDescriptorSet0.fp_c5)._m0[int(_1086)][_1088];
        float _1092 = -_1070;
        float _1094 = _982 + _1092;
        float _1096 = -_1082;
        float _1098 = _968 + _1096;
        float _1100 = rint(_1090);
        float _1102 = precise::max(_1100, 0.0);
        uint _1104 = uint(_1102);
        uint _1106 = clamp(_1104, 0u, 65535u);
        float3 _2874 = float3(_1098, _1094, float(int(_1106)));
        float3 _2876 = select(_2874, float3(0.0), isnan(_2874));
        float _1108 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2876.xy, uint(rint(_2876.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2876.xy, uint(rint(_2876.z)), level(0.0)).x;
        int _1110 = _1068 << 4;
        int _1112 = _1110 + 1648;
        int _1114 = _1080 + 8048;
        uint _1116 = uint(int(uint(_1114) >> uint(2)));
        uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
        int _1120 = int(_1116) & 3;
        float _1122 = (*spvDescriptorSet0.fp_c5)._m0[int(_1118)][_1120];
        uint _1124 = uint(int(uint(_1112) >> uint(2)));
        uint _1126 = uint(int(uint(int(_1124)) >> uint(2)));
        int _1128 = int(_1124) & 3;
        float _1130 = (*spvDescriptorSet0.fp_c5)._m0[int(_1126)][_1128];
        int _1132 = int(_1124) + 1;
        uint _1134 = uint(int(uint(_1132) >> uint(2)));
        int _1136 = _1132 & 3;
        float _1138 = (*spvDescriptorSet0.fp_c5)._m0[int(_1134)][_1136];
        int _1140 = _1112 + 8;
        uint _1142 = uint(int(uint(_1140) >> uint(2)));
        uint _1144 = uint(int(uint(int(_1142)) >> uint(2)));
        int _1146 = int(_1142) & 3;
        float _1148 = (*spvDescriptorSet0.fp_c5)._m0[int(_1144)][_1146];
        int _1150 = int(_1142) + 1;
        uint _1152 = uint(int(uint(_1150) >> uint(2)));
        int _1154 = _1150 & 3;
        float _1156 = (*spvDescriptorSet0.fp_c5)._m0[int(_1152)][_1154];
        float _1158 = 1.0 / _1122;
        float _1160 = _536 * _1138;
        float _1162 = fma(_538, _1130, _1160);
        float _1164 = _1122 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1166 = fma(_540, _1148, _1162);
        float _1168 = _1166 + _1156;
        float _1170 = precise::clamp(_1168, 0.0, 1.0);
        float _1172 = -_1170;
        float _1174 = _1172 + _1108;
        float _1176 = fma(_1158, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1174);
        float _1178 = _1164 * _1176;
        float _1180 = exp2(_1178);
        float _1182 = 0.0 + _1180;
        float _1184 = precise::clamp(_1182, 0.0, 1.0);
        _1064 = _1184;
    }
    float _1186 = _1064;
    float _1188 = precise::min(_1186, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1190 = _1002 * _1024;
    float _1192 = _1016 ? _1050 : 0.25;
    float _1194 = -_153;
    float _1196 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1198 = _1194 + _1196;
    float _1200 = fma(_1058, _812, _1056);
    float _1202 = -_153;
    float _1204 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1206 = _1202 + _1204;
    float _1208 = -_1188;
    float _1210 = _1208 + 1.0;
    float _1212 = _1198 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1214 = precise::clamp(_1212, 0.0, 1.0);
    float _1216 = _1016 ? _1190 : 0.25;
    float _1218 = fma(_1192, _816, _1200);
    float _1220 = _1206 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1222 = precise::clamp(_1220, 0.0, 1.0);
    float _1224 = fma(_1214, _1210, _1188);
    float _1226 = -_820;
    float _1228 = _1226 + 1.0;
    float _1230 = fma(_1216, _818, _1218);
    float _1232 = fma(_1222, _1228, _820);
    float _1234 = precise::min(_1230, 1.0);
    out.m_62.x = _1232;
    out.m_62.y = _1224;
    out.m_62.z = _1234;
    out.m_62.w = 1.0;
    out.m_64.x = _834;
    out.m_64.y = _838;
    out.m_64.z = _840;
    out.m_64.w = 1.0;
    return out;
}

