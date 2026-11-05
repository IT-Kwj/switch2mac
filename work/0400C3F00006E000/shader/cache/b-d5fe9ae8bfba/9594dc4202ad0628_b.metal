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
    texture2d<float> fp_t_tcb_18 [[id(7)]];
    sampler fp_t_tcb_18Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_1A [[id(13)]];
    sampler fp_t_tcb_1ASmplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d<float> fp_t_tcb_14 [[id(17)]];
    sampler fp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_16 [[id(19)]];
    sampler fp_t_tcb_16Smplr [[id(20)]];
    texture2d_array<float> fp_t_tcb_E [[id(21)]];
    sampler fp_t_tcb_ESmplr [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_ASmplr_w [[id(24)]];
    sampler fp_t_tcb_18Smplr_w [[id(25)]];
    sampler fp_t_tcb_1ASmplr_w [[id(26)]];
    sampler fp_t_tcb_14Smplr_w [[id(27)]];
    sampler fp_t_tcb_16Smplr_w [[id(28)]];
    sampler fp_t_tcb_ESmplr_w [[id(29)]];
    constant dm_border_t* dm_border [[id(30)]];
};

struct main0_out
{
    float4 m_66 [[color(0)]];
    float4 m_68 [[color(1)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _75 = gl_FragCoord.w;
    float _77 = in.m_57.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_57.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _75;
    float _91 = _89 * _81;
    float _93 = _89 * _87;
    float _95 = _91 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1360 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1360, float2(0.0), isnan(_1360))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1360, float2(0.0), isnan(_1360))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1375 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1375, float2(0.0), isnan(_1375))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1375, float2(0.0), isnan(_1375))).x;
    float2 _1383 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1383, float2(0.0), isnan(_1383))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1383, float2(0.0), isnan(_1383))).x;
    float _105 = in.m_59.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_59.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_61.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_61.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_63.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_63.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _89 * _109;
    float _143 = _89 * _115;
    float _145 = _89 * _121;
    float _147 = _89 * _133;
    float _149 = -_97;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _153 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].x, _151);
    float _155 = _153 * _141;
    float _157 = _153 * _143;
    float _159 = _89 * _127;
    float _161 = -_101;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _165 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[41].x, _163);
    float _167 = _155 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _169 = _155 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _171 = _89 * _139;
    float _173 = -_157;
    float _175 = fma(_165, _145, _173);
    float _177 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].x, _167);
    float _179 = -_103;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[41].x, _181);
    float _185 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].x, _169);
    float _187 = -_155;
    float _189 = fma(_165, _159, _187);
    float _191 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _177);
    float _193 = -_153;
    float _195 = _193 + _165;
    float _197 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _199 = -_155;
    float _201 = fma(_183, _171, _199);
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _205 = -_157;
    float _207 = fma(_183, _147, _205);
    float _209 = _197 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _211 = -_153;
    float _213 = _211 + _183;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _217 = _203 + _215;
    float _219 = _195 * _207;
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _223 = _209 + _221;
    float _225 = _189 * _213;
    float _227 = _217 * _217;
    float _229 = -_219;
    float _231 = fma(_175, _213, _229);
    float _233 = _175 * _201;
    float _235 = -_225;
    float _237 = fma(_195, _201, _235);
    float _239 = fma(_223, _223, _227);
    float _241 = _231 * _231;
    float _243 = -_233;
    float _245 = fma(_189, _207, _243);
    float _247 = sqrt(_239);
    float _249 = fma(_237, _237, _241);
    float _251 = fma(_245, _245, _249);
    float _253 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _255 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _253);
    float _257 = rsqrt(_251);
    float _259 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _255);
    bool _263 = _247 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _265 = _259 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _267 = _237 * _257;
    float _269 = _231 * _257;
    float _271 = _245 * _257;
    float _273 = _253;
    float _275 = _203;
    float _277 = _265;
    if (!_263)
    {
        _273 = _209;
    }
    float _279 = _273;
    bool _281 = !_263;
    float _283 = _279;
    if (!_281)
    {
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _287 = _247 + _285;
        float _289 = _265 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = rsqrt(_239);
        float _293 = -_265;
        float _295 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = _293 + _295;
        float _299 = abs(_289);
        float _301 = abs(_287);
        float _303 = precise::max(_299, _301);
        float _305 = _297 * _297;
        bool _307 = _303 >= 16.0;
        float _309 = _223 * _291;
        float _311 = _217 * _291;
        float _313 = -_223;
        float _315 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = _287;
        float _319 = _289;
        if (_307)
        {
            float _321 = _287 * 0.0625;
            _317 = _321;
        }
        float _323 = _317;
        if (_307)
        {
            float _325 = _289 * 0.0625;
            _319 = _325;
        }
        float _327 = _319;
        float _329 = -_217;
        float _331 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[41].z, _329);
        float _333 = fma(_315, _315, _305);
        float _335 = abs(_323);
        bool _337 = _335 != 0.0;
        bool _339 = isnan(_335);
        bool _341 = _337 || _339;
        bool _343 = isnan(0.0);
        bool _345 = _341 || _343;
        float _347 = fma(_331, _331, _333);
        float _349 = abs(_327);
        bool _351 = _349 == 0.0;
        float _353 = abs(_327);
        bool _355 = _353 == 0.0;
        bool _357 = !_345;
        bool _359 = _355 && _357;
        float _361 = sqrt(_347);
        bool _363 = false;
        int _366 = as_type<int>(_331);
        if (_359)
        {
            bool _368 = as_type<int>(_327) >= 0;
            _363 = _368;
        }
        bool _370 = _363;
        int _372 = _370 ? (-1) : 0;
        if (_359)
        {
            int _374 = _370 ? 0 : 1078530011;
            _366 = _374;
        }
        int _376 = _366;
        int _378 = _376;
        if (_359)
        {
            int _380 = int(0x80000000) & as_type<int>(_323);
            int _382 = _376 | _380;
            _378 = _382;
        }
        int _384 = _378;
        bool _386 = !_345;
        bool _388 = _386 && _351;
        int _390 = _384;
        float _392 = as_type<float>(_384);
        if (!_388)
        {
            float _394 = abs(_323);
            bool _396 = _394 != as_type<float>(0x7f800000u /* inf */);
            bool _398 = isnan(_394);
            bool _400 = _396 || _398;
            bool _402 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _404 = _400 || _402;
            float _406 = abs(_327);
            bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
            float _410 = abs(_327);
            bool _412 = _410 == as_type<float>(0x7f800000u /* inf */);
            bool _414 = !_404;
            bool _416 = _412 && _414;
            if (_416)
            {
                bool _418 = as_type<int>(_327) >= 0;
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
                int _434 = int(0x80000000) & as_type<int>(_323);
                int _436 = _430 | _434;
                _432 = as_type<float>(_436);
            }
            float _438 = _432;
            bool _440 = !_404;
            bool _442 = _440 && _408;
            _392 = _438;
            if (!_442)
            {
                float _444 = abs(_323);
                float _446 = abs(_327);
                float _448 = precise::max(_444, _446);
                float _450 = abs(_323);
                float _452 = abs(_327);
                float _454 = precise::min(_450, _452);
                float _456 = 1.0 / _448;
                float _458 = abs(_323);
                float _460 = abs(_327);
                bool _462 = _458 > _460;
                bool _464 = as_type<int>(_327) >= 0;
                float _466 = abs(_323);
                float _468 = abs(_327);
                float _470 = _466 + _468;
                int _472 = as_type<int>(_323) & int(0x80000000);
                bool _474 = _470 > as_type<float>(0x7f800000u /* inf */);
                bool _476 = isnan(_470);
                bool _478 = _474 || _476;
                bool _480 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _482 = _478 || _480;
                float _484 = _454 * _456;
                float _486 = _484 * _484;
                float _488 = _486 + 11.33538818359375;
                float _490 = fma(_486, _488, 28.84246826171875);
                float _492 = fma(_486, _490, 19.6966705322265625);
                float _494 = fma(_486, -0.82336294651031494140625, -5.674867153167724609375);
                float _496 = fma(_486, _494, -6.565555095672607421875);
                float _498 = 1.0 / _492;
                float _500 = _486 * _496;
                float _502 = _484 * _500;
                float _504 = fma(_502, _498, _484);
                float _506 = _504;
                _392 = _470;
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
                if (!_482)
                {
                    int _522 = _472 | _520;
                    _392 = as_type<float>(_522);
                }
            }
        }
        float _524 = _392;
        float _526 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _528 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _530 = _361 + _528;
        float _532 = fma(_309, _526, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _534 = fma(_311, _526, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _283 = _532;
        _275 = _534;
        _277 = _530;
    }
    float _536 = _283;
    float _538 = _275;
    float _540 = _277;
    float2 _2052 = float2(_91, _93);
    float2 _544 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2052, float2(0.0), isnan(_2052))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2052, float2(0.0), isnan(_2052))).xy;
    float _546 = _544.x;
    float _548 = _544.y;
    float _550 = fma(_536, 6.2500002968590706586837768554688e-05, 0.5);
    float _552 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2070 = float2(_550, _552);
    float _554 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2070, float2(0.0), isnan(_2070))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2070, float2(0.0), isnan(_2070))).x;
    float _556 = _269 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _558 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].x, _556);
    float _560 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[35].z, _558);
    float _562 = -_560;
    float _564 = fma(_562, _560, 1.0);
    float _566 = -_560;
    float _568 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[35].z, _271);
    float _570 = -_560;
    float _572 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[35].x, _267);
    float _574 = -_560;
    float _576 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[35].y, _269);
    float _578 = _564 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _580 = fma(_568, _578, _153);
    float _582 = fma(_576, _578, _155);
    float _584 = fma(_572, _578, _157);
    float _586 = -_580;
    bool _588 = _586 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _590 = float(_588);
    float _592 = -_580;
    bool _594 = _592 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _596 = float(_594);
    float _598 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _600 = _590 + _596;
    float _602 = precise::min(_600, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _604 = trunc(_602);
    int _606 = int(_604);
    float _608 = rint(_602);
    float _610 = precise::max(_608, 0.0);
    uint _613 = uint(_610);
    uint _615 = clamp(_613, 0u, 65535u);
    int _617 = _606 << 6;
    int _619 = _617 + 16;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.fp_c3)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.fp_c3)._m0[int(_631)][_633];
    int _637 = _617 + 32;
    uint _639 = uint(int(uint(_637) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.fp_c3)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    int _655 = _617 + 48;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    uint _659 = uint(int(uint(int(_657)) >> uint(2)));
    int _661 = int(_657) & 3;
    float _663 = (*spvDescriptorSet0.fp_c3)._m0[int(_659)][_661];
    int _665 = int(_657) + 1;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    int _669 = _665 & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    int _673 = _617 + 24;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    uint _677 = uint(int(uint(int(_675)) >> uint(2)));
    int _679 = int(_675) & 3;
    float _681 = (*spvDescriptorSet0.fp_c3)._m0[int(_677)][_679];
    int _683 = int(_675) + 1;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    int _687 = _683 & 3;
    float _689 = (*spvDescriptorSet0.fp_c3)._m0[int(_685)][_687];
    uint _691 = uint(int(uint(_617) >> uint(2)));
    uint _693 = uint(int(uint(int(_691)) >> uint(2)));
    int _695 = int(_691) & 3;
    float _697 = (*spvDescriptorSet0.fp_c3)._m0[int(_693)][_695];
    int _699 = int(_691) + 1;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    int _703 = _699 & 3;
    float _705 = (*spvDescriptorSet0.fp_c3)._m0[int(_701)][_703];
    int _707 = _617 + 40;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    uint _711 = uint(int(uint(int(_709)) >> uint(2)));
    int _713 = int(_709) & 3;
    float _715 = (*spvDescriptorSet0.fp_c3)._m0[int(_711)][_713];
    int _717 = int(_709) + 1;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    int _721 = _717 & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    float _725 = _582 * _635;
    int _727 = _617 + 56;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    uint _731 = uint(int(uint(int(_729)) >> uint(2)));
    int _733 = int(_729) & 3;
    float _735 = (*spvDescriptorSet0.fp_c3)._m0[int(_731)][_733];
    int _737 = int(_729) + 1;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    int _741 = _737 & 3;
    float _743 = (*spvDescriptorSet0.fp_c3)._m0[int(_739)][_741];
    float _745 = fma(_584, _627, _725);
    float _747 = _582 * _653;
    int _749 = _617 + 8;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    uint _753 = uint(int(uint(int(_751)) >> uint(2)));
    int _755 = int(_751) & 3;
    float _757 = (*spvDescriptorSet0.fp_c3)._m0[int(_753)][_755];
    int _759 = int(_751) + 1;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    int _763 = _759 & 3;
    float _765 = (*spvDescriptorSet0.fp_c3)._m0[int(_761)][_763];
    float _767 = fma(_584, _645, _747);
    float _769 = _582 * _671;
    float _771 = fma(_584, _663, _769);
    float _773 = fma(_580, _681, _745);
    float _775 = _773 + _689;
    float _777 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _779 = _582 * _705;
    float _781 = fma(_584, _697, _779);
    float _783 = fma(_580, _715, _767);
    float _785 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _787 = _783 + _723;
    float2 _2477 = float2(_785, _777);
    float4 _790 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2477, float2(0.0), isnan(_2477)), int2(0), component::x).xyzw;
    float _792 = _790.x;
    float _794 = _790.y;
    float _796 = _790.z;
    float _798 = _790.w;
    float _800 = fma(_580, _735, _771);
    float _802 = _800 + _743;
    float _804 = fma(_580, _757, _781);
    float _806 = 1.0 / _802;
    float _808 = _804 + _765;
    float _810 = _808 * _806;
    float _812 = _775 * _806;
    float _814 = _787 * _806;
    float _816 = precise::clamp(_814, 0.0, 1.0);
    float _818 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _820 = fma(_546, 2.0, -1.0);
    float _822 = fma(_548, 2.0, -1.0);
    float _824 = _820 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _826 = _822 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _828 = fma(_824, 2.0, _91);
    float _830 = fma(_826, 2.0, _93);
    float2 _2546 = float2(_785, _777);
    float4 _832 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2546, float2(0.0), isnan(_2546)), int2(0), component::w).xyzw;
    float _834 = _832.x;
    float _836 = _832.y;
    float _838 = _832.z;
    float _840 = _832.w;
    float2 _2562 = float2(_818, _598);
    float _842 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2562, float2(0.0), isnan(_2562))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2562, float2(0.0), isnan(_2562))).x;
    float3 _2573 = float3(_810, _812, float(int(_615)));
    float3 _2577 = select(_2573, float3(0.0), isnan(_2573));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2577.xy, uint(rint(_2577.z)), _816);
    float2 _2583 = float2(_828, _830);
    float3 _848 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2583, float2(0.0), isnan(_2583))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2583, float2(0.0), isnan(_2583))).xyz;
    float _850 = _848.x;
    float _852 = _848.y;
    float _854 = _848.z;
    float2 _2597 = float2(_550, _552);
    float _856 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2597, float2(0.0), isnan(_2597)), level(_554)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2597, float2(0.0), isnan(_2597)), level(_554)).x;
    float _858 = abs(_153);
    float _860 = log2(_858);
    float _862 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _864 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _866 = precise::min(_153, -1.0000000116860974230803549289703e-07);
    float _868 = floor(_862);
    float _870 = floor(_864);
    float _872 = _860 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _874 = exp2(_872);
    float _876 = -_868;
    float _878 = _862 + _876;
    float _880 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _882 = _878 + _880;
    float _884 = -_870;
    float _886 = _864 + _884;
    float _888 = -_882;
    float _890 = _888 + 1.0;
    float _892 = 1.0 / _866;
    float _894 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _896 = _886 + _894;
    float _898 = -_896;
    float _900 = _898 + 1.0;
    float _902 = _882 * _896;
    float _904 = _896 * _890;
    float _906 = fma(_874, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _908 = precise::clamp(_906, 0.0, 1.0);
    float _910 = _882 * _900;
    float _912 = _890 * _900;
    float _914 = _892 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _916 = -_792;
    float _918 = fma(_916, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _920 = -_794;
    float _922 = fma(_920, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _924 = -_796;
    float _926 = fma(_924, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _928 = -_798;
    float _930 = fma(_928, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _932 = 1.0 / _918;
    float _934 = fma(_908, -2.0, 3.0);
    float _936 = _908 * _908;
    float _938 = _936 * _934;
    float _940 = 1.0 / _922;
    float _942 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _944 = 1.0 / _926;
    float _946 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _948 = -_153;
    float _950 = fma(_932, _946, _948);
    float _952 = _540 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _954 = precise::max(0.0, _942);
    float _956 = abs(_950);
    float _958 = _956 * _914;
    float _960 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].x, _952);
    float _962 = 1.0 / _930;
    float _964 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _966 = -_153;
    float _968 = fma(_940, _964, _966);
    float _970 = -_938;
    float _972 = _970 + 1.0;
    float _974 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].z, _960);
    float _976 = abs(_968);
    float _978 = _976 * _914;
    float _980 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _982 = -_153;
    float _984 = fma(_944, _980, _982);
    float _986 = fma(_972, (*spvDescriptorSet0.fp_c3)._m0[44].w, _938);
    float _988 = _540 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _990 = exp2(_958);
    float _992 = abs(_984);
    float _994 = _992 * _914;
    float _996 = _986 * _954;
    float _998 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1000 = -_153;
    float _1002 = fma(_962, _998, _1000);
    float _1004 = exp2(_978);
    float _1006 = abs(_1002);
    float _1008 = _1006 * _914;
    float _1010 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].x, _988);
    float _1012 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1010);
    float _1014 = exp2(_994);
    float _1016 = abs(_904);
    float _1018 = _1016 * _990;
    float _1020 = _1012 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1022 = exp2(_1008);
    float _1024 = abs(_902);
    float _1026 = _1024 * _1004;
    float _1028 = _974 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1030 = _1018 + _1026;
    float _1032 = trunc(_1020);
    int _1034 = int(_1032);
    float _1036 = abs(_910);
    float _1038 = _1036 * _1014;
    float _1040 = _1038 + _1030;
    float _1042 = trunc(_1028);
    int _1044 = int(_1042);
    float _1046 = abs(_912);
    float _1048 = _1046 * _1022;
    float _1050 = _1048 + _1040;
    float _1052 = -_1048;
    bool _1054 = _1040 != _1052;
    bool _1056 = isnan(_1040);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan(_1052);
    bool _1062 = _1058 || _1060;
    int _1064 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1066 = _1034 + _1064;
    int _1068 = _1066 + 1;
    float _1070 = 1.0 / _1050;
    bool _1072 = _1068 >= 0;
    int _1074 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1076 = _1044 + _1074;
    int _1078 = _1076 + 1;
    bool _1080 = _1068 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1082 = !_1072;
    bool _1084 = _1080 || _1082;
    bool _1086 = _153 >= (-8000.0);
    bool _1088 = isnan(_153);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(-8000.0);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    bool _1098 = _1078 < 0;
    bool _1100 = _1098 || _1084;
    float _1102 = _1096 * _996;
    bool _1104 = _1078 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1106 = _1104 || _1100;
    float _1108 = _1026 * _1070;
    float _1110 = _1018 * _1070;
    float _1112 = _1038 * _1070;
    float _1114 = _1062 ? _1108 : 0.25;
    float _1116 = _1062 ? _1110 : 0.25;
    float _1118 = _996;
    if (_1106)
    {
        _1118 = 1.0;
    }
    float _1120 = _1118;
    float _1122 = _1114 * _836;
    float _1124 = _1120;
    if (!_1106)
    {
        int _1126 = _1078 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1128 = _1126 + _1068;
        float _1130 = floor(_1028);
        int _1132 = _1128 << 2;
        int _1134 = _1128 >> 2;
        int _1136 = 12 & _1132;
        int _1138 = _1134 << 4;
        int _1140 = _1138 + _1136;
        float _1142 = floor(_1020);
        uint _1144 = uint(int(uint(_1140) >> uint(2)));
        uint _1146 = uint(int(uint(int(_1144)) >> uint(2)));
        int _1148 = int(_1144) & 3;
        float _1150 = (*spvDescriptorSet0.fp_c5)._m0[int(_1146)][_1148];
        float _1152 = -_1130;
        float _1154 = _1028 + _1152;
        float _1156 = -_1142;
        float _1158 = _1020 + _1156;
        float _1160 = rint(_1150);
        float _1162 = precise::max(_1160, 0.0);
        uint _1164 = uint(_1162);
        uint _1166 = clamp(_1164, 0u, 65535u);
        float3 _3055 = float3(_1158, _1154, float(int(_1166)));
        float3 _3057 = select(_3055, float3(0.0), isnan(_3055));
        float _1168 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3057.xy, uint(rint(_3057.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3057.xy, uint(rint(_3057.z)), level(0.0)).x;
        int _1170 = _1128 << 4;
        int _1172 = _1170 + 1648;
        int _1174 = _1140 + 8048;
        uint _1176 = uint(int(uint(_1174) >> uint(2)));
        uint _1178 = uint(int(uint(int(_1176)) >> uint(2)));
        int _1180 = int(_1176) & 3;
        float _1182 = (*spvDescriptorSet0.fp_c5)._m0[int(_1178)][_1180];
        uint _1184 = uint(int(uint(_1172) >> uint(2)));
        uint _1186 = uint(int(uint(int(_1184)) >> uint(2)));
        int _1188 = int(_1184) & 3;
        float _1190 = (*spvDescriptorSet0.fp_c5)._m0[int(_1186)][_1188];
        int _1192 = int(_1184) + 1;
        uint _1194 = uint(int(uint(_1192) >> uint(2)));
        int _1196 = _1192 & 3;
        float _1198 = (*spvDescriptorSet0.fp_c5)._m0[int(_1194)][_1196];
        int _1200 = _1172 + 8;
        uint _1202 = uint(int(uint(_1200) >> uint(2)));
        uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
        int _1206 = int(_1202) & 3;
        float _1208 = (*spvDescriptorSet0.fp_c5)._m0[int(_1204)][_1206];
        int _1210 = int(_1202) + 1;
        uint _1212 = uint(int(uint(_1210) >> uint(2)));
        int _1214 = _1210 & 3;
        float _1216 = (*spvDescriptorSet0.fp_c5)._m0[int(_1212)][_1214];
        float _1218 = _540 * _1198;
        float _1220 = 1.0 / _1182;
        float _1222 = fma(_536, _1190, _1218);
        float _1224 = _1182 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1226 = fma(_538, _1208, _1222);
        float _1228 = _1226 + _1216;
        float _1230 = precise::clamp(_1228, 0.0, 1.0);
        float _1232 = -_1230;
        float _1234 = _1232 + _1168;
        float _1236 = fma(_1220, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1234);
        float _1238 = _1224 * _1236;
        float _1240 = exp2(_1238);
        float _1242 = 0.0 + _1240;
        float _1244 = precise::clamp(_1242, 0.0, 1.0);
        _1124 = _1244;
    }
    float _1246 = _1124;
    float _1248 = _1102 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1250 = -_842;
    float _1252 = _1250 + 1.0;
    float _1254 = _1048 * _1070;
    float _1256 = -_153;
    float _1258 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1260 = _1256 + _1258;
    float _1262 = precise::min(_1246, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1264 = _1252 * _1248;
    float _1266 = precise::clamp(_1264, 0.0, 1.0);
    float _1268 = _1062 ? _1112 : 0.25;
    float _1270 = fma(_1116, _834, _1122);
    float _1272 = abs(_856);
    float _1274 = _1272 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1276 = -_1266;
    float _1278 = fma(_1276, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1280 = _1260 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = -_1262;
    float _1286 = _1284 + 1.0;
    float _1288 = _1062 ? _1254 : 0.25;
    float _1290 = fma(_1268, _838, _1270);
    float _1292 = -_1274;
    float _1294 = fma(_1096, _1292, 1.0);
    float _1296 = -_153;
    float _1298 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1300 = _1296 + _1298;
    float _1302 = fma(_1282, _1286, _1262);
    float _1304 = -_844;
    float _1306 = _1304 + 1.0;
    float _1308 = fma(_1288, _840, _1290);
    float _1310 = _1300 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1312 = precise::clamp(_1310, 0.0, 1.0);
    float _1314 = precise::min(_1294, 1.0);
    float _1316 = fma(_1312, _1306, _844);
    float _1318 = precise::min(_1314, _1278);
    float _1320 = precise::min(_850, 1.0);
    float _1322 = precise::min(_1308, 1.0);
    out.m_66.x = _1316;
    out.m_66.y = _1302;
    out.m_66.z = _1322;
    out.m_66.w = _1318;
    out.m_68.x = _1320;
    out.m_68.y = _852;
    out.m_68.z = _854;
    out.m_68.w = 1.0;
    return out;
}

